   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 87 void AES_DeInit(void)
  32                     ; 88 {
  34                     .text:	section	.text,new
  35  0000               _AES_DeInit:
  39                     ; 90   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  41  0000 351853d0      	mov	21456,#24
  42                     ; 91   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  44  0004 725f53d2      	clr	21458
  45                     ; 92   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  47  0008 725f53d3      	clr	21459
  48                     ; 93 }
  51  000c 81            	ret
 125                     ; 106 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 125                     ; 107 {
 126                     .text:	section	.text,new
 127  0000               _AES_OperationModeConfig:
 129  0000 88            	push	a
 130       00000000      OFST:	set	0
 133                     ; 109   assert_param(IS_AES_MODE(AES_Operation));
 135                     ; 112   AES->CR &= (uint8_t) (~AES_CR_MODE);
 137  0001 c653d0        	ld	a,21456
 138  0004 a4f9          	and	a,#249
 139  0006 c753d0        	ld	21456,a
 140                     ; 115   AES->CR |= (uint8_t) (AES_Operation);
 142  0009 c653d0        	ld	a,21456
 143  000c 1a01          	or	a,(OFST+1,sp)
 144  000e c753d0        	ld	21456,a
 145                     ; 116 }
 148  0011 84            	pop	a
 149  0012 81            	ret
 204                     ; 126 void AES_Cmd(FunctionalState NewState)
 204                     ; 127 {
 205                     .text:	section	.text,new
 206  0000               _AES_Cmd:
 210                     ; 129   assert_param(IS_FUNCTIONAL_STATE(NewState));
 212                     ; 131   if (NewState != DISABLE)
 214  0000 4d            	tnz	a
 215  0001 2706          	jreq	L101
 216                     ; 133     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 218  0003 721053d0      	bset	21456,#0
 220  0007 2004          	jra	L301
 221  0009               L101:
 222                     ; 137     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 224  0009 721153d0      	bres	21456,#0
 225  000d               L301:
 226                     ; 139 }
 229  000d 81            	ret
 261                     ; 164 void AES_WriteSubData(uint8_t Data)
 261                     ; 165 {
 262                     .text:	section	.text,new
 263  0000               _AES_WriteSubData:
 267                     ; 167   AES->DINR = Data;
 269  0000 c753d2        	ld	21458,a
 270                     ; 168 }
 273  0003 81            	ret
 305                     ; 177 void AES_WriteSubKey(uint8_t Key)
 305                     ; 178 {
 306                     .text:	section	.text,new
 307  0000               _AES_WriteSubKey:
 311                     ; 180   AES->DINR = Key;
 313  0000 c753d2        	ld	21458,a
 314                     ; 181 }
 317  0003 81            	ret
 340                     ; 189 uint8_t AES_ReadSubData(void)
 340                     ; 190 {
 341                     .text:	section	.text,new
 342  0000               _AES_ReadSubData:
 346                     ; 191   return AES->DOUTR;
 348  0000 c653d3        	ld	a,21459
 351  0003 81            	ret
 374                     ; 200 uint8_t AES_ReadSubKey(void)
 374                     ; 201 {
 375                     .text:	section	.text,new
 376  0000               _AES_ReadSubKey:
 380                     ; 202   return AES->DOUTR;
 382  0000 c653d3        	ld	a,21459
 385  0003 81            	ret
 444                     ; 231 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 444                     ; 232 {
 445                     .text:	section	.text,new
 446  0000               _AES_DMAConfig:
 448  0000 89            	pushw	x
 449       00000000      OFST:	set	0
 452                     ; 234   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 454                     ; 236   if (NewState != DISABLE)
 456  0001 9f            	ld	a,xl
 457  0002 4d            	tnz	a
 458  0003 2709          	jreq	L502
 459                     ; 239     AES->CR |= (uint8_t) AES_DMATransfer;
 461  0005 9e            	ld	a,xh
 462  0006 ca53d0        	or	a,21456
 463  0009 c753d0        	ld	21456,a
 465  000c 2009          	jra	L702
 466  000e               L502:
 467                     ; 244     AES->CR &= (uint8_t)(~AES_DMATransfer);
 469  000e 7b01          	ld	a,(OFST+1,sp)
 470  0010 43            	cpl	a
 471  0011 c453d0        	and	a,21456
 472  0014 c753d0        	ld	21456,a
 473  0017               L702:
 474                     ; 246 }
 477  0017 85            	popw	x
 478  0018 81            	ret
 543                     ; 275 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 543                     ; 276 {
 544                     .text:	section	.text,new
 545  0000               _AES_ITConfig:
 547  0000 89            	pushw	x
 548       00000000      OFST:	set	0
 551                     ; 278   assert_param(IS_FUNCTIONAL_STATE(NewState));
 553                     ; 279   assert_param(IS_AES_IT(AES_IT));
 555                     ; 281   if (NewState != DISABLE)
 557  0001 9f            	ld	a,xl
 558  0002 4d            	tnz	a
 559  0003 2709          	jreq	L342
 560                     ; 283     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 562  0005 9e            	ld	a,xh
 563  0006 ca53d0        	or	a,21456
 564  0009 c753d0        	ld	21456,a
 566  000c 2009          	jra	L542
 567  000e               L342:
 568                     ; 287     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 570  000e 7b01          	ld	a,(OFST+1,sp)
 571  0010 43            	cpl	a
 572  0011 c453d0        	and	a,21456
 573  0014 c753d0        	ld	21456,a
 574  0017               L542:
 575                     ; 289 }
 578  0017 85            	popw	x
 579  0018 81            	ret
 672                     ; 301 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 672                     ; 302 {
 673                     .text:	section	.text,new
 674  0000               _AES_GetFlagStatus:
 676  0000 88            	push	a
 677  0001 88            	push	a
 678       00000001      OFST:	set	1
 681                     ; 303   FlagStatus status = RESET;
 683  0002 0f01          	clr	(OFST+0,sp)
 684                     ; 306   assert_param(IS_AES_FLAG(AES_FLAG));
 686                     ; 308   if (AES_FLAG == AES_FLAG_CCF)
 688  0004 a101          	cp	a,#1
 689  0006 2611          	jrne	L313
 690                     ; 310     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 692  0008 c653d1        	ld	a,21457
 693  000b a501          	bcp	a,#1
 694  000d 2706          	jreq	L513
 695                     ; 313       status = (FlagStatus) SET;
 697  000f a601          	ld	a,#1
 698  0011 6b01          	ld	(OFST+0,sp),a
 700  0013 202a          	jra	L123
 701  0015               L513:
 702                     ; 318       status = (FlagStatus) RESET;
 704  0015 0f01          	clr	(OFST+0,sp)
 705  0017 2026          	jra	L123
 706  0019               L313:
 707                     ; 321   else if (AES_FLAG == AES_FLAG_RDERR)
 709  0019 7b02          	ld	a,(OFST+1,sp)
 710  001b a102          	cp	a,#2
 711  001d 2611          	jrne	L323
 712                     ; 323     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 714  001f c653d1        	ld	a,21457
 715  0022 a502          	bcp	a,#2
 716  0024 2706          	jreq	L523
 717                     ; 326       status = (FlagStatus) SET;
 719  0026 a601          	ld	a,#1
 720  0028 6b01          	ld	(OFST+0,sp),a
 722  002a 2013          	jra	L123
 723  002c               L523:
 724                     ; 331       status = (FlagStatus) RESET;
 726  002c 0f01          	clr	(OFST+0,sp)
 727  002e 200f          	jra	L123
 728  0030               L323:
 729                     ; 336     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 731  0030 c653d1        	ld	a,21457
 732  0033 a504          	bcp	a,#4
 733  0035 2706          	jreq	L333
 734                     ; 339       status = (FlagStatus) SET;
 736  0037 a601          	ld	a,#1
 737  0039 6b01          	ld	(OFST+0,sp),a
 739  003b 2002          	jra	L123
 740  003d               L333:
 741                     ; 344       status = (FlagStatus) RESET;
 743  003d 0f01          	clr	(OFST+0,sp)
 744  003f               L123:
 745                     ; 348   return ((FlagStatus) status);
 747  003f 7b01          	ld	a,(OFST+0,sp)
 750  0041 85            	popw	x
 751  0042 81            	ret
 786                     ; 360 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 786                     ; 361 {
 787                     .text:	section	.text,new
 788  0000               _AES_ClearFlag:
 792                     ; 363   assert_param(IS_AES_FLAG(AES_FLAG));
 794                     ; 366   if (AES_FLAG == AES_FLAG_CCF)
 796  0000 a101          	cp	a,#1
 797  0002 2606          	jrne	L553
 798                     ; 369     AES->CR |= (uint8_t) AES_CR_CCFC;
 800  0004 721653d0      	bset	21456,#3
 802  0008 2004          	jra	L753
 803  000a               L553:
 804                     ; 374     AES->CR |= (uint8_t) AES_CR_ERRC;
 806  000a 721853d0      	bset	21456,#4
 807  000e               L753:
 808                     ; 376 }
 811  000e 81            	ret
 877                     ; 386 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 877                     ; 387 {
 878                     .text:	section	.text,new
 879  0000               _AES_GetITStatus:
 881  0000 88            	push	a
 882  0001 89            	pushw	x
 883       00000002      OFST:	set	2
 886                     ; 388   ITStatus itstatus = RESET;
 888  0002 7b02          	ld	a,(OFST+0,sp)
 889  0004 97            	ld	xl,a
 890                     ; 389   BitStatus cciebitstatus, ccfbitstatus = RESET;
 892  0005 7b02          	ld	a,(OFST+0,sp)
 893  0007 97            	ld	xl,a
 894                     ; 392   assert_param(IS_AES_IT(AES_IT));
 896                     ; 394   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 898  0008 c653d0        	ld	a,21456
 899  000b a420          	and	a,#32
 900  000d 6b01          	ld	(OFST-1,sp),a
 901                     ; 395   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 903  000f c653d1        	ld	a,21457
 904  0012 a401          	and	a,#1
 905  0014 6b02          	ld	(OFST+0,sp),a
 906                     ; 398   if (AES_IT == AES_IT_CCIE)
 908  0016 7b03          	ld	a,(OFST+1,sp)
 909  0018 a120          	cp	a,#32
 910  001a 2612          	jrne	L314
 911                     ; 401     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 913  001c 0d01          	tnz	(OFST-1,sp)
 914  001e 270a          	jreq	L514
 916  0020 0d02          	tnz	(OFST+0,sp)
 917  0022 2706          	jreq	L514
 918                     ; 404       itstatus = (ITStatus) SET;
 920  0024 a601          	ld	a,#1
 921  0026 6b02          	ld	(OFST+0,sp),a
 923  0028 201e          	jra	L124
 924  002a               L514:
 925                     ; 409       itstatus = (ITStatus) RESET;
 927  002a 0f02          	clr	(OFST+0,sp)
 928  002c 201a          	jra	L124
 929  002e               L314:
 930                     ; 415     if ((AES->CR & AES_CR_ERRIE) != RESET)
 932  002e c653d0        	ld	a,21456
 933  0031 a540          	bcp	a,#64
 934  0033 2711          	jreq	L324
 935                     ; 418       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 937  0035 c653d1        	ld	a,21457
 938  0038 a506          	bcp	a,#6
 939  003a 2706          	jreq	L524
 940                     ; 421         itstatus = (ITStatus) SET;
 942  003c a601          	ld	a,#1
 943  003e 6b02          	ld	(OFST+0,sp),a
 945  0040 2006          	jra	L124
 946  0042               L524:
 947                     ; 426         itstatus = (ITStatus) RESET;
 949  0042 0f02          	clr	(OFST+0,sp)
 950  0044 2002          	jra	L124
 951  0046               L324:
 952                     ; 432       itstatus = (ITStatus) RESET;
 954  0046 0f02          	clr	(OFST+0,sp)
 955  0048               L124:
 956                     ; 437   return ((ITStatus)itstatus);
 958  0048 7b02          	ld	a,(OFST+0,sp)
 961  004a 5b03          	addw	sp,#3
 962  004c 81            	ret
 998                     ; 448 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
 998                     ; 449 {
 999                     .text:	section	.text,new
1000  0000               _AES_ClearITPendingBit:
1004                     ; 451   assert_param(IS_AES_IT(AES_IT));
1006                     ; 454   if (AES_IT == AES_IT_CCIE)
1008  0000 a120          	cp	a,#32
1009  0002 2606          	jrne	L154
1010                     ; 457     AES->CR |= (uint8_t) AES_CR_CCFC;
1012  0004 721653d0      	bset	21456,#3
1014  0008 2004          	jra	L354
1015  000a               L154:
1016                     ; 462     AES->CR |= (uint8_t) AES_CR_ERRC;
1018  000a 721853d0      	bset	21456,#4
1019  000e               L354:
1020                     ; 464 }
1023  000e 81            	ret
1036                     	xdef	_AES_ClearITPendingBit
1037                     	xdef	_AES_GetITStatus
1038                     	xdef	_AES_ClearFlag
1039                     	xdef	_AES_GetFlagStatus
1040                     	xdef	_AES_ITConfig
1041                     	xdef	_AES_DMAConfig
1042                     	xdef	_AES_ReadSubKey
1043                     	xdef	_AES_ReadSubData
1044                     	xdef	_AES_WriteSubKey
1045                     	xdef	_AES_WriteSubData
1046                     	xdef	_AES_Cmd
1047                     	xdef	_AES_OperationModeConfig
1048                     	xdef	_AES_DeInit
1067                     	end
