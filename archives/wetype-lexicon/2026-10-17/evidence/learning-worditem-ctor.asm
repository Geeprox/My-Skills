
work/v3/WeType.arm64:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001017cd010 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)>:
1017cd010: aa0003e8    	mov	x8, x0
1017cd014: f8008d1f    	str	xzr, [x8, #0x8]!
1017cd018: 29000c02    	stp	w2, w3, [x0]
1017cd01c: 1e230040    	ucvtf	s0, w2
1017cd020: a9017c1f    	stp	xzr, xzr, [x0, #0x10]
1017cd024: bd400481    	ldr	s1, [x4, #0x4]
1017cd028: 1e202020    	fcmp	s1, s0
1017cd02c: 1e20cc21    	fcsel	s1, s1, s0, gt
1017cd030: bd002001    	str	s1, [x0, #0x20]
1017cd034: 39400089    	ldrb	w9, [x4]
1017cd038: 39009009    	strb	w9, [x0, #0x24]
1017cd03c: 3900941f    	strb	wzr, [x0, #0x25]
1017cd040: 79004c1f    	strh	wzr, [x0, #0x26]
1017cd044: bd002800    	str	s0, [x0, #0x28]
1017cd048: b9002c1f    	str	wzr, [x0, #0x2c]
1017cd04c: 3dc00020    	ldr	q0, [x1]
1017cd050: f9400829    	ldr	x9, [x1, #0x10]
1017cd054: f9002009    	str	x9, [x0, #0x40]
1017cd058: 3d800c00    	str	q0, [x0, #0x30]
1017cd05c: a900fc3f    	stp	xzr, xzr, [x1, #0x8]
1017cd060: f900003f    	str	xzr, [x1]
1017cd064: 39400089    	ldrb	w9, [x4]
1017cd068: 7100153f    	cmp	w9, #0x5
1017cd06c: 54000248    	b.hi	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd070: 9000cb6a    	adrp	x10, 0x103139000 <typeinfo name for std::__1::__function::__func<wxime::data::dict::UserDictReaderWriterV2::Impl::Remove(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, bool, bool)::'lambda'(wxime::data::dict::IUserDictReaderWriter::WordItemV2&), std::__1::allocator<wxime::data::dict::UserDictReaderWriterV2::Impl::Remove(std::__1::basic_string_view<char, std::__1::char_traits<char>>, std::__1::basic_string_view<char, std::__1::char_traits<char>>, bool, bool)::'lambda'(wxime::data::dict::IUserDictReaderWriter::WordItemV2&)>, void (wxime::data::dict::IUserDictReaderWriter::WordItemV2&)>+0xa8>
1017cd074: 9106214a    	add	x10, x10, #0x188
1017cd078: 1000008b    	adr	x11, 0x1017cd088 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0x78>
1017cd07c: 3869694c    	ldrb	w12, [x10, x9]
1017cd080: 8b0c096b    	add	x11, x11, x12, lsl #2
1017cd084: d61f0160    	br	x11
1017cd088: b9000102    	str	w2, [x8]
1017cd08c: 1400000a    	b	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd090: b9000c02    	str	w2, [x0, #0xc]
1017cd094: 14000008    	b	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd098: b9001002    	str	w2, [x0, #0x10]
1017cd09c: 14000006    	b	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd0a0: b9001402    	str	w2, [x0, #0x14]
1017cd0a4: 14000004    	b	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd0a8: b9001802    	str	w2, [x0, #0x18]
1017cd0ac: 14000002    	b	0x1017cd0b4 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::WordItemV2(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>, unsigned int, unsigned int, wxime::data::dict::UserDictAddOption const&)+0xa4>
1017cd0b0: b9001c02    	str	w2, [x0, #0x1c]
1017cd0b4: 39402088    	ldrb	w8, [x4, #0x8]
1017cd0b8: 39009408    	strb	w8, [x0, #0x25]
1017cd0bc: 79401488    	ldrh	w8, [x4, #0xa]
1017cd0c0: 79004c08    	strh	w8, [x0, #0x26]
1017cd0c4: b9401088    	ldr	w8, [x4, #0x10]
1017cd0c8: b9002c08    	str	w8, [x0, #0x2c]
1017cd0cc: d65f03c0    	ret

00000001017cd0d0 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::DeserializeFrom(unsigned short, std::__1::basic_string_view<char, std::__1::char_traits<char>>)>:
1017cd0d0: d105c3ff    	sub	sp, sp, #0x170
1017cd0d4: a9154ff4    	stp	x20, x19, [sp, #0x150]
1017cd0d8: a9167bfd    	stp	x29, x30, [sp, #0x160]
1017cd0dc: 910583fd    	add	x29, sp, #0x160
1017cd0e0: f100bc7f    	cmp	x3, #0x2f
1017cd0e4: 540001e9    	b.ls	0x1017cd120 <wxime::data::dict::IUserDictReaderWriter::WordItemV2::DeserializeFrom(unsigned short, std::__1::basic_string_view<char, std::__1::char_traits<char>>)+0x50>
1017cd0e8: ad400440    	ldp	q0, q1, [x2]
1017cd0ec: 3dc00842    	ldr	q2, [x2, #0x20]
1017cd0f0: ad008801    	stp	q1, q2, [x0, #0x10]
1017cd0f4: 3c830400    	str	q0, [x0], #0x30
1017cd0f8: d100c068    	sub	x8, x3, #0x30
1017cd0fc: 2a0103e9    	mov	w9, w1
1017cd100: eb09011f    	cmp	x8, x9
1017cd104: 9a893108    	csel	x8, x8, x9, lo
