   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  44                     ; 38 static void main_thread(uint32_t param)
  44                     ; 39 {
  46                     	switch	.text
  47  0000               L12_main_thread:
  51  0000               L74:
  52                     ; 41         atomTimerDelay(SYSTEM_TICKS_PER_SEC);
  54  0000 ae007d        	ldw	x,#125
  55  0003 89            	pushw	x
  56  0004 ae0000        	ldw	x,#0
  57  0007 89            	pushw	x
  58  0008 cd0000        	call	_atomTimerDelay
  60  000b 5b04          	addw	sp,#4
  62  000d 20f1          	jra	L74
  89                     ; 45 static void uart_init(void)
  89                     ; 46 {
  90                     	switch	.text
  91  000f               L35_uart_init:
  95                     ; 47     SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
  97  000f 4b01          	push	#1
  98  0011 ae011c        	ldw	x,#284
  99  0014 cd0000        	call	_SYSCFG_REMAPPinConfig
 101  0017 84            	pop	a
 102                     ; 48     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 104  0018 ae0001        	ldw	x,#1
 105  001b a605          	ld	a,#5
 106  001d 95            	ld	xh,a
 107  001e cd0000        	call	_CLK_PeripheralClockConfig
 109                     ; 49     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
 111  0021 4b01          	push	#1
 112  0023 4b04          	push	#4
 113  0025 ae5000        	ldw	x,#20480
 114  0028 cd0000        	call	_GPIO_ExternalPullUpConfig
 116  002b 85            	popw	x
 117                     ; 50     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
 119  002c 4b01          	push	#1
 120  002e 4b08          	push	#8
 121  0030 ae5000        	ldw	x,#20480
 122  0033 cd0000        	call	_GPIO_ExternalPullUpConfig
 124  0036 85            	popw	x
 125                     ; 51     USART_Init(USART1, 115200,
 125                     ; 52                USART_WordLength_8b,
 125                     ; 53                USART_StopBits_1,
 125                     ; 54                USART_Parity_No,
 125                     ; 55                (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 127  0037 4b0c          	push	#12
 128  0039 4b00          	push	#0
 129  003b 4b00          	push	#0
 130  003d 4b00          	push	#0
 131  003f aec200        	ldw	x,#49664
 132  0042 89            	pushw	x
 133  0043 ae0001        	ldw	x,#1
 134  0046 89            	pushw	x
 135  0047 ae5230        	ldw	x,#21040
 136  004a cd0000        	call	_USART_Init
 138  004d 5b08          	addw	sp,#8
 139                     ; 56 }
 142  004f 81            	ret
 197                     ; 59 void main(void)
 197                     ; 60 {
 198                     	switch	.text
 199  0050               _main:
 201  0050 88            	push	a
 202       00000001      OFST:	set	1
 205                     ; 63     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 207  0051 4f            	clr	a
 208  0052 cd0000        	call	_CLK_SYSCLKDivConfig
 210                     ; 65     uart_init();
 212  0055 adb8          	call	L35_uart_init
 214                     ; 67     enableInterrupts();
 217  0057 9a            rim
 219                     ; 69     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE - 1], IDLE_STACK_SIZE);
 222  0058 ae0080        	ldw	x,#128
 223  005b 89            	pushw	x
 224  005c ae0000        	ldw	x,#0
 225  005f 89            	pushw	x
 226  0060 ae037f        	ldw	x,#L3_idle_thread_stack+127
 227  0063 cd0000        	call	_atomOSInit
 229  0066 5b04          	addw	sp,#4
 230  0068 6b01          	ld	(OFST+0,sp),a
 231                     ; 70     if (status != ATOM_OK) {
 233  006a 0d01          	tnz	(OFST+0,sp)
 234  006c 2709          	jreq	L501
 235                     ; 71         printf("atomOSInit failed!\n");
 237  006e ae007b        	ldw	x,#L701
 238  0071 cd0000        	call	_printf
 240                     ; 72         goto err;
 242  0074 cc010d        	jra	L56
 243  0077               L501:
 244                     ; 75     archInitSystemTickTimer();
 246  0077 cd0000        	call	_archInitSystemTickTimer
 248                     ; 77     status = atomThreadCreate(&main_tcb,
 248                     ; 78                               MAIN_THREAD_PRIO, main_thread, 0,
 248                     ; 79                               &main_thread_stack[MAIN_STACK_SIZE - 1],
 248                     ; 80                               MAIN_STACK_SIZE);
 250  007a ae0100        	ldw	x,#256
 251  007d 89            	pushw	x
 252  007e ae0000        	ldw	x,#0
 253  0081 89            	pushw	x
 254  0082 ae02ff        	ldw	x,#L5_main_thread_stack+255
 255  0085 89            	pushw	x
 256  0086 ae0000        	ldw	x,#0
 257  0089 89            	pushw	x
 258  008a ae0000        	ldw	x,#0
 259  008d 89            	pushw	x
 260  008e ae0000        	ldw	x,#L12_main_thread
 261  0091 89            	pushw	x
 262  0092 4b0f          	push	#15
 263  0094 ae0022        	ldw	x,#L31_main_tcb
 264  0097 cd0000        	call	_atomThreadCreate
 266  009a 5b0d          	addw	sp,#13
 267  009c 6b01          	ld	(OFST+0,sp),a
 268                     ; 81     if (status != ATOM_OK) {
 270  009e 0d01          	tnz	(OFST+0,sp)
 271  00a0 2708          	jreq	L111
 272                     ; 82         printf("atomThreadCreate main_thread failed!\n");
 274  00a2 ae0055        	ldw	x,#L311
 275  00a5 cd0000        	call	_printf
 277                     ; 83         goto err;
 279  00a8 2063          	jra	L56
 280  00aa               L111:
 281                     ; 86     status = atomThreadCreate(&cli_tcb,
 281                     ; 87                               CLI_THREAD_PRIO, cli_thread, 0,
 281                     ; 88                               &cli_thread_stack[CLI_STACK_SIZE - 1],
 281                     ; 89                               CLI_STACK_SIZE);
 283  00aa ae0100        	ldw	x,#256
 284  00ad 89            	pushw	x
 285  00ae ae0000        	ldw	x,#0
 286  00b1 89            	pushw	x
 287  00b2 ae01ff        	ldw	x,#L7_cli_thread_stack+255
 288  00b5 89            	pushw	x
 289  00b6 ae0000        	ldw	x,#0
 290  00b9 89            	pushw	x
 291  00ba ae0000        	ldw	x,#0
 292  00bd 89            	pushw	x
 293  00be ae0000        	ldw	x,#_cli_thread
 294  00c1 89            	pushw	x
 295  00c2 4b11          	push	#17
 296  00c4 ae0011        	ldw	x,#L51_cli_tcb
 297  00c7 cd0000        	call	_atomThreadCreate
 299  00ca 5b0d          	addw	sp,#13
 300  00cc 6b01          	ld	(OFST+0,sp),a
 301                     ; 90     if (status != ATOM_OK) {
 303  00ce 0d01          	tnz	(OFST+0,sp)
 304  00d0 2708          	jreq	L511
 305                     ; 91         printf("atomThreadCreate cli_thread failed!\n");
 307  00d2 ae0030        	ldw	x,#L711
 308  00d5 cd0000        	call	_printf
 310                     ; 92         goto err;
 312  00d8 2033          	jra	L56
 313  00da               L511:
 314                     ; 95     status = atomThreadCreate(&display_tcb,
 314                     ; 96                               DISPLAY_THREAD_PRIO, display_thread, 0,
 314                     ; 97                               &display_thread_stack[DISPLAY_STACK_SIZE - 1],
 314                     ; 98                               DISPLAY_STACK_SIZE);
 316  00da ae0100        	ldw	x,#256
 317  00dd 89            	pushw	x
 318  00de ae0000        	ldw	x,#0
 319  00e1 89            	pushw	x
 320  00e2 ae00ff        	ldw	x,#L11_display_thread_stack+255
 321  00e5 89            	pushw	x
 322  00e6 ae0000        	ldw	x,#0
 323  00e9 89            	pushw	x
 324  00ea ae0000        	ldw	x,#0
 325  00ed 89            	pushw	x
 326  00ee ae0000        	ldw	x,#_display_thread
 327  00f1 89            	pushw	x
 328  00f2 4b10          	push	#16
 329  00f4 ae0000        	ldw	x,#L71_display_tcb
 330  00f7 cd0000        	call	_atomThreadCreate
 332  00fa 5b0d          	addw	sp,#13
 333  00fc 6b01          	ld	(OFST+0,sp),a
 334                     ; 99     if (status != ATOM_OK) {
 336  00fe 0d01          	tnz	(OFST+0,sp)
 337  0100 2708          	jreq	L121
 338                     ; 100         printf("atomThreadCreate display_thread failed!\n");
 340  0102 ae0007        	ldw	x,#L321
 341  0105 cd0000        	call	_printf
 343                     ; 101         goto err;
 345  0108 2003          	jra	L56
 346  010a               L121:
 347                     ; 114     atomOSStart();
 349  010a cd0000        	call	_atomOSStart
 351  010d               L56:
 352                     ; 116 err:
 352                     ; 117     printf("Oops!\n");
 354  010d ae0000        	ldw	x,#L521
 355  0110 cd0000        	call	_printf
 357  0113               L721:
 358                     ; 118     while (1);
 360  0113 20fe          	jra	L721
 394                     ; 121 void delay(__IO uint16_t nCount)
 394                     ; 122 {
 395                     	switch	.text
 396  0115               _delay:
 398  0115 89            	pushw	x
 399       00000000      OFST:	set	0
 402  0116 2007          	jra	L351
 403  0118               L151:
 404                     ; 124         nCount--;
 406  0118 1e01          	ldw	x,(OFST+1,sp)
 407  011a 1d0001        	subw	x,#1
 408  011d 1f01          	ldw	(OFST+1,sp),x
 409  011f               L351:
 410                     ; 123     while (nCount) {
 412  011f 1e01          	ldw	x,(OFST+1,sp)
 413  0121 26f5          	jrne	L151
 414                     ; 126 }
 417  0123 85            	popw	x
 418  0124 81            	ret
 644                     	xdef	_main
 645                     	xdef	_delay
 646                     	switch	.ubsct
 647  0000               L71_display_tcb:
 648  0000 000000000000  	ds.b	17
 649  0011               L51_cli_tcb:
 650  0011 000000000000  	ds.b	17
 651  0022               L31_main_tcb:
 652  0022 000000000000  	ds.b	17
 653                     	switch	.bss
 654  0000               L11_display_thread_stack:
 655  0000 000000000000  	ds.b	256
 656  0100               L7_cli_thread_stack:
 657  0100 000000000000  	ds.b	256
 658  0200               L5_main_thread_stack:
 659  0200 000000000000  	ds.b	256
 660  0300               L3_idle_thread_stack:
 661  0300 000000000000  	ds.b	128
 662                     	xref	_cli_thread
 663                     	xref	_display_thread
 664                     	xref	_archInitSystemTickTimer
 665                     	xref	_atomThreadCreate
 666                     	xref	_atomOSStart
 667                     	xref	_atomOSInit
 668                     	xref	_atomTimerDelay
 669                     	xref	_USART_Init
 670                     	xref	_SYSCFG_REMAPPinConfig
 671                     	xref	_GPIO_ExternalPullUpConfig
 672                     	xref	_CLK_PeripheralClockConfig
 673                     	xref	_CLK_SYSCLKDivConfig
 674                     	xref	_printf
 675                     .const:	section	.text
 676  0000               L521:
 677  0000 4f6f7073210a  	dc.b	"Oops!",10,0
 678  0007               L321:
 679  0007 61746f6d5468  	dc.b	"atomThreadCreate d"
 680  0019 6973706c6179  	dc.b	"isplay_thread fail"
 681  002b 6564210a00    	dc.b	"ed!",10,0
 682  0030               L711:
 683  0030 61746f6d5468  	dc.b	"atomThreadCreate c"
 684  0042 6c695f746872  	dc.b	"li_thread failed!",10,0
 685  0055               L311:
 686  0055 61746f6d5468  	dc.b	"atomThreadCreate m"
 687  0067 61696e5f7468  	dc.b	"ain_thread failed!"
 688  0079 0a00          	dc.b	10,0
 689  007b               L701:
 690  007b 61746f6d4f53  	dc.b	"atomOSInit failed!"
 691  008d 0a00          	dc.b	10,0
 711                     	end
