WeType-3.0.0-670.arm64:
(__TEXT,__text) section
_wxime_process_input:
1016a38c4:	f6 57 bd a9	stp	x22, x21, [sp, #-0x30]!
1016a38c8:	f4 4f 01 a9	stp	x20, x19, [sp, #0x10]
1016a38cc:	fd 7b 02 a9	stp	x29, x30, [sp, #0x20]
1016a38d0:	fd 83 00 91	add	x29, sp, #0x20
1016a38d4:	ff 43 0b d1	sub	sp, sp, #0x2d0
1016a38d8:	f4 03 02 aa	mov	x20, x2
1016a38dc:	f3 03 00 aa	mov	x19, x0
1016a38e0:	68 e6 00 d0	adrp	x8, 7374 ; 0x103371000
1016a38e4:	08 45 44 f9	ldr	x8, [x8, #0x888] ; literal pool symbol address: ___stack_chk_guard
1016a38e8:	08 01 40 f9	ldr	x8, [x8]
1016a38ec:	a8 83 1d f8	stur	x8, [x29, #-0x28]
1016a38f0:	e1 b7 00 f9	str	x1, [sp, #0x168]
1016a38f4:	e2 67 01 b9	str	w2, [sp, #0x164]
1016a38f8:	e3 af 00 f9	str	x3, [sp, #0x158]
1016a38fc:	e4 57 01 b9	str	w4, [sp, #0x154]
1016a3900:	49 73 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3904:	1f 04 00 31	cmn	w0, #0x1
1016a3908:	2b 01 00 54	b.lt	0x1016a392c
1016a390c:	f3 53 00 a9	stp	x19, x20, [sp]
1016a3910:	21 c5 00 d0	adrp	x1, 6310 ; 0x102f49000
1016a3914:	21 7c 39 91	add	x1, x1, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3918:	23 c5 00 f0	adrp	x3, 6311 ; 0x102f4a000
1016a391c:	63 60 08 91	add	x3, x3, #0x218 ; literal pool for: "wxime_process_input [%lu],input len[%u]"
1016a3920:	00 00 80 12	mov	w0, #-0x1
1016a3924:	42 40 80 52	mov	w2, #0x202
1016a3928:	46 73 26 94	bl	__ZN6loguru3logEiPKcjS1_z
1016a392c:	a2 86 16 94	bl	__ZN5wxime6engine9resources11ResourceMgr8InstanceEv
1016a3930:	40 00 00 b4	cbz	x0, 0x1016a3938
1016a3934:	ab 86 16 94	bl	__ZN5wxime6engine9resources11ResourceMgr16StopWarmUpIfNeedEv
1016a3938:	71 44 0a 94	bl	__ZN5wxime6engine16GlobalSessionMgr8InstanceEv
1016a393c:	6d 44 0a 94	bl	__ZNKR5wxime6engine16GlobalSessionMgrdeEv
1016a3940:	f4 03 00 aa	mov	x20, x0
1016a3944:	00 05 80 52	mov	w0, #0x28
1016a3948:	7d af 56 94	bl	0x102c4f73c ; symbol stub for: __Znwm
1016a394c:	68 ea 00 b0	adrp	x8, 7501 ; 0x1033f0000
1016a3950:	08 e1 28 91	add	x8, x8, #0xa38
1016a3954:	e9 63 05 91	add	x9, sp, #0x158
1016a3958:	08 24 00 a9	stp	x8, x9, [x0]
1016a395c:	e8 53 05 91	add	x8, sp, #0x154
1016a3960:	e9 a3 05 91	add	x9, sp, #0x168
1016a3964:	08 24 01 a9	stp	x8, x9, [x0, #0x10]
1016a3968:	e8 93 05 91	add	x8, sp, #0x164
1016a396c:	08 10 00 f9	str	x8, [x0, #0x20]
1016a3970:	e0 c7 00 f9	str	x0, [sp, #0x188]
1016a3974:	88 02 40 f9	ldr	x8, [x20]
1016a3978:	08 15 40 f9	ldr	x8, [x8, #0x28]
1016a397c:	f5 c3 05 91	add	x21, sp, #0x170
1016a3980:	e2 c3 05 91	add	x2, sp, #0x170
1016a3984:	e0 03 14 aa	mov	x0, x20
1016a3988:	e1 03 13 aa	mov	x1, x19
1016a398c:	00 01 3f d6	blr	x8
1016a3990:	f3 03 00 aa	mov	x19, x0
1016a3994:	e0 c7 40 f9	ldr	x0, [sp, #0x188]
1016a3998:	1f 00 15 eb	cmp	x0, x21
1016a399c:	80 00 00 54	b.eq	0x1016a39ac
1016a39a0:	00 01 00 b4	cbz	x0, 0x1016a39c0
1016a39a4:	a8 00 80 52	mov	w8, #0x5
1016a39a8:	03 00 00 14	b	0x1016a39b4
1016a39ac:	88 00 80 52	mov	w8, #0x4
1016a39b0:	e0 c3 05 91	add	x0, sp, #0x170
1016a39b4:	09 00 40 f9	ldr	x9, [x0]
1016a39b8:	28 79 68 f8	ldr	x8, [x9, x8, lsl #3]
1016a39bc:	00 01 3f d6	blr	x8
1016a39c0:	a8 83 5d f8	ldur	x8, [x29, #-0x28]
1016a39c4:	69 e6 00 d0	adrp	x9, 7374 ; 0x103371000
1016a39c8:	29 45 44 f9	ldr	x9, [x9, #0x888] ; literal pool symbol address: ___stack_chk_guard
1016a39cc:	29 01 40 f9	ldr	x9, [x9]
1016a39d0:	3f 01 08 eb	cmp	x9, x8
1016a39d4:	e1 00 00 54	b.ne	0x1016a39f0
1016a39d8:	e0 03 13 aa	mov	x0, x19
1016a39dc:	ff 43 0b 91	add	sp, sp, #0x2d0
1016a39e0:	fd 7b 42 a9	ldp	x29, x30, [sp, #0x20]
1016a39e4:	f4 4f 41 a9	ldp	x20, x19, [sp, #0x10]
1016a39e8:	f6 57 c3 a8	ldp	x22, x21, [sp], #0x30
1016a39ec:	c0 03 5f d6	ret
1016a39f0:	9b af 56 94	bl	0x102c4f85c ; symbol stub for: ___stack_chk_fail
1016a39f4:	f3 03 00 aa	mov	x19, x0
1016a39f8:	a1 16 00 34	cbz	w1, 0x1016a3ccc
1016a39fc:	f4 03 01 aa	mov	x20, x1
1016a3a00:	e0 c7 40 f9	ldr	x0, [sp, #0x188]
1016a3a04:	e8 c3 05 91	add	x8, sp, #0x170
1016a3a08:	1f 00 08 eb	cmp	x0, x8
1016a3a0c:	81 00 00 54	b.ne	0x1016a3a1c
1016a3a10:	88 00 80 52	mov	w8, #0x4
1016a3a14:	e0 c3 05 91	add	x0, sp, #0x170
1016a3a18:	03 00 00 14	b	0x1016a3a24
1016a3a1c:	a0 01 00 b4	cbz	x0, 0x1016a3a50
1016a3a20:	a8 00 80 52	mov	w8, #0x5
1016a3a24:	09 00 40 f9	ldr	x9, [x0]
1016a3a28:	28 79 68 f8	ldr	x8, [x9, x8, lsl #3]
1016a3a2c:	00 01 3f d6	blr	x8
1016a3a30:	08 00 00 14	b	0x1016a3a50
1016a3a34:	f3 03 00 aa	mov	x19, x0
1016a3a38:	a1 14 00 34	cbz	w1, 0x1016a3ccc
1016a3a3c:	f4 03 01 aa	mov	x20, x1
1016a3a40:	04 00 00 14	b	0x1016a3a50
1016a3a44:	f4 03 01 aa	mov	x20, x1
1016a3a48:	f3 03 00 aa	mov	x19, x0
1016a3a4c:	14 14 00 34	cbz	w20, 0x1016a3ccc
1016a3a50:	e0 03 13 aa	mov	x0, x19
1016a3a54:	49 af 56 94	bl	0x102c4f778 ; symbol stub for: ___cxa_begin_catch
1016a3a58:	9f 0a 00 71	cmp	w20, #0x2
1016a3a5c:	e1 07 00 54	b.ne	0x1016a3b58
1016a3a60:	f3 03 00 aa	mov	x19, x0
1016a3a64:	e0 c3 05 91	add	x0, sp, #0x170
1016a3a68:	01 00 80 52	mov	w1, #0x0
1016a3a6c:	da 3f 00 94	bl	__ZN5wxime5utils9CallStackC2Ei
1016a3a70:	ed 72 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3a74:	1f 08 00 31	cmn	w0, #0x2
1016a3a78:	4b 03 00 54	b.lt	0x1016a3ae0
1016a3a7c:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3a80:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3a84:	f4 c3 00 91	add	x20, sp, #0x30
1016a3a88:	e0 c3 00 91	add	x0, sp, #0x30
1016a3a8c:	21 00 80 12	mov	w1, #-0x2
1016a3a90:	83 41 80 52	mov	w3, #0x20c
1016a3a94:	bc cf ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a3a98:	94 62 00 91	add	x20, x20, #0x18
1016a3a9c:	21 c5 00 d0	adrp	x1, 6310 ; 0x102f49000
1016a3aa0:	21 30 3e 91	add	x1, x1, #0xf8c ; literal pool for: "exception caught "
1016a3aa4:	e0 03 14 aa	mov	x0, x20
1016a3aa8:	22 02 80 52	mov	w2, #0x11
1016a3aac:	c9 be a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3ab0:	68 02 40 f9	ldr	x8, [x19]
1016a3ab4:	08 09 40 f9	ldr	x8, [x8, #0x10]
1016a3ab8:	e0 03 13 aa	mov	x0, x19
1016a3abc:	00 01 3f d6	blr	x8
1016a3ac0:	f3 03 00 aa	mov	x19, x0
1016a3ac4:	e8 b4 56 94	bl	0x102c50e64 ; symbol stub for: _strlen
1016a3ac8:	e2 03 00 aa	mov	x2, x0
1016a3acc:	e0 03 14 aa	mov	x0, x20
1016a3ad0:	e1 03 13 aa	mov	x1, x19
1016a3ad4:	bf be a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3ad8:	e0 c3 00 91	add	x0, sp, #0x30
1016a3adc:	b5 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3ae0:	d1 72 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3ae4:	1f 08 00 31	cmn	w0, #0x2
1016a3ae8:	4b 03 00 54	b.lt	0x1016a3b50
1016a3aec:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3af0:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3af4:	e0 c3 00 91	add	x0, sp, #0x30
1016a3af8:	21 00 80 12	mov	w1, #-0x2
1016a3afc:	83 41 80 52	mov	w3, #0x20c
1016a3b00:	a1 cf ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a3b04:	f3 63 00 91	add	x19, sp, #0x18
1016a3b08:	e8 63 00 91	add	x8, sp, #0x18
1016a3b0c:	e0 c3 05 91	add	x0, sp, #0x170
1016a3b10:	d5 cf ff 97	bl	__ZNK5wxime5utils9CallStack11DebugStringEv
1016a3b14:	e8 c3 00 91	add	x8, sp, #0x30
1016a3b18:	00 61 00 91	add	x0, x8, #0x18
1016a3b1c:	e8 bf 40 39	ldrb	w8, [sp, #0x2f]
1016a3b20:	09 1d 00 13	sxtb	w9, w8
1016a3b24:	ea af 41 a9	ldp	x10, x11, [sp, #0x18]
1016a3b28:	3f 01 00 71	cmp	w9, #0x0
1016a3b2c:	41 b1 93 9a	csel	x1, x10, x19, lt
1016a3b30:	62 b1 88 9a	csel	x2, x11, x8, lt
1016a3b34:	a7 be a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3b38:	e8 bf c0 39	ldrsb	w8, [sp, #0x2f]
1016a3b3c:	68 00 f8 36	tbz	w8, #0x1f, 0x1016a3b48
1016a3b40:	e0 0f 40 f9	ldr	x0, [sp, #0x18]
1016a3b44:	f2 ae 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3b48:	e0 c3 00 91	add	x0, sp, #0x30
1016a3b4c:	99 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3b50:	22 af 56 94	bl	0x102c4f7d8 ; symbol stub for: ___cxa_rethrow
1016a3b54:	32 00 00 14	b	0x1016a3c1c
1016a3b58:	e0 c3 05 91	add	x0, sp, #0x170
1016a3b5c:	01 00 80 52	mov	w1, #0x0
1016a3b60:	9d 3f 00 94	bl	__ZN5wxime5utils9CallStackC2Ei
1016a3b64:	b0 72 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3b68:	1f 08 00 31	cmn	w0, #0x2
1016a3b6c:	eb 01 00 54	b.lt	0x1016a3ba8
1016a3b70:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3b74:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3b78:	f3 c3 00 91	add	x19, sp, #0x30
1016a3b7c:	e0 c3 00 91	add	x0, sp, #0x30
1016a3b80:	21 00 80 12	mov	w1, #-0x2
1016a3b84:	83 41 80 52	mov	w3, #0x20c
1016a3b88:	7f cf ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a3b8c:	60 62 00 91	add	x0, x19, #0x18
1016a3b90:	21 c5 00 d0	adrp	x1, 6310 ; 0x102f49000
1016a3b94:	21 30 3e 91	add	x1, x1, #0xf8c ; literal pool for: "exception caught "
1016a3b98:	22 02 80 52	mov	w2, #0x11
1016a3b9c:	8d be a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3ba0:	e0 c3 00 91	add	x0, sp, #0x30
1016a3ba4:	83 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3ba8:	9f 72 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3bac:	1f 08 00 31	cmn	w0, #0x2
1016a3bb0:	4b 03 00 54	b.lt	0x1016a3c18
1016a3bb4:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3bb8:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3bbc:	e0 c3 00 91	add	x0, sp, #0x30
1016a3bc0:	21 00 80 12	mov	w1, #-0x2
1016a3bc4:	83 41 80 52	mov	w3, #0x20c
1016a3bc8:	6f cf ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a3bcc:	f3 63 00 91	add	x19, sp, #0x18
1016a3bd0:	e8 63 00 91	add	x8, sp, #0x18
1016a3bd4:	e0 c3 05 91	add	x0, sp, #0x170
1016a3bd8:	a3 cf ff 97	bl	__ZNK5wxime5utils9CallStack11DebugStringEv
1016a3bdc:	e8 c3 00 91	add	x8, sp, #0x30
1016a3be0:	00 61 00 91	add	x0, x8, #0x18
1016a3be4:	e8 bf 40 39	ldrb	w8, [sp, #0x2f]
1016a3be8:	09 1d 00 13	sxtb	w9, w8
1016a3bec:	ea af 41 a9	ldp	x10, x11, [sp, #0x18]
1016a3bf0:	3f 01 00 71	cmp	w9, #0x0
1016a3bf4:	41 b1 93 9a	csel	x1, x10, x19, lt
1016a3bf8:	62 b1 88 9a	csel	x2, x11, x8, lt
1016a3bfc:	75 be a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3c00:	e8 bf c0 39	ldrsb	w8, [sp, #0x2f]
1016a3c04:	68 00 f8 36	tbz	w8, #0x1f, 0x1016a3c10
1016a3c08:	e0 0f 40 f9	ldr	x0, [sp, #0x18]
1016a3c0c:	c0 ae 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3c10:	e0 c3 00 91	add	x0, sp, #0x30
1016a3c14:	67 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3c18:	f0 ae 56 94	bl	0x102c4f7d8 ; symbol stub for: ___cxa_rethrow
1016a3c1c:	20 00 20 d4	brk	#0x1
1016a3c20:	f3 03 00 aa	mov	x19, x0
1016a3c24:	e8 bf c0 39	ldrsb	w8, [sp, #0x2f]
1016a3c28:	88 02 f8 36	tbz	w8, #0x1f, 0x1016a3c78
1016a3c2c:	e0 0f 40 f9	ldr	x0, [sp, #0x18]
1016a3c30:	b7 ae 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3c34:	11 00 00 14	b	0x1016a3c78
1016a3c38:	f3 03 00 aa	mov	x19, x0
1016a3c3c:	e8 bf c0 39	ldrsb	w8, [sp, #0x2f]
1016a3c40:	48 01 f8 36	tbz	w8, #0x1f, 0x1016a3c68
1016a3c44:	e0 0f 40 f9	ldr	x0, [sp, #0x18]
1016a3c48:	b1 ae 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3c4c:	07 00 00 14	b	0x1016a3c68
1016a3c50:	09 00 00 14	b	0x1016a3c74
1016a3c54:	04 00 00 14	b	0x1016a3c64
1016a3c58:	07 00 00 14	b	0x1016a3c74
1016a3c5c:	0c 00 00 14	b	0x1016a3c8c
1016a3c60:	0f 00 00 14	b	0x1016a3c9c
1016a3c64:	f3 03 00 aa	mov	x19, x0
1016a3c68:	e0 c3 00 91	add	x0, sp, #0x30
1016a3c6c:	51 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3c70:	0c 00 00 14	b	0x1016a3ca0
1016a3c74:	f3 03 00 aa	mov	x19, x0
1016a3c78:	e0 c3 00 91	add	x0, sp, #0x30
1016a3c7c:	4d 7b 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3c80:	04 00 00 14	b	0x1016a3c90
1016a3c84:	06 00 00 14	b	0x1016a3c9c
1016a3c88:	01 00 00 14	b	0x1016a3c8c
1016a3c8c:	f3 03 00 aa	mov	x19, x0
1016a3c90:	e0 c3 05 91	add	x0, sp, #0x170
1016a3c94:	0f d0 ff 97	bl	__ZN5wxime5utils9CallStackD1Ev
1016a3c98:	09 00 00 14	b	0x1016a3cbc
1016a3c9c:	f3 03 00 aa	mov	x19, x0
1016a3ca0:	e0 c3 05 91	add	x0, sp, #0x170
1016a3ca4:	0b d0 ff 97	bl	__ZN5wxime5utils9CallStackD1Ev
1016a3ca8:	02 00 00 14	b	0x1016a3cb0
1016a3cac:	f3 03 00 aa	mov	x19, x0
1016a3cb0:	bb ae 56 94	bl	0x102c4f79c ; symbol stub for: ___cxa_end_catch
1016a3cb4:	06 00 00 14	b	0x1016a3ccc
1016a3cb8:	f3 03 00 aa	mov	x19, x0
1016a3cbc:	b8 ae 56 94	bl	0x102c4f79c ; symbol stub for: ___cxa_end_catch
1016a3cc0:	03 00 00 14	b	0x1016a3ccc
1016a3cc4:	f3 03 00 aa	mov	x19, x0
1016a3cc8:	61 00 00 35	cbnz	w1, 0x1016a3cd4
1016a3ccc:	e0 03 13 aa	mov	x0, x19
1016a3cd0:	ae aa 56 94	bl	0x102c4e788 ; symbol stub for: __Unwind_Resume
1016a3cd4:	e0 03 13 aa	mov	x0, x19
1016a3cd8:	aa b8 e5 97	bl	___clang_call_terminate
