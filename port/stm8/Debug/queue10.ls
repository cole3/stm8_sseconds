   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.data
   5  0000               _test_values:
   6  0000 12345678      	dc.l	305419896
   7  0004 ff000000      	dc.l	-16777216
   8  0008 00ff0000      	dc.l	16711680
   9  000c 0000ff00      	dc.l	65280
  10  0010 000000ff      	dc.l	255
  11  0014 f000000f      	dc.l	-268435441
  12  0018 0f0000f0      	dc.l	251658480
  13  001c 00f00f00      	dc.l	15732480
  14  0020 000ff000      	dc.l	1044480
  15  0024 87654321      	dc.l	-2023406815
  16  0028 abcd0000      	dc.l	-1412628480
  17  002c 0000cdef      	dc.l	52719
  83                     ; 80 uint32_t test_start (void)
  83                     ; 81 {
  85                     .text:	section	.text,new
  86  0000               _test_start:
  88  0000 520a          	subw	sp,#10
  89       0000000a      OFST:	set	10
  92                     ; 86     failures = 0;
  94  0002 5f            	clrw	x
  95  0003 1f03          	ldw	(OFST-7,sp),x
  96                     ; 89     if (atomQueueCreate (&queue1, (uint8_t *)&queue1_storage[0], sizeof(queue1_storage[0]), QUEUE_ENTRIES) != ATOM_OK)
  98  0005 ae0008        	ldw	x,#8
  99  0008 89            	pushw	x
 100  0009 ae0000        	ldw	x,#0
 101  000c 89            	pushw	x
 102  000d ae0004        	ldw	x,#4
 103  0010 89            	pushw	x
 104  0011 ae0000        	ldw	x,#0
 105  0014 89            	pushw	x
 106  0015 ae0000        	ldw	x,#L5_queue1_storage
 107  0018 89            	pushw	x
 108  0019 ae0020        	ldw	x,#L3_queue1
 109  001c cd0000        	call	_atomQueueCreate
 111  001f 5b0a          	addw	sp,#10
 112  0021 4d            	tnz	a
 113  0022 2715          	jreq	L73
 114                     ; 91         ATOMLOG (_STR("Error creating test queue\n"));
 116  0024 ae0020        	ldw	x,#L14
 117  0027 cd0000        	call	_printf
 119                     ; 92         failures++;
 121  002a 1e03          	ldw	x,(OFST-7,sp)
 122  002c 1c0001        	addw	x,#1
 123  002f 1f03          	ldw	(OFST-7,sp),x
 125  0031               L34:
 126                     ; 206     return failures;
 128  0031 1e03          	ldw	x,(OFST-7,sp)
 129  0033 cd0000        	call	c_itolx
 133  0036 5b0a          	addw	sp,#10
 134  0038 81            	ret
 135  0039               L73:
 136                     ; 98         tx_count = rx_count = 0;
 138  0039 5f            	clrw	x
 139  003a 1f09          	ldw	(OFST-1,sp),x
 140  003c 5f            	clrw	x
 141  003d 1f01          	ldw	(OFST-9,sp),x
 143  003f 2044          	jra	L15
 144  0041               L54:
 145                     ; 103             msg = test_values[tx_count];
 147  0041 1e01          	ldw	x,(OFST-9,sp)
 148  0043 58            	sllw	x
 149  0044 58            	sllw	x
 150  0045 d60003        	ld	a,(_test_values+3,x)
 151  0048 6b08          	ld	(OFST-2,sp),a
 152  004a d60002        	ld	a,(_test_values+2,x)
 153  004d 6b07          	ld	(OFST-3,sp),a
 154  004f d60001        	ld	a,(_test_values+1,x)
 155  0052 6b06          	ld	(OFST-4,sp),a
 156  0054 d60000        	ld	a,(_test_values,x)
 157  0057 6b05          	ld	(OFST-5,sp),a
 158                     ; 104             if (atomQueuePut (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 160  0059 96            	ldw	x,sp
 161  005a 1c0005        	addw	x,#OFST-5
 162  005d 89            	pushw	x
 163  005e ae0000        	ldw	x,#0
 164  0061 89            	pushw	x
 165  0062 ae0000        	ldw	x,#0
 166  0065 89            	pushw	x
 167  0066 ae0020        	ldw	x,#L3_queue1
 168  0069 cd0000        	call	_atomQueuePut
 170  006c 5b06          	addw	sp,#6
 171  006e 4d            	tnz	a
 172  006f 270d          	jreq	L55
 173                     ; 106                 ATOMLOG (_STR("Failed post\n"));
 175  0071 ae0013        	ldw	x,#L75
 176  0074 cd0000        	call	_printf
 178                     ; 107                 failures++;
 180  0077 1e03          	ldw	x,(OFST-7,sp)
 181  0079 1c0001        	addw	x,#1
 182  007c 1f03          	ldw	(OFST-7,sp),x
 183  007e               L55:
 184                     ; 101         for (; tx_count < 2; tx_count++)
 186  007e 1e01          	ldw	x,(OFST-9,sp)
 187  0080 1c0001        	addw	x,#1
 188  0083 1f01          	ldw	(OFST-9,sp),x
 189  0085               L15:
 192  0085 9c            	rvf
 193  0086 1e01          	ldw	x,(OFST-9,sp)
 194  0088 a30002        	cpw	x,#2
 195  008b 2fb4          	jrslt	L54
 197  008d 2052          	jra	L56
 198  008f               L16:
 199                     ; 114             if (atomQueueGet (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 201  008f 96            	ldw	x,sp
 202  0090 1c0005        	addw	x,#OFST-5
 203  0093 89            	pushw	x
 204  0094 ae0000        	ldw	x,#0
 205  0097 89            	pushw	x
 206  0098 ae0000        	ldw	x,#0
 207  009b 89            	pushw	x
 208  009c ae0020        	ldw	x,#L3_queue1
 209  009f cd0000        	call	_atomQueueGet
 211  00a2 5b06          	addw	sp,#6
 212  00a4 4d            	tnz	a
 213  00a5 270f          	jreq	L17
 214                     ; 116                 ATOMLOG (_STR("Failed get\n"));
 216  00a7 ae0007        	ldw	x,#L37
 217  00aa cd0000        	call	_printf
 219                     ; 117                 failures++;
 221  00ad 1e03          	ldw	x,(OFST-7,sp)
 222  00af 1c0001        	addw	x,#1
 223  00b2 1f03          	ldw	(OFST-7,sp),x
 225  00b4 2024          	jra	L57
 226  00b6               L17:
 227                     ; 119             else if (msg != test_values[rx_count])
 229  00b6 1e09          	ldw	x,(OFST-1,sp)
 230  00b8 58            	sllw	x
 231  00b9 58            	sllw	x
 232  00ba 1c0000        	addw	x,#_test_values
 233  00bd cd0000        	call	c_ltor
 235  00c0 96            	ldw	x,sp
 236  00c1 1c0005        	addw	x,#OFST-5
 237  00c4 cd0000        	call	c_lcmp
 239  00c7 2711          	jreq	L57
 240                     ; 121                 ATOMLOG (_STR("Val%d\n"), rx_count);
 242  00c9 1e09          	ldw	x,(OFST-1,sp)
 243  00cb 89            	pushw	x
 244  00cc ae0000        	ldw	x,#L101
 245  00cf cd0000        	call	_printf
 247  00d2 85            	popw	x
 248                     ; 122                 failures++;
 250  00d3 1e03          	ldw	x,(OFST-7,sp)
 251  00d5 1c0001        	addw	x,#1
 252  00d8 1f03          	ldw	(OFST-7,sp),x
 253  00da               L57:
 254                     ; 112         for (; rx_count < 2; rx_count++)
 256  00da 1e09          	ldw	x,(OFST-1,sp)
 257  00dc 1c0001        	addw	x,#1
 258  00df 1f09          	ldw	(OFST-1,sp),x
 259  00e1               L56:
 262  00e1 9c            	rvf
 263  00e2 1e09          	ldw	x,(OFST-1,sp)
 264  00e4 a30002        	cpw	x,#2
 265  00e7 2fa6          	jrslt	L16
 267  00e9 2044          	jra	L701
 268  00eb               L301:
 269                     ; 129             msg = test_values[tx_count];
 271  00eb 1e01          	ldw	x,(OFST-9,sp)
 272  00ed 58            	sllw	x
 273  00ee 58            	sllw	x
 274  00ef d60003        	ld	a,(_test_values+3,x)
 275  00f2 6b08          	ld	(OFST-2,sp),a
 276  00f4 d60002        	ld	a,(_test_values+2,x)
 277  00f7 6b07          	ld	(OFST-3,sp),a
 278  00f9 d60001        	ld	a,(_test_values+1,x)
 279  00fc 6b06          	ld	(OFST-4,sp),a
 280  00fe d60000        	ld	a,(_test_values,x)
 281  0101 6b05          	ld	(OFST-5,sp),a
 282                     ; 130             if (atomQueuePut (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 284  0103 96            	ldw	x,sp
 285  0104 1c0005        	addw	x,#OFST-5
 286  0107 89            	pushw	x
 287  0108 ae0000        	ldw	x,#0
 288  010b 89            	pushw	x
 289  010c ae0000        	ldw	x,#0
 290  010f 89            	pushw	x
 291  0110 ae0020        	ldw	x,#L3_queue1
 292  0113 cd0000        	call	_atomQueuePut
 294  0116 5b06          	addw	sp,#6
 295  0118 4d            	tnz	a
 296  0119 270d          	jreq	L311
 297                     ; 132                 ATOMLOG (_STR("Failed post\n"));
 299  011b ae0013        	ldw	x,#L75
 300  011e cd0000        	call	_printf
 302                     ; 133                 failures++;
 304  0121 1e03          	ldw	x,(OFST-7,sp)
 305  0123 1c0001        	addw	x,#1
 306  0126 1f03          	ldw	(OFST-7,sp),x
 307  0128               L311:
 308                     ; 127         for (; tx_count < 5; tx_count++)
 310  0128 1e01          	ldw	x,(OFST-9,sp)
 311  012a 1c0001        	addw	x,#1
 312  012d 1f01          	ldw	(OFST-9,sp),x
 313  012f               L701:
 316  012f 9c            	rvf
 317  0130 1e01          	ldw	x,(OFST-9,sp)
 318  0132 a30005        	cpw	x,#5
 319  0135 2fb4          	jrslt	L301
 321  0137 2052          	jra	L121
 322  0139               L511:
 323                     ; 140             if (atomQueueGet (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 325  0139 96            	ldw	x,sp
 326  013a 1c0005        	addw	x,#OFST-5
 327  013d 89            	pushw	x
 328  013e ae0000        	ldw	x,#0
 329  0141 89            	pushw	x
 330  0142 ae0000        	ldw	x,#0
 331  0145 89            	pushw	x
 332  0146 ae0020        	ldw	x,#L3_queue1
 333  0149 cd0000        	call	_atomQueueGet
 335  014c 5b06          	addw	sp,#6
 336  014e 4d            	tnz	a
 337  014f 270f          	jreq	L521
 338                     ; 142                 ATOMLOG (_STR("Failed get\n"));
 340  0151 ae0007        	ldw	x,#L37
 341  0154 cd0000        	call	_printf
 343                     ; 143                 failures++;
 345  0157 1e03          	ldw	x,(OFST-7,sp)
 346  0159 1c0001        	addw	x,#1
 347  015c 1f03          	ldw	(OFST-7,sp),x
 349  015e 2024          	jra	L721
 350  0160               L521:
 351                     ; 145             else if (msg != test_values[rx_count])
 353  0160 1e09          	ldw	x,(OFST-1,sp)
 354  0162 58            	sllw	x
 355  0163 58            	sllw	x
 356  0164 1c0000        	addw	x,#_test_values
 357  0167 cd0000        	call	c_ltor
 359  016a 96            	ldw	x,sp
 360  016b 1c0005        	addw	x,#OFST-5
 361  016e cd0000        	call	c_lcmp
 363  0171 2711          	jreq	L721
 364                     ; 147                 ATOMLOG (_STR("Val%d\n"), rx_count);
 366  0173 1e09          	ldw	x,(OFST-1,sp)
 367  0175 89            	pushw	x
 368  0176 ae0000        	ldw	x,#L101
 369  0179 cd0000        	call	_printf
 371  017c 85            	popw	x
 372                     ; 148                 failures++;
 374  017d 1e03          	ldw	x,(OFST-7,sp)
 375  017f 1c0001        	addw	x,#1
 376  0182 1f03          	ldw	(OFST-7,sp),x
 377  0184               L721:
 378                     ; 138         for (; rx_count < 3; rx_count++)
 380  0184 1e09          	ldw	x,(OFST-1,sp)
 381  0186 1c0001        	addw	x,#1
 382  0189 1f09          	ldw	(OFST-1,sp),x
 383  018b               L121:
 386  018b 9c            	rvf
 387  018c 1e09          	ldw	x,(OFST-1,sp)
 388  018e a30003        	cpw	x,#3
 389  0191 2fa6          	jrslt	L511
 391  0193 2044          	jra	L731
 392  0195               L331:
 393                     ; 155             msg = test_values[tx_count];
 395  0195 1e01          	ldw	x,(OFST-9,sp)
 396  0197 58            	sllw	x
 397  0198 58            	sllw	x
 398  0199 d60003        	ld	a,(_test_values+3,x)
 399  019c 6b08          	ld	(OFST-2,sp),a
 400  019e d60002        	ld	a,(_test_values+2,x)
 401  01a1 6b07          	ld	(OFST-3,sp),a
 402  01a3 d60001        	ld	a,(_test_values+1,x)
 403  01a6 6b06          	ld	(OFST-4,sp),a
 404  01a8 d60000        	ld	a,(_test_values,x)
 405  01ab 6b05          	ld	(OFST-5,sp),a
 406                     ; 156             if (atomQueuePut (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 408  01ad 96            	ldw	x,sp
 409  01ae 1c0005        	addw	x,#OFST-5
 410  01b1 89            	pushw	x
 411  01b2 ae0000        	ldw	x,#0
 412  01b5 89            	pushw	x
 413  01b6 ae0000        	ldw	x,#0
 414  01b9 89            	pushw	x
 415  01ba ae0020        	ldw	x,#L3_queue1
 416  01bd cd0000        	call	_atomQueuePut
 418  01c0 5b06          	addw	sp,#6
 419  01c2 4d            	tnz	a
 420  01c3 270d          	jreq	L341
 421                     ; 158                 ATOMLOG (_STR("Failed post\n"));
 423  01c5 ae0013        	ldw	x,#L75
 424  01c8 cd0000        	call	_printf
 426                     ; 159                 failures++;
 428  01cb 1e03          	ldw	x,(OFST-7,sp)
 429  01cd 1c0001        	addw	x,#1
 430  01d0 1f03          	ldw	(OFST-7,sp),x
 431  01d2               L341:
 432                     ; 153         for (; tx_count < 10; tx_count++)
 434  01d2 1e01          	ldw	x,(OFST-9,sp)
 435  01d4 1c0001        	addw	x,#1
 436  01d7 1f01          	ldw	(OFST-9,sp),x
 437  01d9               L731:
 440  01d9 9c            	rvf
 441  01da 1e01          	ldw	x,(OFST-9,sp)
 442  01dc a3000a        	cpw	x,#10
 443  01df 2fb4          	jrslt	L331
 445  01e1 2052          	jra	L151
 446  01e3               L541:
 447                     ; 166             if (atomQueueGet (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 449  01e3 96            	ldw	x,sp
 450  01e4 1c0005        	addw	x,#OFST-5
 451  01e7 89            	pushw	x
 452  01e8 ae0000        	ldw	x,#0
 453  01eb 89            	pushw	x
 454  01ec ae0000        	ldw	x,#0
 455  01ef 89            	pushw	x
 456  01f0 ae0020        	ldw	x,#L3_queue1
 457  01f3 cd0000        	call	_atomQueueGet
 459  01f6 5b06          	addw	sp,#6
 460  01f8 4d            	tnz	a
 461  01f9 270f          	jreq	L551
 462                     ; 168                 ATOMLOG (_STR("Failed get\n"));
 464  01fb ae0007        	ldw	x,#L37
 465  01fe cd0000        	call	_printf
 467                     ; 169                 failures++;
 469  0201 1e03          	ldw	x,(OFST-7,sp)
 470  0203 1c0001        	addw	x,#1
 471  0206 1f03          	ldw	(OFST-7,sp),x
 473  0208 2024          	jra	L751
 474  020a               L551:
 475                     ; 171             else if (msg != test_values[rx_count])
 477  020a 1e09          	ldw	x,(OFST-1,sp)
 478  020c 58            	sllw	x
 479  020d 58            	sllw	x
 480  020e 1c0000        	addw	x,#_test_values
 481  0211 cd0000        	call	c_ltor
 483  0214 96            	ldw	x,sp
 484  0215 1c0005        	addw	x,#OFST-5
 485  0218 cd0000        	call	c_lcmp
 487  021b 2711          	jreq	L751
 488                     ; 173                 ATOMLOG (_STR("Val%d\n"), rx_count);
 490  021d 1e09          	ldw	x,(OFST-1,sp)
 491  021f 89            	pushw	x
 492  0220 ae0000        	ldw	x,#L101
 493  0223 cd0000        	call	_printf
 495  0226 85            	popw	x
 496                     ; 174                 failures++;
 498  0227 1e03          	ldw	x,(OFST-7,sp)
 499  0229 1c0001        	addw	x,#1
 500  022c 1f03          	ldw	(OFST-7,sp),x
 501  022e               L751:
 502                     ; 164         for (; rx_count < 6; rx_count++)
 504  022e 1e09          	ldw	x,(OFST-1,sp)
 505  0230 1c0001        	addw	x,#1
 506  0233 1f09          	ldw	(OFST-1,sp),x
 507  0235               L151:
 510  0235 9c            	rvf
 511  0236 1e09          	ldw	x,(OFST-1,sp)
 512  0238 a30006        	cpw	x,#6
 513  023b 2fa6          	jrslt	L541
 515  023d 2044          	jra	L761
 516  023f               L361:
 517                     ; 181             msg = test_values[tx_count];
 519  023f 1e01          	ldw	x,(OFST-9,sp)
 520  0241 58            	sllw	x
 521  0242 58            	sllw	x
 522  0243 d60003        	ld	a,(_test_values+3,x)
 523  0246 6b08          	ld	(OFST-2,sp),a
 524  0248 d60002        	ld	a,(_test_values+2,x)
 525  024b 6b07          	ld	(OFST-3,sp),a
 526  024d d60001        	ld	a,(_test_values+1,x)
 527  0250 6b06          	ld	(OFST-4,sp),a
 528  0252 d60000        	ld	a,(_test_values,x)
 529  0255 6b05          	ld	(OFST-5,sp),a
 530                     ; 182             if (atomQueuePut (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 532  0257 96            	ldw	x,sp
 533  0258 1c0005        	addw	x,#OFST-5
 534  025b 89            	pushw	x
 535  025c ae0000        	ldw	x,#0
 536  025f 89            	pushw	x
 537  0260 ae0000        	ldw	x,#0
 538  0263 89            	pushw	x
 539  0264 ae0020        	ldw	x,#L3_queue1
 540  0267 cd0000        	call	_atomQueuePut
 542  026a 5b06          	addw	sp,#6
 543  026c 4d            	tnz	a
 544  026d 270d          	jreq	L371
 545                     ; 184                 ATOMLOG (_STR("Failed post\n"));
 547  026f ae0013        	ldw	x,#L75
 548  0272 cd0000        	call	_printf
 550                     ; 185                 failures++;
 552  0275 1e03          	ldw	x,(OFST-7,sp)
 553  0277 1c0001        	addw	x,#1
 554  027a 1f03          	ldw	(OFST-7,sp),x
 555  027c               L371:
 556                     ; 179         for (; tx_count < 12; tx_count++)
 558  027c 1e01          	ldw	x,(OFST-9,sp)
 559  027e 1c0001        	addw	x,#1
 560  0281 1f01          	ldw	(OFST-9,sp),x
 561  0283               L761:
 564  0283 9c            	rvf
 565  0284 1e01          	ldw	x,(OFST-9,sp)
 566  0286 a3000c        	cpw	x,#12
 567  0289 2fb4          	jrslt	L361
 569  028b 2052          	jra	L102
 570  028d               L571:
 571                     ; 192             if (atomQueueGet (&queue1, 0, (uint8_t *)&msg) != ATOM_OK)
 573  028d 96            	ldw	x,sp
 574  028e 1c0005        	addw	x,#OFST-5
 575  0291 89            	pushw	x
 576  0292 ae0000        	ldw	x,#0
 577  0295 89            	pushw	x
 578  0296 ae0000        	ldw	x,#0
 579  0299 89            	pushw	x
 580  029a ae0020        	ldw	x,#L3_queue1
 581  029d cd0000        	call	_atomQueueGet
 583  02a0 5b06          	addw	sp,#6
 584  02a2 4d            	tnz	a
 585  02a3 270f          	jreq	L502
 586                     ; 194                 ATOMLOG (_STR("Failed get\n"));
 588  02a5 ae0007        	ldw	x,#L37
 589  02a8 cd0000        	call	_printf
 591                     ; 195                 failures++;
 593  02ab 1e03          	ldw	x,(OFST-7,sp)
 594  02ad 1c0001        	addw	x,#1
 595  02b0 1f03          	ldw	(OFST-7,sp),x
 597  02b2 2024          	jra	L702
 598  02b4               L502:
 599                     ; 197             else if (msg != test_values[rx_count])
 601  02b4 1e09          	ldw	x,(OFST-1,sp)
 602  02b6 58            	sllw	x
 603  02b7 58            	sllw	x
 604  02b8 1c0000        	addw	x,#_test_values
 605  02bb cd0000        	call	c_ltor
 607  02be 96            	ldw	x,sp
 608  02bf 1c0005        	addw	x,#OFST-5
 609  02c2 cd0000        	call	c_lcmp
 611  02c5 2711          	jreq	L702
 612                     ; 199                 ATOMLOG (_STR("Val%d\n"), rx_count);
 614  02c7 1e09          	ldw	x,(OFST-1,sp)
 615  02c9 89            	pushw	x
 616  02ca ae0000        	ldw	x,#L101
 617  02cd cd0000        	call	_printf
 619  02d0 85            	popw	x
 620                     ; 200                 failures++;
 622  02d1 1e03          	ldw	x,(OFST-7,sp)
 623  02d3 1c0001        	addw	x,#1
 624  02d6 1f03          	ldw	(OFST-7,sp),x
 625  02d8               L702:
 626                     ; 190         for (; rx_count < 12; rx_count++)
 628  02d8 1e09          	ldw	x,(OFST-1,sp)
 629  02da 1c0001        	addw	x,#1
 630  02dd 1f09          	ldw	(OFST-1,sp),x
 631  02df               L102:
 634  02df 9c            	rvf
 635  02e0 1e09          	ldw	x,(OFST-1,sp)
 636  02e2 a3000c        	cpw	x,#12
 637  02e5 2fa6          	jrslt	L571
 638  02e7 ac310031      	jpf	L34
 916                     	xdef	_test_values
 917                     	switch	.bss
 918  0000               L5_queue1_storage:
 919  0000 000000000000  	ds.b	32
 920  0020               L3_queue1:
 921  0020 000000000000  	ds.b	26
 922                     	xdef	_test_start
 923                     	xref	_printf
 924                     	xref	_atomQueuePut
 925                     	xref	_atomQueueGet
 926                     	xref	_atomQueueCreate
 927                     .const:	section	.text
 928  0000               L101:
 929  0000 56616c25640a  	dc.b	"Val%d",10,0
 930  0007               L37:
 931  0007 4661696c6564  	dc.b	"Failed get",10,0
 932  0013               L75:
 933  0013 4661696c6564  	dc.b	"Failed post",10,0
 934  0020               L14:
 935  0020 4572726f7220  	dc.b	"Error creating tes"
 936  0032 742071756575  	dc.b	"t queue",10,0
 956                     	xref	c_itolx
 957                     	xref	c_lcmp
 958                     	xref	c_ltor
 959                     	end
