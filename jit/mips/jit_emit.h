/*
 * jit_emit.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    MIPS JIT
 * History:
 *      Initial version by Daniel Grunblatt on 2002.8.20
 * Notes:
 * References:
 */

#if !defined(PARROT_MIPS_JIT_EMIT_H_GUARD)
#define PARROT_MIPS_JIT_EMIT_H_GUARD

typedef enum {
    zero,
    at,
    v0,
    v1,
    a0,
    a1,
    a2,
    a3,
    t0,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    t7,
    s0,
    s1,
    s2,
    s3,
    s4,
    s5,
    s6,
    s7,
    t8,
    t9,
    k0,
    k1,
    gp,
    sp,
    fp,
    ra
} mips_register_t;

#if JIT_EMIT

enum { JIT_MIPS_CALL, JIT_MIPS_BRANCH };

/*
 * R type
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |    rs    |    rt    |    rd    |    re    |    funct    |
 *  +--------------------------------------------------------------------+
 *   31      26 25      21 20      16 15      11 10       6 5           0
 *
 */

#  define emit_r(pc, opcode, rs, rt, rd, re, funct) \
    *(int *)((pc += 4) - 4) = \
      opcode << 26 | rs << 21 | rt << 16 | rd << 11 | re << 6 | funct;

/*
 * I type
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |     rs     |     rt     |            offset             |
 *  +--------------------------------------------------------------------+
 *   31      26 25        21 20        16 15                            0
 *
 */

#  define emit_i(pc, opcode, rs, rt, offset) \
    *(int *)((pc += 4) - 4) = \
      opcode << 26 | rs << 21 | rt << 16 | ((long)offset & 0xffff);

/*
 * J type
 *
 *  +--------------------------------------------------------------------+
 *  |  Opcode  |                       target                            |
 *  +--------------------------------------------------------------------+
 *   31      26 25                                                      0
 *
 */

#  define emit_j(pc, opcode, target) \
    *(int *)((pc += 4) - 4) = opcode << 26 | target;

#  define emit_nop(pc) emit_j(pc, 0, 0)

/*  LW
 *
 *  To load a word from memory as a signed value.
 *  rt = (rs + offset)
 */

#  define emit_lw(pc, rt, offset, rs) \
    emit_i(pc, 0x23, rs, rt, offset)

#  define emit_sw(pc, rt, offset, rs) \
    emit_i(pc, 0x2b, rs, rt, offset)

#  define BASE_REG s0

#  define emit_sw_r(pc, reg, addr) \
    emit_sw(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->ctx.int_reg.registers[0])), BASE_REG)

#  define emit_lw_r(pc, reg, addr) \
    emit_lw(pc, reg, (((char *)addr) - \
      ((char *)&interpreter->ctx.int_reg.registers[0])), BASE_REG)

/*  LUI
 *
 *  To load a constant into the upper half of a word.
 *  rt = imm << 16
 */

#  define emit_lui(pc, rt, imm) \
    emit_i(pc, 0xf, 0, rt, imm)

/*  AND
 *
 *  To do a bitwise logical AND.
 *  rd = rs ^ rt
 */

#  define emit_and(pc, rd, rs, rt) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x24)

/*  OR
 *
 *  To do a bitwise logical OR.
 *  rd = rs | rt
 */

#  define emit_or(pc, rd, rs, rt) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x25)

/*  XOR
 *
 *  To do a bitwise logical EXCLUSIVE OR.
 *  rd = rs ^ rt
 */

#  define emit_xor(pc, rd, rs, rt) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x26)


/*  ORI
 *
 *  To do a bitwise logical OR with a constant.
 *  rt = rs | imm
 */

#  define emit_ori(pc, rs, rt, imm) \
    emit_i(pc, 0xd, rs, rt, imm)

/*  ADD
 *
 *  To add 32 bit integers.
 *  rd = rs + rt
 */

#  define emit_add(pc, rd, rs, rt) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x20)

/*  ADDIU
 *
 *  To add a constant to a 32 bit integer.
 *  rt = rs + imm
 */

#  define emit_addiu(pc, rs, rt, imm) \
    emit_i(pc, 9, rs, rt, imm)

/*  SUB
 *
 *  To substract 32 bit integers.
 *  rd = rs - rt
 */

#  define emit_sub(pc, rd, rs, rt) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x22)

/*  MULT
 *
 *  To multiply 32 bit integers.
 *  (LO , HI) = rs * rt
 */

#  define emit_mult(pc, rs, rt) \
    emit_r(pc, 0, rs, rt, 0, 0, 0x18)

/*  MFLO
 *
 *  To copy the special purpose register LO to a GPR.
 */

#  define emit_mflo(pc, rd) \
    emit_r(pc, 0, 0, 0, rd, 0, 0x12)

/*  MUL (Pseudo instruction)
 *
 *  To multiply 32 bit integers.
 *  rd = rs * rt
 */

#  define emit_mul(pc, rd, rs, rt) \
    emit_mult(pc, rs, rt); \
    emit_mflo(pc, rd)

/*  DIV
 *
 *  To divide 32 bit integers.
 *  (LO , HI) = rs / rt
 *  The quotient is placed in LO and the reminder in HI.
 */

#  define emit_divi(pc, rs, rt) \
    emit_r(pc, 0, rs, rt, 0, 0, 0x1a)

/*  DIV (Pseudo instruction)
 *
 *  To divide 32 bit integers.
 *  rd = rs / rt
 */

#  define emit_div(pc, rd, rs, rt) \
    emit_divi(pc, rs, rt); \
    emit_mflo(pc, rd)

/*  JR
 *
 *  To branch to an instruction address in a register.
 *  PC = rs
 */

#  define emit_jr(pc, rs) \
    emit_r(pc, 0, rs, 0, 0, 0, 8)

/*  JAL
 *
 *  To procedure call within the current 256 MB aligned region.
 */

#  define emit_jal(pc) \
    emit_j(pc, 3, 0)

/*  JALR
 *
 *  To procedure call to an instruction address in a register.
 */

#  define emit_jalr(pc, rs, rd) \
    emit_r(pc, 0, rs,  0, rd, 0, 9)

/*  MOVE
 *
 *  To move a GPR.
 *  rd = rs
 */

#  define emit_move(pc, rs, rd) \
    emit_r(pc, 0, rs, 0, rd, 0, 0x21)

#  define emit_mov(pc, rd, rs) \
    emit_move(pc, rs, rd)

/*  NEG
 *  rd = -rt
 */

#  define emit_negu(pc, rd, rt) \
    emit_r(pc, 0, 0, rt, rd, 0, 0x23)

#  define emit_neg(pc, rd, rt) \
    emit_r(pc, 0, 0, rt, rd, 0, 0x22)

/* Load a constant */

#  define emit_imm32(pc, rd, imm) \
    emit_lui(pc, rd, ((long)imm >> 16)); \
    emit_ori(pc, rd, rd, imm)


static void
emit_if(Parrot_jit_info_t *jit_info, char opcode, mips_register_t rs,
    mips_register_t rt, opcode_t disp)
{
    opcode_t opcode = jit_info->op_i + disp;
    int offset;

    if (opcode <= jit_info->op_i) {
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
        jit_info->arena.fixups->type = JIT_MIPS_BRANCH;
        jit_info->arena.fixups->param.opcode = opcode;

        if (jit_info->optimizer->cur_section->branch_target ==
            jit_info->optimizer->cur_section)
                jit_info->arena.fixups->skip =
                    jit_info->optimizer->cur_section->branch_target->load_size;

    }
    emit_i(jit_info->native_ptr, opcode, rs, rt, offset);
}

/*  BEQ
 *
 *  To compare GPRs then do a PC-relative conditional branch.
 *  if (rs == rt) branch
 */

#  define emit_beq(pc, rs, rt, imm) \
    emit_if(pc, 4, rs, rt, imm)

/*  BNE
 *
 *  To compare GPRs then do a PC-relative conditional branch.
 *  if (rs != rt) branch
 */

#  define emit_bne(pc, rs, rt, imm) \
    emit_if(pc, 5, rs, rt, imm)

/*  BNEZ
 *
 *  To compare GPRs then do a PC-relative conditional branch.
 *  if (rs != 0) branch
 */

#  define emit_bnez(pc, rs, imm) \
    emit_if(pc, 1, rs, 2, imm)


/*  BEGZ
 *
 *  To compare GPRs then do a PC-relative conditional branch.
 *  if (rs >= 0) branch
 */

#  define emit_begz(pc, rs, imm) \
    emit_if(pc, 1, rs, 1, imm)

/*  SLT
 *
 *  To record the result of a less than comparison.
 *  rd <- (rs < rt)
 */

#  define emit_slt(pc, rs, rt, rd) \
    emit_r(pc, 0, rs, rt, rd, 0, 0x2a)

/*  GE (Pseudo-op)
 */
#  define emit_ge(pc, rs, rt, imm) \
    emit_slt(pc, rs, rt, at); \
    emit_beqz(pc, at, imm)

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp * interpreter)
{
    emit_addiu(jit_info->native_ptr, sp, sp, -40);
    emit_sw(jit_info->native_ptr, ra, 32, sp);
    emit_sw(jit_info->native_ptr, fp, 28, sp);
    emit_mov(jit_info->native_ptr, s0, a0);
    emit_imm32(jit_info->native_ptr, s1, jit_info->arena.op_map);
    emit_imm32(jit_info->native_ptr, s2, interpreter->code->base.data);
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

    while (fixup) {
        switch (fixup->type) {
            case JIT_MIPS_CALL:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (((long)fixup->param.fptr - (long)0x10000000) / 4);
                *(fixup_ptr++) |= (char)(d >> 29) & 3;
                *(fixup_ptr++) = (char)(d >> 16);
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

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
    Interp *interpreter)
{
    emit_imm32(jit_info->native_ptr, a0, jit_info->cur_op);
    emit_mov(jit_info->native_ptr, a1, s0);
    emit_imm32(jit_info->native_ptr, t9,
        interpreter->op_func_table[*(jit_info->cur_op)]);
    emit_jalr(jit_info->native_ptr, t9, ra);
    emit_nop(jit_info->native_ptr);
}

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
    Interp *interpreter)
{
    Parrot_jit_normal_op(jit_info,interpreter);
    emit_sub(jit_info->native_ptr, v0, v0, s2);
    emit_add(jit_info->native_ptr, v0, v0, s1);
    emit_lw(jit_info->native_ptr, v0, 0, v0);
    emit_jr(jit_info->native_ptr, v0);
}

/* move reg to mem (i.e. intreg) */
void
Parrot_jit_emit_mov_mr(Interp * interpreter, char *mem, int reg)
{
    emit_sw_r(
            ((Parrot_jit_info_t*)(interpreter->code->jit_info))->native_ptr,
            ((Parrot_jit_info_t*)(interpreter->code->jit_info))->intval_map[i],
            &interpreter->ctx.int_reg.registers[cur_se->int_reg_usage[i]]
    );
}

/* move mem (i.e. intreg) to reg */
void
Parrot_jit_emit_mov_rm(Interp * interpreter, int reg, char *mem)
{
    emit_lw_r(
            ((Parrot_jit_info_t*)(interpreter->code->jit_info))->native_ptr,
            ((Parrot_jit_info_t*)(interpreter->code->jit_info))->intval_map[i],
            &interpreter->ctx.int_reg.registers[cur_se->int_reg_usage[i]]
    );
}

/* move reg to mem (i.e. numreg) */
void
Parrot_jit_emit_mov_mr_n(Interp * interpreter, char *mem, int reg)
{
}

/* move mem (i.e. numreg) to reg */
void
Parrot_jit_emit_mov_rm_n(Interp * interpreter, int reg, char *mem)
{
}



#else

#  define REQUIRES_CONSTANT_POOL 0
#  define INT_REGISTERS_TO_MAP 24

char intval_map[INT_REGISTERS_TO_MAP] =
    { v0, v1, a0, a1, a2, a3, t0, t1, t2, t3, t4, t5, t6, t7, s0, s1, s2, s3,
      s4, s5, s6, s7, t8, t9 };

#  include <asm/cachectl.h>

static void
sync_cache (void *_start, void *_end)
{
    cacheflush(_start, (int)((char *)_end - (char *)_start), BCACHE);
}

#endif
#endif /* PARROT_MIPS_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
