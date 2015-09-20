   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 145                     .const:	section	.text
 146  0000               L6:
 147  0000 000001f4      	dc.l	500
 148                     ; 72 uint32_t test_start (void)
 148                     ; 73 {
 149                     	scross	off
 150                     .text:	section	.text,new
 151  0000               _test_start:
 153  0000 521a          	subw	sp,#26
 154       0000001a      OFST:	set	26
 157                     ; 79     failures = 0;
 159  0002 5f            	clrw	x
 160  0003 1f19          	ldw	(OFST-1,sp),x
 161                     ; 82     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 163  0005 4b00          	push	#0
 164  0007 ae01c7        	ldw	x,#L3_sem1
 165  000a cd0000        	call	_atomSemCreate
 167  000d 5b01          	addw	sp,#1
 168  000f 4d            	tnz	a
 169  0010 2711          	jreq	L101
 170                     ; 84         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 172  0012 ae00be        	ldw	x,#L301
 173  0015 cd0000        	call	_printf
 175                     ; 85         failures++;
 177  0018 1e19          	ldw	x,(OFST-1,sp)
 178  001a 1c0001        	addw	x,#1
 179  001d 1f19          	ldw	(OFST-1,sp),x
 181  001f ac5d015d      	jpf	L501
 182  0023               L101:
 183                     ; 90         test_running = TRUE;
 185  0023 ae0001        	ldw	x,#1
 186  0026 cf0000        	ldw	L11_test_running,x
 187                     ; 96         timer_cb.cb_func = testCallback;
 189  0029 ae0000        	ldw	x,#L51_testCallback
 190  002c 1f0f          	ldw	(OFST-11,sp),x
 191                     ; 97         timer_cb.cb_data = &timer_cb;
 193  002e 96            	ldw	x,sp
 194  002f 1c000f        	addw	x,#OFST-11
 195  0032 1f11          	ldw	(OFST-9,sp),x
 196                     ; 98         timer_cb.cb_ticks = 1;
 198  0034 ae0001        	ldw	x,#1
 199  0037 1f15          	ldw	(OFST-5,sp),x
 200  0039 ae0000        	ldw	x,#0
 201  003c 1f13          	ldw	(OFST-7,sp),x
 202                     ; 105         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 204  003e 96            	ldw	x,sp
 205  003f 1c000f        	addw	x,#OFST-11
 206  0042 cd0000        	call	_atomTimerRegister
 208  0045 4d            	tnz	a
 209  0046 2710          	jreq	L701
 210                     ; 107             ATOMLOG (_STR("Error registering timer\n"));
 212  0048 ae00a5        	ldw	x,#L111
 213  004b cd0000        	call	_printf
 215                     ; 108             failures++;
 217  004e 1e19          	ldw	x,(OFST-1,sp)
 218  0050 1c0001        	addw	x,#1
 219  0053 1f19          	ldw	(OFST-1,sp),x
 221  0055 cc00f2        	jra	L311
 222  0058               L701:
 223                     ; 112         else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO - 1, test_thread_func, 1,
 223                     ; 113               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 223                     ; 114               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 225  0058 ae0080        	ldw	x,#128
 226  005b 89            	pushw	x
 227  005c ae0000        	ldw	x,#0
 228  005f 89            	pushw	x
 229  0060 ae0081        	ldw	x,#L7_test_thread_stack+127
 230  0063 89            	pushw	x
 231  0064 ae0001        	ldw	x,#1
 232  0067 89            	pushw	x
 233  0068 ae0000        	ldw	x,#0
 234  006b 89            	pushw	x
 235  006c ae0000        	ldw	x,#L31_test_thread_func
 236  006f 89            	pushw	x
 237  0070 4b0f          	push	#15
 238  0072 ae0182        	ldw	x,#L5_tcb
 239  0075 cd0000        	call	_atomThreadCreate
 241  0078 5b0d          	addw	sp,#13
 242  007a 4d            	tnz	a
 243  007b 270f          	jreq	L511
 244                     ; 117             ATOMLOG (_STR("Error creating test thread 1\n"));
 246  007d ae0087        	ldw	x,#L711
 247  0080 cd0000        	call	_printf
 249                     ; 118             failures++;
 251  0083 1e19          	ldw	x,(OFST-1,sp)
 252  0085 1c0001        	addw	x,#1
 253  0088 1f19          	ldw	(OFST-1,sp),x
 255  008a 2066          	jra	L311
 256  008c               L511:
 257                     ; 122         else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 0,
 257                     ; 123               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 257                     ; 124               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 259  008c ae0080        	ldw	x,#128
 260  008f 89            	pushw	x
 261  0090 ae0000        	ldw	x,#0
 262  0093 89            	pushw	x
 263  0094 ae0101        	ldw	x,#L7_test_thread_stack+255
 264  0097 89            	pushw	x
 265  0098 ae0000        	ldw	x,#0
 266  009b 89            	pushw	x
 267  009c ae0000        	ldw	x,#0
 268  009f 89            	pushw	x
 269  00a0 ae0000        	ldw	x,#L31_test_thread_func
 270  00a3 89            	pushw	x
 271  00a4 4b10          	push	#16
 272  00a6 ae0199        	ldw	x,#L5_tcb+23
 273  00a9 cd0000        	call	_atomThreadCreate
 275  00ac 5b0d          	addw	sp,#13
 276  00ae 4d            	tnz	a
 277  00af 270f          	jreq	L321
 278                     ; 127             ATOMLOG (_STR("Error creating test thread 2\n"));
 280  00b1 ae0069        	ldw	x,#L521
 281  00b4 cd0000        	call	_printf
 283                     ; 128             failures++;
 285  00b7 1e19          	ldw	x,(OFST-1,sp)
 286  00b9 1c0001        	addw	x,#1
 287  00bc 1f19          	ldw	(OFST-1,sp),x
 289  00be 2032          	jra	L311
 290  00c0               L321:
 291                     ; 132         else if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO + 1, test_thread_func, 0,
 291                     ; 133               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 291                     ; 134               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 293  00c0 ae0080        	ldw	x,#128
 294  00c3 89            	pushw	x
 295  00c4 ae0000        	ldw	x,#0
 296  00c7 89            	pushw	x
 297  00c8 ae0181        	ldw	x,#L7_test_thread_stack+383
 298  00cb 89            	pushw	x
 299  00cc ae0000        	ldw	x,#0
 300  00cf 89            	pushw	x
 301  00d0 ae0000        	ldw	x,#0
 302  00d3 89            	pushw	x
 303  00d4 ae0000        	ldw	x,#L31_test_thread_func
 304  00d7 89            	pushw	x
 305  00d8 4b11          	push	#17
 306  00da ae01b0        	ldw	x,#L5_tcb+46
 307  00dd cd0000        	call	_atomThreadCreate
 309  00e0 5b0d          	addw	sp,#13
 310  00e2 4d            	tnz	a
 311  00e3 2725          	jreq	L131
 312                     ; 137             ATOMLOG (_STR("Error creating test thread 3\n"));
 314  00e5 ae004b        	ldw	x,#L331
 315  00e8 cd0000        	call	_printf
 317                     ; 138             failures++;
 319  00eb 1e19          	ldw	x,(OFST-1,sp)
 320  00ed 1c0001        	addw	x,#1
 321  00f0 1f19          	ldw	(OFST-1,sp),x
 323  00f2               L311:
 324                     ; 173         if (atomSemDelete (&sem1) != ATOM_OK)
 326  00f2 ae01c7        	ldw	x,#L3_sem1
 327  00f5 cd0000        	call	_atomSemDelete
 329  00f8 4d            	tnz	a
 330  00f9 2762          	jreq	L501
 331                     ; 175             ATOMLOG (_STR("Delete failed\n"));
 333  00fb ae0034        	ldw	x,#L551
 334  00fe cd0000        	call	_printf
 336                     ; 176             failures++;
 338  0101 1e19          	ldw	x,(OFST-1,sp)
 339  0103 1c0001        	addw	x,#1
 340  0106 1f19          	ldw	(OFST-1,sp),x
 341  0108 2053          	jra	L501
 342  010a               L131:
 343                     ; 149             end_time = atomTimeGet() + (5 * SYSTEM_TICKS_PER_SEC);
 345  010a cd0000        	call	_atomTimeGet
 347  010d ae0000        	ldw	x,#L6
 348  0110 cd0000        	call	c_ladd
 350  0113 96            	ldw	x,sp
 351  0114 1c000b        	addw	x,#OFST-15
 352  0117 cd0000        	call	c_rtol
 355  011a 2033          	jra	L341
 356  011c               L731:
 357                     ; 153                 if (atomSemGet (&sem1, SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 359  011c ae0064        	ldw	x,#100
 360  011f 89            	pushw	x
 361  0120 ae0000        	ldw	x,#0
 362  0123 89            	pushw	x
 363  0124 ae01c7        	ldw	x,#L3_sem1
 364  0127 cd0000        	call	_atomSemGet
 366  012a 5b04          	addw	sp,#4
 367  012c 4d            	tnz	a
 368  012d 2720          	jreq	L341
 369                     ; 155                     ATOMLOG (_STR("SemGet\n"));
 371  012f ae0043        	ldw	x,#L151
 372  0132 cd0000        	call	_printf
 374                     ; 156                     failures++;
 376  0135 1e19          	ldw	x,(OFST-1,sp)
 377  0137 1c0001        	addw	x,#1
 378  013a 1f19          	ldw	(OFST-1,sp),x
 379                     ; 157                     break;
 380  013c               L541:
 381                     ; 162             test_running = FALSE;
 383  013c 5f            	clrw	x
 384  013d cf0000        	ldw	L11_test_running,x
 385                     ; 169             atomTimerDelay(2);
 387  0140 ae0002        	ldw	x,#2
 388  0143 89            	pushw	x
 389  0144 ae0000        	ldw	x,#0
 390  0147 89            	pushw	x
 391  0148 cd0000        	call	_atomTimerDelay
 393  014b 5b04          	addw	sp,#4
 394  014d 20a3          	jra	L311
 395  014f               L341:
 396                     ; 150             while (atomTimeGet() < end_time)
 398  014f cd0000        	call	_atomTimeGet
 400  0152 96            	ldw	x,sp
 401  0153 1c000b        	addw	x,#OFST-15
 402  0156 cd0000        	call	c_lcmp
 404  0159 25c1          	jrult	L731
 405  015b 20df          	jra	L541
 406  015d               L501:
 407                     ; 187         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 409  015d 5f            	clrw	x
 410  015e 1f09          	ldw	(OFST-17,sp),x
 411  0160               L751:
 412                     ; 190             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 414  0160 96            	ldw	x,sp
 415  0161 1c0005        	addw	x,#OFST-21
 416  0164 89            	pushw	x
 417  0165 96            	ldw	x,sp
 418  0166 1c0003        	addw	x,#OFST-23
 419  0169 89            	pushw	x
 420  016a 1e0d          	ldw	x,(OFST-13,sp)
 421  016c 90ae0017      	ldw	y,#23
 422  0170 cd0000        	call	c_imul
 424  0173 1c0182        	addw	x,#L5_tcb
 425  0176 cd0000        	call	_atomThreadStackCheck
 427  0179 5b04          	addw	sp,#4
 428  017b 4d            	tnz	a
 429  017c 270f          	jreq	L561
 430                     ; 192                 ATOMLOG (_STR("StackCheck\n"));
 432  017e ae0028        	ldw	x,#L761
 433  0181 cd0000        	call	_printf
 435                     ; 193                 failures++;
 437  0184 1e19          	ldw	x,(OFST-1,sp)
 438  0186 1c0001        	addw	x,#1
 439  0189 1f19          	ldw	(OFST-1,sp),x
 441  018b 2024          	jra	L171
 442  018d               L561:
 443                     ; 198                 if (free_bytes == 0)
 445  018d 96            	ldw	x,sp
 446  018e 1c0005        	addw	x,#OFST-21
 447  0191 cd0000        	call	c_lzmp
 449  0194 2611          	jrne	L371
 450                     ; 200                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 452  0196 1e09          	ldw	x,(OFST-17,sp)
 453  0198 89            	pushw	x
 454  0199 ae0016        	ldw	x,#L571
 455  019c cd0000        	call	_printf
 457  019f 85            	popw	x
 458                     ; 201                     failures++;
 460  01a0 1e19          	ldw	x,(OFST-1,sp)
 461  01a2 1c0001        	addw	x,#1
 462  01a5 1f19          	ldw	(OFST-1,sp),x
 463  01a7               L371:
 464                     ; 206                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 466  01a7 1e03          	ldw	x,(OFST-23,sp)
 467  01a9 89            	pushw	x
 468  01aa ae0009        	ldw	x,#L771
 469  01ad cd0000        	call	_printf
 471  01b0 85            	popw	x
 472  01b1               L171:
 473                     ; 187         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 475  01b1 1e09          	ldw	x,(OFST-17,sp)
 476  01b3 1c0001        	addw	x,#1
 477  01b6 1f09          	ldw	(OFST-17,sp),x
 480  01b8 9c            	rvf
 481  01b9 1e09          	ldw	x,(OFST-17,sp)
 482  01bb a30003        	cpw	x,#3
 483  01be 2fa0          	jrslt	L751
 484                     ; 214     return failures;
 486  01c0 1e19          	ldw	x,(OFST-1,sp)
 487  01c2 cd0000        	call	c_itolx
 491  01c5 5b1a          	addw	sp,#26
 492  01c7 81            	ret
 557                     ; 228 static void test_thread_func (uint32_t param)
 557                     ; 229 {
 558                     .text:	section	.text,new
 559  0000               L31_test_thread_func:
 561  0000 5207          	subw	sp,#7
 562       00000007      OFST:	set	7
 565                     ; 234     sleep_flag = (int)param;
 567  0002 1e0c          	ldw	x,(OFST+5,sp)
 568  0004 1f01          	ldw	(OFST-6,sp),x
 569                     ; 237     failures = 0;
 571  0006 5f            	clrw	x
 572  0007 1f05          	ldw	(OFST-2,sp),x
 574  0009 204a          	jra	L132
 575  000b               L522:
 576                     ; 241         count = 50;
 578  000b ae0032        	ldw	x,#50
 579  000e 1f03          	ldw	(OFST-4,sp),x
 581  0010 2032          	jra	L142
 582  0012               L532:
 583                     ; 249             status = atomSemPut (&sem1);
 585  0012 ae01c7        	ldw	x,#L3_sem1
 586  0015 cd0000        	call	_atomSemPut
 588  0018 6b07          	ld	(OFST+0,sp),a
 589                     ; 250             if ((status != ATOM_OK) && (status != ATOM_ERR_OVF))
 591  001a 0d07          	tnz	(OFST+0,sp)
 592  001c 2726          	jreq	L142
 594  001e 7b07          	ld	a,(OFST+0,sp)
 595  0020 a1cb          	cp	a,#203
 596  0022 2720          	jreq	L142
 597                     ; 252                 ATOMLOG (_STR("Put\n"));
 599  0024 ae0004        	ldw	x,#L742
 600  0027 cd0000        	call	_printf
 602                     ; 253                 failures++;
 604  002a 1e05          	ldw	x,(OFST-2,sp)
 605  002c 1c0001        	addw	x,#1
 606  002f 1f05          	ldw	(OFST-2,sp),x
 607                     ; 254                 break;
 608  0031               L342:
 609                     ; 264         if (sleep_flag)
 611  0031 1e01          	ldw	x,(OFST-6,sp)
 612  0033 2720          	jreq	L132
 613                     ; 266             atomTimerDelay (1);
 615  0035 ae0001        	ldw	x,#1
 616  0038 89            	pushw	x
 617  0039 ae0000        	ldw	x,#0
 618  003c 89            	pushw	x
 619  003d cd0000        	call	_atomTimerDelay
 621  0040 5b04          	addw	sp,#4
 622  0042 2011          	jra	L132
 623  0044               L142:
 624                     ; 242         while (count--)
 626  0044 1e03          	ldw	x,(OFST-4,sp)
 627  0046 1d0001        	subw	x,#1
 628  0049 1f03          	ldw	(OFST-4,sp),x
 629  004b 1c0001        	addw	x,#1
 630  004e a30000        	cpw	x,#0
 631  0051 26bf          	jrne	L532
 632  0053 20dc          	jra	L342
 633  0055               L132:
 634                     ; 238     while ((test_running == TRUE) && (failures == 0))
 636  0055 ce0000        	ldw	x,L11_test_running
 637  0058 a30001        	cpw	x,#1
 638  005b 2604          	jrne	L552
 640  005d 1e05          	ldw	x,(OFST-2,sp)
 641  005f 27aa          	jreq	L522
 642  0061               L552:
 643                     ; 273         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 645  0061 ae0064        	ldw	x,#100
 646  0064 89            	pushw	x
 647  0065 ae0000        	ldw	x,#0
 648  0068 89            	pushw	x
 649  0069 cd0000        	call	_atomTimerDelay
 651  006c 5b04          	addw	sp,#4
 653  006e 20f1          	jra	L552
 711                     ; 291 static void testCallback (POINTER cb_data)
 711                     ; 292 {
 712                     .text:	section	.text,new
 713  0000               L51_testCallback:
 715  0000 5203          	subw	sp,#3
 716       00000003      OFST:	set	3
 719                     ; 297     ptimer = (ATOM_TIMER *)cb_data;
 721  0002 1f01          	ldw	(OFST-2,sp),x
 722                     ; 300     status = atomSemPut (&sem1);
 724  0004 ae01c7        	ldw	x,#L3_sem1
 725  0007 cd0000        	call	_atomSemPut
 727  000a 6b03          	ld	(OFST+0,sp),a
 728                     ; 301     if ((status != ATOM_OK) && (status != ATOM_ERR_OVF))
 730  000c 0d03          	tnz	(OFST+0,sp)
 731  000e 2704          	jreq	L703
 733  0010 7b03          	ld	a,(OFST+0,sp)
 734  0012 a1cb          	cp	a,#203
 735  0014               L703:
 736                     ; 307     if (test_running == TRUE)
 738  0014 ce0000        	ldw	x,L11_test_running
 739  0017 a30001        	cpw	x,#1
 740  001a 2618          	jrne	L513
 741                     ; 310         ptimer->cb_ticks = 1;
 743  001c 1e01          	ldw	x,(OFST-2,sp)
 744  001e a601          	ld	a,#1
 745  0020 e707          	ld	(7,x),a
 746  0022 a600          	ld	a,#0
 747  0024 e706          	ld	(6,x),a
 748  0026 a600          	ld	a,#0
 749  0028 e705          	ld	(5,x),a
 750  002a a600          	ld	a,#0
 751  002c e704          	ld	(4,x),a
 752                     ; 311         if (atomTimerRegister (ptimer) != ATOM_OK)
 754  002e 1e01          	ldw	x,(OFST-2,sp)
 755  0030 cd0000        	call	_atomTimerRegister
 757  0033 4d            	tnz	a
 758  0034               L513:
 759                     ; 320 }
 762  0034 5b03          	addw	sp,#3
 763  0036 81            	ret
 956                     	switch	.bss
 957  0000               L11_test_running:
 958  0000 0000          	ds.b	2
 959  0002               L7_test_thread_stack:
 960  0002 000000000000  	ds.b	384
 961  0182               L5_tcb:
 962  0182 000000000000  	ds.b	69
 963  01c7               L3_sem1:
 964  01c7 000000        	ds.b	3
 965                     	xref	_atomSemPut
 966                     	xref	_atomSemGet
 967                     	xref	_atomSemDelete
 968                     	xref	_atomSemCreate
 969                     	xdef	_test_start
 970                     	xref	_printf
 971                     	xref	_atomThreadStackCheck
 972                     	xref	_atomThreadCreate
 973                     	xref	_atomTimeGet
 974                     	xref	_atomTimerDelay
 975                     	xref	_atomTimerRegister
 976                     	switch	.const
 977  0004               L742:
 978  0004 5075740a00    	dc.b	"Put",10,0
 979  0009               L771:
 980  0009 537461636b55  	dc.b	"StackUse:%d",10,0
 981  0016               L571:
 982  0016 537461636b4f  	dc.b	"StackOverflow %d",10,0
 983  0028               L761:
 984  0028 537461636b43  	dc.b	"StackCheck",10,0
 985  0034               L551:
 986  0034 44656c657465  	dc.b	"Delete failed",10,0
 987  0043               L151:
 988  0043 53656d476574  	dc.b	"SemGet",10,0
 989  004b               L331:
 990  004b 4572726f7220  	dc.b	"Error creating tes"
 991  005d 742074687265  	dc.b	"t thread 3",10,0
 992  0069               L521:
 993  0069 4572726f7220  	dc.b	"Error creating tes"
 994  007b 742074687265  	dc.b	"t thread 2",10,0
 995  0087               L711:
 996  0087 4572726f7220  	dc.b	"Error creating tes"
 997  0099 742074687265  	dc.b	"t thread 1",10,0
 998  00a5               L111:
 999  00a5 4572726f7220  	dc.b	"Error registering "
1000  00b7 74696d65720a  	dc.b	"timer",10,0
1001  00be               L301:
1002  00be 4572726f7220  	dc.b	"Error creating tes"
1003  00d0 742073656d61  	dc.b	"t semaphore 1",10,0
1004                     	xref.b	c_x
1024                     	xref	c_itolx
1025                     	xref	c_lzmp
1026                     	xref	c_imul
1027                     	xref	c_lcmp
1028                     	xref	c_rtol
1029                     	xref	c_ladd
1030                     	end
