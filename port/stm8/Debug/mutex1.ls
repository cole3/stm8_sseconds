   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  82                     .const:	section	.text
  83  0000               L6:
  84  0000 000003e8      	dc.l	1000
  87                     ; 67 uint32_t test_start (void)
  87                     ; 68 {
  88                     	scross	off
  89                     .text:	section	.text,new
  90  0000               _test_start:
  92  0000 5210          	subw	sp,#16
  93       00000010      OFST:	set	16
  96                     ; 73     failures = 0;
  98  0002 5f            	clrw	x
  99  0003 1f0f          	ldw	(OFST-1,sp),x
 100                     ; 76     for (i = 0; i < 1000; i++)
 102  0005 ae0000        	ldw	x,#0
 103  0008 1f0d          	ldw	(OFST-3,sp),x
 104  000a ae0000        	ldw	x,#0
 105  000d 1f0b          	ldw	(OFST-5,sp),x
 106  000f               L15:
 107                     ; 78         if (atomMutexCreate (&mutex1) == ATOM_OK)
 109  000f ae0130        	ldw	x,#L3_mutex1
 110  0012 cd0000        	call	_atomMutexCreate
 112  0015 4d            	tnz	a
 113  0016 2632          	jrne	L75
 114                     ; 80             if (atomMutexDelete (&mutex1) == ATOM_OK)
 116  0018 ae0130        	ldw	x,#L3_mutex1
 117  001b cd0000        	call	_atomMutexDelete
 119  001e 4d            	tnz	a
 120  001f 261a          	jrne	L16
 122  0021               L76:
 123                     ; 76     for (i = 0; i < 1000; i++)
 125  0021 96            	ldw	x,sp
 126  0022 1c000b        	addw	x,#OFST-5
 127  0025 a601          	ld	a,#1
 128  0027 cd0000        	call	c_lgadc
 132  002a 96            	ldw	x,sp
 133  002b 1c000b        	addw	x,#OFST-5
 134  002e cd0000        	call	c_ltor
 136  0031 ae0000        	ldw	x,#L6
 137  0034 cd0000        	call	c_lcmp
 139  0037 25d6          	jrult	L15
 140  0039 201c          	jra	L55
 141  003b               L16:
 142                     ; 87                 ATOMLOG (_STR("Error deleting mutex\n"));
 144  003b ae016f        	ldw	x,#L56
 145  003e cd0000        	call	_printf
 147                     ; 88                 failures++;
 149  0041 1e0f          	ldw	x,(OFST-1,sp)
 150  0043 1c0001        	addw	x,#1
 151  0046 1f0f          	ldw	(OFST-1,sp),x
 152                     ; 89                 break;
 154  0048 200d          	jra	L55
 155  004a               L75:
 156                     ; 95             ATOMLOG (_STR("Error creating mutex\n"));
 158  004a ae0159        	ldw	x,#L17
 159  004d cd0000        	call	_printf
 161                     ; 96             failures++;
 163  0050 1e0f          	ldw	x,(OFST-1,sp)
 164  0052 1c0001        	addw	x,#1
 165  0055 1f0f          	ldw	(OFST-1,sp),x
 166                     ; 97             break;
 167  0057               L55:
 168                     ; 102     if (atomMutexCreate (NULL) != ATOM_OK)
 170  0057 5f            	clrw	x
 171  0058 cd0000        	call	_atomMutexCreate
 173  005b 4d            	tnz	a
 174  005c 260d          	jrne	L57
 176                     ; 109         ATOMLOG (_STR("Bad mutex creation checks\n"));
 178  005e ae013e        	ldw	x,#L77
 179  0061 cd0000        	call	_printf
 181                     ; 110         failures++;
 183  0064 1e0f          	ldw	x,(OFST-1,sp)
 184  0066 1c0001        	addw	x,#1
 185  0069 1f0f          	ldw	(OFST-1,sp),x
 186  006b               L57:
 187                     ; 114     if (atomMutexDelete (NULL) != ATOM_OK)
 189  006b 5f            	clrw	x
 190  006c cd0000        	call	_atomMutexDelete
 192  006f 4d            	tnz	a
 193  0070 260d          	jrne	L301
 195                     ; 121         ATOMLOG (_STR("Bad mutex deletion checks\n"));
 197  0072 ae0123        	ldw	x,#L501
 198  0075 cd0000        	call	_printf
 200                     ; 122         failures++;
 202  0078 1e0f          	ldw	x,(OFST-1,sp)
 203  007a 1c0001        	addw	x,#1
 204  007d 1f0f          	ldw	(OFST-1,sp),x
 205  007f               L301:
 206                     ; 126     g_result = 0;
 208  007f 5f            	clrw	x
 209  0080 cf0000        	ldw	L11_g_result,x
 210                     ; 127     if (atomMutexCreate (&mutex1) != ATOM_OK)
 212  0083 ae0130        	ldw	x,#L3_mutex1
 213  0086 cd0000        	call	_atomMutexCreate
 215  0089 4d            	tnz	a
 216  008a 2711          	jreq	L701
 217                     ; 129         ATOMLOG (_STR("Error creating test mutex\n"));
 219  008c ae0108        	ldw	x,#L111
 220  008f cd0000        	call	_printf
 222                     ; 130         failures++;
 224  0092 1e0f          	ldw	x,(OFST-1,sp)
 225  0094 1c0001        	addw	x,#1
 226  0097 1f0f          	ldw	(OFST-1,sp),x
 228  0099 ac4a014a      	jpf	L311
 229  009d               L701:
 230                     ; 134     else if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 232  009d ae0000        	ldw	x,#0
 233  00a0 89            	pushw	x
 234  00a1 ae0000        	ldw	x,#0
 235  00a4 89            	pushw	x
 236  00a5 ae0130        	ldw	x,#L3_mutex1
 237  00a8 cd0000        	call	_atomMutexGet
 239  00ab 5b04          	addw	sp,#4
 240  00ad 4d            	tnz	a
 241  00ae 2710          	jreq	L511
 242                     ; 136         ATOMLOG (_STR("Error taking mutex\n"));
 244  00b0 ae00f4        	ldw	x,#L711
 245  00b3 cd0000        	call	_printf
 247                     ; 137         failures++;
 249  00b6 1e0f          	ldw	x,(OFST-1,sp)
 250  00b8 1c0001        	addw	x,#1
 251  00bb 1f0f          	ldw	(OFST-1,sp),x
 253  00bd cc014a        	jra	L311
 254  00c0               L511:
 255                     ; 140     else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test1_thread_func, 0,
 255                     ; 141               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 255                     ; 142               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 257  00c0 ae0080        	ldw	x,#128
 258  00c3 89            	pushw	x
 259  00c4 ae0000        	ldw	x,#0
 260  00c7 89            	pushw	x
 261  00c8 ae0081        	ldw	x,#L7_test_thread_stack+127
 262  00cb 89            	pushw	x
 263  00cc ae0000        	ldw	x,#0
 264  00cf 89            	pushw	x
 265  00d0 ae0000        	ldw	x,#0
 266  00d3 89            	pushw	x
 267  00d4 ae0000        	ldw	x,#L31_test1_thread_func
 268  00d7 89            	pushw	x
 269  00d8 4b10          	push	#16
 270  00da ae0102        	ldw	x,#L5_tcb
 271  00dd cd0000        	call	_atomThreadCreate
 273  00e0 5b0d          	addw	sp,#13
 274  00e2 4d            	tnz	a
 275  00e3 270f          	jreq	L321
 276                     ; 145         ATOMLOG (_STR("Error creating test thread 1\n"));
 278  00e5 ae00d6        	ldw	x,#L521
 279  00e8 cd0000        	call	_printf
 281                     ; 146         failures++;
 283  00eb 1e0f          	ldw	x,(OFST-1,sp)
 284  00ed 1c0001        	addw	x,#1
 285  00f0 1f0f          	ldw	(OFST-1,sp),x
 287  00f2 2056          	jra	L311
 288  00f4               L321:
 289                     ; 158         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 291  00f4 ae0064        	ldw	x,#100
 292  00f7 89            	pushw	x
 293  00f8 ae0000        	ldw	x,#0
 294  00fb 89            	pushw	x
 295  00fc cd0000        	call	_atomTimerDelay
 297  00ff 5b04          	addw	sp,#4
 298  0101 4d            	tnz	a
 299  0102 270f          	jreq	L131
 300                     ; 160             ATOMLOG (_STR("Failed timer delay\n"));
 302  0104 ae00c2        	ldw	x,#L331
 303  0107 cd0000        	call	_printf
 305                     ; 161             failures++;
 307  010a 1e0f          	ldw	x,(OFST-1,sp)
 308  010c 1c0001        	addw	x,#1
 309  010f 1f0f          	ldw	(OFST-1,sp),x
 311  0111 2037          	jra	L311
 312  0113               L131:
 313                     ; 166             if (atomMutexDelete(&mutex1) != ATOM_OK)
 315  0113 ae0130        	ldw	x,#L3_mutex1
 316  0116 cd0000        	call	_atomMutexDelete
 318  0119 4d            	tnz	a
 319  011a 270f          	jreq	L731
 320                     ; 168                 ATOMLOG (_STR("Failed mutex1 delete\n"));
 322  011c ae00ac        	ldw	x,#L141
 323  011f cd0000        	call	_printf
 325                     ; 169                 failures++;
 327  0122 1e0f          	ldw	x,(OFST-1,sp)
 328  0124 1c0001        	addw	x,#1
 329  0127 1f0f          	ldw	(OFST-1,sp),x
 331  0129 201f          	jra	L311
 332  012b               L731:
 333                     ; 174                 atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 335  012b ae0064        	ldw	x,#100
 336  012e 89            	pushw	x
 337  012f ae0000        	ldw	x,#0
 338  0132 89            	pushw	x
 339  0133 cd0000        	call	_atomTimerDelay
 341  0136 5b04          	addw	sp,#4
 342                     ; 175                 if (g_result == 0)
 344  0138 ce0000        	ldw	x,L11_g_result
 345  013b 260d          	jrne	L311
 346                     ; 177                     ATOMLOG (_STR("Notify fail\n"));
 348  013d ae009f        	ldw	x,#L741
 349  0140 cd0000        	call	_printf
 351                     ; 178                     failures++;
 353  0143 1e0f          	ldw	x,(OFST-1,sp)
 354  0145 1c0001        	addw	x,#1
 355  0148 1f0f          	ldw	(OFST-1,sp),x
 357  014a               L311:
 358                     ; 189     g_result = 0;
 360  014a 5f            	clrw	x
 361  014b cf0000        	ldw	L11_g_result,x
 362                     ; 190     if (atomMutexCreate (&mutex1) != ATOM_OK)
 364  014e ae0130        	ldw	x,#L3_mutex1
 365  0151 cd0000        	call	_atomMutexCreate
 367  0154 4d            	tnz	a
 368  0155 2711          	jreq	L351
 369                     ; 192         ATOMLOG (_STR("Error creating test mutex\n"));
 371  0157 ae0108        	ldw	x,#L111
 372  015a cd0000        	call	_printf
 374                     ; 193         failures++;
 376  015d 1e0f          	ldw	x,(OFST-1,sp)
 377  015f 1c0001        	addw	x,#1
 378  0162 1f0f          	ldw	(OFST-1,sp),x
 380  0164 ac150215      	jpf	L551
 381  0168               L351:
 382                     ; 197     else if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 384  0168 ae0000        	ldw	x,#0
 385  016b 89            	pushw	x
 386  016c ae0000        	ldw	x,#0
 387  016f 89            	pushw	x
 388  0170 ae0130        	ldw	x,#L3_mutex1
 389  0173 cd0000        	call	_atomMutexGet
 391  0176 5b04          	addw	sp,#4
 392  0178 4d            	tnz	a
 393  0179 2710          	jreq	L751
 394                     ; 199         ATOMLOG (_STR("Error taking mutex\n"));
 396  017b ae00f4        	ldw	x,#L711
 397  017e cd0000        	call	_printf
 399                     ; 200         failures++;
 401  0181 1e0f          	ldw	x,(OFST-1,sp)
 402  0183 1c0001        	addw	x,#1
 403  0186 1f0f          	ldw	(OFST-1,sp),x
 405  0188 cc0215        	jra	L551
 406  018b               L751:
 407                     ; 203     else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test2_thread_func, 0,
 407                     ; 204               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 407                     ; 205               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 409  018b ae0080        	ldw	x,#128
 410  018e 89            	pushw	x
 411  018f ae0000        	ldw	x,#0
 412  0192 89            	pushw	x
 413  0193 ae0101        	ldw	x,#L7_test_thread_stack+255
 414  0196 89            	pushw	x
 415  0197 ae0000        	ldw	x,#0
 416  019a 89            	pushw	x
 417  019b ae0000        	ldw	x,#0
 418  019e 89            	pushw	x
 419  019f ae0000        	ldw	x,#L51_test2_thread_func
 420  01a2 89            	pushw	x
 421  01a3 4b10          	push	#16
 422  01a5 ae0119        	ldw	x,#L5_tcb+23
 423  01a8 cd0000        	call	_atomThreadCreate
 425  01ab 5b0d          	addw	sp,#13
 426  01ad 4d            	tnz	a
 427  01ae 270f          	jreq	L361
 428                     ; 208         ATOMLOG (_STR("Error creating test thread 2\n"));
 430  01b0 ae0081        	ldw	x,#L561
 431  01b3 cd0000        	call	_printf
 433                     ; 209         failures++;
 435  01b6 1e0f          	ldw	x,(OFST-1,sp)
 436  01b8 1c0001        	addw	x,#1
 437  01bb 1f0f          	ldw	(OFST-1,sp),x
 439  01bd 2056          	jra	L551
 440  01bf               L361:
 441                     ; 221         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 443  01bf ae0064        	ldw	x,#100
 444  01c2 89            	pushw	x
 445  01c3 ae0000        	ldw	x,#0
 446  01c6 89            	pushw	x
 447  01c7 cd0000        	call	_atomTimerDelay
 449  01ca 5b04          	addw	sp,#4
 450  01cc 4d            	tnz	a
 451  01cd 270f          	jreq	L171
 452                     ; 223             ATOMLOG (_STR("Failed timer delay\n"));
 454  01cf ae00c2        	ldw	x,#L331
 455  01d2 cd0000        	call	_printf
 457                     ; 224             failures++;
 459  01d5 1e0f          	ldw	x,(OFST-1,sp)
 460  01d7 1c0001        	addw	x,#1
 461  01da 1f0f          	ldw	(OFST-1,sp),x
 463  01dc 2037          	jra	L551
 464  01de               L171:
 465                     ; 229             if (atomMutexDelete(&mutex1) != ATOM_OK)
 467  01de ae0130        	ldw	x,#L3_mutex1
 468  01e1 cd0000        	call	_atomMutexDelete
 470  01e4 4d            	tnz	a
 471  01e5 270f          	jreq	L571
 472                     ; 231                 ATOMLOG (_STR("Failed mutex1 delete\n"));
 474  01e7 ae00ac        	ldw	x,#L141
 475  01ea cd0000        	call	_printf
 477                     ; 232                 failures++;
 479  01ed 1e0f          	ldw	x,(OFST-1,sp)
 480  01ef 1c0001        	addw	x,#1
 481  01f2 1f0f          	ldw	(OFST-1,sp),x
 483  01f4 201f          	jra	L551
 484  01f6               L571:
 485                     ; 237                 atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 487  01f6 ae0064        	ldw	x,#100
 488  01f9 89            	pushw	x
 489  01fa ae0000        	ldw	x,#0
 490  01fd 89            	pushw	x
 491  01fe cd0000        	call	_atomTimerDelay
 493  0201 5b04          	addw	sp,#4
 494                     ; 238                 if (g_result == 0)
 496  0203 ce0000        	ldw	x,L11_g_result
 497  0206 260d          	jrne	L551
 498                     ; 240                     ATOMLOG (_STR("Notify fail\n"));
 500  0208 ae009f        	ldw	x,#L741
 501  020b cd0000        	call	_printf
 503                     ; 241                     failures++;
 505  020e 1e0f          	ldw	x,(OFST-1,sp)
 506  0210 1c0001        	addw	x,#1
 507  0213 1f0f          	ldw	(OFST-1,sp),x
 509  0215               L551:
 510                     ; 258         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 512  0215 5f            	clrw	x
 513  0216 1f09          	ldw	(OFST-7,sp),x
 514  0218               L502:
 515                     ; 261             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 517  0218 96            	ldw	x,sp
 518  0219 1c0005        	addw	x,#OFST-11
 519  021c 89            	pushw	x
 520  021d 96            	ldw	x,sp
 521  021e 1c0003        	addw	x,#OFST-13
 522  0221 89            	pushw	x
 523  0222 1e0d          	ldw	x,(OFST-3,sp)
 524  0224 90ae0017      	ldw	y,#23
 525  0228 cd0000        	call	c_imul
 527  022b 1c0102        	addw	x,#L5_tcb
 528  022e cd0000        	call	_atomThreadStackCheck
 530  0231 5b04          	addw	sp,#4
 531  0233 4d            	tnz	a
 532  0234 270f          	jreq	L312
 533                     ; 263                 ATOMLOG (_STR("StackCheck\n"));
 535  0236 ae0075        	ldw	x,#L512
 536  0239 cd0000        	call	_printf
 538                     ; 264                 failures++;
 540  023c 1e0f          	ldw	x,(OFST-1,sp)
 541  023e 1c0001        	addw	x,#1
 542  0241 1f0f          	ldw	(OFST-1,sp),x
 544  0243 2024          	jra	L712
 545  0245               L312:
 546                     ; 269                 if (free_bytes == 0)
 548  0245 96            	ldw	x,sp
 549  0246 1c0005        	addw	x,#OFST-11
 550  0249 cd0000        	call	c_lzmp
 552  024c 2611          	jrne	L122
 553                     ; 271                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 555  024e 1e09          	ldw	x,(OFST-7,sp)
 556  0250 89            	pushw	x
 557  0251 ae0063        	ldw	x,#L322
 558  0254 cd0000        	call	_printf
 560  0257 85            	popw	x
 561                     ; 272                     failures++;
 563  0258 1e0f          	ldw	x,(OFST-1,sp)
 564  025a 1c0001        	addw	x,#1
 565  025d 1f0f          	ldw	(OFST-1,sp),x
 566  025f               L122:
 567                     ; 277                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 569  025f 1e03          	ldw	x,(OFST-13,sp)
 570  0261 89            	pushw	x
 571  0262 ae0056        	ldw	x,#L522
 572  0265 cd0000        	call	_printf
 574  0268 85            	popw	x
 575  0269               L712:
 576                     ; 258         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 578  0269 1e09          	ldw	x,(OFST-7,sp)
 579  026b 1c0001        	addw	x,#1
 580  026e 1f09          	ldw	(OFST-7,sp),x
 583  0270 9c            	rvf
 584  0271 1e09          	ldw	x,(OFST-7,sp)
 585  0273 a30002        	cpw	x,#2
 586  0276 2fa0          	jrslt	L502
 587                     ; 285     return failures;
 589  0278 1e0f          	ldw	x,(OFST-1,sp)
 590  027a cd0000        	call	c_itolx
 594  027d 5b10          	addw	sp,#16
 595  027f 81            	ret
 639                     ; 298 static void test1_thread_func (uint32_t param)
 639                     ; 299 {
 640                     .text:	section	.text,new
 641  0000               L31_test1_thread_func:
 643  0000 88            	push	a
 644       00000001      OFST:	set	1
 647                     ; 303     param = param;
 649  0001 96            	ldw	x,sp
 650  0002 1c0004        	addw	x,#OFST+3
 651  0005 cd0000        	call	c_ltor
 653                     ; 309     status = atomMutexGet(&mutex1, 0);
 655  0008 ae0000        	ldw	x,#0
 656  000b 89            	pushw	x
 657  000c ae0000        	ldw	x,#0
 658  000f 89            	pushw	x
 659  0010 ae0130        	ldw	x,#L3_mutex1
 660  0013 cd0000        	call	_atomMutexGet
 662  0016 5b04          	addw	sp,#4
 663  0018 6b01          	ld	(OFST+0,sp),a
 664                     ; 310     if (status != ATOM_ERR_DELETED)
 666  001a 7b01          	ld	a,(OFST+0,sp)
 667  001c a1ca          	cp	a,#202
 668  001e 270c          	jreq	L542
 669                     ; 312         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 671  0020 7b01          	ld	a,(OFST+0,sp)
 672  0022 88            	push	a
 673  0023 ae002d        	ldw	x,#L742
 674  0026 cd0000        	call	_printf
 676  0029 84            	pop	a
 678  002a 2006          	jra	L352
 679  002c               L542:
 680                     ; 317         g_result = 1;
 682  002c ae0001        	ldw	x,#1
 683  002f cf0000        	ldw	L11_g_result,x
 684  0032               L352:
 685                     ; 323         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 687  0032 ae0064        	ldw	x,#100
 688  0035 89            	pushw	x
 689  0036 ae0000        	ldw	x,#0
 690  0039 89            	pushw	x
 691  003a cd0000        	call	_atomTimerDelay
 693  003d 5b04          	addw	sp,#4
 695  003f 20f1          	jra	L352
 739                     ; 337 static void test2_thread_func (uint32_t param)
 739                     ; 338 {
 740                     .text:	section	.text,new
 741  0000               L51_test2_thread_func:
 743  0000 88            	push	a
 744       00000001      OFST:	set	1
 747                     ; 342     param = param;
 749  0001 96            	ldw	x,sp
 750  0002 1c0004        	addw	x,#OFST+3
 751  0005 cd0000        	call	c_ltor
 753                     ; 348     status = atomMutexGet(&mutex1, (5 * SYSTEM_TICKS_PER_SEC));
 755  0008 ae01f4        	ldw	x,#500
 756  000b 89            	pushw	x
 757  000c ae0000        	ldw	x,#0
 758  000f 89            	pushw	x
 759  0010 ae0130        	ldw	x,#L3_mutex1
 760  0013 cd0000        	call	_atomMutexGet
 762  0016 5b04          	addw	sp,#4
 763  0018 6b01          	ld	(OFST+0,sp),a
 764                     ; 349     if (status != ATOM_ERR_DELETED)
 766  001a 7b01          	ld	a,(OFST+0,sp)
 767  001c a1ca          	cp	a,#202
 768  001e 270c          	jreq	L572
 769                     ; 351         ATOMLOG (_STR("Test2 thread woke without deletion (%d)\n"), status);
 771  0020 7b01          	ld	a,(OFST+0,sp)
 772  0022 88            	push	a
 773  0023 ae0004        	ldw	x,#L772
 774  0026 cd0000        	call	_printf
 776  0029 84            	pop	a
 778  002a 2006          	jra	L303
 779  002c               L572:
 780                     ; 356         g_result = 1;
 782  002c ae0001        	ldw	x,#1
 783  002f cf0000        	ldw	L11_g_result,x
 784  0032               L303:
 785                     ; 362         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 787  0032 ae0064        	ldw	x,#100
 788  0035 89            	pushw	x
 789  0036 ae0000        	ldw	x,#0
 790  0039 89            	pushw	x
 791  003a cd0000        	call	_atomTimerDelay
 793  003d 5b04          	addw	sp,#4
 795  003f 20f1          	jra	L303
1047                     	switch	.bss
1048  0000               L11_g_result:
1049  0000 0000          	ds.b	2
1050  0002               L7_test_thread_stack:
1051  0002 000000000000  	ds.b	256
1052  0102               L5_tcb:
1053  0102 000000000000  	ds.b	46
1054  0130               L3_mutex1:
1055  0130 0000000000    	ds.b	5
1056                     	xdef	_test_start
1057                     	xref	_printf
1058                     	xref	_atomMutexGet
1059                     	xref	_atomMutexDelete
1060                     	xref	_atomMutexCreate
1061                     	xref	_atomThreadStackCheck
1062                     	xref	_atomThreadCreate
1063                     	xref	_atomTimerDelay
1064                     	switch	.const
1065  0004               L772:
1066  0004 546573743220  	dc.b	"Test2 thread woke "
1067  0016 776974686f75  	dc.b	"without deletion ("
1068  0028 2564290a00    	dc.b	"%d)",10,0
1069  002d               L742:
1070  002d 546573743120  	dc.b	"Test1 thread woke "
1071  003f 776974686f75  	dc.b	"without deletion ("
1072  0051 2564290a00    	dc.b	"%d)",10,0
1073  0056               L522:
1074  0056 537461636b55  	dc.b	"StackUse:%d",10,0
1075  0063               L322:
1076  0063 537461636b4f  	dc.b	"StackOverflow %d",10,0
1077  0075               L512:
1078  0075 537461636b43  	dc.b	"StackCheck",10,0
1079  0081               L561:
1080  0081 4572726f7220  	dc.b	"Error creating tes"
1081  0093 742074687265  	dc.b	"t thread 2",10,0
1082  009f               L741:
1083  009f 4e6f74696679  	dc.b	"Notify fail",10,0
1084  00ac               L141:
1085  00ac 4661696c6564  	dc.b	"Failed mutex1 dele"
1086  00be 74650a00      	dc.b	"te",10,0
1087  00c2               L331:
1088  00c2 4661696c6564  	dc.b	"Failed timer delay"
1089  00d4 0a00          	dc.b	10,0
1090  00d6               L521:
1091  00d6 4572726f7220  	dc.b	"Error creating tes"
1092  00e8 742074687265  	dc.b	"t thread 1",10,0
1093  00f4               L711:
1094  00f4 4572726f7220  	dc.b	"Error taking mutex"
1095  0106 0a00          	dc.b	10,0
1096  0108               L111:
1097  0108 4572726f7220  	dc.b	"Error creating tes"
1098  011a 74206d757465  	dc.b	"t mutex",10,0
1099  0123               L501:
1100  0123 426164206d75  	dc.b	"Bad mutex deletion"
1101  0135 20636865636b  	dc.b	" checks",10,0
1102  013e               L77:
1103  013e 426164206d75  	dc.b	"Bad mutex creation"
1104  0150 20636865636b  	dc.b	" checks",10,0
1105  0159               L17:
1106  0159 4572726f7220  	dc.b	"Error creating mut"
1107  016b 65780a00      	dc.b	"ex",10,0
1108  016f               L56:
1109  016f 4572726f7220  	dc.b	"Error deleting mut"
1110  0181 65780a00      	dc.b	"ex",10,0
1111                     	xref.b	c_x
1131                     	xref	c_itolx
1132                     	xref	c_lzmp
1133                     	xref	c_imul
1134                     	xref	c_lcmp
1135                     	xref	c_ltor
1136                     	xref	c_lgadc
1137                     	end
