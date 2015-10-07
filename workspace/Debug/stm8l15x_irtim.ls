   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 91 void IRTIM_DeInit(void)
  32                     ; 92 {
  34                     	switch	.text
  35  0000               _IRTIM_DeInit:
  39                     ; 93     IRTIM->CR = IRTIM_CR_RESET_VALUE;
  41  0000 725f52ff      	clr	21247
  42                     ; 94 }
  45  0004 81            	ret
 100                     ; 102 void IRTIM_Cmd(FunctionalState NewState)
 100                     ; 103 {
 101                     	switch	.text
 102  0005               _IRTIM_Cmd:
 106                     ; 105     assert_param(IS_FUNCTIONAL_STATE(NewState));
 108                     ; 108     if (NewState ==   DISABLE) {
 110  0005 4d            	tnz	a
 111  0006 2606          	jrne	L74
 112                     ; 109         IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 114  0008 721152ff      	bres	21247,#0
 116  000c 2004          	jra	L15
 117  000e               L74:
 118                     ; 111         IRTIM->CR |= IRTIM_CR_EN ;
 120  000e 721052ff      	bset	21247,#0
 121  0012               L15:
 122                     ; 113 }
 125  0012 81            	ret
 161                     ; 121 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 161                     ; 122 {
 162                     	switch	.text
 163  0013               _IRTIM_HighSinkODCmd:
 167                     ; 124     assert_param(IS_FUNCTIONAL_STATE(NewState));
 169                     ; 127     if (NewState == DISABLE) {
 171  0013 4d            	tnz	a
 172  0014 2606          	jrne	L17
 173                     ; 128         IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 175  0016 721352ff      	bres	21247,#1
 177  001a 2004          	jra	L37
 178  001c               L17:
 179                     ; 130         IRTIM->CR |= IRTIM_CR_HSEN ;
 181  001c 721252ff      	bset	21247,#1
 182  0020               L37:
 183                     ; 132 }
 186  0020 81            	ret
 210                     ; 156 FunctionalState IRTIM_GetStatus(void)
 210                     ; 157 {
 211                     	switch	.text
 212  0021               _IRTIM_GetStatus:
 216                     ; 158     return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 218  0021 c652ff        	ld	a,21247
 219  0024 a401          	and	a,#1
 222  0026 81            	ret
 247                     ; 166 FunctionalState IRTIM_GetHighSinkODStatus(void)
 247                     ; 167 {
 248                     	switch	.text
 249  0027               _IRTIM_GetHighSinkODStatus:
 253                     ; 168     return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 255  0027 c652ff        	ld	a,21247
 256  002a a402          	and	a,#2
 259  002c 81            	ret
 272                     	xdef	_IRTIM_GetHighSinkODStatus
 273                     	xdef	_IRTIM_GetStatus
 274                     	xdef	_IRTIM_HighSinkODCmd
 275                     	xdef	_IRTIM_Cmd
 276                     	xdef	_IRTIM_DeInit
 295                     	end
