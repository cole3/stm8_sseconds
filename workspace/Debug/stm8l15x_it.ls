   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  32                     ; 62 {
  33                     	switch	.text
  34  0000               f_TRAP_IRQHandler:
  38                     ; 66 }
  41  0000 80            	iret
  63                     ; 72 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
  63                     ; 73 {
  64                     	switch	.text
  65  0001               f_FLASH_IRQHandler:
  69                     ; 77 }
  72  0001 80            	iret
  95                     ; 83 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
  95                     ; 84 {
  96                     	switch	.text
  97  0002               f_DMA1_CHANNEL0_1_IRQHandler:
 101                     ; 88 }
 104  0002 80            	iret
 127                     ; 94 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 127                     ; 95 {
 128                     	switch	.text
 129  0003               f_DMA1_CHANNEL2_3_IRQHandler:
 133                     ; 99 }
 136  0003 80            	iret
 159                     ; 105 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
 159                     ; 106 {
 160                     	switch	.text
 161  0004               f_RTC_CSSLSE_IRQHandler:
 165                     ; 110 }
 168  0004 80            	iret
 191                     ; 116 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 191                     ; 117 {
 192                     	switch	.text
 193  0005               f_EXTIE_F_PVD_IRQHandler:
 197                     ; 121 }
 200  0005 80            	iret
 222                     ; 128 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
 222                     ; 129 {
 223                     	switch	.text
 224  0006               f_EXTIB_G_IRQHandler:
 228                     ; 133 }
 231  0006 80            	iret
 253                     ; 140 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
 253                     ; 141 {
 254                     	switch	.text
 255  0007               f_EXTID_H_IRQHandler:
 259                     ; 145 }
 262  0007 80            	iret
 284                     ; 152 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 284                     ; 153 {
 285                     	switch	.text
 286  0008               f_EXTI0_IRQHandler:
 290                     ; 157 }
 293  0008 80            	iret
 315                     ; 164 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 315                     ; 165 {
 316                     	switch	.text
 317  0009               f_EXTI1_IRQHandler:
 321                     ; 169 }
 324  0009 80            	iret
 346                     ; 176 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 346                     ; 177 {
 347                     	switch	.text
 348  000a               f_EXTI2_IRQHandler:
 352                     ; 181 }
 355  000a 80            	iret
 377                     ; 188 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 377                     ; 189 {
 378                     	switch	.text
 379  000b               f_EXTI3_IRQHandler:
 383                     ; 193 }
 386  000b 80            	iret
 408                     ; 200 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 408                     ; 201 {
 409                     	switch	.text
 410  000c               f_EXTI4_IRQHandler:
 414                     ; 205 }
 417  000c 80            	iret
 439                     ; 212 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 439                     ; 213 {
 440                     	switch	.text
 441  000d               f_EXTI5_IRQHandler:
 445                     ; 217 }
 448  000d 80            	iret
 470                     ; 224 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 470                     ; 225 {
 471                     	switch	.text
 472  000e               f_EXTI6_IRQHandler:
 476                     ; 229 }
 479  000e 80            	iret
 501                     ; 236 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 501                     ; 237 {
 502                     	switch	.text
 503  000f               f_EXTI7_IRQHandler:
 507                     ; 241 }
 510  000f 80            	iret
 532                     ; 247 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
 532                     ; 248 {
 533                     	switch	.text
 534  0010               f_LCD_AES_IRQHandler:
 538                     ; 252 }
 541  0010 80            	iret
 564                     ; 258 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 564                     ; 259 {
 565                     	switch	.text
 566  0011               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 570                     ; 263 }
 573  0011 80            	iret
 596                     ; 270 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 596                     ; 271 {
 597                     	switch	.text
 598  0012               f_ADC1_COMP_IRQHandler:
 602                     ; 275 }
 605  0012 80            	iret
 629                     ; 282 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
 629                     ; 283 {
 630                     	switch	.text
 631  0013               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 635                     ; 287 }
 638  0013 80            	iret
 661                     ; 294 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
 661                     ; 295 {
 662                     	switch	.text
 663  0014               f_TIM2_CC_USART2_RX_IRQHandler:
 667                     ; 299 }
 670  0014 80            	iret
 694                     ; 307 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
 694                     ; 308 {
 695                     	switch	.text
 696  0015               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 700                     ; 312 }
 703  0015 80            	iret
 726                     ; 318 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
 726                     ; 319 {
 727                     	switch	.text
 728  0016               f_TIM3_CC_USART3_RX_IRQHandler:
 732                     ; 323 }
 735  0016 80            	iret
 759                     ; 329 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 759                     ; 330 {
 760                     	switch	.text
 761  0017               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 763  0017 3b0002        	push	c_x+2
 764  001a be00          	ldw	x,c_x
 765  001c 89            	pushw	x
 766  001d 3b0002        	push	c_y+2
 767  0020 be00          	ldw	x,c_y
 768  0022 89            	pushw	x
 771                     ; 332   TIM1_ClearITPendingBit(TIM1_IT_COM);
 773  0023 a620          	ld	a,#32
 774  0025 cd0000        	call	_TIM1_ClearITPendingBit
 776                     ; 333 }
 779  0028 85            	popw	x
 780  0029 bf00          	ldw	c_y,x
 781  002b 320002        	pop	c_y+2
 782  002e 85            	popw	x
 783  002f bf00          	ldw	c_x,x
 784  0031 320002        	pop	c_x+2
 785  0034 80            	iret
 807                     ; 339 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 807                     ; 340 {
 808                     	switch	.text
 809  0035               f_TIM1_CC_IRQHandler:
 813                     ; 344 }
 816  0035 80            	iret
 840                     ; 351 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 840                     ; 352 {
 841                     	switch	.text
 842  0036               f_TIM4_UPD_OVF_TRG_IRQHandler:
 844  0036 3b0002        	push	c_x+2
 845  0039 be00          	ldw	x,c_x
 846  003b 89            	pushw	x
 847  003c 3b0002        	push	c_y+2
 848  003f be00          	ldw	x,c_y
 849  0041 89            	pushw	x
 852                     ; 353   TIM4_ClearITPendingBit(TIM4_IT_Update);
 854  0042 a601          	ld	a,#1
 855  0044 cd0000        	call	_TIM4_ClearITPendingBit
 857                     ; 354 }
 860  0047 85            	popw	x
 861  0048 bf00          	ldw	c_y,x
 862  004a 320002        	pop	c_y+2
 863  004d 85            	popw	x
 864  004e bf00          	ldw	c_x,x
 865  0050 320002        	pop	c_x+2
 866  0053 80            	iret
 888                     ; 360 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 888                     ; 361 {
 889                     	switch	.text
 890  0054               f_SPI1_IRQHandler:
 894                     ; 365 }
 897  0054 80            	iret
 921                     ; 372 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 921                     ; 373 {
 922                     	switch	.text
 923  0055               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 927                     ; 377 }
 930  0055 80            	iret
 953                     ; 384 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 953                     ; 385 {
 954                     	switch	.text
 955  0056               f_USART1_RX_TIM5_CC_IRQHandler:
 959                     ; 389 }
 962  0056 80            	iret
 985                     ; 396 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
 985                     ; 397 {
 986                     	switch	.text
 987  0057               f_I2C1_SPI2_IRQHandler:
 991                     ; 401 }
 994  0057 80            	iret
1006                     	xdef	f_I2C1_SPI2_IRQHandler
1007                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1008                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1009                     	xdef	f_SPI1_IRQHandler
1010                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1011                     	xdef	f_TIM1_CC_IRQHandler
1012                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1013                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1014                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1015                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1016                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1017                     	xdef	f_ADC1_COMP_IRQHandler
1018                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1019                     	xdef	f_LCD_AES_IRQHandler
1020                     	xdef	f_EXTI7_IRQHandler
1021                     	xdef	f_EXTI6_IRQHandler
1022                     	xdef	f_EXTI5_IRQHandler
1023                     	xdef	f_EXTI4_IRQHandler
1024                     	xdef	f_EXTI3_IRQHandler
1025                     	xdef	f_EXTI2_IRQHandler
1026                     	xdef	f_EXTI1_IRQHandler
1027                     	xdef	f_EXTI0_IRQHandler
1028                     	xdef	f_EXTID_H_IRQHandler
1029                     	xdef	f_EXTIB_G_IRQHandler
1030                     	xdef	f_EXTIE_F_PVD_IRQHandler
1031                     	xdef	f_RTC_CSSLSE_IRQHandler
1032                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1033                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1034                     	xdef	f_FLASH_IRQHandler
1035                     	xdef	f_TRAP_IRQHandler
1036                     	xref	_TIM4_ClearITPendingBit
1037                     	xref	_TIM1_ClearITPendingBit
1038                     	xref.b	c_x
1039                     	xref.b	c_y
1058                     	end
