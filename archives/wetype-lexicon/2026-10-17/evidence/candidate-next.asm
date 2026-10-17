WeType-3.0.0-670.arm64:
(__TEXT,__text) section
_wxime_candidate_next:
1016a31e4:	fc 6f bb a9	stp	x28, x27, [sp, #-0x50]!
1016a31e8:	f8 5f 01 a9	stp	x24, x23, [sp, #0x10]
1016a31ec:	f6 57 02 a9	stp	x22, x21, [sp, #0x20]
1016a31f0:	f4 4f 03 a9	stp	x20, x19, [sp, #0x30]
1016a31f4:	fd 7b 04 a9	stp	x29, x30, [sp, #0x40]
1016a31f8:	fd 03 01 91	add	x29, sp, #0x40
1016a31fc:	ff 43 0a d1	sub	sp, sp, #0x290
1016a3200:	f3 03 01 aa	mov	x19, x1
1016a3204:	f4 03 00 aa	mov	x20, x0
1016a3208:	07 75 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a320c:	1f 04 00 31	cmn	w0, #0x1
1016a3210:	4b 06 00 54	b.lt	0x1016a32d8
1016a3214:	18 00 80 12	mov	w24, #-0x1
1016a3218:	f8 3b 01 b9	str	w24, [sp, #0x138]
1016a321c:	28 c5 00 d0	adrp	x8, 6310 ; 0x102f49000
1016a3220:	08 7d 39 91	add	x8, x8, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3224:	e8 a3 00 f9	str	x8, [sp, #0x140]
1016a3228:	a8 3b 80 52	mov	w8, #0x1dd
1016a322c:	e8 4b 01 b9	str	w8, [sp, #0x148]
1016a3230:	f6 e3 04 91	add	x22, sp, #0x138
1016a3234:	d5 22 02 91	add	x21, x22, #0x88
1016a3238:	d7 82 00 91	add	x23, x22, #0x20
1016a323c:	28 e8 00 f0	adrp	x8, 7431 ; 0x1033aa000
1016a3240:	08 81 19 91	add	x8, x8, #0x660
1016a3244:	09 61 00 91	add	x9, x8, #0x18
1016a3248:	08 01 01 91	add	x8, x8, #0x40
1016a324c:	e9 ab 00 f9	str	x9, [sp, #0x150]
1016a3250:	e8 e3 00 f9	str	x8, [sp, #0x1c0]
1016a3254:	e0 03 15 aa	mov	x0, x21
1016a3258:	e1 03 17 aa	mov	x1, x23
1016a325c:	cc b0 56 94	bl	0x102c4f58c ; symbol stub for: __ZNSt3__18ios_base4initEPv
1016a3260:	d6 62 00 91	add	x22, x22, #0x18
1016a3264:	ff 27 01 f9	str	xzr, [sp, #0x248]
1016a3268:	f8 53 02 b9	str	w24, [sp, #0x250]
1016a326c:	28 e8 00 f0	adrp	x8, 7431 ; 0x1033aa000
1016a3270:	08 c1 17 91	add	x8, x8, #0x5f0
1016a3274:	09 61 00 91	add	x9, x8, #0x18
1016a3278:	08 01 01 91	add	x8, x8, #0x40
1016a327c:	e9 ab 00 f9	str	x9, [sp, #0x150]
1016a3280:	e8 e3 00 f9	str	x8, [sp, #0x1c0]
1016a3284:	e0 03 17 aa	mov	x0, x23
1016a3288:	d1 af 56 94	bl	0x102c4f1cc ; symbol stub for: __ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
1016a328c:	e8 e3 04 91	add	x8, sp, #0x138
1016a3290:	e9 e8 00 f0	adrp	x9, 7455 ; 0x1033c2000
1016a3294:	29 81 18 91	add	x9, x9, #0x620
1016a3298:	29 41 00 91	add	x9, x9, #0x10
1016a329c:	e9 af 00 f9	str	x9, [sp, #0x158]
1016a32a0:	00 e4 00 6f	movi.2d	v0, #0000000000000000
1016a32a4:	00 01 03 ad	stp	q0, q0, [x8, #0x60]
1016a32a8:	08 02 80 52	mov	w8, #0x10
1016a32ac:	e8 bb 01 b9	str	w8, [sp, #0x1b8]
1016a32b0:	21 c5 00 f0	adrp	x1, 6311 ; 0x102f4a000
1016a32b4:	21 04 08 91	add	x1, x1, #0x201 ; literal pool for: "wxime_candidate_next, "
1016a32b8:	e0 03 16 aa	mov	x0, x22
1016a32bc:	c2 02 80 52	mov	w2, #0x16
1016a32c0:	c4 c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a32c4:	e0 03 16 aa	mov	x0, x22
1016a32c8:	e1 03 14 aa	mov	x1, x20
1016a32cc:	99 af 56 94	bl	0x102c4f130 ; symbol stub for: __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
1016a32d0:	e0 e3 04 91	add	x0, sp, #0x138
1016a32d4:	b7 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a32d8:	b4 00 00 b4	cbz	x20, 0x1016a32ec
1016a32dc:	80 02 40 f9	ldr	x0, [x20]
1016a32e0:	e1 03 13 aa	mov	x1, x19
1016a32e4:	be 00 00 94	bl	__ZN5wxime6engine12searchers_v217CandidateIterator4NextEP16_wxime_candidate
1016a32e8:	02 00 00 14	b	0x1016a32f0
1016a32ec:	00 00 80 52	mov	w0, #0x0
1016a32f0:	ff 43 0a 91	add	sp, sp, #0x290
1016a32f4:	fd 7b 44 a9	ldp	x29, x30, [sp, #0x40]
1016a32f8:	f4 4f 43 a9	ldp	x20, x19, [sp, #0x30]
1016a32fc:	f6 57 42 a9	ldp	x22, x21, [sp, #0x20]
1016a3300:	f8 5f 41 a9	ldp	x24, x23, [sp, #0x10]
1016a3304:	fc 6f c5 a8	ldp	x28, x27, [sp], #0x50
1016a3308:	c0 03 5f d6	ret
1016a330c:	f3 03 01 aa	mov	x19, x1
1016a3310:	f4 03 00 aa	mov	x20, x0
1016a3314:	28 e8 00 f0	adrp	x8, 7431 ; 0x1033aa000
1016a3318:	08 01 19 91	add	x8, x8, #0x640
1016a331c:	01 21 00 91	add	x1, x8, #0x8
1016a3320:	e0 03 16 aa	mov	x0, x22
1016a3324:	68 af 56 94	bl	0x102c4f0c4 ; symbol stub for: __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
1016a3328:	03 00 00 14	b	0x1016a3334
1016a332c:	f3 03 01 aa	mov	x19, x1
1016a3330:	f4 03 00 aa	mov	x20, x0
1016a3334:	e0 03 15 aa	mov	x0, x21
1016a3338:	ad b0 56 94	bl	0x102c4f5ec ; symbol stub for: __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
1016a333c:	09 00 00 14	b	0x1016a3360
1016a3340:	06 00 00 14	b	0x1016a3358
1016a3344:	f3 03 01 aa	mov	x19, x1
1016a3348:	f4 03 00 aa	mov	x20, x0
1016a334c:	e0 e3 04 91	add	x0, sp, #0x138
1016a3350:	98 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3354:	03 00 00 14	b	0x1016a3360
1016a3358:	f3 03 01 aa	mov	x19, x1
1016a335c:	f4 03 00 aa	mov	x20, x0
1016a3360:	e0 03 14 aa	mov	x0, x20
1016a3364:	05 b1 56 94	bl	0x102c4f778 ; symbol stub for: ___cxa_begin_catch
1016a3368:	7f 0a 00 71	cmp	w19, #0x2
1016a336c:	e1 07 00 54	b.ne	0x1016a3468
1016a3370:	f4 03 00 aa	mov	x20, x0
1016a3374:	e0 e3 04 91	add	x0, sp, #0x138
1016a3378:	01 00 80 52	mov	w1, #0x0
1016a337c:	96 41 00 94	bl	__ZN5wxime5utils9CallStackC2Ei
1016a3380:	a9 74 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3384:	1f 08 00 31	cmn	w0, #0x2
1016a3388:	4b 03 00 54	b.lt	0x1016a33f0
1016a338c:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3390:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3394:	f3 63 00 91	add	x19, sp, #0x18
1016a3398:	e0 63 00 91	add	x0, sp, #0x18
1016a339c:	21 00 80 12	mov	w1, #-0x2
1016a33a0:	83 3c 80 52	mov	w3, #0x1e4
1016a33a4:	78 d1 ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a33a8:	73 62 00 91	add	x19, x19, #0x18
1016a33ac:	21 c5 00 d0	adrp	x1, 6310 ; 0x102f49000
1016a33b0:	21 30 3e 91	add	x1, x1, #0xf8c ; literal pool for: "exception caught "
1016a33b4:	e0 03 13 aa	mov	x0, x19
1016a33b8:	22 02 80 52	mov	w2, #0x11
1016a33bc:	85 c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a33c0:	88 02 40 f9	ldr	x8, [x20]
1016a33c4:	08 09 40 f9	ldr	x8, [x8, #0x10]
1016a33c8:	e0 03 14 aa	mov	x0, x20
1016a33cc:	00 01 3f d6	blr	x8
1016a33d0:	f4 03 00 aa	mov	x20, x0
1016a33d4:	a4 b6 56 94	bl	0x102c50e64 ; symbol stub for: _strlen
1016a33d8:	e2 03 00 aa	mov	x2, x0
1016a33dc:	e0 03 13 aa	mov	x0, x19
1016a33e0:	e1 03 14 aa	mov	x1, x20
1016a33e4:	7b c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a33e8:	e0 63 00 91	add	x0, sp, #0x18
1016a33ec:	71 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a33f0:	8d 74 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a33f4:	1f 08 00 31	cmn	w0, #0x2
1016a33f8:	4b 03 00 54	b.lt	0x1016a3460
1016a33fc:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3400:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3404:	e0 63 00 91	add	x0, sp, #0x18
1016a3408:	21 00 80 12	mov	w1, #-0x2
1016a340c:	83 3c 80 52	mov	w3, #0x1e4
1016a3410:	5d d1 ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a3414:	f3 03 00 91	mov	x19, sp
1016a3418:	e8 03 00 91	mov	x8, sp
1016a341c:	e0 e3 04 91	add	x0, sp, #0x138
1016a3420:	91 d1 ff 97	bl	__ZNK5wxime5utils9CallStack11DebugStringEv
1016a3424:	e8 63 00 91	add	x8, sp, #0x18
1016a3428:	00 61 00 91	add	x0, x8, #0x18
1016a342c:	e8 5f 40 39	ldrb	w8, [sp, #0x17]
1016a3430:	09 1d 00 13	sxtb	w9, w8
1016a3434:	ea 2f 40 a9	ldp	x10, x11, [sp]
1016a3438:	3f 01 00 71	cmp	w9, #0x0
1016a343c:	41 b1 93 9a	csel	x1, x10, x19, lt
1016a3440:	62 b1 88 9a	csel	x2, x11, x8, lt
1016a3444:	63 c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3448:	e8 5f c0 39	ldrsb	w8, [sp, #0x17]
1016a344c:	68 00 f8 36	tbz	w8, #0x1f, 0x1016a3458
1016a3450:	e0 03 40 f9	ldr	x0, [sp]
1016a3454:	ae b0 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3458:	e0 63 00 91	add	x0, sp, #0x18
1016a345c:	55 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3460:	de b0 56 94	bl	0x102c4f7d8 ; symbol stub for: ___cxa_rethrow
1016a3464:	32 00 00 14	b	0x1016a352c
1016a3468:	e0 e3 04 91	add	x0, sp, #0x138
1016a346c:	01 00 80 52	mov	w1, #0x0
1016a3470:	59 41 00 94	bl	__ZN5wxime5utils9CallStackC2Ei
1016a3474:	6c 74 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a3478:	1f 08 00 31	cmn	w0, #0x2
1016a347c:	eb 01 00 54	b.lt	0x1016a34b8
1016a3480:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a3484:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a3488:	f3 63 00 91	add	x19, sp, #0x18
1016a348c:	e0 63 00 91	add	x0, sp, #0x18
1016a3490:	21 00 80 12	mov	w1, #-0x2
1016a3494:	83 3c 80 52	mov	w3, #0x1e4
1016a3498:	3b d1 ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a349c:	60 62 00 91	add	x0, x19, #0x18
1016a34a0:	21 c5 00 d0	adrp	x1, 6310 ; 0x102f49000
1016a34a4:	21 30 3e 91	add	x1, x1, #0xf8c ; literal pool for: "exception caught "
1016a34a8:	22 02 80 52	mov	w2, #0x11
1016a34ac:	49 c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a34b0:	e0 63 00 91	add	x0, sp, #0x18
1016a34b4:	3f 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a34b8:	5b 74 26 94	bl	__ZN6loguru24current_verbosity_cutoffEv
1016a34bc:	1f 08 00 31	cmn	w0, #0x2
1016a34c0:	4b 03 00 54	b.lt	0x1016a3528
1016a34c4:	22 c5 00 d0	adrp	x2, 6310 ; 0x102f49000
1016a34c8:	42 7c 39 91	add	x2, x2, #0xe5f ; literal pool for: "/Volumes/data/workspace/ime/wxime/c_api/wxime.cpp"
1016a34cc:	e0 63 00 91	add	x0, sp, #0x18
1016a34d0:	21 00 80 12	mov	w1, #-0x2
1016a34d4:	83 3c 80 52	mov	w3, #0x1e4
1016a34d8:	2b d1 ff 97	bl	__ZN6loguru12StreamLoggerC1EiPKcj
1016a34dc:	f3 03 00 91	mov	x19, sp
1016a34e0:	e8 03 00 91	mov	x8, sp
1016a34e4:	e0 e3 04 91	add	x0, sp, #0x138
1016a34e8:	5f d1 ff 97	bl	__ZNK5wxime5utils9CallStack11DebugStringEv
1016a34ec:	e8 63 00 91	add	x8, sp, #0x18
1016a34f0:	00 61 00 91	add	x0, x8, #0x18
1016a34f4:	e8 5f 40 39	ldrb	w8, [sp, #0x17]
1016a34f8:	09 1d 00 13	sxtb	w9, w8
1016a34fc:	ea 2f 40 a9	ldp	x10, x11, [sp]
1016a3500:	3f 01 00 71	cmp	w9, #0x0
1016a3504:	41 b1 93 9a	csel	x1, x10, x19, lt
1016a3508:	62 b1 88 9a	csel	x2, x11, x8, lt
1016a350c:	31 c0 a6 97	bl	__ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
1016a3510:	e8 5f c0 39	ldrsb	w8, [sp, #0x17]
1016a3514:	68 00 f8 36	tbz	w8, #0x1f, 0x1016a3520
1016a3518:	e0 03 40 f9	ldr	x0, [sp]
1016a351c:	7c b0 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3520:	e0 63 00 91	add	x0, sp, #0x18
1016a3524:	23 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3528:	ac b0 56 94	bl	0x102c4f7d8 ; symbol stub for: ___cxa_rethrow
1016a352c:	20 00 20 d4	brk	#0x1
1016a3530:	f3 03 00 aa	mov	x19, x0
1016a3534:	e8 5f c0 39	ldrsb	w8, [sp, #0x17]
1016a3538:	88 02 f8 36	tbz	w8, #0x1f, 0x1016a3588
1016a353c:	e0 03 40 f9	ldr	x0, [sp]
1016a3540:	73 b0 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a3544:	11 00 00 14	b	0x1016a3588
1016a3548:	f3 03 00 aa	mov	x19, x0
1016a354c:	e8 5f c0 39	ldrsb	w8, [sp, #0x17]
1016a3550:	48 01 f8 36	tbz	w8, #0x1f, 0x1016a3578
1016a3554:	e0 03 40 f9	ldr	x0, [sp]
1016a3558:	6d b0 56 94	bl	0x102c4f70c ; symbol stub for: __ZdlPv
1016a355c:	07 00 00 14	b	0x1016a3578
1016a3560:	09 00 00 14	b	0x1016a3584
1016a3564:	04 00 00 14	b	0x1016a3574
1016a3568:	07 00 00 14	b	0x1016a3584
1016a356c:	0c 00 00 14	b	0x1016a359c
1016a3570:	0f 00 00 14	b	0x1016a35ac
1016a3574:	f3 03 00 aa	mov	x19, x0
1016a3578:	e0 63 00 91	add	x0, sp, #0x18
1016a357c:	0d 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3580:	0c 00 00 14	b	0x1016a35b0
1016a3584:	f3 03 00 aa	mov	x19, x0
1016a3588:	e0 63 00 91	add	x0, sp, #0x18
1016a358c:	09 7d 26 94	bl	__ZN6loguru12StreamLoggerD1Ev
1016a3590:	04 00 00 14	b	0x1016a35a0
1016a3594:	06 00 00 14	b	0x1016a35ac
1016a3598:	01 00 00 14	b	0x1016a359c
1016a359c:	f3 03 00 aa	mov	x19, x0
1016a35a0:	e0 e3 04 91	add	x0, sp, #0x138
1016a35a4:	cb d1 ff 97	bl	__ZN5wxime5utils9CallStackD1Ev
1016a35a8:	09 00 00 14	b	0x1016a35cc
1016a35ac:	f3 03 00 aa	mov	x19, x0
1016a35b0:	e0 e3 04 91	add	x0, sp, #0x138
1016a35b4:	c7 d1 ff 97	bl	__ZN5wxime5utils9CallStackD1Ev
1016a35b8:	02 00 00 14	b	0x1016a35c0
1016a35bc:	f3 03 00 aa	mov	x19, x0
1016a35c0:	77 b0 56 94	bl	0x102c4f79c ; symbol stub for: ___cxa_end_catch
1016a35c4:	03 00 00 14	b	0x1016a35d0
1016a35c8:	f3 03 00 aa	mov	x19, x0
1016a35cc:	74 b0 56 94	bl	0x102c4f79c ; symbol stub for: ___cxa_end_catch
1016a35d0:	e0 03 13 aa	mov	x0, x19
1016a35d4:	6d ac 56 94	bl	0x102c4e788 ; symbol stub for: __Unwind_Resume
1016a35d8:	6a ba e5 97	bl	___clang_call_terminate
