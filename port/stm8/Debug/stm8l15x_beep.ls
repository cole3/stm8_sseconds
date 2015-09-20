   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 86 void BEEP_DeInit(void)
  32                     ; 87 {
  34                     .text:	section	.text,new
  35  0000               _BEEP_DeInit:
  39                     ; 88   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  41  0000 725f50f0      	clr	20720
  42                     ; 89   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  44  0004 351f50f3      	mov	20723,#31
  45                     ; 90 }
  48  0008 81            	ret
 113                     ; 99 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 113                     ; 100 {
 114                     .text:	section	.text,new
 115  0000               _BEEP_Init:
 117  0000 88            	push	a
 118       00000000      OFST:	set	0
 121                     ; 103   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 123                     ; 106   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 125  0001 c650f3        	ld	a,20723
 126  0004 a41f          	and	a,#31
 127  0006 a11f          	cp	a,#31
 128  0008 260c          	jrne	L15
 129                     ; 108     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 131  000a c650f3        	ld	a,20723
 132  000d a4e0          	and	a,#224
 133  000f c750f3        	ld	20723,a
 134                     ; 109     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 136  0012 721050f3      	bset	20723,#0
 137  0016               L15:
 138                     ; 113   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 140  0016 c650f3        	ld	a,20723
 141  0019 a43f          	and	a,#63
 142  001b c750f3        	ld	20723,a
 143                     ; 114   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 145  001e c650f3        	ld	a,20723
 146  0021 1a01          	or	a,(OFST+1,sp)
 147  0023 c750f3        	ld	20723,a
 148                     ; 116 }
 151  0026 84            	pop	a
 152  0027 81            	ret
 207                     ; 124 void BEEP_Cmd(FunctionalState NewState)
 207                     ; 125 {
 208                     .text:	section	.text,new
 209  0000               _BEEP_Cmd:
 213                     ; 127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 215                     ; 129   if (NewState != DISABLE)
 217  0000 4d            	tnz	a
 218  0001 2706          	jreq	L101
 219                     ; 132     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 221  0003 721a50f3      	bset	20723,#5
 223  0007 2004          	jra	L301
 224  0009               L101:
 225                     ; 137     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 227  0009 721b50f3      	bres	20723,#5
 228  000d               L301:
 229                     ; 139 }
 232  000d 81            	ret
 268                     ; 172 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 268                     ; 173 {
 269                     .text:	section	.text,new
 270  0000               _BEEP_LSClockToTIMConnectCmd:
 274                     ; 175   assert_param(IS_FUNCTIONAL_STATE(NewState));
 276                     ; 177   if (NewState != DISABLE)
 278  0000 4d            	tnz	a
 279  0001 2706          	jreq	L321
 280                     ; 180     BEEP->CSR1 |= BEEP_CSR1_MSR;
 282  0003 721050f0      	bset	20720,#0
 284  0007 2004          	jra	L521
 285  0009               L321:
 286                     ; 185     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 288  0009 721150f0      	bres	20720,#0
 289  000d               L521:
 290                     ; 187 }
 293  000d 81            	ret
 340                     .const:	section	.text
 341  0000               L61:
 342  0000 000003e8      	dc.l	1000
 343                     ; 201 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 343                     ; 202 {
 344                     .text:	section	.text,new
 345  0000               _BEEP_LSICalibrationConfig:
 347  0000 5206          	subw	sp,#6
 348       00000006      OFST:	set	6
 351                     ; 207   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 353                     ; 209   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 355  0002 96            	ldw	x,sp
 356  0003 1c0009        	addw	x,#OFST+3
 357  0006 cd0000        	call	c_ltor
 359  0009 ae0000        	ldw	x,#L61
 360  000c cd0000        	call	c_ludv
 362  000f be02          	ldw	x,c_lreg+2
 363  0011 1f03          	ldw	(OFST-3,sp),x
 364                     ; 213   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 366  0013 c650f3        	ld	a,20723
 367  0016 a4e0          	and	a,#224
 368  0018 c750f3        	ld	20723,a
 369                     ; 215   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 371  001b 1e03          	ldw	x,(OFST-3,sp)
 372  001d 54            	srlw	x
 373  001e 54            	srlw	x
 374  001f 54            	srlw	x
 375  0020 1f05          	ldw	(OFST-1,sp),x
 376                     ; 217   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 378  0022 1e05          	ldw	x,(OFST-1,sp)
 379  0024 58            	sllw	x
 380  0025 58            	sllw	x
 381  0026 58            	sllw	x
 382  0027 1f01          	ldw	(OFST-5,sp),x
 383  0029 1e03          	ldw	x,(OFST-3,sp)
 384  002b 72f001        	subw	x,(OFST-5,sp)
 385  002e 1605          	ldw	y,(OFST-1,sp)
 386  0030 9058          	sllw	y
 387  0032 905c          	incw	y
 388  0034 cd0000        	call	c_imul
 390  0037 1605          	ldw	y,(OFST-1,sp)
 391  0039 9058          	sllw	y
 392  003b 9058          	sllw	y
 393  003d 9058          	sllw	y
 394  003f bf01          	ldw	c_x+1,x
 395  0041 90b301        	cpw	y,c_x+1
 396  0044 250c          	jrult	L741
 397                     ; 219     BEEP->CSR2 |= (uint8_t)(A - 2U);
 399  0046 7b06          	ld	a,(OFST+0,sp)
 400  0048 a002          	sub	a,#2
 401  004a ca50f3        	or	a,20723
 402  004d c750f3        	ld	20723,a
 404  0050 2009          	jra	L151
 405  0052               L741:
 406                     ; 223     BEEP->CSR2 |= (uint8_t)(A - 1U);
 408  0052 7b06          	ld	a,(OFST+0,sp)
 409  0054 4a            	dec	a
 410  0055 ca50f3        	or	a,20723
 411  0058 c750f3        	ld	20723,a
 412  005b               L151:
 413                     ; 225 }
 416  005b 5b06          	addw	sp,#6
 417  005d 81            	ret
 430                     	xdef	_BEEP_LSICalibrationConfig
 431                     	xdef	_BEEP_LSClockToTIMConnectCmd
 432                     	xdef	_BEEP_Cmd
 433                     	xdef	_BEEP_Init
 434                     	xdef	_BEEP_DeInit
 435                     	xref.b	c_lreg
 436                     	xref.b	c_x
 455                     	xref	c_imul
 456                     	xref	c_ludv
 457                     	xref	c_ltor
 458                     	end
