   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  88                     ; 81 uint32_t test_start (void)
  88                     ; 82 {
  90                     .text:	section	.text,new
  91  0000               _test_start:
  93  0000 520b          	subw	sp,#11
  94       0000000b      OFST:	set	11
  97                     ; 87     g_failures = 0;
  99  0002 5f            	clrw	x
 100  0003 cf0000        	ldw	L51_g_failures,x
 101                     ; 90     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(queue1_storage[0]), QUEUE_ENTRIES) != ATOM_OK)
 103  0006 ae0008        	ldw	x,#8
 104  0009 89            	pushw	x
 105  000a ae0000        	ldw	x,#0
 106  000d 89            	pushw	x
 107  000e ae0001        	ldw	x,#1
 108  0011 89            	pushw	x
 109  0012 ae0000        	ldw	x,#0
 110  0015 89            	pushw	x
 111  0016 ae0261        	ldw	x,#L5_queue1_storage
 112  0019 89            	pushw	x
 113  001a ae0269        	ldw	x,#L3_queue1
 114  001d cd0000        	call	_atomQueueCreate
 116  0020 5b0a          	addw	sp,#10
 117  0022 4d            	tnz	a
 118  0023 2713          	jreq	L35
 119                     ; 92         ATOMLOG (_STR("Error creating Q\n"));
 121  0025 ae0082        	ldw	x,#L55
 122  0028 cd0000        	call	_printf
 124                     ; 93         g_failures++;
 126  002b ce0000        	ldw	x,L51_g_failures
 127  002e 1c0001        	addw	x,#1
 128  0031 cf0000        	ldw	L51_g_failures,x
 130  0034 acd601d6      	jpf	L75
 131  0038               L35:
 132                     ; 97     else if (atomSemCreate (&sem1, 0) != ATOM_OK)
 134  0038 4b00          	push	#0
 135  003a ae025e        	ldw	x,#L7_sem1
 136  003d cd0000        	call	_atomSemCreate
 138  0040 5b01          	addw	sp,#1
 139  0042 4d            	tnz	a
 140  0043 2713          	jreq	L16
 141                     ; 99         ATOMLOG (_STR("Error creating sem\n"));
 143  0045 ae006e        	ldw	x,#L36
 144  0048 cd0000        	call	_printf
 146                     ; 100         g_failures++;
 148  004b ce0000        	ldw	x,L51_g_failures
 149  004e 1c0001        	addw	x,#1
 150  0051 cf0000        	ldw	L51_g_failures,x
 152  0054 acd601d6      	jpf	L75
 153  0058               L16:
 154                     ; 105         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 154                     ; 106               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 154                     ; 107               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 156  0058 ae0080        	ldw	x,#128
 157  005b 89            	pushw	x
 158  005c ae0000        	ldw	x,#0
 159  005f 89            	pushw	x
 160  0060 ae0081        	ldw	x,#L31_test_thread_stack+127
 161  0063 89            	pushw	x
 162  0064 ae0001        	ldw	x,#1
 163  0067 89            	pushw	x
 164  0068 ae0000        	ldw	x,#0
 165  006b 89            	pushw	x
 166  006c ae0000        	ldw	x,#L71_test_thread_func
 167  006f 89            	pushw	x
 168  0070 4b10          	push	#16
 169  0072 ae0202        	ldw	x,#L11_tcb
 170  0075 cd0000        	call	_atomThreadCreate
 172  0078 5b0d          	addw	sp,#13
 173  007a 4d            	tnz	a
 174  007b 271e          	jreq	L76
 175                     ; 110             ATOMLOG (_STR("Error creating test thread\n"));
 177  007d ae0052        	ldw	x,#L17
 178  0080 cd0000        	call	_printf
 180                     ; 111             CRITICAL_START ();
 182  0083 96            	ldw	x,sp
 183  0084 1c0009        	addw	x,#OFST-2
 185  0087 8a            push CC
 186  0088 84            pop a
 187  0089 f7            ld (X),A
 188  008a 9b            sim
 190                     ; 112             g_failures++;
 192  008b ce0000        	ldw	x,L51_g_failures
 193  008e 1c0001        	addw	x,#1
 194  0091 cf0000        	ldw	L51_g_failures,x
 195                     ; 113             CRITICAL_END ();
 197  0094 96            	ldw	x,sp
 198  0095 1c0009        	addw	x,#OFST-2
 200  0098 f6            ld A,(X)
 201  0099 88            push A
 202  009a 86            pop CC
 204  009b               L76:
 205                     ; 117         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 2,
 205                     ; 118               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 205                     ; 119               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 207  009b ae0080        	ldw	x,#128
 208  009e 89            	pushw	x
 209  009f ae0000        	ldw	x,#0
 210  00a2 89            	pushw	x
 211  00a3 ae0101        	ldw	x,#L31_test_thread_stack+255
 212  00a6 89            	pushw	x
 213  00a7 ae0002        	ldw	x,#2
 214  00aa 89            	pushw	x
 215  00ab ae0000        	ldw	x,#0
 216  00ae 89            	pushw	x
 217  00af ae0000        	ldw	x,#L71_test_thread_func
 218  00b2 89            	pushw	x
 219  00b3 4b10          	push	#16
 220  00b5 ae0219        	ldw	x,#L11_tcb+23
 221  00b8 cd0000        	call	_atomThreadCreate
 223  00bb 5b0d          	addw	sp,#13
 224  00bd 4d            	tnz	a
 225  00be 271e          	jreq	L37
 226                     ; 122             ATOMLOG (_STR("Error creating test thread\n"));
 228  00c0 ae0052        	ldw	x,#L17
 229  00c3 cd0000        	call	_printf
 231                     ; 123             CRITICAL_START ();
 233  00c6 96            	ldw	x,sp
 234  00c7 1c0009        	addw	x,#OFST-2
 236  00ca 8a            push CC
 237  00cb 84            pop a
 238  00cc f7            ld (X),A
 239  00cd 9b            sim
 241                     ; 124             g_failures++;
 243  00ce ce0000        	ldw	x,L51_g_failures
 244  00d1 1c0001        	addw	x,#1
 245  00d4 cf0000        	ldw	L51_g_failures,x
 246                     ; 125             CRITICAL_END ();
 248  00d7 96            	ldw	x,sp
 249  00d8 1c0009        	addw	x,#OFST-2
 251  00db f6            ld A,(X)
 252  00dc 88            push A
 253  00dd 86            pop CC
 255  00de               L37:
 256                     ; 129         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 256                     ; 130               &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 256                     ; 131               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 258  00de ae0080        	ldw	x,#128
 259  00e1 89            	pushw	x
 260  00e2 ae0000        	ldw	x,#0
 261  00e5 89            	pushw	x
 262  00e6 ae0181        	ldw	x,#L31_test_thread_stack+383
 263  00e9 89            	pushw	x
 264  00ea ae0003        	ldw	x,#3
 265  00ed 89            	pushw	x
 266  00ee ae0000        	ldw	x,#0
 267  00f1 89            	pushw	x
 268  00f2 ae0000        	ldw	x,#L71_test_thread_func
 269  00f5 89            	pushw	x
 270  00f6 4b10          	push	#16
 271  00f8 ae0230        	ldw	x,#L11_tcb+46
 272  00fb cd0000        	call	_atomThreadCreate
 274  00fe 5b0d          	addw	sp,#13
 275  0100 4d            	tnz	a
 276  0101 271e          	jreq	L57
 277                     ; 134             ATOMLOG (_STR("Error creating test thread\n"));
 279  0103 ae0052        	ldw	x,#L17
 280  0106 cd0000        	call	_printf
 282                     ; 135             CRITICAL_START ();
 284  0109 96            	ldw	x,sp
 285  010a 1c0009        	addw	x,#OFST-2
 287  010d 8a            push CC
 288  010e 84            pop a
 289  010f f7            ld (X),A
 290  0110 9b            sim
 292                     ; 136             g_failures++;
 294  0111 ce0000        	ldw	x,L51_g_failures
 295  0114 1c0001        	addw	x,#1
 296  0117 cf0000        	ldw	L51_g_failures,x
 297                     ; 137             CRITICAL_END ();
 299  011a 96            	ldw	x,sp
 300  011b 1c0009        	addw	x,#OFST-2
 302  011e f6            ld A,(X)
 303  011f 88            push A
 304  0120 86            pop CC
 306  0121               L57:
 307                     ; 141         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 307                     ; 142               &test_thread_stack[3][TEST_THREAD_STACK_SIZE - 1],
 307                     ; 143               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 309  0121 ae0080        	ldw	x,#128
 310  0124 89            	pushw	x
 311  0125 ae0000        	ldw	x,#0
 312  0128 89            	pushw	x
 313  0129 ae0201        	ldw	x,#L31_test_thread_stack+511
 314  012c 89            	pushw	x
 315  012d ae0004        	ldw	x,#4
 316  0130 89            	pushw	x
 317  0131 ae0000        	ldw	x,#0
 318  0134 89            	pushw	x
 319  0135 ae0000        	ldw	x,#L71_test_thread_func
 320  0138 89            	pushw	x
 321  0139 4b10          	push	#16
 322  013b ae0247        	ldw	x,#L11_tcb+69
 323  013e cd0000        	call	_atomThreadCreate
 325  0141 5b0d          	addw	sp,#13
 326  0143 4d            	tnz	a
 327  0144 271e          	jreq	L77
 328                     ; 146             ATOMLOG (_STR("Error creating test thread\n"));
 330  0146 ae0052        	ldw	x,#L17
 331  0149 cd0000        	call	_printf
 333                     ; 147             CRITICAL_START ();
 335  014c 96            	ldw	x,sp
 336  014d 1c0009        	addw	x,#OFST-2
 338  0150 8a            push CC
 339  0151 84            pop a
 340  0152 f7            ld (X),A
 341  0153 9b            sim
 343                     ; 148             g_failures++;
 345  0154 ce0000        	ldw	x,L51_g_failures
 346  0157 1c0001        	addw	x,#1
 347  015a cf0000        	ldw	L51_g_failures,x
 348                     ; 149             CRITICAL_END ();
 350  015d 96            	ldw	x,sp
 351  015e 1c0009        	addw	x,#OFST-2
 353  0161 f6            ld A,(X)
 354  0162 88            push A
 355  0163 86            pop CC
 357  0164               L77:
 358                     ; 157         finish_cnt = 0;
 360  0164 5f            	clrw	x
 361  0165 1f0a          	ldw	(OFST-1,sp),x
 362  0167               L101:
 363                     ; 165             if (atomSemGet (&sem1, 0) == ATOM_OK)
 365  0167 ae0000        	ldw	x,#0
 366  016a 89            	pushw	x
 367  016b ae0000        	ldw	x,#0
 368  016e 89            	pushw	x
 369  016f ae025e        	ldw	x,#L7_sem1
 370  0172 cd0000        	call	_atomSemGet
 372  0175 5b04          	addw	sp,#4
 373  0177 4d            	tnz	a
 374  0178 26ed          	jrne	L101
 375                     ; 168                 finish_cnt++;
 377  017a 1e0a          	ldw	x,(OFST-1,sp)
 378  017c 1c0001        	addw	x,#1
 379  017f 1f0a          	ldw	(OFST-1,sp),x
 380                     ; 171                 if (finish_cnt == 4)
 382  0181 1e0a          	ldw	x,(OFST-1,sp)
 383  0183 a30004        	cpw	x,#4
 384  0186 26df          	jrne	L101
 385                     ; 173                     break;
 386                     ; 179         if (atomQueueDelete (&queue1) != ATOM_OK)
 388  0188 ae0269        	ldw	x,#L3_queue1
 389  018b cd0000        	call	_atomQueueDelete
 391  018e 4d            	tnz	a
 392  018f 271e          	jreq	L111
 393                     ; 181             ATOMLOG (_STR("Delete failed\n"));
 395  0191 ae0043        	ldw	x,#L311
 396  0194 cd0000        	call	_printf
 398                     ; 182             CRITICAL_START ();
 400  0197 96            	ldw	x,sp
 401  0198 1c0009        	addw	x,#OFST-2
 403  019b 8a            push CC
 404  019c 84            pop a
 405  019d f7            ld (X),A
 406  019e 9b            sim
 408                     ; 183             g_failures++;
 410  019f ce0000        	ldw	x,L51_g_failures
 411  01a2 1c0001        	addw	x,#1
 412  01a5 cf0000        	ldw	L51_g_failures,x
 413                     ; 184             CRITICAL_END ();
 415  01a8 96            	ldw	x,sp
 416  01a9 1c0009        	addw	x,#OFST-2
 418  01ac f6            ld A,(X)
 419  01ad 88            push A
 420  01ae 86            pop CC
 422  01af               L111:
 423                     ; 186         if (atomSemDelete (&sem1) != ATOM_OK)
 425  01af ae025e        	ldw	x,#L7_sem1
 426  01b2 cd0000        	call	_atomSemDelete
 428  01b5 4d            	tnz	a
 429  01b6 271e          	jreq	L75
 430                     ; 188             ATOMLOG (_STR("Delete failed\n"));
 432  01b8 ae0043        	ldw	x,#L311
 433  01bb cd0000        	call	_printf
 435                     ; 189             CRITICAL_START ();
 437  01be 96            	ldw	x,sp
 438  01bf 1c0009        	addw	x,#OFST-2
 440  01c2 8a            push CC
 441  01c3 84            pop a
 442  01c4 f7            ld (X),A
 443  01c5 9b            sim
 445                     ; 190             g_failures++;
 447  01c6 ce0000        	ldw	x,L51_g_failures
 448  01c9 1c0001        	addw	x,#1
 449  01cc cf0000        	ldw	L51_g_failures,x
 450                     ; 191             CRITICAL_END ();
 452  01cf 96            	ldw	x,sp
 453  01d0 1c0009        	addw	x,#OFST-2
 455  01d3 f6            ld A,(X)
 456  01d4 88            push A
 457  01d5 86            pop CC
 459  01d6               L75:
 460                     ; 202         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 462  01d6 5f            	clrw	x
 463  01d7 1f0a          	ldw	(OFST-1,sp),x
 464  01d9               L711:
 465                     ; 205             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 467  01d9 96            	ldw	x,sp
 468  01da 1c0005        	addw	x,#OFST-6
 469  01dd 89            	pushw	x
 470  01de 96            	ldw	x,sp
 471  01df 1c0003        	addw	x,#OFST-8
 472  01e2 89            	pushw	x
 473  01e3 1e0e          	ldw	x,(OFST+3,sp)
 474  01e5 90ae0017      	ldw	y,#23
 475  01e9 cd0000        	call	c_imul
 477  01ec 1c0202        	addw	x,#L11_tcb
 478  01ef cd0000        	call	_atomThreadStackCheck
 480  01f2 5b04          	addw	sp,#4
 481  01f4 4d            	tnz	a
 482  01f5 2711          	jreq	L521
 483                     ; 207                 ATOMLOG (_STR("StackCheck\n"));
 485  01f7 ae0037        	ldw	x,#L721
 486  01fa cd0000        	call	_printf
 488                     ; 208                 g_failures++;
 490  01fd ce0000        	ldw	x,L51_g_failures
 491  0200 1c0001        	addw	x,#1
 492  0203 cf0000        	ldw	L51_g_failures,x
 494  0206 2026          	jra	L131
 495  0208               L521:
 496                     ; 213                 if (free_bytes == 0)
 498  0208 96            	ldw	x,sp
 499  0209 1c0005        	addw	x,#OFST-6
 500  020c cd0000        	call	c_lzmp
 502  020f 2613          	jrne	L331
 503                     ; 215                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 505  0211 1e0a          	ldw	x,(OFST-1,sp)
 506  0213 89            	pushw	x
 507  0214 ae0025        	ldw	x,#L531
 508  0217 cd0000        	call	_printf
 510  021a 85            	popw	x
 511                     ; 216                     g_failures++;
 513  021b ce0000        	ldw	x,L51_g_failures
 514  021e 1c0001        	addw	x,#1
 515  0221 cf0000        	ldw	L51_g_failures,x
 516  0224               L331:
 517                     ; 221                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 519  0224 1e03          	ldw	x,(OFST-8,sp)
 520  0226 89            	pushw	x
 521  0227 ae0018        	ldw	x,#L731
 522  022a cd0000        	call	_printf
 524  022d 85            	popw	x
 525  022e               L131:
 526                     ; 202         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 528  022e 1e0a          	ldw	x,(OFST-1,sp)
 529  0230 1c0001        	addw	x,#1
 530  0233 1f0a          	ldw	(OFST-1,sp),x
 533  0235 9c            	rvf
 534  0236 1e0a          	ldw	x,(OFST-1,sp)
 535  0238 a30004        	cpw	x,#4
 536  023b 2f9c          	jrslt	L711
 537                     ; 229     return g_failures;
 539  023d ce0000        	ldw	x,L51_g_failures
 540  0240 cd0000        	call	c_itolx
 544  0243 5b0b          	addw	sp,#11
 545  0245 81            	ret
 613                     ; 244 static void test_thread_func (uint32_t param)
 613                     ; 245 {
 614                     .text:	section	.text,new
 615  0000               L71_test_thread_func:
 617  0000 5207          	subw	sp,#7
 618       00000007      OFST:	set	7
 621                     ; 252     param = param;
 623  0002 96            	ldw	x,sp
 624  0003 1c000a        	addw	x,#OFST+3
 625  0006 cd0000        	call	c_ltor
 627                     ; 255     loop_cnt = NUM_TEST_LOOPS;
 629  0009 ae2710        	ldw	x,#10000
 630  000c 1f03          	ldw	(OFST-4,sp),x
 631  000e ae0000        	ldw	x,#0
 632  0011 1f01          	ldw	(OFST-6,sp),x
 634  0013 acbc00bc      	jpf	L171
 635  0017               L561:
 636                     ; 259         msg = 0x66;
 638  0017 a666          	ld	a,#102
 639  0019 6b05          	ld	(OFST-2,sp),a
 640                     ; 260         if ((status = atomQueuePut (&queue1, 0, &msg)) != ATOM_OK)
 642  001b 96            	ldw	x,sp
 643  001c 1c0005        	addw	x,#OFST-2
 644  001f 89            	pushw	x
 645  0020 ae0000        	ldw	x,#0
 646  0023 89            	pushw	x
 647  0024 ae0000        	ldw	x,#0
 648  0027 89            	pushw	x
 649  0028 ae0269        	ldw	x,#L3_queue1
 650  002b cd0000        	call	_atomQueuePut
 652  002e 5b06          	addw	sp,#6
 653  0030 6b06          	ld	(OFST-1,sp),a
 654  0032 2724          	jreq	L571
 655                     ; 263             ATOMLOG (_STR("P%d\n"), status);
 657  0034 7b06          	ld	a,(OFST-1,sp)
 658  0036 88            	push	a
 659  0037 ae0013        	ldw	x,#L771
 660  003a cd0000        	call	_printf
 662  003d 84            	pop	a
 663                     ; 264             CRITICAL_START ();
 665  003e 96            	ldw	x,sp
 666  003f 1c0007        	addw	x,#OFST+0
 668  0042 8a            push CC
 669  0043 84            pop a
 670  0044 f7            ld (X),A
 671  0045 9b            sim
 673                     ; 265             g_failures++;
 675  0046 ce0000        	ldw	x,L51_g_failures
 676  0049 1c0001        	addw	x,#1
 677  004c cf0000        	ldw	L51_g_failures,x
 678                     ; 266             CRITICAL_END ();
 680  004f 96            	ldw	x,sp
 681  0050 1c0007        	addw	x,#OFST+0
 683  0053 f6            ld A,(X)
 684  0054 88            push A
 685  0055 86            pop CC
 687                     ; 267             break;
 689  0056 203b          	jra	L371
 690  0058               L571:
 691                     ; 271         if ((status = atomQueueGet (&queue1, 0, &msg)) != ATOM_OK)
 693  0058 96            	ldw	x,sp
 694  0059 1c0005        	addw	x,#OFST-2
 695  005c 89            	pushw	x
 696  005d ae0000        	ldw	x,#0
 697  0060 89            	pushw	x
 698  0061 ae0000        	ldw	x,#0
 699  0064 89            	pushw	x
 700  0065 ae0269        	ldw	x,#L3_queue1
 701  0068 cd0000        	call	_atomQueueGet
 703  006b 5b06          	addw	sp,#6
 704  006d 6b06          	ld	(OFST-1,sp),a
 705  006f 274b          	jreq	L171
 706                     ; 274             ATOMLOG (_STR("G%d\n"), status);
 708  0071 7b06          	ld	a,(OFST-1,sp)
 709  0073 88            	push	a
 710  0074 ae000e        	ldw	x,#L302
 711  0077 cd0000        	call	_printf
 713  007a 84            	pop	a
 714                     ; 275             CRITICAL_START ();
 716  007b 96            	ldw	x,sp
 717  007c 1c0007        	addw	x,#OFST+0
 719  007f 8a            push CC
 720  0080 84            pop a
 721  0081 f7            ld (X),A
 722  0082 9b            sim
 724                     ; 276             g_failures++;
 726  0083 ce0000        	ldw	x,L51_g_failures
 727  0086 1c0001        	addw	x,#1
 728  0089 cf0000        	ldw	L51_g_failures,x
 729                     ; 277             CRITICAL_END ();
 731  008c 96            	ldw	x,sp
 732  008d 1c0007        	addw	x,#OFST+0
 734  0090 f6            ld A,(X)
 735  0091 88            push A
 736  0092 86            pop CC
 738                     ; 278             break;
 739  0093               L371:
 740                     ; 283     if (atomSemPut (&sem1) != ATOM_OK)
 742  0093 ae025e        	ldw	x,#L7_sem1
 743  0096 cd0000        	call	_atomSemPut
 745  0099 4d            	tnz	a
 746  009a 273a          	jreq	L112
 747                     ; 285         ATOMLOG (_STR("Sem1 putfail\n"));
 749  009c ae0000        	ldw	x,#L702
 750  009f cd0000        	call	_printf
 752                     ; 286         CRITICAL_START ();
 754  00a2 96            	ldw	x,sp
 755  00a3 1c0007        	addw	x,#OFST+0
 757  00a6 8a            push CC
 758  00a7 84            pop a
 759  00a8 f7            ld (X),A
 760  00a9 9b            sim
 762                     ; 287         g_failures++;
 764  00aa ce0000        	ldw	x,L51_g_failures
 765  00ad 1c0001        	addw	x,#1
 766  00b0 cf0000        	ldw	L51_g_failures,x
 767                     ; 288         CRITICAL_END ();
 769  00b3 96            	ldw	x,sp
 770  00b4 1c0007        	addw	x,#OFST+0
 772  00b7 f6            ld A,(X)
 773  00b8 88            push A
 774  00b9 86            pop CC
 776  00ba 201a          	jra	L112
 777  00bc               L171:
 778                     ; 256     while (loop_cnt--)
 780  00bc 96            	ldw	x,sp
 781  00bd 1c0001        	addw	x,#OFST-6
 782  00c0 cd0000        	call	c_ltor
 784  00c3 96            	ldw	x,sp
 785  00c4 1c0001        	addw	x,#OFST-6
 786  00c7 a601          	ld	a,#1
 787  00c9 cd0000        	call	c_lgsbc
 789  00cc cd0000        	call	c_lrzmp
 791  00cf 2703          	jreq	L01
 792  00d1 cc0017        	jp	L561
 793  00d4               L01:
 794  00d4 20bd          	jra	L371
 795  00d6               L112:
 796                     ; 294         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 798  00d6 ae0064        	ldw	x,#100
 799  00d9 89            	pushw	x
 800  00da ae0000        	ldw	x,#0
 801  00dd 89            	pushw	x
 802  00de cd0000        	call	_atomTimerDelay
 804  00e1 5b04          	addw	sp,#4
 806  00e3 20f1          	jra	L112
1142                     	switch	.bss
1143  0000               L51_g_failures:
1144  0000 0000          	ds.b	2
1145  0002               L31_test_thread_stack:
1146  0002 000000000000  	ds.b	512
1147  0202               L11_tcb:
1148  0202 000000000000  	ds.b	92
1149  025e               L7_sem1:
1150  025e 000000        	ds.b	3
1151  0261               L5_queue1_storage:
1152  0261 000000000000  	ds.b	8
1153  0269               L3_queue1:
1154  0269 000000000000  	ds.b	26
1155                     	xref	_atomSemPut
1156                     	xref	_atomSemGet
1157                     	xref	_atomSemDelete
1158                     	xref	_atomSemCreate
1159                     	xref	_atomQueuePut
1160                     	xref	_atomQueueGet
1161                     	xref	_atomQueueDelete
1162                     	xref	_atomQueueCreate
1163                     	xdef	_test_start
1164                     	xref	_printf
1165                     	xref	_atomThreadStackCheck
1166                     	xref	_atomThreadCreate
1167                     	xref	_atomTimerDelay
1168                     .const:	section	.text
1169  0000               L702:
1170  0000 53656d312070  	dc.b	"Sem1 putfail",10,0
1171  000e               L302:
1172  000e 4725640a00    	dc.b	"G%d",10,0
1173  0013               L771:
1174  0013 5025640a00    	dc.b	"P%d",10,0
1175  0018               L731:
1176  0018 537461636b55  	dc.b	"StackUse:%d",10,0
1177  0025               L531:
1178  0025 537461636b4f  	dc.b	"StackOverflow %d",10,0
1179  0037               L721:
1180  0037 537461636b43  	dc.b	"StackCheck",10,0
1181  0043               L311:
1182  0043 44656c657465  	dc.b	"Delete failed",10,0
1183  0052               L17:
1184  0052 4572726f7220  	dc.b	"Error creating tes"
1185  0064 742074687265  	dc.b	"t thread",10,0
1186  006e               L36:
1187  006e 4572726f7220  	dc.b	"Error creating sem"
1188  0080 0a00          	dc.b	10,0
1189  0082               L55:
1190  0082 4572726f7220  	dc.b	"Error creating Q",10,0
1191                     	xref.b	c_x
1211                     	xref	c_lrzmp
1212                     	xref	c_lgsbc
1213                     	xref	c_ltor
1214                     	xref	c_itolx
1215                     	xref	c_lzmp
1216                     	xref	c_imul
1217                     	end
