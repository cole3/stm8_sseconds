   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 152                     ; 142 void USART_DeInit(USART_TypeDef* USARTx)
 152                     ; 143 {
 154                     .text:	section	.text,new
 155  0000               _USART_DeInit:
 157  0000 89            	pushw	x
 158       00000000      OFST:	set	0
 161                     ; 147   (void) USARTx->SR;
 163  0001 f6            	ld	a,(x)
 164  0002 97            	ld	xl,a
 165                     ; 148   (void) USARTx->DR;
 167  0003 1e01          	ldw	x,(OFST+1,sp)
 168  0005 e601          	ld	a,(1,x)
 169  0007 97            	ld	xl,a
 170                     ; 150   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 172  0008 1e01          	ldw	x,(OFST+1,sp)
 173  000a 6f03          	clr	(3,x)
 174                     ; 151   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 176  000c 1e01          	ldw	x,(OFST+1,sp)
 177  000e 6f02          	clr	(2,x)
 178                     ; 153   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 180  0010 1e01          	ldw	x,(OFST+1,sp)
 181  0012 6f04          	clr	(4,x)
 182                     ; 154   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 184  0014 1e01          	ldw	x,(OFST+1,sp)
 185  0016 6f05          	clr	(5,x)
 186                     ; 155   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 188  0018 1e01          	ldw	x,(OFST+1,sp)
 189  001a 6f06          	clr	(6,x)
 190                     ; 156   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 192  001c 1e01          	ldw	x,(OFST+1,sp)
 193  001e 6f07          	clr	(7,x)
 194                     ; 157 }
 197  0020 85            	popw	x
 198  0021 81            	ret
 386                     ; 186 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 386                     ; 187                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 386                     ; 188                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 386                     ; 189 {
 387                     .text:	section	.text,new
 388  0000               _USART_Init:
 390  0000 89            	pushw	x
 391  0001 5204          	subw	sp,#4
 392       00000004      OFST:	set	4
 395                     ; 190   uint32_t BaudRate_Mantissa = 0;
 397  0003 ae0000        	ldw	x,#0
 398  0006 1f03          	ldw	(OFST-1,sp),x
 399  0008 ae0000        	ldw	x,#0
 400  000b 1f01          	ldw	(OFST-3,sp),x
 401                     ; 193   assert_param(IS_USART_BAUDRATE(BaudRate));
 403                     ; 195   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 405                     ; 197   assert_param(IS_USART_STOPBITS(USART_StopBits));
 407                     ; 199   assert_param(IS_USART_PARITY(USART_Parity));
 409                     ; 201   assert_param(IS_USART_MODE(USART_Mode));
 411                     ; 204   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 413  000d 1e05          	ldw	x,(OFST+1,sp)
 414  000f e604          	ld	a,(4,x)
 415  0011 a4e9          	and	a,#233
 416  0013 e704          	ld	(4,x),a
 417                     ; 207   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 419  0015 1e05          	ldw	x,(OFST+1,sp)
 420  0017 7b0d          	ld	a,(OFST+9,sp)
 421  0019 1a0f          	or	a,(OFST+11,sp)
 422  001b ea04          	or	a,(4,x)
 423  001d e704          	ld	(4,x),a
 424                     ; 210   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 426  001f 1e05          	ldw	x,(OFST+1,sp)
 427  0021 e606          	ld	a,(6,x)
 428  0023 a4cf          	and	a,#207
 429  0025 e706          	ld	(6,x),a
 430                     ; 212   USARTx->CR3 |= (uint8_t)USART_StopBits;
 432  0027 1e05          	ldw	x,(OFST+1,sp)
 433  0029 e606          	ld	a,(6,x)
 434  002b 1a0e          	or	a,(OFST+10,sp)
 435  002d e706          	ld	(6,x),a
 436                     ; 215   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 438  002f 1e05          	ldw	x,(OFST+1,sp)
 439  0031 6f02          	clr	(2,x)
 440                     ; 217   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 442  0033 1e05          	ldw	x,(OFST+1,sp)
 443  0035 e603          	ld	a,(3,x)
 444  0037 a40f          	and	a,#15
 445  0039 e703          	ld	(3,x),a
 446                     ; 219   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 448  003b 1e05          	ldw	x,(OFST+1,sp)
 449  003d e603          	ld	a,(3,x)
 450  003f a4f0          	and	a,#240
 451  0041 e703          	ld	(3,x),a
 452                     ; 221   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 454  0043 cd0000        	call	_CLK_GetClockFreq
 456  0046 96            	ldw	x,sp
 457  0047 1c0009        	addw	x,#OFST+5
 458  004a cd0000        	call	c_ludv
 460  004d 96            	ldw	x,sp
 461  004e 1c0001        	addw	x,#OFST-3
 462  0051 cd0000        	call	c_rtol
 464                     ; 223   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 466  0054 7b03          	ld	a,(OFST-1,sp)
 467  0056 a4f0          	and	a,#240
 468  0058 1e05          	ldw	x,(OFST+1,sp)
 469  005a e703          	ld	(3,x),a
 470                     ; 225   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 472  005c 1e05          	ldw	x,(OFST+1,sp)
 473  005e 7b04          	ld	a,(OFST+0,sp)
 474  0060 a40f          	and	a,#15
 475  0062 ea03          	or	a,(3,x)
 476  0064 e703          	ld	(3,x),a
 477                     ; 227   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 479  0066 96            	ldw	x,sp
 480  0067 1c0001        	addw	x,#OFST-3
 481  006a cd0000        	call	c_ltor
 483  006d a604          	ld	a,#4
 484  006f cd0000        	call	c_lursh
 486  0072 b603          	ld	a,c_lreg+3
 487  0074 1e05          	ldw	x,(OFST+1,sp)
 488  0076 e702          	ld	(2,x),a
 489                     ; 230   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 491  0078 1e05          	ldw	x,(OFST+1,sp)
 492  007a e605          	ld	a,(5,x)
 493  007c a4f3          	and	a,#243
 494  007e e705          	ld	(5,x),a
 495                     ; 232   USARTx->CR2 |= (uint8_t)USART_Mode;
 497  0080 1e05          	ldw	x,(OFST+1,sp)
 498  0082 e605          	ld	a,(5,x)
 499  0084 1a10          	or	a,(OFST+12,sp)
 500  0086 e705          	ld	(5,x),a
 501                     ; 233 }
 504  0088 5b06          	addw	sp,#6
 505  008a 81            	ret
 665                     ; 258 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 665                     ; 259                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 665                     ; 260                      USART_LastBit_TypeDef USART_LastBit)
 665                     ; 261 {
 666                     .text:	section	.text,new
 667  0000               _USART_ClockInit:
 669  0000 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 263   assert_param(IS_USART_CLOCK(USART_Clock));
 675                     ; 264   assert_param(IS_USART_CPOL(USART_CPOL));
 677                     ; 265   assert_param(IS_USART_CPHA(USART_CPHA));
 679                     ; 266   assert_param(IS_USART_LASTBIT(USART_LastBit));
 681                     ; 269   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 683  0001 e606          	ld	a,(6,x)
 684  0003 a4f8          	and	a,#248
 685  0005 e706          	ld	(6,x),a
 686                     ; 271   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 688  0007 7b06          	ld	a,(OFST+6,sp)
 689  0009 1a07          	or	a,(OFST+7,sp)
 690  000b 1a08          	or	a,(OFST+8,sp)
 691  000d ea06          	or	a,(6,x)
 692  000f e706          	ld	(6,x),a
 693                     ; 273   if (USART_Clock != USART_Clock_Disable)
 695  0011 0d05          	tnz	(OFST+5,sp)
 696  0013 2708          	jreq	L123
 697                     ; 275     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 699  0015 e606          	ld	a,(6,x)
 700  0017 aa08          	or	a,#8
 701  0019 e706          	ld	(6,x),a
 703  001b 2008          	jra	L323
 704  001d               L123:
 705                     ; 279     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 707  001d 1e01          	ldw	x,(OFST+1,sp)
 708  001f e606          	ld	a,(6,x)
 709  0021 a4f7          	and	a,#247
 710  0023 e706          	ld	(6,x),a
 711  0025               L323:
 712                     ; 281 }
 715  0025 85            	popw	x
 716  0026 81            	ret
 783                     ; 290 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 783                     ; 291 {
 784                     .text:	section	.text,new
 785  0000               _USART_Cmd:
 787  0000 89            	pushw	x
 788       00000000      OFST:	set	0
 791                     ; 292   if (NewState != DISABLE)
 793  0001 0d05          	tnz	(OFST+5,sp)
 794  0003 2708          	jreq	L163
 795                     ; 294     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 797  0005 e604          	ld	a,(4,x)
 798  0007 a4df          	and	a,#223
 799  0009 e704          	ld	(4,x),a
 801  000b 2008          	jra	L363
 802  000d               L163:
 803                     ; 298     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 805  000d 1e01          	ldw	x,(OFST+1,sp)
 806  000f e604          	ld	a,(4,x)
 807  0011 aa20          	or	a,#32
 808  0013 e704          	ld	(4,x),a
 809  0015               L363:
 810                     ; 300 }
 813  0015 85            	popw	x
 814  0016 81            	ret
 858                     ; 323 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 858                     ; 324 {
 859                     .text:	section	.text,new
 860  0000               _USART_SetPrescaler:
 862  0000 89            	pushw	x
 863       00000000      OFST:	set	0
 866                     ; 326   USARTx->PSCR = USART_Prescaler;
 868  0001 7b05          	ld	a,(OFST+5,sp)
 869  0003 1e01          	ldw	x,(OFST+1,sp)
 870  0005 e70a          	ld	(10,x),a
 871                     ; 327 }
 874  0007 85            	popw	x
 875  0008 81            	ret
 912                     ; 334 void USART_SendBreak(USART_TypeDef* USARTx)
 912                     ; 335 {
 913                     .text:	section	.text,new
 914  0000               _USART_SendBreak:
 918                     ; 336   USARTx->CR2 |= USART_CR2_SBK;
 920  0000 e605          	ld	a,(5,x)
 921  0002 aa01          	or	a,#1
 922  0004 e705          	ld	(5,x),a
 923                     ; 337 }
 926  0006 81            	ret
 963                     ; 376 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 963                     ; 377 {
 964                     .text:	section	.text,new
 965  0000               _USART_ReceiveData8:
 969                     ; 378   return USARTx->DR;
 971  0000 e601          	ld	a,(1,x)
 974  0002 81            	ret
1018                     ; 386 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1018                     ; 387 {
1019                     .text:	section	.text,new
1020  0000               _USART_ReceiveData9:
1022  0000 89            	pushw	x
1023  0001 89            	pushw	x
1024       00000002      OFST:	set	2
1027                     ; 388   uint16_t temp = 0;
1029  0002 5f            	clrw	x
1030  0003 1f01          	ldw	(OFST-1,sp),x
1031                     ; 390   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1033  0005 1e03          	ldw	x,(OFST+1,sp)
1034  0007 e604          	ld	a,(4,x)
1035  0009 5f            	clrw	x
1036  000a a480          	and	a,#128
1037  000c 5f            	clrw	x
1038  000d 02            	rlwa	x,a
1039  000e 58            	sllw	x
1040  000f 1f01          	ldw	(OFST-1,sp),x
1041                     ; 391   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1043  0011 1e03          	ldw	x,(OFST+1,sp)
1044  0013 e601          	ld	a,(1,x)
1045  0015 5f            	clrw	x
1046  0016 97            	ld	xl,a
1047  0017 01            	rrwa	x,a
1048  0018 1a02          	or	a,(OFST+0,sp)
1049  001a 01            	rrwa	x,a
1050  001b 1a01          	or	a,(OFST-1,sp)
1051  001d 01            	rrwa	x,a
1052  001e 01            	rrwa	x,a
1053  001f a4ff          	and	a,#255
1054  0021 01            	rrwa	x,a
1055  0022 a401          	and	a,#1
1056  0024 01            	rrwa	x,a
1059  0025 5b04          	addw	sp,#4
1060  0027 81            	ret
1104                     ; 399 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1104                     ; 400 {
1105                     .text:	section	.text,new
1106  0000               _USART_SendData8:
1108  0000 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 402   USARTx->DR = Data;
1114  0001 7b05          	ld	a,(OFST+5,sp)
1115  0003 1e01          	ldw	x,(OFST+1,sp)
1116  0005 e701          	ld	(1,x),a
1117                     ; 403 }
1120  0007 85            	popw	x
1121  0008 81            	ret
1165                     ; 412 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1165                     ; 413 {
1166                     .text:	section	.text,new
1167  0000               _USART_SendData9:
1169  0000 89            	pushw	x
1170       00000000      OFST:	set	0
1173                     ; 414   assert_param(IS_USART_DATA_9BITS(Data));
1175                     ; 417   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1177  0001 e604          	ld	a,(4,x)
1178  0003 a4bf          	and	a,#191
1179  0005 e704          	ld	(4,x),a
1180                     ; 420   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1182  0007 1605          	ldw	y,(OFST+5,sp)
1183  0009 9054          	srlw	y
1184  000b 9054          	srlw	y
1185  000d 909f          	ld	a,yl
1186  000f a440          	and	a,#64
1187  0011 ea04          	or	a,(4,x)
1188  0013 e704          	ld	(4,x),a
1189                     ; 423   USARTx->DR   = (uint8_t)(Data);
1191  0015 7b06          	ld	a,(OFST+6,sp)
1192  0017 1e01          	ldw	x,(OFST+1,sp)
1193  0019 e701          	ld	(1,x),a
1194                     ; 424 }
1197  001b 85            	popw	x
1198  001c 81            	ret
1246                     ; 467 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1246                     ; 468 {
1247                     .text:	section	.text,new
1248  0000               _USART_ReceiverWakeUpCmd:
1250  0000 89            	pushw	x
1251       00000000      OFST:	set	0
1254                     ; 469   assert_param(IS_FUNCTIONAL_STATE(NewState));
1256                     ; 471   if (NewState != DISABLE)
1258  0001 0d05          	tnz	(OFST+5,sp)
1259  0003 2708          	jreq	L165
1260                     ; 474     USARTx->CR2 |= USART_CR2_RWU;
1262  0005 e605          	ld	a,(5,x)
1263  0007 aa02          	or	a,#2
1264  0009 e705          	ld	(5,x),a
1266  000b 2008          	jra	L365
1267  000d               L165:
1268                     ; 479     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1270  000d 1e01          	ldw	x,(OFST+1,sp)
1271  000f e605          	ld	a,(5,x)
1272  0011 a4fd          	and	a,#253
1273  0013 e705          	ld	(5,x),a
1274  0015               L365:
1275                     ; 481 }
1278  0015 85            	popw	x
1279  0016 81            	ret
1323                     ; 490 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1323                     ; 491 {
1324                     .text:	section	.text,new
1325  0000               _USART_SetAddress:
1327  0000 89            	pushw	x
1328       00000000      OFST:	set	0
1331                     ; 493   assert_param(IS_USART_ADDRESS(USART_Address));
1333                     ; 496   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1335  0001 e607          	ld	a,(7,x)
1336  0003 a4f0          	and	a,#240
1337  0005 e707          	ld	(7,x),a
1338                     ; 498   USARTx->CR4 |= USART_Address;
1340  0007 e607          	ld	a,(7,x)
1341  0009 1a05          	or	a,(OFST+5,sp)
1342  000b e707          	ld	(7,x),a
1343                     ; 499 }
1346  000d 85            	popw	x
1347  000e 81            	ret
1416                     ; 509 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1416                     ; 510 {
1417                     .text:	section	.text,new
1418  0000               _USART_WakeUpConfig:
1420  0000 89            	pushw	x
1421       00000000      OFST:	set	0
1424                     ; 511   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1426                     ; 513   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1428  0001 e604          	ld	a,(4,x)
1429  0003 a4f7          	and	a,#247
1430  0005 e704          	ld	(4,x),a
1431                     ; 514   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1433  0007 e604          	ld	a,(4,x)
1434  0009 1a05          	or	a,(OFST+5,sp)
1435  000b e704          	ld	(4,x),a
1436                     ; 515 }
1439  000d 85            	popw	x
1440  000e 81            	ret
1488                     ; 560 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1488                     ; 561 {
1489                     .text:	section	.text,new
1490  0000               _USART_HalfDuplexCmd:
1492  0000 89            	pushw	x
1493       00000000      OFST:	set	0
1496                     ; 562   assert_param(IS_FUNCTIONAL_STATE(NewState));
1498                     ; 564   if (NewState != DISABLE)
1500  0001 0d05          	tnz	(OFST+5,sp)
1501  0003 2708          	jreq	L766
1502                     ; 566     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1504  0005 e608          	ld	a,(8,x)
1505  0007 aa08          	or	a,#8
1506  0009 e708          	ld	(8,x),a
1508  000b 2008          	jra	L176
1509  000d               L766:
1510                     ; 570     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1512  000d 1e01          	ldw	x,(OFST+1,sp)
1513  000f e608          	ld	a,(8,x)
1514  0011 a4f7          	and	a,#247
1515  0013 e708          	ld	(8,x),a
1516  0015               L176:
1517                     ; 572 }
1520  0015 85            	popw	x
1521  0016 81            	ret
1568                     ; 638 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1568                     ; 639 {
1569                     .text:	section	.text,new
1570  0000               _USART_SmartCardCmd:
1572  0000 89            	pushw	x
1573       00000000      OFST:	set	0
1576                     ; 640   assert_param(IS_FUNCTIONAL_STATE(NewState));
1578                     ; 642   if (NewState != DISABLE)
1580  0001 0d05          	tnz	(OFST+5,sp)
1581  0003 2708          	jreq	L717
1582                     ; 645     USARTx->CR5 |= USART_CR5_SCEN;
1584  0005 e608          	ld	a,(8,x)
1585  0007 aa20          	or	a,#32
1586  0009 e708          	ld	(8,x),a
1588  000b 2008          	jra	L127
1589  000d               L717:
1590                     ; 650     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1592  000d 1e01          	ldw	x,(OFST+1,sp)
1593  000f e608          	ld	a,(8,x)
1594  0011 a4df          	and	a,#223
1595  0013 e708          	ld	(8,x),a
1596  0015               L127:
1597                     ; 652 }
1600  0015 85            	popw	x
1601  0016 81            	ret
1649                     ; 661 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1649                     ; 662 {
1650                     .text:	section	.text,new
1651  0000               _USART_SmartCardNACKCmd:
1653  0000 89            	pushw	x
1654       00000000      OFST:	set	0
1657                     ; 663   assert_param(IS_FUNCTIONAL_STATE(NewState));
1659                     ; 665   if (NewState != DISABLE)
1661  0001 0d05          	tnz	(OFST+5,sp)
1662  0003 2708          	jreq	L747
1663                     ; 668     USARTx->CR5 |= USART_CR5_NACK;
1665  0005 e608          	ld	a,(8,x)
1666  0007 aa10          	or	a,#16
1667  0009 e708          	ld	(8,x),a
1669  000b 2008          	jra	L157
1670  000d               L747:
1671                     ; 673     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1673  000d 1e01          	ldw	x,(OFST+1,sp)
1674  000f e608          	ld	a,(8,x)
1675  0011 a4ef          	and	a,#239
1676  0013 e708          	ld	(8,x),a
1677  0015               L157:
1678                     ; 675 }
1681  0015 85            	popw	x
1682  0016 81            	ret
1726                     ; 684 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1726                     ; 685 {
1727                     .text:	section	.text,new
1728  0000               _USART_SetGuardTime:
1730  0000 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 687   USARTx->GTR = USART_GuardTime;
1736  0001 7b05          	ld	a,(OFST+5,sp)
1737  0003 1e01          	ldw	x,(OFST+1,sp)
1738  0005 e709          	ld	(9,x),a
1739                     ; 688 }
1742  0007 85            	popw	x
1743  0008 81            	ret
1812                     ; 745 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1812                     ; 746 {
1813                     .text:	section	.text,new
1814  0000               _USART_IrDAConfig:
1816  0000 89            	pushw	x
1817       00000000      OFST:	set	0
1820                     ; 747   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1822                     ; 749   if (USART_IrDAMode != USART_IrDAMode_Normal)
1824  0001 0d05          	tnz	(OFST+5,sp)
1825  0003 2708          	jreq	L1301
1826                     ; 751     USARTx->CR5 |= USART_CR5_IRLP;
1828  0005 e608          	ld	a,(8,x)
1829  0007 aa04          	or	a,#4
1830  0009 e708          	ld	(8,x),a
1832  000b 2008          	jra	L3301
1833  000d               L1301:
1834                     ; 755     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1836  000d 1e01          	ldw	x,(OFST+1,sp)
1837  000f e608          	ld	a,(8,x)
1838  0011 a4fb          	and	a,#251
1839  0013 e708          	ld	(8,x),a
1840  0015               L3301:
1841                     ; 757 }
1844  0015 85            	popw	x
1845  0016 81            	ret
1892                     ; 766 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1892                     ; 767 {
1893                     .text:	section	.text,new
1894  0000               _USART_IrDACmd:
1896  0000 89            	pushw	x
1897       00000000      OFST:	set	0
1900                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
1902                     ; 772   if (NewState != DISABLE)
1904  0001 0d05          	tnz	(OFST+5,sp)
1905  0003 2708          	jreq	L1601
1906                     ; 775     USARTx->CR5 |= USART_CR5_IREN;
1908  0005 e608          	ld	a,(8,x)
1909  0007 aa02          	or	a,#2
1910  0009 e708          	ld	(8,x),a
1912  000b 2008          	jra	L3601
1913  000d               L1601:
1914                     ; 780     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1916  000d 1e01          	ldw	x,(OFST+1,sp)
1917  000f e608          	ld	a,(8,x)
1918  0011 a4fd          	and	a,#253
1919  0013 e708          	ld	(8,x),a
1920  0015               L3601:
1921                     ; 782 }
1924  0015 85            	popw	x
1925  0016 81            	ret
2002                     ; 812 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2002                     ; 813                   FunctionalState NewState)
2002                     ; 814 {
2003                     .text:	section	.text,new
2004  0000               _USART_DMACmd:
2006  0000 89            	pushw	x
2007       00000000      OFST:	set	0
2010                     ; 816   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2012                     ; 817   assert_param(IS_FUNCTIONAL_STATE(NewState));
2014                     ; 819   if (NewState != DISABLE)
2016  0001 0d06          	tnz	(OFST+6,sp)
2017  0003 2708          	jreq	L5211
2018                     ; 823     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2020  0005 e608          	ld	a,(8,x)
2021  0007 1a05          	or	a,(OFST+5,sp)
2022  0009 e708          	ld	(8,x),a
2024  000b 2009          	jra	L7211
2025  000d               L5211:
2026                     ; 829     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2028  000d 1e01          	ldw	x,(OFST+1,sp)
2029  000f 7b05          	ld	a,(OFST+5,sp)
2030  0011 43            	cpl	a
2031  0012 e408          	and	a,(8,x)
2032  0014 e708          	ld	(8,x),a
2033  0016               L7211:
2034                     ; 831 }
2037  0016 85            	popw	x
2038  0017 81            	ret
2178                     ; 933 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2178                     ; 934 {
2179                     .text:	section	.text,new
2180  0000               _USART_ITConfig:
2182  0000 89            	pushw	x
2183  0001 89            	pushw	x
2184       00000002      OFST:	set	2
2187                     ; 935   uint8_t usartreg, itpos = 0x00;
2189  0002 7b02          	ld	a,(OFST+0,sp)
2190  0004 97            	ld	xl,a
2191                     ; 936   assert_param(IS_USART_CONFIG_IT(USART_IT));
2193                     ; 937   assert_param(IS_FUNCTIONAL_STATE(NewState));
2195                     ; 940   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2197  0005 7b07          	ld	a,(OFST+5,sp)
2198  0007 6b01          	ld	(OFST-1,sp),a
2199                     ; 942   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2201  0009 7b08          	ld	a,(OFST+6,sp)
2202  000b a40f          	and	a,#15
2203  000d 5f            	clrw	x
2204  000e 97            	ld	xl,a
2205  000f a601          	ld	a,#1
2206  0011 5d            	tnzw	x
2207  0012 2704          	jreq	L65
2208  0014               L06:
2209  0014 48            	sll	a
2210  0015 5a            	decw	x
2211  0016 26fc          	jrne	L06
2212  0018               L65:
2213  0018 6b02          	ld	(OFST+0,sp),a
2214                     ; 944   if (NewState != DISABLE)
2216  001a 0d09          	tnz	(OFST+7,sp)
2217  001c 272a          	jreq	L3121
2218                     ; 947     if (usartreg == 0x01)
2220  001e 7b01          	ld	a,(OFST-1,sp)
2221  0020 a101          	cp	a,#1
2222  0022 260a          	jrne	L5121
2223                     ; 949       USARTx->CR1 |= itpos;
2225  0024 1e03          	ldw	x,(OFST+1,sp)
2226  0026 e604          	ld	a,(4,x)
2227  0028 1a02          	or	a,(OFST+0,sp)
2228  002a e704          	ld	(4,x),a
2230  002c 2045          	jra	L5221
2231  002e               L5121:
2232                     ; 951     else if (usartreg == 0x05)
2234  002e 7b01          	ld	a,(OFST-1,sp)
2235  0030 a105          	cp	a,#5
2236  0032 260a          	jrne	L1221
2237                     ; 953       USARTx->CR5 |= itpos;
2239  0034 1e03          	ldw	x,(OFST+1,sp)
2240  0036 e608          	ld	a,(8,x)
2241  0038 1a02          	or	a,(OFST+0,sp)
2242  003a e708          	ld	(8,x),a
2244  003c 2035          	jra	L5221
2245  003e               L1221:
2246                     ; 958       USARTx->CR2 |= itpos;
2248  003e 1e03          	ldw	x,(OFST+1,sp)
2249  0040 e605          	ld	a,(5,x)
2250  0042 1a02          	or	a,(OFST+0,sp)
2251  0044 e705          	ld	(5,x),a
2252  0046 202b          	jra	L5221
2253  0048               L3121:
2254                     ; 964     if (usartreg == 0x01)
2256  0048 7b01          	ld	a,(OFST-1,sp)
2257  004a a101          	cp	a,#1
2258  004c 260b          	jrne	L7221
2259                     ; 966       USARTx->CR1 &= (uint8_t)(~itpos);
2261  004e 1e03          	ldw	x,(OFST+1,sp)
2262  0050 7b02          	ld	a,(OFST+0,sp)
2263  0052 43            	cpl	a
2264  0053 e404          	and	a,(4,x)
2265  0055 e704          	ld	(4,x),a
2267  0057 201a          	jra	L5221
2268  0059               L7221:
2269                     ; 968     else if (usartreg == 0x05)
2271  0059 7b01          	ld	a,(OFST-1,sp)
2272  005b a105          	cp	a,#5
2273  005d 260b          	jrne	L3321
2274                     ; 970       USARTx->CR5 &= (uint8_t)(~itpos);
2276  005f 1e03          	ldw	x,(OFST+1,sp)
2277  0061 7b02          	ld	a,(OFST+0,sp)
2278  0063 43            	cpl	a
2279  0064 e408          	and	a,(8,x)
2280  0066 e708          	ld	(8,x),a
2282  0068 2009          	jra	L5221
2283  006a               L3321:
2284                     ; 975       USARTx->CR2 &= (uint8_t)(~itpos);
2286  006a 1e03          	ldw	x,(OFST+1,sp)
2287  006c 7b02          	ld	a,(OFST+0,sp)
2288  006e 43            	cpl	a
2289  006f e405          	and	a,(5,x)
2290  0071 e705          	ld	(5,x),a
2291  0073               L5221:
2292                     ; 978 }
2295  0073 5b04          	addw	sp,#4
2296  0075 81            	ret
2444                     ; 996 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2444                     ; 997 {
2445                     .text:	section	.text,new
2446  0000               _USART_GetFlagStatus:
2448  0000 89            	pushw	x
2449  0001 88            	push	a
2450       00000001      OFST:	set	1
2453                     ; 998   FlagStatus status = RESET;
2455  0002 0f01          	clr	(OFST+0,sp)
2456                     ; 1001   assert_param(IS_USART_FLAG(USART_FLAG));
2458                     ; 1003   if (USART_FLAG == USART_FLAG_SBK)
2460  0004 1e06          	ldw	x,(OFST+5,sp)
2461  0006 a30101        	cpw	x,#257
2462  0009 2612          	jrne	L5231
2463                     ; 1005     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2465  000b 1e02          	ldw	x,(OFST+1,sp)
2466  000d e605          	ld	a,(5,x)
2467  000f 1507          	bcp	a,(OFST+6,sp)
2468  0011 2706          	jreq	L7231
2469                     ; 1008       status = SET;
2471  0013 a601          	ld	a,#1
2472  0015 6b01          	ld	(OFST+0,sp),a
2474  0017 2013          	jra	L3331
2475  0019               L7231:
2476                     ; 1013       status = RESET;
2478  0019 0f01          	clr	(OFST+0,sp)
2479  001b 200f          	jra	L3331
2480  001d               L5231:
2481                     ; 1018     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2483  001d 1e02          	ldw	x,(OFST+1,sp)
2484  001f f6            	ld	a,(x)
2485  0020 1507          	bcp	a,(OFST+6,sp)
2486  0022 2706          	jreq	L5331
2487                     ; 1021       status = SET;
2489  0024 a601          	ld	a,#1
2490  0026 6b01          	ld	(OFST+0,sp),a
2492  0028 2002          	jra	L3331
2493  002a               L5331:
2494                     ; 1026       status = RESET;
2496  002a 0f01          	clr	(OFST+0,sp)
2497  002c               L3331:
2498                     ; 1030   return status;
2500  002c 7b01          	ld	a,(OFST+0,sp)
2503  002e 5b03          	addw	sp,#3
2504  0030 81            	ret
2551                     ; 1054 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2551                     ; 1055 {
2552                     .text:	section	.text,new
2553  0000               _USART_ClearFlag:
2555  0000 89            	pushw	x
2556       00000000      OFST:	set	0
2559                     ; 1057   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2561                     ; 1059   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2563  0001 7b06          	ld	a,(OFST+6,sp)
2564  0003 43            	cpl	a
2565  0004 1e01          	ldw	x,(OFST+1,sp)
2566  0006 f7            	ld	(x),a
2567                     ; 1060 }
2570  0007 85            	popw	x
2571  0008 81            	ret
2664                     ; 1077 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2664                     ; 1078 {
2665                     .text:	section	.text,new
2666  0000               _USART_GetITStatus:
2668  0000 89            	pushw	x
2669  0001 5203          	subw	sp,#3
2670       00000003      OFST:	set	3
2673                     ; 1079   ITStatus pendingbitstatus = RESET;
2675  0003 7b03          	ld	a,(OFST+0,sp)
2676  0005 97            	ld	xl,a
2677                     ; 1080   uint8_t temp = 0;
2679  0006 7b01          	ld	a,(OFST-2,sp)
2680  0008 97            	ld	xl,a
2681                     ; 1081   uint8_t itpos = 0;
2683  0009 7b02          	ld	a,(OFST-1,sp)
2684  000b 97            	ld	xl,a
2685                     ; 1082   uint8_t itmask1 = 0;
2687  000c 7b03          	ld	a,(OFST+0,sp)
2688  000e 97            	ld	xl,a
2689                     ; 1083   uint8_t itmask2 = 0;
2691  000f 7b03          	ld	a,(OFST+0,sp)
2692  0011 97            	ld	xl,a
2693                     ; 1084   uint8_t enablestatus = 0;
2695  0012 7b03          	ld	a,(OFST+0,sp)
2696  0014 97            	ld	xl,a
2697                     ; 1087   assert_param(IS_USART_GET_IT(USART_IT));
2699                     ; 1090   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2701  0015 7b09          	ld	a,(OFST+6,sp)
2702  0017 a40f          	and	a,#15
2703  0019 5f            	clrw	x
2704  001a 97            	ld	xl,a
2705  001b a601          	ld	a,#1
2706  001d 5d            	tnzw	x
2707  001e 2704          	jreq	L07
2708  0020               L27:
2709  0020 48            	sll	a
2710  0021 5a            	decw	x
2711  0022 26fc          	jrne	L27
2712  0024               L07:
2713  0024 6b02          	ld	(OFST-1,sp),a
2714                     ; 1092   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2716  0026 7b09          	ld	a,(OFST+6,sp)
2717  0028 4e            	swap	a
2718  0029 a40f          	and	a,#15
2719  002b 6b03          	ld	(OFST+0,sp),a
2720                     ; 1094   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2722  002d 7b03          	ld	a,(OFST+0,sp)
2723  002f 5f            	clrw	x
2724  0030 97            	ld	xl,a
2725  0031 a601          	ld	a,#1
2726  0033 5d            	tnzw	x
2727  0034 2704          	jreq	L47
2728  0036               L67:
2729  0036 48            	sll	a
2730  0037 5a            	decw	x
2731  0038 26fc          	jrne	L67
2732  003a               L47:
2733  003a 6b03          	ld	(OFST+0,sp),a
2734                     ; 1097   if (USART_IT == USART_IT_PE)
2736  003c 1e08          	ldw	x,(OFST+5,sp)
2737  003e a30100        	cpw	x,#256
2738  0041 261d          	jrne	L7241
2739                     ; 1100     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2741  0043 1e04          	ldw	x,(OFST+1,sp)
2742  0045 e604          	ld	a,(4,x)
2743  0047 1403          	and	a,(OFST+0,sp)
2744  0049 6b03          	ld	(OFST+0,sp),a
2745                     ; 1103     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2747  004b 1e04          	ldw	x,(OFST+1,sp)
2748  004d f6            	ld	a,(x)
2749  004e 1502          	bcp	a,(OFST-1,sp)
2750  0050 270a          	jreq	L1341
2752  0052 0d03          	tnz	(OFST+0,sp)
2753  0054 2706          	jreq	L1341
2754                     ; 1106       pendingbitstatus = SET;
2756  0056 a601          	ld	a,#1
2757  0058 6b03          	ld	(OFST+0,sp),a
2759  005a 204f          	jra	L5341
2760  005c               L1341:
2761                     ; 1111       pendingbitstatus = RESET;
2763  005c 0f03          	clr	(OFST+0,sp)
2764  005e 204b          	jra	L5341
2765  0060               L7241:
2766                     ; 1115   else if (USART_IT == USART_IT_OR)
2768  0060 1e08          	ldw	x,(OFST+5,sp)
2769  0062 a30235        	cpw	x,#565
2770  0065 2629          	jrne	L7341
2771                     ; 1118     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2773  0067 1e04          	ldw	x,(OFST+1,sp)
2774  0069 e605          	ld	a,(5,x)
2775  006b 1403          	and	a,(OFST+0,sp)
2776  006d 6b03          	ld	(OFST+0,sp),a
2777                     ; 1121     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2779  006f 1e04          	ldw	x,(OFST+1,sp)
2780  0071 e608          	ld	a,(8,x)
2781  0073 a401          	and	a,#1
2782  0075 6b01          	ld	(OFST-2,sp),a
2783                     ; 1123     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2785  0077 1e04          	ldw	x,(OFST+1,sp)
2786  0079 f6            	ld	a,(x)
2787  007a 1502          	bcp	a,(OFST-1,sp)
2788  007c 270e          	jreq	L1441
2790  007e 0d03          	tnz	(OFST+0,sp)
2791  0080 2604          	jrne	L3441
2793  0082 0d01          	tnz	(OFST-2,sp)
2794  0084 2706          	jreq	L1441
2795  0086               L3441:
2796                     ; 1126       pendingbitstatus = SET;
2798  0086 a601          	ld	a,#1
2799  0088 6b03          	ld	(OFST+0,sp),a
2801  008a 201f          	jra	L5341
2802  008c               L1441:
2803                     ; 1131       pendingbitstatus = RESET;
2805  008c 0f03          	clr	(OFST+0,sp)
2806  008e 201b          	jra	L5341
2807  0090               L7341:
2808                     ; 1138     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2810  0090 1e04          	ldw	x,(OFST+1,sp)
2811  0092 e605          	ld	a,(5,x)
2812  0094 1403          	and	a,(OFST+0,sp)
2813  0096 6b03          	ld	(OFST+0,sp),a
2814                     ; 1140     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2816  0098 1e04          	ldw	x,(OFST+1,sp)
2817  009a f6            	ld	a,(x)
2818  009b 1502          	bcp	a,(OFST-1,sp)
2819  009d 270a          	jreq	L1541
2821  009f 0d03          	tnz	(OFST+0,sp)
2822  00a1 2706          	jreq	L1541
2823                     ; 1143       pendingbitstatus = SET;
2825  00a3 a601          	ld	a,#1
2826  00a5 6b03          	ld	(OFST+0,sp),a
2828  00a7 2002          	jra	L5341
2829  00a9               L1541:
2830                     ; 1148       pendingbitstatus = RESET;
2832  00a9 0f03          	clr	(OFST+0,sp)
2833  00ab               L5341:
2834                     ; 1153   return  pendingbitstatus;
2836  00ab 7b03          	ld	a,(OFST+0,sp)
2839  00ad 5b05          	addw	sp,#5
2840  00af 81            	ret
2902                     ; 1178 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2902                     ; 1179 {
2903                     .text:	section	.text,new
2904  0000               _USART_ClearITPendingBit:
2906  0000 89            	pushw	x
2907  0001 88            	push	a
2908       00000001      OFST:	set	1
2911                     ; 1180   uint8_t bitpos = 0x00, itmask = 0x00;
2913  0002 7b01          	ld	a,(OFST+0,sp)
2914  0004 97            	ld	xl,a
2917  0005 7b01          	ld	a,(OFST+0,sp)
2918  0007 97            	ld	xl,a
2919                     ; 1181   assert_param(IS_USART_CLEAR_IT(USART_IT));
2921                     ; 1182   bitpos = (uint8_t)( (uint8_t)((uint8_t)USART_IT & (uint8_t)0xF0) >> 0x04);
2923  0008 7b07          	ld	a,(OFST+6,sp)
2924  000a a4f0          	and	a,#240
2925  000c 4e            	swap	a
2926  000d a40f          	and	a,#15
2927  000f 6b01          	ld	(OFST+0,sp),a
2928                     ; 1183   itmask = (uint8_t)( (uint8_t)0x01 << bitpos);
2930  0011 7b01          	ld	a,(OFST+0,sp)
2931  0013 5f            	clrw	x
2932  0014 97            	ld	xl,a
2933  0015 a601          	ld	a,#1
2934  0017 5d            	tnzw	x
2935  0018 2704          	jreq	L201
2936  001a               L401:
2937  001a 48            	sll	a
2938  001b 5a            	decw	x
2939  001c 26fc          	jrne	L401
2940  001e               L201:
2941  001e 6b01          	ld	(OFST+0,sp),a
2942                     ; 1185   USARTx->SR = (uint8_t)~itmask;
2944  0020 7b01          	ld	a,(OFST+0,sp)
2945  0022 43            	cpl	a
2946  0023 1e02          	ldw	x,(OFST+1,sp)
2947  0025 f7            	ld	(x),a
2948                     ; 1186 }
2951  0026 5b03          	addw	sp,#3
2952  0028 81            	ret
2965                     	xdef	_USART_ClearITPendingBit
2966                     	xdef	_USART_GetITStatus
2967                     	xdef	_USART_ClearFlag
2968                     	xdef	_USART_GetFlagStatus
2969                     	xdef	_USART_ITConfig
2970                     	xdef	_USART_DMACmd
2971                     	xdef	_USART_IrDACmd
2972                     	xdef	_USART_IrDAConfig
2973                     	xdef	_USART_SetGuardTime
2974                     	xdef	_USART_SmartCardNACKCmd
2975                     	xdef	_USART_SmartCardCmd
2976                     	xdef	_USART_HalfDuplexCmd
2977                     	xdef	_USART_SetAddress
2978                     	xdef	_USART_ReceiverWakeUpCmd
2979                     	xdef	_USART_WakeUpConfig
2980                     	xdef	_USART_ReceiveData9
2981                     	xdef	_USART_ReceiveData8
2982                     	xdef	_USART_SendData9
2983                     	xdef	_USART_SendData8
2984                     	xdef	_USART_SendBreak
2985                     	xdef	_USART_SetPrescaler
2986                     	xdef	_USART_Cmd
2987                     	xdef	_USART_ClockInit
2988                     	xdef	_USART_Init
2989                     	xdef	_USART_DeInit
2990                     	xref	_CLK_GetClockFreq
2991                     	xref.b	c_lreg
2992                     	xref.b	c_x
3011                     	xref	c_lursh
3012                     	xref	c_ltor
3013                     	xref	c_rtol
3014                     	xref	c_ludv
3015                     	end
