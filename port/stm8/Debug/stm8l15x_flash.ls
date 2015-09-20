   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  67                     ; 168 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  67                     ; 169 {
  69                     .text:	section	.text,new
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
 112                     .text:	section	.text,new
 113  0000               _FLASH_GetProgrammingTime:
 117                     ; 184   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 119  0000 c65050        	ld	a,20560
 120  0003 a401          	and	a,#1
 123  0005 81            	ret
 179                     ; 197 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 179                     ; 198 {
 180                     .text:	section	.text,new
 181  0000               _FLASH_PowerWaitModeConfig:
 185                     ; 200   assert_param(IS_FLASH_POWER(FLASH_Power));
 187                     ; 203   if (FLASH_Power != FLASH_Power_On)
 189  0000 a101          	cp	a,#1
 190  0002 2706          	jreq	L57
 191                     ; 205     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 193  0004 72145050      	bset	20560,#2
 195  0008 2004          	jra	L77
 196  000a               L57:
 197                     ; 210     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 199  000a 72155050      	bres	20560,#2
 200  000e               L77:
 201                     ; 212 }
 204  000e 81            	ret
 227                     ; 253 void FLASH_DeInit(void)
 227                     ; 254 {
 228                     .text:	section	.text,new
 229  0000               _FLASH_DeInit:
 233                     ; 255   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 235  0000 725f5050      	clr	20560
 236                     ; 256   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 238  0004 725f5051      	clr	20561
 239                     ; 257   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 241  0008 35405054      	mov	20564,#64
 242                     ; 258   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 244  000c c65054        	ld	a,20564
 245  000f 97            	ld	xl,a
 246                     ; 259 }
 249  0010 81            	ret
 305                     ; 269 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 270 {
 306                     .text:	section	.text,new
 307  0000               _FLASH_Unlock:
 309  0000 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 272   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 315                     ; 275   if (FLASH_MemType == FLASH_MemType_Program)
 317  0001 a1fd          	cp	a,#253
 318  0003 2608          	jrne	L731
 319                     ; 277     FLASH->PUKR = FLASH_RASS_KEY1;
 321  0005 35565052      	mov	20562,#86
 322                     ; 278     FLASH->PUKR = FLASH_RASS_KEY2;
 324  0009 35ae5052      	mov	20562,#174
 325  000d               L731:
 326                     ; 282   if (FLASH_MemType == FLASH_MemType_Data)
 328  000d 7b01          	ld	a,(OFST+1,sp)
 329  000f a1f7          	cp	a,#247
 330  0011 2608          	jrne	L141
 331                     ; 284     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 333  0013 35ae5053      	mov	20563,#174
 334                     ; 285     FLASH->DUKR = FLASH_RASS_KEY1;
 336  0017 35565053      	mov	20563,#86
 337  001b               L141:
 338                     ; 287 }
 341  001b 84            	pop	a
 342  001c 81            	ret
 377                     ; 297 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 377                     ; 298 {
 378                     .text:	section	.text,new
 379  0000               _FLASH_Lock:
 383                     ; 300   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 385                     ; 302   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 387  0000 c45054        	and	a,20564
 388  0003 c75054        	ld	20564,a
 389                     ; 303 }
 392  0006 81            	ret
 431                     ; 311 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 431                     ; 312 {
 432                     .text:	section	.text,new
 433  0000               _FLASH_ProgramByte:
 435       00000000      OFST:	set	0
 438                     ; 314   assert_param(IS_FLASH_ADDRESS(Address));
 440                     ; 316   *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 442  0000 7b05          	ld	a,(OFST+5,sp)
 443  0002 97            	ld	xl,a
 444  0003 7b06          	ld	a,(OFST+6,sp)
 445  0005 3f00          	clr	c_x
 446  0007 02            	rlwa	x,a
 447  0008 9093          	ldw	y,x
 448  000a 7b07          	ld	a,(OFST+7,sp)
 449  000c bf01          	ldw	c_x+1,x
 450  000e 92bd0000      	ldf	[c_x.e],a
 451                     ; 317 }
 454  0012 81            	ret
 486                     ; 324 void FLASH_EraseByte(uint32_t Address)
 486                     ; 325 {
 487                     .text:	section	.text,new
 488  0000               _FLASH_EraseByte:
 490       00000000      OFST:	set	0
 493                     ; 327   assert_param(IS_FLASH_ADDRESS(Address));
 495                     ; 329   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 497  0000 7b05          	ld	a,(OFST+5,sp)
 498  0002 97            	ld	xl,a
 499  0003 7b06          	ld	a,(OFST+6,sp)
 500  0005 3f00          	clr	c_x
 501  0007 02            	rlwa	x,a
 502  0008 9093          	ldw	y,x
 503  000a bf01          	ldw	c_x+1,x
 504  000c 4f            	clr	a
 505  000d 92bd0000      	ldf	[c_x.e],a
 506                     ; 330 }
 509  0011 81            	ret
 548                     ; 338 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 548                     ; 339 {
 549                     .text:	section	.text,new
 550  0000               _FLASH_ProgramWord:
 552       00000000      OFST:	set	0
 555                     ; 341   assert_param(IS_FLASH_ADDRESS(Address));
 557                     ; 343   FLASH->CR2 |= FLASH_CR2_WPRG;
 559  0000 721c5051      	bset	20561,#6
 560                     ; 346   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 562  0004 7b05          	ld	a,(OFST+5,sp)
 563  0006 97            	ld	xl,a
 564  0007 7b06          	ld	a,(OFST+6,sp)
 565  0009 3f00          	clr	c_x
 566  000b 02            	rlwa	x,a
 567  000c 9093          	ldw	y,x
 568  000e 7b07          	ld	a,(OFST+7,sp)
 569  0010 bf01          	ldw	c_x+1,x
 570  0012 92bd0000      	ldf	[c_x.e],a
 571                     ; 348   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 573  0016 7b05          	ld	a,(OFST+5,sp)
 574  0018 97            	ld	xl,a
 575  0019 7b06          	ld	a,(OFST+6,sp)
 576  001b 3f00          	clr	c_x
 577  001d 02            	rlwa	x,a
 578  001e 9093          	ldw	y,x
 579  0020 90ae0001      	ldw	y,#1
 580  0024 bf01          	ldw	c_x+1,x
 581  0026 93            	ldw	x,y
 582  0027 7b08          	ld	a,(OFST+8,sp)
 583  0029 92a70000      	ldf	([c_x.e],x),a
 584                     ; 350   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 586  002d 7b05          	ld	a,(OFST+5,sp)
 587  002f 97            	ld	xl,a
 588  0030 7b06          	ld	a,(OFST+6,sp)
 589  0032 3f00          	clr	c_x
 590  0034 02            	rlwa	x,a
 591  0035 9093          	ldw	y,x
 592  0037 90ae0002      	ldw	y,#2
 593  003b bf01          	ldw	c_x+1,x
 594  003d 93            	ldw	x,y
 595  003e 7b09          	ld	a,(OFST+9,sp)
 596  0040 92a70000      	ldf	([c_x.e],x),a
 597                     ; 352   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 599  0044 7b05          	ld	a,(OFST+5,sp)
 600  0046 97            	ld	xl,a
 601  0047 7b06          	ld	a,(OFST+6,sp)
 602  0049 3f00          	clr	c_x
 603  004b 02            	rlwa	x,a
 604  004c 9093          	ldw	y,x
 605  004e 90ae0003      	ldw	y,#3
 606  0052 bf01          	ldw	c_x+1,x
 607  0054 93            	ldw	x,y
 608  0055 7b0a          	ld	a,(OFST+10,sp)
 609  0057 92a70000      	ldf	([c_x.e],x),a
 610                     ; 353 }
 613  005b 81            	ret
 645                     ; 360 uint8_t FLASH_ReadByte(uint32_t Address)
 645                     ; 361 {
 646                     .text:	section	.text,new
 647  0000               _FLASH_ReadByte:
 649       00000000      OFST:	set	0
 652                     ; 363   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 654  0000 7b05          	ld	a,(OFST+5,sp)
 655  0002 97            	ld	xl,a
 656  0003 7b06          	ld	a,(OFST+6,sp)
 657  0005 3f00          	clr	c_x
 658  0007 02            	rlwa	x,a
 659  0008 9093          	ldw	y,x
 660  000a bf01          	ldw	c_x+1,x
 661  000c 92bc0000      	ldf	a,[c_x.e]
 664  0010 81            	ret
 705                     ; 410 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 705                     ; 411 {
 706                     .text:	section	.text,new
 707  0000               _FLASH_ProgramOptionByte:
 709  0000 89            	pushw	x
 710       00000000      OFST:	set	0
 713                     ; 413   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 715                     ; 416   FLASH->CR2 |= FLASH_CR2_OPT;
 717  0001 721e5051      	bset	20561,#7
 718                     ; 419   *((PointerAttr uint8_t*)Address) = Data;
 720  0005 3f00          	clr	c_x
 721  0007 7b05          	ld	a,(OFST+5,sp)
 722  0009 bf01          	ldw	c_x+1,x
 723  000b 92bd0000      	ldf	[c_x.e],a
 724                     ; 421   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 726  000f a6fd          	ld	a,#253
 727  0011 cd0000        	call	_FLASH_WaitForLastOperation
 729                     ; 424   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 731  0014 721f5051      	bres	20561,#7
 732                     ; 425 }
 735  0018 85            	popw	x
 736  0019 81            	ret
 770                     ; 432 void FLASH_EraseOptionByte(uint16_t Address)
 770                     ; 433 {
 771                     .text:	section	.text,new
 772  0000               _FLASH_EraseOptionByte:
 776                     ; 435   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 778                     ; 438   FLASH->CR2 |= FLASH_CR2_OPT;
 780  0000 721e5051      	bset	20561,#7
 781                     ; 441   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 783  0004 3f00          	clr	c_x
 784  0006 bf01          	ldw	c_x+1,x
 785  0008 4f            	clr	a
 786  0009 92bd0000      	ldf	[c_x.e],a
 787                     ; 443   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 789  000d a6fd          	ld	a,#253
 790  000f cd0000        	call	_FLASH_WaitForLastOperation
 792                     ; 446   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 794  0012 721f5051      	bres	20561,#7
 795                     ; 447 }
 798  0016 81            	ret
 855                     ; 455 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 855                     ; 456 {
 856                     .text:	section	.text,new
 857  0000               _FLASH_GetReadOutProtectionStatus:
 859  0000 88            	push	a
 860       00000001      OFST:	set	1
 863                     ; 457   FunctionalState state = DISABLE;
 865  0001 0f01          	clr	(OFST+0,sp)
 866                     ; 459   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 868  0003 c64800        	ld	a,18432
 869  0006 a1aa          	cp	a,#170
 870  0008 2606          	jrne	L523
 871                     ; 462     state =  ENABLE;
 873  000a a601          	ld	a,#1
 874  000c 6b01          	ld	(OFST+0,sp),a
 876  000e 2002          	jra	L723
 877  0010               L523:
 878                     ; 467     state =  DISABLE;
 880  0010 0f01          	clr	(OFST+0,sp)
 881  0012               L723:
 882                     ; 470   return state;
 884  0012 7b01          	ld	a,(OFST+0,sp)
 887  0014 5b01          	addw	sp,#1
 888  0016 81            	ret
 920                     ; 478 uint16_t FLASH_GetBootSize(void)
 920                     ; 479 {
 921                     .text:	section	.text,new
 922  0000               _FLASH_GetBootSize:
 924  0000 89            	pushw	x
 925       00000002      OFST:	set	2
 928                     ; 480   uint16_t temp = 0;
 930  0001 5f            	clrw	x
 931  0002 1f01          	ldw	(OFST-1,sp),x
 932                     ; 483   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 934  0004 c64802        	ld	a,18434
 935  0007 5f            	clrw	x
 936  0008 97            	ld	xl,a
 937  0009 4f            	clr	a
 938  000a 02            	rlwa	x,a
 939  000b 44            	srl	a
 940  000c 56            	rrcw	x
 941  000d 1f01          	ldw	(OFST-1,sp),x
 942                     ; 486   if (OPT->UBC > 0x7F)
 944  000f c64802        	ld	a,18434
 945  0012 a180          	cp	a,#128
 946  0014 2505          	jrult	L543
 947                     ; 488     temp = 8192;
 949  0016 ae2000        	ldw	x,#8192
 950  0019 1f01          	ldw	(OFST-1,sp),x
 951  001b               L543:
 952                     ; 492   return(temp);
 954  001b 1e01          	ldw	x,(OFST-1,sp)
 957  001d 5b02          	addw	sp,#2
 958  001f 81            	ret
 990                     ; 502 uint16_t FLASH_GetCodeSize(void)
 990                     ; 503 {
 991                     .text:	section	.text,new
 992  0000               _FLASH_GetCodeSize:
 994  0000 89            	pushw	x
 995       00000002      OFST:	set	2
 998                     ; 504   uint16_t temp = 0;
1000  0001 5f            	clrw	x
1001  0002 1f01          	ldw	(OFST-1,sp),x
1002                     ; 507   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
1004  0004 c64807        	ld	a,18439
1005  0007 5f            	clrw	x
1006  0008 97            	ld	xl,a
1007  0009 4f            	clr	a
1008  000a 02            	rlwa	x,a
1009  000b 44            	srl	a
1010  000c 56            	rrcw	x
1011  000d 1f01          	ldw	(OFST-1,sp),x
1012                     ; 510   if (OPT->PCODESIZE > 0x7F)
1014  000f c64807        	ld	a,18439
1015  0012 a180          	cp	a,#128
1016  0014 2505          	jrult	L363
1017                     ; 512     temp = 8192;
1019  0016 ae2000        	ldw	x,#8192
1020  0019 1f01          	ldw	(OFST-1,sp),x
1021  001b               L363:
1022                     ; 516   return(temp);
1024  001b 1e01          	ldw	x,(OFST-1,sp)
1027  001d 5b02          	addw	sp,#2
1028  001f 81            	ret
1063                     ; 541 void FLASH_ITConfig(FunctionalState NewState)
1063                     ; 542 {
1064                     .text:	section	.text,new
1065  0000               _FLASH_ITConfig:
1069                     ; 545   assert_param(IS_FUNCTIONAL_STATE(NewState));
1071                     ; 547   if (NewState != DISABLE)
1073  0000 4d            	tnz	a
1074  0001 2706          	jreq	L304
1075                     ; 550     FLASH->CR1 |= FLASH_CR1_IE;
1077  0003 72125050      	bset	20560,#1
1079  0007 2004          	jra	L504
1080  0009               L304:
1081                     ; 555     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1083  0009 72135050      	bres	20560,#1
1084  000d               L504:
1085                     ; 557 }
1088  000d 81            	ret
1197                     ; 571 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1197                     ; 572 {
1198                     .text:	section	.text,new
1199  0000               _FLASH_GetFlagStatus:
1201  0000 88            	push	a
1202       00000001      OFST:	set	1
1205                     ; 573   FlagStatus status = RESET;
1207  0001 0f01          	clr	(OFST+0,sp)
1208                     ; 574   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1210                     ; 577   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1212  0003 c45054        	and	a,20564
1213  0006 2706          	jreq	L754
1214                     ; 579     status = SET; /* Flash_FLAG is set*/
1216  0008 a601          	ld	a,#1
1217  000a 6b01          	ld	(OFST+0,sp),a
1219  000c 2002          	jra	L164
1220  000e               L754:
1221                     ; 583     status = RESET; /* Flash_FLAG is reset*/
1223  000e 0f01          	clr	(OFST+0,sp)
1224  0010               L164:
1225                     ; 587   return status;
1227  0010 7b01          	ld	a,(OFST+0,sp)
1230  0012 5b01          	addw	sp,#1
1231  0014 81            	ret
1267                     ; 703 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1267                     ; 704 {
1268                     .text:	section	.text,new
1269  0000               _FLASH_PowerRunModeConfig:
1273                     ; 706   assert_param(IS_FLASH_POWER(FLASH_Power));
1275                     ; 708   if (FLASH_Power != FLASH_Power_On)
1277  0000 a101          	cp	a,#1
1278  0002 2706          	jreq	L105
1279                     ; 710   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1281  0004 72165050      	bset	20560,#3
1283  0008 2004          	jra	L305
1284  000a               L105:
1285                     ; 714     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1287  000a 72175050      	bres	20560,#3
1288  000e               L305:
1289                     ; 716 }
1292  000e 81            	ret
1356                     ; 729 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1356                     ; 730 {
1357                     .text:	section	.text,new
1358  0000               _FLASH_GetPowerStatus:
1362                     ; 731   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1364  0000 c65050        	ld	a,20560
1365  0003 a40c          	and	a,#12
1368  0005 81            	ret
1466                     ; 749 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1466                     ; 750                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1466                     ; 751 {
1467                     .text:	section	.text,new
1468  0000               _FLASH_ProgramBlock:
1470  0000 89            	pushw	x
1471  0001 5206          	subw	sp,#6
1472       00000006      OFST:	set	6
1475                     ; 752   uint16_t Count = 0;
1477  0003 1e05          	ldw	x,(OFST-1,sp)
1478                     ; 753   uint32_t startaddress = 0;
1480  0005 96            	ldw	x,sp
1481  0006 1c0001        	addw	x,#OFST-5
1482  0009 cd0000        	call	c_ltor
1484                     ; 756   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1486                     ; 757   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1488                     ; 758   if (FLASH_MemType == FLASH_MemType_Program)
1490  000c 7b0b          	ld	a,(OFST+5,sp)
1491  000e a1fd          	cp	a,#253
1492  0010 260c          	jrne	L575
1493                     ; 760   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1495                     ; 761     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1497  0012 ae8000        	ldw	x,#32768
1498  0015 1f03          	ldw	(OFST-3,sp),x
1499  0017 ae0000        	ldw	x,#0
1500  001a 1f01          	ldw	(OFST-5,sp),x
1502  001c 200a          	jra	L775
1503  001e               L575:
1504                     ; 765     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1506                     ; 766     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1508  001e ae1000        	ldw	x,#4096
1509  0021 1f03          	ldw	(OFST-3,sp),x
1510  0023 ae0000        	ldw	x,#0
1511  0026 1f01          	ldw	(OFST-5,sp),x
1512  0028               L775:
1513                     ; 770   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1515  0028 1e07          	ldw	x,(OFST+1,sp)
1516  002a a680          	ld	a,#128
1517  002c cd0000        	call	c_cmulx
1519  002f 96            	ldw	x,sp
1520  0030 1c0001        	addw	x,#OFST-5
1521  0033 cd0000        	call	c_lgadd
1523                     ; 773   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1525  0036 0d0c          	tnz	(OFST+6,sp)
1526  0038 2606          	jrne	L106
1527                     ; 776   FLASH->CR2 |= FLASH_CR2_PRG;
1529  003a 72105051      	bset	20561,#0
1531  003e 2004          	jra	L306
1532  0040               L106:
1533                     ; 781   FLASH->CR2 |= FLASH_CR2_FPRG;
1535  0040 72185051      	bset	20561,#4
1536  0044               L306:
1537                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1539  0044 5f            	clrw	x
1540  0045 1f05          	ldw	(OFST-1,sp),x
1541  0047               L506:
1542                     ; 790   *((PointerAttr uint8_t*) (uint32_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1544  0047 1e0d          	ldw	x,(OFST+7,sp)
1545  0049 72fb05        	addw	x,(OFST-1,sp)
1546  004c f6            	ld	a,(x)
1547  004d 88            	push	a
1548  004e 7b03          	ld	a,(OFST-3,sp)
1549  0050 b700          	ld	c_x,a
1550  0052 1e04          	ldw	x,(OFST-2,sp)
1551  0054 84            	pop	a
1552  0055 1605          	ldw	y,(OFST-1,sp)
1553  0057 bf01          	ldw	c_x+1,x
1554  0059 93            	ldw	x,y
1555  005a 92a70000      	ldf	([c_x.e],x),a
1556                     ; 785   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1558  005e 1e05          	ldw	x,(OFST-1,sp)
1559  0060 1c0001        	addw	x,#1
1560  0063 1f05          	ldw	(OFST-1,sp),x
1563  0065 1e05          	ldw	x,(OFST-1,sp)
1564  0067 a30080        	cpw	x,#128
1565  006a 25db          	jrult	L506
1566                     ; 793 }
1569  006c 5b08          	addw	sp,#8
1570  006e 81            	ret
1629                     ; 805 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1629                     ; 806 {
1630                     .text:	section	.text,new
1631  0000               _FLASH_EraseBlock:
1633  0000 89            	pushw	x
1634  0001 5207          	subw	sp,#7
1635       00000007      OFST:	set	7
1638                     ; 807   uint32_t startaddress = 0;
1640  0003 96            	ldw	x,sp
1641  0004 1c0001        	addw	x,#OFST-6
1642  0007 cd0000        	call	c_ltor
1644                     ; 815   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1646                     ; 816   if (FLASH_MemType == FLASH_MemType_Program)
1648  000a 7b0c          	ld	a,(OFST+5,sp)
1649  000c a1fd          	cp	a,#253
1650  000e 260c          	jrne	L146
1651                     ; 818   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1653                     ; 819     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1655  0010 ae8000        	ldw	x,#32768
1656  0013 1f03          	ldw	(OFST-4,sp),x
1657  0015 ae0000        	ldw	x,#0
1658  0018 1f01          	ldw	(OFST-6,sp),x
1660  001a 200a          	jra	L346
1661  001c               L146:
1662                     ; 823     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1664                     ; 824     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1666  001c ae1000        	ldw	x,#4096
1667  001f 1f03          	ldw	(OFST-4,sp),x
1668  0021 ae0000        	ldw	x,#0
1669  0024 1f01          	ldw	(OFST-6,sp),x
1670  0026               L346:
1671                     ; 831   pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1673  0026 1e08          	ldw	x,(OFST+1,sp)
1674  0028 a680          	ld	a,#128
1675  002a cd0000        	call	c_cmulx
1677  002d 96            	ldw	x,sp
1678  002e 1c0001        	addw	x,#OFST-6
1679  0031 cd0000        	call	c_ladd
1681  0034 450100        	mov	c_x,c_lreg+1
1682  0037 be02          	ldw	x,c_lreg+2
1683  0039 b600          	ld	a,c_x
1684  003b 6b05          	ld	(OFST-2,sp),a
1685  003d 1f06          	ldw	(OFST-1,sp),x
1686                     ; 835   FLASH->CR2 |= FLASH_CR2_ERASE;
1688  003f 721a5051      	bset	20561,#5
1689                     ; 840   *pwFlash = (uint8_t)0;
1691  0043 7b05          	ld	a,(OFST-2,sp)
1692  0045 b700          	ld	c_x,a
1693  0047 1e06          	ldw	x,(OFST-1,sp)
1694  0049 bf01          	ldw	c_x+1,x
1695  004b 4f            	clr	a
1696  004c 92bd0000      	ldf	[c_x.e],a
1697                     ; 841   *(pwFlash + 1) = (uint8_t)0;
1699  0050 7b05          	ld	a,(OFST-2,sp)
1700  0052 b700          	ld	c_x,a
1701  0054 1e06          	ldw	x,(OFST-1,sp)
1702  0056 90ae0001      	ldw	y,#1
1703  005a bf01          	ldw	c_x+1,x
1704  005c 93            	ldw	x,y
1705  005d 4f            	clr	a
1706  005e 92a70000      	ldf	([c_x.e],x),a
1707                     ; 842   *(pwFlash + 2) = (uint8_t)0;
1709  0062 7b05          	ld	a,(OFST-2,sp)
1710  0064 b700          	ld	c_x,a
1711  0066 1e06          	ldw	x,(OFST-1,sp)
1712  0068 90ae0002      	ldw	y,#2
1713  006c bf01          	ldw	c_x+1,x
1714  006e 93            	ldw	x,y
1715  006f 4f            	clr	a
1716  0070 92a70000      	ldf	([c_x.e],x),a
1717                     ; 843   *(pwFlash + 3) = (uint8_t)0;
1719  0074 7b05          	ld	a,(OFST-2,sp)
1720  0076 b700          	ld	c_x,a
1721  0078 1e06          	ldw	x,(OFST-1,sp)
1722  007a 90ae0003      	ldw	y,#3
1723  007e bf01          	ldw	c_x+1,x
1724  0080 93            	ldw	x,y
1725  0081 4f            	clr	a
1726  0082 92a70000      	ldf	([c_x.e],x),a
1727                     ; 845 }
1730  0086 5b09          	addw	sp,#9
1731  0088 81            	ret
1812                     ; 857 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1812                     ; 858 {
1813                     .text:	section	.text,new
1814  0000               _FLASH_WaitForLastOperation:
1816  0000 5205          	subw	sp,#5
1817       00000005      OFST:	set	5
1820                     ; 859   uint32_t timeout = OPERATION_TIMEOUT;
1822  0002 aeffff        	ldw	x,#65535
1823  0005 1f03          	ldw	(OFST-2,sp),x
1824  0007 ae0000        	ldw	x,#0
1825  000a 1f01          	ldw	(OFST-4,sp),x
1826                     ; 860   uint8_t flagstatus = 0x00;
1828  000c 0f05          	clr	(OFST+0,sp)
1829                     ; 862   if (FLASH_MemType == FLASH_MemType_Program)
1831  000e a1fd          	cp	a,#253
1832  0010 2631          	jrne	L717
1834  0012 2010          	jra	L507
1835  0014               L307:
1836                     ; 866       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1836                     ; 867                              FLASH_IAPSR_WR_PG_DIS));
1838  0014 c65054        	ld	a,20564
1839  0017 a405          	and	a,#5
1840  0019 6b05          	ld	(OFST+0,sp),a
1841                     ; 868       timeout--;
1843  001b 96            	ldw	x,sp
1844  001c 1c0001        	addw	x,#OFST-4
1845  001f a601          	ld	a,#1
1846  0021 cd0000        	call	c_lgsbc
1848  0024               L507:
1849                     ; 864   while ((flagstatus == 0x00) && (timeout != 0x00))
1851  0024 0d05          	tnz	(OFST+0,sp)
1852  0026 2628          	jrne	L317
1854  0028 96            	ldw	x,sp
1855  0029 1c0001        	addw	x,#OFST-4
1856  002c cd0000        	call	c_lzmp
1858  002f 26e3          	jrne	L307
1859  0031 201d          	jra	L317
1860  0033               L517:
1861                     ; 875       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1861                     ; 876                              FLASH_IAPSR_WR_PG_DIS));
1863  0033 c65054        	ld	a,20564
1864  0036 a441          	and	a,#65
1865  0038 6b05          	ld	(OFST+0,sp),a
1866                     ; 877       timeout--;
1868  003a 96            	ldw	x,sp
1869  003b 1c0001        	addw	x,#OFST-4
1870  003e a601          	ld	a,#1
1871  0040 cd0000        	call	c_lgsbc
1873  0043               L717:
1874                     ; 873     while ((flagstatus == 0x00) && (timeout != 0x00))
1876  0043 0d05          	tnz	(OFST+0,sp)
1877  0045 2609          	jrne	L317
1879  0047 96            	ldw	x,sp
1880  0048 1c0001        	addw	x,#OFST-4
1881  004b cd0000        	call	c_lzmp
1883  004e 26e3          	jrne	L517
1884  0050               L317:
1885                     ; 880   if (timeout == 0x00 )
1887  0050 96            	ldw	x,sp
1888  0051 1c0001        	addw	x,#OFST-4
1889  0054 cd0000        	call	c_lzmp
1891  0057 2604          	jrne	L527
1892                     ; 882   flagstatus = FLASH_Status_TimeOut;
1894  0059 a602          	ld	a,#2
1895  005b 6b05          	ld	(OFST+0,sp),a
1896  005d               L527:
1897                     ; 885   return((FLASH_Status_TypeDef)flagstatus);
1899  005d 7b05          	ld	a,(OFST+0,sp)
1902  005f 5b05          	addw	sp,#5
1903  0061 81            	ret
1916                     	xdef	_FLASH_WaitForLastOperation
1917                     	xdef	_FLASH_EraseBlock
1918                     	xdef	_FLASH_ProgramBlock
1919                     	xdef	_FLASH_GetPowerStatus
1920                     	xdef	_FLASH_PowerRunModeConfig
1921                     	xdef	_FLASH_GetFlagStatus
1922                     	xdef	_FLASH_ITConfig
1923                     	xdef	_FLASH_EraseOptionByte
1924                     	xdef	_FLASH_ProgramOptionByte
1925                     	xdef	_FLASH_GetReadOutProtectionStatus
1926                     	xdef	_FLASH_GetCodeSize
1927                     	xdef	_FLASH_GetBootSize
1928                     	xdef	_FLASH_ReadByte
1929                     	xdef	_FLASH_ProgramWord
1930                     	xdef	_FLASH_EraseByte
1931                     	xdef	_FLASH_ProgramByte
1932                     	xdef	_FLASH_Lock
1933                     	xdef	_FLASH_Unlock
1934                     	xdef	_FLASH_DeInit
1935                     	xdef	_FLASH_PowerWaitModeConfig
1936                     	xdef	_FLASH_SetProgrammingTime
1937                     	xdef	_FLASH_GetProgrammingTime
1938                     	xref.b	c_lreg
1939                     	xref.b	c_x
1958                     	xref	c_lzmp
1959                     	xref	c_lgsbc
1960                     	xref	c_ladd
1961                     	xref	c_lgadd
1962                     	xref	c_cmulx
1963                     	xref	c_ltor
1964                     	end
