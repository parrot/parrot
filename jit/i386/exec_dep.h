/*
 * exec_dep.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    i386 dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#ifndef PARROT_I386_EXEC_DEP_H_GUARD
#  define PARROT_I386_EXEC_DEP_H_GUARD

#ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_ptr cur_section =
        jit_info->optimizer->cur_section;
    int i, j, last_is_branch = 0;
    void ** offset;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    assert(op_jit[*jit_info->cur_op].extcall == 1);
    if (cur_section->done == 1)
        return;
    else if (cur_section->done == -1 && --cur_section->ins_count > 0)
        return;
    /* check, where section ends
     */
    if (interpreter->op_info_table[*cur_section->end].jump)
        last_is_branch = 1;
    else if (cur_section->next && !cur_section->next->isjit)
        last_is_branch = 1;
    /* if more then 1 op, then jump to CGP, branches are never
     * executed in CGP, they are handled below */
    if (cur_section->done >= 0 &&
            (INTVAL)cur_section->op_count >= 2 + last_is_branch) {
        int saved = 0;
        offset = (void **)((int)jit_info->cur_op -
            (int)interpreter->code->byte_code);

        jit_emit_mov_ri_i(jit_info->native_ptr, emit_ESI, offset);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "exec_prederef_code", -4);
        emitm_callm(jit_info->native_ptr, emit_ESI, 0, 0, 0);
        /* now patch a B<cpu_ret> opcode after the end of the
         * prederefed (non JIT) section
         */
        if (last_is_branch) {
            offset = (cur_section->end - interpreter->code->byte_code) +
                interpreter->code->cur_cs->prederef_code;
            cur_section->done = -1;
            /* ins to skip */
            cur_section->ins_count = cur_section->op_count - 1;
        }
        else {
            /* There must be a next section: either we have a B<end>
             * or a JITed branch,
             * when the branch is non JIT, we are in the above case
             */
            offset = (cur_section->next->begin - interpreter->code->byte_code)
                + interpreter->code->cur_cs->prederef_code;
            cur_section->done = 1;
        }
        i = (int)(((op_func_t*)interpreter->op_lib->op_func_table)[2]);
        j = (int)cgp_core;
        *offset = (void *)(i - j);
    }
    else {

        /* else call normal funtion */
        emitm_pushl_i(jit_info->native_ptr, 0x0);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
        emitm_pushl_i(jit_info->native_ptr,
            jit_info->objfile->bytecode_header_size +
                jit_info->op_i * sizeof(opcode_t));
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_DATA, "program_code", -4);

        Parrot_exec_add_text_rellocation_func(jit_info->objfile,
            jit_info->native_ptr,
                interpreter->op_info_table[*jit_info->cur_op].func_name);
        emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
        emitm_addb_i_r(jit_info->native_ptr, 8, emit_ESP);
        /* when this was a branch, then EAX is now the offset
         * in the byte_code
         */

    }
}

#else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    emitm_pushl_i(jit_info->native_ptr,
        jit_info->objfile->bytecode_header_size +
            jit_info->op_i * sizeof(opcode_t));
    Parrot_exec_add_text_rellocation(jit_info->objfile, jit_info->native_ptr,
        RTYPE_DATA, "program_code", -4);

    Parrot_exec_add_text_rellocation_func(jit_info->objfile,
        jit_info->native_ptr,
            interpreter->op_info_table[*jit_info->cur_op].func_name);
    emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
    emitm_addb_i_r(jit_info->native_ptr, 4, emit_ESP);
}

#endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_exec_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

void
Parrot_exec_restart_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    char *jmp_ptr, *sav_ptr;

    Parrot_exec_normal_op(jit_info, interpreter);
    /* test eax, if zero (e.g after trace), return from JIT */
    jit_emit_test_r_i(jit_info->native_ptr, emit_EAX);
    /* remember PC */
    jmp_ptr = jit_info->native_ptr;
    /* emit jump past exit code, dummy offset
     * this assumes exit code is not longer then a short jump (126 bytes) */
    emitm_jxs(jit_info->native_ptr, emitm_jnz, 0);
    exec_emit_end(jit_info->native_ptr);
    /* fixup above jump */
    sav_ptr = jit_info->native_ptr;
    jit_info->native_ptr = jmp_ptr;
    emitm_jxs(jit_info->native_ptr, emitm_jnz, (long)(sav_ptr - jmp_ptr) - 2);
    /* restore PC */
    jit_info->native_ptr = sav_ptr;
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

void
Parrot_exec_emit_mov_rm(struct Parrot_Interp * interpreter, int reg, char *mem)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;
    if (reg == 1)
        (*nptr++) = 0xa1;
    else {
        (*nptr++) = 0x8b;
        (*nptr++) = ((reg - 1) << 3) + 5;
    }
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr,
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_mr(struct Parrot_Interp * interpreter, char *mem,int reg)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;
    if (reg == 1)
        (*nptr++) = 0xa3;
    else {
        (*nptr++) = 0x89;
        (*nptr++) = ((reg - 1) << 3) + 5;
    }
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr,
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_rm_n(struct Parrot_Interp * interpreter,int reg,char *mem)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;

    *(nptr++) = 0xdd;
    *(nptr++) = 0x05;
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr,
            RTYPE_COM, "interpre", -4);
    emitm_fstp((nptr), (reg+1));
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_mr_n(struct Parrot_Interp * interpreter,char *mem,int reg)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;

    emitm_fld((nptr), reg);
    *(nptr++) = 0xdd;
    *(nptr++) = 0x1d;
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr,
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

/* Assign the offset of the progra_code */
static void
offset_fixup(Parrot_exec_objfile_t *obj)
{
    int i,j;

    for (i = 0; i < obj->data_count; i++) {
#ifdef EXEC_A_OUT
        obj->symbol_table[i].value = obj->text.size;
#endif
        for (j = 0; j < i; j++)
            obj->symbol_table[i].value += obj->data_size[j];
    }
}

#endif /* PARROT_I386_EXEC_DEP_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
