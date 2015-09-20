   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  50                     ; 133 NO_REG_SAVE void main ( void )
  50                     ; 134 {
  52                     .text:	section	.text,new
  53  0000               _main:
  55  0000 88            	push	a
  56       00000001      OFST:	set	1
  59                     ; 146     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
  61  0001 ae0080        	ldw	x,#128
  62  0004 89            	pushw	x
  63  0005 ae0000        	ldw	x,#0
  64  0008 89            	pushw	x
  65  0009 ae007f        	ldw	x,#L7_idle_thread_stack+127
  66  000c cd0000        	call	_atomOSInit
  68  000f 5b04          	addw	sp,#4
  69  0011 6b01          	ld	(OFST+0,sp),a
  70                     ; 147     if (status == ATOM_OK)
  72  0013 0d01          	tnz	(OFST+0,sp)
  73  0015 262e          	jrne	L14
  74                     ; 150         archInitSystemTickTimer();
  76  0017 cd0000        	call	_archInitSystemTickTimer
  78                     ; 153         status = atomThreadCreate(&main_tcb,
  78                     ; 154                      TEST_THREAD_PRIO, main_thread_func, 0,
  78                     ; 155                      &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
  78                     ; 156                      MAIN_STACK_SIZE_BYTES);
  80  001a ae0100        	ldw	x,#256
  81  001d 89            	pushw	x
  82  001e ae0000        	ldw	x,#0
  83  0021 89            	pushw	x
  84  0022 ae017f        	ldw	x,#L5_main_thread_stack+255
  85  0025 89            	pushw	x
  86  0026 ae0000        	ldw	x,#0
  87  0029 89            	pushw	x
  88  002a ae0000        	ldw	x,#0
  89  002d 89            	pushw	x
  90  002e ae0000        	ldw	x,#L11_main_thread_func
  91  0031 89            	pushw	x
  92  0032 4b10          	push	#16
  93  0034 ae0180        	ldw	x,#L3_main_tcb
  94  0037 cd0000        	call	_atomThreadCreate
  96  003a 5b0d          	addw	sp,#13
  97  003c 6b01          	ld	(OFST+0,sp),a
  98                     ; 157         if (status == ATOM_OK)
 100  003e 0d01          	tnz	(OFST+0,sp)
 101  0040 2603          	jrne	L14
 102                     ; 169             atomOSStart();
 104  0042 cd0000        	call	_atomOSStart
 106  0045               L14:
 108  0045 20fe          	jra	L14
 177                     ; 192 static void main_thread_func (uint32_t param)
 177                     ; 193 {
 178                     .text:	section	.text,new
 179  0000               L11_main_thread_func:
 181  0000 520e          	subw	sp,#14
 182       0000000e      OFST:	set	14
 185                     ; 198     param = param;
 187  0002 96            	ldw	x,sp
 188  0003 1c0011        	addw	x,#OFST+3
 189  0006 cd0000        	call	c_ltor
 191                     ; 201     if (uart_init(115200) != 0)
 193  0009 aec200        	ldw	x,#49664
 194  000c 89            	pushw	x
 195  000d ae0001        	ldw	x,#1
 196  0010 89            	pushw	x
 197  0011 cd0000        	call	_uart_init
 199  0014 5b04          	addw	sp,#4
 200  0016 a30000        	cpw	x,#0
 201                     ; 207     printf("Go\n");
 203  0019 ae0031        	ldw	x,#L37
 204  001c cd0000        	call	_printf
 206                     ; 210     test_status = test_start();
 208  001f cd0000        	call	_test_start
 210  0022 96            	ldw	x,sp
 211  0023 1c000b        	addw	x,#OFST-3
 212  0026 cd0000        	call	c_rtol
 214                     ; 214     if (test_status == 0)
 216  0029 96            	ldw	x,sp
 217  002a 1c000b        	addw	x,#OFST-3
 218  002d cd0000        	call	c_lzmp
 220  0030 2637          	jrne	L57
 221                     ; 219         if (atomThreadStackCheck (&main_tcb, &used_bytes, &free_bytes) == ATOM_OK)
 223  0032 96            	ldw	x,sp
 224  0033 1c0005        	addw	x,#OFST-9
 225  0036 89            	pushw	x
 226  0037 96            	ldw	x,sp
 227  0038 1c0003        	addw	x,#OFST-11
 228  003b 89            	pushw	x
 229  003c ae0180        	ldw	x,#L3_main_tcb
 230  003f cd0000        	call	_atomThreadStackCheck
 232  0042 5b04          	addw	sp,#4
 233  0044 4d            	tnz	a
 234  0045 2622          	jrne	L57
 235                     ; 222             if (free_bytes == 0)
 237  0047 96            	ldw	x,sp
 238  0048 1c0005        	addw	x,#OFST-9
 239  004b cd0000        	call	c_lzmp
 241  004e 260f          	jrne	L101
 242                     ; 224                 printf ("Main stack overflow\n");
 244  0050 ae001c        	ldw	x,#L301
 245  0053 cd0000        	call	_printf
 247                     ; 225                 test_status++;
 249  0056 96            	ldw	x,sp
 250  0057 1c000b        	addw	x,#OFST-3
 251  005a a601          	ld	a,#1
 252  005c cd0000        	call	c_lgadc
 254  005f               L101:
 255                     ; 230             printf ("MainUse:%d\n", (int)used_bytes);
 257  005f 1e03          	ldw	x,(OFST-11,sp)
 258  0061 89            	pushw	x
 259  0062 ae0010        	ldw	x,#L501
 260  0065 cd0000        	call	_printf
 262  0068 85            	popw	x
 263  0069               L57:
 264                     ; 238     if (test_status == 0)
 266  0069 96            	ldw	x,sp
 267  006a 1c000b        	addw	x,#OFST-3
 268  006d cd0000        	call	c_lzmp
 270  0070 2608          	jrne	L701
 271                     ; 240         printf ("Pass\n");
 273  0072 ae000a        	ldw	x,#L111
 274  0075 cd0000        	call	_printf
 277  0078 200a          	jra	L311
 278  007a               L701:
 279                     ; 244         printf ("Fail(%d)\n", (int)test_status);
 281  007a 1e0d          	ldw	x,(OFST-1,sp)
 282  007c 89            	pushw	x
 283  007d ae0000        	ldw	x,#L511
 284  0080 cd0000        	call	_printf
 286  0083 85            	popw	x
 287  0084               L311:
 288                     ; 248     sleep_ticks = (test_status == 0) ? SYSTEM_TICKS_PER_SEC : (SYSTEM_TICKS_PER_SEC/8);
 290  0084 96            	ldw	x,sp
 291  0085 1c000b        	addw	x,#OFST-3
 292  0088 cd0000        	call	c_lzmp
 294  008b 2605          	jrne	L01
 295  008d ae0064        	ldw	x,#100
 296  0090 2003          	jra	L21
 297  0092               L01:
 298  0092 ae000c        	ldw	x,#12
 299  0095               L21:
 300  0095 1f09          	ldw	(OFST-5,sp),x
 301                     ; 251     GPIO_DeInit(GPIOD);
 303  0097 ae500f        	ldw	x,#20495
 304  009a cd0000        	call	_GPIO_DeInit
 306                     ; 252     GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast);
 308  009d 4be0          	push	#224
 309  009f 4b01          	push	#1
 310  00a1 ae500f        	ldw	x,#20495
 311  00a4 cd0000        	call	_GPIO_Init
 313  00a7 85            	popw	x
 314  00a8               L711:
 315                     ; 258         GPIO_ToggleBits(GPIOD, GPIO_Pin_0);
 317  00a8 4b01          	push	#1
 318  00aa ae500f        	ldw	x,#20495
 319  00ad cd0000        	call	_GPIO_ToggleBits
 321  00b0 84            	pop	a
 322                     ; 261         atomTimerDelay(sleep_ticks);
 324  00b1 1e09          	ldw	x,(OFST-5,sp)
 325  00b3 cd0000        	call	c_itolx
 327  00b6 be02          	ldw	x,c_lreg+2
 328  00b8 89            	pushw	x
 329  00b9 be00          	ldw	x,c_lreg
 330  00bb 89            	pushw	x
 331  00bc cd0000        	call	_atomTimerDelay
 333  00bf 5b04          	addw	sp,#4
 335  00c1 20e5          	jra	L711
 537                     	xdef	_main
 538                     	switch	.bss
 539  0000               L7_idle_thread_stack:
 540  0000 000000000000  	ds.b	128
 541  0080               L5_main_thread_stack:
 542  0080 000000000000  	ds.b	256
 543  0180               L3_main_tcb:
 544  0180 000000000000  	ds.b	23
 545                     	xref	_uart_init
 546                     	xref	_test_start
 547                     	xref	_archInitSystemTickTimer
 548                     	xref	_atomThreadStackCheck
 549                     	xref	_atomThreadCreate
 550                     	xref	_atomOSStart
 551                     	xref	_atomOSInit
 552                     	xref	_atomTimerDelay
 553                     	xref	_GPIO_ToggleBits
 554                     	xref	_GPIO_Init
 555                     	xref	_GPIO_DeInit
 556                     	xref	_printf
 557                     .const:	section	.text
 558  0000               L511:
 559  0000 4661696c2825  	dc.b	"Fail(%d)",10,0
 560  000a               L111:
 561  000a 506173730a00  	dc.b	"Pass",10,0
 562  0010               L501:
 563  0010 4d61696e5573  	dc.b	"MainUse:%d",10,0
 564  001c               L301:
 565  001c 4d61696e2073  	dc.b	"Main stack overflo"
 566  002e 770a00        	dc.b	"w",10,0
 567  0031               L37:
 568  0031 476f0a00      	dc.b	"Go",10,0
 569                     	xref.b	c_lreg
 589                     	xref	c_itolx
 590                     	xref	c_lgadc
 591                     	xref	c_lzmp
 592                     	xref	c_rtol
 593                     	xref	c_ltor
 594                     	end
