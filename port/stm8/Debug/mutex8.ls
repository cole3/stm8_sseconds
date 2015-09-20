   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  84                     ; 65 uint32_t test_start (void)
  84                     ; 66 {
  86                     .text:	section	.text,new
  87  0000               _test_start:
  89  0000 520c          	subw	sp,#12
  90       0000000c      OFST:	set	12
  93                     ; 71     failures = 0;
  95  0002 5f            	clrw	x
  96  0003 1f09          	ldw	(OFST-3,sp),x
  97                     ; 74     for (i = 0; i < 3; i++)
  99  0005 5f            	clrw	x
 100  0006 1f0b          	ldw	(OFST-1,sp),x
 101  0008               L74:
 102                     ; 76         pass_flag[i] = FALSE;
 104  0008 1e0b          	ldw	x,(OFST-1,sp)
 105  000a 58            	sllw	x
 106  000b 905f          	clrw	y
 107  000d df0000        	ldw	(L11_pass_flag,x),y
 108                     ; 74     for (i = 0; i < 3; i++)
 110  0010 1e0b          	ldw	x,(OFST-1,sp)
 111  0012 1c0001        	addw	x,#1
 112  0015 1f0b          	ldw	(OFST-1,sp),x
 115  0017 9c            	rvf
 116  0018 1e0b          	ldw	x,(OFST-1,sp)
 117  001a a30003        	cpw	x,#3
 118  001d 2fe9          	jrslt	L74
 119                     ; 80     if (atomMutexCreate (&mutex1) != ATOM_OK)
 121  001f ae01cb        	ldw	x,#L3_mutex1
 122  0022 cd0000        	call	_atomMutexCreate
 124  0025 4d            	tnz	a
 125  0026 2711          	jreq	L55
 126                     ; 82         ATOMLOG (_STR("Error creating mutex\n"));
 128  0028 ae00dc        	ldw	x,#L75
 129  002b cd0000        	call	_printf
 131                     ; 83         failures++;
 133  002e 1e09          	ldw	x,(OFST-3,sp)
 134  0030 1c0001        	addw	x,#1
 135  0033 1f09          	ldw	(OFST-3,sp),x
 137  0035 ac4f014f      	jpf	L16
 138  0039               L55:
 139                     ; 89         if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 141  0039 ae0000        	ldw	x,#0
 142  003c 89            	pushw	x
 143  003d ae0000        	ldw	x,#0
 144  0040 89            	pushw	x
 145  0041 ae01cb        	ldw	x,#L3_mutex1
 146  0044 cd0000        	call	_atomMutexGet
 148  0047 5b04          	addw	sp,#4
 149  0049 4d            	tnz	a
 150  004a 270d          	jreq	L36
 151                     ; 91             ATOMLOG (_STR("Error taking mutex\n"));
 153  004c ae00c8        	ldw	x,#L56
 154  004f cd0000        	call	_printf
 156                     ; 92             failures++;
 158  0052 1e09          	ldw	x,(OFST-3,sp)
 159  0054 1c0001        	addw	x,#1
 160  0057 1f09          	ldw	(OFST-3,sp),x
 161  0059               L36:
 162                     ; 96         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 0,
 162                     ; 97                   &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 162                     ; 98                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 164  0059 ae0080        	ldw	x,#128
 165  005c 89            	pushw	x
 166  005d ae0000        	ldw	x,#0
 167  0060 89            	pushw	x
 168  0061 ae0085        	ldw	x,#L7_test_thread_stack+127
 169  0064 89            	pushw	x
 170  0065 ae0000        	ldw	x,#0
 171  0068 89            	pushw	x
 172  0069 ae0000        	ldw	x,#0
 173  006c 89            	pushw	x
 174  006d ae0000        	ldw	x,#L31_test_thread_func
 175  0070 89            	pushw	x
 176  0071 4b10          	push	#16
 177  0073 ae0186        	ldw	x,#L5_tcb
 178  0076 cd0000        	call	_atomThreadCreate
 180  0079 5b0d          	addw	sp,#13
 181  007b 4d            	tnz	a
 182  007c 2711          	jreq	L76
 183                     ; 101             ATOMLOG (_STR("Error creating test thread 1\n"));
 185  007e ae00aa        	ldw	x,#L17
 186  0081 cd0000        	call	_printf
 188                     ; 102             failures++;
 190  0084 1e09          	ldw	x,(OFST-3,sp)
 191  0086 1c0001        	addw	x,#1
 192  0089 1f09          	ldw	(OFST-3,sp),x
 194  008b ac4f014f      	jpf	L16
 195  008f               L76:
 196                     ; 106         else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 1,
 196                     ; 107                   &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 196                     ; 108                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 198  008f ae0080        	ldw	x,#128
 199  0092 89            	pushw	x
 200  0093 ae0000        	ldw	x,#0
 201  0096 89            	pushw	x
 202  0097 ae0105        	ldw	x,#L7_test_thread_stack+255
 203  009a 89            	pushw	x
 204  009b ae0001        	ldw	x,#1
 205  009e 89            	pushw	x
 206  009f ae0000        	ldw	x,#0
 207  00a2 89            	pushw	x
 208  00a3 ae0000        	ldw	x,#L31_test_thread_func
 209  00a6 89            	pushw	x
 210  00a7 4b10          	push	#16
 211  00a9 ae019d        	ldw	x,#L5_tcb+23
 212  00ac cd0000        	call	_atomThreadCreate
 214  00af 5b0d          	addw	sp,#13
 215  00b1 4d            	tnz	a
 216  00b2 2710          	jreq	L57
 217                     ; 111             ATOMLOG (_STR("Error creating test thread 2\n"));
 219  00b4 ae008c        	ldw	x,#L77
 220  00b7 cd0000        	call	_printf
 222                     ; 112             failures++;
 224  00ba 1e09          	ldw	x,(OFST-3,sp)
 225  00bc 1c0001        	addw	x,#1
 226  00bf 1f09          	ldw	(OFST-3,sp),x
 228  00c1 cc014f        	jra	L16
 229  00c4               L57:
 230                     ; 116         else if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 2,
 230                     ; 117                   &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 230                     ; 118                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 232  00c4 ae0080        	ldw	x,#128
 233  00c7 89            	pushw	x
 234  00c8 ae0000        	ldw	x,#0
 235  00cb 89            	pushw	x
 236  00cc ae0185        	ldw	x,#L7_test_thread_stack+383
 237  00cf 89            	pushw	x
 238  00d0 ae0002        	ldw	x,#2
 239  00d3 89            	pushw	x
 240  00d4 ae0000        	ldw	x,#0
 241  00d7 89            	pushw	x
 242  00d8 ae0000        	ldw	x,#L31_test_thread_func
 243  00db 89            	pushw	x
 244  00dc 4b10          	push	#16
 245  00de ae01b4        	ldw	x,#L5_tcb+46
 246  00e1 cd0000        	call	_atomThreadCreate
 248  00e4 5b0d          	addw	sp,#13
 249  00e6 4d            	tnz	a
 250  00e7 270f          	jreq	L301
 251                     ; 121             ATOMLOG (_STR("Error creating test thread 3\n"));
 253  00e9 ae006e        	ldw	x,#L501
 254  00ec cd0000        	call	_printf
 256                     ; 122             failures++;
 258  00ef 1e09          	ldw	x,(OFST-3,sp)
 259  00f1 1c0001        	addw	x,#1
 260  00f4 1f09          	ldw	(OFST-3,sp),x
 262  00f6 2057          	jra	L16
 263  00f8               L301:
 264                     ; 129             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 266  00f8 ae0019        	ldw	x,#25
 267  00fb 89            	pushw	x
 268  00fc ae0000        	ldw	x,#0
 269  00ff 89            	pushw	x
 270  0100 cd0000        	call	_atomTimerDelay
 272  0103 5b04          	addw	sp,#4
 273                     ; 132             if (atomMutexDelete (&mutex1) != ATOM_OK)
 275  0105 ae01cb        	ldw	x,#L3_mutex1
 276  0108 cd0000        	call	_atomMutexDelete
 278  010b 4d            	tnz	a
 279  010c 270f          	jreq	L111
 280                     ; 134                 ATOMLOG (_STR("Delete fail\n"));
 282  010e ae0061        	ldw	x,#L311
 283  0111 cd0000        	call	_printf
 285                     ; 135                 failures++;
 287  0114 1e09          	ldw	x,(OFST-3,sp)
 288  0116 1c0001        	addw	x,#1
 289  0119 1f09          	ldw	(OFST-3,sp),x
 291  011b 2032          	jra	L16
 292  011d               L111:
 293                     ; 140                 atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 295  011d ae0019        	ldw	x,#25
 296  0120 89            	pushw	x
 297  0121 ae0000        	ldw	x,#0
 298  0124 89            	pushw	x
 299  0125 cd0000        	call	_atomTimerDelay
 301  0128 5b04          	addw	sp,#4
 302                     ; 143                 if ((pass_flag[0] != TRUE) || (pass_flag[1] != TRUE) || (pass_flag[2] != TRUE))
 304  012a ce0000        	ldw	x,L11_pass_flag
 305  012d a30001        	cpw	x,#1
 306  0130 2610          	jrne	L121
 308  0132 ce0002        	ldw	x,L11_pass_flag+2
 309  0135 a30001        	cpw	x,#1
 310  0138 2608          	jrne	L121
 312  013a ce0004        	ldw	x,L11_pass_flag+4
 313  013d a30001        	cpw	x,#1
 314  0140 270d          	jreq	L16
 315  0142               L121:
 316                     ; 145                     ATOMLOG (_STR("Thread fail\n"));
 318  0142 ae0054        	ldw	x,#L521
 319  0145 cd0000        	call	_printf
 321                     ; 146                     failures++;
 323  0148 1e09          	ldw	x,(OFST-3,sp)
 324  014a 1c0001        	addw	x,#1
 325  014d 1f09          	ldw	(OFST-3,sp),x
 326  014f               L16:
 327                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 329  014f 5f            	clrw	x
 330  0150 1f0b          	ldw	(OFST-1,sp),x
 331  0152               L721:
 332                     ; 162             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 334  0152 96            	ldw	x,sp
 335  0153 1c0005        	addw	x,#OFST-7
 336  0156 89            	pushw	x
 337  0157 96            	ldw	x,sp
 338  0158 1c0003        	addw	x,#OFST-9
 339  015b 89            	pushw	x
 340  015c 1e0f          	ldw	x,(OFST+3,sp)
 341  015e 90ae0017      	ldw	y,#23
 342  0162 cd0000        	call	c_imul
 344  0165 1c0186        	addw	x,#L5_tcb
 345  0168 cd0000        	call	_atomThreadStackCheck
 347  016b 5b04          	addw	sp,#4
 348  016d 4d            	tnz	a
 349  016e 270f          	jreq	L531
 350                     ; 164                 ATOMLOG (_STR("StackCheck\n"));
 352  0170 ae0048        	ldw	x,#L731
 353  0173 cd0000        	call	_printf
 355                     ; 165                 failures++;
 357  0176 1e09          	ldw	x,(OFST-3,sp)
 358  0178 1c0001        	addw	x,#1
 359  017b 1f09          	ldw	(OFST-3,sp),x
 361  017d 2024          	jra	L141
 362  017f               L531:
 363                     ; 170                 if (free_bytes == 0)
 365  017f 96            	ldw	x,sp
 366  0180 1c0005        	addw	x,#OFST-7
 367  0183 cd0000        	call	c_lzmp
 369  0186 2611          	jrne	L341
 370                     ; 172                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 372  0188 1e0b          	ldw	x,(OFST-1,sp)
 373  018a 89            	pushw	x
 374  018b ae0036        	ldw	x,#L541
 375  018e cd0000        	call	_printf
 377  0191 85            	popw	x
 378                     ; 173                     failures++;
 380  0192 1e09          	ldw	x,(OFST-3,sp)
 381  0194 1c0001        	addw	x,#1
 382  0197 1f09          	ldw	(OFST-3,sp),x
 383  0199               L341:
 384                     ; 178                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 386  0199 1e03          	ldw	x,(OFST-9,sp)
 387  019b 89            	pushw	x
 388  019c ae0029        	ldw	x,#L741
 389  019f cd0000        	call	_printf
 391  01a2 85            	popw	x
 392  01a3               L141:
 393                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 395  01a3 1e0b          	ldw	x,(OFST-1,sp)
 396  01a5 1c0001        	addw	x,#1
 397  01a8 1f0b          	ldw	(OFST-1,sp),x
 400  01aa 9c            	rvf
 401  01ab 1e0b          	ldw	x,(OFST-1,sp)
 402  01ad a30003        	cpw	x,#3
 403  01b0 2fa0          	jrslt	L721
 404                     ; 186     return failures;
 406  01b2 1e09          	ldw	x,(OFST-3,sp)
 407  01b4 cd0000        	call	c_itolx
 411  01b7 5b0c          	addw	sp,#12
 412  01b9 81            	ret
 463                     ; 199 static void test_thread_func (uint32_t param)
 463                     ; 200 {
 464                     .text:	section	.text,new
 465  0000               L31_test_thread_func:
 467  0000 5203          	subw	sp,#3
 468       00000003      OFST:	set	3
 471                     ; 205     thread_id = (int)param;
 473  0002 1e08          	ldw	x,(OFST+5,sp)
 474  0004 1f01          	ldw	(OFST-2,sp),x
 475                     ; 211     status = atomMutexGet(&mutex1, (5 * SYSTEM_TICKS_PER_SEC));
 477  0006 ae01f4        	ldw	x,#500
 478  0009 89            	pushw	x
 479  000a ae0000        	ldw	x,#0
 480  000d 89            	pushw	x
 481  000e ae01cb        	ldw	x,#L3_mutex1
 482  0011 cd0000        	call	_atomMutexGet
 484  0014 5b04          	addw	sp,#4
 485  0016 6b03          	ld	(OFST+0,sp),a
 486                     ; 212     if (status != ATOM_ERR_DELETED)
 488  0018 7b03          	ld	a,(OFST+0,sp)
 489  001a a1ca          	cp	a,#202
 490  001c 270c          	jreq	L171
 491                     ; 214         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 493  001e 7b03          	ld	a,(OFST+0,sp)
 494  0020 88            	push	a
 495  0021 ae0000        	ldw	x,#L371
 496  0024 cd0000        	call	_printf
 498  0027 84            	pop	a
 500  0028 200a          	jra	L771
 501  002a               L171:
 502                     ; 219         pass_flag[thread_id] = TRUE;
 504  002a 1e01          	ldw	x,(OFST-2,sp)
 505  002c 58            	sllw	x
 506  002d 90ae0001      	ldw	y,#1
 507  0031 df0000        	ldw	(L11_pass_flag,x),y
 508  0034               L771:
 509                     ; 225         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 511  0034 ae0064        	ldw	x,#100
 512  0037 89            	pushw	x
 513  0038 ae0000        	ldw	x,#0
 514  003b 89            	pushw	x
 515  003c cd0000        	call	_atomTimerDelay
 517  003f 5b04          	addw	sp,#4
 519  0041 20f1          	jra	L771
 772                     	switch	.bss
 773  0000               L11_pass_flag:
 774  0000 000000000000  	ds.b	6
 775  0006               L7_test_thread_stack:
 776  0006 000000000000  	ds.b	384
 777  0186               L5_tcb:
 778  0186 000000000000  	ds.b	69
 779  01cb               L3_mutex1:
 780  01cb 0000000000    	ds.b	5
 781                     	xdef	_test_start
 782                     	xref	_printf
 783                     	xref	_atomMutexGet
 784                     	xref	_atomMutexDelete
 785                     	xref	_atomMutexCreate
 786                     	xref	_atomThreadStackCheck
 787                     	xref	_atomThreadCreate
 788                     	xref	_atomTimerDelay
 789                     .const:	section	.text
 790  0000               L371:
 791  0000 546573743120  	dc.b	"Test1 thread woke "
 792  0012 776974686f75  	dc.b	"without deletion ("
 793  0024 2564290a00    	dc.b	"%d)",10,0
 794  0029               L741:
 795  0029 537461636b55  	dc.b	"StackUse:%d",10,0
 796  0036               L541:
 797  0036 537461636b4f  	dc.b	"StackOverflow %d",10,0
 798  0048               L731:
 799  0048 537461636b43  	dc.b	"StackCheck",10,0
 800  0054               L521:
 801  0054 546872656164  	dc.b	"Thread fail",10,0
 802  0061               L311:
 803  0061 44656c657465  	dc.b	"Delete fail",10,0
 804  006e               L501:
 805  006e 4572726f7220  	dc.b	"Error creating tes"
 806  0080 742074687265  	dc.b	"t thread 3",10,0
 807  008c               L77:
 808  008c 4572726f7220  	dc.b	"Error creating tes"
 809  009e 742074687265  	dc.b	"t thread 2",10,0
 810  00aa               L17:
 811  00aa 4572726f7220  	dc.b	"Error creating tes"
 812  00bc 742074687265  	dc.b	"t thread 1",10,0
 813  00c8               L56:
 814  00c8 4572726f7220  	dc.b	"Error taking mutex"
 815  00da 0a00          	dc.b	10,0
 816  00dc               L75:
 817  00dc 4572726f7220  	dc.b	"Error creating mut"
 818  00ee 65780a00      	dc.b	"ex",10,0
 819                     	xref.b	c_x
 839                     	xref	c_itolx
 840                     	xref	c_lzmp
 841                     	xref	c_imul
 842                     	end
