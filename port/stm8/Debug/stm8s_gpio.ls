   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  98                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 46 {
 100                     .text:	section	.text,new
 101  0000               _GPIO_DeInit:
 105                     ; 47     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 107  0000 7f            	clr	(x)
 108                     ; 48     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 110  0001 6f02          	clr	(2,x)
 111                     ; 49     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 113  0003 6f03          	clr	(3,x)
 114                     ; 50     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 116  0005 6f04          	clr	(4,x)
 117                     ; 51 }
 120  0007 81            	ret
 360                     ; 62 void GPIO_Init(GPIO_TypeDef* GPIOx,
 360                     ; 63                GPIO_Pin_TypeDef GPIO_Pin,
 360                     ; 64                GPIO_Mode_TypeDef GPIO_Mode)
 360                     ; 65 {
 361                     .text:	section	.text,new
 362  0000               _GPIO_Init:
 364  0000 89            	pushw	x
 365       00000000      OFST:	set	0
 368                     ; 70     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 370                     ; 71     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 372                     ; 77     if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 374  0001 7b06          	ld	a,(OFST+6,sp)
 375  0003 a580          	bcp	a,#128
 376  0005 271d          	jreq	L771
 377                     ; 79         if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 379  0007 7b06          	ld	a,(OFST+6,sp)
 380  0009 a510          	bcp	a,#16
 381  000b 2706          	jreq	L102
 382                     ; 81             GPIOx->ODR |= (u8)GPIO_Pin;
 384  000d f6            	ld	a,(x)
 385  000e 1a05          	or	a,(OFST+5,sp)
 386  0010 f7            	ld	(x),a
 388  0011 2007          	jra	L302
 389  0013               L102:
 390                     ; 84             GPIOx->ODR &= (u8)(~(GPIO_Pin));
 392  0013 1e01          	ldw	x,(OFST+1,sp)
 393  0015 7b05          	ld	a,(OFST+5,sp)
 394  0017 43            	cpl	a
 395  0018 f4            	and	a,(x)
 396  0019 f7            	ld	(x),a
 397  001a               L302:
 398                     ; 87         GPIOx->DDR |= (u8)GPIO_Pin;
 400  001a 1e01          	ldw	x,(OFST+1,sp)
 401  001c e602          	ld	a,(2,x)
 402  001e 1a05          	or	a,(OFST+5,sp)
 403  0020 e702          	ld	(2,x),a
 405  0022 2009          	jra	L502
 406  0024               L771:
 407                     ; 91         GPIOx->DDR &= (u8)(~(GPIO_Pin));
 409  0024 1e01          	ldw	x,(OFST+1,sp)
 410  0026 7b05          	ld	a,(OFST+5,sp)
 411  0028 43            	cpl	a
 412  0029 e402          	and	a,(2,x)
 413  002b e702          	ld	(2,x),a
 414  002d               L502:
 415                     ; 98     if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 417  002d 7b06          	ld	a,(OFST+6,sp)
 418  002f a540          	bcp	a,#64
 419  0031 270a          	jreq	L702
 420                     ; 100         GPIOx->CR1 |= (u8)GPIO_Pin;
 422  0033 1e01          	ldw	x,(OFST+1,sp)
 423  0035 e603          	ld	a,(3,x)
 424  0037 1a05          	or	a,(OFST+5,sp)
 425  0039 e703          	ld	(3,x),a
 427  003b 2009          	jra	L112
 428  003d               L702:
 429                     ; 103         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 431  003d 1e01          	ldw	x,(OFST+1,sp)
 432  003f 7b05          	ld	a,(OFST+5,sp)
 433  0041 43            	cpl	a
 434  0042 e403          	and	a,(3,x)
 435  0044 e703          	ld	(3,x),a
 436  0046               L112:
 437                     ; 110     if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 439  0046 7b06          	ld	a,(OFST+6,sp)
 440  0048 a520          	bcp	a,#32
 441  004a 270a          	jreq	L312
 442                     ; 112         GPIOx->CR2 |= (u8)GPIO_Pin;
 444  004c 1e01          	ldw	x,(OFST+1,sp)
 445  004e e604          	ld	a,(4,x)
 446  0050 1a05          	or	a,(OFST+5,sp)
 447  0052 e704          	ld	(4,x),a
 449  0054 2009          	jra	L512
 450  0056               L312:
 451                     ; 115         GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 453  0056 1e01          	ldw	x,(OFST+1,sp)
 454  0058 7b05          	ld	a,(OFST+5,sp)
 455  005a 43            	cpl	a
 456  005b e404          	and	a,(4,x)
 457  005d e704          	ld	(4,x),a
 458  005f               L512:
 459                     ; 118 }
 462  005f 85            	popw	x
 463  0060 81            	ret
 510                     ; 130 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 510                     ; 131 {
 511                     .text:	section	.text,new
 512  0000               _GPIO_WriteReverse:
 514  0000 89            	pushw	x
 515       00000000      OFST:	set	0
 518                     ; 132     GPIOx->ODR ^= (u8)PortPins;
 520  0001 f6            	ld	a,(x)
 521  0002 1805          	xor	a,	(OFST+5,sp)
 522  0004 f7            	ld	(x),a
 523                     ; 133 }
 526  0005 85            	popw	x
 527  0006 81            	ret
 540                     	xdef	_GPIO_WriteReverse
 541                     	xdef	_GPIO_Init
 542                     	xdef	_GPIO_DeInit
 561                     	end
