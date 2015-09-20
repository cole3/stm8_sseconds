   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  89                     ; 73 uint32_t test_start (void)
  89                     ; 74 {
  91                     .text:	section	.text,new
  92  0000               _test_start:
  94  0000 520b          	subw	sp,#11
  95       0000000b      OFST:	set	11
  98                     ; 79     g_failures = 0;
 100  0002 5f            	clrw	x
 101  0003 cf0000        	ldw	L31_g_failures,x
 102                     ; 82     if (atomMutexCreate (&mutex1) != ATOM_OK)
 104  0006 ae0261        	ldw	x,#L3_mutex1
 105  0009 cd0000        	call	_atomMutexCreate
 107  000c 4d            	tnz	a
 108  000d 2713          	jreq	L15
 109                     ; 84         ATOMLOG (_STR("Error creating mutex\n"));
 111  000f ae00ab        	ldw	x,#L35
 112  0012 cd0000        	call	_printf
 114                     ; 85         g_failures++;
 116  0015 ce0000        	ldw	x,L31_g_failures
 117  0018 1c0001        	addw	x,#1
 118  001b cf0000        	ldw	L31_g_failures,x
 120  001e acfa01fa      	jpf	L55
 121  0022               L15:
 122                     ; 88     else if (atomSemCreate (&sem1, 0) != ATOM_OK)
 124  0022 4b00          	push	#0
 125  0024 ae025e        	ldw	x,#L5_sem1
 126  0027 cd0000        	call	_atomSemCreate
 128  002a 5b01          	addw	sp,#1
 129  002c 4d            	tnz	a
 130  002d 2713          	jreq	L75
 131                     ; 90         ATOMLOG (_STR("Error creating sem\n"));
 133  002f ae0097        	ldw	x,#L16
 134  0032 cd0000        	call	_printf
 136                     ; 91         g_failures++;
 138  0035 ce0000        	ldw	x,L31_g_failures
 139  0038 1c0001        	addw	x,#1
 140  003b cf0000        	ldw	L31_g_failures,x
 142  003e acfa01fa      	jpf	L55
 143  0042               L75:
 144                     ; 96         if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 146  0042 ae0000        	ldw	x,#0
 147  0045 89            	pushw	x
 148  0046 ae0000        	ldw	x,#0
 149  0049 89            	pushw	x
 150  004a ae0261        	ldw	x,#L3_mutex1
 151  004d cd0000        	call	_atomMutexGet
 153  0050 5b04          	addw	sp,#4
 154  0052 4d            	tnz	a
 155  0053 270f          	jreq	L56
 156                     ; 98             ATOMLOG (_STR("Error taking mutex\n"));
 158  0055 ae0083        	ldw	x,#L76
 159  0058 cd0000        	call	_printf
 161                     ; 99             g_failures++;
 163  005b ce0000        	ldw	x,L31_g_failures
 164  005e 1c0001        	addw	x,#1
 165  0061 cf0000        	ldw	L31_g_failures,x
 166  0064               L56:
 167                     ; 103         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 167                     ; 104               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 167                     ; 105               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 169  0064 ae0080        	ldw	x,#128
 170  0067 89            	pushw	x
 171  0068 ae0000        	ldw	x,#0
 172  006b 89            	pushw	x
 173  006c ae0081        	ldw	x,#L11_test_thread_stack+127
 174  006f 89            	pushw	x
 175  0070 ae0001        	ldw	x,#1
 176  0073 89            	pushw	x
 177  0074 ae0000        	ldw	x,#0
 178  0077 89            	pushw	x
 179  0078 ae0000        	ldw	x,#L51_test_thread_func
 180  007b 89            	pushw	x
 181  007c 4b10          	push	#16
 182  007e ae0202        	ldw	x,#L7_tcb
 183  0081 cd0000        	call	_atomThreadCreate
 185  0084 5b0d          	addw	sp,#13
 186  0086 4d            	tnz	a
 187  0087 271e          	jreq	L17
 188                     ; 108             ATOMLOG (_STR("Error creating test thread\n"));
 190  0089 ae0067        	ldw	x,#L37
 191  008c cd0000        	call	_printf
 193                     ; 109             CRITICAL_START ();
 195  008f 96            	ldw	x,sp
 196  0090 1c0009        	addw	x,#OFST-2
 198  0093 8a            push CC
 199  0094 84            pop a
 200  0095 f7            ld (X),A
 201  0096 9b            sim
 203                     ; 110             g_failures++;
 205  0097 ce0000        	ldw	x,L31_g_failures
 206  009a 1c0001        	addw	x,#1
 207  009d cf0000        	ldw	L31_g_failures,x
 208                     ; 111             CRITICAL_END ();
 210  00a0 96            	ldw	x,sp
 211  00a1 1c0009        	addw	x,#OFST-2
 213  00a4 f6            ld A,(X)
 214  00a5 88            push A
 215  00a6 86            pop CC
 217  00a7               L17:
 218                     ; 115         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 2,
 218                     ; 116               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 218                     ; 117               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 220  00a7 ae0080        	ldw	x,#128
 221  00aa 89            	pushw	x
 222  00ab ae0000        	ldw	x,#0
 223  00ae 89            	pushw	x
 224  00af ae0101        	ldw	x,#L11_test_thread_stack+255
 225  00b2 89            	pushw	x
 226  00b3 ae0002        	ldw	x,#2
 227  00b6 89            	pushw	x
 228  00b7 ae0000        	ldw	x,#0
 229  00ba 89            	pushw	x
 230  00bb ae0000        	ldw	x,#L51_test_thread_func
 231  00be 89            	pushw	x
 232  00bf 4b10          	push	#16
 233  00c1 ae0219        	ldw	x,#L7_tcb+23
 234  00c4 cd0000        	call	_atomThreadCreate
 236  00c7 5b0d          	addw	sp,#13
 237  00c9 4d            	tnz	a
 238  00ca 271e          	jreq	L57
 239                     ; 120             ATOMLOG (_STR("Error creating test thread\n"));
 241  00cc ae0067        	ldw	x,#L37
 242  00cf cd0000        	call	_printf
 244                     ; 121             CRITICAL_START ();
 246  00d2 96            	ldw	x,sp
 247  00d3 1c0009        	addw	x,#OFST-2
 249  00d6 8a            push CC
 250  00d7 84            pop a
 251  00d8 f7            ld (X),A
 252  00d9 9b            sim
 254                     ; 122             g_failures++;
 256  00da ce0000        	ldw	x,L31_g_failures
 257  00dd 1c0001        	addw	x,#1
 258  00e0 cf0000        	ldw	L31_g_failures,x
 259                     ; 123             CRITICAL_END ();
 261  00e3 96            	ldw	x,sp
 262  00e4 1c0009        	addw	x,#OFST-2
 264  00e7 f6            ld A,(X)
 265  00e8 88            push A
 266  00e9 86            pop CC
 268  00ea               L57:
 269                     ; 127         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 269                     ; 128               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 269                     ; 129               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 271  00ea ae0080        	ldw	x,#128
 272  00ed 89            	pushw	x
 273  00ee ae0000        	ldw	x,#0
 274  00f1 89            	pushw	x
 275  00f2 ae0181        	ldw	x,#L11_test_thread_stack+383
 276  00f5 89            	pushw	x
 277  00f6 ae0003        	ldw	x,#3
 278  00f9 89            	pushw	x
 279  00fa ae0000        	ldw	x,#0
 280  00fd 89            	pushw	x
 281  00fe ae0000        	ldw	x,#L51_test_thread_func
 282  0101 89            	pushw	x
 283  0102 4b10          	push	#16
 284  0104 ae0230        	ldw	x,#L7_tcb+46
 285  0107 cd0000        	call	_atomThreadCreate
 287  010a 5b0d          	addw	sp,#13
 288  010c 4d            	tnz	a
 289  010d 271e          	jreq	L77
 290                     ; 132             ATOMLOG (_STR("Error creating test thread\n"));
 292  010f ae0067        	ldw	x,#L37
 293  0112 cd0000        	call	_printf
 295                     ; 133             CRITICAL_START ();
 297  0115 96            	ldw	x,sp
 298  0116 1c0009        	addw	x,#OFST-2
 300  0119 8a            push CC
 301  011a 84            pop a
 302  011b f7            ld (X),A
 303  011c 9b            sim
 305                     ; 134             g_failures++;
 307  011d ce0000        	ldw	x,L31_g_failures
 308  0120 1c0001        	addw	x,#1
 309  0123 cf0000        	ldw	L31_g_failures,x
 310                     ; 135             CRITICAL_END ();
 312  0126 96            	ldw	x,sp
 313  0127 1c0009        	addw	x,#OFST-2
 315  012a f6            ld A,(X)
 316  012b 88            push A
 317  012c 86            pop CC
 319  012d               L77:
 320                     ; 139         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 320                     ; 140               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 320                     ; 141               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 322  012d ae0080        	ldw	x,#128
 323  0130 89            	pushw	x
 324  0131 ae0000        	ldw	x,#0
 325  0134 89            	pushw	x
 326  0135 ae0201        	ldw	x,#L11_test_thread_stack+511
 327  0138 89            	pushw	x
 328  0139 ae0004        	ldw	x,#4
 329  013c 89            	pushw	x
 330  013d ae0000        	ldw	x,#0
 331  0140 89            	pushw	x
 332  0141 ae0000        	ldw	x,#L51_test_thread_func
 333  0144 89            	pushw	x
 334  0145 4b10          	push	#16
 335  0147 ae0247        	ldw	x,#L7_tcb+69
 336  014a cd0000        	call	_atomThreadCreate
 338  014d 5b0d          	addw	sp,#13
 339  014f 4d            	tnz	a
 340  0150 271e          	jreq	L101
 341                     ; 144             ATOMLOG (_STR("Error creating test thread\n"));
 343  0152 ae0067        	ldw	x,#L37
 344  0155 cd0000        	call	_printf
 346                     ; 145             CRITICAL_START ();
 348  0158 96            	ldw	x,sp
 349  0159 1c0009        	addw	x,#OFST-2
 351  015c 8a            push CC
 352  015d 84            pop a
 353  015e f7            ld (X),A
 354  015f 9b            sim
 356                     ; 146             g_failures++;
 358  0160 ce0000        	ldw	x,L31_g_failures
 359  0163 1c0001        	addw	x,#1
 360  0166 cf0000        	ldw	L31_g_failures,x
 361                     ; 147             CRITICAL_END ();
 363  0169 96            	ldw	x,sp
 364  016a 1c0009        	addw	x,#OFST-2
 366  016d f6            ld A,(X)
 367  016e 88            push A
 368  016f 86            pop CC
 370  0170               L101:
 371                     ; 151         if (atomMutexPut (&mutex1) != ATOM_OK)
 373  0170 ae0261        	ldw	x,#L3_mutex1
 374  0173 cd0000        	call	_atomMutexPut
 376  0176 4d            	tnz	a
 377  0177 270f          	jreq	L301
 378                     ; 153             ATOMLOG (_STR("Error putting mutex\n"));
 380  0179 ae0052        	ldw	x,#L501
 381  017c cd0000        	call	_printf
 383                     ; 154             g_failures++;
 385  017f ce0000        	ldw	x,L31_g_failures
 386  0182 1c0001        	addw	x,#1
 387  0185 cf0000        	ldw	L31_g_failures,x
 388  0188               L301:
 389                     ; 162         finish_cnt = 0;
 391  0188 5f            	clrw	x
 392  0189 1f0a          	ldw	(OFST-1,sp),x
 393  018b               L701:
 394                     ; 170             if (atomSemGet (&sem1, 0) == ATOM_OK)
 396  018b ae0000        	ldw	x,#0
 397  018e 89            	pushw	x
 398  018f ae0000        	ldw	x,#0
 399  0192 89            	pushw	x
 400  0193 ae025e        	ldw	x,#L5_sem1
 401  0196 cd0000        	call	_atomSemGet
 403  0199 5b04          	addw	sp,#4
 404  019b 4d            	tnz	a
 405  019c 26ed          	jrne	L701
 406                     ; 173                 finish_cnt++;
 408  019e 1e0a          	ldw	x,(OFST-1,sp)
 409  01a0 1c0001        	addw	x,#1
 410  01a3 1f0a          	ldw	(OFST-1,sp),x
 411                     ; 176                 if (finish_cnt == 4)
 413  01a5 1e0a          	ldw	x,(OFST-1,sp)
 414  01a7 a30004        	cpw	x,#4
 415  01aa 26df          	jrne	L701
 416                     ; 178                     break;
 417                     ; 184         if (atomMutexDelete (&mutex1) != ATOM_OK)
 419  01ac ae0261        	ldw	x,#L3_mutex1
 420  01af cd0000        	call	_atomMutexDelete
 422  01b2 4d            	tnz	a
 423  01b3 271e          	jreq	L711
 424                     ; 186             ATOMLOG (_STR("Delete failed\n"));
 426  01b5 ae0043        	ldw	x,#L121
 427  01b8 cd0000        	call	_printf
 429                     ; 187             CRITICAL_START ();
 431  01bb 96            	ldw	x,sp
 432  01bc 1c0009        	addw	x,#OFST-2
 434  01bf 8a            push CC
 435  01c0 84            pop a
 436  01c1 f7            ld (X),A
 437  01c2 9b            sim
 439                     ; 188             g_failures++;
 441  01c3 ce0000        	ldw	x,L31_g_failures
 442  01c6 1c0001        	addw	x,#1
 443  01c9 cf0000        	ldw	L31_g_failures,x
 444                     ; 189             CRITICAL_END ();
 446  01cc 96            	ldw	x,sp
 447  01cd 1c0009        	addw	x,#OFST-2
 449  01d0 f6            ld A,(X)
 450  01d1 88            push A
 451  01d2 86            pop CC
 453  01d3               L711:
 454                     ; 191         if (atomSemDelete (&sem1) != ATOM_OK)
 456  01d3 ae025e        	ldw	x,#L5_sem1
 457  01d6 cd0000        	call	_atomSemDelete
 459  01d9 4d            	tnz	a
 460  01da 271e          	jreq	L55
 461                     ; 193             ATOMLOG (_STR("Delete failed\n"));
 463  01dc ae0043        	ldw	x,#L121
 464  01df cd0000        	call	_printf
 466                     ; 194             CRITICAL_START ();
 468  01e2 96            	ldw	x,sp
 469  01e3 1c0009        	addw	x,#OFST-2
 471  01e6 8a            push CC
 472  01e7 84            pop a
 473  01e8 f7            ld (X),A
 474  01e9 9b            sim
 476                     ; 195             g_failures++;
 478  01ea ce0000        	ldw	x,L31_g_failures
 479  01ed 1c0001        	addw	x,#1
 480  01f0 cf0000        	ldw	L31_g_failures,x
 481                     ; 196             CRITICAL_END ();
 483  01f3 96            	ldw	x,sp
 484  01f4 1c0009        	addw	x,#OFST-2
 486  01f7 f6            ld A,(X)
 487  01f8 88            push A
 488  01f9 86            pop CC
 490  01fa               L55:
 491                     ; 207         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 493  01fa 5f            	clrw	x
 494  01fb 1f0a          	ldw	(OFST-1,sp),x
 495  01fd               L521:
 496                     ; 210             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 498  01fd 96            	ldw	x,sp
 499  01fe 1c0005        	addw	x,#OFST-6
 500  0201 89            	pushw	x
 501  0202 96            	ldw	x,sp
 502  0203 1c0003        	addw	x,#OFST-8
 503  0206 89            	pushw	x
 504  0207 1e0e          	ldw	x,(OFST+3,sp)
 505  0209 90ae0017      	ldw	y,#23
 506  020d cd0000        	call	c_imul
 508  0210 1c0202        	addw	x,#L7_tcb
 509  0213 cd0000        	call	_atomThreadStackCheck
 511  0216 5b04          	addw	sp,#4
 512  0218 4d            	tnz	a
 513  0219 2711          	jreq	L331
 514                     ; 212                 ATOMLOG (_STR("StackCheck\n"));
 516  021b ae0037        	ldw	x,#L531
 517  021e cd0000        	call	_printf
 519                     ; 213                 g_failures++;
 521  0221 ce0000        	ldw	x,L31_g_failures
 522  0224 1c0001        	addw	x,#1
 523  0227 cf0000        	ldw	L31_g_failures,x
 525  022a 2026          	jra	L731
 526  022c               L331:
 527                     ; 218                 if (free_bytes == 0)
 529  022c 96            	ldw	x,sp
 530  022d 1c0005        	addw	x,#OFST-6
 531  0230 cd0000        	call	c_lzmp
 533  0233 2613          	jrne	L141
 534                     ; 220                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 536  0235 1e0a          	ldw	x,(OFST-1,sp)
 537  0237 89            	pushw	x
 538  0238 ae0025        	ldw	x,#L341
 539  023b cd0000        	call	_printf
 541  023e 85            	popw	x
 542                     ; 221                     g_failures++;
 544  023f ce0000        	ldw	x,L31_g_failures
 545  0242 1c0001        	addw	x,#1
 546  0245 cf0000        	ldw	L31_g_failures,x
 547  0248               L141:
 548                     ; 226                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 550  0248 1e03          	ldw	x,(OFST-8,sp)
 551  024a 89            	pushw	x
 552  024b ae0018        	ldw	x,#L541
 553  024e cd0000        	call	_printf
 555  0251 85            	popw	x
 556  0252               L731:
 557                     ; 207         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 559  0252 1e0a          	ldw	x,(OFST-1,sp)
 560  0254 1c0001        	addw	x,#1
 561  0257 1f0a          	ldw	(OFST-1,sp),x
 564  0259 9c            	rvf
 565  025a 1e0a          	ldw	x,(OFST-1,sp)
 566  025c a30004        	cpw	x,#4
 567  025f 2f9c          	jrslt	L521
 568                     ; 234     return g_failures;
 570  0261 ce0000        	ldw	x,L31_g_failures
 571  0264 cd0000        	call	c_itolx
 575  0267 5b0b          	addw	sp,#11
 576  0269 81            	ret
 637                     ; 249 static void test_thread_func (uint32_t param)
 637                     ; 250 {
 638                     .text:	section	.text,new
 639  0000               L51_test_thread_func:
 641  0000 5206          	subw	sp,#6
 642       00000006      OFST:	set	6
 645                     ; 256     param = param;
 647  0002 96            	ldw	x,sp
 648  0003 1c0009        	addw	x,#OFST+3
 649  0006 cd0000        	call	c_ltor
 651                     ; 259     loop_cnt = NUM_TEST_LOOPS;
 653  0009 ae2710        	ldw	x,#10000
 654  000c 1f03          	ldw	(OFST-3,sp),x
 655  000e ae0000        	ldw	x,#0
 656  0011 1f01          	ldw	(OFST-5,sp),x
 658  0013 aca400a4      	jpf	L571
 659  0017               L171:
 660                     ; 262         if ((status = atomMutexGet (&mutex1, 0)) != ATOM_OK)
 662  0017 ae0000        	ldw	x,#0
 663  001a 89            	pushw	x
 664  001b ae0000        	ldw	x,#0
 665  001e 89            	pushw	x
 666  001f ae0261        	ldw	x,#L3_mutex1
 667  0022 cd0000        	call	_atomMutexGet
 669  0025 5b04          	addw	sp,#4
 670  0027 6b05          	ld	(OFST-1,sp),a
 671  0029 2724          	jreq	L102
 672                     ; 265             ATOMLOG (_STR("G%d\n"), status);
 674  002b 7b05          	ld	a,(OFST-1,sp)
 675  002d 88            	push	a
 676  002e ae0013        	ldw	x,#L302
 677  0031 cd0000        	call	_printf
 679  0034 84            	pop	a
 680                     ; 266             CRITICAL_START ();
 682  0035 96            	ldw	x,sp
 683  0036 1c0006        	addw	x,#OFST+0
 685  0039 8a            push CC
 686  003a 84            pop a
 687  003b f7            ld (X),A
 688  003c 9b            sim
 690                     ; 267             g_failures++;
 692  003d ce0000        	ldw	x,L31_g_failures
 693  0040 1c0001        	addw	x,#1
 694  0043 cf0000        	ldw	L31_g_failures,x
 695                     ; 268             CRITICAL_END ();
 697  0046 96            	ldw	x,sp
 698  0047 1c0006        	addw	x,#OFST+0
 700  004a f6            ld A,(X)
 701  004b 88            push A
 702  004c 86            pop CC
 704                     ; 269             break;
 706  004d 202c          	jra	L771
 707  004f               L102:
 708                     ; 271         else if ((status = atomMutexPut (&mutex1)) != ATOM_OK)
 710  004f ae0261        	ldw	x,#L3_mutex1
 711  0052 cd0000        	call	_atomMutexPut
 713  0055 6b05          	ld	(OFST-1,sp),a
 714  0057 274b          	jreq	L571
 715                     ; 274             ATOMLOG (_STR("P%d\n"), status);
 717  0059 7b05          	ld	a,(OFST-1,sp)
 718  005b 88            	push	a
 719  005c ae000e        	ldw	x,#L112
 720  005f cd0000        	call	_printf
 722  0062 84            	pop	a
 723                     ; 275             CRITICAL_START ();
 725  0063 96            	ldw	x,sp
 726  0064 1c0006        	addw	x,#OFST+0
 728  0067 8a            push CC
 729  0068 84            pop a
 730  0069 f7            ld (X),A
 731  006a 9b            sim
 733                     ; 276             g_failures++;
 735  006b ce0000        	ldw	x,L31_g_failures
 736  006e 1c0001        	addw	x,#1
 737  0071 cf0000        	ldw	L31_g_failures,x
 738                     ; 277             CRITICAL_END ();
 740  0074 96            	ldw	x,sp
 741  0075 1c0006        	addw	x,#OFST+0
 743  0078 f6            ld A,(X)
 744  0079 88            push A
 745  007a 86            pop CC
 747                     ; 278             break;
 748  007b               L771:
 749                     ; 283     if (atomSemPut (&sem1) != ATOM_OK)
 751  007b ae025e        	ldw	x,#L5_sem1
 752  007e cd0000        	call	_atomSemPut
 754  0081 4d            	tnz	a
 755  0082 273a          	jreq	L712
 756                     ; 285         ATOMLOG (_STR("Sem1 putfail\n"));
 758  0084 ae0000        	ldw	x,#L512
 759  0087 cd0000        	call	_printf
 761                     ; 286         CRITICAL_START ();
 763  008a 96            	ldw	x,sp
 764  008b 1c0006        	addw	x,#OFST+0
 766  008e 8a            push CC
 767  008f 84            pop a
 768  0090 f7            ld (X),A
 769  0091 9b            sim
 771                     ; 287         g_failures++;
 773  0092 ce0000        	ldw	x,L31_g_failures
 774  0095 1c0001        	addw	x,#1
 775  0098 cf0000        	ldw	L31_g_failures,x
 776                     ; 288         CRITICAL_END ();
 778  009b 96            	ldw	x,sp
 779  009c 1c0006        	addw	x,#OFST+0
 781  009f f6            ld A,(X)
 782  00a0 88            push A
 783  00a1 86            pop CC
 785  00a2 201a          	jra	L712
 786  00a4               L571:
 787                     ; 260     while (loop_cnt--)
 789  00a4 96            	ldw	x,sp
 790  00a5 1c0001        	addw	x,#OFST-5
 791  00a8 cd0000        	call	c_ltor
 793  00ab 96            	ldw	x,sp
 794  00ac 1c0001        	addw	x,#OFST-5
 795  00af a601          	ld	a,#1
 796  00b1 cd0000        	call	c_lgsbc
 798  00b4 cd0000        	call	c_lrzmp
 800  00b7 2703          	jreq	L01
 801  00b9 cc0017        	jp	L171
 802  00bc               L01:
 803  00bc 20bd          	jra	L771
 804  00be               L712:
 805                     ; 294         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 807  00be ae0064        	ldw	x,#100
 808  00c1 89            	pushw	x
 809  00c2 ae0000        	ldw	x,#0
 810  00c5 89            	pushw	x
 811  00c6 cd0000        	call	_atomTimerDelay
 813  00c9 5b04          	addw	sp,#4
 815  00cb 20f1          	jra	L712
1103                     	switch	.bss
1104  0000               L31_g_failures:
1105  0000 0000          	ds.b	2
1106  0002               L11_test_thread_stack:
1107  0002 000000000000  	ds.b	512
1108  0202               L7_tcb:
1109  0202 000000000000  	ds.b	92
1110  025e               L5_sem1:
1111  025e 000000        	ds.b	3
1112  0261               L3_mutex1:
1113  0261 0000000000    	ds.b	5
1114                     	xref	_atomSemPut
1115                     	xref	_atomSemGet
1116                     	xref	_atomSemDelete
1117                     	xref	_atomSemCreate
1118                     	xref	_atomMutexPut
1119                     	xref	_atomMutexGet
1120                     	xref	_atomMutexDelete
1121                     	xref	_atomMutexCreate
1122                     	xdef	_test_start
1123                     	xref	_printf
1124                     	xref	_atomThreadStackCheck
1125                     	xref	_atomThreadCreate
1126                     	xref	_atomTimerDelay
1127                     .const:	section	.text
1128  0000               L512:
1129  0000 53656d312070  	dc.b	"Sem1 putfail",10,0
1130  000e               L112:
1131  000e 5025640a00    	dc.b	"P%d",10,0
1132  0013               L302:
1133  0013 4725640a00    	dc.b	"G%d",10,0
1134  0018               L541:
1135  0018 537461636b55  	dc.b	"StackUse:%d",10,0
1136  0025               L341:
1137  0025 537461636b4f  	dc.b	"StackOverflow %d",10,0
1138  0037               L531:
1139  0037 537461636b43  	dc.b	"StackCheck",10,0
1140  0043               L121:
1141  0043 44656c657465  	dc.b	"Delete failed",10,0
1142  0052               L501:
1143  0052 4572726f7220  	dc.b	"Error putting mute"
1144  0064 780a00        	dc.b	"x",10,0
1145  0067               L37:
1146  0067 4572726f7220  	dc.b	"Error creating tes"
1147  0079 742074687265  	dc.b	"t thread",10,0
1148  0083               L76:
1149  0083 4572726f7220  	dc.b	"Error taking mutex"
1150  0095 0a00          	dc.b	10,0
1151  0097               L16:
1152  0097 4572726f7220  	dc.b	"Error creating sem"
1153  00a9 0a00          	dc.b	10,0
1154  00ab               L35:
1155  00ab 4572726f7220  	dc.b	"Error creating mut"
1156  00bd 65780a00      	dc.b	"ex",10,0
1157                     	xref.b	c_x
1177                     	xref	c_lrzmp
1178                     	xref	c_lgsbc
1179                     	xref	c_ltor
1180                     	xref	c_itolx
1181                     	xref	c_lzmp
1182                     	xref	c_imul
1183                     	end
