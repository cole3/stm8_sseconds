   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     .const:	section	.text
   5  0000               L5_rtc_date:
   6  0000 00000000      	ds.b	4
 261                     	switch	.const
 262  0004               L6:
 263  0004 00000004      	dc.l	4
 264  0008               L01:
 265  0008 00000005      	dc.l	5
 266                     ; 13 static void set_date(int32_t argc, int32_t **argv)
 266                     ; 14 {
 267                     	scross	off
 268                     	switch	.text
 269  0000               L3_set_date:
 271  0000 5204          	subw	sp,#4
 272       00000004      OFST:	set	4
 275                     ; 15     RTC_DateTypeDef rtc_date = {};
 277  0002 96            	ldw	x,sp
 278  0003 1c0001        	addw	x,#OFST-3
 279  0006 90ae0000      	ldw	y,#L5_rtc_date
 280  000a a604          	ld	a,#4
 281  000c cd0000        	call	c_xymvx
 283                     ; 17     if (argc < 4) {
 285  000f 9c            	rvf
 286  0010 96            	ldw	x,sp
 287  0011 1c0007        	addw	x,#OFST+3
 288  0014 cd0000        	call	c_ltor
 290  0017 ae0004        	ldw	x,#L6
 291  001a cd0000        	call	c_lcmp
 293  001d 2e08          	jrsge	L141
 294                     ; 18         printf("set_date year month day [week]\n");
 296  001f ae00aa        	ldw	x,#L341
 297  0022 cd0000        	call	_printf
 299                     ; 19         return;
 301  0025 2050          	jra	L21
 302  0027               L141:
 303                     ; 22     rtc_date.RTC_Year = atoi((char *)argv[1]);
 305  0027 1e0b          	ldw	x,(OFST+7,sp)
 306  0029 ee02          	ldw	x,(2,x)
 307  002b cd0000        	call	_atoi
 309  002e 01            	rrwa	x,a
 310  002f 6b04          	ld	(OFST+0,sp),a
 311  0031 02            	rlwa	x,a
 312                     ; 23     rtc_date.RTC_Month = atoi((char *)argv[2]);
 314  0032 1e0b          	ldw	x,(OFST+7,sp)
 315  0034 ee04          	ldw	x,(4,x)
 316  0036 cd0000        	call	_atoi
 318  0039 01            	rrwa	x,a
 319  003a 6b02          	ld	(OFST-2,sp),a
 320  003c 02            	rlwa	x,a
 321                     ; 24     rtc_date.RTC_Date = atoi((char *)argv[3]);
 323  003d 1e0b          	ldw	x,(OFST+7,sp)
 324  003f ee06          	ldw	x,(6,x)
 325  0041 cd0000        	call	_atoi
 327  0044 01            	rrwa	x,a
 328  0045 6b03          	ld	(OFST-1,sp),a
 329  0047 02            	rlwa	x,a
 330                     ; 25     if (argc >= 5) {
 332  0048 9c            	rvf
 333  0049 96            	ldw	x,sp
 334  004a 1c0007        	addw	x,#OFST+3
 335  004d cd0000        	call	c_ltor
 337  0050 ae0008        	ldw	x,#L01
 338  0053 cd0000        	call	c_lcmp
 340  0056 2f0b          	jrslt	L541
 341                     ; 26         rtc_date.RTC_WeekDay = atoi((char *)argv[4]);
 343  0058 1e0b          	ldw	x,(OFST+7,sp)
 344  005a ee08          	ldw	x,(8,x)
 345  005c cd0000        	call	_atoi
 347  005f 01            	rrwa	x,a
 348  0060 6b01          	ld	(OFST-3,sp),a
 349  0062 02            	rlwa	x,a
 350  0063               L541:
 351                     ; 29     if (RTC_SetDate(RTC_Format_BIN, &rtc_date) != SUCCESS)
 353  0063 96            	ldw	x,sp
 354  0064 1c0001        	addw	x,#OFST-3
 355  0067 89            	pushw	x
 356  0068 4f            	clr	a
 357  0069 cd0000        	call	_RTC_SetDate
 359  006c 85            	popw	x
 360  006d a101          	cp	a,#1
 361  006f 2709          	jreq	L741
 362                     ; 31         printf("set_date fail!\n");
 364  0071 ae009a        	ldw	x,#L151
 365  0074 cd0000        	call	_printf
 367                     ; 32         return;
 368  0077               L21:
 371  0077 5b04          	addw	sp,#4
 372  0079 81            	ret
 373  007a               L741:
 374                     ; 34 }
 376  007a 20fb          	jra	L21
 422                     ; 36 static void get_date(int32_t argc, int32_t **argv)
 422                     ; 37 {
 423                     	switch	.text
 424  007c               L351_get_date:
 426  007c 5204          	subw	sp,#4
 427       00000004      OFST:	set	4
 430                     ; 40     RTC_GetDate(RTC_Format_BIN, &rtc_date);
 432  007e 96            	ldw	x,sp
 433  007f 1c0001        	addw	x,#OFST-3
 434  0082 89            	pushw	x
 435  0083 4f            	clr	a
 436  0084 cd0000        	call	_RTC_GetDate
 438  0087 85            	popw	x
 439                     ; 42     printf("current date: %d/%d/%d %d\n", rtc_date.RTC_Year,
 439                     ; 43         rtc_date.RTC_Month, rtc_date.RTC_Date, rtc_date.RTC_WeekDay);
 441  0088 7b01          	ld	a,(OFST-3,sp)
 442  008a 88            	push	a
 443  008b 7b04          	ld	a,(OFST+0,sp)
 444  008d 88            	push	a
 445  008e 7b04          	ld	a,(OFST+0,sp)
 446  0090 88            	push	a
 447  0091 7b07          	ld	a,(OFST+3,sp)
 448  0093 88            	push	a
 449  0094 ae007f        	ldw	x,#L771
 450  0097 cd0000        	call	_printf
 452  009a 5b04          	addw	sp,#4
 453                     ; 44 }
 456  009c 5b04          	addw	sp,#4
 457  009e 81            	ret
 460                     	switch	.const
 461  000c               L302_rtc_clock:
 462  000c 00000000      	ds.b	4
 576                     ; 46 static void set_clock(int32_t argc, int32_t **argv)
 576                     ; 47 {
 577                     	switch	.text
 578  009f               L102_set_clock:
 580  009f 5204          	subw	sp,#4
 581       00000004      OFST:	set	4
 584                     ; 48     RTC_TimeTypeDef rtc_clock = {};
 586  00a1 96            	ldw	x,sp
 587  00a2 1c0001        	addw	x,#OFST-3
 588  00a5 90ae000c      	ldw	y,#L302_rtc_clock
 589  00a9 a604          	ld	a,#4
 590  00ab cd0000        	call	c_xymvx
 592                     ; 50     if (argc < 4) {
 594  00ae 9c            	rvf
 595  00af 96            	ldw	x,sp
 596  00b0 1c0007        	addw	x,#OFST+3
 597  00b3 cd0000        	call	c_ltor
 599  00b6 ae0004        	ldw	x,#L6
 600  00b9 cd0000        	call	c_lcmp
 602  00bc 2e08          	jrsge	L162
 603                     ; 51         printf("set_clock hour minute second\n");
 605  00be ae0061        	ldw	x,#L362
 606  00c1 cd0000        	call	_printf
 608                     ; 52         return;
 610  00c4 204e          	jra	L42
 611  00c6               L162:
 612                     ; 55     rtc_clock.RTC_Hours = atoi((char *)argv[1]);
 614  00c6 1e0b          	ldw	x,(OFST+7,sp)
 615  00c8 ee02          	ldw	x,(2,x)
 616  00ca cd0000        	call	_atoi
 618  00cd 01            	rrwa	x,a
 619  00ce 6b01          	ld	(OFST-3,sp),a
 620  00d0 02            	rlwa	x,a
 621                     ; 56     rtc_clock.RTC_Minutes = atoi((char *)argv[2]);
 623  00d1 1e0b          	ldw	x,(OFST+7,sp)
 624  00d3 ee04          	ldw	x,(4,x)
 625  00d5 cd0000        	call	_atoi
 627  00d8 01            	rrwa	x,a
 628  00d9 6b02          	ld	(OFST-2,sp),a
 629  00db 02            	rlwa	x,a
 630                     ; 57     rtc_clock.RTC_Seconds = atoi((char *)argv[3]);
 632  00dc 1e0b          	ldw	x,(OFST+7,sp)
 633  00de ee06          	ldw	x,(6,x)
 634  00e0 cd0000        	call	_atoi
 636  00e3 01            	rrwa	x,a
 637  00e4 6b03          	ld	(OFST-1,sp),a
 638  00e6 02            	rlwa	x,a
 639                     ; 58     rtc_clock.RTC_H12 = (rtc_clock.RTC_Hours < 12) ? RTC_H12_AM : RTC_H12_PM;
 641  00e7 7b01          	ld	a,(OFST-3,sp)
 642  00e9 a10c          	cp	a,#12
 643  00eb 2403          	jruge	L02
 644  00ed 4f            	clr	a
 645  00ee 2002          	jra	L22
 646  00f0               L02:
 647  00f0 a640          	ld	a,#64
 648  00f2               L22:
 649  00f2 6b04          	ld	(OFST+0,sp),a
 650                     ; 59     if (rtc_clock.RTC_Hours > 12) {
 652  00f4 7b01          	ld	a,(OFST-3,sp)
 653  00f6 a10d          	cp	a,#13
 654  00f8 2506          	jrult	L562
 655                     ; 60         rtc_clock.RTC_Hours -= 12;
 657  00fa 7b01          	ld	a,(OFST-3,sp)
 658  00fc a00c          	sub	a,#12
 659  00fe 6b01          	ld	(OFST-3,sp),a
 660  0100               L562:
 661                     ; 63     if (RTC_SetTime(RTC_Format_BIN, &rtc_clock) != SUCCESS) {
 663  0100 96            	ldw	x,sp
 664  0101 1c0001        	addw	x,#OFST-3
 665  0104 89            	pushw	x
 666  0105 4f            	clr	a
 667  0106 cd0000        	call	_RTC_SetTime
 669  0109 85            	popw	x
 670  010a a101          	cp	a,#1
 671  010c 2709          	jreq	L762
 672                     ; 64         printf("set_date fail!\n");
 674  010e ae009a        	ldw	x,#L151
 675  0111 cd0000        	call	_printf
 677                     ; 65         return;
 678  0114               L42:
 681  0114 5b04          	addw	sp,#4
 682  0116 81            	ret
 683  0117               L762:
 684                     ; 67 }
 686  0117 20fb          	jra	L42
 732                     ; 69 static void get_clock(int32_t argc, int32_t **argv)
 732                     ; 70 {
 733                     	switch	.text
 734  0119               L172_get_clock:
 736  0119 5204          	subw	sp,#4
 737       00000004      OFST:	set	4
 740                     ; 73     RTC_GetTime(RTC_Format_BIN, &rtc_clock);
 742  011b 96            	ldw	x,sp
 743  011c 1c0001        	addw	x,#OFST-3
 744  011f 89            	pushw	x
 745  0120 4f            	clr	a
 746  0121 cd0000        	call	_RTC_GetTime
 748  0124 85            	popw	x
 749                     ; 75     printf("current clock: %02d:%02d:%02d (%s)\n",
 749                     ; 76         rtc_clock.RTC_Hours, rtc_clock.RTC_Minutes, rtc_clock.RTC_Seconds,
 749                     ; 77         (rtc_clock.RTC_H12 == RTC_H12_AM) ? "AM" : "PM");
 751  0125 0d04          	tnz	(OFST+0,sp)
 752  0127 2605          	jrne	L03
 753  0129 ae003a        	ldw	x,#L713
 754  012c 2003          	jra	L23
 755  012e               L03:
 756  012e ae0037        	ldw	x,#L123
 757  0131               L23:
 758  0131 89            	pushw	x
 759  0132 7b05          	ld	a,(OFST+1,sp)
 760  0134 88            	push	a
 761  0135 7b05          	ld	a,(OFST+1,sp)
 762  0137 88            	push	a
 763  0138 7b05          	ld	a,(OFST+1,sp)
 764  013a 88            	push	a
 765  013b ae003d        	ldw	x,#L513
 766  013e cd0000        	call	_printf
 768  0141 5b05          	addw	sp,#5
 769                     ; 78 }
 772  0143 5b04          	addw	sp,#4
 773  0145 81            	ret
 776                     	bsct
 777  0000               L323_cli_tab:
 778  0000 002e          	dc.w	L523
 780  0002 0000          	dc.w	L3_set_date
 781  0004 0025          	dc.w	L723
 783  0006 007c          	dc.w	L351_get_date
 784  0008 001b          	dc.w	L133
 786  000a 009f          	dc.w	L102_set_clock
 787  000c 0011          	dc.w	L333
 789  000e 0119          	dc.w	L172_get_clock
 790  0010 0010          	dc.w	L533
 791  0012 0000          	dc.w	0
 824                     ; 90 void cli_thread(uint32_t param)
 824                     ; 91 {
 825                     	switch	.text
 826  0146               _cli_thread:
 830  0146               L553:
 831                     ; 94         atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 833  0146 ae007d        	ldw	x,#125
 834  0149 89            	pushw	x
 835  014a ae0000        	ldw	x,#0
 836  014d 89            	pushw	x
 837  014e cd0000        	call	_atomTimerDelay
 839  0151 5b04          	addw	sp,#4
 841  0153 20f1          	jra	L553
 896                     	xdef	_cli_thread
 897                     	xref	_atomTimerDelay
 898                     	xref	_RTC_GetDate
 899                     	xref	_RTC_SetDate
 900                     	xref	_RTC_GetTime
 901                     	xref	_RTC_SetTime
 902                     	xref	_atoi
 903                     	xref	_printf
 904                     	switch	.const
 905  0010               L533:
 906  0010 00            	dc.b	0
 907  0011               L333:
 908  0011 6765745f636c  	dc.b	"get_clock",0
 909  001b               L133:
 910  001b 7365745f636c  	dc.b	"set_clock",0
 911  0025               L723:
 912  0025 6765745f6461  	dc.b	"get_date",0
 913  002e               L523:
 914  002e 7365745f6461  	dc.b	"set_date",0
 915  0037               L123:
 916  0037 504d00        	dc.b	"PM",0
 917  003a               L713:
 918  003a 414d00        	dc.b	"AM",0
 919  003d               L513:
 920  003d 63757272656e  	dc.b	"current clock: %02"
 921  004f 643a25303264  	dc.b	"d:%02d:%02d (%s)",10,0
 922  0061               L362:
 923  0061 7365745f636c  	dc.b	"set_clock hour min"
 924  0073 757465207365  	dc.b	"ute second",10,0
 925  007f               L771:
 926  007f 63757272656e  	dc.b	"current date: %d/%"
 927  0091 642f25642025  	dc.b	"d/%d %d",10,0
 928  009a               L151:
 929  009a 7365745f6461  	dc.b	"set_date fail!",10,0
 930  00aa               L341:
 931  00aa 7365745f6461  	dc.b	"set_date year mont"
 932  00bc 682064617920  	dc.b	"h day [week]",10,0
 933                     	xref.b	c_x
 953                     	xref	c_lcmp
 954                     	xref	c_ltor
 955                     	xref	c_xymvx
 956                     	end
