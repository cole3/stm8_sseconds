   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
   4                     .const:	section	.text
   5  0000               L5_rtc_date:
   6  0000 00000000      	ds.b	4
 420                     	switch	.const
 421  0004               L6:
 422  0004 00000004      	dc.l	4
 423  0008               L01:
 424  0008 00000005      	dc.l	5
 425                     ; 18 static void set_date(int32_t argc, char **argv)
 425                     ; 19 {
 426                     	scross	off
 427                     	switch	.text
 428  0000               L3_set_date:
 430  0000 5209          	subw	sp,#9
 431       00000009      OFST:	set	9
 434                     ; 20     RTC_DateTypeDef rtc_date = {};
 436  0002 96            	ldw	x,sp
 437  0003 1c0006        	addw	x,#OFST-3
 438  0006 90ae0000      	ldw	y,#L5_rtc_date
 439  000a a604          	ld	a,#4
 440  000c cd0000        	call	c_xymvx
 442                     ; 24     if (argc < 4) {
 444  000f 9c            	rvf
 445  0010 96            	ldw	x,sp
 446  0011 1c000c        	addw	x,#OFST+3
 447  0014 cd0000        	call	c_ltor
 449  0017 ae0004        	ldw	x,#L6
 450  001a cd0000        	call	c_lcmp
 452  001d 2e08          	jrsge	L732
 453                     ; 25         printf("set_date year month day [week]\n");
 455  001f ae00b8        	ldw	x,#L142
 456  0022 cd0000        	call	_printf
 458                     ; 26         return;
 460  0025 205f          	jra	L21
 461  0027               L732:
 462                     ; 29     rtc_date.RTC_Year = atoi((char *)argv[1]);
 464  0027 1e10          	ldw	x,(OFST+7,sp)
 465  0029 ee02          	ldw	x,(2,x)
 466  002b cd0000        	call	_atoi
 468  002e 01            	rrwa	x,a
 469  002f 6b09          	ld	(OFST+0,sp),a
 470  0031 02            	rlwa	x,a
 471                     ; 30     rtc_date.RTC_Month = atoi((char *)argv[2]);
 473  0032 1e10          	ldw	x,(OFST+7,sp)
 474  0034 ee04          	ldw	x,(4,x)
 475  0036 cd0000        	call	_atoi
 477  0039 01            	rrwa	x,a
 478  003a 6b07          	ld	(OFST-2,sp),a
 479  003c 02            	rlwa	x,a
 480                     ; 31     rtc_date.RTC_Date = atoi((char *)argv[3]);
 482  003d 1e10          	ldw	x,(OFST+7,sp)
 483  003f ee06          	ldw	x,(6,x)
 484  0041 cd0000        	call	_atoi
 486  0044 01            	rrwa	x,a
 487  0045 6b08          	ld	(OFST-1,sp),a
 488  0047 02            	rlwa	x,a
 489                     ; 32     if (argc >= 5) {
 491  0048 9c            	rvf
 492  0049 96            	ldw	x,sp
 493  004a 1c000c        	addw	x,#OFST+3
 494  004d cd0000        	call	c_ltor
 496  0050 ae0008        	ldw	x,#L01
 497  0053 cd0000        	call	c_lcmp
 499  0056 2f0b          	jrslt	L342
 500                     ; 33         rtc_date.RTC_WeekDay = atoi((char *)argv[4]);
 502  0058 1e10          	ldw	x,(OFST+7,sp)
 503  005a ee08          	ldw	x,(8,x)
 504  005c cd0000        	call	_atoi
 506  005f 01            	rrwa	x,a
 507  0060 6b06          	ld	(OFST-3,sp),a
 508  0062 02            	rlwa	x,a
 509  0063               L342:
 510                     ; 36     CRITICAL_START();
 512  0063 96            	ldw	x,sp
 513  0064 1c0001        	addw	x,#OFST-8
 515  0067 8a            push CC
 516  0068 84            pop a
 517  0069 f7            ld (X),A
 518  006a 9b            sim
 520                     ; 37     if (RTC_SetDate(RTC_Format_BIN, &rtc_date) != SUCCESS) {
 522  006b 96            	ldw	x,sp
 523  006c 1c0006        	addw	x,#OFST-3
 524  006f 89            	pushw	x
 525  0070 4f            	clr	a
 526  0071 cd0000        	call	_RTC_SetDate
 528  0074 85            	popw	x
 529  0075 a101          	cp	a,#1
 530  0077 2710          	jreq	L542
 531                     ; 38         CRITICAL_END();
 533  0079 96            	ldw	x,sp
 534  007a 1c0001        	addw	x,#OFST-8
 536  007d f6            ld A,(X)
 537  007e 88            push A
 538  007f 86            pop CC
 540                     ; 39         printf("set_date fail!\n");
 542  0080 ae00a8        	ldw	x,#L742
 543  0083 cd0000        	call	_printf
 545                     ; 40         return;
 546  0086               L21:
 549  0086 5b09          	addw	sp,#9
 550  0088 81            	ret
 551  0089               L542:
 552                     ; 42     CRITICAL_END();
 554  0089 96            	ldw	x,sp
 555  008a 1c0001        	addw	x,#OFST-8
 557  008d f6            ld A,(X)
 558  008e 88            push A
 559  008f 86            pop CC
 561                     ; 44     msg.type = DISPLAY_DATE;
 563  0090 0f02          	clr	(OFST-7,sp)
 564                     ; 45     msg.u.date.month = rtc_date.RTC_Month;
 566  0092 7b07          	ld	a,(OFST-2,sp)
 567  0094 6b03          	ld	(OFST-6,sp),a
 568                     ; 46     msg.u.date.day = rtc_date.RTC_Date;
 570  0096 7b08          	ld	a,(OFST-1,sp)
 571  0098 6b04          	ld	(OFST-5,sp),a
 572                     ; 47     atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
 574  009a 96            	ldw	x,sp
 575  009b 1c0002        	addw	x,#OFST-7
 576  009e 89            	pushw	x
 577  009f ae0000        	ldw	x,#0
 578  00a2 89            	pushw	x
 579  00a3 ae0000        	ldw	x,#0
 580  00a6 89            	pushw	x
 581  00a7 be00          	ldw	x,_pt_display_queue
 582  00a9 cd0000        	call	_atomQueuePut
 584  00ac 5b06          	addw	sp,#6
 585                     ; 48 }
 587  00ae 20d6          	jra	L21
 642                     ; 50 static void get_date(int32_t argc, char **argv)
 642                     ; 51 {
 643                     	switch	.text
 644  00b0               L152_get_date:
 646  00b0 5205          	subw	sp,#5
 647       00000005      OFST:	set	5
 650                     ; 55     CRITICAL_START();
 652  00b2 96            	ldw	x,sp
 653  00b3 1c0001        	addw	x,#OFST-4
 655  00b6 8a            push CC
 656  00b7 84            pop a
 657  00b8 f7            ld (X),A
 658  00b9 9b            sim
 660                     ; 56     RTC_GetDate(RTC_Format_BIN, &rtc_date);
 662  00ba 96            	ldw	x,sp
 663  00bb 1c0002        	addw	x,#OFST-3
 664  00be 89            	pushw	x
 665  00bf 4f            	clr	a
 666  00c0 cd0000        	call	_RTC_GetDate
 668  00c3 85            	popw	x
 669                     ; 57     CRITICAL_END();
 671  00c4 96            	ldw	x,sp
 672  00c5 1c0001        	addw	x,#OFST-4
 674  00c8 f6            ld A,(X)
 675  00c9 88            push A
 676  00ca 86            pop CC
 678                     ; 59     printf("current date: %d/%d/%d %d\n", rtc_date.RTC_Year,
 678                     ; 60         rtc_date.RTC_Month, rtc_date.RTC_Date, rtc_date.RTC_WeekDay);
 680  00cb 7b02          	ld	a,(OFST-3,sp)
 681  00cd 88            	push	a
 682  00ce 7b05          	ld	a,(OFST+0,sp)
 683  00d0 88            	push	a
 684  00d1 7b05          	ld	a,(OFST+0,sp)
 685  00d3 88            	push	a
 686  00d4 7b08          	ld	a,(OFST+3,sp)
 687  00d6 88            	push	a
 688  00d7 ae008d        	ldw	x,#L103
 689  00da cd0000        	call	_printf
 691  00dd 5b04          	addw	sp,#4
 692                     ; 61 }
 695  00df 5b05          	addw	sp,#5
 696  00e1 81            	ret
 699                     	switch	.const
 700  000c               L503_rtc_clock:
 701  000c 00000000      	ds.b	4
 837                     ; 63 static void set_clock(int32_t argc, char **argv)
 837                     ; 64 {
 838                     	switch	.text
 839  00e2               L303_set_clock:
 841  00e2 5209          	subw	sp,#9
 842       00000009      OFST:	set	9
 845                     ; 65     RTC_TimeTypeDef rtc_clock = {};
 847  00e4 96            	ldw	x,sp
 848  00e5 1c0006        	addw	x,#OFST-3
 849  00e8 90ae000c      	ldw	y,#L503_rtc_clock
 850  00ec a604          	ld	a,#4
 851  00ee cd0000        	call	c_xymvx
 853                     ; 69     if (argc < 4) {
 855  00f1 9c            	rvf
 856  00f2 96            	ldw	x,sp
 857  00f3 1c000c        	addw	x,#OFST+3
 858  00f6 cd0000        	call	c_ltor
 860  00f9 ae0004        	ldw	x,#L6
 861  00fc cd0000        	call	c_lcmp
 863  00ff 2e08          	jrsge	L373
 864                     ; 70         printf("set_clock hour minute second\n");
 866  0101 ae006f        	ldw	x,#L573
 867  0104 cd0000        	call	_printf
 869                     ; 71         return;
 871  0107 205d          	jra	L42
 872  0109               L373:
 873                     ; 74     rtc_clock.RTC_Hours = atoi((char *)argv[1]);
 875  0109 1e10          	ldw	x,(OFST+7,sp)
 876  010b ee02          	ldw	x,(2,x)
 877  010d cd0000        	call	_atoi
 879  0110 01            	rrwa	x,a
 880  0111 6b06          	ld	(OFST-3,sp),a
 881  0113 02            	rlwa	x,a
 882                     ; 75     rtc_clock.RTC_Minutes = atoi((char *)argv[2]);
 884  0114 1e10          	ldw	x,(OFST+7,sp)
 885  0116 ee04          	ldw	x,(4,x)
 886  0118 cd0000        	call	_atoi
 888  011b 01            	rrwa	x,a
 889  011c 6b07          	ld	(OFST-2,sp),a
 890  011e 02            	rlwa	x,a
 891                     ; 76     rtc_clock.RTC_Seconds = atoi((char *)argv[3]);
 893  011f 1e10          	ldw	x,(OFST+7,sp)
 894  0121 ee06          	ldw	x,(6,x)
 895  0123 cd0000        	call	_atoi
 897  0126 01            	rrwa	x,a
 898  0127 6b08          	ld	(OFST-1,sp),a
 899  0129 02            	rlwa	x,a
 900                     ; 77     rtc_clock.RTC_H12 = (rtc_clock.RTC_Hours < 12) ? RTC_H12_AM : RTC_H12_PM;
 902  012a 7b06          	ld	a,(OFST-3,sp)
 903  012c a10c          	cp	a,#12
 904  012e 2403          	jruge	L02
 905  0130 4f            	clr	a
 906  0131 2002          	jra	L22
 907  0133               L02:
 908  0133 a640          	ld	a,#64
 909  0135               L22:
 910  0135 6b09          	ld	(OFST+0,sp),a
 911                     ; 78     if (rtc_clock.RTC_Hours > 12) {
 913  0137 7b06          	ld	a,(OFST-3,sp)
 914  0139 a10d          	cp	a,#13
 915  013b 2506          	jrult	L773
 916                     ; 79         rtc_clock.RTC_Hours -= 12;
 918  013d 7b06          	ld	a,(OFST-3,sp)
 919  013f a00c          	sub	a,#12
 920  0141 6b06          	ld	(OFST-3,sp),a
 921  0143               L773:
 922                     ; 82     CRITICAL_START();
 924  0143 96            	ldw	x,sp
 925  0144 1c0001        	addw	x,#OFST-8
 927  0147 8a            push CC
 928  0148 84            pop a
 929  0149 f7            ld (X),A
 930  014a 9b            sim
 932                     ; 83     if (RTC_SetTime(RTC_Format_BIN, &rtc_clock) != SUCCESS) {
 934  014b 96            	ldw	x,sp
 935  014c 1c0006        	addw	x,#OFST-3
 936  014f 89            	pushw	x
 937  0150 4f            	clr	a
 938  0151 cd0000        	call	_RTC_SetTime
 940  0154 85            	popw	x
 941  0155 a101          	cp	a,#1
 942  0157 2710          	jreq	L104
 943                     ; 84         CRITICAL_END();
 945  0159 96            	ldw	x,sp
 946  015a 1c0001        	addw	x,#OFST-8
 948  015d f6            ld A,(X)
 949  015e 88            push A
 950  015f 86            pop CC
 952                     ; 85         printf("set_date fail!\n");
 954  0160 ae00a8        	ldw	x,#L742
 955  0163 cd0000        	call	_printf
 957                     ; 86         return;
 958  0166               L42:
 961  0166 5b09          	addw	sp,#9
 962  0168 81            	ret
 963  0169               L104:
 964                     ; 88     CRITICAL_END();
 966  0169 96            	ldw	x,sp
 967  016a 1c0001        	addw	x,#OFST-8
 969  016d f6            ld A,(X)
 970  016e 88            push A
 971  016f 86            pop CC
 973                     ; 90     msg.type = DISPLAY_CLOCK;
 975  0170 a601          	ld	a,#1
 976  0172 6b02          	ld	(OFST-7,sp),a
 977                     ; 91     msg.u.clock.hour = rtc_clock.RTC_Hours;
 979  0174 7b06          	ld	a,(OFST-3,sp)
 980  0176 6b03          	ld	(OFST-6,sp),a
 981                     ; 92     msg.u.clock.minute = rtc_clock.RTC_Minutes;
 983  0178 7b07          	ld	a,(OFST-2,sp)
 984  017a 6b04          	ld	(OFST-5,sp),a
 985                     ; 93     msg.u.clock.pm = rtc_clock.RTC_H12;
 987  017c 7b09          	ld	a,(OFST+0,sp)
 988  017e 6b05          	ld	(OFST-4,sp),a
 989                     ; 94     atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);;
 991  0180 96            	ldw	x,sp
 992  0181 1c0002        	addw	x,#OFST-7
 993  0184 89            	pushw	x
 994  0185 ae0000        	ldw	x,#0
 995  0188 89            	pushw	x
 996  0189 ae0000        	ldw	x,#0
 997  018c 89            	pushw	x
 998  018d be00          	ldw	x,_pt_display_queue
 999  018f cd0000        	call	_atomQueuePut
1001  0192 5b06          	addw	sp,#6
1002                     ; 95 }
1005  0194 20d0          	jra	L42
1060                     ; 97 static void get_clock(int32_t argc, char **argv)
1060                     ; 98 {
1061                     	switch	.text
1062  0196               L304_get_clock:
1064  0196 5205          	subw	sp,#5
1065       00000005      OFST:	set	5
1068                     ; 102     CRITICAL_START();
1070  0198 96            	ldw	x,sp
1071  0199 1c0001        	addw	x,#OFST-4
1073  019c 8a            push CC
1074  019d 84            pop a
1075  019e f7            ld (X),A
1076  019f 9b            sim
1078                     ; 103     RTC_GetTime(RTC_Format_BIN, &rtc_clock);
1080  01a0 96            	ldw	x,sp
1081  01a1 1c0002        	addw	x,#OFST-3
1082  01a4 89            	pushw	x
1083  01a5 4f            	clr	a
1084  01a6 cd0000        	call	_RTC_GetTime
1086  01a9 85            	popw	x
1087                     ; 104     CRITICAL_END();
1089  01aa 96            	ldw	x,sp
1090  01ab 1c0001        	addw	x,#OFST-4
1092  01ae f6            ld A,(X)
1093  01af 88            push A
1094  01b0 86            pop CC
1096                     ; 106     printf("current clock: %02d:%02d:%02d (%s)\n",
1096                     ; 107         rtc_clock.RTC_Hours, rtc_clock.RTC_Minutes, rtc_clock.RTC_Seconds,
1096                     ; 108         (rtc_clock.RTC_H12 == RTC_H12_AM) ? "AM" : "PM");
1098  01b1 0d05          	tnz	(OFST+0,sp)
1099  01b3 2605          	jrne	L03
1100  01b5 ae0048        	ldw	x,#L534
1101  01b8 2003          	jra	L23
1102  01ba               L03:
1103  01ba ae0045        	ldw	x,#L734
1104  01bd               L23:
1105  01bd 89            	pushw	x
1106  01be 7b06          	ld	a,(OFST+1,sp)
1107  01c0 88            	push	a
1108  01c1 7b06          	ld	a,(OFST+1,sp)
1109  01c3 88            	push	a
1110  01c4 7b06          	ld	a,(OFST+1,sp)
1111  01c6 88            	push	a
1112  01c7 ae004b        	ldw	x,#L334
1113  01ca cd0000        	call	_printf
1115  01cd 5b05          	addw	sp,#5
1116                     ; 109 }
1119  01cf 5b05          	addw	sp,#5
1120  01d1 81            	ret
1198                     ; 111 static cli_func find_cli_cmd(struct CLI_TAB *cli_tab, char *cmd)
1198                     ; 112 {
1199                     	switch	.text
1200  01d2               L144_find_cli_cmd:
1202  01d2 89            	pushw	x
1203       00000000      OFST:	set	0
1206  01d3 201d          	jra	L505
1207  01d5               L305:
1208                     ; 114         if (!strcmp(cli_tab->name, cmd)) {
1210  01d5 1e05          	ldw	x,(OFST+5,sp)
1211  01d7 89            	pushw	x
1212  01d8 1e03          	ldw	x,(OFST+3,sp)
1213  01da fe            	ldw	x,(x)
1214  01db cd0000        	call	_strcmp
1216  01de 5b02          	addw	sp,#2
1217  01e0 a30000        	cpw	x,#0
1218  01e3 2606          	jrne	L115
1219                     ; 115             return cli_tab->func;
1221  01e5 1e01          	ldw	x,(OFST+1,sp)
1222  01e7 ee02          	ldw	x,(2,x)
1224  01e9 200f          	jra	L63
1225  01eb               L115:
1226                     ; 117         cli_tab++;
1228  01eb 1e01          	ldw	x,(OFST+1,sp)
1229  01ed 1c0004        	addw	x,#4
1230  01f0 1f01          	ldw	(OFST+1,sp),x
1231  01f2               L505:
1232                     ; 113     while (cli_tab->name) {
1234  01f2 1e01          	ldw	x,(OFST+1,sp)
1235  01f4 e601          	ld	a,(1,x)
1236  01f6 fa            	or	a,(x)
1237  01f7 26dc          	jrne	L305
1238                     ; 119     return NULL;
1240  01f9 5f            	clrw	x
1242  01fa               L63:
1244  01fa 5b02          	addw	sp,#2
1245  01fc 81            	ret
1248                     	bsct
1249  0000               L315_cli_tab:
1250  0000 003c          	dc.w	L515
1252  0002 0000          	dc.w	L3_set_date
1253  0004 0033          	dc.w	L715
1255  0006 00b0          	dc.w	L152_get_date
1256  0008 0029          	dc.w	L125
1258  000a 00e2          	dc.w	L303_set_clock
1259  000c 001f          	dc.w	L325
1261  000e 0196          	dc.w	L304_get_clock
1262  0010 0000          	dc.w	0
1263  0012 0000          	dc.w	0
1330                     ; 135 void cli_thread(uint32_t param)
1330                     ; 136 {
1331                     	switch	.text
1332  01fd               _cli_thread:
1334  01fd 5208          	subw	sp,#8
1335       00000008      OFST:	set	8
1338                     ; 139     char **argv = (char **)string;
1340  01ff ae0000        	ldw	x,#L525_string
1341  0202 1f01          	ldw	(OFST-7,sp),x
1342  0204               L165:
1343                     ; 142         argc = scanf("%s %s %s %s %s", string[0], string[1], string[2], string[3], string[4]);
1345  0204 4b40          	push	#L525_string+64
1346  0206 4b30          	push	#L525_string+48
1347  0208 4b20          	push	#L525_string+32
1348  020a 4b10          	push	#L525_string+16
1349  020c 4b00          	push	#L525_string
1350  020e ae0010        	ldw	x,#L565
1351  0211 cd0000        	call	_scanf
1353  0214 5b05          	addw	sp,#5
1354  0216 cd0000        	call	c_itolx
1356  0219 96            	ldw	x,sp
1357  021a 1c0003        	addw	x,#OFST-5
1358  021d cd0000        	call	c_rtol
1360                     ; 143         f = find_cli_cmd(cli_tab, (char *)string[0]);
1362  0220 ae0000        	ldw	x,#L525_string
1363  0223 89            	pushw	x
1364  0224 ae0000        	ldw	x,#L315_cli_tab
1365  0227 ada9          	call	L144_find_cli_cmd
1367  0229 5b02          	addw	sp,#2
1368  022b 1f07          	ldw	(OFST-1,sp),x
1369                     ; 144         if (f) {
1371  022d 1e07          	ldw	x,(OFST-1,sp)
1372  022f 27d3          	jreq	L165
1373                     ; 145             f(argc, argv);
1375  0231 1e01          	ldw	x,(OFST-7,sp)
1376  0233 89            	pushw	x
1377  0234 1e07          	ldw	x,(OFST-1,sp)
1378  0236 89            	pushw	x
1379  0237 1e07          	ldw	x,(OFST-1,sp)
1380  0239 89            	pushw	x
1381  023a 1e0d          	ldw	x,(OFST+5,sp)
1382  023c fd            	call	(x)
1384  023d 5b06          	addw	sp,#6
1385  023f 20c3          	jra	L165
1423                     	switch	.ubsct
1424  0000               L525_string:
1425  0000 000000000000  	ds.b	80
1426                     	xdef	_cli_thread
1427                     	xref.b	_pt_display_queue
1428                     	xref	_atomQueuePut
1429                     	xref	_RTC_GetDate
1430                     	xref	_RTC_SetDate
1431                     	xref	_RTC_GetTime
1432                     	xref	_RTC_SetTime
1433                     	xref	_strcmp
1434                     	xref	_atoi
1435                     	xref	_scanf
1436                     	xref	_printf
1437                     	switch	.const
1438  0010               L565:
1439  0010 257320257320  	dc.b	"%s %s %s %s %s",0
1440  001f               L325:
1441  001f 6765745f636c  	dc.b	"get_clock",0
1442  0029               L125:
1443  0029 7365745f636c  	dc.b	"set_clock",0
1444  0033               L715:
1445  0033 6765745f6461  	dc.b	"get_date",0
1446  003c               L515:
1447  003c 7365745f6461  	dc.b	"set_date",0
1448  0045               L734:
1449  0045 504d00        	dc.b	"PM",0
1450  0048               L534:
1451  0048 414d00        	dc.b	"AM",0
1452  004b               L334:
1453  004b 63757272656e  	dc.b	"current clock: %02"
1454  005d 643a25303264  	dc.b	"d:%02d:%02d (%s)",10,0
1455  006f               L573:
1456  006f 7365745f636c  	dc.b	"set_clock hour min"
1457  0081 757465207365  	dc.b	"ute second",10,0
1458  008d               L103:
1459  008d 63757272656e  	dc.b	"current date: %d/%"
1460  009f 642f25642025  	dc.b	"d/%d %d",10,0
1461  00a8               L742:
1462  00a8 7365745f6461  	dc.b	"set_date fail!",10,0
1463  00b8               L142:
1464  00b8 7365745f6461  	dc.b	"set_date year mont"
1465  00ca 682064617920  	dc.b	"h day [week]",10,0
1466                     	xref.b	c_x
1486                     	xref	c_rtol
1487                     	xref	c_itolx
1488                     	xref	c_lcmp
1489                     	xref	c_ltor
1490                     	xref	c_xymvx
1491                     	end
