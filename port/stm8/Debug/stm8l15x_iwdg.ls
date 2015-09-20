   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  67                     ; 122 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  67                     ; 123 {
  69                     .text:	section	.text,new
  70  0000               _IWDG_WriteAccessCmd:
  74                     ; 125   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  76                     ; 126   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  78  0000 c750e0        	ld	20704,a
  79                     ; 127 }
  82  0003 81            	ret
 172                     ; 142 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 172                     ; 143 {
 173                     .text:	section	.text,new
 174  0000               _IWDG_SetPrescaler:
 178                     ; 145   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 180                     ; 146   IWDG->PR = IWDG_Prescaler;
 182  0000 c750e1        	ld	20705,a
 183                     ; 147 }
 186  0003 81            	ret
 218                     ; 156 void IWDG_SetReload(uint8_t IWDG_Reload)
 218                     ; 157 {
 219                     .text:	section	.text,new
 220  0000               _IWDG_SetReload:
 224                     ; 158   IWDG->RLR = IWDG_Reload;
 226  0000 c750e2        	ld	20706,a
 227                     ; 159 }
 230  0003 81            	ret
 253                     ; 167 void IWDG_ReloadCounter(void)
 253                     ; 168 {
 254                     .text:	section	.text,new
 255  0000               _IWDG_ReloadCounter:
 259                     ; 169   IWDG->KR = IWDG_KEY_REFRESH;
 261  0000 35aa50e0      	mov	20704,#170
 262                     ; 170 }
 265  0004 81            	ret
 288                     ; 193 void IWDG_Enable(void)
 288                     ; 194 {
 289                     .text:	section	.text,new
 290  0000               _IWDG_Enable:
 294                     ; 195   IWDG->KR = IWDG_KEY_ENABLE;
 296  0000 35cc50e0      	mov	20704,#204
 297                     ; 196 }
 300  0004 81            	ret
 313                     	xdef	_IWDG_Enable
 314                     	xdef	_IWDG_ReloadCounter
 315                     	xdef	_IWDG_SetReload
 316                     	xdef	_IWDG_SetPrescaler
 317                     	xdef	_IWDG_WriteAccessCmd
 336                     	end
