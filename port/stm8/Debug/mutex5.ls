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
 105  000e ae00c7        	ldw	x,#L15
 106  0011 cd0000        	call	_printf
 108                     ; 82         failures++;
 110  0014 1e09          	ldw	x,(OFST-3,sp)
 111  0016 1c0001        	addw	x,#1
 112  0019 1f09          	ldw	(OFST-3,sp),x
 114  001b ac720172      	jpf	L35
 115  001f               L74:
 116                     ; 87         shared_data = 0;
 118  001f 5f            	clrw	x
 119  0020 cf0000        	ldw	L11_shared_data,x
 120                     ; 90         if (atomMutexGet (&mutex1, 0) != ATOM_OK)
 122  0023 ae0000        	ldw	x,#0
 123  0026 89            	pushw	x
 124  0027 ae0000        	ldw	x,#0
 125  002a 89            	pushw	x
 126  002b ae0099        	ldw	x,#L3_mutex1
 127  002e cd0000        	call	_atomMutexGet
 129  0031 5b04          	addw	sp,#4
 130  0033 4d            	tnz	a
 131  0034 270f          	jreq	L55
 132                     ; 92             ATOMLOG (_STR("Error taking mutex\n"));
 134  0036 ae00b3        	ldw	x,#L75
 135  0039 cd0000        	call	_printf
 137                     ; 93             failures++;
 139  003c 1e09          	ldw	x,(OFST-3,sp)
 140  003e 1c0001        	addw	x,#1
 141  0041 1f09          	ldw	(OFST-3,sp),x
 143  0043 2032          	jra	L16
 144  0045               L55:
 145                     ; 97         else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 145                     ; 98               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 145                     ; 99               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 147  0045 ae0080        	ldw	x,#128
 148  0048 89            	pushw	x
 149  0049 ae0000        	ldw	x,#0
 150  004c 89            	pushw	x
 151  004d ae0081        	ldw	x,#L7_test_thread_stack+127
 152  0050 89            	pushw	x
 153  0051 ae0001        	ldw	x,#1
 154  0054 89            	pushw	x
 155  0055 ae0000        	ldw	x,#0
 156  0058 89            	pushw	x
 157  0059 ae0000        	ldw	x,#L31_test_thread_func
 158  005c 89            	pushw	x
 159  005d 4b10          	push	#16
 160  005f ae0082        	ldw	x,#L5_tcb
 161  0062 cd0000        	call	_atomThreadCreate
 163  0065 5b0d          	addw	sp,#13
 164  0067 4d            	tnz	a
 165  0068 270d          	jreq	L16
 166                     ; 102             ATOMLOG (_STR("Error creating test thread\n"));
 168  006a ae0097        	ldw	x,#L56
 169  006d cd0000        	call	_printf
 171                     ; 103             failures++;
 173  0070 1e09          	ldw	x,(OFST-3,sp)
 174  0072 1c0001        	addw	x,#1
 175  0075 1f09          	ldw	(OFST-3,sp),x
 176  0077               L16:
 177                     ; 111         for (i = 0; i < 4; i++)
 179  0077 5f            	clrw	x
 180  0078 1f0b          	ldw	(OFST-1,sp),x
 181  007a               L76:
 182                     ; 118             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 184  007a ae0019        	ldw	x,#25
 185  007d 89            	pushw	x
 186  007e ae0000        	ldw	x,#0
 187  0081 89            	pushw	x
 188  0082 cd0000        	call	_atomTimerDelay
 190  0085 5b04          	addw	sp,#4
 191                     ; 121             if (shared_data != 0)
 193  0087 ce0000        	ldw	x,L11_shared_data
 194  008a 270f          	jreq	L57
 195                     ; 123                 ATOMLOG (_STR("Shared data modified\n"));
 197  008c ae0081        	ldw	x,#L77
 198  008f cd0000        	call	_printf
 200                     ; 124                 failures++;
 202  0092 1e09          	ldw	x,(OFST-3,sp)
 203  0094 1c0001        	addw	x,#1
 204  0097 1f09          	ldw	(OFST-3,sp),x
 205                     ; 125                 break;
 207  0099 200f          	jra	L37
 208  009b               L57:
 209                     ; 111         for (i = 0; i < 4; i++)
 211  009b 1e0b          	ldw	x,(OFST-1,sp)
 212  009d 1c0001        	addw	x,#1
 213  00a0 1f0b          	ldw	(OFST-1,sp),x
 216  00a2 9c            	rvf
 217  00a3 1e0b          	ldw	x,(OFST-1,sp)
 218  00a5 a30004        	cpw	x,#4
 219  00a8 2fd0          	jrslt	L76
 220  00aa               L37:
 221                     ; 130         if (failures == 0)
 223  00aa 1e09          	ldw	x,(OFST-3,sp)
 224  00ac 2703          	jreq	L6
 225  00ae cc015c        	jp	L101
 226  00b1               L6:
 227                     ; 136             if (atomMutexPut (&mutex1) != ATOM_OK)
 229  00b1 ae0099        	ldw	x,#L3_mutex1
 230  00b4 cd0000        	call	_atomMutexPut
 232  00b7 4d            	tnz	a
 233  00b8 270d          	jreq	L301
 234                     ; 138                 ATOMLOG (_STR("Failed release\n"));
 236  00ba ae0071        	ldw	x,#L501
 237  00bd cd0000        	call	_printf
 239                     ; 139                 failures++;
 241  00c0 1e09          	ldw	x,(OFST-3,sp)
 242  00c2 1c0001        	addw	x,#1
 243  00c5 1f09          	ldw	(OFST-3,sp),x
 244  00c7               L301:
 245                     ; 146             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 247  00c7 ae0019        	ldw	x,#25
 248  00ca 89            	pushw	x
 249  00cb ae0000        	ldw	x,#0
 250  00ce 89            	pushw	x
 251  00cf cd0000        	call	_atomTimerDelay
 253  00d2 5b04          	addw	sp,#4
 254                     ; 147             if (shared_data != 1)
 256  00d4 ce0000        	ldw	x,L11_shared_data
 257  00d7 a30001        	cpw	x,#1
 258  00da 270d          	jreq	L701
 259                     ; 149                 ATOMLOG (_STR("Expected modify\n"));
 261  00dc ae0060        	ldw	x,#L111
 262  00df cd0000        	call	_printf
 264                     ; 150                 failures++;
 266  00e2 1e09          	ldw	x,(OFST-3,sp)
 267  00e4 1c0001        	addw	x,#1
 268  00e7 1f09          	ldw	(OFST-3,sp),x
 269  00e9               L701:
 270                     ; 157             for (i = 0; i < 4; i++)
 272  00e9 5f            	clrw	x
 273  00ea 1f0b          	ldw	(OFST-1,sp),x
 274  00ec               L311:
 275                     ; 163                 if (atomMutexGet (&mutex1, SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 277  00ec ae0064        	ldw	x,#100
 278  00ef 89            	pushw	x
 279  00f0 ae0000        	ldw	x,#0
 280  00f3 89            	pushw	x
 281  00f4 ae0099        	ldw	x,#L3_mutex1
 282  00f7 cd0000        	call	_atomMutexGet
 284  00fa 5b04          	addw	sp,#4
 285  00fc 4d            	tnz	a
 286  00fd 2713          	jreq	L121
 287                     ; 165                     ATOMLOG (_STR("Retake %d\n"), i);
 289  00ff 1e0b          	ldw	x,(OFST-1,sp)
 290  0101 89            	pushw	x
 291  0102 ae0055        	ldw	x,#L321
 292  0105 cd0000        	call	_printf
 294  0108 85            	popw	x
 295                     ; 166                     failures++;
 297  0109 1e09          	ldw	x,(OFST-3,sp)
 298  010b 1c0001        	addw	x,#1
 299  010e 1f09          	ldw	(OFST-3,sp),x
 300                     ; 167                     break;
 302  0110 204a          	jra	L101
 303  0112               L121:
 304                     ; 176                     shared_data = 0;
 306  0112 5f            	clrw	x
 307  0113 cf0000        	ldw	L11_shared_data,x
 308                     ; 179                     atomTimerDelay(SYSTEM_TICKS_PER_SEC/4);
 310  0116 ae0019        	ldw	x,#25
 311  0119 89            	pushw	x
 312  011a ae0000        	ldw	x,#0
 313  011d 89            	pushw	x
 314  011e cd0000        	call	_atomTimerDelay
 316  0121 5b04          	addw	sp,#4
 317                     ; 185                     if (shared_data != 0)
 319  0123 ce0000        	ldw	x,L11_shared_data
 320  0126 270f          	jreq	L721
 321                     ; 188                         ATOMLOG (_STR("Still modifying\n"));
 323  0128 ae0044        	ldw	x,#L131
 324  012b cd0000        	call	_printf
 326                     ; 189                         failures++;
 328  012e 1e09          	ldw	x,(OFST-3,sp)
 329  0130 1c0001        	addw	x,#1
 330  0133 1f09          	ldw	(OFST-3,sp),x
 331                     ; 190                         break;
 333  0135 2025          	jra	L101
 334  0137               L721:
 335                     ; 197                     if (atomMutexPut (&mutex1) != ATOM_OK)
 337  0137 ae0099        	ldw	x,#L3_mutex1
 338  013a cd0000        	call	_atomMutexPut
 340  013d 4d            	tnz	a
 341  013e 270d          	jreq	L521
 342                     ; 199                         ATOMLOG (_STR("Failed release\n"));
 344  0140 ae0071        	ldw	x,#L501
 345  0143 cd0000        	call	_printf
 347                     ; 200                         failures++;
 349  0146 1e09          	ldw	x,(OFST-3,sp)
 350  0148 1c0001        	addw	x,#1
 351  014b 1f09          	ldw	(OFST-3,sp),x
 352  014d               L521:
 353                     ; 157             for (i = 0; i < 4; i++)
 355  014d 1e0b          	ldw	x,(OFST-1,sp)
 356  014f 1c0001        	addw	x,#1
 357  0152 1f0b          	ldw	(OFST-1,sp),x
 360  0154 9c            	rvf
 361  0155 1e0b          	ldw	x,(OFST-1,sp)
 362  0157 a30004        	cpw	x,#4
 363  015a 2f90          	jrslt	L311
 364  015c               L101:
 365                     ; 207         if (atomMutexDelete (&mutex1) != ATOM_OK)
 367  015c ae0099        	ldw	x,#L3_mutex1
 368  015f cd0000        	call	_atomMutexDelete
 370  0162 4d            	tnz	a
 371  0163 270d          	jreq	L35
 372                     ; 209             ATOMLOG (_STR("Delete failed\n"));
 374  0165 ae0035        	ldw	x,#L731
 375  0168 cd0000        	call	_printf
 377                     ; 210             failures++;
 379  016b 1e09          	ldw	x,(OFST-3,sp)
 380  016d 1c0001        	addw	x,#1
 381  0170 1f09          	ldw	(OFST-3,sp),x
 382  0172               L35:
 383                     ; 221         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 385  0172 5f            	clrw	x
 386  0173 1f0b          	ldw	(OFST-1,sp),x
 387  0175               L141:
 388                     ; 224             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 390  0175 96            	ldw	x,sp
 391  0176 1c0005        	addw	x,#OFST-7
 392  0179 89            	pushw	x
 393  017a 96            	ldw	x,sp
 394  017b 1c0003        	addw	x,#OFST-9
 395  017e 89            	pushw	x
 396  017f 1e0f          	ldw	x,(OFST+3,sp)
 397  0181 90ae0017      	ldw	y,#23
 398  0185 cd0000        	call	c_imul
 400  0188 1c0082        	addw	x,#L5_tcb
 401  018b cd0000        	call	_atomThreadStackCheck
 403  018e 5b04          	addw	sp,#4
 404  0190 4d            	tnz	a
 405  0191 270f          	jreq	L741
 406                     ; 226                 ATOMLOG (_STR("StackCheck\n"));
 408  0193 ae0029        	ldw	x,#L151
 409  0196 cd0000        	call	_printf
 411                     ; 227                 failures++;
 413  0199 1e09          	ldw	x,(OFST-3,sp)
 414  019b 1c0001        	addw	x,#1
 415  019e 1f09          	ldw	(OFST-3,sp),x
 417  01a0 2024          	jra	L351
 418  01a2               L741:
 419                     ; 232                 if (free_bytes == 0)
 421  01a2 96            	ldw	x,sp
 422  01a3 1c0005        	addw	x,#OFST-7
 423  01a6 cd0000        	call	c_lzmp
 425  01a9 2611          	jrne	L551
 426                     ; 234                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 428  01ab 1e0b          	ldw	x,(OFST-1,sp)
 429  01ad 89            	pushw	x
 430  01ae ae0017        	ldw	x,#L751
 431  01b1 cd0000        	call	_printf
 433  01b4 85            	popw	x
 434                     ; 235                     failures++;
 436  01b5 1e09          	ldw	x,(OFST-3,sp)
 437  01b7 1c0001        	addw	x,#1
 438  01ba 1f09          	ldw	(OFST-3,sp),x
 439  01bc               L551:
 440                     ; 240                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 442  01bc 1e03          	ldw	x,(OFST-9,sp)
 443  01be 89            	pushw	x
 444  01bf ae000a        	ldw	x,#L161
 445  01c2 cd0000        	call	_printf
 447  01c5 85            	popw	x
 448  01c6               L351:
 449                     ; 221         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 451  01c6 1e0b          	ldw	x,(OFST-1,sp)
 452  01c8 1c0001        	addw	x,#1
 453  01cb 1f0b          	ldw	(OFST-1,sp),x
 456  01cd 9c            	rvf
 457  01ce 1e0b          	ldw	x,(OFST-1,sp)
 458  01d0 a30001        	cpw	x,#1
 459  01d3 2fa0          	jrslt	L141
 460                     ; 248     return failures;
 462  01d5 1e09          	ldw	x,(OFST-3,sp)
 463  01d7 cd0000        	call	c_itolx
 467  01da 5b0c          	addw	sp,#12
 468  01dc 81            	ret
 513                     ; 262 static void test_thread_func (uint32_t param)
 513                     ; 263 {
 514                     .text:	section	.text,new
 515  0000               L31_test_thread_func:
 517  0000 88            	push	a
 518       00000001      OFST:	set	1
 521                     ; 267     param = param;
 523  0001 96            	ldw	x,sp
 524  0002 1c0004        	addw	x,#OFST+3
 525  0005 cd0000        	call	c_ltor
 527  0008               L102:
 528                     ; 273         if ((status = atomMutexGet (&mutex1, 0)) != ATOM_OK)
 530  0008 ae0000        	ldw	x,#0
 531  000b 89            	pushw	x
 532  000c ae0000        	ldw	x,#0
 533  000f 89            	pushw	x
 534  0010 ae0099        	ldw	x,#L3_mutex1
 535  0013 cd0000        	call	_atomMutexGet
 537  0016 5b04          	addw	sp,#4
 538  0018 6b01          	ld	(OFST+0,sp),a
 539  001a 270c          	jreq	L502
 540                     ; 276             ATOMLOG (_STR("G%d\n"), status);
 542  001c 7b01          	ld	a,(OFST+0,sp)
 543  001e 88            	push	a
 544  001f ae0005        	ldw	x,#L702
 545  0022 cd0000        	call	_printf
 547  0025 84            	pop	a
 548                     ; 277             break;
 550  0026 201a          	jra	L712
 551  0028               L502:
 552                     ; 284             shared_data = 1;
 554  0028 ae0001        	ldw	x,#1
 555  002b cf0000        	ldw	L11_shared_data,x
 556                     ; 287             if ((status = atomMutexPut (&mutex1)) != ATOM_OK)
 558  002e ae0099        	ldw	x,#L3_mutex1
 559  0031 cd0000        	call	_atomMutexPut
 561  0034 6b01          	ld	(OFST+0,sp),a
 562  0036 27d0          	jreq	L102
 563                     ; 290                 ATOMLOG (_STR("P%d\n"), status);
 565  0038 7b01          	ld	a,(OFST+0,sp)
 566  003a 88            	push	a
 567  003b ae0000        	ldw	x,#L512
 568  003e cd0000        	call	_printf
 570  0041 84            	pop	a
 571                     ; 291                 break;
 572  0042               L712:
 573                     ; 300         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 575  0042 ae0064        	ldw	x,#100
 576  0045 89            	pushw	x
 577  0046 ae0000        	ldw	x,#0
 578  0049 89            	pushw	x
 579  004a cd0000        	call	_atomTimerDelay
 581  004d 5b04          	addw	sp,#4
 583  004f 20f1          	jra	L712
 835                     	switch	.bss
 836  0000               L11_shared_data:
 837  0000 0000          	ds.b	2
 838  0002               L7_test_thread_stack:
 839  0002 000000000000  	ds.b	128
 840  0082               L5_tcb:
 841  0082 000000000000  	ds.b	23
 842  0099               L3_mutex1:
 843  0099 0000000000    	ds.b	5
 844                     	xref	_atomMutexPut
 845                     	xref	_atomMutexGet
 846                     	xref	_atomMutexDelete
 847                     	xref	_atomMutexCreate
 848                     	xdef	_test_start
 849                     	xref	_printf
 850                     	xref	_atomThreadStackCheck
 851                     	xref	_atomThreadCreate
 852                     	xref	_atomTimerDelay
 853                     .const:	section	.text
 854  0000               L512:
 855  0000 5025640a00    	dc.b	"P%d",10,0
 856  0005               L702:
 857  0005 4725640a00    	dc.b	"G%d",10,0
 858  000a               L161:
 859  000a 537461636b55  	dc.b	"StackUse:%d",10,0
 860  0017               L751:
 861  0017 537461636b4f  	dc.b	"StackOverflow %d",10,0
 862  0029               L151:
 863  0029 537461636b43  	dc.b	"StackCheck",10,0
 864  0035               L731:
 865  0035 44656c657465  	dc.b	"Delete failed",10,0
 866  0044               L131:
 867  0044 5374696c6c20  	dc.b	"Still modifying",10,0
 868  0055               L321:
 869  0055 526574616b65  	dc.b	"Retake %d",10,0
 870  0060               L111:
 871  0060 457870656374  	dc.b	"Expected modify",10,0
 872  0071               L501:
 873  0071 4661696c6564  	dc.b	"Failed release",10,0
 874  0081               L77:
 875  0081 536861726564  	dc.b	"Shared data modifi"
 876  0093 65640a00      	dc.b	"ed",10,0
 877  0097               L56:
 878  0097 4572726f7220  	dc.b	"Error creating tes"
 879  00a9 742074687265  	dc.b	"t thread",10,0
 880  00b3               L75:
 881  00b3 4572726f7220  	dc.b	"Error taking mutex"
 882  00c5 0a00          	dc.b	10,0
 883  00c7               L15:
 884  00c7 4572726f7220  	dc.b	"Error creating mut"
 885  00d9 65780a00      	dc.b	"ex",10,0
 886                     	xref.b	c_x
 906                     	xref	c_ltor
 907                     	xref	c_itolx
 908                     	xref	c_lzmp
 909                     	xref	c_imul
 910                     	end
