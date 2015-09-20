   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 125                     ; 122 void SPI_DeInit(SPI_TypeDef* SPIx)
 125                     ; 123 {
 127                     .text:	section	.text,new
 128  0000               _SPI_DeInit:
 132                     ; 124   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 134  0000 7f            	clr	(x)
 135                     ; 125   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 137  0001 6f01          	clr	(1,x)
 138                     ; 126   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 140  0003 6f02          	clr	(2,x)
 141                     ; 127   SPIx->SR     = SPI_SR_RESET_VALUE;
 143  0005 a602          	ld	a,#2
 144  0007 e703          	ld	(3,x),a
 145                     ; 128   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 147  0009 a607          	ld	a,#7
 148  000b e705          	ld	(5,x),a
 149                     ; 129 }
 152  000d 81            	ret
 476                     ; 171 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 476                     ; 172               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 476                     ; 173               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 476                     ; 174               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 476                     ; 175               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 476                     ; 176 {
 477                     .text:	section	.text,new
 478  0000               _SPI_Init:
 480  0000 89            	pushw	x
 481  0001 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 178   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 487                     ; 179   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 489                     ; 180   assert_param(IS_SPI_MODE(SPI_Mode));
 491                     ; 181   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 493                     ; 182   assert_param(IS_SPI_PHASE(SPI_CPHA));
 495                     ; 183   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 497                     ; 184   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 499                     ; 185   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 501                     ; 188   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 501                     ; 189                                   (uint8_t)SPI_BaudRatePrescaler) |
 501                     ; 190                         (uint8_t)((uint8_t)SPI_CPOL |
 501                     ; 191                                   SPI_CPHA));
 503  0002 7b09          	ld	a,(OFST+8,sp)
 504  0004 1a0a          	or	a,(OFST+9,sp)
 505  0006 6b01          	ld	(OFST+0,sp),a
 506  0008 7b06          	ld	a,(OFST+5,sp)
 507  000a 1a07          	or	a,(OFST+6,sp)
 508  000c 1a01          	or	a,(OFST+0,sp)
 509  000e 1e02          	ldw	x,(OFST+1,sp)
 510  0010 f7            	ld	(x),a
 511                     ; 194   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 513  0011 7b0b          	ld	a,(OFST+10,sp)
 514  0013 1a0c          	or	a,(OFST+11,sp)
 515  0015 1e02          	ldw	x,(OFST+1,sp)
 516  0017 e701          	ld	(1,x),a
 517                     ; 196   if (SPI_Mode == SPI_Mode_Master)
 519  0019 7b08          	ld	a,(OFST+7,sp)
 520  001b a104          	cp	a,#4
 521  001d 260a          	jrne	L362
 522                     ; 198     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 524  001f 1e02          	ldw	x,(OFST+1,sp)
 525  0021 e601          	ld	a,(1,x)
 526  0023 aa01          	or	a,#1
 527  0025 e701          	ld	(1,x),a
 529  0027 2008          	jra	L562
 530  0029               L362:
 531                     ; 202     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 533  0029 1e02          	ldw	x,(OFST+1,sp)
 534  002b e601          	ld	a,(1,x)
 535  002d a4fe          	and	a,#254
 536  002f e701          	ld	(1,x),a
 537  0031               L562:
 538                     ; 206   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 540  0031 1e02          	ldw	x,(OFST+1,sp)
 541  0033 f6            	ld	a,(x)
 542  0034 1a08          	or	a,(OFST+7,sp)
 543  0036 f7            	ld	(x),a
 544                     ; 209   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 546  0037 7b0d          	ld	a,(OFST+12,sp)
 547  0039 1e02          	ldw	x,(OFST+1,sp)
 548  003b e705          	ld	(5,x),a
 549                     ; 210 }
 552  003d 5b03          	addw	sp,#3
 553  003f 81            	ret
 620                     ; 219 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 620                     ; 220 {
 621                     .text:	section	.text,new
 622  0000               _SPI_Cmd:
 624  0000 89            	pushw	x
 625       00000000      OFST:	set	0
 628                     ; 222   assert_param(IS_FUNCTIONAL_STATE(NewState));
 630                     ; 224   if (NewState != DISABLE)
 632  0001 0d05          	tnz	(OFST+5,sp)
 633  0003 2706          	jreq	L323
 634                     ; 226     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 636  0005 f6            	ld	a,(x)
 637  0006 aa40          	or	a,#64
 638  0008 f7            	ld	(x),a
 640  0009 2006          	jra	L523
 641  000b               L323:
 642                     ; 230     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 644  000b 1e01          	ldw	x,(OFST+1,sp)
 645  000d f6            	ld	a,(x)
 646  000e a4bf          	and	a,#191
 647  0010 f7            	ld	(x),a
 648  0011               L523:
 649                     ; 232 }
 652  0011 85            	popw	x
 653  0012 81            	ret
 701                     ; 241 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 701                     ; 242 {
 702                     .text:	section	.text,new
 703  0000               _SPI_NSSInternalSoftwareCmd:
 705  0000 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 244   assert_param(IS_FUNCTIONAL_STATE(NewState));
 711                     ; 246   if (NewState != DISABLE)
 713  0001 0d05          	tnz	(OFST+5,sp)
 714  0003 2708          	jreq	L353
 715                     ; 248     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 717  0005 e601          	ld	a,(1,x)
 718  0007 aa01          	or	a,#1
 719  0009 e701          	ld	(1,x),a
 721  000b 2008          	jra	L553
 722  000d               L353:
 723                     ; 252     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 725  000d 1e01          	ldw	x,(OFST+1,sp)
 726  000f e601          	ld	a,(1,x)
 727  0011 a4fe          	and	a,#254
 728  0013 e701          	ld	(1,x),a
 729  0015               L553:
 730                     ; 254 }
 733  0015 85            	popw	x
 734  0016 81            	ret
 802                     ; 265 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 802                     ; 266 {
 803                     .text:	section	.text,new
 804  0000               _SPI_BiDirectionalLineConfig:
 806  0000 89            	pushw	x
 807       00000000      OFST:	set	0
 810                     ; 268   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 812                     ; 270   if (SPI_Direction != SPI_Direction_Rx)
 814  0001 0d05          	tnz	(OFST+5,sp)
 815  0003 2708          	jreq	L314
 816                     ; 272     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 818  0005 e601          	ld	a,(1,x)
 819  0007 aa40          	or	a,#64
 820  0009 e701          	ld	(1,x),a
 822  000b 2008          	jra	L514
 823  000d               L314:
 824                     ; 276     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 826  000d 1e01          	ldw	x,(OFST+1,sp)
 827  000f e601          	ld	a,(1,x)
 828  0011 a4bf          	and	a,#191
 829  0013 e701          	ld	(1,x),a
 830  0015               L514:
 831                     ; 278 }
 834  0015 85            	popw	x
 835  0016 81            	ret
 879                     ; 313 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 879                     ; 314 {
 880                     .text:	section	.text,new
 881  0000               _SPI_SendData:
 883  0000 89            	pushw	x
 884       00000000      OFST:	set	0
 887                     ; 315   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 889  0001 7b05          	ld	a,(OFST+5,sp)
 890  0003 1e01          	ldw	x,(OFST+1,sp)
 891  0005 e704          	ld	(4,x),a
 892                     ; 316 }
 895  0007 85            	popw	x
 896  0008 81            	ret
 933                     ; 323 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 933                     ; 324 {
 934                     .text:	section	.text,new
 935  0000               _SPI_ReceiveData:
 939                     ; 325   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 941  0000 e604          	ld	a,(4,x)
 944  0002 81            	ret
 981                     ; 408 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 981                     ; 409 {
 982                     .text:	section	.text,new
 983  0000               _SPI_TransmitCRC:
 987                     ; 410   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 989  0000 e601          	ld	a,(1,x)
 990  0002 aa10          	or	a,#16
 991  0004 e701          	ld	(1,x),a
 992                     ; 411 }
 995  0006 81            	ret
1044                     ; 420 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1044                     ; 421 {
1045                     .text:	section	.text,new
1046  0000               _SPI_CalculateCRCCmd:
1048  0000 89            	pushw	x
1049       00000000      OFST:	set	0
1052                     ; 423   assert_param(IS_FUNCTIONAL_STATE(NewState));
1054                     ; 426   SPI_Cmd(SPI1, DISABLE);
1056  0001 4b00          	push	#0
1057  0003 ae5200        	ldw	x,#20992
1058  0006 cd0000        	call	_SPI_Cmd
1060  0009 84            	pop	a
1061                     ; 428   if (NewState != DISABLE)
1063  000a 0d05          	tnz	(OFST+5,sp)
1064  000c 270a          	jreq	L525
1065                     ; 430     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1067  000e 1e01          	ldw	x,(OFST+1,sp)
1068  0010 e601          	ld	a,(1,x)
1069  0012 aa20          	or	a,#32
1070  0014 e701          	ld	(1,x),a
1072  0016 2008          	jra	L725
1073  0018               L525:
1074                     ; 434     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1076  0018 1e01          	ldw	x,(OFST+1,sp)
1077  001a e601          	ld	a,(1,x)
1078  001c a4df          	and	a,#223
1079  001e e701          	ld	(1,x),a
1080  0020               L725:
1081                     ; 436 }
1084  0020 85            	popw	x
1085  0021 81            	ret
1159                     ; 447 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1159                     ; 448 {
1160                     .text:	section	.text,new
1161  0000               _SPI_GetCRC:
1163  0000 89            	pushw	x
1164  0001 88            	push	a
1165       00000001      OFST:	set	1
1168                     ; 449   uint8_t crcreg = 0;
1170  0002 0f01          	clr	(OFST+0,sp)
1171                     ; 452   assert_param(IS_SPI_CRC(SPI_CRC));
1173                     ; 454   if (SPI_CRC != SPI_CRC_RX)
1175  0004 0d06          	tnz	(OFST+5,sp)
1176  0006 2706          	jreq	L765
1177                     ; 456     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1179  0008 e607          	ld	a,(7,x)
1180  000a 6b01          	ld	(OFST+0,sp),a
1182  000c 2006          	jra	L175
1183  000e               L765:
1184                     ; 460     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1186  000e 1e02          	ldw	x,(OFST+1,sp)
1187  0010 e606          	ld	a,(6,x)
1188  0012 6b01          	ld	(OFST+0,sp),a
1189  0014               L175:
1190                     ; 464   return crcreg;
1192  0014 7b01          	ld	a,(OFST+0,sp)
1195  0016 5b03          	addw	sp,#3
1196  0018 81            	ret
1235                     ; 472 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1235                     ; 473 {
1236                     .text:	section	.text,new
1237  0000               _SPI_ResetCRC:
1239  0000 89            	pushw	x
1240       00000000      OFST:	set	0
1243                     ; 476   SPI_CalculateCRCCmd(SPIx, ENABLE);
1245  0001 4b01          	push	#1
1246  0003 cd0000        	call	_SPI_CalculateCRCCmd
1248  0006 84            	pop	a
1249                     ; 479   SPI_Cmd(SPIx, ENABLE);
1251  0007 4b01          	push	#1
1252  0009 1e02          	ldw	x,(OFST+2,sp)
1253  000b cd0000        	call	_SPI_Cmd
1255  000e 84            	pop	a
1256                     ; 480 }
1259  000f 85            	popw	x
1260  0010 81            	ret
1298                     ; 487 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1298                     ; 488 {
1299                     .text:	section	.text,new
1300  0000               _SPI_GetCRCPolynomial:
1304                     ; 489   return SPIx->CRCPR; /* Return the CRC polynomial register */
1306  0000 e605          	ld	a,(5,x)
1309  0002 81            	ret
1386                     ; 519 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1386                     ; 520 {
1387                     .text:	section	.text,new
1388  0000               _SPI_DMACmd:
1390  0000 89            	pushw	x
1391       00000000      OFST:	set	0
1394                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1396                     ; 523   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1398                     ; 525   if (NewState != DISABLE)
1400  0001 0d06          	tnz	(OFST+6,sp)
1401  0003 2708          	jreq	L376
1402                     ; 528     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1404  0005 e602          	ld	a,(2,x)
1405  0007 1a05          	or	a,(OFST+5,sp)
1406  0009 e702          	ld	(2,x),a
1408  000b 2009          	jra	L576
1409  000d               L376:
1410                     ; 533     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1412  000d 1e01          	ldw	x,(OFST+1,sp)
1413  000f 7b05          	ld	a,(OFST+5,sp)
1414  0011 43            	cpl	a
1415  0012 e402          	and	a,(2,x)
1416  0014 e702          	ld	(2,x),a
1417  0016               L576:
1418                     ; 535 }
1421  0016 85            	popw	x
1422  0017 81            	ret
1541                     ; 620 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1541                     ; 621 {
1542                     .text:	section	.text,new
1543  0000               _SPI_ITConfig:
1545  0000 89            	pushw	x
1546  0001 88            	push	a
1547       00000001      OFST:	set	1
1550                     ; 622   uint8_t itpos = 0;
1552  0002 0f01          	clr	(OFST+0,sp)
1553                     ; 624   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1555                     ; 625   assert_param(IS_FUNCTIONAL_STATE(NewState));
1557                     ; 628   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1559  0004 7b06          	ld	a,(OFST+5,sp)
1560  0006 a40f          	and	a,#15
1561  0008 5f            	clrw	x
1562  0009 97            	ld	xl,a
1563  000a a601          	ld	a,#1
1564  000c 5d            	tnzw	x
1565  000d 2704          	jreq	L04
1566  000f               L24:
1567  000f 48            	sll	a
1568  0010 5a            	decw	x
1569  0011 26fc          	jrne	L24
1570  0013               L04:
1571  0013 6b01          	ld	(OFST+0,sp),a
1572                     ; 630   if (NewState != DISABLE)
1574  0015 0d07          	tnz	(OFST+6,sp)
1575  0017 270a          	jreq	L357
1576                     ; 632     SPIx->CR3 |= itpos; /* Enable interrupt*/
1578  0019 1e02          	ldw	x,(OFST+1,sp)
1579  001b e602          	ld	a,(2,x)
1580  001d 1a01          	or	a,(OFST+0,sp)
1581  001f e702          	ld	(2,x),a
1583  0021 2009          	jra	L557
1584  0023               L357:
1585                     ; 636     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1587  0023 1e02          	ldw	x,(OFST+1,sp)
1588  0025 7b01          	ld	a,(OFST+0,sp)
1589  0027 43            	cpl	a
1590  0028 e402          	and	a,(2,x)
1591  002a e702          	ld	(2,x),a
1592  002c               L557:
1593                     ; 638 }
1596  002c 5b03          	addw	sp,#3
1597  002e 81            	ret
1730                     ; 655 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1730                     ; 656 {
1731                     .text:	section	.text,new
1732  0000               _SPI_GetFlagStatus:
1734  0000 89            	pushw	x
1735  0001 88            	push	a
1736       00000001      OFST:	set	1
1739                     ; 657   FlagStatus status = RESET;
1741  0002 0f01          	clr	(OFST+0,sp)
1742                     ; 659   assert_param(IS_SPI_FLAG(SPI_FLAG));
1744                     ; 662   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1746  0004 e603          	ld	a,(3,x)
1747  0006 1506          	bcp	a,(OFST+5,sp)
1748  0008 2706          	jreq	L1401
1749                     ; 664     status = SET; /* SPI_FLAG is set */
1751  000a a601          	ld	a,#1
1752  000c 6b01          	ld	(OFST+0,sp),a
1754  000e 2002          	jra	L3401
1755  0010               L1401:
1756                     ; 668     status = RESET; /* SPI_FLAG is reset*/
1758  0010 0f01          	clr	(OFST+0,sp)
1759  0012               L3401:
1760                     ; 672   return status;
1762  0012 7b01          	ld	a,(OFST+0,sp)
1765  0014 5b03          	addw	sp,#3
1766  0016 81            	ret
1813                     ; 690 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1813                     ; 691 {
1814                     .text:	section	.text,new
1815  0000               _SPI_ClearFlag:
1817  0000 89            	pushw	x
1818       00000000      OFST:	set	0
1821                     ; 692   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1823                     ; 694   SPIx->SR = (uint8_t)(~SPI_FLAG);
1825  0001 7b05          	ld	a,(OFST+5,sp)
1826  0003 43            	cpl	a
1827  0004 1e01          	ldw	x,(OFST+1,sp)
1828  0006 e703          	ld	(3,x),a
1829                     ; 695 }
1832  0008 85            	popw	x
1833  0009 81            	ret
1921                     ; 711 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1921                     ; 712 {
1922                     .text:	section	.text,new
1923  0000               _SPI_GetITStatus:
1925  0000 89            	pushw	x
1926  0001 5203          	subw	sp,#3
1927       00000003      OFST:	set	3
1930                     ; 713   ITStatus pendingbitstatus = RESET;
1932  0003 7b03          	ld	a,(OFST+0,sp)
1933  0005 97            	ld	xl,a
1934                     ; 714   uint8_t itpos = 0;
1936  0006 7b01          	ld	a,(OFST-2,sp)
1937  0008 97            	ld	xl,a
1938                     ; 715   uint8_t itmask1 = 0;
1940  0009 7b03          	ld	a,(OFST+0,sp)
1941  000b 97            	ld	xl,a
1942                     ; 716   uint8_t itmask2 = 0;
1944  000c 7b03          	ld	a,(OFST+0,sp)
1945  000e 97            	ld	xl,a
1946                     ; 717   __IO uint8_t enablestatus = 0;
1948  000f 0f02          	clr	(OFST-1,sp)
1949                     ; 718   assert_param(IS_SPI_GET_IT(SPI_IT));
1951                     ; 720   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1953  0011 7b08          	ld	a,(OFST+5,sp)
1954  0013 a40f          	and	a,#15
1955  0015 5f            	clrw	x
1956  0016 97            	ld	xl,a
1957  0017 a601          	ld	a,#1
1958  0019 5d            	tnzw	x
1959  001a 2704          	jreq	L25
1960  001c               L45:
1961  001c 48            	sll	a
1962  001d 5a            	decw	x
1963  001e 26fc          	jrne	L45
1964  0020               L25:
1965  0020 6b01          	ld	(OFST-2,sp),a
1966                     ; 723   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1968  0022 7b08          	ld	a,(OFST+5,sp)
1969  0024 4e            	swap	a
1970  0025 a40f          	and	a,#15
1971  0027 6b03          	ld	(OFST+0,sp),a
1972                     ; 725   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1974  0029 7b03          	ld	a,(OFST+0,sp)
1975  002b 5f            	clrw	x
1976  002c 97            	ld	xl,a
1977  002d a601          	ld	a,#1
1978  002f 5d            	tnzw	x
1979  0030 2704          	jreq	L65
1980  0032               L06:
1981  0032 48            	sll	a
1982  0033 5a            	decw	x
1983  0034 26fc          	jrne	L06
1984  0036               L65:
1985  0036 6b03          	ld	(OFST+0,sp),a
1986                     ; 727   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1988  0038 1e04          	ldw	x,(OFST+1,sp)
1989  003a e603          	ld	a,(3,x)
1990  003c 1403          	and	a,(OFST+0,sp)
1991  003e 6b02          	ld	(OFST-1,sp),a
1992                     ; 729   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1994  0040 1e04          	ldw	x,(OFST+1,sp)
1995  0042 e602          	ld	a,(2,x)
1996  0044 1501          	bcp	a,(OFST-2,sp)
1997  0046 270a          	jreq	L3311
1999  0048 0d02          	tnz	(OFST-1,sp)
2000  004a 2706          	jreq	L3311
2001                     ; 732     pendingbitstatus = SET;
2003  004c a601          	ld	a,#1
2004  004e 6b03          	ld	(OFST+0,sp),a
2006  0050 2002          	jra	L5311
2007  0052               L3311:
2008                     ; 737     pendingbitstatus = RESET;
2010  0052 0f03          	clr	(OFST+0,sp)
2011  0054               L5311:
2012                     ; 740   return  pendingbitstatus;
2014  0054 7b03          	ld	a,(OFST+0,sp)
2017  0056 5b05          	addw	sp,#5
2018  0058 81            	ret
2073                     ; 758 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2073                     ; 759 {
2074                     .text:	section	.text,new
2075  0000               _SPI_ClearITPendingBit:
2077  0000 89            	pushw	x
2078  0001 88            	push	a
2079       00000001      OFST:	set	1
2082                     ; 760   uint8_t itpos = 0;
2084  0002 0f01          	clr	(OFST+0,sp)
2085                     ; 761   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2087                     ; 766   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2089  0004 7b06          	ld	a,(OFST+5,sp)
2090  0006 a4f0          	and	a,#240
2091  0008 4e            	swap	a
2092  0009 a40f          	and	a,#15
2093  000b 5f            	clrw	x
2094  000c 97            	ld	xl,a
2095  000d a601          	ld	a,#1
2096  000f 5d            	tnzw	x
2097  0010 2704          	jreq	L46
2098  0012               L66:
2099  0012 48            	sll	a
2100  0013 5a            	decw	x
2101  0014 26fc          	jrne	L66
2102  0016               L46:
2103  0016 6b01          	ld	(OFST+0,sp),a
2104                     ; 768   SPIx->SR = (uint8_t)(~itpos);
2106  0018 7b01          	ld	a,(OFST+0,sp)
2107  001a 43            	cpl	a
2108  001b 1e02          	ldw	x,(OFST+1,sp)
2109  001d e703          	ld	(3,x),a
2110                     ; 770 }
2113  001f 5b03          	addw	sp,#3
2114  0021 81            	ret
2127                     	xdef	_SPI_ClearITPendingBit
2128                     	xdef	_SPI_GetITStatus
2129                     	xdef	_SPI_ClearFlag
2130                     	xdef	_SPI_GetFlagStatus
2131                     	xdef	_SPI_ITConfig
2132                     	xdef	_SPI_DMACmd
2133                     	xdef	_SPI_GetCRCPolynomial
2134                     	xdef	_SPI_ResetCRC
2135                     	xdef	_SPI_GetCRC
2136                     	xdef	_SPI_CalculateCRCCmd
2137                     	xdef	_SPI_TransmitCRC
2138                     	xdef	_SPI_ReceiveData
2139                     	xdef	_SPI_SendData
2140                     	xdef	_SPI_BiDirectionalLineConfig
2141                     	xdef	_SPI_NSSInternalSoftwareCmd
2142                     	xdef	_SPI_Cmd
2143                     	xdef	_SPI_Init
2144                     	xdef	_SPI_DeInit
2163                     	end
