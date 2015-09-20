   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  67                     ; 168 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  67                     ; 169 {
  69                     	switch	.text
  70  0000               _FLASH_SetProgrammingTime:
  74                     ; 171   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  76                     ; 173   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  78  0000 72115050      	bres	20560,#0
  79                     ; 174   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  81  0004 ca5050        	or	a,20560
  82  0007 c75050        	ld	20560,a
  83                     ; 175 }
  86  000a 81            	ret
 111                     ; 182 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 111                     ; 183 {
 112                     	switch	.text
 113  000b               _FLASH_GetProgrammingTime:
 117                     ; 184   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 119  000b c65050        	ld	a,20560
 120  000e a401          	and	a,#1
 123  0010 81            	ret
 179                     ; 197 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 179                     ; 198 {
 180                     	switch	.text
 181  0011               _FLASH_PowerWaitModeConfig:
 185                     ; 200   assert_param(IS_FLASH_POWER(FLASH_Power));
 187                     ; 203   if (FLASH_Power != FLASH_Power_On)
 189  0011 a101          	cp	a,#1
 190  0013 2706          	jreq	L57
 191                     ; 205     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 193  0015 72145050      	bset	20560,#2
 195  0019 2004          	jra	L77
 196  001b               L57:
 197                     ; 210     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 199  001b 72155050      	bres	20560,#2
 200  001f               L77:
 201                     ; 212 }
 204  001f 81            	ret
 227                     ; 253 void FLASH_DeInit(void)
 227                     ; 254 {
 228                     	switch	.text
 229  0020               _FLASH_DeInit:
 233                     ; 255   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 235  0020 725f5050      	clr	20560
 236                     ; 256   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 238  0024 725f5051      	clr	20561
 239                     ; 257   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 241  0028 35405054      	mov	20564,#64
 242                     ; 258   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 244  002c c65054        	ld	a,20564
 245  002f 97            	ld	xl,a
 246                     ; 259 }
 249  0030 81            	ret
 305                     ; 269 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 270 {
 306                     	switch	.text
 307  0031               _FLASH_Unlock:
 309  0031 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 272   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 315                     ; 275   if (FLASH_MemType == FLASH_MemType_Program)
 317  0032 a1fd          	cp	a,#253
 318  0034 2608          	jrne	L731
 319                     ; 277     FLASH->PUKR = FLASH_RASS_KEY1;
 321  0036 35565052      	mov	20562,#86
 322                     ; 278     FLASH->PUKR = FLASH_RASS_KEY2;
 324  003a 35ae5052      	mov	20562,#174
 325  003e               L731:
 326                     ; 282   if (FLASH_MemType == FLASH_MemType_Data)
 328  003e 7b01          	ld	a,(OFST+1,sp)
 329  0040 a1f7          	cp	a,#247
 330  0042 2608          	jrne	L141
 331                     ; 284     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 333  0044 35ae5053      	mov	20563,#174
 334                     ; 285     FLASH->DUKR = FLASH_RASS_KEY1;
 336  0048 35565053      	mov	20563,#86
 337  004c               L141:
 338                     ; 287 }
 341  004c 84            	pop	a
 342  004d 81            	ret
 377                     ; 297 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 377                     ; 298 {
 378                     	switch	.text
 379  004e               _FLASH_Lock:
 383                     ; 300   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 385                     ; 302   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 387  004e c45054        	and	a,20564
 388  0051 c75054        	ld	20564,a
 389                     ; 303 }
 392  0054 81            	ret
 435                     ; 311 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 435                     ; 312 {
 436                     	switch	.text
 437  0055               _FLASH_ProgramByte:
 439       00000000      OFST:	set	0
 442                     ; 314   assert_param(IS_FLASH_ADDRESS(Address));
 444                     ; 316   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 446  0055 7b05          	ld	a,(OFST+5,sp)
 447  0057 97            	ld	xl,a
 448  0058 7b06          	ld	a,(OFST+6,sp)
 449  005a 3f00          	clr	c_x
 450  005c 02            	rlwa	x,a
 451  005d 9093          	ldw	y,x
 452  005f 7b07          	ld	a,(OFST+7,sp)
 453  0061 bf01          	ldw	c_x+1,x
 454  0063 92bd0000      	ldf	[c_x.e],a
 455                     ; 317 }
 458  0067 81            	ret
 492                     ; 324 void FLASH_EraseByte(uint32_t Address)
 492                     ; 325 {
 493                     	switch	.text
 494  0068               _FLASH_EraseByte:
 496       00000000      OFST:	set	0
 499                     ; 327   assert_param(IS_FLASH_ADDRESS(Address));
 501                     ; 329   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 503  0068 7b05          	ld	a,(OFST+5,sp)
 504  006a 97            	ld	xl,a
 505  006b 7b06          	ld	a,(OFST+6,sp)
 506  006d 3f00          	clr	c_x
 507  006f 02            	rlwa	x,a
 508  0070 9093          	ldw	y,x
 509  0072 bf01          	ldw	c_x+1,x
 510  0074 4f            	clr	a
 511  0075 92bd0000      	ldf	[c_x.e],a
 512                     ; 330 }
 515  0079 81            	ret
 558                     ; 338 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 558                     ; 339 {
 559                     	switch	.text
 560  007a               _FLASH_ProgramWord:
 562       00000000      OFST:	set	0
 565                     ; 341   assert_param(IS_FLASH_ADDRESS(Address));
 567                     ; 343   FLASH->CR2 |= FLASH_CR2_WPRG;
 569  007a 721c5051      	bset	20561,#6
 570                     ; 346   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 572  007e 7b05          	ld	a,(OFST+5,sp)
 573  0080 97            	ld	xl,a
 574  0081 7b06          	ld	a,(OFST+6,sp)
 575  0083 3f00          	clr	c_x
 576  0085 02            	rlwa	x,a
 577  0086 9093          	ldw	y,x
 578  0088 7b07          	ld	a,(OFST+7,sp)
 579  008a bf01          	ldw	c_x+1,x
 580  008c 92bd0000      	ldf	[c_x.e],a
 581                     ; 348   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 583  0090 7b05          	ld	a,(OFST+5,sp)
 584  0092 97            	ld	xl,a
 585  0093 7b06          	ld	a,(OFST+6,sp)
 586  0095 3f00          	clr	c_x
 587  0097 02            	rlwa	x,a
 588  0098 9093          	ldw	y,x
 589  009a 90ae0001      	ldw	y,#1
 590  009e bf01          	ldw	c_x+1,x
 591  00a0 93            	ldw	x,y
 592  00a1 7b08          	ld	a,(OFST+8,sp)
 593  00a3 92a70000      	ldf	([c_x.e],x),a
 594                     ; 350   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 596  00a7 7b05          	ld	a,(OFST+5,sp)
 597  00a9 97            	ld	xl,a
 598  00aa 7b06          	ld	a,(OFST+6,sp)
 599  00ac 3f00          	clr	c_x
 600  00ae 02            	rlwa	x,a
 601  00af 9093          	ldw	y,x
 602  00b1 90ae0002      	ldw	y,#2
 603  00b5 bf01          	ldw	c_x+1,x
 604  00b7 93            	ldw	x,y
 605  00b8 7b09          	ld	a,(OFST+9,sp)
 606  00ba 92a70000      	ldf	([c_x.e],x),a
 607                     ; 352   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 609  00be 7b05          	ld	a,(OFST+5,sp)
 610  00c0 97            	ld	xl,a
 611  00c1 7b06          	ld	a,(OFST+6,sp)
 612  00c3 3f00          	clr	c_x
 613  00c5 02            	rlwa	x,a
 614  00c6 9093          	ldw	y,x
 615  00c8 90ae0003      	ldw	y,#3
 616  00cc bf01          	ldw	c_x+1,x
 617  00ce 93            	ldw	x,y
 618  00cf 7b0a          	ld	a,(OFST+10,sp)
 619  00d1 92a70000      	ldf	([c_x.e],x),a
 620                     ; 353 }
 623  00d5 81            	ret
 657                     ; 360 uint8_t FLASH_ReadByte(uint32_t Address)
 657                     ; 361 {
 658                     	switch	.text
 659  00d6               _FLASH_ReadByte:
 661       00000000      OFST:	set	0
 664                     ; 363   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 666  00d6 7b05          	ld	a,(OFST+5,sp)
 667  00d8 97            	ld	xl,a
 668  00d9 7b06          	ld	a,(OFST+6,sp)
 669  00db 3f00          	clr	c_x
 670  00dd 02            	rlwa	x,a
 671  00de 9093          	ldw	y,x
 672  00e0 bf01          	ldw	c_x+1,x
 673  00e2 92bc0000      	ldf	a,[c_x.e]
 676  00e6 81            	ret
 721                     ; 410 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 721                     ; 411 {
 722                     	switch	.text
 723  00e7               _FLASH_ProgramOptionByte:
 725  00e7 89            	pushw	x
 726       00000000      OFST:	set	0
 729                     ; 413   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 731                     ; 416   FLASH->CR2 |= FLASH_CR2_OPT;
 733  00e8 721e5051      	bset	20561,#7
 734                     ; 419   *((PointerAttr uint8_t*)Address) = Data;
 736  00ec 3f00          	clr	c_x
 737  00ee 7b05          	ld	a,(OFST+5,sp)
 738  00f0 bf01          	ldw	c_x+1,x
 739  00f2 92bd0000      	ldf	[c_x.e],a
 740                     ; 421   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 742  00f6 a6fd          	ld	a,#253
 743  00f8 cd029f        	call	_FLASH_WaitForLastOperation
 745                     ; 424   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 747  00fb 721f5051      	bres	20561,#7
 748                     ; 425 }
 751  00ff 85            	popw	x
 752  0100 81            	ret
 788                     ; 432 void FLASH_EraseOptionByte(uint16_t Address)
 788                     ; 433 {
 789                     	switch	.text
 790  0101               _FLASH_EraseOptionByte:
 794                     ; 435   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 796                     ; 438   FLASH->CR2 |= FLASH_CR2_OPT;
 798  0101 721e5051      	bset	20561,#7
 799                     ; 441   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 801  0105 3f00          	clr	c_x
 802  0107 bf01          	ldw	c_x+1,x
 803  0109 4f            	clr	a
 804  010a 92bd0000      	ldf	[c_x.e],a
 805                     ; 443   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 807  010e a6fd          	ld	a,#253
 808  0110 cd029f        	call	_FLASH_WaitForLastOperation
 810                     ; 446   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 812  0113 721f5051      	bres	20561,#7
 813                     ; 447 }
 816  0117 81            	ret
 873                     ; 455 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 873                     ; 456 {
 874                     	switch	.text
 875  0118               _FLASH_GetReadOutProtectionStatus:
 877  0118 88            	push	a
 878       00000001      OFST:	set	1
 881                     ; 457   FunctionalState state = DISABLE;
 883  0119 0f01          	clr	(OFST+0,sp)
 884                     ; 459   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 886  011b c64800        	ld	a,18432
 887  011e a1aa          	cp	a,#170
 888  0120 2606          	jrne	L743
 889                     ; 462     state =  ENABLE;
 891  0122 a601          	ld	a,#1
 892  0124 6b01          	ld	(OFST+0,sp),a
 894  0126 2002          	jra	L153
 895  0128               L743:
 896                     ; 467     state =  DISABLE;
 898  0128 0f01          	clr	(OFST+0,sp)
 899  012a               L153:
 900                     ; 470   return state;
 902  012a 7b01          	ld	a,(OFST+0,sp)
 905  012c 5b01          	addw	sp,#1
 906  012e 81            	ret
 940                     ; 478 uint16_t FLASH_GetBootSize(void)
 940                     ; 479 {
 941                     	switch	.text
 942  012f               _FLASH_GetBootSize:
 944  012f 89            	pushw	x
 945       00000002      OFST:	set	2
 948                     ; 480   uint16_t temp = 0;
 950  0130 5f            	clrw	x
 951  0131 1f01          	ldw	(OFST-1,sp),x
 952                     ; 483   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 954  0133 c64802        	ld	a,18434
 955  0136 5f            	clrw	x
 956  0137 97            	ld	xl,a
 957  0138 4f            	clr	a
 958  0139 02            	rlwa	x,a
 959  013a 44            	srl	a
 960  013b 56            	rrcw	x
 961  013c 1f01          	ldw	(OFST-1,sp),x
 962                     ; 486   if (OPT->UBC > 0x7F)
 964  013e c64802        	ld	a,18434
 965  0141 a180          	cp	a,#128
 966  0143 2505          	jrult	L173
 967                     ; 488     temp = 8192;
 969  0145 ae2000        	ldw	x,#8192
 970  0148 1f01          	ldw	(OFST-1,sp),x
 971  014a               L173:
 972                     ; 492   return(temp);
 974  014a 1e01          	ldw	x,(OFST-1,sp)
 977  014c 5b02          	addw	sp,#2
 978  014e 81            	ret
1012                     ; 502 uint16_t FLASH_GetCodeSize(void)
1012                     ; 503 {
1013                     	switch	.text
1014  014f               _FLASH_GetCodeSize:
1016  014f 89            	pushw	x
1017       00000002      OFST:	set	2
1020                     ; 504   uint16_t temp = 0;
1022  0150 5f            	clrw	x
1023  0151 1f01          	ldw	(OFST-1,sp),x
1024                     ; 507   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
1026  0153 c64807        	ld	a,18439
1027  0156 5f            	clrw	x
1028  0157 97            	ld	xl,a
1029  0158 4f            	clr	a
1030  0159 02            	rlwa	x,a
1031  015a 44            	srl	a
1032  015b 56            	rrcw	x
1033  015c 1f01          	ldw	(OFST-1,sp),x
1034                     ; 510   if (OPT->PCODESIZE > 0x7F)
1036  015e c64807        	ld	a,18439
1037  0161 a180          	cp	a,#128
1038  0163 2505          	jrult	L114
1039                     ; 512     temp = 8192;
1041  0165 ae2000        	ldw	x,#8192
1042  0168 1f01          	ldw	(OFST-1,sp),x
1043  016a               L114:
1044                     ; 516   return(temp);
1046  016a 1e01          	ldw	x,(OFST-1,sp)
1049  016c 5b02          	addw	sp,#2
1050  016e 81            	ret
1085                     ; 541 void FLASH_ITConfig(FunctionalState NewState)
1085                     ; 542 {
1086                     	switch	.text
1087  016f               _FLASH_ITConfig:
1091                     ; 545   assert_param(IS_FUNCTIONAL_STATE(NewState));
1093                     ; 547   if (NewState != DISABLE)
1095  016f 4d            	tnz	a
1096  0170 2706          	jreq	L134
1097                     ; 550     FLASH->CR1 |= FLASH_CR1_IE;
1099  0172 72125050      	bset	20560,#1
1101  0176 2004          	jra	L334
1102  0178               L134:
1103                     ; 555     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1105  0178 72135050      	bres	20560,#1
1106  017c               L334:
1107                     ; 557 }
1110  017c 81            	ret
1219                     ; 571 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1219                     ; 572 {
1220                     	switch	.text
1221  017d               _FLASH_GetFlagStatus:
1223  017d 88            	push	a
1224       00000001      OFST:	set	1
1227                     ; 573   FlagStatus status = RESET;
1229  017e 0f01          	clr	(OFST+0,sp)
1230                     ; 574   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1232                     ; 577   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1234  0180 c45054        	and	a,20564
1235  0183 2706          	jreq	L505
1236                     ; 579     status = SET; /* Flash_FLAG is set*/
1238  0185 a601          	ld	a,#1
1239  0187 6b01          	ld	(OFST+0,sp),a
1241  0189 2002          	jra	L705
1242  018b               L505:
1243                     ; 583     status = RESET; /* Flash_FLAG is reset*/
1245  018b 0f01          	clr	(OFST+0,sp)
1246  018d               L705:
1247                     ; 587   return status;
1249  018d 7b01          	ld	a,(OFST+0,sp)
1252  018f 5b01          	addw	sp,#1
1253  0191 81            	ret
1289                     ; 703 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1289                     ; 704 {
1290                     	switch	.text
1291  0192               _FLASH_PowerRunModeConfig:
1295                     ; 706   assert_param(IS_FLASH_POWER(FLASH_Power));
1297                     ; 708   if (FLASH_Power != FLASH_Power_On)
1299  0192 a101          	cp	a,#1
1300  0194 2706          	jreq	L725
1301                     ; 710   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1303  0196 72165050      	bset	20560,#3
1305  019a 2004          	jra	L135
1306  019c               L725:
1307                     ; 714     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1309  019c 72175050      	bres	20560,#3
1310  01a0               L135:
1311                     ; 716 }
1314  01a0 81            	ret
1378                     ; 729 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1378                     ; 730 {
1379                     	switch	.text
1380  01a1               _FLASH_GetPowerStatus:
1384                     ; 731   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1386  01a1 c65050        	ld	a,20560
1387  01a4 a40c          	and	a,#12
1390  01a6 81            	ret
1494                     ; 749 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1494                     ; 750                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1494                     ; 751 {
1495                     	switch	.text
1496  01a7               _FLASH_ProgramBlock:
1498  01a7 89            	pushw	x
1499  01a8 5206          	subw	sp,#6
1500       00000006      OFST:	set	6
1503                     ; 752   uint16_t Count = 0;
1505  01aa 1e05          	ldw	x,(OFST-1,sp)
1506                     ; 753   uint32_t startaddress = 0;
1508  01ac 96            	ldw	x,sp
1509  01ad 1c0001        	addw	x,#OFST-5
1510  01b0 cd0000        	call	c_ltor
1512                     ; 756   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1514                     ; 757   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1516                     ; 758   if (FLASH_MemType == FLASH_MemType_Program)
1518  01b3 7b0b          	ld	a,(OFST+5,sp)
1519  01b5 a1fd          	cp	a,#253
1520  01b7 260c          	jrne	L136
1521                     ; 760   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1523                     ; 761     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1525  01b9 ae8000        	ldw	x,#32768
1526  01bc 1f03          	ldw	(OFST-3,sp),x
1527  01be ae0000        	ldw	x,#0
1528  01c1 1f01          	ldw	(OFST-5,sp),x
1530  01c3 200a          	jra	L336
1531  01c5               L136:
1532                     ; 765     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1534                     ; 766     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1536  01c5 ae1000        	ldw	x,#4096
1537  01c8 1f03          	ldw	(OFST-3,sp),x
1538  01ca ae0000        	ldw	x,#0
1539  01cd 1f01          	ldw	(OFST-5,sp),x
1540  01cf               L336:
1541                     ; 770   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1543  01cf 1e07          	ldw	x,(OFST+1,sp)
1544  01d1 a680          	ld	a,#128
1545  01d3 cd0000        	call	c_cmulx
1547  01d6 96            	ldw	x,sp
1548  01d7 1c0001        	addw	x,#OFST-5
1549  01da cd0000        	call	c_lgadd
1551                     ; 773   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1553  01dd 0d0c          	tnz	(OFST+6,sp)
1554  01df 2606          	jrne	L536
1555                     ; 776   FLASH->CR2 |= FLASH_CR2_PRG;
1557  01e1 72105051      	bset	20561,#0
1559  01e5 2004          	jra	L736
1560  01e7               L536:
1561                     ; 781   FLASH->CR2 |= FLASH_CR2_FPRG;
1563  01e7 72185051      	bset	20561,#4
1564  01eb               L736:
1565                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1567  01eb 5f            	clrw	x
1568  01ec 1f05          	ldw	(OFST-1,sp),x
1569  01ee               L146:
1570                     ; 790   *((PointerAttr uint8_t*) (uint32_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1572  01ee 1e0d          	ldw	x,(OFST+7,sp)
1573  01f0 72fb05        	addw	x,(OFST-1,sp)
1574  01f3 f6            	ld	a,(x)
1575  01f4 88            	push	a
1576  01f5 7b03          	ld	a,(OFST-3,sp)
1577  01f7 b700          	ld	c_x,a
1578  01f9 1e04          	ldw	x,(OFST-2,sp)
1579  01fb 84            	pop	a
1580  01fc 1605          	ldw	y,(OFST-1,sp)
1581  01fe bf01          	ldw	c_x+1,x
1582  0200 93            	ldw	x,y
1583  0201 92a70000      	ldf	([c_x.e],x),a
1584                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1586  0205 1e05          	ldw	x,(OFST-1,sp)
1587  0207 1c0001        	addw	x,#1
1588  020a 1f05          	ldw	(OFST-1,sp),x
1591  020c 1e05          	ldw	x,(OFST-1,sp)
1592  020e a30080        	cpw	x,#128
1593  0211 25db          	jrult	L146
1594                     ; 793 }
1597  0213 5b08          	addw	sp,#8
1598  0215 81            	ret
1661                     ; 805 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1661                     ; 806 {
1662                     	switch	.text
1663  0216               _FLASH_EraseBlock:
1665  0216 89            	pushw	x
1666  0217 5207          	subw	sp,#7
1667       00000007      OFST:	set	7
1670                     ; 807   uint32_t startaddress = 0;
1672  0219 96            	ldw	x,sp
1673  021a 1c0001        	addw	x,#OFST-6
1674  021d cd0000        	call	c_ltor
1676                     ; 815   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1678                     ; 816   if (FLASH_MemType == FLASH_MemType_Program)
1680  0220 7b0c          	ld	a,(OFST+5,sp)
1681  0222 a1fd          	cp	a,#253
1682  0224 260c          	jrne	L107
1683                     ; 818   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1685                     ; 819     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1687  0226 ae8000        	ldw	x,#32768
1688  0229 1f03          	ldw	(OFST-4,sp),x
1689  022b ae0000        	ldw	x,#0
1690  022e 1f01          	ldw	(OFST-6,sp),x
1692  0230 200a          	jra	L307
1693  0232               L107:
1694                     ; 823     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1696                     ; 824     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1698  0232 ae1000        	ldw	x,#4096
1699  0235 1f03          	ldw	(OFST-4,sp),x
1700  0237 ae0000        	ldw	x,#0
1701  023a 1f01          	ldw	(OFST-6,sp),x
1702  023c               L307:
1703                     ; 831   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1705  023c 1e08          	ldw	x,(OFST+1,sp)
1706  023e a680          	ld	a,#128
1707  0240 cd0000        	call	c_cmulx
1709  0243 96            	ldw	x,sp
1710  0244 1c0001        	addw	x,#OFST-6
1711  0247 cd0000        	call	c_ladd
1713  024a 450100        	mov	c_x,c_lreg+1
1714  024d be02          	ldw	x,c_lreg+2
1715  024f b600          	ld	a,c_x
1716  0251 6b05          	ld	(OFST-2,sp),a
1717  0253 1f06          	ldw	(OFST-1,sp),x
1718                     ; 835   FLASH->CR2 |= FLASH_CR2_ERASE;
1720  0255 721a5051      	bset	20561,#5
1721                     ; 840   *pwFlash = (uint8_t)0;
1723  0259 7b05          	ld	a,(OFST-2,sp)
1724  025b b700          	ld	c_x,a
1725  025d 1e06          	ldw	x,(OFST-1,sp)
1726  025f bf01          	ldw	c_x+1,x
1727  0261 4f            	clr	a
1728  0262 92bd0000      	ldf	[c_x.e],a
1729                     ; 841   *(pwFlash + 1) = (uint8_t)0;
1731  0266 7b05          	ld	a,(OFST-2,sp)
1732  0268 b700          	ld	c_x,a
1733  026a 1e06          	ldw	x,(OFST-1,sp)
1734  026c 90ae0001      	ldw	y,#1
1735  0270 bf01          	ldw	c_x+1,x
1736  0272 93            	ldw	x,y
1737  0273 4f            	clr	a
1738  0274 92a70000      	ldf	([c_x.e],x),a
1739                     ; 842   *(pwFlash + 2) = (uint8_t)0;
1741  0278 7b05          	ld	a,(OFST-2,sp)
1742  027a b700          	ld	c_x,a
1743  027c 1e06          	ldw	x,(OFST-1,sp)
1744  027e 90ae0002      	ldw	y,#2
1745  0282 bf01          	ldw	c_x+1,x
1746  0284 93            	ldw	x,y
1747  0285 4f            	clr	a
1748  0286 92a70000      	ldf	([c_x.e],x),a
1749                     ; 843   *(pwFlash + 3) = (uint8_t)0;
1751  028a 7b05          	ld	a,(OFST-2,sp)
1752  028c b700          	ld	c_x,a
1753  028e 1e06          	ldw	x,(OFST-1,sp)
1754  0290 90ae0003      	ldw	y,#3
1755  0294 bf01          	ldw	c_x+1,x
1756  0296 93            	ldw	x,y
1757  0297 4f            	clr	a
1758  0298 92a70000      	ldf	([c_x.e],x),a
1759                     ; 845 }
1762  029c 5b09          	addw	sp,#9
1763  029e 81            	ret
1848                     ; 857 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1848                     ; 858 {
1849                     	switch	.text
1850  029f               _FLASH_WaitForLastOperation:
1852  029f 5205          	subw	sp,#5
1853       00000005      OFST:	set	5
1856                     ; 859   uint32_t timeout = OPERATION_TIMEOUT;
1858  02a1 aeffff        	ldw	x,#65535
1859  02a4 1f03          	ldw	(OFST-2,sp),x
1860  02a6 ae0000        	ldw	x,#0
1861  02a9 1f01          	ldw	(OFST-4,sp),x
1862                     ; 860   uint8_t flagstatus = 0x00;
1864  02ab 0f05          	clr	(OFST+0,sp)
1865                     ; 862   if (FLASH_MemType == FLASH_MemType_Program)
1867  02ad a1fd          	cp	a,#253
1868  02af 2631          	jrne	L367
1870  02b1 2010          	jra	L157
1871  02b3               L747:
1872                     ; 866       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1872                     ; 867                              FLASH_IAPSR_WR_PG_DIS));
1874  02b3 c65054        	ld	a,20564
1875  02b6 a405          	and	a,#5
1876  02b8 6b05          	ld	(OFST+0,sp),a
1877                     ; 868       timeout--;
1879  02ba 96            	ldw	x,sp
1880  02bb 1c0001        	addw	x,#OFST-4
1881  02be a601          	ld	a,#1
1882  02c0 cd0000        	call	c_lgsbc
1884  02c3               L157:
1885                     ; 864   while ((flagstatus == 0x00) && (timeout != 0x00))
1887  02c3 0d05          	tnz	(OFST+0,sp)
1888  02c5 2628          	jrne	L757
1890  02c7 96            	ldw	x,sp
1891  02c8 1c0001        	addw	x,#OFST-4
1892  02cb cd0000        	call	c_lzmp
1894  02ce 26e3          	jrne	L747
1895  02d0 201d          	jra	L757
1896  02d2               L167:
1897                     ; 875       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1897                     ; 876                              FLASH_IAPSR_WR_PG_DIS));
1899  02d2 c65054        	ld	a,20564
1900  02d5 a441          	and	a,#65
1901  02d7 6b05          	ld	(OFST+0,sp),a
1902                     ; 877       timeout--;
1904  02d9 96            	ldw	x,sp
1905  02da 1c0001        	addw	x,#OFST-4
1906  02dd a601          	ld	a,#1
1907  02df cd0000        	call	c_lgsbc
1909  02e2               L367:
1910                     ; 873     while ((flagstatus == 0x00) && (timeout != 0x00))
1912  02e2 0d05          	tnz	(OFST+0,sp)
1913  02e4 2609          	jrne	L757
1915  02e6 96            	ldw	x,sp
1916  02e7 1c0001        	addw	x,#OFST-4
1917  02ea cd0000        	call	c_lzmp
1919  02ed 26e3          	jrne	L167
1920  02ef               L757:
1921                     ; 880   if (timeout == 0x00 )
1923  02ef 96            	ldw	x,sp
1924  02f0 1c0001        	addw	x,#OFST-4
1925  02f3 cd0000        	call	c_lzmp
1927  02f6 2604          	jrne	L177
1928                     ; 882   flagstatus = FLASH_Status_TimeOut;
1930  02f8 a602          	ld	a,#2
1931  02fa 6b05          	ld	(OFST+0,sp),a
1932  02fc               L177:
1933                     ; 885   return((FLASH_Status_TypeDef)flagstatus);
1935  02fc 7b05          	ld	a,(OFST+0,sp)
1938  02fe 5b05          	addw	sp,#5
1939  0300 81            	ret
1952                     	xdef	_FLASH_WaitForLastOperation
1953                     	xdef	_FLASH_EraseBlock
1954                     	xdef	_FLASH_ProgramBlock
1955                     	xdef	_FLASH_GetPowerStatus
1956                     	xdef	_FLASH_PowerRunModeConfig
1957                     	xdef	_FLASH_GetFlagStatus
1958                     	xdef	_FLASH_ITConfig
1959                     	xdef	_FLASH_EraseOptionByte
1960                     	xdef	_FLASH_ProgramOptionByte
1961                     	xdef	_FLASH_GetReadOutProtectionStatus
1962                     	xdef	_FLASH_GetCodeSize
1963                     	xdef	_FLASH_GetBootSize
1964                     	xdef	_FLASH_ReadByte
1965                     	xdef	_FLASH_ProgramWord
1966                     	xdef	_FLASH_EraseByte
1967                     	xdef	_FLASH_ProgramByte
1968                     	xdef	_FLASH_Lock
1969                     	xdef	_FLASH_Unlock
1970                     	xdef	_FLASH_DeInit
1971                     	xdef	_FLASH_PowerWaitModeConfig
1972                     	xdef	_FLASH_SetProgrammingTime
1973                     	xdef	_FLASH_GetProgrammingTime
1974                     	xref.b	c_lreg
1975                     	xref.b	c_x
1994                     	xref	c_lzmp
1995                     	xref	c_lgsbc
1996                     	xref	c_ladd
1997                     	xref	c_lgadd
1998                     	xref	c_cmulx
1999                     	xref	c_ltor
2000                     	end
