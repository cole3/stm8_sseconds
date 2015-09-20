   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  92                     ; 76 uint32_t test_start (void)
  92                     ; 77 {
  94                     .text:	section	.text,new
  95  0000               _test_start:
  97  0000 520d          	subw	sp,#13
  98       0000000d      OFST:	set	13
 101                     ; 82     failures = 0;
 103  0002 5f            	clrw	x
 104  0003 1f0a          	ldw	(OFST-3,sp),x
 105                     ; 85     msg = 0x66;
 107  0005 a666          	ld	a,#102
 108  0007 6b09          	ld	(OFST-4,sp),a
 109                     ; 88     g_result = 0;
 111  0009 5f            	clrw	x
 112  000a cf0000        	ldw	L31_g_result,x
 113                     ; 89     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 115  000d ae0010        	ldw	x,#16
 116  0010 89            	pushw	x
 117  0011 ae0000        	ldw	x,#0
 118  0014 89            	pushw	x
 119  0015 ae0001        	ldw	x,#1
 120  0018 89            	pushw	x
 121  0019 ae0000        	ldw	x,#0
 122  001c 89            	pushw	x
 123  001d ae0130        	ldw	x,#L5_queue1_storage
 124  0020 89            	pushw	x
 125  0021 ae0140        	ldw	x,#L3_queue1
 126  0024 cd0000        	call	_atomQueueCreate
 128  0027 5b0a          	addw	sp,#10
 129  0029 4d            	tnz	a
 130  002a 2711          	jreq	L55
 131                     ; 91         ATOMLOG (_STR("Error creating test queue\n"));
 133  002c ae0105        	ldw	x,#L75
 134  002f cd0000        	call	_printf
 136                     ; 92         failures++;
 138  0032 1e0a          	ldw	x,(OFST-3,sp)
 139  0034 1c0001        	addw	x,#1
 140  0037 1f0a          	ldw	(OFST-3,sp),x
 142  0039 acfe00fe      	jpf	L16
 143  003d               L55:
 144                     ; 99         for (i = 0; i < QUEUE_ENTRIES; i++)
 146  003d 5f            	clrw	x
 147  003e 1f0c          	ldw	(OFST-1,sp),x
 148  0040               L36:
 149                     ; 101             if (atomQueuePut (&queue1, 0, &msg) != ATOM_OK)
 151  0040 96            	ldw	x,sp
 152  0041 1c0009        	addw	x,#OFST-4
 153  0044 89            	pushw	x
 154  0045 ae0000        	ldw	x,#0
 155  0048 89            	pushw	x
 156  0049 ae0000        	ldw	x,#0
 157  004c 89            	pushw	x
 158  004d ae0140        	ldw	x,#L3_queue1
 159  0050 cd0000        	call	_atomQueuePut
 161  0053 5b06          	addw	sp,#6
 162  0055 4d            	tnz	a
 163  0056 270d          	jreq	L17
 164                     ; 103                 ATOMLOG (_STR("Error filling queue\n"));
 166  0058 ae00f0        	ldw	x,#L37
 167  005b cd0000        	call	_printf
 169                     ; 104                 failures++;
 171  005e 1e0a          	ldw	x,(OFST-3,sp)
 172  0060 1c0001        	addw	x,#1
 173  0063 1f0a          	ldw	(OFST-3,sp),x
 174  0065               L17:
 175                     ; 99         for (i = 0; i < QUEUE_ENTRIES; i++)
 177  0065 1e0c          	ldw	x,(OFST-1,sp)
 178  0067 1c0001        	addw	x,#1
 179  006a 1f0c          	ldw	(OFST-1,sp),x
 182  006c 9c            	rvf
 183  006d 1e0c          	ldw	x,(OFST-1,sp)
 184  006f a30010        	cpw	x,#16
 185  0072 2fcc          	jrslt	L36
 186                     ; 109         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test1_thread_func, 0,
 186                     ; 110                   &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 186                     ; 111                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 188  0074 ae0080        	ldw	x,#128
 189  0077 89            	pushw	x
 190  0078 ae0000        	ldw	x,#0
 191  007b 89            	pushw	x
 192  007c ae0081        	ldw	x,#L11_test_thread_stack+127
 193  007f 89            	pushw	x
 194  0080 ae0000        	ldw	x,#0
 195  0083 89            	pushw	x
 196  0084 ae0000        	ldw	x,#0
 197  0087 89            	pushw	x
 198  0088 ae0000        	ldw	x,#L51_test1_thread_func
 199  008b 89            	pushw	x
 200  008c 4b10          	push	#16
 201  008e ae0102        	ldw	x,#L7_tcb
 202  0091 cd0000        	call	_atomThreadCreate
 204  0094 5b0d          	addw	sp,#13
 205  0096 4d            	tnz	a
 206  0097 270f          	jreq	L57
 207                     ; 114             ATOMLOG (_STR("Error creating test thread 1\n"));
 209  0099 ae00d2        	ldw	x,#L77
 210  009c cd0000        	call	_printf
 212                     ; 115             failures++;
 214  009f 1e0a          	ldw	x,(OFST-3,sp)
 215  00a1 1c0001        	addw	x,#1
 216  00a4 1f0a          	ldw	(OFST-3,sp),x
 218  00a6 2056          	jra	L16
 219  00a8               L57:
 220                     ; 127             if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 222  00a8 ae0064        	ldw	x,#100
 223  00ab 89            	pushw	x
 224  00ac ae0000        	ldw	x,#0
 225  00af 89            	pushw	x
 226  00b0 cd0000        	call	_atomTimerDelay
 228  00b3 5b04          	addw	sp,#4
 229  00b5 4d            	tnz	a
 230  00b6 270f          	jreq	L301
 231                     ; 129                 ATOMLOG (_STR("Failed timer delay\n"));
 233  00b8 ae00be        	ldw	x,#L501
 234  00bb cd0000        	call	_printf
 236                     ; 130                 failures++;
 238  00be 1e0a          	ldw	x,(OFST-3,sp)
 239  00c0 1c0001        	addw	x,#1
 240  00c3 1f0a          	ldw	(OFST-3,sp),x
 242  00c5 2037          	jra	L16
 243  00c7               L301:
 244                     ; 135                 if (atomQueueDelete(&queue1) != ATOM_OK)
 246  00c7 ae0140        	ldw	x,#L3_queue1
 247  00ca cd0000        	call	_atomQueueDelete
 249  00cd 4d            	tnz	a
 250  00ce 270f          	jreq	L111
 251                     ; 137                     ATOMLOG (_STR("Failed queue1 delete\n"));
 253  00d0 ae00a8        	ldw	x,#L311
 254  00d3 cd0000        	call	_printf
 256                     ; 138                     failures++;
 258  00d6 1e0a          	ldw	x,(OFST-3,sp)
 259  00d8 1c0001        	addw	x,#1
 260  00db 1f0a          	ldw	(OFST-3,sp),x
 262  00dd 201f          	jra	L16
 263  00df               L111:
 264                     ; 143                     atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 266  00df ae0064        	ldw	x,#100
 267  00e2 89            	pushw	x
 268  00e3 ae0000        	ldw	x,#0
 269  00e6 89            	pushw	x
 270  00e7 cd0000        	call	_atomTimerDelay
 272  00ea 5b04          	addw	sp,#4
 273                     ; 144                     if (g_result == 0)
 275  00ec ce0000        	ldw	x,L31_g_result
 276  00ef 260d          	jrne	L16
 277                     ; 146                         ATOMLOG (_STR("Notify fail\n"));
 279  00f1 ae009b        	ldw	x,#L121
 280  00f4 cd0000        	call	_printf
 282                     ; 147                         failures++;
 284  00f7 1e0a          	ldw	x,(OFST-3,sp)
 285  00f9 1c0001        	addw	x,#1
 286  00fc 1f0a          	ldw	(OFST-3,sp),x
 288  00fe               L16:
 289                     ; 159     g_result = 0;
 291  00fe 5f            	clrw	x
 292  00ff cf0000        	ldw	L31_g_result,x
 293                     ; 160     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 295  0102 ae0010        	ldw	x,#16
 296  0105 89            	pushw	x
 297  0106 ae0000        	ldw	x,#0
 298  0109 89            	pushw	x
 299  010a ae0001        	ldw	x,#1
 300  010d 89            	pushw	x
 301  010e ae0000        	ldw	x,#0
 302  0111 89            	pushw	x
 303  0112 ae0130        	ldw	x,#L5_queue1_storage
 304  0115 89            	pushw	x
 305  0116 ae0140        	ldw	x,#L3_queue1
 306  0119 cd0000        	call	_atomQueueCreate
 308  011c 5b0a          	addw	sp,#10
 309  011e 4d            	tnz	a
 310  011f 2711          	jreq	L521
 311                     ; 162         ATOMLOG (_STR("Error creating test queue\n"));
 313  0121 ae0105        	ldw	x,#L75
 314  0124 cd0000        	call	_printf
 316                     ; 163         failures++;
 318  0127 1e0a          	ldw	x,(OFST-3,sp)
 319  0129 1c0001        	addw	x,#1
 320  012c 1f0a          	ldw	(OFST-3,sp),x
 322  012e acf301f3      	jpf	L721
 323  0132               L521:
 324                     ; 170         for (i = 0; i < QUEUE_ENTRIES; i++)
 326  0132 5f            	clrw	x
 327  0133 1f0c          	ldw	(OFST-1,sp),x
 328  0135               L131:
 329                     ; 172             if (atomQueuePut (&queue1, 0, &msg) != ATOM_OK)
 331  0135 96            	ldw	x,sp
 332  0136 1c0009        	addw	x,#OFST-4
 333  0139 89            	pushw	x
 334  013a ae0000        	ldw	x,#0
 335  013d 89            	pushw	x
 336  013e ae0000        	ldw	x,#0
 337  0141 89            	pushw	x
 338  0142 ae0140        	ldw	x,#L3_queue1
 339  0145 cd0000        	call	_atomQueuePut
 341  0148 5b06          	addw	sp,#6
 342  014a 4d            	tnz	a
 343  014b 270d          	jreq	L731
 344                     ; 174                 ATOMLOG (_STR("Error filling queue\n"));
 346  014d ae00f0        	ldw	x,#L37
 347  0150 cd0000        	call	_printf
 349                     ; 175                 failures++;
 351  0153 1e0a          	ldw	x,(OFST-3,sp)
 352  0155 1c0001        	addw	x,#1
 353  0158 1f0a          	ldw	(OFST-3,sp),x
 354  015a               L731:
 355                     ; 170         for (i = 0; i < QUEUE_ENTRIES; i++)
 357  015a 1e0c          	ldw	x,(OFST-1,sp)
 358  015c 1c0001        	addw	x,#1
 359  015f 1f0c          	ldw	(OFST-1,sp),x
 362  0161 9c            	rvf
 363  0162 1e0c          	ldw	x,(OFST-1,sp)
 364  0164 a30010        	cpw	x,#16
 365  0167 2fcc          	jrslt	L131
 366                     ; 180         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test2_thread_func, 0,
 366                     ; 181                   &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 366                     ; 182                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 368  0169 ae0080        	ldw	x,#128
 369  016c 89            	pushw	x
 370  016d ae0000        	ldw	x,#0
 371  0170 89            	pushw	x
 372  0171 ae0101        	ldw	x,#L11_test_thread_stack+255
 373  0174 89            	pushw	x
 374  0175 ae0000        	ldw	x,#0
 375  0178 89            	pushw	x
 376  0179 ae0000        	ldw	x,#0
 377  017c 89            	pushw	x
 378  017d ae0000        	ldw	x,#L71_test2_thread_func
 379  0180 89            	pushw	x
 380  0181 4b10          	push	#16
 381  0183 ae0119        	ldw	x,#L7_tcb+23
 382  0186 cd0000        	call	_atomThreadCreate
 384  0189 5b0d          	addw	sp,#13
 385  018b 4d            	tnz	a
 386  018c 270f          	jreq	L141
 387                     ; 185             ATOMLOG (_STR("Error creating test thread 2\n"));
 389  018e ae007d        	ldw	x,#L341
 390  0191 cd0000        	call	_printf
 392                     ; 186             failures++;
 394  0194 1e0a          	ldw	x,(OFST-3,sp)
 395  0196 1c0001        	addw	x,#1
 396  0199 1f0a          	ldw	(OFST-3,sp),x
 398  019b 2056          	jra	L721
 399  019d               L141:
 400                     ; 198             if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 402  019d ae0064        	ldw	x,#100
 403  01a0 89            	pushw	x
 404  01a1 ae0000        	ldw	x,#0
 405  01a4 89            	pushw	x
 406  01a5 cd0000        	call	_atomTimerDelay
 408  01a8 5b04          	addw	sp,#4
 409  01aa 4d            	tnz	a
 410  01ab 270f          	jreq	L741
 411                     ; 200                 ATOMLOG (_STR("Failed timer delay\n"));
 413  01ad ae00be        	ldw	x,#L501
 414  01b0 cd0000        	call	_printf
 416                     ; 201                 failures++;
 418  01b3 1e0a          	ldw	x,(OFST-3,sp)
 419  01b5 1c0001        	addw	x,#1
 420  01b8 1f0a          	ldw	(OFST-3,sp),x
 422  01ba 2037          	jra	L721
 423  01bc               L741:
 424                     ; 206                 if (atomQueueDelete(&queue1) != ATOM_OK)
 426  01bc ae0140        	ldw	x,#L3_queue1
 427  01bf cd0000        	call	_atomQueueDelete
 429  01c2 4d            	tnz	a
 430  01c3 270f          	jreq	L351
 431                     ; 208                     ATOMLOG (_STR("Failed queue1 delete\n"));
 433  01c5 ae00a8        	ldw	x,#L311
 434  01c8 cd0000        	call	_printf
 436                     ; 209                     failures++;
 438  01cb 1e0a          	ldw	x,(OFST-3,sp)
 439  01cd 1c0001        	addw	x,#1
 440  01d0 1f0a          	ldw	(OFST-3,sp),x
 442  01d2 201f          	jra	L721
 443  01d4               L351:
 444                     ; 214                     atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 446  01d4 ae0064        	ldw	x,#100
 447  01d7 89            	pushw	x
 448  01d8 ae0000        	ldw	x,#0
 449  01db 89            	pushw	x
 450  01dc cd0000        	call	_atomTimerDelay
 452  01df 5b04          	addw	sp,#4
 453                     ; 215                     if (g_result == 0)
 455  01e1 ce0000        	ldw	x,L31_g_result
 456  01e4 260d          	jrne	L721
 457                     ; 217                         ATOMLOG (_STR("Notify fail\n"));
 459  01e6 ae009b        	ldw	x,#L121
 460  01e9 cd0000        	call	_printf
 462                     ; 218                         failures++;
 464  01ec 1e0a          	ldw	x,(OFST-3,sp)
 465  01ee 1c0001        	addw	x,#1
 466  01f1 1f0a          	ldw	(OFST-3,sp),x
 468  01f3               L721:
 469                     ; 236         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 471  01f3 5f            	clrw	x
 472  01f4 1f0c          	ldw	(OFST-1,sp),x
 473  01f6               L361:
 474                     ; 239             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 476  01f6 96            	ldw	x,sp
 477  01f7 1c0005        	addw	x,#OFST-8
 478  01fa 89            	pushw	x
 479  01fb 96            	ldw	x,sp
 480  01fc 1c0003        	addw	x,#OFST-10
 481  01ff 89            	pushw	x
 482  0200 1e10          	ldw	x,(OFST+3,sp)
 483  0202 90ae0017      	ldw	y,#23
 484  0206 cd0000        	call	c_imul
 486  0209 1c0102        	addw	x,#L7_tcb
 487  020c cd0000        	call	_atomThreadStackCheck
 489  020f 5b04          	addw	sp,#4
 490  0211 4d            	tnz	a
 491  0212 270f          	jreq	L171
 492                     ; 241                 ATOMLOG (_STR("StackCheck\n"));
 494  0214 ae0071        	ldw	x,#L371
 495  0217 cd0000        	call	_printf
 497                     ; 242                 failures++;
 499  021a 1e0a          	ldw	x,(OFST-3,sp)
 500  021c 1c0001        	addw	x,#1
 501  021f 1f0a          	ldw	(OFST-3,sp),x
 503  0221 2024          	jra	L571
 504  0223               L171:
 505                     ; 247                 if (free_bytes == 0)
 507  0223 96            	ldw	x,sp
 508  0224 1c0005        	addw	x,#OFST-8
 509  0227 cd0000        	call	c_lzmp
 511  022a 2611          	jrne	L771
 512                     ; 249                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 514  022c 1e0c          	ldw	x,(OFST-1,sp)
 515  022e 89            	pushw	x
 516  022f ae005f        	ldw	x,#L102
 517  0232 cd0000        	call	_printf
 519  0235 85            	popw	x
 520                     ; 250                     failures++;
 522  0236 1e0a          	ldw	x,(OFST-3,sp)
 523  0238 1c0001        	addw	x,#1
 524  023b 1f0a          	ldw	(OFST-3,sp),x
 525  023d               L771:
 526                     ; 255                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 528  023d 1e03          	ldw	x,(OFST-10,sp)
 529  023f 89            	pushw	x
 530  0240 ae0052        	ldw	x,#L302
 531  0243 cd0000        	call	_printf
 533  0246 85            	popw	x
 534  0247               L571:
 535                     ; 236         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 537  0247 1e0c          	ldw	x,(OFST-1,sp)
 538  0249 1c0001        	addw	x,#1
 539  024c 1f0c          	ldw	(OFST-1,sp),x
 542  024e 9c            	rvf
 543  024f 1e0c          	ldw	x,(OFST-1,sp)
 544  0251 a30002        	cpw	x,#2
 545  0254 2fa0          	jrslt	L361
 546                     ; 263     return failures;
 548  0256 1e0a          	ldw	x,(OFST-3,sp)
 549  0258 cd0000        	call	c_itolx
 553  025b 5b0d          	addw	sp,#13
 554  025d 81            	ret
 605                     ; 276 static void test1_thread_func (uint32_t param)
 605                     ; 277 {
 606                     .text:	section	.text,new
 607  0000               L51_test1_thread_func:
 609  0000 89            	pushw	x
 610       00000002      OFST:	set	2
 613                     ; 281     param = param;
 615  0001 96            	ldw	x,sp
 616  0002 1c0005        	addw	x,#OFST+3
 617  0005 cd0000        	call	c_ltor
 619                     ; 284     msg = 0x66;
 621  0008 a666          	ld	a,#102
 622  000a 6b01          	ld	(OFST-1,sp),a
 623                     ; 291     status = atomQueuePut(&queue1, 0, &msg);
 625  000c 96            	ldw	x,sp
 626  000d 1c0001        	addw	x,#OFST-1
 627  0010 89            	pushw	x
 628  0011 ae0000        	ldw	x,#0
 629  0014 89            	pushw	x
 630  0015 ae0000        	ldw	x,#0
 631  0018 89            	pushw	x
 632  0019 ae0140        	ldw	x,#L3_queue1
 633  001c cd0000        	call	_atomQueuePut
 635  001f 5b06          	addw	sp,#6
 636  0021 6b02          	ld	(OFST+0,sp),a
 637                     ; 292     if (status != ATOM_ERR_DELETED)
 639  0023 7b02          	ld	a,(OFST+0,sp)
 640  0025 a1ca          	cp	a,#202
 641  0027 270c          	jreq	L522
 642                     ; 294         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 644  0029 7b02          	ld	a,(OFST+0,sp)
 645  002b 88            	push	a
 646  002c ae0029        	ldw	x,#L722
 647  002f cd0000        	call	_printf
 649  0032 84            	pop	a
 651  0033 2006          	jra	L332
 652  0035               L522:
 653                     ; 299         g_result = 1;
 655  0035 ae0001        	ldw	x,#1
 656  0038 cf0000        	ldw	L31_g_result,x
 657  003b               L332:
 658                     ; 305         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 660  003b ae0064        	ldw	x,#100
 661  003e 89            	pushw	x
 662  003f ae0000        	ldw	x,#0
 663  0042 89            	pushw	x
 664  0043 cd0000        	call	_atomTimerDelay
 666  0046 5b04          	addw	sp,#4
 668  0048 20f1          	jra	L332
 719                     ; 319 static void test2_thread_func (uint32_t param)
 719                     ; 320 {
 720                     .text:	section	.text,new
 721  0000               L71_test2_thread_func:
 723  0000 89            	pushw	x
 724       00000002      OFST:	set	2
 727                     ; 324     param = param;
 729  0001 96            	ldw	x,sp
 730  0002 1c0005        	addw	x,#OFST+3
 731  0005 cd0000        	call	c_ltor
 733                     ; 327     msg = 0x66;
 735  0008 a666          	ld	a,#102
 736  000a 6b01          	ld	(OFST-1,sp),a
 737                     ; 334     status = atomQueuePut(&queue1, (5 * SYSTEM_TICKS_PER_SEC), &msg);
 739  000c 96            	ldw	x,sp
 740  000d 1c0001        	addw	x,#OFST-1
 741  0010 89            	pushw	x
 742  0011 ae01f4        	ldw	x,#500
 743  0014 89            	pushw	x
 744  0015 ae0000        	ldw	x,#0
 745  0018 89            	pushw	x
 746  0019 ae0140        	ldw	x,#L3_queue1
 747  001c cd0000        	call	_atomQueuePut
 749  001f 5b06          	addw	sp,#6
 750  0021 6b02          	ld	(OFST+0,sp),a
 751                     ; 335     if (status != ATOM_ERR_DELETED)
 753  0023 7b02          	ld	a,(OFST+0,sp)
 754  0025 a1ca          	cp	a,#202
 755  0027 270c          	jreq	L752
 756                     ; 337         ATOMLOG (_STR("Test2 thread woke without deletion (%d)\n"), status);
 758  0029 7b02          	ld	a,(OFST+0,sp)
 759  002b 88            	push	a
 760  002c ae0000        	ldw	x,#L162
 761  002f cd0000        	call	_printf
 763  0032 84            	pop	a
 765  0033 2006          	jra	L562
 766  0035               L752:
 767                     ; 342         g_result = 1;
 769  0035 ae0001        	ldw	x,#1
 770  0038 cf0000        	ldw	L31_g_result,x
 771  003b               L562:
 772                     ; 348         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 774  003b ae0064        	ldw	x,#100
 775  003e 89            	pushw	x
 776  003f ae0000        	ldw	x,#0
 777  0042 89            	pushw	x
 778  0043 cd0000        	call	_atomTimerDelay
 780  0046 5b04          	addw	sp,#4
 782  0048 20f1          	jra	L562
1082                     	switch	.bss
1083  0000               L31_g_result:
1084  0000 0000          	ds.b	2
1085  0002               L11_test_thread_stack:
1086  0002 000000000000  	ds.b	256
1087  0102               L7_tcb:
1088  0102 000000000000  	ds.b	46
1089  0130               L5_queue1_storage:
1090  0130 000000000000  	ds.b	16
1091  0140               L3_queue1:
1092  0140 000000000000  	ds.b	26
1093                     	xdef	_test_start
1094                     	xref	_printf
1095                     	xref	_atomQueuePut
1096                     	xref	_atomQueueDelete
1097                     	xref	_atomQueueCreate
1098                     	xref	_atomThreadStackCheck
1099                     	xref	_atomThreadCreate
1100                     	xref	_atomTimerDelay
1101                     .const:	section	.text
1102  0000               L162:
1103  0000 546573743220  	dc.b	"Test2 thread woke "
1104  0012 776974686f75  	dc.b	"without deletion ("
1105  0024 2564290a00    	dc.b	"%d)",10,0
1106  0029               L722:
1107  0029 546573743120  	dc.b	"Test1 thread woke "
1108  003b 776974686f75  	dc.b	"without deletion ("
1109  004d 2564290a00    	dc.b	"%d)",10,0
1110  0052               L302:
1111  0052 537461636b55  	dc.b	"StackUse:%d",10,0
1112  005f               L102:
1113  005f 537461636b4f  	dc.b	"StackOverflow %d",10,0
1114  0071               L371:
1115  0071 537461636b43  	dc.b	"StackCheck",10,0
1116  007d               L341:
1117  007d 4572726f7220  	dc.b	"Error creating tes"
1118  008f 742074687265  	dc.b	"t thread 2",10,0
1119  009b               L121:
1120  009b 4e6f74696679  	dc.b	"Notify fail",10,0
1121  00a8               L311:
1122  00a8 4661696c6564  	dc.b	"Failed queue1 dele"
1123  00ba 74650a00      	dc.b	"te",10,0
1124  00be               L501:
1125  00be 4661696c6564  	dc.b	"Failed timer delay"
1126  00d0 0a00          	dc.b	10,0
1127  00d2               L77:
1128  00d2 4572726f7220  	dc.b	"Error creating tes"
1129  00e4 742074687265  	dc.b	"t thread 1",10,0
1130  00f0               L37:
1131  00f0 4572726f7220  	dc.b	"Error filling queu"
1132  0102 650a00        	dc.b	"e",10,0
1133  0105               L75:
1134  0105 4572726f7220  	dc.b	"Error creating tes"
1135  0117 742071756575  	dc.b	"t queue",10,0
1136                     	xref.b	c_x
1156                     	xref	c_ltor
1157                     	xref	c_itolx
1158                     	xref	c_lzmp
1159                     	xref	c_imul
1160                     	end
