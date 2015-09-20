   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 152                     ; 68 uint32_t test_start (void)
 152                     ; 69 {
 154                     .text:	section	.text,new
 155  0000               _test_start:
 157  0000 5217          	subw	sp,#23
 158       00000017      OFST:	set	23
 161                     ; 76     failures = 0;
 163  0002 5f            	clrw	x
 164  0003 1f16          	ldw	(OFST-1,sp),x
 165                     ; 79     if (atomMutexGet (NULL, 0) != ATOM_ERR_PARAM)
 167  0005 ae0000        	ldw	x,#0
 168  0008 89            	pushw	x
 169  0009 ae0000        	ldw	x,#0
 170  000c 89            	pushw	x
 171  000d 5f            	clrw	x
 172  000e cd0000        	call	_atomMutexGet
 174  0011 5b04          	addw	sp,#4
 175  0013 a1c9          	cp	a,#201
 176  0015 270d          	jreq	L701
 177                     ; 81         ATOMLOG (_STR("Get param failed\n"));
 179  0017 ae01b9        	ldw	x,#L111
 180  001a cd0000        	call	_printf
 182                     ; 82         failures++;
 184  001d 1e16          	ldw	x,(OFST-1,sp)
 185  001f 1c0001        	addw	x,#1
 186  0022 1f16          	ldw	(OFST-1,sp),x
 187  0024               L701:
 188                     ; 84     if (atomMutexPut (NULL) != ATOM_ERR_PARAM)
 190  0024 5f            	clrw	x
 191  0025 cd0000        	call	_atomMutexPut
 193  0028 a1c9          	cp	a,#201
 194  002a 270d          	jreq	L311
 195                     ; 86         ATOMLOG (_STR("Put param failed\n"));
 197  002c ae01a7        	ldw	x,#L511
 198  002f cd0000        	call	_printf
 200                     ; 87         failures++;
 202  0032 1e16          	ldw	x,(OFST-1,sp)
 203  0034 1c0001        	addw	x,#1
 204  0037 1f16          	ldw	(OFST-1,sp),x
 205  0039               L311:
 206                     ; 91     g_result = 0;
 208  0039 5f            	clrw	x
 209  003a cf0002        	ldw	L31_g_result,x
 210                     ; 92     if (atomMutexCreate (&mutex1) != ATOM_OK)
 212  003d ae00a0        	ldw	x,#L3_mutex1
 213  0040 cd0000        	call	_atomMutexCreate
 215  0043 4d            	tnz	a
 216  0044 270f          	jreq	L711
 217                     ; 94         ATOMLOG (_STR("Error creating test mutex1\n"));
 219  0046 ae018b        	ldw	x,#L121
 220  0049 cd0000        	call	_printf
 222                     ; 95         failures++;
 224  004c 1e16          	ldw	x,(OFST-1,sp)
 225  004e 1c0001        	addw	x,#1
 226  0051 1f16          	ldw	(OFST-1,sp),x
 228  0053 2063          	jra	L321
 229  0055               L711:
 230                     ; 100         timer_cb.cb_func = testCallback;
 232  0055 ae0000        	ldw	x,#L71_testCallback
 233  0058 1f0a          	ldw	(OFST-13,sp),x
 234                     ; 101         timer_cb.cb_data = NULL;
 236  005a 5f            	clrw	x
 237  005b 1f0c          	ldw	(OFST-11,sp),x
 238                     ; 102         timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 240  005d ae0064        	ldw	x,#100
 241  0060 1f10          	ldw	(OFST-7,sp),x
 242  0062 ae0000        	ldw	x,#0
 243  0065 1f0e          	ldw	(OFST-9,sp),x
 244                     ; 105         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 246  0067 96            	ldw	x,sp
 247  0068 1c000a        	addw	x,#OFST-13
 248  006b cd0000        	call	_atomTimerRegister
 250  006e 4d            	tnz	a
 251  006f 270f          	jreq	L521
 252                     ; 107             ATOMLOG (_STR("Error registering timer\n"));
 254  0071 ae0172        	ldw	x,#L721
 255  0074 cd0000        	call	_printf
 257                     ; 108             failures++;
 259  0077 1e16          	ldw	x,(OFST-1,sp)
 260  0079 1c0001        	addw	x,#1
 261  007c 1f16          	ldw	(OFST-1,sp),x
 263  007e 2022          	jra	L131
 264  0080               L521:
 265                     ; 114             atomTimerDelay (2 * SYSTEM_TICKS_PER_SEC);
 267  0080 ae00c8        	ldw	x,#200
 268  0083 89            	pushw	x
 269  0084 ae0000        	ldw	x,#0
 270  0087 89            	pushw	x
 271  0088 cd0000        	call	_atomTimerDelay
 273  008b 5b04          	addw	sp,#4
 274                     ; 115             if (g_result != 1)
 276  008d ce0002        	ldw	x,L31_g_result
 277  0090 a30001        	cpw	x,#1
 278  0093 270d          	jreq	L131
 279                     ; 117                 ATOMLOG (_STR("Context check failed\n"));
 281  0095 ae015c        	ldw	x,#L531
 282  0098 cd0000        	call	_printf
 284                     ; 118                 failures++;
 286  009b 1e16          	ldw	x,(OFST-1,sp)
 287  009d 1c0001        	addw	x,#1
 288  00a0 1f16          	ldw	(OFST-1,sp),x
 289  00a2               L131:
 290                     ; 123         if (atomMutexDelete (&mutex1) != ATOM_OK)
 292  00a2 ae00a0        	ldw	x,#L3_mutex1
 293  00a5 cd0000        	call	_atomMutexDelete
 295  00a8 4d            	tnz	a
 296  00a9 270d          	jreq	L321
 297                     ; 125             ATOMLOG (_STR("Mutex1 delete failed\n"));
 299  00ab ae0146        	ldw	x,#L141
 300  00ae cd0000        	call	_printf
 302                     ; 126             failures++;
 304  00b1 1e16          	ldw	x,(OFST-1,sp)
 305  00b3 1c0001        	addw	x,#1
 306  00b6 1f16          	ldw	(OFST-1,sp),x
 307  00b8               L321:
 308                     ; 131     if (atomMutexCreate (&mutex1) != ATOM_OK)
 310  00b8 ae00a0        	ldw	x,#L3_mutex1
 311  00bb cd0000        	call	_atomMutexCreate
 313  00be 4d            	tnz	a
 314  00bf 270f          	jreq	L341
 315                     ; 133         ATOMLOG (_STR("Error creating test mutex 1\n"));
 317  00c1 ae0129        	ldw	x,#L541
 318  00c4 cd0000        	call	_printf
 320                     ; 134         failures++;
 322  00c7 1e16          	ldw	x,(OFST-1,sp)
 323  00c9 1c0001        	addw	x,#1
 324  00cc 1f16          	ldw	(OFST-1,sp),x
 326  00ce 2016          	jra	L741
 327  00d0               L341:
 328                     ; 138     else if (atomMutexCreate (&mutex2) != ATOM_OK)
 330  00d0 ae009b        	ldw	x,#L5_mutex2
 331  00d3 cd0000        	call	_atomMutexCreate
 333  00d6 4d            	tnz	a
 334  00d7 270d          	jreq	L741
 335                     ; 140         ATOMLOG (_STR("Error creating test mutex 2\n"));
 337  00d9 ae010c        	ldw	x,#L351
 338  00dc cd0000        	call	_printf
 340                     ; 141         failures++;
 342  00df 1e16          	ldw	x,(OFST-1,sp)
 343  00e1 1c0001        	addw	x,#1
 344  00e4 1f16          	ldw	(OFST-1,sp),x
 345  00e6               L741:
 346                     ; 145     g_owned = 0;
 348  00e6 5f            	clrw	x
 349  00e7 cf0000        	ldw	L51_g_owned,x
 350                     ; 146     if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 0,
 350                     ; 147               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 350                     ; 148               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 352  00ea ae0080        	ldw	x,#128
 353  00ed 89            	pushw	x
 354  00ee ae0000        	ldw	x,#0
 355  00f1 89            	pushw	x
 356  00f2 ae0083        	ldw	x,#L11_test_thread_stack+127
 357  00f5 89            	pushw	x
 358  00f6 ae0000        	ldw	x,#0
 359  00f9 89            	pushw	x
 360  00fa ae0000        	ldw	x,#0
 361  00fd 89            	pushw	x
 362  00fe ae0000        	ldw	x,#L12_test_thread_func
 363  0101 89            	pushw	x
 364  0102 4b10          	push	#16
 365  0104 ae0084        	ldw	x,#L7_tcb
 366  0107 cd0000        	call	_atomThreadCreate
 368  010a 5b0d          	addw	sp,#13
 369  010c 4d            	tnz	a
 370  010d 270d          	jreq	L551
 371                     ; 151         ATOMLOG (_STR("Error creating test thread 1\n"));
 373  010f ae00ee        	ldw	x,#L751
 374  0112 cd0000        	call	_printf
 376                     ; 152         failures++;
 378  0115 1e16          	ldw	x,(OFST-1,sp)
 379  0117 1c0001        	addw	x,#1
 380  011a 1f16          	ldw	(OFST-1,sp),x
 381  011c               L551:
 382                     ; 156     atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 384  011c ae0064        	ldw	x,#100
 385  011f 89            	pushw	x
 386  0120 ae0000        	ldw	x,#0
 387  0123 89            	pushw	x
 388  0124 cd0000        	call	_atomTimerDelay
 390  0127 5b04          	addw	sp,#4
 391                     ; 157     if (g_owned == 0)
 393  0129 ce0000        	ldw	x,L51_g_owned
 394  012c 260d          	jrne	L161
 395                     ; 159         ATOMLOG (_STR("Thread own fail\n"));
 397  012e ae00dd        	ldw	x,#L361
 398  0131 cd0000        	call	_printf
 400                     ; 160         failures++;
 402  0134 1e16          	ldw	x,(OFST-1,sp)
 403  0136 1c0001        	addw	x,#1
 404  0139 1f16          	ldw	(OFST-1,sp),x
 405  013b               L161:
 406                     ; 164     if ((status = atomMutexGet (&mutex2, SYSTEM_TICKS_PER_SEC)) != ATOM_TIMEOUT)
 408  013b ae0064        	ldw	x,#100
 409  013e 89            	pushw	x
 410  013f ae0000        	ldw	x,#0
 411  0142 89            	pushw	x
 412  0143 ae009b        	ldw	x,#L5_mutex2
 413  0146 cd0000        	call	_atomMutexGet
 415  0149 5b04          	addw	sp,#4
 416  014b 6b09          	ld	(OFST-14,sp),a
 417  014d 7b09          	ld	a,(OFST-14,sp)
 418  014f a102          	cp	a,#2
 419  0151 2711          	jreq	L171
 420                     ; 166         ATOMLOG (_STR("Get %d\n"), status);
 422  0153 7b09          	ld	a,(OFST-14,sp)
 423  0155 88            	push	a
 424  0156 ae00d5        	ldw	x,#L761
 425  0159 cd0000        	call	_printf
 427  015c 84            	pop	a
 428                     ; 167         failures++;
 430  015d 1e16          	ldw	x,(OFST-1,sp)
 431  015f 1c0001        	addw	x,#1
 432  0162 1f16          	ldw	(OFST-1,sp),x
 434  0164               L171:
 435                     ; 175     if ((status = atomMutexGet (&mutex2, -1)) != ATOM_WOULDBLOCK)
 437  0164 aeffff        	ldw	x,#65535
 438  0167 89            	pushw	x
 439  0168 aeffff        	ldw	x,#-1
 440  016b 89            	pushw	x
 441  016c ae009b        	ldw	x,#L5_mutex2
 442  016f cd0000        	call	_atomMutexGet
 444  0172 5b04          	addw	sp,#4
 445  0174 6b09          	ld	(OFST-14,sp),a
 446  0176 7b09          	ld	a,(OFST-14,sp)
 447  0178 a103          	cp	a,#3
 448  017a 2711          	jreq	L371
 449                     ; 177         ATOMLOG (_STR("Wouldblock err %d\n"), status);
 451  017c 7b09          	ld	a,(OFST-14,sp)
 452  017e 88            	push	a
 453  017f ae00c2        	ldw	x,#L571
 454  0182 cd0000        	call	_printf
 456  0185 84            	pop	a
 457                     ; 178         failures++;
 459  0186 1e16          	ldw	x,(OFST-1,sp)
 460  0188 1c0001        	addw	x,#1
 461  018b 1f16          	ldw	(OFST-1,sp),x
 462  018d               L371:
 463                     ; 182     if (atomMutexGet (&mutex1, -1) != ATOM_OK)
 465  018d aeffff        	ldw	x,#65535
 466  0190 89            	pushw	x
 467  0191 aeffff        	ldw	x,#-1
 468  0194 89            	pushw	x
 469  0195 ae00a0        	ldw	x,#L3_mutex1
 470  0198 cd0000        	call	_atomMutexGet
 472  019b 5b04          	addw	sp,#4
 473  019d 4d            	tnz	a
 474  019e 270f          	jreq	L771
 475                     ; 184         ATOMLOG (_STR("Error taking mutex1\n"));
 477  01a0 ae00ad        	ldw	x,#L102
 478  01a3 cd0000        	call	_printf
 480                     ; 185         failures++;
 482  01a6 1e16          	ldw	x,(OFST-1,sp)
 483  01a8 1c0001        	addw	x,#1
 484  01ab 1f16          	ldw	(OFST-1,sp),x
 486  01ad 2016          	jra	L302
 487  01af               L771:
 488                     ; 190         if (atomMutexPut (&mutex1) != ATOM_OK)
 490  01af ae00a0        	ldw	x,#L3_mutex1
 491  01b2 cd0000        	call	_atomMutexPut
 493  01b5 4d            	tnz	a
 494  01b6 270d          	jreq	L302
 495                     ; 192             ATOMLOG (_STR("Error posting mutex\n"));
 497  01b8 ae0098        	ldw	x,#L702
 498  01bb cd0000        	call	_printf
 500                     ; 193             failures++;
 502  01be 1e16          	ldw	x,(OFST-1,sp)
 503  01c0 1c0001        	addw	x,#1
 504  01c3 1f16          	ldw	(OFST-1,sp),x
 505  01c5               L302:
 506                     ; 198     count = 255;
 508  01c5 ae00ff        	ldw	x,#255
 509  01c8 1f14          	ldw	(OFST-3,sp),x
 511  01ca 2043          	jra	L512
 512  01cc               L112:
 513                     ; 201         if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 515  01cc ae0000        	ldw	x,#0
 516  01cf 89            	pushw	x
 517  01d0 ae0000        	ldw	x,#0
 518  01d3 89            	pushw	x
 519  01d4 ae00a0        	ldw	x,#L3_mutex1
 520  01d7 cd0000        	call	_atomMutexGet
 522  01da 5b04          	addw	sp,#4
 523  01dc 4d            	tnz	a
 524  01dd 2730          	jreq	L512
 525                     ; 203             ATOMLOG (_STR("Error getting mutex1\n"));
 527  01df ae0082        	ldw	x,#L322
 528  01e2 cd0000        	call	_printf
 530                     ; 204             failures++;
 532  01e5 1e16          	ldw	x,(OFST-1,sp)
 533  01e7 1c0001        	addw	x,#1
 534  01ea 1f16          	ldw	(OFST-1,sp),x
 535                     ; 205             break;
 536  01ec               L712:
 537                     ; 210     if (atomMutexGet (&mutex1, 0) != ATOM_ERR_OVF)
 539  01ec ae0000        	ldw	x,#0
 540  01ef 89            	pushw	x
 541  01f0 ae0000        	ldw	x,#0
 542  01f3 89            	pushw	x
 543  01f4 ae00a0        	ldw	x,#L3_mutex1
 544  01f7 cd0000        	call	_atomMutexGet
 546  01fa 5b04          	addw	sp,#4
 547  01fc a1cb          	cp	a,#203
 548  01fe 2720          	jreq	L132
 549                     ; 212         ATOMLOG (_STR("Error tracking overflow\n"));
 551  0200 ae0069        	ldw	x,#L722
 552  0203 cd0000        	call	_printf
 554                     ; 213         failures++;
 556  0206 1e16          	ldw	x,(OFST-1,sp)
 557  0208 1c0001        	addw	x,#1
 558  020b 1f16          	ldw	(OFST-1,sp),x
 560  020d 2011          	jra	L132
 561  020f               L512:
 562                     ; 199     while (count--)
 564  020f 1e14          	ldw	x,(OFST-3,sp)
 565  0211 1d0001        	subw	x,#1
 566  0214 1f14          	ldw	(OFST-3,sp),x
 567  0216 1c0001        	addw	x,#1
 568  0219 a30000        	cpw	x,#0
 569  021c 26ae          	jrne	L112
 570  021e 20cc          	jra	L712
 571  0220               L132:
 572                     ; 221     if (atomMutexDelete (&mutex1) != ATOM_OK)
 574  0220 ae00a0        	ldw	x,#L3_mutex1
 575  0223 cd0000        	call	_atomMutexDelete
 577  0226 4d            	tnz	a
 578  0227 270d          	jreq	L332
 579                     ; 223         ATOMLOG (_STR("Error deleting mutex1\n"));
 581  0229 ae0052        	ldw	x,#L532
 582  022c cd0000        	call	_printf
 584                     ; 224         failures++;
 586  022f 1e16          	ldw	x,(OFST-1,sp)
 587  0231 1c0001        	addw	x,#1
 588  0234 1f16          	ldw	(OFST-1,sp),x
 589  0236               L332:
 590                     ; 226     if (atomMutexDelete (&mutex2) != ATOM_OK)
 592  0236 ae009b        	ldw	x,#L5_mutex2
 593  0239 cd0000        	call	_atomMutexDelete
 595  023c 4d            	tnz	a
 596  023d 270d          	jreq	L732
 597                     ; 228         ATOMLOG (_STR("Error deleting mutex2\n"));
 599  023f ae003b        	ldw	x,#L142
 600  0242 cd0000        	call	_printf
 602                     ; 229         failures++;
 604  0245 1e16          	ldw	x,(OFST-1,sp)
 605  0247 1c0001        	addw	x,#1
 606  024a 1f16          	ldw	(OFST-1,sp),x
 607  024c               L732:
 608                     ; 239         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 610  024c 5f            	clrw	x
 611  024d 1f14          	ldw	(OFST-3,sp),x
 612  024f               L342:
 613                     ; 242             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 615  024f 96            	ldw	x,sp
 616  0250 1c0005        	addw	x,#OFST-18
 617  0253 89            	pushw	x
 618  0254 96            	ldw	x,sp
 619  0255 1c0003        	addw	x,#OFST-20
 620  0258 89            	pushw	x
 621  0259 1e18          	ldw	x,(OFST+1,sp)
 622  025b 90ae0017      	ldw	y,#23
 623  025f cd0000        	call	c_imul
 625  0262 1c0084        	addw	x,#L7_tcb
 626  0265 cd0000        	call	_atomThreadStackCheck
 628  0268 5b04          	addw	sp,#4
 629  026a 4d            	tnz	a
 630  026b 270f          	jreq	L152
 631                     ; 244                 ATOMLOG (_STR("StackCheck\n"));
 633  026d ae002f        	ldw	x,#L352
 634  0270 cd0000        	call	_printf
 636                     ; 245                 failures++;
 638  0273 1e16          	ldw	x,(OFST-1,sp)
 639  0275 1c0001        	addw	x,#1
 640  0278 1f16          	ldw	(OFST-1,sp),x
 642  027a 2024          	jra	L552
 643  027c               L152:
 644                     ; 250                 if (free_bytes == 0)
 646  027c 96            	ldw	x,sp
 647  027d 1c0005        	addw	x,#OFST-18
 648  0280 cd0000        	call	c_lzmp
 650  0283 2611          	jrne	L752
 651                     ; 252                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 653  0285 1e14          	ldw	x,(OFST-3,sp)
 654  0287 89            	pushw	x
 655  0288 ae001d        	ldw	x,#L162
 656  028b cd0000        	call	_printf
 658  028e 85            	popw	x
 659                     ; 253                     failures++;
 661  028f 1e16          	ldw	x,(OFST-1,sp)
 662  0291 1c0001        	addw	x,#1
 663  0294 1f16          	ldw	(OFST-1,sp),x
 664  0296               L752:
 665                     ; 258                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 667  0296 1e03          	ldw	x,(OFST-20,sp)
 668  0298 89            	pushw	x
 669  0299 ae0010        	ldw	x,#L362
 670  029c cd0000        	call	_printf
 672  029f 85            	popw	x
 673  02a0               L552:
 674                     ; 239         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 676  02a0 1e14          	ldw	x,(OFST-3,sp)
 677  02a2 1c0001        	addw	x,#1
 678  02a5 1f14          	ldw	(OFST-3,sp),x
 681  02a7 9c            	rvf
 682  02a8 1e14          	ldw	x,(OFST-3,sp)
 683  02aa a30001        	cpw	x,#1
 684  02ad 2fa0          	jrslt	L342
 685                     ; 266     return failures;
 687  02af 1e16          	ldw	x,(OFST-1,sp)
 688  02b1 cd0000        	call	c_itolx
 692  02b4 5b17          	addw	sp,#23
 693  02b6 81            	ret
 731                     ; 278 static void testCallback (POINTER cb_data)
 731                     ; 279 {
 732                     .text:	section	.text,new
 733  0000               L71_testCallback:
 737                     ; 281     if (atomMutexGet(&mutex1, 0) == ATOM_ERR_CONTEXT)
 739  0000 ae0000        	ldw	x,#0
 740  0003 89            	pushw	x
 741  0004 ae0000        	ldw	x,#0
 742  0007 89            	pushw	x
 743  0008 ae00a0        	ldw	x,#L3_mutex1
 744  000b cd0000        	call	_atomMutexGet
 746  000e 5b04          	addw	sp,#4
 747  0010 a1c8          	cp	a,#200
 748  0012 2606          	jrne	L503
 749                     ; 284         g_result = 1;
 751  0014 ae0001        	ldw	x,#1
 752  0017 cf0002        	ldw	L31_g_result,x
 754  001a               L503:
 755                     ; 291 }
 758  001a 81            	ret
 802                     ; 303 static void test_thread_func (uint32_t param)
 802                     ; 304 {
 803                     .text:	section	.text,new
 804  0000               L12_test_thread_func:
 806  0000 88            	push	a
 807       00000001      OFST:	set	1
 810                     ; 308     param = param;
 812  0001 96            	ldw	x,sp
 813  0002 1c0004        	addw	x,#OFST+3
 814  0005 cd0000        	call	c_ltor
 816                     ; 314     status = atomMutexGet(&mutex2, 0);
 818  0008 ae0000        	ldw	x,#0
 819  000b 89            	pushw	x
 820  000c ae0000        	ldw	x,#0
 821  000f 89            	pushw	x
 822  0010 ae009b        	ldw	x,#L5_mutex2
 823  0013 cd0000        	call	_atomMutexGet
 825  0016 5b04          	addw	sp,#4
 826  0018 6b01          	ld	(OFST+0,sp),a
 827                     ; 315     if (status != ATOM_OK)
 829  001a 0d01          	tnz	(OFST+0,sp)
 830  001c 270c          	jreq	L523
 831                     ; 317         ATOMLOG (_STR("Mutex get (%d)\n"), status);
 833  001e 7b01          	ld	a,(OFST+0,sp)
 834  0020 88            	push	a
 835  0021 ae0000        	ldw	x,#L723
 836  0024 cd0000        	call	_printf
 838  0027 84            	pop	a
 840  0028 2006          	jra	L333
 841  002a               L523:
 842                     ; 322         g_owned = 1;
 844  002a ae0001        	ldw	x,#1
 845  002d cf0000        	ldw	L51_g_owned,x
 846  0030               L333:
 847                     ; 328         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 849  0030 ae0064        	ldw	x,#100
 850  0033 89            	pushw	x
 851  0034 ae0000        	ldw	x,#0
 852  0037 89            	pushw	x
 853  0038 cd0000        	call	_atomTimerDelay
 855  003b 5b04          	addw	sp,#4
 857  003d 20f1          	jra	L333
1081                     	switch	.bss
1082  0000               L51_g_owned:
1083  0000 0000          	ds.b	2
1084  0002               L31_g_result:
1085  0002 0000          	ds.b	2
1086  0004               L11_test_thread_stack:
1087  0004 000000000000  	ds.b	128
1088  0084               L7_tcb:
1089  0084 000000000000  	ds.b	23
1090  009b               L5_mutex2:
1091  009b 0000000000    	ds.b	5
1092  00a0               L3_mutex1:
1093  00a0 0000000000    	ds.b	5
1094                     	xdef	_test_start
1095                     	xref	_printf
1096                     	xref	_atomMutexPut
1097                     	xref	_atomMutexGet
1098                     	xref	_atomMutexDelete
1099                     	xref	_atomMutexCreate
1100                     	xref	_atomThreadStackCheck
1101                     	xref	_atomThreadCreate
1102                     	xref	_atomTimerDelay
1103                     	xref	_atomTimerRegister
1104                     .const:	section	.text
1105  0000               L723:
1106  0000 4d7574657820  	dc.b	"Mutex get (%d)",10,0
1107  0010               L362:
1108  0010 537461636b55  	dc.b	"StackUse:%d",10,0
1109  001d               L162:
1110  001d 537461636b4f  	dc.b	"StackOverflow %d",10,0
1111  002f               L352:
1112  002f 537461636b43  	dc.b	"StackCheck",10,0
1113  003b               L142:
1114  003b 4572726f7220  	dc.b	"Error deleting mut"
1115  004d 6578320a00    	dc.b	"ex2",10,0
1116  0052               L532:
1117  0052 4572726f7220  	dc.b	"Error deleting mut"
1118  0064 6578310a00    	dc.b	"ex1",10,0
1119  0069               L722:
1120  0069 4572726f7220  	dc.b	"Error tracking ove"
1121  007b 72666c6f770a  	dc.b	"rflow",10,0
1122  0082               L322:
1123  0082 4572726f7220  	dc.b	"Error getting mute"
1124  0094 78310a00      	dc.b	"x1",10,0
1125  0098               L702:
1126  0098 4572726f7220  	dc.b	"Error posting mute"
1127  00aa 780a00        	dc.b	"x",10,0
1128  00ad               L102:
1129  00ad 4572726f7220  	dc.b	"Error taking mutex"
1130  00bf 310a00        	dc.b	"1",10,0
1131  00c2               L571:
1132  00c2 576f756c6462  	dc.b	"Wouldblock err %d",10,0
1133  00d5               L761:
1134  00d5 476574202564  	dc.b	"Get %d",10,0
1135  00dd               L361:
1136  00dd 546872656164  	dc.b	"Thread own fail",10,0
1137  00ee               L751:
1138  00ee 4572726f7220  	dc.b	"Error creating tes"
1139  0100 742074687265  	dc.b	"t thread 1",10,0
1140  010c               L351:
1141  010c 4572726f7220  	dc.b	"Error creating tes"
1142  011e 74206d757465  	dc.b	"t mutex 2",10,0
1143  0129               L541:
1144  0129 4572726f7220  	dc.b	"Error creating tes"
1145  013b 74206d757465  	dc.b	"t mutex 1",10,0
1146  0146               L141:
1147  0146 4d7574657831  	dc.b	"Mutex1 delete fail"
1148  0158 65640a00      	dc.b	"ed",10,0
1149  015c               L531:
1150  015c 436f6e746578  	dc.b	"Context check fail"
1151  016e 65640a00      	dc.b	"ed",10,0
1152  0172               L721:
1153  0172 4572726f7220  	dc.b	"Error registering "
1154  0184 74696d65720a  	dc.b	"timer",10,0
1155  018b               L121:
1156  018b 4572726f7220  	dc.b	"Error creating tes"
1157  019d 74206d757465  	dc.b	"t mutex1",10,0
1158  01a7               L511:
1159  01a7 507574207061  	dc.b	"Put param failed",10,0
1160  01b9               L111:
1161  01b9 476574207061  	dc.b	"Get param failed",10,0
1162                     	xref.b	c_x
1182                     	xref	c_ltor
1183                     	xref	c_itolx
1184                     	xref	c_lzmp
1185                     	xref	c_imul
1186                     	end
