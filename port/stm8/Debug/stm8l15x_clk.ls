   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     .const:	section	.text
   5  0000               _SYSDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004 10            	dc.b	16
  39                     ; 114 void CLK_DeInit(void)
  39                     ; 115 {
  41                     .text:	section	.text,new
  42  0000               _CLK_DeInit:
  46                     ; 116   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  48  0000 351150c2      	mov	20674,#17
  49                     ; 117   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  51  0004 725f50c6      	clr	20678
  52                     ; 118   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  54  0008 725f50c1      	clr	20673
  55                     ; 119   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  57  000c 725f50cb      	clr	20683
  58                     ; 120   CLK->SWR  = CLK_SWR_RESET_VALUE;
  60  0010 350150c8      	mov	20680,#1
  61                     ; 121   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  63  0014 725f50c9      	clr	20681
  64                     ; 122   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  66  0018 350350c0      	mov	20672,#3
  67                     ; 123   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  69  001c 725f50c3      	clr	20675
  70                     ; 124   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  72  0020 358050c4      	mov	20676,#128
  73                     ; 125   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  75  0024 725f50d0      	clr	20688
  76                     ; 126   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  78  0028 725f50ca      	clr	20682
  79                     ; 127   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  81  002c 725f50c5      	clr	20677
  82                     ; 128   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  84  0030 725f50cd      	clr	20685
  85                     ; 129   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  87  0034 725f50cc      	clr	20684
  88                     ; 130   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  90  0038 725f50ce      	clr	20686
  91                     ; 131   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  93  003c 35b950cf      	mov	20687,#185
  94                     ; 132 }
  97  0040 81            	ret
 152                     ; 154 void CLK_HSICmd(FunctionalState NewState)
 152                     ; 155 {
 153                     .text:	section	.text,new
 154  0000               _CLK_HSICmd:
 158                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 160                     ; 159   if (NewState != DISABLE)
 162  0000 4d            	tnz	a
 163  0001 2706          	jreq	L74
 164                     ; 162     CLK->ICKCR |= CLK_ICKCR_HSION;
 166  0003 721050c2      	bset	20674,#0
 168  0007 2004          	jra	L15
 169  0009               L74:
 170                     ; 167     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 172  0009 721150c2      	bres	20674,#0
 173  000d               L15:
 174                     ; 169 }
 177  000d 81            	ret
 211                     ; 182 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 211                     ; 183 {
 212                     .text:	section	.text,new
 213  0000               _CLK_AdjustHSICalibrationValue:
 217                     ; 185   CLK->HSIUNLCKR = 0xAC;
 219  0000 35ac50ce      	mov	20686,#172
 220                     ; 186   CLK->HSIUNLCKR = 0x35;
 222  0004 353550ce      	mov	20686,#53
 223                     ; 189   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 225  0008 c750cd        	ld	20685,a
 226                     ; 190 }
 229  000b 81            	ret
 264                     ; 206 void CLK_LSICmd(FunctionalState NewState)
 264                     ; 207 {
 265                     .text:	section	.text,new
 266  0000               _CLK_LSICmd:
 270                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 272                     ; 212   if (NewState != DISABLE)
 274  0000 4d            	tnz	a
 275  0001 2706          	jreq	L501
 276                     ; 215     CLK->ICKCR |= CLK_ICKCR_LSION;
 278  0003 721450c2      	bset	20674,#2
 280  0007 2004          	jra	L701
 281  0009               L501:
 282                     ; 220     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 284  0009 721550c2      	bres	20674,#2
 285  000d               L701:
 286                     ; 222 }
 289  000d 81            	ret
 351                     ; 243 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 351                     ; 244 {
 352                     .text:	section	.text,new
 353  0000               _CLK_HSEConfig:
 357                     ; 246   assert_param(IS_CLK_HSE(CLK_HSE));
 359                     ; 250   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 361  0000 721150c6      	bres	20678,#0
 362                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 364  0004 721950c6      	bres	20678,#4
 365                     ; 256   CLK->ECKCR |= (uint8_t)CLK_HSE;
 367  0008 ca50c6        	or	a,20678
 368  000b c750c6        	ld	20678,a
 369                     ; 257 }
 372  000e 81            	ret
 434                     ; 274 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 434                     ; 275 {
 435                     .text:	section	.text,new
 436  0000               _CLK_LSEConfig:
 440                     ; 277   assert_param(IS_CLK_LSE(CLK_LSE));
 442                     ; 281   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 444  0000 721550c6      	bres	20678,#2
 445                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 447  0004 721b50c6      	bres	20678,#5
 448                     ; 287   CLK->ECKCR |= (uint8_t)CLK_LSE;
 450  0008 ca50c6        	or	a,20678
 451  000b c750c6        	ld	20678,a
 452                     ; 289 }
 455  000e 81            	ret
 479                     ; 300 void CLK_ClockSecuritySystemEnable(void)
 479                     ; 301 {
 480                     .text:	section	.text,new
 481  0000               _CLK_ClockSecuritySystemEnable:
 485                     ; 303   CLK->CSSR |= CLK_CSSR_CSSEN;
 487  0000 721050ca      	bset	20682,#0
 488                     ; 304 }
 491  0004 81            	ret
 527                     ; 311 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 527                     ; 312 {
 528                     .text:	section	.text,new
 529  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 533                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 535                     ; 316   if (NewState != DISABLE)
 537  0000 4d            	tnz	a
 538  0001 2706          	jreq	L712
 539                     ; 319     CLK->CSSR |= CLK_CSSR_CSSDGON;
 541  0003 721850ca      	bset	20682,#4
 543  0007 2004          	jra	L122
 544  0009               L712:
 545                     ; 324     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 547  0009 721950ca      	bres	20682,#4
 548  000d               L122:
 549                     ; 326 }
 552  000d 81            	ret
 693                     ; 350 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 693                     ; 351 {
 694                     .text:	section	.text,new
 695  0000               _CLK_CCOConfig:
 697  0000 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 353   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 703                     ; 354   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 705                     ; 357   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 707  0001 9f            	ld	a,xl
 708  0002 1a01          	or	a,(OFST+1,sp)
 709  0004 c750c5        	ld	20677,a
 710                     ; 358 }
 713  0007 85            	popw	x
 714  0008 81            	ret
 788                     ; 410 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 788                     ; 411 {
 789                     .text:	section	.text,new
 790  0000               _CLK_SYSCLKSourceConfig:
 794                     ; 413   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 796                     ; 416   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 798  0000 c750c8        	ld	20680,a
 799                     ; 417 }
 802  0003 81            	ret
 827                     ; 429 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 827                     ; 430 {
 828                     .text:	section	.text,new
 829  0000               _CLK_GetSYSCLKSource:
 833                     ; 431   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 835  0000 c650c7        	ld	a,20679
 838  0003 81            	ret
 902                     ; 472 uint32_t CLK_GetClockFreq(void)
 902                     ; 473 {
 903                     .text:	section	.text,new
 904  0000               _CLK_GetClockFreq:
 906  0000 5209          	subw	sp,#9
 907       00000009      OFST:	set	9
 910                     ; 474   uint32_t clockfrequency = 0;
 912  0002 96            	ldw	x,sp
 913  0003 1c0005        	addw	x,#OFST-4
 914  0006 cd0000        	call	c_ltor
 916                     ; 475   uint32_t sourcefrequency = 0;
 918  0009 ae0000        	ldw	x,#0
 919  000c 1f07          	ldw	(OFST-2,sp),x
 920  000e ae0000        	ldw	x,#0
 921  0011 1f05          	ldw	(OFST-4,sp),x
 922                     ; 476   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 924  0013 7b09          	ld	a,(OFST+0,sp)
 925  0015 97            	ld	xl,a
 926                     ; 477   uint8_t tmp = 0, presc = 0;
 928  0016 7b09          	ld	a,(OFST+0,sp)
 929  0018 97            	ld	xl,a
 932  0019 7b09          	ld	a,(OFST+0,sp)
 933  001b 97            	ld	xl,a
 934                     ; 480   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 936  001c c650c7        	ld	a,20679
 937  001f 6b09          	ld	(OFST+0,sp),a
 938                     ; 482   if ( clocksource == CLK_SYSCLKSource_HSI)
 940  0021 7b09          	ld	a,(OFST+0,sp)
 941  0023 a101          	cp	a,#1
 942  0025 260c          	jrne	L573
 943                     ; 484     sourcefrequency = HSI_VALUE;
 945  0027 ae2400        	ldw	x,#9216
 946  002a 1f07          	ldw	(OFST-2,sp),x
 947  002c ae00f4        	ldw	x,#244
 948  002f 1f05          	ldw	(OFST-4,sp),x
 950  0031 202b          	jra	L773
 951  0033               L573:
 952                     ; 486   else if ( clocksource == CLK_SYSCLKSource_LSI)
 954  0033 7b09          	ld	a,(OFST+0,sp)
 955  0035 a102          	cp	a,#2
 956  0037 260c          	jrne	L104
 957                     ; 488     sourcefrequency = LSI_VALUE;
 959  0039 ae9470        	ldw	x,#38000
 960  003c 1f07          	ldw	(OFST-2,sp),x
 961  003e ae0000        	ldw	x,#0
 962  0041 1f05          	ldw	(OFST-4,sp),x
 964  0043 2019          	jra	L773
 965  0045               L104:
 966                     ; 490   else if ( clocksource == CLK_SYSCLKSource_HSE)
 968  0045 7b09          	ld	a,(OFST+0,sp)
 969  0047 a104          	cp	a,#4
 970  0049 260c          	jrne	L504
 971                     ; 492     sourcefrequency = HSE_VALUE;
 973  004b ae2400        	ldw	x,#9216
 974  004e 1f07          	ldw	(OFST-2,sp),x
 975  0050 ae00f4        	ldw	x,#244
 976  0053 1f05          	ldw	(OFST-4,sp),x
 978  0055 2007          	jra	L773
 979  0057               L504:
 980                     ; 496     clockfrequency = LSE_VALUE;
 982  0057 96            	ldw	x,sp
 983  0058 1c0005        	addw	x,#OFST-4
 984  005b cd0000        	call	c_ltor
 986  005e               L773:
 987                     ; 500   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 989  005e c650c0        	ld	a,20672
 990  0061 a407          	and	a,#7
 991  0063 6b09          	ld	(OFST+0,sp),a
 992                     ; 501   presc = SYSDivFactor[tmp];
 994  0065 7b09          	ld	a,(OFST+0,sp)
 995  0067 5f            	clrw	x
 996  0068 97            	ld	xl,a
 997  0069 d60000        	ld	a,(_SYSDivFactor,x)
 998  006c 6b09          	ld	(OFST+0,sp),a
 999                     ; 504   clockfrequency = sourcefrequency / presc;
1001  006e 7b09          	ld	a,(OFST+0,sp)
1002  0070 b703          	ld	c_lreg+3,a
1003  0072 3f02          	clr	c_lreg+2
1004  0074 3f01          	clr	c_lreg+1
1005  0076 3f00          	clr	c_lreg
1006  0078 96            	ldw	x,sp
1007  0079 1c0001        	addw	x,#OFST-8
1008  007c cd0000        	call	c_rtol
1010  007f 96            	ldw	x,sp
1011  0080 1c0005        	addw	x,#OFST-4
1012  0083 cd0000        	call	c_ltor
1014  0086 96            	ldw	x,sp
1015  0087 1c0001        	addw	x,#OFST-8
1016  008a cd0000        	call	c_ludv
1018  008d 96            	ldw	x,sp
1019  008e 1c0005        	addw	x,#OFST-4
1020  0091 cd0000        	call	c_rtol
1022                     ; 506   return((uint32_t)clockfrequency);
1024  0094 96            	ldw	x,sp
1025  0095 1c0005        	addw	x,#OFST-4
1026  0098 cd0000        	call	c_ltor
1030  009b 5b09          	addw	sp,#9
1031  009d 81            	ret
1129                     ; 522 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1129                     ; 523 {
1130                     .text:	section	.text,new
1131  0000               _CLK_SYSCLKDivConfig:
1135                     ; 525   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1137                     ; 527   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1139  0000 c750c0        	ld	20672,a
1140                     ; 528 }
1143  0003 81            	ret
1179                     ; 535 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1179                     ; 536 {
1180                     .text:	section	.text,new
1181  0000               _CLK_SYSCLKSourceSwitchCmd:
1185                     ; 538   assert_param(IS_FUNCTIONAL_STATE(NewState));
1187                     ; 540   if (NewState != DISABLE)
1189  0000 4d            	tnz	a
1190  0001 2706          	jreq	L174
1191                     ; 543     CLK->SWCR |= CLK_SWCR_SWEN;
1193  0003 721250c9      	bset	20681,#1
1195  0007 2004          	jra	L374
1196  0009               L174:
1197                     ; 548     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1199  0009 721350c9      	bres	20681,#1
1200  000d               L374:
1201                     ; 550 }
1204  000d 81            	ret
1350                     ; 610 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1350                     ; 611 {
1351                     .text:	section	.text,new
1352  0000               _CLK_RTCClockConfig:
1354  0000 89            	pushw	x
1355       00000000      OFST:	set	0
1358                     ; 613   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1360                     ; 614   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1362                     ; 617   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1364  0001 9f            	ld	a,xl
1365  0002 1a01          	or	a,(OFST+1,sp)
1366  0004 c750c1        	ld	20673,a
1367                     ; 618 }
1370  0007 85            	popw	x
1371  0008 81            	ret
1437                     ; 629 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1437                     ; 630 {
1438                     .text:	section	.text,new
1439  0000               _CLK_BEEPClockConfig:
1443                     ; 632   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1445                     ; 635   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1447  0000 c750cb        	ld	20683,a
1448                     ; 637 }
1451  0003 81            	ret
1674                     ; 671 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1674                     ; 672 {
1675                     .text:	section	.text,new
1676  0000               _CLK_PeripheralClockConfig:
1678  0000 89            	pushw	x
1679  0001 88            	push	a
1680       00000001      OFST:	set	1
1683                     ; 673   uint8_t reg = 0;
1685  0002 0f01          	clr	(OFST+0,sp)
1686                     ; 676   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1688                     ; 677   assert_param(IS_FUNCTIONAL_STATE(NewState));
1690                     ; 680   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1692  0004 9e            	ld	a,xh
1693  0005 a4f0          	and	a,#240
1694  0007 6b01          	ld	(OFST+0,sp),a
1695                     ; 682   if ( reg == 0x00)
1697  0009 0d01          	tnz	(OFST+0,sp)
1698  000b 2635          	jrne	L117
1699                     ; 684     if (NewState != DISABLE)
1701  000d 0d03          	tnz	(OFST+2,sp)
1702  000f 2719          	jreq	L317
1703                     ; 687       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1705  0011 7b02          	ld	a,(OFST+1,sp)
1706  0013 a40f          	and	a,#15
1707  0015 5f            	clrw	x
1708  0016 97            	ld	xl,a
1709  0017 a601          	ld	a,#1
1710  0019 5d            	tnzw	x
1711  001a 2704          	jreq	L64
1712  001c               L05:
1713  001c 48            	sll	a
1714  001d 5a            	decw	x
1715  001e 26fc          	jrne	L05
1716  0020               L64:
1717  0020 ca50c3        	or	a,20675
1718  0023 c750c3        	ld	20675,a
1720  0026 acac00ac      	jpf	L717
1721  002a               L317:
1722                     ; 692       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1724  002a 7b02          	ld	a,(OFST+1,sp)
1725  002c a40f          	and	a,#15
1726  002e 5f            	clrw	x
1727  002f 97            	ld	xl,a
1728  0030 a601          	ld	a,#1
1729  0032 5d            	tnzw	x
1730  0033 2704          	jreq	L25
1731  0035               L45:
1732  0035 48            	sll	a
1733  0036 5a            	decw	x
1734  0037 26fc          	jrne	L45
1735  0039               L25:
1736  0039 43            	cpl	a
1737  003a c450c3        	and	a,20675
1738  003d c750c3        	ld	20675,a
1739  0040 206a          	jra	L717
1740  0042               L117:
1741                     ; 695   else if (reg == 0x10)
1743  0042 7b01          	ld	a,(OFST+0,sp)
1744  0044 a110          	cp	a,#16
1745  0046 2633          	jrne	L127
1746                     ; 697     if (NewState != DISABLE)
1748  0048 0d03          	tnz	(OFST+2,sp)
1749  004a 2717          	jreq	L327
1750                     ; 700       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1752  004c 7b02          	ld	a,(OFST+1,sp)
1753  004e a40f          	and	a,#15
1754  0050 5f            	clrw	x
1755  0051 97            	ld	xl,a
1756  0052 a601          	ld	a,#1
1757  0054 5d            	tnzw	x
1758  0055 2704          	jreq	L65
1759  0057               L06:
1760  0057 48            	sll	a
1761  0058 5a            	decw	x
1762  0059 26fc          	jrne	L06
1763  005b               L65:
1764  005b ca50c4        	or	a,20676
1765  005e c750c4        	ld	20676,a
1767  0061 2049          	jra	L717
1768  0063               L327:
1769                     ; 705       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1771  0063 7b02          	ld	a,(OFST+1,sp)
1772  0065 a40f          	and	a,#15
1773  0067 5f            	clrw	x
1774  0068 97            	ld	xl,a
1775  0069 a601          	ld	a,#1
1776  006b 5d            	tnzw	x
1777  006c 2704          	jreq	L26
1778  006e               L46:
1779  006e 48            	sll	a
1780  006f 5a            	decw	x
1781  0070 26fc          	jrne	L46
1782  0072               L26:
1783  0072 43            	cpl	a
1784  0073 c450c4        	and	a,20676
1785  0076 c750c4        	ld	20676,a
1786  0079 2031          	jra	L717
1787  007b               L127:
1788                     ; 710     if (NewState != DISABLE)
1790  007b 0d03          	tnz	(OFST+2,sp)
1791  007d 2717          	jreq	L137
1792                     ; 713       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1794  007f 7b02          	ld	a,(OFST+1,sp)
1795  0081 a40f          	and	a,#15
1796  0083 5f            	clrw	x
1797  0084 97            	ld	xl,a
1798  0085 a601          	ld	a,#1
1799  0087 5d            	tnzw	x
1800  0088 2704          	jreq	L66
1801  008a               L07:
1802  008a 48            	sll	a
1803  008b 5a            	decw	x
1804  008c 26fc          	jrne	L07
1805  008e               L66:
1806  008e ca50d0        	or	a,20688
1807  0091 c750d0        	ld	20688,a
1809  0094 2016          	jra	L717
1810  0096               L137:
1811                     ; 718       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1813  0096 7b02          	ld	a,(OFST+1,sp)
1814  0098 a40f          	and	a,#15
1815  009a 5f            	clrw	x
1816  009b 97            	ld	xl,a
1817  009c a601          	ld	a,#1
1818  009e 5d            	tnzw	x
1819  009f 2704          	jreq	L27
1820  00a1               L47:
1821  00a1 48            	sll	a
1822  00a2 5a            	decw	x
1823  00a3 26fc          	jrne	L47
1824  00a5               L27:
1825  00a5 43            	cpl	a
1826  00a6 c450d0        	and	a,20688
1827  00a9 c750d0        	ld	20688,a
1828  00ac               L717:
1829                     ; 721 }
1832  00ac 5b03          	addw	sp,#3
1833  00ae 81            	ret
1857                     ; 759 void CLK_LSEClockSecuritySystemEnable(void)
1857                     ; 760 {
1858                     .text:	section	.text,new
1859  0000               _CLK_LSEClockSecuritySystemEnable:
1863                     ; 762   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1865  0000 72105190      	bset	20880,#0
1866                     ; 763 }
1869  0004 81            	ret
1893                     ; 771 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1893                     ; 772 {
1894                     .text:	section	.text,new
1895  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1899                     ; 774   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1901  0000 72125190      	bset	20880,#1
1902                     ; 775 }
1905  0004 81            	ret
1980                     ; 801 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1980                     ; 802 {
1981                     .text:	section	.text,new
1982  0000               _CLK_HaltConfig:
1984  0000 89            	pushw	x
1985       00000000      OFST:	set	0
1988                     ; 804   assert_param(IS_CLK_HALT(CLK_Halt));
1990                     ; 805   assert_param(IS_FUNCTIONAL_STATE(NewState));
1992                     ; 807   if (NewState != DISABLE)
1994  0001 9f            	ld	a,xl
1995  0002 4d            	tnz	a
1996  0003 2709          	jreq	L1101
1997                     ; 809     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1999  0005 9e            	ld	a,xh
2000  0006 ca50c2        	or	a,20674
2001  0009 c750c2        	ld	20674,a
2003  000c 2009          	jra	L3101
2004  000e               L1101:
2005                     ; 813     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2007  000e 7b01          	ld	a,(OFST+1,sp)
2008  0010 43            	cpl	a
2009  0011 c450c2        	and	a,20674
2010  0014 c750c2        	ld	20674,a
2011  0017               L3101:
2012                     ; 815 }
2015  0017 85            	popw	x
2016  0018 81            	ret
2052                     ; 825 void CLK_MainRegulatorCmd(FunctionalState NewState)
2052                     ; 826 {
2053                     .text:	section	.text,new
2054  0000               _CLK_MainRegulatorCmd:
2058                     ; 828   assert_param(IS_FUNCTIONAL_STATE(NewState));
2060                     ; 830   if (NewState != DISABLE)
2062  0000 4d            	tnz	a
2063  0001 2706          	jreq	L3301
2064                     ; 833     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2066  0003 721350cf      	bres	20687,#1
2068  0007 2004          	jra	L5301
2069  0009               L3301:
2070                     ; 838     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2072  0009 721250cf      	bset	20687,#1
2073  000d               L5301:
2074                     ; 840 }
2077  000d 81            	ret
2149                     ; 869 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2149                     ; 870 {
2150                     .text:	section	.text,new
2151  0000               _CLK_ITConfig:
2153  0000 89            	pushw	x
2154       00000000      OFST:	set	0
2157                     ; 873   assert_param(IS_CLK_IT(CLK_IT));
2159                     ; 874   assert_param(IS_FUNCTIONAL_STATE(NewState));
2161                     ; 876   if (NewState != DISABLE)
2163  0001 9f            	ld	a,xl
2164  0002 4d            	tnz	a
2165  0003 271d          	jreq	L3701
2166                     ; 878     if (CLK_IT == CLK_IT_SWIF)
2168  0005 9e            	ld	a,xh
2169  0006 a11c          	cp	a,#28
2170  0008 2606          	jrne	L5701
2171                     ; 881       CLK->SWCR |= CLK_SWCR_SWIEN;
2173  000a 721450c9      	bset	20681,#2
2175  000e 202e          	jra	L5011
2176  0010               L5701:
2177                     ; 883     else if (CLK_IT == CLK_IT_LSECSSF)
2179  0010 7b01          	ld	a,(OFST+1,sp)
2180  0012 a12c          	cp	a,#44
2181  0014 2606          	jrne	L1011
2182                     ; 886       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2184  0016 72145190      	bset	20880,#2
2186  001a 2022          	jra	L5011
2187  001c               L1011:
2188                     ; 891       CLK->CSSR |= CLK_CSSR_CSSDIE;
2190  001c 721450ca      	bset	20682,#2
2191  0020 201c          	jra	L5011
2192  0022               L3701:
2193                     ; 896     if (CLK_IT == CLK_IT_SWIF)
2195  0022 7b01          	ld	a,(OFST+1,sp)
2196  0024 a11c          	cp	a,#28
2197  0026 2606          	jrne	L7011
2198                     ; 899       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2200  0028 721550c9      	bres	20681,#2
2202  002c 2010          	jra	L5011
2203  002e               L7011:
2204                     ; 901     else if (CLK_IT == CLK_IT_LSECSSF)
2206  002e 7b01          	ld	a,(OFST+1,sp)
2207  0030 a12c          	cp	a,#44
2208  0032 2606          	jrne	L3111
2209                     ; 904       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2211  0034 72155190      	bres	20880,#2
2213  0038 2004          	jra	L5011
2214  003a               L3111:
2215                     ; 909       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2217  003a 721550ca      	bres	20682,#2
2218  003e               L5011:
2219                     ; 912 }
2222  003e 85            	popw	x
2223  003f 81            	ret
2442                     ; 939 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2442                     ; 940 {
2443                     .text:	section	.text,new
2444  0000               _CLK_GetFlagStatus:
2446  0000 88            	push	a
2447  0001 89            	pushw	x
2448       00000002      OFST:	set	2
2451                     ; 941   uint8_t reg = 0;
2453  0002 7b02          	ld	a,(OFST+0,sp)
2454  0004 97            	ld	xl,a
2455                     ; 942   uint8_t pos = 0;
2457  0005 7b01          	ld	a,(OFST-1,sp)
2458  0007 97            	ld	xl,a
2459                     ; 943   FlagStatus bitstatus = RESET;
2461  0008 7b02          	ld	a,(OFST+0,sp)
2462  000a 97            	ld	xl,a
2463                     ; 946   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2465                     ; 949   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2467  000b 7b03          	ld	a,(OFST+1,sp)
2468  000d a4f0          	and	a,#240
2469  000f 6b02          	ld	(OFST+0,sp),a
2470                     ; 952   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2472  0011 7b03          	ld	a,(OFST+1,sp)
2473  0013 a40f          	and	a,#15
2474  0015 6b01          	ld	(OFST-1,sp),a
2475                     ; 954   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2477  0017 0d02          	tnz	(OFST+0,sp)
2478  0019 2607          	jrne	L7221
2479                     ; 956     reg = CLK->CRTCR;
2481  001b c650c1        	ld	a,20673
2482  001e 6b02          	ld	(OFST+0,sp),a
2484  0020 2060          	jra	L1321
2485  0022               L7221:
2486                     ; 958   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2488  0022 7b02          	ld	a,(OFST+0,sp)
2489  0024 a110          	cp	a,#16
2490  0026 2607          	jrne	L3321
2491                     ; 960     reg = CLK->ICKCR;
2493  0028 c650c2        	ld	a,20674
2494  002b 6b02          	ld	(OFST+0,sp),a
2496  002d 2053          	jra	L1321
2497  002f               L3321:
2498                     ; 962   else if (reg == 0x20) /* The flag to check is in CCOR register */
2500  002f 7b02          	ld	a,(OFST+0,sp)
2501  0031 a120          	cp	a,#32
2502  0033 2607          	jrne	L7321
2503                     ; 964     reg = CLK->CCOR;
2505  0035 c650c5        	ld	a,20677
2506  0038 6b02          	ld	(OFST+0,sp),a
2508  003a 2046          	jra	L1321
2509  003c               L7321:
2510                     ; 966   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2512  003c 7b02          	ld	a,(OFST+0,sp)
2513  003e a130          	cp	a,#48
2514  0040 2607          	jrne	L3421
2515                     ; 968     reg = CLK->ECKCR;
2517  0042 c650c6        	ld	a,20678
2518  0045 6b02          	ld	(OFST+0,sp),a
2520  0047 2039          	jra	L1321
2521  0049               L3421:
2522                     ; 970   else if (reg == 0x40) /* The flag to check is in SWCR register */
2524  0049 7b02          	ld	a,(OFST+0,sp)
2525  004b a140          	cp	a,#64
2526  004d 2607          	jrne	L7421
2527                     ; 972     reg = CLK->SWCR;
2529  004f c650c9        	ld	a,20681
2530  0052 6b02          	ld	(OFST+0,sp),a
2532  0054 202c          	jra	L1321
2533  0056               L7421:
2534                     ; 974   else if (reg == 0x50) /* The flag to check is in CSSR register */
2536  0056 7b02          	ld	a,(OFST+0,sp)
2537  0058 a150          	cp	a,#80
2538  005a 2607          	jrne	L3521
2539                     ; 976     reg = CLK->CSSR;
2541  005c c650ca        	ld	a,20682
2542  005f 6b02          	ld	(OFST+0,sp),a
2544  0061 201f          	jra	L1321
2545  0063               L3521:
2546                     ; 978   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2548  0063 7b02          	ld	a,(OFST+0,sp)
2549  0065 a170          	cp	a,#112
2550  0067 2607          	jrne	L7521
2551                     ; 980     reg = CLK->REGCSR;
2553  0069 c650cf        	ld	a,20687
2554  006c 6b02          	ld	(OFST+0,sp),a
2556  006e 2012          	jra	L1321
2557  0070               L7521:
2558                     ; 982   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2560  0070 7b02          	ld	a,(OFST+0,sp)
2561  0072 a180          	cp	a,#128
2562  0074 2607          	jrne	L3621
2563                     ; 984     reg = CSSLSE->CSR;
2565  0076 c65190        	ld	a,20880
2566  0079 6b02          	ld	(OFST+0,sp),a
2568  007b 2005          	jra	L1321
2569  007d               L3621:
2570                     ; 988     reg = CLK->CBEEPR;
2572  007d c650cb        	ld	a,20683
2573  0080 6b02          	ld	(OFST+0,sp),a
2574  0082               L1321:
2575                     ; 992   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2577  0082 7b01          	ld	a,(OFST-1,sp)
2578  0084 5f            	clrw	x
2579  0085 97            	ld	xl,a
2580  0086 a601          	ld	a,#1
2581  0088 5d            	tnzw	x
2582  0089 2704          	jreq	L211
2583  008b               L411:
2584  008b 48            	sll	a
2585  008c 5a            	decw	x
2586  008d 26fc          	jrne	L411
2587  008f               L211:
2588  008f 1402          	and	a,(OFST+0,sp)
2589  0091 2706          	jreq	L7621
2590                     ; 994     bitstatus = SET;
2592  0093 a601          	ld	a,#1
2593  0095 6b02          	ld	(OFST+0,sp),a
2595  0097 2002          	jra	L1721
2596  0099               L7621:
2597                     ; 998     bitstatus = RESET;
2599  0099 0f02          	clr	(OFST+0,sp)
2600  009b               L1721:
2601                     ; 1002   return((FlagStatus)bitstatus);
2603  009b 7b02          	ld	a,(OFST+0,sp)
2606  009d 5b03          	addw	sp,#3
2607  009f 81            	ret
2630                     ; 1010 void CLK_ClearFlag(void)
2630                     ; 1011 {
2631                     .text:	section	.text,new
2632  0000               _CLK_ClearFlag:
2636                     ; 1014   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2638  0000 72175190      	bres	20880,#3
2639                     ; 1015 }
2642  0004 81            	ret
2688                     ; 1026 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2688                     ; 1027 {
2689                     .text:	section	.text,new
2690  0000               _CLK_GetITStatus:
2692  0000 88            	push	a
2693  0001 88            	push	a
2694       00000001      OFST:	set	1
2697                     ; 1029   ITStatus bitstatus = RESET;
2699  0002 0f01          	clr	(OFST+0,sp)
2700                     ; 1032   assert_param(IS_CLK_IT(CLK_IT));
2702                     ; 1034   if (CLK_IT == CLK_IT_SWIF)
2704  0004 a11c          	cp	a,#28
2705  0006 2611          	jrne	L5231
2706                     ; 1037     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2708  0008 c450c9        	and	a,20681
2709  000b a10c          	cp	a,#12
2710  000d 2606          	jrne	L7231
2711                     ; 1039       bitstatus = SET;
2713  000f a601          	ld	a,#1
2714  0011 6b01          	ld	(OFST+0,sp),a
2716  0013 202e          	jra	L3331
2717  0015               L7231:
2718                     ; 1043       bitstatus = RESET;
2720  0015 0f01          	clr	(OFST+0,sp)
2721  0017 202a          	jra	L3331
2722  0019               L5231:
2723                     ; 1046   else if (CLK_IT == CLK_IT_LSECSSF)
2725  0019 7b02          	ld	a,(OFST+1,sp)
2726  001b a12c          	cp	a,#44
2727  001d 2613          	jrne	L5331
2728                     ; 1049     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2730  001f c65190        	ld	a,20880
2731  0022 1402          	and	a,(OFST+1,sp)
2732  0024 a10c          	cp	a,#12
2733  0026 2606          	jrne	L7331
2734                     ; 1051       bitstatus = SET;
2736  0028 a601          	ld	a,#1
2737  002a 6b01          	ld	(OFST+0,sp),a
2739  002c 2015          	jra	L3331
2740  002e               L7331:
2741                     ; 1055       bitstatus = RESET;
2743  002e 0f01          	clr	(OFST+0,sp)
2744  0030 2011          	jra	L3331
2745  0032               L5331:
2746                     ; 1061     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2748  0032 c650ca        	ld	a,20682
2749  0035 1402          	and	a,(OFST+1,sp)
2750  0037 a10c          	cp	a,#12
2751  0039 2606          	jrne	L5431
2752                     ; 1063       bitstatus = SET;
2754  003b a601          	ld	a,#1
2755  003d 6b01          	ld	(OFST+0,sp),a
2757  003f 2002          	jra	L3331
2758  0041               L5431:
2759                     ; 1067       bitstatus = RESET;
2761  0041 0f01          	clr	(OFST+0,sp)
2762  0043               L3331:
2763                     ; 1072   return bitstatus;
2765  0043 7b01          	ld	a,(OFST+0,sp)
2768  0045 85            	popw	x
2769  0046 81            	ret
2805                     ; 1083 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2805                     ; 1084 {
2806                     .text:	section	.text,new
2807  0000               _CLK_ClearITPendingBit:
2811                     ; 1087   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2813                     ; 1089   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2815  0000 a4f0          	and	a,#240
2816  0002 a120          	cp	a,#32
2817  0004 2606          	jrne	L7631
2818                     ; 1092     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2820  0006 72175190      	bres	20880,#3
2822  000a 2004          	jra	L1731
2823  000c               L7631:
2824                     ; 1097     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2826  000c 721750c9      	bres	20681,#3
2827  0010               L1731:
2828                     ; 1099 }
2831  0010 81            	ret
2856                     	xdef	_SYSDivFactor
2857                     	xdef	_CLK_ClearITPendingBit
2858                     	xdef	_CLK_GetITStatus
2859                     	xdef	_CLK_ClearFlag
2860                     	xdef	_CLK_GetFlagStatus
2861                     	xdef	_CLK_ITConfig
2862                     	xdef	_CLK_MainRegulatorCmd
2863                     	xdef	_CLK_HaltConfig
2864                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2865                     	xdef	_CLK_LSEClockSecuritySystemEnable
2866                     	xdef	_CLK_PeripheralClockConfig
2867                     	xdef	_CLK_BEEPClockConfig
2868                     	xdef	_CLK_RTCClockConfig
2869                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2870                     	xdef	_CLK_SYSCLKDivConfig
2871                     	xdef	_CLK_GetClockFreq
2872                     	xdef	_CLK_GetSYSCLKSource
2873                     	xdef	_CLK_SYSCLKSourceConfig
2874                     	xdef	_CLK_CCOConfig
2875                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2876                     	xdef	_CLK_ClockSecuritySystemEnable
2877                     	xdef	_CLK_LSEConfig
2878                     	xdef	_CLK_HSEConfig
2879                     	xdef	_CLK_LSICmd
2880                     	xdef	_CLK_AdjustHSICalibrationValue
2881                     	xdef	_CLK_HSICmd
2882                     	xdef	_CLK_DeInit
2883                     	xref.b	c_lreg
2884                     	xref.b	c_x
2903                     	xref	c_ludv
2904                     	xref	c_rtol
2905                     	xref	c_ltor
2906                     	end
