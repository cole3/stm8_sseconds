   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 122                     .const:	section	.text
 123  0000               L6:
 124  0000 00000001      	dc.l	1
 125  0004               L01:
 126  0004 00000002      	dc.l	2
 127  0008               L21:
 128  0008 000001f4      	dc.l	500
 129                     ; 57 uint32_t test_start (void)
 129                     ; 58 {
 130                     	scross	off
 131                     .text:	section	.text,new
 132  0000               _test_start:
 134  0000 5214          	subw	sp,#20
 135       00000014      OFST:	set	20
 138                     ; 64     failures = 0;
 140  0002 5f            	clrw	x
 141  0003 1f13          	ldw	(OFST-1,sp),x
 142                     ; 67     if (atomTimerDelay(0) != ATOM_ERR_PARAM)
 144  0005 ae0000        	ldw	x,#0
 145  0008 89            	pushw	x
 146  0009 ae0000        	ldw	x,#0
 147  000c 89            	pushw	x
 148  000d cd0000        	call	_atomTimerDelay
 150  0010 5b04          	addw	sp,#4
 151  0012 a1c9          	cp	a,#201
 152  0014 270d          	jreq	L56
 153                     ; 69         ATOMLOG(_STR("Param\n"));
 155  0016 ae0077        	ldw	x,#L76
 156  0019 cd0000        	call	_printf
 158                     ; 70         failures++;
 160  001c 1e13          	ldw	x,(OFST-1,sp)
 161  001e 1c0001        	addw	x,#1
 162  0021 1f13          	ldw	(OFST-1,sp),x
 163  0023               L56:
 164                     ; 74     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 166  0023 4b00          	push	#0
 167  0025 ae0000        	ldw	x,#L3_sem1
 168  0028 cd0000        	call	_atomSemCreate
 170  002b 5b01          	addw	sp,#1
 171  002d 4d            	tnz	a
 172  002e 270f          	jreq	L17
 173                     ; 76         ATOMLOG (_STR("SemCreate\n"));
 175  0030 ae006c        	ldw	x,#L37
 176  0033 cd0000        	call	_printf
 178                     ; 77         failures++;
 180  0036 1e13          	ldw	x,(OFST-1,sp)
 181  0038 1c0001        	addw	x,#1
 182  003b 1f13          	ldw	(OFST-1,sp),x
 184  003d 2061          	jra	L57
 185  003f               L17:
 186                     ; 85         timer_cb.cb_func = testCallback;
 188  003f ae0000        	ldw	x,#L5_testCallback
 189  0042 1f01          	ldw	(OFST-19,sp),x
 190                     ; 86         timer_cb.cb_data = NULL;
 192  0044 5f            	clrw	x
 193  0045 1f03          	ldw	(OFST-17,sp),x
 194                     ; 87         timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 196  0047 ae0064        	ldw	x,#100
 197  004a 1f07          	ldw	(OFST-13,sp),x
 198  004c ae0000        	ldw	x,#0
 199  004f 1f05          	ldw	(OFST-15,sp),x
 200                     ; 90         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 202  0051 96            	ldw	x,sp
 203  0052 1c0001        	addw	x,#OFST-19
 204  0055 cd0000        	call	_atomTimerRegister
 206  0058 4d            	tnz	a
 207  0059 270f          	jreq	L77
 208                     ; 92             ATOMLOG (_STR("TimerRegister\n"));
 210  005b ae005d        	ldw	x,#L101
 211  005e cd0000        	call	_printf
 213                     ; 93             failures++;
 215  0061 1e13          	ldw	x,(OFST-1,sp)
 216  0063 1c0001        	addw	x,#1
 217  0066 1f13          	ldw	(OFST-1,sp),x
 219  0068 2020          	jra	L301
 220  006a               L77:
 221                     ; 97         else if (atomSemGet (&sem1, 2 * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 223  006a ae00c8        	ldw	x,#200
 224  006d 89            	pushw	x
 225  006e ae0000        	ldw	x,#0
 226  0071 89            	pushw	x
 227  0072 ae0000        	ldw	x,#L3_sem1
 228  0075 cd0000        	call	_atomSemGet
 230  0078 5b04          	addw	sp,#4
 231  007a 4d            	tnz	a
 232  007b 270d          	jreq	L301
 233                     ; 99             ATOMLOG (_STR("Context check\n"));
 235  007d ae004e        	ldw	x,#L701
 236  0080 cd0000        	call	_printf
 238                     ; 100             failures++;
 240  0083 1e13          	ldw	x,(OFST-1,sp)
 241  0085 1c0001        	addw	x,#1
 242  0088 1f13          	ldw	(OFST-1,sp),x
 243  008a               L301:
 244                     ; 104         if (atomSemDelete (&sem1) != ATOM_OK)
 246  008a ae0000        	ldw	x,#L3_sem1
 247  008d cd0000        	call	_atomSemDelete
 249  0090 4d            	tnz	a
 250  0091 270d          	jreq	L57
 251                     ; 106             ATOMLOG (_STR("Delete\n"));
 253  0093 ae0046        	ldw	x,#L311
 254  0096 cd0000        	call	_printf
 256                     ; 107             failures++;
 258  0099 1e13          	ldw	x,(OFST-1,sp)
 259  009b 1c0001        	addw	x,#1
 260  009e 1f13          	ldw	(OFST-1,sp),x
 261  00a0               L57:
 262                     ; 123     atomTimerDelay(1);
 264  00a0 ae0001        	ldw	x,#1
 265  00a3 89            	pushw	x
 266  00a4 ae0000        	ldw	x,#0
 267  00a7 89            	pushw	x
 268  00a8 cd0000        	call	_atomTimerDelay
 270  00ab 5b04          	addw	sp,#4
 271                     ; 126     start_time = atomTimeGet();
 273  00ad cd0000        	call	_atomTimeGet
 275  00b0 96            	ldw	x,sp
 276  00b1 1c000b        	addw	x,#OFST-9
 277  00b4 cd0000        	call	c_rtol
 279                     ; 129     if (atomTimerDelay(1) != ATOM_OK)
 281  00b7 ae0001        	ldw	x,#1
 282  00ba 89            	pushw	x
 283  00bb ae0000        	ldw	x,#0
 284  00be 89            	pushw	x
 285  00bf cd0000        	call	_atomTimerDelay
 287  00c2 5b04          	addw	sp,#4
 288  00c4 4d            	tnz	a
 289  00c5 270f          	jreq	L511
 290                     ; 131         ATOMLOG (_STR("Delay1\n"));
 292  00c7 ae003e        	ldw	x,#L711
 293  00ca cd0000        	call	_printf
 295                     ; 132         failures++;
 297  00cd 1e13          	ldw	x,(OFST-1,sp)
 298  00cf 1c0001        	addw	x,#1
 299  00d2 1f13          	ldw	(OFST-1,sp),x
 301  00d4 203f          	jra	L121
 302  00d6               L511:
 303                     ; 137         end_time = atomTimeGet();
 305  00d6 cd0000        	call	_atomTimeGet
 307  00d9 96            	ldw	x,sp
 308  00da 1c000f        	addw	x,#OFST-5
 309  00dd cd0000        	call	c_rtol
 311                     ; 140         if ((end_time - start_time) != 1)
 313  00e0 96            	ldw	x,sp
 314  00e1 1c000f        	addw	x,#OFST-5
 315  00e4 cd0000        	call	c_ltor
 317  00e7 96            	ldw	x,sp
 318  00e8 1c000b        	addw	x,#OFST-9
 319  00eb cd0000        	call	c_lsub
 321  00ee ae0000        	ldw	x,#L6
 322  00f1 cd0000        	call	c_lcmp
 324  00f4 271f          	jreq	L121
 325                     ; 142             ATOMLOG (_STR("Tick1:%d\n"), (int)(end_time-start_time));
 327  00f6 96            	ldw	x,sp
 328  00f7 1c000f        	addw	x,#OFST-5
 329  00fa cd0000        	call	c_ltor
 331  00fd 96            	ldw	x,sp
 332  00fe 1c000b        	addw	x,#OFST-9
 333  0101 cd0000        	call	c_lsub
 335  0104 be02          	ldw	x,c_lreg+2
 336  0106 89            	pushw	x
 337  0107 ae0034        	ldw	x,#L521
 338  010a cd0000        	call	_printf
 340  010d 85            	popw	x
 341                     ; 143             failures++;
 343  010e 1e13          	ldw	x,(OFST-1,sp)
 344  0110 1c0001        	addw	x,#1
 345  0113 1f13          	ldw	(OFST-1,sp),x
 346  0115               L121:
 347                     ; 159     atomTimerDelay(1);
 349  0115 ae0001        	ldw	x,#1
 350  0118 89            	pushw	x
 351  0119 ae0000        	ldw	x,#0
 352  011c 89            	pushw	x
 353  011d cd0000        	call	_atomTimerDelay
 355  0120 5b04          	addw	sp,#4
 356                     ; 162     start_time = atomTimeGet();
 358  0122 cd0000        	call	_atomTimeGet
 360  0125 96            	ldw	x,sp
 361  0126 1c000b        	addw	x,#OFST-9
 362  0129 cd0000        	call	c_rtol
 364                     ; 165     if (atomTimerDelay(2) != ATOM_OK)
 366  012c ae0002        	ldw	x,#2
 367  012f 89            	pushw	x
 368  0130 ae0000        	ldw	x,#0
 369  0133 89            	pushw	x
 370  0134 cd0000        	call	_atomTimerDelay
 372  0137 5b04          	addw	sp,#4
 373  0139 4d            	tnz	a
 374  013a 270f          	jreq	L721
 375                     ; 167         ATOMLOG (_STR("Delay2\n"));
 377  013c ae002c        	ldw	x,#L131
 378  013f cd0000        	call	_printf
 380                     ; 168         failures++;
 382  0142 1e13          	ldw	x,(OFST-1,sp)
 383  0144 1c0001        	addw	x,#1
 384  0147 1f13          	ldw	(OFST-1,sp),x
 386  0149 203f          	jra	L331
 387  014b               L721:
 388                     ; 173         end_time = atomTimeGet();
 390  014b cd0000        	call	_atomTimeGet
 392  014e 96            	ldw	x,sp
 393  014f 1c000f        	addw	x,#OFST-5
 394  0152 cd0000        	call	c_rtol
 396                     ; 176         if ((end_time - start_time) != 2)
 398  0155 96            	ldw	x,sp
 399  0156 1c000f        	addw	x,#OFST-5
 400  0159 cd0000        	call	c_ltor
 402  015c 96            	ldw	x,sp
 403  015d 1c000b        	addw	x,#OFST-9
 404  0160 cd0000        	call	c_lsub
 406  0163 ae0004        	ldw	x,#L01
 407  0166 cd0000        	call	c_lcmp
 409  0169 271f          	jreq	L331
 410                     ; 178             ATOMLOG (_STR("Tick2:%d\n"), (int)(end_time-start_time));
 412  016b 96            	ldw	x,sp
 413  016c 1c000f        	addw	x,#OFST-5
 414  016f cd0000        	call	c_ltor
 416  0172 96            	ldw	x,sp
 417  0173 1c000b        	addw	x,#OFST-9
 418  0176 cd0000        	call	c_lsub
 420  0179 be02          	ldw	x,c_lreg+2
 421  017b 89            	pushw	x
 422  017c ae0022        	ldw	x,#L731
 423  017f cd0000        	call	_printf
 425  0182 85            	popw	x
 426                     ; 179             failures++;
 428  0183 1e13          	ldw	x,(OFST-1,sp)
 429  0185 1c0001        	addw	x,#1
 430  0188 1f13          	ldw	(OFST-1,sp),x
 431  018a               L331:
 432                     ; 195     atomTimerDelay(1);
 434  018a ae0001        	ldw	x,#1
 435  018d 89            	pushw	x
 436  018e ae0000        	ldw	x,#0
 437  0191 89            	pushw	x
 438  0192 cd0000        	call	_atomTimerDelay
 440  0195 5b04          	addw	sp,#4
 441                     ; 198     start_time = atomTimeGet();
 443  0197 cd0000        	call	_atomTimeGet
 445  019a 96            	ldw	x,sp
 446  019b 1c000b        	addw	x,#OFST-9
 447  019e cd0000        	call	c_rtol
 449                     ; 201     if (atomTimerDelay(500) != ATOM_OK)
 451  01a1 ae01f4        	ldw	x,#500
 452  01a4 89            	pushw	x
 453  01a5 ae0000        	ldw	x,#0
 454  01a8 89            	pushw	x
 455  01a9 cd0000        	call	_atomTimerDelay
 457  01ac 5b04          	addw	sp,#4
 458  01ae 4d            	tnz	a
 459  01af 270f          	jreq	L141
 460                     ; 203         ATOMLOG (_STR("Delay500\n"));
 462  01b1 ae0018        	ldw	x,#L341
 463  01b4 cd0000        	call	_printf
 465                     ; 204         failures++;
 467  01b7 1e13          	ldw	x,(OFST-1,sp)
 468  01b9 1c0001        	addw	x,#1
 469  01bc 1f13          	ldw	(OFST-1,sp),x
 471  01be 203f          	jra	L541
 472  01c0               L141:
 473                     ; 209         end_time = atomTimeGet();
 475  01c0 cd0000        	call	_atomTimeGet
 477  01c3 96            	ldw	x,sp
 478  01c4 1c000f        	addw	x,#OFST-5
 479  01c7 cd0000        	call	c_rtol
 481                     ; 212         if ((end_time - start_time) != 500)
 483  01ca 96            	ldw	x,sp
 484  01cb 1c000f        	addw	x,#OFST-5
 485  01ce cd0000        	call	c_ltor
 487  01d1 96            	ldw	x,sp
 488  01d2 1c000b        	addw	x,#OFST-9
 489  01d5 cd0000        	call	c_lsub
 491  01d8 ae0008        	ldw	x,#L21
 492  01db cd0000        	call	c_lcmp
 494  01de 271f          	jreq	L541
 495                     ; 214             ATOMLOG (_STR("Tick500:%d\n"), (int)(end_time-start_time));
 497  01e0 96            	ldw	x,sp
 498  01e1 1c000f        	addw	x,#OFST-5
 499  01e4 cd0000        	call	c_ltor
 501  01e7 96            	ldw	x,sp
 502  01e8 1c000b        	addw	x,#OFST-9
 503  01eb cd0000        	call	c_lsub
 505  01ee be02          	ldw	x,c_lreg+2
 506  01f0 89            	pushw	x
 507  01f1 ae000c        	ldw	x,#L151
 508  01f4 cd0000        	call	_printf
 510  01f7 85            	popw	x
 511                     ; 215             failures++;
 513  01f8 1e13          	ldw	x,(OFST-1,sp)
 514  01fa 1c0001        	addw	x,#1
 515  01fd 1f13          	ldw	(OFST-1,sp),x
 516  01ff               L541:
 517                     ; 220     return failures;
 519  01ff 1e13          	ldw	x,(OFST-1,sp)
 520  0201 cd0000        	call	c_itolx
 524  0204 5b14          	addw	sp,#20
 525  0206 81            	ret
 563                     ; 233 static void testCallback (POINTER cb_data)
 563                     ; 234 {
 564                     .text:	section	.text,new
 565  0000               L5_testCallback:
 569                     ; 236     if (atomTimerDelay(1) == ATOM_ERR_CONTEXT)
 571  0000 ae0001        	ldw	x,#1
 572  0003 89            	pushw	x
 573  0004 ae0000        	ldw	x,#0
 574  0007 89            	pushw	x
 575  0008 cd0000        	call	_atomTimerDelay
 577  000b 5b04          	addw	sp,#4
 578  000d a1c8          	cp	a,#200
 579  000f 2606          	jrne	L371
 580                     ; 239         atomSemPut(&sem1);
 582  0011 ae0000        	ldw	x,#L3_sem1
 583  0014 cd0000        	call	_atomSemPut
 586  0017               L371:
 587                     ; 249 }
 590  0017 81            	ret
 751                     	switch	.bss
 752  0000               L3_sem1:
 753  0000 000000        	ds.b	3
 754                     	xdef	_test_start
 755                     	xref	_printf
 756                     	xref	_atomSemPut
 757                     	xref	_atomSemGet
 758                     	xref	_atomSemDelete
 759                     	xref	_atomSemCreate
 760                     	xref	_atomTimeGet
 761                     	xref	_atomTimerDelay
 762                     	xref	_atomTimerRegister
 763                     	switch	.const
 764  000c               L151:
 765  000c 5469636b3530  	dc.b	"Tick500:%d",10,0
 766  0018               L341:
 767  0018 44656c617935  	dc.b	"Delay500",10,0
 768  0022               L731:
 769  0022 5469636b323a  	dc.b	"Tick2:%d",10,0
 770  002c               L131:
 771  002c 44656c617932  	dc.b	"Delay2",10,0
 772  0034               L521:
 773  0034 5469636b313a  	dc.b	"Tick1:%d",10,0
 774  003e               L711:
 775  003e 44656c617931  	dc.b	"Delay1",10,0
 776  0046               L311:
 777  0046 44656c657465  	dc.b	"Delete",10,0
 778  004e               L701:
 779  004e 436f6e746578  	dc.b	"Context check",10,0
 780  005d               L101:
 781  005d 54696d657252  	dc.b	"TimerRegister",10,0
 782  006c               L37:
 783  006c 53656d437265  	dc.b	"SemCreate",10,0
 784  0077               L76:
 785  0077 506172616d0a  	dc.b	"Param",10,0
 786                     	xref.b	c_lreg
 806                     	xref	c_itolx
 807                     	xref	c_lcmp
 808                     	xref	c_lsub
 809                     	xref	c_ltor
 810                     	xref	c_rtol
 811                     	end
