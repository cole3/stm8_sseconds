   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 89 void WFE_DeInit(void)
  32                     ; 90 {
  34                     .text:	section	.text,new
  35  0000               _WFE_DeInit:
  39                     ; 91   WFE->CR1 = WFE_CRX_RESET_VALUE;
  41  0000 725f50a6      	clr	20646
  42                     ; 92   WFE->CR2 = WFE_CRX_RESET_VALUE;
  44  0004 725f50a7      	clr	20647
  45                     ; 93   WFE->CR3 = WFE_CRX_RESET_VALUE;
  47  0008 725f50a8      	clr	20648
  48                     ; 94   WFE->CR4 = WFE_CRX_RESET_VALUE;
  50  000c 725f50a9      	clr	20649
  51                     ; 95 }
  54  0010 81            	ret
 376                     ; 135 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 376                     ; 136 {
 377                     .text:	section	.text,new
 378  0000               _WFE_WakeUpSourceEventCmd:
 380  0000 89            	pushw	x
 381  0001 88            	push	a
 382       00000001      OFST:	set	1
 385                     ; 137   uint8_t register_index = 0;
 387  0002 0f01          	clr	(OFST+0,sp)
 388                     ; 139   assert_param(IS_WFE_SOURCE(WFE_Source));
 390                     ; 140   assert_param(IS_FUNCTIONAL_STATE(NewState));
 392                     ; 143   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 394  0004 9e            	ld	a,xh
 395  0005 6b01          	ld	(OFST+0,sp),a
 396                     ; 145   if (NewState != DISABLE)
 398  0007 0d06          	tnz	(OFST+5,sp)
 399  0009 273c          	jreq	L302
 400                     ; 147     switch (register_index)
 402  000b 7b01          	ld	a,(OFST+0,sp)
 404                     ; 165       default:
 404                     ; 166         break;
 405  000d 4a            	dec	a
 406  000e 270b          	jreq	L12
 407  0010 4a            	dec	a
 408  0011 2712          	jreq	L32
 409  0013 4a            	dec	a
 410  0014 2719          	jreq	L52
 411  0016 4a            	dec	a
 412  0017 2720          	jreq	L72
 413  0019 2045          	jra	L112
 414  001b               L12:
 415                     ; 149       case 1:
 415                     ; 150         WFE->CR1 |= (uint8_t)WFE_Source;
 417  001b c650a6        	ld	a,20646
 418  001e 1a03          	or	a,(OFST+2,sp)
 419  0020 c750a6        	ld	20646,a
 420                     ; 151         break;
 422  0023 203b          	jra	L112
 423  0025               L32:
 424                     ; 153       case 2:
 424                     ; 154         WFE->CR2 |= (uint8_t)WFE_Source;
 426  0025 c650a7        	ld	a,20647
 427  0028 1a03          	or	a,(OFST+2,sp)
 428  002a c750a7        	ld	20647,a
 429                     ; 155         break;
 431  002d 2031          	jra	L112
 432  002f               L52:
 433                     ; 157       case 3:
 433                     ; 158         WFE->CR3 |= (uint8_t)WFE_Source;
 435  002f c650a8        	ld	a,20648
 436  0032 1a03          	or	a,(OFST+2,sp)
 437  0034 c750a8        	ld	20648,a
 438                     ; 159         break;
 440  0037 2027          	jra	L112
 441  0039               L72:
 442                     ; 161       case 4:
 442                     ; 162         WFE->CR4 |= (uint8_t)WFE_Source;
 444  0039 c650a9        	ld	a,20649
 445  003c 1a03          	or	a,(OFST+2,sp)
 446  003e c750a9        	ld	20649,a
 447                     ; 163         break;
 449  0041 201d          	jra	L112
 450  0043               L13:
 451                     ; 165       default:
 451                     ; 166         break;
 453  0043 201b          	jra	L112
 454  0045               L702:
 456  0045 2019          	jra	L112
 457  0047               L302:
 458                     ; 171     switch (register_index)
 460  0047 7b01          	ld	a,(OFST+0,sp)
 462                     ; 189       default:
 462                     ; 190         break;
 463  0049 4a            	dec	a
 464  004a 270b          	jreq	L33
 465  004c 4a            	dec	a
 466  004d 2714          	jreq	L53
 467  004f 4a            	dec	a
 468  0050 271c          	jreq	L73
 469  0052 4a            	dec	a
 470  0053 2724          	jreq	L14
 471  0055 2009          	jra	L112
 472  0057               L33:
 473                     ; 173       case 1:
 473                     ; 174         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 475  0057 7b03          	ld	a,(OFST+2,sp)
 476  0059 43            	cpl	a
 477  005a c450a6        	and	a,20646
 478  005d c750a6        	ld	20646,a
 479                     ; 175         break;
 480  0060               L112:
 481                     ; 193 }
 484  0060 5b03          	addw	sp,#3
 485  0062 81            	ret
 486  0063               L53:
 487                     ; 177       case 2:
 487                     ; 178         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 489  0063 7b03          	ld	a,(OFST+2,sp)
 490  0065 43            	cpl	a
 491  0066 c450a7        	and	a,20647
 492  0069 c750a7        	ld	20647,a
 493                     ; 179         break;
 495  006c 20f2          	jra	L112
 496  006e               L73:
 497                     ; 181       case 3:
 497                     ; 182         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 499  006e 7b03          	ld	a,(OFST+2,sp)
 500  0070 43            	cpl	a
 501  0071 c450a8        	and	a,20648
 502  0074 c750a8        	ld	20648,a
 503                     ; 183         break;
 505  0077 20e7          	jra	L112
 506  0079               L14:
 507                     ; 185       case 4:
 507                     ; 186         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 509  0079 7b03          	ld	a,(OFST+2,sp)
 510  007b 43            	cpl	a
 511  007c c450a9        	and	a,20649
 512  007f c750a9        	ld	20649,a
 513                     ; 187         break;
 515  0082 20dc          	jra	L112
 516  0084               L34:
 517                     ; 189       default:
 517                     ; 190         break;
 519  0084 20da          	jra	L112
 520  0086               L512:
 521  0086 20d8          	jra	L112
 568                     ; 231 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 568                     ; 232 {
 569                     .text:	section	.text,new
 570  0000               _WFE_GetWakeUpSourceEventStatus:
 572  0000 89            	pushw	x
 573  0001 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 233   FunctionalState status = DISABLE;
 579  0002 0f01          	clr	(OFST+0,sp)
 580                     ; 235   assert_param(IS_WFE_SOURCE(WFE_Source));
 582                     ; 237   switch (WFE_Source)
 585                     ; 320     default:
 585                     ; 321       break;
 586  0004 1d0101        	subw	x,#257
 587  0007 2603          	jrne	L21
 588  0009 cc00a7        	jp	L712
 589  000c               L21:
 590  000c 5a            	decw	x
 591  000d 2603          	jrne	L41
 592  000f cc00a7        	jp	L712
 593  0012               L41:
 594  0012 1d0002        	subw	x,#2
 595  0015 2603          	jrne	L61
 596  0017 cc00a7        	jp	L712
 597  001a               L61:
 598  001a 1d0004        	subw	x,#4
 599  001d 2603          	jrne	L02
 600  001f cc00a7        	jp	L712
 601  0022               L02:
 602  0022 1d0008        	subw	x,#8
 603  0025 2602          	jrne	L22
 604  0027 207e          	jp	L712
 605  0029               L22:
 606  0029 1d0010        	subw	x,#16
 607  002c 2779          	jreq	L712
 608  002e 1d0020        	subw	x,#32
 609  0031 2774          	jreq	L712
 610  0033 1d0040        	subw	x,#64
 611  0036 276f          	jreq	L712
 612  0038 1d0081        	subw	x,#129
 613  003b 277b          	jreq	L122
 614  003d 5a            	decw	x
 615  003e 2778          	jreq	L122
 616  0040 1d0002        	subw	x,#2
 617  0043 2773          	jreq	L122
 618  0045 1d0004        	subw	x,#4
 619  0048 276e          	jreq	L122
 620  004a 1d0008        	subw	x,#8
 621  004d 2769          	jreq	L122
 622  004f 1d0010        	subw	x,#16
 623  0052 2764          	jreq	L122
 624  0054 1d0020        	subw	x,#32
 625  0057 275f          	jreq	L122
 626  0059 1d0040        	subw	x,#64
 627  005c 275a          	jreq	L122
 628  005e 1d0081        	subw	x,#129
 629  0061 2766          	jreq	L322
 630  0063 5a            	decw	x
 631  0064 2763          	jreq	L322
 632  0066 1d0002        	subw	x,#2
 633  0069 275e          	jreq	L322
 634  006b 1d0004        	subw	x,#4
 635  006e 2759          	jreq	L322
 636  0070 1d0008        	subw	x,#8
 637  0073 2754          	jreq	L322
 638  0075 1d0010        	subw	x,#16
 639  0078 274f          	jreq	L322
 640  007a 1d0020        	subw	x,#32
 641  007d 274a          	jreq	L322
 642  007f 1d0040        	subw	x,#64
 643  0082 2745          	jreq	L322
 644  0084 1d0081        	subw	x,#129
 645  0087 2751          	jreq	L522
 646  0089 5a            	decw	x
 647  008a 274e          	jreq	L522
 648  008c 1d0002        	subw	x,#2
 649  008f 2749          	jreq	L522
 650  0091 1d0004        	subw	x,#4
 651  0094 2744          	jreq	L522
 652  0096 1d0008        	subw	x,#8
 653  0099 273f          	jreq	L522
 654  009b 1d0010        	subw	x,#16
 655  009e 273a          	jreq	L522
 656  00a0 1d0020        	subw	x,#32
 657  00a3 2735          	jreq	L522
 658  00a5 2042          	jra	L552
 659  00a7               L712:
 660                     ; 239     case WFE_Source_TIM2_EV0:
 660                     ; 240     case WFE_Source_TIM2_EV1:
 660                     ; 241     case WFE_Source_TIM1_EV0:
 660                     ; 242     case WFE_Source_TIM1_EV1:
 660                     ; 243     case WFE_Source_EXTI_EV0:
 660                     ; 244     case WFE_Source_EXTI_EV1:
 660                     ; 245     case WFE_Source_EXTI_EV2:
 660                     ; 246     case WFE_Source_EXTI_EV3:
 660                     ; 247 
 660                     ; 248       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 662  00a7 c650a6        	ld	a,20646
 663  00aa 1503          	bcp	a,(OFST+2,sp)
 664  00ac 2706          	jreq	L752
 665                     ; 251         status = ENABLE;
 667  00ae a601          	ld	a,#1
 668  00b0 6b01          	ld	(OFST+0,sp),a
 670  00b2 2035          	jra	L552
 671  00b4               L752:
 672                     ; 256         status = DISABLE;
 674  00b4 0f01          	clr	(OFST+0,sp)
 675  00b6 2031          	jra	L552
 676  00b8               L122:
 677                     ; 260     case WFE_Source_EXTI_EV4:
 677                     ; 261     case WFE_Source_EXTI_EV5:
 677                     ; 262     case WFE_Source_EXTI_EV6:
 677                     ; 263     case WFE_Source_EXTI_EV7:
 677                     ; 264     case WFE_Source_EXTI_EVB_G:
 677                     ; 265     case WFE_Source_EXTI_EVD_H:
 677                     ; 266     case WFE_Source_EXTI_EVE_F:
 677                     ; 267     case WFE_Source_ADC1_COMP_EV:
 677                     ; 268 
 677                     ; 269       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 679  00b8 c650a7        	ld	a,20647
 680  00bb 1503          	bcp	a,(OFST+2,sp)
 681  00bd 2706          	jreq	L362
 682                     ; 272         status = ENABLE;
 684  00bf a601          	ld	a,#1
 685  00c1 6b01          	ld	(OFST+0,sp),a
 687  00c3 2024          	jra	L552
 688  00c5               L362:
 689                     ; 277         status = DISABLE;
 691  00c5 0f01          	clr	(OFST+0,sp)
 692  00c7 2020          	jra	L552
 693  00c9               L322:
 694                     ; 280     case WFE_Source_TIM3_EV0:
 694                     ; 281     case WFE_Source_TIM3_EV1:
 694                     ; 282     case WFE_Source_TIM4_EV:
 694                     ; 283     case WFE_Source_SPI1_EV:
 694                     ; 284     case WFE_Source_I2C1_EV:
 694                     ; 285     case WFE_Source_USART1_EV:
 694                     ; 286     case WFE_Source_DMA1CH01_EV:
 694                     ; 287     case WFE_Source_DMA1CH23_EV:
 694                     ; 288 
 694                     ; 289       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 696  00c9 c650a8        	ld	a,20648
 697  00cc 1503          	bcp	a,(OFST+2,sp)
 698  00ce 2706          	jreq	L762
 699                     ; 292         status = ENABLE;
 701  00d0 a601          	ld	a,#1
 702  00d2 6b01          	ld	(OFST+0,sp),a
 704  00d4 2013          	jra	L552
 705  00d6               L762:
 706                     ; 297         status = DISABLE;
 708  00d6 0f01          	clr	(OFST+0,sp)
 709  00d8 200f          	jra	L552
 710  00da               L522:
 711                     ; 301     case WFE_Source_TIM5_EV0:
 711                     ; 302     case WFE_Source_TIM5_EV1:
 711                     ; 303     case WFE_Source_AES_EV:
 711                     ; 304     case WFE_Source_SPI2_EV:
 711                     ; 305     case WFE_Source_USART2_EV:
 711                     ; 306     case WFE_Source_USART3_EV:
 711                     ; 307     case WFE_Source_RTC_CSS_EV:
 711                     ; 308 
 711                     ; 309       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 713  00da c650a9        	ld	a,20649
 714  00dd 1503          	bcp	a,(OFST+2,sp)
 715  00df 2706          	jreq	L372
 716                     ; 312         status = ENABLE;
 718  00e1 a601          	ld	a,#1
 719  00e3 6b01          	ld	(OFST+0,sp),a
 721  00e5 2002          	jra	L552
 722  00e7               L372:
 723                     ; 317         status = DISABLE;
 725  00e7 0f01          	clr	(OFST+0,sp)
 726  00e9               L722:
 727                     ; 320     default:
 727                     ; 321       break;
 729  00e9               L552:
 730                     ; 323   return status;
 732  00e9 7b01          	ld	a,(OFST+0,sp)
 735  00eb 5b03          	addw	sp,#3
 736  00ed 81            	ret
 749                     	xdef	_WFE_GetWakeUpSourceEventStatus
 750                     	xdef	_WFE_WakeUpSourceEventCmd
 751                     	xdef	_WFE_DeInit
 770                     	end
