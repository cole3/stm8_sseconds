   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 76 void PWR_DeInit(void)
  32                     ; 77 {
  34                     .text:	section	.text,new
  35  0000               _PWR_DeInit:
  39                     ; 78   PWR->CSR1 = PWR_CSR1_PVDIF;
  41  0000 352050b2      	mov	20658,#32
  42                     ; 79   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  44  0004 725f50b3      	clr	20659
  45                     ; 80 }
  48  0008 81            	ret
 145                     ; 96 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 145                     ; 97 {
 146                     .text:	section	.text,new
 147  0000               _PWR_PVDLevelConfig:
 149  0000 88            	push	a
 150       00000000      OFST:	set	0
 153                     ; 99   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 155                     ; 102   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 157  0001 c650b2        	ld	a,20658
 158  0004 a4f1          	and	a,#241
 159  0006 c750b2        	ld	20658,a
 160                     ; 105   PWR->CSR1 |= PWR_PVDLevel;
 162  0009 c650b2        	ld	a,20658
 163  000c 1a01          	or	a,(OFST+1,sp)
 164  000e c750b2        	ld	20658,a
 165                     ; 107 }
 168  0011 84            	pop	a
 169  0012 81            	ret
 224                     ; 115 void PWR_PVDCmd(FunctionalState NewState)
 224                     ; 116 {
 225                     .text:	section	.text,new
 226  0000               _PWR_PVDCmd:
 230                     ; 118   assert_param(IS_FUNCTIONAL_STATE(NewState));
 232                     ; 120   if (NewState != DISABLE)
 234  0000 4d            	tnz	a
 235  0001 2706          	jreq	L111
 236                     ; 123     PWR->CSR1 |= PWR_CSR1_PVDE;
 238  0003 721050b2      	bset	20658,#0
 240  0007 2004          	jra	L311
 241  0009               L111:
 242                     ; 128     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 244  0009 721150b2      	bres	20658,#0
 245  000d               L311:
 246                     ; 130 }
 249  000d 81            	ret
 284                     ; 165 void PWR_FastWakeUpCmd(FunctionalState NewState)
 284                     ; 166 {
 285                     .text:	section	.text,new
 286  0000               _PWR_FastWakeUpCmd:
 290                     ; 168   assert_param(IS_FUNCTIONAL_STATE(NewState));
 292                     ; 170   if (NewState != DISABLE)
 294  0000 4d            	tnz	a
 295  0001 2706          	jreq	L331
 296                     ; 173     PWR->CSR2 |= PWR_CSR2_FWU;
 298  0003 721450b3      	bset	20659,#2
 300  0007 2004          	jra	L531
 301  0009               L331:
 302                     ; 178     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 304  0009 721550b3      	bres	20659,#2
 305  000d               L531:
 306                     ; 180 }
 309  000d 81            	ret
 345                     ; 188 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 345                     ; 189 {
 346                     .text:	section	.text,new
 347  0000               _PWR_UltraLowPowerCmd:
 351                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 353                     ; 193   if (NewState != DISABLE)
 355  0000 4d            	tnz	a
 356  0001 2706          	jreq	L551
 357                     ; 196     PWR->CSR2 |= PWR_CSR2_ULP;
 359  0003 721250b3      	bset	20659,#1
 361  0007 2004          	jra	L751
 362  0009               L551:
 363                     ; 201     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 365  0009 721350b3      	bres	20659,#1
 366  000d               L751:
 367                     ; 203 }
 370  000d 81            	ret
 405                     ; 226 void PWR_PVDITConfig(FunctionalState NewState)
 405                     ; 227 {
 406                     .text:	section	.text,new
 407  0000               _PWR_PVDITConfig:
 411                     ; 229   assert_param(IS_FUNCTIONAL_STATE(NewState));
 413                     ; 231   if (NewState != DISABLE)
 415  0000 4d            	tnz	a
 416  0001 2706          	jreq	L771
 417                     ; 234     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 419  0003 721850b2      	bset	20658,#4
 421  0007 2004          	jra	L102
 422  0009               L771:
 423                     ; 239     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 425  0009 721950b2      	bres	20658,#4
 426  000d               L102:
 427                     ; 241 }
 430  000d 81            	ret
 523                     ; 255 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 523                     ; 256 {
 524                     .text:	section	.text,new
 525  0000               _PWR_GetFlagStatus:
 527  0000 88            	push	a
 528  0001 88            	push	a
 529       00000001      OFST:	set	1
 532                     ; 257   FlagStatus bitstatus = RESET;
 534  0002 0f01          	clr	(OFST+0,sp)
 535                     ; 260   assert_param(IS_PWR_FLAG(PWR_FLAG));
 537                     ; 262   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 539  0004 a501          	bcp	a,#1
 540  0006 2711          	jreq	L742
 541                     ; 264     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 543  0008 c650b3        	ld	a,20659
 544  000b a501          	bcp	a,#1
 545  000d 2706          	jreq	L152
 546                     ; 266       bitstatus = SET;
 548  000f a601          	ld	a,#1
 549  0011 6b01          	ld	(OFST+0,sp),a
 551  0013 2013          	jra	L552
 552  0015               L152:
 553                     ; 270       bitstatus = RESET;
 555  0015 0f01          	clr	(OFST+0,sp)
 556  0017 200f          	jra	L552
 557  0019               L742:
 558                     ; 275     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 560  0019 c650b2        	ld	a,20658
 561  001c 1502          	bcp	a,(OFST+1,sp)
 562  001e 2706          	jreq	L752
 563                     ; 277       bitstatus = SET;
 565  0020 a601          	ld	a,#1
 566  0022 6b01          	ld	(OFST+0,sp),a
 568  0024 2002          	jra	L552
 569  0026               L752:
 570                     ; 281       bitstatus = RESET;
 572  0026 0f01          	clr	(OFST+0,sp)
 573  0028               L552:
 574                     ; 286   return((FlagStatus)bitstatus);
 576  0028 7b01          	ld	a,(OFST+0,sp)
 579  002a 85            	popw	x
 580  002b 81            	ret
 603                     ; 294 void PWR_PVDClearFlag(void)
 603                     ; 295 {
 604                     .text:	section	.text,new
 605  0000               _PWR_PVDClearFlag:
 609                     ; 297   PWR->CSR1 |= PWR_CSR1_PVDIF;
 611  0000 721a50b2      	bset	20658,#5
 612                     ; 298 }
 615  0004 81            	ret
 665                     ; 305 ITStatus PWR_PVDGetITStatus(void)
 665                     ; 306 {
 666                     .text:	section	.text,new
 667  0000               _PWR_PVDGetITStatus:
 669  0000 89            	pushw	x
 670       00000002      OFST:	set	2
 673                     ; 307   ITStatus bitstatus = RESET;
 675  0001 7b02          	ld	a,(OFST+0,sp)
 676  0003 97            	ld	xl,a
 677                     ; 309   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 679  0004 7b01          	ld	a,(OFST-1,sp)
 680  0006 97            	ld	xl,a
 683  0007 7b02          	ld	a,(OFST+0,sp)
 684  0009 97            	ld	xl,a
 685                     ; 311   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 687  000a c650b2        	ld	a,20658
 688  000d a420          	and	a,#32
 689  000f 6b01          	ld	(OFST-1,sp),a
 690                     ; 312   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 692  0011 c650b2        	ld	a,20658
 693  0014 a410          	and	a,#16
 694  0016 6b02          	ld	(OFST+0,sp),a
 695                     ; 314   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 697  0018 0d01          	tnz	(OFST-1,sp)
 698  001a 270a          	jreq	L513
 700  001c 0d02          	tnz	(OFST+0,sp)
 701  001e 2706          	jreq	L513
 702                     ; 316     bitstatus = (ITStatus)SET;
 704  0020 a601          	ld	a,#1
 705  0022 6b02          	ld	(OFST+0,sp),a
 707  0024 2002          	jra	L713
 708  0026               L513:
 709                     ; 320     bitstatus = (ITStatus)RESET;
 711  0026 0f02          	clr	(OFST+0,sp)
 712  0028               L713:
 713                     ; 322   return ((ITStatus)bitstatus);
 715  0028 7b02          	ld	a,(OFST+0,sp)
 718  002a 85            	popw	x
 719  002b 81            	ret
 743                     ; 330 void PWR_PVDClearITPendingBit(void)
 743                     ; 331 {
 744                     .text:	section	.text,new
 745  0000               _PWR_PVDClearITPendingBit:
 749                     ; 333   PWR->CSR1 |= PWR_CSR1_PVDIF;
 751  0000 721a50b2      	bset	20658,#5
 752                     ; 334 }
 755  0004 81            	ret
 768                     	xdef	_PWR_PVDClearITPendingBit
 769                     	xdef	_PWR_PVDClearFlag
 770                     	xdef	_PWR_GetFlagStatus
 771                     	xdef	_PWR_PVDGetITStatus
 772                     	xdef	_PWR_PVDITConfig
 773                     	xdef	_PWR_UltraLowPowerCmd
 774                     	xdef	_PWR_FastWakeUpCmd
 775                     	xdef	_PWR_PVDCmd
 776                     	xdef	_PWR_PVDLevelConfig
 777                     	xdef	_PWR_DeInit
 796                     	end
