   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 205                     ; 81 static NO_REG_SAVE void thread_shell (void)
 205                     ; 82 {
 207                     .text:	section	.text,new
 208  0000               L3_thread_shell:
 210  0000 89            	pushw	x
 211       00000002      OFST:	set	2
 214                     ; 86     curr_tcb = atomCurrentContext();
 216  0001 cd0000        	call	_atomCurrentContext
 218  0004 1f01          	ldw	(OFST-1,sp),x
 219                     ; 93     _asm("rim");
 222  0006 9a            rim
 224                     ; 101     if (curr_tcb && curr_tcb->entry_point)
 226  0007 1e01          	ldw	x,(OFST-1,sp)
 227  0009 271a          	jreq	L331
 229  000b 1e01          	ldw	x,(OFST-1,sp)
 230  000d e604          	ld	a,(4,x)
 231  000f ea03          	or	a,(3,x)
 232  0011 2712          	jreq	L331
 233                     ; 103         curr_tcb->entry_point(curr_tcb->entry_param);
 235  0013 1e01          	ldw	x,(OFST-1,sp)
 236  0015 9093          	ldw	y,x
 237  0017 ee07          	ldw	x,(7,x)
 238  0019 89            	pushw	x
 239  001a 93            	ldw	x,y
 240  001b ee05          	ldw	x,(5,x)
 241  001d 89            	pushw	x
 242  001e 1e05          	ldw	x,(OFST+3,sp)
 243  0020 ee03          	ldw	x,(3,x)
 244  0022 fd            	call	(x)
 246  0023 5b04          	addw	sp,#4
 247  0025               L331:
 248                     ; 108 }
 251  0025 85            	popw	x
 252  0026 81            	ret
 313                     ; 166 void archThreadContextInit (ATOM_TCB *tcb_ptr, void *stack_top, void (*entry_point)(uint32_t), uint32_t entry_param)
 313                     ; 167 {
 314                     .text:	section	.text,new
 315  0000               _archThreadContextInit:
 317  0000 89            	pushw	x
 318  0001 89            	pushw	x
 319       00000002      OFST:	set	2
 322                     ; 171     stack_ptr = (uint8_t *)stack_top;
 324  0002 1e07          	ldw	x,(OFST+5,sp)
 325  0004 1f01          	ldw	(OFST-1,sp),x
 326                     ; 188     *stack_ptr-- = (uint8_t)((uint16_t)thread_shell & 0xFF);
 328  0006 a600          	ld	a,#low(L3_thread_shell)
 329  0008 a4ff          	and	a,#255
 330  000a 1e01          	ldw	x,(OFST-1,sp)
 331  000c 1d0001        	subw	x,#1
 332  000f 1f01          	ldw	(OFST-1,sp),x
 333  0011 1c0001        	addw	x,#1
 334  0014 f7            	ld	(x),a
 335                     ; 189     *stack_ptr-- = (uint8_t)(((uint16_t)thread_shell >> 8) & 0xFF);
 337  0015 ae0000        	ldw	x,#L3_thread_shell
 338  0018 4f            	clr	a
 339  0019 01            	rrwa	x,a
 340  001a 01            	rrwa	x,a
 341  001b a4ff          	and	a,#255
 342  001d 5f            	clrw	x
 343  001e 1e01          	ldw	x,(OFST-1,sp)
 344  0020 1d0001        	subw	x,#1
 345  0023 1f01          	ldw	(OFST-1,sp),x
 346  0025 1c0001        	addw	x,#1
 347  0028 f7            	ld	(x),a
 348                     ; 225     tcb_ptr->sp_save_ptr = stack_ptr;
 350  0029 1e03          	ldw	x,(OFST+1,sp)
 351  002b 1601          	ldw	y,(OFST-1,sp)
 352  002d ff            	ldw	(x),y
 353                     ; 227 }
 356  002e 5b04          	addw	sp,#4
 357  0030 81            	ret
 385                     ; 237 void archInitSystemTickTimer ( void )
 385                     ; 238 {
 386                     .text:	section	.text,new
 387  0000               _archInitSystemTickTimer:
 391                     ; 240     TIM1_DeInit();
 393  0000 cd0000        	call	_TIM1_DeInit
 395                     ; 243     TIM1_TimeBaseInit(10000, TIM1_CounterMode_Up, 1, 0);
 397  0003 4b00          	push	#0
 398  0005 ae0001        	ldw	x,#1
 399  0008 89            	pushw	x
 400  0009 4b00          	push	#0
 401  000b ae2710        	ldw	x,#10000
 402  000e cd0000        	call	_TIM1_TimeBaseInit
 404  0011 5b04          	addw	sp,#4
 405                     ; 246     TIM1_ITConfig(TIM1_IT_Update, ENABLE);
 407  0013 ae0001        	ldw	x,#1
 408  0016 a601          	ld	a,#1
 409  0018 95            	ld	xh,a
 410  0019 cd0000        	call	_TIM1_ITConfig
 412                     ; 249     TIM1_Cmd(ENABLE);
 414  001c a601          	ld	a,#1
 415  001e cd0000        	call	_TIM1_Cmd
 417                     ; 251 }
 420  0021 81            	ret
 446                     ; 294 INTERRUPT void TIM1_SystemTickISR (void)
 446                     ; 295 #if defined(__RCSTM8__)
 446                     ; 296 interrupt 11
 446                     ; 297 #endif
 446                     ; 298 {
 448                     .text:	section	.text,new
 449  0000               f_TIM1_SystemTickISR:
 451  0000 3b0002        	push	c_x+2
 452  0003 be00          	ldw	x,c_x
 453  0005 89            	pushw	x
 454  0006 3b0002        	push	c_y+2
 455  0009 be00          	ldw	x,c_y
 456  000b 89            	pushw	x
 459                     ; 300     atomIntEnter();
 461  000c cd0000        	call	_atomIntEnter
 463                     ; 303     atomTimerTick();
 465  000f cd0000        	call	_atomTimerTick
 467                     ; 306     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT_Update);
 469  0012 35fe52b6      	mov	21174,#254
 470                     ; 309     atomIntExit(TRUE);
 472  0016 a601          	ld	a,#1
 473  0018 cd0000        	call	_atomIntExit
 475                     ; 310 }
 478  001b 85            	popw	x
 479  001c bf00          	ldw	c_y,x
 480  001e 320002        	pop	c_y+2
 481  0021 85            	popw	x
 482  0022 bf00          	ldw	c_x,x
 483  0024 320002        	pop	c_x+2
 484  0027 80            	iret
 496                     	xdef	f_TIM1_SystemTickISR
 497                     	xdef	_archInitSystemTickTimer
 498                     	xref	_atomTimerTick
 499                     	xdef	_archThreadContextInit
 500                     	xref	_atomCurrentContext
 501                     	xref	_atomIntExit
 502                     	xref	_atomIntEnter
 503                     	xref	_TIM1_ITConfig
 504                     	xref	_TIM1_Cmd
 505                     	xref	_TIM1_TimeBaseInit
 506                     	xref	_TIM1_DeInit
 507                     	xref.b	c_x
 508                     	xref.b	c_y
 527                     	end
