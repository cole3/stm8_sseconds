   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  54                     ; 133 NO_REG_SAVE void main ( void )
  54                     ; 134 {
  56                     .text:	section	.text,new
  57  0000               _main:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 144 		enableInterrupts();
  66  0001 9a            rim
  68                     ; 145     uart_init(115200);
  71  0002 aec200        	ldw	x,#49664
  72  0005 89            	pushw	x
  73  0006 ae0001        	ldw	x,#1
  74  0009 89            	pushw	x
  75  000a cd0000        	call	_uart_init
  77  000d 5b04          	addw	sp,#4
  78                     ; 147     status = atomOSInit(&idle_thread_stack[IDLE_STACK_SIZE_BYTES - 1], IDLE_STACK_SIZE_BYTES);
  80  000f ae0080        	ldw	x,#128
  81  0012 89            	pushw	x
  82  0013 ae0000        	ldw	x,#0
  83  0016 89            	pushw	x
  84  0017 ae007f        	ldw	x,#L7_idle_thread_stack+127
  85  001a cd0000        	call	_atomOSInit
  87  001d 5b04          	addw	sp,#4
  88  001f 6b01          	ld	(OFST+0,sp),a
  89                     ; 148     if (status == ATOM_OK)
  91  0021 0d01          	tnz	(OFST+0,sp)
  92  0023 262e          	jrne	L14
  93                     ; 151         archInitSystemTickTimer();
  95  0025 cd0000        	call	_archInitSystemTickTimer
  97                     ; 154         status = atomThreadCreate(&main_tcb,
  97                     ; 155                      16, main_thread_func, 0,
  97                     ; 156                      &main_thread_stack[MAIN_STACK_SIZE_BYTES - 1],
  97                     ; 157                      MAIN_STACK_SIZE_BYTES);
  99  0028 ae0100        	ldw	x,#256
 100  002b 89            	pushw	x
 101  002c ae0000        	ldw	x,#0
 102  002f 89            	pushw	x
 103  0030 ae017f        	ldw	x,#L5_main_thread_stack+255
 104  0033 89            	pushw	x
 105  0034 ae0000        	ldw	x,#0
 106  0037 89            	pushw	x
 107  0038 ae0000        	ldw	x,#0
 108  003b 89            	pushw	x
 109  003c ae0000        	ldw	x,#L11_main_thread_func
 110  003f 89            	pushw	x
 111  0040 4b10          	push	#16
 112  0042 ae0180        	ldw	x,#L3_main_tcb
 113  0045 cd0000        	call	_atomThreadCreate
 115  0048 5b0d          	addw	sp,#13
 116  004a 6b01          	ld	(OFST+0,sp),a
 117                     ; 158         if (status == ATOM_OK)
 119  004c 0d01          	tnz	(OFST+0,sp)
 120  004e 2603          	jrne	L14
 121                     ; 170             atomOSStart();
 123  0050 cd0000        	call	_atomOSStart
 125  0053               L14:
 126                     ; 177 			  printf("Main thread\n");
 128  0053 ae000a        	ldw	x,#L54
 129  0056 cd0000        	call	_printf
 131                     ; 178 				atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 133  0059 ae0064        	ldw	x,#100
 134  005c 89            	pushw	x
 135  005d ae0000        	ldw	x,#0
 136  0060 89            	pushw	x
 137  0061 cd0000        	call	_atomTimerDelay
 139  0064 5b04          	addw	sp,#4
 141  0066 20eb          	jra	L14
 175                     ; 195 static void main_thread_func (uint32_t param)
 175                     ; 196 {
 176                     .text:	section	.text,new
 177  0000               L11_main_thread_func:
 181  0000               L36:
 182                     ; 199 		    printf("1 thread\n");
 184  0000 ae0000        	ldw	x,#L76
 185  0003 cd0000        	call	_printf
 187                     ; 200 				atomTimerDelay(SYSTEM_TICKS_PER_SEC);
 189  0006 ae0064        	ldw	x,#100
 190  0009 89            	pushw	x
 191  000a ae0000        	ldw	x,#0
 192  000d 89            	pushw	x
 193  000e cd0000        	call	_atomTimerDelay
 195  0011 5b04          	addw	sp,#4
 197  0013 20eb          	jra	L36
 399                     	xdef	_main
 400                     	switch	.bss
 401  0000               L7_idle_thread_stack:
 402  0000 000000000000  	ds.b	128
 403  0080               L5_main_thread_stack:
 404  0080 000000000000  	ds.b	256
 405  0180               L3_main_tcb:
 406  0180 000000000000  	ds.b	23
 407                     	xref	_uart_init
 408                     	xref	_archInitSystemTickTimer
 409                     	xref	_atomThreadCreate
 410                     	xref	_atomOSStart
 411                     	xref	_atomOSInit
 412                     	xref	_atomTimerDelay
 413                     	xref	_printf
 414                     .const:	section	.text
 415  0000               L76:
 416  0000 312074687265  	dc.b	"1 thread",10,0
 417  000a               L54:
 418  000a 4d61696e2074  	dc.b	"Main thread",10,0
 438                     	end
