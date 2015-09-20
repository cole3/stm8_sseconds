   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  86                     ; 88 uint32_t test_start (void)
  86                     ; 89 {
  88                     .text:	section	.text,new
  89  0000               _test_start:
  91  0000 520c          	subw	sp,#12
  92       0000000c      OFST:	set	12
  95                     ; 94     failures = 0;
  97  0002 5f            	clrw	x
  98  0003 1f09          	ldw	(OFST-3,sp),x
  99                     ; 97     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 101  0005 4b00          	push	#0
 102  0007 ae0261        	ldw	x,#L3_sem1
 103  000a cd0000        	call	_atomSemCreate
 105  000d 5b01          	addw	sp,#1
 106  000f 4d            	tnz	a
 107  0010 2711          	jreq	L15
 108                     ; 99         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 110  0012 ae0089        	ldw	x,#L35
 111  0015 cd0000        	call	_printf
 113                     ; 100         failures++;
 115  0018 1e09          	ldw	x,(OFST-3,sp)
 116  001a 1c0001        	addw	x,#1
 117  001d 1f09          	ldw	(OFST-3,sp),x
 119  001f aca501a5      	jpf	L55
 120  0023               L15:
 121                     ; 105         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO+1, test_thread_func, 1,
 121                     ; 106               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 121                     ; 107               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 123  0023 ae0080        	ldw	x,#128
 124  0026 89            	pushw	x
 125  0027 ae0000        	ldw	x,#0
 126  002a 89            	pushw	x
 127  002b ae0084        	ldw	x,#L7_test_thread_stack+127
 128  002e 89            	pushw	x
 129  002f ae0001        	ldw	x,#1
 130  0032 89            	pushw	x
 131  0033 ae0000        	ldw	x,#0
 132  0036 89            	pushw	x
 133  0037 ae0000        	ldw	x,#L51_test_thread_func
 134  003a 89            	pushw	x
 135  003b 4b11          	push	#17
 136  003d ae0205        	ldw	x,#L5_tcb
 137  0040 cd0000        	call	_atomThreadCreate
 139  0043 5b0d          	addw	sp,#13
 140  0045 4d            	tnz	a
 141  0046 270d          	jreq	L75
 142                     ; 110             ATOMLOG (_STR("Error creating test thread\n"));
 144  0048 ae006d        	ldw	x,#L16
 145  004b cd0000        	call	_printf
 147                     ; 111             failures++;
 149  004e 1e09          	ldw	x,(OFST-3,sp)
 150  0050 1c0001        	addw	x,#1
 151  0053 1f09          	ldw	(OFST-3,sp),x
 152  0055               L75:
 153                     ; 115         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 155  0055 ae0019        	ldw	x,#25
 156  0058 89            	pushw	x
 157  0059 ae0000        	ldw	x,#0
 158  005c 89            	pushw	x
 159  005d cd0000        	call	_atomTimerDelay
 161  0060 5b04          	addw	sp,#4
 162                     ; 118         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO+1, test_thread_func, 2,
 162                     ; 119               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 162                     ; 120               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 164  0062 ae0080        	ldw	x,#128
 165  0065 89            	pushw	x
 166  0066 ae0000        	ldw	x,#0
 167  0069 89            	pushw	x
 168  006a ae0104        	ldw	x,#L7_test_thread_stack+255
 169  006d 89            	pushw	x
 170  006e ae0002        	ldw	x,#2
 171  0071 89            	pushw	x
 172  0072 ae0000        	ldw	x,#0
 173  0075 89            	pushw	x
 174  0076 ae0000        	ldw	x,#L51_test_thread_func
 175  0079 89            	pushw	x
 176  007a 4b11          	push	#17
 177  007c ae021c        	ldw	x,#L5_tcb+23
 178  007f cd0000        	call	_atomThreadCreate
 180  0082 5b0d          	addw	sp,#13
 181  0084 4d            	tnz	a
 182  0085 270d          	jreq	L36
 183                     ; 123             ATOMLOG (_STR("Error creating test thread\n"));
 185  0087 ae006d        	ldw	x,#L16
 186  008a cd0000        	call	_printf
 188                     ; 124             failures++;
 190  008d 1e09          	ldw	x,(OFST-3,sp)
 191  008f 1c0001        	addw	x,#1
 192  0092 1f09          	ldw	(OFST-3,sp),x
 193  0094               L36:
 194                     ; 128         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 196  0094 ae0019        	ldw	x,#25
 197  0097 89            	pushw	x
 198  0098 ae0000        	ldw	x,#0
 199  009b 89            	pushw	x
 200  009c cd0000        	call	_atomTimerDelay
 202  009f 5b04          	addw	sp,#4
 203                     ; 131         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 203                     ; 132               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 203                     ; 133               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 205  00a1 ae0080        	ldw	x,#128
 206  00a4 89            	pushw	x
 207  00a5 ae0000        	ldw	x,#0
 208  00a8 89            	pushw	x
 209  00a9 ae0184        	ldw	x,#L7_test_thread_stack+383
 210  00ac 89            	pushw	x
 211  00ad ae0003        	ldw	x,#3
 212  00b0 89            	pushw	x
 213  00b1 ae0000        	ldw	x,#0
 214  00b4 89            	pushw	x
 215  00b5 ae0000        	ldw	x,#L51_test_thread_func
 216  00b8 89            	pushw	x
 217  00b9 4b10          	push	#16
 218  00bb ae0233        	ldw	x,#L5_tcb+46
 219  00be cd0000        	call	_atomThreadCreate
 221  00c1 5b0d          	addw	sp,#13
 222  00c3 4d            	tnz	a
 223  00c4 270d          	jreq	L56
 224                     ; 136             ATOMLOG (_STR("Error creating test thread\n"));
 226  00c6 ae006d        	ldw	x,#L16
 227  00c9 cd0000        	call	_printf
 229                     ; 137             failures++;
 231  00cc 1e09          	ldw	x,(OFST-3,sp)
 232  00ce 1c0001        	addw	x,#1
 233  00d1 1f09          	ldw	(OFST-3,sp),x
 234  00d3               L56:
 235                     ; 141         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 237  00d3 ae0019        	ldw	x,#25
 238  00d6 89            	pushw	x
 239  00d7 ae0000        	ldw	x,#0
 240  00da 89            	pushw	x
 241  00db cd0000        	call	_atomTimerDelay
 243  00de 5b04          	addw	sp,#4
 244                     ; 144         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 244                     ; 145               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 244                     ; 146               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 246  00e0 ae0080        	ldw	x,#128
 247  00e3 89            	pushw	x
 248  00e4 ae0000        	ldw	x,#0
 249  00e7 89            	pushw	x
 250  00e8 ae0204        	ldw	x,#L7_test_thread_stack+511
 251  00eb 89            	pushw	x
 252  00ec ae0004        	ldw	x,#4
 253  00ef 89            	pushw	x
 254  00f0 ae0000        	ldw	x,#0
 255  00f3 89            	pushw	x
 256  00f4 ae0000        	ldw	x,#L51_test_thread_func
 257  00f7 89            	pushw	x
 258  00f8 4b10          	push	#16
 259  00fa ae024a        	ldw	x,#L5_tcb+69
 260  00fd cd0000        	call	_atomThreadCreate
 262  0100 5b0d          	addw	sp,#13
 263  0102 4d            	tnz	a
 264  0103 270d          	jreq	L76
 265                     ; 149             ATOMLOG (_STR("Error creating test thread\n"));
 267  0105 ae006d        	ldw	x,#L16
 268  0108 cd0000        	call	_printf
 270                     ; 150             failures++;
 272  010b 1e09          	ldw	x,(OFST-3,sp)
 273  010d 1c0001        	addw	x,#1
 274  0110 1f09          	ldw	(OFST-3,sp),x
 275  0112               L76:
 276                     ; 154         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 278  0112 ae0019        	ldw	x,#25
 279  0115 89            	pushw	x
 280  0116 ae0000        	ldw	x,#0
 281  0119 89            	pushw	x
 282  011a cd0000        	call	_atomTimerDelay
 284  011d 5b04          	addw	sp,#4
 285                     ; 162         wake_cnt = 0;
 287  011f 725f0004      	clr	L11_wake_cnt
 288                     ; 169         for (i = 0; i < 4; i++)
 290  0123 5f            	clrw	x
 291  0124 1f0b          	ldw	(OFST-1,sp),x
 292  0126               L17:
 293                     ; 172             if (atomSemPut (&sem1) != ATOM_OK)
 295  0126 ae0261        	ldw	x,#L3_sem1
 296  0129 cd0000        	call	_atomSemPut
 298  012c 4d            	tnz	a
 299  012d 270d          	jreq	L77
 300                     ; 174                 ATOMLOG (_STR("Post fail\n"));
 302  012f ae0062        	ldw	x,#L101
 303  0132 cd0000        	call	_printf
 305                     ; 175                 failures++;
 307  0135 1e09          	ldw	x,(OFST-3,sp)
 308  0137 1c0001        	addw	x,#1
 309  013a 1f09          	ldw	(OFST-3,sp),x
 310  013c               L77:
 311                     ; 179             atomTimerDelay (SYSTEM_TICKS_PER_SEC / 4);
 313  013c ae0019        	ldw	x,#25
 314  013f 89            	pushw	x
 315  0140 ae0000        	ldw	x,#0
 316  0143 89            	pushw	x
 317  0144 cd0000        	call	_atomTimerDelay
 319  0147 5b04          	addw	sp,#4
 320                     ; 169         for (i = 0; i < 4; i++)
 322  0149 1e0b          	ldw	x,(OFST-1,sp)
 323  014b 1c0001        	addw	x,#1
 324  014e 1f0b          	ldw	(OFST-1,sp),x
 327  0150 9c            	rvf
 328  0151 1e0b          	ldw	x,(OFST-1,sp)
 329  0153 a30004        	cpw	x,#4
 330  0156 2fce          	jrslt	L17
 331                     ; 183         if ((wake_order[0] != 3) || (wake_order[1] != 4)
 331                     ; 184             || (wake_order[2] != 1) || (wake_order[3] != 2))
 333  0158 c60000        	ld	a,L31_wake_order
 334  015b a103          	cp	a,#3
 335  015d 2615          	jrne	L501
 337  015f c60001        	ld	a,L31_wake_order+1
 338  0162 a104          	cp	a,#4
 339  0164 260e          	jrne	L501
 341  0166 c60002        	ld	a,L31_wake_order+2
 342  0169 a101          	cp	a,#1
 343  016b 2607          	jrne	L501
 345  016d c60003        	ld	a,L31_wake_order+3
 346  0170 a102          	cp	a,#2
 347  0172 271b          	jreq	L301
 348  0174               L501:
 349                     ; 186             ATOMLOG (_STR("Bad order %d,%d,%d,%d\n"),
 349                     ; 187                 wake_order[0], wake_order[1], wake_order[2], wake_order[3]);
 351  0174 3b0003        	push	L31_wake_order+3
 352  0177 3b0002        	push	L31_wake_order+2
 353  017a 3b0001        	push	L31_wake_order+1
 354  017d 3b0000        	push	L31_wake_order
 355  0180 ae004b        	ldw	x,#L311
 356  0183 cd0000        	call	_printf
 358  0186 5b04          	addw	sp,#4
 359                     ; 188             failures++;
 361  0188 1e09          	ldw	x,(OFST-3,sp)
 362  018a 1c0001        	addw	x,#1
 363  018d 1f09          	ldw	(OFST-3,sp),x
 364  018f               L301:
 365                     ; 192         if (atomSemDelete (&sem1) != ATOM_OK)
 367  018f ae0261        	ldw	x,#L3_sem1
 368  0192 cd0000        	call	_atomSemDelete
 370  0195 4d            	tnz	a
 371  0196 270d          	jreq	L55
 372                     ; 194             ATOMLOG (_STR("Delete failed\n"));
 374  0198 ae003c        	ldw	x,#L711
 375  019b cd0000        	call	_printf
 377                     ; 195             failures++;
 379  019e 1e09          	ldw	x,(OFST-3,sp)
 380  01a0 1c0001        	addw	x,#1
 381  01a3 1f09          	ldw	(OFST-3,sp),x
 382  01a5               L55:
 383                     ; 206         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 385  01a5 5f            	clrw	x
 386  01a6 1f0b          	ldw	(OFST-1,sp),x
 387  01a8               L121:
 388                     ; 209             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 390  01a8 96            	ldw	x,sp
 391  01a9 1c0005        	addw	x,#OFST-7
 392  01ac 89            	pushw	x
 393  01ad 96            	ldw	x,sp
 394  01ae 1c0003        	addw	x,#OFST-9
 395  01b1 89            	pushw	x
 396  01b2 1e0f          	ldw	x,(OFST+3,sp)
 397  01b4 90ae0017      	ldw	y,#23
 398  01b8 cd0000        	call	c_imul
 400  01bb 1c0205        	addw	x,#L5_tcb
 401  01be cd0000        	call	_atomThreadStackCheck
 403  01c1 5b04          	addw	sp,#4
 404  01c3 4d            	tnz	a
 405  01c4 270f          	jreq	L721
 406                     ; 211                 ATOMLOG (_STR("StackCheck\n"));
 408  01c6 ae0030        	ldw	x,#L131
 409  01c9 cd0000        	call	_printf
 411                     ; 212                 failures++;
 413  01cc 1e09          	ldw	x,(OFST-3,sp)
 414  01ce 1c0001        	addw	x,#1
 415  01d1 1f09          	ldw	(OFST-3,sp),x
 417  01d3 2024          	jra	L331
 418  01d5               L721:
 419                     ; 217                 if (free_bytes == 0)
 421  01d5 96            	ldw	x,sp
 422  01d6 1c0005        	addw	x,#OFST-7
 423  01d9 cd0000        	call	c_lzmp
 425  01dc 2611          	jrne	L531
 426                     ; 219                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 428  01de 1e0b          	ldw	x,(OFST-1,sp)
 429  01e0 89            	pushw	x
 430  01e1 ae001e        	ldw	x,#L731
 431  01e4 cd0000        	call	_printf
 433  01e7 85            	popw	x
 434                     ; 220                     failures++;
 436  01e8 1e09          	ldw	x,(OFST-3,sp)
 437  01ea 1c0001        	addw	x,#1
 438  01ed 1f09          	ldw	(OFST-3,sp),x
 439  01ef               L531:
 440                     ; 225                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 442  01ef 1e03          	ldw	x,(OFST-9,sp)
 443  01f1 89            	pushw	x
 444  01f2 ae0011        	ldw	x,#L141
 445  01f5 cd0000        	call	_printf
 447  01f8 85            	popw	x
 448  01f9               L331:
 449                     ; 206         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 451  01f9 1e0b          	ldw	x,(OFST-1,sp)
 452  01fb 1c0001        	addw	x,#1
 453  01fe 1f0b          	ldw	(OFST-1,sp),x
 456  0200 9c            	rvf
 457  0201 1e0b          	ldw	x,(OFST-1,sp)
 458  0203 a30004        	cpw	x,#4
 459  0206 2fa0          	jrslt	L121
 460                     ; 233     return failures;
 462  0208 1e09          	ldw	x,(OFST-3,sp)
 463  020a cd0000        	call	c_itolx
 467  020d 5b0c          	addw	sp,#12
 468  020f 81            	ret
 513                     ; 249 static void test_thread_func (uint32_t param)
 513                     ; 250 {
 514                     .text:	section	.text,new
 515  0000               L51_test_thread_func:
 517  0000 88            	push	a
 518       00000001      OFST:	set	1
 521                     ; 254     thread_id = (uint8_t)param;
 523  0001 7b07          	ld	a,(OFST+6,sp)
 524  0003 6b01          	ld	(OFST+0,sp),a
 525                     ; 261     if (atomSemGet (&sem1, 0) != ATOM_OK)
 527  0005 ae0000        	ldw	x,#0
 528  0008 89            	pushw	x
 529  0009 ae0000        	ldw	x,#0
 530  000c 89            	pushw	x
 531  000d ae0261        	ldw	x,#L3_sem1
 532  0010 cd0000        	call	_atomSemGet
 534  0013 5b04          	addw	sp,#4
 535  0015 4d            	tnz	a
 536  0016 2708          	jreq	L161
 537                     ; 263         ATOMLOG (_STR("Thread sem fail\n"));
 539  0018 ae0000        	ldw	x,#L361
 540  001b cd0000        	call	_printf
 543  001e 2010          	jra	L761
 544  0020               L161:
 545                     ; 273         wake_order[wake_cnt++] = thread_id;
 547  0020 c60004        	ld	a,L11_wake_cnt
 548  0023 97            	ld	xl,a
 549  0024 725c0004      	inc	L11_wake_cnt
 550  0028 9f            	ld	a,xl
 551  0029 5f            	clrw	x
 552  002a 97            	ld	xl,a
 553  002b 7b01          	ld	a,(OFST+0,sp)
 554  002d d70000        	ld	(L31_wake_order,x),a
 555  0030               L761:
 556                     ; 279         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 558  0030 ae0064        	ldw	x,#100
 559  0033 89            	pushw	x
 560  0034 ae0000        	ldw	x,#0
 561  0037 89            	pushw	x
 562  0038 cd0000        	call	_atomTimerDelay
 564  003b 5b04          	addw	sp,#4
 566  003d 20f1          	jra	L761
 816                     	switch	.bss
 817  0000               L31_wake_order:
 818  0000 00000000      	ds.b	4
 819  0004               L11_wake_cnt:
 820  0004 00            	ds.b	1
 821  0005               L7_test_thread_stack:
 822  0005 000000000000  	ds.b	512
 823  0205               L5_tcb:
 824  0205 000000000000  	ds.b	92
 825  0261               L3_sem1:
 826  0261 000000        	ds.b	3
 827                     	xref	_atomSemPut
 828                     	xref	_atomSemGet
 829                     	xref	_atomSemDelete
 830                     	xref	_atomSemCreate
 831                     	xdef	_test_start
 832                     	xref	_printf
 833                     	xref	_atomThreadStackCheck
 834                     	xref	_atomThreadCreate
 835                     	xref	_atomTimerDelay
 836                     .const:	section	.text
 837  0000               L361:
 838  0000 546872656164  	dc.b	"Thread sem fail",10,0
 839  0011               L141:
 840  0011 537461636b55  	dc.b	"StackUse:%d",10,0
 841  001e               L731:
 842  001e 537461636b4f  	dc.b	"StackOverflow %d",10,0
 843  0030               L131:
 844  0030 537461636b43  	dc.b	"StackCheck",10,0
 845  003c               L711:
 846  003c 44656c657465  	dc.b	"Delete failed",10,0
 847  004b               L311:
 848  004b 426164206f72  	dc.b	"Bad order %d,%d,%d"
 849  005d 2c25640a00    	dc.b	",%d",10,0
 850  0062               L101:
 851  0062 506f73742066  	dc.b	"Post fail",10,0
 852  006d               L16:
 853  006d 4572726f7220  	dc.b	"Error creating tes"
 854  007f 742074687265  	dc.b	"t thread",10,0
 855  0089               L35:
 856  0089 4572726f7220  	dc.b	"Error creating tes"
 857  009b 742073656d61  	dc.b	"t semaphore 1",10,0
 858                     	xref.b	c_x
 878                     	xref	c_itolx
 879                     	xref	c_lzmp
 880                     	xref	c_imul
 881                     	end
