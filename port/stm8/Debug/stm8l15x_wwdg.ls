   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  48                     ; 113 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  48                     ; 114 {
  50                     .text:	section	.text,new
  51  0000               _WWDG_Init:
  53  0000 89            	pushw	x
  54       00000000      OFST:	set	0
  57                     ; 116   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  59                     ; 118   WWDG->WR = WWDG_WR_RESET_VALUE;
  61  0001 357f50d4      	mov	20692,#127
  62                     ; 119   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  64  0005 9e            	ld	a,xh
  65  0006 aa80          	or	a,#128
  66  0008 c750d3        	ld	20691,a
  67                     ; 120   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  69  000b 7b02          	ld	a,(OFST+2,sp)
  70  000d a47f          	and	a,#127
  71  000f c750d4        	ld	20692,a
  72                     ; 121 }
  75  0012 85            	popw	x
  76  0013 81            	ret
 118                     ; 129 void WWDG_SetWindowValue(uint8_t WindowValue)
 118                     ; 130 {
 119                     .text:	section	.text,new
 120  0000               _WWDG_SetWindowValue:
 122  0000 88            	push	a
 123       00000001      OFST:	set	1
 126                     ; 131   __IO uint8_t tmpreg = 0;
 128  0001 0f01          	clr	(OFST+0,sp)
 129                     ; 134   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 131                     ; 137   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 133  0003 a47f          	and	a,#127
 134  0005 1a01          	or	a,(OFST+0,sp)
 135  0007 6b01          	ld	(OFST+0,sp),a
 136                     ; 140   WWDG->WR = tmpreg;
 138  0009 7b01          	ld	a,(OFST+0,sp)
 139  000b c750d4        	ld	20692,a
 140                     ; 141 }
 143  000e 84            	pop	a
 144  000f 81            	ret
 176                     ; 150 void WWDG_SetCounter(uint8_t Counter)
 176                     ; 151 {
 177                     .text:	section	.text,new
 178  0000               _WWDG_SetCounter:
 182                     ; 153   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 184                     ; 157   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 186  0000 a47f          	and	a,#127
 187  0002 c750d3        	ld	20691,a
 188                     ; 158 }
 191  0005 81            	ret
 223                     ; 181 void WWDG_Enable(uint8_t Counter)
 223                     ; 182 {
 224                     .text:	section	.text,new
 225  0000               _WWDG_Enable:
 229                     ; 184   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 231                     ; 185   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 233  0000 aa80          	or	a,#128
 234  0002 c750d3        	ld	20691,a
 235                     ; 186 }
 238  0005 81            	ret
 261                     ; 210 uint8_t WWDG_GetCounter(void)
 261                     ; 211 {
 262                     .text:	section	.text,new
 263  0000               _WWDG_GetCounter:
 267                     ; 212   return(WWDG->CR);
 269  0000 c650d3        	ld	a,20691
 272  0003 81            	ret
 295                     ; 220 void WWDG_SWReset(void)
 295                     ; 221 {
 296                     .text:	section	.text,new
 297  0000               _WWDG_SWReset:
 301                     ; 222   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 303  0000 358050d3      	mov	20691,#128
 304                     ; 223 }
 307  0004 81            	ret
 320                     	xdef	_WWDG_SWReset
 321                     	xdef	_WWDG_GetCounter
 322                     	xdef	_WWDG_Enable
 323                     	xdef	_WWDG_SetCounter
 324                     	xdef	_WWDG_SetWindowValue
 325                     	xdef	_WWDG_Init
 344                     	end
