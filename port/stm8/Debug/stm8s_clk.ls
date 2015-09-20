   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     .const:	section	.text
   5  0000               _HSIDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004               _CLKPrescTable:
  11  0004 01            	dc.b	1
  12  0005 02            	dc.b	2
  13  0006 04            	dc.b	4
  14  0007 08            	dc.b	8
  15  0008 0a            	dc.b	10
  16  0009 10            	dc.b	16
  17  000a 14            	dc.b	20
  18  000b 28            	dc.b	40
 108                     ; 59 u32 CLK_GetClockFreq(void)
 108                     ; 60 {
 110                     .text:	section	.text,new
 111  0000               _CLK_GetClockFreq:
 113  0000 5209          	subw	sp,#9
 114       00000009      OFST:	set	9
 117                     ; 62     u32 clockfrequency = 0;
 119  0002 96            	ldw	x,sp
 120  0003 1c0005        	addw	x,#OFST-4
 121  0006 cd0000        	call	c_ltor
 123                     ; 63     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
 125  0009 7b09          	ld	a,(OFST+0,sp)
 126  000b 97            	ld	xl,a
 127                     ; 64     u8 tmp = 0, presc = 0;
 129  000c 7b09          	ld	a,(OFST+0,sp)
 130  000e 97            	ld	xl,a
 133  000f 7b09          	ld	a,(OFST+0,sp)
 134  0011 97            	ld	xl,a
 135                     ; 67     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
 137  0012 c650c3        	ld	a,20675
 138  0015 6b09          	ld	(OFST+0,sp),a
 139                     ; 69     if (clocksource == CLK_SOURCE_HSI)
 141  0017 7b09          	ld	a,(OFST+0,sp)
 142  0019 a1e1          	cp	a,#225
 143  001b 2642          	jrne	L74
 144                     ; 71         tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 146  001d c650c6        	ld	a,20678
 147  0020 a418          	and	a,#24
 148  0022 6b09          	ld	(OFST+0,sp),a
 149                     ; 72         tmp = (u8)(tmp >> 3);
 151  0024 7b09          	ld	a,(OFST+0,sp)
 152  0026 44            	srl	a
 153  0027 44            	srl	a
 154  0028 44            	srl	a
 155  0029 6b09          	ld	(OFST+0,sp),a
 156                     ; 73         presc = HSIDivFactor[tmp];
 158  002b 7b09          	ld	a,(OFST+0,sp)
 159  002d 5f            	clrw	x
 160  002e 97            	ld	xl,a
 161  002f d60000        	ld	a,(_HSIDivFactor,x)
 162  0032 6b09          	ld	(OFST+0,sp),a
 163                     ; 74         clockfrequency = HSI_VALUE / presc;
 165  0034 7b09          	ld	a,(OFST+0,sp)
 166  0036 b703          	ld	c_lreg+3,a
 167  0038 3f02          	clr	c_lreg+2
 168  003a 3f01          	clr	c_lreg+1
 169  003c 3f00          	clr	c_lreg
 170  003e 96            	ldw	x,sp
 171  003f 1c0001        	addw	x,#OFST-8
 172  0042 cd0000        	call	c_rtol
 174  0045 ae2400        	ldw	x,#9216
 175  0048 bf02          	ldw	c_lreg+2,x
 176  004a ae00f4        	ldw	x,#244
 177  004d bf00          	ldw	c_lreg,x
 178  004f 96            	ldw	x,sp
 179  0050 1c0001        	addw	x,#OFST-8
 180  0053 cd0000        	call	c_ludv
 182  0056 96            	ldw	x,sp
 183  0057 1c0005        	addw	x,#OFST-4
 184  005a cd0000        	call	c_rtol
 187  005d 201c          	jra	L15
 188  005f               L74:
 189                     ; 76     else if ( clocksource == CLK_SOURCE_LSI)
 191  005f 7b09          	ld	a,(OFST+0,sp)
 192  0061 a1d2          	cp	a,#210
 193  0063 260c          	jrne	L35
 194                     ; 78         clockfrequency = LSI_VALUE;
 196  0065 aef400        	ldw	x,#62464
 197  0068 1f07          	ldw	(OFST-2,sp),x
 198  006a ae0001        	ldw	x,#1
 199  006d 1f05          	ldw	(OFST-4,sp),x
 201  006f 200a          	jra	L15
 202  0071               L35:
 203                     ; 82         clockfrequency = HSE_VALUE;
 205  0071 ae2400        	ldw	x,#9216
 206  0074 1f07          	ldw	(OFST-2,sp),x
 207  0076 ae00f4        	ldw	x,#244
 208  0079 1f05          	ldw	(OFST-4,sp),x
 209  007b               L15:
 210                     ; 85     return((u32)clockfrequency);
 212  007b 96            	ldw	x,sp
 213  007c 1c0005        	addw	x,#OFST-4
 214  007f cd0000        	call	c_ltor
 218  0082 5b09          	addw	sp,#9
 219  0084 81            	ret
 254                     	xdef	_CLKPrescTable
 255                     	xdef	_HSIDivFactor
 256                     	xdef	_CLK_GetClockFreq
 257                     	xref.b	c_lreg
 258                     	xref.b	c_x
 277                     	xref	c_ludv
 278                     	xref	c_rtol
 279                     	xref	c_ltor
 280                     	end
