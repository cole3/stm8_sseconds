   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 299                     ; 146 uint8_t atomQueueCreate (ATOM_QUEUE *qptr, uint8_t *buff_ptr, uint32_t unit_size, uint32_t max_num_msgs)
 299                     ; 147 {
 301                     	switch	.text
 302  0000               _atomQueueCreate:
 304  0000 89            	pushw	x
 305  0001 88            	push	a
 306       00000001      OFST:	set	1
 309                     ; 151     if ((qptr == NULL) || (buff_ptr == NULL))
 311  0002 a30000        	cpw	x,#0
 312  0005 2704          	jreq	L112
 314  0007 1e06          	ldw	x,(OFST+5,sp)
 315  0009 2609          	jrne	L702
 316  000b               L112:
 317                     ; 154         status = ATOM_ERR_PARAM;
 319  000b a6c9          	ld	a,#201
 320  000d 6b01          	ld	(OFST+0,sp),a
 322  000f               L312:
 323                     ; 181     return (status);
 325  000f 7b01          	ld	a,(OFST+0,sp)
 328  0011 5b03          	addw	sp,#3
 329  0013 81            	ret
 330  0014               L702:
 331                     ; 156     else if ((unit_size == 0) || (max_num_msgs == 0))
 333  0014 96            	ldw	x,sp
 334  0015 1c0008        	addw	x,#OFST+7
 335  0018 cd0000        	call	c_lzmp
 337  001b 2709          	jreq	L712
 339  001d 96            	ldw	x,sp
 340  001e 1c000c        	addw	x,#OFST+11
 341  0021 cd0000        	call	c_lzmp
 343  0024 2606          	jrne	L512
 344  0026               L712:
 345                     ; 159         status = ATOM_ERR_PARAM;
 347  0026 a6c9          	ld	a,#201
 348  0028 6b01          	ld	(OFST+0,sp),a
 350  002a 20e3          	jra	L312
 351  002c               L512:
 352                     ; 164         qptr->buff_ptr = buff_ptr;
 354  002c 1e02          	ldw	x,(OFST+1,sp)
 355  002e 1606          	ldw	y,(OFST+5,sp)
 356  0030 ef04          	ldw	(4,x),y
 357                     ; 165         qptr->unit_size = unit_size;
 359  0032 1e02          	ldw	x,(OFST+1,sp)
 360  0034 7b0b          	ld	a,(OFST+10,sp)
 361  0036 e709          	ld	(9,x),a
 362  0038 7b0a          	ld	a,(OFST+9,sp)
 363  003a e708          	ld	(8,x),a
 364  003c 7b09          	ld	a,(OFST+8,sp)
 365  003e e707          	ld	(7,x),a
 366  0040 7b08          	ld	a,(OFST+7,sp)
 367  0042 e706          	ld	(6,x),a
 368                     ; 166         qptr->max_num_msgs = max_num_msgs;
 370  0044 1e02          	ldw	x,(OFST+1,sp)
 371  0046 7b0f          	ld	a,(OFST+14,sp)
 372  0048 e70d          	ld	(13,x),a
 373  004a 7b0e          	ld	a,(OFST+13,sp)
 374  004c e70c          	ld	(12,x),a
 375  004e 7b0d          	ld	a,(OFST+12,sp)
 376  0050 e70b          	ld	(11,x),a
 377  0052 7b0c          	ld	a,(OFST+11,sp)
 378  0054 e70a          	ld	(10,x),a
 379                     ; 169         qptr->putSuspQ = NULL;
 381  0056 1e02          	ldw	x,(OFST+1,sp)
 382  0058 905f          	clrw	y
 383  005a ff            	ldw	(x),y
 384                     ; 170         qptr->getSuspQ = NULL;
 386  005b 1e02          	ldw	x,(OFST+1,sp)
 387  005d 905f          	clrw	y
 388  005f ef02          	ldw	(2,x),y
 389                     ; 173         qptr->insert_index = 0;
 391  0061 1e02          	ldw	x,(OFST+1,sp)
 392  0063 a600          	ld	a,#0
 393  0065 e711          	ld	(17,x),a
 394  0067 a600          	ld	a,#0
 395  0069 e710          	ld	(16,x),a
 396  006b a600          	ld	a,#0
 397  006d e70f          	ld	(15,x),a
 398  006f a600          	ld	a,#0
 399  0071 e70e          	ld	(14,x),a
 400                     ; 174         qptr->remove_index = 0;
 402  0073 1e02          	ldw	x,(OFST+1,sp)
 403  0075 a600          	ld	a,#0
 404  0077 e715          	ld	(21,x),a
 405  0079 a600          	ld	a,#0
 406  007b e714          	ld	(20,x),a
 407  007d a600          	ld	a,#0
 408  007f e713          	ld	(19,x),a
 409  0081 a600          	ld	a,#0
 410  0083 e712          	ld	(18,x),a
 411                     ; 175         qptr->num_msgs_stored = 0;
 413  0085 1e02          	ldw	x,(OFST+1,sp)
 414  0087 a600          	ld	a,#0
 415  0089 e719          	ld	(25,x),a
 416  008b a600          	ld	a,#0
 417  008d e718          	ld	(24,x),a
 418  008f a600          	ld	a,#0
 419  0091 e717          	ld	(23,x),a
 420  0093 a600          	ld	a,#0
 421  0095 e716          	ld	(22,x),a
 422                     ; 178         status = ATOM_OK;
 424  0097 0f01          	clr	(OFST+0,sp)
 425  0099 cc000f        	jra	L312
 508                     ; 205 uint8_t atomQueueDelete (ATOM_QUEUE *qptr)
 508                     ; 206 {
 509                     	switch	.text
 510  009c               _atomQueueDelete:
 512  009c 89            	pushw	x
 513  009d 5205          	subw	sp,#5
 514       00000005      OFST:	set	5
 517                     ; 210     uint8_t woken_threads = FALSE;
 519  009f 0f01          	clr	(OFST-4,sp)
 520                     ; 213     if (qptr == NULL)
 522  00a1 a30000        	cpw	x,#0
 523  00a4 2608          	jrne	L562
 524                     ; 216         status = ATOM_ERR_PARAM;
 526  00a6 a6c9          	ld	a,#201
 527  00a8 6b02          	ld	(OFST-3,sp),a
 529  00aa ac3f013f      	jpf	L762
 530  00ae               L562:
 531                     ; 221         status = ATOM_OK;
 533  00ae 0f02          	clr	(OFST-3,sp)
 534  00b0               L172:
 535                     ; 227             CRITICAL_START ();
 537  00b0 96            	ldw	x,sp
 538  00b1 1c0003        	addw	x,#OFST-2
 540  00b4 8a            push CC
 541  00b5 84            pop a
 542  00b6 f7            ld (X),A
 543  00b7 9b            sim
 545                     ; 230             if (((tcb_ptr = tcbDequeueHead (&qptr->getSuspQ)) != NULL)
 545                     ; 231                 || ((tcb_ptr = tcbDequeueHead (&qptr->putSuspQ)) != NULL))
 547  00b8 1e06          	ldw	x,(OFST+1,sp)
 548  00ba 5c            	incw	x
 549  00bb 5c            	incw	x
 550  00bc cd0000        	call	_tcbDequeueHead
 552  00bf 1f04          	ldw	(OFST-1,sp),x
 553  00c1 1e04          	ldw	x,(OFST-1,sp)
 554  00c3 260b          	jrne	L772
 556  00c5 1e06          	ldw	x,(OFST+1,sp)
 557  00c7 cd0000        	call	_tcbDequeueHead
 559  00ca 1f04          	ldw	(OFST-1,sp),x
 560  00cc 1e04          	ldw	x,(OFST-1,sp)
 561  00ce 2766          	jreq	L572
 562  00d0               L772:
 563                     ; 236                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 565  00d0 1e04          	ldw	x,(OFST-1,sp)
 566  00d2 a6ca          	ld	a,#202
 567  00d4 e70e          	ld	(14,x),a
 568                     ; 239                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 570  00d6 1e04          	ldw	x,(OFST-1,sp)
 571  00d8 89            	pushw	x
 572  00d9 ae0000        	ldw	x,#_tcbReadyQ
 573  00dc cd0000        	call	_tcbEnqueuePriority
 575  00df 85            	popw	x
 576  00e0 4d            	tnz	a
 577  00e1 270d          	jreq	L103
 578                     ; 242                     CRITICAL_END ();
 580  00e3 96            	ldw	x,sp
 581  00e4 1c0003        	addw	x,#OFST-2
 583  00e7 f6            ld A,(X)
 584  00e8 88            push A
 585  00e9 86            pop CC
 587                     ; 245                     status = ATOM_ERR_QUEUE;
 589  00ea a6cc          	ld	a,#204
 590  00ec 6b02          	ld	(OFST-3,sp),a
 591                     ; 246                     break;
 593  00ee 201d          	jra	L372
 594  00f0               L103:
 595                     ; 250                 if (tcb_ptr->suspend_timo_cb)
 597  00f0 1e04          	ldw	x,(OFST-1,sp)
 598  00f2 e610          	ld	a,(16,x)
 599  00f4 ea0f          	or	a,(15,x)
 600  00f6 272f          	jreq	L303
 601                     ; 253                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 603  00f8 1e04          	ldw	x,(OFST-1,sp)
 604  00fa ee0f          	ldw	x,(15,x)
 605  00fc cd0000        	call	_atomTimerCancel
 607  00ff 4d            	tnz	a
 608  0100 271f          	jreq	L503
 609                     ; 256                         CRITICAL_END ();
 611  0102 96            	ldw	x,sp
 612  0103 1c0003        	addw	x,#OFST-2
 614  0106 f6            ld A,(X)
 615  0107 88            push A
 616  0108 86            pop CC
 618                     ; 259                         status = ATOM_ERR_TIMER;
 620  0109 a6cd          	ld	a,#205
 621  010b 6b02          	ld	(OFST-3,sp),a
 622                     ; 260                         break;
 623  010d               L372:
 624                     ; 285         if (woken_threads == TRUE)
 626  010d 7b01          	ld	a,(OFST-4,sp)
 627  010f a101          	cp	a,#1
 628  0111 262c          	jrne	L762
 629                     ; 291             if (atomCurrentContext())
 631  0113 cd0000        	call	_atomCurrentContext
 633  0116 a30000        	cpw	x,#0
 634  0119 2724          	jreq	L762
 635                     ; 292                 atomSched (FALSE);
 637  011b 4f            	clr	a
 638  011c cd0000        	call	_atomSched
 640  011f 201e          	jra	L762
 641  0121               L503:
 642                     ; 264                     tcb_ptr->suspend_timo_cb = NULL;
 644  0121 1e04          	ldw	x,(OFST-1,sp)
 645  0123 905f          	clrw	y
 646  0125 ef0f          	ldw	(15,x),y
 647  0127               L303:
 648                     ; 269                 CRITICAL_END ();
 650  0127 96            	ldw	x,sp
 651  0128 1c0003        	addw	x,#OFST-2
 653  012b f6            ld A,(X)
 654  012c 88            push A
 655  012d 86            pop CC
 657                     ; 272                 woken_threads = TRUE;
 659  012e a601          	ld	a,#1
 660  0130 6b01          	ld	(OFST-4,sp),a
 662  0132 acb000b0      	jpf	L172
 663  0136               L572:
 664                     ; 279                 CRITICAL_END ();
 666  0136 96            	ldw	x,sp
 667  0137 1c0003        	addw	x,#OFST-2
 669  013a f6            ld A,(X)
 670  013b 88            push A
 671  013c 86            pop CC
 673                     ; 280                 break;
 675  013d 20ce          	jra	L372
 676  013f               L762:
 677                     ; 296     return (status);
 679  013f 7b02          	ld	a,(OFST-3,sp)
 682  0141 5b07          	addw	sp,#7
 683  0143 81            	ret
 842                     ; 337 uint8_t atomQueueGet (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
 842                     ; 338 {
 843                     	switch	.text
 844  0144               _atomQueueGet:
 846  0144 89            	pushw	x
 847  0145 5214          	subw	sp,#20
 848       00000014      OFST:	set	20
 851                     ; 346     if ((qptr == NULL) || (msgptr == NULL))
 853  0147 a30000        	cpw	x,#0
 854  014a 2704          	jreq	L324
 856  014c 1e1d          	ldw	x,(OFST+9,sp)
 857  014e 2609          	jrne	L124
 858  0150               L324:
 859                     ; 349         status = ATOM_ERR_PARAM;
 861  0150 a6c9          	ld	a,#201
 862  0152 6b14          	ld	(OFST+0,sp),a
 864  0154               L524:
 865                     ; 502     return (status);
 867  0154 7b14          	ld	a,(OFST+0,sp)
 870  0156 5b16          	addw	sp,#22
 871  0158 81            	ret
 872  0159               L124:
 873                     ; 354         CRITICAL_START ();
 875  0159 96            	ldw	x,sp
 876  015a 1c0011        	addw	x,#OFST-3
 878  015d 8a            push CC
 879  015e 84            pop a
 880  015f f7            ld (X),A
 881  0160 9b            sim
 883                     ; 357         if (qptr->num_msgs_stored == 0)
 885  0161 1e15          	ldw	x,(OFST+1,sp)
 886  0163 1c0016        	addw	x,#22
 887  0166 cd0000        	call	c_lzmp
 889  0169 2703          	jreq	L21
 890  016b cc0263        	jp	L724
 891  016e               L21:
 892                     ; 360             if (timeout >= 0)
 894  016e 9c            	rvf
 895  016f 0d19          	tnz	(OFST+5,sp)
 896  0171 2e03          	jrsge	L41
 897  0173 cc0254        	jp	L134
 898  0176               L41:
 899                     ; 365                 curr_tcb_ptr = atomCurrentContext();
 901  0176 cd0000        	call	_atomCurrentContext
 903  0179 1f12          	ldw	(OFST-2,sp),x
 904                     ; 368                 if (curr_tcb_ptr)
 906  017b 1e12          	ldw	x,(OFST-2,sp)
 907  017d 2603          	jrne	L61
 908  017f cc0245        	jp	L334
 909  0182               L61:
 910                     ; 371                     if (tcbEnqueuePriority (&qptr->getSuspQ, curr_tcb_ptr) == ATOM_OK)
 912  0182 1e12          	ldw	x,(OFST-2,sp)
 913  0184 89            	pushw	x
 914  0185 1e17          	ldw	x,(OFST+3,sp)
 915  0187 5c            	incw	x
 916  0188 5c            	incw	x
 917  0189 cd0000        	call	_tcbEnqueuePriority
 919  018c 85            	popw	x
 920  018d 4d            	tnz	a
 921  018e 2703          	jreq	L02
 922  0190 cc0236        	jp	L534
 923  0193               L02:
 924                     ; 374                         curr_tcb_ptr->suspended = TRUE;
 926  0193 1e12          	ldw	x,(OFST-2,sp)
 927  0195 a601          	ld	a,#1
 928  0197 e70d          	ld	(13,x),a
 929                     ; 377                         status = ATOM_OK;
 931  0199 0f14          	clr	(OFST+0,sp)
 932                     ; 380                         if (timeout)
 934  019b 96            	ldw	x,sp
 935  019c 1c0019        	addw	x,#OFST+5
 936  019f cd0000        	call	c_lzmp
 938  01a2 274f          	jreq	L734
 939                     ; 386                             timer_data.tcb_ptr = curr_tcb_ptr;
 941  01a4 1e12          	ldw	x,(OFST-2,sp)
 942  01a6 1f01          	ldw	(OFST-19,sp),x
 943                     ; 387                             timer_data.queue_ptr = qptr;
 945  01a8 1e15          	ldw	x,(OFST+1,sp)
 946  01aa 1f03          	ldw	(OFST-17,sp),x
 947                     ; 388                             timer_data.suspQ = &qptr->getSuspQ;
 949  01ac 1e15          	ldw	x,(OFST+1,sp)
 950  01ae 5c            	incw	x
 951  01af 5c            	incw	x
 952  01b0 1f05          	ldw	(OFST-15,sp),x
 953                     ; 391                             timer_cb.cb_func = atomQueueTimerCallback;
 955  01b2 ae03ce        	ldw	x,#L7_atomQueueTimerCallback
 956  01b5 1f07          	ldw	(OFST-13,sp),x
 957                     ; 392                             timer_cb.cb_data = (POINTER)&timer_data;
 959  01b7 96            	ldw	x,sp
 960  01b8 1c0001        	addw	x,#OFST-19
 961  01bb 1f09          	ldw	(OFST-11,sp),x
 962                     ; 393                             timer_cb.cb_ticks = timeout;
 964  01bd 1e1b          	ldw	x,(OFST+7,sp)
 965  01bf 1f0d          	ldw	(OFST-7,sp),x
 966  01c1 1e19          	ldw	x,(OFST+5,sp)
 967  01c3 1f0b          	ldw	(OFST-9,sp),x
 968                     ; 400                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 970  01c5 96            	ldw	x,sp
 971  01c6 1c0007        	addw	x,#OFST-13
 972  01c9 1612          	ldw	y,(OFST-2,sp)
 973  01cb 90ef0f        	ldw	(15,y),x
 974                     ; 403                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 976  01ce 96            	ldw	x,sp
 977  01cf 1c0007        	addw	x,#OFST-13
 978  01d2 cd0000        	call	_atomTimerRegister
 980  01d5 4d            	tnz	a
 981  01d6 2721          	jreq	L344
 982                     ; 406                                 status = ATOM_ERR_TIMER;
 984  01d8 a6cd          	ld	a,#205
 985  01da 6b14          	ld	(OFST+0,sp),a
 986                     ; 409                                 (void)tcbDequeueEntry (&qptr->getSuspQ, curr_tcb_ptr);
 988  01dc 1e12          	ldw	x,(OFST-2,sp)
 989  01de 89            	pushw	x
 990  01df 1e17          	ldw	x,(OFST+3,sp)
 991  01e1 5c            	incw	x
 992  01e2 5c            	incw	x
 993  01e3 cd0000        	call	_tcbDequeueEntry
 995  01e6 85            	popw	x
 996                     ; 410                                 curr_tcb_ptr->suspended = FALSE;
 998  01e7 1e12          	ldw	x,(OFST-2,sp)
 999  01e9 6f0d          	clr	(13,x)
1000                     ; 411                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1002  01eb 1e12          	ldw	x,(OFST-2,sp)
1003  01ed 905f          	clrw	y
1004  01ef ef0f          	ldw	(15,x),y
1005  01f1 2006          	jra	L344
1006  01f3               L734:
1007                     ; 419                             curr_tcb_ptr->suspend_timo_cb = NULL;
1009  01f3 1e12          	ldw	x,(OFST-2,sp)
1010  01f5 905f          	clrw	y
1011  01f7 ef0f          	ldw	(15,x),y
1012  01f9               L344:
1013                     ; 423                         CRITICAL_END ();
1015  01f9 96            	ldw	x,sp
1016  01fa 1c0011        	addw	x,#OFST-3
1018  01fd f6            ld A,(X)
1019  01fe 88            push A
1020  01ff 86            pop CC
1022                     ; 426                         if (status == ATOM_OK)
1024  0200 0d14          	tnz	(OFST+0,sp)
1025  0202 2703          	jreq	L22
1026  0204 cc0154        	jp	L524
1027  0207               L22:
1028                     ; 433                             atomSched (FALSE);
1030  0207 4f            	clr	a
1031  0208 cd0000        	call	_atomSched
1033                     ; 440                             status = curr_tcb_ptr->suspend_wake_status;
1035  020b 1e12          	ldw	x,(OFST-2,sp)
1036  020d e60e          	ld	a,(14,x)
1037  020f 6b14          	ld	(OFST+0,sp),a
1038                     ; 450                             if (status == ATOM_OK)
1040  0211 0d14          	tnz	(OFST+0,sp)
1041  0213 2703          	jreq	L42
1042  0215 cc0154        	jp	L524
1043  0218               L42:
1044                     ; 453                                 CRITICAL_START();
1046  0218 96            	ldw	x,sp
1047  0219 1c0011        	addw	x,#OFST-3
1049  021c 8a            push CC
1050  021d 84            pop a
1051  021e f7            ld (X),A
1052  021f 9b            sim
1054                     ; 456                                 status = queue_remove (qptr, msgptr);
1056  0220 1e1d          	ldw	x,(OFST+9,sp)
1057  0222 89            	pushw	x
1058  0223 1e17          	ldw	x,(OFST+3,sp)
1059  0225 cd040d        	call	L3_queue_remove
1061  0228 85            	popw	x
1062  0229 6b14          	ld	(OFST+0,sp),a
1063                     ; 459                                 CRITICAL_END();
1065  022b 96            	ldw	x,sp
1066  022c 1c0011        	addw	x,#OFST-3
1068  022f f6            ld A,(X)
1069  0230 88            push A
1070  0231 86            pop CC
1072  0232 ac540154      	jpf	L524
1073  0236               L534:
1074                     ; 466                         CRITICAL_END ();
1076  0236 96            	ldw	x,sp
1077  0237 1c0011        	addw	x,#OFST-3
1079  023a f6            ld A,(X)
1080  023b 88            push A
1081  023c 86            pop CC
1083                     ; 467                         status = ATOM_ERR_QUEUE;
1085  023d a6cc          	ld	a,#204
1086  023f 6b14          	ld	(OFST+0,sp),a
1087  0241 ac540154      	jpf	L524
1088  0245               L334:
1089                     ; 473                     CRITICAL_END ();
1091  0245 96            	ldw	x,sp
1092  0246 1c0011        	addw	x,#OFST-3
1094  0249 f6            ld A,(X)
1095  024a 88            push A
1096  024b 86            pop CC
1098                     ; 474                     status = ATOM_ERR_CONTEXT;
1100  024c a6c8          	ld	a,#200
1101  024e 6b14          	ld	(OFST+0,sp),a
1102  0250 ac540154      	jpf	L524
1103  0254               L134:
1104                     ; 480                 CRITICAL_END();
1106  0254 96            	ldw	x,sp
1107  0255 1c0011        	addw	x,#OFST-3
1109  0258 f6            ld A,(X)
1110  0259 88            push A
1111  025a 86            pop CC
1113                     ; 481                 status = ATOM_WOULDBLOCK;
1115  025b a603          	ld	a,#3
1116  025d 6b14          	ld	(OFST+0,sp),a
1117  025f ac540154      	jpf	L524
1118  0263               L724:
1119                     ; 487             status = queue_remove (qptr, msgptr);
1121  0263 1e1d          	ldw	x,(OFST+9,sp)
1122  0265 89            	pushw	x
1123  0266 1e17          	ldw	x,(OFST+3,sp)
1124  0268 cd040d        	call	L3_queue_remove
1126  026b 85            	popw	x
1127  026c 6b14          	ld	(OFST+0,sp),a
1128                     ; 490             CRITICAL_END ();
1130  026e 96            	ldw	x,sp
1131  026f 1c0011        	addw	x,#OFST-3
1133  0272 f6            ld A,(X)
1134  0273 88            push A
1135  0274 86            pop CC
1137                     ; 497             if (atomCurrentContext())
1139  0275 cd0000        	call	_atomCurrentContext
1141  0278 a30000        	cpw	x,#0
1142  027b 2603          	jrne	L62
1143  027d cc0154        	jp	L524
1144  0280               L62:
1145                     ; 498                 atomSched (FALSE);
1147  0280 4f            	clr	a
1148  0281 cd0000        	call	_atomSched
1150  0284 ac540154      	jpf	L524
1265                     ; 543 uint8_t atomQueuePut (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
1265                     ; 544 {
1266                     	switch	.text
1267  0288               _atomQueuePut:
1269  0288 89            	pushw	x
1270  0289 5214          	subw	sp,#20
1271       00000014      OFST:	set	20
1274                     ; 552     if ((qptr == NULL) || (msgptr == NULL))
1276  028b a30000        	cpw	x,#0
1277  028e 2704          	jreq	L345
1279  0290 1e1d          	ldw	x,(OFST+9,sp)
1280  0292 2609          	jrne	L145
1281  0294               L345:
1282                     ; 555         status = ATOM_ERR_PARAM;
1284  0294 a6c9          	ld	a,#201
1285  0296 6b14          	ld	(OFST+0,sp),a
1287  0298               L545:
1288                     ; 710     return (status);
1290  0298 7b14          	ld	a,(OFST+0,sp)
1293  029a 5b16          	addw	sp,#22
1294  029c 81            	ret
1295  029d               L145:
1296                     ; 560         CRITICAL_START ();
1298  029d 96            	ldw	x,sp
1299  029e 1c0011        	addw	x,#OFST-3
1301  02a1 8a            push CC
1302  02a2 84            pop a
1303  02a3 f7            ld (X),A
1304  02a4 9b            sim
1306                     ; 563         if (qptr->num_msgs_stored == qptr->max_num_msgs)
1308  02a5 1e15          	ldw	x,(OFST+1,sp)
1309  02a7 1c0016        	addw	x,#22
1310  02aa cd0000        	call	c_ltor
1312  02ad 1e15          	ldw	x,(OFST+1,sp)
1313  02af 1c000a        	addw	x,#10
1314  02b2 cd0000        	call	c_lcmp
1316  02b5 2703          	jreq	L23
1317  02b7 cc03a9        	jp	L745
1318  02ba               L23:
1319                     ; 566             if (timeout >= 0)
1321  02ba 9c            	rvf
1322  02bb 0d19          	tnz	(OFST+5,sp)
1323  02bd 2e03          	jrsge	L43
1324  02bf cc039a        	jp	L155
1325  02c2               L43:
1326                     ; 571                 curr_tcb_ptr = atomCurrentContext();
1328  02c2 cd0000        	call	_atomCurrentContext
1330  02c5 1f12          	ldw	(OFST-2,sp),x
1331                     ; 574                 if (curr_tcb_ptr)
1333  02c7 1e12          	ldw	x,(OFST-2,sp)
1334  02c9 2603          	jrne	L63
1335  02cb cc038b        	jp	L355
1336  02ce               L63:
1337                     ; 577                     if (tcbEnqueuePriority (&qptr->putSuspQ, curr_tcb_ptr) == ATOM_OK)
1339  02ce 1e12          	ldw	x,(OFST-2,sp)
1340  02d0 89            	pushw	x
1341  02d1 1e17          	ldw	x,(OFST+3,sp)
1342  02d3 cd0000        	call	_tcbEnqueuePriority
1344  02d6 85            	popw	x
1345  02d7 4d            	tnz	a
1346  02d8 2703          	jreq	L04
1347  02da cc037c        	jp	L555
1348  02dd               L04:
1349                     ; 580                         curr_tcb_ptr->suspended = TRUE;
1351  02dd 1e12          	ldw	x,(OFST-2,sp)
1352  02df a601          	ld	a,#1
1353  02e1 e70d          	ld	(13,x),a
1354                     ; 583                         status = ATOM_OK;
1356  02e3 0f14          	clr	(OFST+0,sp)
1357                     ; 586                         if (timeout)
1359  02e5 96            	ldw	x,sp
1360  02e6 1c0019        	addw	x,#OFST+5
1361  02e9 cd0000        	call	c_lzmp
1363  02ec 274b          	jreq	L755
1364                     ; 592                             timer_data.tcb_ptr = curr_tcb_ptr;
1366  02ee 1e12          	ldw	x,(OFST-2,sp)
1367  02f0 1f01          	ldw	(OFST-19,sp),x
1368                     ; 593                             timer_data.queue_ptr = qptr;
1370  02f2 1e15          	ldw	x,(OFST+1,sp)
1371  02f4 1f03          	ldw	(OFST-17,sp),x
1372                     ; 594                             timer_data.suspQ = &qptr->putSuspQ;
1374  02f6 1e15          	ldw	x,(OFST+1,sp)
1375  02f8 1f05          	ldw	(OFST-15,sp),x
1376                     ; 598                             timer_cb.cb_func = atomQueueTimerCallback;
1378  02fa ae03ce        	ldw	x,#L7_atomQueueTimerCallback
1379  02fd 1f07          	ldw	(OFST-13,sp),x
1380                     ; 599                             timer_cb.cb_data = (POINTER)&timer_data;
1382  02ff 96            	ldw	x,sp
1383  0300 1c0001        	addw	x,#OFST-19
1384  0303 1f09          	ldw	(OFST-11,sp),x
1385                     ; 600                             timer_cb.cb_ticks = timeout;
1387  0305 1e1b          	ldw	x,(OFST+7,sp)
1388  0307 1f0d          	ldw	(OFST-7,sp),x
1389  0309 1e19          	ldw	x,(OFST+5,sp)
1390  030b 1f0b          	ldw	(OFST-9,sp),x
1391                     ; 608                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
1393  030d 96            	ldw	x,sp
1394  030e 1c0007        	addw	x,#OFST-13
1395  0311 1612          	ldw	y,(OFST-2,sp)
1396  0313 90ef0f        	ldw	(15,y),x
1397                     ; 611                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
1399  0316 96            	ldw	x,sp
1400  0317 1c0007        	addw	x,#OFST-13
1401  031a cd0000        	call	_atomTimerRegister
1403  031d 4d            	tnz	a
1404  031e 271f          	jreq	L365
1405                     ; 614                                 status = ATOM_ERR_TIMER;
1407  0320 a6cd          	ld	a,#205
1408  0322 6b14          	ld	(OFST+0,sp),a
1409                     ; 617                                 (void)tcbDequeueEntry (&qptr->putSuspQ, curr_tcb_ptr);
1411  0324 1e12          	ldw	x,(OFST-2,sp)
1412  0326 89            	pushw	x
1413  0327 1e17          	ldw	x,(OFST+3,sp)
1414  0329 cd0000        	call	_tcbDequeueEntry
1416  032c 85            	popw	x
1417                     ; 618                                 curr_tcb_ptr->suspended = FALSE;
1419  032d 1e12          	ldw	x,(OFST-2,sp)
1420  032f 6f0d          	clr	(13,x)
1421                     ; 619                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1423  0331 1e12          	ldw	x,(OFST-2,sp)
1424  0333 905f          	clrw	y
1425  0335 ef0f          	ldw	(15,x),y
1426  0337 2006          	jra	L365
1427  0339               L755:
1428                     ; 627                             curr_tcb_ptr->suspend_timo_cb = NULL;
1430  0339 1e12          	ldw	x,(OFST-2,sp)
1431  033b 905f          	clrw	y
1432  033d ef0f          	ldw	(15,x),y
1433  033f               L365:
1434                     ; 631                         CRITICAL_END ();
1436  033f 96            	ldw	x,sp
1437  0340 1c0011        	addw	x,#OFST-3
1439  0343 f6            ld A,(X)
1440  0344 88            push A
1441  0345 86            pop CC
1443                     ; 634                         if (status == ATOM_OK)
1445  0346 0d14          	tnz	(OFST+0,sp)
1446  0348 2703          	jreq	L24
1447  034a cc0298        	jp	L545
1448  034d               L24:
1449                     ; 641                             atomSched (FALSE);
1451  034d 4f            	clr	a
1452  034e cd0000        	call	_atomSched
1454                     ; 648                             status = curr_tcb_ptr->suspend_wake_status;
1456  0351 1e12          	ldw	x,(OFST-2,sp)
1457  0353 e60e          	ld	a,(14,x)
1458  0355 6b14          	ld	(OFST+0,sp),a
1459                     ; 658                             if (status == ATOM_OK)
1461  0357 0d14          	tnz	(OFST+0,sp)
1462  0359 2703          	jreq	L44
1463  035b cc0298        	jp	L545
1464  035e               L44:
1465                     ; 661                                 CRITICAL_START();
1467  035e 96            	ldw	x,sp
1468  035f 1c0011        	addw	x,#OFST-3
1470  0362 8a            push CC
1471  0363 84            pop a
1472  0364 f7            ld (X),A
1473  0365 9b            sim
1475                     ; 664                                 status = queue_insert (qptr, msgptr);
1477  0366 1e1d          	ldw	x,(OFST+9,sp)
1478  0368 89            	pushw	x
1479  0369 1e17          	ldw	x,(OFST+3,sp)
1480  036b cd04f1        	call	L5_queue_insert
1482  036e 85            	popw	x
1483  036f 6b14          	ld	(OFST+0,sp),a
1484                     ; 667                                 CRITICAL_END();
1486  0371 96            	ldw	x,sp
1487  0372 1c0011        	addw	x,#OFST-3
1489  0375 f6            ld A,(X)
1490  0376 88            push A
1491  0377 86            pop CC
1493  0378 ac980298      	jpf	L545
1494  037c               L555:
1495                     ; 674                         CRITICAL_END ();
1497  037c 96            	ldw	x,sp
1498  037d 1c0011        	addw	x,#OFST-3
1500  0380 f6            ld A,(X)
1501  0381 88            push A
1502  0382 86            pop CC
1504                     ; 675                         status = ATOM_ERR_QUEUE;
1506  0383 a6cc          	ld	a,#204
1507  0385 6b14          	ld	(OFST+0,sp),a
1508  0387 ac980298      	jpf	L545
1509  038b               L355:
1510                     ; 681                     CRITICAL_END ();
1512  038b 96            	ldw	x,sp
1513  038c 1c0011        	addw	x,#OFST-3
1515  038f f6            ld A,(X)
1516  0390 88            push A
1517  0391 86            pop CC
1519                     ; 682                     status = ATOM_ERR_CONTEXT;
1521  0392 a6c8          	ld	a,#200
1522  0394 6b14          	ld	(OFST+0,sp),a
1523  0396 ac980298      	jpf	L545
1524  039a               L155:
1525                     ; 688                 CRITICAL_END();
1527  039a 96            	ldw	x,sp
1528  039b 1c0011        	addw	x,#OFST-3
1530  039e f6            ld A,(X)
1531  039f 88            push A
1532  03a0 86            pop CC
1534                     ; 689                 status = ATOM_WOULDBLOCK;
1536  03a1 a603          	ld	a,#3
1537  03a3 6b14          	ld	(OFST+0,sp),a
1538  03a5 ac980298      	jpf	L545
1539  03a9               L745:
1540                     ; 695             status = queue_insert (qptr, msgptr);
1542  03a9 1e1d          	ldw	x,(OFST+9,sp)
1543  03ab 89            	pushw	x
1544  03ac 1e17          	ldw	x,(OFST+3,sp)
1545  03ae cd04f1        	call	L5_queue_insert
1547  03b1 85            	popw	x
1548  03b2 6b14          	ld	(OFST+0,sp),a
1549                     ; 698             CRITICAL_END ();
1551  03b4 96            	ldw	x,sp
1552  03b5 1c0011        	addw	x,#OFST-3
1554  03b8 f6            ld A,(X)
1555  03b9 88            push A
1556  03ba 86            pop CC
1558                     ; 705             if (atomCurrentContext())
1560  03bb cd0000        	call	_atomCurrentContext
1562  03be a30000        	cpw	x,#0
1563  03c1 2603          	jrne	L64
1564  03c3 cc0298        	jp	L545
1565  03c6               L64:
1566                     ; 706                 atomSched (FALSE);
1568  03c6 4f            	clr	a
1569  03c7 cd0000        	call	_atomSched
1571  03ca ac980298      	jpf	L545
1631                     ; 726 static void atomQueueTimerCallback (POINTER cb_data)
1631                     ; 727 {
1632                     	switch	.text
1633  03ce               L7_atomQueueTimerCallback:
1635  03ce 5203          	subw	sp,#3
1636       00000003      OFST:	set	3
1639                     ; 732     timer_data_ptr = (QUEUE_TIMER *)cb_data;
1641  03d0 1f02          	ldw	(OFST-1,sp),x
1642                     ; 735     if (timer_data_ptr)
1644  03d2 1e02          	ldw	x,(OFST-1,sp)
1645  03d4 2734          	jreq	L336
1646                     ; 738         CRITICAL_START ();
1648  03d6 96            	ldw	x,sp
1649  03d7 1c0001        	addw	x,#OFST-2
1651  03da 8a            push CC
1652  03db 84            pop a
1653  03dc f7            ld (X),A
1654  03dd 9b            sim
1656                     ; 741         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1658  03de 1e02          	ldw	x,(OFST-1,sp)
1659  03e0 fe            	ldw	x,(x)
1660  03e1 a602          	ld	a,#2
1661  03e3 e70e          	ld	(14,x),a
1662                     ; 744         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1664  03e5 1e02          	ldw	x,(OFST-1,sp)
1665  03e7 fe            	ldw	x,(x)
1666  03e8 905f          	clrw	y
1667  03ea ef0f          	ldw	(15,x),y
1668                     ; 750         (void)tcbDequeueEntry (timer_data_ptr->suspQ, timer_data_ptr->tcb_ptr);
1670  03ec 1e02          	ldw	x,(OFST-1,sp)
1671  03ee fe            	ldw	x,(x)
1672  03ef 89            	pushw	x
1673  03f0 1e04          	ldw	x,(OFST+1,sp)
1674  03f2 ee04          	ldw	x,(4,x)
1675  03f4 cd0000        	call	_tcbDequeueEntry
1677  03f7 85            	popw	x
1678                     ; 753         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1680  03f8 1e02          	ldw	x,(OFST-1,sp)
1681  03fa fe            	ldw	x,(x)
1682  03fb 89            	pushw	x
1683  03fc ae0000        	ldw	x,#_tcbReadyQ
1684  03ff cd0000        	call	_tcbEnqueuePriority
1686  0402 85            	popw	x
1687                     ; 756         CRITICAL_END ();
1689  0403 96            	ldw	x,sp
1690  0404 1c0001        	addw	x,#OFST-2
1692  0407 f6            ld A,(X)
1693  0408 88            push A
1694  0409 86            pop CC
1696  040a               L336:
1697                     ; 763 }
1700  040a 5b03          	addw	sp,#3
1701  040c 81            	ret
1774                     ; 788 static uint8_t queue_remove (ATOM_QUEUE *qptr, uint8_t* msgptr)
1774                     ; 789 {
1775                     	switch	.text
1776  040d               L3_queue_remove:
1778  040d 89            	pushw	x
1779  040e 5207          	subw	sp,#7
1780       00000007      OFST:	set	7
1783                     ; 794     if ((qptr == NULL) || (msgptr == NULL))
1785  0410 a30000        	cpw	x,#0
1786  0413 2704          	jreq	L576
1788  0415 1e0c          	ldw	x,(OFST+5,sp)
1789  0417 2609          	jrne	L376
1790  0419               L576:
1791                     ; 797         status = ATOM_ERR_PARAM;
1793  0419 a6c9          	ld	a,#201
1794  041b 6b05          	ld	(OFST-2,sp),a
1796  041d               L776:
1797                     ; 856     return (status);
1799  041d 7b05          	ld	a,(OFST-2,sp)
1802  041f 5b09          	addw	sp,#9
1803  0421 81            	ret
1804  0422               L376:
1805                     ; 802         memcpy (msgptr, (qptr->buff_ptr + qptr->remove_index), qptr->unit_size);
1807  0422 1e08          	ldw	x,(OFST+1,sp)
1808  0424 ee08          	ldw	x,(8,x)
1809  0426 89            	pushw	x
1810  0427 1e0a          	ldw	x,(OFST+3,sp)
1811  0429 ee14          	ldw	x,(20,x)
1812  042b 160a          	ldw	y,(OFST+3,sp)
1813  042d 90ee04        	ldw	y,(4,y)
1814  0430 90bf00        	ldw	c_x,y
1815  0433 72bb0000      	addw	x,c_x
1816  0437 89            	pushw	x
1817  0438 1e10          	ldw	x,(OFST+9,sp)
1818  043a cd0000        	call	_memcpy
1820  043d 5b04          	addw	sp,#4
1821                     ; 803         qptr->remove_index += qptr->unit_size;
1823  043f 1e08          	ldw	x,(OFST+1,sp)
1824  0441 1608          	ldw	y,(OFST+1,sp)
1825  0443 90e609        	ld	a,(9,y)
1826  0446 b703          	ld	c_lreg+3,a
1827  0448 90e608        	ld	a,(8,y)
1828  044b b702          	ld	c_lreg+2,a
1829  044d 90e607        	ld	a,(7,y)
1830  0450 b701          	ld	c_lreg+1,a
1831  0452 90e606        	ld	a,(6,y)
1832  0455 b700          	ld	c_lreg,a
1833  0457 1c0012        	addw	x,#18
1834  045a cd0000        	call	c_lgadd
1836                     ; 804         qptr->num_msgs_stored--;
1838  045d 1e08          	ldw	x,(OFST+1,sp)
1839  045f 1c0016        	addw	x,#22
1840  0462 a601          	ld	a,#1
1841  0464 cd0000        	call	c_lgsbc
1843                     ; 807         if (qptr->remove_index >= (qptr->unit_size * qptr->max_num_msgs))
1845  0467 1e08          	ldw	x,(OFST+1,sp)
1846  0469 1c0006        	addw	x,#6
1847  046c cd0000        	call	c_ltor
1849  046f 1e08          	ldw	x,(OFST+1,sp)
1850  0471 1c000a        	addw	x,#10
1851  0474 cd0000        	call	c_lmul
1853  0477 96            	ldw	x,sp
1854  0478 1c0001        	addw	x,#OFST-6
1855  047b cd0000        	call	c_rtol
1857  047e 1e08          	ldw	x,(OFST+1,sp)
1858  0480 1c0012        	addw	x,#18
1859  0483 cd0000        	call	c_ltor
1861  0486 96            	ldw	x,sp
1862  0487 1c0001        	addw	x,#OFST-6
1863  048a cd0000        	call	c_lcmp
1865  048d 2512          	jrult	L107
1866                     ; 808             qptr->remove_index = 0;
1868  048f 1e08          	ldw	x,(OFST+1,sp)
1869  0491 a600          	ld	a,#0
1870  0493 e715          	ld	(21,x),a
1871  0495 a600          	ld	a,#0
1872  0497 e714          	ld	(20,x),a
1873  0499 a600          	ld	a,#0
1874  049b e713          	ld	(19,x),a
1875  049d a600          	ld	a,#0
1876  049f e712          	ld	(18,x),a
1877  04a1               L107:
1878                     ; 815         tcb_ptr = tcbDequeueHead (&qptr->putSuspQ);
1880  04a1 1e08          	ldw	x,(OFST+1,sp)
1881  04a3 cd0000        	call	_tcbDequeueHead
1883  04a6 1f06          	ldw	(OFST-1,sp),x
1884                     ; 816         if (tcb_ptr)
1886  04a8 1e06          	ldw	x,(OFST-1,sp)
1887  04aa 273f          	jreq	L307
1888                     ; 819             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
1890  04ac 1e06          	ldw	x,(OFST-1,sp)
1891  04ae 89            	pushw	x
1892  04af ae0000        	ldw	x,#_tcbReadyQ
1893  04b2 cd0000        	call	_tcbEnqueuePriority
1895  04b5 85            	popw	x
1896  04b6 4d            	tnz	a
1897  04b7 262a          	jrne	L507
1898                     ; 822                 tcb_ptr->suspend_wake_status = ATOM_OK;
1900  04b9 1e06          	ldw	x,(OFST-1,sp)
1901  04bb 6f0e          	clr	(14,x)
1902                     ; 825                 if ((tcb_ptr->suspend_timo_cb != NULL)
1902                     ; 826                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1904  04bd 1e06          	ldw	x,(OFST-1,sp)
1905  04bf e610          	ld	a,(16,x)
1906  04c1 ea0f          	or	a,(15,x)
1907  04c3 2712          	jreq	L707
1909  04c5 1e06          	ldw	x,(OFST-1,sp)
1910  04c7 ee0f          	ldw	x,(15,x)
1911  04c9 cd0000        	call	_atomTimerCancel
1913  04cc 4d            	tnz	a
1914  04cd 2708          	jreq	L707
1915                     ; 829                     status = ATOM_ERR_TIMER;
1917  04cf a6cd          	ld	a,#205
1918  04d1 6b05          	ld	(OFST-2,sp),a
1920  04d3 ac1d041d      	jpf	L776
1921  04d7               L707:
1922                     ; 834                     tcb_ptr->suspend_timo_cb = NULL;
1924  04d7 1e06          	ldw	x,(OFST-1,sp)
1925  04d9 905f          	clrw	y
1926  04db ef0f          	ldw	(15,x),y
1927                     ; 837                     status = ATOM_OK;
1929  04dd 0f05          	clr	(OFST-2,sp)
1930  04df ac1d041d      	jpf	L776
1931  04e3               L507:
1932                     ; 846                 status = ATOM_ERR_QUEUE;
1934  04e3 a6cc          	ld	a,#204
1935  04e5 6b05          	ld	(OFST-2,sp),a
1936  04e7 ac1d041d      	jpf	L776
1937  04eb               L307:
1938                     ; 852             status = ATOM_OK;
1940  04eb 0f05          	clr	(OFST-2,sp)
1941  04ed ac1d041d      	jpf	L776
2014                     ; 882 static uint8_t queue_insert (ATOM_QUEUE *qptr, uint8_t* msgptr)
2014                     ; 883 {
2015                     	switch	.text
2016  04f1               L5_queue_insert:
2018  04f1 89            	pushw	x
2019  04f2 5207          	subw	sp,#7
2020       00000007      OFST:	set	7
2023                     ; 888     if ((qptr == NULL) || (msgptr == NULL))
2025  04f4 a30000        	cpw	x,#0
2026  04f7 2704          	jreq	L757
2028  04f9 1e0c          	ldw	x,(OFST+5,sp)
2029  04fb 2609          	jrne	L557
2030  04fd               L757:
2031                     ; 891         status = ATOM_ERR_PARAM;
2033  04fd a6c9          	ld	a,#201
2034  04ff 6b05          	ld	(OFST-2,sp),a
2036  0501               L167:
2037                     ; 950     return (status);
2039  0501 7b05          	ld	a,(OFST-2,sp)
2042  0503 5b09          	addw	sp,#9
2043  0505 81            	ret
2044  0506               L557:
2045                     ; 896         memcpy ((qptr->buff_ptr + qptr->insert_index), msgptr, qptr->unit_size);
2047  0506 1e08          	ldw	x,(OFST+1,sp)
2048  0508 ee10          	ldw	x,(16,x)
2049  050a 1608          	ldw	y,(OFST+1,sp)
2050  050c 90ee04        	ldw	y,(4,y)
2051  050f 90bf00        	ldw	c_x,y
2052  0512 72bb0000      	addw	x,c_x
2053  0516 bf00          	ldw	c_x,x
2054  0518 160c          	ldw	y,(OFST+5,sp)
2055  051a 90bf00        	ldw	c_y,y
2056  051d 1e08          	ldw	x,(OFST+1,sp)
2057  051f ee08          	ldw	x,(8,x)
2058  0521 5d            	tnzw	x
2059  0522 270a          	jreq	L65
2060  0524               L06:
2061  0524 5a            	decw	x
2062  0525 92d600        	ld	a,([c_y.w],x)
2063  0528 92d700        	ld	([c_x.w],x),a
2064  052b 5d            	tnzw	x
2065  052c 26f6          	jrne	L06
2066  052e               L65:
2067                     ; 897         qptr->insert_index += qptr->unit_size;
2069  052e 1e08          	ldw	x,(OFST+1,sp)
2070  0530 1608          	ldw	y,(OFST+1,sp)
2071  0532 90e609        	ld	a,(9,y)
2072  0535 b703          	ld	c_lreg+3,a
2073  0537 90e608        	ld	a,(8,y)
2074  053a b702          	ld	c_lreg+2,a
2075  053c 90e607        	ld	a,(7,y)
2076  053f b701          	ld	c_lreg+1,a
2077  0541 90e606        	ld	a,(6,y)
2078  0544 b700          	ld	c_lreg,a
2079  0546 1c000e        	addw	x,#14
2080  0549 cd0000        	call	c_lgadd
2082                     ; 898         qptr->num_msgs_stored++;
2084  054c 1e08          	ldw	x,(OFST+1,sp)
2085  054e 1c0016        	addw	x,#22
2086  0551 a601          	ld	a,#1
2087  0553 cd0000        	call	c_lgadc
2089                     ; 901         if (qptr->insert_index >= (qptr->unit_size * qptr->max_num_msgs))
2091  0556 1e08          	ldw	x,(OFST+1,sp)
2092  0558 1c0006        	addw	x,#6
2093  055b cd0000        	call	c_ltor
2095  055e 1e08          	ldw	x,(OFST+1,sp)
2096  0560 1c000a        	addw	x,#10
2097  0563 cd0000        	call	c_lmul
2099  0566 96            	ldw	x,sp
2100  0567 1c0001        	addw	x,#OFST-6
2101  056a cd0000        	call	c_rtol
2103  056d 1e08          	ldw	x,(OFST+1,sp)
2104  056f 1c000e        	addw	x,#14
2105  0572 cd0000        	call	c_ltor
2107  0575 96            	ldw	x,sp
2108  0576 1c0001        	addw	x,#OFST-6
2109  0579 cd0000        	call	c_lcmp
2111  057c 2512          	jrult	L367
2112                     ; 902             qptr->insert_index = 0;
2114  057e 1e08          	ldw	x,(OFST+1,sp)
2115  0580 a600          	ld	a,#0
2116  0582 e711          	ld	(17,x),a
2117  0584 a600          	ld	a,#0
2118  0586 e710          	ld	(16,x),a
2119  0588 a600          	ld	a,#0
2120  058a e70f          	ld	(15,x),a
2121  058c a600          	ld	a,#0
2122  058e e70e          	ld	(14,x),a
2123  0590               L367:
2124                     ; 909         tcb_ptr = tcbDequeueHead (&qptr->getSuspQ);
2126  0590 1e08          	ldw	x,(OFST+1,sp)
2127  0592 5c            	incw	x
2128  0593 5c            	incw	x
2129  0594 cd0000        	call	_tcbDequeueHead
2131  0597 1f06          	ldw	(OFST-1,sp),x
2132                     ; 910         if (tcb_ptr)
2134  0599 1e06          	ldw	x,(OFST-1,sp)
2135  059b 273f          	jreq	L567
2136                     ; 913             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
2138  059d 1e06          	ldw	x,(OFST-1,sp)
2139  059f 89            	pushw	x
2140  05a0 ae0000        	ldw	x,#_tcbReadyQ
2141  05a3 cd0000        	call	_tcbEnqueuePriority
2143  05a6 85            	popw	x
2144  05a7 4d            	tnz	a
2145  05a8 262a          	jrne	L767
2146                     ; 916                 tcb_ptr->suspend_wake_status = ATOM_OK;
2148  05aa 1e06          	ldw	x,(OFST-1,sp)
2149  05ac 6f0e          	clr	(14,x)
2150                     ; 919                 if ((tcb_ptr->suspend_timo_cb != NULL)
2150                     ; 920                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
2152  05ae 1e06          	ldw	x,(OFST-1,sp)
2153  05b0 e610          	ld	a,(16,x)
2154  05b2 ea0f          	or	a,(15,x)
2155  05b4 2712          	jreq	L177
2157  05b6 1e06          	ldw	x,(OFST-1,sp)
2158  05b8 ee0f          	ldw	x,(15,x)
2159  05ba cd0000        	call	_atomTimerCancel
2161  05bd 4d            	tnz	a
2162  05be 2708          	jreq	L177
2163                     ; 923                     status = ATOM_ERR_TIMER;
2165  05c0 a6cd          	ld	a,#205
2166  05c2 6b05          	ld	(OFST-2,sp),a
2168  05c4 ac010501      	jpf	L167
2169  05c8               L177:
2170                     ; 928                     tcb_ptr->suspend_timo_cb = NULL;
2172  05c8 1e06          	ldw	x,(OFST-1,sp)
2173  05ca 905f          	clrw	y
2174  05cc ef0f          	ldw	(15,x),y
2175                     ; 931                     status = ATOM_OK;
2177  05ce 0f05          	clr	(OFST-2,sp)
2178  05d0 ac010501      	jpf	L167
2179  05d4               L767:
2180                     ; 940                 status = ATOM_ERR_QUEUE;
2182  05d4 a6cc          	ld	a,#204
2183  05d6 6b05          	ld	(OFST-2,sp),a
2184  05d8 ac010501      	jpf	L167
2185  05dc               L567:
2186                     ; 946             status = ATOM_OK;
2188  05dc 0f05          	clr	(OFST-2,sp)
2189  05de ac010501      	jpf	L167
2202                     	xdef	_atomQueuePut
2203                     	xdef	_atomQueueGet
2204                     	xdef	_atomQueueDelete
2205                     	xdef	_atomQueueCreate
2206                     	xref	_atomCurrentContext
2207                     	xref	_tcbDequeueEntry
2208                     	xref	_tcbDequeueHead
2209                     	xref	_tcbEnqueuePriority
2210                     	xref	_atomSched
2211                     	xref.b	_tcbReadyQ
2212                     	xref	_atomTimerCancel
2213                     	xref	_atomTimerRegister
2214                     	xref	_memcpy
2215                     	xref.b	c_lreg
2216                     	xref.b	c_x
2217                     	xref.b	c_y
2236                     	xref	c_lgadc
2237                     	xref	c_rtol
2238                     	xref	c_lmul
2239                     	xref	c_lgsbc
2240                     	xref	c_lgadd
2241                     	xref	c_lcmp
2242                     	xref	c_ltor
2243                     	xref	c_lzmp
2244                     	end
