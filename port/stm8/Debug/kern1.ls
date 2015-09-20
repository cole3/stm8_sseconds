   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  49                     ; 58 uint32_t test_start (void)
  49                     ; 59 {
  51                     .text:	section	.text,new
  52  0000               _test_start:
  54  0000 89            	pushw	x
  55       00000002      OFST:	set	2
  58                     ; 63     failures = 0;
  60  0001 5f            	clrw	x
  61  0002 1f01          	ldw	(OFST-1,sp),x
  62                     ; 66     if (atomThreadCreate (NULL, TEST_THREAD_PRIO, test_thread_func, 0,
  62                     ; 67             &test_thread_stack[TEST_THREAD_STACK_SIZE - 1],
  62                     ; 68             TEST_THREAD_STACK_SIZE) != ATOM_ERR_PARAM)
  64  0004 ae0080        	ldw	x,#128
  65  0007 89            	pushw	x
  66  0008 ae0000        	ldw	x,#0
  67  000b 89            	pushw	x
  68  000c ae007f        	ldw	x,#L5_test_thread_stack+127
  69  000f 89            	pushw	x
  70  0010 ae0000        	ldw	x,#0
  71  0013 89            	pushw	x
  72  0014 ae0000        	ldw	x,#0
  73  0017 89            	pushw	x
  74  0018 ae0000        	ldw	x,#L7_test_thread_func
  75  001b 89            	pushw	x
  76  001c 4b10          	push	#16
  77  001e 5f            	clrw	x
  78  001f cd0000        	call	_atomThreadCreate
  80  0022 5b0d          	addw	sp,#13
  81  0024 a1c9          	cp	a,#201
  82  0026 270d          	jreq	L33
  83                     ; 70         ATOMLOG (_STR("Bad TCB check\n"));
  85  0028 ae003c        	ldw	x,#L53
  86  002b cd0000        	call	_printf
  88                     ; 71         failures++;
  90  002e 1e01          	ldw	x,(OFST-1,sp)
  91  0030 1c0001        	addw	x,#1
  92  0033 1f01          	ldw	(OFST-1,sp),x
  93  0035               L33:
  94                     ; 75     if (atomThreadCreate (&tcb1, TEST_THREAD_PRIO, NULL, 0,
  94                     ; 76             &test_thread_stack[TEST_THREAD_STACK_SIZE - 1],
  94                     ; 77             TEST_THREAD_STACK_SIZE) != ATOM_ERR_PARAM)
  96  0035 ae0080        	ldw	x,#128
  97  0038 89            	pushw	x
  98  0039 ae0000        	ldw	x,#0
  99  003c 89            	pushw	x
 100  003d ae007f        	ldw	x,#L5_test_thread_stack+127
 101  0040 89            	pushw	x
 102  0041 ae0000        	ldw	x,#0
 103  0044 89            	pushw	x
 104  0045 ae0000        	ldw	x,#0
 105  0048 89            	pushw	x
 106  0049 5f            	clrw	x
 107  004a 89            	pushw	x
 108  004b 4b10          	push	#16
 109  004d ae0080        	ldw	x,#L3_tcb1
 110  0050 cd0000        	call	_atomThreadCreate
 112  0053 5b0d          	addw	sp,#13
 113  0055 a1c9          	cp	a,#201
 114  0057 270d          	jreq	L73
 115                     ; 79         ATOMLOG (_STR("Bad entry check\n"));
 117  0059 ae002b        	ldw	x,#L14
 118  005c cd0000        	call	_printf
 120                     ; 80         failures++;
 122  005f 1e01          	ldw	x,(OFST-1,sp)
 123  0061 1c0001        	addw	x,#1
 124  0064 1f01          	ldw	(OFST-1,sp),x
 125  0066               L73:
 126                     ; 84     if (atomThreadCreate (&tcb1, TEST_THREAD_PRIO, test_thread_func, 0,
 126                     ; 85             NULL, TEST_THREAD_STACK_SIZE) != ATOM_ERR_PARAM)
 128  0066 ae0080        	ldw	x,#128
 129  0069 89            	pushw	x
 130  006a ae0000        	ldw	x,#0
 131  006d 89            	pushw	x
 132  006e 5f            	clrw	x
 133  006f 89            	pushw	x
 134  0070 ae0000        	ldw	x,#0
 135  0073 89            	pushw	x
 136  0074 ae0000        	ldw	x,#0
 137  0077 89            	pushw	x
 138  0078 ae0000        	ldw	x,#L7_test_thread_func
 139  007b 89            	pushw	x
 140  007c 4b10          	push	#16
 141  007e ae0080        	ldw	x,#L3_tcb1
 142  0081 cd0000        	call	_atomThreadCreate
 144  0084 5b0d          	addw	sp,#13
 145  0086 a1c9          	cp	a,#201
 146  0088 270d          	jreq	L34
 147                     ; 87         ATOMLOG (_STR("Bad stack ptr check\n"));
 149  008a ae0016        	ldw	x,#L54
 150  008d cd0000        	call	_printf
 152                     ; 88         failures++;
 154  0090 1e01          	ldw	x,(OFST-1,sp)
 155  0092 1c0001        	addw	x,#1
 156  0095 1f01          	ldw	(OFST-1,sp),x
 157  0097               L34:
 158                     ; 92     if (atomThreadCreate (&tcb1, TEST_THREAD_PRIO, test_thread_func, 0,
 158                     ; 93             &test_thread_stack[TEST_THREAD_STACK_SIZE - 1], 0) != ATOM_ERR_PARAM)
 160  0097 ae0000        	ldw	x,#0
 161  009a 89            	pushw	x
 162  009b ae0000        	ldw	x,#0
 163  009e 89            	pushw	x
 164  009f ae007f        	ldw	x,#L5_test_thread_stack+127
 165  00a2 89            	pushw	x
 166  00a3 ae0000        	ldw	x,#0
 167  00a6 89            	pushw	x
 168  00a7 ae0000        	ldw	x,#0
 169  00aa 89            	pushw	x
 170  00ab ae0000        	ldw	x,#L7_test_thread_func
 171  00ae 89            	pushw	x
 172  00af 4b10          	push	#16
 173  00b1 ae0080        	ldw	x,#L3_tcb1
 174  00b4 cd0000        	call	_atomThreadCreate
 176  00b7 5b0d          	addw	sp,#13
 177  00b9 a1c9          	cp	a,#201
 178  00bb 270d          	jreq	L74
 179                     ; 95         ATOMLOG (_STR("Bad stack size check\n"));
 181  00bd ae0000        	ldw	x,#L15
 182  00c0 cd0000        	call	_printf
 184                     ; 96         failures++;
 186  00c3 1e01          	ldw	x,(OFST-1,sp)
 187  00c5 1c0001        	addw	x,#1
 188  00c8 1f01          	ldw	(OFST-1,sp),x
 189  00ca               L74:
 190                     ; 100     return failures;
 192  00ca 1e01          	ldw	x,(OFST-1,sp)
 193  00cc cd0000        	call	c_itolx
 197  00cf 5b02          	addw	sp,#2
 198  00d1 81            	ret
 231                     ; 114 static void test_thread_func (uint32_t param)
 231                     ; 115 {
 232                     .text:	section	.text,new
 233  0000               L7_test_thread_func:
 235       00000000      OFST:	set	0
 238                     ; 117     param = param;
 240  0000 96            	ldw	x,sp
 241  0001 1c0003        	addw	x,#OFST+3
 242  0004 cd0000        	call	c_ltor
 244  0007               L76:
 245                     ; 122         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 247  0007 ae0064        	ldw	x,#100
 248  000a 89            	pushw	x
 249  000b ae0000        	ldw	x,#0
 250  000e 89            	pushw	x
 251  000f cd0000        	call	_atomTimerDelay
 253  0012 5b04          	addw	sp,#4
 255  0014 20f1          	jra	L76
 447                     	switch	.bss
 448  0000               L5_test_thread_stack:
 449  0000 000000000000  	ds.b	128
 450  0080               L3_tcb1:
 451  0080 000000000000  	ds.b	23
 452                     	xdef	_test_start
 453                     	xref	_printf
 454                     	xref	_atomThreadCreate
 455                     	xref	_atomTimerDelay
 456                     .const:	section	.text
 457  0000               L15:
 458  0000 426164207374  	dc.b	"Bad stack size che"
 459  0012 636b0a00      	dc.b	"ck",10,0
 460  0016               L54:
 461  0016 426164207374  	dc.b	"Bad stack ptr chec"
 462  0028 6b0a00        	dc.b	"k",10,0
 463  002b               L14:
 464  002b 42616420656e  	dc.b	"Bad entry check",10,0
 465  003c               L53:
 466  003c 426164205443  	dc.b	"Bad TCB check",10,0
 486                     	xref	c_ltor
 487                     	xref	c_itolx
 488                     	end
