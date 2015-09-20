   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 105 void COMP_DeInit(void)
  32                     ; 106 {
  34                     .text:	section	.text,new
  35  0000               _COMP_DeInit:
  39                     ; 108   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  41  0000 725f5440      	clr	21568
  42                     ; 111   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  44  0004 725f5441      	clr	21569
  45                     ; 114   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  47  0008 35c05442      	mov	21570,#192
  48                     ; 117   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  50  000c 725f5443      	clr	21571
  51                     ; 120   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  53  0010 725f5444      	clr	21572
  54                     ; 121 }
  57  0014 81            	ret
 233                     ; 147 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 233                     ; 148                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 233                     ; 149 {
 234                     .text:	section	.text,new
 235  0000               _COMP_Init:
 237  0000 89            	pushw	x
 238       00000000      OFST:	set	0
 241                     ; 151   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 243                     ; 152   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 245                     ; 153   assert_param(IS_COMP_SPEED(COMP_Speed));
 247                     ; 156   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 249  0001 c65442        	ld	a,21570
 250  0004 a4c7          	and	a,#199
 251  0006 c75442        	ld	21570,a
 252                     ; 158   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 254  0009 9e            	ld	a,xh
 255  000a ca5442        	or	a,21570
 256  000d c75442        	ld	21570,a
 257                     ; 161   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 259  0010 c65442        	ld	a,21570
 260  0013 a43f          	and	a,#63
 261  0015 c75442        	ld	21570,a
 262                     ; 163   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 264  0018 9f            	ld	a,xl
 265  0019 ca5442        	or	a,21570
 266  001c c75442        	ld	21570,a
 267                     ; 166   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 269  001f 72155441      	bres	21569,#2
 270                     ; 168   COMP->CSR2 |= (uint8_t) COMP_Speed;
 272  0023 c65441        	ld	a,21569
 273  0026 1a05          	or	a,(OFST+5,sp)
 274  0028 c75441        	ld	21569,a
 275                     ; 169 }
 278  002b 85            	popw	x
 279  002c 81            	ret
 335                     ; 177 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 335                     ; 178 {
 336                     .text:	section	.text,new
 337  0000               _COMP_VrefintToCOMP1Connect:
 341                     ; 180   assert_param(IS_FUNCTIONAL_STATE(NewState));
 343                     ; 182   if (NewState != DISABLE)
 345  0000 4d            	tnz	a
 346  0001 2706          	jreq	L341
 347                     ; 185     COMP->CSR3 |= COMP_CSR3_VREFEN;
 349  0003 72145442      	bset	21570,#2
 351  0007 2004          	jra	L541
 352  0009               L341:
 353                     ; 190     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 355  0009 72155442      	bres	21570,#2
 356  000d               L541:
 357                     ; 192 }
 360  000d 81            	ret
 455                     ; 206 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 455                     ; 207 {
 456                     .text:	section	.text,new
 457  0000               _COMP_EdgeConfig:
 459  0000 89            	pushw	x
 460       00000000      OFST:	set	0
 463                     ; 209   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 465                     ; 210   assert_param(IS_COMP_EDGE(COMP_Edge));
 467                     ; 213   if (COMP_Selection == COMP_Selection_COMP1)
 469  0001 9e            	ld	a,xh
 470  0002 a101          	cp	a,#1
 471  0004 2611          	jrne	L312
 472                     ; 216     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 474  0006 c65440        	ld	a,21568
 475  0009 a4fc          	and	a,#252
 476  000b c75440        	ld	21568,a
 477                     ; 219     COMP->CSR1 |= (uint8_t) COMP_Edge;
 479  000e 9f            	ld	a,xl
 480  000f ca5440        	or	a,21568
 481  0012 c75440        	ld	21568,a
 483  0015 2010          	jra	L512
 484  0017               L312:
 485                     ; 225     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 487  0017 c65441        	ld	a,21569
 488  001a a4fc          	and	a,#252
 489  001c c75441        	ld	21569,a
 490                     ; 228     COMP->CSR2 |= (uint8_t) COMP_Edge;
 492  001f c65441        	ld	a,21569
 493  0022 1a02          	or	a,(OFST+2,sp)
 494  0024 c75441        	ld	21569,a
 495  0027               L512:
 496                     ; 230 }
 499  0027 85            	popw	x
 500  0028 81            	ret
 566                     ; 245 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 566                     ; 246 {
 567                     .text:	section	.text,new
 568  0000               _COMP_GetOutputLevel:
 570  0000 88            	push	a
 571       00000001      OFST:	set	1
 574                     ; 250   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 576                     ; 253   if (COMP_Selection == COMP_Selection_COMP1)
 578  0001 a101          	cp	a,#1
 579  0003 2611          	jrne	L742
 580                     ; 256     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 582  0005 c65440        	ld	a,21568
 583  0008 a508          	bcp	a,#8
 584  000a 2706          	jreq	L152
 585                     ; 259       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 587  000c a601          	ld	a,#1
 588  000e 6b01          	ld	(OFST+0,sp),a
 590  0010 2013          	jra	L552
 591  0012               L152:
 592                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 594  0012 0f01          	clr	(OFST+0,sp)
 595  0014 200f          	jra	L552
 596  0016               L742:
 597                     ; 272     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 599  0016 c65441        	ld	a,21569
 600  0019 a508          	bcp	a,#8
 601  001b 2706          	jreq	L752
 602                     ; 275       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 604  001d a601          	ld	a,#1
 605  001f 6b01          	ld	(OFST+0,sp),a
 607  0021 2002          	jra	L552
 608  0023               L752:
 609                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 611  0023 0f01          	clr	(OFST+0,sp)
 612  0025               L552:
 613                     ; 286   return (COMP_OutputLevel_TypeDef)(compout);
 615  0025 7b01          	ld	a,(OFST+0,sp)
 618  0027 5b01          	addw	sp,#1
 619  0029 81            	ret
 654                     ; 318 void COMP_WindowCmd(FunctionalState NewState)
 654                     ; 319 {
 655                     .text:	section	.text,new
 656  0000               _COMP_WindowCmd:
 660                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 662                     ; 323   if (NewState != DISABLE)
 664  0000 4d            	tnz	a
 665  0001 2706          	jreq	L103
 666                     ; 326     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 668  0003 72125442      	bset	21570,#1
 670  0007 2004          	jra	L303
 671  0009               L103:
 672                     ; 331     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 674  0009 72135442      	bres	21570,#1
 675  000d               L303:
 676                     ; 333 }
 679  000d 81            	ret
 715                     ; 356 void COMP_VrefintOutputCmd(FunctionalState NewState)
 715                     ; 357 {
 716                     .text:	section	.text,new
 717  0000               _COMP_VrefintOutputCmd:
 721                     ; 359   assert_param(IS_FUNCTIONAL_STATE(NewState));
 723                     ; 361   if (NewState != DISABLE)
 725  0000 4d            	tnz	a
 726  0001 2706          	jreq	L323
 727                     ; 364     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 729  0003 72105442      	bset	21570,#0
 731  0007 2004          	jra	L523
 732  0009               L323:
 733                     ; 369     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 735  0009 72115442      	bres	21570,#0
 736  000d               L523:
 737                     ; 371 }
 740  000d 81            	ret
 776                     ; 395 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 776                     ; 396 {
 777                     .text:	section	.text,new
 778  0000               _COMP_SchmittTriggerCmd:
 782                     ; 398   assert_param(IS_FUNCTIONAL_STATE(NewState));
 784                     ; 400   if (NewState != DISABLE)
 786  0000 4d            	tnz	a
 787  0001 2706          	jreq	L543
 788                     ; 403     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 790  0003 72145440      	bset	21568,#2
 792  0007 2004          	jra	L743
 793  0009               L543:
 794                     ; 408     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 796  0009 72155440      	bres	21568,#2
 797  000d               L743:
 798                     ; 410 }
 801  000d 81            	ret
 921                     ; 429 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 921                     ; 430                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 921                     ; 431                         FunctionalState NewState)
 921                     ; 432 {
 922                     .text:	section	.text,new
 923  0000               _COMP_TriggerConfig:
 925  0000 89            	pushw	x
 926       00000000      OFST:	set	0
 929                     ; 434   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 931                     ; 435   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 933                     ; 437   switch (COMP_TriggerGroup)
 935  0001 9e            	ld	a,xh
 937                     ; 484     default:
 937                     ; 485       break;
 938  0002 4a            	dec	a
 939  0003 270b          	jreq	L153
 940  0005 4a            	dec	a
 941  0006 2721          	jreq	L353
 942  0008 4a            	dec	a
 943  0009 273d          	jreq	L553
 944  000b 4a            	dec	a
 945  000c 2753          	jreq	L753
 946  000e 206e          	jra	L144
 947  0010               L153:
 948                     ; 439     case COMP_TriggerGroup_InvertingInput:
 948                     ; 440 
 948                     ; 441       if (NewState != DISABLE)
 950  0010 0d05          	tnz	(OFST+5,sp)
 951  0012 270b          	jreq	L344
 952                     ; 443         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 954  0014 7b02          	ld	a,(OFST+2,sp)
 955  0016 43            	cpl	a
 956  0017 c45443        	and	a,21571
 957  001a c75443        	ld	21571,a
 959  001d 205f          	jra	L144
 960  001f               L344:
 961                     ; 447         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 963  001f c65443        	ld	a,21571
 964  0022 1a02          	or	a,(OFST+2,sp)
 965  0024 c75443        	ld	21571,a
 966  0027 2055          	jra	L144
 967  0029               L353:
 968                     ; 451     case COMP_TriggerGroup_NonInvertingInput:
 968                     ; 452       if (NewState != DISABLE)
 970  0029 0d05          	tnz	(OFST+5,sp)
 971  002b 270e          	jreq	L744
 972                     ; 454         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 974  002d 7b02          	ld	a,(OFST+2,sp)
 975  002f 48            	sll	a
 976  0030 48            	sll	a
 977  0031 48            	sll	a
 978  0032 43            	cpl	a
 979  0033 c45443        	and	a,21571
 980  0036 c75443        	ld	21571,a
 982  0039 2043          	jra	L144
 983  003b               L744:
 984                     ; 458         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 986  003b 7b02          	ld	a,(OFST+2,sp)
 987  003d 48            	sll	a
 988  003e 48            	sll	a
 989  003f 48            	sll	a
 990  0040 ca5443        	or	a,21571
 991  0043 c75443        	ld	21571,a
 992  0046 2036          	jra	L144
 993  0048               L553:
 994                     ; 462     case COMP_TriggerGroup_VREFINTOutput:
 994                     ; 463       if (NewState != DISABLE)
 996  0048 0d05          	tnz	(OFST+5,sp)
 997  004a 270b          	jreq	L354
 998                     ; 465         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1000  004c 7b02          	ld	a,(OFST+2,sp)
1001  004e 43            	cpl	a
1002  004f c45444        	and	a,21572
1003  0052 c75444        	ld	21572,a
1005  0055 2027          	jra	L144
1006  0057               L354:
1007                     ; 469         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1009  0057 c65444        	ld	a,21572
1010  005a 1a02          	or	a,(OFST+2,sp)
1011  005c c75444        	ld	21572,a
1012  005f 201d          	jra	L144
1013  0061               L753:
1014                     ; 473     case COMP_TriggerGroup_DACOutput:
1014                     ; 474       if (NewState != DISABLE)
1016  0061 0d05          	tnz	(OFST+5,sp)
1017  0063 270e          	jreq	L754
1018                     ; 476         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1020  0065 7b02          	ld	a,(OFST+2,sp)
1021  0067 48            	sll	a
1022  0068 48            	sll	a
1023  0069 48            	sll	a
1024  006a 43            	cpl	a
1025  006b c45444        	and	a,21572
1026  006e c75444        	ld	21572,a
1028  0071 200b          	jra	L144
1029  0073               L754:
1030                     ; 480         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1032  0073 7b02          	ld	a,(OFST+2,sp)
1033  0075 48            	sll	a
1034  0076 48            	sll	a
1035  0077 48            	sll	a
1036  0078 ca5444        	or	a,21572
1037  007b c75444        	ld	21572,a
1038  007e               L163:
1039                     ; 484     default:
1039                     ; 485       break;
1041  007e               L144:
1042                     ; 487 }
1045  007e 85            	popw	x
1046  007f 81            	ret
1091                     ; 515 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1091                     ; 516 {
1092                     .text:	section	.text,new
1093  0000               _COMP_ITConfig:
1095  0000 89            	pushw	x
1096       00000000      OFST:	set	0
1099                     ; 518   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1101                     ; 519   assert_param(IS_FUNCTIONAL_STATE(NewState));
1103                     ; 522   if (COMP_Selection == COMP_Selection_COMP1)
1105  0001 9e            	ld	a,xh
1106  0002 a101          	cp	a,#1
1107  0004 2610          	jrne	L505
1108                     ; 524     if (NewState != DISABLE)
1110  0006 9f            	ld	a,xl
1111  0007 4d            	tnz	a
1112  0008 2706          	jreq	L705
1113                     ; 527       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1115  000a 721a5440      	bset	21568,#5
1117  000e 2014          	jra	L315
1118  0010               L705:
1119                     ; 532       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1121  0010 721b5440      	bres	21568,#5
1122  0014 200e          	jra	L315
1123  0016               L505:
1124                     ; 537     if (NewState != DISABLE)
1126  0016 0d02          	tnz	(OFST+2,sp)
1127  0018 2706          	jreq	L515
1128                     ; 540       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1130  001a 721a5441      	bset	21569,#5
1132  001e 2004          	jra	L315
1133  0020               L515:
1134                     ; 545       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1136  0020 721b5441      	bres	21569,#5
1137  0024               L315:
1138                     ; 548 }
1141  0024 85            	popw	x
1142  0025 81            	ret
1208                     ; 558 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1208                     ; 559 {
1209                     .text:	section	.text,new
1210  0000               _COMP_GetFlagStatus:
1212  0000 88            	push	a
1213       00000001      OFST:	set	1
1216                     ; 560   FlagStatus bitstatus = RESET;
1218  0001 0f01          	clr	(OFST+0,sp)
1219                     ; 563   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1221                     ; 566   if (COMP_Selection == COMP_Selection_COMP1)
1223  0003 a101          	cp	a,#1
1224  0005 2611          	jrne	L355
1225                     ; 568     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1227  0007 c65440        	ld	a,21568
1228  000a a510          	bcp	a,#16
1229  000c 2706          	jreq	L555
1230                     ; 571       bitstatus = SET;
1232  000e a601          	ld	a,#1
1233  0010 6b01          	ld	(OFST+0,sp),a
1235  0012 2013          	jra	L165
1236  0014               L555:
1237                     ; 576       bitstatus = RESET;
1239  0014 0f01          	clr	(OFST+0,sp)
1240  0016 200f          	jra	L165
1241  0018               L355:
1242                     ; 581     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1244  0018 c65441        	ld	a,21569
1245  001b a510          	bcp	a,#16
1246  001d 2706          	jreq	L365
1247                     ; 584       bitstatus = SET;
1249  001f a601          	ld	a,#1
1250  0021 6b01          	ld	(OFST+0,sp),a
1252  0023 2002          	jra	L165
1253  0025               L365:
1254                     ; 589       bitstatus = RESET;
1256  0025 0f01          	clr	(OFST+0,sp)
1257  0027               L165:
1258                     ; 594   return (FlagStatus)(bitstatus);
1260  0027 7b01          	ld	a,(OFST+0,sp)
1263  0029 5b01          	addw	sp,#1
1264  002b 81            	ret
1299                     ; 605 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1299                     ; 606 {
1300                     .text:	section	.text,new
1301  0000               _COMP_ClearFlag:
1305                     ; 608   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1307                     ; 610   if (COMP_Selection == COMP_Selection_COMP1)
1309  0000 a101          	cp	a,#1
1310  0002 2606          	jrne	L506
1311                     ; 613     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1313  0004 72195440      	bres	21568,#4
1315  0008 2004          	jra	L706
1316  000a               L506:
1317                     ; 618     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1319  000a 72195441      	bres	21569,#4
1320  000e               L706:
1321                     ; 620 }
1324  000e 81            	ret
1384                     ; 630 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1384                     ; 631 {
1385                     .text:	section	.text,new
1386  0000               _COMP_GetITStatus:
1388  0000 88            	push	a
1389  0001 89            	pushw	x
1390       00000002      OFST:	set	2
1393                     ; 632   ITStatus bitstatus = RESET;
1395  0002 7b02          	ld	a,(OFST+0,sp)
1396  0004 97            	ld	xl,a
1397                     ; 633   uint8_t itstatus = 0x00, itenable = 0x00;
1399  0005 7b01          	ld	a,(OFST-1,sp)
1400  0007 97            	ld	xl,a
1403  0008 7b02          	ld	a,(OFST+0,sp)
1404  000a 97            	ld	xl,a
1405                     ; 636   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1407                     ; 638   if (COMP_Selection == COMP_Selection_COMP1)
1409  000b 7b03          	ld	a,(OFST+1,sp)
1410  000d a101          	cp	a,#1
1411  000f 2620          	jrne	L736
1412                     ; 641     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1414  0011 c65440        	ld	a,21568
1415  0014 a410          	and	a,#16
1416  0016 6b01          	ld	(OFST-1,sp),a
1417                     ; 644     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1419  0018 c65440        	ld	a,21568
1420  001b a420          	and	a,#32
1421  001d 6b02          	ld	(OFST+0,sp),a
1422                     ; 646     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1424  001f 0d01          	tnz	(OFST-1,sp)
1425  0021 270a          	jreq	L146
1427  0023 0d02          	tnz	(OFST+0,sp)
1428  0025 2706          	jreq	L146
1429                     ; 649       bitstatus = SET;
1431  0027 a601          	ld	a,#1
1432  0029 6b02          	ld	(OFST+0,sp),a
1434  002b 2022          	jra	L546
1435  002d               L146:
1436                     ; 654       bitstatus = RESET;
1438  002d 0f02          	clr	(OFST+0,sp)
1439  002f 201e          	jra	L546
1440  0031               L736:
1441                     ; 660     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1443  0031 c65441        	ld	a,21569
1444  0034 a410          	and	a,#16
1445  0036 6b01          	ld	(OFST-1,sp),a
1446                     ; 663     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1448  0038 c65441        	ld	a,21569
1449  003b a420          	and	a,#32
1450  003d 6b02          	ld	(OFST+0,sp),a
1451                     ; 665     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1453  003f 0d01          	tnz	(OFST-1,sp)
1454  0041 270a          	jreq	L746
1456  0043 0d02          	tnz	(OFST+0,sp)
1457  0045 2706          	jreq	L746
1458                     ; 668       bitstatus = SET;
1460  0047 a601          	ld	a,#1
1461  0049 6b02          	ld	(OFST+0,sp),a
1463  004b 2002          	jra	L546
1464  004d               L746:
1465                     ; 673       bitstatus = RESET;
1467  004d 0f02          	clr	(OFST+0,sp)
1468  004f               L546:
1469                     ; 678   return (ITStatus) bitstatus;
1471  004f 7b02          	ld	a,(OFST+0,sp)
1474  0051 5b03          	addw	sp,#3
1475  0053 81            	ret
1511                     ; 689 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1511                     ; 690 {
1512                     .text:	section	.text,new
1513  0000               _COMP_ClearITPendingBit:
1517                     ; 692   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1519                     ; 694   if (COMP_Selection == COMP_Selection_COMP1)
1521  0000 a101          	cp	a,#1
1522  0002 2606          	jrne	L176
1523                     ; 697     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1525  0004 72195440      	bres	21568,#4
1527  0008 2004          	jra	L376
1528  000a               L176:
1529                     ; 702     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1531  000a 72195441      	bres	21569,#4
1532  000e               L376:
1533                     ; 704 }
1536  000e 81            	ret
1549                     	xdef	_COMP_ClearITPendingBit
1550                     	xdef	_COMP_GetITStatus
1551                     	xdef	_COMP_ClearFlag
1552                     	xdef	_COMP_GetFlagStatus
1553                     	xdef	_COMP_ITConfig
1554                     	xdef	_COMP_TriggerConfig
1555                     	xdef	_COMP_SchmittTriggerCmd
1556                     	xdef	_COMP_VrefintOutputCmd
1557                     	xdef	_COMP_WindowCmd
1558                     	xdef	_COMP_GetOutputLevel
1559                     	xdef	_COMP_EdgeConfig
1560                     	xdef	_COMP_VrefintToCOMP1Connect
1561                     	xdef	_COMP_Init
1562                     	xdef	_COMP_DeInit
1581                     	end
