   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  41                     ; 42 uint32_t test_start (void)
  41                     ; 43 {
  43                     .text:	section	.text,new
  44  0000               _test_start:
  46  0000 89            	pushw	x
  47       00000002      OFST:	set	2
  50                     ; 47     failures = 0;
  52  0001 5f            	clrw	x
  53  0002 1f01          	ldw	(OFST-1,sp),x
  54                     ; 54     return failures;
  56  0004 ae0000        	ldw	x,#0
  57  0007 bf02          	ldw	c_lreg+2,x
  58  0009 ae0000        	ldw	x,#0
  59  000c bf00          	ldw	c_lreg,x
  62  000e 5b02          	addw	sp,#2
  63  0010 81            	ret
  76                     	xdef	_test_start
  77                     	xref.b	c_lreg
  96                     	end
