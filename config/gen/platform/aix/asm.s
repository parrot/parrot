# Branch hints suppressed.
.machine "pwr"
.set r0,0; .set SP,1; .set RTOC,2; .set r3,3; .set r4,4
.set r5,5; .set r6,6; .set r7,7; .set r8,8; .set r9,9
.set r10,10; .set r11,11; .set r12,12; .set r13,13; .set r14,14
.set r15,15; .set r16,16; .set r17,17; .set r18,18; .set r19,19
.set r20,20; .set r21,21; .set r22,22; .set r23,23; .set r24,24
.set r25,25; .set r26,26; .set r27,27; .set r28,28; .set r29,29
.set r30,30; .set r31,31
.set fp0,0; .set fp1,1; .set fp2,2; .set fp3,3; .set fp4,4
.set fp5,5; .set fp6,6; .set fp7,7; .set fp8,8; .set fp9,9
.set fp10,10; .set fp11,11; .set fp12,12; .set fp13,13; .set fp14,14
.set fp15,15; .set fp16,16; .set fp17,17; .set fp18,18; .set fp19,19
.set fp20,20; .set fp21,21; .set fp22,22; .set fp23,23; .set fp24,24
.set fp25,25; .set fp26,26; .set fp27,27; .set fp28,28; .set fp29,29
.set fp30,30; .set fp31,31
.set MQ,0; .set XER,1; .set FROM_RTCU,4; .set FROM_RTCL,5; .set FROM_DEC,6
.set LR,8; .set CTR,9; .set TID,17; .set DSISR,18; .set DAR,19; .set TO_RTCU,20
.set TO_RTCL,21; .set TO_DEC,22; .set SDR_0,24; .set SDR_1,25; .set SRR_0,26
.set SRR_1,27
.set BO_dCTR_NZERO_AND_NOT,0; .set BO_dCTR_NZERO_AND_NOT_1,1
.set BO_dCTR_ZERO_AND_NOT,2; .set BO_dCTR_ZERO_AND_NOT_1,3
.set BO_IF_NOT,4; .set BO_IF_NOT_1,5; .set BO_IF_NOT_2,6
.set BO_IF_NOT_3,7; .set BO_dCTR_NZERO_AND,8; .set BO_dCTR_NZERO_AND_1,9
.set BO_dCTR_ZERO_AND,10; .set BO_dCTR_ZERO_AND_1,11; .set BO_IF,12
.set BO_IF_1,13; .set BO_IF_2,14; .set BO_IF_3,15; .set BO_dCTR_NZERO,16
.set BO_dCTR_NZERO_1,17; .set BO_dCTR_ZERO,18; .set BO_dCTR_ZERO_1,19
.set BO_ALWAYS,20; .set BO_ALWAYS_1,21; .set BO_ALWAYS_2,22
.set BO_ALWAYS_3,23; .set BO_dCTR_NZERO_8,24; .set BO_dCTR_NZERO_9,25
.set BO_dCTR_ZERO_8,26; .set BO_dCTR_ZERO_9,27; .set BO_ALWAYS_8,28
.set BO_ALWAYS_9,29; .set BO_ALWAYS_10,30; .set BO_ALWAYS_11,31
.set CR0_LT,0; .set CR0_GT,1; .set CR0_EQ,2; .set CR0_SO,3
.set CR1_FX,4; .set CR1_FEX,5; .set CR1_VX,6; .set CR1_OX,7
.set CR2_LT,8; .set CR2_GT,9; .set CR2_EQ,10; .set CR2_SO,11
.set CR3_LT,12; .set CR3_GT,13; .set CR3_EQ,14; .set CR3_SO,15
.set CR4_LT,16; .set CR4_GT,17; .set CR4_EQ,18; .set CR4_SO,19
.set CR5_LT,20; .set CR5_GT,21; .set CR5_EQ,22; .set CR5_SO,23
.set CR6_LT,24; .set CR6_GT,25; .set CR6_EQ,26; .set CR6_SO,27
.set CR7_LT,28; .set CR7_GT,29; .set CR7_EQ,30; .set CR7_SO,31
.set TO_LT,16; .set TO_GT,8; .set TO_EQ,4; .set TO_LLT,2; .set TO_LGT,1

	.rename	H.19.NO_SYMBOL{PR},""
	.rename	H.51.ppc_get_toc{TC},"ppc_get_toc"
	.rename	H.55.ppc_sync{TC},"ppc_sync"
	.rename	H.59.ppc_dcbf{TC},"ppc_dcbf"

	.lglobl	H.19.NO_SYMBOL{PR}
	.globl	.ppc_get_toc
	.globl	.ppc_sync
	.globl	.ppc_dcbf
	.globl	ppc_get_toc{DS}
	.globl	ppc_sync{DS}
	.globl	ppc_dcbf{DS}


# .text section
	.file	"sync-cache-factored.c"
	.stabx	"__default_char:t18=-5",0x00,0x8c,0x0
	.stabx	":t2=-2",0x00,0x8c,0x0
	.stabx	":t1=-11",0x00,0x8c,0x0
	.stabx	":t3=*-2",0x00,0x8c,0x0
	.stabx	":t4=f-11;",0x00,0x8c,0x0
	.stabx	":t5=f-11;",0x00,0x8c,0x0
	.stabx	":t6=*-11",0x00,0x8c,0x0
	.stabx	":t7=f6;",0x00,0x8c,0x0
	.stabx	":t19=Z",0x00,0x8c,0x0


	.csect	H.19.NO_SYMBOL{PR}
.ppc_get_toc:                           # 0x00000000 (H.19.NO_SYMBOL)
	.stabx	"ppc_get_toc:F6",0x00,0x8e,0x0
	.function .ppc_get_toc,.ppc_get_toc,2,0
	stu	SP,-80(SP)
	.bf	26
	.stabx	"x:6",0x040,0x81,0x0
	.line	1
	st	RTOC,64(SP)
	.line	2
	l	r3,64(SP)
	st	r3,68(SP)
	b	__L1c
	.line	3
__L1c:                                  # 0x0000001c (H.19.NO_SYMBOL+0x1c)
	cal	SP,80(SP)
	bcr	BO_ALWAYS,CR0_LT
	.ef	28
	.long	0x00000000
# traceback table
	.byte	0x00			# VERSION=0
	.byte	0x00			# LANG=TB_C
	.byte	0x20			# IS_GL=0,IS_EPROL=0,HAS_TBOFF=1
					# INT_PROC=0,HAS_CTL=0,TOCLESS=0
					# FP_PRESENT=0,LOG_ABORT=0
	.byte	0x40			# INT_HNDL=0,NAME_PRESENT=1
					# USES_ALLOCA=0,CL_DIS_INV=WALK_ONCOND
					# SAVES_CR=0,SAVES_LR=0
	.byte	0x80			# STORES_BC=1,FPR_SAVED=0
	.byte	0x00			# GPR_SAVED=0
	.byte	0x00			# FIXEDPARMS=0
	.byte	0x01			# FLOATPARMS=0,PARMSONSTK=1
	.long	0x00000024		# TB_OFFSET
	.short	11			# NAME_LEN
	.byte	"ppc_get_toc"
	.byte	0			# padding
	.byte	0			# padding
	.byte	0			# padding
# End of traceback table
.ppc_sync:                              # 0x00000044 (H.19.NO_SYMBOL+0x44)
	.stabx	"ppc_sync:F-11",0x044,0x8e,0x0
	.function .ppc_sync,.ppc_sync,2,0
	.bf	17
	.line	1
	dcs
	bcr	BO_ALWAYS,CR0_LT
	.ef	21
	.long	0x00000000
# traceback table
	.byte	0x00			# VERSION=0
	.byte	0x00			# LANG=TB_C
	.byte	0x20			# IS_GL=0,IS_EPROL=0,HAS_TBOFF=1
					# INT_PROC=0,HAS_CTL=0,TOCLESS=0
					# FP_PRESENT=0,LOG_ABORT=0
	.byte	0x40			# INT_HNDL=0,NAME_PRESENT=1
					# USES_ALLOCA=0,CL_DIS_INV=WALK_ONCOND
					# SAVES_CR=0,SAVES_LR=0
	.byte	0x00			# STORES_BC=0,FPR_SAVED=0
	.byte	0x00			# GPR_SAVED=0
	.byte	0x00			# FIXEDPARMS=0
	.byte	0x01			# FLOATPARMS=0,PARMSONSTK=1
	.long	0x00000010		# TB_OFFSET
	.short	8			# NAME_LEN
	.byte	"ppc_sync"
	.byte	0			# padding
	.byte	0			# padding
# End of traceback table
.ppc_dcbf:                              # 0x00000070 (H.19.NO_SYMBOL+0x70)
	.stabx	"ppc_dcbf:F-11",0x070,0x8e,0x0
	.function .ppc_dcbf,.ppc_dcbf,2,0
	.bf	4
	.stabx	"_sync:p3",0x058,0x82,0x0
	.line	1
    stm 30,-8(1) # *(r1-8)=(r30,r31)
    stu 1,-48(1) # *(r1-48)=r1, r1-=48
    mr 30,1 # r30=r1=r1.orig-48
    st 3,72(30) # *(r30+72==r1.orig+24)=r3
    l 0,72(30) # r0=*(r30+72)=r3
    clf 0,0 # clear r3
    l 1,0(1) # r1=r1
    lmw 30,-8(1) # (r30,r31)=*(r1-8)
	bcr	BO_ALWAYS,CR0_LT
	.ef	12
	.long	0x00000000
# traceback table
	.byte	0x00			# VERSION=0
	.byte	0x00			# LANG=TB_C
	.byte	0x20			# IS_GL=0,IS_EPROL=0,HAS_TBOFF=1
					# INT_PROC=0,HAS_CTL=0,TOCLESS=0
					# FP_PRESENT=0,LOG_ABORT=0
	.byte	0x40			# INT_HNDL=0,NAME_PRESENT=1
					# USES_ALLOCA=0,CL_DIS_INV=WALK_ONCOND
					# SAVES_CR=0,SAVES_LR=0
	.byte	0x80			# STORES_BC=1,FPR_SAVED=0
	.byte	0x00			# GPR_SAVED=0
	.byte	0x01			# FIXEDPARMS=1
	.byte	0x01			# FLOATPARMS=0,PARMSONSTK=1
	.long	0x00000000		#
	.long	0x0000001c		# TB_OFFSET
	.short	8			# NAME_LEN
	.byte	"ppc_dcbf"
	.byte	0			# padding
	.byte	0			# padding
# End of traceback table
	.long	0x00000000              # "\0\0\0\0"
# End	csect	H.19.NO_SYMBOL{PR}

# .data section


	.toc	                        # 0x000000b0
T.51.ppc_get_toc:
	.tc	H.51.ppc_get_toc{TC},ppc_get_toc{DS}
T.55.ppc_sync:
	.tc	H.55.ppc_sync{TC},ppc_sync{DS}
T.59.ppc_dcbf:
	.tc	H.59.ppc_dcbf{TC},ppc_dcbf{DS}


	.csect	ppc_get_toc{DS}
	.long	.ppc_get_toc            # "\0\0\0\0"
	.long	TOC{TC0}                # "\0\0\0\260"
	.long	0x00000000              # "\0\0\0\0"
# End	csect	ppc_get_toc{DS}


	.csect	ppc_sync{DS}
	.long	.ppc_sync               # "\0\0\0D"
	.long	TOC{TC0}                # "\0\0\0\260"
	.long	0x00000000              # "\0\0\0\0"
# End	csect	ppc_sync{DS}


	.csect	ppc_dcbf{DS}
	.long	.ppc_dcbf               # "\0\0\0p"
	.long	TOC{TC0}                # "\0\0\0\260"
	.long	0x00000000              # "\0\0\0\0"
# End	csect	ppc_dcbf{DS}



# .bss section
