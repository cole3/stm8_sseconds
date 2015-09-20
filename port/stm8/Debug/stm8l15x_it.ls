   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  32                     ; 62 {
  33                     .text:	section	.text,new
  34  0000               f_TRAP_IRQHandler:
  38                     ; 66 }
  41  0000 80            	iret
  63                     ; 72 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
  63                     ; 73 {
  64                     .text:	section	.text,new
  65  0000               f_FLASH_IRQHandler:
  69                     ; 77 }
  72  0000 80            	iret
  95                     ; 83 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
  95                     ; 84 {
  96                     .text:	section	.text,new
  97  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 101                     ; 88 }
 104  0000 80            	iret
 127                     ; 94 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 127                     ; 95 {
 128                     .text:	section	.text,new
 129  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 133                     ; 99 }
 136  0000 80            	iret
 159                     ; 105 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
 159                     ; 106 {
 160                     .text:	section	.text,new
 161  0000               f_RTC_CSSLSE_IRQHandler:
 165                     ; 110 }
 168  0000 80            	iret
 191                     ; 116 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 191                     ; 117 {
 192                     .text:	section	.text,new
 193  0000               f_EXTIE_F_PVD_IRQHandler:
 197                     ; 121 }
 200  0000 80            	iret
 222                     ; 128 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
 222                     ; 129 {
 223                     .text:	section	.text,new
 224  0000               f_EXTIB_G_IRQHandler:
 228                     ; 133 }
 231  0000 80            	iret
 253                     ; 140 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
 253                     ; 141 {
 254                     .text:	section	.text,new
 255  0000               f_EXTID_H_IRQHandler:
 259                     ; 145 }
 262  0000 80            	iret
 284                     ; 152 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 284                     ; 153 {
 285                     .text:	section	.text,new
 286  0000               f_EXTI0_IRQHandler:
 290                     ; 157 }
 293  0000 80            	iret
 315                     ; 164 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 315                     ; 165 {
 316                     .text:	section	.text,new
 317  0000               f_EXTI1_IRQHandler:
 321                     ; 169 }
 324  0000 80            	iret
 346                     ; 176 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 346                     ; 177 {
 347                     .text:	section	.text,new
 348  0000               f_EXTI2_IRQHandler:
 352                     ; 181 }
 355  0000 80            	iret
 377                     ; 188 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 377                     ; 189 {
 378                     .text:	section	.text,new
 379  0000               f_EXTI3_IRQHandler:
 383                     ; 193 }
 386  0000 80            	iret
 408                     ; 200 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 408                     ; 201 {
 409                     .text:	section	.text,new
 410  0000               f_EXTI4_IRQHandler:
 414                     ; 205 }
 417  0000 80            	iret
 439                     ; 212 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 439                     ; 213 {
 440                     .text:	section	.text,new
 441  0000               f_EXTI5_IRQHandler:
 445                     ; 217 }
 448  0000 80            	iret
 470                     ; 224 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 470                     ; 225 {
 471                     .text:	section	.text,new
 472  0000               f_EXTI6_IRQHandler:
 476                     ; 229 }
 479  0000 80            	iret
 501                     ; 236 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 501                     ; 237 {
 502                     .text:	section	.text,new
 503  0000               f_EXTI7_IRQHandler:
 507                     ; 241 }
 510  0000 80            	iret
 532                     ; 247 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
 532                     ; 248 {
 533                     .text:	section	.text,new
 534  0000               f_LCD_AES_IRQHandler:
 538                     ; 252 }
 541  0000 80            	iret
 564                     ; 258 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 564                     ; 259 {
 565                     .text:	section	.text,new
 566  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 570                     ; 263 }
 573  0000 80            	iret
 596                     ; 270 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 596                     ; 271 {
 597                     .text:	section	.text,new
 598  0000               f_ADC1_COMP_IRQHandler:
 602                     ; 275 }
 605  0000 80            	iret
 629                     ; 282 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
 629                     ; 283 {
 630                     .text:	section	.text,new
 631  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 635                     ; 287 }
 638  0000 80            	iret
 661                     ; 294 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
 661                     ; 295 {
 662                     .text:	section	.text,new
 663  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 667                     ; 299 }
 670  0000 80            	iret
 694                     ; 307 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
 694                     ; 308 {
 695                     .text:	section	.text,new
 696  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 700                     ; 312 }
 703  0000 80            	iret
 726                     ; 318 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
 726                     ; 319 {
 727                     .text:	section	.text,new
 728  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 732                     ; 323 }
 735  0000 80            	iret
 758                     ; 329 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 758                     ; 330 {
 759                     .text:	section	.text,new
 760  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 764                     ; 334 }
 767  0000 80            	iret
 789                     ; 340 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 789                     ; 341 {
 790                     .text:	section	.text,new
 791  0000               f_TIM1_CC_IRQHandler:
 795                     ; 345 }
 798  0000 80            	iret
 821                     ; 352 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 821                     ; 353 {
 822                     .text:	section	.text,new
 823  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 827                     ; 357 }
 830  0000 80            	iret
 852                     ; 363 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 852                     ; 364 {
 853                     .text:	section	.text,new
 854  0000               f_SPI1_IRQHandler:
 858                     ; 368 }
 861  0000 80            	iret
 885                     ; 375 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 885                     ; 376 {
 886                     .text:	section	.text,new
 887  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 891                     ; 380 }
 894  0000 80            	iret
 917                     ; 387 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 917                     ; 388 {
 918                     .text:	section	.text,new
 919  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 923                     ; 392 }
 926  0000 80            	iret
 949                     ; 399 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
 949                     ; 400 {
 950                     .text:	section	.text,new
 951  0000               f_I2C1_SPI2_IRQHandler:
 955                     ; 404 }
 958  0000 80            	iret
 970                     	xdef	f_I2C1_SPI2_IRQHandler
 971                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
 972                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 973                     	xdef	f_SPI1_IRQHandler
 974                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 975                     	xdef	f_TIM1_CC_IRQHandler
 976                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 977                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
 978                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 979                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
 980                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 981                     	xdef	f_ADC1_COMP_IRQHandler
 982                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 983                     	xdef	f_LCD_AES_IRQHandler
 984                     	xdef	f_EXTI7_IRQHandler
 985                     	xdef	f_EXTI6_IRQHandler
 986                     	xdef	f_EXTI5_IRQHandler
 987                     	xdef	f_EXTI4_IRQHandler
 988                     	xdef	f_EXTI3_IRQHandler
 989                     	xdef	f_EXTI2_IRQHandler
 990                     	xdef	f_EXTI1_IRQHandler
 991                     	xdef	f_EXTI0_IRQHandler
 992                     	xdef	f_EXTID_H_IRQHandler
 993                     	xdef	f_EXTIB_G_IRQHandler
 994                     	xdef	f_EXTIE_F_PVD_IRQHandler
 995                     	xdef	f_RTC_CSSLSE_IRQHandler
 996                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
 997                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
 998                     	xdef	f_FLASH_IRQHandler
 999                     	xdef	f_TRAP_IRQHandler
1018                     	end
