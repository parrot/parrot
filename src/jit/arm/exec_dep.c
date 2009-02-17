/* Copyright (C) 2003-2008, Parrot Foundation. */

/*
 * exec_dep.c
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    ARM dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.8.12
 * Notes:
 * References:
 */

#include "parrot/parrot.h"
#include "jit.h"
#define JIT_EMIT 1
#include "jit_emit.h"
#include "exec_dep.h"

/* HEADERIZER HFILE: src/jit/arm/exec_dep.h */

#ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
}

#else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
    jit_info->native_ptr = emit_mov(jit_info->native_ptr, r1, r4);
#  ifndef ARM_K_BUG
    jit_info->native_ptr = emit_mov(jit_info->native_ptr, REG14_lr, REG15_pc);
    jit_info->native_ptr = emit_ldmstm(jit_info->native_ptr,
                                        cond_AL, is_load, dir_IA,
                                        is_writeback,
                                        REG14_lr,
                                        reg2mask(0) | reg2mask(REG15_pc));
#  else
    jit_info->native_ptr = emit_arith_immediate(jit_info->native_ptr, cond_AL,
                                                 ADD, 0, REG14_lr, REG15_pc,
                                                 4, 0);
    jit_info->native_ptr = emit_ldmstm(jit_info->native_ptr,
                                        cond_AL, is_load, dir_IA,
                                        is_writeback,
                                        REG14_lr,
                                        reg2mask(0) | reg2mask(REG12_ip));
    jit_info->native_ptr = emit_mov(jit_info->native_ptr, REG15_pc, REG12_ip);
#  endif /* ARM_K_BUG */
    Parrot_exec_add_text_rellocation(jit_info->objfile,
        jit_info->native_ptr, RTYPE_DATA, "program_code", 0);
    jit_info->native_ptr
        = emit_word(jit_info->native_ptr, ((int)jit_info->cur_op) -
            ((int)interp->code->base.data) +
                (jit_info->objfile->bytecode_header_size));
    Parrot_exec_add_text_rellocation(jit_info->objfile,
        jit_info->native_ptr, RTYPE_FUNC,
            interp->op_info_table[*jit_info->cur_op].func_name, 0);
    jit_info->native_ptr
        = emit_word(jit_info->native_ptr, 0);
}

#endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
    Parrot_exec_normal_op(jit_info, interp);
    Parrot_jump_to_op_in_reg(jit_info, interp, r0);
}

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
}

/* Assign the offset of the progra_code */
void
offset_fixup(Parrot_exec_objfile_t *obj)
{
    int i, j;

    for (i = 0; i < obj->data_count; i++) {
        for (j = 0; j < i; j++)
            obj->symbol_table[i].value += obj->data_size[j];
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
