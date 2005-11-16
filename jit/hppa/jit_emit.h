/*
 * jit_emit.h
 *
 * HPPA
 *
 * $Id$
 */

/*
 *      r0          Zero
 *      r26         Argument 1
 *      r25         Argument 2
 *      r24         Argument 3
 *      r23         Argument 4
 *      r28         Return value 0
 *      r29         Return value 1
 */

typedef enum {
    r0,
    r1,
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    r16,
    r17,
    r18,
    r19,
    r20,
    r21,
    r22,
    r23,
    r24,
    r25,
    r26,
    r27,
    r28,
    r29,
    r30,
    r31
} hppa_iregister_t;

typedef enum {
    f0,
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
    f11,
    f12,
    f13,
    f14,
    f15,
    f16,
    f17,
    f18,
    f19,
    f20,
    f21,
    f22,
    f23,
    f24,
    f25,
    f26,
    f27,
    f28,
    f29,
    f30,
    f31
} hppa_fregister_t;

#if JIT_EMIT

/* BASE: interpreter address
 * CIR:  call index register
 */
#  define BASE r4
#  define CIR r5
#  define ISR1 r21
#  define ISR2 r22
#  define RET0 r28

enum { JIT_HPPA_BRANCH, JIT_HPPA_CALL };

/* Load / Store.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |     b      |    t/r    |  s  |         im14             |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 17 18                      31
 *
 *  ldw (load word)
 *      op = 18
 *  ldo (load offset)
 *      op = 13
 *  stw (store word)
 *      op = 26
 */

#  define emit_ls(pc, op, b, tr, s, im14) \
    *(pc++) = op << 2 | b >> 3; \
    *(pc++) = (char)(b << 5 | tr); \
    *(pc++) = s << 6 | ((im14 >> 7) & 0x3f) ; \
    if (im14 < 0) \
      *(pc++) = (char)(im14 << 1) + 1; \
    else \
      *(pc++) = (char)im14 << 1

#  define emit_ldw(pc, b, t, d) \
    emit_ls(pc, 18, b, t, 0, d)

#  define emit_ldo(pc, b, t, d) \
    emit_ls(pc, 13, b, t, 0, d)

#  define emit_stw(pc, b, r, d) \
    emit_ls(pc, 26, b, r, 0, d)

#  define emit_stwm(pc, b, r, d) \
    emit_ls(pc, 27, b, r, 0, d)

#  define emit_ldwm(pc, b, r, d) \
    emit_ls(pc, 19, b, r, 0, d)

/* Load / Store Indexed.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |     b      |     x     |  s  |u| 0 |cc|  2  |m|    t    |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 17 18 19 20 22   26 27     31
 *
 */

#  define emit_lsi(pc, op, b, x, tr) \
    *(pc++) = op << 2 | b >> 3; \
    *(pc++) = (char)(b << 5 | x); \
    pc++; \
    *(pc++) = (2 << 6) | tr;


/*  21 bit immediates.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |    t / r   |                   im21                     |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11                                        31
 *
 *  ldil
 *      op = 8
 */

#  define emit_im21(pc, op, r, imm) \
    *(pc++) = op << 2 | r >> 3; \
    *(pc++) = (char)(r << 5 | ((imm >> 2) & 0x1f)); \
    *(pc++) = (char)((((imm >> 7) & 0x3) << 6) | ((imm & 0x3) << 4) | \
        ((imm >> 16) & 0xf)); \
    *(pc++) = (char)((((imm >> 9) & 0x7f) << 1) | ((imm >> 20) & 1));

#  define emit_ldil(pc, r, imm) \
    emit_im21(pc, 8, r, imm)

/*  Arithmetic
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |    r2    |    r1    |  c  | f |   ext6   | 0 |    t     |
 *  +--------------------------------------------------------------------+
 * 0          5 6       10 11      15 16 18 19  20      25 26  27      31
 *
 */

#  define emit_arith(pc, op, ext6, s2, s1, t) \
    *(pc++) = op << 2 | s2 >> 3; \
    *(pc++) = (char)(s2 << 5 | s1); \
    *(pc++) = (char)(ext6 >> 2); \
    *(pc++) = (char)(ext6 << 6 | t)

#  define jit_emit_add_rrr(pc, dst, src1, src2) \
    emit_arith(pc, 2, 0x18, src2, src1, dst)

#  define jit_emit_sub_rrr(pc, dst, src1, src2) \
    emit_arith(pc, 2, 0x10, src2, src1, dst)

#  define jit_emit_or_rrr(pc, dst, src1, src2) \
    emit_arith(pc, 2, 9, src2, src1, dst)

#  define jit_emit_xor_rrr(pc, dst, src1, src2) \
    emit_arith(pc, 2, 0xA, src2, src1, dst)

#  define jit_emit_and_rrr(pc, dst, src1, src2) \
    emit_arith(pc, 2, 8, src2, src1, dst)

/*  Deposit / Extract
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |    r     |    t     |  c  |  x  |     p     |   clen    |
 *  +--------------------------------------------------------------------+
 * 0          5 6       10 11      15 16 18 19 21 22       26 27       31
 *
 */

#  define emit_depext(pc, op, r, t, x, p, clen) \
    *(pc++) = op << 2 | r >> 3; \
    *(pc++) = (char)(r << 5 | t); \
    *(pc++) = (char)(x << 2 | p >> 3); \
    *(pc++) = (char)(p << 5 | clen)

#  define emit_extu(pc, r, t, p, clen) \
    emit_depext(pc, 0x34, r, t, 6, p, clen);

#  define emit_exts(pc, r, t, p, clen) \
    emit_depext(pc, 0x34, r, t, 7, p, clen);

/* Conditions */

#  define emit_NEVER    0
#  define emit_EQ       1
#  define emit_LT       2
#  define emit_LTE      3
#  define emit_LTU      4
#  define emit_LTEU     5
#  define emit_SV       6
#  define emit_ODD      7

/* Fake conditions */

#  define emit_NE       8
#  define emit_GTE      9
#  define emit_GT       10
#  define emit_GTEU     11
#  define emit_GTU      12

/* Compare and branch.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |     r2     |     r1    |  c  |      im11        | n | w |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 18 19              29  30  31
 *
 *  branch target = cat(w,im11[10], im11[0..9])
 */

#  define emit_cmpbch(pc, op, s2, s1, c, trg, n, w) \
    *(pc++) = op << 2 | s2 >> 3; \
    *(pc++) = (char)(s2 << 5 | s1); \
    *(pc++) = c << 5 | trg >> 6; \
    *(pc++) = (char)(trg << 3 | n << 1 | w)

#  define jit_emit_cmpbt(pc, s2, s1, c, targ, n) \
    emit_cmpbch(pc, 0x20, s2, s1, c, targ, n, ((targ >> 11) & 1))

#  define jit_emit_cmpbf(pc, s2, s1, c, targ, n) \
    emit_cmpbch(pc, 0x22, s2, s1, c, targ, n, ((targ >> 11) & 1))

/* Branch and link.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |     t      |     w1    |  0  |       w2         | n | w |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 18 19              29  30  31
 *
 * address is:
 *  w1 * 8192
 *  w2 = 10 . 0-9
 *  w + -
 */

#  define _emit_bl(pc, op, t, w1, w2, n, w) \
    *(pc++) = op << 2 | t >> 3; \
    *(pc++) = (char)(t << 5 | w1); \
    *(pc++) = w2 >> 6; \
    *(pc++) = (char)(w2 << 3 | n << 1 | w)

#  define emit_bl(pc, disp) \
    _emit_bl(pc, 0x3A, r2, \
      ((disp >> 11) & 0x1f), (((disp & 0x3ff) << 1) + ((disp >> 10) & 1)), \
        0, ((disp >> 31) & 1));

#  define emit_b(pc) \
    _emit_bl(pc, 0x3A, r2, 0, 0, 0, 0)

/* Branch and Link Register.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |   0x3A   |     t      |     x     |  2  |        0         | n | 0 |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 18 19              29  30  31
 *
 * t = curret_ip
 * IP = curret_ip + (x << 3) + 8
 * if (n) execute_next_instruction
 */

#  define emit_blr(pc, t, x, n) \
    *(pc++) = 0x3a << 2 | t >> 3; \
    *(pc++) = (char)(t << 5 | x); \
    *(pc++) = 2 << 5; \
    *(pc++) = (n << 1)

/*  Move.
 XXX MOVE AND BRACH
 */

#  define jit_emit_mov_rr(pc, dst, src) \
    *(pc++) = 8; \
    *(pc++) = src; \
    *(pc++) = 2; \
    *(pc++) = 0x40 + dst

/*
 */

#  define emit_ret(pc) \
    *(pc++) = 0xe8; \
    *(pc++) = 0x40; \
    *(pc++) = 0xc0; \
    *(pc++) = 0x02

/* Branch Vectored.
 *
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |     b      |     x     |  6  |       0          | n | 0 |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11       15 16 18 19              29  30  31
 *
 *  IP = (b << 3) + x
 *
 *  No return address is saved.
 */

#  define _emit_bv(pc, op, b, x, n) \
    *(pc++) = op << 2 | b >> 3; \
    *(pc++) = (char)(b << 5 | x); \
    *(pc++) = 6 << 5; \
    *(pc++) = n << 1

#  define emit_bv(pc, b, x, n) \
    _emit_bv(pc, 0x3A, b, x, n);

/*  Immediate
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    op    |    r     |    t     |  c  | f | 0 |       imm11         |
 *  +--------------------------------------------------------------------+
 * 0          5 6       10 11      15 16 18 19  20                     31
 *
 *  imm11 is low_sign_ext ( ie. the sign bit is 0 )
 */

#  define _emit_imm11(pc, op, r, t, imm11) \
    *(pc++) = op << 2 | r >> 3; \
    *(pc++) = (char)(r << 5 | t); \
    *(pc++) = (char)(imm11 >> 7); \
    *(pc++) = (char)(imm11 << 1)

#  define emit_addimm11(pc, r, t, imm11) \
    _emit_imm11(pc, 0x2d, r, t, imm11);

/*  Synchronize caches
 *
 *
 *  +--------------------------------------------------------------------+
 *  |    00    |    rv    | 0 |   rv   |  0  |        20       |    0    |
 *  +--------------------------------------------------------------------+
 * 0          5 6       10 11  12    15 16 18 19             26 27     31
 *
 */

#  define emit_sync(pc) \
    *(pc++) = 0; \
    *(pc++) = 0; \
    *(pc++) = 0x4; \
    *(pc++) = 0;


/* Pseudo instructions. */

#  define jit_emit_nop(pc) \
    jit_emit_or_rrr(pc, 0, 0, 0)

/* ldil loads a 21 bits immediate into the left part of a general register,
 * ldo loads a 14 bits offset into a general register, so we use it to add
 * the missing 11 bits.
 */

#  define jit_emit_mov_ri_i(pc, D, imm) \
    emit_ldil(pc, D, ((imm >> 11) & 0x1fffff)); \
    emit_ldo(pc, D, D, (imm & 0x7ff))

#  define jit_emit_mov_rm_i(pc, reg, addr) \
    emit_ldw(pc, BASE, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])))

#  define jit_emit_mov_mr_i(pc, addr, reg) \
    emit_stw(pc, BASE, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])))

/*  emit_cmpbranch
 *
 *      Braches to dest if cond is satisfied.
 *      Doesn't save a return address.
 */

#define jit_emit_cmpbranch(pc, s1, s2, cond, dest) { \
    if (cond >= emit_GTE) { \
        jit_emit_cmpbf(pc, (cond - 7), s2, s1, 3, 0); \
    } \
    else { \
        jit_emit_cmpbf(pc, cond, s1, s2, 3, 0); \
    } \
    jit_emit_nop(pc); \
    jit_emit_mov_ri_i(pc, ISR2, (dest)); \
    emit_bv(pc, ISR2, r0, 1); \
}

static void
jit_emit_bc(Parrot_jit_info_t *jit_info, hppa_iregister_t s1,
    hppa_iregister_t s2,  int cond, opcode_t disp)
{
    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_HPPA_BRANCH;
    jit_info->arena.fixups->param.opcode = jit_info->op_i + disp;

    if (jit_info->optimizer->cur_section->branch_target ==
        jit_info->optimizer->cur_section)
            jit_info->arena.fixups->skip =
                jit_info->optimizer->cur_section->branch_target->load_size;

    jit_emit_cmpbranch(jit_info->native_ptr, s1, s2, cond, 0);
}

static void
Parrot_emit_jump_to_ret(Parrot_jit_info_t *jit_info,
                        Interp * interpreter)
{
    /* This calculates (INDEX into op_map * 4) */

    /* we have to get the code pointer, which might change
     * due too intersegment branches
     */
    emit_ldw(jit_info->native_ptr, BASE, CIR,
        (offsetof(Interp, code)));
    emit_ldw(jit_info->native_ptr, CIR, ISR2,
	(offsetof(struct PackFile_Segment, data)));
    jit_emit_sub_rrr(jit_info->native_ptr, CIR, RET0, ISR2);
    /*
     * now we have the offset of the ins in CIR
     *
     * we have to get the op_map too at runtime
     */
    emit_ldw(jit_info->native_ptr, BASE, ISR1,
        (offsetof(Interp, jit_info)));
    emit_ldo(jit_info->native_ptr, ISR1, ISR2,
        (offsetof(Parrot_jit_info_t, arena)));
    emit_ldw(jit_info->native_ptr, ISR2, ISR1,
        (offsetof(Parrot_jit_arena_t, op_map)));
    /* This jumps to the address in op_map[ISR1 + sizeof(void *) * INDEX] */
    emit_lsi(jit_info->native_ptr, 0x3, ISR1, CIR, ISR2);
    emit_bv(jit_info->native_ptr, ISR2, r0, 1);
    jit_emit_nop(jit_info->native_ptr);

}

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    /* Save the return address in the stack. */
    emit_stw(jit_info->native_ptr, r30, r2, -0x14);
    jit_emit_mov_rr(jit_info->native_ptr, r1, r3);
    jit_emit_mov_rr(jit_info->native_ptr, r3, r30);
    emit_stwm(jit_info->native_ptr, r30, r1, 0x40);
    emit_stw(jit_info->native_ptr, r3, r26, -0x24);
    emit_stw(jit_info->native_ptr, r3, r25, -0x28);
    /* Callee-save registers. */
    emit_ldo(jit_info->native_ptr, r30, r30, 0x40);
    emit_stw(jit_info->native_ptr, r30, r4, -0x4);
    emit_stw(jit_info->native_ptr, r30, r5, -0x8);
    emit_stw(jit_info->native_ptr, r30, r6, -0xc);
    emit_stw(jit_info->native_ptr, r30, r7, -0x10);
    emit_stw(jit_info->native_ptr, r30, r8, -0x14);
    emit_stw(jit_info->native_ptr, r30, r9, -0x18);
    emit_stw(jit_info->native_ptr, r30, r10, -0x1c);
    emit_stw(jit_info->native_ptr, r30, r11, -0x20);
    emit_stw(jit_info->native_ptr, r30, r12, -0x24);
    emit_stw(jit_info->native_ptr, r30, r13, -0x28);
    emit_stw(jit_info->native_ptr, r30, r14, -0x2c);
    emit_stw(jit_info->native_ptr, r30, r15, -0x30);
    emit_stw(jit_info->native_ptr, r30, r16, -0x34);
    emit_stw(jit_info->native_ptr, r30, r17, -0x38);
    emit_stw(jit_info->native_ptr, r30, r18, -0x3c);
    /* Move the interpreter to the base register. */
    jit_emit_mov_rr(jit_info->native_ptr, BASE, r26);
    jit_emit_mov_rr(jit_info->native_ptr, RET0, r25);
    Parrot_emit_jump_to_ret(jit_info, interpreter);
}

/* Load the return address from the stack and return. */
/* Restore the callee-save registers. */
#  define jit_emit_end(pc) \
    emit_ldo(jit_info->native_ptr, r30, r30, 0x40); \
    emit_ldw(jit_info->native_ptr, r30, r4, -0x4); \
    emit_ldw(jit_info->native_ptr, r30, r5, -0x8); \
    emit_ldw(jit_info->native_ptr, r30, r6, -0xc); \
    emit_ldw(jit_info->native_ptr, r30, r7, -0x10); \
    emit_ldw(jit_info->native_ptr, r30, r8, -0x14); \
    emit_ldw(jit_info->native_ptr, r30, r9, -0x18); \
    emit_ldw(jit_info->native_ptr, r30, r10, -0x1c); \
    emit_ldw(jit_info->native_ptr, r30, r11, -0x20); \
    emit_ldw(jit_info->native_ptr, r30, r12, -0x24); \
    emit_ldw(jit_info->native_ptr, r30, r13, -0x28); \
    emit_ldw(jit_info->native_ptr, r30, r14, -0x2c); \
    emit_ldw(jit_info->native_ptr, r30, r15, -0x30); \
    emit_ldw(jit_info->native_ptr, r30, r16, -0x34); \
    emit_ldw(jit_info->native_ptr, r30, r17, -0x38); \
    emit_ldw(jit_info->native_ptr, r30, r18, -0x40); \
    emit_ldw(jit_info->native_ptr, r3, r2, -0x14); \
    emit_ldo(pc, r3, r30, 0x40); \
    emit_ldwm(pc, r30, r4, -0x40); \
    emit_ret(pc)

/*
 * For the JIT procedure calls are built using BRANCH AND LINK REGISTER,
 * specifically, we load the FDP (Function Descriptor Pointer) into ISR2,
 * get the address and r19 set, load the IP, and calculate the displacement
 * right shiff it by 3 and branch there.
 * The FDP will cointain the actual function address the second time it's
 * called.
 * But for EXEC using BRANCH AND LINK, this is because the address of
 * the code generated in the JIT could (probably will) be 65535 * 4 bytes
 * farest than the called procedure, and this is won't happend for EXEC
 * (and if it does, it's ld's problem, not ours).
 */

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    jit_emit_mov_rr(jit_info->native_ptr, r25, BASE);
    jit_emit_mov_ri_i(jit_info->native_ptr, r26, ((int)(jit_info->cur_op)));

    Parrot_jit_newfixup(jit_info);

    jit_info->arena.fixups->type = JIT_HPPA_CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    jit_info->native_ptr += 32;
}

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_ret(jit_info, interpreter);
}

#  undef Parrot_jit_restart_op
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                    Interp * interpreter)
{
    char *jmp_ptr, *sav_ptr;

    Parrot_jit_normal_op(jit_info, interpreter);
    /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    jit_emit_cmpbf(jit_info->native_ptr, RET0, r0, emit_EQ, 0, 0);
    jit_emit_end(jit_info->native_ptr);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    jit_emit_cmpbf(jit_info->native_ptr, RET0, r0, emit_EQ,
        (long)(((sav_ptr - jmp_ptr) - 8) / 4), 0);
    jit_info->native_ptr = sav_ptr;
    Parrot_emit_jump_to_ret(jit_info, interpreter);
}

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup;
    char *fixup_ptr;
    char *disp;
    long d;

    fixup = jit_info->arena.fixups;

    while (fixup) {
        switch (fixup->type) {
            case JIT_HPPA_BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 8;
                d = jit_info->arena.op_map[fixup->param.opcode].offset
                        + jit_info->arena.start + fixup->skip;
                jit_emit_mov_ri_i(fixup_ptr, ISR2, d);
                break;
            case JIT_HPPA_CALL:
                /* Load the FDP. */
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (long)fixup->param.fptr - 2;
                jit_emit_mov_ri_i(fixup_ptr, ISR2, d);
                emit_ldw(fixup_ptr, ISR2, CIR, 0);
                emit_ldw(fixup_ptr, ISR2, r19, 4);
                /* Save the return address in r2 */
                emit_bl(fixup_ptr, 0);
                /* Make the return address pass the actual branch */
                emit_addimm11(fixup_ptr, r2, r2, 8);
                /* Branch without modifing r2 */
                emit_bv(fixup_ptr, CIR, r0, 1);
                jit_emit_nop(fixup_ptr);
                break;
            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                                   fixup->type);
                break;
        }
        fixup = fixup->next;
    }
}

/* move reg to mem (i.e. intreg) */
void
Parrot_jit_emit_mov_mr(Interp * interpreter, char *mem, int reg)
{
    jit_emit_mov_mr_i(
        ((Parrot_jit_info_t *)(interpreter->code->jit_info))->native_ptr, mem, reg);
}

/* move mem (i.e. intreg) to reg */
void
Parrot_jit_emit_mov_rm(Interp * interpreter, int reg, char *mem)
{
    jit_emit_mov_rm_i(
        ((Parrot_jit_info_t *)(interpreter->code->jit_info))->native_ptr, reg, mem);
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
#  define INT_REGISTERS_TO_MAP 14
#  define CACHELINESIZE 32

#  ifndef JIT_IMCC

char intval_map[INT_REGISTERS_TO_MAP] =
    { r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18};

static void
hppa_sync_cache (void *_start, void *_end)
{
    char *start = (char*)(((int)_start) &~(CACHELINESIZE));
    char *end = (char *)((((int)_end)+CACHELINESIZE) &~(CACHELINESIZE));
    char *_sync;

    for (_sync = start; _sync < end; _sync += CACHELINESIZE) {
        __asm__ __volatile__ ("fdc %r0(%0)":: "r" ((long)_sync));
    }

    __asm__ __volatile__ ("sync");
}

#  endif

#endif
