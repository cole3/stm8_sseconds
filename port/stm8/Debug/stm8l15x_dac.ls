   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.8 - 03 Dec 2008
  32                     ; 136 void DAC_DeInit(void)
  32                     ; 137 {
  34                     .text:	section	.text,new
  35  0000               _DAC_DeInit:
  39                     ; 139   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  41  0000 725f5380      	clr	21376
  42                     ; 140   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  44  0004 725f5381      	clr	21377
  45                     ; 143   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  47  0008 725f5382      	clr	21378
  48                     ; 144   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  50  000c 725f5383      	clr	21379
  51                     ; 147   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  53  0010 725f5384      	clr	21380
  54                     ; 150   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  56  0014 35ff5385      	mov	21381,#255
  57                     ; 153   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  59  0018 725f5388      	clr	21384
  60                     ; 154   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  62  001c 725f5389      	clr	21385
  63                     ; 155   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  65  0020 725f538c      	clr	21388
  66                     ; 156   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  68  0024 725f538d      	clr	21389
  69                     ; 157   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  71  0028 725f5390      	clr	21392
  72                     ; 160   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  74  002c 725f5394      	clr	21396
  75                     ; 161   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  77  0030 725f5395      	clr	21397
  78                     ; 162   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  80  0034 725f5398      	clr	21400
  81                     ; 163   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  83  0038 725f5399      	clr	21401
  84                     ; 164   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  86  003c 725f539c      	clr	21404
  87                     ; 167   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  89  0040 725f53a0      	clr	21408
  90                     ; 168   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
  92  0044 725f53a1      	clr	21409
  93                     ; 169   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
  95  0048 725f53a2      	clr	21410
  96                     ; 170   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
  98  004c 725f53a3      	clr	21411
  99                     ; 173   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 101  0050 725f53a4      	clr	21412
 102                     ; 174   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 104  0054 725f53a5      	clr	21413
 105                     ; 175   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 107  0058 725f53a6      	clr	21414
 108                     ; 176   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 110  005c 725f53a7      	clr	21415
 111                     ; 179   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 113  0060 725f53a8      	clr	21416
 114                     ; 180   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 116  0064 725f53a9      	clr	21417
 117                     ; 181 }
 120  0068 81            	ret
 275                     ; 202 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 275                     ; 203               DAC_Trigger_TypeDef DAC_Trigger,
 275                     ; 204               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 275                     ; 205 {
 276                     .text:	section	.text,new
 277  0000               _DAC_Init:
 279  0000 89            	pushw	x
 280  0001 5203          	subw	sp,#3
 281       00000003      OFST:	set	3
 284                     ; 206   uint8_t tmpreg = 0;
 286  0003 7b03          	ld	a,(OFST+0,sp)
 287  0005 97            	ld	xl,a
 288                     ; 207   uint16_t tmpreg2 = 0;
 290  0006 1e01          	ldw	x,(OFST-2,sp)
 291                     ; 210   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 293                     ; 211   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 295                     ; 212   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 297                     ; 215   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 299  0008 7b04          	ld	a,(OFST+1,sp)
 300  000a 48            	sll	a
 301  000b 5f            	clrw	x
 302  000c 97            	ld	xl,a
 303  000d 1f01          	ldw	(OFST-2,sp),x
 304                     ; 216   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 306  000f 1e01          	ldw	x,(OFST-2,sp)
 307  0011 d65380        	ld	a,(21376,x)
 308  0014 6b03          	ld	(OFST+0,sp),a
 309                     ; 219   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 311  0016 7b03          	ld	a,(OFST+0,sp)
 312  0018 a4c1          	and	a,#193
 313  001a 6b03          	ld	(OFST+0,sp),a
 314                     ; 222   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 316  001c 7b03          	ld	a,(OFST+0,sp)
 317  001e 1a08          	or	a,(OFST+5,sp)
 318  0020 6b03          	ld	(OFST+0,sp),a
 319                     ; 226   if (DAC_Trigger != DAC_Trigger_None)
 321  0022 7b05          	ld	a,(OFST+2,sp)
 322  0024 a130          	cp	a,#48
 323  0026 2708          	jreq	L111
 324                     ; 229     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 326  0028 7b05          	ld	a,(OFST+2,sp)
 327  002a aa04          	or	a,#4
 328  002c 1a03          	or	a,(OFST+0,sp)
 329  002e 6b03          	ld	(OFST+0,sp),a
 330  0030               L111:
 331                     ; 233   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 333  0030 7b03          	ld	a,(OFST+0,sp)
 334  0032 1e01          	ldw	x,(OFST-2,sp)
 335  0034 d75380        	ld	(21376,x),a
 336                     ; 234 }
 339  0037 5b05          	addw	sp,#5
 340  0039 81            	ret
 412                     ; 248 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 412                     ; 249 {
 413                     .text:	section	.text,new
 414  0000               _DAC_Cmd:
 416  0000 89            	pushw	x
 417  0001 89            	pushw	x
 418       00000002      OFST:	set	2
 421                     ; 250   uint16_t cr1addr = 0;
 423  0002 5f            	clrw	x
 424  0003 1f01          	ldw	(OFST-1,sp),x
 425                     ; 252   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 427                     ; 253   assert_param(IS_FUNCTIONAL_STATE(NewState));
 429                     ; 256   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 431  0005 7b03          	ld	a,(OFST+1,sp)
 432  0007 48            	sll	a
 433  0008 5f            	clrw	x
 434  0009 97            	ld	xl,a
 435  000a 1c5380        	addw	x,#21376
 436  000d 1f01          	ldw	(OFST-1,sp),x
 437                     ; 258   if (NewState != DISABLE)
 439  000f 0d04          	tnz	(OFST+2,sp)
 440  0011 2708          	jreq	L741
 441                     ; 261     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 443  0013 1e01          	ldw	x,(OFST-1,sp)
 444  0015 f6            	ld	a,(x)
 445  0016 aa01          	or	a,#1
 446  0018 f7            	ld	(x),a
 448  0019 2006          	jra	L151
 449  001b               L741:
 450                     ; 266     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 452  001b 1e01          	ldw	x,(OFST-1,sp)
 453  001d f6            	ld	a,(x)
 454  001e a4fe          	and	a,#254
 455  0020 f7            	ld	(x),a
 456  0021               L151:
 457                     ; 268 }
 460  0021 5b04          	addw	sp,#4
 461  0023 81            	ret
 507                     ; 280 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 507                     ; 281 {
 508                     .text:	section	.text,new
 509  0000               _DAC_SoftwareTriggerCmd:
 511  0000 89            	pushw	x
 512       00000000      OFST:	set	0
 515                     ; 283   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 517                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 519                     ; 286   if (NewState != DISABLE)
 521  0001 9f            	ld	a,xl
 522  0002 4d            	tnz	a
 523  0003 2714          	jreq	L571
 524                     ; 289     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 526  0005 9e            	ld	a,xh
 527  0006 5f            	clrw	x
 528  0007 97            	ld	xl,a
 529  0008 a601          	ld	a,#1
 530  000a 5d            	tnzw	x
 531  000b 2704          	jreq	L41
 532  000d               L61:
 533  000d 48            	sll	a
 534  000e 5a            	decw	x
 535  000f 26fc          	jrne	L61
 536  0011               L41:
 537  0011 ca5384        	or	a,21380
 538  0014 c75384        	ld	21380,a
 540  0017 2014          	jra	L771
 541  0019               L571:
 542                     ; 294     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 544  0019 7b01          	ld	a,(OFST+1,sp)
 545  001b 5f            	clrw	x
 546  001c 97            	ld	xl,a
 547  001d a601          	ld	a,#1
 548  001f 5d            	tnzw	x
 549  0020 2704          	jreq	L02
 550  0022               L22:
 551  0022 48            	sll	a
 552  0023 5a            	decw	x
 553  0024 26fc          	jrne	L22
 554  0026               L02:
 555  0026 43            	cpl	a
 556  0027 c45384        	and	a,21380
 557  002a c75384        	ld	21380,a
 558  002d               L771:
 559                     ; 296 }
 562  002d 85            	popw	x
 563  002e 81            	ret
 599                     ; 305 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 599                     ; 306 {
 600                     .text:	section	.text,new
 601  0000               _DAC_DualSoftwareTriggerCmd:
 605                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 607                     ; 310   if (NewState != DISABLE)
 609  0000 4d            	tnz	a
 610  0001 270a          	jreq	L712
 611                     ; 313     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 613  0003 c65384        	ld	a,21380
 614  0006 aa03          	or	a,#3
 615  0008 c75384        	ld	21380,a
 617  000b 2008          	jra	L122
 618  000d               L712:
 619                     ; 318     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 621  000d c65384        	ld	a,21380
 622  0010 a4fc          	and	a,#252
 623  0012 c75384        	ld	21380,a
 624  0015               L122:
 625                     ; 320 }
 628  0015 81            	ret
 711                     ; 336 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 711                     ; 337                            DAC_Wave_TypeDef DAC_Wave,
 711                     ; 338                            FunctionalState NewState)
 711                     ; 339 {
 712                     .text:	section	.text,new
 713  0000               _DAC_WaveGenerationCmd:
 715  0000 89            	pushw	x
 716  0001 88            	push	a
 717       00000001      OFST:	set	1
 720                     ; 340   uint8_t tmpreg = 0;
 722  0002 0f01          	clr	(OFST+0,sp)
 723                     ; 343   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 725                     ; 344   assert_param(IS_DAC_WAVE(DAC_Wave));
 727                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 729                     ; 348   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 731  0004 9e            	ld	a,xh
 732  0005 48            	sll	a
 733  0006 5f            	clrw	x
 734  0007 97            	ld	xl,a
 735  0008 d65380        	ld	a,(21376,x)
 736  000b a43f          	and	a,#63
 737  000d 6b01          	ld	(OFST+0,sp),a
 738                     ; 350   if (NewState != DISABLE)
 740  000f 0d06          	tnz	(OFST+5,sp)
 741  0011 2706          	jreq	L362
 742                     ; 352     tmpreg |= (uint8_t)(DAC_Wave);
 744  0013 7b01          	ld	a,(OFST+0,sp)
 745  0015 1a03          	or	a,(OFST+2,sp)
 746  0017 6b01          	ld	(OFST+0,sp),a
 747  0019               L362:
 748                     ; 356   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 750  0019 7b02          	ld	a,(OFST+1,sp)
 751  001b 48            	sll	a
 752  001c 5f            	clrw	x
 753  001d 97            	ld	xl,a
 754  001e 7b01          	ld	a,(OFST+0,sp)
 755  0020 d75380        	ld	(21376,x),a
 756                     ; 358 }
 759  0023 5b03          	addw	sp,#3
 760  0025 81            	ret
 922                     ; 382 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 922                     ; 383 {
 923                     .text:	section	.text,new
 924  0000               _DAC_SetNoiseWaveLFSR:
 926  0000 89            	pushw	x
 927  0001 5203          	subw	sp,#3
 928       00000003      OFST:	set	3
 931                     ; 384   uint8_t tmpreg = 0;
 933  0003 7b01          	ld	a,(OFST-2,sp)
 934  0005 97            	ld	xl,a
 935                     ; 385   uint16_t cr2addr = 0;
 937  0006 1e02          	ldw	x,(OFST-1,sp)
 938                     ; 388   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 940                     ; 389   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 942                     ; 392   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 944  0008 7b04          	ld	a,(OFST+1,sp)
 945  000a 48            	sll	a
 946  000b 5f            	clrw	x
 947  000c 97            	ld	xl,a
 948  000d 1c5381        	addw	x,#21377
 949  0010 1f02          	ldw	(OFST-1,sp),x
 950                     ; 393   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 952  0012 1e02          	ldw	x,(OFST-1,sp)
 953  0014 f6            	ld	a,(x)
 954  0015 a4f0          	and	a,#240
 955  0017 6b01          	ld	(OFST-2,sp),a
 956                     ; 396   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 958  0019 7b01          	ld	a,(OFST-2,sp)
 959  001b 1a05          	or	a,(OFST+2,sp)
 960  001d 1e02          	ldw	x,(OFST-1,sp)
 961  001f f7            	ld	(x),a
 962                     ; 397 }
 965  0020 5b05          	addw	sp,#5
 966  0022 81            	ret
1129                     ; 421 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1129                     ; 422 {
1130                     .text:	section	.text,new
1131  0000               _DAC_SetTriangleWaveAmplitude:
1133  0000 89            	pushw	x
1134  0001 5203          	subw	sp,#3
1135       00000003      OFST:	set	3
1138                     ; 423   uint8_t tmpreg = 0;
1140  0003 7b01          	ld	a,(OFST-2,sp)
1141  0005 97            	ld	xl,a
1142                     ; 424   uint16_t cr2addr = 0;
1144  0006 1e02          	ldw	x,(OFST-1,sp)
1145                     ; 427   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1147                     ; 428   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1149                     ; 432   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1151  0008 7b04          	ld	a,(OFST+1,sp)
1152  000a 48            	sll	a
1153  000b 5f            	clrw	x
1154  000c 97            	ld	xl,a
1155  000d 1c5381        	addw	x,#21377
1156  0010 1f02          	ldw	(OFST-1,sp),x
1157                     ; 433   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1159  0012 1e02          	ldw	x,(OFST-1,sp)
1160  0014 f6            	ld	a,(x)
1161  0015 a4f0          	and	a,#240
1162  0017 6b01          	ld	(OFST-2,sp),a
1163                     ; 436   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1165  0019 7b01          	ld	a,(OFST-2,sp)
1166  001b 1a05          	or	a,(OFST+2,sp)
1167  001d 1e02          	ldw	x,(OFST-1,sp)
1168  001f f7            	ld	(x),a
1169                     ; 437 }
1172  0020 5b05          	addw	sp,#5
1173  0022 81            	ret
1243                     ; 449 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1243                     ; 450 {
1244                     .text:	section	.text,new
1245  0000               _DAC_SetChannel1Data:
1247  0000 88            	push	a
1248       00000000      OFST:	set	0
1251                     ; 452   assert_param(IS_DAC_ALIGN(DAC_Align));
1253                     ; 454   if (DAC_Align != DAC_Align_8b_R)
1255  0001 a108          	cp	a,#8
1256  0003 2712          	jreq	L364
1257                     ; 457     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1259  0005 5f            	clrw	x
1260  0006 97            	ld	xl,a
1261  0007 7b04          	ld	a,(OFST+4,sp)
1262  0009 d75388        	ld	(21384,x),a
1263                     ; 458     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1265  000c 7b01          	ld	a,(OFST+1,sp)
1266  000e 5f            	clrw	x
1267  000f 97            	ld	xl,a
1268  0010 7b05          	ld	a,(OFST+5,sp)
1269  0012 d75389        	ld	(21385,x),a
1271  0015 2005          	jra	L564
1272  0017               L364:
1273                     ; 463     assert_param(IS_DAC_DATA_08R(DAC_Data));
1275                     ; 466     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1277  0017 7b05          	ld	a,(OFST+5,sp)
1278  0019 c75390        	ld	21392,a
1279  001c               L564:
1280                     ; 468 }
1283  001c 84            	pop	a
1284  001d 81            	ret
1327                     ; 480 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1327                     ; 481 {
1328                     .text:	section	.text,new
1329  0000               _DAC_SetChannel2Data:
1331  0000 88            	push	a
1332       00000000      OFST:	set	0
1335                     ; 483   assert_param(IS_DAC_ALIGN(DAC_Align));
1337                     ; 485   if (DAC_Align != DAC_Align_8b_R)
1339  0001 a108          	cp	a,#8
1340  0003 2712          	jreq	L705
1341                     ; 488     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1343  0005 5f            	clrw	x
1344  0006 97            	ld	xl,a
1345  0007 7b04          	ld	a,(OFST+4,sp)
1346  0009 d75394        	ld	(21396,x),a
1347                     ; 489     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1349  000c 7b01          	ld	a,(OFST+1,sp)
1350  000e 5f            	clrw	x
1351  000f 97            	ld	xl,a
1352  0010 7b05          	ld	a,(OFST+5,sp)
1353  0012 d75395        	ld	(21397,x),a
1355  0015 2005          	jra	L115
1356  0017               L705:
1357                     ; 494     assert_param(IS_DAC_DATA_08R(DAC_Data));
1359                     ; 497     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1361  0017 7b05          	ld	a,(OFST+5,sp)
1362  0019 c7539c        	ld	21404,a
1363  001c               L115:
1364                     ; 499 }
1367  001c 84            	pop	a
1368  001d 81            	ret
1425                     ; 516 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1425                     ; 517 {
1426                     .text:	section	.text,new
1427  0000               _DAC_SetDualChannelData:
1429  0000 88            	push	a
1430  0001 89            	pushw	x
1431       00000002      OFST:	set	2
1434                     ; 518   uint16_t dchxrdhrhaddr = 0;
1436  0002 5f            	clrw	x
1437  0003 1f01          	ldw	(OFST-1,sp),x
1438                     ; 521   assert_param(IS_DAC_ALIGN(DAC_Align));
1440                     ; 523   if (DAC_Align != DAC_Align_8b_R)
1442  0005 a108          	cp	a,#8
1443  0007 2727          	jreq	L735
1444                     ; 526     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1446  0009 a653          	ld	a,#83
1447  000b 97            	ld	xl,a
1448  000c a6a0          	ld	a,#160
1449  000e 1b03          	add	a,(OFST+1,sp)
1450  0010 2401          	jrnc	L24
1451  0012 5c            	incw	x
1452  0013               L24:
1453  0013 02            	rlwa	x,a
1454  0014 1f01          	ldw	(OFST-1,sp),x
1455  0016 01            	rrwa	x,a
1456                     ; 529     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1458  0017 7b08          	ld	a,(OFST+6,sp)
1459  0019 1e01          	ldw	x,(OFST-1,sp)
1460  001b f7            	ld	(x),a
1461                     ; 530     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1463  001c 7b09          	ld	a,(OFST+7,sp)
1464  001e 1e01          	ldw	x,(OFST-1,sp)
1465  0020 e701          	ld	(1,x),a
1466                     ; 531     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1468  0022 7b06          	ld	a,(OFST+4,sp)
1469  0024 1e01          	ldw	x,(OFST-1,sp)
1470  0026 e702          	ld	(2,x),a
1471                     ; 532     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1473  0028 7b07          	ld	a,(OFST+5,sp)
1474  002a 1e01          	ldw	x,(OFST-1,sp)
1475  002c e703          	ld	(3,x),a
1477  002e 200a          	jra	L145
1478  0030               L735:
1479                     ; 537     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1481                     ; 540     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1483  0030 7b09          	ld	a,(OFST+7,sp)
1484  0032 c753a8        	ld	21416,a
1485                     ; 541     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1487  0035 7b07          	ld	a,(OFST+5,sp)
1488  0037 c753a9        	ld	21417,a
1489  003a               L145:
1490                     ; 543 }
1493  003a 5b03          	addw	sp,#3
1494  003c 81            	ret
1544                     ; 553 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1544                     ; 554 {
1545                     .text:	section	.text,new
1546  0000               _DAC_GetDataOutputValue:
1548  0000 89            	pushw	x
1549       00000002      OFST:	set	2
1552                     ; 555   uint16_t outputdata = 0;
1554  0001 1e01          	ldw	x,(OFST-1,sp)
1555                     ; 556   uint16_t tmp = 0;
1557  0003 1e01          	ldw	x,(OFST-1,sp)
1558                     ; 559   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1560                     ; 561   if ( DAC_Channel ==  DAC_Channel_1)
1562  0005 4d            	tnz	a
1563  0006 2619          	jrne	L565
1564                     ; 564     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1566  0008 c653ac        	ld	a,21420
1567  000b 5f            	clrw	x
1568  000c 97            	ld	xl,a
1569  000d 4f            	clr	a
1570  000e 02            	rlwa	x,a
1571  000f 1f01          	ldw	(OFST-1,sp),x
1572                     ; 565     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1574  0011 c653ad        	ld	a,21421
1575  0014 5f            	clrw	x
1576  0015 97            	ld	xl,a
1577  0016 01            	rrwa	x,a
1578  0017 1a02          	or	a,(OFST+0,sp)
1579  0019 01            	rrwa	x,a
1580  001a 1a01          	or	a,(OFST-1,sp)
1581  001c 01            	rrwa	x,a
1582  001d 1f01          	ldw	(OFST-1,sp),x
1584  001f 2017          	jra	L765
1585  0021               L565:
1586                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1588  0021 c653b0        	ld	a,21424
1589  0024 5f            	clrw	x
1590  0025 97            	ld	xl,a
1591  0026 4f            	clr	a
1592  0027 02            	rlwa	x,a
1593  0028 1f01          	ldw	(OFST-1,sp),x
1594                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1596  002a c653b1        	ld	a,21425
1597  002d 5f            	clrw	x
1598  002e 97            	ld	xl,a
1599  002f 01            	rrwa	x,a
1600  0030 1a02          	or	a,(OFST+0,sp)
1601  0032 01            	rrwa	x,a
1602  0033 1a01          	or	a,(OFST-1,sp)
1603  0035 01            	rrwa	x,a
1604  0036 1f01          	ldw	(OFST-1,sp),x
1605  0038               L765:
1606                     ; 575   return (uint16_t)outputdata;
1608  0038 1e01          	ldw	x,(OFST-1,sp)
1611  003a 5b02          	addw	sp,#2
1612  003c 81            	ret
1664                     ; 607 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1664                     ; 608 {
1665                     .text:	section	.text,new
1666  0000               _DAC_DMACmd:
1668  0000 89            	pushw	x
1669  0001 89            	pushw	x
1670       00000002      OFST:	set	2
1673                     ; 609   uint16_t cr2addr = 0;
1675  0002 5f            	clrw	x
1676  0003 1f01          	ldw	(OFST-1,sp),x
1677                     ; 612   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1679                     ; 613   assert_param(IS_FUNCTIONAL_STATE(NewState));
1681                     ; 616   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1683  0005 7b03          	ld	a,(OFST+1,sp)
1684  0007 48            	sll	a
1685  0008 5f            	clrw	x
1686  0009 97            	ld	xl,a
1687  000a 1c5381        	addw	x,#21377
1688  000d 1f01          	ldw	(OFST-1,sp),x
1689                     ; 618   if (NewState != DISABLE)
1691  000f 0d04          	tnz	(OFST+2,sp)
1692  0011 2708          	jreq	L516
1693                     ; 621     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1695  0013 1e01          	ldw	x,(OFST-1,sp)
1696  0015 f6            	ld	a,(x)
1697  0016 aa10          	or	a,#16
1698  0018 f7            	ld	(x),a
1700  0019 2006          	jra	L716
1701  001b               L516:
1702                     ; 626     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1704  001b 1e01          	ldw	x,(OFST-1,sp)
1705  001d f6            	ld	a,(x)
1706  001e a4ef          	and	a,#239
1707  0020 f7            	ld	(x),a
1708  0021               L716:
1709                     ; 628 }
1712  0021 5b04          	addw	sp,#4
1713  0023 81            	ret
1788                     ; 661 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1788                     ; 662 {
1789                     .text:	section	.text,new
1790  0000               _DAC_ITConfig:
1792  0000 89            	pushw	x
1793  0001 89            	pushw	x
1794       00000002      OFST:	set	2
1797                     ; 663   uint16_t cr2addr = 0;
1799  0002 5f            	clrw	x
1800  0003 1f01          	ldw	(OFST-1,sp),x
1801                     ; 666   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1803                     ; 667   assert_param(IS_FUNCTIONAL_STATE(NewState));
1805                     ; 668   assert_param(IS_DAC_IT(DAC_IT));
1807                     ; 671   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1809  0005 7b03          	ld	a,(OFST+1,sp)
1810  0007 48            	sll	a
1811  0008 5f            	clrw	x
1812  0009 97            	ld	xl,a
1813  000a 1c5381        	addw	x,#21377
1814  000d 1f01          	ldw	(OFST-1,sp),x
1815                     ; 673   if (NewState != DISABLE)
1817  000f 0d07          	tnz	(OFST+5,sp)
1818  0011 2708          	jreq	L756
1819                     ; 676     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1821  0013 1e01          	ldw	x,(OFST-1,sp)
1822  0015 f6            	ld	a,(x)
1823  0016 1a04          	or	a,(OFST+2,sp)
1824  0018 f7            	ld	(x),a
1826  0019 2007          	jra	L166
1827  001b               L756:
1828                     ; 681     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1830  001b 1e01          	ldw	x,(OFST-1,sp)
1831  001d 7b04          	ld	a,(OFST+2,sp)
1832  001f 43            	cpl	a
1833  0020 f4            	and	a,(x)
1834  0021 f7            	ld	(x),a
1835  0022               L166:
1836                     ; 683 }
1839  0022 5b04          	addw	sp,#4
1840  0024 81            	ret
1936                     ; 698 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1936                     ; 699 {
1937                     .text:	section	.text,new
1938  0000               _DAC_GetFlagStatus:
1940  0000 89            	pushw	x
1941  0001 88            	push	a
1942       00000001      OFST:	set	1
1945                     ; 700   FlagStatus flagstatus = RESET;
1947  0002 7b01          	ld	a,(OFST+0,sp)
1948  0004 97            	ld	xl,a
1949                     ; 701   uint8_t flag = 0;
1951  0005 7b01          	ld	a,(OFST+0,sp)
1952  0007 97            	ld	xl,a
1953                     ; 704   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1955                     ; 705   assert_param(IS_DAC_FLAG(DAC_FLAG));
1957                     ; 707   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1959  0008 7b02          	ld	a,(OFST+1,sp)
1960  000a 5f            	clrw	x
1961  000b 97            	ld	xl,a
1962  000c 7b03          	ld	a,(OFST+2,sp)
1963  000e 5d            	tnzw	x
1964  000f 2704          	jreq	L45
1965  0011               L65:
1966  0011 48            	sll	a
1967  0012 5a            	decw	x
1968  0013 26fc          	jrne	L65
1969  0015               L45:
1970  0015 6b01          	ld	(OFST+0,sp),a
1971                     ; 710   if ((DAC->SR & flag ) != (uint8_t)RESET)
1973  0017 c65385        	ld	a,21381
1974  001a 1501          	bcp	a,(OFST+0,sp)
1975  001c 2706          	jreq	L137
1976                     ; 713     flagstatus = SET;
1978  001e a601          	ld	a,#1
1979  0020 6b01          	ld	(OFST+0,sp),a
1981  0022 2002          	jra	L337
1982  0024               L137:
1983                     ; 718     flagstatus = RESET;
1985  0024 0f01          	clr	(OFST+0,sp)
1986  0026               L337:
1987                     ; 722   return  flagstatus;
1989  0026 7b01          	ld	a,(OFST+0,sp)
1992  0028 5b03          	addw	sp,#3
1993  002a 81            	ret
2045                     ; 736 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2045                     ; 737 {
2046                     .text:	section	.text,new
2047  0000               _DAC_ClearFlag:
2049  0000 89            	pushw	x
2050  0001 88            	push	a
2051       00000001      OFST:	set	1
2054                     ; 738   uint8_t flag = 0;
2056  0002 0f01          	clr	(OFST+0,sp)
2057                     ; 741   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2059                     ; 742   assert_param(IS_DAC_FLAG(DAC_FLAG));
2061                     ; 745   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2063  0004 9e            	ld	a,xh
2064  0005 5f            	clrw	x
2065  0006 97            	ld	xl,a
2066  0007 7b03          	ld	a,(OFST+2,sp)
2067  0009 5d            	tnzw	x
2068  000a 2704          	jreq	L26
2069  000c               L46:
2070  000c 48            	sll	a
2071  000d 5a            	decw	x
2072  000e 26fc          	jrne	L46
2073  0010               L26:
2074  0010 6b01          	ld	(OFST+0,sp),a
2075                     ; 748   DAC->SR = (uint8_t)(~flag);
2077  0012 7b01          	ld	a,(OFST+0,sp)
2078  0014 43            	cpl	a
2079  0015 c75385        	ld	21381,a
2080                     ; 749 }
2083  0018 5b03          	addw	sp,#3
2084  001a 81            	ret
2161                     ; 764 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2161                     ; 765 {
2162                     .text:	section	.text,new
2163  0000               _DAC_GetITStatus:
2165  0000 89            	pushw	x
2166  0001 89            	pushw	x
2167       00000002      OFST:	set	2
2170                     ; 766   ITStatus itstatus = RESET;
2172  0002 7b02          	ld	a,(OFST+0,sp)
2173  0004 97            	ld	xl,a
2174                     ; 767   uint8_t enablestatus = 0;
2176  0005 7b01          	ld	a,(OFST-1,sp)
2177  0007 97            	ld	xl,a
2178                     ; 768   uint8_t flagstatus = 0;
2180  0008 7b02          	ld	a,(OFST+0,sp)
2181  000a 97            	ld	xl,a
2182                     ; 769   uint8_t tempreg = 0;
2184  000b 7b02          	ld	a,(OFST+0,sp)
2185  000d 97            	ld	xl,a
2186                     ; 772   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2188                     ; 773   assert_param(IS_DAC_IT(DAC_IT));
2190                     ; 776   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2192  000e 7b03          	ld	a,(OFST+1,sp)
2193  0010 48            	sll	a
2194  0011 48            	sll	a
2195  0012 5f            	clrw	x
2196  0013 97            	ld	xl,a
2197  0014 d65381        	ld	a,(21377,x)
2198  0017 6b02          	ld	(OFST+0,sp),a
2199                     ; 777   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2201  0019 7b03          	ld	a,(OFST+1,sp)
2202  001b 5f            	clrw	x
2203  001c 97            	ld	xl,a
2204  001d 7b04          	ld	a,(OFST+2,sp)
2205  001f 5d            	tnzw	x
2206  0020 2704          	jreq	L07
2207  0022               L27:
2208  0022 48            	sll	a
2209  0023 5a            	decw	x
2210  0024 26fc          	jrne	L27
2211  0026               L07:
2212  0026 1402          	and	a,(OFST+0,sp)
2213  0028 6b01          	ld	(OFST-1,sp),a
2214                     ; 778   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2216  002a a605          	ld	a,#5
2217  002c 1003          	sub	a,(OFST+1,sp)
2218  002e 5f            	clrw	x
2219  002f 97            	ld	xl,a
2220  0030 7b04          	ld	a,(OFST+2,sp)
2221  0032 5d            	tnzw	x
2222  0033 2704          	jreq	L47
2223  0035               L67:
2224  0035 44            	srl	a
2225  0036 5a            	decw	x
2226  0037 26fc          	jrne	L67
2227  0039               L47:
2228  0039 c45385        	and	a,21381
2229  003c 6b02          	ld	(OFST+0,sp),a
2230                     ; 781   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2232  003e 0d02          	tnz	(OFST+0,sp)
2233  0040 270a          	jreq	L5101
2235  0042 0d01          	tnz	(OFST-1,sp)
2236  0044 2706          	jreq	L5101
2237                     ; 784     itstatus = SET;
2239  0046 a601          	ld	a,#1
2240  0048 6b02          	ld	(OFST+0,sp),a
2242  004a 2002          	jra	L7101
2243  004c               L5101:
2244                     ; 789     itstatus = RESET;
2246  004c 0f02          	clr	(OFST+0,sp)
2247  004e               L7101:
2248                     ; 793   return  itstatus;
2250  004e 7b02          	ld	a,(OFST+0,sp)
2253  0050 5b04          	addw	sp,#4
2254  0052 81            	ret
2300                     ; 807 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2300                     ; 808 {
2301                     .text:	section	.text,new
2302  0000               _DAC_ClearITPendingBit:
2304  0000 89            	pushw	x
2305       00000000      OFST:	set	0
2308                     ; 810   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2310                     ; 811   assert_param(IS_DAC_IT(DAC_IT));
2312                     ; 814   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2314  0001 9e            	ld	a,xh
2315  0002 a005          	sub	a,#5
2316  0004 40            	neg	a
2317  0005 5f            	clrw	x
2318  0006 97            	ld	xl,a
2319  0007 7b02          	ld	a,(OFST+2,sp)
2320  0009 5d            	tnzw	x
2321  000a 2704          	jreq	L201
2322  000c               L401:
2323  000c 44            	srl	a
2324  000d 5a            	decw	x
2325  000e 26fc          	jrne	L401
2326  0010               L201:
2327  0010 43            	cpl	a
2328  0011 c75385        	ld	21381,a
2329                     ; 815 }
2332  0014 85            	popw	x
2333  0015 81            	ret
2346                     	xdef	_DAC_ClearITPendingBit
2347                     	xdef	_DAC_GetITStatus
2348                     	xdef	_DAC_ClearFlag
2349                     	xdef	_DAC_GetFlagStatus
2350                     	xdef	_DAC_ITConfig
2351                     	xdef	_DAC_DMACmd
2352                     	xdef	_DAC_GetDataOutputValue
2353                     	xdef	_DAC_SetDualChannelData
2354                     	xdef	_DAC_SetChannel2Data
2355                     	xdef	_DAC_SetChannel1Data
2356                     	xdef	_DAC_SetTriangleWaveAmplitude
2357                     	xdef	_DAC_SetNoiseWaveLFSR
2358                     	xdef	_DAC_WaveGenerationCmd
2359                     	xdef	_DAC_DualSoftwareTriggerCmd
2360                     	xdef	_DAC_SoftwareTriggerCmd
2361                     	xdef	_DAC_Cmd
2362                     	xdef	_DAC_Init
2363                     	xdef	_DAC_DeInit
2382                     	end
