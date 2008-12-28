/*
Copyright (C) 2008, The Perl Foundation.
$Id$
*/

#include "parrot/parrot.h"
#include "jit_emit.h"

/* HEADERIZER HFILE: none */

/*
 * enumerate these mapped registers
 * please note that you have to preserve registers in
 * Parrot_jit_begin according to the ABI of the architecture
 */

const char intval_map[INT_REGISTERS_TO_MAP] =
    {

        /* Preserved, we'd have more, but keeping code_start, op_map, interp,
         * and the base pointer in registers takes away four, not to mention
         * RBP which is used for easier debugging.  That's five registers used
         * for one reason or another at the moment.  I'm not sure if it's worth
         * it yet. */
        /*
         *  RAX     ISR2
         *  RDX     for idiv, TODO: handle corner cases, i.e. steal i386 code
         *  RBX     for Interp->ctx.bp
         *  RBP     for debugging, can add it to the preserved list
         *  R12
         *  R13     for CODE_START
         *  R14     for OP_MAP
         *  R15     for INTERP
         */
        R12,
#ifndef USE_OP_MAP_AND_CODE_START
        R13, R14,
#endif
        /* Unpreserved */
        RCX, RSI, RDI, R8, R9, R10, RDX
    };

const char floatval_map[FLOAT_REGISTERS_TO_MAP] =
    {
      XMM2, XMM3, XMM4, XMM5, XMM6, XMM7,
      XMM8, XMM9, XMM10, XMM11, XMM12, XMM13, XMM14, XMM15
    };


/*
 * define arch specific details in jit_arch_info
 */

const jit_arch_info arch_info = {
    /* CPU <- Parrot reg move functions */
    jit_mov_r_mr,
    jit_mov_x_mx,
    /* Parrot <- CPU reg move functions */
    jit_mov_mr_r,
    jit_mov_mx_x,
    Parrot_jit_dofixup,
    (jit_arch_f)0,
    {
        /* JIT_CODE_FILE */
        {
            Parrot_jit_begin,   /* emit code prologue */
#ifdef USE_OP_MAP_AND_CODE_START
            7,
            1,
#else
            9,                 /* mapped int */
            3,                  /* preserved int */
#endif
            intval_map,         /* which ints mapped */
            14,                 /* mapped float  */
            0,                  /* preserved float */
            floatval_map        /* which floats mapped */
         },
        /* JIT_CODE_SUB */
        {
            Parrot_jit_begin_sub,
            9,
            8,
            intval_map,
            0,
            0,
            floatval_map
        },
        /* JIT_CODE_SUB_REGS_ONLY */
        {
            /*Parrot_jit_begin_sub_regs*/0,  /* emit code prologue */
            16,
            6,
            intval_map,
            0,
            0,
            floatval_map
        }
    }
};

const char div_by_zero[] = "Divide by zero";
const int mxcsr = 0x7fa0; /* Add 6000 to mxcsr */

/*
 * emit code that calls a Parrot opcode function
 */
void call_func(Parrot_jit_info_t *jit_info, void *addr) {
    if ((long)addr > (long)INT_MAX) {
        /* Move the address into our scratch register R11
         * We cannot use just the immediate form of call because the address
         * will be too large if we're using a shared parrot, but will be ok on
         * a static parrot.
         *
         * This will most likely only be used on shared libraries.
         */
        /* Absolute near call to R11 */
        emit_mov_r_i(jit_info->native_ptr, R11, addr);
        emit_call_r(jit_info->native_ptr, R11);
    }
    else {
        /* Call with an immediate value.  Mainly for a static parrot, and
         * debugging */
        Parrot_jit_newfixup(jit_info);
        jit_info->arena.fixups->type = JIT_AMD64CALL;
        jit_info->arena.fixups->param.fptr = D2FPTR(addr);
        emit_call_i(jit_info->native_ptr, 0xdead);
    }
}

/* Jump to RAX, which needs to be set before calling this */
void
Parrot_emit_jump_to_rax(Parrot_jit_info_t *jit_info, Interp *interp)
{
    if (!jit_info->objfile) {
#ifdef USE_OP_MAP_AND_CODE_START
        /* Get interp->code->base.data */
        jit_emit_load_code_start(jit_info->native_ptr);
        emit_sub_r_r(jit_info->native_ptr, RAX, CODE_START);

        /* Get interp->code->jit_info->arena->op_map */
        jit_emit_load_op_map(jit_info->native_ptr);
#else
        /* emit code that gets interp->code->base.data */
        emit_mov_r_mr(jit_info->native_ptr, RCX, INTERP, (long)offsetof(Interp, code));
        emit_mov_r_mr(jit_info->native_ptr, RDX, RCX, (long)offsetof(PackFile_Segment, data));
        emit_sub_r_r(jit_info->native_ptr, RAX, RDX);

        /* Reuse interp->code in RCX, get interp->code->jit_info->arena->op_map */
        emit_mov_r_mr(jit_info->native_ptr, RDX, RCX, (long)offsetof(PackFile_ByteCode, jit_info));
        emit_lea_r_mr(jit_info->native_ptr, RDX, RDX, (long)offsetof(Parrot_jit_info_t, arena));
        emit_mov_r_mr(jit_info->native_ptr, RDX, RDX, (long)offsetof(Parrot_jit_arena_t, op_map));
#endif
    }
    /* Base pointer */
    emit_mov_r_mr(jit_info->native_ptr, RBX, INTERP, (long)offsetof(Interp, ctx.bp));

#ifdef USE_OP_MAP_AND_CODE_START
    emit_jmp_r_r(jit_info->native_ptr, RAX, OP_MAP);
#else
    emit_jmp_r_r(jit_info->native_ptr, RAX, RDX);
#endif
}

void
Parrot_jit_normal_op(Parrot_jit_info_t *jit_info,
                     Interp *interp)
{
    int cur_op = *jit_info->cur_op;
    static int check;

    if (cur_op >= jit_op_count()) {
        cur_op = CORE_OPS_wrapper__;
    }

    /* check every eight ops, could be changed to 16, or 32, or ... */
    if ((++check & 0x7) == 0) {
        emit_mov_r_i(jit_info->native_ptr, RDI, jit_info->cur_op);
        emit_mov_r_r(jit_info->native_ptr, RSI, INTERP);
        call_func(jit_info, (void (*)(void))interp->op_func_table[CORE_OPS_check_events]);
    }

    emit_mov_r_i(jit_info->native_ptr, RDI, jit_info->cur_op);
    emit_mov_r_r(jit_info->native_ptr, RSI, INTERP);

    call_func(jit_info, (void (*)(void))interp->op_func_table[cur_op]);

}

/*
 * emit code for a branching parrot opcode. All cached registers
 * need recalculation, as a branch can go into different code segments
 * with different code start and different jit_info
 */
void
Parrot_jit_cpcf_op(Parrot_jit_info_t *jit_info,
                   Interp *interp)
{
    Parrot_jit_normal_op(jit_info, interp);
    Parrot_emit_jump_to_rax(jit_info, interp);
}

/*
 * emit code that might leave the JIT runcore
 * see  ppc or i386
 */
void
Parrot_jit_restart_op(Parrot_jit_info_t *jit_info,
                      Interp *interp)
{
    char *sav_ptr;

    Parrot_jit_normal_op(jit_info, interp);
    emit_test_r(jit_info->native_ptr, RAX);

    /* Quick fixup, but we know it's 12, anyway it needs to be a byte */
    emit_jcc(jit_info->native_ptr, jcc_jnz, 0x00);
    sav_ptr = (char *)(jit_info->native_ptr - 1);
    /* Parrot_end_jit(jit_info, interp); */
    jit_emit_end(jit_info->native_ptr);
    *sav_ptr = (char)(jit_info->native_ptr - sav_ptr - 1);

    Parrot_emit_jump_to_rax(jit_info, interp);
}

/*
 * emit stack frame according to ABI
 * preserve mapped registers according to ABI
 * load INTERP, OP_MAP, CODE_START, BP registers
 * then run the code at pc
 *
 * the function is called as
 *   runops(interp, pc)
 *
 * at runtime
 */
void
Parrot_jit_begin(Parrot_jit_info_t *jit_info,
                 Interp *interp)
{
    jit_emit_stack_frame_enter(jit_info->native_ptr);

    /* Saved registers */
    /* push rbp
     * push rbx
     * push r12
     * push r13
     * push r14
     * push r15 */
    emit_push_r(jit_info->native_ptr, RBP);
    emit_push_r(jit_info->native_ptr, RBX);
    emit_push_r(jit_info->native_ptr, R12);
    emit_push_r(jit_info->native_ptr, R13);
    emit_push_r(jit_info->native_ptr, R14);
    emit_push_r(jit_info->native_ptr, R15);
    /* When our "function" gets called, RDI will be the interp,
     * and RSI will be jit_info->native_ptr */
    /* Set R15 to interp */
    /* mov r15, rdi */
    /* emit_ldmxcsr(jit_info->native_ptr); */
    emit_mov_r_r(jit_info->native_ptr, R15, RDI);
    emit_mov_r_r(jit_info->native_ptr, RAX, RSI);

    Parrot_emit_jump_to_rax(jit_info, interp);

}


/*
 * fix up all emitted branches
 * see  ppc or i386
 */

void
Parrot_jit_dofixup(Parrot_jit_info_t *jit_info,
                   Interp *interp)
{
    Parrot_jit_fixup_t *fixup, *next;
    char *fixup_ptr;

    fixup = jit_info->arena.fixups;

    while (fixup) {
        switch (fixup->type) {
            case JIT_AMD64BRANCH:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 2;
                *(int *)(fixup_ptr) =
                    jit_info->arena.op_map[fixup->param.opcode].offset
                    - (fixup->native_offset + 6) + fixup->skip;
                break;
            case JIT_AMD64JUMP:
                fixup_ptr = Parrot_jit_fixup_target(jit_info, fixup) + 1;
                *(int *)(fixup_ptr) =
                    jit_info->arena.op_map[fixup->param.opcode].offset
                    - (fixup->native_offset + 5) + fixup->skip;
                break;
            case JIT_AMD64CALL:
                fixup_ptr = jit_info->arena.start + fixup->native_offset + 1;
                *(int *)(fixup_ptr) = (int)(long)fixup->param.fptr -
                    (int)(long)fixup_ptr - 4;
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                    "Unknown fixup type: %d\n", fixup->type);
        }
        next = fixup->next;
        free(fixup);
        fixup = next;
    }
    jit_info->arena.fixups = NULL;
}

void
Parrot_jit_begin_sub(Parrot_jit_info_t *jit_info,
                         Interp *interp)
{
    /* NOT CALLED CURRENTLY */
}

/*
 * define interface functions for register -> parrot register moves
 * and v.v.
 */

/* set mem to reg */
void
jit_mov_mx_x(Interp *interp, Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emit_mov_mx_x(jit_info->native_ptr, base_reg, offs, src_reg);
}

void
jit_mov_mr_r(Interp *interp, Parrot_jit_info_t *jit_info,
        int base_reg, INTVAL offs, int src_reg)
{
    emit_mov_mr_r(jit_info->native_ptr, base_reg, offs, src_reg);
}

/* set reg to mem */
void
jit_mov_x_mx(Interp *interp, Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    emit_mov_x_mx(jit_info->native_ptr, dst_reg, base_reg, offs);
}

void
jit_mov_r_mr(Interp *interp, Parrot_jit_info_t *jit_info,
        int dst_reg, int base_reg, INTVAL offs)
{
    emit_mov_r_mr(jit_info->native_ptr, dst_reg, base_reg, offs);
}


const jit_arch_info *
Parrot_jit_init(Interp *interp)
{
    return &arch_info;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
