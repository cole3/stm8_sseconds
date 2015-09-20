   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 163                     ; 129 void ADC_DeInit(ADC_TypeDef* ADCx)
 163                     ; 130 {
 165                     .text:	section	.text,new
 166  0000               _ADC_DeInit:
 170                     ; 132   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 172  0000 7f            	clr	(x)
 173                     ; 133   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 175  0001 6f01          	clr	(1,x)
 176                     ; 134   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 178  0003 a61f          	ld	a,#31
 179  0005 e702          	ld	(2,x),a
 180                     ; 137   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 182  0007 a6ff          	ld	a,#255
 183  0009 e703          	ld	(3,x),a
 184                     ; 140   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 186  000b a60f          	ld	a,#15
 187  000d e706          	ld	(6,x),a
 188                     ; 141   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 190  000f a6ff          	ld	a,#255
 191  0011 e707          	ld	(7,x),a
 192                     ; 144   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 194  0013 6f08          	clr	(8,x)
 195                     ; 145   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 197  0015 6f09          	clr	(9,x)
 198                     ; 148   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 200  0017 6f0a          	clr	(10,x)
 201                     ; 149   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 203  0019 6f0b          	clr	(11,x)
 204                     ; 150   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 206  001b 6f0c          	clr	(12,x)
 207                     ; 151   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 209  001d 6f0d          	clr	(13,x)
 210                     ; 154   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 212  001f 6f0e          	clr	(14,x)
 213                     ; 155   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 215  0021 6f0f          	clr	(15,x)
 216                     ; 156   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 218  0023 6f10          	clr	(16,x)
 219                     ; 157   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 221  0025 6f11          	clr	(17,x)
 222                     ; 158 }
 225  0027 81            	ret
 372                     ; 180 void ADC_Init(ADC_TypeDef* ADCx,
 372                     ; 181               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 372                     ; 182               ADC_Resolution_TypeDef ADC_Resolution,
 372                     ; 183               ADC_Prescaler_TypeDef ADC_Prescaler)
 372                     ; 184 {
 373                     .text:	section	.text,new
 374  0000               _ADC_Init:
 376  0000 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 186   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 382                     ; 187   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 384                     ; 188   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 386                     ; 191   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 388  0001 f6            	ld	a,(x)
 389  0002 a49b          	and	a,#155
 390  0004 f7            	ld	(x),a
 391                     ; 194   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 393  0005 7b05          	ld	a,(OFST+5,sp)
 394  0007 1a06          	or	a,(OFST+6,sp)
 395  0009 fa            	or	a,(x)
 396  000a f7            	ld	(x),a
 397                     ; 197   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 399  000b e601          	ld	a,(1,x)
 400  000d a47f          	and	a,#127
 401  000f e701          	ld	(1,x),a
 402                     ; 200   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 404  0011 e601          	ld	a,(1,x)
 405  0013 1a07          	or	a,(OFST+7,sp)
 406  0015 e701          	ld	(1,x),a
 407                     ; 201 }
 410  0017 85            	popw	x
 411  0018 81            	ret
 478                     ; 210 void ADC_Cmd(ADC_TypeDef* ADCx,
 478                     ; 211              FunctionalState NewState)
 478                     ; 212 {
 479                     .text:	section	.text,new
 480  0000               _ADC_Cmd:
 482  0000 89            	pushw	x
 483       00000000      OFST:	set	0
 486                     ; 214   assert_param(IS_FUNCTIONAL_STATE(NewState));
 488                     ; 216   if (NewState != DISABLE)
 490  0001 0d05          	tnz	(OFST+5,sp)
 491  0003 2706          	jreq	L142
 492                     ; 219     ADCx->CR1 |= ADC_CR1_ADON;
 494  0005 f6            	ld	a,(x)
 495  0006 aa01          	or	a,#1
 496  0008 f7            	ld	(x),a
 498  0009 2006          	jra	L342
 499  000b               L142:
 500                     ; 224     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 502  000b 1e01          	ldw	x,(OFST+1,sp)
 503  000d f6            	ld	a,(x)
 504  000e a4fe          	and	a,#254
 505  0010 f7            	ld	(x),a
 506  0011               L342:
 507                     ; 226 }
 510  0011 85            	popw	x
 511  0012 81            	ret
 549                     ; 233 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 549                     ; 234 {
 550                     .text:	section	.text,new
 551  0000               _ADC_SoftwareStartConv:
 555                     ; 236   ADCx->CR1 |= ADC_CR1_START;
 557  0000 f6            	ld	a,(x)
 558  0001 aa02          	or	a,#2
 559  0003 f7            	ld	(x),a
 560                     ; 237 }
 563  0004 81            	ret
 691                     ; 255 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 691                     ; 256                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 691                     ; 257                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 691                     ; 258 {
 692                     .text:	section	.text,new
 693  0000               _ADC_ExternalTrigConfig:
 695  0000 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 260   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 701                     ; 261   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 703                     ; 264   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 705  0001 e601          	ld	a,(1,x)
 706  0003 a487          	and	a,#135
 707  0005 e701          	ld	(1,x),a
 708                     ; 268   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 708                     ; 269                           (uint8_t)ADC_ExtEventSelection);
 710  0007 7b06          	ld	a,(OFST+6,sp)
 711  0009 1a05          	or	a,(OFST+5,sp)
 712  000b ea01          	or	a,(1,x)
 713  000d e701          	ld	(1,x),a
 714                     ; 270 }
 717  000f 85            	popw	x
 718  0010 81            	ret
1032                     ; 333 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1032                     ; 334                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1032                     ; 335 {
1033                     .text:	section	.text,new
1034  0000               _ADC_AnalogWatchdogChannelSelect:
1036  0000 89            	pushw	x
1037       00000000      OFST:	set	0
1040                     ; 337   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1042                     ; 340   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1044  0001 e602          	ld	a,(2,x)
1045  0003 a4e0          	and	a,#224
1046  0005 e702          	ld	(2,x),a
1047                     ; 343   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1049  0007 e602          	ld	a,(2,x)
1050  0009 1a05          	or	a,(OFST+5,sp)
1051  000b e702          	ld	(2,x),a
1052                     ; 344 }
1055  000d 85            	popw	x
1056  000e 81            	ret
1108                     ; 355 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1108                     ; 356 {
1109                     .text:	section	.text,new
1110  0000               _ADC_AnalogWatchdogThresholdsConfig:
1112  0000 89            	pushw	x
1113       00000000      OFST:	set	0
1116                     ; 358   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1118                     ; 359   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1120                     ; 362   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1122  0001 7b05          	ld	a,(OFST+5,sp)
1123  0003 1e01          	ldw	x,(OFST+1,sp)
1124  0005 e706          	ld	(6,x),a
1125                     ; 363   ADCx->HTRL = (uint8_t)(HighThreshold);
1127  0007 7b06          	ld	a,(OFST+6,sp)
1128  0009 1e01          	ldw	x,(OFST+1,sp)
1129  000b e707          	ld	(7,x),a
1130                     ; 366   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1132  000d 7b07          	ld	a,(OFST+7,sp)
1133  000f 1e01          	ldw	x,(OFST+1,sp)
1134  0011 e708          	ld	(8,x),a
1135                     ; 367   ADCx->LTRL = (uint8_t)(LowThreshold);
1137  0013 7b08          	ld	a,(OFST+8,sp)
1138  0015 1e01          	ldw	x,(OFST+1,sp)
1139  0017 e709          	ld	(9,x),a
1140                     ; 368 }
1143  0019 85            	popw	x
1144  001a 81            	ret
1207                     ; 406 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1207                     ; 407                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1207                     ; 408                               uint16_t HighThreshold,
1207                     ; 409                               uint16_t LowThreshold)
1207                     ; 410 {
1208                     .text:	section	.text,new
1209  0000               _ADC_AnalogWatchdogConfig:
1211  0000 89            	pushw	x
1212       00000000      OFST:	set	0
1215                     ; 412   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1217                     ; 413   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1219                     ; 414   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1221                     ; 417   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1223  0001 e602          	ld	a,(2,x)
1224  0003 a4e0          	and	a,#224
1225  0005 e702          	ld	(2,x),a
1226                     ; 420   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1228  0007 e602          	ld	a,(2,x)
1229  0009 1a05          	or	a,(OFST+5,sp)
1230  000b e702          	ld	(2,x),a
1231                     ; 423   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1233  000d 7b06          	ld	a,(OFST+6,sp)
1234  000f 1e01          	ldw	x,(OFST+1,sp)
1235  0011 e706          	ld	(6,x),a
1236                     ; 424   ADCx->HTRL = (uint8_t)(HighThreshold);
1238  0013 7b07          	ld	a,(OFST+7,sp)
1239  0015 1e01          	ldw	x,(OFST+1,sp)
1240  0017 e707          	ld	(7,x),a
1241                     ; 427   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1243  0019 7b08          	ld	a,(OFST+8,sp)
1244  001b 1e01          	ldw	x,(OFST+1,sp)
1245  001d e708          	ld	(8,x),a
1246                     ; 428   ADCx->LTRL = (uint8_t)LowThreshold;
1248  001f 7b09          	ld	a,(OFST+9,sp)
1249  0021 1e01          	ldw	x,(OFST+1,sp)
1250  0023 e709          	ld	(9,x),a
1251                     ; 429 }
1254  0025 85            	popw	x
1255  0026 81            	ret
1290                     ; 468 void ADC_TempSensorCmd(FunctionalState NewState)
1290                     ; 469 {
1291                     .text:	section	.text,new
1292  0000               _ADC_TempSensorCmd:
1296                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1298                     ; 473   if (NewState != DISABLE)
1300  0000 4d            	tnz	a
1301  0001 2706          	jreq	L165
1302                     ; 476     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1304  0003 721a534e      	bset	21326,#5
1306  0007 2004          	jra	L365
1307  0009               L165:
1308                     ; 481     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1310  0009 721b534e      	bres	21326,#5
1311  000d               L365:
1312                     ; 483 }
1315  000d 81            	ret
1350                     ; 491 void ADC_VrefintCmd(FunctionalState NewState)
1350                     ; 492 {
1351                     .text:	section	.text,new
1352  0000               _ADC_VrefintCmd:
1356                     ; 494   assert_param(IS_FUNCTIONAL_STATE(NewState));
1358                     ; 496   if (NewState != DISABLE)
1360  0000 4d            	tnz	a
1361  0001 2706          	jreq	L306
1362                     ; 499     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1364  0003 7218534e      	bset	21326,#4
1366  0007 2004          	jra	L506
1367  0009               L306:
1368                     ; 504     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1370  0009 7219534e      	bres	21326,#4
1371  000d               L506:
1372                     ; 506 }
1375  000d 81            	ret
1685                     ; 577 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1685                     ; 578 {
1686                     .text:	section	.text,new
1687  0000               _ADC_ChannelCmd:
1689  0000 89            	pushw	x
1690  0001 88            	push	a
1691       00000001      OFST:	set	1
1694                     ; 579   uint8_t regindex = 0;
1696  0002 0f01          	clr	(OFST+0,sp)
1697                     ; 581   assert_param(IS_FUNCTIONAL_STATE(NewState));
1699                     ; 583   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1701  0004 7b06          	ld	a,(OFST+5,sp)
1702  0006 6b01          	ld	(OFST+0,sp),a
1703                     ; 585   if (NewState != DISABLE)
1705  0008 0d08          	tnz	(OFST+7,sp)
1706  000a 270f          	jreq	L157
1707                     ; 588     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1709  000c 01            	rrwa	x,a
1710  000d 1b01          	add	a,(OFST+0,sp)
1711  000f 2401          	jrnc	L23
1712  0011 5c            	incw	x
1713  0012               L23:
1714  0012 02            	rlwa	x,a
1715  0013 e60a          	ld	a,(10,x)
1716  0015 1a07          	or	a,(OFST+6,sp)
1717  0017 e70a          	ld	(10,x),a
1719  0019 2012          	jra	L357
1720  001b               L157:
1721                     ; 593     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1723  001b 7b02          	ld	a,(OFST+1,sp)
1724  001d 97            	ld	xl,a
1725  001e 7b03          	ld	a,(OFST+2,sp)
1726  0020 1b01          	add	a,(OFST+0,sp)
1727  0022 2401          	jrnc	L43
1728  0024 5c            	incw	x
1729  0025               L43:
1730  0025 02            	rlwa	x,a
1731  0026 7b07          	ld	a,(OFST+6,sp)
1732  0028 43            	cpl	a
1733  0029 e40a          	and	a,(10,x)
1734  002b e70a          	ld	(10,x),a
1735  002d               L357:
1736                     ; 595 }
1739  002d 5b03          	addw	sp,#3
1740  002f 81            	ret
1890                     ; 619 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1890                     ; 620                             ADC_Group_TypeDef ADC_GroupChannels,
1890                     ; 621                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1890                     ; 622 {
1891                     .text:	section	.text,new
1892  0000               _ADC_SamplingTimeConfig:
1894  0000 89            	pushw	x
1895       00000000      OFST:	set	0
1898                     ; 624   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1900                     ; 625   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1902                     ; 627   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1904  0001 0d05          	tnz	(OFST+5,sp)
1905  0003 2712          	jreq	L1401
1906                     ; 630     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1908  0005 e602          	ld	a,(2,x)
1909  0007 a41f          	and	a,#31
1910  0009 e702          	ld	(2,x),a
1911                     ; 631     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1913  000b 7b06          	ld	a,(OFST+6,sp)
1914  000d 4e            	swap	a
1915  000e 48            	sll	a
1916  000f a4e0          	and	a,#224
1917  0011 ea02          	or	a,(2,x)
1918  0013 e702          	ld	(2,x),a
1920  0015 2010          	jra	L3401
1921  0017               L1401:
1922                     ; 636     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1924  0017 1e01          	ldw	x,(OFST+1,sp)
1925  0019 e601          	ld	a,(1,x)
1926  001b a4f8          	and	a,#248
1927  001d e701          	ld	(1,x),a
1928                     ; 637     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1930  001f 1e01          	ldw	x,(OFST+1,sp)
1931  0021 e601          	ld	a,(1,x)
1932  0023 1a06          	or	a,(OFST+6,sp)
1933  0025 e701          	ld	(1,x),a
1934  0027               L3401:
1935                     ; 639 }
1938  0027 85            	popw	x
1939  0028 81            	ret
2004                     ; 685 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2004                     ; 686                               FunctionalState NewState)
2004                     ; 687 {
2005                     .text:	section	.text,new
2006  0000               _ADC_SchmittTriggerConfig:
2008  0000 89            	pushw	x
2009  0001 88            	push	a
2010       00000001      OFST:	set	1
2013                     ; 688   uint8_t regindex = 0;
2015  0002 0f01          	clr	(OFST+0,sp)
2016                     ; 690   assert_param(IS_FUNCTIONAL_STATE(NewState));
2018                     ; 692   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2020  0004 7b06          	ld	a,(OFST+5,sp)
2021  0006 6b01          	ld	(OFST+0,sp),a
2022                     ; 694   if (NewState != DISABLE)
2024  0008 0d08          	tnz	(OFST+7,sp)
2025  000a 2710          	jreq	L7701
2026                     ; 697     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2028  000c 01            	rrwa	x,a
2029  000d 1b01          	add	a,(OFST+0,sp)
2030  000f 2401          	jrnc	L24
2031  0011 5c            	incw	x
2032  0012               L24:
2033  0012 02            	rlwa	x,a
2034  0013 7b07          	ld	a,(OFST+6,sp)
2035  0015 43            	cpl	a
2036  0016 e40e          	and	a,(14,x)
2037  0018 e70e          	ld	(14,x),a
2039  001a 2011          	jra	L1011
2040  001c               L7701:
2041                     ; 702     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2043  001c 7b02          	ld	a,(OFST+1,sp)
2044  001e 97            	ld	xl,a
2045  001f 7b03          	ld	a,(OFST+2,sp)
2046  0021 1b01          	add	a,(OFST+0,sp)
2047  0023 2401          	jrnc	L44
2048  0025 5c            	incw	x
2049  0026               L44:
2050  0026 02            	rlwa	x,a
2051  0027 e60e          	ld	a,(14,x)
2052  0029 1a07          	or	a,(OFST+6,sp)
2053  002b e70e          	ld	(14,x),a
2054  002d               L1011:
2055                     ; 704 }
2058  002d 5b03          	addw	sp,#3
2059  002f 81            	ret
2104                     ; 711 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2104                     ; 712 {
2105                     .text:	section	.text,new
2106  0000               _ADC_GetConversionValue:
2108  0000 89            	pushw	x
2109  0001 89            	pushw	x
2110       00000002      OFST:	set	2
2113                     ; 713   uint16_t tmpreg = 0;
2115  0002 5f            	clrw	x
2116  0003 1f01          	ldw	(OFST-1,sp),x
2117                     ; 716   tmpreg = (uint16_t)(ADCx->DRH);
2119  0005 1e03          	ldw	x,(OFST+1,sp)
2120  0007 e604          	ld	a,(4,x)
2121  0009 5f            	clrw	x
2122  000a 97            	ld	xl,a
2123  000b 1f01          	ldw	(OFST-1,sp),x
2124                     ; 717   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2126  000d 1e01          	ldw	x,(OFST-1,sp)
2127  000f 4f            	clr	a
2128  0010 02            	rlwa	x,a
2129  0011 01            	rrwa	x,a
2130  0012 1603          	ldw	y,(OFST+1,sp)
2131  0014 90ea05        	or	a,(5,y)
2132  0017 02            	rlwa	x,a
2133  0018 1f01          	ldw	(OFST-1,sp),x
2134  001a 01            	rrwa	x,a
2135                     ; 720   return (uint16_t)(tmpreg) ;
2137  001b 1e01          	ldw	x,(OFST-1,sp)
2140  001d 5b04          	addw	sp,#4
2141  001f 81            	ret
2188                     ; 754 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2188                     ; 755 {
2189                     .text:	section	.text,new
2190  0000               _ADC_DMACmd:
2192  0000 89            	pushw	x
2193       00000000      OFST:	set	0
2196                     ; 757   assert_param(IS_FUNCTIONAL_STATE(NewState));
2198                     ; 759   if (NewState != DISABLE)
2200  0001 0d05          	tnz	(OFST+5,sp)
2201  0003 2708          	jreq	L1511
2202                     ; 762     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2204  0005 e60a          	ld	a,(10,x)
2205  0007 a47f          	and	a,#127
2206  0009 e70a          	ld	(10,x),a
2208  000b 2008          	jra	L3511
2209  000d               L1511:
2210                     ; 767     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2212  000d 1e01          	ldw	x,(OFST+1,sp)
2213  000f e60a          	ld	a,(10,x)
2214  0011 aa80          	or	a,#128
2215  0013 e70a          	ld	(10,x),a
2216  0015               L3511:
2217                     ; 769 }
2220  0015 85            	popw	x
2221  0016 81            	ret
2305                     ; 825 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2305                     ; 826 {
2306                     .text:	section	.text,new
2307  0000               _ADC_ITConfig:
2309  0000 89            	pushw	x
2310       00000000      OFST:	set	0
2313                     ; 828   assert_param(IS_FUNCTIONAL_STATE(NewState));
2315                     ; 829   assert_param(IS_ADC_IT(ADC_IT));
2317                     ; 831   if (NewState != DISABLE)
2319  0001 0d06          	tnz	(OFST+6,sp)
2320  0003 2706          	jreq	L7121
2321                     ; 834     ADCx->CR1 |= (uint8_t) ADC_IT;
2323  0005 f6            	ld	a,(x)
2324  0006 1a05          	or	a,(OFST+5,sp)
2325  0008 f7            	ld	(x),a
2327  0009 2007          	jra	L1221
2328  000b               L7121:
2329                     ; 839     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2331  000b 1e01          	ldw	x,(OFST+1,sp)
2332  000d 7b05          	ld	a,(OFST+5,sp)
2333  000f 43            	cpl	a
2334  0010 f4            	and	a,(x)
2335  0011 f7            	ld	(x),a
2336  0012               L1221:
2337                     ; 841 }
2340  0012 85            	popw	x
2341  0013 81            	ret
2446                     ; 853 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2446                     ; 854 {
2447                     .text:	section	.text,new
2448  0000               _ADC_GetFlagStatus:
2450  0000 89            	pushw	x
2451  0001 88            	push	a
2452       00000001      OFST:	set	1
2455                     ; 855   FlagStatus flagstatus = RESET;
2457  0002 0f01          	clr	(OFST+0,sp)
2458                     ; 858   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2460                     ; 861   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2462  0004 e603          	ld	a,(3,x)
2463  0006 1506          	bcp	a,(OFST+5,sp)
2464  0008 2706          	jreq	L5721
2465                     ; 864     flagstatus = SET;
2467  000a a601          	ld	a,#1
2468  000c 6b01          	ld	(OFST+0,sp),a
2470  000e 2002          	jra	L7721
2471  0010               L5721:
2472                     ; 869     flagstatus = RESET;
2474  0010 0f01          	clr	(OFST+0,sp)
2475  0012               L7721:
2476                     ; 873   return  flagstatus;
2478  0012 7b01          	ld	a,(OFST+0,sp)
2481  0014 5b03          	addw	sp,#3
2482  0016 81            	ret
2529                     ; 886 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2529                     ; 887                    ADC_FLAG_TypeDef ADC_FLAG)
2529                     ; 888 {
2530                     .text:	section	.text,new
2531  0000               _ADC_ClearFlag:
2533  0000 89            	pushw	x
2534       00000000      OFST:	set	0
2537                     ; 890   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2539                     ; 893   ADCx->SR = (uint8_t)~ADC_FLAG;
2541  0001 7b05          	ld	a,(OFST+5,sp)
2542  0003 43            	cpl	a
2543  0004 1e01          	ldw	x,(OFST+1,sp)
2544  0006 e703          	ld	(3,x),a
2545                     ; 894 }
2548  0008 85            	popw	x
2549  0009 81            	ret
2621                     ; 906 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2621                     ; 907                          ADC_IT_TypeDef ADC_IT)
2621                     ; 908 {
2622                     .text:	section	.text,new
2623  0000               _ADC_GetITStatus:
2625  0000 89            	pushw	x
2626  0001 5203          	subw	sp,#3
2627       00000003      OFST:	set	3
2630                     ; 909   ITStatus itstatus = RESET;
2632  0003 7b03          	ld	a,(OFST+0,sp)
2633  0005 97            	ld	xl,a
2634                     ; 910   uint8_t itmask = 0, enablestatus = 0;
2636  0006 7b03          	ld	a,(OFST+0,sp)
2637  0008 97            	ld	xl,a
2640  0009 7b02          	ld	a,(OFST-1,sp)
2641  000b 97            	ld	xl,a
2642                     ; 913   assert_param(IS_ADC_GET_IT(ADC_IT));
2644                     ; 916   itmask = (uint8_t)(ADC_IT >> 3);
2646  000c 7b08          	ld	a,(OFST+5,sp)
2647  000e 44            	srl	a
2648  000f 44            	srl	a
2649  0010 44            	srl	a
2650  0011 6b03          	ld	(OFST+0,sp),a
2651                     ; 917   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2651                     ; 918                                 (uint8_t)(itmask & (uint8_t)0x03));
2653  0013 7b03          	ld	a,(OFST+0,sp)
2654  0015 a403          	and	a,#3
2655  0017 6b01          	ld	(OFST-2,sp),a
2656  0019 7b03          	ld	a,(OFST+0,sp)
2657  001b a410          	and	a,#16
2658  001d 44            	srl	a
2659  001e 44            	srl	a
2660  001f 1a01          	or	a,(OFST-2,sp)
2661  0021 6b03          	ld	(OFST+0,sp),a
2662                     ; 921   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2664  0023 1e04          	ldw	x,(OFST+1,sp)
2665  0025 f6            	ld	a,(x)
2666  0026 1408          	and	a,(OFST+5,sp)
2667  0028 6b02          	ld	(OFST-1,sp),a
2668                     ; 924   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2670  002a 1e04          	ldw	x,(OFST+1,sp)
2671  002c e603          	ld	a,(3,x)
2672  002e 1503          	bcp	a,(OFST+0,sp)
2673  0030 270a          	jreq	L1631
2675  0032 0d02          	tnz	(OFST-1,sp)
2676  0034 2706          	jreq	L1631
2677                     ; 927     itstatus = SET;
2679  0036 a601          	ld	a,#1
2680  0038 6b03          	ld	(OFST+0,sp),a
2682  003a 2002          	jra	L3631
2683  003c               L1631:
2684                     ; 932     itstatus = RESET;
2686  003c 0f03          	clr	(OFST+0,sp)
2687  003e               L3631:
2688                     ; 936   return  itstatus;
2690  003e 7b03          	ld	a,(OFST+0,sp)
2693  0040 5b05          	addw	sp,#5
2694  0042 81            	ret
2749                     ; 949 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2749                     ; 950                            ADC_IT_TypeDef ADC_IT)
2749                     ; 951 {
2750                     .text:	section	.text,new
2751  0000               _ADC_ClearITPendingBit:
2753  0000 89            	pushw	x
2754  0001 89            	pushw	x
2755       00000002      OFST:	set	2
2758                     ; 952   uint8_t itmask = 0;
2760  0002 0f02          	clr	(OFST+0,sp)
2761                     ; 955   assert_param(IS_ADC_IT(ADC_IT));
2763                     ; 958   itmask = (uint8_t)(ADC_IT >> 3);
2765  0004 7b07          	ld	a,(OFST+5,sp)
2766  0006 44            	srl	a
2767  0007 44            	srl	a
2768  0008 44            	srl	a
2769  0009 6b02          	ld	(OFST+0,sp),a
2770                     ; 959   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2770                     ; 960                                  (uint8_t)(itmask & (uint8_t)0x03));
2772  000b 7b02          	ld	a,(OFST+0,sp)
2773  000d a403          	and	a,#3
2774  000f 6b01          	ld	(OFST-1,sp),a
2775  0011 7b02          	ld	a,(OFST+0,sp)
2776  0013 a410          	and	a,#16
2777  0015 44            	srl	a
2778  0016 44            	srl	a
2779  0017 1a01          	or	a,(OFST-1,sp)
2780  0019 6b02          	ld	(OFST+0,sp),a
2781                     ; 963   ADCx->SR = (uint8_t)~itmask;
2783  001b 7b02          	ld	a,(OFST+0,sp)
2784  001d 43            	cpl	a
2785  001e 1e03          	ldw	x,(OFST+1,sp)
2786  0020 e703          	ld	(3,x),a
2787                     ; 964 }
2790  0022 5b04          	addw	sp,#4
2791  0024 81            	ret
2804                     	xdef	_ADC_ClearITPendingBit
2805                     	xdef	_ADC_GetITStatus
2806                     	xdef	_ADC_ClearFlag
2807                     	xdef	_ADC_GetFlagStatus
2808                     	xdef	_ADC_ITConfig
2809                     	xdef	_ADC_DMACmd
2810                     	xdef	_ADC_GetConversionValue
2811                     	xdef	_ADC_SchmittTriggerConfig
2812                     	xdef	_ADC_SamplingTimeConfig
2813                     	xdef	_ADC_ChannelCmd
2814                     	xdef	_ADC_VrefintCmd
2815                     	xdef	_ADC_TempSensorCmd
2816                     	xdef	_ADC_AnalogWatchdogConfig
2817                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2818                     	xdef	_ADC_AnalogWatchdogChannelSelect
2819                     	xdef	_ADC_ExternalTrigConfig
2820                     	xdef	_ADC_SoftwareStartConv
2821                     	xdef	_ADC_Cmd
2822                     	xdef	_ADC_Init
2823                     	xdef	_ADC_DeInit
2842                     	end
