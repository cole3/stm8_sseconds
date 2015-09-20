   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.data
   5  0000               _test_values:
   6  0000 12345678      	dc.l	305419896
   7  0004 ff000000      	dc.l	-16777216
   8  0008 00ff0000      	dc.l	16711680
   9  000c 0000ff00      	dc.l	65280
  10  0010 000000ff      	dc.l	255
  11  0014 f000000f      	dc.l	-268435441
  12  0018 0f0000f0      	dc.l	251658480
  13  001c 00f00f00      	dc.l	15732480
  14  0020 000ff000      	dc.l	1044480
  15  0024 87654321      	dc.l	-2023406815
  16  0028 abcd0000      	dc.l	-1412628480
  17  002c 0000cdef      	dc.l	52719
 111                     ; 91 uint32_t test_start (void)
 111                     ; 92 {
 113                     .text:	section	.text,new
 114  0000               _test_start:
 116  0000 5212          	subw	sp,#18
 117       00000012      OFST:	set	18
 120                     ; 98     failures = 0;
 122  0002 5f            	clrw	x
 123  0003 1f0f          	ldw	(OFST-3,sp),x
 124                     ; 99     g_result = 0;
 126  0005 5f            	clrw	x
 127  0006 cf0000        	ldw	L31_g_result,x
 128                     ; 102     if (atomQueueCreate (&queue1, (uint8_t *)&queue1_storage[0], sizeof(queue1_storage[0]), QUEUE_ENTRIES) != ATOM_OK)
 130  0009 ae0008        	ldw	x,#8
 131  000c 89            	pushw	x
 132  000d ae0000        	ldw	x,#0
 133  0010 89            	pushw	x
 134  0011 ae0004        	ldw	x,#4
 135  0014 89            	pushw	x
 136  0015 ae0000        	ldw	x,#0
 137  0018 89            	pushw	x
 138  0019 ae0099        	ldw	x,#L5_queue1_storage
 139  001c 89            	pushw	x
 140  001d ae00b9        	ldw	x,#L3_queue1
 141  0020 cd0000        	call	_atomQueueCreate
 143  0023 5b0a          	addw	sp,#10
 144  0025 4d            	tnz	a
 145  0026 270f          	jreq	L55
 146                     ; 104         ATOMLOG (_STR("Error creating test queue\n"));
 148  0028 ae008c        	ldw	x,#L75
 149  002b cd0000        	call	_printf
 151                     ; 105         failures++;
 153  002e 1e0f          	ldw	x,(OFST-3,sp)
 154  0030 1c0001        	addw	x,#1
 155  0033 1f0f          	ldw	(OFST-3,sp),x
 157  0035 2051          	jra	L16
 158  0037               L55:
 159                     ; 109     else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO + 1, test1_thread_func, 0,
 159                     ; 110               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 159                     ; 111               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 161  0037 ae0080        	ldw	x,#128
 162  003a 89            	pushw	x
 163  003b ae0000        	ldw	x,#0
 164  003e 89            	pushw	x
 165  003f ae0081        	ldw	x,#L11_test_thread_stack+127
 166  0042 89            	pushw	x
 167  0043 ae0000        	ldw	x,#0
 168  0046 89            	pushw	x
 169  0047 ae0000        	ldw	x,#0
 170  004a 89            	pushw	x
 171  004b ae0000        	ldw	x,#L51_test1_thread_func
 172  004e 89            	pushw	x
 173  004f 4b11          	push	#17
 174  0051 ae0082        	ldw	x,#L7_tcb
 175  0054 cd0000        	call	_atomThreadCreate
 177  0057 5b0d          	addw	sp,#13
 178  0059 4d            	tnz	a
 179  005a 270f          	jreq	L36
 180                     ; 114         ATOMLOG (_STR("Error creating test thread 1\n"));
 182  005c ae006e        	ldw	x,#L56
 183  005f cd0000        	call	_printf
 185                     ; 115         failures++;
 187  0062 1e0f          	ldw	x,(OFST-3,sp)
 188  0064 1c0001        	addw	x,#1
 189  0067 1f0f          	ldw	(OFST-3,sp),x
 191  0069 201d          	jra	L16
 192  006b               L36:
 193                     ; 127         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 195  006b ae0064        	ldw	x,#100
 196  006e 89            	pushw	x
 197  006f ae0000        	ldw	x,#0
 198  0072 89            	pushw	x
 199  0073 cd0000        	call	_atomTimerDelay
 201  0076 5b04          	addw	sp,#4
 202  0078 4d            	tnz	a
 203  0079 2742          	jreq	L17
 204                     ; 129             ATOMLOG (_STR("Failed timer delay\n"));
 206  007b ae005a        	ldw	x,#L37
 207  007e cd0000        	call	_printf
 209                     ; 130             failures++;
 211  0081 1e0f          	ldw	x,(OFST-3,sp)
 212  0083 1c0001        	addw	x,#1
 213  0086 1f0f          	ldw	(OFST-3,sp),x
 215  0088               L16:
 216                     ; 182         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 218  0088 5f            	clrw	x
 219  0089 1f11          	ldw	(OFST-1,sp),x
 220  008b               L711:
 221                     ; 185             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 223  008b 96            	ldw	x,sp
 224  008c 1c0005        	addw	x,#OFST-13
 225  008f 89            	pushw	x
 226  0090 96            	ldw	x,sp
 227  0091 1c0003        	addw	x,#OFST-15
 228  0094 89            	pushw	x
 229  0095 1e15          	ldw	x,(OFST+3,sp)
 230  0097 90ae0017      	ldw	y,#23
 231  009b cd0000        	call	c_imul
 233  009e 1c0082        	addw	x,#L7_tcb
 234  00a1 cd0000        	call	_atomThreadStackCheck
 236  00a4 5b04          	addw	sp,#4
 237  00a6 4d            	tnz	a
 238  00a7 2603cc013b    	jreq	L521
 239                     ; 187                 ATOMLOG (_STR("StackCheck\n"));
 241  00ac ae0032        	ldw	x,#L721
 242  00af cd0000        	call	_printf
 244                     ; 188                 failures++;
 246  00b2 1e0f          	ldw	x,(OFST-3,sp)
 247  00b4 1c0001        	addw	x,#1
 248  00b7 1f0f          	ldw	(OFST-3,sp),x
 250  00b9 ac5f015f      	jpf	L131
 251  00bd               L17:
 252                     ; 151             num_entries = sizeof(test_values) / sizeof(test_values[0]);
 254  00bd ae000c        	ldw	x,#12
 255  00c0 1f09          	ldw	(OFST-9,sp),x
 256                     ; 152             for (count = 0; count < num_entries; count++)
 258  00c2 5f            	clrw	x
 259  00c3 1f11          	ldw	(OFST-1,sp),x
 261  00c5 2044          	jra	L301
 262  00c7               L77:
 263                     ; 155                 msg = test_values[count];
 265  00c7 1e11          	ldw	x,(OFST-1,sp)
 266  00c9 58            	sllw	x
 267  00ca 58            	sllw	x
 268  00cb d60003        	ld	a,(_test_values+3,x)
 269  00ce 6b0e          	ld	(OFST-4,sp),a
 270  00d0 d60002        	ld	a,(_test_values+2,x)
 271  00d3 6b0d          	ld	(OFST-5,sp),a
 272  00d5 d60001        	ld	a,(_test_values+1,x)
 273  00d8 6b0c          	ld	(OFST-6,sp),a
 274  00da d60000        	ld	a,(_test_values,x)
 275  00dd 6b0b          	ld	(OFST-7,sp),a
 276                     ; 156                 if (atomQueuePut (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 278  00df 96            	ldw	x,sp
 279  00e0 1c000b        	addw	x,#OFST-7
 280  00e3 89            	pushw	x
 281  00e4 ae0000        	ldw	x,#0
 282  00e7 89            	pushw	x
 283  00e8 ae0000        	ldw	x,#0
 284  00eb 89            	pushw	x
 285  00ec ae00b9        	ldw	x,#L3_queue1
 286  00ef cd0000        	call	_atomQueuePut
 288  00f2 5b06          	addw	sp,#6
 289  00f4 4d            	tnz	a
 290  00f5 270d          	jreq	L701
 291                     ; 158                     ATOMLOG (_STR("Failed post\n"));
 293  00f7 ae004d        	ldw	x,#L111
 294  00fa cd0000        	call	_printf
 296                     ; 159                     failures++;
 298  00fd 1e0f          	ldw	x,(OFST-3,sp)
 299  00ff 1c0001        	addw	x,#1
 300  0102 1f0f          	ldw	(OFST-3,sp),x
 301  0104               L701:
 302                     ; 152             for (count = 0; count < num_entries; count++)
 304  0104 1e11          	ldw	x,(OFST-1,sp)
 305  0106 1c0001        	addw	x,#1
 306  0109 1f11          	ldw	(OFST-1,sp),x
 307  010b               L301:
 310  010b 9c            	rvf
 311  010c 1e11          	ldw	x,(OFST-1,sp)
 312  010e 1309          	cpw	x,(OFST-9,sp)
 313  0110 2fb5          	jrslt	L77
 314                     ; 164             atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 316  0112 ae0064        	ldw	x,#100
 317  0115 89            	pushw	x
 318  0116 ae0000        	ldw	x,#0
 319  0119 89            	pushw	x
 320  011a cd0000        	call	_atomTimerDelay
 322  011d 5b04          	addw	sp,#4
 323                     ; 167             if (g_result != 1)
 325  011f ce0000        	ldw	x,L31_g_result
 326  0122 a30001        	cpw	x,#1
 327  0125 2603          	jrne	L6
 328  0127 cc0088        	jp	L16
 329  012a               L6:
 330                     ; 169                 ATOMLOG (_STR("Bad test vals\n"));
 332  012a ae003e        	ldw	x,#L511
 333  012d cd0000        	call	_printf
 335                     ; 170                 failures++;
 337  0130 1e0f          	ldw	x,(OFST-3,sp)
 338  0132 1c0001        	addw	x,#1
 339  0135 1f0f          	ldw	(OFST-3,sp),x
 340  0137 ac880088      	jpf	L16
 341  013b               L521:
 342                     ; 193                 if (free_bytes == 0)
 344  013b 96            	ldw	x,sp
 345  013c 1c0005        	addw	x,#OFST-13
 346  013f cd0000        	call	c_lzmp
 348  0142 2611          	jrne	L331
 349                     ; 195                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 351  0144 1e11          	ldw	x,(OFST-1,sp)
 352  0146 89            	pushw	x
 353  0147 ae0020        	ldw	x,#L531
 354  014a cd0000        	call	_printf
 356  014d 85            	popw	x
 357                     ; 196                     failures++;
 359  014e 1e0f          	ldw	x,(OFST-3,sp)
 360  0150 1c0001        	addw	x,#1
 361  0153 1f0f          	ldw	(OFST-3,sp),x
 362  0155               L331:
 363                     ; 201                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 365  0155 1e03          	ldw	x,(OFST-15,sp)
 366  0157 89            	pushw	x
 367  0158 ae0013        	ldw	x,#L731
 368  015b cd0000        	call	_printf
 370  015e 85            	popw	x
 371  015f               L131:
 372                     ; 182         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 374  015f 1e11          	ldw	x,(OFST-1,sp)
 375  0161 1c0001        	addw	x,#1
 376  0164 1f11          	ldw	(OFST-1,sp),x
 379  0166 9c            	rvf
 380  0167 1e11          	ldw	x,(OFST-1,sp)
 381  0169 a30001        	cpw	x,#1
 382  016c 2e03          	jrsge	L01
 383  016e cc008b        	jp	L711
 384  0171               L01:
 385                     ; 209     return failures;
 387  0171 1e0f          	ldw	x,(OFST-3,sp)
 388  0173 cd0000        	call	c_itolx
 392  0176 5b12          	addw	sp,#18
 393  0178 81            	ret
 459                     ; 222 static void test1_thread_func (uint32_t param)
 459                     ; 223 {
 460                     .text:	section	.text,new
 461  0000               L51_test1_thread_func:
 463  0000 520a          	subw	sp,#10
 464       0000000a      OFST:	set	10
 467                     ; 228     param = param;
 469  0002 96            	ldw	x,sp
 470  0003 1c000d        	addw	x,#OFST+3
 471  0006 cd0000        	call	c_ltor
 473                     ; 231     failures = 0;
 475  0009 5f            	clrw	x
 476  000a 1f07          	ldw	(OFST-3,sp),x
 477                     ; 237     num_entries = sizeof(test_values) / sizeof(test_values[0]);
 479  000c ae000c        	ldw	x,#12
 480  000f 1f01          	ldw	(OFST-9,sp),x
 481                     ; 238     for (count = 0; count < num_entries; count++)
 483  0011 5f            	clrw	x
 484  0012 1f09          	ldw	(OFST-1,sp),x
 486  0014 2052          	jra	L171
 487  0016               L561:
 488                     ; 241         if (atomQueueGet (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 490  0016 96            	ldw	x,sp
 491  0017 1c0003        	addw	x,#OFST-7
 492  001a 89            	pushw	x
 493  001b ae0000        	ldw	x,#0
 494  001e 89            	pushw	x
 495  001f ae0000        	ldw	x,#0
 496  0022 89            	pushw	x
 497  0023 ae00b9        	ldw	x,#L3_queue1
 498  0026 cd0000        	call	_atomQueueGet
 500  0029 5b06          	addw	sp,#6
 501  002b 4d            	tnz	a
 502  002c 270f          	jreq	L571
 503                     ; 243             ATOMLOG (_STR("Failed get\n"));
 505  002e ae0007        	ldw	x,#L771
 506  0031 cd0000        	call	_printf
 508                     ; 244             failures++;
 510  0034 1e07          	ldw	x,(OFST-3,sp)
 511  0036 1c0001        	addw	x,#1
 512  0039 1f07          	ldw	(OFST-3,sp),x
 514  003b 2024          	jra	L102
 515  003d               L571:
 516                     ; 248         else if (msg != test_values[count])
 518  003d 1e09          	ldw	x,(OFST-1,sp)
 519  003f 58            	sllw	x
 520  0040 58            	sllw	x
 521  0041 1c0000        	addw	x,#_test_values
 522  0044 cd0000        	call	c_ltor
 524  0047 96            	ldw	x,sp
 525  0048 1c0003        	addw	x,#OFST-7
 526  004b cd0000        	call	c_lcmp
 528  004e 2711          	jreq	L102
 529                     ; 250             ATOMLOG (_STR("Val%d\n"), count);
 531  0050 1e09          	ldw	x,(OFST-1,sp)
 532  0052 89            	pushw	x
 533  0053 ae0000        	ldw	x,#L502
 534  0056 cd0000        	call	_printf
 536  0059 85            	popw	x
 537                     ; 251             failures++;
 539  005a 1e07          	ldw	x,(OFST-3,sp)
 540  005c 1c0001        	addw	x,#1
 541  005f 1f07          	ldw	(OFST-3,sp),x
 542  0061               L102:
 543                     ; 238     for (count = 0; count < num_entries; count++)
 545  0061 1e09          	ldw	x,(OFST-1,sp)
 546  0063 1c0001        	addw	x,#1
 547  0066 1f09          	ldw	(OFST-1,sp),x
 548  0068               L171:
 551  0068 9c            	rvf
 552  0069 1e09          	ldw	x,(OFST-1,sp)
 553  006b 1301          	cpw	x,(OFST-9,sp)
 554  006d 2fa7          	jrslt	L561
 555                     ; 260     if (failures == 0)
 557  006f 1e07          	ldw	x,(OFST-3,sp)
 558  0071 2606          	jrne	L112
 559                     ; 263         g_result = 1;
 561  0073 ae0001        	ldw	x,#1
 562  0076 cf0000        	ldw	L31_g_result,x
 563  0079               L112:
 564                     ; 269         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 566  0079 ae0064        	ldw	x,#100
 567  007c 89            	pushw	x
 568  007d ae0000        	ldw	x,#0
 569  0080 89            	pushw	x
 570  0081 cd0000        	call	_atomTimerDelay
 572  0084 5b04          	addw	sp,#4
 574  0086 20f1          	jra	L112
 884                     	switch	.bss
 885  0000               L31_g_result:
 886  0000 0000          	ds.b	2
 887                     	xdef	_test_values
 888  0002               L11_test_thread_stack:
 889  0002 000000000000  	ds.b	128
 890  0082               L7_tcb:
 891  0082 000000000000  	ds.b	23
 892  0099               L5_queue1_storage:
 893  0099 000000000000  	ds.b	32
 894  00b9               L3_queue1:
 895  00b9 000000000000  	ds.b	26
 896                     	xdef	_test_start
 897                     	xref	_printf
 898                     	xref	_atomQueuePut
 899                     	xref	_atomQueueGet
 900                     	xref	_atomQueueCreate
 901                     	xref	_atomThreadStackCheck
 902                     	xref	_atomThreadCreate
 903                     	xref	_atomTimerDelay
 904                     .const:	section	.text
 905  0000               L502:
 906  0000 56616c25640a  	dc.b	"Val%d",10,0
 907  0007               L771:
 908  0007 4661696c6564  	dc.b	"Failed get",10,0
 909  0013               L731:
 910  0013 537461636b55  	dc.b	"StackUse:%d",10,0
 911  0020               L531:
 912  0020 537461636b4f  	dc.b	"StackOverflow %d",10,0
 913  0032               L721:
 914  0032 537461636b43  	dc.b	"StackCheck",10,0
 915  003e               L511:
 916  003e 426164207465  	dc.b	"Bad test vals",10,0
 917  004d               L111:
 918  004d 4661696c6564  	dc.b	"Failed post",10,0
 919  005a               L37:
 920  005a 4661696c6564  	dc.b	"Failed timer delay"
 921  006c 0a00          	dc.b	10,0
 922  006e               L56:
 923  006e 4572726f7220  	dc.b	"Error creating tes"
 924  0080 742074687265  	dc.b	"t thread 1",10,0
 925  008c               L75:
 926  008c 4572726f7220  	dc.b	"Error creating tes"
 927  009e 742071756575  	dc.b	"t queue",10,0
 928                     	xref.b	c_x
 948                     	xref	c_lcmp
 949                     	xref	c_ltor
 950                     	xref	c_itolx
 951                     	xref	c_lzmp
 952                     	xref	c_imul
 953                     	end
