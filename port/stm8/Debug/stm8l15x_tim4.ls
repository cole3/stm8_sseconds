   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 124 void TIM4_DeInit(void)
  32                     ; 125 {
  34                     .text:	section	.text,new
  35  0000               _TIM4_DeInit:
  39                     ; 126   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  41  0000 725f52e0      	clr	21216
  42                     ; 127   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  44  0004 725f52e1      	clr	21217
  45                     ; 128   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  47  0008 725f52e2      	clr	21218
  48                     ; 129   TIM4->IER   = TIM4_IER_RESET_VALUE;
  50  000c 725f52e4      	clr	21220
  51                     ; 130   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  53  0010 725f52e7      	clr	21223
  54                     ; 131   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  56  0014 725f52e8      	clr	21224
  57                     ; 132   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  59  0018 35ff52e9      	mov	21225,#255
  60                     ; 133   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  62  001c 725f52e5      	clr	21221
  63                     ; 134 }
  66  0020 81            	ret
 232                     ; 159 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 232                     ; 160                        uint8_t TIM4_Period)
 232                     ; 161 {
 233                     .text:	section	.text,new
 234  0000               _TIM4_TimeBaseInit:
 238                     ; 163   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 240                     ; 165   TIM4->ARR = (uint8_t)(TIM4_Period);
 242  0000 9f            	ld	a,xl
 243  0001 c752e9        	ld	21225,a
 244                     ; 167   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 246  0004 9e            	ld	a,xh
 247  0005 c752e8        	ld	21224,a
 248                     ; 170   TIM4->EGR = TIM4_EventSource_Update;
 250  0008 350152e6      	mov	21222,#1
 251                     ; 171 }
 254  000c 81            	ret
 322                     ; 199 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 322                     ; 200                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 322                     ; 201 {
 323                     .text:	section	.text,new
 324  0000               _TIM4_PrescalerConfig:
 328                     ; 203   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 330                     ; 204   assert_param(IS_TIM4_Prescaler(Prescaler));
 332                     ; 207   TIM4->PSCR = (uint8_t) Prescaler;
 334  0000 9e            	ld	a,xh
 335  0001 c752e8        	ld	21224,a
 336                     ; 210   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 338  0004 9f            	ld	a,xl
 339  0005 a101          	cp	a,#1
 340  0007 2606          	jrne	L731
 341                     ; 212     TIM4->EGR |= TIM4_EGR_UG ;
 343  0009 721052e6      	bset	21222,#0
 345  000d 2004          	jra	L141
 346  000f               L731:
 347                     ; 216     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 349  000f 721152e6      	bres	21222,#0
 350  0013               L141:
 351                     ; 218 }
 354  0013 81            	ret
 386                     ; 226 void TIM4_SetCounter(uint8_t Counter)
 386                     ; 227 {
 387                     .text:	section	.text,new
 388  0000               _TIM4_SetCounter:
 392                     ; 229   TIM4->CNTR = (uint8_t)(Counter);
 394  0000 c752e7        	ld	21223,a
 395                     ; 230 }
 398  0003 81            	ret
 430                     ; 238 void TIM4_SetAutoreload(uint8_t Autoreload)
 430                     ; 239 {
 431                     .text:	section	.text,new
 432  0000               _TIM4_SetAutoreload:
 436                     ; 241   TIM4->ARR = (uint8_t)(Autoreload);
 438  0000 c752e9        	ld	21225,a
 439                     ; 242 }
 442  0003 81            	ret
 474                     ; 249 uint8_t TIM4_GetCounter(void)
 474                     ; 250 {
 475                     .text:	section	.text,new
 476  0000               _TIM4_GetCounter:
 478  0000 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 251   uint8_t tmpcntr = 0;
 484  0001 0f01          	clr	(OFST+0,sp)
 485                     ; 252   tmpcntr = TIM4->CNTR;
 487  0003 c652e7        	ld	a,21223
 488  0006 6b01          	ld	(OFST+0,sp),a
 489                     ; 254   return ((uint8_t)tmpcntr);
 491  0008 7b01          	ld	a,(OFST+0,sp)
 494  000a 5b01          	addw	sp,#1
 495  000c 81            	ret
 519                     ; 278 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 519                     ; 279 {
 520                     .text:	section	.text,new
 521  0000               _TIM4_GetPrescaler:
 525                     ; 281   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 527  0000 c652e8        	ld	a,21224
 530  0003 81            	ret
 586                     ; 290 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 586                     ; 291 {
 587                     .text:	section	.text,new
 588  0000               _TIM4_UpdateDisableConfig:
 592                     ; 293   assert_param(IS_FUNCTIONAL_STATE(NewState));
 594                     ; 296   if (NewState != DISABLE)
 596  0000 4d            	tnz	a
 597  0001 2706          	jreq	L542
 598                     ; 298     TIM4->CR1 |= TIM4_CR1_UDIS ;
 600  0003 721252e0      	bset	21216,#1
 602  0007 2004          	jra	L742
 603  0009               L542:
 604                     ; 302     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 606  0009 721352e0      	bres	21216,#1
 607  000d               L742:
 608                     ; 304 }
 611  000d 81            	ret
 669                     ; 314 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 669                     ; 315 {
 670                     .text:	section	.text,new
 671  0000               _TIM4_UpdateRequestConfig:
 675                     ; 317   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 677                     ; 320   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 679  0000 a101          	cp	a,#1
 680  0002 2606          	jrne	L772
 681                     ; 322     TIM4->CR1 |= TIM4_CR1_URS ;
 683  0004 721452e0      	bset	21216,#2
 685  0008 2004          	jra	L103
 686  000a               L772:
 687                     ; 326     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 689  000a 721552e0      	bres	21216,#2
 690  000e               L103:
 691                     ; 328 }
 694  000e 81            	ret
 730                     ; 336 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 730                     ; 337 {
 731                     .text:	section	.text,new
 732  0000               _TIM4_ARRPreloadConfig:
 736                     ; 339   assert_param(IS_FUNCTIONAL_STATE(NewState));
 738                     ; 342   if (NewState != DISABLE)
 740  0000 4d            	tnz	a
 741  0001 2706          	jreq	L123
 742                     ; 344     TIM4->CR1 |= TIM4_CR1_ARPE ;
 744  0003 721e52e0      	bset	21216,#7
 746  0007 2004          	jra	L323
 747  0009               L123:
 748                     ; 348     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 750  0009 721f52e0      	bres	21216,#7
 751  000d               L323:
 752                     ; 350 }
 755  000d 81            	ret
 812                     ; 360 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 812                     ; 361 {
 813                     .text:	section	.text,new
 814  0000               _TIM4_SelectOnePulseMode:
 818                     ; 363   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 820                     ; 366   if (TIM4_OPMode == TIM4_OPMode_Single)
 822  0000 a101          	cp	a,#1
 823  0002 2606          	jrne	L353
 824                     ; 368     TIM4->CR1 |= TIM4_CR1_OPM ;
 826  0004 721652e0      	bset	21216,#3
 828  0008 2004          	jra	L553
 829  000a               L353:
 830                     ; 372     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 832  000a 721752e0      	bres	21216,#3
 833  000e               L553:
 834                     ; 374 }
 837  000e 81            	ret
 872                     ; 382 void TIM4_Cmd(FunctionalState NewState)
 872                     ; 383 {
 873                     .text:	section	.text,new
 874  0000               _TIM4_Cmd:
 878                     ; 385   assert_param(IS_FUNCTIONAL_STATE(NewState));
 880                     ; 388   if (NewState != DISABLE)
 882  0000 4d            	tnz	a
 883  0001 2706          	jreq	L573
 884                     ; 390     TIM4->CR1 |= TIM4_CR1_CEN ;
 886  0003 721052e0      	bset	21216,#0
 888  0007 2004          	jra	L773
 889  0009               L573:
 890                     ; 394     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 892  0009 721152e0      	bres	21216,#0
 893  000d               L773:
 894                     ; 396 }
 897  000d 81            	ret
 962                     ; 424 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 962                     ; 425 {
 963                     .text:	section	.text,new
 964  0000               _TIM4_ITConfig:
 966  0000 89            	pushw	x
 967       00000000      OFST:	set	0
 970                     ; 427   assert_param(IS_TIM4_IT(TIM4_IT));
 972                     ; 428   assert_param(IS_FUNCTIONAL_STATE(NewState));
 974                     ; 430   if (NewState != DISABLE)
 976  0001 9f            	ld	a,xl
 977  0002 4d            	tnz	a
 978  0003 2709          	jreq	L334
 979                     ; 433     TIM4->IER |= (uint8_t)TIM4_IT;
 981  0005 9e            	ld	a,xh
 982  0006 ca52e4        	or	a,21220
 983  0009 c752e4        	ld	21220,a
 985  000c 2009          	jra	L534
 986  000e               L334:
 987                     ; 438     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 989  000e 7b01          	ld	a,(OFST+1,sp)
 990  0010 43            	cpl	a
 991  0011 c452e4        	and	a,21220
 992  0014 c752e4        	ld	21220,a
 993  0017               L534:
 994                     ; 440 }
 997  0017 85            	popw	x
 998  0018 81            	ret
1055                     ; 450 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1055                     ; 451 {
1056                     .text:	section	.text,new
1057  0000               _TIM4_GenerateEvent:
1061                     ; 453   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1063                     ; 456   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1065  0000 ca52e6        	or	a,21222
1066  0003 c752e6        	ld	21222,a
1067                     ; 457 }
1070  0006 81            	ret
1156                     ; 468 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1156                     ; 469 {
1157                     .text:	section	.text,new
1158  0000               _TIM4_GetFlagStatus:
1160  0000 88            	push	a
1161       00000001      OFST:	set	1
1164                     ; 470   FlagStatus bitstatus = RESET;
1166  0001 0f01          	clr	(OFST+0,sp)
1167                     ; 473   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1169                     ; 475   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1171  0003 c452e5        	and	a,21221
1172  0006 2706          	jreq	L725
1173                     ; 477     bitstatus = SET;
1175  0008 a601          	ld	a,#1
1176  000a 6b01          	ld	(OFST+0,sp),a
1178  000c 2002          	jra	L135
1179  000e               L725:
1180                     ; 481     bitstatus = RESET;
1182  000e 0f01          	clr	(OFST+0,sp)
1183  0010               L135:
1184                     ; 483   return ((FlagStatus)bitstatus);
1186  0010 7b01          	ld	a,(OFST+0,sp)
1189  0012 5b01          	addw	sp,#1
1190  0014 81            	ret
1225                     ; 494 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1225                     ; 495 {
1226                     .text:	section	.text,new
1227  0000               _TIM4_ClearFlag:
1231                     ; 497   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1233                     ; 499   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1235  0000 43            	cpl	a
1236  0001 c752e5        	ld	21221,a
1237                     ; 500 }
1240  0004 81            	ret
1300                     ; 512 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1300                     ; 513 {
1301                     .text:	section	.text,new
1302  0000               _TIM4_GetITStatus:
1304  0000 88            	push	a
1305  0001 89            	pushw	x
1306       00000002      OFST:	set	2
1309                     ; 514   ITStatus bitstatus = RESET;
1311  0002 7b02          	ld	a,(OFST+0,sp)
1312  0004 97            	ld	xl,a
1313                     ; 516   uint8_t itStatus = 0x0, itEnable = 0x0;
1315  0005 7b01          	ld	a,(OFST-1,sp)
1316  0007 97            	ld	xl,a
1319  0008 7b02          	ld	a,(OFST+0,sp)
1320  000a 97            	ld	xl,a
1321                     ; 519   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1323                     ; 521   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1325  000b c652e5        	ld	a,21221
1326  000e 1403          	and	a,(OFST+1,sp)
1327  0010 6b01          	ld	(OFST-1,sp),a
1328                     ; 523   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1330  0012 c652e4        	ld	a,21220
1331  0015 1403          	and	a,(OFST+1,sp)
1332  0017 6b02          	ld	(OFST+0,sp),a
1333                     ; 525   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1335  0019 0d01          	tnz	(OFST-1,sp)
1336  001b 270a          	jreq	L775
1338  001d 0d02          	tnz	(OFST+0,sp)
1339  001f 2706          	jreq	L775
1340                     ; 527     bitstatus = (ITStatus)SET;
1342  0021 a601          	ld	a,#1
1343  0023 6b02          	ld	(OFST+0,sp),a
1345  0025 2002          	jra	L106
1346  0027               L775:
1347                     ; 531     bitstatus = (ITStatus)RESET;
1349  0027 0f02          	clr	(OFST+0,sp)
1350  0029               L106:
1351                     ; 533   return ((ITStatus)bitstatus);
1353  0029 7b02          	ld	a,(OFST+0,sp)
1356  002b 5b03          	addw	sp,#3
1357  002d 81            	ret
1393                     ; 544 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1393                     ; 545 {
1394                     .text:	section	.text,new
1395  0000               _TIM4_ClearITPendingBit:
1399                     ; 547   assert_param(IS_TIM4_IT(TIM4_IT));
1401                     ; 550   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1403  0000 43            	cpl	a
1404  0001 c752e5        	ld	21221,a
1405                     ; 551 }
1408  0004 81            	ret
1467                     ; 562 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1467                     ; 563 {
1468                     .text:	section	.text,new
1469  0000               _TIM4_DMACmd:
1471  0000 89            	pushw	x
1472       00000000      OFST:	set	0
1475                     ; 565   assert_param(IS_FUNCTIONAL_STATE(NewState));
1477                     ; 566   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1479                     ; 568   if (NewState != DISABLE)
1481  0001 9f            	ld	a,xl
1482  0002 4d            	tnz	a
1483  0003 2709          	jreq	L156
1484                     ; 571     TIM4->DER |= (uint8_t)TIM4_DMASource;
1486  0005 9e            	ld	a,xh
1487  0006 ca52e3        	or	a,21219
1488  0009 c752e3        	ld	21219,a
1490  000c 2009          	jra	L356
1491  000e               L156:
1492                     ; 576     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1494  000e 7b01          	ld	a,(OFST+1,sp)
1495  0010 43            	cpl	a
1496  0011 c452e3        	and	a,21219
1497  0014 c752e3        	ld	21219,a
1498  0017               L356:
1499                     ; 578 }
1502  0017 85            	popw	x
1503  0018 81            	ret
1527                     ; 601 void TIM4_InternalClockConfig(void)
1527                     ; 602 {
1528                     .text:	section	.text,new
1529  0000               _TIM4_InternalClockConfig:
1533                     ; 604   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1535  0000 c652e2        	ld	a,21218
1536  0003 a4f8          	and	a,#248
1537  0005 c752e2        	ld	21218,a
1538                     ; 605 }
1541  0008 81            	ret
1623                     ; 645 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1623                     ; 646 {
1624                     .text:	section	.text,new
1625  0000               _TIM4_SelectInputTrigger:
1627  0000 88            	push	a
1628  0001 88            	push	a
1629       00000001      OFST:	set	1
1632                     ; 647   uint8_t tmpsmcr = 0;
1634  0002 0f01          	clr	(OFST+0,sp)
1635                     ; 650   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1637                     ; 652   tmpsmcr = TIM4->SMCR;
1639  0004 c652e2        	ld	a,21218
1640  0007 6b01          	ld	(OFST+0,sp),a
1641                     ; 655   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1643  0009 7b01          	ld	a,(OFST+0,sp)
1644  000b a48f          	and	a,#143
1645  000d 6b01          	ld	(OFST+0,sp),a
1646                     ; 656   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1648  000f 7b01          	ld	a,(OFST+0,sp)
1649  0011 1a02          	or	a,(OFST+1,sp)
1650  0013 6b01          	ld	(OFST+0,sp),a
1651                     ; 658   TIM4->SMCR = (uint8_t)tmpsmcr;
1653  0015 7b01          	ld	a,(OFST+0,sp)
1654  0017 c752e2        	ld	21218,a
1655                     ; 659 }
1658  001a 85            	popw	x
1659  001b 81            	ret
1732                     ; 670 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1732                     ; 671 {
1733                     .text:	section	.text,new
1734  0000               _TIM4_SelectOutputTrigger:
1736  0000 88            	push	a
1737  0001 88            	push	a
1738       00000001      OFST:	set	1
1741                     ; 672   uint8_t tmpcr2 = 0;
1743  0002 0f01          	clr	(OFST+0,sp)
1744                     ; 675   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1746                     ; 677   tmpcr2 = TIM4->CR2;
1748  0004 c652e1        	ld	a,21217
1749  0007 6b01          	ld	(OFST+0,sp),a
1750                     ; 680   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1752  0009 7b01          	ld	a,(OFST+0,sp)
1753  000b a48f          	and	a,#143
1754  000d 6b01          	ld	(OFST+0,sp),a
1755                     ; 683   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1757  000f 7b01          	ld	a,(OFST+0,sp)
1758  0011 1a02          	or	a,(OFST+1,sp)
1759  0013 6b01          	ld	(OFST+0,sp),a
1760                     ; 685   TIM4->CR2 = tmpcr2;
1762  0015 7b01          	ld	a,(OFST+0,sp)
1763  0017 c752e1        	ld	21217,a
1764                     ; 686 }
1767  001a 85            	popw	x
1768  001b 81            	ret
1857                     ; 700 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1857                     ; 701 {
1858                     .text:	section	.text,new
1859  0000               _TIM4_SelectSlaveMode:
1861  0000 88            	push	a
1862  0001 88            	push	a
1863       00000001      OFST:	set	1
1866                     ; 702   uint8_t tmpsmcr = 0;
1868  0002 0f01          	clr	(OFST+0,sp)
1869                     ; 705   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1871                     ; 707   tmpsmcr = TIM4->SMCR;
1873  0004 c652e2        	ld	a,21218
1874  0007 6b01          	ld	(OFST+0,sp),a
1875                     ; 710   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1877  0009 7b01          	ld	a,(OFST+0,sp)
1878  000b a4f8          	and	a,#248
1879  000d 6b01          	ld	(OFST+0,sp),a
1880                     ; 713   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1882  000f 7b01          	ld	a,(OFST+0,sp)
1883  0011 1a02          	or	a,(OFST+1,sp)
1884  0013 6b01          	ld	(OFST+0,sp),a
1885                     ; 715   TIM4->SMCR = tmpsmcr;
1887  0015 7b01          	ld	a,(OFST+0,sp)
1888  0017 c752e2        	ld	21218,a
1889                     ; 716 }
1892  001a 85            	popw	x
1893  001b 81            	ret
1929                     ; 724 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1929                     ; 725 {
1930                     .text:	section	.text,new
1931  0000               _TIM4_SelectMasterSlaveMode:
1935                     ; 727   assert_param(IS_FUNCTIONAL_STATE(NewState));
1937                     ; 730   if (NewState != DISABLE)
1939  0000 4d            	tnz	a
1940  0001 2706          	jreq	L7201
1941                     ; 732     TIM4->SMCR |= TIM4_SMCR_MSM;
1943  0003 721e52e2      	bset	21218,#7
1945  0007 2004          	jra	L1301
1946  0009               L7201:
1947                     ; 736     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1949  0009 721f52e2      	bres	21218,#7
1950  000d               L1301:
1951                     ; 738 }
1954  000d 81            	ret
1967                     	xdef	_TIM4_SelectMasterSlaveMode
1968                     	xdef	_TIM4_SelectSlaveMode
1969                     	xdef	_TIM4_SelectOutputTrigger
1970                     	xdef	_TIM4_SelectInputTrigger
1971                     	xdef	_TIM4_InternalClockConfig
1972                     	xdef	_TIM4_DMACmd
1973                     	xdef	_TIM4_ClearITPendingBit
1974                     	xdef	_TIM4_GetITStatus
1975                     	xdef	_TIM4_ClearFlag
1976                     	xdef	_TIM4_GetFlagStatus
1977                     	xdef	_TIM4_GenerateEvent
1978                     	xdef	_TIM4_ITConfig
1979                     	xdef	_TIM4_Cmd
1980                     	xdef	_TIM4_SelectOnePulseMode
1981                     	xdef	_TIM4_ARRPreloadConfig
1982                     	xdef	_TIM4_UpdateRequestConfig
1983                     	xdef	_TIM4_UpdateDisableConfig
1984                     	xdef	_TIM4_GetPrescaler
1985                     	xdef	_TIM4_GetCounter
1986                     	xdef	_TIM4_SetAutoreload
1987                     	xdef	_TIM4_SetCounter
1988                     	xdef	_TIM4_PrescalerConfig
1989                     	xdef	_TIM4_TimeBaseInit
1990                     	xdef	_TIM4_DeInit
2009                     	end
