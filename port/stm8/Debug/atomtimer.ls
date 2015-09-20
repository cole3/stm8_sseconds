   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	switch	.data
   5  0000               L3_timer_queue:
   6  0000 0000          	dc.w	0
   7  0002               L5_system_ticks:
   8  0002 00000000      	dc.l	0
 113                     ; 126 uint8_t atomTimerRegister (ATOM_TIMER *timer_ptr)
 113                     ; 127 {
 115                     .text:	section	.text,new
 116  0000               _atomTimerRegister:
 118  0000 89            	pushw	x
 119  0001 89            	pushw	x
 120       00000002      OFST:	set	2
 123                     ; 132     if ((timer_ptr == NULL) || (timer_ptr->cb_func == NULL)
 123                     ; 133         || (timer_ptr->cb_ticks == 0))
 125  0002 a30000        	cpw	x,#0
 126  0005 270d          	jreq	L37
 128  0007 e601          	ld	a,(1,x)
 129  0009 fa            	or	a,(x)
 130  000a 2708          	jreq	L37
 132  000c 1c0004        	addw	x,#4
 133  000f cd0000        	call	c_lzmp
 135  0012 2609          	jrne	L17
 136  0014               L37:
 137                     ; 136         status = ATOM_ERR_PARAM;
 139  0014 a6c9          	ld	a,#201
 140  0016 6b02          	ld	(OFST+0,sp),a
 142  0018               L77:
 143                     ; 172     return (status);
 145  0018 7b02          	ld	a,(OFST+0,sp)
 148  001a 5b04          	addw	sp,#4
 149  001c 81            	ret
 150  001d               L17:
 151                     ; 141         CRITICAL_START ();
 153  001d 96            	ldw	x,sp
 154  001e 1c0001        	addw	x,#OFST-1
 156  0021 8a            push CC
 157  0022 84            pop a
 158  0023 f7            ld (X),A
 159  0024 9b            sim
 161                     ; 152         if (timer_queue == NULL)
 163  0025 ce0000        	ldw	x,L3_timer_queue
 164  0028 260d          	jrne	L101
 165                     ; 155             timer_ptr->next_timer = NULL;
 167  002a 1e03          	ldw	x,(OFST+1,sp)
 168  002c 905f          	clrw	y
 169  002e ef08          	ldw	(8,x),y
 170                     ; 156             timer_queue = timer_ptr;
 172  0030 1e03          	ldw	x,(OFST+1,sp)
 173  0032 cf0000        	ldw	L3_timer_queue,x
 175  0035 200d          	jra	L301
 176  0037               L101:
 177                     ; 161             timer_ptr->next_timer = timer_queue;
 179  0037 1e03          	ldw	x,(OFST+1,sp)
 180  0039 90ce0000      	ldw	y,L3_timer_queue
 181  003d ef08          	ldw	(8,x),y
 182                     ; 162             timer_queue = timer_ptr;
 184  003f 1e03          	ldw	x,(OFST+1,sp)
 185  0041 cf0000        	ldw	L3_timer_queue,x
 186  0044               L301:
 187                     ; 166         CRITICAL_END ();
 189  0044 96            	ldw	x,sp
 190  0045 1c0001        	addw	x,#OFST-1
 192  0048 f6            ld A,(X)
 193  0049 88            push A
 194  004a 86            pop CC
 196                     ; 169         status = ATOM_OK;
 198  004b 0f02          	clr	(OFST+0,sp)
 199  004d 20c9          	jra	L77
 275                     ; 191 uint8_t atomTimerCancel (ATOM_TIMER *timer_ptr)
 275                     ; 192 {
 276                     .text:	section	.text,new
 277  0000               _atomTimerCancel:
 279  0000 89            	pushw	x
 280  0001 5206          	subw	sp,#6
 281       00000006      OFST:	set	6
 284                     ; 193     uint8_t status = ATOM_ERR_NOT_FOUND;
 286  0003 a6ce          	ld	a,#206
 287  0005 6b02          	ld	(OFST-4,sp),a
 288                     ; 198     if (timer_ptr == NULL)
 290  0007 a30000        	cpw	x,#0
 291  000a 2609          	jrne	L541
 292                     ; 201         status = ATOM_ERR_PARAM;
 294  000c a6c9          	ld	a,#201
 295  000e 6b02          	ld	(OFST-4,sp),a
 297  0010               L741:
 298                     ; 241     return (status);
 300  0010 7b02          	ld	a,(OFST-4,sp)
 303  0012 5b08          	addw	sp,#8
 304  0014 81            	ret
 305  0015               L541:
 306                     ; 206         CRITICAL_START ();
 308  0015 96            	ldw	x,sp
 309  0016 1c0001        	addw	x,#OFST-5
 311  0019 8a            push CC
 312  001a 84            pop a
 313  001b f7            ld (X),A
 314  001c 9b            sim
 316                     ; 209         prev_ptr = next_ptr = timer_queue;
 318  001d ce0000        	ldw	x,L3_timer_queue
 319  0020 1f05          	ldw	(OFST-1,sp),x
 320  0022 1e05          	ldw	x,(OFST-1,sp)
 321  0024 1f03          	ldw	(OFST-3,sp),x
 323  0026 2036          	jra	L551
 324  0028               L151:
 325                     ; 213             if (next_ptr == timer_ptr)
 327  0028 1e05          	ldw	x,(OFST-1,sp)
 328  002a 1307          	cpw	x,(OFST+1,sp)
 329  002c 2626          	jrne	L161
 330                     ; 215                 if (next_ptr == timer_queue)
 332  002e 1e05          	ldw	x,(OFST-1,sp)
 333  0030 c30000        	cpw	x,L3_timer_queue
 334  0033 2609          	jrne	L361
 335                     ; 218                     timer_queue = next_ptr->next_timer;
 337  0035 1e05          	ldw	x,(OFST-1,sp)
 338  0037 ee08          	ldw	x,(8,x)
 339  0039 cf0000        	ldw	L3_timer_queue,x
 341  003c 200b          	jra	L561
 342  003e               L361:
 343                     ; 223                     prev_ptr->next_timer = next_ptr->next_timer;
 345  003e 1e05          	ldw	x,(OFST-1,sp)
 346  0040 1603          	ldw	y,(OFST-3,sp)
 347  0042 89            	pushw	x
 348  0043 ee08          	ldw	x,(8,x)
 349  0045 90ef08        	ldw	(8,y),x
 350  0048 85            	popw	x
 351  0049               L561:
 352                     ; 227                 status = ATOM_OK;
 354  0049 0f02          	clr	(OFST-4,sp)
 355                     ; 228                 break;
 356  004b               L751:
 357                     ; 238         CRITICAL_END ();
 359  004b 96            	ldw	x,sp
 360  004c 1c0001        	addw	x,#OFST-5
 362  004f f6            ld A,(X)
 363  0050 88            push A
 364  0051 86            pop CC
 366  0052 20bc          	jra	L741
 367  0054               L161:
 368                     ; 232             prev_ptr = next_ptr;
 370  0054 1e05          	ldw	x,(OFST-1,sp)
 371  0056 1f03          	ldw	(OFST-3,sp),x
 372                     ; 233             next_ptr = next_ptr->next_timer;
 374  0058 1e05          	ldw	x,(OFST-1,sp)
 375  005a ee08          	ldw	x,(8,x)
 376  005c 1f05          	ldw	(OFST-1,sp),x
 377  005e               L551:
 378                     ; 210         while (next_ptr)
 380  005e 1e05          	ldw	x,(OFST-1,sp)
 381  0060 26c6          	jrne	L151
 382  0062 20e7          	jra	L751
 406                     ; 255 uint32_t atomTimeGet(void)
 406                     ; 256 {
 407                     .text:	section	.text,new
 408  0000               _atomTimeGet:
 412                     ; 257     return (system_ticks);
 414  0000 ae0002        	ldw	x,#L5_system_ticks
 415  0003 cd0000        	call	c_ltor
 419  0006 81            	ret
 452                     ; 277 void atomTimeSet(uint32_t new_time)
 452                     ; 278 {
 453                     .text:	section	.text,new
 454  0000               _atomTimeSet:
 456       00000000      OFST:	set	0
 459                     ; 279     system_ticks = new_time;
 461  0000 1e05          	ldw	x,(OFST+5,sp)
 462  0002 cf0004        	ldw	L5_system_ticks+2,x
 463  0005 1e03          	ldw	x,(OFST+3,sp)
 464  0007 cf0002        	ldw	L5_system_ticks,x
 465                     ; 280 }
 468  000a 81            	ret
 494                     ; 296 void atomTimerTick (void)
 494                     ; 297 {
 495                     .text:	section	.text,new
 496  0000               _atomTimerTick:
 500                     ; 299     if (atomOSStarted)
 502  0000 725d0000      	tnz	_atomOSStarted
 503  0004 270b          	jreq	L322
 504                     ; 302         system_ticks++;
 506  0006 ae0002        	ldw	x,#L5_system_ticks
 507  0009 a601          	ld	a,#1
 508  000b cd0000        	call	c_lgadc
 510                     ; 305         atomTimerCallbacks ();
 512  000e cd0000        	call	L7_atomTimerCallbacks
 514  0011               L322:
 515                     ; 307 }
 518  0011 81            	ret
 731                     ; 328 uint8_t atomTimerDelay (uint32_t ticks)
 731                     ; 329 {
 732                     .text:	section	.text,new
 733  0000               _atomTimerDelay:
 735  0000 5210          	subw	sp,#16
 736       00000010      OFST:	set	16
 739                     ; 337     curr_tcb_ptr = atomCurrentContext();
 741  0002 cd0000        	call	_atomCurrentContext
 743  0005 1f04          	ldw	(OFST-12,sp),x
 744                     ; 340     if (ticks == 0)
 746  0007 96            	ldw	x,sp
 747  0008 1c0013        	addw	x,#OFST+3
 748  000b cd0000        	call	c_lzmp
 750  000e 2606          	jrne	L153
 751                     ; 343         status = ATOM_ERR_PARAM;
 753  0010 a6c9          	ld	a,#201
 754  0012 6b10          	ld	(OFST+0,sp),a
 756  0014 205c          	jra	L353
 757  0016               L153:
 758                     ; 347     else if (curr_tcb_ptr == NULL)
 760  0016 1e04          	ldw	x,(OFST-12,sp)
 761  0018 2606          	jrne	L553
 762                     ; 350         status = ATOM_ERR_CONTEXT;
 764  001a a6c8          	ld	a,#200
 765  001c 6b10          	ld	(OFST+0,sp),a
 767  001e 2052          	jra	L353
 768  0020               L553:
 769                     ; 357         CRITICAL_START ();
 771  0020 96            	ldw	x,sp
 772  0021 1c0003        	addw	x,#OFST-13
 774  0024 8a            push CC
 775  0025 84            pop a
 776  0026 f7            ld (X),A
 777  0027 9b            sim
 779                     ; 360         curr_tcb_ptr->suspended = TRUE;
 781  0028 1e04          	ldw	x,(OFST-12,sp)
 782  002a a601          	ld	a,#1
 783  002c e70d          	ld	(13,x),a
 784                     ; 365         timer_data.tcb_ptr = curr_tcb_ptr;
 786  002e 1e04          	ldw	x,(OFST-12,sp)
 787  0030 1f01          	ldw	(OFST-15,sp),x
 788                     ; 368         timer_cb.cb_func = atomTimerDelayCallback;
 790  0032 ae0000        	ldw	x,#L11_atomTimerDelayCallback
 791  0035 1f06          	ldw	(OFST-10,sp),x
 792                     ; 369         timer_cb.cb_data = (POINTER)&timer_data;
 794  0037 96            	ldw	x,sp
 795  0038 1c0001        	addw	x,#OFST-15
 796  003b 1f08          	ldw	(OFST-8,sp),x
 797                     ; 370         timer_cb.cb_ticks = ticks;
 799  003d 1e15          	ldw	x,(OFST+5,sp)
 800  003f 1f0c          	ldw	(OFST-4,sp),x
 801  0041 1e13          	ldw	x,(OFST+3,sp)
 802  0043 1f0a          	ldw	(OFST-6,sp),x
 803                     ; 373         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 805  0045 96            	ldw	x,sp
 806  0046 1c0006        	addw	x,#OFST-10
 807  0049 1604          	ldw	y,(OFST-12,sp)
 808  004b 90ef0f        	ldw	(15,y),x
 809                     ; 376         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 811  004e 96            	ldw	x,sp
 812  004f 1c0006        	addw	x,#OFST-10
 813  0052 cd0000        	call	_atomTimerRegister
 815  0055 4d            	tnz	a
 816  0056 270d          	jreq	L163
 817                     ; 379             CRITICAL_END ();
 819  0058 96            	ldw	x,sp
 820  0059 1c0003        	addw	x,#OFST-13
 822  005c f6            ld A,(X)
 823  005d 88            push A
 824  005e 86            pop CC
 826                     ; 382             status = ATOM_ERR_TIMER;
 828  005f a6cd          	ld	a,#205
 829  0061 6b10          	ld	(OFST+0,sp),a
 831  0063 200d          	jra	L353
 832  0065               L163:
 833                     ; 387             CRITICAL_END ();
 835  0065 96            	ldw	x,sp
 836  0066 1c0003        	addw	x,#OFST-13
 838  0069 f6            ld A,(X)
 839  006a 88            push A
 840  006b 86            pop CC
 842                     ; 390             status = ATOM_OK;
 844  006c 0f10          	clr	(OFST+0,sp)
 845                     ; 393             atomSched (FALSE);
 847  006e 4f            	clr	a
 848  006f cd0000        	call	_atomSched
 850  0072               L353:
 851                     ; 397     return (status);
 853  0072 7b10          	ld	a,(OFST+0,sp)
 856  0074 5b10          	addw	sp,#16
 857  0076 81            	ret
 907                     ; 410 static void atomTimerCallbacks (void)
 907                     ; 411 {
 908                     .text:	section	.text,new
 909  0000               L7_atomTimerCallbacks:
 911  0000 5204          	subw	sp,#4
 912       00000004      OFST:	set	4
 915                     ; 418     prev_ptr = next_ptr = timer_queue;
 917  0002 ce0000        	ldw	x,L3_timer_queue
 918  0005 1f03          	ldw	(OFST-1,sp),x
 919  0007 1e03          	ldw	x,(OFST-1,sp)
 920  0009 1f01          	ldw	(OFST-3,sp),x
 922  000b 2047          	jra	L714
 923  000d               L314:
 924                     ; 422         if (--(next_ptr->cb_ticks) == 0)
 926  000d 1e03          	ldw	x,(OFST-1,sp)
 927  000f 1c0004        	addw	x,#4
 928  0012 a601          	ld	a,#1
 929  0014 cd0000        	call	c_lgsbc
 931  0017 cd0000        	call	c_lzmp
 933  001a 262e          	jrne	L324
 934                     ; 425             if (next_ptr == timer_queue)
 936  001c 1e03          	ldw	x,(OFST-1,sp)
 937  001e c30000        	cpw	x,L3_timer_queue
 938  0021 2609          	jrne	L524
 939                     ; 428                 timer_queue = next_ptr->next_timer;
 941  0023 1e03          	ldw	x,(OFST-1,sp)
 942  0025 ee08          	ldw	x,(8,x)
 943  0027 cf0000        	ldw	L3_timer_queue,x
 945  002a 200b          	jra	L724
 946  002c               L524:
 947                     ; 433                 prev_ptr->next_timer = next_ptr->next_timer;
 949  002c 1e03          	ldw	x,(OFST-1,sp)
 950  002e 1601          	ldw	y,(OFST-3,sp)
 951  0030 89            	pushw	x
 952  0031 ee08          	ldw	x,(8,x)
 953  0033 90ef08        	ldw	(8,y),x
 954  0036 85            	popw	x
 955  0037               L724:
 956                     ; 437             if (next_ptr->cb_func)
 958  0037 1e03          	ldw	x,(OFST-1,sp)
 959  0039 e601          	ld	a,(1,x)
 960  003b fa            	or	a,(x)
 961  003c 2710          	jreq	L334
 962                     ; 439                 next_ptr->cb_func (next_ptr->cb_data);
 964  003e 1e03          	ldw	x,(OFST-1,sp)
 965  0040 ee02          	ldw	x,(2,x)
 966  0042 1603          	ldw	y,(OFST-1,sp)
 967  0044 90fe          	ldw	y,(y)
 968  0046 90fd          	call	(y)
 970  0048 2004          	jra	L334
 971  004a               L324:
 972                     ; 453             prev_ptr = next_ptr;
 974  004a 1e03          	ldw	x,(OFST-1,sp)
 975  004c 1f01          	ldw	(OFST-3,sp),x
 976  004e               L334:
 977                     ; 457         next_ptr = next_ptr->next_timer;
 979  004e 1e03          	ldw	x,(OFST-1,sp)
 980  0050 ee08          	ldw	x,(8,x)
 981  0052 1f03          	ldw	(OFST-1,sp),x
 982  0054               L714:
 983                     ; 419     while (next_ptr)
 985  0054 1e03          	ldw	x,(OFST-1,sp)
 986  0056 26b5          	jrne	L314
 987                     ; 461 }
 990  0058 5b04          	addw	sp,#4
 991  005a 81            	ret
1048                     ; 475 static void atomTimerDelayCallback (POINTER cb_data)
1048                     ; 476 {
1049                     .text:	section	.text,new
1050  0000               L11_atomTimerDelayCallback:
1052  0000 5203          	subw	sp,#3
1053       00000003      OFST:	set	3
1056                     ; 481     timer_data_ptr = (DELAY_TIMER *)cb_data;
1058  0002 1f02          	ldw	(OFST-1,sp),x
1059                     ; 484     if (timer_data_ptr)
1061  0004 1e02          	ldw	x,(OFST-1,sp)
1062  0006 271a          	jreq	L364
1063                     ; 487         CRITICAL_START ();
1065  0008 96            	ldw	x,sp
1066  0009 1c0001        	addw	x,#OFST-2
1068  000c 8a            push CC
1069  000d 84            pop a
1070  000e f7            ld (X),A
1071  000f 9b            sim
1073                     ; 490         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1075  0010 1e02          	ldw	x,(OFST-1,sp)
1076  0012 fe            	ldw	x,(x)
1077  0013 89            	pushw	x
1078  0014 ae0000        	ldw	x,#_tcbReadyQ
1079  0017 cd0000        	call	_tcbEnqueuePriority
1081  001a 85            	popw	x
1082                     ; 493         CRITICAL_END ();
1084  001b 96            	ldw	x,sp
1085  001c 1c0001        	addw	x,#OFST-2
1087  001f f6            ld A,(X)
1088  0020 88            push A
1089  0021 86            pop CC
1091  0022               L364:
1092                     ; 501 }
1095  0022 5b03          	addw	sp,#3
1096  0024 81            	ret
1130                     	xdef	_atomTimerTick
1131                     	xref	_atomCurrentContext
1132                     	xref	_tcbEnqueuePriority
1133                     	xref	_atomSched
1134                     	xref	_atomOSStarted
1135                     	xref	_tcbReadyQ
1136                     	xdef	_atomTimeSet
1137                     	xdef	_atomTimeGet
1138                     	xdef	_atomTimerDelay
1139                     	xdef	_atomTimerCancel
1140                     	xdef	_atomTimerRegister
1159                     	xref	c_lgsbc
1160                     	xref	c_lgadc
1161                     	xref	c_ltor
1162                     	xref	c_lzmp
1163                     	end
