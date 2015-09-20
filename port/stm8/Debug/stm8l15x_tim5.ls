   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 162 void TIM5_DeInit(void)
  32                     ; 163 {
  34                     .text:	section	.text,new
  35  0000               _TIM5_DeInit:
  39                     ; 164   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  41  0000 725f5300      	clr	21248
  42                     ; 165   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  44  0004 725f5301      	clr	21249
  45                     ; 166   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  47  0008 725f5302      	clr	21250
  48                     ; 167   TIM5->ETR = TIM_ETR_RESET_VALUE;
  50  000c 725f5303      	clr	21251
  51                     ; 168   TIM5->IER = TIM_IER_RESET_VALUE;
  53  0010 725f5305      	clr	21253
  54                     ; 169   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  56  0014 725f5307      	clr	21255
  57                     ; 172   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  59  0018 725f530b      	clr	21259
  60                     ; 174   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  62  001c 35015309      	mov	21257,#1
  63                     ; 175   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  65  0020 3501530a      	mov	21258,#1
  66                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  68  0024 725f530b      	clr	21259
  69                     ; 179   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  71  0028 725f5309      	clr	21257
  72                     ; 180   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  74  002c 725f530a      	clr	21258
  75                     ; 182   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  77  0030 725f530c      	clr	21260
  78                     ; 183   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  80  0034 725f530d      	clr	21261
  81                     ; 185   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  83  0038 725f530e      	clr	21262
  84                     ; 187   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  86  003c 35ff530f      	mov	21263,#255
  87                     ; 188   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
  89  0040 35ff5310      	mov	21264,#255
  90                     ; 190   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
  92  0044 725f5311      	clr	21265
  93                     ; 191   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
  95  0048 725f5312      	clr	21266
  96                     ; 192   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
  98  004c 725f5313      	clr	21267
  99                     ; 193   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 101  0050 725f5314      	clr	21268
 102                     ; 196   TIM5->OISR = TIM_OISR_RESET_VALUE;
 104  0054 725f5316      	clr	21270
 105                     ; 197   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 107  0058 35015308      	mov	21256,#1
 108                     ; 198   TIM5->BKR = TIM_BKR_RESET_VALUE;
 110  005c 725f5315      	clr	21269
 111                     ; 199   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 113  0060 725f5306      	clr	21254
 114                     ; 200 }
 117  0064 81            	ret
 277                     ; 225 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 277                     ; 226                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 277                     ; 227                        uint16_t TIM5_Period)
 277                     ; 228 {
 278                     .text:	section	.text,new
 279  0000               _TIM5_TimeBaseInit:
 281  0000 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 230   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 287                     ; 231   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 289                     ; 236   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 291  0001 7b05          	ld	a,(OFST+5,sp)
 292  0003 c7530f        	ld	21263,a
 293                     ; 237   TIM5->ARRL = (uint8_t)(TIM5_Period);
 295  0006 7b06          	ld	a,(OFST+6,sp)
 296  0008 c75310        	ld	21264,a
 297                     ; 240   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 299  000b 9e            	ld	a,xh
 300  000c c7530e        	ld	21262,a
 301                     ; 243   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 303  000f c65300        	ld	a,21248
 304  0012 a48f          	and	a,#143
 305  0014 c75300        	ld	21248,a
 306                     ; 244   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 308  0017 9f            	ld	a,xl
 309  0018 ca5300        	or	a,21248
 310  001b c75300        	ld	21248,a
 311                     ; 247   TIM5->EGR = TIM5_EventSource_Update;
 313  001e 35015308      	mov	21256,#1
 314                     ; 248 }
 317  0022 85            	popw	x
 318  0023 81            	ret
 386                     ; 268 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 386                     ; 269                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 386                     ; 270 {
 387                     .text:	section	.text,new
 388  0000               _TIM5_PrescalerConfig:
 392                     ; 272   assert_param(IS_TIM5_PRESCALER(Prescaler));
 394                     ; 273   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 396                     ; 276   TIM5->PSCR = (uint8_t)(Prescaler);
 398  0000 9e            	ld	a,xh
 399  0001 c7530e        	ld	21262,a
 400                     ; 279   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 402  0004 9f            	ld	a,xl
 403  0005 a101          	cp	a,#1
 404  0007 2606          	jrne	L541
 405                     ; 281     TIM5->EGR |= TIM_EGR_UG ;
 407  0009 72105308      	bset	21256,#0
 409  000d 2004          	jra	L741
 410  000f               L541:
 411                     ; 285     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 413  000f 72115308      	bres	21256,#0
 414  0013               L741:
 415                     ; 287 }
 418  0013 81            	ret
 461                     ; 300 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 461                     ; 301 {
 462                     .text:	section	.text,new
 463  0000               _TIM5_CounterModeConfig:
 465  0000 88            	push	a
 466  0001 88            	push	a
 467       00000001      OFST:	set	1
 470                     ; 302   uint8_t tmpcr1 = 0;
 472  0002 0f01          	clr	(OFST+0,sp)
 473                     ; 305   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 475                     ; 307   tmpcr1 = TIM5->CR1;
 477  0004 c65300        	ld	a,21248
 478  0007 6b01          	ld	(OFST+0,sp),a
 479                     ; 310   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 481  0009 7b01          	ld	a,(OFST+0,sp)
 482  000b a48f          	and	a,#143
 483  000d 6b01          	ld	(OFST+0,sp),a
 484                     ; 313   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 486  000f 7b01          	ld	a,(OFST+0,sp)
 487  0011 1a02          	or	a,(OFST+1,sp)
 488  0013 6b01          	ld	(OFST+0,sp),a
 489                     ; 315   TIM5->CR1 = tmpcr1;
 491  0015 7b01          	ld	a,(OFST+0,sp)
 492  0017 c75300        	ld	21248,a
 493                     ; 316 }
 496  001a 85            	popw	x
 497  001b 81            	ret
 529                     ; 324 void TIM5_SetCounter(uint16_t Counter)
 529                     ; 325 {
 530                     .text:	section	.text,new
 531  0000               _TIM5_SetCounter:
 535                     ; 328   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 537  0000 9e            	ld	a,xh
 538  0001 c7530c        	ld	21260,a
 539                     ; 329   TIM5->CNTRL = (uint8_t)(Counter);
 541  0004 9f            	ld	a,xl
 542  0005 c7530d        	ld	21261,a
 543                     ; 330 }
 546  0008 81            	ret
 578                     ; 338 void TIM5_SetAutoreload(uint16_t Autoreload)
 578                     ; 339 {
 579                     .text:	section	.text,new
 580  0000               _TIM5_SetAutoreload:
 584                     ; 341   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 586  0000 9e            	ld	a,xh
 587  0001 c7530f        	ld	21263,a
 588                     ; 342   TIM5->ARRL = (uint8_t)(Autoreload);
 590  0004 9f            	ld	a,xl
 591  0005 c75310        	ld	21264,a
 592                     ; 343 }
 595  0008 81            	ret
 641                     ; 350 uint16_t TIM5_GetCounter(void)
 641                     ; 351 {
 642                     .text:	section	.text,new
 643  0000               _TIM5_GetCounter:
 645  0000 5204          	subw	sp,#4
 646       00000004      OFST:	set	4
 649                     ; 352   uint16_t tmpcnt = 0;
 651  0002 1e03          	ldw	x,(OFST-1,sp)
 652                     ; 355   tmpcntrh = TIM5->CNTRH;
 654  0004 c6530c        	ld	a,21260
 655  0007 6b02          	ld	(OFST-2,sp),a
 656                     ; 356   tmpcntrl = TIM5->CNTRL;
 658  0009 c6530d        	ld	a,21261
 659  000c 6b01          	ld	(OFST-3,sp),a
 660                     ; 358   tmpcnt = (uint16_t)(tmpcntrl);
 662  000e 7b01          	ld	a,(OFST-3,sp)
 663  0010 5f            	clrw	x
 664  0011 97            	ld	xl,a
 665  0012 1f03          	ldw	(OFST-1,sp),x
 666                     ; 359   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 668  0014 7b02          	ld	a,(OFST-2,sp)
 669  0016 5f            	clrw	x
 670  0017 97            	ld	xl,a
 671  0018 4f            	clr	a
 672  0019 02            	rlwa	x,a
 673  001a 01            	rrwa	x,a
 674  001b 1a04          	or	a,(OFST+0,sp)
 675  001d 01            	rrwa	x,a
 676  001e 1a03          	or	a,(OFST-1,sp)
 677  0020 01            	rrwa	x,a
 678  0021 1f03          	ldw	(OFST-1,sp),x
 679                     ; 361   return ((uint16_t)tmpcnt);
 681  0023 1e03          	ldw	x,(OFST-1,sp)
 684  0025 5b04          	addw	sp,#4
 685  0027 81            	ret
 709                     ; 377 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 709                     ; 378 {
 710                     .text:	section	.text,new
 711  0000               _TIM5_GetPrescaler:
 715                     ; 380   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 717  0000 c6530e        	ld	a,21262
 720  0003 81            	ret
 776                     ; 390 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 776                     ; 391 {
 777                     .text:	section	.text,new
 778  0000               _TIM5_UpdateDisableConfig:
 782                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
 784                     ; 396   if (NewState != DISABLE)
 786  0000 4d            	tnz	a
 787  0001 2706          	jreq	L772
 788                     ; 398     TIM5->CR1 |= TIM_CR1_UDIS;
 790  0003 72125300      	bset	21248,#1
 792  0007 2004          	jra	L103
 793  0009               L772:
 794                     ; 402     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 796  0009 72135300      	bres	21248,#1
 797  000d               L103:
 798                     ; 404 }
 801  000d 81            	ret
 859                     ; 414 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 859                     ; 415 {
 860                     .text:	section	.text,new
 861  0000               _TIM5_UpdateRequestConfig:
 865                     ; 417   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 867                     ; 420   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 869  0000 a101          	cp	a,#1
 870  0002 2606          	jrne	L133
 871                     ; 422     TIM5->CR1 |= TIM_CR1_URS ;
 873  0004 72145300      	bset	21248,#2
 875  0008 2004          	jra	L333
 876  000a               L133:
 877                     ; 426     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 879  000a 72155300      	bres	21248,#2
 880  000e               L333:
 881                     ; 428 }
 884  000e 81            	ret
 920                     ; 436 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 920                     ; 437 {
 921                     .text:	section	.text,new
 922  0000               _TIM5_ARRPreloadConfig:
 926                     ; 439   assert_param(IS_FUNCTIONAL_STATE(NewState));
 928                     ; 442   if (NewState != DISABLE)
 930  0000 4d            	tnz	a
 931  0001 2706          	jreq	L353
 932                     ; 444     TIM5->CR1 |= TIM_CR1_ARPE;
 934  0003 721e5300      	bset	21248,#7
 936  0007 2004          	jra	L553
 937  0009               L353:
 938                     ; 448     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 940  0009 721f5300      	bres	21248,#7
 941  000d               L553:
 942                     ; 450 }
 945  000d 81            	ret
1002                     ; 460 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1002                     ; 461 {
1003                     .text:	section	.text,new
1004  0000               _TIM5_SelectOnePulseMode:
1008                     ; 463   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1010                     ; 466   if (TIM5_OPMode == TIM5_OPMode_Single)
1012  0000 a101          	cp	a,#1
1013  0002 2606          	jrne	L504
1014                     ; 468     TIM5->CR1 |= TIM_CR1_OPM ;
1016  0004 72165300      	bset	21248,#3
1018  0008 2004          	jra	L704
1019  000a               L504:
1020                     ; 472     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1022  000a 72175300      	bres	21248,#3
1023  000e               L704:
1024                     ; 474 }
1027  000e 81            	ret
1062                     ; 482 void TIM5_Cmd(FunctionalState NewState)
1062                     ; 483 {
1063                     .text:	section	.text,new
1064  0000               _TIM5_Cmd:
1068                     ; 485   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 488   if (NewState != DISABLE)
1072  0000 4d            	tnz	a
1073  0001 2706          	jreq	L724
1074                     ; 490     TIM5->CR1 |= TIM_CR1_CEN;
1076  0003 72105300      	bset	21248,#0
1078  0007 2004          	jra	L134
1079  0009               L724:
1080                     ; 494     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1082  0009 72115300      	bres	21248,#0
1083  000d               L134:
1084                     ; 496 }
1087  000d 81            	ret
1281                     ; 572 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1281                     ; 573                   TIM5_OutputState_TypeDef TIM5_OutputState,
1281                     ; 574                   uint16_t TIM5_Pulse,
1281                     ; 575                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1281                     ; 576                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1281                     ; 577 {
1282                     .text:	section	.text,new
1283  0000               _TIM5_OC1Init:
1285  0000 89            	pushw	x
1286  0001 88            	push	a
1287       00000001      OFST:	set	1
1290                     ; 578   uint8_t tmpccmr1 = 0;
1292  0002 0f01          	clr	(OFST+0,sp)
1293                     ; 581   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1295                     ; 582   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1297                     ; 583   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1299                     ; 584   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1301                     ; 586   tmpccmr1 = TIM5->CCMR1;
1303  0004 c65309        	ld	a,21257
1304  0007 6b01          	ld	(OFST+0,sp),a
1305                     ; 589   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1307  0009 7211530b      	bres	21259,#0
1308                     ; 591   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1310  000d 7b01          	ld	a,(OFST+0,sp)
1311  000f a48f          	and	a,#143
1312  0011 6b01          	ld	(OFST+0,sp),a
1313                     ; 594   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1315  0013 9e            	ld	a,xh
1316  0014 1a01          	or	a,(OFST+0,sp)
1317  0016 6b01          	ld	(OFST+0,sp),a
1318                     ; 596   TIM5->CCMR1 = tmpccmr1;
1320  0018 7b01          	ld	a,(OFST+0,sp)
1321  001a c75309        	ld	21257,a
1322                     ; 599   if (TIM5_OutputState == TIM5_OutputState_Enable)
1324  001d 9f            	ld	a,xl
1325  001e a101          	cp	a,#1
1326  0020 2606          	jrne	L145
1327                     ; 601     TIM5->CCER1 |= TIM_CCER1_CC1E;
1329  0022 7210530b      	bset	21259,#0
1331  0026 2004          	jra	L345
1332  0028               L145:
1333                     ; 605     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1335  0028 7211530b      	bres	21259,#0
1336  002c               L345:
1337                     ; 609   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1339  002c 7b08          	ld	a,(OFST+7,sp)
1340  002e a101          	cp	a,#1
1341  0030 2606          	jrne	L545
1342                     ; 611     TIM5->CCER1 |= TIM_CCER1_CC1P;
1344  0032 7212530b      	bset	21259,#1
1346  0036 2004          	jra	L745
1347  0038               L545:
1348                     ; 615     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1350  0038 7213530b      	bres	21259,#1
1351  003c               L745:
1352                     ; 619   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1354  003c 7b09          	ld	a,(OFST+8,sp)
1355  003e a101          	cp	a,#1
1356  0040 2606          	jrne	L155
1357                     ; 621     TIM5->OISR |= TIM_OISR_OIS1;
1359  0042 72105316      	bset	21270,#0
1361  0046 2004          	jra	L355
1362  0048               L155:
1363                     ; 625     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1365  0048 72115316      	bres	21270,#0
1366  004c               L355:
1367                     ; 629   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1369  004c 7b06          	ld	a,(OFST+5,sp)
1370  004e c75311        	ld	21265,a
1371                     ; 630   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1373  0051 7b07          	ld	a,(OFST+6,sp)
1374  0053 c75312        	ld	21266,a
1375                     ; 631 }
1378  0056 5b03          	addw	sp,#3
1379  0058 81            	ret
1458                     ; 658 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1458                     ; 659                   TIM5_OutputState_TypeDef TIM5_OutputState,
1458                     ; 660                   uint16_t TIM5_Pulse,
1458                     ; 661                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1458                     ; 662                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1458                     ; 663 {
1459                     .text:	section	.text,new
1460  0000               _TIM5_OC2Init:
1462  0000 89            	pushw	x
1463  0001 88            	push	a
1464       00000001      OFST:	set	1
1467                     ; 664   uint8_t tmpccmr2 = 0;
1469  0002 0f01          	clr	(OFST+0,sp)
1470                     ; 667   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1472                     ; 668   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1474                     ; 669   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1476                     ; 670   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1478                     ; 672   tmpccmr2 = TIM5->CCMR2;
1480  0004 c6530a        	ld	a,21258
1481  0007 6b01          	ld	(OFST+0,sp),a
1482                     ; 675   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1484  0009 7219530b      	bres	21259,#4
1485                     ; 678   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1487  000d 7b01          	ld	a,(OFST+0,sp)
1488  000f a48f          	and	a,#143
1489  0011 6b01          	ld	(OFST+0,sp),a
1490                     ; 681   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1492  0013 9e            	ld	a,xh
1493  0014 1a01          	or	a,(OFST+0,sp)
1494  0016 6b01          	ld	(OFST+0,sp),a
1495                     ; 683   TIM5->CCMR2 = tmpccmr2;
1497  0018 7b01          	ld	a,(OFST+0,sp)
1498  001a c7530a        	ld	21258,a
1499                     ; 686   if (TIM5_OutputState == TIM5_OutputState_Enable)
1501  001d 9f            	ld	a,xl
1502  001e a101          	cp	a,#1
1503  0020 2606          	jrne	L316
1504                     ; 688     TIM5->CCER1 |= TIM_CCER1_CC2E;
1506  0022 7218530b      	bset	21259,#4
1508  0026 2004          	jra	L516
1509  0028               L316:
1510                     ; 692     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1512  0028 7219530b      	bres	21259,#4
1513  002c               L516:
1514                     ; 696   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1516  002c 7b08          	ld	a,(OFST+7,sp)
1517  002e a101          	cp	a,#1
1518  0030 2606          	jrne	L716
1519                     ; 698     TIM5->CCER1 |= TIM_CCER1_CC2P;
1521  0032 721a530b      	bset	21259,#5
1523  0036 2004          	jra	L126
1524  0038               L716:
1525                     ; 702     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1527  0038 721b530b      	bres	21259,#5
1528  003c               L126:
1529                     ; 707   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1531  003c 7b09          	ld	a,(OFST+8,sp)
1532  003e a101          	cp	a,#1
1533  0040 2606          	jrne	L326
1534                     ; 709     TIM5->OISR |= TIM_OISR_OIS2;
1536  0042 72145316      	bset	21270,#2
1538  0046 2004          	jra	L526
1539  0048               L326:
1540                     ; 713     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1542  0048 72155316      	bres	21270,#2
1543  004c               L526:
1544                     ; 717   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1546  004c 7b06          	ld	a,(OFST+5,sp)
1547  004e c75313        	ld	21267,a
1548                     ; 718   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1550  0051 7b07          	ld	a,(OFST+6,sp)
1551  0053 c75314        	ld	21268,a
1552                     ; 719 }
1555  0056 5b03          	addw	sp,#3
1556  0058 81            	ret
1754                     ; 748 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1754                     ; 749                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1754                     ; 750                     TIM5_BreakState_TypeDef TIM5_BreakState,
1754                     ; 751                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1754                     ; 752                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1754                     ; 753 
1754                     ; 754 {
1755                     .text:	section	.text,new
1756  0000               _TIM5_BKRConfig:
1758  0000 89            	pushw	x
1759  0001 88            	push	a
1760       00000001      OFST:	set	1
1763                     ; 756   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1765                     ; 757   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1767                     ; 758   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1769                     ; 759   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1771                     ; 760   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1773                     ; 766   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1773                     ; 767                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1773                     ; 768                                   TIM5_AutomaticOutput));
1775  0002 7b06          	ld	a,(OFST+5,sp)
1776  0004 1a07          	or	a,(OFST+6,sp)
1777  0006 6b01          	ld	(OFST+0,sp),a
1778  0008 9f            	ld	a,xl
1779  0009 1a02          	or	a,(OFST+1,sp)
1780  000b 1a01          	or	a,(OFST+0,sp)
1781  000d 1a08          	or	a,(OFST+7,sp)
1782  000f c75315        	ld	21269,a
1783                     ; 769 }
1786  0012 5b03          	addw	sp,#3
1787  0014 81            	ret
1823                     ; 777 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1823                     ; 778 {
1824                     .text:	section	.text,new
1825  0000               _TIM5_CtrlPWMOutputs:
1829                     ; 780   assert_param(IS_FUNCTIONAL_STATE(NewState));
1831                     ; 784   if (NewState != DISABLE)
1833  0000 4d            	tnz	a
1834  0001 2706          	jreq	L757
1835                     ; 786     TIM5->BKR |= TIM_BKR_MOE ;
1837  0003 721e5315      	bset	21269,#7
1839  0007 2004          	jra	L167
1840  0009               L757:
1841                     ; 790     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1843  0009 721f5315      	bres	21269,#7
1844  000d               L167:
1845                     ; 792 }
1848  000d 81            	ret
1913                     ; 812 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1913                     ; 813                      TIM5_OCMode_TypeDef TIM5_OCMode)
1913                     ; 814 {
1914                     .text:	section	.text,new
1915  0000               _TIM5_SelectOCxM:
1917  0000 89            	pushw	x
1918       00000000      OFST:	set	0
1921                     ; 816   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1923                     ; 817   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1925                     ; 819   if (TIM5_Channel == TIM5_Channel_1)
1927  0001 9e            	ld	a,xh
1928  0002 4d            	tnz	a
1929  0003 2615          	jrne	L5101
1930                     ; 822     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1932  0005 7211530b      	bres	21259,#0
1933                     ; 825     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1935  0009 c65309        	ld	a,21257
1936  000c a48f          	and	a,#143
1937  000e c75309        	ld	21257,a
1938                     ; 828     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1940  0011 9f            	ld	a,xl
1941  0012 ca5309        	or	a,21257
1942  0015 c75309        	ld	21257,a
1944  0018 2014          	jra	L7101
1945  001a               L5101:
1946                     ; 833     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1948  001a 7219530b      	bres	21259,#4
1949                     ; 836     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1951  001e c6530a        	ld	a,21258
1952  0021 a48f          	and	a,#143
1953  0023 c7530a        	ld	21258,a
1954                     ; 839     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1956  0026 c6530a        	ld	a,21258
1957  0029 1a02          	or	a,(OFST+2,sp)
1958  002b c7530a        	ld	21258,a
1959  002e               L7101:
1960                     ; 841 }
1963  002e 85            	popw	x
1964  002f 81            	ret
1996                     ; 849 void TIM5_SetCompare1(uint16_t Compare)
1996                     ; 850 {
1997                     .text:	section	.text,new
1998  0000               _TIM5_SetCompare1:
2002                     ; 852   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2004  0000 9e            	ld	a,xh
2005  0001 c75311        	ld	21265,a
2006                     ; 853   TIM5->CCR1L = (uint8_t)(Compare);
2008  0004 9f            	ld	a,xl
2009  0005 c75312        	ld	21266,a
2010                     ; 854 }
2013  0008 81            	ret
2045                     ; 862 void TIM5_SetCompare2(uint16_t Compare)
2045                     ; 863 {
2046                     .text:	section	.text,new
2047  0000               _TIM5_SetCompare2:
2051                     ; 865   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2053  0000 9e            	ld	a,xh
2054  0001 c75313        	ld	21267,a
2055                     ; 866   TIM5->CCR2L = (uint8_t)(Compare);
2057  0004 9f            	ld	a,xl
2058  0005 c75314        	ld	21268,a
2059                     ; 867 }
2062  0008 81            	ret
2127                     ; 877 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2127                     ; 878 {
2128                     .text:	section	.text,new
2129  0000               _TIM5_ForcedOC1Config:
2131  0000 88            	push	a
2132  0001 88            	push	a
2133       00000001      OFST:	set	1
2136                     ; 879   uint8_t tmpccmr1 = 0;
2138  0002 0f01          	clr	(OFST+0,sp)
2139                     ; 882   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2141                     ; 884   tmpccmr1 = TIM5->CCMR1;
2143  0004 c65309        	ld	a,21257
2144  0007 6b01          	ld	(OFST+0,sp),a
2145                     ; 887   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2147  0009 7b01          	ld	a,(OFST+0,sp)
2148  000b a48f          	and	a,#143
2149  000d 6b01          	ld	(OFST+0,sp),a
2150                     ; 890   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2152  000f 7b01          	ld	a,(OFST+0,sp)
2153  0011 1a02          	or	a,(OFST+1,sp)
2154  0013 6b01          	ld	(OFST+0,sp),a
2155                     ; 892   TIM5->CCMR1 = tmpccmr1;
2157  0015 7b01          	ld	a,(OFST+0,sp)
2158  0017 c75309        	ld	21257,a
2159                     ; 893 }
2162  001a 85            	popw	x
2163  001b 81            	ret
2206                     ; 903 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2206                     ; 904 {
2207                     .text:	section	.text,new
2208  0000               _TIM5_ForcedOC2Config:
2210  0000 88            	push	a
2211  0001 88            	push	a
2212       00000001      OFST:	set	1
2215                     ; 905   uint8_t tmpccmr2 = 0;
2217  0002 0f01          	clr	(OFST+0,sp)
2218                     ; 908   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2220                     ; 910   tmpccmr2 = TIM5->CCMR2;
2222  0004 c6530a        	ld	a,21258
2223  0007 6b01          	ld	(OFST+0,sp),a
2224                     ; 913   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2226  0009 7b01          	ld	a,(OFST+0,sp)
2227  000b a48f          	and	a,#143
2228  000d 6b01          	ld	(OFST+0,sp),a
2229                     ; 916   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2231  000f 7b01          	ld	a,(OFST+0,sp)
2232  0011 1a02          	or	a,(OFST+1,sp)
2233  0013 6b01          	ld	(OFST+0,sp),a
2234                     ; 918   TIM5->CCMR2 = tmpccmr2;
2236  0015 7b01          	ld	a,(OFST+0,sp)
2237  0017 c7530a        	ld	21258,a
2238                     ; 919 }
2241  001a 85            	popw	x
2242  001b 81            	ret
2278                     ; 927 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2278                     ; 928 {
2279                     .text:	section	.text,new
2280  0000               _TIM5_OC1PreloadConfig:
2284                     ; 930   assert_param(IS_FUNCTIONAL_STATE(NewState));
2286                     ; 933   if (NewState != DISABLE)
2288  0000 4d            	tnz	a
2289  0001 2706          	jreq	L7311
2290                     ; 935     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2292  0003 72165309      	bset	21257,#3
2294  0007 2004          	jra	L1411
2295  0009               L7311:
2296                     ; 939     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2298  0009 72175309      	bres	21257,#3
2299  000d               L1411:
2300                     ; 941 }
2303  000d 81            	ret
2339                     ; 949 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2339                     ; 950 {
2340                     .text:	section	.text,new
2341  0000               _TIM5_OC2PreloadConfig:
2345                     ; 952   assert_param(IS_FUNCTIONAL_STATE(NewState));
2347                     ; 955   if (NewState != DISABLE)
2349  0000 4d            	tnz	a
2350  0001 2706          	jreq	L1611
2351                     ; 957     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2353  0003 7216530a      	bset	21258,#3
2355  0007 2004          	jra	L3611
2356  0009               L1611:
2357                     ; 961     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2359  0009 7217530a      	bres	21258,#3
2360  000d               L3611:
2361                     ; 963 }
2364  000d 81            	ret
2399                     ; 971 void TIM5_OC1FastConfig(FunctionalState NewState)
2399                     ; 972 {
2400                     .text:	section	.text,new
2401  0000               _TIM5_OC1FastConfig:
2405                     ; 974   assert_param(IS_FUNCTIONAL_STATE(NewState));
2407                     ; 977   if (NewState != DISABLE)
2409  0000 4d            	tnz	a
2410  0001 2706          	jreq	L3021
2411                     ; 979     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2413  0003 72145309      	bset	21257,#2
2415  0007 2004          	jra	L5021
2416  0009               L3021:
2417                     ; 983     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2419  0009 72155309      	bres	21257,#2
2420  000d               L5021:
2421                     ; 985 }
2424  000d 81            	ret
2459                     ; 994 void TIM5_OC2FastConfig(FunctionalState NewState)
2459                     ; 995 {
2460                     .text:	section	.text,new
2461  0000               _TIM5_OC2FastConfig:
2465                     ; 997   assert_param(IS_FUNCTIONAL_STATE(NewState));
2467                     ; 1000   if (NewState != DISABLE)
2469  0000 4d            	tnz	a
2470  0001 2706          	jreq	L5221
2471                     ; 1002     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2473  0003 7214530a      	bset	21258,#2
2475  0007 2004          	jra	L7221
2476  0009               L5221:
2477                     ; 1006     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2479  0009 7215530a      	bres	21258,#2
2480  000d               L7221:
2481                     ; 1008 }
2484  000d 81            	ret
2520                     ; 1018 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2520                     ; 1019 {
2521                     .text:	section	.text,new
2522  0000               _TIM5_OC1PolarityConfig:
2526                     ; 1021   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2528                     ; 1024   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2530  0000 a101          	cp	a,#1
2531  0002 2606          	jrne	L7421
2532                     ; 1026     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2534  0004 7212530b      	bset	21259,#1
2536  0008 2004          	jra	L1521
2537  000a               L7421:
2538                     ; 1030     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2540  000a 7213530b      	bres	21259,#1
2541  000e               L1521:
2542                     ; 1032 }
2545  000e 81            	ret
2581                     ; 1042 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2581                     ; 1043 {
2582                     .text:	section	.text,new
2583  0000               _TIM5_OC2PolarityConfig:
2587                     ; 1045   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2589                     ; 1048   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2591  0000 a101          	cp	a,#1
2592  0002 2606          	jrne	L1721
2593                     ; 1050     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2595  0004 721a530b      	bset	21259,#5
2597  0008 2004          	jra	L3721
2598  000a               L1721:
2599                     ; 1054     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2601  000a 721b530b      	bres	21259,#5
2602  000e               L3721:
2603                     ; 1056 }
2606  000e 81            	ret
2651                     ; 1068 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2651                     ; 1069                  FunctionalState NewState)
2651                     ; 1070 {
2652                     .text:	section	.text,new
2653  0000               _TIM5_CCxCmd:
2655  0000 89            	pushw	x
2656       00000000      OFST:	set	0
2659                     ; 1072   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2661                     ; 1073   assert_param(IS_FUNCTIONAL_STATE(NewState));
2663                     ; 1075   if (TIM5_Channel == TIM5_Channel_1)
2665  0001 9e            	ld	a,xh
2666  0002 4d            	tnz	a
2667  0003 2610          	jrne	L7131
2668                     ; 1078     if (NewState != DISABLE)
2670  0005 9f            	ld	a,xl
2671  0006 4d            	tnz	a
2672  0007 2706          	jreq	L1231
2673                     ; 1080       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2675  0009 7210530b      	bset	21259,#0
2677  000d 2014          	jra	L5231
2678  000f               L1231:
2679                     ; 1084       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2681  000f 7211530b      	bres	21259,#0
2682  0013 200e          	jra	L5231
2683  0015               L7131:
2684                     ; 1091     if (NewState != DISABLE)
2686  0015 0d02          	tnz	(OFST+2,sp)
2687  0017 2706          	jreq	L7231
2688                     ; 1093       TIM5->CCER1 |= TIM_CCER1_CC2E;
2690  0019 7218530b      	bset	21259,#4
2692  001d 2004          	jra	L5231
2693  001f               L7231:
2694                     ; 1097       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2696  001f 7219530b      	bres	21259,#4
2697  0023               L5231:
2698                     ; 1100 }
2701  0023 85            	popw	x
2702  0024 81            	ret
2864                     ; 1178 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2864                     ; 1179                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2864                     ; 1180                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2864                     ; 1181                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2864                     ; 1182                  uint8_t TIM5_ICFilter)
2864                     ; 1183 {
2865                     .text:	section	.text,new
2866  0000               _TIM5_ICInit:
2868  0000 89            	pushw	x
2869       00000000      OFST:	set	0
2872                     ; 1185   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2874                     ; 1187   if (TIM5_Channel == TIM5_Channel_1)
2876  0001 9e            	ld	a,xh
2877  0002 4d            	tnz	a
2878  0003 2614          	jrne	L5241
2879                     ; 1190     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2881  0005 7b07          	ld	a,(OFST+7,sp)
2882  0007 88            	push	a
2883  0008 7b06          	ld	a,(OFST+6,sp)
2884  000a 97            	ld	xl,a
2885  000b 7b03          	ld	a,(OFST+3,sp)
2886  000d 95            	ld	xh,a
2887  000e cd0000        	call	L3_TI1_Config
2889  0011 84            	pop	a
2890                     ; 1193     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2892  0012 7b06          	ld	a,(OFST+6,sp)
2893  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2896  0017 2012          	jra	L7241
2897  0019               L5241:
2898                     ; 1198     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2900  0019 7b07          	ld	a,(OFST+7,sp)
2901  001b 88            	push	a
2902  001c 7b06          	ld	a,(OFST+6,sp)
2903  001e 97            	ld	xl,a
2904  001f 7b03          	ld	a,(OFST+3,sp)
2905  0021 95            	ld	xh,a
2906  0022 cd0000        	call	L5_TI2_Config
2908  0025 84            	pop	a
2909                     ; 1201     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2911  0026 7b06          	ld	a,(OFST+6,sp)
2912  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2914  002b               L7241:
2915                     ; 1203 }
2918  002b 85            	popw	x
2919  002c 81            	ret
3009                     ; 1229 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3009                     ; 1230                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3009                     ; 1231                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3009                     ; 1232                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3009                     ; 1233                      uint8_t TIM5_ICFilter)
3009                     ; 1234 {
3010                     .text:	section	.text,new
3011  0000               _TIM5_PWMIConfig:
3013  0000 89            	pushw	x
3014  0001 89            	pushw	x
3015       00000002      OFST:	set	2
3018                     ; 1235   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3020  0002 7b01          	ld	a,(OFST-1,sp)
3021  0004 97            	ld	xl,a
3022                     ; 1236   uint8_t icselection = TIM5_ICSelection_DirectTI;
3024  0005 7b02          	ld	a,(OFST+0,sp)
3025  0007 97            	ld	xl,a
3026                     ; 1239   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3028                     ; 1242   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3030  0008 0d04          	tnz	(OFST+2,sp)
3031  000a 2606          	jrne	L1741
3032                     ; 1244     icpolarity = TIM5_ICPolarity_Falling;
3034  000c a601          	ld	a,#1
3035  000e 6b01          	ld	(OFST-1,sp),a
3037  0010 2002          	jra	L3741
3038  0012               L1741:
3039                     ; 1248     icpolarity = TIM5_ICPolarity_Rising;
3041  0012 0f01          	clr	(OFST-1,sp)
3042  0014               L3741:
3043                     ; 1252   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3045  0014 7b07          	ld	a,(OFST+5,sp)
3046  0016 a101          	cp	a,#1
3047  0018 2606          	jrne	L5741
3048                     ; 1254     icselection = TIM5_ICSelection_IndirectTI;
3050  001a a602          	ld	a,#2
3051  001c 6b02          	ld	(OFST+0,sp),a
3053  001e 2004          	jra	L7741
3054  0020               L5741:
3055                     ; 1258     icselection = TIM5_ICSelection_DirectTI;
3057  0020 a601          	ld	a,#1
3058  0022 6b02          	ld	(OFST+0,sp),a
3059  0024               L7741:
3060                     ; 1261   if (TIM5_Channel == TIM5_Channel_1)
3062  0024 0d03          	tnz	(OFST+1,sp)
3063  0026 2626          	jrne	L1051
3064                     ; 1264     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3064                     ; 1265                TIM5_ICFilter);
3066  0028 7b09          	ld	a,(OFST+7,sp)
3067  002a 88            	push	a
3068  002b 7b08          	ld	a,(OFST+6,sp)
3069  002d 97            	ld	xl,a
3070  002e 7b05          	ld	a,(OFST+3,sp)
3071  0030 95            	ld	xh,a
3072  0031 cd0000        	call	L3_TI1_Config
3074  0034 84            	pop	a
3075                     ; 1268     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3077  0035 7b08          	ld	a,(OFST+6,sp)
3078  0037 cd0000        	call	_TIM5_SetIC1Prescaler
3080                     ; 1271     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3082  003a 7b09          	ld	a,(OFST+7,sp)
3083  003c 88            	push	a
3084  003d 7b03          	ld	a,(OFST+1,sp)
3085  003f 97            	ld	xl,a
3086  0040 7b02          	ld	a,(OFST+0,sp)
3087  0042 95            	ld	xh,a
3088  0043 cd0000        	call	L5_TI2_Config
3090  0046 84            	pop	a
3091                     ; 1274     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3093  0047 7b08          	ld	a,(OFST+6,sp)
3094  0049 cd0000        	call	_TIM5_SetIC2Prescaler
3097  004c 2024          	jra	L3051
3098  004e               L1051:
3099                     ; 1279     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3099                     ; 1280                TIM5_ICFilter);
3101  004e 7b09          	ld	a,(OFST+7,sp)
3102  0050 88            	push	a
3103  0051 7b08          	ld	a,(OFST+6,sp)
3104  0053 97            	ld	xl,a
3105  0054 7b05          	ld	a,(OFST+3,sp)
3106  0056 95            	ld	xh,a
3107  0057 cd0000        	call	L5_TI2_Config
3109  005a 84            	pop	a
3110                     ; 1283     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3112  005b 7b08          	ld	a,(OFST+6,sp)
3113  005d cd0000        	call	_TIM5_SetIC2Prescaler
3115                     ; 1286     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3117  0060 7b09          	ld	a,(OFST+7,sp)
3118  0062 88            	push	a
3119  0063 7b03          	ld	a,(OFST+1,sp)
3120  0065 97            	ld	xl,a
3121  0066 7b02          	ld	a,(OFST+0,sp)
3122  0068 95            	ld	xh,a
3123  0069 cd0000        	call	L3_TI1_Config
3125  006c 84            	pop	a
3126                     ; 1289     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3128  006d 7b08          	ld	a,(OFST+6,sp)
3129  006f cd0000        	call	_TIM5_SetIC1Prescaler
3131  0072               L3051:
3132                     ; 1291 }
3135  0072 5b04          	addw	sp,#4
3136  0074 81            	ret
3182                     ; 1298 uint16_t TIM5_GetCapture1(void)
3182                     ; 1299 {
3183                     .text:	section	.text,new
3184  0000               _TIM5_GetCapture1:
3186  0000 5204          	subw	sp,#4
3187       00000004      OFST:	set	4
3190                     ; 1300   uint16_t tmpccr1 = 0;
3192  0002 1e03          	ldw	x,(OFST-1,sp)
3193                     ; 1303   tmpccr1h = TIM5->CCR1H;
3195  0004 c65311        	ld	a,21265
3196  0007 6b02          	ld	(OFST-2,sp),a
3197                     ; 1304   tmpccr1l = TIM5->CCR1L;
3199  0009 c65312        	ld	a,21266
3200  000c 6b01          	ld	(OFST-3,sp),a
3201                     ; 1306   tmpccr1 = (uint16_t)(tmpccr1l);
3203  000e 7b01          	ld	a,(OFST-3,sp)
3204  0010 5f            	clrw	x
3205  0011 97            	ld	xl,a
3206  0012 1f03          	ldw	(OFST-1,sp),x
3207                     ; 1307   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3209  0014 7b02          	ld	a,(OFST-2,sp)
3210  0016 5f            	clrw	x
3211  0017 97            	ld	xl,a
3212  0018 4f            	clr	a
3213  0019 02            	rlwa	x,a
3214  001a 01            	rrwa	x,a
3215  001b 1a04          	or	a,(OFST+0,sp)
3216  001d 01            	rrwa	x,a
3217  001e 1a03          	or	a,(OFST-1,sp)
3218  0020 01            	rrwa	x,a
3219  0021 1f03          	ldw	(OFST-1,sp),x
3220                     ; 1309   return ((uint16_t)tmpccr1);
3222  0023 1e03          	ldw	x,(OFST-1,sp)
3225  0025 5b04          	addw	sp,#4
3226  0027 81            	ret
3272                     ; 1317 uint16_t TIM5_GetCapture2(void)
3272                     ; 1318 {
3273                     .text:	section	.text,new
3274  0000               _TIM5_GetCapture2:
3276  0000 5204          	subw	sp,#4
3277       00000004      OFST:	set	4
3280                     ; 1319   uint16_t tmpccr2 = 0;
3282  0002 1e03          	ldw	x,(OFST-1,sp)
3283                     ; 1322   tmpccr2h = TIM5->CCR2H;
3285  0004 c65313        	ld	a,21267
3286  0007 6b02          	ld	(OFST-2,sp),a
3287                     ; 1323   tmpccr2l = TIM5->CCR2L;
3289  0009 c65314        	ld	a,21268
3290  000c 6b01          	ld	(OFST-3,sp),a
3291                     ; 1325   tmpccr2 = (uint16_t)(tmpccr2l);
3293  000e 7b01          	ld	a,(OFST-3,sp)
3294  0010 5f            	clrw	x
3295  0011 97            	ld	xl,a
3296  0012 1f03          	ldw	(OFST-1,sp),x
3297                     ; 1326   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3299  0014 7b02          	ld	a,(OFST-2,sp)
3300  0016 5f            	clrw	x
3301  0017 97            	ld	xl,a
3302  0018 4f            	clr	a
3303  0019 02            	rlwa	x,a
3304  001a 01            	rrwa	x,a
3305  001b 1a04          	or	a,(OFST+0,sp)
3306  001d 01            	rrwa	x,a
3307  001e 1a03          	or	a,(OFST-1,sp)
3308  0020 01            	rrwa	x,a
3309  0021 1f03          	ldw	(OFST-1,sp),x
3310                     ; 1328   return ((uint16_t)tmpccr2);
3312  0023 1e03          	ldw	x,(OFST-1,sp)
3315  0025 5b04          	addw	sp,#4
3316  0027 81            	ret
3359                     ; 1341 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3359                     ; 1342 {
3360                     .text:	section	.text,new
3361  0000               _TIM5_SetIC1Prescaler:
3363  0000 88            	push	a
3364  0001 88            	push	a
3365       00000001      OFST:	set	1
3368                     ; 1343   uint8_t tmpccmr1 = 0;
3370  0002 0f01          	clr	(OFST+0,sp)
3371                     ; 1346   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3373                     ; 1348   tmpccmr1 = TIM5->CCMR1;
3375  0004 c65309        	ld	a,21257
3376  0007 6b01          	ld	(OFST+0,sp),a
3377                     ; 1351   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3379  0009 7b01          	ld	a,(OFST+0,sp)
3380  000b a4f3          	and	a,#243
3381  000d 6b01          	ld	(OFST+0,sp),a
3382                     ; 1354   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3384  000f 7b01          	ld	a,(OFST+0,sp)
3385  0011 1a02          	or	a,(OFST+1,sp)
3386  0013 6b01          	ld	(OFST+0,sp),a
3387                     ; 1356   TIM5->CCMR1 = tmpccmr1;
3389  0015 7b01          	ld	a,(OFST+0,sp)
3390  0017 c75309        	ld	21257,a
3391                     ; 1357 }
3394  001a 85            	popw	x
3395  001b 81            	ret
3438                     ; 1369 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3438                     ; 1370 {
3439                     .text:	section	.text,new
3440  0000               _TIM5_SetIC2Prescaler:
3442  0000 88            	push	a
3443  0001 88            	push	a
3444       00000001      OFST:	set	1
3447                     ; 1371   uint8_t tmpccmr2 = 0;
3449  0002 0f01          	clr	(OFST+0,sp)
3450                     ; 1374   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3452                     ; 1376   tmpccmr2 = TIM5->CCMR2;
3454  0004 c6530a        	ld	a,21258
3455  0007 6b01          	ld	(OFST+0,sp),a
3456                     ; 1379   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3458  0009 7b01          	ld	a,(OFST+0,sp)
3459  000b a4f3          	and	a,#243
3460  000d 6b01          	ld	(OFST+0,sp),a
3461                     ; 1382   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3463  000f 7b01          	ld	a,(OFST+0,sp)
3464  0011 1a02          	or	a,(OFST+1,sp)
3465  0013 6b01          	ld	(OFST+0,sp),a
3466                     ; 1384   TIM5->CCMR2 = tmpccmr2;
3468  0015 7b01          	ld	a,(OFST+0,sp)
3469  0017 c7530a        	ld	21258,a
3470                     ; 1385 }
3473  001a 85            	popw	x
3474  001b 81            	ret
3560                     ; 1416 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3560                     ; 1417 {
3561                     .text:	section	.text,new
3562  0000               _TIM5_ITConfig:
3564  0000 89            	pushw	x
3565       00000000      OFST:	set	0
3568                     ; 1419   assert_param(IS_TIM5_IT(TIM5_IT));
3570                     ; 1420   assert_param(IS_FUNCTIONAL_STATE(NewState));
3572                     ; 1422   if (NewState != DISABLE)
3574  0001 9f            	ld	a,xl
3575  0002 4d            	tnz	a
3576  0003 2709          	jreq	L5461
3577                     ; 1425     TIM5->IER |= (uint8_t)TIM5_IT;
3579  0005 9e            	ld	a,xh
3580  0006 ca5305        	or	a,21253
3581  0009 c75305        	ld	21253,a
3583  000c 2009          	jra	L7461
3584  000e               L5461:
3585                     ; 1430     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3587  000e 7b01          	ld	a,(OFST+1,sp)
3588  0010 43            	cpl	a
3589  0011 c45305        	and	a,21253
3590  0014 c75305        	ld	21253,a
3591  0017               L7461:
3592                     ; 1432 }
3595  0017 85            	popw	x
3596  0018 81            	ret
3677                     ; 1445 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3677                     ; 1446 {
3678                     .text:	section	.text,new
3679  0000               _TIM5_GenerateEvent:
3683                     ; 1448   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3685                     ; 1451   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3687  0000 ca5308        	or	a,21256
3688  0003 c75308        	ld	21256,a
3689                     ; 1452 }
3692  0006 81            	ret
3827                     ; 1467 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3827                     ; 1468 {
3828                     .text:	section	.text,new
3829  0000               _TIM5_GetFlagStatus:
3831  0000 89            	pushw	x
3832  0001 89            	pushw	x
3833       00000002      OFST:	set	2
3836                     ; 1469   FlagStatus bitstatus = RESET;
3838  0002 7b02          	ld	a,(OFST+0,sp)
3839  0004 97            	ld	xl,a
3840                     ; 1470   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3842  0005 7b01          	ld	a,(OFST-1,sp)
3843  0007 97            	ld	xl,a
3846  0008 7b02          	ld	a,(OFST+0,sp)
3847  000a 97            	ld	xl,a
3848                     ; 1473   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3850                     ; 1475   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3852  000b c65306        	ld	a,21254
3853  000e 1404          	and	a,(OFST+2,sp)
3854  0010 6b01          	ld	(OFST-1,sp),a
3855                     ; 1476   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3857  0012 c65307        	ld	a,21255
3858  0015 1403          	and	a,(OFST+1,sp)
3859  0017 6b02          	ld	(OFST+0,sp),a
3860                     ; 1478   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3862  0019 7b01          	ld	a,(OFST-1,sp)
3863  001b 1a02          	or	a,(OFST+0,sp)
3864  001d 2706          	jreq	L5671
3865                     ; 1480     bitstatus = SET;
3867  001f a601          	ld	a,#1
3868  0021 6b02          	ld	(OFST+0,sp),a
3870  0023 2002          	jra	L7671
3871  0025               L5671:
3872                     ; 1484     bitstatus = RESET;
3874  0025 0f02          	clr	(OFST+0,sp)
3875  0027               L7671:
3876                     ; 1486   return ((FlagStatus)bitstatus);
3878  0027 7b02          	ld	a,(OFST+0,sp)
3881  0029 5b04          	addw	sp,#4
3882  002b 81            	ret
3917                     ; 1500 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3917                     ; 1501 {
3918                     .text:	section	.text,new
3919  0000               _TIM5_ClearFlag:
3921  0000 89            	pushw	x
3922       00000000      OFST:	set	0
3925                     ; 1503   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3927                     ; 1505   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3929  0001 9f            	ld	a,xl
3930  0002 43            	cpl	a
3931  0003 c75306        	ld	21254,a
3932                     ; 1506   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3934  0006 7b01          	ld	a,(OFST+1,sp)
3935  0008 43            	cpl	a
3936  0009 c75307        	ld	21255,a
3937                     ; 1507 }
3940  000c 85            	popw	x
3941  000d 81            	ret
4001                     ; 1520 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4001                     ; 1521 {
4002                     .text:	section	.text,new
4003  0000               _TIM5_GetITStatus:
4005  0000 88            	push	a
4006  0001 89            	pushw	x
4007       00000002      OFST:	set	2
4010                     ; 1522   ITStatus bitstatus = RESET;
4012  0002 7b02          	ld	a,(OFST+0,sp)
4013  0004 97            	ld	xl,a
4014                     ; 1524   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4016  0005 7b01          	ld	a,(OFST-1,sp)
4017  0007 97            	ld	xl,a
4020  0008 7b02          	ld	a,(OFST+0,sp)
4021  000a 97            	ld	xl,a
4022                     ; 1527   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4024                     ; 1529   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4026  000b c65306        	ld	a,21254
4027  000e 1403          	and	a,(OFST+1,sp)
4028  0010 6b01          	ld	(OFST-1,sp),a
4029                     ; 1531   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4031  0012 c65305        	ld	a,21253
4032  0015 1403          	and	a,(OFST+1,sp)
4033  0017 6b02          	ld	(OFST+0,sp),a
4034                     ; 1533   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4036  0019 0d01          	tnz	(OFST-1,sp)
4037  001b 270a          	jreq	L5302
4039  001d 0d02          	tnz	(OFST+0,sp)
4040  001f 2706          	jreq	L5302
4041                     ; 1535     bitstatus = (ITStatus)SET;
4043  0021 a601          	ld	a,#1
4044  0023 6b02          	ld	(OFST+0,sp),a
4046  0025 2002          	jra	L7302
4047  0027               L5302:
4048                     ; 1539     bitstatus = (ITStatus)RESET;
4050  0027 0f02          	clr	(OFST+0,sp)
4051  0029               L7302:
4052                     ; 1541   return ((ITStatus)bitstatus);
4054  0029 7b02          	ld	a,(OFST+0,sp)
4057  002b 5b03          	addw	sp,#3
4058  002d 81            	ret
4094                     ; 1555 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4094                     ; 1556 {
4095                     .text:	section	.text,new
4096  0000               _TIM5_ClearITPendingBit:
4100                     ; 1558   assert_param(IS_TIM5_IT(TIM5_IT));
4102                     ; 1561   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4104  0000 43            	cpl	a
4105  0001 c75306        	ld	21254,a
4106                     ; 1562 }
4109  0004 81            	ret
4182                     ; 1575 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4182                     ; 1576 {
4183                     .text:	section	.text,new
4184  0000               _TIM5_DMACmd:
4186  0000 89            	pushw	x
4187       00000000      OFST:	set	0
4190                     ; 1578   assert_param(IS_FUNCTIONAL_STATE(NewState));
4192                     ; 1579   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4194                     ; 1581   if (NewState != DISABLE)
4196  0001 9f            	ld	a,xl
4197  0002 4d            	tnz	a
4198  0003 2709          	jreq	L3112
4199                     ; 1584     TIM5->DER |= TIM5_DMASource;
4201  0005 9e            	ld	a,xh
4202  0006 ca5304        	or	a,21252
4203  0009 c75304        	ld	21252,a
4205  000c 2009          	jra	L5112
4206  000e               L3112:
4207                     ; 1589     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4209  000e 7b01          	ld	a,(OFST+1,sp)
4210  0010 43            	cpl	a
4211  0011 c45304        	and	a,21252
4212  0014 c75304        	ld	21252,a
4213  0017               L5112:
4214                     ; 1591 }
4217  0017 85            	popw	x
4218  0018 81            	ret
4253                     ; 1599 void TIM5_SelectCCDMA(FunctionalState NewState)
4253                     ; 1600 {
4254                     .text:	section	.text,new
4255  0000               _TIM5_SelectCCDMA:
4259                     ; 1602   assert_param(IS_FUNCTIONAL_STATE(NewState));
4261                     ; 1604   if (NewState != DISABLE)
4263  0000 4d            	tnz	a
4264  0001 2706          	jreq	L5312
4265                     ; 1607     TIM5->CR2 |= TIM_CR2_CCDS;
4267  0003 72165301      	bset	21249,#3
4269  0007 2004          	jra	L7312
4270  0009               L5312:
4271                     ; 1612     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4273  0009 72175301      	bres	21249,#3
4274  000d               L7312:
4275                     ; 1614 }
4278  000d 81            	ret
4302                     ; 1638 void TIM5_InternalClockConfig(void)
4302                     ; 1639 {
4303                     .text:	section	.text,new
4304  0000               _TIM5_InternalClockConfig:
4308                     ; 1641   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4310  0000 c65302        	ld	a,21250
4311  0003 a4f8          	and	a,#248
4312  0005 c75302        	ld	21250,a
4313                     ; 1642 }
4316  0008 81            	ret
4403                     ; 1659 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4403                     ; 1660                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4403                     ; 1661                                  uint8_t ICFilter)
4403                     ; 1662 {
4404                     .text:	section	.text,new
4405  0000               _TIM5_TIxExternalClockConfig:
4407  0000 89            	pushw	x
4408       00000000      OFST:	set	0
4411                     ; 1664   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4413                     ; 1665   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4415                     ; 1666   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4417                     ; 1669   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4419  0001 9e            	ld	a,xh
4420  0002 a160          	cp	a,#96
4421  0004 260f          	jrne	L7022
4422                     ; 1671     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4424  0006 7b05          	ld	a,(OFST+5,sp)
4425  0008 88            	push	a
4426  0009 ae0001        	ldw	x,#1
4427  000c 7b03          	ld	a,(OFST+3,sp)
4428  000e 95            	ld	xh,a
4429  000f cd0000        	call	L5_TI2_Config
4431  0012 84            	pop	a
4433  0013 200d          	jra	L1122
4434  0015               L7022:
4435                     ; 1675     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4437  0015 7b05          	ld	a,(OFST+5,sp)
4438  0017 88            	push	a
4439  0018 ae0001        	ldw	x,#1
4440  001b 7b03          	ld	a,(OFST+3,sp)
4441  001d 95            	ld	xh,a
4442  001e cd0000        	call	L3_TI1_Config
4444  0021 84            	pop	a
4445  0022               L1122:
4446                     ; 1679   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4448  0022 7b01          	ld	a,(OFST+1,sp)
4449  0024 cd0000        	call	_TIM5_SelectInputTrigger
4451                     ; 1682   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4453  0027 c65302        	ld	a,21250
4454  002a aa07          	or	a,#7
4455  002c c75302        	ld	21250,a
4456                     ; 1683 }
4459  002f 85            	popw	x
4460  0030 81            	ret
4575                     ; 1701 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4575                     ; 1702                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4575                     ; 1703                               uint8_t ExtTRGFilter)
4575                     ; 1704 {
4576                     .text:	section	.text,new
4577  0000               _TIM5_ETRClockMode1Config:
4579  0000 89            	pushw	x
4580       00000000      OFST:	set	0
4583                     ; 1706   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4585  0001 7b05          	ld	a,(OFST+5,sp)
4586  0003 88            	push	a
4587  0004 9f            	ld	a,xl
4588  0005 97            	ld	xl,a
4589  0006 7b02          	ld	a,(OFST+2,sp)
4590  0008 95            	ld	xh,a
4591  0009 cd0000        	call	_TIM5_ETRConfig
4593  000c 84            	pop	a
4594                     ; 1709   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4596  000d c65302        	ld	a,21250
4597  0010 a4f8          	and	a,#248
4598  0012 c75302        	ld	21250,a
4599                     ; 1710   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4601  0015 c65302        	ld	a,21250
4602  0018 aa07          	or	a,#7
4603  001a c75302        	ld	21250,a
4604                     ; 1713   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4606  001d c65302        	ld	a,21250
4607  0020 a48f          	and	a,#143
4608  0022 c75302        	ld	21250,a
4609                     ; 1714   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4611  0025 c65302        	ld	a,21250
4612  0028 aa70          	or	a,#112
4613  002a c75302        	ld	21250,a
4614                     ; 1715 }
4617  002d 85            	popw	x
4618  002e 81            	ret
4674                     ; 1733 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4674                     ; 1734                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4674                     ; 1735                               uint8_t ExtTRGFilter)
4674                     ; 1736 {
4675                     .text:	section	.text,new
4676  0000               _TIM5_ETRClockMode2Config:
4678  0000 89            	pushw	x
4679       00000000      OFST:	set	0
4682                     ; 1738   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4684  0001 7b05          	ld	a,(OFST+5,sp)
4685  0003 88            	push	a
4686  0004 9f            	ld	a,xl
4687  0005 97            	ld	xl,a
4688  0006 7b02          	ld	a,(OFST+2,sp)
4689  0008 95            	ld	xh,a
4690  0009 cd0000        	call	_TIM5_ETRConfig
4692  000c 84            	pop	a
4693                     ; 1741   TIM5->ETR |= TIM_ETR_ECE ;
4695  000d 721c5303      	bset	21251,#6
4696                     ; 1742 }
4699  0011 85            	popw	x
4700  0012 81            	ret
4814                     ; 1793 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4814                     ; 1794 {
4815                     .text:	section	.text,new
4816  0000               _TIM5_SelectInputTrigger:
4818  0000 88            	push	a
4819  0001 88            	push	a
4820       00000001      OFST:	set	1
4823                     ; 1795   uint8_t tmpsmcr = 0;
4825  0002 0f01          	clr	(OFST+0,sp)
4826                     ; 1798   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4828                     ; 1800   tmpsmcr = TIM5->SMCR;
4830  0004 c65302        	ld	a,21250
4831  0007 6b01          	ld	(OFST+0,sp),a
4832                     ; 1803   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4834  0009 7b01          	ld	a,(OFST+0,sp)
4835  000b a48f          	and	a,#143
4836  000d 6b01          	ld	(OFST+0,sp),a
4837                     ; 1804   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4839  000f 7b01          	ld	a,(OFST+0,sp)
4840  0011 1a02          	or	a,(OFST+1,sp)
4841  0013 6b01          	ld	(OFST+0,sp),a
4842                     ; 1806   TIM5->SMCR = (uint8_t)tmpsmcr;
4844  0015 7b01          	ld	a,(OFST+0,sp)
4845  0017 c75302        	ld	21250,a
4846                     ; 1807 }
4849  001a 85            	popw	x
4850  001b 81            	ret
4947                     ; 1821 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4947                     ; 1822 {
4948                     .text:	section	.text,new
4949  0000               _TIM5_SelectOutputTrigger:
4951  0000 88            	push	a
4952  0001 88            	push	a
4953       00000001      OFST:	set	1
4956                     ; 1823   uint8_t tmpcr2 = 0;
4958  0002 0f01          	clr	(OFST+0,sp)
4959                     ; 1826   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4961                     ; 1828   tmpcr2 = TIM5->CR2;
4963  0004 c65301        	ld	a,21249
4964  0007 6b01          	ld	(OFST+0,sp),a
4965                     ; 1831   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4967  0009 7b01          	ld	a,(OFST+0,sp)
4968  000b a48f          	and	a,#143
4969  000d 6b01          	ld	(OFST+0,sp),a
4970                     ; 1834   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4972  000f 7b01          	ld	a,(OFST+0,sp)
4973  0011 1a02          	or	a,(OFST+1,sp)
4974  0013 6b01          	ld	(OFST+0,sp),a
4975                     ; 1836   TIM5->CR2 = tmpcr2;
4977  0015 7b01          	ld	a,(OFST+0,sp)
4978  0017 c75301        	ld	21249,a
4979                     ; 1837 }
4982  001a 85            	popw	x
4983  001b 81            	ret
5064                     ; 1849 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5064                     ; 1850 {
5065                     .text:	section	.text,new
5066  0000               _TIM5_SelectSlaveMode:
5068  0000 88            	push	a
5069  0001 88            	push	a
5070       00000001      OFST:	set	1
5073                     ; 1851   uint8_t tmpsmcr = 0;
5075  0002 0f01          	clr	(OFST+0,sp)
5076                     ; 1854   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5078                     ; 1856   tmpsmcr = TIM5->SMCR;
5080  0004 c65302        	ld	a,21250
5081  0007 6b01          	ld	(OFST+0,sp),a
5082                     ; 1859   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5084  0009 7b01          	ld	a,(OFST+0,sp)
5085  000b a4f8          	and	a,#248
5086  000d 6b01          	ld	(OFST+0,sp),a
5087                     ; 1862   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5089  000f 7b01          	ld	a,(OFST+0,sp)
5090  0011 1a02          	or	a,(OFST+1,sp)
5091  0013 6b01          	ld	(OFST+0,sp),a
5092                     ; 1864   TIM5->SMCR = tmpsmcr;
5094  0015 7b01          	ld	a,(OFST+0,sp)
5095  0017 c75302        	ld	21250,a
5096                     ; 1865 }
5099  001a 85            	popw	x
5100  001b 81            	ret
5136                     ; 1873 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5136                     ; 1874 {
5137                     .text:	section	.text,new
5138  0000               _TIM5_SelectMasterSlaveMode:
5142                     ; 1876   assert_param(IS_FUNCTIONAL_STATE(NewState));
5144                     ; 1879   if (NewState != DISABLE)
5146  0000 4d            	tnz	a
5147  0001 2706          	jreq	L5642
5148                     ; 1881     TIM5->SMCR |= TIM_SMCR_MSM;
5150  0003 721e5302      	bset	21250,#7
5152  0007 2004          	jra	L7642
5153  0009               L5642:
5154                     ; 1885     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5156  0009 721f5302      	bres	21250,#7
5157  000d               L7642:
5158                     ; 1887 }
5161  000d 81            	ret
5215                     ; 1905 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5215                     ; 1906                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5215                     ; 1907                     uint8_t ExtTRGFilter)
5215                     ; 1908 {
5216                     .text:	section	.text,new
5217  0000               _TIM5_ETRConfig:
5219  0000 89            	pushw	x
5220       00000000      OFST:	set	0
5223                     ; 1910   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5225                     ; 1911   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5227                     ; 1912   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5229                     ; 1915   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5229                     ; 1916                          | (uint8_t)ExtTRGFilter);
5231  0001 9f            	ld	a,xl
5232  0002 1a01          	or	a,(OFST+1,sp)
5233  0004 1a05          	or	a,(OFST+5,sp)
5234  0006 ca5303        	or	a,21251
5235  0009 c75303        	ld	21251,a
5236                     ; 1917 }
5239  000c 85            	popw	x
5240  000d 81            	ret
5347                     ; 1952 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5347                     ; 1953                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5347                     ; 1954                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5347                     ; 1955 {
5348                     .text:	section	.text,new
5349  0000               _TIM5_EncoderInterfaceConfig:
5351  0000 89            	pushw	x
5352  0001 5203          	subw	sp,#3
5353       00000003      OFST:	set	3
5356                     ; 1956   uint8_t tmpsmcr = 0;
5358  0003 7b01          	ld	a,(OFST-2,sp)
5359  0005 97            	ld	xl,a
5360                     ; 1957   uint8_t tmpccmr1 = 0;
5362  0006 7b02          	ld	a,(OFST-1,sp)
5363  0008 97            	ld	xl,a
5364                     ; 1958   uint8_t tmpccmr2 = 0;
5366  0009 7b03          	ld	a,(OFST+0,sp)
5367  000b 97            	ld	xl,a
5368                     ; 1961   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5370                     ; 1962   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5372                     ; 1963   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5374                     ; 1965   tmpsmcr = TIM5->SMCR;
5376  000c c65302        	ld	a,21250
5377  000f 6b01          	ld	(OFST-2,sp),a
5378                     ; 1966   tmpccmr1 = TIM5->CCMR1;
5380  0011 c65309        	ld	a,21257
5381  0014 6b02          	ld	(OFST-1,sp),a
5382                     ; 1967   tmpccmr2 = TIM5->CCMR2;
5384  0016 c6530a        	ld	a,21258
5385  0019 6b03          	ld	(OFST+0,sp),a
5386                     ; 1970   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5388  001b 7b01          	ld	a,(OFST-2,sp)
5389  001d a4f0          	and	a,#240
5390  001f 6b01          	ld	(OFST-2,sp),a
5391                     ; 1971   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5393  0021 7b01          	ld	a,(OFST-2,sp)
5394  0023 1a04          	or	a,(OFST+1,sp)
5395  0025 6b01          	ld	(OFST-2,sp),a
5396                     ; 1974   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5398  0027 7b02          	ld	a,(OFST-1,sp)
5399  0029 a4fc          	and	a,#252
5400  002b 6b02          	ld	(OFST-1,sp),a
5401                     ; 1975   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5403  002d 7b03          	ld	a,(OFST+0,sp)
5404  002f a4fc          	and	a,#252
5405  0031 6b03          	ld	(OFST+0,sp),a
5406                     ; 1976   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5408  0033 7b02          	ld	a,(OFST-1,sp)
5409  0035 aa01          	or	a,#1
5410  0037 6b02          	ld	(OFST-1,sp),a
5411                     ; 1977   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5413  0039 7b03          	ld	a,(OFST+0,sp)
5414  003b aa01          	or	a,#1
5415  003d 6b03          	ld	(OFST+0,sp),a
5416                     ; 1980   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5418  003f 7b05          	ld	a,(OFST+2,sp)
5419  0041 a101          	cp	a,#1
5420  0043 2606          	jrne	L3652
5421                     ; 1982     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5423  0045 7212530b      	bset	21259,#1
5425  0049 2004          	jra	L5652
5426  004b               L3652:
5427                     ; 1986     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5429  004b 7213530b      	bres	21259,#1
5430  004f               L5652:
5431                     ; 1989   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5433  004f 7b08          	ld	a,(OFST+5,sp)
5434  0051 a101          	cp	a,#1
5435  0053 2606          	jrne	L7652
5436                     ; 1991     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5438  0055 721a530b      	bset	21259,#5
5440  0059 2004          	jra	L1752
5441  005b               L7652:
5442                     ; 1995     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5444  005b 721b530b      	bres	21259,#5
5445  005f               L1752:
5446                     ; 1998   TIM5->SMCR = tmpsmcr;
5448  005f 7b01          	ld	a,(OFST-2,sp)
5449  0061 c75302        	ld	21250,a
5450                     ; 1999   TIM5->CCMR1 = tmpccmr1;
5452  0064 7b02          	ld	a,(OFST-1,sp)
5453  0066 c75309        	ld	21257,a
5454                     ; 2000   TIM5->CCMR2 = tmpccmr2;
5456  0069 7b03          	ld	a,(OFST+0,sp)
5457  006b c7530a        	ld	21258,a
5458                     ; 2001 }
5461  006e 5b05          	addw	sp,#5
5462  0070 81            	ret
5498                     ; 2009 void TIM5_SelectHallSensor(FunctionalState NewState)
5498                     ; 2010 {
5499                     .text:	section	.text,new
5500  0000               _TIM5_SelectHallSensor:
5504                     ; 2012   assert_param(IS_FUNCTIONAL_STATE(NewState));
5506                     ; 2015   if (NewState != DISABLE)
5508  0000 4d            	tnz	a
5509  0001 2706          	jreq	L1162
5510                     ; 2017     TIM5->CR2 |= TIM_CR2_TI1S;
5512  0003 721e5301      	bset	21249,#7
5514  0007 2004          	jra	L3162
5515  0009               L1162:
5516                     ; 2021     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5518  0009 721f5301      	bres	21249,#7
5519  000d               L3162:
5520                     ; 2023 }
5523  000d 81            	ret
5589                     ; 2044 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5589                     ; 2045                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5589                     ; 2046                        uint8_t TIM5_ICFilter)
5589                     ; 2047 {
5590                     .text:	section	.text,new
5591  0000               L3_TI1_Config:
5593  0000 89            	pushw	x
5594  0001 89            	pushw	x
5595       00000002      OFST:	set	2
5598                     ; 2048   uint8_t tmpccmr1 = 0;
5600  0002 7b02          	ld	a,(OFST+0,sp)
5601  0004 97            	ld	xl,a
5602                     ; 2049   uint8_t tmpicpolarity = TIM5_ICPolarity;
5604  0005 7b03          	ld	a,(OFST+1,sp)
5605  0007 6b01          	ld	(OFST-1,sp),a
5606                     ; 2050   tmpccmr1 = TIM5->CCMR1;
5608  0009 c65309        	ld	a,21257
5609  000c 6b02          	ld	(OFST+0,sp),a
5610                     ; 2053   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5612                     ; 2054   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5614                     ; 2055   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5616                     ; 2058   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5618  000e 7211530b      	bres	21259,#0
5619                     ; 2061   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5621  0012 7b02          	ld	a,(OFST+0,sp)
5622  0014 a40c          	and	a,#12
5623  0016 6b02          	ld	(OFST+0,sp),a
5624                     ; 2062   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5626  0018 7b07          	ld	a,(OFST+5,sp)
5627  001a 97            	ld	xl,a
5628  001b a610          	ld	a,#16
5629  001d 42            	mul	x,a
5630  001e 9f            	ld	a,xl
5631  001f 1a04          	or	a,(OFST+2,sp)
5632  0021 1a02          	or	a,(OFST+0,sp)
5633  0023 6b02          	ld	(OFST+0,sp),a
5634                     ; 2064   TIM5->CCMR1 = tmpccmr1;
5636  0025 7b02          	ld	a,(OFST+0,sp)
5637  0027 c75309        	ld	21257,a
5638                     ; 2067   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5640  002a 7b01          	ld	a,(OFST-1,sp)
5641  002c a101          	cp	a,#1
5642  002e 2606          	jrne	L5462
5643                     ; 2069     TIM5->CCER1 |= TIM_CCER1_CC1P;
5645  0030 7212530b      	bset	21259,#1
5647  0034 2004          	jra	L7462
5648  0036               L5462:
5649                     ; 2073     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5651  0036 7213530b      	bres	21259,#1
5652  003a               L7462:
5653                     ; 2077   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5655  003a 7210530b      	bset	21259,#0
5656                     ; 2078 }
5659  003e 5b04          	addw	sp,#4
5660  0040 81            	ret
5726                     ; 2095 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5726                     ; 2096                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5726                     ; 2097                        uint8_t TIM5_ICFilter)
5726                     ; 2098 {
5727                     .text:	section	.text,new
5728  0000               L5_TI2_Config:
5730  0000 89            	pushw	x
5731  0001 89            	pushw	x
5732       00000002      OFST:	set	2
5735                     ; 2099   uint8_t tmpccmr2 = 0;
5737  0002 7b02          	ld	a,(OFST+0,sp)
5738  0004 97            	ld	xl,a
5739                     ; 2100   uint8_t tmpicpolarity = TIM5_ICPolarity;
5741  0005 7b03          	ld	a,(OFST+1,sp)
5742  0007 6b01          	ld	(OFST-1,sp),a
5743                     ; 2103   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5745                     ; 2104   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5747                     ; 2105   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5749                     ; 2107   tmpccmr2 = TIM5->CCMR2;
5751  0009 c6530a        	ld	a,21258
5752  000c 6b02          	ld	(OFST+0,sp),a
5753                     ; 2110   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5755  000e 7219530b      	bres	21259,#4
5756                     ; 2113   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5758  0012 7b02          	ld	a,(OFST+0,sp)
5759  0014 a40c          	and	a,#12
5760  0016 6b02          	ld	(OFST+0,sp),a
5761                     ; 2114   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5763  0018 7b07          	ld	a,(OFST+5,sp)
5764  001a 97            	ld	xl,a
5765  001b a610          	ld	a,#16
5766  001d 42            	mul	x,a
5767  001e 9f            	ld	a,xl
5768  001f 1a04          	or	a,(OFST+2,sp)
5769  0021 1a02          	or	a,(OFST+0,sp)
5770  0023 6b02          	ld	(OFST+0,sp),a
5771                     ; 2116   TIM5->CCMR2 = tmpccmr2;
5773  0025 7b02          	ld	a,(OFST+0,sp)
5774  0027 c7530a        	ld	21258,a
5775                     ; 2119   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5777  002a 7b01          	ld	a,(OFST-1,sp)
5778  002c a101          	cp	a,#1
5779  002e 2606          	jrne	L1072
5780                     ; 2121     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5782  0030 721a530b      	bset	21259,#5
5784  0034 2004          	jra	L3072
5785  0036               L1072:
5786                     ; 2125     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5788  0036 721b530b      	bres	21259,#5
5789  003a               L3072:
5790                     ; 2129   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5792  003a 7218530b      	bset	21259,#4
5793                     ; 2130 }
5796  003e 5b04          	addw	sp,#4
5797  0040 81            	ret
5810                     	xdef	_TIM5_SelectHallSensor
5811                     	xdef	_TIM5_EncoderInterfaceConfig
5812                     	xdef	_TIM5_ETRConfig
5813                     	xdef	_TIM5_SelectMasterSlaveMode
5814                     	xdef	_TIM5_SelectSlaveMode
5815                     	xdef	_TIM5_SelectOutputTrigger
5816                     	xdef	_TIM5_SelectInputTrigger
5817                     	xdef	_TIM5_ETRClockMode2Config
5818                     	xdef	_TIM5_ETRClockMode1Config
5819                     	xdef	_TIM5_TIxExternalClockConfig
5820                     	xdef	_TIM5_InternalClockConfig
5821                     	xdef	_TIM5_SelectCCDMA
5822                     	xdef	_TIM5_DMACmd
5823                     	xdef	_TIM5_ClearITPendingBit
5824                     	xdef	_TIM5_GetITStatus
5825                     	xdef	_TIM5_ClearFlag
5826                     	xdef	_TIM5_GetFlagStatus
5827                     	xdef	_TIM5_GenerateEvent
5828                     	xdef	_TIM5_ITConfig
5829                     	xdef	_TIM5_SetIC2Prescaler
5830                     	xdef	_TIM5_SetIC1Prescaler
5831                     	xdef	_TIM5_GetCapture2
5832                     	xdef	_TIM5_GetCapture1
5833                     	xdef	_TIM5_PWMIConfig
5834                     	xdef	_TIM5_ICInit
5835                     	xdef	_TIM5_CCxCmd
5836                     	xdef	_TIM5_OC2PolarityConfig
5837                     	xdef	_TIM5_OC1PolarityConfig
5838                     	xdef	_TIM5_OC2FastConfig
5839                     	xdef	_TIM5_OC1FastConfig
5840                     	xdef	_TIM5_OC2PreloadConfig
5841                     	xdef	_TIM5_OC1PreloadConfig
5842                     	xdef	_TIM5_ForcedOC2Config
5843                     	xdef	_TIM5_ForcedOC1Config
5844                     	xdef	_TIM5_SetCompare2
5845                     	xdef	_TIM5_SetCompare1
5846                     	xdef	_TIM5_SelectOCxM
5847                     	xdef	_TIM5_CtrlPWMOutputs
5848                     	xdef	_TIM5_BKRConfig
5849                     	xdef	_TIM5_OC2Init
5850                     	xdef	_TIM5_OC1Init
5851                     	xdef	_TIM5_Cmd
5852                     	xdef	_TIM5_SelectOnePulseMode
5853                     	xdef	_TIM5_ARRPreloadConfig
5854                     	xdef	_TIM5_UpdateRequestConfig
5855                     	xdef	_TIM5_UpdateDisableConfig
5856                     	xdef	_TIM5_GetPrescaler
5857                     	xdef	_TIM5_GetCounter
5858                     	xdef	_TIM5_SetAutoreload
5859                     	xdef	_TIM5_SetCounter
5860                     	xdef	_TIM5_CounterModeConfig
5861                     	xdef	_TIM5_PrescalerConfig
5862                     	xdef	_TIM5_TimeBaseInit
5863                     	xdef	_TIM5_DeInit
5882                     	end
