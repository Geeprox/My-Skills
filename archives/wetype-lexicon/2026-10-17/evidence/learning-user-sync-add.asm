
work/v3/WeType.arm64:	file format mach-o arm64

Disassembly of section __TEXT,__text:

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
1017af938: aa1b03e0    	mov	x0, x27
1017af93c: aa1703e1    	mov	x1, x23
1017af940: aa1603e2    	mov	x2, x22
1017af944: 945282d5    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
1017af948: 38366b7f    	strb	wzr, [x27, x22]
1017af94c: 9101c3e0    	add	x0, sp, #0x70
1017af950: 910123e1    	add	x1, sp, #0x48
1017af954: aa1a03e2    	mov	x2, x26
1017af958: b94007e3    	ldr	w3, [sp, #0x4]
1017af95c: aa1503e4    	mov	x4, x21
1017af960: 940075ac    	bl	0x1017cd010 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)>
1017af964: 394032a5    	ldrb	w5, [x21, #0xc]
1017af968: f9400328    	ldr	x8, [x25]
1017af96c: f9403908    	ldr	x8, [x8, #0x70]
1017af970: 9101c3e3    	add	x3, sp, #0x70
1017af974: aa1903e0    	mov	x0, x25
1017af978: aa1403e1    	mov	x1, x20
1017af97c: aa1303e2    	mov	x2, x19
1017af980: aa1c03e4    	mov	x4, x28
1017af984: d63f0100    	blr	x8
1017af988: 39c2dfe8    	ldrsb	w8, [sp, #0xb7]
1017af98c: 37f800c8    	tbnz	w8, #0x1f, 0x1017af9a4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x2b4>
1017af990: 39c17fe8    	ldrsb	w8, [sp, #0x5f]
1017af994: 37f80108    	tbnz	w8, #0x1f, 0x1017af9b4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x2c4>
1017af998: b94012a8    	ldr	w8, [x21, #0x10]
1017af99c: 35000148    	cbnz	w8, 0x1017af9c4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x2d4>
1017af9a0: 1400004d    	b	0x1017afad4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x3e4>
1017af9a4: f94053e0    	ldr	x0, [sp, #0xa0]
1017af9a8: 94527f59    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017af9ac: 39c17fe8    	ldrsb	w8, [sp, #0x5f]
1017af9b0: 36ffff48    	tbz	w8, #0x1f, 0x1017af998 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x2a8>
1017af9b4: f94027e0    	ldr	x0, [sp, #0x48]
1017af9b8: 94527f55    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017af9bc: b94012a8    	ldr	w8, [x21, #0x10]
1017af9c0: 340008a8    	cbz	w8, 0x1017afad4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x3e4>
1017af9c4: 94224318    	bl	0x102040624 <loguru::current_verbosity_cutoff()>
1017af9c8: 37f80860    	tbnz	w0, #0x1f, 0x1017afad4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x3e4>
1017af9cc: b90073ff    	str	wzr, [sp, #0x70]
1017af9d0: b000bd88    	adrp	x8, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017af9d4: 91190508    	add	x8, x8, #0x641 ; /Volumes/data/workspace/ime/wxime/data/dict/user_dict_v2.cpp
1017af9d8: f9003fe8    	str	x8, [sp, #0x78]
1017af9dc: 528019c8    	mov	w8, #0xce               ; =206
1017af9e0: b90083e8    	str	w8, [sp, #0x80]
1017af9e4: 9101c3f9    	add	x25, sp, #0x70
1017af9e8: 9102233a    	add	x26, x25, #0x88
1017af9ec: 9100833b    	add	x27, x25, #0x20
1017af9f0: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017af9f4: 91198108    	add	x8, x8, #0x660
1017af9f8: 91006109    	add	x9, x8, #0x18
1017af9fc: 91010108    	add	x8, x8, #0x40
1017afa00: f90047e9    	str	x9, [sp, #0x88]
1017afa04: f9007fe8    	str	x8, [sp, #0xf8]
1017afa08: aa1a03e0    	mov	x0, x26
1017afa0c: aa1b03e1    	mov	x1, x27
1017afa10: 94527edf    	bl	0x102c4f58c <dyld_stub_binder+0x102c4f58c> ; __ZNSt3__18ios_base4initEPv
1017afa14: 91006339    	add	x25, x25, #0x18
1017afa18: f900c3ff    	str	xzr, [sp, #0x180]
1017afa1c: 12800008    	mov	w8, #-0x1               ; =-1
1017afa20: b9018be8    	str	w8, [sp, #0x188]
1017afa24: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017afa28: 9117c108    	add	x8, x8, #0x5f0
1017afa2c: 91006109    	add	x9, x8, #0x18
1017afa30: 91010108    	add	x8, x8, #0x40
1017afa34: f90047e9    	str	x9, [sp, #0x88]
1017afa38: f9007fe8    	str	x8, [sp, #0xf8]
1017afa3c: aa1b03e0    	mov	x0, x27
1017afa40: 94527de3    	bl	0x102c4f1cc <dyld_stub_binder+0x102c4f1cc> ; __ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
1017afa44: f000e088    	adrp	x8, 0x1033c2000 <vtable for xsp::TrainerSpec+0x48>
1017afa48: 91188108    	add	x8, x8, #0x620
1017afa4c: 91004108    	add	x8, x8, #0x10
1017afa50: f9004be8    	str	x8, [sp, #0x90]
1017afa54: 6f00e400    	movi.2d	v0, #0000000000000000
1017afa58: ad0683e0    	stp	q0, q0, [sp, #0xd0]
1017afa5c: 52800208    	mov	w8, #0x10               ; =16
1017afa60: b900f3e8    	str	w8, [sp, #0xf0]
1017afa64: b000bd81    	adrp	x1, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017afa68: 91213421    	add	x1, x1, #0x84d ; [PendingPattern][write] word=
1017afa6c: aa1903e0    	mov	x0, x25
1017afa70: 528003a2    	mov	w2, #0x1d               ; =29
1017afa74: 97a28ed7    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017afa78: aa1903e0    	mov	x0, x25
1017afa7c: aa1703e1    	mov	x1, x23
1017afa80: aa1603e2    	mov	x2, x22
1017afa84: 97a28ed3    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017afa88: b000bd81    	adrp	x1, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017afa8c: 9121ac21    	add	x1, x1, #0x86b ; , syllable=
1017afa90: aa1903e0    	mov	x0, x25
1017afa94: 52800162    	mov	w2, #0xb                ; =11
1017afa98: 97a28ece    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017afa9c: aa1903e0    	mov	x0, x25
1017afaa0: aa1403e1    	mov	x1, x20
1017afaa4: aa1303e2    	mov	x2, x19
1017afaa8: 97a28eca    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017afaac: b000bd81    	adrp	x1, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017afab0: 9121dc21    	add	x1, x1, #0x877 ; , pattern=
1017afab4: aa1903e0    	mov	x0, x25
1017afab8: 52800142    	mov	w2, #0xa                ; =10
1017afabc: 97a28ec5    	bl	0x1000535d0 <std::__1::basic_ostream<char, std::__1::char_traits<char>>& std::__1::__put_character_sequence[abi:ne180100]<char, std::__1::char_traits<char>>(std::__1::basic_ostream<char, std::__1::char_traits<char>>&, char const*, unsigned long)>
1017afac0: b94012a1    	ldr	w1, [x21, #0x10]
1017afac4: aa1903e0    	mov	x0, x25
1017afac8: 94527d94    	bl	0x102c4f118 <dyld_stub_binder+0x102c4f118> ; __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
1017afacc: 9101c3e0    	add	x0, sp, #0x70
1017afad0: 94224bb8    	bl	0x1020429b0 <loguru::StreamLogger::~StreamLogger()>
1017afad4: aa1803e0    	mov	x0, x24
1017afad8: aa1403e1    	mov	x1, x20
1017afadc: aa1303e2    	mov	x2, x19
1017afae0: 94001e5e    	bl	0x1017b7458 <wxime::data::dict::UserDictV2::Impl::addToDynamicDict(std::__1::basic_string_view<char, std::__1::char_traits<char>>)>
1017afae4: 394026a8    	ldrb	w8, [x21, #0x9]
1017afae8: 34ffec68    	cbz	w8, 0x1017af874 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x184>
1017afaec: f9400300    	ldr	x0, [x24]
1017afaf0: b4ffec20    	cbz	x0, 0x1017af874 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x184>
1017afaf4: f9400008    	ldr	x8, [x0]
1017afaf8: f942c908    	ldr	x8, [x8, #0x590]
1017afafc: d63f0100    	blr	x8
1017afb00: 36001320    	tbz	w0, #0x0, 0x1017afd64 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x674>
1017afb04: f9400300    	ldr	x0, [x24]
1017afb08: f9400008    	ldr	x8, [x0]
1017afb0c: f942cd08    	ldr	x8, [x8, #0x598]
1017afb10: d63f0100    	blr	x8
1017afb14: 92800108    	mov	x8, #-0x9               ; =-9
1017afb18: f2efffe8    	movk	x8, #0x7fff, lsl #48
1017afb1c: eb08027f    	cmp	x19, x8
1017afb20: 540015a8    	b.hi	0x1017afdd4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6e4>
1017afb24: aa0003f8    	mov	x24, x0
1017afb28: f1005e7f    	cmp	x19, #0x17
1017afb2c: 54000082    	b.hs	0x1017afb3c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x44c>
1017afb30: 39021ff3    	strb	w19, [sp, #0x87]
1017afb34: 9101c3f9    	add	x25, sp, #0x70
1017afb38: 1400000d    	b	0x1017afb6c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x47c>
1017afb3c: 927df268    	and	x8, x19, #0xfffffffffffffff8
1017afb40: 91002108    	add	x8, x8, #0x8
1017afb44: b2400a69    	orr	x9, x19, #0x7
1017afb48: f1005d3f    	cmp	x9, #0x17
1017afb4c: 9a890108    	csel	x8, x8, x9, eq
1017afb50: 9100051a    	add	x26, x8, #0x1
1017afb54: aa1a03e0    	mov	x0, x26
1017afb58: 94527ef9    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017afb5c: aa0003f9    	mov	x25, x0
1017afb60: b2410348    	orr	x8, x26, #0x8000000000000000
1017afb64: a907a3f3    	stp	x19, x8, [sp, #0x78]
1017afb68: f9003be0    	str	x0, [sp, #0x70]
1017afb6c: aa1903e0    	mov	x0, x25
1017afb70: aa1403e1    	mov	x1, x20
1017afb74: aa1303e2    	mov	x2, x19
1017afb78: 94528248    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
1017afb7c: 38336b3f    	strb	wzr, [x25, x19]
1017afb80: f1005edf    	cmp	x22, #0x17
1017afb84: 540000c2    	b.hs	0x1017afb9c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x4ac>
1017afb88: 9101c3e8    	add	x8, sp, #0x70
1017afb8c: 91006113    	add	x19, x8, #0x18
1017afb90: 39027ff6    	strb	w22, [sp, #0x9f]
1017afb94: b50001d6    	cbnz	x22, 0x1017afbcc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x4dc>
1017afb98: 14000011    	b	0x1017afbdc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x4ec>
1017afb9c: 927df2c8    	and	x8, x22, #0xfffffffffffffff8
1017afba0: 91002108    	add	x8, x8, #0x8
1017afba4: b2400ac9    	orr	x9, x22, #0x7
1017afba8: f1005d3f    	cmp	x9, #0x17
1017afbac: 9a890108    	csel	x8, x8, x9, eq
1017afbb0: 91000514    	add	x20, x8, #0x1
1017afbb4: aa1403e0    	mov	x0, x20
1017afbb8: 94527ee1    	bl	0x102c4f73c <dyld_stub_binder+0x102c4f73c> ; __Znwm
1017afbbc: aa0003f3    	mov	x19, x0
1017afbc0: b2410288    	orr	x8, x20, #0x8000000000000000
1017afbc4: a90923f6    	stp	x22, x8, [sp, #0x90]
1017afbc8: f90047e0    	str	x0, [sp, #0x88]
1017afbcc: aa1303e0    	mov	x0, x19
1017afbd0: aa1703e1    	mov	x1, x23
1017afbd4: aa1603e2    	mov	x2, x22
1017afbd8: 94528230    	bl	0x102c50498 <dyld_stub_binder+0x102c50498> ; _memmove
1017afbdc: 38366a7f    	strb	wzr, [x19, x22]
1017afbe0: 394002a8    	ldrb	w8, [x21]
1017afbe4: 390283e8    	strb	w8, [sp, #0xa0]
1017afbe8: 52800028    	mov	w8, #0x1                ; =1
1017afbec: b900a7e8    	str	w8, [sp, #0xa4]
1017afbf0: 94527e2e    	bl	0x102c4f4a8 <dyld_stub_binder+0x102c4f4a8> ; __ZNSt3__16chrono12system_clock3nowEv
1017afbf4: d29ef9e8    	mov	x8, #0xf7cf             ; =63439
1017afbf8: f2bc6a68    	movk	x8, #0xe353, lsl #16
1017afbfc: f2d374a8    	movk	x8, #0x9ba5, lsl #32
1017afc00: f2e41888    	movk	x8, #0x20c4, lsl #48
1017afc04: 9b487c08    	smulh	x8, x0, x8
1017afc08: d37ffd09    	lsr	x9, x8, #63
1017afc0c: d347fd08    	lsr	x8, x8, #7
1017afc10: 0b090108    	add	w8, w8, w9
1017afc14: b900abe8    	str	w8, [sp, #0xa8]
1017afc18: 529fffe8    	mov	w8, #0xffff             ; =65535
1017afc1c: 79015be8    	strh	w8, [sp, #0xac]
1017afc20: d10203b3    	sub	x19, x29, #0x80
1017afc24: d10203a8    	sub	x8, x29, #0x80
1017afc28: 9101c3e1    	add	x1, sp, #0x70
1017afc2c: aa1803e0    	mov	x0, x24
1017afc30: 94002bb4    	bl	0x1017bab00 <wxime::data::dict::UserDictV2Patch::Add(wxime::data::dict::UserDictV2Patch::AddInfo const&)>
1017afc34: f85983a0    	ldur	x0, [x29, #-0x68]
1017afc38: eb13001f    	cmp	x0, x19
1017afc3c: 54000080    	b.eq	0x1017afc4c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x55c>
1017afc40: b4000100    	cbz	x0, 0x1017afc60 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x570>
1017afc44: 528000a8    	mov	w8, #0x5                ; =5
1017afc48: 14000003    	b	0x1017afc54 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x564>
1017afc4c: 52800088    	mov	w8, #0x4                ; =4
1017afc50: d10203a0    	sub	x0, x29, #0x80
1017afc54: f9400009    	ldr	x9, [x0]
1017afc58: f8687928    	ldr	x8, [x9, x8, lsl #3]
1017afc5c: d63f0100    	blr	x8
1017afc60: 39c27fe8    	ldrsb	w8, [sp, #0x9f]
1017afc64: 36f80068    	tbz	w8, #0x1f, 0x1017afc70 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x580>
1017afc68: f94047e0    	ldr	x0, [sp, #0x88]
1017afc6c: 94527ea8    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afc70: 39c21fe8    	ldrsb	w8, [sp, #0x87]
1017afc74: 36ffe008    	tbz	w8, #0x1f, 0x1017af874 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x184>
1017afc78: f9403be0    	ldr	x0, [sp, #0x70]
1017afc7c: 94527ea4    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afc80: 17fffefd    	b	0x1017af874 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x184>
1017afc84: 94001ddb    	bl	0x1017b73f0 <wxime::utils::TimeMock::Get()>
1017afc88: b90007e0    	str	w0, [sp, #0x4]
1017afc8c: 3945c308    	ldrb	w8, [x24, #0x170]
1017afc90: 35ffe248    	cbnz	w8, 0x1017af8d8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e8>
1017afc94: f940bf00    	ldr	x0, [x24, #0x178]
1017afc98: b4ffe200    	cbz	x0, 0x1017af8d8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e8>
1017afc9c: b90003fc    	str	w28, [sp]
1017afca0: 9107c31b    	add	x27, x24, #0x1f0
1017afca4: c8dfff68    	ldar	x8, [x27]
1017afca8: f9003be8    	str	x8, [sp, #0x70]
1017afcac: 5280003c    	mov	w28, #0x1               ; =1
1017afcb0: 3901e3fc    	strb	w28, [sp, #0x78]
1017afcb4: f9400008    	ldr	x8, [x0]
1017afcb8: f9400908    	ldr	x8, [x8, #0x10]
1017afcbc: 9101c3e1    	add	x1, sp, #0x70
1017afcc0: d63f0100    	blr	x8
1017afcc4: 3901c3ff    	strb	wzr, [sp, #0x70]
1017afcc8: 3901e3ff    	strb	wzr, [sp, #0x78]
1017afccc: c8dfff68    	ldar	x8, [x27]
1017afcd0: 3901e3fc    	strb	w28, [sp, #0x78]
1017afcd4: f9003be8    	str	x8, [sp, #0x70]
1017afcd8: f940bf00    	ldr	x0, [x24, #0x178]
1017afcdc: f9400008    	ldr	x8, [x0]
1017afce0: f9400d08    	ldr	x8, [x8, #0x18]
1017afce4: 9101c3e1    	add	x1, sp, #0x70
1017afce8: d63f0100    	blr	x8
1017afcec: 9105e308    	add	x8, x24, #0x178
1017afcf0: 52000004    	eor	w4, w0, #0x1
1017afcf4: f9400109    	ldr	x9, [x8]
1017afcf8: f940c308    	ldr	x8, [x24, #0x180]
1017afcfc: a90623e9    	stp	x9, x8, [sp, #0x60]
1017afd00: b4000088    	cbz	x8, 0x1017afd10 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x620>
1017afd04: 91002108    	add	x8, x8, #0x8
1017afd08: 52800029    	mov	w9, #0x1                ; =1
1017afd0c: f8290108    	ldadd	x9, x8, [x8]
1017afd10: f9400328    	ldr	x8, [x25]
1017afd14: f9403d08    	ldr	x8, [x8, #0x78]
1017afd18: 910183e3    	add	x3, sp, #0x60
1017afd1c: aa1903e0    	mov	x0, x25
1017afd20: aa1403e1    	mov	x1, x20
1017afd24: aa1303e2    	mov	x2, x19
1017afd28: d63f0100    	blr	x8
1017afd2c: b94003fc    	ldr	w28, [sp]
1017afd30: f94037fb    	ldr	x27, [sp, #0x68]
1017afd34: b4ffdd3b    	cbz	x27, 0x1017af8d8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e8>
1017afd38: 91002368    	add	x8, x27, #0x8
1017afd3c: 92800009    	mov	x9, #-0x1               ; =-1
1017afd40: f8e90108    	ldaddal	x9, x8, [x8]
1017afd44: b5ffdca8    	cbnz	x8, 0x1017af8d8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e8>
1017afd48: f9400368    	ldr	x8, [x27]
1017afd4c: f9400908    	ldr	x8, [x8, #0x10]
1017afd50: aa1b03e0    	mov	x0, x27
1017afd54: d63f0100    	blr	x8
1017afd58: aa1b03e0    	mov	x0, x27
1017afd5c: 94527d5b    	bl	0x102c4f2c8 <dyld_stub_binder+0x102c4f2c8> ; __ZNSt3__119__shared_weak_count14__release_weakEv
1017afd60: 17fffede    	b	0x1017af8d8 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x1e8>
1017afd64: 9101c3e0    	add	x0, sp, #0x70
1017afd68: 97a27a60    	bl	0x10004e6e8 <std::__1::basic_ostringstream<char, std::__1::char_traits<char>, std::__1::allocator<char>>::basic_ostringstream[abi:ne180100]()>
1017afd6c: b000bd81    	adrp	x1, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017afd70: 91220821    	add	x1, x1, #0x882 ; user_dict_v2_patch_->IsUserDictV2Patch()
1017afd74: 910023e0    	add	x0, sp, #0x8
1017afd78: 97a24b3a    	bl	0x100042a60 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::basic_string[abi:ne180100]<0>(char const*)>
1017afd7c: 39c07fe8    	ldrsb	w8, [sp, #0x1f]
1017afd80: 36f800a8    	tbz	w8, #0x1f, 0x1017afd94 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6a4>
1017afd84: a9408be1    	ldp	x1, x2, [sp, #0x8]
1017afd88: 910083e0    	add	x0, sp, #0x20
1017afd8c: 97a29132    	bl	0x100054254 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__init_copy_ctor_external(char const*, unsigned long)>
1017afd90: 14000005    	b	0x1017afda4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6b4>
1017afd94: 3cc083e0    	ldur	q0, [sp, #0x8]
1017afd98: 3d800be0    	str	q0, [sp, #0x20]
1017afd9c: f9400fe8    	ldr	x8, [sp, #0x18]
1017afda0: f9001be8    	str	x8, [sp, #0x30]
1017afda4: b000bd88    	adrp	x8, 0x102f60000 <wxime::base::kWXIME_CONFIG+0x3ddf>
1017afda8: 9122ad08    	add	x8, x8, #0x8ab ; void wxime::data::dict::UserDictV2::Impl::SyncAdd(IUserDictReaderWriter *, std::string_view, std::string_view, const UserDictAddOption &, uint32_t, uint32_t, bool)
1017afdac: 52801aa9    	mov	w9, #0xd5               ; =213
1017afdb0: a903a7e8    	stp	x8, x9, [sp, #0x38]
1017afdb4: 910083e0    	add	x0, sp, #0x20
1017afdb8: 9101c3e1    	add	x1, sp, #0x70
1017afdbc: 97fb39da    	bl	0x10167e524 <exceptxx::ThrowHelper<wxime::base::Exception>::operator<<=(std::__1::basic_ostream<char, std::__1::char_traits<char>> const&)>
1017afdc0: 14000007    	b	0x1017afddc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6ec>
1017afdc4: 94527ea6    	bl	0x102c4f85c <dyld_stub_binder+0x102c4f85c> ; ___stack_chk_fail
1017afdc8: 910123e0    	add	x0, sp, #0x48
1017afdcc: 97a24b51    	bl	0x100042b10 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__throw_length_error[abi:ne180100]() const>
1017afdd0: 14000003    	b	0x1017afddc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x6ec>
1017afdd4: 9101c3e0    	add	x0, sp, #0x70
1017afdd8: 97a24b4e    	bl	0x100042b10 <std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__throw_length_error[abi:ne180100]() const>
1017afddc: d4200020    	brk	#0x1
1017afde0: aa0003f3    	mov	x19, x0
1017afde4: 39c21fe8    	ldrsb	w8, [sp, #0x87]
1017afde8: 36f80908    	tbz	w8, #0x1f, 0x1017aff08 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x818>
1017afdec: f9403be0    	ldr	x0, [sp, #0x70]
1017afdf0: 1400001f    	b	0x1017afe6c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x77c>
1017afdf4: aa0003f3    	mov	x19, x0
1017afdf8: 910183e0    	add	x0, sp, #0x60
1017afdfc: 97a2853d    	bl	0x1000512f0 <wxime::engine::searchers_v2::RecallE2EModelResultAsync::RecallE2EModelResultAsync(wxime::engine::SyllableGraphHolder const&, wxime::engine::searchers_v2::Searcher::Option const&, std::__1::vector<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>>> const&, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, std::__1::shared_ptr<wxime::data::dict::IDict>, wxime::engine::model::IE2EModel::BeamSearchType)::'lambda'()::operator()()::'lambda'()::~()>
1017afe00: aa1303e0    	mov	x0, x19
1017afe04: 94527a61    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017afe08: aa0003f3    	mov	x19, x0
1017afe0c: 9101c3e0    	add	x0, sp, #0x70
1017afe10: 97fc1438    	bl	0x1016b4ef0 <wxime::engine::resources::ResourceMgr::Impl::CreateUserDict(std::__1::shared_ptr<wxime::engine::resources::Resources> const&, bool, bool, bool)::'lambda0'()::~()>
1017afe14: aa1303e0    	mov	x0, x19
1017afe18: 94527a5c    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017afe1c: aa0003f3    	mov	x19, x0
1017afe20: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017afe24: 91190108    	add	x8, x8, #0x640
1017afe28: 91002101    	add	x1, x8, #0x8
1017afe2c: aa1903e0    	mov	x0, x25
1017afe30: 94527ca5    	bl	0x102c4f0c4 <dyld_stub_binder+0x102c4f0c4> ; __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
1017afe34: 14000002    	b	0x1017afe3c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x74c>
1017afe38: aa0003f3    	mov	x19, x0
1017afe3c: aa1a03e0    	mov	x0, x26
1017afe40: 14000018    	b	0x1017afea0 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x7b0>
1017afe44: aa0003f3    	mov	x19, x0
1017afe48: 39c2dfe8    	ldrsb	w8, [sp, #0xb7]
1017afe4c: 36f800a8    	tbz	w8, #0x1f, 0x1017afe60 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x770>
1017afe50: f94053e0    	ldr	x0, [sp, #0xa0]
1017afe54: 94527e2e    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afe58: 14000002    	b	0x1017afe60 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x770>
1017afe5c: aa0003f3    	mov	x19, x0
1017afe60: 39c17fe8    	ldrsb	w8, [sp, #0x5f]
1017afe64: 36f80528    	tbz	w8, #0x1f, 0x1017aff08 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x818>
1017afe68: f94027e0    	ldr	x0, [sp, #0x48]
1017afe6c: 94527e28    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afe70: aa1303e0    	mov	x0, x19
1017afe74: 94527a45    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017afe78: 1400000f    	b	0x1017afeb4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x7c4>
1017afe7c: aa0003f3    	mov	x19, x0
1017afe80: f000dfc8    	adrp	x8, 0x1033aa000 <typeinfo for FuseLayerNorm+0x8>
1017afe84: 91190108    	add	x8, x8, #0x640
1017afe88: 91002101    	add	x1, x8, #0x8
1017afe8c: aa1603e0    	mov	x0, x22
1017afe90: 94527c8d    	bl	0x102c4f0c4 <dyld_stub_binder+0x102c4f0c4> ; __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
1017afe94: 14000002    	b	0x1017afe9c <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x7ac>
1017afe98: aa0003f3    	mov	x19, x0
1017afe9c: aa1503e0    	mov	x0, x21
1017afea0: 94527dd3    	bl	0x102c4f5ec <dyld_stub_binder+0x102c4f5ec> ; __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
1017afea4: aa1303e0    	mov	x0, x19
1017afea8: 94527a38    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017afeac: aa0003f3    	mov	x19, x0
1017afeb0: 1400000b    	b	0x1017afedc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x7ec>
1017afeb4: aa0003f3    	mov	x19, x0
1017afeb8: 9101c3e0    	add	x0, sp, #0x70
1017afebc: 94224abd    	bl	0x1020429b0 <loguru::StreamLogger::~StreamLogger()>
1017afec0: aa1303e0    	mov	x0, x19
1017afec4: 94527a31    	bl	0x102c4e788 <dyld_stub_binder+0x102c4e788> ; __Unwind_Resume
1017afec8: aa0003f3    	mov	x19, x0
1017afecc: 39c0dfe8    	ldrsb	w8, [sp, #0x37]
1017afed0: 36f80068    	tbz	w8, #0x1f, 0x1017afedc <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x7ec>
1017afed4: f94013e0    	ldr	x0, [sp, #0x20]
1017afed8: 94527e0d    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afedc: 39c07fe8    	ldrsb	w8, [sp, #0x1f]
1017afee0: 36f800a8    	tbz	w8, #0x1f, 0x1017afef4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x804>
1017afee4: f94007e0    	ldr	x0, [sp, #0x8]
1017afee8: 94527e09    	bl	0x102c4f70c <dyld_stub_binder+0x102c4f70c> ; __ZdlPv
1017afeec: 14000002    	b	0x1017afef4 <wxime::data::dict::UserDictV2::Impl::SyncAdd(wxime::data::dict::IUserDictReaderWriter*, std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, wxime::data::dict::UserDictAddOption const&, unsigned int, unsigned int, bool)+0x804>
1017afef0: aa0003f3    	mov	x19, x0
1017afef4: 9101c3e0    	add	x0, sp, #0x70
1017afef8: 97a27a31    	bl	0x10004e7bc <std::__1::basic_ostringstream<char, std::__1::char_traits<char>, std::__1::allocator<char>>::~basic_ostringstream()>
1017afefc: aa1303e0    	mov	x0, x19
