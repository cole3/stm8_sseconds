   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 50 uint8_t ITC_GetCPUCC(void)
  32                     ; 51 {
  34                     	switch	.text
  35  0000               _ITC_GetCPUCC:
  39                     ; 53     _asm("push cc");
  42  0000 8a            push cc
  44                     ; 54     _asm("pop a");
  47  0001 84            pop a
  49                     ; 55     return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 81 void ITC_DeInit(void)
  75                     ; 82 {
  76                     	switch	.text
  77  0003               _ITC_DeInit:
  81                     ; 83     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0003 35ff7f70      	mov	32624,#255
  84                     ; 84     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0007 35ff7f71      	mov	32625,#255
  87                     ; 85     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  000b 35ff7f72      	mov	32626,#255
  90                     ; 86     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000f 35ff7f73      	mov	32627,#255
  93                     ; 87     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0013 35ff7f74      	mov	32628,#255
  96                     ; 88     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0017 35ff7f75      	mov	32629,#255
  99                     ; 89     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  001b 35ff7f76      	mov	32630,#255
 102                     ; 90     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001f 35ff7f77      	mov	32631,#255
 105                     ; 91 }
 108  0023 81            	ret
 133                     ; 98 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 99 {
 134                     	switch	.text
 135  0024               _ITC_GetSoftIntStatus:
 139                     ; 100     return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 141  0024 adda          	call	_ITC_GetCPUCC
 143  0026 a428          	and	a,#40
 146  0028 81            	ret
 459                     .const:	section	.text
 460  0000               L22:
 461  0000 0052          	dc.w	L14
 462  0002 0052          	dc.w	L14
 463  0004 0052          	dc.w	L14
 464  0006 005b          	dc.w	L34
 465  0008 005b          	dc.w	L34
 466  000a 005b          	dc.w	L34
 467  000c 005b          	dc.w	L34
 468  000e 0064          	dc.w	L54
 469  0010 0064          	dc.w	L54
 470  0012 0064          	dc.w	L54
 471  0014 0064          	dc.w	L54
 472  0016 006d          	dc.w	L74
 473  0018 006d          	dc.w	L74
 474  001a 006d          	dc.w	L74
 475  001c 006d          	dc.w	L74
 476  001e 0076          	dc.w	L15
 477  0020 0076          	dc.w	L15
 478  0022 0076          	dc.w	L15
 479  0024 0076          	dc.w	L15
 480  0026 007f          	dc.w	L35
 481  0028 007f          	dc.w	L35
 482  002a 007f          	dc.w	L35
 483  002c 007f          	dc.w	L35
 484  002e 0088          	dc.w	L55
 485  0030 0088          	dc.w	L55
 486  0032 0088          	dc.w	L55
 487  0034 0088          	dc.w	L55
 488  0036 0091          	dc.w	L75
 489  0038 0091          	dc.w	L75
 490                     ; 108 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 490                     ; 109 {
 491                     	switch	.text
 492  0029               _ITC_GetSoftwarePriority:
 494  0029 88            	push	a
 495  002a 89            	pushw	x
 496       00000002      OFST:	set	2
 499                     ; 110     uint8_t Value = 0;
 501  002b 0f02          	clr	(OFST+0,sp)
 502                     ; 111     uint8_t Mask = 0;
 504  002d 7b01          	ld	a,(OFST-1,sp)
 505  002f 97            	ld	xl,a
 506                     ; 114     assert_param(IS_ITC_IRQ(IRQn));
 508                     ; 117     Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 510  0030 7b03          	ld	a,(OFST+1,sp)
 511  0032 a403          	and	a,#3
 512  0034 48            	sll	a
 513  0035 5f            	clrw	x
 514  0036 97            	ld	xl,a
 515  0037 a603          	ld	a,#3
 516  0039 5d            	tnzw	x
 517  003a 2704          	jreq	L41
 518  003c               L61:
 519  003c 48            	sll	a
 520  003d 5a            	decw	x
 521  003e 26fc          	jrne	L61
 522  0040               L41:
 523  0040 6b01          	ld	(OFST-1,sp),a
 524                     ; 119     switch (IRQn) {
 526  0042 7b03          	ld	a,(OFST+1,sp)
 528                     ; 213     default:
 528                     ; 214         break;
 529  0044 4a            	dec	a
 530  0045 a11d          	cp	a,#29
 531  0047 2407          	jruge	L02
 532  0049 5f            	clrw	x
 533  004a 97            	ld	xl,a
 534  004b 58            	sllw	x
 535  004c de0000        	ldw	x,(L22,x)
 536  004f fc            	jp	(x)
 537  0050               L02:
 538  0050 2046          	jra	L522
 539  0052               L14:
 540                     ; 120     case FLASH_IRQn:
 540                     ; 121     case DMA1_CHANNEL0_1_IRQn:
 540                     ; 122     case DMA1_CHANNEL2_3_IRQn:
 540                     ; 123         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 542  0052 c67f70        	ld	a,32624
 543  0055 1401          	and	a,(OFST-1,sp)
 544  0057 6b02          	ld	(OFST+0,sp),a
 545                     ; 124         break;
 547  0059 203d          	jra	L522
 548  005b               L34:
 549                     ; 126     case EXTIE_F_PVD_IRQn:
 549                     ; 127 #ifdef STM8L15X_MD
 549                     ; 128     case RTC_IRQn:
 549                     ; 129     case EXTIB_IRQn:
 549                     ; 130     case EXTID_IRQn:
 549                     ; 131 #elif defined (STM8L15X_LD)
 549                     ; 132     case RTC_CSSLSE_IRQn:
 549                     ; 133     case EXTIB_IRQn:
 549                     ; 134     case EXTID_IRQn:
 549                     ; 135 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 549                     ; 136     case RTC_CSSLSE_IRQn:
 549                     ; 137     case EXTIB_G_IRQn:
 549                     ; 138     case EXTID_H_IRQn:
 549                     ; 139 #endif  /* STM8L15X_MD */
 549                     ; 140         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 551  005b c67f71        	ld	a,32625
 552  005e 1401          	and	a,(OFST-1,sp)
 553  0060 6b02          	ld	(OFST+0,sp),a
 554                     ; 141         break;
 556  0062 2034          	jra	L522
 557  0064               L54:
 558                     ; 143     case EXTI0_IRQn:
 558                     ; 144     case EXTI1_IRQn:
 558                     ; 145     case EXTI2_IRQn:
 558                     ; 146     case EXTI3_IRQn:
 558                     ; 147         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 560  0064 c67f72        	ld	a,32626
 561  0067 1401          	and	a,(OFST-1,sp)
 562  0069 6b02          	ld	(OFST+0,sp),a
 563                     ; 148         break;
 565  006b 202b          	jra	L522
 566  006d               L74:
 567                     ; 150     case EXTI4_IRQn:
 567                     ; 151     case EXTI5_IRQn:
 567                     ; 152     case EXTI6_IRQn:
 567                     ; 153     case EXTI7_IRQn:
 567                     ; 154         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 569  006d c67f73        	ld	a,32627
 570  0070 1401          	and	a,(OFST-1,sp)
 571  0072 6b02          	ld	(OFST+0,sp),a
 572                     ; 155         break;
 574  0074 2022          	jra	L522
 575  0076               L15:
 576                     ; 160     case SWITCH_CSS_BREAK_DAC_IRQn:
 576                     ; 161 #endif /* STM8L15X_LD */
 576                     ; 162     case ADC1_COMP_IRQn:
 576                     ; 163 #ifdef STM8L15X_MD
 576                     ; 164     case LCD_IRQn:
 576                     ; 165     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 576                     ; 166 #elif defined (STM8L15X_LD)
 576                     ; 167     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 576                     ; 168 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 576                     ; 169     case LCD_AES_IRQn:
 576                     ; 170     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 576                     ; 171 #endif  /* STM8L15X_MD */
 576                     ; 172         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 578  0076 c67f74        	ld	a,32628
 579  0079 1401          	and	a,(OFST-1,sp)
 580  007b 6b02          	ld	(OFST+0,sp),a
 581                     ; 173         break;
 583  007d 2019          	jra	L522
 584  007f               L35:
 585                     ; 176     case TIM1_UPD_OVF_TRG_IRQn:
 585                     ; 177 #endif /* STM8L15X_LD */
 585                     ; 178 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 585                     ; 179     case TIM2_CC_IRQn:
 585                     ; 180     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 585                     ; 181     case TIM3_CC_IRQn:
 585                     ; 182 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 585                     ; 183     case TIM2_CC_USART2_RX_IRQn:
 585                     ; 184     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 585                     ; 185     case TIM3_CC_USART3_RX_IRQn:
 585                     ; 186 #endif  /* STM8L15X_MD */
 585                     ; 187         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 587  007f c67f75        	ld	a,32629
 588  0082 1401          	and	a,(OFST-1,sp)
 589  0084 6b02          	ld	(OFST+0,sp),a
 590                     ; 188         break;
 592  0086 2010          	jra	L522
 593  0088               L55:
 594                     ; 191     case TIM1_CC_IRQn:
 594                     ; 192 #endif /* STM8L15X_LD */
 594                     ; 193     case TIM4_UPD_OVF_TRG_IRQn:
 594                     ; 194     case SPI1_IRQn:
 594                     ; 195 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 594                     ; 196     case USART1_TX_IRQn:
 594                     ; 197 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 594                     ; 198     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 594                     ; 199 #endif  /* STM8L15X_MD || STM8L15X_LD */
 594                     ; 200         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 596  0088 c67f76        	ld	a,32630
 597  008b 1401          	and	a,(OFST-1,sp)
 598  008d 6b02          	ld	(OFST+0,sp),a
 599                     ; 201         break;
 601  008f 2007          	jra	L522
 602  0091               L75:
 603                     ; 207     case USART1_RX_TIM5_CC_IRQn:
 603                     ; 208     case I2C1_SPI2_IRQn:
 603                     ; 209 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 603                     ; 210         Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 605  0091 c67f77        	ld	a,32631
 606  0094 1401          	and	a,(OFST-1,sp)
 607  0096 6b02          	ld	(OFST+0,sp),a
 608                     ; 211         break;
 610  0098               L16:
 611                     ; 213     default:
 611                     ; 214         break;
 613  0098               L522:
 614                     ; 217     Value >>= (uint8_t)((IRQn % 4u) * 2u);
 616  0098 7b03          	ld	a,(OFST+1,sp)
 617  009a a403          	and	a,#3
 618  009c 48            	sll	a
 619  009d 5f            	clrw	x
 620  009e 97            	ld	xl,a
 621  009f 7b02          	ld	a,(OFST+0,sp)
 622  00a1 5d            	tnzw	x
 623  00a2 2704          	jreq	L42
 624  00a4               L62:
 625  00a4 44            	srl	a
 626  00a5 5a            	decw	x
 627  00a6 26fc          	jrne	L62
 628  00a8               L42:
 629  00a8 6b02          	ld	(OFST+0,sp),a
 630                     ; 219     return((ITC_PriorityLevel_TypeDef)Value);
 632  00aa 7b02          	ld	a,(OFST+0,sp)
 635  00ac 5b03          	addw	sp,#3
 636  00ae 81            	ret
 700                     	switch	.const
 701  003a               L44:
 702  003a 00ee          	dc.w	L722
 703  003c 00ee          	dc.w	L722
 704  003e 00ee          	dc.w	L722
 705  0040 0100          	dc.w	L132
 706  0042 0100          	dc.w	L132
 707  0044 0100          	dc.w	L132
 708  0046 0100          	dc.w	L132
 709  0048 0112          	dc.w	L332
 710  004a 0112          	dc.w	L332
 711  004c 0112          	dc.w	L332
 712  004e 0112          	dc.w	L332
 713  0050 0124          	dc.w	L532
 714  0052 0124          	dc.w	L532
 715  0054 0124          	dc.w	L532
 716  0056 0124          	dc.w	L532
 717  0058 0136          	dc.w	L732
 718  005a 0136          	dc.w	L732
 719  005c 0136          	dc.w	L732
 720  005e 0136          	dc.w	L732
 721  0060 0148          	dc.w	L142
 722  0062 0148          	dc.w	L142
 723  0064 0148          	dc.w	L142
 724  0066 0148          	dc.w	L142
 725  0068 015a          	dc.w	L342
 726  006a 015a          	dc.w	L342
 727  006c 015a          	dc.w	L342
 728  006e 015a          	dc.w	L342
 729  0070 016c          	dc.w	L542
 730  0072 016c          	dc.w	L542
 731                     ; 240 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 731                     ; 241 {
 732                     	switch	.text
 733  00af               _ITC_SetSoftwarePriority:
 735  00af 89            	pushw	x
 736  00b0 89            	pushw	x
 737       00000002      OFST:	set	2
 740                     ; 242     uint8_t Mask = 0;
 742  00b1 7b01          	ld	a,(OFST-1,sp)
 743  00b3 97            	ld	xl,a
 744                     ; 243     uint8_t NewPriority = 0;
 746  00b4 7b02          	ld	a,(OFST+0,sp)
 747  00b6 97            	ld	xl,a
 748                     ; 246     assert_param(IS_ITC_IRQ(IRQn));
 750                     ; 247     assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 752                     ; 250     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 754                     ; 254     Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 756  00b7 7b03          	ld	a,(OFST+1,sp)
 757  00b9 a403          	and	a,#3
 758  00bb 48            	sll	a
 759  00bc 5f            	clrw	x
 760  00bd 97            	ld	xl,a
 761  00be a603          	ld	a,#3
 762  00c0 5d            	tnzw	x
 763  00c1 2704          	jreq	L23
 764  00c3               L43:
 765  00c3 48            	sll	a
 766  00c4 5a            	decw	x
 767  00c5 26fc          	jrne	L43
 768  00c7               L23:
 769  00c7 43            	cpl	a
 770  00c8 6b01          	ld	(OFST-1,sp),a
 771                     ; 256     NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 773  00ca 7b03          	ld	a,(OFST+1,sp)
 774  00cc a403          	and	a,#3
 775  00ce 48            	sll	a
 776  00cf 5f            	clrw	x
 777  00d0 97            	ld	xl,a
 778  00d1 7b04          	ld	a,(OFST+2,sp)
 779  00d3 5d            	tnzw	x
 780  00d4 2704          	jreq	L63
 781  00d6               L04:
 782  00d6 48            	sll	a
 783  00d7 5a            	decw	x
 784  00d8 26fc          	jrne	L04
 785  00da               L63:
 786  00da 6b02          	ld	(OFST+0,sp),a
 787                     ; 258     switch (IRQn) {
 789  00dc 7b03          	ld	a,(OFST+1,sp)
 791                     ; 358     default:
 791                     ; 359         break;
 792  00de 4a            	dec	a
 793  00df a11d          	cp	a,#29
 794  00e1 2407          	jruge	L24
 795  00e3 5f            	clrw	x
 796  00e4 97            	ld	xl,a
 797  00e5 58            	sllw	x
 798  00e6 de003a        	ldw	x,(L44,x)
 799  00e9 fc            	jp	(x)
 800  00ea               L24:
 801  00ea ac7c017c      	jpf	L503
 802  00ee               L722:
 803                     ; 259     case FLASH_IRQn:
 803                     ; 260     case DMA1_CHANNEL0_1_IRQn:
 803                     ; 261     case DMA1_CHANNEL2_3_IRQn:
 803                     ; 262         ITC->ISPR1 &= Mask;
 805  00ee c67f70        	ld	a,32624
 806  00f1 1401          	and	a,(OFST-1,sp)
 807  00f3 c77f70        	ld	32624,a
 808                     ; 263         ITC->ISPR1 |= NewPriority;
 810  00f6 c67f70        	ld	a,32624
 811  00f9 1a02          	or	a,(OFST+0,sp)
 812  00fb c77f70        	ld	32624,a
 813                     ; 264         break;
 815  00fe 207c          	jra	L503
 816  0100               L132:
 817                     ; 266     case EXTIE_F_PVD_IRQn:
 817                     ; 267 #ifdef STM8L15X_MD
 817                     ; 268     case RTC_IRQn:
 817                     ; 269     case EXTIB_IRQn:
 817                     ; 270     case EXTID_IRQn:
 817                     ; 271 #elif defined (STM8L15X_LD)
 817                     ; 272     case RTC_CSSLSE_IRQn:
 817                     ; 273     case EXTIB_IRQn:
 817                     ; 274     case EXTID_IRQn:
 817                     ; 275 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 817                     ; 276     case RTC_CSSLSE_IRQn:
 817                     ; 277     case EXTIB_G_IRQn:
 817                     ; 278     case EXTID_H_IRQn:
 817                     ; 279 #endif  /* STM8L15X_MD */
 817                     ; 280         ITC->ISPR2 &= Mask;
 819  0100 c67f71        	ld	a,32625
 820  0103 1401          	and	a,(OFST-1,sp)
 821  0105 c77f71        	ld	32625,a
 822                     ; 281         ITC->ISPR2 |= NewPriority;
 824  0108 c67f71        	ld	a,32625
 825  010b 1a02          	or	a,(OFST+0,sp)
 826  010d c77f71        	ld	32625,a
 827                     ; 282         break;
 829  0110 206a          	jra	L503
 830  0112               L332:
 831                     ; 284     case EXTI0_IRQn:
 831                     ; 285     case EXTI1_IRQn:
 831                     ; 286     case EXTI2_IRQn:
 831                     ; 287     case EXTI3_IRQn:
 831                     ; 288         ITC->ISPR3 &= Mask;
 833  0112 c67f72        	ld	a,32626
 834  0115 1401          	and	a,(OFST-1,sp)
 835  0117 c77f72        	ld	32626,a
 836                     ; 289         ITC->ISPR3 |= NewPriority;
 838  011a c67f72        	ld	a,32626
 839  011d 1a02          	or	a,(OFST+0,sp)
 840  011f c77f72        	ld	32626,a
 841                     ; 290         break;
 843  0122 2058          	jra	L503
 844  0124               L532:
 845                     ; 292     case EXTI4_IRQn:
 845                     ; 293     case EXTI5_IRQn:
 845                     ; 294     case EXTI6_IRQn:
 845                     ; 295     case EXTI7_IRQn:
 845                     ; 296         ITC->ISPR4 &= Mask;
 847  0124 c67f73        	ld	a,32627
 848  0127 1401          	and	a,(OFST-1,sp)
 849  0129 c77f73        	ld	32627,a
 850                     ; 297         ITC->ISPR4 |= NewPriority;
 852  012c c67f73        	ld	a,32627
 853  012f 1a02          	or	a,(OFST+0,sp)
 854  0131 c77f73        	ld	32627,a
 855                     ; 298         break;
 857  0134 2046          	jra	L503
 858  0136               L732:
 859                     ; 300     case SWITCH_CSS_BREAK_DAC_IRQn:
 859                     ; 301 #else
 859                     ; 302     case SWITCH_CSS_IRQn:
 859                     ; 303 #endif /*	STM8L15X_LD	*/
 859                     ; 304     case ADC1_COMP_IRQn:
 859                     ; 305 #ifdef STM8L15X_MD
 859                     ; 306     case LCD_IRQn:
 859                     ; 307     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 859                     ; 308 #elif defined (STM8L15X_LD)
 859                     ; 309     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 859                     ; 310 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 859                     ; 311     case LCD_AES_IRQn:
 859                     ; 312     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 859                     ; 313 #endif  /* STM8L15X_MD */
 859                     ; 314         ITC->ISPR5 &= Mask;
 861  0136 c67f74        	ld	a,32628
 862  0139 1401          	and	a,(OFST-1,sp)
 863  013b c77f74        	ld	32628,a
 864                     ; 315         ITC->ISPR5 |= NewPriority;
 866  013e c67f74        	ld	a,32628
 867  0141 1a02          	or	a,(OFST+0,sp)
 868  0143 c77f74        	ld	32628,a
 869                     ; 316         break;
 871  0146 2034          	jra	L503
 872  0148               L142:
 873                     ; 318     case TIM1_UPD_OVF_TRG_IRQn:
 873                     ; 319 #endif  /* STM8L15X_LD */
 873                     ; 320 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 873                     ; 321     case TIM2_CC_IRQn:
 873                     ; 322     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 873                     ; 323     case TIM3_CC_IRQn:
 873                     ; 324 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 873                     ; 325     case TIM2_CC_USART2_RX_IRQn:
 873                     ; 326     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 873                     ; 327     case TIM3_CC_USART3_RX_IRQn:
 873                     ; 328 #endif  /* STM8L15X_MD */
 873                     ; 329         ITC->ISPR6 &= Mask;
 875  0148 c67f75        	ld	a,32629
 876  014b 1401          	and	a,(OFST-1,sp)
 877  014d c77f75        	ld	32629,a
 878                     ; 330         ITC->ISPR6 |= NewPriority;
 880  0150 c67f75        	ld	a,32629
 881  0153 1a02          	or	a,(OFST+0,sp)
 882  0155 c77f75        	ld	32629,a
 883                     ; 331         break;
 885  0158 2022          	jra	L503
 886  015a               L342:
 887                     ; 334     case TIM1_CC_IRQn:
 887                     ; 335 #endif  /* STM8L15X_LD */
 887                     ; 336     case TIM4_UPD_OVF_TRG_IRQn:
 887                     ; 337     case SPI1_IRQn:
 887                     ; 338 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 887                     ; 339     case USART1_TX_IRQn:
 887                     ; 340 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 887                     ; 341     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 887                     ; 342 #endif  /* STM8L15X_MD */
 887                     ; 343         ITC->ISPR7 &= Mask;
 889  015a c67f76        	ld	a,32630
 890  015d 1401          	and	a,(OFST-1,sp)
 891  015f c77f76        	ld	32630,a
 892                     ; 344         ITC->ISPR7 |= NewPriority;
 894  0162 c67f76        	ld	a,32630
 895  0165 1a02          	or	a,(OFST+0,sp)
 896  0167 c77f76        	ld	32630,a
 897                     ; 345         break;
 899  016a 2010          	jra	L503
 900  016c               L542:
 901                     ; 351     case USART1_RX_TIM5_CC_IRQn:
 901                     ; 352     case I2C1_SPI2_IRQn:
 901                     ; 353 #endif  /* STM8L15X_MD */
 901                     ; 354         ITC->ISPR8 &= Mask;
 903  016c c67f77        	ld	a,32631
 904  016f 1401          	and	a,(OFST-1,sp)
 905  0171 c77f77        	ld	32631,a
 906                     ; 355         ITC->ISPR8 |= NewPriority;
 908  0174 c67f77        	ld	a,32631
 909  0177 1a02          	or	a,(OFST+0,sp)
 910  0179 c77f77        	ld	32631,a
 911                     ; 356         break;
 913  017c               L742:
 914                     ; 358     default:
 914                     ; 359         break;
 916  017c               L503:
 917                     ; 361 }
 920  017c 5b04          	addw	sp,#4
 921  017e 81            	ret
 934                     	xdef	_ITC_GetSoftwarePriority
 935                     	xdef	_ITC_SetSoftwarePriority
 936                     	xdef	_ITC_GetSoftIntStatus
 937                     	xdef	_ITC_GetCPUCC
 938                     	xdef	_ITC_DeInit
 957                     	end
