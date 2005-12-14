/*
 * jit_emit.h
 *
 * IA64
 *
 * $Id$
 */

#if JIT_EMIT

#  define NATIVE_PTR ((Parrot_jit_info_t *)(interpreter->code->jit_info))->native_ptr

/* r0            Zero
 * r1            Special
 * r2-r3         Scratch
 * r4-r7         Preserved
 * r8-r11        Scratch
 * r12-r13       Special
 * r14-r31       Scratch
 */

long it = 0;
int inst_size = 0;
int inst_tmpl = 0;

typedef struct {
    char    tmplt;
    char    used;
    unsigned long    inst1;
    int     it1;
    unsigned long    inst2;
    int     it2;
    unsigned long    inst3;
    int     it3;
} inst_tmp_t;

inst_tmp_t sit;

/* Instruction types */

enum {
    IT_A = 1,   /* Integer ALU = I | M */
    IT_As,  /* Integer ALU stop */
    IT_I,   /* Non-ALU integer */
    IT_Is,  /* Non-ALU integer stop */
    IT_M,   /* Memory */
    IT_Ms,  /* Memory stop */
    IT_F,   /* Floating-Point */
    IT_Fs,  /* Floating-Point */
    IT_B,   /* Branch */
    IT_Bs,  /* Branch */
    IT_L,   /* Extended */
    IT_X,   /* Extended */
    IT_Xs,  /* Extended */
};

/* Templates */

enum {
    MII,
    MIIs,
    MIsI,
    MIsIs,
    MLX,
    MLXs,
    MMI = 8,
    MMIs,
    MsMI,
    MsMIs,
    MFI,
    MFIs,
    MMF,
    MMFs,
    MIB,
    MIBs,
    MBB,
    MBBs,
    BBB = 0x16,
    BBBs,
    MMB,
    MMBs,
    MFB = 0x1C,
    MFBs
};

/* Reserved registers */

#  define ISR1 2
#  define ISR2 3
#  define RSF 34
#  define R_INTREP 4
#  define R_BYTECODE 5
#  define R_OPMAP 6
#  define R_RETURN_ADR 7
#  define R_RETURN 8
#  define R_ARG1 32
#  define R_ARG2 33

#  define FSR1 2
#  define FSR2 3

/* Application Registers */
#  define PFS 64

#  define RSRV_REG 26

#  define emit_x2(pc, r1, imm64) \
    pc = close_template(pc); \
    pc = loadinst(pc, ((long)((imm64 >> 22) & (long)0x1fffffffffff)), IT_L); \
    it = ((long)6 << 37) | \
        ((long)((imm64 >> 63) & 0x1)     << 36) | \
        ((long)((imm64 >> 7 ) & 0x1ff)     << 27) | \
        ((long)((imm64 >> 21) & 0x1)     << 21) | \
        ((long)((imm64 >> 16) & 0x1f)     << 22) | \
        ((long)((imm64           & 0x7f))     << 13) | \
        ((((long)r1 & 0x3f)) << 6); \
    pc = loadinst(pc, it, IT_X); \

#  define emit_x4(pc, d, wh, imm64, p, b1) \
    pc = close_template(pc); \
    pc = loadinst(pc, (long)((imm64 >> 20) & 0x7fffffffff) << 2, IT_L); \
    it = ((long)0xD << 37) | ((long)(((long)(imm64) >> 63) & 0x1) << 36) | \
        ((long)d << 35) | ((long)wh << 33) | \
        (((long)imm64 & 0xfffff) << 13) | (p << 12) | (b1 << 6); \
    pc = loadinst(pc, it, IT_X);

#  define emit_a1(pc, x2a, ve, x4, x2b, r3, r2, r1) \
    it = ((long)8 << 37) | ((long)x2a << 34) | ((long)ve << 33) | \
        ((long)x4 << 29) | ((long)x2b << 27) | (r3 << 20) | (r2 << 13) | \
        (r1 << 6); \
    pc = loadinst(pc, it, IT_A);

#  define emit_a4(pc, r3, imm14, r1) \
    it = ((long)8 << 37) | ((long)((imm14 >> 13) & 0x1) << 36) | \
        ((long)2 << 34) | (((imm14 >> 7) & 0x3f) << 27) | (r3 << 20) | \
        ((imm14 & 0x7f) << 13) | (r1 << 6); \
    pc = loadinst(pc, it, IT_A);

#  define emit_a5(pc, r3, imm22, r1) \
    it = ((long)9 << 37) | ((long)((imm22 >> 7) & 0x1ff) << 27) | \
        (((imm22 >> 16) & 0x1f) << 22) | ((imm22 & 0x7f) << 13) | \
        ((r3 & 0x3) << 20) | (r1 << 6); \
    pc = loadinst(pc, it, IT_A);

#  define emit_a6(pc, op, tb, x2, ta, c, p2, r3, r2, p1) \
    it = ((long)op << 37) | ((long)tb << 36) | ((long)x2 << 34) | \
        ((long)ta << 33) | ((long)p2 << 27) | ((long)r3 << 20) | \
        ((long)r2 << 13) | ((long)c << 12) | (p1 << 6); \
    pc = loadinst(pc, it, IT_M); /**/ \
    pc = loadinst(pc, emit_fill_nop_m, IT_F);

#  define emit_m1(pc, x6, r3, r1) \
    it = ((long)4 << 37) | ((long)x6 << 30) | (r3 << 20) | (r1 << 6); \
    pc = loadinst(pc, it, IT_M);

#  define emit_m2(pc, x6, r3, r2, r1) \
    it = ((long)4 << 37) | ((long)1 << 36) | ((long)x6 << 30) | \
        (r3 << 20) | (r2 << 13) | (r1 << 6); \
    pc = loadinst(pc, it, IT_M);

#  define emit_m4(pc, x6, r3, r2) \
    it = ((long)4 << 37) | ((long)x6 << 30) | (r3 << 20) | (r2 << 13); \
    pc = loadinst(pc, it, IT_M);

#  define fd_sig 0x1C
#  define fd_exp 0x1D
#  define fd_s   0x1E
#  define fd_d   0x1F

#  define emit_m18(pc, x6, r2, f1) \
    it = ((long)6 << 37) | ((long)x6 << 30) | ((long)1 << 27) | \
        (r2 << 13) | (f1 << 6); \
    pc = loadinst(pc, it, IT_M);

#  define emit_m19(pc, x6, f2, r1) \
    it = ((long)4 << 37) | ((long)x6 << 30) | ((long)1 << 27) | \
        (f2 << 13) | (r1 << 6); \
    pc = loadinst(pc, it, IT_M);

#  define emit_m34(pc, il, o, r, r1) \
    it = ((long)1 << 37) | (long)0x6 << 33 | ((long)(r >> 3) << 27) | \
        ((long)il << 20) | ((long)(il + o) << 13) | ((long)r1 << 6); \
    pc = loadinst(pc, it, IT_M);

#  define ph_few 0
#  define ph_many 1

#  define bwh_sptk 0
#  define bwh_spnt 1
#  define bwh_dptk 2
#  define bwh_dpnt 3

#  define dh_none 0
#  define dh_clr 1

#  define emit_b1(pc, d, wh, imm21, p, b1, qp) \
    it = ((long)4 << 37) | ((long)((imm21 >> 20) & 0x1) << 36) | \
        ((long)d << 35) | ((long)wh << 33) | \
        ((long)(imm21 & 0xfffff) << 13) | (p << 12) | (b1 << 6) | qp; \
    pc = loadinst(pc, it, IT_B);

#  define emit_b3(pc, d, wh, imm20b, p, b1) \
    it = ((long)5 << 37) | ((long)((imm20b >> 20) & 0x1) << 36) | \
        ((long)d << 35) | ((long)wh << 33) | \
        ((long)(imm20b & 0xfffff) << 13) | (p << 12) | (b1 << 6); \
    pc = loadinst(pc, it, IT_B);

#  define emit_b4(pc, d, wh, x6, b2, p, btype) \
    it = ((long)1 << 36) | ((long)d << 35) | ((long)wh << 33) | \
        ((long)x6 << 27) | (b2 << 13) | (p << 12) | (btype << 6); \
    pc = loadinst(pc, it, IT_B);

#  define emit_i21(pc, b1, r2) \
    it = ((long)0 << 37) | (long)0x7 << 33 | \
        ((long)r2 << 13) | ((long)b1 << 6);\
    pc = loadinst(pc, it, IT_I);

#  define emit_i22(pc, r1, b2) \
    it = ((long)0 << 37) | (long)0x31 << 27 | \
        ((long)b2 << 13) | ((long)r1 << 6);\
    pc = loadinst(pc, it, IT_I);

#  define emit_i26(pc, ar3, r2) \
    it = ((long)0x2A << 27) | (long)ar3 << 20 | ((long)r2 << 13);\
    pc = loadinst(pc, it, IT_I);

/* Pseudo instructions. */
#  define jit_emit_mov_ri_i(pc, dest, imm) \
    emit_x2(pc, dest, ((long)(imm)));

/* Store a CPU register back to a Parrot register. */

#  define jit_emit_mov_mr_i(pc, addr, reg) \
    emit_a4(pc, R_INTREP, (((char *)addr) - ((char *)interpreter)), ISR2); \
    emit_m4(pc, 0x33, ISR2, reg);

#  define jit_emit_mov_rm_i(pc, reg, addr) \
    emit_a4(pc, R_INTREP, (((char *)addr) - ((char *)interpreter)), ISR2); \
    emit_m1(pc, 0x3, ISR2, reg);

#  define jit_emit_mov_rr(pc, dst, src) \
    emit_a4(pc, src, 0, dst);

#  define jit_emit_add_rrr(pc, D, A ,B) \
    emit_a1(pc, 0, 0, 0, 0, A, B, D);

#  define jit_emit_sub_rrr(pc, D, A ,B) \
    emit_a1(pc, 0, 0, 1, 1, B, A, D);

#  define jit_emit_neg_rr(pc, D, A) \
    emit_a1(pc, 0, 0, 1, 1, A, 0, D);

#  define jit_emit_and_rrr(pc, D, A ,B) \
    emit_a1(pc, 0, 0, 3, 0, A, B, D);

#  define jit_emit_or_rrr(pc, D, A ,B) \
    emit_a1(pc, 0, 0, 3, 2, A, B, D);

#  define jit_emit_xor_rrr(pc, D, A ,B) \
    emit_a1(pc, 0, 0, 3, 3, A, B, D);

#  define jit_emit_mov_nr(pc, dst, src) \
    emit_m18(pc, fr_sig, dst, src);

#  define jit_emit_mov_rn(pc, dst, src) \
    emit_m19(pc, fr_sig, dst, src);

#  define jit_emit_cmp_r0(pc, src) \
    emit_a6(pc, 0xE, 0, 2, 0, 0, 7, src, 0, 6);

#  define jit_emit_nop(pc) \
    it = emit_fill_nop_m; \
    pc = loadinst(pc, it, IT_M);

#  define jit_emit_end(pc) \
    emit_i26(pc, PFS, RSF); \
    emit_i21(pc, 0, R_RETURN_ADR); \
    jit_emit_mov_rr(NATIVE_PTR, 12, 35); \
    emit_b4(pc, dh_none, bwh_sptk, 0x21, 0, ph_many, 4); \
    pc = close_template(pc);

#  define emit_fill_nop 0x4000000
#  define emit_fill_nop_m 0x8000000
#  define emit_fill_nop_b 0x4000000000

#  define JIT_IA64_CALL 1
#  define JIT_IA64_BRANCH 2

static int
invalid_template(void)
{
    if (sit.it2 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_Is && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_L && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_Ms && sit.it2 == IT_M && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_B && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_B && sit.it2 == IT_B && sit.it3 == 0)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_I)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_Is)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_Is && sit.it3 == IT_I)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_Is && sit.it3 == IT_Is)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_L && sit.it3 == IT_X)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_L && sit.it3 == IT_Xs)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_I)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Is)
        return 0;
    if (sit.it1 == IT_Ms && sit.it2 == IT_M && sit.it3 == IT_I)
        return 0;
    if (sit.it1 == IT_Ms && sit.it2 == IT_M && sit.it3 == IT_Is)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_I)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_Is)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_F)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Fs)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_B)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_Bs)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_B && sit.it3 == IT_B)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_B && sit.it3 == IT_Bs)
        return 0;
    if (sit.it1 == IT_B && sit.it2 == IT_B && sit.it3 == IT_B)
        return 0;
    if (sit.it1 == IT_B && sit.it2 == IT_B && sit.it3 == IT_Bs)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_B)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Bs)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_B)
        return 0;
    if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_Bs)
        return 0;
    return 1;
}

static char *
close_template(char *pc)
{
    char *pit;
    int i;

    if (sit.used == 0)
        return pc;
    else if (sit.used == 1 && sit.it1 == IT_M) {
        sit.tmplt = MIsIs; /**/
        sit.inst2 = emit_fill_nop_m >> 2;
        sit.inst3 = emit_fill_nop_m >> 1;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_I)
        sit.tmplt = MIsIs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_Is)
        sit.tmplt = MIsIs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_Is && sit.it3 == IT_I)
        sit.tmplt = MIsIs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_Is && sit.it3 == IT_Is)
        sit.tmplt = MIsIs;
    else if (sit.it1 == IT_M && sit.it2 == IT_L && sit.it3 == IT_X)
        sit.tmplt = MLXs; /* Force stop */
    else if (sit.it1 == IT_M && sit.it2 == IT_L && sit.it3 == IT_Xs)
        sit.tmplt = MLXs;
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_I)
        sit.tmplt = MMIs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Is)
        sit.tmplt = MMIs;
    else if (sit.it1 == IT_Ms && sit.it2 == IT_M && sit.it3 == IT_I)
        sit.tmplt = MsMIs; /**/
    else if (sit.it1 == IT_Ms && sit.it2 == IT_M && sit.it3 == IT_Is)
        sit.tmplt = MsMIs;
    else if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_I)
        sit.tmplt = MFIs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_Is)
        sit.tmplt = MFIs;
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_F)
        sit.tmplt = MMF;
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Fs)
        sit.tmplt = MMFs;
    else if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_B)
        sit.tmplt = MIBs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_I && sit.it3 == IT_Bs)
        sit.tmplt = MIBs;
    else if (sit.it1 == IT_M && sit.it2 == IT_B && sit.it3 == IT_B)
        sit.tmplt = MBB;
    else if (sit.it1 == IT_M && sit.it2 == IT_B && sit.it3 == IT_Bs)
        sit.tmplt = MBBs;
    else if (sit.it1 == IT_B && sit.it2 == IT_B && sit.it3 == IT_B)
        sit.tmplt = BBBs; /**/
    else if (sit.it1 == IT_B && sit.it2 == IT_B && sit.it3 == IT_Bs)
        sit.tmplt = BBBs;
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_B)
        sit.tmplt = MMBs; /**/
    else if (sit.it1 == IT_M && sit.it2 == IT_M && sit.it3 == IT_Bs)
        sit.tmplt = MMBs;
    else if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_B)
        sit.tmplt = MFB;
    else if (sit.it1 == IT_M && sit.it2 == IT_F && sit.it3 == IT_Bs)
        sit.tmplt = MFBs;
    else if (sit.it1 == IT_M && sit.it2 == IT_I) {
        sit.tmplt = MIsIs; /**/
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_Is) {
        sit.tmplt = MIsIs; /**/
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_L) {
        sit.tmplt = MLXs; /**/
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_M) {
        sit.tmplt = MMI;
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_Ms && sit.it2 == IT_M) {
        sit.tmplt = MsMI;
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_F) {
        sit.tmplt = MFI;
        sit.inst3 = emit_fill_nop;
    }
    else if (sit.it1 == IT_M && sit.it2 == IT_B) {
        sit.tmplt = MBB;
        sit.inst3 = emit_fill_nop_b;
    }
    else if (sit.it1 == IT_B && sit.it2 == IT_B) {
        sit.tmplt = BBBs; /**/
        sit.inst3 = emit_fill_nop_b;
    }

    pit = (char *)&sit.inst1;
    *(pc++) = (char)sit.tmplt | *(pit++);
    for (i = 0; i < 5; i++)
        *(pc++) = *(pit++);
    pit = (char *)&sit.inst2;
    for (i = 0; i < 5; i++)
        *(pc++) = *(pit++);
    pit = (char *)&sit.inst3;
    for (i = 0; i < 5; i++)
        *(pc++) = *(pit++);

    sit.used = 0;
    sit.inst1 = 0;
    sit.it1 = 0;
    sit.inst2 = 0;
    sit.it2 = 0;
    sit.inst3 = 0;
    sit.it3 = 0;
    return pc;
}

static char *
loadinst(char *pc, long inst, int itype)
{
    char *pit = (char *)&inst;
    int i;

RELOAD:
    switch (sit.used++) {
        case 0:
                sit.inst1 = inst << 5;
                if (itype == IT_B) {
                    sit.inst1 = emit_fill_nop_b << 5;
                    sit.it1 = IT_B;
                    sit.inst2 = emit_fill_nop_b >> 2;
                    sit.it2 = IT_B;
                    sit.inst3 = inst >> 1;
                    sit.inst2 |= (long)((inst & 0x1) << 39);
                    sit.it3 = itype;
                    sit.used = 3;
                    return close_template(pc);
                }
                else if (itype == IT_M)
                    sit.it1 = IT_M;
                else if ((itype == IT_I) || (itype == IT_A)) {
                    sit.inst1 = ((long)emit_fill_nop_m << 5);
                    sit.it1 = IT_M;
                    sit.inst2 = (inst >> 2) & 0x7fffffffff;
                    sit.inst1 |= (long)((inst & 0x3) << 46);
                    sit.it2 = IT_I;
                    sit.used++;
                }
                else if (itype == IT_L) {
                    sit.it1 = IT_M;
                    sit.inst1 = ((long)emit_fill_nop_m << 5);
                    sit.inst2 = (inst >> 2) & 0x7fffffffff;
                    sit.inst1 |= (long)((inst & 0x3) << 46);
                    sit.it2 = itype;
                    sit.used++;
                }
                break;
        case 1:
                if (itype == IT_A)
                    sit.it2 = IT_I;
                else
                    sit.it2 = itype;
                sit.inst2 = (inst >> 2) & 0x7fffffffff;
                sit.inst1 |= (long)((inst & 0x3) << 46);
                break;
        case 2:
                if (itype == IT_A)
                    sit.it3 = IT_I;
                else
                    sit.it3 = itype;
                if (invalid_template()) {
                    pc = close_template(pc);
                    goto RELOAD;
                }
                sit.inst3 = inst >> 1;
                sit.inst2 |= (long)((inst & 0x1) << 39);
                pc = close_template(pc);
                return pc;
    }

    if (invalid_template())
        pc = close_template(pc);

    return pc;
}

static void
jit_emit_bc(Parrot_jit_info_t *jit_info, opcode_t disp)
{
    opcode_t opcode = jit_info->op_i + disp;
    int offset;
    if(opcode <= jit_info->op_i) {
        offset = jit_info->arena.op_map[opcode].offset -
            (jit_info->native_ptr - jit_info->arena.start);
        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                offset +=
                    jit_info->optimizer->cur_section->branch_target->load_size;
    }
    else {
        offset = 0;
        Parrot_jit_newfixup(jit_info);
        jit_info->arena.fixups->type = JIT_IA64_BRANCH;
        jit_info->arena.fixups->param.opcode = opcode;

        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                jit_info->arena.fixups->skip =
                    jit_info->optimizer->cur_section->branch_target->load_size;

    }
    emit_b1(jit_info->native_ptr, dh_none, bwh_dptk, offset >> 4, ph_few, 0, 7);
}

static void
Parrot_jit_jump_to_ret(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    jit_emit_sub_rrr(NATIVE_PTR, ISR1, R_RETURN, R_BYTECODE);
    jit_emit_add_rrr(NATIVE_PTR, ISR1, ISR1, R_OPMAP);
    emit_m1(NATIVE_PTR, 3, ISR1, ISR1);
    NATIVE_PTR = close_template(NATIVE_PTR);
    emit_i21(NATIVE_PTR, 0, ISR1);
    emit_b4(NATIVE_PTR, dh_none, bwh_sptk, 0x20, 0, ph_many, 0);
}

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    emit_m34(NATIVE_PTR, RSRV_REG, 2, 0, RSF);
    jit_emit_mov_rr(NATIVE_PTR, 1, 4);
    jit_emit_mov_rr(NATIVE_PTR, R_INTREP, R_ARG1);
    jit_emit_mov_rr(NATIVE_PTR, R_BYTECODE, R_ARG2);
    jit_emit_mov_ri_i(NATIVE_PTR, R_OPMAP, jit_info->arena.op_map);
    jit_emit_mov_rr(NATIVE_PTR, 35, 12);
    emit_i22(NATIVE_PTR, R_RETURN_ADR, 0);
    jit_emit_mov_rr(NATIVE_PTR, 8, R_ARG2);
    Parrot_jit_jump_to_ret(jit_info, interpreter);
}

static void
fixup_jump_addr(char *fixup_ptr,long d)
{
    char *pit;
    long tmp, i;

    tmp = (long)(((long)((d >> 21) & 0xfffff) << 35) |
        ((long)((d & 0xfffff) << 12)));
    for (i = 0; i < 11; i++)
        fixup_ptr++;
    pit = (char *)&tmp;
    for (i = 0; i < 5; i++)
        *(fixup_ptr++) |= *(pit++);
}

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup;
    char *fixup_ptr, *pit, *disp;
    long d,tmp,i;

    fixup = jit_info->arena.fixups;

    while(fixup){
        switch(fixup->type){
            case JIT_IA64_CALL:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (((long)fixup->param.fptr - (long)fixup_ptr)) >> 4;
                emit_x4(fixup_ptr, dh_none, bwh_sptk, d, ph_many, 0);
                break;
            case JIT_IA64_BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (jit_info->arena.op_map[fixup->param.opcode].offset
                    - fixup->native_offset + fixup->skip) >> 4;
                fixup_jump_addr(fixup_ptr, d);
                break;

            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                                   fixup->type);
                break;
        }
        fixup = fixup->next;
    }
}

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    emit_a4(NATIVE_PTR, R_BYTECODE,
        ((long)jit_info->cur_op - (long)interpreter->code->base.data),
            (R_ARG1 + RSRV_REG));
    jit_emit_mov_rr(NATIVE_PTR, (R_ARG2 + RSRV_REG), R_INTREP);
    jit_emit_mov_rr(NATIVE_PTR, 32, 1);

    NATIVE_PTR = close_template(NATIVE_PTR);
    Parrot_jit_newfixup(jit_info);

    jit_info->arena.fixups->type = JIT_IA64_CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))(*(long *)(
            interpreter->op_func_table[*(jit_info->cur_op)]));

    emit_x4(NATIVE_PTR, dh_none, bwh_sptk, 0, ph_many, 0);
    jit_emit_mov_rr(NATIVE_PTR, 1, 32);
    NATIVE_PTR = close_template(NATIVE_PTR);
}

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_jit_jump_to_ret(jit_info, interpreter);
}

#  undef Parrot_jit_restart_op
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    char *jmp_ptr, *sav_ptr;

    Parrot_jit_normal_op(jit_info, interpreter);
    /* test r8, if zero (e.g after trace), return from JIT */
    jit_emit_cmp_r0(jit_info->native_ptr, R_RETURN);
    /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    emit_b1(jit_info->native_ptr, dh_none, bwh_dptk, 0, ph_few, 0, 7);
    jit_emit_end(jit_info->native_ptr);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    fixup_jump_addr(jit_info->native_ptr, (long)((sav_ptr - jmp_ptr) >> 4));
    /* restore PC */
    jit_info->native_ptr = sav_ptr;
    Parrot_jit_jump_to_ret(jit_info, interpreter);
}

/* move reg to mem (i.e. intreg) */
void
Parrot_jit_emit_mov_mr(Interp * interpreter, char *mem, int reg)
{
    jit_emit_mov_mr_i(
        ((Parrot_jit_info_t *)(interpreter->code->jit_info))->native_ptr, mem, reg);
    NATIVE_PTR = close_template(NATIVE_PTR);
}

/* move mem (i.e. intreg) to reg */
void
Parrot_jit_emit_mov_rm(Interp * interpreter, int reg, char *mem)
{
    jit_emit_mov_rm_i(
        ((Parrot_jit_info_t *)(interpreter->code->jit_info))->native_ptr, reg, mem);
    NATIVE_PTR = close_template(NATIVE_PTR);
}

/* move reg to mem (i.e. numreg) */
void
Parrot_jit_emit_mov_mr_n(Interp * interpreter, char *mem,int reg)
{
}

/* move mem (i.e. numreg) to reg */
void
Parrot_jit_emit_mov_rm_n(Interp * interpreter, int reg,char *mem)
{
}



#endif /* JIT_EMIT */
#if JIT_EMIT == 0

#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 22

#  ifndef JIT_IMCC
#  define CACHELINESIZE 32

char intval_map[INT_REGISTERS_TO_MAP] =
    { 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
      48, 49, 50, 51, 52, 53, 54, 55, 56, 57 };

static void
ia64_sync_cache (void *_start, void *_end)
{
    char *start = (char*)(((long)_start) &~(CACHELINESIZE - 1));
    char *end = (char *)((((long)_end)+CACHELINESIZE-1) &~(CACHELINESIZE - 1));
    char *_sync;

    for (_sync = start; _sync < end; _sync += CACHELINESIZE) {
        __asm__ __volatile__ (
        "fc %0\n"
        ";;\n"
        "sync.i\n"
        ";;\n"
        "srlz.i\n"
        ";;\n"
        :
        : "r" ((long)_sync)
        );
    }
}

#  endif

#endif
