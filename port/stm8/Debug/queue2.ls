   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  77                     ; 76 uint32_t test_start (void)
  77                     ; 77 {
  79                     .text:	section	.text,new
  80  0000               _test_start:
  82  0000 520c          	subw	sp,#12
  83       0000000c      OFST:	set	12
  86                     ; 81     failures = 0;
  88  0002 5f            	clrw	x
  89  0003 1f0b          	ldw	(OFST-1,sp),x
  90                     ; 84     g_result = 0;
  92  0005 5f            	clrw	x
  93  0006 cf0000        	ldw	L31_g_result,x
  94                     ; 85     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
  96  0009 ae0010        	ldw	x,#16
  97  000c 89            	pushw	x
  98  000d ae0000        	ldw	x,#0
  99  0010 89            	pushw	x
 100  0011 ae0001        	ldw	x,#1
 101  0014 89            	pushw	x
 102  0015 ae0000        	ldw	x,#0
 103  0018 89            	pushw	x
 104  0019 ae0130        	ldw	x,#L5_queue1_storage
 105  001c 89            	pushw	x
 106  001d ae0140        	ldw	x,#L3_queue1
 107  0020 cd0000        	call	_atomQueueCreate
 109  0023 5b0a          	addw	sp,#10
 110  0025 4d            	tnz	a
 111  0026 2710          	jreq	L15
 112                     ; 87         ATOMLOG (_STR("Error creating test queue\n"));
 114  0028 ae00f0        	ldw	x,#L35
 115  002b cd0000        	call	_printf
 117                     ; 88         failures++;
 119  002e 1e0b          	ldw	x,(OFST-1,sp)
 120  0030 1c0001        	addw	x,#1
 121  0033 1f0b          	ldw	(OFST-1,sp),x
 123  0035 cc00c2        	jra	L55
 124  0038               L15:
 125                     ; 92     else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test1_thread_func, 0,
 125                     ; 93               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 125                     ; 94               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 127  0038 ae0080        	ldw	x,#128
 128  003b 89            	pushw	x
 129  003c ae0000        	ldw	x,#0
 130  003f 89            	pushw	x
 131  0040 ae0081        	ldw	x,#L11_test_thread_stack+127
 132  0043 89            	pushw	x
 133  0044 ae0000        	ldw	x,#0
 134  0047 89            	pushw	x
 135  0048 ae0000        	ldw	x,#0
 136  004b 89            	pushw	x
 137  004c ae0000        	ldw	x,#L51_test1_thread_func
 138  004f 89            	pushw	x
 139  0050 4b10          	push	#16
 140  0052 ae0102        	ldw	x,#L7_tcb
 141  0055 cd0000        	call	_atomThreadCreate
 143  0058 5b0d          	addw	sp,#13
 144  005a 4d            	tnz	a
 145  005b 270f          	jreq	L75
 146                     ; 97         ATOMLOG (_STR("Error creating test thread 1\n"));
 148  005d ae00d2        	ldw	x,#L16
 149  0060 cd0000        	call	_printf
 151                     ; 98         failures++;
 153  0063 1e0b          	ldw	x,(OFST-1,sp)
 154  0065 1c0001        	addw	x,#1
 155  0068 1f0b          	ldw	(OFST-1,sp),x
 157  006a 2056          	jra	L55
 158  006c               L75:
 159                     ; 110         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 161  006c ae0064        	ldw	x,#100
 162  006f 89            	pushw	x
 163  0070 ae0000        	ldw	x,#0
 164  0073 89            	pushw	x
 165  0074 cd0000        	call	_atomTimerDelay
 167  0077 5b04          	addw	sp,#4
 168  0079 4d            	tnz	a
 169  007a 270f          	jreq	L56
 170                     ; 112             ATOMLOG (_STR("Failed timer delay\n"));
 172  007c ae00be        	ldw	x,#L76
 173  007f cd0000        	call	_printf
 175                     ; 113             failures++;
 177  0082 1e0b          	ldw	x,(OFST-1,sp)
 178  0084 1c0001        	addw	x,#1
 179  0087 1f0b          	ldw	(OFST-1,sp),x
 181  0089 2037          	jra	L55
 182  008b               L56:
 183                     ; 118             if (atomQueueDelete(&queue1) != ATOM_OK)
 185  008b ae0140        	ldw	x,#L3_queue1
 186  008e cd0000        	call	_atomQueueDelete
 188  0091 4d            	tnz	a
 189  0092 270f          	jreq	L37
 190                     ; 120                 ATOMLOG (_STR("Failed queue1 delete\n"));
 192  0094 ae00a8        	ldw	x,#L57
 193  0097 cd0000        	call	_printf
 195                     ; 121                 failures++;
 197  009a 1e0b          	ldw	x,(OFST-1,sp)
 198  009c 1c0001        	addw	x,#1
 199  009f 1f0b          	ldw	(OFST-1,sp),x
 201  00a1 201f          	jra	L55
 202  00a3               L37:
 203                     ; 126                 atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 205  00a3 ae0064        	ldw	x,#100
 206  00a6 89            	pushw	x
 207  00a7 ae0000        	ldw	x,#0
 208  00aa 89            	pushw	x
 209  00ab cd0000        	call	_atomTimerDelay
 211  00ae 5b04          	addw	sp,#4
 212                     ; 127                 if (g_result == 0)
 214  00b0 ce0000        	ldw	x,L31_g_result
 215  00b3 260d          	jrne	L55
 216                     ; 129                     ATOMLOG (_STR("Notify fail\n"));
 218  00b5 ae009b        	ldw	x,#L301
 219  00b8 cd0000        	call	_printf
 221                     ; 130                     failures++;
 223  00bb 1e0b          	ldw	x,(OFST-1,sp)
 224  00bd 1c0001        	addw	x,#1
 225  00c0 1f0b          	ldw	(OFST-1,sp),x
 227  00c2               L55:
 228                     ; 141     g_result = 0;
 230  00c2 5f            	clrw	x
 231  00c3 cf0000        	ldw	L31_g_result,x
 232                     ; 142     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 234  00c6 ae0010        	ldw	x,#16
 235  00c9 89            	pushw	x
 236  00ca ae0000        	ldw	x,#0
 237  00cd 89            	pushw	x
 238  00ce ae0001        	ldw	x,#1
 239  00d1 89            	pushw	x
 240  00d2 ae0000        	ldw	x,#0
 241  00d5 89            	pushw	x
 242  00d6 ae0130        	ldw	x,#L5_queue1_storage
 243  00d9 89            	pushw	x
 244  00da ae0140        	ldw	x,#L3_queue1
 245  00dd cd0000        	call	_atomQueueCreate
 247  00e0 5b0a          	addw	sp,#10
 248  00e2 4d            	tnz	a
 249  00e3 2710          	jreq	L701
 250                     ; 144         ATOMLOG (_STR("Error creating test queue\n"));
 252  00e5 ae00f0        	ldw	x,#L35
 253  00e8 cd0000        	call	_printf
 255                     ; 145         failures++;
 257  00eb 1e0b          	ldw	x,(OFST-1,sp)
 258  00ed 1c0001        	addw	x,#1
 259  00f0 1f0b          	ldw	(OFST-1,sp),x
 261  00f2 cc017f        	jra	L111
 262  00f5               L701:
 263                     ; 149     else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test2_thread_func, 0,
 263                     ; 150               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 263                     ; 151               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 265  00f5 ae0080        	ldw	x,#128
 266  00f8 89            	pushw	x
 267  00f9 ae0000        	ldw	x,#0
 268  00fc 89            	pushw	x
 269  00fd ae0101        	ldw	x,#L11_test_thread_stack+255
 270  0100 89            	pushw	x
 271  0101 ae0000        	ldw	x,#0
 272  0104 89            	pushw	x
 273  0105 ae0000        	ldw	x,#0
 274  0108 89            	pushw	x
 275  0109 ae0000        	ldw	x,#L71_test2_thread_func
 276  010c 89            	pushw	x
 277  010d 4b10          	push	#16
 278  010f ae0119        	ldw	x,#L7_tcb+23
 279  0112 cd0000        	call	_atomThreadCreate
 281  0115 5b0d          	addw	sp,#13
 282  0117 4d            	tnz	a
 283  0118 270f          	jreq	L311
 284                     ; 154         ATOMLOG (_STR("Error creating test thread 2\n"));
 286  011a ae007d        	ldw	x,#L511
 287  011d cd0000        	call	_printf
 289                     ; 155         failures++;
 291  0120 1e0b          	ldw	x,(OFST-1,sp)
 292  0122 1c0001        	addw	x,#1
 293  0125 1f0b          	ldw	(OFST-1,sp),x
 295  0127 2056          	jra	L111
 296  0129               L311:
 297                     ; 167         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 299  0129 ae0064        	ldw	x,#100
 300  012c 89            	pushw	x
 301  012d ae0000        	ldw	x,#0
 302  0130 89            	pushw	x
 303  0131 cd0000        	call	_atomTimerDelay
 305  0134 5b04          	addw	sp,#4
 306  0136 4d            	tnz	a
 307  0137 270f          	jreq	L121
 308                     ; 169             ATOMLOG (_STR("Failed timer delay\n"));
 310  0139 ae00be        	ldw	x,#L76
 311  013c cd0000        	call	_printf
 313                     ; 170             failures++;
 315  013f 1e0b          	ldw	x,(OFST-1,sp)
 316  0141 1c0001        	addw	x,#1
 317  0144 1f0b          	ldw	(OFST-1,sp),x
 319  0146 2037          	jra	L111
 320  0148               L121:
 321                     ; 175             if (atomQueueDelete(&queue1) != ATOM_OK)
 323  0148 ae0140        	ldw	x,#L3_queue1
 324  014b cd0000        	call	_atomQueueDelete
 326  014e 4d            	tnz	a
 327  014f 270f          	jreq	L521
 328                     ; 177                 ATOMLOG (_STR("Failed queue1 delete\n"));
 330  0151 ae00a8        	ldw	x,#L57
 331  0154 cd0000        	call	_printf
 333                     ; 178                 failures++;
 335  0157 1e0b          	ldw	x,(OFST-1,sp)
 336  0159 1c0001        	addw	x,#1
 337  015c 1f0b          	ldw	(OFST-1,sp),x
 339  015e 201f          	jra	L111
 340  0160               L521:
 341                     ; 183                 atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 343  0160 ae0064        	ldw	x,#100
 344  0163 89            	pushw	x
 345  0164 ae0000        	ldw	x,#0
 346  0167 89            	pushw	x
 347  0168 cd0000        	call	_atomTimerDelay
 349  016b 5b04          	addw	sp,#4
 350                     ; 184                 if (g_result == 0)
 352  016d ce0000        	ldw	x,L31_g_result
 353  0170 260d          	jrne	L111
 354                     ; 186                     ATOMLOG (_STR("Notify fail\n"));
 356  0172 ae009b        	ldw	x,#L301
 357  0175 cd0000        	call	_printf
 359                     ; 187                     failures++;
 361  0178 1e0b          	ldw	x,(OFST-1,sp)
 362  017a 1c0001        	addw	x,#1
 363  017d 1f0b          	ldw	(OFST-1,sp),x
 365  017f               L111:
 366                     ; 204         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 368  017f 5f            	clrw	x
 369  0180 1f09          	ldw	(OFST-3,sp),x
 370  0182               L531:
 371                     ; 207             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 373  0182 96            	ldw	x,sp
 374  0183 1c0005        	addw	x,#OFST-7
 375  0186 89            	pushw	x
 376  0187 96            	ldw	x,sp
 377  0188 1c0003        	addw	x,#OFST-9
 378  018b 89            	pushw	x
 379  018c 1e0d          	ldw	x,(OFST+1,sp)
 380  018e 90ae0017      	ldw	y,#23
 381  0192 cd0000        	call	c_imul
 383  0195 1c0102        	addw	x,#L7_tcb
 384  0198 cd0000        	call	_atomThreadStackCheck
 386  019b 5b04          	addw	sp,#4
 387  019d 4d            	tnz	a
 388  019e 270f          	jreq	L341
 389                     ; 209                 ATOMLOG (_STR("StackCheck\n"));
 391  01a0 ae0071        	ldw	x,#L541
 392  01a3 cd0000        	call	_printf
 394                     ; 210                 failures++;
 396  01a6 1e0b          	ldw	x,(OFST-1,sp)
 397  01a8 1c0001        	addw	x,#1
 398  01ab 1f0b          	ldw	(OFST-1,sp),x
 400  01ad 2024          	jra	L741
 401  01af               L341:
 402                     ; 215                 if (free_bytes == 0)
 404  01af 96            	ldw	x,sp
 405  01b0 1c0005        	addw	x,#OFST-7
 406  01b3 cd0000        	call	c_lzmp
 408  01b6 2611          	jrne	L151
 409                     ; 217                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 411  01b8 1e09          	ldw	x,(OFST-3,sp)
 412  01ba 89            	pushw	x
 413  01bb ae005f        	ldw	x,#L351
 414  01be cd0000        	call	_printf
 416  01c1 85            	popw	x
 417                     ; 218                     failures++;
 419  01c2 1e0b          	ldw	x,(OFST-1,sp)
 420  01c4 1c0001        	addw	x,#1
 421  01c7 1f0b          	ldw	(OFST-1,sp),x
 422  01c9               L151:
 423                     ; 223                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 425  01c9 1e03          	ldw	x,(OFST-9,sp)
 426  01cb 89            	pushw	x
 427  01cc ae0052        	ldw	x,#L551
 428  01cf cd0000        	call	_printf
 430  01d2 85            	popw	x
 431  01d3               L741:
 432                     ; 204         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 434  01d3 1e09          	ldw	x,(OFST-3,sp)
 435  01d5 1c0001        	addw	x,#1
 436  01d8 1f09          	ldw	(OFST-3,sp),x
 439  01da 9c            	rvf
 440  01db 1e09          	ldw	x,(OFST-3,sp)
 441  01dd a30002        	cpw	x,#2
 442  01e0 2fa0          	jrslt	L531
 443                     ; 231     return failures;
 445  01e2 1e0b          	ldw	x,(OFST-1,sp)
 446  01e4 cd0000        	call	c_itolx
 450  01e7 5b0c          	addw	sp,#12
 451  01e9 81            	ret
 502                     ; 244 static void test1_thread_func (uint32_t param)
 502                     ; 245 {
 503                     .text:	section	.text,new
 504  0000               L51_test1_thread_func:
 506  0000 89            	pushw	x
 507       00000002      OFST:	set	2
 510                     ; 249     param = param;
 512  0001 96            	ldw	x,sp
 513  0002 1c0005        	addw	x,#OFST+3
 514  0005 cd0000        	call	c_ltor
 516                     ; 255     status = atomQueueGet(&queue1, 0, &msg);
 518  0008 96            	ldw	x,sp
 519  0009 1c0001        	addw	x,#OFST-1
 520  000c 89            	pushw	x
 521  000d ae0000        	ldw	x,#0
 522  0010 89            	pushw	x
 523  0011 ae0000        	ldw	x,#0
 524  0014 89            	pushw	x
 525  0015 ae0140        	ldw	x,#L3_queue1
 526  0018 cd0000        	call	_atomQueueGet
 528  001b 5b06          	addw	sp,#6
 529  001d 6b02          	ld	(OFST+0,sp),a
 530                     ; 256     if (status != ATOM_ERR_DELETED)
 532  001f 7b02          	ld	a,(OFST+0,sp)
 533  0021 a1ca          	cp	a,#202
 534  0023 270c          	jreq	L771
 535                     ; 258         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 537  0025 7b02          	ld	a,(OFST+0,sp)
 538  0027 88            	push	a
 539  0028 ae0029        	ldw	x,#L102
 540  002b cd0000        	call	_printf
 542  002e 84            	pop	a
 544  002f 2006          	jra	L502
 545  0031               L771:
 546                     ; 263         g_result = 1;
 548  0031 ae0001        	ldw	x,#1
 549  0034 cf0000        	ldw	L31_g_result,x
 550  0037               L502:
 551                     ; 269         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 553  0037 ae0064        	ldw	x,#100
 554  003a 89            	pushw	x
 555  003b ae0000        	ldw	x,#0
 556  003e 89            	pushw	x
 557  003f cd0000        	call	_atomTimerDelay
 559  0042 5b04          	addw	sp,#4
 561  0044 20f1          	jra	L502
 612                     ; 283 static void test2_thread_func (uint32_t param)
 612                     ; 284 {
 613                     .text:	section	.text,new
 614  0000               L71_test2_thread_func:
 616  0000 89            	pushw	x
 617       00000002      OFST:	set	2
 620                     ; 288     param = param;
 622  0001 96            	ldw	x,sp
 623  0002 1c0005        	addw	x,#OFST+3
 624  0005 cd0000        	call	c_ltor
 626                     ; 294     status = atomQueueGet(&queue1, (5 * SYSTEM_TICKS_PER_SEC), &msg);
 628  0008 96            	ldw	x,sp
 629  0009 1c0001        	addw	x,#OFST-1
 630  000c 89            	pushw	x
 631  000d ae01f4        	ldw	x,#500
 632  0010 89            	pushw	x
 633  0011 ae0000        	ldw	x,#0
 634  0014 89            	pushw	x
 635  0015 ae0140        	ldw	x,#L3_queue1
 636  0018 cd0000        	call	_atomQueueGet
 638  001b 5b06          	addw	sp,#6
 639  001d 6b02          	ld	(OFST+0,sp),a
 640                     ; 295     if (status != ATOM_ERR_DELETED)
 642  001f 7b02          	ld	a,(OFST+0,sp)
 643  0021 a1ca          	cp	a,#202
 644  0023 270c          	jreq	L132
 645                     ; 297         ATOMLOG (_STR("Test2 thread woke without deletion (%d)\n"), status);
 647  0025 7b02          	ld	a,(OFST+0,sp)
 648  0027 88            	push	a
 649  0028 ae0000        	ldw	x,#L332
 650  002b cd0000        	call	_printf
 652  002e 84            	pop	a
 654  002f 2006          	jra	L732
 655  0031               L132:
 656                     ; 302         g_result = 1;
 658  0031 ae0001        	ldw	x,#1
 659  0034 cf0000        	ldw	L31_g_result,x
 660  0037               L732:
 661                     ; 308         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 663  0037 ae0064        	ldw	x,#100
 664  003a 89            	pushw	x
 665  003b ae0000        	ldw	x,#0
 666  003e 89            	pushw	x
 667  003f cd0000        	call	_atomTimerDelay
 669  0042 5b04          	addw	sp,#4
 671  0044 20f1          	jra	L732
 971                     	switch	.bss
 972  0000               L31_g_result:
 973  0000 0000          	ds.b	2
 974  0002               L11_test_thread_stack:
 975  0002 000000000000  	ds.b	256
 976  0102               L7_tcb:
 977  0102 000000000000  	ds.b	46
 978  0130               L5_queue1_storage:
 979  0130 000000000000  	ds.b	16
 980  0140               L3_queue1:
 981  0140 000000000000  	ds.b	26
 982                     	xdef	_test_start
 983                     	xref	_printf
 984                     	xref	_atomQueueGet
 985                     	xref	_atomQueueDelete
 986                     	xref	_atomQueueCreate
 987                     	xref	_atomThreadStackCheck
 988                     	xref	_atomThreadCreate
 989                     	xref	_atomTimerDelay
 990                     .const:	section	.text
 991  0000               L332:
 992  0000 546573743220  	dc.b	"Test2 thread woke "
 993  0012 776974686f75  	dc.b	"without deletion ("
 994  0024 2564290a00    	dc.b	"%d)",10,0
 995  0029               L102:
 996  0029 546573743120  	dc.b	"Test1 thread woke "
 997  003b 776974686f75  	dc.b	"without deletion ("
 998  004d 2564290a00    	dc.b	"%d)",10,0
 999  0052               L551:
1000  0052 537461636b55  	dc.b	"StackUse:%d",10,0
1001  005f               L351:
1002  005f 537461636b4f  	dc.b	"StackOverflow %d",10,0
1003  0071               L541:
1004  0071 537461636b43  	dc.b	"StackCheck",10,0
1005  007d               L511:
1006  007d 4572726f7220  	dc.b	"Error creating tes"
1007  008f 742074687265  	dc.b	"t thread 2",10,0
1008  009b               L301:
1009  009b 4e6f74696679  	dc.b	"Notify fail",10,0
1010  00a8               L57:
1011  00a8 4661696c6564  	dc.b	"Failed queue1 dele"
1012  00ba 74650a00      	dc.b	"te",10,0
1013  00be               L76:
1014  00be 4661696c6564  	dc.b	"Failed timer delay"
1015  00d0 0a00          	dc.b	10,0
1016  00d2               L16:
1017  00d2 4572726f7220  	dc.b	"Error creating tes"
1018  00e4 742074687265  	dc.b	"t thread 1",10,0
1019  00f0               L35:
1020  00f0 4572726f7220  	dc.b	"Error creating tes"
1021  0102 742071756575  	dc.b	"t queue",10,0
1022                     	xref.b	c_x
1042                     	xref	c_ltor
1043                     	xref	c_itolx
1044                     	xref	c_lzmp
1045                     	xref	c_imul
1046                     	end
