   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 118                     ; 57 uint32_t test_start (void)
 118                     ; 58 {
 120                     .text:	section	.text,new
 121  0000               _test_start:
 123  0000 5210          	subw	sp,#16
 124       00000010      OFST:	set	16
 127                     ; 64     failures = 0;
 129  0002 5f            	clrw	x
 130  0003 1f05          	ldw	(OFST-11,sp),x
 131                     ; 67     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 133  0005 4b00          	push	#0
 134  0007 ae0000        	ldw	x,#L3_sem1
 135  000a cd0000        	call	_atomSemCreate
 137  000d 5b01          	addw	sp,#1
 138  000f 4d            	tnz	a
 139  0010 270d          	jreq	L36
 140                     ; 69         ATOMLOG (_STR("SemCreate\n"));
 142  0012 ae005a        	ldw	x,#L56
 143  0015 cd0000        	call	_printf
 145                     ; 70         failures++;
 147  0018 1e05          	ldw	x,(OFST-11,sp)
 148  001a 1c0001        	addw	x,#1
 149  001d 1f05          	ldw	(OFST-11,sp),x
 150  001f               L36:
 151                     ; 76     if (atomTimerRegister(NULL) != ATOM_ERR_PARAM)
 153  001f 5f            	clrw	x
 154  0020 cd0000        	call	_atomTimerRegister
 156  0023 a1c9          	cp	a,#201
 157  0025 270d          	jreq	L76
 158                     ; 78         ATOMLOG (_STR("Param1\n"));
 160  0027 ae0052        	ldw	x,#L17
 161  002a cd0000        	call	_printf
 163                     ; 79         failures++;
 165  002d 1e05          	ldw	x,(OFST-11,sp)
 166  002f 1c0001        	addw	x,#1
 167  0032 1f05          	ldw	(OFST-11,sp),x
 168  0034               L76:
 169                     ; 83     timer_cb.cb_ticks = 1;
 171  0034 ae0001        	ldw	x,#1
 172  0037 1f0d          	ldw	(OFST-3,sp),x
 173  0039 ae0000        	ldw	x,#0
 174  003c 1f0b          	ldw	(OFST-5,sp),x
 175                     ; 84     timer_cb.cb_func = NULL;
 177  003e 5f            	clrw	x
 178  003f 1f07          	ldw	(OFST-9,sp),x
 179                     ; 85     if (atomTimerRegister(&timer_cb) != ATOM_ERR_PARAM)
 181  0041 96            	ldw	x,sp
 182  0042 1c0007        	addw	x,#OFST-9
 183  0045 cd0000        	call	_atomTimerRegister
 185  0048 a1c9          	cp	a,#201
 186  004a 270d          	jreq	L37
 187                     ; 87         ATOMLOG (_STR("Param2\n"));
 189  004c ae004a        	ldw	x,#L57
 190  004f cd0000        	call	_printf
 192                     ; 88         failures++;
 194  0052 1e05          	ldw	x,(OFST-11,sp)
 195  0054 1c0001        	addw	x,#1
 196  0057 1f05          	ldw	(OFST-11,sp),x
 197  0059               L37:
 198                     ; 92     timer_cb.cb_ticks = 0;
 200  0059 ae0000        	ldw	x,#0
 201  005c 1f0d          	ldw	(OFST-3,sp),x
 202  005e ae0000        	ldw	x,#0
 203  0061 1f0b          	ldw	(OFST-5,sp),x
 204                     ; 93     timer_cb.cb_func = testCallback;
 206  0063 ae0000        	ldw	x,#L5_testCallback
 207  0066 1f07          	ldw	(OFST-9,sp),x
 208                     ; 94     if (atomTimerRegister(&timer_cb) != ATOM_ERR_PARAM)
 210  0068 96            	ldw	x,sp
 211  0069 1c0007        	addw	x,#OFST-9
 212  006c cd0000        	call	_atomTimerRegister
 214  006f a1c9          	cp	a,#201
 215  0071 270d          	jreq	L77
 216                     ; 96         ATOMLOG (_STR("Param3\n"));
 218  0073 ae0042        	ldw	x,#L101
 219  0076 cd0000        	call	_printf
 221                     ; 97         failures++;
 223  0079 1e05          	ldw	x,(OFST-11,sp)
 224  007b 1c0001        	addw	x,#1
 225  007e 1f05          	ldw	(OFST-11,sp),x
 226  0080               L77:
 227                     ; 108     atomTimerDelay(1);
 229  0080 ae0001        	ldw	x,#1
 230  0083 89            	pushw	x
 231  0084 ae0000        	ldw	x,#0
 232  0087 89            	pushw	x
 233  0088 cd0000        	call	_atomTimerDelay
 235  008b 5b04          	addw	sp,#4
 236                     ; 111     timer_cb.cb_ticks = 1;
 238  008d ae0001        	ldw	x,#1
 239  0090 1f0d          	ldw	(OFST-3,sp),x
 240  0092 ae0000        	ldw	x,#0
 241  0095 1f0b          	ldw	(OFST-5,sp),x
 242                     ; 114     timer_cb.cb_func = testCallback;
 244  0097 ae0000        	ldw	x,#L5_testCallback
 245  009a 1f07          	ldw	(OFST-9,sp),x
 246                     ; 115     expected_time = atomTimeGet() + timer_cb.cb_ticks;
 248  009c cd0000        	call	_atomTimeGet
 250  009f 96            	ldw	x,sp
 251  00a0 1c000b        	addw	x,#OFST-5
 252  00a3 cd0000        	call	c_ladd
 254  00a6 96            	ldw	x,sp
 255  00a7 1c0001        	addw	x,#OFST-15
 256  00aa cd0000        	call	c_rtol
 258                     ; 116     timer_cb.cb_data = &expected_time;
 260  00ad 96            	ldw	x,sp
 261  00ae 1c0001        	addw	x,#OFST-15
 262  00b1 1f09          	ldw	(OFST-7,sp),x
 263                     ; 119     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 265  00b3 96            	ldw	x,sp
 266  00b4 1c0007        	addw	x,#OFST-9
 267  00b7 cd0000        	call	_atomTimerRegister
 269  00ba 4d            	tnz	a
 270  00bb 270f          	jreq	L301
 271                     ; 121         ATOMLOG (_STR("TimerReg1\n"));
 273  00bd ae0037        	ldw	x,#L501
 274  00c0 cd0000        	call	_printf
 276                     ; 122         failures++;
 278  00c3 1e05          	ldw	x,(OFST-11,sp)
 279  00c5 1c0001        	addw	x,#1
 280  00c8 1f05          	ldw	(OFST-11,sp),x
 282  00ca 2020          	jra	L701
 283  00cc               L301:
 284                     ; 126     else if (atomSemGet (&sem1, 5) != ATOM_OK)
 286  00cc ae0005        	ldw	x,#5
 287  00cf 89            	pushw	x
 288  00d0 ae0000        	ldw	x,#0
 289  00d3 89            	pushw	x
 290  00d4 ae0000        	ldw	x,#L3_sem1
 291  00d7 cd0000        	call	_atomSemGet
 293  00da 5b04          	addw	sp,#4
 294  00dc 4d            	tnz	a
 295  00dd 270d          	jreq	L701
 296                     ; 128         ATOMLOG (_STR("Tick1\n"));
 298  00df ae0030        	ldw	x,#L311
 299  00e2 cd0000        	call	_printf
 301                     ; 129         failures++;
 303  00e5 1e05          	ldw	x,(OFST-11,sp)
 304  00e7 1c0001        	addw	x,#1
 305  00ea 1f05          	ldw	(OFST-11,sp),x
 306  00ec               L701:
 307                     ; 141     atomTimerDelay(1);
 309  00ec ae0001        	ldw	x,#1
 310  00ef 89            	pushw	x
 311  00f0 ae0000        	ldw	x,#0
 312  00f3 89            	pushw	x
 313  00f4 cd0000        	call	_atomTimerDelay
 315  00f7 5b04          	addw	sp,#4
 316                     ; 144     timer_cb.cb_ticks = 2;
 318  00f9 ae0002        	ldw	x,#2
 319  00fc 1f0d          	ldw	(OFST-3,sp),x
 320  00fe ae0000        	ldw	x,#0
 321  0101 1f0b          	ldw	(OFST-5,sp),x
 322                     ; 147     timer_cb.cb_func = testCallback;
 324  0103 ae0000        	ldw	x,#L5_testCallback
 325  0106 1f07          	ldw	(OFST-9,sp),x
 326                     ; 148     expected_time = atomTimeGet() + timer_cb.cb_ticks;
 328  0108 cd0000        	call	_atomTimeGet
 330  010b 96            	ldw	x,sp
 331  010c 1c000b        	addw	x,#OFST-5
 332  010f cd0000        	call	c_ladd
 334  0112 96            	ldw	x,sp
 335  0113 1c0001        	addw	x,#OFST-15
 336  0116 cd0000        	call	c_rtol
 338                     ; 149     timer_cb.cb_data = &expected_time;
 340  0119 96            	ldw	x,sp
 341  011a 1c0001        	addw	x,#OFST-15
 342  011d 1f09          	ldw	(OFST-7,sp),x
 343                     ; 152     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 345  011f 96            	ldw	x,sp
 346  0120 1c0007        	addw	x,#OFST-9
 347  0123 cd0000        	call	_atomTimerRegister
 349  0126 4d            	tnz	a
 350  0127 270f          	jreq	L511
 351                     ; 154         ATOMLOG (_STR("TimerReg2\n"));
 353  0129 ae0025        	ldw	x,#L711
 354  012c cd0000        	call	_printf
 356                     ; 155         failures++;
 358  012f 1e05          	ldw	x,(OFST-11,sp)
 359  0131 1c0001        	addw	x,#1
 360  0134 1f05          	ldw	(OFST-11,sp),x
 362  0136 2020          	jra	L121
 363  0138               L511:
 364                     ; 159     else if (atomSemGet (&sem1, 5) != ATOM_OK)
 366  0138 ae0005        	ldw	x,#5
 367  013b 89            	pushw	x
 368  013c ae0000        	ldw	x,#0
 369  013f 89            	pushw	x
 370  0140 ae0000        	ldw	x,#L3_sem1
 371  0143 cd0000        	call	_atomSemGet
 373  0146 5b04          	addw	sp,#4
 374  0148 4d            	tnz	a
 375  0149 270d          	jreq	L121
 376                     ; 161         ATOMLOG (_STR("Tick2\n"));
 378  014b ae001e        	ldw	x,#L521
 379  014e cd0000        	call	_printf
 381                     ; 162         failures++;
 383  0151 1e05          	ldw	x,(OFST-11,sp)
 384  0153 1c0001        	addw	x,#1
 385  0156 1f05          	ldw	(OFST-11,sp),x
 386  0158               L121:
 387                     ; 174     atomTimerDelay(1);
 389  0158 ae0001        	ldw	x,#1
 390  015b 89            	pushw	x
 391  015c ae0000        	ldw	x,#0
 392  015f 89            	pushw	x
 393  0160 cd0000        	call	_atomTimerDelay
 395  0163 5b04          	addw	sp,#4
 396                     ; 177     timer_cb.cb_ticks = 500;
 398  0165 ae01f4        	ldw	x,#500
 399  0168 1f0d          	ldw	(OFST-3,sp),x
 400  016a ae0000        	ldw	x,#0
 401  016d 1f0b          	ldw	(OFST-5,sp),x
 402                     ; 180     timer_cb.cb_func = testCallback;
 404  016f ae0000        	ldw	x,#L5_testCallback
 405  0172 1f07          	ldw	(OFST-9,sp),x
 406                     ; 181     expected_time = atomTimeGet() + timer_cb.cb_ticks;
 408  0174 cd0000        	call	_atomTimeGet
 410  0177 96            	ldw	x,sp
 411  0178 1c000b        	addw	x,#OFST-5
 412  017b cd0000        	call	c_ladd
 414  017e 96            	ldw	x,sp
 415  017f 1c0001        	addw	x,#OFST-15
 416  0182 cd0000        	call	c_rtol
 418                     ; 182     timer_cb.cb_data = &expected_time;
 420  0185 96            	ldw	x,sp
 421  0186 1c0001        	addw	x,#OFST-15
 422  0189 1f09          	ldw	(OFST-7,sp),x
 423                     ; 185     if (atomTimerRegister (&timer_cb) != ATOM_OK)
 425  018b 96            	ldw	x,sp
 426  018c 1c0007        	addw	x,#OFST-9
 427  018f cd0000        	call	_atomTimerRegister
 429  0192 4d            	tnz	a
 430  0193 270f          	jreq	L721
 431                     ; 187         ATOMLOG (_STR("TimerReg500\n"));
 433  0195 ae0011        	ldw	x,#L131
 434  0198 cd0000        	call	_printf
 436                     ; 188         failures++;
 438  019b 1e05          	ldw	x,(OFST-11,sp)
 439  019d 1c0001        	addw	x,#1
 440  01a0 1f05          	ldw	(OFST-11,sp),x
 442  01a2 2020          	jra	L331
 443  01a4               L721:
 444                     ; 192     else if (atomSemGet (&sem1, 600) != ATOM_OK)
 446  01a4 ae0258        	ldw	x,#600
 447  01a7 89            	pushw	x
 448  01a8 ae0000        	ldw	x,#0
 449  01ab 89            	pushw	x
 450  01ac ae0000        	ldw	x,#L3_sem1
 451  01af cd0000        	call	_atomSemGet
 453  01b2 5b04          	addw	sp,#4
 454  01b4 4d            	tnz	a
 455  01b5 270d          	jreq	L331
 456                     ; 194         ATOMLOG (_STR("Tick500\n"));
 458  01b7 ae0008        	ldw	x,#L731
 459  01ba cd0000        	call	_printf
 461                     ; 195         failures++;
 463  01bd 1e05          	ldw	x,(OFST-11,sp)
 464  01bf 1c0001        	addw	x,#1
 465  01c2 1f05          	ldw	(OFST-11,sp),x
 466  01c4               L331:
 467                     ; 199     if (atomSemDelete (&sem1) != ATOM_OK)
 469  01c4 ae0000        	ldw	x,#L3_sem1
 470  01c7 cd0000        	call	_atomSemDelete
 472  01ca 4d            	tnz	a
 473  01cb 270d          	jreq	L141
 474                     ; 201         ATOMLOG (_STR("Delete\n"));
 476  01cd ae0000        	ldw	x,#L341
 477  01d0 cd0000        	call	_printf
 479                     ; 202         failures++;
 481  01d3 1e05          	ldw	x,(OFST-11,sp)
 482  01d5 1c0001        	addw	x,#1
 483  01d8 1f05          	ldw	(OFST-11,sp),x
 484  01da               L141:
 485                     ; 206     return failures;
 487  01da 1e05          	ldw	x,(OFST-11,sp)
 488  01dc cd0000        	call	c_itolx
 492  01df 5b10          	addw	sp,#16
 493  01e1 81            	ret
 538                     ; 219 static void testCallback (POINTER cb_data)
 538                     ; 220 {
 539                     .text:	section	.text,new
 540  0000               L5_testCallback:
 542  0000 5204          	subw	sp,#4
 543       00000004      OFST:	set	4
 546                     ; 224     expected_end_time = *(uint32_t *)cb_data;
 548  0002 e603          	ld	a,(3,x)
 549  0004 6b04          	ld	(OFST+0,sp),a
 550  0006 e602          	ld	a,(2,x)
 551  0008 6b03          	ld	(OFST-1,sp),a
 552  000a e601          	ld	a,(1,x)
 553  000c 6b02          	ld	(OFST-2,sp),a
 554  000e f6            	ld	a,(x)
 555  000f 6b01          	ld	(OFST-3,sp),a
 556                     ; 230     if (atomTimeGet() == expected_end_time)
 558  0011 cd0000        	call	_atomTimeGet
 560  0014 96            	ldw	x,sp
 561  0015 1c0001        	addw	x,#OFST-3
 562  0018 cd0000        	call	c_lcmp
 564  001b 2606          	jrne	L761
 565                     ; 233         atomSemPut(&sem1);
 567  001d ae0000        	ldw	x,#L3_sem1
 568  0020 cd0000        	call	_atomSemPut
 571  0023               L761:
 572                     ; 243 }
 575  0023 5b04          	addw	sp,#4
 576  0025 81            	ret
 737                     	switch	.bss
 738  0000               L3_sem1:
 739  0000 000000        	ds.b	3
 740                     	xdef	_test_start
 741                     	xref	_printf
 742                     	xref	_atomSemPut
 743                     	xref	_atomSemGet
 744                     	xref	_atomSemDelete
 745                     	xref	_atomSemCreate
 746                     	xref	_atomTimeGet
 747                     	xref	_atomTimerDelay
 748                     	xref	_atomTimerRegister
 749                     .const:	section	.text
 750  0000               L341:
 751  0000 44656c657465  	dc.b	"Delete",10,0
 752  0008               L731:
 753  0008 5469636b3530  	dc.b	"Tick500",10,0
 754  0011               L131:
 755  0011 54696d657252  	dc.b	"TimerReg500",10,0
 756  001e               L521:
 757  001e 5469636b320a  	dc.b	"Tick2",10,0
 758  0025               L711:
 759  0025 54696d657252  	dc.b	"TimerReg2",10,0
 760  0030               L311:
 761  0030 5469636b310a  	dc.b	"Tick1",10,0
 762  0037               L501:
 763  0037 54696d657252  	dc.b	"TimerReg1",10,0
 764  0042               L101:
 765  0042 506172616d33  	dc.b	"Param3",10,0
 766  004a               L57:
 767  004a 506172616d32  	dc.b	"Param2",10,0
 768  0052               L17:
 769  0052 506172616d31  	dc.b	"Param1",10,0
 770  005a               L56:
 771  005a 53656d437265  	dc.b	"SemCreate",10,0
 791                     	xref	c_lcmp
 792                     	xref	c_itolx
 793                     	xref	c_rtol
 794                     	xref	c_ladd
 795                     	end
