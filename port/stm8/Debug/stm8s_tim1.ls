   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 42 void TIM1_DeInit(void)
  32                     ; 43 {
  34                     .text:	section	.text,new
  35  0000               _TIM1_DeInit:
  39                     ; 44     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  41  0000 725f5250      	clr	21072
  42                     ; 45     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  44  0004 725f5251      	clr	21073
  45                     ; 46     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  47  0008 725f5252      	clr	21074
  48                     ; 47     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  50  000c 725f5253      	clr	21075
  51                     ; 48     TIM1->IER  = TIM1_IER_RESET_VALUE;
  53  0010 725f5254      	clr	21076
  54                     ; 49     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  56  0014 725f5256      	clr	21078
  57                     ; 51     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  59  0018 725f525c      	clr	21084
  60                     ; 52     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  62  001c 725f525d      	clr	21085
  63                     ; 54     TIM1->CCMR1 = 0x01;
  65  0020 35015258      	mov	21080,#1
  66                     ; 55     TIM1->CCMR2 = 0x01;
  68  0024 35015259      	mov	21081,#1
  69                     ; 56     TIM1->CCMR3 = 0x01;
  71  0028 3501525a      	mov	21082,#1
  72                     ; 57     TIM1->CCMR4 = 0x01;
  74  002c 3501525b      	mov	21083,#1
  75                     ; 59     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  77  0030 725f525c      	clr	21084
  78                     ; 60     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  80  0034 725f525d      	clr	21085
  81                     ; 61     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  83  0038 725f5258      	clr	21080
  84                     ; 62     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  86  003c 725f5259      	clr	21081
  87                     ; 63     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  89  0040 725f525a      	clr	21082
  90                     ; 64     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  92  0044 725f525b      	clr	21083
  93                     ; 65     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  95  0048 725f525e      	clr	21086
  96                     ; 66     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  98  004c 725f525f      	clr	21087
  99                     ; 67     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 101  0050 725f5260      	clr	21088
 102                     ; 68     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 104  0054 725f5261      	clr	21089
 105                     ; 69     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 107  0058 35ff5262      	mov	21090,#255
 108                     ; 70     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 110  005c 35ff5263      	mov	21091,#255
 111                     ; 71     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 113  0060 725f5265      	clr	21093
 114                     ; 72     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 116  0064 725f5266      	clr	21094
 117                     ; 73     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 119  0068 725f5267      	clr	21095
 120                     ; 74     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 122  006c 725f5268      	clr	21096
 123                     ; 75     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 125  0070 725f5269      	clr	21097
 126                     ; 76     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 128  0074 725f526a      	clr	21098
 129                     ; 77     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 131  0078 725f526b      	clr	21099
 132                     ; 78     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 134  007c 725f526c      	clr	21100
 135                     ; 79     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 137  0080 725f526f      	clr	21103
 138                     ; 80     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 140  0084 35015257      	mov	21079,#1
 141                     ; 81     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 143  0088 725f526e      	clr	21102
 144                     ; 82     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 146  008c 725f526d      	clr	21101
 147                     ; 83     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 149  0090 725f5264      	clr	21092
 150                     ; 84     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 152  0094 725f5255      	clr	21077
 153                     ; 85 }
 156  0098 81            	ret
 259                     ; 95 void TIM1_TimeBaseInit(u16 TIM1_Prescaler,
 259                     ; 96                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 259                     ; 97                        u16 TIM1_Period,
 259                     ; 98                        u8 TIM1_RepetitionCounter)
 259                     ; 99 {
 260                     .text:	section	.text,new
 261  0000               _TIM1_TimeBaseInit:
 263  0000 89            	pushw	x
 264       00000000      OFST:	set	0
 267                     ; 102     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 269                     ; 105     TIM1->ARRH = (u8)(TIM1_Period >> 8);
 271  0001 7b06          	ld	a,(OFST+6,sp)
 272  0003 c75262        	ld	21090,a
 273                     ; 106     TIM1->ARRL = (u8)(TIM1_Period);
 275  0006 7b07          	ld	a,(OFST+7,sp)
 276  0008 c75263        	ld	21091,a
 277                     ; 109     TIM1->PSCRH = (u8)(TIM1_Prescaler >> 8);
 279  000b 9e            	ld	a,xh
 280  000c c75260        	ld	21088,a
 281                     ; 110     TIM1->PSCRL = (u8)(TIM1_Prescaler);
 283  000f 9f            	ld	a,xl
 284  0010 c75261        	ld	21089,a
 285                     ; 113     TIM1->CR1 = (u8)(((TIM1->CR1) & (u8)(~(TIM1_CR1_CMS | TIM1_CR1_DIR))) | (u8)(TIM1_CounterMode));
 287  0013 c65250        	ld	a,21072
 288  0016 a48f          	and	a,#143
 289  0018 1a05          	or	a,(OFST+5,sp)
 290  001a c75250        	ld	21072,a
 291                     ; 116     TIM1->RCR = TIM1_RepetitionCounter;
 293  001d 7b08          	ld	a,(OFST+8,sp)
 294  001f c75264        	ld	21092,a
 295                     ; 118 }
 298  0022 85            	popw	x
 299  0023 81            	ret
 354                     ; 127 void TIM1_Cmd(FunctionalState NewState)
 354                     ; 128 {
 355                     .text:	section	.text,new
 356  0000               _TIM1_Cmd:
 360                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 362                     ; 133     if (NewState != DISABLE)
 364  0000 4d            	tnz	a
 365  0001 2706          	jreq	L111
 366                     ; 135         TIM1->CR1 |= TIM1_CR1_CEN;
 368  0003 72105250      	bset	21072,#0
 370  0007 2004          	jra	L311
 371  0009               L111:
 372                     ; 139         TIM1->CR1 &= (u8)(~TIM1_CR1_CEN);
 374  0009 72115250      	bres	21072,#0
 375  000d               L311:
 376                     ; 141 }
 379  000d 81            	ret
 486                     ; 161 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
 486                     ; 162 {
 487                     .text:	section	.text,new
 488  0000               _TIM1_ITConfig:
 490  0000 89            	pushw	x
 491       00000000      OFST:	set	0
 494                     ; 164     assert_param(IS_TIM1_IT_OK(TIM1_IT));
 496                     ; 165     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 498                     ; 167     if (NewState != DISABLE)
 500  0001 9f            	ld	a,xl
 501  0002 4d            	tnz	a
 502  0003 2709          	jreq	L361
 503                     ; 170         TIM1->IER |= (u8)TIM1_IT;
 505  0005 9e            	ld	a,xh
 506  0006 ca5254        	or	a,21076
 507  0009 c75254        	ld	21076,a
 509  000c 2009          	jra	L561
 510  000e               L361:
 511                     ; 175         TIM1->IER &= (u8)(~(u8)TIM1_IT);
 513  000e 7b01          	ld	a,(OFST+1,sp)
 514  0010 43            	cpl	a
 515  0011 c45254        	and	a,21076
 516  0014 c75254        	ld	21076,a
 517  0017               L561:
 518                     ; 177 }
 521  0017 85            	popw	x
 522  0018 81            	ret
 535                     	xdef	_TIM1_ITConfig
 536                     	xdef	_TIM1_Cmd
 537                     	xdef	_TIM1_TimeBaseInit
 538                     	xdef	_TIM1_DeInit
 557                     	end
