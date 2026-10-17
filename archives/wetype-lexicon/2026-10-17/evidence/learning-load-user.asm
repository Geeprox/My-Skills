
work/v3/WeType.arm64:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000101c51f74 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)>:
101c51f74: a9ba6ffc    	stp	x28, x27, [sp, #-0x60]!
101c51f78: a90167fa    	stp	x26, x25, [sp, #0x10]
101c51f7c: a9025ff8    	stp	x24, x23, [sp, #0x20]
101c51f80: a90357f6    	stp	x22, x21, [sp, #0x30]
101c51f84: a9044ff4    	stp	x20, x19, [sp, #0x40]
101c51f88: a9057bfd    	stp	x29, x30, [sp, #0x50]
101c51f8c: 910143fd    	add	x29, sp, #0x50
101c51f90: d11003ff    	sub	sp, sp, #0x400
101c51f94: 9000b908    	adrp	x8, 0x103371000 <dyld_stub_binder+0x103371000>
101c51f98: f9444508    	ldr	x8, [x8, #0x888]
101c51f9c: f9400108    	ldr	x8, [x8]
101c51fa0: f81983a8    	stur	x8, [x29, #-0x68]
101c51fa4: f9400028    	ldr	x8, [x1]
101c51fa8: f9403109    	ldr	x9, [x8, #0x60]
101c51fac: b4017189    	cbz	x9, 0x101c54ddc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2e68>
101c51fb0: 910523f6    	add	x22, sp, #0x148
101c51fb4: f941e115    	ldr	x21, [x8, #0x3c0]
101c51fb8: b40172f5    	cbz	x21, 0x101c54e14 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2ea0>
101c51fbc: aa0103f3    	mov	x19, x1
101c51fc0: aa0003f4    	mov	x20, x0
101c51fc4: 940fb998    	bl	0x102040624 <loguru::current_verbosity_cutoff()>
101c51fc8: 3100081f    	cmn	w0, #0x2
101c51fcc: 5400006c    	b.gt	0x101c51fd8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x64>
101c51fd0: f90187ff    	str	xzr, [sp, #0x308]
101c51fd4: 14000009    	b	0x101c51ff8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x84>
101c51fd8: b0009b02    	adrp	x2, 0x102fb2000 <wxime::base::kWXIME_CONFIG+0x47dc0>
101c51fdc: 912c1442    	add	x2, x2, #0xb05 ; /Volumes/data/workspace/ime/wxime/engine/resources/resource_holder.cpp
101c51fe0: d0009b04    	adrp	x4, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c51fe4: 91383484    	add	x4, x4, #0xe0d ; Load user dict
101c51fe8: 910c03e0    	add	x0, sp, #0x300
101c51fec: 12800001    	mov	w1, #-0x1               ; =-1
101c51ff0: 5280b2e3    	mov	w3, #0x597              ; =1431
101c51ff4: 940fc12b    	bl	0x1020424a0 <loguru::LogScopeRAII::LogScopeRAII(int, char const*, unsigned int, char const*, ...)>
101c51ff8: f9400277    	ldr	x23, [x19]
101c51ffc: f9401ae8    	ldr	x8, [x23, #0x30]
101c52000: b40172c8    	cbz	x8, 0x101c54e58 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2ee4>
101c52004: 52800600    	mov	w0, #0x30               ; =48
101c52008: 943ff5cd    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5200c: aa0003f6    	mov	x22, x0
101c52010: a94622e9    	ldp	x9, x8, [x23, #0x60]
101c52014: b4000088    	cbz	x8, 0x101c52024 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xb0>
101c52018: 9100210a    	add	x10, x8, #0x8
101c5201c: 5280002b    	mov	w11, #0x1               ; =1
101c52020: f82b014a    	ldadd	x11, x10, [x10]
101c52024: f000c0dc    	adrp	x28, 0x10346d000 <wxime::kv::(anonymous namespace)::IsEnvironmentalMessage(std::__1::basic_string_view<char, std::__1::char_traits<char>>)::kEnvironmentalErrors+0xf0>
101c52028: 9101039c    	add	x28, x28, #0x40
101c5202c: 9100438a    	add	x10, x28, #0x10
101c52030: a90026ca    	stp	x10, x9, [x22]
101c52034: f9000ac8    	str	x8, [x22, #0x10]
101c52038: 528c8428    	mov	w8, #0x6421             ; =25633
101c5203c: 72ac2c68    	movk	w8, #0x6163, lsl #16
101c52040: b9001ac8    	str	w8, [x22, #0x18]
101c52044: 528c6c28    	mov	w8, #0x6361             ; =25441
101c52048: 72a42e88    	movk	w8, #0x2174, lsl #16
101c5204c: b801b2c8    	stur	w8, [x22, #0x1b]
101c52050: 39007edf    	strb	wzr, [x22, #0x1f]
101c52054: 528000e8    	mov	w8, #0x7                ; =7
101c52058: 3900bec8    	strb	w8, [x22, #0x2f]
101c5205c: f900f3f6    	str	x22, [sp, #0x1e0]
101c52060: 52800500    	mov	w0, #0x28               ; =40
101c52064: 943ff5b6    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52068: aa0003f7    	mov	x23, x0
101c5206c: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c52070: b000bfc8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c52074: 911be108    	add	x8, x8, #0x6f8
101c52078: f9000008    	str	x8, [x0]
101c5207c: 91006016    	add	x22, x0, #0x18
101c52080: 910783e1    	add	x1, sp, #0x1e0
101c52084: aa1603e0    	mov	x0, x22
101c52088: 9400487a    	bl	0x101c64270 <wxime::data::UserDictActionRecorder* std::__1::__construct_at[abi:ne180100]<wxime::data::UserDictActionRecorder, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>, wxime::data::UserDictActionRecorder*>(wxime::data::UserDictActionRecorder*, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>&&)>
101c5208c: f9400268    	ldr	x8, [x19]
101c52090: f9019916    	str	x22, [x8, #0x330]
101c52094: f9419d16    	ldr	x22, [x8, #0x338]
101c52098: f9019d17    	str	x23, [x8, #0x338]
101c5209c: b4000176    	cbz	x22, 0x101c520c8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x154>
101c520a0: 910022c8    	add	x8, x22, #0x8
101c520a4: 92800009    	mov	x9, #-0x1               ; =-1
101c520a8: f8e90108    	ldaddal	x9, x8, [x8]
101c520ac: b50000e8    	cbnz	x8, 0x101c520c8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x154>
101c520b0: f94002c8    	ldr	x8, [x22]
101c520b4: f9400908    	ldr	x8, [x8, #0x10]
101c520b8: aa1603e0    	mov	x0, x22
101c520bc: d63f0100    	blr	x8
101c520c0: aa1603e0    	mov	x0, x22
101c520c4: 943ff481    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c520c8: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c520cc: f900f3ff    	str	xzr, [sp, #0x1e0]
101c520d0: b4000080    	cbz	x0, 0x101c520e0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x16c>
101c520d4: f9400008    	ldr	x8, [x0]
101c520d8: f9400508    	ldr	x8, [x8, #0x8]
101c520dc: d63f0100    	blr	x8
101c520e0: f9400278    	ldr	x24, [x19]
101c520e4: 52800600    	mov	w0, #0x30               ; =48
101c520e8: 943ff595    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c520ec: aa0003f7    	mov	x23, x0
101c520f0: a9462309    	ldp	x9, x8, [x24, #0x60]
101c520f4: b40000a8    	cbz	x8, 0x101c52108 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x194>
101c520f8: 9100210a    	add	x10, x8, #0x8
101c520fc: 5280002b    	mov	w11, #0x1               ; =1
101c52100: f82b014a    	ldadd	x11, x10, [x10]
101c52104: f9400278    	ldr	x24, [x19]
101c52108: 9100438a    	add	x10, x28, #0x10
101c5210c: a90026ea    	stp	x10, x9, [x23]
101c52110: 52800429    	mov	w9, #0x21               ; =33
101c52114: 790042e9    	strh	w9, [x23, #0x20]
101c52118: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c5211c: f9471d29    	ldr	x9, [x9, #0xe38]
101c52120: a90126e8    	stp	x8, x9, [x23, #0x10]
101c52124: 52800128    	mov	w8, #0x9                ; =9
101c52128: 3900bee8    	strb	w8, [x23, #0x2f]
101c5212c: 52800400    	mov	w0, #0x20               ; =32
101c52130: 943ff583    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52134: aa0003f6    	mov	x22, x0
101c52138: f900b3f7    	str	x23, [sp, #0x160]
101c5213c: f9419b09    	ldr	x9, [x24, #0x330]
101c52140: f9419f08    	ldr	x8, [x24, #0x338]
101c52144: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c52148: b4000088    	cbz	x8, 0x101c52158 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e4>
101c5214c: 91002108    	add	x8, x8, #0x8
101c52150: 52800029    	mov	w9, #0x1                ; =1
101c52154: f8290108    	ldadd	x9, x8, [x8]
101c52158: 910583e1    	add	x1, sp, #0x160
101c5215c: 910783e2    	add	x2, sp, #0x1e0
101c52160: aa1603e0    	mov	x0, x22
101c52164: aa1503e3    	mov	x3, x21
101c52168: 528013a4    	mov	w4, #0x9d               ; =157
101c5216c: 97eda24e    	bl	0x1017baaa4 <wxime::data::dict::UserDictV2Patch::UserDictV2Patch(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, unsigned short)>
101c52170: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c52174: b4000177    	cbz	x23, 0x101c521a0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x22c>
101c52178: 910022e8    	add	x8, x23, #0x8
101c5217c: 92800009    	mov	x9, #-0x1               ; =-1
101c52180: f8e90108    	ldaddal	x9, x8, [x8]
101c52184: b50000e8    	cbnz	x8, 0x101c521a0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x22c>
101c52188: f94002e8    	ldr	x8, [x23]
101c5218c: f9400908    	ldr	x8, [x8, #0x10]
101c52190: aa1703e0    	mov	x0, x23
101c52194: d63f0100    	blr	x8
101c52198: aa1703e0    	mov	x0, x23
101c5219c: 943ff44b    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c521a0: f940b3e0    	ldr	x0, [sp, #0x160]
101c521a4: f900b3ff    	str	xzr, [sp, #0x160]
101c521a8: b4000080    	cbz	x0, 0x101c521b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x244>
101c521ac: f9400008    	ldr	x8, [x0]
101c521b0: f9400508    	ldr	x8, [x8, #0x8]
101c521b4: d63f0100    	blr	x8
101c521b8: f9400268    	ldr	x8, [x19]
101c521bc: f9400108    	ldr	x8, [x8]
101c521c0: 9100c100    	add	x0, x8, #0x30
101c521c4: f900a3f6    	str	x22, [sp, #0x140]
101c521c8: 910503e1    	add	x1, sp, #0x140
101c521cc: 529fffe2    	mov	w2, #0xffff             ; =65535
101c521d0: 97ffb55d    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c521d4: f940a3e0    	ldr	x0, [sp, #0x140]
101c521d8: f900a3ff    	str	xzr, [sp, #0x140]
101c521dc: b4000080    	cbz	x0, 0x101c521ec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x278>
101c521e0: f9400008    	ldr	x8, [x0]
101c521e4: f9400508    	ldr	x8, [x8, #0x8]
101c521e8: d63f0100    	blr	x8
101c521ec: f9400268    	ldr	x8, [x19]
101c521f0: f9400100    	ldr	x0, [x8]
101c521f4: f9400008    	ldr	x8, [x0]
101c521f8: f942e509    	ldr	x9, [x8, #0x5c8]
101c521fc: 9104c3e8    	add	x8, sp, #0x130
101c52200: 528013a1    	mov	w1, #0x9d               ; =157
101c52204: d63f0120    	blr	x9
101c52208: f9400279    	ldr	x25, [x19]
101c5220c: 52800600    	mov	w0, #0x30               ; =48
101c52210: 943ff54b    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52214: aa0003f8    	mov	x24, x0
101c52218: a9462329    	ldp	x9, x8, [x25, #0x60]
101c5221c: b40000a8    	cbz	x8, 0x101c52230 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2bc>
101c52220: 9100210a    	add	x10, x8, #0x8
101c52224: 5280002b    	mov	w11, #0x1               ; =1
101c52228: f82b014a    	ldadd	x11, x10, [x10]
101c5222c: f9400279    	ldr	x25, [x19]
101c52230: 9100438a    	add	x10, x28, #0x10
101c52234: a900270a    	stp	x10, x9, [x24]
101c52238: f9000b08    	str	x8, [x24, #0x10]
101c5223c: 528ec428    	mov	w8, #0x7621             ; =30241
101c52240: 72aea648    	movk	w8, #0x7532, lsl #16
101c52244: b9001b08    	str	w8, [x24, #0x18]
101c52248: 52800428    	mov	w8, #0x21               ; =33
101c5224c: 79003b08    	strh	w8, [x24, #0x1c]
101c52250: 528000a8    	mov	w8, #0x5                ; =5
101c52254: 3900bf08    	strb	w8, [x24, #0x2f]
101c52258: aa1903e0    	mov	x0, x25
101c5225c: f8430c17    	ldr	x23, [x0, #0x30]!
101c52260: 52801008    	mov	w8, #0x80               ; =128
101c52264: b9011fe8    	str	w8, [sp, #0x11c]
101c52268: 910483e8    	add	x8, sp, #0x120
101c5226c: 910473e1    	add	x1, sp, #0x11c
101c52270: 94004683    	bl	0x101c63c7c <std::__1::shared_ptr<wxime::data::dict::UserDictCleanStrategyMaker> std::__1::make_shared[abi:ne180100]<wxime::data::dict::UserDictCleanStrategyMaker, std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0, void>(std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0&&)>
101c52274: 52800600    	mov	w0, #0x30               ; =48
101c52278: 943ff531    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5227c: aa0003f6    	mov	x22, x0
101c52280: a91e7fff    	stp	xzr, xzr, [sp, #0x1e0]
101c52284: f900dff8    	str	x24, [sp, #0x1b8]
101c52288: f9419b29    	ldr	x9, [x25, #0x330]
101c5228c: f9419f28    	ldr	x8, [x25, #0x338]
101c52290: a91623e9    	stp	x9, x8, [sp, #0x160]
101c52294: b4000088    	cbz	x8, 0x101c522a4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x330>
101c52298: 91002108    	add	x8, x8, #0x8
101c5229c: 52800029    	mov	w9, #0x1                ; =1
101c522a0: f8290108    	ldadd	x9, x8, [x8]
101c522a4: 91048299    	add	x25, x20, #0x120
101c522a8: 3dc04be0    	ldr	q0, [sp, #0x120]
101c522ac: 3d8077e0    	str	q0, [sp, #0x1d0]
101c522b0: a9127fff    	stp	xzr, xzr, [sp, #0x120]
101c522b4: 3941d288    	ldrb	w8, [x20, #0x74]
101c522b8: a940268a    	ldp	x10, x9, [x20]
101c522bc: a91c27ea    	stp	x10, x9, [sp, #0x1c0]
101c522c0: b4000089    	cbz	x9, 0x101c522d0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x35c>
101c522c4: 91002129    	add	x9, x9, #0x8
101c522c8: 5280002a    	mov	w10, #0x1               ; =1
101c522cc: f82a0129    	ldadd	x10, x9, [x9]
101c522d0: a95327ea    	ldp	x10, x9, [sp, #0x130]
101c522d4: a91a27ea    	stp	x10, x9, [sp, #0x1a0]
101c522d8: b4000089    	cbz	x9, 0x101c522e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x374>
101c522dc: 91002129    	add	x9, x9, #0x8
101c522e0: 5280002a    	mov	w10, #0x1               ; =1
101c522e4: f82a0129    	ldadd	x10, x9, [x9]
101c522e8: 7100011f    	cmp	w8, #0x0
101c522ec: 1a9f07e8    	cset	w8, ne
101c522f0: 910683e9    	add	x9, sp, #0x1a0
101c522f4: a90127f9    	stp	x25, x9, [sp, #0x10]
101c522f8: 910703e9    	add	x9, sp, #0x1c0
101c522fc: f90007e9    	str	x9, [sp, #0x8]
101c52300: 390003e8    	strb	w8, [sp]
101c52304: 910783e1    	add	x1, sp, #0x1e0
101c52308: 9106e3e2    	add	x2, sp, #0x1b8
101c5230c: 910583e3    	add	x3, sp, #0x160
101c52310: 910743e7    	add	x7, sp, #0x1d0
101c52314: aa1603e0    	mov	x0, x22
101c52318: aa1503e4    	mov	x4, x21
101c5231c: aa1703e5    	mov	x5, x23
101c52320: 52801006    	mov	w6, #0x80               ; =128
101c52324: 97ed7318    	bl	0x1017aef84 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)>
101c52328: f940d7f7    	ldr	x23, [sp, #0x1a8]
101c5232c: b4000177    	cbz	x23, 0x101c52358 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x3e4>
101c52330: 910022e8    	add	x8, x23, #0x8
101c52334: 92800009    	mov	x9, #-0x1               ; =-1
101c52338: f8e90108    	ldaddal	x9, x8, [x8]
101c5233c: b50000e8    	cbnz	x8, 0x101c52358 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x3e4>
101c52340: f94002e8    	ldr	x8, [x23]
101c52344: f9400908    	ldr	x8, [x8, #0x10]
101c52348: aa1703e0    	mov	x0, x23
101c5234c: d63f0100    	blr	x8
101c52350: aa1703e0    	mov	x0, x23
101c52354: 943ff3dd    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52358: f940e7f7    	ldr	x23, [sp, #0x1c8]
101c5235c: b4000177    	cbz	x23, 0x101c52388 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x414>
101c52360: 910022e8    	add	x8, x23, #0x8
101c52364: 92800009    	mov	x9, #-0x1               ; =-1
101c52368: f8e90108    	ldaddal	x9, x8, [x8]
101c5236c: b50000e8    	cbnz	x8, 0x101c52388 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x414>
101c52370: f94002e8    	ldr	x8, [x23]
101c52374: f9400908    	ldr	x8, [x8, #0x10]
101c52378: aa1703e0    	mov	x0, x23
101c5237c: d63f0100    	blr	x8
101c52380: aa1703e0    	mov	x0, x23
101c52384: 943ff3d1    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52388: f940eff7    	ldr	x23, [sp, #0x1d8]
101c5238c: b4000177    	cbz	x23, 0x101c523b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x444>
101c52390: 910022e8    	add	x8, x23, #0x8
101c52394: 92800009    	mov	x9, #-0x1               ; =-1
101c52398: f8e90108    	ldaddal	x9, x8, [x8]
101c5239c: b50000e8    	cbnz	x8, 0x101c523b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x444>
101c523a0: f94002e8    	ldr	x8, [x23]
101c523a4: f9400908    	ldr	x8, [x8, #0x10]
101c523a8: aa1703e0    	mov	x0, x23
101c523ac: d63f0100    	blr	x8
101c523b0: aa1703e0    	mov	x0, x23
101c523b4: 943ff3c5    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c523b8: f940b7f7    	ldr	x23, [sp, #0x168]
101c523bc: b4000177    	cbz	x23, 0x101c523e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x474>
101c523c0: 910022e8    	add	x8, x23, #0x8
101c523c4: 92800009    	mov	x9, #-0x1               ; =-1
101c523c8: f8e90108    	ldaddal	x9, x8, [x8]
101c523cc: b50000e8    	cbnz	x8, 0x101c523e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x474>
101c523d0: f94002e8    	ldr	x8, [x23]
101c523d4: f9400908    	ldr	x8, [x8, #0x10]
101c523d8: aa1703e0    	mov	x0, x23
101c523dc: d63f0100    	blr	x8
101c523e0: aa1703e0    	mov	x0, x23
101c523e4: 943ff3b9    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c523e8: f940dfe0    	ldr	x0, [sp, #0x1b8]
101c523ec: f900dfff    	str	xzr, [sp, #0x1b8]
101c523f0: b4000080    	cbz	x0, 0x101c52400 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x48c>
101c523f4: f9400008    	ldr	x8, [x0]
101c523f8: f9400508    	ldr	x8, [x8, #0x8]
101c523fc: d63f0100    	blr	x8
101c52400: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c52404: b4000177    	cbz	x23, 0x101c52430 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x4bc>
101c52408: 910022e8    	add	x8, x23, #0x8
101c5240c: 92800009    	mov	x9, #-0x1               ; =-1
101c52410: f8e90108    	ldaddal	x9, x8, [x8]
101c52414: b50000e8    	cbnz	x8, 0x101c52430 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x4bc>
101c52418: f94002e8    	ldr	x8, [x23]
101c5241c: f9400908    	ldr	x8, [x8, #0x10]
101c52420: aa1703e0    	mov	x0, x23
101c52424: d63f0100    	blr	x8
101c52428: aa1703e0    	mov	x0, x23
101c5242c: 943ff3a7    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52430: f94097f7    	ldr	x23, [sp, #0x128]
101c52434: b4000177    	cbz	x23, 0x101c52460 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x4ec>
101c52438: 910022e8    	add	x8, x23, #0x8
101c5243c: 92800009    	mov	x9, #-0x1               ; =-1
101c52440: f8e90108    	ldaddal	x9, x8, [x8]
101c52444: b50000e8    	cbnz	x8, 0x101c52460 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x4ec>
101c52448: f94002e8    	ldr	x8, [x23]
101c5244c: f9400908    	ldr	x8, [x8, #0x10]
101c52450: aa1703e0    	mov	x0, x23
101c52454: d63f0100    	blr	x8
101c52458: aa1703e0    	mov	x0, x23
101c5245c: 943ff39b    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52460: f9400268    	ldr	x8, [x19]
101c52464: f9400108    	ldr	x8, [x8]
101c52468: 9100c100    	add	x0, x8, #0x30
101c5246c: f9008bf6    	str	x22, [sp, #0x110]
101c52470: 910443e1    	add	x1, sp, #0x110
101c52474: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52478: 97ffb4b3    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c5247c: f9408be0    	ldr	x0, [sp, #0x110]
101c52480: f9008bff    	str	xzr, [sp, #0x110]
101c52484: b4000080    	cbz	x0, 0x101c52494 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x520>
101c52488: f9400008    	ldr	x8, [x0]
101c5248c: f9400508    	ldr	x8, [x8, #0x8]
101c52490: d63f0100    	blr	x8
101c52494: f940027a    	ldr	x26, [x19]
101c52498: 52800600    	mov	w0, #0x30               ; =48
101c5249c: 943ff4a8    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c524a0: aa0003f8    	mov	x24, x0
101c524a4: a9462349    	ldp	x9, x8, [x26, #0x60]
101c524a8: b40000a8    	cbz	x8, 0x101c524bc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x548>
101c524ac: 9100210a    	add	x10, x8, #0x8
101c524b0: 5280002b    	mov	w11, #0x1               ; =1
101c524b4: f82b014a    	ldadd	x11, x10, [x10]
101c524b8: f940027a    	ldr	x26, [x19]
101c524bc: 9100438a    	add	x10, x28, #0x10
101c524c0: a900270a    	stp	x10, x9, [x24]
101c524c4: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c524c8: 91392129    	add	x9, x9, #0xe48 ; !potential_ud!
101c524cc: f940012a    	ldr	x10, [x9]
101c524d0: a9012b08    	stp	x8, x10, [x24, #0x10]
101c524d4: f8406128    	ldur	x8, [x9, #0x6]
101c524d8: f801e308    	stur	x8, [x24, #0x1e]
101c524dc: 39009b1f    	strb	wzr, [x24, #0x26]
101c524e0: 528001c8    	mov	w8, #0xe                ; =14
101c524e4: 3900bf08    	strb	w8, [x24, #0x2f]
101c524e8: aa1a03e0    	mov	x0, x26
101c524ec: f8430c17    	ldr	x23, [x0, #0x30]!
101c524f0: 52801288    	mov	w8, #0x94               ; =148
101c524f4: b9011fe8    	str	w8, [sp, #0x11c]
101c524f8: 910483e8    	add	x8, sp, #0x120
101c524fc: 910473e1    	add	x1, sp, #0x11c
101c52500: 940045df    	bl	0x101c63c7c <std::__1::shared_ptr<wxime::data::dict::UserDictCleanStrategyMaker> std::__1::make_shared[abi:ne180100]<wxime::data::dict::UserDictCleanStrategyMaker, std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0, void>(std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0&&)>
101c52504: 52800600    	mov	w0, #0x30               ; =48
101c52508: 943ff48d    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5250c: aa0003f6    	mov	x22, x0
101c52510: a91e7fff    	stp	xzr, xzr, [sp, #0x1e0]
101c52514: f900dff8    	str	x24, [sp, #0x1b8]
101c52518: f9419b49    	ldr	x9, [x26, #0x330]
101c5251c: f9419f48    	ldr	x8, [x26, #0x338]
101c52520: a91623e9    	stp	x9, x8, [sp, #0x160]
101c52524: b4000088    	cbz	x8, 0x101c52534 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x5c0>
101c52528: 91002108    	add	x8, x8, #0x8
101c5252c: 52800029    	mov	w9, #0x1                ; =1
101c52530: f8290108    	ldadd	x9, x8, [x8]
101c52534: 3dc04be0    	ldr	q0, [sp, #0x120]
101c52538: 3d8077e0    	str	q0, [sp, #0x1d0]
101c5253c: a9127fff    	stp	xzr, xzr, [sp, #0x120]
101c52540: 3941d288    	ldrb	w8, [x20, #0x74]
101c52544: a940268a    	ldp	x10, x9, [x20]
101c52548: a91c27ea    	stp	x10, x9, [sp, #0x1c0]
101c5254c: b4000089    	cbz	x9, 0x101c5255c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x5e8>
101c52550: 91002129    	add	x9, x9, #0x8
101c52554: 5280002a    	mov	w10, #0x1               ; =1
101c52558: f82a0129    	ldadd	x10, x9, [x9]
101c5255c: 7100011f    	cmp	w8, #0x0
101c52560: 1a9f07e8    	cset	w8, ne
101c52564: a91a7fff    	stp	xzr, xzr, [sp, #0x1a0]
101c52568: 910683e9    	add	x9, sp, #0x1a0
101c5256c: a90127f9    	stp	x25, x9, [sp, #0x10]
101c52570: 910703e9    	add	x9, sp, #0x1c0
101c52574: f90007e9    	str	x9, [sp, #0x8]
101c52578: 390003e8    	strb	w8, [sp]
101c5257c: 910783e1    	add	x1, sp, #0x1e0
101c52580: 9106e3e2    	add	x2, sp, #0x1b8
101c52584: 910583e3    	add	x3, sp, #0x160
101c52588: 910743e7    	add	x7, sp, #0x1d0
101c5258c: aa1603e0    	mov	x0, x22
101c52590: aa1503e4    	mov	x4, x21
101c52594: aa1703e5    	mov	x5, x23
101c52598: 52801286    	mov	w6, #0x94               ; =148
101c5259c: 97ed727a    	bl	0x1017aef84 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)>
101c525a0: f940d7f7    	ldr	x23, [sp, #0x1a8]
101c525a4: b4000177    	cbz	x23, 0x101c525d0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x65c>
101c525a8: 910022e8    	add	x8, x23, #0x8
101c525ac: 92800009    	mov	x9, #-0x1               ; =-1
101c525b0: f8e90108    	ldaddal	x9, x8, [x8]
101c525b4: b50000e8    	cbnz	x8, 0x101c525d0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x65c>
101c525b8: f94002e8    	ldr	x8, [x23]
101c525bc: f9400908    	ldr	x8, [x8, #0x10]
101c525c0: aa1703e0    	mov	x0, x23
101c525c4: d63f0100    	blr	x8
101c525c8: aa1703e0    	mov	x0, x23
101c525cc: 943ff33f    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c525d0: f940e7f7    	ldr	x23, [sp, #0x1c8]
101c525d4: b4000177    	cbz	x23, 0x101c52600 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x68c>
101c525d8: 910022e8    	add	x8, x23, #0x8
101c525dc: 92800009    	mov	x9, #-0x1               ; =-1
101c525e0: f8e90108    	ldaddal	x9, x8, [x8]
101c525e4: b50000e8    	cbnz	x8, 0x101c52600 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x68c>
101c525e8: f94002e8    	ldr	x8, [x23]
101c525ec: f9400908    	ldr	x8, [x8, #0x10]
101c525f0: aa1703e0    	mov	x0, x23
101c525f4: d63f0100    	blr	x8
101c525f8: aa1703e0    	mov	x0, x23
101c525fc: 943ff333    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52600: f940eff7    	ldr	x23, [sp, #0x1d8]
101c52604: b4000177    	cbz	x23, 0x101c52630 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x6bc>
101c52608: 910022e8    	add	x8, x23, #0x8
101c5260c: 92800009    	mov	x9, #-0x1               ; =-1
101c52610: f8e90108    	ldaddal	x9, x8, [x8]
101c52614: b50000e8    	cbnz	x8, 0x101c52630 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x6bc>
101c52618: f94002e8    	ldr	x8, [x23]
101c5261c: f9400908    	ldr	x8, [x8, #0x10]
101c52620: aa1703e0    	mov	x0, x23
101c52624: d63f0100    	blr	x8
101c52628: aa1703e0    	mov	x0, x23
101c5262c: 943ff327    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52630: f940b7f7    	ldr	x23, [sp, #0x168]
101c52634: b4000177    	cbz	x23, 0x101c52660 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x6ec>
101c52638: 910022e8    	add	x8, x23, #0x8
101c5263c: 92800009    	mov	x9, #-0x1               ; =-1
101c52640: f8e90108    	ldaddal	x9, x8, [x8]
101c52644: b50000e8    	cbnz	x8, 0x101c52660 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x6ec>
101c52648: f94002e8    	ldr	x8, [x23]
101c5264c: f9400908    	ldr	x8, [x8, #0x10]
101c52650: aa1703e0    	mov	x0, x23
101c52654: d63f0100    	blr	x8
101c52658: aa1703e0    	mov	x0, x23
101c5265c: 943ff31b    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52660: f940dfe0    	ldr	x0, [sp, #0x1b8]
101c52664: f900dfff    	str	xzr, [sp, #0x1b8]
101c52668: b4000080    	cbz	x0, 0x101c52678 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x704>
101c5266c: f9400008    	ldr	x8, [x0]
101c52670: f9400508    	ldr	x8, [x8, #0x8]
101c52674: d63f0100    	blr	x8
101c52678: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c5267c: b4000177    	cbz	x23, 0x101c526a8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x734>
101c52680: 910022e8    	add	x8, x23, #0x8
101c52684: 92800009    	mov	x9, #-0x1               ; =-1
101c52688: f8e90108    	ldaddal	x9, x8, [x8]
101c5268c: b50000e8    	cbnz	x8, 0x101c526a8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x734>
101c52690: f94002e8    	ldr	x8, [x23]
101c52694: f9400908    	ldr	x8, [x8, #0x10]
101c52698: aa1703e0    	mov	x0, x23
101c5269c: d63f0100    	blr	x8
101c526a0: aa1703e0    	mov	x0, x23
101c526a4: 943ff309    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c526a8: f94097f7    	ldr	x23, [sp, #0x128]
101c526ac: b4000177    	cbz	x23, 0x101c526d8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x764>
101c526b0: 910022e8    	add	x8, x23, #0x8
101c526b4: 92800009    	mov	x9, #-0x1               ; =-1
101c526b8: f8e90108    	ldaddal	x9, x8, [x8]
101c526bc: b50000e8    	cbnz	x8, 0x101c526d8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x764>
101c526c0: f94002e8    	ldr	x8, [x23]
101c526c4: f9400908    	ldr	x8, [x8, #0x10]
101c526c8: aa1703e0    	mov	x0, x23
101c526cc: d63f0100    	blr	x8
101c526d0: aa1703e0    	mov	x0, x23
101c526d4: 943ff2fd    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c526d8: f9400268    	ldr	x8, [x19]
101c526dc: f9400108    	ldr	x8, [x8]
101c526e0: 9100c100    	add	x0, x8, #0x30
101c526e4: f90087f6    	str	x22, [sp, #0x108]
101c526e8: 910423e1    	add	x1, sp, #0x108
101c526ec: 529fffe2    	mov	w2, #0xffff             ; =65535
101c526f0: 97ffb415    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c526f4: f94087e0    	ldr	x0, [sp, #0x108]
101c526f8: f90087ff    	str	xzr, [sp, #0x108]
101c526fc: b4000080    	cbz	x0, 0x101c5270c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x798>
101c52700: f9400008    	ldr	x8, [x0]
101c52704: f9400508    	ldr	x8, [x8, #0x8]
101c52708: d63f0100    	blr	x8
101c5270c: f9400276    	ldr	x22, [x19]
101c52710: 52800600    	mov	w0, #0x30               ; =48
101c52714: 943ff40a    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52718: aa0003f7    	mov	x23, x0
101c5271c: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c52720: b4000088    	cbz	x8, 0x101c52730 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x7bc>
101c52724: 9100210a    	add	x10, x8, #0x8
101c52728: 5280002b    	mov	w11, #0x1               ; =1
101c5272c: f82b014a    	ldadd	x11, x10, [x10]
101c52730: 9100438a    	add	x10, x28, #0x10
101c52734: a90026ea    	stp	x10, x9, [x23]
101c52738: f9000ae8    	str	x8, [x23, #0x10]
101c5273c: 528e0428    	mov	w8, #0x7021             ; =28705
101c52740: 72adee48    	movk	w8, #0x6f72, lsl #16
101c52744: b9001ae8    	str	w8, [x23, #0x18]
101c52748: 52842cc8    	mov	w8, #0x2166             ; =8550
101c5274c: 79003ae8    	strh	w8, [x23, #0x1c]
101c52750: 39007aff    	strb	wzr, [x23, #0x1e]
101c52754: 528000c8    	mov	w8, #0x6                ; =6
101c52758: 3900bee8    	strb	w8, [x23, #0x2f]
101c5275c: 52800500    	mov	w0, #0x28               ; =40
101c52760: 943ff3f7    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52764: aa0003f6    	mov	x22, x0
101c52768: f900f3f7    	str	x23, [sp, #0x1e0]
101c5276c: 910783e1    	add	x1, sp, #0x1e0
101c52770: 97f15773    	bl	0x1018a853c <wxime::data::dict::MemCacheUserProfileDict::MemCacheUserProfileDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>)>
101c52774: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c52778: f900f3ff    	str	xzr, [sp, #0x1e0]
101c5277c: b4000080    	cbz	x0, 0x101c5278c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x818>
101c52780: f9400008    	ldr	x8, [x0]
101c52784: f9400508    	ldr	x8, [x8, #0x8]
101c52788: d63f0100    	blr	x8
101c5278c: f9400268    	ldr	x8, [x19]
101c52790: f9400108    	ldr	x8, [x8]
101c52794: 9100c100    	add	x0, x8, #0x30
101c52798: f90083f6    	str	x22, [sp, #0x100]
101c5279c: 910403e1    	add	x1, sp, #0x100
101c527a0: 529fffe2    	mov	w2, #0xffff             ; =65535
101c527a4: 97ffb3e8    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c527a8: f94083e0    	ldr	x0, [sp, #0x100]
101c527ac: f90083ff    	str	xzr, [sp, #0x100]
101c527b0: b4000080    	cbz	x0, 0x101c527c0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x84c>
101c527b4: f9400008    	ldr	x8, [x0]
101c527b8: f9400508    	ldr	x8, [x8, #0x8]
101c527bc: d63f0100    	blr	x8
101c527c0: f9400276    	ldr	x22, [x19]
101c527c4: 52800600    	mov	w0, #0x30               ; =48
101c527c8: 943ff3dd    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c527cc: aa0003f7    	mov	x23, x0
101c527d0: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c527d4: b40000a8    	cbz	x8, 0x101c527e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x874>
101c527d8: 9100210a    	add	x10, x8, #0x8
101c527dc: 5280002b    	mov	w11, #0x1               ; =1
101c527e0: f82b014a    	ldadd	x11, x10, [x10]
101c527e4: f9400276    	ldr	x22, [x19]
101c527e8: 9100438a    	add	x10, x28, #0x10
101c527ec: a90026ea    	stp	x10, x9, [x23]
101c527f0: 528ecbe9    	mov	w9, #0x765f             ; =30303
101c527f4: 72a42649    	movk	w9, #0x2132, lsl #16
101c527f8: b90022e9    	str	w9, [x23, #0x20]
101c527fc: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c52800: f9472d29    	ldr	x9, [x9, #0xe58]
101c52804: a90126e8    	stp	x8, x9, [x23, #0x10]
101c52808: 390092ff    	strb	wzr, [x23, #0x24]
101c5280c: 52800188    	mov	w8, #0xc                ; =12
101c52810: 3900bee8    	strb	w8, [x23, #0x2f]
101c52814: f9401ad8    	ldr	x24, [x22, #0x30]
101c52818: 52800400    	mov	w0, #0x20               ; =32
101c5281c: 943ff3c8    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52820: aa0003f6    	mov	x22, x0
101c52824: f900f3f7    	str	x23, [sp, #0x1e0]
101c52828: 910783e1    	add	x1, sp, #0x1e0
101c5282c: aa1503e2    	mov	x2, x21
101c52830: aa1803e3    	mov	x3, x24
101c52834: 528010e4    	mov	w4, #0x87               ; =135
101c52838: 97f0b2c7    	bl	0x10187f354 <wxime::data::dict::UserWordWithSyllableCorrectionDict::UserWordWithSyllableCorrectionDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short)>
101c5283c: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c52840: f900f3ff    	str	xzr, [sp, #0x1e0]
101c52844: b4000080    	cbz	x0, 0x101c52854 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x8e0>
101c52848: f9400008    	ldr	x8, [x0]
101c5284c: f9400508    	ldr	x8, [x8, #0x8]
101c52850: d63f0100    	blr	x8
101c52854: f9400268    	ldr	x8, [x19]
101c52858: f9400108    	ldr	x8, [x8]
101c5285c: 9100c100    	add	x0, x8, #0x30
101c52860: f9007ff6    	str	x22, [sp, #0xf8]
101c52864: 9103e3e1    	add	x1, sp, #0xf8
101c52868: 529fffe2    	mov	w2, #0xffff             ; =65535
101c5286c: 97ffb3b6    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52870: f9407fe0    	ldr	x0, [sp, #0xf8]
101c52874: f9007fff    	str	xzr, [sp, #0xf8]
101c52878: b4000080    	cbz	x0, 0x101c52888 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x914>
101c5287c: f9400008    	ldr	x8, [x0]
101c52880: f9400508    	ldr	x8, [x8, #0x8]
101c52884: d63f0100    	blr	x8
101c52888: f9400278    	ldr	x24, [x19]
101c5288c: 52800600    	mov	w0, #0x30               ; =48
101c52890: 943ff3ab    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52894: aa0003f7    	mov	x23, x0
101c52898: a9462309    	ldp	x9, x8, [x24, #0x60]
101c5289c: b40000a8    	cbz	x8, 0x101c528b0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x93c>
101c528a0: 9100210a    	add	x10, x8, #0x8
101c528a4: 5280002b    	mov	w11, #0x1               ; =1
101c528a8: f82b014a    	ldadd	x11, x10, [x10]
101c528ac: f9400278    	ldr	x24, [x19]
101c528b0: 9100438a    	add	x10, x28, #0x10
101c528b4: a90026ea    	stp	x10, x9, [x23]
101c528b8: f9000ae8    	str	x8, [x23, #0x10]
101c528bc: 528ca428    	mov	w8, #0x6521             ; =25889
101c528c0: 72aecdc8    	movk	w8, #0x766e, lsl #16
101c528c4: b9001ae8    	str	w8, [x23, #0x18]
101c528c8: 52842648    	mov	w8, #0x2132             ; =8498
101c528cc: 79003ae8    	strh	w8, [x23, #0x1c]
101c528d0: 39007aff    	strb	wzr, [x23, #0x1e]
101c528d4: 528000c8    	mov	w8, #0x6                ; =6
101c528d8: 3900bee8    	strb	w8, [x23, #0x2f]
101c528dc: f9401b00    	ldr	x0, [x24, #0x30]
101c528e0: 910783e8    	add	x8, sp, #0x1e0
101c528e4: 97ece457    	bl	0x10178ba40 <wxime::data::LtrModelParams::HighDeviceLtrModelFeatureMap() const>
101c528e8: f9400268    	ldr	x8, [x19]
101c528ec: 9100c100    	add	x0, x8, #0x30
101c528f0: 52801048    	mov	w8, #0x82               ; =130
101c528f4: b901bbe8    	str	w8, [sp, #0x1b8]
101c528f8: 910683e8    	add	x8, sp, #0x1a0
101c528fc: 9106e3e1    	add	x1, sp, #0x1b8
101c52900: 940044df    	bl	0x101c63c7c <std::__1::shared_ptr<wxime::data::dict::UserDictCleanStrategyMaker> std::__1::make_shared[abi:ne180100]<wxime::data::dict::UserDictCleanStrategyMaker, std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0, void>(std::__1::shared_ptr<wxime::data::HyperParams>&, wxime::data::dict::kinds::$_0&&)>
101c52904: 52800600    	mov	w0, #0x30               ; =48
101c52908: 943ff38d    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5290c: aa0003f6    	mov	x22, x0
101c52910: f90093f7    	str	x23, [sp, #0x120]
101c52914: f9419b09    	ldr	x9, [x24, #0x330]
101c52918: f9419f08    	ldr	x8, [x24, #0x338]
101c5291c: a91623e9    	stp	x9, x8, [sp, #0x160]
101c52920: b4000088    	cbz	x8, 0x101c52930 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x9bc>
101c52924: 91002108    	add	x8, x8, #0x8
101c52928: 52800029    	mov	w9, #0x1                ; =1
101c5292c: f8290108    	ldadd	x9, x8, [x8]
101c52930: 3941d288    	ldrb	w8, [x20, #0x74]
101c52934: a940268a    	ldp	x10, x9, [x20]
101c52938: a91d27ea    	stp	x10, x9, [sp, #0x1d0]
101c5293c: b4000089    	cbz	x9, 0x101c5294c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x9d8>
101c52940: 91002129    	add	x9, x9, #0x8
101c52944: 5280002a    	mov	w10, #0x1               ; =1
101c52948: f82a0129    	ldadd	x10, x9, [x9]
101c5294c: 7100011f    	cmp	w8, #0x0
101c52950: 3dc06be0    	ldr	q0, [sp, #0x1a0]
101c52954: 1a9f07e6    	cset	w6, ne
101c52958: 3d8073e0    	str	q0, [sp, #0x1c0]
101c5295c: a91a7fff    	stp	xzr, xzr, [sp, #0x1a0]
101c52960: 910703e8    	add	x8, sp, #0x1c0
101c52964: f90003e8    	str	x8, [sp]
101c52968: 910483e1    	add	x1, sp, #0x120
101c5296c: 910583e2    	add	x2, sp, #0x160
101c52970: 910783e4    	add	x4, sp, #0x1e0
101c52974: 910743e7    	add	x7, sp, #0x1d0
101c52978: aa1603e0    	mov	x0, x22
101c5297c: aa1503e3    	mov	x3, x21
101c52980: 52801045    	mov	w5, #0x82               ; =130
101c52984: 97eded64    	bl	0x1017cdf14 <wxime::data::dict::UserEnglishDict::UserEnglishDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::UserHistoryScoreParamsProto::Reader const&, unsigned short, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>)>
101c52988: f940e7f7    	ldr	x23, [sp, #0x1c8]
101c5298c: b4000177    	cbz	x23, 0x101c529b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xa44>
101c52990: 910022e8    	add	x8, x23, #0x8
101c52994: 92800009    	mov	x9, #-0x1               ; =-1
101c52998: f8e90108    	ldaddal	x9, x8, [x8]
101c5299c: b50000e8    	cbnz	x8, 0x101c529b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xa44>
101c529a0: f94002e8    	ldr	x8, [x23]
101c529a4: f9400908    	ldr	x8, [x8, #0x10]
101c529a8: aa1703e0    	mov	x0, x23
101c529ac: d63f0100    	blr	x8
101c529b0: aa1703e0    	mov	x0, x23
101c529b4: 943ff245    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c529b8: f940eff7    	ldr	x23, [sp, #0x1d8]
101c529bc: b4000177    	cbz	x23, 0x101c529e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xa74>
101c529c0: 910022e8    	add	x8, x23, #0x8
101c529c4: 92800009    	mov	x9, #-0x1               ; =-1
101c529c8: f8e90108    	ldaddal	x9, x8, [x8]
101c529cc: b50000e8    	cbnz	x8, 0x101c529e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xa74>
101c529d0: f94002e8    	ldr	x8, [x23]
101c529d4: f9400908    	ldr	x8, [x8, #0x10]
101c529d8: aa1703e0    	mov	x0, x23
101c529dc: d63f0100    	blr	x8
101c529e0: aa1703e0    	mov	x0, x23
101c529e4: 943ff239    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c529e8: f940b7f7    	ldr	x23, [sp, #0x168]
101c529ec: b4000177    	cbz	x23, 0x101c52a18 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xaa4>
101c529f0: 910022e8    	add	x8, x23, #0x8
101c529f4: 92800009    	mov	x9, #-0x1               ; =-1
101c529f8: f8e90108    	ldaddal	x9, x8, [x8]
101c529fc: b50000e8    	cbnz	x8, 0x101c52a18 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xaa4>
101c52a00: f94002e8    	ldr	x8, [x23]
101c52a04: f9400908    	ldr	x8, [x8, #0x10]
101c52a08: aa1703e0    	mov	x0, x23
101c52a0c: d63f0100    	blr	x8
101c52a10: aa1703e0    	mov	x0, x23
101c52a14: 943ff22d    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52a18: f94093e0    	ldr	x0, [sp, #0x120]
101c52a1c: f90093ff    	str	xzr, [sp, #0x120]
101c52a20: b4000080    	cbz	x0, 0x101c52a30 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xabc>
101c52a24: f9400008    	ldr	x8, [x0]
101c52a28: f9400508    	ldr	x8, [x8, #0x8]
101c52a2c: d63f0100    	blr	x8
101c52a30: f940d7f7    	ldr	x23, [sp, #0x1a8]
101c52a34: b4000177    	cbz	x23, 0x101c52a60 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xaec>
101c52a38: 910022e8    	add	x8, x23, #0x8
101c52a3c: 92800009    	mov	x9, #-0x1               ; =-1
101c52a40: f8e90108    	ldaddal	x9, x8, [x8]
101c52a44: b50000e8    	cbnz	x8, 0x101c52a60 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xaec>
101c52a48: f94002e8    	ldr	x8, [x23]
101c52a4c: f9400908    	ldr	x8, [x8, #0x10]
101c52a50: aa1703e0    	mov	x0, x23
101c52a54: d63f0100    	blr	x8
101c52a58: aa1703e0    	mov	x0, x23
101c52a5c: 943ff21b    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52a60: f9400268    	ldr	x8, [x19]
101c52a64: f9400108    	ldr	x8, [x8]
101c52a68: 9100c100    	add	x0, x8, #0x30
101c52a6c: f9007bf6    	str	x22, [sp, #0xf0]
101c52a70: 9103c3e1    	add	x1, sp, #0xf0
101c52a74: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52a78: 97ffb333    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52a7c: f9407be0    	ldr	x0, [sp, #0xf0]
101c52a80: f9007bff    	str	xzr, [sp, #0xf0]
101c52a84: b4000080    	cbz	x0, 0x101c52a94 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xb20>
101c52a88: f9400008    	ldr	x8, [x0]
101c52a8c: f9400508    	ldr	x8, [x8, #0x8]
101c52a90: d63f0100    	blr	x8
101c52a94: f9400278    	ldr	x24, [x19]
101c52a98: 52800600    	mov	w0, #0x30               ; =48
101c52a9c: 943ff328    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52aa0: aa0003f7    	mov	x23, x0
101c52aa4: a9462309    	ldp	x9, x8, [x24, #0x60]
101c52aa8: b40000a8    	cbz	x8, 0x101c52abc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xb48>
101c52aac: 9100210a    	add	x10, x8, #0x8
101c52ab0: 5280002b    	mov	w11, #0x1               ; =1
101c52ab4: f82b014a    	ldadd	x11, x10, [x10]
101c52ab8: f9400278    	ldr	x24, [x19]
101c52abc: 9100438a    	add	x10, x28, #0x10
101c52ac0: a90026ea    	stp	x10, x9, [x23]
101c52ac4: f9000ae8    	str	x8, [x23, #0x10]
101c52ac8: 528ca428    	mov	w8, #0x6521             ; =25889
101c52acc: 72abedc8    	movk	w8, #0x5f6e, lsl #16
101c52ad0: b9001ae8    	str	w8, [x23, #0x18]
101c52ad4: 528ccbe8    	mov	w8, #0x665f             ; =26207
101c52ad8: 72a42ca8    	movk	w8, #0x2165, lsl #16
101c52adc: b801b2e8    	stur	w8, [x23, #0x1b]
101c52ae0: 39007eff    	strb	wzr, [x23, #0x1f]
101c52ae4: 528000e8    	mov	w8, #0x7                ; =7
101c52ae8: 3900bee8    	strb	w8, [x23, #0x2f]
101c52aec: f9401b00    	ldr	x0, [x24, #0x30]
101c52af0: 910783e8    	add	x8, sp, #0x1e0
101c52af4: 97ece3d3    	bl	0x10178ba40 <wxime::data::LtrModelParams::HighDeviceLtrModelFeatureMap() const>
101c52af8: 52800600    	mov	w0, #0x30               ; =48
101c52afc: 943ff310    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52b00: aa0003f6    	mov	x22, x0
101c52b04: f900d3f7    	str	x23, [sp, #0x1a0]
101c52b08: f9419b09    	ldr	x9, [x24, #0x330]
101c52b0c: f9419f08    	ldr	x8, [x24, #0x338]
101c52b10: a91623e9    	stp	x9, x8, [sp, #0x160]
101c52b14: b4000088    	cbz	x8, 0x101c52b24 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xbb0>
101c52b18: 91002108    	add	x8, x8, #0x8
101c52b1c: 52800029    	mov	w9, #0x1                ; =1
101c52b20: f8290108    	ldadd	x9, x8, [x8]
101c52b24: 3941d288    	ldrb	w8, [x20, #0x74]
101c52b28: a940268a    	ldp	x10, x9, [x20]
101c52b2c: a91d27ea    	stp	x10, x9, [sp, #0x1d0]
101c52b30: b4000089    	cbz	x9, 0x101c52b40 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xbcc>
101c52b34: 91002129    	add	x9, x9, #0x8
101c52b38: 5280002a    	mov	w10, #0x1               ; =1
101c52b3c: f82a0129    	ldadd	x10, x9, [x9]
101c52b40: 7100011f    	cmp	w8, #0x0
101c52b44: 1a9f07e6    	cset	w6, ne
101c52b48: a91c7fff    	stp	xzr, xzr, [sp, #0x1c0]
101c52b4c: 910703e8    	add	x8, sp, #0x1c0
101c52b50: f90003e8    	str	x8, [sp]
101c52b54: 910683e1    	add	x1, sp, #0x1a0
101c52b58: 910583e2    	add	x2, sp, #0x160
101c52b5c: 910783e4    	add	x4, sp, #0x1e0
101c52b60: 910743e7    	add	x7, sp, #0x1d0
101c52b64: aa1603e0    	mov	x0, x22
101c52b68: aa1503e3    	mov	x3, x21
101c52b6c: 528011e5    	mov	w5, #0x8f               ; =143
101c52b70: 97edece9    	bl	0x1017cdf14 <wxime::data::dict::UserEnglishDict::UserEnglishDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::UserHistoryScoreParamsProto::Reader const&, unsigned short, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>)>
101c52b74: f940e7f7    	ldr	x23, [sp, #0x1c8]
101c52b78: b4000177    	cbz	x23, 0x101c52ba4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc30>
101c52b7c: 910022e8    	add	x8, x23, #0x8
101c52b80: 92800009    	mov	x9, #-0x1               ; =-1
101c52b84: f8e90108    	ldaddal	x9, x8, [x8]
101c52b88: b50000e8    	cbnz	x8, 0x101c52ba4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc30>
101c52b8c: f94002e8    	ldr	x8, [x23]
101c52b90: f9400908    	ldr	x8, [x8, #0x10]
101c52b94: aa1703e0    	mov	x0, x23
101c52b98: d63f0100    	blr	x8
101c52b9c: aa1703e0    	mov	x0, x23
101c52ba0: 943ff1ca    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52ba4: f940eff7    	ldr	x23, [sp, #0x1d8]
101c52ba8: b4000177    	cbz	x23, 0x101c52bd4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc60>
101c52bac: 910022e8    	add	x8, x23, #0x8
101c52bb0: 92800009    	mov	x9, #-0x1               ; =-1
101c52bb4: f8e90108    	ldaddal	x9, x8, [x8]
101c52bb8: b50000e8    	cbnz	x8, 0x101c52bd4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc60>
101c52bbc: f94002e8    	ldr	x8, [x23]
101c52bc0: f9400908    	ldr	x8, [x8, #0x10]
101c52bc4: aa1703e0    	mov	x0, x23
101c52bc8: d63f0100    	blr	x8
101c52bcc: aa1703e0    	mov	x0, x23
101c52bd0: 943ff1be    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52bd4: f940b7f7    	ldr	x23, [sp, #0x168]
101c52bd8: b4000177    	cbz	x23, 0x101c52c04 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc90>
101c52bdc: 910022e8    	add	x8, x23, #0x8
101c52be0: 92800009    	mov	x9, #-0x1               ; =-1
101c52be4: f8e90108    	ldaddal	x9, x8, [x8]
101c52be8: b50000e8    	cbnz	x8, 0x101c52c04 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xc90>
101c52bec: f94002e8    	ldr	x8, [x23]
101c52bf0: f9400908    	ldr	x8, [x8, #0x10]
101c52bf4: aa1703e0    	mov	x0, x23
101c52bf8: d63f0100    	blr	x8
101c52bfc: aa1703e0    	mov	x0, x23
101c52c00: 943ff1b2    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52c04: f940d3e0    	ldr	x0, [sp, #0x1a0]
101c52c08: f900d3ff    	str	xzr, [sp, #0x1a0]
101c52c0c: b4000080    	cbz	x0, 0x101c52c1c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xca8>
101c52c10: f9400008    	ldr	x8, [x0]
101c52c14: f9400508    	ldr	x8, [x8, #0x8]
101c52c18: d63f0100    	blr	x8
101c52c1c: f9400268    	ldr	x8, [x19]
101c52c20: f9400108    	ldr	x8, [x8]
101c52c24: 9100c100    	add	x0, x8, #0x30
101c52c28: f90077f6    	str	x22, [sp, #0xe8]
101c52c2c: 9103a3e1    	add	x1, sp, #0xe8
101c52c30: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52c34: 97ffb2c4    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52c38: f94077e0    	ldr	x0, [sp, #0xe8]
101c52c3c: f90077ff    	str	xzr, [sp, #0xe8]
101c52c40: b4000080    	cbz	x0, 0x101c52c50 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xcdc>
101c52c44: f9400008    	ldr	x8, [x0]
101c52c48: f9400508    	ldr	x8, [x8, #0x8]
101c52c4c: d63f0100    	blr	x8
101c52c50: f9400268    	ldr	x8, [x19]
101c52c54: f9400100    	ldr	x0, [x8]
101c52c58: f9400008    	ldr	x8, [x0]
101c52c5c: f942e509    	ldr	x9, [x8, #0x5c8]
101c52c60: 910583e8    	add	x8, sp, #0x160
101c52c64: 52801161    	mov	w1, #0x8b               ; =139
101c52c68: d63f0120    	blr	x9
101c52c6c: 52800500    	mov	w0, #0x28               ; =40
101c52c70: 943ff2b3    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52c74: aa0003f6    	mov	x22, x0
101c52c78: 3dc05be0    	ldr	q0, [sp, #0x160]
101c52c7c: 3d807be0    	str	q0, [sp, #0x1e0]
101c52c80: a9167fff    	stp	xzr, xzr, [sp, #0x160]
101c52c84: 910783e1    	add	x1, sp, #0x1e0
101c52c88: 97f0ad2f    	bl	0x10187e144 <wxime::data::dict::MemCacheUserCoordinateDict::MemCacheUserCoordinateDict(std::__1::shared_ptr<wxime::data::dict::IDict>)>
101c52c8c: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c52c90: b4000177    	cbz	x23, 0x101c52cbc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xd48>
101c52c94: 910022e8    	add	x8, x23, #0x8
101c52c98: 92800009    	mov	x9, #-0x1               ; =-1
101c52c9c: f8e90108    	ldaddal	x9, x8, [x8]
101c52ca0: b50000e8    	cbnz	x8, 0x101c52cbc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xd48>
101c52ca4: f94002e8    	ldr	x8, [x23]
101c52ca8: f9400908    	ldr	x8, [x8, #0x10]
101c52cac: aa1703e0    	mov	x0, x23
101c52cb0: d63f0100    	blr	x8
101c52cb4: aa1703e0    	mov	x0, x23
101c52cb8: 943ff184    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52cbc: f940b7f7    	ldr	x23, [sp, #0x168]
101c52cc0: b4000177    	cbz	x23, 0x101c52cec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xd78>
101c52cc4: 910022e8    	add	x8, x23, #0x8
101c52cc8: 92800009    	mov	x9, #-0x1               ; =-1
101c52ccc: f8e90108    	ldaddal	x9, x8, [x8]
101c52cd0: b50000e8    	cbnz	x8, 0x101c52cec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xd78>
101c52cd4: f94002e8    	ldr	x8, [x23]
101c52cd8: f9400908    	ldr	x8, [x8, #0x10]
101c52cdc: aa1703e0    	mov	x0, x23
101c52ce0: d63f0100    	blr	x8
101c52ce4: aa1703e0    	mov	x0, x23
101c52ce8: 943ff178    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52cec: f9400268    	ldr	x8, [x19]
101c52cf0: f9400108    	ldr	x8, [x8]
101c52cf4: 9100c100    	add	x0, x8, #0x30
101c52cf8: f90073f6    	str	x22, [sp, #0xe0]
101c52cfc: 910383e1    	add	x1, sp, #0xe0
101c52d00: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52d04: 97ffb290    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52d08: f94073e0    	ldr	x0, [sp, #0xe0]
101c52d0c: f90073ff    	str	xzr, [sp, #0xe0]
101c52d10: b4000080    	cbz	x0, 0x101c52d20 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xdac>
101c52d14: f9400008    	ldr	x8, [x0]
101c52d18: f9400508    	ldr	x8, [x8, #0x8]
101c52d1c: d63f0100    	blr	x8
101c52d20: f9400277    	ldr	x23, [x19]
101c52d24: 52800600    	mov	w0, #0x30               ; =48
101c52d28: 943ff285    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52d2c: aa0003f6    	mov	x22, x0
101c52d30: a94622e9    	ldp	x9, x8, [x23, #0x60]
101c52d34: b4000088    	cbz	x8, 0x101c52d44 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xdd0>
101c52d38: 9100210a    	add	x10, x8, #0x8
101c52d3c: 5280002b    	mov	w11, #0x1               ; =1
101c52d40: f82b014a    	ldadd	x11, x10, [x10]
101c52d44: 91004398    	add	x24, x28, #0x10
101c52d48: a90026d8    	stp	x24, x9, [x22]
101c52d4c: f9000ac8    	str	x8, [x22, #0x10]
101c52d50: 528ea428    	mov	w8, #0x7521             ; =29985
101c52d54: 72ac6e68    	movk	w8, #0x6373, lsl #16
101c52d58: b9001ac8    	str	w8, [x22, #0x18]
101c52d5c: 52800428    	mov	w8, #0x21               ; =33
101c52d60: 79003ac8    	strh	w8, [x22, #0x1c]
101c52d64: 528000a8    	mov	w8, #0x5                ; =5
101c52d68: 3900bec8    	strb	w8, [x22, #0x2f]
101c52d6c: 52800400    	mov	w0, #0x20               ; =32
101c52d70: 943ff273    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52d74: aa0003f7    	mov	x23, x0
101c52d78: f900f3f6    	str	x22, [sp, #0x1e0]
101c52d7c: 52800400    	mov	w0, #0x20               ; =32
101c52d80: 943ff26f    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52d84: b000bfdb    	adrp	x27, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c52d88: 9119637b    	add	x27, x27, #0x658
101c52d8c: a9007c1b    	stp	x27, xzr, [x0]
101c52d90: a901581f    	stp	xzr, x22, [x0, #0x10]
101c52d94: f900f7e0    	str	x0, [sp, #0x1e8]
101c52d98: 910783e1    	add	x1, sp, #0x1e0
101c52d9c: aa1703e0    	mov	x0, x23
101c52da0: aa1503e2    	mov	x2, x21
101c52da4: 52800003    	mov	w3, #0x0                ; =0
101c52da8: 97f14082    	bl	0x1018a2fb0 <wxime::data::dict::UserScenesDict::UserScenesDict(std::__1::shared_ptr<wxime::kv::IKV>, async::threadpool_scheduler&, bool)>
101c52dac: f940f7f6    	ldr	x22, [sp, #0x1e8]
101c52db0: b4000176    	cbz	x22, 0x101c52ddc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xe68>
101c52db4: 910022c8    	add	x8, x22, #0x8
101c52db8: 92800009    	mov	x9, #-0x1               ; =-1
101c52dbc: f8e90108    	ldaddal	x9, x8, [x8]
101c52dc0: b50000e8    	cbnz	x8, 0x101c52ddc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xe68>
101c52dc4: f94002c8    	ldr	x8, [x22]
101c52dc8: f9400908    	ldr	x8, [x8, #0x10]
101c52dcc: aa1603e0    	mov	x0, x22
101c52dd0: d63f0100    	blr	x8
101c52dd4: aa1603e0    	mov	x0, x22
101c52dd8: 943ff13c    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c52ddc: f9400268    	ldr	x8, [x19]
101c52de0: f9400108    	ldr	x8, [x8]
101c52de4: 9100c100    	add	x0, x8, #0x30
101c52de8: f9006ff7    	str	x23, [sp, #0xd8]
101c52dec: 910363e1    	add	x1, sp, #0xd8
101c52df0: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52df4: 97ffb254    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52df8: f9406fe0    	ldr	x0, [sp, #0xd8]
101c52dfc: f9006fff    	str	xzr, [sp, #0xd8]
101c52e00: b4000080    	cbz	x0, 0x101c52e10 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xe9c>
101c52e04: f9400008    	ldr	x8, [x0]
101c52e08: f9400508    	ldr	x8, [x8, #0x8]
101c52e0c: d63f0100    	blr	x8
101c52e10: f9400276    	ldr	x22, [x19]
101c52e14: 52800600    	mov	w0, #0x30               ; =48
101c52e18: 943ff249    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52e1c: aa0003f8    	mov	x24, x0
101c52e20: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c52e24: b4000088    	cbz	x8, 0x101c52e34 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xec0>
101c52e28: 9100210a    	add	x10, x8, #0x8
101c52e2c: 5280002b    	mov	w11, #0x1               ; =1
101c52e30: f82b014a    	ldadd	x11, x10, [x10]
101c52e34: 9100438a    	add	x10, x28, #0x10
101c52e38: a900270a    	stp	x10, x9, [x24]
101c52e3c: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c52e40: 9139a129    	add	x9, x9, #0xe68 ; !usr_cor_txt!
101c52e44: f940012a    	ldr	x10, [x9]
101c52e48: a9012b08    	stp	x8, x10, [x24, #0x10]
101c52e4c: f8405128    	ldur	x8, [x9, #0x5]
101c52e50: f801d308    	stur	x8, [x24, #0x1d]
101c52e54: 3900971f    	strb	wzr, [x24, #0x25]
101c52e58: 528001a8    	mov	w8, #0xd                ; =13
101c52e5c: 3900bf08    	strb	w8, [x24, #0x2f]
101c52e60: 52800400    	mov	w0, #0x20               ; =32
101c52e64: 943ff236    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52e68: aa0003f7    	mov	x23, x0
101c52e6c: 9101d288    	add	x8, x20, #0x74
101c52e70: f900f3f8    	str	x24, [sp, #0x1e0]
101c52e74: f90017e8    	str	x8, [sp, #0x28]
101c52e78: 39400105    	ldrb	w5, [x8]
101c52e7c: 910783e1    	add	x1, sp, #0x1e0
101c52e80: aa1503e2    	mov	x2, x21
101c52e84: 52801223    	mov	w3, #0x91               ; =145
101c52e88: 52809604    	mov	w4, #0x4b0              ; =1200
101c52e8c: 97f21607    	bl	0x1018d86a8 <wxime::data::dict::UserCorrectedTextDict::UserCorrectedTextDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, int, bool)>
101c52e90: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c52e94: f900f3ff    	str	xzr, [sp, #0x1e0]
101c52e98: b4000080    	cbz	x0, 0x101c52ea8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xf34>
101c52e9c: f9400008    	ldr	x8, [x0]
101c52ea0: f9400508    	ldr	x8, [x8, #0x8]
101c52ea4: d63f0100    	blr	x8
101c52ea8: f9400268    	ldr	x8, [x19]
101c52eac: f9400108    	ldr	x8, [x8]
101c52eb0: 9100c100    	add	x0, x8, #0x30
101c52eb4: f9006bf7    	str	x23, [sp, #0xd0]
101c52eb8: 910343e1    	add	x1, sp, #0xd0
101c52ebc: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52ec0: 97ffb221    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52ec4: f9406be0    	ldr	x0, [sp, #0xd0]
101c52ec8: f9006bff    	str	xzr, [sp, #0xd0]
101c52ecc: b4000080    	cbz	x0, 0x101c52edc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xf68>
101c52ed0: f9400008    	ldr	x8, [x0]
101c52ed4: f9400508    	ldr	x8, [x8, #0x8]
101c52ed8: d63f0100    	blr	x8
101c52edc: f9400276    	ldr	x22, [x19]
101c52ee0: 52800600    	mov	w0, #0x30               ; =48
101c52ee4: 943ff216    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52ee8: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c52eec: b40000a8    	cbz	x8, 0x101c52f00 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xf8c>
101c52ef0: 9100210a    	add	x10, x8, #0x8
101c52ef4: 5280002b    	mov	w11, #0x1               ; =1
101c52ef8: f82b014a    	ldadd	x11, x10, [x10]
101c52efc: f9400276    	ldr	x22, [x19]
101c52f00: 9100438a    	add	x10, x28, #0x10
101c52f04: a900240a    	stp	x10, x9, [x0]
101c52f08: 52842f09    	mov	w9, #0x2178             ; =8568
101c52f0c: 79004009    	strh	w9, [x0, #0x20]
101c52f10: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c52f14: f9473d29    	ldr	x9, [x9, #0xe78]
101c52f18: a9012408    	stp	x8, x9, [x0, #0x10]
101c52f1c: 3900881f    	strb	wzr, [x0, #0x22]
101c52f20: 52800148    	mov	w8, #0xa                ; =10
101c52f24: 3900bc08    	strb	w8, [x0, #0x2f]
101c52f28: f900f3e0    	str	x0, [sp, #0x1e0]
101c52f2c: 910cc2c1    	add	x1, x22, #0x330
101c52f30: 910703e8    	add	x8, sp, #0x1c0
101c52f34: 910783e0    	add	x0, sp, #0x1e0
101c52f38: 94004388    	bl	0x101c63d58 <std::__1::__unique_if<wxime::data::dict::UserHardFixDict>::__unique_single std::__1::make_unique[abi:ne180100]<wxime::data::dict::UserHardFixDict, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>&>(std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>&&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>&)>
101c52f3c: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c52f40: f900f3ff    	str	xzr, [sp, #0x1e0]
101c52f44: b4000080    	cbz	x0, 0x101c52f54 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0xfe0>
101c52f48: f9400008    	ldr	x8, [x0]
101c52f4c: f9400508    	ldr	x8, [x8, #0x8]
101c52f50: d63f0100    	blr	x8
101c52f54: f9400268    	ldr	x8, [x19]
101c52f58: f9400108    	ldr	x8, [x8]
101c52f5c: 9100c100    	add	x0, x8, #0x30
101c52f60: f940e3e8    	ldr	x8, [sp, #0x1c0]
101c52f64: f900e3ff    	str	xzr, [sp, #0x1c0]
101c52f68: f90067e8    	str	x8, [sp, #0xc8]
101c52f6c: 910323e1    	add	x1, sp, #0xc8
101c52f70: 529fffe2    	mov	w2, #0xffff             ; =65535
101c52f74: 97ffb1f4    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c52f78: f94067e0    	ldr	x0, [sp, #0xc8]
101c52f7c: f90067ff    	str	xzr, [sp, #0xc8]
101c52f80: b4000080    	cbz	x0, 0x101c52f90 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x101c>
101c52f84: f9400008    	ldr	x8, [x0]
101c52f88: f9400508    	ldr	x8, [x8, #0x8]
101c52f8c: d63f0100    	blr	x8
101c52f90: f9400276    	ldr	x22, [x19]
101c52f94: 52800600    	mov	w0, #0x30               ; =48
101c52f98: 943ff1e9    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c52f9c: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c52fa0: b40000a8    	cbz	x8, 0x101c52fb4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1040>
101c52fa4: 9100210a    	add	x10, x8, #0x8
101c52fa8: 5280002b    	mov	w11, #0x1               ; =1
101c52fac: f82b014a    	ldadd	x11, x10, [x10]
101c52fb0: f9400276    	ldr	x22, [x19]
101c52fb4: 9100438a    	add	x10, x28, #0x10
101c52fb8: a900240a    	stp	x10, x9, [x0]
101c52fbc: 52842649    	mov	w9, #0x2132             ; =8498
101c52fc0: 79004009    	strh	w9, [x0, #0x20]
101c52fc4: b0009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c52fc8: f9474529    	ldr	x9, [x9, #0xe88]
101c52fcc: a9012408    	stp	x8, x9, [x0, #0x10]
101c52fd0: 3900881f    	strb	wzr, [x0, #0x22]
101c52fd4: 52800148    	mov	w8, #0xa                ; =10
101c52fd8: 3900bc08    	strb	w8, [x0, #0x2f]
101c52fdc: f900f3e0    	str	x0, [sp, #0x1e0]
101c52fe0: 910cc2c3    	add	x3, x22, #0x330
101c52fe4: 910683e8    	add	x8, sp, #0x1a0
101c52fe8: 910783e0    	add	x0, sp, #0x1e0
101c52fec: aa1503e1    	mov	x1, x21
101c52ff0: f94017e2    	ldr	x2, [sp, #0x28]
101c52ff4: 94004396    	bl	0x101c63e4c <std::__1::__unique_if<wxime::data::dict::UserBlockListDict>::__unique_single std::__1::make_unique[abi:ne180100]<wxime::data::dict::UserBlockListDict, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>, async::threadpool_scheduler&, bool&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>&>(std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>&&, async::threadpool_scheduler&, bool&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>&)>
101c52ff8: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c52ffc: f900f3ff    	str	xzr, [sp, #0x1e0]
101c53000: b4000080    	cbz	x0, 0x101c53010 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x109c>
101c53004: f9400008    	ldr	x8, [x0]
101c53008: f9400508    	ldr	x8, [x8, #0x8]
101c5300c: d63f0100    	blr	x8
101c53010: f9400268    	ldr	x8, [x19]
101c53014: f9400108    	ldr	x8, [x8]
101c53018: 9100c100    	add	x0, x8, #0x30
101c5301c: f940d3e8    	ldr	x8, [sp, #0x1a0]
101c53020: f900d3ff    	str	xzr, [sp, #0x1a0]
101c53024: f90063e8    	str	x8, [sp, #0xc0]
101c53028: 910303e1    	add	x1, sp, #0xc0
101c5302c: 529fffe2    	mov	w2, #0xffff             ; =65535
101c53030: 97ffb1c5    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c53034: f94063e0    	ldr	x0, [sp, #0xc0]
101c53038: f90063ff    	str	xzr, [sp, #0xc0]
101c5303c: b4000080    	cbz	x0, 0x101c5304c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x10d8>
101c53040: f9400008    	ldr	x8, [x0]
101c53044: f9400508    	ldr	x8, [x8, #0x8]
101c53048: d63f0100    	blr	x8
101c5304c: f9400276    	ldr	x22, [x19]
101c53050: 52800600    	mov	w0, #0x30               ; =48
101c53054: 943ff1ba    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53058: aa0003f8    	mov	x24, x0
101c5305c: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c53060: b4000088    	cbz	x8, 0x101c53070 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x10fc>
101c53064: 9100210a    	add	x10, x8, #0x8
101c53068: 5280002b    	mov	w11, #0x1               ; =1
101c5306c: f82b014a    	ldadd	x11, x10, [x10]
101c53070: 9100438a    	add	x10, x28, #0x10
101c53074: a900270a    	stp	x10, x9, [x24]
101c53078: 52800429    	mov	w9, #0x21               ; =33
101c5307c: 79004309    	strh	w9, [x24, #0x20]
101c53080: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53084: f9474d29    	ldr	x9, [x9, #0xe98]
101c53088: a9012708    	stp	x8, x9, [x24, #0x10]
101c5308c: 52800128    	mov	w8, #0x9                ; =9
101c53090: 3900bf08    	strb	w8, [x24, #0x2f]
101c53094: 52800400    	mov	w0, #0x20               ; =32
101c53098: 943ff1a9    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5309c: aa0003f7    	mov	x23, x0
101c530a0: f900f3f8    	str	x24, [sp, #0x1e0]
101c530a4: 910783e1    	add	x1, sp, #0x1e0
101c530a8: 528012e2    	mov	w2, #0x97               ; =151
101c530ac: 97f2fd1e    	bl	0x101912524 <wxime::data::dict::UserCommonWordsDict::UserCommonWordsDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, unsigned short)>
101c530b0: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c530b4: f900f3ff    	str	xzr, [sp, #0x1e0]
101c530b8: b4000080    	cbz	x0, 0x101c530c8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1154>
101c530bc: f9400008    	ldr	x8, [x0]
101c530c0: f9400508    	ldr	x8, [x8, #0x8]
101c530c4: d63f0100    	blr	x8
101c530c8: f9400268    	ldr	x8, [x19]
101c530cc: f9400108    	ldr	x8, [x8]
101c530d0: 9100c100    	add	x0, x8, #0x30
101c530d4: f9005ff7    	str	x23, [sp, #0xb8]
101c530d8: 9102e3e1    	add	x1, sp, #0xb8
101c530dc: 529fffe2    	mov	w2, #0xffff             ; =65535
101c530e0: 97ffb199    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c530e4: f9405fe0    	ldr	x0, [sp, #0xb8]
101c530e8: f9005fff    	str	xzr, [sp, #0xb8]
101c530ec: b4000080    	cbz	x0, 0x101c530fc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1188>
101c530f0: f9400008    	ldr	x8, [x0]
101c530f4: f9400508    	ldr	x8, [x8, #0x8]
101c530f8: d63f0100    	blr	x8
101c530fc: f9400276    	ldr	x22, [x19]
101c53100: 52800600    	mov	w0, #0x30               ; =48
101c53104: 943ff18e    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53108: aa0003f8    	mov	x24, x0
101c5310c: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c53110: b40000a8    	cbz	x8, 0x101c53124 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x11b0>
101c53114: 9100210a    	add	x10, x8, #0x8
101c53118: 5280002b    	mov	w11, #0x1               ; =1
101c5311c: f82b014a    	ldadd	x11, x10, [x10]
101c53120: f9400276    	ldr	x22, [x19]
101c53124: 9100438a    	add	x10, x28, #0x10
101c53128: a900270a    	stp	x10, x9, [x24]
101c5312c: f9000b08    	str	x8, [x24, #0x10]
101c53130: 528ee428    	mov	w8, #0x7721             ; =30497
101c53134: 72ac4ea8    	movk	w8, #0x6275, lsl #16
101c53138: b9001b08    	str	w8, [x24, #0x18]
101c5313c: 52842d28    	mov	w8, #0x2169             ; =8553
101c53140: 79003b08    	strh	w8, [x24, #0x1c]
101c53144: 39007b1f    	strb	wzr, [x24, #0x1e]
101c53148: 528000c8    	mov	w8, #0x6                ; =6
101c5314c: 3900bf08    	strb	w8, [x24, #0x2f]
101c53150: f9401ad9    	ldr	x25, [x22, #0x30]
101c53154: 52800400    	mov	w0, #0x20               ; =32
101c53158: 943ff179    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5315c: aa0003f7    	mov	x23, x0
101c53160: f900b3f8    	str	x24, [sp, #0x160]
101c53164: f9419ac9    	ldr	x9, [x22, #0x330]
101c53168: f9419ec8    	ldr	x8, [x22, #0x338]
101c5316c: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c53170: b4000088    	cbz	x8, 0x101c53180 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x120c>
101c53174: 91002108    	add	x8, x8, #0x8
101c53178: 52800029    	mov	w9, #0x1                ; =1
101c5317c: f8290108    	ldadd	x9, x8, [x8]
101c53180: 910583e1    	add	x1, sp, #0x160
101c53184: 910783e5    	add	x5, sp, #0x1e0
101c53188: aa1703e0    	mov	x0, x23
101c5318c: aa1503e2    	mov	x2, x21
101c53190: aa1903e3    	mov	x3, x25
101c53194: 52801324    	mov	w4, #0x99               ; =153
101c53198: 97f2c37c    	bl	0x101903f88 <wxime::data::dict::UserWubiDict::UserWubiDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>)>
101c5319c: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c531a0: b4000178    	cbz	x24, 0x101c531cc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1258>
101c531a4: 91002308    	add	x8, x24, #0x8
101c531a8: 92800009    	mov	x9, #-0x1               ; =-1
101c531ac: f8e90108    	ldaddal	x9, x8, [x8]
101c531b0: b50000e8    	cbnz	x8, 0x101c531cc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1258>
101c531b4: f9400308    	ldr	x8, [x24]
101c531b8: f9400908    	ldr	x8, [x8, #0x10]
101c531bc: aa1803e0    	mov	x0, x24
101c531c0: d63f0100    	blr	x8
101c531c4: aa1803e0    	mov	x0, x24
101c531c8: 943ff040    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c531cc: f940b3e0    	ldr	x0, [sp, #0x160]
101c531d0: f900b3ff    	str	xzr, [sp, #0x160]
101c531d4: b4000080    	cbz	x0, 0x101c531e4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1270>
101c531d8: f9400008    	ldr	x8, [x0]
101c531dc: f9400508    	ldr	x8, [x8, #0x8]
101c531e0: d63f0100    	blr	x8
101c531e4: f9400268    	ldr	x8, [x19]
101c531e8: f9400108    	ldr	x8, [x8]
101c531ec: 9100c100    	add	x0, x8, #0x30
101c531f0: f9005bf7    	str	x23, [sp, #0xb0]
101c531f4: 9102c3e1    	add	x1, sp, #0xb0
101c531f8: 529fffe2    	mov	w2, #0xffff             ; =65535
101c531fc: 97ffb152    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c53200: f9405be0    	ldr	x0, [sp, #0xb0]
101c53204: f9005bff    	str	xzr, [sp, #0xb0]
101c53208: b4000080    	cbz	x0, 0x101c53218 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x12a4>
101c5320c: f9400008    	ldr	x8, [x0]
101c53210: f9400508    	ldr	x8, [x8, #0x8]
101c53214: d63f0100    	blr	x8
101c53218: f940027a    	ldr	x26, [x19]
101c5321c: 52800600    	mov	w0, #0x30               ; =48
101c53220: 943ff147    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53224: aa0003f8    	mov	x24, x0
101c53228: a9462349    	ldp	x9, x8, [x26, #0x60]
101c5322c: b40000a8    	cbz	x8, 0x101c53240 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x12cc>
101c53230: 9100210a    	add	x10, x8, #0x8
101c53234: 5280002b    	mov	w11, #0x1               ; =1
101c53238: f82b014a    	ldadd	x11, x10, [x10]
101c5323c: f940027a    	ldr	x26, [x19]
101c53240: 91004396    	add	x22, x28, #0x10
101c53244: a9002716    	stp	x22, x9, [x24]
101c53248: 52842ca9    	mov	w9, #0x2165             ; =8549
101c5324c: 79004309    	strh	w9, [x24, #0x20]
101c53250: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53254: f9475529    	ldr	x9, [x9, #0xea8]
101c53258: a9012708    	stp	x8, x9, [x24, #0x10]
101c5325c: 39008b1f    	strb	wzr, [x24, #0x22]
101c53260: 52800148    	mov	w8, #0xa                ; =10
101c53264: 3900bf08    	strb	w8, [x24, #0x2f]
101c53268: 52800600    	mov	w0, #0x30               ; =48
101c5326c: 943ff134    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53270: aa0003f9    	mov	x25, x0
101c53274: a9462349    	ldp	x9, x8, [x26, #0x60]
101c53278: b40000a8    	cbz	x8, 0x101c5328c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1318>
101c5327c: 9100210a    	add	x10, x8, #0x8
101c53280: 5280002b    	mov	w11, #0x1               ; =1
101c53284: f82b014a    	ldadd	x11, x10, [x10]
101c53288: f940027a    	ldr	x26, [x19]
101c5328c: 9100438a    	add	x10, x28, #0x10
101c53290: a900272a    	stp	x10, x9, [x25]
101c53294: 52842ca9    	mov	w9, #0x2165             ; =8549
101c53298: 79004329    	strh	w9, [x25, #0x20]
101c5329c: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c532a0: f9475d29    	ldr	x9, [x9, #0xeb8]
101c532a4: a9012728    	stp	x8, x9, [x25, #0x10]
101c532a8: 39008b3f    	strb	wzr, [x25, #0x22]
101c532ac: 52800148    	mov	w8, #0xa                ; =10
101c532b0: 3900bf28    	strb	w8, [x25, #0x2f]
101c532b4: 52800400    	mov	w0, #0x20               ; =32
101c532b8: 943ff121    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c532bc: aa0003f7    	mov	x23, x0
101c532c0: f900b3f8    	str	x24, [sp, #0x160]
101c532c4: f900ebf9    	str	x25, [sp, #0x1d0]
101c532c8: f94017e8    	ldr	x8, [sp, #0x28]
101c532cc: 39400108    	ldrb	w8, [x8]
101c532d0: f9419b4a    	ldr	x10, [x26, #0x330]
101c532d4: f9419f49    	ldr	x9, [x26, #0x338]
101c532d8: a91e27ea    	stp	x10, x9, [sp, #0x1e0]
101c532dc: b4000089    	cbz	x9, 0x101c532ec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1378>
101c532e0: 91002129    	add	x9, x9, #0x8
101c532e4: 5280002a    	mov	w10, #0x1               ; =1
101c532e8: f82a0129    	ldadd	x10, x9, [x9]
101c532ec: 7100011f    	cmp	w8, #0x0
101c532f0: 1a9f07e5    	cset	w5, ne
101c532f4: 910583e1    	add	x1, sp, #0x160
101c532f8: 910743e2    	add	x2, sp, #0x1d0
101c532fc: 910783e6    	add	x6, sp, #0x1e0
101c53300: aa1703e0    	mov	x0, x23
101c53304: aa1503e3    	mov	x3, x21
101c53308: 52801304    	mov	w4, #0x98               ; =152
101c5330c: 97f3177d    	bl	0x101919100 <wxime::data::dict::UserStrokesDict::UserStrokesDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, bool, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>)>
101c53310: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c53314: b4000178    	cbz	x24, 0x101c53340 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x13cc>
101c53318: 91002308    	add	x8, x24, #0x8
101c5331c: 92800009    	mov	x9, #-0x1               ; =-1
101c53320: f8e90108    	ldaddal	x9, x8, [x8]
101c53324: b50000e8    	cbnz	x8, 0x101c53340 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x13cc>
101c53328: f9400308    	ldr	x8, [x24]
101c5332c: f9400908    	ldr	x8, [x8, #0x10]
101c53330: aa1803e0    	mov	x0, x24
101c53334: d63f0100    	blr	x8
101c53338: aa1803e0    	mov	x0, x24
101c5333c: 943fefe3    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53340: f940ebe0    	ldr	x0, [sp, #0x1d0]
101c53344: f900ebff    	str	xzr, [sp, #0x1d0]
101c53348: b4000080    	cbz	x0, 0x101c53358 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x13e4>
101c5334c: f9400008    	ldr	x8, [x0]
101c53350: f9400508    	ldr	x8, [x8, #0x8]
101c53354: d63f0100    	blr	x8
101c53358: f940b3e0    	ldr	x0, [sp, #0x160]
101c5335c: f900b3ff    	str	xzr, [sp, #0x160]
101c53360: b4000080    	cbz	x0, 0x101c53370 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x13fc>
101c53364: f9400008    	ldr	x8, [x0]
101c53368: f9400508    	ldr	x8, [x8, #0x8]
101c5336c: d63f0100    	blr	x8
101c53370: f9400268    	ldr	x8, [x19]
101c53374: f9400108    	ldr	x8, [x8]
101c53378: 9100c100    	add	x0, x8, #0x30
101c5337c: f90057f7    	str	x23, [sp, #0xa8]
101c53380: 9102a3e1    	add	x1, sp, #0xa8
101c53384: 529fffe2    	mov	w2, #0xffff             ; =65535
101c53388: 97ffb0ef    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c5338c: f94057e0    	ldr	x0, [sp, #0xa8]
101c53390: f90057ff    	str	xzr, [sp, #0xa8]
101c53394: b4000080    	cbz	x0, 0x101c533a4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1430>
101c53398: f9400008    	ldr	x8, [x0]
101c5339c: f9400508    	ldr	x8, [x8, #0x8]
101c533a0: d63f0100    	blr	x8
101c533a4: f9400276    	ldr	x22, [x19]
101c533a8: 52800600    	mov	w0, #0x30               ; =48
101c533ac: 943ff0e4    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c533b0: aa0003f8    	mov	x24, x0
101c533b4: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c533b8: b4000088    	cbz	x8, 0x101c533c8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1454>
101c533bc: 9100210a    	add	x10, x8, #0x8
101c533c0: 5280002b    	mov	w11, #0x1               ; =1
101c533c4: f82b014a    	ldadd	x11, x10, [x10]
101c533c8: 9100438a    	add	x10, x28, #0x10
101c533cc: a900270a    	stp	x10, x9, [x24]
101c533d0: f9000b08    	str	x8, [x24, #0x10]
101c533d4: 528ea428    	mov	w8, #0x7521             ; =29985
101c533d8: 72acabe8    	movk	w8, #0x655f, lsl #16
101c533dc: b9001b08    	str	w8, [x24, #0x18]
101c533e0: 528beca8    	mov	w8, #0x5f65             ; =24421
101c533e4: 72a42e68    	movk	w8, #0x2173, lsl #16
101c533e8: b801b308    	stur	w8, [x24, #0x1b]
101c533ec: 39007f1f    	strb	wzr, [x24, #0x1f]
101c533f0: 528000e8    	mov	w8, #0x7                ; =7
101c533f4: 3900bf08    	strb	w8, [x24, #0x2f]
101c533f8: 52800400    	mov	w0, #0x20               ; =32
101c533fc: 943ff0d0    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53400: aa0003f7    	mov	x23, x0
101c53404: f900f3f8    	str	x24, [sp, #0x1e0]
101c53408: 910783e1    	add	x1, sp, #0x1e0
101c5340c: aa1503e2    	mov	x2, x21
101c53410: 52801363    	mov	w3, #0x9b               ; =155
101c53414: 52800004    	mov	w4, #0x0                ; =0
101c53418: 97f33602    	bl	0x101920c20 <wxime::data::dict::UserEmojiSelectDict::UserEmojiSelectDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, bool)>
101c5341c: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c53420: f900f3ff    	str	xzr, [sp, #0x1e0]
101c53424: b4000080    	cbz	x0, 0x101c53434 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x14c0>
101c53428: f9400008    	ldr	x8, [x0]
101c5342c: f9400508    	ldr	x8, [x8, #0x8]
101c53430: d63f0100    	blr	x8
101c53434: f9400268    	ldr	x8, [x19]
101c53438: f9400108    	ldr	x8, [x8]
101c5343c: 9100c100    	add	x0, x8, #0x30
101c53440: f90053f7    	str	x23, [sp, #0xa0]
101c53444: 910283e1    	add	x1, sp, #0xa0
101c53448: 529fffe2    	mov	w2, #0xffff             ; =65535
101c5344c: 97ffb0be    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c53450: f94053e0    	ldr	x0, [sp, #0xa0]
101c53454: f90053ff    	str	xzr, [sp, #0xa0]
101c53458: b4000080    	cbz	x0, 0x101c53468 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x14f4>
101c5345c: f9400008    	ldr	x8, [x0]
101c53460: f9400508    	ldr	x8, [x8, #0x8]
101c53464: d63f0100    	blr	x8
101c53468: f9400276    	ldr	x22, [x19]
101c5346c: 52800600    	mov	w0, #0x30               ; =48
101c53470: 943ff0b3    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53474: aa0003f8    	mov	x24, x0
101c53478: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c5347c: b40000a8    	cbz	x8, 0x101c53490 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x151c>
101c53480: 9100210a    	add	x10, x8, #0x8
101c53484: 5280002b    	mov	w11, #0x1               ; =1
101c53488: f82b014a    	ldadd	x11, x10, [x10]
101c5348c: f9400276    	ldr	x22, [x19]
101c53490: 9100438a    	add	x10, x28, #0x10
101c53494: a900270a    	stp	x10, x9, [x24]
101c53498: 52800429    	mov	w9, #0x21               ; =33
101c5349c: 79004309    	strh	w9, [x24, #0x20]
101c534a0: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c534a4: f9476529    	ldr	x9, [x9, #0xec8]
101c534a8: a9012708    	stp	x8, x9, [x24, #0x10]
101c534ac: 52800128    	mov	w8, #0x9                ; =9
101c534b0: 3900bf08    	strb	w8, [x24, #0x2f]
101c534b4: 52800400    	mov	w0, #0x20               ; =32
101c534b8: 943ff0a1    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c534bc: aa0003f7    	mov	x23, x0
101c534c0: f900b3f8    	str	x24, [sp, #0x160]
101c534c4: f9419ac9    	ldr	x9, [x22, #0x330]
101c534c8: f9419ec8    	ldr	x8, [x22, #0x338]
101c534cc: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c534d0: b4000088    	cbz	x8, 0x101c534e0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x156c>
101c534d4: 91002108    	add	x8, x8, #0x8
101c534d8: 52800029    	mov	w9, #0x1                ; =1
101c534dc: f8290108    	ldadd	x9, x8, [x8]
101c534e0: 910583e1    	add	x1, sp, #0x160
101c534e4: 910783e4    	add	x4, sp, #0x1e0
101c534e8: aa1703e0    	mov	x0, x23
101c534ec: aa1503e2    	mov	x2, x21
101c534f0: 52801383    	mov	w3, #0x9c               ; =156
101c534f4: 97f2af99    	bl	0x1018ff358 <wxime::data::dict::UserSingleCnSelectDict::UserSingleCnSelectDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>)>
101c534f8: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c534fc: b4000178    	cbz	x24, 0x101c53528 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x15b4>
101c53500: 91002308    	add	x8, x24, #0x8
101c53504: 92800009    	mov	x9, #-0x1               ; =-1
101c53508: f8e90108    	ldaddal	x9, x8, [x8]
101c5350c: b50000e8    	cbnz	x8, 0x101c53528 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x15b4>
101c53510: f9400308    	ldr	x8, [x24]
101c53514: f9400908    	ldr	x8, [x8, #0x10]
101c53518: aa1803e0    	mov	x0, x24
101c5351c: d63f0100    	blr	x8
101c53520: aa1803e0    	mov	x0, x24
101c53524: 943fef69    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53528: f940b3e0    	ldr	x0, [sp, #0x160]
101c5352c: f900b3ff    	str	xzr, [sp, #0x160]
101c53530: b4000080    	cbz	x0, 0x101c53540 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x15cc>
101c53534: f9400008    	ldr	x8, [x0]
101c53538: f9400508    	ldr	x8, [x8, #0x8]
101c5353c: d63f0100    	blr	x8
101c53540: f9400268    	ldr	x8, [x19]
101c53544: f9400108    	ldr	x8, [x8]
101c53548: 9100c100    	add	x0, x8, #0x30
101c5354c: f9004ff7    	str	x23, [sp, #0x98]
101c53550: 910263e1    	add	x1, sp, #0x98
101c53554: 529fffe2    	mov	w2, #0xffff             ; =65535
101c53558: 97ffb07b    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c5355c: f9404fe0    	ldr	x0, [sp, #0x98]
101c53560: f9004fff    	str	xzr, [sp, #0x98]
101c53564: b4000080    	cbz	x0, 0x101c53574 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1600>
101c53568: f9400008    	ldr	x8, [x0]
101c5356c: f9400508    	ldr	x8, [x8, #0x8]
101c53570: d63f0100    	blr	x8
101c53574: f9400268    	ldr	x8, [x19]
101c53578: f9401900    	ldr	x0, [x8, #0x30]
101c5357c: 910783e8    	add	x8, sp, #0x1e0
101c53580: 97ece154    	bl	0x10178bad0 <wxime::data::HyperParams::AssociateParams() const>
101c53584: b94203e8    	ldr	w8, [sp, #0x200]
101c53588: 7101011f    	cmp	w8, #0x40
101c5358c: 540042c9    	b.ls	0x101c53de4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e70>
101c53590: f940fbe8    	ldr	x8, [sp, #0x1f0]
101c53594: 39402108    	ldrb	w8, [x8, #0x8]
101c53598: 36004268    	tbz	w8, #0x0, 0x101c53de4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e70>
101c5359c: f9400276    	ldr	x22, [x19]
101c535a0: 52800600    	mov	w0, #0x30               ; =48
101c535a4: 943ff066    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c535a8: aa0003f8    	mov	x24, x0
101c535ac: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c535b0: b4000088    	cbz	x8, 0x101c535c0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x164c>
101c535b4: 9100210a    	add	x10, x8, #0x8
101c535b8: 5280002b    	mov	w11, #0x1               ; =1
101c535bc: f82b014a    	ldadd	x11, x10, [x10]
101c535c0: 9100438a    	add	x10, x28, #0x10
101c535c4: a900270a    	stp	x10, x9, [x24]
101c535c8: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c535cc: 913b6129    	add	x9, x9, #0xed8 ; !user_bigram2!
101c535d0: f940012a    	ldr	x10, [x9]
101c535d4: a9012b08    	stp	x8, x10, [x24, #0x10]
101c535d8: f8406128    	ldur	x8, [x9, #0x6]
101c535dc: f801e308    	stur	x8, [x24, #0x1e]
101c535e0: 39009b1f    	strb	wzr, [x24, #0x26]
101c535e4: 528001c8    	mov	w8, #0xe                ; =14
101c535e8: 3900bf08    	strb	w8, [x24, #0x2f]
101c535ec: f9401296    	ldr	x22, [x20, #0x20]
101c535f0: f94006c0    	ldr	x0, [x22, #0x8]
101c535f4: b5000080    	cbnz	x0, 0x101c53604 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1690>
101c535f8: 940d9c33    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c535fc: f90006c0    	str	x0, [x22, #0x8]
101c53600: b400d360    	cbz	x0, 0x101c5506c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x30f8>
101c53604: 940d9c35    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c53608: aa0003f9    	mov	x25, x0
101c5360c: f9400276    	ldr	x22, [x19]
101c53610: 52800400    	mov	w0, #0x20               ; =32
101c53614: 943ff04a    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53618: aa0003f7    	mov	x23, x0
101c5361c: f900b3f8    	str	x24, [sp, #0x160]
101c53620: f9419ac9    	ldr	x9, [x22, #0x330]
101c53624: f9419ec8    	ldr	x8, [x22, #0x338]
101c53628: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c5362c: b4000088    	cbz	x8, 0x101c5363c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x16c8>
101c53630: 91002108    	add	x8, x8, #0x8
101c53634: 52800029    	mov	w9, #0x1                ; =1
101c53638: f8290108    	ldadd	x9, x8, [x8]
101c5363c: 910583e1    	add	x1, sp, #0x160
101c53640: 910783e5    	add	x5, sp, #0x1e0
101c53644: aa1703e0    	mov	x0, x23
101c53648: aa1503e2    	mov	x2, x21
101c5364c: 52801063    	mov	w3, #0x83               ; =131
101c53650: aa1903e4    	mov	x4, x25
101c53654: 97ef2feb    	bl	0x10181f600 <wxime::data::dict::UserBigramDict::UserBigramDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, asio::io_context&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>)>
101c53658: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c5365c: b4000178    	cbz	x24, 0x101c53688 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1714>
101c53660: 91002308    	add	x8, x24, #0x8
101c53664: 92800009    	mov	x9, #-0x1               ; =-1
101c53668: f8e90108    	ldaddal	x9, x8, [x8]
101c5366c: b50000e8    	cbnz	x8, 0x101c53688 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1714>
101c53670: f9400308    	ldr	x8, [x24]
101c53674: f9400908    	ldr	x8, [x8, #0x10]
101c53678: aa1803e0    	mov	x0, x24
101c5367c: d63f0100    	blr	x8
101c53680: aa1803e0    	mov	x0, x24
101c53684: 943fef11    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53688: f940b3e0    	ldr	x0, [sp, #0x160]
101c5368c: f900b3ff    	str	xzr, [sp, #0x160]
101c53690: b4000080    	cbz	x0, 0x101c536a0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x172c>
101c53694: f9400008    	ldr	x8, [x0]
101c53698: f9400508    	ldr	x8, [x8, #0x8]
101c5369c: d63f0100    	blr	x8
101c536a0: f9400276    	ldr	x22, [x19]
101c536a4: 52800600    	mov	w0, #0x30               ; =48
101c536a8: 943ff025    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c536ac: aa0003f9    	mov	x25, x0
101c536b0: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c536b4: b4000088    	cbz	x8, 0x101c536c4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1750>
101c536b8: 9100210a    	add	x10, x8, #0x8
101c536bc: 5280002b    	mov	w11, #0x1               ; =1
101c536c0: f82b014a    	ldadd	x11, x10, [x10]
101c536c4: 9100438a    	add	x10, x28, #0x10
101c536c8: a900272a    	stp	x10, x9, [x25]
101c536cc: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c536d0: 913ba129    	add	x9, x9, #0xee8 ; !user_prefix2!
101c536d4: f940012a    	ldr	x10, [x9]
101c536d8: a9012b28    	stp	x8, x10, [x25, #0x10]
101c536dc: f8406128    	ldur	x8, [x9, #0x6]
101c536e0: f801e328    	stur	x8, [x25, #0x1e]
101c536e4: 39009b3f    	strb	wzr, [x25, #0x26]
101c536e8: 528001c8    	mov	w8, #0xe                ; =14
101c536ec: 3900bf28    	strb	w8, [x25, #0x2f]
101c536f0: f9401296    	ldr	x22, [x20, #0x20]
101c536f4: f94006c0    	ldr	x0, [x22, #0x8]
101c536f8: b5000080    	cbnz	x0, 0x101c53708 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1794>
101c536fc: 940d9bf2    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c53700: f90006c0    	str	x0, [x22, #0x8]
101c53704: b400cce0    	cbz	x0, 0x101c550a0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x312c>
101c53708: 940d9bf4    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c5370c: aa0003fa    	mov	x26, x0
101c53710: f9400276    	ldr	x22, [x19]
101c53714: 52800400    	mov	w0, #0x20               ; =32
101c53718: 943ff009    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5371c: aa0003f8    	mov	x24, x0
101c53720: f900b3f9    	str	x25, [sp, #0x160]
101c53724: f9419ac9    	ldr	x9, [x22, #0x330]
101c53728: f9419ec8    	ldr	x8, [x22, #0x338]
101c5372c: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c53730: b4000088    	cbz	x8, 0x101c53740 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x17cc>
101c53734: 91002108    	add	x8, x8, #0x8
101c53738: 52800029    	mov	w9, #0x1                ; =1
101c5373c: f8290108    	ldadd	x9, x8, [x8]
101c53740: 910583e1    	add	x1, sp, #0x160
101c53744: 910783e5    	add	x5, sp, #0x1e0
101c53748: aa1803e0    	mov	x0, x24
101c5374c: aa1503e2    	mov	x2, x21
101c53750: 528010a3    	mov	w3, #0x85               ; =133
101c53754: aa1a03e4    	mov	x4, x26
101c53758: 97f093e8    	bl	0x1018786f8 <wxime::data::dict::UserPrefixDict::UserPrefixDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, asio::io_context&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>)>
101c5375c: f940f7f9    	ldr	x25, [sp, #0x1e8]
101c53760: b4000179    	cbz	x25, 0x101c5378c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1818>
101c53764: 91002328    	add	x8, x25, #0x8
101c53768: 92800009    	mov	x9, #-0x1               ; =-1
101c5376c: f8e90108    	ldaddal	x9, x8, [x8]
101c53770: b50000e8    	cbnz	x8, 0x101c5378c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1818>
101c53774: f9400328    	ldr	x8, [x25]
101c53778: f9400908    	ldr	x8, [x8, #0x10]
101c5377c: aa1903e0    	mov	x0, x25
101c53780: d63f0100    	blr	x8
101c53784: aa1903e0    	mov	x0, x25
101c53788: 943feed0    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c5378c: f940b3e0    	ldr	x0, [sp, #0x160]
101c53790: f900b3ff    	str	xzr, [sp, #0x160]
101c53794: b4000080    	cbz	x0, 0x101c537a4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1830>
101c53798: f9400008    	ldr	x8, [x0]
101c5379c: f9400508    	ldr	x8, [x8, #0x8]
101c537a0: d63f0100    	blr	x8
101c537a4: f9400268    	ldr	x8, [x19]
101c537a8: f9400108    	ldr	x8, [x8]
101c537ac: 9100c100    	add	x0, x8, #0x30
101c537b0: f9004bf7    	str	x23, [sp, #0x90]
101c537b4: 910243e1    	add	x1, sp, #0x90
101c537b8: 529fffe2    	mov	w2, #0xffff             ; =65535
101c537bc: 97ffafe2    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c537c0: f9404be0    	ldr	x0, [sp, #0x90]
101c537c4: f9004bff    	str	xzr, [sp, #0x90]
101c537c8: b4000080    	cbz	x0, 0x101c537d8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1864>
101c537cc: f9400008    	ldr	x8, [x0]
101c537d0: f9400508    	ldr	x8, [x8, #0x8]
101c537d4: d63f0100    	blr	x8
101c537d8: f9400268    	ldr	x8, [x19]
101c537dc: f9400108    	ldr	x8, [x8]
101c537e0: 9100c100    	add	x0, x8, #0x30
101c537e4: f90047f8    	str	x24, [sp, #0x88]
101c537e8: 910223e1    	add	x1, sp, #0x88
101c537ec: 529fffe2    	mov	w2, #0xffff             ; =65535
101c537f0: 97ffafd5    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c537f4: f94047e0    	ldr	x0, [sp, #0x88]
101c537f8: f90047ff    	str	xzr, [sp, #0x88]
101c537fc: b4000080    	cbz	x0, 0x101c5380c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1898>
101c53800: f9400008    	ldr	x8, [x0]
101c53804: f9400508    	ldr	x8, [x8, #0x8]
101c53808: d63f0100    	blr	x8
101c5380c: f9400276    	ldr	x22, [x19]
101c53810: 52800600    	mov	w0, #0x30               ; =48
101c53814: 943fefca    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53818: aa0003f7    	mov	x23, x0
101c5381c: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c53820: b4000088    	cbz	x8, 0x101c53830 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x18bc>
101c53824: 9100210a    	add	x10, x8, #0x8
101c53828: 5280002b    	mov	w11, #0x1               ; =1
101c5382c: f82b014a    	ldadd	x11, x10, [x10]
101c53830: 9100438a    	add	x10, x28, #0x10
101c53834: a90026ea    	stp	x10, x9, [x23]
101c53838: 528e6c29    	mov	w9, #0x7361             ; =29537
101c5383c: 72a42d09    	movk	w9, #0x2168, lsl #16
101c53840: b801f2e9    	stur	w9, [x23, #0x1f]
101c53844: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53848: f9477d29    	ldr	x9, [x9, #0xef8]
101c5384c: a90126e8    	stp	x8, x9, [x23, #0x10]
101c53850: 39008eff    	strb	wzr, [x23, #0x23]
101c53854: 52800168    	mov	w8, #0xb                ; =11
101c53858: 3900bee8    	strb	w8, [x23, #0x2f]
101c5385c: f9401296    	ldr	x22, [x20, #0x20]
101c53860: f94006c0    	ldr	x0, [x22, #0x8]
101c53864: b5000080    	cbnz	x0, 0x101c53874 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1900>
101c53868: 940d9b97    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c5386c: f90006c0    	str	x0, [x22, #0x8]
101c53870: b400c320    	cbz	x0, 0x101c550d4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x3160>
101c53874: 940d9b99    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c53878: aa0003f9    	mov	x25, x0
101c5387c: 52800400    	mov	w0, #0x20               ; =32
101c53880: 943fefaf    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53884: aa0003f8    	mov	x24, x0
101c53888: f900f3f7    	str	x23, [sp, #0x1e0]
101c5388c: 910783e1    	add	x1, sp, #0x1e0
101c53890: aa1503e2    	mov	x2, x21
101c53894: 52801263    	mov	w3, #0x93               ; =147
101c53898: aa1903e4    	mov	x4, x25
101c5389c: 97f2058c    	bl	0x1018d4ecc <wxime::data::dict::UserAssociationHashDict::UserAssociationHashDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, asio::io_context&)>
101c538a0: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c538a4: f900f3ff    	str	xzr, [sp, #0x1e0]
101c538a8: b4000080    	cbz	x0, 0x101c538b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1944>
101c538ac: f9400008    	ldr	x8, [x0]
101c538b0: f9400508    	ldr	x8, [x8, #0x8]
101c538b4: d63f0100    	blr	x8
101c538b8: f9400268    	ldr	x8, [x19]
101c538bc: f9400108    	ldr	x8, [x8]
101c538c0: 9100c100    	add	x0, x8, #0x30
101c538c4: f90043f8    	str	x24, [sp, #0x80]
101c538c8: 910203e1    	add	x1, sp, #0x80
101c538cc: 529fffe2    	mov	w2, #0xffff             ; =65535
101c538d0: 97ffaf9d    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c538d4: f94043e0    	ldr	x0, [sp, #0x80]
101c538d8: f90043ff    	str	xzr, [sp, #0x80]
101c538dc: b4000080    	cbz	x0, 0x101c538ec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1978>
101c538e0: f9400008    	ldr	x8, [x0]
101c538e4: f9400508    	ldr	x8, [x8, #0x8]
101c538e8: d63f0100    	blr	x8
101c538ec: f9400268    	ldr	x8, [x19]
101c538f0: f9400100    	ldr	x0, [x8]
101c538f4: f9400008    	ldr	x8, [x0]
101c538f8: f942e509    	ldr	x9, [x8, #0x5c8]
101c538fc: 910783e8    	add	x8, sp, #0x1e0
101c53900: 52801261    	mov	w1, #0x93               ; =147
101c53904: d63f0120    	blr	x9
101c53908: b000aa08    	adrp	x8, 0x103194000 <typeinfo name for wxime::engine::resources::ResourceMgr::Impl::AddCellDict(char const*, unsigned int, _wxime_fd*)::'lambda'(unsigned short)+0x4a>
101c5390c: fd463500    	ldr	d0, [x8, #0xc68]
101c53910: fd00b3e0    	str	d0, [sp, #0x160]
101c53914: 52800208    	mov	w8, #0x10               ; =16
101c53918: b9016be8    	str	w8, [sp, #0x168]
101c5391c: 390743ff    	strb	wzr, [sp, #0x1d0]
101c53920: 52800500    	mov	w0, #0x28               ; =40
101c53924: 943fef86    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53928: aa0003f7    	mov	x23, x0
101c5392c: 910783e1    	add	x1, sp, #0x1e0
101c53930: 910583e2    	add	x2, sp, #0x160
101c53934: 910743e3    	add	x3, sp, #0x1d0
101c53938: 9400428d    	bl	0x101c6436c <std::__1::__shared_ptr_emplace<wxime::data::UserHashHandler, std::__1::allocator<wxime::data::UserHashHandler>>::__shared_ptr_emplace[abi:ne180100]<std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::data::UserHashHandler::Option, bool, std::__1::allocator<wxime::data::UserHashHandler>, 0>(std::__1::allocator<wxime::data::UserHashHandler>, std::__1::shared_ptr<wxime::data::dict::IDict>&&, wxime::data::UserHashHandler::Option&&, bool&&)>
101c5393c: 910062e8    	add	x8, x23, #0x18
101c53940: f9400269    	ldr	x9, [x19]
101c53944: f901c928    	str	x8, [x9, #0x390]
101c53948: f941cd38    	ldr	x24, [x9, #0x398]
101c5394c: f901cd37    	str	x23, [x9, #0x398]
101c53950: b4000178    	cbz	x24, 0x101c5397c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1a08>
101c53954: 91002308    	add	x8, x24, #0x8
101c53958: 92800009    	mov	x9, #-0x1               ; =-1
101c5395c: f8e90108    	ldaddal	x9, x8, [x8]
101c53960: b50000e8    	cbnz	x8, 0x101c5397c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1a08>
101c53964: f9400308    	ldr	x8, [x24]
101c53968: f9400908    	ldr	x8, [x8, #0x10]
101c5396c: aa1803e0    	mov	x0, x24
101c53970: d63f0100    	blr	x8
101c53974: aa1803e0    	mov	x0, x24
101c53978: 943fee54    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c5397c: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c53980: b4000177    	cbz	x23, 0x101c539ac <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1a38>
101c53984: 910022e8    	add	x8, x23, #0x8
101c53988: 92800009    	mov	x9, #-0x1               ; =-1
101c5398c: f8e90108    	ldaddal	x9, x8, [x8]
101c53990: b50000e8    	cbnz	x8, 0x101c539ac <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1a38>
101c53994: f94002e8    	ldr	x8, [x23]
101c53998: f9400908    	ldr	x8, [x8, #0x10]
101c5399c: aa1703e0    	mov	x0, x23
101c539a0: d63f0100    	blr	x8
101c539a4: aa1703e0    	mov	x0, x23
101c539a8: 943fee48    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c539ac: f9400268    	ldr	x8, [x19]
101c539b0: f9401900    	ldr	x0, [x8, #0x30]
101c539b4: 910783e8    	add	x8, sp, #0x1e0
101c539b8: 97ece046    	bl	0x10178bad0 <wxime::data::HyperParams::AssociateParams() const>
101c539bc: b94203e8    	ldr	w8, [sp, #0x200]
101c539c0: 7101111f    	cmp	w8, #0x44
101c539c4: 54000769    	b.ls	0x101c53ab0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b3c>
101c539c8: f940fbe8    	ldr	x8, [sp, #0x1f0]
101c539cc: 39402108    	ldrb	w8, [x8, #0x8]
101c539d0: 36200708    	tbz	w8, #0x4, 0x101c53ab0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b3c>
101c539d4: f9400276    	ldr	x22, [x19]
101c539d8: 52800600    	mov	w0, #0x30               ; =48
101c539dc: 943fef58    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c539e0: aa0003f8    	mov	x24, x0
101c539e4: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c539e8: b4000088    	cbz	x8, 0x101c539f8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1a84>
101c539ec: 9100210a    	add	x10, x8, #0x8
101c539f0: 5280002b    	mov	w11, #0x1               ; =1
101c539f4: f82b014a    	ldadd	x11, x10, [x10]
101c539f8: 9100438a    	add	x10, x28, #0x10
101c539fc: a900270a    	stp	x10, x9, [x24]
101c53a00: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53a04: 913c2129    	add	x9, x9, #0xf08 ; !user_profile!
101c53a08: f940012a    	ldr	x10, [x9]
101c53a0c: a9012b08    	stp	x8, x10, [x24, #0x10]
101c53a10: f8406128    	ldur	x8, [x9, #0x6]
101c53a14: f801e308    	stur	x8, [x24, #0x1e]
101c53a18: 39009b1f    	strb	wzr, [x24, #0x26]
101c53a1c: 528001c8    	mov	w8, #0xe                ; =14
101c53a20: 3900bf08    	strb	w8, [x24, #0x2f]
101c53a24: 52800500    	mov	w0, #0x28               ; =40
101c53a28: 943fef45    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53a2c: aa0003f7    	mov	x23, x0
101c53a30: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c53a34: 9000bfc8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c53a38: 911fa108    	add	x8, x8, #0x7e8
101c53a3c: f9000008    	str	x8, [x0]
101c53a40: 91006019    	add	x25, x0, #0x18
101c53a44: f900f3f8    	str	x24, [sp, #0x1e0]
101c53a48: 910783e1    	add	x1, sp, #0x1e0
101c53a4c: aa1903e0    	mov	x0, x25
101c53a50: aa1503e2    	mov	x2, x21
101c53a54: 52800003    	mov	w3, #0x0                ; =0
101c53a58: 97ff9ad3    	bl	0x101c3a5a4 <wxime::engine::session::UserAssociationProfileProcessor::UserAssociationProfileProcessor(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, bool)>
101c53a5c: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c53a60: f900f3ff    	str	xzr, [sp, #0x1e0]
101c53a64: b4000080    	cbz	x0, 0x101c53a74 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b00>
101c53a68: f9400008    	ldr	x8, [x0]
101c53a6c: f9400508    	ldr	x8, [x8, #0x8]
101c53a70: d63f0100    	blr	x8
101c53a74: f9400268    	ldr	x8, [x19]
101c53a78: f9017919    	str	x25, [x8, #0x2f0]
101c53a7c: f9417d18    	ldr	x24, [x8, #0x2f8]
101c53a80: f9017d17    	str	x23, [x8, #0x2f8]
101c53a84: b4000178    	cbz	x24, 0x101c53ab0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b3c>
101c53a88: 91002308    	add	x8, x24, #0x8
101c53a8c: 92800009    	mov	x9, #-0x1               ; =-1
101c53a90: f8e90108    	ldaddal	x9, x8, [x8]
101c53a94: b50000e8    	cbnz	x8, 0x101c53ab0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b3c>
101c53a98: f9400308    	ldr	x8, [x24]
101c53a9c: f9400908    	ldr	x8, [x8, #0x10]
101c53aa0: aa1803e0    	mov	x0, x24
101c53aa4: d63f0100    	blr	x8
101c53aa8: aa1803e0    	mov	x0, x24
101c53aac: 943fee07    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53ab0: f9400276    	ldr	x22, [x19]
101c53ab4: 52800600    	mov	w0, #0x30               ; =48
101c53ab8: 943fef21    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53abc: aa0003f8    	mov	x24, x0
101c53ac0: 52800320    	mov	w0, #0x19               ; =25
101c53ac4: 943fef1e    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53ac8: 90009b08    	adrp	x8, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53acc: 913c5d08    	add	x8, x8, #0xf17 ; !user_prefix_and_emoji!
101c53ad0: 3dc00100    	ldr	q0, [x8]
101c53ad4: 3d800000    	str	q0, [x0]
101c53ad8: f840f108    	ldur	x8, [x8, #0xf]
101c53adc: f800f008    	stur	x8, [x0, #0xf]
101c53ae0: 39005c1f    	strb	wzr, [x0, #0x17]
101c53ae4: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c53ae8: b4000088    	cbz	x8, 0x101c53af8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1b84>
101c53aec: 9100210a    	add	x10, x8, #0x8 ; efix_and_emoji!
101c53af0: 5280002b    	mov	w11, #0x1               ; =1
101c53af4: f82b014a    	ldadd	x11, x10, [x10]
101c53af8: 9100438a    	add	x10, x28, #0x10
101c53afc: a900270a    	stp	x10, x9, [x24]
101c53b00: a9010308    	stp	x8, x0, [x24, #0x10]
101c53b04: f000a648    	adrp	x8, 0x10311e000 <typeinfo name for xnet::Property+0xc>
101c53b08: 3dc2c100    	ldr	q0, [x8, #0xb00]
101c53b0c: 3d800b00    	str	q0, [x24, #0x20]
101c53b10: f9401296    	ldr	x22, [x20, #0x20]
101c53b14: f94006c0    	ldr	x0, [x22, #0x8]
101c53b18: b5000080    	cbnz	x0, 0x101c53b28 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1bb4>
101c53b1c: 940d9aea    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c53b20: f90006c0    	str	x0, [x22, #0x8]
101c53b24: b400af20    	cbz	x0, 0x101c55108 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x3194>
101c53b28: 940d9aec    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c53b2c: aa0003f9    	mov	x25, x0
101c53b30: f9400276    	ldr	x22, [x19]
101c53b34: 52800400    	mov	w0, #0x20               ; =32
101c53b38: 943fef01    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53b3c: aa0003f7    	mov	x23, x0
101c53b40: f900b3f8    	str	x24, [sp, #0x160]
101c53b44: f9419ac9    	ldr	x9, [x22, #0x330]
101c53b48: f9419ec8    	ldr	x8, [x22, #0x338]
101c53b4c: a91e23e9    	stp	x9, x8, [sp, #0x1e0]
101c53b50: b4000088    	cbz	x8, 0x101c53b60 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1bec>
101c53b54: 91002108    	add	x8, x8, #0x8
101c53b58: 52800029    	mov	w9, #0x1                ; =1
101c53b5c: f8290108    	ldadd	x9, x8, [x8]
101c53b60: 910583e1    	add	x1, sp, #0x160
101c53b64: 910783e5    	add	x5, sp, #0x1e0
101c53b68: aa1703e0    	mov	x0, x23
101c53b6c: aa1503e2    	mov	x2, x21
101c53b70: 52801143    	mov	w3, #0x8a               ; =138
101c53b74: aa1903e4    	mov	x4, x25
101c53b78: 52800306    	mov	w6, #0x18               ; =24
101c53b7c: 97f10b12    	bl	0x1018967c4 <wxime::data::dict::UserPrefixAndEmojiDict::UserPrefixAndEmojiDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, asio::io_context&, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, int)>
101c53b80: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c53b84: b4000178    	cbz	x24, 0x101c53bb0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1c3c>
101c53b88: 91002308    	add	x8, x24, #0x8
101c53b8c: 92800009    	mov	x9, #-0x1               ; =-1
101c53b90: f8e90108    	ldaddal	x9, x8, [x8]
101c53b94: b50000e8    	cbnz	x8, 0x101c53bb0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1c3c>
101c53b98: f9400308    	ldr	x8, [x24]
101c53b9c: f9400908    	ldr	x8, [x8, #0x10]
101c53ba0: aa1803e0    	mov	x0, x24
101c53ba4: d63f0100    	blr	x8
101c53ba8: aa1803e0    	mov	x0, x24
101c53bac: 943fedc7    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53bb0: f940b3e0    	ldr	x0, [sp, #0x160]
101c53bb4: f900b3ff    	str	xzr, [sp, #0x160]
101c53bb8: b4000080    	cbz	x0, 0x101c53bc8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1c54>
101c53bbc: f9400008    	ldr	x8, [x0]
101c53bc0: f9400508    	ldr	x8, [x8, #0x8]
101c53bc4: d63f0100    	blr	x8
101c53bc8: f9400276    	ldr	x22, [x19]
101c53bcc: 52800600    	mov	w0, #0x30               ; =48
101c53bd0: 943feedb    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53bd4: aa0003f9    	mov	x25, x0
101c53bd8: a94622c9    	ldp	x9, x8, [x22, #0x60]
101c53bdc: b4000088    	cbz	x8, 0x101c53bec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1c78>
101c53be0: 9100210a    	add	x10, x8, #0x8
101c53be4: 5280002b    	mov	w11, #0x1               ; =1
101c53be8: f82b014a    	ldadd	x11, x10, [x10]
101c53bec: 9100438a    	add	x10, x28, #0x10
101c53bf0: a900272a    	stp	x10, x9, [x25]
101c53bf4: f9000b28    	str	x8, [x25, #0x10]
101c53bf8: 52842648    	mov	w8, #0x2132             ; =8498
101c53bfc: 90009b09    	adrp	x9, 0x102fb3000 <wxime::base::kWXIME_CONFIG+0x48dc0>
101c53c00: 913cc129    	add	x9, x9, #0xf30 ; !user_emoji_freq2!
101c53c04: 79005328    	strh	w8, [x25, #0x28]
101c53c08: 3dc00120    	ldr	q0, [x9]
101c53c0c: 3c818320    	stur	q0, [x25, #0x18]
101c53c10: 3900ab3f    	strb	wzr, [x25, #0x2a]
101c53c14: 52800248    	mov	w8, #0x12               ; =18
101c53c18: 3900bf28    	strb	w8, [x25, #0x2f]
101c53c1c: 52800400    	mov	w0, #0x20               ; =32
101c53c20: 943feec7    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53c24: aa0003f8    	mov	x24, x0
101c53c28: f900f3f9    	str	x25, [sp, #0x1e0]
101c53c2c: f94017e8    	ldr	x8, [sp, #0x28]
101c53c30: 39400104    	ldrb	w4, [x8]
101c53c34: 910783e1    	add	x1, sp, #0x1e0
101c53c38: aa1503e2    	mov	x2, x21
101c53c3c: 52801123    	mov	w3, #0x89               ; =137
101c53c40: 52800645    	mov	w5, #0x32               ; =50
101c53c44: 97f1224c    	bl	0x10189c574 <wxime::data::dict::UserEmojiFreqDict::UserEmojiFreqDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, unsigned short, bool, int)>
101c53c48: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c53c4c: f900f3ff    	str	xzr, [sp, #0x1e0]
101c53c50: b4000080    	cbz	x0, 0x101c53c60 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1cec>
101c53c54: f9400008    	ldr	x8, [x0]
101c53c58: f9400508    	ldr	x8, [x8, #0x8]
101c53c5c: d63f0100    	blr	x8
101c53c60: f9400268    	ldr	x8, [x19]
101c53c64: f9400108    	ldr	x8, [x8]
101c53c68: 9100c100    	add	x0, x8, #0x30
101c53c6c: f9003ff7    	str	x23, [sp, #0x78]
101c53c70: 9101e3e1    	add	x1, sp, #0x78
101c53c74: 529fffe2    	mov	w2, #0xffff             ; =65535
101c53c78: 97ffaeb3    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c53c7c: f9403fe0    	ldr	x0, [sp, #0x78]
101c53c80: f9003fff    	str	xzr, [sp, #0x78]
101c53c84: b4000080    	cbz	x0, 0x101c53c94 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1d20>
101c53c88: f9400008    	ldr	x8, [x0]
101c53c8c: f9400508    	ldr	x8, [x8, #0x8]
101c53c90: d63f0100    	blr	x8
101c53c94: f9400268    	ldr	x8, [x19]
101c53c98: f9400108    	ldr	x8, [x8]
101c53c9c: 9100c100    	add	x0, x8, #0x30
101c53ca0: f9003bf8    	str	x24, [sp, #0x70]
101c53ca4: 9101c3e1    	add	x1, sp, #0x70
101c53ca8: 529fffe2    	mov	w2, #0xffff             ; =65535
101c53cac: 97ffaea6    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c53cb0: f9403be0    	ldr	x0, [sp, #0x70]
101c53cb4: f9003bff    	str	xzr, [sp, #0x70]
101c53cb8: b4000080    	cbz	x0, 0x101c53cc8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1d54>
101c53cbc: f9400008    	ldr	x8, [x0]
101c53cc0: f9400508    	ldr	x8, [x8, #0x8]
101c53cc4: d63f0100    	blr	x8
101c53cc8: f9400268    	ldr	x8, [x19]
101c53ccc: f9400100    	ldr	x0, [x8]
101c53cd0: f9400008    	ldr	x8, [x0]
101c53cd4: f9408508    	ldr	x8, [x8, #0x108]
101c53cd8: d63f0100    	blr	x8
101c53cdc: f9400008    	ldr	x8, [x0]
101c53ce0: f9400909    	ldr	x9, [x8, #0x10]
101c53ce4: 910783e8    	add	x8, sp, #0x1e0
101c53ce8: 52801141    	mov	w1, #0x8a               ; =138
101c53cec: d63f0120    	blr	x9
101c53cf0: f9400268    	ldr	x8, [x19]
101c53cf4: f9400100    	ldr	x0, [x8]
101c53cf8: f9400008    	ldr	x8, [x0]
101c53cfc: f9408508    	ldr	x8, [x8, #0x108]
101c53d00: d63f0100    	blr	x8
101c53d04: f9400008    	ldr	x8, [x0]
101c53d08: f9400909    	ldr	x9, [x8, #0x10]
101c53d0c: 910583e8    	add	x8, sp, #0x160
101c53d10: 52801121    	mov	w1, #0x89               ; =137
101c53d14: d63f0120    	blr	x9
101c53d18: 52800700    	mov	w0, #0x38               ; =56
101c53d1c: 943fee88    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53d20: aa0003f7    	mov	x23, x0
101c53d24: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c53d28: b000bea8    	adrp	x8, 0x103428000 <typeinfo for wxime::engine::session::UserDictSingleEmitWrapper+0x110>
101c53d2c: 9125a108    	add	x8, x8, #0x968
101c53d30: f9000008    	str	x8, [x0]
101c53d34: 91006018    	add	x24, x0, #0x18
101c53d38: 910783e1    	add	x1, sp, #0x1e0
101c53d3c: 910583e2    	add	x2, sp, #0x160
101c53d40: aa1803e0    	mov	x0, x24
101c53d44: 940041d3    	bl	0x101c64490 <wxime::data::dict::UserPrefixAndEmojiRecordHelper* std::__1::construct_at[abi:ne180100]<wxime::data::dict::UserPrefixAndEmojiRecordHelper, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::data::dict::UserPrefixAndEmojiRecordHelper*>(wxime::data::dict::UserPrefixAndEmojiRecordHelper*, std::__1::shared_ptr<wxime::data::dict::IDict>&&, std::__1::shared_ptr<wxime::data::dict::IDict>&&)>
101c53d48: f9400268    	ldr	x8, [x19]
101c53d4c: f901b118    	str	x24, [x8, #0x360]
101c53d50: f941b518    	ldr	x24, [x8, #0x368]
101c53d54: f901b517    	str	x23, [x8, #0x368]
101c53d58: b4000178    	cbz	x24, 0x101c53d84 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e10>
101c53d5c: 91002308    	add	x8, x24, #0x8
101c53d60: 92800009    	mov	x9, #-0x1               ; =-1
101c53d64: f8e90108    	ldaddal	x9, x8, [x8]
101c53d68: b50000e8    	cbnz	x8, 0x101c53d84 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e10>
101c53d6c: f9400308    	ldr	x8, [x24]
101c53d70: f9400908    	ldr	x8, [x8, #0x10]
101c53d74: aa1803e0    	mov	x0, x24
101c53d78: d63f0100    	blr	x8
101c53d7c: aa1803e0    	mov	x0, x24
101c53d80: 943fed52    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53d84: f940b7f7    	ldr	x23, [sp, #0x168]
101c53d88: b4000177    	cbz	x23, 0x101c53db4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e40>
101c53d8c: 910022e8    	add	x8, x23, #0x8
101c53d90: 92800009    	mov	x9, #-0x1               ; =-1
101c53d94: f8e90108    	ldaddal	x9, x8, [x8]
101c53d98: b50000e8    	cbnz	x8, 0x101c53db4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e40>
101c53d9c: f94002e8    	ldr	x8, [x23]
101c53da0: f9400908    	ldr	x8, [x8, #0x10]
101c53da4: aa1703e0    	mov	x0, x23
101c53da8: d63f0100    	blr	x8
101c53dac: aa1703e0    	mov	x0, x23
101c53db0: 943fed46    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53db4: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c53db8: b4000177    	cbz	x23, 0x101c53de4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e70>
101c53dbc: 910022e8    	add	x8, x23, #0x8
101c53dc0: 92800009    	mov	x9, #-0x1               ; =-1
101c53dc4: f8e90108    	ldaddal	x9, x8, [x8]
101c53dc8: b50000e8    	cbnz	x8, 0x101c53de4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e70>
101c53dcc: f94002e8    	ldr	x8, [x23]
101c53dd0: f9400908    	ldr	x8, [x8, #0x10]
101c53dd4: aa1703e0    	mov	x0, x23
101c53dd8: d63f0100    	blr	x8
101c53ddc: aa1703e0    	mov	x0, x23
101c53de0: 943fed3a    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53de4: f940d3e0    	ldr	x0, [sp, #0x1a0]
101c53de8: f900d3ff    	str	xzr, [sp, #0x1a0]
101c53dec: b4000080    	cbz	x0, 0x101c53dfc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1e88>
101c53df0: f9400008    	ldr	x8, [x0]
101c53df4: f9400508    	ldr	x8, [x8, #0x8]
101c53df8: d63f0100    	blr	x8
101c53dfc: f940e3e0    	ldr	x0, [sp, #0x1c0]
101c53e00: f900e3ff    	str	xzr, [sp, #0x1c0]
101c53e04: b4000080    	cbz	x0, 0x101c53e14 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1ea0>
101c53e08: f9400008    	ldr	x8, [x0]
101c53e0c: f9400508    	ldr	x8, [x8, #0x8]
101c53e10: d63f0100    	blr	x8
101c53e14: f9409ff7    	ldr	x23, [sp, #0x138]
101c53e18: b4000177    	cbz	x23, 0x101c53e44 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1ed0>
101c53e1c: 910022e8    	add	x8, x23, #0x8
101c53e20: 92800009    	mov	x9, #-0x1               ; =-1
101c53e24: f8e90108    	ldaddal	x9, x8, [x8]
101c53e28: b50000e8    	cbnz	x8, 0x101c53e44 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1ed0>
101c53e2c: f94002e8    	ldr	x8, [x23]
101c53e30: f9400908    	ldr	x8, [x8, #0x10]
101c53e34: aa1703e0    	mov	x0, x23
101c53e38: d63f0100    	blr	x8
101c53e3c: aa1703e0    	mov	x0, x23
101c53e40: 943fed22    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53e44: 910c03e0    	add	x0, sp, #0x300
101c53e48: 940fba70    	bl	0x102042808 <loguru::LogScopeRAII::~LogScopeRAII()>
101c53e4c: f9400276    	ldr	x22, [x19]
101c53e50: 52800600    	mov	w0, #0x30               ; =48
101c53e54: 943fee3a    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53e58: aa0003f8    	mov	x24, x0
101c53e5c: 910182c8    	add	x8, x22, #0x60
101c53e60: f9400109    	ldr	x9, [x8]
101c53e64: f94036c8    	ldr	x8, [x22, #0x68]
101c53e68: b4000088    	cbz	x8, 0x101c53e78 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1f04>
101c53e6c: 9100210a    	add	x10, x8, #0x8
101c53e70: 5280002b    	mov	w11, #0x1               ; =1
101c53e74: f82b014a    	ldadd	x11, x10, [x10]
101c53e78: d000c0d6    	adrp	x22, 0x10346d000 <wxime::kv::(anonymous namespace)::IsEnvironmentalMessage(std::__1::basic_string_view<char, std::__1::char_traits<char>>)::kEnvironmentalErrors+0xf0>
101c53e7c: 910102d6    	add	x22, x22, #0x40
101c53e80: 910042ca    	add	x10, x22, #0x10
101c53e84: a900270a    	stp	x10, x9, [x24]
101c53e88: d28e0429    	mov	x9, #0x7021             ; =28705
101c53e8c: f2adcea9    	movk	x9, #0x6e75, lsl #16
101c53e90: f2ce8c69    	movk	x9, #0x7463, lsl #32
101c53e94: f2e42689    	movk	x9, #0x2134, lsl #48
101c53e98: a9012708    	stp	x8, x9, [x24, #0x10]
101c53e9c: 3900831f    	strb	wzr, [x24, #0x20]
101c53ea0: 52800108    	mov	w8, #0x8                ; =8
101c53ea4: 3900bf08    	strb	w8, [x24, #0x2f]
101c53ea8: 52801c00    	mov	w0, #0xe0               ; =224
101c53eac: 943fee24    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53eb0: aa0003f7    	mov	x23, x0
101c53eb4: 3800841f    	strb	wzr, [x0], #0x8
101c53eb8: f900f3f8    	str	x24, [sp, #0x1e0]
101c53ebc: 910783e1    	add	x1, sp, #0x1e0
101c53ec0: aa1503e2    	mov	x2, x21
101c53ec4: 52800003    	mov	w3, #0x0                ; =0
101c53ec8: 52800644    	mov	w4, #0x32               ; =50
101c53ecc: 97ed5112    	bl	0x1017a8314 <wxime::data::dict::RecordWithFreqOnMemoryDict<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue, wxime::data::dict::RecordWithFreqOnMemoryFilter<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue>>::RecordWithFreqOnMemoryDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, bool, unsigned int)>
101c53ed0: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c53ed4: f900f3ff    	str	xzr, [sp, #0x1e0]
101c53ed8: b4000080    	cbz	x0, 0x101c53ee8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1f74>
101c53edc: f9400008    	ldr	x8, [x0]
101c53ee0: f9400508    	ldr	x8, [x8, #0x8]
101c53ee4: d63f0100    	blr	x8
101c53ee8: f9400268    	ldr	x8, [x19]
101c53eec: f9402918    	ldr	x24, [x8, #0x50]
101c53ef0: f9002917    	str	x23, [x8, #0x50]
101c53ef4: b40000b8    	cbz	x24, 0x101c53f08 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1f94>
101c53ef8: 91002300    	add	x0, x24, #0x8
101c53efc: 97ed5ef5    	bl	0x1017abad0 <wxime::data::dict::RecordWithFreqOnMemoryDict<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue, wxime::data::dict::RecordWithFreqOnMemoryFilter<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue>>::~RecordWithFreqOnMemoryDict()>
101c53f00: aa1803e0    	mov	x0, x24
101c53f04: 943fee02    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
101c53f08: f9400276    	ldr	x22, [x19]
101c53f0c: 52800600    	mov	w0, #0x30               ; =48
101c53f10: 943fee0b    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53f14: aa0003f7    	mov	x23, x0
101c53f18: 910182c8    	add	x8, x22, #0x60
101c53f1c: f9400109    	ldr	x9, [x8]
101c53f20: f94036c8    	ldr	x8, [x22, #0x68]
101c53f24: b4000088    	cbz	x8, 0x101c53f34 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x1fc0>
101c53f28: 9100210a    	add	x10, x8, #0x8
101c53f2c: 5280002b    	mov	w11, #0x1               ; =1
101c53f30: f82b014a    	ldadd	x11, x10, [x10]
101c53f34: d000c0ca    	adrp	x10, 0x10346d000 <wxime::kv::(anonymous namespace)::IsEnvironmentalMessage(std::__1::basic_string_view<char, std::__1::char_traits<char>>)::kEnvironmentalErrors+0xf0>
101c53f38: 9101014a    	add	x10, x10, #0x40
101c53f3c: 91004156    	add	x22, x10, #0x10
101c53f40: a90026f6    	stp	x22, x9, [x23]
101c53f44: f9000ae8    	str	x8, [x23, #0x10]
101c53f48: 528e0428    	mov	w8, #0x7021             ; =28705
101c53f4c: 72ae8dc8    	movk	w8, #0x746e, lsl #16
101c53f50: b9001ae8    	str	w8, [x23, #0x18]
101c53f54: 528eee88    	mov	w8, #0x7774             ; =30580
101c53f58: 72a42c48    	movk	w8, #0x2162, lsl #16
101c53f5c: b801b2e8    	stur	w8, [x23, #0x1b]
101c53f60: 39007eff    	strb	wzr, [x23, #0x1f]
101c53f64: 528000e8    	mov	w8, #0x7                ; =7
101c53f68: 3900bee8    	strb	w8, [x23, #0x2f]
101c53f6c: 52800200    	mov	w0, #0x10               ; =16
101c53f70: 943fedf3    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53f74: aa0003f8    	mov	x24, x0
101c53f78: f900f3f7    	str	x23, [sp, #0x1e0]
101c53f7c: 52800400    	mov	w0, #0x20               ; =32
101c53f80: 943fedef    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c53f84: a9007c1b    	stp	x27, xzr, [x0]
101c53f88: a9015c1f    	stp	xzr, x23, [x0, #0x10]
101c53f8c: f900f7e0    	str	x0, [sp, #0x1e8]
101c53f90: 910783e1    	add	x1, sp, #0x1e0
101c53f94: aa1803e0    	mov	x0, x24
101c53f98: aa1503e2    	mov	x2, x21
101c53f9c: 52800003    	mov	w3, #0x0                ; =0
101c53fa0: 97ed4f7e    	bl	0x1017a7d98 <wxime::data::PunctuationRecorderWithBucket::PunctuationRecorderWithBucket(std::__1::shared_ptr<wxime::kv::IKV>, async::threadpool_scheduler&, bool)>
101c53fa4: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c53fa8: b4000177    	cbz	x23, 0x101c53fd4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2060>
101c53fac: 910022e8    	add	x8, x23, #0x8
101c53fb0: 92800009    	mov	x9, #-0x1               ; =-1
101c53fb4: f8e90108    	ldaddal	x9, x8, [x8]
101c53fb8: b50000e8    	cbnz	x8, 0x101c53fd4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2060>
101c53fbc: f94002e8    	ldr	x8, [x23]
101c53fc0: f9400908    	ldr	x8, [x8, #0x10]
101c53fc4: aa1703e0    	mov	x0, x23
101c53fc8: d63f0100    	blr	x8
101c53fcc: aa1703e0    	mov	x0, x23
101c53fd0: 943fecbe    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c53fd4: f9400268    	ldr	x8, [x19]
101c53fd8: f9402d00    	ldr	x0, [x8, #0x58]
101c53fdc: f9002d18    	str	x24, [x8, #0x58]
101c53fe0: b4000080    	cbz	x0, 0x101c53ff0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x207c>
101c53fe4: f9400008    	ldr	x8, [x0]
101c53fe8: f9400508    	ldr	x8, [x8, #0x8]
101c53fec: d63f0100    	blr	x8
101c53ff0: f9400276    	ldr	x22, [x19]
101c53ff4: f9403ac8    	ldr	x8, [x22, #0x70]
101c53ff8: b4006c08    	cbz	x8, 0x101c54d78 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2e04>
101c53ffc: 940cdbf1    	bl	0x101f8afc0 <wxime::logging::Manager::Instance()>
101c54000: aa0003f7    	mov	x23, x0
101c54004: f9400276    	ldr	x22, [x19]
101c54008: 52800900    	mov	w0, #0x48               ; =72
101c5400c: 943fedcc    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c54010: aa0003f8    	mov	x24, x0
101c54014: 9101c2c2    	add	x2, x22, #0x70
101c54018: f000a9e1    	adrp	x1, 0x103193000 <typeinfo name for std::__1::__function::__base<std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>> ()>+0x4a>
101c5401c: 9125c821    	add	x1, x1, #0x972
101c54020: 94003c6f    	bl	0x101c631dc <std::__1::__shared_ptr_emplace<wxime::kv::PrefixDB, std::__1::allocator<wxime::kv::PrefixDB>>::__shared_ptr_emplace[abi:ne180100]<char const (&) [7], std::__1::shared_ptr<wxime::kv::IKV>&, std::__1::allocator<wxime::kv::PrefixDB>, 0>(std::__1::allocator<wxime::kv::PrefixDB>, char const (&) [7], std::__1::shared_ptr<wxime::kv::IKV>&)>
101c54024: 91006308    	add	x8, x24, #0x18
101c54028: a90663e8    	stp	x8, x24, [sp, #0x60]
101c5402c: a91e7fff    	stp	xzr, xzr, [sp, #0x1e0]
101c54030: 910183e1    	add	x1, sp, #0x60
101c54034: aa1703e0    	mov	x0, x23
101c54038: 940cdbb2    	bl	0x101f8af00 <wxime::logging::Manager::AttachKvStorage(std::__1::shared_ptr<wxime::kv::IKV>)>
101c5403c: f94037f7    	ldr	x23, [sp, #0x68]
101c54040: b4000177    	cbz	x23, 0x101c5406c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x20f8>
101c54044: 910022e8    	add	x8, x23, #0x8
101c54048: 92800009    	mov	x9, #-0x1               ; =-1
101c5404c: f8e90108    	ldaddal	x9, x8, [x8]
101c54050: b50000e8    	cbnz	x8, 0x101c5406c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x20f8>
101c54054: f94002e8    	ldr	x8, [x23]
101c54058: f9400908    	ldr	x8, [x8, #0x10]
101c5405c: aa1703e0    	mov	x0, x23
101c54060: d63f0100    	blr	x8
101c54064: aa1703e0    	mov	x0, x23
101c54068: 943fec98    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c5406c: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c54070: b4000177    	cbz	x23, 0x101c5409c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2128>
101c54074: 910022e8    	add	x8, x23, #0x8
101c54078: 92800009    	mov	x9, #-0x1               ; =-1
101c5407c: f8e90108    	ldaddal	x9, x8, [x8]
101c54080: b50000e8    	cbnz	x8, 0x101c5409c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2128>
101c54084: f94002e8    	ldr	x8, [x23]
101c54088: f9400908    	ldr	x8, [x8, #0x10]
101c5408c: aa1703e0    	mov	x0, x23
101c54090: d63f0100    	blr	x8
101c54094: aa1703e0    	mov	x0, x23
101c54098: 943fec8c    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c5409c: 39447e88    	ldrb	w8, [x20, #0x11f]
101c540a0: 13001d16    	sxtb	w22, w8
101c540a4: f9408a89    	ldr	x9, [x20, #0x110]
101c540a8: 710002df    	cmp	w22, #0x0
101c540ac: 9a88b138    	csel	x24, x9, x8, lt
101c540b0: f000cc68    	adrp	x8, 0x1035e3000 <wxime::engine::searchers_v2::CacheCandidateForCompletion::CandidateSupplement(std::__1::vector<wxime::engine::searchers_v2::CandidateV2, std::__1::allocator<wxime::engine::searchers_v2::CandidateV2>>&)::kEndsWithSymbol+0x20>
101c540b4: 91130108    	add	x8, x8, #0x4c0
101c540b8: 39403d09    	ldrb	w9, [x8, #0xf]
101c540bc: 13001d3b    	sxtb	w27, w9
101c540c0: f9400108    	ldr	x8, [x8]
101c540c4: 7100037f    	cmp	w27, #0x0
101c540c8: 9a89b117    	csel	x23, x8, x9, lt
101c540cc: b27defe8    	mov	x8, #0x7ffffffffffffff8 ; =9223372036854775800
101c540d0: 8b1802fc    	add	x28, x23, x24
101c540d4: eb08039f    	cmp	x28, x8
101c540d8: 540073e2    	b.hs	0x101c54f54 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2fe0>
101c540dc: f1005b9f    	cmp	x28, #0x16
101c540e0: 54002568    	b.hi	0x101c5458c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2618>
101c540e4: f9018bff    	str	xzr, [sp, #0x310]
101c540e8: f90187ff    	str	xzr, [sp, #0x308]
101c540ec: f90183ff    	str	xzr, [sp, #0x300]
101c540f0: 910c03f9    	add	x25, sp, #0x300
101c540f4: 390c5ffc    	strb	w28, [sp, #0x317]
101c540f8: b4000118    	cbz	x24, 0x101c54118 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x21a4>
101c540fc: 91042288    	add	x8, x20, #0x108
101c54100: f9400109    	ldr	x9, [x8]
101c54104: 710002df    	cmp	w22, #0x0
101c54108: 9a88b121    	csel	x1, x9, x8, lt
101c5410c: aa1903e0    	mov	x0, x25
101c54110: aa1803e2    	mov	x2, x24
101c54114: 943ff0e1    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
101c54118: 8b180338    	add	x24, x25, x24
101c5411c: b4000137    	cbz	x23, 0x101c54140 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x21cc>
101c54120: f000cc68    	adrp	x8, 0x1035e3000 <wxime::engine::searchers_v2::CacheCandidateForCompletion::CandidateSupplement(std::__1::vector<wxime::engine::searchers_v2::CandidateV2, std::__1::allocator<wxime::engine::searchers_v2::CandidateV2>>&)::kEndsWithSymbol+0x20>
101c54124: 9112e108    	add	x8, x8, #0x4b8
101c54128: f9400109    	ldr	x9, [x8]
101c5412c: 7100037f    	cmp	w27, #0x0
101c54130: 9a88b121    	csel	x1, x9, x8, lt
101c54134: aa1803e0    	mov	x0, x24
101c54138: aa1703e2    	mov	x2, x23
101c5413c: 943ff0d7    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
101c54140: 38376b1f    	strb	wzr, [x24, x23]
101c54144: 52800400    	mov	w0, #0x20               ; =32
101c54148: 943fed7d    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c5414c: aa0003f7    	mov	x23, x0
101c54150: 3dc0c3e0    	ldr	q0, [sp, #0x300]
101c54154: 3d807be0    	str	q0, [sp, #0x1e0]
101c54158: f9418be8    	ldr	x8, [sp, #0x310]
101c5415c: f900fbe8    	str	x8, [sp, #0x1f0]
101c54160: 910783e1    	add	x1, sp, #0x1e0
101c54164: 52801342    	mov	w2, #0x9a               ; =154
101c54168: 52800c83    	mov	w3, #0x64               ; =100
101c5416c: 52802004    	mov	w4, #0x100              ; =256
101c54170: 97f32a50    	bl	0x10191eab0 <wxime::data::dict::UserHotWordExtraDict::UserHotWordExtraDict(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned short, int, int)>
101c54174: 39c7dfe8    	ldrsb	w8, [sp, #0x1f7]
101c54178: 36f80068    	tbz	w8, #0x1f, 0x101c54184 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2210>
101c5417c: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c54180: 943fed63    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
101c54184: f9400268    	ldr	x8, [x19]
101c54188: f9400108    	ldr	x8, [x8]
101c5418c: 9100c100    	add	x0, x8, #0x30
101c54190: f9002ff7    	str	x23, [sp, #0x58]
101c54194: 910163e1    	add	x1, sp, #0x58
101c54198: 529fffe2    	mov	w2, #0xffff             ; =65535
101c5419c: 97ffad6a    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c541a0: f9402fe0    	ldr	x0, [sp, #0x58]
101c541a4: f9002fff    	str	xzr, [sp, #0x58]
101c541a8: b4000080    	cbz	x0, 0x101c541b8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2244>
101c541ac: f9400008    	ldr	x8, [x0]
101c541b0: f9400508    	ldr	x8, [x8, #0x8]
101c541b4: d63f0100    	blr	x8
101c541b8: f9400276    	ldr	x22, [x19]
101c541bc: 52800600    	mov	w0, #0x30               ; =48
101c541c0: 943fed5f    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c541c4: aa0003f8    	mov	x24, x0
101c541c8: 9101c2c8    	add	x8, x22, #0x70
101c541cc: f9400109    	ldr	x9, [x8]
101c541d0: f9403ec8    	ldr	x8, [x22, #0x78]
101c541d4: b40000a8    	cbz	x8, 0x101c541e8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2274>
101c541d8: 9100210a    	add	x10, x8, #0x8
101c541dc: 5280002b    	mov	w11, #0x1               ; =1
101c541e0: f82b014a    	ldadd	x11, x10, [x10]
101c541e4: f9400276    	ldr	x22, [x19]
101c541e8: b000c0dc    	adrp	x28, 0x10346d000 <wxime::kv::(anonymous namespace)::IsEnvironmentalMessage(std::__1::basic_string_view<char, std::__1::char_traits<char>>)::kEnvironmentalErrors+0xf0>
101c541ec: 9101039c    	add	x28, x28, #0x40
101c541f0: 9100438a    	add	x10, x28, #0x10
101c541f4: a900270a    	stp	x10, x9, [x24]
101c541f8: f9000b08    	str	x8, [x24, #0x10]
101c541fc: 528ea428    	mov	w8, #0x7521             ; =29985
101c54200: 72ad0e68    	movk	w8, #0x6873, lsl #16
101c54204: b9001b08    	str	w8, [x24, #0x18]
101c54208: 52800428    	mov	w8, #0x21               ; =33
101c5420c: 79003b08    	strh	w8, [x24, #0x1c]
101c54210: 528000a8    	mov	w8, #0x5                ; =5
101c54214: 3900bf08    	strb	w8, [x24, #0x2f]
101c54218: f94002c0    	ldr	x0, [x22]
101c5421c: f9400008    	ldr	x8, [x0]
101c54220: f9408508    	ldr	x8, [x8, #0x108]
101c54224: d63f0100    	blr	x8
101c54228: f9400008    	ldr	x8, [x0]
101c5422c: f9400909    	ldr	x9, [x8, #0x10]
101c54230: 910c03e8    	add	x8, sp, #0x300
101c54234: 52801341    	mov	w1, #0x9a               ; =154
101c54238: d63f0120    	blr	x9
101c5423c: 52800500    	mov	w0, #0x28               ; =40
101c54240: 943fed3f    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c54244: aa0003f7    	mov	x23, x0
101c54248: f900b3f8    	str	x24, [sp, #0x160]
101c5424c: 3dc0c3e0    	ldr	q0, [sp, #0x300]
101c54250: 3d807be0    	str	q0, [sp, #0x1e0]
101c54254: f90183ff    	str	xzr, [sp, #0x300]
101c54258: f90187ff    	str	xzr, [sp, #0x308]
101c5425c: f94017e8    	ldr	x8, [sp, #0x28]
101c54260: 39400104    	ldrb	w4, [x8]
101c54264: 910583e1    	add	x1, sp, #0x160
101c54268: 910783e3    	add	x3, sp, #0x1e0
101c5426c: aa1503e2    	mov	x2, x21
101c54270: 97efe17b    	bl	0x10184c85c <wxime::data::dict::UserHotWordDict::UserHotWordDict(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, std::__1::shared_ptr<wxime::data::dict::IDict>, bool)>
101c54274: f940f7f8    	ldr	x24, [sp, #0x1e8]
101c54278: b4000178    	cbz	x24, 0x101c542a4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2330>
101c5427c: 91002308    	add	x8, x24, #0x8
101c54280: 92800009    	mov	x9, #-0x1               ; =-1
101c54284: f8e90108    	ldaddal	x9, x8, [x8]
101c54288: b50000e8    	cbnz	x8, 0x101c542a4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2330>
101c5428c: f9400308    	ldr	x8, [x24]
101c54290: f9400908    	ldr	x8, [x8, #0x10]
101c54294: aa1803e0    	mov	x0, x24
101c54298: d63f0100    	blr	x8
101c5429c: aa1803e0    	mov	x0, x24
101c542a0: 943fec0a    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c542a4: f940b3e0    	ldr	x0, [sp, #0x160]
101c542a8: f900b3ff    	str	xzr, [sp, #0x160]
101c542ac: b4000080    	cbz	x0, 0x101c542bc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2348>
101c542b0: f9400008    	ldr	x8, [x0]
101c542b4: f9400508    	ldr	x8, [x8, #0x8]
101c542b8: d63f0100    	blr	x8
101c542bc: f94187f8    	ldr	x24, [sp, #0x308]
101c542c0: b4000178    	cbz	x24, 0x101c542ec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2378>
101c542c4: 91002308    	add	x8, x24, #0x8
101c542c8: 92800009    	mov	x9, #-0x1               ; =-1
101c542cc: f8e90108    	ldaddal	x9, x8, [x8]
101c542d0: b50000e8    	cbnz	x8, 0x101c542ec <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2378>
101c542d4: f9400308    	ldr	x8, [x24]
101c542d8: f9400908    	ldr	x8, [x8, #0x10]
101c542dc: aa1803e0    	mov	x0, x24
101c542e0: d63f0100    	blr	x8
101c542e4: aa1803e0    	mov	x0, x24
101c542e8: 943febf8    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c542ec: f9400276    	ldr	x22, [x19]
101c542f0: 52800600    	mov	w0, #0x30               ; =48
101c542f4: 943fed12    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c542f8: aa0003f8    	mov	x24, x0
101c542fc: a94722c9    	ldp	x9, x8, [x22, #0x70]
101c54300: b4000088    	cbz	x8, 0x101c54310 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x239c>
101c54304: 9100210a    	add	x10, x8, #0x8
101c54308: 5280002b    	mov	w11, #0x1               ; =1
101c5430c: f82b014a    	ldadd	x11, x10, [x10]
101c54310: 9100438a    	add	x10, x28, #0x10
101c54314: a900270a    	stp	x10, x9, [x24]
101c54318: f9000b08    	str	x8, [x24, #0x10]
101c5431c: 528ea428    	mov	w8, #0x7521             ; =29985
101c54320: 72aeed08    	movk	w8, #0x7768, lsl #16
101c54324: b9001b08    	str	w8, [x24, #0x18]
101c54328: 52842c88    	mov	w8, #0x2164             ; =8548
101c5432c: 79003b08    	strh	w8, [x24, #0x1c]
101c54330: 39007b1f    	strb	wzr, [x24, #0x1e]
101c54334: 528000c8    	mov	w8, #0x6                ; =6
101c54338: 3900bf08    	strb	w8, [x24, #0x2f]
101c5433c: f9401296    	ldr	x22, [x20, #0x20]
101c54340: f94006c0    	ldr	x0, [x22, #0x8]
101c54344: b5000080    	cbnz	x0, 0x101c54354 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x23e0>
101c54348: 940d98df    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c5434c: f90006c0    	str	x0, [x22, #0x8]
101c54350: b40060c0    	cbz	x0, 0x101c54f68 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2ff4>
101c54354: 940d98e1    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c54358: aa0003fb    	mov	x27, x0
101c5435c: 52800500    	mov	w0, #0x28               ; =40
101c54360: 943fecf7    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c54364: aa0003f9    	mov	x25, x0
101c54368: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c5436c: f000bfa8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c54370: 9120e108    	add	x8, x8, #0x838
101c54374: f9000008    	str	x8, [x0]
101c54378: 9100601a    	add	x26, x0, #0x18
101c5437c: f900f3f8    	str	x24, [sp, #0x1e0]
101c54380: 910783e1    	add	x1, sp, #0x1e0
101c54384: aa1a03e0    	mov	x0, x26
101c54388: aa1503e2    	mov	x2, x21
101c5438c: aa1b03e3    	mov	x3, x27
101c54390: 97f0522d    	bl	0x101868c44 <wxime::data::UserHotWordDetector::UserHotWordDetector(std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, async::threadpool_scheduler&, asio::io_context&)>
101c54394: f940f3e0    	ldr	x0, [sp, #0x1e0]
101c54398: f900f3ff    	str	xzr, [sp, #0x1e0]
101c5439c: b4000080    	cbz	x0, 0x101c543ac <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2438>
101c543a0: f9400008    	ldr	x8, [x0]
101c543a4: f9400508    	ldr	x8, [x8, #0x8]
101c543a8: d63f0100    	blr	x8
101c543ac: f9400268    	ldr	x8, [x19]
101c543b0: f940ed18    	ldr	x24, [x8, #0x1d8]
101c543b4: a91d651a    	stp	x26, x25, [x8, #0x1d0]
101c543b8: b4000178    	cbz	x24, 0x101c543e4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2470>
101c543bc: 91002308    	add	x8, x24, #0x8
101c543c0: 92800009    	mov	x9, #-0x1               ; =-1
101c543c4: f8e90108    	ldaddal	x9, x8, [x8]
101c543c8: b50000e8    	cbnz	x8, 0x101c543e4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2470>
101c543cc: f9400308    	ldr	x8, [x24]
101c543d0: f9400908    	ldr	x8, [x8, #0x10]
101c543d4: aa1803e0    	mov	x0, x24
101c543d8: d63f0100    	blr	x8
101c543dc: aa1803e0    	mov	x0, x24
101c543e0: 943febba    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c543e4: f9400268    	ldr	x8, [x19]
101c543e8: f9400108    	ldr	x8, [x8]
101c543ec: 9100c100    	add	x0, x8, #0x30
101c543f0: f9002bf7    	str	x23, [sp, #0x50]
101c543f4: 910143e1    	add	x1, sp, #0x50
101c543f8: 529fffe2    	mov	w2, #0xffff             ; =65535
101c543fc: 97ffacd2    	bl	0x101c3f744 <wxime::data::dict::AddableMultipleKindDict::AddLabeledDict(std::__1::unique_ptr<wxime::data::dict::IDict, std::__1::default_delete<wxime::data::dict::IDict>>, unsigned short)>
101c54400: f9402be0    	ldr	x0, [sp, #0x50]
101c54404: f9002bff    	str	xzr, [sp, #0x50]
101c54408: b4000080    	cbz	x0, 0x101c54418 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x24a4>
101c5440c: f9400008    	ldr	x8, [x0]
101c54410: f9400508    	ldr	x8, [x8, #0x8]
101c54414: d63f0100    	blr	x8
101c54418: f9400268    	ldr	x8, [x19]
101c5441c: f9400100    	ldr	x0, [x8]
101c54420: f9400008    	ldr	x8, [x0]
101c54424: f942e509    	ldr	x9, [x8, #0x5c8]
101c54428: 910783e8    	add	x8, sp, #0x1e0
101c5442c: 52801081    	mov	w1, #0x84               ; =132
101c54430: d63f0120    	blr	x9
101c54434: f9400276    	ldr	x22, [x19]
101c54438: 52800600    	mov	w0, #0x30               ; =48
101c5443c: 943fecc0    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c54440: a94722c9    	ldp	x9, x8, [x22, #0x70]
101c54444: b4000088    	cbz	x8, 0x101c54454 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x24e0>
101c54448: 9100210a    	add	x10, x8, #0x8
101c5444c: 5280002b    	mov	w11, #0x1               ; =1
101c54450: f82b014a    	ldadd	x11, x10, [x10]
101c54454: 9100438a    	add	x10, x28, #0x10
101c54458: a900240a    	stp	x10, x9, [x0]
101c5445c: f9000808    	str	x8, [x0, #0x10]
101c54460: 528d0428    	mov	w8, #0x6821             ; =26657
101c54464: 72ae6ee8    	movk	w8, #0x7377, lsl #16
101c54468: b9001808    	str	w8, [x0, #0x18]
101c5446c: 52842c68    	mov	w8, #0x2163             ; =8547
101c54470: 79003808    	strh	w8, [x0, #0x1c]
101c54474: 3900781f    	strb	wzr, [x0, #0x1e]
101c54478: 528000c8    	mov	w8, #0x6                ; =6
101c5447c: 3900bc08    	strb	w8, [x0, #0x2f]
101c54480: f90183e0    	str	x0, [sp, #0x300]
101c54484: f9401296    	ldr	x22, [x20, #0x20]
101c54488: f94006c0    	ldr	x0, [x22, #0x8]
101c5448c: b5000080    	cbnz	x0, 0x101c5449c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2528>
101c54490: 940d988d    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c54494: f90006c0    	str	x0, [x22, #0x8]
101c54498: b4005820    	cbz	x0, 0x101c54f9c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x3028>
101c5449c: 940d988f    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c544a0: aa0003f8    	mov	x24, x0
101c544a4: 52800500    	mov	w0, #0x28               ; =40
101c544a8: 943feca5    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c544ac: aa0003f7    	mov	x23, x0
101c544b0: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c544b4: f000bfa8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c544b8: 91222108    	add	x8, x8, #0x888
101c544bc: f9000008    	str	x8, [x0]
101c544c0: 91006019    	add	x25, x0, #0x18
101c544c4: 910783e1    	add	x1, sp, #0x1e0
101c544c8: 910c03e2    	add	x2, sp, #0x300
101c544cc: aa1903e0    	mov	x0, x25
101c544d0: aa1803e3    	mov	x3, x24
101c544d4: 94004040    	bl	0x101c645d4 <wxime::engine::group_sync::UserHotWordSyncer* std::__1::construct_at[abi:ne180100]<wxime::engine::group_sync::UserHotWordSyncer, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>, asio::io_context&, wxime::engine::group_sync::UserHotWordSyncer*>(wxime::engine::group_sync::UserHotWordSyncer*, std::__1::shared_ptr<wxime::data::dict::IDict>&&, std::__1::unique_ptr<wxime::kv::PrefixDB, std::__1::default_delete<wxime::kv::PrefixDB>>&&, asio::io_context&)>
101c544d8: f9400268    	ldr	x8, [x19]
101c544dc: f9018919    	str	x25, [x8, #0x310]
101c544e0: f9418d18    	ldr	x24, [x8, #0x318]
101c544e4: f9018d17    	str	x23, [x8, #0x318]
101c544e8: b4000178    	cbz	x24, 0x101c54514 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x25a0>
101c544ec: 91002308    	add	x8, x24, #0x8
101c544f0: 92800009    	mov	x9, #-0x1               ; =-1
101c544f4: f8e90108    	ldaddal	x9, x8, [x8]
101c544f8: b50000e8    	cbnz	x8, 0x101c54514 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x25a0>
101c544fc: f9400308    	ldr	x8, [x24]
101c54500: f9400908    	ldr	x8, [x8, #0x10]
101c54504: aa1803e0    	mov	x0, x24
101c54508: d63f0100    	blr	x8
101c5450c: aa1803e0    	mov	x0, x24
101c54510: 943feb6e    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c54514: f94183e0    	ldr	x0, [sp, #0x300]
101c54518: f90183ff    	str	xzr, [sp, #0x300]
101c5451c: b4000080    	cbz	x0, 0x101c5452c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x25b8>
101c54520: f9400008    	ldr	x8, [x0]
101c54524: f9400508    	ldr	x8, [x8, #0x8]
101c54528: d63f0100    	blr	x8
101c5452c: f940f7f7    	ldr	x23, [sp, #0x1e8]
101c54530: b4000177    	cbz	x23, 0x101c5455c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x25e8>
101c54534: 910022e8    	add	x8, x23, #0x8
101c54538: 92800009    	mov	x9, #-0x1               ; =-1
101c5453c: f8e90108    	ldaddal	x9, x8, [x8]
101c54540: b50000e8    	cbnz	x8, 0x101c5455c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x25e8>
101c54544: f94002e8    	ldr	x8, [x23]
101c54548: f9400908    	ldr	x8, [x8, #0x10]
101c5454c: aa1703e0    	mov	x0, x23
101c54550: d63f0100    	blr	x8
101c54554: aa1703e0    	mov	x0, x23
101c54558: 943feb5c    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c5455c: f9400268    	ldr	x8, [x19]
101c54560: f9401900    	ldr	x0, [x8, #0x30]
101c54564: 910c03e8    	add	x8, sp, #0x300
101c54568: 97ecddba    	bl	0x10178bc50 <wxime::data::HyperParams::CloudEngineParams() const>
101c5456c: 79464be8    	ldrh	w8, [sp, #0x324]
101c54570: 340002c8    	cbz	w8, 0x101c545c8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2654>
101c54574: f9418fe9    	ldr	x9, [sp, #0x318]
101c54578: b9432be8    	ldr	w8, [sp, #0x328]
101c5457c: 3dc0c3e0    	ldr	q0, [sp, #0x300]
101c54580: 3d805be0    	str	q0, [sp, #0x160]
101c54584: f900bbe9    	str	x9, [sp, #0x170]
101c54588: 14000013    	b	0x101c545d4 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2660>
101c5458c: 927df388    	and	x8, x28, #0xfffffffffffffff8
101c54590: 91002108    	add	x8, x8, #0x8
101c54594: b2400b89    	orr	x9, x28, #0x7
101c54598: f1005d3f    	cmp	x9, #0x17
101c5459c: 9a890108    	csel	x8, x8, x9, eq
101c545a0: 9100051a    	add	x26, x8, #0x1
101c545a4: aa1a03e0    	mov	x0, x26
101c545a8: 943fec65    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c545ac: aa0003f9    	mov	x25, x0
101c545b0: b2410348    	orr	x8, x26, #0x8000000000000000
101c545b4: f9018be8    	str	x8, [sp, #0x310]
101c545b8: f90183e0    	str	x0, [sp, #0x300]
101c545bc: f90187fc    	str	x28, [sp, #0x308]
101c545c0: b5ffd9f8    	cbnz	x24, 0x101c540fc <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2188>
101c545c4: 17fffed5    	b	0x101c54118 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x21a4>
101c545c8: a9167fff    	stp	xzr, xzr, [sp, #0x160]
101c545cc: 12b00008    	mov	w8, #0x7fffffff         ; =2147483647
101c545d0: f900bbff    	str	xzr, [sp, #0x170]
101c545d4: b9017be8    	str	w8, [sp, #0x178]
101c545d8: 910783e8    	add	x8, sp, #0x1e0
101c545dc: 910583e0    	add	x0, sp, #0x160
101c545e0: d2800001    	mov	x1, #0x0                ; =0
101c545e4: 940f05e0    	bl	0x102015d64 <capnp::_::PointerReader::getStruct(capnp::word const*) const>
101c545e8: f940fbfa    	ldr	x26, [sp, #0x1f0]
101c545ec: b94203fb    	ldr	w27, [sp, #0x200]
101c545f0: f9400276    	ldr	x22, [x19]
101c545f4: 52800900    	mov	w0, #0x48               ; =72
101c545f8: 943fec51    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c545fc: aa0003f7    	mov	x23, x0
101c54600: 9101c2c2    	add	x2, x22, #0x70
101c54604: f000a9e1    	adrp	x1, 0x103193000 <typeinfo name for std::__1::__function::__base<std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>> ()>+0x4a>
101c54608: 9125e421    	add	x1, x1, #0x979
101c5460c: 94004036    	bl	0x101c646e4 <std::__1::__shared_ptr_emplace<wxime::kv::PrefixDB, std::__1::allocator<wxime::kv::PrefixDB>>::__shared_ptr_emplace[abi:ne180100]<char const (&) [6], std::__1::shared_ptr<wxime::kv::IKV>&, std::__1::allocator<wxime::kv::PrefixDB>, 0>(std::__1::allocator<wxime::kv::PrefixDB>, char const (&) [6], std::__1::shared_ptr<wxime::kv::IKV>&)>
101c54610: 910062e8    	add	x8, x23, #0x18
101c54614: a9165fe8    	stp	x8, x23, [sp, #0x160]
101c54618: 7100837f    	cmp	w27, #0x20
101c5461c: 54000062    	b.hs	0x101c54628 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x26b4>
101c54620: 52800008    	mov	w8, #0x0                ; =0
101c54624: 14000002    	b	0x101c5462c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x26b8>
101c54628: b9400348    	ldr	w8, [x26]
101c5462c: b901c3e8    	str	w8, [sp, #0x1c0]
101c54630: f9400269    	ldr	x9, [x19]
101c54634: f9404129    	ldr	x9, [x9, #0x80]
101c54638: 5280002a    	mov	w10, #0x1               ; =1
101c5463c: 72a0c80a    	movk	w10, #0x640, lsl #16
101c54640: eb0a013f    	cmp	x9, x10
101c54644: 540000c3    	b.lo	0x101c5465c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x26e8>
101c54648: 52911129    	mov	w9, #0x8889             ; =34953
101c5464c: 72b11109    	movk	w9, #0x8888, lsl #16
101c54650: 9ba97d08    	umull	x8, w8, w9
101c54654: d363fd08    	lsr	x8, x8, #35
101c54658: 14000009    	b	0x101c5467c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2708>
101c5465c: 5280002a    	mov	w10, #0x1               ; =1
101c54660: 72a0640a    	movk	w10, #0x320, lsl #16
101c54664: eb0a013f    	cmp	x9, x10
101c54668: 540000c3    	b.lo	0x101c54680 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x270c>
101c5466c: 529999a9    	mov	w9, #0xcccd             ; =52429
101c54670: 72b99989    	movk	w9, #0xcccc, lsl #16
101c54674: 9ba97d08    	umull	x8, w8, w9
101c54678: d362fd08    	lsr	x8, x8, #34
101c5467c: b901c3e8    	str	w8, [sp, #0x1c0]
101c54680: f9401296    	ldr	x22, [x20, #0x20]
101c54684: f94006c0    	ldr	x0, [x22, #0x8]
101c54688: b5000080    	cbnz	x0, 0x101c54698 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2724>
101c5468c: 940d980e    	bl	0x101fba6c4 <wxime::utils::IOServices::Instance()>
101c54690: f90006c0    	str	x0, [x22, #0x8]
101c54694: b40049e0    	cbz	x0, 0x101c54fd0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x305c>
101c54698: 940d9810    	bl	0x101fba6d8 <wxime::utils::IOServices::BackgroundService()>
101c5469c: aa0003f8    	mov	x24, x0
101c546a0: 52801400    	mov	w0, #0xa0               ; =160
101c546a4: 943fec26    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c546a8: aa0003f7    	mov	x23, x0
101c546ac: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c546b0: f000bfa8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c546b4: 91236108    	add	x8, x8, #0x8d8
101c546b8: f9000008    	str	x8, [x0]
101c546bc: 91006019    	add	x25, x0, #0x18
101c546c0: 910583e1    	add	x1, sp, #0x160
101c546c4: 910703e2    	add	x2, sp, #0x1c0
101c546c8: aa1903e0    	mov	x0, x25
101c546cc: aa1803e3    	mov	x3, x24
101c546d0: aa1503e4    	mov	x4, x21
101c546d4: 9400405b    	bl	0x101c64840 <wxime::kv::TtlDB* std::__1::__construct_at[abi:ne180100]<wxime::kv::TtlDB, std::__1::shared_ptr<wxime::kv::IKV>&, unsigned int&, asio::io_context&, async::threadpool_scheduler&, wxime::kv::TtlDB*>(wxime::kv::TtlDB*, std::__1::shared_ptr<wxime::kv::IKV>&, unsigned int&, asio::io_context&, async::threadpool_scheduler&)>
101c546d8: f9400268    	ldr	x8, [x19]
101c546dc: f9405118    	ldr	x24, [x8, #0xa0]
101c546e0: a909dd19    	stp	x25, x23, [x8, #0x98]
101c546e4: b40000b8    	cbz	x24, 0x101c546f8 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2784>
101c546e8: 91002308    	add	x8, x24, #0x8
101c546ec: 92800009    	mov	x9, #-0x1               ; =-1
101c546f0: f8e90108    	ldaddal	x9, x8, [x8]
101c546f4: b4000448    	cbz	x8, 0x101c5477c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2808>
101c546f8: 7101837f    	cmp	w27, #0x60
101c546fc: 54000503    	b.lo	0x101c5479c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2828>
101c54700: b9400b48    	ldr	w8, [x26, #0x8]
101c54704: b901e3e8    	str	w8, [sp, #0x1e0]
101c54708: 340004a8    	cbz	w8, 0x101c5479c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2828>
101c5470c: f9400276    	ldr	x22, [x19]
101c54710: 52802300    	mov	w0, #0x118              ; =280
101c54714: 943fec0a    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c54718: aa0003f7    	mov	x23, x0
101c5471c: 910262c1    	add	x1, x22, #0x98
101c54720: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c54724: f000bfa8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c54728: 9124a108    	add	x8, x8, #0x928
101c5472c: f9000008    	str	x8, [x0]
101c54730: 91006019    	add	x25, x0, #0x18
101c54734: 910783e2    	add	x2, sp, #0x1e0
101c54738: aa1903e0    	mov	x0, x25
101c5473c: 94004078    	bl	0x101c6491c <wxime::kv::KeepConsistencyKV* std::__1::__construct_at[abi:ne180100]<wxime::kv::KeepConsistencyKV, std::__1::shared_ptr<wxime::kv::IKV>&, unsigned int&, wxime::kv::KeepConsistencyKV*>(wxime::kv::KeepConsistencyKV*, std::__1::shared_ptr<wxime::kv::IKV>&, unsigned int&)>
101c54740: f9400268    	ldr	x8, [x19]
101c54744: f9405118    	ldr	x24, [x8, #0xa0]
101c54748: a909dd19    	stp	x25, x23, [x8, #0x98]
101c5474c: b4000298    	cbz	x24, 0x101c5479c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2828>
101c54750: 91002308    	add	x8, x24, #0x8
101c54754: 92800009    	mov	x9, #-0x1               ; =-1
101c54758: f8e90108    	ldaddal	x9, x8, [x8]
101c5475c: b5000208    	cbnz	x8, 0x101c5479c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2828>
101c54760: f9400308    	ldr	x8, [x24]
101c54764: f9400908    	ldr	x8, [x8, #0x10]
101c54768: aa1803e0    	mov	x0, x24
101c5476c: d63f0100    	blr	x8
101c54770: aa1803e0    	mov	x0, x24
101c54774: 943fead5    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c54778: 14000009    	b	0x101c5479c <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x2828>
101c5477c: f9400308    	ldr	x8, [x24]
101c54780: f9400908    	ldr	x8, [x8, #0x10]
101c54784: aa1803e0    	mov	x0, x24
101c54788: d63f0100    	blr	x8
101c5478c: aa1803e0    	mov	x0, x24
101c54790: 943feace    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
101c54794: 7101837f    	cmp	w27, #0x60
101c54798: 54fffb42    	b.hs	0x101c54700 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x278c>
101c5479c: f9400276    	ldr	x22, [x19]
101c547a0: 52800600    	mov	w0, #0x30               ; =48
101c547a4: 943febe6    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c547a8: aa0003f8    	mov	x24, x0
101c547ac: a94722c9    	ldp	x9, x8, [x22, #0x70]
101c547b0: b4000088    	cbz	x8, 0x101c547c0 <wxime::engine::resources::ResourceMgr::Impl::LoadUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources>&)+0x284c>
101c547b4: 9100210a    	add	x10, x8, #0x8
101c547b8: 5280002b    	mov	w11, #0x1               ; =1
101c547bc: f82b014a    	ldadd	x11, x10, [x10]
101c547c0: 9100438a    	add	x10, x28, #0x10
101c547c4: a900270a    	stp	x10, x9, [x24]
101c547c8: d28d2429    	mov	x9, #0x6921             ; =26913
101c547cc: f2ad8da9    	movk	x9, #0x6c6d, lsl #16
101c547d0: f2cecd69    	movk	x9, #0x766b, lsl #32
101c547d4: f2e42e29    	movk	x9, #0x2171, lsl #48
101c547d8: a9012708    	stp	x8, x9, [x24, #0x10]
101c547dc: 3900831f    	strb	wzr, [x24, #0x20]
101c547e0: 52800108    	mov	w8, #0x8                ; =8
101c547e4: 3900bf08    	strb	w8, [x24, #0x2f]
101c547e8: 52800500    	mov	w0, #0x28               ; =40
101c547ec: 943febd4    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
101c547f0: aa0003f7    	mov	x23, x0
101c547f4: a900fc1f    	stp	xzr, xzr, [x0, #0x8]
101c547f8: f000bfa8    	adrp	x8, 0x10344b000 <vtable for std::__1::__shared_ptr_emplace<wxime::data::dict::DictManager, std::__1::allocator<wxime::data::dict::DictManager>>+0x28>
101c547fc: 9125e108    	add	x8, x8, #0x978
