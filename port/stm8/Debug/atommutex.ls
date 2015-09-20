   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 248                     ; 144 uint8_t atomMutexCreate (ATOM_MUTEX *mutex)
 248                     ; 145 {
 250                     .text:	section	.text,new
 251  0000               _atomMutexCreate:
 253  0000 89            	pushw	x
 254  0001 88            	push	a
 255       00000001      OFST:	set	1
 258                     ; 149     if (mutex == NULL)
 260  0002 a30000        	cpw	x,#0
 261  0005 2606          	jrne	L751
 262                     ; 152         status = ATOM_ERR_PARAM;
 264  0007 a6c9          	ld	a,#201
 265  0009 6b01          	ld	(OFST+0,sp),a
 267  000b 2011          	jra	L161
 268  000d               L751:
 269                     ; 157         mutex->owner = NULL;
 271  000d 1e02          	ldw	x,(OFST+1,sp)
 272  000f 905f          	clrw	y
 273  0011 ef02          	ldw	(2,x),y
 274                     ; 160         mutex->count = 0;
 276  0013 1e02          	ldw	x,(OFST+1,sp)
 277  0015 6f04          	clr	(4,x)
 278                     ; 163         mutex->suspQ = NULL;
 280  0017 1e02          	ldw	x,(OFST+1,sp)
 281  0019 905f          	clrw	y
 282  001b ff            	ldw	(x),y
 283                     ; 166         status = ATOM_OK;
 285  001c 0f01          	clr	(OFST+0,sp)
 286  001e               L161:
 287                     ; 169     return (status);
 289  001e 7b01          	ld	a,(OFST+0,sp)
 292  0020 5b03          	addw	sp,#3
 293  0022 81            	ret
 370                     ; 193 uint8_t atomMutexDelete (ATOM_MUTEX *mutex)
 370                     ; 194 {
 371                     .text:	section	.text,new
 372  0000               _atomMutexDelete:
 374  0000 89            	pushw	x
 375  0001 5205          	subw	sp,#5
 376       00000005      OFST:	set	5
 379                     ; 198     uint8_t woken_threads = FALSE;
 381  0003 0f01          	clr	(OFST-4,sp)
 382                     ; 201     if (mutex == NULL)
 384  0005 a30000        	cpw	x,#0
 385  0008 2608          	jrne	L712
 386                     ; 204         status = ATOM_ERR_PARAM;
 388  000a a6c9          	ld	a,#201
 389  000c 6b02          	ld	(OFST-3,sp),a
 391  000e ac920092      	jpf	L122
 392  0012               L712:
 393                     ; 209         status = ATOM_OK;
 395  0012 0f02          	clr	(OFST-3,sp)
 396  0014               L322:
 397                     ; 215             CRITICAL_START ();
 399  0014 96            	ldw	x,sp
 400  0015 1c0003        	addw	x,#OFST-2
 402  0018 8a            push CC
 403  0019 84            pop a
 404  001a f7            ld (X),A
 405  001b 9b            sim
 407                     ; 218             tcb_ptr = tcbDequeueHead (&mutex->suspQ);
 409  001c 1e06          	ldw	x,(OFST+1,sp)
 410  001e cd0000        	call	_tcbDequeueHead
 412  0021 1f04          	ldw	(OFST-1,sp),x
 413                     ; 221             if (tcb_ptr)
 415  0023 1e04          	ldw	x,(OFST-1,sp)
 416  0025 2752          	jreq	L722
 417                     ; 224                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 419  0027 1e04          	ldw	x,(OFST-1,sp)
 420  0029 a6ca          	ld	a,#202
 421  002b e70e          	ld	(14,x),a
 422                     ; 227                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 424  002d 1e04          	ldw	x,(OFST-1,sp)
 425  002f 89            	pushw	x
 426  0030 ae0000        	ldw	x,#_tcbReadyQ
 427  0033 cd0000        	call	_tcbEnqueuePriority
 429  0036 85            	popw	x
 430  0037 4d            	tnz	a
 431  0038 270d          	jreq	L132
 432                     ; 230                     CRITICAL_END ();
 434  003a 96            	ldw	x,sp
 435  003b 1c0003        	addw	x,#OFST-2
 437  003e f6            ld A,(X)
 438  003f 88            push A
 439  0040 86            pop CC
 441                     ; 233                     status = ATOM_ERR_QUEUE;
 443  0041 a6cc          	ld	a,#204
 444  0043 6b02          	ld	(OFST-3,sp),a
 445                     ; 234                     break;
 447  0045 2039          	jra	L522
 448  0047               L132:
 449                     ; 238                 if (tcb_ptr->suspend_timo_cb)
 451  0047 1e04          	ldw	x,(OFST-1,sp)
 452  0049 e610          	ld	a,(16,x)
 453  004b ea0f          	or	a,(15,x)
 454  004d 271d          	jreq	L332
 455                     ; 241                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 457  004f 1e04          	ldw	x,(OFST-1,sp)
 458  0051 ee0f          	ldw	x,(15,x)
 459  0053 cd0000        	call	_atomTimerCancel
 461  0056 4d            	tnz	a
 462  0057 270d          	jreq	L532
 463                     ; 244                         CRITICAL_END ();
 465  0059 96            	ldw	x,sp
 466  005a 1c0003        	addw	x,#OFST-2
 468  005d f6            ld A,(X)
 469  005e 88            push A
 470  005f 86            pop CC
 472                     ; 247                         status = ATOM_ERR_TIMER;
 474  0060 a6cd          	ld	a,#205
 475  0062 6b02          	ld	(OFST-3,sp),a
 476                     ; 248                         break;
 478  0064 201a          	jra	L522
 479  0066               L532:
 480                     ; 252                     tcb_ptr->suspend_timo_cb = NULL;
 482  0066 1e04          	ldw	x,(OFST-1,sp)
 483  0068 905f          	clrw	y
 484  006a ef0f          	ldw	(15,x),y
 485  006c               L332:
 486                     ; 257                 CRITICAL_END ();
 488  006c 96            	ldw	x,sp
 489  006d 1c0003        	addw	x,#OFST-2
 491  0070 f6            ld A,(X)
 492  0071 88            push A
 493  0072 86            pop CC
 495                     ; 260                 woken_threads = TRUE;
 497  0073 a601          	ld	a,#1
 498  0075 6b01          	ld	(OFST-4,sp),a
 500  0077 209b          	jra	L322
 501  0079               L722:
 502                     ; 267                 CRITICAL_END ();
 504  0079 96            	ldw	x,sp
 505  007a 1c0003        	addw	x,#OFST-2
 507  007d f6            ld A,(X)
 508  007e 88            push A
 509  007f 86            pop CC
 511                     ; 268                 break;
 512  0080               L522:
 513                     ; 273         if (woken_threads == TRUE)
 515  0080 7b01          	ld	a,(OFST-4,sp)
 516  0082 a101          	cp	a,#1
 517  0084 260c          	jrne	L122
 518                     ; 279             if (atomCurrentContext())
 520  0086 cd0000        	call	_atomCurrentContext
 522  0089 a30000        	cpw	x,#0
 523  008c 2704          	jreq	L122
 524                     ; 280                 atomSched (FALSE);
 526  008e 4f            	clr	a
 527  008f cd0000        	call	_atomSched
 529  0092               L122:
 530                     ; 284     return (status);
 532  0092 7b02          	ld	a,(OFST-3,sp)
 535  0094 5b07          	addw	sp,#7
 536  0096 81            	ret
 665                     ; 340 uint8_t atomMutexGet (ATOM_MUTEX *mutex, int32_t timeout)
 665                     ; 341 {
 666                     .text:	section	.text,new
 667  0000               _atomMutexGet:
 669  0000 89            	pushw	x
 670  0001 5212          	subw	sp,#18
 671       00000012      OFST:	set	18
 674                     ; 349     if (mutex == NULL)
 676  0003 a30000        	cpw	x,#0
 677  0006 2608          	jrne	L133
 678                     ; 352         status = ATOM_ERR_PARAM;
 680  0008 a6c9          	ld	a,#201
 681  000a 6b10          	ld	(OFST-2,sp),a
 683  000c ac200120      	jpf	L333
 684  0010               L133:
 685                     ; 357         curr_tcb_ptr = atomCurrentContext();
 687  0010 cd0000        	call	_atomCurrentContext
 689  0013 1f11          	ldw	(OFST-1,sp),x
 690                     ; 360         CRITICAL_START ();
 692  0015 96            	ldw	x,sp
 693  0016 1c000f        	addw	x,#OFST-3
 695  0019 8a            push CC
 696  001a 84            pop a
 697  001b f7            ld (X),A
 698  001c 9b            sim
 700                     ; 367         if (curr_tcb_ptr == NULL)
 702  001d 1e11          	ldw	x,(OFST-1,sp)
 703  001f 260f          	jrne	L533
 704                     ; 370             CRITICAL_END ();
 706  0021 96            	ldw	x,sp
 707  0022 1c000f        	addw	x,#OFST-3
 709  0025 f6            ld A,(X)
 710  0026 88            push A
 711  0027 86            pop CC
 713                     ; 373             status = ATOM_ERR_CONTEXT;
 715  0028 a6c8          	ld	a,#200
 716  002a 6b10          	ld	(OFST-2,sp),a
 718  002c ac200120      	jpf	L333
 719  0030               L533:
 720                     ; 377         else if ((mutex->owner != NULL) && (mutex->owner != curr_tcb_ptr))
 722  0030 1e13          	ldw	x,(OFST+1,sp)
 723  0032 e603          	ld	a,(3,x)
 724  0034 ea02          	or	a,(2,x)
 725  0036 2603          	jrne	L21
 726  0038 cc00f7        	jp	L143
 727  003b               L21:
 729  003b 1e13          	ldw	x,(OFST+1,sp)
 730  003d 9093          	ldw	y,x
 731  003f 51            	exgw	x,y
 732  0040 ee02          	ldw	x,(2,x)
 733  0042 1311          	cpw	x,(OFST-1,sp)
 734  0044 51            	exgw	x,y
 735  0045 2603          	jrne	L41
 736  0047 cc00f7        	jp	L143
 737  004a               L41:
 738                     ; 380             if (timeout >= 0)
 740  004a 9c            	rvf
 741  004b 0d17          	tnz	(OFST+5,sp)
 742  004d 2e03          	jrsge	L61
 743  004f cc00ea        	jp	L343
 744  0052               L61:
 745                     ; 383                 if (tcbEnqueuePriority (&mutex->suspQ, curr_tcb_ptr) != ATOM_OK)
 747  0052 1e11          	ldw	x,(OFST-1,sp)
 748  0054 89            	pushw	x
 749  0055 1e15          	ldw	x,(OFST+3,sp)
 750  0057 cd0000        	call	_tcbEnqueuePriority
 752  005a 85            	popw	x
 753  005b 4d            	tnz	a
 754  005c 270f          	jreq	L543
 755                     ; 386                     CRITICAL_END ();
 757  005e 96            	ldw	x,sp
 758  005f 1c000f        	addw	x,#OFST-3
 760  0062 f6            ld A,(X)
 761  0063 88            push A
 762  0064 86            pop CC
 764                     ; 389                     status = ATOM_ERR_QUEUE;
 766  0065 a6cc          	ld	a,#204
 767  0067 6b10          	ld	(OFST-2,sp),a
 769  0069 ac200120      	jpf	L333
 770  006d               L543:
 771                     ; 394                     curr_tcb_ptr->suspended = TRUE;
 773  006d 1e11          	ldw	x,(OFST-1,sp)
 774  006f a601          	ld	a,#1
 775  0071 e70d          	ld	(13,x),a
 776                     ; 397                     status = ATOM_OK;
 778  0073 0f10          	clr	(OFST-2,sp)
 779                     ; 400                     if (timeout)
 781  0075 96            	ldw	x,sp
 782  0076 1c0017        	addw	x,#OFST+5
 783  0079 cd0000        	call	c_lzmp
 785  007c 2747          	jreq	L153
 786                     ; 403                         timer_data.tcb_ptr = curr_tcb_ptr;
 788  007e 1e11          	ldw	x,(OFST-1,sp)
 789  0080 1f01          	ldw	(OFST-17,sp),x
 790                     ; 404                         timer_data.mutex_ptr = mutex;
 792  0082 1e13          	ldw	x,(OFST+1,sp)
 793  0084 1f03          	ldw	(OFST-15,sp),x
 794                     ; 407                         timer_cb.cb_func = atomMutexTimerCallback;
 796  0086 ae0000        	ldw	x,#L3_atomMutexTimerCallback
 797  0089 1f05          	ldw	(OFST-13,sp),x
 798                     ; 408                         timer_cb.cb_data = (POINTER)&timer_data;
 800  008b 96            	ldw	x,sp
 801  008c 1c0001        	addw	x,#OFST-17
 802  008f 1f07          	ldw	(OFST-11,sp),x
 803                     ; 409                         timer_cb.cb_ticks = timeout;
 805  0091 1e19          	ldw	x,(OFST+7,sp)
 806  0093 1f0b          	ldw	(OFST-7,sp),x
 807  0095 1e17          	ldw	x,(OFST+5,sp)
 808  0097 1f09          	ldw	(OFST-9,sp),x
 809                     ; 416                         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 811  0099 96            	ldw	x,sp
 812  009a 1c0005        	addw	x,#OFST-13
 813  009d 1611          	ldw	y,(OFST-1,sp)
 814  009f 90ef0f        	ldw	(15,y),x
 815                     ; 419                         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 817  00a2 96            	ldw	x,sp
 818  00a3 1c0005        	addw	x,#OFST-13
 819  00a6 cd0000        	call	_atomTimerRegister
 821  00a9 4d            	tnz	a
 822  00aa 271f          	jreq	L553
 823                     ; 422                             status = ATOM_ERR_TIMER;
 825  00ac a6cd          	ld	a,#205
 826  00ae 6b10          	ld	(OFST-2,sp),a
 827                     ; 425                             (void)tcbDequeueEntry (&mutex->suspQ, curr_tcb_ptr);
 829  00b0 1e11          	ldw	x,(OFST-1,sp)
 830  00b2 89            	pushw	x
 831  00b3 1e15          	ldw	x,(OFST+3,sp)
 832  00b5 cd0000        	call	_tcbDequeueEntry
 834  00b8 85            	popw	x
 835                     ; 426                             curr_tcb_ptr->suspended = FALSE;
 837  00b9 1e11          	ldw	x,(OFST-1,sp)
 838  00bb 6f0d          	clr	(13,x)
 839                     ; 427                             curr_tcb_ptr->suspend_timo_cb = NULL;
 841  00bd 1e11          	ldw	x,(OFST-1,sp)
 842  00bf 905f          	clrw	y
 843  00c1 ef0f          	ldw	(15,x),y
 844  00c3 2006          	jra	L553
 845  00c5               L153:
 846                     ; 435                         curr_tcb_ptr->suspend_timo_cb = NULL;
 848  00c5 1e11          	ldw	x,(OFST-1,sp)
 849  00c7 905f          	clrw	y
 850  00c9 ef0f          	ldw	(15,x),y
 851  00cb               L553:
 852                     ; 439                     CRITICAL_END ();
 854  00cb 96            	ldw	x,sp
 855  00cc 1c000f        	addw	x,#OFST-3
 857  00cf f6            ld A,(X)
 858  00d0 88            push A
 859  00d1 86            pop CC
 861                     ; 442                     if (status == ATOM_OK)
 863  00d2 0d10          	tnz	(OFST-2,sp)
 864  00d4 264a          	jrne	L333
 865                     ; 449                         atomSched (FALSE);
 867  00d6 4f            	clr	a
 868  00d7 cd0000        	call	_atomSched
 870                     ; 455                         status = curr_tcb_ptr->suspend_wake_status;
 872  00da 1e11          	ldw	x,(OFST-1,sp)
 873  00dc e60e          	ld	a,(14,x)
 874  00de 6b10          	ld	(OFST-2,sp),a
 875                     ; 467                         if (status == ATOM_OK)
 877  00e0 0d10          	tnz	(OFST-2,sp)
 878  00e2 263c          	jrne	L333
 879                     ; 474                             mutex->count++;
 881  00e4 1e13          	ldw	x,(OFST+1,sp)
 882  00e6 6c04          	inc	(4,x)
 883  00e8 2036          	jra	L333
 884  00ea               L343:
 885                     ; 482                 CRITICAL_END();
 887  00ea 96            	ldw	x,sp
 888  00eb 1c000f        	addw	x,#OFST-3
 890  00ee f6            ld A,(X)
 891  00ef 88            push A
 892  00f0 86            pop CC
 894                     ; 483                 status = ATOM_WOULDBLOCK;
 896  00f1 a603          	ld	a,#3
 897  00f3 6b10          	ld	(OFST-2,sp),a
 898  00f5 2029          	jra	L333
 899  00f7               L143:
 900                     ; 491             if (mutex->count == 255)
 902  00f7 1e13          	ldw	x,(OFST+1,sp)
 903  00f9 e604          	ld	a,(4,x)
 904  00fb a1ff          	cp	a,#255
 905  00fd 2606          	jrne	L763
 906                     ; 494                 status = ATOM_ERR_OVF;
 908  00ff a6cb          	ld	a,#203
 909  0101 6b10          	ld	(OFST-2,sp),a
 911  0103 2014          	jra	L173
 912  0105               L763:
 913                     ; 499                 mutex->count++;
 915  0105 1e13          	ldw	x,(OFST+1,sp)
 916  0107 6c04          	inc	(4,x)
 917                     ; 502                 if (mutex->owner == NULL)
 919  0109 1e13          	ldw	x,(OFST+1,sp)
 920  010b e603          	ld	a,(3,x)
 921  010d ea02          	or	a,(2,x)
 922  010f 2606          	jrne	L373
 923                     ; 504                     mutex->owner = curr_tcb_ptr;
 925  0111 1e13          	ldw	x,(OFST+1,sp)
 926  0113 1611          	ldw	y,(OFST-1,sp)
 927  0115 ef02          	ldw	(2,x),y
 928  0117               L373:
 929                     ; 508                 status = ATOM_OK;
 931  0117 0f10          	clr	(OFST-2,sp)
 932  0119               L173:
 933                     ; 512             CRITICAL_END ();
 935  0119 96            	ldw	x,sp
 936  011a 1c000f        	addw	x,#OFST-3
 938  011d f6            ld A,(X)
 939  011e 88            push A
 940  011f 86            pop CC
 942  0120               L333:
 943                     ; 516     return (status);
 945  0120 7b10          	ld	a,(OFST-2,sp)
 948  0122 5b14          	addw	sp,#20
 949  0124 81            	ret
1031                     ; 546 uint8_t atomMutexPut (ATOM_MUTEX * mutex)
1031                     ; 547 {
1032                     .text:	section	.text,new
1033  0000               _atomMutexPut:
1035  0000 89            	pushw	x
1036  0001 5204          	subw	sp,#4
1037       00000004      OFST:	set	4
1040                     ; 553     if (mutex == NULL)
1042  0003 a30000        	cpw	x,#0
1043  0006 2608          	jrne	L534
1044                     ; 556         status = ATOM_ERR_PARAM;
1046  0008 a6c9          	ld	a,#201
1047  000a 6b02          	ld	(OFST-2,sp),a
1049  000c acbd00bd      	jpf	L734
1050  0010               L534:
1051                     ; 561         curr_tcb_ptr = atomCurrentContext();
1053  0010 cd0000        	call	_atomCurrentContext
1055  0013 1f03          	ldw	(OFST-1,sp),x
1056                     ; 564         CRITICAL_START ();
1058  0015 96            	ldw	x,sp
1059  0016 1c0001        	addw	x,#OFST-3
1061  0019 8a            push CC
1062  001a 84            pop a
1063  001b f7            ld (X),A
1064  001c 9b            sim
1066                     ; 567         if (mutex->owner != curr_tcb_ptr)
1068  001d 1e05          	ldw	x,(OFST+1,sp)
1069  001f 9093          	ldw	y,x
1070  0021 51            	exgw	x,y
1071  0022 ee02          	ldw	x,(2,x)
1072  0024 1303          	cpw	x,(OFST-1,sp)
1073  0026 51            	exgw	x,y
1074  0027 270f          	jreq	L144
1075                     ; 570             CRITICAL_END ();
1077  0029 96            	ldw	x,sp
1078  002a 1c0001        	addw	x,#OFST-3
1080  002d f6            ld A,(X)
1081  002e 88            push A
1082  002f 86            pop CC
1084                     ; 573             status = ATOM_ERR_OWNERSHIP;
1086  0030 a6cf          	ld	a,#207
1087  0032 6b02          	ld	(OFST-2,sp),a
1089  0034 acbd00bd      	jpf	L734
1090  0038               L144:
1091                     ; 578             mutex->count--;
1093  0038 1e05          	ldw	x,(OFST+1,sp)
1094  003a 6a04          	dec	(4,x)
1095                     ; 581             if (mutex->count == 0)
1097  003c 1e05          	ldw	x,(OFST+1,sp)
1098  003e 6d04          	tnz	(4,x)
1099  0040 2702          	jreq	L22
1100  0042 2070          	jp	L544
1101  0044               L22:
1102                     ; 584                 mutex->owner = NULL;
1104  0044 1e05          	ldw	x,(OFST+1,sp)
1105  0046 905f          	clrw	y
1106  0048 ef02          	ldw	(2,x),y
1107                     ; 587                 if (mutex->suspQ)
1109  004a 1e05          	ldw	x,(OFST+1,sp)
1110  004c e601          	ld	a,(1,x)
1111  004e fa            	or	a,(x)
1112  004f 2758          	jreq	L744
1113                     ; 594                     tcb_ptr = tcbDequeueHead (&mutex->suspQ);
1115  0051 1e05          	ldw	x,(OFST+1,sp)
1116  0053 cd0000        	call	_tcbDequeueHead
1118  0056 1f03          	ldw	(OFST-1,sp),x
1119                     ; 595                     if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1121  0058 1e03          	ldw	x,(OFST-1,sp)
1122  005a 89            	pushw	x
1123  005b ae0000        	ldw	x,#_tcbReadyQ
1124  005e cd0000        	call	_tcbEnqueuePriority
1126  0061 85            	popw	x
1127  0062 4d            	tnz	a
1128  0063 270d          	jreq	L154
1129                     ; 598                         CRITICAL_END ();
1131  0065 96            	ldw	x,sp
1132  0066 1c0001        	addw	x,#OFST-3
1134  0069 f6            ld A,(X)
1135  006a 88            push A
1136  006b 86            pop CC
1138                     ; 601                         status = ATOM_ERR_QUEUE;
1140  006c a6cc          	ld	a,#204
1141  006e 6b02          	ld	(OFST-2,sp),a
1143  0070 204b          	jra	L734
1144  0072               L154:
1145                     ; 606                         tcb_ptr->suspend_wake_status = ATOM_OK;
1147  0072 1e03          	ldw	x,(OFST-1,sp)
1148  0074 6f0e          	clr	(14,x)
1149                     ; 609                         mutex->owner = tcb_ptr;
1151  0076 1e05          	ldw	x,(OFST+1,sp)
1152  0078 1603          	ldw	y,(OFST-1,sp)
1153  007a ef02          	ldw	(2,x),y
1154                     ; 612                         if ((tcb_ptr->suspend_timo_cb != NULL)
1154                     ; 613                             && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1156  007c 1e03          	ldw	x,(OFST-1,sp)
1157  007e e610          	ld	a,(16,x)
1158  0080 ea0f          	or	a,(15,x)
1159  0082 2710          	jreq	L554
1161  0084 1e03          	ldw	x,(OFST-1,sp)
1162  0086 ee0f          	ldw	x,(15,x)
1163  0088 cd0000        	call	_atomTimerCancel
1165  008b 4d            	tnz	a
1166  008c 2706          	jreq	L554
1167                     ; 616                             status = ATOM_ERR_TIMER;
1169  008e a6cd          	ld	a,#205
1170  0090 6b02          	ld	(OFST-2,sp),a
1172  0092 2008          	jra	L754
1173  0094               L554:
1174                     ; 621                             tcb_ptr->suspend_timo_cb = NULL;
1176  0094 1e03          	ldw	x,(OFST-1,sp)
1177  0096 905f          	clrw	y
1178  0098 ef0f          	ldw	(15,x),y
1179                     ; 624                             status = ATOM_OK;
1181  009a 0f02          	clr	(OFST-2,sp)
1182  009c               L754:
1183                     ; 628                         CRITICAL_END ();
1185  009c 96            	ldw	x,sp
1186  009d 1c0001        	addw	x,#OFST-3
1188  00a0 f6            ld A,(X)
1189  00a1 88            push A
1190  00a2 86            pop CC
1192                     ; 635                         atomSched (FALSE);
1194  00a3 4f            	clr	a
1195  00a4 cd0000        	call	_atomSched
1197  00a7 2014          	jra	L734
1198  00a9               L744:
1199                     ; 646                     CRITICAL_END ();
1201  00a9 96            	ldw	x,sp
1202  00aa 1c0001        	addw	x,#OFST-3
1204  00ad f6            ld A,(X)
1205  00ae 88            push A
1206  00af 86            pop CC
1208                     ; 649                     status = ATOM_OK;
1210  00b0 0f02          	clr	(OFST-2,sp)
1211  00b2 2009          	jra	L734
1212  00b4               L544:
1213                     ; 660                 CRITICAL_END ();
1215  00b4 96            	ldw	x,sp
1216  00b5 1c0001        	addw	x,#OFST-3
1218  00b8 f6            ld A,(X)
1219  00b9 88            push A
1220  00ba 86            pop CC
1222                     ; 663                 status = ATOM_OK;
1224  00bb 0f02          	clr	(OFST-2,sp)
1225  00bd               L734:
1226                     ; 668     return (status);
1228  00bd 7b02          	ld	a,(OFST-2,sp)
1231  00bf 5b06          	addw	sp,#6
1232  00c1 81            	ret
1290                     ; 684 static void atomMutexTimerCallback (POINTER cb_data)
1290                     ; 685 {
1291                     .text:	section	.text,new
1292  0000               L3_atomMutexTimerCallback:
1294  0000 5203          	subw	sp,#3
1295       00000003      OFST:	set	3
1298                     ; 690     timer_data_ptr = (MUTEX_TIMER *)cb_data;
1300  0002 1f02          	ldw	(OFST-1,sp),x
1301                     ; 693     if (timer_data_ptr)
1303  0004 1e02          	ldw	x,(OFST-1,sp)
1304  0006 2734          	jreq	L315
1305                     ; 696         CRITICAL_START ();
1307  0008 96            	ldw	x,sp
1308  0009 1c0001        	addw	x,#OFST-2
1310  000c 8a            push CC
1311  000d 84            pop a
1312  000e f7            ld (X),A
1313  000f 9b            sim
1315                     ; 699         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1317  0010 1e02          	ldw	x,(OFST-1,sp)
1318  0012 fe            	ldw	x,(x)
1319  0013 a602          	ld	a,#2
1320  0015 e70e          	ld	(14,x),a
1321                     ; 702         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1323  0017 1e02          	ldw	x,(OFST-1,sp)
1324  0019 fe            	ldw	x,(x)
1325  001a 905f          	clrw	y
1326  001c ef0f          	ldw	(15,x),y
1327                     ; 705         (void)tcbDequeueEntry (&timer_data_ptr->mutex_ptr->suspQ, timer_data_ptr->tcb_ptr);
1329  001e 1e02          	ldw	x,(OFST-1,sp)
1330  0020 fe            	ldw	x,(x)
1331  0021 89            	pushw	x
1332  0022 1e04          	ldw	x,(OFST+1,sp)
1333  0024 ee02          	ldw	x,(2,x)
1334  0026 cd0000        	call	_tcbDequeueEntry
1336  0029 85            	popw	x
1337                     ; 708         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1339  002a 1e02          	ldw	x,(OFST-1,sp)
1340  002c fe            	ldw	x,(x)
1341  002d 89            	pushw	x
1342  002e ae0000        	ldw	x,#_tcbReadyQ
1343  0031 cd0000        	call	_tcbEnqueuePriority
1345  0034 85            	popw	x
1346                     ; 711         CRITICAL_END ();
1348  0035 96            	ldw	x,sp
1349  0036 1c0001        	addw	x,#OFST-2
1351  0039 f6            ld A,(X)
1352  003a 88            push A
1353  003b 86            pop CC
1355  003c               L315:
1356                     ; 718 }
1359  003c 5b03          	addw	sp,#3
1360  003e 81            	ret
1373                     	xdef	_atomMutexPut
1374                     	xdef	_atomMutexGet
1375                     	xdef	_atomMutexDelete
1376                     	xdef	_atomMutexCreate
1377                     	xref	_atomCurrentContext
1378                     	xref	_tcbDequeueEntry
1379                     	xref	_tcbDequeueHead
1380                     	xref	_tcbEnqueuePriority
1381                     	xref	_atomSched
1382                     	xref	_tcbReadyQ
1383                     	xref	_atomTimerCancel
1384                     	xref	_atomTimerRegister
1403                     	xref	c_lzmp
1404                     	end
