   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 175 void TIM1_DeInit(void)
  32                     ; 176 {
  34                     .text:	section	.text,new
  35  0000               _TIM1_DeInit:
  39                     ; 177   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  41  0000 725f52b0      	clr	21168
  42                     ; 178   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  44  0004 725f52b1      	clr	21169
  45                     ; 179   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  47  0008 725f52b2      	clr	21170
  48                     ; 180   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  50  000c 725f52b3      	clr	21171
  51                     ; 181   TIM1->IER  = TIM1_IER_RESET_VALUE;
  53  0010 725f52b5      	clr	21173
  54                     ; 184   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  56  0014 725f52bd      	clr	21181
  57                     ; 185   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  59  0018 725f52be      	clr	21182
  60                     ; 187   TIM1->CCMR1 = 0x01;
  62  001c 350152b9      	mov	21177,#1
  63                     ; 188   TIM1->CCMR2 = 0x01;
  65  0020 350152ba      	mov	21178,#1
  66                     ; 189   TIM1->CCMR3 = 0x01;
  68  0024 350152bb      	mov	21179,#1
  69                     ; 190   TIM1->CCMR4 = 0x01;
  71  0028 350152bc      	mov	21180,#1
  72                     ; 192   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  002c 725f52bd      	clr	21181
  75                     ; 193   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  0030 725f52be      	clr	21182
  78                     ; 194   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  80  0034 725f52b9      	clr	21177
  81                     ; 195   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  83  0038 725f52ba      	clr	21178
  84                     ; 196   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  86  003c 725f52bb      	clr	21179
  87                     ; 197   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  89  0040 725f52bc      	clr	21180
  90                     ; 198   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  92  0044 725f52bf      	clr	21183
  93                     ; 199   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  95  0048 725f52c0      	clr	21184
  96                     ; 200   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  98  004c 725f52c1      	clr	21185
  99                     ; 201   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 101  0050 725f52c2      	clr	21186
 102                     ; 202   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 104  0054 35ff52c3      	mov	21187,#255
 105                     ; 203   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 107  0058 35ff52c4      	mov	21188,#255
 108                     ; 204   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 110  005c 725f52c6      	clr	21190
 111                     ; 205   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 113  0060 725f52c7      	clr	21191
 114                     ; 206   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 116  0064 725f52c8      	clr	21192
 117                     ; 207   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 119  0068 725f52c9      	clr	21193
 120                     ; 208   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 122  006c 725f52ca      	clr	21194
 123                     ; 209   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 125  0070 725f52cb      	clr	21195
 126                     ; 210   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 128  0074 725f52cc      	clr	21196
 129                     ; 211   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 131  0078 725f52cd      	clr	21197
 132                     ; 212   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 134  007c 725f52d0      	clr	21200
 135                     ; 213   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 137  0080 350152b8      	mov	21176,#1
 138                     ; 214   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 140  0084 725f52cf      	clr	21199
 141                     ; 215   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 143  0088 725f52ce      	clr	21198
 144                     ; 216   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 146  008c 725f52c5      	clr	21189
 147                     ; 217   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 149  0090 725f52b6      	clr	21174
 150                     ; 218   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 152  0094 725f52b7      	clr	21175
 153                     ; 219 }
 156  0098 81            	ret
 259                     ; 235 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 259                     ; 236                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 259                     ; 237                        uint16_t TIM1_Period,
 259                     ; 238                        uint8_t TIM1_RepetitionCounter)
 259                     ; 239 {
 260                     .text:	section	.text,new
 261  0000               _TIM1_TimeBaseInit:
 263  0000 89            	pushw	x
 264       00000000      OFST:	set	0
 267                     ; 241   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 269                     ; 245   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 271  0001 7b06          	ld	a,(OFST+6,sp)
 272  0003 c752c3        	ld	21187,a
 273                     ; 246   TIM1->ARRL = (uint8_t)(TIM1_Period);
 275  0006 7b07          	ld	a,(OFST+7,sp)
 276  0008 c752c4        	ld	21188,a
 277                     ; 249   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 279  000b 9e            	ld	a,xh
 280  000c c752c1        	ld	21185,a
 281                     ; 250   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 283  000f 9f            	ld	a,xl
 284  0010 c752c2        	ld	21186,a
 285                     ; 253   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 285                     ; 254                         | (uint8_t)(TIM1_CounterMode));
 287  0013 c652b0        	ld	a,21168
 288  0016 a48f          	and	a,#143
 289  0018 1a05          	or	a,(OFST+5,sp)
 290  001a c752b0        	ld	21168,a
 291                     ; 257   TIM1->RCR = TIM1_RepetitionCounter;
 293  001d 7b08          	ld	a,(OFST+8,sp)
 294  001f c752c5        	ld	21189,a
 295                     ; 259 }
 298  0022 85            	popw	x
 299  0023 81            	ret
 364                     ; 273 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 364                     ; 274 {
 365                     .text:	section	.text,new
 366  0000               _TIM1_PrescalerConfig:
 368  0000 89            	pushw	x
 369       00000000      OFST:	set	0
 372                     ; 276   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 374                     ; 279   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 376  0001 9e            	ld	a,xh
 377  0002 c752c1        	ld	21185,a
 378                     ; 280   TIM1->PSCRL = (uint8_t)(Prescaler);
 380  0005 9f            	ld	a,xl
 381  0006 c752c2        	ld	21186,a
 382                     ; 283   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 384  0009 7b05          	ld	a,(OFST+5,sp)
 385  000b c752b8        	ld	21176,a
 386                     ; 284 }
 389  000e 85            	popw	x
 390  000f 81            	ret
 426                     ; 297 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 426                     ; 298 {
 427                     .text:	section	.text,new
 428  0000               _TIM1_CounterModeConfig:
 430  0000 88            	push	a
 431       00000000      OFST:	set	0
 434                     ; 300   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 436                     ; 304   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 436                     ; 305                         | (uint8_t)TIM1_CounterMode);
 438  0001 c652b0        	ld	a,21168
 439  0004 a48f          	and	a,#143
 440  0006 1a01          	or	a,(OFST+1,sp)
 441  0008 c752b0        	ld	21168,a
 442                     ; 306 }
 445  000b 84            	pop	a
 446  000c 81            	ret
 478                     ; 314 void TIM1_SetCounter(uint16_t Counter)
 478                     ; 315 {
 479                     .text:	section	.text,new
 480  0000               _TIM1_SetCounter:
 484                     ; 317   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 486  0000 9e            	ld	a,xh
 487  0001 c752bf        	ld	21183,a
 488                     ; 318   TIM1->CNTRL = (uint8_t)(Counter);
 490  0004 9f            	ld	a,xl
 491  0005 c752c0        	ld	21184,a
 492                     ; 319 }
 495  0008 81            	ret
 527                     ; 327 void TIM1_SetAutoreload(uint16_t Autoreload)
 527                     ; 328 {
 528                     .text:	section	.text,new
 529  0000               _TIM1_SetAutoreload:
 533                     ; 330   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 535  0000 9e            	ld	a,xh
 536  0001 c752c3        	ld	21187,a
 537                     ; 331   TIM1->ARRL = (uint8_t)(Autoreload);
 539  0004 9f            	ld	a,xl
 540  0005 c752c4        	ld	21188,a
 541                     ; 332 }
 544  0008 81            	ret
 590                     ; 339 uint16_t TIM1_GetCounter(void)
 590                     ; 340 {
 591                     .text:	section	.text,new
 592  0000               _TIM1_GetCounter:
 594  0000 5204          	subw	sp,#4
 595       00000004      OFST:	set	4
 598                     ; 342   uint16_t tmpcntr = 0;
 600  0002 1e03          	ldw	x,(OFST-1,sp)
 601                     ; 343   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 603  0004 7b01          	ld	a,(OFST-3,sp)
 604  0006 97            	ld	xl,a
 607  0007 7b02          	ld	a,(OFST-2,sp)
 608  0009 97            	ld	xl,a
 609                     ; 345   tmpcntrh = TIM1->CNTRH;
 611  000a c652bf        	ld	a,21183
 612  000d 6b02          	ld	(OFST-2,sp),a
 613                     ; 346   tmpcntrl = TIM1->CNTRL;
 615  000f c652c0        	ld	a,21184
 616  0012 6b01          	ld	(OFST-3,sp),a
 617                     ; 348   tmpcntr  = (uint16_t)(tmpcntrl);
 619  0014 7b01          	ld	a,(OFST-3,sp)
 620  0016 5f            	clrw	x
 621  0017 97            	ld	xl,a
 622  0018 1f03          	ldw	(OFST-1,sp),x
 623                     ; 349   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 625  001a 7b02          	ld	a,(OFST-2,sp)
 626  001c 5f            	clrw	x
 627  001d 97            	ld	xl,a
 628  001e 4f            	clr	a
 629  001f 02            	rlwa	x,a
 630  0020 01            	rrwa	x,a
 631  0021 1a04          	or	a,(OFST+0,sp)
 632  0023 01            	rrwa	x,a
 633  0024 1a03          	or	a,(OFST-1,sp)
 634  0026 01            	rrwa	x,a
 635  0027 1f03          	ldw	(OFST-1,sp),x
 636                     ; 352   return (uint16_t)tmpcntr;
 638  0029 1e03          	ldw	x,(OFST-1,sp)
 641  002b 5b04          	addw	sp,#4
 642  002d 81            	ret
 674                     ; 360 uint16_t TIM1_GetPrescaler(void)
 674                     ; 361 {
 675                     .text:	section	.text,new
 676  0000               _TIM1_GetPrescaler:
 678  0000 89            	pushw	x
 679       00000002      OFST:	set	2
 682                     ; 362   uint16_t tmpreg = 0;
 684  0001 5f            	clrw	x
 685  0002 1f01          	ldw	(OFST-1,sp),x
 686                     ; 363   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 688  0004 c652c1        	ld	a,21185
 689  0007 5f            	clrw	x
 690  0008 97            	ld	xl,a
 691  0009 4f            	clr	a
 692  000a 02            	rlwa	x,a
 693  000b 1f01          	ldw	(OFST-1,sp),x
 694                     ; 365   return (uint16_t)(tmpreg | TIM1->PSCRL);
 696  000d c652c2        	ld	a,21186
 697  0010 5f            	clrw	x
 698  0011 97            	ld	xl,a
 699  0012 01            	rrwa	x,a
 700  0013 1a02          	or	a,(OFST+0,sp)
 701  0015 01            	rrwa	x,a
 702  0016 1a01          	or	a,(OFST-1,sp)
 703  0018 01            	rrwa	x,a
 706  0019 5b02          	addw	sp,#2
 707  001b 81            	ret
 763                     ; 374 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 763                     ; 375 {
 764                     .text:	section	.text,new
 765  0000               _TIM1_UpdateDisableConfig:
 769                     ; 377   assert_param(IS_FUNCTIONAL_STATE(NewState));
 771                     ; 380   if (NewState != DISABLE)
 773  0000 4d            	tnz	a
 774  0001 2706          	jreq	L352
 775                     ; 382     TIM1->CR1 |= TIM1_CR1_UDIS;
 777  0003 721252b0      	bset	21168,#1
 779  0007 2004          	jra	L552
 780  0009               L352:
 781                     ; 386     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 783  0009 721352b0      	bres	21168,#1
 784  000d               L552:
 785                     ; 388 }
 788  000d 81            	ret
 846                     ; 398 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 846                     ; 399 {
 847                     .text:	section	.text,new
 848  0000               _TIM1_UpdateRequestConfig:
 852                     ; 401   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 854                     ; 404   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 856  0000 4d            	tnz	a
 857  0001 2706          	jreq	L503
 858                     ; 406     TIM1->CR1 |= TIM1_CR1_URS;
 860  0003 721452b0      	bset	21168,#2
 862  0007 2004          	jra	L703
 863  0009               L503:
 864                     ; 410     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 866  0009 721552b0      	bres	21168,#2
 867  000d               L703:
 868                     ; 412 }
 871  000d 81            	ret
 907                     ; 420 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 907                     ; 421 {
 908                     .text:	section	.text,new
 909  0000               _TIM1_ARRPreloadConfig:
 913                     ; 423   assert_param(IS_FUNCTIONAL_STATE(NewState));
 915                     ; 426   if (NewState != DISABLE)
 917  0000 4d            	tnz	a
 918  0001 2706          	jreq	L723
 919                     ; 428     TIM1->CR1 |= TIM1_CR1_ARPE;
 921  0003 721e52b0      	bset	21168,#7
 923  0007 2004          	jra	L133
 924  0009               L723:
 925                     ; 432     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 927  0009 721f52b0      	bres	21168,#7
 928  000d               L133:
 929                     ; 434 }
 932  000d 81            	ret
 989                     ; 444 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 989                     ; 445 {
 990                     .text:	section	.text,new
 991  0000               _TIM1_SelectOnePulseMode:
 995                     ; 447   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 997                     ; 450   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 999  0000 4d            	tnz	a
1000  0001 2706          	jreq	L163
1001                     ; 452     TIM1->CR1 |= TIM1_CR1_OPM;
1003  0003 721652b0      	bset	21168,#3
1005  0007 2004          	jra	L363
1006  0009               L163:
1007                     ; 456     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1009  0009 721752b0      	bres	21168,#3
1010  000d               L363:
1011                     ; 458 }
1014  000d 81            	ret
1049                     ; 466 void TIM1_Cmd(FunctionalState NewState)
1049                     ; 467 {
1050                     .text:	section	.text,new
1051  0000               _TIM1_Cmd:
1055                     ; 469   assert_param(IS_FUNCTIONAL_STATE(NewState));
1057                     ; 472   if (NewState != DISABLE)
1059  0000 4d            	tnz	a
1060  0001 2706          	jreq	L304
1061                     ; 474     TIM1->CR1 |= TIM1_CR1_CEN;
1063  0003 721052b0      	bset	21168,#0
1065  0007 2004          	jra	L504
1066  0009               L304:
1067                     ; 478     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1069  0009 721152b0      	bres	21168,#0
1070  000d               L504:
1071                     ; 480 }
1074  000d 81            	ret
1357                     ; 571 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1357                     ; 572                   TIM1_OutputState_TypeDef TIM1_OutputState,
1357                     ; 573                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1357                     ; 574                   uint16_t TIM1_Pulse,
1357                     ; 575                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1357                     ; 576                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1357                     ; 577                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1357                     ; 578                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1357                     ; 579 {
1358                     .text:	section	.text,new
1359  0000               _TIM1_OC1Init:
1361  0000 89            	pushw	x
1362  0001 5203          	subw	sp,#3
1363       00000003      OFST:	set	3
1366                     ; 581   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1368                     ; 582   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1370                     ; 583   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1372                     ; 584   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1374                     ; 585   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1376                     ; 586   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1378                     ; 587   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1380                     ; 591   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1380                     ; 592                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1382  0003 c652bd        	ld	a,21181
1383  0006 a4f0          	and	a,#240
1384  0008 c752bd        	ld	21181,a
1385                     ; 595   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1385                     ; 596                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1385                     ; 597                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1385                     ; 598                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1387  000b 7b0c          	ld	a,(OFST+9,sp)
1388  000d a408          	and	a,#8
1389  000f 6b03          	ld	(OFST+0,sp),a
1390  0011 7b0b          	ld	a,(OFST+8,sp)
1391  0013 a402          	and	a,#2
1392  0015 1a03          	or	a,(OFST+0,sp)
1393  0017 6b02          	ld	(OFST-1,sp),a
1394  0019 7b08          	ld	a,(OFST+5,sp)
1395  001b a404          	and	a,#4
1396  001d 6b01          	ld	(OFST-2,sp),a
1397  001f 9f            	ld	a,xl
1398  0020 a401          	and	a,#1
1399  0022 1a01          	or	a,(OFST-2,sp)
1400  0024 1a02          	or	a,(OFST-1,sp)
1401  0026 ca52bd        	or	a,21181
1402  0029 c752bd        	ld	21181,a
1403                     ; 601   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1403                     ; 602                           | (uint8_t)TIM1_OCMode);
1405  002c c652b9        	ld	a,21177
1406  002f a48f          	and	a,#143
1407  0031 1a04          	or	a,(OFST+1,sp)
1408  0033 c752b9        	ld	21177,a
1409                     ; 605   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1411  0036 c652d0        	ld	a,21200
1412  0039 a4fc          	and	a,#252
1413  003b c752d0        	ld	21200,a
1414                     ; 607   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1414                     ; 608                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1416  003e 7b0e          	ld	a,(OFST+11,sp)
1417  0040 a402          	and	a,#2
1418  0042 6b03          	ld	(OFST+0,sp),a
1419  0044 7b0d          	ld	a,(OFST+10,sp)
1420  0046 a401          	and	a,#1
1421  0048 1a03          	or	a,(OFST+0,sp)
1422  004a ca52d0        	or	a,21200
1423  004d c752d0        	ld	21200,a
1424                     ; 611   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1426  0050 7b09          	ld	a,(OFST+6,sp)
1427  0052 c752c6        	ld	21190,a
1428                     ; 612   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1430  0055 7b0a          	ld	a,(OFST+7,sp)
1431  0057 c752c7        	ld	21191,a
1432                     ; 613 }
1435  005a 5b05          	addw	sp,#5
1436  005c 81            	ret
1538                     ; 652 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1538                     ; 653                   TIM1_OutputState_TypeDef TIM1_OutputState,
1538                     ; 654                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1538                     ; 655                   uint16_t TIM1_Pulse,
1538                     ; 656                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1538                     ; 657                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1538                     ; 658                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1538                     ; 659                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1538                     ; 660 {
1539                     .text:	section	.text,new
1540  0000               _TIM1_OC2Init:
1542  0000 89            	pushw	x
1543  0001 5203          	subw	sp,#3
1544       00000003      OFST:	set	3
1547                     ; 663   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1549                     ; 664   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1551                     ; 665   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1553                     ; 666   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1555                     ; 667   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1557                     ; 668   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1559                     ; 669   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1561                     ; 673   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1563  0003 c652bd        	ld	a,21181
1564  0006 a40f          	and	a,#15
1565  0008 c752bd        	ld	21181,a
1566                     ; 676   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1566                     ; 677                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1568  000b 7b0c          	ld	a,(OFST+9,sp)
1569  000d a480          	and	a,#128
1570  000f 6b03          	ld	(OFST+0,sp),a
1571  0011 7b0b          	ld	a,(OFST+8,sp)
1572  0013 a420          	and	a,#32
1573  0015 1a03          	or	a,(OFST+0,sp)
1574  0017 6b02          	ld	(OFST-1,sp),a
1575  0019 7b08          	ld	a,(OFST+5,sp)
1576  001b a440          	and	a,#64
1577  001d 6b01          	ld	(OFST-2,sp),a
1578  001f 9f            	ld	a,xl
1579  0020 a410          	and	a,#16
1580  0022 1a01          	or	a,(OFST-2,sp)
1581  0024 1a02          	or	a,(OFST-1,sp)
1582  0026 ca52bd        	or	a,21181
1583  0029 c752bd        	ld	21181,a
1584                     ; 680   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1586  002c c652ba        	ld	a,21178
1587  002f a48f          	and	a,#143
1588  0031 1a04          	or	a,(OFST+1,sp)
1589  0033 c752ba        	ld	21178,a
1590                     ; 683   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1592  0036 c652d0        	ld	a,21200
1593  0039 a4f3          	and	a,#243
1594  003b c752d0        	ld	21200,a
1595                     ; 685   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1597  003e 7b0e          	ld	a,(OFST+11,sp)
1598  0040 a408          	and	a,#8
1599  0042 6b03          	ld	(OFST+0,sp),a
1600  0044 7b0d          	ld	a,(OFST+10,sp)
1601  0046 a404          	and	a,#4
1602  0048 1a03          	or	a,(OFST+0,sp)
1603  004a ca52d0        	or	a,21200
1604  004d c752d0        	ld	21200,a
1605                     ; 688   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1607  0050 7b09          	ld	a,(OFST+6,sp)
1608  0052 c752c8        	ld	21192,a
1609                     ; 689   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1611  0055 7b0a          	ld	a,(OFST+7,sp)
1612  0057 c752c9        	ld	21193,a
1613                     ; 690 }
1616  005a 5b05          	addw	sp,#5
1617  005c 81            	ret
1719                     ; 729 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1719                     ; 730                   TIM1_OutputState_TypeDef TIM1_OutputState,
1719                     ; 731                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1719                     ; 732                   uint16_t TIM1_Pulse,
1719                     ; 733                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1719                     ; 734                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1719                     ; 735                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1719                     ; 736                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1719                     ; 737 {
1720                     .text:	section	.text,new
1721  0000               _TIM1_OC3Init:
1723  0000 89            	pushw	x
1724  0001 5203          	subw	sp,#3
1725       00000003      OFST:	set	3
1728                     ; 740   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1730                     ; 741   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1732                     ; 742   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1734                     ; 743   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1736                     ; 744   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1738                     ; 745   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1740                     ; 746   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1742                     ; 750   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1744  0003 c652be        	ld	a,21182
1745  0006 a4f0          	and	a,#240
1746  0008 c752be        	ld	21182,a
1747                     ; 753   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1747                     ; 754                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1749  000b 7b0c          	ld	a,(OFST+9,sp)
1750  000d a408          	and	a,#8
1751  000f 6b03          	ld	(OFST+0,sp),a
1752  0011 7b0b          	ld	a,(OFST+8,sp)
1753  0013 a402          	and	a,#2
1754  0015 1a03          	or	a,(OFST+0,sp)
1755  0017 6b02          	ld	(OFST-1,sp),a
1756  0019 7b08          	ld	a,(OFST+5,sp)
1757  001b a404          	and	a,#4
1758  001d 6b01          	ld	(OFST-2,sp),a
1759  001f 9f            	ld	a,xl
1760  0020 a401          	and	a,#1
1761  0022 1a01          	or	a,(OFST-2,sp)
1762  0024 1a02          	or	a,(OFST-1,sp)
1763  0026 ca52be        	or	a,21182
1764  0029 c752be        	ld	21182,a
1765                     ; 757   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1767  002c c652bb        	ld	a,21179
1768  002f a48f          	and	a,#143
1769  0031 1a04          	or	a,(OFST+1,sp)
1770  0033 c752bb        	ld	21179,a
1771                     ; 760   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1773  0036 c652d0        	ld	a,21200
1774  0039 a4cf          	and	a,#207
1775  003b c752d0        	ld	21200,a
1776                     ; 762   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1778  003e 7b0e          	ld	a,(OFST+11,sp)
1779  0040 a420          	and	a,#32
1780  0042 6b03          	ld	(OFST+0,sp),a
1781  0044 7b0d          	ld	a,(OFST+10,sp)
1782  0046 a410          	and	a,#16
1783  0048 1a03          	or	a,(OFST+0,sp)
1784  004a ca52d0        	or	a,21200
1785  004d c752d0        	ld	21200,a
1786                     ; 765   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1788  0050 7b09          	ld	a,(OFST+6,sp)
1789  0052 c752ca        	ld	21194,a
1790                     ; 766   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1792  0055 7b0a          	ld	a,(OFST+7,sp)
1793  0057 c752cb        	ld	21195,a
1794                     ; 767 }
1797  005a 5b05          	addw	sp,#5
1798  005c 81            	ret
2003                     ; 797 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2003                     ; 798                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2003                     ; 799                      uint8_t TIM1_DeadTime,
2003                     ; 800                      TIM1_BreakState_TypeDef TIM1_Break,
2003                     ; 801                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2003                     ; 802                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2003                     ; 803 {
2004                     .text:	section	.text,new
2005  0000               _TIM1_BDTRConfig:
2007  0000 89            	pushw	x
2008  0001 88            	push	a
2009       00000001      OFST:	set	1
2012                     ; 806   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2014                     ; 807   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2016                     ; 808   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2018                     ; 809   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2020                     ; 810   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2022                     ; 812   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2024  0002 7b06          	ld	a,(OFST+5,sp)
2025  0004 c752cf        	ld	21199,a
2026                     ; 816   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2026                     ; 817                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2026                     ; 818                                       | (uint8_t)TIM1_AutomaticOutput));
2028  0007 7b07          	ld	a,(OFST+6,sp)
2029  0009 1a08          	or	a,(OFST+7,sp)
2030  000b 1a09          	or	a,(OFST+8,sp)
2031  000d 6b01          	ld	(OFST+0,sp),a
2032  000f 9f            	ld	a,xl
2033  0010 1a02          	or	a,(OFST+1,sp)
2034  0012 1a01          	or	a,(OFST+0,sp)
2035  0014 c752ce        	ld	21198,a
2036                     ; 820 }
2039  0017 5b03          	addw	sp,#3
2040  0019 81            	ret
2076                     ; 828 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2076                     ; 829 {
2077                     .text:	section	.text,new
2078  0000               _TIM1_CtrlPWMOutputs:
2082                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2084                     ; 835   if (NewState != DISABLE)
2086  0000 4d            	tnz	a
2087  0001 2706          	jreq	L1301
2088                     ; 837     TIM1->BKR |= TIM1_BKR_MOE;
2090  0003 721e52ce      	bset	21198,#7
2092  0007 2004          	jra	L3301
2093  0009               L1301:
2094                     ; 841     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2096  0009 721f52ce      	bres	21198,#7
2097  000d               L3301:
2098                     ; 843 }
2101  000d 81            	ret
2180                     ; 865 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2180                     ; 866 {
2181                     .text:	section	.text,new
2182  0000               _TIM1_SelectOCxM:
2184  0000 89            	pushw	x
2185       00000000      OFST:	set	0
2188                     ; 868   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2190                     ; 869   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2192                     ; 871   if (TIM1_Channel == TIM1_Channel_1)
2194  0001 9e            	ld	a,xh
2195  0002 4d            	tnz	a
2196  0003 2610          	jrne	L3701
2197                     ; 874     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2199  0005 721152bd      	bres	21181,#0
2200                     ; 877     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2202  0009 c652b9        	ld	a,21177
2203  000c a48f          	and	a,#143
2204  000e 1a02          	or	a,(OFST+2,sp)
2205  0010 c752b9        	ld	21177,a
2207  0013 2024          	jra	L5701
2208  0015               L3701:
2209                     ; 879   else if (TIM1_Channel == TIM1_Channel_2)
2211  0015 7b01          	ld	a,(OFST+1,sp)
2212  0017 a101          	cp	a,#1
2213  0019 2610          	jrne	L7701
2214                     ; 882     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2216  001b 721952bd      	bres	21181,#4
2217                     ; 885     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2219  001f c652ba        	ld	a,21178
2220  0022 a48f          	and	a,#143
2221  0024 1a02          	or	a,(OFST+2,sp)
2222  0026 c752ba        	ld	21178,a
2224  0029 200e          	jra	L5701
2225  002b               L7701:
2226                     ; 890     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2228  002b 721152be      	bres	21182,#0
2229                     ; 893     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2231  002f c652bb        	ld	a,21179
2232  0032 a48f          	and	a,#143
2233  0034 1a02          	or	a,(OFST+2,sp)
2234  0036 c752bb        	ld	21179,a
2235  0039               L5701:
2236                     ; 896 }
2239  0039 85            	popw	x
2240  003a 81            	ret
2272                     ; 904 void TIM1_SetCompare1(uint16_t Compare1)
2272                     ; 905 {
2273                     .text:	section	.text,new
2274  0000               _TIM1_SetCompare1:
2278                     ; 907   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2280  0000 9e            	ld	a,xh
2281  0001 c752c6        	ld	21190,a
2282                     ; 908   TIM1->CCR1L = (uint8_t)(Compare1);
2284  0004 9f            	ld	a,xl
2285  0005 c752c7        	ld	21191,a
2286                     ; 910 }
2289  0008 81            	ret
2321                     ; 918 void TIM1_SetCompare2(uint16_t Compare2)
2321                     ; 919 {
2322                     .text:	section	.text,new
2323  0000               _TIM1_SetCompare2:
2327                     ; 921   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2329  0000 9e            	ld	a,xh
2330  0001 c752c8        	ld	21192,a
2331                     ; 922   TIM1->CCR2L = (uint8_t)(Compare2);
2333  0004 9f            	ld	a,xl
2334  0005 c752c9        	ld	21193,a
2335                     ; 923 }
2338  0008 81            	ret
2370                     ; 931 void TIM1_SetCompare3(uint16_t Compare3)
2370                     ; 932 {
2371                     .text:	section	.text,new
2372  0000               _TIM1_SetCompare3:
2376                     ; 934   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2378  0000 9e            	ld	a,xh
2379  0001 c752ca        	ld	21194,a
2380                     ; 935   TIM1->CCR3L = (uint8_t)(Compare3);
2382  0004 9f            	ld	a,xl
2383  0005 c752cb        	ld	21195,a
2384                     ; 936 }
2387  0008 81            	ret
2419                     ; 944 void TIM1_SetCompare4(uint16_t Compare4)
2419                     ; 945 {
2420                     .text:	section	.text,new
2421  0000               _TIM1_SetCompare4:
2425                     ; 947   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2427  0000 9e            	ld	a,xh
2428  0001 c752cc        	ld	21196,a
2429                     ; 948   TIM1->CCR4L = (uint8_t)(Compare4);
2431  0004 9f            	ld	a,xl
2432  0005 c752cd        	ld	21197,a
2433                     ; 949 }
2436  0008 81            	ret
2472                     ; 957 void TIM1_CCPreloadControl(FunctionalState NewState)
2472                     ; 958 {
2473                     .text:	section	.text,new
2474  0000               _TIM1_CCPreloadControl:
2478                     ; 960   assert_param(IS_FUNCTIONAL_STATE(NewState));
2480                     ; 963   if (NewState != DISABLE)
2482  0000 4d            	tnz	a
2483  0001 2706          	jreq	L1021
2484                     ; 965     TIM1->CR2 |= TIM1_CR2_CCPC;
2486  0003 721052b1      	bset	21169,#0
2488  0007 2004          	jra	L3021
2489  0009               L1021:
2490                     ; 969     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2492  0009 721152b1      	bres	21169,#0
2493  000d               L3021:
2494                     ; 971 }
2497  000d 81            	ret
2555                     ; 981 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2555                     ; 982 {
2556                     .text:	section	.text,new
2557  0000               _TIM1_ForcedOC1Config:
2559  0000 88            	push	a
2560       00000000      OFST:	set	0
2563                     ; 984   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2565                     ; 987   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2567  0001 c652b9        	ld	a,21177
2568  0004 a48f          	and	a,#143
2569  0006 1a01          	or	a,(OFST+1,sp)
2570  0008 c752b9        	ld	21177,a
2571                     ; 988 }
2574  000b 84            	pop	a
2575  000c 81            	ret
2611                     ; 998 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2611                     ; 999 {
2612                     .text:	section	.text,new
2613  0000               _TIM1_ForcedOC2Config:
2615  0000 88            	push	a
2616       00000000      OFST:	set	0
2619                     ; 1001   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2621                     ; 1004   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2623  0001 c652ba        	ld	a,21178
2624  0004 a48f          	and	a,#143
2625  0006 1a01          	or	a,(OFST+1,sp)
2626  0008 c752ba        	ld	21178,a
2627                     ; 1005 }
2630  000b 84            	pop	a
2631  000c 81            	ret
2667                     ; 1015 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2667                     ; 1016 {
2668                     .text:	section	.text,new
2669  0000               _TIM1_ForcedOC3Config:
2671  0000 88            	push	a
2672       00000000      OFST:	set	0
2675                     ; 1018   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2677                     ; 1021   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2679  0001 c652bb        	ld	a,21179
2680  0004 a48f          	and	a,#143
2681  0006 1a01          	or	a,(OFST+1,sp)
2682  0008 c752bb        	ld	21179,a
2683                     ; 1022 }
2686  000b 84            	pop	a
2687  000c 81            	ret
2723                     ; 1030 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2723                     ; 1031 {
2724                     .text:	section	.text,new
2725  0000               _TIM1_OC1PreloadConfig:
2729                     ; 1033   assert_param(IS_FUNCTIONAL_STATE(NewState));
2731                     ; 1036   if (NewState != DISABLE)
2733  0000 4d            	tnz	a
2734  0001 2706          	jreq	L5031
2735                     ; 1038     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2737  0003 721652b9      	bset	21177,#3
2739  0007 2004          	jra	L7031
2740  0009               L5031:
2741                     ; 1042     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2743  0009 721752b9      	bres	21177,#3
2744  000d               L7031:
2745                     ; 1044 }
2748  000d 81            	ret
2784                     ; 1052 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2784                     ; 1053 {
2785                     .text:	section	.text,new
2786  0000               _TIM1_OC2PreloadConfig:
2790                     ; 1055   assert_param(IS_FUNCTIONAL_STATE(NewState));
2792                     ; 1058   if (NewState != DISABLE)
2794  0000 4d            	tnz	a
2795  0001 2706          	jreq	L7231
2796                     ; 1060     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2798  0003 721652ba      	bset	21178,#3
2800  0007 2004          	jra	L1331
2801  0009               L7231:
2802                     ; 1064     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2804  0009 721752ba      	bres	21178,#3
2805  000d               L1331:
2806                     ; 1066 }
2809  000d 81            	ret
2845                     ; 1074 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2845                     ; 1075 {
2846                     .text:	section	.text,new
2847  0000               _TIM1_OC3PreloadConfig:
2851                     ; 1077   assert_param(IS_FUNCTIONAL_STATE(NewState));
2853                     ; 1080   if (NewState != DISABLE)
2855  0000 4d            	tnz	a
2856  0001 2706          	jreq	L1531
2857                     ; 1082     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2859  0003 721652bb      	bset	21179,#3
2861  0007 2004          	jra	L3531
2862  0009               L1531:
2863                     ; 1086     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2865  0009 721752bb      	bres	21179,#3
2866  000d               L3531:
2867                     ; 1088 }
2870  000d 81            	ret
2906                     ; 1096 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2906                     ; 1097 {
2907                     .text:	section	.text,new
2908  0000               _TIM1_OC4PreloadConfig:
2912                     ; 1099   assert_param(IS_FUNCTIONAL_STATE(NewState));
2914                     ; 1102   if (NewState != DISABLE)
2916  0000 4d            	tnz	a
2917  0001 2706          	jreq	L3731
2918                     ; 1104     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2920  0003 721652bc      	bset	21180,#3
2922  0007 2004          	jra	L5731
2923  0009               L3731:
2924                     ; 1108     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2926  0009 721752bc      	bres	21180,#3
2927  000d               L5731:
2928                     ; 1110 }
2931  000d 81            	ret
2966                     ; 1118 void TIM1_OC1FastConfig(FunctionalState NewState)
2966                     ; 1119 {
2967                     .text:	section	.text,new
2968  0000               _TIM1_OC1FastConfig:
2972                     ; 1121   assert_param(IS_FUNCTIONAL_STATE(NewState));
2974                     ; 1124   if (NewState != DISABLE)
2976  0000 4d            	tnz	a
2977  0001 2706          	jreq	L5141
2978                     ; 1126     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2980  0003 721452b9      	bset	21177,#2
2982  0007 2004          	jra	L7141
2983  0009               L5141:
2984                     ; 1130     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2986  0009 721552b9      	bres	21177,#2
2987  000d               L7141:
2988                     ; 1132 }
2991  000d 81            	ret
3026                     ; 1140 void TIM1_OC2FastConfig(FunctionalState NewState)
3026                     ; 1141 {
3027                     .text:	section	.text,new
3028  0000               _TIM1_OC2FastConfig:
3032                     ; 1143   assert_param(IS_FUNCTIONAL_STATE(NewState));
3034                     ; 1146   if (NewState != DISABLE)
3036  0000 4d            	tnz	a
3037  0001 2706          	jreq	L7341
3038                     ; 1148     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3040  0003 721452ba      	bset	21178,#2
3042  0007 2004          	jra	L1441
3043  0009               L7341:
3044                     ; 1152     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3046  0009 721552ba      	bres	21178,#2
3047  000d               L1441:
3048                     ; 1154 }
3051  000d 81            	ret
3086                     ; 1162 void TIM1_OC3FastConfig(FunctionalState NewState)
3086                     ; 1163 {
3087                     .text:	section	.text,new
3088  0000               _TIM1_OC3FastConfig:
3092                     ; 1165   assert_param(IS_FUNCTIONAL_STATE(NewState));
3094                     ; 1168   if (NewState != DISABLE)
3096  0000 4d            	tnz	a
3097  0001 2706          	jreq	L1641
3098                     ; 1170     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3100  0003 721452bb      	bset	21179,#2
3102  0007 2004          	jra	L3641
3103  0009               L1641:
3104                     ; 1174     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3106  0009 721552bb      	bres	21179,#2
3107  000d               L3641:
3108                     ; 1176 }
3111  000d 81            	ret
3146                     ; 1184 void TIM1_ClearOC1Ref(FunctionalState NewState)
3146                     ; 1185 {
3147                     .text:	section	.text,new
3148  0000               _TIM1_ClearOC1Ref:
3152                     ; 1187   assert_param(IS_FUNCTIONAL_STATE(NewState));
3154                     ; 1190   if (NewState != DISABLE)
3156  0000 4d            	tnz	a
3157  0001 2706          	jreq	L3051
3158                     ; 1192     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3160  0003 721e52b9      	bset	21177,#7
3162  0007 2004          	jra	L5051
3163  0009               L3051:
3164                     ; 1196     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3166  0009 721f52b9      	bres	21177,#7
3167  000d               L5051:
3168                     ; 1198 }
3171  000d 81            	ret
3206                     ; 1206 void TIM1_ClearOC2Ref(FunctionalState NewState)
3206                     ; 1207 {
3207                     .text:	section	.text,new
3208  0000               _TIM1_ClearOC2Ref:
3212                     ; 1209   assert_param(IS_FUNCTIONAL_STATE(NewState));
3214                     ; 1212   if (NewState != DISABLE)
3216  0000 4d            	tnz	a
3217  0001 2706          	jreq	L5251
3218                     ; 1214     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3220  0003 721e52ba      	bset	21178,#7
3222  0007 2004          	jra	L7251
3223  0009               L5251:
3224                     ; 1218     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3226  0009 721f52ba      	bres	21178,#7
3227  000d               L7251:
3228                     ; 1220 }
3231  000d 81            	ret
3266                     ; 1228 void TIM1_ClearOC3Ref(FunctionalState NewState)
3266                     ; 1229 {
3267                     .text:	section	.text,new
3268  0000               _TIM1_ClearOC3Ref:
3272                     ; 1231   assert_param(IS_FUNCTIONAL_STATE(NewState));
3274                     ; 1234   if (NewState != DISABLE)
3276  0000 4d            	tnz	a
3277  0001 2706          	jreq	L7451
3278                     ; 1236     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3280  0003 721e52bb      	bset	21179,#7
3282  0007 2004          	jra	L1551
3283  0009               L7451:
3284                     ; 1240     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3286  0009 721f52bb      	bres	21179,#7
3287  000d               L1551:
3288                     ; 1242 }
3291  000d 81            	ret
3326                     ; 1250 void TIM1_ClearOC4Ref(FunctionalState NewState)
3326                     ; 1251 {
3327                     .text:	section	.text,new
3328  0000               _TIM1_ClearOC4Ref:
3332                     ; 1253   assert_param(IS_FUNCTIONAL_STATE(NewState));
3334                     ; 1256   if (NewState != DISABLE)
3336  0000 4d            	tnz	a
3337  0001 2706          	jreq	L1751
3338                     ; 1258     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3340  0003 721e52bc      	bset	21180,#7
3342  0007 2004          	jra	L3751
3343  0009               L1751:
3344                     ; 1262     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3346  0009 721f52bc      	bres	21180,#7
3347  000d               L3751:
3348                     ; 1264 }
3351  000d 81            	ret
3387                     ; 1274 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3387                     ; 1275 {
3388                     .text:	section	.text,new
3389  0000               _TIM1_OC1PolarityConfig:
3393                     ; 1277   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3395                     ; 1280   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3397  0000 4d            	tnz	a
3398  0001 2706          	jreq	L3161
3399                     ; 1282     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3401  0003 721252bd      	bset	21181,#1
3403  0007 2004          	jra	L5161
3404  0009               L3161:
3405                     ; 1286     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3407  0009 721352bd      	bres	21181,#1
3408  000d               L5161:
3409                     ; 1288 }
3412  000d 81            	ret
3448                     ; 1298 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3448                     ; 1299 {
3449                     .text:	section	.text,new
3450  0000               _TIM1_OC1NPolarityConfig:
3454                     ; 1301   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3456                     ; 1304   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3458  0000 4d            	tnz	a
3459  0001 2706          	jreq	L5361
3460                     ; 1306     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3462  0003 721652bd      	bset	21181,#3
3464  0007 2004          	jra	L7361
3465  0009               L5361:
3466                     ; 1310     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3468  0009 721752bd      	bres	21181,#3
3469  000d               L7361:
3470                     ; 1312 }
3473  000d 81            	ret
3509                     ; 1322 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3509                     ; 1323 {
3510                     .text:	section	.text,new
3511  0000               _TIM1_OC2PolarityConfig:
3515                     ; 1325   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3517                     ; 1328   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3519  0000 4d            	tnz	a
3520  0001 2706          	jreq	L7561
3521                     ; 1330     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3523  0003 721a52bd      	bset	21181,#5
3525  0007 2004          	jra	L1661
3526  0009               L7561:
3527                     ; 1334     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3529  0009 721b52bd      	bres	21181,#5
3530  000d               L1661:
3531                     ; 1336 }
3534  000d 81            	ret
3570                     ; 1346 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3570                     ; 1347 {
3571                     .text:	section	.text,new
3572  0000               _TIM1_OC2NPolarityConfig:
3576                     ; 1349   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3578                     ; 1352   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3580  0000 4d            	tnz	a
3581  0001 2706          	jreq	L1071
3582                     ; 1354     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3584  0003 721e52bd      	bset	21181,#7
3586  0007 2004          	jra	L3071
3587  0009               L1071:
3588                     ; 1358     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3590  0009 721f52bd      	bres	21181,#7
3591  000d               L3071:
3592                     ; 1360 }
3595  000d 81            	ret
3631                     ; 1370 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3631                     ; 1371 {
3632                     .text:	section	.text,new
3633  0000               _TIM1_OC3PolarityConfig:
3637                     ; 1373   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3639                     ; 1376   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3641  0000 4d            	tnz	a
3642  0001 2706          	jreq	L3271
3643                     ; 1378     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3645  0003 721252be      	bset	21182,#1
3647  0007 2004          	jra	L5271
3648  0009               L3271:
3649                     ; 1382     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3651  0009 721352be      	bres	21182,#1
3652  000d               L5271:
3653                     ; 1384 }
3656  000d 81            	ret
3692                     ; 1394 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3692                     ; 1395 {
3693                     .text:	section	.text,new
3694  0000               _TIM1_OC3NPolarityConfig:
3698                     ; 1397   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3700                     ; 1400   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3702  0000 4d            	tnz	a
3703  0001 2706          	jreq	L5471
3704                     ; 1402     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3706  0003 721652be      	bset	21182,#3
3708  0007 2004          	jra	L7471
3709  0009               L5471:
3710                     ; 1406     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3712  0009 721752be      	bres	21182,#3
3713  000d               L7471:
3714                     ; 1408 }
3717  000d 81            	ret
3776                     ; 1418 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3776                     ; 1419 {
3777                     .text:	section	.text,new
3778  0000               _TIM1_SelectOCREFClear:
3782                     ; 1421   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3784                     ; 1424   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3786  0000 721752b2      	bres	21170,#3
3787                     ; 1425   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3789  0004 ca52b2        	or	a,21170
3790  0007 c752b2        	ld	21170,a
3791                     ; 1426 }
3794  000a 81            	ret
3829                     ; 1434 void TIM1_SelectCOM(FunctionalState NewState)
3829                     ; 1435 {
3830                     .text:	section	.text,new
3831  0000               _TIM1_SelectCOM:
3835                     ; 1437   assert_param(IS_FUNCTIONAL_STATE(NewState));
3837                     ; 1440   if (NewState != DISABLE)
3839  0000 4d            	tnz	a
3840  0001 2706          	jreq	L5102
3841                     ; 1442     TIM1->CR2 |= TIM1_CR2_CCUS;
3843  0003 721452b1      	bset	21169,#2
3845  0007 2004          	jra	L7102
3846  0009               L5102:
3847                     ; 1446     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3849  0009 721552b1      	bres	21169,#2
3850  000d               L7102:
3851                     ; 1448 }
3854  000d 81            	ret
3899                     ; 1462 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3899                     ; 1463 {
3900                     .text:	section	.text,new
3901  0000               _TIM1_CCxCmd:
3903  0000 89            	pushw	x
3904       00000000      OFST:	set	0
3907                     ; 1465   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3909                     ; 1466   assert_param(IS_FUNCTIONAL_STATE(NewState));
3911                     ; 1468   if (TIM1_Channel == TIM1_Channel_1)
3913  0001 9e            	ld	a,xh
3914  0002 4d            	tnz	a
3915  0003 2610          	jrne	L3402
3916                     ; 1471     if (NewState != DISABLE)
3918  0005 9f            	ld	a,xl
3919  0006 4d            	tnz	a
3920  0007 2706          	jreq	L5402
3921                     ; 1473       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3923  0009 721052bd      	bset	21181,#0
3925  000d 2040          	jra	L1502
3926  000f               L5402:
3927                     ; 1477       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3929  000f 721152bd      	bres	21181,#0
3930  0013 203a          	jra	L1502
3931  0015               L3402:
3932                     ; 1480   else if (TIM1_Channel == TIM1_Channel_2)
3934  0015 7b01          	ld	a,(OFST+1,sp)
3935  0017 a101          	cp	a,#1
3936  0019 2610          	jrne	L3502
3937                     ; 1483     if (NewState != DISABLE)
3939  001b 0d02          	tnz	(OFST+2,sp)
3940  001d 2706          	jreq	L5502
3941                     ; 1485       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3943  001f 721852bd      	bset	21181,#4
3945  0023 202a          	jra	L1502
3946  0025               L5502:
3947                     ; 1489       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3949  0025 721952bd      	bres	21181,#4
3950  0029 2024          	jra	L1502
3951  002b               L3502:
3952                     ; 1492   else if (TIM1_Channel == TIM1_Channel_3)
3954  002b 7b01          	ld	a,(OFST+1,sp)
3955  002d a102          	cp	a,#2
3956  002f 2610          	jrne	L3602
3957                     ; 1495     if (NewState != DISABLE)
3959  0031 0d02          	tnz	(OFST+2,sp)
3960  0033 2706          	jreq	L5602
3961                     ; 1497       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3963  0035 721052be      	bset	21182,#0
3965  0039 2014          	jra	L1502
3966  003b               L5602:
3967                     ; 1501       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3969  003b 721152be      	bres	21182,#0
3970  003f 200e          	jra	L1502
3971  0041               L3602:
3972                     ; 1507     if (NewState != DISABLE)
3974  0041 0d02          	tnz	(OFST+2,sp)
3975  0043 2706          	jreq	L3702
3976                     ; 1509       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3978  0045 721852be      	bset	21182,#4
3980  0049 2004          	jra	L1502
3981  004b               L3702:
3982                     ; 1513       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3984  004b 721952be      	bres	21182,#4
3985  004f               L1502:
3986                     ; 1516 }
3989  004f 85            	popw	x
3990  0050 81            	ret
4035                     ; 1529 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4035                     ; 1530 {
4036                     .text:	section	.text,new
4037  0000               _TIM1_CCxNCmd:
4039  0000 89            	pushw	x
4040       00000000      OFST:	set	0
4043                     ; 1532   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4045                     ; 1533   assert_param(IS_FUNCTIONAL_STATE(NewState));
4047                     ; 1535   if (TIM1_Channel == TIM1_Channel_1)
4049  0001 9e            	ld	a,xh
4050  0002 4d            	tnz	a
4051  0003 2610          	jrne	L1212
4052                     ; 1538     if (NewState != DISABLE)
4054  0005 9f            	ld	a,xl
4055  0006 4d            	tnz	a
4056  0007 2706          	jreq	L3212
4057                     ; 1540       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4059  0009 721452bd      	bset	21181,#2
4061  000d 202a          	jra	L7212
4062  000f               L3212:
4063                     ; 1544       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4065  000f 721552bd      	bres	21181,#2
4066  0013 2024          	jra	L7212
4067  0015               L1212:
4068                     ; 1547   else if (TIM1_Channel == TIM1_Channel_2)
4070  0015 7b01          	ld	a,(OFST+1,sp)
4071  0017 a101          	cp	a,#1
4072  0019 2610          	jrne	L1312
4073                     ; 1550     if (NewState != DISABLE)
4075  001b 0d02          	tnz	(OFST+2,sp)
4076  001d 2706          	jreq	L3312
4077                     ; 1552       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4079  001f 721c52bd      	bset	21181,#6
4081  0023 2014          	jra	L7212
4082  0025               L3312:
4083                     ; 1556       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4085  0025 721d52bd      	bres	21181,#6
4086  0029 200e          	jra	L7212
4087  002b               L1312:
4088                     ; 1562     if (NewState != DISABLE)
4090  002b 0d02          	tnz	(OFST+2,sp)
4091  002d 2706          	jreq	L1412
4092                     ; 1564       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4094  002f 721452be      	bset	21182,#2
4096  0033 2004          	jra	L7212
4097  0035               L1412:
4098                     ; 1568       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4100  0035 721552be      	bres	21182,#2
4101  0039               L7212:
4102                     ; 1571 }
4105  0039 85            	popw	x
4106  003a 81            	ret
4272                     ; 1658 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4272                     ; 1659                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4272                     ; 1660                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4272                     ; 1661                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4272                     ; 1662                  uint8_t TIM1_ICFilter)
4272                     ; 1663 {
4273                     .text:	section	.text,new
4274  0000               _TIM1_ICInit:
4276  0000 89            	pushw	x
4277       00000000      OFST:	set	0
4280                     ; 1666   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4282                     ; 1667   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4284                     ; 1668   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4286                     ; 1669   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4288                     ; 1670   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4290                     ; 1672   if (TIM1_Channel == TIM1_Channel_1)
4292  0001 9e            	ld	a,xh
4293  0002 4d            	tnz	a
4294  0003 2614          	jrne	L7322
4295                     ; 1675     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4297  0005 7b07          	ld	a,(OFST+7,sp)
4298  0007 88            	push	a
4299  0008 7b06          	ld	a,(OFST+6,sp)
4300  000a 97            	ld	xl,a
4301  000b 7b03          	ld	a,(OFST+3,sp)
4302  000d 95            	ld	xh,a
4303  000e cd0000        	call	L3_TI1_Config
4305  0011 84            	pop	a
4306                     ; 1677     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4308  0012 7b06          	ld	a,(OFST+6,sp)
4309  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4312  0017 2046          	jra	L1422
4313  0019               L7322:
4314                     ; 1679   else if (TIM1_Channel == TIM1_Channel_2)
4316  0019 7b01          	ld	a,(OFST+1,sp)
4317  001b a101          	cp	a,#1
4318  001d 2614          	jrne	L3422
4319                     ; 1682     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4321  001f 7b07          	ld	a,(OFST+7,sp)
4322  0021 88            	push	a
4323  0022 7b06          	ld	a,(OFST+6,sp)
4324  0024 97            	ld	xl,a
4325  0025 7b03          	ld	a,(OFST+3,sp)
4326  0027 95            	ld	xh,a
4327  0028 cd0000        	call	L5_TI2_Config
4329  002b 84            	pop	a
4330                     ; 1684     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4332  002c 7b06          	ld	a,(OFST+6,sp)
4333  002e cd0000        	call	_TIM1_SetIC2Prescaler
4336  0031 202c          	jra	L1422
4337  0033               L3422:
4338                     ; 1686   else if (TIM1_Channel == TIM1_Channel_3)
4340  0033 7b01          	ld	a,(OFST+1,sp)
4341  0035 a102          	cp	a,#2
4342  0037 2614          	jrne	L7422
4343                     ; 1689     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4345  0039 7b07          	ld	a,(OFST+7,sp)
4346  003b 88            	push	a
4347  003c 7b06          	ld	a,(OFST+6,sp)
4348  003e 97            	ld	xl,a
4349  003f 7b03          	ld	a,(OFST+3,sp)
4350  0041 95            	ld	xh,a
4351  0042 cd0000        	call	L7_TI3_Config
4353  0045 84            	pop	a
4354                     ; 1691     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4356  0046 7b06          	ld	a,(OFST+6,sp)
4357  0048 cd0000        	call	_TIM1_SetIC3Prescaler
4360  004b 2012          	jra	L1422
4361  004d               L7422:
4362                     ; 1696     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4364  004d 7b07          	ld	a,(OFST+7,sp)
4365  004f 88            	push	a
4366  0050 7b06          	ld	a,(OFST+6,sp)
4367  0052 97            	ld	xl,a
4368  0053 7b03          	ld	a,(OFST+3,sp)
4369  0055 95            	ld	xh,a
4370  0056 cd0000        	call	L11_TI4_Config
4372  0059 84            	pop	a
4373                     ; 1698     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4375  005a 7b06          	ld	a,(OFST+6,sp)
4376  005c cd0000        	call	_TIM1_SetIC4Prescaler
4378  005f               L1422:
4379                     ; 1700 }
4382  005f 85            	popw	x
4383  0060 81            	ret
4479                     ; 1727 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4479                     ; 1728                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4479                     ; 1729                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4479                     ; 1730                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4479                     ; 1731                      uint8_t TIM1_ICFilter)
4479                     ; 1732 {
4480                     .text:	section	.text,new
4481  0000               _TIM1_PWMIConfig:
4483  0000 89            	pushw	x
4484  0001 89            	pushw	x
4485       00000002      OFST:	set	2
4488                     ; 1733   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4490  0002 7b01          	ld	a,(OFST-1,sp)
4491  0004 97            	ld	xl,a
4492                     ; 1734   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4494  0005 7b02          	ld	a,(OFST+0,sp)
4495  0007 97            	ld	xl,a
4496                     ; 1737   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4498                     ; 1738   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4500                     ; 1739   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4502                     ; 1740   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4504                     ; 1743   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4506  0008 7b04          	ld	a,(OFST+2,sp)
4507  000a a101          	cp	a,#1
4508  000c 2706          	jreq	L7132
4509                     ; 1745     icpolarity = TIM1_ICPolarity_Falling;
4511  000e a601          	ld	a,#1
4512  0010 6b01          	ld	(OFST-1,sp),a
4514  0012 2002          	jra	L1232
4515  0014               L7132:
4516                     ; 1749     icpolarity = TIM1_ICPolarity_Rising;
4518  0014 0f01          	clr	(OFST-1,sp)
4519  0016               L1232:
4520                     ; 1753   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4522  0016 7b07          	ld	a,(OFST+5,sp)
4523  0018 a101          	cp	a,#1
4524  001a 2606          	jrne	L3232
4525                     ; 1755     icselection = TIM1_ICSelection_IndirectTI;
4527  001c a602          	ld	a,#2
4528  001e 6b02          	ld	(OFST+0,sp),a
4530  0020 2004          	jra	L5232
4531  0022               L3232:
4532                     ; 1759     icselection = TIM1_ICSelection_DirectTI;
4534  0022 a601          	ld	a,#1
4535  0024 6b02          	ld	(OFST+0,sp),a
4536  0026               L5232:
4537                     ; 1762   if (TIM1_Channel == TIM1_Channel_1)
4539  0026 0d03          	tnz	(OFST+1,sp)
4540  0028 2626          	jrne	L7232
4541                     ; 1765     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4543  002a 7b09          	ld	a,(OFST+7,sp)
4544  002c 88            	push	a
4545  002d 7b08          	ld	a,(OFST+6,sp)
4546  002f 97            	ld	xl,a
4547  0030 7b05          	ld	a,(OFST+3,sp)
4548  0032 95            	ld	xh,a
4549  0033 cd0000        	call	L3_TI1_Config
4551  0036 84            	pop	a
4552                     ; 1768     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4554  0037 7b08          	ld	a,(OFST+6,sp)
4555  0039 cd0000        	call	_TIM1_SetIC1Prescaler
4557                     ; 1771     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4559  003c 7b09          	ld	a,(OFST+7,sp)
4560  003e 88            	push	a
4561  003f 7b03          	ld	a,(OFST+1,sp)
4562  0041 97            	ld	xl,a
4563  0042 7b02          	ld	a,(OFST+0,sp)
4564  0044 95            	ld	xh,a
4565  0045 cd0000        	call	L5_TI2_Config
4567  0048 84            	pop	a
4568                     ; 1774     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4570  0049 7b08          	ld	a,(OFST+6,sp)
4571  004b cd0000        	call	_TIM1_SetIC2Prescaler
4574  004e 2024          	jra	L1332
4575  0050               L7232:
4576                     ; 1779     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4578  0050 7b09          	ld	a,(OFST+7,sp)
4579  0052 88            	push	a
4580  0053 7b08          	ld	a,(OFST+6,sp)
4581  0055 97            	ld	xl,a
4582  0056 7b05          	ld	a,(OFST+3,sp)
4583  0058 95            	ld	xh,a
4584  0059 cd0000        	call	L5_TI2_Config
4586  005c 84            	pop	a
4587                     ; 1782     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4589  005d 7b08          	ld	a,(OFST+6,sp)
4590  005f cd0000        	call	_TIM1_SetIC2Prescaler
4592                     ; 1785     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4594  0062 7b09          	ld	a,(OFST+7,sp)
4595  0064 88            	push	a
4596  0065 7b03          	ld	a,(OFST+1,sp)
4597  0067 97            	ld	xl,a
4598  0068 7b02          	ld	a,(OFST+0,sp)
4599  006a 95            	ld	xh,a
4600  006b cd0000        	call	L3_TI1_Config
4602  006e 84            	pop	a
4603                     ; 1788     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4605  006f 7b08          	ld	a,(OFST+6,sp)
4606  0071 cd0000        	call	_TIM1_SetIC1Prescaler
4608  0074               L1332:
4609                     ; 1790 }
4612  0074 5b04          	addw	sp,#4
4613  0076 81            	ret
4659                     ; 1797 uint16_t TIM1_GetCapture1(void)
4659                     ; 1798 {
4660                     .text:	section	.text,new
4661  0000               _TIM1_GetCapture1:
4663  0000 5204          	subw	sp,#4
4664       00000004      OFST:	set	4
4667                     ; 1801   uint16_t tmpccr1 = 0;
4669  0002 1e03          	ldw	x,(OFST-1,sp)
4670                     ; 1802   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4672  0004 7b01          	ld	a,(OFST-3,sp)
4673  0006 97            	ld	xl,a
4676  0007 7b02          	ld	a,(OFST-2,sp)
4677  0009 97            	ld	xl,a
4678                     ; 1804   tmpccr1h = TIM1->CCR1H;
4680  000a c652c6        	ld	a,21190
4681  000d 6b02          	ld	(OFST-2,sp),a
4682                     ; 1805   tmpccr1l = TIM1->CCR1L;
4684  000f c652c7        	ld	a,21191
4685  0012 6b01          	ld	(OFST-3,sp),a
4686                     ; 1807   tmpccr1 = (uint16_t)(tmpccr1l);
4688  0014 7b01          	ld	a,(OFST-3,sp)
4689  0016 5f            	clrw	x
4690  0017 97            	ld	xl,a
4691  0018 1f03          	ldw	(OFST-1,sp),x
4692                     ; 1808   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4694  001a 7b02          	ld	a,(OFST-2,sp)
4695  001c 5f            	clrw	x
4696  001d 97            	ld	xl,a
4697  001e 4f            	clr	a
4698  001f 02            	rlwa	x,a
4699  0020 01            	rrwa	x,a
4700  0021 1a04          	or	a,(OFST+0,sp)
4701  0023 01            	rrwa	x,a
4702  0024 1a03          	or	a,(OFST-1,sp)
4703  0026 01            	rrwa	x,a
4704  0027 1f03          	ldw	(OFST-1,sp),x
4705                     ; 1810   return (uint16_t)tmpccr1;
4707  0029 1e03          	ldw	x,(OFST-1,sp)
4710  002b 5b04          	addw	sp,#4
4711  002d 81            	ret
4757                     ; 1818 uint16_t TIM1_GetCapture2(void)
4757                     ; 1819 {
4758                     .text:	section	.text,new
4759  0000               _TIM1_GetCapture2:
4761  0000 5204          	subw	sp,#4
4762       00000004      OFST:	set	4
4765                     ; 1822   uint16_t tmpccr2 = 0;
4767  0002 1e03          	ldw	x,(OFST-1,sp)
4768                     ; 1823   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4770  0004 7b01          	ld	a,(OFST-3,sp)
4771  0006 97            	ld	xl,a
4774  0007 7b02          	ld	a,(OFST-2,sp)
4775  0009 97            	ld	xl,a
4776                     ; 1825   tmpccr2h = TIM1->CCR2H;
4778  000a c652c8        	ld	a,21192
4779  000d 6b02          	ld	(OFST-2,sp),a
4780                     ; 1826   tmpccr2l = TIM1->CCR2L;
4782  000f c652c9        	ld	a,21193
4783  0012 6b01          	ld	(OFST-3,sp),a
4784                     ; 1828   tmpccr2 = (uint16_t)(tmpccr2l);
4786  0014 7b01          	ld	a,(OFST-3,sp)
4787  0016 5f            	clrw	x
4788  0017 97            	ld	xl,a
4789  0018 1f03          	ldw	(OFST-1,sp),x
4790                     ; 1829   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4792  001a 7b02          	ld	a,(OFST-2,sp)
4793  001c 5f            	clrw	x
4794  001d 97            	ld	xl,a
4795  001e 4f            	clr	a
4796  001f 02            	rlwa	x,a
4797  0020 01            	rrwa	x,a
4798  0021 1a04          	or	a,(OFST+0,sp)
4799  0023 01            	rrwa	x,a
4800  0024 1a03          	or	a,(OFST-1,sp)
4801  0026 01            	rrwa	x,a
4802  0027 1f03          	ldw	(OFST-1,sp),x
4803                     ; 1831   return (uint16_t)tmpccr2;
4805  0029 1e03          	ldw	x,(OFST-1,sp)
4808  002b 5b04          	addw	sp,#4
4809  002d 81            	ret
4855                     ; 1839 uint16_t TIM1_GetCapture3(void)
4855                     ; 1840 {
4856                     .text:	section	.text,new
4857  0000               _TIM1_GetCapture3:
4859  0000 5204          	subw	sp,#4
4860       00000004      OFST:	set	4
4863                     ; 1842   uint16_t tmpccr3 = 0;
4865  0002 1e03          	ldw	x,(OFST-1,sp)
4866                     ; 1843   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4868  0004 7b01          	ld	a,(OFST-3,sp)
4869  0006 97            	ld	xl,a
4872  0007 7b02          	ld	a,(OFST-2,sp)
4873  0009 97            	ld	xl,a
4874                     ; 1845   tmpccr3h = TIM1->CCR3H;
4876  000a c652ca        	ld	a,21194
4877  000d 6b02          	ld	(OFST-2,sp),a
4878                     ; 1846   tmpccr3l = TIM1->CCR3L;
4880  000f c652cb        	ld	a,21195
4881  0012 6b01          	ld	(OFST-3,sp),a
4882                     ; 1848   tmpccr3 = (uint16_t)(tmpccr3l);
4884  0014 7b01          	ld	a,(OFST-3,sp)
4885  0016 5f            	clrw	x
4886  0017 97            	ld	xl,a
4887  0018 1f03          	ldw	(OFST-1,sp),x
4888                     ; 1849   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4890  001a 7b02          	ld	a,(OFST-2,sp)
4891  001c 5f            	clrw	x
4892  001d 97            	ld	xl,a
4893  001e 4f            	clr	a
4894  001f 02            	rlwa	x,a
4895  0020 01            	rrwa	x,a
4896  0021 1a04          	or	a,(OFST+0,sp)
4897  0023 01            	rrwa	x,a
4898  0024 1a03          	or	a,(OFST-1,sp)
4899  0026 01            	rrwa	x,a
4900  0027 1f03          	ldw	(OFST-1,sp),x
4901                     ; 1851   return (uint16_t)tmpccr3;
4903  0029 1e03          	ldw	x,(OFST-1,sp)
4906  002b 5b04          	addw	sp,#4
4907  002d 81            	ret
4953                     ; 1859 uint16_t TIM1_GetCapture4(void)
4953                     ; 1860 {
4954                     .text:	section	.text,new
4955  0000               _TIM1_GetCapture4:
4957  0000 5204          	subw	sp,#4
4958       00000004      OFST:	set	4
4961                     ; 1862   uint16_t tmpccr4 = 0;
4963  0002 1e03          	ldw	x,(OFST-1,sp)
4964                     ; 1863   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4966  0004 7b01          	ld	a,(OFST-3,sp)
4967  0006 97            	ld	xl,a
4970  0007 7b02          	ld	a,(OFST-2,sp)
4971  0009 97            	ld	xl,a
4972                     ; 1865   tmpccr4h = TIM1->CCR4H;
4974  000a c652cc        	ld	a,21196
4975  000d 6b02          	ld	(OFST-2,sp),a
4976                     ; 1866   tmpccr4l = TIM1->CCR4L;
4978  000f c652cd        	ld	a,21197
4979  0012 6b01          	ld	(OFST-3,sp),a
4980                     ; 1868   tmpccr4 = (uint16_t)(tmpccr4l);
4982  0014 7b01          	ld	a,(OFST-3,sp)
4983  0016 5f            	clrw	x
4984  0017 97            	ld	xl,a
4985  0018 1f03          	ldw	(OFST-1,sp),x
4986                     ; 1869   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4988  001a 7b02          	ld	a,(OFST-2,sp)
4989  001c 5f            	clrw	x
4990  001d 97            	ld	xl,a
4991  001e 4f            	clr	a
4992  001f 02            	rlwa	x,a
4993  0020 01            	rrwa	x,a
4994  0021 1a04          	or	a,(OFST+0,sp)
4995  0023 01            	rrwa	x,a
4996  0024 1a03          	or	a,(OFST-1,sp)
4997  0026 01            	rrwa	x,a
4998  0027 1f03          	ldw	(OFST-1,sp),x
4999                     ; 1871   return (uint16_t)tmpccr4;
5001  0029 1e03          	ldw	x,(OFST-1,sp)
5004  002b 5b04          	addw	sp,#4
5005  002d 81            	ret
5041                     ; 1884 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5041                     ; 1885 {
5042                     .text:	section	.text,new
5043  0000               _TIM1_SetIC1Prescaler:
5045  0000 88            	push	a
5046       00000000      OFST:	set	0
5049                     ; 1887   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5051                     ; 1890   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5053  0001 c652b9        	ld	a,21177
5054  0004 a4f3          	and	a,#243
5055  0006 1a01          	or	a,(OFST+1,sp)
5056  0008 c752b9        	ld	21177,a
5057                     ; 1891 }
5060  000b 84            	pop	a
5061  000c 81            	ret
5097                     ; 1903 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5097                     ; 1904 {
5098                     .text:	section	.text,new
5099  0000               _TIM1_SetIC2Prescaler:
5101  0000 88            	push	a
5102       00000000      OFST:	set	0
5105                     ; 1906   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5107                     ; 1909   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5109  0001 c652ba        	ld	a,21178
5110  0004 a4f3          	and	a,#243
5111  0006 1a01          	or	a,(OFST+1,sp)
5112  0008 c752ba        	ld	21178,a
5113                     ; 1910 }
5116  000b 84            	pop	a
5117  000c 81            	ret
5153                     ; 1922 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5153                     ; 1923 {
5154                     .text:	section	.text,new
5155  0000               _TIM1_SetIC3Prescaler:
5157  0000 88            	push	a
5158       00000000      OFST:	set	0
5161                     ; 1926   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5163                     ; 1929   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5165  0001 c652bb        	ld	a,21179
5166  0004 a4f3          	and	a,#243
5167  0006 1a01          	or	a,(OFST+1,sp)
5168  0008 c752bb        	ld	21179,a
5169                     ; 1930 }
5172  000b 84            	pop	a
5173  000c 81            	ret
5209                     ; 1942 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5209                     ; 1943 {
5210                     .text:	section	.text,new
5211  0000               _TIM1_SetIC4Prescaler:
5213  0000 88            	push	a
5214       00000000      OFST:	set	0
5217                     ; 1946   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5219                     ; 1949   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5221  0001 c652bc        	ld	a,21180
5222  0004 a4f3          	and	a,#243
5223  0006 1a01          	or	a,(OFST+1,sp)
5224  0008 c752bc        	ld	21180,a
5225                     ; 1950 }
5228  000b 84            	pop	a
5229  000c 81            	ret
5336                     ; 1985 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5336                     ; 1986 {
5337                     .text:	section	.text,new
5338  0000               _TIM1_ITConfig:
5340  0000 89            	pushw	x
5341       00000000      OFST:	set	0
5344                     ; 1988   assert_param(IS_TIM1_IT(TIM1_IT));
5346                     ; 1989   assert_param(IS_FUNCTIONAL_STATE(NewState));
5348                     ; 1991   if (NewState != DISABLE)
5350  0001 9f            	ld	a,xl
5351  0002 4d            	tnz	a
5352  0003 2709          	jreq	L1752
5353                     ; 1994     TIM1->IER |= (uint8_t)TIM1_IT;
5355  0005 9e            	ld	a,xh
5356  0006 ca52b5        	or	a,21173
5357  0009 c752b5        	ld	21173,a
5359  000c 2009          	jra	L3752
5360  000e               L1752:
5361                     ; 1999     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5363  000e 7b01          	ld	a,(OFST+1,sp)
5364  0010 43            	cpl	a
5365  0011 c452b5        	and	a,21173
5366  0014 c752b5        	ld	21173,a
5367  0017               L3752:
5368                     ; 2001 }
5371  0017 85            	popw	x
5372  0018 81            	ret
5477                     ; 2017 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5477                     ; 2018 {
5478                     .text:	section	.text,new
5479  0000               _TIM1_GenerateEvent:
5483                     ; 2020   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5485                     ; 2023   TIM1->EGR = (uint8_t)TIM1_EventSource;
5487  0000 c752b8        	ld	21176,a
5488                     ; 2024 }
5491  0003 81            	ret
5661                     ; 2043 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5661                     ; 2044 {
5662                     .text:	section	.text,new
5663  0000               _TIM1_GetFlagStatus:
5665  0000 89            	pushw	x
5666  0001 89            	pushw	x
5667       00000002      OFST:	set	2
5670                     ; 2045   FlagStatus bitstatus = RESET;
5672  0002 7b02          	ld	a,(OFST+0,sp)
5673  0004 97            	ld	xl,a
5674                     ; 2046   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5676  0005 7b01          	ld	a,(OFST-1,sp)
5677  0007 97            	ld	xl,a
5680  0008 7b02          	ld	a,(OFST+0,sp)
5681  000a 97            	ld	xl,a
5682                     ; 2049   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5684                     ; 2051   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5686  000b c652b6        	ld	a,21174
5687  000e 1404          	and	a,(OFST+2,sp)
5688  0010 6b01          	ld	(OFST-1,sp),a
5689                     ; 2052   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5691  0012 c652b7        	ld	a,21175
5692  0015 1403          	and	a,(OFST+1,sp)
5693  0017 6b02          	ld	(OFST+0,sp),a
5694                     ; 2054   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5696  0019 7b01          	ld	a,(OFST-1,sp)
5697  001b 1a02          	or	a,(OFST+0,sp)
5698  001d 2706          	jreq	L1372
5699                     ; 2056     bitstatus = SET;
5701  001f a601          	ld	a,#1
5702  0021 6b02          	ld	(OFST+0,sp),a
5704  0023 2002          	jra	L3372
5705  0025               L1372:
5706                     ; 2060     bitstatus = RESET;
5708  0025 0f02          	clr	(OFST+0,sp)
5709  0027               L3372:
5710                     ; 2062   return (FlagStatus)(bitstatus);
5712  0027 7b02          	ld	a,(OFST+0,sp)
5715  0029 5b04          	addw	sp,#4
5716  002b 81            	ret
5751                     ; 2083 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5751                     ; 2084 {
5752                     .text:	section	.text,new
5753  0000               _TIM1_ClearFlag:
5755  0000 89            	pushw	x
5756       00000000      OFST:	set	0
5759                     ; 2086   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5761                     ; 2089   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5763  0001 9f            	ld	a,xl
5764  0002 43            	cpl	a
5765  0003 c752b6        	ld	21174,a
5766                     ; 2090   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5768  0006 7b01          	ld	a,(OFST+1,sp)
5769  0008 43            	cpl	a
5770  0009 a41e          	and	a,#30
5771  000b c752b7        	ld	21175,a
5772                     ; 2091 }
5775  000e 85            	popw	x
5776  000f 81            	ret
5836                     ; 2108 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5836                     ; 2109 {
5837                     .text:	section	.text,new
5838  0000               _TIM1_GetITStatus:
5840  0000 88            	push	a
5841  0001 89            	pushw	x
5842       00000002      OFST:	set	2
5845                     ; 2110   ITStatus bitstatus = RESET;
5847  0002 7b02          	ld	a,(OFST+0,sp)
5848  0004 97            	ld	xl,a
5849                     ; 2112   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5851  0005 7b01          	ld	a,(OFST-1,sp)
5852  0007 97            	ld	xl,a
5855  0008 7b02          	ld	a,(OFST+0,sp)
5856  000a 97            	ld	xl,a
5857                     ; 2115   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5859                     ; 2117   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5861  000b c652b6        	ld	a,21174
5862  000e 1403          	and	a,(OFST+1,sp)
5863  0010 6b01          	ld	(OFST-1,sp),a
5864                     ; 2119   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5866  0012 c652b5        	ld	a,21173
5867  0015 1403          	and	a,(OFST+1,sp)
5868  0017 6b02          	ld	(OFST+0,sp),a
5869                     ; 2121   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5871  0019 0d01          	tnz	(OFST-1,sp)
5872  001b 270a          	jreq	L1003
5874  001d 0d02          	tnz	(OFST+0,sp)
5875  001f 2706          	jreq	L1003
5876                     ; 2123     bitstatus = SET;
5878  0021 a601          	ld	a,#1
5879  0023 6b02          	ld	(OFST+0,sp),a
5881  0025 2002          	jra	L3003
5882  0027               L1003:
5883                     ; 2127     bitstatus = RESET;
5885  0027 0f02          	clr	(OFST+0,sp)
5886  0029               L3003:
5887                     ; 2129   return (ITStatus)(bitstatus);
5889  0029 7b02          	ld	a,(OFST+0,sp)
5892  002b 5b03          	addw	sp,#3
5893  002d 81            	ret
5929                     ; 2146 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5929                     ; 2147 {
5930                     .text:	section	.text,new
5931  0000               _TIM1_ClearITPendingBit:
5935                     ; 2149   assert_param(IS_TIM1_IT(TIM1_IT));
5937                     ; 2152   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5939  0000 43            	cpl	a
5940  0001 c752b6        	ld	21174,a
5941                     ; 2153 }
5944  0004 81            	ret
6482                     ; 2161 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6482                     ; 2162                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6482                     ; 2163 {
6483                     .text:	section	.text,new
6484  0000               _TIM1_DMAConfig:
6488                     ; 2165   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6490                     ; 2166   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6492                     ; 2169   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6494  0000 9e            	ld	a,xh
6495  0001 c752d1        	ld	21201,a
6496                     ; 2170   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6498  0004 9f            	ld	a,xl
6499  0005 c752d2        	ld	21202,a
6500                     ; 2171 }
6503  0008 81            	ret
6597                     ; 2183 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6597                     ; 2184 {
6598                     .text:	section	.text,new
6599  0000               _TIM1_DMACmd:
6601  0000 89            	pushw	x
6602       00000000      OFST:	set	0
6605                     ; 2186   assert_param(IS_FUNCTIONAL_STATE(NewState));
6607                     ; 2187   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6609                     ; 2189   if (NewState != DISABLE)
6611  0001 9f            	ld	a,xl
6612  0002 4d            	tnz	a
6613  0003 2709          	jreq	L7133
6614                     ; 2192     TIM1->DER |= (uint8_t)TIM1_DMASource;
6616  0005 9e            	ld	a,xh
6617  0006 ca52b4        	or	a,21172
6618  0009 c752b4        	ld	21172,a
6620  000c 2009          	jra	L1233
6621  000e               L7133:
6622                     ; 2197     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6624  000e 7b01          	ld	a,(OFST+1,sp)
6625  0010 43            	cpl	a
6626  0011 c452b4        	and	a,21172
6627  0014 c752b4        	ld	21172,a
6628  0017               L1233:
6629                     ; 2199 }
6632  0017 85            	popw	x
6633  0018 81            	ret
6668                     ; 2207 void TIM1_SelectCCDMA(FunctionalState NewState)
6668                     ; 2208 {
6669                     .text:	section	.text,new
6670  0000               _TIM1_SelectCCDMA:
6674                     ; 2210   assert_param(IS_FUNCTIONAL_STATE(NewState));
6676                     ; 2212   if (NewState != DISABLE)
6678  0000 4d            	tnz	a
6679  0001 2706          	jreq	L1433
6680                     ; 2215     TIM1->CR2 |= TIM1_CR2_CCDS;
6682  0003 721652b1      	bset	21169,#3
6684  0007 2004          	jra	L3433
6685  0009               L1433:
6686                     ; 2220     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6688  0009 721752b1      	bres	21169,#3
6689  000d               L3433:
6690                     ; 2222 }
6693  000d 81            	ret
6717                     ; 2245 void TIM1_InternalClockConfig(void)
6717                     ; 2246 {
6718                     .text:	section	.text,new
6719  0000               _TIM1_InternalClockConfig:
6723                     ; 2248   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6725  0000 c652b2        	ld	a,21170
6726  0003 a4f8          	and	a,#248
6727  0005 c752b2        	ld	21170,a
6728                     ; 2249 }
6731  0008 81            	ret
6818                     ; 2266 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6818                     ; 2267                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6818                     ; 2268                                  uint8_t ICFilter)
6818                     ; 2269 {
6819                     .text:	section	.text,new
6820  0000               _TIM1_TIxExternalClockConfig:
6822  0000 89            	pushw	x
6823       00000000      OFST:	set	0
6826                     ; 2271   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6828                     ; 2272   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6830                     ; 2273   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6832                     ; 2276   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6834  0001 9e            	ld	a,xh
6835  0002 a160          	cp	a,#96
6836  0004 260f          	jrne	L3143
6837                     ; 2278     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6839  0006 7b05          	ld	a,(OFST+5,sp)
6840  0008 88            	push	a
6841  0009 ae0001        	ldw	x,#1
6842  000c 7b03          	ld	a,(OFST+3,sp)
6843  000e 95            	ld	xh,a
6844  000f cd0000        	call	L5_TI2_Config
6846  0012 84            	pop	a
6848  0013 200d          	jra	L5143
6849  0015               L3143:
6850                     ; 2282     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6852  0015 7b05          	ld	a,(OFST+5,sp)
6853  0017 88            	push	a
6854  0018 ae0001        	ldw	x,#1
6855  001b 7b03          	ld	a,(OFST+3,sp)
6856  001d 95            	ld	xh,a
6857  001e cd0000        	call	L3_TI1_Config
6859  0021 84            	pop	a
6860  0022               L5143:
6861                     ; 2286   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6863  0022 7b01          	ld	a,(OFST+1,sp)
6864  0024 cd0000        	call	_TIM1_SelectInputTrigger
6866                     ; 2289   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6868  0027 c652b2        	ld	a,21170
6869  002a aa07          	or	a,#7
6870  002c c752b2        	ld	21170,a
6871                     ; 2290 }
6874  002f 85            	popw	x
6875  0030 81            	ret
6990                     ; 2308 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6990                     ; 2309                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6990                     ; 2310                               uint8_t ExtTRGFilter)
6990                     ; 2311 {
6991                     .text:	section	.text,new
6992  0000               _TIM1_ETRClockMode1Config:
6994  0000 89            	pushw	x
6995       00000000      OFST:	set	0
6998                     ; 2313   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7000                     ; 2314   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7002                     ; 2315   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7004                     ; 2318   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7006  0001 7b05          	ld	a,(OFST+5,sp)
7007  0003 88            	push	a
7008  0004 9f            	ld	a,xl
7009  0005 97            	ld	xl,a
7010  0006 7b02          	ld	a,(OFST+2,sp)
7011  0008 95            	ld	xh,a
7012  0009 cd0000        	call	_TIM1_ETRConfig
7014  000c 84            	pop	a
7015                     ; 2321   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7015                     ; 2322                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7017  000d c652b2        	ld	a,21170
7018  0010 a488          	and	a,#136
7019  0012 aa77          	or	a,#119
7020  0014 c752b2        	ld	21170,a
7021                     ; 2323 }
7024  0017 85            	popw	x
7025  0018 81            	ret
7081                     ; 2341 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7081                     ; 2342                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7081                     ; 2343                               uint8_t ExtTRGFilter)
7081                     ; 2344 {
7082                     .text:	section	.text,new
7083  0000               _TIM1_ETRClockMode2Config:
7085  0000 89            	pushw	x
7086       00000000      OFST:	set	0
7089                     ; 2346   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7091                     ; 2347   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7093                     ; 2350   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7095  0001 7b05          	ld	a,(OFST+5,sp)
7096  0003 88            	push	a
7097  0004 9f            	ld	a,xl
7098  0005 97            	ld	xl,a
7099  0006 7b02          	ld	a,(OFST+2,sp)
7100  0008 95            	ld	xh,a
7101  0009 cd0000        	call	_TIM1_ETRConfig
7103  000c 84            	pop	a
7104                     ; 2353   TIM1->ETR |= TIM1_ETR_ECE;
7106  000d 721c52b3      	bset	21171,#6
7107                     ; 2354 }
7110  0011 85            	popw	x
7111  0012 81            	ret
7218                     ; 2404 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7218                     ; 2405 {
7219                     .text:	section	.text,new
7220  0000               _TIM1_SelectInputTrigger:
7222  0000 88            	push	a
7223       00000000      OFST:	set	0
7226                     ; 2407   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7228                     ; 2410   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7230  0001 c652b2        	ld	a,21170
7231  0004 a48f          	and	a,#143
7232  0006 1a01          	or	a,(OFST+1,sp)
7233  0008 c752b2        	ld	21170,a
7234                     ; 2411 }
7237  000b 84            	pop	a
7238  000c 81            	ret
7344                     ; 2427 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7344                     ; 2428 {
7345                     .text:	section	.text,new
7346  0000               _TIM1_SelectOutputTrigger:
7348  0000 88            	push	a
7349       00000000      OFST:	set	0
7352                     ; 2430   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7354                     ; 2432   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7356  0001 c652b1        	ld	a,21169
7357  0004 a48f          	and	a,#143
7358  0006 1a01          	or	a,(OFST+1,sp)
7359  0008 c752b1        	ld	21169,a
7360                     ; 2433 }
7363  000b 84            	pop	a
7364  000c 81            	ret
7438                     ; 2445 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7438                     ; 2446 {
7439                     .text:	section	.text,new
7440  0000               _TIM1_SelectSlaveMode:
7442  0000 88            	push	a
7443       00000000      OFST:	set	0
7446                     ; 2448   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7448                     ; 2451   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7450  0001 c652b2        	ld	a,21170
7451  0004 a4f8          	and	a,#248
7452  0006 1a01          	or	a,(OFST+1,sp)
7453  0008 c752b2        	ld	21170,a
7454                     ; 2453 }
7457  000b 84            	pop	a
7458  000c 81            	ret
7494                     ; 2461 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7494                     ; 2462 {
7495                     .text:	section	.text,new
7496  0000               _TIM1_SelectMasterSlaveMode:
7500                     ; 2464   assert_param(IS_FUNCTIONAL_STATE(NewState));
7502                     ; 2467   if (NewState != DISABLE)
7504  0000 4d            	tnz	a
7505  0001 2706          	jreq	L7663
7506                     ; 2469     TIM1->SMCR |= TIM1_SMCR_MSM;
7508  0003 721e52b2      	bset	21170,#7
7510  0007 2004          	jra	L1763
7511  0009               L7663:
7512                     ; 2473     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7514  0009 721f52b2      	bres	21170,#7
7515  000d               L1763:
7516                     ; 2475 }
7519  000d 81            	ret
7573                     ; 2493 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7573                     ; 2494                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7573                     ; 2495                     uint8_t ExtTRGFilter)
7573                     ; 2496 {
7574                     .text:	section	.text,new
7575  0000               _TIM1_ETRConfig:
7577  0000 89            	pushw	x
7578       00000000      OFST:	set	0
7581                     ; 2497   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7583                     ; 2500   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7583                     ; 2501                                    | (uint8_t) TIM1_ExtTRGPolarity)
7583                     ; 2502                          | (uint8_t) ExtTRGFilter);
7585  0001 9f            	ld	a,xl
7586  0002 1a01          	or	a,(OFST+1,sp)
7587  0004 1a05          	or	a,(OFST+5,sp)
7588  0006 ca52b3        	or	a,21171
7589  0009 c752b3        	ld	21171,a
7590                     ; 2503 }
7593  000c 85            	popw	x
7594  000d 81            	ret
7680                     ; 2541 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7680                     ; 2542                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7680                     ; 2543                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7680                     ; 2544 {
7681                     .text:	section	.text,new
7682  0000               _TIM1_EncoderInterfaceConfig:
7684  0000 89            	pushw	x
7685       00000000      OFST:	set	0
7688                     ; 2546   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7690                     ; 2547   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7692                     ; 2548   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7694                     ; 2551   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7696  0001 9f            	ld	a,xl
7697  0002 4d            	tnz	a
7698  0003 2706          	jreq	L7573
7699                     ; 2553     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7701  0005 721252bd      	bset	21181,#1
7703  0009 2004          	jra	L1673
7704  000b               L7573:
7705                     ; 2557     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7707  000b 721352bd      	bres	21181,#1
7708  000f               L1673:
7709                     ; 2560   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7711  000f 0d05          	tnz	(OFST+5,sp)
7712  0011 2706          	jreq	L3673
7713                     ; 2562     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7715  0013 721a52bd      	bset	21181,#5
7717  0017 2004          	jra	L5673
7718  0019               L3673:
7719                     ; 2566     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7721  0019 721b52bd      	bres	21181,#5
7722  001d               L5673:
7723                     ; 2569   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7725  001d c652b2        	ld	a,21170
7726  0020 a4f0          	and	a,#240
7727  0022 1a01          	or	a,(OFST+1,sp)
7728  0024 c752b2        	ld	21170,a
7729                     ; 2572   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7731  0027 c652b9        	ld	a,21177
7732  002a a4fc          	and	a,#252
7733  002c aa01          	or	a,#1
7734  002e c752b9        	ld	21177,a
7735                     ; 2573   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7737  0031 c652ba        	ld	a,21178
7738  0034 a4fc          	and	a,#252
7739  0036 aa01          	or	a,#1
7740  0038 c752ba        	ld	21178,a
7741                     ; 2575 }
7744  003b 85            	popw	x
7745  003c 81            	ret
7781                     ; 2583 void TIM1_SelectHallSensor(FunctionalState NewState)
7781                     ; 2584 {
7782                     .text:	section	.text,new
7783  0000               _TIM1_SelectHallSensor:
7787                     ; 2586   assert_param(IS_FUNCTIONAL_STATE(NewState));
7789                     ; 2589   if (NewState != DISABLE)
7791  0000 4d            	tnz	a
7792  0001 2706          	jreq	L5004
7793                     ; 2591     TIM1->CR2 |= TIM1_CR2_TI1S;
7795  0003 721e52b1      	bset	21169,#7
7797  0007 2004          	jra	L7004
7798  0009               L5004:
7799                     ; 2595     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7801  0009 721f52b1      	bres	21169,#7
7802  000d               L7004:
7803                     ; 2597 }
7806  000d 81            	ret
7852                     ; 2617 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7852                     ; 2618 {
7853                     .text:	section	.text,new
7854  0000               L3_TI1_Config:
7856  0000 89            	pushw	x
7857  0001 88            	push	a
7858       00000001      OFST:	set	1
7861                     ; 2621   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7863  0002 721152bd      	bres	21181,#0
7864                     ; 2624   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7864                     ; 2625                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7866  0006 7b06          	ld	a,(OFST+5,sp)
7867  0008 97            	ld	xl,a
7868  0009 a610          	ld	a,#16
7869  000b 42            	mul	x,a
7870  000c 9f            	ld	a,xl
7871  000d 1a03          	or	a,(OFST+2,sp)
7872  000f 6b01          	ld	(OFST+0,sp),a
7873  0011 c652b9        	ld	a,21177
7874  0014 a40c          	and	a,#12
7875  0016 1a01          	or	a,(OFST+0,sp)
7876  0018 c752b9        	ld	21177,a
7877                     ; 2630   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7879  001b 0d02          	tnz	(OFST+1,sp)
7880  001d 2706          	jreq	L1304
7881                     ; 2632     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7883  001f 721252bd      	bset	21181,#1
7885  0023 2004          	jra	L3304
7886  0025               L1304:
7887                     ; 2636     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7889  0025 721352bd      	bres	21181,#1
7890  0029               L3304:
7891                     ; 2640   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7893  0029 721052bd      	bset	21181,#0
7894                     ; 2641 }
7897  002d 5b03          	addw	sp,#3
7898  002f 81            	ret
7944                     ; 2657 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7944                     ; 2658 {
7945                     .text:	section	.text,new
7946  0000               L5_TI2_Config:
7948  0000 89            	pushw	x
7949  0001 88            	push	a
7950       00000001      OFST:	set	1
7953                     ; 2660   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7955  0002 721952bd      	bres	21181,#4
7956                     ; 2663   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7956                     ; 2664                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7958  0006 7b06          	ld	a,(OFST+5,sp)
7959  0008 97            	ld	xl,a
7960  0009 a610          	ld	a,#16
7961  000b 42            	mul	x,a
7962  000c 9f            	ld	a,xl
7963  000d 1a03          	or	a,(OFST+2,sp)
7964  000f 6b01          	ld	(OFST+0,sp),a
7965  0011 c652ba        	ld	a,21178
7966  0014 a40c          	and	a,#12
7967  0016 1a01          	or	a,(OFST+0,sp)
7968  0018 c752ba        	ld	21178,a
7969                     ; 2666   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7971  001b 0d02          	tnz	(OFST+1,sp)
7972  001d 2706          	jreq	L5504
7973                     ; 2668     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7975  001f 721a52bd      	bset	21181,#5
7977  0023 2004          	jra	L7504
7978  0025               L5504:
7979                     ; 2672     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7981  0025 721b52bd      	bres	21181,#5
7982  0029               L7504:
7983                     ; 2675   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7985  0029 721852bd      	bset	21181,#4
7986                     ; 2676 }
7989  002d 5b03          	addw	sp,#3
7990  002f 81            	ret
8036                     ; 2692 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8036                     ; 2693 {
8037                     .text:	section	.text,new
8038  0000               L7_TI3_Config:
8040  0000 89            	pushw	x
8041  0001 88            	push	a
8042       00000001      OFST:	set	1
8045                     ; 2695   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8047  0002 721152be      	bres	21182,#0
8048                     ; 2698   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8048                     ; 2699                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8050  0006 7b06          	ld	a,(OFST+5,sp)
8051  0008 97            	ld	xl,a
8052  0009 a610          	ld	a,#16
8053  000b 42            	mul	x,a
8054  000c 9f            	ld	a,xl
8055  000d 1a03          	or	a,(OFST+2,sp)
8056  000f 6b01          	ld	(OFST+0,sp),a
8057  0011 c652bb        	ld	a,21179
8058  0014 a40c          	and	a,#12
8059  0016 1a01          	or	a,(OFST+0,sp)
8060  0018 c752bb        	ld	21179,a
8061                     ; 2702   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8063  001b 0d02          	tnz	(OFST+1,sp)
8064  001d 2706          	jreq	L1014
8065                     ; 2704     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8067  001f 721252be      	bset	21182,#1
8069  0023 2004          	jra	L3014
8070  0025               L1014:
8071                     ; 2708     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8073  0025 721352be      	bres	21182,#1
8074  0029               L3014:
8075                     ; 2711   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8077  0029 721052be      	bset	21182,#0
8078                     ; 2712 }
8081  002d 5b03          	addw	sp,#3
8082  002f 81            	ret
8128                     ; 2727 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8128                     ; 2728 {
8129                     .text:	section	.text,new
8130  0000               L11_TI4_Config:
8132  0000 89            	pushw	x
8133  0001 88            	push	a
8134       00000001      OFST:	set	1
8137                     ; 2731   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8139  0002 721952be      	bres	21182,#4
8140                     ; 2734   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8140                     ; 2735                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8142  0006 7b06          	ld	a,(OFST+5,sp)
8143  0008 97            	ld	xl,a
8144  0009 a610          	ld	a,#16
8145  000b 42            	mul	x,a
8146  000c 9f            	ld	a,xl
8147  000d 1a03          	or	a,(OFST+2,sp)
8148  000f 6b01          	ld	(OFST+0,sp),a
8149  0011 c652bc        	ld	a,21180
8150  0014 a40c          	and	a,#12
8151  0016 1a01          	or	a,(OFST+0,sp)
8152  0018 c752bc        	ld	21180,a
8153                     ; 2738   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8155  001b 0d02          	tnz	(OFST+1,sp)
8156  001d 2706          	jreq	L5214
8157                     ; 2740     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8159  001f 721a52be      	bset	21182,#5
8161  0023 2004          	jra	L7214
8162  0025               L5214:
8163                     ; 2744     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8165  0025 721b52be      	bres	21182,#5
8166  0029               L7214:
8167                     ; 2748   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8169  0029 721852be      	bset	21182,#4
8170                     ; 2749 }
8173  002d 5b03          	addw	sp,#3
8174  002f 81            	ret
8187                     	xdef	_TIM1_SelectHallSensor
8188                     	xdef	_TIM1_EncoderInterfaceConfig
8189                     	xdef	_TIM1_ETRConfig
8190                     	xdef	_TIM1_SelectMasterSlaveMode
8191                     	xdef	_TIM1_SelectSlaveMode
8192                     	xdef	_TIM1_SelectOutputTrigger
8193                     	xdef	_TIM1_SelectInputTrigger
8194                     	xdef	_TIM1_ETRClockMode2Config
8195                     	xdef	_TIM1_ETRClockMode1Config
8196                     	xdef	_TIM1_TIxExternalClockConfig
8197                     	xdef	_TIM1_InternalClockConfig
8198                     	xdef	_TIM1_SelectCCDMA
8199                     	xdef	_TIM1_DMACmd
8200                     	xdef	_TIM1_DMAConfig
8201                     	xdef	_TIM1_ClearITPendingBit
8202                     	xdef	_TIM1_GetITStatus
8203                     	xdef	_TIM1_ClearFlag
8204                     	xdef	_TIM1_GetFlagStatus
8205                     	xdef	_TIM1_GenerateEvent
8206                     	xdef	_TIM1_ITConfig
8207                     	xdef	_TIM1_SetIC4Prescaler
8208                     	xdef	_TIM1_SetIC3Prescaler
8209                     	xdef	_TIM1_SetIC2Prescaler
8210                     	xdef	_TIM1_SetIC1Prescaler
8211                     	xdef	_TIM1_GetCapture4
8212                     	xdef	_TIM1_GetCapture3
8213                     	xdef	_TIM1_GetCapture2
8214                     	xdef	_TIM1_GetCapture1
8215                     	xdef	_TIM1_PWMIConfig
8216                     	xdef	_TIM1_ICInit
8217                     	xdef	_TIM1_CCxNCmd
8218                     	xdef	_TIM1_CCxCmd
8219                     	xdef	_TIM1_SelectCOM
8220                     	xdef	_TIM1_SelectOCREFClear
8221                     	xdef	_TIM1_OC3NPolarityConfig
8222                     	xdef	_TIM1_OC3PolarityConfig
8223                     	xdef	_TIM1_OC2NPolarityConfig
8224                     	xdef	_TIM1_OC2PolarityConfig
8225                     	xdef	_TIM1_OC1NPolarityConfig
8226                     	xdef	_TIM1_OC1PolarityConfig
8227                     	xdef	_TIM1_ClearOC4Ref
8228                     	xdef	_TIM1_ClearOC3Ref
8229                     	xdef	_TIM1_ClearOC2Ref
8230                     	xdef	_TIM1_ClearOC1Ref
8231                     	xdef	_TIM1_OC3FastConfig
8232                     	xdef	_TIM1_OC2FastConfig
8233                     	xdef	_TIM1_OC1FastConfig
8234                     	xdef	_TIM1_OC4PreloadConfig
8235                     	xdef	_TIM1_OC3PreloadConfig
8236                     	xdef	_TIM1_OC2PreloadConfig
8237                     	xdef	_TIM1_OC1PreloadConfig
8238                     	xdef	_TIM1_ForcedOC3Config
8239                     	xdef	_TIM1_ForcedOC2Config
8240                     	xdef	_TIM1_ForcedOC1Config
8241                     	xdef	_TIM1_CCPreloadControl
8242                     	xdef	_TIM1_SetCompare4
8243                     	xdef	_TIM1_SetCompare3
8244                     	xdef	_TIM1_SetCompare2
8245                     	xdef	_TIM1_SetCompare1
8246                     	xdef	_TIM1_SelectOCxM
8247                     	xdef	_TIM1_CtrlPWMOutputs
8248                     	xdef	_TIM1_BDTRConfig
8249                     	xdef	_TIM1_OC3Init
8250                     	xdef	_TIM1_OC2Init
8251                     	xdef	_TIM1_OC1Init
8252                     	xdef	_TIM1_Cmd
8253                     	xdef	_TIM1_SelectOnePulseMode
8254                     	xdef	_TIM1_ARRPreloadConfig
8255                     	xdef	_TIM1_UpdateRequestConfig
8256                     	xdef	_TIM1_UpdateDisableConfig
8257                     	xdef	_TIM1_GetPrescaler
8258                     	xdef	_TIM1_GetCounter
8259                     	xdef	_TIM1_SetAutoreload
8260                     	xdef	_TIM1_SetCounter
8261                     	xdef	_TIM1_CounterModeConfig
8262                     	xdef	_TIM1_PrescalerConfig
8263                     	xdef	_TIM1_TimeBaseInit
8264                     	xdef	_TIM1_DeInit
8283                     	end
