   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 243                     ; 129 uint8_t atomSemCreate (ATOM_SEM *sem, uint8_t initial_count)
 243                     ; 130 {
 245                     .text:	section	.text,new
 246  0000               _atomSemCreate:
 248  0000 89            	pushw	x
 249  0001 88            	push	a
 250       00000001      OFST:	set	1
 253                     ; 134     if (sem == NULL)
 255  0002 a30000        	cpw	x,#0
 256  0005 2606          	jrne	L351
 257                     ; 137         status = ATOM_ERR_PARAM;
 259  0007 a6c9          	ld	a,#201
 260  0009 6b01          	ld	(OFST+0,sp),a
 262  000b 200d          	jra	L551
 263  000d               L351:
 264                     ; 142         sem->count = initial_count;
 266  000d 7b06          	ld	a,(OFST+5,sp)
 267  000f 1e02          	ldw	x,(OFST+1,sp)
 268  0011 e702          	ld	(2,x),a
 269                     ; 145         sem->suspQ = NULL;
 271  0013 1e02          	ldw	x,(OFST+1,sp)
 272  0015 905f          	clrw	y
 273  0017 ff            	ldw	(x),y
 274                     ; 148         status = ATOM_OK;
 276  0018 0f01          	clr	(OFST+0,sp)
 277  001a               L551:
 278                     ; 151     return (status);
 280  001a 7b01          	ld	a,(OFST+0,sp)
 283  001c 5b03          	addw	sp,#3
 284  001e 81            	ret
 361                     ; 175 uint8_t atomSemDelete (ATOM_SEM *sem)
 361                     ; 176 {
 362                     .text:	section	.text,new
 363  0000               _atomSemDelete:
 365  0000 89            	pushw	x
 366  0001 5205          	subw	sp,#5
 367       00000005      OFST:	set	5
 370                     ; 180     uint8_t woken_threads = FALSE;
 372  0003 0f01          	clr	(OFST-4,sp)
 373                     ; 183     if (sem == NULL)
 375  0005 a30000        	cpw	x,#0
 376  0008 2608          	jrne	L312
 377                     ; 186         status = ATOM_ERR_PARAM;
 379  000a a6c9          	ld	a,#201
 380  000c 6b02          	ld	(OFST-3,sp),a
 382  000e ac920092      	jpf	L512
 383  0012               L312:
 384                     ; 191         status = ATOM_OK;
 386  0012 0f02          	clr	(OFST-3,sp)
 387  0014               L712:
 388                     ; 197             CRITICAL_START ();
 390  0014 96            	ldw	x,sp
 391  0015 1c0003        	addw	x,#OFST-2
 393  0018 8a            push CC
 394  0019 84            pop a
 395  001a f7            ld (X),A
 396  001b 9b            sim
 398                     ; 200             tcb_ptr = tcbDequeueHead (&sem->suspQ);
 400  001c 1e06          	ldw	x,(OFST+1,sp)
 401  001e cd0000        	call	_tcbDequeueHead
 403  0021 1f04          	ldw	(OFST-1,sp),x
 404                     ; 203             if (tcb_ptr)
 406  0023 1e04          	ldw	x,(OFST-1,sp)
 407  0025 2752          	jreq	L322
 408                     ; 206                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 410  0027 1e04          	ldw	x,(OFST-1,sp)
 411  0029 a6ca          	ld	a,#202
 412  002b e70e          	ld	(14,x),a
 413                     ; 209                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 415  002d 1e04          	ldw	x,(OFST-1,sp)
 416  002f 89            	pushw	x
 417  0030 ae0000        	ldw	x,#_tcbReadyQ
 418  0033 cd0000        	call	_tcbEnqueuePriority
 420  0036 85            	popw	x
 421  0037 4d            	tnz	a
 422  0038 270d          	jreq	L522
 423                     ; 212                     CRITICAL_END ();
 425  003a 96            	ldw	x,sp
 426  003b 1c0003        	addw	x,#OFST-2
 428  003e f6            ld A,(X)
 429  003f 88            push A
 430  0040 86            pop CC
 432                     ; 215                     status = ATOM_ERR_QUEUE;
 434  0041 a6cc          	ld	a,#204
 435  0043 6b02          	ld	(OFST-3,sp),a
 436                     ; 216                     break;
 438  0045 2039          	jra	L122
 439  0047               L522:
 440                     ; 220                 if (tcb_ptr->suspend_timo_cb)
 442  0047 1e04          	ldw	x,(OFST-1,sp)
 443  0049 e610          	ld	a,(16,x)
 444  004b ea0f          	or	a,(15,x)
 445  004d 271d          	jreq	L722
 446                     ; 223                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 448  004f 1e04          	ldw	x,(OFST-1,sp)
 449  0051 ee0f          	ldw	x,(15,x)
 450  0053 cd0000        	call	_atomTimerCancel
 452  0056 4d            	tnz	a
 453  0057 270d          	jreq	L132
 454                     ; 226                         CRITICAL_END ();
 456  0059 96            	ldw	x,sp
 457  005a 1c0003        	addw	x,#OFST-2
 459  005d f6            ld A,(X)
 460  005e 88            push A
 461  005f 86            pop CC
 463                     ; 229                         status = ATOM_ERR_TIMER;
 465  0060 a6cd          	ld	a,#205
 466  0062 6b02          	ld	(OFST-3,sp),a
 467                     ; 230                         break;
 469  0064 201a          	jra	L122
 470  0066               L132:
 471                     ; 234                     tcb_ptr->suspend_timo_cb = NULL;
 473  0066 1e04          	ldw	x,(OFST-1,sp)
 474  0068 905f          	clrw	y
 475  006a ef0f          	ldw	(15,x),y
 476  006c               L722:
 477                     ; 239                 CRITICAL_END ();
 479  006c 96            	ldw	x,sp
 480  006d 1c0003        	addw	x,#OFST-2
 482  0070 f6            ld A,(X)
 483  0071 88            push A
 484  0072 86            pop CC
 486                     ; 242                 woken_threads = TRUE;
 488  0073 a601          	ld	a,#1
 489  0075 6b01          	ld	(OFST-4,sp),a
 491  0077 209b          	jra	L712
 492  0079               L322:
 493                     ; 249                 CRITICAL_END ();
 495  0079 96            	ldw	x,sp
 496  007a 1c0003        	addw	x,#OFST-2
 498  007d f6            ld A,(X)
 499  007e 88            push A
 500  007f 86            pop CC
 502                     ; 250                 break;
 503  0080               L122:
 504                     ; 255         if (woken_threads == TRUE)
 506  0080 7b01          	ld	a,(OFST-4,sp)
 507  0082 a101          	cp	a,#1
 508  0084 260c          	jrne	L512
 509                     ; 261             if (atomCurrentContext())
 511  0086 cd0000        	call	_atomCurrentContext
 513  0089 a30000        	cpw	x,#0
 514  008c 2704          	jreq	L512
 515                     ; 262                 atomSched (FALSE);
 517  008e 4f            	clr	a
 518  008f cd0000        	call	_atomSched
 520  0092               L512:
 521                     ; 266     return (status);
 523  0092 7b02          	ld	a,(OFST-3,sp)
 526  0094 5b07          	addw	sp,#7
 527  0096 81            	ret
 656                     ; 314 uint8_t atomSemGet (ATOM_SEM *sem, int32_t timeout)
 656                     ; 315 {
 657                     .text:	section	.text,new
 658  0000               _atomSemGet:
 660  0000 89            	pushw	x
 661  0001 5212          	subw	sp,#18
 662       00000012      OFST:	set	18
 665                     ; 323     if (sem == NULL)
 667  0003 a30000        	cpw	x,#0
 668  0006 2608          	jrne	L523
 669                     ; 326         status = ATOM_ERR_PARAM;
 671  0008 a6c9          	ld	a,#201
 672  000a 6b10          	ld	(OFST-2,sp),a
 674  000c acec00ec      	jpf	L723
 675  0010               L523:
 676                     ; 331         CRITICAL_START ();
 678  0010 96            	ldw	x,sp
 679  0011 1c000f        	addw	x,#OFST-3
 681  0014 8a            push CC
 682  0015 84            pop a
 683  0016 f7            ld (X),A
 684  0017 9b            sim
 686                     ; 334         if (sem->count == 0)
 688  0018 1e13          	ldw	x,(OFST+1,sp)
 689  001a 6d02          	tnz	(2,x)
 690  001c 2703          	jreq	L21
 691  001e cc00df        	jp	L133
 692  0021               L21:
 693                     ; 337             if (timeout >= 0)
 695  0021 9c            	rvf
 696  0022 0d17          	tnz	(OFST+5,sp)
 697  0024 2e03          	jrsge	L41
 698  0026 cc00d2        	jp	L333
 699  0029               L41:
 700                     ; 342                 curr_tcb_ptr = atomCurrentContext();
 702  0029 cd0000        	call	_atomCurrentContext
 704  002c 1f11          	ldw	(OFST-1,sp),x
 705                     ; 345                 if (curr_tcb_ptr)
 707  002e 1e11          	ldw	x,(OFST-1,sp)
 708  0030 2603          	jrne	L61
 709  0032 cc00c5        	jp	L533
 710  0035               L61:
 711                     ; 348                     if (tcbEnqueuePriority (&sem->suspQ, curr_tcb_ptr) != ATOM_OK)
 713  0035 1e11          	ldw	x,(OFST-1,sp)
 714  0037 89            	pushw	x
 715  0038 1e15          	ldw	x,(OFST+3,sp)
 716  003a cd0000        	call	_tcbEnqueuePriority
 718  003d 85            	popw	x
 719  003e 4d            	tnz	a
 720  003f 270f          	jreq	L733
 721                     ; 351                         CRITICAL_END ();
 723  0041 96            	ldw	x,sp
 724  0042 1c000f        	addw	x,#OFST-3
 726  0045 f6            ld A,(X)
 727  0046 88            push A
 728  0047 86            pop CC
 730                     ; 354                         status = ATOM_ERR_QUEUE;
 732  0048 a6cc          	ld	a,#204
 733  004a 6b10          	ld	(OFST-2,sp),a
 735  004c acec00ec      	jpf	L723
 736  0050               L733:
 737                     ; 359                         curr_tcb_ptr->suspended = TRUE;
 739  0050 1e11          	ldw	x,(OFST-1,sp)
 740  0052 a601          	ld	a,#1
 741  0054 e70d          	ld	(13,x),a
 742                     ; 362                         status = ATOM_OK;
 744  0056 0f10          	clr	(OFST-2,sp)
 745                     ; 365                         if (timeout)
 747  0058 96            	ldw	x,sp
 748  0059 1c0017        	addw	x,#OFST+5
 749  005c cd0000        	call	c_lzmp
 751  005f 2747          	jreq	L343
 752                     ; 368                             timer_data.tcb_ptr = curr_tcb_ptr;
 754  0061 1e11          	ldw	x,(OFST-1,sp)
 755  0063 1f01          	ldw	(OFST-17,sp),x
 756                     ; 369                             timer_data.sem_ptr = sem;
 758  0065 1e13          	ldw	x,(OFST+1,sp)
 759  0067 1f03          	ldw	(OFST-15,sp),x
 760                     ; 372                             timer_cb.cb_func = atomSemTimerCallback;
 762  0069 ae0000        	ldw	x,#L3_atomSemTimerCallback
 763  006c 1f05          	ldw	(OFST-13,sp),x
 764                     ; 373                             timer_cb.cb_data = (POINTER)&timer_data;
 766  006e 96            	ldw	x,sp
 767  006f 1c0001        	addw	x,#OFST-17
 768  0072 1f07          	ldw	(OFST-11,sp),x
 769                     ; 374                             timer_cb.cb_ticks = timeout;
 771  0074 1e19          	ldw	x,(OFST+7,sp)
 772  0076 1f0b          	ldw	(OFST-7,sp),x
 773  0078 1e17          	ldw	x,(OFST+5,sp)
 774  007a 1f09          	ldw	(OFST-9,sp),x
 775                     ; 381                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 777  007c 96            	ldw	x,sp
 778  007d 1c0005        	addw	x,#OFST-13
 779  0080 1611          	ldw	y,(OFST-1,sp)
 780  0082 90ef0f        	ldw	(15,y),x
 781                     ; 384                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 783  0085 96            	ldw	x,sp
 784  0086 1c0005        	addw	x,#OFST-13
 785  0089 cd0000        	call	_atomTimerRegister
 787  008c 4d            	tnz	a
 788  008d 271f          	jreq	L743
 789                     ; 387                                 status = ATOM_ERR_TIMER;
 791  008f a6cd          	ld	a,#205
 792  0091 6b10          	ld	(OFST-2,sp),a
 793                     ; 390                                 (void)tcbDequeueEntry (&sem->suspQ, curr_tcb_ptr);
 795  0093 1e11          	ldw	x,(OFST-1,sp)
 796  0095 89            	pushw	x
 797  0096 1e15          	ldw	x,(OFST+3,sp)
 798  0098 cd0000        	call	_tcbDequeueEntry
 800  009b 85            	popw	x
 801                     ; 391                                 curr_tcb_ptr->suspended = FALSE;
 803  009c 1e11          	ldw	x,(OFST-1,sp)
 804  009e 6f0d          	clr	(13,x)
 805                     ; 392                                 curr_tcb_ptr->suspend_timo_cb = NULL;
 807  00a0 1e11          	ldw	x,(OFST-1,sp)
 808  00a2 905f          	clrw	y
 809  00a4 ef0f          	ldw	(15,x),y
 810  00a6 2006          	jra	L743
 811  00a8               L343:
 812                     ; 400                             curr_tcb_ptr->suspend_timo_cb = NULL;
 814  00a8 1e11          	ldw	x,(OFST-1,sp)
 815  00aa 905f          	clrw	y
 816  00ac ef0f          	ldw	(15,x),y
 817  00ae               L743:
 818                     ; 404                         CRITICAL_END ();
 820  00ae 96            	ldw	x,sp
 821  00af 1c000f        	addw	x,#OFST-3
 823  00b2 f6            ld A,(X)
 824  00b3 88            push A
 825  00b4 86            pop CC
 827                     ; 407                         if (status == ATOM_OK)
 829  00b5 0d10          	tnz	(OFST-2,sp)
 830  00b7 2633          	jrne	L723
 831                     ; 414                             atomSched (FALSE);
 833  00b9 4f            	clr	a
 834  00ba cd0000        	call	_atomSched
 836                     ; 421                             status = curr_tcb_ptr->suspend_wake_status;
 838  00bd 1e11          	ldw	x,(OFST-1,sp)
 839  00bf e60e          	ld	a,(14,x)
 840  00c1 6b10          	ld	(OFST-2,sp),a
 841  00c3 2027          	jra	L723
 842  00c5               L533:
 843                     ; 446                     CRITICAL_END ();
 845  00c5 96            	ldw	x,sp
 846  00c6 1c000f        	addw	x,#OFST-3
 848  00c9 f6            ld A,(X)
 849  00ca 88            push A
 850  00cb 86            pop CC
 852                     ; 449                     status = ATOM_ERR_CONTEXT;
 854  00cc a6c8          	ld	a,#200
 855  00ce 6b10          	ld	(OFST-2,sp),a
 856  00d0 201a          	jra	L723
 857  00d2               L333:
 858                     ; 455                 CRITICAL_END();
 860  00d2 96            	ldw	x,sp
 861  00d3 1c000f        	addw	x,#OFST-3
 863  00d6 f6            ld A,(X)
 864  00d7 88            push A
 865  00d8 86            pop CC
 867                     ; 456                 status = ATOM_WOULDBLOCK;
 869  00d9 a603          	ld	a,#3
 870  00db 6b10          	ld	(OFST-2,sp),a
 871  00dd 200d          	jra	L723
 872  00df               L133:
 873                     ; 462             sem->count--;
 875  00df 1e13          	ldw	x,(OFST+1,sp)
 876  00e1 6a02          	dec	(2,x)
 877                     ; 465             CRITICAL_END ();
 879  00e3 96            	ldw	x,sp
 880  00e4 1c000f        	addw	x,#OFST-3
 882  00e7 f6            ld A,(X)
 883  00e8 88            push A
 884  00e9 86            pop CC
 886                     ; 468             status = ATOM_OK;
 888  00ea 0f10          	clr	(OFST-2,sp)
 889  00ec               L723:
 890                     ; 472     return (status);
 892  00ec 7b10          	ld	a,(OFST-2,sp)
 895  00ee 5b14          	addw	sp,#20
 896  00f0 81            	ret
 966                     ; 498 uint8_t atomSemPut (ATOM_SEM * sem)
 966                     ; 499 {
 967                     .text:	section	.text,new
 968  0000               _atomSemPut:
 970  0000 89            	pushw	x
 971  0001 5204          	subw	sp,#4
 972       00000004      OFST:	set	4
 975                     ; 505     if (sem == NULL)
 977  0003 a30000        	cpw	x,#0
 978  0006 2608          	jrne	L314
 979                     ; 508         status = ATOM_ERR_PARAM;
 981  0008 a6c9          	ld	a,#201
 982  000a 6b04          	ld	(OFST+0,sp),a
 984  000c ac940094      	jpf	L514
 985  0010               L314:
 986                     ; 513         CRITICAL_START ();
 988  0010 96            	ldw	x,sp
 989  0011 1c0001        	addw	x,#OFST-3
 991  0014 8a            push CC
 992  0015 84            pop a
 993  0016 f7            ld (X),A
 994  0017 9b            sim
 996                     ; 516         if (sem->suspQ)
 998  0018 1e05          	ldw	x,(OFST+1,sp)
 999  001a e601          	ld	a,(1,x)
1000  001c fa            	or	a,(x)
1001  001d 275a          	jreq	L714
1002                     ; 523             tcb_ptr = tcbDequeueHead (&sem->suspQ);
1004  001f 1e05          	ldw	x,(OFST+1,sp)
1005  0021 cd0000        	call	_tcbDequeueHead
1007  0024 1f02          	ldw	(OFST-2,sp),x
1008                     ; 524             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1010  0026 1e02          	ldw	x,(OFST-2,sp)
1011  0028 89            	pushw	x
1012  0029 ae0000        	ldw	x,#_tcbReadyQ
1013  002c cd0000        	call	_tcbEnqueuePriority
1015  002f 85            	popw	x
1016  0030 4d            	tnz	a
1017  0031 270d          	jreq	L124
1018                     ; 527                 CRITICAL_END ();
1020  0033 96            	ldw	x,sp
1021  0034 1c0001        	addw	x,#OFST-3
1023  0037 f6            ld A,(X)
1024  0038 88            push A
1025  0039 86            pop CC
1027                     ; 530                 status = ATOM_ERR_QUEUE;
1029  003a a6cc          	ld	a,#204
1030  003c 6b04          	ld	(OFST+0,sp),a
1032  003e 2054          	jra	L514
1033  0040               L124:
1034                     ; 535                 tcb_ptr->suspend_wake_status = ATOM_OK;
1036  0040 1e02          	ldw	x,(OFST-2,sp)
1037  0042 6f0e          	clr	(14,x)
1038                     ; 538                 if ((tcb_ptr->suspend_timo_cb != NULL)
1038                     ; 539                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1040  0044 1e02          	ldw	x,(OFST-2,sp)
1041  0046 e610          	ld	a,(16,x)
1042  0048 ea0f          	or	a,(15,x)
1043  004a 2710          	jreq	L524
1045  004c 1e02          	ldw	x,(OFST-2,sp)
1046  004e ee0f          	ldw	x,(15,x)
1047  0050 cd0000        	call	_atomTimerCancel
1049  0053 4d            	tnz	a
1050  0054 2706          	jreq	L524
1051                     ; 542                     status = ATOM_ERR_TIMER;
1053  0056 a6cd          	ld	a,#205
1054  0058 6b04          	ld	(OFST+0,sp),a
1056  005a 2008          	jra	L724
1057  005c               L524:
1058                     ; 547                     tcb_ptr->suspend_timo_cb = NULL;
1060  005c 1e02          	ldw	x,(OFST-2,sp)
1061  005e 905f          	clrw	y
1062  0060 ef0f          	ldw	(15,x),y
1063                     ; 550                     status = ATOM_OK;
1065  0062 0f04          	clr	(OFST+0,sp)
1066  0064               L724:
1067                     ; 554                 CRITICAL_END ();
1069  0064 96            	ldw	x,sp
1070  0065 1c0001        	addw	x,#OFST-3
1072  0068 f6            ld A,(X)
1073  0069 88            push A
1074  006a 86            pop CC
1076                     ; 561                 if (atomCurrentContext())
1078  006b cd0000        	call	_atomCurrentContext
1080  006e a30000        	cpw	x,#0
1081  0071 2721          	jreq	L514
1082                     ; 562                     atomSched (FALSE);
1084  0073 4f            	clr	a
1085  0074 cd0000        	call	_atomSched
1087  0077 201b          	jra	L514
1088  0079               L714:
1089                     ; 570             if (sem->count == 255)
1091  0079 1e05          	ldw	x,(OFST+1,sp)
1092  007b e602          	ld	a,(2,x)
1093  007d a1ff          	cp	a,#255
1094  007f 2606          	jrne	L534
1095                     ; 573                 status = ATOM_ERR_OVF;
1097  0081 a6cb          	ld	a,#203
1098  0083 6b04          	ld	(OFST+0,sp),a
1100  0085 2006          	jra	L734
1101  0087               L534:
1102                     ; 578                 sem->count++;
1104  0087 1e05          	ldw	x,(OFST+1,sp)
1105  0089 6c02          	inc	(2,x)
1106                     ; 579                 status = ATOM_OK;
1108  008b 0f04          	clr	(OFST+0,sp)
1109  008d               L734:
1110                     ; 583             CRITICAL_END ();
1112  008d 96            	ldw	x,sp
1113  008e 1c0001        	addw	x,#OFST-3
1115  0091 f6            ld A,(X)
1116  0092 88            push A
1117  0093 86            pop CC
1119  0094               L514:
1120                     ; 587     return (status);
1122  0094 7b04          	ld	a,(OFST+0,sp)
1125  0096 5b06          	addw	sp,#6
1126  0098 81            	ret
1177                     ; 608 uint8_t atomSemResetCount (ATOM_SEM *sem, uint8_t count)
1177                     ; 609 {
1178                     .text:	section	.text,new
1179  0000               _atomSemResetCount:
1181  0000 89            	pushw	x
1182  0001 88            	push	a
1183       00000001      OFST:	set	1
1186                     ; 613     if (sem == NULL)
1188  0002 a30000        	cpw	x,#0
1189  0005 2606          	jrne	L564
1190                     ; 616         status = ATOM_ERR_PARAM;
1192  0007 a6c9          	ld	a,#201
1193  0009 6b01          	ld	(OFST+0,sp),a
1195  000b 2008          	jra	L764
1196  000d               L564:
1197                     ; 621         sem->count = count;
1199  000d 7b06          	ld	a,(OFST+5,sp)
1200  000f 1e02          	ldw	x,(OFST+1,sp)
1201  0011 e702          	ld	(2,x),a
1202                     ; 624         status = ATOM_OK;
1204  0013 0f01          	clr	(OFST+0,sp)
1205  0015               L764:
1206                     ; 627     return (status);
1208  0015 7b01          	ld	a,(OFST+0,sp)
1211  0017 5b03          	addw	sp,#3
1212  0019 81            	ret
1270                     ; 644 static void atomSemTimerCallback (POINTER cb_data)
1270                     ; 645 {
1271                     .text:	section	.text,new
1272  0000               L3_atomSemTimerCallback:
1274  0000 5203          	subw	sp,#3
1275       00000003      OFST:	set	3
1278                     ; 650     timer_data_ptr = (SEM_TIMER *)cb_data;
1280  0002 1f02          	ldw	(OFST-1,sp),x
1281                     ; 653     if (timer_data_ptr)
1283  0004 1e02          	ldw	x,(OFST-1,sp)
1284  0006 2734          	jreq	L715
1285                     ; 656         CRITICAL_START ();
1287  0008 96            	ldw	x,sp
1288  0009 1c0001        	addw	x,#OFST-2
1290  000c 8a            push CC
1291  000d 84            pop a
1292  000e f7            ld (X),A
1293  000f 9b            sim
1295                     ; 659         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1297  0010 1e02          	ldw	x,(OFST-1,sp)
1298  0012 fe            	ldw	x,(x)
1299  0013 a602          	ld	a,#2
1300  0015 e70e          	ld	(14,x),a
1301                     ; 662         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1303  0017 1e02          	ldw	x,(OFST-1,sp)
1304  0019 fe            	ldw	x,(x)
1305  001a 905f          	clrw	y
1306  001c ef0f          	ldw	(15,x),y
1307                     ; 665         (void)tcbDequeueEntry (&timer_data_ptr->sem_ptr->suspQ, timer_data_ptr->tcb_ptr);
1309  001e 1e02          	ldw	x,(OFST-1,sp)
1310  0020 fe            	ldw	x,(x)
1311  0021 89            	pushw	x
1312  0022 1e04          	ldw	x,(OFST+1,sp)
1313  0024 ee02          	ldw	x,(2,x)
1314  0026 cd0000        	call	_tcbDequeueEntry
1316  0029 85            	popw	x
1317                     ; 668         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1319  002a 1e02          	ldw	x,(OFST-1,sp)
1320  002c fe            	ldw	x,(x)
1321  002d 89            	pushw	x
1322  002e ae0000        	ldw	x,#_tcbReadyQ
1323  0031 cd0000        	call	_tcbEnqueuePriority
1325  0034 85            	popw	x
1326                     ; 671         CRITICAL_END ();
1328  0035 96            	ldw	x,sp
1329  0036 1c0001        	addw	x,#OFST-2
1331  0039 f6            ld A,(X)
1332  003a 88            push A
1333  003b 86            pop CC
1335  003c               L715:
1336                     ; 678 }
1339  003c 5b03          	addw	sp,#3
1340  003e 81            	ret
1353                     	xdef	_atomSemResetCount
1354                     	xdef	_atomSemPut
1355                     	xdef	_atomSemGet
1356                     	xdef	_atomSemDelete
1357                     	xdef	_atomSemCreate
1358                     	xref	_atomCurrentContext
1359                     	xref	_tcbDequeueEntry
1360                     	xref	_tcbDequeueHead
1361                     	xref	_tcbEnqueuePriority
1362                     	xref	_atomSched
1363                     	xref	_tcbReadyQ
1364                     	xref	_atomTimerCancel
1365                     	xref	_atomTimerRegister
1384                     	xref	c_lzmp
1385                     	end
