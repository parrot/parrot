/* Copyright (C) 2003-2008, Parrot Foundation.  */

/*
 * exec_dep.c
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    PPC dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#include "parrot/parrot.h"
#include "jit.h"
#define JIT_EMIT 1
#include "jit_emit.h"
#include "exec_dep.h"

/* HEADERIZER HFILE: src/jit/ppc/exec_dep.h */

#ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
}

#else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
    add_disp(jit_info->native_ptr, r3,
        ((long)jit_info->cur_op - (long)interp->code->base.data));
    jit_emit_mov_rr(jit_info->native_ptr, r4, r13);

    Parrot_exec_add_text_rellocation(jit_info->objfile,
        jit_info->native_ptr, RTYPE_FUNC,
            interp->op_info_table[*jit_info->cur_op].func_name, 0);
    _emit_bx(jit_info->native_ptr, 1, 0);
}

#endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
    Parrot_exec_normal_op(jit_info, interp);
    jit_emit_sub_rrr(jit_info->native_ptr, r3, r3, r15);
    jit_emit_add_rrr(jit_info->native_ptr, r3, r14, r3);
    jit_emit_lwz(jit_info->native_ptr, r3, 0, r3);
    jit_emit_mtlr(jit_info->native_ptr, r3);
    jit_emit_blr(jit_info->native_ptr);
}

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info, PARROT_INTERP)
{
}

/* Assign the offset of the program_code */
void
offset_fixup(Parrot_exec_objfile_t *obj)
{
    int i, j;

    for (i = 0; i < obj->data_count; i++) {
#ifdef EXEC_MACH_O
        obj->symbol_table[i].value = obj->text.size;
#endif
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
