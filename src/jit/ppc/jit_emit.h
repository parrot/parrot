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
#include "parrot/oplib/ops.h"

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

#  define Parrot_jit_emit_get_base_reg_no(pc) r13

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
    do { \
        if (dst != src) { \
        *(pc++) = emit_op(31) | emit_r3(src); \
        *(pc++) = (char)(emit_l5(src) | dst); \
        *(pc++) = (char)(0x3 | src * 8); \
        *(pc++) = 0x78; \
        } \
    } \
    while (0)    

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
    *(pc++) = (char)(type << 1)

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

#  define jit_emit_neg_rr_i(pc, D, A) \
    jit_emit_3reg(pc, 31, D, A, 0, 0, 104, 0);

#  define jit_emit_mul_rrr(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, A, B, 0, 235, 0);

#  define jit_emit_div_rrr_no_check(pc, D, A, B) \
    jit_emit_3reg(pc, 31, D, A, B, 0, 491, 0);

#  define jit_emit_cmp_ri(pc, ra, simm) \
    _emit_cmpi(pc, 11, 0, ra, simm);


#  define jit_emit_and_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 28, 0)

#  define jit_emit_or_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 444, 0)

#  define jit_emit_xor_rrr(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 316, 0)

#  define jit_emit_srawi(pc, D, A, immediate) \
    jit_emit_3reg_x(pc, 31, A, D, immediate, 824, 0)

/* canonical names */

#define jit_emit_and_rrr_i jit_emit_and_rrr 
#define jit_emit_add_rrr_i jit_emit_add_rrr 
#define jit_emit_cmod_rrr_i jit_emit_cmod_rrr 
#define jit_emit_div_rrr_i jit_emit_div_rrr 
#define jit_emit_mul_rrr_i jit_emit_mul_rrr 
#define jit_emit_or_rrr_i  jit_emit_or_rrr 
#define jit_emit_sub_rrr_i jit_emit_sub_rrr 
#define jit_emit_xor_rrr_i jit_emit_xor_rrr 

/* shift ops */
/* slw */
#  define jit_emit_shl_rrr_i(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 24, 0)

/* sraw */
#  define jit_emit_shr_rrr_i(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 792, 0)

/* srw */
#  define jit_emit_lsr_rrr_i(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, A, D, B, 536, 0)

# define jit_emit_shr_rri jit_emit_srawi
# define jit_emit_shl_rri(pc, D, A, n) \
    jit_emit_rlwinm(pc, D, A, n, 0, 31-n)
# define jit_emit_lsr_rri(pc, D, A, n) \
    jit_emit_rlwinm(pc, D, A, 32-n, n, 31)

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

#  define jit_emit_xori(pc, D, S, immediate) \
    jit_emit_2reg(pc, 26, S, D, immediate)

#  define jit_emit_xoris(pc, D, S, immediate) \
    jit_emit_2reg(pc, 27, S, D, immediate)

#  define jit_emit_andil(pc, S, A, uimm) \
    jit_emit_2reg(pc, 28, S, A, uimm)

#  define jit_emit_subfic(pc, D, A, immediate) \
    jit_emit_2reg(pc, 8, D, A, immediate)

#  define jit_emit_subi(pc, D, A, im) jit_emit_add_rri_i(pc, D, A, -(im))

#  define jit_emit_lwz(pc, D, disp, A) \
    jit_emit_2reg(pc, 32, D, A, disp)

#  define jit_emit_lwzu(pc, D, disp, A) \
    jit_emit_2reg(pc, 33, D, A, disp)

#  define jit_emit_lwzx(pc, D, A, B) \
    jit_emit_3reg_x(pc, 31, D, A, B, 23, 0)

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

/* rotate instructions */

#  define jit_emit_rlwimi(pc, A, S, SH, MB, ME) \
    jit_emit_3a(pc, 20, S, A, SH, MB, ME, 0)

#  define jit_emit_rlwinm(pc, A, S, SH, MB, ME) \
    jit_emit_3a(pc, 21, S, A, SH, MB, ME, 0)

#  define jit_emit_rot_rri(pc, A, S, im) \
    jit_emit_rlwinm(pc, A, S, im, 0, 31)

#  define jit_emit_rlwnm(pc, A, S, B, MB, ME) \
    jit_emit_3a(pc, 23, S, A, B, M, ME, 0)

/* mfcr (CR -> D) */
#  define jit_emit_mfcr(pc, D) jit_emit_3reg_x(pc, 31, D, 0, 0, 19, 0)

#  define jit_emit_fadd_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 21, 0)
#  define jit_emit_fsub_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 20, 0)
#  define jit_emit_fmul_rrr(pc, D, A, B) jit_emit_3a(pc, 63, D, A, 0, B, 25, 0)
#  define jit_emit_fdiv_rrr_no_check(pc, D, A, B) jit_emit_3a(pc, 63, D, A, B, 0, 18, 0)

/* canonical names */
#  define jit_emit_add_rrr_n jit_emit_fadd_rrr
#  define jit_emit_div_rrr_n jit_emit_fdiv_rrr
#  define jit_emit_mul_rrr_n jit_emit_fmul_rrr
#  define jit_emit_sub_rrr_n jit_emit_fsub_rrr

#  define jit_emit_fsel(pc, D, A, B, C) jit_emit_3a(pc, 63, D, A, B, C, 23, 0)

#  define jit_emit_abs_rr_n(pc, D, A)  jit_emit_3reg_x(pc, 63, D, 0, A, 264, 0)
#  define jit_emit_neg_rr_n(pc, D, A)   jit_emit_3reg_x(pc, 63, D, 0, A, 40, 0)

#  define jit_emit_fmr(pc, D, A)   jit_emit_3reg_x(pc, 63, D, 0, A, 72, 0)
#  define jit_emit_mov_rr_n(pc, D, A) jit_emit_fmr(pc, D, A)

/* float cvt to int (round towards zero) */
#  define jit_emit_fctiwz(pc, D, A)   jit_emit_3reg_x(pc, 63, D, 0, A, 15, 0)
/* Store Floating-Point as Integer Word Indexed */
#  define jit_emit_stfiwx(pc, S, A, B)  jit_emit_3reg_x(pc, 31, S, A, B, 983, 0)

/* not in core.ops, but probably should be: */
#  define jit_emit_fsqrt(pc, D, A) jit_emit_3reg(pc, 63, D, 0, A, 0, 18, 0)

/* Load a CPU register from a Parrot register. */

#  define jit_emit_mov_rm_i(pc, reg, offs) \
    jit_emit_lwz(pc, reg, offs, r13)

#  define jit_emit_mov_rm_n(pc, reg, offs) \
    jit_emit_lfd(pc, reg, offs, r13)

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

#  define jit_emit_cmp_rr_i(pc, ra, rb) _emit_cmp(pc, 31, 0, ra, rb)
#  define jit_emit_cmp_rr_n(pc, ra, rb) _emit_cmp(pc, 63, 0, ra, rb)

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

#  define jit_emit_mov_mr_i(pc, offs, reg) \
    jit_emit_stw(pc, reg, offs, r13)

#  define jit_emit_mov_mr_n(pc, offs, reg) \
    jit_emit_stfd(pc, reg,  offs, r13)

/*
 * Load a 32-bit immediate value.
 */

#  define jit_emit_mov_ri_i(pc, D, imm) \
    jit_emit_ori(pc, D, r31, (long)imm & 0xffff); \
    if ((long)imm >> 16 != 0) { \
      jit_emit_oris(pc, D, D, (long)imm >> 16); }

/* load a float constant (needs a gpr temp: ISR2) */

#  define jit_emit_mov_ri_n(pc, D, offs) \
    jit_emit_mov_ri_i(pc, ISR1, offs); \
    jit_emit_lfd(pc, D, 0, ISR1);

#  define add_disp(pc, D, disp) \
    jit_emit_mov_ri_i(pc, ISR1, disp); \
    jit_emit_add_rrr(pc, D, r15, ISR1)

#  define jit_emit_load_op_map(pc) \
    jit_emit_lwz(pc, ISR1, offsetof(Interp, code), r16); \
    jit_emit_lwz(pc, ISR1, offsetof(struct PackFile_ByteCode, jit_info), ISR1); \
    jit_emit_lwz(pc, r14, (offsetof(Parrot_jit_arena_t, op_map) + \
                           offsetof(Parrot_jit_info_t, arena)), ISR1)

#  define jit_emit_load_code_start(pc) \
    jit_emit_lwz(pc, ISR1, offsetof(Interp, code), r16); \
    jit_emit_lwz(pc, r15,  offsetof(struct PackFile_Segment, data), ISR1)

#  define jit_emit_branch_to_opcode(pc, D) \
    jit_emit_lwz(pc, r13, offsetof(Interp, ctx.bp), r16); \
    jit_emit_sub_rrr(jit_info->native_ptr, ISR1, D, r15); \
    jit_emit_lwzx(jit_info->native_ptr, ISR1, ISR1, r14); \
    jit_emit_mtctr(jit_info->native_ptr, ISR1); \
    jit_emit_bctrl(jit_info->native_ptr)

#if PARROT_EXEC_OS_AIX /* support AIX calling convention using compiler intermediary _ptrgl */
#  define jit_emit_call_func(pc, addr) \
    jit_emit_mov_ri_i(jit_info->native_ptr, ISR1, (long)*((long*)(addr))); \
    jit_emit_mtctr(jit_info->native_ptr, ISR1); \
    jit_emit_bctrl(jit_info->native_ptr);
#else
#  define jit_emit_call_func(pc, addr) \
    jit_emit_mov_ri_i(jit_info->native_ptr, ISR1, (long)(addr)); \
    jit_emit_mtctr(jit_info->native_ptr, ISR1); \
    jit_emit_bctrl(jit_info->native_ptr);
#endif

#  if EXEC_CAPABLE
#   define load_nc(pc, D, disp) \
      jit_emit_oris(pc, D, r31, (long)disp >> 16); \
      Parrot_exec_add_text_rellocation(jit_info->objfile, \
        pc, RTYPE_DATA, "const_table", -2); \
      jit_emit_ori(jit_info->native_ptr, D, D, (long)disp & 0xffff); \
      Parrot_exec_add_text_rellocation(jit_info->objfile, \
        pc, RTYPE_DATA1, "const_table", -2);
#endif /* EXEC_CAPABLE */

static char *
div_rrr(Parrot_jit_info_t *jit_info, char D, char A, char B)
{
    char *jmp_ptr, *sav_ptr;
    static const char* div_by_zero = "Divide by zero";
    char *pc = jit_info->native_ptr;

    jit_emit_cmp_ri(pc, B, 0);
     /* remember PC */
    jmp_ptr = pc;
    /* emit jump past exception code, dummy offset */
    _emit_bc(pc, BNE, 0, 0, 0);
    jit_emit_mov_rr(pc, r3, r16); /* interp */
    jit_emit_mov_ri_i(pc, r4, 0);          /* NULL */
    jit_emit_mov_ri_i(pc, r5, E_ZeroDivisionError);          /* type */
    jit_emit_mov_ri_i(pc, r6, div_by_zero); 
    jit_info->native_ptr = pc;
    jit_emit_call_func(pc, (void*) real_exception);
    pc = jit_info->native_ptr;
    /* fixup above jump */
    sav_ptr = pc;
    pc = jmp_ptr;
    _emit_bc(pc, BNE, ((long)(sav_ptr - jmp_ptr)), 0, 0);
    /* restore PC */
    pc = sav_ptr;
    jit_emit_div_rrr_no_check(pc, D, A, B);
    return pc;
}

static char *
fdiv_rrr(Parrot_jit_info_t *jit_info, char D, char A, char B)
{
    char *jmp_ptr, *sav_ptr;
    static const char* div_by_zero = "Divide by zero";
    char *pc = jit_info->native_ptr;
    static const double zero = 0.0;

    jit_emit_mov_ri_i(pc, ISR1, &zero);
    jit_emit_lfd(pc, f1, 0, ISR1);

    jit_emit_cmp_rr_n(pc, B, f1);   /* XXX be sure it's unmapped */
     /* remember PC */
    jmp_ptr = pc;
    /* emit jump past exception code, dummy offset */
    _emit_bc(pc, BNE, 0, 0, 0);
    jit_emit_mov_rr(pc, r3, r16); /* interp */
    jit_emit_mov_ri_i(pc, r4, 0);          /* NULL */
    jit_emit_mov_ri_i(pc, r5, E_ZeroDivisionError);          /* type */
    jit_emit_mov_ri_i(pc, r6, div_by_zero); 
    jit_info->native_ptr = pc;
    jit_emit_call_func(pc, (void*) real_exception);
    pc = jit_info->native_ptr;
    /* fixup above jump */
    sav_ptr = pc;
    pc = jmp_ptr;
    _emit_bc(pc, BNE, ((long)(sav_ptr - jmp_ptr)), 0, 0);
    /* restore PC */
    pc = sav_ptr;
    jit_emit_fdiv_rrr_no_check(pc, D, A, B);
    return pc;
}

#  define jit_emit_div_rrr(pc, D, A, B) pc = div_rrr(jit_info, D, A, B)
#  define jit_emit_fdiv_rrr(pc, D, A, B) pc = fdiv_rrr(jit_info, D, A, B)

/* XXX except A = -2^31 and B = -1 */

static char *
cmod_rrr(Parrot_jit_info_t *jit_info, char D, char A, char B)
{
    char *pc;
    pc = div_rrr(jit_info, D, A, B); 
    jit_emit_mul_rrr(pc, D, D, B); 
    jit_emit_sub_rrr(pc, D, A, D); 
    return pc;
}

#  define jit_emit_cmod_rrr(pc, D, A, B) pc = cmod_rrr(jit_info, D, A, B)


void Parrot_ppc_jit_restore_nonvolatile_registers(void);

/*
 * r13 - r31 are preserved i.e. 19 GPRs
 * f14 - f31 are preserved
 * (these are all of the nonvolatile registers)
 */
#define PPC_JIT_GP_REGISTER_SAVE_SPACE (4*19)
#define PPC_JIT_FP_REGISTER_SAVE_SPACE (8*18)
/*
 * 24 linkage area
 * 32 param area i.e.enough for 8 args
 * 12 round up so that sum is divisible by 16
 */
#define PPC_JIT_FRAME_SIZE (PPC_JIT_GP_REGISTER_SAVE_SPACE + PPC_JIT_FP_REGISTER_SAVE_SPACE + 68)

#if JIT_EMIT == 2

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp * interpreter)
{
    add_disp(jit_info->native_ptr, r3,
        ((long)jit_info->cur_op - (long)interpreter->code->base.data));
    jit_emit_mov_rr(jit_info->native_ptr, r4, r16); /* interp */

    /*
    Parrot_jit_newfixup(jit_info);

    jit_info->arena.fixups->type = JIT_PPC_CALL;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    _emit_bx(jit_info->native_ptr, 1, 0);
    */

    jit_emit_call_func(jit_info->native_ptr,
                       interpreter->op_func_table[*(jit_info->cur_op)]);
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

#endif /* JIT_EMIT == 2 */

#define NATIVECODE jit_info->native_ptr
#define CUR_OPCODE jit_info->cur_op
#define MAP(i) jit_info->optimizer->map_branch[jit_info->op_i + (i)]
static void
jit_get_params_pc(Parrot_jit_info_t *jit_info, Interp * interpreter)
{
    PMC *sig_pmc;
    INTVAL *sig_bits, i, n;

    sig_pmc = CONTEXT(interpreter->ctx)->constants[CUR_OPCODE[1]]->u.key;
    sig_bits = PMC_data(sig_pmc);
    n = PMC_int_val(sig_pmc);
    jit_info->n_args = n;
    for (i = 0; i < n; ++i) {
        switch (sig_bits[i] & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                jit_emit_lwz(NATIVECODE, MAP(2+i), 4 + i*4, r5);
                break;
            case PARROT_ARG_FLOATVAL:
                jit_emit_lwz(NATIVECODE, ISR1, 4 + i*4, r5);
                jit_emit_lfd(jit_info->native_ptr, MAP(2+i), 0, ISR1);
                break;
        }
    }
}

#define CONST(i) interpreter->code->const_table->constants[jit_info->cur_op[i]]
static void
jit_set_returns_pc(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int recursive)
{
    PMC *sig_pmc;
    INTVAL *sig_bits, sig;

    sig_pmc = CONTEXT(interpreter->ctx)->constants[CUR_OPCODE[1]]->u.key;
    if (!SIG_ELEMS(sig_pmc))
        return;
    sig_bits = SIG_ARRAY(sig_pmc);
    sig = sig_bits[0];
    if (!recursive) {
        /* ISR2 <- args[0] */ 
        jit_emit_lwz(jit_info->native_ptr, ISR2, 0, r5);
    }
    switch (sig & (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT)) {
        case PARROT_ARG_INTVAL:
            if (recursive) {
                jit_emit_mov_rr(NATIVECODE, r3, MAP(2));
            }
            else {
                jit_emit_stw(jit_info->native_ptr, MAP(2), 0, ISR2);
            }
            break;
        case PARROT_ARG_INTVAL|PARROT_ARG_CONSTANT:
            if (recursive) {
                jit_emit_mov_ri_i(NATIVECODE, r3, CUR_OPCODE[2]);
            }
            else {
                jit_emit_mov_ri_i(NATIVECODE, ISR1, CUR_OPCODE[2]);
                jit_emit_stw(jit_info->native_ptr, ISR1, 0, ISR2);
            }
            break;
        case PARROT_ARG_FLOATVAL:
            if (recursive) {
                /* floats are returned in f1 according to ABI */
                jit_emit_mov_rr_n(NATIVECODE, f1, MAP(2));
            }
            else {
                jit_emit_stfd(jit_info->native_ptr, MAP(2), 0, ISR2);
            }
            break;
        case PARROT_ARG_FLOATVAL|PARROT_ARG_CONSTANT:
            jit_emit_mov_ri_i(NATIVECODE, ISR1, &CONST(2)->u.number);
            if (recursive) {
                jit_emit_lfd(jit_info->native_ptr, f1, 0, ISR1);
            }
            else {
                jit_emit_lfd(jit_info->native_ptr, FSR1, 0, ISR1);
                jit_emit_stfd(jit_info->native_ptr, FSR1, 0, ISR2);
            }
            break;
        default:
            internal_exception(1, "set_returns_jit - unknown type");
            break;
    }
}

static int jit_save_regs_call(Parrot_jit_info_t *, Interp * , int skip);

static void
jit_set_args_pc(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int recursive)
{
    PMC *sig_args, *sig_params, *sig_result;
    INTVAL *sig_bits, sig, i, n;
    struct PackFile_Constant ** constants;
    opcode_t *params, *result;
    char params_map;
    int skip, used_n;
    const jit_arch_regs *reg_info;

    if (!recursive) {
        /* create args array */
        internal_exception(1, "set_args_jit - can't do that yet ");
    }

    constants = CONTEXT(interpreter->ctx)->constants;
    sig_args = constants[CUR_OPCODE[1]]->u.key;
    if (!SIG_ELEMS(sig_args))
        return;
    params = jit_info->optimizer->sections->begin;
    sig_params = constants[params[1]]->u.key;
    ASSERT_SIG_PMC(sig_params);
    sig_bits = SIG_ARRAY(sig_args);
    n = SIG_ELEMS(sig_args);  
    /*
     * preserve registers - need get_results, because we skip the 
     * return value
     */
    result = CUR_OPCODE + 2 + n + 3; /* set_args, set_p_pc */
    assert(*result == PARROT_OP_get_results_pc);
    sig_result = constants[result[1]]->u.key;
    ASSERT_SIG_PMC(sig_result);

    if (!SIG_ELEMS(sig_result))
        skip = -1;
    else 
        skip = MAP(2 + n + 3 + 2);
    used_n = jit_save_regs_call(jit_info, interpreter, skip);
    for (i = 0; i < n; ++i) {
        sig = sig_bits[i];
        /* move args to params regs */
        params_map = jit_info->optimizer->map_branch[2 + i];
        /* TODO check for overlaps/collision */
        switch (sig & (PARROT_ARG_TYPE_MASK|PARROT_ARG_CONSTANT)) {
            case PARROT_ARG_INTVAL:
                jit_emit_mov_rr(NATIVECODE, params_map, MAP(2 + i));
                break;
            case PARROT_ARG_INTVAL|PARROT_ARG_CONSTANT:
                jit_emit_mov_ri_i(NATIVECODE, params_map, CUR_OPCODE[2 + i]);
                break;
            default:
                internal_exception(1, "set_args_jit - unknown typ");
                break;
        }
    }
}

/*
 * preserve registers around a functioncall
 * 
 * b) all used register around a call (skip >= 0 := return result
 *    TODO save N regs for b) too
 */
static int
jit_save_regs_call(Parrot_jit_info_t *jit_info, Interp * interpreter, int skip)
{
    int i, used_i, save_i;
    const jit_arch_regs *reg_info;

    /* create stack frame 24 link + 32 params -> 64 */
    jit_emit_mflr(jit_info->native_ptr, r0);    /* store link reg */
    jit_emit_stw(jit_info->native_ptr, r0, 8, r1); /* stw     r0,8(r1) */
    jit_emit_stwu(jit_info->native_ptr, r1, -64, r1);
    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    for (i = 0; i < used_i; ++i) {
        if (reg_info->map_I[i] == skip)
            continue;
        /* we use param area sp+24 := r3, sp+52 := r10 */
        jit_emit_stw(jit_info->native_ptr, reg_info->map_I[i], 24 + i*4, r1);
    }
    /* preserve link register */
    return 0;  /* TODO N regs */
}

static void 
jit_restore_regs_call(Parrot_jit_info_t *jit_info, Interp * interpreter, 
        int skip)
{

    int i, used_i, save_i;
    const jit_arch_regs *reg_info;

    used_i = CONTEXT(interpreter->ctx)->n_regs_used[REGNO_INT];
    reg_info = &jit_info->arch_info->regs[jit_info->code_type]; 
    /* note - reversed order of jit_save_regs  */
    for (i = used_i - 1; i >= 0; --i) {
        if (reg_info->map_I[i] == skip)
            continue;
        /* we use param area sp+24 := r3, sp+52 := r10 */
        jit_emit_lwz(jit_info->native_ptr, reg_info->map_I[i], 24 + i*4, r1);
    }
    /* pop stack frame */
    jit_emit_add_rri_i(jit_info->native_ptr, r1, r1, 64);
    /* restore link reg */
    jit_emit_lwz(jit_info->native_ptr, r0, 8, r1);   
    jit_emit_mtlr(jit_info->native_ptr, r0);   
    /* TODO other types */
}

#if JIT_EMIT == 0

/*
 * emit stack frame according to ABI
 * see also jit/ppc/core.jit for Parrot_end
 */
static void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    int i;
    jit_emit_mflr(jit_info->native_ptr, r0);
    jit_emit_stmw(jit_info->native_ptr, r13, -PPC_JIT_GP_REGISTER_SAVE_SPACE, r1);

    for( i = 1; i <= 18; ++i )
    {
        jit_emit_stfd(jit_info->native_ptr, (i + 13), (-PPC_JIT_GP_REGISTER_SAVE_SPACE - i*8), r1);
    }
    jit_emit_stw(jit_info->native_ptr, r0, 8, r1);
    jit_emit_stwu(jit_info->native_ptr, r1, -PPC_JIT_FRAME_SIZE, r1);
    jit_emit_xor_rrr(jit_info->native_ptr, r31, r31, r31);
    jit_emit_mov_rr(jit_info->native_ptr, r16, r3);  /* interp */
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

static void
Parrot_jit_begin_sub(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
}

static void
Parrot_jit_begin_sub_regs(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    jit_emit_mflr(jit_info->native_ptr, r0);    /* optional */
    jit_emit_stw(jit_info->native_ptr, r0, 8, r1); /* stw     r0,8(r1) */
    /* preserve r31 */
    jit_emit_stw(jit_info->native_ptr, r31, -4, r1); 
    /* 24 linkage area, 32 params , 1 word local, roundup => 32 */
    jit_emit_stwu(jit_info->native_ptr, r1, -64, r1);
    /* r31 = 0 - needed for load immediate */
    jit_emit_xor_rrr(jit_info->native_ptr, r31, r31, r31);

    if (jit_info->flags & JIT_CODE_RECURSIVE) {
        char * L1;
        int offs;
        jit_get_params_pc(jit_info, interpreter);
        /* remember fixup position - call sub */
        L1 = NATIVECODE;
        _emit_bx(NATIVECODE, 1, 0xbeef); /* bl */
        /* fetch args */
        jit_emit_lwz(jit_info->native_ptr, ISR2, 0, r5);
        /* store INTVAL result */
        jit_emit_stw(jit_info->native_ptr, r3, 0, ISR2);
        /* fetch pc -> return it */
        jit_emit_lwz(jit_info->native_ptr, r3, 4 + jit_info->n_args * 4, r5);
	/* return sequence */
	jit_emit_lwz(jit_info->native_ptr, r1, 0, r1);
	jit_emit_lwz(jit_info->native_ptr, r31, -4, r1);
	jit_emit_lwz(jit_info->native_ptr, r0, 8, r1);   /* opt */
	jit_emit_mtlr(jit_info->native_ptr, r0);   /* opt */
	jit_emit_blr(jit_info->native_ptr);
        /* re-emit call */
        offs = NATIVECODE - L1;
        _emit_bx(L1, 1, offs); /* bl */
    }
}

static void
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
static void
jit_mov_mr_offs(Parrot_jit_info_t *jit_info, int base, INTVAL offs, int reg)
{
    jit_emit_mov_mr_i(jit_info->native_ptr, offs, reg);
    /*
     * if we save registers, the last instruction isn't the ins that
     * sets condition codes, so the speed hack in Parrot_ifunless_i_ic
     * doesn't work.
     */
    jit_info->prev_op = 0;
}

/* move mem (i.e. intreg) to reg */
static void
jit_mov_rm_offs(Parrot_jit_info_t *jit_info, int reg, int base, INTVAL offs)
{
    jit_emit_mov_rm_i( jit_info->native_ptr, reg, offs);
}

/* move reg to mem (i.e. numreg) */
static void
jit_mov_mr_n_offs(Parrot_jit_info_t * jit_info, int base, INTVAL offs, int reg)
{
    jit_emit_mov_mr_n( jit_info->native_ptr, offs, reg);
    jit_info->prev_op = 0;
}

/* move mem (i.e. numreg) to reg */
static void
jit_mov_rm_n_offs(Parrot_jit_info_t * jit_info, int reg, int base, INTVAL offs)
{
    jit_emit_mov_rm_n(jit_info->native_ptr, reg, offs);
}
#  define REQUIRES_CONSTANT_POOL 0
#  ifdef PARROT_EXEC_OS_AIX
#    define INT_REGISTERS_TO_MAP 14
#  else
#    define INT_REGISTERS_TO_MAP 14
#  endif
#  define FLOAT_REGISTERS_TO_MAP 18

/*
 * Register usage
 * r0  special rA/0 not allocatable, not usable as ISR1
 * r1  SP
 * r2 TOC (AIX only) / allocated
 * r3 - r10 allocated
 * r11 ISR1
 * r12 ISR2
 * r13 Parrot register frame pointer
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


static const char intval_map[INT_REGISTERS_TO_MAP] =
    { r17, r18, r19, r20, r21, r22, r23,
      r24, r25, r26, r27, r28, r29, r30
#  ifndef PARROT_EXEC_OS_AIX
      /* AIX calling convention reserves r2 */
      /* r2, */
#  endif
    };

static const char intval_map_sub[] =
    { r4, r6, r7, r8, r9, r10 };
/*
 * f0, f13 are used as scratch registers
 * f1  - f12 are (additional) volatile registers
 * f14 - f31 are not nonvolatile, and preserved in begin/end
 */
static const char floatval_map[FLOAT_REGISTERS_TO_MAP] =
    {
      f14, f15, f16, f17, f18, f19, f20, f21,
      f22, f23, f24, f25, f26, f27, f28, f29, f30, f31
    };

static const char floatval_map_sub[] =
{ f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12 };

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

static void
ppc_flush_cache(Parrot_jit_info_t * jit_info, Interp *i)
{
    ppc_sync_cache(jit_info->arena.start, jit_info->native_ptr);
}


static const jit_arch_info arch_info = {
    jit_mov_rm_offs,
    jit_mov_rm_n_offs,
    jit_mov_mr_offs,
    jit_mov_mr_n_offs,
    Parrot_jit_dofixup,
    ppc_flush_cache,
    {
        {
            Parrot_jit_begin,   /* emit code prologue */
            INT_REGISTERS_TO_MAP,   /* mapped ints */
            INT_REGISTERS_TO_MAP,   /* all are preserved */
            intval_map,
            FLOAT_REGISTERS_TO_MAP,    /* mapped float regs */
            FLOAT_REGISTERS_TO_MAP,    /* all preserved */
            floatval_map
        },
        {
            Parrot_jit_begin_sub,   /* emit code prologue */
            6,                  /* 6 mapped ints */
            6,                  /* all volatile */
            intval_map_sub,
            12,                  /* mapped float regs */
            12,                  /* all volatile */
            floatval_map_sub
        },
        {
            Parrot_jit_begin_sub_regs,  /* emit code prologue */
            6,                  /* 6 mapped ints */
            6,                  /* all volatile */
            intval_map_sub,
            12,                  /* TODO 12 mapped float regs */
            12,                  /* all volatile */
            floatval_map_sub
        }
    }
};


const jit_arch_info * 
Parrot_jit_init(Interp *interpreter)
{
    return &arch_info;
}

#endif /* JIT_EMIT == 0 */
#endif /* PARROT_PPC_JIT_EMIT_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
