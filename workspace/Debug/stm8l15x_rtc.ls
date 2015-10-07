   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  85                     ; 226 ErrorStatus RTC_DeInit(void)
  85                     ; 227 {
  87                     	switch	.text
  88  0000               _RTC_DeInit:
  90  0000 5205          	subw	sp,#5
  91       00000005      OFST:	set	5
  94                     ; 228     ErrorStatus status = ERROR;
  96  0002 7b01          	ld	a,(OFST-4,sp)
  97  0004 97            	ld	xl,a
  98                     ; 229     uint16_t wutwfcount = 0;
 100  0005 5f            	clrw	x
 101  0006 1f02          	ldw	(OFST-3,sp),x
 102                     ; 230     uint16_t recalpfcount = 0;
 104  0008 5f            	clrw	x
 105  0009 1f04          	ldw	(OFST-1,sp),x
 106                     ; 233     RTC->WPR = 0xCA;
 108  000b 35ca5159      	mov	20825,#202
 109                     ; 234     RTC->WPR = 0x53;
 111  000f 35535159      	mov	20825,#83
 112                     ; 237     if (RTC_EnterInitMode() == ERROR) {
 114  0013 cd0166        	call	_RTC_EnterInitMode
 116  0016 4d            	tnz	a
 117  0017 260b          	jrne	L35
 118                     ; 238         status = ERROR;
 120  0019 0f01          	clr	(OFST-4,sp)
 121                     ; 240         RTC->WPR = 0xFF;
 123  001b 35ff5159      	mov	20825,#255
 125  001f               L55:
 126                     ; 322     return (ErrorStatus)status;
 128  001f 7b01          	ld	a,(OFST-4,sp)
 131  0021 5b05          	addw	sp,#5
 132  0023 81            	ret
 133  0024               L35:
 134                     ; 243         RTC->TR1 = RTC_TR1_RESET_VALUE;
 136  0024 725f5140      	clr	20800
 137                     ; 244         RTC->TR2 = RTC_TR2_RESET_VALUE;
 139  0028 725f5141      	clr	20801
 140                     ; 245         RTC->TR3 = RTC_TR3_RESET_VALUE;
 142  002c 725f5142      	clr	20802
 143                     ; 248         RTC->DR1 = RTC_DR1_RESET_VALUE;
 145  0030 35015144      	mov	20804,#1
 146                     ; 249         RTC->DR2 = RTC_DR2_RESET_VALUE;
 148  0034 35215145      	mov	20805,#33
 149                     ; 250         RTC->DR3 = RTC_DR3_RESET_VALUE;
 151  0038 725f5146      	clr	20806
 152                     ; 253         RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 154  003c 725f5150      	clr	20816
 155                     ; 254         RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 157  0040 35ff5151      	mov	20817,#255
 158                     ; 255         RTC->APRER  = RTC_APRER_RESET_VALUE;
 160  0044 357f5152      	mov	20818,#127
 161                     ; 257         RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 163  0048 725f516c      	clr	20844
 164                     ; 258         RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 166  004c 725f516d      	clr	20845
 167                     ; 262         RTC->CR1 = RTC_CR1_RESET_VALUE;
 169  0050 725f5148      	clr	20808
 170                     ; 263         RTC->CR2 = RTC_CR2_RESET_VALUE;
 172  0054 725f5149      	clr	20809
 173                     ; 264         RTC->CR3 = RTC_CR3_RESET_VALUE;
 175  0058 725f514a      	clr	20810
 177  005c 200b          	jra	L36
 178  005e               L75:
 179                     ; 268             wutwfcount++;
 181  005e 1e02          	ldw	x,(OFST-3,sp)
 182  0060 1c0001        	addw	x,#1
 183  0063 1f02          	ldw	(OFST-3,sp),x
 184                     ; 269             RTC->ISR1 = 0;
 186  0065 725f514c      	clr	20812
 187  0069               L36:
 188                     ; 267         while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT)) {
 190  0069 c6514c        	ld	a,20812
 191  006c a504          	bcp	a,#4
 192  006e 2607          	jrne	L76
 194  0070 1e02          	ldw	x,(OFST-3,sp)
 195  0072 a3ffff        	cpw	x,#65535
 196  0075 26e7          	jrne	L75
 197  0077               L76:
 198                     ; 272         if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) {
 200  0077 c6514c        	ld	a,20812
 201  007a a504          	bcp	a,#4
 202  007c 2608          	jrne	L17
 203                     ; 273             status = ERROR;
 205  007e 0f01          	clr	(OFST-4,sp)
 206                     ; 275             RTC->WPR = 0xFF;
 208  0080 35ff5159      	mov	20825,#255
 210  0084 2099          	jra	L55
 211  0086               L17:
 212                     ; 278             RTC->CR1 = RTC_CR1_RESET_VALUE;
 214  0086 725f5148      	clr	20808
 215                     ; 281             RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 217  008a 35ff5154      	mov	20820,#255
 218                     ; 282             RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 220  008e 35ff5155      	mov	20821,#255
 221                     ; 285             RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 223  0092 725f515c      	clr	20828
 224                     ; 286             RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 226  0096 725f515d      	clr	20829
 227                     ; 287             RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 229  009a 725f515e      	clr	20830
 230                     ; 288             RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 232  009e 725f515f      	clr	20831
 233                     ; 290             RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 235  00a2 725f5164      	clr	20836
 236                     ; 291             RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 238  00a6 725f5165      	clr	20837
 239                     ; 292             RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 241  00aa 725f5166      	clr	20838
 242                     ; 295             RTC->ISR1 = (uint8_t)0x00;
 244  00ae 725f514c      	clr	20812
 245                     ; 296             RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 247  00b2 725f514d      	clr	20813
 248                     ; 298             if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) {
 250  00b6 c6514c        	ld	a,20812
 251  00b9 a502          	bcp	a,#2
 252  00bb 2717          	jreq	L57
 254  00bd 2007          	jra	L101
 255  00bf               L77:
 256                     ; 300                     recalpfcount++;
 258  00bf 1e04          	ldw	x,(OFST-1,sp)
 259  00c1 1c0001        	addw	x,#1
 260  00c4 1f04          	ldw	(OFST-1,sp),x
 261  00c6               L101:
 262                     ; 299                 while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT)) {
 264  00c6 c6514c        	ld	a,20812
 265  00c9 a502          	bcp	a,#2
 266  00cb 2707          	jreq	L57
 268  00cd 1e04          	ldw	x,(OFST-1,sp)
 269  00cf a3ffff        	cpw	x,#65535
 270  00d2 26eb          	jrne	L77
 271  00d4               L57:
 272                     ; 303             if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET) {
 274  00d4 c6514c        	ld	a,20812
 275  00d7 a502          	bcp	a,#2
 276  00d9 2618          	jrne	L701
 277                     ; 304                 RTC->CALRH = RTC_CALRH_RESET_VALUE;
 279  00db 725f516a      	clr	20842
 280                     ; 305                 RTC->CALRL = RTC_CALRL_RESET_VALUE;
 282  00df 725f516b      	clr	20843
 283                     ; 307                 if (RTC_WaitForSynchro() == ERROR) {
 285  00e3 cd01a9        	call	_RTC_WaitForSynchro
 287  00e6 4d            	tnz	a
 288  00e7 2604          	jrne	L111
 289                     ; 308                     status = ERROR;
 291  00e9 0f01          	clr	(OFST-4,sp)
 293  00eb 2008          	jra	L511
 294  00ed               L111:
 295                     ; 310                     status = SUCCESS;
 297  00ed a601          	ld	a,#1
 298  00ef 6b01          	ld	(OFST-4,sp),a
 299  00f1 2002          	jra	L511
 300  00f3               L701:
 301                     ; 313                 status = ERROR;
 303  00f3 0f01          	clr	(OFST-4,sp)
 304  00f5               L511:
 305                     ; 317             RTC->WPR = 0xFF;
 307  00f5 35ff5159      	mov	20825,#255
 308  00f9 ac1f001f      	jpf	L55
 408                     ; 338 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 408                     ; 339 {
 409                     	switch	.text
 410  00fd               _RTC_Init:
 412  00fd 89            	pushw	x
 413  00fe 88            	push	a
 414       00000001      OFST:	set	1
 417                     ; 340     ErrorStatus status = ERROR;
 419  00ff 0f01          	clr	(OFST+0,sp)
 420                     ; 343     assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 422                     ; 344     assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 424                     ; 345     assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 426                     ; 348     RTC->WPR = 0xCA;
 428  0101 35ca5159      	mov	20825,#202
 429                     ; 349     RTC->WPR = 0x53;
 431  0105 35535159      	mov	20825,#83
 432                     ; 352     if (RTC_EnterInitMode() == ERROR) {
 434  0109 ad5b          	call	_RTC_EnterInitMode
 436  010b 4d            	tnz	a
 437  010c 2604          	jrne	L761
 438                     ; 353         status = ERROR;
 440  010e 0f01          	clr	(OFST+0,sp)
 442  0110 202d          	jra	L171
 443  0112               L761:
 444                     ; 356         RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 446  0112 721d5148      	bres	20808,#6
 447                     ; 359         RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 449  0116 1e02          	ldw	x,(OFST+1,sp)
 450  0118 c65148        	ld	a,20808
 451  011b fa            	or	a,(x)
 452  011c c75148        	ld	20808,a
 453                     ; 362         RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 455  011f 1e02          	ldw	x,(OFST+1,sp)
 456  0121 ee02          	ldw	x,(2,x)
 457  0123 4f            	clr	a
 458  0124 01            	rrwa	x,a
 459  0125 9f            	ld	a,xl
 460  0126 c75150        	ld	20816,a
 461                     ; 363         RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 463  0129 1e02          	ldw	x,(OFST+1,sp)
 464  012b e603          	ld	a,(3,x)
 465  012d c75151        	ld	20817,a
 466                     ; 364         RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 468  0130 1e02          	ldw	x,(OFST+1,sp)
 469  0132 e601          	ld	a,(1,x)
 470  0134 c75152        	ld	20818,a
 471                     ; 367         RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 473  0137 721f514c      	bres	20812,#7
 474                     ; 369         status = SUCCESS;
 476  013b a601          	ld	a,#1
 477  013d 6b01          	ld	(OFST+0,sp),a
 478  013f               L171:
 479                     ; 373     RTC->WPR = 0xFF;
 481  013f 35ff5159      	mov	20825,#255
 482                     ; 376     return (ErrorStatus)(status);
 484  0143 7b01          	ld	a,(OFST+0,sp)
 487  0145 5b03          	addw	sp,#3
 488  0147 81            	ret
 525                     ; 386 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 525                     ; 387 {
 526                     	switch	.text
 527  0148               _RTC_StructInit:
 531                     ; 389     RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 533  0148 7f            	clr	(x)
 534                     ; 392     RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 536  0149 a67f          	ld	a,#127
 537  014b e701          	ld	(1,x),a
 538                     ; 395     RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 540  014d 90ae00ff      	ldw	y,#255
 541  0151 ef02          	ldw	(2,x),y
 542                     ; 396 }
 545  0153 81            	ret
 601                     ; 406 void RTC_WriteProtectionCmd(FunctionalState NewState)
 601                     ; 407 {
 602                     	switch	.text
 603  0154               _RTC_WriteProtectionCmd:
 607                     ; 409     assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 411     if (NewState != DISABLE) {
 611  0154 4d            	tnz	a
 612  0155 2706          	jreq	L142
 613                     ; 413         RTC->WPR = RTC_WPR_EnableKey;
 615  0157 35ff5159      	mov	20825,#255
 617  015b 2008          	jra	L342
 618  015d               L142:
 619                     ; 416         RTC->WPR = RTC_WPR_DisableKey1;
 621  015d 35ca5159      	mov	20825,#202
 622                     ; 417         RTC->WPR = RTC_WPR_DisableKey2;
 624  0161 35535159      	mov	20825,#83
 625  0165               L342:
 626                     ; 419 }
 629  0165 81            	ret
 674                     ; 431 ErrorStatus RTC_EnterInitMode(void)
 674                     ; 432 {
 675                     	switch	.text
 676  0166               _RTC_EnterInitMode:
 678  0166 5203          	subw	sp,#3
 679       00000003      OFST:	set	3
 682                     ; 433     ErrorStatus status = ERROR;
 684  0168 7b01          	ld	a,(OFST-2,sp)
 685  016a 97            	ld	xl,a
 686                     ; 434     uint16_t initfcount = 0;
 688  016b 5f            	clrw	x
 689  016c 1f02          	ldw	(OFST-1,sp),x
 690                     ; 437     if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET) {
 692  016e c6514c        	ld	a,20812
 693  0171 a540          	bcp	a,#64
 694  0173 261b          	jrne	L762
 695                     ; 439         RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 697  0175 3580514c      	mov	20812,#128
 699  0179 2007          	jra	L572
 700  017b               L172:
 701                     ; 443             initfcount++;
 703  017b 1e02          	ldw	x,(OFST-1,sp)
 704  017d 1c0001        	addw	x,#1
 705  0180 1f02          	ldw	(OFST-1,sp),x
 706  0182               L572:
 707                     ; 442         while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT)) {
 709  0182 c6514c        	ld	a,20812
 710  0185 a540          	bcp	a,#64
 711  0187 2607          	jrne	L762
 713  0189 1e02          	ldw	x,(OFST-1,sp)
 714  018b a3ffff        	cpw	x,#65535
 715  018e 26eb          	jrne	L172
 716  0190               L762:
 717                     ; 447     if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET) {
 719  0190 c6514c        	ld	a,20812
 720  0193 a540          	bcp	a,#64
 721  0195 2604          	jrne	L303
 722                     ; 448         status = ERROR;
 724  0197 0f01          	clr	(OFST-2,sp)
 726  0199 2004          	jra	L503
 727  019b               L303:
 728                     ; 450         status = SUCCESS;
 730  019b a601          	ld	a,#1
 731  019d 6b01          	ld	(OFST-2,sp),a
 732  019f               L503:
 733                     ; 453     return (ErrorStatus)status;
 735  019f 7b01          	ld	a,(OFST-2,sp)
 738  01a1 5b03          	addw	sp,#3
 739  01a3 81            	ret
 762                     ; 466 void RTC_ExitInitMode(void)
 762                     ; 467 {
 763                     	switch	.text
 764  01a4               _RTC_ExitInitMode:
 768                     ; 469     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 770  01a4 721f514c      	bres	20812,#7
 771                     ; 470 }
 774  01a8 81            	ret
 819                     ; 495 ErrorStatus RTC_WaitForSynchro(void)
 819                     ; 496 {
 820                     	switch	.text
 821  01a9               _RTC_WaitForSynchro:
 823  01a9 5203          	subw	sp,#3
 824       00000003      OFST:	set	3
 827                     ; 497     uint16_t rsfcount = 0;
 829  01ab 5f            	clrw	x
 830  01ac 1f02          	ldw	(OFST-1,sp),x
 831                     ; 498     ErrorStatus status = ERROR;
 833  01ae 7b01          	ld	a,(OFST-2,sp)
 834  01b0 97            	ld	xl,a
 835                     ; 501     RTC->WPR = 0xCA;
 837  01b1 35ca5159      	mov	20825,#202
 838                     ; 502     RTC->WPR = 0x53;
 840  01b5 35535159      	mov	20825,#83
 841                     ; 505     RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 843  01b9 c6514c        	ld	a,20812
 844  01bc a45f          	and	a,#95
 845  01be c7514c        	ld	20812,a
 847  01c1 2007          	jra	L343
 848  01c3               L143:
 849                     ; 509         rsfcount++;
 851  01c3 1e02          	ldw	x,(OFST-1,sp)
 852  01c5 1c0001        	addw	x,#1
 853  01c8 1f02          	ldw	(OFST-1,sp),x
 854  01ca               L343:
 855                     ; 508     while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT)) {
 857  01ca c6514c        	ld	a,20812
 858  01cd a520          	bcp	a,#32
 859  01cf 2607          	jrne	L743
 861  01d1 1e02          	ldw	x,(OFST-1,sp)
 862  01d3 a3ffff        	cpw	x,#65535
 863  01d6 26eb          	jrne	L143
 864  01d8               L743:
 865                     ; 513     if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET) {
 867  01d8 c6514c        	ld	a,20812
 868  01db a520          	bcp	a,#32
 869  01dd 2706          	jreq	L153
 870                     ; 514         status = SUCCESS;
 872  01df a601          	ld	a,#1
 873  01e1 6b01          	ld	(OFST-2,sp),a
 875  01e3 2002          	jra	L353
 876  01e5               L153:
 877                     ; 516         status = ERROR;
 879  01e5 0f01          	clr	(OFST-2,sp)
 880  01e7               L353:
 881                     ; 520     RTC->WPR = 0xFF;
 883  01e7 35ff5159      	mov	20825,#255
 884                     ; 522     return (ErrorStatus)status;
 886  01eb 7b01          	ld	a,(OFST-2,sp)
 889  01ed 5b03          	addw	sp,#3
 890  01ef 81            	ret
 925                     ; 532 void RTC_RatioCmd(FunctionalState NewState)
 925                     ; 533 {
 926                     	switch	.text
 927  01f0               _RTC_RatioCmd:
 931                     ; 535     assert_param(IS_FUNCTIONAL_STATE(NewState));
 933                     ; 538     RTC->WPR = 0xCA;
 935  01f0 35ca5159      	mov	20825,#202
 936                     ; 539     RTC->WPR = 0x53;
 938  01f4 35535159      	mov	20825,#83
 939                     ; 541     if (NewState != DISABLE) {
 941  01f8 4d            	tnz	a
 942  01f9 2706          	jreq	L373
 943                     ; 543         RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 945  01fb 721a5148      	bset	20808,#5
 947  01ff 2004          	jra	L573
 948  0201               L373:
 949                     ; 546         RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 951  0201 721b5148      	bres	20808,#5
 952  0205               L573:
 953                     ; 550     RTC->WPR = 0xFF;
 955  0205 35ff5159      	mov	20825,#255
 956                     ; 551 }
 959  0209 81            	ret
 995                     ; 559 void RTC_BypassShadowCmd(FunctionalState NewState)
 995                     ; 560 {
 996                     	switch	.text
 997  020a               _RTC_BypassShadowCmd:
1001                     ; 562     assert_param(IS_FUNCTIONAL_STATE(NewState));
1003                     ; 565     RTC->WPR = 0xCA;
1005  020a 35ca5159      	mov	20825,#202
1006                     ; 566     RTC->WPR = 0x53;
1008  020e 35535159      	mov	20825,#83
1009                     ; 568     if (NewState != DISABLE) {
1011  0212 4d            	tnz	a
1012  0213 2706          	jreq	L514
1013                     ; 570         RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1015  0215 72185148      	bset	20808,#4
1017  0219 2004          	jra	L714
1018  021b               L514:
1019                     ; 573         RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1021  021b 72195148      	bres	20808,#4
1022  021f               L714:
1023                     ; 577     RTC->WPR = 0xFF;
1025  021f 35ff5159      	mov	20825,#255
1026                     ; 578 }
1029  0223 81            	ret
1177                     ; 617 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1177                     ; 618                         RTC_TimeTypeDef* RTC_TimeStruct)
1177                     ; 619 {
1178                     	switch	.text
1179  0224               _RTC_SetTime:
1181  0224 88            	push	a
1182  0225 88            	push	a
1183       00000001      OFST:	set	1
1186                     ; 620     ErrorStatus status = ERROR;
1188  0226 7b01          	ld	a,(OFST+0,sp)
1189  0228 97            	ld	xl,a
1190                     ; 621     uint8_t temp = 0;
1192  0229 7b01          	ld	a,(OFST+0,sp)
1193  022b 97            	ld	xl,a
1194                     ; 624     assert_param(IS_RTC_FORMAT(RTC_Format));
1196                     ; 626     if (RTC_Format == RTC_Format_BIN) {
1198  022c 0d02          	tnz	(OFST+1,sp)
1199  022e 2609          	jrne	L315
1200                     ; 628         if ((RTC->CR1 & RTC_CR1_FMT) != RESET) {
1202  0230 c65148        	ld	a,20808
1203  0233 a540          	bcp	a,#64
1204  0235 2700          	jreq	L515
1205                     ; 629             assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1207                     ; 630             assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1210  0237               L515:
1211                     ; 632             assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1213                     ; 634         assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1215                     ; 635         assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1218  0237 2007          	jra	L125
1219  0239               L315:
1220                     ; 638         if ((RTC->CR1 & RTC_CR1_FMT) != RESET) {
1222  0239 c65148        	ld	a,20808
1223  023c a540          	bcp	a,#64
1224  023e 2700          	jreq	L325
1225                     ; 639             assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1227                     ; 640             assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1230  0240               L325:
1231                     ; 642             assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1233                     ; 644         assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1235                     ; 645         assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1237  0240               L125:
1238                     ; 650     RTC->WPR = 0xCA;
1240  0240 35ca5159      	mov	20825,#202
1241                     ; 651     RTC->WPR = 0x53;
1243  0244 35535159      	mov	20825,#83
1244                     ; 654     if (RTC_EnterInitMode() == ERROR) {
1246  0248 cd0166        	call	_RTC_EnterInitMode
1248  024b 4d            	tnz	a
1249  024c 2608          	jrne	L725
1250                     ; 655         status = ERROR;
1252  024e 0f01          	clr	(OFST+0,sp)
1253                     ; 657         RTC->WPR = 0xFF;
1255  0250 35ff5159      	mov	20825,#255
1257  0254 2073          	jra	L135
1258  0256               L725:
1259                     ; 660         if ((RTC->CR1 & RTC_CR1_FMT) != RESET) {
1261  0256 c65148        	ld	a,20808
1262  0259 a540          	bcp	a,#64
1263  025b 2708          	jreq	L335
1264                     ; 661             assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1266                     ; 662             temp = RTC_TimeStruct->RTC_H12;
1268  025d 1e05          	ldw	x,(OFST+4,sp)
1269  025f e603          	ld	a,(3,x)
1270  0261 6b01          	ld	(OFST+0,sp),a
1272  0263 2002          	jra	L535
1273  0265               L335:
1274                     ; 664             temp = 0;
1276  0265 0f01          	clr	(OFST+0,sp)
1277  0267               L535:
1278                     ; 667         if (RTC_Format != RTC_Format_BIN) {
1280  0267 0d02          	tnz	(OFST+1,sp)
1281  0269 2718          	jreq	L735
1282                     ; 668             RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1284  026b 1e05          	ldw	x,(OFST+4,sp)
1285  026d e602          	ld	a,(2,x)
1286  026f c75140        	ld	20800,a
1287                     ; 669             RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1289  0272 1e05          	ldw	x,(OFST+4,sp)
1290  0274 e601          	ld	a,(1,x)
1291  0276 c75141        	ld	20801,a
1292                     ; 670             RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1294  0279 1e05          	ldw	x,(OFST+4,sp)
1295  027b f6            	ld	a,(x)
1296  027c 1a01          	or	a,(OFST+0,sp)
1297  027e c75142        	ld	20802,a
1299  0281 201f          	jra	L145
1300  0283               L735:
1301                     ; 672             RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1303  0283 1e05          	ldw	x,(OFST+4,sp)
1304  0285 e602          	ld	a,(2,x)
1305  0287 cd0a07        	call	L3_ByteToBcd2
1307  028a c75140        	ld	20800,a
1308                     ; 673             RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1310  028d 1e05          	ldw	x,(OFST+4,sp)
1311  028f e601          	ld	a,(1,x)
1312  0291 cd0a07        	call	L3_ByteToBcd2
1314  0294 c75141        	ld	20801,a
1315                     ; 674             RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1317  0297 1e05          	ldw	x,(OFST+4,sp)
1318  0299 f6            	ld	a,(x)
1319  029a cd0a07        	call	L3_ByteToBcd2
1321  029d 1a01          	or	a,(OFST+0,sp)
1322  029f c75142        	ld	20802,a
1323  02a2               L145:
1324                     ; 677         (void)(RTC->DR3);
1326  02a2 c65146        	ld	a,20806
1327  02a5 97            	ld	xl,a
1328                     ; 680         RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1330  02a6 721f514c      	bres	20812,#7
1331                     ; 683         RTC->WPR = 0xFF;
1333  02aa 35ff5159      	mov	20825,#255
1334                     ; 686         if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET) {
1336  02ae c65148        	ld	a,20808
1337  02b1 a510          	bcp	a,#16
1338  02b3 2610          	jrne	L345
1339                     ; 687             if (RTC_WaitForSynchro() == ERROR) {
1341  02b5 cd01a9        	call	_RTC_WaitForSynchro
1343  02b8 4d            	tnz	a
1344  02b9 2604          	jrne	L545
1345                     ; 688                 status = ERROR;
1347  02bb 0f01          	clr	(OFST+0,sp)
1349  02bd 200a          	jra	L135
1350  02bf               L545:
1351                     ; 690                 status = SUCCESS;
1353  02bf a601          	ld	a,#1
1354  02c1 6b01          	ld	(OFST+0,sp),a
1355  02c3 2004          	jra	L135
1356  02c5               L345:
1357                     ; 693             status = SUCCESS;
1359  02c5 a601          	ld	a,#1
1360  02c7 6b01          	ld	(OFST+0,sp),a
1361  02c9               L135:
1362                     ; 697     return (ErrorStatus)status;
1364  02c9 7b01          	ld	a,(OFST+0,sp)
1367  02cb 85            	popw	x
1368  02cc 81            	ret
1405                     ; 709 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1405                     ; 710 {
1406                     	switch	.text
1407  02cd               _RTC_TimeStructInit:
1411                     ; 712     RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1413  02cd 6f03          	clr	(3,x)
1414                     ; 713     RTC_TimeStruct->RTC_Hours = 0;
1416  02cf 7f            	clr	(x)
1417                     ; 714     RTC_TimeStruct->RTC_Minutes = 0;
1419  02d0 6f01          	clr	(1,x)
1420                     ; 715     RTC_TimeStruct->RTC_Seconds = 0;
1422  02d2 6f02          	clr	(2,x)
1423                     ; 716 }
1426  02d4 81            	ret
1483                     ; 732 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1483                     ; 733                  RTC_TimeTypeDef* RTC_TimeStruct)
1483                     ; 734 {
1484                     	switch	.text
1485  02d5               _RTC_GetTime:
1487  02d5 88            	push	a
1488  02d6 88            	push	a
1489       00000001      OFST:	set	1
1492                     ; 735     uint8_t  tmpreg = 0;
1494  02d7 0f01          	clr	(OFST+0,sp)
1495                     ; 738     assert_param(IS_RTC_FORMAT(RTC_Format));
1497                     ; 742     RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1499  02d9 1e05          	ldw	x,(OFST+4,sp)
1500  02db c65140        	ld	a,20800
1501  02de e702          	ld	(2,x),a
1502                     ; 745     RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1504  02e0 1e05          	ldw	x,(OFST+4,sp)
1505  02e2 c65141        	ld	a,20801
1506  02e5 e701          	ld	(1,x),a
1507                     ; 748     tmpreg = (uint8_t)RTC->TR3;
1509  02e7 c65142        	ld	a,20802
1510  02ea 6b01          	ld	(OFST+0,sp),a
1511                     ; 751     (void) (RTC->DR3) ;
1513  02ec c65146        	ld	a,20806
1514  02ef 97            	ld	xl,a
1515                     ; 755     RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1517  02f0 7b01          	ld	a,(OFST+0,sp)
1518  02f2 a4bf          	and	a,#191
1519  02f4 1e05          	ldw	x,(OFST+4,sp)
1520  02f6 f7            	ld	(x),a
1521                     ; 758     RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1523  02f7 7b01          	ld	a,(OFST+0,sp)
1524  02f9 a440          	and	a,#64
1525  02fb 1e05          	ldw	x,(OFST+4,sp)
1526  02fd e703          	ld	(3,x),a
1527                     ; 761     if (RTC_Format == RTC_Format_BIN) {
1529  02ff 0d02          	tnz	(OFST+1,sp)
1530  0301 261f          	jrne	L326
1531                     ; 763         RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1533  0303 1e05          	ldw	x,(OFST+4,sp)
1534  0305 f6            	ld	a,(x)
1535  0306 cd0a26        	call	L5_Bcd2ToByte
1537  0309 1e05          	ldw	x,(OFST+4,sp)
1538  030b f7            	ld	(x),a
1539                     ; 764         RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1541  030c 1e05          	ldw	x,(OFST+4,sp)
1542  030e e601          	ld	a,(1,x)
1543  0310 cd0a26        	call	L5_Bcd2ToByte
1545  0313 1e05          	ldw	x,(OFST+4,sp)
1546  0315 e701          	ld	(1,x),a
1547                     ; 765         RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1549  0317 1e05          	ldw	x,(OFST+4,sp)
1550  0319 e602          	ld	a,(2,x)
1551  031b cd0a26        	call	L5_Bcd2ToByte
1553  031e 1e05          	ldw	x,(OFST+4,sp)
1554  0320 e702          	ld	(2,x),a
1555  0322               L326:
1556                     ; 767 }
1559  0322 85            	popw	x
1560  0323 81            	ret
1612                     ; 778 uint16_t RTC_GetSubSecond(void)
1612                     ; 779 {
1613                     	switch	.text
1614  0324               _RTC_GetSubSecond:
1616  0324 5206          	subw	sp,#6
1617       00000006      OFST:	set	6
1620                     ; 780     uint8_t ssrhreg = 0, ssrlreg = 0;
1622  0326 7b03          	ld	a,(OFST-3,sp)
1623  0328 97            	ld	xl,a
1626  0329 7b04          	ld	a,(OFST-2,sp)
1627  032b 97            	ld	xl,a
1628                     ; 781     uint16_t ssrreg = 0;
1630  032c 1e05          	ldw	x,(OFST-1,sp)
1631                     ; 784     ssrhreg = RTC->SSRH;
1633  032e c65157        	ld	a,20823
1634  0331 6b03          	ld	(OFST-3,sp),a
1635                     ; 785     ssrlreg = RTC->SSRL;
1637  0333 c65158        	ld	a,20824
1638  0336 6b04          	ld	(OFST-2,sp),a
1639                     ; 788     (void) (RTC->DR3);
1641  0338 c65146        	ld	a,20806
1642  033b 97            	ld	xl,a
1643                     ; 791     ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1645  033c 7b04          	ld	a,(OFST-2,sp)
1646  033e 5f            	clrw	x
1647  033f 97            	ld	xl,a
1648  0340 1f01          	ldw	(OFST-5,sp),x
1649  0342 7b03          	ld	a,(OFST-3,sp)
1650  0344 5f            	clrw	x
1651  0345 97            	ld	xl,a
1652  0346 4f            	clr	a
1653  0347 02            	rlwa	x,a
1654  0348 01            	rrwa	x,a
1655  0349 1a02          	or	a,(OFST-4,sp)
1656  034b 01            	rrwa	x,a
1657  034c 1a01          	or	a,(OFST-5,sp)
1658  034e 01            	rrwa	x,a
1659  034f 1f05          	ldw	(OFST-1,sp),x
1660                     ; 792     return (uint16_t)(ssrreg);
1662  0351 1e05          	ldw	x,(OFST-1,sp)
1665  0353 5b06          	addw	sp,#6
1666  0355 81            	ret
1918                     ; 809 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1918                     ; 810                         RTC_DateTypeDef* RTC_DateStruct)
1918                     ; 811 {
1919                     	switch	.text
1920  0356               _RTC_SetDate:
1922  0356 88            	push	a
1923  0357 89            	pushw	x
1924       00000002      OFST:	set	2
1927                     ; 812     ErrorStatus status = ERROR;
1929  0358 0f02          	clr	(OFST+0,sp)
1930                     ; 814     if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD)) {
1932  035a 4d            	tnz	a
1933  035b 2616          	jrne	L1001
1935  035d 1e06          	ldw	x,(OFST+4,sp)
1936  035f e601          	ld	a,(1,x)
1937  0361 a410          	and	a,#16
1938  0363 a110          	cp	a,#16
1939  0365 260c          	jrne	L1001
1940                     ; 815         RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1942  0367 1e06          	ldw	x,(OFST+4,sp)
1943  0369 e601          	ld	a,(1,x)
1944  036b a4ef          	and	a,#239
1945  036d ab0a          	add	a,#10
1946  036f 1e06          	ldw	x,(OFST+4,sp)
1947  0371 e701          	ld	(1,x),a
1948  0373               L1001:
1949                     ; 819     assert_param(IS_RTC_FORMAT(RTC_Format));
1951                     ; 820     if (RTC_Format == RTC_Format_BIN) {
1953  0373 0d03          	tnz	(OFST+1,sp)
1954  0375 2600          	jrne	L3001
1955                     ; 821         assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1957                     ; 822         assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1959                     ; 823         assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1961                     ; 824         assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1963                     ; 825         assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1966  0377               L3001:
1967                     ; 827         assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1969                     ; 828         assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1971                     ; 829         assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1973                     ; 830         assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1975                     ; 831         assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1977                     ; 833     assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1979                     ; 836     RTC->WPR = 0xCA;
1981  0377 35ca5159      	mov	20825,#202
1982                     ; 837     RTC->WPR = 0x53;
1984  037b 35535159      	mov	20825,#83
1985                     ; 840     if (RTC_EnterInitMode() == ERROR) {
1987  037f cd0166        	call	_RTC_EnterInitMode
1989  0382 4d            	tnz	a
1990  0383 2608          	jrne	L7001
1991                     ; 841         status = ERROR;
1993  0385 0f02          	clr	(OFST+0,sp)
1994                     ; 843         RTC->WPR = 0xFF;
1996  0387 35ff5159      	mov	20825,#255
1998  038b 2074          	jra	L1101
1999  038d               L7001:
2000                     ; 845         (void)(RTC->TR1);
2002  038d c65140        	ld	a,20800
2003  0390 97            	ld	xl,a
2004                     ; 848         if (RTC_Format != RTC_Format_BIN) {
2006  0391 0d03          	tnz	(OFST+1,sp)
2007  0393 271f          	jreq	L3101
2008                     ; 849             RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2010  0395 1e06          	ldw	x,(OFST+4,sp)
2011  0397 e602          	ld	a,(2,x)
2012  0399 c75144        	ld	20804,a
2013                     ; 850             RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2015  039c 1e06          	ldw	x,(OFST+4,sp)
2016  039e f6            	ld	a,(x)
2017  039f 97            	ld	xl,a
2018  03a0 a620          	ld	a,#32
2019  03a2 42            	mul	x,a
2020  03a3 9f            	ld	a,xl
2021  03a4 1e06          	ldw	x,(OFST+4,sp)
2022  03a6 ea01          	or	a,(1,x)
2023  03a8 c75145        	ld	20805,a
2024                     ; 851             RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2026  03ab 1e06          	ldw	x,(OFST+4,sp)
2027  03ad e603          	ld	a,(3,x)
2028  03af c75146        	ld	20806,a
2030  03b2 202a          	jra	L5101
2031  03b4               L3101:
2032                     ; 853             RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2034  03b4 1e06          	ldw	x,(OFST+4,sp)
2035  03b6 e602          	ld	a,(2,x)
2036  03b8 cd0a07        	call	L3_ByteToBcd2
2038  03bb c75144        	ld	20804,a
2039                     ; 854             RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2041  03be 1e06          	ldw	x,(OFST+4,sp)
2042  03c0 f6            	ld	a,(x)
2043  03c1 97            	ld	xl,a
2044  03c2 a620          	ld	a,#32
2045  03c4 42            	mul	x,a
2046  03c5 9f            	ld	a,xl
2047  03c6 6b01          	ld	(OFST-1,sp),a
2048  03c8 1e06          	ldw	x,(OFST+4,sp)
2049  03ca e601          	ld	a,(1,x)
2050  03cc cd0a07        	call	L3_ByteToBcd2
2052  03cf 1a01          	or	a,(OFST-1,sp)
2053  03d1 c75145        	ld	20805,a
2054                     ; 855             RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2056  03d4 1e06          	ldw	x,(OFST+4,sp)
2057  03d6 e603          	ld	a,(3,x)
2058  03d8 cd0a07        	call	L3_ByteToBcd2
2060  03db c75146        	ld	20806,a
2061  03de               L5101:
2062                     ; 859         RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2064  03de 721f514c      	bres	20812,#7
2065                     ; 862         RTC->WPR = 0xFF;
2067  03e2 35ff5159      	mov	20825,#255
2068                     ; 865         if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET) {
2070  03e6 c65148        	ld	a,20808
2071  03e9 a510          	bcp	a,#16
2072  03eb 2610          	jrne	L7101
2073                     ; 866             if (RTC_WaitForSynchro() == ERROR) {
2075  03ed cd01a9        	call	_RTC_WaitForSynchro
2077  03f0 4d            	tnz	a
2078  03f1 2604          	jrne	L1201
2079                     ; 867                 status = ERROR;
2081  03f3 0f02          	clr	(OFST+0,sp)
2083  03f5 200a          	jra	L1101
2084  03f7               L1201:
2085                     ; 869                 status = SUCCESS;
2087  03f7 a601          	ld	a,#1
2088  03f9 6b02          	ld	(OFST+0,sp),a
2089  03fb 2004          	jra	L1101
2090  03fd               L7101:
2091                     ; 872             status = SUCCESS;
2093  03fd a601          	ld	a,#1
2094  03ff 6b02          	ld	(OFST+0,sp),a
2095  0401               L1101:
2096                     ; 876     return (ErrorStatus)status;
2098  0401 7b02          	ld	a,(OFST+0,sp)
2101  0403 5b03          	addw	sp,#3
2102  0405 81            	ret
2139                     ; 885 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2139                     ; 886 {
2140                     	switch	.text
2141  0406               _RTC_DateStructInit:
2145                     ; 888     RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2147  0406 a601          	ld	a,#1
2148  0408 f7            	ld	(x),a
2149                     ; 889     RTC_DateStruct->RTC_Date = 1;
2151  0409 a601          	ld	a,#1
2152  040b e702          	ld	(2,x),a
2153                     ; 890     RTC_DateStruct->RTC_Month = RTC_Month_January;
2155  040d a601          	ld	a,#1
2156  040f e701          	ld	(1,x),a
2157                     ; 891     RTC_DateStruct->RTC_Year = 0;
2159  0411 6f03          	clr	(3,x)
2160                     ; 892 }
2163  0413 81            	ret
2220                     ; 905 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2220                     ; 906                  RTC_DateTypeDef* RTC_DateStruct)
2220                     ; 907 {
2221                     	switch	.text
2222  0414               _RTC_GetDate:
2224  0414 88            	push	a
2225  0415 88            	push	a
2226       00000001      OFST:	set	1
2229                     ; 908     uint8_t tmpreg = 0;
2231  0416 0f01          	clr	(OFST+0,sp)
2232                     ; 911     assert_param(IS_RTC_FORMAT(RTC_Format));
2234                     ; 914     (void) (RTC->TR1) ;
2236  0418 c65140        	ld	a,20800
2237  041b 97            	ld	xl,a
2238                     ; 915     RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2240  041c 1e05          	ldw	x,(OFST+4,sp)
2241  041e c65144        	ld	a,20804
2242  0421 e702          	ld	(2,x),a
2243                     ; 916     tmpreg = (uint8_t)RTC->DR2;
2245  0423 c65145        	ld	a,20805
2246  0426 6b01          	ld	(OFST+0,sp),a
2247                     ; 917     RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2249  0428 1e05          	ldw	x,(OFST+4,sp)
2250  042a c65146        	ld	a,20806
2251  042d e703          	ld	(3,x),a
2252                     ; 920     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2254  042f 7b01          	ld	a,(OFST+0,sp)
2255  0431 a41f          	and	a,#31
2256  0433 1e05          	ldw	x,(OFST+4,sp)
2257  0435 e701          	ld	(1,x),a
2258                     ; 921     RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2260  0437 7b01          	ld	a,(OFST+0,sp)
2261  0439 a4e0          	and	a,#224
2262  043b 4e            	swap	a
2263  043c 44            	srl	a
2264  043d a407          	and	a,#7
2265  043f 1e05          	ldw	x,(OFST+4,sp)
2266  0441 f7            	ld	(x),a
2267                     ; 924     if (RTC_Format == RTC_Format_BIN) {
2269  0442 0d02          	tnz	(OFST+1,sp)
2270  0444 2621          	jrne	L7701
2271                     ; 926         RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2273  0446 1e05          	ldw	x,(OFST+4,sp)
2274  0448 e603          	ld	a,(3,x)
2275  044a cd0a26        	call	L5_Bcd2ToByte
2277  044d 1e05          	ldw	x,(OFST+4,sp)
2278  044f e703          	ld	(3,x),a
2279                     ; 927         RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2281  0451 1e05          	ldw	x,(OFST+4,sp)
2282  0453 e601          	ld	a,(1,x)
2283  0455 cd0a26        	call	L5_Bcd2ToByte
2285  0458 1e05          	ldw	x,(OFST+4,sp)
2286  045a e701          	ld	(1,x),a
2287                     ; 928         RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2289  045c 1e05          	ldw	x,(OFST+4,sp)
2290  045e e602          	ld	a,(2,x)
2291  0460 cd0a26        	call	L5_Bcd2ToByte
2293  0463 1e05          	ldw	x,(OFST+4,sp)
2294  0465 e702          	ld	(2,x),a
2295  0467               L7701:
2296                     ; 930 }
2299  0467 85            	popw	x
2300  0468 81            	ret
2449                     ; 960 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2449                     ; 961                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2449                     ; 962 {
2450                     	switch	.text
2451  0469               _RTC_SetAlarm:
2453  0469 88            	push	a
2454  046a 5205          	subw	sp,#5
2455       00000005      OFST:	set	5
2458                     ; 963     uint8_t tmpreg1 = 0;
2460  046c 7b02          	ld	a,(OFST-3,sp)
2461  046e 97            	ld	xl,a
2462                     ; 964     uint8_t tmpreg2 = 0;
2464  046f 7b03          	ld	a,(OFST-2,sp)
2465  0471 97            	ld	xl,a
2466                     ; 965     uint8_t tmpreg3 = 0;
2468  0472 7b04          	ld	a,(OFST-1,sp)
2469  0474 97            	ld	xl,a
2470                     ; 966     uint8_t tmpreg4 = 0;
2472  0475 7b05          	ld	a,(OFST+0,sp)
2473  0477 97            	ld	xl,a
2474                     ; 969     assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2476                     ; 970     assert_param(IS_RTC_FORMAT(RTC_Format));
2478                     ; 971     assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2480                     ; 972     assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2482                     ; 975     if (RTC_Format == RTC_Format_BIN) {
2484  0478 0d06          	tnz	(OFST+1,sp)
2485  047a 2609          	jrne	L5711
2486                     ; 977         if ((RTC->CR1 & RTC_CR1_FMT) != RESET) {
2488  047c c65148        	ld	a,20808
2489  047f a540          	bcp	a,#64
2490  0481 2700          	jreq	L7711
2491                     ; 978             assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2493                     ; 979             assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2496  0483               L7711:
2497                     ; 981             assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2499                     ; 983         assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2501                     ; 984         assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2504  0483 2007          	jra	L3021
2505  0485               L5711:
2506                     ; 987         if ((RTC->CR1 & RTC_CR1_FMT) != RESET) {
2508  0485 c65148        	ld	a,20808
2509  0488 a540          	bcp	a,#64
2510  048a 2700          	jreq	L5021
2511                     ; 988             assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2513                     ; 989             assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2516  048c               L5021:
2517                     ; 991             assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2519                     ; 994         assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2521                     ; 996         assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2523  048c               L3021:
2524                     ; 1001     if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET ) {
2526  048c 1e09          	ldw	x,(OFST+4,sp)
2527  048e e604          	ld	a,(4,x)
2528  0490 a510          	bcp	a,#16
2529  0492 2608          	jrne	L1121
2530                     ; 1002         if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay) {
2532  0494 1e09          	ldw	x,(OFST+4,sp)
2533  0496 e605          	ld	a,(5,x)
2534  0498 a140          	cp	a,#64
2535  049a 2600          	jrne	L3121
2536                     ; 1003             assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2539  049c               L3121:
2540                     ; 1005             assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2542                     ; 1006             assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2544  049c               L1121:
2545                     ; 1011     RTC->WPR = 0xCA;
2547  049c 35ca5159      	mov	20825,#202
2548                     ; 1012     RTC->WPR = 0x53;
2550  04a0 35535159      	mov	20825,#83
2551                     ; 1016     if (RTC_Format != RTC_Format_BIN) {
2553  04a4 0d06          	tnz	(OFST+1,sp)
2554  04a6 2747          	jreq	L7121
2555                     ; 1017         tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2555                     ; 1018                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2557  04a8 1e09          	ldw	x,(OFST+4,sp)
2558  04aa e604          	ld	a,(4,x)
2559  04ac a480          	and	a,#128
2560  04ae 1e09          	ldw	x,(OFST+4,sp)
2561  04b0 ea02          	or	a,(2,x)
2562  04b2 6b02          	ld	(OFST-3,sp),a
2563                     ; 1020         tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2563                     ; 1021                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2565  04b4 1e09          	ldw	x,(OFST+4,sp)
2566  04b6 e604          	ld	a,(4,x)
2567  04b8 48            	sll	a
2568  04b9 a480          	and	a,#128
2569  04bb 1e09          	ldw	x,(OFST+4,sp)
2570  04bd ea01          	or	a,(1,x)
2571  04bf 6b03          	ld	(OFST-2,sp),a
2572                     ; 1023         tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2572                     ; 1024                                       (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2572                     ; 1025                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2574  04c1 1e09          	ldw	x,(OFST+4,sp)
2575  04c3 e604          	ld	a,(4,x)
2576  04c5 48            	sll	a
2577  04c6 48            	sll	a
2578  04c7 a480          	and	a,#128
2579  04c9 6b01          	ld	(OFST-4,sp),a
2580  04cb 1e09          	ldw	x,(OFST+4,sp)
2581  04cd e603          	ld	a,(3,x)
2582  04cf 1e09          	ldw	x,(OFST+4,sp)
2583  04d1 fa            	or	a,(x)
2584  04d2 1a01          	or	a,(OFST-4,sp)
2585  04d4 6b04          	ld	(OFST-1,sp),a
2586                     ; 1027         tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2586                     ; 1028                                       (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2586                     ; 1029                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2588  04d6 1e09          	ldw	x,(OFST+4,sp)
2589  04d8 e604          	ld	a,(4,x)
2590  04da 48            	sll	a
2591  04db 48            	sll	a
2592  04dc 48            	sll	a
2593  04dd a480          	and	a,#128
2594  04df 6b01          	ld	(OFST-4,sp),a
2595  04e1 1e09          	ldw	x,(OFST+4,sp)
2596  04e3 e605          	ld	a,(5,x)
2597  04e5 1e09          	ldw	x,(OFST+4,sp)
2598  04e7 ea06          	or	a,(6,x)
2599  04e9 1a01          	or	a,(OFST-4,sp)
2600  04eb 6b05          	ld	(OFST+0,sp),a
2602  04ed 2059          	jra	L1221
2603  04ef               L7121:
2604                     ; 1032         tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2604                     ; 1033                             (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2606  04ef 1e09          	ldw	x,(OFST+4,sp)
2607  04f1 e604          	ld	a,(4,x)
2608  04f3 a480          	and	a,#128
2609  04f5 6b01          	ld	(OFST-4,sp),a
2610  04f7 1e09          	ldw	x,(OFST+4,sp)
2611  04f9 e602          	ld	a,(2,x)
2612  04fb cd0a07        	call	L3_ByteToBcd2
2614  04fe 1a01          	or	a,(OFST-4,sp)
2615  0500 6b02          	ld	(OFST-3,sp),a
2616                     ; 1035         tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2616                     ; 1036                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2618  0502 1e09          	ldw	x,(OFST+4,sp)
2619  0504 e604          	ld	a,(4,x)
2620  0506 48            	sll	a
2621  0507 a480          	and	a,#128
2622  0509 6b01          	ld	(OFST-4,sp),a
2623  050b 1e09          	ldw	x,(OFST+4,sp)
2624  050d e601          	ld	a,(1,x)
2625  050f cd0a07        	call	L3_ByteToBcd2
2627  0512 1a01          	or	a,(OFST-4,sp)
2628  0514 6b03          	ld	(OFST-2,sp),a
2629                     ; 1038         tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2629                     ; 1039                                       (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2629                     ; 1040                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2631  0516 1e09          	ldw	x,(OFST+4,sp)
2632  0518 e604          	ld	a,(4,x)
2633  051a 48            	sll	a
2634  051b 48            	sll	a
2635  051c a480          	and	a,#128
2636  051e 6b01          	ld	(OFST-4,sp),a
2637  0520 1e09          	ldw	x,(OFST+4,sp)
2638  0522 f6            	ld	a,(x)
2639  0523 cd0a07        	call	L3_ByteToBcd2
2641  0526 1e09          	ldw	x,(OFST+4,sp)
2642  0528 ea03          	or	a,(3,x)
2643  052a 1a01          	or	a,(OFST-4,sp)
2644  052c 6b04          	ld	(OFST-1,sp),a
2645                     ; 1042         tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2645                     ; 1043                                       (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2645                     ; 1044                             (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2647  052e 1e09          	ldw	x,(OFST+4,sp)
2648  0530 e604          	ld	a,(4,x)
2649  0532 48            	sll	a
2650  0533 48            	sll	a
2651  0534 48            	sll	a
2652  0535 a480          	and	a,#128
2653  0537 6b01          	ld	(OFST-4,sp),a
2654  0539 1e09          	ldw	x,(OFST+4,sp)
2655  053b e606          	ld	a,(6,x)
2656  053d cd0a07        	call	L3_ByteToBcd2
2658  0540 1e09          	ldw	x,(OFST+4,sp)
2659  0542 ea05          	or	a,(5,x)
2660  0544 1a01          	or	a,(OFST-4,sp)
2661  0546 6b05          	ld	(OFST+0,sp),a
2662  0548               L1221:
2663                     ; 1048     RTC->ALRMAR1 = tmpreg1;
2665  0548 7b02          	ld	a,(OFST-3,sp)
2666  054a c7515c        	ld	20828,a
2667                     ; 1049     RTC->ALRMAR2 = tmpreg2;
2669  054d 7b03          	ld	a,(OFST-2,sp)
2670  054f c7515d        	ld	20829,a
2671                     ; 1050     RTC->ALRMAR3 = tmpreg3;
2673  0552 7b04          	ld	a,(OFST-1,sp)
2674  0554 c7515e        	ld	20830,a
2675                     ; 1051     RTC->ALRMAR4 = tmpreg4;
2677  0557 7b05          	ld	a,(OFST+0,sp)
2678  0559 c7515f        	ld	20831,a
2679                     ; 1054     RTC->WPR = 0xFF;
2681  055c 35ff5159      	mov	20825,#255
2682                     ; 1055 }
2685  0560 5b06          	addw	sp,#6
2686  0562 81            	ret
2724                     ; 1065 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2724                     ; 1066 {
2725                     	switch	.text
2726  0563               _RTC_AlarmStructInit:
2730                     ; 1068     RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2732  0563 6f03          	clr	(3,x)
2733                     ; 1069     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2735  0565 7f            	clr	(x)
2736                     ; 1070     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2738  0566 6f01          	clr	(1,x)
2739                     ; 1071     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2741  0568 6f02          	clr	(2,x)
2742                     ; 1074     RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2744  056a 6f05          	clr	(5,x)
2745                     ; 1075     RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2747  056c a601          	ld	a,#1
2748  056e e706          	ld	(6,x),a
2749                     ; 1078     RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2751  0570 a6f0          	ld	a,#240
2752  0572 e704          	ld	(4,x),a
2753                     ; 1079 }
2756  0574 81            	ret
2849                     ; 1088 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2849                     ; 1089                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2849                     ; 1090 {
2850                     	switch	.text
2851  0575               _RTC_GetAlarm:
2853  0575 88            	push	a
2854  0576 5204          	subw	sp,#4
2855       00000004      OFST:	set	4
2858                     ; 1091     uint8_t tmpreg1 = 0;
2860  0578 7b04          	ld	a,(OFST+0,sp)
2861  057a 97            	ld	xl,a
2862                     ; 1092     uint8_t tmpreg2 = 0;
2864  057b 7b01          	ld	a,(OFST-3,sp)
2865  057d 97            	ld	xl,a
2866                     ; 1093     uint8_t tmpreg3 = 0;
2868  057e 7b02          	ld	a,(OFST-2,sp)
2869  0580 97            	ld	xl,a
2870                     ; 1094     uint8_t tmpreg4 = 0;
2872  0581 7b03          	ld	a,(OFST-1,sp)
2873  0583 97            	ld	xl,a
2874                     ; 1095     uint8_t alarmmask = 0;
2876  0584 7b04          	ld	a,(OFST+0,sp)
2877  0586 97            	ld	xl,a
2878                     ; 1098     assert_param(IS_RTC_FORMAT(RTC_Format));
2880                     ; 1101     tmpreg1 = (uint8_t)RTC->ALRMAR1;
2882  0587 c6515c        	ld	a,20828
2883  058a 6b04          	ld	(OFST+0,sp),a
2884                     ; 1102     tmpreg2 = (uint8_t)RTC->ALRMAR2;
2886  058c c6515d        	ld	a,20829
2887  058f 6b01          	ld	(OFST-3,sp),a
2888                     ; 1103     tmpreg3 = (uint8_t)RTC->ALRMAR3;
2890  0591 c6515e        	ld	a,20830
2891  0594 6b02          	ld	(OFST-2,sp),a
2892                     ; 1104     tmpreg4 = (uint8_t)RTC->ALRMAR4;
2894  0596 c6515f        	ld	a,20831
2895  0599 6b03          	ld	(OFST-1,sp),a
2896                     ; 1107     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2898  059b 7b04          	ld	a,(OFST+0,sp)
2899  059d a47f          	and	a,#127
2900  059f 1e08          	ldw	x,(OFST+4,sp)
2901  05a1 e702          	ld	(2,x),a
2902                     ; 1108     alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2904  05a3 7b04          	ld	a,(OFST+0,sp)
2905  05a5 a480          	and	a,#128
2906  05a7 6b04          	ld	(OFST+0,sp),a
2907                     ; 1111     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2909  05a9 7b01          	ld	a,(OFST-3,sp)
2910  05ab a47f          	and	a,#127
2911  05ad 1e08          	ldw	x,(OFST+4,sp)
2912  05af e701          	ld	(1,x),a
2913                     ; 1112     alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2915  05b1 7b01          	ld	a,(OFST-3,sp)
2916  05b3 a480          	and	a,#128
2917  05b5 44            	srl	a
2918  05b6 1a04          	or	a,(OFST+0,sp)
2919  05b8 6b04          	ld	(OFST+0,sp),a
2920                     ; 1115     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2922  05ba 7b02          	ld	a,(OFST-2,sp)
2923  05bc a43f          	and	a,#63
2924  05be 1e08          	ldw	x,(OFST+4,sp)
2925  05c0 f7            	ld	(x),a
2926                     ; 1116     RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2928  05c1 7b02          	ld	a,(OFST-2,sp)
2929  05c3 a440          	and	a,#64
2930  05c5 1e08          	ldw	x,(OFST+4,sp)
2931  05c7 e703          	ld	(3,x),a
2932                     ; 1117     alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2934  05c9 7b02          	ld	a,(OFST-2,sp)
2935  05cb a480          	and	a,#128
2936  05cd 44            	srl	a
2937  05ce 44            	srl	a
2938  05cf 1a04          	or	a,(OFST+0,sp)
2939  05d1 6b04          	ld	(OFST+0,sp),a
2940                     ; 1120     RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2942  05d3 7b03          	ld	a,(OFST-1,sp)
2943  05d5 a43f          	and	a,#63
2944  05d7 1e08          	ldw	x,(OFST+4,sp)
2945  05d9 e706          	ld	(6,x),a
2946                     ; 1121     RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2948  05db 7b03          	ld	a,(OFST-1,sp)
2949  05dd a440          	and	a,#64
2950  05df 1e08          	ldw	x,(OFST+4,sp)
2951  05e1 e705          	ld	(5,x),a
2952                     ; 1122     alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2954  05e3 7b03          	ld	a,(OFST-1,sp)
2955  05e5 a480          	and	a,#128
2956  05e7 44            	srl	a
2957  05e8 44            	srl	a
2958  05e9 44            	srl	a
2959  05ea 1a04          	or	a,(OFST+0,sp)
2960  05ec 6b04          	ld	(OFST+0,sp),a
2961                     ; 1124     RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2963  05ee 7b04          	ld	a,(OFST+0,sp)
2964  05f0 1e08          	ldw	x,(OFST+4,sp)
2965  05f2 e704          	ld	(4,x),a
2966                     ; 1126     if (RTC_Format == RTC_Format_BIN) {
2968  05f4 0d05          	tnz	(OFST+1,sp)
2969  05f6 262a          	jrne	L3131
2970                     ; 1127         RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2972  05f8 1e08          	ldw	x,(OFST+4,sp)
2973  05fa f6            	ld	a,(x)
2974  05fb cd0a26        	call	L5_Bcd2ToByte
2976  05fe 1e08          	ldw	x,(OFST+4,sp)
2977  0600 f7            	ld	(x),a
2978                     ; 1128         RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2980  0601 1e08          	ldw	x,(OFST+4,sp)
2981  0603 e601          	ld	a,(1,x)
2982  0605 cd0a26        	call	L5_Bcd2ToByte
2984  0608 1e08          	ldw	x,(OFST+4,sp)
2985  060a e701          	ld	(1,x),a
2986                     ; 1129         RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2988  060c 1e08          	ldw	x,(OFST+4,sp)
2989  060e e602          	ld	a,(2,x)
2990  0610 cd0a26        	call	L5_Bcd2ToByte
2992  0613 1e08          	ldw	x,(OFST+4,sp)
2993  0615 e702          	ld	(2,x),a
2994                     ; 1130         RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2996  0617 1e08          	ldw	x,(OFST+4,sp)
2997  0619 e606          	ld	a,(6,x)
2998  061b cd0a26        	call	L5_Bcd2ToByte
3000  061e 1e08          	ldw	x,(OFST+4,sp)
3001  0620 e706          	ld	(6,x),a
3002  0622               L3131:
3003                     ; 1132 }
3006  0622 5b05          	addw	sp,#5
3007  0624 81            	ret
3071                     ; 1141 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3071                     ; 1142 {
3072                     	switch	.text
3073  0625               _RTC_AlarmCmd:
3075  0625 88            	push	a
3076  0626 5203          	subw	sp,#3
3077       00000003      OFST:	set	3
3080                     ; 1143     __IO uint16_t alrawfcount = 0;
3082  0628 5f            	clrw	x
3083  0629 1f01          	ldw	(OFST-2,sp),x
3084                     ; 1144     ErrorStatus status = ERROR;
3086  062b 7b03          	ld	a,(OFST+0,sp)
3087  062d 97            	ld	xl,a
3088                     ; 1145     uint8_t temp1 = 0;
3090  062e 7b03          	ld	a,(OFST+0,sp)
3091  0630 97            	ld	xl,a
3092                     ; 1148     assert_param(IS_FUNCTIONAL_STATE(NewState));
3094                     ; 1151     RTC->WPR = 0xCA;
3096  0631 35ca5159      	mov	20825,#202
3097                     ; 1152     RTC->WPR = 0x53;
3099  0635 35535159      	mov	20825,#83
3100                     ; 1155     if (NewState != DISABLE) {
3102  0639 0d04          	tnz	(OFST+1,sp)
3103  063b 2711          	jreq	L7431
3104                     ; 1157         RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3106  063d 72105149      	bset	20809,#0
3107                     ; 1158         status = SUCCESS;
3109  0641 a601          	ld	a,#1
3110  0643 6b03          	ld	(OFST+0,sp),a
3112  0645               L1531:
3113                     ; 1177     RTC->WPR = 0xFF;
3115  0645 35ff5159      	mov	20825,#255
3116                     ; 1180     return (ErrorStatus)status;
3118  0649 7b03          	ld	a,(OFST+0,sp)
3121  064b 5b04          	addw	sp,#4
3122  064d 81            	ret
3123  064e               L7431:
3124                     ; 1161         RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3126  064e 72115149      	bres	20809,#0
3127                     ; 1164         temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3129  0652 c6514c        	ld	a,20812
3130  0655 a401          	and	a,#1
3131  0657 6b03          	ld	(OFST+0,sp),a
3133  0659 2007          	jra	L7531
3134  065b               L3531:
3135                     ; 1166             alrawfcount++;
3137  065b 1e01          	ldw	x,(OFST-2,sp)
3138  065d 1c0001        	addw	x,#1
3139  0660 1f01          	ldw	(OFST-2,sp),x
3140  0662               L7531:
3141                     ; 1165         while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET)) {
3143  0662 1e01          	ldw	x,(OFST-2,sp)
3144  0664 a3ffff        	cpw	x,#65535
3145  0667 2704          	jreq	L3631
3147  0669 0d03          	tnz	(OFST+0,sp)
3148  066b 27ee          	jreq	L3531
3149  066d               L3631:
3150                     ; 1169         if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET) {
3152  066d c6514c        	ld	a,20812
3153  0670 a501          	bcp	a,#1
3154  0672 2604          	jrne	L5631
3155                     ; 1170             status = ERROR;
3157  0674 0f03          	clr	(OFST+0,sp)
3159  0676 20cd          	jra	L1531
3160  0678               L5631:
3161                     ; 1172             status = SUCCESS;
3163  0678 a601          	ld	a,#1
3164  067a 6b03          	ld	(OFST+0,sp),a
3165  067c 20c7          	jra	L1531
3366                     ; 1192 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3366                     ; 1193                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3366                     ; 1194 {
3367                     	switch	.text
3368  067e               _RTC_AlarmSubSecondConfig:
3370  067e 89            	pushw	x
3371  067f 88            	push	a
3372       00000001      OFST:	set	1
3375                     ; 1195     uint8_t alarmstatus = 0;
3377  0680 7b01          	ld	a,(OFST+0,sp)
3378  0682 97            	ld	xl,a
3379                     ; 1196     ErrorStatus status = ERROR;
3381  0683 7b01          	ld	a,(OFST+0,sp)
3382  0685 97            	ld	xl,a
3383                     ; 1199     assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3385                     ; 1200     assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3387                     ; 1203     RTC->WPR = 0xCA;
3389  0686 35ca5159      	mov	20825,#202
3390                     ; 1204     RTC->WPR = 0x53;
3392  068a 35535159      	mov	20825,#83
3393                     ; 1207     if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET) {
3395  068e c6514c        	ld	a,20812
3396  0691 a540          	bcp	a,#64
3397  0693 2628          	jrne	L7641
3398                     ; 1209         alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3400  0695 c65149        	ld	a,20809
3401  0698 aa01          	or	a,#1
3402  069a 6b01          	ld	(OFST+0,sp),a
3403                     ; 1212         RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3405  069c 72115149      	bres	20809,#0
3406                     ; 1215         RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3408  06a0 7b02          	ld	a,(OFST+1,sp)
3409  06a2 c75164        	ld	20836,a
3410                     ; 1216         RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3412  06a5 7b03          	ld	a,(OFST+2,sp)
3413  06a7 c75165        	ld	20837,a
3414                     ; 1217         RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3416  06aa 7b06          	ld	a,(OFST+5,sp)
3417  06ac c75166        	ld	20838,a
3418                     ; 1220         RTC->CR2 |= alarmstatus;
3420  06af c65149        	ld	a,20809
3421  06b2 1a01          	or	a,(OFST+0,sp)
3422  06b4 c75149        	ld	20809,a
3423                     ; 1222         status = SUCCESS;
3425  06b7 a601          	ld	a,#1
3426  06b9 6b01          	ld	(OFST+0,sp),a
3428  06bb 2002          	jra	L1741
3429  06bd               L7641:
3430                     ; 1224         status = ERROR;
3432  06bd 0f01          	clr	(OFST+0,sp)
3433  06bf               L1741:
3434                     ; 1228     RTC->WPR = 0xFF;
3436  06bf 35ff5159      	mov	20825,#255
3437                     ; 1230     return (ErrorStatus)status;
3439  06c3 7b01          	ld	a,(OFST+0,sp)
3442  06c5 5b03          	addw	sp,#3
3443  06c7 81            	ret
3533                     ; 1260 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3533                     ; 1261 {
3534                     	switch	.text
3535  06c8               _RTC_WakeUpClockConfig:
3537  06c8 88            	push	a
3538       00000000      OFST:	set	0
3541                     ; 1264     assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3543                     ; 1267     RTC->WPR = 0xCA;
3545  06c9 35ca5159      	mov	20825,#202
3546                     ; 1268     RTC->WPR = 0x53;
3548  06cd 35535159      	mov	20825,#83
3549                     ; 1271     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3551  06d1 72155149      	bres	20809,#2
3552                     ; 1274     RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3554  06d5 c65148        	ld	a,20808
3555  06d8 a4f8          	and	a,#248
3556  06da c75148        	ld	20808,a
3557                     ; 1277     RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3559  06dd c65148        	ld	a,20808
3560  06e0 1a01          	or	a,(OFST+1,sp)
3561  06e2 c75148        	ld	20808,a
3562                     ; 1280     RTC->WPR = 0xFF;
3564  06e5 35ff5159      	mov	20825,#255
3565                     ; 1281 }
3568  06e9 84            	pop	a
3569  06ea 81            	ret
3604                     ; 1291 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3604                     ; 1292 {
3605                     	switch	.text
3606  06eb               _RTC_SetWakeUpCounter:
3610                     ; 1294     RTC->WPR = 0xCA;
3612  06eb 35ca5159      	mov	20825,#202
3613                     ; 1295     RTC->WPR = 0x53;
3615  06ef 35535159      	mov	20825,#83
3616                     ; 1299     RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3618  06f3 9e            	ld	a,xh
3619  06f4 c75154        	ld	20820,a
3620                     ; 1300     RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3622  06f7 9f            	ld	a,xl
3623  06f8 c75155        	ld	20821,a
3624                     ; 1303     RTC->WPR = 0xFF;
3626  06fb 35ff5159      	mov	20825,#255
3627                     ; 1304 }
3630  06ff 81            	ret
3665                     ; 1311 uint16_t RTC_GetWakeUpCounter(void)
3665                     ; 1312 {
3666                     	switch	.text
3667  0700               _RTC_GetWakeUpCounter:
3669  0700 89            	pushw	x
3670       00000002      OFST:	set	2
3673                     ; 1313     uint16_t tmpreg = 0;
3675  0701 5f            	clrw	x
3676  0702 1f01          	ldw	(OFST-1,sp),x
3677                     ; 1316     tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3679  0704 c65154        	ld	a,20820
3680  0707 5f            	clrw	x
3681  0708 97            	ld	xl,a
3682  0709 4f            	clr	a
3683  070a 02            	rlwa	x,a
3684  070b 1f01          	ldw	(OFST-1,sp),x
3685                     ; 1317     tmpreg |= RTC->WUTRL;
3687  070d c65155        	ld	a,20821
3688  0710 5f            	clrw	x
3689  0711 97            	ld	xl,a
3690  0712 01            	rrwa	x,a
3691  0713 1a02          	or	a,(OFST+0,sp)
3692  0715 01            	rrwa	x,a
3693  0716 1a01          	or	a,(OFST-1,sp)
3694  0718 01            	rrwa	x,a
3695  0719 1f01          	ldw	(OFST-1,sp),x
3696                     ; 1320     return (uint16_t)tmpreg;
3698  071b 1e01          	ldw	x,(OFST-1,sp)
3701  071d 5b02          	addw	sp,#2
3702  071f 81            	ret
3757                     ; 1331 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3757                     ; 1332 {
3758                     	switch	.text
3759  0720               _RTC_WakeUpCmd:
3761  0720 88            	push	a
3762  0721 5203          	subw	sp,#3
3763       00000003      OFST:	set	3
3766                     ; 1333     ErrorStatus status = ERROR;
3768  0723 7b01          	ld	a,(OFST-2,sp)
3769  0725 97            	ld	xl,a
3770                     ; 1334     uint16_t wutwfcount = 0;
3772  0726 5f            	clrw	x
3773  0727 1f02          	ldw	(OFST-1,sp),x
3774                     ; 1337     assert_param(IS_FUNCTIONAL_STATE(NewState));
3776                     ; 1340     RTC->WPR = 0xCA;
3778  0729 35ca5159      	mov	20825,#202
3779                     ; 1341     RTC->WPR = 0x53;
3781  072d 35535159      	mov	20825,#83
3782                     ; 1343     if (NewState != DISABLE) {
3784  0731 0d04          	tnz	(OFST+1,sp)
3785  0733 2711          	jreq	L3161
3786                     ; 1345         RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3788  0735 72145149      	bset	20809,#2
3789                     ; 1347         status = SUCCESS;
3791  0739 a601          	ld	a,#1
3792  073b 6b01          	ld	(OFST-2,sp),a
3794  073d               L5161:
3795                     ; 1366     RTC->WPR = 0xFF;
3797  073d 35ff5159      	mov	20825,#255
3798                     ; 1369     return (ErrorStatus)status;
3800  0741 7b01          	ld	a,(OFST-2,sp)
3803  0743 5b04          	addw	sp,#4
3804  0745 81            	ret
3805  0746               L3161:
3806                     ; 1350         RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3808  0746 72155149      	bres	20809,#2
3810  074a 2007          	jra	L1261
3811  074c               L7161:
3812                     ; 1354             wutwfcount++;
3814  074c 1e02          	ldw	x,(OFST-1,sp)
3815  074e 1c0001        	addw	x,#1
3816  0751 1f02          	ldw	(OFST-1,sp),x
3817  0753               L1261:
3818                     ; 1353         while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT)) {
3820  0753 c6514c        	ld	a,20812
3821  0756 a504          	bcp	a,#4
3822  0758 2607          	jrne	L5261
3824  075a 1e02          	ldw	x,(OFST-1,sp)
3825  075c a3ffff        	cpw	x,#65535
3826  075f 26eb          	jrne	L7161
3827  0761               L5261:
3828                     ; 1358         if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) {
3830  0761 c6514c        	ld	a,20812
3831  0764 a504          	bcp	a,#4
3832  0766 2604          	jrne	L7261
3833                     ; 1359             status = ERROR;
3835  0768 0f01          	clr	(OFST-2,sp)
3837  076a 20d1          	jra	L5161
3838  076c               L7261:
3839                     ; 1361             status = SUCCESS;
3841  076c a601          	ld	a,#1
3842  076e 6b01          	ld	(OFST-2,sp),a
3843  0770 20cb          	jra	L5161
3933                     ; 1406 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3933                     ; 1407                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3933                     ; 1408 {
3934                     	switch	.text
3935  0772               _RTC_DayLightSavingConfig:
3937  0772 89            	pushw	x
3938       00000000      OFST:	set	0
3941                     ; 1410     assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3943                     ; 1411     assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3945                     ; 1414     RTC->WPR = 0xCA;
3947  0773 35ca5159      	mov	20825,#202
3948                     ; 1415     RTC->WPR = 0x53;
3950  0777 35535159      	mov	20825,#83
3951                     ; 1418     RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3953  077b 7215514a      	bres	20810,#2
3954                     ; 1421     RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3956  077f 9f            	ld	a,xl
3957  0780 1a01          	or	a,(OFST+1,sp)
3958  0782 ca514a        	or	a,20810
3959  0785 c7514a        	ld	20810,a
3960                     ; 1424     RTC->WPR = 0xFF;
3962  0788 35ff5159      	mov	20825,#255
3963                     ; 1425 }
3966  078c 85            	popw	x
3967  078d 81            	ret
3992                     ; 1433 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3992                     ; 1434 {
3993                     	switch	.text
3994  078e               _RTC_GetStoreOperation:
3998                     ; 1436     return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4000  078e c6514a        	ld	a,20810
4001  0791 a404          	and	a,#4
4004  0793 81            	ret
4098                     ; 1471 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4098                     ; 1472                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4098                     ; 1473 {
4099                     	switch	.text
4100  0794               _RTC_OutputConfig:
4102  0794 89            	pushw	x
4103       00000000      OFST:	set	0
4106                     ; 1475     assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4108                     ; 1476     assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4110                     ; 1479     RTC->WPR = 0xCA;
4112  0795 35ca5159      	mov	20825,#202
4113                     ; 1480     RTC->WPR = 0x53;
4115  0799 35535159      	mov	20825,#83
4116                     ; 1483     RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4118  079d c6514a        	ld	a,20810
4119  07a0 a48f          	and	a,#143
4120  07a2 c7514a        	ld	20810,a
4121                     ; 1486     RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4123  07a5 9f            	ld	a,xl
4124  07a6 1a01          	or	a,(OFST+1,sp)
4125  07a8 ca514a        	or	a,20810
4126  07ab c7514a        	ld	20810,a
4127                     ; 1489     RTC->WPR = 0xFF;
4129  07ae 35ff5159      	mov	20825,#255
4130                     ; 1490 }
4133  07b2 85            	popw	x
4134  07b3 81            	ret
4229                     ; 1523 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4229                     ; 1524                                    uint16_t RTC_ShiftSubFS)
4229                     ; 1525 {
4230                     	switch	.text
4231  07b4               _RTC_SynchroShiftConfig:
4233  07b4 88            	push	a
4234  07b5 5203          	subw	sp,#3
4235       00000003      OFST:	set	3
4238                     ; 1526     uint8_t shiftrhreg = 0;
4240  07b7 7b01          	ld	a,(OFST-2,sp)
4241  07b9 97            	ld	xl,a
4242                     ; 1527     ErrorStatus status = ERROR;
4244  07ba 7b01          	ld	a,(OFST-2,sp)
4245  07bc 97            	ld	xl,a
4246                     ; 1528     uint16_t shpfcount = 0;
4248  07bd 5f            	clrw	x
4249  07be 1f02          	ldw	(OFST-1,sp),x
4250                     ; 1531     assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4252                     ; 1532     assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4254                     ; 1535     RTC->WPR = 0xCA;
4256  07c0 35ca5159      	mov	20825,#202
4257                     ; 1536     RTC->WPR = 0x53;
4259  07c4 35535159      	mov	20825,#83
4260                     ; 1539     if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) {
4262  07c8 c6514c        	ld	a,20812
4263  07cb a508          	bcp	a,#8
4264  07cd 2717          	jreq	L7102
4266  07cf 2007          	jra	L3202
4267  07d1               L1202:
4268                     ; 1542             shpfcount++;
4270  07d1 1e02          	ldw	x,(OFST-1,sp)
4271  07d3 1c0001        	addw	x,#1
4272  07d6 1f02          	ldw	(OFST-1,sp),x
4273  07d8               L3202:
4274                     ; 1541         while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT)) {
4276  07d8 c6514c        	ld	a,20812
4277  07db a508          	bcp	a,#8
4278  07dd 2707          	jreq	L7102
4280  07df 1e02          	ldw	x,(OFST-1,sp)
4281  07e1 a3ffff        	cpw	x,#65535
4282  07e4 26eb          	jrne	L1202
4283  07e6               L7102:
4284                     ; 1547     if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET) {
4286  07e6 c6514c        	ld	a,20812
4287  07e9 a508          	bcp	a,#8
4288  07eb 2616          	jrne	L1302
4289                     ; 1549         shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4291  07ed 7b07          	ld	a,(OFST+4,sp)
4292  07ef 1a04          	or	a,(OFST+1,sp)
4293  07f1 6b01          	ld	(OFST-2,sp),a
4294                     ; 1550         RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4296  07f3 7b01          	ld	a,(OFST-2,sp)
4297  07f5 c7515a        	ld	20826,a
4298                     ; 1551         RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4300  07f8 7b08          	ld	a,(OFST+5,sp)
4301  07fa c7515b        	ld	20827,a
4302                     ; 1553         status = SUCCESS;
4304  07fd a601          	ld	a,#1
4305  07ff 6b01          	ld	(OFST-2,sp),a
4307  0801 2002          	jra	L3302
4308  0803               L1302:
4309                     ; 1555         status = ERROR;
4311  0803 0f01          	clr	(OFST-2,sp)
4312  0805               L3302:
4313                     ; 1559     RTC->WPR = 0xFF;
4315  0805 35ff5159      	mov	20825,#255
4316                     ; 1561     return (ErrorStatus)(status);
4318  0809 7b01          	ld	a,(OFST-2,sp)
4321  080b 5b04          	addw	sp,#4
4322  080d 81            	ret
4452                     ; 1597 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4452                     ; 1598                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4452                     ; 1599                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4452                     ; 1600 {
4453                     	switch	.text
4454  080e               _RTC_SmoothCalibConfig:
4456  080e 89            	pushw	x
4457  080f 5203          	subw	sp,#3
4458       00000003      OFST:	set	3
4461                     ; 1601     ErrorStatus status = ERROR;
4463  0811 7b01          	ld	a,(OFST-2,sp)
4464  0813 97            	ld	xl,a
4465                     ; 1602     uint16_t recalpfcount = 0;
4467  0814 5f            	clrw	x
4468  0815 1f02          	ldw	(OFST-1,sp),x
4469                     ; 1605     assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4471                     ; 1606     assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4473                     ; 1607     assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4475                     ; 1610     RTC->WPR = 0xCA;
4477  0817 35ca5159      	mov	20825,#202
4478                     ; 1611     RTC->WPR = 0x53;
4480  081b 35535159      	mov	20825,#83
4481                     ; 1614     if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) {
4483  081f c6514c        	ld	a,20812
4484  0822 a502          	bcp	a,#2
4485  0824 2717          	jreq	L5112
4487  0826 2007          	jra	L1212
4488  0828               L7112:
4489                     ; 1617             recalpfcount++;
4491  0828 1e02          	ldw	x,(OFST-1,sp)
4492  082a 1c0001        	addw	x,#1
4493  082d 1f02          	ldw	(OFST-1,sp),x
4494  082f               L1212:
4495                     ; 1616         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT)) {
4497  082f c6514c        	ld	a,20812
4498  0832 a502          	bcp	a,#2
4499  0834 2707          	jreq	L5112
4501  0836 1e02          	ldw	x,(OFST-1,sp)
4502  0838 a3ffff        	cpw	x,#65535
4503  083b 26eb          	jrne	L7112
4504  083d               L5112:
4505                     ; 1623     if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET) {
4507  083d c6514c        	ld	a,20812
4508  0840 a502          	bcp	a,#2
4509  0842 2614          	jrne	L7212
4510                     ; 1625         RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4510                     ; 1626                                          (uint8_t)RTC_SmoothCalibPlusPulses) | \
4510                     ; 1627                                (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4512  0844 7b04          	ld	a,(OFST+1,sp)
4513  0846 1a05          	or	a,(OFST+2,sp)
4514  0848 1a08          	or	a,(OFST+5,sp)
4515  084a c7516a        	ld	20842,a
4516                     ; 1628         RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4518  084d 7b09          	ld	a,(OFST+6,sp)
4519  084f c7516b        	ld	20843,a
4520                     ; 1630         status = SUCCESS;
4522  0852 a601          	ld	a,#1
4523  0854 6b01          	ld	(OFST-2,sp),a
4525  0856 2002          	jra	L1312
4526  0858               L7212:
4527                     ; 1632         status = ERROR;
4529  0858 0f01          	clr	(OFST-2,sp)
4530  085a               L1312:
4531                     ; 1636     RTC->WPR = 0xFF;
4533  085a 35ff5159      	mov	20825,#255
4534                     ; 1638     return (ErrorStatus)(status);
4536  085e 7b01          	ld	a,(OFST-2,sp)
4539  0860 5b05          	addw	sp,#5
4540  0862 81            	ret
4598                     ; 1664 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4598                     ; 1665 {
4599                     	switch	.text
4600  0863               _RTC_CalibOutputConfig:
4604                     ; 1667     assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4606                     ; 1670     RTC->WPR = 0xCA;
4608  0863 35ca5159      	mov	20825,#202
4609                     ; 1671     RTC->WPR = 0x53;
4611  0867 35535159      	mov	20825,#83
4612                     ; 1673     if (RTC_CalibOutput != RTC_CalibOutput_512Hz) {
4614  086b 4d            	tnz	a
4615  086c 2706          	jreq	L1612
4616                     ; 1675         RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4618  086e 7216514a      	bset	20810,#3
4620  0872 2004          	jra	L3612
4621  0874               L1612:
4622                     ; 1678         RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4624  0874 7217514a      	bres	20810,#3
4625  0878               L3612:
4626                     ; 1682     RTC->WPR = 0xFF;
4628  0878 35ff5159      	mov	20825,#255
4629                     ; 1683 }
4632  087c 81            	ret
4667                     ; 1691 void RTC_CalibOutputCmd(FunctionalState NewState)
4667                     ; 1692 {
4668                     	switch	.text
4669  087d               _RTC_CalibOutputCmd:
4673                     ; 1694     assert_param(IS_FUNCTIONAL_STATE(NewState));
4675                     ; 1697     RTC->WPR = 0xCA;
4677  087d 35ca5159      	mov	20825,#202
4678                     ; 1698     RTC->WPR = 0x53;
4680  0881 35535159      	mov	20825,#83
4681                     ; 1700     if (NewState != DISABLE) {
4683  0885 4d            	tnz	a
4684  0886 2706          	jreq	L3022
4685                     ; 1702         RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4687  0888 721e514a      	bset	20810,#7
4689  088c 2004          	jra	L5022
4690  088e               L3022:
4691                     ; 1705         RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4693  088e 721f514a      	bres	20810,#7
4694  0892               L5022:
4695                     ; 1709     RTC->WPR = 0xFF;
4697  0892 35ff5159      	mov	20825,#255
4698                     ; 1710 }
4701  0896 81            	ret
4796                     ; 1739 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4796                     ; 1740                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4796                     ; 1741 {
4797                     	switch	.text
4798  0897               _RTC_TamperLevelConfig:
4800  0897 89            	pushw	x
4801       00000000      OFST:	set	0
4804                     ; 1743     assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4806                     ; 1744     assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4808                     ; 1747     RTC->WPR = 0xCA;
4810  0898 35ca5159      	mov	20825,#202
4811                     ; 1748     RTC->WPR = 0x53;
4813  089c 35535159      	mov	20825,#83
4814                     ; 1750     if (RTC_TamperLevel != RTC_TamperLevel_Low) {
4816  08a0 9f            	ld	a,xl
4817  08a1 4d            	tnz	a
4818  08a2 270a          	jreq	L3522
4819                     ; 1752         RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4821  08a4 9e            	ld	a,xh
4822  08a5 48            	sll	a
4823  08a6 ca516c        	or	a,20844
4824  08a9 c7516c        	ld	20844,a
4826  08ac 200a          	jra	L5522
4827  08ae               L3522:
4828                     ; 1755         RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4830  08ae 7b01          	ld	a,(OFST+1,sp)
4831  08b0 48            	sll	a
4832  08b1 43            	cpl	a
4833  08b2 c4516c        	and	a,20844
4834  08b5 c7516c        	ld	20844,a
4835  08b8               L5522:
4836                     ; 1759     RTC->WPR = 0xFF;
4838  08b8 35ff5159      	mov	20825,#255
4839                     ; 1760 }
4842  08bc 85            	popw	x
4843  08bd 81            	ret
4917                     ; 1768 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4917                     ; 1769 {
4918                     	switch	.text
4919  08be               _RTC_TamperFilterConfig:
4921  08be 88            	push	a
4922       00000000      OFST:	set	0
4925                     ; 1772     assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4927                     ; 1775     RTC->WPR = 0xCA;
4929  08bf 35ca5159      	mov	20825,#202
4930                     ; 1776     RTC->WPR = 0x53;
4932  08c3 35535159      	mov	20825,#83
4933                     ; 1779     RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4935  08c7 c6516d        	ld	a,20845
4936  08ca a4e7          	and	a,#231
4937  08cc c7516d        	ld	20845,a
4938                     ; 1782     RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4940  08cf c6516d        	ld	a,20845
4941  08d2 1a01          	or	a,(OFST+1,sp)
4942  08d4 c7516d        	ld	20845,a
4943                     ; 1785     RTC->WPR = 0xFF;
4945  08d7 35ff5159      	mov	20825,#255
4946                     ; 1787 }
4949  08db 84            	pop	a
4950  08dc 81            	ret
5063                     ; 1796 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5063                     ; 1797 {
5064                     	switch	.text
5065  08dd               _RTC_TamperSamplingFreqConfig:
5067  08dd 88            	push	a
5068       00000000      OFST:	set	0
5071                     ; 1799     assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5073                     ; 1802     RTC->WPR = 0xCA;
5075  08de 35ca5159      	mov	20825,#202
5076                     ; 1803     RTC->WPR = 0x53;
5078  08e2 35535159      	mov	20825,#83
5079                     ; 1806     RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5081  08e6 c6516d        	ld	a,20845
5082  08e9 a4f8          	and	a,#248
5083  08eb c7516d        	ld	20845,a
5084                     ; 1809     RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5086  08ee c6516d        	ld	a,20845
5087  08f1 1a01          	or	a,(OFST+1,sp)
5088  08f3 c7516d        	ld	20845,a
5089                     ; 1812     RTC->WPR = 0xFF;
5091  08f6 35ff5159      	mov	20825,#255
5092                     ; 1813 }
5095  08fa 84            	pop	a
5096  08fb 81            	ret
5179                     ; 1823 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5179                     ; 1824 {
5180                     	switch	.text
5181  08fc               _RTC_TamperPinsPrechargeDuration:
5183  08fc 88            	push	a
5184       00000000      OFST:	set	0
5187                     ; 1826     assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5189                     ; 1829     RTC->WPR = 0xCA;
5191  08fd 35ca5159      	mov	20825,#202
5192                     ; 1830     RTC->WPR = 0x53;
5194  0901 35535159      	mov	20825,#83
5195                     ; 1833     RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5197  0905 c6516d        	ld	a,20845
5198  0908 a41f          	and	a,#31
5199  090a c7516d        	ld	20845,a
5200                     ; 1836     RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5202  090d c6516d        	ld	a,20845
5203  0910 1a01          	or	a,(OFST+1,sp)
5204  0912 c7516d        	ld	20845,a
5205                     ; 1839     RTC->WPR = 0xFF;
5207  0915 35ff5159      	mov	20825,#255
5208                     ; 1840 }
5211  0919 84            	pop	a
5212  091a 81            	ret
5257                     ; 1852 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5257                     ; 1853                    FunctionalState NewState)
5257                     ; 1854 {
5258                     	switch	.text
5259  091b               _RTC_TamperCmd:
5261  091b 89            	pushw	x
5262       00000000      OFST:	set	0
5265                     ; 1857     assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5267                     ; 1858     assert_param(IS_FUNCTIONAL_STATE(NewState));
5269                     ; 1861     RTC->WPR = 0xCA;
5271  091c 35ca5159      	mov	20825,#202
5272                     ; 1862     RTC->WPR = 0x53;
5274  0920 35535159      	mov	20825,#83
5275                     ; 1865     if (NewState != DISABLE) {
5277  0924 9f            	ld	a,xl
5278  0925 4d            	tnz	a
5279  0926 2709          	jreq	L1342
5280                     ; 1867         RTC->TCR1 |= (uint8_t)RTC_Tamper;
5282  0928 9e            	ld	a,xh
5283  0929 ca516c        	or	a,20844
5284  092c c7516c        	ld	20844,a
5286  092f 2009          	jra	L3342
5287  0931               L1342:
5288                     ; 1870         RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5290  0931 7b01          	ld	a,(OFST+1,sp)
5291  0933 43            	cpl	a
5292  0934 c4516c        	and	a,20844
5293  0937 c7516c        	ld	20844,a
5294  093a               L3342:
5295                     ; 1875     RTC->WPR = 0xFF;
5297  093a 35ff5159      	mov	20825,#255
5298                     ; 1876 }
5301  093e 85            	popw	x
5302  093f 81            	ret
5374                     ; 1920 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5374                     ; 1921 {
5375                     	switch	.text
5376  0940               _RTC_ITConfig:
5378  0940 89            	pushw	x
5379       00000000      OFST:	set	0
5382                     ; 1923     assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5384                     ; 1924     assert_param(IS_FUNCTIONAL_STATE(NewState));
5386                     ; 1927     RTC->WPR = 0xCA;
5388  0941 35ca5159      	mov	20825,#202
5389                     ; 1928     RTC->WPR = 0x53;
5391  0945 35535159      	mov	20825,#83
5392                     ; 1930     if (NewState != DISABLE) {
5394  0949 0d05          	tnz	(OFST+5,sp)
5395  094b 2715          	jreq	L1742
5396                     ; 1932         RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5398  094d 9f            	ld	a,xl
5399  094e a4f0          	and	a,#240
5400  0950 ca5149        	or	a,20809
5401  0953 c75149        	ld	20809,a
5402                     ; 1933         RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5404  0956 7b02          	ld	a,(OFST+2,sp)
5405  0958 a401          	and	a,#1
5406  095a ca516c        	or	a,20844
5407  095d c7516c        	ld	20844,a
5409  0960 2016          	jra	L3742
5410  0962               L1742:
5411                     ; 1936         RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5413  0962 7b02          	ld	a,(OFST+2,sp)
5414  0964 a4f0          	and	a,#240
5415  0966 43            	cpl	a
5416  0967 c45149        	and	a,20809
5417  096a c75149        	ld	20809,a
5418                     ; 1937         RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5420  096d 7b02          	ld	a,(OFST+2,sp)
5421  096f a401          	and	a,#1
5422  0971 43            	cpl	a
5423  0972 c4516c        	and	a,20844
5424  0975 c7516c        	ld	20844,a
5425  0978               L3742:
5426                     ; 1941     RTC->WPR = 0xFF;
5428  0978 35ff5159      	mov	20825,#255
5429                     ; 1942 }
5432  097c 85            	popw	x
5433  097d 81            	ret
5607                     ; 1949 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5607                     ; 1950 {
5608                     	switch	.text
5609  097e               _RTC_GetFlagStatus:
5611  097e 89            	pushw	x
5612  097f 5203          	subw	sp,#3
5613       00000003      OFST:	set	3
5616                     ; 1951     FlagStatus flagstatus = RESET;
5618  0981 7b01          	ld	a,(OFST-2,sp)
5619  0983 97            	ld	xl,a
5620                     ; 1952     uint16_t tmpreg1 = 0;
5622  0984 1e02          	ldw	x,(OFST-1,sp)
5623                     ; 1953     uint16_t tmpreg2 = 0;
5625  0986 1e02          	ldw	x,(OFST-1,sp)
5626                     ; 1956     assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5628                     ; 1959     tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5630  0988 c6514c        	ld	a,20812
5631  098b 5f            	clrw	x
5632  098c 97            	ld	xl,a
5633  098d 4f            	clr	a
5634  098e 02            	rlwa	x,a
5635  098f 1f02          	ldw	(OFST-1,sp),x
5636                     ; 1960     tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5638  0991 c6514d        	ld	a,20813
5639  0994 5f            	clrw	x
5640  0995 97            	ld	xl,a
5641  0996 01            	rrwa	x,a
5642  0997 1a03          	or	a,(OFST+0,sp)
5643  0999 01            	rrwa	x,a
5644  099a 1a02          	or	a,(OFST-1,sp)
5645  099c 01            	rrwa	x,a
5646  099d 1f02          	ldw	(OFST-1,sp),x
5647                     ; 1963     if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET) {
5649  099f 1e02          	ldw	x,(OFST-1,sp)
5650  09a1 01            	rrwa	x,a
5651  09a2 1405          	and	a,(OFST+2,sp)
5652  09a4 01            	rrwa	x,a
5653  09a5 1404          	and	a,(OFST+1,sp)
5654  09a7 01            	rrwa	x,a
5655  09a8 a30000        	cpw	x,#0
5656  09ab 2706          	jreq	L3752
5657                     ; 1964         flagstatus = SET;
5659  09ad a601          	ld	a,#1
5660  09af 6b01          	ld	(OFST-2,sp),a
5662  09b1 2002          	jra	L5752
5663  09b3               L3752:
5664                     ; 1966         flagstatus = RESET;
5666  09b3 0f01          	clr	(OFST-2,sp)
5667  09b5               L5752:
5668                     ; 1968     return (FlagStatus)flagstatus;
5670  09b5 7b01          	ld	a,(OFST-2,sp)
5673  09b7 5b05          	addw	sp,#5
5674  09b9 81            	ret
5709                     ; 1978 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5709                     ; 1979 {
5710                     	switch	.text
5711  09ba               _RTC_ClearFlag:
5713  09ba 89            	pushw	x
5714       00000000      OFST:	set	0
5717                     ; 1981     assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5719                     ; 1984     RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5721  09bb 9f            	ld	a,xl
5722  09bc 43            	cpl	a
5723  09bd c7514d        	ld	20813,a
5724                     ; 1985     RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5726  09c0 7b01          	ld	a,(OFST+1,sp)
5727  09c2 43            	cpl	a
5728  09c3 a47f          	and	a,#127
5729  09c5 c7514c        	ld	20812,a
5730                     ; 1986 }
5733  09c8 85            	popw	x
5734  09c9 81            	ret
5798                     ; 1994 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5798                     ; 1995 {
5799                     	switch	.text
5800  09ca               _RTC_GetITStatus:
5802  09ca 89            	pushw	x
5803  09cb 89            	pushw	x
5804       00000002      OFST:	set	2
5807                     ; 1996     ITStatus itstatus = RESET;
5809  09cc 7b02          	ld	a,(OFST+0,sp)
5810  09ce 97            	ld	xl,a
5811                     ; 1997     uint8_t enablestatus = 0, tmpreg = 0;
5813  09cf 7b01          	ld	a,(OFST-1,sp)
5814  09d1 97            	ld	xl,a
5817  09d2 7b02          	ld	a,(OFST+0,sp)
5818  09d4 97            	ld	xl,a
5819                     ; 2000     assert_param(IS_RTC_GET_IT(RTC_IT));
5821                     ; 2003     enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5823  09d5 c65149        	ld	a,20809
5824  09d8 1404          	and	a,(OFST+2,sp)
5825  09da 6b01          	ld	(OFST-1,sp),a
5826                     ; 2006     tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5828  09dc 1e03          	ldw	x,(OFST+1,sp)
5829  09de 54            	srlw	x
5830  09df 54            	srlw	x
5831  09e0 54            	srlw	x
5832  09e1 54            	srlw	x
5833  09e2 9f            	ld	a,xl
5834  09e3 c4514d        	and	a,20813
5835  09e6 6b02          	ld	(OFST+0,sp),a
5836                     ; 2009     if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET)) {
5838  09e8 0d01          	tnz	(OFST-1,sp)
5839  09ea 270a          	jreq	L7462
5841  09ec 0d02          	tnz	(OFST+0,sp)
5842  09ee 2706          	jreq	L7462
5843                     ; 2010         itstatus = SET;
5845  09f0 a601          	ld	a,#1
5846  09f2 6b02          	ld	(OFST+0,sp),a
5848  09f4 2002          	jra	L1562
5849  09f6               L7462:
5850                     ; 2012         itstatus = RESET;
5852  09f6 0f02          	clr	(OFST+0,sp)
5853  09f8               L1562:
5854                     ; 2015     return (ITStatus)itstatus;
5856  09f8 7b02          	ld	a,(OFST+0,sp)
5859  09fa 5b04          	addw	sp,#4
5860  09fc 81            	ret
5896                     ; 2025 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5896                     ; 2026 {
5897                     	switch	.text
5898  09fd               _RTC_ClearITPendingBit:
5902                     ; 2028     assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5904                     ; 2031     RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5906  09fd 54            	srlw	x
5907  09fe 54            	srlw	x
5908  09ff 54            	srlw	x
5909  0a00 54            	srlw	x
5910  0a01 9f            	ld	a,xl
5911  0a02 43            	cpl	a
5912  0a03 c7514d        	ld	20813,a
5913                     ; 2032 }
5916  0a06 81            	ret
5959                     ; 2055 static uint8_t ByteToBcd2(uint8_t Value)
5959                     ; 2056 {
5960                     	switch	.text
5961  0a07               L3_ByteToBcd2:
5963  0a07 88            	push	a
5964  0a08 88            	push	a
5965       00000001      OFST:	set	1
5968                     ; 2057     uint8_t bcdhigh = 0;
5970  0a09 0f01          	clr	(OFST+0,sp)
5972  0a0b 2008          	jra	L7172
5973  0a0d               L3172:
5974                     ; 2060         bcdhigh++;
5976  0a0d 0c01          	inc	(OFST+0,sp)
5977                     ; 2061         Value -= 10;
5979  0a0f 7b02          	ld	a,(OFST+1,sp)
5980  0a11 a00a          	sub	a,#10
5981  0a13 6b02          	ld	(OFST+1,sp),a
5982  0a15               L7172:
5983                     ; 2059     while (Value >= 10) {
5985  0a15 7b02          	ld	a,(OFST+1,sp)
5986  0a17 a10a          	cp	a,#10
5987  0a19 24f2          	jruge	L3172
5988                     ; 2064     return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5990  0a1b 7b01          	ld	a,(OFST+0,sp)
5991  0a1d 97            	ld	xl,a
5992  0a1e a610          	ld	a,#16
5993  0a20 42            	mul	x,a
5994  0a21 9f            	ld	a,xl
5995  0a22 1a02          	or	a,(OFST+1,sp)
5998  0a24 85            	popw	x
5999  0a25 81            	ret
6042                     ; 2072 static uint8_t Bcd2ToByte(uint8_t Value)
6042                     ; 2073 {
6043                     	switch	.text
6044  0a26               L5_Bcd2ToByte:
6046  0a26 88            	push	a
6047  0a27 88            	push	a
6048       00000001      OFST:	set	1
6051                     ; 2074     uint8_t tmp = 0;
6053  0a28 0f01          	clr	(OFST+0,sp)
6054                     ; 2076     tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6056  0a2a a4f0          	and	a,#240
6057  0a2c 4e            	swap	a
6058  0a2d a40f          	and	a,#15
6059  0a2f 97            	ld	xl,a
6060  0a30 a60a          	ld	a,#10
6061  0a32 42            	mul	x,a
6062  0a33 9f            	ld	a,xl
6063  0a34 6b01          	ld	(OFST+0,sp),a
6064                     ; 2078     return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6066  0a36 7b02          	ld	a,(OFST+1,sp)
6067  0a38 a40f          	and	a,#15
6068  0a3a 1b01          	add	a,(OFST+0,sp)
6071  0a3c 85            	popw	x
6072  0a3d 81            	ret
6085                     	xdef	_RTC_ClearITPendingBit
6086                     	xdef	_RTC_GetITStatus
6087                     	xdef	_RTC_ClearFlag
6088                     	xdef	_RTC_GetFlagStatus
6089                     	xdef	_RTC_ITConfig
6090                     	xdef	_RTC_TamperCmd
6091                     	xdef	_RTC_TamperPinsPrechargeDuration
6092                     	xdef	_RTC_TamperSamplingFreqConfig
6093                     	xdef	_RTC_TamperFilterConfig
6094                     	xdef	_RTC_TamperLevelConfig
6095                     	xdef	_RTC_CalibOutputCmd
6096                     	xdef	_RTC_CalibOutputConfig
6097                     	xdef	_RTC_SmoothCalibConfig
6098                     	xdef	_RTC_SynchroShiftConfig
6099                     	xdef	_RTC_OutputConfig
6100                     	xdef	_RTC_GetStoreOperation
6101                     	xdef	_RTC_DayLightSavingConfig
6102                     	xdef	_RTC_WakeUpCmd
6103                     	xdef	_RTC_GetWakeUpCounter
6104                     	xdef	_RTC_SetWakeUpCounter
6105                     	xdef	_RTC_WakeUpClockConfig
6106                     	xdef	_RTC_AlarmSubSecondConfig
6107                     	xdef	_RTC_AlarmCmd
6108                     	xdef	_RTC_GetAlarm
6109                     	xdef	_RTC_AlarmStructInit
6110                     	xdef	_RTC_SetAlarm
6111                     	xdef	_RTC_GetDate
6112                     	xdef	_RTC_DateStructInit
6113                     	xdef	_RTC_SetDate
6114                     	xdef	_RTC_GetSubSecond
6115                     	xdef	_RTC_GetTime
6116                     	xdef	_RTC_TimeStructInit
6117                     	xdef	_RTC_SetTime
6118                     	xdef	_RTC_BypassShadowCmd
6119                     	xdef	_RTC_RatioCmd
6120                     	xdef	_RTC_WaitForSynchro
6121                     	xdef	_RTC_ExitInitMode
6122                     	xdef	_RTC_EnterInitMode
6123                     	xdef	_RTC_WriteProtectionCmd
6124                     	xdef	_RTC_StructInit
6125                     	xdef	_RTC_Init
6126                     	xdef	_RTC_DeInit
6145                     	end
