   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 113                     ; 93 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 113                     ; 94 {
 115                     .text:	section	.text,new
 116  0000               _RST_GetFlagStatus:
 120                     ; 96   assert_param(IS_RST_FLAG(RST_Flag));
 122                     ; 100   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 124  0000 c450b1        	and	a,20657
 127  0003 81            	ret
 162                     ; 115 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 162                     ; 116 {
 163                     .text:	section	.text,new
 164  0000               _RST_ClearFlag:
 168                     ; 118   assert_param(IS_RST_FLAG(RST_Flag));
 170                     ; 120   RST->SR = (uint8_t)RST_Flag;
 172  0000 c750b1        	ld	20657,a
 173                     ; 121 }
 176  0003 81            	ret
 199                     ; 144 void RST_GPOutputEnable(void)
 199                     ; 145 {
 200                     .text:	section	.text,new
 201  0000               _RST_GPOutputEnable:
 205                     ; 147   RST->CR = RST_CR_MASK;
 207  0000 35d050b0      	mov	20656,#208
 208                     ; 148 }
 211  0004 81            	ret
 224                     	xdef	_RST_GPOutputEnable
 225                     	xdef	_RST_ClearFlag
 226                     	xdef	_RST_GetFlagStatus
 245                     	end
