   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 50 uint8_t ITC_GetCPUCC(void)
  32                     ; 51 {
  34                     .text:	section	.text,new
  35  0000               _ITC_GetCPUCC:
  39                     ; 53   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 54   _asm("pop a");
  47  0001 84            pop a
  49                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 81 void ITC_DeInit(void)
  75                     ; 82 {
  76                     .text:	section	.text,new
  77  0000               _ITC_DeInit:
  81                     ; 83   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0000 35ff7f70      	mov	32624,#255
  84                     ; 84   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0004 35ff7f71      	mov	32625,#255
  87                     ; 85   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  0008 35ff7f72      	mov	32626,#255
  90                     ; 86   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000c 35ff7f73      	mov	32627,#255
  93                     ; 87   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0010 35ff7f74      	mov	32628,#255
  96                     ; 88   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0014 35ff7f75      	mov	32629,#255
  99                     ; 89   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  0018 35ff7f76      	mov	32630,#255
 102                     ; 90   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001c 35ff7f77      	mov	32631,#255
 105                     ; 91 }
 108  0020 81            	ret
 133                     ; 98 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 99 {
 134                     .text:	section	.text,new
 135  0000               _ITC_GetSoftIntStatus:
 139                     ; 100   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 141  0000 cd0000        	call	_ITC_GetCPUCC
 143  0003 a428          	and	a,#40
 146  0005 81            	ret
 455                     .const:	section	.text
 456  0000               L22:
 457  0000 0029          	dc.w	L14
 458  0002 0029          	dc.w	L14
 459  0004 0029          	dc.w	L14
 460  0006 0032          	dc.w	L34
 461  0008 0032          	dc.w	L34
 462  000a 0032          	dc.w	L34
 463  000c 0032          	dc.w	L34
 464  000e 003b          	dc.w	L54
 465  0010 003b          	dc.w	L54
 466  0012 003b          	dc.w	L54
 467  0014 003b          	dc.w	L54
 468  0016 0044          	dc.w	L74
 469  0018 0044          	dc.w	L74
 470  001a 0044          	dc.w	L74
 471  001c 0044          	dc.w	L74
 472  001e 004d          	dc.w	L15
 473  0020 004d          	dc.w	L15
 474  0022 004d          	dc.w	L15
 475  0024 004d          	dc.w	L15
 476  0026 0056          	dc.w	L35
 477  0028 0056          	dc.w	L35
 478  002a 0056          	dc.w	L35
 479  002c 0056          	dc.w	L35
 480  002e 005f          	dc.w	L55
 481  0030 005f          	dc.w	L55
 482  0032 005f          	dc.w	L55
 483  0034 005f          	dc.w	L55
 484  0036 0068          	dc.w	L75
 485  0038 0068          	dc.w	L75
 486                     ; 108 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 486                     ; 109 {
 487                     .text:	section	.text,new
 488  0000               _ITC_GetSoftwarePriority:
 490  0000 88            	push	a
 491  0001 89            	pushw	x
 492       00000002      OFST:	set	2
 495                     ; 110   uint8_t Value = 0;
 497  0002 0f02          	clr	(OFST+0,sp)
 498                     ; 111   uint8_t Mask = 0;
 500  0004 7b01          	ld	a,(OFST-1,sp)
 501  0006 97            	ld	xl,a
 502                     ; 114   assert_param(IS_ITC_IRQ(IRQn));
 504                     ; 117   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 506  0007 7b03          	ld	a,(OFST+1,sp)
 507  0009 a403          	and	a,#3
 508  000b 48            	sll	a
 509  000c 5f            	clrw	x
 510  000d 97            	ld	xl,a
 511  000e a603          	ld	a,#3
 512  0010 5d            	tnzw	x
 513  0011 2704          	jreq	L41
 514  0013               L61:
 515  0013 48            	sll	a
 516  0014 5a            	decw	x
 517  0015 26fc          	jrne	L61
 518  0017               L41:
 519  0017 6b01          	ld	(OFST-1,sp),a
 520                     ; 119   switch (IRQn)
 522  0019 7b03          	ld	a,(OFST+1,sp)
 524                     ; 214     default:
 524                     ; 215       break;
 525  001b 4a            	dec	a
 526  001c a11d          	cp	a,#29
 527  001e 2407          	jruge	L02
 528  0020 5f            	clrw	x
 529  0021 97            	ld	xl,a
 530  0022 58            	sllw	x
 531  0023 de0000        	ldw	x,(L22,x)
 532  0026 fc            	jp	(x)
 533  0027               L02:
 534  0027 2046          	jra	L122
 535  0029               L14:
 536                     ; 121     case FLASH_IRQn:
 536                     ; 122     case DMA1_CHANNEL0_1_IRQn:
 536                     ; 123     case DMA1_CHANNEL2_3_IRQn:
 536                     ; 124       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 538  0029 c67f70        	ld	a,32624
 539  002c 1401          	and	a,(OFST-1,sp)
 540  002e 6b02          	ld	(OFST+0,sp),a
 541                     ; 125       break;
 543  0030 203d          	jra	L122
 544  0032               L34:
 545                     ; 127     case EXTIE_F_PVD_IRQn:
 545                     ; 128 #ifdef STM8L15X_MD
 545                     ; 129     case RTC_IRQn:
 545                     ; 130     case EXTIB_IRQn:
 545                     ; 131     case EXTID_IRQn:
 545                     ; 132 #elif defined (STM8L15X_LD)
 545                     ; 133     case RTC_CSSLSE_IRQn:
 545                     ; 134     case EXTIB_IRQn:
 545                     ; 135     case EXTID_IRQn:
 545                     ; 136 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 545                     ; 137     case RTC_CSSLSE_IRQn:
 545                     ; 138     case EXTIB_G_IRQn:
 545                     ; 139     case EXTID_H_IRQn:
 545                     ; 140 #endif  /* STM8L15X_MD */
 545                     ; 141       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 547  0032 c67f71        	ld	a,32625
 548  0035 1401          	and	a,(OFST-1,sp)
 549  0037 6b02          	ld	(OFST+0,sp),a
 550                     ; 142       break;
 552  0039 2034          	jra	L122
 553  003b               L54:
 554                     ; 144     case EXTI0_IRQn:
 554                     ; 145     case EXTI1_IRQn:
 554                     ; 146     case EXTI2_IRQn:
 554                     ; 147     case EXTI3_IRQn:
 554                     ; 148       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 556  003b c67f72        	ld	a,32626
 557  003e 1401          	and	a,(OFST-1,sp)
 558  0040 6b02          	ld	(OFST+0,sp),a
 559                     ; 149       break;
 561  0042 202b          	jra	L122
 562  0044               L74:
 563                     ; 151     case EXTI4_IRQn:
 563                     ; 152     case EXTI5_IRQn:
 563                     ; 153     case EXTI6_IRQn:
 563                     ; 154     case EXTI7_IRQn:
 563                     ; 155       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 565  0044 c67f73        	ld	a,32627
 566  0047 1401          	and	a,(OFST-1,sp)
 567  0049 6b02          	ld	(OFST+0,sp),a
 568                     ; 156       break;
 570  004b 2022          	jra	L122
 571  004d               L15:
 572                     ; 161     case SWITCH_CSS_BREAK_DAC_IRQn:
 572                     ; 162 #endif /* STM8L15X_LD */		
 572                     ; 163     case ADC1_COMP_IRQn:
 572                     ; 164 #ifdef STM8L15X_MD
 572                     ; 165     case LCD_IRQn:
 572                     ; 166     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 167 #elif defined (STM8L15X_LD)
 572                     ; 168     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 169 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 572                     ; 170     case LCD_AES_IRQn:
 572                     ; 171     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 572                     ; 172 #endif  /* STM8L15X_MD */
 572                     ; 173       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 574  004d c67f74        	ld	a,32628
 575  0050 1401          	and	a,(OFST-1,sp)
 576  0052 6b02          	ld	(OFST+0,sp),a
 577                     ; 174       break;
 579  0054 2019          	jra	L122
 580  0056               L35:
 581                     ; 177     case TIM1_UPD_OVF_TRG_IRQn:
 581                     ; 178 #endif /* STM8L15X_LD */		
 581                     ; 179 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 581                     ; 180     case TIM2_CC_IRQn:
 581                     ; 181     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 581                     ; 182     case TIM3_CC_IRQn:
 581                     ; 183 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 581                     ; 184     case TIM2_CC_USART2_RX_IRQn:
 581                     ; 185     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 581                     ; 186     case TIM3_CC_USART3_RX_IRQn:
 581                     ; 187 #endif  /* STM8L15X_MD */
 581                     ; 188       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 583  0056 c67f75        	ld	a,32629
 584  0059 1401          	and	a,(OFST-1,sp)
 585  005b 6b02          	ld	(OFST+0,sp),a
 586                     ; 189       break;
 588  005d 2010          	jra	L122
 589  005f               L55:
 590                     ; 192     case TIM1_CC_IRQn:
 590                     ; 193 #endif /* STM8L15X_LD */	
 590                     ; 194     case TIM4_UPD_OVF_TRG_IRQn:
 590                     ; 195     case SPI1_IRQn:
 590                     ; 196 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 590                     ; 197     case USART1_TX_IRQn:
 590                     ; 198 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 590                     ; 199     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 590                     ; 200 #endif  /* STM8L15X_MD || STM8L15X_LD */
 590                     ; 201       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 592  005f c67f76        	ld	a,32630
 593  0062 1401          	and	a,(OFST-1,sp)
 594  0064 6b02          	ld	(OFST+0,sp),a
 595                     ; 202       break;
 597  0066 2007          	jra	L122
 598  0068               L75:
 599                     ; 208     case USART1_RX_TIM5_CC_IRQn:
 599                     ; 209     case I2C1_SPI2_IRQn:
 599                     ; 210 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 599                     ; 211       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 601  0068 c67f77        	ld	a,32631
 602  006b 1401          	and	a,(OFST-1,sp)
 603  006d 6b02          	ld	(OFST+0,sp),a
 604                     ; 212       break;
 606  006f               L16:
 607                     ; 214     default:
 607                     ; 215       break;
 609  006f               L122:
 610                     ; 218   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 612  006f 7b03          	ld	a,(OFST+1,sp)
 613  0071 a403          	and	a,#3
 614  0073 48            	sll	a
 615  0074 5f            	clrw	x
 616  0075 97            	ld	xl,a
 617  0076 7b02          	ld	a,(OFST+0,sp)
 618  0078 5d            	tnzw	x
 619  0079 2704          	jreq	L42
 620  007b               L62:
 621  007b 44            	srl	a
 622  007c 5a            	decw	x
 623  007d 26fc          	jrne	L62
 624  007f               L42:
 625  007f 6b02          	ld	(OFST+0,sp),a
 626                     ; 220   return((ITC_PriorityLevel_TypeDef)Value);
 628  0081 7b02          	ld	a,(OFST+0,sp)
 631  0083 5b03          	addw	sp,#3
 632  0085 81            	ret
 692                     	switch	.const
 693  003a               L44:
 694  003a 003f          	dc.w	L322
 695  003c 003f          	dc.w	L322
 696  003e 003f          	dc.w	L322
 697  0040 0051          	dc.w	L522
 698  0042 0051          	dc.w	L522
 699  0044 0051          	dc.w	L522
 700  0046 0051          	dc.w	L522
 701  0048 0063          	dc.w	L722
 702  004a 0063          	dc.w	L722
 703  004c 0063          	dc.w	L722
 704  004e 0063          	dc.w	L722
 705  0050 0075          	dc.w	L132
 706  0052 0075          	dc.w	L132
 707  0054 0075          	dc.w	L132
 708  0056 0075          	dc.w	L132
 709  0058 0087          	dc.w	L332
 710  005a 0087          	dc.w	L332
 711  005c 0087          	dc.w	L332
 712  005e 0087          	dc.w	L332
 713  0060 0099          	dc.w	L532
 714  0062 0099          	dc.w	L532
 715  0064 0099          	dc.w	L532
 716  0066 0099          	dc.w	L532
 717  0068 00ab          	dc.w	L732
 718  006a 00ab          	dc.w	L732
 719  006c 00ab          	dc.w	L732
 720  006e 00ab          	dc.w	L732
 721  0070 00bd          	dc.w	L142
 722  0072 00bd          	dc.w	L142
 723                     ; 241 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 723                     ; 242 {
 724                     .text:	section	.text,new
 725  0000               _ITC_SetSoftwarePriority:
 727  0000 89            	pushw	x
 728  0001 89            	pushw	x
 729       00000002      OFST:	set	2
 732                     ; 243   uint8_t Mask = 0;
 734  0002 7b01          	ld	a,(OFST-1,sp)
 735  0004 97            	ld	xl,a
 736                     ; 244   uint8_t NewPriority = 0;
 738  0005 7b02          	ld	a,(OFST+0,sp)
 739  0007 97            	ld	xl,a
 740                     ; 247   assert_param(IS_ITC_IRQ(IRQn));
 742                     ; 248   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 744                     ; 251   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 746                     ; 255   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 748  0008 7b03          	ld	a,(OFST+1,sp)
 749  000a a403          	and	a,#3
 750  000c 48            	sll	a
 751  000d 5f            	clrw	x
 752  000e 97            	ld	xl,a
 753  000f a603          	ld	a,#3
 754  0011 5d            	tnzw	x
 755  0012 2704          	jreq	L23
 756  0014               L43:
 757  0014 48            	sll	a
 758  0015 5a            	decw	x
 759  0016 26fc          	jrne	L43
 760  0018               L23:
 761  0018 43            	cpl	a
 762  0019 6b01          	ld	(OFST-1,sp),a
 763                     ; 257   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 765  001b 7b03          	ld	a,(OFST+1,sp)
 766  001d a403          	and	a,#3
 767  001f 48            	sll	a
 768  0020 5f            	clrw	x
 769  0021 97            	ld	xl,a
 770  0022 7b04          	ld	a,(OFST+2,sp)
 771  0024 5d            	tnzw	x
 772  0025 2704          	jreq	L63
 773  0027               L04:
 774  0027 48            	sll	a
 775  0028 5a            	decw	x
 776  0029 26fc          	jrne	L04
 777  002b               L63:
 778  002b 6b02          	ld	(OFST+0,sp),a
 779                     ; 259   switch (IRQn)
 781  002d 7b03          	ld	a,(OFST+1,sp)
 783                     ; 360     default:
 783                     ; 361       break;
 784  002f 4a            	dec	a
 785  0030 a11d          	cp	a,#29
 786  0032 2407          	jruge	L24
 787  0034 5f            	clrw	x
 788  0035 97            	ld	xl,a
 789  0036 58            	sllw	x
 790  0037 de003a        	ldw	x,(L44,x)
 791  003a fc            	jp	(x)
 792  003b               L24:
 793  003b accd00cd      	jpf	L572
 794  003f               L322:
 795                     ; 261     case FLASH_IRQn:
 795                     ; 262     case DMA1_CHANNEL0_1_IRQn:
 795                     ; 263     case DMA1_CHANNEL2_3_IRQn:
 795                     ; 264       ITC->ISPR1 &= Mask;
 797  003f c67f70        	ld	a,32624
 798  0042 1401          	and	a,(OFST-1,sp)
 799  0044 c77f70        	ld	32624,a
 800                     ; 265       ITC->ISPR1 |= NewPriority;
 802  0047 c67f70        	ld	a,32624
 803  004a 1a02          	or	a,(OFST+0,sp)
 804  004c c77f70        	ld	32624,a
 805                     ; 266       break;
 807  004f 207c          	jra	L572
 808  0051               L522:
 809                     ; 268     case EXTIE_F_PVD_IRQn:
 809                     ; 269 #ifdef STM8L15X_MD
 809                     ; 270     case RTC_IRQn:
 809                     ; 271     case EXTIB_IRQn:
 809                     ; 272     case EXTID_IRQn:
 809                     ; 273 #elif defined (STM8L15X_LD)
 809                     ; 274     case RTC_CSSLSE_IRQn:
 809                     ; 275     case EXTIB_IRQn:
 809                     ; 276     case EXTID_IRQn:
 809                     ; 277 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 809                     ; 278     case RTC_CSSLSE_IRQn:
 809                     ; 279     case EXTIB_G_IRQn:
 809                     ; 280     case EXTID_H_IRQn:
 809                     ; 281 #endif  /* STM8L15X_MD */
 809                     ; 282       ITC->ISPR2 &= Mask;
 811  0051 c67f71        	ld	a,32625
 812  0054 1401          	and	a,(OFST-1,sp)
 813  0056 c77f71        	ld	32625,a
 814                     ; 283       ITC->ISPR2 |= NewPriority;
 816  0059 c67f71        	ld	a,32625
 817  005c 1a02          	or	a,(OFST+0,sp)
 818  005e c77f71        	ld	32625,a
 819                     ; 284       break;
 821  0061 206a          	jra	L572
 822  0063               L722:
 823                     ; 286     case EXTI0_IRQn:
 823                     ; 287     case EXTI1_IRQn:
 823                     ; 288     case EXTI2_IRQn:
 823                     ; 289     case EXTI3_IRQn:
 823                     ; 290       ITC->ISPR3 &= Mask;
 825  0063 c67f72        	ld	a,32626
 826  0066 1401          	and	a,(OFST-1,sp)
 827  0068 c77f72        	ld	32626,a
 828                     ; 291       ITC->ISPR3 |= NewPriority;
 830  006b c67f72        	ld	a,32626
 831  006e 1a02          	or	a,(OFST+0,sp)
 832  0070 c77f72        	ld	32626,a
 833                     ; 292       break;
 835  0073 2058          	jra	L572
 836  0075               L132:
 837                     ; 294     case EXTI4_IRQn:
 837                     ; 295     case EXTI5_IRQn:
 837                     ; 296     case EXTI6_IRQn:
 837                     ; 297     case EXTI7_IRQn:
 837                     ; 298       ITC->ISPR4 &= Mask;
 839  0075 c67f73        	ld	a,32627
 840  0078 1401          	and	a,(OFST-1,sp)
 841  007a c77f73        	ld	32627,a
 842                     ; 299       ITC->ISPR4 |= NewPriority;
 844  007d c67f73        	ld	a,32627
 845  0080 1a02          	or	a,(OFST+0,sp)
 846  0082 c77f73        	ld	32627,a
 847                     ; 300       break;
 849  0085 2046          	jra	L572
 850  0087               L332:
 851                     ; 302     case SWITCH_CSS_BREAK_DAC_IRQn:
 851                     ; 303 #else
 851                     ; 304     case SWITCH_CSS_IRQn:
 851                     ; 305 #endif /*	STM8L15X_LD	*/
 851                     ; 306     case ADC1_COMP_IRQn:
 851                     ; 307 #ifdef STM8L15X_MD
 851                     ; 308     case LCD_IRQn:
 851                     ; 309     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 851                     ; 310 #elif defined (STM8L15X_LD)
 851                     ; 311     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 851                     ; 312 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 851                     ; 313     case LCD_AES_IRQn:
 851                     ; 314     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 851                     ; 315 #endif  /* STM8L15X_MD */
 851                     ; 316       ITC->ISPR5 &= Mask;
 853  0087 c67f74        	ld	a,32628
 854  008a 1401          	and	a,(OFST-1,sp)
 855  008c c77f74        	ld	32628,a
 856                     ; 317       ITC->ISPR5 |= NewPriority;
 858  008f c67f74        	ld	a,32628
 859  0092 1a02          	or	a,(OFST+0,sp)
 860  0094 c77f74        	ld	32628,a
 861                     ; 318       break;
 863  0097 2034          	jra	L572
 864  0099               L532:
 865                     ; 320     case TIM1_UPD_OVF_TRG_IRQn:
 865                     ; 321 #endif  /* STM8L15X_LD */
 865                     ; 322 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 865                     ; 323     case TIM2_CC_IRQn:
 865                     ; 324     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 865                     ; 325     case TIM3_CC_IRQn:
 865                     ; 326 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 865                     ; 327     case TIM2_CC_USART2_RX_IRQn:
 865                     ; 328     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 865                     ; 329     case TIM3_CC_USART3_RX_IRQn:
 865                     ; 330 #endif  /* STM8L15X_MD */
 865                     ; 331       ITC->ISPR6 &= Mask;
 867  0099 c67f75        	ld	a,32629
 868  009c 1401          	and	a,(OFST-1,sp)
 869  009e c77f75        	ld	32629,a
 870                     ; 332       ITC->ISPR6 |= NewPriority;
 872  00a1 c67f75        	ld	a,32629
 873  00a4 1a02          	or	a,(OFST+0,sp)
 874  00a6 c77f75        	ld	32629,a
 875                     ; 333       break;
 877  00a9 2022          	jra	L572
 878  00ab               L732:
 879                     ; 336     case TIM1_CC_IRQn:
 879                     ; 337 #endif  /* STM8L15X_LD */
 879                     ; 338     case TIM4_UPD_OVF_TRG_IRQn:
 879                     ; 339     case SPI1_IRQn:
 879                     ; 340 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 879                     ; 341     case USART1_TX_IRQn:
 879                     ; 342 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 879                     ; 343     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 879                     ; 344 #endif  /* STM8L15X_MD */
 879                     ; 345       ITC->ISPR7 &= Mask;
 881  00ab c67f76        	ld	a,32630
 882  00ae 1401          	and	a,(OFST-1,sp)
 883  00b0 c77f76        	ld	32630,a
 884                     ; 346       ITC->ISPR7 |= NewPriority;
 886  00b3 c67f76        	ld	a,32630
 887  00b6 1a02          	or	a,(OFST+0,sp)
 888  00b8 c77f76        	ld	32630,a
 889                     ; 347       break;
 891  00bb 2010          	jra	L572
 892  00bd               L142:
 893                     ; 353     case USART1_RX_TIM5_CC_IRQn:
 893                     ; 354     case I2C1_SPI2_IRQn:
 893                     ; 355 #endif  /* STM8L15X_MD */
 893                     ; 356       ITC->ISPR8 &= Mask;
 895  00bd c67f77        	ld	a,32631
 896  00c0 1401          	and	a,(OFST-1,sp)
 897  00c2 c77f77        	ld	32631,a
 898                     ; 357       ITC->ISPR8 |= NewPriority;
 900  00c5 c67f77        	ld	a,32631
 901  00c8 1a02          	or	a,(OFST+0,sp)
 902  00ca c77f77        	ld	32631,a
 903                     ; 358       break;
 905  00cd               L342:
 906                     ; 360     default:
 906                     ; 361       break;
 908  00cd               L572:
 909                     ; 363 }
 912  00cd 5b04          	addw	sp,#4
 913  00cf 81            	ret
 926                     	xdef	_ITC_GetSoftwarePriority
 927                     	xdef	_ITC_SetSoftwarePriority
 928                     	xdef	_ITC_GetSoftIntStatus
 929                     	xdef	_ITC_GetCPUCC
 930                     	xdef	_ITC_DeInit
 949                     	end
