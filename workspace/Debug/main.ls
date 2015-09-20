   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 55 static void TIM1_Config(void)
  41                     ; 56 {
  43                     	switch	.text
  44  0000               L3_TIM1_Config:
  48                     ; 58   TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
  50  0000 4b00          	push	#0
  51  0002 ae0fff        	ldw	x,#4095
  52  0005 89            	pushw	x
  53  0006 4b00          	push	#0
  54  0008 5f            	clrw	x
  55  0009 cd0000        	call	_TIM1_TimeBaseInit
  57  000c 5b04          	addw	sp,#4
  58                     ; 61   TIM1_OC1Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR1_VAL,
  58                     ; 62                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
  60  000e 4b00          	push	#0
  61  0010 4b00          	push	#0
  62  0012 4b00          	push	#0
  63  0014 4b00          	push	#0
  64  0016 ae07ff        	ldw	x,#2047
  65  0019 89            	pushw	x
  66  001a 4b44          	push	#68
  67  001c ae0011        	ldw	x,#17
  68  001f 4f            	clr	a
  69  0020 95            	ld	xh,a
  70  0021 cd0000        	call	_TIM1_OC1Init
  72  0024 5b07          	addw	sp,#7
  73                     ; 63   TIM1_OC2Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR2_VAL,
  73                     ; 64                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
  75  0026 4b00          	push	#0
  76  0028 4b00          	push	#0
  77  002a 4b00          	push	#0
  78  002c 4b00          	push	#0
  79  002e ae03ff        	ldw	x,#1023
  80  0031 89            	pushw	x
  81  0032 4b44          	push	#68
  82  0034 ae0011        	ldw	x,#17
  83  0037 4f            	clr	a
  84  0038 95            	ld	xh,a
  85  0039 cd0000        	call	_TIM1_OC2Init
  87  003c 5b07          	addw	sp,#7
  88                     ; 65   TIM1_OC3Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR3_VAL,
  88                     ; 66                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
  90  003e 4b00          	push	#0
  91  0040 4b00          	push	#0
  92  0042 4b00          	push	#0
  93  0044 4b00          	push	#0
  94  0046 ae01ff        	ldw	x,#511
  95  0049 89            	pushw	x
  96  004a 4b44          	push	#68
  97  004c ae0011        	ldw	x,#17
  98  004f 4f            	clr	a
  99  0050 95            	ld	xh,a
 100  0051 cd0000        	call	_TIM1_OC3Init
 102  0054 5b07          	addw	sp,#7
 103                     ; 69   TIM1_BDTRConfig(TIM1_OSSIState_Enable, TIM1_LockLevel_Off, DEADTIME,
 103                     ; 70                   TIM1_BreakState_Enable, TIM1_BreakPolarity_Low, TIM1_AutomaticOutput_Disable);
 105  0056 4b00          	push	#0
 106  0058 4b00          	push	#0
 107  005a 4b10          	push	#16
 108  005c 4b01          	push	#1
 109  005e 5f            	clrw	x
 110  005f a604          	ld	a,#4
 111  0061 95            	ld	xh,a
 112  0062 cd0000        	call	_TIM1_BDTRConfig
 114  0065 5b04          	addw	sp,#4
 115                     ; 72   TIM1_CCPreloadControl(ENABLE);
 117  0067 a601          	ld	a,#1
 118  0069 cd0000        	call	_TIM1_CCPreloadControl
 120                     ; 73   TIM1_ITConfig(TIM1_IT_COM, ENABLE);
 122  006c ae0001        	ldw	x,#1
 123  006f a620          	ld	a,#32
 124  0071 95            	ld	xh,a
 125  0072 cd0000        	call	_TIM1_ITConfig
 127                     ; 75   TIM1_CtrlPWMOutputs(ENABLE);
 129  0075 a601          	ld	a,#1
 130  0077 cd0000        	call	_TIM1_CtrlPWMOutputs
 132                     ; 77   TIM1_Cmd(ENABLE);
 134  007a a601          	ld	a,#1
 135  007c cd0000        	call	_TIM1_Cmd
 137                     ; 78 }
 140  007f 81            	ret
 168                     ; 80 static void TIM4_Config(void)
 168                     ; 81 {
 169                     	switch	.text
 170  0080               L32_TIM4_Config:
 174                     ; 92   TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
 176  0080 ae007c        	ldw	x,#124
 177  0083 a607          	ld	a,#7
 178  0085 95            	ld	xh,a
 179  0086 cd0000        	call	_TIM4_TimeBaseInit
 181                     ; 94   TIM4_ClearFlag(TIM4_FLAG_Update);
 183  0089 a601          	ld	a,#1
 184  008b cd0000        	call	_TIM4_ClearFlag
 186                     ; 96   TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 188  008e ae0001        	ldw	x,#1
 189  0091 a601          	ld	a,#1
 190  0093 95            	ld	xh,a
 191  0094 cd0000        	call	_TIM4_ITConfig
 193                     ; 98   enableInterrupts();
 196  0097 9a            rim
 198                     ; 101   TIM4_Cmd(ENABLE);
 201  0098 a601          	ld	a,#1
 202  009a cd0000        	call	_TIM4_Cmd
 204                     ; 102 }
 207  009d 81            	ret
 253                     ; 109 void main(void)
 253                     ; 110 {
 254                     	switch	.text
 255  009e               _main:
 257  009e 88            	push	a
 258       00000001      OFST:	set	1
 261                     ; 111 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 263  009f 4f            	clr	a
 264  00a0 cd0000        	call	_CLK_SYSCLKDivConfig
 266                     ; 113 	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
 268  00a3 4b01          	push	#1
 269  00a5 ae011c        	ldw	x,#284
 270  00a8 cd0000        	call	_SYSCFG_REMAPPinConfig
 272  00ab 84            	pop	a
 273                     ; 116   CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 275  00ac ae0001        	ldw	x,#1
 276  00af a605          	ld	a,#5
 277  00b1 95            	ld	xh,a
 278  00b2 cd0000        	call	_CLK_PeripheralClockConfig
 280                     ; 119   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 282  00b5 4b01          	push	#1
 283  00b7 4b04          	push	#4
 284  00b9 ae5000        	ldw	x,#20480
 285  00bc cd0000        	call	_GPIO_ExternalPullUpConfig
 287  00bf 85            	popw	x
 288                     ; 122   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 290  00c0 4b01          	push	#1
 291  00c2 4b08          	push	#8
 292  00c4 ae5000        	ldw	x,#20480
 293  00c7 cd0000        	call	_GPIO_ExternalPullUpConfig
 295  00ca 85            	popw	x
 296                     ; 125   USART_Init(USART1, 115200,
 296                     ; 126              USART_WordLength_8b,
 296                     ; 127              USART_StopBits_1,
 296                     ; 128              USART_Parity_No,
 296                     ; 129              (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));	
 298  00cb 4b0c          	push	#12
 299  00cd 4b00          	push	#0
 300  00cf 4b00          	push	#0
 301  00d1 4b00          	push	#0
 302  00d3 aec200        	ldw	x,#49664
 303  00d6 89            	pushw	x
 304  00d7 ae0001        	ldw	x,#1
 305  00da 89            	pushw	x
 306  00db ae5230        	ldw	x,#21040
 307  00de cd0000        	call	_USART_Init
 309  00e1 5b08          	addw	sp,#8
 310                     ; 132   GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
 312  00e3 4be0          	push	#224
 313  00e5 4b80          	push	#128
 314  00e7 ae5014        	ldw	x,#20500
 315  00ea cd0000        	call	_GPIO_Init
 317  00ed 85            	popw	x
 318                     ; 137 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 320  00ee ae0001        	ldw	x,#1
 321  00f1 a602          	ld	a,#2
 322  00f3 95            	ld	xh,a
 323  00f4 cd0000        	call	_CLK_PeripheralClockConfig
 325                     ; 138 	TIM4_Config();
 327  00f7 ad87          	call	L32_TIM4_Config
 329                     ; 140 	enableInterrupts();
 332  00f9 9a            rim
 335  00fa               L16:
 336                     ; 146 		while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
 338  00fa ae0020        	ldw	x,#32
 339  00fd 89            	pushw	x
 340  00fe ae5230        	ldw	x,#21040
 341  0101 cd0000        	call	_USART_GetFlagStatus
 343  0104 85            	popw	x
 344  0105 4d            	tnz	a
 345  0106 27f2          	jreq	L16
 346                     ; 148 		c = USART_ReceiveData8(USART1);
 348  0108 ae5230        	ldw	x,#21040
 349  010b cd0000        	call	_USART_ReceiveData8
 351  010e 6b01          	ld	(OFST+0,sp),a
 352                     ; 150 		USART_SendData8(USART1, c);
 354  0110 7b01          	ld	a,(OFST+0,sp)
 355  0112 88            	push	a
 356  0113 ae5230        	ldw	x,#21040
 357  0116 cd0000        	call	_USART_SendData8
 359  0119 84            	pop	a
 361  011a               L76:
 362                     ; 152 		while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 364  011a ae0040        	ldw	x,#64
 365  011d 89            	pushw	x
 366  011e ae5230        	ldw	x,#21040
 367  0121 cd0000        	call	_USART_GetFlagStatus
 369  0124 85            	popw	x
 370  0125 4d            	tnz	a
 371  0126 27f2          	jreq	L76
 372                     ; 155     GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
 374  0128 4b80          	push	#128
 375  012a ae5014        	ldw	x,#20500
 376  012d cd0000        	call	_GPIO_ToggleBits
 378  0130 84            	pop	a
 380  0131 20c7          	jra	L16
 414                     ; 165 void Delay(__IO uint16_t nCount)
 414                     ; 166 {
 415                     	switch	.text
 416  0133               _Delay:
 418  0133 89            	pushw	x
 419       00000000      OFST:	set	0
 422  0134 2007          	jra	L311
 423  0136               L111:
 424                     ; 170     nCount--;
 426  0136 1e01          	ldw	x,(OFST+1,sp)
 427  0138 1d0001        	subw	x,#1
 428  013b 1f01          	ldw	(OFST+1,sp),x
 429  013d               L311:
 430                     ; 168   while (nCount != 0)
 432  013d 1e01          	ldw	x,(OFST+1,sp)
 433  013f 26f5          	jrne	L111
 434                     ; 172 }
 437  0141 85            	popw	x
 438  0142 81            	ret
 451                     	xdef	_main
 452                     	xdef	_Delay
 453                     	xref	_USART_GetFlagStatus
 454                     	xref	_USART_ReceiveData8
 455                     	xref	_USART_SendData8
 456                     	xref	_USART_Init
 457                     	xref	_TIM4_ClearFlag
 458                     	xref	_TIM4_ITConfig
 459                     	xref	_TIM4_Cmd
 460                     	xref	_TIM4_TimeBaseInit
 461                     	xref	_TIM1_ITConfig
 462                     	xref	_TIM1_CCPreloadControl
 463                     	xref	_TIM1_CtrlPWMOutputs
 464                     	xref	_TIM1_BDTRConfig
 465                     	xref	_TIM1_OC3Init
 466                     	xref	_TIM1_OC2Init
 467                     	xref	_TIM1_OC1Init
 468                     	xref	_TIM1_Cmd
 469                     	xref	_TIM1_TimeBaseInit
 470                     	xref	_SYSCFG_REMAPPinConfig
 471                     	xref	_GPIO_ToggleBits
 472                     	xref	_GPIO_ExternalPullUpConfig
 473                     	xref	_GPIO_Init
 474                     	xref	_CLK_PeripheralClockConfig
 475                     	xref	_CLK_SYSCLKDivConfig
 494                     	end
