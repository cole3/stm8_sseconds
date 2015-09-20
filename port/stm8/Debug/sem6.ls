   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  74                     ; 67 uint32_t test_start (void)
  74                     ; 68 {
  76                     .text:	section	.text,new
  77  0000               _test_start:
  79  0000 520c          	subw	sp,#12
  80       0000000c      OFST:	set	12
  83                     ; 72     failures = 0;
  85  0002 5f            	clrw	x
  86  0003 1f0b          	ldw	(OFST-1,sp),x
  87                     ; 75     if (atomSemCreate (&sem1, INITIAL_SEM_COUNT) != ATOM_OK)
  89  0005 4b0a          	push	#10
  90  0007 ae009a        	ldw	x,#L3_sem1
  91  000a cd0000        	call	_atomSemCreate
  93  000d 5b01          	addw	sp,#1
  94  000f 4d            	tnz	a
  95  0010 2711          	jreq	L54
  96                     ; 77         ATOMLOG (_STR("Error creating test semaphore 1\n"));
  98  0012 ae0088        	ldw	x,#L74
  99  0015 cd0000        	call	_printf
 101                     ; 78         failures++;
 103  0018 1e0b          	ldw	x,(OFST-1,sp)
 104  001a 1c0001        	addw	x,#1
 105  001d 1f0b          	ldw	(OFST-1,sp),x
 107  001f ace400e4      	jpf	L15
 108  0023               L54:
 109                     ; 81     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 111  0023 4b00          	push	#0
 112  0025 ae0097        	ldw	x,#L5_sem2
 113  0028 cd0000        	call	_atomSemCreate
 115  002b 5b01          	addw	sp,#1
 116  002d 4d            	tnz	a
 117  002e 2711          	jreq	L35
 118                     ; 83         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 120  0030 ae0088        	ldw	x,#L74
 121  0033 cd0000        	call	_printf
 123                     ; 84         failures++;
 125  0036 1e0b          	ldw	x,(OFST-1,sp)
 126  0038 1c0001        	addw	x,#1
 127  003b 1f0b          	ldw	(OFST-1,sp),x
 129  003d ace400e4      	jpf	L15
 130  0041               L35:
 131                     ; 89         if (atomSemGet (&sem2, -1) != ATOM_WOULDBLOCK)
 133  0041 aeffff        	ldw	x,#65535
 134  0044 89            	pushw	x
 135  0045 aeffff        	ldw	x,#-1
 136  0048 89            	pushw	x
 137  0049 ae0097        	ldw	x,#L5_sem2
 138  004c cd0000        	call	_atomSemGet
 140  004f 5b04          	addw	sp,#4
 141  0051 a103          	cp	a,#3
 142  0053 270f          	jreq	L75
 143                     ; 91             ATOMLOG (_STR("Sem2 already put\n"));
 145  0055 ae0076        	ldw	x,#L16
 146  0058 cd0000        	call	_printf
 148                     ; 92             failures++;
 150  005b 1e0b          	ldw	x,(OFST-1,sp)
 151  005d 1c0001        	addw	x,#1
 152  0060 1f0b          	ldw	(OFST-1,sp),x
 154  0062 2054          	jra	L36
 155  0064               L75:
 156                     ; 96         else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 156                     ; 97               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 156                     ; 98               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 158  0064 ae0080        	ldw	x,#128
 159  0067 89            	pushw	x
 160  0068 ae0000        	ldw	x,#0
 161  006b 89            	pushw	x
 162  006c ae007f        	ldw	x,#L11_test_thread_stack+127
 163  006f 89            	pushw	x
 164  0070 ae0001        	ldw	x,#1
 165  0073 89            	pushw	x
 166  0074 ae0000        	ldw	x,#0
 167  0077 89            	pushw	x
 168  0078 ae0000        	ldw	x,#L31_test_thread_func
 169  007b 89            	pushw	x
 170  007c 4b10          	push	#16
 171  007e ae0080        	ldw	x,#L7_tcb
 172  0081 cd0000        	call	_atomThreadCreate
 174  0084 5b0d          	addw	sp,#13
 175  0086 4d            	tnz	a
 176  0087 270f          	jreq	L56
 177                     ; 101             ATOMLOG (_STR("Error creating test thread\n"));
 179  0089 ae005a        	ldw	x,#L76
 180  008c cd0000        	call	_printf
 182                     ; 102             failures++;
 184  008f 1e0b          	ldw	x,(OFST-1,sp)
 185  0091 1c0001        	addw	x,#1
 186  0094 1f0b          	ldw	(OFST-1,sp),x
 188  0096 2020          	jra	L36
 189  0098               L56:
 190                     ; 114             if (atomSemGet (&sem2, SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 192  0098 ae0064        	ldw	x,#100
 193  009b 89            	pushw	x
 194  009c ae0000        	ldw	x,#0
 195  009f 89            	pushw	x
 196  00a0 ae0097        	ldw	x,#L5_sem2
 197  00a3 cd0000        	call	_atomSemGet
 199  00a6 5b04          	addw	sp,#4
 200  00a8 4d            	tnz	a
 201  00a9 270d          	jreq	L36
 202                     ; 116                 ATOMLOG (_STR("Sem2 not posted\n"));
 204  00ab ae0049        	ldw	x,#L57
 205  00ae cd0000        	call	_printf
 207                     ; 117                 failures++;
 209  00b1 1e0b          	ldw	x,(OFST-1,sp)
 210  00b3 1c0001        	addw	x,#1
 211  00b6 1f0b          	ldw	(OFST-1,sp),x
 212  00b8               L36:
 213                     ; 123         if (atomSemDelete (&sem1) != ATOM_OK)
 215  00b8 ae009a        	ldw	x,#L3_sem1
 216  00bb cd0000        	call	_atomSemDelete
 218  00be 4d            	tnz	a
 219  00bf 270d          	jreq	L77
 220                     ; 125             ATOMLOG (_STR("Delete failed\n"));
 222  00c1 ae003a        	ldw	x,#L101
 223  00c4 cd0000        	call	_printf
 225                     ; 126             failures++;
 227  00c7 1e0b          	ldw	x,(OFST-1,sp)
 228  00c9 1c0001        	addw	x,#1
 229  00cc 1f0b          	ldw	(OFST-1,sp),x
 230  00ce               L77:
 231                     ; 128         if (atomSemDelete (&sem2) != ATOM_OK)
 233  00ce ae0097        	ldw	x,#L5_sem2
 234  00d1 cd0000        	call	_atomSemDelete
 236  00d4 4d            	tnz	a
 237  00d5 270d          	jreq	L15
 238                     ; 130             ATOMLOG (_STR("Delete failed\n"));
 240  00d7 ae003a        	ldw	x,#L101
 241  00da cd0000        	call	_printf
 243                     ; 131             failures++;
 245  00dd 1e0b          	ldw	x,(OFST-1,sp)
 246  00df 1c0001        	addw	x,#1
 247  00e2 1f0b          	ldw	(OFST-1,sp),x
 248  00e4               L15:
 249                     ; 142         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 251  00e4 5f            	clrw	x
 252  00e5 1f09          	ldw	(OFST-3,sp),x
 253  00e7               L501:
 254                     ; 145             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 256  00e7 96            	ldw	x,sp
 257  00e8 1c0005        	addw	x,#OFST-7
 258  00eb 89            	pushw	x
 259  00ec 96            	ldw	x,sp
 260  00ed 1c0003        	addw	x,#OFST-9
 261  00f0 89            	pushw	x
 262  00f1 1e0d          	ldw	x,(OFST+1,sp)
 263  00f3 90ae0017      	ldw	y,#23
 264  00f7 cd0000        	call	c_imul
 266  00fa 1c0080        	addw	x,#L7_tcb
 267  00fd cd0000        	call	_atomThreadStackCheck
 269  0100 5b04          	addw	sp,#4
 270  0102 4d            	tnz	a
 271  0103 270f          	jreq	L311
 272                     ; 147                 ATOMLOG (_STR("StackCheck\n"));
 274  0105 ae002e        	ldw	x,#L511
 275  0108 cd0000        	call	_printf
 277                     ; 148                 failures++;
 279  010b 1e0b          	ldw	x,(OFST-1,sp)
 280  010d 1c0001        	addw	x,#1
 281  0110 1f0b          	ldw	(OFST-1,sp),x
 283  0112 2024          	jra	L711
 284  0114               L311:
 285                     ; 153                 if (free_bytes == 0)
 287  0114 96            	ldw	x,sp
 288  0115 1c0005        	addw	x,#OFST-7
 289  0118 cd0000        	call	c_lzmp
 291  011b 2611          	jrne	L121
 292                     ; 155                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 294  011d 1e09          	ldw	x,(OFST-3,sp)
 295  011f 89            	pushw	x
 296  0120 ae001c        	ldw	x,#L321
 297  0123 cd0000        	call	_printf
 299  0126 85            	popw	x
 300                     ; 156                     failures++;
 302  0127 1e0b          	ldw	x,(OFST-1,sp)
 303  0129 1c0001        	addw	x,#1
 304  012c 1f0b          	ldw	(OFST-1,sp),x
 305  012e               L121:
 306                     ; 161                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 308  012e 1e03          	ldw	x,(OFST-9,sp)
 309  0130 89            	pushw	x
 310  0131 ae000f        	ldw	x,#L521
 311  0134 cd0000        	call	_printf
 313  0137 85            	popw	x
 314  0138               L711:
 315                     ; 142         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 317  0138 1e09          	ldw	x,(OFST-3,sp)
 318  013a 1c0001        	addw	x,#1
 319  013d 1f09          	ldw	(OFST-3,sp),x
 322  013f 9c            	rvf
 323  0140 1e09          	ldw	x,(OFST-3,sp)
 324  0142 a30001        	cpw	x,#1
 325  0145 2fa0          	jrslt	L501
 326                     ; 169     return failures;
 328  0147 1e0b          	ldw	x,(OFST-1,sp)
 329  0149 cd0000        	call	c_itolx
 333  014c 5b0c          	addw	sp,#12
 334  014e 81            	ret
 393                     ; 183 static void test_thread_func (uint32_t param)
 393                     ; 184 {
 394                     .text:	section	.text,new
 395  0000               L31_test_thread_func:
 397  0000 5205          	subw	sp,#5
 398       00000005      OFST:	set	5
 401                     ; 190     param = param;
 403  0002 96            	ldw	x,sp
 404  0003 1c0008        	addw	x,#OFST+3
 405  0006 cd0000        	call	c_ltor
 407                     ; 196     failures = 0;
 409  0009 5f            	clrw	x
 410  000a 1f03          	ldw	(OFST-2,sp),x
 411                     ; 197     count = INITIAL_SEM_COUNT;
 413  000c ae000a        	ldw	x,#10
 414  000f 1f01          	ldw	(OFST-4,sp),x
 416  0011 2025          	jra	L551
 417  0013               L151:
 418                     ; 201         if ((status = atomSemGet (&sem1, -1)) != ATOM_OK)
 420  0013 aeffff        	ldw	x,#65535
 421  0016 89            	pushw	x
 422  0017 aeffff        	ldw	x,#-1
 423  001a 89            	pushw	x
 424  001b ae009a        	ldw	x,#L3_sem1
 425  001e cd0000        	call	_atomSemGet
 427  0021 5b04          	addw	sp,#4
 428  0023 6b05          	ld	(OFST+0,sp),a
 429  0025 2711          	jreq	L551
 430                     ; 204             ATOMLOG (_STR("G%d\n"), status);
 432  0027 7b05          	ld	a,(OFST+0,sp)
 433  0029 88            	push	a
 434  002a ae000a        	ldw	x,#L361
 435  002d cd0000        	call	_printf
 437  0030 84            	pop	a
 438                     ; 205             failures++;
 440  0031 1e03          	ldw	x,(OFST-2,sp)
 441  0033 1c0001        	addw	x,#1
 442  0036 1f03          	ldw	(OFST-2,sp),x
 443  0038               L551:
 444                     ; 198     while (count--)
 446  0038 1e01          	ldw	x,(OFST-4,sp)
 447  003a 1d0001        	subw	x,#1
 448  003d 1f01          	ldw	(OFST-4,sp),x
 449  003f 1c0001        	addw	x,#1
 450  0042 a30000        	cpw	x,#0
 451  0045 26cc          	jrne	L151
 452                     ; 210     if (failures == 0)
 454  0047 1e03          	ldw	x,(OFST-2,sp)
 455  0049 2638          	jrne	L102
 456                     ; 213         if ((status = atomSemGet (&sem1, -1)) != ATOM_WOULDBLOCK)
 458  004b aeffff        	ldw	x,#65535
 459  004e 89            	pushw	x
 460  004f aeffff        	ldw	x,#-1
 461  0052 89            	pushw	x
 462  0053 ae009a        	ldw	x,#L3_sem1
 463  0056 cd0000        	call	_atomSemGet
 465  0059 5b04          	addw	sp,#4
 466  005b 6b05          	ld	(OFST+0,sp),a
 467  005d 7b05          	ld	a,(OFST+0,sp)
 468  005f a103          	cp	a,#3
 469  0061 270c          	jreq	L761
 470                     ; 216             ATOMLOG (_STR("W%d\n"), status);
 472  0063 7b05          	ld	a,(OFST+0,sp)
 473  0065 88            	push	a
 474  0066 ae0005        	ldw	x,#L171
 475  0069 cd0000        	call	_printf
 477  006c 84            	pop	a
 479  006d 2014          	jra	L102
 480  006f               L761:
 481                     ; 220         else if ((status = atomSemPut (&sem2)) != ATOM_OK)
 483  006f ae0097        	ldw	x,#L5_sem2
 484  0072 cd0000        	call	_atomSemPut
 486  0075 6b05          	ld	(OFST+0,sp),a
 487  0077 270a          	jreq	L102
 488                     ; 223             ATOMLOG (_STR("P%d\n"), status);
 490  0079 7b05          	ld	a,(OFST+0,sp)
 491  007b 88            	push	a
 492  007c ae0000        	ldw	x,#L771
 493  007f cd0000        	call	_printf
 495  0082 84            	pop	a
 496  0083               L102:
 497                     ; 230         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 499  0083 ae0064        	ldw	x,#100
 500  0086 89            	pushw	x
 501  0087 ae0000        	ldw	x,#0
 502  008a 89            	pushw	x
 503  008b cd0000        	call	_atomTimerDelay
 505  008e 5b04          	addw	sp,#4
 507  0090 20f1          	jra	L102
 748                     	switch	.bss
 749  0000               L11_test_thread_stack:
 750  0000 000000000000  	ds.b	128
 751  0080               L7_tcb:
 752  0080 000000000000  	ds.b	23
 753  0097               L5_sem2:
 754  0097 000000        	ds.b	3
 755  009a               L3_sem1:
 756  009a 000000        	ds.b	3
 757                     	xref	_atomSemPut
 758                     	xref	_atomSemGet
 759                     	xref	_atomSemDelete
 760                     	xref	_atomSemCreate
 761                     	xdef	_test_start
 762                     	xref	_printf
 763                     	xref	_atomThreadStackCheck
 764                     	xref	_atomThreadCreate
 765                     	xref	_atomTimerDelay
 766                     .const:	section	.text
 767  0000               L771:
 768  0000 5025640a00    	dc.b	"P%d",10,0
 769  0005               L171:
 770  0005 5725640a00    	dc.b	"W%d",10,0
 771  000a               L361:
 772  000a 4725640a00    	dc.b	"G%d",10,0
 773  000f               L521:
 774  000f 537461636b55  	dc.b	"StackUse:%d",10,0
 775  001c               L321:
 776  001c 537461636b4f  	dc.b	"StackOverflow %d",10,0
 777  002e               L511:
 778  002e 537461636b43  	dc.b	"StackCheck",10,0
 779  003a               L101:
 780  003a 44656c657465  	dc.b	"Delete failed",10,0
 781  0049               L57:
 782  0049 53656d32206e  	dc.b	"Sem2 not posted",10,0
 783  005a               L76:
 784  005a 4572726f7220  	dc.b	"Error creating tes"
 785  006c 742074687265  	dc.b	"t thread",10,0
 786  0076               L16:
 787  0076 53656d322061  	dc.b	"Sem2 already put",10,0
 788  0088               L74:
 789  0088 4572726f7220  	dc.b	"Error creating tes"
 790  009a 742073656d61  	dc.b	"t semaphore 1",10,0
 791                     	xref.b	c_x
 811                     	xref	c_ltor
 812                     	xref	c_itolx
 813                     	xref	c_lzmp
 814                     	xref	c_imul
 815                     	end
