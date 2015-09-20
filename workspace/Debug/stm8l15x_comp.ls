   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 105 void COMP_DeInit(void)
  32                     ; 106 {
  34                     	switch	.text
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
 234                     	switch	.text
 235  0015               _COMP_Init:
 237  0015 89            	pushw	x
 238       00000000      OFST:	set	0
 241                     ; 151   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 243                     ; 152   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 245                     ; 153   assert_param(IS_COMP_SPEED(COMP_Speed));
 247                     ; 156   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 249  0016 c65442        	ld	a,21570
 250  0019 a4c7          	and	a,#199
 251  001b c75442        	ld	21570,a
 252                     ; 158   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 254  001e 9e            	ld	a,xh
 255  001f ca5442        	or	a,21570
 256  0022 c75442        	ld	21570,a
 257                     ; 161   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 259  0025 c65442        	ld	a,21570
 260  0028 a43f          	and	a,#63
 261  002a c75442        	ld	21570,a
 262                     ; 163   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 264  002d 9f            	ld	a,xl
 265  002e ca5442        	or	a,21570
 266  0031 c75442        	ld	21570,a
 267                     ; 166   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 269  0034 72155441      	bres	21569,#2
 270                     ; 168   COMP->CSR2 |= (uint8_t) COMP_Speed;
 272  0038 c65441        	ld	a,21569
 273  003b 1a05          	or	a,(OFST+5,sp)
 274  003d c75441        	ld	21569,a
 275                     ; 169 }
 278  0040 85            	popw	x
 279  0041 81            	ret
 335                     ; 177 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 335                     ; 178 {
 336                     	switch	.text
 337  0042               _COMP_VrefintToCOMP1Connect:
 341                     ; 180   assert_param(IS_FUNCTIONAL_STATE(NewState));
 343                     ; 182   if (NewState != DISABLE)
 345  0042 4d            	tnz	a
 346  0043 2706          	jreq	L341
 347                     ; 185     COMP->CSR3 |= COMP_CSR3_VREFEN;
 349  0045 72145442      	bset	21570,#2
 351  0049 2004          	jra	L541
 352  004b               L341:
 353                     ; 190     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 355  004b 72155442      	bres	21570,#2
 356  004f               L541:
 357                     ; 192 }
 360  004f 81            	ret
 455                     ; 206 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 455                     ; 207 {
 456                     	switch	.text
 457  0050               _COMP_EdgeConfig:
 459  0050 89            	pushw	x
 460       00000000      OFST:	set	0
 463                     ; 209   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 465                     ; 210   assert_param(IS_COMP_EDGE(COMP_Edge));
 467                     ; 213   if (COMP_Selection == COMP_Selection_COMP1)
 469  0051 9e            	ld	a,xh
 470  0052 a101          	cp	a,#1
 471  0054 2611          	jrne	L312
 472                     ; 216     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 474  0056 c65440        	ld	a,21568
 475  0059 a4fc          	and	a,#252
 476  005b c75440        	ld	21568,a
 477                     ; 219     COMP->CSR1 |= (uint8_t) COMP_Edge;
 479  005e 9f            	ld	a,xl
 480  005f ca5440        	or	a,21568
 481  0062 c75440        	ld	21568,a
 483  0065 2010          	jra	L512
 484  0067               L312:
 485                     ; 225     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 487  0067 c65441        	ld	a,21569
 488  006a a4fc          	and	a,#252
 489  006c c75441        	ld	21569,a
 490                     ; 228     COMP->CSR2 |= (uint8_t) COMP_Edge;
 492  006f c65441        	ld	a,21569
 493  0072 1a02          	or	a,(OFST+2,sp)
 494  0074 c75441        	ld	21569,a
 495  0077               L512:
 496                     ; 230 }
 499  0077 85            	popw	x
 500  0078 81            	ret
 568                     ; 245 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 568                     ; 246 {
 569                     	switch	.text
 570  0079               _COMP_GetOutputLevel:
 572  0079 88            	push	a
 573       00000001      OFST:	set	1
 576                     ; 250   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 578                     ; 253   if (COMP_Selection == COMP_Selection_COMP1)
 580  007a a101          	cp	a,#1
 581  007c 2611          	jrne	L152
 582                     ; 256     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 584  007e c65440        	ld	a,21568
 585  0081 a508          	bcp	a,#8
 586  0083 2706          	jreq	L352
 587                     ; 259       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 589  0085 a601          	ld	a,#1
 590  0087 6b01          	ld	(OFST+0,sp),a
 592  0089 2013          	jra	L752
 593  008b               L352:
 594                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 596  008b 0f01          	clr	(OFST+0,sp)
 597  008d 200f          	jra	L752
 598  008f               L152:
 599                     ; 272     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 601  008f c65441        	ld	a,21569
 602  0092 a508          	bcp	a,#8
 603  0094 2706          	jreq	L162
 604                     ; 275       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 606  0096 a601          	ld	a,#1
 607  0098 6b01          	ld	(OFST+0,sp),a
 609  009a 2002          	jra	L752
 610  009c               L162:
 611                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 613  009c 0f01          	clr	(OFST+0,sp)
 614  009e               L752:
 615                     ; 286   return (COMP_OutputLevel_TypeDef)(compout);
 617  009e 7b01          	ld	a,(OFST+0,sp)
 620  00a0 5b01          	addw	sp,#1
 621  00a2 81            	ret
 656                     ; 318 void COMP_WindowCmd(FunctionalState NewState)
 656                     ; 319 {
 657                     	switch	.text
 658  00a3               _COMP_WindowCmd:
 662                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 664                     ; 323   if (NewState != DISABLE)
 666  00a3 4d            	tnz	a
 667  00a4 2706          	jreq	L303
 668                     ; 326     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 670  00a6 72125442      	bset	21570,#1
 672  00aa 2004          	jra	L503
 673  00ac               L303:
 674                     ; 331     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 676  00ac 72135442      	bres	21570,#1
 677  00b0               L503:
 678                     ; 333 }
 681  00b0 81            	ret
 717                     ; 356 void COMP_VrefintOutputCmd(FunctionalState NewState)
 717                     ; 357 {
 718                     	switch	.text
 719  00b1               _COMP_VrefintOutputCmd:
 723                     ; 359   assert_param(IS_FUNCTIONAL_STATE(NewState));
 725                     ; 361   if (NewState != DISABLE)
 727  00b1 4d            	tnz	a
 728  00b2 2706          	jreq	L523
 729                     ; 364     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 731  00b4 72105442      	bset	21570,#0
 733  00b8 2004          	jra	L723
 734  00ba               L523:
 735                     ; 369     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 737  00ba 72115442      	bres	21570,#0
 738  00be               L723:
 739                     ; 371 }
 742  00be 81            	ret
 778                     ; 395 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 778                     ; 396 {
 779                     	switch	.text
 780  00bf               _COMP_SchmittTriggerCmd:
 784                     ; 398   assert_param(IS_FUNCTIONAL_STATE(NewState));
 786                     ; 400   if (NewState != DISABLE)
 788  00bf 4d            	tnz	a
 789  00c0 2706          	jreq	L743
 790                     ; 403     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 792  00c2 72145440      	bset	21568,#2
 794  00c6 2004          	jra	L153
 795  00c8               L743:
 796                     ; 408     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 798  00c8 72155440      	bres	21568,#2
 799  00cc               L153:
 800                     ; 410 }
 803  00cc 81            	ret
 923                     ; 429 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 923                     ; 430                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 923                     ; 431                         FunctionalState NewState)
 923                     ; 432 {
 924                     	switch	.text
 925  00cd               _COMP_TriggerConfig:
 927  00cd 89            	pushw	x
 928       00000000      OFST:	set	0
 931                     ; 434   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 933                     ; 435   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 935                     ; 437   switch (COMP_TriggerGroup)
 937  00ce 9e            	ld	a,xh
 939                     ; 484     default:
 939                     ; 485       break;
 940  00cf 4a            	dec	a
 941  00d0 270b          	jreq	L353
 942  00d2 4a            	dec	a
 943  00d3 2721          	jreq	L553
 944  00d5 4a            	dec	a
 945  00d6 273d          	jreq	L753
 946  00d8 4a            	dec	a
 947  00d9 2753          	jreq	L163
 948  00db 206e          	jra	L344
 949  00dd               L353:
 950                     ; 439     case COMP_TriggerGroup_InvertingInput:
 950                     ; 440 
 950                     ; 441       if (NewState != DISABLE)
 952  00dd 0d05          	tnz	(OFST+5,sp)
 953  00df 270b          	jreq	L544
 954                     ; 443         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 956  00e1 7b02          	ld	a,(OFST+2,sp)
 957  00e3 43            	cpl	a
 958  00e4 c45443        	and	a,21571
 959  00e7 c75443        	ld	21571,a
 961  00ea 205f          	jra	L344
 962  00ec               L544:
 963                     ; 447         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 965  00ec c65443        	ld	a,21571
 966  00ef 1a02          	or	a,(OFST+2,sp)
 967  00f1 c75443        	ld	21571,a
 968  00f4 2055          	jra	L344
 969  00f6               L553:
 970                     ; 451     case COMP_TriggerGroup_NonInvertingInput:
 970                     ; 452       if (NewState != DISABLE)
 972  00f6 0d05          	tnz	(OFST+5,sp)
 973  00f8 270e          	jreq	L154
 974                     ; 454         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 976  00fa 7b02          	ld	a,(OFST+2,sp)
 977  00fc 48            	sll	a
 978  00fd 48            	sll	a
 979  00fe 48            	sll	a
 980  00ff 43            	cpl	a
 981  0100 c45443        	and	a,21571
 982  0103 c75443        	ld	21571,a
 984  0106 2043          	jra	L344
 985  0108               L154:
 986                     ; 458         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 988  0108 7b02          	ld	a,(OFST+2,sp)
 989  010a 48            	sll	a
 990  010b 48            	sll	a
 991  010c 48            	sll	a
 992  010d ca5443        	or	a,21571
 993  0110 c75443        	ld	21571,a
 994  0113 2036          	jra	L344
 995  0115               L753:
 996                     ; 462     case COMP_TriggerGroup_VREFINTOutput:
 996                     ; 463       if (NewState != DISABLE)
 998  0115 0d05          	tnz	(OFST+5,sp)
 999  0117 270b          	jreq	L554
1000                     ; 465         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1002  0119 7b02          	ld	a,(OFST+2,sp)
1003  011b 43            	cpl	a
1004  011c c45444        	and	a,21572
1005  011f c75444        	ld	21572,a
1007  0122 2027          	jra	L344
1008  0124               L554:
1009                     ; 469         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1011  0124 c65444        	ld	a,21572
1012  0127 1a02          	or	a,(OFST+2,sp)
1013  0129 c75444        	ld	21572,a
1014  012c 201d          	jra	L344
1015  012e               L163:
1016                     ; 473     case COMP_TriggerGroup_DACOutput:
1016                     ; 474       if (NewState != DISABLE)
1018  012e 0d05          	tnz	(OFST+5,sp)
1019  0130 270e          	jreq	L164
1020                     ; 476         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1022  0132 7b02          	ld	a,(OFST+2,sp)
1023  0134 48            	sll	a
1024  0135 48            	sll	a
1025  0136 48            	sll	a
1026  0137 43            	cpl	a
1027  0138 c45444        	and	a,21572
1028  013b c75444        	ld	21572,a
1030  013e 200b          	jra	L344
1031  0140               L164:
1032                     ; 480         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1034  0140 7b02          	ld	a,(OFST+2,sp)
1035  0142 48            	sll	a
1036  0143 48            	sll	a
1037  0144 48            	sll	a
1038  0145 ca5444        	or	a,21572
1039  0148 c75444        	ld	21572,a
1040  014b               L363:
1041                     ; 484     default:
1041                     ; 485       break;
1043  014b               L344:
1044                     ; 487 }
1047  014b 85            	popw	x
1048  014c 81            	ret
1093                     ; 515 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1093                     ; 516 {
1094                     	switch	.text
1095  014d               _COMP_ITConfig:
1097  014d 89            	pushw	x
1098       00000000      OFST:	set	0
1101                     ; 518   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1103                     ; 519   assert_param(IS_FUNCTIONAL_STATE(NewState));
1105                     ; 522   if (COMP_Selection == COMP_Selection_COMP1)
1107  014e 9e            	ld	a,xh
1108  014f a101          	cp	a,#1
1109  0151 2610          	jrne	L705
1110                     ; 524     if (NewState != DISABLE)
1112  0153 9f            	ld	a,xl
1113  0154 4d            	tnz	a
1114  0155 2706          	jreq	L115
1115                     ; 527       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1117  0157 721a5440      	bset	21568,#5
1119  015b 2014          	jra	L515
1120  015d               L115:
1121                     ; 532       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1123  015d 721b5440      	bres	21568,#5
1124  0161 200e          	jra	L515
1125  0163               L705:
1126                     ; 537     if (NewState != DISABLE)
1128  0163 0d02          	tnz	(OFST+2,sp)
1129  0165 2706          	jreq	L715
1130                     ; 540       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1132  0167 721a5441      	bset	21569,#5
1134  016b 2004          	jra	L515
1135  016d               L715:
1136                     ; 545       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1138  016d 721b5441      	bres	21569,#5
1139  0171               L515:
1140                     ; 548 }
1143  0171 85            	popw	x
1144  0172 81            	ret
1210                     ; 558 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1210                     ; 559 {
1211                     	switch	.text
1212  0173               _COMP_GetFlagStatus:
1214  0173 88            	push	a
1215       00000001      OFST:	set	1
1218                     ; 560   FlagStatus bitstatus = RESET;
1220  0174 0f01          	clr	(OFST+0,sp)
1221                     ; 563   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1223                     ; 566   if (COMP_Selection == COMP_Selection_COMP1)
1225  0176 a101          	cp	a,#1
1226  0178 2611          	jrne	L555
1227                     ; 568     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1229  017a c65440        	ld	a,21568
1230  017d a510          	bcp	a,#16
1231  017f 2706          	jreq	L755
1232                     ; 571       bitstatus = SET;
1234  0181 a601          	ld	a,#1
1235  0183 6b01          	ld	(OFST+0,sp),a
1237  0185 2013          	jra	L365
1238  0187               L755:
1239                     ; 576       bitstatus = RESET;
1241  0187 0f01          	clr	(OFST+0,sp)
1242  0189 200f          	jra	L365
1243  018b               L555:
1244                     ; 581     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1246  018b c65441        	ld	a,21569
1247  018e a510          	bcp	a,#16
1248  0190 2706          	jreq	L565
1249                     ; 584       bitstatus = SET;
1251  0192 a601          	ld	a,#1
1252  0194 6b01          	ld	(OFST+0,sp),a
1254  0196 2002          	jra	L365
1255  0198               L565:
1256                     ; 589       bitstatus = RESET;
1258  0198 0f01          	clr	(OFST+0,sp)
1259  019a               L365:
1260                     ; 594   return (FlagStatus)(bitstatus);
1262  019a 7b01          	ld	a,(OFST+0,sp)
1265  019c 5b01          	addw	sp,#1
1266  019e 81            	ret
1301                     ; 605 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1301                     ; 606 {
1302                     	switch	.text
1303  019f               _COMP_ClearFlag:
1307                     ; 608   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1309                     ; 610   if (COMP_Selection == COMP_Selection_COMP1)
1311  019f a101          	cp	a,#1
1312  01a1 2606          	jrne	L706
1313                     ; 613     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1315  01a3 72195440      	bres	21568,#4
1317  01a7 2004          	jra	L116
1318  01a9               L706:
1319                     ; 618     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1321  01a9 72195441      	bres	21569,#4
1322  01ad               L116:
1323                     ; 620 }
1326  01ad 81            	ret
1390                     ; 630 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1390                     ; 631 {
1391                     	switch	.text
1392  01ae               _COMP_GetITStatus:
1394  01ae 88            	push	a
1395  01af 89            	pushw	x
1396       00000002      OFST:	set	2
1399                     ; 632   ITStatus bitstatus = RESET;
1401  01b0 7b02          	ld	a,(OFST+0,sp)
1402  01b2 97            	ld	xl,a
1403                     ; 633   uint8_t itstatus = 0x00, itenable = 0x00;
1405  01b3 7b01          	ld	a,(OFST-1,sp)
1406  01b5 97            	ld	xl,a
1409  01b6 7b02          	ld	a,(OFST+0,sp)
1410  01b8 97            	ld	xl,a
1411                     ; 636   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1413                     ; 638   if (COMP_Selection == COMP_Selection_COMP1)
1415  01b9 7b03          	ld	a,(OFST+1,sp)
1416  01bb a101          	cp	a,#1
1417  01bd 2620          	jrne	L546
1418                     ; 641     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1420  01bf c65440        	ld	a,21568
1421  01c2 a410          	and	a,#16
1422  01c4 6b01          	ld	(OFST-1,sp),a
1423                     ; 644     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1425  01c6 c65440        	ld	a,21568
1426  01c9 a420          	and	a,#32
1427  01cb 6b02          	ld	(OFST+0,sp),a
1428                     ; 646     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1430  01cd 0d01          	tnz	(OFST-1,sp)
1431  01cf 270a          	jreq	L746
1433  01d1 0d02          	tnz	(OFST+0,sp)
1434  01d3 2706          	jreq	L746
1435                     ; 649       bitstatus = SET;
1437  01d5 a601          	ld	a,#1
1438  01d7 6b02          	ld	(OFST+0,sp),a
1440  01d9 2022          	jra	L356
1441  01db               L746:
1442                     ; 654       bitstatus = RESET;
1444  01db 0f02          	clr	(OFST+0,sp)
1445  01dd 201e          	jra	L356
1446  01df               L546:
1447                     ; 660     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1449  01df c65441        	ld	a,21569
1450  01e2 a410          	and	a,#16
1451  01e4 6b01          	ld	(OFST-1,sp),a
1452                     ; 663     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1454  01e6 c65441        	ld	a,21569
1455  01e9 a420          	and	a,#32
1456  01eb 6b02          	ld	(OFST+0,sp),a
1457                     ; 665     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1459  01ed 0d01          	tnz	(OFST-1,sp)
1460  01ef 270a          	jreq	L556
1462  01f1 0d02          	tnz	(OFST+0,sp)
1463  01f3 2706          	jreq	L556
1464                     ; 668       bitstatus = SET;
1466  01f5 a601          	ld	a,#1
1467  01f7 6b02          	ld	(OFST+0,sp),a
1469  01f9 2002          	jra	L356
1470  01fb               L556:
1471                     ; 673       bitstatus = RESET;
1473  01fb 0f02          	clr	(OFST+0,sp)
1474  01fd               L356:
1475                     ; 678   return (ITStatus) bitstatus;
1477  01fd 7b02          	ld	a,(OFST+0,sp)
1480  01ff 5b03          	addw	sp,#3
1481  0201 81            	ret
1517                     ; 689 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1517                     ; 690 {
1518                     	switch	.text
1519  0202               _COMP_ClearITPendingBit:
1523                     ; 692   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1525                     ; 694   if (COMP_Selection == COMP_Selection_COMP1)
1527  0202 a101          	cp	a,#1
1528  0204 2606          	jrne	L776
1529                     ; 697     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1531  0206 72195440      	bres	21568,#4
1533  020a 2004          	jra	L107
1534  020c               L776:
1535                     ; 702     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1537  020c 72195441      	bres	21569,#4
1538  0210               L107:
1539                     ; 704 }
1542  0210 81            	ret
1555                     	xdef	_COMP_ClearITPendingBit
1556                     	xdef	_COMP_GetITStatus
1557                     	xdef	_COMP_ClearFlag
1558                     	xdef	_COMP_GetFlagStatus
1559                     	xdef	_COMP_ITConfig
1560                     	xdef	_COMP_TriggerConfig
1561                     	xdef	_COMP_SchmittTriggerCmd
1562                     	xdef	_COMP_VrefintOutputCmd
1563                     	xdef	_COMP_WindowCmd
1564                     	xdef	_COMP_GetOutputLevel
1565                     	xdef	_COMP_EdgeConfig
1566                     	xdef	_COMP_VrefintToCOMP1Connect
1567                     	xdef	_COMP_Init
1568                     	xdef	_COMP_DeInit
1587                     	end
