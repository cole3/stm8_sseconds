   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 54 void UART2_DeInit(void)
  41                     ; 55 {
  43                     .text:	section	.text,new
  44  0000               _UART2_DeInit:
  46  0000 88            	push	a
  47       00000001      OFST:	set	1
  50                     ; 56     u8 dummy = 0;
  52  0001 0f01          	clr	(OFST+0,sp)
  53                     ; 59     dummy = UART2->SR;
  55  0003 c65240        	ld	a,21056
  56  0006 6b01          	ld	(OFST+0,sp),a
  57                     ; 60     dummy = UART2->DR;
  59  0008 c65241        	ld	a,21057
  60  000b 6b01          	ld	(OFST+0,sp),a
  61                     ; 62     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */
  63  000d 725f5243      	clr	21059
  64                     ; 63     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */
  66  0011 725f5242      	clr	21058
  67                     ; 65     UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */
  69  0015 725f5244      	clr	21060
  70                     ; 66     UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */
  72  0019 725f5245      	clr	21061
  73                     ; 67     UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */
  75  001d 725f5246      	clr	21062
  76                     ; 68     UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */
  78  0021 725f5247      	clr	21063
  79                     ; 69     UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */
  81  0025 725f5248      	clr	21064
  82                     ; 70     UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */
  84  0029 725f5249      	clr	21065
  85                     ; 72 }
  88  002d 84            	pop	a
  89  002e 81            	ret
 400                     .const:	section	.text
 401  0000               L01:
 402  0000 00000064      	dc.l	100
 403                     ; 84 void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 403                     ; 85 {
 404                     .text:	section	.text,new
 405  0000               _UART2_Init:
 407  0000 520e          	subw	sp,#14
 408       0000000e      OFST:	set	14
 411                     ; 86     u8 BRR2_1, BRR2_2 = 0;
 413  0002 7b06          	ld	a,(OFST-8,sp)
 414  0004 97            	ld	xl,a
 415                     ; 87     u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;
 417  0005 96            	ldw	x,sp
 418  0006 1c0007        	addw	x,#OFST-7
 419  0009 cd0000        	call	c_ltor
 421                     ; 90     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 423                     ; 92     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 425                     ; 94     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 427                     ; 96     assert_param(IS_UART2_PARITY_OK(Parity));
 429                     ; 99     assert_param(IS_UART2_MODE_OK((u8)Mode));
 431                     ; 103     assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));
 433                     ; 105     UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */
 435  000c 72195244      	bres	21060,#4
 436                     ; 106     UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */
 438  0010 c65244        	ld	a,21060
 439  0013 1a15          	or	a,(OFST+7,sp)
 440  0015 c75244        	ld	21060,a
 441                     ; 108     UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */
 443  0018 c65246        	ld	a,21062
 444  001b a4cf          	and	a,#207
 445  001d c75246        	ld	21062,a
 446                     ; 109     UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */
 448  0020 c65246        	ld	a,21062
 449  0023 1a16          	or	a,(OFST+8,sp)
 450  0025 c75246        	ld	21062,a
 451                     ; 111     UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */
 453  0028 c65244        	ld	a,21060
 454  002b a4f9          	and	a,#249
 455  002d c75244        	ld	21060,a
 456                     ; 112     UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */
 458  0030 c65244        	ld	a,21060
 459  0033 1a17          	or	a,(OFST+9,sp)
 460  0035 c75244        	ld	21060,a
 461                     ; 114     UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */
 463  0038 725f5242      	clr	21058
 464                     ; 115     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */
 466  003c c65243        	ld	a,21059
 467  003f a40f          	and	a,#15
 468  0041 c75243        	ld	21059,a
 469                     ; 116     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */
 471  0044 c65243        	ld	a,21059
 472  0047 a4f0          	and	a,#240
 473  0049 c75243        	ld	21059,a
 474                     ; 119     BaudRate_Mantissa    = ((u32)CLK_GetClockFreq() / (BaudRate << 4));
 476  004c 96            	ldw	x,sp
 477  004d 1c0011        	addw	x,#OFST+3
 478  0050 cd0000        	call	c_ltor
 480  0053 a604          	ld	a,#4
 481  0055 cd0000        	call	c_llsh
 483  0058 96            	ldw	x,sp
 484  0059 1c0001        	addw	x,#OFST-13
 485  005c cd0000        	call	c_rtol
 487  005f cd0000        	call	_CLK_GetClockFreq
 489  0062 96            	ldw	x,sp
 490  0063 1c0001        	addw	x,#OFST-13
 491  0066 cd0000        	call	c_ludv
 493  0069 96            	ldw	x,sp
 494  006a 1c000b        	addw	x,#OFST-3
 495  006d cd0000        	call	c_rtol
 497                     ; 120     BaudRate_Mantissa100 = (((u32)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 499  0070 96            	ldw	x,sp
 500  0071 1c0011        	addw	x,#OFST+3
 501  0074 cd0000        	call	c_ltor
 503  0077 a604          	ld	a,#4
 504  0079 cd0000        	call	c_llsh
 506  007c 96            	ldw	x,sp
 507  007d 1c0001        	addw	x,#OFST-13
 508  0080 cd0000        	call	c_rtol
 510  0083 cd0000        	call	_CLK_GetClockFreq
 512  0086 a664          	ld	a,#100
 513  0088 cd0000        	call	c_smul
 515  008b 96            	ldw	x,sp
 516  008c 1c0001        	addw	x,#OFST-13
 517  008f cd0000        	call	c_ludv
 519  0092 96            	ldw	x,sp
 520  0093 1c0007        	addw	x,#OFST-7
 521  0096 cd0000        	call	c_rtol
 523                     ; 122     BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 523                     ; 123                         << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
 525  0099 96            	ldw	x,sp
 526  009a 1c000b        	addw	x,#OFST-3
 527  009d cd0000        	call	c_ltor
 529  00a0 a664          	ld	a,#100
 530  00a2 cd0000        	call	c_smul
 532  00a5 96            	ldw	x,sp
 533  00a6 1c0001        	addw	x,#OFST-13
 534  00a9 cd0000        	call	c_rtol
 536  00ac 96            	ldw	x,sp
 537  00ad 1c0007        	addw	x,#OFST-7
 538  00b0 cd0000        	call	c_ltor
 540  00b3 96            	ldw	x,sp
 541  00b4 1c0001        	addw	x,#OFST-13
 542  00b7 cd0000        	call	c_lsub
 544  00ba a604          	ld	a,#4
 545  00bc cd0000        	call	c_llsh
 547  00bf ae0000        	ldw	x,#L01
 548  00c2 cd0000        	call	c_ludv
 550  00c5 b603          	ld	a,c_lreg+3
 551  00c7 a40f          	and	a,#15
 552  00c9 6b05          	ld	(OFST-9,sp),a
 553                     ; 124     BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);
 555  00cb 96            	ldw	x,sp
 556  00cc 1c000b        	addw	x,#OFST-3
 557  00cf cd0000        	call	c_ltor
 559  00d2 a604          	ld	a,#4
 560  00d4 cd0000        	call	c_lursh
 562  00d7 b603          	ld	a,c_lreg+3
 563  00d9 a4f0          	and	a,#240
 564  00db b703          	ld	c_lreg+3,a
 565  00dd 3f02          	clr	c_lreg+2
 566  00df 3f01          	clr	c_lreg+1
 567  00e1 3f00          	clr	c_lreg
 568  00e3 b603          	ld	a,c_lreg+3
 569  00e5 6b06          	ld	(OFST-8,sp),a
 570                     ; 126     UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);
 572  00e7 7b05          	ld	a,(OFST-9,sp)
 573  00e9 1a06          	or	a,(OFST-8,sp)
 574  00eb c75243        	ld	21059,a
 575                     ; 127     UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */
 577  00ee 7b0e          	ld	a,(OFST+0,sp)
 578  00f0 c75242        	ld	21058,a
 579                     ; 129     UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
 581  00f3 c65245        	ld	a,21061
 582  00f6 a4f3          	and	a,#243
 583  00f8 c75245        	ld	21061,a
 584                     ; 130     UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
 586  00fb c65246        	ld	a,21062
 587  00fe a4f8          	and	a,#248
 588  0100 c75246        	ld	21062,a
 589                     ; 131     UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
 591  0103 7b18          	ld	a,(OFST+10,sp)
 592  0105 a407          	and	a,#7
 593  0107 ca5246        	or	a,21062
 594  010a c75246        	ld	21062,a
 595                     ; 133     if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)
 597  010d 7b19          	ld	a,(OFST+11,sp)
 598  010f a504          	bcp	a,#4
 599  0111 2706          	jreq	L571
 600                     ; 135         UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */
 602  0113 72165245      	bset	21061,#3
 604  0117 2004          	jra	L771
 605  0119               L571:
 606                     ; 139         UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */
 608  0119 72175245      	bres	21061,#3
 609  011d               L771:
 610                     ; 141     if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)
 612  011d 7b19          	ld	a,(OFST+11,sp)
 613  011f a508          	bcp	a,#8
 614  0121 2706          	jreq	L102
 615                     ; 143         UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */
 617  0123 72145245      	bset	21061,#2
 619  0127 2004          	jra	L302
 620  0129               L102:
 621                     ; 147         UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */
 623  0129 72155245      	bres	21061,#2
 624  012d               L302:
 625                     ; 150     if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)
 627  012d 7b18          	ld	a,(OFST+10,sp)
 628  012f a580          	bcp	a,#128
 629  0131 2706          	jreq	L502
 630                     ; 152         UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */
 632  0133 72175246      	bres	21062,#3
 634  0137 200a          	jra	L702
 635  0139               L502:
 636                     ; 157         UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);
 638  0139 7b18          	ld	a,(OFST+10,sp)
 639  013b a408          	and	a,#8
 640  013d ca5246        	or	a,21062
 641  0140 c75246        	ld	21062,a
 642  0143               L702:
 643                     ; 159 }
 646  0143 5b0e          	addw	sp,#14
 647  0145 81            	ret
 670                     ; 170 u8 UART2_ReceiveData8(void)
 670                     ; 171 {
 671                     .text:	section	.text,new
 672  0000               _UART2_ReceiveData8:
 676                     ; 172     return ((u8)UART2->DR);
 678  0000 c65241        	ld	a,21057
 681  0003 81            	ret
 713                     ; 185 void UART2_SendData8(u8 Data)
 713                     ; 186 {
 714                     .text:	section	.text,new
 715  0000               _UART2_SendData8:
 719                     ; 188     UART2->DR = Data;
 721  0000 c75241        	ld	21057,a
 722                     ; 189 }
 725  0003 81            	ret
 882                     ; 201 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
 882                     ; 202 {
 883                     .text:	section	.text,new
 884  0000               _UART2_GetFlagStatus:
 886  0000 89            	pushw	x
 887  0001 88            	push	a
 888       00000001      OFST:	set	1
 891                     ; 203     FlagStatus status = RESET;
 893  0002 0f01          	clr	(OFST+0,sp)
 894                     ; 206     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
 896                     ; 209     if (UART2_FLAG == UART2_FLAG_LBDF)
 898  0004 a30210        	cpw	x,#528
 899  0007 2610          	jrne	L323
 900                     ; 211         if ((UART2->CR4 & (u8)UART2_FLAG) != (u8)0x00)
 902  0009 9f            	ld	a,xl
 903  000a c45247        	and	a,21063
 904  000d 2706          	jreq	L523
 905                     ; 214             status = SET;
 907  000f a601          	ld	a,#1
 908  0011 6b01          	ld	(OFST+0,sp),a
 910  0013 2039          	jra	L133
 911  0015               L523:
 912                     ; 219             status = RESET;
 914  0015 0f01          	clr	(OFST+0,sp)
 915  0017 2035          	jra	L133
 916  0019               L323:
 917                     ; 222     else if (UART2_FLAG == UART2_FLAG_SBK)
 919  0019 1e02          	ldw	x,(OFST+1,sp)
 920  001b a30101        	cpw	x,#257
 921  001e 2611          	jrne	L333
 922                     ; 224         if ((UART2->CR2 & (u8)UART2_FLAG) != (u8)0x00)
 924  0020 c65245        	ld	a,21061
 925  0023 1503          	bcp	a,(OFST+2,sp)
 926  0025 2706          	jreq	L533
 927                     ; 227             status = SET;
 929  0027 a601          	ld	a,#1
 930  0029 6b01          	ld	(OFST+0,sp),a
 932  002b 2021          	jra	L133
 933  002d               L533:
 934                     ; 232             status = RESET;
 936  002d 0f01          	clr	(OFST+0,sp)
 937  002f 201d          	jra	L133
 938  0031               L333:
 939                     ; 235     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
 941  0031 1e02          	ldw	x,(OFST+1,sp)
 942  0033 a30302        	cpw	x,#770
 943  0036 2707          	jreq	L543
 945  0038 1e02          	ldw	x,(OFST+1,sp)
 946  003a a30301        	cpw	x,#769
 947  003d 2614          	jrne	L343
 948  003f               L543:
 949                     ; 237         if ((UART2->CR6 & (u8)UART2_FLAG) != (u8)0x00)
 951  003f c65249        	ld	a,21065
 952  0042 1503          	bcp	a,(OFST+2,sp)
 953  0044 2706          	jreq	L743
 954                     ; 240             status = SET;
 956  0046 a601          	ld	a,#1
 957  0048 6b01          	ld	(OFST+0,sp),a
 959  004a 2002          	jra	L133
 960  004c               L743:
 961                     ; 245             status = RESET;
 963  004c 0f01          	clr	(OFST+0,sp)
 964  004e               L133:
 965                     ; 263     return  status;
 967  004e 7b01          	ld	a,(OFST+0,sp)
 970  0050 5b03          	addw	sp,#3
 971  0052 81            	ret
 972  0053               L343:
 973                     ; 250         if ((UART2->SR & (u8)UART2_FLAG) != (u8)0x00)
 975  0053 c65240        	ld	a,21056
 976  0056 1503          	bcp	a,(OFST+2,sp)
 977  0058 2706          	jreq	L553
 978                     ; 253             status = SET;
 980  005a a601          	ld	a,#1
 981  005c 6b01          	ld	(OFST+0,sp),a
 983  005e 20ee          	jra	L133
 984  0060               L553:
 985                     ; 258             status = RESET;
 987  0060 0f01          	clr	(OFST+0,sp)
 988  0062 20ea          	jra	L133
1001                     	xdef	_UART2_GetFlagStatus
1002                     	xdef	_UART2_SendData8
1003                     	xdef	_UART2_ReceiveData8
1004                     	xdef	_UART2_Init
1005                     	xdef	_UART2_DeInit
1006                     	xref	_CLK_GetClockFreq
1007                     	xref.b	c_lreg
1008                     	xref.b	c_x
1027                     	xref	c_lursh
1028                     	xref	c_lsub
1029                     	xref	c_smul
1030                     	xref	c_ludv
1031                     	xref	c_rtol
1032                     	xref	c_llsh
1033                     	xref	c_ltor
1034                     	end
