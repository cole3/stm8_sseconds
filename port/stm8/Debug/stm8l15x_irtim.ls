   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 91 void IRTIM_DeInit(void)
  32                     ; 92 {
  34                     .text:	section	.text,new
  35  0000               _IRTIM_DeInit:
  39                     ; 93   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  41  0000 725f52ff      	clr	21247
  42                     ; 94 }
  45  0004 81            	ret
 100                     ; 102 void IRTIM_Cmd(FunctionalState NewState)
 100                     ; 103 {
 101                     .text:	section	.text,new
 102  0000               _IRTIM_Cmd:
 106                     ; 105   assert_param(IS_FUNCTIONAL_STATE(NewState));
 108                     ; 108   if (NewState ==   DISABLE)
 110  0000 4d            	tnz	a
 111  0001 2606          	jrne	L74
 112                     ; 110     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 114  0003 721152ff      	bres	21247,#0
 116  0007 2004          	jra	L15
 117  0009               L74:
 118                     ; 114     IRTIM->CR |= IRTIM_CR_EN ;
 120  0009 721052ff      	bset	21247,#0
 121  000d               L15:
 122                     ; 116 }
 125  000d 81            	ret
 161                     ; 124 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 161                     ; 125 {
 162                     .text:	section	.text,new
 163  0000               _IRTIM_HighSinkODCmd:
 167                     ; 127   assert_param(IS_FUNCTIONAL_STATE(NewState));
 169                     ; 130   if (NewState == DISABLE)
 171  0000 4d            	tnz	a
 172  0001 2606          	jrne	L17
 173                     ; 132     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 175  0003 721352ff      	bres	21247,#1
 177  0007 2004          	jra	L37
 178  0009               L17:
 179                     ; 136     IRTIM->CR |= IRTIM_CR_HSEN ;
 181  0009 721252ff      	bset	21247,#1
 182  000d               L37:
 183                     ; 138 }
 186  000d 81            	ret
 210                     ; 162 FunctionalState IRTIM_GetStatus(void)
 210                     ; 163 {
 211                     .text:	section	.text,new
 212  0000               _IRTIM_GetStatus:
 216                     ; 164   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 218  0000 c652ff        	ld	a,21247
 219  0003 a401          	and	a,#1
 222  0005 81            	ret
 247                     ; 172 FunctionalState IRTIM_GetHighSinkODStatus(void)
 247                     ; 173 {
 248                     .text:	section	.text,new
 249  0000               _IRTIM_GetHighSinkODStatus:
 253                     ; 174   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 255  0000 c652ff        	ld	a,21247
 256  0003 a402          	and	a,#2
 259  0005 81            	ret
 272                     	xdef	_IRTIM_GetHighSinkODStatus
 273                     	xdef	_IRTIM_GetStatus
 274                     	xdef	_IRTIM_HighSinkODCmd
 275                     	xdef	_IRTIM_Cmd
 276                     	xdef	_IRTIM_DeInit
 295                     	end
