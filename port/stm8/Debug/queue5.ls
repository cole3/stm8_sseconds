   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  94                     ; 91 uint32_t test_start (void)
  94                     ; 92 {
  96                     .text:	section	.text,new
  97  0000               _test_start:
  99  0000 520d          	subw	sp,#13
 100       0000000d      OFST:	set	13
 103                     ; 97     failures = 0;
 105  0002 5f            	clrw	x
 106  0003 1f0a          	ldw	(OFST-3,sp),x
 107                     ; 100     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 109  0005 ae0008        	ldw	x,#8
 110  0008 89            	pushw	x
 111  0009 ae0000        	ldw	x,#0
 112  000c 89            	pushw	x
 113  000d ae0001        	ldw	x,#1
 114  0010 89            	pushw	x
 115  0011 ae0000        	ldw	x,#0
 116  0014 89            	pushw	x
 117  0015 ae0261        	ldw	x,#L5_queue1_storage
 118  0018 89            	pushw	x
 119  0019 ae0269        	ldw	x,#L3_queue1
 120  001c cd0000        	call	_atomQueueCreate
 122  001f 5b0a          	addw	sp,#10
 123  0021 4d            	tnz	a
 124  0022 2711          	jreq	L55
 125                     ; 102         ATOMLOG (_STR("Error creating test q1\n"));
 127  0024 ae0082        	ldw	x,#L75
 128  0027 cd0000        	call	_printf
 130                     ; 103         failures++;
 132  002a 1e0a          	ldw	x,(OFST-3,sp)
 133  002c 1c0001        	addw	x,#1
 134  002f 1f0a          	ldw	(OFST-3,sp),x
 136  0031 acca01ca      	jpf	L16
 137  0035               L55:
 138                     ; 117         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO+1, test_thread_func, 1,
 138                     ; 118               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 138                     ; 119               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 140  0035 ae0080        	ldw	x,#128
 141  0038 89            	pushw	x
 142  0039 ae0000        	ldw	x,#0
 143  003c 89            	pushw	x
 144  003d ae0084        	ldw	x,#L11_test_thread_stack+127
 145  0040 89            	pushw	x
 146  0041 ae0001        	ldw	x,#1
 147  0044 89            	pushw	x
 148  0045 ae0000        	ldw	x,#0
 149  0048 89            	pushw	x
 150  0049 ae0000        	ldw	x,#L71_test_thread_func
 151  004c 89            	pushw	x
 152  004d 4b11          	push	#17
 153  004f ae0205        	ldw	x,#L7_tcb
 154  0052 cd0000        	call	_atomThreadCreate
 156  0055 5b0d          	addw	sp,#13
 157  0057 4d            	tnz	a
 158  0058 270d          	jreq	L36
 159                     ; 122             ATOMLOG (_STR("Error creating test thread\n"));
 161  005a ae0066        	ldw	x,#L56
 162  005d cd0000        	call	_printf
 164                     ; 123             failures++;
 166  0060 1e0a          	ldw	x,(OFST-3,sp)
 167  0062 1c0001        	addw	x,#1
 168  0065 1f0a          	ldw	(OFST-3,sp),x
 169  0067               L36:
 170                     ; 127         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 172  0067 ae0019        	ldw	x,#25
 173  006a 89            	pushw	x
 174  006b ae0000        	ldw	x,#0
 175  006e 89            	pushw	x
 176  006f cd0000        	call	_atomTimerDelay
 178  0072 5b04          	addw	sp,#4
 179                     ; 130         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO+1, test_thread_func, 2,
 179                     ; 131               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 179                     ; 132               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 181  0074 ae0080        	ldw	x,#128
 182  0077 89            	pushw	x
 183  0078 ae0000        	ldw	x,#0
 184  007b 89            	pushw	x
 185  007c ae0104        	ldw	x,#L11_test_thread_stack+255
 186  007f 89            	pushw	x
 187  0080 ae0002        	ldw	x,#2
 188  0083 89            	pushw	x
 189  0084 ae0000        	ldw	x,#0
 190  0087 89            	pushw	x
 191  0088 ae0000        	ldw	x,#L71_test_thread_func
 192  008b 89            	pushw	x
 193  008c 4b11          	push	#17
 194  008e ae021c        	ldw	x,#L7_tcb+23
 195  0091 cd0000        	call	_atomThreadCreate
 197  0094 5b0d          	addw	sp,#13
 198  0096 4d            	tnz	a
 199  0097 270d          	jreq	L76
 200                     ; 135             ATOMLOG (_STR("Error creating test thread\n"));
 202  0099 ae0066        	ldw	x,#L56
 203  009c cd0000        	call	_printf
 205                     ; 136             failures++;
 207  009f 1e0a          	ldw	x,(OFST-3,sp)
 208  00a1 1c0001        	addw	x,#1
 209  00a4 1f0a          	ldw	(OFST-3,sp),x
 210  00a6               L76:
 211                     ; 140         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 213  00a6 ae0019        	ldw	x,#25
 214  00a9 89            	pushw	x
 215  00aa ae0000        	ldw	x,#0
 216  00ad 89            	pushw	x
 217  00ae cd0000        	call	_atomTimerDelay
 219  00b1 5b04          	addw	sp,#4
 220                     ; 143         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 220                     ; 144               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 220                     ; 145               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 222  00b3 ae0080        	ldw	x,#128
 223  00b6 89            	pushw	x
 224  00b7 ae0000        	ldw	x,#0
 225  00ba 89            	pushw	x
 226  00bb ae0184        	ldw	x,#L11_test_thread_stack+383
 227  00be 89            	pushw	x
 228  00bf ae0003        	ldw	x,#3
 229  00c2 89            	pushw	x
 230  00c3 ae0000        	ldw	x,#0
 231  00c6 89            	pushw	x
 232  00c7 ae0000        	ldw	x,#L71_test_thread_func
 233  00ca 89            	pushw	x
 234  00cb 4b10          	push	#16
 235  00cd ae0233        	ldw	x,#L7_tcb+46
 236  00d0 cd0000        	call	_atomThreadCreate
 238  00d3 5b0d          	addw	sp,#13
 239  00d5 4d            	tnz	a
 240  00d6 270d          	jreq	L17
 241                     ; 148             ATOMLOG (_STR("Error creating test thread\n"));
 243  00d8 ae0066        	ldw	x,#L56
 244  00db cd0000        	call	_printf
 246                     ; 149             failures++;
 248  00de 1e0a          	ldw	x,(OFST-3,sp)
 249  00e0 1c0001        	addw	x,#1
 250  00e3 1f0a          	ldw	(OFST-3,sp),x
 251  00e5               L17:
 252                     ; 153         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 254  00e5 ae0019        	ldw	x,#25
 255  00e8 89            	pushw	x
 256  00e9 ae0000        	ldw	x,#0
 257  00ec 89            	pushw	x
 258  00ed cd0000        	call	_atomTimerDelay
 260  00f0 5b04          	addw	sp,#4
 261                     ; 156         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 261                     ; 157               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 261                     ; 158               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 263  00f2 ae0080        	ldw	x,#128
 264  00f5 89            	pushw	x
 265  00f6 ae0000        	ldw	x,#0
 266  00f9 89            	pushw	x
 267  00fa ae0204        	ldw	x,#L11_test_thread_stack+511
 268  00fd 89            	pushw	x
 269  00fe ae0004        	ldw	x,#4
 270  0101 89            	pushw	x
 271  0102 ae0000        	ldw	x,#0
 272  0105 89            	pushw	x
 273  0106 ae0000        	ldw	x,#L71_test_thread_func
 274  0109 89            	pushw	x
 275  010a 4b10          	push	#16
 276  010c ae024a        	ldw	x,#L7_tcb+69
 277  010f cd0000        	call	_atomThreadCreate
 279  0112 5b0d          	addw	sp,#13
 280  0114 4d            	tnz	a
 281  0115 270d          	jreq	L37
 282                     ; 161             ATOMLOG (_STR("Error creating test thread\n"));
 284  0117 ae0066        	ldw	x,#L56
 285  011a cd0000        	call	_printf
 287                     ; 162             failures++;
 289  011d 1e0a          	ldw	x,(OFST-3,sp)
 290  011f 1c0001        	addw	x,#1
 291  0122 1f0a          	ldw	(OFST-3,sp),x
 292  0124               L37:
 293                     ; 166         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 295  0124 ae0019        	ldw	x,#25
 296  0127 89            	pushw	x
 297  0128 ae0000        	ldw	x,#0
 298  012b 89            	pushw	x
 299  012c cd0000        	call	_atomTimerDelay
 301  012f 5b04          	addw	sp,#4
 302                     ; 174         wake_cnt = 0;
 304  0131 725f0004      	clr	L31_wake_cnt
 305                     ; 177         for (count = 0; count < 4; count++)
 307  0135 5f            	clrw	x
 308  0136 1f0c          	ldw	(OFST-1,sp),x
 309  0138               L57:
 310                     ; 186             msg = 0x66;
 312  0138 a666          	ld	a,#102
 313  013a 6b09          	ld	(OFST-4,sp),a
 314                     ; 187             if (atomQueuePut (&queue1, 0, &msg) != ATOM_OK)
 316  013c 96            	ldw	x,sp
 317  013d 1c0009        	addw	x,#OFST-4
 318  0140 89            	pushw	x
 319  0141 ae0000        	ldw	x,#0
 320  0144 89            	pushw	x
 321  0145 ae0000        	ldw	x,#0
 322  0148 89            	pushw	x
 323  0149 ae0269        	ldw	x,#L3_queue1
 324  014c cd0000        	call	_atomQueuePut
 326  014f 5b06          	addw	sp,#6
 327  0151 4d            	tnz	a
 328  0152 270d          	jreq	L301
 329                     ; 189                 ATOMLOG (_STR("Post fail\n"));
 331  0154 ae005b        	ldw	x,#L501
 332  0157 cd0000        	call	_printf
 334                     ; 190                 failures++;
 336  015a 1e0a          	ldw	x,(OFST-3,sp)
 337  015c 1c0001        	addw	x,#1
 338  015f 1f0a          	ldw	(OFST-3,sp),x
 339  0161               L301:
 340                     ; 199             atomTimerDelay (SYSTEM_TICKS_PER_SEC / 4);
 342  0161 ae0019        	ldw	x,#25
 343  0164 89            	pushw	x
 344  0165 ae0000        	ldw	x,#0
 345  0168 89            	pushw	x
 346  0169 cd0000        	call	_atomTimerDelay
 348  016c 5b04          	addw	sp,#4
 349                     ; 177         for (count = 0; count < 4; count++)
 351  016e 1e0c          	ldw	x,(OFST-1,sp)
 352  0170 1c0001        	addw	x,#1
 353  0173 1f0c          	ldw	(OFST-1,sp),x
 356  0175 9c            	rvf
 357  0176 1e0c          	ldw	x,(OFST-1,sp)
 358  0178 a30004        	cpw	x,#4
 359  017b 2fbb          	jrslt	L57
 360                     ; 204         if ((wake_order[0] != 3) && (wake_order[1] != 4)
 360                     ; 205             && (wake_order[2] != 1) && (wake_order[3] != 2))
 362  017d c60000        	ld	a,L51_wake_order
 363  0180 a103          	cp	a,#3
 364  0182 2730          	jreq	L701
 366  0184 c60001        	ld	a,L51_wake_order+1
 367  0187 a104          	cp	a,#4
 368  0189 2729          	jreq	L701
 370  018b c60002        	ld	a,L51_wake_order+2
 371  018e a101          	cp	a,#1
 372  0190 2722          	jreq	L701
 374  0192 c60003        	ld	a,L51_wake_order+3
 375  0195 a102          	cp	a,#2
 376  0197 271b          	jreq	L701
 377                     ; 207             ATOMLOG (_STR("Bad order %d,%d,%d,%d\n"),
 377                     ; 208                 wake_order[0], wake_order[1], wake_order[2], wake_order[3]);
 379  0199 3b0003        	push	L51_wake_order+3
 380  019c 3b0002        	push	L51_wake_order+2
 381  019f 3b0001        	push	L51_wake_order+1
 382  01a2 3b0000        	push	L51_wake_order
 383  01a5 ae0044        	ldw	x,#L111
 384  01a8 cd0000        	call	_printf
 386  01ab 5b04          	addw	sp,#4
 387                     ; 209             failures++;
 389  01ad 1e0a          	ldw	x,(OFST-3,sp)
 390  01af 1c0001        	addw	x,#1
 391  01b2 1f0a          	ldw	(OFST-3,sp),x
 392  01b4               L701:
 393                     ; 213         if (atomQueueDelete (&queue1) != ATOM_OK)
 395  01b4 ae0269        	ldw	x,#L3_queue1
 396  01b7 cd0000        	call	_atomQueueDelete
 398  01ba 4d            	tnz	a
 399  01bb 270d          	jreq	L16
 400                     ; 215             ATOMLOG (_STR("Delete failed\n"));
 402  01bd ae0035        	ldw	x,#L511
 403  01c0 cd0000        	call	_printf
 405                     ; 216             failures++;
 407  01c3 1e0a          	ldw	x,(OFST-3,sp)
 408  01c5 1c0001        	addw	x,#1
 409  01c8 1f0a          	ldw	(OFST-3,sp),x
 410  01ca               L16:
 411                     ; 227         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 413  01ca 5f            	clrw	x
 414  01cb 1f0c          	ldw	(OFST-1,sp),x
 415  01cd               L711:
 416                     ; 230             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 418  01cd 96            	ldw	x,sp
 419  01ce 1c0005        	addw	x,#OFST-8
 420  01d1 89            	pushw	x
 421  01d2 96            	ldw	x,sp
 422  01d3 1c0003        	addw	x,#OFST-10
 423  01d6 89            	pushw	x
 424  01d7 1e10          	ldw	x,(OFST+3,sp)
 425  01d9 90ae0017      	ldw	y,#23
 426  01dd cd0000        	call	c_imul
 428  01e0 1c0205        	addw	x,#L7_tcb
 429  01e3 cd0000        	call	_atomThreadStackCheck
 431  01e6 5b04          	addw	sp,#4
 432  01e8 4d            	tnz	a
 433  01e9 270f          	jreq	L521
 434                     ; 232                 ATOMLOG (_STR("StackCheck\n"));
 436  01eb ae0029        	ldw	x,#L721
 437  01ee cd0000        	call	_printf
 439                     ; 233                 failures++;
 441  01f1 1e0a          	ldw	x,(OFST-3,sp)
 442  01f3 1c0001        	addw	x,#1
 443  01f6 1f0a          	ldw	(OFST-3,sp),x
 445  01f8 2024          	jra	L131
 446  01fa               L521:
 447                     ; 238                 if (free_bytes == 0)
 449  01fa 96            	ldw	x,sp
 450  01fb 1c0005        	addw	x,#OFST-8
 451  01fe cd0000        	call	c_lzmp
 453  0201 2611          	jrne	L331
 454                     ; 240                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 456  0203 1e0c          	ldw	x,(OFST-1,sp)
 457  0205 89            	pushw	x
 458  0206 ae0017        	ldw	x,#L531
 459  0209 cd0000        	call	_printf
 461  020c 85            	popw	x
 462                     ; 241                     failures++;
 464  020d 1e0a          	ldw	x,(OFST-3,sp)
 465  020f 1c0001        	addw	x,#1
 466  0212 1f0a          	ldw	(OFST-3,sp),x
 467  0214               L331:
 468                     ; 246                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 470  0214 1e03          	ldw	x,(OFST-10,sp)
 471  0216 89            	pushw	x
 472  0217 ae000a        	ldw	x,#L731
 473  021a cd0000        	call	_printf
 475  021d 85            	popw	x
 476  021e               L131:
 477                     ; 227         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 479  021e 1e0c          	ldw	x,(OFST-1,sp)
 480  0220 1c0001        	addw	x,#1
 481  0223 1f0c          	ldw	(OFST-1,sp),x
 484  0225 9c            	rvf
 485  0226 1e0c          	ldw	x,(OFST-1,sp)
 486  0228 a30004        	cpw	x,#4
 487  022b 2fa0          	jrslt	L711
 488                     ; 254     return failures;
 490  022d 1e0a          	ldw	x,(OFST-3,sp)
 491  022f cd0000        	call	c_itolx
 495  0232 5b0d          	addw	sp,#13
 496  0234 81            	ret
 548                     ; 270 static void test_thread_func (uint32_t param)
 548                     ; 271 {
 549                     .text:	section	.text,new
 550  0000               L71_test_thread_func:
 552  0000 89            	pushw	x
 553       00000002      OFST:	set	2
 556                     ; 276     thread_id = (uint8_t)param;
 558  0001 7b08          	ld	a,(OFST+6,sp)
 559  0003 6b02          	ld	(OFST+0,sp),a
 560                     ; 282     if (atomQueueGet (&queue1, 0, &msg) != ATOM_OK)
 562  0005 96            	ldw	x,sp
 563  0006 1c0001        	addw	x,#OFST-1
 564  0009 89            	pushw	x
 565  000a ae0000        	ldw	x,#0
 566  000d 89            	pushw	x
 567  000e ae0000        	ldw	x,#0
 568  0011 89            	pushw	x
 569  0012 ae0269        	ldw	x,#L3_queue1
 570  0015 cd0000        	call	_atomQueueGet
 572  0018 5b06          	addw	sp,#6
 573  001a 4d            	tnz	a
 574  001b 2708          	jreq	L161
 575                     ; 284         ATOMLOG (_STR("Get fail\n"));
 577  001d ae0000        	ldw	x,#L361
 578  0020 cd0000        	call	_printf
 581  0023 2010          	jra	L761
 582  0025               L161:
 583                     ; 296         wake_order[wake_cnt++] = thread_id;
 585  0025 c60004        	ld	a,L31_wake_cnt
 586  0028 97            	ld	xl,a
 587  0029 725c0004      	inc	L31_wake_cnt
 588  002d 9f            	ld	a,xl
 589  002e 5f            	clrw	x
 590  002f 97            	ld	xl,a
 591  0030 7b02          	ld	a,(OFST+0,sp)
 592  0032 d70000        	ld	(L51_wake_order,x),a
 593  0035               L761:
 594                     ; 303         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 596  0035 ae0064        	ldw	x,#100
 597  0038 89            	pushw	x
 598  0039 ae0000        	ldw	x,#0
 599  003c 89            	pushw	x
 600  003d cd0000        	call	_atomTimerDelay
 602  0040 5b04          	addw	sp,#4
 604  0042 20f1          	jra	L761
 914                     	switch	.bss
 915  0000               L51_wake_order:
 916  0000 00000000      	ds.b	4
 917  0004               L31_wake_cnt:
 918  0004 00            	ds.b	1
 919  0005               L11_test_thread_stack:
 920  0005 000000000000  	ds.b	512
 921  0205               L7_tcb:
 922  0205 000000000000  	ds.b	92
 923  0261               L5_queue1_storage:
 924  0261 000000000000  	ds.b	8
 925  0269               L3_queue1:
 926  0269 000000000000  	ds.b	26
 927                     	xref	_atomQueuePut
 928                     	xref	_atomQueueGet
 929                     	xref	_atomQueueDelete
 930                     	xref	_atomQueueCreate
 931                     	xdef	_test_start
 932                     	xref	_printf
 933                     	xref	_atomThreadStackCheck
 934                     	xref	_atomThreadCreate
 935                     	xref	_atomTimerDelay
 936                     .const:	section	.text
 937  0000               L361:
 938  0000 476574206661  	dc.b	"Get fail",10,0
 939  000a               L731:
 940  000a 537461636b55  	dc.b	"StackUse:%d",10,0
 941  0017               L531:
 942  0017 537461636b4f  	dc.b	"StackOverflow %d",10,0
 943  0029               L721:
 944  0029 537461636b43  	dc.b	"StackCheck",10,0
 945  0035               L511:
 946  0035 44656c657465  	dc.b	"Delete failed",10,0
 947  0044               L111:
 948  0044 426164206f72  	dc.b	"Bad order %d,%d,%d"
 949  0056 2c25640a00    	dc.b	",%d",10,0
 950  005b               L501:
 951  005b 506f73742066  	dc.b	"Post fail",10,0
 952  0066               L56:
 953  0066 4572726f7220  	dc.b	"Error creating tes"
 954  0078 742074687265  	dc.b	"t thread",10,0
 955  0082               L75:
 956  0082 4572726f7220  	dc.b	"Error creating tes"
 957  0094 742071310a00  	dc.b	"t q1",10,0
 958                     	xref.b	c_x
 978                     	xref	c_itolx
 979                     	xref	c_lzmp
 980                     	xref	c_imul
 981                     	end
