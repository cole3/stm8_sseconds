   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 134 void DMA_GlobalDeInit(void)
  32                     ; 135 {
  34                     .text:	section	.text,new
  35  0000               _DMA_GlobalDeInit:
  39                     ; 137   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  41  0000 72115070      	bres	20592,#0
  42                     ; 140   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  44  0004 35fc5070      	mov	20592,#252
  45                     ; 141 }
  48  0008 81            	ret
 164                     ; 149 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 164                     ; 150 {
 165                     .text:	section	.text,new
 166  0000               _DMA_DeInit:
 168  0000 89            	pushw	x
 169       00000000      OFST:	set	0
 172                     ; 152   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 174                     ; 155   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 176  0001 f6            	ld	a,(x)
 177  0002 a4fe          	and	a,#254
 178  0004 f7            	ld	(x),a
 179                     ; 158   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 181  0005 7f            	clr	(x)
 182                     ; 161   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 184  0006 6f02          	clr	(2,x)
 185                     ; 164   if (DMA_Channelx == DMA1_Channel3)
 187  0008 a35093        	cpw	x,#20627
 188  000b 2608          	jrne	L501
 189                     ; 166     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 191  000d a640          	ld	a,#64
 192  000f e703          	ld	(3,x),a
 193                     ; 167     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 195  0011 6f05          	clr	(5,x)
 197  0013 2006          	jra	L701
 198  0015               L501:
 199                     ; 171     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 201  0015 1e01          	ldw	x,(OFST+1,sp)
 202  0017 a652          	ld	a,#82
 203  0019 e703          	ld	(3,x),a
 204  001b               L701:
 205                     ; 173   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 207  001b 1e01          	ldw	x,(OFST+1,sp)
 208  001d 6f04          	clr	(4,x)
 209                     ; 176   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 211  001f 1e01          	ldw	x,(OFST+1,sp)
 212  0021 6f06          	clr	(6,x)
 213                     ; 177   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 215  0023 1e01          	ldw	x,(OFST+1,sp)
 216  0025 6f07          	clr	(7,x)
 217                     ; 180   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 219  0027 1e01          	ldw	x,(OFST+1,sp)
 220  0029 6f01          	clr	(1,x)
 221                     ; 181 }
 224  002b 85            	popw	x
 225  002c 81            	ret
 465                     ; 218 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 465                     ; 219               uint32_t DMA_Memory0BaseAddr,
 465                     ; 220               uint16_t DMA_PeripheralMemory1BaseAddr,
 465                     ; 221               uint8_t DMA_BufferSize,
 465                     ; 222               DMA_DIR_TypeDef DMA_DIR,
 465                     ; 223               DMA_Mode_TypeDef DMA_Mode,
 465                     ; 224               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 465                     ; 225               DMA_Priority_TypeDef DMA_Priority,
 465                     ; 226               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 465                     ; 227 {
 466                     .text:	section	.text,new
 467  0000               _DMA_Init:
 469  0000 89            	pushw	x
 470       00000000      OFST:	set	0
 473                     ; 229   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 475                     ; 230   assert_param(IS_DMA_DIR(DMA_DIR));
 477                     ; 231   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 479                     ; 232   assert_param(IS_DMA_MODE(DMA_Mode));
 481                     ; 233   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 483                     ; 234   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 485                     ; 238   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 487  0001 f6            	ld	a,(x)
 488  0002 a4fe          	and	a,#254
 489  0004 f7            	ld	(x),a
 490                     ; 241   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 492  0005 7f            	clr	(x)
 493                     ; 244   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 493                     ; 245                                            (uint8_t)DMA_Mode) | \
 493                     ; 246                                            (uint8_t)DMA_MemoryIncMode);
 495  0006 7b0c          	ld	a,(OFST+12,sp)
 496  0008 1a0d          	or	a,(OFST+13,sp)
 497  000a 1a0e          	or	a,(OFST+14,sp)
 498  000c fa            	or	a,(x)
 499  000d f7            	ld	(x),a
 500                     ; 249   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 502  000e e601          	ld	a,(1,x)
 503  0010 a4c7          	and	a,#199
 504  0012 e701          	ld	(1,x),a
 505                     ; 252   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 505                     ; 253                                   (uint8_t)DMA_MemoryDataSize);
 507  0014 7b0f          	ld	a,(OFST+15,sp)
 508  0016 1a10          	or	a,(OFST+16,sp)
 509  0018 ea01          	or	a,(1,x)
 510  001a e701          	ld	(1,x),a
 511                     ; 257   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 513  001c 7b0b          	ld	a,(OFST+11,sp)
 514  001e 1e01          	ldw	x,(OFST+1,sp)
 515  0020 e702          	ld	(2,x),a
 516                     ; 262   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 518  0022 7b09          	ld	a,(OFST+9,sp)
 519  0024 1e01          	ldw	x,(OFST+1,sp)
 520  0026 e703          	ld	(3,x),a
 521                     ; 263   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 523  0028 7b0a          	ld	a,(OFST+10,sp)
 524  002a 1e01          	ldw	x,(OFST+1,sp)
 525  002c e704          	ld	(4,x),a
 526                     ; 267   if (DMA_Channelx == DMA1_Channel3)
 528  002e 1e01          	ldw	x,(OFST+1,sp)
 529  0030 a35093        	cpw	x,#20627
 530  0033 2606          	jrne	L142
 531                     ; 269     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 533  0035 7b06          	ld	a,(OFST+6,sp)
 534  0037 1e01          	ldw	x,(OFST+1,sp)
 535  0039 e705          	ld	(5,x),a
 536  003b               L142:
 537                     ; 271   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 539  003b 7b07          	ld	a,(OFST+7,sp)
 540  003d 1e01          	ldw	x,(OFST+1,sp)
 541  003f e706          	ld	(6,x),a
 542                     ; 272   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 544  0041 7b08          	ld	a,(OFST+8,sp)
 545  0043 1e01          	ldw	x,(OFST+1,sp)
 546  0045 e707          	ld	(7,x),a
 547                     ; 274 }
 550  0047 85            	popw	x
 551  0048 81            	ret
 606                     ; 282 void DMA_GlobalCmd(FunctionalState NewState)
 606                     ; 283 {
 607                     .text:	section	.text,new
 608  0000               _DMA_GlobalCmd:
 612                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 614                     ; 287   if (NewState != DISABLE)
 616  0000 4d            	tnz	a
 617  0001 2706          	jreq	L172
 618                     ; 290     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 620  0003 72105070      	bset	20592,#0
 622  0007 2004          	jra	L372
 623  0009               L172:
 624                     ; 295     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 626  0009 72115070      	bres	20592,#0
 627  000d               L372:
 628                     ; 297 }
 631  000d 81            	ret
 678                     ; 308 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 678                     ; 309 {
 679                     .text:	section	.text,new
 680  0000               _DMA_Cmd:
 682  0000 89            	pushw	x
 683       00000000      OFST:	set	0
 686                     ; 311   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 688                     ; 312   assert_param(IS_FUNCTIONAL_STATE(NewState));
 690                     ; 314   if (NewState != DISABLE)
 692  0001 0d05          	tnz	(OFST+5,sp)
 693  0003 2706          	jreq	L123
 694                     ; 317     DMA_Channelx->CCR |= DMA_CCR_CE;
 696  0005 f6            	ld	a,(x)
 697  0006 aa01          	or	a,#1
 698  0008 f7            	ld	(x),a
 700  0009 2006          	jra	L323
 701  000b               L123:
 702                     ; 322     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 704  000b 1e01          	ldw	x,(OFST+1,sp)
 705  000d f6            	ld	a,(x)
 706  000e a4fe          	and	a,#254
 707  0010 f7            	ld	(x),a
 708  0011               L323:
 709                     ; 324 }
 712  0011 85            	popw	x
 713  0012 81            	ret
 745                     ; 336 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 745                     ; 337 {
 746                     .text:	section	.text,new
 747  0000               _DMA_SetTimeOut:
 751                     ; 339   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 753                     ; 342   DMA1->GCSR = 0;
 755  0000 725f5070      	clr	20592
 756                     ; 343   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 758  0004 48            	sll	a
 759  0005 48            	sll	a
 760  0006 c75070        	ld	20592,a
 761                     ; 345 }
 764  0009 81            	ret
 809                     ; 395 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 809                     ; 396 {
 810                     .text:	section	.text,new
 811  0000               _DMA_SetCurrDataCounter:
 813  0000 89            	pushw	x
 814       00000000      OFST:	set	0
 817                     ; 398   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 819                     ; 401   DMA_Channelx->CNBTR = DataNumber;
 821  0001 7b05          	ld	a,(OFST+5,sp)
 822  0003 1e01          	ldw	x,(OFST+1,sp)
 823  0005 e702          	ld	(2,x),a
 824                     ; 402 }
 827  0007 85            	popw	x
 828  0008 81            	ret
 866                     ; 409 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 866                     ; 410 {
 867                     .text:	section	.text,new
 868  0000               _DMA_GetCurrDataCounter:
 872                     ; 412   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 874                     ; 415   return ((uint8_t)(DMA_Channelx->CNBTR));
 876  0000 e602          	ld	a,(2,x)
 879  0002 81            	ret
 956                     ; 476 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 956                     ; 477                   DMA_ITx_TypeDef DMA_ITx,
 956                     ; 478                   FunctionalState NewState)
 956                     ; 479 {
 957                     .text:	section	.text,new
 958  0000               _DMA_ITConfig:
 960  0000 89            	pushw	x
 961       00000000      OFST:	set	0
 964                     ; 481   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 966                     ; 482   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 968                     ; 483   assert_param(IS_FUNCTIONAL_STATE(NewState));
 970                     ; 485   if (NewState != DISABLE)
 972  0001 0d06          	tnz	(OFST+6,sp)
 973  0003 2706          	jreq	L344
 974                     ; 488     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 976  0005 f6            	ld	a,(x)
 977  0006 1a05          	or	a,(OFST+5,sp)
 978  0008 f7            	ld	(x),a
 980  0009 2007          	jra	L544
 981  000b               L344:
 982                     ; 493     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 984  000b 1e01          	ldw	x,(OFST+1,sp)
 985  000d 7b05          	ld	a,(OFST+5,sp)
 986  000f 43            	cpl	a
 987  0010 f4            	and	a,(x)
 988  0011 f7            	ld	(x),a
 989  0012               L544:
 990                     ; 495 }
 993  0012 85            	popw	x
 994  0013 81            	ret
1239                     ; 524 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1239                     ; 525 {
1240                     .text:	section	.text,new
1241  0000               _DMA_GetFlagStatus:
1243  0000 89            	pushw	x
1244  0001 5204          	subw	sp,#4
1245       00000004      OFST:	set	4
1248                     ; 526   FlagStatus flagstatus = RESET;
1250  0003 7b04          	ld	a,(OFST+0,sp)
1251  0005 97            	ld	xl,a
1252                     ; 527   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1254  0006 1e02          	ldw	x,(OFST-2,sp)
1255                     ; 528   uint8_t tmpgir1 = 0;
1257  0008 7b01          	ld	a,(OFST-3,sp)
1258  000a 97            	ld	xl,a
1259                     ; 529   uint8_t tmpgcsr = 0;
1261  000b 7b04          	ld	a,(OFST+0,sp)
1262  000d 97            	ld	xl,a
1263                     ; 532   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1265                     ; 535   tmpgcsr = DMA1->GCSR;
1267  000e c65070        	ld	a,20592
1268  0011 6b04          	ld	(OFST+0,sp),a
1269                     ; 536   tmpgir1 = DMA1->GIR1;
1271  0013 c65071        	ld	a,20593
1272  0016 6b01          	ld	(OFST-3,sp),a
1273                     ; 538   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1275  0018 7b05          	ld	a,(OFST+1,sp)
1276  001a a50f          	bcp	a,#15
1277  001c 2736          	jreq	L175
1278                     ; 541     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1280  001e 7b05          	ld	a,(OFST+1,sp)
1281  0020 a501          	bcp	a,#1
1282  0022 2707          	jreq	L375
1283                     ; 543       DMA_Channelx = DMA1_Channel0;
1285  0024 ae5075        	ldw	x,#20597
1286  0027 1f02          	ldw	(OFST-2,sp),x
1288  0029 201f          	jra	L575
1289  002b               L375:
1290                     ; 545     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1292  002b 7b05          	ld	a,(OFST+1,sp)
1293  002d a502          	bcp	a,#2
1294  002f 2707          	jreq	L775
1295                     ; 547       DMA_Channelx = DMA1_Channel1;
1297  0031 ae507f        	ldw	x,#20607
1298  0034 1f02          	ldw	(OFST-2,sp),x
1300  0036 2012          	jra	L575
1301  0038               L775:
1302                     ; 549     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1304  0038 7b05          	ld	a,(OFST+1,sp)
1305  003a a504          	bcp	a,#4
1306  003c 2707          	jreq	L306
1307                     ; 551       DMA_Channelx = DMA1_Channel2;
1309  003e ae5089        	ldw	x,#20617
1310  0041 1f02          	ldw	(OFST-2,sp),x
1312  0043 2005          	jra	L575
1313  0045               L306:
1314                     ; 555       DMA_Channelx = DMA1_Channel3;
1316  0045 ae5093        	ldw	x,#20627
1317  0048 1f02          	ldw	(OFST-2,sp),x
1318  004a               L575:
1319                     ; 559     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1321  004a 1e02          	ldw	x,(OFST-2,sp)
1322  004c e601          	ld	a,(1,x)
1323  004e 1406          	and	a,(OFST+2,sp)
1324  0050 6b04          	ld	(OFST+0,sp),a
1326  0052 2014          	jra	L706
1327  0054               L175:
1328                     ; 561   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1330  0054 7b05          	ld	a,(OFST+1,sp)
1331  0056 a510          	bcp	a,#16
1332  0058 2708          	jreq	L116
1333                     ; 564     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1335  005a 7b06          	ld	a,(OFST+2,sp)
1336  005c 1401          	and	a,(OFST-3,sp)
1337  005e 6b04          	ld	(OFST+0,sp),a
1339  0060 2006          	jra	L706
1340  0062               L116:
1341                     ; 569     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1343  0062 7b04          	ld	a,(OFST+0,sp)
1344  0064 a402          	and	a,#2
1345  0066 6b04          	ld	(OFST+0,sp),a
1346  0068               L706:
1347                     ; 573   return (flagstatus);
1349  0068 7b04          	ld	a,(OFST+0,sp)
1352  006a 5b06          	addw	sp,#6
1353  006c 81            	ret
1400                     ; 591 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1400                     ; 592 {
1401                     .text:	section	.text,new
1402  0000               _DMA_ClearFlag:
1404  0000 89            	pushw	x
1405  0001 89            	pushw	x
1406       00000002      OFST:	set	2
1409                     ; 593   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1411  0002 ae5075        	ldw	x,#20597
1412  0005 1f01          	ldw	(OFST-1,sp),x
1413                     ; 596   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1415                     ; 599   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1417  0007 7b03          	ld	a,(OFST+1,sp)
1418  0009 a501          	bcp	a,#1
1419  000b 2707          	jreq	L146
1420                     ; 601     DMA_Channelx = DMA1_Channel0;
1422  000d ae5075        	ldw	x,#20597
1423  0010 1f01          	ldw	(OFST-1,sp),x
1425  0012 201f          	jra	L346
1426  0014               L146:
1427                     ; 605     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1429  0014 7b03          	ld	a,(OFST+1,sp)
1430  0016 a502          	bcp	a,#2
1431  0018 2707          	jreq	L546
1432                     ; 607       DMA_Channelx = DMA1_Channel1;
1434  001a ae507f        	ldw	x,#20607
1435  001d 1f01          	ldw	(OFST-1,sp),x
1437  001f 2012          	jra	L346
1438  0021               L546:
1439                     ; 611       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1441  0021 7b03          	ld	a,(OFST+1,sp)
1442  0023 a504          	bcp	a,#4
1443  0025 2707          	jreq	L156
1444                     ; 613         DMA_Channelx = DMA1_Channel2;
1446  0027 ae5089        	ldw	x,#20617
1447  002a 1f01          	ldw	(OFST-1,sp),x
1449  002c 2005          	jra	L346
1450  002e               L156:
1451                     ; 617         DMA_Channelx = DMA1_Channel3;
1453  002e ae5093        	ldw	x,#20627
1454  0031 1f01          	ldw	(OFST-1,sp),x
1455  0033               L346:
1456                     ; 623   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1458  0033 1e01          	ldw	x,(OFST-1,sp)
1459  0035 7b04          	ld	a,(OFST+2,sp)
1460  0037 a406          	and	a,#6
1461  0039 43            	cpl	a
1462  003a e401          	and	a,(1,x)
1463  003c e701          	ld	(1,x),a
1464                     ; 624 }
1467  003e 5b04          	addw	sp,#4
1468  0040 81            	ret
1602                     ; 640 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1602                     ; 641 {
1603                     .text:	section	.text,new
1604  0000               _DMA_GetITStatus:
1606  0000 88            	push	a
1607  0001 5204          	subw	sp,#4
1608       00000004      OFST:	set	4
1611                     ; 642   ITStatus itstatus = RESET;
1613  0003 7b02          	ld	a,(OFST-2,sp)
1614  0005 97            	ld	xl,a
1615                     ; 643   uint8_t tmpreg = 0;
1617  0006 7b01          	ld	a,(OFST-3,sp)
1618  0008 97            	ld	xl,a
1619                     ; 644   uint8_t tmp2 = 0;
1621  0009 7b02          	ld	a,(OFST-2,sp)
1622  000b 97            	ld	xl,a
1623                     ; 645   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1625  000c 1e03          	ldw	x,(OFST-1,sp)
1626                     ; 648   assert_param(IS_DMA_GET_IT(DMA_IT));
1628                     ; 651   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1630  000e 7b05          	ld	a,(OFST+1,sp)
1631  0010 a510          	bcp	a,#16
1632  0012 2707          	jreq	L537
1633                     ; 653     DMA_Channelx = DMA1_Channel0;
1635  0014 ae5075        	ldw	x,#20597
1636  0017 1f03          	ldw	(OFST-1,sp),x
1638  0019 201f          	jra	L737
1639  001b               L537:
1640                     ; 657     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1642  001b 7b05          	ld	a,(OFST+1,sp)
1643  001d a520          	bcp	a,#32
1644  001f 2707          	jreq	L147
1645                     ; 659       DMA_Channelx = DMA1_Channel1;
1647  0021 ae507f        	ldw	x,#20607
1648  0024 1f03          	ldw	(OFST-1,sp),x
1650  0026 2012          	jra	L737
1651  0028               L147:
1652                     ; 663       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1654  0028 7b05          	ld	a,(OFST+1,sp)
1655  002a a540          	bcp	a,#64
1656  002c 2707          	jreq	L547
1657                     ; 665         DMA_Channelx = DMA1_Channel2;
1659  002e ae5089        	ldw	x,#20617
1660  0031 1f03          	ldw	(OFST-1,sp),x
1662  0033 2005          	jra	L737
1663  0035               L547:
1664                     ; 669         DMA_Channelx = DMA1_Channel3;
1666  0035 ae5093        	ldw	x,#20627
1667  0038 1f03          	ldw	(OFST-1,sp),x
1668  003a               L737:
1669                     ; 674   tmpreg =  DMA_Channelx->CSPR ;
1671  003a 1e03          	ldw	x,(OFST-1,sp)
1672  003c e601          	ld	a,(1,x)
1673  003e 6b01          	ld	(OFST-3,sp),a
1674                     ; 675   tmpreg &= DMA_Channelx->CCR ;
1676  0040 1e03          	ldw	x,(OFST-1,sp)
1677  0042 7b01          	ld	a,(OFST-3,sp)
1678  0044 f4            	and	a,(x)
1679  0045 6b01          	ld	(OFST-3,sp),a
1680                     ; 676   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1682  0047 7b05          	ld	a,(OFST+1,sp)
1683  0049 a406          	and	a,#6
1684  004b 6b02          	ld	(OFST-2,sp),a
1685                     ; 677   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1687  004d 7b01          	ld	a,(OFST-3,sp)
1688  004f 1402          	and	a,(OFST-2,sp)
1689  0051 6b02          	ld	(OFST-2,sp),a
1690                     ; 680   return (itstatus);
1692  0053 7b02          	ld	a,(OFST-2,sp)
1695  0055 5b05          	addw	sp,#5
1696  0057 81            	ret
1744                     ; 698 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1744                     ; 699 {
1745                     .text:	section	.text,new
1746  0000               _DMA_ClearITPendingBit:
1748  0000 88            	push	a
1749  0001 89            	pushw	x
1750       00000002      OFST:	set	2
1753                     ; 700   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1755  0002 ae5075        	ldw	x,#20597
1756  0005 1f01          	ldw	(OFST-1,sp),x
1757                     ; 703   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1759                     ; 705   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1761  0007 a510          	bcp	a,#16
1762  0009 2707          	jreq	L577
1763                     ; 707     DMA_Channelx = DMA1_Channel0;
1765  000b ae5075        	ldw	x,#20597
1766  000e 1f01          	ldw	(OFST-1,sp),x
1768  0010 201f          	jra	L777
1769  0012               L577:
1770                     ; 711     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1772  0012 7b03          	ld	a,(OFST+1,sp)
1773  0014 a520          	bcp	a,#32
1774  0016 2707          	jreq	L1001
1775                     ; 713       DMA_Channelx = DMA1_Channel1;
1777  0018 ae507f        	ldw	x,#20607
1778  001b 1f01          	ldw	(OFST-1,sp),x
1780  001d 2012          	jra	L777
1781  001f               L1001:
1782                     ; 717       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1784  001f 7b03          	ld	a,(OFST+1,sp)
1785  0021 a540          	bcp	a,#64
1786  0023 2707          	jreq	L5001
1787                     ; 719         DMA_Channelx = DMA1_Channel2;
1789  0025 ae5089        	ldw	x,#20617
1790  0028 1f01          	ldw	(OFST-1,sp),x
1792  002a 2005          	jra	L777
1793  002c               L5001:
1794                     ; 723         DMA_Channelx = DMA1_Channel3;
1796  002c ae5093        	ldw	x,#20627
1797  002f 1f01          	ldw	(OFST-1,sp),x
1798  0031               L777:
1799                     ; 728   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1801  0031 1e01          	ldw	x,(OFST-1,sp)
1802  0033 7b03          	ld	a,(OFST+1,sp)
1803  0035 a406          	and	a,#6
1804  0037 43            	cpl	a
1805  0038 e401          	and	a,(1,x)
1806  003a e701          	ld	(1,x),a
1807                     ; 729 }
1810  003c 5b03          	addw	sp,#3
1811  003e 81            	ret
1824                     	xdef	_DMA_ClearITPendingBit
1825                     	xdef	_DMA_GetITStatus
1826                     	xdef	_DMA_ClearFlag
1827                     	xdef	_DMA_GetFlagStatus
1828                     	xdef	_DMA_ITConfig
1829                     	xdef	_DMA_GetCurrDataCounter
1830                     	xdef	_DMA_SetCurrDataCounter
1831                     	xdef	_DMA_SetTimeOut
1832                     	xdef	_DMA_Cmd
1833                     	xdef	_DMA_GlobalCmd
1834                     	xdef	_DMA_Init
1835                     	xdef	_DMA_DeInit
1836                     	xdef	_DMA_GlobalDeInit
1855                     	end
