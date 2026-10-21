// Metadata only; executes against managed copies under the existing deny-network sandbox.
#define main originalWorkerMain
#include "native_worker.cpp"
#undef main
struct ProbeOwner { void* pointer; ~ProbeOwner(){} };
static uint64_t le(std::string_view v,size_t p,size_t n=8){if(p>v.size()||n>v.size()-p)throw std::runtime_error("bounds");uint64_t x=0;for(size_t i=0;i<n;++i)x|=uint64_t((unsigned char)v[p+i])<<(8*i);return x;}
static std::string decode(std::string_view v){if(v.size()<8||le(v,v.size()-4,4)!=0xa55aa55a||le(v,v.size()-8,4)!=v.size()-8)throw std::runtime_error("envelope");std::string x(v.substr(0,v.size()-8));for(char& c:x)c=(unsigned char)c-6;return x;}
int main(int argc,char** argv){try{
 if(argc!=3)throw std::runtime_error("args");auto root=checkedPath(argv[1]),job=checkedPath(argv[2]);checkedInputs(root,job);isolate(root,job);loadSecret(job);alarm(120);
 void*h=dlopen((root/"cache/WeType-lab.bundle").c_str(),RTLD_LAZY|RTLD_LOCAL);if(!h||!dlsym(h,"wxime_initialize"))throw std::runtime_error("bundle");uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;
 std::ifstream f(job/"data/userDict/v5/db_path.conf");std::string gen,tail;f>>gen;if(gen.empty()||gen.size()>32||gen.find_first_not_of("0123456789")!=std::string::npos||(f>>tail))throw std::runtime_error("generation");auto path=job/"data/userDict/v5"/gen;checkedTree(path);std::string db=path.string();
 void*kv=::operator new(16);entry<void(*)(void*,const std::string&,bool,size_t,bool)>(slide,0x101f768d8)(kv,db,false,131072,false);if(*(uintptr_t*)kv!=slide+0x10346cd10||!*((void**)kv+1))throw std::runtime_error("KV identity");auto owner=entry<ProbeOwner(*)(void*)>(slide,0x101f77a90)(kv);void*it=owner.pointer;if(!it||*(uintptr_t*)it!=slide+0x10346ceb8)throw std::runtime_error("iterator");
 bool header=false,head=false,group=false,format=true;uint64_t maximum=0,watermark=0,lastSuccess=0,lastAttempt=0,actionCount=0,stale=0,eligible=0;std::vector<uint64_t> sequences;std::string headPayload;size_t count=0;
 while(entry<bool(*)(void*)>(slide,0x101f78900)(it)){
  auto k=entry<std::string_view(*)(void*)>(slide,0x101f788c0)(it),v=entry<std::string_view(*)(void*)>(slide,0x101f788d0)(it);if(++count>5000000||k.size()>16777216||v.size()>16777216)throw std::runtime_error("bounds");
  if(k=="!dcsc!CurrentInfoV3"){if(head)throw std::runtime_error("head duplicate");head=true;headPayload=decode(v);}
  if(k.size()==15&&k.substr(0,7)=="!dcact!"){
   uint64_t seq=0;for(size_t i=7;i<15;++i)seq=(seq<<8)|(unsigned char)k[i];auto x=decode(v);
   if(!seq){if(header||x.size()!=16||le(x,0)!=0)throw std::runtime_error("header");header=true;maximum=le(x,8);}
   else{++actionCount;sequences.push_back(seq);size_t p=1;auto a=le(x,p,2);p+=2;if(a>x.size()-p)throw std::runtime_error("action length");p+=a;auto b=le(x,p,2);p+=2;if(b>x.size()-p)throw std::runtime_error("action length");p+=b;if(x.size()-p!=10||le(x,p)!=seq)format=false;}
  }
  entry<void(*)(void*)>(slide,0x101f788e0)(it);
 }
 if(*((uint8_t*)it+0x10))throw std::runtime_error("iteration");entry<void(*)(void*)>(slide,0x101f7884c)(it);owner.pointer=nullptr;entry<void(*)(void*)>(slide,0x101f77ca4)(kv);::operator delete(kv);
 if(head){std::string_view x=headPayload;if(x.size()<0xd0||le(x,0,4)!=1)throw std::runtime_error("head version");auto n=le(x,0xb8);if(n>(x.size()-0xd0)/64)throw std::runtime_error("member bounds");size_t p=0xc0+n*64;auto a=le(x,p);p+=8;if(a>x.size()-p)throw std::runtime_error("string bounds");p+=a;auto b=le(x,p);p+=8;if(b!=x.size()-p)throw std::runtime_error("head length");watermark=le(x,0x10);group=le(x,0x18)!=0;lastSuccess=le(x,0x28);lastAttempt=le(x,0x38);}
 uint64_t maxAction=0,minAction=0;for(auto s:sequences){maxAction=std::max(maxAction,s);if(!minAction||s<minAction)minAction=s;if(head){if(s<=watermark)++stale;else ++eligible;}}
 bool rangeValid=header&&maxAction<=maximum&&(!head||watermark<=maximum);uint64_t gap=head&&maximum>=watermark?maximum-watermark:0;
 std::ofstream seqout(job/"queue-sequences.json");seqout<<"[";for(size_t i=0;i<sequences.size();++i){if(i)seqout<<",";seqout<<sequences[i];}seqout<<"]";seqout.close();if(!seqout)throw std::runtime_error("sequence output");
 std::ofstream out(job/"sync-metadata.json");out<<"{\"schema\":1,\"queue_epoch\":"<<quote(gen+":"+tag(std::string("sync-group")+(head?headPayload.substr(0x18,8):std::string())))<<",\"action_header_present\":"<<header<<",\"last_assigned_sequence\":"<<maximum<<",\"action_count\":"<<actionCount<<",\"action_min\":"<<minAction<<",\"action_max\":"<<maxAction<<",\"action_wire_sequences_valid\":"<<format<<",\"sync_head_present\":"<<head<<",\"group_present\":"<<group<<",\"local_consumed_watermark\":"<<watermark<<",\"last_push_success_unix_ms\":"<<lastSuccess<<",\"last_push_attempt_unix_ms\":"<<lastAttempt<<",\"actions_at_or_below_watermark\":"<<stale<<",\"actions_above_watermark\":"<<eligible<<",\"assigned_minus_watermark\":"<<gap<<",\"over_1000_retention_window\":"<<(head&&gap>1000)<<",\"sequence_range_valid\":"<<rangeValid<<",\"network_denied\":true,\"formal_access_denied\":true}";out.close();if(!out)throw std::runtime_error("output");puts("SYNC_METADATA_COMPLETE");return 0;
 }catch(...){fputs("sync metadata rejected\n",stderr);_exit(43);}}
