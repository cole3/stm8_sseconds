   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     	bsct
   5  0000               L3_timer_queue:
   6  0000 0000          	dc.w	0
   7  0002               L5_system_ticks:
   8  0002 00000000      	dc.l	0
 117                     ; 125 uint8_t atomTimerRegister (ATOM_TIMER *timer_ptr)
 117                     ; 126 {
 119                     	switch	.text
 120  0000               _atomTimerRegister:
 122  0000 89            	pushw	x
 123  0001 89            	pushw	x
 124       00000002      OFST:	set	2
 127                     ; 131     if ((timer_ptr == NULL) || (timer_ptr->cb_func == NULL)
 127                     ; 132         || (timer_ptr->cb_ticks == 0)) {
 129  0002 a30000        	cpw	x,#0
 130  0005 270d          	jreq	L77
 132  0007 e601          	ld	a,(1,x)
 133  0009 fa            	or	a,(x)
 134  000a 2708          	jreq	L77
 136  000c 1c0004        	addw	x,#4
 137  000f cd0000        	call	c_lzmp
 139  0012 2609          	jrne	L57
 140  0014               L77:
 141                     ; 134         status = ATOM_ERR_PARAM;
 143  0014 a6c9          	ld	a,#201
 144  0016 6b02          	ld	(OFST+0,sp),a
 146  0018               L301:
 147                     ; 165     return (status);
 149  0018 7b02          	ld	a,(OFST+0,sp)
 152  001a 5b04          	addw	sp,#4
 153  001c 81            	ret
 154  001d               L57:
 155                     ; 137         CRITICAL_START ();
 157  001d 96            	ldw	x,sp
 158  001e 1c0001        	addw	x,#OFST-1
 160  0021 8a            push CC
 161  0022 84            pop a
 162  0023 f7            ld (X),A
 163  0024 9b            sim
 165                     ; 148         if (timer_queue == NULL) {
 167  0025 be00          	ldw	x,L3_timer_queue
 168  0027 260c          	jrne	L501
 169                     ; 150             timer_ptr->next_timer = NULL;
 171  0029 1e03          	ldw	x,(OFST+1,sp)
 172  002b 905f          	clrw	y
 173  002d ef08          	ldw	(8,x),y
 174                     ; 151             timer_queue = timer_ptr;
 176  002f 1e03          	ldw	x,(OFST+1,sp)
 177  0031 bf00          	ldw	L3_timer_queue,x
 179  0033 200b          	jra	L701
 180  0035               L501:
 181                     ; 154             timer_ptr->next_timer = timer_queue;
 183  0035 1e03          	ldw	x,(OFST+1,sp)
 184  0037 90be00        	ldw	y,L3_timer_queue
 185  003a ef08          	ldw	(8,x),y
 186                     ; 155             timer_queue = timer_ptr;
 188  003c 1e03          	ldw	x,(OFST+1,sp)
 189  003e bf00          	ldw	L3_timer_queue,x
 190  0040               L701:
 191                     ; 159         CRITICAL_END ();
 193  0040 96            	ldw	x,sp
 194  0041 1c0001        	addw	x,#OFST-1
 196  0044 f6            ld A,(X)
 197  0045 88            push A
 198  0046 86            pop CC
 200                     ; 162         status = ATOM_OK;
 202  0047 0f02          	clr	(OFST+0,sp)
 203  0049 20cd          	jra	L301
 283                     ; 184 uint8_t atomTimerCancel (ATOM_TIMER *timer_ptr)
 283                     ; 185 {
 284                     	switch	.text
 285  004b               _atomTimerCancel:
 287  004b 89            	pushw	x
 288  004c 5206          	subw	sp,#6
 289       00000006      OFST:	set	6
 292                     ; 186     uint8_t status = ATOM_ERR_NOT_FOUND;
 294  004e a6ce          	ld	a,#206
 295  0050 6b02          	ld	(OFST-4,sp),a
 296                     ; 191     if (timer_ptr == NULL) {
 298  0052 a30000        	cpw	x,#0
 299  0055 2609          	jrne	L551
 300                     ; 193         status = ATOM_ERR_PARAM;
 302  0057 a6c9          	ld	a,#201
 303  0059 6b02          	ld	(OFST-4,sp),a
 305  005b               L751:
 306                     ; 226     return (status);
 308  005b 7b02          	ld	a,(OFST-4,sp)
 311  005d 5b08          	addw	sp,#8
 312  005f 81            	ret
 313  0060               L551:
 314                     ; 196         CRITICAL_START ();
 316  0060 96            	ldw	x,sp
 317  0061 1c0001        	addw	x,#OFST-5
 319  0064 8a            push CC
 320  0065 84            pop a
 321  0066 f7            ld (X),A
 322  0067 9b            sim
 324                     ; 199         prev_ptr = next_ptr = timer_queue;
 326  0068 be00          	ldw	x,L3_timer_queue
 327  006a 1f05          	ldw	(OFST-1,sp),x
 328  006c 1e05          	ldw	x,(OFST-1,sp)
 329  006e 1f03          	ldw	(OFST-3,sp),x
 331  0070 2034          	jra	L561
 332  0072               L161:
 333                     ; 202             if (next_ptr == timer_ptr) {
 335  0072 1e05          	ldw	x,(OFST-1,sp)
 336  0074 1307          	cpw	x,(OFST+1,sp)
 337  0076 2624          	jrne	L171
 338                     ; 203                 if (next_ptr == timer_queue) {
 340  0078 1e05          	ldw	x,(OFST-1,sp)
 341  007a b300          	cpw	x,L3_timer_queue
 342  007c 2608          	jrne	L371
 343                     ; 205                     timer_queue = next_ptr->next_timer;
 345  007e 1e05          	ldw	x,(OFST-1,sp)
 346  0080 ee08          	ldw	x,(8,x)
 347  0082 bf00          	ldw	L3_timer_queue,x
 349  0084 200b          	jra	L571
 350  0086               L371:
 351                     ; 208                     prev_ptr->next_timer = next_ptr->next_timer;
 353  0086 1e05          	ldw	x,(OFST-1,sp)
 354  0088 1603          	ldw	y,(OFST-3,sp)
 355  008a 89            	pushw	x
 356  008b ee08          	ldw	x,(8,x)
 357  008d 90ef08        	ldw	(8,y),x
 358  0090 85            	popw	x
 359  0091               L571:
 360                     ; 212                 status = ATOM_OK;
 362  0091 0f02          	clr	(OFST-4,sp)
 363                     ; 213                 break;
 364  0093               L761:
 365                     ; 223         CRITICAL_END ();
 367  0093 96            	ldw	x,sp
 368  0094 1c0001        	addw	x,#OFST-5
 370  0097 f6            ld A,(X)
 371  0098 88            push A
 372  0099 86            pop CC
 374  009a 20bf          	jra	L751
 375  009c               L171:
 376                     ; 217             prev_ptr = next_ptr;
 378  009c 1e05          	ldw	x,(OFST-1,sp)
 379  009e 1f03          	ldw	(OFST-3,sp),x
 380                     ; 218             next_ptr = next_ptr->next_timer;
 382  00a0 1e05          	ldw	x,(OFST-1,sp)
 383  00a2 ee08          	ldw	x,(8,x)
 384  00a4 1f05          	ldw	(OFST-1,sp),x
 385  00a6               L561:
 386                     ; 200         while (next_ptr) {
 388  00a6 1e05          	ldw	x,(OFST-1,sp)
 389  00a8 26c8          	jrne	L161
 390  00aa 20e7          	jra	L761
 414                     ; 240 uint32_t atomTimeGet(void)
 414                     ; 241 {
 415                     	switch	.text
 416  00ac               _atomTimeGet:
 420                     ; 242     return (system_ticks);
 422  00ac ae0002        	ldw	x,#L5_system_ticks
 423  00af cd0000        	call	c_ltor
 427  00b2 81            	ret
 462                     ; 262 void atomTimeSet(uint32_t new_time)
 462                     ; 263 {
 463                     	switch	.text
 464  00b3               _atomTimeSet:
 466       00000000      OFST:	set	0
 469                     ; 264     system_ticks = new_time;
 471  00b3 1e05          	ldw	x,(OFST+5,sp)
 472  00b5 bf04          	ldw	L5_system_ticks+2,x
 473  00b7 1e03          	ldw	x,(OFST+3,sp)
 474  00b9 bf02          	ldw	L5_system_ticks,x
 475                     ; 265 }
 478  00bb 81            	ret
 504                     ; 281 void atomTimerTick (void)
 504                     ; 282 {
 505                     	switch	.text
 506  00bc               _atomTimerTick:
 510                     ; 284     if (atomOSStarted) {
 512  00bc 3d00          	tnz	_atomOSStarted
 513  00be 270a          	jreq	L532
 514                     ; 286         system_ticks++;
 516  00c0 ae0002        	ldw	x,#L5_system_ticks
 517  00c3 a601          	ld	a,#1
 518  00c5 cd0000        	call	c_lgadc
 520                     ; 289         atomTimerCallbacks ();
 522  00c8 ad78          	call	L7_atomTimerCallbacks
 524  00ca               L532:
 525                     ; 291 }
 528  00ca 81            	ret
 730                     ; 312 uint8_t atomTimerDelay (uint32_t ticks)
 730                     ; 313 {
 731                     	switch	.text
 732  00cb               _atomTimerDelay:
 734  00cb 5210          	subw	sp,#16
 735       00000010      OFST:	set	16
 738                     ; 321     curr_tcb_ptr = atomCurrentContext();
 740  00cd cd0000        	call	_atomCurrentContext
 742  00d0 1f04          	ldw	(OFST-12,sp),x
 743                     ; 324     if (ticks == 0) {
 745  00d2 96            	ldw	x,sp
 746  00d3 1c0013        	addw	x,#OFST+3
 747  00d6 cd0000        	call	c_lzmp
 749  00d9 2606          	jrne	L363
 750                     ; 326         status = ATOM_ERR_PARAM;
 752  00db a6c9          	ld	a,#201
 753  00dd 6b10          	ld	(OFST+0,sp),a
 755  00df 205c          	jra	L563
 756  00e1               L363:
 757                     ; 330     else if (curr_tcb_ptr == NULL) {
 759  00e1 1e04          	ldw	x,(OFST-12,sp)
 760  00e3 2606          	jrne	L763
 761                     ; 332         status = ATOM_ERR_CONTEXT;
 763  00e5 a6c8          	ld	a,#200
 764  00e7 6b10          	ld	(OFST+0,sp),a
 766  00e9 2052          	jra	L563
 767  00eb               L763:
 768                     ; 338         CRITICAL_START ();
 770  00eb 96            	ldw	x,sp
 771  00ec 1c0003        	addw	x,#OFST-13
 773  00ef 8a            push CC
 774  00f0 84            pop a
 775  00f1 f7            ld (X),A
 776  00f2 9b            sim
 778                     ; 341         curr_tcb_ptr->suspended = TRUE;
 780  00f3 1e04          	ldw	x,(OFST-12,sp)
 781  00f5 a601          	ld	a,#1
 782  00f7 e70d          	ld	(13,x),a
 783                     ; 346         timer_data.tcb_ptr = curr_tcb_ptr;
 785  00f9 1e04          	ldw	x,(OFST-12,sp)
 786  00fb 1f01          	ldw	(OFST-15,sp),x
 787                     ; 349         timer_cb.cb_func = atomTimerDelayCallback;
 789  00fd ae019a        	ldw	x,#L11_atomTimerDelayCallback
 790  0100 1f06          	ldw	(OFST-10,sp),x
 791                     ; 350         timer_cb.cb_data = (POINTER)&timer_data;
 793  0102 96            	ldw	x,sp
 794  0103 1c0001        	addw	x,#OFST-15
 795  0106 1f08          	ldw	(OFST-8,sp),x
 796                     ; 351         timer_cb.cb_ticks = ticks;
 798  0108 1e15          	ldw	x,(OFST+5,sp)
 799  010a 1f0c          	ldw	(OFST-4,sp),x
 800  010c 1e13          	ldw	x,(OFST+3,sp)
 801  010e 1f0a          	ldw	(OFST-6,sp),x
 802                     ; 354         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 804  0110 96            	ldw	x,sp
 805  0111 1c0006        	addw	x,#OFST-10
 806  0114 1604          	ldw	y,(OFST-12,sp)
 807  0116 90ef0f        	ldw	(15,y),x
 808                     ; 357         if (atomTimerRegister (&timer_cb) != ATOM_OK) {
 810  0119 96            	ldw	x,sp
 811  011a 1c0006        	addw	x,#OFST-10
 812  011d cd0000        	call	_atomTimerRegister
 814  0120 4d            	tnz	a
 815  0121 270d          	jreq	L373
 816                     ; 359             CRITICAL_END ();
 818  0123 96            	ldw	x,sp
 819  0124 1c0003        	addw	x,#OFST-13
 821  0127 f6            ld A,(X)
 822  0128 88            push A
 823  0129 86            pop CC
 825                     ; 362             status = ATOM_ERR_TIMER;
 827  012a a6cd          	ld	a,#205
 828  012c 6b10          	ld	(OFST+0,sp),a
 830  012e 200d          	jra	L563
 831  0130               L373:
 832                     ; 365             CRITICAL_END ();
 834  0130 96            	ldw	x,sp
 835  0131 1c0003        	addw	x,#OFST-13
 837  0134 f6            ld A,(X)
 838  0135 88            push A
 839  0136 86            pop CC
 841                     ; 368             status = ATOM_OK;
 843  0137 0f10          	clr	(OFST+0,sp)
 844                     ; 371             atomSched (FALSE);
 846  0139 4f            	clr	a
 847  013a cd0000        	call	_atomSched
 849  013d               L563:
 850                     ; 375     return (status);
 852  013d 7b10          	ld	a,(OFST+0,sp)
 855  013f 5b10          	addw	sp,#16
 856  0141 81            	ret
 906                     ; 388 static void atomTimerCallbacks (void)
 906                     ; 389 {
 907                     	switch	.text
 908  0142               L7_atomTimerCallbacks:
 910  0142 5204          	subw	sp,#4
 911       00000004      OFST:	set	4
 914                     ; 396     prev_ptr = next_ptr = timer_queue;
 916  0144 be00          	ldw	x,L3_timer_queue
 917  0146 1f03          	ldw	(OFST-1,sp),x
 918  0148 1e03          	ldw	x,(OFST-1,sp)
 919  014a 1f01          	ldw	(OFST-3,sp),x
 921  014c 2045          	jra	L134
 922  014e               L524:
 923                     ; 399         if (--(next_ptr->cb_ticks) == 0) {
 925  014e 1e03          	ldw	x,(OFST-1,sp)
 926  0150 1c0004        	addw	x,#4
 927  0153 a601          	ld	a,#1
 928  0155 cd0000        	call	c_lgsbc
 930  0158 cd0000        	call	c_lzmp
 932  015b 262c          	jrne	L534
 933                     ; 401             if (next_ptr == timer_queue) {
 935  015d 1e03          	ldw	x,(OFST-1,sp)
 936  015f b300          	cpw	x,L3_timer_queue
 937  0161 2608          	jrne	L734
 938                     ; 403                 timer_queue = next_ptr->next_timer;
 940  0163 1e03          	ldw	x,(OFST-1,sp)
 941  0165 ee08          	ldw	x,(8,x)
 942  0167 bf00          	ldw	L3_timer_queue,x
 944  0169 200b          	jra	L144
 945  016b               L734:
 946                     ; 406                 prev_ptr->next_timer = next_ptr->next_timer;
 948  016b 1e03          	ldw	x,(OFST-1,sp)
 949  016d 1601          	ldw	y,(OFST-3,sp)
 950  016f 89            	pushw	x
 951  0170 ee08          	ldw	x,(8,x)
 952  0172 90ef08        	ldw	(8,y),x
 953  0175 85            	popw	x
 954  0176               L144:
 955                     ; 410             if (next_ptr->cb_func) {
 957  0176 1e03          	ldw	x,(OFST-1,sp)
 958  0178 e601          	ld	a,(1,x)
 959  017a fa            	or	a,(x)
 960  017b 2710          	jreq	L544
 961                     ; 411                 next_ptr->cb_func (next_ptr->cb_data);
 963  017d 1e03          	ldw	x,(OFST-1,sp)
 964  017f ee02          	ldw	x,(2,x)
 965  0181 1603          	ldw	y,(OFST-1,sp)
 966  0183 90fe          	ldw	y,(y)
 967  0185 90fd          	call	(y)
 969  0187 2004          	jra	L544
 970  0189               L534:
 971                     ; 424             prev_ptr = next_ptr;
 973  0189 1e03          	ldw	x,(OFST-1,sp)
 974  018b 1f01          	ldw	(OFST-3,sp),x
 975  018d               L544:
 976                     ; 428         next_ptr = next_ptr->next_timer;
 978  018d 1e03          	ldw	x,(OFST-1,sp)
 979  018f ee08          	ldw	x,(8,x)
 980  0191 1f03          	ldw	(OFST-1,sp),x
 981  0193               L134:
 982                     ; 397     while (next_ptr) {
 984  0193 1e03          	ldw	x,(OFST-1,sp)
 985  0195 26b7          	jrne	L524
 986                     ; 432 }
 989  0197 5b04          	addw	sp,#4
 990  0199 81            	ret
1049                     ; 446 static void atomTimerDelayCallback (POINTER cb_data)
1049                     ; 447 {
1050                     	switch	.text
1051  019a               L11_atomTimerDelayCallback:
1053  019a 5203          	subw	sp,#3
1054       00000003      OFST:	set	3
1057                     ; 452     timer_data_ptr = (DELAY_TIMER *)cb_data;
1059  019c 1f02          	ldw	(OFST-1,sp),x
1060                     ; 455     if (timer_data_ptr) {
1062  019e 1e02          	ldw	x,(OFST-1,sp)
1063  01a0 271a          	jreq	L774
1064                     ; 457         CRITICAL_START ();
1066  01a2 96            	ldw	x,sp
1067  01a3 1c0001        	addw	x,#OFST-2
1069  01a6 8a            push CC
1070  01a7 84            pop a
1071  01a8 f7            ld (X),A
1072  01a9 9b            sim
1074                     ; 460         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1076  01aa 1e02          	ldw	x,(OFST-1,sp)
1077  01ac fe            	ldw	x,(x)
1078  01ad 89            	pushw	x
1079  01ae ae0000        	ldw	x,#_tcbReadyQ
1080  01b1 cd0000        	call	_tcbEnqueuePriority
1082  01b4 85            	popw	x
1083                     ; 463         CRITICAL_END ();
1085  01b5 96            	ldw	x,sp
1086  01b6 1c0001        	addw	x,#OFST-2
1088  01b9 f6            ld A,(X)
1089  01ba 88            push A
1090  01bb 86            pop CC
1092  01bc               L774:
1093                     ; 471 }
1096  01bc 5b03          	addw	sp,#3
1097  01be 81            	ret
1133                     	xdef	_atomTimerTick
1134                     	xref	_atomCurrentContext
1135                     	xref	_tcbEnqueuePriority
1136                     	xref	_atomSched
1137                     	xref.b	_atomOSStarted
1138                     	xref.b	_tcbReadyQ
1139                     	xdef	_atomTimeSet
1140                     	xdef	_atomTimeGet
1141                     	xdef	_atomTimerDelay
1142                     	xdef	_atomTimerCancel
1143                     	xdef	_atomTimerRegister
1162                     	xref	c_lgsbc
1163                     	xref	c_lgadc
1164                     	xref	c_ltor
1165                     	xref	c_lzmp
1166                     	end
