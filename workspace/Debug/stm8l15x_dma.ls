   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 134 void DMA_GlobalDeInit(void)
  32                     ; 135 {
  34                     	switch	.text
  35  0000               _DMA_GlobalDeInit:
  39                     ; 137     DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  41  0000 72115070      	bres	20592,#0
  42                     ; 140     DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  44  0004 35fc5070      	mov	20592,#252
  45                     ; 141 }
  48  0008 81            	ret
 164                     ; 149 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 164                     ; 150 {
 165                     	switch	.text
 166  0009               _DMA_DeInit:
 168  0009 89            	pushw	x
 169       00000000      OFST:	set	0
 172                     ; 152     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 174                     ; 155     DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 176  000a f6            	ld	a,(x)
 177  000b a4fe          	and	a,#254
 178  000d f7            	ld	(x),a
 179                     ; 158     DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 181  000e 7f            	clr	(x)
 182                     ; 161     DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 184  000f 6f02          	clr	(2,x)
 185                     ; 164     if (DMA_Channelx == DMA1_Channel3) {
 187  0011 a35093        	cpw	x,#20627
 188  0014 2608          	jrne	L501
 189                     ; 165         DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 191  0016 a640          	ld	a,#64
 192  0018 e703          	ld	(3,x),a
 193                     ; 166         DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 195  001a 6f05          	clr	(5,x)
 197  001c 2006          	jra	L701
 198  001e               L501:
 199                     ; 168         DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 201  001e 1e01          	ldw	x,(OFST+1,sp)
 202  0020 a652          	ld	a,#82
 203  0022 e703          	ld	(3,x),a
 204  0024               L701:
 205                     ; 170     DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 207  0024 1e01          	ldw	x,(OFST+1,sp)
 208  0026 6f04          	clr	(4,x)
 209                     ; 173     DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 211  0028 1e01          	ldw	x,(OFST+1,sp)
 212  002a 6f06          	clr	(6,x)
 213                     ; 174     DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 215  002c 1e01          	ldw	x,(OFST+1,sp)
 216  002e 6f07          	clr	(7,x)
 217                     ; 177     DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 219  0030 1e01          	ldw	x,(OFST+1,sp)
 220  0032 6f01          	clr	(1,x)
 221                     ; 178 }
 224  0034 85            	popw	x
 225  0035 81            	ret
 471                     ; 215 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 471                     ; 216               uint32_t DMA_Memory0BaseAddr,
 471                     ; 217               uint16_t DMA_PeripheralMemory1BaseAddr,
 471                     ; 218               uint8_t DMA_BufferSize,
 471                     ; 219               DMA_DIR_TypeDef DMA_DIR,
 471                     ; 220               DMA_Mode_TypeDef DMA_Mode,
 471                     ; 221               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 471                     ; 222               DMA_Priority_TypeDef DMA_Priority,
 471                     ; 223               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 471                     ; 224 {
 472                     	switch	.text
 473  0036               _DMA_Init:
 475  0036 89            	pushw	x
 476       00000000      OFST:	set	0
 479                     ; 226     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 481                     ; 227     assert_param(IS_DMA_DIR(DMA_DIR));
 483                     ; 228     assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 485                     ; 229     assert_param(IS_DMA_MODE(DMA_Mode));
 487                     ; 230     assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 489                     ; 231     assert_param(IS_DMA_PRIORITY(DMA_Priority));
 491                     ; 235     DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 493  0037 f6            	ld	a,(x)
 494  0038 a4fe          	and	a,#254
 495  003a f7            	ld	(x),a
 496                     ; 238     DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 498  003b 7f            	clr	(x)
 499                     ; 241     DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 499                     ; 242                                    (uint8_t)DMA_Mode) | \
 499                     ; 243                                    (uint8_t)DMA_MemoryIncMode);
 501  003c 7b0c          	ld	a,(OFST+12,sp)
 502  003e 1a0d          	or	a,(OFST+13,sp)
 503  0040 1a0e          	or	a,(OFST+14,sp)
 504  0042 fa            	or	a,(x)
 505  0043 f7            	ld	(x),a
 506                     ; 246     DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 508  0044 e601          	ld	a,(1,x)
 509  0046 a4c7          	and	a,#199
 510  0048 e701          	ld	(1,x),a
 511                     ; 249     DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 511                     ; 250                                     (uint8_t)DMA_MemoryDataSize);
 513  004a 7b0f          	ld	a,(OFST+15,sp)
 514  004c 1a10          	or	a,(OFST+16,sp)
 515  004e ea01          	or	a,(1,x)
 516  0050 e701          	ld	(1,x),a
 517                     ; 254     DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 519  0052 7b0b          	ld	a,(OFST+11,sp)
 520  0054 1e01          	ldw	x,(OFST+1,sp)
 521  0056 e702          	ld	(2,x),a
 522                     ; 259     DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 524  0058 7b09          	ld	a,(OFST+9,sp)
 525  005a 1e01          	ldw	x,(OFST+1,sp)
 526  005c e703          	ld	(3,x),a
 527                     ; 260     DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 529  005e 7b0a          	ld	a,(OFST+10,sp)
 530  0060 1e01          	ldw	x,(OFST+1,sp)
 531  0062 e704          	ld	(4,x),a
 532                     ; 264     if (DMA_Channelx == DMA1_Channel3) {
 534  0064 1e01          	ldw	x,(OFST+1,sp)
 535  0066 a35093        	cpw	x,#20627
 536  0069 2606          	jrne	L742
 537                     ; 265         DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 539  006b 7b06          	ld	a,(OFST+6,sp)
 540  006d 1e01          	ldw	x,(OFST+1,sp)
 541  006f e705          	ld	(5,x),a
 542  0071               L742:
 543                     ; 267     DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 545  0071 7b07          	ld	a,(OFST+7,sp)
 546  0073 1e01          	ldw	x,(OFST+1,sp)
 547  0075 e706          	ld	(6,x),a
 548                     ; 268     DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 550  0077 7b08          	ld	a,(OFST+8,sp)
 551  0079 1e01          	ldw	x,(OFST+1,sp)
 552  007b e707          	ld	(7,x),a
 553                     ; 270 }
 556  007d 85            	popw	x
 557  007e 81            	ret
 612                     ; 278 void DMA_GlobalCmd(FunctionalState NewState)
 612                     ; 279 {
 613                     	switch	.text
 614  007f               _DMA_GlobalCmd:
 618                     ; 281     assert_param(IS_FUNCTIONAL_STATE(NewState));
 620                     ; 283     if (NewState != DISABLE) {
 622  007f 4d            	tnz	a
 623  0080 2706          	jreq	L772
 624                     ; 285         DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 626  0082 72105070      	bset	20592,#0
 628  0086 2004          	jra	L103
 629  0088               L772:
 630                     ; 288         DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 632  0088 72115070      	bres	20592,#0
 633  008c               L103:
 634                     ; 290 }
 637  008c 81            	ret
 684                     ; 301 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 684                     ; 302 {
 685                     	switch	.text
 686  008d               _DMA_Cmd:
 688  008d 89            	pushw	x
 689       00000000      OFST:	set	0
 692                     ; 304     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 694                     ; 305     assert_param(IS_FUNCTIONAL_STATE(NewState));
 696                     ; 307     if (NewState != DISABLE) {
 698  008e 0d05          	tnz	(OFST+5,sp)
 699  0090 2706          	jreq	L723
 700                     ; 309         DMA_Channelx->CCR |= DMA_CCR_CE;
 702  0092 f6            	ld	a,(x)
 703  0093 aa01          	or	a,#1
 704  0095 f7            	ld	(x),a
 706  0096 2006          	jra	L133
 707  0098               L723:
 708                     ; 312         DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 710  0098 1e01          	ldw	x,(OFST+1,sp)
 711  009a f6            	ld	a,(x)
 712  009b a4fe          	and	a,#254
 713  009d f7            	ld	(x),a
 714  009e               L133:
 715                     ; 314 }
 718  009e 85            	popw	x
 719  009f 81            	ret
 753                     ; 326 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 753                     ; 327 {
 754                     	switch	.text
 755  00a0               _DMA_SetTimeOut:
 759                     ; 329     assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 761                     ; 332     DMA1->GCSR = 0;
 763  00a0 725f5070      	clr	20592
 764                     ; 333     DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 766  00a4 48            	sll	a
 767  00a5 48            	sll	a
 768  00a6 c75070        	ld	20592,a
 769                     ; 335 }
 772  00a9 81            	ret
 819                     ; 385 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 819                     ; 386 {
 820                     	switch	.text
 821  00aa               _DMA_SetCurrDataCounter:
 823  00aa 89            	pushw	x
 824       00000000      OFST:	set	0
 827                     ; 388     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 829                     ; 391     DMA_Channelx->CNBTR = DataNumber;
 831  00ab 7b05          	ld	a,(OFST+5,sp)
 832  00ad 1e01          	ldw	x,(OFST+1,sp)
 833  00af e702          	ld	(2,x),a
 834                     ; 392 }
 837  00b1 85            	popw	x
 838  00b2 81            	ret
 876                     ; 399 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 876                     ; 400 {
 877                     	switch	.text
 878  00b3               _DMA_GetCurrDataCounter:
 882                     ; 402     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 884                     ; 405     return ((uint8_t)(DMA_Channelx->CNBTR));
 886  00b3 e602          	ld	a,(2,x)
 889  00b5 81            	ret
 966                     ; 466 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx,
 966                     ; 467                   DMA_ITx_TypeDef DMA_ITx,
 966                     ; 468                   FunctionalState NewState)
 966                     ; 469 {
 967                     	switch	.text
 968  00b6               _DMA_ITConfig:
 970  00b6 89            	pushw	x
 971       00000000      OFST:	set	0
 974                     ; 471     assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 976                     ; 472     assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 978                     ; 473     assert_param(IS_FUNCTIONAL_STATE(NewState));
 980                     ; 475     if (NewState != DISABLE) {
 982  00b7 0d06          	tnz	(OFST+6,sp)
 983  00b9 2706          	jreq	L554
 984                     ; 477         DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 986  00bb f6            	ld	a,(x)
 987  00bc 1a05          	or	a,(OFST+5,sp)
 988  00be f7            	ld	(x),a
 990  00bf 2007          	jra	L754
 991  00c1               L554:
 992                     ; 480         DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 994  00c1 1e01          	ldw	x,(OFST+1,sp)
 995  00c3 7b05          	ld	a,(OFST+5,sp)
 996  00c5 43            	cpl	a
 997  00c6 f4            	and	a,(x)
 998  00c7 f7            	ld	(x),a
 999  00c8               L754:
1000                     ; 482 }
1003  00c8 85            	popw	x
1004  00c9 81            	ret
1253                     ; 511 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1253                     ; 512 {
1254                     	switch	.text
1255  00ca               _DMA_GetFlagStatus:
1257  00ca 89            	pushw	x
1258  00cb 5204          	subw	sp,#4
1259       00000004      OFST:	set	4
1262                     ; 513     FlagStatus flagstatus = RESET;
1264  00cd 7b04          	ld	a,(OFST+0,sp)
1265  00cf 97            	ld	xl,a
1266                     ; 514     DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1268  00d0 1e02          	ldw	x,(OFST-2,sp)
1269                     ; 515     uint8_t tmpgir1 = 0;
1271  00d2 7b01          	ld	a,(OFST-3,sp)
1272  00d4 97            	ld	xl,a
1273                     ; 516     uint8_t tmpgcsr = 0;
1275  00d5 7b04          	ld	a,(OFST+0,sp)
1276  00d7 97            	ld	xl,a
1277                     ; 519     assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1279                     ; 522     tmpgcsr = DMA1->GCSR;
1281  00d8 c65070        	ld	a,20592
1282  00db 6b04          	ld	(OFST+0,sp),a
1283                     ; 523     tmpgir1 = DMA1->GIR1;
1285  00dd c65071        	ld	a,20593
1286  00e0 6b01          	ld	(OFST-3,sp),a
1287                     ; 525     if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET) {
1289  00e2 7b05          	ld	a,(OFST+1,sp)
1290  00e4 a50f          	bcp	a,#15
1291  00e6 2736          	jreq	L706
1292                     ; 527         if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET) {
1294  00e8 7b05          	ld	a,(OFST+1,sp)
1295  00ea a501          	bcp	a,#1
1296  00ec 2707          	jreq	L116
1297                     ; 528             DMA_Channelx = DMA1_Channel0;
1299  00ee ae5075        	ldw	x,#20597
1300  00f1 1f02          	ldw	(OFST-2,sp),x
1302  00f3 201f          	jra	L316
1303  00f5               L116:
1304                     ; 529         } else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET) {
1306  00f5 7b05          	ld	a,(OFST+1,sp)
1307  00f7 a502          	bcp	a,#2
1308  00f9 2707          	jreq	L516
1309                     ; 530             DMA_Channelx = DMA1_Channel1;
1311  00fb ae507f        	ldw	x,#20607
1312  00fe 1f02          	ldw	(OFST-2,sp),x
1314  0100 2012          	jra	L316
1315  0102               L516:
1316                     ; 531         } else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET) {
1318  0102 7b05          	ld	a,(OFST+1,sp)
1319  0104 a504          	bcp	a,#4
1320  0106 2707          	jreq	L126
1321                     ; 532             DMA_Channelx = DMA1_Channel2;
1323  0108 ae5089        	ldw	x,#20617
1324  010b 1f02          	ldw	(OFST-2,sp),x
1326  010d 2005          	jra	L316
1327  010f               L126:
1328                     ; 534             DMA_Channelx = DMA1_Channel3;
1330  010f ae5093        	ldw	x,#20627
1331  0112 1f02          	ldw	(OFST-2,sp),x
1332  0114               L316:
1333                     ; 538         flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1335  0114 1e02          	ldw	x,(OFST-2,sp)
1336  0116 e601          	ld	a,(1,x)
1337  0118 1406          	and	a,(OFST+2,sp)
1338  011a 6b04          	ld	(OFST+0,sp),a
1340  011c 2014          	jra	L526
1341  011e               L706:
1342                     ; 539     } else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET) {
1344  011e 7b05          	ld	a,(OFST+1,sp)
1345  0120 a510          	bcp	a,#16
1346  0122 2708          	jreq	L726
1347                     ; 541         flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1349  0124 7b06          	ld	a,(OFST+2,sp)
1350  0126 1401          	and	a,(OFST-3,sp)
1351  0128 6b04          	ld	(OFST+0,sp),a
1353  012a 2006          	jra	L526
1354  012c               L726:
1355                     ; 544         flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1357  012c 7b04          	ld	a,(OFST+0,sp)
1358  012e a402          	and	a,#2
1359  0130 6b04          	ld	(OFST+0,sp),a
1360  0132               L526:
1361                     ; 548     return (flagstatus);
1363  0132 7b04          	ld	a,(OFST+0,sp)
1366  0134 5b06          	addw	sp,#6
1367  0136 81            	ret
1414                     ; 566 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1414                     ; 567 {
1415                     	switch	.text
1416  0137               _DMA_ClearFlag:
1418  0137 89            	pushw	x
1419  0138 89            	pushw	x
1420       00000002      OFST:	set	2
1423                     ; 568     DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1425  0139 ae5075        	ldw	x,#20597
1426  013c 1f01          	ldw	(OFST-1,sp),x
1427                     ; 571     assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1429                     ; 574     if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET) {
1431  013e 7b03          	ld	a,(OFST+1,sp)
1432  0140 a501          	bcp	a,#1
1433  0142 2707          	jreq	L756
1434                     ; 575         DMA_Channelx = DMA1_Channel0;
1436  0144 ae5075        	ldw	x,#20597
1437  0147 1f01          	ldw	(OFST-1,sp),x
1439  0149 201f          	jra	L166
1440  014b               L756:
1441                     ; 577         if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET) {
1443  014b 7b03          	ld	a,(OFST+1,sp)
1444  014d a502          	bcp	a,#2
1445  014f 2707          	jreq	L366
1446                     ; 578             DMA_Channelx = DMA1_Channel1;
1448  0151 ae507f        	ldw	x,#20607
1449  0154 1f01          	ldw	(OFST-1,sp),x
1451  0156 2012          	jra	L166
1452  0158               L366:
1453                     ; 580             if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET) {
1455  0158 7b03          	ld	a,(OFST+1,sp)
1456  015a a504          	bcp	a,#4
1457  015c 2707          	jreq	L766
1458                     ; 581                 DMA_Channelx = DMA1_Channel2;
1460  015e ae5089        	ldw	x,#20617
1461  0161 1f01          	ldw	(OFST-1,sp),x
1463  0163 2005          	jra	L166
1464  0165               L766:
1465                     ; 583                 DMA_Channelx = DMA1_Channel3;
1467  0165 ae5093        	ldw	x,#20627
1468  0168 1f01          	ldw	(OFST-1,sp),x
1469  016a               L166:
1470                     ; 589     DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1472  016a 1e01          	ldw	x,(OFST-1,sp)
1473  016c 7b04          	ld	a,(OFST+2,sp)
1474  016e a406          	and	a,#6
1475  0170 43            	cpl	a
1476  0171 e401          	and	a,(1,x)
1477  0173 e701          	ld	(1,x),a
1478                     ; 590 }
1481  0175 5b04          	addw	sp,#4
1482  0177 81            	ret
1620                     ; 606 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1620                     ; 607 {
1621                     	switch	.text
1622  0178               _DMA_GetITStatus:
1624  0178 88            	push	a
1625  0179 5204          	subw	sp,#4
1626       00000004      OFST:	set	4
1629                     ; 608     ITStatus itstatus = RESET;
1631  017b 7b02          	ld	a,(OFST-2,sp)
1632  017d 97            	ld	xl,a
1633                     ; 609     uint8_t tmpreg = 0;
1635  017e 7b01          	ld	a,(OFST-3,sp)
1636  0180 97            	ld	xl,a
1637                     ; 610     uint8_t tmp2 = 0;
1639  0181 7b02          	ld	a,(OFST-2,sp)
1640  0183 97            	ld	xl,a
1641                     ; 611     DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1643  0184 1e03          	ldw	x,(OFST-1,sp)
1644                     ; 614     assert_param(IS_DMA_GET_IT(DMA_IT));
1646                     ; 617     if ((DMA_IT & 0x10) != (uint8_t)RESET) {
1648  0186 7b05          	ld	a,(OFST+1,sp)
1649  0188 a510          	bcp	a,#16
1650  018a 2707          	jreq	L757
1651                     ; 618         DMA_Channelx = DMA1_Channel0;
1653  018c ae5075        	ldw	x,#20597
1654  018f 1f03          	ldw	(OFST-1,sp),x
1656  0191 201f          	jra	L167
1657  0193               L757:
1658                     ; 620         if  ((DMA_IT & 0x20) != (uint8_t)RESET) {
1660  0193 7b05          	ld	a,(OFST+1,sp)
1661  0195 a520          	bcp	a,#32
1662  0197 2707          	jreq	L367
1663                     ; 621             DMA_Channelx = DMA1_Channel1;
1665  0199 ae507f        	ldw	x,#20607
1666  019c 1f03          	ldw	(OFST-1,sp),x
1668  019e 2012          	jra	L167
1669  01a0               L367:
1670                     ; 623             if  ((DMA_IT & 0x40) != (uint8_t)RESET) {
1672  01a0 7b05          	ld	a,(OFST+1,sp)
1673  01a2 a540          	bcp	a,#64
1674  01a4 2707          	jreq	L767
1675                     ; 624                 DMA_Channelx = DMA1_Channel2;
1677  01a6 ae5089        	ldw	x,#20617
1678  01a9 1f03          	ldw	(OFST-1,sp),x
1680  01ab 2005          	jra	L167
1681  01ad               L767:
1682                     ; 626                 DMA_Channelx = DMA1_Channel3;
1684  01ad ae5093        	ldw	x,#20627
1685  01b0 1f03          	ldw	(OFST-1,sp),x
1686  01b2               L167:
1687                     ; 631     tmpreg =  DMA_Channelx->CSPR ;
1689  01b2 1e03          	ldw	x,(OFST-1,sp)
1690  01b4 e601          	ld	a,(1,x)
1691  01b6 6b01          	ld	(OFST-3,sp),a
1692                     ; 632     tmpreg &= DMA_Channelx->CCR ;
1694  01b8 1e03          	ldw	x,(OFST-1,sp)
1695  01ba 7b01          	ld	a,(OFST-3,sp)
1696  01bc f4            	and	a,(x)
1697  01bd 6b01          	ld	(OFST-3,sp),a
1698                     ; 633     tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1700  01bf 7b05          	ld	a,(OFST+1,sp)
1701  01c1 a406          	and	a,#6
1702  01c3 6b02          	ld	(OFST-2,sp),a
1703                     ; 634     itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1705  01c5 7b01          	ld	a,(OFST-3,sp)
1706  01c7 1402          	and	a,(OFST-2,sp)
1707  01c9 6b02          	ld	(OFST-2,sp),a
1708                     ; 637     return (itstatus);
1710  01cb 7b02          	ld	a,(OFST-2,sp)
1713  01cd 5b05          	addw	sp,#5
1714  01cf 81            	ret
1762                     ; 655 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1762                     ; 656 {
1763                     	switch	.text
1764  01d0               _DMA_ClearITPendingBit:
1766  01d0 88            	push	a
1767  01d1 89            	pushw	x
1768       00000002      OFST:	set	2
1771                     ; 657     DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1773  01d2 ae5075        	ldw	x,#20597
1774  01d5 1f01          	ldw	(OFST-1,sp),x
1775                     ; 660     assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1777                     ; 662     if ((DMA_IT & 0x10) != (uint8_t)RESET) {
1779  01d7 a510          	bcp	a,#16
1780  01d9 2707          	jreq	L7101
1781                     ; 663         DMA_Channelx = DMA1_Channel0;
1783  01db ae5075        	ldw	x,#20597
1784  01de 1f01          	ldw	(OFST-1,sp),x
1786  01e0 201f          	jra	L1201
1787  01e2               L7101:
1788                     ; 665         if ((DMA_IT & 0x20) != (uint8_t)RESET) {
1790  01e2 7b03          	ld	a,(OFST+1,sp)
1791  01e4 a520          	bcp	a,#32
1792  01e6 2707          	jreq	L3201
1793                     ; 666             DMA_Channelx = DMA1_Channel1;
1795  01e8 ae507f        	ldw	x,#20607
1796  01eb 1f01          	ldw	(OFST-1,sp),x
1798  01ed 2012          	jra	L1201
1799  01ef               L3201:
1800                     ; 668             if ((DMA_IT & 0x40) != (uint8_t)RESET) {
1802  01ef 7b03          	ld	a,(OFST+1,sp)
1803  01f1 a540          	bcp	a,#64
1804  01f3 2707          	jreq	L7201
1805                     ; 669                 DMA_Channelx = DMA1_Channel2;
1807  01f5 ae5089        	ldw	x,#20617
1808  01f8 1f01          	ldw	(OFST-1,sp),x
1810  01fa 2005          	jra	L1201
1811  01fc               L7201:
1812                     ; 671                 DMA_Channelx = DMA1_Channel3;
1814  01fc ae5093        	ldw	x,#20627
1815  01ff 1f01          	ldw	(OFST-1,sp),x
1816  0201               L1201:
1817                     ; 676     DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1819  0201 1e01          	ldw	x,(OFST-1,sp)
1820  0203 7b03          	ld	a,(OFST+1,sp)
1821  0205 a406          	and	a,#6
1822  0207 43            	cpl	a
1823  0208 e401          	and	a,(1,x)
1824  020a e701          	ld	(1,x),a
1825                     ; 677 }
1828  020c 5b03          	addw	sp,#3
1829  020e 81            	ret
1842                     	xdef	_DMA_ClearITPendingBit
1843                     	xdef	_DMA_GetITStatus
1844                     	xdef	_DMA_ClearFlag
1845                     	xdef	_DMA_GetFlagStatus
1846                     	xdef	_DMA_ITConfig
1847                     	xdef	_DMA_GetCurrDataCounter
1848                     	xdef	_DMA_SetCurrDataCounter
1849                     	xdef	_DMA_SetTimeOut
1850                     	xdef	_DMA_Cmd
1851                     	xdef	_DMA_GlobalCmd
1852                     	xdef	_DMA_Init
1853                     	xdef	_DMA_DeInit
1854                     	xdef	_DMA_GlobalDeInit
1873                     	end
