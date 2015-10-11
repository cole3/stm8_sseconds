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
  84                     	bsct
  85  0000               _count:
  86  0000 00000000      	dc.l	0
 140                     ; 55 static void main_thread(uint32_t param)
 140                     ; 56 {
 141                     	switch	.text
 142  0026               L74_main_thread:
 144  0026 5206          	subw	sp,#6
 145       00000006      OFST:	set	6
 148                     ; 61     int32_t count_main = 0;
 150  0028 ae0000        	ldw	x,#0
 151  002b 1f03          	ldw	(OFST-3,sp),x
 152  002d ae0000        	ldw	x,#0
 153  0030 1f01          	ldw	(OFST-5,sp),x
 154                     ; 64     rtc_alarm_init();
 156  0032 adcc          	call	L12_rtc_alarm_init
 158                     ; 66     printf("[main_thread] enter\n");
 160  0034 ae00de        	ldw	x,#L77
 161  0037 cd0000        	call	_printf
 163  003a               L101:
 164                     ; 69         count++;
 166  003a ae0000        	ldw	x,#_count
 167  003d a601          	ld	a,#1
 168  003f cd0000        	call	c_lgadc
 170                     ; 70         printf("[main_thread] count = %d\n", (int16_t)count);
 172  0042 be02          	ldw	x,_count+2
 173  0044 89            	pushw	x
 174  0045 ae00c4        	ldw	x,#L501
 175  0048 cd0000        	call	_printf
 177  004b 85            	popw	x
 178                     ; 71         printf("[main_thread] count: ");
 180  004c ae00ae        	ldw	x,#L701
 181  004f cd0000        	call	_printf
 183                     ; 72         for (i=0; i<count; i++) {
 185  0052 5f            	clrw	x
 186  0053 1f05          	ldw	(OFST-1,sp),x
 188  0055 200d          	jra	L511
 189  0057               L111:
 190                     ; 73              printf("+");
 192  0057 ae00ac        	ldw	x,#L121
 193  005a cd0000        	call	_printf
 195                     ; 72         for (i=0; i<count; i++) {
 197  005d 1e05          	ldw	x,(OFST-1,sp)
 198  005f 1c0001        	addw	x,#1
 199  0062 1f05          	ldw	(OFST-1,sp),x
 200  0064               L511:
 203  0064 9c            	rvf
 204  0065 1e05          	ldw	x,(OFST-1,sp)
 205  0067 cd0000        	call	c_itolx
 207  006a ae0000        	ldw	x,#_count
 208  006d cd0000        	call	c_lcmp
 210  0070 2fe5          	jrslt	L111
 211                     ; 75         printf("\n");
 213  0072 ae00aa        	ldw	x,#L321
 214  0075 cd0000        	call	_printf
 216                     ; 76         count_main++;
 218  0078 96            	ldw	x,sp
 219  0079 1c0001        	addw	x,#OFST-5
 220  007c a601          	ld	a,#1
 221  007e cd0000        	call	c_lgadc
 223                     ; 77         printf("[main_thread] count_main: ");
 225  0081 ae008f        	ldw	x,#L521
 226  0084 cd0000        	call	_printf
 228                     ; 78         for (i=0; i<count_main; i++) {
 230  0087 5f            	clrw	x
 231  0088 1f05          	ldw	(OFST-1,sp),x
 233  008a 200d          	jra	L331
 234  008c               L721:
 235                     ; 79              printf("+");
 237  008c ae00ac        	ldw	x,#L121
 238  008f cd0000        	call	_printf
 240                     ; 78         for (i=0; i<count_main; i++) {
 242  0092 1e05          	ldw	x,(OFST-1,sp)
 243  0094 1c0001        	addw	x,#1
 244  0097 1f05          	ldw	(OFST-1,sp),x
 245  0099               L331:
 248  0099 9c            	rvf
 249  009a 1e05          	ldw	x,(OFST-1,sp)
 250  009c cd0000        	call	c_itolx
 252  009f 96            	ldw	x,sp
 253  00a0 1c0001        	addw	x,#OFST-5
 254  00a3 cd0000        	call	c_lcmp
 256  00a6 2fe4          	jrslt	L721
 257                     ; 81         printf("\n");
 259  00a8 ae00aa        	ldw	x,#L321
 260  00ab cd0000        	call	_printf
 262                     ; 105         atomTimerDelay(4* SYSTEM_TICKS_PER_SEC);
 264  00ae ae01f4        	ldw	x,#500
 265  00b1 89            	pushw	x
 266  00b2 ae0000        	ldw	x,#0
 267  00b5 89            	pushw	x
 268  00b6 cd0000        	call	_atomTimerDelay
 270  00b9 5b04          	addw	sp,#4
 272  00bb cc003a        	jra	L101
 299                     ; 109 static void uart_init(void)
 299                     ; 110 {
 300                     	switch	.text
 301  00be               L731_uart_init:
 305                     ; 111     SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
 307  00be 4b01          	push	#1
 308  00c0 ae011c        	ldw	x,#284
 309  00c3 cd0000        	call	_SYSCFG_REMAPPinConfig
 311  00c6 84            	pop	a
 312                     ; 112     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 314  00c7 ae0001        	ldw	x,#1
 315  00ca a605          	ld	a,#5
 316  00cc 95            	ld	xh,a
 317  00cd cd0000        	call	_CLK_PeripheralClockConfig
 319                     ; 113     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 321  00d0 4b01          	push	#1
 322  00d2 4b04          	push	#4
 323  00d4 ae5000        	ldw	x,#20480
 324  00d7 cd0000        	call	_GPIO_ExternalPullUpConfig
 326  00da 85            	popw	x
 327                     ; 114     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 329  00db 4b01          	push	#1
 330  00dd 4b08          	push	#8
 331  00df ae5000        	ldw	x,#20480
 332  00e2 cd0000        	call	_GPIO_ExternalPullUpConfig
 334  00e5 85            	popw	x
 335                     ; 115     USART_Init(USART1, 115200,
 335                     ; 116                USART_WordLength_8b,
 335                     ; 117                USART_StopBits_1,
 335                     ; 118                USART_Parity_No,
 335                     ; 119                (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 337  00e6 4b0c          	push	#12
 338  00e8 4b00          	push	#0
 339  00ea 4b00          	push	#0
 340  00ec 4b00          	push	#0
 341  00ee aec200        	ldw	x,#49664
 342  00f1 89            	pushw	x
 343  00f2 ae0001        	ldw	x,#1
 344  00f5 89            	pushw	x
 345  00f6 ae5230        	ldw	x,#21040
 346  00f9 cd0000        	call	_USART_Init
 348  00fc 5b08          	addw	sp,#8
 349                     ; 120 }
 352  00fe 81            	ret
 417                     ; 123 void main(void)
 417                     ; 124 {
 418                     	switch	.text
 419  00ff               _main:
 421  00ff 89            	pushw	x
 422       00000002      OFST:	set	2
 425                     ; 126     uint8_t c = 0;
 427  0100 0f01          	clr	(OFST-1,sp)
 428                     ; 128     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 430  0102 4f            	clr	a
 431  0103 cd0000        	call	_CLK_SYSCLKDivConfig
 433                     ; 130     uart_init();
 435  0106 adb6          	call	L731_uart_init
 437                     ; 132     USART_SendData8(USART1, 'A');
 439  0108 4b41          	push	#65
 440  010a ae5230        	ldw	x,#21040
 441  010d cd0000        	call	_USART_SendData8
 443  0110 84            	pop	a
 444                     ; 134     enableInterrupts();
 447  0111 9a            rim
 449                     ; 136     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE - 1], IDLE_STACK_SIZE);
 452  0112 ae0080        	ldw	x,#128
 453  0115 89            	pushw	x
 454  0116 ae0000        	ldw	x,#0
 455  0119 89            	pushw	x
 456  011a ae027f        	ldw	x,#L3_idle_thread_stack+127
 457  011d cd0000        	call	_atomOSInit
 459  0120 5b04          	addw	sp,#4
 460  0122 6b02          	ld	(OFST+0,sp),a
 461                     ; 137     if (status != ATOM_OK) {
 463  0124 0d02          	tnz	(OFST+0,sp)
 464  0126 2709          	jreq	L571
 465                     ; 138         printf("atomOSInit failed!\n");
 467  0128 ae007b        	ldw	x,#L771
 468  012b cd0000        	call	_printf
 470                     ; 139         goto err;
 472  012e cc01c7        	jra	L151
 473  0131               L571:
 474                     ; 142     archInitSystemTickTimer();
 476  0131 cd0000        	call	_archInitSystemTickTimer
 478                     ; 144     status = atomThreadCreate(&main_tcb,
 478                     ; 145                               MAIN_THREAD_PRIO, main_thread, 0,
 478                     ; 146                               &main_thread_stack[MAIN_STACK_SIZE - 1],
 478                     ; 147                               MAIN_STACK_SIZE);
 480  0134 ae0100        	ldw	x,#256
 481  0137 89            	pushw	x
 482  0138 ae0000        	ldw	x,#0
 483  013b 89            	pushw	x
 484  013c ae01ff        	ldw	x,#L5_main_thread_stack+255
 485  013f 89            	pushw	x
 486  0140 ae0000        	ldw	x,#0
 487  0143 89            	pushw	x
 488  0144 ae0000        	ldw	x,#0
 489  0147 89            	pushw	x
 490  0148 ae0026        	ldw	x,#L74_main_thread
 491  014b 89            	pushw	x
 492  014c 4b0f          	push	#15
 493  014e ae0022        	ldw	x,#L31_main_tcb
 494  0151 cd0000        	call	_atomThreadCreate
 496  0154 5b0d          	addw	sp,#13
 497  0156 6b02          	ld	(OFST+0,sp),a
 498                     ; 148     if (status != ATOM_OK) {
 500  0158 0d02          	tnz	(OFST+0,sp)
 501  015a 2708          	jreq	L102
 502                     ; 149         printf("atomThreadCreate main_thread failed!\n");
 504  015c ae0055        	ldw	x,#L302
 505  015f cd0000        	call	_printf
 507                     ; 150         goto err;
 509  0162 2063          	jra	L151
 510  0164               L102:
 511                     ; 153     status = atomThreadCreate(&display_tcb,
 511                     ; 154                               DISPLAY_THREAD_PRIO, display_thread, 0,
 511                     ; 155                               &display_thread_stack[DISPLAY_STACK_SIZE - 1],
 511                     ; 156                               DISPLAY_STACK_SIZE);
 513  0164 ae0080        	ldw	x,#128
 514  0167 89            	pushw	x
 515  0168 ae0000        	ldw	x,#0
 516  016b 89            	pushw	x
 517  016c ae007f        	ldw	x,#L11_display_thread_stack+127
 518  016f 89            	pushw	x
 519  0170 ae0000        	ldw	x,#0
 520  0173 89            	pushw	x
 521  0174 ae0000        	ldw	x,#0
 522  0177 89            	pushw	x
 523  0178 ae0000        	ldw	x,#_display_thread
 524  017b 89            	pushw	x
 525  017c 4b10          	push	#16
 526  017e ae0000        	ldw	x,#L71_display_tcb
 527  0181 cd0000        	call	_atomThreadCreate
 529  0184 5b0d          	addw	sp,#13
 530  0186 6b02          	ld	(OFST+0,sp),a
 531                     ; 157     if (status != ATOM_OK) {
 533  0188 0d02          	tnz	(OFST+0,sp)
 534  018a 2708          	jreq	L502
 535                     ; 158         printf("atomThreadCreate display_thread failed!\n");
 537  018c ae002c        	ldw	x,#L702
 538  018f cd0000        	call	_printf
 540                     ; 159         goto err;
 542  0192 2033          	jra	L151
 543  0194               L502:
 544                     ; 162     status = atomThreadCreate(&cli_tcb,
 544                     ; 163                               CLI_THREAD_PRIO, cli_thread, 0,
 544                     ; 164                               &cli_thread_stack[CLI_STACK_SIZE - 1],
 544                     ; 165                               CLI_STACK_SIZE);
 546  0194 ae0080        	ldw	x,#128
 547  0197 89            	pushw	x
 548  0198 ae0000        	ldw	x,#0
 549  019b 89            	pushw	x
 550  019c ae00ff        	ldw	x,#L7_cli_thread_stack+127
 551  019f 89            	pushw	x
 552  01a0 ae0000        	ldw	x,#0
 553  01a3 89            	pushw	x
 554  01a4 ae0000        	ldw	x,#0
 555  01a7 89            	pushw	x
 556  01a8 ae0000        	ldw	x,#_cli_thread
 557  01ab 89            	pushw	x
 558  01ac 4b11          	push	#17
 559  01ae ae0011        	ldw	x,#L51_cli_tcb
 560  01b1 cd0000        	call	_atomThreadCreate
 562  01b4 5b0d          	addw	sp,#13
 563  01b6 6b02          	ld	(OFST+0,sp),a
 564                     ; 166     if (status != ATOM_OK) {
 566  01b8 0d02          	tnz	(OFST+0,sp)
 567  01ba 2708          	jreq	L112
 568                     ; 167         printf("atomThreadCreate cli_thread failed!\n");
 570  01bc ae0007        	ldw	x,#L312
 571  01bf cd0000        	call	_printf
 573                     ; 168         goto err;
 575  01c2 2003          	jra	L151
 576  01c4               L112:
 577                     ; 181     atomOSStart();
 579  01c4 cd0000        	call	_atomOSStart
 581  01c7               L151:
 582                     ; 183 err:
 582                     ; 184     printf("Oops!\n");
 584  01c7 ae0000        	ldw	x,#L512
 585  01ca cd0000        	call	_printf
 587  01cd               L712:
 588                     ; 185     while (1);
 590  01cd 20fe          	jra	L712
 624                     ; 188 void delay(__IO uint16_t nCount)
 624                     ; 189 {
 625                     	switch	.text
 626  01cf               _delay:
 628  01cf 89            	pushw	x
 629       00000000      OFST:	set	0
 632  01d0 2007          	jra	L342
 633  01d2               L142:
 634                     ; 191         nCount--;
 636  01d2 1e01          	ldw	x,(OFST+1,sp)
 637  01d4 1d0001        	subw	x,#1
 638  01d7 1f01          	ldw	(OFST+1,sp),x
 639  01d9               L342:
 640                     ; 190     while (nCount) {
 642  01d9 1e01          	ldw	x,(OFST+1,sp)
 643  01db 26f5          	jrne	L142
 644                     ; 193 }
 647  01dd 85            	popw	x
 648  01de 81            	ret
 883                     	xdef	_main
 884                     	xdef	_count
 885                     	xdef	_delay
 886                     	switch	.ubsct
 887  0000               L71_display_tcb:
 888  0000 000000000000  	ds.b	17
 889  0011               L51_cli_tcb:
 890  0011 000000000000  	ds.b	17
 891  0022               L31_main_tcb:
 892  0022 000000000000  	ds.b	17
 893                     	switch	.bss
 894  0000               L11_display_thread_stack:
 895  0000 000000000000  	ds.b	128
 896  0080               L7_cli_thread_stack:
 897  0080 000000000000  	ds.b	128
 898  0100               L5_main_thread_stack:
 899  0100 000000000000  	ds.b	256
 900  0200               L3_idle_thread_stack:
 901  0200 000000000000  	ds.b	128
 902                     	xref	_cli_thread
 903                     	xref	_display_thread
 904                     	xref	_archInitSystemTickTimer
 905                     	xref	_atomThreadCreate
 906                     	xref	_atomOSStart
 907                     	xref	_atomOSInit
 908                     	xref	_atomTimerDelay
 909                     	xref	_USART_SendData8
 910                     	xref	_USART_Init
 911                     	xref	_SYSCFG_REMAPPinConfig
 912                     	xref	_RTC_ITConfig
 913                     	xref	_RTC_WakeUpClockConfig
 914                     	xref	_RTC_WaitForSynchro
 915                     	xref	_GPIO_ExternalPullUpConfig
 916                     	xref	_CLK_PeripheralClockConfig
 917                     	xref	_CLK_RTCClockConfig
 918                     	xref	_CLK_SYSCLKDivConfig
 919                     	xref	_printf
 920                     .const:	section	.text
 921  0000               L512:
 922  0000 4f6f7073210a  	dc.b	"Oops!",10,0
 923  0007               L312:
 924  0007 61746f6d5468  	dc.b	"atomThreadCreate c"
 925  0019 6c695f746872  	dc.b	"li_thread failed!",10,0
 926  002c               L702:
 927  002c 61746f6d5468  	dc.b	"atomThreadCreate d"
 928  003e 6973706c6179  	dc.b	"isplay_thread fail"
 929  0050 6564210a00    	dc.b	"ed!",10,0
 930  0055               L302:
 931  0055 61746f6d5468  	dc.b	"atomThreadCreate m"
 932  0067 61696e5f7468  	dc.b	"ain_thread failed!"
 933  0079 0a00          	dc.b	10,0
 934  007b               L771:
 935  007b 61746f6d4f53  	dc.b	"atomOSInit failed!"
 936  008d 0a00          	dc.b	10,0
 937  008f               L521:
 938  008f 5b6d61696e5f  	dc.b	"[main_thread] coun"
 939  00a1 745f6d61696e  	dc.b	"t_main: ",0
 940  00aa               L321:
 941  00aa 0a00          	dc.b	10,0
 942  00ac               L121:
 943  00ac 2b00          	dc.b	"+",0
 944  00ae               L701:
 945  00ae 5b6d61696e5f  	dc.b	"[main_thread] coun"
 946  00c0 743a2000      	dc.b	"t: ",0
 947  00c4               L501:
 948  00c4 5b6d61696e5f  	dc.b	"[main_thread] coun"
 949  00d6 74203d202564  	dc.b	"t = %d",10,0
 950  00de               L77:
 951  00de 5b6d61696e5f  	dc.b	"[main_thread] ente"
 952  00f0 720a00        	dc.b	"r",10,0
 972                     	xref	c_lcmp
 973                     	xref	c_itolx
 974                     	xref	c_lgadc
 975                     	end
