   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 124 void TIM4_DeInit(void)
  32                     ; 125 {
  34                     	switch	.text
  35  0000               _TIM4_DeInit:
  39                     ; 126     TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  41  0000 725f52e0      	clr	21216
  42                     ; 127     TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  44  0004 725f52e1      	clr	21217
  45                     ; 128     TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  47  0008 725f52e2      	clr	21218
  48                     ; 129     TIM4->IER   = TIM4_IER_RESET_VALUE;
  50  000c 725f52e4      	clr	21220
  51                     ; 130     TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  53  0010 725f52e7      	clr	21223
  54                     ; 131     TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  56  0014 725f52e8      	clr	21224
  57                     ; 132     TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  59  0018 35ff52e9      	mov	21225,#255
  60                     ; 133     TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  62  001c 725f52e5      	clr	21221
  63                     ; 134 }
  66  0020 81            	ret
 234                     ; 159 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 234                     ; 160                        uint8_t TIM4_Period)
 234                     ; 161 {
 235                     	switch	.text
 236  0021               _TIM4_TimeBaseInit:
 240                     ; 163     assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 242                     ; 165     TIM4->ARR = (uint8_t)(TIM4_Period);
 244  0021 9f            	ld	a,xl
 245  0022 c752e9        	ld	21225,a
 246                     ; 167     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 248  0025 9e            	ld	a,xh
 249  0026 c752e8        	ld	21224,a
 250                     ; 170     TIM4->EGR = TIM4_EventSource_Update;
 252  0029 350152e6      	mov	21222,#1
 253                     ; 171 }
 256  002d 81            	ret
 324                     ; 199 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 324                     ; 200                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 324                     ; 201 {
 325                     	switch	.text
 326  002e               _TIM4_PrescalerConfig:
 330                     ; 203     assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 332                     ; 204     assert_param(IS_TIM4_Prescaler(Prescaler));
 334                     ; 207     TIM4->PSCR = (uint8_t) Prescaler;
 336  002e 9e            	ld	a,xh
 337  002f c752e8        	ld	21224,a
 338                     ; 210     if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate) {
 340  0032 9f            	ld	a,xl
 341  0033 a101          	cp	a,#1
 342  0035 2606          	jrne	L141
 343                     ; 211         TIM4->EGR |= TIM4_EGR_UG ;
 345  0037 721052e6      	bset	21222,#0
 347  003b 2004          	jra	L341
 348  003d               L141:
 349                     ; 213         TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 351  003d 721152e6      	bres	21222,#0
 352  0041               L341:
 353                     ; 215 }
 356  0041 81            	ret
 390                     ; 223 void TIM4_SetCounter(uint8_t Counter)
 390                     ; 224 {
 391                     	switch	.text
 392  0042               _TIM4_SetCounter:
 396                     ; 226     TIM4->CNTR = (uint8_t)(Counter);
 398  0042 c752e7        	ld	21223,a
 399                     ; 227 }
 402  0045 81            	ret
 436                     ; 235 void TIM4_SetAutoreload(uint8_t Autoreload)
 436                     ; 236 {
 437                     	switch	.text
 438  0046               _TIM4_SetAutoreload:
 442                     ; 238     TIM4->ARR = (uint8_t)(Autoreload);
 444  0046 c752e9        	ld	21225,a
 445                     ; 239 }
 448  0049 81            	ret
 482                     ; 246 uint8_t TIM4_GetCounter(void)
 482                     ; 247 {
 483                     	switch	.text
 484  004a               _TIM4_GetCounter:
 486  004a 88            	push	a
 487       00000001      OFST:	set	1
 490                     ; 248     uint8_t tmpcntr = 0;
 492  004b 0f01          	clr	(OFST+0,sp)
 493                     ; 249     tmpcntr = TIM4->CNTR;
 495  004d c652e7        	ld	a,21223
 496  0050 6b01          	ld	(OFST+0,sp),a
 497                     ; 251     return ((uint8_t)tmpcntr);
 499  0052 7b01          	ld	a,(OFST+0,sp)
 502  0054 5b01          	addw	sp,#1
 503  0056 81            	ret
 527                     ; 275 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 527                     ; 276 {
 528                     	switch	.text
 529  0057               _TIM4_GetPrescaler:
 533                     ; 278     return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 535  0057 c652e8        	ld	a,21224
 538  005a 81            	ret
 594                     ; 287 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 594                     ; 288 {
 595                     	switch	.text
 596  005b               _TIM4_UpdateDisableConfig:
 600                     ; 290     assert_param(IS_FUNCTIONAL_STATE(NewState));
 602                     ; 293     if (NewState != DISABLE) {
 604  005b 4d            	tnz	a
 605  005c 2706          	jreq	L552
 606                     ; 294         TIM4->CR1 |= TIM4_CR1_UDIS ;
 608  005e 721252e0      	bset	21216,#1
 610  0062 2004          	jra	L752
 611  0064               L552:
 612                     ; 296         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 614  0064 721352e0      	bres	21216,#1
 615  0068               L752:
 616                     ; 298 }
 619  0068 81            	ret
 677                     ; 308 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 677                     ; 309 {
 678                     	switch	.text
 679  0069               _TIM4_UpdateRequestConfig:
 683                     ; 311     assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 685                     ; 314     if (TIM4_UpdateSource == TIM4_UpdateSource_Regular) {
 687  0069 a101          	cp	a,#1
 688  006b 2606          	jrne	L703
 689                     ; 315         TIM4->CR1 |= TIM4_CR1_URS ;
 691  006d 721452e0      	bset	21216,#2
 693  0071 2004          	jra	L113
 694  0073               L703:
 695                     ; 317         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 697  0073 721552e0      	bres	21216,#2
 698  0077               L113:
 699                     ; 319 }
 702  0077 81            	ret
 738                     ; 327 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 738                     ; 328 {
 739                     	switch	.text
 740  0078               _TIM4_ARRPreloadConfig:
 744                     ; 330     assert_param(IS_FUNCTIONAL_STATE(NewState));
 746                     ; 333     if (NewState != DISABLE) {
 748  0078 4d            	tnz	a
 749  0079 2706          	jreq	L133
 750                     ; 334         TIM4->CR1 |= TIM4_CR1_ARPE ;
 752  007b 721e52e0      	bset	21216,#7
 754  007f 2004          	jra	L333
 755  0081               L133:
 756                     ; 336         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 758  0081 721f52e0      	bres	21216,#7
 759  0085               L333:
 760                     ; 338 }
 763  0085 81            	ret
 820                     ; 348 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 820                     ; 349 {
 821                     	switch	.text
 822  0086               _TIM4_SelectOnePulseMode:
 826                     ; 351     assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 828                     ; 354     if (TIM4_OPMode == TIM4_OPMode_Single) {
 830  0086 a101          	cp	a,#1
 831  0088 2606          	jrne	L363
 832                     ; 355         TIM4->CR1 |= TIM4_CR1_OPM ;
 834  008a 721652e0      	bset	21216,#3
 836  008e 2004          	jra	L563
 837  0090               L363:
 838                     ; 357         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 840  0090 721752e0      	bres	21216,#3
 841  0094               L563:
 842                     ; 359 }
 845  0094 81            	ret
 880                     ; 367 void TIM4_Cmd(FunctionalState NewState)
 880                     ; 368 {
 881                     	switch	.text
 882  0095               _TIM4_Cmd:
 886                     ; 370     assert_param(IS_FUNCTIONAL_STATE(NewState));
 888                     ; 373     if (NewState != DISABLE) {
 890  0095 4d            	tnz	a
 891  0096 2706          	jreq	L504
 892                     ; 374         TIM4->CR1 |= TIM4_CR1_CEN ;
 894  0098 721052e0      	bset	21216,#0
 896  009c 2004          	jra	L704
 897  009e               L504:
 898                     ; 376         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 900  009e 721152e0      	bres	21216,#0
 901  00a2               L704:
 902                     ; 378 }
 905  00a2 81            	ret
 970                     ; 406 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 970                     ; 407 {
 971                     	switch	.text
 972  00a3               _TIM4_ITConfig:
 974  00a3 89            	pushw	x
 975       00000000      OFST:	set	0
 978                     ; 409     assert_param(IS_TIM4_IT(TIM4_IT));
 980                     ; 410     assert_param(IS_FUNCTIONAL_STATE(NewState));
 982                     ; 412     if (NewState != DISABLE) {
 984  00a4 9f            	ld	a,xl
 985  00a5 4d            	tnz	a
 986  00a6 2709          	jreq	L344
 987                     ; 414         TIM4->IER |= (uint8_t)TIM4_IT;
 989  00a8 9e            	ld	a,xh
 990  00a9 ca52e4        	or	a,21220
 991  00ac c752e4        	ld	21220,a
 993  00af 2009          	jra	L544
 994  00b1               L344:
 995                     ; 417         TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 997  00b1 7b01          	ld	a,(OFST+1,sp)
 998  00b3 43            	cpl	a
 999  00b4 c452e4        	and	a,21220
1000  00b7 c752e4        	ld	21220,a
1001  00ba               L544:
1002                     ; 419 }
1005  00ba 85            	popw	x
1006  00bb 81            	ret
1063                     ; 429 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1063                     ; 430 {
1064                     	switch	.text
1065  00bc               _TIM4_GenerateEvent:
1069                     ; 432     assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1071                     ; 435     TIM4->EGR |= (uint8_t)TIM4_EventSource;
1073  00bc ca52e6        	or	a,21222
1074  00bf c752e6        	ld	21222,a
1075                     ; 436 }
1078  00c2 81            	ret
1164                     ; 447 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1164                     ; 448 {
1165                     	switch	.text
1166  00c3               _TIM4_GetFlagStatus:
1168  00c3 88            	push	a
1169       00000001      OFST:	set	1
1172                     ; 449     FlagStatus bitstatus = RESET;
1174  00c4 0f01          	clr	(OFST+0,sp)
1175                     ; 452     assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1177                     ; 454     if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0) {
1179  00c6 c452e5        	and	a,21221
1180  00c9 2706          	jreq	L735
1181                     ; 455         bitstatus = SET;
1183  00cb a601          	ld	a,#1
1184  00cd 6b01          	ld	(OFST+0,sp),a
1186  00cf 2002          	jra	L145
1187  00d1               L735:
1188                     ; 457         bitstatus = RESET;
1190  00d1 0f01          	clr	(OFST+0,sp)
1191  00d3               L145:
1192                     ; 459     return ((FlagStatus)bitstatus);
1194  00d3 7b01          	ld	a,(OFST+0,sp)
1197  00d5 5b01          	addw	sp,#1
1198  00d7 81            	ret
1233                     ; 470 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1233                     ; 471 {
1234                     	switch	.text
1235  00d8               _TIM4_ClearFlag:
1239                     ; 473     assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1241                     ; 475     TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1243  00d8 43            	cpl	a
1244  00d9 c752e5        	ld	21221,a
1245                     ; 476 }
1248  00dc 81            	ret
1312                     ; 488 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1312                     ; 489 {
1313                     	switch	.text
1314  00dd               _TIM4_GetITStatus:
1316  00dd 88            	push	a
1317  00de 89            	pushw	x
1318       00000002      OFST:	set	2
1321                     ; 490     ITStatus bitstatus = RESET;
1323  00df 7b02          	ld	a,(OFST+0,sp)
1324  00e1 97            	ld	xl,a
1325                     ; 492     uint8_t itStatus = 0x0, itEnable = 0x0;
1327  00e2 7b01          	ld	a,(OFST-1,sp)
1328  00e4 97            	ld	xl,a
1331  00e5 7b02          	ld	a,(OFST+0,sp)
1332  00e7 97            	ld	xl,a
1333                     ; 495     assert_param(IS_TIM4_GET_IT(TIM4_IT));
1335                     ; 497     itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1337  00e8 c652e5        	ld	a,21221
1338  00eb 1403          	and	a,(OFST+1,sp)
1339  00ed 6b01          	ld	(OFST-1,sp),a
1340                     ; 499     itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1342  00ef c652e4        	ld	a,21220
1343  00f2 1403          	and	a,(OFST+1,sp)
1344  00f4 6b02          	ld	(OFST+0,sp),a
1345                     ; 501     if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET )) {
1347  00f6 0d01          	tnz	(OFST-1,sp)
1348  00f8 270a          	jreq	L316
1350  00fa 0d02          	tnz	(OFST+0,sp)
1351  00fc 2706          	jreq	L316
1352                     ; 502         bitstatus = (ITStatus)SET;
1354  00fe a601          	ld	a,#1
1355  0100 6b02          	ld	(OFST+0,sp),a
1357  0102 2002          	jra	L516
1358  0104               L316:
1359                     ; 504         bitstatus = (ITStatus)RESET;
1361  0104 0f02          	clr	(OFST+0,sp)
1362  0106               L516:
1363                     ; 506     return ((ITStatus)bitstatus);
1365  0106 7b02          	ld	a,(OFST+0,sp)
1368  0108 5b03          	addw	sp,#3
1369  010a 81            	ret
1405                     ; 517 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1405                     ; 518 {
1406                     	switch	.text
1407  010b               _TIM4_ClearITPendingBit:
1411                     ; 520     assert_param(IS_TIM4_IT(TIM4_IT));
1413                     ; 523     TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1415  010b 43            	cpl	a
1416  010c c752e5        	ld	21221,a
1417                     ; 524 }
1420  010f 81            	ret
1479                     ; 535 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1479                     ; 536 {
1480                     	switch	.text
1481  0110               _TIM4_DMACmd:
1483  0110 89            	pushw	x
1484       00000000      OFST:	set	0
1487                     ; 538     assert_param(IS_FUNCTIONAL_STATE(NewState));
1489                     ; 539     assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1491                     ; 541     if (NewState != DISABLE) {
1493  0111 9f            	ld	a,xl
1494  0112 4d            	tnz	a
1495  0113 2709          	jreq	L566
1496                     ; 543         TIM4->DER |= (uint8_t)TIM4_DMASource;
1498  0115 9e            	ld	a,xh
1499  0116 ca52e3        	or	a,21219
1500  0119 c752e3        	ld	21219,a
1502  011c 2009          	jra	L766
1503  011e               L566:
1504                     ; 546         TIM4->DER &= (uint8_t)~TIM4_DMASource;
1506  011e 7b01          	ld	a,(OFST+1,sp)
1507  0120 43            	cpl	a
1508  0121 c452e3        	and	a,21219
1509  0124 c752e3        	ld	21219,a
1510  0127               L766:
1511                     ; 548 }
1514  0127 85            	popw	x
1515  0128 81            	ret
1539                     ; 571 void TIM4_InternalClockConfig(void)
1539                     ; 572 {
1540                     	switch	.text
1541  0129               _TIM4_InternalClockConfig:
1545                     ; 574     TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1547  0129 c652e2        	ld	a,21218
1548  012c a4f8          	and	a,#248
1549  012e c752e2        	ld	21218,a
1550                     ; 575 }
1553  0131 81            	ret
1637                     ; 615 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1637                     ; 616 {
1638                     	switch	.text
1639  0132               _TIM4_SelectInputTrigger:
1641  0132 88            	push	a
1642  0133 88            	push	a
1643       00000001      OFST:	set	1
1646                     ; 617     uint8_t tmpsmcr = 0;
1648  0134 0f01          	clr	(OFST+0,sp)
1649                     ; 620     assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1651                     ; 622     tmpsmcr = TIM4->SMCR;
1653  0136 c652e2        	ld	a,21218
1654  0139 6b01          	ld	(OFST+0,sp),a
1655                     ; 625     tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1657  013b 7b01          	ld	a,(OFST+0,sp)
1658  013d a48f          	and	a,#143
1659  013f 6b01          	ld	(OFST+0,sp),a
1660                     ; 626     tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1662  0141 7b01          	ld	a,(OFST+0,sp)
1663  0143 1a02          	or	a,(OFST+1,sp)
1664  0145 6b01          	ld	(OFST+0,sp),a
1665                     ; 628     TIM4->SMCR = (uint8_t)tmpsmcr;
1667  0147 7b01          	ld	a,(OFST+0,sp)
1668  0149 c752e2        	ld	21218,a
1669                     ; 629 }
1672  014c 85            	popw	x
1673  014d 81            	ret
1748                     ; 640 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1748                     ; 641 {
1749                     	switch	.text
1750  014e               _TIM4_SelectOutputTrigger:
1752  014e 88            	push	a
1753  014f 88            	push	a
1754       00000001      OFST:	set	1
1757                     ; 642     uint8_t tmpcr2 = 0;
1759  0150 0f01          	clr	(OFST+0,sp)
1760                     ; 645     assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1762                     ; 647     tmpcr2 = TIM4->CR2;
1764  0152 c652e1        	ld	a,21217
1765  0155 6b01          	ld	(OFST+0,sp),a
1766                     ; 650     tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1768  0157 7b01          	ld	a,(OFST+0,sp)
1769  0159 a48f          	and	a,#143
1770  015b 6b01          	ld	(OFST+0,sp),a
1771                     ; 653     tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1773  015d 7b01          	ld	a,(OFST+0,sp)
1774  015f 1a02          	or	a,(OFST+1,sp)
1775  0161 6b01          	ld	(OFST+0,sp),a
1776                     ; 655     TIM4->CR2 = tmpcr2;
1778  0163 7b01          	ld	a,(OFST+0,sp)
1779  0165 c752e1        	ld	21217,a
1780                     ; 656 }
1783  0168 85            	popw	x
1784  0169 81            	ret
1875                     ; 670 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1875                     ; 671 {
1876                     	switch	.text
1877  016a               _TIM4_SelectSlaveMode:
1879  016a 88            	push	a
1880  016b 88            	push	a
1881       00000001      OFST:	set	1
1884                     ; 672     uint8_t tmpsmcr = 0;
1886  016c 0f01          	clr	(OFST+0,sp)
1887                     ; 675     assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1889                     ; 677     tmpsmcr = TIM4->SMCR;
1891  016e c652e2        	ld	a,21218
1892  0171 6b01          	ld	(OFST+0,sp),a
1893                     ; 680     tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1895  0173 7b01          	ld	a,(OFST+0,sp)
1896  0175 a4f8          	and	a,#248
1897  0177 6b01          	ld	(OFST+0,sp),a
1898                     ; 683     tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1900  0179 7b01          	ld	a,(OFST+0,sp)
1901  017b 1a02          	or	a,(OFST+1,sp)
1902  017d 6b01          	ld	(OFST+0,sp),a
1903                     ; 685     TIM4->SMCR = tmpsmcr;
1905  017f 7b01          	ld	a,(OFST+0,sp)
1906  0181 c752e2        	ld	21218,a
1907                     ; 686 }
1910  0184 85            	popw	x
1911  0185 81            	ret
1947                     ; 694 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1947                     ; 695 {
1948                     	switch	.text
1949  0186               _TIM4_SelectMasterSlaveMode:
1953                     ; 697     assert_param(IS_FUNCTIONAL_STATE(NewState));
1955                     ; 700     if (NewState != DISABLE) {
1957  0186 4d            	tnz	a
1958  0187 2706          	jreq	L1501
1959                     ; 701         TIM4->SMCR |= TIM4_SMCR_MSM;
1961  0189 721e52e2      	bset	21218,#7
1963  018d 2004          	jra	L3501
1964  018f               L1501:
1965                     ; 703         TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1967  018f 721f52e2      	bres	21218,#7
1968  0193               L3501:
1969                     ; 705 }
1972  0193 81            	ret
1985                     	xdef	_TIM4_SelectMasterSlaveMode
1986                     	xdef	_TIM4_SelectSlaveMode
1987                     	xdef	_TIM4_SelectOutputTrigger
1988                     	xdef	_TIM4_SelectInputTrigger
1989                     	xdef	_TIM4_InternalClockConfig
1990                     	xdef	_TIM4_DMACmd
1991                     	xdef	_TIM4_ClearITPendingBit
1992                     	xdef	_TIM4_GetITStatus
1993                     	xdef	_TIM4_ClearFlag
1994                     	xdef	_TIM4_GetFlagStatus
1995                     	xdef	_TIM4_GenerateEvent
1996                     	xdef	_TIM4_ITConfig
1997                     	xdef	_TIM4_Cmd
1998                     	xdef	_TIM4_SelectOnePulseMode
1999                     	xdef	_TIM4_ARRPreloadConfig
2000                     	xdef	_TIM4_UpdateRequestConfig
2001                     	xdef	_TIM4_UpdateDisableConfig
2002                     	xdef	_TIM4_GetPrescaler
2003                     	xdef	_TIM4_GetCounter
2004                     	xdef	_TIM4_SetAutoreload
2005                     	xdef	_TIM4_SetCounter
2006                     	xdef	_TIM4_PrescalerConfig
2007                     	xdef	_TIM4_TimeBaseInit
2008                     	xdef	_TIM4_DeInit
2027                     	end
