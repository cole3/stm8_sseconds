   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 69 static void TIM1_Config(void)
  41                     ; 70 {
  43                     	switch	.text
  44  0000               L51_TIM1_Config:
  48                     ; 72     TIM1_TimeBaseInit(TIM1_PRESCALER, TIM1_CounterMode_Up, TIM1_PERIOD, TIM1_REPTETION_COUNTER);
  50  0000 4b00          	push	#0
  51  0002 ae0fff        	ldw	x,#4095
  52  0005 89            	pushw	x
  53  0006 4b00          	push	#0
  54  0008 5f            	clrw	x
  55  0009 cd0000        	call	_TIM1_TimeBaseInit
  57  000c 5b04          	addw	sp,#4
  58                     ; 75     TIM1_OC1Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR1_VAL,
  58                     ; 76                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
  73                     ; 77     TIM1_OC2Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR2_VAL,
  73                     ; 78                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
  88                     ; 79     TIM1_OC3Init(TIM1_OCMode_Timing, TIM1_OutputState_Enable, TIM1_OutputNState_Enable, CCR3_VAL,
  88                     ; 80                TIM1_OCPolarity_High, TIM1_OCNPolarity_High, TIM1_OCIdleState_Reset, TIM1_OCNIdleState_Reset);
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
 103                     ; 83     TIM1_BDTRConfig(TIM1_OSSIState_Enable, TIM1_LockLevel_Off, DEADTIME,
 103                     ; 84                   TIM1_BreakState_Enable, TIM1_BreakPolarity_Low, TIM1_AutomaticOutput_Disable);
 105  0056 4b00          	push	#0
 106  0058 4b00          	push	#0
 107  005a 4b10          	push	#16
 108  005c 4b01          	push	#1
 109  005e 5f            	clrw	x
 110  005f a604          	ld	a,#4
 111  0061 95            	ld	xh,a
 112  0062 cd0000        	call	_TIM1_BDTRConfig
 114  0065 5b04          	addw	sp,#4
 115                     ; 86     TIM1_CCPreloadControl(ENABLE);
 117  0067 a601          	ld	a,#1
 118  0069 cd0000        	call	_TIM1_CCPreloadControl
 120                     ; 87     TIM1_ITConfig(TIM1_IT_COM, ENABLE);
 122  006c ae0001        	ldw	x,#1
 123  006f a620          	ld	a,#32
 124  0071 95            	ld	xh,a
 125  0072 cd0000        	call	_TIM1_ITConfig
 127                     ; 89     TIM1_CtrlPWMOutputs(ENABLE);
 129  0075 a601          	ld	a,#1
 130  0077 cd0000        	call	_TIM1_CtrlPWMOutputs
 132                     ; 91     TIM1_Cmd(ENABLE);
 134  007a a601          	ld	a,#1
 135  007c cd0000        	call	_TIM1_Cmd
 137                     ; 92 }
 140  007f 81            	ret
 168                     ; 94 static void TIM4_Config(void)
 168                     ; 95 {
 169                     	switch	.text
 170  0080               L53_TIM4_Config:
 174                     ; 106     TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
 176  0080 ae007c        	ldw	x,#124
 177  0083 a607          	ld	a,#7
 178  0085 95            	ld	xh,a
 179  0086 cd0000        	call	_TIM4_TimeBaseInit
 181                     ; 108     TIM4_ClearFlag(TIM4_FLAG_Update);
 183  0089 a601          	ld	a,#1
 184  008b cd0000        	call	_TIM4_ClearFlag
 186                     ; 110     TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 188  008e ae0001        	ldw	x,#1
 189  0091 a601          	ld	a,#1
 190  0093 95            	ld	xh,a
 191  0094 cd0000        	call	_TIM4_ITConfig
 193                     ; 112     enableInterrupts();
 196  0097 9a            rim
 198                     ; 115     TIM4_Cmd(ENABLE);
 201  0098 a601          	ld	a,#1
 202  009a cd0000        	call	_TIM4_Cmd
 204                     ; 116 }
 207  009d 81            	ret
 252                     ; 118 static void first_thread_func (uint32_t param)
 252                     ; 119 {
 253                     	switch	.text
 254  009e               L74_first_thread_func:
 256  009e 89            	pushw	x
 257       00000002      OFST:	set	2
 260                     ; 120 		int cnt = 0;
 262  009f 5f            	clrw	x
 263  00a0 1f01          	ldw	(OFST-1,sp),x
 264  00a2               L37:
 265                     ; 124         printf("first_thread_func cnt=%d\n", cnt++);
 267  00a2 1601          	ldw	y,(OFST-1,sp)
 268  00a4 0c02          	inc	(OFST+0,sp)
 269  00a6 2602          	jrne	L21
 270  00a8 0c01          	inc	(OFST-1,sp)
 271  00aa               L21:
 272  00aa 9089          	pushw	y
 273  00ac ae002f        	ldw	x,#L77
 274  00af cd0000        	call	_printf
 276  00b2 85            	popw	x
 277                     ; 127         atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 279  00b3 ae007d        	ldw	x,#125
 280  00b6 89            	pushw	x
 281  00b7 ae0000        	ldw	x,#0
 282  00ba 89            	pushw	x
 283  00bb cd0000        	call	_atomTimerDelay
 285  00be 5b04          	addw	sp,#4
 287  00c0 20e0          	jra	L37
 364                     ; 131 static void main_thread_func (uint32_t param)
 364                     ; 132 {
 365                     	switch	.text
 366  00c2               L101_main_thread_func:
 368  00c2 5207          	subw	sp,#7
 369       00000007      OFST:	set	7
 372                     ; 133     int cnt = 0;
 374  00c4 5f            	clrw	x
 375  00c5 1f06          	ldw	(OFST-1,sp),x
 376                     ; 135 		int i = 0;
 378  00c7 1e04          	ldw	x,(OFST-3,sp)
 379                     ; 136 		int flag = 1;
 381  00c9 ae0001        	ldw	x,#1
 382  00cc 1f02          	ldw	(OFST-5,sp),x
 383                     ; 138 		status = atomThreadCreate(&first_tcb,
 383                     ; 139 								 TEST_THREAD_PRIO, first_thread_func, 0,
 383                     ; 140 								 &first_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
 383                     ; 141 								 MAIN_STACK_SIZE_BYTES);
 385  00ce ae0100        	ldw	x,#256
 386  00d1 89            	pushw	x
 387  00d2 ae0000        	ldw	x,#0
 388  00d5 89            	pushw	x
 389  00d6 ae00ff        	ldw	x,#L7_first_thread_stack+255
 390  00d9 89            	pushw	x
 391  00da ae0000        	ldw	x,#0
 392  00dd 89            	pushw	x
 393  00de ae0000        	ldw	x,#0
 394  00e1 89            	pushw	x
 395  00e2 ae009e        	ldw	x,#L74_first_thread_func
 396  00e5 89            	pushw	x
 397  00e6 4b10          	push	#16
 398  00e8 ae0000        	ldw	x,#L31_first_tcb
 399  00eb cd0000        	call	_atomThreadCreate
 401  00ee 5b0d          	addw	sp,#13
 402  00f0 6b01          	ld	(OFST-6,sp),a
 403                     ; 142 		if (status != ATOM_OK)
 405  00f2 0d01          	tnz	(OFST-6,sp)
 406  00f4 2706          	jreq	L541
 407                     ; 144 				printf("atomThreadCreate first_thread_func fail!\n");
 409  00f6 ae0005        	ldw	x,#L341
 410  00f9 cd0000        	call	_printf
 412  00fc               L541:
 413                     ; 150 				cnt = flag ? (cnt + 1) : (cnt - 1);
 415  00fc 1e02          	ldw	x,(OFST-5,sp)
 416  00fe 2705          	jreq	L61
 417  0100 1e06          	ldw	x,(OFST-1,sp)
 418  0102 5c            	incw	x
 419  0103 2003          	jra	L02
 420  0105               L61:
 421  0105 1e06          	ldw	x,(OFST-1,sp)
 422  0107 5a            	decw	x
 423  0108               L02:
 424  0108 1f06          	ldw	(OFST-1,sp),x
 425                     ; 152 				flag = (cnt == 20) ? 0 : ((cnt == 0) ? 1 : flag);
 427  010a 1e06          	ldw	x,(OFST-1,sp)
 428  010c a30014        	cpw	x,#20
 429  010f 2603          	jrne	L22
 430  0111 5f            	clrw	x
 431  0112 200b          	jra	L42
 432  0114               L22:
 433  0114 1e06          	ldw	x,(OFST-1,sp)
 434  0116 2605          	jrne	L62
 435  0118 ae0001        	ldw	x,#1
 436  011b 2002          	jra	L03
 437  011d               L62:
 438  011d 1e02          	ldw	x,(OFST-5,sp)
 439  011f               L03:
 440  011f               L42:
 441  011f 1f02          	ldw	(OFST-5,sp),x
 442                     ; 154 				for(i=0; i<cnt; i++)
 444  0121 5f            	clrw	x
 445  0122 1f04          	ldw	(OFST-3,sp),x
 447  0124 2011          	jra	L551
 448  0126               L151:
 449                     ; 156 						printf(" ", cnt);
 451  0126 1e06          	ldw	x,(OFST-1,sp)
 452  0128 89            	pushw	x
 453  0129 ae0003        	ldw	x,#L161
 454  012c cd0000        	call	_printf
 456  012f 85            	popw	x
 457                     ; 154 				for(i=0; i<cnt; i++)
 459  0130 1e04          	ldw	x,(OFST-3,sp)
 460  0132 1c0001        	addw	x,#1
 461  0135 1f04          	ldw	(OFST-3,sp),x
 462  0137               L551:
 465  0137 9c            	rvf
 466  0138 1e04          	ldw	x,(OFST-3,sp)
 467  013a 1306          	cpw	x,(OFST-1,sp)
 468  013c 2fe8          	jrslt	L151
 469                     ; 158         printf("+\n");
 471  013e ae0000        	ldw	x,#L361
 472  0141 cd0000        	call	_printf
 474                     ; 161         atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 476  0144 ae007d        	ldw	x,#125
 477  0147 89            	pushw	x
 478  0148 ae0000        	ldw	x,#0
 479  014b 89            	pushw	x
 480  014c cd0000        	call	_atomTimerDelay
 482  014f 5b04          	addw	sp,#4
 484  0151 20a9          	jra	L541
 534                     ; 170 void main(void)
 534                     ; 171 {
 535                     	switch	.text
 536  0153               _main:
 538  0153 88            	push	a
 539       00000001      OFST:	set	1
 542                     ; 174 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 544  0154 4f            	clr	a
 545  0155 cd0000        	call	_CLK_SYSCLKDivConfig
 547                     ; 176 	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
 549  0158 4b01          	push	#1
 550  015a ae011c        	ldw	x,#284
 551  015d cd0000        	call	_SYSCFG_REMAPPinConfig
 553  0160 84            	pop	a
 554                     ; 179     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 556  0161 ae0001        	ldw	x,#1
 557  0164 a605          	ld	a,#5
 558  0166 95            	ld	xh,a
 559  0167 cd0000        	call	_CLK_PeripheralClockConfig
 561                     ; 182     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 563  016a 4b01          	push	#1
 564  016c 4b04          	push	#4
 565  016e ae5000        	ldw	x,#20480
 566  0171 cd0000        	call	_GPIO_ExternalPullUpConfig
 568  0174 85            	popw	x
 569                     ; 185     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 571  0175 4b01          	push	#1
 572  0177 4b08          	push	#8
 573  0179 ae5000        	ldw	x,#20480
 574  017c cd0000        	call	_GPIO_ExternalPullUpConfig
 576  017f 85            	popw	x
 577                     ; 188     USART_Init(USART1, 115200,
 577                     ; 189              USART_WordLength_8b,
 577                     ; 190              USART_StopBits_1,
 577                     ; 191              USART_Parity_No,
 577                     ; 192              (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 579  0180 4b0c          	push	#12
 580  0182 4b00          	push	#0
 581  0184 4b00          	push	#0
 582  0186 4b00          	push	#0
 583  0188 aec200        	ldw	x,#49664
 584  018b 89            	pushw	x
 585  018c ae0001        	ldw	x,#1
 586  018f 89            	pushw	x
 587  0190 ae5230        	ldw	x,#21040
 588  0193 cd0000        	call	_USART_Init
 590  0196 5b08          	addw	sp,#8
 591                     ; 195     GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
 593  0198 4be0          	push	#224
 594  019a 4b80          	push	#128
 595  019c ae5014        	ldw	x,#20500
 596  019f cd0000        	call	_GPIO_Init
 598  01a2 85            	popw	x
 599                     ; 197 	enableInterrupts();
 602  01a3 9a            rim
 604                     ; 199 	status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
 607  01a4 ae0080        	ldw	x,#128
 608  01a7 89            	pushw	x
 609  01a8 ae0000        	ldw	x,#0
 610  01ab 89            	pushw	x
 611  01ac ae027f        	ldw	x,#L3_idle_thread_stack+127
 612  01af cd0000        	call	_atomOSInit
 614  01b2 5b04          	addw	sp,#4
 615  01b4 6b01          	ld	(OFST+0,sp),a
 616                     ; 200 	if (status == ATOM_OK)
 618  01b6 0d01          	tnz	(OFST+0,sp)
 619  01b8 262e          	jrne	L702
 620                     ; 203 			archInitSystemTickTimer();
 622  01ba cd0000        	call	_archInitSystemTickTimer
 624                     ; 206 			status = atomThreadCreate(&main_tcb,
 624                     ; 207 									 TEST_THREAD_PRIO, main_thread_func, 0,
 624                     ; 208 									 &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
 624                     ; 209 									 MAIN_STACK_SIZE_BYTES);
 626  01bd ae0100        	ldw	x,#256
 627  01c0 89            	pushw	x
 628  01c1 ae0000        	ldw	x,#0
 629  01c4 89            	pushw	x
 630  01c5 ae01ff        	ldw	x,#L5_main_thread_stack+255
 631  01c8 89            	pushw	x
 632  01c9 ae0000        	ldw	x,#0
 633  01cc 89            	pushw	x
 634  01cd ae0000        	ldw	x,#0
 635  01d0 89            	pushw	x
 636  01d1 ae00c2        	ldw	x,#L101_main_thread_func
 637  01d4 89            	pushw	x
 638  01d5 4b10          	push	#16
 639  01d7 ae0011        	ldw	x,#L11_main_tcb
 640  01da cd0000        	call	_atomThreadCreate
 642  01dd 5b0d          	addw	sp,#13
 643  01df 6b01          	ld	(OFST+0,sp),a
 644                     ; 212 			if (status == ATOM_OK)
 646  01e1 0d01          	tnz	(OFST+0,sp)
 647  01e3 2603          	jrne	L702
 648                     ; 224 					atomOSStart();
 650  01e5 cd0000        	call	_atomOSStart
 652  01e8               L702:
 653                     ; 228   while (1);
 655  01e8 20fe          	jra	L702
 689                     ; 236 void Delay(__IO uint16_t nCount)
 689                     ; 237 {
 690                     	switch	.text
 691  01ea               _Delay:
 693  01ea 89            	pushw	x
 694       00000000      OFST:	set	0
 697  01eb 2007          	jra	L332
 698  01ed               L132:
 699                     ; 241     nCount--;
 701  01ed 1e01          	ldw	x,(OFST+1,sp)
 702  01ef 1d0001        	subw	x,#1
 703  01f2 1f01          	ldw	(OFST+1,sp),x
 704  01f4               L332:
 705                     ; 239   while (nCount != 0)
 707  01f4 1e01          	ldw	x,(OFST+1,sp)
 708  01f6 26f5          	jrne	L132
 709                     ; 243 }
 712  01f8 85            	popw	x
 713  01f9 81            	ret
 918                     	xdef	_main
 919                     	xdef	_Delay
 920                     	switch	.ubsct
 921  0000               L31_first_tcb:
 922  0000 000000000000  	ds.b	17
 923  0011               L11_main_tcb:
 924  0011 000000000000  	ds.b	17
 925                     	switch	.bss
 926  0000               L7_first_thread_stack:
 927  0000 000000000000  	ds.b	256
 928  0100               L5_main_thread_stack:
 929  0100 000000000000  	ds.b	256
 930  0200               L3_idle_thread_stack:
 931  0200 000000000000  	ds.b	128
 932                     	xref	_archInitSystemTickTimer
 933                     	xref	_atomThreadCreate
 934                     	xref	_atomOSStart
 935                     	xref	_atomOSInit
 936                     	xref	_atomTimerDelay
 937                     	xref	_USART_Init
 938                     	xref	_TIM4_ClearFlag
 939                     	xref	_TIM4_ITConfig
 940                     	xref	_TIM4_Cmd
 941                     	xref	_TIM4_TimeBaseInit
 942                     	xref	_TIM1_ITConfig
 943                     	xref	_TIM1_CCPreloadControl
 944                     	xref	_TIM1_CtrlPWMOutputs
 945                     	xref	_TIM1_BDTRConfig
 946                     	xref	_TIM1_OC3Init
 947                     	xref	_TIM1_OC2Init
 948                     	xref	_TIM1_OC1Init
 949                     	xref	_TIM1_Cmd
 950                     	xref	_TIM1_TimeBaseInit
 951                     	xref	_SYSCFG_REMAPPinConfig
 952                     	xref	_GPIO_ExternalPullUpConfig
 953                     	xref	_GPIO_Init
 954                     	xref	_CLK_PeripheralClockConfig
 955                     	xref	_CLK_SYSCLKDivConfig
 956                     	xref	_printf
 957                     .const:	section	.text
 958  0000               L361:
 959  0000 2b0a00        	dc.b	"+",10,0
 960  0003               L161:
 961  0003 2000          	dc.b	" ",0
 962  0005               L341:
 963  0005 61746f6d5468  	dc.b	"atomThreadCreate f"
 964  0017 697273745f74  	dc.b	"irst_thread_func f"
 965  0029 61696c210a00  	dc.b	"ail!",10,0
 966  002f               L77:
 967  002f 66697273745f  	dc.b	"first_thread_func "
 968  0041 636e743d2564  	dc.b	"cnt=%d",10,0
 988                     	end
