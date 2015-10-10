   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  37                     ; 38 static void rtc_alarm_init(void)
  37                     ; 39 {
  39                     	switch	.text
  40  0000               L12_rtc_alarm_init:
  44                     ; 40     CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
  46  0000 5f            	clrw	x
  47  0001 a610          	ld	a,#16
  48  0003 95            	ld	xh,a
  49  0004 cd0000        	call	_CLK_RTCClockConfig
  51                     ; 43     CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
  53  0007 ae0001        	ldw	x,#1
  54  000a a612          	ld	a,#18
  55  000c 95            	ld	xh,a
  56  000d cd0000        	call	_CLK_PeripheralClockConfig
  58                     ; 46     RTC_WakeUpClockConfig(RTC_WakeUpClock_CK_SPRE_16bits);
  60  0010 a604          	ld	a,#4
  61  0012 cd0000        	call	_RTC_WakeUpClockConfig
  63                     ; 48     RTC_ITConfig(RTC_IT_WUT, ENABLE);
  65  0015 4b01          	push	#1
  66  0017 ae0040        	ldw	x,#64
  67  001a cd0000        	call	_RTC_ITConfig
  69  001d 84            	pop	a
  71  001e               L34:
  72                     ; 50     while (RTC_WaitForSynchro() != SUCCESS);
  74  001e cd0000        	call	_RTC_WaitForSynchro
  76  0021 a101          	cp	a,#1
  77  0023 26f9          	jrne	L34
  78                     ; 51 }
  81  0025 81            	ret
 546                     ; 53 static void main_thread(uint32_t param)
 546                     ; 54 {
 547                     	switch	.text
 548  0026               L74_main_thread:
 550  0026 520d          	subw	sp,#13
 551       0000000d      OFST:	set	13
 554                     ; 60     rtc_alarm_init();
 556  0028 add6          	call	L12_rtc_alarm_init
 558  002a               L123:
 559                     ; 64             CRITICAL_START();
 561  002a 96            	ldw	x,sp
 562  002b 1c0005        	addw	x,#OFST-8
 564  002e 8a            push CC
 565  002f 84            pop a
 566  0030 f7            ld (X),A
 567  0031 9b            sim
 569                     ; 65             RTC_GetDate(RTC_Format_BIN, &date);
 571  0032 96            	ldw	x,sp
 572  0033 1c0001        	addw	x,#OFST-12
 573  0036 89            	pushw	x
 574  0037 4f            	clr	a
 575  0038 cd0000        	call	_RTC_GetDate
 577  003b 85            	popw	x
 578                     ; 66             CRITICAL_END();
 580  003c 96            	ldw	x,sp
 581  003d 1c0005        	addw	x,#OFST-8
 583  0040 f6            ld A,(X)
 584  0041 88            push A
 585  0042 86            pop CC
 587                     ; 68             msg.type = DISPLAY_DATE;
 589  0043 0f0a          	clr	(OFST-3,sp)
 590                     ; 69             msg.u.date.month = date.RTC_Month;
 592  0045 7b02          	ld	a,(OFST-11,sp)
 593  0047 6b0b          	ld	(OFST-2,sp),a
 594                     ; 70             msg.u.date.day = date.RTC_Date;
 596  0049 7b03          	ld	a,(OFST-10,sp)
 597  004b 6b0c          	ld	(OFST-1,sp),a
 598                     ; 71             atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
 600  004d 96            	ldw	x,sp
 601  004e 1c000a        	addw	x,#OFST-3
 602  0051 89            	pushw	x
 603  0052 ae0000        	ldw	x,#0
 604  0055 89            	pushw	x
 605  0056 ae0000        	ldw	x,#0
 606  0059 89            	pushw	x
 607  005a be00          	ldw	x,_pt_display_queue
 608  005c cd0000        	call	_atomQueuePut
 610  005f 5b06          	addw	sp,#6
 611                     ; 74             CRITICAL_START();
 613  0061 96            	ldw	x,sp
 614  0062 1c0005        	addw	x,#OFST-8
 616  0065 8a            push CC
 617  0066 84            pop a
 618  0067 f7            ld (X),A
 619  0068 9b            sim
 621                     ; 75             RTC_GetTime(RTC_Format_BIN, &clock);
 623  0069 96            	ldw	x,sp
 624  006a 1c0006        	addw	x,#OFST-7
 625  006d 89            	pushw	x
 626  006e 4f            	clr	a
 627  006f cd0000        	call	_RTC_GetTime
 629  0072 85            	popw	x
 630                     ; 76             CRITICAL_END();
 632  0073 96            	ldw	x,sp
 633  0074 1c0005        	addw	x,#OFST-8
 635  0077 f6            ld A,(X)
 636  0078 88            push A
 637  0079 86            pop CC
 639                     ; 78             msg.type = DISPLAY_CLOCK;
 641  007a a601          	ld	a,#1
 642  007c 6b0a          	ld	(OFST-3,sp),a
 643                     ; 79             msg.u.clock.hour = clock.RTC_Hours;
 645  007e 7b06          	ld	a,(OFST-7,sp)
 646  0080 6b0b          	ld	(OFST-2,sp),a
 647                     ; 80             msg.u.clock.minute = clock.RTC_Minutes;
 649  0082 7b07          	ld	a,(OFST-6,sp)
 650  0084 6b0c          	ld	(OFST-1,sp),a
 651                     ; 81             msg.u.clock.pm = clock.RTC_H12;
 653  0086 7b09          	ld	a,(OFST-4,sp)
 654  0088 6b0d          	ld	(OFST+0,sp),a
 655                     ; 82             atomQueuePut(pt_display_queue, 0, (uint8_t *)&msg);
 657  008a 96            	ldw	x,sp
 658  008b 1c000a        	addw	x,#OFST-3
 659  008e 89            	pushw	x
 660  008f ae0000        	ldw	x,#0
 661  0092 89            	pushw	x
 662  0093 ae0000        	ldw	x,#0
 663  0096 89            	pushw	x
 664  0097 be00          	ldw	x,_pt_display_queue
 665  0099 cd0000        	call	_atomQueuePut
 667  009c 5b06          	addw	sp,#6
 668                     ; 84         atomTimerDelay(10 * SYSTEM_TICKS_PER_SEC);
 670  009e ae04e2        	ldw	x,#1250
 671  00a1 89            	pushw	x
 672  00a2 ae0000        	ldw	x,#0
 673  00a5 89            	pushw	x
 674  00a6 cd0000        	call	_atomTimerDelay
 676  00a9 5b04          	addw	sp,#4
 678  00ab ac2a002a      	jpf	L123
 705                     ; 88 static void uart_init(void)
 705                     ; 89 {
 706                     	switch	.text
 707  00af               L523_uart_init:
 711                     ; 90     SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
 713  00af 4b01          	push	#1
 714  00b1 ae011c        	ldw	x,#284
 715  00b4 cd0000        	call	_SYSCFG_REMAPPinConfig
 717  00b7 84            	pop	a
 718                     ; 91     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 720  00b8 ae0001        	ldw	x,#1
 721  00bb a605          	ld	a,#5
 722  00bd 95            	ld	xh,a
 723  00be cd0000        	call	_CLK_PeripheralClockConfig
 725                     ; 92     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 727  00c1 4b01          	push	#1
 728  00c3 4b04          	push	#4
 729  00c5 ae5000        	ldw	x,#20480
 730  00c8 cd0000        	call	_GPIO_ExternalPullUpConfig
 732  00cb 85            	popw	x
 733                     ; 93     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 735  00cc 4b01          	push	#1
 736  00ce 4b08          	push	#8
 737  00d0 ae5000        	ldw	x,#20480
 738  00d3 cd0000        	call	_GPIO_ExternalPullUpConfig
 740  00d6 85            	popw	x
 741                     ; 94     USART_Init(USART1, 115200,
 741                     ; 95                USART_WordLength_8b,
 741                     ; 96                USART_StopBits_1,
 741                     ; 97                USART_Parity_No,
 741                     ; 98                (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 743  00d7 4b0c          	push	#12
 744  00d9 4b00          	push	#0
 745  00db 4b00          	push	#0
 746  00dd 4b00          	push	#0
 747  00df aec200        	ldw	x,#49664
 748  00e2 89            	pushw	x
 749  00e3 ae0001        	ldw	x,#1
 750  00e6 89            	pushw	x
 751  00e7 ae5230        	ldw	x,#21040
 752  00ea cd0000        	call	_USART_Init
 754  00ed 5b08          	addw	sp,#8
 755                     ; 99 }
 758  00ef 81            	ret
 813                     ; 102 void main(void)
 813                     ; 103 {
 814                     	switch	.text
 815  00f0               _main:
 817  00f0 88            	push	a
 818       00000001      OFST:	set	1
 821                     ; 106     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 823  00f1 4f            	clr	a
 824  00f2 cd0000        	call	_CLK_SYSCLKDivConfig
 826                     ; 108     uart_init();
 828  00f5 adb8          	call	L523_uart_init
 830                     ; 110     enableInterrupts();
 833  00f7 9a            rim
 835                     ; 112     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE - 1], IDLE_STACK_SIZE);
 838  00f8 ae0080        	ldw	x,#128
 839  00fb 89            	pushw	x
 840  00fc ae0000        	ldw	x,#0
 841  00ff 89            	pushw	x
 842  0100 ae037f        	ldw	x,#L3_idle_thread_stack+127
 843  0103 cd0000        	call	_atomOSInit
 845  0106 5b04          	addw	sp,#4
 846  0108 6b01          	ld	(OFST+0,sp),a
 847                     ; 113     if (status != ATOM_OK) {
 849  010a 0d01          	tnz	(OFST+0,sp)
 850  010c 2709          	jreq	L753
 851                     ; 114         printf("atomOSInit failed!\n");
 853  010e ae007b        	ldw	x,#L163
 854  0111 cd0000        	call	_printf
 856                     ; 115         goto err;
 858  0114 cc01ad        	jra	L733
 859  0117               L753:
 860                     ; 118     archInitSystemTickTimer();
 862  0117 cd0000        	call	_archInitSystemTickTimer
 864                     ; 120     status = atomThreadCreate(&main_tcb,
 864                     ; 121                               MAIN_THREAD_PRIO, main_thread, 0,
 864                     ; 122                               &main_thread_stack[MAIN_STACK_SIZE - 1],
 864                     ; 123                               MAIN_STACK_SIZE);
 866  011a ae0100        	ldw	x,#256
 867  011d 89            	pushw	x
 868  011e ae0000        	ldw	x,#0
 869  0121 89            	pushw	x
 870  0122 ae02ff        	ldw	x,#L5_main_thread_stack+255
 871  0125 89            	pushw	x
 872  0126 ae0000        	ldw	x,#0
 873  0129 89            	pushw	x
 874  012a ae0000        	ldw	x,#0
 875  012d 89            	pushw	x
 876  012e ae0026        	ldw	x,#L74_main_thread
 877  0131 89            	pushw	x
 878  0132 4b0f          	push	#15
 879  0134 ae0022        	ldw	x,#L31_main_tcb
 880  0137 cd0000        	call	_atomThreadCreate
 882  013a 5b0d          	addw	sp,#13
 883  013c 6b01          	ld	(OFST+0,sp),a
 884                     ; 124     if (status != ATOM_OK) {
 886  013e 0d01          	tnz	(OFST+0,sp)
 887  0140 2708          	jreq	L363
 888                     ; 125         printf("atomThreadCreate main_thread failed!\n");
 890  0142 ae0055        	ldw	x,#L563
 891  0145 cd0000        	call	_printf
 893                     ; 126         goto err;
 895  0148 2063          	jra	L733
 896  014a               L363:
 897                     ; 129     status = atomThreadCreate(&display_tcb,
 897                     ; 130                               DISPLAY_THREAD_PRIO, display_thread, 0,
 897                     ; 131                               &display_thread_stack[DISPLAY_STACK_SIZE - 1],
 897                     ; 132                               DISPLAY_STACK_SIZE);
 899  014a ae0100        	ldw	x,#256
 900  014d 89            	pushw	x
 901  014e ae0000        	ldw	x,#0
 902  0151 89            	pushw	x
 903  0152 ae00ff        	ldw	x,#L11_display_thread_stack+255
 904  0155 89            	pushw	x
 905  0156 ae0000        	ldw	x,#0
 906  0159 89            	pushw	x
 907  015a ae0000        	ldw	x,#0
 908  015d 89            	pushw	x
 909  015e ae0000        	ldw	x,#_display_thread
 910  0161 89            	pushw	x
 911  0162 4b10          	push	#16
 912  0164 ae0000        	ldw	x,#L71_display_tcb
 913  0167 cd0000        	call	_atomThreadCreate
 915  016a 5b0d          	addw	sp,#13
 916  016c 6b01          	ld	(OFST+0,sp),a
 917                     ; 133     if (status != ATOM_OK) {
 919  016e 0d01          	tnz	(OFST+0,sp)
 920  0170 2708          	jreq	L763
 921                     ; 134         printf("atomThreadCreate display_thread failed!\n");
 923  0172 ae002c        	ldw	x,#L173
 924  0175 cd0000        	call	_printf
 926                     ; 135         goto err;
 928  0178 2033          	jra	L733
 929  017a               L763:
 930                     ; 138     status = atomThreadCreate(&cli_tcb,
 930                     ; 139                               CLI_THREAD_PRIO, cli_thread, 0,
 930                     ; 140                               &cli_thread_stack[CLI_STACK_SIZE - 1],
 930                     ; 141                               CLI_STACK_SIZE);
 932  017a ae0100        	ldw	x,#256
 933  017d 89            	pushw	x
 934  017e ae0000        	ldw	x,#0
 935  0181 89            	pushw	x
 936  0182 ae01ff        	ldw	x,#L7_cli_thread_stack+255
 937  0185 89            	pushw	x
 938  0186 ae0000        	ldw	x,#0
 939  0189 89            	pushw	x
 940  018a ae0000        	ldw	x,#0
 941  018d 89            	pushw	x
 942  018e ae0000        	ldw	x,#_cli_thread
 943  0191 89            	pushw	x
 944  0192 4b11          	push	#17
 945  0194 ae0011        	ldw	x,#L51_cli_tcb
 946  0197 cd0000        	call	_atomThreadCreate
 948  019a 5b0d          	addw	sp,#13
 949  019c 6b01          	ld	(OFST+0,sp),a
 950                     ; 142     if (status != ATOM_OK) {
 952  019e 0d01          	tnz	(OFST+0,sp)
 953  01a0 2708          	jreq	L373
 954                     ; 143         printf("atomThreadCreate cli_thread failed!\n");
 956  01a2 ae0007        	ldw	x,#L573
 957  01a5 cd0000        	call	_printf
 959                     ; 144         goto err;
 961  01a8 2003          	jra	L733
 962  01aa               L373:
 963                     ; 157     atomOSStart();
 965  01aa cd0000        	call	_atomOSStart
 967  01ad               L733:
 968                     ; 159 err:
 968                     ; 160     printf("Oops!\n");
 970  01ad ae0000        	ldw	x,#L773
 971  01b0 cd0000        	call	_printf
 973  01b3               L104:
 974                     ; 161     while (1);
 976  01b3 20fe          	jra	L104
1010                     ; 164 void delay(__IO uint16_t nCount)
1010                     ; 165 {
1011                     	switch	.text
1012  01b5               _delay:
1014  01b5 89            	pushw	x
1015       00000000      OFST:	set	0
1018  01b6 2007          	jra	L524
1019  01b8               L324:
1020                     ; 167         nCount--;
1022  01b8 1e01          	ldw	x,(OFST+1,sp)
1023  01ba 1d0001        	subw	x,#1
1024  01bd 1f01          	ldw	(OFST+1,sp),x
1025  01bf               L524:
1026                     ; 166     while (nCount) {
1028  01bf 1e01          	ldw	x,(OFST+1,sp)
1029  01c1 26f5          	jrne	L324
1030                     ; 169 }
1033  01c3 85            	popw	x
1034  01c4 81            	ret
1260                     	xdef	_main
1261                     	xdef	_delay
1262                     	switch	.ubsct
1263  0000               L71_display_tcb:
1264  0000 000000000000  	ds.b	17
1265  0011               L51_cli_tcb:
1266  0011 000000000000  	ds.b	17
1267  0022               L31_main_tcb:
1268  0022 000000000000  	ds.b	17
1269                     	switch	.bss
1270  0000               L11_display_thread_stack:
1271  0000 000000000000  	ds.b	256
1272  0100               L7_cli_thread_stack:
1273  0100 000000000000  	ds.b	256
1274  0200               L5_main_thread_stack:
1275  0200 000000000000  	ds.b	256
1276  0300               L3_idle_thread_stack:
1277  0300 000000000000  	ds.b	128
1278                     	xref	_cli_thread
1279                     	xref	_display_thread
1280                     	xref.b	_pt_display_queue
1281                     	xref	_archInitSystemTickTimer
1282                     	xref	_atomQueuePut
1283                     	xref	_atomThreadCreate
1284                     	xref	_atomOSStart
1285                     	xref	_atomOSInit
1286                     	xref	_atomTimerDelay
1287                     	xref	_USART_Init
1288                     	xref	_SYSCFG_REMAPPinConfig
1289                     	xref	_RTC_ITConfig
1290                     	xref	_RTC_WakeUpClockConfig
1291                     	xref	_RTC_GetDate
1292                     	xref	_RTC_GetTime
1293                     	xref	_RTC_WaitForSynchro
1294                     	xref	_GPIO_ExternalPullUpConfig
1295                     	xref	_CLK_PeripheralClockConfig
1296                     	xref	_CLK_RTCClockConfig
1297                     	xref	_CLK_SYSCLKDivConfig
1298                     	xref	_printf
1299                     .const:	section	.text
1300  0000               L773:
1301  0000 4f6f7073210a  	dc.b	"Oops!",10,0
1302  0007               L573:
1303  0007 61746f6d5468  	dc.b	"atomThreadCreate c"
1304  0019 6c695f746872  	dc.b	"li_thread failed!",10,0
1305  002c               L173:
1306  002c 61746f6d5468  	dc.b	"atomThreadCreate d"
1307  003e 6973706c6179  	dc.b	"isplay_thread fail"
1308  0050 6564210a00    	dc.b	"ed!",10,0
1309  0055               L563:
1310  0055 61746f6d5468  	dc.b	"atomThreadCreate m"
1311  0067 61696e5f7468  	dc.b	"ain_thread failed!"
1312  0079 0a00          	dc.b	10,0
1313  007b               L163:
1314  007b 61746f6d4f53  	dc.b	"atomOSInit failed!"
1315  008d 0a00          	dc.b	10,0
1335                     	end
