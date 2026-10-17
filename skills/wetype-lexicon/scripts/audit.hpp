#pragma once
#include <map>
#include <CommonCrypto/CommonHMAC.h>
static std::string secret;
static std::string tag(const std::string&data){unsigned char digest[32];CCHmac(kCCHmacAlgSHA256,secret.data(),secret.size(),data.data(),data.size(),digest);static const char*hex="0123456789abcdef";std::string out;for(auto b:digest){out+=hex[b>>4];out+=hex[b&15];}return out;}
static void appendPart(std::string&out,std::string_view value){uint64_t n=value.size();out.append((char*)&n,8);out.append(value.data(),value.size());}
static std::string recordKey(const std::string&pinyin,const std::string&word){std::string b="pair";appendPart(b,pinyin);appendPart(b,word);return tag(b);}
struct Generator{void*frame;~Generator(){}};
struct ExportRecord{std::string pinyin;unsigned char metadata[48];std::string word;};
static_assert(sizeof(ExportRecord)==96&&sizeof(Generator)==8);
using RecordMap=std::map<std::string,std::vector<std::string>>;
static RecordMap exportRecords(void*h,void*user){uintptr_t slide=(uintptr_t)dlsym(h,"wxime_initialize")-kInitialize;auto g=entry<Generator(*)(void*)>(slide,0x1017b2534)(user);RecordMap records;if(!g.frame)throw std::runtime_error("export generator absent");auto*f=(void**)g.frame;auto destroy=(void(*)(void*))f[1];size_t n=0;try{for(;;){if(!f[0])break;((void(*)(void*))f[0])(g.frame);if(f[3])std::rethrow_exception(*(std::exception_ptr*)((char*)g.frame+24));if(!f[0])break;auto*r=(ExportRecord*)f[2];if(!r||r->word.size()>8192||r->pinyin.size()>8192||++n>5000000)throw std::runtime_error("export bounds violated");records[recordKey(r->pinyin,r->word)].push_back(tag(std::string("meta")+std::string((char*)r->metadata,48)));}}catch(...){destroy(g.frame);g.frame=nullptr;throw;}destroy(g.frame);g.frame=nullptr;for(auto&[k,v]:records)std::sort(v.begin(),v.end());return records;}
static std::string aggregate(const RecordMap&m){std::string s="records";for(auto&[k,vs]:m){appendPart(s,k);for(auto&v:vs)appendPart(s,v);}return tag(s);}
static size_t recordCount(const RecordMap&m){size_t n=0;for(auto&[k,v]:m)n+=v.size();return n;}
static size_t mapChanges(const RecordMap&a,const RecordMap&b){size_t n=0;for(auto&[k,v]:a){auto it=b.find(k);if(it==b.end()||it->second!=v)++n;}return n;}
static void loadSecret(const fs::path&job){auto path=job/"key.bin";checkedNode(path);if(fs::file_size(path)!=32)throw std::runtime_error("audit key must contain 32 bytes");std::ifstream f(path,std::ios::binary);secret.resize(32);if(!f.read(secret.data(),32)||f.peek()!=EOF)throw std::runtime_error("audit key read failed");}
