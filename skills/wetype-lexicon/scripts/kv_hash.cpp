// Privacy-preserving logical LevelDB audit. No raw key/value leaves this process.
#define main originalWorkerMain
#include "native_worker.cpp"
#undef main
struct NativeOwner{void*pointer;~NativeOwner(){}};
int main(int argc,char**argv){try{
 if(argc!=3)throw std::runtime_error("invalid argument count");
 auto root=checkedPath(argv[1]),job=checkedPath(argv[2]);checkedInputs(root,job);isolate(root,job);loadSecret(job);alarm(120);
 void*h=dlopen((root/"cache/WeType-lab.bundle").c_str(),RTLD_LAZY|RTLD_LOCAL);if(!h||!dlsym(h,"wxime_initialize"))throw std::runtime_error("native bundle identity unavailable");
 uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;
 const auto conf=job/"data/userDict/v5/db_path.conf";if(fs::file_size(conf)>128)throw std::runtime_error("invalid generation bounds");
 std::ifstream f(conf);std::string generation,tail;f>>generation;if(generation.empty()||generation.size()>64||generation.find_first_not_of("0123456789")!=std::string::npos||(f>>tail))throw std::runtime_error("invalid generation");
 auto dbPath=job/"data/userDict/v5"/generation;checkedTree(dbPath);std::string db=dbPath.string();
 std::set<std::string>wanted;{const auto path=job/"kv-wanted-tags.txt";if(fs::exists(path)){if(fs::file_size(path)>200000)throw std::runtime_error("requested tags bounds");std::ifstream w(path);std::string x;while(w>>x){if(x.size()!=64||x.find_first_not_of("0123456789abcdef")!=std::string::npos||!wanted.insert(x).second||wanted.size()>3000)throw std::runtime_error("invalid requested tags");}if(w.bad())throw std::runtime_error("requested tags read failed");}}
 void*kv=::operator new(16);entry<void(*)(void*,const std::string&,bool,size_t,bool)>(slide,0x101f768d8)(kv,db,false,131072,false);
 if(*(uintptr_t*)kv!=slide+0x10346cd10||!*((void**)kv+1))throw std::runtime_error("KV identity mismatch");
 auto owner=entry<NativeOwner(*)(void*)>(slide,0x101f77a90)(kv);void*it=owner.pointer;if(!it||*(uintptr_t*)it!=slide+0x10346ceb8)throw std::runtime_error("KV iterator identity mismatch");
 std::map<std::string,std::string>hashes,namespaces;std::map<std::string,uint64_t>classes;
 uint64_t actionMax=0,actionCount=0;std::string actionHeader;size_t n=0,bytes=0;
 while(entry<bool(*)(void*)>(slide,0x101f78900)(it)){
  auto k=entry<std::string_view(*)(void*)>(slide,0x101f788c0)(it),v=entry<std::string_view(*)(void*)>(slide,0x101f788d0)(it);
  if(k.size()>16777216||v.size()>16777216||++n>5000000||bytes>std::numeric_limits<size_t>::max()-k.size()-v.size())throw std::runtime_error("KV bounds exceeded");
  std::string keyData="key",valueData="entry";appendPart(keyData,k);appendPart(valueData,k);appendPart(valueData,v);auto key=tag(keyData);
  if(!hashes.emplace(key,tag(valueData)).second)throw std::runtime_error("duplicate KV key tag");
  if(wanted.count(key)){
   std::string ns="opaque";if(k.size()>2&&k[0]=='!'){size_t end=k.find('!',1);if(end!=std::string_view::npos&&end<40){bool ok=true;for(size_t j=1;j<end;++j)if(!((k[j]>='a'&&k[j]<='z')||(k[j]>='A'&&k[j]<='Z')||(k[j]>='0'&&k[j]<='9')||k[j]=='_'))ok=false;if(ok)ns=std::string(k.substr(0,end+1));}}namespaces[key]=ns;
  }
  if(k.size()==15&&memcmp(k.data(),"!dcact!",7)==0){uint64_t sequence=0;for(size_t j=7;j<15;++j)sequence=(sequence<<8)|(unsigned char)k[j];
   if(!sequence){if(v.size()!=24)throw std::runtime_error("action header size rejected");static const char*hex="0123456789abcdef";for(unsigned char b:v){actionHeader+=hex[b>>4];actionHeader+=hex[b&15];}}
   actionMax=std::max(actionMax,sequence);++actionCount;if(wanted.count(key))classes[key]=sequence;
  }
  bytes+=k.size()+v.size();entry<void(*)(void*)>(slide,0x101f788e0)(it);
 }
 if(*((uint8_t*)it+0x10))throw std::runtime_error("KV iteration incomplete");
 entry<void(*)(void*)>(slide,0x101f7884c)(it);owner.pointer=nullptr;entry<void(*)(void*)>(slide,0x101f77ca4)(kv);::operator delete(kv);
 std::ofstream out(job/"kv-hashes.json");out<<'{';bool first=true;for(auto&[k,v]:hashes){if(!first)out<<',';first=false;out<<quote(k)<<':'<<quote(v);}out<<'}';out.close();if(!out)throw std::runtime_error("audit write failed");
 std::ofstream info(job/"kv-info.json");info<<"{\"action_header_hex\":"<<quote(actionHeader)<<",\"action_max\":"<<actionMax<<",\"action_count\":"<<actionCount<<",\"action_sequences\":{";first=true;for(auto&[k,v]:classes){if(!first)info<<',';first=false;info<<quote(k)<<':'<<v;}info<<"},\"namespaces\":{";first=true;for(auto&[k,v]:namespaces){if(!first)info<<',';first=false;info<<quote(k)<<':'<<quote(v);}info<<"}}";info.close();if(!info)throw std::runtime_error("audit write failed");
 printf("KV_AUDIT_COMPLETE entries=%zu logical_bytes=%zu\n",n,bytes);fflush(nullptr);return 0;
 }catch(...){fprintf(stderr,"kv audit failed: request, audit or native operation rejected\n");fflush(nullptr);_exit(43);}}
