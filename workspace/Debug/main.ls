   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 67 static void TIM1_Config(void)
  41                     ; 68 {
  43                     	switch	.text
  44  0000               L11_TIM1_Config:
  48                     ; 70     TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
  50  0000 4b00          	push	#0
  51  0002 ae0fff        	ldw	x,#4095
  52  0005 89            	pushw	x
  53  0006 4b00          	push	#0
  54  0008 5f            	clrw	x
  55  0009 cd0000        	call	_TIM1_TimeBaseInit
  57  000c 5b04          	addw	sp,#4
  58                     ; 73     TIM1_OC1Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR1_VAL,
  58                     ; 74                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
  73                     ; 75     TIM1_OC2Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR2_VAL,
  73                     ; 76                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
  88                     ; 77     TIM1_OC3Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR3_VAL,
  88                     ; 78                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
 103                     ; 81     TIM1_BDTRConfig(TIM1_OSSIState_Enable, TIM1_LockLevel_Off, DEADTIME,
 103                     ; 82                   TIM1_BreakState_Enable, TIM1_BreakPolarity_Low, TIM1_AutomaticOutput_Disable);
 105  0056 4b00          	push	#0
 106  0058 4b00          	push	#0
 107  005a 4b10          	push	#16
 108  005c 4b01          	push	#1
 109  005e 5f            	clrw	x
 110  005f a604          	ld	a,#4
 111  0061 95            	ld	xh,a
 112  0062 cd0000        	call	_TIM1_BDTRConfig
 114  0065 5b04          	addw	sp,#4
 115                     ; 84     TIM1_CCPreloadControl(ENABLE);
 117  0067 a601          	ld	a,#1
 118  0069 cd0000        	call	_TIM1_CCPreloadControl
 120                     ; 85     TIM1_ITConfig(TIM1_IT_COM, ENABLE);
 122  006c ae0001        	ldw	x,#1
 123  006f a620          	ld	a,#32
 124  0071 95            	ld	xh,a
 125  0072 cd0000        	call	_TIM1_ITConfig
 127                     ; 87     TIM1_CtrlPWMOutputs(ENABLE);
 129  0075 a601          	ld	a,#1
 130  0077 cd0000        	call	_TIM1_CtrlPWMOutputs
 132                     ; 89     TIM1_Cmd(ENABLE);
 134  007a a601          	ld	a,#1
 135  007c cd0000        	call	_TIM1_Cmd
 137                     ; 90 }
 140  007f 81            	ret
 168                     ; 92 static void TIM4_Config(void)
 168                     ; 93 {
 169                     	switch	.text
 170  0080               L13_TIM4_Config:
 174                     ; 104     TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
 176  0080 ae007c        	ldw	x,#124
 177  0083 a607          	ld	a,#7
 178  0085 95            	ld	xh,a
 179  0086 cd0000        	call	_TIM4_TimeBaseInit
 181                     ; 106     TIM4_ClearFlag(TIM4_FLAG_Update);
 183  0089 a601          	ld	a,#1
 184  008b cd0000        	call	_TIM4_ClearFlag
 186                     ; 108     TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 188  008e ae0001        	ldw	x,#1
 189  0091 a601          	ld	a,#1
 190  0093 95            	ld	xh,a
 191  0094 cd0000        	call	_TIM4_ITConfig
 193                     ; 110     enableInterrupts();
 196  0097 9a            rim
 198                     ; 113     TIM4_Cmd(ENABLE);
 201  0098 a601          	ld	a,#1
 202  009a cd0000        	call	_TIM4_Cmd
 204                     ; 114 }
 207  009d 81            	ret
 252                     ; 116 static void main_thread_func (uint32_t param)
 252                     ; 117 {
 253                     	switch	.text
 254  009e               L34_main_thread_func:
 256  009e 89            	pushw	x
 257       00000002      OFST:	set	2
 260                     ; 118     int cnt = 0;
 262  009f 5f            	clrw	x
 263  00a0 1f01          	ldw	(OFST-1,sp),x
 264  00a2               L76:
 265                     ; 123         printf("main_thread_func cnt=%d\n", cnt++);
 267  00a2 1601          	ldw	y,(OFST-1,sp)
 268  00a4 0c02          	inc	(OFST+0,sp)
 269  00a6 2602          	jrne	L21
 270  00a8 0c01          	inc	(OFST-1,sp)
 271  00aa               L21:
 272  00aa 9089          	pushw	y
 273  00ac ae0000        	ldw	x,#L37
 274  00af cd0000        	call	_printf
 276  00b2 85            	popw	x
 277                     ; 126         atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 279  00b3 ae0064        	ldw	x,#100
 280  00b6 89            	pushw	x
 281  00b7 ae0000        	ldw	x,#0
 282  00ba 89            	pushw	x
 283  00bb cd0000        	call	_atomTimerDelay
 285  00be 5b04          	addw	sp,#4
 287  00c0 20e0          	jra	L76
 350                     ; 135 void main(void)
 350                     ; 136 {
 351                     	switch	.text
 352  00c2               _main:
 354  00c2 88            	push	a
 355       00000001      OFST:	set	1
 358                     ; 139 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 360  00c3 4f            	clr	a
 361  00c4 cd0000        	call	_CLK_SYSCLKDivConfig
 363                     ; 141 	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
 365  00c7 4b01          	push	#1
 366  00c9 ae011c        	ldw	x,#284
 367  00cc cd0000        	call	_SYSCFG_REMAPPinConfig
 369  00cf 84            	pop	a
 370                     ; 144     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 372  00d0 ae0001        	ldw	x,#1
 373  00d3 a605          	ld	a,#5
 374  00d5 95            	ld	xh,a
 375  00d6 cd0000        	call	_CLK_PeripheralClockConfig
 377                     ; 147     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 379  00d9 4b01          	push	#1
 380  00db 4b04          	push	#4
 381  00dd ae5000        	ldw	x,#20480
 382  00e0 cd0000        	call	_GPIO_ExternalPullUpConfig
 384  00e3 85            	popw	x
 385                     ; 150     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 387  00e4 4b01          	push	#1
 388  00e6 4b08          	push	#8
 389  00e8 ae5000        	ldw	x,#20480
 390  00eb cd0000        	call	_GPIO_ExternalPullUpConfig
 392  00ee 85            	popw	x
 393                     ; 153     USART_Init(USART1, 115200,
 393                     ; 154              USART_WordLength_8b,
 393                     ; 155              USART_StopBits_1,
 393                     ; 156              USART_Parity_No,
 393                     ; 157              (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 395  00ef 4b0c          	push	#12
 396  00f1 4b00          	push	#0
 397  00f3 4b00          	push	#0
 398  00f5 4b00          	push	#0
 399  00f7 aec200        	ldw	x,#49664
 400  00fa 89            	pushw	x
 401  00fb ae0001        	ldw	x,#1
 402  00fe 89            	pushw	x
 403  00ff ae5230        	ldw	x,#21040
 404  0102 cd0000        	call	_USART_Init
 406  0105 5b08          	addw	sp,#8
 407                     ; 160     GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
 409  0107 4be0          	push	#224
 410  0109 4b80          	push	#128
 411  010b ae5014        	ldw	x,#20500
 412  010e cd0000        	call	_GPIO_Init
 414  0111 85            	popw	x
 415                     ; 162 	enableInterrupts();
 418  0112 9a            rim
 420                     ; 164 	status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
 423  0113 ae0080        	ldw	x,#128
 424  0116 89            	pushw	x
 425  0117 ae0000        	ldw	x,#0
 426  011a 89            	pushw	x
 427  011b ae007f        	ldw	x,#L5_idle_thread_stack+127
 428  011e cd0000        	call	_atomOSInit
 430  0121 5b04          	addw	sp,#4
 431  0123 6b01          	ld	(OFST+0,sp),a
 432                     ; 165 	if (status == ATOM_OK)
 434  0125 0d01          	tnz	(OFST+0,sp)
 435  0127 262e          	jrne	L131
 436                     ; 168 			archInitSystemTickTimer();
 438  0129 cd0000        	call	_archInitSystemTickTimer
 440                     ; 171 			status = atomThreadCreate(&main_tcb,
 440                     ; 172 									 TEST_THREAD_PRIO, main_thread_func, 0,
 440                     ; 173 									 &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
 440                     ; 174 									 MAIN_STACK_SIZE_BYTES);
 442  012c ae0100        	ldw	x,#256
 443  012f 89            	pushw	x
 444  0130 ae0000        	ldw	x,#0
 445  0133 89            	pushw	x
 446  0134 ae017f        	ldw	x,#L3_main_thread_stack+255
 447  0137 89            	pushw	x
 448  0138 ae0000        	ldw	x,#0
 449  013b 89            	pushw	x
 450  013c ae0000        	ldw	x,#0
 451  013f 89            	pushw	x
 452  0140 ae009e        	ldw	x,#L34_main_thread_func
 453  0143 89            	pushw	x
 454  0144 4b10          	push	#16
 455  0146 ae0000        	ldw	x,#L7_main_tcb
 456  0149 cd0000        	call	_atomThreadCreate
 458  014c 5b0d          	addw	sp,#13
 459  014e 6b01          	ld	(OFST+0,sp),a
 460                     ; 175 			if (status == ATOM_OK)
 462  0150 0d01          	tnz	(OFST+0,sp)
 463  0152 2603          	jrne	L131
 464                     ; 187 					atomOSStart();
 466  0154 cd0000        	call	_atomOSStart
 468  0157               L131:
 469                     ; 195 		while (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == RESET);
 471  0157 ae0020        	ldw	x,#32
 472  015a 89            	pushw	x
 473  015b ae5230        	ldw	x,#21040
 474  015e cd0000        	call	_USART_GetFlagStatus
 476  0161 85            	popw	x
 477  0162 4d            	tnz	a
 478  0163 27f2          	jreq	L131
 479                     ; 197 		c = USART_ReceiveData8(USART1);
 481  0165 ae5230        	ldw	x,#21040
 482  0168 cd0000        	call	_USART_ReceiveData8
 484  016b 6b01          	ld	(OFST+0,sp),a
 485                     ; 199 		USART_SendData8(USART1, c);
 487  016d 7b01          	ld	a,(OFST+0,sp)
 488  016f 88            	push	a
 489  0170 ae5230        	ldw	x,#21040
 490  0173 cd0000        	call	_USART_SendData8
 492  0176 84            	pop	a
 494  0177               L731:
 495                     ; 201 		while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 497  0177 ae0040        	ldw	x,#64
 498  017a 89            	pushw	x
 499  017b ae5230        	ldw	x,#21040
 500  017e cd0000        	call	_USART_GetFlagStatus
 502  0181 85            	popw	x
 503  0182 4d            	tnz	a
 504  0183 27f2          	jreq	L731
 505                     ; 204     GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
 507  0185 4b80          	push	#128
 508  0187 ae5014        	ldw	x,#20500
 509  018a cd0000        	call	_GPIO_ToggleBits
 511  018d 84            	pop	a
 513  018e 20c7          	jra	L131
 547                     ; 214 void Delay(__IO uint16_t nCount)
 547                     ; 215 {
 548                     	switch	.text
 549  0190               _Delay:
 551  0190 89            	pushw	x
 552       00000000      OFST:	set	0
 555  0191 2007          	jra	L361
 556  0193               L161:
 557                     ; 219     nCount--;
 559  0193 1e01          	ldw	x,(OFST+1,sp)
 560  0195 1d0001        	subw	x,#1
 561  0198 1f01          	ldw	(OFST+1,sp),x
 562  019a               L361:
 563                     ; 217   while (nCount != 0)
 565  019a 1e01          	ldw	x,(OFST+1,sp)
 566  019c 26f5          	jrne	L161
 567                     ; 221 }
 570  019e 85            	popw	x
 571  019f 81            	ret
 756                     	xdef	_main
 757                     	xdef	_Delay
 758                     	switch	.ubsct
 759  0000               L7_main_tcb:
 760  0000 000000000000  	ds.b	17
 761                     	switch	.bss
 762  0000               L5_idle_thread_stack:
 763  0000 000000000000  	ds.b	128
 764  0080               L3_main_thread_stack:
 765  0080 000000000000  	ds.b	256
 766                     	xref	_archInitSystemTickTimer
 767                     	xref	_atomThreadCreate
 768                     	xref	_atomOSStart
 769                     	xref	_atomOSInit
 770                     	xref	_atomTimerDelay
 771                     	xref	_USART_GetFlagStatus
 772                     	xref	_USART_ReceiveData8
 773                     	xref	_USART_SendData8
 774                     	xref	_USART_Init
 775                     	xref	_TIM4_ClearFlag
 776                     	xref	_TIM4_ITConfig
 777                     	xref	_TIM4_Cmd
 778                     	xref	_TIM4_TimeBaseInit
 779                     	xref	_TIM1_ITConfig
 780                     	xref	_TIM1_CCPreloadControl
 781                     	xref	_TIM1_CtrlPWMOutputs
 782                     	xref	_TIM1_BDTRConfig
 783                     	xref	_TIM1_OC3Init
 784                     	xref	_TIM1_OC2Init
 785                     	xref	_TIM1_OC1Init
 786                     	xref	_TIM1_Cmd
 787                     	xref	_TIM1_TimeBaseInit
 788                     	xref	_SYSCFG_REMAPPinConfig
 789                     	xref	_GPIO_ToggleBits
 790                     	xref	_GPIO_ExternalPullUpConfig
 791                     	xref	_GPIO_Init
 792                     	xref	_CLK_PeripheralClockConfig
 793                     	xref	_CLK_SYSCLKDivConfig
 794                     	xref	_printf
 795                     .const:	section	.text
 796  0000               L37:
 797  0000 6d61696e5f74  	dc.b	"main_thread_func c"
 798  0012 6e743d25640a  	dc.b	"nt=%d",10,0
 818                     	end
