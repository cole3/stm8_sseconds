   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  58                     ; 60 uint32_t test_start (void)
  58                     ; 61 {
  60                     .text:	section	.text,new
  61  0000               _test_start:
  63  0000 5204          	subw	sp,#4
  64       00000004      OFST:	set	4
  67                     ; 66     failures = 0;
  69  0002 5f            	clrw	x
  70  0003 1f01          	ldw	(OFST-3,sp),x
  71                     ; 69     for (i = 0; i < 4; i++)
  73  0005 5f            	clrw	x
  74  0006 1f03          	ldw	(OFST-1,sp),x
  75  0008               L53:
  76                     ; 71         callback_ran_flag[i] = FALSE;
  78  0008 1e03          	ldw	x,(OFST-1,sp)
  79  000a 58            	sllw	x
  80  000b 905f          	clrw	y
  81  000d df0000        	ldw	(L5_callback_ran_flag,x),y
  82                     ; 69     for (i = 0; i < 4; i++)
  84  0010 1e03          	ldw	x,(OFST-1,sp)
  85  0012 1c0001        	addw	x,#1
  86  0015 1f03          	ldw	(OFST-1,sp),x
  89  0017 9c            	rvf
  90  0018 1e03          	ldw	x,(OFST-1,sp)
  91  001a a30004        	cpw	x,#4
  92  001d 2fe9          	jrslt	L53
  93                     ; 79     for (i = 0; i < 4; i++)
  95  001f 5f            	clrw	x
  96  0020 1f03          	ldw	(OFST-1,sp),x
  97  0022               L34:
  98                     ; 85         timer_cb[i].cb_ticks = SYSTEM_TICKS_PER_SEC + i;
 100  0022 1e03          	ldw	x,(OFST-1,sp)
 101  0024 1c0064        	addw	x,#100
 102  0027 cd0000        	call	c_itolx
 104  002a 1e03          	ldw	x,(OFST-1,sp)
 105  002c 90ae000a      	ldw	y,#10
 106  0030 cd0000        	call	c_imul
 108  0033 1c000c        	addw	x,#L3_timer_cb+4
 109  0036 cd0000        	call	c_rtol
 111                     ; 86         timer_cb[i].cb_func = testCallback;
 113  0039 1e03          	ldw	x,(OFST-1,sp)
 114  003b 90ae000a      	ldw	y,#10
 115  003f cd0000        	call	c_imul
 117  0042 90ae0000      	ldw	y,#L7_testCallback
 118  0046 df0008        	ldw	(L3_timer_cb,x),y
 119                     ; 87         timer_cb[i].cb_data = &callback_ran_flag[i];
 121  0049 1e03          	ldw	x,(OFST-1,sp)
 122  004b 90ae000a      	ldw	y,#10
 123  004f cd0000        	call	c_imul
 125  0052 1603          	ldw	y,(OFST-1,sp)
 126  0054 9058          	sllw	y
 127  0056 72a90000      	addw	y,#L5_callback_ran_flag
 128  005a df000a        	ldw	(L3_timer_cb+2,x),y
 129                     ; 79     for (i = 0; i < 4; i++)
 131  005d 1e03          	ldw	x,(OFST-1,sp)
 132  005f 1c0001        	addw	x,#1
 133  0062 1f03          	ldw	(OFST-1,sp),x
 136  0064 9c            	rvf
 137  0065 1e03          	ldw	x,(OFST-1,sp)
 138  0067 a30004        	cpw	x,#4
 139  006a 2fb6          	jrslt	L34
 140                     ; 91     for (i = 0; i < 4; i++)
 142  006c 5f            	clrw	x
 143  006d 1f03          	ldw	(OFST-1,sp),x
 144  006f               L15:
 145                     ; 93         if (atomTimerRegister (&timer_cb[i]) != ATOM_OK)
 147  006f 1e03          	ldw	x,(OFST-1,sp)
 148  0071 90ae000a      	ldw	y,#10
 149  0075 cd0000        	call	c_imul
 151  0078 1c0008        	addw	x,#L3_timer_cb
 152  007b cd0000        	call	_atomTimerRegister
 154  007e 4d            	tnz	a
 155  007f 270d          	jreq	L75
 156                     ; 95             ATOMLOG (_STR("TimerReg\n"));
 158  0081 ae0027        	ldw	x,#L16
 159  0084 cd0000        	call	_printf
 161                     ; 96             failures++;
 163  0087 1e01          	ldw	x,(OFST-3,sp)
 164  0089 1c0001        	addw	x,#1
 165  008c 1f01          	ldw	(OFST-3,sp),x
 166  008e               L75:
 167                     ; 91     for (i = 0; i < 4; i++)
 169  008e 1e03          	ldw	x,(OFST-1,sp)
 170  0090 1c0001        	addw	x,#1
 171  0093 1f03          	ldw	(OFST-1,sp),x
 174  0095 9c            	rvf
 175  0096 1e03          	ldw	x,(OFST-1,sp)
 176  0098 a30004        	cpw	x,#4
 177  009b 2fd2          	jrslt	L15
 178                     ; 101     if (failures == 0)
 180  009d 1e01          	ldw	x,(OFST-3,sp)
 181  009f 2672          	jrne	L36
 182                     ; 104         if (atomTimerCancel (&timer_cb[1]) != ATOM_OK)
 184  00a1 ae0012        	ldw	x,#L3_timer_cb+10
 185  00a4 cd0000        	call	_atomTimerCancel
 187  00a7 4d            	tnz	a
 188  00a8 270d          	jreq	L56
 189                     ; 106             ATOMLOG (_STR("Cancel1\n"));
 191  00aa ae001e        	ldw	x,#L76
 192  00ad cd0000        	call	_printf
 194                     ; 107             failures++;
 196  00b0 1e01          	ldw	x,(OFST-3,sp)
 197  00b2 1c0001        	addw	x,#1
 198  00b5 1f01          	ldw	(OFST-3,sp),x
 199  00b7               L56:
 200                     ; 109         if (atomTimerCancel (&timer_cb[2]) != ATOM_OK)
 202  00b7 ae001c        	ldw	x,#L3_timer_cb+20
 203  00ba cd0000        	call	_atomTimerCancel
 205  00bd 4d            	tnz	a
 206  00be 270d          	jreq	L17
 207                     ; 111             ATOMLOG (_STR("Cancel2\n"));
 209  00c0 ae0015        	ldw	x,#L37
 210  00c3 cd0000        	call	_printf
 212                     ; 112             failures++;
 214  00c6 1e01          	ldw	x,(OFST-3,sp)
 215  00c8 1c0001        	addw	x,#1
 216  00cb 1f01          	ldw	(OFST-3,sp),x
 217  00cd               L17:
 218                     ; 116         if (atomTimerDelay(2 * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 220  00cd ae00c8        	ldw	x,#200
 221  00d0 89            	pushw	x
 222  00d1 ae0000        	ldw	x,#0
 223  00d4 89            	pushw	x
 224  00d5 cd0000        	call	_atomTimerDelay
 226  00d8 5b04          	addw	sp,#4
 227  00da 4d            	tnz	a
 228  00db 270f          	jreq	L57
 229                     ; 118             ATOMLOG (_STR("Wait\n"));
 231  00dd ae000f        	ldw	x,#L77
 232  00e0 cd0000        	call	_printf
 234                     ; 119             failures++;
 236  00e3 1e01          	ldw	x,(OFST-3,sp)
 237  00e5 1c0001        	addw	x,#1
 238  00e8 1f01          	ldw	(OFST-3,sp),x
 240  00ea 2027          	jra	L36
 241  00ec               L57:
 242                     ; 127             if ((callback_ran_flag[0] != TRUE) || (callback_ran_flag[3] != TRUE)
 242                     ; 128                 || (callback_ran_flag[1] != FALSE) || (callback_ran_flag[2] != FALSE))
 244  00ec ce0000        	ldw	x,L5_callback_ran_flag
 245  00ef a30001        	cpw	x,#1
 246  00f2 2612          	jrne	L501
 248  00f4 ce0006        	ldw	x,L5_callback_ran_flag+6
 249  00f7 a30001        	cpw	x,#1
 250  00fa 260a          	jrne	L501
 252  00fc ce0002        	ldw	x,L5_callback_ran_flag+2
 253  00ff 2605          	jrne	L501
 255  0101 ce0004        	ldw	x,L5_callback_ran_flag+4
 256  0104 270d          	jreq	L36
 257  0106               L501:
 258                     ; 130                 ATOMLOG (_STR("Cancellations\n"));
 260  0106 ae0000        	ldw	x,#L311
 261  0109 cd0000        	call	_printf
 263                     ; 131                 failures++;
 265  010c 1e01          	ldw	x,(OFST-3,sp)
 266  010e 1c0001        	addw	x,#1
 267  0111 1f01          	ldw	(OFST-3,sp),x
 268  0113               L36:
 269                     ; 137     return failures;
 271  0113 1e01          	ldw	x,(OFST-3,sp)
 272  0115 cd0000        	call	c_itolx
 276  0118 5b04          	addw	sp,#4
 277  011a 81            	ret
 312                     ; 151 static void testCallback (POINTER cb_data)
 312                     ; 152 {
 313                     .text:	section	.text,new
 314  0000               L7_testCallback:
 318                     ; 154     *(int *)cb_data = TRUE;
 320  0000 90ae0001      	ldw	y,#1
 321  0004 ff            	ldw	(x),y
 322                     ; 155 }
 325  0005 81            	ret
 409                     	switch	.bss
 410  0000               L5_callback_ran_flag:
 411  0000 000000000000  	ds.b	8
 412  0008               L3_timer_cb:
 413  0008 000000000000  	ds.b	40
 414                     	xdef	_test_start
 415                     	xref	_printf
 416                     	xref	_atomTimerDelay
 417                     	xref	_atomTimerCancel
 418                     	xref	_atomTimerRegister
 419                     .const:	section	.text
 420  0000               L311:
 421  0000 43616e63656c  	dc.b	"Cancellations",10,0
 422  000f               L77:
 423  000f 576169740a00  	dc.b	"Wait",10,0
 424  0015               L37:
 425  0015 43616e63656c  	dc.b	"Cancel2",10,0
 426  001e               L76:
 427  001e 43616e63656c  	dc.b	"Cancel1",10,0
 428  0027               L16:
 429  0027 54696d657252  	dc.b	"TimerReg",10,0
 430                     	xref.b	c_x
 450                     	xref	c_rtol
 451                     	xref	c_itolx
 452                     	xref	c_imul
 453                     	end
