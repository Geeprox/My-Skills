// Version-pinned ABI adapter for WeType 3.0.0 (670), Apple Silicon.
// No WeType code is loaded until the process sandbox and denial probes pass.
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <fcntl.h>
#include <filesystem>
#include <fstream>
#include <functional>
#include <memory>
#include <mutex>
#include <netinet/in.h>
#include <pwd.h>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <sys/socket.h>
#include <sys/stat.h>
#include <set>
#include <limits>
#include <thread>
#include <unistd.h>
#include <vector>
#include "abi_profile.hpp"
extern "C" int sandbox_init(const char*,uint64_t,char**);
extern "C" void sandbox_free_error(char*);
namespace fs=std::filesystem;
template<class T>T entry(uintptr_t slide,uintptr_t address){return reinterpret_cast<T>(slide+address);}
template<class T>void put(unsigned char*p,size_t off,T v){memcpy(p+off,&v,sizeof(v));}
static std::string quote(const std::string&s){std::string o="\"";for(unsigned char c:s){if(c=='"'||c=='\\'){o+='\\';o+=c;}else if(c<32){char x[7];snprintf(x,sizeof(x),"\\u%04x",c);o+=x;}else o+=c;}return o+'"';}
static bool beneath(const fs::path&p,const fs::path&root){auto r=p.lexically_relative(root);return !r.empty()&&!r.is_absolute()&&*r.begin()!="..";}
// Reject links before canonicalization and before native loading. These guards supplement,
// rather than replace, the coordinator's locked-root/marker checks.
static void checkedNode(const fs::path&p){struct stat st{};if(lstat(p.c_str(),&st))throw std::runtime_error("managed path unavailable");if(S_ISLNK(st.st_mode)||(!S_ISREG(st.st_mode)&&!S_ISDIR(st.st_mode))||(S_ISREG(st.st_mode)&&st.st_nlink!=1))throw std::runtime_error("managed path link or type rejected");}
static fs::path checkedPath(const char*raw){if(!raw||!*raw||strlen(raw)>4096)throw std::runtime_error("invalid managed path");fs::path p=fs::absolute(raw).lexically_normal();fs::path prefix;for(const auto&part:p){prefix/=part;if(part=="Library"||part=="Applications")throw std::runtime_error("protected managed path");checkedNode(prefix);}if(fs::canonical(p)!=p)throw std::runtime_error("noncanonical managed path");return p;}
static void checkedTree(const fs::path&p){checkedNode(p);if(!fs::is_directory(p))throw std::runtime_error("managed directory required");size_t n=0;for(auto&it:fs::recursive_directory_iterator(p)){if(++n>5000000)throw std::runtime_error("managed tree bounds exceeded");checkedNode(it.path());}}
static void checkedInputs(const fs::path&root,const fs::path&job){if(job.parent_path()!=root/"jobs")throw std::runtime_error("job must be a direct managed child");checkedNode(root/"LAB.json");checkedTree(root/"cache");checkedTree(job);}
static bool validUtf8Word(const std::string&s){if(s.empty()||s.size()>512)return false;size_t i=0;while(i<s.size()){unsigned char a=s[i++];if(a<0x80){if(a<0x20||a==0x7f)return false;continue;}uint32_t cp;size_t n;if(a>=0xc2&&a<=0xdf){cp=a&31;n=1;}else if(a>=0xe0&&a<=0xef){cp=a&15;n=2;}else if(a>=0xf0&&a<=0xf4){cp=a&7;n=3;}else return false;if(i+n>s.size())return false;for(size_t j=0;j<n;++j){unsigned char b=s[i++];if((b&0xc0)!=0x80)return false;cp=(cp<<6)|(b&63);}if((n==1&&cp<0x80)||(n==2&&cp<0x800)||(n==3&&cp<0x10000)||cp>0x10ffff||(cp>=0xd800&&cp<=0xdfff))return false;}return true;}
static bool validPinyin(const std::string&s){if(s.empty()||s.size()>256||s.front()==','||s.back()==',')return false;bool comma=false;for(unsigned char c:s){if(c==','){if(comma)return false;comma=true;}else{if(c<'a'||c>'z')return false;comma=false;}}return true;}
static void deniedOpen(const std::string&p,int flags){errno=0;int fd=open(p.c_str(),flags);int e=errno;if(fd>=0){close(fd);throw std::runtime_error("sandbox denial probe unexpectedly allowed");}if(e!=EPERM&&e!=EACCES)throw std::runtime_error("sandbox denial probe was not denied by policy");}
static void isolate(const fs::path&root,const fs::path&job){
 auto*pw=getpwuid(getuid());if(!pw)throw std::runtime_error("user home unavailable");
 std::string formal=std::string(pw->pw_dir)+"/Library/Application Support/WeType/userDict/v5/db_path.conf";
 if(!beneath(job,root/"jobs")||!fs::exists(root/"LAB.json"))throw std::runtime_error("not a managed lab job");
 // Profiles are constructed here, never accepted from the caller or a file.
 std::string read="(require-any (subpath \"/System\") (subpath \"/private/preboot/Cryptexes\") (subpath \"/usr/lib\") (subpath \"/usr/share\") (subpath \"/Library/Apple\") (subpath \"/Library/Input Methods/WeType.app\") (subpath "+quote(root.string())+") (literal \"/dev/null\") (literal \"/dev/zero\") (literal \"/dev/random\") (literal \"/dev/urandom\"))";
 std::string profile="(version 1)(allow default)(deny network*)(deny mach-lookup)(deny mach-register)(deny process-fork)(deny process-exec)(deny file-read-data (require-not "+read+"))(deny file-write* (require-not (require-any (subpath "+quote(job.string())+") (literal \"/dev/null\"))))";
 char*err=nullptr;if(sandbox_init(profile.c_str(),0,&err)){std::string message=err?err:"sandbox error";if(err)sandbox_free_error(err);throw std::runtime_error(message);}
 deniedOpen(formal,O_RDONLY);deniedOpen(formal,O_WRONLY);deniedOpen((root/"outside-job-probe").string(),O_WRONLY|O_CREAT);
 int sock=socket(AF_INET,SOCK_STREAM,0);int error=errno;if(sock>=0){sockaddr_in a{};a.sin_family=AF_INET;a.sin_port=htons(9);a.sin_addr.s_addr=htonl(INADDR_LOOPBACK);errno=0;int rc=connect(sock,reinterpret_cast<sockaddr*>(&a),sizeof(a));error=errno;close(sock);if(rc==0)throw std::runtime_error("network unexpectedly allowed");}if(error!=EPERM&&error!=EACCES)throw std::runtime_error("network policy denial unproven");
}
struct DictItem{void*fd;const char*path;uint32_t type,version;};
#include "dictionary_items.inc"
struct DictConfig{const DictItem*items;uint32_t count,pad;const char*path;uint8_t tail[8]{};};
// +0x10 pendingPattern is new in 3.0.0; normal selection explicitly initializes it to zero.
struct AddOption{uint8_t kind=0,pad[3]{};float minimumHot=1;uint8_t flag=0,pad2=0;uint16_t category=0;uint8_t extraC=1,pad3[3]{};uint32_t pendingPattern=0;};
static_assert(sizeof(DictItem)==24&&sizeof(DictConfig)==32&&sizeof(AddOption)==20&&offsetof(AddOption,pendingPattern)==0x10&&sizeof(std::function<void()>)==32&&sizeof(std::string)==24);
struct Row{std::string pinyin,word;bool existed=false,added=false;uint32_t count=0;size_t rank=0,candidates=0;bool truncated=false;};
struct Capture{explicit Capture(void*handle):h(handle){}void*h;std::mutex mutex;std::vector<std::string>words;bool truncated=false,failed=false;};
struct CandidateHandles{void(*close)(uint64_t);uint64_t first,second;~CandidateHandles()noexcept{try{if(first)close(first);if(second&&second!=first)close(second);}catch(...){}}};
static void listener(uint64_t,uint32_t*types,void**data,uint32_t count,void*ctx){
 auto*c=static_cast<Capture*>(ctx);try{if(count>128||(count&&(!types||!data)))throw std::runtime_error("candidate event bounds");
 auto next=reinterpret_cast<bool(*)(uint64_t,void*)>(dlsym(c->h,"wxime_candidate_next"));auto close=reinterpret_cast<void(*)(uint64_t)>(dlsym(c->h,"wxime_delete_candidate_iterator"));if(!next||!close)throw std::runtime_error("candidate exports absent");
 for(uint32_t i=0;i<count;++i){if(types[i]!=0||!data[i])continue;auto*p=static_cast<unsigned char*>(data[i]);uint64_t it=0,it2=0;memcpy(&it,p,8);memcpy(&it2,p+16,8);CandidateHandles handles{close,it,it2};std::vector<std::string>words;bool truncated=false;
  if(it)for(size_t j=0;j<2049;++j){alignas(8)unsigned char candidate[256]{};if(!next(it,candidate))break;if(j==2048){truncated=true;break;}const char*text=nullptr;uint32_t length=0;memcpy(&text,candidate,8);memcpy(&length,candidate+8,4);if(length>8192||(length&&!text))throw std::runtime_error("candidate text bounds");if(text&&length)words.emplace_back(text,length);}
  {std::lock_guard<std::mutex>g(c->mutex);c->words=std::move(words);c->truncated=truncated;}
 }
 }catch(...){std::lock_guard<std::mutex>g(c->mutex);c->failed=true;}
}
static void logger(uint32_t,const char*){} // No input content in native diagnostic logs.
static std::shared_ptr<void> learningDict(void*h){
 uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;
 auto*mgr=static_cast<unsigned char*>(entry<void*(*)()>(slide,kResourceInstance)());if(!mgr)throw std::runtime_error("ResourceMgr absent");
 auto*impl=*reinterpret_cast<unsigned char**>(mgr+0x20);if(!impl)throw std::runtime_error("ResourceMgr implementation absent");
 auto*resources=*reinterpret_cast<unsigned char**>(impl+0x28);if(!resources)throw std::runtime_error("Resources absent");
 void*manager=*reinterpret_cast<void**>(resources);if(!manager||*static_cast<uintptr_t*>(manager)!=slide+kDictManagerVptr)throw std::runtime_error("DictManager ABI mismatch");
 auto user=entry<std::shared_ptr<void>(*)(void*,uint16_t)>(slide,kGetByKind)(manager,128);
 if(!user||*static_cast<uintptr_t*>(user.get())!=slide+kUserDictVptr||*reinterpret_cast<uint16_t*>(static_cast<unsigned char*>(user.get())+0x20)!=128)throw std::runtime_error("UserDictV2 kind128 ABI mismatch");return user;
}
#include "audit.hpp"
// Only this private, single-entry worker owns these native objects. Global
// initialization stays normal, retaining the real KV codec. The recovered
// per-instance test_mode byte suppresses native collateral cleanup and waits
// for Add's own task; it is restored before lookup/export/finalize. This is a
// version-pinned internal policy adapter, not a public WeType bulk API.
static size_t policyCalls=0,policyRestores=0;
class ScopedAddPolicy{
 std::shared_ptr<void> keeper;unsigned char*flag=nullptr;
public:
 ScopedAddPolicy(void*h,const std::shared_ptr<void>&userOwner){
  void*user=userOwner.get();
  uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;
  if(!user||*static_cast<uintptr_t*>(user)!=slide+kUserDictVptr||*reinterpret_cast<uint16_t*>(static_cast<unsigned char*>(user)+0x20)!=128)throw std::runtime_error("Add policy dictionary identity rejected");
  auto*impl=*reinterpret_cast<unsigned char**>(static_cast<unsigned char*>(user)+0x28);
  if(!impl||(reinterpret_cast<uintptr_t>(impl)&7)||*reinterpret_cast<void**>(impl+0x208)!=user)throw std::runtime_error("Add policy implementation owner rejected");
  keeper=learningDict(h);if(keeper.get()!=user||keeper.owner_before(userOwner)||userOwner.owner_before(keeper))throw std::runtime_error("Add policy shared ownership changed");
  auto*strategy=*reinterpret_cast<void**>(impl+0x178);
  auto*strategyControl=*reinterpret_cast<void**>(impl+0x180);
  if(!strategy||!strategyControl||*static_cast<uintptr_t*>(strategy)!=slide+kCleanMakerVptr)throw std::runtime_error("Add policy cleaner identity rejected");
  if(*reinterpret_cast<void**>(impl+0xa0)!=nullptr||impl[0x170]!=0)throw std::runtime_error("Add policy requires normal initialization and clock");
  flag=impl+0x170;*flag=1;++policyCalls;
 }
 ScopedAddPolicy(const ScopedAddPolicy&)=delete;
 ScopedAddPolicy&operator=(const ScopedAddPolicy&)=delete;
 void restore(){if(flag){if(*flag!=1)throw std::runtime_error("Add policy changed during native task");*flag=0;if(*flag!=0)throw std::runtime_error("Add policy restoration failed");flag=nullptr;++policyRestores;}}
 ~ScopedAddPolicy()noexcept{if(flag){*flag=0;++policyRestores;}}
};

static int run(const fs::path&root,const fs::path&job,const std::string&mode,int failAfter){
 checkedInputs(root,job);isolate(root,job);loadSecret(job);alarm(1800);
 if(fs::file_size(job/"request.tsv")>500*1025)throw std::runtime_error("request bounds exceeded");std::ifstream request(job/"request.tsv");if(!request)throw std::runtime_error("request unavailable");std::vector<Row>rows;std::string line;std::set<std::pair<std::string,std::string>>unique;
 while(std::getline(request,line)){auto tab=line.find('\t');if(tab==std::string::npos||line.find('\t',tab+1)!=std::string::npos||line.size()>1024)throw std::runtime_error("invalid request row");Row r{line.substr(0,tab),line.substr(tab+1)};if(!validPinyin(r.pinyin)||!validUtf8Word(r.word)||!unique.emplace(r.pinyin,r.word).second)throw std::runtime_error("invalid or duplicate request pair");rows.push_back(std::move(r));if(rows.size()>500)throw std::runtime_error("batch limit exceeded");}
 if(request.bad()||rows.empty()||failAfter<0||failAfter>500||(failAfter&&mode!="import"))throw std::runtime_error("invalid batch bounds or fault mode");
 void*h=dlopen((root/"cache/WeType-lab.bundle").c_str(),RTLD_LAZY|RTLD_LOCAL);if(!h)throw std::runtime_error("native bundle loading failed");
 for(auto name:{"wxime_initialize","wxime_config_dict","wxime_create_session","wxime_add_session_listener","wxime_process_input","wxime_reset_session","wxime_candidate_next","wxime_delete_candidate_iterator","wxime_destroy_session","wxime_finalize"})if(!dlsym(h,name))throw std::runtime_error("missing native export");
 std::string engine=(job/"data/engine").string(),userPath=(job/"data/userDict").string();fs::create_directories(engine);fs::create_directories(userPath);
 alignas(8)unsigned char config[0xd0]{};config[8]=1;put(config,0,&logger);put(config,0x18,engine.c_str());put<int32_t>(config,0x38,-5);
 const char*uid="42424242",*version="3.0.0-lab",*model="isolated",*os="27.0";put(config,0x40,uid);put<uint32_t>(config,0x48,strlen(uid));put<uint32_t>(config,0x4c,2);put<uint32_t>(config,0x50,5);put(config,0x58,version);put<uint32_t>(config,0x60,strlen(version));put(config,0x68,model);put<uint32_t>(config,0x70,strlen(model));put(config,0x78,os);put<uint32_t>(config,0x80,strlen(os));put<uint32_t>(config,0xc0,3);
 reinterpret_cast<void(*)(void*)>(dlsym(h,"wxime_initialize"))(config);
 DictConfig dictionaries{packagedDicts,(uint32_t)(sizeof(packagedDicts)/sizeof(DictItem)),0,userPath.c_str()};if(!reinterpret_cast<bool(*)(void*)>(dlsym(h,"wxime_config_dict"))(&dictionaries))throw std::runtime_error("native dictionary configuration failed");
 alignas(8)unsigned char sessionConfig[0x138]{};sessionConfig[1]=1;uint64_t sid=reinterpret_cast<uint64_t(*)(void*)>(dlsym(h,"wxime_create_session"))(sessionConfig);if(!sid)throw std::runtime_error("native session creation failed");
 Capture capture{h};reinterpret_cast<void(*)(uint64_t,decltype(&listener),void*)>(dlsym(h,"wxime_add_session_listener"))(sid,&listener,&capture);
 uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;size_t added=0;RecordMap beforeAudit,afterAudit;
 {auto user=learningDict(h);beforeAudit=exportRecords(h,user.get());using Pair=uint64_t(*)(void*,std::string_view,std::string_view);using Add=std::function<void()>(*)(void*,std::string_view,std::string_view,const AddOption&);AddOption option;
  for(auto&r:rows){uint64_t before=entry<Pair>(slide,kLookUpPair)(user.get(),r.pinyin,r.word);r.existed=(before>>32)&1;r.count=r.existed?(uint32_t)before:0;
   if(mode=="import"&&!r.existed){{ScopedAddPolicy policy(h,user);auto wait=entry<Add>(slide,kAdd)(user.get(),r.pinyin,r.word,option);if(wait)wait();policy.restore();}r.added=true;++added;uint64_t after=entry<Pair>(slide,kLookUpPair)(user.get(),r.pinyin,r.word);r.count=(uint32_t)after;if(!((after>>32)&1))throw std::runtime_error("native Add did not persist pair");if(failAfter>0&&added>=(size_t)failAfter)throw std::runtime_error("injected failure after native Add");}
   if(mode=="verify"&&!r.existed)throw std::runtime_error("pair missing after process restart");
  }
  afterAudit=exportRecords(h,user.get());std::set<std::string>expected;
  for(auto&r:rows){auto k=recordKey(r.pinyin,r.word);auto bi=beforeAudit.find(k),ai=afterAudit.find(k);if(r.existed&&(bi==beforeAudit.end()||ai==afterAudit.end()||bi->second!=ai->second))throw std::runtime_error("existing pair metadata changed");if(r.added){if(bi!=beforeAudit.end()||ai==afterAudit.end()||ai->second.size()!=1||r.count!=1)throw std::runtime_error("new pair must have exactly one record");expected.insert(k);}else if(!r.existed&&bi!=beforeAudit.end())throw std::runtime_error("pair lookup and export disagree");}
  if(mapChanges(beforeAudit,afterAudit)||afterAudit.size()!=beforeAudit.size()+expected.size()||recordCount(afterAudit)!=recordCount(beforeAudit)+expected.size())throw std::runtime_error("exact Add-only record audit failed");
  for(auto&[k,v]:afterAudit)if(!beforeAudit.count(k)&&!expected.count(k))throw std::runtime_error("unexpected exported pair");
  if(mode!="import"&&beforeAudit!=afterAudit)throw std::runtime_error("read-only operation changed records");
 }
 if(mode=="verify"||mode=="candidates")for(auto&r:rows){auto reset=reinterpret_cast<void(*)(uint64_t)>(dlsym(h,"wxime_reset_session"));auto input=reinterpret_cast<void(*)(uint64_t,const char*,uint32_t,void*,uint32_t)>(dlsym(h,"wxime_process_input"));reset(sid);{std::lock_guard<std::mutex>g(capture.mutex);capture.words.clear();capture.truncated=false;if(capture.failed)throw std::runtime_error("candidate callback failed");}
  std::string keys=r.pinyin;keys.erase(std::remove(keys.begin(),keys.end(),','),keys.end());unsigned char extra[16]{};for(char key:keys)input(sid,&key,1,extra,16);std::this_thread::sleep_for(std::chrono::milliseconds(150));
  {std::lock_guard<std::mutex>g(capture.mutex);if(capture.failed)throw std::runtime_error("candidate callback failed");auto at=std::find(capture.words.begin(),capture.words.end(),r.word);r.rank=at==capture.words.end()?0:at-capture.words.begin()+1;r.candidates=capture.words.size();r.truncated=capture.truncated;}
  if(mode=="verify"&&!r.rank)throw std::runtime_error("pinyin recall verification failed (candidate enumeration limit 2048)");
 }
 if(mode=="verify"){auto user=learningDict(h);auto recalled=exportRecords(h,user.get());if(recalled!=afterAudit)throw std::runtime_error("recall changed record metadata");}
 reinterpret_cast<void(*)(uint64_t)>(dlsym(h,"wxime_destroy_session"))(sid);reinterpret_cast<void(*)()>(dlsym(h,"wxime_finalize"))();
 if(policyCalls!=added||policyRestores!=policyCalls)throw std::runtime_error("Add policy call/restore accounting failed");
 std::ostringstream out;out<<"{\"schema\":1,\"abi\":"<<quote(kAbi)<<",\"add_option_bytes\":"<<sizeof(AddOption)<<",\"worker_policy\":{\"global_test_mode\":false,\"scoped_add_calls\":"<<policyCalls<<",\"restored_calls\":"<<policyRestores<<"},\"record_audit\":{\"before_count\":"<<recordCount(beforeAudit)<<",\"after_count\":"<<recordCount(afterAudit)<<",\"before_hash\":"<<quote(aggregate(beforeAudit))<<",\"after_hash\":"<<quote(aggregate(afterAudit))<<",\"existing_records_changed\":"<<mapChanges(beforeAudit,afterAudit)<<",\"added_pairs\":"<<added<<",\"removed_pairs\":0,\"unexpected_pairs\":0,\"exact_add_only\":true},\"pid\":"<<getpid()<<",\"mode\":"<<quote(mode)<<",\"sandbox\":{\"applied\":true,\"formal_read_denied\":true,\"formal_write_denied\":true,\"outside_write_denied\":true,\"network_denied\":true},\"rows\":[";
 for(size_t i=0;i<rows.size();++i){auto&r=rows[i];if(i)out<<',';out<<"{\"pinyin\":"<<quote(r.pinyin)<<",\"word\":"<<quote(r.word)<<",\"existed\":"<<(r.existed?"true":"false")<<",\"added\":"<<(r.added?"true":"false")<<",\"count\":"<<r.count<<",\"rank\":"<<r.rank<<",\"candidates\":"<<r.candidates<<",\"truncated\":"<<(r.truncated?"true":"false");auto rk=recordKey(r.pinyin,r.word);auto bi=beforeAudit.find(rk),ai=afterAudit.find(rk);static const std::vector<std::string>empty;const auto&bv=bi==beforeAudit.end()?empty:bi->second;const auto&av=ai==afterAudit.end()?empty:ai->second;out<<",\"record_tag\":"<<quote(rk)<<",\"metadata_unchanged\":"<<(bv==av?"true":"false")<<",\"before_metadata_tags\":[";for(size_t j=0;j<bv.size();++j){if(j)out<<',';out<<quote(bv[j]);}out<<"],\"after_metadata_tags\":[";for(size_t j=0;j<av.size();++j){if(j)out<<',';out<<quote(av[j]);}out<<"]}";}out<<"]}";
 printf("\nWETYPE_RESULT=%s\n",out.str().c_str());fflush(nullptr);return 0;
}
int main(int argc,char**argv){try{if(argc!=4&&argc!=5)throw std::runtime_error("invalid argument count");std::string mode=argv[3];if(mode!="inspect"&&mode!="import"&&mode!="verify"&&mode!="candidates")throw std::runtime_error("invalid mode");int fault=0;if(argc==5){std::string v=argv[4];if(v.empty()||v.size()>3||v.find_first_not_of("0123456789")!=std::string::npos)throw std::runtime_error("invalid fault bound");fault=std::stoi(v);if(fault<1||fault>500||mode!="import")throw std::runtime_error("invalid fault mode");}return run(checkedPath(argv[1]),checkedPath(argv[2]),mode,fault);}catch(const std::exception&){fprintf(stderr,"worker failed: request, audit or native operation rejected\n");fflush(nullptr);_exit(43);}catch(...){fprintf(stderr,"worker failed: native exception\n");fflush(nullptr);_exit(44);}}
