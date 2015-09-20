   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 230                     ; 129 uint8_t atomSemCreate (ATOM_SEM *sem, uint8_t initial_count)
 230                     ; 130 {
 232                     	switch	.text
 233  0000               _atomSemCreate:
 235  0000 89            	pushw	x
 236  0001 88            	push	a
 237       00000001      OFST:	set	1
 240                     ; 134     if (sem == NULL)
 242  0002 a30000        	cpw	x,#0
 243  0005 2606          	jrne	L151
 244                     ; 137         status = ATOM_ERR_PARAM;
 246  0007 a6c9          	ld	a,#201
 247  0009 6b01          	ld	(OFST+0,sp),a
 249  000b 200d          	jra	L351
 250  000d               L151:
 251                     ; 142         sem->count = initial_count;
 253  000d 7b06          	ld	a,(OFST+5,sp)
 254  000f 1e02          	ldw	x,(OFST+1,sp)
 255  0011 e702          	ld	(2,x),a
 256                     ; 145         sem->suspQ = NULL;
 258  0013 1e02          	ldw	x,(OFST+1,sp)
 259  0015 905f          	clrw	y
 260  0017 ff            	ldw	(x),y
 261                     ; 148         status = ATOM_OK;
 263  0018 0f01          	clr	(OFST+0,sp)
 264  001a               L351:
 265                     ; 151     return (status);
 267  001a 7b01          	ld	a,(OFST+0,sp)
 270  001c 5b03          	addw	sp,#3
 271  001e 81            	ret
 354                     ; 175 uint8_t atomSemDelete (ATOM_SEM *sem)
 354                     ; 176 {
 355                     	switch	.text
 356  001f               _atomSemDelete:
 358  001f 89            	pushw	x
 359  0020 5205          	subw	sp,#5
 360       00000005      OFST:	set	5
 363                     ; 180     uint8_t woken_threads = FALSE;
 365  0022 0f01          	clr	(OFST-4,sp)
 366                     ; 183     if (sem == NULL)
 368  0024 a30000        	cpw	x,#0
 369  0027 2608          	jrne	L712
 370                     ; 186         status = ATOM_ERR_PARAM;
 372  0029 a6c9          	ld	a,#201
 373  002b 6b02          	ld	(OFST-3,sp),a
 375  002d acb100b1      	jpf	L122
 376  0031               L712:
 377                     ; 191         status = ATOM_OK;
 379  0031 0f02          	clr	(OFST-3,sp)
 380  0033               L322:
 381                     ; 197             CRITICAL_START ();
 383  0033 96            	ldw	x,sp
 384  0034 1c0003        	addw	x,#OFST-2
 386  0037 8a            push CC
 387  0038 84            pop a
 388  0039 f7            ld (X),A
 389  003a 9b            sim
 391                     ; 200             tcb_ptr = tcbDequeueHead (&sem->suspQ);
 393  003b 1e06          	ldw	x,(OFST+1,sp)
 394  003d cd0000        	call	_tcbDequeueHead
 396  0040 1f04          	ldw	(OFST-1,sp),x
 397                     ; 203             if (tcb_ptr)
 399  0042 1e04          	ldw	x,(OFST-1,sp)
 400  0044 2752          	jreq	L722
 401                     ; 206                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 403  0046 1e04          	ldw	x,(OFST-1,sp)
 404  0048 a6ca          	ld	a,#202
 405  004a e70e          	ld	(14,x),a
 406                     ; 209                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 408  004c 1e04          	ldw	x,(OFST-1,sp)
 409  004e 89            	pushw	x
 410  004f ae0000        	ldw	x,#_tcbReadyQ
 411  0052 cd0000        	call	_tcbEnqueuePriority
 413  0055 85            	popw	x
 414  0056 4d            	tnz	a
 415  0057 270d          	jreq	L132
 416                     ; 212                     CRITICAL_END ();
 418  0059 96            	ldw	x,sp
 419  005a 1c0003        	addw	x,#OFST-2
 421  005d f6            ld A,(X)
 422  005e 88            push A
 423  005f 86            pop CC
 425                     ; 215                     status = ATOM_ERR_QUEUE;
 427  0060 a6cc          	ld	a,#204
 428  0062 6b02          	ld	(OFST-3,sp),a
 429                     ; 216                     break;
 431  0064 2039          	jra	L522
 432  0066               L132:
 433                     ; 220                 if (tcb_ptr->suspend_timo_cb)
 435  0066 1e04          	ldw	x,(OFST-1,sp)
 436  0068 e610          	ld	a,(16,x)
 437  006a ea0f          	or	a,(15,x)
 438  006c 271d          	jreq	L332
 439                     ; 223                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 441  006e 1e04          	ldw	x,(OFST-1,sp)
 442  0070 ee0f          	ldw	x,(15,x)
 443  0072 cd0000        	call	_atomTimerCancel
 445  0075 4d            	tnz	a
 446  0076 270d          	jreq	L532
 447                     ; 226                         CRITICAL_END ();
 449  0078 96            	ldw	x,sp
 450  0079 1c0003        	addw	x,#OFST-2
 452  007c f6            ld A,(X)
 453  007d 88            push A
 454  007e 86            pop CC
 456                     ; 229                         status = ATOM_ERR_TIMER;
 458  007f a6cd          	ld	a,#205
 459  0081 6b02          	ld	(OFST-3,sp),a
 460                     ; 230                         break;
 462  0083 201a          	jra	L522
 463  0085               L532:
 464                     ; 234                     tcb_ptr->suspend_timo_cb = NULL;
 466  0085 1e04          	ldw	x,(OFST-1,sp)
 467  0087 905f          	clrw	y
 468  0089 ef0f          	ldw	(15,x),y
 469  008b               L332:
 470                     ; 239                 CRITICAL_END ();
 472  008b 96            	ldw	x,sp
 473  008c 1c0003        	addw	x,#OFST-2
 475  008f f6            ld A,(X)
 476  0090 88            push A
 477  0091 86            pop CC
 479                     ; 242                 woken_threads = TRUE;
 481  0092 a601          	ld	a,#1
 482  0094 6b01          	ld	(OFST-4,sp),a
 484  0096 209b          	jra	L322
 485  0098               L722:
 486                     ; 249                 CRITICAL_END ();
 488  0098 96            	ldw	x,sp
 489  0099 1c0003        	addw	x,#OFST-2
 491  009c f6            ld A,(X)
 492  009d 88            push A
 493  009e 86            pop CC
 495                     ; 250                 break;
 496  009f               L522:
 497                     ; 255         if (woken_threads == TRUE)
 499  009f 7b01          	ld	a,(OFST-4,sp)
 500  00a1 a101          	cp	a,#1
 501  00a3 260c          	jrne	L122
 502                     ; 261             if (atomCurrentContext())
 504  00a5 cd0000        	call	_atomCurrentContext
 506  00a8 a30000        	cpw	x,#0
 507  00ab 2704          	jreq	L122
 508                     ; 262                 atomSched (FALSE);
 510  00ad 4f            	clr	a
 511  00ae cd0000        	call	_atomSched
 513  00b1               L122:
 514                     ; 266     return (status);
 516  00b1 7b02          	ld	a,(OFST-3,sp)
 519  00b3 5b07          	addw	sp,#7
 520  00b5 81            	ret
 655                     ; 314 uint8_t atomSemGet (ATOM_SEM *sem, int32_t timeout)
 655                     ; 315 {
 656                     	switch	.text
 657  00b6               _atomSemGet:
 659  00b6 89            	pushw	x
 660  00b7 5212          	subw	sp,#18
 661       00000012      OFST:	set	18
 664                     ; 323     if (sem == NULL)
 666  00b9 a30000        	cpw	x,#0
 667  00bc 2608          	jrne	L733
 668                     ; 326         status = ATOM_ERR_PARAM;
 670  00be a6c9          	ld	a,#201
 671  00c0 6b10          	ld	(OFST-2,sp),a
 673  00c2 aca201a2      	jpf	L143
 674  00c6               L733:
 675                     ; 331         CRITICAL_START ();
 677  00c6 96            	ldw	x,sp
 678  00c7 1c000f        	addw	x,#OFST-3
 680  00ca 8a            push CC
 681  00cb 84            pop a
 682  00cc f7            ld (X),A
 683  00cd 9b            sim
 685                     ; 334         if (sem->count == 0)
 687  00ce 1e13          	ldw	x,(OFST+1,sp)
 688  00d0 6d02          	tnz	(2,x)
 689  00d2 2703          	jreq	L21
 690  00d4 cc0195        	jp	L343
 691  00d7               L21:
 692                     ; 337             if (timeout >= 0)
 694  00d7 9c            	rvf
 695  00d8 0d17          	tnz	(OFST+5,sp)
 696  00da 2e03          	jrsge	L41
 697  00dc cc0188        	jp	L543
 698  00df               L41:
 699                     ; 342                 curr_tcb_ptr = atomCurrentContext();
 701  00df cd0000        	call	_atomCurrentContext
 703  00e2 1f11          	ldw	(OFST-1,sp),x
 704                     ; 345                 if (curr_tcb_ptr)
 706  00e4 1e11          	ldw	x,(OFST-1,sp)
 707  00e6 2603          	jrne	L61
 708  00e8 cc017b        	jp	L743
 709  00eb               L61:
 710                     ; 348                     if (tcbEnqueuePriority (&sem->suspQ, curr_tcb_ptr) != ATOM_OK)
 712  00eb 1e11          	ldw	x,(OFST-1,sp)
 713  00ed 89            	pushw	x
 714  00ee 1e15          	ldw	x,(OFST+3,sp)
 715  00f0 cd0000        	call	_tcbEnqueuePriority
 717  00f3 85            	popw	x
 718  00f4 4d            	tnz	a
 719  00f5 270f          	jreq	L153
 720                     ; 351                         CRITICAL_END ();
 722  00f7 96            	ldw	x,sp
 723  00f8 1c000f        	addw	x,#OFST-3
 725  00fb f6            ld A,(X)
 726  00fc 88            push A
 727  00fd 86            pop CC
 729                     ; 354                         status = ATOM_ERR_QUEUE;
 731  00fe a6cc          	ld	a,#204
 732  0100 6b10          	ld	(OFST-2,sp),a
 734  0102 aca201a2      	jpf	L143
 735  0106               L153:
 736                     ; 359                         curr_tcb_ptr->suspended = TRUE;
 738  0106 1e11          	ldw	x,(OFST-1,sp)
 739  0108 a601          	ld	a,#1
 740  010a e70d          	ld	(13,x),a
 741                     ; 362                         status = ATOM_OK;
 743  010c 0f10          	clr	(OFST-2,sp)
 744                     ; 365                         if (timeout)
 746  010e 96            	ldw	x,sp
 747  010f 1c0017        	addw	x,#OFST+5
 748  0112 cd0000        	call	c_lzmp
 750  0115 2747          	jreq	L553
 751                     ; 368                             timer_data.tcb_ptr = curr_tcb_ptr;
 753  0117 1e11          	ldw	x,(OFST-1,sp)
 754  0119 1f01          	ldw	(OFST-17,sp),x
 755                     ; 369                             timer_data.sem_ptr = sem;
 757  011b 1e13          	ldw	x,(OFST+1,sp)
 758  011d 1f03          	ldw	(OFST-15,sp),x
 759                     ; 372                             timer_cb.cb_func = atomSemTimerCallback;
 761  011f ae025a        	ldw	x,#L3_atomSemTimerCallback
 762  0122 1f05          	ldw	(OFST-13,sp),x
 763                     ; 373                             timer_cb.cb_data = (POINTER)&timer_data;
 765  0124 96            	ldw	x,sp
 766  0125 1c0001        	addw	x,#OFST-17
 767  0128 1f07          	ldw	(OFST-11,sp),x
 768                     ; 374                             timer_cb.cb_ticks = timeout;
 770  012a 1e19          	ldw	x,(OFST+7,sp)
 771  012c 1f0b          	ldw	(OFST-7,sp),x
 772  012e 1e17          	ldw	x,(OFST+5,sp)
 773  0130 1f09          	ldw	(OFST-9,sp),x
 774                     ; 381                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 776  0132 96            	ldw	x,sp
 777  0133 1c0005        	addw	x,#OFST-13
 778  0136 1611          	ldw	y,(OFST-1,sp)
 779  0138 90ef0f        	ldw	(15,y),x
 780                     ; 384                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 782  013b 96            	ldw	x,sp
 783  013c 1c0005        	addw	x,#OFST-13
 784  013f cd0000        	call	_atomTimerRegister
 786  0142 4d            	tnz	a
 787  0143 271f          	jreq	L163
 788                     ; 387                                 status = ATOM_ERR_TIMER;
 790  0145 a6cd          	ld	a,#205
 791  0147 6b10          	ld	(OFST-2,sp),a
 792                     ; 390                                 (void)tcbDequeueEntry (&sem->suspQ, curr_tcb_ptr);
 794  0149 1e11          	ldw	x,(OFST-1,sp)
 795  014b 89            	pushw	x
 796  014c 1e15          	ldw	x,(OFST+3,sp)
 797  014e cd0000        	call	_tcbDequeueEntry
 799  0151 85            	popw	x
 800                     ; 391                                 curr_tcb_ptr->suspended = FALSE;
 802  0152 1e11          	ldw	x,(OFST-1,sp)
 803  0154 6f0d          	clr	(13,x)
 804                     ; 392                                 curr_tcb_ptr->suspend_timo_cb = NULL;
 806  0156 1e11          	ldw	x,(OFST-1,sp)
 807  0158 905f          	clrw	y
 808  015a ef0f          	ldw	(15,x),y
 809  015c 2006          	jra	L163
 810  015e               L553:
 811                     ; 400                             curr_tcb_ptr->suspend_timo_cb = NULL;
 813  015e 1e11          	ldw	x,(OFST-1,sp)
 814  0160 905f          	clrw	y
 815  0162 ef0f          	ldw	(15,x),y
 816  0164               L163:
 817                     ; 404                         CRITICAL_END ();
 819  0164 96            	ldw	x,sp
 820  0165 1c000f        	addw	x,#OFST-3
 822  0168 f6            ld A,(X)
 823  0169 88            push A
 824  016a 86            pop CC
 826                     ; 407                         if (status == ATOM_OK)
 828  016b 0d10          	tnz	(OFST-2,sp)
 829  016d 2633          	jrne	L143
 830                     ; 414                             atomSched (FALSE);
 832  016f 4f            	clr	a
 833  0170 cd0000        	call	_atomSched
 835                     ; 421                             status = curr_tcb_ptr->suspend_wake_status;
 837  0173 1e11          	ldw	x,(OFST-1,sp)
 838  0175 e60e          	ld	a,(14,x)
 839  0177 6b10          	ld	(OFST-2,sp),a
 840  0179 2027          	jra	L143
 841  017b               L743:
 842                     ; 446                     CRITICAL_END ();
 844  017b 96            	ldw	x,sp
 845  017c 1c000f        	addw	x,#OFST-3
 847  017f f6            ld A,(X)
 848  0180 88            push A
 849  0181 86            pop CC
 851                     ; 449                     status = ATOM_ERR_CONTEXT;
 853  0182 a6c8          	ld	a,#200
 854  0184 6b10          	ld	(OFST-2,sp),a
 855  0186 201a          	jra	L143
 856  0188               L543:
 857                     ; 455                 CRITICAL_END();
 859  0188 96            	ldw	x,sp
 860  0189 1c000f        	addw	x,#OFST-3
 862  018c f6            ld A,(X)
 863  018d 88            push A
 864  018e 86            pop CC
 866                     ; 456                 status = ATOM_WOULDBLOCK;
 868  018f a603          	ld	a,#3
 869  0191 6b10          	ld	(OFST-2,sp),a
 870  0193 200d          	jra	L143
 871  0195               L343:
 872                     ; 462             sem->count--;
 874  0195 1e13          	ldw	x,(OFST+1,sp)
 875  0197 6a02          	dec	(2,x)
 876                     ; 465             CRITICAL_END ();
 878  0199 96            	ldw	x,sp
 879  019a 1c000f        	addw	x,#OFST-3
 881  019d f6            ld A,(X)
 882  019e 88            push A
 883  019f 86            pop CC
 885                     ; 468             status = ATOM_OK;
 887  01a0 0f10          	clr	(OFST-2,sp)
 888  01a2               L143:
 889                     ; 472     return (status);
 891  01a2 7b10          	ld	a,(OFST-2,sp)
 894  01a4 5b14          	addw	sp,#20
 895  01a6 81            	ret
 969                     ; 498 uint8_t atomSemPut (ATOM_SEM * sem)
 969                     ; 499 {
 970                     	switch	.text
 971  01a7               _atomSemPut:
 973  01a7 89            	pushw	x
 974  01a8 5204          	subw	sp,#4
 975       00000004      OFST:	set	4
 978                     ; 505     if (sem == NULL)
 980  01aa a30000        	cpw	x,#0
 981  01ad 2608          	jrne	L134
 982                     ; 508         status = ATOM_ERR_PARAM;
 984  01af a6c9          	ld	a,#201
 985  01b1 6b04          	ld	(OFST+0,sp),a
 987  01b3 ac3b023b      	jpf	L334
 988  01b7               L134:
 989                     ; 513         CRITICAL_START ();
 991  01b7 96            	ldw	x,sp
 992  01b8 1c0001        	addw	x,#OFST-3
 994  01bb 8a            push CC
 995  01bc 84            pop a
 996  01bd f7            ld (X),A
 997  01be 9b            sim
 999                     ; 516         if (sem->suspQ)
1001  01bf 1e05          	ldw	x,(OFST+1,sp)
1002  01c1 e601          	ld	a,(1,x)
1003  01c3 fa            	or	a,(x)
1004  01c4 275a          	jreq	L534
1005                     ; 523             tcb_ptr = tcbDequeueHead (&sem->suspQ);
1007  01c6 1e05          	ldw	x,(OFST+1,sp)
1008  01c8 cd0000        	call	_tcbDequeueHead
1010  01cb 1f02          	ldw	(OFST-2,sp),x
1011                     ; 524             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1013  01cd 1e02          	ldw	x,(OFST-2,sp)
1014  01cf 89            	pushw	x
1015  01d0 ae0000        	ldw	x,#_tcbReadyQ
1016  01d3 cd0000        	call	_tcbEnqueuePriority
1018  01d6 85            	popw	x
1019  01d7 4d            	tnz	a
1020  01d8 270d          	jreq	L734
1021                     ; 527                 CRITICAL_END ();
1023  01da 96            	ldw	x,sp
1024  01db 1c0001        	addw	x,#OFST-3
1026  01de f6            ld A,(X)
1027  01df 88            push A
1028  01e0 86            pop CC
1030                     ; 530                 status = ATOM_ERR_QUEUE;
1032  01e1 a6cc          	ld	a,#204
1033  01e3 6b04          	ld	(OFST+0,sp),a
1035  01e5 2054          	jra	L334
1036  01e7               L734:
1037                     ; 535                 tcb_ptr->suspend_wake_status = ATOM_OK;
1039  01e7 1e02          	ldw	x,(OFST-2,sp)
1040  01e9 6f0e          	clr	(14,x)
1041                     ; 538                 if ((tcb_ptr->suspend_timo_cb != NULL)
1041                     ; 539                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1043  01eb 1e02          	ldw	x,(OFST-2,sp)
1044  01ed e610          	ld	a,(16,x)
1045  01ef ea0f          	or	a,(15,x)
1046  01f1 2710          	jreq	L344
1048  01f3 1e02          	ldw	x,(OFST-2,sp)
1049  01f5 ee0f          	ldw	x,(15,x)
1050  01f7 cd0000        	call	_atomTimerCancel
1052  01fa 4d            	tnz	a
1053  01fb 2706          	jreq	L344
1054                     ; 542                     status = ATOM_ERR_TIMER;
1056  01fd a6cd          	ld	a,#205
1057  01ff 6b04          	ld	(OFST+0,sp),a
1059  0201 2008          	jra	L544
1060  0203               L344:
1061                     ; 547                     tcb_ptr->suspend_timo_cb = NULL;
1063  0203 1e02          	ldw	x,(OFST-2,sp)
1064  0205 905f          	clrw	y
1065  0207 ef0f          	ldw	(15,x),y
1066                     ; 550                     status = ATOM_OK;
1068  0209 0f04          	clr	(OFST+0,sp)
1069  020b               L544:
1070                     ; 554                 CRITICAL_END ();
1072  020b 96            	ldw	x,sp
1073  020c 1c0001        	addw	x,#OFST-3
1075  020f f6            ld A,(X)
1076  0210 88            push A
1077  0211 86            pop CC
1079                     ; 561                 if (atomCurrentContext())
1081  0212 cd0000        	call	_atomCurrentContext
1083  0215 a30000        	cpw	x,#0
1084  0218 2721          	jreq	L334
1085                     ; 562                     atomSched (FALSE);
1087  021a 4f            	clr	a
1088  021b cd0000        	call	_atomSched
1090  021e 201b          	jra	L334
1091  0220               L534:
1092                     ; 570             if (sem->count == 255)
1094  0220 1e05          	ldw	x,(OFST+1,sp)
1095  0222 e602          	ld	a,(2,x)
1096  0224 a1ff          	cp	a,#255
1097  0226 2606          	jrne	L354
1098                     ; 573                 status = ATOM_ERR_OVF;
1100  0228 a6cb          	ld	a,#203
1101  022a 6b04          	ld	(OFST+0,sp),a
1103  022c 2006          	jra	L554
1104  022e               L354:
1105                     ; 578                 sem->count++;
1107  022e 1e05          	ldw	x,(OFST+1,sp)
1108  0230 6c02          	inc	(2,x)
1109                     ; 579                 status = ATOM_OK;
1111  0232 0f04          	clr	(OFST+0,sp)
1112  0234               L554:
1113                     ; 583             CRITICAL_END ();
1115  0234 96            	ldw	x,sp
1116  0235 1c0001        	addw	x,#OFST-3
1118  0238 f6            ld A,(X)
1119  0239 88            push A
1120  023a 86            pop CC
1122  023b               L334:
1123                     ; 587     return (status);
1125  023b 7b04          	ld	a,(OFST+0,sp)
1128  023d 5b06          	addw	sp,#6
1129  023f 81            	ret
1184                     ; 608 uint8_t atomSemResetCount (ATOM_SEM *sem, uint8_t count)
1184                     ; 609 {
1185                     	switch	.text
1186  0240               _atomSemResetCount:
1188  0240 89            	pushw	x
1189  0241 88            	push	a
1190       00000001      OFST:	set	1
1193                     ; 613     if (sem == NULL)
1195  0242 a30000        	cpw	x,#0
1196  0245 2606          	jrne	L705
1197                     ; 616         status = ATOM_ERR_PARAM;
1199  0247 a6c9          	ld	a,#201
1200  0249 6b01          	ld	(OFST+0,sp),a
1202  024b 2008          	jra	L115
1203  024d               L705:
1204                     ; 621         sem->count = count;
1206  024d 7b06          	ld	a,(OFST+5,sp)
1207  024f 1e02          	ldw	x,(OFST+1,sp)
1208  0251 e702          	ld	(2,x),a
1209                     ; 624         status = ATOM_OK;
1211  0253 0f01          	clr	(OFST+0,sp)
1212  0255               L115:
1213                     ; 627     return (status);
1215  0255 7b01          	ld	a,(OFST+0,sp)
1218  0257 5b03          	addw	sp,#3
1219  0259 81            	ret
1279                     ; 644 static void atomSemTimerCallback (POINTER cb_data)
1279                     ; 645 {
1280                     	switch	.text
1281  025a               L3_atomSemTimerCallback:
1283  025a 5203          	subw	sp,#3
1284       00000003      OFST:	set	3
1287                     ; 650     timer_data_ptr = (SEM_TIMER *)cb_data;
1289  025c 1f02          	ldw	(OFST-1,sp),x
1290                     ; 653     if (timer_data_ptr)
1292  025e 1e02          	ldw	x,(OFST-1,sp)
1293  0260 2734          	jreq	L345
1294                     ; 656         CRITICAL_START ();
1296  0262 96            	ldw	x,sp
1297  0263 1c0001        	addw	x,#OFST-2
1299  0266 8a            push CC
1300  0267 84            pop a
1301  0268 f7            ld (X),A
1302  0269 9b            sim
1304                     ; 659         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1306  026a 1e02          	ldw	x,(OFST-1,sp)
1307  026c fe            	ldw	x,(x)
1308  026d a602          	ld	a,#2
1309  026f e70e          	ld	(14,x),a
1310                     ; 662         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1312  0271 1e02          	ldw	x,(OFST-1,sp)
1313  0273 fe            	ldw	x,(x)
1314  0274 905f          	clrw	y
1315  0276 ef0f          	ldw	(15,x),y
1316                     ; 665         (void)tcbDequeueEntry (&timer_data_ptr->sem_ptr->suspQ, timer_data_ptr->tcb_ptr);
1318  0278 1e02          	ldw	x,(OFST-1,sp)
1319  027a fe            	ldw	x,(x)
1320  027b 89            	pushw	x
1321  027c 1e04          	ldw	x,(OFST+1,sp)
1322  027e ee02          	ldw	x,(2,x)
1323  0280 cd0000        	call	_tcbDequeueEntry
1325  0283 85            	popw	x
1326                     ; 668         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1328  0284 1e02          	ldw	x,(OFST-1,sp)
1329  0286 fe            	ldw	x,(x)
1330  0287 89            	pushw	x
1331  0288 ae0000        	ldw	x,#_tcbReadyQ
1332  028b cd0000        	call	_tcbEnqueuePriority
1334  028e 85            	popw	x
1335                     ; 671         CRITICAL_END ();
1337  028f 96            	ldw	x,sp
1338  0290 1c0001        	addw	x,#OFST-2
1340  0293 f6            ld A,(X)
1341  0294 88            push A
1342  0295 86            pop CC
1344  0296               L345:
1345                     ; 678 }
1348  0296 5b03          	addw	sp,#3
1349  0298 81            	ret
1362                     	xdef	_atomSemResetCount
1363                     	xdef	_atomSemPut
1364                     	xdef	_atomSemGet
1365                     	xdef	_atomSemDelete
1366                     	xdef	_atomSemCreate
1367                     	xref	_atomCurrentContext
1368                     	xref	_tcbDequeueEntry
1369                     	xref	_tcbDequeueHead
1370                     	xref	_tcbEnqueuePriority
1371                     	xref	_atomSched
1372                     	xref.b	_tcbReadyQ
1373                     	xref	_atomTimerCancel
1374                     	xref	_atomTimerRegister
1393                     	xref	c_lzmp
1394                     	end
