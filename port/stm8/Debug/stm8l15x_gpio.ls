   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  98                     ; 90 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 91 {
 100                     .text:	section	.text,new
 101  0000               _GPIO_DeInit:
 105                     ; 92   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 107  0000 6f04          	clr	(4,x)
 108                     ; 93   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 110  0002 7f            	clr	(x)
 111                     ; 94   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 113  0003 6f02          	clr	(2,x)
 114                     ; 95   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 116  0005 6f03          	clr	(3,x)
 117                     ; 96 }
 120  0007 81            	ret
 274                     ; 127 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 274                     ; 128 {
 275                     .text:	section	.text,new
 276  0000               _GPIO_Init:
 278  0000 89            	pushw	x
 279       00000000      OFST:	set	0
 282                     ; 133   assert_param(IS_GPIO_MODE(GPIO_Mode));
 284                     ; 134   assert_param(IS_GPIO_PIN(GPIO_Pin));
 286                     ; 137   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 288  0001 7b05          	ld	a,(OFST+5,sp)
 289  0003 43            	cpl	a
 290  0004 e404          	and	a,(4,x)
 291  0006 e704          	ld	(4,x),a
 292                     ; 143   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 294  0008 7b06          	ld	a,(OFST+6,sp)
 295  000a a580          	bcp	a,#128
 296  000c 271d          	jreq	L341
 297                     ; 145     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 299  000e 7b06          	ld	a,(OFST+6,sp)
 300  0010 a510          	bcp	a,#16
 301  0012 2706          	jreq	L541
 302                     ; 147       GPIOx->ODR |= GPIO_Pin;
 304  0014 f6            	ld	a,(x)
 305  0015 1a05          	or	a,(OFST+5,sp)
 306  0017 f7            	ld	(x),a
 308  0018 2007          	jra	L741
 309  001a               L541:
 310                     ; 150       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 312  001a 1e01          	ldw	x,(OFST+1,sp)
 313  001c 7b05          	ld	a,(OFST+5,sp)
 314  001e 43            	cpl	a
 315  001f f4            	and	a,(x)
 316  0020 f7            	ld	(x),a
 317  0021               L741:
 318                     ; 153     GPIOx->DDR |= GPIO_Pin;
 320  0021 1e01          	ldw	x,(OFST+1,sp)
 321  0023 e602          	ld	a,(2,x)
 322  0025 1a05          	or	a,(OFST+5,sp)
 323  0027 e702          	ld	(2,x),a
 325  0029 2009          	jra	L151
 326  002b               L341:
 327                     ; 157     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 329  002b 1e01          	ldw	x,(OFST+1,sp)
 330  002d 7b05          	ld	a,(OFST+5,sp)
 331  002f 43            	cpl	a
 332  0030 e402          	and	a,(2,x)
 333  0032 e702          	ld	(2,x),a
 334  0034               L151:
 335                     ; 164   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 337  0034 7b06          	ld	a,(OFST+6,sp)
 338  0036 a540          	bcp	a,#64
 339  0038 270a          	jreq	L351
 340                     ; 166     GPIOx->CR1 |= GPIO_Pin;
 342  003a 1e01          	ldw	x,(OFST+1,sp)
 343  003c e603          	ld	a,(3,x)
 344  003e 1a05          	or	a,(OFST+5,sp)
 345  0040 e703          	ld	(3,x),a
 347  0042 2009          	jra	L551
 348  0044               L351:
 349                     ; 169     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 351  0044 1e01          	ldw	x,(OFST+1,sp)
 352  0046 7b05          	ld	a,(OFST+5,sp)
 353  0048 43            	cpl	a
 354  0049 e403          	and	a,(3,x)
 355  004b e703          	ld	(3,x),a
 356  004d               L551:
 357                     ; 176   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 359  004d 7b06          	ld	a,(OFST+6,sp)
 360  004f a520          	bcp	a,#32
 361  0051 270a          	jreq	L751
 362                     ; 178     GPIOx->CR2 |= GPIO_Pin;
 364  0053 1e01          	ldw	x,(OFST+1,sp)
 365  0055 e604          	ld	a,(4,x)
 366  0057 1a05          	or	a,(OFST+5,sp)
 367  0059 e704          	ld	(4,x),a
 369  005b 2009          	jra	L161
 370  005d               L751:
 371                     ; 181     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 373  005d 1e01          	ldw	x,(OFST+1,sp)
 374  005f 7b05          	ld	a,(OFST+5,sp)
 375  0061 43            	cpl	a
 376  0062 e404          	and	a,(4,x)
 377  0064 e704          	ld	(4,x),a
 378  0066               L161:
 379                     ; 184 }
 382  0066 85            	popw	x
 383  0067 81            	ret
 458                     ; 203 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 458                     ; 204 {
 459                     .text:	section	.text,new
 460  0000               _GPIO_ExternalPullUpConfig:
 462  0000 89            	pushw	x
 463       00000000      OFST:	set	0
 466                     ; 206   assert_param(IS_GPIO_PIN(GPIO_Pin));
 468                     ; 207   assert_param(IS_FUNCTIONAL_STATE(NewState));
 470                     ; 209   if (NewState != DISABLE) /* External Pull-Up Set*/
 472  0001 0d06          	tnz	(OFST+6,sp)
 473  0003 2708          	jreq	L122
 474                     ; 211     GPIOx->CR1 |= GPIO_Pin;
 476  0005 e603          	ld	a,(3,x)
 477  0007 1a05          	or	a,(OFST+5,sp)
 478  0009 e703          	ld	(3,x),a
 480  000b 2009          	jra	L322
 481  000d               L122:
 482                     ; 214     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 484  000d 1e01          	ldw	x,(OFST+1,sp)
 485  000f 7b05          	ld	a,(OFST+5,sp)
 486  0011 43            	cpl	a
 487  0012 e403          	and	a,(3,x)
 488  0014 e703          	ld	(3,x),a
 489  0016               L322:
 490                     ; 216 }
 493  0016 85            	popw	x
 494  0017 81            	ret
 538                     ; 242 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 538                     ; 243 {
 539                     .text:	section	.text,new
 540  0000               _GPIO_Write:
 542  0000 89            	pushw	x
 543       00000000      OFST:	set	0
 546                     ; 244   GPIOx->ODR = GPIO_PortVal;
 548  0001 7b05          	ld	a,(OFST+5,sp)
 549  0003 1e01          	ldw	x,(OFST+1,sp)
 550  0005 f7            	ld	(x),a
 551                     ; 245 }
 554  0006 85            	popw	x
 555  0007 81            	ret
 715                     ; 264 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 715                     ; 265 {
 716                     .text:	section	.text,new
 717  0000               _GPIO_WriteBit:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 267   assert_param(IS_GPIO_PIN(GPIO_Pin));
 725                     ; 268   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 727                     ; 270   if (GPIO_BitVal != RESET)
 729  0001 0d06          	tnz	(OFST+6,sp)
 730  0003 2706          	jreq	L143
 731                     ; 272     GPIOx->ODR |= GPIO_Pin;
 733  0005 f6            	ld	a,(x)
 734  0006 1a05          	or	a,(OFST+5,sp)
 735  0008 f7            	ld	(x),a
 737  0009 2007          	jra	L343
 738  000b               L143:
 739                     ; 277     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 741  000b 1e01          	ldw	x,(OFST+1,sp)
 742  000d 7b05          	ld	a,(OFST+5,sp)
 743  000f 43            	cpl	a
 744  0010 f4            	and	a,(x)
 745  0011 f7            	ld	(x),a
 746  0012               L343:
 747                     ; 279 }
 750  0012 85            	popw	x
 751  0013 81            	ret
 795                     ; 297 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 795                     ; 298 {
 796                     .text:	section	.text,new
 797  0000               _GPIO_SetBits:
 799  0000 89            	pushw	x
 800       00000000      OFST:	set	0
 803                     ; 299   GPIOx->ODR |= GPIO_Pin;
 805  0001 f6            	ld	a,(x)
 806  0002 1a05          	or	a,(OFST+5,sp)
 807  0004 f7            	ld	(x),a
 808                     ; 300 }
 811  0005 85            	popw	x
 812  0006 81            	ret
 856                     ; 318 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 856                     ; 319 {
 857                     .text:	section	.text,new
 858  0000               _GPIO_ResetBits:
 860  0000 89            	pushw	x
 861       00000000      OFST:	set	0
 864                     ; 320   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 866  0001 7b05          	ld	a,(OFST+5,sp)
 867  0003 43            	cpl	a
 868  0004 f4            	and	a,(x)
 869  0005 f7            	ld	(x),a
 870                     ; 321 }
 873  0006 85            	popw	x
 874  0007 81            	ret
 918                     ; 330 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 918                     ; 331 {
 919                     .text:	section	.text,new
 920  0000               _GPIO_ToggleBits:
 922  0000 89            	pushw	x
 923       00000000      OFST:	set	0
 926                     ; 332   GPIOx->ODR ^= GPIO_Pin;
 928  0001 f6            	ld	a,(x)
 929  0002 1805          	xor	a,	(OFST+5,sp)
 930  0004 f7            	ld	(x),a
 931                     ; 333 }
 934  0005 85            	popw	x
 935  0006 81            	ret
 972                     ; 341 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 972                     ; 342 {
 973                     .text:	section	.text,new
 974  0000               _GPIO_ReadInputData:
 978                     ; 343   return ((uint8_t)GPIOx->IDR);
 980  0000 e601          	ld	a,(1,x)
 983  0002 81            	ret
1021                     ; 352 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1021                     ; 353 {
1022                     .text:	section	.text,new
1023  0000               _GPIO_ReadOutputData:
1027                     ; 354   return ((uint8_t)GPIOx->ODR);
1029  0000 f6            	ld	a,(x)
1032  0001 81            	ret
1081                     ; 372 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1081                     ; 373 {
1082                     .text:	section	.text,new
1083  0000               _GPIO_ReadInputDataBit:
1085  0000 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 374   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1091  0001 e601          	ld	a,(1,x)
1092  0003 1405          	and	a,(OFST+5,sp)
1095  0005 85            	popw	x
1096  0006 81            	ret
1145                     ; 383 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1145                     ; 384 {
1146                     .text:	section	.text,new
1147  0000               _GPIO_ReadOutputDataBit:
1149  0000 89            	pushw	x
1150       00000000      OFST:	set	0
1153                     ; 385   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1155  0001 f6            	ld	a,(x)
1156  0002 1405          	and	a,(OFST+5,sp)
1159  0004 85            	popw	x
1160  0005 81            	ret
1173                     	xdef	_GPIO_ReadOutputDataBit
1174                     	xdef	_GPIO_ReadInputDataBit
1175                     	xdef	_GPIO_ReadOutputData
1176                     	xdef	_GPIO_ReadInputData
1177                     	xdef	_GPIO_ToggleBits
1178                     	xdef	_GPIO_ResetBits
1179                     	xdef	_GPIO_SetBits
1180                     	xdef	_GPIO_WriteBit
1181                     	xdef	_GPIO_Write
1182                     	xdef	_GPIO_ExternalPullUpConfig
1183                     	xdef	_GPIO_Init
1184                     	xdef	_GPIO_DeInit
1203                     	end
