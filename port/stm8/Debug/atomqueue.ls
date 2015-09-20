   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 310                     ; 146 uint8_t atomQueueCreate (ATOM_QUEUE *qptr, uint8_t *buff_ptr, uint32_t unit_size, uint32_t max_num_msgs)
 310                     ; 147 {
 312                     .text:	section	.text,new
 313  0000               _atomQueueCreate:
 315  0000 89            	pushw	x
 316  0001 88            	push	a
 317       00000001      OFST:	set	1
 320                     ; 151     if ((qptr == NULL) || (buff_ptr == NULL))
 322  0002 a30000        	cpw	x,#0
 323  0005 2704          	jreq	L112
 325  0007 1e06          	ldw	x,(OFST+5,sp)
 326  0009 2609          	jrne	L702
 327  000b               L112:
 328                     ; 154         status = ATOM_ERR_PARAM;
 330  000b a6c9          	ld	a,#201
 331  000d 6b01          	ld	(OFST+0,sp),a
 333  000f               L312:
 334                     ; 181     return (status);
 336  000f 7b01          	ld	a,(OFST+0,sp)
 339  0011 5b03          	addw	sp,#3
 340  0013 81            	ret
 341  0014               L702:
 342                     ; 156     else if ((unit_size == 0) || (max_num_msgs == 0))
 344  0014 96            	ldw	x,sp
 345  0015 1c0008        	addw	x,#OFST+7
 346  0018 cd0000        	call	c_lzmp
 348  001b 2709          	jreq	L712
 350  001d 96            	ldw	x,sp
 351  001e 1c000c        	addw	x,#OFST+11
 352  0021 cd0000        	call	c_lzmp
 354  0024 2606          	jrne	L512
 355  0026               L712:
 356                     ; 159         status = ATOM_ERR_PARAM;
 358  0026 a6c9          	ld	a,#201
 359  0028 6b01          	ld	(OFST+0,sp),a
 361  002a 20e3          	jra	L312
 362  002c               L512:
 363                     ; 164         qptr->buff_ptr = buff_ptr;
 365  002c 1e02          	ldw	x,(OFST+1,sp)
 366  002e 1606          	ldw	y,(OFST+5,sp)
 367  0030 ef04          	ldw	(4,x),y
 368                     ; 165         qptr->unit_size = unit_size;
 370  0032 1e02          	ldw	x,(OFST+1,sp)
 371  0034 7b0b          	ld	a,(OFST+10,sp)
 372  0036 e709          	ld	(9,x),a
 373  0038 7b0a          	ld	a,(OFST+9,sp)
 374  003a e708          	ld	(8,x),a
 375  003c 7b09          	ld	a,(OFST+8,sp)
 376  003e e707          	ld	(7,x),a
 377  0040 7b08          	ld	a,(OFST+7,sp)
 378  0042 e706          	ld	(6,x),a
 379                     ; 166         qptr->max_num_msgs = max_num_msgs;
 381  0044 1e02          	ldw	x,(OFST+1,sp)
 382  0046 7b0f          	ld	a,(OFST+14,sp)
 383  0048 e70d          	ld	(13,x),a
 384  004a 7b0e          	ld	a,(OFST+13,sp)
 385  004c e70c          	ld	(12,x),a
 386  004e 7b0d          	ld	a,(OFST+12,sp)
 387  0050 e70b          	ld	(11,x),a
 388  0052 7b0c          	ld	a,(OFST+11,sp)
 389  0054 e70a          	ld	(10,x),a
 390                     ; 169         qptr->putSuspQ = NULL;
 392  0056 1e02          	ldw	x,(OFST+1,sp)
 393  0058 905f          	clrw	y
 394  005a ff            	ldw	(x),y
 395                     ; 170         qptr->getSuspQ = NULL;
 397  005b 1e02          	ldw	x,(OFST+1,sp)
 398  005d 905f          	clrw	y
 399  005f ef02          	ldw	(2,x),y
 400                     ; 173         qptr->insert_index = 0;
 402  0061 1e02          	ldw	x,(OFST+1,sp)
 403  0063 a600          	ld	a,#0
 404  0065 e711          	ld	(17,x),a
 405  0067 a600          	ld	a,#0
 406  0069 e710          	ld	(16,x),a
 407  006b a600          	ld	a,#0
 408  006d e70f          	ld	(15,x),a
 409  006f a600          	ld	a,#0
 410  0071 e70e          	ld	(14,x),a
 411                     ; 174         qptr->remove_index = 0;
 413  0073 1e02          	ldw	x,(OFST+1,sp)
 414  0075 a600          	ld	a,#0
 415  0077 e715          	ld	(21,x),a
 416  0079 a600          	ld	a,#0
 417  007b e714          	ld	(20,x),a
 418  007d a600          	ld	a,#0
 419  007f e713          	ld	(19,x),a
 420  0081 a600          	ld	a,#0
 421  0083 e712          	ld	(18,x),a
 422                     ; 175         qptr->num_msgs_stored = 0;
 424  0085 1e02          	ldw	x,(OFST+1,sp)
 425  0087 a600          	ld	a,#0
 426  0089 e719          	ld	(25,x),a
 427  008b a600          	ld	a,#0
 428  008d e718          	ld	(24,x),a
 429  008f a600          	ld	a,#0
 430  0091 e717          	ld	(23,x),a
 431  0093 a600          	ld	a,#0
 432  0095 e716          	ld	(22,x),a
 433                     ; 178         status = ATOM_OK;
 435  0097 0f01          	clr	(OFST+0,sp)
 436  0099 cc000f        	jra	L312
 513                     ; 205 uint8_t atomQueueDelete (ATOM_QUEUE *qptr)
 513                     ; 206 {
 514                     .text:	section	.text,new
 515  0000               _atomQueueDelete:
 517  0000 89            	pushw	x
 518  0001 5205          	subw	sp,#5
 519       00000005      OFST:	set	5
 522                     ; 210     uint8_t woken_threads = FALSE;
 524  0003 0f01          	clr	(OFST-4,sp)
 525                     ; 213     if (qptr == NULL)
 527  0005 a30000        	cpw	x,#0
 528  0008 2608          	jrne	L752
 529                     ; 216         status = ATOM_ERR_PARAM;
 531  000a a6c9          	ld	a,#201
 532  000c 6b02          	ld	(OFST-3,sp),a
 534  000e aca300a3      	jpf	L162
 535  0012               L752:
 536                     ; 221         status = ATOM_OK;
 538  0012 0f02          	clr	(OFST-3,sp)
 539  0014               L362:
 540                     ; 227             CRITICAL_START ();
 542  0014 96            	ldw	x,sp
 543  0015 1c0003        	addw	x,#OFST-2
 545  0018 8a            push CC
 546  0019 84            pop a
 547  001a f7            ld (X),A
 548  001b 9b            sim
 550                     ; 230             if (((tcb_ptr = tcbDequeueHead (&qptr->getSuspQ)) != NULL)
 550                     ; 231                 || ((tcb_ptr = tcbDequeueHead (&qptr->putSuspQ)) != NULL))
 552  001c 1e06          	ldw	x,(OFST+1,sp)
 553  001e 5c            	incw	x
 554  001f 5c            	incw	x
 555  0020 cd0000        	call	_tcbDequeueHead
 557  0023 1f04          	ldw	(OFST-1,sp),x
 558  0025 1e04          	ldw	x,(OFST-1,sp)
 559  0027 260b          	jrne	L172
 561  0029 1e06          	ldw	x,(OFST+1,sp)
 562  002b cd0000        	call	_tcbDequeueHead
 564  002e 1f04          	ldw	(OFST-1,sp),x
 565  0030 1e04          	ldw	x,(OFST-1,sp)
 566  0032 2766          	jreq	L762
 567  0034               L172:
 568                     ; 236                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 570  0034 1e04          	ldw	x,(OFST-1,sp)
 571  0036 a6ca          	ld	a,#202
 572  0038 e70e          	ld	(14,x),a
 573                     ; 239                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 575  003a 1e04          	ldw	x,(OFST-1,sp)
 576  003c 89            	pushw	x
 577  003d ae0000        	ldw	x,#_tcbReadyQ
 578  0040 cd0000        	call	_tcbEnqueuePriority
 580  0043 85            	popw	x
 581  0044 4d            	tnz	a
 582  0045 270d          	jreq	L372
 583                     ; 242                     CRITICAL_END ();
 585  0047 96            	ldw	x,sp
 586  0048 1c0003        	addw	x,#OFST-2
 588  004b f6            ld A,(X)
 589  004c 88            push A
 590  004d 86            pop CC
 592                     ; 245                     status = ATOM_ERR_QUEUE;
 594  004e a6cc          	ld	a,#204
 595  0050 6b02          	ld	(OFST-3,sp),a
 596                     ; 246                     break;
 598  0052 201d          	jra	L562
 599  0054               L372:
 600                     ; 250                 if (tcb_ptr->suspend_timo_cb)
 602  0054 1e04          	ldw	x,(OFST-1,sp)
 603  0056 e610          	ld	a,(16,x)
 604  0058 ea0f          	or	a,(15,x)
 605  005a 272f          	jreq	L572
 606                     ; 253                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 608  005c 1e04          	ldw	x,(OFST-1,sp)
 609  005e ee0f          	ldw	x,(15,x)
 610  0060 cd0000        	call	_atomTimerCancel
 612  0063 4d            	tnz	a
 613  0064 271f          	jreq	L772
 614                     ; 256                         CRITICAL_END ();
 616  0066 96            	ldw	x,sp
 617  0067 1c0003        	addw	x,#OFST-2
 619  006a f6            ld A,(X)
 620  006b 88            push A
 621  006c 86            pop CC
 623                     ; 259                         status = ATOM_ERR_TIMER;
 625  006d a6cd          	ld	a,#205
 626  006f 6b02          	ld	(OFST-3,sp),a
 627                     ; 260                         break;
 628  0071               L562:
 629                     ; 285         if (woken_threads == TRUE)
 631  0071 7b01          	ld	a,(OFST-4,sp)
 632  0073 a101          	cp	a,#1
 633  0075 262c          	jrne	L162
 634                     ; 291             if (atomCurrentContext())
 636  0077 cd0000        	call	_atomCurrentContext
 638  007a a30000        	cpw	x,#0
 639  007d 2724          	jreq	L162
 640                     ; 292                 atomSched (FALSE);
 642  007f 4f            	clr	a
 643  0080 cd0000        	call	_atomSched
 645  0083 201e          	jra	L162
 646  0085               L772:
 647                     ; 264                     tcb_ptr->suspend_timo_cb = NULL;
 649  0085 1e04          	ldw	x,(OFST-1,sp)
 650  0087 905f          	clrw	y
 651  0089 ef0f          	ldw	(15,x),y
 652  008b               L572:
 653                     ; 269                 CRITICAL_END ();
 655  008b 96            	ldw	x,sp
 656  008c 1c0003        	addw	x,#OFST-2
 658  008f f6            ld A,(X)
 659  0090 88            push A
 660  0091 86            pop CC
 662                     ; 272                 woken_threads = TRUE;
 664  0092 a601          	ld	a,#1
 665  0094 6b01          	ld	(OFST-4,sp),a
 667  0096 ac140014      	jpf	L362
 668  009a               L762:
 669                     ; 279                 CRITICAL_END ();
 671  009a 96            	ldw	x,sp
 672  009b 1c0003        	addw	x,#OFST-2
 674  009e f6            ld A,(X)
 675  009f 88            push A
 676  00a0 86            pop CC
 678                     ; 280                 break;
 680  00a1 20ce          	jra	L562
 681  00a3               L162:
 682                     ; 296     return (status);
 684  00a3 7b02          	ld	a,(OFST-3,sp)
 687  00a5 5b07          	addw	sp,#7
 688  00a7 81            	ret
 841                     ; 337 uint8_t atomQueueGet (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
 841                     ; 338 {
 842                     .text:	section	.text,new
 843  0000               _atomQueueGet:
 845  0000 89            	pushw	x
 846  0001 5214          	subw	sp,#20
 847       00000014      OFST:	set	20
 850                     ; 346     if ((qptr == NULL) || (msgptr == NULL))
 852  0003 a30000        	cpw	x,#0
 853  0006 2704          	jreq	L704
 855  0008 1e1d          	ldw	x,(OFST+9,sp)
 856  000a 2609          	jrne	L504
 857  000c               L704:
 858                     ; 349         status = ATOM_ERR_PARAM;
 860  000c a6c9          	ld	a,#201
 861  000e 6b14          	ld	(OFST+0,sp),a
 863  0010               L114:
 864                     ; 502     return (status);
 866  0010 7b14          	ld	a,(OFST+0,sp)
 869  0012 5b16          	addw	sp,#22
 870  0014 81            	ret
 871  0015               L504:
 872                     ; 354         CRITICAL_START ();
 874  0015 96            	ldw	x,sp
 875  0016 1c0011        	addw	x,#OFST-3
 877  0019 8a            push CC
 878  001a 84            pop a
 879  001b f7            ld (X),A
 880  001c 9b            sim
 882                     ; 357         if (qptr->num_msgs_stored == 0)
 884  001d 1e15          	ldw	x,(OFST+1,sp)
 885  001f 1c0016        	addw	x,#22
 886  0022 cd0000        	call	c_lzmp
 888  0025 2703          	jreq	L21
 889  0027 cc011f        	jp	L314
 890  002a               L21:
 891                     ; 360             if (timeout >= 0)
 893  002a 9c            	rvf
 894  002b 0d19          	tnz	(OFST+5,sp)
 895  002d 2e03          	jrsge	L41
 896  002f cc0110        	jp	L514
 897  0032               L41:
 898                     ; 365                 curr_tcb_ptr = atomCurrentContext();
 900  0032 cd0000        	call	_atomCurrentContext
 902  0035 1f12          	ldw	(OFST-2,sp),x
 903                     ; 368                 if (curr_tcb_ptr)
 905  0037 1e12          	ldw	x,(OFST-2,sp)
 906  0039 2603          	jrne	L61
 907  003b cc0101        	jp	L714
 908  003e               L61:
 909                     ; 371                     if (tcbEnqueuePriority (&qptr->getSuspQ, curr_tcb_ptr) == ATOM_OK)
 911  003e 1e12          	ldw	x,(OFST-2,sp)
 912  0040 89            	pushw	x
 913  0041 1e17          	ldw	x,(OFST+3,sp)
 914  0043 5c            	incw	x
 915  0044 5c            	incw	x
 916  0045 cd0000        	call	_tcbEnqueuePriority
 918  0048 85            	popw	x
 919  0049 4d            	tnz	a
 920  004a 2703          	jreq	L02
 921  004c cc00f2        	jp	L124
 922  004f               L02:
 923                     ; 374                         curr_tcb_ptr->suspended = TRUE;
 925  004f 1e12          	ldw	x,(OFST-2,sp)
 926  0051 a601          	ld	a,#1
 927  0053 e70d          	ld	(13,x),a
 928                     ; 377                         status = ATOM_OK;
 930  0055 0f14          	clr	(OFST+0,sp)
 931                     ; 380                         if (timeout)
 933  0057 96            	ldw	x,sp
 934  0058 1c0019        	addw	x,#OFST+5
 935  005b cd0000        	call	c_lzmp
 937  005e 274f          	jreq	L324
 938                     ; 386                             timer_data.tcb_ptr = curr_tcb_ptr;
 940  0060 1e12          	ldw	x,(OFST-2,sp)
 941  0062 1f01          	ldw	(OFST-19,sp),x
 942                     ; 387                             timer_data.queue_ptr = qptr;
 944  0064 1e15          	ldw	x,(OFST+1,sp)
 945  0066 1f03          	ldw	(OFST-17,sp),x
 946                     ; 388                             timer_data.suspQ = &qptr->getSuspQ;
 948  0068 1e15          	ldw	x,(OFST+1,sp)
 949  006a 5c            	incw	x
 950  006b 5c            	incw	x
 951  006c 1f05          	ldw	(OFST-15,sp),x
 952                     ; 391                             timer_cb.cb_func = atomQueueTimerCallback;
 954  006e ae0000        	ldw	x,#L7_atomQueueTimerCallback
 955  0071 1f07          	ldw	(OFST-13,sp),x
 956                     ; 392                             timer_cb.cb_data = (POINTER)&timer_data;
 958  0073 96            	ldw	x,sp
 959  0074 1c0001        	addw	x,#OFST-19
 960  0077 1f09          	ldw	(OFST-11,sp),x
 961                     ; 393                             timer_cb.cb_ticks = timeout;
 963  0079 1e1b          	ldw	x,(OFST+7,sp)
 964  007b 1f0d          	ldw	(OFST-7,sp),x
 965  007d 1e19          	ldw	x,(OFST+5,sp)
 966  007f 1f0b          	ldw	(OFST-9,sp),x
 967                     ; 400                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 969  0081 96            	ldw	x,sp
 970  0082 1c0007        	addw	x,#OFST-13
 971  0085 1612          	ldw	y,(OFST-2,sp)
 972  0087 90ef0f        	ldw	(15,y),x
 973                     ; 403                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 975  008a 96            	ldw	x,sp
 976  008b 1c0007        	addw	x,#OFST-13
 977  008e cd0000        	call	_atomTimerRegister
 979  0091 4d            	tnz	a
 980  0092 2721          	jreq	L724
 981                     ; 406                                 status = ATOM_ERR_TIMER;
 983  0094 a6cd          	ld	a,#205
 984  0096 6b14          	ld	(OFST+0,sp),a
 985                     ; 409                                 (void)tcbDequeueEntry (&qptr->getSuspQ, curr_tcb_ptr);
 987  0098 1e12          	ldw	x,(OFST-2,sp)
 988  009a 89            	pushw	x
 989  009b 1e17          	ldw	x,(OFST+3,sp)
 990  009d 5c            	incw	x
 991  009e 5c            	incw	x
 992  009f cd0000        	call	_tcbDequeueEntry
 994  00a2 85            	popw	x
 995                     ; 410                                 curr_tcb_ptr->suspended = FALSE;
 997  00a3 1e12          	ldw	x,(OFST-2,sp)
 998  00a5 6f0d          	clr	(13,x)
 999                     ; 411                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1001  00a7 1e12          	ldw	x,(OFST-2,sp)
1002  00a9 905f          	clrw	y
1003  00ab ef0f          	ldw	(15,x),y
1004  00ad 2006          	jra	L724
1005  00af               L324:
1006                     ; 419                             curr_tcb_ptr->suspend_timo_cb = NULL;
1008  00af 1e12          	ldw	x,(OFST-2,sp)
1009  00b1 905f          	clrw	y
1010  00b3 ef0f          	ldw	(15,x),y
1011  00b5               L724:
1012                     ; 423                         CRITICAL_END ();
1014  00b5 96            	ldw	x,sp
1015  00b6 1c0011        	addw	x,#OFST-3
1017  00b9 f6            ld A,(X)
1018  00ba 88            push A
1019  00bb 86            pop CC
1021                     ; 426                         if (status == ATOM_OK)
1023  00bc 0d14          	tnz	(OFST+0,sp)
1024  00be 2703          	jreq	L22
1025  00c0 cc0010        	jp	L114
1026  00c3               L22:
1027                     ; 433                             atomSched (FALSE);
1029  00c3 4f            	clr	a
1030  00c4 cd0000        	call	_atomSched
1032                     ; 440                             status = curr_tcb_ptr->suspend_wake_status;
1034  00c7 1e12          	ldw	x,(OFST-2,sp)
1035  00c9 e60e          	ld	a,(14,x)
1036  00cb 6b14          	ld	(OFST+0,sp),a
1037                     ; 450                             if (status == ATOM_OK)
1039  00cd 0d14          	tnz	(OFST+0,sp)
1040  00cf 2703          	jreq	L42
1041  00d1 cc0010        	jp	L114
1042  00d4               L42:
1043                     ; 453                                 CRITICAL_START();
1045  00d4 96            	ldw	x,sp
1046  00d5 1c0011        	addw	x,#OFST-3
1048  00d8 8a            push CC
1049  00d9 84            pop a
1050  00da f7            ld (X),A
1051  00db 9b            sim
1053                     ; 456                                 status = queue_remove (qptr, msgptr);
1055  00dc 1e1d          	ldw	x,(OFST+9,sp)
1056  00de 89            	pushw	x
1057  00df 1e17          	ldw	x,(OFST+3,sp)
1058  00e1 cd0000        	call	L3_queue_remove
1060  00e4 85            	popw	x
1061  00e5 6b14          	ld	(OFST+0,sp),a
1062                     ; 459                                 CRITICAL_END();
1064  00e7 96            	ldw	x,sp
1065  00e8 1c0011        	addw	x,#OFST-3
1067  00eb f6            ld A,(X)
1068  00ec 88            push A
1069  00ed 86            pop CC
1071  00ee ac100010      	jpf	L114
1072  00f2               L124:
1073                     ; 466                         CRITICAL_END ();
1075  00f2 96            	ldw	x,sp
1076  00f3 1c0011        	addw	x,#OFST-3
1078  00f6 f6            ld A,(X)
1079  00f7 88            push A
1080  00f8 86            pop CC
1082                     ; 467                         status = ATOM_ERR_QUEUE;
1084  00f9 a6cc          	ld	a,#204
1085  00fb 6b14          	ld	(OFST+0,sp),a
1086  00fd ac100010      	jpf	L114
1087  0101               L714:
1088                     ; 473                     CRITICAL_END ();
1090  0101 96            	ldw	x,sp
1091  0102 1c0011        	addw	x,#OFST-3
1093  0105 f6            ld A,(X)
1094  0106 88            push A
1095  0107 86            pop CC
1097                     ; 474                     status = ATOM_ERR_CONTEXT;
1099  0108 a6c8          	ld	a,#200
1100  010a 6b14          	ld	(OFST+0,sp),a
1101  010c ac100010      	jpf	L114
1102  0110               L514:
1103                     ; 480                 CRITICAL_END();
1105  0110 96            	ldw	x,sp
1106  0111 1c0011        	addw	x,#OFST-3
1108  0114 f6            ld A,(X)
1109  0115 88            push A
1110  0116 86            pop CC
1112                     ; 481                 status = ATOM_WOULDBLOCK;
1114  0117 a603          	ld	a,#3
1115  0119 6b14          	ld	(OFST+0,sp),a
1116  011b ac100010      	jpf	L114
1117  011f               L314:
1118                     ; 487             status = queue_remove (qptr, msgptr);
1120  011f 1e1d          	ldw	x,(OFST+9,sp)
1121  0121 89            	pushw	x
1122  0122 1e17          	ldw	x,(OFST+3,sp)
1123  0124 cd0000        	call	L3_queue_remove
1125  0127 85            	popw	x
1126  0128 6b14          	ld	(OFST+0,sp),a
1127                     ; 490             CRITICAL_END ();
1129  012a 96            	ldw	x,sp
1130  012b 1c0011        	addw	x,#OFST-3
1132  012e f6            ld A,(X)
1133  012f 88            push A
1134  0130 86            pop CC
1136                     ; 497             if (atomCurrentContext())
1138  0131 cd0000        	call	_atomCurrentContext
1140  0134 a30000        	cpw	x,#0
1141  0137 2603          	jrne	L62
1142  0139 cc0010        	jp	L114
1143  013c               L62:
1144                     ; 498                 atomSched (FALSE);
1146  013c 4f            	clr	a
1147  013d cd0000        	call	_atomSched
1149  0140 ac100010      	jpf	L114
1258                     ; 543 uint8_t atomQueuePut (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
1258                     ; 544 {
1259                     .text:	section	.text,new
1260  0000               _atomQueuePut:
1262  0000 89            	pushw	x
1263  0001 5214          	subw	sp,#20
1264       00000014      OFST:	set	20
1267                     ; 552     if ((qptr == NULL) || (msgptr == NULL))
1269  0003 a30000        	cpw	x,#0
1270  0006 2704          	jreq	L125
1272  0008 1e1d          	ldw	x,(OFST+9,sp)
1273  000a 2609          	jrne	L715
1274  000c               L125:
1275                     ; 555         status = ATOM_ERR_PARAM;
1277  000c a6c9          	ld	a,#201
1278  000e 6b14          	ld	(OFST+0,sp),a
1280  0010               L325:
1281                     ; 710     return (status);
1283  0010 7b14          	ld	a,(OFST+0,sp)
1286  0012 5b16          	addw	sp,#22
1287  0014 81            	ret
1288  0015               L715:
1289                     ; 560         CRITICAL_START ();
1291  0015 96            	ldw	x,sp
1292  0016 1c0011        	addw	x,#OFST-3
1294  0019 8a            push CC
1295  001a 84            pop a
1296  001b f7            ld (X),A
1297  001c 9b            sim
1299                     ; 563         if (qptr->num_msgs_stored == qptr->max_num_msgs)
1301  001d 1e15          	ldw	x,(OFST+1,sp)
1302  001f 1c0016        	addw	x,#22
1303  0022 cd0000        	call	c_ltor
1305  0025 1e15          	ldw	x,(OFST+1,sp)
1306  0027 1c000a        	addw	x,#10
1307  002a cd0000        	call	c_lcmp
1309  002d 2703          	jreq	L23
1310  002f cc0121        	jp	L525
1311  0032               L23:
1312                     ; 566             if (timeout >= 0)
1314  0032 9c            	rvf
1315  0033 0d19          	tnz	(OFST+5,sp)
1316  0035 2e03          	jrsge	L43
1317  0037 cc0112        	jp	L725
1318  003a               L43:
1319                     ; 571                 curr_tcb_ptr = atomCurrentContext();
1321  003a cd0000        	call	_atomCurrentContext
1323  003d 1f12          	ldw	(OFST-2,sp),x
1324                     ; 574                 if (curr_tcb_ptr)
1326  003f 1e12          	ldw	x,(OFST-2,sp)
1327  0041 2603          	jrne	L63
1328  0043 cc0103        	jp	L135
1329  0046               L63:
1330                     ; 577                     if (tcbEnqueuePriority (&qptr->putSuspQ, curr_tcb_ptr) == ATOM_OK)
1332  0046 1e12          	ldw	x,(OFST-2,sp)
1333  0048 89            	pushw	x
1334  0049 1e17          	ldw	x,(OFST+3,sp)
1335  004b cd0000        	call	_tcbEnqueuePriority
1337  004e 85            	popw	x
1338  004f 4d            	tnz	a
1339  0050 2703          	jreq	L04
1340  0052 cc00f4        	jp	L335
1341  0055               L04:
1342                     ; 580                         curr_tcb_ptr->suspended = TRUE;
1344  0055 1e12          	ldw	x,(OFST-2,sp)
1345  0057 a601          	ld	a,#1
1346  0059 e70d          	ld	(13,x),a
1347                     ; 583                         status = ATOM_OK;
1349  005b 0f14          	clr	(OFST+0,sp)
1350                     ; 586                         if (timeout)
1352  005d 96            	ldw	x,sp
1353  005e 1c0019        	addw	x,#OFST+5
1354  0061 cd0000        	call	c_lzmp
1356  0064 274b          	jreq	L535
1357                     ; 592                             timer_data.tcb_ptr = curr_tcb_ptr;
1359  0066 1e12          	ldw	x,(OFST-2,sp)
1360  0068 1f01          	ldw	(OFST-19,sp),x
1361                     ; 593                             timer_data.queue_ptr = qptr;
1363  006a 1e15          	ldw	x,(OFST+1,sp)
1364  006c 1f03          	ldw	(OFST-17,sp),x
1365                     ; 594                             timer_data.suspQ = &qptr->putSuspQ;
1367  006e 1e15          	ldw	x,(OFST+1,sp)
1368  0070 1f05          	ldw	(OFST-15,sp),x
1369                     ; 598                             timer_cb.cb_func = atomQueueTimerCallback;
1371  0072 ae0000        	ldw	x,#L7_atomQueueTimerCallback
1372  0075 1f07          	ldw	(OFST-13,sp),x
1373                     ; 599                             timer_cb.cb_data = (POINTER)&timer_data;
1375  0077 96            	ldw	x,sp
1376  0078 1c0001        	addw	x,#OFST-19
1377  007b 1f09          	ldw	(OFST-11,sp),x
1378                     ; 600                             timer_cb.cb_ticks = timeout;
1380  007d 1e1b          	ldw	x,(OFST+7,sp)
1381  007f 1f0d          	ldw	(OFST-7,sp),x
1382  0081 1e19          	ldw	x,(OFST+5,sp)
1383  0083 1f0b          	ldw	(OFST-9,sp),x
1384                     ; 608                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
1386  0085 96            	ldw	x,sp
1387  0086 1c0007        	addw	x,#OFST-13
1388  0089 1612          	ldw	y,(OFST-2,sp)
1389  008b 90ef0f        	ldw	(15,y),x
1390                     ; 611                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
1392  008e 96            	ldw	x,sp
1393  008f 1c0007        	addw	x,#OFST-13
1394  0092 cd0000        	call	_atomTimerRegister
1396  0095 4d            	tnz	a
1397  0096 271f          	jreq	L145
1398                     ; 614                                 status = ATOM_ERR_TIMER;
1400  0098 a6cd          	ld	a,#205
1401  009a 6b14          	ld	(OFST+0,sp),a
1402                     ; 617                                 (void)tcbDequeueEntry (&qptr->putSuspQ, curr_tcb_ptr);
1404  009c 1e12          	ldw	x,(OFST-2,sp)
1405  009e 89            	pushw	x
1406  009f 1e17          	ldw	x,(OFST+3,sp)
1407  00a1 cd0000        	call	_tcbDequeueEntry
1409  00a4 85            	popw	x
1410                     ; 618                                 curr_tcb_ptr->suspended = FALSE;
1412  00a5 1e12          	ldw	x,(OFST-2,sp)
1413  00a7 6f0d          	clr	(13,x)
1414                     ; 619                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1416  00a9 1e12          	ldw	x,(OFST-2,sp)
1417  00ab 905f          	clrw	y
1418  00ad ef0f          	ldw	(15,x),y
1419  00af 2006          	jra	L145
1420  00b1               L535:
1421                     ; 627                             curr_tcb_ptr->suspend_timo_cb = NULL;
1423  00b1 1e12          	ldw	x,(OFST-2,sp)
1424  00b3 905f          	clrw	y
1425  00b5 ef0f          	ldw	(15,x),y
1426  00b7               L145:
1427                     ; 631                         CRITICAL_END ();
1429  00b7 96            	ldw	x,sp
1430  00b8 1c0011        	addw	x,#OFST-3
1432  00bb f6            ld A,(X)
1433  00bc 88            push A
1434  00bd 86            pop CC
1436                     ; 634                         if (status == ATOM_OK)
1438  00be 0d14          	tnz	(OFST+0,sp)
1439  00c0 2703          	jreq	L24
1440  00c2 cc0010        	jp	L325
1441  00c5               L24:
1442                     ; 641                             atomSched (FALSE);
1444  00c5 4f            	clr	a
1445  00c6 cd0000        	call	_atomSched
1447                     ; 648                             status = curr_tcb_ptr->suspend_wake_status;
1449  00c9 1e12          	ldw	x,(OFST-2,sp)
1450  00cb e60e          	ld	a,(14,x)
1451  00cd 6b14          	ld	(OFST+0,sp),a
1452                     ; 658                             if (status == ATOM_OK)
1454  00cf 0d14          	tnz	(OFST+0,sp)
1455  00d1 2703          	jreq	L44
1456  00d3 cc0010        	jp	L325
1457  00d6               L44:
1458                     ; 661                                 CRITICAL_START();
1460  00d6 96            	ldw	x,sp
1461  00d7 1c0011        	addw	x,#OFST-3
1463  00da 8a            push CC
1464  00db 84            pop a
1465  00dc f7            ld (X),A
1466  00dd 9b            sim
1468                     ; 664                                 status = queue_insert (qptr, msgptr);
1470  00de 1e1d          	ldw	x,(OFST+9,sp)
1471  00e0 89            	pushw	x
1472  00e1 1e17          	ldw	x,(OFST+3,sp)
1473  00e3 cd0000        	call	L5_queue_insert
1475  00e6 85            	popw	x
1476  00e7 6b14          	ld	(OFST+0,sp),a
1477                     ; 667                                 CRITICAL_END();
1479  00e9 96            	ldw	x,sp
1480  00ea 1c0011        	addw	x,#OFST-3
1482  00ed f6            ld A,(X)
1483  00ee 88            push A
1484  00ef 86            pop CC
1486  00f0 ac100010      	jpf	L325
1487  00f4               L335:
1488                     ; 674                         CRITICAL_END ();
1490  00f4 96            	ldw	x,sp
1491  00f5 1c0011        	addw	x,#OFST-3
1493  00f8 f6            ld A,(X)
1494  00f9 88            push A
1495  00fa 86            pop CC
1497                     ; 675                         status = ATOM_ERR_QUEUE;
1499  00fb a6cc          	ld	a,#204
1500  00fd 6b14          	ld	(OFST+0,sp),a
1501  00ff ac100010      	jpf	L325
1502  0103               L135:
1503                     ; 681                     CRITICAL_END ();
1505  0103 96            	ldw	x,sp
1506  0104 1c0011        	addw	x,#OFST-3
1508  0107 f6            ld A,(X)
1509  0108 88            push A
1510  0109 86            pop CC
1512                     ; 682                     status = ATOM_ERR_CONTEXT;
1514  010a a6c8          	ld	a,#200
1515  010c 6b14          	ld	(OFST+0,sp),a
1516  010e ac100010      	jpf	L325
1517  0112               L725:
1518                     ; 688                 CRITICAL_END();
1520  0112 96            	ldw	x,sp
1521  0113 1c0011        	addw	x,#OFST-3
1523  0116 f6            ld A,(X)
1524  0117 88            push A
1525  0118 86            pop CC
1527                     ; 689                 status = ATOM_WOULDBLOCK;
1529  0119 a603          	ld	a,#3
1530  011b 6b14          	ld	(OFST+0,sp),a
1531  011d ac100010      	jpf	L325
1532  0121               L525:
1533                     ; 695             status = queue_insert (qptr, msgptr);
1535  0121 1e1d          	ldw	x,(OFST+9,sp)
1536  0123 89            	pushw	x
1537  0124 1e17          	ldw	x,(OFST+3,sp)
1538  0126 cd0000        	call	L5_queue_insert
1540  0129 85            	popw	x
1541  012a 6b14          	ld	(OFST+0,sp),a
1542                     ; 698             CRITICAL_END ();
1544  012c 96            	ldw	x,sp
1545  012d 1c0011        	addw	x,#OFST-3
1547  0130 f6            ld A,(X)
1548  0131 88            push A
1549  0132 86            pop CC
1551                     ; 705             if (atomCurrentContext())
1553  0133 cd0000        	call	_atomCurrentContext
1555  0136 a30000        	cpw	x,#0
1556  0139 2603          	jrne	L64
1557  013b cc0010        	jp	L325
1558  013e               L64:
1559                     ; 706                 atomSched (FALSE);
1561  013e 4f            	clr	a
1562  013f cd0000        	call	_atomSched
1564  0142 ac100010      	jpf	L325
1622                     ; 726 static void atomQueueTimerCallback (POINTER cb_data)
1622                     ; 727 {
1623                     .text:	section	.text,new
1624  0000               L7_atomQueueTimerCallback:
1626  0000 5203          	subw	sp,#3
1627       00000003      OFST:	set	3
1630                     ; 732     timer_data_ptr = (QUEUE_TIMER *)cb_data;
1632  0002 1f02          	ldw	(OFST-1,sp),x
1633                     ; 735     if (timer_data_ptr)
1635  0004 1e02          	ldw	x,(OFST-1,sp)
1636  0006 2734          	jreq	L706
1637                     ; 738         CRITICAL_START ();
1639  0008 96            	ldw	x,sp
1640  0009 1c0001        	addw	x,#OFST-2
1642  000c 8a            push CC
1643  000d 84            pop a
1644  000e f7            ld (X),A
1645  000f 9b            sim
1647                     ; 741         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1649  0010 1e02          	ldw	x,(OFST-1,sp)
1650  0012 fe            	ldw	x,(x)
1651  0013 a602          	ld	a,#2
1652  0015 e70e          	ld	(14,x),a
1653                     ; 744         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1655  0017 1e02          	ldw	x,(OFST-1,sp)
1656  0019 fe            	ldw	x,(x)
1657  001a 905f          	clrw	y
1658  001c ef0f          	ldw	(15,x),y
1659                     ; 750         (void)tcbDequeueEntry (timer_data_ptr->suspQ, timer_data_ptr->tcb_ptr);
1661  001e 1e02          	ldw	x,(OFST-1,sp)
1662  0020 fe            	ldw	x,(x)
1663  0021 89            	pushw	x
1664  0022 1e04          	ldw	x,(OFST+1,sp)
1665  0024 ee04          	ldw	x,(4,x)
1666  0026 cd0000        	call	_tcbDequeueEntry
1668  0029 85            	popw	x
1669                     ; 753         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1671  002a 1e02          	ldw	x,(OFST-1,sp)
1672  002c fe            	ldw	x,(x)
1673  002d 89            	pushw	x
1674  002e ae0000        	ldw	x,#_tcbReadyQ
1675  0031 cd0000        	call	_tcbEnqueuePriority
1677  0034 85            	popw	x
1678                     ; 756         CRITICAL_END ();
1680  0035 96            	ldw	x,sp
1681  0036 1c0001        	addw	x,#OFST-2
1683  0039 f6            ld A,(X)
1684  003a 88            push A
1685  003b 86            pop CC
1687  003c               L706:
1688                     ; 763 }
1691  003c 5b03          	addw	sp,#3
1692  003e 81            	ret
1763                     ; 788 static uint8_t queue_remove (ATOM_QUEUE *qptr, uint8_t* msgptr)
1763                     ; 789 {
1764                     .text:	section	.text,new
1765  0000               L3_queue_remove:
1767  0000 89            	pushw	x
1768  0001 5207          	subw	sp,#7
1769       00000007      OFST:	set	7
1772                     ; 794     if ((qptr == NULL) || (msgptr == NULL))
1774  0003 a30000        	cpw	x,#0
1775  0006 2704          	jreq	L746
1777  0008 1e0c          	ldw	x,(OFST+5,sp)
1778  000a 2609          	jrne	L546
1779  000c               L746:
1780                     ; 797         status = ATOM_ERR_PARAM;
1782  000c a6c9          	ld	a,#201
1783  000e 6b05          	ld	(OFST-2,sp),a
1785  0010               L156:
1786                     ; 856     return (status);
1788  0010 7b05          	ld	a,(OFST-2,sp)
1791  0012 5b09          	addw	sp,#9
1792  0014 81            	ret
1793  0015               L546:
1794                     ; 802         memcpy (msgptr, (qptr->buff_ptr + qptr->remove_index), qptr->unit_size);
1796  0015 1e08          	ldw	x,(OFST+1,sp)
1797  0017 ee08          	ldw	x,(8,x)
1798  0019 89            	pushw	x
1799  001a 1e0a          	ldw	x,(OFST+3,sp)
1800  001c ee14          	ldw	x,(20,x)
1801  001e 160a          	ldw	y,(OFST+3,sp)
1802  0020 90ee04        	ldw	y,(4,y)
1803  0023 90bf00        	ldw	c_x,y
1804  0026 72bb0000      	addw	x,c_x
1805  002a 89            	pushw	x
1806  002b 1e10          	ldw	x,(OFST+9,sp)
1807  002d cd0000        	call	_memcpy
1809  0030 5b04          	addw	sp,#4
1810                     ; 803         qptr->remove_index += qptr->unit_size;
1812  0032 1e08          	ldw	x,(OFST+1,sp)
1813  0034 1608          	ldw	y,(OFST+1,sp)
1814  0036 90e609        	ld	a,(9,y)
1815  0039 b703          	ld	c_lreg+3,a
1816  003b 90e608        	ld	a,(8,y)
1817  003e b702          	ld	c_lreg+2,a
1818  0040 90e607        	ld	a,(7,y)
1819  0043 b701          	ld	c_lreg+1,a
1820  0045 90e606        	ld	a,(6,y)
1821  0048 b700          	ld	c_lreg,a
1822  004a 1c0012        	addw	x,#18
1823  004d cd0000        	call	c_lgadd
1825                     ; 804         qptr->num_msgs_stored--;
1827  0050 1e08          	ldw	x,(OFST+1,sp)
1828  0052 1c0016        	addw	x,#22
1829  0055 a601          	ld	a,#1
1830  0057 cd0000        	call	c_lgsbc
1832                     ; 807         if (qptr->remove_index >= (qptr->unit_size * qptr->max_num_msgs))
1834  005a 1e08          	ldw	x,(OFST+1,sp)
1835  005c 1c0006        	addw	x,#6
1836  005f cd0000        	call	c_ltor
1838  0062 1e08          	ldw	x,(OFST+1,sp)
1839  0064 1c000a        	addw	x,#10
1840  0067 cd0000        	call	c_lmul
1842  006a 96            	ldw	x,sp
1843  006b 1c0001        	addw	x,#OFST-6
1844  006e cd0000        	call	c_rtol
1846  0071 1e08          	ldw	x,(OFST+1,sp)
1847  0073 1c0012        	addw	x,#18
1848  0076 cd0000        	call	c_ltor
1850  0079 96            	ldw	x,sp
1851  007a 1c0001        	addw	x,#OFST-6
1852  007d cd0000        	call	c_lcmp
1854  0080 2512          	jrult	L356
1855                     ; 808             qptr->remove_index = 0;
1857  0082 1e08          	ldw	x,(OFST+1,sp)
1858  0084 a600          	ld	a,#0
1859  0086 e715          	ld	(21,x),a
1860  0088 a600          	ld	a,#0
1861  008a e714          	ld	(20,x),a
1862  008c a600          	ld	a,#0
1863  008e e713          	ld	(19,x),a
1864  0090 a600          	ld	a,#0
1865  0092 e712          	ld	(18,x),a
1866  0094               L356:
1867                     ; 815         tcb_ptr = tcbDequeueHead (&qptr->putSuspQ);
1869  0094 1e08          	ldw	x,(OFST+1,sp)
1870  0096 cd0000        	call	_tcbDequeueHead
1872  0099 1f06          	ldw	(OFST-1,sp),x
1873                     ; 816         if (tcb_ptr)
1875  009b 1e06          	ldw	x,(OFST-1,sp)
1876  009d 273f          	jreq	L556
1877                     ; 819             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
1879  009f 1e06          	ldw	x,(OFST-1,sp)
1880  00a1 89            	pushw	x
1881  00a2 ae0000        	ldw	x,#_tcbReadyQ
1882  00a5 cd0000        	call	_tcbEnqueuePriority
1884  00a8 85            	popw	x
1885  00a9 4d            	tnz	a
1886  00aa 262a          	jrne	L756
1887                     ; 822                 tcb_ptr->suspend_wake_status = ATOM_OK;
1889  00ac 1e06          	ldw	x,(OFST-1,sp)
1890  00ae 6f0e          	clr	(14,x)
1891                     ; 825                 if ((tcb_ptr->suspend_timo_cb != NULL)
1891                     ; 826                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1893  00b0 1e06          	ldw	x,(OFST-1,sp)
1894  00b2 e610          	ld	a,(16,x)
1895  00b4 ea0f          	or	a,(15,x)
1896  00b6 2712          	jreq	L166
1898  00b8 1e06          	ldw	x,(OFST-1,sp)
1899  00ba ee0f          	ldw	x,(15,x)
1900  00bc cd0000        	call	_atomTimerCancel
1902  00bf 4d            	tnz	a
1903  00c0 2708          	jreq	L166
1904                     ; 829                     status = ATOM_ERR_TIMER;
1906  00c2 a6cd          	ld	a,#205
1907  00c4 6b05          	ld	(OFST-2,sp),a
1909  00c6 ac100010      	jpf	L156
1910  00ca               L166:
1911                     ; 834                     tcb_ptr->suspend_timo_cb = NULL;
1913  00ca 1e06          	ldw	x,(OFST-1,sp)
1914  00cc 905f          	clrw	y
1915  00ce ef0f          	ldw	(15,x),y
1916                     ; 837                     status = ATOM_OK;
1918  00d0 0f05          	clr	(OFST-2,sp)
1919  00d2 ac100010      	jpf	L156
1920  00d6               L756:
1921                     ; 846                 status = ATOM_ERR_QUEUE;
1923  00d6 a6cc          	ld	a,#204
1924  00d8 6b05          	ld	(OFST-2,sp),a
1925  00da ac100010      	jpf	L156
1926  00de               L556:
1927                     ; 852             status = ATOM_OK;
1929  00de 0f05          	clr	(OFST-2,sp)
1930  00e0 ac100010      	jpf	L156
2001                     ; 882 static uint8_t queue_insert (ATOM_QUEUE *qptr, uint8_t* msgptr)
2001                     ; 883 {
2002                     .text:	section	.text,new
2003  0000               L5_queue_insert:
2005  0000 89            	pushw	x
2006  0001 5207          	subw	sp,#7
2007       00000007      OFST:	set	7
2010                     ; 888     if ((qptr == NULL) || (msgptr == NULL))
2012  0003 a30000        	cpw	x,#0
2013  0006 2704          	jreq	L727
2015  0008 1e0c          	ldw	x,(OFST+5,sp)
2016  000a 2609          	jrne	L527
2017  000c               L727:
2018                     ; 891         status = ATOM_ERR_PARAM;
2020  000c a6c9          	ld	a,#201
2021  000e 6b05          	ld	(OFST-2,sp),a
2023  0010               L137:
2024                     ; 950     return (status);
2026  0010 7b05          	ld	a,(OFST-2,sp)
2029  0012 5b09          	addw	sp,#9
2030  0014 81            	ret
2031  0015               L527:
2032                     ; 896         memcpy ((qptr->buff_ptr + qptr->insert_index), msgptr, qptr->unit_size);
2034  0015 1e08          	ldw	x,(OFST+1,sp)
2035  0017 ee10          	ldw	x,(16,x)
2036  0019 1608          	ldw	y,(OFST+1,sp)
2037  001b 90ee04        	ldw	y,(4,y)
2038  001e 90bf00        	ldw	c_x,y
2039  0021 72bb0000      	addw	x,c_x
2040  0025 bf00          	ldw	c_x,x
2041  0027 160c          	ldw	y,(OFST+5,sp)
2042  0029 90bf00        	ldw	c_y,y
2043  002c 1e08          	ldw	x,(OFST+1,sp)
2044  002e ee08          	ldw	x,(8,x)
2045  0030 5d            	tnzw	x
2046  0031 270a          	jreq	L65
2047  0033               L06:
2048  0033 5a            	decw	x
2049  0034 92d600        	ld	a,([c_y.w],x)
2050  0037 92d700        	ld	([c_x.w],x),a
2051  003a 5d            	tnzw	x
2052  003b 26f6          	jrne	L06
2053  003d               L65:
2054                     ; 897         qptr->insert_index += qptr->unit_size;
2056  003d 1e08          	ldw	x,(OFST+1,sp)
2057  003f 1608          	ldw	y,(OFST+1,sp)
2058  0041 90e609        	ld	a,(9,y)
2059  0044 b703          	ld	c_lreg+3,a
2060  0046 90e608        	ld	a,(8,y)
2061  0049 b702          	ld	c_lreg+2,a
2062  004b 90e607        	ld	a,(7,y)
2063  004e b701          	ld	c_lreg+1,a
2064  0050 90e606        	ld	a,(6,y)
2065  0053 b700          	ld	c_lreg,a
2066  0055 1c000e        	addw	x,#14
2067  0058 cd0000        	call	c_lgadd
2069                     ; 898         qptr->num_msgs_stored++;
2071  005b 1e08          	ldw	x,(OFST+1,sp)
2072  005d 1c0016        	addw	x,#22
2073  0060 a601          	ld	a,#1
2074  0062 cd0000        	call	c_lgadc
2076                     ; 901         if (qptr->insert_index >= (qptr->unit_size * qptr->max_num_msgs))
2078  0065 1e08          	ldw	x,(OFST+1,sp)
2079  0067 1c0006        	addw	x,#6
2080  006a cd0000        	call	c_ltor
2082  006d 1e08          	ldw	x,(OFST+1,sp)
2083  006f 1c000a        	addw	x,#10
2084  0072 cd0000        	call	c_lmul
2086  0075 96            	ldw	x,sp
2087  0076 1c0001        	addw	x,#OFST-6
2088  0079 cd0000        	call	c_rtol
2090  007c 1e08          	ldw	x,(OFST+1,sp)
2091  007e 1c000e        	addw	x,#14
2092  0081 cd0000        	call	c_ltor
2094  0084 96            	ldw	x,sp
2095  0085 1c0001        	addw	x,#OFST-6
2096  0088 cd0000        	call	c_lcmp
2098  008b 2512          	jrult	L337
2099                     ; 902             qptr->insert_index = 0;
2101  008d 1e08          	ldw	x,(OFST+1,sp)
2102  008f a600          	ld	a,#0
2103  0091 e711          	ld	(17,x),a
2104  0093 a600          	ld	a,#0
2105  0095 e710          	ld	(16,x),a
2106  0097 a600          	ld	a,#0
2107  0099 e70f          	ld	(15,x),a
2108  009b a600          	ld	a,#0
2109  009d e70e          	ld	(14,x),a
2110  009f               L337:
2111                     ; 909         tcb_ptr = tcbDequeueHead (&qptr->getSuspQ);
2113  009f 1e08          	ldw	x,(OFST+1,sp)
2114  00a1 5c            	incw	x
2115  00a2 5c            	incw	x
2116  00a3 cd0000        	call	_tcbDequeueHead
2118  00a6 1f06          	ldw	(OFST-1,sp),x
2119                     ; 910         if (tcb_ptr)
2121  00a8 1e06          	ldw	x,(OFST-1,sp)
2122  00aa 273f          	jreq	L537
2123                     ; 913             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
2125  00ac 1e06          	ldw	x,(OFST-1,sp)
2126  00ae 89            	pushw	x
2127  00af ae0000        	ldw	x,#_tcbReadyQ
2128  00b2 cd0000        	call	_tcbEnqueuePriority
2130  00b5 85            	popw	x
2131  00b6 4d            	tnz	a
2132  00b7 262a          	jrne	L737
2133                     ; 916                 tcb_ptr->suspend_wake_status = ATOM_OK;
2135  00b9 1e06          	ldw	x,(OFST-1,sp)
2136  00bb 6f0e          	clr	(14,x)
2137                     ; 919                 if ((tcb_ptr->suspend_timo_cb != NULL)
2137                     ; 920                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
2139  00bd 1e06          	ldw	x,(OFST-1,sp)
2140  00bf e610          	ld	a,(16,x)
2141  00c1 ea0f          	or	a,(15,x)
2142  00c3 2712          	jreq	L147
2144  00c5 1e06          	ldw	x,(OFST-1,sp)
2145  00c7 ee0f          	ldw	x,(15,x)
2146  00c9 cd0000        	call	_atomTimerCancel
2148  00cc 4d            	tnz	a
2149  00cd 2708          	jreq	L147
2150                     ; 923                     status = ATOM_ERR_TIMER;
2152  00cf a6cd          	ld	a,#205
2153  00d1 6b05          	ld	(OFST-2,sp),a
2155  00d3 ac100010      	jpf	L137
2156  00d7               L147:
2157                     ; 928                     tcb_ptr->suspend_timo_cb = NULL;
2159  00d7 1e06          	ldw	x,(OFST-1,sp)
2160  00d9 905f          	clrw	y
2161  00db ef0f          	ldw	(15,x),y
2162                     ; 931                     status = ATOM_OK;
2164  00dd 0f05          	clr	(OFST-2,sp)
2165  00df ac100010      	jpf	L137
2166  00e3               L737:
2167                     ; 940                 status = ATOM_ERR_QUEUE;
2169  00e3 a6cc          	ld	a,#204
2170  00e5 6b05          	ld	(OFST-2,sp),a
2171  00e7 ac100010      	jpf	L137
2172  00eb               L537:
2173                     ; 946             status = ATOM_OK;
2175  00eb 0f05          	clr	(OFST-2,sp)
2176  00ed ac100010      	jpf	L137
2189                     	xdef	_atomQueuePut
2190                     	xdef	_atomQueueGet
2191                     	xdef	_atomQueueDelete
2192                     	xdef	_atomQueueCreate
2193                     	xref	_atomCurrentContext
2194                     	xref	_tcbDequeueEntry
2195                     	xref	_tcbDequeueHead
2196                     	xref	_tcbEnqueuePriority
2197                     	xref	_atomSched
2198                     	xref	_tcbReadyQ
2199                     	xref	_atomTimerCancel
2200                     	xref	_atomTimerRegister
2201                     	xref	_memcpy
2202                     	xref.b	c_lreg
2203                     	xref.b	c_x
2204                     	xref.b	c_y
2223                     	xref	c_lgadc
2224                     	xref	c_rtol
2225                     	xref	c_lmul
2226                     	xref	c_lgsbc
2227                     	xref	c_lgadd
2228                     	xref	c_lcmp
2229                     	xref	c_ltor
2230                     	xref	c_lzmp
2231                     	end
