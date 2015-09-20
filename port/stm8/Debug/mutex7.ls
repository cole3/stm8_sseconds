   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 135                     ; 69 uint32_t test_start (void)
 135                     ; 70 {
 137                     .text:	section	.text,new
 138  0000               _test_start:
 140  0000 5216          	subw	sp,#22
 141       00000016      OFST:	set	22
 144                     ; 75     failures = 0;
 146  0002 5f            	clrw	x
 147  0003 1f15          	ldw	(OFST-1,sp),x
 148                     ; 78     if (atomMutexCreate (&mutex1) != ATOM_OK)
 150  0005 ae0099        	ldw	x,#L3_mutex1
 151  0008 cd0000        	call	_atomMutexCreate
 153  000b 4d            	tnz	a
 154  000c 2711          	jreq	L77
 155                     ; 80         ATOMLOG (_STR("Error creating mutex\n"));
 157  000e ae00c2        	ldw	x,#L101
 158  0011 cd0000        	call	_printf
 160                     ; 81         failures++;
 162  0014 1e15          	ldw	x,(OFST-1,sp)
 163  0016 1c0001        	addw	x,#1
 164  0019 1f15          	ldw	(OFST-1,sp),x
 166  001b ac0e010e      	jpf	L301
 167  001f               L77:
 168                     ; 86         shared_data = 0;
 170  001f 5f            	clrw	x
 171  0020 cf0000        	ldw	L11_shared_data,x
 172                     ; 89         if (atomMutexPut (&mutex1) != ATOM_ERR_OWNERSHIP)
 174  0023 ae0099        	ldw	x,#L3_mutex1
 175  0026 cd0000        	call	_atomMutexPut
 177  0029 a1cf          	cp	a,#207
 178  002b 270f          	jreq	L501
 179                     ; 91             ATOMLOG (_STR("Release error\n"));
 181  002d ae00b3        	ldw	x,#L701
 182  0030 cd0000        	call	_printf
 184                     ; 92             failures++;
 186  0033 1e15          	ldw	x,(OFST-1,sp)
 187  0035 1c0001        	addw	x,#1
 188  0038 1f15          	ldw	(OFST-1,sp),x
 190  003a 2032          	jra	L111
 191  003c               L501:
 192                     ; 96         else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 192                     ; 97               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 192                     ; 98               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 194  003c ae0080        	ldw	x,#128
 195  003f 89            	pushw	x
 196  0040 ae0000        	ldw	x,#0
 197  0043 89            	pushw	x
 198  0044 ae0081        	ldw	x,#L7_test_thread_stack+127
 199  0047 89            	pushw	x
 200  0048 ae0001        	ldw	x,#1
 201  004b 89            	pushw	x
 202  004c ae0000        	ldw	x,#0
 203  004f 89            	pushw	x
 204  0050 ae0000        	ldw	x,#L51_test_thread_func
 205  0053 89            	pushw	x
 206  0054 4b10          	push	#16
 207  0056 ae0082        	ldw	x,#L5_tcb
 208  0059 cd0000        	call	_atomThreadCreate
 210  005c 5b0d          	addw	sp,#13
 211  005e 4d            	tnz	a
 212  005f 270d          	jreq	L111
 213                     ; 101             ATOMLOG (_STR("Error creating test thread\n"));
 215  0061 ae0097        	ldw	x,#L511
 216  0064 cd0000        	call	_printf
 218                     ; 102             failures++;
 220  0067 1e15          	ldw	x,(OFST-1,sp)
 221  0069 1c0001        	addw	x,#1
 222  006c 1f15          	ldw	(OFST-1,sp),x
 223  006e               L111:
 224                     ; 110         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 226  006e ae0019        	ldw	x,#25
 227  0071 89            	pushw	x
 228  0072 ae0000        	ldw	x,#0
 229  0075 89            	pushw	x
 230  0076 cd0000        	call	_atomTimerDelay
 232  0079 5b04          	addw	sp,#4
 233                     ; 111         if (shared_data != 1)
 235  007b ce0000        	ldw	x,L11_shared_data
 236  007e a30001        	cpw	x,#1
 237  0081 270d          	jreq	L711
 238                     ; 113             ATOMLOG (_STR("Shared data unmodified\n"));
 240  0083 ae007f        	ldw	x,#L121
 241  0086 cd0000        	call	_printf
 243                     ; 114             failures++;
 245  0089 1e15          	ldw	x,(OFST-1,sp)
 246  008b 1c0001        	addw	x,#1
 247  008e 1f15          	ldw	(OFST-1,sp),x
 248  0090               L711:
 249                     ; 118         if (failures == 0)
 251  0090 1e15          	ldw	x,(OFST-1,sp)
 252  0092 2664          	jrne	L321
 253                     ; 124             if (atomMutexPut (&mutex1) != ATOM_ERR_OWNERSHIP)
 255  0094 ae0099        	ldw	x,#L3_mutex1
 256  0097 cd0000        	call	_atomMutexPut
 258  009a a1cf          	cp	a,#207
 259  009c 270d          	jreq	L521
 260                     ; 126                 ATOMLOG (_STR("Release error 2\n"));
 262  009e ae006e        	ldw	x,#L721
 263  00a1 cd0000        	call	_printf
 265                     ; 127                 failures++;
 267  00a4 1e15          	ldw	x,(OFST-1,sp)
 268  00a6 1c0001        	addw	x,#1
 269  00a9 1f15          	ldw	(OFST-1,sp),x
 270  00ab               L521:
 271                     ; 133             timer_cb.cb_func = testCallback;
 273  00ab ae0000        	ldw	x,#L31_testCallback
 274  00ae 1f0b          	ldw	(OFST-11,sp),x
 275                     ; 134             timer_cb.cb_data = NULL;
 277  00b0 5f            	clrw	x
 278  00b1 1f0d          	ldw	(OFST-9,sp),x
 279                     ; 135             timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 281  00b3 ae0064        	ldw	x,#100
 282  00b6 1f11          	ldw	(OFST-5,sp),x
 283  00b8 ae0000        	ldw	x,#0
 284  00bb 1f0f          	ldw	(OFST-7,sp),x
 285                     ; 138             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 287  00bd 96            	ldw	x,sp
 288  00be 1c000b        	addw	x,#OFST-11
 289  00c1 cd0000        	call	_atomTimerRegister
 291  00c4 4d            	tnz	a
 292  00c5 270f          	jreq	L131
 293                     ; 140                 ATOMLOG (_STR("Error registering timer\n"));
 295  00c7 ae0055        	ldw	x,#L331
 296  00ca cd0000        	call	_printf
 298                     ; 141                 failures++;
 300  00cd 1e15          	ldw	x,(OFST-1,sp)
 301  00cf 1c0001        	addw	x,#1
 302  00d2 1f15          	ldw	(OFST-1,sp),x
 304  00d4 2022          	jra	L321
 305  00d6               L131:
 306                     ; 152                 atomTimerDelay (2 * SYSTEM_TICKS_PER_SEC);
 308  00d6 ae00c8        	ldw	x,#200
 309  00d9 89            	pushw	x
 310  00da ae0000        	ldw	x,#0
 311  00dd 89            	pushw	x
 312  00de cd0000        	call	_atomTimerDelay
 314  00e1 5b04          	addw	sp,#4
 315                     ; 153                 if (shared_data != 2)
 317  00e3 ce0000        	ldw	x,L11_shared_data
 318  00e6 a30002        	cpw	x,#2
 319  00e9 270d          	jreq	L321
 320                     ; 155                     ATOMLOG (_STR("Context check failed\n"));
 322  00eb ae003f        	ldw	x,#L141
 323  00ee cd0000        	call	_printf
 325                     ; 156                     failures++;
 327  00f1 1e15          	ldw	x,(OFST-1,sp)
 328  00f3 1c0001        	addw	x,#1
 329  00f6 1f15          	ldw	(OFST-1,sp),x
 330  00f8               L321:
 331                     ; 162         if (atomMutexDelete (&mutex1) != ATOM_OK)
 333  00f8 ae0099        	ldw	x,#L3_mutex1
 334  00fb cd0000        	call	_atomMutexDelete
 336  00fe 4d            	tnz	a
 337  00ff 270d          	jreq	L301
 338                     ; 164             ATOMLOG (_STR("Delete failed\n"));
 340  0101 ae0030        	ldw	x,#L541
 341  0104 cd0000        	call	_printf
 343                     ; 165             failures++;
 345  0107 1e15          	ldw	x,(OFST-1,sp)
 346  0109 1c0001        	addw	x,#1
 347  010c 1f15          	ldw	(OFST-1,sp),x
 348  010e               L301:
 349                     ; 176         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 351  010e 5f            	clrw	x
 352  010f 1f09          	ldw	(OFST-13,sp),x
 353  0111               L741:
 354                     ; 179             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 356  0111 96            	ldw	x,sp
 357  0112 1c0005        	addw	x,#OFST-17
 358  0115 89            	pushw	x
 359  0116 96            	ldw	x,sp
 360  0117 1c0003        	addw	x,#OFST-19
 361  011a 89            	pushw	x
 362  011b 1e0d          	ldw	x,(OFST-9,sp)
 363  011d 90ae0017      	ldw	y,#23
 364  0121 cd0000        	call	c_imul
 366  0124 1c0082        	addw	x,#L5_tcb
 367  0127 cd0000        	call	_atomThreadStackCheck
 369  012a 5b04          	addw	sp,#4
 370  012c 4d            	tnz	a
 371  012d 270f          	jreq	L551
 372                     ; 181                 ATOMLOG (_STR("StackCheck\n"));
 374  012f ae0024        	ldw	x,#L751
 375  0132 cd0000        	call	_printf
 377                     ; 182                 failures++;
 379  0135 1e15          	ldw	x,(OFST-1,sp)
 380  0137 1c0001        	addw	x,#1
 381  013a 1f15          	ldw	(OFST-1,sp),x
 383  013c 2024          	jra	L161
 384  013e               L551:
 385                     ; 187                 if (free_bytes == 0)
 387  013e 96            	ldw	x,sp
 388  013f 1c0005        	addw	x,#OFST-17
 389  0142 cd0000        	call	c_lzmp
 391  0145 2611          	jrne	L361
 392                     ; 189                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 394  0147 1e09          	ldw	x,(OFST-13,sp)
 395  0149 89            	pushw	x
 396  014a ae0012        	ldw	x,#L561
 397  014d cd0000        	call	_printf
 399  0150 85            	popw	x
 400                     ; 190                     failures++;
 402  0151 1e15          	ldw	x,(OFST-1,sp)
 403  0153 1c0001        	addw	x,#1
 404  0156 1f15          	ldw	(OFST-1,sp),x
 405  0158               L361:
 406                     ; 195                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 408  0158 1e03          	ldw	x,(OFST-19,sp)
 409  015a 89            	pushw	x
 410  015b ae0005        	ldw	x,#L761
 411  015e cd0000        	call	_printf
 413  0161 85            	popw	x
 414  0162               L161:
 415                     ; 176         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 417  0162 1e09          	ldw	x,(OFST-13,sp)
 418  0164 1c0001        	addw	x,#1
 419  0167 1f09          	ldw	(OFST-13,sp),x
 422  0169 9c            	rvf
 423  016a 1e09          	ldw	x,(OFST-13,sp)
 424  016c a30001        	cpw	x,#1
 425  016f 2fa0          	jrslt	L741
 426                     ; 203     return failures;
 428  0171 1e15          	ldw	x,(OFST-1,sp)
 429  0173 cd0000        	call	c_itolx
 433  0176 5b16          	addw	sp,#22
 434  0178 81            	ret
 478                     ; 217 static void test_thread_func (uint32_t param)
 478                     ; 218 {
 479                     .text:	section	.text,new
 480  0000               L51_test_thread_func:
 482  0000 88            	push	a
 483       00000001      OFST:	set	1
 486                     ; 222     param = param;
 488  0001 96            	ldw	x,sp
 489  0002 1c0004        	addw	x,#OFST+3
 490  0005 cd0000        	call	c_ltor
 492                     ; 225     if ((status = atomMutexGet (&mutex1, 0)) != ATOM_OK)
 494  0008 ae0000        	ldw	x,#0
 495  000b 89            	pushw	x
 496  000c ae0000        	ldw	x,#0
 497  000f 89            	pushw	x
 498  0010 ae0099        	ldw	x,#L3_mutex1
 499  0013 cd0000        	call	_atomMutexGet
 501  0016 5b04          	addw	sp,#4
 502  0018 6b01          	ld	(OFST+0,sp),a
 503  001a 270c          	jreq	L702
 504                     ; 228         ATOMLOG (_STR("G%d\n"), status);
 506  001c 7b01          	ld	a,(OFST+0,sp)
 507  001e 88            	push	a
 508  001f ae0000        	ldw	x,#L112
 509  0022 cd0000        	call	_printf
 511  0025 84            	pop	a
 513  0026 2006          	jra	L512
 514  0028               L702:
 515                     ; 235         shared_data = 1;
 517  0028 ae0001        	ldw	x,#1
 518  002b cf0000        	ldw	L11_shared_data,x
 519  002e               L512:
 520                     ; 241         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 522  002e ae0064        	ldw	x,#100
 523  0031 89            	pushw	x
 524  0032 ae0000        	ldw	x,#0
 525  0035 89            	pushw	x
 526  0036 cd0000        	call	_atomTimerDelay
 528  0039 5b04          	addw	sp,#4
 530  003b 20f1          	jra	L512
 568                     ; 255 static void testCallback (POINTER cb_data)
 568                     ; 256 {
 569                     .text:	section	.text,new
 570  0000               L31_testCallback:
 574                     ; 258     if (atomMutexPut(&mutex1) == ATOM_ERR_OWNERSHIP)
 576  0000 ae0099        	ldw	x,#L3_mutex1
 577  0003 cd0000        	call	_atomMutexPut
 579  0006 a1cf          	cp	a,#207
 580  0008 2606          	jrne	L142
 581                     ; 261         shared_data = 2;
 583  000a ae0002        	ldw	x,#2
 584  000d cf0000        	ldw	L11_shared_data,x
 586  0010               L142:
 587                     ; 268 }
 590  0010 81            	ret
 795                     	switch	.bss
 796  0000               L11_shared_data:
 797  0000 0000          	ds.b	2
 798  0002               L7_test_thread_stack:
 799  0002 000000000000  	ds.b	128
 800  0082               L5_tcb:
 801  0082 000000000000  	ds.b	23
 802  0099               L3_mutex1:
 803  0099 0000000000    	ds.b	5
 804                     	xref	_atomMutexPut
 805                     	xref	_atomMutexGet
 806                     	xref	_atomMutexDelete
 807                     	xref	_atomMutexCreate
 808                     	xdef	_test_start
 809                     	xref	_printf
 810                     	xref	_atomThreadStackCheck
 811                     	xref	_atomThreadCreate
 812                     	xref	_atomTimerDelay
 813                     	xref	_atomTimerRegister
 814                     .const:	section	.text
 815  0000               L112:
 816  0000 4725640a00    	dc.b	"G%d",10,0
 817  0005               L761:
 818  0005 537461636b55  	dc.b	"StackUse:%d",10,0
 819  0012               L561:
 820  0012 537461636b4f  	dc.b	"StackOverflow %d",10,0
 821  0024               L751:
 822  0024 537461636b43  	dc.b	"StackCheck",10,0
 823  0030               L541:
 824  0030 44656c657465  	dc.b	"Delete failed",10,0
 825  003f               L141:
 826  003f 436f6e746578  	dc.b	"Context check fail"
 827  0051 65640a00      	dc.b	"ed",10,0
 828  0055               L331:
 829  0055 4572726f7220  	dc.b	"Error registering "
 830  0067 74696d65720a  	dc.b	"timer",10,0
 831  006e               L721:
 832  006e 52656c656173  	dc.b	"Release error 2",10,0
 833  007f               L121:
 834  007f 536861726564  	dc.b	"Shared data unmodi"
 835  0091 666965640a00  	dc.b	"fied",10,0
 836  0097               L511:
 837  0097 4572726f7220  	dc.b	"Error creating tes"
 838  00a9 742074687265  	dc.b	"t thread",10,0
 839  00b3               L701:
 840  00b3 52656c656173  	dc.b	"Release error",10,0
 841  00c2               L101:
 842  00c2 4572726f7220  	dc.b	"Error creating mut"
 843  00d4 65780a00      	dc.b	"ex",10,0
 844                     	xref.b	c_x
 864                     	xref	c_ltor
 865                     	xref	c_itolx
 866                     	xref	c_lzmp
 867                     	xref	c_imul
 868                     	end
