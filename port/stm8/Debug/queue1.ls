   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  53                     .const:	section	.text
  54  0000               L6:
  55  0000 000003e8      	dc.l	1000
  56                     ; 58 uint32_t test_start (void)
  56                     ; 59 {
  57                     	scross	off
  58                     .text:	section	.text,new
  59  0000               _test_start:
  61  0000 5206          	subw	sp,#6
  62       00000006      OFST:	set	6
  65                     ; 64     failures = 0;
  67  0002 5f            	clrw	x
  68  0003 1f05          	ldw	(OFST-1,sp),x
  69                     ; 67     for (i = 0; i < 1000; i++)
  71  0005 ae0000        	ldw	x,#0
  72  0008 1f03          	ldw	(OFST-3,sp),x
  73  000a ae0000        	ldw	x,#0
  74  000d 1f01          	ldw	(OFST-5,sp),x
  75  000f               L33:
  76                     ; 69         if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) == ATOM_OK)
  78  000f ae0010        	ldw	x,#16
  79  0012 89            	pushw	x
  80  0013 ae0000        	ldw	x,#0
  81  0016 89            	pushw	x
  82  0017 ae0001        	ldw	x,#1
  83  001a 89            	pushw	x
  84  001b ae0000        	ldw	x,#0
  85  001e 89            	pushw	x
  86  001f ae0000        	ldw	x,#L5_queue1_storage
  87  0022 89            	pushw	x
  88  0023 ae0010        	ldw	x,#L3_queue1
  89  0026 cd0000        	call	_atomQueueCreate
  91  0029 5b0a          	addw	sp,#10
  92  002b 4d            	tnz	a
  93  002c 2632          	jrne	L14
  94                     ; 71             if (atomQueueDelete (&queue1) == ATOM_OK)
  96  002e ae0010        	ldw	x,#L3_queue1
  97  0031 cd0000        	call	_atomQueueDelete
  99  0034 4d            	tnz	a
 100  0035 261a          	jrne	L34
 102  0037               L15:
 103                     ; 67     for (i = 0; i < 1000; i++)
 105  0037 96            	ldw	x,sp
 106  0038 1c0001        	addw	x,#OFST-5
 107  003b a601          	ld	a,#1
 108  003d cd0000        	call	c_lgadc
 112  0040 96            	ldw	x,sp
 113  0041 1c0001        	addw	x,#OFST-5
 114  0044 cd0000        	call	c_ltor
 116  0047 ae0000        	ldw	x,#L6
 117  004a cd0000        	call	c_lcmp
 119  004d 25c0          	jrult	L33
 120  004f 201c          	jra	L73
 121  0051               L34:
 122                     ; 78                 ATOMLOG (_STR("Error deleting queue\n"));
 124  0051 ae0081        	ldw	x,#L74
 125  0054 cd0000        	call	_printf
 127                     ; 79                 failures++;
 129  0057 1e05          	ldw	x,(OFST-1,sp)
 130  0059 1c0001        	addw	x,#1
 131  005c 1f05          	ldw	(OFST-1,sp),x
 132                     ; 80                 break;
 134  005e 200d          	jra	L73
 135  0060               L14:
 136                     ; 86             ATOMLOG (_STR("Error creating queue\n"));
 138  0060 ae006b        	ldw	x,#L35
 139  0063 cd0000        	call	_printf
 141                     ; 87             failures++;
 143  0066 1e05          	ldw	x,(OFST-1,sp)
 144  0068 1c0001        	addw	x,#1
 145  006b 1f05          	ldw	(OFST-1,sp),x
 146                     ; 88             break;
 147  006d               L73:
 148                     ; 93     if (atomQueueCreate (NULL, &queue1_storage[0], sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 150  006d ae0010        	ldw	x,#16
 151  0070 89            	pushw	x
 152  0071 ae0000        	ldw	x,#0
 153  0074 89            	pushw	x
 154  0075 ae0001        	ldw	x,#1
 155  0078 89            	pushw	x
 156  0079 ae0000        	ldw	x,#0
 157  007c 89            	pushw	x
 158  007d ae0000        	ldw	x,#L5_queue1_storage
 159  0080 89            	pushw	x
 160  0081 5f            	clrw	x
 161  0082 cd0000        	call	_atomQueueCreate
 163  0085 5b0a          	addw	sp,#10
 164  0087 4d            	tnz	a
 165  0088 260d          	jrne	L75
 167                     ; 100         ATOMLOG (_STR("Bad queue ptr check\n"));
 169  008a ae0056        	ldw	x,#L16
 170  008d cd0000        	call	_printf
 172                     ; 101         failures++;
 174  0090 1e05          	ldw	x,(OFST-1,sp)
 175  0092 1c0001        	addw	x,#1
 176  0095 1f05          	ldw	(OFST-1,sp),x
 177  0097               L75:
 178                     ; 103     if (atomQueueCreate (&queue1, NULL, sizeof(uint8_t), QUEUE_ENTRIES) != ATOM_OK)
 180  0097 ae0010        	ldw	x,#16
 181  009a 89            	pushw	x
 182  009b ae0000        	ldw	x,#0
 183  009e 89            	pushw	x
 184  009f ae0001        	ldw	x,#1
 185  00a2 89            	pushw	x
 186  00a3 ae0000        	ldw	x,#0
 187  00a6 89            	pushw	x
 188  00a7 5f            	clrw	x
 189  00a8 89            	pushw	x
 190  00a9 ae0010        	ldw	x,#L3_queue1
 191  00ac cd0000        	call	_atomQueueCreate
 193  00af 5b0a          	addw	sp,#10
 194  00b1 4d            	tnz	a
 195  00b2 260d          	jrne	L56
 197                     ; 110         ATOMLOG (_STR("Bad buff ptr check\n"));
 199  00b4 ae0042        	ldw	x,#L76
 200  00b7 cd0000        	call	_printf
 202                     ; 111         failures++;
 204  00ba 1e05          	ldw	x,(OFST-1,sp)
 205  00bc 1c0001        	addw	x,#1
 206  00bf 1f05          	ldw	(OFST-1,sp),x
 207  00c1               L56:
 208                     ; 113     if (atomQueueCreate (&queue1, &queue1_storage[0], 0, QUEUE_ENTRIES) != ATOM_OK)
 210  00c1 ae0010        	ldw	x,#16
 211  00c4 89            	pushw	x
 212  00c5 ae0000        	ldw	x,#0
 213  00c8 89            	pushw	x
 214  00c9 ae0000        	ldw	x,#0
 215  00cc 89            	pushw	x
 216  00cd ae0000        	ldw	x,#0
 217  00d0 89            	pushw	x
 218  00d1 ae0000        	ldw	x,#L5_queue1_storage
 219  00d4 89            	pushw	x
 220  00d5 ae0010        	ldw	x,#L3_queue1
 221  00d8 cd0000        	call	_atomQueueCreate
 223  00db 5b0a          	addw	sp,#10
 224  00dd 4d            	tnz	a
 225  00de 260d          	jrne	L37
 227                     ; 120         ATOMLOG (_STR("Bad size check\n"));
 229  00e0 ae0032        	ldw	x,#L57
 230  00e3 cd0000        	call	_printf
 232                     ; 121         failures++;
 234  00e6 1e05          	ldw	x,(OFST-1,sp)
 235  00e8 1c0001        	addw	x,#1
 236  00eb 1f05          	ldw	(OFST-1,sp),x
 237  00ed               L37:
 238                     ; 123     if (atomQueueCreate (&queue1, &queue1_storage[0], sizeof(uint8_t), 0) != ATOM_OK)
 240  00ed ae0000        	ldw	x,#0
 241  00f0 89            	pushw	x
 242  00f1 ae0000        	ldw	x,#0
 243  00f4 89            	pushw	x
 244  00f5 ae0001        	ldw	x,#1
 245  00f8 89            	pushw	x
 246  00f9 ae0000        	ldw	x,#0
 247  00fc 89            	pushw	x
 248  00fd ae0000        	ldw	x,#L5_queue1_storage
 249  0100 89            	pushw	x
 250  0101 ae0010        	ldw	x,#L3_queue1
 251  0104 cd0000        	call	_atomQueueCreate
 253  0107 5b0a          	addw	sp,#10
 254  0109 4d            	tnz	a
 255  010a 260d          	jrne	L101
 257                     ; 130         ATOMLOG (_STR("Bad entries check\n"));
 259  010c ae001f        	ldw	x,#L301
 260  010f cd0000        	call	_printf
 262                     ; 131         failures++;
 264  0112 1e05          	ldw	x,(OFST-1,sp)
 265  0114 1c0001        	addw	x,#1
 266  0117 1f05          	ldw	(OFST-1,sp),x
 267  0119               L101:
 268                     ; 135     if (atomQueueDelete (NULL) != ATOM_OK)
 270  0119 5f            	clrw	x
 271  011a cd0000        	call	_atomQueueDelete
 273  011d 4d            	tnz	a
 274  011e 260d          	jrne	L701
 276                     ; 142         ATOMLOG (_STR("Bad queue deletion checks\n"));
 278  0120 ae0004        	ldw	x,#L111
 279  0123 cd0000        	call	_printf
 281                     ; 143         failures++;
 283  0126 1e05          	ldw	x,(OFST-1,sp)
 284  0128 1c0001        	addw	x,#1
 285  012b 1f05          	ldw	(OFST-1,sp),x
 286  012d               L701:
 287                     ; 147     return failures;
 289  012d 1e05          	ldw	x,(OFST-1,sp)
 290  012f cd0000        	call	c_itolx
 294  0132 5b06          	addw	sp,#6
 295  0134 81            	ret
 563                     	switch	.bss
 564  0000               L5_queue1_storage:
 565  0000 000000000000  	ds.b	16
 566  0010               L3_queue1:
 567  0010 000000000000  	ds.b	26
 568                     	xdef	_test_start
 569                     	xref	_printf
 570                     	xref	_atomQueueDelete
 571                     	xref	_atomQueueCreate
 572                     	switch	.const
 573  0004               L111:
 574  0004 426164207175  	dc.b	"Bad queue deletion"
 575  0016 20636865636b  	dc.b	" checks",10,0
 576  001f               L301:
 577  001f 42616420656e  	dc.b	"Bad entries check",10,0
 578  0032               L57:
 579  0032 426164207369  	dc.b	"Bad size check",10,0
 580  0042               L76:
 581  0042 426164206275  	dc.b	"Bad buff ptr check"
 582  0054 0a00          	dc.b	10,0
 583  0056               L16:
 584  0056 426164207175  	dc.b	"Bad queue ptr chec"
 585  0068 6b0a00        	dc.b	"k",10,0
 586  006b               L35:
 587  006b 4572726f7220  	dc.b	"Error creating que"
 588  007d 75650a00      	dc.b	"ue",10,0
 589  0081               L74:
 590  0081 4572726f7220  	dc.b	"Error deleting que"
 591  0093 75650a00      	dc.b	"ue",10,0
 611                     	xref	c_itolx
 612                     	xref	c_lcmp
 613                     	xref	c_ltor
 614                     	xref	c_lgadc
 615                     	end
