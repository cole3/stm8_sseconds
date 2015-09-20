   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  77                     ; 77 uint32_t test_start (void)
  77                     ; 78 {
  79                     .text:	section	.text,new
  80  0000               _test_start:
  82  0000 520c          	subw	sp,#12
  83       0000000c      OFST:	set	12
  86                     ; 82     failures = 0;
  88  0002 5f            	clrw	x
  89  0003 1f0b          	ldw	(OFST-1,sp),x
  90                     ; 85     last_time = 0;
  92  0005 ae0000        	ldw	x,#0
  93  0008 cf0018        	ldw	L7_last_time+2,x
  94  000b ae0000        	ldw	x,#0
  95  000e cf0016        	ldw	L7_last_time,x
  96                     ; 86     last_thread_id = -1;
  98  0011 aeffff        	ldw	x,#65535
  99  0014 cf0014        	ldw	L11_last_thread_id,x
 100                     ; 87     failure_cnt[0] = failure_cnt[1] = failure_cnt[2] = failure_cnt[3] = 0;
 102  0017 ae0000        	ldw	x,#0
 103  001a cf0010        	ldw	L51_failure_cnt+14,x
 104  001d ae0000        	ldw	x,#0
 105  0020 cf000e        	ldw	L51_failure_cnt+12,x
 106  0023 ae0000        	ldw	x,#0
 107  0026 cf000c        	ldw	L51_failure_cnt+10,x
 108  0029 ae0000        	ldw	x,#0
 109  002c cf000a        	ldw	L51_failure_cnt+8,x
 110  002f ae0000        	ldw	x,#0
 111  0032 cf0008        	ldw	L51_failure_cnt+6,x
 112  0035 ae0000        	ldw	x,#0
 113  0038 cf0006        	ldw	L51_failure_cnt+4,x
 114  003b ae0000        	ldw	x,#0
 115  003e cf0004        	ldw	L51_failure_cnt+2,x
 116  0041 ae0000        	ldw	x,#0
 117  0044 cf0002        	ldw	L51_failure_cnt,x
 118                     ; 90     test_started = FALSE;
 120  0047 5f            	clrw	x
 121  0048 cf0000        	ldw	L71_test_started,x
 122                     ; 99     if (atomThreadCreate (&tcb[0], TEST_THREAD_PRIO + 1, test_thread_func, 0,
 122                     ; 100             &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 122                     ; 101             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 124  004b ae0080        	ldw	x,#128
 125  004e 89            	pushw	x
 126  004f ae0000        	ldw	x,#0
 127  0052 89            	pushw	x
 128  0053 ae0099        	ldw	x,#L5_test_thread_stack+127
 129  0056 89            	pushw	x
 130  0057 ae0000        	ldw	x,#0
 131  005a 89            	pushw	x
 132  005b ae0000        	ldw	x,#0
 133  005e 89            	pushw	x
 134  005f ae0000        	ldw	x,#L12_test_thread_func
 135  0062 89            	pushw	x
 136  0063 4b11          	push	#17
 137  0065 ae021a        	ldw	x,#L3_tcb
 138  0068 cd0000        	call	_atomThreadCreate
 140  006b 5b0d          	addw	sp,#13
 141  006d 4d            	tnz	a
 142  006e 2711          	jreq	L35
 143                     ; 103         ATOMLOG (_STR("Bad thread create\n"));
 145  0070 ae0034        	ldw	x,#L55
 146  0073 cd0000        	call	_printf
 148                     ; 104         failures++;
 150  0076 1e0b          	ldw	x,(OFST-1,sp)
 151  0078 1c0001        	addw	x,#1
 152  007b 1f0b          	ldw	(OFST-1,sp),x
 154  007d ac1b011b      	jpf	L75
 155  0081               L35:
 156                     ; 106     else if (atomThreadCreate (&tcb[1], TEST_THREAD_PRIO + 1, test_thread_func, 1,
 156                     ; 107             &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 156                     ; 108             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 158  0081 ae0080        	ldw	x,#128
 159  0084 89            	pushw	x
 160  0085 ae0000        	ldw	x,#0
 161  0088 89            	pushw	x
 162  0089 ae0119        	ldw	x,#L5_test_thread_stack+255
 163  008c 89            	pushw	x
 164  008d ae0001        	ldw	x,#1
 165  0090 89            	pushw	x
 166  0091 ae0000        	ldw	x,#0
 167  0094 89            	pushw	x
 168  0095 ae0000        	ldw	x,#L12_test_thread_func
 169  0098 89            	pushw	x
 170  0099 4b11          	push	#17
 171  009b ae0231        	ldw	x,#L3_tcb+23
 172  009e cd0000        	call	_atomThreadCreate
 174  00a1 5b0d          	addw	sp,#13
 175  00a3 4d            	tnz	a
 176  00a4 270f          	jreq	L16
 177                     ; 110         ATOMLOG (_STR("Bad thread create\n"));
 179  00a6 ae0034        	ldw	x,#L55
 180  00a9 cd0000        	call	_printf
 182                     ; 111         failures++;
 184  00ac 1e0b          	ldw	x,(OFST-1,sp)
 185  00ae 1c0001        	addw	x,#1
 186  00b1 1f0b          	ldw	(OFST-1,sp),x
 188  00b3 2066          	jra	L75
 189  00b5               L16:
 190                     ; 113     else if (atomThreadCreate (&tcb[2], TEST_THREAD_PRIO + 1, test_thread_func, 2,
 190                     ; 114             &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 190                     ; 115             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 192  00b5 ae0080        	ldw	x,#128
 193  00b8 89            	pushw	x
 194  00b9 ae0000        	ldw	x,#0
 195  00bc 89            	pushw	x
 196  00bd ae0199        	ldw	x,#L5_test_thread_stack+383
 197  00c0 89            	pushw	x
 198  00c1 ae0002        	ldw	x,#2
 199  00c4 89            	pushw	x
 200  00c5 ae0000        	ldw	x,#0
 201  00c8 89            	pushw	x
 202  00c9 ae0000        	ldw	x,#L12_test_thread_func
 203  00cc 89            	pushw	x
 204  00cd 4b11          	push	#17
 205  00cf ae0248        	ldw	x,#L3_tcb+46
 206  00d2 cd0000        	call	_atomThreadCreate
 208  00d5 5b0d          	addw	sp,#13
 209  00d7 4d            	tnz	a
 210  00d8 270f          	jreq	L56
 211                     ; 117         ATOMLOG (_STR("Bad thread create\n"));
 213  00da ae0034        	ldw	x,#L55
 214  00dd cd0000        	call	_printf
 216                     ; 118         failures++;
 218  00e0 1e0b          	ldw	x,(OFST-1,sp)
 219  00e2 1c0001        	addw	x,#1
 220  00e5 1f0b          	ldw	(OFST-1,sp),x
 222  00e7 2032          	jra	L75
 223  00e9               L56:
 224                     ; 120     else if (atomThreadCreate (&tcb[3], TEST_THREAD_PRIO + 1, test_thread_func, 3,
 224                     ; 121             &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 224                     ; 122             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 226  00e9 ae0080        	ldw	x,#128
 227  00ec 89            	pushw	x
 228  00ed ae0000        	ldw	x,#0
 229  00f0 89            	pushw	x
 230  00f1 ae0219        	ldw	x,#L5_test_thread_stack+511
 231  00f4 89            	pushw	x
 232  00f5 ae0003        	ldw	x,#3
 233  00f8 89            	pushw	x
 234  00f9 ae0000        	ldw	x,#0
 235  00fc 89            	pushw	x
 236  00fd ae0000        	ldw	x,#L12_test_thread_func
 237  0100 89            	pushw	x
 238  0101 4b11          	push	#17
 239  0103 ae025f        	ldw	x,#L3_tcb+69
 240  0106 cd0000        	call	_atomThreadCreate
 242  0109 5b0d          	addw	sp,#13
 243  010b 4d            	tnz	a
 244  010c 270d          	jreq	L75
 245                     ; 124         ATOMLOG (_STR("Bad thread create\n"));
 247  010e ae0034        	ldw	x,#L55
 248  0111 cd0000        	call	_printf
 250                     ; 125         failures++;
 252  0114 1e0b          	ldw	x,(OFST-1,sp)
 253  0116 1c0001        	addw	x,#1
 254  0119 1f0b          	ldw	(OFST-1,sp),x
 255  011b               L75:
 256                     ; 129     test_started = TRUE;
 258  011b ae0001        	ldw	x,#1
 259  011e cf0000        	ldw	L71_test_started,x
 260                     ; 132     atomTimerDelay (5 * SYSTEM_TICKS_PER_SEC);
 262  0121 ae01f4        	ldw	x,#500
 263  0124 89            	pushw	x
 264  0125 ae0000        	ldw	x,#0
 265  0128 89            	pushw	x
 266  0129 cd0000        	call	_atomTimerDelay
 268  012c 5b04          	addw	sp,#4
 269                     ; 135     test_started = FALSE;
 271  012e 5f            	clrw	x
 272  012f cf0000        	ldw	L71_test_started,x
 273                     ; 138     atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 275  0132 ae0019        	ldw	x,#25
 276  0135 89            	pushw	x
 277  0136 ae0000        	ldw	x,#0
 278  0139 89            	pushw	x
 279  013a cd0000        	call	_atomTimerDelay
 281  013d 5b04          	addw	sp,#4
 282                     ; 141     failures += failure_cnt[0] + failure_cnt[1] + failure_cnt[2] + failure_cnt[3];
 284  013f ce0008        	ldw	x,L51_failure_cnt+6
 285  0142 72bb0004      	addw	x,L51_failure_cnt+2
 286  0146 72bb000c      	addw	x,L51_failure_cnt+10
 287  014a 72bb0010      	addw	x,L51_failure_cnt+14
 288  014e 72fb0b        	addw	x,(OFST-1,sp)
 289  0151 1f0b          	ldw	(OFST-1,sp),x
 290                     ; 150         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 292  0153 5f            	clrw	x
 293  0154 1f09          	ldw	(OFST-3,sp),x
 294  0156               L37:
 295                     ; 153             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 297  0156 96            	ldw	x,sp
 298  0157 1c0005        	addw	x,#OFST-7
 299  015a 89            	pushw	x
 300  015b 96            	ldw	x,sp
 301  015c 1c0003        	addw	x,#OFST-9
 302  015f 89            	pushw	x
 303  0160 1e0d          	ldw	x,(OFST+1,sp)
 304  0162 90ae0017      	ldw	y,#23
 305  0166 cd0000        	call	c_imul
 307  0169 1c021a        	addw	x,#L3_tcb
 308  016c cd0000        	call	_atomThreadStackCheck
 310  016f 5b04          	addw	sp,#4
 311  0171 4d            	tnz	a
 312  0172 270f          	jreq	L101
 313                     ; 155                 ATOMLOG (_STR("StackCheck\n"));
 315  0174 ae0028        	ldw	x,#L301
 316  0177 cd0000        	call	_printf
 318                     ; 156                 failures++;
 320  017a 1e0b          	ldw	x,(OFST-1,sp)
 321  017c 1c0001        	addw	x,#1
 322  017f 1f0b          	ldw	(OFST-1,sp),x
 324  0181 2024          	jra	L501
 325  0183               L101:
 326                     ; 161                 if (free_bytes == 0)
 328  0183 96            	ldw	x,sp
 329  0184 1c0005        	addw	x,#OFST-7
 330  0187 cd0000        	call	c_lzmp
 332  018a 2611          	jrne	L701
 333                     ; 163                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 335  018c 1e09          	ldw	x,(OFST-3,sp)
 336  018e 89            	pushw	x
 337  018f ae0016        	ldw	x,#L111
 338  0192 cd0000        	call	_printf
 340  0195 85            	popw	x
 341                     ; 164                     failures++;
 343  0196 1e0b          	ldw	x,(OFST-1,sp)
 344  0198 1c0001        	addw	x,#1
 345  019b 1f0b          	ldw	(OFST-1,sp),x
 346  019d               L701:
 347                     ; 169                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 349  019d 1e03          	ldw	x,(OFST-9,sp)
 350  019f 89            	pushw	x
 351  01a0 ae0009        	ldw	x,#L311
 352  01a3 cd0000        	call	_printf
 354  01a6 85            	popw	x
 355  01a7               L501:
 356                     ; 150         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 358  01a7 1e09          	ldw	x,(OFST-3,sp)
 359  01a9 1c0001        	addw	x,#1
 360  01ac 1f09          	ldw	(OFST-3,sp),x
 363  01ae 9c            	rvf
 364  01af 1e09          	ldw	x,(OFST-3,sp)
 365  01b1 a30004        	cpw	x,#4
 366  01b4 2fa0          	jrslt	L37
 367                     ; 177     return failures;
 369  01b6 1e0b          	ldw	x,(OFST-1,sp)
 370  01b8 cd0000        	call	c_itolx
 374  01bb 5b0c          	addw	sp,#12
 375  01bd 81            	ret
 456                     .const:	section	.text
 457  0000               L01:
 458  0000 00000001      	dc.l	1
 459                     ; 191 static void test_thread_func (uint32_t param)
 459                     ; 192 {
 460                     .text:	section	.text,new
 461  0000               L12_test_thread_func:
 463  0000 520d          	subw	sp,#13
 464       0000000d      OFST:	set	13
 467                     ; 199     thread_id = (int)param;
 469  0002 1e12          	ldw	x,(OFST+5,sp)
 470  0004 1f0c          	ldw	(OFST-1,sp),x
 471  0006               L541:
 472                     ; 205         if (test_started)
 474  0006 ce0000        	ldw	x,L71_test_started
 475  0009 27fb          	jreq	L541
 476                     ; 213             time_error = thread_error = FALSE;
 478  000b 5f            	clrw	x
 479  000c 1f04          	ldw	(OFST-9,sp),x
 480  000e 5f            	clrw	x
 481  000f 1f02          	ldw	(OFST-11,sp),x
 482                     ; 216             CRITICAL_START();
 484  0011 96            	ldw	x,sp
 485  0012 1c0001        	addw	x,#OFST-12
 487  0015 8a            push CC
 488  0016 84            pop a
 489  0017 f7            ld (X),A
 490  0018 9b            sim
 492                     ; 219             new_time = atomTimeGet();
 494  0019 cd0000        	call	_atomTimeGet
 496  001c 96            	ldw	x,sp
 497  001d 1c0008        	addw	x,#OFST-5
 498  0020 cd0000        	call	c_rtol
 500                     ; 222             if ((last_time != 0) && (last_thread_id != -1))
 502  0023 ae0016        	ldw	x,#L7_last_time
 503  0026 cd0000        	call	c_lzmp
 505  0029 2757          	jreq	L351
 507  002b ce0014        	ldw	x,L11_last_thread_id
 508  002e a3ffff        	cpw	x,#65535
 509  0031 274f          	jreq	L351
 510                     ; 225                 if (new_time != last_time)
 512  0033 96            	ldw	x,sp
 513  0034 1c0008        	addw	x,#OFST-5
 514  0037 cd0000        	call	c_ltor
 516  003a ae0016        	ldw	x,#L7_last_time
 517  003d cd0000        	call	c_lcmp
 519  0040 2740          	jreq	L351
 520                     ; 228                     if ((new_time - last_time) != 1)
 522  0042 96            	ldw	x,sp
 523  0043 1c0008        	addw	x,#OFST-5
 524  0046 cd0000        	call	c_ltor
 526  0049 ae0016        	ldw	x,#L7_last_time
 527  004c cd0000        	call	c_lsub
 529  004f ae0000        	ldw	x,#L01
 530  0052 cd0000        	call	c_lcmp
 532  0055 2705          	jreq	L751
 533                     ; 230                         time_error = 1;
 535  0057 ae0001        	ldw	x,#1
 536  005a 1f02          	ldw	(OFST-11,sp),x
 537  005c               L751:
 538                     ; 237                     expected_thread = thread_id - 1;
 540  005c 1e0c          	ldw	x,(OFST-1,sp)
 541  005e 5a            	decw	x
 542  005f 1f06          	ldw	(OFST-7,sp),x
 543                     ; 238                     if (expected_thread == -1)
 545  0061 1e06          	ldw	x,(OFST-7,sp)
 546  0063 a3ffff        	cpw	x,#65535
 547  0066 2605          	jrne	L161
 548                     ; 240                         expected_thread = 3;
 550  0068 ae0003        	ldw	x,#3
 551  006b 1f06          	ldw	(OFST-7,sp),x
 552  006d               L161:
 553                     ; 244                     if (last_thread_id != expected_thread)
 555  006d ce0014        	ldw	x,L11_last_thread_id
 556  0070 1306          	cpw	x,(OFST-7,sp)
 557  0072 2705          	jreq	L361
 558                     ; 246                         thread_error = TRUE;
 560  0074 ae0001        	ldw	x,#1
 561  0077 1f04          	ldw	(OFST-9,sp),x
 562  0079               L361:
 563                     ; 250                     switch_cnt++;
 565  0079 ce0012        	ldw	x,L31_switch_cnt
 566  007c 1c0001        	addw	x,#1
 567  007f cf0012        	ldw	L31_switch_cnt,x
 568  0082               L351:
 569                     ; 255             last_thread_id = thread_id;
 571  0082 1e0c          	ldw	x,(OFST-1,sp)
 572  0084 cf0014        	ldw	L11_last_thread_id,x
 573                     ; 256             last_time = new_time;
 575  0087 1e0a          	ldw	x,(OFST-3,sp)
 576  0089 cf0018        	ldw	L7_last_time+2,x
 577  008c 1e08          	ldw	x,(OFST-5,sp)
 578  008e cf0016        	ldw	L7_last_time,x
 579                     ; 259             CRITICAL_END();
 581  0091 96            	ldw	x,sp
 582  0092 1c0001        	addw	x,#OFST-12
 584  0095 f6            ld A,(X)
 585  0096 88            push A
 586  0097 86            pop CC
 588                     ; 262             if (test_started && (thread_error || time_error))
 590  0098 ce0000        	ldw	x,L71_test_started
 591  009b 2603          	jrne	L21
 592  009d cc0006        	jp	L541
 593  00a0               L21:
 595  00a0 1e04          	ldw	x,(OFST-9,sp)
 596  00a2 2607          	jrne	L761
 598  00a4 1e02          	ldw	x,(OFST-11,sp)
 599  00a6 2603          	jrne	L41
 600  00a8 cc0006        	jp	L541
 601  00ab               L41:
 602  00ab               L761:
 603                     ; 264                 failure_cnt[thread_id]++;
 605  00ab 1e0c          	ldw	x,(OFST-1,sp)
 606  00ad 58            	sllw	x
 607  00ae 58            	sllw	x
 608  00af 1c0002        	addw	x,#L51_failure_cnt
 609  00b2 a601          	ld	a,#1
 610  00b4 cd0000        	call	c_lgadc
 612                     ; 265                 ATOMLOG(_STR("T%d\n"), thread_id);
 614  00b7 1e0c          	ldw	x,(OFST-1,sp)
 615  00b9 89            	pushw	x
 616  00ba ae0004        	ldw	x,#L171
 617  00bd cd0000        	call	_printf
 619  00c0 85            	popw	x
 620  00c1 ac060006      	jpf	L541
 861                     	switch	.bss
 862  0000               L71_test_started:
 863  0000 0000          	ds.b	2
 864  0002               L51_failure_cnt:
 865  0002 000000000000  	ds.b	16
 866  0012               L31_switch_cnt:
 867  0012 0000          	ds.b	2
 868  0014               L11_last_thread_id:
 869  0014 0000          	ds.b	2
 870  0016               L7_last_time:
 871  0016 00000000      	ds.b	4
 872  001a               L5_test_thread_stack:
 873  001a 000000000000  	ds.b	512
 874  021a               L3_tcb:
 875  021a 000000000000  	ds.b	92
 876                     	xdef	_test_start
 877                     	xref	_printf
 878                     	xref	_atomThreadStackCheck
 879                     	xref	_atomThreadCreate
 880                     	xref	_atomTimeGet
 881                     	xref	_atomTimerDelay
 882                     	switch	.const
 883  0004               L171:
 884  0004 5425640a00    	dc.b	"T%d",10,0
 885  0009               L311:
 886  0009 537461636b55  	dc.b	"StackUse:%d",10,0
 887  0016               L111:
 888  0016 537461636b4f  	dc.b	"StackOverflow %d",10,0
 889  0028               L301:
 890  0028 537461636b43  	dc.b	"StackCheck",10,0
 891  0034               L55:
 892  0034 426164207468  	dc.b	"Bad thread create",10,0
 893                     	xref.b	c_x
 913                     	xref	c_lgadc
 914                     	xref	c_lsub
 915                     	xref	c_lcmp
 916                     	xref	c_ltor
 917                     	xref	c_rtol
 918                     	xref	c_itolx
 919                     	xref	c_lzmp
 920                     	xref	c_imul
 921                     	end
