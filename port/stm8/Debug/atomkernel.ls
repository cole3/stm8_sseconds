   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.data
   5  0000               _tcbReadyQ:
   6  0000 0000          	dc.w	0
   7  0002               _atomOSStarted:
   8  0002 00            	dc.b	0
   9  0003               L3_curr_tcb:
  10  0003 0000          	dc.w	0
  11  0005               L7_atomIntCnt:
  12  0005 0000          	dc.w	0
 240                     ; 224 void atomSched (uint8_t timer_tick)
 240                     ; 225 {
 242                     .text:	section	.text,new
 243  0000               _atomSched:
 245  0000 88            	push	a
 246  0001 5203          	subw	sp,#3
 247       00000003      OFST:	set	3
 250                     ; 227     ATOM_TCB *new_tcb = NULL;
 252  0003 1e02          	ldw	x,(OFST-1,sp)
 253                     ; 235     if (atomOSStarted == FALSE)
 255  0005 725d0002      	tnz	_atomOSStarted
 256  0009 2603          	jrne	L01
 257  000b cc008d        	jp	L6
 258  000e               L01:
 259                     ; 238         return;
 261                     ; 242     CRITICAL_START ();
 263  000e 96            	ldw	x,sp
 264  000f 1c0001        	addw	x,#OFST-2
 266  0012 8a            push CC
 267  0013 84            pop a
 268  0014 f7            ld (X),A
 269  0015 9b            sim
 271                     ; 248     if (curr_tcb->suspended == TRUE)
 273  0016 ce0003        	ldw	x,L3_curr_tcb
 274  0019 e60d          	ld	a,(13,x)
 275  001b a101          	cp	a,#1
 276  001d 2614          	jrne	L351
 277                     ; 256         new_tcb = tcbDequeueHead (&tcbReadyQ);
 279  001f ae0000        	ldw	x,#_tcbReadyQ
 280  0022 cd0000        	call	_tcbDequeueHead
 282  0025 1f02          	ldw	(OFST-1,sp),x
 283                     ; 266         atomThreadSwitch (curr_tcb, new_tcb);
 285  0027 1e02          	ldw	x,(OFST-1,sp)
 286  0029 89            	pushw	x
 287  002a ce0003        	ldw	x,L3_curr_tcb
 288  002d cd0000        	call	L11_atomThreadSwitch
 290  0030 85            	popw	x
 292  0031 2053          	jra	L551
 293  0033               L351:
 294                     ; 276         if (timer_tick == TRUE)
 296  0033 7b04          	ld	a,(OFST+1,sp)
 297  0035 a101          	cp	a,#1
 298  0037 260b          	jrne	L751
 299                     ; 279             lowest_pri = (int16_t)curr_tcb->priority;
 301  0039 ce0003        	ldw	x,L3_curr_tcb
 302  003c e602          	ld	a,(2,x)
 303  003e 5f            	clrw	x
 304  003f 97            	ld	xl,a
 305  0040 1f02          	ldw	(OFST-1,sp),x
 307  0042 2018          	jra	L161
 308  0044               L751:
 309                     ; 281         else if (curr_tcb->priority > 0)
 311  0044 ce0003        	ldw	x,L3_curr_tcb
 312  0047 6d02          	tnz	(2,x)
 313  0049 270c          	jreq	L361
 314                     ; 284             lowest_pri = (int16_t)(curr_tcb->priority - 1);
 316  004b ce0003        	ldw	x,L3_curr_tcb
 317  004e e602          	ld	a,(2,x)
 318  0050 5f            	clrw	x
 319  0051 97            	ld	xl,a
 320  0052 5a            	decw	x
 321  0053 1f02          	ldw	(OFST-1,sp),x
 323  0055 2005          	jra	L161
 324  0057               L361:
 325                     ; 292             lowest_pri = -1;
 327  0057 aeffff        	ldw	x,#65535
 328  005a 1f02          	ldw	(OFST-1,sp),x
 329  005c               L161:
 330                     ; 296         if (lowest_pri >= 0)
 332  005c 9c            	rvf
 333  005d 1e02          	ldw	x,(OFST-1,sp)
 334  005f 2f25          	jrslt	L551
 335                     ; 299             new_tcb = tcbDequeuePriority (&tcbReadyQ, (uint8_t)lowest_pri);
 337  0061 7b03          	ld	a,(OFST+0,sp)
 338  0063 88            	push	a
 339  0064 ae0000        	ldw	x,#_tcbReadyQ
 340  0067 cd0000        	call	_tcbDequeuePriority
 342  006a 84            	pop	a
 343  006b 1f02          	ldw	(OFST-1,sp),x
 344                     ; 302             if (new_tcb)
 346  006d 1e02          	ldw	x,(OFST-1,sp)
 347  006f 2715          	jreq	L551
 348                     ; 305                 (void)tcbEnqueuePriority (&tcbReadyQ, curr_tcb);
 350  0071 ce0003        	ldw	x,L3_curr_tcb
 351  0074 89            	pushw	x
 352  0075 ae0000        	ldw	x,#_tcbReadyQ
 353  0078 cd0000        	call	_tcbEnqueuePriority
 355  007b 85            	popw	x
 356                     ; 308                 atomThreadSwitch (curr_tcb, new_tcb);
 358  007c 1e02          	ldw	x,(OFST-1,sp)
 359  007e 89            	pushw	x
 360  007f ce0003        	ldw	x,L3_curr_tcb
 361  0082 cd0000        	call	L11_atomThreadSwitch
 363  0085 85            	popw	x
 364  0086               L551:
 365                     ; 314     CRITICAL_END ();
 367  0086 96            	ldw	x,sp
 368  0087 1c0001        	addw	x,#OFST-2
 370  008a f6            ld A,(X)
 371  008b 88            push A
 372  008c 86            pop CC
 374                     ; 315 }
 375  008d               L6:
 378  008d 5b04          	addw	sp,#4
 379  008f 81            	ret
 430                     ; 333 static void atomThreadSwitch(ATOM_TCB *old_tcb, ATOM_TCB *new_tcb)
 430                     ; 334 {
 431                     .text:	section	.text,new
 432  0000               L11_atomThreadSwitch:
 434  0000 89            	pushw	x
 435       00000000      OFST:	set	0
 438                     ; 341     if (old_tcb != new_tcb)
 440  0001 1305          	cpw	x,(OFST+5,sp)
 441  0003 270e          	jreq	L122
 442                     ; 344         curr_tcb = new_tcb;
 444  0005 1e05          	ldw	x,(OFST+5,sp)
 445  0007 cf0003        	ldw	L3_curr_tcb,x
 446                     ; 347         archContextSwitch (old_tcb, new_tcb);
 448  000a 1e05          	ldw	x,(OFST+5,sp)
 449  000c 89            	pushw	x
 450  000d 1e03          	ldw	x,(OFST+3,sp)
 451  000f cd0000        	call	_archContextSwitch
 453  0012 85            	popw	x
 454  0013               L122:
 455                     ; 355     old_tcb->suspended = FALSE;
 457  0013 1e01          	ldw	x,(OFST+1,sp)
 458  0015 6f0d          	clr	(13,x)
 459                     ; 357 }
 462  0017 85            	popw	x
 463  0018 81            	ret
 563                     ; 386 uint8_t atomThreadCreate (ATOM_TCB *tcb_ptr, uint8_t priority, void (*entry_point)(uint32_t), uint32_t entry_param, void *stack_top, uint32_t stack_size)
 563                     ; 387 {
 564                     .text:	section	.text,new
 565  0000               _atomThreadCreate:
 567  0000 89            	pushw	x
 568  0001 5204          	subw	sp,#4
 569       00000004      OFST:	set	4
 572                     ; 391     if ((tcb_ptr == NULL) || (entry_point == NULL) || (stack_top == NULL)
 572                     ; 392         || (stack_size == 0))
 574  0003 a30000        	cpw	x,#0
 575  0006 2711          	jreq	L762
 577  0008 1e0a          	ldw	x,(OFST+6,sp)
 578  000a 270d          	jreq	L762
 580  000c 1e10          	ldw	x,(OFST+12,sp)
 581  000e 2709          	jreq	L762
 583  0010 96            	ldw	x,sp
 584  0011 1c0012        	addw	x,#OFST+14
 585  0014 cd0000        	call	c_lzmp
 587  0017 2609          	jrne	L562
 588  0019               L762:
 589                     ; 395         status = ATOM_ERR_PARAM;
 591  0019 a6c9          	ld	a,#201
 592  001b 6b04          	ld	(OFST+0,sp),a
 594  001d               L572:
 595                     ; 483     return (status);
 597  001d 7b04          	ld	a,(OFST+0,sp)
 600  001f 5b06          	addw	sp,#6
 601  0021 81            	ret
 602  0022               L562:
 603                     ; 401         tcb_ptr->suspended = FALSE;
 605  0022 1e05          	ldw	x,(OFST+1,sp)
 606  0024 6f0d          	clr	(13,x)
 607                     ; 402         tcb_ptr->priority = priority;
 609  0026 7b09          	ld	a,(OFST+5,sp)
 610  0028 1e05          	ldw	x,(OFST+1,sp)
 611  002a e702          	ld	(2,x),a
 612                     ; 403         tcb_ptr->prev_tcb = NULL;
 614  002c 1e05          	ldw	x,(OFST+1,sp)
 615  002e 905f          	clrw	y
 616  0030 ef09          	ldw	(9,x),y
 617                     ; 404         tcb_ptr->next_tcb = NULL;
 619  0032 1e05          	ldw	x,(OFST+1,sp)
 620  0034 905f          	clrw	y
 621  0036 ef0b          	ldw	(11,x),y
 622                     ; 405         tcb_ptr->suspend_timo_cb = NULL;
 624  0038 1e05          	ldw	x,(OFST+1,sp)
 625  003a 905f          	clrw	y
 626  003c ef0f          	ldw	(15,x),y
 627                     ; 412         tcb_ptr->entry_point = entry_point;
 629  003e 1e05          	ldw	x,(OFST+1,sp)
 630  0040 160a          	ldw	y,(OFST+6,sp)
 631  0042 ef03          	ldw	(3,x),y
 632                     ; 413         tcb_ptr->entry_param = entry_param;
 634  0044 1e05          	ldw	x,(OFST+1,sp)
 635  0046 7b0f          	ld	a,(OFST+11,sp)
 636  0048 e708          	ld	(8,x),a
 637  004a 7b0e          	ld	a,(OFST+10,sp)
 638  004c e707          	ld	(7,x),a
 639  004e 7b0d          	ld	a,(OFST+9,sp)
 640  0050 e706          	ld	(6,x),a
 641  0052 7b0c          	ld	a,(OFST+8,sp)
 642  0054 e705          	ld	(5,x),a
 643                     ; 424         tcb_ptr->stack_top = stack_top;
 645  0056 1e05          	ldw	x,(OFST+1,sp)
 646  0058 1610          	ldw	y,(OFST+12,sp)
 647  005a ef11          	ldw	(17,x),y
 648                     ; 425         tcb_ptr->stack_size = stack_size;
 650  005c 1e05          	ldw	x,(OFST+1,sp)
 651  005e 7b15          	ld	a,(OFST+17,sp)
 652  0060 e716          	ld	(22,x),a
 653  0062 7b14          	ld	a,(OFST+16,sp)
 654  0064 e715          	ld	(21,x),a
 655  0066 7b13          	ld	a,(OFST+15,sp)
 656  0068 e714          	ld	(20,x),a
 657  006a 7b12          	ld	a,(OFST+14,sp)
 658  006c e713          	ld	(19,x),a
 660  006e 2016          	jra	L303
 661  0070               L772:
 662                     ; 435             *((uint8_t *)stack_top - (stack_size - 1)) = STACK_CHECK_BYTE;
 664  0070 1e14          	ldw	x,(OFST+16,sp)
 665  0072 5a            	decw	x
 666  0073 1f01          	ldw	(OFST-3,sp),x
 667  0075 1e10          	ldw	x,(OFST+12,sp)
 668  0077 72f001        	subw	x,(OFST-3,sp)
 669  007a a65a          	ld	a,#90
 670  007c f7            	ld	(x),a
 671                     ; 436             stack_size--;
 673  007d 96            	ldw	x,sp
 674  007e 1c0012        	addw	x,#OFST+14
 675  0081 a601          	ld	a,#1
 676  0083 cd0000        	call	c_lgsbc
 678  0086               L303:
 679                     ; 432         while (stack_size > 0)
 681  0086 96            	ldw	x,sp
 682  0087 1c0012        	addw	x,#OFST+14
 683  008a cd0000        	call	c_lzmp
 685  008d 26e1          	jrne	L772
 686                     ; 452         archThreadContextInit (tcb_ptr, stack_top, entry_point, entry_param);
 688  008f 1e0e          	ldw	x,(OFST+10,sp)
 689  0091 89            	pushw	x
 690  0092 1e0e          	ldw	x,(OFST+10,sp)
 691  0094 89            	pushw	x
 692  0095 1e0e          	ldw	x,(OFST+10,sp)
 693  0097 89            	pushw	x
 694  0098 1e16          	ldw	x,(OFST+18,sp)
 695  009a 89            	pushw	x
 696  009b 1e0d          	ldw	x,(OFST+9,sp)
 697  009d cd0000        	call	_archThreadContextInit
 699  00a0 5b08          	addw	sp,#8
 700                     ; 455         CRITICAL_START ();
 702  00a2 96            	ldw	x,sp
 703  00a3 1c0003        	addw	x,#OFST-1
 705  00a6 8a            push CC
 706  00a7 84            pop a
 707  00a8 f7            ld (X),A
 708  00a9 9b            sim
 710                     ; 458         if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 712  00aa 1e05          	ldw	x,(OFST+1,sp)
 713  00ac 89            	pushw	x
 714  00ad ae0000        	ldw	x,#_tcbReadyQ
 715  00b0 cd0000        	call	_tcbEnqueuePriority
 717  00b3 85            	popw	x
 718  00b4 4d            	tnz	a
 719  00b5 270f          	jreq	L703
 720                     ; 461             CRITICAL_END ();
 722  00b7 96            	ldw	x,sp
 723  00b8 1c0003        	addw	x,#OFST-1
 725  00bb f6            ld A,(X)
 726  00bc 88            push A
 727  00bd 86            pop CC
 729                     ; 464             status = ATOM_ERR_QUEUE;
 731  00be a6cc          	ld	a,#204
 732  00c0 6b04          	ld	(OFST+0,sp),a
 734  00c2 ac1d001d      	jpf	L572
 735  00c6               L703:
 736                     ; 469             CRITICAL_END ();
 738  00c6 96            	ldw	x,sp
 739  00c7 1c0003        	addw	x,#OFST-1
 741  00ca f6            ld A,(X)
 742  00cb 88            push A
 743  00cc 86            pop CC
 745                     ; 475             if ((atomOSStarted == TRUE) && atomCurrentContext())
 747  00cd c60002        	ld	a,_atomOSStarted
 748  00d0 a101          	cp	a,#1
 749  00d2 260c          	jrne	L313
 751  00d4 cd0000        	call	_atomCurrentContext
 753  00d7 a30000        	cpw	x,#0
 754  00da 2704          	jreq	L313
 755                     ; 476                 atomSched (FALSE);
 757  00dc 4f            	clr	a
 758  00dd cd0000        	call	_atomSched
 760  00e0               L313:
 761                     ; 479             status = ATOM_OK;
 763  00e0 0f04          	clr	(OFST+0,sp)
 764  00e2 ac1d001d      	jpf	L572
 846                     ; 518 uint8_t atomThreadStackCheck (ATOM_TCB *tcb_ptr, uint32_t *used_bytes, uint32_t *free_bytes)
 846                     ; 519 {
 847                     .text:	section	.text,new
 848  0000               _atomThreadStackCheck:
 850  0000 89            	pushw	x
 851  0001 5209          	subw	sp,#9
 852       00000009      OFST:	set	9
 855                     ; 524     if ((tcb_ptr == NULL) || (used_bytes == NULL) || (free_bytes == NULL))
 857  0003 a30000        	cpw	x,#0
 858  0006 2708          	jreq	L753
 860  0008 1e0e          	ldw	x,(OFST+5,sp)
 861  000a 2704          	jreq	L753
 863  000c 1e10          	ldw	x,(OFST+7,sp)
 864  000e 2609          	jrne	L553
 865  0010               L753:
 866                     ; 527         status = ATOM_ERR_PARAM;
 868  0010 a6c9          	ld	a,#201
 869  0012 6b05          	ld	(OFST-4,sp),a
 871  0014               L363:
 872                     ; 557     return (status);
 874  0014 7b05          	ld	a,(OFST-4,sp)
 877  0016 5b0b          	addw	sp,#11
 878  0018 81            	ret
 879  0019               L553:
 880                     ; 535         stack_ptr = (uint8_t *)tcb_ptr->stack_top - (tcb_ptr->stack_size - 1);
 882  0019 1e0a          	ldw	x,(OFST+1,sp)
 883  001b ee15          	ldw	x,(21,x)
 884  001d 5a            	decw	x
 885  001e 1f03          	ldw	(OFST-6,sp),x
 886  0020 1e0a          	ldw	x,(OFST+1,sp)
 887  0022 ee11          	ldw	x,(17,x)
 888  0024 72f003        	subw	x,(OFST-6,sp)
 889  0027 1f06          	ldw	(OFST-3,sp),x
 890                     ; 536         for (i = 0; i < tcb_ptr->stack_size; i++)
 892  0029 5f            	clrw	x
 893  002a 1f08          	ldw	(OFST-1,sp),x
 895  002c 2036          	jra	L173
 896  002e               L563:
 897                     ; 539             if (*stack_ptr++ != STACK_CHECK_BYTE)
 899  002e 1e06          	ldw	x,(OFST-3,sp)
 900  0030 1c0001        	addw	x,#1
 901  0033 1f06          	ldw	(OFST-3,sp),x
 902  0035 1d0001        	subw	x,#1
 903  0038 f6            	ld	a,(x)
 904  0039 a15a          	cp	a,#90
 905  003b 2720          	jreq	L573
 906                     ; 542                 break;
 907  003d               L373:
 908                     ; 547         *free_bytes = (uint32_t)i;
 910  003d 1e08          	ldw	x,(OFST-1,sp)
 911  003f cd0000        	call	c_itolx
 913  0042 1e10          	ldw	x,(OFST+7,sp)
 914  0044 cd0000        	call	c_rtol
 916                     ; 550         *used_bytes = tcb_ptr->stack_size - *free_bytes;
 918  0047 1e0a          	ldw	x,(OFST+1,sp)
 919  0049 1c0013        	addw	x,#19
 920  004c cd0000        	call	c_ltor
 922  004f 1e10          	ldw	x,(OFST+7,sp)
 923  0051 cd0000        	call	c_lsub
 925  0054 1e0e          	ldw	x,(OFST+5,sp)
 926  0056 cd0000        	call	c_rtol
 928                     ; 553         status = ATOM_OK;
 930  0059 0f05          	clr	(OFST-4,sp)
 931  005b 20b7          	jra	L363
 932  005d               L573:
 933                     ; 536         for (i = 0; i < tcb_ptr->stack_size; i++)
 935  005d 1e08          	ldw	x,(OFST-1,sp)
 936  005f 1c0001        	addw	x,#1
 937  0062 1f08          	ldw	(OFST-1,sp),x
 938  0064               L173:
 941  0064 1e08          	ldw	x,(OFST-1,sp)
 942  0066 cd0000        	call	c_itolx
 944  0069 96            	ldw	x,sp
 945  006a 1c0001        	addw	x,#OFST-8
 946  006d cd0000        	call	c_rtol
 948  0070 1e0a          	ldw	x,(OFST+1,sp)
 949  0072 1c0013        	addw	x,#19
 950  0075 cd0000        	call	c_ltor
 952  0078 96            	ldw	x,sp
 953  0079 1c0001        	addw	x,#OFST-8
 954  007c cd0000        	call	c_lcmp
 956  007f 22ad          	jrugt	L563
 957  0081 20ba          	jra	L373
 981                     ; 573 void atomIntEnter (void)
 981                     ; 574 {
 982                     .text:	section	.text,new
 983  0000               _atomIntEnter:
 987                     ; 576     atomIntCnt++;
 989  0000 ce0005        	ldw	x,L7_atomIntCnt
 990  0003 1c0001        	addw	x,#1
 991  0006 cf0005        	ldw	L7_atomIntCnt,x
 992                     ; 577 }
 995  0009 81            	ret
1029                     ; 596 void atomIntExit (uint8_t timer_tick)
1029                     ; 597 {
1030                     .text:	section	.text,new
1031  0000               _atomIntExit:
1035                     ; 599     atomIntCnt--;
1037  0000 ce0005        	ldw	x,L7_atomIntCnt
1038  0003 1d0001        	subw	x,#1
1039  0006 cf0005        	ldw	L7_atomIntCnt,x
1040                     ; 602     atomSched (timer_tick);
1042  0009 cd0000        	call	_atomSched
1044                     ; 603 }
1047  000c 81            	ret
1075                     ; 616 ATOM_TCB *atomCurrentContext (void)
1075                     ; 617 {
1076                     .text:	section	.text,new
1077  0000               _atomCurrentContext:
1081                     ; 619     if (atomIntCnt == 0)
1083  0000 ce0005        	ldw	x,L7_atomIntCnt
1084  0003 2604          	jrne	L534
1085                     ; 620         return (curr_tcb);
1087  0005 ce0003        	ldw	x,L3_curr_tcb
1090  0008 81            	ret
1091  0009               L534:
1092                     ; 622         return (NULL);
1094  0009 5f            	clrw	x
1097  000a 81            	ret
1155                     ; 657 uint8_t atomOSInit (void *idle_thread_stack_top, uint32_t idle_thread_stack_size)
1155                     ; 658 {
1156                     .text:	section	.text,new
1157  0000               _atomOSInit:
1159  0000 89            	pushw	x
1160  0001 88            	push	a
1161       00000001      OFST:	set	1
1164                     ; 662     curr_tcb = NULL;
1166  0002 5f            	clrw	x
1167  0003 cf0003        	ldw	L3_curr_tcb,x
1168                     ; 663     tcbReadyQ = NULL;
1170  0006 5f            	clrw	x
1171  0007 cf0000        	ldw	_tcbReadyQ,x
1172                     ; 664     atomOSStarted = FALSE;
1174  000a 725f0002      	clr	_atomOSStarted
1175                     ; 667     status = atomThreadCreate(&idle_tcb,
1175                     ; 668                  IDLE_THREAD_PRIORITY,
1175                     ; 669                  atomIdleThread,
1175                     ; 670                  0,
1175                     ; 671                  idle_thread_stack_top,
1175                     ; 672                  idle_thread_stack_size);
1177  000e 1e08          	ldw	x,(OFST+7,sp)
1178  0010 89            	pushw	x
1179  0011 1e08          	ldw	x,(OFST+7,sp)
1180  0013 89            	pushw	x
1181  0014 1e06          	ldw	x,(OFST+5,sp)
1182  0016 89            	pushw	x
1183  0017 ae0000        	ldw	x,#0
1184  001a 89            	pushw	x
1185  001b ae0000        	ldw	x,#0
1186  001e 89            	pushw	x
1187  001f ae0000        	ldw	x,#L31_atomIdleThread
1188  0022 89            	pushw	x
1189  0023 4bff          	push	#255
1190  0025 ae0000        	ldw	x,#L5_idle_tcb
1191  0028 cd0000        	call	_atomThreadCreate
1193  002b 5b0d          	addw	sp,#13
1194  002d 6b01          	ld	(OFST+0,sp),a
1195                     ; 675     return (status);
1197  002f 7b01          	ld	a,(OFST+0,sp)
1200  0031 5b03          	addw	sp,#3
1201  0033 81            	ret
1243                     ; 694 void atomOSStart (void)
1243                     ; 695 {
1244                     .text:	section	.text,new
1245  0000               _atomOSStart:
1247  0000 89            	pushw	x
1248       00000002      OFST:	set	2
1251                     ; 703     atomOSStarted = TRUE;
1253  0001 35010002      	mov	_atomOSStarted,#1
1254                     ; 712     new_tcb = tcbDequeuePriority (&tcbReadyQ, 255);
1256  0005 4bff          	push	#255
1257  0007 ae0000        	ldw	x,#_tcbReadyQ
1258  000a cd0000        	call	_tcbDequeuePriority
1260  000d 84            	pop	a
1261  000e 1f01          	ldw	(OFST-1,sp),x
1262                     ; 713     if (new_tcb)
1264  0010 1e01          	ldw	x,(OFST-1,sp)
1265  0012 270a          	jreq	L505
1266                     ; 716         curr_tcb = new_tcb;
1268  0014 1e01          	ldw	x,(OFST-1,sp)
1269  0016 cf0003        	ldw	L3_curr_tcb,x
1270                     ; 719         archFirstThreadRestore (new_tcb);
1272  0019 1e01          	ldw	x,(OFST-1,sp)
1273  001b cd0000        	call	_archFirstThreadRestore
1276  001e               L505:
1277                     ; 728 }
1280  001e 85            	popw	x
1281  001f 81            	ret
1313                     ; 744 static void atomIdleThread (uint32_t param)
1313                     ; 745 {
1314                     .text:	section	.text,new
1315  0000               L31_atomIdleThread:
1317       00000000      OFST:	set	0
1320                     ; 747     param = param;
1322  0000 96            	ldw	x,sp
1323  0001 1c0003        	addw	x,#OFST+3
1324  0004 cd0000        	call	c_ltor
1326  0007               L325:
1328  0007 20fe          	jra	L325
1409                     ; 780 uint8_t tcbEnqueuePriority (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1409                     ; 781 {
1410                     .text:	section	.text,new
1411  0000               _tcbEnqueuePriority:
1413  0000 89            	pushw	x
1414  0001 5205          	subw	sp,#5
1415       00000005      OFST:	set	5
1418                     ; 786     if ((tcb_queue_ptr == NULL) || (tcb_ptr == NULL))
1420  0003 a30000        	cpw	x,#0
1421  0006 2704          	jreq	L575
1423  0008 1e0a          	ldw	x,(OFST+5,sp)
1424  000a 2609          	jrne	L375
1425  000c               L575:
1426                     ; 789         status = ATOM_ERR_PARAM;
1428  000c a6c9          	ld	a,#201
1429  000e 6b01          	ld	(OFST-4,sp),a
1431  0010               L775:
1432                     ; 839     return (status);
1434  0010 7b01          	ld	a,(OFST-4,sp)
1437  0012 5b07          	addw	sp,#7
1438  0014 81            	ret
1439  0015               L375:
1440                     ; 794         prev_ptr = next_ptr = *tcb_queue_ptr;
1442  0015 1e06          	ldw	x,(OFST+1,sp)
1443  0017 fe            	ldw	x,(x)
1444  0018 1f04          	ldw	(OFST-1,sp),x
1445  001a 1e04          	ldw	x,(OFST-1,sp)
1446  001c 1f02          	ldw	(OFST-3,sp),x
1447  001e               L106:
1448                     ; 801             if ((next_ptr == NULL) || (next_ptr->priority > tcb_ptr->priority))
1450  001e 1e04          	ldw	x,(OFST-1,sp)
1451  0020 270a          	jreq	L116
1453  0022 1e04          	ldw	x,(OFST-1,sp)
1454  0024 e602          	ld	a,(2,x)
1455  0026 1e0a          	ldw	x,(OFST+5,sp)
1456  0028 e102          	cp	a,(2,x)
1457  002a 2346          	jrule	L706
1458  002c               L116:
1459                     ; 804                 if (next_ptr == *tcb_queue_ptr)
1461  002c 1e06          	ldw	x,(OFST+1,sp)
1462  002e 9093          	ldw	y,x
1463  0030 51            	exgw	x,y
1464  0031 fe            	ldw	x,(x)
1465  0032 1304          	cpw	x,(OFST-1,sp)
1466  0034 51            	exgw	x,y
1467  0035 261d          	jrne	L316
1468                     ; 806                     *tcb_queue_ptr = tcb_ptr;
1470  0037 1e06          	ldw	x,(OFST+1,sp)
1471  0039 160a          	ldw	y,(OFST+5,sp)
1472  003b ff            	ldw	(x),y
1473                     ; 807                     tcb_ptr->prev_tcb = NULL;
1475  003c 1e0a          	ldw	x,(OFST+5,sp)
1476  003e 905f          	clrw	y
1477  0040 ef09          	ldw	(9,x),y
1478                     ; 808                     tcb_ptr->next_tcb = next_ptr;
1480  0042 1e0a          	ldw	x,(OFST+5,sp)
1481  0044 1604          	ldw	y,(OFST-1,sp)
1482  0046 ef0b          	ldw	(11,x),y
1483                     ; 809                     if (next_ptr)
1485  0048 1e04          	ldw	x,(OFST-1,sp)
1486  004a 2734          	jreq	L506
1487                     ; 810                         next_ptr->prev_tcb = tcb_ptr;
1489  004c 1e04          	ldw	x,(OFST-1,sp)
1490  004e 160a          	ldw	y,(OFST+5,sp)
1491  0050 ef09          	ldw	(9,x),y
1492  0052 202c          	jra	L506
1493  0054               L316:
1494                     ; 815                     tcb_ptr->prev_tcb = prev_ptr;
1496  0054 1e0a          	ldw	x,(OFST+5,sp)
1497  0056 1602          	ldw	y,(OFST-3,sp)
1498  0058 ef09          	ldw	(9,x),y
1499                     ; 816                     tcb_ptr->next_tcb = next_ptr;
1501  005a 1e0a          	ldw	x,(OFST+5,sp)
1502  005c 1604          	ldw	y,(OFST-1,sp)
1503  005e ef0b          	ldw	(11,x),y
1504                     ; 817                     prev_ptr->next_tcb = tcb_ptr;
1506  0060 1e02          	ldw	x,(OFST-3,sp)
1507  0062 160a          	ldw	y,(OFST+5,sp)
1508  0064 ef0b          	ldw	(11,x),y
1509                     ; 818                     if (next_ptr)
1511  0066 1e04          	ldw	x,(OFST-1,sp)
1512  0068 2716          	jreq	L506
1513                     ; 819                         next_ptr->prev_tcb = tcb_ptr;
1515  006a 1e04          	ldw	x,(OFST-1,sp)
1516  006c 160a          	ldw	y,(OFST+5,sp)
1517  006e ef09          	ldw	(9,x),y
1518  0070 200e          	jra	L506
1519  0072               L706:
1520                     ; 828                 prev_ptr = next_ptr;
1522  0072 1e04          	ldw	x,(OFST-1,sp)
1523  0074 1f02          	ldw	(OFST-3,sp),x
1524                     ; 829                 next_ptr = next_ptr->next_tcb;
1526  0076 1e04          	ldw	x,(OFST-1,sp)
1527  0078 ee0b          	ldw	x,(11,x)
1528  007a 1f04          	ldw	(OFST-1,sp),x
1529  007c               L306:
1530                     ; 833         while (prev_ptr != NULL);
1532  007c 1e02          	ldw	x,(OFST-3,sp)
1533  007e 269e          	jrne	L106
1534  0080               L506:
1535                     ; 836         status = ATOM_OK;
1537  0080 0f01          	clr	(OFST-4,sp)
1538  0082 208c          	jra	L775
1591                     ; 865 ATOM_TCB *tcbDequeueHead (ATOM_TCB **tcb_queue_ptr)
1591                     ; 866 {
1592                     .text:	section	.text,new
1593  0000               _tcbDequeueHead:
1595  0000 89            	pushw	x
1596  0001 89            	pushw	x
1597       00000002      OFST:	set	2
1600                     ; 870     if (tcb_queue_ptr == NULL)
1602  0002 a30000        	cpw	x,#0
1603  0005 2605          	jrne	L556
1604                     ; 873         ret_ptr = NULL;
1606  0007 5f            	clrw	x
1607  0008 1f01          	ldw	(OFST-1,sp),x
1609  000a 2038          	jra	L756
1610  000c               L556:
1611                     ; 876     else if (*tcb_queue_ptr == NULL)
1613  000c 1e03          	ldw	x,(OFST+1,sp)
1614  000e e601          	ld	a,(1,x)
1615  0010 fa            	or	a,(x)
1616  0011 2605          	jrne	L166
1617                     ; 879         ret_ptr = NULL;
1619  0013 5f            	clrw	x
1620  0014 1f01          	ldw	(OFST-1,sp),x
1622  0016 202c          	jra	L756
1623  0018               L166:
1624                     ; 884         ret_ptr = *tcb_queue_ptr;
1626  0018 1e03          	ldw	x,(OFST+1,sp)
1627  001a fe            	ldw	x,(x)
1628  001b 1f01          	ldw	(OFST-1,sp),x
1629                     ; 885         *tcb_queue_ptr = ret_ptr->next_tcb;
1631  001d 1e01          	ldw	x,(OFST-1,sp)
1632  001f 1603          	ldw	y,(OFST+1,sp)
1633  0021 89            	pushw	x
1634  0022 ee0b          	ldw	x,(11,x)
1635  0024 90ff          	ldw	(y),x
1636  0026 85            	popw	x
1637                     ; 886         if (*tcb_queue_ptr)
1639  0027 1e03          	ldw	x,(OFST+1,sp)
1640  0029 e601          	ld	a,(1,x)
1641  002b fa            	or	a,(x)
1642  002c 2707          	jreq	L566
1643                     ; 887             (*tcb_queue_ptr)->prev_tcb = NULL;
1645  002e 1e03          	ldw	x,(OFST+1,sp)
1646  0030 fe            	ldw	x,(x)
1647  0031 905f          	clrw	y
1648  0033 ef09          	ldw	(9,x),y
1649  0035               L566:
1650                     ; 888         ret_ptr->next_tcb = ret_ptr->prev_tcb = NULL;
1652  0035 1e01          	ldw	x,(OFST-1,sp)
1653  0037 905f          	clrw	y
1654  0039 ef09          	ldw	(9,x),y
1655  003b 1601          	ldw	y,(OFST-1,sp)
1656  003d 89            	pushw	x
1657  003e ee09          	ldw	x,(9,x)
1658  0040 90ef0b        	ldw	(11,y),x
1659  0043 85            	popw	x
1660  0044               L756:
1661                     ; 891     return (ret_ptr);
1663  0044 1e01          	ldw	x,(OFST-1,sp)
1666  0046 5b04          	addw	sp,#4
1667  0048 81            	ret
1756                     ; 916 ATOM_TCB *tcbDequeueEntry (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1756                     ; 917 {
1757                     .text:	section	.text,new
1758  0000               _tcbDequeueEntry:
1760  0000 89            	pushw	x
1761  0001 5206          	subw	sp,#6
1762       00000006      OFST:	set	6
1765                     ; 921     if (tcb_queue_ptr == NULL)
1767  0003 a30000        	cpw	x,#0
1768  0006 2605          	jrne	L147
1769                     ; 924         ret_ptr = NULL;
1771  0008 5f            	clrw	x
1772  0009 1f03          	ldw	(OFST-3,sp),x
1774  000b 200a          	jra	L347
1775  000d               L147:
1776                     ; 927     else if (*tcb_queue_ptr == NULL)
1778  000d 1e07          	ldw	x,(OFST+1,sp)
1779  000f e601          	ld	a,(1,x)
1780  0011 fa            	or	a,(x)
1781  0012 2608          	jrne	L547
1782                     ; 930         ret_ptr = NULL;
1784  0014 5f            	clrw	x
1785  0015 1f03          	ldw	(OFST-3,sp),x
1787  0017               L347:
1788                     ; 967     return (ret_ptr);
1790  0017 1e03          	ldw	x,(OFST-3,sp)
1793  0019 5b08          	addw	sp,#8
1794  001b 81            	ret
1795  001c               L547:
1796                     ; 935         ret_ptr = NULL;
1798  001c 5f            	clrw	x
1799  001d 1f03          	ldw	(OFST-3,sp),x
1800                     ; 936         prev_ptr = next_ptr = *tcb_queue_ptr;
1802  001f 1e07          	ldw	x,(OFST+1,sp)
1803  0021 fe            	ldw	x,(x)
1804  0022 1f05          	ldw	(OFST-1,sp),x
1805  0024 1e05          	ldw	x,(OFST-1,sp)
1806  0026 1f01          	ldw	(OFST-5,sp),x
1808  0028 2065          	jra	L557
1809  002a               L157:
1810                     ; 940             if (next_ptr == tcb_ptr)
1812  002a 1e05          	ldw	x,(OFST-1,sp)
1813  002c 130b          	cpw	x,(OFST+5,sp)
1814  002e 2655          	jrne	L167
1815                     ; 942                 if (next_ptr == *tcb_queue_ptr)
1817  0030 1e07          	ldw	x,(OFST+1,sp)
1818  0032 9093          	ldw	y,x
1819  0034 51            	exgw	x,y
1820  0035 fe            	ldw	x,(x)
1821  0036 1305          	cpw	x,(OFST-1,sp)
1822  0038 51            	exgw	x,y
1823  0039 261a          	jrne	L367
1824                     ; 945                     *tcb_queue_ptr = next_ptr->next_tcb;
1826  003b 1e05          	ldw	x,(OFST-1,sp)
1827  003d 1607          	ldw	y,(OFST+1,sp)
1828  003f 89            	pushw	x
1829  0040 ee0b          	ldw	x,(11,x)
1830  0042 90ff          	ldw	(y),x
1831  0044 85            	popw	x
1832                     ; 946                     if (*tcb_queue_ptr)
1834  0045 1e07          	ldw	x,(OFST+1,sp)
1835  0047 e601          	ld	a,(1,x)
1836  0049 fa            	or	a,(x)
1837  004a 2724          	jreq	L767
1838                     ; 947                         (*tcb_queue_ptr)->prev_tcb = NULL;
1840  004c 1e07          	ldw	x,(OFST+1,sp)
1841  004e fe            	ldw	x,(x)
1842  004f 905f          	clrw	y
1843  0051 ef09          	ldw	(9,x),y
1844  0053 201b          	jra	L767
1845  0055               L367:
1846                     ; 952                     prev_ptr->next_tcb = next_ptr->next_tcb;
1848  0055 1e05          	ldw	x,(OFST-1,sp)
1849  0057 1601          	ldw	y,(OFST-5,sp)
1850  0059 89            	pushw	x
1851  005a ee0b          	ldw	x,(11,x)
1852  005c 90ef0b        	ldw	(11,y),x
1853  005f 85            	popw	x
1854                     ; 953                     if (next_ptr->next_tcb)
1856  0060 1e05          	ldw	x,(OFST-1,sp)
1857  0062 e60c          	ld	a,(12,x)
1858  0064 ea0b          	or	a,(11,x)
1859  0066 2708          	jreq	L767
1860                     ; 954                         next_ptr->next_tcb->prev_tcb = prev_ptr;
1862  0068 1e05          	ldw	x,(OFST-1,sp)
1863  006a ee0b          	ldw	x,(11,x)
1864  006c 1601          	ldw	y,(OFST-5,sp)
1865  006e ef09          	ldw	(9,x),y
1866  0070               L767:
1867                     ; 956                 ret_ptr = next_ptr;
1869  0070 1e05          	ldw	x,(OFST-1,sp)
1870  0072 1f03          	ldw	(OFST-3,sp),x
1871                     ; 957                 ret_ptr->prev_tcb = ret_ptr->next_tcb = NULL;
1873  0074 1e03          	ldw	x,(OFST-3,sp)
1874  0076 905f          	clrw	y
1875  0078 ef0b          	ldw	(11,x),y
1876  007a 1603          	ldw	y,(OFST-3,sp)
1877  007c 89            	pushw	x
1878  007d ee0b          	ldw	x,(11,x)
1879  007f 90ef09        	ldw	(9,y),x
1880  0082 85            	popw	x
1881                     ; 958                 break;
1883  0083 2092          	jra	L347
1884  0085               L167:
1885                     ; 962             prev_ptr = next_ptr;
1887  0085 1e05          	ldw	x,(OFST-1,sp)
1888  0087 1f01          	ldw	(OFST-5,sp),x
1889                     ; 963             next_ptr = next_ptr->next_tcb;
1891  0089 1e05          	ldw	x,(OFST-1,sp)
1892  008b ee0b          	ldw	x,(11,x)
1893  008d 1f05          	ldw	(OFST-1,sp),x
1894  008f               L557:
1895                     ; 937         while (next_ptr)
1897  008f 1e05          	ldw	x,(OFST-1,sp)
1898  0091 2697          	jrne	L157
1899  0093 2082          	jra	L347
1959                     ; 997 ATOM_TCB *tcbDequeuePriority (ATOM_TCB **tcb_queue_ptr, uint8_t priority)
1959                     ; 998 {
1960                     .text:	section	.text,new
1961  0000               _tcbDequeuePriority:
1963  0000 89            	pushw	x
1964  0001 89            	pushw	x
1965       00000002      OFST:	set	2
1968                     ; 1002     if (tcb_queue_ptr == NULL)
1970  0002 a30000        	cpw	x,#0
1971  0005 2605          	jrne	L5201
1972                     ; 1005         ret_ptr = NULL;
1974  0007 5f            	clrw	x
1975  0008 1f01          	ldw	(OFST-1,sp),x
1977  000a 203e          	jra	L7201
1978  000c               L5201:
1979                     ; 1008     else if (*tcb_queue_ptr == NULL)
1981  000c 1e03          	ldw	x,(OFST+1,sp)
1982  000e e601          	ld	a,(1,x)
1983  0010 fa            	or	a,(x)
1984  0011 2605          	jrne	L1301
1985                     ; 1011         ret_ptr = NULL;
1987  0013 5f            	clrw	x
1988  0014 1f01          	ldw	(OFST-1,sp),x
1990  0016 2032          	jra	L7201
1991  0018               L1301:
1992                     ; 1014     else if ((*tcb_queue_ptr)->priority <= priority)
1994  0018 1e03          	ldw	x,(OFST+1,sp)
1995  001a fe            	ldw	x,(x)
1996  001b e602          	ld	a,(2,x)
1997  001d 1107          	cp	a,(OFST+5,sp)
1998  001f 2226          	jrugt	L5301
1999                     ; 1017         ret_ptr = *tcb_queue_ptr;
2001  0021 1e03          	ldw	x,(OFST+1,sp)
2002  0023 fe            	ldw	x,(x)
2003  0024 1f01          	ldw	(OFST-1,sp),x
2004                     ; 1018         *tcb_queue_ptr = (*tcb_queue_ptr)->next_tcb;
2006  0026 1e03          	ldw	x,(OFST+1,sp)
2007  0028 fe            	ldw	x,(x)
2008  0029 1603          	ldw	y,(OFST+1,sp)
2009  002b 89            	pushw	x
2010  002c ee0b          	ldw	x,(11,x)
2011  002e 90ff          	ldw	(y),x
2012  0030 85            	popw	x
2013                     ; 1019         if (*tcb_queue_ptr)
2015  0031 1e03          	ldw	x,(OFST+1,sp)
2016  0033 e601          	ld	a,(1,x)
2017  0035 fa            	or	a,(x)
2018  0036 2712          	jreq	L7201
2019                     ; 1021             (*tcb_queue_ptr)->prev_tcb = NULL;
2021  0038 1e03          	ldw	x,(OFST+1,sp)
2022  003a fe            	ldw	x,(x)
2023  003b 905f          	clrw	y
2024  003d ef09          	ldw	(9,x),y
2025                     ; 1022             ret_ptr->next_tcb = NULL;
2027  003f 1e01          	ldw	x,(OFST-1,sp)
2028  0041 905f          	clrw	y
2029  0043 ef0b          	ldw	(11,x),y
2030  0045 2003          	jra	L7201
2031  0047               L5301:
2032                     ; 1028         ret_ptr = NULL;
2034  0047 5f            	clrw	x
2035  0048 1f01          	ldw	(OFST-1,sp),x
2036  004a               L7201:
2037                     ; 1031     return (ret_ptr);
2039  004a 1e01          	ldw	x,(OFST-1,sp)
2042  004c 5b04          	addw	sp,#4
2043  004e 81            	ret
2106                     	switch	.bss
2107  0000               L5_idle_tcb:
2108  0000 000000000000  	ds.b	23
2109                     	xref	_archFirstThreadRestore
2110                     	xref	_archThreadContextInit
2111                     	xref	_archContextSwitch
2112                     	xdef	_atomThreadStackCheck
2113                     	xdef	_atomThreadCreate
2114                     	xdef	_atomCurrentContext
2115                     	xdef	_tcbDequeuePriority
2116                     	xdef	_tcbDequeueEntry
2117                     	xdef	_tcbDequeueHead
2118                     	xdef	_tcbEnqueuePriority
2119                     	xdef	_atomIntExit
2120                     	xdef	_atomIntEnter
2121                     	xdef	_atomSched
2122                     	xdef	_atomOSStart
2123                     	xdef	_atomOSInit
2124                     	xdef	_atomOSStarted
2125                     	xdef	_tcbReadyQ
2145                     	xref	c_lsub
2146                     	xref	c_lcmp
2147                     	xref	c_rtol
2148                     	xref	c_itolx
2149                     	xref	c_ltor
2150                     	xref	c_lgsbc
2151                     	xref	c_lzmp
2152                     	end
