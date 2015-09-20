   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  73                     ; 66 uint32_t test_start (void)
  73                     ; 67 {
  75                     .text:	section	.text,new
  76  0000               _test_start:
  78  0000 520c          	subw	sp,#12
  79       0000000c      OFST:	set	12
  82                     ; 71     failures = 0;
  84  0002 5f            	clrw	x
  85  0003 1f0b          	ldw	(OFST-1,sp),x
  86                     ; 72     g_failure_cnt[0] = g_failure_cnt[1] = g_failure_cnt[2] = 0;
  88  0005 5f            	clrw	x
  89  0006 cf0004        	ldw	L7_g_failure_cnt+4,x
  90  0009 5f            	clrw	x
  91  000a cf0002        	ldw	L7_g_failure_cnt+2,x
  92  000d 5f            	clrw	x
  93  000e cf0000        	ldw	L7_g_failure_cnt,x
  94                     ; 75     if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
  94                     ; 76           &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
  94                     ; 77           TEST_THREAD_STACK_SIZE) != ATOM_OK)
  96  0011 ae0080        	ldw	x,#128
  97  0014 89            	pushw	x
  98  0015 ae0000        	ldw	x,#0
  99  0018 89            	pushw	x
 100  0019 ae0085        	ldw	x,#L5_test_thread_stack+127
 101  001c 89            	pushw	x
 102  001d ae0001        	ldw	x,#1
 103  0020 89            	pushw	x
 104  0021 ae0000        	ldw	x,#0
 105  0024 89            	pushw	x
 106  0025 ae0000        	ldw	x,#L11_test_thread_func
 107  0028 89            	pushw	x
 108  0029 4b10          	push	#16
 109  002b ae0186        	ldw	x,#L3_tcb
 110  002e cd0000        	call	_atomThreadCreate
 112  0031 5b0d          	addw	sp,#13
 113  0033 4d            	tnz	a
 114  0034 270d          	jreq	L34
 115                     ; 80         ATOMLOG (_STR("Thread1\n"));
 117  0036 ae0045        	ldw	x,#L54
 118  0039 cd0000        	call	_printf
 120                     ; 81         failures++;
 122  003c 1e0b          	ldw	x,(OFST-1,sp)
 123  003e 1c0001        	addw	x,#1
 124  0041 1f0b          	ldw	(OFST-1,sp),x
 125  0043               L34:
 126                     ; 85     if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 2,
 126                     ; 86           &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 126                     ; 87           TEST_THREAD_STACK_SIZE) != ATOM_OK)
 128  0043 ae0080        	ldw	x,#128
 129  0046 89            	pushw	x
 130  0047 ae0000        	ldw	x,#0
 131  004a 89            	pushw	x
 132  004b ae0105        	ldw	x,#L5_test_thread_stack+255
 133  004e 89            	pushw	x
 134  004f ae0002        	ldw	x,#2
 135  0052 89            	pushw	x
 136  0053 ae0000        	ldw	x,#0
 137  0056 89            	pushw	x
 138  0057 ae0000        	ldw	x,#L11_test_thread_func
 139  005a 89            	pushw	x
 140  005b 4b10          	push	#16
 141  005d ae019d        	ldw	x,#L3_tcb+23
 142  0060 cd0000        	call	_atomThreadCreate
 144  0063 5b0d          	addw	sp,#13
 145  0065 4d            	tnz	a
 146  0066 270d          	jreq	L74
 147                     ; 90         ATOMLOG (_STR("Thread2\n"));
 149  0068 ae003c        	ldw	x,#L15
 150  006b cd0000        	call	_printf
 152                     ; 91         failures++;
 154  006e 1e0b          	ldw	x,(OFST-1,sp)
 155  0070 1c0001        	addw	x,#1
 156  0073 1f0b          	ldw	(OFST-1,sp),x
 157  0075               L74:
 158                     ; 95     if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 158                     ; 96           &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 158                     ; 97           TEST_THREAD_STACK_SIZE) != ATOM_OK)
 160  0075 ae0080        	ldw	x,#128
 161  0078 89            	pushw	x
 162  0079 ae0000        	ldw	x,#0
 163  007c 89            	pushw	x
 164  007d ae0185        	ldw	x,#L5_test_thread_stack+383
 165  0080 89            	pushw	x
 166  0081 ae0003        	ldw	x,#3
 167  0084 89            	pushw	x
 168  0085 ae0000        	ldw	x,#0
 169  0088 89            	pushw	x
 170  0089 ae0000        	ldw	x,#L11_test_thread_func
 171  008c 89            	pushw	x
 172  008d 4b10          	push	#16
 173  008f ae01b4        	ldw	x,#L3_tcb+46
 174  0092 cd0000        	call	_atomThreadCreate
 176  0095 5b0d          	addw	sp,#13
 177  0097 4d            	tnz	a
 178  0098 270d          	jreq	L35
 179                     ; 100         ATOMLOG (_STR("Thread3\n"));
 181  009a ae0033        	ldw	x,#L55
 182  009d cd0000        	call	_printf
 184                     ; 101         failures++;
 186  00a0 1e0b          	ldw	x,(OFST-1,sp)
 187  00a2 1c0001        	addw	x,#1
 188  00a5 1f0b          	ldw	(OFST-1,sp),x
 189  00a7               L35:
 190                     ; 105     if (atomTimerDelay(TEST_PERIOD_SECS * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 192  00a7 ae03e8        	ldw	x,#1000
 193  00aa 89            	pushw	x
 194  00ab ae0000        	ldw	x,#0
 195  00ae 89            	pushw	x
 196  00af cd0000        	call	_atomTimerDelay
 198  00b2 5b04          	addw	sp,#4
 199  00b4 4d            	tnz	a
 200  00b5 270d          	jreq	L75
 201                     ; 107         ATOMLOG (_STR("Period\n"));
 203  00b7 ae002b        	ldw	x,#L16
 204  00ba cd0000        	call	_printf
 206                     ; 108         failures++;
 208  00bd 1e0b          	ldw	x,(OFST-1,sp)
 209  00bf 1c0001        	addw	x,#1
 210  00c2 1f0b          	ldw	(OFST-1,sp),x
 211  00c4               L75:
 212                     ; 112     failures += g_failure_cnt[0] + g_failure_cnt[1] + g_failure_cnt[2];
 214  00c4 ce0002        	ldw	x,L7_g_failure_cnt+2
 215  00c7 72bb0000      	addw	x,L7_g_failure_cnt
 216  00cb 72bb0004      	addw	x,L7_g_failure_cnt+4
 217  00cf 72fb0b        	addw	x,(OFST-1,sp)
 218  00d2 1f0b          	ldw	(OFST-1,sp),x
 219                     ; 121         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 221  00d4 5f            	clrw	x
 222  00d5 1f09          	ldw	(OFST-3,sp),x
 223  00d7               L36:
 224                     ; 124             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 226  00d7 96            	ldw	x,sp
 227  00d8 1c0005        	addw	x,#OFST-7
 228  00db 89            	pushw	x
 229  00dc 96            	ldw	x,sp
 230  00dd 1c0003        	addw	x,#OFST-9
 231  00e0 89            	pushw	x
 232  00e1 1e0d          	ldw	x,(OFST+1,sp)
 233  00e3 90ae0017      	ldw	y,#23
 234  00e7 cd0000        	call	c_imul
 236  00ea 1c0186        	addw	x,#L3_tcb
 237  00ed cd0000        	call	_atomThreadStackCheck
 239  00f0 5b04          	addw	sp,#4
 240  00f2 4d            	tnz	a
 241  00f3 270f          	jreq	L17
 242                     ; 126                 ATOMLOG (_STR("StackCheck\n"));
 244  00f5 ae001f        	ldw	x,#L37
 245  00f8 cd0000        	call	_printf
 247                     ; 127                 failures++;
 249  00fb 1e0b          	ldw	x,(OFST-1,sp)
 250  00fd 1c0001        	addw	x,#1
 251  0100 1f0b          	ldw	(OFST-1,sp),x
 253  0102 2024          	jra	L57
 254  0104               L17:
 255                     ; 132                 if (free_bytes == 0)
 257  0104 96            	ldw	x,sp
 258  0105 1c0005        	addw	x,#OFST-7
 259  0108 cd0000        	call	c_lzmp
 261  010b 2611          	jrne	L77
 262                     ; 134                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 264  010d 1e09          	ldw	x,(OFST-3,sp)
 265  010f 89            	pushw	x
 266  0110 ae000d        	ldw	x,#L101
 267  0113 cd0000        	call	_printf
 269  0116 85            	popw	x
 270                     ; 135                     failures++;
 272  0117 1e0b          	ldw	x,(OFST-1,sp)
 273  0119 1c0001        	addw	x,#1
 274  011c 1f0b          	ldw	(OFST-1,sp),x
 275  011e               L77:
 276                     ; 140                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 278  011e 1e03          	ldw	x,(OFST-9,sp)
 279  0120 89            	pushw	x
 280  0121 ae0000        	ldw	x,#L301
 281  0124 cd0000        	call	_printf
 283  0127 85            	popw	x
 284  0128               L57:
 285                     ; 121         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 287  0128 1e09          	ldw	x,(OFST-3,sp)
 288  012a 1c0001        	addw	x,#1
 289  012d 1f09          	ldw	(OFST-3,sp),x
 292  012f 9c            	rvf
 293  0130 1e09          	ldw	x,(OFST-3,sp)
 294  0132 a30003        	cpw	x,#3
 295  0135 2fa0          	jrslt	L36
 296                     ; 148     return failures;
 298  0137 1e0b          	ldw	x,(OFST-1,sp)
 299  0139 cd0000        	call	c_itolx
 303  013c 5b0c          	addw	sp,#12
 304  013e 81            	ret
 360                     ; 164 static void test_thread_func (uint32_t param)
 360                     ; 165 {
 361                     .text:	section	.text,new
 362  0000               L11_test_thread_func:
 364  0000 520d          	subw	sp,#13
 365       0000000d      OFST:	set	13
 368                     ; 170     thread_id = (uint8_t)param;
 370  0002 7b13          	ld	a,(OFST+6,sp)
 371  0004 6b0d          	ld	(OFST+0,sp),a
 372                     ; 178     atomTimerDelay (1);
 374  0006 ae0001        	ldw	x,#1
 375  0009 89            	pushw	x
 376  000a ae0000        	ldw	x,#0
 377  000d 89            	pushw	x
 378  000e cd0000        	call	_atomTimerDelay
 380  0011 5b04          	addw	sp,#4
 381  0013               L721:
 382                     ; 184         start_time = atomTimeGet();
 384  0013 cd0000        	call	_atomTimeGet
 386  0016 96            	ldw	x,sp
 387  0017 1c0005        	addw	x,#OFST-8
 388  001a cd0000        	call	c_rtol
 390                     ; 187         if (atomTimerDelay(thread_id) != ATOM_OK)
 392  001d 7b0d          	ld	a,(OFST+0,sp)
 393  001f b703          	ld	c_lreg+3,a
 394  0021 3f02          	clr	c_lreg+2
 395  0023 3f01          	clr	c_lreg+1
 396  0025 3f00          	clr	c_lreg
 397  0027 be02          	ldw	x,c_lreg+2
 398  0029 89            	pushw	x
 399  002a be00          	ldw	x,c_lreg
 400  002c 89            	pushw	x
 401  002d cd0000        	call	_atomTimerDelay
 403  0030 5b04          	addw	sp,#4
 404  0032 4d            	tnz	a
 405  0033 2715          	jreq	L331
 406                     ; 189             g_failure_cnt[thread_id-1]++;
 408  0035 7b0d          	ld	a,(OFST+0,sp)
 409  0037 5f            	clrw	x
 410  0038 97            	ld	xl,a
 411  0039 58            	sllw	x
 412  003a 5a            	decw	x
 413  003b 5a            	decw	x
 414  003c 9093          	ldw	y,x
 415  003e de0000        	ldw	x,(L7_g_failure_cnt,x)
 416  0041 1c0001        	addw	x,#1
 417  0044 90df0000      	ldw	(L7_g_failure_cnt,y),x
 419  0048 20c9          	jra	L721
 420  004a               L331:
 421                     ; 194             end_time = atomTimeGet();
 423  004a cd0000        	call	_atomTimeGet
 425  004d 96            	ldw	x,sp
 426  004e 1c0009        	addw	x,#OFST-4
 427  0051 cd0000        	call	c_rtol
 429                     ; 197             if ((end_time - start_time) != thread_id)
 431  0054 7b0d          	ld	a,(OFST+0,sp)
 432  0056 b703          	ld	c_lreg+3,a
 433  0058 3f02          	clr	c_lreg+2
 434  005a 3f01          	clr	c_lreg+1
 435  005c 3f00          	clr	c_lreg
 436  005e 96            	ldw	x,sp
 437  005f 1c0001        	addw	x,#OFST-12
 438  0062 cd0000        	call	c_rtol
 440  0065 96            	ldw	x,sp
 441  0066 1c0009        	addw	x,#OFST-4
 442  0069 cd0000        	call	c_ltor
 444  006c 96            	ldw	x,sp
 445  006d 1c0005        	addw	x,#OFST-8
 446  0070 cd0000        	call	c_lsub
 448  0073 96            	ldw	x,sp
 449  0074 1c0001        	addw	x,#OFST-12
 450  0077 cd0000        	call	c_lcmp
 452  007a 2797          	jreq	L721
 453                     ; 199                 g_failure_cnt[thread_id-1]++;
 455  007c 7b0d          	ld	a,(OFST+0,sp)
 456  007e 5f            	clrw	x
 457  007f 97            	ld	xl,a
 458  0080 58            	sllw	x
 459  0081 5a            	decw	x
 460  0082 5a            	decw	x
 461  0083 9093          	ldw	y,x
 462  0085 de0000        	ldw	x,(L7_g_failure_cnt,x)
 463  0088 1c0001        	addw	x,#1
 464  008b 90df0000      	ldw	(L7_g_failure_cnt,y),x
 465  008f 2082          	jpf	L721
 670                     	switch	.bss
 671  0000               L7_g_failure_cnt:
 672  0000 000000000000  	ds.b	6
 673  0006               L5_test_thread_stack:
 674  0006 000000000000  	ds.b	384
 675  0186               L3_tcb:
 676  0186 000000000000  	ds.b	69
 677                     	xdef	_test_start
 678                     	xref	_printf
 679                     	xref	_atomThreadStackCheck
 680                     	xref	_atomThreadCreate
 681                     	xref	_atomTimeGet
 682                     	xref	_atomTimerDelay
 683                     .const:	section	.text
 684  0000               L301:
 685  0000 537461636b55  	dc.b	"StackUse:%d",10,0
 686  000d               L101:
 687  000d 537461636b4f  	dc.b	"StackOverflow %d",10,0
 688  001f               L37:
 689  001f 537461636b43  	dc.b	"StackCheck",10,0
 690  002b               L16:
 691  002b 506572696f64  	dc.b	"Period",10,0
 692  0033               L55:
 693  0033 546872656164  	dc.b	"Thread3",10,0
 694  003c               L15:
 695  003c 546872656164  	dc.b	"Thread2",10,0
 696  0045               L54:
 697  0045 546872656164  	dc.b	"Thread1",10,0
 698                     	xref.b	c_lreg
 699                     	xref.b	c_x
 719                     	xref	c_lcmp
 720                     	xref	c_lsub
 721                     	xref	c_ltor
 722                     	xref	c_rtol
 723                     	xref	c_itolx
 724                     	xref	c_lzmp
 725                     	xref	c_imul
 726                     	end
