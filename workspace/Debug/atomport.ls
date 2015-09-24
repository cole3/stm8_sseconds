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
 370                     ; 237 void archInitSystemTickTimer ( void )
 370                     ; 238 {
 371                     	switch	.text
 372  0058               _archInitSystemTickTimer:
 376                     ; 240     TIM4_DeInit();
 378  0058 cd0000        	call	_TIM4_DeInit
 380                     ; 242 		CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 382  005b ae0001        	ldw	x,#1
 383  005e a602          	ld	a,#2
 384  0060 95            	ld	xh,a
 385  0061 cd0000        	call	_CLK_PeripheralClockConfig
 387                     ; 254 		TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
 389  0064 ae007c        	ldw	x,#124
 390  0067 a607          	ld	a,#7
 391  0069 95            	ld	xh,a
 392  006a cd0000        	call	_TIM4_TimeBaseInit
 394                     ; 256 		TIM4_ClearFlag(TIM4_FLAG_Update);
 396  006d a601          	ld	a,#1
 397  006f cd0000        	call	_TIM4_ClearFlag
 399                     ; 258 		TIM4_ITConfig(TIM4_IT_Update, ENABLE);
 401  0072 ae0001        	ldw	x,#1
 402  0075 a601          	ld	a,#1
 403  0077 95            	ld	xh,a
 404  0078 cd0000        	call	_TIM4_ITConfig
 406                     ; 260 		TIM4_Cmd(ENABLE);
 408  007b a601          	ld	a,#1
 409  007d cd0000        	call	_TIM4_Cmd
 411                     ; 261 }
 414  0080 81            	ret
 441                     ; 304 INTERRUPT void TIM4_SystemTickISR (void)
 441                     ; 305 #if defined(__RCSTM8__)
 441                     ; 306 interrupt 25
 441                     ; 307 #endif
 441                     ; 308 {
 443                     	switch	.text
 444  0081               f_TIM4_SystemTickISR:
 446  0081 3b0002        	push	c_x+2
 447  0084 be00          	ldw	x,c_x
 448  0086 89            	pushw	x
 449  0087 3b0002        	push	c_y+2
 450  008a be00          	ldw	x,c_y
 451  008c 89            	pushw	x
 454                     ; 310     atomIntEnter();
 456  008d cd0000        	call	_atomIntEnter
 458                     ; 313     atomTimerTick();
 460  0090 cd0000        	call	_atomTimerTick
 462                     ; 316     TIM4_ClearITPendingBit(TIM4_IT_Update);
 464  0093 a601          	ld	a,#1
 465  0095 cd0000        	call	_TIM4_ClearITPendingBit
 467                     ; 319     atomIntExit(TRUE);
 469  0098 a601          	ld	a,#1
 470  009a cd0000        	call	_atomIntExit
 472                     ; 320 }
 475  009d 85            	popw	x
 476  009e bf00          	ldw	c_y,x
 477  00a0 320002        	pop	c_y+2
 478  00a3 85            	popw	x
 479  00a4 bf00          	ldw	c_x,x
 480  00a6 320002        	pop	c_x+2
 481  00a9 80            	iret
 493                     	xdef	f_TIM4_SystemTickISR
 494                     	xdef	_archInitSystemTickTimer
 495                     	xref	_atomTimerTick
 496                     	xdef	_archThreadContextInit
 497                     	xref	_atomCurrentContext
 498                     	xref	_atomIntExit
 499                     	xref	_atomIntEnter
 500                     	xref	_TIM4_ClearITPendingBit
 501                     	xref	_TIM4_ClearFlag
 502                     	xref	_TIM4_ITConfig
 503                     	xref	_TIM4_Cmd
 504                     	xref	_TIM4_TimeBaseInit
 505                     	xref	_TIM4_DeInit
 506                     	xref	_CLK_PeripheralClockConfig
 507                     	xref.b	c_x
 508                     	xref.b	c_y
 527                     	end
