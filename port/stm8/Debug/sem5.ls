   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  76                     ; 64 uint32_t test_start (void)
  76                     ; 65 {
  78                     .text:	section	.text,new
  79  0000               _test_start:
  81  0000 520c          	subw	sp,#12
  82       0000000c      OFST:	set	12
  85                     ; 69     failures = 0;
  87  0002 5f            	clrw	x
  88  0003 1f0b          	ldw	(OFST-1,sp),x
  89                     ; 72     if (atomSemCreate (&sem1, 0) != ATOM_OK)
  91  0005 4b00          	push	#0
  92  0007 ae009a        	ldw	x,#L3_sem1
  93  000a cd0000        	call	_atomSemCreate
  95  000d 5b01          	addw	sp,#1
  96  000f 4d            	tnz	a
  97  0010 2711          	jreq	L54
  98                     ; 74         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 100  0012 ae0089        	ldw	x,#L74
 101  0015 cd0000        	call	_printf
 103                     ; 75         failures++;
 105  0018 1e0b          	ldw	x,(OFST-1,sp)
 106  001a 1c0001        	addw	x,#1
 107  001d 1f0b          	ldw	(OFST-1,sp),x
 109  001f ac140114      	jpf	L15
 110  0023               L54:
 111                     ; 78     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 113  0023 4b00          	push	#0
 114  0025 ae0097        	ldw	x,#L5_sem2
 115  0028 cd0000        	call	_atomSemCreate
 117  002b 5b01          	addw	sp,#1
 118  002d 4d            	tnz	a
 119  002e 2711          	jreq	L35
 120                     ; 80         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 122  0030 ae0089        	ldw	x,#L74
 123  0033 cd0000        	call	_printf
 125                     ; 81         failures++;
 127  0036 1e0b          	ldw	x,(OFST-1,sp)
 128  0038 1c0001        	addw	x,#1
 129  003b 1f0b          	ldw	(OFST-1,sp),x
 131  003d ac140114      	jpf	L15
 132  0041               L35:
 133                     ; 86         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 133                     ; 87               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 133                     ; 88               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 135  0041 ae0080        	ldw	x,#128
 136  0044 89            	pushw	x
 137  0045 ae0000        	ldw	x,#0
 138  0048 89            	pushw	x
 139  0049 ae007f        	ldw	x,#L11_test_thread_stack+127
 140  004c 89            	pushw	x
 141  004d ae0001        	ldw	x,#1
 142  0050 89            	pushw	x
 143  0051 ae0000        	ldw	x,#0
 144  0054 89            	pushw	x
 145  0055 ae0000        	ldw	x,#L31_test_thread_func
 146  0058 89            	pushw	x
 147  0059 4b10          	push	#16
 148  005b ae0080        	ldw	x,#L7_tcb
 149  005e cd0000        	call	_atomThreadCreate
 151  0061 5b0d          	addw	sp,#13
 152  0063 4d            	tnz	a
 153  0064 270d          	jreq	L75
 154                     ; 91             ATOMLOG (_STR("Error creating test thread\n"));
 156  0066 ae006d        	ldw	x,#L16
 157  0069 cd0000        	call	_printf
 159                     ; 92             failures++;
 161  006c 1e0b          	ldw	x,(OFST-1,sp)
 162  006e 1c0001        	addw	x,#1
 163  0071 1f0b          	ldw	(OFST-1,sp),x
 164  0073               L75:
 165                     ; 110         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 167  0073 ae0019        	ldw	x,#25
 168  0076 89            	pushw	x
 169  0077 ae0000        	ldw	x,#0
 170  007a 89            	pushw	x
 171  007b cd0000        	call	_atomTimerDelay
 173  007e 5b04          	addw	sp,#4
 174                     ; 111         if (atomSemGet (&sem2, -1) != ATOM_WOULDBLOCK)
 176  0080 aeffff        	ldw	x,#65535
 177  0083 89            	pushw	x
 178  0084 aeffff        	ldw	x,#-1
 179  0087 89            	pushw	x
 180  0088 ae0097        	ldw	x,#L5_sem2
 181  008b cd0000        	call	_atomSemGet
 183  008e 5b04          	addw	sp,#4
 184  0090 a103          	cp	a,#3
 185  0092 270f          	jreq	L36
 186                     ; 113             ATOMLOG (_STR("Did not wait\n"));
 188  0094 ae005f        	ldw	x,#L56
 189  0097 cd0000        	call	_printf
 191                     ; 114             failures++;
 193  009a 1e0b          	ldw	x,(OFST-1,sp)
 194  009c 1c0001        	addw	x,#1
 195  009f 1f0b          	ldw	(OFST-1,sp),x
 197  00a1 2045          	jra	L76
 198  00a3               L36:
 199                     ; 118         else if (atomSemPut (&sem1) != ATOM_OK)
 201  00a3 ae009a        	ldw	x,#L3_sem1
 202  00a6 cd0000        	call	_atomSemPut
 204  00a9 4d            	tnz	a
 205  00aa 270f          	jreq	L17
 206                     ; 120             ATOMLOG (_STR("Put fail\n"));
 208  00ac ae0055        	ldw	x,#L37
 209  00af cd0000        	call	_printf
 211                     ; 121             failures++;
 213  00b2 1e0b          	ldw	x,(OFST-1,sp)
 214  00b4 1c0001        	addw	x,#1
 215  00b7 1f0b          	ldw	(OFST-1,sp),x
 217  00b9 202d          	jra	L76
 218  00bb               L17:
 219                     ; 128             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 221  00bb ae0019        	ldw	x,#25
 222  00be 89            	pushw	x
 223  00bf ae0000        	ldw	x,#0
 224  00c2 89            	pushw	x
 225  00c3 cd0000        	call	_atomTimerDelay
 227  00c6 5b04          	addw	sp,#4
 228                     ; 131             if (atomSemGet (&sem2, -1) != ATOM_OK)
 230  00c8 aeffff        	ldw	x,#65535
 231  00cb 89            	pushw	x
 232  00cc aeffff        	ldw	x,#-1
 233  00cf 89            	pushw	x
 234  00d0 ae0097        	ldw	x,#L5_sem2
 235  00d3 cd0000        	call	_atomSemGet
 237  00d6 5b04          	addw	sp,#4
 238  00d8 4d            	tnz	a
 239  00d9 270d          	jreq	L76
 240                     ; 133                 ATOMLOG (_STR("Sem2 not posted\n"));
 242  00db ae0044        	ldw	x,#L101
 243  00de cd0000        	call	_printf
 245                     ; 134                 failures++;
 247  00e1 1e0b          	ldw	x,(OFST-1,sp)
 248  00e3 1c0001        	addw	x,#1
 249  00e6 1f0b          	ldw	(OFST-1,sp),x
 250  00e8               L76:
 251                     ; 140         if (atomSemDelete (&sem1) != ATOM_OK)
 253  00e8 ae009a        	ldw	x,#L3_sem1
 254  00eb cd0000        	call	_atomSemDelete
 256  00ee 4d            	tnz	a
 257  00ef 270d          	jreq	L301
 258                     ; 142             ATOMLOG (_STR("Delete failed\n"));
 260  00f1 ae0035        	ldw	x,#L501
 261  00f4 cd0000        	call	_printf
 263                     ; 143             failures++;
 265  00f7 1e0b          	ldw	x,(OFST-1,sp)
 266  00f9 1c0001        	addw	x,#1
 267  00fc 1f0b          	ldw	(OFST-1,sp),x
 268  00fe               L301:
 269                     ; 145         if (atomSemDelete (&sem2) != ATOM_OK)
 271  00fe ae0097        	ldw	x,#L5_sem2
 272  0101 cd0000        	call	_atomSemDelete
 274  0104 4d            	tnz	a
 275  0105 270d          	jreq	L15
 276                     ; 147             ATOMLOG (_STR("Delete failed\n"));
 278  0107 ae0035        	ldw	x,#L501
 279  010a cd0000        	call	_printf
 281                     ; 148             failures++;
 283  010d 1e0b          	ldw	x,(OFST-1,sp)
 284  010f 1c0001        	addw	x,#1
 285  0112 1f0b          	ldw	(OFST-1,sp),x
 286  0114               L15:
 287                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 289  0114 5f            	clrw	x
 290  0115 1f09          	ldw	(OFST-3,sp),x
 291  0117               L111:
 292                     ; 162             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 294  0117 96            	ldw	x,sp
 295  0118 1c0005        	addw	x,#OFST-7
 296  011b 89            	pushw	x
 297  011c 96            	ldw	x,sp
 298  011d 1c0003        	addw	x,#OFST-9
 299  0120 89            	pushw	x
 300  0121 1e0d          	ldw	x,(OFST+1,sp)
 301  0123 90ae0017      	ldw	y,#23
 302  0127 cd0000        	call	c_imul
 304  012a 1c0080        	addw	x,#L7_tcb
 305  012d cd0000        	call	_atomThreadStackCheck
 307  0130 5b04          	addw	sp,#4
 308  0132 4d            	tnz	a
 309  0133 270f          	jreq	L711
 310                     ; 164                 ATOMLOG (_STR("StackCheck\n"));
 312  0135 ae0029        	ldw	x,#L121
 313  0138 cd0000        	call	_printf
 315                     ; 165                 failures++;
 317  013b 1e0b          	ldw	x,(OFST-1,sp)
 318  013d 1c0001        	addw	x,#1
 319  0140 1f0b          	ldw	(OFST-1,sp),x
 321  0142 2024          	jra	L321
 322  0144               L711:
 323                     ; 170                 if (free_bytes == 0)
 325  0144 96            	ldw	x,sp
 326  0145 1c0005        	addw	x,#OFST-7
 327  0148 cd0000        	call	c_lzmp
 329  014b 2611          	jrne	L521
 330                     ; 172                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 332  014d 1e09          	ldw	x,(OFST-3,sp)
 333  014f 89            	pushw	x
 334  0150 ae0017        	ldw	x,#L721
 335  0153 cd0000        	call	_printf
 337  0156 85            	popw	x
 338                     ; 173                     failures++;
 340  0157 1e0b          	ldw	x,(OFST-1,sp)
 341  0159 1c0001        	addw	x,#1
 342  015c 1f0b          	ldw	(OFST-1,sp),x
 343  015e               L521:
 344                     ; 178                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 346  015e 1e03          	ldw	x,(OFST-9,sp)
 347  0160 89            	pushw	x
 348  0161 ae000a        	ldw	x,#L131
 349  0164 cd0000        	call	_printf
 351  0167 85            	popw	x
 352  0168               L321:
 353                     ; 159         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 355  0168 1e09          	ldw	x,(OFST-3,sp)
 356  016a 1c0001        	addw	x,#1
 357  016d 1f09          	ldw	(OFST-3,sp),x
 360  016f 9c            	rvf
 361  0170 1e09          	ldw	x,(OFST-3,sp)
 362  0172 a30001        	cpw	x,#1
 363  0175 2fa0          	jrslt	L111
 364                     ; 186     return failures;
 366  0177 1e0b          	ldw	x,(OFST-1,sp)
 367  0179 cd0000        	call	c_itolx
 371  017c 5b0c          	addw	sp,#12
 372  017e 81            	ret
 417                     ; 200 static void test_thread_func (uint32_t param)
 417                     ; 201 {
 418                     .text:	section	.text,new
 419  0000               L31_test_thread_func:
 421  0000 88            	push	a
 422       00000001      OFST:	set	1
 425                     ; 205     param = param;
 427  0001 96            	ldw	x,sp
 428  0002 1c0004        	addw	x,#OFST+3
 429  0005 cd0000        	call	c_ltor
 431                     ; 208     if ((status = atomSemGet (&sem1, 0)) != ATOM_OK)
 433  0008 ae0000        	ldw	x,#0
 434  000b 89            	pushw	x
 435  000c ae0000        	ldw	x,#0
 436  000f 89            	pushw	x
 437  0010 ae009a        	ldw	x,#L3_sem1
 438  0013 cd0000        	call	_atomSemGet
 440  0016 5b04          	addw	sp,#4
 441  0018 6b01          	ld	(OFST+0,sp),a
 442  001a 270c          	jreq	L151
 443                     ; 211         ATOMLOG (_STR("G%d\n"), status);
 445  001c 7b01          	ld	a,(OFST+0,sp)
 446  001e 88            	push	a
 447  001f ae0005        	ldw	x,#L351
 448  0022 cd0000        	call	_printf
 450  0025 84            	pop	a
 452  0026 2014          	jra	L361
 453  0028               L151:
 454                     ; 215     else if ((status = atomSemPut (&sem2)) != ATOM_OK)
 456  0028 ae0097        	ldw	x,#L5_sem2
 457  002b cd0000        	call	_atomSemPut
 459  002e 6b01          	ld	(OFST+0,sp),a
 460  0030 270a          	jreq	L361
 461                     ; 218         ATOMLOG (_STR("P%d\n"), status);
 463  0032 7b01          	ld	a,(OFST+0,sp)
 464  0034 88            	push	a
 465  0035 ae0000        	ldw	x,#L161
 466  0038 cd0000        	call	_printf
 468  003b 84            	pop	a
 469  003c               L361:
 470                     ; 224         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 472  003c ae0064        	ldw	x,#100
 473  003f 89            	pushw	x
 474  0040 ae0000        	ldw	x,#0
 475  0043 89            	pushw	x
 476  0044 cd0000        	call	_atomTimerDelay
 478  0047 5b04          	addw	sp,#4
 480  0049 20f1          	jra	L361
 721                     	switch	.bss
 722  0000               L11_test_thread_stack:
 723  0000 000000000000  	ds.b	128
 724  0080               L7_tcb:
 725  0080 000000000000  	ds.b	23
 726  0097               L5_sem2:
 727  0097 000000        	ds.b	3
 728  009a               L3_sem1:
 729  009a 000000        	ds.b	3
 730                     	xref	_atomSemPut
 731                     	xref	_atomSemGet
 732                     	xref	_atomSemDelete
 733                     	xref	_atomSemCreate
 734                     	xdef	_test_start
 735                     	xref	_printf
 736                     	xref	_atomThreadStackCheck
 737                     	xref	_atomThreadCreate
 738                     	xref	_atomTimerDelay
 739                     .const:	section	.text
 740  0000               L161:
 741  0000 5025640a00    	dc.b	"P%d",10,0
 742  0005               L351:
 743  0005 4725640a00    	dc.b	"G%d",10,0
 744  000a               L131:
 745  000a 537461636b55  	dc.b	"StackUse:%d",10,0
 746  0017               L721:
 747  0017 537461636b4f  	dc.b	"StackOverflow %d",10,0
 748  0029               L121:
 749  0029 537461636b43  	dc.b	"StackCheck",10,0
 750  0035               L501:
 751  0035 44656c657465  	dc.b	"Delete failed",10,0
 752  0044               L101:
 753  0044 53656d32206e  	dc.b	"Sem2 not posted",10,0
 754  0055               L37:
 755  0055 507574206661  	dc.b	"Put fail",10,0
 756  005f               L56:
 757  005f 446964206e6f  	dc.b	"Did not wait",10,0
 758  006d               L16:
 759  006d 4572726f7220  	dc.b	"Error creating tes"
 760  007f 742074687265  	dc.b	"t thread",10,0
 761  0089               L74:
 762  0089 4572726f7220  	dc.b	"Error creating tes"
 763  009b 742073656d61  	dc.b	"t semaphore 1",10,0
 764                     	xref.b	c_x
 784                     	xref	c_ltor
 785                     	xref	c_itolx
 786                     	xref	c_lzmp
 787                     	xref	c_imul
 788                     	end
