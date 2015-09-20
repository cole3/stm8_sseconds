   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  59                     ; 63 uint32_t test_start (void)
  59                     ; 64 {
  61                     .text:	section	.text,new
  62  0000               _test_start:
  64  0000 5204          	subw	sp,#4
  65       00000004      OFST:	set	4
  68                     ; 69     failures = 0;
  70  0002 5f            	clrw	x
  71  0003 1f01          	ldw	(OFST-3,sp),x
  72                     ; 77     atomTimerDelay(1);
  74  0005 ae0001        	ldw	x,#1
  75  0008 89            	pushw	x
  76  0009 ae0000        	ldw	x,#0
  77  000c 89            	pushw	x
  78  000d cd0000        	call	_atomTimerDelay
  80  0010 5b04          	addw	sp,#4
  81                     ; 84     start_time = atomTimeGet();
  83  0012 cd0000        	call	_atomTimeGet
  85  0015 ae0000        	ldw	x,#L7_start_time
  86  0018 cd0000        	call	c_rtol
  88                     ; 91     for (i = 0; i < 4; i++)
  90  001b 5f            	clrw	x
  91  001c 1f03          	ldw	(OFST-1,sp),x
  92  001e               L73:
  93                     ; 97         cb_ticks[i] = SYSTEM_TICKS_PER_SEC + i;
  95  001e 1e03          	ldw	x,(OFST-1,sp)
  96  0020 1c0064        	addw	x,#100
  97  0023 cd0000        	call	c_itolx
  99  0026 1e03          	ldw	x,(OFST-1,sp)
 100  0028 58            	sllw	x
 101  0029 58            	sllw	x
 102  002a 1c0004        	addw	x,#L5_cb_ticks
 103  002d cd0000        	call	c_rtol
 105                     ; 98         timer_cb[i].cb_ticks = cb_ticks[i];
 107  0030 1e03          	ldw	x,(OFST-1,sp)
 108  0032 90ae000a      	ldw	y,#10
 109  0036 cd0000        	call	c_imul
 111  0039 1603          	ldw	y,(OFST-1,sp)
 112  003b 9058          	sllw	y
 113  003d 9058          	sllw	y
 114  003f 90d60007      	ld	a,(L5_cb_ticks+3,y)
 115  0043 d7001b        	ld	(L3_timer_cb+7,x),a
 116  0046 90d60006      	ld	a,(L5_cb_ticks+2,y)
 117  004a d7001a        	ld	(L3_timer_cb+6,x),a
 118  004d 90d60005      	ld	a,(L5_cb_ticks+1,y)
 119  0051 d70019        	ld	(L3_timer_cb+5,x),a
 120  0054 90d60004      	ld	a,(L5_cb_ticks,y)
 121  0058 d70018        	ld	(L3_timer_cb+4,x),a
 122                     ; 99         timer_cb[i].cb_func = testCallback;
 124  005b 1e03          	ldw	x,(OFST-1,sp)
 125  005d 90ae000a      	ldw	y,#10
 126  0061 cd0000        	call	c_imul
 128  0064 90ae0000      	ldw	y,#L11_testCallback
 129  0068 df0014        	ldw	(L3_timer_cb,x),y
 130                     ; 100         timer_cb[i].cb_data = &cb_ticks[i];
 132  006b 1e03          	ldw	x,(OFST-1,sp)
 133  006d 90ae000a      	ldw	y,#10
 134  0071 cd0000        	call	c_imul
 136  0074 1603          	ldw	y,(OFST-1,sp)
 137  0076 9058          	sllw	y
 138  0078 9058          	sllw	y
 139  007a 72a90004      	addw	y,#L5_cb_ticks
 140  007e df0016        	ldw	(L3_timer_cb+2,x),y
 141                     ; 91     for (i = 0; i < 4; i++)
 143  0081 1e03          	ldw	x,(OFST-1,sp)
 144  0083 1c0001        	addw	x,#1
 145  0086 1f03          	ldw	(OFST-1,sp),x
 148  0088 9c            	rvf
 149  0089 1e03          	ldw	x,(OFST-1,sp)
 150  008b a30004        	cpw	x,#4
 151  008e 2f8e          	jrslt	L73
 152                     ; 104     if (atomTimerRegister (&timer_cb[1]) != ATOM_OK)
 154  0090 ae001e        	ldw	x,#L3_timer_cb+10
 155  0093 cd0000        	call	_atomTimerRegister
 157  0096 4d            	tnz	a
 158  0097 2711          	jreq	L54
 159                     ; 106         ATOMLOG (_STR("TimerReg1\n"));
 161  0099 ae0030        	ldw	x,#L74
 162  009c cd0000        	call	_printf
 164                     ; 107         failures++;
 166  009f 1e01          	ldw	x,(OFST-3,sp)
 167  00a1 1c0001        	addw	x,#1
 168  00a4 1f01          	ldw	(OFST-3,sp),x
 170  00a6 ac400140      	jpf	L15
 171  00aa               L54:
 172                     ; 109     else if (atomTimerRegister (&timer_cb[3]) != ATOM_OK)
 174  00aa ae0032        	ldw	x,#L3_timer_cb+30
 175  00ad cd0000        	call	_atomTimerRegister
 177  00b0 4d            	tnz	a
 178  00b1 270f          	jreq	L35
 179                     ; 111         ATOMLOG (_STR("TimerReg3\n"));
 181  00b3 ae0025        	ldw	x,#L55
 182  00b6 cd0000        	call	_printf
 184                     ; 112         failures++;
 186  00b9 1e01          	ldw	x,(OFST-3,sp)
 187  00bb 1c0001        	addw	x,#1
 188  00be 1f01          	ldw	(OFST-3,sp),x
 190  00c0 207e          	jra	L15
 191  00c2               L35:
 192                     ; 114     else if (atomTimerRegister (&timer_cb[2]) != ATOM_OK)
 194  00c2 ae0028        	ldw	x,#L3_timer_cb+20
 195  00c5 cd0000        	call	_atomTimerRegister
 197  00c8 4d            	tnz	a
 198  00c9 270f          	jreq	L16
 199                     ; 116         ATOMLOG (_STR("TimerReg2\n"));
 201  00cb ae001a        	ldw	x,#L36
 202  00ce cd0000        	call	_printf
 204                     ; 117         failures++;
 206  00d1 1e01          	ldw	x,(OFST-3,sp)
 207  00d3 1c0001        	addw	x,#1
 208  00d6 1f01          	ldw	(OFST-3,sp),x
 210  00d8 2066          	jra	L15
 211  00da               L16:
 212                     ; 119     else if (atomTimerRegister (&timer_cb[0]) != ATOM_OK)
 214  00da ae0014        	ldw	x,#L3_timer_cb
 215  00dd cd0000        	call	_atomTimerRegister
 217  00e0 4d            	tnz	a
 218  00e1 270f          	jreq	L76
 219                     ; 121         ATOMLOG (_STR("TimerReg0\n"));
 221  00e3 ae000f        	ldw	x,#L17
 222  00e6 cd0000        	call	_printf
 224                     ; 122         failures++;
 226  00e9 1e01          	ldw	x,(OFST-3,sp)
 227  00eb 1c0001        	addw	x,#1
 228  00ee 1f01          	ldw	(OFST-3,sp),x
 230  00f0 204e          	jra	L15
 231  00f2               L76:
 232                     ; 129         if (atomTimerDelay(2 * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 234  00f2 ae00c8        	ldw	x,#200
 235  00f5 89            	pushw	x
 236  00f6 ae0000        	ldw	x,#0
 237  00f9 89            	pushw	x
 238  00fa cd0000        	call	_atomTimerDelay
 240  00fd 5b04          	addw	sp,#4
 241  00ff 4d            	tnz	a
 242  0100 270f          	jreq	L57
 243                     ; 131             ATOMLOG (_STR("Wait\n"));
 245  0102 ae0009        	ldw	x,#L77
 246  0105 cd0000        	call	_printf
 248                     ; 132             failures++;
 250  0108 1e01          	ldw	x,(OFST-3,sp)
 251  010a 1c0001        	addw	x,#1
 252  010d 1f01          	ldw	(OFST-3,sp),x
 254  010f 202f          	jra	L15
 255  0111               L57:
 256                     ; 141             for (i = 0; i < 4; i++)
 258  0111 5f            	clrw	x
 259  0112 1f03          	ldw	(OFST-1,sp),x
 260  0114               L301:
 261                     ; 144                 if (cb_ticks[i] != 0)
 263  0114 1e03          	ldw	x,(OFST-1,sp)
 264  0116 58            	sllw	x
 265  0117 58            	sllw	x
 266  0118 1c0004        	addw	x,#L5_cb_ticks
 267  011b cd0000        	call	c_lzmp
 269  011e 2711          	jreq	L111
 270                     ; 146                     ATOMLOG (_STR("Clear%d\n"), i);
 272  0120 1e03          	ldw	x,(OFST-1,sp)
 273  0122 89            	pushw	x
 274  0123 ae0000        	ldw	x,#L311
 275  0126 cd0000        	call	_printf
 277  0129 85            	popw	x
 278                     ; 147                     failures++;
 280  012a 1e01          	ldw	x,(OFST-3,sp)
 281  012c 1c0001        	addw	x,#1
 282  012f 1f01          	ldw	(OFST-3,sp),x
 283  0131               L111:
 284                     ; 141             for (i = 0; i < 4; i++)
 286  0131 1e03          	ldw	x,(OFST-1,sp)
 287  0133 1c0001        	addw	x,#1
 288  0136 1f03          	ldw	(OFST-1,sp),x
 291  0138 9c            	rvf
 292  0139 1e03          	ldw	x,(OFST-1,sp)
 293  013b a30004        	cpw	x,#4
 294  013e 2fd4          	jrslt	L301
 295  0140               L15:
 296                     ; 154     return failures;
 298  0140 1e01          	ldw	x,(OFST-3,sp)
 299  0142 cd0000        	call	c_itolx
 303  0145 5b04          	addw	sp,#4
 304  0147 81            	ret
 348                     ; 168 static void testCallback (POINTER cb_data)
 348                     ; 169 {
 349                     .text:	section	.text,new
 350  0000               L11_testCallback:
 352  0000 89            	pushw	x
 353  0001 5204          	subw	sp,#4
 354       00000004      OFST:	set	4
 357                     ; 177     expected_end_time = start_time + *(uint32_t *)cb_data;
 359  0003 cd0000        	call	c_ltor
 361  0006 ae0000        	ldw	x,#L7_start_time
 362  0009 cd0000        	call	c_ladd
 364  000c 96            	ldw	x,sp
 365  000d 1c0001        	addw	x,#OFST-3
 366  0010 cd0000        	call	c_rtol
 368                     ; 183     if (atomTimeGet() == expected_end_time)
 370  0013 cd0000        	call	_atomTimeGet
 372  0016 96            	ldw	x,sp
 373  0017 1c0001        	addw	x,#OFST-3
 374  001a cd0000        	call	c_lcmp
 376  001d 2611          	jrne	L731
 377                     ; 186         *(uint32_t *)cb_data = 0;
 379  001f 1e05          	ldw	x,(OFST+1,sp)
 380  0021 a600          	ld	a,#0
 381  0023 e703          	ld	(3,x),a
 382  0025 a600          	ld	a,#0
 383  0027 e702          	ld	(2,x),a
 384  0029 a600          	ld	a,#0
 385  002b e701          	ld	(1,x),a
 386  002d a600          	ld	a,#0
 387  002f f7            	ld	(x),a
 389  0030               L731:
 390                     ; 193 }
 393  0030 5b06          	addw	sp,#6
 394  0032 81            	ret
 485                     	switch	.bss
 486  0000               L7_start_time:
 487  0000 00000000      	ds.b	4
 488  0004               L5_cb_ticks:
 489  0004 000000000000  	ds.b	16
 490  0014               L3_timer_cb:
 491  0014 000000000000  	ds.b	40
 492                     	xdef	_test_start
 493                     	xref	_printf
 494                     	xref	_atomTimeGet
 495                     	xref	_atomTimerDelay
 496                     	xref	_atomTimerRegister
 497                     .const:	section	.text
 498  0000               L311:
 499  0000 436c65617225  	dc.b	"Clear%d",10,0
 500  0009               L77:
 501  0009 576169740a00  	dc.b	"Wait",10,0
 502  000f               L17:
 503  000f 54696d657252  	dc.b	"TimerReg0",10,0
 504  001a               L36:
 505  001a 54696d657252  	dc.b	"TimerReg2",10,0
 506  0025               L55:
 507  0025 54696d657252  	dc.b	"TimerReg3",10,0
 508  0030               L74:
 509  0030 54696d657252  	dc.b	"TimerReg1",10,0
 510                     	xref.b	c_x
 530                     	xref	c_lcmp
 531                     	xref	c_ladd
 532                     	xref	c_ltor
 533                     	xref	c_lzmp
 534                     	xref	c_imul
 535                     	xref	c_itolx
 536                     	xref	c_rtol
 537                     	end
