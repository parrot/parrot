/*
 * exec_dep.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    PPC dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#ifndef EXEC_DEP_H_GUARD
#  define EXEC_DEP_H_GUARD

static void save_zero(FILE *fp);
static void save_int(FILE *fp, int i);
static void save_short(FILE *fp, short s);

#  ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
}

#  else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    add_disp(jit_info->native_ptr, r3,
        ((long)jit_info->cur_op - (long)interpreter->code->byte_code));
    jit_emit_mov_rr(jit_info->native_ptr, r4, r13);

    Parrot_exec_add_text_rellocation_func(jit_info->objfile,
        jit_info->native_ptr,
            interpreter->op_info_table[*jit_info->cur_op].func_name);
    _emit_bx(jit_info->native_ptr, 1, (jit_info->arena.start -
        jit_info->native_ptr - 4));
}

#  endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_exec_normal_op(jit_info, interpreter);
    jit_emit_sub_rrr(jit_info->native_ptr, r3, r3, r15);
    jit_emit_add_rrr(jit_info->native_ptr, r3, r14, r3);
    jit_emit_lwz(jit_info->native_ptr, r3, 0, r3);
    jit_emit_mtlr(jit_info->native_ptr, r3);
    jit_emit_blr(jit_info->native_ptr);
}

void
Parrot_exec_emit_mov_mr(struct Parrot_Interp * interpreter, char *mem, int reg)
{
    Parrot_jit_emit_mov_mr(interpreter, mem, reg);
}

void
Parrot_exec_emit_mov_rm(struct Parrot_Interp * interpreter, int reg, char *mem)
{
    Parrot_jit_emit_mov_rm(interpreter, reg, mem);
}

void
Parrot_exec_emit_mov_mr_n(struct Parrot_Interp * interpreter, char *mem,int reg)
{
    Parrot_jit_emit_mov_mr_n(interpreter, mem, reg);
}

void
Parrot_exec_emit_mov_rm_n(struct Parrot_Interp * interpreter, int reg,char *mem)
{
    Parrot_jit_emit_mov_rm_n(interpreter, reg, mem);
}

/* Assign the offset of the progra_code */
static void
offset_fixup(Parrot_exec_objfile_t *obj)
{
    int i,j;

    for (i = 0; i < obj->data_count; i++) {
        obj->symbol_table[i].value = obj->text.size;
        for (j = 0; j < i; j++) 
            obj->symbol_table[i].value += obj->data_size[j];
    }
}


void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    FILE *fp;
    int i;

    fp = fopen(file, "w");
    
    fprintf(fp, "\xFE\xED\xFA\xCE"); /* Header for Darwin */
    save_int(fp, 0x12);
    save_int(fp, 0);
    save_int(fp, 0x1);
    save_int(fp, 0x3);
    save_int(fp, 0x128);
    save_int(fp, 0);
    save_int(fp, 0x1);
    save_int(fp, 0xC0);
    for (i = 0; i < 5; i++)
        save_int(fp, 0);
    /* Sizeof text + data */
    save_int(fp, obj->text.size + obj->data.size);
    /* Offset of text */
    save_int(fp, 0x144);
    save_int(fp, obj->text.size + obj->data.size);
    save_int(fp, 0x7);
    save_int(fp, 0x7);
    save_int(fp, 0x2);
    save_int(fp, 0);
    fprintf(fp, "__text");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    fprintf(fp, "__TEXT");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    save_int(fp, 0);
    /* Sizeof text */
    save_int(fp, obj->text.size);
    save_int(fp, 0x144);
    save_int(fp, 0x2);
    /* Offset of rellocation table. */
    save_int(fp, 0x144 + obj->text.size + obj->data.size);
    save_int(fp, obj->text_rellocation_count);
    save_int(fp, 0x80000400);
    save_int(fp, 0);
    save_int(fp, 0);
    fprintf(fp, "__data");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    fprintf(fp, "__DATA");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    /* Data VMA */
    save_int(fp, obj->text.size);
    /* Data size */
    save_int(fp, obj->data.size);
    /* Data file offset */
    save_int(fp, 0x144 + obj->text.size);
    save_int(fp, 0x2);
    for (i = 0; i < 5; i++)
        save_int(fp, 0);
    save_int(fp, 0x2);
    /*    save_int(fp, obj->symbol_count * 0xc); */
    save_int(fp, 0x18);
    /* Offset of stabs */
    save_int(fp, 0x144 +
        obj->text.size + obj->data.size + obj->text_rellocation_count * 0x8);
    /* Number of stabs (symbol table) */
    save_int(fp, obj->symbol_count);
    /* Offset of symbol list */
    save_int(fp, 0x144 + obj->text.size + obj->data.size +
        obj->text_rellocation_count * 0x8 + obj->symbol_count * 0xc);
    /* Sizeof symbol list */
    save_int(fp, obj->symbol_list_size);
    save_int(fp, 0xB);
    save_int(fp, 0x50);
    for (i = 0; i < 3; i++)
        save_int(fp, 0);
    save_int(fp, obj->symbol_count);
    save_int(fp, obj->symbol_count);
    for (i = 0; i < 13; i++)
        save_int(fp, 0);
    /* Text */
    for (i = 0; i < obj->text.size; i++)
        fprintf(fp, "%c", obj->text.code[i]);
    /* Data */
    for (i = 0; i < obj->data.size; i++)
        fprintf(fp, "%c", obj->data.code[i]);
    /* Text rellocations */
    for (i = obj->text_rellocation_count - 1; i >= 0; i--) {
        save_int(fp, obj->text_rellocation_table[i].offset);
        save_short(fp, obj->text_rellocation_table[i].symbol_number);
        save_short(fp, obj->text_rellocation_table[i].type);
    }
    /* Symbol table */
    for (i = 0; i < obj->symbol_count; i++) {
        save_int(fp, obj->symbol_table[i].offset_list);
        save_int(fp, obj->symbol_table[i].type);
        save_int(fp, obj->symbol_table[i].value);
    }
    /* Symbol list */
    for (i = 0; i < obj->symbol_count; i++) {
        if (obj->symbol_table[i].type != STYPE_GCC)
            fprintf(fp, "_%s", obj->symbol_table[i].symbol);
        else
            fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    fclose(fp);
}

static void
save_zero(FILE *fp)
{
    fprintf(fp, "%c", 0);
}

static void
save_int(FILE *fp, int i)
{
    fprintf(fp, "%c%c%c%c", (char)(i >> 24), (char)(i >> 16),
                            (char)(i >> 8), (char)i);
}

static void
save_short(FILE *fp, short s)
{
    fprintf(fp, "%c%c", (char)(s >> 8), (char)s);
}

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
