   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 128                     ; 68 uint32_t test_start (void)
 128                     ; 69 {
 130                     .text:	section	.text,new
 131  0000               _test_start:
 133  0000 520f          	subw	sp,#15
 134       0000000f      OFST:	set	15
 137                     ; 76     failures = 0;
 139  0002 5f            	clrw	x
 140  0003 1f0e          	ldw	(OFST-1,sp),x
 141                     ; 81     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 143  0005 ae0008        	ldw	x,#8
 144  0008 89            	pushw	x
 145  0009 ae0000        	ldw	x,#0
 146  000c 89            	pushw	x
 147  000d ae0001        	ldw	x,#1
 148  0010 89            	pushw	x
 149  0011 ae0000        	ldw	x,#0
 150  0014 89            	pushw	x
 151  0015 ae000a        	ldw	x,#L7_queue1_storage
 152  0018 89            	pushw	x
 153  0019 ae002c        	ldw	x,#L3_queue1
 154  001c cd0000        	call	_atomQueueCreate
 156  001f 5b0a          	addw	sp,#10
 157  0021 4d            	tnz	a
 158  0022 270d          	jreq	L77
 159                     ; 83         ATOMLOG (_STR("Queue1 create\n"));
 161  0024 ae0110        	ldw	x,#L101
 162  0027 cd0000        	call	_printf
 164                     ; 84         failures++;
 166  002a 1e0e          	ldw	x,(OFST-1,sp)
 167  002c 1c0001        	addw	x,#1
 168  002f 1f0e          	ldw	(OFST-1,sp),x
 169  0031               L77:
 170                     ; 88     if (atomQueueCreate (&queue2, &queue2_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 172  0031 ae0008        	ldw	x,#8
 173  0034 89            	pushw	x
 174  0035 ae0000        	ldw	x,#0
 175  0038 89            	pushw	x
 176  0039 ae0001        	ldw	x,#1
 177  003c 89            	pushw	x
 178  003d ae0000        	ldw	x,#0
 179  0040 89            	pushw	x
 180  0041 ae0002        	ldw	x,#L11_queue2_storage
 181  0044 89            	pushw	x
 182  0045 ae0012        	ldw	x,#L5_queue2
 183  0048 cd0000        	call	_atomQueueCreate
 185  004b 5b0a          	addw	sp,#10
 186  004d 4d            	tnz	a
 187  004e 270f          	jreq	L301
 188                     ; 90         ATOMLOG (_STR("Queue2 create\n"));
 190  0050 ae0101        	ldw	x,#L501
 191  0053 cd0000        	call	_printf
 193                     ; 91         failures++;
 195  0056 1e0e          	ldw	x,(OFST-1,sp)
 196  0058 1c0001        	addw	x,#1
 197  005b 1f0e          	ldw	(OFST-1,sp),x
 199  005d 203b          	jra	L701
 200  005f               L301:
 201                     ; 96         msg = 0x66;
 203  005f a666          	ld	a,#102
 204  0061 6b0d          	ld	(OFST-2,sp),a
 205                     ; 97         for (count = 0; count < QUEUE_ENTRIES; count++)
 207  0063 5f            	clrw	x
 208  0064 1f01          	ldw	(OFST-14,sp),x
 209  0066               L111:
 210                     ; 100             if (atomQueuePut (&queue2, 0, &msg) != ATOM_OK)
 212  0066 96            	ldw	x,sp
 213  0067 1c000d        	addw	x,#OFST-2
 214  006a 89            	pushw	x
 215  006b ae0000        	ldw	x,#0
 216  006e 89            	pushw	x
 217  006f ae0000        	ldw	x,#0
 218  0072 89            	pushw	x
 219  0073 ae0012        	ldw	x,#L5_queue2
 220  0076 cd0000        	call	_atomQueuePut
 222  0079 5b06          	addw	sp,#6
 223  007b 4d            	tnz	a
 224  007c 270d          	jreq	L711
 225                     ; 102                 ATOMLOG (_STR("Queue2 put\n"));
 227  007e ae00f5        	ldw	x,#L121
 228  0081 cd0000        	call	_printf
 230                     ; 103                 failures++;
 232  0084 1e0e          	ldw	x,(OFST-1,sp)
 233  0086 1c0001        	addw	x,#1
 234  0089 1f0e          	ldw	(OFST-1,sp),x
 235  008b               L711:
 236                     ; 97         for (count = 0; count < QUEUE_ENTRIES; count++)
 238  008b 1e01          	ldw	x,(OFST-14,sp)
 239  008d 1c0001        	addw	x,#1
 240  0090 1f01          	ldw	(OFST-14,sp),x
 243  0092 9c            	rvf
 244  0093 1e01          	ldw	x,(OFST-14,sp)
 245  0095 a30008        	cpw	x,#8
 246  0098 2fcc          	jrslt	L111
 247  009a               L701:
 248                     ; 109     if (atomQueueGet (NULL, 0, &msg) != ATOM_ERR_PARAM)
 250  009a 96            	ldw	x,sp
 251  009b 1c000d        	addw	x,#OFST-2
 252  009e 89            	pushw	x
 253  009f ae0000        	ldw	x,#0
 254  00a2 89            	pushw	x
 255  00a3 ae0000        	ldw	x,#0
 256  00a6 89            	pushw	x
 257  00a7 5f            	clrw	x
 258  00a8 cd0000        	call	_atomQueueGet
 260  00ab 5b06          	addw	sp,#6
 261  00ad a1c9          	cp	a,#201
 262  00af 270d          	jreq	L321
 263                     ; 111         ATOMLOG (_STR("Get queue param failed\n"));
 265  00b1 ae00dd        	ldw	x,#L521
 266  00b4 cd0000        	call	_printf
 268                     ; 112         failures++;
 270  00b7 1e0e          	ldw	x,(OFST-1,sp)
 271  00b9 1c0001        	addw	x,#1
 272  00bc 1f0e          	ldw	(OFST-1,sp),x
 273  00be               L321:
 274                     ; 114     if (atomQueueGet (&queue1, 0, NULL) != ATOM_ERR_PARAM)
 276  00be 5f            	clrw	x
 277  00bf 89            	pushw	x
 278  00c0 ae0000        	ldw	x,#0
 279  00c3 89            	pushw	x
 280  00c4 ae0000        	ldw	x,#0
 281  00c7 89            	pushw	x
 282  00c8 ae002c        	ldw	x,#L3_queue1
 283  00cb cd0000        	call	_atomQueueGet
 285  00ce 5b06          	addw	sp,#6
 286  00d0 a1c9          	cp	a,#201
 287  00d2 270d          	jreq	L721
 288                     ; 116         ATOMLOG (_STR("Get msg param failed\n"));
 290  00d4 ae00c7        	ldw	x,#L131
 291  00d7 cd0000        	call	_printf
 293                     ; 117         failures++;
 295  00da 1e0e          	ldw	x,(OFST-1,sp)
 296  00dc 1c0001        	addw	x,#1
 297  00df 1f0e          	ldw	(OFST-1,sp),x
 298  00e1               L721:
 299                     ; 119     if (atomQueuePut (NULL, 0, &msg) != ATOM_ERR_PARAM)
 301  00e1 96            	ldw	x,sp
 302  00e2 1c000d        	addw	x,#OFST-2
 303  00e5 89            	pushw	x
 304  00e6 ae0000        	ldw	x,#0
 305  00e9 89            	pushw	x
 306  00ea ae0000        	ldw	x,#0
 307  00ed 89            	pushw	x
 308  00ee 5f            	clrw	x
 309  00ef cd0000        	call	_atomQueuePut
 311  00f2 5b06          	addw	sp,#6
 312  00f4 a1c9          	cp	a,#201
 313  00f6 270d          	jreq	L331
 314                     ; 121         ATOMLOG (_STR("Put queue param failed\n"));
 316  00f8 ae00af        	ldw	x,#L531
 317  00fb cd0000        	call	_printf
 319                     ; 122         failures++;
 321  00fe 1e0e          	ldw	x,(OFST-1,sp)
 322  0100 1c0001        	addw	x,#1
 323  0103 1f0e          	ldw	(OFST-1,sp),x
 324  0105               L331:
 325                     ; 124     if (atomQueuePut (&queue1, 0, NULL) != ATOM_ERR_PARAM)
 327  0105 5f            	clrw	x
 328  0106 89            	pushw	x
 329  0107 ae0000        	ldw	x,#0
 330  010a 89            	pushw	x
 331  010b ae0000        	ldw	x,#0
 332  010e 89            	pushw	x
 333  010f ae002c        	ldw	x,#L3_queue1
 334  0112 cd0000        	call	_atomQueuePut
 336  0115 5b06          	addw	sp,#6
 337  0117 a1c9          	cp	a,#201
 338  0119 270d          	jreq	L731
 339                     ; 126         ATOMLOG (_STR("Put msg param failed\n"));
 341  011b ae0099        	ldw	x,#L141
 342  011e cd0000        	call	_printf
 344                     ; 127         failures++;
 346  0121 1e0e          	ldw	x,(OFST-1,sp)
 347  0123 1c0001        	addw	x,#1
 348  0126 1f0e          	ldw	(OFST-1,sp),x
 349  0128               L731:
 350                     ; 131     g_result = 0;
 352  0128 5f            	clrw	x
 353  0129 cf0000        	ldw	L31_g_result,x
 354                     ; 134     timer_cb.cb_func = testCallbackGet;
 356  012c ae0000        	ldw	x,#L51_testCallbackGet
 357  012f 1f03          	ldw	(OFST-12,sp),x
 358                     ; 135     timer_cb.cb_data = NULL;
 360  0131 5f            	clrw	x
 361  0132 1f05          	ldw	(OFST-10,sp),x
 362                     ; 136     timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 364  0134 ae0064        	ldw	x,#100
 365  0137 1f09          	ldw	(OFST-6,sp),x
 366  0139 ae0000        	ldw	x,#0
 367  013c 1f07          	ldw	(OFST-8,sp),x
 368                     ; 139     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 370  013e 96            	ldw	x,sp
 371  013f 1c0003        	addw	x,#OFST-12
 372  0142 cd0000        	call	_atomTimerRegister
 374  0145 4d            	tnz	a
 375  0146 270f          	jreq	L341
 376                     ; 141         ATOMLOG (_STR("Error registering timer\n"));
 378  0148 ae0080        	ldw	x,#L541
 379  014b cd0000        	call	_printf
 381                     ; 142         failures++;
 383  014e 1e0e          	ldw	x,(OFST-1,sp)
 384  0150 1c0001        	addw	x,#1
 385  0153 1f0e          	ldw	(OFST-1,sp),x
 387  0155 2022          	jra	L741
 388  0157               L341:
 389                     ; 148         atomTimerDelay (2 * SYSTEM_TICKS_PER_SEC);
 391  0157 ae00c8        	ldw	x,#200
 392  015a 89            	pushw	x
 393  015b ae0000        	ldw	x,#0
 394  015e 89            	pushw	x
 395  015f cd0000        	call	_atomTimerDelay
 397  0162 5b04          	addw	sp,#4
 398                     ; 149         if (g_result != 1)
 400  0164 ce0000        	ldw	x,L31_g_result
 401  0167 a30001        	cpw	x,#1
 402  016a 270d          	jreq	L741
 403                     ; 151             ATOMLOG (_STR("Get context check failed\n"));
 405  016c ae0066        	ldw	x,#L351
 406  016f cd0000        	call	_printf
 408                     ; 152             failures++;
 410  0172 1e0e          	ldw	x,(OFST-1,sp)
 411  0174 1c0001        	addw	x,#1
 412  0177 1f0e          	ldw	(OFST-1,sp),x
 413  0179               L741:
 414                     ; 157     g_result = 0;
 416  0179 5f            	clrw	x
 417  017a cf0000        	ldw	L31_g_result,x
 418                     ; 160     timer_cb.cb_func = testCallbackPut;
 420  017d ae0000        	ldw	x,#L71_testCallbackPut
 421  0180 1f03          	ldw	(OFST-12,sp),x
 422                     ; 161     timer_cb.cb_data = NULL;
 424  0182 5f            	clrw	x
 425  0183 1f05          	ldw	(OFST-10,sp),x
 426                     ; 162     timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 428  0185 ae0064        	ldw	x,#100
 429  0188 1f09          	ldw	(OFST-6,sp),x
 430  018a ae0000        	ldw	x,#0
 431  018d 1f07          	ldw	(OFST-8,sp),x
 432                     ; 165     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 434  018f 96            	ldw	x,sp
 435  0190 1c0003        	addw	x,#OFST-12
 436  0193 cd0000        	call	_atomTimerRegister
 438  0196 4d            	tnz	a
 439  0197 270f          	jreq	L551
 440                     ; 167         ATOMLOG (_STR("Error registering timer\n"));
 442  0199 ae0080        	ldw	x,#L541
 443  019c cd0000        	call	_printf
 445                     ; 168         failures++;
 447  019f 1e0e          	ldw	x,(OFST-1,sp)
 448  01a1 1c0001        	addw	x,#1
 449  01a4 1f0e          	ldw	(OFST-1,sp),x
 451  01a6 2022          	jra	L751
 452  01a8               L551:
 453                     ; 174         atomTimerDelay (2 * SYSTEM_TICKS_PER_SEC);
 455  01a8 ae00c8        	ldw	x,#200
 456  01ab 89            	pushw	x
 457  01ac ae0000        	ldw	x,#0
 458  01af 89            	pushw	x
 459  01b0 cd0000        	call	_atomTimerDelay
 461  01b3 5b04          	addw	sp,#4
 462                     ; 175         if (g_result != 1)
 464  01b5 ce0000        	ldw	x,L31_g_result
 465  01b8 a30001        	cpw	x,#1
 466  01bb 270d          	jreq	L751
 467                     ; 177             ATOMLOG (_STR("Put context check failed\n"));
 469  01bd ae004c        	ldw	x,#L361
 470  01c0 cd0000        	call	_printf
 472                     ; 178             failures++;
 474  01c3 1e0e          	ldw	x,(OFST-1,sp)
 475  01c5 1c0001        	addw	x,#1
 476  01c8 1f0e          	ldw	(OFST-1,sp),x
 477  01ca               L751:
 478                     ; 185     if (atomQueueGet (&queue1, SYSTEM_TICKS_PER_SEC, &msg) != ATOM_TIMEOUT)
 480  01ca 96            	ldw	x,sp
 481  01cb 1c000d        	addw	x,#OFST-2
 482  01ce 89            	pushw	x
 483  01cf ae0064        	ldw	x,#100
 484  01d2 89            	pushw	x
 485  01d3 ae0000        	ldw	x,#0
 486  01d6 89            	pushw	x
 487  01d7 ae002c        	ldw	x,#L3_queue1
 488  01da cd0000        	call	_atomQueueGet
 490  01dd 5b06          	addw	sp,#6
 491  01df a102          	cp	a,#2
 492  01e1 270d          	jreq	L561
 493                     ; 187         ATOMLOG (_STR("Timeout q1 failed\n"));
 495  01e3 ae0039        	ldw	x,#L761
 496  01e6 cd0000        	call	_printf
 498                     ; 188         failures++;
 500  01e9 1e0e          	ldw	x,(OFST-1,sp)
 501  01eb 1c0001        	addw	x,#1
 502  01ee 1f0e          	ldw	(OFST-1,sp),x
 503  01f0               L561:
 504                     ; 192     msg = 0x66;
 506  01f0 a666          	ld	a,#102
 507  01f2 6b0d          	ld	(OFST-2,sp),a
 508                     ; 193     if (atomQueuePut (&queue2, SYSTEM_TICKS_PER_SEC, &msg) != ATOM_TIMEOUT)
 510  01f4 96            	ldw	x,sp
 511  01f5 1c000d        	addw	x,#OFST-2
 512  01f8 89            	pushw	x
 513  01f9 ae0064        	ldw	x,#100
 514  01fc 89            	pushw	x
 515  01fd ae0000        	ldw	x,#0
 516  0200 89            	pushw	x
 517  0201 ae0012        	ldw	x,#L5_queue2
 518  0204 cd0000        	call	_atomQueuePut
 520  0207 5b06          	addw	sp,#6
 521  0209 a102          	cp	a,#2
 522  020b 270d          	jreq	L171
 523                     ; 195         ATOMLOG (_STR("Timeout q2 failed\n"));
 525  020d ae0026        	ldw	x,#L371
 526  0210 cd0000        	call	_printf
 528                     ; 196         failures++;
 530  0213 1e0e          	ldw	x,(OFST-1,sp)
 531  0215 1c0001        	addw	x,#1
 532  0218 1f0e          	ldw	(OFST-1,sp),x
 533  021a               L171:
 534                     ; 202     if (atomQueueGet (&queue1, -1, &msg) != ATOM_WOULDBLOCK)
 536  021a 96            	ldw	x,sp
 537  021b 1c000d        	addw	x,#OFST-2
 538  021e 89            	pushw	x
 539  021f aeffff        	ldw	x,#65535
 540  0222 89            	pushw	x
 541  0223 aeffff        	ldw	x,#-1
 542  0226 89            	pushw	x
 543  0227 ae002c        	ldw	x,#L3_queue1
 544  022a cd0000        	call	_atomQueueGet
 546  022d 5b06          	addw	sp,#6
 547  022f a103          	cp	a,#3
 548  0231 270d          	jreq	L571
 549                     ; 204         ATOMLOG (_STR("Timeout q1 failed\n"));
 551  0233 ae0039        	ldw	x,#L761
 552  0236 cd0000        	call	_printf
 554                     ; 205         failures++;
 556  0239 1e0e          	ldw	x,(OFST-1,sp)
 557  023b 1c0001        	addw	x,#1
 558  023e 1f0e          	ldw	(OFST-1,sp),x
 559  0240               L571:
 560                     ; 209     msg = 0x66;
 562  0240 a666          	ld	a,#102
 563  0242 6b0d          	ld	(OFST-2,sp),a
 564                     ; 210     if (atomQueuePut (&queue2, -1, &msg) != ATOM_WOULDBLOCK)
 566  0244 96            	ldw	x,sp
 567  0245 1c000d        	addw	x,#OFST-2
 568  0248 89            	pushw	x
 569  0249 aeffff        	ldw	x,#65535
 570  024c 89            	pushw	x
 571  024d aeffff        	ldw	x,#-1
 572  0250 89            	pushw	x
 573  0251 ae0012        	ldw	x,#L5_queue2
 574  0254 cd0000        	call	_atomQueuePut
 576  0257 5b06          	addw	sp,#6
 577  0259 a103          	cp	a,#3
 578  025b 270d          	jreq	L771
 579                     ; 212         ATOMLOG (_STR("Timeout q2 failed\n"));
 581  025d ae0026        	ldw	x,#L371
 582  0260 cd0000        	call	_printf
 584                     ; 213         failures++;
 586  0263 1e0e          	ldw	x,(OFST-1,sp)
 587  0265 1c0001        	addw	x,#1
 588  0268 1f0e          	ldw	(OFST-1,sp),x
 589  026a               L771:
 590                     ; 217     if (atomQueueDelete (&queue1) != ATOM_OK)
 592  026a ae002c        	ldw	x,#L3_queue1
 593  026d cd0000        	call	_atomQueueDelete
 595  0270 4d            	tnz	a
 596  0271 270d          	jreq	L102
 597                     ; 219         ATOMLOG (_STR("Error deleting q1\n"));
 599  0273 ae0013        	ldw	x,#L302
 600  0276 cd0000        	call	_printf
 602                     ; 220         failures++;
 604  0279 1e0e          	ldw	x,(OFST-1,sp)
 605  027b 1c0001        	addw	x,#1
 606  027e 1f0e          	ldw	(OFST-1,sp),x
 607  0280               L102:
 608                     ; 222     if (atomQueueDelete (&queue2) != ATOM_OK)
 610  0280 ae0012        	ldw	x,#L5_queue2
 611  0283 cd0000        	call	_atomQueueDelete
 613  0286 4d            	tnz	a
 614  0287 270d          	jreq	L502
 615                     ; 224         ATOMLOG (_STR("Error deleting q2\n"));
 617  0289 ae0000        	ldw	x,#L702
 618  028c cd0000        	call	_printf
 620                     ; 225         failures++;
 622  028f 1e0e          	ldw	x,(OFST-1,sp)
 623  0291 1c0001        	addw	x,#1
 624  0294 1f0e          	ldw	(OFST-1,sp),x
 625  0296               L502:
 626                     ; 229     return failures;
 628  0296 1e0e          	ldw	x,(OFST-1,sp)
 629  0298 cd0000        	call	c_itolx
 633  029b 5b0f          	addw	sp,#15
 634  029d 81            	ret
 679                     ; 241 static void testCallbackGet (POINTER cb_data)
 679                     ; 242 {
 680                     .text:	section	.text,new
 681  0000               L51_testCallbackGet:
 683  0000 88            	push	a
 684       00000001      OFST:	set	1
 687                     ; 246     if (atomQueueGet(&queue1, 0, &msg) == ATOM_ERR_CONTEXT)
 689  0001 96            	ldw	x,sp
 690  0002 1c0001        	addw	x,#OFST+0
 691  0005 89            	pushw	x
 692  0006 ae0000        	ldw	x,#0
 693  0009 89            	pushw	x
 694  000a ae0000        	ldw	x,#0
 695  000d 89            	pushw	x
 696  000e ae002c        	ldw	x,#L3_queue1
 697  0011 cd0000        	call	_atomQueueGet
 699  0014 5b06          	addw	sp,#6
 700  0016 a1c8          	cp	a,#200
 701  0018 2606          	jrne	L332
 702                     ; 249         g_result = 1;
 704  001a ae0001        	ldw	x,#1
 705  001d cf0000        	ldw	L31_g_result,x
 707  0020               L332:
 708                     ; 256 }
 711  0020 84            	pop	a
 712  0021 81            	ret
 757                     ; 267 static void testCallbackPut (POINTER cb_data)
 757                     ; 268 {
 758                     .text:	section	.text,new
 759  0000               L71_testCallbackPut:
 761  0000 88            	push	a
 762       00000001      OFST:	set	1
 765                     ; 272     msg = 0x66;
 767  0001 a666          	ld	a,#102
 768  0003 6b01          	ld	(OFST+0,sp),a
 769                     ; 273     if (atomQueuePut(&queue2, 0, &msg) == ATOM_ERR_CONTEXT)
 771  0005 96            	ldw	x,sp
 772  0006 1c0001        	addw	x,#OFST+0
 773  0009 89            	pushw	x
 774  000a ae0000        	ldw	x,#0
 775  000d 89            	pushw	x
 776  000e ae0000        	ldw	x,#0
 777  0011 89            	pushw	x
 778  0012 ae0012        	ldw	x,#L5_queue2
 779  0015 cd0000        	call	_atomQueuePut
 781  0018 5b06          	addw	sp,#6
 782  001a a1c8          	cp	a,#200
 783  001c 2606          	jrne	L752
 784                     ; 276         g_result = 1;
 786  001e ae0001        	ldw	x,#1
 787  0021 cf0000        	ldw	L31_g_result,x
 789  0024               L752:
 790                     ; 283 }
 793  0024 84            	pop	a
 794  0025 81            	ret
1044                     	switch	.bss
1045  0000               L31_g_result:
1046  0000 0000          	ds.b	2
1047  0002               L11_queue2_storage:
1048  0002 000000000000  	ds.b	8
1049  000a               L7_queue1_storage:
1050  000a 000000000000  	ds.b	8
1051  0012               L5_queue2:
1052  0012 000000000000  	ds.b	26
1053  002c               L3_queue1:
1054  002c 000000000000  	ds.b	26
1055                     	xdef	_test_start
1056                     	xref	_printf
1057                     	xref	_atomQueuePut
1058                     	xref	_atomQueueGet
1059                     	xref	_atomQueueDelete
1060                     	xref	_atomQueueCreate
1061                     	xref	_atomTimerDelay
1062                     	xref	_atomTimerRegister
1063                     .const:	section	.text
1064  0000               L702:
1065  0000 4572726f7220  	dc.b	"Error deleting q2",10,0
1066  0013               L302:
1067  0013 4572726f7220  	dc.b	"Error deleting q1",10,0
1068  0026               L371:
1069  0026 54696d656f75  	dc.b	"Timeout q2 failed",10,0
1070  0039               L761:
1071  0039 54696d656f75  	dc.b	"Timeout q1 failed",10,0
1072  004c               L361:
1073  004c 50757420636f  	dc.b	"Put context check "
1074  005e 6661696c6564  	dc.b	"failed",10,0
1075  0066               L351:
1076  0066 47657420636f  	dc.b	"Get context check "
1077  0078 6661696c6564  	dc.b	"failed",10,0
1078  0080               L541:
1079  0080 4572726f7220  	dc.b	"Error registering "
1080  0092 74696d65720a  	dc.b	"timer",10,0
1081  0099               L141:
1082  0099 507574206d73  	dc.b	"Put msg param fail"
1083  00ab 65640a00      	dc.b	"ed",10,0
1084  00af               L531:
1085  00af 507574207175  	dc.b	"Put queue param fa"
1086  00c1 696c65640a00  	dc.b	"iled",10,0
1087  00c7               L131:
1088  00c7 476574206d73  	dc.b	"Get msg param fail"
1089  00d9 65640a00      	dc.b	"ed",10,0
1090  00dd               L521:
1091  00dd 476574207175  	dc.b	"Get queue param fa"
1092  00ef 696c65640a00  	dc.b	"iled",10,0
1093  00f5               L121:
1094  00f5 517565756532  	dc.b	"Queue2 put",10,0
1095  0101               L501:
1096  0101 517565756532  	dc.b	"Queue2 create",10,0
1097  0110               L101:
1098  0110 517565756531  	dc.b	"Queue1 create",10,0
1118                     	xref	c_itolx
1119                     	end
