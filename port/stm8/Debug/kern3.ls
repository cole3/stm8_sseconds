   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  80                     ; 84 uint32_t test_start (void)
  80                     ; 85 {
  82                     .text:	section	.text,new
  83  0000               _test_start:
  85  0000 520c          	subw	sp,#12
  86       0000000c      OFST:	set	12
  89                     ; 90     failures = 0;
  91  0002 5f            	clrw	x
  92  0003 1f09          	ldw	(OFST-3,sp),x
  93                     ; 93     running_flag[0] = running_flag[1] = FALSE;
  95  0005 5f            	clrw	x
  96  0006 cf0006        	ldw	L7_running_flag+2,x
  97  0009 5f            	clrw	x
  98  000a cf0004        	ldw	L7_running_flag,x
  99                     ; 94     sleep_request[0] = sleep_request[1] = FALSE;
 101  000d 5f            	clrw	x
 102  000e cf0002        	ldw	L11_sleep_request+2,x
 103  0011 5f            	clrw	x
 104  0012 cf0000        	ldw	L11_sleep_request,x
 105                     ; 97     if (atomThreadCreate (&tcb[0], 253, test_thread_func, 0,
 105                     ; 98             &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 105                     ; 99             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 107  0015 ae0080        	ldw	x,#128
 108  0018 89            	pushw	x
 109  0019 ae0000        	ldw	x,#0
 110  001c 89            	pushw	x
 111  001d ae0087        	ldw	x,#L5_test_thread_stack+127
 112  0020 89            	pushw	x
 113  0021 ae0000        	ldw	x,#0
 114  0024 89            	pushw	x
 115  0025 ae0000        	ldw	x,#0
 116  0028 89            	pushw	x
 117  0029 ae0000        	ldw	x,#L31_test_thread_func
 118  002c 89            	pushw	x
 119  002d 4bfd          	push	#253
 120  002f ae0108        	ldw	x,#L3_tcb
 121  0032 cd0000        	call	_atomThreadCreate
 123  0035 5b0d          	addw	sp,#13
 124  0037 4d            	tnz	a
 125  0038 270f          	jreq	L74
 126                     ; 101         ATOMLOG (_STR("Bad thread create\n"));
 128  003a ae0040        	ldw	x,#L15
 129  003d cd0000        	call	_printf
 131                     ; 102         failures++;
 133  0040 1e09          	ldw	x,(OFST-3,sp)
 134  0042 1c0001        	addw	x,#1
 135  0045 1f09          	ldw	(OFST-3,sp),x
 137  0047 2032          	jra	L35
 138  0049               L74:
 139                     ; 106     else if (atomThreadCreate (&tcb[1], 252, test_thread_func, 1,
 139                     ; 107             &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 139                     ; 108             TEST_THREAD_STACK_SIZE) != ATOM_OK)
 141  0049 ae0080        	ldw	x,#128
 142  004c 89            	pushw	x
 143  004d ae0000        	ldw	x,#0
 144  0050 89            	pushw	x
 145  0051 ae0107        	ldw	x,#L5_test_thread_stack+255
 146  0054 89            	pushw	x
 147  0055 ae0001        	ldw	x,#1
 148  0058 89            	pushw	x
 149  0059 ae0000        	ldw	x,#0
 150  005c 89            	pushw	x
 151  005d ae0000        	ldw	x,#L31_test_thread_func
 152  0060 89            	pushw	x
 153  0061 4bfc          	push	#252
 154  0063 ae011f        	ldw	x,#L3_tcb+23
 155  0066 cd0000        	call	_atomThreadCreate
 157  0069 5b0d          	addw	sp,#13
 158  006b 4d            	tnz	a
 159  006c 270d          	jreq	L35
 160                     ; 110         ATOMLOG (_STR("Bad thread create\n"));
 162  006e ae0040        	ldw	x,#L15
 163  0071 cd0000        	call	_printf
 165                     ; 111         failures++;
 167  0074 1e09          	ldw	x,(OFST-3,sp)
 168  0076 1c0001        	addw	x,#1
 169  0079 1f09          	ldw	(OFST-3,sp),x
 170  007b               L35:
 171                     ; 115     for (i = 0; i < 8; i++)
 173  007b 5f            	clrw	x
 174  007c 1f0b          	ldw	(OFST-1,sp),x
 175  007e               L75:
 176                     ; 118         sleep_request[1] = TRUE;
 178  007e ae0001        	ldw	x,#1
 179  0081 cf0002        	ldw	L11_sleep_request+2,x
 180                     ; 121         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 182  0084 ae0019        	ldw	x,#25
 183  0087 89            	pushw	x
 184  0088 ae0000        	ldw	x,#0
 185  008b 89            	pushw	x
 186  008c cd0000        	call	_atomTimerDelay
 188  008f 5b04          	addw	sp,#4
 189                     ; 124         running_flag[0] = running_flag[1] = FALSE;
 191  0091 5f            	clrw	x
 192  0092 cf0006        	ldw	L7_running_flag+2,x
 193  0095 5f            	clrw	x
 194  0096 cf0004        	ldw	L7_running_flag,x
 195                     ; 127         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 197  0099 ae0019        	ldw	x,#25
 198  009c 89            	pushw	x
 199  009d ae0000        	ldw	x,#0
 200  00a0 89            	pushw	x
 201  00a1 cd0000        	call	_atomTimerDelay
 203  00a4 5b04          	addw	sp,#4
 204                     ; 130         if ((running_flag[0] != TRUE) || (running_flag[1] != FALSE))
 206  00a6 ce0004        	ldw	x,L7_running_flag
 207  00a9 a30001        	cpw	x,#1
 208  00ac 2605          	jrne	L76
 210  00ae ce0006        	ldw	x,L7_running_flag+2
 211  00b1 274a          	jreq	L56
 212  00b3               L76:
 213                     ; 132             ATOMLOG (_STR("Lo%d %d/%d\n"), i, running_flag[0], running_flag[1]);
 215  00b3 ce0006        	ldw	x,L7_running_flag+2
 216  00b6 89            	pushw	x
 217  00b7 ce0004        	ldw	x,L7_running_flag
 218  00ba 89            	pushw	x
 219  00bb 1e0f          	ldw	x,(OFST+3,sp)
 220  00bd 89            	pushw	x
 221  00be ae0034        	ldw	x,#L17
 222  00c1 cd0000        	call	_printf
 224  00c4 5b06          	addw	sp,#6
 225                     ; 133             failures++;
 227  00c6 1e09          	ldw	x,(OFST-3,sp)
 228  00c8 1c0001        	addw	x,#1
 229  00cb 1f09          	ldw	(OFST-3,sp),x
 230                     ; 134             break;
 231  00cd               L36:
 232                     ; 179         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 234  00cd 5f            	clrw	x
 235  00ce 1f0b          	ldw	(OFST-1,sp),x
 236  00d0               L501:
 237                     ; 182             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 239  00d0 96            	ldw	x,sp
 240  00d1 1c0005        	addw	x,#OFST-7
 241  00d4 89            	pushw	x
 242  00d5 96            	ldw	x,sp
 243  00d6 1c0003        	addw	x,#OFST-9
 244  00d9 89            	pushw	x
 245  00da 1e0f          	ldw	x,(OFST+3,sp)
 246  00dc 90ae0017      	ldw	y,#23
 247  00e0 cd0000        	call	c_imul
 249  00e3 1c0108        	addw	x,#L3_tcb
 250  00e6 cd0000        	call	_atomThreadStackCheck
 252  00e9 5b04          	addw	sp,#4
 253  00eb 4d            	tnz	a
 254  00ec 2763          	jreq	L311
 255                     ; 184                 ATOMLOG (_STR("StackCheck\n"));
 257  00ee ae001f        	ldw	x,#L511
 258  00f1 cd0000        	call	_printf
 260                     ; 185                 failures++;
 262  00f4 1e09          	ldw	x,(OFST-3,sp)
 263  00f6 1c0001        	addw	x,#1
 264  00f9 1f09          	ldw	(OFST-3,sp),x
 266  00fb 2078          	jra	L711
 267  00fd               L56:
 268                     ; 146             sleep_request[1] = FALSE;
 270  00fd 5f            	clrw	x
 271  00fe cf0002        	ldw	L11_sleep_request+2,x
 272                     ; 149             running_flag[0] = running_flag[1] = FALSE;
 274  0101 5f            	clrw	x
 275  0102 cf0006        	ldw	L7_running_flag+2,x
 276  0105 5f            	clrw	x
 277  0106 cf0004        	ldw	L7_running_flag,x
 278                     ; 152             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 280  0109 ae0019        	ldw	x,#25
 281  010c 89            	pushw	x
 282  010d ae0000        	ldw	x,#0
 283  0110 89            	pushw	x
 284  0111 cd0000        	call	_atomTimerDelay
 286  0114 5b04          	addw	sp,#4
 287                     ; 155             if ((running_flag[1] != TRUE) || (running_flag[0] != FALSE))
 289  0116 ce0006        	ldw	x,L7_running_flag+2
 290  0119 a30001        	cpw	x,#1
 291  011c 2605          	jrne	L77
 293  011e ce0004        	ldw	x,L7_running_flag
 294  0121 2719          	jreq	L37
 295  0123               L77:
 296                     ; 157                 ATOMLOG (_STR("Hi%d/%d\n"), running_flag[0], running_flag[1]);
 298  0123 ce0006        	ldw	x,L7_running_flag+2
 299  0126 89            	pushw	x
 300  0127 ce0004        	ldw	x,L7_running_flag
 301  012a 89            	pushw	x
 302  012b ae002b        	ldw	x,#L101
 303  012e cd0000        	call	_printf
 305  0131 5b04          	addw	sp,#4
 306                     ; 158                 failures++;
 308  0133 1e09          	ldw	x,(OFST-3,sp)
 309  0135 1c0001        	addw	x,#1
 310  0138 1f09          	ldw	(OFST-3,sp),x
 311                     ; 159                 break;
 313  013a 2091          	jra	L36
 314  013c               L37:
 315                     ; 115     for (i = 0; i < 8; i++)
 317  013c 1e0b          	ldw	x,(OFST-1,sp)
 318  013e 1c0001        	addw	x,#1
 319  0141 1f0b          	ldw	(OFST-1,sp),x
 322  0143 9c            	rvf
 323  0144 1e0b          	ldw	x,(OFST-1,sp)
 324  0146 a30008        	cpw	x,#8
 325  0149 2e03          	jrsge	L6
 326  014b cc007e        	jp	L75
 327  014e               L6:
 328  014e cc00cd        	jra	L36
 329  0151               L311:
 330                     ; 190                 if (free_bytes == 0)
 332  0151 96            	ldw	x,sp
 333  0152 1c0005        	addw	x,#OFST-7
 334  0155 cd0000        	call	c_lzmp
 336  0158 2611          	jrne	L121
 337                     ; 192                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 339  015a 1e0b          	ldw	x,(OFST-1,sp)
 340  015c 89            	pushw	x
 341  015d ae000d        	ldw	x,#L321
 342  0160 cd0000        	call	_printf
 344  0163 85            	popw	x
 345                     ; 193                     failures++;
 347  0164 1e09          	ldw	x,(OFST-3,sp)
 348  0166 1c0001        	addw	x,#1
 349  0169 1f09          	ldw	(OFST-3,sp),x
 350  016b               L121:
 351                     ; 198                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 353  016b 1e03          	ldw	x,(OFST-9,sp)
 354  016d 89            	pushw	x
 355  016e ae0000        	ldw	x,#L521
 356  0171 cd0000        	call	_printf
 358  0174 85            	popw	x
 359  0175               L711:
 360                     ; 179         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 362  0175 1e0b          	ldw	x,(OFST-1,sp)
 363  0177 1c0001        	addw	x,#1
 364  017a 1f0b          	ldw	(OFST-1,sp),x
 367  017c 9c            	rvf
 368  017d 1e0b          	ldw	x,(OFST-1,sp)
 369  017f a30002        	cpw	x,#2
 370  0182 2e03          	jrsge	L01
 371  0184 cc00d0        	jp	L501
 372  0187               L01:
 373                     ; 206     return failures;
 375  0187 1e09          	ldw	x,(OFST-3,sp)
 376  0189 cd0000        	call	c_itolx
 380  018c 5b0c          	addw	sp,#12
 381  018e 81            	ret
 423                     ; 220 static void test_thread_func (uint32_t param)
 423                     ; 221 {
 424                     .text:	section	.text,new
 425  0000               L31_test_thread_func:
 427  0000 89            	pushw	x
 428       00000002      OFST:	set	2
 431                     ; 225     thread_id = (int)param;
 433  0001 1e07          	ldw	x,(OFST+5,sp)
 434  0003 1f01          	ldw	(OFST-1,sp),x
 435  0005               L541:
 436                     ; 231         if (sleep_request[thread_id])
 438  0005 1e01          	ldw	x,(OFST-1,sp)
 439  0007 58            	sllw	x
 440  0008 d60001        	ld	a,(L11_sleep_request+1,x)
 441  000b da0000        	or	a,(L11_sleep_request,x)
 442  000e 270f          	jreq	L151
 443                     ; 233             atomTimerDelay (1);
 445  0010 ae0001        	ldw	x,#1
 446  0013 89            	pushw	x
 447  0014 ae0000        	ldw	x,#0
 448  0017 89            	pushw	x
 449  0018 cd0000        	call	_atomTimerDelay
 451  001b 5b04          	addw	sp,#4
 453  001d 20e6          	jra	L541
 454  001f               L151:
 455                     ; 238             running_flag[thread_id] = TRUE;
 457  001f 1e01          	ldw	x,(OFST-1,sp)
 458  0021 58            	sllw	x
 459  0022 90ae0001      	ldw	y,#1
 460  0026 df0004        	ldw	(L7_running_flag,x),y
 461  0029 20da          	jra	L541
 676                     	switch	.bss
 677  0000               L11_sleep_request:
 678  0000 00000000      	ds.b	4
 679  0004               L7_running_flag:
 680  0004 00000000      	ds.b	4
 681  0008               L5_test_thread_stack:
 682  0008 000000000000  	ds.b	256
 683  0108               L3_tcb:
 684  0108 000000000000  	ds.b	46
 685                     	xdef	_test_start
 686                     	xref	_printf
 687                     	xref	_atomThreadStackCheck
 688                     	xref	_atomThreadCreate
 689                     	xref	_atomTimerDelay
 690                     .const:	section	.text
 691  0000               L521:
 692  0000 537461636b55  	dc.b	"StackUse:%d",10,0
 693  000d               L321:
 694  000d 537461636b4f  	dc.b	"StackOverflow %d",10,0
 695  001f               L511:
 696  001f 537461636b43  	dc.b	"StackCheck",10,0
 697  002b               L101:
 698  002b 486925642f25  	dc.b	"Hi%d/%d",10,0
 699  0034               L17:
 700  0034 4c6f25642025  	dc.b	"Lo%d %d/%d",10,0
 701  0040               L15:
 702  0040 426164207468  	dc.b	"Bad thread create",10,0
 703                     	xref.b	c_x
 723                     	xref	c_itolx
 724                     	xref	c_lzmp
 725                     	xref	c_imul
 726                     	end
