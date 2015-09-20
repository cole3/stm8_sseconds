   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 183                     .const:	section	.text
 184  0000               L6:
 185  0000 00000010      	dc.l	16
 186  0004               L01:
 187  0004 00000011      	dc.l	17
 188  0008               L21:
 189  0008 00000012      	dc.l	18
 190  000c               L41:
 191  000c 00000013      	dc.l	19
 192  0010               L61:
 193  0010 00000014      	dc.l	20
 194                     ; 53 uint32_t test_start (void)
 194                     ; 54 {
 195                     	scross	off
 196                     .text:	section	.text,new
 197  0000               _test_start:
 199  0000 522a          	subw	sp,#42
 200       0000002a      OFST:	set	42
 203                     ; 56     uint8_t one = 1;
 205  0002 a601          	ld	a,#1
 206  0004 6b01          	ld	(OFST-41,sp),a
 207                     ; 57     uint8_t two = 2;
 209  0006 a602          	ld	a,#2
 210  0008 6b02          	ld	(OFST-40,sp),a
 211                     ; 58     uint8_t three = 3;
 213  000a a603          	ld	a,#3
 214  000c 6b03          	ld	(OFST-39,sp),a
 215                     ; 59     uint8_t four = 4;
 217  000e a604          	ld	a,#4
 218  0010 6b04          	ld	(OFST-38,sp),a
 219                     ; 60     uint8_t five = 5;
 221  0012 a605          	ld	a,#5
 222  0014 6b05          	ld	(OFST-37,sp),a
 223                     ; 61     uint8_t six = 6;
 225  0016 a606          	ld	a,#6
 226  0018 6b06          	ld	(OFST-36,sp),a
 227                     ; 62     uint8_t seven = 7;
 229  001a a607          	ld	a,#7
 230  001c 6b07          	ld	(OFST-35,sp),a
 231                     ; 63     uint8_t eight = 8;
 233  001e a608          	ld	a,#8
 234  0020 6b08          	ld	(OFST-34,sp),a
 235                     ; 64     uint8_t nine = 9;
 237  0022 a609          	ld	a,#9
 238  0024 6b09          	ld	(OFST-33,sp),a
 239                     ; 65     uint8_t ten = 10;
 241  0026 a60a          	ld	a,#10
 242  0028 6b0a          	ld	(OFST-32,sp),a
 243                     ; 66     uint16_t eleven = 11;
 245  002a ae000b        	ldw	x,#11
 246  002d 1f0b          	ldw	(OFST-31,sp),x
 247                     ; 67     uint16_t twelve = 12;
 249  002f ae000c        	ldw	x,#12
 250  0032 1f0d          	ldw	(OFST-29,sp),x
 251                     ; 68     uint16_t thirteen = 13;
 253  0034 ae000d        	ldw	x,#13
 254  0037 1f0f          	ldw	(OFST-27,sp),x
 255                     ; 69     uint16_t fourteen = 14;
 257  0039 ae000e        	ldw	x,#14
 258  003c 1f11          	ldw	(OFST-25,sp),x
 259                     ; 70     uint16_t fifteen = 15;
 261  003e ae000f        	ldw	x,#15
 262  0041 1f13          	ldw	(OFST-23,sp),x
 263                     ; 71     uint32_t sixteen = 16;
 265  0043 ae0010        	ldw	x,#16
 266  0046 1f17          	ldw	(OFST-19,sp),x
 267  0048 ae0000        	ldw	x,#0
 268  004b 1f15          	ldw	(OFST-21,sp),x
 269                     ; 72     uint32_t seventeen = 17;
 271  004d ae0011        	ldw	x,#17
 272  0050 1f1b          	ldw	(OFST-15,sp),x
 273  0052 ae0000        	ldw	x,#0
 274  0055 1f19          	ldw	(OFST-17,sp),x
 275                     ; 73     uint32_t eighteen = 18;
 277  0057 ae0012        	ldw	x,#18
 278  005a 1f1f          	ldw	(OFST-11,sp),x
 279  005c ae0000        	ldw	x,#0
 280  005f 1f1d          	ldw	(OFST-13,sp),x
 281                     ; 74     uint32_t nineteen = 19;
 283  0061 ae0013        	ldw	x,#19
 284  0064 1f23          	ldw	(OFST-7,sp),x
 285  0066 ae0000        	ldw	x,#0
 286  0069 1f21          	ldw	(OFST-9,sp),x
 287                     ; 75     uint32_t twenty = 20;
 289  006b ae0014        	ldw	x,#20
 290  006e 1f27          	ldw	(OFST-3,sp),x
 291  0070 ae0000        	ldw	x,#0
 292  0073 1f25          	ldw	(OFST-5,sp),x
 293                     ; 78     failures = 0;
 295  0075 5f            	clrw	x
 296  0076 1f29          	ldw	(OFST-1,sp),x
 297                     ; 81     atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 299  0078 ae0064        	ldw	x,#100
 300  007b 89            	pushw	x
 301  007c ae0000        	ldw	x,#0
 302  007f 89            	pushw	x
 303  0080 cd0000        	call	_atomTimerDelay
 305  0083 5b04          	addw	sp,#4
 306                     ; 84     if (one != 1)
 308  0085 7b01          	ld	a,(OFST-41,sp)
 309  0087 a101          	cp	a,#1
 310  0089 2713          	jreq	L57
 311                     ; 86         ATOMLOG (_STR("1(%d)\n"), (int)one);
 313  008b 7b01          	ld	a,(OFST-41,sp)
 314  008d 5f            	clrw	x
 315  008e 97            	ld	xl,a
 316  008f 89            	pushw	x
 317  0090 ae00a4        	ldw	x,#L77
 318  0093 cd0000        	call	_printf
 320  0096 85            	popw	x
 321                     ; 87         failures++;
 323  0097 1e29          	ldw	x,(OFST-1,sp)
 324  0099 1c0001        	addw	x,#1
 325  009c 1f29          	ldw	(OFST-1,sp),x
 326  009e               L57:
 327                     ; 89     if (two != 2)
 329  009e 7b02          	ld	a,(OFST-40,sp)
 330  00a0 a102          	cp	a,#2
 331  00a2 2713          	jreq	L101
 332                     ; 91         ATOMLOG (_STR("2(%d)\n"), (int)two);
 334  00a4 7b02          	ld	a,(OFST-40,sp)
 335  00a6 5f            	clrw	x
 336  00a7 97            	ld	xl,a
 337  00a8 89            	pushw	x
 338  00a9 ae009d        	ldw	x,#L301
 339  00ac cd0000        	call	_printf
 341  00af 85            	popw	x
 342                     ; 92         failures++;
 344  00b0 1e29          	ldw	x,(OFST-1,sp)
 345  00b2 1c0001        	addw	x,#1
 346  00b5 1f29          	ldw	(OFST-1,sp),x
 347  00b7               L101:
 348                     ; 94     if (three != 3)
 350  00b7 7b03          	ld	a,(OFST-39,sp)
 351  00b9 a103          	cp	a,#3
 352  00bb 2713          	jreq	L501
 353                     ; 96         ATOMLOG (_STR("3(%d)\n"), (int)three);
 355  00bd 7b03          	ld	a,(OFST-39,sp)
 356  00bf 5f            	clrw	x
 357  00c0 97            	ld	xl,a
 358  00c1 89            	pushw	x
 359  00c2 ae0096        	ldw	x,#L701
 360  00c5 cd0000        	call	_printf
 362  00c8 85            	popw	x
 363                     ; 97         failures++;
 365  00c9 1e29          	ldw	x,(OFST-1,sp)
 366  00cb 1c0001        	addw	x,#1
 367  00ce 1f29          	ldw	(OFST-1,sp),x
 368  00d0               L501:
 369                     ; 99     if (four != 4)
 371  00d0 7b04          	ld	a,(OFST-38,sp)
 372  00d2 a104          	cp	a,#4
 373  00d4 2713          	jreq	L111
 374                     ; 101         ATOMLOG (_STR("4(%d)\n"), (int)four);
 376  00d6 7b04          	ld	a,(OFST-38,sp)
 377  00d8 5f            	clrw	x
 378  00d9 97            	ld	xl,a
 379  00da 89            	pushw	x
 380  00db ae008f        	ldw	x,#L311
 381  00de cd0000        	call	_printf
 383  00e1 85            	popw	x
 384                     ; 102         failures++;
 386  00e2 1e29          	ldw	x,(OFST-1,sp)
 387  00e4 1c0001        	addw	x,#1
 388  00e7 1f29          	ldw	(OFST-1,sp),x
 389  00e9               L111:
 390                     ; 104     if (five != 5)
 392  00e9 7b05          	ld	a,(OFST-37,sp)
 393  00eb a105          	cp	a,#5
 394  00ed 2713          	jreq	L511
 395                     ; 106         ATOMLOG (_STR("5(%d)\n"), (int)five);
 397  00ef 7b05          	ld	a,(OFST-37,sp)
 398  00f1 5f            	clrw	x
 399  00f2 97            	ld	xl,a
 400  00f3 89            	pushw	x
 401  00f4 ae0088        	ldw	x,#L711
 402  00f7 cd0000        	call	_printf
 404  00fa 85            	popw	x
 405                     ; 107         failures++;
 407  00fb 1e29          	ldw	x,(OFST-1,sp)
 408  00fd 1c0001        	addw	x,#1
 409  0100 1f29          	ldw	(OFST-1,sp),x
 410  0102               L511:
 411                     ; 109     if (six != 6)
 413  0102 7b06          	ld	a,(OFST-36,sp)
 414  0104 a106          	cp	a,#6
 415  0106 2713          	jreq	L121
 416                     ; 111         ATOMLOG (_STR("6(%d)\n"), (int)six);
 418  0108 7b06          	ld	a,(OFST-36,sp)
 419  010a 5f            	clrw	x
 420  010b 97            	ld	xl,a
 421  010c 89            	pushw	x
 422  010d ae0081        	ldw	x,#L321
 423  0110 cd0000        	call	_printf
 425  0113 85            	popw	x
 426                     ; 112         failures++;
 428  0114 1e29          	ldw	x,(OFST-1,sp)
 429  0116 1c0001        	addw	x,#1
 430  0119 1f29          	ldw	(OFST-1,sp),x
 431  011b               L121:
 432                     ; 114     if (seven != 7)
 434  011b 7b07          	ld	a,(OFST-35,sp)
 435  011d a107          	cp	a,#7
 436  011f 2713          	jreq	L521
 437                     ; 116         ATOMLOG (_STR("7(%d)\n"), (int)seven);
 439  0121 7b07          	ld	a,(OFST-35,sp)
 440  0123 5f            	clrw	x
 441  0124 97            	ld	xl,a
 442  0125 89            	pushw	x
 443  0126 ae007a        	ldw	x,#L721
 444  0129 cd0000        	call	_printf
 446  012c 85            	popw	x
 447                     ; 117         failures++;
 449  012d 1e29          	ldw	x,(OFST-1,sp)
 450  012f 1c0001        	addw	x,#1
 451  0132 1f29          	ldw	(OFST-1,sp),x
 452  0134               L521:
 453                     ; 119     if (eight != 8)
 455  0134 7b08          	ld	a,(OFST-34,sp)
 456  0136 a108          	cp	a,#8
 457  0138 2713          	jreq	L131
 458                     ; 121         ATOMLOG (_STR("8(%d)\n"), (int)eight);
 460  013a 7b08          	ld	a,(OFST-34,sp)
 461  013c 5f            	clrw	x
 462  013d 97            	ld	xl,a
 463  013e 89            	pushw	x
 464  013f ae0073        	ldw	x,#L331
 465  0142 cd0000        	call	_printf
 467  0145 85            	popw	x
 468                     ; 122         failures++;
 470  0146 1e29          	ldw	x,(OFST-1,sp)
 471  0148 1c0001        	addw	x,#1
 472  014b 1f29          	ldw	(OFST-1,sp),x
 473  014d               L131:
 474                     ; 124     if (nine != 9)
 476  014d 7b09          	ld	a,(OFST-33,sp)
 477  014f a109          	cp	a,#9
 478  0151 2713          	jreq	L531
 479                     ; 126         ATOMLOG (_STR("9(%d)\n"), (int)nine);
 481  0153 7b09          	ld	a,(OFST-33,sp)
 482  0155 5f            	clrw	x
 483  0156 97            	ld	xl,a
 484  0157 89            	pushw	x
 485  0158 ae006c        	ldw	x,#L731
 486  015b cd0000        	call	_printf
 488  015e 85            	popw	x
 489                     ; 127         failures++;
 491  015f 1e29          	ldw	x,(OFST-1,sp)
 492  0161 1c0001        	addw	x,#1
 493  0164 1f29          	ldw	(OFST-1,sp),x
 494  0166               L531:
 495                     ; 129     if (ten != 10)
 497  0166 7b0a          	ld	a,(OFST-32,sp)
 498  0168 a10a          	cp	a,#10
 499  016a 2713          	jreq	L141
 500                     ; 131         ATOMLOG (_STR("10(%d)\n"), (int)ten);
 502  016c 7b0a          	ld	a,(OFST-32,sp)
 503  016e 5f            	clrw	x
 504  016f 97            	ld	xl,a
 505  0170 89            	pushw	x
 506  0171 ae0064        	ldw	x,#L341
 507  0174 cd0000        	call	_printf
 509  0177 85            	popw	x
 510                     ; 132         failures++;
 512  0178 1e29          	ldw	x,(OFST-1,sp)
 513  017a 1c0001        	addw	x,#1
 514  017d 1f29          	ldw	(OFST-1,sp),x
 515  017f               L141:
 516                     ; 134     if (eleven != 11)
 518  017f 1e0b          	ldw	x,(OFST-31,sp)
 519  0181 a3000b        	cpw	x,#11
 520  0184 2711          	jreq	L541
 521                     ; 136         ATOMLOG (_STR("11(%d)\n"), (int)eleven);
 523  0186 1e0b          	ldw	x,(OFST-31,sp)
 524  0188 89            	pushw	x
 525  0189 ae005c        	ldw	x,#L741
 526  018c cd0000        	call	_printf
 528  018f 85            	popw	x
 529                     ; 137         failures++;
 531  0190 1e29          	ldw	x,(OFST-1,sp)
 532  0192 1c0001        	addw	x,#1
 533  0195 1f29          	ldw	(OFST-1,sp),x
 534  0197               L541:
 535                     ; 139     if (twelve != 12)
 537  0197 1e0d          	ldw	x,(OFST-29,sp)
 538  0199 a3000c        	cpw	x,#12
 539  019c 2711          	jreq	L151
 540                     ; 141         ATOMLOG (_STR("12(%d)\n"), (int)twelve);
 542  019e 1e0d          	ldw	x,(OFST-29,sp)
 543  01a0 89            	pushw	x
 544  01a1 ae0054        	ldw	x,#L351
 545  01a4 cd0000        	call	_printf
 547  01a7 85            	popw	x
 548                     ; 142         failures++;
 550  01a8 1e29          	ldw	x,(OFST-1,sp)
 551  01aa 1c0001        	addw	x,#1
 552  01ad 1f29          	ldw	(OFST-1,sp),x
 553  01af               L151:
 554                     ; 144     if (thirteen != 13)
 556  01af 1e0f          	ldw	x,(OFST-27,sp)
 557  01b1 a3000d        	cpw	x,#13
 558  01b4 2711          	jreq	L551
 559                     ; 146         ATOMLOG (_STR("13(%d)\n"), (int)thirteen);
 561  01b6 1e0f          	ldw	x,(OFST-27,sp)
 562  01b8 89            	pushw	x
 563  01b9 ae004c        	ldw	x,#L751
 564  01bc cd0000        	call	_printf
 566  01bf 85            	popw	x
 567                     ; 147         failures++;
 569  01c0 1e29          	ldw	x,(OFST-1,sp)
 570  01c2 1c0001        	addw	x,#1
 571  01c5 1f29          	ldw	(OFST-1,sp),x
 572  01c7               L551:
 573                     ; 149     if (fourteen != 14)
 575  01c7 1e11          	ldw	x,(OFST-25,sp)
 576  01c9 a3000e        	cpw	x,#14
 577  01cc 2711          	jreq	L161
 578                     ; 151         ATOMLOG (_STR("14(%d)\n"), (int)fourteen);
 580  01ce 1e11          	ldw	x,(OFST-25,sp)
 581  01d0 89            	pushw	x
 582  01d1 ae0044        	ldw	x,#L361
 583  01d4 cd0000        	call	_printf
 585  01d7 85            	popw	x
 586                     ; 152         failures++;
 588  01d8 1e29          	ldw	x,(OFST-1,sp)
 589  01da 1c0001        	addw	x,#1
 590  01dd 1f29          	ldw	(OFST-1,sp),x
 591  01df               L161:
 592                     ; 154     if (fifteen != 15)
 594  01df 1e13          	ldw	x,(OFST-23,sp)
 595  01e1 a3000f        	cpw	x,#15
 596  01e4 2711          	jreq	L561
 597                     ; 156         ATOMLOG (_STR("15(%d)\n"), (int)fifteen);
 599  01e6 1e13          	ldw	x,(OFST-23,sp)
 600  01e8 89            	pushw	x
 601  01e9 ae003c        	ldw	x,#L761
 602  01ec cd0000        	call	_printf
 604  01ef 85            	popw	x
 605                     ; 157         failures++;
 607  01f0 1e29          	ldw	x,(OFST-1,sp)
 608  01f2 1c0001        	addw	x,#1
 609  01f5 1f29          	ldw	(OFST-1,sp),x
 610  01f7               L561:
 611                     ; 159     if (sixteen != 16)
 613  01f7 96            	ldw	x,sp
 614  01f8 1c0015        	addw	x,#OFST-21
 615  01fb cd0000        	call	c_ltor
 617  01fe ae0000        	ldw	x,#L6
 618  0201 cd0000        	call	c_lcmp
 620  0204 2711          	jreq	L171
 621                     ; 161         ATOMLOG (_STR("16(%d)\n"), (int)sixteen);
 623  0206 1e17          	ldw	x,(OFST-19,sp)
 624  0208 89            	pushw	x
 625  0209 ae0034        	ldw	x,#L371
 626  020c cd0000        	call	_printf
 628  020f 85            	popw	x
 629                     ; 162         failures++;
 631  0210 1e29          	ldw	x,(OFST-1,sp)
 632  0212 1c0001        	addw	x,#1
 633  0215 1f29          	ldw	(OFST-1,sp),x
 634  0217               L171:
 635                     ; 164     if (seventeen != 17)
 637  0217 96            	ldw	x,sp
 638  0218 1c0019        	addw	x,#OFST-17
 639  021b cd0000        	call	c_ltor
 641  021e ae0004        	ldw	x,#L01
 642  0221 cd0000        	call	c_lcmp
 644  0224 2711          	jreq	L571
 645                     ; 166         ATOMLOG (_STR("17(%d)\n"), (int)seventeen);
 647  0226 1e1b          	ldw	x,(OFST-15,sp)
 648  0228 89            	pushw	x
 649  0229 ae002c        	ldw	x,#L771
 650  022c cd0000        	call	_printf
 652  022f 85            	popw	x
 653                     ; 167         failures++;
 655  0230 1e29          	ldw	x,(OFST-1,sp)
 656  0232 1c0001        	addw	x,#1
 657  0235 1f29          	ldw	(OFST-1,sp),x
 658  0237               L571:
 659                     ; 169     if (eighteen != 18)
 661  0237 96            	ldw	x,sp
 662  0238 1c001d        	addw	x,#OFST-13
 663  023b cd0000        	call	c_ltor
 665  023e ae0008        	ldw	x,#L21
 666  0241 cd0000        	call	c_lcmp
 668  0244 2711          	jreq	L102
 669                     ; 171         ATOMLOG (_STR("18(%d)\n"), (int)eighteen);
 671  0246 1e1f          	ldw	x,(OFST-11,sp)
 672  0248 89            	pushw	x
 673  0249 ae0024        	ldw	x,#L302
 674  024c cd0000        	call	_printf
 676  024f 85            	popw	x
 677                     ; 172         failures++;
 679  0250 1e29          	ldw	x,(OFST-1,sp)
 680  0252 1c0001        	addw	x,#1
 681  0255 1f29          	ldw	(OFST-1,sp),x
 682  0257               L102:
 683                     ; 174     if (nineteen != 19)
 685  0257 96            	ldw	x,sp
 686  0258 1c0021        	addw	x,#OFST-9
 687  025b cd0000        	call	c_ltor
 689  025e ae000c        	ldw	x,#L41
 690  0261 cd0000        	call	c_lcmp
 692  0264 2711          	jreq	L502
 693                     ; 176         ATOMLOG (_STR("19(%d)\n"), (int)nineteen);
 695  0266 1e23          	ldw	x,(OFST-7,sp)
 696  0268 89            	pushw	x
 697  0269 ae001c        	ldw	x,#L702
 698  026c cd0000        	call	_printf
 700  026f 85            	popw	x
 701                     ; 177         failures++;
 703  0270 1e29          	ldw	x,(OFST-1,sp)
 704  0272 1c0001        	addw	x,#1
 705  0275 1f29          	ldw	(OFST-1,sp),x
 706  0277               L502:
 707                     ; 179     if (twenty != 20)
 709  0277 96            	ldw	x,sp
 710  0278 1c0025        	addw	x,#OFST-5
 711  027b cd0000        	call	c_ltor
 713  027e ae0010        	ldw	x,#L61
 714  0281 cd0000        	call	c_lcmp
 716  0284 2711          	jreq	L112
 717                     ; 181         ATOMLOG (_STR("20(%d)\n"), (int)twenty);
 719  0286 1e27          	ldw	x,(OFST-3,sp)
 720  0288 89            	pushw	x
 721  0289 ae0014        	ldw	x,#L312
 722  028c cd0000        	call	_printf
 724  028f 85            	popw	x
 725                     ; 182         failures++;
 727  0290 1e29          	ldw	x,(OFST-1,sp)
 728  0292 1c0001        	addw	x,#1
 729  0295 1f29          	ldw	(OFST-1,sp),x
 730  0297               L112:
 731                     ; 186     return failures;
 733  0297 1e29          	ldw	x,(OFST-1,sp)
 734  0299 cd0000        	call	c_itolx
 738  029c 5b2a          	addw	sp,#42
 739  029e 81            	ret
 752                     	xdef	_test_start
 753                     	xref	_printf
 754                     	xref	_atomTimerDelay
 755                     	switch	.const
 756  0014               L312:
 757  0014 323028256429  	dc.b	"20(%d)",10,0
 758  001c               L702:
 759  001c 313928256429  	dc.b	"19(%d)",10,0
 760  0024               L302:
 761  0024 313828256429  	dc.b	"18(%d)",10,0
 762  002c               L771:
 763  002c 313728256429  	dc.b	"17(%d)",10,0
 764  0034               L371:
 765  0034 313628256429  	dc.b	"16(%d)",10,0
 766  003c               L761:
 767  003c 313528256429  	dc.b	"15(%d)",10,0
 768  0044               L361:
 769  0044 313428256429  	dc.b	"14(%d)",10,0
 770  004c               L751:
 771  004c 313328256429  	dc.b	"13(%d)",10,0
 772  0054               L351:
 773  0054 313228256429  	dc.b	"12(%d)",10,0
 774  005c               L741:
 775  005c 313128256429  	dc.b	"11(%d)",10,0
 776  0064               L341:
 777  0064 313028256429  	dc.b	"10(%d)",10,0
 778  006c               L731:
 779  006c 39282564290a  	dc.b	"9(%d)",10,0
 780  0073               L331:
 781  0073 38282564290a  	dc.b	"8(%d)",10,0
 782  007a               L721:
 783  007a 37282564290a  	dc.b	"7(%d)",10,0
 784  0081               L321:
 785  0081 36282564290a  	dc.b	"6(%d)",10,0
 786  0088               L711:
 787  0088 35282564290a  	dc.b	"5(%d)",10,0
 788  008f               L311:
 789  008f 34282564290a  	dc.b	"4(%d)",10,0
 790  0096               L701:
 791  0096 33282564290a  	dc.b	"3(%d)",10,0
 792  009d               L301:
 793  009d 32282564290a  	dc.b	"2(%d)",10,0
 794  00a4               L77:
 795  00a4 31282564290a  	dc.b	"1(%d)",10,0
 815                     	xref	c_itolx
 816                     	xref	c_lcmp
 817                     	xref	c_ltor
 818                     	end
