   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  84                     ; 70 uint32_t test_start (void)
  84                     ; 71 {
  86                     .text:	section	.text,new
  87  0000               _test_start:
  89  0000 520c          	subw	sp,#12
  90       0000000c      OFST:	set	12
  93                     ; 76     failures = 0;
  95  0002 5f            	clrw	x
  96  0003 1f09          	ldw	(OFST-3,sp),x
  97                     ; 79     for (i = 0; i < 3; i++)
  99  0005 5f            	clrw	x
 100  0006 1f0b          	ldw	(OFST-1,sp),x
 101  0008               L15:
 102                     ; 81         pass_flag[i] = FALSE;
 104  0008 1e0b          	ldw	x,(OFST-1,sp)
 105  000a 58            	sllw	x
 106  000b 905f          	clrw	y
 107  000d df0000        	ldw	(L31_pass_flag,x),y
 108                     ; 79     for (i = 0; i < 3; i++)
 110  0010 1e0b          	ldw	x,(OFST-1,sp)
 111  0012 1c0001        	addw	x,#1
 112  0015 1f0b          	ldw	(OFST-1,sp),x
 115  0017 9c            	rvf
 116  0018 1e0b          	ldw	x,(OFST-1,sp)
 117  001a a30003        	cpw	x,#3
 118  001d 2fe9          	jrslt	L15
 119                     ; 85     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(queue1_storage[0]), QUEUE_ENTRIES) != ATOM_OK)
 121  001f ae0008        	ldw	x,#8
 122  0022 89            	pushw	x
 123  0023 ae0000        	ldw	x,#0
 124  0026 89            	pushw	x
 125  0027 ae0001        	ldw	x,#1
 126  002a 89            	pushw	x
 127  002b ae0000        	ldw	x,#0
 128  002e 89            	pushw	x
 129  002f ae01cb        	ldw	x,#L5_queue1_storage
 130  0032 89            	pushw	x
 131  0033 ae01d3        	ldw	x,#L3_queue1
 132  0036 cd0000        	call	_atomQueueCreate
 134  0039 5b0a          	addw	sp,#10
 135  003b 4d            	tnz	a
 136  003c 2711          	jreq	L75
 137                     ; 87         ATOMLOG (_STR("Error creating Q\n"));
 139  003e ae00c8        	ldw	x,#L16
 140  0041 cd0000        	call	_printf
 142                     ; 88         failures++;
 144  0044 1e09          	ldw	x,(OFST-3,sp)
 145  0046 1c0001        	addw	x,#1
 146  0049 1f09          	ldw	(OFST-3,sp),x
 148  004b ac450145      	jpf	L36
 149  004f               L75:
 150                     ; 96         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 0,
 150                     ; 97                   &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 150                     ; 98                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 152  004f ae0080        	ldw	x,#128
 153  0052 89            	pushw	x
 154  0053 ae0000        	ldw	x,#0
 155  0056 89            	pushw	x
 156  0057 ae0085        	ldw	x,#L11_test_thread_stack+127
 157  005a 89            	pushw	x
 158  005b ae0000        	ldw	x,#0
 159  005e 89            	pushw	x
 160  005f ae0000        	ldw	x,#0
 161  0062 89            	pushw	x
 162  0063 ae0000        	ldw	x,#L51_test_thread_func
 163  0066 89            	pushw	x
 164  0067 4b10          	push	#16
 165  0069 ae0186        	ldw	x,#L7_tcb
 166  006c cd0000        	call	_atomThreadCreate
 168  006f 5b0d          	addw	sp,#13
 169  0071 4d            	tnz	a
 170  0072 2711          	jreq	L56
 171                     ; 101             ATOMLOG (_STR("Error creating test thread 1\n"));
 173  0074 ae00aa        	ldw	x,#L76
 174  0077 cd0000        	call	_printf
 176                     ; 102             failures++;
 178  007a 1e09          	ldw	x,(OFST-3,sp)
 179  007c 1c0001        	addw	x,#1
 180  007f 1f09          	ldw	(OFST-3,sp),x
 182  0081 ac450145      	jpf	L36
 183  0085               L56:
 184                     ; 106         else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 1,
 184                     ; 107                   &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 184                     ; 108                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 186  0085 ae0080        	ldw	x,#128
 187  0088 89            	pushw	x
 188  0089 ae0000        	ldw	x,#0
 189  008c 89            	pushw	x
 190  008d ae0105        	ldw	x,#L11_test_thread_stack+255
 191  0090 89            	pushw	x
 192  0091 ae0001        	ldw	x,#1
 193  0094 89            	pushw	x
 194  0095 ae0000        	ldw	x,#0
 195  0098 89            	pushw	x
 196  0099 ae0000        	ldw	x,#L51_test_thread_func
 197  009c 89            	pushw	x
 198  009d 4b10          	push	#16
 199  009f ae019d        	ldw	x,#L7_tcb+23
 200  00a2 cd0000        	call	_atomThreadCreate
 202  00a5 5b0d          	addw	sp,#13
 203  00a7 4d            	tnz	a
 204  00a8 2710          	jreq	L37
 205                     ; 111             ATOMLOG (_STR("Error creating test thread 2\n"));
 207  00aa ae008c        	ldw	x,#L57
 208  00ad cd0000        	call	_printf
 210                     ; 112             failures++;
 212  00b0 1e09          	ldw	x,(OFST-3,sp)
 213  00b2 1c0001        	addw	x,#1
 214  00b5 1f09          	ldw	(OFST-3,sp),x
 216  00b7 cc0145        	jra	L36
 217  00ba               L37:
 218                     ; 116         else if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 2,
 218                     ; 117                   &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 218                     ; 118                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 220  00ba ae0080        	ldw	x,#128
 221  00bd 89            	pushw	x
 222  00be ae0000        	ldw	x,#0
 223  00c1 89            	pushw	x
 224  00c2 ae0185        	ldw	x,#L11_test_thread_stack+383
 225  00c5 89            	pushw	x
 226  00c6 ae0002        	ldw	x,#2
 227  00c9 89            	pushw	x
 228  00ca ae0000        	ldw	x,#0
 229  00cd 89            	pushw	x
 230  00ce ae0000        	ldw	x,#L51_test_thread_func
 231  00d1 89            	pushw	x
 232  00d2 4b10          	push	#16
 233  00d4 ae01b4        	ldw	x,#L7_tcb+46
 234  00d7 cd0000        	call	_atomThreadCreate
 236  00da 5b0d          	addw	sp,#13
 237  00dc 4d            	tnz	a
 238  00dd 270f          	jreq	L101
 239                     ; 121             ATOMLOG (_STR("Error creating test thread 3\n"));
 241  00df ae006e        	ldw	x,#L301
 242  00e2 cd0000        	call	_printf
 244                     ; 122             failures++;
 246  00e5 1e09          	ldw	x,(OFST-3,sp)
 247  00e7 1c0001        	addw	x,#1
 248  00ea 1f09          	ldw	(OFST-3,sp),x
 250  00ec 2057          	jra	L36
 251  00ee               L101:
 252                     ; 129             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 254  00ee ae0019        	ldw	x,#25
 255  00f1 89            	pushw	x
 256  00f2 ae0000        	ldw	x,#0
 257  00f5 89            	pushw	x
 258  00f6 cd0000        	call	_atomTimerDelay
 260  00f9 5b04          	addw	sp,#4
 261                     ; 132             if (atomQueueDelete (&queue1) != ATOM_OK)
 263  00fb ae01d3        	ldw	x,#L3_queue1
 264  00fe cd0000        	call	_atomQueueDelete
 266  0101 4d            	tnz	a
 267  0102 270f          	jreq	L701
 268                     ; 134                 ATOMLOG (_STR("Delete fail\n"));
 270  0104 ae0061        	ldw	x,#L111
 271  0107 cd0000        	call	_printf
 273                     ; 135                 failures++;
 275  010a 1e09          	ldw	x,(OFST-3,sp)
 276  010c 1c0001        	addw	x,#1
 277  010f 1f09          	ldw	(OFST-3,sp),x
 279  0111 2032          	jra	L36
 280  0113               L701:
 281                     ; 140                 atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 283  0113 ae0019        	ldw	x,#25
 284  0116 89            	pushw	x
 285  0117 ae0000        	ldw	x,#0
 286  011a 89            	pushw	x
 287  011b cd0000        	call	_atomTimerDelay
 289  011e 5b04          	addw	sp,#4
 290                     ; 143                 if ((pass_flag[0] != TRUE) || (pass_flag[1] != TRUE) || (pass_flag[2] != TRUE))
 292  0120 ce0000        	ldw	x,L31_pass_flag
 293  0123 a30001        	cpw	x,#1
 294  0126 2610          	jrne	L711
 296  0128 ce0002        	ldw	x,L31_pass_flag+2
 297  012b a30001        	cpw	x,#1
 298  012e 2608          	jrne	L711
 300  0130 ce0004        	ldw	x,L31_pass_flag+4
 301  0133 a30001        	cpw	x,#1
 302  0136 270d          	jreq	L36
 303  0138               L711:
 304                     ; 145                     ATOMLOG (_STR("Thread fail\n"));
 306  0138 ae0054        	ldw	x,#L321
 307  013b cd0000        	call	_printf
 309                     ; 146                     failures++;
 311  013e 1e09          	ldw	x,(OFST-3,sp)
 312  0140 1c0001        	addw	x,#1
 313  0143 1f09          	ldw	(OFST-3,sp),x
 314  0145               L36:
 315                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 317  0145 5f            	clrw	x
 318  0146 1f0b          	ldw	(OFST-1,sp),x
 319  0148               L521:
 320                     ; 162             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 322  0148 96            	ldw	x,sp
 323  0149 1c0005        	addw	x,#OFST-7
 324  014c 89            	pushw	x
 325  014d 96            	ldw	x,sp
 326  014e 1c0003        	addw	x,#OFST-9
 327  0151 89            	pushw	x
 328  0152 1e0f          	ldw	x,(OFST+3,sp)
 329  0154 90ae0017      	ldw	y,#23
 330  0158 cd0000        	call	c_imul
 332  015b 1c0186        	addw	x,#L7_tcb
 333  015e cd0000        	call	_atomThreadStackCheck
 335  0161 5b04          	addw	sp,#4
 336  0163 4d            	tnz	a
 337  0164 270f          	jreq	L331
 338                     ; 164                 ATOMLOG (_STR("StackCheck\n"));
 340  0166 ae0048        	ldw	x,#L531
 341  0169 cd0000        	call	_printf
 343                     ; 165                 failures++;
 345  016c 1e09          	ldw	x,(OFST-3,sp)
 346  016e 1c0001        	addw	x,#1
 347  0171 1f09          	ldw	(OFST-3,sp),x
 349  0173 2024          	jra	L731
 350  0175               L331:
 351                     ; 170                 if (free_bytes == 0)
 353  0175 96            	ldw	x,sp
 354  0176 1c0005        	addw	x,#OFST-7
 355  0179 cd0000        	call	c_lzmp
 357  017c 2611          	jrne	L141
 358                     ; 172                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 360  017e 1e0b          	ldw	x,(OFST-1,sp)
 361  0180 89            	pushw	x
 362  0181 ae0036        	ldw	x,#L341
 363  0184 cd0000        	call	_printf
 365  0187 85            	popw	x
 366                     ; 173                     failures++;
 368  0188 1e09          	ldw	x,(OFST-3,sp)
 369  018a 1c0001        	addw	x,#1
 370  018d 1f09          	ldw	(OFST-3,sp),x
 371  018f               L141:
 372                     ; 178                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 374  018f 1e03          	ldw	x,(OFST-9,sp)
 375  0191 89            	pushw	x
 376  0192 ae0029        	ldw	x,#L541
 377  0195 cd0000        	call	_printf
 379  0198 85            	popw	x
 380  0199               L731:
 381                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 383  0199 1e0b          	ldw	x,(OFST-1,sp)
 384  019b 1c0001        	addw	x,#1
 385  019e 1f0b          	ldw	(OFST-1,sp),x
 388  01a0 9c            	rvf
 389  01a1 1e0b          	ldw	x,(OFST-1,sp)
 390  01a3 a30003        	cpw	x,#3
 391  01a6 2fa0          	jrslt	L521
 392                     ; 186     return failures;
 394  01a8 1e09          	ldw	x,(OFST-3,sp)
 395  01aa cd0000        	call	c_itolx
 399  01ad 5b0c          	addw	sp,#12
 400  01af 81            	ret
 458                     ; 199 static void test_thread_func (uint32_t param)
 458                     ; 200 {
 459                     .text:	section	.text,new
 460  0000               L51_test_thread_func:
 462  0000 5204          	subw	sp,#4
 463       00000004      OFST:	set	4
 466                     ; 206     thread_id = (int)param;
 468  0002 1e09          	ldw	x,(OFST+5,sp)
 469  0004 1f02          	ldw	(OFST-2,sp),x
 470                     ; 212     status = atomQueueGet(&queue1, (5 * SYSTEM_TICKS_PER_SEC), &msg);
 472  0006 96            	ldw	x,sp
 473  0007 1c0001        	addw	x,#OFST-3
 474  000a 89            	pushw	x
 475  000b ae01f4        	ldw	x,#500
 476  000e 89            	pushw	x
 477  000f ae0000        	ldw	x,#0
 478  0012 89            	pushw	x
 479  0013 ae01d3        	ldw	x,#L3_queue1
 480  0016 cd0000        	call	_atomQueueGet
 482  0019 5b06          	addw	sp,#6
 483  001b 6b04          	ld	(OFST+0,sp),a
 484                     ; 213     if (status != ATOM_ERR_DELETED)
 486  001d 7b04          	ld	a,(OFST+0,sp)
 487  001f a1ca          	cp	a,#202
 488  0021 270c          	jreq	L171
 489                     ; 215         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 491  0023 7b04          	ld	a,(OFST+0,sp)
 492  0025 88            	push	a
 493  0026 ae0000        	ldw	x,#L371
 494  0029 cd0000        	call	_printf
 496  002c 84            	pop	a
 498  002d 200a          	jra	L771
 499  002f               L171:
 500                     ; 220         pass_flag[thread_id] = TRUE;
 502  002f 1e02          	ldw	x,(OFST-2,sp)
 503  0031 58            	sllw	x
 504  0032 90ae0001      	ldw	y,#1
 505  0036 df0000        	ldw	(L31_pass_flag,x),y
 506  0039               L771:
 507                     ; 226         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 509  0039 ae0064        	ldw	x,#100
 510  003c 89            	pushw	x
 511  003d ae0000        	ldw	x,#0
 512  0040 89            	pushw	x
 513  0041 cd0000        	call	_atomTimerDelay
 515  0044 5b04          	addw	sp,#4
 517  0046 20f1          	jra	L771
 818                     	switch	.bss
 819  0000               L31_pass_flag:
 820  0000 000000000000  	ds.b	6
 821  0006               L11_test_thread_stack:
 822  0006 000000000000  	ds.b	384
 823  0186               L7_tcb:
 824  0186 000000000000  	ds.b	69
 825  01cb               L5_queue1_storage:
 826  01cb 000000000000  	ds.b	8
 827  01d3               L3_queue1:
 828  01d3 000000000000  	ds.b	26
 829                     	xdef	_test_start
 830                     	xref	_printf
 831                     	xref	_atomQueueGet
 832                     	xref	_atomQueueDelete
 833                     	xref	_atomQueueCreate
 834                     	xref	_atomThreadStackCheck
 835                     	xref	_atomThreadCreate
 836                     	xref	_atomTimerDelay
 837                     .const:	section	.text
 838  0000               L371:
 839  0000 546573743120  	dc.b	"Test1 thread woke "
 840  0012 776974686f75  	dc.b	"without deletion ("
 841  0024 2564290a00    	dc.b	"%d)",10,0
 842  0029               L541:
 843  0029 537461636b55  	dc.b	"StackUse:%d",10,0
 844  0036               L341:
 845  0036 537461636b4f  	dc.b	"StackOverflow %d",10,0
 846  0048               L531:
 847  0048 537461636b43  	dc.b	"StackCheck",10,0
 848  0054               L321:
 849  0054 546872656164  	dc.b	"Thread fail",10,0
 850  0061               L111:
 851  0061 44656c657465  	dc.b	"Delete fail",10,0
 852  006e               L301:
 853  006e 4572726f7220  	dc.b	"Error creating tes"
 854  0080 742074687265  	dc.b	"t thread 3",10,0
 855  008c               L57:
 856  008c 4572726f7220  	dc.b	"Error creating tes"
 857  009e 742074687265  	dc.b	"t thread 2",10,0
 858  00aa               L76:
 859  00aa 4572726f7220  	dc.b	"Error creating tes"
 860  00bc 742074687265  	dc.b	"t thread 1",10,0
 861  00c8               L16:
 862  00c8 4572726f7220  	dc.b	"Error creating Q",10,0
 863                     	xref.b	c_x
 883                     	xref	c_itolx
 884                     	xref	c_lzmp
 885                     	xref	c_imul
 886                     	end
