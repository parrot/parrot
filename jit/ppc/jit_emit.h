/*
 * jit_emit.h
 *
 * PPC
 *
 * $Id$
 */

#if !defined(PARROT_PPC_JIT_EMIT_H_GUARD)
#define PARROT_PPC_JIT_EMIT_H_GUARD

#include <unistd.h>
#include <sys/mman.h>
#include <limits.h>
#ifndef CACHELINESIZE
   /* TODO this should be determined by configure */
#  if PARROT_EXEC_OS_AIX
     /* for POWER3 */
#    define CACHELINESIZE 0x80
#  else
     /* for PowerPC */
#    define CACHELINESIZE 0x10
#  endif
#endif

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
    ISR1 = r11,
    r12,
    ISR2 = r12,
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
} ppc_iregister_t;

typedef enum {
    f0,
    FSR1 = f0,
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
    FSR2 = f13, 
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
} ppc_fregister_t;

#if JIT_EMIT

/* Scratch registers. */


enum { JIT_PPC_CALL, JIT_PPC_BRANCH, JIT_PPC_UBRANCH };

#  define emit_op(op) (op << 2)

#  define emit_r3(reg) (reg >> 3)

#  define emit_l5(reg) (reg << 5)

/* Move (mr).
 *
 * mr rD,rA
 *
 *  +-----------------------------------+
 *  | 31 |
 *  +-----------------------------------+
 * 0    5 6                     29 30 31
 * */
#  define jit_emit_mov_rr(pc, dst, src) \
    *(pc++) = emit_op(31) | emit_r3(src); \
    *(pc++) = (char)(emit_l5(src) | dst); \
    *(pc++) = (char)(0x3 | src * 8); \
    *(pc++) = 0x78

/* Move from/to special purpose register.
 *
 * mtspr SPR,rS
 *
 *  +--------------------------------------------------------------------+
 *  |    31    |     D-S    |         spr            |      type     | 0 |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11                    20 21           30  31
 *
 * spr = 8 == LR
 * spr = 9 == CTR
 *
 * mfspr type == 339
 * mtspr type == 467
 *
 * mtlr  rS == mtspr 8,rS
 * mtctr rS == mtspr 9,rS
 *
 */
#  define jit_emit_mxspr(pc, S, spr, type) \
    *(pc++) = 31 << 2 | S >> 3; \
    *(pc++) = (char)(S << 5 | spr); \
    *(pc++) = type >> 7; \
    *(pc++) = (char)type << 1

#  define jit_emit_mtlr(pc, S) \
    jit_emit_mxspr(pc, S, 8, 467)

#  define jit_emit_mtctr(pc, S) \
    jit_emit_mxspr(pc, S, 9, 467)

#  define jit_emit_mflr(pc, D) \
    jit_emit_mxspr(pc, D, 8, 339)

/* Branches (b/bl/ba/bla) with 24 bits literal.
 *
 * b   (AA = 0, LK = 0)
 * bl  (AA = 0, LK = 1)
 * ba  (AA = 1, LK = 0)
 * bla (AA = 1, LK = 1)
 *
 *  +--------------------------------------------------------------------+
 *  |    18    |                      LI                       | AA | LK |
 *  +--------------------------------------------------------------------+
 * 0          5 6                                            29   30   31
 *
 * If AA = 0, the branch target address is the sum of LI and the address of
 * this instruction.
 * If AA = 1, the branch target address is the value of LI.
 * If LK = 1, the effextive address of the instruction following the branch
 * instruction is placed into the link register.
 *
 */


#  define _emit_bx(pc, type, disp) \
    *(pc++) = (char)((18 << 2) | ((disp >> 24) & 3)); \
    *(pc++) = (char)(disp >> 16); \
    *(pc++) = (char)(disp >> 8); \
    *(pc++) = (char)(disp | type)

#  define jit_emit_b(pc, disp) \
    jit_emit_bx(pc, 0, disp)

#  define jit_emit_bl(pc, disp) \
    jit_emit_bx(pc, 1, disp)

#  define jit_emit_ba(pc, disp) \
    jit_emit_bx(pc, 2, disp)

#  define jit_emit_bla(pc, disp) \
    jit_emit_bx(pc, 3, disp)

/* Branch conditional to count register or link register.
 *
 *  +--------------------------------------------------------------------+
 *  |    19    |     BO     |     BI     |     0     |     type     | LK |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11        15 16       20 21          30   31
 *
 * cr [type = 528]
 * lr [type = 16]
 */

#  define jit_emit_bcctrx(pc, bo, bi, type, lk) \
    *(pc++) = 19 << 2 | bo >> 3; \
    *(pc++) = (char)(bo << 5 | bi); \
    *(pc++) = type >> 7; \
    *(pc++) = (char)(type << 1| lk)

#  define jit_emit_bcctr(pc, bo, bi) \
    jit_emit_bcctrx(pc, bo, bi, 528, 0)

#  define jit_emit_bcctrl(pc, bo, bi) \
    jit_emit_bcctrx(pc, bo, bi, 528, 1)

#  define jit_emit_bctrl(pc) \
    jit_emit_bcctrl(pc, 20, 0)

#  define jit_emit_blr(pc) \
    jit_emit_bcctrx(pc, 20, 0, 16, 0)

#  define jit_emit_bclr(pc, bo, bi) \
    jit_emit_bcctrx(pc, bo, bi, 16, 0)

#  define jit_emit_bclrl(pc, bo, bi) \
    jit_emit_bcctrx(pc, bo, bi, 16, 1)

/* 3 register operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |     D     |     A     |     B     |OE|     type      |Rc|
 *  +--------------------------------------------------------------------+
 * 0          5 6        10 11       15 16       20 21 22           30 31
 *
 */

#  define jit_emit_3reg(pc, opcode, D, A, B, OE, type, Rc) \
    *(pc++) = opcode << 2 | D >> 3; \
    *(pc++) = (char)(D << 5 | A); \
    *(pc++) = B << 3 | OE | type >> 7; \
    *(pc++) = (char)(type << 1 | Rc);

/* 3 register operation (without OE bit)
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |     D     |     A     |     B     |        type      |Rc|
 *  +--------------------------------------------------------------------+
 * 0          5 6        10 11       15 16       20 21 22           30 31
 *
 */

#  define jit_emit_3reg_x(pc, opcode, D, A, B, type, Rc) \
    *(pc++) = opcode << 2 | D >> 3; \
    *(pc++) = (char)(D << 5 | A); \
    *(pc++) = B << 3 | type >> 7; \
    *(pc++) = (char)(type << 1 | Rc);

/* Add [type = 266, OE = 0, Rc = 0]
 *
 * adds rA and rB and place the result in rD.
 */

#  define jit_emit_add_rrr(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, A, B, 0, 266, 0);

#  define jit_emit_subf(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, B, A, 0, 40, 0);

#  define jit_emit_sub_rrr jit_emit_subf

#  define jit_emit_neg_rr(pc, D, A) \
    jit_emit_3reg(pc, 31, D, A, 0, 0, 104, 0);

#  define jit_emit_mul_rrr(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, A, B, 0, 235, 0);

#  define jit_emit_div_rrr(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, A, B, 0, 491, 0);

#  define jit_emit_and_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 28, 0)

#  define jit_emit_or_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 444, 0)

#  define jit_emit_xor_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 316, 0)

#  define jit_emit_srawi(pc, D, A, immediate) \
    jit_emit_3reg_x(pc, 31, A, D, immediate, 824, 0)

/* 2 register and immediate operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |    D-S     |     A      |       Immediate-Disp          |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11        15 16                           31
 *
 * addi  [opcode = 14] Adds rA to Immediate and place the result in rD.
 *
 * addis [opcode = 15] Adds rA to Immediate shifted 16 bits and place the
 *                     result in rD.
 *
 * andil [opcode = 28] Ands rD and the (unsigned)Immediate and place the
 *                     result in rA.
 *
 * lwz   rD,d(rA) [op = 32]
 * lwzu  rD,d(rA) [op = 33]
 * lbz   rD,d(rA) [op = 34]
 * lbzu  rD,d(rA) [op = 35]
 * stw   rS,d(rA) [op = 36]
 * stwu  rS,d(rA) [op = 37]
 * stb   rS,d(rA) [op = 38]
 * stbu  rS,d(rA) [op = 39]
 * lhz   rD,d(rA) [op = 40]
 * lhzu  rD,d(rA) [op = 41]
 * lha   rD,d(rA) [op = 42]
 * lhau  rD,d(rA) [op = 43]
 * sth   rS,d(rA) [op = 44]
 * sthu  rS,d(rA) [op = 45]
 * lmw   rD,d(rA) [op = 46]
 * stmw  rS,d(rA) [op = 47]
 * lfu   frD,d(rA) [op = 48]
 * lfsu  frD,d(rA) [op = 49]
 * lfd   frD,d(rA) [op = 50]
 * lfdu  frD,d(rA) [op = 51]
 * stfs  frS,d(rA) [op = 52]
 * stfsu frS,d(rA) [op = 53]
 * stfd  frS,d(rA) [op = 54]
 * stfdu frS,d(rA) [op = 55]
 */

#  define jit_emit_2reg(pc, opcode, D, A, immediate) \
    *(pc++) = opcode << 2 | D >> 3; \
    *(pc++) = (char)(D << 5 | A); \
    *(pc++) = ((immediate) >> 8); \
    *(pc++) = (char)(immediate)

#  define jit_emit_add_rri_i(pc, D, A, immediate) \
    jit_emit_2reg(pc, 14, D, A, immediate)

#  define jit_emit_addis(pc, D, A, immediate) \
    jit_emit_2reg(pc, 15, D, A, immediate)

#  define jit_emit_ori(pc, D, S, immediate) \
    jit_emit_2reg(pc, 24, S, D, immediate)

#  define jit_emit_oris(pc, D, S, immediate) \
    jit_emit_2reg(pc, 25, S, D, immediate)

#  define jit_emit_andil(pc, S, A, uimm) \
    jit_emit_2reg(pc, 28, S, A, uimm)

#  define jit_emit_subfic(pc, D, A, immediate) \
    jit_emit_2reg(pc, 8, D, A, immediate)

#  define jit_emit_subi jit_emit_subfic

#  define jit_emit_lwz(pc, D, disp, A) \
    jit_emit_2reg(pc, 32, D, A, disp)

#  define jit_emit_stw(pc, S, disp, A) \
    jit_emit_2reg(pc, 36, S, A, disp)

#  define jit_emit_stwu(pc, S, disp, A) \
    jit_emit_2reg(pc, 37, S, A, disp)

#  define jit_emit_stmw(pc, S, disp, A) \
    jit_emit_2reg(pc, 47, S, A, disp)

#  define jit_emit_lmw(pc, D, disp, A) \
    jit_emit_2reg(pc, 46, D, A, disp)

#  define jit_emit_lfd(pc, D, disp, A) \
    jit_emit_2reg(pc, 50, D, A, disp)

#  define jit_emit_stfd(pc, S, disp, A) \
    jit_emit_2reg(pc, 54, S, A, disp)

/* A-format operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |     D     |     A     |     B     |    C    |  XOP   |Rc|
 *  +--------------------------------------------------------------------+
 * 0          5 6        10 11       15 16       20 21     25 26    30 31
 *
 */

#  define jit_emit_3a(pc, opcode, D, A, B, C, type, Rc) \
    *(pc++) = opcode << 2 | D >> 3; \
    *(pc++) = (char)(D << 5 | A); \
    *(pc++) = (char)(B << 3 | C >> 2); \
    *(pc++) = (char)(C << 6 | type << 1 | Rc)

#  define jit_emit_fadd_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 21, 0)
#  define jit_emit_fsub_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 20, 0)
#  define jit_emit_fmul_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, 0, B, 25, 0)
#  define jit_emit_fdiv_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 18, 0)
#  define jit_emit_fsel(pc, D, A, B, C) jit_emit_3a(pc, 63, D, A, B, C, 23, 0)

#  define jit_emit_fabs_rrr(pc, D, A)  jit_emit_3reg_x(pc, 63, D, 0, A, 264, 0)
#  define jit_emit_fneg_rrr(pc, D, A)   jit_emit_3reg_x(pc, 63, D, 0, A, 40, 0)

#  define jit_emit_fmr(pc, D, A)   jit_emit_3reg_x(pc, 63, D, 0, A, 72, 0)

/* not in core.ops, but probably should be: */
#  define jit_emit_fsqrt(pc, D, A) jit_emit_3reg(pc, 63, D, 0, A, 0, 18, 0)

/* Load a CPU register from a Parrot register. */

#  define jit_emit_mov_rm_i(pc, reg, addr) \
    jit_emit_lwz(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])), r13)

#  define jit_emit_mov_rm_n(pc, reg, addr) \
    jit_emit_lfd(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])), r13)

/* compare operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  | BF   | |L |     A     |     B     |                     |
 *  +--------------------------------------------------------------------+
 * 0          5 6    8 9 10 11       15 16       20 21                 31
 *
 * opcode = 31 for integer, 63 for floating point
 * bf is the comparison result field to use (we just always use 0)
 */

#  define _emit_cmp(pc, t, bf, ra, rb) \
    *(pc++) = t << 2 | ((int)bf) >> 1; \
    *(pc++) = (char)(bf << 7 | ra); \
    *(pc++) = (char)(rb << 3); \
    *(pc++) = 0

#  define jit_emit_cmp_rr(pc, ra, rb) _emit_cmp(pc, 31, 0, ra, rb)
#  define jit_emit_fcmp_rr(pc, ra, rb) _emit_cmp(pc, 63, 0, ra, rb)

/* compare immediate operation.
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  | BF   | |L |     A     |             SIMM                |
 *  +--------------------------------------------------------------------+
 * 0          5 6    8 9 10 11       15 16                             31
 *
 */

#  define _emit_cmpi(pc, t, bf, ra, simm) \
    *(pc++) = t << 2 | ((int)bf) >> 1; \
    *(pc++) = (char)(bf << 7 | ra); \
    *(pc++) = simm >> 8; \
    *(pc++) = (char)simm

#  define jit_emit_cmp_ri(pc, ra, simm) \
    _emit_cmpi(pc, 11, 0, ra, simm);

/* Branch conditional to immediate
 *
 *  +--------------------------------------------------------------------+
 *  |    16    |     BO     |     BI     |     BD              | AA | LK |
 *  +--------------------------------------------------------------------+
 * 0          5 6         10 11        15 16                      30   31
 *
 * Branch flags.  A 10-bit quantity representing BO and BI.  BO is 12
 * for true and 4 for false.  BI indicates the comparison type (lt=0,
 * gt = 1, eq = 2).  BD is the relative or absolute displacement,
 * divided by four, or AA, LK are set to zero, giving a 16-bit displacement.
 */

#  define _BLT 0
#  define _BGT 1
#  define _BEQ 2
#  define _BYES (12 << 5)
#  define _BNO (4 << 5)

typedef enum {
    BLT = _BYES | _BLT,
    BGE = _BNO | _BLT,
    BGT = _BYES | _BGT,
    BLE = _BNO | _BGT,
    BEQ = _BYES | _BEQ,
    BNE = _BNO | _BEQ
} branch_t;

#  define _emit_bc(pc, opt, bd, aa, lk) \
    *(pc++) = 16 << 2 | ((int)opt) >> 8; \
    *(pc++) = (char)(opt&0xff); \
    *(pc++) = (char)(bd >> 8); \
    *(pc++) = (char)(bd | aa << 1 | lk)

static void
jit_emit_bc(Parrot_jit_info_t *jit_info, branch_t cond, opcode_t disp) {
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
        jit_info->arena.fixups->type = JIT_PPC_BRANCH;
        jit_info->arena.fixups->param.opcode = opcode;

        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                jit_info->arena.fixups->skip =
                    jit_info->optimizer->cur_section->branch_target->load_size;

    }
    /* TODO check offset - 16 bits only allowed */
    _emit_bc(jit_info->native_ptr, cond, offset, 0, 0);
}

static void
jit_emit_bx(Parrot_jit_info_t *jit_info, char type, opcode_t disp)
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
        jit_info->arena.fixups->type = JIT_PPC_UBRANCH;
        jit_info->arena.fixups->param.opcode = opcode;

        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                jit_info->arena.fixups->skip =
                    jit_info->optimizer->cur_section->branch_target->load_size;

    }
    _emit_bx(jit_info->native_ptr, type, offset);
}


/* Store a CPU register back to a Parrot register. */

#  define jit_emit_mov_mr_i(pc, addr, reg) \
    jit_emit_stw(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])), r13)

#  define jit_emit_mov_mr_n(pc, addr, reg) \
    jit_emit_stfd(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->int_reg.registers[0])), r13)


/*
 * Load a 32-bit immediate value.
 */

#  define jit_emit_mov_ri_i(pc, D, imm) \
    jit_emit_ori(pc, D, r31, (long)imm & 0xffff); \
    if ((long)imm >> 16 != 0) { \
      jit_emit_oris(pc, D, D, (long)imm >> 16); }

#  define add_disp(pc, D, disp) \
    jit_emit_mov_ri_i(pc, ISR1, disp); \
    jit_emit_add_rrr(pc, D, r15, ISR1)

#  define jit_emit_load_op_map(pc) \
    jit_emit_lwz(pc, ISR1, offsetof(Interp, jit_info), r16); \
    jit_emit_lwz(pc, r14, (offsetof(Parrot_jit_arena_t, op_map) + \
                           offsetof(Parrot_jit_info_t, arena)), ISR1)

#  define jit_emit_load_code_start(pc) \
    jit_emit_lwz(pc, ISR1, offsetof(Interp, code), r16); \
    jit_emit_lwz(pc, r15,  offsetof(struct PackFile, byte_code), ISR1)

#  define jit_emit_branch_to_opcode(pc, D) \
    jit_emit_sub_rrr(jit_info->native_ptr, ISR1, D, r15); \
    jit_emit_add_rrr(jit_info->native_ptr, ISR1, r14, ISR1); \
    jit_emit_lwz(jit_info->native_ptr, ISR1, 0, ISR1); \
    jit_emit_mtctr(jit_info->native_ptr, ISR1); \
    jit_emit_bctrl(jit_info->native_ptr)


#  if EXEC_CAPABLE
#   define load_nc(pc, D, disp) \
      jit_emit_oris(pc, D, r31, (long)disp >> 16); \
      Parrot_exec_add_text_rellocation(jit_info->objfile, \
        pc, RTYPE_DATA, "const_table", -2); \
      jit_emit_ori(jit_info->native_ptr, D, D, (long)disp & 0xffff); \
      Parrot_exec_add_text_rellocation(jit_info->objfile, \
        pc, RTYPE_DATA1, "const_table", -2);
#endif /* EXEC_CAPABLE */

#endif /* JIT_EMIT */

/*
 * r13 - r31 are preserved i.e. 19 GPRs
 */
#define PPC_JIT_REGISTER_SAVE_SPACE (4*19)
/*
 * 24 linkage area
 * 32 param area i.e.enough for 8 args
 * 12 round up so that sum is divisible by 16
 */
#define PPC_JIT_FRAME_SIZE (PPC_JIT_REGISTER_SAVE_SPACE + 68)

#if JIT_EMIT == 2
/*
 * emit stack frame according to ABI
 * see also jit/ppc/core.jit for Parrot_end
 */ 
void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    jit_emit_mflr(jit_info->native_ptr, r0);
    jit_emit_stmw(jit_info->native_ptr, r13, -PPC_JIT_REGISTER_SAVE_SPACE, r1);
    jit_emit_stw(jit_info->native_ptr, r0, 8, r1);
    jit_emit_stwu(jit_info->native_ptr, r1, -PPC_JIT_FRAME_SIZE, r1);
    jit_emit_xor_rrr(jit_info->native_ptr, r31, r31, r31);
    jit_emit_mov_rr(jit_info->native_ptr, r16, r3);  /* interp */
    jit_emit_mov_rr(jit_info->native_ptr, r13, r3);  /* fp */
    if (!jit_info->objfile) {
        jit_emit_load_op_map(jit_info->native_ptr);
    }
#  if EXEC_CAPABLE
    else {
        jit_emit_oris(jit_info->native_ptr, r14, r31, 0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_DATA, "opcode_map", -2);
        jit_emit_ori(jit_info->native_ptr, r14, r14, 0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_DATA1, "opcode_map", -2);
    }
#  endif

    jit_emit_load_code_start(jit_info->native_ptr);

    /* jit_emit restart code: branch to the program counter passed into
       the JIT invocation as the second parameter, which is r4 */
    jit_emit_branch_to_opcode(jit_info->native_ptr, r4);
}

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    add_disp(jit_info->native_ptr, r3,
        ((long)jit_info->cur_op - (long)interpreter->code->byte_code));
    jit_emit_mov_rr(jit_info->native_ptr, r4, r16); /* interp */

    /*
    Parrot_jit_newfixup(jit_info);

    jit_info->arena.fixups->type = JIT_PPC_CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    _emit_bx(jit_info->native_ptr, 1, 0);
    */

#   if PARROT_EXEC_OS_AIX
    /* support AIX calling convention using compiler intermediary _ptrgl */
    jit_emit_mov_ri_i(jit_info->native_ptr, ISR1, (long)
            *((long*)(interpreter->op_func_table[*(jit_info->cur_op)])));
#   else
    jit_emit_mov_ri_i(jit_info->native_ptr, ISR1,
            (long)(interpreter->op_func_table[*(jit_info->cur_op)]));
#   endif
    jit_emit_mtctr(jit_info->native_ptr, ISR1);
    jit_emit_bctrl(jit_info->native_ptr);
}

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_normal_op(jit_info, interpreter);

    /* fix our reserved registers, in case we are branching to a new segment */
    jit_emit_load_op_map(jit_info->native_ptr);
    jit_emit_load_code_start(jit_info->native_ptr);

    /* branch to the opcode just returned from the normal_op call, in r3 */
    jit_emit_branch_to_opcode(jit_info->native_ptr, r3);
}

static void Parrot_end_jit(Parrot_jit_info_t *, Interp * );

#undef Parrot_jit_restart_op
/* Parrot_jit_restart_op is based on the i386 version */
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                      Interp * interpreter)
{
    char *jmp_ptr, *sav_ptr;

    Parrot_jit_normal_op(jit_info, interpreter);
    /* test return value; if zero (e.g after trace), return from JIT */
    jit_emit_cmp_ri(jit_info->native_ptr, r3, 0);
     /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    /* emit jump past exit code, dummy offset */
    _emit_bc(jit_info->native_ptr, BNE, 0, 0, 0);
    Parrot_end_jit(jit_info, interpreter);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    _emit_bc(jit_info->native_ptr, BNE, ((long)(sav_ptr - jmp_ptr)), 0, 0);
    /* restore PC */
    jit_info->native_ptr = sav_ptr;

    /* fix our reserved registers, in case we are branching to a new segment */
    jit_emit_load_op_map(jit_info->native_ptr);
    jit_emit_load_code_start(jit_info->native_ptr);

    /* branch to the opcode just returned from the normal_op call, in r3 */
    jit_emit_branch_to_opcode(jit_info->native_ptr, r3);
}

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   Interp * interpreter)
{
    Parrot_jit_fixup_t *fixup;
    char *fixup_ptr;
    char *disp;
    long d,high,low;

    fixup = jit_info->arena.fixups;

    while(fixup){
        switch(fixup->type){
            case JIT_PPC_CALL:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = ((long)fixup->param.fptr - (long)fixup_ptr);
                *(fixup_ptr++) |= (char)(d >> 29) & 3;
                *(fixup_ptr++) = (char)(d >> 16);
                *(fixup_ptr++) = (char)(d >> 8);
                *(fixup_ptr++) |= (char)d & ~3;
                break;

            case JIT_PPC_UBRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = jit_info->arena.op_map[fixup->param.opcode].offset
                    - fixup->native_offset + fixup->skip;
                *(fixup_ptr++) |= (char)(d >> 24) & 3;
                *(fixup_ptr++) = (char)(d >> 16);
                *(fixup_ptr++) = (char)(d >> 8);
                *(fixup_ptr++) |= (char)d & ~3;
                break;

            case JIT_PPC_BRANCH:
                /* TODO check offset - 16 bits only allowed */
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = jit_info->arena.op_map[fixup->param.opcode].offset
                    - fixup->native_offset + fixup->skip;
                fixup_ptr += 2;
                *(fixup_ptr++) = (char)(d >> 8);
                *(fixup_ptr++) |= (char)d & ~3;
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
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, mem, reg);
    /*
     * if we save registers, the last instruction isn't the ins that
     * sets condition codes, so the speed hack in Parrot_ifunless_i_ic
     * doesn't work.
     */
    ((Parrot_jit_info_t *)(interpreter->jit_info))->prev_op = 0;
}

/* move mem (i.e. intreg) to reg */
void
Parrot_jit_emit_mov_rm(Interp * interpreter, int reg, char *mem)
{
    jit_emit_mov_rm_i(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, reg, mem);
}

/* move reg to mem (i.e. numreg) */
void
Parrot_jit_emit_mov_mr_n(Interp * interpreter, char *mem,int reg)
{
    jit_emit_mov_mr_n(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, mem, reg);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->prev_op = 0;
}

/* move mem (i.e. numreg) to reg */
void
Parrot_jit_emit_mov_rm_n(Interp * interpreter, int reg,char *mem)
{
    jit_emit_mov_rm_n(
        ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr, reg, mem);
}

#endif /* JIT_EMIT == 2 */
#if JIT_EMIT == 0

#  define REQUIRES_CONSTANT_POOL 0
#  ifdef PARROT_EXEC_OS_AIX
#    define INT_REGISTERS_TO_MAP 22
#  else
#    define INT_REGISTERS_TO_MAP 23
#  endif
#  define FLOAT_REGISTERS_TO_MAP 12

/* 
 * Register usage
 * r0  special rA/0 not allocatable, not usable as ISR1
 * r1  SP
 * r2 TOC (AIX only) / allocated
 * r3 - r10 allocated
 * r11 ISR1
 * r12 ISR2 
 * r13 Parrot register frame pointer - now interpreter
 * r14 op_map
 * r15 code_start
 * r16 interpreter
 * r17 - r30 allocated
 * r31 zero
 *
 * f0  FSR1
 * f1 - f12 allocated
 * f13 FSR2
 * f14 - f31 - unused, need preserving if allocated
 */


#ifndef JIT_IMCC
char intval_map[INT_REGISTERS_TO_MAP] =

    { r17, r18, r19, r20, r21, r22, r23,
      r24, r25, r26, r27, r28, r29, r30,
#  ifndef PARROT_EXEC_OS_AIX
      /* AIX calling convention reserves r2 */
      r2,
#  endif
      r3, r4, r5, r6, r7, r8, r9, r10 };
/*
 * f14 - f31 are not preserved currently
 * f1  - f11 are usable without preserving
 */
char floatval_map[FLOAT_REGISTERS_TO_MAP] =
    { 
      f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12
      /* not currently saved - so don't use */     
      /* f14, f15, f16, f17, f18, f19, f20, f21,
      f22, f23, f24, f25, f26, f27, f28, f29, f30, f31 */ 
    };

void ppc_flush_line(char *_sync);
void ppc_sync(void);

#ifndef __IBMC__

void
ppc_flush_line(char *_sync)
{
    __asm__ __volatile__ (
    "dcbf 0,%0"
    :
    : "r" ((long)_sync)
    );
}

void
ppc_sync(void)
{
    __asm__ __volatile__ ("sync");
}

#endif

static void
ppc_sync_cache (void *_start, void *_end)
{
    char *start = (char*)(((int)_start) &~(CACHELINESIZE - 1));
    char *end = (char *)((((int)_end)+CACHELINESIZE-1) &~(CACHELINESIZE - 1));
    char *_sync;

    for (_sync = start; _sync < end; _sync += CACHELINESIZE) {
        ppc_flush_line(_sync);
    }
    ppc_sync();
}

#endif /* JIT_EMIT == 0 */
#endif
#endif /* PARROT_PPC_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
