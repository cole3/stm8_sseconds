   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  81                     ; 226 ErrorStatus RTC_DeInit(void)
  81                     ; 227 {
  83                     .text:	section	.text,new
  84  0000               _RTC_DeInit:
  86  0000 5205          	subw	sp,#5
  87       00000005      OFST:	set	5
  90                     ; 228   ErrorStatus status = ERROR;
  92  0002 7b01          	ld	a,(OFST-4,sp)
  93  0004 97            	ld	xl,a
  94                     ; 229   uint16_t wutwfcount = 0;
  96  0005 5f            	clrw	x
  97  0006 1f02          	ldw	(OFST-3,sp),x
  98                     ; 230   uint16_t recalpfcount = 0;
 100  0008 5f            	clrw	x
 101  0009 1f04          	ldw	(OFST-1,sp),x
 102                     ; 233   RTC->WPR = 0xCA;
 104  000b 35ca5159      	mov	20825,#202
 105                     ; 234   RTC->WPR = 0x53;
 107  000f 35535159      	mov	20825,#83
 108                     ; 237   if (RTC_EnterInitMode() == ERROR)
 110  0013 cd0000        	call	_RTC_EnterInitMode
 112  0016 4d            	tnz	a
 113  0017 260b          	jrne	L74
 114                     ; 239     status = ERROR;
 116  0019 0f01          	clr	(OFST-4,sp)
 117                     ; 241     RTC->WPR = 0xFF; 
 119  001b 35ff5159      	mov	20825,#255
 121  001f               L15:
 122                     ; 337   return (ErrorStatus)status;
 124  001f 7b01          	ld	a,(OFST-4,sp)
 127  0021 5b05          	addw	sp,#5
 128  0023 81            	ret
 129  0024               L74:
 130                     ; 246     RTC->TR1 = RTC_TR1_RESET_VALUE;
 132  0024 725f5140      	clr	20800
 133                     ; 247     RTC->TR2 = RTC_TR2_RESET_VALUE;
 135  0028 725f5141      	clr	20801
 136                     ; 248     RTC->TR3 = RTC_TR3_RESET_VALUE;
 138  002c 725f5142      	clr	20802
 139                     ; 251     RTC->DR1 = RTC_DR1_RESET_VALUE;
 141  0030 35015144      	mov	20804,#1
 142                     ; 252     RTC->DR2 = RTC_DR2_RESET_VALUE;
 144  0034 35215145      	mov	20805,#33
 145                     ; 253     RTC->DR3 = RTC_DR3_RESET_VALUE;
 147  0038 725f5146      	clr	20806
 148                     ; 256     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 150  003c 725f5150      	clr	20816
 151                     ; 257     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 153  0040 35ff5151      	mov	20817,#255
 154                     ; 258     RTC->APRER  = RTC_APRER_RESET_VALUE;
 156  0044 357f5152      	mov	20818,#127
 157                     ; 260     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 159  0048 725f516c      	clr	20844
 160                     ; 261     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 162  004c 725f516d      	clr	20845
 163                     ; 265     RTC->CR1 = RTC_CR1_RESET_VALUE;
 165  0050 725f5148      	clr	20808
 166                     ; 266     RTC->CR2 = RTC_CR2_RESET_VALUE;
 168  0054 725f5149      	clr	20809
 169                     ; 267     RTC->CR3 = RTC_CR3_RESET_VALUE;
 171  0058 725f514a      	clr	20810
 173  005c 200b          	jra	L75
 174  005e               L35:
 175                     ; 272       wutwfcount++;
 177  005e 1e02          	ldw	x,(OFST-3,sp)
 178  0060 1c0001        	addw	x,#1
 179  0063 1f02          	ldw	(OFST-3,sp),x
 180                     ; 273       RTC->ISR1 = 0;
 182  0065 725f514c      	clr	20812
 183  0069               L75:
 184                     ; 270     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 186  0069 c6514c        	ld	a,20812
 187  006c a504          	bcp	a,#4
 188  006e 2607          	jrne	L36
 190  0070 1e02          	ldw	x,(OFST-3,sp)
 191  0072 a3ffff        	cpw	x,#65535
 192  0075 26e7          	jrne	L35
 193  0077               L36:
 194                     ; 276     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 196  0077 c6514c        	ld	a,20812
 197  007a a504          	bcp	a,#4
 198  007c 2608          	jrne	L56
 199                     ; 278       status = ERROR;
 201  007e 0f01          	clr	(OFST-4,sp)
 202                     ; 280       RTC->WPR = 0xFF; 
 204  0080 35ff5159      	mov	20825,#255
 206  0084 2099          	jra	L15
 207  0086               L56:
 208                     ; 285       RTC->CR1 = RTC_CR1_RESET_VALUE;
 210  0086 725f5148      	clr	20808
 211                     ; 288       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 213  008a 35ff5154      	mov	20820,#255
 214                     ; 289       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 216  008e 35ff5155      	mov	20821,#255
 217                     ; 292       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 219  0092 725f515c      	clr	20828
 220                     ; 293       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 222  0096 725f515d      	clr	20829
 223                     ; 294       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 225  009a 725f515e      	clr	20830
 226                     ; 295       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 228  009e 725f515f      	clr	20831
 229                     ; 297       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 231  00a2 725f5164      	clr	20836
 232                     ; 298       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 234  00a6 725f5165      	clr	20837
 235                     ; 299       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 237  00aa 725f5166      	clr	20838
 238                     ; 302       RTC->ISR1 = (uint8_t)0x00;
 240  00ae 725f514c      	clr	20812
 241                     ; 303       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 243  00b2 725f514d      	clr	20813
 244                     ; 305       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 246  00b6 c6514c        	ld	a,20812
 247  00b9 a502          	bcp	a,#2
 248  00bb 2717          	jreq	L17
 250  00bd 2007          	jra	L57
 251  00bf               L37:
 252                     ; 309           recalpfcount++;
 254  00bf 1e04          	ldw	x,(OFST-1,sp)
 255  00c1 1c0001        	addw	x,#1
 256  00c4 1f04          	ldw	(OFST-1,sp),x
 257  00c6               L57:
 258                     ; 307         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 260  00c6 c6514c        	ld	a,20812
 261  00c9 a502          	bcp	a,#2
 262  00cb 2707          	jreq	L17
 264  00cd 1e04          	ldw	x,(OFST-1,sp)
 265  00cf a3ffff        	cpw	x,#65535
 266  00d2 26eb          	jrne	L37
 267  00d4               L17:
 268                     ; 312       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 270  00d4 c6514c        	ld	a,20812
 271  00d7 a502          	bcp	a,#2
 272  00d9 2618          	jrne	L301
 273                     ; 314         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 275  00db 725f516a      	clr	20842
 276                     ; 315         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 278  00df 725f516b      	clr	20843
 279                     ; 317         if (RTC_WaitForSynchro() == ERROR)
 281  00e3 cd0000        	call	_RTC_WaitForSynchro
 283  00e6 4d            	tnz	a
 284  00e7 2604          	jrne	L501
 285                     ; 319           status = ERROR;
 287  00e9 0f01          	clr	(OFST-4,sp)
 289  00eb 2008          	jra	L111
 290  00ed               L501:
 291                     ; 323           status = SUCCESS;
 293  00ed a601          	ld	a,#1
 294  00ef 6b01          	ld	(OFST-4,sp),a
 295  00f1 2002          	jra	L111
 296  00f3               L301:
 297                     ; 328         status = ERROR;
 299  00f3 0f01          	clr	(OFST-4,sp)
 300  00f5               L111:
 301                     ; 332       RTC->WPR = 0xFF; 
 303  00f5 35ff5159      	mov	20825,#255
 304  00f9 ac1f001f      	jpf	L15
 404                     ; 353 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 404                     ; 354 {
 405                     .text:	section	.text,new
 406  0000               _RTC_Init:
 408  0000 89            	pushw	x
 409  0001 88            	push	a
 410       00000001      OFST:	set	1
 413                     ; 355   ErrorStatus status = ERROR;
 415  0002 0f01          	clr	(OFST+0,sp)
 416                     ; 358   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 418                     ; 359   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 420                     ; 360   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 422                     ; 363   RTC->WPR = 0xCA;
 424  0004 35ca5159      	mov	20825,#202
 425                     ; 364   RTC->WPR = 0x53;
 427  0008 35535159      	mov	20825,#83
 428                     ; 367   if (RTC_EnterInitMode() == ERROR)
 430  000c cd0000        	call	_RTC_EnterInitMode
 432  000f 4d            	tnz	a
 433  0010 2604          	jrne	L361
 434                     ; 369     status = ERROR;
 436  0012 0f01          	clr	(OFST+0,sp)
 438  0014 202d          	jra	L561
 439  0016               L361:
 440                     ; 374     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 442  0016 721d5148      	bres	20808,#6
 443                     ; 377     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 445  001a 1e02          	ldw	x,(OFST+1,sp)
 446  001c c65148        	ld	a,20808
 447  001f fa            	or	a,(x)
 448  0020 c75148        	ld	20808,a
 449                     ; 380     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 451  0023 1e02          	ldw	x,(OFST+1,sp)
 452  0025 ee02          	ldw	x,(2,x)
 453  0027 4f            	clr	a
 454  0028 01            	rrwa	x,a
 455  0029 9f            	ld	a,xl
 456  002a c75150        	ld	20816,a
 457                     ; 381     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 459  002d 1e02          	ldw	x,(OFST+1,sp)
 460  002f e603          	ld	a,(3,x)
 461  0031 c75151        	ld	20817,a
 462                     ; 382     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 464  0034 1e02          	ldw	x,(OFST+1,sp)
 465  0036 e601          	ld	a,(1,x)
 466  0038 c75152        	ld	20818,a
 467                     ; 385     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 469  003b 721f514c      	bres	20812,#7
 470                     ; 387     status = SUCCESS;
 472  003f a601          	ld	a,#1
 473  0041 6b01          	ld	(OFST+0,sp),a
 474  0043               L561:
 475                     ; 391   RTC->WPR = 0xFF; 
 477  0043 35ff5159      	mov	20825,#255
 478                     ; 394   return (ErrorStatus)(status);
 480  0047 7b01          	ld	a,(OFST+0,sp)
 483  0049 5b03          	addw	sp,#3
 484  004b 81            	ret
 521                     ; 404 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 521                     ; 405 {
 522                     .text:	section	.text,new
 523  0000               _RTC_StructInit:
 527                     ; 407   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 529  0000 7f            	clr	(x)
 530                     ; 410   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 532  0001 a67f          	ld	a,#127
 533  0003 e701          	ld	(1,x),a
 534                     ; 413   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 536  0005 90ae00ff      	ldw	y,#255
 537  0009 ef02          	ldw	(2,x),y
 538                     ; 414 }
 541  000b 81            	ret
 597                     ; 424 void RTC_WriteProtectionCmd(FunctionalState NewState)
 597                     ; 425 {
 598                     .text:	section	.text,new
 599  0000               _RTC_WriteProtectionCmd:
 603                     ; 427   assert_param(IS_FUNCTIONAL_STATE(NewState));
 605                     ; 429   if (NewState != DISABLE)
 607  0000 4d            	tnz	a
 608  0001 2706          	jreq	L532
 609                     ; 432     RTC->WPR = RTC_WPR_EnableKey;
 611  0003 35ff5159      	mov	20825,#255
 613  0007 2008          	jra	L732
 614  0009               L532:
 615                     ; 437     RTC->WPR = RTC_WPR_DisableKey1;
 617  0009 35ca5159      	mov	20825,#202
 618                     ; 438     RTC->WPR = RTC_WPR_DisableKey2;
 620  000d 35535159      	mov	20825,#83
 621  0011               L732:
 622                     ; 440 }
 625  0011 81            	ret
 668                     ; 452 ErrorStatus RTC_EnterInitMode(void)
 668                     ; 453 {
 669                     .text:	section	.text,new
 670  0000               _RTC_EnterInitMode:
 672  0000 5203          	subw	sp,#3
 673       00000003      OFST:	set	3
 676                     ; 454   ErrorStatus status = ERROR;
 678  0002 7b01          	ld	a,(OFST-2,sp)
 679  0004 97            	ld	xl,a
 680                     ; 455   uint16_t initfcount = 0;
 682  0005 5f            	clrw	x
 683  0006 1f02          	ldw	(OFST-1,sp),x
 684                     ; 458   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 686  0008 c6514c        	ld	a,20812
 687  000b a540          	bcp	a,#64
 688  000d 261b          	jrne	L162
 689                     ; 461     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 691  000f 3580514c      	mov	20812,#128
 693  0013 2007          	jra	L762
 694  0015               L362:
 695                     ; 466       initfcount++;
 697  0015 1e02          	ldw	x,(OFST-1,sp)
 698  0017 1c0001        	addw	x,#1
 699  001a 1f02          	ldw	(OFST-1,sp),x
 700  001c               L762:
 701                     ; 464     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 703  001c c6514c        	ld	a,20812
 704  001f a540          	bcp	a,#64
 705  0021 2607          	jrne	L162
 707  0023 1e02          	ldw	x,(OFST-1,sp)
 708  0025 a3ffff        	cpw	x,#65535
 709  0028 26eb          	jrne	L362
 710  002a               L162:
 711                     ; 470   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 713  002a c6514c        	ld	a,20812
 714  002d a540          	bcp	a,#64
 715  002f 2604          	jrne	L572
 716                     ; 472     status = ERROR;
 718  0031 0f01          	clr	(OFST-2,sp)
 720  0033 2004          	jra	L772
 721  0035               L572:
 722                     ; 476     status = SUCCESS;
 724  0035 a601          	ld	a,#1
 725  0037 6b01          	ld	(OFST-2,sp),a
 726  0039               L772:
 727                     ; 479   return (ErrorStatus)status;
 729  0039 7b01          	ld	a,(OFST-2,sp)
 732  003b 5b03          	addw	sp,#3
 733  003d 81            	ret
 756                     ; 492 void RTC_ExitInitMode(void)
 756                     ; 493 {
 757                     .text:	section	.text,new
 758  0000               _RTC_ExitInitMode:
 762                     ; 495   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 764  0000 721f514c      	bres	20812,#7
 765                     ; 496 }
 768  0004 81            	ret
 811                     ; 521 ErrorStatus RTC_WaitForSynchro(void)
 811                     ; 522 {
 812                     .text:	section	.text,new
 813  0000               _RTC_WaitForSynchro:
 815  0000 5203          	subw	sp,#3
 816       00000003      OFST:	set	3
 819                     ; 523   uint16_t rsfcount = 0;
 821  0002 5f            	clrw	x
 822  0003 1f02          	ldw	(OFST-1,sp),x
 823                     ; 524   ErrorStatus status = ERROR;
 825  0005 7b01          	ld	a,(OFST-2,sp)
 826  0007 97            	ld	xl,a
 827                     ; 527   RTC->WPR = 0xCA;
 829  0008 35ca5159      	mov	20825,#202
 830                     ; 528   RTC->WPR = 0x53;
 832  000c 35535159      	mov	20825,#83
 833                     ; 531   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 835  0010 c6514c        	ld	a,20812
 836  0013 a45f          	and	a,#95
 837  0015 c7514c        	ld	20812,a
 839  0018 2007          	jra	L333
 840  001a               L133:
 841                     ; 536     rsfcount++;
 843  001a 1e02          	ldw	x,(OFST-1,sp)
 844  001c 1c0001        	addw	x,#1
 845  001f 1f02          	ldw	(OFST-1,sp),x
 846  0021               L333:
 847                     ; 534   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 849  0021 c6514c        	ld	a,20812
 850  0024 a520          	bcp	a,#32
 851  0026 2607          	jrne	L733
 853  0028 1e02          	ldw	x,(OFST-1,sp)
 854  002a a3ffff        	cpw	x,#65535
 855  002d 26eb          	jrne	L133
 856  002f               L733:
 857                     ; 540   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 859  002f c6514c        	ld	a,20812
 860  0032 a520          	bcp	a,#32
 861  0034 2706          	jreq	L143
 862                     ; 542     status = SUCCESS;
 864  0036 a601          	ld	a,#1
 865  0038 6b01          	ld	(OFST-2,sp),a
 867  003a 2002          	jra	L343
 868  003c               L143:
 869                     ; 546     status = ERROR;
 871  003c 0f01          	clr	(OFST-2,sp)
 872  003e               L343:
 873                     ; 550   RTC->WPR = 0xFF; 
 875  003e 35ff5159      	mov	20825,#255
 876                     ; 552   return (ErrorStatus)status;
 878  0042 7b01          	ld	a,(OFST-2,sp)
 881  0044 5b03          	addw	sp,#3
 882  0046 81            	ret
 917                     ; 562 void RTC_RatioCmd(FunctionalState NewState)
 917                     ; 563 {
 918                     .text:	section	.text,new
 919  0000               _RTC_RatioCmd:
 923                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
 925                     ; 568   RTC->WPR = 0xCA;
 927  0000 35ca5159      	mov	20825,#202
 928                     ; 569   RTC->WPR = 0x53;
 930  0004 35535159      	mov	20825,#83
 931                     ; 571   if (NewState != DISABLE)
 933  0008 4d            	tnz	a
 934  0009 2706          	jreq	L363
 935                     ; 574     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 937  000b 721a5148      	bset	20808,#5
 939  000f 2004          	jra	L563
 940  0011               L363:
 941                     ; 579     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 943  0011 721b5148      	bres	20808,#5
 944  0015               L563:
 945                     ; 583   RTC->WPR = 0xFF; 
 947  0015 35ff5159      	mov	20825,#255
 948                     ; 584 }
 951  0019 81            	ret
 987                     ; 592 void RTC_BypassShadowCmd(FunctionalState NewState)
 987                     ; 593 {
 988                     .text:	section	.text,new
 989  0000               _RTC_BypassShadowCmd:
 993                     ; 595   assert_param(IS_FUNCTIONAL_STATE(NewState));
 995                     ; 598   RTC->WPR = 0xCA;
 997  0000 35ca5159      	mov	20825,#202
 998                     ; 599   RTC->WPR = 0x53;
1000  0004 35535159      	mov	20825,#83
1001                     ; 601   if (NewState != DISABLE)
1003  0008 4d            	tnz	a
1004  0009 2706          	jreq	L504
1005                     ; 604     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1007  000b 72185148      	bset	20808,#4
1009  000f 2004          	jra	L704
1010  0011               L504:
1011                     ; 609     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1013  0011 72195148      	bres	20808,#4
1014  0015               L704:
1015                     ; 613   RTC->WPR = 0xFF; 
1017  0015 35ff5159      	mov	20825,#255
1018                     ; 614 }
1021  0019 81            	ret
1167                     ; 653 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1167                     ; 654                         RTC_TimeTypeDef* RTC_TimeStruct)
1167                     ; 655 {
1168                     .text:	section	.text,new
1169  0000               _RTC_SetTime:
1171  0000 88            	push	a
1172  0001 88            	push	a
1173       00000001      OFST:	set	1
1176                     ; 656   ErrorStatus status = ERROR;
1178  0002 7b01          	ld	a,(OFST+0,sp)
1179  0004 97            	ld	xl,a
1180                     ; 657   uint8_t temp = 0;
1182  0005 7b01          	ld	a,(OFST+0,sp)
1183  0007 97            	ld	xl,a
1184                     ; 660   assert_param(IS_RTC_FORMAT(RTC_Format));
1186                     ; 662   if (RTC_Format == RTC_Format_BIN)
1188  0008 0d02          	tnz	(OFST+1,sp)
1189  000a 2609          	jrne	L105
1190                     ; 665     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1192  000c c65148        	ld	a,20808
1193  000f a540          	bcp	a,#64
1194  0011 2700          	jreq	L305
1195                     ; 667       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1197                     ; 668       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1200  0013               L305:
1201                     ; 672       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1203                     ; 674     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1205                     ; 675     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1208  0013 2007          	jra	L705
1209  0015               L105:
1210                     ; 680     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1212  0015 c65148        	ld	a,20808
1213  0018 a540          	bcp	a,#64
1214  001a 2700          	jreq	L115
1215                     ; 682       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1217                     ; 683       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1220  001c               L115:
1221                     ; 687       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1223                     ; 689     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1225                     ; 690     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1227  001c               L705:
1228                     ; 695   RTC->WPR = 0xCA;
1230  001c 35ca5159      	mov	20825,#202
1231                     ; 696   RTC->WPR = 0x53;
1233  0020 35535159      	mov	20825,#83
1234                     ; 699   if (RTC_EnterInitMode() == ERROR)
1236  0024 cd0000        	call	_RTC_EnterInitMode
1238  0027 4d            	tnz	a
1239  0028 2608          	jrne	L515
1240                     ; 701     status = ERROR;
1242  002a 0f01          	clr	(OFST+0,sp)
1243                     ; 703     RTC->WPR = 0xFF; 
1245  002c 35ff5159      	mov	20825,#255
1247  0030 2073          	jra	L715
1248  0032               L515:
1249                     ; 708     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1251  0032 c65148        	ld	a,20808
1252  0035 a540          	bcp	a,#64
1253  0037 2708          	jreq	L125
1254                     ; 710       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1256                     ; 711       temp = RTC_TimeStruct->RTC_H12;
1258  0039 1e05          	ldw	x,(OFST+4,sp)
1259  003b e603          	ld	a,(3,x)
1260  003d 6b01          	ld	(OFST+0,sp),a
1262  003f 2002          	jra	L325
1263  0041               L125:
1264                     ; 715       temp = 0;
1266  0041 0f01          	clr	(OFST+0,sp)
1267  0043               L325:
1268                     ; 718     if (RTC_Format != RTC_Format_BIN)
1270  0043 0d02          	tnz	(OFST+1,sp)
1271  0045 2718          	jreq	L525
1272                     ; 720       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1274  0047 1e05          	ldw	x,(OFST+4,sp)
1275  0049 e602          	ld	a,(2,x)
1276  004b c75140        	ld	20800,a
1277                     ; 721       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1279  004e 1e05          	ldw	x,(OFST+4,sp)
1280  0050 e601          	ld	a,(1,x)
1281  0052 c75141        	ld	20801,a
1282                     ; 722       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1284  0055 1e05          	ldw	x,(OFST+4,sp)
1285  0057 f6            	ld	a,(x)
1286  0058 1a01          	or	a,(OFST+0,sp)
1287  005a c75142        	ld	20802,a
1289  005d 201f          	jra	L725
1290  005f               L525:
1291                     ; 726       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1293  005f 1e05          	ldw	x,(OFST+4,sp)
1294  0061 e602          	ld	a,(2,x)
1295  0063 cd0000        	call	L3_ByteToBcd2
1297  0066 c75140        	ld	20800,a
1298                     ; 727       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1300  0069 1e05          	ldw	x,(OFST+4,sp)
1301  006b e601          	ld	a,(1,x)
1302  006d cd0000        	call	L3_ByteToBcd2
1304  0070 c75141        	ld	20801,a
1305                     ; 728       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1307  0073 1e05          	ldw	x,(OFST+4,sp)
1308  0075 f6            	ld	a,(x)
1309  0076 cd0000        	call	L3_ByteToBcd2
1311  0079 1a01          	or	a,(OFST+0,sp)
1312  007b c75142        	ld	20802,a
1313  007e               L725:
1314                     ; 731     (void)(RTC->DR3);
1316  007e c65146        	ld	a,20806
1317  0081 97            	ld	xl,a
1318                     ; 734     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1320  0082 721f514c      	bres	20812,#7
1321                     ; 737     RTC->WPR = 0xFF; 
1323  0086 35ff5159      	mov	20825,#255
1324                     ; 740     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1326  008a c65148        	ld	a,20808
1327  008d a510          	bcp	a,#16
1328  008f 2610          	jrne	L135
1329                     ; 742       if (RTC_WaitForSynchro() == ERROR)
1331  0091 cd0000        	call	_RTC_WaitForSynchro
1333  0094 4d            	tnz	a
1334  0095 2604          	jrne	L335
1335                     ; 744         status = ERROR;
1337  0097 0f01          	clr	(OFST+0,sp)
1339  0099 200a          	jra	L715
1340  009b               L335:
1341                     ; 748         status = SUCCESS;
1343  009b a601          	ld	a,#1
1344  009d 6b01          	ld	(OFST+0,sp),a
1345  009f 2004          	jra	L715
1346  00a1               L135:
1347                     ; 753       status = SUCCESS;
1349  00a1 a601          	ld	a,#1
1350  00a3 6b01          	ld	(OFST+0,sp),a
1351  00a5               L715:
1352                     ; 757   return (ErrorStatus)status;
1354  00a5 7b01          	ld	a,(OFST+0,sp)
1357  00a7 85            	popw	x
1358  00a8 81            	ret
1395                     ; 769 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1395                     ; 770 {
1396                     .text:	section	.text,new
1397  0000               _RTC_TimeStructInit:
1401                     ; 772   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1403  0000 6f03          	clr	(3,x)
1404                     ; 773   RTC_TimeStruct->RTC_Hours = 0;
1406  0002 7f            	clr	(x)
1407                     ; 774   RTC_TimeStruct->RTC_Minutes = 0;
1409  0003 6f01          	clr	(1,x)
1410                     ; 775   RTC_TimeStruct->RTC_Seconds = 0;
1412  0005 6f02          	clr	(2,x)
1413                     ; 776 }
1416  0007 81            	ret
1471                     ; 792 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1471                     ; 793                  RTC_TimeTypeDef* RTC_TimeStruct)
1471                     ; 794 {
1472                     .text:	section	.text,new
1473  0000               _RTC_GetTime:
1475  0000 88            	push	a
1476  0001 88            	push	a
1477       00000001      OFST:	set	1
1480                     ; 795   uint8_t  tmpreg = 0;
1482  0002 0f01          	clr	(OFST+0,sp)
1483                     ; 798   assert_param(IS_RTC_FORMAT(RTC_Format));
1485                     ; 802   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1487  0004 1e05          	ldw	x,(OFST+4,sp)
1488  0006 c65140        	ld	a,20800
1489  0009 e702          	ld	(2,x),a
1490                     ; 805   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1492  000b 1e05          	ldw	x,(OFST+4,sp)
1493  000d c65141        	ld	a,20801
1494  0010 e701          	ld	(1,x),a
1495                     ; 808   tmpreg = (uint8_t)RTC->TR3;
1497  0012 c65142        	ld	a,20802
1498  0015 6b01          	ld	(OFST+0,sp),a
1499                     ; 811   (void) (RTC->DR3) ;
1501  0017 c65146        	ld	a,20806
1502  001a 97            	ld	xl,a
1503                     ; 815   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1505  001b 7b01          	ld	a,(OFST+0,sp)
1506  001d a4bf          	and	a,#191
1507  001f 1e05          	ldw	x,(OFST+4,sp)
1508  0021 f7            	ld	(x),a
1509                     ; 818   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1511  0022 7b01          	ld	a,(OFST+0,sp)
1512  0024 a440          	and	a,#64
1513  0026 1e05          	ldw	x,(OFST+4,sp)
1514  0028 e703          	ld	(3,x),a
1515                     ; 821   if (RTC_Format == RTC_Format_BIN)
1517  002a 0d02          	tnz	(OFST+1,sp)
1518  002c 261f          	jrne	L706
1519                     ; 824     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1521  002e 1e05          	ldw	x,(OFST+4,sp)
1522  0030 f6            	ld	a,(x)
1523  0031 cd0000        	call	L5_Bcd2ToByte
1525  0034 1e05          	ldw	x,(OFST+4,sp)
1526  0036 f7            	ld	(x),a
1527                     ; 825     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1529  0037 1e05          	ldw	x,(OFST+4,sp)
1530  0039 e601          	ld	a,(1,x)
1531  003b cd0000        	call	L5_Bcd2ToByte
1533  003e 1e05          	ldw	x,(OFST+4,sp)
1534  0040 e701          	ld	(1,x),a
1535                     ; 826     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1537  0042 1e05          	ldw	x,(OFST+4,sp)
1538  0044 e602          	ld	a,(2,x)
1539  0046 cd0000        	call	L5_Bcd2ToByte
1541  0049 1e05          	ldw	x,(OFST+4,sp)
1542  004b e702          	ld	(2,x),a
1543  004d               L706:
1544                     ; 828 }
1547  004d 85            	popw	x
1548  004e 81            	ret
1594                     ; 839 uint16_t RTC_GetSubSecond(void)
1594                     ; 840 {
1595                     .text:	section	.text,new
1596  0000               _RTC_GetSubSecond:
1598  0000 5206          	subw	sp,#6
1599       00000006      OFST:	set	6
1602                     ; 841   uint8_t ssrhreg = 0, ssrlreg = 0;
1604  0002 7b03          	ld	a,(OFST-3,sp)
1605  0004 97            	ld	xl,a
1608  0005 7b04          	ld	a,(OFST-2,sp)
1609  0007 97            	ld	xl,a
1610                     ; 842   uint16_t ssrreg = 0;
1612  0008 1e05          	ldw	x,(OFST-1,sp)
1613                     ; 845   ssrhreg = RTC->SSRH;
1615  000a c65157        	ld	a,20823
1616  000d 6b03          	ld	(OFST-3,sp),a
1617                     ; 846   ssrlreg = RTC->SSRL;
1619  000f c65158        	ld	a,20824
1620  0012 6b04          	ld	(OFST-2,sp),a
1621                     ; 849   (void) (RTC->DR3);
1623  0014 c65146        	ld	a,20806
1624  0017 97            	ld	xl,a
1625                     ; 852   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1627  0018 7b04          	ld	a,(OFST-2,sp)
1628  001a 5f            	clrw	x
1629  001b 97            	ld	xl,a
1630  001c 1f01          	ldw	(OFST-5,sp),x
1631  001e 7b03          	ld	a,(OFST-3,sp)
1632  0020 5f            	clrw	x
1633  0021 97            	ld	xl,a
1634  0022 4f            	clr	a
1635  0023 02            	rlwa	x,a
1636  0024 01            	rrwa	x,a
1637  0025 1a02          	or	a,(OFST-4,sp)
1638  0027 01            	rrwa	x,a
1639  0028 1a01          	or	a,(OFST-5,sp)
1640  002a 01            	rrwa	x,a
1641  002b 1f05          	ldw	(OFST-1,sp),x
1642                     ; 853   return (uint16_t)(ssrreg);
1644  002d 1e05          	ldw	x,(OFST-1,sp)
1647  002f 5b06          	addw	sp,#6
1648  0031 81            	ret
1900                     ; 870 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1900                     ; 871                         RTC_DateTypeDef* RTC_DateStruct)
1900                     ; 872 {
1901                     .text:	section	.text,new
1902  0000               _RTC_SetDate:
1904  0000 88            	push	a
1905  0001 89            	pushw	x
1906       00000002      OFST:	set	2
1909                     ; 873   ErrorStatus status = ERROR;
1911  0002 0f02          	clr	(OFST+0,sp)
1912                     ; 875   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1914  0004 4d            	tnz	a
1915  0005 2616          	jrne	L757
1917  0007 1e06          	ldw	x,(OFST+4,sp)
1918  0009 e601          	ld	a,(1,x)
1919  000b a410          	and	a,#16
1920  000d a110          	cp	a,#16
1921  000f 260c          	jrne	L757
1922                     ; 877     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1924  0011 1e06          	ldw	x,(OFST+4,sp)
1925  0013 e601          	ld	a,(1,x)
1926  0015 a4ef          	and	a,#239
1927  0017 ab0a          	add	a,#10
1928  0019 1e06          	ldw	x,(OFST+4,sp)
1929  001b e701          	ld	(1,x),a
1930  001d               L757:
1931                     ; 881   assert_param(IS_RTC_FORMAT(RTC_Format));
1933                     ; 882   if (RTC_Format == RTC_Format_BIN)
1935  001d 0d03          	tnz	(OFST+1,sp)
1936  001f 2600          	jrne	L167
1937                     ; 884     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1939                     ; 885     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1941                     ; 886     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1943                     ; 887     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1945                     ; 888     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1948  0021               L167:
1949                     ; 892     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1951                     ; 893     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1953                     ; 894     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1955                     ; 895     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1957                     ; 896     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1959                     ; 898   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1961                     ; 901   RTC->WPR = 0xCA;
1963  0021 35ca5159      	mov	20825,#202
1964                     ; 902   RTC->WPR = 0x53;
1966  0025 35535159      	mov	20825,#83
1967                     ; 905   if (RTC_EnterInitMode() == ERROR)
1969  0029 cd0000        	call	_RTC_EnterInitMode
1971  002c 4d            	tnz	a
1972  002d 2608          	jrne	L567
1973                     ; 907     status = ERROR;
1975  002f 0f02          	clr	(OFST+0,sp)
1976                     ; 909     RTC->WPR = 0xFF; 
1978  0031 35ff5159      	mov	20825,#255
1980  0035 2074          	jra	L767
1981  0037               L567:
1982                     ; 913     (void)(RTC->TR1);
1984  0037 c65140        	ld	a,20800
1985  003a 97            	ld	xl,a
1986                     ; 916     if (RTC_Format != RTC_Format_BIN)
1988  003b 0d03          	tnz	(OFST+1,sp)
1989  003d 271f          	jreq	L177
1990                     ; 918       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1992  003f 1e06          	ldw	x,(OFST+4,sp)
1993  0041 e602          	ld	a,(2,x)
1994  0043 c75144        	ld	20804,a
1995                     ; 919       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1997  0046 1e06          	ldw	x,(OFST+4,sp)
1998  0048 f6            	ld	a,(x)
1999  0049 97            	ld	xl,a
2000  004a a620          	ld	a,#32
2001  004c 42            	mul	x,a
2002  004d 9f            	ld	a,xl
2003  004e 1e06          	ldw	x,(OFST+4,sp)
2004  0050 ea01          	or	a,(1,x)
2005  0052 c75145        	ld	20805,a
2006                     ; 920       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2008  0055 1e06          	ldw	x,(OFST+4,sp)
2009  0057 e603          	ld	a,(3,x)
2010  0059 c75146        	ld	20806,a
2012  005c 202a          	jra	L377
2013  005e               L177:
2014                     ; 924       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2016  005e 1e06          	ldw	x,(OFST+4,sp)
2017  0060 e602          	ld	a,(2,x)
2018  0062 cd0000        	call	L3_ByteToBcd2
2020  0065 c75144        	ld	20804,a
2021                     ; 925       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2023  0068 1e06          	ldw	x,(OFST+4,sp)
2024  006a f6            	ld	a,(x)
2025  006b 97            	ld	xl,a
2026  006c a620          	ld	a,#32
2027  006e 42            	mul	x,a
2028  006f 9f            	ld	a,xl
2029  0070 6b01          	ld	(OFST-1,sp),a
2030  0072 1e06          	ldw	x,(OFST+4,sp)
2031  0074 e601          	ld	a,(1,x)
2032  0076 cd0000        	call	L3_ByteToBcd2
2034  0079 1a01          	or	a,(OFST-1,sp)
2035  007b c75145        	ld	20805,a
2036                     ; 926       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2038  007e 1e06          	ldw	x,(OFST+4,sp)
2039  0080 e603          	ld	a,(3,x)
2040  0082 cd0000        	call	L3_ByteToBcd2
2042  0085 c75146        	ld	20806,a
2043  0088               L377:
2044                     ; 930     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2046  0088 721f514c      	bres	20812,#7
2047                     ; 933     RTC->WPR = 0xFF; 
2049  008c 35ff5159      	mov	20825,#255
2050                     ; 936     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2052  0090 c65148        	ld	a,20808
2053  0093 a510          	bcp	a,#16
2054  0095 2610          	jrne	L577
2055                     ; 938       if (RTC_WaitForSynchro() == ERROR)
2057  0097 cd0000        	call	_RTC_WaitForSynchro
2059  009a 4d            	tnz	a
2060  009b 2604          	jrne	L777
2061                     ; 940         status = ERROR;
2063  009d 0f02          	clr	(OFST+0,sp)
2065  009f 200a          	jra	L767
2066  00a1               L777:
2067                     ; 944         status = SUCCESS;
2069  00a1 a601          	ld	a,#1
2070  00a3 6b02          	ld	(OFST+0,sp),a
2071  00a5 2004          	jra	L767
2072  00a7               L577:
2073                     ; 949       status = SUCCESS;
2075  00a7 a601          	ld	a,#1
2076  00a9 6b02          	ld	(OFST+0,sp),a
2077  00ab               L767:
2078                     ; 953   return (ErrorStatus)status;
2080  00ab 7b02          	ld	a,(OFST+0,sp)
2083  00ad 5b03          	addw	sp,#3
2084  00af 81            	ret
2121                     ; 962 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2121                     ; 963 {
2122                     .text:	section	.text,new
2123  0000               _RTC_DateStructInit:
2127                     ; 965   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2129  0000 a601          	ld	a,#1
2130  0002 f7            	ld	(x),a
2131                     ; 966   RTC_DateStruct->RTC_Date = 1;
2133  0003 a601          	ld	a,#1
2134  0005 e702          	ld	(2,x),a
2135                     ; 967   RTC_DateStruct->RTC_Month = RTC_Month_January;
2137  0007 a601          	ld	a,#1
2138  0009 e701          	ld	(1,x),a
2139                     ; 968   RTC_DateStruct->RTC_Year = 0;
2141  000b 6f03          	clr	(3,x)
2142                     ; 969 }
2145  000d 81            	ret
2200                     ; 982 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2200                     ; 983                  RTC_DateTypeDef* RTC_DateStruct)
2200                     ; 984 {
2201                     .text:	section	.text,new
2202  0000               _RTC_GetDate:
2204  0000 88            	push	a
2205  0001 88            	push	a
2206       00000001      OFST:	set	1
2209                     ; 985   uint8_t tmpreg = 0;
2211  0002 0f01          	clr	(OFST+0,sp)
2212                     ; 988   assert_param(IS_RTC_FORMAT(RTC_Format));
2214                     ; 991   (void) (RTC->TR1) ;
2216  0004 c65140        	ld	a,20800
2217  0007 97            	ld	xl,a
2218                     ; 992   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2220  0008 1e05          	ldw	x,(OFST+4,sp)
2221  000a c65144        	ld	a,20804
2222  000d e702          	ld	(2,x),a
2223                     ; 993   tmpreg = (uint8_t)RTC->DR2;
2225  000f c65145        	ld	a,20805
2226  0012 6b01          	ld	(OFST+0,sp),a
2227                     ; 994   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2229  0014 1e05          	ldw	x,(OFST+4,sp)
2230  0016 c65146        	ld	a,20806
2231  0019 e703          	ld	(3,x),a
2232                     ; 997   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2234  001b 7b01          	ld	a,(OFST+0,sp)
2235  001d a41f          	and	a,#31
2236  001f 1e05          	ldw	x,(OFST+4,sp)
2237  0021 e701          	ld	(1,x),a
2238                     ; 998   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2240  0023 7b01          	ld	a,(OFST+0,sp)
2241  0025 a4e0          	and	a,#224
2242  0027 4e            	swap	a
2243  0028 44            	srl	a
2244  0029 a407          	and	a,#7
2245  002b 1e05          	ldw	x,(OFST+4,sp)
2246  002d f7            	ld	(x),a
2247                     ; 1001   if (RTC_Format == RTC_Format_BIN)
2249  002e 0d02          	tnz	(OFST+1,sp)
2250  0030 2621          	jrne	L3501
2251                     ; 1004     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2253  0032 1e05          	ldw	x,(OFST+4,sp)
2254  0034 e603          	ld	a,(3,x)
2255  0036 cd0000        	call	L5_Bcd2ToByte
2257  0039 1e05          	ldw	x,(OFST+4,sp)
2258  003b e703          	ld	(3,x),a
2259                     ; 1005     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2261  003d 1e05          	ldw	x,(OFST+4,sp)
2262  003f e601          	ld	a,(1,x)
2263  0041 cd0000        	call	L5_Bcd2ToByte
2265  0044 1e05          	ldw	x,(OFST+4,sp)
2266  0046 e701          	ld	(1,x),a
2267                     ; 1006     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2269  0048 1e05          	ldw	x,(OFST+4,sp)
2270  004a e602          	ld	a,(2,x)
2271  004c cd0000        	call	L5_Bcd2ToByte
2273  004f 1e05          	ldw	x,(OFST+4,sp)
2274  0051 e702          	ld	(2,x),a
2275  0053               L3501:
2276                     ; 1008 }
2279  0053 85            	popw	x
2280  0054 81            	ret
2421                     ; 1038 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2421                     ; 1039                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2421                     ; 1040 {
2422                     .text:	section	.text,new
2423  0000               _RTC_SetAlarm:
2425  0000 88            	push	a
2426  0001 5205          	subw	sp,#5
2427       00000005      OFST:	set	5
2430                     ; 1041   uint8_t tmpreg1 = 0;
2432  0003 7b02          	ld	a,(OFST-3,sp)
2433  0005 97            	ld	xl,a
2434                     ; 1042   uint8_t tmpreg2 = 0;
2436  0006 7b03          	ld	a,(OFST-2,sp)
2437  0008 97            	ld	xl,a
2438                     ; 1043   uint8_t tmpreg3 = 0;
2440  0009 7b04          	ld	a,(OFST-1,sp)
2441  000b 97            	ld	xl,a
2442                     ; 1044   uint8_t tmpreg4 = 0;
2444  000c 7b05          	ld	a,(OFST+0,sp)
2445  000e 97            	ld	xl,a
2446                     ; 1047   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2448                     ; 1048   assert_param(IS_RTC_FORMAT(RTC_Format));
2450                     ; 1049   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2452                     ; 1050   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2454                     ; 1053   if (RTC_Format == RTC_Format_BIN)
2456  000f 0d06          	tnz	(OFST+1,sp)
2457  0011 2609          	jrne	L1411
2458                     ; 1056     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2460  0013 c65148        	ld	a,20808
2461  0016 a540          	bcp	a,#64
2462  0018 2700          	jreq	L3411
2463                     ; 1058       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2465                     ; 1059       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2468  001a               L3411:
2469                     ; 1063       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2471                     ; 1065     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2473                     ; 1066     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2476  001a 2007          	jra	L7411
2477  001c               L1411:
2478                     ; 1071     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2480  001c c65148        	ld	a,20808
2481  001f a540          	bcp	a,#64
2482  0021 2700          	jreq	L1511
2483                     ; 1073       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2485                     ; 1074       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2488  0023               L1511:
2489                     ; 1078       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2491                     ; 1081     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2493                     ; 1083     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2495  0023               L7411:
2496                     ; 1088   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2498  0023 1e09          	ldw	x,(OFST+4,sp)
2499  0025 e604          	ld	a,(4,x)
2500  0027 a510          	bcp	a,#16
2501  0029 2608          	jrne	L5511
2502                     ; 1090     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2504  002b 1e09          	ldw	x,(OFST+4,sp)
2505  002d e605          	ld	a,(5,x)
2506  002f a140          	cp	a,#64
2507  0031 2600          	jrne	L7511
2508                     ; 1092       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2511  0033               L7511:
2512                     ; 1096       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2514                     ; 1097       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2516  0033               L5511:
2517                     ; 1102   RTC->WPR = 0xCA;
2519  0033 35ca5159      	mov	20825,#202
2520                     ; 1103   RTC->WPR = 0x53;
2522  0037 35535159      	mov	20825,#83
2523                     ; 1107   if (RTC_Format != RTC_Format_BIN)
2525  003b 0d06          	tnz	(OFST+1,sp)
2526  003d 2747          	jreq	L3611
2527                     ; 1109     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2527                     ; 1110                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2529  003f 1e09          	ldw	x,(OFST+4,sp)
2530  0041 e604          	ld	a,(4,x)
2531  0043 a480          	and	a,#128
2532  0045 1e09          	ldw	x,(OFST+4,sp)
2533  0047 ea02          	or	a,(2,x)
2534  0049 6b02          	ld	(OFST-3,sp),a
2535                     ; 1112     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2535                     ; 1113                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2537  004b 1e09          	ldw	x,(OFST+4,sp)
2538  004d e604          	ld	a,(4,x)
2539  004f 48            	sll	a
2540  0050 a480          	and	a,#128
2541  0052 1e09          	ldw	x,(OFST+4,sp)
2542  0054 ea01          	or	a,(1,x)
2543  0056 6b03          	ld	(OFST-2,sp),a
2544                     ; 1115     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2544                     ; 1116                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2544                     ; 1117                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2546  0058 1e09          	ldw	x,(OFST+4,sp)
2547  005a e604          	ld	a,(4,x)
2548  005c 48            	sll	a
2549  005d 48            	sll	a
2550  005e a480          	and	a,#128
2551  0060 6b01          	ld	(OFST-4,sp),a
2552  0062 1e09          	ldw	x,(OFST+4,sp)
2553  0064 e603          	ld	a,(3,x)
2554  0066 1e09          	ldw	x,(OFST+4,sp)
2555  0068 fa            	or	a,(x)
2556  0069 1a01          	or	a,(OFST-4,sp)
2557  006b 6b04          	ld	(OFST-1,sp),a
2558                     ; 1119     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2558                     ; 1120                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2558                     ; 1121                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2560  006d 1e09          	ldw	x,(OFST+4,sp)
2561  006f e604          	ld	a,(4,x)
2562  0071 48            	sll	a
2563  0072 48            	sll	a
2564  0073 48            	sll	a
2565  0074 a480          	and	a,#128
2566  0076 6b01          	ld	(OFST-4,sp),a
2567  0078 1e09          	ldw	x,(OFST+4,sp)
2568  007a e605          	ld	a,(5,x)
2569  007c 1e09          	ldw	x,(OFST+4,sp)
2570  007e ea06          	or	a,(6,x)
2571  0080 1a01          	or	a,(OFST-4,sp)
2572  0082 6b05          	ld	(OFST+0,sp),a
2574  0084 2059          	jra	L5611
2575  0086               L3611:
2576                     ; 1126     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2576                     ; 1127                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2578  0086 1e09          	ldw	x,(OFST+4,sp)
2579  0088 e604          	ld	a,(4,x)
2580  008a a480          	and	a,#128
2581  008c 6b01          	ld	(OFST-4,sp),a
2582  008e 1e09          	ldw	x,(OFST+4,sp)
2583  0090 e602          	ld	a,(2,x)
2584  0092 cd0000        	call	L3_ByteToBcd2
2586  0095 1a01          	or	a,(OFST-4,sp)
2587  0097 6b02          	ld	(OFST-3,sp),a
2588                     ; 1129     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2588                     ; 1130                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2590  0099 1e09          	ldw	x,(OFST+4,sp)
2591  009b e604          	ld	a,(4,x)
2592  009d 48            	sll	a
2593  009e a480          	and	a,#128
2594  00a0 6b01          	ld	(OFST-4,sp),a
2595  00a2 1e09          	ldw	x,(OFST+4,sp)
2596  00a4 e601          	ld	a,(1,x)
2597  00a6 cd0000        	call	L3_ByteToBcd2
2599  00a9 1a01          	or	a,(OFST-4,sp)
2600  00ab 6b03          	ld	(OFST-2,sp),a
2601                     ; 1132     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2601                     ; 1133                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2601                     ; 1134                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2603  00ad 1e09          	ldw	x,(OFST+4,sp)
2604  00af e604          	ld	a,(4,x)
2605  00b1 48            	sll	a
2606  00b2 48            	sll	a
2607  00b3 a480          	and	a,#128
2608  00b5 6b01          	ld	(OFST-4,sp),a
2609  00b7 1e09          	ldw	x,(OFST+4,sp)
2610  00b9 f6            	ld	a,(x)
2611  00ba cd0000        	call	L3_ByteToBcd2
2613  00bd 1e09          	ldw	x,(OFST+4,sp)
2614  00bf ea03          	or	a,(3,x)
2615  00c1 1a01          	or	a,(OFST-4,sp)
2616  00c3 6b04          	ld	(OFST-1,sp),a
2617                     ; 1136     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2617                     ; 1137                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2617                     ; 1138                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2619  00c5 1e09          	ldw	x,(OFST+4,sp)
2620  00c7 e604          	ld	a,(4,x)
2621  00c9 48            	sll	a
2622  00ca 48            	sll	a
2623  00cb 48            	sll	a
2624  00cc a480          	and	a,#128
2625  00ce 6b01          	ld	(OFST-4,sp),a
2626  00d0 1e09          	ldw	x,(OFST+4,sp)
2627  00d2 e606          	ld	a,(6,x)
2628  00d4 cd0000        	call	L3_ByteToBcd2
2630  00d7 1e09          	ldw	x,(OFST+4,sp)
2631  00d9 ea05          	or	a,(5,x)
2632  00db 1a01          	or	a,(OFST-4,sp)
2633  00dd 6b05          	ld	(OFST+0,sp),a
2634  00df               L5611:
2635                     ; 1142   RTC->ALRMAR1 = tmpreg1;
2637  00df 7b02          	ld	a,(OFST-3,sp)
2638  00e1 c7515c        	ld	20828,a
2639                     ; 1143   RTC->ALRMAR2 = tmpreg2;
2641  00e4 7b03          	ld	a,(OFST-2,sp)
2642  00e6 c7515d        	ld	20829,a
2643                     ; 1144   RTC->ALRMAR3 = tmpreg3;
2645  00e9 7b04          	ld	a,(OFST-1,sp)
2646  00eb c7515e        	ld	20830,a
2647                     ; 1145   RTC->ALRMAR4 = tmpreg4;
2649  00ee 7b05          	ld	a,(OFST+0,sp)
2650  00f0 c7515f        	ld	20831,a
2651                     ; 1148   RTC->WPR = 0xFF; 
2653  00f3 35ff5159      	mov	20825,#255
2654                     ; 1149 }
2657  00f7 5b06          	addw	sp,#6
2658  00f9 81            	ret
2696                     ; 1159 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2696                     ; 1160 {
2697                     .text:	section	.text,new
2698  0000               _RTC_AlarmStructInit:
2702                     ; 1162   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2704  0000 6f03          	clr	(3,x)
2705                     ; 1163   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2707  0002 7f            	clr	(x)
2708                     ; 1164   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2710  0003 6f01          	clr	(1,x)
2711                     ; 1165   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2713  0005 6f02          	clr	(2,x)
2714                     ; 1168   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2716  0007 6f05          	clr	(5,x)
2717                     ; 1169   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2719  0009 a601          	ld	a,#1
2720  000b e706          	ld	(6,x),a
2721                     ; 1172   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2723  000d a6f0          	ld	a,#240
2724  000f e704          	ld	(4,x),a
2725                     ; 1173 }
2728  0011 81            	ret
2811                     ; 1182 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2811                     ; 1183                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2811                     ; 1184 {
2812                     .text:	section	.text,new
2813  0000               _RTC_GetAlarm:
2815  0000 88            	push	a
2816  0001 5204          	subw	sp,#4
2817       00000004      OFST:	set	4
2820                     ; 1185   uint8_t tmpreg1 = 0;
2822  0003 7b04          	ld	a,(OFST+0,sp)
2823  0005 97            	ld	xl,a
2824                     ; 1186   uint8_t tmpreg2 = 0;
2826  0006 7b01          	ld	a,(OFST-3,sp)
2827  0008 97            	ld	xl,a
2828                     ; 1187   uint8_t tmpreg3 = 0;
2830  0009 7b02          	ld	a,(OFST-2,sp)
2831  000b 97            	ld	xl,a
2832                     ; 1188   uint8_t tmpreg4 = 0;
2834  000c 7b03          	ld	a,(OFST-1,sp)
2835  000e 97            	ld	xl,a
2836                     ; 1189   uint8_t alarmmask = 0;
2838  000f 7b04          	ld	a,(OFST+0,sp)
2839  0011 97            	ld	xl,a
2840                     ; 1192   assert_param(IS_RTC_FORMAT(RTC_Format));
2842                     ; 1195   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2844  0012 c6515c        	ld	a,20828
2845  0015 6b04          	ld	(OFST+0,sp),a
2846                     ; 1196   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2848  0017 c6515d        	ld	a,20829
2849  001a 6b01          	ld	(OFST-3,sp),a
2850                     ; 1197   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2852  001c c6515e        	ld	a,20830
2853  001f 6b02          	ld	(OFST-2,sp),a
2854                     ; 1198   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2856  0021 c6515f        	ld	a,20831
2857  0024 6b03          	ld	(OFST-1,sp),a
2858                     ; 1201   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2860  0026 7b04          	ld	a,(OFST+0,sp)
2861  0028 a47f          	and	a,#127
2862  002a 1e08          	ldw	x,(OFST+4,sp)
2863  002c e702          	ld	(2,x),a
2864                     ; 1202   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2866  002e 7b04          	ld	a,(OFST+0,sp)
2867  0030 a480          	and	a,#128
2868  0032 6b04          	ld	(OFST+0,sp),a
2869                     ; 1205   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2871  0034 7b01          	ld	a,(OFST-3,sp)
2872  0036 a47f          	and	a,#127
2873  0038 1e08          	ldw	x,(OFST+4,sp)
2874  003a e701          	ld	(1,x),a
2875                     ; 1206   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2877  003c 7b01          	ld	a,(OFST-3,sp)
2878  003e a480          	and	a,#128
2879  0040 44            	srl	a
2880  0041 1a04          	or	a,(OFST+0,sp)
2881  0043 6b04          	ld	(OFST+0,sp),a
2882                     ; 1209   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2884  0045 7b02          	ld	a,(OFST-2,sp)
2885  0047 a43f          	and	a,#63
2886  0049 1e08          	ldw	x,(OFST+4,sp)
2887  004b f7            	ld	(x),a
2888                     ; 1210   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2890  004c 7b02          	ld	a,(OFST-2,sp)
2891  004e a440          	and	a,#64
2892  0050 1e08          	ldw	x,(OFST+4,sp)
2893  0052 e703          	ld	(3,x),a
2894                     ; 1211   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2896  0054 7b02          	ld	a,(OFST-2,sp)
2897  0056 a480          	and	a,#128
2898  0058 44            	srl	a
2899  0059 44            	srl	a
2900  005a 1a04          	or	a,(OFST+0,sp)
2901  005c 6b04          	ld	(OFST+0,sp),a
2902                     ; 1214   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2904  005e 7b03          	ld	a,(OFST-1,sp)
2905  0060 a43f          	and	a,#63
2906  0062 1e08          	ldw	x,(OFST+4,sp)
2907  0064 e706          	ld	(6,x),a
2908                     ; 1215   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2910  0066 7b03          	ld	a,(OFST-1,sp)
2911  0068 a440          	and	a,#64
2912  006a 1e08          	ldw	x,(OFST+4,sp)
2913  006c e705          	ld	(5,x),a
2914                     ; 1216   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2916  006e 7b03          	ld	a,(OFST-1,sp)
2917  0070 a480          	and	a,#128
2918  0072 44            	srl	a
2919  0073 44            	srl	a
2920  0074 44            	srl	a
2921  0075 1a04          	or	a,(OFST+0,sp)
2922  0077 6b04          	ld	(OFST+0,sp),a
2923                     ; 1218   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2925  0079 7b04          	ld	a,(OFST+0,sp)
2926  007b 1e08          	ldw	x,(OFST+4,sp)
2927  007d e704          	ld	(4,x),a
2928                     ; 1220   if (RTC_Format == RTC_Format_BIN)
2930  007f 0d05          	tnz	(OFST+1,sp)
2931  0081 262a          	jrne	L5421
2932                     ; 1222     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2934  0083 1e08          	ldw	x,(OFST+4,sp)
2935  0085 f6            	ld	a,(x)
2936  0086 cd0000        	call	L5_Bcd2ToByte
2938  0089 1e08          	ldw	x,(OFST+4,sp)
2939  008b f7            	ld	(x),a
2940                     ; 1223     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2942  008c 1e08          	ldw	x,(OFST+4,sp)
2943  008e e601          	ld	a,(1,x)
2944  0090 cd0000        	call	L5_Bcd2ToByte
2946  0093 1e08          	ldw	x,(OFST+4,sp)
2947  0095 e701          	ld	(1,x),a
2948                     ; 1224     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2950  0097 1e08          	ldw	x,(OFST+4,sp)
2951  0099 e602          	ld	a,(2,x)
2952  009b cd0000        	call	L5_Bcd2ToByte
2954  009e 1e08          	ldw	x,(OFST+4,sp)
2955  00a0 e702          	ld	(2,x),a
2956                     ; 1225     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2958  00a2 1e08          	ldw	x,(OFST+4,sp)
2959  00a4 e606          	ld	a,(6,x)
2960  00a6 cd0000        	call	L5_Bcd2ToByte
2962  00a9 1e08          	ldw	x,(OFST+4,sp)
2963  00ab e706          	ld	(6,x),a
2964  00ad               L5421:
2965                     ; 1227 }
2968  00ad 5b05          	addw	sp,#5
2969  00af 81            	ret
3031                     ; 1236 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3031                     ; 1237 {
3032                     .text:	section	.text,new
3033  0000               _RTC_AlarmCmd:
3035  0000 88            	push	a
3036  0001 5203          	subw	sp,#3
3037       00000003      OFST:	set	3
3040                     ; 1238   __IO uint16_t alrawfcount = 0;
3042  0003 5f            	clrw	x
3043  0004 1f01          	ldw	(OFST-2,sp),x
3044                     ; 1239   ErrorStatus status = ERROR;
3046  0006 7b03          	ld	a,(OFST+0,sp)
3047  0008 97            	ld	xl,a
3048                     ; 1240   uint8_t temp1 = 0;
3050  0009 7b03          	ld	a,(OFST+0,sp)
3051  000b 97            	ld	xl,a
3052                     ; 1243   assert_param(IS_FUNCTIONAL_STATE(NewState));
3054                     ; 1246   RTC->WPR = 0xCA;
3056  000c 35ca5159      	mov	20825,#202
3057                     ; 1247   RTC->WPR = 0x53;
3059  0010 35535159      	mov	20825,#83
3060                     ; 1250   if (NewState != DISABLE)
3062  0014 0d04          	tnz	(OFST+1,sp)
3063  0016 2711          	jreq	L7721
3064                     ; 1252     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3066  0018 72105149      	bset	20809,#0
3067                     ; 1253     status = SUCCESS;
3069  001c a601          	ld	a,#1
3070  001e 6b03          	ld	(OFST+0,sp),a
3072  0020               L1031:
3073                     ; 1277   RTC->WPR = 0xFF; 
3075  0020 35ff5159      	mov	20825,#255
3076                     ; 1280   return (ErrorStatus)status;
3078  0024 7b03          	ld	a,(OFST+0,sp)
3081  0026 5b04          	addw	sp,#4
3082  0028 81            	ret
3083  0029               L7721:
3084                     ; 1257     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3086  0029 72115149      	bres	20809,#0
3087                     ; 1260     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3089  002d c6514c        	ld	a,20812
3090  0030 a401          	and	a,#1
3091  0032 6b03          	ld	(OFST+0,sp),a
3093  0034 2007          	jra	L7031
3094  0036               L3031:
3095                     ; 1263       alrawfcount++;
3097  0036 1e01          	ldw	x,(OFST-2,sp)
3098  0038 1c0001        	addw	x,#1
3099  003b 1f01          	ldw	(OFST-2,sp),x
3100  003d               L7031:
3101                     ; 1261     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3103  003d 1e01          	ldw	x,(OFST-2,sp)
3104  003f a3ffff        	cpw	x,#65535
3105  0042 2704          	jreq	L3131
3107  0044 0d03          	tnz	(OFST+0,sp)
3108  0046 27ee          	jreq	L3031
3109  0048               L3131:
3110                     ; 1266     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3112  0048 c6514c        	ld	a,20812
3113  004b a501          	bcp	a,#1
3114  004d 2604          	jrne	L5131
3115                     ; 1268       status = ERROR;
3117  004f 0f03          	clr	(OFST+0,sp)
3119  0051 20cd          	jra	L1031
3120  0053               L5131:
3121                     ; 1272       status = SUCCESS;
3123  0053 a601          	ld	a,#1
3124  0055 6b03          	ld	(OFST+0,sp),a
3125  0057 20c7          	jra	L1031
3322                     ; 1292 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3322                     ; 1293                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3322                     ; 1294 {
3323                     .text:	section	.text,new
3324  0000               _RTC_AlarmSubSecondConfig:
3326  0000 89            	pushw	x
3327  0001 88            	push	a
3328       00000001      OFST:	set	1
3331                     ; 1295   uint8_t alarmstatus = 0;
3333  0002 7b01          	ld	a,(OFST+0,sp)
3334  0004 97            	ld	xl,a
3335                     ; 1296   ErrorStatus status = ERROR;
3337  0005 7b01          	ld	a,(OFST+0,sp)
3338  0007 97            	ld	xl,a
3339                     ; 1299   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3341                     ; 1300   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3343                     ; 1303   RTC->WPR = 0xCA;
3345  0008 35ca5159      	mov	20825,#202
3346                     ; 1304   RTC->WPR = 0x53;
3348  000c 35535159      	mov	20825,#83
3349                     ; 1307   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3351  0010 c6514c        	ld	a,20812
3352  0013 a540          	bcp	a,#64
3353  0015 2628          	jrne	L3141
3354                     ; 1310     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3356  0017 c65149        	ld	a,20809
3357  001a aa01          	or	a,#1
3358  001c 6b01          	ld	(OFST+0,sp),a
3359                     ; 1313     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3361  001e 72115149      	bres	20809,#0
3362                     ; 1316     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3364  0022 7b02          	ld	a,(OFST+1,sp)
3365  0024 c75164        	ld	20836,a
3366                     ; 1317     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3368  0027 7b03          	ld	a,(OFST+2,sp)
3369  0029 c75165        	ld	20837,a
3370                     ; 1318     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3372  002c 7b06          	ld	a,(OFST+5,sp)
3373  002e c75166        	ld	20838,a
3374                     ; 1321     RTC->CR2 |= alarmstatus;
3376  0031 c65149        	ld	a,20809
3377  0034 1a01          	or	a,(OFST+0,sp)
3378  0036 c75149        	ld	20809,a
3379                     ; 1323     status = SUCCESS;
3381  0039 a601          	ld	a,#1
3382  003b 6b01          	ld	(OFST+0,sp),a
3384  003d 2002          	jra	L5141
3385  003f               L3141:
3386                     ; 1327     status = ERROR;
3388  003f 0f01          	clr	(OFST+0,sp)
3389  0041               L5141:
3390                     ; 1331   RTC->WPR = 0xFF; 
3392  0041 35ff5159      	mov	20825,#255
3393                     ; 1333   return (ErrorStatus)status;
3395  0045 7b01          	ld	a,(OFST+0,sp)
3398  0047 5b03          	addw	sp,#3
3399  0049 81            	ret
3489                     ; 1363 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3489                     ; 1364 {
3490                     .text:	section	.text,new
3491  0000               _RTC_WakeUpClockConfig:
3493  0000 88            	push	a
3494       00000000      OFST:	set	0
3497                     ; 1367   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3499                     ; 1370   RTC->WPR = 0xCA;
3501  0001 35ca5159      	mov	20825,#202
3502                     ; 1371   RTC->WPR = 0x53;
3504  0005 35535159      	mov	20825,#83
3505                     ; 1374   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3507  0009 72155149      	bres	20809,#2
3508                     ; 1377   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3510  000d c65148        	ld	a,20808
3511  0010 a4f8          	and	a,#248
3512  0012 c75148        	ld	20808,a
3513                     ; 1380   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3515  0015 c65148        	ld	a,20808
3516  0018 1a01          	or	a,(OFST+1,sp)
3517  001a c75148        	ld	20808,a
3518                     ; 1383   RTC->WPR = 0xFF; 
3520  001d 35ff5159      	mov	20825,#255
3521                     ; 1384 }
3524  0021 84            	pop	a
3525  0022 81            	ret
3558                     ; 1394 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3558                     ; 1395 {
3559                     .text:	section	.text,new
3560  0000               _RTC_SetWakeUpCounter:
3564                     ; 1397   RTC->WPR = 0xCA;
3566  0000 35ca5159      	mov	20825,#202
3567                     ; 1398   RTC->WPR = 0x53;
3569  0004 35535159      	mov	20825,#83
3570                     ; 1402   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3572  0008 9e            	ld	a,xh
3573  0009 c75154        	ld	20820,a
3574                     ; 1403   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3576  000c 9f            	ld	a,xl
3577  000d c75155        	ld	20821,a
3578                     ; 1406   RTC->WPR = 0xFF; 
3580  0010 35ff5159      	mov	20825,#255
3581                     ; 1407 }
3584  0014 81            	ret
3617                     ; 1414 uint16_t RTC_GetWakeUpCounter(void)
3617                     ; 1415 {
3618                     .text:	section	.text,new
3619  0000               _RTC_GetWakeUpCounter:
3621  0000 89            	pushw	x
3622       00000002      OFST:	set	2
3625                     ; 1416   uint16_t tmpreg = 0;
3627  0001 5f            	clrw	x
3628  0002 1f01          	ldw	(OFST-1,sp),x
3629                     ; 1419   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3631  0004 c65154        	ld	a,20820
3632  0007 5f            	clrw	x
3633  0008 97            	ld	xl,a
3634  0009 4f            	clr	a
3635  000a 02            	rlwa	x,a
3636  000b 1f01          	ldw	(OFST-1,sp),x
3637                     ; 1420   tmpreg |= RTC->WUTRL;
3639  000d c65155        	ld	a,20821
3640  0010 5f            	clrw	x
3641  0011 97            	ld	xl,a
3642  0012 01            	rrwa	x,a
3643  0013 1a02          	or	a,(OFST+0,sp)
3644  0015 01            	rrwa	x,a
3645  0016 1a01          	or	a,(OFST-1,sp)
3646  0018 01            	rrwa	x,a
3647  0019 1f01          	ldw	(OFST-1,sp),x
3648                     ; 1423   return (uint16_t)tmpreg;
3650  001b 1e01          	ldw	x,(OFST-1,sp)
3653  001d 5b02          	addw	sp,#2
3654  001f 81            	ret
3707                     ; 1434 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3707                     ; 1435 {
3708                     .text:	section	.text,new
3709  0000               _RTC_WakeUpCmd:
3711  0000 88            	push	a
3712  0001 5203          	subw	sp,#3
3713       00000003      OFST:	set	3
3716                     ; 1436   ErrorStatus status = ERROR;
3718  0003 7b01          	ld	a,(OFST-2,sp)
3719  0005 97            	ld	xl,a
3720                     ; 1437   uint16_t wutwfcount = 0;
3722  0006 5f            	clrw	x
3723  0007 1f02          	ldw	(OFST-1,sp),x
3724                     ; 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
3726                     ; 1443   RTC->WPR = 0xCA;
3728  0009 35ca5159      	mov	20825,#202
3729                     ; 1444   RTC->WPR = 0x53;
3731  000d 35535159      	mov	20825,#83
3732                     ; 1446   if (NewState != DISABLE)
3734  0011 0d04          	tnz	(OFST+1,sp)
3735  0013 2711          	jreq	L1351
3736                     ; 1449     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3738  0015 72145149      	bset	20809,#2
3739                     ; 1451     status = SUCCESS;
3741  0019 a601          	ld	a,#1
3742  001b 6b01          	ld	(OFST-2,sp),a
3744  001d               L3351:
3745                     ; 1476   RTC->WPR = 0xFF; 
3747  001d 35ff5159      	mov	20825,#255
3748                     ; 1479   return (ErrorStatus)status;
3750  0021 7b01          	ld	a,(OFST-2,sp)
3753  0023 5b04          	addw	sp,#4
3754  0025 81            	ret
3755  0026               L1351:
3756                     ; 1456     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3758  0026 72155149      	bres	20809,#2
3760  002a 2007          	jra	L7351
3761  002c               L5351:
3762                     ; 1461       wutwfcount++;
3764  002c 1e02          	ldw	x,(OFST-1,sp)
3765  002e 1c0001        	addw	x,#1
3766  0031 1f02          	ldw	(OFST-1,sp),x
3767  0033               L7351:
3768                     ; 1459     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3770  0033 c6514c        	ld	a,20812
3771  0036 a504          	bcp	a,#4
3772  0038 2607          	jrne	L3451
3774  003a 1e02          	ldw	x,(OFST-1,sp)
3775  003c a3ffff        	cpw	x,#65535
3776  003f 26eb          	jrne	L5351
3777  0041               L3451:
3778                     ; 1465     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3780  0041 c6514c        	ld	a,20812
3781  0044 a504          	bcp	a,#4
3782  0046 2604          	jrne	L5451
3783                     ; 1467       status = ERROR;
3785  0048 0f01          	clr	(OFST-2,sp)
3787  004a 20d1          	jra	L3351
3788  004c               L5451:
3789                     ; 1471       status = SUCCESS;
3791  004c a601          	ld	a,#1
3792  004e 6b01          	ld	(OFST-2,sp),a
3793  0050 20cb          	jra	L3351
3883                     ; 1516 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3883                     ; 1517                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3883                     ; 1518 {
3884                     .text:	section	.text,new
3885  0000               _RTC_DayLightSavingConfig:
3887  0000 89            	pushw	x
3888       00000000      OFST:	set	0
3891                     ; 1520   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3893                     ; 1521   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3895                     ; 1524   RTC->WPR = 0xCA;
3897  0001 35ca5159      	mov	20825,#202
3898                     ; 1525   RTC->WPR = 0x53;
3900  0005 35535159      	mov	20825,#83
3901                     ; 1528   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3903  0009 7215514a      	bres	20810,#2
3904                     ; 1531   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3906  000d 9f            	ld	a,xl
3907  000e 1a01          	or	a,(OFST+1,sp)
3908  0010 ca514a        	or	a,20810
3909  0013 c7514a        	ld	20810,a
3910                     ; 1534   RTC->WPR = 0xFF; 
3912  0016 35ff5159      	mov	20825,#255
3913                     ; 1535 }
3916  001a 85            	popw	x
3917  001b 81            	ret
3942                     ; 1543 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3942                     ; 1544 {
3943                     .text:	section	.text,new
3944  0000               _RTC_GetStoreOperation:
3948                     ; 1546   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3950  0000 c6514a        	ld	a,20810
3951  0003 a404          	and	a,#4
3954  0005 81            	ret
4048                     ; 1581 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4048                     ; 1582                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4048                     ; 1583 {
4049                     .text:	section	.text,new
4050  0000               _RTC_OutputConfig:
4052  0000 89            	pushw	x
4053       00000000      OFST:	set	0
4056                     ; 1585   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4058                     ; 1586   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4060                     ; 1589   RTC->WPR = 0xCA;
4062  0001 35ca5159      	mov	20825,#202
4063                     ; 1590   RTC->WPR = 0x53;
4065  0005 35535159      	mov	20825,#83
4066                     ; 1593   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4068  0009 c6514a        	ld	a,20810
4069  000c a48f          	and	a,#143
4070  000e c7514a        	ld	20810,a
4071                     ; 1596   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4073  0011 9f            	ld	a,xl
4074  0012 1a01          	or	a,(OFST+1,sp)
4075  0014 ca514a        	or	a,20810
4076  0017 c7514a        	ld	20810,a
4077                     ; 1599   RTC->WPR = 0xFF; 
4079  001a 35ff5159      	mov	20825,#255
4080                     ; 1600 }
4083  001e 85            	popw	x
4084  001f 81            	ret
4173                     ; 1633 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4173                     ; 1634                                    uint16_t RTC_ShiftSubFS)
4173                     ; 1635 {
4174                     .text:	section	.text,new
4175  0000               _RTC_SynchroShiftConfig:
4177  0000 88            	push	a
4178  0001 5203          	subw	sp,#3
4179       00000003      OFST:	set	3
4182                     ; 1636   uint8_t shiftrhreg = 0;
4184  0003 7b01          	ld	a,(OFST-2,sp)
4185  0005 97            	ld	xl,a
4186                     ; 1637   ErrorStatus status = ERROR;
4188  0006 7b01          	ld	a,(OFST-2,sp)
4189  0008 97            	ld	xl,a
4190                     ; 1638   uint16_t shpfcount = 0;
4192  0009 5f            	clrw	x
4193  000a 1f02          	ldw	(OFST-1,sp),x
4194                     ; 1641   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4196                     ; 1642   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4198                     ; 1645   RTC->WPR = 0xCA;
4200  000c 35ca5159      	mov	20825,#202
4201                     ; 1646   RTC->WPR = 0x53;
4203  0010 35535159      	mov	20825,#83
4204                     ; 1649   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4206  0014 c6514c        	ld	a,20812
4207  0017 a508          	bcp	a,#8
4208  0019 2717          	jreq	L7271
4210  001b 2007          	jra	L3371
4211  001d               L1371:
4212                     ; 1654       shpfcount++;
4214  001d 1e02          	ldw	x,(OFST-1,sp)
4215  001f 1c0001        	addw	x,#1
4216  0022 1f02          	ldw	(OFST-1,sp),x
4217  0024               L3371:
4218                     ; 1652     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4220  0024 c6514c        	ld	a,20812
4221  0027 a508          	bcp	a,#8
4222  0029 2707          	jreq	L7271
4224  002b 1e02          	ldw	x,(OFST-1,sp)
4225  002d a3ffff        	cpw	x,#65535
4226  0030 26eb          	jrne	L1371
4227  0032               L7271:
4228                     ; 1659   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4230  0032 c6514c        	ld	a,20812
4231  0035 a508          	bcp	a,#8
4232  0037 2616          	jrne	L1471
4233                     ; 1662     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4235  0039 7b07          	ld	a,(OFST+4,sp)
4236  003b 1a04          	or	a,(OFST+1,sp)
4237  003d 6b01          	ld	(OFST-2,sp),a
4238                     ; 1663     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4240  003f 7b01          	ld	a,(OFST-2,sp)
4241  0041 c7515a        	ld	20826,a
4242                     ; 1664     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4244  0044 7b08          	ld	a,(OFST+5,sp)
4245  0046 c7515b        	ld	20827,a
4246                     ; 1666     status = SUCCESS;
4248  0049 a601          	ld	a,#1
4249  004b 6b01          	ld	(OFST-2,sp),a
4251  004d 2002          	jra	L3471
4252  004f               L1471:
4253                     ; 1670     status = ERROR;
4255  004f 0f01          	clr	(OFST-2,sp)
4256  0051               L3471:
4257                     ; 1674   RTC->WPR = 0xFF; 
4259  0051 35ff5159      	mov	20825,#255
4260                     ; 1676   return (ErrorStatus)(status);
4262  0055 7b01          	ld	a,(OFST-2,sp)
4265  0057 5b04          	addw	sp,#4
4266  0059 81            	ret
4392                     ; 1712 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4392                     ; 1713                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4392                     ; 1714                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4392                     ; 1715 {
4393                     .text:	section	.text,new
4394  0000               _RTC_SmoothCalibConfig:
4396  0000 89            	pushw	x
4397  0001 5203          	subw	sp,#3
4398       00000003      OFST:	set	3
4401                     ; 1716   ErrorStatus status = ERROR;
4403  0003 7b01          	ld	a,(OFST-2,sp)
4404  0005 97            	ld	xl,a
4405                     ; 1717   uint16_t recalpfcount = 0;
4407  0006 5f            	clrw	x
4408  0007 1f02          	ldw	(OFST-1,sp),x
4409                     ; 1720   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4411                     ; 1721   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4413                     ; 1722   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4415                     ; 1725   RTC->WPR = 0xCA;
4417  0009 35ca5159      	mov	20825,#202
4418                     ; 1726   RTC->WPR = 0x53;
4420  000d 35535159      	mov	20825,#83
4421                     ; 1729   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4423  0011 c6514c        	ld	a,20812
4424  0014 a502          	bcp	a,#2
4425  0016 2717          	jreq	L1202
4427  0018 2007          	jra	L5202
4428  001a               L3202:
4429                     ; 1734       recalpfcount++;
4431  001a 1e02          	ldw	x,(OFST-1,sp)
4432  001c 1c0001        	addw	x,#1
4433  001f 1f02          	ldw	(OFST-1,sp),x
4434  0021               L5202:
4435                     ; 1732     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4437  0021 c6514c        	ld	a,20812
4438  0024 a502          	bcp	a,#2
4439  0026 2707          	jreq	L1202
4441  0028 1e02          	ldw	x,(OFST-1,sp)
4442  002a a3ffff        	cpw	x,#65535
4443  002d 26eb          	jrne	L3202
4444  002f               L1202:
4445                     ; 1740   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4447  002f c6514c        	ld	a,20812
4448  0032 a502          	bcp	a,#2
4449  0034 2614          	jrne	L3302
4450                     ; 1743     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4450                     ; 1744                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4450                     ; 1745                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4452  0036 7b04          	ld	a,(OFST+1,sp)
4453  0038 1a05          	or	a,(OFST+2,sp)
4454  003a 1a08          	or	a,(OFST+5,sp)
4455  003c c7516a        	ld	20842,a
4456                     ; 1746     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4458  003f 7b09          	ld	a,(OFST+6,sp)
4459  0041 c7516b        	ld	20843,a
4460                     ; 1748     status = SUCCESS;
4462  0044 a601          	ld	a,#1
4463  0046 6b01          	ld	(OFST-2,sp),a
4465  0048 2002          	jra	L5302
4466  004a               L3302:
4467                     ; 1752     status = ERROR;
4469  004a 0f01          	clr	(OFST-2,sp)
4470  004c               L5302:
4471                     ; 1756   RTC->WPR = 0xFF; 
4473  004c 35ff5159      	mov	20825,#255
4474                     ; 1758   return (ErrorStatus)(status);
4476  0050 7b01          	ld	a,(OFST-2,sp)
4479  0052 5b05          	addw	sp,#5
4480  0054 81            	ret
4538                     ; 1784 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4538                     ; 1785 {
4539                     .text:	section	.text,new
4540  0000               _RTC_CalibOutputConfig:
4544                     ; 1787   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4546                     ; 1790   RTC->WPR = 0xCA;
4548  0000 35ca5159      	mov	20825,#202
4549                     ; 1791   RTC->WPR = 0x53;
4551  0004 35535159      	mov	20825,#83
4552                     ; 1793   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4554  0008 4d            	tnz	a
4555  0009 2706          	jreq	L5602
4556                     ; 1796     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4558  000b 7216514a      	bset	20810,#3
4560  000f 2004          	jra	L7602
4561  0011               L5602:
4562                     ; 1801     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4564  0011 7217514a      	bres	20810,#3
4565  0015               L7602:
4566                     ; 1805   RTC->WPR = 0xFF; 
4568  0015 35ff5159      	mov	20825,#255
4569                     ; 1806 }
4572  0019 81            	ret
4607                     ; 1814 void RTC_CalibOutputCmd(FunctionalState NewState)
4607                     ; 1815 {
4608                     .text:	section	.text,new
4609  0000               _RTC_CalibOutputCmd:
4613                     ; 1817   assert_param(IS_FUNCTIONAL_STATE(NewState));
4615                     ; 1820   RTC->WPR = 0xCA;
4617  0000 35ca5159      	mov	20825,#202
4618                     ; 1821   RTC->WPR = 0x53;
4620  0004 35535159      	mov	20825,#83
4621                     ; 1823   if (NewState != DISABLE)
4623  0008 4d            	tnz	a
4624  0009 2706          	jreq	L7012
4625                     ; 1826     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4627  000b 721e514a      	bset	20810,#7
4629  000f 2004          	jra	L1112
4630  0011               L7012:
4631                     ; 1831     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4633  0011 721f514a      	bres	20810,#7
4634  0015               L1112:
4635                     ; 1835   RTC->WPR = 0xFF; 
4637  0015 35ff5159      	mov	20825,#255
4638                     ; 1836 }
4641  0019 81            	ret
4736                     ; 1865 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4736                     ; 1866                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4736                     ; 1867 {
4737                     .text:	section	.text,new
4738  0000               _RTC_TamperLevelConfig:
4740  0000 89            	pushw	x
4741       00000000      OFST:	set	0
4744                     ; 1869   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4746                     ; 1870   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4748                     ; 1873   RTC->WPR = 0xCA;
4750  0001 35ca5159      	mov	20825,#202
4751                     ; 1874   RTC->WPR = 0x53;
4753  0005 35535159      	mov	20825,#83
4754                     ; 1876   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4756  0009 9f            	ld	a,xl
4757  000a 4d            	tnz	a
4758  000b 270a          	jreq	L7512
4759                     ; 1879     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4761  000d 9e            	ld	a,xh
4762  000e 48            	sll	a
4763  000f ca516c        	or	a,20844
4764  0012 c7516c        	ld	20844,a
4766  0015 200a          	jra	L1612
4767  0017               L7512:
4768                     ; 1884     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4770  0017 7b01          	ld	a,(OFST+1,sp)
4771  0019 48            	sll	a
4772  001a 43            	cpl	a
4773  001b c4516c        	and	a,20844
4774  001e c7516c        	ld	20844,a
4775  0021               L1612:
4776                     ; 1888   RTC->WPR = 0xFF; 
4778  0021 35ff5159      	mov	20825,#255
4779                     ; 1889 }
4782  0025 85            	popw	x
4783  0026 81            	ret
4857                     ; 1897 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4857                     ; 1898 {
4858                     .text:	section	.text,new
4859  0000               _RTC_TamperFilterConfig:
4861  0000 88            	push	a
4862       00000000      OFST:	set	0
4865                     ; 1901   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4867                     ; 1904   RTC->WPR = 0xCA;
4869  0001 35ca5159      	mov	20825,#202
4870                     ; 1905   RTC->WPR = 0x53;
4872  0005 35535159      	mov	20825,#83
4873                     ; 1908   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4875  0009 c6516d        	ld	a,20845
4876  000c a4e7          	and	a,#231
4877  000e c7516d        	ld	20845,a
4878                     ; 1911   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4880  0011 c6516d        	ld	a,20845
4881  0014 1a01          	or	a,(OFST+1,sp)
4882  0016 c7516d        	ld	20845,a
4883                     ; 1914   RTC->WPR = 0xFF; 
4885  0019 35ff5159      	mov	20825,#255
4886                     ; 1916 }
4889  001d 84            	pop	a
4890  001e 81            	ret
5003                     ; 1925 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5003                     ; 1926 {
5004                     .text:	section	.text,new
5005  0000               _RTC_TamperSamplingFreqConfig:
5007  0000 88            	push	a
5008       00000000      OFST:	set	0
5011                     ; 1928   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5013                     ; 1931   RTC->WPR = 0xCA;
5015  0001 35ca5159      	mov	20825,#202
5016                     ; 1932   RTC->WPR = 0x53;
5018  0005 35535159      	mov	20825,#83
5019                     ; 1935   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5021  0009 c6516d        	ld	a,20845
5022  000c a4f8          	and	a,#248
5023  000e c7516d        	ld	20845,a
5024                     ; 1938   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5026  0011 c6516d        	ld	a,20845
5027  0014 1a01          	or	a,(OFST+1,sp)
5028  0016 c7516d        	ld	20845,a
5029                     ; 1941   RTC->WPR = 0xFF; 
5031  0019 35ff5159      	mov	20825,#255
5032                     ; 1942 }
5035  001d 84            	pop	a
5036  001e 81            	ret
5119                     ; 1952 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5119                     ; 1953 {
5120                     .text:	section	.text,new
5121  0000               _RTC_TamperPinsPrechargeDuration:
5123  0000 88            	push	a
5124       00000000      OFST:	set	0
5127                     ; 1955   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5129                     ; 1958   RTC->WPR = 0xCA;
5131  0001 35ca5159      	mov	20825,#202
5132                     ; 1959   RTC->WPR = 0x53;
5134  0005 35535159      	mov	20825,#83
5135                     ; 1962   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5137  0009 c6516d        	ld	a,20845
5138  000c a41f          	and	a,#31
5139  000e c7516d        	ld	20845,a
5140                     ; 1965   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5142  0011 c6516d        	ld	a,20845
5143  0014 1a01          	or	a,(OFST+1,sp)
5144  0016 c7516d        	ld	20845,a
5145                     ; 1968   RTC->WPR = 0xFF; 
5147  0019 35ff5159      	mov	20825,#255
5148                     ; 1969 }
5151  001d 84            	pop	a
5152  001e 81            	ret
5197                     ; 1981 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5197                     ; 1982                    FunctionalState NewState)
5197                     ; 1983 {
5198                     .text:	section	.text,new
5199  0000               _RTC_TamperCmd:
5201  0000 89            	pushw	x
5202       00000000      OFST:	set	0
5205                     ; 1986   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5207                     ; 1987   assert_param(IS_FUNCTIONAL_STATE(NewState));
5209                     ; 1990   RTC->WPR = 0xCA;
5211  0001 35ca5159      	mov	20825,#202
5212                     ; 1991   RTC->WPR = 0x53;
5214  0005 35535159      	mov	20825,#83
5215                     ; 1994   if (NewState != DISABLE)
5217  0009 9f            	ld	a,xl
5218  000a 4d            	tnz	a
5219  000b 2709          	jreq	L5332
5220                     ; 1997     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5222  000d 9e            	ld	a,xh
5223  000e ca516c        	or	a,20844
5224  0011 c7516c        	ld	20844,a
5226  0014 2009          	jra	L7332
5227  0016               L5332:
5228                     ; 2002     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5230  0016 7b01          	ld	a,(OFST+1,sp)
5231  0018 43            	cpl	a
5232  0019 c4516c        	and	a,20844
5233  001c c7516c        	ld	20844,a
5234  001f               L7332:
5235                     ; 2007   RTC->WPR = 0xFF; 
5237  001f 35ff5159      	mov	20825,#255
5238                     ; 2008 }
5241  0023 85            	popw	x
5242  0024 81            	ret
5314                     ; 2052 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5314                     ; 2053 {
5315                     .text:	section	.text,new
5316  0000               _RTC_ITConfig:
5318  0000 89            	pushw	x
5319       00000000      OFST:	set	0
5322                     ; 2055   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5324                     ; 2056   assert_param(IS_FUNCTIONAL_STATE(NewState));
5326                     ; 2059   RTC->WPR = 0xCA;
5328  0001 35ca5159      	mov	20825,#202
5329                     ; 2060   RTC->WPR = 0x53;
5331  0005 35535159      	mov	20825,#83
5332                     ; 2062   if (NewState != DISABLE)
5334  0009 0d05          	tnz	(OFST+5,sp)
5335  000b 2715          	jreq	L5732
5336                     ; 2065     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5338  000d 9f            	ld	a,xl
5339  000e a4f0          	and	a,#240
5340  0010 ca5149        	or	a,20809
5341  0013 c75149        	ld	20809,a
5342                     ; 2066     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5344  0016 7b02          	ld	a,(OFST+2,sp)
5345  0018 a401          	and	a,#1
5346  001a ca516c        	or	a,20844
5347  001d c7516c        	ld	20844,a
5349  0020 2016          	jra	L7732
5350  0022               L5732:
5351                     ; 2071     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5353  0022 7b02          	ld	a,(OFST+2,sp)
5354  0024 a4f0          	and	a,#240
5355  0026 43            	cpl	a
5356  0027 c45149        	and	a,20809
5357  002a c75149        	ld	20809,a
5358                     ; 2072     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5360  002d 7b02          	ld	a,(OFST+2,sp)
5361  002f a401          	and	a,#1
5362  0031 43            	cpl	a
5363  0032 c4516c        	and	a,20844
5364  0035 c7516c        	ld	20844,a
5365  0038               L7732:
5366                     ; 2076   RTC->WPR = 0xFF; 
5368  0038 35ff5159      	mov	20825,#255
5369                     ; 2077 }
5372  003c 85            	popw	x
5373  003d 81            	ret
5543                     ; 2084 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5543                     ; 2085 {
5544                     .text:	section	.text,new
5545  0000               _RTC_GetFlagStatus:
5547  0000 89            	pushw	x
5548  0001 5203          	subw	sp,#3
5549       00000003      OFST:	set	3
5552                     ; 2086   FlagStatus flagstatus = RESET;
5554  0003 7b01          	ld	a,(OFST-2,sp)
5555  0005 97            	ld	xl,a
5556                     ; 2087   uint16_t tmpreg1 = 0;
5558  0006 1e02          	ldw	x,(OFST-1,sp)
5559                     ; 2088   uint16_t tmpreg2 = 0;
5561  0008 1e02          	ldw	x,(OFST-1,sp)
5562                     ; 2091   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5564                     ; 2094   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5566  000a c6514c        	ld	a,20812
5567  000d 5f            	clrw	x
5568  000e 97            	ld	xl,a
5569  000f 4f            	clr	a
5570  0010 02            	rlwa	x,a
5571  0011 1f02          	ldw	(OFST-1,sp),x
5572                     ; 2095   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5574  0013 c6514d        	ld	a,20813
5575  0016 5f            	clrw	x
5576  0017 97            	ld	xl,a
5577  0018 01            	rrwa	x,a
5578  0019 1a03          	or	a,(OFST+0,sp)
5579  001b 01            	rrwa	x,a
5580  001c 1a02          	or	a,(OFST-1,sp)
5581  001e 01            	rrwa	x,a
5582  001f 1f02          	ldw	(OFST-1,sp),x
5583                     ; 2098   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5585  0021 1e02          	ldw	x,(OFST-1,sp)
5586  0023 01            	rrwa	x,a
5587  0024 1405          	and	a,(OFST+2,sp)
5588  0026 01            	rrwa	x,a
5589  0027 1404          	and	a,(OFST+1,sp)
5590  0029 01            	rrwa	x,a
5591  002a a30000        	cpw	x,#0
5592  002d 2706          	jreq	L3742
5593                     ; 2100     flagstatus = SET;
5595  002f a601          	ld	a,#1
5596  0031 6b01          	ld	(OFST-2,sp),a
5598  0033 2002          	jra	L5742
5599  0035               L3742:
5600                     ; 2104     flagstatus = RESET;
5602  0035 0f01          	clr	(OFST-2,sp)
5603  0037               L5742:
5604                     ; 2106   return (FlagStatus)flagstatus;
5606  0037 7b01          	ld	a,(OFST-2,sp)
5609  0039 5b05          	addw	sp,#5
5610  003b 81            	ret
5645                     ; 2116 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5645                     ; 2117 {
5646                     .text:	section	.text,new
5647  0000               _RTC_ClearFlag:
5649  0000 89            	pushw	x
5650       00000000      OFST:	set	0
5653                     ; 2119   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5655                     ; 2122   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5657  0001 9f            	ld	a,xl
5658  0002 43            	cpl	a
5659  0003 c7514d        	ld	20813,a
5660                     ; 2123   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5662  0006 7b01          	ld	a,(OFST+1,sp)
5663  0008 43            	cpl	a
5664  0009 a47f          	and	a,#127
5665  000b c7514c        	ld	20812,a
5666                     ; 2124 }
5669  000e 85            	popw	x
5670  000f 81            	ret
5730                     ; 2132 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5730                     ; 2133 {
5731                     .text:	section	.text,new
5732  0000               _RTC_GetITStatus:
5734  0000 89            	pushw	x
5735  0001 89            	pushw	x
5736       00000002      OFST:	set	2
5739                     ; 2134   ITStatus itstatus = RESET;
5741  0002 7b02          	ld	a,(OFST+0,sp)
5742  0004 97            	ld	xl,a
5743                     ; 2135   uint8_t enablestatus = 0, tmpreg = 0;
5745  0005 7b01          	ld	a,(OFST-1,sp)
5746  0007 97            	ld	xl,a
5749  0008 7b02          	ld	a,(OFST+0,sp)
5750  000a 97            	ld	xl,a
5751                     ; 2138   assert_param(IS_RTC_GET_IT(RTC_IT));
5753                     ; 2141   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5755  000b c65149        	ld	a,20809
5756  000e 1404          	and	a,(OFST+2,sp)
5757  0010 6b01          	ld	(OFST-1,sp),a
5758                     ; 2144   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5760  0012 1e03          	ldw	x,(OFST+1,sp)
5761  0014 54            	srlw	x
5762  0015 54            	srlw	x
5763  0016 54            	srlw	x
5764  0017 54            	srlw	x
5765  0018 9f            	ld	a,xl
5766  0019 c4514d        	and	a,20813
5767  001c 6b02          	ld	(OFST+0,sp),a
5768                     ; 2147   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5770  001e 0d01          	tnz	(OFST-1,sp)
5771  0020 270a          	jreq	L3452
5773  0022 0d02          	tnz	(OFST+0,sp)
5774  0024 2706          	jreq	L3452
5775                     ; 2149     itstatus = SET;
5777  0026 a601          	ld	a,#1
5778  0028 6b02          	ld	(OFST+0,sp),a
5780  002a 2002          	jra	L5452
5781  002c               L3452:
5782                     ; 2153     itstatus = RESET;
5784  002c 0f02          	clr	(OFST+0,sp)
5785  002e               L5452:
5786                     ; 2156   return (ITStatus)itstatus;
5788  002e 7b02          	ld	a,(OFST+0,sp)
5791  0030 5b04          	addw	sp,#4
5792  0032 81            	ret
5828                     ; 2166 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5828                     ; 2167 {
5829                     .text:	section	.text,new
5830  0000               _RTC_ClearITPendingBit:
5834                     ; 2169   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5836                     ; 2172   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5838  0000 54            	srlw	x
5839  0001 54            	srlw	x
5840  0002 54            	srlw	x
5841  0003 54            	srlw	x
5842  0004 9f            	ld	a,xl
5843  0005 43            	cpl	a
5844  0006 c7514d        	ld	20813,a
5845                     ; 2173 }
5848  0009 81            	ret
5887                     ; 2196 static uint8_t ByteToBcd2(uint8_t Value)
5887                     ; 2197 {
5888                     .text:	section	.text,new
5889  0000               L3_ByteToBcd2:
5891  0000 88            	push	a
5892  0001 88            	push	a
5893       00000001      OFST:	set	1
5896                     ; 2198   uint8_t bcdhigh = 0;
5898  0002 0f01          	clr	(OFST+0,sp)
5900  0004 2008          	jra	L7062
5901  0006               L3062:
5902                     ; 2202     bcdhigh++;
5904  0006 0c01          	inc	(OFST+0,sp)
5905                     ; 2203     Value -= 10;
5907  0008 7b02          	ld	a,(OFST+1,sp)
5908  000a a00a          	sub	a,#10
5909  000c 6b02          	ld	(OFST+1,sp),a
5910  000e               L7062:
5911                     ; 2200   while (Value >= 10)
5913  000e 7b02          	ld	a,(OFST+1,sp)
5914  0010 a10a          	cp	a,#10
5915  0012 24f2          	jruge	L3062
5916                     ; 2206   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5918  0014 7b01          	ld	a,(OFST+0,sp)
5919  0016 97            	ld	xl,a
5920  0017 a610          	ld	a,#16
5921  0019 42            	mul	x,a
5922  001a 9f            	ld	a,xl
5923  001b 1a02          	or	a,(OFST+1,sp)
5926  001d 85            	popw	x
5927  001e 81            	ret
5966                     ; 2214 static uint8_t Bcd2ToByte(uint8_t Value)
5966                     ; 2215 {
5967                     .text:	section	.text,new
5968  0000               L5_Bcd2ToByte:
5970  0000 88            	push	a
5971  0001 88            	push	a
5972       00000001      OFST:	set	1
5975                     ; 2216   uint8_t tmp = 0;
5977  0002 0f01          	clr	(OFST+0,sp)
5978                     ; 2218   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5980  0004 a4f0          	and	a,#240
5981  0006 4e            	swap	a
5982  0007 a40f          	and	a,#15
5983  0009 97            	ld	xl,a
5984  000a a60a          	ld	a,#10
5985  000c 42            	mul	x,a
5986  000d 9f            	ld	a,xl
5987  000e 6b01          	ld	(OFST+0,sp),a
5988                     ; 2220   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5990  0010 7b02          	ld	a,(OFST+1,sp)
5991  0012 a40f          	and	a,#15
5992  0014 1b01          	add	a,(OFST+0,sp)
5995  0016 85            	popw	x
5996  0017 81            	ret
6009                     	xdef	_RTC_ClearITPendingBit
6010                     	xdef	_RTC_GetITStatus
6011                     	xdef	_RTC_ClearFlag
6012                     	xdef	_RTC_GetFlagStatus
6013                     	xdef	_RTC_ITConfig
6014                     	xdef	_RTC_TamperCmd
6015                     	xdef	_RTC_TamperPinsPrechargeDuration
6016                     	xdef	_RTC_TamperSamplingFreqConfig
6017                     	xdef	_RTC_TamperFilterConfig
6018                     	xdef	_RTC_TamperLevelConfig
6019                     	xdef	_RTC_CalibOutputCmd
6020                     	xdef	_RTC_CalibOutputConfig
6021                     	xdef	_RTC_SmoothCalibConfig
6022                     	xdef	_RTC_SynchroShiftConfig
6023                     	xdef	_RTC_OutputConfig
6024                     	xdef	_RTC_GetStoreOperation
6025                     	xdef	_RTC_DayLightSavingConfig
6026                     	xdef	_RTC_WakeUpCmd
6027                     	xdef	_RTC_GetWakeUpCounter
6028                     	xdef	_RTC_SetWakeUpCounter
6029                     	xdef	_RTC_WakeUpClockConfig
6030                     	xdef	_RTC_AlarmSubSecondConfig
6031                     	xdef	_RTC_AlarmCmd
6032                     	xdef	_RTC_GetAlarm
6033                     	xdef	_RTC_AlarmStructInit
6034                     	xdef	_RTC_SetAlarm
6035                     	xdef	_RTC_GetDate
6036                     	xdef	_RTC_DateStructInit
6037                     	xdef	_RTC_SetDate
6038                     	xdef	_RTC_GetSubSecond
6039                     	xdef	_RTC_GetTime
6040                     	xdef	_RTC_TimeStructInit
6041                     	xdef	_RTC_SetTime
6042                     	xdef	_RTC_BypassShadowCmd
6043                     	xdef	_RTC_RatioCmd
6044                     	xdef	_RTC_WaitForSynchro
6045                     	xdef	_RTC_ExitInitMode
6046                     	xdef	_RTC_EnterInitMode
6047                     	xdef	_RTC_WriteProtectionCmd
6048                     	xdef	_RTC_StructInit
6049                     	xdef	_RTC_Init
6050                     	xdef	_RTC_DeInit
6069                     	end
