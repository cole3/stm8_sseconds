   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  80                     ; 85 uint32_t test_start (void)
  80                     ; 86 {
  82                     .text:	section	.text,new
  83  0000               _test_start:
  85  0000 520c          	subw	sp,#12
  86       0000000c      OFST:	set	12
  89                     ; 90     failures = 0;
  91  0002 5f            	clrw	x
  92  0003 1f0b          	ldw	(OFST-1,sp),x
  93                     ; 93     if (atomMutexCreate (&mutex1) != ATOM_OK)
  95  0005 ae0261        	ldw	x,#L3_mutex1
  96  0008 cd0000        	call	_atomMutexCreate
  98  000b 4d            	tnz	a
  99  000c 2711          	jreq	L74
 100                     ; 95         ATOMLOG (_STR("Error creating test mutex 1\n"));
 102  000e ae0097        	ldw	x,#L15
 103  0011 cd0000        	call	_printf
 105                     ; 96         failures++;
 107  0014 1e0b          	ldw	x,(OFST-1,sp)
 108  0016 1c0001        	addw	x,#1
 109  0019 1f0b          	ldw	(OFST-1,sp),x
 111  001b acb301b3      	jpf	L35
 112  001f               L74:
 113                     ; 100     else if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 115  001f ae0000        	ldw	x,#0
 116  0022 89            	pushw	x
 117  0023 ae0000        	ldw	x,#0
 118  0026 89            	pushw	x
 119  0027 ae0261        	ldw	x,#L3_mutex1
 120  002a cd0000        	call	_atomMutexGet
 122  002d 5b04          	addw	sp,#4
 123  002f 4d            	tnz	a
 124  0030 2711          	jreq	L55
 125                     ; 102         ATOMLOG (_STR("Get error\n"));
 127  0032 ae008c        	ldw	x,#L75
 128  0035 cd0000        	call	_printf
 130                     ; 103         failures++;
 132  0038 1e0b          	ldw	x,(OFST-1,sp)
 133  003a 1c0001        	addw	x,#1
 134  003d 1f0b          	ldw	(OFST-1,sp),x
 136  003f acb301b3      	jpf	L35
 137  0043               L55:
 138                     ; 110         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO+1, test_thread_func, 1,
 138                     ; 111               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 138                     ; 112               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 140  0043 ae0080        	ldw	x,#128
 141  0046 89            	pushw	x
 142  0047 ae0000        	ldw	x,#0
 143  004a 89            	pushw	x
 144  004b ae0084        	ldw	x,#L7_test_thread_stack+127
 145  004e 89            	pushw	x
 146  004f ae0001        	ldw	x,#1
 147  0052 89            	pushw	x
 148  0053 ae0000        	ldw	x,#0
 149  0056 89            	pushw	x
 150  0057 ae0000        	ldw	x,#L51_test_thread_func
 151  005a 89            	pushw	x
 152  005b 4b11          	push	#17
 153  005d ae0205        	ldw	x,#L5_tcb
 154  0060 cd0000        	call	_atomThreadCreate
 156  0063 5b0d          	addw	sp,#13
 157  0065 4d            	tnz	a
 158  0066 270d          	jreq	L36
 159                     ; 115             ATOMLOG (_STR("Error creating test thread\n"));
 161  0068 ae0070        	ldw	x,#L56
 162  006b cd0000        	call	_printf
 164                     ; 116             failures++;
 166  006e 1e0b          	ldw	x,(OFST-1,sp)
 167  0070 1c0001        	addw	x,#1
 168  0073 1f0b          	ldw	(OFST-1,sp),x
 169  0075               L36:
 170                     ; 120         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 172  0075 ae0019        	ldw	x,#25
 173  0078 89            	pushw	x
 174  0079 ae0000        	ldw	x,#0
 175  007c 89            	pushw	x
 176  007d cd0000        	call	_atomTimerDelay
 178  0080 5b04          	addw	sp,#4
 179                     ; 123         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO+1, test_thread_func, 2,
 179                     ; 124               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 179                     ; 125               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 181  0082 ae0080        	ldw	x,#128
 182  0085 89            	pushw	x
 183  0086 ae0000        	ldw	x,#0
 184  0089 89            	pushw	x
 185  008a ae0104        	ldw	x,#L7_test_thread_stack+255
 186  008d 89            	pushw	x
 187  008e ae0002        	ldw	x,#2
 188  0091 89            	pushw	x
 189  0092 ae0000        	ldw	x,#0
 190  0095 89            	pushw	x
 191  0096 ae0000        	ldw	x,#L51_test_thread_func
 192  0099 89            	pushw	x
 193  009a 4b11          	push	#17
 194  009c ae021c        	ldw	x,#L5_tcb+23
 195  009f cd0000        	call	_atomThreadCreate
 197  00a2 5b0d          	addw	sp,#13
 198  00a4 4d            	tnz	a
 199  00a5 270d          	jreq	L76
 200                     ; 128             ATOMLOG (_STR("Error creating test thread\n"));
 202  00a7 ae0070        	ldw	x,#L56
 203  00aa cd0000        	call	_printf
 205                     ; 129             failures++;
 207  00ad 1e0b          	ldw	x,(OFST-1,sp)
 208  00af 1c0001        	addw	x,#1
 209  00b2 1f0b          	ldw	(OFST-1,sp),x
 210  00b4               L76:
 211                     ; 133         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 213  00b4 ae0019        	ldw	x,#25
 214  00b7 89            	pushw	x
 215  00b8 ae0000        	ldw	x,#0
 216  00bb 89            	pushw	x
 217  00bc cd0000        	call	_atomTimerDelay
 219  00bf 5b04          	addw	sp,#4
 220                     ; 136         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 220                     ; 137               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 220                     ; 138               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 222  00c1 ae0080        	ldw	x,#128
 223  00c4 89            	pushw	x
 224  00c5 ae0000        	ldw	x,#0
 225  00c8 89            	pushw	x
 226  00c9 ae0184        	ldw	x,#L7_test_thread_stack+383
 227  00cc 89            	pushw	x
 228  00cd ae0003        	ldw	x,#3
 229  00d0 89            	pushw	x
 230  00d1 ae0000        	ldw	x,#0
 231  00d4 89            	pushw	x
 232  00d5 ae0000        	ldw	x,#L51_test_thread_func
 233  00d8 89            	pushw	x
 234  00d9 4b10          	push	#16
 235  00db ae0233        	ldw	x,#L5_tcb+46
 236  00de cd0000        	call	_atomThreadCreate
 238  00e1 5b0d          	addw	sp,#13
 239  00e3 4d            	tnz	a
 240  00e4 270d          	jreq	L17
 241                     ; 141             ATOMLOG (_STR("Error creating test thread\n"));
 243  00e6 ae0070        	ldw	x,#L56
 244  00e9 cd0000        	call	_printf
 246                     ; 142             failures++;
 248  00ec 1e0b          	ldw	x,(OFST-1,sp)
 249  00ee 1c0001        	addw	x,#1
 250  00f1 1f0b          	ldw	(OFST-1,sp),x
 251  00f3               L17:
 252                     ; 146         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 254  00f3 ae0019        	ldw	x,#25
 255  00f6 89            	pushw	x
 256  00f7 ae0000        	ldw	x,#0
 257  00fa 89            	pushw	x
 258  00fb cd0000        	call	_atomTimerDelay
 260  00fe 5b04          	addw	sp,#4
 261                     ; 149         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 261                     ; 150               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 261                     ; 151               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 263  0100 ae0080        	ldw	x,#128
 264  0103 89            	pushw	x
 265  0104 ae0000        	ldw	x,#0
 266  0107 89            	pushw	x
 267  0108 ae0204        	ldw	x,#L7_test_thread_stack+511
 268  010b 89            	pushw	x
 269  010c ae0004        	ldw	x,#4
 270  010f 89            	pushw	x
 271  0110 ae0000        	ldw	x,#0
 272  0113 89            	pushw	x
 273  0114 ae0000        	ldw	x,#L51_test_thread_func
 274  0117 89            	pushw	x
 275  0118 4b10          	push	#16
 276  011a ae024a        	ldw	x,#L5_tcb+69
 277  011d cd0000        	call	_atomThreadCreate
 279  0120 5b0d          	addw	sp,#13
 280  0122 4d            	tnz	a
 281  0123 270d          	jreq	L37
 282                     ; 154             ATOMLOG (_STR("Error creating test thread\n"));
 284  0125 ae0070        	ldw	x,#L56
 285  0128 cd0000        	call	_printf
 287                     ; 155             failures++;
 289  012b 1e0b          	ldw	x,(OFST-1,sp)
 290  012d 1c0001        	addw	x,#1
 291  0130 1f0b          	ldw	(OFST-1,sp),x
 292  0132               L37:
 293                     ; 159         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 295  0132 ae0019        	ldw	x,#25
 296  0135 89            	pushw	x
 297  0136 ae0000        	ldw	x,#0
 298  0139 89            	pushw	x
 299  013a cd0000        	call	_atomTimerDelay
 301  013d 5b04          	addw	sp,#4
 302                     ; 167         wake_cnt = 0;
 304  013f 725f0004      	clr	L11_wake_cnt
 305                     ; 177         if (atomMutexPut (&mutex1) != ATOM_OK)
 307  0143 ae0261        	ldw	x,#L3_mutex1
 308  0146 cd0000        	call	_atomMutexPut
 310  0149 4d            	tnz	a
 311  014a 270d          	jreq	L57
 312                     ; 179             ATOMLOG (_STR("Post fail\n"));
 314  014c ae0065        	ldw	x,#L77
 315  014f cd0000        	call	_printf
 317                     ; 180             failures++;
 319  0152 1e0b          	ldw	x,(OFST-1,sp)
 320  0154 1c0001        	addw	x,#1
 321  0157 1f0b          	ldw	(OFST-1,sp),x
 322  0159               L57:
 323                     ; 184         atomTimerDelay (SYSTEM_TICKS_PER_SEC / 4);
 325  0159 ae0019        	ldw	x,#25
 326  015c 89            	pushw	x
 327  015d ae0000        	ldw	x,#0
 328  0160 89            	pushw	x
 329  0161 cd0000        	call	_atomTimerDelay
 331  0164 5b04          	addw	sp,#4
 332                     ; 187         if ((wake_order[0] != 3) && (wake_order[1] != 4)
 332                     ; 188             && (wake_order[2] != 1) && (wake_order[3] != 2))
 334  0166 c60000        	ld	a,L31_wake_order
 335  0169 a103          	cp	a,#3
 336  016b 2730          	jreq	L101
 338  016d c60001        	ld	a,L31_wake_order+1
 339  0170 a104          	cp	a,#4
 340  0172 2729          	jreq	L101
 342  0174 c60002        	ld	a,L31_wake_order+2
 343  0177 a101          	cp	a,#1
 344  0179 2722          	jreq	L101
 346  017b c60003        	ld	a,L31_wake_order+3
 347  017e a102          	cp	a,#2
 348  0180 271b          	jreq	L101
 349                     ; 190             ATOMLOG (_STR("Bad order %d,%d,%d,%d\n"),
 349                     ; 191                 wake_order[0], wake_order[1], wake_order[2], wake_order[3]);
 351  0182 3b0003        	push	L31_wake_order+3
 352  0185 3b0002        	push	L31_wake_order+2
 353  0188 3b0001        	push	L31_wake_order+1
 354  018b 3b0000        	push	L31_wake_order
 355  018e ae004e        	ldw	x,#L301
 356  0191 cd0000        	call	_printf
 358  0194 5b04          	addw	sp,#4
 359                     ; 192             failures++;
 361  0196 1e0b          	ldw	x,(OFST-1,sp)
 362  0198 1c0001        	addw	x,#1
 363  019b 1f0b          	ldw	(OFST-1,sp),x
 364  019d               L101:
 365                     ; 196         if (atomMutexDelete (&mutex1) != ATOM_OK)
 367  019d ae0261        	ldw	x,#L3_mutex1
 368  01a0 cd0000        	call	_atomMutexDelete
 370  01a3 4d            	tnz	a
 371  01a4 270d          	jreq	L35
 372                     ; 198             ATOMLOG (_STR("Delete failed\n"));
 374  01a6 ae003f        	ldw	x,#L701
 375  01a9 cd0000        	call	_printf
 377                     ; 199             failures++;
 379  01ac 1e0b          	ldw	x,(OFST-1,sp)
 380  01ae 1c0001        	addw	x,#1
 381  01b1 1f0b          	ldw	(OFST-1,sp),x
 382  01b3               L35:
 383                     ; 210         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 385  01b3 5f            	clrw	x
 386  01b4 1f09          	ldw	(OFST-3,sp),x
 387  01b6               L111:
 388                     ; 213             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 390  01b6 96            	ldw	x,sp
 391  01b7 1c0005        	addw	x,#OFST-7
 392  01ba 89            	pushw	x
 393  01bb 96            	ldw	x,sp
 394  01bc 1c0003        	addw	x,#OFST-9
 395  01bf 89            	pushw	x
 396  01c0 1e0d          	ldw	x,(OFST+1,sp)
 397  01c2 90ae0017      	ldw	y,#23
 398  01c6 cd0000        	call	c_imul
 400  01c9 1c0205        	addw	x,#L5_tcb
 401  01cc cd0000        	call	_atomThreadStackCheck
 403  01cf 5b04          	addw	sp,#4
 404  01d1 4d            	tnz	a
 405  01d2 270f          	jreq	L711
 406                     ; 215                 ATOMLOG (_STR("StackCheck\n"));
 408  01d4 ae0033        	ldw	x,#L121
 409  01d7 cd0000        	call	_printf
 411                     ; 216                 failures++;
 413  01da 1e0b          	ldw	x,(OFST-1,sp)
 414  01dc 1c0001        	addw	x,#1
 415  01df 1f0b          	ldw	(OFST-1,sp),x
 417  01e1 2024          	jra	L321
 418  01e3               L711:
 419                     ; 221                 if (free_bytes == 0)
 421  01e3 96            	ldw	x,sp
 422  01e4 1c0005        	addw	x,#OFST-7
 423  01e7 cd0000        	call	c_lzmp
 425  01ea 2611          	jrne	L521
 426                     ; 223                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 428  01ec 1e09          	ldw	x,(OFST-3,sp)
 429  01ee 89            	pushw	x
 430  01ef ae0021        	ldw	x,#L721
 431  01f2 cd0000        	call	_printf
 433  01f5 85            	popw	x
 434                     ; 224                     failures++;
 436  01f6 1e0b          	ldw	x,(OFST-1,sp)
 437  01f8 1c0001        	addw	x,#1
 438  01fb 1f0b          	ldw	(OFST-1,sp),x
 439  01fd               L521:
 440                     ; 229                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 442  01fd 1e03          	ldw	x,(OFST-9,sp)
 443  01ff 89            	pushw	x
 444  0200 ae0014        	ldw	x,#L131
 445  0203 cd0000        	call	_printf
 447  0206 85            	popw	x
 448  0207               L321:
 449                     ; 210         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 451  0207 1e09          	ldw	x,(OFST-3,sp)
 452  0209 1c0001        	addw	x,#1
 453  020c 1f09          	ldw	(OFST-3,sp),x
 456  020e 9c            	rvf
 457  020f 1e09          	ldw	x,(OFST-3,sp)
 458  0211 a30004        	cpw	x,#4
 459  0214 2fa0          	jrslt	L111
 460                     ; 237     return failures;
 462  0216 1e0b          	ldw	x,(OFST-1,sp)
 463  0218 cd0000        	call	c_itolx
 467  021b 5b0c          	addw	sp,#12
 468  021d 81            	ret
 514                     ; 253 static void test_thread_func (uint32_t param)
 514                     ; 254 {
 515                     .text:	section	.text,new
 516  0000               L51_test_thread_func:
 518  0000 88            	push	a
 519       00000001      OFST:	set	1
 522                     ; 258     thread_id = (uint8_t)param;
 524  0001 7b07          	ld	a,(OFST+6,sp)
 525  0003 6b01          	ld	(OFST+0,sp),a
 526                     ; 264     if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 528  0005 ae0000        	ldw	x,#0
 529  0008 89            	pushw	x
 530  0009 ae0000        	ldw	x,#0
 531  000c 89            	pushw	x
 532  000d ae0261        	ldw	x,#L3_mutex1
 533  0010 cd0000        	call	_atomMutexGet
 535  0013 5b04          	addw	sp,#4
 536  0015 4d            	tnz	a
 537  0016 2708          	jreq	L151
 538                     ; 266         ATOMLOG (_STR("Get fail\n"));
 540  0018 ae000a        	ldw	x,#L351
 541  001b cd0000        	call	_printf
 544  001e 201f          	jra	L361
 545  0020               L151:
 546                     ; 276         wake_order[wake_cnt++] = thread_id;
 548  0020 c60004        	ld	a,L11_wake_cnt
 549  0023 97            	ld	xl,a
 550  0024 725c0004      	inc	L11_wake_cnt
 551  0028 9f            	ld	a,xl
 552  0029 5f            	clrw	x
 553  002a 97            	ld	xl,a
 554  002b 7b01          	ld	a,(OFST+0,sp)
 555  002d d70000        	ld	(L31_wake_order,x),a
 556                     ; 279         if (atomMutexPut (&mutex1) != ATOM_OK)
 558  0030 ae0261        	ldw	x,#L3_mutex1
 559  0033 cd0000        	call	_atomMutexPut
 561  0036 4d            	tnz	a
 562  0037 2706          	jreq	L361
 563                     ; 281             ATOMLOG (_STR("Put fail\n"));
 565  0039 ae0000        	ldw	x,#L161
 566  003c cd0000        	call	_printf
 568  003f               L361:
 569                     ; 289         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 571  003f ae0064        	ldw	x,#100
 572  0042 89            	pushw	x
 573  0043 ae0000        	ldw	x,#0
 574  0046 89            	pushw	x
 575  0047 cd0000        	call	_atomTimerDelay
 577  004a 5b04          	addw	sp,#4
 579  004c 20f1          	jra	L361
 841                     	switch	.bss
 842  0000               L31_wake_order:
 843  0000 00000000      	ds.b	4
 844  0004               L11_wake_cnt:
 845  0004 00            	ds.b	1
 846  0005               L7_test_thread_stack:
 847  0005 000000000000  	ds.b	512
 848  0205               L5_tcb:
 849  0205 000000000000  	ds.b	92
 850  0261               L3_mutex1:
 851  0261 0000000000    	ds.b	5
 852                     	xref	_atomMutexPut
 853                     	xref	_atomMutexGet
 854                     	xref	_atomMutexDelete
 855                     	xref	_atomMutexCreate
 856                     	xdef	_test_start
 857                     	xref	_printf
 858                     	xref	_atomThreadStackCheck
 859                     	xref	_atomThreadCreate
 860                     	xref	_atomTimerDelay
 861                     .const:	section	.text
 862  0000               L161:
 863  0000 507574206661  	dc.b	"Put fail",10,0
 864  000a               L351:
 865  000a 476574206661  	dc.b	"Get fail",10,0
 866  0014               L131:
 867  0014 537461636b55  	dc.b	"StackUse:%d",10,0
 868  0021               L721:
 869  0021 537461636b4f  	dc.b	"StackOverflow %d",10,0
 870  0033               L121:
 871  0033 537461636b43  	dc.b	"StackCheck",10,0
 872  003f               L701:
 873  003f 44656c657465  	dc.b	"Delete failed",10,0
 874  004e               L301:
 875  004e 426164206f72  	dc.b	"Bad order %d,%d,%d"
 876  0060 2c25640a00    	dc.b	",%d",10,0
 877  0065               L77:
 878  0065 506f73742066  	dc.b	"Post fail",10,0
 879  0070               L56:
 880  0070 4572726f7220  	dc.b	"Error creating tes"
 881  0082 742074687265  	dc.b	"t thread",10,0
 882  008c               L75:
 883  008c 476574206572  	dc.b	"Get error",10,0
 884  0097               L15:
 885  0097 4572726f7220  	dc.b	"Error creating tes"
 886  00a9 74206d757465  	dc.b	"t mutex 1",10,0
 887                     	xref.b	c_x
 907                     	xref	c_itolx
 908                     	xref	c_lzmp
 909                     	xref	c_imul
 910                     	end
