   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 87 void AES_DeInit(void)
  32                     ; 88 {
  34                     	switch	.text
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
 126                     	switch	.text
 127  000d               _AES_OperationModeConfig:
 129  000d 88            	push	a
 130       00000000      OFST:	set	0
 133                     ; 109   assert_param(IS_AES_MODE(AES_Operation));
 135                     ; 112   AES->CR &= (uint8_t) (~AES_CR_MODE);
 137  000e c653d0        	ld	a,21456
 138  0011 a4f9          	and	a,#249
 139  0013 c753d0        	ld	21456,a
 140                     ; 115   AES->CR |= (uint8_t) (AES_Operation);
 142  0016 c653d0        	ld	a,21456
 143  0019 1a01          	or	a,(OFST+1,sp)
 144  001b c753d0        	ld	21456,a
 145                     ; 116 }
 148  001e 84            	pop	a
 149  001f 81            	ret
 204                     ; 126 void AES_Cmd(FunctionalState NewState)
 204                     ; 127 {
 205                     	switch	.text
 206  0020               _AES_Cmd:
 210                     ; 129   assert_param(IS_FUNCTIONAL_STATE(NewState));
 212                     ; 131   if (NewState != DISABLE)
 214  0020 4d            	tnz	a
 215  0021 2706          	jreq	L101
 216                     ; 133     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 218  0023 721053d0      	bset	21456,#0
 220  0027 2004          	jra	L301
 221  0029               L101:
 222                     ; 137     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 224  0029 721153d0      	bres	21456,#0
 225  002d               L301:
 226                     ; 139 }
 229  002d 81            	ret
 263                     ; 164 void AES_WriteSubData(uint8_t Data)
 263                     ; 165 {
 264                     	switch	.text
 265  002e               _AES_WriteSubData:
 269                     ; 167   AES->DINR = Data;
 271  002e c753d2        	ld	21458,a
 272                     ; 168 }
 275  0031 81            	ret
 309                     ; 177 void AES_WriteSubKey(uint8_t Key)
 309                     ; 178 {
 310                     	switch	.text
 311  0032               _AES_WriteSubKey:
 315                     ; 180   AES->DINR = Key;
 317  0032 c753d2        	ld	21458,a
 318                     ; 181 }
 321  0035 81            	ret
 344                     ; 189 uint8_t AES_ReadSubData(void)
 344                     ; 190 {
 345                     	switch	.text
 346  0036               _AES_ReadSubData:
 350                     ; 191   return AES->DOUTR;
 352  0036 c653d3        	ld	a,21459
 355  0039 81            	ret
 378                     ; 200 uint8_t AES_ReadSubKey(void)
 378                     ; 201 {
 379                     	switch	.text
 380  003a               _AES_ReadSubKey:
 384                     ; 202   return AES->DOUTR;
 386  003a c653d3        	ld	a,21459
 389  003d 81            	ret
 448                     ; 231 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 448                     ; 232 {
 449                     	switch	.text
 450  003e               _AES_DMAConfig:
 452  003e 89            	pushw	x
 453       00000000      OFST:	set	0
 456                     ; 234   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 458                     ; 236   if (NewState != DISABLE)
 460  003f 9f            	ld	a,xl
 461  0040 4d            	tnz	a
 462  0041 2709          	jreq	L112
 463                     ; 239     AES->CR |= (uint8_t) AES_DMATransfer;
 465  0043 9e            	ld	a,xh
 466  0044 ca53d0        	or	a,21456
 467  0047 c753d0        	ld	21456,a
 469  004a 2009          	jra	L312
 470  004c               L112:
 471                     ; 244     AES->CR &= (uint8_t)(~AES_DMATransfer);
 473  004c 7b01          	ld	a,(OFST+1,sp)
 474  004e 43            	cpl	a
 475  004f c453d0        	and	a,21456
 476  0052 c753d0        	ld	21456,a
 477  0055               L312:
 478                     ; 246 }
 481  0055 85            	popw	x
 482  0056 81            	ret
 547                     ; 275 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 547                     ; 276 {
 548                     	switch	.text
 549  0057               _AES_ITConfig:
 551  0057 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 278   assert_param(IS_FUNCTIONAL_STATE(NewState));
 557                     ; 279   assert_param(IS_AES_IT(AES_IT));
 559                     ; 281   if (NewState != DISABLE)
 561  0058 9f            	ld	a,xl
 562  0059 4d            	tnz	a
 563  005a 2709          	jreq	L742
 564                     ; 283     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 566  005c 9e            	ld	a,xh
 567  005d ca53d0        	or	a,21456
 568  0060 c753d0        	ld	21456,a
 570  0063 2009          	jra	L152
 571  0065               L742:
 572                     ; 287     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 574  0065 7b01          	ld	a,(OFST+1,sp)
 575  0067 43            	cpl	a
 576  0068 c453d0        	and	a,21456
 577  006b c753d0        	ld	21456,a
 578  006e               L152:
 579                     ; 289 }
 582  006e 85            	popw	x
 583  006f 81            	ret
 676                     ; 301 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 676                     ; 302 {
 677                     	switch	.text
 678  0070               _AES_GetFlagStatus:
 680  0070 88            	push	a
 681  0071 88            	push	a
 682       00000001      OFST:	set	1
 685                     ; 303   FlagStatus status = RESET;
 687  0072 0f01          	clr	(OFST+0,sp)
 688                     ; 306   assert_param(IS_AES_FLAG(AES_FLAG));
 690                     ; 308   if (AES_FLAG == AES_FLAG_CCF)
 692  0074 a101          	cp	a,#1
 693  0076 2611          	jrne	L713
 694                     ; 310     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 696  0078 c653d1        	ld	a,21457
 697  007b a501          	bcp	a,#1
 698  007d 2706          	jreq	L123
 699                     ; 313       status = (FlagStatus) SET;
 701  007f a601          	ld	a,#1
 702  0081 6b01          	ld	(OFST+0,sp),a
 704  0083 202a          	jra	L523
 705  0085               L123:
 706                     ; 318       status = (FlagStatus) RESET;
 708  0085 0f01          	clr	(OFST+0,sp)
 709  0087 2026          	jra	L523
 710  0089               L713:
 711                     ; 321   else if (AES_FLAG == AES_FLAG_RDERR)
 713  0089 7b02          	ld	a,(OFST+1,sp)
 714  008b a102          	cp	a,#2
 715  008d 2611          	jrne	L723
 716                     ; 323     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 718  008f c653d1        	ld	a,21457
 719  0092 a502          	bcp	a,#2
 720  0094 2706          	jreq	L133
 721                     ; 326       status = (FlagStatus) SET;
 723  0096 a601          	ld	a,#1
 724  0098 6b01          	ld	(OFST+0,sp),a
 726  009a 2013          	jra	L523
 727  009c               L133:
 728                     ; 331       status = (FlagStatus) RESET;
 730  009c 0f01          	clr	(OFST+0,sp)
 731  009e 200f          	jra	L523
 732  00a0               L723:
 733                     ; 336     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 735  00a0 c653d1        	ld	a,21457
 736  00a3 a504          	bcp	a,#4
 737  00a5 2706          	jreq	L733
 738                     ; 339       status = (FlagStatus) SET;
 740  00a7 a601          	ld	a,#1
 741  00a9 6b01          	ld	(OFST+0,sp),a
 743  00ab 2002          	jra	L523
 744  00ad               L733:
 745                     ; 344       status = (FlagStatus) RESET;
 747  00ad 0f01          	clr	(OFST+0,sp)
 748  00af               L523:
 749                     ; 348   return ((FlagStatus) status);
 751  00af 7b01          	ld	a,(OFST+0,sp)
 754  00b1 85            	popw	x
 755  00b2 81            	ret
 790                     ; 360 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 790                     ; 361 {
 791                     	switch	.text
 792  00b3               _AES_ClearFlag:
 796                     ; 363   assert_param(IS_AES_FLAG(AES_FLAG));
 798                     ; 366   if (AES_FLAG == AES_FLAG_CCF)
 800  00b3 a101          	cp	a,#1
 801  00b5 2606          	jrne	L163
 802                     ; 369     AES->CR |= (uint8_t) AES_CR_CCFC;
 804  00b7 721653d0      	bset	21456,#3
 806  00bb 2004          	jra	L363
 807  00bd               L163:
 808                     ; 374     AES->CR |= (uint8_t) AES_CR_ERRC;
 810  00bd 721853d0      	bset	21456,#4
 811  00c1               L363:
 812                     ; 376 }
 815  00c1 81            	ret
 881                     ; 386 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 881                     ; 387 {
 882                     	switch	.text
 883  00c2               _AES_GetITStatus:
 885  00c2 88            	push	a
 886  00c3 89            	pushw	x
 887       00000002      OFST:	set	2
 890                     ; 388   ITStatus itstatus = RESET;
 892  00c4 7b02          	ld	a,(OFST+0,sp)
 893  00c6 97            	ld	xl,a
 894                     ; 389   BitStatus cciebitstatus, ccfbitstatus = RESET;
 896  00c7 7b02          	ld	a,(OFST+0,sp)
 897  00c9 97            	ld	xl,a
 898                     ; 392   assert_param(IS_AES_IT(AES_IT));
 900                     ; 394   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 902  00ca c653d0        	ld	a,21456
 903  00cd a420          	and	a,#32
 904  00cf 6b01          	ld	(OFST-1,sp),a
 905                     ; 395   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 907  00d1 c653d1        	ld	a,21457
 908  00d4 a401          	and	a,#1
 909  00d6 6b02          	ld	(OFST+0,sp),a
 910                     ; 398   if (AES_IT == AES_IT_CCIE)
 912  00d8 7b03          	ld	a,(OFST+1,sp)
 913  00da a120          	cp	a,#32
 914  00dc 2612          	jrne	L714
 915                     ; 401     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 917  00de 0d01          	tnz	(OFST-1,sp)
 918  00e0 270a          	jreq	L124
 920  00e2 0d02          	tnz	(OFST+0,sp)
 921  00e4 2706          	jreq	L124
 922                     ; 404       itstatus = (ITStatus) SET;
 924  00e6 a601          	ld	a,#1
 925  00e8 6b02          	ld	(OFST+0,sp),a
 927  00ea 201e          	jra	L524
 928  00ec               L124:
 929                     ; 409       itstatus = (ITStatus) RESET;
 931  00ec 0f02          	clr	(OFST+0,sp)
 932  00ee 201a          	jra	L524
 933  00f0               L714:
 934                     ; 415     if ((AES->CR & AES_CR_ERRIE) != RESET)
 936  00f0 c653d0        	ld	a,21456
 937  00f3 a540          	bcp	a,#64
 938  00f5 2711          	jreq	L724
 939                     ; 418       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 941  00f7 c653d1        	ld	a,21457
 942  00fa a506          	bcp	a,#6
 943  00fc 2706          	jreq	L134
 944                     ; 421         itstatus = (ITStatus) SET;
 946  00fe a601          	ld	a,#1
 947  0100 6b02          	ld	(OFST+0,sp),a
 949  0102 2006          	jra	L524
 950  0104               L134:
 951                     ; 426         itstatus = (ITStatus) RESET;
 953  0104 0f02          	clr	(OFST+0,sp)
 954  0106 2002          	jra	L524
 955  0108               L724:
 956                     ; 432       itstatus = (ITStatus) RESET;
 958  0108 0f02          	clr	(OFST+0,sp)
 959  010a               L524:
 960                     ; 437   return ((ITStatus)itstatus);
 962  010a 7b02          	ld	a,(OFST+0,sp)
 965  010c 5b03          	addw	sp,#3
 966  010e 81            	ret
1002                     ; 448 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1002                     ; 449 {
1003                     	switch	.text
1004  010f               _AES_ClearITPendingBit:
1008                     ; 451   assert_param(IS_AES_IT(AES_IT));
1010                     ; 454   if (AES_IT == AES_IT_CCIE)
1012  010f a120          	cp	a,#32
1013  0111 2606          	jrne	L554
1014                     ; 457     AES->CR |= (uint8_t) AES_CR_CCFC;
1016  0113 721653d0      	bset	21456,#3
1018  0117 2004          	jra	L754
1019  0119               L554:
1020                     ; 462     AES->CR |= (uint8_t) AES_CR_ERRC;
1022  0119 721853d0      	bset	21456,#4
1023  011d               L754:
1024                     ; 464 }
1027  011d 81            	ret
1040                     	xdef	_AES_ClearITPendingBit
1041                     	xdef	_AES_GetITStatus
1042                     	xdef	_AES_ClearFlag
1043                     	xdef	_AES_GetFlagStatus
1044                     	xdef	_AES_ITConfig
1045                     	xdef	_AES_DMAConfig
1046                     	xdef	_AES_ReadSubKey
1047                     	xdef	_AES_ReadSubData
1048                     	xdef	_AES_WriteSubKey
1049                     	xdef	_AES_WriteSubData
1050                     	xdef	_AES_Cmd
1051                     	xdef	_AES_OperationModeConfig
1052                     	xdef	_AES_DeInit
1071                     	end
