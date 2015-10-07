   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  58                     ; 20 int uart_init(uint32_t baudrate)
  58                     ; 21 {
  60                     	switch	.text
  61  0000               _uart_init:
  63  0000 89            	pushw	x
  64       00000002      OFST:	set	2
  67                     ; 24     SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);
  69  0001 4b01          	push	#1
  70  0003 ae011c        	ldw	x,#284
  71  0006 cd0000        	call	_SYSCFG_REMAPPinConfig
  73  0009 84            	pop	a
  74                     ; 25     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  76  000a ae0001        	ldw	x,#1
  77  000d a605          	ld	a,#5
  78  000f 95            	ld	xh,a
  79  0010 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 26     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_2, ENABLE);
  83  0013 4b01          	push	#1
  84  0015 4b04          	push	#4
  85  0017 ae5000        	ldw	x,#20480
  86  001a cd0000        	call	_GPIO_ExternalPullUpConfig
  88  001d 85            	popw	x
  89                     ; 27     GPIO_ExternalPullUpConfig(GPIOA, GPIO_Pin_3, ENABLE);
  91  001e 4b01          	push	#1
  92  0020 4b08          	push	#8
  93  0022 ae5000        	ldw	x,#20480
  94  0025 cd0000        	call	_GPIO_ExternalPullUpConfig
  96  0028 85            	popw	x
  97                     ; 29     USART_Init(USART1, baudrate,
  97                     ; 30                USART_WordLength_8b,
  97                     ; 31                USART_StopBits_1,
  97                     ; 32                USART_Parity_No,
  97                     ; 33                (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
  99  0029 4b0c          	push	#12
 100  002b 4b00          	push	#0
 101  002d 4b00          	push	#0
 102  002f 4b00          	push	#0
 103  0031 1e0b          	ldw	x,(OFST+9,sp)
 104  0033 89            	pushw	x
 105  0034 1e0b          	ldw	x,(OFST+9,sp)
 106  0036 89            	pushw	x
 107  0037 ae5230        	ldw	x,#21040
 108  003a cd0000        	call	_USART_Init
 110  003d 5b08          	addw	sp,#8
 111                     ; 36     if (atomMutexCreate (&uart_mutex) != ATOM_OK) {
 113  003f ae0000        	ldw	x,#L3_uart_mutex
 114  0042 cd0000        	call	_atomMutexCreate
 116  0045 4d            	tnz	a
 117  0046 2707          	jreq	L53
 118                     ; 37         status = -1;
 120  0048 aeffff        	ldw	x,#65535
 121  004b 1f01          	ldw	(OFST-1,sp),x
 123  004d 2003          	jra	L73
 124  004f               L53:
 125                     ; 39         status = 0;
 127  004f 5f            	clrw	x
 128  0050 1f01          	ldw	(OFST-1,sp),x
 129  0052               L73:
 130                     ; 43     return (status);
 132  0052 1e01          	ldw	x,(OFST-1,sp)
 135  0054 5b02          	addw	sp,#2
 136  0056 81            	ret
 176                     ; 56 char uart_putchar (char c)
 176                     ; 57 {
 177                     	switch	.text
 178  0057               _uart_putchar:
 180  0057 88            	push	a
 181       00000000      OFST:	set	0
 184                     ; 59     if (atomMutexGet(&uart_mutex, 0) == ATOM_OK) {
 186  0058 ae0000        	ldw	x,#0
 187  005b 89            	pushw	x
 188  005c ae0000        	ldw	x,#0
 189  005f 89            	pushw	x
 190  0060 ae0000        	ldw	x,#L3_uart_mutex
 191  0063 cd0000        	call	_atomMutexGet
 193  0066 5b04          	addw	sp,#4
 194  0068 4d            	tnz	a
 195  0069 2628          	jrne	L75
 196                     ; 61         if (c == '\n')
 198  006b 7b01          	ld	a,(OFST+1,sp)
 199  006d a10a          	cp	a,#10
 200  006f 2604          	jrne	L16
 201                     ; 62             putchar('\r');
 203  0071 a60d          	ld	a,#13
 204  0073 ad23          	call	_putchar
 206  0075               L16:
 207                     ; 65         USART_SendData8(USART1, c);
 209  0075 7b01          	ld	a,(OFST+1,sp)
 210  0077 88            	push	a
 211  0078 ae5230        	ldw	x,#21040
 212  007b cd0000        	call	_USART_SendData8
 214  007e 84            	pop	a
 216  007f               L56:
 217                     ; 68         while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
 219  007f ae0040        	ldw	x,#64
 220  0082 89            	pushw	x
 221  0083 ae5230        	ldw	x,#21040
 222  0086 cd0000        	call	_USART_GetFlagStatus
 224  0089 85            	popw	x
 225  008a 4d            	tnz	a
 226  008b 27f2          	jreq	L56
 227                     ; 71         atomMutexPut(&uart_mutex);
 229  008d ae0000        	ldw	x,#L3_uart_mutex
 230  0090 cd0000        	call	_atomMutexPut
 232  0093               L75:
 233                     ; 75     return (c);
 235  0093 7b01          	ld	a,(OFST+1,sp)
 238  0095 5b01          	addw	sp,#1
 239  0097 81            	ret
 274                     ; 90 char putchar (char c)
 274                     ; 91 {
 275                     	switch	.text
 276  0098               _putchar:
 280                     ; 92     return (uart_putchar(c));
 282  0098 adbd          	call	_uart_putchar
 286  009a 81            	ret
 489                     	xdef	_uart_putchar
 490                     	switch	.ubsct
 491  0000               L3_uart_mutex:
 492  0000 0000000000    	ds.b	5
 493                     	xdef	_uart_init
 494                     	xref	_atomMutexPut
 495                     	xref	_atomMutexGet
 496                     	xref	_atomMutexCreate
 497                     	xref	_USART_GetFlagStatus
 498                     	xref	_USART_SendData8
 499                     	xref	_USART_Init
 500                     	xref	_SYSCFG_REMAPPinConfig
 501                     	xref	_GPIO_ExternalPullUpConfig
 502                     	xref	_CLK_PeripheralClockConfig
 503                     	xdef	_putchar
 523                     	end
