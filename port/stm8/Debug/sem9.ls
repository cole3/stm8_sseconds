   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  83                     ; 65 uint32_t test_start (void)
  83                     ; 66 {
  85                     .text:	section	.text,new
  86  0000               _test_start:
  88  0000 520c          	subw	sp,#12
  89       0000000c      OFST:	set	12
  92                     ; 71     failures = 0;
  94  0002 5f            	clrw	x
  95  0003 1f09          	ldw	(OFST-3,sp),x
  96                     ; 74     for (i = 0; i < 3; i++)
  98  0005 5f            	clrw	x
  99  0006 1f0b          	ldw	(OFST-1,sp),x
 100  0008               L74:
 101                     ; 76         pass_flag[i] = FALSE;
 103  0008 1e0b          	ldw	x,(OFST-1,sp)
 104  000a 58            	sllw	x
 105  000b 905f          	clrw	y
 106  000d df0000        	ldw	(L11_pass_flag,x),y
 107                     ; 74     for (i = 0; i < 3; i++)
 109  0010 1e0b          	ldw	x,(OFST-1,sp)
 110  0012 1c0001        	addw	x,#1
 111  0015 1f0b          	ldw	(OFST-1,sp),x
 114  0017 9c            	rvf
 115  0018 1e0b          	ldw	x,(OFST-1,sp)
 116  001a a30003        	cpw	x,#3
 117  001d 2fe9          	jrslt	L74
 118                     ; 80     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 120  001f 4b00          	push	#0
 121  0021 ae01cb        	ldw	x,#L3_sem1
 122  0024 cd0000        	call	_atomSemCreate
 124  0027 5b01          	addw	sp,#1
 125  0029 4d            	tnz	a
 126  002a 2711          	jreq	L55
 127                     ; 82         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 129  002c ae00c8        	ldw	x,#L75
 130  002f cd0000        	call	_printf
 132                     ; 83         failures++;
 134  0032 1e09          	ldw	x,(OFST-3,sp)
 135  0034 1c0001        	addw	x,#1
 136  0037 1f09          	ldw	(OFST-3,sp),x
 138  0039 ac330133      	jpf	L16
 139  003d               L55:
 140                     ; 89         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 0,
 140                     ; 90                   &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 140                     ; 91                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 142  003d ae0080        	ldw	x,#128
 143  0040 89            	pushw	x
 144  0041 ae0000        	ldw	x,#0
 145  0044 89            	pushw	x
 146  0045 ae0085        	ldw	x,#L7_test_thread_stack+127
 147  0048 89            	pushw	x
 148  0049 ae0000        	ldw	x,#0
 149  004c 89            	pushw	x
 150  004d ae0000        	ldw	x,#0
 151  0050 89            	pushw	x
 152  0051 ae0000        	ldw	x,#L31_test_thread_func
 153  0054 89            	pushw	x
 154  0055 4b10          	push	#16
 155  0057 ae0186        	ldw	x,#L5_tcb
 156  005a cd0000        	call	_atomThreadCreate
 158  005d 5b0d          	addw	sp,#13
 159  005f 4d            	tnz	a
 160  0060 2711          	jreq	L36
 161                     ; 94             ATOMLOG (_STR("Error creating test thread 1\n"));
 163  0062 ae00aa        	ldw	x,#L56
 164  0065 cd0000        	call	_printf
 166                     ; 95             failures++;
 168  0068 1e09          	ldw	x,(OFST-3,sp)
 169  006a 1c0001        	addw	x,#1
 170  006d 1f09          	ldw	(OFST-3,sp),x
 172  006f ac330133      	jpf	L16
 173  0073               L36:
 174                     ; 99         else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 1,
 174                     ; 100                   &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 174                     ; 101                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 176  0073 ae0080        	ldw	x,#128
 177  0076 89            	pushw	x
 178  0077 ae0000        	ldw	x,#0
 179  007a 89            	pushw	x
 180  007b ae0105        	ldw	x,#L7_test_thread_stack+255
 181  007e 89            	pushw	x
 182  007f ae0001        	ldw	x,#1
 183  0082 89            	pushw	x
 184  0083 ae0000        	ldw	x,#0
 185  0086 89            	pushw	x
 186  0087 ae0000        	ldw	x,#L31_test_thread_func
 187  008a 89            	pushw	x
 188  008b 4b10          	push	#16
 189  008d ae019d        	ldw	x,#L5_tcb+23
 190  0090 cd0000        	call	_atomThreadCreate
 192  0093 5b0d          	addw	sp,#13
 193  0095 4d            	tnz	a
 194  0096 2710          	jreq	L17
 195                     ; 104             ATOMLOG (_STR("Error creating test thread 2\n"));
 197  0098 ae008c        	ldw	x,#L37
 198  009b cd0000        	call	_printf
 200                     ; 105             failures++;
 202  009e 1e09          	ldw	x,(OFST-3,sp)
 203  00a0 1c0001        	addw	x,#1
 204  00a3 1f09          	ldw	(OFST-3,sp),x
 206  00a5 cc0133        	jra	L16
 207  00a8               L17:
 208                     ; 109         else if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 2,
 208                     ; 110                   &test_thread_stack[2][TEST_THREAD_STACK_SIZE - 1],
 208                     ; 111                   TEST_THREAD_STACK_SIZE) != ATOM_OK)
 210  00a8 ae0080        	ldw	x,#128
 211  00ab 89            	pushw	x
 212  00ac ae0000        	ldw	x,#0
 213  00af 89            	pushw	x
 214  00b0 ae0185        	ldw	x,#L7_test_thread_stack+383
 215  00b3 89            	pushw	x
 216  00b4 ae0002        	ldw	x,#2
 217  00b7 89            	pushw	x
 218  00b8 ae0000        	ldw	x,#0
 219  00bb 89            	pushw	x
 220  00bc ae0000        	ldw	x,#L31_test_thread_func
 221  00bf 89            	pushw	x
 222  00c0 4b10          	push	#16
 223  00c2 ae01b4        	ldw	x,#L5_tcb+46
 224  00c5 cd0000        	call	_atomThreadCreate
 226  00c8 5b0d          	addw	sp,#13
 227  00ca 4d            	tnz	a
 228  00cb 270f          	jreq	L77
 229                     ; 114             ATOMLOG (_STR("Error creating test thread 3\n"));
 231  00cd ae006e        	ldw	x,#L101
 232  00d0 cd0000        	call	_printf
 234                     ; 115             failures++;
 236  00d3 1e09          	ldw	x,(OFST-3,sp)
 237  00d5 1c0001        	addw	x,#1
 238  00d8 1f09          	ldw	(OFST-3,sp),x
 240  00da 2057          	jra	L16
 241  00dc               L77:
 242                     ; 122             atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 244  00dc ae0019        	ldw	x,#25
 245  00df 89            	pushw	x
 246  00e0 ae0000        	ldw	x,#0
 247  00e3 89            	pushw	x
 248  00e4 cd0000        	call	_atomTimerDelay
 250  00e7 5b04          	addw	sp,#4
 251                     ; 125             if (atomSemDelete (&sem1) != ATOM_OK)
 253  00e9 ae01cb        	ldw	x,#L3_sem1
 254  00ec cd0000        	call	_atomSemDelete
 256  00ef 4d            	tnz	a
 257  00f0 270f          	jreq	L501
 258                     ; 127                 ATOMLOG (_STR("Delete fail\n"));
 260  00f2 ae0061        	ldw	x,#L701
 261  00f5 cd0000        	call	_printf
 263                     ; 128                 failures++;
 265  00f8 1e09          	ldw	x,(OFST-3,sp)
 266  00fa 1c0001        	addw	x,#1
 267  00fd 1f09          	ldw	(OFST-3,sp),x
 269  00ff 2032          	jra	L16
 270  0101               L501:
 271                     ; 133                 atomTimerDelay (SYSTEM_TICKS_PER_SEC/4);
 273  0101 ae0019        	ldw	x,#25
 274  0104 89            	pushw	x
 275  0105 ae0000        	ldw	x,#0
 276  0108 89            	pushw	x
 277  0109 cd0000        	call	_atomTimerDelay
 279  010c 5b04          	addw	sp,#4
 280                     ; 136                 if ((pass_flag[0] != TRUE) || (pass_flag[1] != TRUE) || (pass_flag[2] != TRUE))
 282  010e ce0000        	ldw	x,L11_pass_flag
 283  0111 a30001        	cpw	x,#1
 284  0114 2610          	jrne	L511
 286  0116 ce0002        	ldw	x,L11_pass_flag+2
 287  0119 a30001        	cpw	x,#1
 288  011c 2608          	jrne	L511
 290  011e ce0004        	ldw	x,L11_pass_flag+4
 291  0121 a30001        	cpw	x,#1
 292  0124 270d          	jreq	L16
 293  0126               L511:
 294                     ; 138                     ATOMLOG (_STR("Thread fail\n"));
 296  0126 ae0054        	ldw	x,#L121
 297  0129 cd0000        	call	_printf
 299                     ; 139                     failures++;
 301  012c 1e09          	ldw	x,(OFST-3,sp)
 302  012e 1c0001        	addw	x,#1
 303  0131 1f09          	ldw	(OFST-3,sp),x
 304  0133               L16:
 305                     ; 152         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 307  0133 5f            	clrw	x
 308  0134 1f0b          	ldw	(OFST-1,sp),x
 309  0136               L321:
 310                     ; 155             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 312  0136 96            	ldw	x,sp
 313  0137 1c0005        	addw	x,#OFST-7
 314  013a 89            	pushw	x
 315  013b 96            	ldw	x,sp
 316  013c 1c0003        	addw	x,#OFST-9
 317  013f 89            	pushw	x
 318  0140 1e0f          	ldw	x,(OFST+3,sp)
 319  0142 90ae0017      	ldw	y,#23
 320  0146 cd0000        	call	c_imul
 322  0149 1c0186        	addw	x,#L5_tcb
 323  014c cd0000        	call	_atomThreadStackCheck
 325  014f 5b04          	addw	sp,#4
 326  0151 4d            	tnz	a
 327  0152 270f          	jreq	L131
 328                     ; 157                 ATOMLOG (_STR("StackCheck\n"));
 330  0154 ae0048        	ldw	x,#L331
 331  0157 cd0000        	call	_printf
 333                     ; 158                 failures++;
 335  015a 1e09          	ldw	x,(OFST-3,sp)
 336  015c 1c0001        	addw	x,#1
 337  015f 1f09          	ldw	(OFST-3,sp),x
 339  0161 2024          	jra	L531
 340  0163               L131:
 341                     ; 163                 if (free_bytes == 0)
 343  0163 96            	ldw	x,sp
 344  0164 1c0005        	addw	x,#OFST-7
 345  0167 cd0000        	call	c_lzmp
 347  016a 2611          	jrne	L731
 348                     ; 165                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 350  016c 1e0b          	ldw	x,(OFST-1,sp)
 351  016e 89            	pushw	x
 352  016f ae0036        	ldw	x,#L141
 353  0172 cd0000        	call	_printf
 355  0175 85            	popw	x
 356                     ; 166                     failures++;
 358  0176 1e09          	ldw	x,(OFST-3,sp)
 359  0178 1c0001        	addw	x,#1
 360  017b 1f09          	ldw	(OFST-3,sp),x
 361  017d               L731:
 362                     ; 171                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 364  017d 1e03          	ldw	x,(OFST-9,sp)
 365  017f 89            	pushw	x
 366  0180 ae0029        	ldw	x,#L341
 367  0183 cd0000        	call	_printf
 369  0186 85            	popw	x
 370  0187               L531:
 371                     ; 152         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 373  0187 1e0b          	ldw	x,(OFST-1,sp)
 374  0189 1c0001        	addw	x,#1
 375  018c 1f0b          	ldw	(OFST-1,sp),x
 378  018e 9c            	rvf
 379  018f 1e0b          	ldw	x,(OFST-1,sp)
 380  0191 a30003        	cpw	x,#3
 381  0194 2fa0          	jrslt	L321
 382                     ; 179     return failures;
 384  0196 1e09          	ldw	x,(OFST-3,sp)
 385  0198 cd0000        	call	c_itolx
 389  019b 5b0c          	addw	sp,#12
 390  019d 81            	ret
 441                     ; 192 static void test_thread_func (uint32_t param)
 441                     ; 193 {
 442                     .text:	section	.text,new
 443  0000               L31_test_thread_func:
 445  0000 5203          	subw	sp,#3
 446       00000003      OFST:	set	3
 449                     ; 198     thread_id = (int)param;
 451  0002 1e08          	ldw	x,(OFST+5,sp)
 452  0004 1f01          	ldw	(OFST-2,sp),x
 453                     ; 204     status = atomSemGet(&sem1, (5 * SYSTEM_TICKS_PER_SEC));
 455  0006 ae01f4        	ldw	x,#500
 456  0009 89            	pushw	x
 457  000a ae0000        	ldw	x,#0
 458  000d 89            	pushw	x
 459  000e ae01cb        	ldw	x,#L3_sem1
 460  0011 cd0000        	call	_atomSemGet
 462  0014 5b04          	addw	sp,#4
 463  0016 6b03          	ld	(OFST+0,sp),a
 464                     ; 205     if (status != ATOM_ERR_DELETED)
 466  0018 7b03          	ld	a,(OFST+0,sp)
 467  001a a1ca          	cp	a,#202
 468  001c 270c          	jreq	L561
 469                     ; 207         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 471  001e 7b03          	ld	a,(OFST+0,sp)
 472  0020 88            	push	a
 473  0021 ae0000        	ldw	x,#L761
 474  0024 cd0000        	call	_printf
 476  0027 84            	pop	a
 478  0028 200a          	jra	L371
 479  002a               L561:
 480                     ; 212         pass_flag[thread_id] = TRUE;
 482  002a 1e01          	ldw	x,(OFST-2,sp)
 483  002c 58            	sllw	x
 484  002d 90ae0001      	ldw	y,#1
 485  0031 df0000        	ldw	(L11_pass_flag,x),y
 486  0034               L371:
 487                     ; 218         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 489  0034 ae0064        	ldw	x,#100
 490  0037 89            	pushw	x
 491  0038 ae0000        	ldw	x,#0
 492  003b 89            	pushw	x
 493  003c cd0000        	call	_atomTimerDelay
 495  003f 5b04          	addw	sp,#4
 497  0041 20f1          	jra	L371
 738                     	switch	.bss
 739  0000               L11_pass_flag:
 740  0000 000000000000  	ds.b	6
 741  0006               L7_test_thread_stack:
 742  0006 000000000000  	ds.b	384
 743  0186               L5_tcb:
 744  0186 000000000000  	ds.b	69
 745  01cb               L3_sem1:
 746  01cb 000000        	ds.b	3
 747                     	xdef	_test_start
 748                     	xref	_printf
 749                     	xref	_atomSemGet
 750                     	xref	_atomSemDelete
 751                     	xref	_atomSemCreate
 752                     	xref	_atomThreadStackCheck
 753                     	xref	_atomThreadCreate
 754                     	xref	_atomTimerDelay
 755                     .const:	section	.text
 756  0000               L761:
 757  0000 546573743120  	dc.b	"Test1 thread woke "
 758  0012 776974686f75  	dc.b	"without deletion ("
 759  0024 2564290a00    	dc.b	"%d)",10,0
 760  0029               L341:
 761  0029 537461636b55  	dc.b	"StackUse:%d",10,0
 762  0036               L141:
 763  0036 537461636b4f  	dc.b	"StackOverflow %d",10,0
 764  0048               L331:
 765  0048 537461636b43  	dc.b	"StackCheck",10,0
 766  0054               L121:
 767  0054 546872656164  	dc.b	"Thread fail",10,0
 768  0061               L701:
 769  0061 44656c657465  	dc.b	"Delete fail",10,0
 770  006e               L101:
 771  006e 4572726f7220  	dc.b	"Error creating tes"
 772  0080 742074687265  	dc.b	"t thread 3",10,0
 773  008c               L37:
 774  008c 4572726f7220  	dc.b	"Error creating tes"
 775  009e 742074687265  	dc.b	"t thread 2",10,0
 776  00aa               L56:
 777  00aa 4572726f7220  	dc.b	"Error creating tes"
 778  00bc 742074687265  	dc.b	"t thread 1",10,0
 779  00c8               L75:
 780  00c8 4572726f7220  	dc.b	"Error creating tes"
 781  00da 742073656d61  	dc.b	"t semaphore 1",10,0
 782                     	xref.b	c_x
 802                     	xref	c_itolx
 803                     	xref	c_lzmp
 804                     	xref	c_imul
 805                     	end
