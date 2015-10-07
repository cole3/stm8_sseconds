   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 233                     ; 143 uint8_t atomMutexCreate (ATOM_MUTEX *mutex)
 233                     ; 144 {
 235                     	switch	.text
 236  0000               _atomMutexCreate:
 238  0000 89            	pushw	x
 239  0001 88            	push	a
 240       00000001      OFST:	set	1
 243                     ; 148     if (mutex == NULL) {
 245  0002 a30000        	cpw	x,#0
 246  0005 2606          	jrne	L351
 247                     ; 150         status = ATOM_ERR_PARAM;
 249  0007 a6c9          	ld	a,#201
 250  0009 6b01          	ld	(OFST+0,sp),a
 252  000b 2011          	jra	L551
 253  000d               L351:
 254                     ; 153         mutex->owner = NULL;
 256  000d 1e02          	ldw	x,(OFST+1,sp)
 257  000f 905f          	clrw	y
 258  0011 ef02          	ldw	(2,x),y
 259                     ; 156         mutex->count = 0;
 261  0013 1e02          	ldw	x,(OFST+1,sp)
 262  0015 6f04          	clr	(4,x)
 263                     ; 159         mutex->suspQ = NULL;
 265  0017 1e02          	ldw	x,(OFST+1,sp)
 266  0019 905f          	clrw	y
 267  001b ff            	ldw	(x),y
 268                     ; 162         status = ATOM_OK;
 270  001c 0f01          	clr	(OFST+0,sp)
 271  001e               L551:
 272                     ; 165     return (status);
 274  001e 7b01          	ld	a,(OFST+0,sp)
 277  0020 5b03          	addw	sp,#3
 278  0022 81            	ret
 361                     ; 189 uint8_t atomMutexDelete (ATOM_MUTEX *mutex)
 361                     ; 190 {
 362                     	switch	.text
 363  0023               _atomMutexDelete:
 365  0023 89            	pushw	x
 366  0024 5205          	subw	sp,#5
 367       00000005      OFST:	set	5
 370                     ; 194     uint8_t woken_threads = FALSE;
 372  0026 0f01          	clr	(OFST-4,sp)
 373                     ; 197     if (mutex == NULL) {
 375  0028 a30000        	cpw	x,#0
 376  002b 2608          	jrne	L122
 377                     ; 199         status = ATOM_ERR_PARAM;
 379  002d a6c9          	ld	a,#201
 380  002f 6b02          	ld	(OFST-3,sp),a
 382  0031 acb500b5      	jpf	L322
 383  0035               L122:
 384                     ; 202         status = ATOM_OK;
 386  0035 0f02          	clr	(OFST-3,sp)
 387  0037               L522:
 388                     ; 207             CRITICAL_START ();
 390  0037 96            	ldw	x,sp
 391  0038 1c0003        	addw	x,#OFST-2
 393  003b 8a            push CC
 394  003c 84            pop a
 395  003d f7            ld (X),A
 396  003e 9b            sim
 398                     ; 210             tcb_ptr = tcbDequeueHead (&mutex->suspQ);
 400  003f 1e06          	ldw	x,(OFST+1,sp)
 401  0041 cd0000        	call	_tcbDequeueHead
 403  0044 1f04          	ldw	(OFST-1,sp),x
 404                     ; 213             if (tcb_ptr) {
 406  0046 1e04          	ldw	x,(OFST-1,sp)
 407  0048 2752          	jreq	L132
 408                     ; 215                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 410  004a 1e04          	ldw	x,(OFST-1,sp)
 411  004c a6ca          	ld	a,#202
 412  004e e70e          	ld	(14,x),a
 413                     ; 218                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK) {
 415  0050 1e04          	ldw	x,(OFST-1,sp)
 416  0052 89            	pushw	x
 417  0053 ae0000        	ldw	x,#_tcbReadyQ
 418  0056 cd0000        	call	_tcbEnqueuePriority
 420  0059 85            	popw	x
 421  005a 4d            	tnz	a
 422  005b 270d          	jreq	L332
 423                     ; 220                     CRITICAL_END ();
 425  005d 96            	ldw	x,sp
 426  005e 1c0003        	addw	x,#OFST-2
 428  0061 f6            ld A,(X)
 429  0062 88            push A
 430  0063 86            pop CC
 432                     ; 223                     status = ATOM_ERR_QUEUE;
 434  0064 a6cc          	ld	a,#204
 435  0066 6b02          	ld	(OFST-3,sp),a
 436                     ; 224                     break;
 438  0068 2039          	jra	L722
 439  006a               L332:
 440                     ; 228                 if (tcb_ptr->suspend_timo_cb) {
 442  006a 1e04          	ldw	x,(OFST-1,sp)
 443  006c e610          	ld	a,(16,x)
 444  006e ea0f          	or	a,(15,x)
 445  0070 271d          	jreq	L532
 446                     ; 230                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK) {
 448  0072 1e04          	ldw	x,(OFST-1,sp)
 449  0074 ee0f          	ldw	x,(15,x)
 450  0076 cd0000        	call	_atomTimerCancel
 452  0079 4d            	tnz	a
 453  007a 270d          	jreq	L732
 454                     ; 232                         CRITICAL_END ();
 456  007c 96            	ldw	x,sp
 457  007d 1c0003        	addw	x,#OFST-2
 459  0080 f6            ld A,(X)
 460  0081 88            push A
 461  0082 86            pop CC
 463                     ; 235                         status = ATOM_ERR_TIMER;
 465  0083 a6cd          	ld	a,#205
 466  0085 6b02          	ld	(OFST-3,sp),a
 467                     ; 236                         break;
 469  0087 201a          	jra	L722
 470  0089               L732:
 471                     ; 240                     tcb_ptr->suspend_timo_cb = NULL;
 473  0089 1e04          	ldw	x,(OFST-1,sp)
 474  008b 905f          	clrw	y
 475  008d ef0f          	ldw	(15,x),y
 476  008f               L532:
 477                     ; 245                 CRITICAL_END ();
 479  008f 96            	ldw	x,sp
 480  0090 1c0003        	addw	x,#OFST-2
 482  0093 f6            ld A,(X)
 483  0094 88            push A
 484  0095 86            pop CC
 486                     ; 248                 woken_threads = TRUE;
 488  0096 a601          	ld	a,#1
 489  0098 6b01          	ld	(OFST-4,sp),a
 491  009a 209b          	jra	L522
 492  009c               L132:
 493                     ; 254                 CRITICAL_END ();
 495  009c 96            	ldw	x,sp
 496  009d 1c0003        	addw	x,#OFST-2
 498  00a0 f6            ld A,(X)
 499  00a1 88            push A
 500  00a2 86            pop CC
 502                     ; 255                 break;
 503  00a3               L722:
 504                     ; 260         if (woken_threads == TRUE) {
 506  00a3 7b01          	ld	a,(OFST-4,sp)
 507  00a5 a101          	cp	a,#1
 508  00a7 260c          	jrne	L322
 509                     ; 265             if (atomCurrentContext())
 511  00a9 cd0000        	call	_atomCurrentContext
 513  00ac a30000        	cpw	x,#0
 514  00af 2704          	jreq	L322
 515                     ; 266                 atomSched (FALSE);
 517  00b1 4f            	clr	a
 518  00b2 cd0000        	call	_atomSched
 520  00b5               L322:
 521                     ; 270     return (status);
 523  00b5 7b02          	ld	a,(OFST-3,sp)
 526  00b7 5b07          	addw	sp,#7
 527  00b9 81            	ret
 662                     ; 326 uint8_t atomMutexGet (ATOM_MUTEX *mutex, int32_t timeout)
 662                     ; 327 {
 663                     	switch	.text
 664  00ba               _atomMutexGet:
 666  00ba 89            	pushw	x
 667  00bb 5212          	subw	sp,#18
 668       00000012      OFST:	set	18
 671                     ; 335     if (mutex == NULL) {
 673  00bd a30000        	cpw	x,#0
 674  00c0 2608          	jrne	L143
 675                     ; 337         status = ATOM_ERR_PARAM;
 677  00c2 a6c9          	ld	a,#201
 678  00c4 6b10          	ld	(OFST-2,sp),a
 680  00c6 acda01da      	jpf	L343
 681  00ca               L143:
 682                     ; 340         curr_tcb_ptr = atomCurrentContext();
 684  00ca cd0000        	call	_atomCurrentContext
 686  00cd 1f11          	ldw	(OFST-1,sp),x
 687                     ; 343         CRITICAL_START ();
 689  00cf 96            	ldw	x,sp
 690  00d0 1c000f        	addw	x,#OFST-3
 692  00d3 8a            push CC
 693  00d4 84            pop a
 694  00d5 f7            ld (X),A
 695  00d6 9b            sim
 697                     ; 350         if (curr_tcb_ptr == NULL) {
 699  00d7 1e11          	ldw	x,(OFST-1,sp)
 700  00d9 260f          	jrne	L543
 701                     ; 352             CRITICAL_END ();
 703  00db 96            	ldw	x,sp
 704  00dc 1c000f        	addw	x,#OFST-3
 706  00df f6            ld A,(X)
 707  00e0 88            push A
 708  00e1 86            pop CC
 710                     ; 355             status = ATOM_ERR_CONTEXT;
 712  00e2 a6c8          	ld	a,#200
 713  00e4 6b10          	ld	(OFST-2,sp),a
 715  00e6 acda01da      	jpf	L343
 716  00ea               L543:
 717                     ; 359         else if ((mutex->owner != NULL) && (mutex->owner != curr_tcb_ptr)) {
 719  00ea 1e13          	ldw	x,(OFST+1,sp)
 720  00ec e603          	ld	a,(3,x)
 721  00ee ea02          	or	a,(2,x)
 722  00f0 2603          	jrne	L21
 723  00f2 cc01b1        	jp	L153
 724  00f5               L21:
 726  00f5 1e13          	ldw	x,(OFST+1,sp)
 727  00f7 9093          	ldw	y,x
 728  00f9 51            	exgw	x,y
 729  00fa ee02          	ldw	x,(2,x)
 730  00fc 1311          	cpw	x,(OFST-1,sp)
 731  00fe 51            	exgw	x,y
 732  00ff 2603          	jrne	L41
 733  0101 cc01b1        	jp	L153
 734  0104               L41:
 735                     ; 361             if (timeout >= 0) {
 737  0104 9c            	rvf
 738  0105 0d17          	tnz	(OFST+5,sp)
 739  0107 2e03          	jrsge	L61
 740  0109 cc01a4        	jp	L353
 741  010c               L61:
 742                     ; 363                 if (tcbEnqueuePriority (&mutex->suspQ, curr_tcb_ptr) != ATOM_OK) {
 744  010c 1e11          	ldw	x,(OFST-1,sp)
 745  010e 89            	pushw	x
 746  010f 1e15          	ldw	x,(OFST+3,sp)
 747  0111 cd0000        	call	_tcbEnqueuePriority
 749  0114 85            	popw	x
 750  0115 4d            	tnz	a
 751  0116 270f          	jreq	L553
 752                     ; 365                     CRITICAL_END ();
 754  0118 96            	ldw	x,sp
 755  0119 1c000f        	addw	x,#OFST-3
 757  011c f6            ld A,(X)
 758  011d 88            push A
 759  011e 86            pop CC
 761                     ; 368                     status = ATOM_ERR_QUEUE;
 763  011f a6cc          	ld	a,#204
 764  0121 6b10          	ld	(OFST-2,sp),a
 766  0123 acda01da      	jpf	L343
 767  0127               L553:
 768                     ; 371                     curr_tcb_ptr->suspended = TRUE;
 770  0127 1e11          	ldw	x,(OFST-1,sp)
 771  0129 a601          	ld	a,#1
 772  012b e70d          	ld	(13,x),a
 773                     ; 374                     status = ATOM_OK;
 775  012d 0f10          	clr	(OFST-2,sp)
 776                     ; 377                     if (timeout) {
 778  012f 96            	ldw	x,sp
 779  0130 1c0017        	addw	x,#OFST+5
 780  0133 cd0000        	call	c_lzmp
 782  0136 2747          	jreq	L163
 783                     ; 379                         timer_data.tcb_ptr = curr_tcb_ptr;
 785  0138 1e11          	ldw	x,(OFST-1,sp)
 786  013a 1f01          	ldw	(OFST-17,sp),x
 787                     ; 380                         timer_data.mutex_ptr = mutex;
 789  013c 1e13          	ldw	x,(OFST+1,sp)
 790  013e 1f03          	ldw	(OFST-15,sp),x
 791                     ; 383                         timer_cb.cb_func = atomMutexTimerCallback;
 793  0140 ae02a1        	ldw	x,#L3_atomMutexTimerCallback
 794  0143 1f05          	ldw	(OFST-13,sp),x
 795                     ; 384                         timer_cb.cb_data = (POINTER)&timer_data;
 797  0145 96            	ldw	x,sp
 798  0146 1c0001        	addw	x,#OFST-17
 799  0149 1f07          	ldw	(OFST-11,sp),x
 800                     ; 385                         timer_cb.cb_ticks = timeout;
 802  014b 1e19          	ldw	x,(OFST+7,sp)
 803  014d 1f0b          	ldw	(OFST-7,sp),x
 804  014f 1e17          	ldw	x,(OFST+5,sp)
 805  0151 1f09          	ldw	(OFST-9,sp),x
 806                     ; 392                         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 808  0153 96            	ldw	x,sp
 809  0154 1c0005        	addw	x,#OFST-13
 810  0157 1611          	ldw	y,(OFST-1,sp)
 811  0159 90ef0f        	ldw	(15,y),x
 812                     ; 395                         if (atomTimerRegister (&timer_cb) != ATOM_OK) {
 814  015c 96            	ldw	x,sp
 815  015d 1c0005        	addw	x,#OFST-13
 816  0160 cd0000        	call	_atomTimerRegister
 818  0163 4d            	tnz	a
 819  0164 271f          	jreq	L563
 820                     ; 397                             status = ATOM_ERR_TIMER;
 822  0166 a6cd          	ld	a,#205
 823  0168 6b10          	ld	(OFST-2,sp),a
 824                     ; 400                             (void)tcbDequeueEntry (&mutex->suspQ, curr_tcb_ptr);
 826  016a 1e11          	ldw	x,(OFST-1,sp)
 827  016c 89            	pushw	x
 828  016d 1e15          	ldw	x,(OFST+3,sp)
 829  016f cd0000        	call	_tcbDequeueEntry
 831  0172 85            	popw	x
 832                     ; 401                             curr_tcb_ptr->suspended = FALSE;
 834  0173 1e11          	ldw	x,(OFST-1,sp)
 835  0175 6f0d          	clr	(13,x)
 836                     ; 402                             curr_tcb_ptr->suspend_timo_cb = NULL;
 838  0177 1e11          	ldw	x,(OFST-1,sp)
 839  0179 905f          	clrw	y
 840  017b ef0f          	ldw	(15,x),y
 841  017d 2006          	jra	L563
 842  017f               L163:
 843                     ; 409                         curr_tcb_ptr->suspend_timo_cb = NULL;
 845  017f 1e11          	ldw	x,(OFST-1,sp)
 846  0181 905f          	clrw	y
 847  0183 ef0f          	ldw	(15,x),y
 848  0185               L563:
 849                     ; 413                     CRITICAL_END ();
 851  0185 96            	ldw	x,sp
 852  0186 1c000f        	addw	x,#OFST-3
 854  0189 f6            ld A,(X)
 855  018a 88            push A
 856  018b 86            pop CC
 858                     ; 416                     if (status == ATOM_OK) {
 860  018c 0d10          	tnz	(OFST-2,sp)
 861  018e 264a          	jrne	L343
 862                     ; 422                         atomSched (FALSE);
 864  0190 4f            	clr	a
 865  0191 cd0000        	call	_atomSched
 867                     ; 428                         status = curr_tcb_ptr->suspend_wake_status;
 869  0194 1e11          	ldw	x,(OFST-1,sp)
 870  0196 e60e          	ld	a,(14,x)
 871  0198 6b10          	ld	(OFST-2,sp),a
 872                     ; 440                         if (status == ATOM_OK) {
 874  019a 0d10          	tnz	(OFST-2,sp)
 875  019c 263c          	jrne	L343
 876                     ; 446                             mutex->count++;
 878  019e 1e13          	ldw	x,(OFST+1,sp)
 879  01a0 6c04          	inc	(4,x)
 880  01a2 2036          	jra	L343
 881  01a4               L353:
 882                     ; 452                 CRITICAL_END();
 884  01a4 96            	ldw	x,sp
 885  01a5 1c000f        	addw	x,#OFST-3
 887  01a8 f6            ld A,(X)
 888  01a9 88            push A
 889  01aa 86            pop CC
 891                     ; 453                 status = ATOM_WOULDBLOCK;
 893  01ab a603          	ld	a,#3
 894  01ad 6b10          	ld	(OFST-2,sp),a
 895  01af 2029          	jra	L343
 896  01b1               L153:
 897                     ; 459             if (mutex->count == 255) {
 899  01b1 1e13          	ldw	x,(OFST+1,sp)
 900  01b3 e604          	ld	a,(4,x)
 901  01b5 a1ff          	cp	a,#255
 902  01b7 2606          	jrne	L773
 903                     ; 461                 status = ATOM_ERR_OVF;
 905  01b9 a6cb          	ld	a,#203
 906  01bb 6b10          	ld	(OFST-2,sp),a
 908  01bd 2014          	jra	L104
 909  01bf               L773:
 910                     ; 464                 mutex->count++;
 912  01bf 1e13          	ldw	x,(OFST+1,sp)
 913  01c1 6c04          	inc	(4,x)
 914                     ; 467                 if (mutex->owner == NULL) {
 916  01c3 1e13          	ldw	x,(OFST+1,sp)
 917  01c5 e603          	ld	a,(3,x)
 918  01c7 ea02          	or	a,(2,x)
 919  01c9 2606          	jrne	L304
 920                     ; 468                     mutex->owner = curr_tcb_ptr;
 922  01cb 1e13          	ldw	x,(OFST+1,sp)
 923  01cd 1611          	ldw	y,(OFST-1,sp)
 924  01cf ef02          	ldw	(2,x),y
 925  01d1               L304:
 926                     ; 472                 status = ATOM_OK;
 928  01d1 0f10          	clr	(OFST-2,sp)
 929  01d3               L104:
 930                     ; 476             CRITICAL_END ();
 932  01d3 96            	ldw	x,sp
 933  01d4 1c000f        	addw	x,#OFST-3
 935  01d7 f6            ld A,(X)
 936  01d8 88            push A
 937  01d9 86            pop CC
 939  01da               L343:
 940                     ; 480     return (status);
 942  01da 7b10          	ld	a,(OFST-2,sp)
 945  01dc 5b14          	addw	sp,#20
 946  01de 81            	ret
1032                     ; 510 uint8_t atomMutexPut (ATOM_MUTEX * mutex)
1032                     ; 511 {
1033                     	switch	.text
1034  01df               _atomMutexPut:
1036  01df 89            	pushw	x
1037  01e0 5204          	subw	sp,#4
1038       00000004      OFST:	set	4
1041                     ; 517     if (mutex == NULL) {
1043  01e2 a30000        	cpw	x,#0
1044  01e5 2608          	jrne	L154
1045                     ; 519         status = ATOM_ERR_PARAM;
1047  01e7 a6c9          	ld	a,#201
1048  01e9 6b02          	ld	(OFST-2,sp),a
1050  01eb ac9c029c      	jpf	L354
1051  01ef               L154:
1052                     ; 522         curr_tcb_ptr = atomCurrentContext();
1054  01ef cd0000        	call	_atomCurrentContext
1056  01f2 1f03          	ldw	(OFST-1,sp),x
1057                     ; 525         CRITICAL_START ();
1059  01f4 96            	ldw	x,sp
1060  01f5 1c0001        	addw	x,#OFST-3
1062  01f8 8a            push CC
1063  01f9 84            pop a
1064  01fa f7            ld (X),A
1065  01fb 9b            sim
1067                     ; 528         if (mutex->owner != curr_tcb_ptr) {
1069  01fc 1e05          	ldw	x,(OFST+1,sp)
1070  01fe 9093          	ldw	y,x
1071  0200 51            	exgw	x,y
1072  0201 ee02          	ldw	x,(2,x)
1073  0203 1303          	cpw	x,(OFST-1,sp)
1074  0205 51            	exgw	x,y
1075  0206 270f          	jreq	L554
1076                     ; 530             CRITICAL_END ();
1078  0208 96            	ldw	x,sp
1079  0209 1c0001        	addw	x,#OFST-3
1081  020c f6            ld A,(X)
1082  020d 88            push A
1083  020e 86            pop CC
1085                     ; 533             status = ATOM_ERR_OWNERSHIP;
1087  020f a6cf          	ld	a,#207
1088  0211 6b02          	ld	(OFST-2,sp),a
1090  0213 ac9c029c      	jpf	L354
1091  0217               L554:
1092                     ; 536             mutex->count--;
1094  0217 1e05          	ldw	x,(OFST+1,sp)
1095  0219 6a04          	dec	(4,x)
1096                     ; 539             if (mutex->count == 0) {
1098  021b 1e05          	ldw	x,(OFST+1,sp)
1099  021d 6d04          	tnz	(4,x)
1100  021f 2702          	jreq	L22
1101  0221 2070          	jp	L164
1102  0223               L22:
1103                     ; 541                 mutex->owner = NULL;
1105  0223 1e05          	ldw	x,(OFST+1,sp)
1106  0225 905f          	clrw	y
1107  0227 ef02          	ldw	(2,x),y
1108                     ; 544                 if (mutex->suspQ) {
1110  0229 1e05          	ldw	x,(OFST+1,sp)
1111  022b e601          	ld	a,(1,x)
1112  022d fa            	or	a,(x)
1113  022e 2758          	jreq	L364
1114                     ; 550                     tcb_ptr = tcbDequeueHead (&mutex->suspQ);
1116  0230 1e05          	ldw	x,(OFST+1,sp)
1117  0232 cd0000        	call	_tcbDequeueHead
1119  0235 1f03          	ldw	(OFST-1,sp),x
1120                     ; 551                     if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK) {
1122  0237 1e03          	ldw	x,(OFST-1,sp)
1123  0239 89            	pushw	x
1124  023a ae0000        	ldw	x,#_tcbReadyQ
1125  023d cd0000        	call	_tcbEnqueuePriority
1127  0240 85            	popw	x
1128  0241 4d            	tnz	a
1129  0242 270d          	jreq	L564
1130                     ; 553                         CRITICAL_END ();
1132  0244 96            	ldw	x,sp
1133  0245 1c0001        	addw	x,#OFST-3
1135  0248 f6            ld A,(X)
1136  0249 88            push A
1137  024a 86            pop CC
1139                     ; 556                         status = ATOM_ERR_QUEUE;
1141  024b a6cc          	ld	a,#204
1142  024d 6b02          	ld	(OFST-2,sp),a
1144  024f 204b          	jra	L354
1145  0251               L564:
1146                     ; 559                         tcb_ptr->suspend_wake_status = ATOM_OK;
1148  0251 1e03          	ldw	x,(OFST-1,sp)
1149  0253 6f0e          	clr	(14,x)
1150                     ; 562                         mutex->owner = tcb_ptr;
1152  0255 1e05          	ldw	x,(OFST+1,sp)
1153  0257 1603          	ldw	y,(OFST-1,sp)
1154  0259 ef02          	ldw	(2,x),y
1155                     ; 565                         if ((tcb_ptr->suspend_timo_cb != NULL)
1155                     ; 566                             && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)) {
1157  025b 1e03          	ldw	x,(OFST-1,sp)
1158  025d e610          	ld	a,(16,x)
1159  025f ea0f          	or	a,(15,x)
1160  0261 2710          	jreq	L174
1162  0263 1e03          	ldw	x,(OFST-1,sp)
1163  0265 ee0f          	ldw	x,(15,x)
1164  0267 cd0000        	call	_atomTimerCancel
1166  026a 4d            	tnz	a
1167  026b 2706          	jreq	L174
1168                     ; 568                             status = ATOM_ERR_TIMER;
1170  026d a6cd          	ld	a,#205
1171  026f 6b02          	ld	(OFST-2,sp),a
1173  0271 2008          	jra	L374
1174  0273               L174:
1175                     ; 571                             tcb_ptr->suspend_timo_cb = NULL;
1177  0273 1e03          	ldw	x,(OFST-1,sp)
1178  0275 905f          	clrw	y
1179  0277 ef0f          	ldw	(15,x),y
1180                     ; 574                             status = ATOM_OK;
1182  0279 0f02          	clr	(OFST-2,sp)
1183  027b               L374:
1184                     ; 578                         CRITICAL_END ();
1186  027b 96            	ldw	x,sp
1187  027c 1c0001        	addw	x,#OFST-3
1189  027f f6            ld A,(X)
1190  0280 88            push A
1191  0281 86            pop CC
1193                     ; 585                         atomSched (FALSE);
1195  0282 4f            	clr	a
1196  0283 cd0000        	call	_atomSched
1198  0286 2014          	jra	L354
1199  0288               L364:
1200                     ; 594                     CRITICAL_END ();
1202  0288 96            	ldw	x,sp
1203  0289 1c0001        	addw	x,#OFST-3
1205  028c f6            ld A,(X)
1206  028d 88            push A
1207  028e 86            pop CC
1209                     ; 597                     status = ATOM_OK;
1211  028f 0f02          	clr	(OFST-2,sp)
1212  0291 2009          	jra	L354
1213  0293               L164:
1214                     ; 606                 CRITICAL_END ();
1216  0293 96            	ldw	x,sp
1217  0294 1c0001        	addw	x,#OFST-3
1219  0297 f6            ld A,(X)
1220  0298 88            push A
1221  0299 86            pop CC
1223                     ; 609                 status = ATOM_OK;
1225  029a 0f02          	clr	(OFST-2,sp)
1226  029c               L354:
1227                     ; 614     return (status);
1229  029c 7b02          	ld	a,(OFST-2,sp)
1232  029e 5b06          	addw	sp,#6
1233  02a0 81            	ret
1293                     ; 630 static void atomMutexTimerCallback (POINTER cb_data)
1293                     ; 631 {
1294                     	switch	.text
1295  02a1               L3_atomMutexTimerCallback:
1297  02a1 5203          	subw	sp,#3
1298       00000003      OFST:	set	3
1301                     ; 636     timer_data_ptr = (MUTEX_TIMER *)cb_data;
1303  02a3 1f02          	ldw	(OFST-1,sp),x
1304                     ; 639     if (timer_data_ptr) {
1306  02a5 1e02          	ldw	x,(OFST-1,sp)
1307  02a7 2734          	jreq	L135
1308                     ; 641         CRITICAL_START ();
1310  02a9 96            	ldw	x,sp
1311  02aa 1c0001        	addw	x,#OFST-2
1313  02ad 8a            push CC
1314  02ae 84            pop a
1315  02af f7            ld (X),A
1316  02b0 9b            sim
1318                     ; 644         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1320  02b1 1e02          	ldw	x,(OFST-1,sp)
1321  02b3 fe            	ldw	x,(x)
1322  02b4 a602          	ld	a,#2
1323  02b6 e70e          	ld	(14,x),a
1324                     ; 647         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1326  02b8 1e02          	ldw	x,(OFST-1,sp)
1327  02ba fe            	ldw	x,(x)
1328  02bb 905f          	clrw	y
1329  02bd ef0f          	ldw	(15,x),y
1330                     ; 650         (void)tcbDequeueEntry (&timer_data_ptr->mutex_ptr->suspQ, timer_data_ptr->tcb_ptr);
1332  02bf 1e02          	ldw	x,(OFST-1,sp)
1333  02c1 fe            	ldw	x,(x)
1334  02c2 89            	pushw	x
1335  02c3 1e04          	ldw	x,(OFST+1,sp)
1336  02c5 ee02          	ldw	x,(2,x)
1337  02c7 cd0000        	call	_tcbDequeueEntry
1339  02ca 85            	popw	x
1340                     ; 653         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1342  02cb 1e02          	ldw	x,(OFST-1,sp)
1343  02cd fe            	ldw	x,(x)
1344  02ce 89            	pushw	x
1345  02cf ae0000        	ldw	x,#_tcbReadyQ
1346  02d2 cd0000        	call	_tcbEnqueuePriority
1348  02d5 85            	popw	x
1349                     ; 656         CRITICAL_END ();
1351  02d6 96            	ldw	x,sp
1352  02d7 1c0001        	addw	x,#OFST-2
1354  02da f6            ld A,(X)
1355  02db 88            push A
1356  02dc 86            pop CC
1358  02dd               L135:
1359                     ; 663 }
1362  02dd 5b03          	addw	sp,#3
1363  02df 81            	ret
1376                     	xdef	_atomMutexPut
1377                     	xdef	_atomMutexGet
1378                     	xdef	_atomMutexDelete
1379                     	xdef	_atomMutexCreate
1380                     	xref	_atomCurrentContext
1381                     	xref	_tcbDequeueEntry
1382                     	xref	_tcbDequeueHead
1383                     	xref	_tcbEnqueuePriority
1384                     	xref	_atomSched
1385                     	xref.b	_tcbReadyQ
1386                     	xref	_atomTimerCancel
1387                     	xref	_atomTimerRegister
1406                     	xref	c_lzmp
1407                     	end
