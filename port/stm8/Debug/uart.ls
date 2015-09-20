   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  54                     ; 20 int uart_init(uint32_t baudrate)
  54                     ; 21 {
  56                     .text:	section	.text,new
  57  0000               _uart_init:
  59  0000 89            	pushw	x
  60       00000002      OFST:	set	2
  63                     ; 24   SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
  65  0001 4b01          	push	#1
  66  0003 ae011c        	ldw	x,#284
  67  0006 cd0000        	call	_SYSCFG_REMAPPinConfig
  69  0009 84            	pop	a
  70                     ; 25   CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  72  000a ae0001        	ldw	x,#1
  73  000d a605          	ld	a,#5
  74  000f 95            	ld	xh,a
  75  0010 cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 26   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
  79  0013 4b01          	push	#1
  80  0015 4b04          	push	#4
  81  0017 ae5000        	ldw	x,#20480
  82  001a cd0000        	call	_GPIO_ExternalPullUpConfig
  84  001d 85            	popw	x
  85                     ; 27   GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
  87  001e 4b01          	push	#1
  88  0020 4b08          	push	#8
  89  0022 ae5000        	ldw	x,#20480
  90  0025 cd0000        	call	_GPIO_ExternalPullUpConfig
  92  0028 85            	popw	x
  93                     ; 29   USART_Init(USART1, baudrate,
  93                     ; 30              USART_WordLength_8b,
  93                     ; 31              USART_StopBits_1,
  93                     ; 32              USART_Parity_No,
  93                     ; 33              (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));	
  95  0029 4b0c          	push	#12
  96  002b 4b00          	push	#0
  97  002d 4b00          	push	#0
  98  002f 4b00          	push	#0
  99  0031 1e0b          	ldw	x,(OFST+9,sp)
 100  0033 89            	pushw	x
 101  0034 1e0b          	ldw	x,(OFST+9,sp)
 102  0036 89            	pushw	x
 103  0037 ae5230        	ldw	x,#21040
 104  003a cd0000        	call	_USART_Init
 106  003d 5b08          	addw	sp,#8
 107                     ; 36   if (atomMutexCreate (&uart_mutex) != ATOM_OK)
 109  003f ae0000        	ldw	x,#L3_uart_mutex
 110  0042 cd0000        	call	_atomMutexCreate
 112  0045 4d            	tnz	a
 113  0046 2707          	jreq	L13
 114                     ; 38     status = -1;
 116  0048 aeffff        	ldw	x,#65535
 117  004b 1f01          	ldw	(OFST-1,sp),x
 119  004d 2003          	jra	L33
 120  004f               L13:
 121                     ; 42     status = 0;
 123  004f 5f            	clrw	x
 124  0050 1f01          	ldw	(OFST-1,sp),x
 125  0052               L33:
 126                     ; 46   return (status);
 128  0052 1e01          	ldw	x,(OFST-1,sp)
 131  0054 5b02          	addw	sp,#2
 132  0056 81            	ret
 170                     ; 59 char uart_putchar (char c)
 170                     ; 60 {
 171                     .text:	section	.text,new
 172  0000               _uart_putchar:
 174  0000 88            	push	a
 175       00000000      OFST:	set	0
 178                     ; 62     if (atomMutexGet(&uart_mutex, 0) == ATOM_OK)
 180  0001 ae0000        	ldw	x,#0
 181  0004 89            	pushw	x
 182  0005 ae0000        	ldw	x,#0
 183  0008 89            	pushw	x
 184  0009 ae0000        	ldw	x,#L3_uart_mutex
 185  000c cd0000        	call	_atomMutexGet
 187  000f 5b04          	addw	sp,#4
 188  0011 4d            	tnz	a
 189  0012 2629          	jrne	L15
 190                     ; 65         if (c == '\n')
 192  0014 7b01          	ld	a,(OFST+1,sp)
 193  0016 a10a          	cp	a,#10
 194  0018 2605          	jrne	L35
 195                     ; 66             putchar('\r');
 197  001a a60d          	ld	a,#13
 198  001c cd0000        	call	_putchar
 200  001f               L35:
 201                     ; 69         USART_SendData8(USART1, c);
 203  001f 7b01          	ld	a,(OFST+1,sp)
 204  0021 88            	push	a
 205  0022 ae5230        	ldw	x,#21040
 206  0025 cd0000        	call	_USART_SendData8
 208  0028 84            	pop	a
 210  0029               L75:
 211                     ; 72         while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 213  0029 ae0040        	ldw	x,#64
 214  002c 89            	pushw	x
 215  002d ae5230        	ldw	x,#21040
 216  0030 cd0000        	call	_USART_GetFlagStatus
 218  0033 85            	popw	x
 219  0034 4d            	tnz	a
 220  0035 27f2          	jreq	L75
 221                     ; 75         atomMutexPut(&uart_mutex);
 223  0037 ae0000        	ldw	x,#L3_uart_mutex
 224  003a cd0000        	call	_atomMutexPut
 226  003d               L15:
 227                     ; 79     return (c);
 229  003d 7b01          	ld	a,(OFST+1,sp)
 232  003f 5b01          	addw	sp,#1
 233  0041 81            	ret
 266                     ; 94 char putchar (char c)
 266                     ; 95 {
 267                     .text:	section	.text,new
 268  0000               _putchar:
 272                     ; 96     return (uart_putchar(c));
 274  0000 cd0000        	call	_uart_putchar
 278  0003 81            	ret
 498                     	xdef	_uart_putchar
 499                     	switch	.bss
 500  0000               L3_uart_mutex:
 501  0000 0000000000    	ds.b	5
 502                     	xdef	_uart_init
 503                     	xref	_atomMutexPut
 504                     	xref	_atomMutexGet
 505                     	xref	_atomMutexCreate
 506                     	xref	_USART_GetFlagStatus
 507                     	xref	_USART_SendData8
 508                     	xref	_USART_Init
 509                     	xref	_SYSCFG_REMAPPinConfig
 510                     	xref	_GPIO_ExternalPullUpConfig
 511                     	xref	_CLK_PeripheralClockConfig
 512                     	xdef	_putchar
 532                     	end
