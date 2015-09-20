   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  83                     ; 70 uint32_t test_start (void)
  83                     ; 71 {
  85                     .text:	section	.text,new
  86  0000               _test_start:
  88  0000 520c          	subw	sp,#12
  89       0000000c      OFST:	set	12
  92                     ; 76     failures = 0;
  94  0002 5f            	clrw	x
  95  0003 1f09          	ldw	(OFST-3,sp),x
  96                     ; 79     if (atomMutexCreate (&mutex1) != ATOM_OK)
  98  0005 ae0099        	ldw	x,#L3_mutex1
  99  0008 cd0000        	call	_atomMutexCreate
 101  000b 4d            	tnz	a
 102  000c 2711          	jreq	L74
 103                     ; 81         ATOMLOG (_STR("Error creating mutex\n"));
 105  000e ae00db        	ldw	x,#L15
 106  0011 cd0000        	call	_printf
 108                     ; 82         failures++;
 110  0014 1e09          	ldw	x,(OFST-3,sp)
 111  0016 1c0001        	addw	x,#1
 112  0019 1f09          	ldw	(OFST-3,sp),x
 114  001b ac6f016f      	jpf	L35
 115  001f               L74:
 116                     ; 87         shared_data = 0;
 118  001f 5f            	clrw	x
 119  0020 cf0000        	ldw	L11_shared_data,x
 120                     ; 90         for (i = 0; i < TEST_LOCK_CNT; i++)
 122  0023 5f            	clrw	x
 123  0024 1f0b          	ldw	(OFST-1,sp),x
 124  0026               L55:
 125                     ; 92             if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 127  0026 ae0000        	ldw	x,#0
 128  0029 89            	pushw	x
 129  002a ae0000        	ldw	x,#0
 130  002d 89            	pushw	x
 131  002e ae0099        	ldw	x,#L3_mutex1
 132  0031 cd0000        	call	_atomMutexGet
 134  0034 5b04          	addw	sp,#4
 135  0036 4d            	tnz	a
 136  0037 270f          	jreq	L36
 137                     ; 94                 ATOMLOG (_STR("Error taking mutex\n"));
 139  0039 ae00c7        	ldw	x,#L56
 140  003c cd0000        	call	_printf
 142                     ; 95                 failures++;
 144  003f 1e09          	ldw	x,(OFST-3,sp)
 145  0041 1c0001        	addw	x,#1
 146  0044 1f09          	ldw	(OFST-3,sp),x
 147                     ; 96                 break;
 149  0046 200f          	jra	L16
 150  0048               L36:
 151                     ; 90         for (i = 0; i < TEST_LOCK_CNT; i++)
 153  0048 1e0b          	ldw	x,(OFST-1,sp)
 154  004a 1c0001        	addw	x,#1
 155  004d 1f0b          	ldw	(OFST-1,sp),x
 158  004f 9c            	rvf
 159  0050 1e0b          	ldw	x,(OFST-1,sp)
 160  0052 a300fa        	cpw	x,#250
 161  0055 2fcf          	jrslt	L55
 162  0057               L16:
 163                     ; 102         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 163                     ; 103               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 163                     ; 104               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 165  0057 ae0080        	ldw	x,#128
 166  005a 89            	pushw	x
 167  005b ae0000        	ldw	x,#0
 168  005e 89            	pushw	x
 169  005f ae0081        	ldw	x,#L7_test_thread_stack+127
 170  0062 89            	pushw	x
 171  0063 ae0001        	ldw	x,#1
 172  0066 89            	pushw	x
 173  0067 ae0000        	ldw	x,#0
 174  006a 89            	pushw	x
 175  006b ae0000        	ldw	x,#L31_test_thread_func
 176  006e 89            	pushw	x
 177  006f 4b10          	push	#16
 178  0071 ae0082        	ldw	x,#L5_tcb
 179  0074 cd0000        	call	_atomThreadCreate
 181  0077 5b0d          	addw	sp,#13
 182  0079 4d            	tnz	a
 183  007a 270d          	jreq	L76
 184                     ; 107             ATOMLOG (_STR("Error creating test thread\n"));
 186  007c ae00ab        	ldw	x,#L17
 187  007f cd0000        	call	_printf
 189                     ; 108             failures++;
 191  0082 1e09          	ldw	x,(OFST-3,sp)
 192  0084 1c0001        	addw	x,#1
 193  0087 1f09          	ldw	(OFST-3,sp),x
 194  0089               L76:
 195                     ; 116         for (i = 0; i < 4; i++)
 197  0089 5f            	clrw	x
 198  008a 1f0b          	ldw	(OFST-1,sp),x
 199  008c               L37:
 200                     ; 123             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 202  008c ae0019        	ldw	x,#25
 203  008f 89            	pushw	x
 204  0090 ae0000        	ldw	x,#0
 205  0093 89            	pushw	x
 206  0094 cd0000        	call	_atomTimerDelay
 208  0097 5b04          	addw	sp,#4
 209                     ; 126             if (shared_data != 0)
 211  0099 ce0000        	ldw	x,L11_shared_data
 212  009c 270f          	jreq	L101
 213                     ; 128                 ATOMLOG (_STR("Shared data modified\n"));
 215  009e ae0095        	ldw	x,#L301
 216  00a1 cd0000        	call	_printf
 218                     ; 129                 failures++;
 220  00a4 1e09          	ldw	x,(OFST-3,sp)
 221  00a6 1c0001        	addw	x,#1
 222  00a9 1f09          	ldw	(OFST-3,sp),x
 223                     ; 130                 break;
 225  00ab 200f          	jra	L77
 226  00ad               L101:
 227                     ; 116         for (i = 0; i < 4; i++)
 229  00ad 1e0b          	ldw	x,(OFST-1,sp)
 230  00af 1c0001        	addw	x,#1
 231  00b2 1f0b          	ldw	(OFST-1,sp),x
 234  00b4 9c            	rvf
 235  00b5 1e0b          	ldw	x,(OFST-1,sp)
 236  00b7 a30004        	cpw	x,#4
 237  00ba 2fd0          	jrslt	L37
 238  00bc               L77:
 239                     ; 135         if (failures == 0)
 241  00bc 1e09          	ldw	x,(OFST-3,sp)
 242  00be 2703cc0142    	jrne	L501
 243                     ; 141             for (i = 0; i < TEST_LOCK_CNT-1; i++)
 245  00c3 5f            	clrw	x
 246  00c4 1f0b          	ldw	(OFST-1,sp),x
 247  00c6               L701:
 248                     ; 143                 if (atomMutexPut (&mutex1) != ATOM_OK)
 250  00c6 ae0099        	ldw	x,#L3_mutex1
 251  00c9 cd0000        	call	_atomMutexPut
 253  00cc 4d            	tnz	a
 254  00cd 270d          	jreq	L511
 255                     ; 145                     ATOMLOG (_STR("Failed release\n"));
 257  00cf ae0085        	ldw	x,#L711
 258  00d2 cd0000        	call	_printf
 260                     ; 146                     failures++;
 262  00d5 1e09          	ldw	x,(OFST-3,sp)
 263  00d7 1c0001        	addw	x,#1
 264  00da 1f09          	ldw	(OFST-3,sp),x
 265  00dc               L511:
 266                     ; 141             for (i = 0; i < TEST_LOCK_CNT-1; i++)
 268  00dc 1e0b          	ldw	x,(OFST-1,sp)
 269  00de 1c0001        	addw	x,#1
 270  00e1 1f0b          	ldw	(OFST-1,sp),x
 273  00e3 9c            	rvf
 274  00e4 1e0b          	ldw	x,(OFST-1,sp)
 275  00e6 a300f9        	cpw	x,#249
 276  00e9 2fdb          	jrslt	L701
 277                     ; 155             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 279  00eb ae0019        	ldw	x,#25
 280  00ee 89            	pushw	x
 281  00ef ae0000        	ldw	x,#0
 282  00f2 89            	pushw	x
 283  00f3 cd0000        	call	_atomTimerDelay
 285  00f6 5b04          	addw	sp,#4
 286                     ; 156             if (shared_data != 0)
 288  00f8 ce0000        	ldw	x,L11_shared_data
 289  00fb 270d          	jreq	L121
 290                     ; 158                 ATOMLOG (_STR("Expected unmodified\n"));
 292  00fd ae0070        	ldw	x,#L321
 293  0100 cd0000        	call	_printf
 295                     ; 159                 failures++;
 297  0103 1e09          	ldw	x,(OFST-3,sp)
 298  0105 1c0001        	addw	x,#1
 299  0108 1f09          	ldw	(OFST-3,sp),x
 300  010a               L121:
 301                     ; 166             if (atomMutexPut (&mutex1) != ATOM_OK)
 303  010a ae0099        	ldw	x,#L3_mutex1
 304  010d cd0000        	call	_atomMutexPut
 306  0110 4d            	tnz	a
 307  0111 270d          	jreq	L521
 308                     ; 168                 ATOMLOG (_STR("Failed release\n"));
 310  0113 ae0085        	ldw	x,#L711
 311  0116 cd0000        	call	_printf
 313                     ; 169                 failures++;
 315  0119 1e09          	ldw	x,(OFST-3,sp)
 316  011b 1c0001        	addw	x,#1
 317  011e 1f09          	ldw	(OFST-3,sp),x
 318  0120               L521:
 319                     ; 176             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 321  0120 ae0019        	ldw	x,#25
 322  0123 89            	pushw	x
 323  0124 ae0000        	ldw	x,#0
 324  0127 89            	pushw	x
 325  0128 cd0000        	call	_atomTimerDelay
 327  012b 5b04          	addw	sp,#4
 328                     ; 177             if (shared_data != 1)
 330  012d ce0000        	ldw	x,L11_shared_data
 331  0130 a30001        	cpw	x,#1
 332  0133 270d          	jreq	L501
 333                     ; 179                 ATOMLOG (_STR("Expected modified\n"));
 335  0135 ae005d        	ldw	x,#L131
 336  0138 cd0000        	call	_printf
 338                     ; 180                 failures++;
 340  013b 1e09          	ldw	x,(OFST-3,sp)
 341  013d 1c0001        	addw	x,#1
 342  0140 1f09          	ldw	(OFST-3,sp),x
 343  0142               L501:
 344                     ; 191         if (atomMutexPut (&mutex1) != ATOM_ERR_OWNERSHIP)
 346  0142 ae0099        	ldw	x,#L3_mutex1
 347  0145 cd0000        	call	_atomMutexPut
 349  0148 a1cf          	cp	a,#207
 350  014a 270d          	jreq	L331
 351                     ; 193             ATOMLOG (_STR("Failed locked+1 release\n"));
 353  014c ae0044        	ldw	x,#L531
 354  014f cd0000        	call	_printf
 356                     ; 194             failures++;
 358  0152 1e09          	ldw	x,(OFST-3,sp)
 359  0154 1c0001        	addw	x,#1
 360  0157 1f09          	ldw	(OFST-3,sp),x
 361  0159               L331:
 362                     ; 198         if (atomMutexDelete (&mutex1) != ATOM_OK)
 364  0159 ae0099        	ldw	x,#L3_mutex1
 365  015c cd0000        	call	_atomMutexDelete
 367  015f 4d            	tnz	a
 368  0160 270d          	jreq	L35
 369                     ; 200             ATOMLOG (_STR("Delete failed\n"));
 371  0162 ae0035        	ldw	x,#L141
 372  0165 cd0000        	call	_printf
 374                     ; 201             failures++;
 376  0168 1e09          	ldw	x,(OFST-3,sp)
 377  016a 1c0001        	addw	x,#1
 378  016d 1f09          	ldw	(OFST-3,sp),x
 379  016f               L35:
 380                     ; 212         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 382  016f 5f            	clrw	x
 383  0170 1f0b          	ldw	(OFST-1,sp),x
 384  0172               L341:
 385                     ; 215             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 387  0172 96            	ldw	x,sp
 388  0173 1c0005        	addw	x,#OFST-7
 389  0176 89            	pushw	x
 390  0177 96            	ldw	x,sp
 391  0178 1c0003        	addw	x,#OFST-9
 392  017b 89            	pushw	x
 393  017c 1e0f          	ldw	x,(OFST+3,sp)
 394  017e 90ae0017      	ldw	y,#23
 395  0182 cd0000        	call	c_imul
 397  0185 1c0082        	addw	x,#L5_tcb
 398  0188 cd0000        	call	_atomThreadStackCheck
 400  018b 5b04          	addw	sp,#4
 401  018d 4d            	tnz	a
 402  018e 270f          	jreq	L151
 403                     ; 217                 ATOMLOG (_STR("StackCheck\n"));
 405  0190 ae0029        	ldw	x,#L351
 406  0193 cd0000        	call	_printf
 408                     ; 218                 failures++;
 410  0196 1e09          	ldw	x,(OFST-3,sp)
 411  0198 1c0001        	addw	x,#1
 412  019b 1f09          	ldw	(OFST-3,sp),x
 414  019d 2024          	jra	L551
 415  019f               L151:
 416                     ; 223                 if (free_bytes == 0)
 418  019f 96            	ldw	x,sp
 419  01a0 1c0005        	addw	x,#OFST-7
 420  01a3 cd0000        	call	c_lzmp
 422  01a6 2611          	jrne	L751
 423                     ; 225                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 425  01a8 1e0b          	ldw	x,(OFST-1,sp)
 426  01aa 89            	pushw	x
 427  01ab ae0017        	ldw	x,#L161
 428  01ae cd0000        	call	_printf
 430  01b1 85            	popw	x
 431                     ; 226                     failures++;
 433  01b2 1e09          	ldw	x,(OFST-3,sp)
 434  01b4 1c0001        	addw	x,#1
 435  01b7 1f09          	ldw	(OFST-3,sp),x
 436  01b9               L751:
 437                     ; 231                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 439  01b9 1e03          	ldw	x,(OFST-9,sp)
 440  01bb 89            	pushw	x
 441  01bc ae000a        	ldw	x,#L361
 442  01bf cd0000        	call	_printf
 444  01c2 85            	popw	x
 445  01c3               L551:
 446                     ; 212         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 448  01c3 1e0b          	ldw	x,(OFST-1,sp)
 449  01c5 1c0001        	addw	x,#1
 450  01c8 1f0b          	ldw	(OFST-1,sp),x
 453  01ca 9c            	rvf
 454  01cb 1e0b          	ldw	x,(OFST-1,sp)
 455  01cd a30001        	cpw	x,#1
 456  01d0 2fa0          	jrslt	L341
 457                     ; 239     return failures;
 459  01d2 1e09          	ldw	x,(OFST-3,sp)
 460  01d4 cd0000        	call	c_itolx
 464  01d7 5b0c          	addw	sp,#12
 465  01d9 81            	ret
 510                     ; 253 static void test_thread_func (uint32_t param)
 510                     ; 254 {
 511                     .text:	section	.text,new
 512  0000               L31_test_thread_func:
 514  0000 88            	push	a
 515       00000001      OFST:	set	1
 518                     ; 258     param = param;
 520  0001 96            	ldw	x,sp
 521  0002 1c0004        	addw	x,#OFST+3
 522  0005 cd0000        	call	c_ltor
 524  0008               L302:
 525                     ; 264         if ((status = atomMutexGet (&mutex1, 0)) != ATOM_OK)
 527  0008 ae0000        	ldw	x,#0
 528  000b 89            	pushw	x
 529  000c ae0000        	ldw	x,#0
 530  000f 89            	pushw	x
 531  0010 ae0099        	ldw	x,#L3_mutex1
 532  0013 cd0000        	call	_atomMutexGet
 534  0016 5b04          	addw	sp,#4
 535  0018 6b01          	ld	(OFST+0,sp),a
 536  001a 270c          	jreq	L702
 537                     ; 267             ATOMLOG (_STR("G%d\n"), status);
 539  001c 7b01          	ld	a,(OFST+0,sp)
 540  001e 88            	push	a
 541  001f ae0005        	ldw	x,#L112
 542  0022 cd0000        	call	_printf
 544  0025 84            	pop	a
 545                     ; 268             break;
 547  0026 201a          	jra	L122
 548  0028               L702:
 549                     ; 275             shared_data = 1;
 551  0028 ae0001        	ldw	x,#1
 552  002b cf0000        	ldw	L11_shared_data,x
 553                     ; 278             if ((status = atomMutexPut (&mutex1)) != ATOM_OK)
 555  002e ae0099        	ldw	x,#L3_mutex1
 556  0031 cd0000        	call	_atomMutexPut
 558  0034 6b01          	ld	(OFST+0,sp),a
 559  0036 27d0          	jreq	L302
 560                     ; 281                 ATOMLOG (_STR("P%d\n"), status);
 562  0038 7b01          	ld	a,(OFST+0,sp)
 563  003a 88            	push	a
 564  003b ae0000        	ldw	x,#L712
 565  003e cd0000        	call	_printf
 567  0041 84            	pop	a
 568                     ; 282                 break;
 569  0042               L122:
 570                     ; 291         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 572  0042 ae0064        	ldw	x,#100
 573  0045 89            	pushw	x
 574  0046 ae0000        	ldw	x,#0
 575  0049 89            	pushw	x
 576  004a cd0000        	call	_atomTimerDelay
 578  004d 5b04          	addw	sp,#4
 580  004f 20f1          	jra	L122
 832                     	switch	.bss
 833  0000               L11_shared_data:
 834  0000 0000          	ds.b	2
 835  0002               L7_test_thread_stack:
 836  0002 000000000000  	ds.b	128
 837  0082               L5_tcb:
 838  0082 000000000000  	ds.b	23
 839  0099               L3_mutex1:
 840  0099 0000000000    	ds.b	5
 841                     	xref	_atomMutexPut
 842                     	xref	_atomMutexGet
 843                     	xref	_atomMutexDelete
 844                     	xref	_atomMutexCreate
 845                     	xdef	_test_start
 846                     	xref	_printf
 847                     	xref	_atomThreadStackCheck
 848                     	xref	_atomThreadCreate
 849                     	xref	_atomTimerDelay
 850                     .const:	section	.text
 851  0000               L712:
 852  0000 5025640a00    	dc.b	"P%d",10,0
 853  0005               L112:
 854  0005 4725640a00    	dc.b	"G%d",10,0
 855  000a               L361:
 856  000a 537461636b55  	dc.b	"StackUse:%d",10,0
 857  0017               L161:
 858  0017 537461636b4f  	dc.b	"StackOverflow %d",10,0
 859  0029               L351:
 860  0029 537461636b43  	dc.b	"StackCheck",10,0
 861  0035               L141:
 862  0035 44656c657465  	dc.b	"Delete failed",10,0
 863  0044               L531:
 864  0044 4661696c6564  	dc.b	"Failed locked+1 re"
 865  0056 6c656173650a  	dc.b	"lease",10,0
 866  005d               L131:
 867  005d 457870656374  	dc.b	"Expected modified",10,0
 868  0070               L321:
 869  0070 457870656374  	dc.b	"Expected unmodifie"
 870  0082 640a00        	dc.b	"d",10,0
 871  0085               L711:
 872  0085 4661696c6564  	dc.b	"Failed release",10,0
 873  0095               L301:
 874  0095 536861726564  	dc.b	"Shared data modifi"
 875  00a7 65640a00      	dc.b	"ed",10,0
 876  00ab               L17:
 877  00ab 4572726f7220  	dc.b	"Error creating tes"
 878  00bd 742074687265  	dc.b	"t thread",10,0
 879  00c7               L56:
 880  00c7 4572726f7220  	dc.b	"Error taking mutex"
 881  00d9 0a00          	dc.b	10,0
 882  00db               L15:
 883  00db 4572726f7220  	dc.b	"Error creating mut"
 884  00ed 65780a00      	dc.b	"ex",10,0
 885                     	xref.b	c_x
 905                     	xref	c_ltor
 906                     	xref	c_itolx
 907                     	xref	c_lzmp
 908                     	xref	c_imul
 909                     	end
