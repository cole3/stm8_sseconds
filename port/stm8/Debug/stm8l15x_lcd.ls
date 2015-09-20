   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 115 void LCD_DeInit(void)
  41                     ; 116 {
  43                     .text:	section	.text,new
  44  0000               _LCD_DeInit:
  46  0000 88            	push	a
  47       00000001      OFST:	set	1
  50                     ; 117   uint8_t counter = 0;
  52  0001 0f01          	clr	(OFST+0,sp)
  53                     ; 119   LCD->CR1 = LCD_CR1_RESET_VALUE;
  55  0003 725f5400      	clr	21504
  56                     ; 120   LCD->CR2 = LCD_CR2_RESET_VALUE;
  58  0007 725f5401      	clr	21505
  59                     ; 121   LCD->CR3 = LCD_CR3_RESET_VALUE;
  61  000b 725f5402      	clr	21506
  62                     ; 122   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  64  000f 725f5403      	clr	21507
  65                     ; 124   for (counter = 0;counter < 0x05; counter++)
  67  0013 0f01          	clr	(OFST+0,sp)
  68  0015               L52:
  69                     ; 126     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  71  0015 7b01          	ld	a,(OFST+0,sp)
  72  0017 5f            	clrw	x
  73  0018 97            	ld	xl,a
  74  0019 724f5404      	clr	(21508,x)
  75                     ; 124   for (counter = 0;counter < 0x05; counter++)
  77  001d 0c01          	inc	(OFST+0,sp)
  80  001f 7b01          	ld	a,(OFST+0,sp)
  81  0021 a105          	cp	a,#5
  82  0023 25f0          	jrult	L52
  83                     ; 129   for (counter = 0;counter < 0x16; counter++)
  85  0025 0f01          	clr	(OFST+0,sp)
  86  0027               L33:
  87                     ; 131     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
  89  0027 7b01          	ld	a,(OFST+0,sp)
  90  0029 5f            	clrw	x
  91  002a 97            	ld	xl,a
  92  002b 724f540c      	clr	(21516,x)
  93                     ; 129   for (counter = 0;counter < 0x16; counter++)
  95  002f 0c01          	inc	(OFST+0,sp)
  98  0031 7b01          	ld	a,(OFST+0,sp)
  99  0033 a116          	cp	a,#22
 100  0035 25f0          	jrult	L33
 101                     ; 134   LCD->CR4 = LCD_CR4_RESET_VALUE;
 103  0037 725f542f      	clr	21551
 104                     ; 136 }
 107  003b 84            	pop	a
 108  003c 81            	ret
 511                     ; 194 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 511                     ; 195               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 511                     ; 196               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 511                     ; 197 {
 512                     .text:	section	.text,new
 513  0000               _LCD_Init:
 515  0000 89            	pushw	x
 516       00000000      OFST:	set	0
 519                     ; 199   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 521                     ; 200   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 523                     ; 201   assert_param(IS_LCD_DUTY(LCD_Duty));
 525                     ; 202   assert_param(IS_LCD_BIAS(LCD_Bias));
 527                     ; 203   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 529                     ; 205   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 531  0001 c65403        	ld	a,21507
 532  0004 a40f          	and	a,#15
 533  0006 c75403        	ld	21507,a
 534                     ; 206   LCD->FRQ |= LCD_Prescaler;
 536  0009 9e            	ld	a,xh
 537  000a ca5403        	or	a,21507
 538  000d c75403        	ld	21507,a
 539                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 541  0010 c65403        	ld	a,21507
 542  0013 a4f0          	and	a,#240
 543  0015 c75403        	ld	21507,a
 544                     ; 209   LCD->FRQ |= LCD_Divider;
 546  0018 9f            	ld	a,xl
 547  0019 ca5403        	or	a,21507
 548  001c c75403        	ld	21507,a
 549                     ; 212   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 551  001f c65400        	ld	a,21504
 552  0022 a4f9          	and	a,#249
 553  0024 c75400        	ld	21504,a
 554                     ; 213   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 556  0027 7213542f      	bres	21551,#1
 557                     ; 215   if (LCD_Duty == LCD_Duty_1_8)
 559  002b 7b05          	ld	a,(OFST+5,sp)
 560  002d a120          	cp	a,#32
 561  002f 260f          	jrne	L742
 562                     ; 217     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 564  0031 7b05          	ld	a,(OFST+5,sp)
 565  0033 a4f0          	and	a,#240
 566  0035 4e            	swap	a
 567  0036 a40f          	and	a,#15
 568  0038 ca542f        	or	a,21551
 569  003b c7542f        	ld	21551,a
 571  003e 200a          	jra	L152
 572  0040               L742:
 573                     ; 221     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 575  0040 7b05          	ld	a,(OFST+5,sp)
 576  0042 a40f          	and	a,#15
 577  0044 ca5400        	or	a,21504
 578  0047 c75400        	ld	21504,a
 579  004a               L152:
 580                     ; 225   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 582  004a 72115400      	bres	21504,#0
 583                     ; 226   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 585  004e 7211542f      	bres	21551,#0
 586                     ; 228   if (LCD_Bias == LCD_Bias_1_4)
 588  0052 7b06          	ld	a,(OFST+6,sp)
 589  0054 a110          	cp	a,#16
 590  0056 2619          	jrne	L352
 591                     ; 230     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 593  0058 7b06          	ld	a,(OFST+6,sp)
 594  005a a40f          	and	a,#15
 595  005c ca5400        	or	a,21504
 596  005f c75400        	ld	21504,a
 597                     ; 231     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 599  0062 7b06          	ld	a,(OFST+6,sp)
 600  0064 a4f0          	and	a,#240
 601  0066 4e            	swap	a
 602  0067 a40f          	and	a,#15
 603  0069 ca542f        	or	a,21551
 604  006c c7542f        	ld	21551,a
 606  006f 200a          	jra	L552
 607  0071               L352:
 608                     ; 235     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 610  0071 7b06          	ld	a,(OFST+6,sp)
 611  0073 a40f          	and	a,#15
 612  0075 ca5400        	or	a,21504
 613  0078 c75400        	ld	21504,a
 614  007b               L552:
 615                     ; 238   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 617  007b 72115401      	bres	21505,#0
 618                     ; 239   LCD->CR2 |= LCD_VoltageSource;
 620  007f c65401        	ld	a,21505
 621  0082 1a07          	or	a,(OFST+7,sp)
 622  0084 c75401        	ld	21505,a
 623                     ; 241 }
 626  0087 85            	popw	x
 627  0088 81            	ret
 724                     ; 256 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 724                     ; 257 {
 725                     .text:	section	.text,new
 726  0000               _LCD_PortMaskConfig:
 728  0000 89            	pushw	x
 729       00000000      OFST:	set	0
 732                     ; 259   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 734                     ; 262   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 736  0001 9e            	ld	a,xh
 737  0002 5f            	clrw	x
 738  0003 97            	ld	xl,a
 739  0004 7b02          	ld	a,(OFST+2,sp)
 740  0006 d75404        	ld	(21508,x),a
 741                     ; 264 }
 744  0009 85            	popw	x
 745  000a 81            	ret
 800                     ; 273 void LCD_Cmd(FunctionalState NewState)
 800                     ; 274 {
 801                     .text:	section	.text,new
 802  0000               _LCD_Cmd:
 806                     ; 276   assert_param(IS_FUNCTIONAL_STATE(NewState));
 808                     ; 278   if (NewState != DISABLE)
 810  0000 4d            	tnz	a
 811  0001 2706          	jreq	L543
 812                     ; 280     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 814  0003 721c5402      	bset	21506,#6
 816  0007 2004          	jra	L743
 817  0009               L543:
 818                     ; 284     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 820  0009 721d5402      	bres	21506,#6
 821  000d               L743:
 822                     ; 286 }
 825  000d 81            	ret
 860                     ; 299 void LCD_HighDriveCmd(FunctionalState NewState)
 860                     ; 300 {
 861                     .text:	section	.text,new
 862  0000               _LCD_HighDriveCmd:
 866                     ; 302   assert_param(IS_FUNCTIONAL_STATE(NewState));
 868                     ; 304   if (NewState != DISABLE)
 870  0000 4d            	tnz	a
 871  0001 2706          	jreq	L763
 872                     ; 306     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 874  0003 72185401      	bset	21505,#4
 876  0007 2004          	jra	L173
 877  0009               L763:
 878                     ; 310     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 880  0009 72195401      	bres	21505,#4
 881  000d               L173:
 882                     ; 312 }
 885  000d 81            	ret
 992                     ; 329 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 992                     ; 330 {
 993                     .text:	section	.text,new
 994  0000               _LCD_PulseOnDurationConfig:
 996  0000 88            	push	a
 997       00000000      OFST:	set	0
1000                     ; 332   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1002                     ; 334   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1004  0001 c65401        	ld	a,21505
1005  0004 a41f          	and	a,#31
1006  0006 c75401        	ld	21505,a
1007                     ; 335   LCD->CR2 |= LCD_PulseOnDuration;
1009  0009 c65401        	ld	a,21505
1010  000c 1a01          	or	a,(OFST+1,sp)
1011  000e c75401        	ld	21505,a
1012                     ; 336 }
1015  0011 84            	pop	a
1016  0012 81            	ret
1113                     ; 352 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1113                     ; 353 {
1114                     .text:	section	.text,new
1115  0000               _LCD_DeadTimeConfig:
1117  0000 88            	push	a
1118       00000000      OFST:	set	0
1121                     ; 355   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1123                     ; 357   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1125  0001 c65402        	ld	a,21506
1126  0004 a4f8          	and	a,#248
1127  0006 c75402        	ld	21506,a
1128                     ; 359   LCD->CR3 |= LCD_DeadTime;
1130  0009 c65402        	ld	a,21506
1131  000c 1a01          	or	a,(OFST+1,sp)
1132  000e c75402        	ld	21506,a
1133                     ; 361 }
1136  0011 84            	pop	a
1137  0012 81            	ret
1289                     ; 385 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1289                     ; 386 {
1290                     .text:	section	.text,new
1291  0000               _LCD_BlinkConfig:
1295                     ; 388   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1297                     ; 389   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1299                     ; 391   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1301  0000 c65400        	ld	a,21504
1302  0003 a43f          	and	a,#63
1303  0005 c75400        	ld	21504,a
1304                     ; 392   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1306  0008 9e            	ld	a,xh
1307  0009 ca5400        	or	a,21504
1308  000c c75400        	ld	21504,a
1309                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1311  000f c65400        	ld	a,21504
1312  0012 a4c7          	and	a,#199
1313  0014 c75400        	ld	21504,a
1314                     ; 395   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1316  0017 9f            	ld	a,xl
1317  0018 ca5400        	or	a,21504
1318  001b c75400        	ld	21504,a
1319                     ; 397 }
1322  001e 81            	ret
1427                     ; 413 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1427                     ; 414 {
1428                     .text:	section	.text,new
1429  0000               _LCD_ContrastConfig:
1431  0000 88            	push	a
1432       00000000      OFST:	set	0
1435                     ; 416   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1437                     ; 418   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1439  0001 c65401        	ld	a,21505
1440  0004 a4f1          	and	a,#241
1441  0006 c75401        	ld	21505,a
1442                     ; 419   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1444  0009 c65401        	ld	a,21505
1445  000c 1a01          	or	a,(OFST+1,sp)
1446  000e c75401        	ld	21505,a
1447                     ; 421 }
1450  0011 84            	pop	a
1451  0012 81            	ret
1653                     ; 468 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1653                     ; 469 {
1654                     .text:	section	.text,new
1655  0000               _LCD_WriteRAM:
1657  0000 89            	pushw	x
1658       00000000      OFST:	set	0
1661                     ; 471   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1663                     ; 474   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1665  0001 9e            	ld	a,xh
1666  0002 5f            	clrw	x
1667  0003 97            	ld	xl,a
1668  0004 7b02          	ld	a,(OFST+2,sp)
1669  0006 d7540c        	ld	(21516,x),a
1670                     ; 476 }
1673  0009 85            	popw	x
1674  000a 81            	ret
1731                     ; 486 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1731                     ; 487 {
1732                     .text:	section	.text,new
1733  0000               _LCD_PageSelect:
1737                     ; 489   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1739                     ; 491   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1741  0000 7215542f      	bres	21551,#2
1742                     ; 492   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1744  0004 ca542f        	or	a,21551
1745  0007 c7542f        	ld	21551,a
1746                     ; 494 }
1749  000a 81            	ret
1784                     ; 519 void LCD_ITConfig(FunctionalState NewState)
1784                     ; 520 {
1785                     .text:	section	.text,new
1786  0000               _LCD_ITConfig:
1790                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1792                     ; 524   if (NewState != DISABLE)
1794  0000 4d            	tnz	a
1795  0001 2706          	jreq	L767
1796                     ; 526     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1798  0003 721a5402      	bset	21506,#5
1800  0007 2004          	jra	L177
1801  0009               L767:
1802                     ; 530     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1804  0009 721b5402      	bres	21506,#5
1805  000d               L177:
1806                     ; 533 }
1809  000d 81            	ret
1865                     ; 540 FlagStatus LCD_GetFlagStatus(void)
1865                     ; 541 {
1866                     .text:	section	.text,new
1867  0000               _LCD_GetFlagStatus:
1869  0000 88            	push	a
1870       00000001      OFST:	set	1
1873                     ; 542   FlagStatus status = RESET;
1875  0001 0f01          	clr	(OFST+0,sp)
1876                     ; 545   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1878  0003 c65402        	ld	a,21506
1879  0006 a510          	bcp	a,#16
1880  0008 2706          	jreq	L1201
1881                     ; 547     status = SET; /* Flag is set */
1883  000a a601          	ld	a,#1
1884  000c 6b01          	ld	(OFST+0,sp),a
1886  000e 2002          	jra	L3201
1887  0010               L1201:
1888                     ; 551     status = RESET; /* Flag is reset*/
1890  0010 0f01          	clr	(OFST+0,sp)
1891  0012               L3201:
1892                     ; 554   return status;
1894  0012 7b01          	ld	a,(OFST+0,sp)
1897  0014 5b01          	addw	sp,#1
1898  0016 81            	ret
1921                     ; 563 void LCD_ClearFlag(void)
1921                     ; 564 {
1922                     .text:	section	.text,new
1923  0000               _LCD_ClearFlag:
1927                     ; 566   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1929  0000 72165402      	bset	21506,#3
1930                     ; 568 }
1933  0004 81            	ret
1976                     ; 576 ITStatus LCD_GetITStatus(void)
1976                     ; 577 {
1977                     .text:	section	.text,new
1978  0000               _LCD_GetITStatus:
1980  0000 88            	push	a
1981       00000001      OFST:	set	1
1984                     ; 578   ITStatus pendingbitstatus = RESET;
1986  0001 7b01          	ld	a,(OFST+0,sp)
1987  0003 97            	ld	xl,a
1988                     ; 579   uint8_t enablestatus = 0;
1990  0004 7b01          	ld	a,(OFST+0,sp)
1991  0006 97            	ld	xl,a
1992                     ; 581   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1994  0007 c65402        	ld	a,21506
1995  000a a420          	and	a,#32
1996  000c 6b01          	ld	(OFST+0,sp),a
1997                     ; 583   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
1999  000e c65402        	ld	a,21506
2000  0011 a510          	bcp	a,#16
2001  0013 270a          	jreq	L5501
2003  0015 0d01          	tnz	(OFST+0,sp)
2004  0017 2706          	jreq	L5501
2005                     ; 586     pendingbitstatus = SET;
2007  0019 a601          	ld	a,#1
2008  001b 6b01          	ld	(OFST+0,sp),a
2010  001d 2002          	jra	L7501
2011  001f               L5501:
2012                     ; 591     pendingbitstatus = RESET;
2014  001f 0f01          	clr	(OFST+0,sp)
2015  0021               L7501:
2016                     ; 594   return  pendingbitstatus;
2018  0021 7b01          	ld	a,(OFST+0,sp)
2021  0023 5b01          	addw	sp,#1
2022  0025 81            	ret
2046                     ; 603 void LCD_ClearITPendingBit(void)
2046                     ; 604 {
2047                     .text:	section	.text,new
2048  0000               _LCD_ClearITPendingBit:
2052                     ; 606   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2054  0000 72165402      	bset	21506,#3
2055                     ; 608 }
2058  0004 81            	ret
2071                     	xdef	_LCD_ClearITPendingBit
2072                     	xdef	_LCD_GetITStatus
2073                     	xdef	_LCD_ClearFlag
2074                     	xdef	_LCD_GetFlagStatus
2075                     	xdef	_LCD_ITConfig
2076                     	xdef	_LCD_PageSelect
2077                     	xdef	_LCD_WriteRAM
2078                     	xdef	_LCD_ContrastConfig
2079                     	xdef	_LCD_BlinkConfig
2080                     	xdef	_LCD_DeadTimeConfig
2081                     	xdef	_LCD_PulseOnDurationConfig
2082                     	xdef	_LCD_HighDriveCmd
2083                     	xdef	_LCD_Cmd
2084                     	xdef	_LCD_PortMaskConfig
2085                     	xdef	_LCD_Init
2086                     	xdef	_LCD_DeInit
2105                     	end
