   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               _tcbReadyQ:
   6  0000 0000          	dc.w	0
   7  0002               _atomOSStarted:
   8  0002 00            	dc.b	0
   9  0003               L3_curr_tcb:
  10  0003 0000          	dc.w	0
  11  0005               L7_atomIntCnt:
  12  0005 0000          	dc.w	0
 229                     ; 224 void atomSched (uint8_t timer_tick)
 229                     ; 225 {
 231                     	switch	.text
 232  0000               _atomSched:
 234  0000 88            	push	a
 235  0001 5203          	subw	sp,#3
 236       00000003      OFST:	set	3
 239                     ; 227     ATOM_TCB *new_tcb = NULL;
 241  0003 1e02          	ldw	x,(OFST-1,sp)
 242                     ; 235     if (atomOSStarted == FALSE)
 244  0005 3d02          	tnz	_atomOSStarted
 245  0007 2602          	jrne	L01
 246  0009 2076          	jp	L6
 247  000b               L01:
 248                     ; 238         return;
 250                     ; 242     CRITICAL_START ();
 252  000b 96            	ldw	x,sp
 253  000c 1c0001        	addw	x,#OFST-2
 255  000f 8a            push CC
 256  0010 84            pop a
 257  0011 f7            ld (X),A
 258  0012 9b            sim
 260                     ; 248     if (curr_tcb->suspended == TRUE)
 262  0013 be03          	ldw	x,L3_curr_tcb
 263  0015 e60d          	ld	a,(13,x)
 264  0017 a101          	cp	a,#1
 265  0019 2612          	jrne	L351
 266                     ; 256         new_tcb = tcbDequeueHead (&tcbReadyQ);
 268  001b ae0000        	ldw	x,#_tcbReadyQ
 269  001e cd0243        	call	_tcbDequeueHead
 271  0021 1f02          	ldw	(OFST-1,sp),x
 272                     ; 266         atomThreadSwitch (curr_tcb, new_tcb);
 274  0023 1e02          	ldw	x,(OFST-1,sp)
 275  0025 89            	pushw	x
 276  0026 be03          	ldw	x,L3_curr_tcb
 277  0028 ad5a          	call	L11_atomThreadSwitch
 279  002a 85            	popw	x
 281  002b 204d          	jra	L551
 282  002d               L351:
 283                     ; 276         if (timer_tick == TRUE)
 285  002d 7b04          	ld	a,(OFST+1,sp)
 286  002f a101          	cp	a,#1
 287  0031 260a          	jrne	L751
 288                     ; 279             lowest_pri = (int16_t)curr_tcb->priority;
 290  0033 be03          	ldw	x,L3_curr_tcb
 291  0035 e602          	ld	a,(2,x)
 292  0037 5f            	clrw	x
 293  0038 97            	ld	xl,a
 294  0039 1f02          	ldw	(OFST-1,sp),x
 296  003b 2016          	jra	L161
 297  003d               L751:
 298                     ; 281         else if (curr_tcb->priority > 0)
 300  003d be03          	ldw	x,L3_curr_tcb
 301  003f 6d02          	tnz	(2,x)
 302  0041 270b          	jreq	L361
 303                     ; 284             lowest_pri = (int16_t)(curr_tcb->priority - 1);
 305  0043 be03          	ldw	x,L3_curr_tcb
 306  0045 e602          	ld	a,(2,x)
 307  0047 5f            	clrw	x
 308  0048 97            	ld	xl,a
 309  0049 5a            	decw	x
 310  004a 1f02          	ldw	(OFST-1,sp),x
 312  004c 2005          	jra	L161
 313  004e               L361:
 314                     ; 292             lowest_pri = -1;
 316  004e aeffff        	ldw	x,#65535
 317  0051 1f02          	ldw	(OFST-1,sp),x
 318  0053               L161:
 319                     ; 296         if (lowest_pri >= 0)
 321  0053 9c            	rvf
 322  0054 1e02          	ldw	x,(OFST-1,sp)
 323  0056 2f22          	jrslt	L551
 324                     ; 299             new_tcb = tcbDequeuePriority (&tcbReadyQ, (uint8_t)lowest_pri);
 326  0058 7b03          	ld	a,(OFST+0,sp)
 327  005a 88            	push	a
 328  005b ae0000        	ldw	x,#_tcbReadyQ
 329  005e cd0321        	call	_tcbDequeuePriority
 331  0061 84            	pop	a
 332  0062 1f02          	ldw	(OFST-1,sp),x
 333                     ; 302             if (new_tcb)
 335  0064 1e02          	ldw	x,(OFST-1,sp)
 336  0066 2712          	jreq	L551
 337                     ; 305                 (void)tcbEnqueuePriority (&tcbReadyQ, curr_tcb);
 339  0068 be03          	ldw	x,L3_curr_tcb
 340  006a 89            	pushw	x
 341  006b ae0000        	ldw	x,#_tcbReadyQ
 342  006e cd01bf        	call	_tcbEnqueuePriority
 344  0071 85            	popw	x
 345                     ; 308                 atomThreadSwitch (curr_tcb, new_tcb);
 347  0072 1e02          	ldw	x,(OFST-1,sp)
 348  0074 89            	pushw	x
 349  0075 be03          	ldw	x,L3_curr_tcb
 350  0077 ad0b          	call	L11_atomThreadSwitch
 352  0079 85            	popw	x
 353  007a               L551:
 354                     ; 314     CRITICAL_END ();
 356  007a 96            	ldw	x,sp
 357  007b 1c0001        	addw	x,#OFST-2
 359  007e f6            ld A,(X)
 360  007f 88            push A
 361  0080 86            pop CC
 363                     ; 315 }
 364  0081               L6:
 367  0081 5b04          	addw	sp,#4
 368  0083 81            	ret
 419                     ; 333 static void atomThreadSwitch(ATOM_TCB *old_tcb, ATOM_TCB *new_tcb)
 419                     ; 334 {
 420                     	switch	.text
 421  0084               L11_atomThreadSwitch:
 423  0084 89            	pushw	x
 424       00000000      OFST:	set	0
 427                     ; 341     if (old_tcb != new_tcb)
 429  0085 1305          	cpw	x,(OFST+5,sp)
 430  0087 270d          	jreq	L122
 431                     ; 344         curr_tcb = new_tcb;
 433  0089 1e05          	ldw	x,(OFST+5,sp)
 434  008b bf03          	ldw	L3_curr_tcb,x
 435                     ; 347         archContextSwitch (old_tcb, new_tcb);
 437  008d 1e05          	ldw	x,(OFST+5,sp)
 438  008f 89            	pushw	x
 439  0090 1e03          	ldw	x,(OFST+3,sp)
 440  0092 cd0000        	call	_archContextSwitch
 442  0095 85            	popw	x
 443  0096               L122:
 444                     ; 355     old_tcb->suspended = FALSE;
 446  0096 1e01          	ldw	x,(OFST+1,sp)
 447  0098 6f0d          	clr	(13,x)
 448                     ; 357 }
 451  009a 85            	popw	x
 452  009b 81            	ret
 562                     ; 386 uint8_t atomThreadCreate (ATOM_TCB *tcb_ptr, uint8_t priority, void (*entry_point)(uint32_t), uint32_t entry_param, void *stack_top, uint32_t stack_size)
 562                     ; 387 {
 563                     	switch	.text
 564  009c               _atomThreadCreate:
 566  009c 89            	pushw	x
 567  009d 89            	pushw	x
 568       00000002      OFST:	set	2
 571                     ; 391     if ((tcb_ptr == NULL) || (entry_point == NULL) || (stack_top == NULL)
 571                     ; 392         || (stack_size == 0))
 573  009e a30000        	cpw	x,#0
 574  00a1 2711          	jreq	L103
 576  00a3 1e08          	ldw	x,(OFST+6,sp)
 577  00a5 270d          	jreq	L103
 579  00a7 1e0e          	ldw	x,(OFST+12,sp)
 580  00a9 2709          	jreq	L103
 582  00ab 96            	ldw	x,sp
 583  00ac 1c0010        	addw	x,#OFST+14
 584  00af cd0000        	call	c_lzmp
 586  00b2 2609          	jrne	L772
 587  00b4               L103:
 588                     ; 395         status = ATOM_ERR_PARAM;
 590  00b4 a6c9          	ld	a,#201
 591  00b6 6b02          	ld	(OFST+0,sp),a
 593  00b8               L703:
 594                     ; 483     return (status);
 596  00b8 7b02          	ld	a,(OFST+0,sp)
 599  00ba 5b04          	addw	sp,#4
 600  00bc 81            	ret
 601  00bd               L772:
 602                     ; 401         tcb_ptr->suspended = FALSE;
 604  00bd 1e03          	ldw	x,(OFST+1,sp)
 605  00bf 6f0d          	clr	(13,x)
 606                     ; 402         tcb_ptr->priority = priority;
 608  00c1 7b07          	ld	a,(OFST+5,sp)
 609  00c3 1e03          	ldw	x,(OFST+1,sp)
 610  00c5 e702          	ld	(2,x),a
 611                     ; 403         tcb_ptr->prev_tcb = NULL;
 613  00c7 1e03          	ldw	x,(OFST+1,sp)
 614  00c9 905f          	clrw	y
 615  00cb ef09          	ldw	(9,x),y
 616                     ; 404         tcb_ptr->next_tcb = NULL;
 618  00cd 1e03          	ldw	x,(OFST+1,sp)
 619  00cf 905f          	clrw	y
 620  00d1 ef0b          	ldw	(11,x),y
 621                     ; 405         tcb_ptr->suspend_timo_cb = NULL;
 623  00d3 1e03          	ldw	x,(OFST+1,sp)
 624  00d5 905f          	clrw	y
 625  00d7 ef0f          	ldw	(15,x),y
 626                     ; 412         tcb_ptr->entry_point = entry_point;
 628  00d9 1e03          	ldw	x,(OFST+1,sp)
 629  00db 1608          	ldw	y,(OFST+6,sp)
 630  00dd ef03          	ldw	(3,x),y
 631                     ; 413         tcb_ptr->entry_param = entry_param;
 633  00df 1e03          	ldw	x,(OFST+1,sp)
 634  00e1 7b0d          	ld	a,(OFST+11,sp)
 635  00e3 e708          	ld	(8,x),a
 636  00e5 7b0c          	ld	a,(OFST+10,sp)
 637  00e7 e707          	ld	(7,x),a
 638  00e9 7b0b          	ld	a,(OFST+9,sp)
 639  00eb e706          	ld	(6,x),a
 640  00ed 7b0a          	ld	a,(OFST+8,sp)
 641  00ef e705          	ld	(5,x),a
 642                     ; 440         stack_size = stack_size;
 644  00f1 96            	ldw	x,sp
 645  00f2 1c0010        	addw	x,#OFST+14
 646  00f5 cd0000        	call	c_ltor
 648                     ; 452         archThreadContextInit (tcb_ptr, stack_top, entry_point, entry_param);
 650  00f8 1e0c          	ldw	x,(OFST+10,sp)
 651  00fa 89            	pushw	x
 652  00fb 1e0c          	ldw	x,(OFST+10,sp)
 653  00fd 89            	pushw	x
 654  00fe 1e0c          	ldw	x,(OFST+10,sp)
 655  0100 89            	pushw	x
 656  0101 1e14          	ldw	x,(OFST+18,sp)
 657  0103 89            	pushw	x
 658  0104 1e0b          	ldw	x,(OFST+9,sp)
 659  0106 cd0000        	call	_archThreadContextInit
 661  0109 5b08          	addw	sp,#8
 662                     ; 455         CRITICAL_START ();
 664  010b 96            	ldw	x,sp
 665  010c 1c0001        	addw	x,#OFST-1
 667  010f 8a            push CC
 668  0110 84            pop a
 669  0111 f7            ld (X),A
 670  0112 9b            sim
 672                     ; 458         if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 674  0113 1e03          	ldw	x,(OFST+1,sp)
 675  0115 89            	pushw	x
 676  0116 ae0000        	ldw	x,#_tcbReadyQ
 677  0119 cd01bf        	call	_tcbEnqueuePriority
 679  011c 85            	popw	x
 680  011d 4d            	tnz	a
 681  011e 270d          	jreq	L113
 682                     ; 461             CRITICAL_END ();
 684  0120 96            	ldw	x,sp
 685  0121 1c0001        	addw	x,#OFST-1
 687  0124 f6            ld A,(X)
 688  0125 88            push A
 689  0126 86            pop CC
 691                     ; 464             status = ATOM_ERR_QUEUE;
 693  0127 a6cc          	ld	a,#204
 694  0129 6b02          	ld	(OFST+0,sp),a
 696  012b 208b          	jra	L703
 697  012d               L113:
 698                     ; 469             CRITICAL_END ();
 700  012d 96            	ldw	x,sp
 701  012e 1c0001        	addw	x,#OFST-1
 703  0131 f6            ld A,(X)
 704  0132 88            push A
 705  0133 86            pop CC
 707                     ; 475             if ((atomOSStarted == TRUE) && atomCurrentContext())
 709  0134 b602          	ld	a,_atomOSStarted
 710  0136 a101          	cp	a,#1
 711  0138 260b          	jrne	L513
 713  013a ad22          	call	_atomCurrentContext
 715  013c a30000        	cpw	x,#0
 716  013f 2704          	jreq	L513
 717                     ; 476                 atomSched (FALSE);
 719  0141 4f            	clr	a
 720  0142 cd0000        	call	_atomSched
 722  0145               L513:
 723                     ; 479             status = ATOM_OK;
 725  0145 0f02          	clr	(OFST+0,sp)
 726  0147 acb800b8      	jpf	L703
 750                     ; 573 void atomIntEnter (void)
 750                     ; 574 {
 751                     	switch	.text
 752  014b               _atomIntEnter:
 756                     ; 576     atomIntCnt++;
 758  014b be05          	ldw	x,L7_atomIntCnt
 759  014d 1c0001        	addw	x,#1
 760  0150 bf05          	ldw	L7_atomIntCnt,x
 761                     ; 577 }
 764  0152 81            	ret
 800                     ; 596 void atomIntExit (uint8_t timer_tick)
 800                     ; 597 {
 801                     	switch	.text
 802  0153               _atomIntExit:
 806                     ; 599     atomIntCnt--;
 808  0153 be05          	ldw	x,L7_atomIntCnt
 809  0155 1d0001        	subw	x,#1
 810  0158 bf05          	ldw	L7_atomIntCnt,x
 811                     ; 602     atomSched (timer_tick);
 813  015a cd0000        	call	_atomSched
 815                     ; 603 }
 818  015d 81            	ret
 846                     ; 616 ATOM_TCB *atomCurrentContext (void)
 846                     ; 617 {
 847                     	switch	.text
 848  015e               _atomCurrentContext:
 852                     ; 619     if (atomIntCnt == 0)
 854  015e be05          	ldw	x,L7_atomIntCnt
 855  0160 2603          	jrne	L753
 856                     ; 620         return (curr_tcb);
 858  0162 be03          	ldw	x,L3_curr_tcb
 861  0164 81            	ret
 862  0165               L753:
 863                     ; 622         return (NULL);
 865  0165 5f            	clrw	x
 868  0166 81            	ret
 930                     ; 657 uint8_t atomOSInit (void *idle_thread_stack_top, uint32_t idle_thread_stack_size)
 930                     ; 658 {
 931                     	switch	.text
 932  0167               _atomOSInit:
 934  0167 89            	pushw	x
 935  0168 88            	push	a
 936       00000001      OFST:	set	1
 939                     ; 662     curr_tcb = NULL;
 941  0169 5f            	clrw	x
 942  016a bf03          	ldw	L3_curr_tcb,x
 943                     ; 663     tcbReadyQ = NULL;
 945  016c 5f            	clrw	x
 946  016d bf00          	ldw	_tcbReadyQ,x
 947                     ; 664     atomOSStarted = FALSE;
 949  016f 3f02          	clr	_atomOSStarted
 950                     ; 667     status = atomThreadCreate(&idle_tcb,
 950                     ; 668                  IDLE_THREAD_PRIORITY,
 950                     ; 669                  atomIdleThread,
 950                     ; 670                  0,
 950                     ; 671                  idle_thread_stack_top,
 950                     ; 672                  idle_thread_stack_size);
 952  0171 1e08          	ldw	x,(OFST+7,sp)
 953  0173 89            	pushw	x
 954  0174 1e08          	ldw	x,(OFST+7,sp)
 955  0176 89            	pushw	x
 956  0177 1e06          	ldw	x,(OFST+5,sp)
 957  0179 89            	pushw	x
 958  017a ae0000        	ldw	x,#0
 959  017d 89            	pushw	x
 960  017e ae0000        	ldw	x,#0
 961  0181 89            	pushw	x
 962  0182 ae01b6        	ldw	x,#L31_atomIdleThread
 963  0185 89            	pushw	x
 964  0186 4bff          	push	#255
 965  0188 ae0000        	ldw	x,#L5_idle_tcb
 966  018b cd009c        	call	_atomThreadCreate
 968  018e 5b0d          	addw	sp,#13
 969  0190 6b01          	ld	(OFST+0,sp),a
 970                     ; 675     return (status);
 972  0192 7b01          	ld	a,(OFST+0,sp)
 975  0194 5b03          	addw	sp,#3
 976  0196 81            	ret
1018                     ; 694 void atomOSStart (void)
1018                     ; 695 {
1019                     	switch	.text
1020  0197               _atomOSStart:
1022  0197 89            	pushw	x
1023       00000002      OFST:	set	2
1026                     ; 703     atomOSStarted = TRUE;
1028  0198 35010002      	mov	_atomOSStarted,#1
1029                     ; 712     new_tcb = tcbDequeuePriority (&tcbReadyQ, 255);
1031  019c 4bff          	push	#255
1032  019e ae0000        	ldw	x,#_tcbReadyQ
1033  01a1 cd0321        	call	_tcbDequeuePriority
1035  01a4 84            	pop	a
1036  01a5 1f01          	ldw	(OFST-1,sp),x
1037                     ; 713     if (new_tcb)
1039  01a7 1e01          	ldw	x,(OFST-1,sp)
1040  01a9 2709          	jreq	L334
1041                     ; 716         curr_tcb = new_tcb;
1043  01ab 1e01          	ldw	x,(OFST-1,sp)
1044  01ad bf03          	ldw	L3_curr_tcb,x
1045                     ; 719         archFirstThreadRestore (new_tcb);
1047  01af 1e01          	ldw	x,(OFST-1,sp)
1048  01b1 cd0000        	call	_archFirstThreadRestore
1051  01b4               L334:
1052                     ; 728 }
1055  01b4 85            	popw	x
1056  01b5 81            	ret
1090                     ; 744 static void atomIdleThread (uint32_t param)
1090                     ; 745 {
1091                     	switch	.text
1092  01b6               L31_atomIdleThread:
1094       00000000      OFST:	set	0
1097                     ; 747     param = param;
1099  01b6 96            	ldw	x,sp
1100  01b7 1c0003        	addw	x,#OFST+3
1101  01ba cd0000        	call	c_ltor
1103  01bd               L354:
1105  01bd 20fe          	jra	L354
1188                     ; 780 uint8_t tcbEnqueuePriority (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1188                     ; 781 {
1189                     	switch	.text
1190  01bf               _tcbEnqueuePriority:
1192  01bf 89            	pushw	x
1193  01c0 5205          	subw	sp,#5
1194       00000005      OFST:	set	5
1197                     ; 786     if ((tcb_queue_ptr == NULL) || (tcb_ptr == NULL))
1199  01c2 a30000        	cpw	x,#0
1200  01c5 2704          	jreq	L725
1202  01c7 1e0a          	ldw	x,(OFST+5,sp)
1203  01c9 2609          	jrne	L525
1204  01cb               L725:
1205                     ; 789         status = ATOM_ERR_PARAM;
1207  01cb a6c9          	ld	a,#201
1208  01cd 6b01          	ld	(OFST-4,sp),a
1210  01cf               L135:
1211                     ; 839     return (status);
1213  01cf 7b01          	ld	a,(OFST-4,sp)
1216  01d1 5b07          	addw	sp,#7
1217  01d3 81            	ret
1218  01d4               L525:
1219                     ; 794         prev_ptr = next_ptr = *tcb_queue_ptr;
1221  01d4 1e06          	ldw	x,(OFST+1,sp)
1222  01d6 fe            	ldw	x,(x)
1223  01d7 1f04          	ldw	(OFST-1,sp),x
1224  01d9 1e04          	ldw	x,(OFST-1,sp)
1225  01db 1f02          	ldw	(OFST-3,sp),x
1226  01dd               L335:
1227                     ; 801             if ((next_ptr == NULL) || (next_ptr->priority > tcb_ptr->priority))
1229  01dd 1e04          	ldw	x,(OFST-1,sp)
1230  01df 270a          	jreq	L345
1232  01e1 1e04          	ldw	x,(OFST-1,sp)
1233  01e3 e602          	ld	a,(2,x)
1234  01e5 1e0a          	ldw	x,(OFST+5,sp)
1235  01e7 e102          	cp	a,(2,x)
1236  01e9 2346          	jrule	L145
1237  01eb               L345:
1238                     ; 804                 if (next_ptr == *tcb_queue_ptr)
1240  01eb 1e06          	ldw	x,(OFST+1,sp)
1241  01ed 9093          	ldw	y,x
1242  01ef 51            	exgw	x,y
1243  01f0 fe            	ldw	x,(x)
1244  01f1 1304          	cpw	x,(OFST-1,sp)
1245  01f3 51            	exgw	x,y
1246  01f4 261d          	jrne	L545
1247                     ; 806                     *tcb_queue_ptr = tcb_ptr;
1249  01f6 1e06          	ldw	x,(OFST+1,sp)
1250  01f8 160a          	ldw	y,(OFST+5,sp)
1251  01fa ff            	ldw	(x),y
1252                     ; 807                     tcb_ptr->prev_tcb = NULL;
1254  01fb 1e0a          	ldw	x,(OFST+5,sp)
1255  01fd 905f          	clrw	y
1256  01ff ef09          	ldw	(9,x),y
1257                     ; 808                     tcb_ptr->next_tcb = next_ptr;
1259  0201 1e0a          	ldw	x,(OFST+5,sp)
1260  0203 1604          	ldw	y,(OFST-1,sp)
1261  0205 ef0b          	ldw	(11,x),y
1262                     ; 809                     if (next_ptr)
1264  0207 1e04          	ldw	x,(OFST-1,sp)
1265  0209 2734          	jreq	L735
1266                     ; 810                         next_ptr->prev_tcb = tcb_ptr;
1268  020b 1e04          	ldw	x,(OFST-1,sp)
1269  020d 160a          	ldw	y,(OFST+5,sp)
1270  020f ef09          	ldw	(9,x),y
1271  0211 202c          	jra	L735
1272  0213               L545:
1273                     ; 815                     tcb_ptr->prev_tcb = prev_ptr;
1275  0213 1e0a          	ldw	x,(OFST+5,sp)
1276  0215 1602          	ldw	y,(OFST-3,sp)
1277  0217 ef09          	ldw	(9,x),y
1278                     ; 816                     tcb_ptr->next_tcb = next_ptr;
1280  0219 1e0a          	ldw	x,(OFST+5,sp)
1281  021b 1604          	ldw	y,(OFST-1,sp)
1282  021d ef0b          	ldw	(11,x),y
1283                     ; 817                     prev_ptr->next_tcb = tcb_ptr;
1285  021f 1e02          	ldw	x,(OFST-3,sp)
1286  0221 160a          	ldw	y,(OFST+5,sp)
1287  0223 ef0b          	ldw	(11,x),y
1288                     ; 818                     if (next_ptr)
1290  0225 1e04          	ldw	x,(OFST-1,sp)
1291  0227 2716          	jreq	L735
1292                     ; 819                         next_ptr->prev_tcb = tcb_ptr;
1294  0229 1e04          	ldw	x,(OFST-1,sp)
1295  022b 160a          	ldw	y,(OFST+5,sp)
1296  022d ef09          	ldw	(9,x),y
1297  022f 200e          	jra	L735
1298  0231               L145:
1299                     ; 828                 prev_ptr = next_ptr;
1301  0231 1e04          	ldw	x,(OFST-1,sp)
1302  0233 1f02          	ldw	(OFST-3,sp),x
1303                     ; 829                 next_ptr = next_ptr->next_tcb;
1305  0235 1e04          	ldw	x,(OFST-1,sp)
1306  0237 ee0b          	ldw	x,(11,x)
1307  0239 1f04          	ldw	(OFST-1,sp),x
1308  023b               L535:
1309                     ; 833         while (prev_ptr != NULL);
1311  023b 1e02          	ldw	x,(OFST-3,sp)
1312  023d 269e          	jrne	L335
1313  023f               L735:
1314                     ; 836         status = ATOM_OK;
1316  023f 0f01          	clr	(OFST-4,sp)
1317  0241 208c          	jra	L135
1370                     ; 865 ATOM_TCB *tcbDequeueHead (ATOM_TCB **tcb_queue_ptr)
1370                     ; 866 {
1371                     	switch	.text
1372  0243               _tcbDequeueHead:
1374  0243 89            	pushw	x
1375  0244 89            	pushw	x
1376       00000002      OFST:	set	2
1379                     ; 870     if (tcb_queue_ptr == NULL)
1381  0245 a30000        	cpw	x,#0
1382  0248 2605          	jrne	L706
1383                     ; 873         ret_ptr = NULL;
1385  024a 5f            	clrw	x
1386  024b 1f01          	ldw	(OFST-1,sp),x
1388  024d 2038          	jra	L116
1389  024f               L706:
1390                     ; 876     else if (*tcb_queue_ptr == NULL)
1392  024f 1e03          	ldw	x,(OFST+1,sp)
1393  0251 e601          	ld	a,(1,x)
1394  0253 fa            	or	a,(x)
1395  0254 2605          	jrne	L316
1396                     ; 879         ret_ptr = NULL;
1398  0256 5f            	clrw	x
1399  0257 1f01          	ldw	(OFST-1,sp),x
1401  0259 202c          	jra	L116
1402  025b               L316:
1403                     ; 884         ret_ptr = *tcb_queue_ptr;
1405  025b 1e03          	ldw	x,(OFST+1,sp)
1406  025d fe            	ldw	x,(x)
1407  025e 1f01          	ldw	(OFST-1,sp),x
1408                     ; 885         *tcb_queue_ptr = ret_ptr->next_tcb;
1410  0260 1e01          	ldw	x,(OFST-1,sp)
1411  0262 1603          	ldw	y,(OFST+1,sp)
1412  0264 89            	pushw	x
1413  0265 ee0b          	ldw	x,(11,x)
1414  0267 90ff          	ldw	(y),x
1415  0269 85            	popw	x
1416                     ; 886         if (*tcb_queue_ptr)
1418  026a 1e03          	ldw	x,(OFST+1,sp)
1419  026c e601          	ld	a,(1,x)
1420  026e fa            	or	a,(x)
1421  026f 2707          	jreq	L716
1422                     ; 887             (*tcb_queue_ptr)->prev_tcb = NULL;
1424  0271 1e03          	ldw	x,(OFST+1,sp)
1425  0273 fe            	ldw	x,(x)
1426  0274 905f          	clrw	y
1427  0276 ef09          	ldw	(9,x),y
1428  0278               L716:
1429                     ; 888         ret_ptr->next_tcb = ret_ptr->prev_tcb = NULL;
1431  0278 1e01          	ldw	x,(OFST-1,sp)
1432  027a 905f          	clrw	y
1433  027c ef09          	ldw	(9,x),y
1434  027e 1601          	ldw	y,(OFST-1,sp)
1435  0280 89            	pushw	x
1436  0281 ee09          	ldw	x,(9,x)
1437  0283 90ef0b        	ldw	(11,y),x
1438  0286 85            	popw	x
1439  0287               L116:
1440                     ; 891     return (ret_ptr);
1442  0287 1e01          	ldw	x,(OFST-1,sp)
1445  0289 5b04          	addw	sp,#4
1446  028b 81            	ret
1535                     ; 916 ATOM_TCB *tcbDequeueEntry (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1535                     ; 917 {
1536                     	switch	.text
1537  028c               _tcbDequeueEntry:
1539  028c 89            	pushw	x
1540  028d 5206          	subw	sp,#6
1541       00000006      OFST:	set	6
1544                     ; 921     if (tcb_queue_ptr == NULL)
1546  028f a30000        	cpw	x,#0
1547  0292 2605          	jrne	L376
1548                     ; 924         ret_ptr = NULL;
1550  0294 5f            	clrw	x
1551  0295 1f03          	ldw	(OFST-3,sp),x
1553  0297 200a          	jra	L576
1554  0299               L376:
1555                     ; 927     else if (*tcb_queue_ptr == NULL)
1557  0299 1e07          	ldw	x,(OFST+1,sp)
1558  029b e601          	ld	a,(1,x)
1559  029d fa            	or	a,(x)
1560  029e 2608          	jrne	L776
1561                     ; 930         ret_ptr = NULL;
1563  02a0 5f            	clrw	x
1564  02a1 1f03          	ldw	(OFST-3,sp),x
1566  02a3               L576:
1567                     ; 967     return (ret_ptr);
1569  02a3 1e03          	ldw	x,(OFST-3,sp)
1572  02a5 5b08          	addw	sp,#8
1573  02a7 81            	ret
1574  02a8               L776:
1575                     ; 935         ret_ptr = NULL;
1577  02a8 5f            	clrw	x
1578  02a9 1f03          	ldw	(OFST-3,sp),x
1579                     ; 936         prev_ptr = next_ptr = *tcb_queue_ptr;
1581  02ab 1e07          	ldw	x,(OFST+1,sp)
1582  02ad fe            	ldw	x,(x)
1583  02ae 1f05          	ldw	(OFST-1,sp),x
1584  02b0 1e05          	ldw	x,(OFST-1,sp)
1585  02b2 1f01          	ldw	(OFST-5,sp),x
1587  02b4 2065          	jra	L707
1588  02b6               L307:
1589                     ; 940             if (next_ptr == tcb_ptr)
1591  02b6 1e05          	ldw	x,(OFST-1,sp)
1592  02b8 130b          	cpw	x,(OFST+5,sp)
1593  02ba 2655          	jrne	L317
1594                     ; 942                 if (next_ptr == *tcb_queue_ptr)
1596  02bc 1e07          	ldw	x,(OFST+1,sp)
1597  02be 9093          	ldw	y,x
1598  02c0 51            	exgw	x,y
1599  02c1 fe            	ldw	x,(x)
1600  02c2 1305          	cpw	x,(OFST-1,sp)
1601  02c4 51            	exgw	x,y
1602  02c5 261a          	jrne	L517
1603                     ; 945                     *tcb_queue_ptr = next_ptr->next_tcb;
1605  02c7 1e05          	ldw	x,(OFST-1,sp)
1606  02c9 1607          	ldw	y,(OFST+1,sp)
1607  02cb 89            	pushw	x
1608  02cc ee0b          	ldw	x,(11,x)
1609  02ce 90ff          	ldw	(y),x
1610  02d0 85            	popw	x
1611                     ; 946                     if (*tcb_queue_ptr)
1613  02d1 1e07          	ldw	x,(OFST+1,sp)
1614  02d3 e601          	ld	a,(1,x)
1615  02d5 fa            	or	a,(x)
1616  02d6 2724          	jreq	L127
1617                     ; 947                         (*tcb_queue_ptr)->prev_tcb = NULL;
1619  02d8 1e07          	ldw	x,(OFST+1,sp)
1620  02da fe            	ldw	x,(x)
1621  02db 905f          	clrw	y
1622  02dd ef09          	ldw	(9,x),y
1623  02df 201b          	jra	L127
1624  02e1               L517:
1625                     ; 952                     prev_ptr->next_tcb = next_ptr->next_tcb;
1627  02e1 1e05          	ldw	x,(OFST-1,sp)
1628  02e3 1601          	ldw	y,(OFST-5,sp)
1629  02e5 89            	pushw	x
1630  02e6 ee0b          	ldw	x,(11,x)
1631  02e8 90ef0b        	ldw	(11,y),x
1632  02eb 85            	popw	x
1633                     ; 953                     if (next_ptr->next_tcb)
1635  02ec 1e05          	ldw	x,(OFST-1,sp)
1636  02ee e60c          	ld	a,(12,x)
1637  02f0 ea0b          	or	a,(11,x)
1638  02f2 2708          	jreq	L127
1639                     ; 954                         next_ptr->next_tcb->prev_tcb = prev_ptr;
1641  02f4 1e05          	ldw	x,(OFST-1,sp)
1642  02f6 ee0b          	ldw	x,(11,x)
1643  02f8 1601          	ldw	y,(OFST-5,sp)
1644  02fa ef09          	ldw	(9,x),y
1645  02fc               L127:
1646                     ; 956                 ret_ptr = next_ptr;
1648  02fc 1e05          	ldw	x,(OFST-1,sp)
1649  02fe 1f03          	ldw	(OFST-3,sp),x
1650                     ; 957                 ret_ptr->prev_tcb = ret_ptr->next_tcb = NULL;
1652  0300 1e03          	ldw	x,(OFST-3,sp)
1653  0302 905f          	clrw	y
1654  0304 ef0b          	ldw	(11,x),y
1655  0306 1603          	ldw	y,(OFST-3,sp)
1656  0308 89            	pushw	x
1657  0309 ee0b          	ldw	x,(11,x)
1658  030b 90ef09        	ldw	(9,y),x
1659  030e 85            	popw	x
1660                     ; 958                 break;
1662  030f 2092          	jra	L576
1663  0311               L317:
1664                     ; 962             prev_ptr = next_ptr;
1666  0311 1e05          	ldw	x,(OFST-1,sp)
1667  0313 1f01          	ldw	(OFST-5,sp),x
1668                     ; 963             next_ptr = next_ptr->next_tcb;
1670  0315 1e05          	ldw	x,(OFST-1,sp)
1671  0317 ee0b          	ldw	x,(11,x)
1672  0319 1f05          	ldw	(OFST-1,sp),x
1673  031b               L707:
1674                     ; 937         while (next_ptr)
1676  031b 1e05          	ldw	x,(OFST-1,sp)
1677  031d 2697          	jrne	L307
1678  031f 2082          	jra	L576
1740                     ; 997 ATOM_TCB *tcbDequeuePriority (ATOM_TCB **tcb_queue_ptr, uint8_t priority)
1740                     ; 998 {
1741                     	switch	.text
1742  0321               _tcbDequeuePriority:
1744  0321 89            	pushw	x
1745  0322 89            	pushw	x
1746       00000002      OFST:	set	2
1749                     ; 1002     if (tcb_queue_ptr == NULL)
1751  0323 a30000        	cpw	x,#0
1752  0326 2605          	jrne	L167
1753                     ; 1005         ret_ptr = NULL;
1755  0328 5f            	clrw	x
1756  0329 1f01          	ldw	(OFST-1,sp),x
1758  032b 203e          	jra	L367
1759  032d               L167:
1760                     ; 1008     else if (*tcb_queue_ptr == NULL)
1762  032d 1e03          	ldw	x,(OFST+1,sp)
1763  032f e601          	ld	a,(1,x)
1764  0331 fa            	or	a,(x)
1765  0332 2605          	jrne	L567
1766                     ; 1011         ret_ptr = NULL;
1768  0334 5f            	clrw	x
1769  0335 1f01          	ldw	(OFST-1,sp),x
1771  0337 2032          	jra	L367
1772  0339               L567:
1773                     ; 1014     else if ((*tcb_queue_ptr)->priority <= priority)
1775  0339 1e03          	ldw	x,(OFST+1,sp)
1776  033b fe            	ldw	x,(x)
1777  033c e602          	ld	a,(2,x)
1778  033e 1107          	cp	a,(OFST+5,sp)
1779  0340 2226          	jrugt	L177
1780                     ; 1017         ret_ptr = *tcb_queue_ptr;
1782  0342 1e03          	ldw	x,(OFST+1,sp)
1783  0344 fe            	ldw	x,(x)
1784  0345 1f01          	ldw	(OFST-1,sp),x
1785                     ; 1018         *tcb_queue_ptr = (*tcb_queue_ptr)->next_tcb;
1787  0347 1e03          	ldw	x,(OFST+1,sp)
1788  0349 fe            	ldw	x,(x)
1789  034a 1603          	ldw	y,(OFST+1,sp)
1790  034c 89            	pushw	x
1791  034d ee0b          	ldw	x,(11,x)
1792  034f 90ff          	ldw	(y),x
1793  0351 85            	popw	x
1794                     ; 1019         if (*tcb_queue_ptr)
1796  0352 1e03          	ldw	x,(OFST+1,sp)
1797  0354 e601          	ld	a,(1,x)
1798  0356 fa            	or	a,(x)
1799  0357 2712          	jreq	L367
1800                     ; 1021             (*tcb_queue_ptr)->prev_tcb = NULL;
1802  0359 1e03          	ldw	x,(OFST+1,sp)
1803  035b fe            	ldw	x,(x)
1804  035c 905f          	clrw	y
1805  035e ef09          	ldw	(9,x),y
1806                     ; 1022             ret_ptr->next_tcb = NULL;
1808  0360 1e01          	ldw	x,(OFST-1,sp)
1809  0362 905f          	clrw	y
1810  0364 ef0b          	ldw	(11,x),y
1811  0366 2003          	jra	L367
1812  0368               L177:
1813                     ; 1028         ret_ptr = NULL;
1815  0368 5f            	clrw	x
1816  0369 1f01          	ldw	(OFST-1,sp),x
1817  036b               L367:
1818                     ; 1031     return (ret_ptr);
1820  036b 1e01          	ldw	x,(OFST-1,sp)
1823  036d 5b04          	addw	sp,#4
1824  036f 81            	ret
1891                     	switch	.ubsct
1892  0000               L5_idle_tcb:
1893  0000 000000000000  	ds.b	17
1894                     	xref	_archFirstThreadRestore
1895                     	xref	_archThreadContextInit
1896                     	xref	_archContextSwitch
1897                     	xdef	_atomThreadCreate
1898                     	xdef	_atomCurrentContext
1899                     	xdef	_tcbDequeuePriority
1900                     	xdef	_tcbDequeueEntry
1901                     	xdef	_tcbDequeueHead
1902                     	xdef	_tcbEnqueuePriority
1903                     	xdef	_atomIntExit
1904                     	xdef	_atomIntEnter
1905                     	xdef	_atomSched
1906                     	xdef	_atomOSStart
1907                     	xdef	_atomOSInit
1908                     	xdef	_atomOSStarted
1909                     	xdef	_tcbReadyQ
1929                     	xref	c_ltor
1930                     	xref	c_lzmp
1931                     	end
