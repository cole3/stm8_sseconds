   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 112 void SYSCFG_RIDeInit(void)
  32                     ; 113 {
  34                     .text:	section	.text,new
  35  0000               _SYSCFG_RIDeInit:
  39                     ; 114   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  41  0000 725f5431      	clr	21553
  42                     ; 115   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  44  0004 725f5432      	clr	21554
  45                     ; 116   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  47  0008 725f5439      	clr	21561
  48                     ; 117   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  50  000c 725f543a      	clr	21562
  51                     ; 118   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  53  0010 725f543b      	clr	21563
  54                     ; 119   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  56  0014 725f5457      	clr	21591
  57                     ; 120   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  59  0018 725f543d      	clr	21565
  60                     ; 121   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  62  001c 725f543e      	clr	21566
  63                     ; 122   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  65  0020 725f543f      	clr	21567
  66                     ; 123 }
  69  0024 81            	ret
 328                     ; 135 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 328                     ; 136                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 328                     ; 137 {
 329                     .text:	section	.text,new
 330  0000               _SYSCFG_RITIMInputCaptureConfig:
 332  0000 89            	pushw	x
 333       00000000      OFST:	set	0
 336                     ; 139   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 338                     ; 140   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 340                     ; 143   if (RI_InputCapture == RI_InputCapture_IC2)
 342  0001 9e            	ld	a,xh
 343  0002 a102          	cp	a,#2
 344  0004 2606          	jrne	L531
 345                     ; 146     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 347  0006 9f            	ld	a,xl
 348  0007 c75431        	ld	21553,a
 350  000a 2005          	jra	L731
 351  000c               L531:
 352                     ; 152     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 354  000c 7b02          	ld	a,(OFST+2,sp)
 355  000e c75432        	ld	21554,a
 356  0011               L731:
 357                     ; 154 }
 360  0011 85            	popw	x
 361  0012 81            	ret
 539                     ; 177 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 539                     ; 178                                  FunctionalState NewState)
 539                     ; 179 {
 540                     .text:	section	.text,new
 541  0000               _SYSCFG_RIAnalogSwitchConfig:
 543  0000 89            	pushw	x
 544  0001 89            	pushw	x
 545       00000002      OFST:	set	2
 548                     ; 180   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 550  0002 7b02          	ld	a,(OFST+0,sp)
 551  0004 97            	ld	xl,a
 552                     ; 183   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 554                     ; 184   assert_param(IS_FUNCTIONAL_STATE(NewState));
 556                     ; 187   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 558  0005 7b03          	ld	a,(OFST+1,sp)
 559  0007 a4f0          	and	a,#240
 560  0009 6b01          	ld	(OFST-1,sp),a
 561                     ; 190   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 563  000b 7b03          	ld	a,(OFST+1,sp)
 564  000d a40f          	and	a,#15
 565  000f 6b02          	ld	(OFST+0,sp),a
 566                     ; 192   if (NewState != DISABLE)
 568  0011 0d04          	tnz	(OFST+2,sp)
 569  0013 2730          	jreq	L532
 570                     ; 194     if (AnalogSwitchRegister == (uint8_t) 0x10)
 572  0015 7b01          	ld	a,(OFST-1,sp)
 573  0017 a110          	cp	a,#16
 574  0019 2615          	jrne	L732
 575                     ; 197       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 577  001b 7b02          	ld	a,(OFST+0,sp)
 578  001d 5f            	clrw	x
 579  001e 97            	ld	xl,a
 580  001f a601          	ld	a,#1
 581  0021 5d            	tnzw	x
 582  0022 2704          	jreq	L21
 583  0024               L41:
 584  0024 48            	sll	a
 585  0025 5a            	decw	x
 586  0026 26fc          	jrne	L41
 587  0028               L21:
 588  0028 ca543d        	or	a,21565
 589  002b c7543d        	ld	21565,a
 591  002e 2045          	jra	L342
 592  0030               L732:
 593                     ; 202       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 595  0030 7b02          	ld	a,(OFST+0,sp)
 596  0032 5f            	clrw	x
 597  0033 97            	ld	xl,a
 598  0034 a601          	ld	a,#1
 599  0036 5d            	tnzw	x
 600  0037 2704          	jreq	L61
 601  0039               L02:
 602  0039 48            	sll	a
 603  003a 5a            	decw	x
 604  003b 26fc          	jrne	L02
 605  003d               L61:
 606  003d ca543e        	or	a,21566
 607  0040 c7543e        	ld	21566,a
 608  0043 2030          	jra	L342
 609  0045               L532:
 610                     ; 207     if (AnalogSwitchRegister == (uint8_t) 0x10)
 612  0045 7b01          	ld	a,(OFST-1,sp)
 613  0047 a110          	cp	a,#16
 614  0049 2616          	jrne	L542
 615                     ; 210       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 617  004b 7b02          	ld	a,(OFST+0,sp)
 618  004d 5f            	clrw	x
 619  004e 97            	ld	xl,a
 620  004f a601          	ld	a,#1
 621  0051 5d            	tnzw	x
 622  0052 2704          	jreq	L22
 623  0054               L42:
 624  0054 48            	sll	a
 625  0055 5a            	decw	x
 626  0056 26fc          	jrne	L42
 627  0058               L22:
 628  0058 43            	cpl	a
 629  0059 c4543d        	and	a,21565
 630  005c c7543d        	ld	21565,a
 632  005f 2014          	jra	L342
 633  0061               L542:
 634                     ; 215       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 636  0061 7b02          	ld	a,(OFST+0,sp)
 637  0063 5f            	clrw	x
 638  0064 97            	ld	xl,a
 639  0065 a601          	ld	a,#1
 640  0067 5d            	tnzw	x
 641  0068 2704          	jreq	L62
 642  006a               L03:
 643  006a 48            	sll	a
 644  006b 5a            	decw	x
 645  006c 26fc          	jrne	L03
 646  006e               L62:
 647  006e 43            	cpl	a
 648  006f c4543e        	and	a,21566
 649  0072 c7543e        	ld	21566,a
 650  0075               L342:
 651                     ; 218 }
 654  0075 5b04          	addw	sp,#4
 655  0077 81            	ret
 917                     ; 227 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 917                     ; 228                              FunctionalState NewState)
 917                     ; 229 {
 918                     .text:	section	.text,new
 919  0000               _SYSCFG_RIIOSwitchConfig:
 921  0000 89            	pushw	x
 922  0001 89            	pushw	x
 923       00000002      OFST:	set	2
 926                     ; 230   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 928  0002 7b02          	ld	a,(OFST+0,sp)
 929  0004 97            	ld	xl,a
 930                     ; 233   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 932                     ; 234   assert_param(IS_FUNCTIONAL_STATE(NewState));
 934                     ; 237   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 936  0005 7b03          	ld	a,(OFST+1,sp)
 937  0007 a40f          	and	a,#15
 938  0009 6b02          	ld	(OFST+0,sp),a
 939                     ; 240   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 941  000b 7b03          	ld	a,(OFST+1,sp)
 942  000d a4f0          	and	a,#240
 943  000f 6b01          	ld	(OFST-1,sp),a
 944                     ; 243   if (IOSwitchRegsiter == (uint8_t) 0x10)
 946  0011 7b01          	ld	a,(OFST-1,sp)
 947  0013 a110          	cp	a,#16
 948  0015 2633          	jrne	L373
 949                     ; 245     if (NewState != DISABLE)
 951  0017 0d04          	tnz	(OFST+2,sp)
 952  0019 2717          	jreq	L573
 953                     ; 248       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 955  001b 7b02          	ld	a,(OFST+0,sp)
 956  001d 5f            	clrw	x
 957  001e 97            	ld	xl,a
 958  001f a601          	ld	a,#1
 959  0021 5d            	tnzw	x
 960  0022 2704          	jreq	L43
 961  0024               L63:
 962  0024 48            	sll	a
 963  0025 5a            	decw	x
 964  0026 26fc          	jrne	L63
 965  0028               L43:
 966  0028 ca5439        	or	a,21561
 967  002b c75439        	ld	21561,a
 969  002e ace100e1      	jpf	L104
 970  0032               L573:
 971                     ; 253       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 973  0032 7b02          	ld	a,(OFST+0,sp)
 974  0034 5f            	clrw	x
 975  0035 97            	ld	xl,a
 976  0036 a601          	ld	a,#1
 977  0038 5d            	tnzw	x
 978  0039 2704          	jreq	L04
 979  003b               L24:
 980  003b 48            	sll	a
 981  003c 5a            	decw	x
 982  003d 26fc          	jrne	L24
 983  003f               L04:
 984  003f 43            	cpl	a
 985  0040 c45439        	and	a,21561
 986  0043 c75439        	ld	21561,a
 987  0046 ace100e1      	jpf	L104
 988  004a               L373:
 989                     ; 258   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 991  004a 7b01          	ld	a,(OFST-1,sp)
 992  004c a120          	cp	a,#32
 993  004e 262f          	jrne	L304
 994                     ; 260     if (NewState != DISABLE)
 996  0050 0d04          	tnz	(OFST+2,sp)
 997  0052 2715          	jreq	L504
 998                     ; 263       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1000  0054 7b02          	ld	a,(OFST+0,sp)
1001  0056 5f            	clrw	x
1002  0057 97            	ld	xl,a
1003  0058 a601          	ld	a,#1
1004  005a 5d            	tnzw	x
1005  005b 2704          	jreq	L44
1006  005d               L64:
1007  005d 48            	sll	a
1008  005e 5a            	decw	x
1009  005f 26fc          	jrne	L64
1010  0061               L44:
1011  0061 ca543a        	or	a,21562
1012  0064 c7543a        	ld	21562,a
1014  0067 2078          	jra	L104
1015  0069               L504:
1016                     ; 268       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1018  0069 7b02          	ld	a,(OFST+0,sp)
1019  006b 5f            	clrw	x
1020  006c 97            	ld	xl,a
1021  006d a601          	ld	a,#1
1022  006f 5d            	tnzw	x
1023  0070 2704          	jreq	L05
1024  0072               L25:
1025  0072 48            	sll	a
1026  0073 5a            	decw	x
1027  0074 26fc          	jrne	L25
1028  0076               L05:
1029  0076 43            	cpl	a
1030  0077 c4543a        	and	a,21562
1031  007a c7543a        	ld	21562,a
1032  007d 2062          	jra	L104
1033  007f               L304:
1034                     ; 273   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1036  007f 7b01          	ld	a,(OFST-1,sp)
1037  0081 a130          	cp	a,#48
1038  0083 262f          	jrne	L314
1039                     ; 275     if (NewState != DISABLE)
1041  0085 0d04          	tnz	(OFST+2,sp)
1042  0087 2715          	jreq	L514
1043                     ; 278       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1045  0089 7b02          	ld	a,(OFST+0,sp)
1046  008b 5f            	clrw	x
1047  008c 97            	ld	xl,a
1048  008d a601          	ld	a,#1
1049  008f 5d            	tnzw	x
1050  0090 2704          	jreq	L45
1051  0092               L65:
1052  0092 48            	sll	a
1053  0093 5a            	decw	x
1054  0094 26fc          	jrne	L65
1055  0096               L45:
1056  0096 ca543b        	or	a,21563
1057  0099 c7543b        	ld	21563,a
1059  009c 2043          	jra	L104
1060  009e               L514:
1061                     ; 283       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1063  009e 7b02          	ld	a,(OFST+0,sp)
1064  00a0 5f            	clrw	x
1065  00a1 97            	ld	xl,a
1066  00a2 a601          	ld	a,#1
1067  00a4 5d            	tnzw	x
1068  00a5 2704          	jreq	L06
1069  00a7               L26:
1070  00a7 48            	sll	a
1071  00a8 5a            	decw	x
1072  00a9 26fc          	jrne	L26
1073  00ab               L06:
1074  00ab 43            	cpl	a
1075  00ac c4543b        	and	a,21563
1076  00af c7543b        	ld	21563,a
1077  00b2 202d          	jra	L104
1078  00b4               L314:
1079                     ; 290     if (NewState != DISABLE)
1081  00b4 0d04          	tnz	(OFST+2,sp)
1082  00b6 2715          	jreq	L324
1083                     ; 293       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1085  00b8 7b02          	ld	a,(OFST+0,sp)
1086  00ba 5f            	clrw	x
1087  00bb 97            	ld	xl,a
1088  00bc a601          	ld	a,#1
1089  00be 5d            	tnzw	x
1090  00bf 2704          	jreq	L46
1091  00c1               L66:
1092  00c1 48            	sll	a
1093  00c2 5a            	decw	x
1094  00c3 26fc          	jrne	L66
1095  00c5               L46:
1096  00c5 ca5457        	or	a,21591
1097  00c8 c75457        	ld	21591,a
1099  00cb 2014          	jra	L104
1100  00cd               L324:
1101                     ; 298       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1103  00cd 7b02          	ld	a,(OFST+0,sp)
1104  00cf 5f            	clrw	x
1105  00d0 97            	ld	xl,a
1106  00d1 a601          	ld	a,#1
1107  00d3 5d            	tnzw	x
1108  00d4 2704          	jreq	L07
1109  00d6               L27:
1110  00d6 48            	sll	a
1111  00d7 5a            	decw	x
1112  00d8 26fc          	jrne	L27
1113  00da               L07:
1114  00da 43            	cpl	a
1115  00db c45457        	and	a,21591
1116  00de c75457        	ld	21591,a
1117  00e1               L104:
1118                     ; 301 }
1121  00e1 5b04          	addw	sp,#4
1122  00e3 81            	ret
1202                     ; 313 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1202                     ; 314 {
1203                     .text:	section	.text,new
1204  0000               _SYSCFG_RIResistorConfig:
1206  0000 89            	pushw	x
1207       00000000      OFST:	set	0
1210                     ; 316   assert_param(IS_RI_RESISTOR(RI_Resistor));
1212                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
1214                     ; 319   if (NewState != DISABLE)
1216  0001 9f            	ld	a,xl
1217  0002 4d            	tnz	a
1218  0003 2709          	jreq	L564
1219                     ; 322     RI->RCR |= (uint8_t) RI_Resistor;
1221  0005 9e            	ld	a,xh
1222  0006 ca543f        	or	a,21567
1223  0009 c7543f        	ld	21567,a
1225  000c 2009          	jra	L764
1226  000e               L564:
1227                     ; 327     RI->RCR &= (uint8_t) (~RI_Resistor);
1229  000e 7b01          	ld	a,(OFST+1,sp)
1230  0010 43            	cpl	a
1231  0011 c4543f        	and	a,21567
1232  0014 c7543f        	ld	21567,a
1233  0017               L764:
1234                     ; 329 }
1237  0017 85            	popw	x
1238  0018 81            	ret
1261                     ; 361 void SYSCFG_REMAPDeInit(void)
1261                     ; 362 {
1262                     .text:	section	.text,new
1263  0000               _SYSCFG_REMAPDeInit:
1267                     ; 364   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1269  0000 350c509e      	mov	20638,#12
1270                     ; 367   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1272  0004 725f509f      	clr	20639
1273                     ; 370   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1275  0008 725f509d      	clr	20637
1276                     ; 371 }
1279  000c 81            	ret
1495                     ; 404 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1495                     ; 405 {
1496                     .text:	section	.text,new
1497  0000               _SYSCFG_REMAPPinConfig:
1499  0000 89            	pushw	x
1500  0001 88            	push	a
1501       00000001      OFST:	set	1
1504                     ; 406   uint8_t regindex = 0;
1506  0002 0f01          	clr	(OFST+0,sp)
1507                     ; 408   assert_param(IS_REMAP_PIN(REMAP_Pin));
1509                     ; 409   assert_param(IS_FUNCTIONAL_STATE(NewState));
1511                     ; 412   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1513  0004 9e            	ld	a,xh
1514  0005 6b01          	ld	(OFST+0,sp),a
1515                     ; 415   if (regindex == 0x01)
1517  0007 7b01          	ld	a,(OFST+0,sp)
1518  0009 a101          	cp	a,#1
1519  000b 261e          	jrne	L106
1520                     ; 417     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1522  000d 9f            	ld	a,xl
1523  000e 97            	ld	xl,a
1524  000f a610          	ld	a,#16
1525  0011 42            	mul	x,a
1526  0012 9f            	ld	a,xl
1527  0013 aa0f          	or	a,#15
1528  0015 c4509e        	and	a,20638
1529  0018 c7509e        	ld	20638,a
1530                     ; 418     if (NewState != DISABLE)
1532  001b 0d06          	tnz	(OFST+5,sp)
1533  001d 2742          	jreq	L506
1534                     ; 420       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1536  001f 7b03          	ld	a,(OFST+2,sp)
1537  0021 a4f0          	and	a,#240
1538  0023 ca509e        	or	a,20638
1539  0026 c7509e        	ld	20638,a
1540  0029 2036          	jra	L506
1541  002b               L106:
1542                     ; 424   else if (regindex == 0x02)
1544  002b 7b01          	ld	a,(OFST+0,sp)
1545  002d a102          	cp	a,#2
1546  002f 2619          	jrne	L706
1547                     ; 426     if (NewState != DISABLE)
1549  0031 0d06          	tnz	(OFST+5,sp)
1550  0033 270a          	jreq	L116
1551                     ; 428       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1553  0035 c6509f        	ld	a,20639
1554  0038 1a03          	or	a,(OFST+2,sp)
1555  003a c7509f        	ld	20639,a
1557  003d 2022          	jra	L506
1558  003f               L116:
1559                     ; 432       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1561  003f 7b03          	ld	a,(OFST+2,sp)
1562  0041 43            	cpl	a
1563  0042 c4509f        	and	a,20639
1564  0045 c7509f        	ld	20639,a
1565  0048 2017          	jra	L506
1566  004a               L706:
1567                     ; 438     if (NewState != DISABLE)
1569  004a 0d06          	tnz	(OFST+5,sp)
1570  004c 270a          	jreq	L716
1571                     ; 440       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1573  004e c6509d        	ld	a,20637
1574  0051 1a03          	or	a,(OFST+2,sp)
1575  0053 c7509d        	ld	20637,a
1577  0056 2009          	jra	L506
1578  0058               L716:
1579                     ; 444       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1581  0058 7b03          	ld	a,(OFST+2,sp)
1582  005a 43            	cpl	a
1583  005b c4509d        	and	a,20637
1584  005e c7509d        	ld	20637,a
1585  0061               L506:
1586                     ; 447 }
1589  0061 5b03          	addw	sp,#3
1590  0063 81            	ret
1696                     ; 463 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1696                     ; 464 {
1697                     .text:	section	.text,new
1698  0000               _SYSCFG_REMAPDMAChannelConfig:
1700  0000 88            	push	a
1701       00000000      OFST:	set	0
1704                     ; 466   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1706                     ; 469   if ((REMAP_DMAChannel & 0xF0) != RESET)
1708  0001 a5f0          	bcp	a,#240
1709  0003 270a          	jreq	L566
1710                     ; 472     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1712  0005 c6509e        	ld	a,20638
1713  0008 a4f3          	and	a,#243
1714  000a c7509e        	ld	20638,a
1716  000d 2008          	jra	L766
1717  000f               L566:
1718                     ; 478     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1720  000f c6509e        	ld	a,20638
1721  0012 a4fc          	and	a,#252
1722  0014 c7509e        	ld	20638,a
1723  0017               L766:
1724                     ; 481   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1726  0017 7b01          	ld	a,(OFST+1,sp)
1727  0019 a40f          	and	a,#15
1728  001b ca509e        	or	a,20638
1729  001e c7509e        	ld	20638,a
1730                     ; 482 }
1733  0021 84            	pop	a
1734  0022 81            	ret
1747                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1748                     	xdef	_SYSCFG_REMAPPinConfig
1749                     	xdef	_SYSCFG_REMAPDeInit
1750                     	xdef	_SYSCFG_RIResistorConfig
1751                     	xdef	_SYSCFG_RIIOSwitchConfig
1752                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1753                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1754                     	xdef	_SYSCFG_RIDeInit
1773                     	end
