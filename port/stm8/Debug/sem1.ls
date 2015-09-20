   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  89                     .const:	section	.text
  90  0000               L6:
  91  0000 000003e8      	dc.l	1000
  94                     ; 64 uint32_t test_start (void)
  94                     ; 65 {
  95                     	scross	off
  96                     .text:	section	.text,new
  97  0000               _test_start:
  99  0000 5211          	subw	sp,#17
 100       00000011      OFST:	set	17
 103                     ; 71     failures = 0;
 105  0002 5f            	clrw	x
 106  0003 1f10          	ldw	(OFST-1,sp),x
 107                     ; 74     for (i = 0; i < 1000; i++)
 109  0005 ae0000        	ldw	x,#0
 110  0008 1f0e          	ldw	(OFST-3,sp),x
 111  000a ae0000        	ldw	x,#0
 112  000d 1f0c          	ldw	(OFST-5,sp),x
 113  000f               L35:
 114                     ; 76         if (atomSemCreate (&sem1, 0) == ATOM_OK)
 116  000f 4b00          	push	#0
 117  0011 ae0131        	ldw	x,#L3_sem1
 118  0014 cd0000        	call	_atomSemCreate
 120  0017 5b01          	addw	sp,#1
 121  0019 4d            	tnz	a
 122  001a 2632          	jrne	L16
 123                     ; 78             if (atomSemDelete (&sem1) == ATOM_OK)
 125  001c ae0131        	ldw	x,#L3_sem1
 126  001f cd0000        	call	_atomSemDelete
 128  0022 4d            	tnz	a
 129  0023 261a          	jrne	L36
 131  0025               L17:
 132                     ; 74     for (i = 0; i < 1000; i++)
 134  0025 96            	ldw	x,sp
 135  0026 1c000c        	addw	x,#OFST-5
 136  0029 a601          	ld	a,#1
 137  002b cd0000        	call	c_lgadc
 141  002e 96            	ldw	x,sp
 142  002f 1c000c        	addw	x,#OFST-5
 143  0032 cd0000        	call	c_ltor
 145  0035 ae0000        	ldw	x,#L6
 146  0038 cd0000        	call	c_lcmp
 148  003b 25d2          	jrult	L35
 149  003d 201c          	jra	L75
 150  003f               L36:
 151                     ; 85                 ATOMLOG (_STR("Error deleting semaphore\n"));
 153  003f ae01e6        	ldw	x,#L76
 154  0042 cd0000        	call	_printf
 156                     ; 86                 failures++;
 158  0045 1e10          	ldw	x,(OFST-1,sp)
 159  0047 1c0001        	addw	x,#1
 160  004a 1f10          	ldw	(OFST-1,sp),x
 161                     ; 87                 break;
 163  004c 200d          	jra	L75
 164  004e               L16:
 165                     ; 93             ATOMLOG (_STR("Error creating semaphore\n"));
 167  004e ae01cc        	ldw	x,#L37
 168  0051 cd0000        	call	_printf
 170                     ; 94             failures++;
 172  0054 1e10          	ldw	x,(OFST-1,sp)
 173  0056 1c0001        	addw	x,#1
 174  0059 1f10          	ldw	(OFST-1,sp),x
 175                     ; 95             break;
 176  005b               L75:
 177                     ; 100     if (atomSemCreate (NULL, 0) != ATOM_OK)
 179  005b 4b00          	push	#0
 180  005d 5f            	clrw	x
 181  005e cd0000        	call	_atomSemCreate
 183  0061 5b01          	addw	sp,#1
 184  0063 4d            	tnz	a
 185  0064 260d          	jrne	L77
 187                     ; 107         ATOMLOG (_STR("Bad semaphore creation checks\n"));
 189  0066 ae01ad        	ldw	x,#L101
 190  0069 cd0000        	call	_printf
 192                     ; 108         failures++;
 194  006c 1e10          	ldw	x,(OFST-1,sp)
 195  006e 1c0001        	addw	x,#1
 196  0071 1f10          	ldw	(OFST-1,sp),x
 197  0073               L77:
 198                     ; 112     if (atomSemDelete (NULL) != ATOM_OK)
 200  0073 5f            	clrw	x
 201  0074 cd0000        	call	_atomSemDelete
 203  0077 4d            	tnz	a
 204  0078 260d          	jrne	L501
 206                     ; 119         ATOMLOG (_STR("Bad semaphore deletion checks\n"));
 208  007a ae018e        	ldw	x,#L701
 209  007d cd0000        	call	_printf
 211                     ; 120         failures++;
 213  0080 1e10          	ldw	x,(OFST-1,sp)
 214  0082 1c0001        	addw	x,#1
 215  0085 1f10          	ldw	(OFST-1,sp),x
 216  0087               L501:
 217                     ; 124     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 219  0087 4b00          	push	#0
 220  0089 ae0131        	ldw	x,#L3_sem1
 221  008c cd0000        	call	_atomSemCreate
 223  008f 5b01          	addw	sp,#1
 224  0091 4d            	tnz	a
 225  0092 2711          	jreq	L111
 226                     ; 126         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 228  0094 ae016d        	ldw	x,#L311
 229  0097 cd0000        	call	_printf
 231                     ; 127         failures++;
 233  009a 1e10          	ldw	x,(OFST-1,sp)
 234  009c 1c0001        	addw	x,#1
 235  009f 1f10          	ldw	(OFST-1,sp),x
 237  00a1 ac6b016b      	jpf	L511
 238  00a5               L111:
 239                     ; 130     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 241  00a5 4b00          	push	#0
 242  00a7 ae012e        	ldw	x,#L5_sem2
 243  00aa cd0000        	call	_atomSemCreate
 245  00ad 5b01          	addw	sp,#1
 246  00af 4d            	tnz	a
 247  00b0 2711          	jreq	L711
 248                     ; 132         ATOMLOG (_STR("Error creating test semaphore 2\n"));
 250  00b2 ae014c        	ldw	x,#L121
 251  00b5 cd0000        	call	_printf
 253                     ; 133         failures++;
 255  00b8 1e10          	ldw	x,(OFST-1,sp)
 256  00ba 1c0001        	addw	x,#1
 257  00bd 1f10          	ldw	(OFST-1,sp),x
 259  00bf ac6b016b      	jpf	L511
 260  00c3               L711:
 261                     ; 136     else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test1_thread_func, 0,
 261                     ; 137               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 261                     ; 138               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 263  00c3 ae0080        	ldw	x,#128
 264  00c6 89            	pushw	x
 265  00c7 ae0000        	ldw	x,#0
 266  00ca 89            	pushw	x
 267  00cb ae007f        	ldw	x,#L11_test_thread_stack+127
 268  00ce 89            	pushw	x
 269  00cf ae0000        	ldw	x,#0
 270  00d2 89            	pushw	x
 271  00d3 ae0000        	ldw	x,#0
 272  00d6 89            	pushw	x
 273  00d7 ae0000        	ldw	x,#L31_test1_thread_func
 274  00da 89            	pushw	x
 275  00db 4b10          	push	#16
 276  00dd ae0100        	ldw	x,#L7_tcb
 277  00e0 cd0000        	call	_atomThreadCreate
 279  00e3 5b0d          	addw	sp,#13
 280  00e5 4d            	tnz	a
 281  00e6 270f          	jreq	L521
 282                     ; 141         ATOMLOG (_STR("Error creating test thread 1\n"));
 284  00e8 ae012e        	ldw	x,#L721
 285  00eb cd0000        	call	_printf
 287                     ; 142         failures++;
 289  00ee 1e10          	ldw	x,(OFST-1,sp)
 290  00f0 1c0001        	addw	x,#1
 291  00f3 1f10          	ldw	(OFST-1,sp),x
 293  00f5 2074          	jra	L511
 294  00f7               L521:
 295                     ; 156         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 297  00f7 ae0064        	ldw	x,#100
 298  00fa 89            	pushw	x
 299  00fb ae0000        	ldw	x,#0
 300  00fe 89            	pushw	x
 301  00ff cd0000        	call	_atomTimerDelay
 303  0102 5b04          	addw	sp,#4
 304  0104 4d            	tnz	a
 305  0105 270f          	jreq	L331
 306                     ; 158             ATOMLOG (_STR("Failed timer delay\n"));
 308  0107 ae011a        	ldw	x,#L531
 309  010a cd0000        	call	_printf
 311                     ; 159             failures++;
 313  010d 1e10          	ldw	x,(OFST-1,sp)
 314  010f 1c0001        	addw	x,#1
 315  0112 1f10          	ldw	(OFST-1,sp),x
 317  0114 2055          	jra	L511
 318  0116               L331:
 319                     ; 164             if (atomSemDelete(&sem1) != ATOM_OK)
 321  0116 ae0131        	ldw	x,#L3_sem1
 322  0119 cd0000        	call	_atomSemDelete
 324  011c 4d            	tnz	a
 325  011d 270f          	jreq	L141
 326                     ; 166                 ATOMLOG (_STR("Failed sem1 delete\n"));
 328  011f ae0106        	ldw	x,#L341
 329  0122 cd0000        	call	_printf
 331                     ; 167                 failures++;
 333  0125 1e10          	ldw	x,(OFST-1,sp)
 334  0127 1c0001        	addw	x,#1
 335  012a 1f10          	ldw	(OFST-1,sp),x
 337  012c 203d          	jra	L511
 338  012e               L141:
 339                     ; 172                 if ((status = atomSemGet (&sem2, (5*SYSTEM_TICKS_PER_SEC))) != ATOM_OK)
 341  012e ae01f4        	ldw	x,#500
 342  0131 89            	pushw	x
 343  0132 ae0000        	ldw	x,#0
 344  0135 89            	pushw	x
 345  0136 ae012e        	ldw	x,#L5_sem2
 346  0139 cd0000        	call	_atomSemGet
 348  013c 5b04          	addw	sp,#4
 349  013e 6b0b          	ld	(OFST-6,sp),a
 350  0140 2713          	jreq	L741
 351                     ; 174                     ATOMLOG (_STR("Notify fail (%d)\n"), status);
 353  0142 7b0b          	ld	a,(OFST-6,sp)
 354  0144 88            	push	a
 355  0145 ae00f4        	ldw	x,#L151
 356  0148 cd0000        	call	_printf
 358  014b 84            	pop	a
 359                     ; 175                     failures++;
 361  014c 1e10          	ldw	x,(OFST-1,sp)
 362  014e 1c0001        	addw	x,#1
 363  0151 1f10          	ldw	(OFST-1,sp),x
 365  0153 2016          	jra	L511
 366  0155               L741:
 367                     ; 182                     if (atomSemDelete (&sem2) != ATOM_OK)
 369  0155 ae012e        	ldw	x,#L5_sem2
 370  0158 cd0000        	call	_atomSemDelete
 372  015b 4d            	tnz	a
 373  015c 270d          	jreq	L511
 374                     ; 184                         ATOMLOG (_STR("Failed sem2 delete\n"));
 376  015e ae00e0        	ldw	x,#L751
 377  0161 cd0000        	call	_printf
 379                     ; 185                         failures++;
 381  0164 1e10          	ldw	x,(OFST-1,sp)
 382  0166 1c0001        	addw	x,#1
 383  0169 1f10          	ldw	(OFST-1,sp),x
 384  016b               L511:
 385                     ; 193     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 387  016b 4b00          	push	#0
 388  016d ae0131        	ldw	x,#L3_sem1
 389  0170 cd0000        	call	_atomSemCreate
 391  0173 5b01          	addw	sp,#1
 392  0175 4d            	tnz	a
 393  0176 2711          	jreq	L161
 394                     ; 195         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 396  0178 ae016d        	ldw	x,#L311
 397  017b cd0000        	call	_printf
 399                     ; 196         failures++;
 401  017e 1e10          	ldw	x,(OFST-1,sp)
 402  0180 1c0001        	addw	x,#1
 403  0183 1f10          	ldw	(OFST-1,sp),x
 405  0185 ac4f024f      	jpf	L361
 406  0189               L161:
 407                     ; 198     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 409  0189 4b00          	push	#0
 410  018b ae012e        	ldw	x,#L5_sem2
 411  018e cd0000        	call	_atomSemCreate
 413  0191 5b01          	addw	sp,#1
 414  0193 4d            	tnz	a
 415  0194 2711          	jreq	L561
 416                     ; 200         ATOMLOG (_STR("Error creating test semaphore 2\n"));
 418  0196 ae014c        	ldw	x,#L121
 419  0199 cd0000        	call	_printf
 421                     ; 201         failures++;
 423  019c 1e10          	ldw	x,(OFST-1,sp)
 424  019e 1c0001        	addw	x,#1
 425  01a1 1f10          	ldw	(OFST-1,sp),x
 427  01a3 ac4f024f      	jpf	L361
 428  01a7               L561:
 429                     ; 203     else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test2_thread_func, 0,
 429                     ; 204               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 429                     ; 205               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 431  01a7 ae0080        	ldw	x,#128
 432  01aa 89            	pushw	x
 433  01ab ae0000        	ldw	x,#0
 434  01ae 89            	pushw	x
 435  01af ae00ff        	ldw	x,#L11_test_thread_stack+255
 436  01b2 89            	pushw	x
 437  01b3 ae0000        	ldw	x,#0
 438  01b6 89            	pushw	x
 439  01b7 ae0000        	ldw	x,#0
 440  01ba 89            	pushw	x
 441  01bb ae0000        	ldw	x,#L51_test2_thread_func
 442  01be 89            	pushw	x
 443  01bf 4b10          	push	#16
 444  01c1 ae0117        	ldw	x,#L7_tcb+23
 445  01c4 cd0000        	call	_atomThreadCreate
 447  01c7 5b0d          	addw	sp,#13
 448  01c9 4d            	tnz	a
 449  01ca 270f          	jreq	L171
 450                     ; 208         ATOMLOG (_STR("Error creating test thread 2\n"));
 452  01cc ae00c2        	ldw	x,#L371
 453  01cf cd0000        	call	_printf
 455                     ; 209         failures++;
 457  01d2 1e10          	ldw	x,(OFST-1,sp)
 458  01d4 1c0001        	addw	x,#1
 459  01d7 1f10          	ldw	(OFST-1,sp),x
 461  01d9 2074          	jra	L361
 462  01db               L171:
 463                     ; 222         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 465  01db ae0064        	ldw	x,#100
 466  01de 89            	pushw	x
 467  01df ae0000        	ldw	x,#0
 468  01e2 89            	pushw	x
 469  01e3 cd0000        	call	_atomTimerDelay
 471  01e6 5b04          	addw	sp,#4
 472  01e8 4d            	tnz	a
 473  01e9 270f          	jreq	L771
 474                     ; 224             ATOMLOG (_STR("Failed timer delay\n"));
 476  01eb ae011a        	ldw	x,#L531
 477  01ee cd0000        	call	_printf
 479                     ; 225             failures++;
 481  01f1 1e10          	ldw	x,(OFST-1,sp)
 482  01f3 1c0001        	addw	x,#1
 483  01f6 1f10          	ldw	(OFST-1,sp),x
 485  01f8 2055          	jra	L361
 486  01fa               L771:
 487                     ; 230             if (atomSemDelete(&sem1) != ATOM_OK)
 489  01fa ae0131        	ldw	x,#L3_sem1
 490  01fd cd0000        	call	_atomSemDelete
 492  0200 4d            	tnz	a
 493  0201 270f          	jreq	L302
 494                     ; 232                 ATOMLOG (_STR("Failed sem1 delete\n"));
 496  0203 ae0106        	ldw	x,#L341
 497  0206 cd0000        	call	_printf
 499                     ; 233                 failures++;
 501  0209 1e10          	ldw	x,(OFST-1,sp)
 502  020b 1c0001        	addw	x,#1
 503  020e 1f10          	ldw	(OFST-1,sp),x
 505  0210 203d          	jra	L361
 506  0212               L302:
 507                     ; 238                 if ((status = atomSemGet (&sem2, (5*SYSTEM_TICKS_PER_SEC))) != ATOM_OK)
 509  0212 ae01f4        	ldw	x,#500
 510  0215 89            	pushw	x
 511  0216 ae0000        	ldw	x,#0
 512  0219 89            	pushw	x
 513  021a ae012e        	ldw	x,#L5_sem2
 514  021d cd0000        	call	_atomSemGet
 516  0220 5b04          	addw	sp,#4
 517  0222 6b0b          	ld	(OFST-6,sp),a
 518  0224 2713          	jreq	L702
 519                     ; 240                     ATOMLOG (_STR("Notify fail (%d)\n"), status);
 521  0226 7b0b          	ld	a,(OFST-6,sp)
 522  0228 88            	push	a
 523  0229 ae00f4        	ldw	x,#L151
 524  022c cd0000        	call	_printf
 526  022f 84            	pop	a
 527                     ; 241                     failures++;
 529  0230 1e10          	ldw	x,(OFST-1,sp)
 530  0232 1c0001        	addw	x,#1
 531  0235 1f10          	ldw	(OFST-1,sp),x
 533  0237 2016          	jra	L361
 534  0239               L702:
 535                     ; 248                     if (atomSemDelete (&sem2) != ATOM_OK)
 537  0239 ae012e        	ldw	x,#L5_sem2
 538  023c cd0000        	call	_atomSemDelete
 540  023f 4d            	tnz	a
 541  0240 270d          	jreq	L361
 542                     ; 250                         ATOMLOG (_STR("Failed sem2 delete\n"));
 544  0242 ae00e0        	ldw	x,#L751
 545  0245 cd0000        	call	_printf
 547                     ; 251                         failures++;
 549  0248 1e10          	ldw	x,(OFST-1,sp)
 550  024a 1c0001        	addw	x,#1
 551  024d 1f10          	ldw	(OFST-1,sp),x
 552  024f               L361:
 553                     ; 265         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 555  024f 5f            	clrw	x
 556  0250 1f09          	ldw	(OFST-8,sp),x
 557  0252               L512:
 558                     ; 268             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 560  0252 96            	ldw	x,sp
 561  0253 1c0005        	addw	x,#OFST-12
 562  0256 89            	pushw	x
 563  0257 96            	ldw	x,sp
 564  0258 1c0003        	addw	x,#OFST-14
 565  025b 89            	pushw	x
 566  025c 1e0d          	ldw	x,(OFST-4,sp)
 567  025e 90ae0017      	ldw	y,#23
 568  0262 cd0000        	call	c_imul
 570  0265 1c0100        	addw	x,#L7_tcb
 571  0268 cd0000        	call	_atomThreadStackCheck
 573  026b 5b04          	addw	sp,#4
 574  026d 4d            	tnz	a
 575  026e 270f          	jreq	L322
 576                     ; 270                 ATOMLOG (_STR("StackCheck\n"));
 578  0270 ae00b6        	ldw	x,#L522
 579  0273 cd0000        	call	_printf
 581                     ; 271                 failures++;
 583  0276 1e10          	ldw	x,(OFST-1,sp)
 584  0278 1c0001        	addw	x,#1
 585  027b 1f10          	ldw	(OFST-1,sp),x
 587  027d 2024          	jra	L722
 588  027f               L322:
 589                     ; 276                 if (free_bytes == 0)
 591  027f 96            	ldw	x,sp
 592  0280 1c0005        	addw	x,#OFST-12
 593  0283 cd0000        	call	c_lzmp
 595  0286 2611          	jrne	L132
 596                     ; 278                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 598  0288 1e09          	ldw	x,(OFST-8,sp)
 599  028a 89            	pushw	x
 600  028b ae00a4        	ldw	x,#L332
 601  028e cd0000        	call	_printf
 603  0291 85            	popw	x
 604                     ; 279                     failures++;
 606  0292 1e10          	ldw	x,(OFST-1,sp)
 607  0294 1c0001        	addw	x,#1
 608  0297 1f10          	ldw	(OFST-1,sp),x
 609  0299               L132:
 610                     ; 284                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 612  0299 1e03          	ldw	x,(OFST-14,sp)
 613  029b 89            	pushw	x
 614  029c ae0097        	ldw	x,#L532
 615  029f cd0000        	call	_printf
 617  02a2 85            	popw	x
 618  02a3               L722:
 619                     ; 265         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 621  02a3 1e09          	ldw	x,(OFST-8,sp)
 622  02a5 1c0001        	addw	x,#1
 623  02a8 1f09          	ldw	(OFST-8,sp),x
 626  02aa 9c            	rvf
 627  02ab 1e09          	ldw	x,(OFST-8,sp)
 628  02ad a30002        	cpw	x,#2
 629  02b0 2fa0          	jrslt	L512
 630                     ; 292     return failures;
 632  02b2 1e10          	ldw	x,(OFST-1,sp)
 633  02b4 cd0000        	call	c_itolx
 637  02b7 5b11          	addw	sp,#17
 638  02b9 81            	ret
 683                     ; 305 static void test1_thread_func (uint32_t param)
 683                     ; 306 {
 684                     .text:	section	.text,new
 685  0000               L31_test1_thread_func:
 687  0000 88            	push	a
 688       00000001      OFST:	set	1
 691                     ; 310     param = param;
 693  0001 96            	ldw	x,sp
 694  0002 1c0004        	addw	x,#OFST+3
 695  0005 cd0000        	call	c_ltor
 697                     ; 316     status = atomSemGet(&sem1, 0);
 699  0008 ae0000        	ldw	x,#0
 700  000b 89            	pushw	x
 701  000c ae0000        	ldw	x,#0
 702  000f 89            	pushw	x
 703  0010 ae0131        	ldw	x,#L3_sem1
 704  0013 cd0000        	call	_atomSemGet
 706  0016 5b04          	addw	sp,#4
 707  0018 6b01          	ld	(OFST+0,sp),a
 708                     ; 317     if (status != ATOM_ERR_DELETED)
 710  001a 7b01          	ld	a,(OFST+0,sp)
 711  001c a1ca          	cp	a,#202
 712  001e 270c          	jreq	L552
 713                     ; 319         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 715  0020 7b01          	ld	a,(OFST+0,sp)
 716  0022 88            	push	a
 717  0023 ae006e        	ldw	x,#L752
 718  0026 cd0000        	call	_printf
 720  0029 84            	pop	a
 722  002a 2014          	jra	L762
 723  002c               L552:
 724                     ; 324         if ((status = atomSemPut(&sem2)) != ATOM_OK)
 726  002c ae012e        	ldw	x,#L5_sem2
 727  002f cd0000        	call	_atomSemPut
 729  0032 6b01          	ld	(OFST+0,sp),a
 730  0034 270a          	jreq	L762
 731                     ; 326             ATOMLOG (_STR("Error posting sem2 on wakeup (%d)\n"), status);
 733  0036 7b01          	ld	a,(OFST+0,sp)
 734  0038 88            	push	a
 735  0039 ae004b        	ldw	x,#L562
 736  003c cd0000        	call	_printf
 738  003f 84            	pop	a
 739  0040               L762:
 740                     ; 333         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 742  0040 ae0064        	ldw	x,#100
 743  0043 89            	pushw	x
 744  0044 ae0000        	ldw	x,#0
 745  0047 89            	pushw	x
 746  0048 cd0000        	call	_atomTimerDelay
 748  004b 5b04          	addw	sp,#4
 750  004d 20f1          	jra	L762
 795                     ; 347 static void test2_thread_func (uint32_t param)
 795                     ; 348 {
 796                     .text:	section	.text,new
 797  0000               L51_test2_thread_func:
 799  0000 88            	push	a
 800       00000001      OFST:	set	1
 803                     ; 352     param = param;
 805  0001 96            	ldw	x,sp
 806  0002 1c0004        	addw	x,#OFST+3
 807  0005 cd0000        	call	c_ltor
 809                     ; 358     status = atomSemGet(&sem1, (5 * SYSTEM_TICKS_PER_SEC));
 811  0008 ae01f4        	ldw	x,#500
 812  000b 89            	pushw	x
 813  000c ae0000        	ldw	x,#0
 814  000f 89            	pushw	x
 815  0010 ae0131        	ldw	x,#L3_sem1
 816  0013 cd0000        	call	_atomSemGet
 818  0016 5b04          	addw	sp,#4
 819  0018 6b01          	ld	(OFST+0,sp),a
 820                     ; 359     if (status != ATOM_ERR_DELETED)
 822  001a 7b01          	ld	a,(OFST+0,sp)
 823  001c a1ca          	cp	a,#202
 824  001e 270c          	jreq	L113
 825                     ; 361         ATOMLOG (_STR("Test2 thread woke without deletion (%d)\n"), status);
 827  0020 7b01          	ld	a,(OFST+0,sp)
 828  0022 88            	push	a
 829  0023 ae0022        	ldw	x,#L313
 830  0026 cd0000        	call	_printf
 832  0029 84            	pop	a
 834  002a 2010          	jra	L323
 835  002c               L113:
 836                     ; 366         if ((status = atomSemPut(&sem2)) != ATOM_OK)
 838  002c ae012e        	ldw	x,#L5_sem2
 839  002f cd0000        	call	_atomSemPut
 841  0032 6b01          	ld	(OFST+0,sp),a
 842  0034 2706          	jreq	L323
 843                     ; 368             ATOMLOG (_STR("Error posting sem2 on wakeup\n"));
 845  0036 ae0004        	ldw	x,#L123
 846  0039 cd0000        	call	_printf
 848  003c               L323:
 849                     ; 375         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 851  003c ae0064        	ldw	x,#100
 852  003f 89            	pushw	x
 853  0040 ae0000        	ldw	x,#0
 854  0043 89            	pushw	x
 855  0044 cd0000        	call	_atomTimerDelay
 857  0047 5b04          	addw	sp,#4
 859  0049 20f1          	jra	L323
1100                     	switch	.bss
1101  0000               L11_test_thread_stack:
1102  0000 000000000000  	ds.b	256
1103  0100               L7_tcb:
1104  0100 000000000000  	ds.b	46
1105  012e               L5_sem2:
1106  012e 000000        	ds.b	3
1107  0131               L3_sem1:
1108  0131 000000        	ds.b	3
1109                     	xdef	_test_start
1110                     	xref	_printf
1111                     	xref	_atomSemPut
1112                     	xref	_atomSemGet
1113                     	xref	_atomSemDelete
1114                     	xref	_atomSemCreate
1115                     	xref	_atomThreadStackCheck
1116                     	xref	_atomThreadCreate
1117                     	xref	_atomTimerDelay
1118                     	switch	.const
1119  0004               L123:
1120  0004 4572726f7220  	dc.b	"Error posting sem2"
1121  0016 206f6e207761  	dc.b	" on wakeup",10,0
1122  0022               L313:
1123  0022 546573743220  	dc.b	"Test2 thread woke "
1124  0034 776974686f75  	dc.b	"without deletion ("
1125  0046 2564290a00    	dc.b	"%d)",10,0
1126  004b               L562:
1127  004b 4572726f7220  	dc.b	"Error posting sem2"
1128  005d 206f6e207761  	dc.b	" on wakeup (%d)",10,0
1129  006e               L752:
1130  006e 546573743120  	dc.b	"Test1 thread woke "
1131  0080 776974686f75  	dc.b	"without deletion ("
1132  0092 2564290a00    	dc.b	"%d)",10,0
1133  0097               L532:
1134  0097 537461636b55  	dc.b	"StackUse:%d",10,0
1135  00a4               L332:
1136  00a4 537461636b4f  	dc.b	"StackOverflow %d",10,0
1137  00b6               L522:
1138  00b6 537461636b43  	dc.b	"StackCheck",10,0
1139  00c2               L371:
1140  00c2 4572726f7220  	dc.b	"Error creating tes"
1141  00d4 742074687265  	dc.b	"t thread 2",10,0
1142  00e0               L751:
1143  00e0 4661696c6564  	dc.b	"Failed sem2 delete"
1144  00f2 0a00          	dc.b	10,0
1145  00f4               L151:
1146  00f4 4e6f74696679  	dc.b	"Notify fail (%d)",10,0
1147  0106               L341:
1148  0106 4661696c6564  	dc.b	"Failed sem1 delete"
1149  0118 0a00          	dc.b	10,0
1150  011a               L531:
1151  011a 4661696c6564  	dc.b	"Failed timer delay"
1152  012c 0a00          	dc.b	10,0
1153  012e               L721:
1154  012e 4572726f7220  	dc.b	"Error creating tes"
1155  0140 742074687265  	dc.b	"t thread 1",10,0
1156  014c               L121:
1157  014c 4572726f7220  	dc.b	"Error creating tes"
1158  015e 742073656d61  	dc.b	"t semaphore 2",10,0
1159  016d               L311:
1160  016d 4572726f7220  	dc.b	"Error creating tes"
1161  017f 742073656d61  	dc.b	"t semaphore 1",10,0
1162  018e               L701:
1163  018e 426164207365  	dc.b	"Bad semaphore dele"
1164  01a0 74696f6e2063  	dc.b	"tion checks",10,0
1165  01ad               L101:
1166  01ad 426164207365  	dc.b	"Bad semaphore crea"
1167  01bf 74696f6e2063  	dc.b	"tion checks",10,0
1168  01cc               L37:
1169  01cc 4572726f7220  	dc.b	"Error creating sem"
1170  01de 6170686f7265  	dc.b	"aphore",10,0
1171  01e6               L76:
1172  01e6 4572726f7220  	dc.b	"Error deleting sem"
1173  01f8 6170686f7265  	dc.b	"aphore",10,0
1174                     	xref.b	c_x
1194                     	xref	c_itolx
1195                     	xref	c_lzmp
1196                     	xref	c_imul
1197                     	xref	c_lcmp
1198                     	xref	c_ltor
1199                     	xref	c_lgadc
1200                     	end
