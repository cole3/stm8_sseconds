   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
 115                     ; 57 uint32_t test_start (void)
 115                     ; 58 {
 117                     .text:	section	.text,new
 118  0000               _test_start:
 120  0000 520d          	subw	sp,#13
 121       0000000d      OFST:	set	13
 124                     ; 64     failures = 0;
 126  0002 5f            	clrw	x
 127  0003 1f0c          	ldw	(OFST-1,sp),x
 128                     ; 67     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 130  0005 4b00          	push	#0
 131  0007 ae0003        	ldw	x,#L3_sem1
 132  000a cd0000        	call	_atomSemCreate
 134  000d 5b01          	addw	sp,#1
 135  000f 4d            	tnz	a
 136  0010 270f          	jreq	L56
 137                     ; 69         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 139  0012 ae0131        	ldw	x,#L76
 140  0015 cd0000        	call	_printf
 142                     ; 70         failures++;
 144  0018 1e0c          	ldw	x,(OFST-1,sp)
 145  001a 1c0001        	addw	x,#1
 146  001d 1f0c          	ldw	(OFST-1,sp),x
 148  001f 207b          	jra	L17
 149  0021               L56:
 150                     ; 75         if ((status = atomSemGet (&sem1, SYSTEM_TICKS_PER_SEC)) != ATOM_TIMEOUT)
 152  0021 ae0064        	ldw	x,#100
 153  0024 89            	pushw	x
 154  0025 ae0000        	ldw	x,#0
 155  0028 89            	pushw	x
 156  0029 ae0003        	ldw	x,#L3_sem1
 157  002c cd0000        	call	_atomSemGet
 159  002f 5b04          	addw	sp,#4
 160  0031 6b0b          	ld	(OFST-2,sp),a
 161  0033 7b0b          	ld	a,(OFST-2,sp)
 162  0035 a102          	cp	a,#2
 163  0037 2713          	jreq	L37
 164                     ; 77             ATOMLOG (_STR("Timo %d\n"), status);
 166  0039 7b0b          	ld	a,(OFST-2,sp)
 167  003b 88            	push	a
 168  003c ae0128        	ldw	x,#L57
 169  003f cd0000        	call	_printf
 171  0042 84            	pop	a
 172                     ; 78             failures++;
 174  0043 1e0c          	ldw	x,(OFST-1,sp)
 175  0045 1c0001        	addw	x,#1
 176  0048 1f0c          	ldw	(OFST-1,sp),x
 178  004a 2050          	jra	L17
 179  004c               L37:
 180                     ; 83             if (atomSemPut (&sem1) != ATOM_OK)
 182  004c ae0003        	ldw	x,#L3_sem1
 183  004f cd0000        	call	_atomSemPut
 185  0052 4d            	tnz	a
 186  0053 270f          	jreq	L101
 187                     ; 85                 ATOMLOG (_STR("Put failed\n"));
 189  0055 ae011c        	ldw	x,#L301
 190  0058 cd0000        	call	_printf
 192                     ; 86                 failures++;
 194  005b 1e0c          	ldw	x,(OFST-1,sp)
 195  005d 1c0001        	addw	x,#1
 196  0060 1f0c          	ldw	(OFST-1,sp),x
 198  0062 2038          	jra	L17
 199  0064               L101:
 200                     ; 91                 if (atomSemGet (&sem1, 0) != ATOM_OK)
 202  0064 ae0000        	ldw	x,#0
 203  0067 89            	pushw	x
 204  0068 ae0000        	ldw	x,#0
 205  006b 89            	pushw	x
 206  006c ae0003        	ldw	x,#L3_sem1
 207  006f cd0000        	call	_atomSemGet
 209  0072 5b04          	addw	sp,#4
 210  0074 4d            	tnz	a
 211  0075 270f          	jreq	L701
 212                     ; 93                     ATOMLOG (_STR("Get failed\n"));
 214  0077 ae0110        	ldw	x,#L111
 215  007a cd0000        	call	_printf
 217                     ; 94                     failures++;
 219  007d 1e0c          	ldw	x,(OFST-1,sp)
 220  007f 1c0001        	addw	x,#1
 221  0082 1f0c          	ldw	(OFST-1,sp),x
 223  0084 2016          	jra	L17
 224  0086               L701:
 225                     ; 99                     if (atomSemDelete (&sem1) != ATOM_OK)
 227  0086 ae0003        	ldw	x,#L3_sem1
 228  0089 cd0000        	call	_atomSemDelete
 230  008c 4d            	tnz	a
 231  008d 270d          	jreq	L17
 232                     ; 101                         ATOMLOG (_STR("Delete failed\n"));
 234  008f ae0101        	ldw	x,#L711
 235  0092 cd0000        	call	_printf
 237                     ; 102                         failures++;
 239  0095 1e0c          	ldw	x,(OFST-1,sp)
 240  0097 1c0001        	addw	x,#1
 241  009a 1f0c          	ldw	(OFST-1,sp),x
 242  009c               L17:
 243                     ; 110     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 245  009c 4b00          	push	#0
 246  009e ae0003        	ldw	x,#L3_sem1
 247  00a1 cd0000        	call	_atomSemCreate
 249  00a4 5b01          	addw	sp,#1
 250  00a6 4d            	tnz	a
 251  00a7 270f          	jreq	L121
 252                     ; 112         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 254  00a9 ae0131        	ldw	x,#L76
 255  00ac cd0000        	call	_printf
 257                     ; 113         failures++;
 259  00af 1e0c          	ldw	x,(OFST-1,sp)
 260  00b1 1c0001        	addw	x,#1
 261  00b4 1f0c          	ldw	(OFST-1,sp),x
 263  00b6 2041          	jra	L321
 264  00b8               L121:
 265                     ; 118         if ((status = atomSemGet (&sem1, SYSTEM_TICKS_PER_SEC)) != ATOM_TIMEOUT)
 267  00b8 ae0064        	ldw	x,#100
 268  00bb 89            	pushw	x
 269  00bc ae0000        	ldw	x,#0
 270  00bf 89            	pushw	x
 271  00c0 ae0003        	ldw	x,#L3_sem1
 272  00c3 cd0000        	call	_atomSemGet
 274  00c6 5b04          	addw	sp,#4
 275  00c8 6b0b          	ld	(OFST-2,sp),a
 276  00ca 7b0b          	ld	a,(OFST-2,sp)
 277  00cc a102          	cp	a,#2
 278  00ce 2713          	jreq	L521
 279                     ; 120             ATOMLOG (_STR("Timo %d\n"), status);
 281  00d0 7b0b          	ld	a,(OFST-2,sp)
 282  00d2 88            	push	a
 283  00d3 ae0128        	ldw	x,#L57
 284  00d6 cd0000        	call	_printf
 286  00d9 84            	pop	a
 287                     ; 121             failures++;
 289  00da 1e0c          	ldw	x,(OFST-1,sp)
 290  00dc 1c0001        	addw	x,#1
 291  00df 1f0c          	ldw	(OFST-1,sp),x
 293  00e1 2016          	jra	L321
 294  00e3               L521:
 295                     ; 126             if (atomSemDelete (&sem1) != ATOM_OK)
 297  00e3 ae0003        	ldw	x,#L3_sem1
 298  00e6 cd0000        	call	_atomSemDelete
 300  00e9 4d            	tnz	a
 301  00ea 270d          	jreq	L321
 302                     ; 128                 ATOMLOG (_STR("Delete failed\n"));
 304  00ec ae0101        	ldw	x,#L711
 305  00ef cd0000        	call	_printf
 307                     ; 129                 failures++;
 309  00f2 1e0c          	ldw	x,(OFST-1,sp)
 310  00f4 1c0001        	addw	x,#1
 311  00f7 1f0c          	ldw	(OFST-1,sp),x
 312  00f9               L321:
 313                     ; 135     if (atomSemCreate (&sem1, 1) != ATOM_OK)
 315  00f9 4b01          	push	#1
 316  00fb ae0003        	ldw	x,#L3_sem1
 317  00fe cd0000        	call	_atomSemCreate
 319  0101 5b01          	addw	sp,#1
 320  0103 4d            	tnz	a
 321  0104 270f          	jreq	L331
 322                     ; 137         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 324  0106 ae0131        	ldw	x,#L76
 325  0109 cd0000        	call	_printf
 327                     ; 138         failures++;
 329  010c 1e0c          	ldw	x,(OFST-1,sp)
 330  010e 1c0001        	addw	x,#1
 331  0111 1f0c          	ldw	(OFST-1,sp),x
 333  0113 203d          	jra	L531
 334  0115               L331:
 335                     ; 143         if ((status = atomSemGet (&sem1, SYSTEM_TICKS_PER_SEC)) != ATOM_OK)
 337  0115 ae0064        	ldw	x,#100
 338  0118 89            	pushw	x
 339  0119 ae0000        	ldw	x,#0
 340  011c 89            	pushw	x
 341  011d ae0003        	ldw	x,#L3_sem1
 342  0120 cd0000        	call	_atomSemGet
 344  0123 5b04          	addw	sp,#4
 345  0125 6b0b          	ld	(OFST-2,sp),a
 346  0127 2713          	jreq	L731
 347                     ; 145             ATOMLOG (_STR("Get %d\n"), status);
 349  0129 7b0b          	ld	a,(OFST-2,sp)
 350  012b 88            	push	a
 351  012c ae00f9        	ldw	x,#L141
 352  012f cd0000        	call	_printf
 354  0132 84            	pop	a
 355                     ; 146             failures++;
 357  0133 1e0c          	ldw	x,(OFST-1,sp)
 358  0135 1c0001        	addw	x,#1
 359  0138 1f0c          	ldw	(OFST-1,sp),x
 361  013a 2016          	jra	L531
 362  013c               L731:
 363                     ; 151             if (atomSemDelete (&sem1) != ATOM_OK)
 365  013c ae0003        	ldw	x,#L3_sem1
 366  013f cd0000        	call	_atomSemDelete
 368  0142 4d            	tnz	a
 369  0143 270d          	jreq	L531
 370                     ; 153                 ATOMLOG (_STR("Delete failed\n"));
 372  0145 ae0101        	ldw	x,#L711
 373  0148 cd0000        	call	_printf
 375                     ; 154                 failures++;
 377  014b 1e0c          	ldw	x,(OFST-1,sp)
 378  014d 1c0001        	addw	x,#1
 379  0150 1f0c          	ldw	(OFST-1,sp),x
 380  0152               L531:
 381                     ; 160     if (atomSemGet (NULL, 0) != ATOM_ERR_PARAM)
 383  0152 ae0000        	ldw	x,#0
 384  0155 89            	pushw	x
 385  0156 ae0000        	ldw	x,#0
 386  0159 89            	pushw	x
 387  015a 5f            	clrw	x
 388  015b cd0000        	call	_atomSemGet
 390  015e 5b04          	addw	sp,#4
 391  0160 a1c9          	cp	a,#201
 392  0162 270d          	jreq	L741
 393                     ; 162         ATOMLOG (_STR("Get param failed\n"));
 395  0164 ae00e7        	ldw	x,#L151
 396  0167 cd0000        	call	_printf
 398                     ; 163         failures++;
 400  016a 1e0c          	ldw	x,(OFST-1,sp)
 401  016c 1c0001        	addw	x,#1
 402  016f 1f0c          	ldw	(OFST-1,sp),x
 403  0171               L741:
 404                     ; 165     if (atomSemPut (NULL) != ATOM_ERR_PARAM)
 406  0171 5f            	clrw	x
 407  0172 cd0000        	call	_atomSemPut
 409  0175 a1c9          	cp	a,#201
 410  0177 270d          	jreq	L351
 411                     ; 167         ATOMLOG (_STR("Put param failed\n"));
 413  0179 ae00d5        	ldw	x,#L551
 414  017c cd0000        	call	_printf
 416                     ; 168         failures++;
 418  017f 1e0c          	ldw	x,(OFST-1,sp)
 419  0181 1c0001        	addw	x,#1
 420  0184 1f0c          	ldw	(OFST-1,sp),x
 421  0186               L351:
 422                     ; 172     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 424  0186 4b00          	push	#0
 425  0188 ae0003        	ldw	x,#L3_sem1
 426  018b cd0000        	call	_atomSemCreate
 428  018e 5b01          	addw	sp,#1
 429  0190 4d            	tnz	a
 430  0191 2711          	jreq	L751
 431                     ; 174         ATOMLOG (_STR("Error creating test sem1\n"));
 433  0193 ae00bb        	ldw	x,#L161
 434  0196 cd0000        	call	_printf
 436                     ; 175         failures++;
 438  0199 1e0c          	ldw	x,(OFST-1,sp)
 439  019b 1c0001        	addw	x,#1
 440  019e 1f0c          	ldw	(OFST-1,sp),x
 442  01a0 ac370237      	jpf	L361
 443  01a4               L751:
 444                     ; 177     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 446  01a4 4b00          	push	#0
 447  01a6 ae0000        	ldw	x,#L5_sem2
 448  01a9 cd0000        	call	_atomSemCreate
 450  01ac 5b01          	addw	sp,#1
 451  01ae 4d            	tnz	a
 452  01af 270f          	jreq	L561
 453                     ; 179         ATOMLOG (_STR("Error creating test sem2\n"));
 455  01b1 ae00a1        	ldw	x,#L761
 456  01b4 cd0000        	call	_printf
 458                     ; 180         failures++;
 460  01b7 1e0c          	ldw	x,(OFST-1,sp)
 461  01b9 1c0001        	addw	x,#1
 462  01bc 1f0c          	ldw	(OFST-1,sp),x
 464  01be 2077          	jra	L361
 465  01c0               L561:
 466                     ; 185         timer_cb.cb_func = testCallback;
 468  01c0 ae0000        	ldw	x,#L7_testCallback
 469  01c3 1f01          	ldw	(OFST-12,sp),x
 470                     ; 186         timer_cb.cb_data = NULL;
 472  01c5 5f            	clrw	x
 473  01c6 1f03          	ldw	(OFST-10,sp),x
 474                     ; 187         timer_cb.cb_ticks = SYSTEM_TICKS_PER_SEC;
 476  01c8 ae0064        	ldw	x,#100
 477  01cb 1f07          	ldw	(OFST-6,sp),x
 478  01cd ae0000        	ldw	x,#0
 479  01d0 1f05          	ldw	(OFST-8,sp),x
 480                     ; 190         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 482  01d2 96            	ldw	x,sp
 483  01d3 1c0001        	addw	x,#OFST-12
 484  01d6 cd0000        	call	_atomTimerRegister
 486  01d9 4d            	tnz	a
 487  01da 270f          	jreq	L371
 488                     ; 192             ATOMLOG (_STR("Error registering timer\n"));
 490  01dc ae0088        	ldw	x,#L571
 491  01df cd0000        	call	_printf
 493                     ; 193             failures++;
 495  01e2 1e0c          	ldw	x,(OFST-1,sp)
 496  01e4 1c0001        	addw	x,#1
 497  01e7 1f0c          	ldw	(OFST-1,sp),x
 499  01e9 2020          	jra	L771
 500  01eb               L371:
 501                     ; 197         else if (atomSemGet (&sem2, 2 * SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 503  01eb ae00c8        	ldw	x,#200
 504  01ee 89            	pushw	x
 505  01ef ae0000        	ldw	x,#0
 506  01f2 89            	pushw	x
 507  01f3 ae0000        	ldw	x,#L5_sem2
 508  01f6 cd0000        	call	_atomSemGet
 510  01f9 5b04          	addw	sp,#4
 511  01fb 4d            	tnz	a
 512  01fc 270d          	jreq	L771
 513                     ; 199             ATOMLOG (_STR("Context check failed\n"));
 515  01fe ae0072        	ldw	x,#L302
 516  0201 cd0000        	call	_printf
 518                     ; 200             failures++;
 520  0204 1e0c          	ldw	x,(OFST-1,sp)
 521  0206 1c0001        	addw	x,#1
 522  0209 1f0c          	ldw	(OFST-1,sp),x
 523  020b               L771:
 524                     ; 204         if (atomSemDelete (&sem1) != ATOM_OK)
 526  020b ae0003        	ldw	x,#L3_sem1
 527  020e cd0000        	call	_atomSemDelete
 529  0211 4d            	tnz	a
 530  0212 270d          	jreq	L502
 531                     ; 206             ATOMLOG (_STR("Sem1 delete failed\n"));
 533  0214 ae005e        	ldw	x,#L702
 534  0217 cd0000        	call	_printf
 536                     ; 207             failures++;
 538  021a 1e0c          	ldw	x,(OFST-1,sp)
 539  021c 1c0001        	addw	x,#1
 540  021f 1f0c          	ldw	(OFST-1,sp),x
 541  0221               L502:
 542                     ; 209         if (atomSemDelete (&sem2) != ATOM_OK)
 544  0221 ae0000        	ldw	x,#L5_sem2
 545  0224 cd0000        	call	_atomSemDelete
 547  0227 4d            	tnz	a
 548  0228 270d          	jreq	L361
 549                     ; 211             ATOMLOG (_STR("Sem2 delete failed\n"));
 551  022a ae004a        	ldw	x,#L312
 552  022d cd0000        	call	_printf
 554                     ; 212             failures++;
 556  0230 1e0c          	ldw	x,(OFST-1,sp)
 557  0232 1c0001        	addw	x,#1
 558  0235 1f0c          	ldw	(OFST-1,sp),x
 559  0237               L361:
 560                     ; 217     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 562  0237 4b00          	push	#0
 563  0239 ae0003        	ldw	x,#L3_sem1
 564  023c cd0000        	call	_atomSemCreate
 566  023f 5b01          	addw	sp,#1
 567  0241 4d            	tnz	a
 568  0242 270f          	jreq	L512
 569                     ; 219         ATOMLOG (_STR("Error creating test sem1\n"));
 571  0244 ae00bb        	ldw	x,#L161
 572  0247 cd0000        	call	_printf
 574                     ; 220         failures++;
 576  024a 1e0c          	ldw	x,(OFST-1,sp)
 577  024c 1c0001        	addw	x,#1
 578  024f 1f0c          	ldw	(OFST-1,sp),x
 580  0251 203f          	jra	L712
 581  0253               L512:
 582                     ; 225         if ((status = atomSemGet (&sem1, -1)) != ATOM_WOULDBLOCK)
 584  0253 aeffff        	ldw	x,#65535
 585  0256 89            	pushw	x
 586  0257 aeffff        	ldw	x,#-1
 587  025a 89            	pushw	x
 588  025b ae0003        	ldw	x,#L3_sem1
 589  025e cd0000        	call	_atomSemGet
 591  0261 5b04          	addw	sp,#4
 592  0263 6b0b          	ld	(OFST-2,sp),a
 593  0265 7b0b          	ld	a,(OFST-2,sp)
 594  0267 a103          	cp	a,#3
 595  0269 2711          	jreq	L122
 596                     ; 227             ATOMLOG (_STR("Wouldblock err %d\n"), status);
 598  026b 7b0b          	ld	a,(OFST-2,sp)
 599  026d 88            	push	a
 600  026e ae0037        	ldw	x,#L322
 601  0271 cd0000        	call	_printf
 603  0274 84            	pop	a
 604                     ; 228             failures++;
 606  0275 1e0c          	ldw	x,(OFST-1,sp)
 607  0277 1c0001        	addw	x,#1
 608  027a 1f0c          	ldw	(OFST-1,sp),x
 609  027c               L122:
 610                     ; 232         if (atomSemDelete (&sem1) != ATOM_OK)
 612  027c ae0003        	ldw	x,#L3_sem1
 613  027f cd0000        	call	_atomSemDelete
 615  0282 4d            	tnz	a
 616  0283 270d          	jreq	L712
 617                     ; 234             ATOMLOG (_STR("Sem1 delete failed\n"));
 619  0285 ae005e        	ldw	x,#L702
 620  0288 cd0000        	call	_printf
 622                     ; 235             failures++;
 624  028b 1e0c          	ldw	x,(OFST-1,sp)
 625  028d 1c0001        	addw	x,#1
 626  0290 1f0c          	ldw	(OFST-1,sp),x
 627  0292               L712:
 628                     ; 241     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 630  0292 4b00          	push	#0
 631  0294 ae0003        	ldw	x,#L3_sem1
 632  0297 cd0000        	call	_atomSemCreate
 634  029a 5b01          	addw	sp,#1
 635  029c 4d            	tnz	a
 636  029d 270f          	jreq	L722
 637                     ; 243         ATOMLOG (_STR("Error creating test sem1\n"));
 639  029f ae00bb        	ldw	x,#L161
 640  02a2 cd0000        	call	_printf
 642                     ; 244         failures++;
 644  02a5 1e0c          	ldw	x,(OFST-1,sp)
 645  02a7 1c0001        	addw	x,#1
 646  02aa 1f0c          	ldw	(OFST-1,sp),x
 648  02ac 204c          	jra	L132
 649  02ae               L722:
 650                     ; 249         if (atomSemPut (&sem1) != ATOM_OK)
 652  02ae ae0003        	ldw	x,#L3_sem1
 653  02b1 cd0000        	call	_atomSemPut
 655  02b4 4d            	tnz	a
 656  02b5 270d          	jreq	L332
 657                     ; 251             ATOMLOG (_STR("Error on put\n"));
 659  02b7 ae0029        	ldw	x,#L532
 660  02ba cd0000        	call	_printf
 662                     ; 252             failures++;
 664  02bd 1e0c          	ldw	x,(OFST-1,sp)
 665  02bf 1c0001        	addw	x,#1
 666  02c2 1f0c          	ldw	(OFST-1,sp),x
 667  02c4               L332:
 668                     ; 256         if (atomSemGet (&sem1, -1) != ATOM_OK)
 670  02c4 aeffff        	ldw	x,#65535
 671  02c7 89            	pushw	x
 672  02c8 aeffff        	ldw	x,#-1
 673  02cb 89            	pushw	x
 674  02cc ae0003        	ldw	x,#L3_sem1
 675  02cf cd0000        	call	_atomSemGet
 677  02d2 5b04          	addw	sp,#4
 678  02d4 4d            	tnz	a
 679  02d5 270d          	jreq	L732
 680                     ; 258             ATOMLOG (_STR("Error on get\n"));
 682  02d7 ae001b        	ldw	x,#L142
 683  02da cd0000        	call	_printf
 685                     ; 259             failures++;
 687  02dd 1e0c          	ldw	x,(OFST-1,sp)
 688  02df 1c0001        	addw	x,#1
 689  02e2 1f0c          	ldw	(OFST-1,sp),x
 690  02e4               L732:
 691                     ; 263         if (atomSemDelete (&sem1) != ATOM_OK)
 693  02e4 ae0003        	ldw	x,#L3_sem1
 694  02e7 cd0000        	call	_atomSemDelete
 696  02ea 4d            	tnz	a
 697  02eb 270d          	jreq	L132
 698                     ; 265             ATOMLOG (_STR("Sem1 delete failed\n"));
 700  02ed ae005e        	ldw	x,#L702
 701  02f0 cd0000        	call	_printf
 703                     ; 266             failures++;
 705  02f3 1e0c          	ldw	x,(OFST-1,sp)
 706  02f5 1c0001        	addw	x,#1
 707  02f8 1f0c          	ldw	(OFST-1,sp),x
 708  02fa               L132:
 709                     ; 272     if (atomSemCreate (&sem1, 255) != ATOM_OK)
 711  02fa 4bff          	push	#255
 712  02fc ae0003        	ldw	x,#L3_sem1
 713  02ff cd0000        	call	_atomSemCreate
 715  0302 5b01          	addw	sp,#1
 716  0304 4d            	tnz	a
 717  0305 270f          	jreq	L542
 718                     ; 274         ATOMLOG (_STR("Error creating test sem1\n"));
 720  0307 ae00bb        	ldw	x,#L161
 721  030a cd0000        	call	_printf
 723                     ; 275         failures++;
 725  030d 1e0c          	ldw	x,(OFST-1,sp)
 726  030f 1c0001        	addw	x,#1
 727  0312 1f0c          	ldw	(OFST-1,sp),x
 729  0314 202d          	jra	L742
 730  0316               L542:
 731                     ; 280         if (atomSemPut (&sem1) != ATOM_ERR_OVF)
 733  0316 ae0003        	ldw	x,#L3_sem1
 734  0319 cd0000        	call	_atomSemPut
 736  031c a1cb          	cp	a,#203
 737  031e 270d          	jreq	L152
 738                     ; 282             ATOMLOG (_STR("Failed to detect overflow\n"));
 740  0320 ae0000        	ldw	x,#L352
 741  0323 cd0000        	call	_printf
 743                     ; 283             failures++;
 745  0326 1e0c          	ldw	x,(OFST-1,sp)
 746  0328 1c0001        	addw	x,#1
 747  032b 1f0c          	ldw	(OFST-1,sp),x
 748  032d               L152:
 749                     ; 287         if (atomSemDelete (&sem1) != ATOM_OK)
 751  032d ae0003        	ldw	x,#L3_sem1
 752  0330 cd0000        	call	_atomSemDelete
 754  0333 4d            	tnz	a
 755  0334 270d          	jreq	L742
 756                     ; 289             ATOMLOG (_STR("Sem1 delete failed\n"));
 758  0336 ae005e        	ldw	x,#L702
 759  0339 cd0000        	call	_printf
 761                     ; 290             failures++;
 763  033c 1e0c          	ldw	x,(OFST-1,sp)
 764  033e 1c0001        	addw	x,#1
 765  0341 1f0c          	ldw	(OFST-1,sp),x
 766  0343               L742:
 767                     ; 296     return failures;
 769  0343 1e0c          	ldw	x,(OFST-1,sp)
 770  0345 cd0000        	call	c_itolx
 774  0348 5b0d          	addw	sp,#13
 775  034a 81            	ret
 814                     ; 308 static void testCallback (POINTER cb_data)
 814                     ; 309 {
 815                     .text:	section	.text,new
 816  0000               L7_testCallback:
 820                     ; 311     if (atomSemGet(&sem1, 0) == ATOM_ERR_CONTEXT)
 822  0000 ae0000        	ldw	x,#0
 823  0003 89            	pushw	x
 824  0004 ae0000        	ldw	x,#0
 825  0007 89            	pushw	x
 826  0008 ae0003        	ldw	x,#L3_sem1
 827  000b cd0000        	call	_atomSemGet
 829  000e 5b04          	addw	sp,#4
 830  0010 a1c8          	cp	a,#200
 831  0012 2606          	jrne	L772
 832                     ; 314         atomSemPut(&sem2);
 834  0014 ae0000        	ldw	x,#L5_sem2
 835  0017 cd0000        	call	_atomSemPut
 838  001a               L772:
 839                     ; 324 }
 842  001a 81            	ret
1013                     	switch	.bss
1014  0000               L5_sem2:
1015  0000 000000        	ds.b	3
1016  0003               L3_sem1:
1017  0003 000000        	ds.b	3
1018                     	xdef	_test_start
1019                     	xref	_printf
1020                     	xref	_atomSemPut
1021                     	xref	_atomSemGet
1022                     	xref	_atomSemDelete
1023                     	xref	_atomSemCreate
1024                     	xref	_atomTimerRegister
1025                     .const:	section	.text
1026  0000               L352:
1027  0000 4661696c6564  	dc.b	"Failed to detect o"
1028  0012 766572666c6f  	dc.b	"verflow",10,0
1029  001b               L142:
1030  001b 4572726f7220  	dc.b	"Error on get",10,0
1031  0029               L532:
1032  0029 4572726f7220  	dc.b	"Error on put",10,0
1033  0037               L322:
1034  0037 576f756c6462  	dc.b	"Wouldblock err %d",10,0
1035  004a               L312:
1036  004a 53656d322064  	dc.b	"Sem2 delete failed"
1037  005c 0a00          	dc.b	10,0
1038  005e               L702:
1039  005e 53656d312064  	dc.b	"Sem1 delete failed"
1040  0070 0a00          	dc.b	10,0
1041  0072               L302:
1042  0072 436f6e746578  	dc.b	"Context check fail"
1043  0084 65640a00      	dc.b	"ed",10,0
1044  0088               L571:
1045  0088 4572726f7220  	dc.b	"Error registering "
1046  009a 74696d65720a  	dc.b	"timer",10,0
1047  00a1               L761:
1048  00a1 4572726f7220  	dc.b	"Error creating tes"
1049  00b3 742073656d32  	dc.b	"t sem2",10,0
1050  00bb               L161:
1051  00bb 4572726f7220  	dc.b	"Error creating tes"
1052  00cd 742073656d31  	dc.b	"t sem1",10,0
1053  00d5               L551:
1054  00d5 507574207061  	dc.b	"Put param failed",10,0
1055  00e7               L151:
1056  00e7 476574207061  	dc.b	"Get param failed",10,0
1057  00f9               L141:
1058  00f9 476574202564  	dc.b	"Get %d",10,0
1059  0101               L711:
1060  0101 44656c657465  	dc.b	"Delete failed",10,0
1061  0110               L111:
1062  0110 476574206661  	dc.b	"Get failed",10,0
1063  011c               L301:
1064  011c 507574206661  	dc.b	"Put failed",10,0
1065  0128               L57:
1066  0128 54696d6f2025  	dc.b	"Timo %d",10,0
1067  0131               L76:
1068  0131 4572726f7220  	dc.b	"Error creating tes"
1069  0143 742073656d61  	dc.b	"t semaphore 1",10,0
1089                     	xref	c_itolx
1090                     	end
