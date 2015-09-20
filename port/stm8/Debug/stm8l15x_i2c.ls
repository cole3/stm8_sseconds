   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 188                     ; 135 void I2C_DeInit(I2C_TypeDef* I2Cx)
 188                     ; 136 {
 190                     .text:	section	.text,new
 191  0000               _I2C_DeInit:
 195                     ; 137   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 197  0000 7f            	clr	(x)
 198                     ; 138   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 200  0001 6f01          	clr	(1,x)
 201                     ; 139   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 203  0003 6f02          	clr	(2,x)
 204                     ; 140   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 206  0005 6f03          	clr	(3,x)
 207                     ; 141   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 209  0007 6f04          	clr	(4,x)
 210                     ; 142   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 212  0009 6f05          	clr	(5,x)
 213                     ; 143   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 215  000b 6f0a          	clr	(10,x)
 216                     ; 144   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 218  000d 6f0b          	clr	(11,x)
 219                     ; 145   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 221  000f 6f0c          	clr	(12,x)
 222                     ; 146   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 224  0011 a602          	ld	a,#2
 225  0013 e70d          	ld	(13,x),a
 226                     ; 147 }
 229  0015 81            	ret
 441                     .const:	section	.text
 442  0000               L01:
 443  0000 000f4240      	dc.l	1000000
 444  0004               L21:
 445  0004 000186a1      	dc.l	100001
 446  0008               L41:
 447  0008 00000004      	dc.l	4
 448                     ; 178 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 448                     ; 179               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 448                     ; 180               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 448                     ; 181 {
 449                     .text:	section	.text,new
 450  0000               _I2C_Init:
 452  0000 89            	pushw	x
 453  0001 520c          	subw	sp,#12
 454       0000000c      OFST:	set	12
 457                     ; 182   uint32_t result = 0x0004;
 459  0003 96            	ldw	x,sp
 460  0004 1c0009        	addw	x,#OFST-3
 461  0007 cd0000        	call	c_ltor
 463                     ; 183   uint16_t tmpval = 0;
 465  000a 1e05          	ldw	x,(OFST-7,sp)
 466                     ; 184   uint8_t tmpccrh = 0;
 468  000c 0f07          	clr	(OFST-5,sp)
 469                     ; 185   uint8_t input_clock = 0;
 471  000e 7b08          	ld	a,(OFST-4,sp)
 472  0010 97            	ld	xl,a
 473                     ; 188   assert_param(IS_I2C_MODE(I2C_Mode));
 475                     ; 189   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 477                     ; 190   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 479                     ; 191   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 481                     ; 192   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 483                     ; 193   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 485                     ; 197   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 487  0011 cd0000        	call	_CLK_GetClockFreq
 489  0014 ae0000        	ldw	x,#L01
 490  0017 cd0000        	call	c_ludv
 492  001a b603          	ld	a,c_lreg+3
 493  001c 6b08          	ld	(OFST-4,sp),a
 494                     ; 201   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 496  001e 1e0d          	ldw	x,(OFST+1,sp)
 497  0020 e602          	ld	a,(2,x)
 498  0022 a4c0          	and	a,#192
 499  0024 e702          	ld	(2,x),a
 500                     ; 203   I2Cx->FREQR |= input_clock;
 502  0026 1e0d          	ldw	x,(OFST+1,sp)
 503  0028 e602          	ld	a,(2,x)
 504  002a 1a08          	or	a,(OFST-4,sp)
 505  002c e702          	ld	(2,x),a
 506                     ; 207   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 508  002e 1e0d          	ldw	x,(OFST+1,sp)
 509  0030 f6            	ld	a,(x)
 510  0031 a4fe          	and	a,#254
 511  0033 f7            	ld	(x),a
 512                     ; 210   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 514  0034 1e0d          	ldw	x,(OFST+1,sp)
 515  0036 e60c          	ld	a,(12,x)
 516  0038 a430          	and	a,#48
 517  003a e70c          	ld	(12,x),a
 518                     ; 211   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 520  003c 1e0d          	ldw	x,(OFST+1,sp)
 521  003e 6f0b          	clr	(11,x)
 522                     ; 214   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 524  0040 96            	ldw	x,sp
 525  0041 1c0011        	addw	x,#OFST+5
 526  0044 cd0000        	call	c_ltor
 528  0047 ae0004        	ldw	x,#L21
 529  004a cd0000        	call	c_lcmp
 531  004d 2403          	jruge	L02
 532  004f cc00ed        	jp	L742
 533  0052               L02:
 534                     ; 217     tmpccrh = I2C_CCRH_FS;
 536  0052 a680          	ld	a,#128
 537  0054 6b07          	ld	(OFST-5,sp),a
 538                     ; 219     if (I2C_DutyCycle == I2C_DutyCycle_2)
 540  0056 0d18          	tnz	(OFST+12,sp)
 541  0058 2633          	jrne	L152
 542                     ; 222       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 544  005a 96            	ldw	x,sp
 545  005b 1c0011        	addw	x,#OFST+5
 546  005e cd0000        	call	c_ltor
 548  0061 a603          	ld	a,#3
 549  0063 cd0000        	call	c_smul
 551  0066 96            	ldw	x,sp
 552  0067 1c0001        	addw	x,#OFST-11
 553  006a cd0000        	call	c_rtol
 555  006d 7b08          	ld	a,(OFST-4,sp)
 556  006f b703          	ld	c_lreg+3,a
 557  0071 3f02          	clr	c_lreg+2
 558  0073 3f01          	clr	c_lreg+1
 559  0075 3f00          	clr	c_lreg
 560  0077 ae0000        	ldw	x,#L01
 561  007a cd0000        	call	c_lmul
 563  007d 96            	ldw	x,sp
 564  007e 1c0001        	addw	x,#OFST-11
 565  0081 cd0000        	call	c_ludv
 567  0084 96            	ldw	x,sp
 568  0085 1c0009        	addw	x,#OFST-3
 569  0088 cd0000        	call	c_rtol
 572  008b 2037          	jra	L352
 573  008d               L152:
 574                     ; 227       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 576  008d 96            	ldw	x,sp
 577  008e 1c0011        	addw	x,#OFST+5
 578  0091 cd0000        	call	c_ltor
 580  0094 a619          	ld	a,#25
 581  0096 cd0000        	call	c_smul
 583  0099 96            	ldw	x,sp
 584  009a 1c0001        	addw	x,#OFST-11
 585  009d cd0000        	call	c_rtol
 587  00a0 7b08          	ld	a,(OFST-4,sp)
 588  00a2 b703          	ld	c_lreg+3,a
 589  00a4 3f02          	clr	c_lreg+2
 590  00a6 3f01          	clr	c_lreg+1
 591  00a8 3f00          	clr	c_lreg
 592  00aa ae0000        	ldw	x,#L01
 593  00ad cd0000        	call	c_lmul
 595  00b0 96            	ldw	x,sp
 596  00b1 1c0001        	addw	x,#OFST-11
 597  00b4 cd0000        	call	c_ludv
 599  00b7 96            	ldw	x,sp
 600  00b8 1c0009        	addw	x,#OFST-3
 601  00bb cd0000        	call	c_rtol
 603                     ; 229       tmpccrh |= I2C_CCRH_DUTY;
 605  00be 7b07          	ld	a,(OFST-5,sp)
 606  00c0 aa40          	or	a,#64
 607  00c2 6b07          	ld	(OFST-5,sp),a
 608  00c4               L352:
 609                     ; 233     if (result < (uint16_t)0x01)
 611  00c4 96            	ldw	x,sp
 612  00c5 1c0009        	addw	x,#OFST-3
 613  00c8 cd0000        	call	c_lzmp
 615  00cb 260a          	jrne	L552
 616                     ; 236       result = (uint16_t)0x0001;
 618  00cd ae0001        	ldw	x,#1
 619  00d0 1f0b          	ldw	(OFST-1,sp),x
 620  00d2 ae0000        	ldw	x,#0
 621  00d5 1f09          	ldw	(OFST-3,sp),x
 622  00d7               L552:
 623                     ; 242     tmpval = ((input_clock * 3) / 10) + 1;
 625  00d7 7b08          	ld	a,(OFST-4,sp)
 626  00d9 97            	ld	xl,a
 627  00da a603          	ld	a,#3
 628  00dc 42            	mul	x,a
 629  00dd a60a          	ld	a,#10
 630  00df cd0000        	call	c_sdivx
 632  00e2 5c            	incw	x
 633  00e3 1f05          	ldw	(OFST-7,sp),x
 634                     ; 243     I2Cx->TRISER = (uint8_t)tmpval;
 636  00e5 7b06          	ld	a,(OFST-6,sp)
 637  00e7 1e0d          	ldw	x,(OFST+1,sp)
 638  00e9 e70d          	ld	(13,x),a
 640  00eb 2059          	jra	L752
 641  00ed               L742:
 642                     ; 250     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 644  00ed 96            	ldw	x,sp
 645  00ee 1c0011        	addw	x,#OFST+5
 646  00f1 cd0000        	call	c_ltor
 648  00f4 3803          	sll	c_lreg+3
 649  00f6 3902          	rlc	c_lreg+2
 650  00f8 3901          	rlc	c_lreg+1
 651  00fa 3900          	rlc	c_lreg
 652  00fc 96            	ldw	x,sp
 653  00fd 1c0001        	addw	x,#OFST-11
 654  0100 cd0000        	call	c_rtol
 656  0103 7b08          	ld	a,(OFST-4,sp)
 657  0105 b703          	ld	c_lreg+3,a
 658  0107 3f02          	clr	c_lreg+2
 659  0109 3f01          	clr	c_lreg+1
 660  010b 3f00          	clr	c_lreg
 661  010d ae0000        	ldw	x,#L01
 662  0110 cd0000        	call	c_lmul
 664  0113 96            	ldw	x,sp
 665  0114 1c0001        	addw	x,#OFST-11
 666  0117 cd0000        	call	c_ludv
 668  011a be02          	ldw	x,c_lreg+2
 669  011c cd0000        	call	c_uitolx
 671  011f 96            	ldw	x,sp
 672  0120 1c0009        	addw	x,#OFST-3
 673  0123 cd0000        	call	c_rtol
 675                     ; 253     if (result < (uint16_t)0x0004)
 677  0126 96            	ldw	x,sp
 678  0127 1c0009        	addw	x,#OFST-3
 679  012a cd0000        	call	c_ltor
 681  012d ae0008        	ldw	x,#L41
 682  0130 cd0000        	call	c_lcmp
 684  0133 240a          	jruge	L162
 685                     ; 256       result = (uint16_t)0x0004;
 687  0135 ae0004        	ldw	x,#4
 688  0138 1f0b          	ldw	(OFST-1,sp),x
 689  013a ae0000        	ldw	x,#0
 690  013d 1f09          	ldw	(OFST-3,sp),x
 691  013f               L162:
 692                     ; 262     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 694  013f 7b08          	ld	a,(OFST-4,sp)
 695  0141 4c            	inc	a
 696  0142 1e0d          	ldw	x,(OFST+1,sp)
 697  0144 e70d          	ld	(13,x),a
 698  0146               L752:
 699                     ; 267   I2Cx->CCRL = (uint8_t)result;
 701  0146 7b0c          	ld	a,(OFST+0,sp)
 702  0148 1e0d          	ldw	x,(OFST+1,sp)
 703  014a e70b          	ld	(11,x),a
 704                     ; 268   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 706  014c 7b07          	ld	a,(OFST-5,sp)
 707  014e 1e0d          	ldw	x,(OFST+1,sp)
 708  0150 e70c          	ld	(12,x),a
 709                     ; 271   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 711  0152 1e0d          	ldw	x,(OFST+1,sp)
 712  0154 7b17          	ld	a,(OFST+11,sp)
 713  0156 aa01          	or	a,#1
 714  0158 fa            	or	a,(x)
 715  0159 f7            	ld	(x),a
 716                     ; 274   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 718  015a 1e0d          	ldw	x,(OFST+1,sp)
 719  015c e601          	ld	a,(1,x)
 720  015e 1a19          	or	a,(OFST+13,sp)
 721  0160 e701          	ld	(1,x),a
 722                     ; 277   I2Cx->OARL = (uint8_t)(OwnAddress);
 724  0162 7b16          	ld	a,(OFST+10,sp)
 725  0164 1e0d          	ldw	x,(OFST+1,sp)
 726  0166 e703          	ld	(3,x),a
 727                     ; 278   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 727                     ; 279                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 729  0168 7b15          	ld	a,(OFST+9,sp)
 730  016a 97            	ld	xl,a
 731  016b 7b16          	ld	a,(OFST+10,sp)
 732  016d 9f            	ld	a,xl
 733  016e a403          	and	a,#3
 734  0170 97            	ld	xl,a
 735  0171 4f            	clr	a
 736  0172 02            	rlwa	x,a
 737  0173 a607          	ld	a,#7
 738  0175               L61:
 739  0175 54            	srlw	x
 740  0176 4a            	dec	a
 741  0177 26fc          	jrne	L61
 742  0179 9f            	ld	a,xl
 743  017a 6b04          	ld	(OFST-8,sp),a
 744  017c 7b1a          	ld	a,(OFST+14,sp)
 745  017e aa40          	or	a,#64
 746  0180 1a04          	or	a,(OFST-8,sp)
 747  0182 1e0d          	ldw	x,(OFST+1,sp)
 748  0184 e704          	ld	(4,x),a
 749                     ; 280 }
 752  0186 5b0e          	addw	sp,#14
 753  0188 81            	ret
 820                     ; 289 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 820                     ; 290 {
 821                     .text:	section	.text,new
 822  0000               _I2C_Cmd:
 824  0000 89            	pushw	x
 825       00000000      OFST:	set	0
 828                     ; 293   assert_param(IS_FUNCTIONAL_STATE(NewState));
 830                     ; 295   if (NewState != DISABLE)
 832  0001 0d05          	tnz	(OFST+5,sp)
 833  0003 2706          	jreq	L713
 834                     ; 298     I2Cx->CR1 |= I2C_CR1_PE;
 836  0005 f6            	ld	a,(x)
 837  0006 aa01          	or	a,#1
 838  0008 f7            	ld	(x),a
 840  0009 2006          	jra	L123
 841  000b               L713:
 842                     ; 303     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 844  000b 1e01          	ldw	x,(OFST+1,sp)
 845  000d f6            	ld	a,(x)
 846  000e a4fe          	and	a,#254
 847  0010 f7            	ld	(x),a
 848  0011               L123:
 849                     ; 305 }
 852  0011 85            	popw	x
 853  0012 81            	ret
 900                     ; 314 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 900                     ; 315 {
 901                     .text:	section	.text,new
 902  0000               _I2C_GeneralCallCmd:
 904  0000 89            	pushw	x
 905       00000000      OFST:	set	0
 908                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 910                     ; 320   if (NewState != DISABLE)
 912  0001 0d05          	tnz	(OFST+5,sp)
 913  0003 2706          	jreq	L743
 914                     ; 323     I2Cx->CR1 |= I2C_CR1_ENGC;
 916  0005 f6            	ld	a,(x)
 917  0006 aa40          	or	a,#64
 918  0008 f7            	ld	(x),a
 920  0009 2006          	jra	L153
 921  000b               L743:
 922                     ; 328     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 924  000b 1e01          	ldw	x,(OFST+1,sp)
 925  000d f6            	ld	a,(x)
 926  000e a4bf          	and	a,#191
 927  0010 f7            	ld	(x),a
 928  0011               L153:
 929                     ; 330 }
 932  0011 85            	popw	x
 933  0012 81            	ret
 980                     ; 341 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 980                     ; 342 {
 981                     .text:	section	.text,new
 982  0000               _I2C_GenerateSTART:
 984  0000 89            	pushw	x
 985       00000000      OFST:	set	0
 988                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 990                     ; 347   if (NewState != DISABLE)
 992  0001 0d05          	tnz	(OFST+5,sp)
 993  0003 2708          	jreq	L773
 994                     ; 350     I2Cx->CR2 |= I2C_CR2_START;
 996  0005 e601          	ld	a,(1,x)
 997  0007 aa01          	or	a,#1
 998  0009 e701          	ld	(1,x),a
1000  000b 2008          	jra	L104
1001  000d               L773:
1002                     ; 355     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1004  000d 1e01          	ldw	x,(OFST+1,sp)
1005  000f e601          	ld	a,(1,x)
1006  0011 a4fe          	and	a,#254
1007  0013 e701          	ld	(1,x),a
1008  0015               L104:
1009                     ; 357 }
1012  0015 85            	popw	x
1013  0016 81            	ret
1060                     ; 366 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1060                     ; 367 {
1061                     .text:	section	.text,new
1062  0000               _I2C_GenerateSTOP:
1064  0000 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 370   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 372   if (NewState != DISABLE)
1072  0001 0d05          	tnz	(OFST+5,sp)
1073  0003 2708          	jreq	L724
1074                     ; 375     I2Cx->CR2 |= I2C_CR2_STOP;
1076  0005 e601          	ld	a,(1,x)
1077  0007 aa02          	or	a,#2
1078  0009 e701          	ld	(1,x),a
1080  000b 2008          	jra	L134
1081  000d               L724:
1082                     ; 380     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1084  000d 1e01          	ldw	x,(OFST+1,sp)
1085  000f e601          	ld	a,(1,x)
1086  0011 a4fd          	and	a,#253
1087  0013 e701          	ld	(1,x),a
1088  0015               L134:
1089                     ; 382 }
1092  0015 85            	popw	x
1093  0016 81            	ret
1141                     ; 391 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1141                     ; 392 {
1142                     .text:	section	.text,new
1143  0000               _I2C_SoftwareResetCmd:
1145  0000 89            	pushw	x
1146       00000000      OFST:	set	0
1149                     ; 394   assert_param(IS_FUNCTIONAL_STATE(NewState));
1151                     ; 396   if (NewState != DISABLE)
1153  0001 0d05          	tnz	(OFST+5,sp)
1154  0003 2708          	jreq	L754
1155                     ; 399     I2Cx->CR2 |= I2C_CR2_SWRST;
1157  0005 e601          	ld	a,(1,x)
1158  0007 aa80          	or	a,#128
1159  0009 e701          	ld	(1,x),a
1161  000b 2008          	jra	L164
1162  000d               L754:
1163                     ; 404     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1165  000d 1e01          	ldw	x,(OFST+1,sp)
1166  000f e601          	ld	a,(1,x)
1167  0011 a47f          	and	a,#127
1168  0013 e701          	ld	(1,x),a
1169  0015               L164:
1170                     ; 406 }
1173  0015 85            	popw	x
1174  0016 81            	ret
1222                     ; 415 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1222                     ; 416 {
1223                     .text:	section	.text,new
1224  0000               _I2C_StretchClockCmd:
1226  0000 89            	pushw	x
1227       00000000      OFST:	set	0
1230                     ; 418   assert_param(IS_FUNCTIONAL_STATE(NewState));
1232                     ; 420   if (NewState != DISABLE)
1234  0001 0d05          	tnz	(OFST+5,sp)
1235  0003 2706          	jreq	L705
1236                     ; 423     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1238  0005 f6            	ld	a,(x)
1239  0006 a47f          	and	a,#127
1240  0008 f7            	ld	(x),a
1242  0009 2006          	jra	L115
1243  000b               L705:
1244                     ; 429     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1246  000b 1e01          	ldw	x,(OFST+1,sp)
1247  000d f6            	ld	a,(x)
1248  000e aa80          	or	a,#128
1249  0010 f7            	ld	(x),a
1250  0011               L115:
1251                     ; 431 }
1254  0011 85            	popw	x
1255  0012 81            	ret
1302                     ; 440 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1302                     ; 441 {
1303                     .text:	section	.text,new
1304  0000               _I2C_ARPCmd:
1306  0000 89            	pushw	x
1307       00000000      OFST:	set	0
1310                     ; 443   assert_param(IS_FUNCTIONAL_STATE(NewState));
1312                     ; 445   if (NewState != DISABLE)
1314  0001 0d05          	tnz	(OFST+5,sp)
1315  0003 2706          	jreq	L735
1316                     ; 448     I2Cx->CR1 |= I2C_CR1_ARP;
1318  0005 f6            	ld	a,(x)
1319  0006 aa10          	or	a,#16
1320  0008 f7            	ld	(x),a
1322  0009 2006          	jra	L145
1323  000b               L735:
1324                     ; 454     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1326  000b 1e01          	ldw	x,(OFST+1,sp)
1327  000d f6            	ld	a,(x)
1328  000e a4ef          	and	a,#239
1329  0010 f7            	ld	(x),a
1330  0011               L145:
1331                     ; 456 }
1334  0011 85            	popw	x
1335  0012 81            	ret
1383                     ; 465 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1383                     ; 466 {
1384                     .text:	section	.text,new
1385  0000               _I2C_AcknowledgeConfig:
1387  0000 89            	pushw	x
1388       00000000      OFST:	set	0
1391                     ; 468   assert_param(IS_FUNCTIONAL_STATE(NewState));
1393                     ; 470   if (NewState != DISABLE)
1395  0001 0d05          	tnz	(OFST+5,sp)
1396  0003 2708          	jreq	L765
1397                     ; 473     I2Cx->CR2 |= I2C_CR2_ACK;
1399  0005 e601          	ld	a,(1,x)
1400  0007 aa04          	or	a,#4
1401  0009 e701          	ld	(1,x),a
1403  000b 2008          	jra	L175
1404  000d               L765:
1405                     ; 478     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1407  000d 1e01          	ldw	x,(OFST+1,sp)
1408  000f e601          	ld	a,(1,x)
1409  0011 a4fb          	and	a,#251
1410  0013 e701          	ld	(1,x),a
1411  0015               L175:
1412                     ; 480 }
1415  0015 85            	popw	x
1416  0016 81            	ret
1468                     ; 488 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1468                     ; 489 {
1469                     .text:	section	.text,new
1470  0000               _I2C_OwnAddress2Config:
1472  0000 89            	pushw	x
1473  0001 88            	push	a
1474       00000001      OFST:	set	1
1477                     ; 490   uint8_t tmpreg = 0;
1479  0002 0f01          	clr	(OFST+0,sp)
1480                     ; 493   tmpreg = I2Cx->OAR2;
1482  0004 e605          	ld	a,(5,x)
1483  0006 6b01          	ld	(OFST+0,sp),a
1484                     ; 496   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1486  0008 7b01          	ld	a,(OFST+0,sp)
1487  000a a401          	and	a,#1
1488  000c 6b01          	ld	(OFST+0,sp),a
1489                     ; 499   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1491  000e 7b06          	ld	a,(OFST+5,sp)
1492  0010 a4fe          	and	a,#254
1493  0012 1a01          	or	a,(OFST+0,sp)
1494  0014 6b01          	ld	(OFST+0,sp),a
1495                     ; 502   I2Cx->OAR2 = tmpreg;
1497  0016 7b01          	ld	a,(OFST+0,sp)
1498  0018 1e02          	ldw	x,(OFST+1,sp)
1499  001a e705          	ld	(5,x),a
1500                     ; 503 }
1503  001c 5b03          	addw	sp,#3
1504  001e 81            	ret
1551                     ; 512 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1551                     ; 513 {
1552                     .text:	section	.text,new
1553  0000               _I2C_DualAddressCmd:
1555  0000 89            	pushw	x
1556       00000000      OFST:	set	0
1559                     ; 515   assert_param(IS_FUNCTIONAL_STATE(NewState));
1561                     ; 517   if (NewState != DISABLE)
1563  0001 0d05          	tnz	(OFST+5,sp)
1564  0003 2708          	jreq	L346
1565                     ; 520     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1567  0005 e605          	ld	a,(5,x)
1568  0007 aa01          	or	a,#1
1569  0009 e705          	ld	(5,x),a
1571  000b 2008          	jra	L546
1572  000d               L346:
1573                     ; 525     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1575  000d 1e01          	ldw	x,(OFST+1,sp)
1576  000f e605          	ld	a,(5,x)
1577  0011 a4fe          	and	a,#254
1578  0013 e705          	ld	(5,x),a
1579  0015               L546:
1580                     ; 527 }
1583  0015 85            	popw	x
1584  0016 81            	ret
1654                     ; 539 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1654                     ; 540 {
1655                     .text:	section	.text,new
1656  0000               _I2C_AckPositionConfig:
1658  0000 89            	pushw	x
1659       00000000      OFST:	set	0
1662                     ; 542   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1664                     ; 545   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1666  0001 e601          	ld	a,(1,x)
1667  0003 a4f7          	and	a,#247
1668  0005 e701          	ld	(1,x),a
1669                     ; 547   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1671  0007 e601          	ld	a,(1,x)
1672  0009 1a05          	or	a,(OFST+5,sp)
1673  000b e701          	ld	(1,x),a
1674                     ; 548 }
1677  000d 85            	popw	x
1678  000e 81            	ret
1747                     ; 559 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1747                     ; 560 {
1748                     .text:	section	.text,new
1749  0000               _I2C_SMBusAlertConfig:
1751  0000 89            	pushw	x
1752       00000000      OFST:	set	0
1755                     ; 563   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1757                     ; 565   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1759  0001 0d05          	tnz	(OFST+5,sp)
1760  0003 2708          	jreq	L737
1761                     ; 568     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1763  0005 e601          	ld	a,(1,x)
1764  0007 aa20          	or	a,#32
1765  0009 e701          	ld	(1,x),a
1767  000b 2008          	jra	L147
1768  000d               L737:
1769                     ; 573     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1771  000d 1e01          	ldw	x,(OFST+1,sp)
1772  000f e601          	ld	a,(1,x)
1773  0011 a4df          	and	a,#223
1774  0013 e701          	ld	(1,x),a
1775  0015               L147:
1776                     ; 575 }
1779  0015 85            	popw	x
1780  0016 81            	ret
1828                     ; 586 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1828                     ; 587 {
1829                     .text:	section	.text,new
1830  0000               _I2C_FastModeDutyCycleConfig:
1832  0000 89            	pushw	x
1833       00000000      OFST:	set	0
1836                     ; 590   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1838                     ; 592   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1840  0001 7b05          	ld	a,(OFST+5,sp)
1841  0003 a140          	cp	a,#64
1842  0005 2608          	jrne	L767
1843                     ; 595     I2Cx->CCRH |= I2C_CCRH_DUTY;
1845  0007 e60c          	ld	a,(12,x)
1846  0009 aa40          	or	a,#64
1847  000b e70c          	ld	(12,x),a
1849  000d 2008          	jra	L177
1850  000f               L767:
1851                     ; 600     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1853  000f 1e01          	ldw	x,(OFST+1,sp)
1854  0011 e60c          	ld	a,(12,x)
1855  0013 a4bf          	and	a,#191
1856  0015 e70c          	ld	(12,x),a
1857  0017               L177:
1858                     ; 602 }
1861  0017 85            	popw	x
1862  0018 81            	ret
1939                     ; 615 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1939                     ; 616 {
1940                     .text:	section	.text,new
1941  0000               _I2C_Send7bitAddress:
1943  0000 89            	pushw	x
1944       00000000      OFST:	set	0
1947                     ; 618   assert_param(IS_I2C_ADDRESS(Address));
1949                     ; 619   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1951                     ; 622   if (I2C_Direction != I2C_Direction_Transmitter)
1953  0001 0d06          	tnz	(OFST+6,sp)
1954  0003 2708          	jreq	L1301
1955                     ; 625     Address |= OAR1_ADD0_Set;
1957  0005 7b05          	ld	a,(OFST+5,sp)
1958  0007 aa01          	or	a,#1
1959  0009 6b05          	ld	(OFST+5,sp),a
1961  000b 2006          	jra	L3301
1962  000d               L1301:
1963                     ; 630     Address &= OAR1_ADD0_Reset;
1965  000d 7b05          	ld	a,(OFST+5,sp)
1966  000f a4fe          	and	a,#254
1967  0011 6b05          	ld	(OFST+5,sp),a
1968  0013               L3301:
1969                     ; 633   I2Cx->DR = Address;
1971  0013 7b05          	ld	a,(OFST+5,sp)
1972  0015 1e01          	ldw	x,(OFST+1,sp)
1973  0017 e706          	ld	(6,x),a
1974                     ; 634 }
1977  0019 85            	popw	x
1978  001a 81            	ret
2022                     ; 658 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2022                     ; 659 {
2023                     .text:	section	.text,new
2024  0000               _I2C_SendData:
2026  0000 89            	pushw	x
2027       00000000      OFST:	set	0
2030                     ; 661   I2Cx->DR = Data;
2032  0001 7b05          	ld	a,(OFST+5,sp)
2033  0003 1e01          	ldw	x,(OFST+1,sp)
2034  0005 e706          	ld	(6,x),a
2035                     ; 662 }
2038  0007 85            	popw	x
2039  0008 81            	ret
2076                     ; 670 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2076                     ; 671 {
2077                     .text:	section	.text,new
2078  0000               _I2C_ReceiveData:
2082                     ; 673   return ((uint8_t)I2Cx->DR);
2084  0000 e606          	ld	a,(6,x)
2087  0002 81            	ret
2134                     ; 699 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2134                     ; 700 {
2135                     .text:	section	.text,new
2136  0000               _I2C_TransmitPEC:
2138  0000 89            	pushw	x
2139       00000000      OFST:	set	0
2142                     ; 702   assert_param(IS_FUNCTIONAL_STATE(NewState));
2144                     ; 704   if (NewState != DISABLE)
2146  0001 0d05          	tnz	(OFST+5,sp)
2147  0003 2708          	jreq	L3211
2148                     ; 707     I2Cx->CR2 |= I2C_CR2_PEC;
2150  0005 e601          	ld	a,(1,x)
2151  0007 aa10          	or	a,#16
2152  0009 e701          	ld	(1,x),a
2154  000b 2008          	jra	L5211
2155  000d               L3211:
2156                     ; 712     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2158  000d 1e01          	ldw	x,(OFST+1,sp)
2159  000f e601          	ld	a,(1,x)
2160  0011 a4ef          	and	a,#239
2161  0013 e701          	ld	(1,x),a
2162  0015               L5211:
2163                     ; 714 }
2166  0015 85            	popw	x
2167  0016 81            	ret
2214                     ; 723 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2214                     ; 724 {
2215                     .text:	section	.text,new
2216  0000               _I2C_CalculatePEC:
2218  0000 89            	pushw	x
2219       00000000      OFST:	set	0
2222                     ; 726   assert_param(IS_FUNCTIONAL_STATE(NewState));
2224                     ; 728   if (NewState != DISABLE)
2226  0001 0d05          	tnz	(OFST+5,sp)
2227  0003 2706          	jreq	L3511
2228                     ; 731     I2Cx->CR1 |= I2C_CR1_ENPEC;
2230  0005 f6            	ld	a,(x)
2231  0006 aa20          	or	a,#32
2232  0008 f7            	ld	(x),a
2234  0009 2006          	jra	L5511
2235  000b               L3511:
2236                     ; 736     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2238  000b 1e01          	ldw	x,(OFST+1,sp)
2239  000d f6            	ld	a,(x)
2240  000e a4df          	and	a,#223
2241  0010 f7            	ld	(x),a
2242  0011               L5511:
2243                     ; 738 }
2246  0011 85            	popw	x
2247  0012 81            	ret
2317                     ; 749 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2317                     ; 750 {
2318                     .text:	section	.text,new
2319  0000               _I2C_PECPositionConfig:
2321  0000 89            	pushw	x
2322       00000000      OFST:	set	0
2325                     ; 752   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2327                     ; 755   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2329  0001 e601          	ld	a,(1,x)
2330  0003 a4f7          	and	a,#247
2331  0005 e701          	ld	(1,x),a
2332                     ; 757   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2334  0007 e601          	ld	a,(1,x)
2335  0009 1a05          	or	a,(OFST+5,sp)
2336  000b e701          	ld	(1,x),a
2337                     ; 758 }
2340  000d 85            	popw	x
2341  000e 81            	ret
2378                     ; 766 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2378                     ; 767 {
2379                     .text:	section	.text,new
2380  0000               _I2C_GetPEC:
2384                     ; 769   return (I2Cx->PECR);
2386  0000 e60e          	ld	a,(14,x)
2389  0002 81            	ret
2436                     ; 797 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2436                     ; 798 {
2437                     .text:	section	.text,new
2438  0000               _I2C_DMACmd:
2440  0000 89            	pushw	x
2441       00000000      OFST:	set	0
2444                     ; 800   assert_param(IS_FUNCTIONAL_STATE(NewState));
2446                     ; 802   if (NewState != DISABLE)
2448  0001 0d05          	tnz	(OFST+5,sp)
2449  0003 2708          	jreq	L7521
2450                     ; 805     I2Cx->ITR |= I2C_ITR_DMAEN;
2452  0005 e60a          	ld	a,(10,x)
2453  0007 aa08          	or	a,#8
2454  0009 e70a          	ld	(10,x),a
2456  000b 2008          	jra	L1621
2457  000d               L7521:
2458                     ; 810     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2460  000d 1e01          	ldw	x,(OFST+1,sp)
2461  000f e60a          	ld	a,(10,x)
2462  0011 a4f7          	and	a,#247
2463  0013 e70a          	ld	(10,x),a
2464  0015               L1621:
2465                     ; 812 }
2468  0015 85            	popw	x
2469  0016 81            	ret
2517                     ; 821 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2517                     ; 822 {
2518                     .text:	section	.text,new
2519  0000               _I2C_DMALastTransferCmd:
2521  0000 89            	pushw	x
2522       00000000      OFST:	set	0
2525                     ; 824   assert_param(IS_FUNCTIONAL_STATE(NewState));
2527                     ; 826   if (NewState != DISABLE)
2529  0001 0d05          	tnz	(OFST+5,sp)
2530  0003 2708          	jreq	L7031
2531                     ; 829     I2Cx->ITR |= I2C_ITR_LAST;
2533  0005 e60a          	ld	a,(10,x)
2534  0007 aa10          	or	a,#16
2535  0009 e70a          	ld	(10,x),a
2537  000b 2008          	jra	L1131
2538  000d               L7031:
2539                     ; 834     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2541  000d 1e01          	ldw	x,(OFST+1,sp)
2542  000f e60a          	ld	a,(10,x)
2543  0011 a4ef          	and	a,#239
2544  0013 e70a          	ld	(10,x),a
2545  0015               L1131:
2546                     ; 836 }
2549  0015 85            	popw	x
2550  0016 81            	ret
2739                     ; 948 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2739                     ; 949 {
2740                     .text:	section	.text,new
2741  0000               _I2C_ITConfig:
2743  0000 89            	pushw	x
2744       00000000      OFST:	set	0
2747                     ; 951   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2749                     ; 952   assert_param(IS_FUNCTIONAL_STATE(NewState));
2751                     ; 954   if (NewState != DISABLE)
2753  0001 0d07          	tnz	(OFST+7,sp)
2754  0003 2708          	jreq	L3141
2755                     ; 957     I2Cx->ITR |= (uint8_t)I2C_IT;
2757  0005 e60a          	ld	a,(10,x)
2758  0007 1a06          	or	a,(OFST+6,sp)
2759  0009 e70a          	ld	(10,x),a
2761  000b 2009          	jra	L5141
2762  000d               L3141:
2763                     ; 962     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2765  000d 1e01          	ldw	x,(OFST+1,sp)
2766  000f 7b06          	ld	a,(OFST+6,sp)
2767  0011 43            	cpl	a
2768  0012 e40a          	and	a,(10,x)
2769  0014 e70a          	ld	(10,x),a
2770  0016               L5141:
2771                     ; 964 }
2774  0016 85            	popw	x
2775  0017 81            	ret
2936                     ; 988 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2936                     ; 989 {
2937                     .text:	section	.text,new
2938  0000               _I2C_ReadRegister:
2940  0000 89            	pushw	x
2941  0001 5204          	subw	sp,#4
2942       00000004      OFST:	set	4
2945                     ; 990   __IO uint16_t tmp = 0;
2947  0003 5f            	clrw	x
2948  0004 1f03          	ldw	(OFST-1,sp),x
2949                     ; 992   assert_param(IS_I2C_REGISTER(I2C_Register));
2951                     ; 994   tmp = (uint16_t) I2Cx;
2953  0006 1e05          	ldw	x,(OFST+1,sp)
2954  0008 1f03          	ldw	(OFST-1,sp),x
2955                     ; 995   tmp += I2C_Register;
2957  000a 7b09          	ld	a,(OFST+5,sp)
2958  000c 5f            	clrw	x
2959  000d 97            	ld	xl,a
2960  000e 1f01          	ldw	(OFST-3,sp),x
2961  0010 1e03          	ldw	x,(OFST-1,sp)
2962  0012 72fb01        	addw	x,(OFST-3,sp)
2963  0015 1f03          	ldw	(OFST-1,sp),x
2964                     ; 998   return (*(__IO uint8_t *) tmp);
2966  0017 1e03          	ldw	x,(OFST-1,sp)
2967  0019 f6            	ld	a,(x)
2970  001a 5b06          	addw	sp,#6
2971  001c 81            	ret
3221                     ; 1038 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3221                     ; 1039 {
3222                     .text:	section	.text,new
3223  0000               _I2C_CheckEvent:
3225  0000 89            	pushw	x
3226  0001 5206          	subw	sp,#6
3227       00000006      OFST:	set	6
3230                     ; 1040   __IO uint16_t lastevent = 0x00;
3232  0003 5f            	clrw	x
3233  0004 1f04          	ldw	(OFST-2,sp),x
3234                     ; 1041   uint8_t flag1 = 0x00 ;
3236  0006 7b03          	ld	a,(OFST-3,sp)
3237  0008 97            	ld	xl,a
3238                     ; 1042   uint8_t flag2 = 0x00;
3240  0009 7b06          	ld	a,(OFST+0,sp)
3241  000b 97            	ld	xl,a
3242                     ; 1043   ErrorStatus status = ERROR;
3244  000c 7b06          	ld	a,(OFST+0,sp)
3245  000e 97            	ld	xl,a
3246                     ; 1046   assert_param(IS_I2C_EVENT(I2C_Event));
3248                     ; 1048   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3250  000f 1e0b          	ldw	x,(OFST+5,sp)
3251  0011 a30004        	cpw	x,#4
3252  0014 260c          	jrne	L5261
3253                     ; 1050     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3255  0016 1e07          	ldw	x,(OFST+1,sp)
3256  0018 e608          	ld	a,(8,x)
3257  001a a404          	and	a,#4
3258  001c 5f            	clrw	x
3259  001d 97            	ld	xl,a
3260  001e 1f04          	ldw	(OFST-2,sp),x
3262  0020 2021          	jra	L7261
3263  0022               L5261:
3264                     ; 1054     flag1 = I2Cx->SR1;
3266  0022 1e07          	ldw	x,(OFST+1,sp)
3267  0024 e607          	ld	a,(7,x)
3268  0026 6b03          	ld	(OFST-3,sp),a
3269                     ; 1055     flag2 = I2Cx->SR3;
3271  0028 1e07          	ldw	x,(OFST+1,sp)
3272  002a e609          	ld	a,(9,x)
3273  002c 6b06          	ld	(OFST+0,sp),a
3274                     ; 1056     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3276  002e 7b03          	ld	a,(OFST-3,sp)
3277  0030 5f            	clrw	x
3278  0031 97            	ld	xl,a
3279  0032 1f01          	ldw	(OFST-5,sp),x
3280  0034 7b06          	ld	a,(OFST+0,sp)
3281  0036 5f            	clrw	x
3282  0037 97            	ld	xl,a
3283  0038 4f            	clr	a
3284  0039 02            	rlwa	x,a
3285  003a 01            	rrwa	x,a
3286  003b 1a02          	or	a,(OFST-4,sp)
3287  003d 01            	rrwa	x,a
3288  003e 1a01          	or	a,(OFST-5,sp)
3289  0040 01            	rrwa	x,a
3290  0041 1f04          	ldw	(OFST-2,sp),x
3291  0043               L7261:
3292                     ; 1059   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3294  0043 1e04          	ldw	x,(OFST-2,sp)
3295  0045 01            	rrwa	x,a
3296  0046 140c          	and	a,(OFST+6,sp)
3297  0048 01            	rrwa	x,a
3298  0049 140b          	and	a,(OFST+5,sp)
3299  004b 01            	rrwa	x,a
3300  004c 130b          	cpw	x,(OFST+5,sp)
3301  004e 2606          	jrne	L1361
3302                     ; 1062     status = SUCCESS;
3304  0050 a601          	ld	a,#1
3305  0052 6b06          	ld	(OFST+0,sp),a
3307  0054 2002          	jra	L3361
3308  0056               L1361:
3309                     ; 1067     status = ERROR;
3311  0056 0f06          	clr	(OFST+0,sp)
3312  0058               L3361:
3313                     ; 1071   return status;
3315  0058 7b06          	ld	a,(OFST+0,sp)
3318  005a 5b08          	addw	sp,#8
3319  005c 81            	ret
3380                     ; 1089 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3380                     ; 1090 {
3381                     .text:	section	.text,new
3382  0000               _I2C_GetLastEvent:
3384  0000 89            	pushw	x
3385  0001 5206          	subw	sp,#6
3386       00000006      OFST:	set	6
3389                     ; 1091   __IO uint16_t lastevent = 0;
3391  0003 5f            	clrw	x
3392  0004 1f05          	ldw	(OFST-1,sp),x
3393                     ; 1092   uint16_t flag1 = 0;
3395  0006 1e01          	ldw	x,(OFST-5,sp)
3396                     ; 1093   uint16_t flag2 = 0;
3398  0008 1e03          	ldw	x,(OFST-3,sp)
3399                     ; 1095   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3401  000a 1e07          	ldw	x,(OFST+1,sp)
3402  000c e608          	ld	a,(8,x)
3403  000e a504          	bcp	a,#4
3404  0010 2707          	jreq	L5661
3405                     ; 1097     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3407  0012 ae0004        	ldw	x,#4
3408  0015 1f05          	ldw	(OFST-1,sp),x
3410  0017 201d          	jra	L7661
3411  0019               L5661:
3412                     ; 1102     flag1 = I2Cx->SR1;
3414  0019 1e07          	ldw	x,(OFST+1,sp)
3415  001b e607          	ld	a,(7,x)
3416  001d 5f            	clrw	x
3417  001e 97            	ld	xl,a
3418  001f 1f01          	ldw	(OFST-5,sp),x
3419                     ; 1103     flag2 = I2Cx->SR3;
3421  0021 1e07          	ldw	x,(OFST+1,sp)
3422  0023 e609          	ld	a,(9,x)
3423  0025 5f            	clrw	x
3424  0026 97            	ld	xl,a
3425  0027 1f03          	ldw	(OFST-3,sp),x
3426                     ; 1106     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3428  0029 1e03          	ldw	x,(OFST-3,sp)
3429  002b 4f            	clr	a
3430  002c 02            	rlwa	x,a
3431  002d 01            	rrwa	x,a
3432  002e 1a02          	or	a,(OFST-4,sp)
3433  0030 01            	rrwa	x,a
3434  0031 1a01          	or	a,(OFST-5,sp)
3435  0033 01            	rrwa	x,a
3436  0034 1f05          	ldw	(OFST-1,sp),x
3437  0036               L7661:
3438                     ; 1109   return (I2C_Event_TypeDef)lastevent;
3440  0036 1e05          	ldw	x,(OFST-1,sp)
3443  0038 5b08          	addw	sp,#8
3444  003a 81            	ret
3697                     ; 1146 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3697                     ; 1147 {
3698                     .text:	section	.text,new
3699  0000               _I2C_GetFlagStatus:
3701  0000 89            	pushw	x
3702  0001 89            	pushw	x
3703       00000002      OFST:	set	2
3706                     ; 1148   uint8_t tempreg = 0;
3708  0002 0f02          	clr	(OFST+0,sp)
3709                     ; 1149   uint8_t regindex = 0;
3711  0004 7b01          	ld	a,(OFST-1,sp)
3712  0006 97            	ld	xl,a
3713                     ; 1150   FlagStatus bitstatus = RESET;
3715  0007 7b02          	ld	a,(OFST+0,sp)
3716  0009 97            	ld	xl,a
3717                     ; 1153   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3719                     ; 1156   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3721  000a 7b07          	ld	a,(OFST+5,sp)
3722  000c 6b01          	ld	(OFST-1,sp),a
3723                     ; 1158   switch (regindex)
3725  000e 7b01          	ld	a,(OFST-1,sp)
3727                     ; 1175     default:
3727                     ; 1176       break;
3728  0010 4a            	dec	a
3729  0011 2708          	jreq	L1761
3730  0013 4a            	dec	a
3731  0014 270d          	jreq	L3761
3732  0016 4a            	dec	a
3733  0017 2712          	jreq	L5761
3734  0019 2016          	jra	L7202
3735  001b               L1761:
3736                     ; 1161     case 0x01:
3736                     ; 1162       tempreg = (uint8_t)I2Cx->SR1;
3738  001b 1e03          	ldw	x,(OFST+1,sp)
3739  001d e607          	ld	a,(7,x)
3740  001f 6b02          	ld	(OFST+0,sp),a
3741                     ; 1163       break;
3743  0021 200e          	jra	L7202
3744  0023               L3761:
3745                     ; 1166     case 0x02:
3745                     ; 1167       tempreg = (uint8_t)I2Cx->SR2;
3747  0023 1e03          	ldw	x,(OFST+1,sp)
3748  0025 e608          	ld	a,(8,x)
3749  0027 6b02          	ld	(OFST+0,sp),a
3750                     ; 1168       break;
3752  0029 2006          	jra	L7202
3753  002b               L5761:
3754                     ; 1171     case 0x03:
3754                     ; 1172       tempreg = (uint8_t)I2Cx->SR3;
3756  002b 1e03          	ldw	x,(OFST+1,sp)
3757  002d e609          	ld	a,(9,x)
3758  002f 6b02          	ld	(OFST+0,sp),a
3759                     ; 1173       break;
3761  0031               L7761:
3762                     ; 1175     default:
3762                     ; 1176       break;
3764  0031               L7202:
3765                     ; 1180   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3767  0031 7b08          	ld	a,(OFST+6,sp)
3768  0033 1502          	bcp	a,(OFST+0,sp)
3769  0035 2706          	jreq	L1302
3770                     ; 1183     bitstatus = SET;
3772  0037 a601          	ld	a,#1
3773  0039 6b02          	ld	(OFST+0,sp),a
3775  003b 2002          	jra	L3302
3776  003d               L1302:
3777                     ; 1188     bitstatus = RESET;
3779  003d 0f02          	clr	(OFST+0,sp)
3780  003f               L3302:
3781                     ; 1191   return bitstatus;
3783  003f 7b02          	ld	a,(OFST+0,sp)
3786  0041 5b04          	addw	sp,#4
3787  0043 81            	ret
3841                     ; 1223 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3841                     ; 1224 {
3842                     .text:	section	.text,new
3843  0000               _I2C_ClearFlag:
3845  0000 89            	pushw	x
3846  0001 89            	pushw	x
3847       00000002      OFST:	set	2
3850                     ; 1225   uint16_t flagpos = 0;
3852  0002 5f            	clrw	x
3853  0003 1f01          	ldw	(OFST-1,sp),x
3854                     ; 1227   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3856                     ; 1230   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3858  0005 7b07          	ld	a,(OFST+5,sp)
3859  0007 97            	ld	xl,a
3860  0008 7b08          	ld	a,(OFST+6,sp)
3861  000a a4ff          	and	a,#255
3862  000c 5f            	clrw	x
3863  000d 02            	rlwa	x,a
3864  000e 1f01          	ldw	(OFST-1,sp),x
3865  0010 01            	rrwa	x,a
3866                     ; 1232   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3868  0011 7b02          	ld	a,(OFST+0,sp)
3869  0013 43            	cpl	a
3870  0014 1e03          	ldw	x,(OFST+1,sp)
3871  0016 e708          	ld	(8,x),a
3872                     ; 1233 }
3875  0018 5b04          	addw	sp,#4
3876  001a 81            	ret
3950                     ; 1258 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3950                     ; 1259 {
3951                     .text:	section	.text,new
3952  0000               _I2C_GetITStatus:
3954  0000 89            	pushw	x
3955  0001 5204          	subw	sp,#4
3956       00000004      OFST:	set	4
3959                     ; 1260   ITStatus bitstatus = RESET;
3961  0003 7b04          	ld	a,(OFST+0,sp)
3962  0005 97            	ld	xl,a
3963                     ; 1261   __IO uint8_t enablestatus = 0;
3965  0006 0f03          	clr	(OFST-1,sp)
3966                     ; 1262   uint16_t tempregister = 0;
3968  0008 1e01          	ldw	x,(OFST-3,sp)
3969                     ; 1265   assert_param(IS_I2C_GET_IT(I2C_IT));
3971                     ; 1267   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3973  000a 7b09          	ld	a,(OFST+5,sp)
3974  000c 97            	ld	xl,a
3975  000d 7b0a          	ld	a,(OFST+6,sp)
3976  000f 9f            	ld	a,xl
3977  0010 a407          	and	a,#7
3978  0012 97            	ld	xl,a
3979  0013 4f            	clr	a
3980  0014 02            	rlwa	x,a
3981  0015 4f            	clr	a
3982  0016 01            	rrwa	x,a
3983  0017 9f            	ld	a,xl
3984  0018 5f            	clrw	x
3985  0019 97            	ld	xl,a
3986  001a 1f01          	ldw	(OFST-3,sp),x
3987                     ; 1270   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3989  001c 1e05          	ldw	x,(OFST+1,sp)
3990  001e e60a          	ld	a,(10,x)
3991  0020 1402          	and	a,(OFST-2,sp)
3992  0022 6b03          	ld	(OFST-1,sp),a
3993                     ; 1272   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3995  0024 7b09          	ld	a,(OFST+5,sp)
3996  0026 97            	ld	xl,a
3997  0027 7b0a          	ld	a,(OFST+6,sp)
3998  0029 9f            	ld	a,xl
3999  002a a430          	and	a,#48
4000  002c 97            	ld	xl,a
4001  002d 4f            	clr	a
4002  002e 02            	rlwa	x,a
4003  002f a30100        	cpw	x,#256
4004  0032 2616          	jrne	L1212
4005                     ; 1275     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4007  0034 1e05          	ldw	x,(OFST+1,sp)
4008  0036 e607          	ld	a,(7,x)
4009  0038 150a          	bcp	a,(OFST+6,sp)
4010  003a 270a          	jreq	L3212
4012  003c 0d03          	tnz	(OFST-1,sp)
4013  003e 2706          	jreq	L3212
4014                     ; 1278       bitstatus = SET;
4016  0040 a601          	ld	a,#1
4017  0042 6b04          	ld	(OFST+0,sp),a
4019  0044 2018          	jra	L7212
4020  0046               L3212:
4021                     ; 1283       bitstatus = RESET;
4023  0046 0f04          	clr	(OFST+0,sp)
4024  0048 2014          	jra	L7212
4025  004a               L1212:
4026                     ; 1289     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4028  004a 1e05          	ldw	x,(OFST+1,sp)
4029  004c e608          	ld	a,(8,x)
4030  004e 150a          	bcp	a,(OFST+6,sp)
4031  0050 270a          	jreq	L1312
4033  0052 0d03          	tnz	(OFST-1,sp)
4034  0054 2706          	jreq	L1312
4035                     ; 1292       bitstatus = SET;
4037  0056 a601          	ld	a,#1
4038  0058 6b04          	ld	(OFST+0,sp),a
4040  005a 2002          	jra	L7212
4041  005c               L1312:
4042                     ; 1297       bitstatus = RESET;
4044  005c 0f04          	clr	(OFST+0,sp)
4045  005e               L7212:
4046                     ; 1301   return  bitstatus;
4048  005e 7b04          	ld	a,(OFST+0,sp)
4051  0060 5b06          	addw	sp,#6
4052  0062 81            	ret
4107                     ; 1334 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4107                     ; 1335 {
4108                     .text:	section	.text,new
4109  0000               _I2C_ClearITPendingBit:
4111  0000 89            	pushw	x
4112  0001 89            	pushw	x
4113       00000002      OFST:	set	2
4116                     ; 1336   uint16_t flagpos = 0;
4118  0002 5f            	clrw	x
4119  0003 1f01          	ldw	(OFST-1,sp),x
4120                     ; 1339   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4122                     ; 1342   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4124  0005 7b07          	ld	a,(OFST+5,sp)
4125  0007 97            	ld	xl,a
4126  0008 7b08          	ld	a,(OFST+6,sp)
4127  000a a4ff          	and	a,#255
4128  000c 5f            	clrw	x
4129  000d 02            	rlwa	x,a
4130  000e 1f01          	ldw	(OFST-1,sp),x
4131  0010 01            	rrwa	x,a
4132                     ; 1345   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4134  0011 7b02          	ld	a,(OFST+0,sp)
4135  0013 43            	cpl	a
4136  0014 1e03          	ldw	x,(OFST+1,sp)
4137  0016 e708          	ld	(8,x),a
4138                     ; 1346 }
4141  0018 5b04          	addw	sp,#4
4142  001a 81            	ret
4155                     	xdef	_I2C_ClearITPendingBit
4156                     	xdef	_I2C_GetITStatus
4157                     	xdef	_I2C_ClearFlag
4158                     	xdef	_I2C_GetFlagStatus
4159                     	xdef	_I2C_GetLastEvent
4160                     	xdef	_I2C_CheckEvent
4161                     	xdef	_I2C_ReadRegister
4162                     	xdef	_I2C_ITConfig
4163                     	xdef	_I2C_DMALastTransferCmd
4164                     	xdef	_I2C_DMACmd
4165                     	xdef	_I2C_CalculatePEC
4166                     	xdef	_I2C_TransmitPEC
4167                     	xdef	_I2C_GetPEC
4168                     	xdef	_I2C_PECPositionConfig
4169                     	xdef	_I2C_ReceiveData
4170                     	xdef	_I2C_SendData
4171                     	xdef	_I2C_Send7bitAddress
4172                     	xdef	_I2C_SMBusAlertConfig
4173                     	xdef	_I2C_FastModeDutyCycleConfig
4174                     	xdef	_I2C_AckPositionConfig
4175                     	xdef	_I2C_DualAddressCmd
4176                     	xdef	_I2C_OwnAddress2Config
4177                     	xdef	_I2C_AcknowledgeConfig
4178                     	xdef	_I2C_GenerateSTOP
4179                     	xdef	_I2C_GenerateSTART
4180                     	xdef	_I2C_ARPCmd
4181                     	xdef	_I2C_StretchClockCmd
4182                     	xdef	_I2C_SoftwareResetCmd
4183                     	xdef	_I2C_GeneralCallCmd
4184                     	xdef	_I2C_Cmd
4185                     	xdef	_I2C_Init
4186                     	xdef	_I2C_DeInit
4187                     	xref	_CLK_GetClockFreq
4188                     	xref.b	c_lreg
4189                     	xref.b	c_x
4208                     	xref	c_uitolx
4209                     	xref	c_sdivx
4210                     	xref	c_lzmp
4211                     	xref	c_rtol
4212                     	xref	c_smul
4213                     	xref	c_lmul
4214                     	xref	c_lcmp
4215                     	xref	c_ludv
4216                     	xref	c_ltor
4217                     	end
