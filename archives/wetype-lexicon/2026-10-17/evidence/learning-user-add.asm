
work/v3/WeType.arm64:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001017aecc4 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)>:
1017aecc4: d104c3ff    	sub	sp, sp, #0x130
1017aecc8: a90d6ffc    	stp	x28, x27, [sp, #0xd0]
1017aeccc: a90e67fa    	stp	x26, x25, [sp, #0xe0]
1017aecd0: a90f5ff8    	stp	x24, x23, [sp, #0xf0]
1017aecd4: a91057f6    	stp	x22, x21, [sp, #0x100]
1017aecd8: a9114ff4    	stp	x20, x19, [sp, #0x110]
1017aecdc: a9127bfd    	stp	x29, x30, [sp, #0x120]
1017aece0: 910483fd    	add	x29, sp, #0x120
1017aece4: aa0703f8    	mov	x24, x7
1017aece8: aa0603f7    	mov	x23, x6
1017aecec: a90317e4    	stp	x4, x5, [sp, #0x30]
1017aecf0: aa0303f9    	mov	x25, x3
1017aecf4: aa0203fa    	mov	x26, x2
1017aecf8: aa0103fb    	mov	x27, x1
1017aecfc: aa0003f3    	mov	x19, x0
1017aed00: a941f3b5    	ldp	x21, x28, [x29, #0x18]
1017aed04: f94017b6    	ldr	x22, [x29, #0x28]
1017aed08: 79004006    	strh	w6, [x0, #0x20]
1017aed0c: b000e268    	adrp	x8, 0x1033fb000 <typeinfo for ranges::detail::any_view_sentinel_impl<ranges::transform_view<ranges::remove_if_view<ranges::any_view<wxime::data::trie::AugmentRecord, (ranges::category)1, void>, wxime::data::trie::RecordsToPendingInput(ranges::any_view<wxime::data::trie::AugmentRecord, (ranges::category)1, void>)::$_0>, wxime::data::trie::details::AugmentTransformer>, void>>
1017aed10: 91352108    	add	x8, x8, #0xd48
1017aed14: 9117a109    	add	x9, x8, #0x5e8
1017aed18: a9002408    	stp	x8, x9, [x0]
1017aed1c: 91186109    	add	x9, x8, #0x618
1017aed20: 91196108    	add	x8, x8, #0x658
1017aed24: a9012009    	stp	x9, x8, [x0, #0x10]
1017aed28: 52804200    	mov	w0, #0x210              ; =528
1017aed2c: 94528284    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017aed30: aa0003f4    	mov	x20, x0
1017aed34: 3dc00360    	ldr	q0, [x27]
1017aed38: 3c9903a0    	stur	q0, [x29, #-0x70]
1017aed3c: a9007f7f    	stp	xzr, xzr, [x27]
1017aed40: f9400348    	ldr	x8, [x26]
1017aed44: f900035f    	str	xzr, [x26]
1017aed48: f81883a8    	stur	x8, [x29, #-0x78]
1017aed4c: 3dc002c1    	ldr	q1, [x22]
1017aed50: a9007edf    	stp	xzr, xzr, [x22]
1017aed54: 3dc00320    	ldr	q0, [x25]
1017aed58: ad0407e0    	stp	q0, q1, [sp, #0x80]
1017aed5c: a9007f3f    	stp	xzr, xzr, [x25]
1017aed60: 3dc002a1    	ldr	q1, [x21]
1017aed64: a9007ebf    	stp	xzr, xzr, [x21]
1017aed68: 3dc00300    	ldr	q0, [x24]
1017aed6c: ad0307e0    	stp	q0, q1, [sp, #0x60]
1017aed70: a9007f1f    	stp	xzr, xzr, [x24]
1017aed74: 39c05f88    	ldrsb	w8, [x28, #0x17]
1017aed78: 37f800c8    	tbnz	w8, #0x1f, 0x1017aed90 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0xcc>
1017aed7c: 3dc00380    	ldr	q0, [x28]
1017aed80: 3d8013e0    	str	q0, [sp, #0x40]
1017aed84: f9400b88    	ldr	x8, [x28, #0x10]
1017aed88: f9002be8    	str	x8, [sp, #0x50]
1017aed8c: 14000004    	b	0x1017aed9c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0xd8>
1017aed90: a9400b81    	ldp	x1, x2, [x28]
1017aed94: 910103e0    	add	x0, sp, #0x40
1017aed98: 97a2952f    	bl	0x100054254 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__init_copy_ctor_external(char const*, unsigned long)>
1017aed9c: 394043a7    	ldrb	w7, [x29, #0x10]
1017aeda0: 910103e8    	add	x8, sp, #0x40
1017aeda4: 910183e9    	add	x9, sp, #0x60
1017aeda8: a901cfe8    	stp	x8, x19, [sp, #0x18]
1017aedac: f9000be9    	str	x9, [sp, #0x10]
1017aedb0: 790013f7    	strh	w23, [sp, #0x8]
1017aedb4: 9101c3e8    	add	x8, sp, #0x70
1017aedb8: d101c3a1    	sub	x1, x29, #0x70
1017aedbc: d101e3a2    	sub	x2, x29, #0x78
1017aedc0: f90003e8    	str	x8, [sp]
1017aedc4: 910243e3    	add	x3, sp, #0x90
1017aedc8: 910203e4    	add	x4, sp, #0x80
1017aedcc: aa1403e0    	mov	x0, x20
1017aedd0: a9431be5    	ldp	x5, x6, [sp, #0x30]
1017aedd4: 9400174e    	bl	0x1017b4b0c <wxime::data::dict::UserDictV2::Impl::Impl(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, wxime::data::dict::UserDictV2*)>
1017aedd8: f9001674    	str	x20, [x19, #0x28]
1017aeddc: 39c15fe8    	ldrsb	w8, [sp, #0x57]
1017aede0: 36f80068    	tbz	w8, #0x1f, 0x1017aedec <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x128>
1017aede4: f94023e0    	ldr	x0, [sp, #0x40]
1017aede8: 94528249    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017aedec: f94037f4    	ldr	x20, [sp, #0x68]
1017aedf0: b4000174    	cbz	x20, 0x1017aee1c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x158>
1017aedf4: 91002288    	add	x8, x20, #0x8
1017aedf8: 92800009    	mov	x9, #-0x1               ; =-1
1017aedfc: f8e90108    	ldaddal	x9, x8, [x8]
1017aee00: b50000e8    	cbnz	x8, 0x1017aee1c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x158>
1017aee04: f9400288    	ldr	x8, [x20]
1017aee08: f9400908    	ldr	x8, [x8, #0x10]
1017aee0c: aa1403e0    	mov	x0, x20
1017aee10: d63f0100    	blr	x8
1017aee14: aa1403e0    	mov	x0, x20
1017aee18: 9452812c    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017aee1c: f9403ff4    	ldr	x20, [sp, #0x78]
1017aee20: b4000174    	cbz	x20, 0x1017aee4c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x188>
1017aee24: 91002288    	add	x8, x20, #0x8
1017aee28: 92800009    	mov	x9, #-0x1               ; =-1
1017aee2c: f8e90108    	ldaddal	x9, x8, [x8]
1017aee30: b50000e8    	cbnz	x8, 0x1017aee4c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x188>
1017aee34: f9400288    	ldr	x8, [x20]
1017aee38: f9400908    	ldr	x8, [x8, #0x10]
1017aee3c: aa1403e0    	mov	x0, x20
1017aee40: d63f0100    	blr	x8
1017aee44: aa1403e0    	mov	x0, x20
1017aee48: 94528120    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017aee4c: f94047f4    	ldr	x20, [sp, #0x88]
1017aee50: b4000174    	cbz	x20, 0x1017aee7c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x1b8>
1017aee54: 91002288    	add	x8, x20, #0x8
1017aee58: 92800009    	mov	x9, #-0x1               ; =-1
1017aee5c: f8e90108    	ldaddal	x9, x8, [x8]
1017aee60: b50000e8    	cbnz	x8, 0x1017aee7c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x1b8>
1017aee64: f9400288    	ldr	x8, [x20]
1017aee68: f9400908    	ldr	x8, [x8, #0x10]
1017aee6c: aa1403e0    	mov	x0, x20
1017aee70: d63f0100    	blr	x8
1017aee74: aa1403e0    	mov	x0, x20
1017aee78: 94528114    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017aee7c: f9404ff4    	ldr	x20, [sp, #0x98]
1017aee80: b4000174    	cbz	x20, 0x1017aeeac <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x1e8>
1017aee84: 91002288    	add	x8, x20, #0x8
1017aee88: 92800009    	mov	x9, #-0x1               ; =-1
1017aee8c: f8e90108    	ldaddal	x9, x8, [x8]
1017aee90: b50000e8    	cbnz	x8, 0x1017aeeac <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x1e8>
1017aee94: f9400288    	ldr	x8, [x20]
1017aee98: f9400908    	ldr	x8, [x8, #0x10]
1017aee9c: aa1403e0    	mov	x0, x20
1017aeea0: d63f0100    	blr	x8
1017aeea4: aa1403e0    	mov	x0, x20
1017aeea8: 94528108    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017aeeac: f85883a0    	ldur	x0, [x29, #-0x78]
1017aeeb0: f81883bf    	stur	xzr, [x29, #-0x78]
1017aeeb4: b4000080    	cbz	x0, 0x1017aeec4 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x200>
1017aeeb8: f9400008    	ldr	x8, [x0]
1017aeebc: f9400508    	ldr	x8, [x8, #0x8]
1017aeec0: d63f0100    	blr	x8
1017aeec4: f85983b4    	ldur	x20, [x29, #-0x68]
1017aeec8: b4000174    	cbz	x20, 0x1017aeef4 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x230>
1017aeecc: 91002288    	add	x8, x20, #0x8
1017aeed0: 92800009    	mov	x9, #-0x1               ; =-1
1017aeed4: f8e90108    	ldaddal	x9, x8, [x8]
1017aeed8: b50000e8    	cbnz	x8, 0x1017aeef4 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x230>
1017aeedc: f9400288    	ldr	x8, [x20]
1017aeee0: f9400908    	ldr	x8, [x8, #0x10]
1017aeee4: aa1403e0    	mov	x0, x20
1017aeee8: d63f0100    	blr	x8
1017aeeec: aa1403e0    	mov	x0, x20
1017aeef0: 945280f6    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017aeef4: aa1303e0    	mov	x0, x19
1017aeef8: a9527bfd    	ldp	x29, x30, [sp, #0x120]
1017aeefc: a9514ff4    	ldp	x20, x19, [sp, #0x110]
1017aef00: a95057f6    	ldp	x22, x21, [sp, #0x100]
1017aef04: a94f5ff8    	ldp	x24, x23, [sp, #0xf0]
1017aef08: a94e67fa    	ldp	x26, x25, [sp, #0xe0]
1017aef0c: a94d6ffc    	ldp	x28, x27, [sp, #0xd0]
1017aef10: 9104c3ff    	add	sp, sp, #0x130
1017aef14: d65f03c0    	ret
1017aef18: aa0003f3    	mov	x19, x0
1017aef1c: 14000006    	b	0x1017aef34 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x270>
1017aef20: aa0003f3    	mov	x19, x0
1017aef24: 39c15fe8    	ldrsb	w8, [sp, #0x57]
1017aef28: 36f80068    	tbz	w8, #0x1f, 0x1017aef34 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x270>
1017aef2c: f94023e0    	ldr	x0, [sp, #0x40]
1017aef30: 945281f7    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017aef34: 910183e0    	add	x0, sp, #0x60
1017aef38: 97a288ee    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017aef3c: 9101c3e0    	add	x0, sp, #0x70
1017aef40: 97a288ec    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017aef44: 910203e0    	add	x0, sp, #0x80
1017aef48: 97a288ea    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017aef4c: 910243e0    	add	x0, sp, #0x90
1017aef50: 97a288e8    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017aef54: f85883a0    	ldur	x0, [x29, #-0x78]
1017aef58: f81883bf    	stur	xzr, [x29, #-0x78]
1017aef5c: b4000080    	cbz	x0, 0x1017aef6c <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)+0x2a8>
1017aef60: f9400008    	ldr	x8, [x0]
1017aef64: f9400508    	ldr	x8, [x8, #0x8]
1017aef68: d63f0100    	blr	x8
1017aef6c: d101c3a0    	sub	x0, x29, #0x70
1017aef70: 97a288e0    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017aef74: aa1403e0    	mov	x0, x20
1017aef78: 945281e5    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017aef7c: aa1303e0    	mov	x0, x19
1017aef80: 94527e02    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume

00000001017aef84 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)>:
1017aef84: 394003e8    	ldrb	w8, [sp]
1017aef88: f9400fe9    	ldr	x9, [sp, #0x18]
1017aef8c: 3cc083e0    	ldur	q0, [sp, #0x8]
1017aef90: 3c8083e0    	stur	q0, [sp, #0x8]
1017aef94: f9000fe9    	str	x9, [sp, #0x18]
1017aef98: 390003e8    	strb	w8, [sp]
1017aef9c: 17ffff4a    	b	0x1017aecc4 <wxime::data::dict::UserDictV2::UserDictV2(std::__1::shared_ptr<wxime::utils::IBloomFilter>, std::__1::unique_ptr<wxime::kv::IKV, std::__1::default_delete<wxime::kv::IKV>>, std::__1::shared_ptr<wxime::data::UserDictActionRecorder>, async::threadpool_scheduler&, wxime::data::HyperParams const&, unsigned short, std::__1::shared_ptr<wxime::data::dict::IUserDictCleanStrategy>, bool, std::__1::shared_ptr<wxime::utils::TimeMock>, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>)>

00000001017aefa0 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)>:
1017aefa0: d10143ff    	sub	sp, sp, #0x50
1017aefa4: a9034ff4    	stp	x20, x19, [sp, #0x30]
1017aefa8: a9047bfd    	stp	x29, x30, [sp, #0x40]
1017aefac: 910103fd    	add	x29, sp, #0x40
1017aefb0: f000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017aefb4: f9444529    	ldr	x9, [x9, #0x888]
1017aefb8: f9400129    	ldr	x9, [x9]
1017aefbc: f81e83a9    	stur	x9, [x29, #-0x18]
1017aefc0: f90013ff    	str	xzr, [sp, #0x20]
1017aefc4: 910023f3    	add	x19, sp, #0x8
1017aefc8: 910023e6    	add	x6, sp, #0x8
1017aefcc: 94000026    	bl	0x1017af064 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)>
1017aefd0: f94013e0    	ldr	x0, [sp, #0x20]
1017aefd4: eb13001f    	cmp	x0, x19
1017aefd8: 54000080    	b.eq	0x1017aefe8 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x48>
1017aefdc: b4000100    	cbz	x0, 0x1017aeffc <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x5c>
1017aefe0: 528000a8    	mov	w8, #0x5                ; =5
1017aefe4: 14000003    	b	0x1017aeff0 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x50>
1017aefe8: 52800088    	mov	w8, #0x4                ; =4
1017aefec: 910023e0    	add	x0, sp, #0x8
1017aeff0: f9400009    	ldr	x9, [x0]
1017aeff4: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017aeff8: d63f0100    	blr	x8
1017aeffc: f85e83a8    	ldur	x8, [x29, #-0x18]
1017af000: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af004: f9444529    	ldr	x9, [x9, #0x888]
1017af008: f9400129    	ldr	x9, [x9]
1017af00c: eb08013f    	cmp	x9, x8
1017af010: 540000a1    	b.ne	0x1017af024 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x84>
1017af014: a9447bfd    	ldp	x29, x30, [sp, #0x40]
1017af018: a9434ff4    	ldp	x20, x19, [sp, #0x30]
1017af01c: 910143ff    	add	sp, sp, #0x50
1017af020: d65f03c0    	ret
1017af024: 9452820e    	bl	0x102c4f85c <dyld_stub_binder+0x102c4f85c> ; ___stack_chk_fail
1017af028: 910023e8    	add	x8, sp, #0x8
1017af02c: aa0003f3    	mov	x19, x0
1017af030: f94013e0    	ldr	x0, [sp, #0x20]
1017af034: eb08001f    	cmp	x0, x8
1017af038: 54000081    	b.ne	0x1017af048 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xa8>
1017af03c: 52800088    	mov	w8, #0x4                ; =4
1017af040: 910023e0    	add	x0, sp, #0x8
1017af044: 14000003    	b	0x1017af050 <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xb0>
1017af048: b40000a0    	cbz	x0, 0x1017af05c <wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xbc>
1017af04c: 528000a8    	mov	w8, #0x5                ; =5
1017af050: f9400009    	ldr	x9, [x0]
1017af054: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af058: d63f0100    	blr	x8
1017af05c: aa1303e0    	mov	x0, x19
1017af060: 94527dca    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume

00000001017af064 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)>:
1017af064: d10243ff    	sub	sp, sp, #0x90
1017af068: a9036ffc    	stp	x28, x27, [sp, #0x30]
1017af06c: a90467fa    	stp	x26, x25, [sp, #0x40]
1017af070: a9055ff8    	stp	x24, x23, [sp, #0x50]
1017af074: a90657f6    	stp	x22, x21, [sp, #0x60]
1017af078: a9074ff4    	stp	x20, x19, [sp, #0x70]
1017af07c: a9087bfd    	stp	x29, x30, [sp, #0x80]
1017af080: 910203fd    	add	x29, sp, #0x80
1017af084: aa0803f8    	mov	x24, x8
1017af088: d000de08    	adrp	x8, 0x103371000 <dyld_stub_binder+0x103371000>
1017af08c: f9444508    	ldr	x8, [x8, #0x888]
1017af090: f9400108    	ldr	x8, [x8]
1017af094: f90017e8    	str	x8, [sp, #0x28]
1017af098: b4000262    	cbz	x2, 0x1017af0e4 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x80>
1017af09c: aa0403f4    	mov	x20, x4
1017af0a0: b4000224    	cbz	x4, 0x1017af0e4 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x80>
1017af0a4: aa0603fb    	mov	x27, x6
1017af0a8: aa0503f3    	mov	x19, x5
1017af0ac: aa0303f5    	mov	x21, x3
1017af0b0: aa0203f6    	mov	x22, x2
1017af0b4: aa0103f7    	mov	x23, x1
1017af0b8: f9401419    	ldr	x25, [x0, #0x28]
1017af0bc: 945280fb    	bl	0x102c4f4a8 <dyld_stub_binder+0x102c4f4a8> ; __ZNSt3__16chrono12system_clock3nowEv
1017af0c0: aa0003fa    	mov	x26, x0
1017af0c4: aa1b03e8    	mov	x8, x27
1017af0c8: f8418d09    	ldr	x9, [x8, #0x18]!
1017af0cc: b4000169    	cbz	x9, 0x1017af0f8 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x94>
1017af0d0: eb1b013f    	cmp	x9, x27
1017af0d4: 54000180    	b.eq	0x1017af104 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0xa0>
1017af0d8: f90013e9    	str	x9, [sp, #0x20]
1017af0dc: f900011f    	str	xzr, [x8]
1017af0e0: 14000010    	b	0x1017af120 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0xbc>
1017af0e4: b000e268    	adrp	x8, 0x1033fc000 <vtable for wxime::data::dict::UserDictV2+0x2c8>
1017af0e8: 911dc108    	add	x8, x8, #0x770
1017af0ec: f9000308    	str	x8, [x24]
1017af0f0: f9000f18    	str	x24, [x24, #0x18]
1017af0f4: 14000029    	b	0x1017af198 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x134>
1017af0f8: 910023e8    	add	x8, sp, #0x8
1017af0fc: f8018d1f    	str	xzr, [x8, #0x18]!
1017af100: 14000008    	b	0x1017af120 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0xbc>
1017af104: 910023e8    	add	x8, sp, #0x8
1017af108: f90013e8    	str	x8, [sp, #0x20]
1017af10c: f9400368    	ldr	x8, [x27]
1017af110: f9400d08    	ldr	x8, [x8, #0x18]
1017af114: 910023e1    	add	x1, sp, #0x8
1017af118: aa1b03e0    	mov	x0, x27
1017af11c: d63f0100    	blr	x8
1017af120: d2869b68    	mov	x8, #0x34db             ; =13531
1017af124: f2baf6c8    	movk	x8, #0xd7b6, lsl #16
1017af128: f2dbd048    	movk	x8, #0xde82, lsl #32
1017af12c: f2e86368    	movk	x8, #0x431b, lsl #48
1017af130: 9b487f48    	smulh	x8, x26, x8
1017af134: d37ffd09    	lsr	x9, x8, #63
1017af138: d352fd08    	lsr	x8, x8, #18
1017af13c: 0b090107    	add	w7, w8, w9
1017af140: 910023fa    	add	x26, sp, #0x8
1017af144: f90003fa    	str	x26, [sp]
1017af148: aa1803e8    	mov	x8, x24
1017af14c: aa1903e0    	mov	x0, x25
1017af150: aa1703e1    	mov	x1, x23
1017af154: aa1603e2    	mov	x2, x22
1017af158: aa1503e3    	mov	x3, x21
1017af15c: aa1403e4    	mov	x4, x20
1017af160: aa1303e5    	mov	x5, x19
1017af164: 52800026    	mov	w6, #0x1                ; =1
1017af168: 9400005f    	bl	0x1017af2e4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)>
1017af16c: f94013e0    	ldr	x0, [sp, #0x20]
1017af170: eb1a001f    	cmp	x0, x26
1017af174: 54000080    	b.eq	0x1017af184 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x120>
1017af178: b4000100    	cbz	x0, 0x1017af198 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x134>
1017af17c: 528000a8    	mov	w8, #0x5                ; =5
1017af180: 14000003    	b	0x1017af18c <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x128>
1017af184: 52800088    	mov	w8, #0x4                ; =4
1017af188: 910023e0    	add	x0, sp, #0x8
1017af18c: f9400009    	ldr	x9, [x0]
1017af190: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af194: d63f0100    	blr	x8
1017af198: f94017e8    	ldr	x8, [sp, #0x28]
1017af19c: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af1a0: f9444529    	ldr	x9, [x9, #0x888]
1017af1a4: f9400129    	ldr	x9, [x9]
1017af1a8: eb08013f    	cmp	x9, x8
1017af1ac: 54000121    	b.ne	0x1017af1d0 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x16c>
1017af1b0: a9487bfd    	ldp	x29, x30, [sp, #0x80]
1017af1b4: a9474ff4    	ldp	x20, x19, [sp, #0x70]
1017af1b8: a94657f6    	ldp	x22, x21, [sp, #0x60]
1017af1bc: a9455ff8    	ldp	x24, x23, [sp, #0x50]
1017af1c0: a94467fa    	ldp	x26, x25, [sp, #0x40]
1017af1c4: a9436ffc    	ldp	x28, x27, [sp, #0x30]
1017af1c8: 910243ff    	add	sp, sp, #0x90
1017af1cc: d65f03c0    	ret
1017af1d0: 945281a3    	bl	0x102c4f85c <dyld_stub_binder+0x102c4f85c> ; ___stack_chk_fail
1017af1d4: aa0003f3    	mov	x19, x0
1017af1d8: 340001e1    	cbz	w1, 0x1017af214 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1b0>
1017af1dc: aa1303e0    	mov	x0, x19
1017af1e0: 97e18b68    	bl	0x101011f80 <___clang_call_terminate>
1017af1e4: aa0003f3    	mov	x19, x0
1017af1e8: f94013e0    	ldr	x0, [sp, #0x20]
1017af1ec: eb1a001f    	cmp	x0, x26
1017af1f0: 54000081    	b.ne	0x1017af200 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x19c>
1017af1f4: 52800088    	mov	w8, #0x4                ; =4
1017af1f8: 910023e0    	add	x0, sp, #0x8
1017af1fc: 14000003    	b	0x1017af208 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1a4>
1017af200: b40000a0    	cbz	x0, 0x1017af214 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1b0>
1017af204: 528000a8    	mov	w8, #0x5                ; =5
1017af208: f9400009    	ldr	x9, [x0]
1017af20c: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af210: d63f0100    	blr	x8
1017af214: aa1303e0    	mov	x0, x19
1017af218: 94527d5c    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume

00000001017af21c <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)>:
1017af21c: d10143ff    	sub	sp, sp, #0x50
1017af220: a9034ff4    	stp	x20, x19, [sp, #0x30]
1017af224: a9047bfd    	stp	x29, x30, [sp, #0x40]
1017af228: 910103fd    	add	x29, sp, #0x40
1017af22c: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af230: f9444529    	ldr	x9, [x9, #0x888]
1017af234: f9400129    	ldr	x9, [x9]
1017af238: f81e83a9    	stur	x9, [x29, #-0x18]
1017af23c: d1004000    	sub	x0, x0, #0x10
1017af240: f90013ff    	str	xzr, [sp, #0x20]
1017af244: 910023f3    	add	x19, sp, #0x8
1017af248: 910023e6    	add	x6, sp, #0x8
1017af24c: 97ffff86    	bl	0x1017af064 <wxime::data::dict::UserDictV2::AddWithCallBack(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)>
1017af250: f94013e0    	ldr	x0, [sp, #0x20]
1017af254: eb13001f    	cmp	x0, x19
1017af258: 54000080    	b.eq	0x1017af268 <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x4c>
1017af25c: b4000100    	cbz	x0, 0x1017af27c <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x60>
1017af260: 528000a8    	mov	w8, #0x5                ; =5
1017af264: 14000003    	b	0x1017af270 <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x54>
1017af268: 52800088    	mov	w8, #0x4                ; =4
1017af26c: 910023e0    	add	x0, sp, #0x8
1017af270: f9400009    	ldr	x9, [x0]
1017af274: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af278: d63f0100    	blr	x8
1017af27c: f85e83a8    	ldur	x8, [x29, #-0x18]
1017af280: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af284: f9444529    	ldr	x9, [x9, #0x888]
1017af288: f9400129    	ldr	x9, [x9]
1017af28c: eb08013f    	cmp	x9, x8
1017af290: 540000a1    	b.ne	0x1017af2a4 <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0x88>
1017af294: a9447bfd    	ldp	x29, x30, [sp, #0x40]
1017af298: a9434ff4    	ldp	x20, x19, [sp, #0x30]
1017af29c: 910143ff    	add	sp, sp, #0x50
1017af2a0: d65f03c0    	ret
1017af2a4: 9452816e    	bl	0x102c4f85c <dyld_stub_binder+0x102c4f85c> ; ___stack_chk_fail
1017af2a8: 910023e8    	add	x8, sp, #0x8
1017af2ac: aa0003f3    	mov	x19, x0
1017af2b0: f94013e0    	ldr	x0, [sp, #0x20]
1017af2b4: eb08001f    	cmp	x0, x8
1017af2b8: 54000081    	b.ne	0x1017af2c8 <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xac>
1017af2bc: 52800088    	mov	w8, #0x4                ; =4
1017af2c0: 910023e0    	add	x0, sp, #0x8
1017af2c4: 14000003    	b	0x1017af2d0 <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xb4>
1017af2c8: b40000a0    	cbz	x0, 0x1017af2dc <non-virtual thunk to wxime::data::dict::UserDictV2::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&)+0xc0>
1017af2cc: 528000a8    	mov	w8, #0x5                ; =5
1017af2d0: f9400009    	ldr	x9, [x0]
1017af2d4: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af2d8: d63f0100    	blr	x8
1017af2dc: aa1303e0    	mov	x0, x19
1017af2e0: 94527d2a    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume

00000001017af2e4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)>:
1017af2e4: d10483ff    	sub	sp, sp, #0x120
1017af2e8: a90c6ffc    	stp	x28, x27, [sp, #0xc0]
1017af2ec: a90d67fa    	stp	x26, x25, [sp, #0xd0]
1017af2f0: a90e5ff8    	stp	x24, x23, [sp, #0xe0]
1017af2f4: a90f57f6    	stp	x22, x21, [sp, #0xf0]
1017af2f8: a9104ff4    	stp	x20, x19, [sp, #0x100]
1017af2fc: a9117bfd    	stp	x29, x30, [sp, #0x110]
1017af300: 910443fd    	add	x29, sp, #0x110
1017af304: f9000be8    	str	x8, [sp, #0x10]
1017af308: d000de08    	adrp	x8, 0x103371000 <dyld_stub_binder+0x103371000>
1017af30c: f9444508    	ldr	x8, [x8, #0x888]
1017af310: f9400108    	ldr	x8, [x8]
1017af314: f81a03a8    	stur	x8, [x29, #-0x60]
1017af318: 92800108    	mov	x8, #-0x9               ; =-9
1017af31c: f2efffe8    	movk	x8, #0x7fff, lsl #48
1017af320: eb08005f    	cmp	x2, x8
1017af324: 540018c8    	b.hi	0x1017af63c <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x358>
1017af328: aa0703f3    	mov	x19, x7
1017af32c: aa0603f6    	mov	x22, x6
1017af330: aa0503f8    	mov	x24, x5
1017af334: aa0403f9    	mov	x25, x4
1017af338: aa0303f7    	mov	x23, x3
1017af33c: aa0203fb    	mov	x27, x2
1017af340: aa0003fa    	mov	x26, x0
1017af344: f9401808    	ldr	x8, [x0, #0x30]
1017af348: f9000fe8    	str	x8, [sp, #0x18]
1017af34c: 9280011c    	mov	x28, #-0x9              ; =-9
1017af350: f2effffc    	movk	x28, #0x7fff, lsl #48
1017af354: f1005c5f    	cmp	x2, #0x17
1017af358: 540000a2    	b.hs	0x1017af36c <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x88>
1017af35c: 3900fffb    	strb	w27, [sp, #0x3f]
1017af360: 9100a3f5    	add	x21, sp, #0x28
1017af364: b500031b    	cbnz	x27, 0x1017af3c4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0xe0>
1017af368: 1400001a    	b	0x1017af3d0 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0xec>
1017af36c: 927df368    	and	x8, x27, #0xfffffffffffffff8
1017af370: 91002108    	add	x8, x8, #0x8
1017af374: b2400b69    	orr	x9, x27, #0x7
1017af378: f1005d3f    	cmp	x9, #0x17
1017af37c: 9a890108    	csel	x8, x8, x9, eq
1017af380: f90007f7    	str	x23, [sp, #0x8]
1017af384: aa1803f4    	mov	x20, x24
1017af388: aa1603f8    	mov	x24, x22
1017af38c: aa1303f6    	mov	x22, x19
1017af390: 91000513    	add	x19, x8, #0x1
1017af394: aa1303e0    	mov	x0, x19
1017af398: aa0103f5    	mov	x21, x1
1017af39c: 945280e8    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017af3a0: aa1503e1    	mov	x1, x21
1017af3a4: aa0003f5    	mov	x21, x0
1017af3a8: b2410268    	orr	x8, x19, #0x8000000000000000
1017af3ac: aa1603f3    	mov	x19, x22
1017af3b0: aa1803f6    	mov	x22, x24
1017af3b4: aa1403f8    	mov	x24, x20
1017af3b8: f94007f7    	ldr	x23, [sp, #0x8]
1017af3bc: a90323fb    	stp	x27, x8, [sp, #0x30]
1017af3c0: f90017e0    	str	x0, [sp, #0x28]
1017af3c4: aa1503e0    	mov	x0, x21
1017af3c8: aa1b03e2    	mov	x2, x27
1017af3cc: 94528433    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
1017af3d0: 383b6abf    	strb	wzr, [x21, x27]
1017af3d4: 9100a3e8    	add	x8, sp, #0x28
1017af3d8: 9100611b    	add	x27, x8, #0x18
1017af3dc: eb1c033f    	cmp	x25, x28
1017af3e0: 54001348    	b.hi	0x1017af648 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x364>
1017af3e4: f1005f3f    	cmp	x25, #0x17
1017af3e8: 54000082    	b.hs	0x1017af3f8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x114>
1017af3ec: 39015ff9    	strb	w25, [sp, #0x57]
1017af3f0: b50001d9    	cbnz	x25, 0x1017af428 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x144>
1017af3f4: 14000011    	b	0x1017af438 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x154>
1017af3f8: 927df328    	and	x8, x25, #0xfffffffffffffff8
1017af3fc: 91002108    	add	x8, x8, #0x8
1017af400: b2400b29    	orr	x9, x25, #0x7
1017af404: f1005d3f    	cmp	x9, #0x17
1017af408: 9a890108    	csel	x8, x8, x9, eq
1017af40c: 91000515    	add	x21, x8, #0x1
1017af410: aa1503e0    	mov	x0, x21
1017af414: 945280ca    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017af418: aa0003fb    	mov	x27, x0
1017af41c: b24102a8    	orr	x8, x21, #0x8000000000000000
1017af420: a904a3f9    	stp	x25, x8, [sp, #0x48]
1017af424: f90023e0    	str	x0, [sp, #0x40]
1017af428: aa1b03e0    	mov	x0, x27
1017af42c: aa1703e1    	mov	x1, x23
1017af430: aa1903e2    	mov	x2, x25
1017af434: 94528419    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
1017af438: f9400ba0    	ldr	x0, [x29, #0x10]
1017af43c: 38396b7f    	strb	wzr, [x27, x25]
1017af440: 3dc00300    	ldr	q0, [x24]
1017af444: 3c8583e0    	stur	q0, [sp, #0x58]
1017af448: b9401308    	ldr	w8, [x24, #0x10]
1017af44c: 290d5be8    	stp	w8, w22, [sp, #0x68]
1017af450: b90073f3    	str	w19, [sp, #0x70]
1017af454: a9492349    	ldp	x9, x8, [x26, #0x90]
1017af458: a907a3e9    	stp	x9, x8, [sp, #0x78]
1017af45c: b4000088    	cbz	x8, 0x1017af46c <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x188>
1017af460: 91002108    	add	x8, x8, #0x8
1017af464: 52800029    	mov	w9, #0x1                ; =1
1017af468: f8290108    	ldadd	x9, x8, [x8]
1017af46c: 9100a3ea    	add	x10, sp, #0x28
1017af470: 91018156    	add	x22, x10, #0x60
1017af474: aa0003e8    	mov	x8, x0
1017af478: f8418d09    	ldr	x9, [x8, #0x18]!
1017af47c: b40000c9    	cbz	x9, 0x1017af494 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1b0>
1017af480: eb00013f    	cmp	x9, x0
1017af484: 540000e0    	b.eq	0x1017af4a0 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1bc>
1017af488: f90053e9    	str	x9, [sp, #0xa0]
1017af48c: f900011f    	str	xzr, [x8]
1017af490: 14000009    	b	0x1017af4b4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1d0>
1017af494: 9101e148    	add	x8, x10, #0x78
1017af498: f900011f    	str	xzr, [x8]
1017af49c: 14000006    	b	0x1017af4b4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x1d0>
1017af4a0: f90053f6    	str	x22, [sp, #0xa0]
1017af4a4: f9400008    	ldr	x8, [x0]
1017af4a8: f9400d08    	ldr	x8, [x8, #0x18]
1017af4ac: aa1603e1    	mov	x1, x22
1017af4b0: d63f0100    	blr	x8
1017af4b4: f90057fa    	str	x26, [sp, #0xa8]
1017af4b8: 910083e8    	add	x8, sp, #0x20
1017af4bc: 9100a3e1    	add	x1, sp, #0x28
1017af4c0: f9400fe0    	ldr	x0, [sp, #0x18]
1017af4c4: 94001cb9    	bl	0x1017b67a8 <async::task<async::detail::remove_task<std::__1::invoke_result<__decay(wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)::'lambda'())>::type>::type> async::spawn<async::threadpool_scheduler, wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)::'lambda'()>(async::threadpool_scheduler&, wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)::'lambda'()&&)>
1017af4c8: f94053e9    	ldr	x9, [sp, #0xa0]
1017af4cc: eb16013f    	cmp	x9, x22
1017af4d0: 540000a0    	b.eq	0x1017af4e4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x200>
1017af4d4: b4000129    	cbz	x9, 0x1017af4f8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x214>
1017af4d8: 528000a8    	mov	w8, #0x5                ; =5
1017af4dc: aa0903f6    	mov	x22, x9
1017af4e0: 14000002    	b	0x1017af4e8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x204>
1017af4e4: 52800088    	mov	w8, #0x4                ; =4
1017af4e8: f94002c9    	ldr	x9, [x22]
1017af4ec: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017af4f0: aa1603e0    	mov	x0, x22
1017af4f4: d63f0100    	blr	x8
1017af4f8: f94043f5    	ldr	x21, [sp, #0x80]
1017af4fc: b40000b5    	cbz	x21, 0x1017af510 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x22c>
1017af500: 910022a8    	add	x8, x21, #0x8
1017af504: 92800009    	mov	x9, #-0x1               ; =-1
1017af508: f8e90108    	ldaddal	x9, x8, [x8]
1017af50c: b40004c8    	cbz	x8, 0x1017af5a4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x2c0>
1017af510: 39c15fe8    	ldrsb	w8, [sp, #0x57]
1017af514: 37f80588    	tbnz	w8, #0x1f, 0x1017af5c4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x2e0>
1017af518: 39c0ffe8    	ldrsb	w8, [sp, #0x3f]
1017af51c: 37f805c8    	tbnz	w8, #0x1f, 0x1017af5d4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x2f0>
1017af520: f94013f5    	ldr	x21, [sp, #0x20]
1017af524: f90013ff    	str	xzr, [sp, #0x20]
1017af528: 3945c348    	ldrb	w8, [x26, #0x170]
1017af52c: 350005a8    	cbnz	w8, 0x1017af5e0 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x2fc>
1017af530: b000e268    	adrp	x8, 0x1033fc000 <vtable for wxime::data::dict::UserDictV2+0x2c8>
1017af534: 91184108    	add	x8, x8, #0x610
1017af538: f9400be9    	ldr	x9, [sp, #0x10]
1017af53c: a9005528    	stp	x8, x21, [x9]
1017af540: f9000d29    	str	x9, [x9, #0x18]
1017af544: f94013e0    	ldr	x0, [sp, #0x20]
1017af548: b4000120    	cbz	x0, 0x1017af56c <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x288>
1017af54c: 92800008    	mov	x8, #-0x1               ; =-1
1017af550: f8680008    	ldaddl	x8, x8, [x0]
1017af554: f100051f    	cmp	x8, #0x1
1017af558: 540000a1    	b.ne	0x1017af56c <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x288>
1017af55c: d50339bf    	dmb	ishld
1017af560: f9400c08    	ldr	x8, [x0, #0x18]
1017af564: f9400108    	ldr	x8, [x8]
1017af568: d63f0100    	blr	x8
1017af56c: f85a03a8    	ldur	x8, [x29, #-0x60]
1017af570: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af574: f9444529    	ldr	x9, [x9, #0x888]
1017af578: f9400129    	ldr	x9, [x9]
1017af57c: eb08013f    	cmp	x9, x8
1017af580: 540006a1    	b.ne	0x1017af654 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x370>
1017af584: a9517bfd    	ldp	x29, x30, [sp, #0x110]
1017af588: a9504ff4    	ldp	x20, x19, [sp, #0x100]
1017af58c: a94f57f6    	ldp	x22, x21, [sp, #0xf0]
1017af590: a94e5ff8    	ldp	x24, x23, [sp, #0xe0]
1017af594: a94d67fa    	ldp	x26, x25, [sp, #0xd0]
1017af598: a94c6ffc    	ldp	x28, x27, [sp, #0xc0]
1017af59c: 910483ff    	add	sp, sp, #0x120
1017af5a0: d65f03c0    	ret
1017af5a4: f94002a8    	ldr	x8, [x21]
1017af5a8: f9400908    	ldr	x8, [x8, #0x10]
1017af5ac: aa1503e0    	mov	x0, x21
1017af5b0: d63f0100    	blr	x8
1017af5b4: aa1503e0    	mov	x0, x21
1017af5b8: 94527f44    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017af5bc: 39c15fe8    	ldrsb	w8, [sp, #0x57]
1017af5c0: 36fffac8    	tbz	w8, #0x1f, 0x1017af518 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x234>
1017af5c4: f94023e0    	ldr	x0, [sp, #0x40]
1017af5c8: 94528051    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017af5cc: 39c0ffe8    	ldrsb	w8, [sp, #0x3f]
1017af5d0: 36fffa88    	tbz	w8, #0x1f, 0x1017af520 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x23c>
1017af5d4: f94017e0    	ldr	x0, [sp, #0x28]
1017af5d8: 9452804d    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017af5dc: 17ffffd1    	b	0x1017af520 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x23c>
1017af5e0: 910022a8    	add	x8, x21, #0x8
1017af5e4: 38bfc108    	ldaprb	w8, [x8]
1017af5e8: 51000d08    	sub	w8, w8, #0x3
1017af5ec: 7100091f    	cmp	w8, #0x2
1017af5f0: 54000083    	b.lo	0x1017af600 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x31c>
1017af5f4: aa1503e0    	mov	x0, x21
1017af5f8: 94223aba    	bl	0x10203e0e0 <async::detail::wait_for_task(async::detail::task_base*)>
1017af5fc: 394022bf    	ldrb	wzr, [x21, #0x8]
1017af600: b000e268    	adrp	x8, 0x1033fc000 <vtable for wxime::data::dict::UserDictV2+0x2c8>
1017af604: 91164108    	add	x8, x8, #0x590
1017af608: f9400be9    	ldr	x9, [sp, #0x10]
1017af60c: f9000128    	str	x8, [x9]
1017af610: f9000d29    	str	x9, [x9, #0x18]
1017af614: 92800008    	mov	x8, #-0x1               ; =-1
1017af618: f86802a8    	ldaddl	x8, x8, [x21]
1017af61c: f100051f    	cmp	x8, #0x1
1017af620: 54fff921    	b.ne	0x1017af544 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x260>
1017af624: d50339bf    	dmb	ishld
1017af628: f9400ea8    	ldr	x8, [x21, #0x18]
1017af62c: f9400108    	ldr	x8, [x8]
1017af630: aa1503e0    	mov	x0, x21
1017af634: d63f0100    	blr	x8
1017af638: 17ffffc3    	b	0x1017af544 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x260>
1017af63c: 9100a3e0    	add	x0, sp, #0x28
1017af640: 97a24d34    	bl	0x100042b10 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__throw_length_error[abi:ne180100]() const>
1017af644: 14000003    	b	0x1017af650 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x36c>
1017af648: aa1b03e0    	mov	x0, x27
1017af64c: 97a24d31    	bl	0x100042b10 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__throw_length_error[abi:ne180100]() const>
1017af650: d4200020    	brk	#0x1
1017af654: 94528082    	bl	0x102c4f85c <dyld_stub_binder+0x102c4f85c> ; ___stack_chk_fail
1017af658: aa0003f3    	mov	x19, x0
1017af65c: 92800008    	mov	x8, #-0x1               ; =-1
1017af660: f86802a8    	ldaddl	x8, x8, [x21]
1017af664: f100051f    	cmp	x8, #0x1
1017af668: 54000061    	b.ne	0x1017af674 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x390>
1017af66c: aa1503e0    	mov	x0, x21
1017af670: 94521ddb    	bl	0x102c36ddc <wxime::data::dict::RecordWithFreqOnMemoryDict<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue, wxime::data::dict::RecordWithFreqOnMemoryFilter<wxime::data::dict::DefaultRecordWithFreqOnMemoryKey, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue>>::Update(wxime::data::dict::DefaultRecordWithFreqOnMemoryKey const&, wxime::data::dict::DefaultRecordWithFreqOnMemoryValue const&) (.cold.1)>
1017af674: f94013e0    	ldr	x0, [sp, #0x20]
1017af678: b4000380    	cbz	x0, 0x1017af6e8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x404>
1017af67c: 92800008    	mov	x8, #-0x1               ; =-1
1017af680: f8680008    	ldaddl	x8, x8, [x0]
1017af684: f100051f    	cmp	x8, #0x1
1017af688: 54000301    	b.ne	0x1017af6e8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x404>
1017af68c: d50339bf    	dmb	ishld
1017af690: f9400c08    	ldr	x8, [x0, #0x18]
1017af694: f9400108    	ldr	x8, [x8]
1017af698: d63f0100    	blr	x8
1017af69c: aa1303e0    	mov	x0, x19
1017af6a0: 94527c3a    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017af6a4: aa0003f3    	mov	x19, x0
1017af6a8: 34000201    	cbz	w1, 0x1017af6e8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x404>
1017af6ac: aa1303e0    	mov	x0, x19
1017af6b0: 97e18a34    	bl	0x101011f80 <___clang_call_terminate>
1017af6b4: aa0003f3    	mov	x19, x0
1017af6b8: 9100a3e0    	add	x0, sp, #0x28
1017af6bc: 94001cbe    	bl	0x1017b69b4 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)::'lambda'()::~()>
1017af6c0: aa1303e0    	mov	x0, x19
1017af6c4: 94527c31    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017af6c8: aa0003f3    	mov	x19, x0
1017af6cc: aa1303e0    	mov	x0, x19
1017af6d0: 94527c2e    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017af6d4: aa0003f3    	mov	x19, x0
1017af6d8: 39c0ffe8    	ldrsb	w8, [sp, #0x3f]
1017af6dc: 36f80068    	tbz	w8, #0x1f, 0x1017af6e8 <wxime::data::dict::UserDictV2::Impl::Add(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, std::__1::function<void (std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictV2*)>)+0x404>
1017af6e0: f94017e0    	ldr	x0, [sp, #0x28]
1017af6e4: 9452800a    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017af6e8: aa1303e0    	mov	x0, x19
1017af6ec: 94527c27    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume

00000001017af6f0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)>:
1017af6f0: a9ba6ffc    	stp	x28, x27, [sp, #-0x60]!
1017af6f4: a90167fa    	stp	x26, x25, [sp, #0x10]
1017af6f8: a9025ff8    	stp	x24, x23, [sp, #0x20]
1017af6fc: a90357f6    	stp	x22, x21, [sp, #0x30]
1017af700: a9044ff4    	stp	x20, x19, [sp, #0x40]
1017af704: a9057bfd    	stp	x29, x30, [sp, #0x50]
1017af708: 910143fd    	add	x29, sp, #0x50
1017af70c: d10703ff    	sub	sp, sp, #0x1c0
1017af710: aa0303f3    	mov	x19, x3
1017af714: aa0203f4    	mov	x20, x2
1017af718: d000de08    	adrp	x8, 0x103371000 <dyld_stub_binder+0x103371000>
1017af71c: f9444508    	ldr	x8, [x8, #0x888]
1017af720: f9400108    	ldr	x8, [x8]
1017af724: f81a03a8    	stur	x8, [x29, #-0x60]
1017af728: b40003c3    	cbz	x3, 0x1017af7a0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0xb0>
1017af72c: 39400289    	ldrb	w9, [x20]
1017af730: 7100b13f    	cmp	w9, #0x2c
1017af734: 54000360    	b.eq	0x1017af7a0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0xb0>
1017af738: aa0703fa    	mov	x26, x7
1017af73c: aa0603f5    	mov	x21, x6
1017af740: aa0503f6    	mov	x22, x5
1017af744: aa0403f7    	mov	x23, x4
1017af748: aa0103f9    	mov	x25, x1
1017af74c: aa0003f8    	mov	x24, x0
1017af750: 52800008    	mov	w8, #0x0                ; =0
1017af754: 394053bc    	ldrb	w28, [x29, #0x14]
1017af758: b94013ae    	ldr	w14, [x29, #0x10]
1017af75c: 5280002a    	mov	w10, #0x1               ; =1
1017af760: d000d00b    	adrp	x11, 0x1031b1000 <stbi_write_jpg_core(stbi__write_context*, int, int, int, void const*, int)::YAC_HT+0x2d8>
1017af764: 9129416b    	add	x11, x11, #0xa50
1017af768: 37000068    	tbnz	w8, #0x0, 0x1017af774 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x84>
1017af76c: 38694969    	ldrb	w9, [x11, w9, uxtw]
1017af770: 36000189    	tbz	w9, #0x0, 0x1017af7a0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0xb0>
1017af774: eb0a027f    	cmp	x19, x10
1017af778: 54000120    	b.eq	0x1017af79c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0xac>
1017af77c: 386a6a89    	ldrb	w9, [x20, x10]
1017af780: 7100b13f    	cmp	w9, #0x2c
1017af784: 1a9f17ec    	cset	w12, eq
1017af788: 0a0c010d    	and	w13, w8, w12
1017af78c: 9100054a    	add	x10, x10, #0x1
1017af790: aa0c03e8    	mov	x8, x12
1017af794: 3607fead    	tbz	w13, #0x0, 0x1017af768 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x78>
1017af798: 14000002    	b	0x1017af7a0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0xb0>
1017af79c: 36000888    	tbz	w8, #0x0, 0x1017af8ac <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1bc>
1017af7a0: 942243a1    	bl	0x102040624 <loguru::current_verbosity_cutoff()>
1017af7a4: 3100081f    	cmn	w0, #0x2
1017af7a8: 5400066b    	b.lt	0x1017af874 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x184>
1017af7ac: 12800028    	mov	w8, #-0x2               ; =-2
1017af7b0: b90073e8    	str	w8, [sp, #0x70]
1017af7b4: b000bd88    	adrp	x8, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017af7b8: 91190508    	add	x8, x8, #0x641 ; /Volumes/data/workspace/ime/wxime/data/dict/user_dict_v2.cpp
1017af7bc: f9003fe8    	str	x8, [sp, #0x78]
1017af7c0: 52801628    	mov	w8, #0xb1               ; =177
1017af7c4: b90083e8    	str	w8, [sp, #0x80]
1017af7c8: 9101c3f6    	add	x22, sp, #0x70
1017af7cc: 910222d5    	add	x21, x22, #0x88
1017af7d0: 910082d7    	add	x23, x22, #0x20
1017af7d4: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017af7d8: 91198108    	add	x8, x8, #0x660
1017af7dc: 91006109    	add	x9, x8, #0x18
1017af7e0: 91010108    	add	x8, x8, #0x40
1017af7e4: f90047e9    	str	x9, [sp, #0x88]
1017af7e8: f9007fe8    	str	x8, [sp, #0xf8]
1017af7ec: aa1503e0    	mov	x0, x21
1017af7f0: aa1703e1    	mov	x1, x23
1017af7f4: 94527f66    	bl	0x102c4f58c <dyld_stub_binder+0x102c4f58c> ; __ZNSt3__18ios_base4initEPv
1017af7f8: 910062d6    	add	x22, x22, #0x18
1017af7fc: f900c3ff    	str	xzr, [sp, #0x180]
1017af800: 12800008    	mov	w8, #-0x1               ; =-1
1017af804: b9018be8    	str	w8, [sp, #0x188]
1017af808: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017af80c: 9117c108    	add	x8, x8, #0x5f0
1017af810: 91006109    	add	x9, x8, #0x18
1017af814: 91010108    	add	x8, x8, #0x40
1017af818: f90047e9    	str	x9, [sp, #0x88]
1017af81c: f9007fe8    	str	x8, [sp, #0xf8]
1017af820: aa1703e0    	mov	x0, x23
1017af824: 94527e6a    	bl	0x102c4f1cc <dyld_stub_binder+0x102c4f1cc> ; __ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
1017af828: f000e088    	adrp	x8, 0x1033c2000 <vtable for xsp::TrainerSpec+0x48>
1017af82c: 91188108    	add	x8, x8, #0x620
1017af830: 91004108    	add	x8, x8, #0x10
1017af834: f9004be8    	str	x8, [sp, #0x90]
1017af838: 6f00e400    	movi.2d	v0, #0000000000000000
1017af83c: ad0683e0    	stp	q0, q0, [sp, #0xd0]
1017af840: 52800208    	mov	w8, #0x10               ; =16
1017af844: b900f3e8    	str	w8, [sp, #0xf0]
1017af848: b000bd81    	adrp	x1, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017af84c: 9120c821    	add	x1, x1, #0x832 ; try add invalid syllable: 
1017af850: aa1603e0    	mov	x0, x22
1017af854: 52800342    	mov	w2, #0x1a               ; =26
1017af858: 97a28f5e    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017af85c: aa1603e0    	mov	x0, x22
1017af860: aa1403e1    	mov	x1, x20
1017af864: aa1303e2    	mov	x2, x19
1017af868: 97a28f5a    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017af86c: 9101c3e0    	add	x0, sp, #0x70
1017af870: 94224c50    	bl	0x1020429b0 <loguru::StreamLogger::~StreamLogger()>
1017af874: f85a03a8    	ldur	x8, [x29, #-0x60]
1017af878: d000de09    	adrp	x9, 0x103371000 <dyld_stub_binder+0x103371000>
1017af87c: f9444529    	ldr	x9, [x9, #0x888]
1017af880: f9400129    	ldr	x9, [x9]
1017af884: eb08013f    	cmp	x9, x8
1017af888: 540029e1    	b.ne	0x1017afdc4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6d4>
1017af88c: 910703ff    	add	sp, sp, #0x1c0
1017af890: a9457bfd    	ldp	x29, x30, [sp, #0x50]
1017af894: a9444ff4    	ldp	x20, x19, [sp, #0x40]
1017af898: a94357f6    	ldp	x22, x21, [sp, #0x30]
1017af89c: a9425ff8    	ldp	x24, x23, [sp, #0x20]
1017af8a0: a94167fa    	ldp	x26, x25, [sp, #0x10]
1017af8a4: a8c66ffc    	ldp	x28, x27, [sp], #0x60
1017af8a8: d65f03c0    	ret
1017af8ac: b90007ee    	str	w14, [sp, #0x4]
1017af8b0: f9400b00    	ldr	x0, [x24, #0x10]
1017af8b4: b4000080    	cbz	x0, 0x1017af8c4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1d4>
1017af8b8: aa1403e1    	mov	x1, x20
1017af8bc: aa1303e2    	mov	x2, x19
1017af8c0: 94001e3e    	bl	0x1017b71b8 <wxime::data::LeafFrontierSeparatedBloomFilterReaderWriter::Add(wxime::utils::IBloomFilter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>)>
1017af8c4: f9405300    	ldr	x0, [x24, #0xa0]
1017af8c8: b4000040    	cbz	x0, 0x1017af8d0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e0>
1017af8cc: 35001ddc    	cbnz	w28, 0x1017afc84 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x594>
1017af8d0: 3945c308    	ldrb	w8, [x24, #0x170]
1017af8d4: 34001e08    	cbz	w8, 0x1017afc94 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x5a4>
1017af8d8: 92800108    	mov	x8, #-0x9               ; =-9
1017af8dc: f2efffe8    	movk	x8, #0x7fff, lsl #48
1017af8e0: eb0802df    	cmp	x22, x8
1017af8e4: 54002728    	b.hi	0x1017afdc8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6d8>
1017af8e8: f1005edf    	cmp	x22, #0x17
1017af8ec: 540000a2    	b.hs	0x1017af900 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x210>
1017af8f0: 39017ff6    	strb	w22, [sp, #0x5f]
1017af8f4: 910123fb    	add	x27, sp, #0x48
1017af8f8: b5000216    	cbnz	x22, 0x1017af938 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x248>
1017af8fc: 14000013    	b	0x1017af948 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x258>
1017af900: b90003fc    	str	w28, [sp]
1017af904: 927df2c8    	and	x8, x22, #0xfffffffffffffff8
1017af908: 91002108    	add	x8, x8, #0x8
1017af90c: b2400ac9    	orr	x9, x22, #0x7
1017af910: f1005d3f    	cmp	x9, #0x17
1017af914: 9a890108    	csel	x8, x8, x9, eq
1017af918: 9100051c    	add	x28, x8, #0x1
1017af91c: aa1c03e0    	mov	x0, x28
1017af920: 94527f87    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017af924: aa0003fb    	mov	x27, x0
1017af928: b2410388    	orr	x8, x28, #0x8000000000000000
1017af92c: a90523f6    	stp	x22, x8, [sp, #0x50]
1017af930: f90027e0    	str	x0, [sp, #0x48]
1017af934: b94003fc    	ldr	w28, [sp]
