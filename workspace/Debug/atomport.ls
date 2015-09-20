   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 188                     ; 81 static NO_REG_SAVE void thread_shell (void)
 188                     ; 82 {
 190                     	switch	.text
 191  0000               L3_thread_shell:
 193  0000 89            	pushw	x
 194       00000002      OFST:	set	2
 197                     ; 86     curr_tcb = atomCurrentContext();
 199  0001 cd0000        	call	_atomCurrentContext
 201  0004 1f01          	ldw	(OFST-1,sp),x
 202                     ; 93     _asm("rim");
 205  0006 9a            rim
 207                     ; 101     if (curr_tcb && curr_tcb->entry_point)
 209  0007 1e01          	ldw	x,(OFST-1,sp)
 210  0009 271a          	jreq	L521
 212  000b 1e01          	ldw	x,(OFST-1,sp)
 213  000d e604          	ld	a,(4,x)
 214  000f ea03          	or	a,(3,x)
 215  0011 2712          	jreq	L521
 216                     ; 103         curr_tcb->entry_point(curr_tcb->entry_param);
 218  0013 1e01          	ldw	x,(OFST-1,sp)
 219  0015 9093          	ldw	y,x
 220  0017 ee07          	ldw	x,(7,x)
 221  0019 89            	pushw	x
 222  001a 93            	ldw	x,y
 223  001b ee05          	ldw	x,(5,x)
 224  001d 89            	pushw	x
 225  001e 1e05          	ldw	x,(OFST+3,sp)
 226  0020 ee03          	ldw	x,(3,x)
 227  0022 fd            	call	(x)
 229  0023 5b04          	addw	sp,#4
 230  0025               L521:
 231                     ; 108 }
 234  0025 85            	popw	x
 235  0026 81            	ret
 296                     ; 166 void archThreadContextInit (ATOM_TCB *tcb_ptr, void *stack_top, void (*entry_point)(uint32_t), uint32_t entry_param)
 296                     ; 167 {
 297                     	switch	.text
 298  0027               _archThreadContextInit:
 300  0027 89            	pushw	x
 301  0028 89            	pushw	x
 302       00000002      OFST:	set	2
 305                     ; 171     stack_ptr = (uint8_t *)stack_top;
 307  0029 1e07          	ldw	x,(OFST+5,sp)
 308  002b 1f01          	ldw	(OFST-1,sp),x
 309                     ; 188     *stack_ptr-- = (uint8_t)((uint16_t)thread_shell & 0xFF);
 311  002d a600          	ld	a,#low(L3_thread_shell)
 312  002f a4ff          	and	a,#255
 313  0031 1e01          	ldw	x,(OFST-1,sp)
 314  0033 1d0001        	subw	x,#1
 315  0036 1f01          	ldw	(OFST-1,sp),x
 316  0038 1c0001        	addw	x,#1
 317  003b f7            	ld	(x),a
 318                     ; 189     *stack_ptr-- = (uint8_t)(((uint16_t)thread_shell >> 8) & 0xFF);
 320  003c ae0000        	ldw	x,#L3_thread_shell
 321  003f 4f            	clr	a
 322  0040 01            	rrwa	x,a
 323  0041 01            	rrwa	x,a
 324  0042 a4ff          	and	a,#255
 325  0044 5f            	clrw	x
 326  0045 1e01          	ldw	x,(OFST-1,sp)
 327  0047 1d0001        	subw	x,#1
 328  004a 1f01          	ldw	(OFST-1,sp),x
 329  004c 1c0001        	addw	x,#1
 330  004f f7            	ld	(x),a
 331                     ; 225     tcb_ptr->sp_save_ptr = stack_ptr;
 333  0050 1e03          	ldw	x,(OFST+1,sp)
 334  0052 1601          	ldw	y,(OFST-1,sp)
 335  0054 ff            	ldw	(x),y
 336                     ; 227 }
 339  0055 5b04          	addw	sp,#4
 340  0057 81            	ret
 371                     ; 237 void archInitSystemTickTimer ( void )
 371                     ; 238 {
 372                     	switch	.text
 373  0058               _archInitSystemTickTimer:
 377                     ; 240     TIM4_DeInit();
 379  0058 cd0000        	call	_TIM4_DeInit
 381                     ; 242 		CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 383  005b ae0001        	ldw	x,#1
 384  005e a602          	ld	a,#2
 385  0060 95            	ld	xh,a
 386  0061 cd0000        	call	_CLK_PeripheralClockConfig
 388                     ; 255     TIM4_TimeBaseInit(TIM4_Prescaler_128, 1249);
 390  0064 ae00e1        	ldw	x,#225
 391  0067 a607          	ld	a,#7
 392  0069 95            	ld	xh,a
 393  006a cd0000        	call	_TIM4_TimeBaseInit
 395                     ; 258     TIM4_ClearFlag(TIM4_FLAG_Update);
 397  006d a601          	ld	a,#1
 398  006f cd0000        	call	_TIM4_ClearFlag
 400                     ; 259 		TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 402  0072 ae0001        	ldw	x,#1
 403  0075 a601          	ld	a,#1
 404  0077 95            	ld	xh,a
 405  0078 cd0000        	call	_TIM4_ITConfig
 407                     ; 261     enableInterrupts();
 410  007b 9a            rim
 412                     ; 263     TIM4_Cmd(ENABLE);
 415  007c a601          	ld	a,#1
 416  007e cd0000        	call	_TIM4_Cmd
 418                     ; 265 }
 421  0081 81            	ret
 448                     ; 308 INTERRUPT void TIM4_SystemTickISR (void)
 448                     ; 309 #if defined(__RCSTM8__)
 448                     ; 310 interrupt 25
 448                     ; 311 #endif
 448                     ; 312 {
 450                     	switch	.text
 451  0082               f_TIM4_SystemTickISR:
 453  0082 3b0002        	push	c_x+2
 454  0085 be00          	ldw	x,c_x
 455  0087 89            	pushw	x
 456  0088 3b0002        	push	c_y+2
 457  008b be00          	ldw	x,c_y
 458  008d 89            	pushw	x
 461                     ; 314     atomIntEnter();
 463  008e cd0000        	call	_atomIntEnter
 465                     ; 317     atomTimerTick();
 467  0091 cd0000        	call	_atomTimerTick
 469                     ; 320     TIM4_ClearITPendingBit(TIM4_IT_Update);
 471  0094 a601          	ld	a,#1
 472  0096 cd0000        	call	_TIM4_ClearITPendingBit
 474                     ; 323     atomIntExit(TRUE);
 476  0099 a601          	ld	a,#1
 477  009b cd0000        	call	_atomIntExit
 479                     ; 324 }
 482  009e 85            	popw	x
 483  009f bf00          	ldw	c_y,x
 484  00a1 320002        	pop	c_y+2
 485  00a4 85            	popw	x
 486  00a5 bf00          	ldw	c_x,x
 487  00a7 320002        	pop	c_x+2
 488  00aa 80            	iret
 500                     	xdef	f_TIM4_SystemTickISR
 501                     	xdef	_archInitSystemTickTimer
 502                     	xref	_atomTimerTick
 503                     	xdef	_archThreadContextInit
 504                     	xref	_atomCurrentContext
 505                     	xref	_atomIntExit
 506                     	xref	_atomIntEnter
 507                     	xref	_TIM4_ClearITPendingBit
 508                     	xref	_TIM4_ClearFlag
 509                     	xref	_TIM4_ITConfig
 510                     	xref	_TIM4_Cmd
 511                     	xref	_TIM4_TimeBaseInit
 512                     	xref	_TIM4_DeInit
 513                     	xref	_CLK_PeripheralClockConfig
 514                     	xref.b	c_x
 515                     	xref.b	c_y
 534                     	end
