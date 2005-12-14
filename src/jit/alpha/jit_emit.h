/*
 * jit_emit.h
 *
 * ALPHA
 *
 * $Id$
 */

/*  Register usage:
 *
 * REG0 v0          Used for expression evaluations and to hold the integer
 *                  function results. Not preserved across procedure calls.
 * REG1-8 t0-t7     Temporary registers used for expression evaluations. Not
 *                  preserved across procedure calls.
 * REG9-14 s0-s5    Saved registers. Preserved across procedure calls.
 * REG15 s6 or fp   Contains the frame pointer (if needed); otherwise, a saved
 *                  register.
 * REG16-21 a0-a5   Used to pass the first six integer type actual arguments.
 *                  Not preserved across procedure calls.
 * REG22-25 t8-t11  Temporary registers used for expression evaluations. Not
 *                  preserved across procedure calls.
 * REG26 ra         Contains the return address. Preserved across procedure
 *                  calls.
 * REG27 pv or t12  Contains the procedure value and used for expression
 *                  evaluation. Not preserved across procedure calls.
 * REG28 or at      AT Reserved for the assembler. Not preserved across
 *                  procedure calls.
 * REG29 or gp      gp Contains the global pointer. Not preserved across
 *                  procedure calls.
 * REG30 or sp      sp Contains the stack pointer. Preserved across procedure
 *                  calls.
 * REG31 zero       Always has the value 0.
 *
 */

#if !defined(PARROT_ALPHA_JIT_EMIT_H_GUARD)
#define PARROT_ALPHA_JIT_EMIT_H_GUARD

typedef enum {
    REG0_v0,
    REG1_t0,
    REG2_t1,
    REG3_t2,
    REG4_t3,
    REG5_t4,
    REG6_t5,
    REG7_t6,
    REG8_t7,
    REG9_s0,
    REG10_s1,
    REG11_s2,
    REG12_s3,
    REG13_s4,
    REG14_s5,
    REG15_s6,
    REG16_a0,
    REG17_a1,
    REG18_a2,
    REG19_a3,
    REG20_a4,
    REG21_a5,
    REG22_t8,
    REG23_t9,
    REG24_t10,
    REG25_t11,
    REG26_ra,
    REG27_t12,
    REG28_at,
    REG29_gp,
    REG30_sp,
    REG31_zero
} alpha_register_t;

typedef enum {
    LDA = 8,
    LDH = 9,
    LDQ = 41,
    STQ = 45
} ld_st_t;

typedef enum {
    BSR = 0xd0,
    BEQ = 0xe4,
    BNE = 61
} branch_t;

#define CONSTANT_POOL_SIZE 0xfff0

#if JIT_EMIT

/* All instruction formats are 32 bits long with a 6-bit major opcode field in
   bits <31:26> of the instruction. */

enum { JIT_ALPHABRANCH, JIT_ALPHABSR };

#define emit_nop(pc) { \
    *(pc++) = 0x1f; \
    *(pc++) = 0x04; \
    *(pc++) = 0xff; \
    *(pc++) = 0x47; }

#define jit_emit_mov_rr(pc, src, Ra)  { \
    *(pc++) = Ra; \
    *(pc++) = 0x04; \
    *(pc++) = 0xe0 + src; \
    *(pc++) = 0x47; }

/* Memory instruction format
 *
 *  +---------------------------------------------------------------+
 *  |   Opcode    |   Ra   |   Rb   |         memory_disp           |
 *  +---------------------------------------------------------------+
 *   31         26 25    21 20    16 15                            0
 *
 *  Depending on the opcode Ra could be the source of a store or the
 *  destination of a load.
 *
 *  The displacement field is a byte offset. It is sign-extended and added to
 *  the contents of Rb to form a virtual address. Overflow is ignored in this
 *  calculation.
 *
 */

#define emit_mem(pc, opcode, Ra, Rb, disp) \
  *(pc++) = (char)disp; \
  *(pc++) = (char)((disp) >> 8); \
  *(pc++) = (char)(Rb | (char)(Ra << 5)); \
  *(pc++) = opcode << 2 | Ra >> 3

#define base_reg REG9_s0

/* Scratch registers. */

#define ISR1 REG0_v0
#define ISR2 REG8_t7

/* Load / Store a Parrot register.
 *
 * Perform a memory operation using a Parrot register as the source or
 * the destinatination.
 *
 */

#define emit_l_s_r(pc, opcode, Ra, Rb, Parrot_reg) \
  emit_mem(pc, opcode, Ra, Rb, \
    (((char *)Parrot_reg) - (char *)&REG_INT(0)))

#define emit_ldq_b(pc, Ra, addr, Rb) \
  emit_mem(pc, LDQ, Ra, Rb, addr)

#define emit_lda_b(pc, Ra, addr, Rb) \
  emit_mem(pc, LDA, Ra, Rb, addr)

#define jit_emit_mov_rm_i(pc, Ra, addr) \
  emit_l_s_r(pc, LDQ, Ra, base_reg, addr)

#define emit_lda(pc, Ra, addr) \
  emit_l_s_r(pc, LDA, Ra, base_reg, addr)

#define emit_ldah(pc, Ra, addr, Rb) \
  emit_mem(pc, LDH, Ra, Rb, addr)

#define emit_stq_b(pc, Ra, addr, Rb) \
  emit_mem(pc, STQ, Ra, Rb, addr)

#define jit_emit_mov_mr_i(pc, addr, Ra) \
  emit_l_s_r(pc, STQ, Ra, base_reg, addr)

/* Branch instruction format
 *
 *  +---------------------------------------------------------------+
 *  |   Opcode    |   Ra   |              Branch_disp               |
 *  +---------------------------------------------------------------+
 *   31         26 25    21 20                                     0
 *
 * The displacement is treated as a longword offset. This means it is shifted
 * left two bits (to address a longword boundary), sign-extended to 64 bits,
 * and added to the updated PC to form the target virtual address. Overflow is
 * ignored.
 *
 */

#define emit_branch(pc, opcode, Ra) \
  *(pc++) = 0; \
  *(pc++) = 0; \
  *(pc++) = Ra << 5; \
  *(pc++) = opcode << 2 | Ra >> 3

/* Operate instruction format
 *
 *  +---------------------------------------------------------------+
 *  |   Opcode    |   Ra   |   Rb   | SBZ | 0 |  Function  |   Rc   |
 *  +---------------------------------------------------------------+
 *   31         26 25    21 20    16 15 13 12  11         5 4      0
 *
 *  +---------------------------------------------------------------+
 *  |   Opcode    |   Ra   |      LIT     | 1 |  Function  |   Rc   |
 *  +---------------------------------------------------------------+
 *   31         26 25    21 20          13 12  11         5 4      0
 *
 * The operate format is used for instructions that perform integer register to
 * register operations. The operate format allows the specification of one
 * destination register and two source operands. One of the source operands can
 * be a literal constant.
 *
 */

#define emit_operate1(pc, opcode, Ra, Rb, function, Rc) \
  *(pc++) = Rc | (char)(function << 5); \
  *(pc++) = (char)(function >> 5); \
  *(pc++) = Rb | (char)Ra << 5; \
  *(pc++) = opcode << 2 | Ra >> 3

/* Addq (Operate instruction)
 *
 * opcode = 16;
 * function = 128;
 *
 */

#define jit_emit_add_rrr(pc, Ra, Rb, Rc) \
  emit_operate1(pc, 16, Ra, Rb, 128, Rc)

/* Subq (Operate instruction)
 *
 * opcode = 16;
 * function = 161;
 *
 */

#define jit_emit_sub_rrr(pc, Ra, Rb, Rc) \
  emit_operate1(pc, 16, Ra, Rb, 161, Rc)

/* Mulq (Operate instruction)
 *
 * opcode = 19;
 * function = 128;
 *
 */

#define emit_mulq(pc, Ra, Rb, Rc) \
  emit_operate1(pc, 19, Ra, Rb, 128, Rc)

/* Load a constant */

#define jit_emit_mov_ri_i(pc, target, constant) \
  pc = emit_l_c(jit_info, interpreter, target, (long)constant)

static void
emit_load_intval_cpool(Parrot_jit_info_t *jit_info,
    Interp *interpreter, alpha_register_t dest, INTVAL constant)
{
    char *new_arena;

    /* If there is not space in the current pool */
    if ((char *)(jit_info->constant_pool->slot_ptr + sizeof(INTVAL)) >=
        jit_info->arena.start)
    {
        /* Check if the arena is big enough for a move or needs a realloc */
        if (jit_info->arena.size >
            (jit_info->arena.op_map[jit_info->op_i].offset + CONSTANT_POOL_SIZE))
        {
            new_arena = mem_sys_realloc(jit_info->arena.start,
                (size_t)jit_info->arena.size * 2);
            jit_info->arena.size *= 2;
            jit_info->native_ptr = new_arena +
                (jit_info->native_ptr - jit_info->arena.start);
            jit_info->constant_pool->slot_ptr = (INTVAL *)new_arena +
                ((char *)jit_info->constant_pool->slot_ptr -
                    jit_info->arena.start);
            jit_info->arena.start = new_arena;
            jit_info->constant_pool->cur_used = 0;
        }
        memcpy(jit_info->arena.start + CONSTANT_POOL_SIZE,
            jit_info->arena.start, jit_info->arena.size);
        jit_info->constant_pool->frames_used++;
    }

    if (jit_info->constant_pool->frames_used) {
        emit_ldah(jit_info->native_ptr, dest,
            jit_info->constant_pool->frames_used, REG15_s6);
        emit_ldq_b(jit_info->native_ptr, dest,
            jit_info->constant_pool->cur_used, dest);
    }
    else {
        emit_ldq_b(jit_info->native_ptr, dest,
            jit_info->constant_pool->cur_used, REG15_s6);
    }
    jit_info->constant_pool->cur_used += sizeof(INTVAL);
    *(jit_info->constant_pool->slot_ptr++) = constant;
}

/* calculates the proper values for the displacement
 * from s to d.
 * returned values should be interpreted as:
 * d = s + *high * 65536 + *low
 */

static void
calculate_displacement(long *s, long *d, long *high, long *low)
{
    long displacement = *d - *s;

    *high = displacement / 65536;
    *low = displacement % 65536;
    if (*low > 32767) {
        *high += 1;
        *low -= 65536;
    }
    else if (*low < -32767) {
        *high -= 1;
        *low += 65536;
    }
}

static char *
emit_l_c(Parrot_jit_info_t *jit_info, Interp *interpreter,
    alpha_register_t target, long constant)
{
    char *pc = jit_info->native_ptr;
    long high,low;

    if ((constant < -0x7fffffff) || (constant > 0x7fffffff)) {
        emit_load_intval_cpool(jit_info, interpreter, target, (INTVAL)constant);
        return jit_info->native_ptr;
    }
    else if ((constant < -0x7fff) || (constant > 0x7fff)) {
        high = 0;
        calculate_displacement(&high, &constant, &high, &low);
        emit_ldah(pc, target, high, REG31_zero);
        emit_lda_b(pc, target, low, target);
    }
    else {
        emit_lda_b(pc, target, constant, REG31_zero);
    }
    return pc;
}

static char *
emit_b(Parrot_jit_info_t *jit_info, branch_t opcode, alpha_register_t reg,
    opcode_t disp)
{
    char *pc = jit_info->native_ptr;

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_ALPHABRANCH;
    jit_info->arena.fixups->param.opcode = jit_info->op_i + disp;

    if (jit_info->optimizer->cur_section->branch_target ==
        jit_info->optimizer->cur_section)
            jit_info->arena.fixups->skip =
                jit_info->optimizer->cur_section->branch_target->load_size;

    emit_branch(pc, opcode, reg);

    return pc;
}

#define emit_bne(pc, reg, disp) \
  pc = emit_b(jit_info, BNE, reg, disp)

void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
    Interp *interpreter)
{
    emit_lda_b(jit_info->native_ptr, REG30_sp, -16, REG30_sp);
    emit_stq_b(jit_info->native_ptr, REG26_ra, 0, REG30_sp);
    emit_stq_b(jit_info->native_ptr, REG15_s6, 8, REG30_sp);
    jit_emit_mov_rr(jit_info->native_ptr,REG16_a0,REG9_s0);
    jit_emit_mov_rr(jit_info->native_ptr,REG27_t12,REG15_s6);
    /* TODO
    emit_ldah(jit_info->native_ptr,REG15_s6, -1, REG15_s6);
    */
    emit_lda_b(jit_info->native_ptr, REG15_s6, -0x7ff8, REG15_s6);
    jit_emit_mov_ri_i(jit_info->native_ptr, REG10_s1,
        interpreter->code->base.data);
    jit_emit_mov_ri_i(jit_info->native_ptr, REG11_s2, jit_info->arena.op_map);
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
            case JIT_ALPHABRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = (jit_info->arena.op_map[fixup->param.opcode].offset -
                     fixup->native_offset + fixup->skip - 4) / 4;
                disp = (char *)&d;
                *(fixup_ptr++) = *disp;
                *(fixup_ptr++) = *(disp + 1);
                *(fixup_ptr++) |= *(disp + 2) & 0x1f;
                break;
            case JIT_ALPHABSR:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup);
                d = ((long)fixup->param.fptr - (long)fixup_ptr - 4) / 4;
                disp = (char *)&d;
                *(fixup_ptr++) = *disp;
                *(fixup_ptr++) = *(disp + 1);
                *(fixup_ptr++) |= *(disp + 2) & 0x1f;
                break;
            default:
                internal_exception(JIT_ERROR, "Unknown fixup type:%d\n",
                                   fixup->type);
                break;
        }
        fixup = fixup->next;
    }
}

static char *
emit_bsr(Parrot_jit_info_t *jit_info,
    Interp * interpreter)
{
    char *pc = jit_info->native_ptr;

    jit_emit_mov_ri_i(pc, REG27_t12,
        interpreter->op_func_table[*(jit_info->cur_op)]);

    Parrot_jit_newfixup(jit_info);
    jit_info->arena.fixups->type = JIT_ALPHABSR;
    jit_info->arena.fixups->param.fptr =
        (void (*)(void))interpreter->op_func_table[*(jit_info->cur_op)];

    *(pc++) = 0;
    *(pc++) = 0;
    *(pc++) = 0x40;
    *(pc++) = 0xd3;

    return pc;
}

/* TODO: re-write this properly */
#define emit_jsr(pc) { \
    *(pc++) = 0; \
    *(pc++) = 0x40; \
    *(pc++) = 0xe0; \
    *(pc++) = 0x6b; \
}

#define emit_ret(pc) { \
    *(pc++) = 1; \
    *(pc++) = 0x80; \
    *(pc++) = 0xfa; \
    *(pc++) = 0x6b; \
}

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
    Interp *interpreter)
{
    jit_emit_mov_ri_i(jit_info->native_ptr, REG16_a0, jit_info->cur_op);
    jit_emit_mov_rr(jit_info->native_ptr, REG9_s0, REG17_a1);
    jit_info->native_ptr = emit_bsr(jit_info, interpreter);
}

void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
    Interp *interpreter)
{
    Parrot_jit_normal_op(jit_info,interpreter);

    jit_emit_sub_rrr(jit_info->native_ptr, ISR1, REG10_s1, ISR1);
    jit_emit_add_rrr(jit_info->native_ptr, ISR1, REG11_s2, ISR1);
    emit_ldq_b(jit_info->native_ptr, ISR1, 0, ISR1);
    /* XXX this is incorrect, might blow the stack, use jmp instead */
    emit_jsr(jit_info->native_ptr);
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
Parrot_jit_emit_mov_mr_n(Interp * interpreter, char *mem, int reg)
{
}

/* move mem (i.e. numreg) to reg */
void
Parrot_jit_emit_mov_rm_n(Interp * interpreter, int reg, char *mem)
{
}

#else

#  define REQUIRES_CONSTANT_POOL 1
#  define INT_REGISTERS_TO_MAP 21

#ifndef JIT_IMCC

char intval_map[INT_REGISTERS_TO_MAP] =
    { REG1_t0, REG2_t1, REG3_t2, REG4_t3, REG5_t4, REG6_t5, REG7_t6, REG12_s3,
      REG13_s4, REG14_s5, REG16_a0, REG17_a1, REG18_a2, REG19_a3, REG20_a4,
      REG21_a5, REG22_t8, REG23_t9, REG24_t10, REG25_t11, REG28_at };

static void
Parrot_jit_init_arenas(Parrot_jit_info_t *jit_info)
{
    jit_info->arena.size = CONSTANT_POOL_SIZE;
    jit_info->native_ptr = jit_info->arena.start =
        mem_sys_allocate((size_t)jit_info->arena.size * 2);
    jit_info->constant_pool = (Parrot_jit_constant_pool_t *)
        mem_sys_allocate((size_t)sizeof(Parrot_jit_constant_pool_t));
    jit_info->constant_pool->slot_ptr = (INTVAL *)jit_info->arena.start;
    jit_info->arena.start = jit_info->native_ptr += CONSTANT_POOL_SIZE;
    jit_info->constant_pool->cur_used = -0x7ff8;
}

static void
Parrot_jit_extend_arena(Parrot_jit_info_t *jit_info)
{
    char *new_arena;

    new_arena = mem_sys_realloc(jit_info->arena.start,
        (size_t)jit_info->arena.size * 2);
    jit_info->arena.size *= 2;
    jit_info->native_ptr = new_arena +
        (jit_info->native_ptr - jit_info->arena.start);
    jit_info->constant_pool->slot_ptr = (INTVAL *)new_arena +
        ((char *)jit_info->constant_pool->slot_ptr - jit_info->arena.start);
    jit_info->arena.start = new_arena;
}

#endif /* JITIMCC */
#endif /* JIT_EMIT */
#endif /* PARROT_ALPHA_JIT_EMIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
