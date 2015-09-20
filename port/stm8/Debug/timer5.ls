   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 105                     ; 57 uint32_t test_start (void)
 105                     ; 58 {
 107                     .text:	section	.text,new
 108  0000               _test_start:
 110  0000 520c          	subw	sp,#12
 111       0000000c      OFST:	set	12
 114                     ; 63     failures = 0;
 116  0002 5f            	clrw	x
 117  0003 1f0b          	ldw	(OFST-1,sp),x
 118                     ; 66     if (atomTimerCancel(NULL) != ATOM_ERR_PARAM)
 120  0005 5f            	clrw	x
 121  0006 cd0000        	call	_atomTimerCancel
 123  0009 a1c9          	cp	a,#201
 124  000b 270d          	jreq	L16
 125                     ; 68         ATOMLOG (_STR("Param\n"));
 127  000d ae0034        	ldw	x,#L36
 128  0010 cd0000        	call	_printf
 130                     ; 69         failures++;
 132  0013 1e0b          	ldw	x,(OFST-1,sp)
 133  0015 1c0001        	addw	x,#1
 134  0018 1f0b          	ldw	(OFST-1,sp),x
 135  001a               L16:
 136                     ; 73     if (atomTimerCancel(&timer_cb) != ATOM_ERR_NOT_FOUND)
 138  001a 96            	ldw	x,sp
 139  001b 1c0001        	addw	x,#OFST-11
 140  001e cd0000        	call	_atomTimerCancel
 142  0021 a1ce          	cp	a,#206
 143  0023 270d          	jreq	L56
 144                     ; 75         ATOMLOG (_STR("NotFound\n"));
 146  0025 ae002a        	ldw	x,#L76
 147  0028 cd0000        	call	_printf
 149                     ; 76         failures++;
 151  002b 1e0b          	ldw	x,(OFST-1,sp)
 152  002d 1c0001        	addw	x,#1
 153  0030 1f0b          	ldw	(OFST-1,sp),x
 154  0032               L56:
 155                     ; 80     callback_ran_flag = FALSE;
 157  0032 5f            	clrw	x
 158  0033 cf0000        	ldw	L3_callback_ran_flag,x
 159                     ; 83     timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 161  0036 ae0064        	ldw	x,#100
 162  0039 1f07          	ldw	(OFST-5,sp),x
 163  003b ae0000        	ldw	x,#0
 164  003e 1f05          	ldw	(OFST-7,sp),x
 165                     ; 84     timer_cb.cb_func = testCallback;
 167  0040 ae0000        	ldw	x,#L5_testCallback
 168  0043 1f01          	ldw	(OFST-11,sp),x
 169                     ; 87     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 171  0045 96            	ldw	x,sp
 172  0046 1c0001        	addw	x,#OFST-11
 173  0049 cd0000        	call	_atomTimerRegister
 175  004c 4d            	tnz	a
 176  004d 270f          	jreq	L17
 177                     ; 89         ATOMLOG (_STR("TimerReg\n"));
 179  004f ae0020        	ldw	x,#L37
 180  0052 cd0000        	call	_printf
 182                     ; 90         failures++;
 184  0055 1e0b          	ldw	x,(OFST-1,sp)
 185  0057 1c0001        	addw	x,#1
 186  005a 1f0b          	ldw	(OFST-1,sp),x
 188  005c 204a          	jra	L57
 189  005e               L17:
 190                     ; 97         if (atomTimerCancel (&timer_cb) != ATOM_OK)
 192  005e 96            	ldw	x,sp
 193  005f 1c0001        	addw	x,#OFST-11
 194  0062 cd0000        	call	_atomTimerCancel
 196  0065 4d            	tnz	a
 197  0066 270f          	jreq	L77
 198                     ; 99             ATOMLOG (_STR("TimerCancel\n"));
 200  0068 ae0013        	ldw	x,#L101
 201  006b cd0000        	call	_printf
 203                     ; 100             failures++;
 205  006e 1e0b          	ldw	x,(OFST-1,sp)
 206  0070 1c0001        	addw	x,#1
 207  0073 1f0b          	ldw	(OFST-1,sp),x
 209  0075 2031          	jra	L57
 210  0077               L77:
 211                     ; 107             if (atomTimerDelay(2 * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 213  0077 ae00c8        	ldw	x,#200
 214  007a 89            	pushw	x
 215  007b ae0000        	ldw	x,#0
 216  007e 89            	pushw	x
 217  007f cd0000        	call	_atomTimerDelay
 219  0082 5b04          	addw	sp,#4
 220  0084 4d            	tnz	a
 221  0085 270f          	jreq	L501
 222                     ; 109                 ATOMLOG (_STR("Wait\n"));
 224  0087 ae000d        	ldw	x,#L701
 225  008a cd0000        	call	_printf
 227                     ; 110                 failures++;
 229  008d 1e0b          	ldw	x,(OFST-1,sp)
 230  008f 1c0001        	addw	x,#1
 231  0092 1f0b          	ldw	(OFST-1,sp),x
 233  0094 2012          	jra	L57
 234  0096               L501:
 235                     ; 115                 if (callback_ran_flag != FALSE)
 237  0096 ce0000        	ldw	x,L3_callback_ran_flag
 238  0099 270d          	jreq	L57
 239                     ; 117                     ATOMLOG (_STR("Called back\n"));
 241  009b ae0000        	ldw	x,#L511
 242  009e cd0000        	call	_printf
 244                     ; 118                     failures++;
 246  00a1 1e0b          	ldw	x,(OFST-1,sp)
 247  00a3 1c0001        	addw	x,#1
 248  00a6 1f0b          	ldw	(OFST-1,sp),x
 249  00a8               L57:
 250                     ; 125     return failures;
 252  00a8 1e0b          	ldw	x,(OFST-1,sp)
 253  00aa cd0000        	call	c_itolx
 257  00ad 5b0c          	addw	sp,#12
 258  00af 81            	ret
 294                     ; 137 static void testCallback (POINTER cb_data)
 294                     ; 138 {
 295                     .text:	section	.text,new
 296  0000               L5_testCallback:
 300                     ; 140     callback_ran_flag = TRUE;
 302  0000 ae0001        	ldw	x,#1
 303  0003 cf0000        	ldw	L3_callback_ran_flag,x
 304                     ; 141 }
 307  0006 81            	ret
 331                     	switch	.bss
 332  0000               L3_callback_ran_flag:
 333  0000 0000          	ds.b	2
 334                     	xdef	_test_start
 335                     	xref	_printf
 336                     	xref	_atomTimerDelay
 337                     	xref	_atomTimerCancel
 338                     	xref	_atomTimerRegister
 339                     .const:	section	.text
 340  0000               L511:
 341  0000 43616c6c6564  	dc.b	"Called back",10,0
 342  000d               L701:
 343  000d 576169740a00  	dc.b	"Wait",10,0
 344  0013               L101:
 345  0013 54696d657243  	dc.b	"TimerCancel",10,0
 346  0020               L37:
 347  0020 54696d657252  	dc.b	"TimerReg",10,0
 348  002a               L76:
 349  002a 4e6f74466f75  	dc.b	"NotFound",10,0
 350  0034               L36:
 351  0034 506172616d0a  	dc.b	"Param",10,0
 371                     	xref	c_itolx
 372                     	end
