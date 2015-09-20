   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  90                     ; 70 uint32_t test_start (void)
  90                     ; 71 {
  92                     .text:	section	.text,new
  93  0000               _test_start:
  95  0000 5214          	subw	sp,#20
  96       00000014      OFST:	set	20
  99                     ; 76     failures = 0;
 101  0002 5f            	clrw	x
 102  0003 1f13          	ldw	(OFST-1,sp),x
 103                     ; 79     if (atomMutexCreate (&mutex1) != ATOM_OK)
 105  0005 ae0099        	ldw	x,#L3_mutex1
 106  0008 cd0000        	call	_atomMutexCreate
 108  000b 4d            	tnz	a
 109  000c 2711          	jreq	L15
 110                     ; 81         ATOMLOG (_STR("Error creating mutex\n"));
 112  000e ae0089        	ldw	x,#L35
 113  0011 cd0000        	call	_printf
 115                     ; 82         failures++;
 117  0014 1e13          	ldw	x,(OFST-1,sp)
 118  0016 1c0001        	addw	x,#1
 119  0019 1f13          	ldw	(OFST-1,sp),x
 121  001b acfd00fd      	jpf	L55
 122  001f               L15:
 123                     ; 87         shared_data = 0;
 125  001f 5f            	clrw	x
 126  0020 cf0000        	ldw	L11_shared_data,x
 127                     ; 90         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 127                     ; 91               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 127                     ; 92               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 129  0023 ae0080        	ldw	x,#128
 130  0026 89            	pushw	x
 131  0027 ae0000        	ldw	x,#0
 132  002a 89            	pushw	x
 133  002b ae0081        	ldw	x,#L7_test_thread_stack+127
 134  002e 89            	pushw	x
 135  002f ae0001        	ldw	x,#1
 136  0032 89            	pushw	x
 137  0033 ae0000        	ldw	x,#0
 138  0036 89            	pushw	x
 139  0037 ae0000        	ldw	x,#L31_test_thread_func
 140  003a 89            	pushw	x
 141  003b 4b10          	push	#16
 142  003d ae0082        	ldw	x,#L5_tcb
 143  0040 cd0000        	call	_atomThreadCreate
 145  0043 5b0d          	addw	sp,#13
 146  0045 4d            	tnz	a
 147  0046 270d          	jreq	L75
 148                     ; 95             ATOMLOG (_STR("Error creating test thread\n"));
 150  0048 ae006d        	ldw	x,#L16
 151  004b cd0000        	call	_printf
 153                     ; 96             failures++;
 155  004e 1e13          	ldw	x,(OFST-1,sp)
 156  0050 1c0001        	addw	x,#1
 157  0053 1f13          	ldw	(OFST-1,sp),x
 158  0055               L75:
 159                     ; 104         atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 161  0055 ae0019        	ldw	x,#25
 162  0058 89            	pushw	x
 163  0059 ae0000        	ldw	x,#0
 164  005c 89            	pushw	x
 165  005d cd0000        	call	_atomTimerDelay
 167  0060 5b04          	addw	sp,#4
 168                     ; 105         if (shared_data != 1)
 170  0062 ce0000        	ldw	x,L11_shared_data
 171  0065 a30001        	cpw	x,#1
 172  0068 270d          	jreq	L36
 173                     ; 107             ATOMLOG (_STR("Shared data unmodified\n"));
 175  006a ae0055        	ldw	x,#L56
 176  006d cd0000        	call	_printf
 178                     ; 108             failures++;
 180  0070 1e13          	ldw	x,(OFST-1,sp)
 181  0072 1c0001        	addw	x,#1
 182  0075 1f13          	ldw	(OFST-1,sp),x
 183  0077               L36:
 184                     ; 112         if (failures == 0)
 186  0077 1e13          	ldw	x,(OFST-1,sp)
 187  0079 266c          	jrne	L76
 188                     ; 115             start_time = atomTimeGet();
 190  007b cd0000        	call	_atomTimeGet
 192  007e 96            	ldw	x,sp
 193  007f 1c000b        	addw	x,#OFST-9
 194  0082 cd0000        	call	c_rtol
 196                     ; 118             if (atomMutexGet (&mutex1, 2 * SYSTEM_TICKS_PER_SEC) != ATOM_TIMEOUT)
 198  0085 ae00c8        	ldw	x,#200
 199  0088 89            	pushw	x
 200  0089 ae0000        	ldw	x,#0
 201  008c 89            	pushw	x
 202  008d ae0099        	ldw	x,#L3_mutex1
 203  0090 cd0000        	call	_atomMutexGet
 205  0093 5b04          	addw	sp,#4
 206  0095 a102          	cp	a,#2
 207  0097 270d          	jreq	L17
 208                     ; 120                 ATOMLOG (_STR("Failed get\n"));
 210  0099 ae0049        	ldw	x,#L37
 211  009c cd0000        	call	_printf
 213                     ; 121                 failures++;
 215  009f 1e13          	ldw	x,(OFST-1,sp)
 216  00a1 1c0001        	addw	x,#1
 217  00a4 1f13          	ldw	(OFST-1,sp),x
 218  00a6               L17:
 219                     ; 125             end_time = atomTimeGet();
 221  00a6 cd0000        	call	_atomTimeGet
 223  00a9 96            	ldw	x,sp
 224  00aa 1c000f        	addw	x,#OFST-5
 225  00ad cd0000        	call	c_rtol
 227                     ; 128             if ((end_time < (start_time + (2 * SYSTEM_TICKS_PER_SEC)))
 227                     ; 129                 || (end_time > (start_time + (2 * SYSTEM_TICKS_PER_SEC) + 1)))
 229  00b0 96            	ldw	x,sp
 230  00b1 1c000b        	addw	x,#OFST-9
 231  00b4 cd0000        	call	c_ltor
 233  00b7 a6c8          	ld	a,#200
 234  00b9 cd0000        	call	c_ladc
 236  00bc 96            	ldw	x,sp
 237  00bd 1c000f        	addw	x,#OFST-5
 238  00c0 cd0000        	call	c_lcmp
 240  00c3 2215          	jrugt	L77
 242  00c5 96            	ldw	x,sp
 243  00c6 1c000b        	addw	x,#OFST-9
 244  00c9 cd0000        	call	c_ltor
 246  00cc a6c9          	ld	a,#201
 247  00ce cd0000        	call	c_ladc
 249  00d1 96            	ldw	x,sp
 250  00d2 1c000f        	addw	x,#OFST-5
 251  00d5 cd0000        	call	c_lcmp
 253  00d8 240d          	jruge	L76
 254  00da               L77:
 255                     ; 131                 ATOMLOG (_STR("Bad time\n"));
 257  00da ae003f        	ldw	x,#L101
 258  00dd cd0000        	call	_printf
 260                     ; 132                 failures++;
 262  00e0 1e13          	ldw	x,(OFST-1,sp)
 263  00e2 1c0001        	addw	x,#1
 264  00e5 1f13          	ldw	(OFST-1,sp),x
 265  00e7               L76:
 266                     ; 137         if (atomMutexDelete (&mutex1) != ATOM_OK)
 268  00e7 ae0099        	ldw	x,#L3_mutex1
 269  00ea cd0000        	call	_atomMutexDelete
 271  00ed 4d            	tnz	a
 272  00ee 270d          	jreq	L55
 273                     ; 139             ATOMLOG (_STR("Delete failed\n"));
 275  00f0 ae0030        	ldw	x,#L501
 276  00f3 cd0000        	call	_printf
 278                     ; 140             failures++;
 280  00f6 1e13          	ldw	x,(OFST-1,sp)
 281  00f8 1c0001        	addw	x,#1
 282  00fb 1f13          	ldw	(OFST-1,sp),x
 283  00fd               L55:
 284                     ; 151         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 286  00fd 5f            	clrw	x
 287  00fe 1f09          	ldw	(OFST-11,sp),x
 288  0100               L701:
 289                     ; 154             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 291  0100 96            	ldw	x,sp
 292  0101 1c0005        	addw	x,#OFST-15
 293  0104 89            	pushw	x
 294  0105 96            	ldw	x,sp
 295  0106 1c0003        	addw	x,#OFST-17
 296  0109 89            	pushw	x
 297  010a 1e0d          	ldw	x,(OFST-7,sp)
 298  010c 90ae0017      	ldw	y,#23
 299  0110 cd0000        	call	c_imul
 301  0113 1c0082        	addw	x,#L5_tcb
 302  0116 cd0000        	call	_atomThreadStackCheck
 304  0119 5b04          	addw	sp,#4
 305  011b 4d            	tnz	a
 306  011c 270f          	jreq	L511
 307                     ; 156                 ATOMLOG (_STR("StackCheck\n"));
 309  011e ae0024        	ldw	x,#L711
 310  0121 cd0000        	call	_printf
 312                     ; 157                 failures++;
 314  0124 1e13          	ldw	x,(OFST-1,sp)
 315  0126 1c0001        	addw	x,#1
 316  0129 1f13          	ldw	(OFST-1,sp),x
 318  012b 2024          	jra	L121
 319  012d               L511:
 320                     ; 162                 if (free_bytes == 0)
 322  012d 96            	ldw	x,sp
 323  012e 1c0005        	addw	x,#OFST-15
 324  0131 cd0000        	call	c_lzmp
 326  0134 2611          	jrne	L321
 327                     ; 164                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 329  0136 1e09          	ldw	x,(OFST-11,sp)
 330  0138 89            	pushw	x
 331  0139 ae0012        	ldw	x,#L521
 332  013c cd0000        	call	_printf
 334  013f 85            	popw	x
 335                     ; 165                     failures++;
 337  0140 1e13          	ldw	x,(OFST-1,sp)
 338  0142 1c0001        	addw	x,#1
 339  0145 1f13          	ldw	(OFST-1,sp),x
 340  0147               L321:
 341                     ; 170                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 343  0147 1e03          	ldw	x,(OFST-17,sp)
 344  0149 89            	pushw	x
 345  014a ae0005        	ldw	x,#L721
 346  014d cd0000        	call	_printf
 348  0150 85            	popw	x
 349  0151               L121:
 350                     ; 151         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 352  0151 1e09          	ldw	x,(OFST-11,sp)
 353  0153 1c0001        	addw	x,#1
 354  0156 1f09          	ldw	(OFST-11,sp),x
 357  0158 9c            	rvf
 358  0159 1e09          	ldw	x,(OFST-11,sp)
 359  015b a30001        	cpw	x,#1
 360  015e 2fa0          	jrslt	L701
 361                     ; 178     return failures;
 363  0160 1e13          	ldw	x,(OFST-1,sp)
 364  0162 cd0000        	call	c_itolx
 368  0165 5b14          	addw	sp,#20
 369  0167 81            	ret
 413                     ; 192 static void test_thread_func (uint32_t param)
 413                     ; 193 {
 414                     .text:	section	.text,new
 415  0000               L31_test_thread_func:
 417  0000 88            	push	a
 418       00000001      OFST:	set	1
 421                     ; 197     param = param;
 423  0001 96            	ldw	x,sp
 424  0002 1c0004        	addw	x,#OFST+3
 425  0005 cd0000        	call	c_ltor
 427                     ; 200     if ((status = atomMutexGet (&mutex1, 0)) != ATOM_OK)
 429  0008 ae0000        	ldw	x,#0
 430  000b 89            	pushw	x
 431  000c ae0000        	ldw	x,#0
 432  000f 89            	pushw	x
 433  0010 ae0099        	ldw	x,#L3_mutex1
 434  0013 cd0000        	call	_atomMutexGet
 436  0016 5b04          	addw	sp,#4
 437  0018 6b01          	ld	(OFST+0,sp),a
 438  001a 270c          	jreq	L741
 439                     ; 203         ATOMLOG (_STR("G%d\n"), status);
 441  001c 7b01          	ld	a,(OFST+0,sp)
 442  001e 88            	push	a
 443  001f ae0000        	ldw	x,#L151
 444  0022 cd0000        	call	_printf
 446  0025 84            	pop	a
 448  0026 2006          	jra	L551
 449  0028               L741:
 450                     ; 210         shared_data = 1;
 452  0028 ae0001        	ldw	x,#1
 453  002b cf0000        	ldw	L11_shared_data,x
 454  002e               L551:
 455                     ; 216         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 457  002e ae0064        	ldw	x,#100
 458  0031 89            	pushw	x
 459  0032 ae0000        	ldw	x,#0
 460  0035 89            	pushw	x
 461  0036 cd0000        	call	_atomTimerDelay
 463  0039 5b04          	addw	sp,#4
 465  003b 20f1          	jra	L551
 717                     	switch	.bss
 718  0000               L11_shared_data:
 719  0000 0000          	ds.b	2
 720  0002               L7_test_thread_stack:
 721  0002 000000000000  	ds.b	128
 722  0082               L5_tcb:
 723  0082 000000000000  	ds.b	23
 724  0099               L3_mutex1:
 725  0099 0000000000    	ds.b	5
 726                     	xref	_atomMutexGet
 727                     	xref	_atomMutexDelete
 728                     	xref	_atomMutexCreate
 729                     	xdef	_test_start
 730                     	xref	_printf
 731                     	xref	_atomThreadStackCheck
 732                     	xref	_atomThreadCreate
 733                     	xref	_atomTimeGet
 734                     	xref	_atomTimerDelay
 735                     .const:	section	.text
 736  0000               L151:
 737  0000 4725640a00    	dc.b	"G%d",10,0
 738  0005               L721:
 739  0005 537461636b55  	dc.b	"StackUse:%d",10,0
 740  0012               L521:
 741  0012 537461636b4f  	dc.b	"StackOverflow %d",10,0
 742  0024               L711:
 743  0024 537461636b43  	dc.b	"StackCheck",10,0
 744  0030               L501:
 745  0030 44656c657465  	dc.b	"Delete failed",10,0
 746  003f               L101:
 747  003f 426164207469  	dc.b	"Bad time",10,0
 748  0049               L37:
 749  0049 4661696c6564  	dc.b	"Failed get",10,0
 750  0055               L56:
 751  0055 536861726564  	dc.b	"Shared data unmodi"
 752  0067 666965640a00  	dc.b	"fied",10,0
 753  006d               L16:
 754  006d 4572726f7220  	dc.b	"Error creating tes"
 755  007f 742074687265  	dc.b	"t thread",10,0
 756  0089               L35:
 757  0089 4572726f7220  	dc.b	"Error creating mut"
 758  009b 65780a00      	dc.b	"ex",10,0
 759                     	xref.b	c_x
 779                     	xref	c_itolx
 780                     	xref	c_lzmp
 781                     	xref	c_imul
 782                     	xref	c_lcmp
 783                     	xref	c_ladc
 784                     	xref	c_ltor
 785                     	xref	c_rtol
 786                     	end
