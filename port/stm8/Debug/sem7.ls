   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  83                     ; 75 uint32_t test_start (void)
  83                     ; 76 {
  85                     .text:	section	.text,new
  86  0000               _test_start:
  88  0000 520c          	subw	sp,#12
  89       0000000c      OFST:	set	12
  92                     ; 81     failures = 0;
  94  0002 5f            	clrw	x
  95  0003 1f09          	ldw	(OFST-3,sp),x
  96                     ; 84     if (atomSemCreate (&sem1, 1) != ATOM_OK)
  98  0005 4b01          	push	#1
  99  0007 ae0099        	ldw	x,#L3_sem1
 100  000a cd0000        	call	_atomSemCreate
 102  000d 5b01          	addw	sp,#1
 103  000f 4d            	tnz	a
 104  0010 2711          	jreq	L74
 105                     ; 86         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 107  0012 ae00c7        	ldw	x,#L15
 108  0015 cd0000        	call	_printf
 110                     ; 87         failures++;
 112  0018 1e09          	ldw	x,(OFST-3,sp)
 113  001a 1c0001        	addw	x,#1
 114  001d 1f09          	ldw	(OFST-3,sp),x
 116  001f ac760176      	jpf	L35
 117  0023               L74:
 118                     ; 92         shared_data = 0;
 120  0023 5f            	clrw	x
 121  0024 cf0000        	ldw	L11_shared_data,x
 122                     ; 95         if (atomSemGet (&sem1, 0) != ATOM_OK)
 124  0027 ae0000        	ldw	x,#0
 125  002a 89            	pushw	x
 126  002b ae0000        	ldw	x,#0
 127  002e 89            	pushw	x
 128  002f ae0099        	ldw	x,#L3_sem1
 129  0032 cd0000        	call	_atomSemGet
 131  0035 5b04          	addw	sp,#4
 132  0037 4d            	tnz	a
 133  0038 270f          	jreq	L55
 134                     ; 97             ATOMLOG (_STR("Error taking mutex\n"));
 136  003a ae00b3        	ldw	x,#L75
 137  003d cd0000        	call	_printf
 139                     ; 98             failures++;
 141  0040 1e09          	ldw	x,(OFST-3,sp)
 142  0042 1c0001        	addw	x,#1
 143  0045 1f09          	ldw	(OFST-3,sp),x
 145  0047 2032          	jra	L16
 146  0049               L55:
 147                     ; 102         else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 147                     ; 103               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 147                     ; 104               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 149  0049 ae0080        	ldw	x,#128
 150  004c 89            	pushw	x
 151  004d ae0000        	ldw	x,#0
 152  0050 89            	pushw	x
 153  0051 ae0081        	ldw	x,#L7_test_thread_stack+127
 154  0054 89            	pushw	x
 155  0055 ae0001        	ldw	x,#1
 156  0058 89            	pushw	x
 157  0059 ae0000        	ldw	x,#0
 158  005c 89            	pushw	x
 159  005d ae0000        	ldw	x,#L31_test_thread_func
 160  0060 89            	pushw	x
 161  0061 4b10          	push	#16
 162  0063 ae0082        	ldw	x,#L5_tcb
 163  0066 cd0000        	call	_atomThreadCreate
 165  0069 5b0d          	addw	sp,#13
 166  006b 4d            	tnz	a
 167  006c 270d          	jreq	L16
 168                     ; 107             ATOMLOG (_STR("Error creating test thread\n"));
 170  006e ae0097        	ldw	x,#L56
 171  0071 cd0000        	call	_printf
 173                     ; 108             failures++;
 175  0074 1e09          	ldw	x,(OFST-3,sp)
 176  0076 1c0001        	addw	x,#1
 177  0079 1f09          	ldw	(OFST-3,sp),x
 178  007b               L16:
 179                     ; 117         for (i = 0; i < 4; i++)
 181  007b 5f            	clrw	x
 182  007c 1f0b          	ldw	(OFST-1,sp),x
 183  007e               L76:
 184                     ; 124             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 186  007e ae0019        	ldw	x,#25
 187  0081 89            	pushw	x
 188  0082 ae0000        	ldw	x,#0
 189  0085 89            	pushw	x
 190  0086 cd0000        	call	_atomTimerDelay
 192  0089 5b04          	addw	sp,#4
 193                     ; 127             if (shared_data != 0)
 195  008b ce0000        	ldw	x,L11_shared_data
 196  008e 270f          	jreq	L57
 197                     ; 129                 ATOMLOG (_STR("Shared data modified\n"));
 199  0090 ae0081        	ldw	x,#L77
 200  0093 cd0000        	call	_printf
 202                     ; 130                 failures++;
 204  0096 1e09          	ldw	x,(OFST-3,sp)
 205  0098 1c0001        	addw	x,#1
 206  009b 1f09          	ldw	(OFST-3,sp),x
 207                     ; 131                 break;
 209  009d 200f          	jra	L37
 210  009f               L57:
 211                     ; 117         for (i = 0; i < 4; i++)
 213  009f 1e0b          	ldw	x,(OFST-1,sp)
 214  00a1 1c0001        	addw	x,#1
 215  00a4 1f0b          	ldw	(OFST-1,sp),x
 218  00a6 9c            	rvf
 219  00a7 1e0b          	ldw	x,(OFST-1,sp)
 220  00a9 a30004        	cpw	x,#4
 221  00ac 2fd0          	jrslt	L76
 222  00ae               L37:
 223                     ; 136         if (failures == 0)
 225  00ae 1e09          	ldw	x,(OFST-3,sp)
 226  00b0 2703          	jreq	L6
 227  00b2 cc0160        	jp	L101
 228  00b5               L6:
 229                     ; 142             if (atomSemPut (&sem1) != ATOM_OK)
 231  00b5 ae0099        	ldw	x,#L3_sem1
 232  00b8 cd0000        	call	_atomSemPut
 234  00bb 4d            	tnz	a
 235  00bc 270d          	jreq	L301
 236                     ; 144                 ATOMLOG (_STR("Failed release\n"));
 238  00be ae0071        	ldw	x,#L501
 239  00c1 cd0000        	call	_printf
 241                     ; 145                 failures++;
 243  00c4 1e09          	ldw	x,(OFST-3,sp)
 244  00c6 1c0001        	addw	x,#1
 245  00c9 1f09          	ldw	(OFST-3,sp),x
 246  00cb               L301:
 247                     ; 152             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 249  00cb ae0019        	ldw	x,#25
 250  00ce 89            	pushw	x
 251  00cf ae0000        	ldw	x,#0
 252  00d2 89            	pushw	x
 253  00d3 cd0000        	call	_atomTimerDelay
 255  00d6 5b04          	addw	sp,#4
 256                     ; 153             if (shared_data != 1)
 258  00d8 ce0000        	ldw	x,L11_shared_data
 259  00db a30001        	cpw	x,#1
 260  00de 270d          	jreq	L701
 261                     ; 155                 ATOMLOG (_STR("Expected modify\n"));
 263  00e0 ae0060        	ldw	x,#L111
 264  00e3 cd0000        	call	_printf
 266                     ; 156                 failures++;
 268  00e6 1e09          	ldw	x,(OFST-3,sp)
 269  00e8 1c0001        	addw	x,#1
 270  00eb 1f09          	ldw	(OFST-3,sp),x
 271  00ed               L701:
 272                     ; 163             for (i = 0; i < 4; i++)
 274  00ed 5f            	clrw	x
 275  00ee 1f0b          	ldw	(OFST-1,sp),x
 276  00f0               L311:
 277                     ; 169                 if (atomSemGet (&sem1, SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 279  00f0 ae0064        	ldw	x,#100
 280  00f3 89            	pushw	x
 281  00f4 ae0000        	ldw	x,#0
 282  00f7 89            	pushw	x
 283  00f8 ae0099        	ldw	x,#L3_sem1
 284  00fb cd0000        	call	_atomSemGet
 286  00fe 5b04          	addw	sp,#4
 287  0100 4d            	tnz	a
 288  0101 2713          	jreq	L121
 289                     ; 171                     ATOMLOG (_STR("Retake %d\n"), i);
 291  0103 1e0b          	ldw	x,(OFST-1,sp)
 292  0105 89            	pushw	x
 293  0106 ae0055        	ldw	x,#L321
 294  0109 cd0000        	call	_printf
 296  010c 85            	popw	x
 297                     ; 172                     failures++;
 299  010d 1e09          	ldw	x,(OFST-3,sp)
 300  010f 1c0001        	addw	x,#1
 301  0112 1f09          	ldw	(OFST-3,sp),x
 302                     ; 173                     break;
 304  0114 204a          	jra	L101
 305  0116               L121:
 306                     ; 182                     shared_data = 0;
 308  0116 5f            	clrw	x
 309  0117 cf0000        	ldw	L11_shared_data,x
 310                     ; 185                     atomTimerDelay(SYSTEM_TICKS_PER_SEC/4);
 312  011a ae0019        	ldw	x,#25
 313  011d 89            	pushw	x
 314  011e ae0000        	ldw	x,#0
 315  0121 89            	pushw	x
 316  0122 cd0000        	call	_atomTimerDelay
 318  0125 5b04          	addw	sp,#4
 319                     ; 191                     if (shared_data != 0)
 321  0127 ce0000        	ldw	x,L11_shared_data
 322  012a 270f          	jreq	L721
 323                     ; 194                         ATOMLOG (_STR("Still modifying\n"));
 325  012c ae0044        	ldw	x,#L131
 326  012f cd0000        	call	_printf
 328                     ; 195                         failures++;
 330  0132 1e09          	ldw	x,(OFST-3,sp)
 331  0134 1c0001        	addw	x,#1
 332  0137 1f09          	ldw	(OFST-3,sp),x
 333                     ; 196                         break;
 335  0139 2025          	jra	L101
 336  013b               L721:
 337                     ; 203                     if (atomSemPut (&sem1) != ATOM_OK)
 339  013b ae0099        	ldw	x,#L3_sem1
 340  013e cd0000        	call	_atomSemPut
 342  0141 4d            	tnz	a
 343  0142 270d          	jreq	L521
 344                     ; 205                         ATOMLOG (_STR("Failed release\n"));
 346  0144 ae0071        	ldw	x,#L501
 347  0147 cd0000        	call	_printf
 349                     ; 206                         failures++;
 351  014a 1e09          	ldw	x,(OFST-3,sp)
 352  014c 1c0001        	addw	x,#1
 353  014f 1f09          	ldw	(OFST-3,sp),x
 354  0151               L521:
 355                     ; 163             for (i = 0; i < 4; i++)
 357  0151 1e0b          	ldw	x,(OFST-1,sp)
 358  0153 1c0001        	addw	x,#1
 359  0156 1f0b          	ldw	(OFST-1,sp),x
 362  0158 9c            	rvf
 363  0159 1e0b          	ldw	x,(OFST-1,sp)
 364  015b a30004        	cpw	x,#4
 365  015e 2f90          	jrslt	L311
 366  0160               L101:
 367                     ; 214         if (atomSemDelete (&sem1) != ATOM_OK)
 369  0160 ae0099        	ldw	x,#L3_sem1
 370  0163 cd0000        	call	_atomSemDelete
 372  0166 4d            	tnz	a
 373  0167 270d          	jreq	L35
 374                     ; 216             ATOMLOG (_STR("Delete failed\n"));
 376  0169 ae0035        	ldw	x,#L731
 377  016c cd0000        	call	_printf
 379                     ; 217             failures++;
 381  016f 1e09          	ldw	x,(OFST-3,sp)
 382  0171 1c0001        	addw	x,#1
 383  0174 1f09          	ldw	(OFST-3,sp),x
 384  0176               L35:
 385                     ; 228         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 387  0176 5f            	clrw	x
 388  0177 1f0b          	ldw	(OFST-1,sp),x
 389  0179               L141:
 390                     ; 231             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 392  0179 96            	ldw	x,sp
 393  017a 1c0005        	addw	x,#OFST-7
 394  017d 89            	pushw	x
 395  017e 96            	ldw	x,sp
 396  017f 1c0003        	addw	x,#OFST-9
 397  0182 89            	pushw	x
 398  0183 1e0f          	ldw	x,(OFST+3,sp)
 399  0185 90ae0017      	ldw	y,#23
 400  0189 cd0000        	call	c_imul
 402  018c 1c0082        	addw	x,#L5_tcb
 403  018f cd0000        	call	_atomThreadStackCheck
 405  0192 5b04          	addw	sp,#4
 406  0194 4d            	tnz	a
 407  0195 270f          	jreq	L741
 408                     ; 233                 ATOMLOG (_STR("StackCheck\n"));
 410  0197 ae0029        	ldw	x,#L151
 411  019a cd0000        	call	_printf
 413                     ; 234                 failures++;
 415  019d 1e09          	ldw	x,(OFST-3,sp)
 416  019f 1c0001        	addw	x,#1
 417  01a2 1f09          	ldw	(OFST-3,sp),x
 419  01a4 2024          	jra	L351
 420  01a6               L741:
 421                     ; 239                 if (free_bytes == 0)
 423  01a6 96            	ldw	x,sp
 424  01a7 1c0005        	addw	x,#OFST-7
 425  01aa cd0000        	call	c_lzmp
 427  01ad 2611          	jrne	L551
 428                     ; 241                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 430  01af 1e0b          	ldw	x,(OFST-1,sp)
 431  01b1 89            	pushw	x
 432  01b2 ae0017        	ldw	x,#L751
 433  01b5 cd0000        	call	_printf
 435  01b8 85            	popw	x
 436                     ; 242                     failures++;
 438  01b9 1e09          	ldw	x,(OFST-3,sp)
 439  01bb 1c0001        	addw	x,#1
 440  01be 1f09          	ldw	(OFST-3,sp),x
 441  01c0               L551:
 442                     ; 247                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 444  01c0 1e03          	ldw	x,(OFST-9,sp)
 445  01c2 89            	pushw	x
 446  01c3 ae000a        	ldw	x,#L161
 447  01c6 cd0000        	call	_printf
 449  01c9 85            	popw	x
 450  01ca               L351:
 451                     ; 228         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 453  01ca 1e0b          	ldw	x,(OFST-1,sp)
 454  01cc 1c0001        	addw	x,#1
 455  01cf 1f0b          	ldw	(OFST-1,sp),x
 458  01d1 9c            	rvf
 459  01d2 1e0b          	ldw	x,(OFST-1,sp)
 460  01d4 a30001        	cpw	x,#1
 461  01d7 2fa0          	jrslt	L141
 462                     ; 255     return failures;
 464  01d9 1e09          	ldw	x,(OFST-3,sp)
 465  01db cd0000        	call	c_itolx
 469  01de 5b0c          	addw	sp,#12
 470  01e0 81            	ret
 515                     ; 269 static void test_thread_func (uint32_t param)
 515                     ; 270 {
 516                     .text:	section	.text,new
 517  0000               L31_test_thread_func:
 519  0000 88            	push	a
 520       00000001      OFST:	set	1
 523                     ; 274     param = param;
 525  0001 96            	ldw	x,sp
 526  0002 1c0004        	addw	x,#OFST+3
 527  0005 cd0000        	call	c_ltor
 529  0008               L102:
 530                     ; 280         if ((status = atomSemGet (&sem1, 0)) != ATOM_OK)
 532  0008 ae0000        	ldw	x,#0
 533  000b 89            	pushw	x
 534  000c ae0000        	ldw	x,#0
 535  000f 89            	pushw	x
 536  0010 ae0099        	ldw	x,#L3_sem1
 537  0013 cd0000        	call	_atomSemGet
 539  0016 5b04          	addw	sp,#4
 540  0018 6b01          	ld	(OFST+0,sp),a
 541  001a 270c          	jreq	L502
 542                     ; 283             ATOMLOG (_STR("G%d\n"), status);
 544  001c 7b01          	ld	a,(OFST+0,sp)
 545  001e 88            	push	a
 546  001f ae0005        	ldw	x,#L702
 547  0022 cd0000        	call	_printf
 549  0025 84            	pop	a
 550                     ; 284             break;
 552  0026 201a          	jra	L712
 553  0028               L502:
 554                     ; 291             shared_data = 1;
 556  0028 ae0001        	ldw	x,#1
 557  002b cf0000        	ldw	L11_shared_data,x
 558                     ; 294             if ((status = atomSemPut (&sem1)) != ATOM_OK)
 560  002e ae0099        	ldw	x,#L3_sem1
 561  0031 cd0000        	call	_atomSemPut
 563  0034 6b01          	ld	(OFST+0,sp),a
 564  0036 27d0          	jreq	L102
 565                     ; 297                 ATOMLOG (_STR("P%d\n"), status);
 567  0038 7b01          	ld	a,(OFST+0,sp)
 568  003a 88            	push	a
 569  003b ae0000        	ldw	x,#L512
 570  003e cd0000        	call	_printf
 572  0041 84            	pop	a
 573                     ; 298                 break;
 574  0042               L712:
 575                     ; 307         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 577  0042 ae0064        	ldw	x,#100
 578  0045 89            	pushw	x
 579  0046 ae0000        	ldw	x,#0
 580  0049 89            	pushw	x
 581  004a cd0000        	call	_atomTimerDelay
 583  004d 5b04          	addw	sp,#4
 585  004f 20f1          	jra	L712
 825                     	switch	.bss
 826  0000               L11_shared_data:
 827  0000 0000          	ds.b	2
 828  0002               L7_test_thread_stack:
 829  0002 000000000000  	ds.b	128
 830  0082               L5_tcb:
 831  0082 000000000000  	ds.b	23
 832  0099               L3_sem1:
 833  0099 000000        	ds.b	3
 834                     	xref	_atomSemPut
 835                     	xref	_atomSemGet
 836                     	xref	_atomSemDelete
 837                     	xref	_atomSemCreate
 838                     	xdef	_test_start
 839                     	xref	_printf
 840                     	xref	_atomThreadStackCheck
 841                     	xref	_atomThreadCreate
 842                     	xref	_atomTimerDelay
 843                     .const:	section	.text
 844  0000               L512:
 845  0000 5025640a00    	dc.b	"P%d",10,0
 846  0005               L702:
 847  0005 4725640a00    	dc.b	"G%d",10,0
 848  000a               L161:
 849  000a 537461636b55  	dc.b	"StackUse:%d",10,0
 850  0017               L751:
 851  0017 537461636b4f  	dc.b	"StackOverflow %d",10,0
 852  0029               L151:
 853  0029 537461636b43  	dc.b	"StackCheck",10,0
 854  0035               L731:
 855  0035 44656c657465  	dc.b	"Delete failed",10,0
 856  0044               L131:
 857  0044 5374696c6c20  	dc.b	"Still modifying",10,0
 858  0055               L321:
 859  0055 526574616b65  	dc.b	"Retake %d",10,0
 860  0060               L111:
 861  0060 457870656374  	dc.b	"Expected modify",10,0
 862  0071               L501:
 863  0071 4661696c6564  	dc.b	"Failed release",10,0
 864  0081               L77:
 865  0081 536861726564  	dc.b	"Shared data modifi"
 866  0093 65640a00      	dc.b	"ed",10,0
 867  0097               L56:
 868  0097 4572726f7220  	dc.b	"Error creating tes"
 869  00a9 742074687265  	dc.b	"t thread",10,0
 870  00b3               L75:
 871  00b3 4572726f7220  	dc.b	"Error taking mutex"
 872  00c5 0a00          	dc.b	10,0
 873  00c7               L15:
 874  00c7 4572726f7220  	dc.b	"Error creating tes"
 875  00d9 742073656d61  	dc.b	"t semaphore 1",10,0
 876                     	xref.b	c_x
 896                     	xref	c_ltor
 897                     	xref	c_itolx
 898                     	xref	c_lzmp
 899                     	xref	c_imul
 900                     	end
