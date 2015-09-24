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
 758                     ; 329 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 758                     ; 330 {
 759                     	switch	.text
 760  0017               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 764                     ; 332 }
 767  0017 80            	iret
 789                     ; 338 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
 789                     ; 339 {
 790                     	switch	.text
 791  0018               f_TIM1_CC_IRQHandler:
 795                     ; 343 }
 798  0018 80            	iret
 821                     ; 350 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 821                     ; 351 {
 822                     	switch	.text
 823  0019               f_TIM4_UPD_OVF_TRG_IRQHandler:
 827                     ; 355 }
 830  0019 80            	iret
 852                     ; 361 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 852                     ; 362 {
 853                     	switch	.text
 854  001a               f_SPI1_IRQHandler:
 858                     ; 366 }
 861  001a 80            	iret
 885                     ; 373 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
 885                     ; 374 {
 886                     	switch	.text
 887  001b               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 891                     ; 378 }
 894  001b 80            	iret
 917                     ; 385 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
 917                     ; 386 {
 918                     	switch	.text
 919  001c               f_USART1_RX_TIM5_CC_IRQHandler:
 923                     ; 390 }
 926  001c 80            	iret
 949                     ; 397 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
 949                     ; 398 {
 950                     	switch	.text
 951  001d               f_I2C1_SPI2_IRQHandler:
 955                     ; 402 }
 958  001d 80            	iret
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
