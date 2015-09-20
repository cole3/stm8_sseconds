   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  69                     ; 56 uint32_t test_start (void)
  69                     ; 57 {
  71                     .text:	section	.text,new
  72  0000               _test_start:
  74  0000 520b          	subw	sp,#11
  75       0000000b      OFST:	set	11
  78                     ; 63     failures = 0;
  80  0002 5f            	clrw	x
  81  0003 1f0a          	ldw	(OFST-1,sp),x
  82                     ; 66     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(queue1_storage[0]), QUEUE_ENTRIES) != ATOM_OK)
  84  0005 ae0008        	ldw	x,#8
  85  0008 89            	pushw	x
  86  0009 ae0000        	ldw	x,#0
  87  000c 89            	pushw	x
  88  000d ae0001        	ldw	x,#1
  89  0010 89            	pushw	x
  90  0011 ae0000        	ldw	x,#0
  91  0014 89            	pushw	x
  92  0015 ae0000        	ldw	x,#L5_queue1_storage
  93  0018 89            	pushw	x
  94  0019 ae0008        	ldw	x,#L3_queue1
  95  001c cd0000        	call	_atomQueueCreate
  97  001f 5b0a          	addw	sp,#10
  98  0021 4d            	tnz	a
  99  0022 2711          	jreq	L73
 100                     ; 68         ATOMLOG (_STR("Error creating Q\n"));
 102  0024 ae0025        	ldw	x,#L14
 103  0027 cd0000        	call	_printf
 105                     ; 69         failures++;
 107  002a 1e0a          	ldw	x,(OFST-1,sp)
 108  002c 1c0001        	addw	x,#1
 109  002f 1f0a          	ldw	(OFST-1,sp),x
 111  0031 acbc00bc      	jpf	L34
 112  0035               L73:
 113                     ; 77         start_time = atomTimeGet();
 115  0035 cd0000        	call	_atomTimeGet
 117  0038 96            	ldw	x,sp
 118  0039 1c0002        	addw	x,#OFST-9
 119  003c cd0000        	call	c_rtol
 121                     ; 80         if (atomQueueGet (&queue1, 2 * SYSTEM_TICKS_PER_SEC, &msg) != ATOM_TIMEOUT)
 123  003f 96            	ldw	x,sp
 124  0040 1c0001        	addw	x,#OFST-10
 125  0043 89            	pushw	x
 126  0044 ae00c8        	ldw	x,#200
 127  0047 89            	pushw	x
 128  0048 ae0000        	ldw	x,#0
 129  004b 89            	pushw	x
 130  004c ae0008        	ldw	x,#L3_queue1
 131  004f cd0000        	call	_atomQueueGet
 133  0052 5b06          	addw	sp,#6
 134  0054 a102          	cp	a,#2
 135  0056 270d          	jreq	L54
 136                     ; 82             ATOMLOG (_STR("Failed get\n"));
 138  0058 ae0019        	ldw	x,#L74
 139  005b cd0000        	call	_printf
 141                     ; 83             failures++;
 143  005e 1e0a          	ldw	x,(OFST-1,sp)
 144  0060 1c0001        	addw	x,#1
 145  0063 1f0a          	ldw	(OFST-1,sp),x
 146  0065               L54:
 147                     ; 87         end_time = atomTimeGet();
 149  0065 cd0000        	call	_atomTimeGet
 151  0068 96            	ldw	x,sp
 152  0069 1c0006        	addw	x,#OFST-5
 153  006c cd0000        	call	c_rtol
 155                     ; 90         if ((end_time < (start_time + (2 * SYSTEM_TICKS_PER_SEC)))
 155                     ; 91             || (end_time > (start_time + (2 * SYSTEM_TICKS_PER_SEC) + 1)))
 157  006f 96            	ldw	x,sp
 158  0070 1c0002        	addw	x,#OFST-9
 159  0073 cd0000        	call	c_ltor
 161  0076 a6c8          	ld	a,#200
 162  0078 cd0000        	call	c_ladc
 164  007b 96            	ldw	x,sp
 165  007c 1c0006        	addw	x,#OFST-5
 166  007f cd0000        	call	c_lcmp
 168  0082 2215          	jrugt	L35
 170  0084 96            	ldw	x,sp
 171  0085 1c0002        	addw	x,#OFST-9
 172  0088 cd0000        	call	c_ltor
 174  008b a6c9          	ld	a,#201
 175  008d cd0000        	call	c_ladc
 177  0090 96            	ldw	x,sp
 178  0091 1c0006        	addw	x,#OFST-5
 179  0094 cd0000        	call	c_lcmp
 181  0097 240d          	jruge	L15
 182  0099               L35:
 183                     ; 93             ATOMLOG (_STR("Bad time\n"));
 185  0099 ae000f        	ldw	x,#L55
 186  009c cd0000        	call	_printf
 188                     ; 94             failures++;
 190  009f 1e0a          	ldw	x,(OFST-1,sp)
 191  00a1 1c0001        	addw	x,#1
 192  00a4 1f0a          	ldw	(OFST-1,sp),x
 193  00a6               L15:
 194                     ; 98         if (atomQueueDelete (&queue1) != ATOM_OK)
 196  00a6 ae0008        	ldw	x,#L3_queue1
 197  00a9 cd0000        	call	_atomQueueDelete
 199  00ac 4d            	tnz	a
 200  00ad 270d          	jreq	L34
 201                     ; 100             ATOMLOG (_STR("Delete failed\n"));
 203  00af ae0000        	ldw	x,#L16
 204  00b2 cd0000        	call	_printf
 206                     ; 101             failures++;
 208  00b5 1e0a          	ldw	x,(OFST-1,sp)
 209  00b7 1c0001        	addw	x,#1
 210  00ba 1f0a          	ldw	(OFST-1,sp),x
 211  00bc               L34:
 212                     ; 106     return failures;
 214  00bc 1e0a          	ldw	x,(OFST-1,sp)
 215  00be cd0000        	call	c_itolx
 219  00c1 5b0b          	addw	sp,#11
 220  00c3 81            	ret
 488                     	switch	.bss
 489  0000               L5_queue1_storage:
 490  0000 000000000000  	ds.b	8
 491  0008               L3_queue1:
 492  0008 000000000000  	ds.b	26
 493                     	xref	_atomQueueGet
 494                     	xref	_atomQueueDelete
 495                     	xref	_atomQueueCreate
 496                     	xdef	_test_start
 497                     	xref	_printf
 498                     	xref	_atomTimeGet
 499                     .const:	section	.text
 500  0000               L16:
 501  0000 44656c657465  	dc.b	"Delete failed",10,0
 502  000f               L55:
 503  000f 426164207469  	dc.b	"Bad time",10,0
 504  0019               L74:
 505  0019 4661696c6564  	dc.b	"Failed get",10,0
 506  0025               L14:
 507  0025 4572726f7220  	dc.b	"Error creating Q",10,0
 527                     	xref	c_itolx
 528                     	xref	c_lcmp
 529                     	xref	c_ladc
 530                     	xref	c_ltor
 531                     	xref	c_rtol
 532                     	end
