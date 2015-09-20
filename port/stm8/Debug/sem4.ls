   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  85                     ; 76 uint32_t test_start (void)
  85                     ; 77 {
  87                     .text:	section	.text,new
  88  0000               _test_start:
  90  0000 520b          	subw	sp,#11
  91       0000000b      OFST:	set	11
  94                     ; 82     g_failures = 0;
  96  0002 5f            	clrw	x
  97  0003 cf0000        	ldw	L31_g_failures,x
  98                     ; 85     if (atomSemCreate (&sem1, 2) != ATOM_OK)
 100  0006 4b02          	push	#2
 101  0008 ae0261        	ldw	x,#L3_sem1
 102  000b cd0000        	call	_atomSemCreate
 104  000e 5b01          	addw	sp,#1
 105  0010 4d            	tnz	a
 106  0011 2713          	jreq	L15
 107                     ; 87         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 109  0013 ae006e        	ldw	x,#L35
 110  0016 cd0000        	call	_printf
 112                     ; 88         g_failures++;
 114  0019 ce0000        	ldw	x,L31_g_failures
 115  001c 1c0001        	addw	x,#1
 116  001f cf0000        	ldw	L31_g_failures,x
 118  0022 acc401c4      	jpf	L55
 119  0026               L15:
 120                     ; 91     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 122  0026 4b00          	push	#0
 123  0028 ae025e        	ldw	x,#L5_sem2
 124  002b cd0000        	call	_atomSemCreate
 126  002e 5b01          	addw	sp,#1
 127  0030 4d            	tnz	a
 128  0031 2713          	jreq	L75
 129                     ; 93         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 131  0033 ae006e        	ldw	x,#L35
 132  0036 cd0000        	call	_printf
 134                     ; 94         g_failures++;
 136  0039 ce0000        	ldw	x,L31_g_failures
 137  003c 1c0001        	addw	x,#1
 138  003f cf0000        	ldw	L31_g_failures,x
 140  0042 acc401c4      	jpf	L55
 141  0046               L75:
 142                     ; 99         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 142                     ; 100               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 142                     ; 101               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 144  0046 ae0080        	ldw	x,#128
 145  0049 89            	pushw	x
 146  004a ae0000        	ldw	x,#0
 147  004d 89            	pushw	x
 148  004e ae0081        	ldw	x,#L11_test_thread_stack+127
 149  0051 89            	pushw	x
 150  0052 ae0001        	ldw	x,#1
 151  0055 89            	pushw	x
 152  0056 ae0000        	ldw	x,#0
 153  0059 89            	pushw	x
 154  005a ae0000        	ldw	x,#L51_test_thread_func
 155  005d 89            	pushw	x
 156  005e 4b10          	push	#16
 157  0060 ae0202        	ldw	x,#L7_tcb
 158  0063 cd0000        	call	_atomThreadCreate
 160  0066 5b0d          	addw	sp,#13
 161  0068 4d            	tnz	a
 162  0069 271e          	jreq	L36
 163                     ; 104             ATOMLOG (_STR("Error creating test thread\n"));
 165  006b ae0052        	ldw	x,#L56
 166  006e cd0000        	call	_printf
 168                     ; 105             CRITICAL_START ();
 170  0071 96            	ldw	x,sp
 171  0072 1c0009        	addw	x,#OFST-2
 173  0075 8a            push CC
 174  0076 84            pop a
 175  0077 f7            ld (X),A
 176  0078 9b            sim
 178                     ; 106             g_failures++;
 180  0079 ce0000        	ldw	x,L31_g_failures
 181  007c 1c0001        	addw	x,#1
 182  007f cf0000        	ldw	L31_g_failures,x
 183                     ; 107             CRITICAL_END ();
 185  0082 96            	ldw	x,sp
 186  0083 1c0009        	addw	x,#OFST-2
 188  0086 f6            ld A,(X)
 189  0087 88            push A
 190  0088 86            pop CC
 192  0089               L36:
 193                     ; 111         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 2,
 193                     ; 112               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 193                     ; 113               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 195  0089 ae0080        	ldw	x,#128
 196  008c 89            	pushw	x
 197  008d ae0000        	ldw	x,#0
 198  0090 89            	pushw	x
 199  0091 ae0101        	ldw	x,#L11_test_thread_stack+255
 200  0094 89            	pushw	x
 201  0095 ae0002        	ldw	x,#2
 202  0098 89            	pushw	x
 203  0099 ae0000        	ldw	x,#0
 204  009c 89            	pushw	x
 205  009d ae0000        	ldw	x,#L51_test_thread_func
 206  00a0 89            	pushw	x
 207  00a1 4b10          	push	#16
 208  00a3 ae0219        	ldw	x,#L7_tcb+23
 209  00a6 cd0000        	call	_atomThreadCreate
 211  00a9 5b0d          	addw	sp,#13
 212  00ab 4d            	tnz	a
 213  00ac 271e          	jreq	L76
 214                     ; 116             ATOMLOG (_STR("Error creating test thread\n"));
 216  00ae ae0052        	ldw	x,#L56
 217  00b1 cd0000        	call	_printf
 219                     ; 117             CRITICAL_START ();
 221  00b4 96            	ldw	x,sp
 222  00b5 1c0009        	addw	x,#OFST-2
 224  00b8 8a            push CC
 225  00b9 84            pop a
 226  00ba f7            ld (X),A
 227  00bb 9b            sim
 229                     ; 118             g_failures++;
 231  00bc ce0000        	ldw	x,L31_g_failures
 232  00bf 1c0001        	addw	x,#1
 233  00c2 cf0000        	ldw	L31_g_failures,x
 234                     ; 119             CRITICAL_END ();
 236  00c5 96            	ldw	x,sp
 237  00c6 1c0009        	addw	x,#OFST-2
 239  00c9 f6            ld A,(X)
 240  00ca 88            push A
 241  00cb 86            pop CC
 243  00cc               L76:
 244                     ; 123         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 244                     ; 124               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 244                     ; 125               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 246  00cc ae0080        	ldw	x,#128
 247  00cf 89            	pushw	x
 248  00d0 ae0000        	ldw	x,#0
 249  00d3 89            	pushw	x
 250  00d4 ae0181        	ldw	x,#L11_test_thread_stack+383
 251  00d7 89            	pushw	x
 252  00d8 ae0003        	ldw	x,#3
 253  00db 89            	pushw	x
 254  00dc ae0000        	ldw	x,#0
 255  00df 89            	pushw	x
 256  00e0 ae0000        	ldw	x,#L51_test_thread_func
 257  00e3 89            	pushw	x
 258  00e4 4b10          	push	#16
 259  00e6 ae0230        	ldw	x,#L7_tcb+46
 260  00e9 cd0000        	call	_atomThreadCreate
 262  00ec 5b0d          	addw	sp,#13
 263  00ee 4d            	tnz	a
 264  00ef 271e          	jreq	L17
 265                     ; 128             ATOMLOG (_STR("Error creating test thread\n"));
 267  00f1 ae0052        	ldw	x,#L56
 268  00f4 cd0000        	call	_printf
 270                     ; 129             CRITICAL_START ();
 272  00f7 96            	ldw	x,sp
 273  00f8 1c0009        	addw	x,#OFST-2
 275  00fb 8a            push CC
 276  00fc 84            pop a
 277  00fd f7            ld (X),A
 278  00fe 9b            sim
 280                     ; 130             g_failures++;
 282  00ff ce0000        	ldw	x,L31_g_failures
 283  0102 1c0001        	addw	x,#1
 284  0105 cf0000        	ldw	L31_g_failures,x
 285                     ; 131             CRITICAL_END ();
 287  0108 96            	ldw	x,sp
 288  0109 1c0009        	addw	x,#OFST-2
 290  010c f6            ld A,(X)
 291  010d 88            push A
 292  010e 86            pop CC
 294  010f               L17:
 295                     ; 135         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 295                     ; 136               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 295                     ; 137               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 297  010f ae0080        	ldw	x,#128
 298  0112 89            	pushw	x
 299  0113 ae0000        	ldw	x,#0
 300  0116 89            	pushw	x
 301  0117 ae0201        	ldw	x,#L11_test_thread_stack+511
 302  011a 89            	pushw	x
 303  011b ae0004        	ldw	x,#4
 304  011e 89            	pushw	x
 305  011f ae0000        	ldw	x,#0
 306  0122 89            	pushw	x
 307  0123 ae0000        	ldw	x,#L51_test_thread_func
 308  0126 89            	pushw	x
 309  0127 4b10          	push	#16
 310  0129 ae0247        	ldw	x,#L7_tcb+69
 311  012c cd0000        	call	_atomThreadCreate
 313  012f 5b0d          	addw	sp,#13
 314  0131 4d            	tnz	a
 315  0132 271e          	jreq	L37
 316                     ; 140             ATOMLOG (_STR("Error creating test thread\n"));
 318  0134 ae0052        	ldw	x,#L56
 319  0137 cd0000        	call	_printf
 321                     ; 141             CRITICAL_START ();
 323  013a 96            	ldw	x,sp
 324  013b 1c0009        	addw	x,#OFST-2
 326  013e 8a            push CC
 327  013f 84            pop a
 328  0140 f7            ld (X),A
 329  0141 9b            sim
 331                     ; 142             g_failures++;
 333  0142 ce0000        	ldw	x,L31_g_failures
 334  0145 1c0001        	addw	x,#1
 335  0148 cf0000        	ldw	L31_g_failures,x
 336                     ; 143             CRITICAL_END ();
 338  014b 96            	ldw	x,sp
 339  014c 1c0009        	addw	x,#OFST-2
 341  014f f6            ld A,(X)
 342  0150 88            push A
 343  0151 86            pop CC
 345  0152               L37:
 346                     ; 151         finish_cnt = 0;
 348  0152 5f            	clrw	x
 349  0153 1f0a          	ldw	(OFST-1,sp),x
 350  0155               L57:
 351                     ; 159             if (atomSemGet (&sem2, 0) == ATOM_OK)
 353  0155 ae0000        	ldw	x,#0
 354  0158 89            	pushw	x
 355  0159 ae0000        	ldw	x,#0
 356  015c 89            	pushw	x
 357  015d ae025e        	ldw	x,#L5_sem2
 358  0160 cd0000        	call	_atomSemGet
 360  0163 5b04          	addw	sp,#4
 361  0165 4d            	tnz	a
 362  0166 26ed          	jrne	L57
 363                     ; 162                 finish_cnt++;
 365  0168 1e0a          	ldw	x,(OFST-1,sp)
 366  016a 1c0001        	addw	x,#1
 367  016d 1f0a          	ldw	(OFST-1,sp),x
 368                     ; 165                 if (finish_cnt == 4)
 370  016f 1e0a          	ldw	x,(OFST-1,sp)
 371  0171 a30004        	cpw	x,#4
 372  0174 26df          	jrne	L57
 373                     ; 167                     break;
 374                     ; 173         if (atomSemDelete (&sem1) != ATOM_OK)
 376  0176 ae0261        	ldw	x,#L3_sem1
 377  0179 cd0000        	call	_atomSemDelete
 379  017c 4d            	tnz	a
 380  017d 271e          	jreq	L501
 381                     ; 175             ATOMLOG (_STR("Delete failed\n"));
 383  017f ae0043        	ldw	x,#L701
 384  0182 cd0000        	call	_printf
 386                     ; 176             CRITICAL_START ();
 388  0185 96            	ldw	x,sp
 389  0186 1c0009        	addw	x,#OFST-2
 391  0189 8a            push CC
 392  018a 84            pop a
 393  018b f7            ld (X),A
 394  018c 9b            sim
 396                     ; 177             g_failures++;
 398  018d ce0000        	ldw	x,L31_g_failures
 399  0190 1c0001        	addw	x,#1
 400  0193 cf0000        	ldw	L31_g_failures,x
 401                     ; 178             CRITICAL_END ();
 403  0196 96            	ldw	x,sp
 404  0197 1c0009        	addw	x,#OFST-2
 406  019a f6            ld A,(X)
 407  019b 88            push A
 408  019c 86            pop CC
 410  019d               L501:
 411                     ; 180         if (atomSemDelete (&sem2) != ATOM_OK)
 413  019d ae025e        	ldw	x,#L5_sem2
 414  01a0 cd0000        	call	_atomSemDelete
 416  01a3 4d            	tnz	a
 417  01a4 271e          	jreq	L55
 418                     ; 182             ATOMLOG (_STR("Delete failed\n"));
 420  01a6 ae0043        	ldw	x,#L701
 421  01a9 cd0000        	call	_printf
 423                     ; 183             CRITICAL_START ();
 425  01ac 96            	ldw	x,sp
 426  01ad 1c0009        	addw	x,#OFST-2
 428  01b0 8a            push CC
 429  01b1 84            pop a
 430  01b2 f7            ld (X),A
 431  01b3 9b            sim
 433                     ; 184             g_failures++;
 435  01b4 ce0000        	ldw	x,L31_g_failures
 436  01b7 1c0001        	addw	x,#1
 437  01ba cf0000        	ldw	L31_g_failures,x
 438                     ; 185             CRITICAL_END ();
 440  01bd 96            	ldw	x,sp
 441  01be 1c0009        	addw	x,#OFST-2
 443  01c1 f6            ld A,(X)
 444  01c2 88            push A
 445  01c3 86            pop CC
 447  01c4               L55:
 448                     ; 196         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 450  01c4 5f            	clrw	x
 451  01c5 1f0a          	ldw	(OFST-1,sp),x
 452  01c7               L311:
 453                     ; 199             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 455  01c7 96            	ldw	x,sp
 456  01c8 1c0005        	addw	x,#OFST-6
 457  01cb 89            	pushw	x
 458  01cc 96            	ldw	x,sp
 459  01cd 1c0003        	addw	x,#OFST-8
 460  01d0 89            	pushw	x
 461  01d1 1e0e          	ldw	x,(OFST+3,sp)
 462  01d3 90ae0017      	ldw	y,#23
 463  01d7 cd0000        	call	c_imul
 465  01da 1c0202        	addw	x,#L7_tcb
 466  01dd cd0000        	call	_atomThreadStackCheck
 468  01e0 5b04          	addw	sp,#4
 469  01e2 4d            	tnz	a
 470  01e3 2711          	jreq	L121
 471                     ; 201                 ATOMLOG (_STR("StackCheck\n"));
 473  01e5 ae0037        	ldw	x,#L321
 474  01e8 cd0000        	call	_printf
 476                     ; 202                 g_failures++;
 478  01eb ce0000        	ldw	x,L31_g_failures
 479  01ee 1c0001        	addw	x,#1
 480  01f1 cf0000        	ldw	L31_g_failures,x
 482  01f4 2026          	jra	L521
 483  01f6               L121:
 484                     ; 207                 if (free_bytes == 0)
 486  01f6 96            	ldw	x,sp
 487  01f7 1c0005        	addw	x,#OFST-6
 488  01fa cd0000        	call	c_lzmp
 490  01fd 2613          	jrne	L721
 491                     ; 209                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 493  01ff 1e0a          	ldw	x,(OFST-1,sp)
 494  0201 89            	pushw	x
 495  0202 ae0025        	ldw	x,#L131
 496  0205 cd0000        	call	_printf
 498  0208 85            	popw	x
 499                     ; 210                     g_failures++;
 501  0209 ce0000        	ldw	x,L31_g_failures
 502  020c 1c0001        	addw	x,#1
 503  020f cf0000        	ldw	L31_g_failures,x
 504  0212               L721:
 505                     ; 215                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 507  0212 1e03          	ldw	x,(OFST-8,sp)
 508  0214 89            	pushw	x
 509  0215 ae0018        	ldw	x,#L331
 510  0218 cd0000        	call	_printf
 512  021b 85            	popw	x
 513  021c               L521:
 514                     ; 196         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 516  021c 1e0a          	ldw	x,(OFST-1,sp)
 517  021e 1c0001        	addw	x,#1
 518  0221 1f0a          	ldw	(OFST-1,sp),x
 521  0223 9c            	rvf
 522  0224 1e0a          	ldw	x,(OFST-1,sp)
 523  0226 a30004        	cpw	x,#4
 524  0229 2f9c          	jrslt	L311
 525                     ; 223     return g_failures;
 527  022b ce0000        	ldw	x,L31_g_failures
 528  022e cd0000        	call	c_itolx
 532  0231 5b0b          	addw	sp,#11
 533  0233 81            	ret
 593                     ; 238 static void test_thread_func (uint32_t param)
 593                     ; 239 {
 594                     .text:	section	.text,new
 595  0000               L51_test_thread_func:
 597  0000 5206          	subw	sp,#6
 598       00000006      OFST:	set	6
 601                     ; 245     param = param;
 603  0002 96            	ldw	x,sp
 604  0003 1c0009        	addw	x,#OFST+3
 605  0006 cd0000        	call	c_ltor
 607                     ; 248     loop_cnt = NUM_TEST_LOOPS;
 609  0009 ae2710        	ldw	x,#10000
 610  000c 1f03          	ldw	(OFST-3,sp),x
 611  000e ae0000        	ldw	x,#0
 612  0011 1f01          	ldw	(OFST-5,sp),x
 614  0013 aca400a4      	jpf	L361
 615  0017               L751:
 616                     ; 251         if ((status = atomSemGet (&sem1, 0)) != ATOM_OK)
 618  0017 ae0000        	ldw	x,#0
 619  001a 89            	pushw	x
 620  001b ae0000        	ldw	x,#0
 621  001e 89            	pushw	x
 622  001f ae0261        	ldw	x,#L3_sem1
 623  0022 cd0000        	call	_atomSemGet
 625  0025 5b04          	addw	sp,#4
 626  0027 6b05          	ld	(OFST-1,sp),a
 627  0029 2724          	jreq	L761
 628                     ; 254             ATOMLOG (_STR("G%d\n"), status);
 630  002b 7b05          	ld	a,(OFST-1,sp)
 631  002d 88            	push	a
 632  002e ae0013        	ldw	x,#L171
 633  0031 cd0000        	call	_printf
 635  0034 84            	pop	a
 636                     ; 255             CRITICAL_START ();
 638  0035 96            	ldw	x,sp
 639  0036 1c0006        	addw	x,#OFST+0
 641  0039 8a            push CC
 642  003a 84            pop a
 643  003b f7            ld (X),A
 644  003c 9b            sim
 646                     ; 256             g_failures++;
 648  003d ce0000        	ldw	x,L31_g_failures
 649  0040 1c0001        	addw	x,#1
 650  0043 cf0000        	ldw	L31_g_failures,x
 651                     ; 257             CRITICAL_END ();
 653  0046 96            	ldw	x,sp
 654  0047 1c0006        	addw	x,#OFST+0
 656  004a f6            ld A,(X)
 657  004b 88            push A
 658  004c 86            pop CC
 660                     ; 258             break;
 662  004d 202c          	jra	L561
 663  004f               L761:
 664                     ; 260         else if ((status = atomSemPut (&sem1)) != ATOM_OK)
 666  004f ae0261        	ldw	x,#L3_sem1
 667  0052 cd0000        	call	_atomSemPut
 669  0055 6b05          	ld	(OFST-1,sp),a
 670  0057 274b          	jreq	L361
 671                     ; 263             ATOMLOG (_STR("P%d\n"), status);
 673  0059 7b05          	ld	a,(OFST-1,sp)
 674  005b 88            	push	a
 675  005c ae000e        	ldw	x,#L771
 676  005f cd0000        	call	_printf
 678  0062 84            	pop	a
 679                     ; 264             CRITICAL_START ();
 681  0063 96            	ldw	x,sp
 682  0064 1c0006        	addw	x,#OFST+0
 684  0067 8a            push CC
 685  0068 84            pop a
 686  0069 f7            ld (X),A
 687  006a 9b            sim
 689                     ; 265             g_failures++;
 691  006b ce0000        	ldw	x,L31_g_failures
 692  006e 1c0001        	addw	x,#1
 693  0071 cf0000        	ldw	L31_g_failures,x
 694                     ; 266             CRITICAL_END ();
 696  0074 96            	ldw	x,sp
 697  0075 1c0006        	addw	x,#OFST+0
 699  0078 f6            ld A,(X)
 700  0079 88            push A
 701  007a 86            pop CC
 703                     ; 267             break;
 704  007b               L561:
 705                     ; 272     if (atomSemPut (&sem2) != ATOM_OK)
 707  007b ae025e        	ldw	x,#L5_sem2
 708  007e cd0000        	call	_atomSemPut
 710  0081 4d            	tnz	a
 711  0082 273a          	jreq	L502
 712                     ; 274         ATOMLOG (_STR("Sem2 putfail\n"));
 714  0084 ae0000        	ldw	x,#L302
 715  0087 cd0000        	call	_printf
 717                     ; 275         CRITICAL_START ();
 719  008a 96            	ldw	x,sp
 720  008b 1c0006        	addw	x,#OFST+0
 722  008e 8a            push CC
 723  008f 84            pop a
 724  0090 f7            ld (X),A
 725  0091 9b            sim
 727                     ; 276         g_failures++;
 729  0092 ce0000        	ldw	x,L31_g_failures
 730  0095 1c0001        	addw	x,#1
 731  0098 cf0000        	ldw	L31_g_failures,x
 732                     ; 277         CRITICAL_END ();
 734  009b 96            	ldw	x,sp
 735  009c 1c0006        	addw	x,#OFST+0
 737  009f f6            ld A,(X)
 738  00a0 88            push A
 739  00a1 86            pop CC
 741  00a2 201a          	jra	L502
 742  00a4               L361:
 743                     ; 249     while (loop_cnt--)
 745  00a4 96            	ldw	x,sp
 746  00a5 1c0001        	addw	x,#OFST-5
 747  00a8 cd0000        	call	c_ltor
 749  00ab 96            	ldw	x,sp
 750  00ac 1c0001        	addw	x,#OFST-5
 751  00af a601          	ld	a,#1
 752  00b1 cd0000        	call	c_lgsbc
 754  00b4 cd0000        	call	c_lrzmp
 756  00b7 2703          	jreq	L01
 757  00b9 cc0017        	jp	L751
 758  00bc               L01:
 759  00bc 20bd          	jra	L561
 760  00be               L502:
 761                     ; 283         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 763  00be ae0064        	ldw	x,#100
 764  00c1 89            	pushw	x
 765  00c2 ae0000        	ldw	x,#0
 766  00c5 89            	pushw	x
 767  00c6 cd0000        	call	_atomTimerDelay
 769  00c9 5b04          	addw	sp,#4
 771  00cb 20f1          	jra	L502
1021                     	switch	.bss
1022  0000               L31_g_failures:
1023  0000 0000          	ds.b	2
1024  0002               L11_test_thread_stack:
1025  0002 000000000000  	ds.b	512
1026  0202               L7_tcb:
1027  0202 000000000000  	ds.b	92
1028  025e               L5_sem2:
1029  025e 000000        	ds.b	3
1030  0261               L3_sem1:
1031  0261 000000        	ds.b	3
1032                     	xref	_atomSemPut
1033                     	xref	_atomSemGet
1034                     	xref	_atomSemDelete
1035                     	xref	_atomSemCreate
1036                     	xdef	_test_start
1037                     	xref	_printf
1038                     	xref	_atomThreadStackCheck
1039                     	xref	_atomThreadCreate
1040                     	xref	_atomTimerDelay
1041                     .const:	section	.text
1042  0000               L302:
1043  0000 53656d322070  	dc.b	"Sem2 putfail",10,0
1044  000e               L771:
1045  000e 5025640a00    	dc.b	"P%d",10,0
1046  0013               L171:
1047  0013 4725640a00    	dc.b	"G%d",10,0
1048  0018               L331:
1049  0018 537461636b55  	dc.b	"StackUse:%d",10,0
1050  0025               L131:
1051  0025 537461636b4f  	dc.b	"StackOverflow %d",10,0
1052  0037               L321:
1053  0037 537461636b43  	dc.b	"StackCheck",10,0
1054  0043               L701:
1055  0043 44656c657465  	dc.b	"Delete failed",10,0
1056  0052               L56:
1057  0052 4572726f7220  	dc.b	"Error creating tes"
1058  0064 742074687265  	dc.b	"t thread",10,0
1059  006e               L35:
1060  006e 4572726f7220  	dc.b	"Error creating tes"
1061  0080 742073656d61  	dc.b	"t semaphore 1",10,0
1062                     	xref.b	c_x
1082                     	xref	c_lrzmp
1083                     	xref	c_lgsbc
1084                     	xref	c_ltor
1085                     	xref	c_itolx
1086                     	xref	c_lzmp
1087                     	xref	c_imul
1088                     	end
