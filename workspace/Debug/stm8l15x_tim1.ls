   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 175 void TIM1_DeInit(void)
  32                     ; 176 {
  34                     	switch	.text
  35  0000               _TIM1_DeInit:
  39                     ; 177     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  41  0000 725f52b0      	clr	21168
  42                     ; 178     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  44  0004 725f52b1      	clr	21169
  45                     ; 179     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  47  0008 725f52b2      	clr	21170
  48                     ; 180     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  50  000c 725f52b3      	clr	21171
  51                     ; 181     TIM1->IER  = TIM1_IER_RESET_VALUE;
  53  0010 725f52b5      	clr	21173
  54                     ; 184     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  56  0014 725f52bd      	clr	21181
  57                     ; 185     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  59  0018 725f52be      	clr	21182
  60                     ; 187     TIM1->CCMR1 = 0x01;
  62  001c 350152b9      	mov	21177,#1
  63                     ; 188     TIM1->CCMR2 = 0x01;
  65  0020 350152ba      	mov	21178,#1
  66                     ; 189     TIM1->CCMR3 = 0x01;
  68  0024 350152bb      	mov	21179,#1
  69                     ; 190     TIM1->CCMR4 = 0x01;
  71  0028 350152bc      	mov	21180,#1
  72                     ; 192     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  002c 725f52bd      	clr	21181
  75                     ; 193     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  0030 725f52be      	clr	21182
  78                     ; 194     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  80  0034 725f52b9      	clr	21177
  81                     ; 195     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  83  0038 725f52ba      	clr	21178
  84                     ; 196     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  86  003c 725f52bb      	clr	21179
  87                     ; 197     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  89  0040 725f52bc      	clr	21180
  90                     ; 198     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  92  0044 725f52bf      	clr	21183
  93                     ; 199     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  95  0048 725f52c0      	clr	21184
  96                     ; 200     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  98  004c 725f52c1      	clr	21185
  99                     ; 201     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 101  0050 725f52c2      	clr	21186
 102                     ; 202     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 104  0054 35ff52c3      	mov	21187,#255
 105                     ; 203     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 107  0058 35ff52c4      	mov	21188,#255
 108                     ; 204     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 110  005c 725f52c6      	clr	21190
 111                     ; 205     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 113  0060 725f52c7      	clr	21191
 114                     ; 206     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 116  0064 725f52c8      	clr	21192
 117                     ; 207     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 119  0068 725f52c9      	clr	21193
 120                     ; 208     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 122  006c 725f52ca      	clr	21194
 123                     ; 209     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 125  0070 725f52cb      	clr	21195
 126                     ; 210     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 128  0074 725f52cc      	clr	21196
 129                     ; 211     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 131  0078 725f52cd      	clr	21197
 132                     ; 212     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 134  007c 725f52d0      	clr	21200
 135                     ; 213     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 137  0080 350152b8      	mov	21176,#1
 138                     ; 214     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 140  0084 725f52cf      	clr	21199
 141                     ; 215     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 143  0088 725f52ce      	clr	21198
 144                     ; 216     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 146  008c 725f52c5      	clr	21189
 147                     ; 217     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 149  0090 725f52b6      	clr	21174
 150                     ; 218     TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 152  0094 725f52b7      	clr	21175
 153                     ; 219 }
 156  0098 81            	ret
 265                     ; 235 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 265                     ; 236                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 265                     ; 237                        uint16_t TIM1_Period,
 265                     ; 238                        uint8_t TIM1_RepetitionCounter)
 265                     ; 239 {
 266                     	switch	.text
 267  0099               _TIM1_TimeBaseInit:
 269  0099 89            	pushw	x
 270       00000000      OFST:	set	0
 273                     ; 241     assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 275                     ; 245     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 277  009a 7b06          	ld	a,(OFST+6,sp)
 278  009c c752c3        	ld	21187,a
 279                     ; 246     TIM1->ARRL = (uint8_t)(TIM1_Period);
 281  009f 7b07          	ld	a,(OFST+7,sp)
 282  00a1 c752c4        	ld	21188,a
 283                     ; 249     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 285  00a4 9e            	ld	a,xh
 286  00a5 c752c1        	ld	21185,a
 287                     ; 250     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 289  00a8 9f            	ld	a,xl
 290  00a9 c752c2        	ld	21186,a
 291                     ; 253     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 291                     ; 254                           | (uint8_t)(TIM1_CounterMode));
 293  00ac c652b0        	ld	a,21168
 294  00af a48f          	and	a,#143
 295  00b1 1a05          	or	a,(OFST+5,sp)
 296  00b3 c752b0        	ld	21168,a
 297                     ; 257     TIM1->RCR = TIM1_RepetitionCounter;
 299  00b6 7b08          	ld	a,(OFST+8,sp)
 300  00b8 c752c5        	ld	21189,a
 301                     ; 259 }
 304  00bb 85            	popw	x
 305  00bc 81            	ret
 372                     ; 273 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 372                     ; 274 {
 373                     	switch	.text
 374  00bd               _TIM1_PrescalerConfig:
 376  00bd 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 276     assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 382                     ; 279     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 384  00be 9e            	ld	a,xh
 385  00bf c752c1        	ld	21185,a
 386                     ; 280     TIM1->PSCRL = (uint8_t)(Prescaler);
 388  00c2 9f            	ld	a,xl
 389  00c3 c752c2        	ld	21186,a
 390                     ; 283     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 392  00c6 7b05          	ld	a,(OFST+5,sp)
 393  00c8 c752b8        	ld	21176,a
 394                     ; 284 }
 397  00cb 85            	popw	x
 398  00cc 81            	ret
 434                     ; 297 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 434                     ; 298 {
 435                     	switch	.text
 436  00cd               _TIM1_CounterModeConfig:
 438  00cd 88            	push	a
 439       00000000      OFST:	set	0
 442                     ; 300     assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 444                     ; 304     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 444                     ; 305                           | (uint8_t)TIM1_CounterMode);
 446  00ce c652b0        	ld	a,21168
 447  00d1 a48f          	and	a,#143
 448  00d3 1a01          	or	a,(OFST+1,sp)
 449  00d5 c752b0        	ld	21168,a
 450                     ; 306 }
 453  00d8 84            	pop	a
 454  00d9 81            	ret
 488                     ; 314 void TIM1_SetCounter(uint16_t Counter)
 488                     ; 315 {
 489                     	switch	.text
 490  00da               _TIM1_SetCounter:
 494                     ; 317     TIM1->CNTRH = (uint8_t)(Counter >> 8);
 496  00da 9e            	ld	a,xh
 497  00db c752bf        	ld	21183,a
 498                     ; 318     TIM1->CNTRL = (uint8_t)(Counter);
 500  00de 9f            	ld	a,xl
 501  00df c752c0        	ld	21184,a
 502                     ; 319 }
 505  00e2 81            	ret
 539                     ; 327 void TIM1_SetAutoreload(uint16_t Autoreload)
 539                     ; 328 {
 540                     	switch	.text
 541  00e3               _TIM1_SetAutoreload:
 545                     ; 330     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 547  00e3 9e            	ld	a,xh
 548  00e4 c752c3        	ld	21187,a
 549                     ; 331     TIM1->ARRL = (uint8_t)(Autoreload);
 551  00e7 9f            	ld	a,xl
 552  00e8 c752c4        	ld	21188,a
 553                     ; 332 }
 556  00eb 81            	ret
 608                     ; 339 uint16_t TIM1_GetCounter(void)
 608                     ; 340 {
 609                     	switch	.text
 610  00ec               _TIM1_GetCounter:
 612  00ec 5204          	subw	sp,#4
 613       00000004      OFST:	set	4
 616                     ; 342     uint16_t tmpcntr = 0;
 618  00ee 1e03          	ldw	x,(OFST-1,sp)
 619                     ; 343     uint8_t tmpcntrl = 0, tmpcntrh = 0;
 621  00f0 7b01          	ld	a,(OFST-3,sp)
 622  00f2 97            	ld	xl,a
 625  00f3 7b02          	ld	a,(OFST-2,sp)
 626  00f5 97            	ld	xl,a
 627                     ; 345     tmpcntrh = TIM1->CNTRH;
 629  00f6 c652bf        	ld	a,21183
 630  00f9 6b02          	ld	(OFST-2,sp),a
 631                     ; 346     tmpcntrl = TIM1->CNTRL;
 633  00fb c652c0        	ld	a,21184
 634  00fe 6b01          	ld	(OFST-3,sp),a
 635                     ; 348     tmpcntr  = (uint16_t)(tmpcntrl);
 637  0100 7b01          	ld	a,(OFST-3,sp)
 638  0102 5f            	clrw	x
 639  0103 97            	ld	xl,a
 640  0104 1f03          	ldw	(OFST-1,sp),x
 641                     ; 349     tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 643  0106 7b02          	ld	a,(OFST-2,sp)
 644  0108 5f            	clrw	x
 645  0109 97            	ld	xl,a
 646  010a 4f            	clr	a
 647  010b 02            	rlwa	x,a
 648  010c 01            	rrwa	x,a
 649  010d 1a04          	or	a,(OFST+0,sp)
 650  010f 01            	rrwa	x,a
 651  0110 1a03          	or	a,(OFST-1,sp)
 652  0112 01            	rrwa	x,a
 653  0113 1f03          	ldw	(OFST-1,sp),x
 654                     ; 352     return (uint16_t)tmpcntr;
 656  0115 1e03          	ldw	x,(OFST-1,sp)
 659  0117 5b04          	addw	sp,#4
 660  0119 81            	ret
 694                     ; 360 uint16_t TIM1_GetPrescaler(void)
 694                     ; 361 {
 695                     	switch	.text
 696  011a               _TIM1_GetPrescaler:
 698  011a 89            	pushw	x
 699       00000002      OFST:	set	2
 702                     ; 362     uint16_t tmpreg = 0;
 704  011b 5f            	clrw	x
 705  011c 1f01          	ldw	(OFST-1,sp),x
 706                     ; 363     tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 708  011e c652c1        	ld	a,21185
 709  0121 5f            	clrw	x
 710  0122 97            	ld	xl,a
 711  0123 4f            	clr	a
 712  0124 02            	rlwa	x,a
 713  0125 1f01          	ldw	(OFST-1,sp),x
 714                     ; 365     return (uint16_t)(tmpreg | TIM1->PSCRL);
 716  0127 c652c2        	ld	a,21186
 717  012a 5f            	clrw	x
 718  012b 97            	ld	xl,a
 719  012c 01            	rrwa	x,a
 720  012d 1a02          	or	a,(OFST+0,sp)
 721  012f 01            	rrwa	x,a
 722  0130 1a01          	or	a,(OFST-1,sp)
 723  0132 01            	rrwa	x,a
 726  0133 5b02          	addw	sp,#2
 727  0135 81            	ret
 783                     ; 374 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 783                     ; 375 {
 784                     	switch	.text
 785  0136               _TIM1_UpdateDisableConfig:
 789                     ; 377     assert_param(IS_FUNCTIONAL_STATE(NewState));
 791                     ; 380     if (NewState != DISABLE) {
 793  0136 4d            	tnz	a
 794  0137 2706          	jreq	L772
 795                     ; 381         TIM1->CR1 |= TIM1_CR1_UDIS;
 797  0139 721252b0      	bset	21168,#1
 799  013d 2004          	jra	L103
 800  013f               L772:
 801                     ; 383         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 803  013f 721352b0      	bres	21168,#1
 804  0143               L103:
 805                     ; 385 }
 808  0143 81            	ret
 866                     ; 395 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 866                     ; 396 {
 867                     	switch	.text
 868  0144               _TIM1_UpdateRequestConfig:
 872                     ; 398     assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 874                     ; 401     if (TIM1_UpdateSource != TIM1_UpdateSource_Global) {
 876  0144 4d            	tnz	a
 877  0145 2706          	jreq	L133
 878                     ; 402         TIM1->CR1 |= TIM1_CR1_URS;
 880  0147 721452b0      	bset	21168,#2
 882  014b 2004          	jra	L333
 883  014d               L133:
 884                     ; 404         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 886  014d 721552b0      	bres	21168,#2
 887  0151               L333:
 888                     ; 406 }
 891  0151 81            	ret
 927                     ; 414 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 927                     ; 415 {
 928                     	switch	.text
 929  0152               _TIM1_ARRPreloadConfig:
 933                     ; 417     assert_param(IS_FUNCTIONAL_STATE(NewState));
 935                     ; 420     if (NewState != DISABLE) {
 937  0152 4d            	tnz	a
 938  0153 2706          	jreq	L353
 939                     ; 421         TIM1->CR1 |= TIM1_CR1_ARPE;
 941  0155 721e52b0      	bset	21168,#7
 943  0159 2004          	jra	L553
 944  015b               L353:
 945                     ; 423         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 947  015b 721f52b0      	bres	21168,#7
 948  015f               L553:
 949                     ; 425 }
 952  015f 81            	ret
1009                     ; 435 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1009                     ; 436 {
1010                     	switch	.text
1011  0160               _TIM1_SelectOnePulseMode:
1015                     ; 438     assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1017                     ; 441     if (TIM1_OPMode != TIM1_OPMode_Repetitive) {
1019  0160 4d            	tnz	a
1020  0161 2706          	jreq	L504
1021                     ; 442         TIM1->CR1 |= TIM1_CR1_OPM;
1023  0163 721652b0      	bset	21168,#3
1025  0167 2004          	jra	L704
1026  0169               L504:
1027                     ; 444         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1029  0169 721752b0      	bres	21168,#3
1030  016d               L704:
1031                     ; 446 }
1034  016d 81            	ret
1069                     ; 454 void TIM1_Cmd(FunctionalState NewState)
1069                     ; 455 {
1070                     	switch	.text
1071  016e               _TIM1_Cmd:
1075                     ; 457     assert_param(IS_FUNCTIONAL_STATE(NewState));
1077                     ; 460     if (NewState != DISABLE) {
1079  016e 4d            	tnz	a
1080  016f 2706          	jreq	L724
1081                     ; 461         TIM1->CR1 |= TIM1_CR1_CEN;
1083  0171 721052b0      	bset	21168,#0
1085  0175 2004          	jra	L134
1086  0177               L724:
1087                     ; 463         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1089  0177 721152b0      	bres	21168,#0
1090  017b               L134:
1091                     ; 465 }
1094  017b 81            	ret
1379                     ; 556 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1379                     ; 557                   TIM1_OutputState_TypeDef TIM1_OutputState,
1379                     ; 558                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1379                     ; 559                   uint16_t TIM1_Pulse,
1379                     ; 560                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1379                     ; 561                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1379                     ; 562                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1379                     ; 563                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1379                     ; 564 {
1380                     	switch	.text
1381  017c               _TIM1_OC1Init:
1383  017c 89            	pushw	x
1384  017d 5203          	subw	sp,#3
1385       00000003      OFST:	set	3
1388                     ; 566     assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1390                     ; 567     assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1392                     ; 568     assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1394                     ; 569     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1396                     ; 570     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1398                     ; 571     assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1400                     ; 572     assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1402                     ; 576     TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1402                     ; 577                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1404  017f c652bd        	ld	a,21181
1405  0182 a4f0          	and	a,#240
1406  0184 c752bd        	ld	21181,a
1407                     ; 580     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1407                     ; 581                                        | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1407                     ; 582                              | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1407                     ; 583                                           | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1409  0187 7b0c          	ld	a,(OFST+9,sp)
1410  0189 a408          	and	a,#8
1411  018b 6b03          	ld	(OFST+0,sp),a
1412  018d 7b0b          	ld	a,(OFST+8,sp)
1413  018f a402          	and	a,#2
1414  0191 1a03          	or	a,(OFST+0,sp)
1415  0193 6b02          	ld	(OFST-1,sp),a
1416  0195 7b08          	ld	a,(OFST+5,sp)
1417  0197 a404          	and	a,#4
1418  0199 6b01          	ld	(OFST-2,sp),a
1419  019b 9f            	ld	a,xl
1420  019c a401          	and	a,#1
1421  019e 1a01          	or	a,(OFST-2,sp)
1422  01a0 1a02          	or	a,(OFST-1,sp)
1423  01a2 ca52bd        	or	a,21181
1424  01a5 c752bd        	ld	21181,a
1425                     ; 586     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1425                     ; 587                             | (uint8_t)TIM1_OCMode);
1427  01a8 c652b9        	ld	a,21177
1428  01ab a48f          	and	a,#143
1429  01ad 1a04          	or	a,(OFST+1,sp)
1430  01af c752b9        	ld	21177,a
1431                     ; 590     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1433  01b2 c652d0        	ld	a,21200
1434  01b5 a4fc          	and	a,#252
1435  01b7 c752d0        	ld	21200,a
1436                     ; 592     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1436                     ; 593                             | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1438  01ba 7b0e          	ld	a,(OFST+11,sp)
1439  01bc a402          	and	a,#2
1440  01be 6b03          	ld	(OFST+0,sp),a
1441  01c0 7b0d          	ld	a,(OFST+10,sp)
1442  01c2 a401          	and	a,#1
1443  01c4 1a03          	or	a,(OFST+0,sp)
1444  01c6 ca52d0        	or	a,21200
1445  01c9 c752d0        	ld	21200,a
1446                     ; 596     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1448  01cc 7b09          	ld	a,(OFST+6,sp)
1449  01ce c752c6        	ld	21190,a
1450                     ; 597     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1452  01d1 7b0a          	ld	a,(OFST+7,sp)
1453  01d3 c752c7        	ld	21191,a
1454                     ; 598 }
1457  01d6 5b05          	addw	sp,#5
1458  01d8 81            	ret
1562                     ; 637 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1562                     ; 638                   TIM1_OutputState_TypeDef TIM1_OutputState,
1562                     ; 639                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1562                     ; 640                   uint16_t TIM1_Pulse,
1562                     ; 641                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1562                     ; 642                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1562                     ; 643                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1562                     ; 644                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1562                     ; 645 {
1563                     	switch	.text
1564  01d9               _TIM1_OC2Init:
1566  01d9 89            	pushw	x
1567  01da 5203          	subw	sp,#3
1568       00000003      OFST:	set	3
1571                     ; 648     assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1573                     ; 649     assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1575                     ; 650     assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1577                     ; 651     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1579                     ; 652     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1581                     ; 653     assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1583                     ; 654     assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1585                     ; 658     TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1587  01dc c652bd        	ld	a,21181
1588  01df a40f          	and	a,#15
1589  01e1 c752bd        	ld	21181,a
1590                     ; 661     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1590                     ; 662                              | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1592  01e4 7b0c          	ld	a,(OFST+9,sp)
1593  01e6 a480          	and	a,#128
1594  01e8 6b03          	ld	(OFST+0,sp),a
1595  01ea 7b0b          	ld	a,(OFST+8,sp)
1596  01ec a420          	and	a,#32
1597  01ee 1a03          	or	a,(OFST+0,sp)
1598  01f0 6b02          	ld	(OFST-1,sp),a
1599  01f2 7b08          	ld	a,(OFST+5,sp)
1600  01f4 a440          	and	a,#64
1601  01f6 6b01          	ld	(OFST-2,sp),a
1602  01f8 9f            	ld	a,xl
1603  01f9 a410          	and	a,#16
1604  01fb 1a01          	or	a,(OFST-2,sp)
1605  01fd 1a02          	or	a,(OFST-1,sp)
1606  01ff ca52bd        	or	a,21181
1607  0202 c752bd        	ld	21181,a
1608                     ; 665     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1610  0205 c652ba        	ld	a,21178
1611  0208 a48f          	and	a,#143
1612  020a 1a04          	or	a,(OFST+1,sp)
1613  020c c752ba        	ld	21178,a
1614                     ; 668     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1616  020f c652d0        	ld	a,21200
1617  0212 a4f3          	and	a,#243
1618  0214 c752d0        	ld	21200,a
1619                     ; 670     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1621  0217 7b0e          	ld	a,(OFST+11,sp)
1622  0219 a408          	and	a,#8
1623  021b 6b03          	ld	(OFST+0,sp),a
1624  021d 7b0d          	ld	a,(OFST+10,sp)
1625  021f a404          	and	a,#4
1626  0221 1a03          	or	a,(OFST+0,sp)
1627  0223 ca52d0        	or	a,21200
1628  0226 c752d0        	ld	21200,a
1629                     ; 673     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1631  0229 7b09          	ld	a,(OFST+6,sp)
1632  022b c752c8        	ld	21192,a
1633                     ; 674     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1635  022e 7b0a          	ld	a,(OFST+7,sp)
1636  0230 c752c9        	ld	21193,a
1637                     ; 675 }
1640  0233 5b05          	addw	sp,#5
1641  0235 81            	ret
1745                     ; 714 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1745                     ; 715                   TIM1_OutputState_TypeDef TIM1_OutputState,
1745                     ; 716                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1745                     ; 717                   uint16_t TIM1_Pulse,
1745                     ; 718                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1745                     ; 719                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1745                     ; 720                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1745                     ; 721                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1745                     ; 722 {
1746                     	switch	.text
1747  0236               _TIM1_OC3Init:
1749  0236 89            	pushw	x
1750  0237 5203          	subw	sp,#3
1751       00000003      OFST:	set	3
1754                     ; 725     assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1756                     ; 726     assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1758                     ; 727     assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1760                     ; 728     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1762                     ; 729     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1764                     ; 730     assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1766                     ; 731     assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1768                     ; 735     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1770  0239 c652be        	ld	a,21182
1771  023c a4f0          	and	a,#240
1772  023e c752be        	ld	21182,a
1773                     ; 738     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1773                     ; 739                              | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1775  0241 7b0c          	ld	a,(OFST+9,sp)
1776  0243 a408          	and	a,#8
1777  0245 6b03          	ld	(OFST+0,sp),a
1778  0247 7b0b          	ld	a,(OFST+8,sp)
1779  0249 a402          	and	a,#2
1780  024b 1a03          	or	a,(OFST+0,sp)
1781  024d 6b02          	ld	(OFST-1,sp),a
1782  024f 7b08          	ld	a,(OFST+5,sp)
1783  0251 a404          	and	a,#4
1784  0253 6b01          	ld	(OFST-2,sp),a
1785  0255 9f            	ld	a,xl
1786  0256 a401          	and	a,#1
1787  0258 1a01          	or	a,(OFST-2,sp)
1788  025a 1a02          	or	a,(OFST-1,sp)
1789  025c ca52be        	or	a,21182
1790  025f c752be        	ld	21182,a
1791                     ; 742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1793  0262 c652bb        	ld	a,21179
1794  0265 a48f          	and	a,#143
1795  0267 1a04          	or	a,(OFST+1,sp)
1796  0269 c752bb        	ld	21179,a
1797                     ; 745     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1799  026c c652d0        	ld	a,21200
1800  026f a4cf          	and	a,#207
1801  0271 c752d0        	ld	21200,a
1802                     ; 747     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1804  0274 7b0e          	ld	a,(OFST+11,sp)
1805  0276 a420          	and	a,#32
1806  0278 6b03          	ld	(OFST+0,sp),a
1807  027a 7b0d          	ld	a,(OFST+10,sp)
1808  027c a410          	and	a,#16
1809  027e 1a03          	or	a,(OFST+0,sp)
1810  0280 ca52d0        	or	a,21200
1811  0283 c752d0        	ld	21200,a
1812                     ; 750     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1814  0286 7b09          	ld	a,(OFST+6,sp)
1815  0288 c752ca        	ld	21194,a
1816                     ; 751     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1818  028b 7b0a          	ld	a,(OFST+7,sp)
1819  028d c752cb        	ld	21195,a
1820                     ; 752 }
1823  0290 5b05          	addw	sp,#5
1824  0292 81            	ret
2031                     ; 782 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2031                     ; 783                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2031                     ; 784                      uint8_t TIM1_DeadTime,
2031                     ; 785                      TIM1_BreakState_TypeDef TIM1_Break,
2031                     ; 786                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2031                     ; 787                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2031                     ; 788 {
2032                     	switch	.text
2033  0293               _TIM1_BDTRConfig:
2035  0293 89            	pushw	x
2036  0294 88            	push	a
2037       00000001      OFST:	set	1
2040                     ; 791     assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2042                     ; 792     assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2044                     ; 793     assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2046                     ; 794     assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2048                     ; 795     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2050                     ; 797     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2052  0295 7b06          	ld	a,(OFST+5,sp)
2053  0297 c752cf        	ld	21199,a
2054                     ; 801     TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2054                     ; 802                             | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2054                     ; 803                                         | (uint8_t)TIM1_AutomaticOutput));
2056  029a 7b07          	ld	a,(OFST+6,sp)
2057  029c 1a08          	or	a,(OFST+7,sp)
2058  029e 1a09          	or	a,(OFST+8,sp)
2059  02a0 6b01          	ld	(OFST+0,sp),a
2060  02a2 9f            	ld	a,xl
2061  02a3 1a02          	or	a,(OFST+1,sp)
2062  02a5 1a01          	or	a,(OFST+0,sp)
2063  02a7 c752ce        	ld	21198,a
2064                     ; 805 }
2067  02aa 5b03          	addw	sp,#3
2068  02ac 81            	ret
2104                     ; 813 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2104                     ; 814 {
2105                     	switch	.text
2106  02ad               _TIM1_CtrlPWMOutputs:
2110                     ; 816     assert_param(IS_FUNCTIONAL_STATE(NewState));
2112                     ; 820     if (NewState != DISABLE) {
2114  02ad 4d            	tnz	a
2115  02ae 2706          	jreq	L5601
2116                     ; 821         TIM1->BKR |= TIM1_BKR_MOE;
2118  02b0 721e52ce      	bset	21198,#7
2120  02b4 2004          	jra	L7601
2121  02b6               L5601:
2122                     ; 823         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2124  02b6 721f52ce      	bres	21198,#7
2125  02ba               L7601:
2126                     ; 825 }
2129  02ba 81            	ret
2208                     ; 847 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2208                     ; 848 {
2209                     	switch	.text
2210  02bb               _TIM1_SelectOCxM:
2212  02bb 89            	pushw	x
2213       00000000      OFST:	set	0
2216                     ; 850     assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2218                     ; 851     assert_param(IS_TIM1_OCM(TIM1_OCMode));
2220                     ; 853     if (TIM1_Channel == TIM1_Channel_1) {
2222  02bc 9e            	ld	a,xh
2223  02bd 4d            	tnz	a
2224  02be 2610          	jrne	L7211
2225                     ; 855         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2227  02c0 721152bd      	bres	21181,#0
2228                     ; 858         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2230  02c4 c652b9        	ld	a,21177
2231  02c7 a48f          	and	a,#143
2232  02c9 1a02          	or	a,(OFST+2,sp)
2233  02cb c752b9        	ld	21177,a
2235  02ce 2024          	jra	L1311
2236  02d0               L7211:
2237                     ; 859     } else if (TIM1_Channel == TIM1_Channel_2) {
2239  02d0 7b01          	ld	a,(OFST+1,sp)
2240  02d2 a101          	cp	a,#1
2241  02d4 2610          	jrne	L3311
2242                     ; 861         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2244  02d6 721952bd      	bres	21181,#4
2245                     ; 864         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2247  02da c652ba        	ld	a,21178
2248  02dd a48f          	and	a,#143
2249  02df 1a02          	or	a,(OFST+2,sp)
2250  02e1 c752ba        	ld	21178,a
2252  02e4 200e          	jra	L1311
2253  02e6               L3311:
2254                     ; 867         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2256  02e6 721152be      	bres	21182,#0
2257                     ; 870         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2259  02ea c652bb        	ld	a,21179
2260  02ed a48f          	and	a,#143
2261  02ef 1a02          	or	a,(OFST+2,sp)
2262  02f1 c752bb        	ld	21179,a
2263  02f4               L1311:
2264                     ; 873 }
2267  02f4 85            	popw	x
2268  02f5 81            	ret
2302                     ; 881 void TIM1_SetCompare1(uint16_t Compare1)
2302                     ; 882 {
2303                     	switch	.text
2304  02f6               _TIM1_SetCompare1:
2308                     ; 884     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2310  02f6 9e            	ld	a,xh
2311  02f7 c752c6        	ld	21190,a
2312                     ; 885     TIM1->CCR1L = (uint8_t)(Compare1);
2314  02fa 9f            	ld	a,xl
2315  02fb c752c7        	ld	21191,a
2316                     ; 887 }
2319  02fe 81            	ret
2353                     ; 895 void TIM1_SetCompare2(uint16_t Compare2)
2353                     ; 896 {
2354                     	switch	.text
2355  02ff               _TIM1_SetCompare2:
2359                     ; 898     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2361  02ff 9e            	ld	a,xh
2362  0300 c752c8        	ld	21192,a
2363                     ; 899     TIM1->CCR2L = (uint8_t)(Compare2);
2365  0303 9f            	ld	a,xl
2366  0304 c752c9        	ld	21193,a
2367                     ; 900 }
2370  0307 81            	ret
2404                     ; 908 void TIM1_SetCompare3(uint16_t Compare3)
2404                     ; 909 {
2405                     	switch	.text
2406  0308               _TIM1_SetCompare3:
2410                     ; 911     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2412  0308 9e            	ld	a,xh
2413  0309 c752ca        	ld	21194,a
2414                     ; 912     TIM1->CCR3L = (uint8_t)(Compare3);
2416  030c 9f            	ld	a,xl
2417  030d c752cb        	ld	21195,a
2418                     ; 913 }
2421  0310 81            	ret
2455                     ; 921 void TIM1_SetCompare4(uint16_t Compare4)
2455                     ; 922 {
2456                     	switch	.text
2457  0311               _TIM1_SetCompare4:
2461                     ; 924     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2463  0311 9e            	ld	a,xh
2464  0312 c752cc        	ld	21196,a
2465                     ; 925     TIM1->CCR4L = (uint8_t)(Compare4);
2467  0315 9f            	ld	a,xl
2468  0316 c752cd        	ld	21197,a
2469                     ; 926 }
2472  0319 81            	ret
2508                     ; 934 void TIM1_CCPreloadControl(FunctionalState NewState)
2508                     ; 935 {
2509                     	switch	.text
2510  031a               _TIM1_CCPreloadControl:
2514                     ; 937     assert_param(IS_FUNCTIONAL_STATE(NewState));
2516                     ; 940     if (NewState != DISABLE) {
2518  031a 4d            	tnz	a
2519  031b 2706          	jreq	L5421
2520                     ; 941         TIM1->CR2 |= TIM1_CR2_CCPC;
2522  031d 721052b1      	bset	21169,#0
2524  0321 2004          	jra	L7421
2525  0323               L5421:
2526                     ; 943         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2528  0323 721152b1      	bres	21169,#0
2529  0327               L7421:
2530                     ; 945 }
2533  0327 81            	ret
2591                     ; 955 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2591                     ; 956 {
2592                     	switch	.text
2593  0328               _TIM1_ForcedOC1Config:
2595  0328 88            	push	a
2596       00000000      OFST:	set	0
2599                     ; 958     assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2601                     ; 961     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2603  0329 c652b9        	ld	a,21177
2604  032c a48f          	and	a,#143
2605  032e 1a01          	or	a,(OFST+1,sp)
2606  0330 c752b9        	ld	21177,a
2607                     ; 962 }
2610  0333 84            	pop	a
2611  0334 81            	ret
2647                     ; 972 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2647                     ; 973 {
2648                     	switch	.text
2649  0335               _TIM1_ForcedOC2Config:
2651  0335 88            	push	a
2652       00000000      OFST:	set	0
2655                     ; 975     assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2657                     ; 978     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2659  0336 c652ba        	ld	a,21178
2660  0339 a48f          	and	a,#143
2661  033b 1a01          	or	a,(OFST+1,sp)
2662  033d c752ba        	ld	21178,a
2663                     ; 979 }
2666  0340 84            	pop	a
2667  0341 81            	ret
2703                     ; 989 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2703                     ; 990 {
2704                     	switch	.text
2705  0342               _TIM1_ForcedOC3Config:
2707  0342 88            	push	a
2708       00000000      OFST:	set	0
2711                     ; 992     assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2713                     ; 995     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2715  0343 c652bb        	ld	a,21179
2716  0346 a48f          	and	a,#143
2717  0348 1a01          	or	a,(OFST+1,sp)
2718  034a c752bb        	ld	21179,a
2719                     ; 996 }
2722  034d 84            	pop	a
2723  034e 81            	ret
2759                     ; 1004 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2759                     ; 1005 {
2760                     	switch	.text
2761  034f               _TIM1_OC1PreloadConfig:
2765                     ; 1007     assert_param(IS_FUNCTIONAL_STATE(NewState));
2767                     ; 1010     if (NewState != DISABLE) {
2769  034f 4d            	tnz	a
2770  0350 2706          	jreq	L1531
2771                     ; 1011         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2773  0352 721652b9      	bset	21177,#3
2775  0356 2004          	jra	L3531
2776  0358               L1531:
2777                     ; 1013         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2779  0358 721752b9      	bres	21177,#3
2780  035c               L3531:
2781                     ; 1015 }
2784  035c 81            	ret
2820                     ; 1023 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2820                     ; 1024 {
2821                     	switch	.text
2822  035d               _TIM1_OC2PreloadConfig:
2826                     ; 1026     assert_param(IS_FUNCTIONAL_STATE(NewState));
2828                     ; 1029     if (NewState != DISABLE) {
2830  035d 4d            	tnz	a
2831  035e 2706          	jreq	L3731
2832                     ; 1030         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2834  0360 721652ba      	bset	21178,#3
2836  0364 2004          	jra	L5731
2837  0366               L3731:
2838                     ; 1032         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2840  0366 721752ba      	bres	21178,#3
2841  036a               L5731:
2842                     ; 1034 }
2845  036a 81            	ret
2881                     ; 1042 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2881                     ; 1043 {
2882                     	switch	.text
2883  036b               _TIM1_OC3PreloadConfig:
2887                     ; 1045     assert_param(IS_FUNCTIONAL_STATE(NewState));
2889                     ; 1048     if (NewState != DISABLE) {
2891  036b 4d            	tnz	a
2892  036c 2706          	jreq	L5141
2893                     ; 1049         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2895  036e 721652bb      	bset	21179,#3
2897  0372 2004          	jra	L7141
2898  0374               L5141:
2899                     ; 1051         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2901  0374 721752bb      	bres	21179,#3
2902  0378               L7141:
2903                     ; 1053 }
2906  0378 81            	ret
2942                     ; 1061 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2942                     ; 1062 {
2943                     	switch	.text
2944  0379               _TIM1_OC4PreloadConfig:
2948                     ; 1064     assert_param(IS_FUNCTIONAL_STATE(NewState));
2950                     ; 1067     if (NewState != DISABLE) {
2952  0379 4d            	tnz	a
2953  037a 2706          	jreq	L7341
2954                     ; 1068         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2956  037c 721652bc      	bset	21180,#3
2958  0380 2004          	jra	L1441
2959  0382               L7341:
2960                     ; 1070         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2962  0382 721752bc      	bres	21180,#3
2963  0386               L1441:
2964                     ; 1072 }
2967  0386 81            	ret
3002                     ; 1080 void TIM1_OC1FastConfig(FunctionalState NewState)
3002                     ; 1081 {
3003                     	switch	.text
3004  0387               _TIM1_OC1FastConfig:
3008                     ; 1083     assert_param(IS_FUNCTIONAL_STATE(NewState));
3010                     ; 1086     if (NewState != DISABLE) {
3012  0387 4d            	tnz	a
3013  0388 2706          	jreq	L1641
3014                     ; 1087         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3016  038a 721452b9      	bset	21177,#2
3018  038e 2004          	jra	L3641
3019  0390               L1641:
3020                     ; 1089         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3022  0390 721552b9      	bres	21177,#2
3023  0394               L3641:
3024                     ; 1091 }
3027  0394 81            	ret
3062                     ; 1099 void TIM1_OC2FastConfig(FunctionalState NewState)
3062                     ; 1100 {
3063                     	switch	.text
3064  0395               _TIM1_OC2FastConfig:
3068                     ; 1102     assert_param(IS_FUNCTIONAL_STATE(NewState));
3070                     ; 1105     if (NewState != DISABLE) {
3072  0395 4d            	tnz	a
3073  0396 2706          	jreq	L3051
3074                     ; 1106         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3076  0398 721452ba      	bset	21178,#2
3078  039c 2004          	jra	L5051
3079  039e               L3051:
3080                     ; 1108         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3082  039e 721552ba      	bres	21178,#2
3083  03a2               L5051:
3084                     ; 1110 }
3087  03a2 81            	ret
3122                     ; 1118 void TIM1_OC3FastConfig(FunctionalState NewState)
3122                     ; 1119 {
3123                     	switch	.text
3124  03a3               _TIM1_OC3FastConfig:
3128                     ; 1121     assert_param(IS_FUNCTIONAL_STATE(NewState));
3130                     ; 1124     if (NewState != DISABLE) {
3132  03a3 4d            	tnz	a
3133  03a4 2706          	jreq	L5251
3134                     ; 1125         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3136  03a6 721452bb      	bset	21179,#2
3138  03aa 2004          	jra	L7251
3139  03ac               L5251:
3140                     ; 1127         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3142  03ac 721552bb      	bres	21179,#2
3143  03b0               L7251:
3144                     ; 1129 }
3147  03b0 81            	ret
3182                     ; 1137 void TIM1_ClearOC1Ref(FunctionalState NewState)
3182                     ; 1138 {
3183                     	switch	.text
3184  03b1               _TIM1_ClearOC1Ref:
3188                     ; 1140     assert_param(IS_FUNCTIONAL_STATE(NewState));
3190                     ; 1143     if (NewState != DISABLE) {
3192  03b1 4d            	tnz	a
3193  03b2 2706          	jreq	L7451
3194                     ; 1144         TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3196  03b4 721e52b9      	bset	21177,#7
3198  03b8 2004          	jra	L1551
3199  03ba               L7451:
3200                     ; 1146         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3202  03ba 721f52b9      	bres	21177,#7
3203  03be               L1551:
3204                     ; 1148 }
3207  03be 81            	ret
3242                     ; 1156 void TIM1_ClearOC2Ref(FunctionalState NewState)
3242                     ; 1157 {
3243                     	switch	.text
3244  03bf               _TIM1_ClearOC2Ref:
3248                     ; 1159     assert_param(IS_FUNCTIONAL_STATE(NewState));
3250                     ; 1162     if (NewState != DISABLE) {
3252  03bf 4d            	tnz	a
3253  03c0 2706          	jreq	L1751
3254                     ; 1163         TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3256  03c2 721e52ba      	bset	21178,#7
3258  03c6 2004          	jra	L3751
3259  03c8               L1751:
3260                     ; 1165         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3262  03c8 721f52ba      	bres	21178,#7
3263  03cc               L3751:
3264                     ; 1167 }
3267  03cc 81            	ret
3302                     ; 1175 void TIM1_ClearOC3Ref(FunctionalState NewState)
3302                     ; 1176 {
3303                     	switch	.text
3304  03cd               _TIM1_ClearOC3Ref:
3308                     ; 1178     assert_param(IS_FUNCTIONAL_STATE(NewState));
3310                     ; 1181     if (NewState != DISABLE) {
3312  03cd 4d            	tnz	a
3313  03ce 2706          	jreq	L3161
3314                     ; 1182         TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3316  03d0 721e52bb      	bset	21179,#7
3318  03d4 2004          	jra	L5161
3319  03d6               L3161:
3320                     ; 1184         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3322  03d6 721f52bb      	bres	21179,#7
3323  03da               L5161:
3324                     ; 1186 }
3327  03da 81            	ret
3362                     ; 1194 void TIM1_ClearOC4Ref(FunctionalState NewState)
3362                     ; 1195 {
3363                     	switch	.text
3364  03db               _TIM1_ClearOC4Ref:
3368                     ; 1197     assert_param(IS_FUNCTIONAL_STATE(NewState));
3370                     ; 1200     if (NewState != DISABLE) {
3372  03db 4d            	tnz	a
3373  03dc 2706          	jreq	L5361
3374                     ; 1201         TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3376  03de 721e52bc      	bset	21180,#7
3378  03e2 2004          	jra	L7361
3379  03e4               L5361:
3380                     ; 1203         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3382  03e4 721f52bc      	bres	21180,#7
3383  03e8               L7361:
3384                     ; 1205 }
3387  03e8 81            	ret
3423                     ; 1215 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3423                     ; 1216 {
3424                     	switch	.text
3425  03e9               _TIM1_OC1PolarityConfig:
3429                     ; 1218     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3431                     ; 1221     if (TIM1_OCPolarity != TIM1_OCPolarity_High) {
3433  03e9 4d            	tnz	a
3434  03ea 2706          	jreq	L7561
3435                     ; 1222         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3437  03ec 721252bd      	bset	21181,#1
3439  03f0 2004          	jra	L1661
3440  03f2               L7561:
3441                     ; 1224         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3443  03f2 721352bd      	bres	21181,#1
3444  03f6               L1661:
3445                     ; 1226 }
3448  03f6 81            	ret
3484                     ; 1236 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3484                     ; 1237 {
3485                     	switch	.text
3486  03f7               _TIM1_OC1NPolarityConfig:
3490                     ; 1239     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3492                     ; 1242     if (TIM1_OCNPolarity != TIM1_OCNPolarity_High) {
3494  03f7 4d            	tnz	a
3495  03f8 2706          	jreq	L1071
3496                     ; 1243         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3498  03fa 721652bd      	bset	21181,#3
3500  03fe 2004          	jra	L3071
3501  0400               L1071:
3502                     ; 1245         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3504  0400 721752bd      	bres	21181,#3
3505  0404               L3071:
3506                     ; 1247 }
3509  0404 81            	ret
3545                     ; 1257 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3545                     ; 1258 {
3546                     	switch	.text
3547  0405               _TIM1_OC2PolarityConfig:
3551                     ; 1260     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3553                     ; 1263     if (TIM1_OCPolarity != TIM1_OCPolarity_High) {
3555  0405 4d            	tnz	a
3556  0406 2706          	jreq	L3271
3557                     ; 1264         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3559  0408 721a52bd      	bset	21181,#5
3561  040c 2004          	jra	L5271
3562  040e               L3271:
3563                     ; 1266         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3565  040e 721b52bd      	bres	21181,#5
3566  0412               L5271:
3567                     ; 1268 }
3570  0412 81            	ret
3606                     ; 1278 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3606                     ; 1279 {
3607                     	switch	.text
3608  0413               _TIM1_OC2NPolarityConfig:
3612                     ; 1281     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3614                     ; 1284     if (TIM1_OCNPolarity != TIM1_OCNPolarity_High) {
3616  0413 4d            	tnz	a
3617  0414 2706          	jreq	L5471
3618                     ; 1285         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3620  0416 721e52bd      	bset	21181,#7
3622  041a 2004          	jra	L7471
3623  041c               L5471:
3624                     ; 1287         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3626  041c 721f52bd      	bres	21181,#7
3627  0420               L7471:
3628                     ; 1289 }
3631  0420 81            	ret
3667                     ; 1299 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3667                     ; 1300 {
3668                     	switch	.text
3669  0421               _TIM1_OC3PolarityConfig:
3673                     ; 1302     assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3675                     ; 1305     if (TIM1_OCPolarity != TIM1_OCPolarity_High) {
3677  0421 4d            	tnz	a
3678  0422 2706          	jreq	L7671
3679                     ; 1306         TIM1->CCER2 |= TIM1_CCER2_CC3P;
3681  0424 721252be      	bset	21182,#1
3683  0428 2004          	jra	L1771
3684  042a               L7671:
3685                     ; 1308         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3687  042a 721352be      	bres	21182,#1
3688  042e               L1771:
3689                     ; 1310 }
3692  042e 81            	ret
3728                     ; 1320 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3728                     ; 1321 {
3729                     	switch	.text
3730  042f               _TIM1_OC3NPolarityConfig:
3734                     ; 1323     assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3736                     ; 1326     if (TIM1_OCNPolarity != TIM1_OCNPolarity_High) {
3738  042f 4d            	tnz	a
3739  0430 2706          	jreq	L1102
3740                     ; 1327         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3742  0432 721652be      	bset	21182,#3
3744  0436 2004          	jra	L3102
3745  0438               L1102:
3746                     ; 1329         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3748  0438 721752be      	bres	21182,#3
3749  043c               L3102:
3750                     ; 1331 }
3753  043c 81            	ret
3812                     ; 1341 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3812                     ; 1342 {
3813                     	switch	.text
3814  043d               _TIM1_SelectOCREFClear:
3818                     ; 1344     assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3820                     ; 1347     TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3822  043d 721752b2      	bres	21170,#3
3823                     ; 1348     TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3825  0441 ca52b2        	or	a,21170
3826  0444 c752b2        	ld	21170,a
3827                     ; 1349 }
3830  0447 81            	ret
3865                     ; 1357 void TIM1_SelectCOM(FunctionalState NewState)
3865                     ; 1358 {
3866                     	switch	.text
3867  0448               _TIM1_SelectCOM:
3871                     ; 1360     assert_param(IS_FUNCTIONAL_STATE(NewState));
3873                     ; 1363     if (NewState != DISABLE) {
3875  0448 4d            	tnz	a
3876  0449 2706          	jreq	L1602
3877                     ; 1364         TIM1->CR2 |= TIM1_CR2_CCUS;
3879  044b 721452b1      	bset	21169,#2
3881  044f 2004          	jra	L3602
3882  0451               L1602:
3883                     ; 1366         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3885  0451 721552b1      	bres	21169,#2
3886  0455               L3602:
3887                     ; 1368 }
3890  0455 81            	ret
3935                     ; 1382 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3935                     ; 1383 {
3936                     	switch	.text
3937  0456               _TIM1_CCxCmd:
3939  0456 89            	pushw	x
3940       00000000      OFST:	set	0
3943                     ; 1385     assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3945                     ; 1386     assert_param(IS_FUNCTIONAL_STATE(NewState));
3947                     ; 1388     if (TIM1_Channel == TIM1_Channel_1) {
3949  0457 9e            	ld	a,xh
3950  0458 4d            	tnz	a
3951  0459 2610          	jrne	L7012
3952                     ; 1390         if (NewState != DISABLE) {
3954  045b 9f            	ld	a,xl
3955  045c 4d            	tnz	a
3956  045d 2706          	jreq	L1112
3957                     ; 1391             TIM1->CCER1 |= TIM1_CCER1_CC1E;
3959  045f 721052bd      	bset	21181,#0
3961  0463 2040          	jra	L5112
3962  0465               L1112:
3963                     ; 1393             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3965  0465 721152bd      	bres	21181,#0
3966  0469 203a          	jra	L5112
3967  046b               L7012:
3968                     ; 1395     } else if (TIM1_Channel == TIM1_Channel_2) {
3970  046b 7b01          	ld	a,(OFST+1,sp)
3971  046d a101          	cp	a,#1
3972  046f 2610          	jrne	L7112
3973                     ; 1397         if (NewState != DISABLE) {
3975  0471 0d02          	tnz	(OFST+2,sp)
3976  0473 2706          	jreq	L1212
3977                     ; 1398             TIM1->CCER1 |= TIM1_CCER1_CC2E;
3979  0475 721852bd      	bset	21181,#4
3981  0479 202a          	jra	L5112
3982  047b               L1212:
3983                     ; 1400             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3985  047b 721952bd      	bres	21181,#4
3986  047f 2024          	jra	L5112
3987  0481               L7112:
3988                     ; 1402     } else if (TIM1_Channel == TIM1_Channel_3) {
3990  0481 7b01          	ld	a,(OFST+1,sp)
3991  0483 a102          	cp	a,#2
3992  0485 2610          	jrne	L7212
3993                     ; 1404         if (NewState != DISABLE) {
3995  0487 0d02          	tnz	(OFST+2,sp)
3996  0489 2706          	jreq	L1312
3997                     ; 1405             TIM1->CCER2 |= TIM1_CCER2_CC3E;
3999  048b 721052be      	bset	21182,#0
4001  048f 2014          	jra	L5112
4002  0491               L1312:
4003                     ; 1407             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4005  0491 721152be      	bres	21182,#0
4006  0495 200e          	jra	L5112
4007  0497               L7212:
4008                     ; 1411         if (NewState != DISABLE) {
4010  0497 0d02          	tnz	(OFST+2,sp)
4011  0499 2706          	jreq	L7312
4012                     ; 1412             TIM1->CCER2 |= TIM1_CCER2_CC4E;
4014  049b 721852be      	bset	21182,#4
4016  049f 2004          	jra	L5112
4017  04a1               L7312:
4018                     ; 1414             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4020  04a1 721952be      	bres	21182,#4
4021  04a5               L5112:
4022                     ; 1417 }
4025  04a5 85            	popw	x
4026  04a6 81            	ret
4071                     ; 1430 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4071                     ; 1431 {
4072                     	switch	.text
4073  04a7               _TIM1_CCxNCmd:
4075  04a7 89            	pushw	x
4076       00000000      OFST:	set	0
4079                     ; 1433     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4081                     ; 1434     assert_param(IS_FUNCTIONAL_STATE(NewState));
4083                     ; 1436     if (TIM1_Channel == TIM1_Channel_1) {
4085  04a8 9e            	ld	a,xh
4086  04a9 4d            	tnz	a
4087  04aa 2610          	jrne	L5612
4088                     ; 1438         if (NewState != DISABLE) {
4090  04ac 9f            	ld	a,xl
4091  04ad 4d            	tnz	a
4092  04ae 2706          	jreq	L7612
4093                     ; 1439             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4095  04b0 721452bd      	bset	21181,#2
4097  04b4 202a          	jra	L3712
4098  04b6               L7612:
4099                     ; 1441             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4101  04b6 721552bd      	bres	21181,#2
4102  04ba 2024          	jra	L3712
4103  04bc               L5612:
4104                     ; 1443     } else if (TIM1_Channel == TIM1_Channel_2) {
4106  04bc 7b01          	ld	a,(OFST+1,sp)
4107  04be a101          	cp	a,#1
4108  04c0 2610          	jrne	L5712
4109                     ; 1445         if (NewState != DISABLE) {
4111  04c2 0d02          	tnz	(OFST+2,sp)
4112  04c4 2706          	jreq	L7712
4113                     ; 1446             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4115  04c6 721c52bd      	bset	21181,#6
4117  04ca 2014          	jra	L3712
4118  04cc               L7712:
4119                     ; 1448             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4121  04cc 721d52bd      	bres	21181,#6
4122  04d0 200e          	jra	L3712
4123  04d2               L5712:
4124                     ; 1452         if (NewState != DISABLE) {
4126  04d2 0d02          	tnz	(OFST+2,sp)
4127  04d4 2706          	jreq	L5022
4128                     ; 1453             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4130  04d6 721452be      	bset	21182,#2
4132  04da 2004          	jra	L3712
4133  04dc               L5022:
4134                     ; 1455             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4136  04dc 721552be      	bres	21182,#2
4137  04e0               L3712:
4138                     ; 1458 }
4141  04e0 85            	popw	x
4142  04e1 81            	ret
4310                     ; 1545 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4310                     ; 1546                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4310                     ; 1547                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4310                     ; 1548                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4310                     ; 1549                  uint8_t TIM1_ICFilter)
4310                     ; 1550 {
4311                     	switch	.text
4312  04e2               _TIM1_ICInit:
4314  04e2 89            	pushw	x
4315       00000000      OFST:	set	0
4318                     ; 1553     assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4320                     ; 1554     assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4322                     ; 1555     assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4324                     ; 1556     assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4326                     ; 1557     assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4328                     ; 1559     if (TIM1_Channel == TIM1_Channel_1) {
4330  04e3 9e            	ld	a,xh
4331  04e4 4d            	tnz	a
4332  04e5 2614          	jrne	L5032
4333                     ; 1561         TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4335  04e7 7b07          	ld	a,(OFST+7,sp)
4336  04e9 88            	push	a
4337  04ea 7b06          	ld	a,(OFST+6,sp)
4338  04ec 97            	ld	xl,a
4339  04ed 7b03          	ld	a,(OFST+3,sp)
4340  04ef 95            	ld	xh,a
4341  04f0 cd0853        	call	L3_TI1_Config
4343  04f3 84            	pop	a
4344                     ; 1563         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4346  04f4 7b06          	ld	a,(OFST+6,sp)
4347  04f6 cd0672        	call	_TIM1_SetIC1Prescaler
4350  04f9 2046          	jra	L7032
4351  04fb               L5032:
4352                     ; 1564     } else if (TIM1_Channel == TIM1_Channel_2) {
4354  04fb 7b01          	ld	a,(OFST+1,sp)
4355  04fd a101          	cp	a,#1
4356  04ff 2614          	jrne	L1132
4357                     ; 1566         TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4359  0501 7b07          	ld	a,(OFST+7,sp)
4360  0503 88            	push	a
4361  0504 7b06          	ld	a,(OFST+6,sp)
4362  0506 97            	ld	xl,a
4363  0507 7b03          	ld	a,(OFST+3,sp)
4364  0509 95            	ld	xh,a
4365  050a cd0883        	call	L5_TI2_Config
4367  050d 84            	pop	a
4368                     ; 1568         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4370  050e 7b06          	ld	a,(OFST+6,sp)
4371  0510 cd067f        	call	_TIM1_SetIC2Prescaler
4374  0513 202c          	jra	L7032
4375  0515               L1132:
4376                     ; 1569     } else if (TIM1_Channel == TIM1_Channel_3) {
4378  0515 7b01          	ld	a,(OFST+1,sp)
4379  0517 a102          	cp	a,#2
4380  0519 2614          	jrne	L5132
4381                     ; 1571         TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4383  051b 7b07          	ld	a,(OFST+7,sp)
4384  051d 88            	push	a
4385  051e 7b06          	ld	a,(OFST+6,sp)
4386  0520 97            	ld	xl,a
4387  0521 7b03          	ld	a,(OFST+3,sp)
4388  0523 95            	ld	xh,a
4389  0524 cd08b3        	call	L7_TI3_Config
4391  0527 84            	pop	a
4392                     ; 1573         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4394  0528 7b06          	ld	a,(OFST+6,sp)
4395  052a cd068c        	call	_TIM1_SetIC3Prescaler
4398  052d 2012          	jra	L7032
4399  052f               L5132:
4400                     ; 1576         TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4402  052f 7b07          	ld	a,(OFST+7,sp)
4403  0531 88            	push	a
4404  0532 7b06          	ld	a,(OFST+6,sp)
4405  0534 97            	ld	xl,a
4406  0535 7b03          	ld	a,(OFST+3,sp)
4407  0537 95            	ld	xh,a
4408  0538 cd08e3        	call	L11_TI4_Config
4410  053b 84            	pop	a
4411                     ; 1578         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4413  053c 7b06          	ld	a,(OFST+6,sp)
4414  053e cd0699        	call	_TIM1_SetIC4Prescaler
4416  0541               L7032:
4417                     ; 1580 }
4420  0541 85            	popw	x
4421  0542 81            	ret
4519                     ; 1607 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4519                     ; 1608                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4519                     ; 1609                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4519                     ; 1610                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4519                     ; 1611                      uint8_t TIM1_ICFilter)
4519                     ; 1612 {
4520                     	switch	.text
4521  0543               _TIM1_PWMIConfig:
4523  0543 89            	pushw	x
4524  0544 89            	pushw	x
4525       00000002      OFST:	set	2
4528                     ; 1613     TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4530  0545 7b01          	ld	a,(OFST-1,sp)
4531  0547 97            	ld	xl,a
4532                     ; 1614     TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4534  0548 7b02          	ld	a,(OFST+0,sp)
4535  054a 97            	ld	xl,a
4536                     ; 1617     assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4538                     ; 1618     assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4540                     ; 1619     assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4542                     ; 1620     assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4544                     ; 1623     if (TIM1_ICPolarity != TIM1_ICPolarity_Falling) {
4546  054b 7b04          	ld	a,(OFST+2,sp)
4547  054d a101          	cp	a,#1
4548  054f 2706          	jreq	L7632
4549                     ; 1624         icpolarity = TIM1_ICPolarity_Falling;
4551  0551 a601          	ld	a,#1
4552  0553 6b01          	ld	(OFST-1,sp),a
4554  0555 2002          	jra	L1732
4555  0557               L7632:
4556                     ; 1626         icpolarity = TIM1_ICPolarity_Rising;
4558  0557 0f01          	clr	(OFST-1,sp)
4559  0559               L1732:
4560                     ; 1630     if (TIM1_ICSelection == TIM1_ICSelection_DirectTI) {
4562  0559 7b07          	ld	a,(OFST+5,sp)
4563  055b a101          	cp	a,#1
4564  055d 2606          	jrne	L3732
4565                     ; 1631         icselection = TIM1_ICSelection_IndirectTI;
4567  055f a602          	ld	a,#2
4568  0561 6b02          	ld	(OFST+0,sp),a
4570  0563 2004          	jra	L5732
4571  0565               L3732:
4572                     ; 1633         icselection = TIM1_ICSelection_DirectTI;
4574  0565 a601          	ld	a,#1
4575  0567 6b02          	ld	(OFST+0,sp),a
4576  0569               L5732:
4577                     ; 1636     if (TIM1_Channel == TIM1_Channel_1) {
4579  0569 0d03          	tnz	(OFST+1,sp)
4580  056b 2626          	jrne	L7732
4581                     ; 1638         TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4583  056d 7b09          	ld	a,(OFST+7,sp)
4584  056f 88            	push	a
4585  0570 7b08          	ld	a,(OFST+6,sp)
4586  0572 97            	ld	xl,a
4587  0573 7b05          	ld	a,(OFST+3,sp)
4588  0575 95            	ld	xh,a
4589  0576 cd0853        	call	L3_TI1_Config
4591  0579 84            	pop	a
4592                     ; 1641         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4594  057a 7b08          	ld	a,(OFST+6,sp)
4595  057c cd0672        	call	_TIM1_SetIC1Prescaler
4597                     ; 1644         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4599  057f 7b09          	ld	a,(OFST+7,sp)
4600  0581 88            	push	a
4601  0582 7b03          	ld	a,(OFST+1,sp)
4602  0584 97            	ld	xl,a
4603  0585 7b02          	ld	a,(OFST+0,sp)
4604  0587 95            	ld	xh,a
4605  0588 cd0883        	call	L5_TI2_Config
4607  058b 84            	pop	a
4608                     ; 1647         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4610  058c 7b08          	ld	a,(OFST+6,sp)
4611  058e cd067f        	call	_TIM1_SetIC2Prescaler
4614  0591 2024          	jra	L1042
4615  0593               L7732:
4616                     ; 1650         TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4618  0593 7b09          	ld	a,(OFST+7,sp)
4619  0595 88            	push	a
4620  0596 7b08          	ld	a,(OFST+6,sp)
4621  0598 97            	ld	xl,a
4622  0599 7b05          	ld	a,(OFST+3,sp)
4623  059b 95            	ld	xh,a
4624  059c cd0883        	call	L5_TI2_Config
4626  059f 84            	pop	a
4627                     ; 1653         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4629  05a0 7b08          	ld	a,(OFST+6,sp)
4630  05a2 cd067f        	call	_TIM1_SetIC2Prescaler
4632                     ; 1656         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4634  05a5 7b09          	ld	a,(OFST+7,sp)
4635  05a7 88            	push	a
4636  05a8 7b03          	ld	a,(OFST+1,sp)
4637  05aa 97            	ld	xl,a
4638  05ab 7b02          	ld	a,(OFST+0,sp)
4639  05ad 95            	ld	xh,a
4640  05ae cd0853        	call	L3_TI1_Config
4642  05b1 84            	pop	a
4643                     ; 1659         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4645  05b2 7b08          	ld	a,(OFST+6,sp)
4646  05b4 cd0672        	call	_TIM1_SetIC1Prescaler
4648  05b7               L1042:
4649                     ; 1661 }
4652  05b7 5b04          	addw	sp,#4
4653  05b9 81            	ret
4705                     ; 1668 uint16_t TIM1_GetCapture1(void)
4705                     ; 1669 {
4706                     	switch	.text
4707  05ba               _TIM1_GetCapture1:
4709  05ba 5204          	subw	sp,#4
4710       00000004      OFST:	set	4
4713                     ; 1672     uint16_t tmpccr1 = 0;
4715  05bc 1e03          	ldw	x,(OFST-1,sp)
4716                     ; 1673     uint8_t tmpccr1l = 0, tmpccr1h = 0;
4718  05be 7b01          	ld	a,(OFST-3,sp)
4719  05c0 97            	ld	xl,a
4722  05c1 7b02          	ld	a,(OFST-2,sp)
4723  05c3 97            	ld	xl,a
4724                     ; 1675     tmpccr1h = TIM1->CCR1H;
4726  05c4 c652c6        	ld	a,21190
4727  05c7 6b02          	ld	(OFST-2,sp),a
4728                     ; 1676     tmpccr1l = TIM1->CCR1L;
4730  05c9 c652c7        	ld	a,21191
4731  05cc 6b01          	ld	(OFST-3,sp),a
4732                     ; 1678     tmpccr1 = (uint16_t)(tmpccr1l);
4734  05ce 7b01          	ld	a,(OFST-3,sp)
4735  05d0 5f            	clrw	x
4736  05d1 97            	ld	xl,a
4737  05d2 1f03          	ldw	(OFST-1,sp),x
4738                     ; 1679     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4740  05d4 7b02          	ld	a,(OFST-2,sp)
4741  05d6 5f            	clrw	x
4742  05d7 97            	ld	xl,a
4743  05d8 4f            	clr	a
4744  05d9 02            	rlwa	x,a
4745  05da 01            	rrwa	x,a
4746  05db 1a04          	or	a,(OFST+0,sp)
4747  05dd 01            	rrwa	x,a
4748  05de 1a03          	or	a,(OFST-1,sp)
4749  05e0 01            	rrwa	x,a
4750  05e1 1f03          	ldw	(OFST-1,sp),x
4751                     ; 1681     return (uint16_t)tmpccr1;
4753  05e3 1e03          	ldw	x,(OFST-1,sp)
4756  05e5 5b04          	addw	sp,#4
4757  05e7 81            	ret
4809                     ; 1689 uint16_t TIM1_GetCapture2(void)
4809                     ; 1690 {
4810                     	switch	.text
4811  05e8               _TIM1_GetCapture2:
4813  05e8 5204          	subw	sp,#4
4814       00000004      OFST:	set	4
4817                     ; 1693     uint16_t tmpccr2 = 0;
4819  05ea 1e03          	ldw	x,(OFST-1,sp)
4820                     ; 1694     uint8_t tmpccr2l = 0, tmpccr2h = 0;
4822  05ec 7b01          	ld	a,(OFST-3,sp)
4823  05ee 97            	ld	xl,a
4826  05ef 7b02          	ld	a,(OFST-2,sp)
4827  05f1 97            	ld	xl,a
4828                     ; 1696     tmpccr2h = TIM1->CCR2H;
4830  05f2 c652c8        	ld	a,21192
4831  05f5 6b02          	ld	(OFST-2,sp),a
4832                     ; 1697     tmpccr2l = TIM1->CCR2L;
4834  05f7 c652c9        	ld	a,21193
4835  05fa 6b01          	ld	(OFST-3,sp),a
4836                     ; 1699     tmpccr2 = (uint16_t)(tmpccr2l);
4838  05fc 7b01          	ld	a,(OFST-3,sp)
4839  05fe 5f            	clrw	x
4840  05ff 97            	ld	xl,a
4841  0600 1f03          	ldw	(OFST-1,sp),x
4842                     ; 1700     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4844  0602 7b02          	ld	a,(OFST-2,sp)
4845  0604 5f            	clrw	x
4846  0605 97            	ld	xl,a
4847  0606 4f            	clr	a
4848  0607 02            	rlwa	x,a
4849  0608 01            	rrwa	x,a
4850  0609 1a04          	or	a,(OFST+0,sp)
4851  060b 01            	rrwa	x,a
4852  060c 1a03          	or	a,(OFST-1,sp)
4853  060e 01            	rrwa	x,a
4854  060f 1f03          	ldw	(OFST-1,sp),x
4855                     ; 1702     return (uint16_t)tmpccr2;
4857  0611 1e03          	ldw	x,(OFST-1,sp)
4860  0613 5b04          	addw	sp,#4
4861  0615 81            	ret
4913                     ; 1710 uint16_t TIM1_GetCapture3(void)
4913                     ; 1711 {
4914                     	switch	.text
4915  0616               _TIM1_GetCapture3:
4917  0616 5204          	subw	sp,#4
4918       00000004      OFST:	set	4
4921                     ; 1713     uint16_t tmpccr3 = 0;
4923  0618 1e03          	ldw	x,(OFST-1,sp)
4924                     ; 1714     uint8_t tmpccr3l = 0, tmpccr3h = 0;
4926  061a 7b01          	ld	a,(OFST-3,sp)
4927  061c 97            	ld	xl,a
4930  061d 7b02          	ld	a,(OFST-2,sp)
4931  061f 97            	ld	xl,a
4932                     ; 1716     tmpccr3h = TIM1->CCR3H;
4934  0620 c652ca        	ld	a,21194
4935  0623 6b02          	ld	(OFST-2,sp),a
4936                     ; 1717     tmpccr3l = TIM1->CCR3L;
4938  0625 c652cb        	ld	a,21195
4939  0628 6b01          	ld	(OFST-3,sp),a
4940                     ; 1719     tmpccr3 = (uint16_t)(tmpccr3l);
4942  062a 7b01          	ld	a,(OFST-3,sp)
4943  062c 5f            	clrw	x
4944  062d 97            	ld	xl,a
4945  062e 1f03          	ldw	(OFST-1,sp),x
4946                     ; 1720     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4948  0630 7b02          	ld	a,(OFST-2,sp)
4949  0632 5f            	clrw	x
4950  0633 97            	ld	xl,a
4951  0634 4f            	clr	a
4952  0635 02            	rlwa	x,a
4953  0636 01            	rrwa	x,a
4954  0637 1a04          	or	a,(OFST+0,sp)
4955  0639 01            	rrwa	x,a
4956  063a 1a03          	or	a,(OFST-1,sp)
4957  063c 01            	rrwa	x,a
4958  063d 1f03          	ldw	(OFST-1,sp),x
4959                     ; 1722     return (uint16_t)tmpccr3;
4961  063f 1e03          	ldw	x,(OFST-1,sp)
4964  0641 5b04          	addw	sp,#4
4965  0643 81            	ret
5017                     ; 1730 uint16_t TIM1_GetCapture4(void)
5017                     ; 1731 {
5018                     	switch	.text
5019  0644               _TIM1_GetCapture4:
5021  0644 5204          	subw	sp,#4
5022       00000004      OFST:	set	4
5025                     ; 1733     uint16_t tmpccr4 = 0;
5027  0646 1e03          	ldw	x,(OFST-1,sp)
5028                     ; 1734     uint8_t tmpccr4l = 0, tmpccr4h = 0;
5030  0648 7b01          	ld	a,(OFST-3,sp)
5031  064a 97            	ld	xl,a
5034  064b 7b02          	ld	a,(OFST-2,sp)
5035  064d 97            	ld	xl,a
5036                     ; 1736     tmpccr4h = TIM1->CCR4H;
5038  064e c652cc        	ld	a,21196
5039  0651 6b02          	ld	(OFST-2,sp),a
5040                     ; 1737     tmpccr4l = TIM1->CCR4L;
5042  0653 c652cd        	ld	a,21197
5043  0656 6b01          	ld	(OFST-3,sp),a
5044                     ; 1739     tmpccr4 = (uint16_t)(tmpccr4l);
5046  0658 7b01          	ld	a,(OFST-3,sp)
5047  065a 5f            	clrw	x
5048  065b 97            	ld	xl,a
5049  065c 1f03          	ldw	(OFST-1,sp),x
5050                     ; 1740     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5052  065e 7b02          	ld	a,(OFST-2,sp)
5053  0660 5f            	clrw	x
5054  0661 97            	ld	xl,a
5055  0662 4f            	clr	a
5056  0663 02            	rlwa	x,a
5057  0664 01            	rrwa	x,a
5058  0665 1a04          	or	a,(OFST+0,sp)
5059  0667 01            	rrwa	x,a
5060  0668 1a03          	or	a,(OFST-1,sp)
5061  066a 01            	rrwa	x,a
5062  066b 1f03          	ldw	(OFST-1,sp),x
5063                     ; 1742     return (uint16_t)tmpccr4;
5065  066d 1e03          	ldw	x,(OFST-1,sp)
5068  066f 5b04          	addw	sp,#4
5069  0671 81            	ret
5105                     ; 1755 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5105                     ; 1756 {
5106                     	switch	.text
5107  0672               _TIM1_SetIC1Prescaler:
5109  0672 88            	push	a
5110       00000000      OFST:	set	0
5113                     ; 1758     assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5115                     ; 1761     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5117  0673 c652b9        	ld	a,21177
5118  0676 a4f3          	and	a,#243
5119  0678 1a01          	or	a,(OFST+1,sp)
5120  067a c752b9        	ld	21177,a
5121                     ; 1762 }
5124  067d 84            	pop	a
5125  067e 81            	ret
5161                     ; 1774 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5161                     ; 1775 {
5162                     	switch	.text
5163  067f               _TIM1_SetIC2Prescaler:
5165  067f 88            	push	a
5166       00000000      OFST:	set	0
5169                     ; 1777     assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5171                     ; 1780     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5173  0680 c652ba        	ld	a,21178
5174  0683 a4f3          	and	a,#243
5175  0685 1a01          	or	a,(OFST+1,sp)
5176  0687 c752ba        	ld	21178,a
5177                     ; 1781 }
5180  068a 84            	pop	a
5181  068b 81            	ret
5217                     ; 1793 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5217                     ; 1794 {
5218                     	switch	.text
5219  068c               _TIM1_SetIC3Prescaler:
5221  068c 88            	push	a
5222       00000000      OFST:	set	0
5225                     ; 1797     assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5227                     ; 1800     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5229  068d c652bb        	ld	a,21179
5230  0690 a4f3          	and	a,#243
5231  0692 1a01          	or	a,(OFST+1,sp)
5232  0694 c752bb        	ld	21179,a
5233                     ; 1801 }
5236  0697 84            	pop	a
5237  0698 81            	ret
5273                     ; 1813 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5273                     ; 1814 {
5274                     	switch	.text
5275  0699               _TIM1_SetIC4Prescaler:
5277  0699 88            	push	a
5278       00000000      OFST:	set	0
5281                     ; 1817     assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5283                     ; 1820     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5285  069a c652bc        	ld	a,21180
5286  069d a4f3          	and	a,#243
5287  069f 1a01          	or	a,(OFST+1,sp)
5288  06a1 c752bc        	ld	21180,a
5289                     ; 1821 }
5292  06a4 84            	pop	a
5293  06a5 81            	ret
5400                     ; 1856 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5400                     ; 1857 {
5401                     	switch	.text
5402  06a6               _TIM1_ITConfig:
5404  06a6 89            	pushw	x
5405       00000000      OFST:	set	0
5408                     ; 1859     assert_param(IS_TIM1_IT(TIM1_IT));
5410                     ; 1860     assert_param(IS_FUNCTIONAL_STATE(NewState));
5412                     ; 1862     if (NewState != DISABLE) {
5414  06a7 9f            	ld	a,xl
5415  06a8 4d            	tnz	a
5416  06a9 2709          	jreq	L1762
5417                     ; 1864         TIM1->IER |= (uint8_t)TIM1_IT;
5419  06ab 9e            	ld	a,xh
5420  06ac ca52b5        	or	a,21173
5421  06af c752b5        	ld	21173,a
5423  06b2 2009          	jra	L3762
5424  06b4               L1762:
5425                     ; 1867         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5427  06b4 7b01          	ld	a,(OFST+1,sp)
5428  06b6 43            	cpl	a
5429  06b7 c452b5        	and	a,21173
5430  06ba c752b5        	ld	21173,a
5431  06bd               L3762:
5432                     ; 1869 }
5435  06bd 85            	popw	x
5436  06be 81            	ret
5541                     ; 1885 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5541                     ; 1886 {
5542                     	switch	.text
5543  06bf               _TIM1_GenerateEvent:
5547                     ; 1888     assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5549                     ; 1891     TIM1->EGR = (uint8_t)TIM1_EventSource;
5551  06bf c752b8        	ld	21176,a
5552                     ; 1892 }
5555  06c2 81            	ret
5729                     ; 1911 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5729                     ; 1912 {
5730                     	switch	.text
5731  06c3               _TIM1_GetFlagStatus:
5733  06c3 89            	pushw	x
5734  06c4 89            	pushw	x
5735       00000002      OFST:	set	2
5738                     ; 1913     FlagStatus bitstatus = RESET;
5740  06c5 7b02          	ld	a,(OFST+0,sp)
5741  06c7 97            	ld	xl,a
5742                     ; 1914     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5744  06c8 7b01          	ld	a,(OFST-1,sp)
5745  06ca 97            	ld	xl,a
5748  06cb 7b02          	ld	a,(OFST+0,sp)
5749  06cd 97            	ld	xl,a
5750                     ; 1917     assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5752                     ; 1919     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5754  06ce c652b6        	ld	a,21174
5755  06d1 1404          	and	a,(OFST+2,sp)
5756  06d3 6b01          	ld	(OFST-1,sp),a
5757                     ; 1920     tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5759  06d5 c652b7        	ld	a,21175
5760  06d8 1403          	and	a,(OFST+1,sp)
5761  06da 6b02          	ld	(OFST+0,sp),a
5762                     ; 1922     if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0) {
5764  06dc 7b01          	ld	a,(OFST-1,sp)
5765  06de 1a02          	or	a,(OFST+0,sp)
5766  06e0 2706          	jreq	L5303
5767                     ; 1923         bitstatus = SET;
5769  06e2 a601          	ld	a,#1
5770  06e4 6b02          	ld	(OFST+0,sp),a
5772  06e6 2002          	jra	L7303
5773  06e8               L5303:
5774                     ; 1925         bitstatus = RESET;
5776  06e8 0f02          	clr	(OFST+0,sp)
5777  06ea               L7303:
5778                     ; 1927     return (FlagStatus)(bitstatus);
5780  06ea 7b02          	ld	a,(OFST+0,sp)
5783  06ec 5b04          	addw	sp,#4
5784  06ee 81            	ret
5819                     ; 1948 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5819                     ; 1949 {
5820                     	switch	.text
5821  06ef               _TIM1_ClearFlag:
5823  06ef 89            	pushw	x
5824       00000000      OFST:	set	0
5827                     ; 1951     assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5829                     ; 1954     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5831  06f0 9f            	ld	a,xl
5832  06f1 43            	cpl	a
5833  06f2 c752b6        	ld	21174,a
5834                     ; 1955     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5836  06f5 7b01          	ld	a,(OFST+1,sp)
5837  06f7 43            	cpl	a
5838  06f8 a41e          	and	a,#30
5839  06fa c752b7        	ld	21175,a
5840                     ; 1956 }
5843  06fd 85            	popw	x
5844  06fe 81            	ret
5908                     ; 1973 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5908                     ; 1974 {
5909                     	switch	.text
5910  06ff               _TIM1_GetITStatus:
5912  06ff 88            	push	a
5913  0700 89            	pushw	x
5914       00000002      OFST:	set	2
5917                     ; 1975     ITStatus bitstatus = RESET;
5919  0701 7b02          	ld	a,(OFST+0,sp)
5920  0703 97            	ld	xl,a
5921                     ; 1977     uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5923  0704 7b01          	ld	a,(OFST-1,sp)
5924  0706 97            	ld	xl,a
5927  0707 7b02          	ld	a,(OFST+0,sp)
5928  0709 97            	ld	xl,a
5929                     ; 1980     assert_param(IS_TIM1_GET_IT(TIM1_IT));
5931                     ; 1982     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5933  070a c652b6        	ld	a,21174
5934  070d 1403          	and	a,(OFST+1,sp)
5935  070f 6b01          	ld	(OFST-1,sp),a
5936                     ; 1984     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5938  0711 c652b5        	ld	a,21173
5939  0714 1403          	and	a,(OFST+1,sp)
5940  0716 6b02          	ld	(OFST+0,sp),a
5941                     ; 1986     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET )) {
5943  0718 0d01          	tnz	(OFST-1,sp)
5944  071a 270a          	jreq	L1113
5946  071c 0d02          	tnz	(OFST+0,sp)
5947  071e 2706          	jreq	L1113
5948                     ; 1987         bitstatus = SET;
5950  0720 a601          	ld	a,#1
5951  0722 6b02          	ld	(OFST+0,sp),a
5953  0724 2002          	jra	L3113
5954  0726               L1113:
5955                     ; 1989         bitstatus = RESET;
5957  0726 0f02          	clr	(OFST+0,sp)
5958  0728               L3113:
5959                     ; 1991     return (ITStatus)(bitstatus);
5961  0728 7b02          	ld	a,(OFST+0,sp)
5964  072a 5b03          	addw	sp,#3
5965  072c 81            	ret
6001                     ; 2008 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6001                     ; 2009 {
6002                     	switch	.text
6003  072d               _TIM1_ClearITPendingBit:
6007                     ; 2011     assert_param(IS_TIM1_IT(TIM1_IT));
6009                     ; 2014     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6011  072d 43            	cpl	a
6012  072e c752b6        	ld	21174,a
6013                     ; 2015 }
6016  0731 81            	ret
6554                     ; 2023 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6554                     ; 2024                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6554                     ; 2025 {
6555                     	switch	.text
6556  0732               _TIM1_DMAConfig:
6560                     ; 2027     assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6562                     ; 2028     assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6564                     ; 2031     TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6566  0732 9e            	ld	a,xh
6567  0733 c752d1        	ld	21201,a
6568                     ; 2032     TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6570  0736 9f            	ld	a,xl
6571  0737 c752d2        	ld	21202,a
6572                     ; 2033 }
6575  073a 81            	ret
6669                     ; 2045 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6669                     ; 2046 {
6670                     	switch	.text
6671  073b               _TIM1_DMACmd:
6673  073b 89            	pushw	x
6674       00000000      OFST:	set	0
6677                     ; 2048     assert_param(IS_FUNCTIONAL_STATE(NewState));
6679                     ; 2049     assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6681                     ; 2051     if (NewState != DISABLE) {
6683  073c 9f            	ld	a,xl
6684  073d 4d            	tnz	a
6685  073e 2709          	jreq	L7243
6686                     ; 2053         TIM1->DER |= (uint8_t)TIM1_DMASource;
6688  0740 9e            	ld	a,xh
6689  0741 ca52b4        	or	a,21172
6690  0744 c752b4        	ld	21172,a
6692  0747 2009          	jra	L1343
6693  0749               L7243:
6694                     ; 2056         TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6696  0749 7b01          	ld	a,(OFST+1,sp)
6697  074b 43            	cpl	a
6698  074c c452b4        	and	a,21172
6699  074f c752b4        	ld	21172,a
6700  0752               L1343:
6701                     ; 2058 }
6704  0752 85            	popw	x
6705  0753 81            	ret
6740                     ; 2066 void TIM1_SelectCCDMA(FunctionalState NewState)
6740                     ; 2067 {
6741                     	switch	.text
6742  0754               _TIM1_SelectCCDMA:
6746                     ; 2069     assert_param(IS_FUNCTIONAL_STATE(NewState));
6748                     ; 2071     if (NewState != DISABLE) {
6750  0754 4d            	tnz	a
6751  0755 2706          	jreq	L1543
6752                     ; 2073         TIM1->CR2 |= TIM1_CR2_CCDS;
6754  0757 721652b1      	bset	21169,#3
6756  075b 2004          	jra	L3543
6757  075d               L1543:
6758                     ; 2076         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6760  075d 721752b1      	bres	21169,#3
6761  0761               L3543:
6762                     ; 2078 }
6765  0761 81            	ret
6789                     ; 2101 void TIM1_InternalClockConfig(void)
6789                     ; 2102 {
6790                     	switch	.text
6791  0762               _TIM1_InternalClockConfig:
6795                     ; 2104     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6797  0762 c652b2        	ld	a,21170
6798  0765 a4f8          	and	a,#248
6799  0767 c752b2        	ld	21170,a
6800                     ; 2105 }
6803  076a 81            	ret
6892                     ; 2122 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6892                     ; 2123                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6892                     ; 2124                                  uint8_t ICFilter)
6892                     ; 2125 {
6893                     	switch	.text
6894  076b               _TIM1_TIxExternalClockConfig:
6896  076b 89            	pushw	x
6897       00000000      OFST:	set	0
6900                     ; 2127     assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6902                     ; 2128     assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6904                     ; 2129     assert_param(IS_TIM1_IC_FILTER(ICFilter));
6906                     ; 2132     if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2) {
6908  076c 9e            	ld	a,xh
6909  076d a160          	cp	a,#96
6910  076f 260f          	jrne	L5253
6911                     ; 2133         TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6913  0771 7b05          	ld	a,(OFST+5,sp)
6914  0773 88            	push	a
6915  0774 ae0001        	ldw	x,#1
6916  0777 7b03          	ld	a,(OFST+3,sp)
6917  0779 95            	ld	xh,a
6918  077a cd0883        	call	L5_TI2_Config
6920  077d 84            	pop	a
6922  077e 200d          	jra	L7253
6923  0780               L5253:
6924                     ; 2135         TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6926  0780 7b05          	ld	a,(OFST+5,sp)
6927  0782 88            	push	a
6928  0783 ae0001        	ldw	x,#1
6929  0786 7b03          	ld	a,(OFST+3,sp)
6930  0788 95            	ld	xh,a
6931  0789 cd0853        	call	L3_TI1_Config
6933  078c 84            	pop	a
6934  078d               L7253:
6935                     ; 2139     TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6937  078d 7b01          	ld	a,(OFST+1,sp)
6938  078f ad34          	call	_TIM1_SelectInputTrigger
6940                     ; 2142     TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6942  0791 c652b2        	ld	a,21170
6943  0794 aa07          	or	a,#7
6944  0796 c752b2        	ld	21170,a
6945                     ; 2143 }
6948  0799 85            	popw	x
6949  079a 81            	ret
7066                     ; 2161 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7066                     ; 2162                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7066                     ; 2163                               uint8_t ExtTRGFilter)
7066                     ; 2164 {
7067                     	switch	.text
7068  079b               _TIM1_ETRClockMode1Config:
7070  079b 89            	pushw	x
7071       00000000      OFST:	set	0
7074                     ; 2166     assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7076                     ; 2167     assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7078                     ; 2168     assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7080                     ; 2171     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7082  079c 7b05          	ld	a,(OFST+5,sp)
7083  079e 88            	push	a
7084  079f 9f            	ld	a,xl
7085  07a0 97            	ld	xl,a
7086  07a1 7b02          	ld	a,(OFST+2,sp)
7087  07a3 95            	ld	xh,a
7088  07a4 ad54          	call	_TIM1_ETRConfig
7090  07a6 84            	pop	a
7091                     ; 2174     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7091                     ; 2175                            | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7093  07a7 c652b2        	ld	a,21170
7094  07aa a488          	and	a,#136
7095  07ac aa77          	or	a,#119
7096  07ae c752b2        	ld	21170,a
7097                     ; 2176 }
7100  07b1 85            	popw	x
7101  07b2 81            	ret
7159                     ; 2194 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7159                     ; 2195                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7159                     ; 2196                               uint8_t ExtTRGFilter)
7159                     ; 2197 {
7160                     	switch	.text
7161  07b3               _TIM1_ETRClockMode2Config:
7163  07b3 89            	pushw	x
7164       00000000      OFST:	set	0
7167                     ; 2199     assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7169                     ; 2200     assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7171                     ; 2203     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7173  07b4 7b05          	ld	a,(OFST+5,sp)
7174  07b6 88            	push	a
7175  07b7 9f            	ld	a,xl
7176  07b8 97            	ld	xl,a
7177  07b9 7b02          	ld	a,(OFST+2,sp)
7178  07bb 95            	ld	xh,a
7179  07bc ad3c          	call	_TIM1_ETRConfig
7181  07be 84            	pop	a
7182                     ; 2206     TIM1->ETR |= TIM1_ETR_ECE;
7184  07bf 721c52b3      	bset	21171,#6
7185                     ; 2207 }
7188  07c3 85            	popw	x
7189  07c4 81            	ret
7296                     ; 2257 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7296                     ; 2258 {
7297                     	switch	.text
7298  07c5               _TIM1_SelectInputTrigger:
7300  07c5 88            	push	a
7301       00000000      OFST:	set	0
7304                     ; 2260     assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7306                     ; 2263     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7308  07c6 c652b2        	ld	a,21170
7309  07c9 a48f          	and	a,#143
7310  07cb 1a01          	or	a,(OFST+1,sp)
7311  07cd c752b2        	ld	21170,a
7312                     ; 2264 }
7315  07d0 84            	pop	a
7316  07d1 81            	ret
7422                     ; 2280 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7422                     ; 2281 {
7423                     	switch	.text
7424  07d2               _TIM1_SelectOutputTrigger:
7426  07d2 88            	push	a
7427       00000000      OFST:	set	0
7430                     ; 2283     assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7432                     ; 2285     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7434  07d3 c652b1        	ld	a,21169
7435  07d6 a48f          	and	a,#143
7436  07d8 1a01          	or	a,(OFST+1,sp)
7437  07da c752b1        	ld	21169,a
7438                     ; 2286 }
7441  07dd 84            	pop	a
7442  07de 81            	ret
7516                     ; 2298 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7516                     ; 2299 {
7517                     	switch	.text
7518  07df               _TIM1_SelectSlaveMode:
7520  07df 88            	push	a
7521       00000000      OFST:	set	0
7524                     ; 2301     assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7526                     ; 2304     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7528  07e0 c652b2        	ld	a,21170
7529  07e3 a4f8          	and	a,#248
7530  07e5 1a01          	or	a,(OFST+1,sp)
7531  07e7 c752b2        	ld	21170,a
7532                     ; 2306 }
7535  07ea 84            	pop	a
7536  07eb 81            	ret
7572                     ; 2314 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7572                     ; 2315 {
7573                     	switch	.text
7574  07ec               _TIM1_SelectMasterSlaveMode:
7578                     ; 2317     assert_param(IS_FUNCTIONAL_STATE(NewState));
7580                     ; 2320     if (NewState != DISABLE) {
7582  07ec 4d            	tnz	a
7583  07ed 2706          	jreq	L5004
7584                     ; 2321         TIM1->SMCR |= TIM1_SMCR_MSM;
7586  07ef 721e52b2      	bset	21170,#7
7588  07f3 2004          	jra	L7004
7589  07f5               L5004:
7590                     ; 2323         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7592  07f5 721f52b2      	bres	21170,#7
7593  07f9               L7004:
7594                     ; 2325 }
7597  07f9 81            	ret
7653                     ; 2343 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7653                     ; 2344                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7653                     ; 2345                     uint8_t ExtTRGFilter)
7653                     ; 2346 {
7654                     	switch	.text
7655  07fa               _TIM1_ETRConfig:
7657  07fa 89            	pushw	x
7658       00000000      OFST:	set	0
7661                     ; 2347     assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7663                     ; 2350     TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7663                     ; 2351                                      | (uint8_t) TIM1_ExtTRGPolarity)
7663                     ; 2352                            | (uint8_t) ExtTRGFilter);
7665  07fb 9f            	ld	a,xl
7666  07fc 1a01          	or	a,(OFST+1,sp)
7667  07fe 1a05          	or	a,(OFST+5,sp)
7668  0800 ca52b3        	or	a,21171
7669  0803 c752b3        	ld	21171,a
7670                     ; 2353 }
7673  0806 85            	popw	x
7674  0807 81            	ret
7760                     ; 2391 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7760                     ; 2392                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7760                     ; 2393                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7760                     ; 2394 {
7761                     	switch	.text
7762  0808               _TIM1_EncoderInterfaceConfig:
7764  0808 89            	pushw	x
7765       00000000      OFST:	set	0
7768                     ; 2396     assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7770                     ; 2397     assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7772                     ; 2398     assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7774                     ; 2401     if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising) {
7776  0809 9f            	ld	a,xl
7777  080a 4d            	tnz	a
7778  080b 2706          	jreq	L7704
7779                     ; 2402         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7781  080d 721252bd      	bset	21181,#1
7783  0811 2004          	jra	L1014
7784  0813               L7704:
7785                     ; 2404         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7787  0813 721352bd      	bres	21181,#1
7788  0817               L1014:
7789                     ; 2407     if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising) {
7791  0817 0d05          	tnz	(OFST+5,sp)
7792  0819 2706          	jreq	L3014
7793                     ; 2408         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7795  081b 721a52bd      	bset	21181,#5
7797  081f 2004          	jra	L5014
7798  0821               L3014:
7799                     ; 2410         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7801  0821 721b52bd      	bres	21181,#5
7802  0825               L5014:
7803                     ; 2413     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7805  0825 c652b2        	ld	a,21170
7806  0828 a4f0          	and	a,#240
7807  082a 1a01          	or	a,(OFST+1,sp)
7808  082c c752b2        	ld	21170,a
7809                     ; 2416     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7811  082f c652b9        	ld	a,21177
7812  0832 a4fc          	and	a,#252
7813  0834 aa01          	or	a,#1
7814  0836 c752b9        	ld	21177,a
7815                     ; 2417     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7817  0839 c652ba        	ld	a,21178
7818  083c a4fc          	and	a,#252
7819  083e aa01          	or	a,#1
7820  0840 c752ba        	ld	21178,a
7821                     ; 2419 }
7824  0843 85            	popw	x
7825  0844 81            	ret
7861                     ; 2427 void TIM1_SelectHallSensor(FunctionalState NewState)
7861                     ; 2428 {
7862                     	switch	.text
7863  0845               _TIM1_SelectHallSensor:
7867                     ; 2430     assert_param(IS_FUNCTIONAL_STATE(NewState));
7869                     ; 2433     if (NewState != DISABLE) {
7871  0845 4d            	tnz	a
7872  0846 2706          	jreq	L5214
7873                     ; 2434         TIM1->CR2 |= TIM1_CR2_TI1S;
7875  0848 721e52b1      	bset	21169,#7
7877  084c 2004          	jra	L7214
7878  084e               L5214:
7879                     ; 2436         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7881  084e 721f52b1      	bres	21169,#7
7882  0852               L7214:
7883                     ; 2438 }
7886  0852 81            	ret
7938                     ; 2458 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7938                     ; 2459 {
7939                     	switch	.text
7940  0853               L3_TI1_Config:
7942  0853 89            	pushw	x
7943  0854 88            	push	a
7944       00000001      OFST:	set	1
7947                     ; 2462     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7949  0855 721152bd      	bres	21181,#0
7950                     ; 2465     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7950                     ; 2466                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7952  0859 7b06          	ld	a,(OFST+5,sp)
7953  085b 97            	ld	xl,a
7954  085c a610          	ld	a,#16
7955  085e 42            	mul	x,a
7956  085f 9f            	ld	a,xl
7957  0860 1a03          	or	a,(OFST+2,sp)
7958  0862 6b01          	ld	(OFST+0,sp),a
7959  0864 c652b9        	ld	a,21177
7960  0867 a40c          	and	a,#12
7961  0869 1a01          	or	a,(OFST+0,sp)
7962  086b c752b9        	ld	21177,a
7963                     ; 2471     if (TIM1_ICPolarity != TIM1_ICPolarity_Rising) {
7965  086e 0d02          	tnz	(OFST+1,sp)
7966  0870 2706          	jreq	L7514
7967                     ; 2472         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7969  0872 721252bd      	bset	21181,#1
7971  0876 2004          	jra	L1614
7972  0878               L7514:
7973                     ; 2474         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7975  0878 721352bd      	bres	21181,#1
7976  087c               L1614:
7977                     ; 2478     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7979  087c 721052bd      	bset	21181,#0
7980                     ; 2479 }
7983  0880 5b03          	addw	sp,#3
7984  0882 81            	ret
8036                     ; 2495 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8036                     ; 2496 {
8037                     	switch	.text
8038  0883               L5_TI2_Config:
8040  0883 89            	pushw	x
8041  0884 88            	push	a
8042       00000001      OFST:	set	1
8045                     ; 2498     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8047  0885 721952bd      	bres	21181,#4
8048                     ; 2501     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8048                     ; 2502                              | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8050  0889 7b06          	ld	a,(OFST+5,sp)
8051  088b 97            	ld	xl,a
8052  088c a610          	ld	a,#16
8053  088e 42            	mul	x,a
8054  088f 9f            	ld	a,xl
8055  0890 1a03          	or	a,(OFST+2,sp)
8056  0892 6b01          	ld	(OFST+0,sp),a
8057  0894 c652ba        	ld	a,21178
8058  0897 a40c          	and	a,#12
8059  0899 1a01          	or	a,(OFST+0,sp)
8060  089b c752ba        	ld	21178,a
8061                     ; 2504     if (TIM1_ICPolarity != TIM1_ICPolarity_Rising) {
8063  089e 0d02          	tnz	(OFST+1,sp)
8064  08a0 2706          	jreq	L1124
8065                     ; 2505         TIM1->CCER1 |= TIM1_CCER1_CC2P;
8067  08a2 721a52bd      	bset	21181,#5
8069  08a6 2004          	jra	L3124
8070  08a8               L1124:
8071                     ; 2507         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8073  08a8 721b52bd      	bres	21181,#5
8074  08ac               L3124:
8075                     ; 2510     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8077  08ac 721852bd      	bset	21181,#4
8078                     ; 2511 }
8081  08b0 5b03          	addw	sp,#3
8082  08b2 81            	ret
8134                     ; 2527 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8134                     ; 2528 {
8135                     	switch	.text
8136  08b3               L7_TI3_Config:
8138  08b3 89            	pushw	x
8139  08b4 88            	push	a
8140       00000001      OFST:	set	1
8143                     ; 2530     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8145  08b5 721152be      	bres	21182,#0
8146                     ; 2533     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8146                     ; 2534                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8148  08b9 7b06          	ld	a,(OFST+5,sp)
8149  08bb 97            	ld	xl,a
8150  08bc a610          	ld	a,#16
8151  08be 42            	mul	x,a
8152  08bf 9f            	ld	a,xl
8153  08c0 1a03          	or	a,(OFST+2,sp)
8154  08c2 6b01          	ld	(OFST+0,sp),a
8155  08c4 c652bb        	ld	a,21179
8156  08c7 a40c          	and	a,#12
8157  08c9 1a01          	or	a,(OFST+0,sp)
8158  08cb c752bb        	ld	21179,a
8159                     ; 2537     if (TIM1_ICPolarity != TIM1_ICPolarity_Rising) {
8161  08ce 0d02          	tnz	(OFST+1,sp)
8162  08d0 2706          	jreq	L3424
8163                     ; 2538         TIM1->CCER2 |= TIM1_CCER2_CC3P;
8165  08d2 721252be      	bset	21182,#1
8167  08d6 2004          	jra	L5424
8168  08d8               L3424:
8169                     ; 2540         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8171  08d8 721352be      	bres	21182,#1
8172  08dc               L5424:
8173                     ; 2543     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8175  08dc 721052be      	bset	21182,#0
8176                     ; 2544 }
8179  08e0 5b03          	addw	sp,#3
8180  08e2 81            	ret
8232                     ; 2559 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8232                     ; 2560 {
8233                     	switch	.text
8234  08e3               L11_TI4_Config:
8236  08e3 89            	pushw	x
8237  08e4 88            	push	a
8238       00000001      OFST:	set	1
8241                     ; 2563     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8243  08e5 721952be      	bres	21182,#4
8244                     ; 2566     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8244                     ; 2567                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8246  08e9 7b06          	ld	a,(OFST+5,sp)
8247  08eb 97            	ld	xl,a
8248  08ec a610          	ld	a,#16
8249  08ee 42            	mul	x,a
8250  08ef 9f            	ld	a,xl
8251  08f0 1a03          	or	a,(OFST+2,sp)
8252  08f2 6b01          	ld	(OFST+0,sp),a
8253  08f4 c652bc        	ld	a,21180
8254  08f7 a40c          	and	a,#12
8255  08f9 1a01          	or	a,(OFST+0,sp)
8256  08fb c752bc        	ld	21180,a
8257                     ; 2570     if (TIM1_ICPolarity != TIM1_ICPolarity_Rising) {
8259  08fe 0d02          	tnz	(OFST+1,sp)
8260  0900 2706          	jreq	L5724
8261                     ; 2571         TIM1->CCER2 |= TIM1_CCER2_CC4P;
8263  0902 721a52be      	bset	21182,#5
8265  0906 2004          	jra	L7724
8266  0908               L5724:
8267                     ; 2573         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8269  0908 721b52be      	bres	21182,#5
8270  090c               L7724:
8271                     ; 2577     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8273  090c 721852be      	bset	21182,#4
8274                     ; 2578 }
8277  0910 5b03          	addw	sp,#3
8278  0912 81            	ret
8291                     	xdef	_TIM1_SelectHallSensor
8292                     	xdef	_TIM1_EncoderInterfaceConfig
8293                     	xdef	_TIM1_ETRConfig
8294                     	xdef	_TIM1_SelectMasterSlaveMode
8295                     	xdef	_TIM1_SelectSlaveMode
8296                     	xdef	_TIM1_SelectOutputTrigger
8297                     	xdef	_TIM1_SelectInputTrigger
8298                     	xdef	_TIM1_ETRClockMode2Config
8299                     	xdef	_TIM1_ETRClockMode1Config
8300                     	xdef	_TIM1_TIxExternalClockConfig
8301                     	xdef	_TIM1_InternalClockConfig
8302                     	xdef	_TIM1_SelectCCDMA
8303                     	xdef	_TIM1_DMACmd
8304                     	xdef	_TIM1_DMAConfig
8305                     	xdef	_TIM1_ClearITPendingBit
8306                     	xdef	_TIM1_GetITStatus
8307                     	xdef	_TIM1_ClearFlag
8308                     	xdef	_TIM1_GetFlagStatus
8309                     	xdef	_TIM1_GenerateEvent
8310                     	xdef	_TIM1_ITConfig
8311                     	xdef	_TIM1_SetIC4Prescaler
8312                     	xdef	_TIM1_SetIC3Prescaler
8313                     	xdef	_TIM1_SetIC2Prescaler
8314                     	xdef	_TIM1_SetIC1Prescaler
8315                     	xdef	_TIM1_GetCapture4
8316                     	xdef	_TIM1_GetCapture3
8317                     	xdef	_TIM1_GetCapture2
8318                     	xdef	_TIM1_GetCapture1
8319                     	xdef	_TIM1_PWMIConfig
8320                     	xdef	_TIM1_ICInit
8321                     	xdef	_TIM1_CCxNCmd
8322                     	xdef	_TIM1_CCxCmd
8323                     	xdef	_TIM1_SelectCOM
8324                     	xdef	_TIM1_SelectOCREFClear
8325                     	xdef	_TIM1_OC3NPolarityConfig
8326                     	xdef	_TIM1_OC3PolarityConfig
8327                     	xdef	_TIM1_OC2NPolarityConfig
8328                     	xdef	_TIM1_OC2PolarityConfig
8329                     	xdef	_TIM1_OC1NPolarityConfig
8330                     	xdef	_TIM1_OC1PolarityConfig
8331                     	xdef	_TIM1_ClearOC4Ref
8332                     	xdef	_TIM1_ClearOC3Ref
8333                     	xdef	_TIM1_ClearOC2Ref
8334                     	xdef	_TIM1_ClearOC1Ref
8335                     	xdef	_TIM1_OC3FastConfig
8336                     	xdef	_TIM1_OC2FastConfig
8337                     	xdef	_TIM1_OC1FastConfig
8338                     	xdef	_TIM1_OC4PreloadConfig
8339                     	xdef	_TIM1_OC3PreloadConfig
8340                     	xdef	_TIM1_OC2PreloadConfig
8341                     	xdef	_TIM1_OC1PreloadConfig
8342                     	xdef	_TIM1_ForcedOC3Config
8343                     	xdef	_TIM1_ForcedOC2Config
8344                     	xdef	_TIM1_ForcedOC1Config
8345                     	xdef	_TIM1_CCPreloadControl
8346                     	xdef	_TIM1_SetCompare4
8347                     	xdef	_TIM1_SetCompare3
8348                     	xdef	_TIM1_SetCompare2
8349                     	xdef	_TIM1_SetCompare1
8350                     	xdef	_TIM1_SelectOCxM
8351                     	xdef	_TIM1_CtrlPWMOutputs
8352                     	xdef	_TIM1_BDTRConfig
8353                     	xdef	_TIM1_OC3Init
8354                     	xdef	_TIM1_OC2Init
8355                     	xdef	_TIM1_OC1Init
8356                     	xdef	_TIM1_Cmd
8357                     	xdef	_TIM1_SelectOnePulseMode
8358                     	xdef	_TIM1_ARRPreloadConfig
8359                     	xdef	_TIM1_UpdateRequestConfig
8360                     	xdef	_TIM1_UpdateDisableConfig
8361                     	xdef	_TIM1_GetPrescaler
8362                     	xdef	_TIM1_GetCounter
8363                     	xdef	_TIM1_SetAutoreload
8364                     	xdef	_TIM1_SetCounter
8365                     	xdef	_TIM1_CounterModeConfig
8366                     	xdef	_TIM1_PrescalerConfig
8367                     	xdef	_TIM1_TimeBaseInit
8368                     	xdef	_TIM1_DeInit
8387                     	end
