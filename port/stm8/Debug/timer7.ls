   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.data
   5  0000               L7_cb_cnt:
   6  0000 0000          	dc.w	0
  69                     ; 61 uint32_t test_start (void)
  69                     ; 62 {
  71                     .text:	section	.text,new
  72  0000               _test_start:
  74  0000 5209          	subw	sp,#9
  75       00000009      OFST:	set	9
  78                     ; 67     failures = 0;
  80  0002 5f            	clrw	x
  81  0003 1f06          	ldw	(OFST-3,sp),x
  82                     ; 73     CRITICAL_START ();
  84  0005 96            	ldw	x,sp
  85  0006 1c0005        	addw	x,#OFST-4
  87  0009 8a            push CC
  88  000a 84            pop a
  89  000b f7            ld (X),A
  90  000c 9b            sim
  92                     ; 76     atomTimeSet (0xFFFFFFFA);
  94  000d aefffa        	ldw	x,#65530
  95  0010 89            	pushw	x
  96  0011 aeffff        	ldw	x,#-1
  97  0014 89            	pushw	x
  98  0015 cd0000        	call	_atomTimeSet
 100  0018 5b04          	addw	sp,#4
 101                     ; 79     timer_cb[0].cb_ticks = 2;
 103  001a ae0002        	ldw	x,#2
 104  001d cf0016        	ldw	L3_timer_cb+6,x
 105  0020 ae0000        	ldw	x,#0
 106  0023 cf0014        	ldw	L3_timer_cb+4,x
 107                     ; 80     timer_cb[0].cb_func = testCallback;
 109  0026 ae0000        	ldw	x,#L11_testCallback
 110  0029 cf0010        	ldw	L3_timer_cb,x
 111                     ; 81     timer_cb[0].cb_data = (POINTER)0;
 113  002c 5f            	clrw	x
 114  002d cf0012        	ldw	L3_timer_cb+2,x
 115                     ; 82     if (atomTimerRegister (&timer_cb[0]) != ATOM_OK)
 117  0030 ae0010        	ldw	x,#L3_timer_cb
 118  0033 cd0000        	call	_atomTimerRegister
 120  0036 4d            	tnz	a
 121  0037 270d          	jreq	L14
 122                     ; 84         ATOMLOG (_STR("TimerReg0\n"));
 124  0039 ae0029        	ldw	x,#L34
 125  003c cd0000        	call	_printf
 127                     ; 85         failures++;
 129  003f 1e06          	ldw	x,(OFST-3,sp)
 130  0041 1c0001        	addw	x,#1
 131  0044 1f06          	ldw	(OFST-3,sp),x
 132  0046               L14:
 133                     ; 89     timer_cb[1].cb_ticks = 10;
 135  0046 ae000a        	ldw	x,#10
 136  0049 cf0020        	ldw	L3_timer_cb+16,x
 137  004c ae0000        	ldw	x,#0
 138  004f cf001e        	ldw	L3_timer_cb+14,x
 139                     ; 90     timer_cb[1].cb_func = testCallback;
 141  0052 ae0000        	ldw	x,#L11_testCallback
 142  0055 cf001a        	ldw	L3_timer_cb+10,x
 143                     ; 91     timer_cb[1].cb_data = (POINTER)3;
 145  0058 ae0003        	ldw	x,#3
 146  005b cf001c        	ldw	L3_timer_cb+12,x
 147                     ; 92     if (atomTimerRegister (&timer_cb[1]) != ATOM_OK)
 149  005e ae001a        	ldw	x,#L3_timer_cb+10
 150  0061 cd0000        	call	_atomTimerRegister
 152  0064 4d            	tnz	a
 153  0065 270d          	jreq	L54
 154                     ; 94         ATOMLOG (_STR("TimerReg1\n"));
 156  0067 ae001e        	ldw	x,#L74
 157  006a cd0000        	call	_printf
 159                     ; 95         failures++;
 161  006d 1e06          	ldw	x,(OFST-3,sp)
 162  006f 1c0001        	addw	x,#1
 163  0072 1f06          	ldw	(OFST-3,sp),x
 164  0074               L54:
 165                     ; 99     timer_cb[2].cb_ticks = 4;
 167  0074 ae0004        	ldw	x,#4
 168  0077 cf002a        	ldw	L3_timer_cb+26,x
 169  007a ae0000        	ldw	x,#0
 170  007d cf0028        	ldw	L3_timer_cb+24,x
 171                     ; 100     timer_cb[2].cb_func = testCallback;
 173  0080 ae0000        	ldw	x,#L11_testCallback
 174  0083 cf0024        	ldw	L3_timer_cb+20,x
 175                     ; 101     timer_cb[2].cb_data = (POINTER)1;
 177  0086 ae0001        	ldw	x,#1
 178  0089 cf0026        	ldw	L3_timer_cb+22,x
 179                     ; 102     if (atomTimerRegister (&timer_cb[2]) != ATOM_OK)
 181  008c ae0024        	ldw	x,#L3_timer_cb+20
 182  008f cd0000        	call	_atomTimerRegister
 184  0092 4d            	tnz	a
 185  0093 270d          	jreq	L15
 186                     ; 104         ATOMLOG (_STR("TimerReg2\n"));
 188  0095 ae0013        	ldw	x,#L35
 189  0098 cd0000        	call	_printf
 191                     ; 105         failures++;
 193  009b 1e06          	ldw	x,(OFST-3,sp)
 194  009d 1c0001        	addw	x,#1
 195  00a0 1f06          	ldw	(OFST-3,sp),x
 196  00a2               L15:
 197                     ; 109     timer_cb[3].cb_ticks = 9;
 199  00a2 ae0009        	ldw	x,#9
 200  00a5 cf0034        	ldw	L3_timer_cb+36,x
 201  00a8 ae0000        	ldw	x,#0
 202  00ab cf0032        	ldw	L3_timer_cb+34,x
 203                     ; 110     timer_cb[3].cb_func = testCallback;
 205  00ae ae0000        	ldw	x,#L11_testCallback
 206  00b1 cf002e        	ldw	L3_timer_cb+30,x
 207                     ; 111     timer_cb[3].cb_data = (POINTER)2;
 209  00b4 ae0002        	ldw	x,#2
 210  00b7 cf0030        	ldw	L3_timer_cb+32,x
 211                     ; 112     if (atomTimerRegister (&timer_cb[3]) != ATOM_OK)
 213  00ba ae002e        	ldw	x,#L3_timer_cb+30
 214  00bd cd0000        	call	_atomTimerRegister
 216  00c0 4d            	tnz	a
 217  00c1 270d          	jreq	L55
 218                     ; 114         ATOMLOG (_STR("TimerReg3\n"));
 220  00c3 ae0008        	ldw	x,#L75
 221  00c6 cd0000        	call	_printf
 223                     ; 115         failures++;
 225  00c9 1e06          	ldw	x,(OFST-3,sp)
 226  00cb 1c0001        	addw	x,#1
 227  00ce 1f06          	ldw	(OFST-3,sp),x
 228  00d0               L55:
 229                     ; 119     for (i = 0; i < 4; i++)
 231  00d0 5f            	clrw	x
 232  00d1 1f08          	ldw	(OFST-1,sp),x
 233  00d3               L16:
 234                     ; 121         cb_order[i] = 99;
 236  00d3 1e08          	ldw	x,(OFST-1,sp)
 237  00d5 58            	sllw	x
 238  00d6 58            	sllw	x
 239  00d7 a663          	ld	a,#99
 240  00d9 d70003        	ld	(L5_cb_order+3,x),a
 241  00dc a600          	ld	a,#0
 242  00de d70002        	ld	(L5_cb_order+2,x),a
 243  00e1 a600          	ld	a,#0
 244  00e3 d70001        	ld	(L5_cb_order+1,x),a
 245  00e6 a600          	ld	a,#0
 246  00e8 d70000        	ld	(L5_cb_order,x),a
 247                     ; 119     for (i = 0; i < 4; i++)
 249  00eb 1e08          	ldw	x,(OFST-1,sp)
 250  00ed 1c0001        	addw	x,#1
 251  00f0 1f08          	ldw	(OFST-1,sp),x
 254  00f2 9c            	rvf
 255  00f3 1e08          	ldw	x,(OFST-1,sp)
 256  00f5 a30004        	cpw	x,#4
 257  00f8 2fd9          	jrslt	L16
 258                     ; 125     CRITICAL_END ();
 260  00fa 96            	ldw	x,sp
 261  00fb 1c0005        	addw	x,#OFST-4
 263  00fe f6            ld A,(X)
 264  00ff 88            push A
 265  0100 86            pop CC
 267                     ; 131     atomTimerDelay (20);
 269  0101 ae0014        	ldw	x,#20
 270  0104 89            	pushw	x
 271  0105 ae0000        	ldw	x,#0
 272  0108 89            	pushw	x
 273  0109 cd0000        	call	_atomTimerDelay
 275  010c 5b04          	addw	sp,#4
 276                     ; 134     for (i = 0; i < 4; i++)
 278  010e 5f            	clrw	x
 279  010f 1f08          	ldw	(OFST-1,sp),x
 280  0111               L76:
 281                     ; 136         if (cb_order[i] != i)
 283  0111 1e08          	ldw	x,(OFST-1,sp)
 284  0113 cd0000        	call	c_itolx
 286  0116 96            	ldw	x,sp
 287  0117 1c0001        	addw	x,#OFST-8
 288  011a cd0000        	call	c_rtol
 290  011d 1e08          	ldw	x,(OFST-1,sp)
 291  011f 58            	sllw	x
 292  0120 58            	sllw	x
 293  0121 1c0000        	addw	x,#L5_cb_order
 294  0124 cd0000        	call	c_ltor
 296  0127 96            	ldw	x,sp
 297  0128 1c0001        	addw	x,#OFST-8
 298  012b cd0000        	call	c_lcmp
 300  012e 271a          	jreq	L57
 301                     ; 138             ATOMLOG (_STR("T%d=%d\n"), i, (int)cb_order[i]);
 303  0130 1e08          	ldw	x,(OFST-1,sp)
 304  0132 58            	sllw	x
 305  0133 58            	sllw	x
 306  0134 de0002        	ldw	x,(L5_cb_order+2,x)
 307  0137 89            	pushw	x
 308  0138 1e0a          	ldw	x,(OFST+1,sp)
 309  013a 89            	pushw	x
 310  013b ae0000        	ldw	x,#L77
 311  013e cd0000        	call	_printf
 313  0141 5b04          	addw	sp,#4
 314                     ; 139             failures++;
 316  0143 1e06          	ldw	x,(OFST-3,sp)
 317  0145 1c0001        	addw	x,#1
 318  0148 1f06          	ldw	(OFST-3,sp),x
 319  014a               L57:
 320                     ; 134     for (i = 0; i < 4; i++)
 322  014a 1e08          	ldw	x,(OFST-1,sp)
 323  014c 1c0001        	addw	x,#1
 324  014f 1f08          	ldw	(OFST-1,sp),x
 327  0151 9c            	rvf
 328  0152 1e08          	ldw	x,(OFST-1,sp)
 329  0154 a30004        	cpw	x,#4
 330  0157 2fb8          	jrslt	L76
 331                     ; 144     return failures;
 333  0159 1e06          	ldw	x,(OFST-3,sp)
 334  015b cd0000        	call	c_itolx
 338  015e 5b09          	addw	sp,#9
 339  0160 81            	ret
 383                     ; 157 static void testCallback (POINTER cb_data)
 383                     ; 158 {
 384                     .text:	section	.text,new
 385  0000               L11_testCallback:
 387  0000 89            	pushw	x
 388       00000002      OFST:	set	2
 391                     ; 162     expected_order = (int)cb_data;
 393  0001 1f01          	ldw	(OFST-1,sp),x
 394                     ; 165     cb_order[cb_cnt] = expected_order;
 396  0003 1e01          	ldw	x,(OFST-1,sp)
 397  0005 cd0000        	call	c_itolx
 399  0008 ce0000        	ldw	x,L7_cb_cnt
 400  000b 58            	sllw	x
 401  000c 58            	sllw	x
 402  000d 1c0000        	addw	x,#L5_cb_order
 403  0010 cd0000        	call	c_rtol
 405                     ; 168     cb_cnt++;
 407  0013 ce0000        	ldw	x,L7_cb_cnt
 408  0016 1c0001        	addw	x,#1
 409  0019 cf0000        	ldw	L7_cb_cnt,x
 410                     ; 169 }
 413  001c 85            	popw	x
 414  001d 81            	ret
 505                     	switch	.bss
 506  0000               L5_cb_order:
 507  0000 000000000000  	ds.b	16
 508  0010               L3_timer_cb:
 509  0010 000000000000  	ds.b	40
 510                     	xdef	_test_start
 511                     	xref	_printf
 512                     	xref	_atomTimeSet
 513                     	xref	_atomTimerDelay
 514                     	xref	_atomTimerRegister
 515                     .const:	section	.text
 516  0000               L77:
 517  0000 5425643d2564  	dc.b	"T%d=%d",10,0
 518  0008               L75:
 519  0008 54696d657252  	dc.b	"TimerReg3",10,0
 520  0013               L35:
 521  0013 54696d657252  	dc.b	"TimerReg2",10,0
 522  001e               L74:
 523  001e 54696d657252  	dc.b	"TimerReg1",10,0
 524  0029               L34:
 525  0029 54696d657252  	dc.b	"TimerReg0",10,0
 545                     	xref	c_lcmp
 546                     	xref	c_rtol
 547                     	xref	c_itolx
 548                     	xref	c_ltor
 549                     	end
