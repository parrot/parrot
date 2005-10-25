/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/exec.c - Generate an object file

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include <parrot/parrot.h>
#if HAVE_COMPUTED_GOTO
#  include <parrot/oplib/core_ops_cgp.h>
#endif /* HAVE_COMPUTED_GOTO */
#include "parrot/exec.h"
#include "parrot/jit.h"
#define JIT_EMIT 1
#include "parrot/jit_emit.h"
#include "parrot/exec_dep.h"
#include "parrot/exec_save.h"

static void exec_init(Parrot_exec_objfile_t *obj);
static void add_data_member(Parrot_exec_objfile_t *obj, void *src, size_t len);
static int symbol_list_find(Parrot_exec_objfile_t *obj, const char *func_name);

/*
 * Parrot_exec_run must be 0 while the program runs.
 * It will be set to 2 inside eval (s. eval.pmc)
 * to switch to runops_jit (s. interpreter.c:runops_exec()).
 * Must be 1 while starting the compiled code to have make_interpreter
 * return the address of the global interpreter (s. interpreter.c)
 * and PackFile_ConstTable_unpack use the global const_table (s. packfile.c).
 * Must also be 1 while generating the executable.
 */

int Parrot_exec_run = 0;

/*

=item C<void
Parrot_exec(Interp *interpreter, opcode_t *pc,
        opcode_t *code_start, opcode_t *code_end)>

Call the jit to get the program code. Adds the members of the data
section. And emits the executable.

=cut

*/

void
Parrot_exec(Interp *interpreter, opcode_t *pc,
        opcode_t *code_start, opcode_t *code_end)
{
#ifdef JIT_CGP
    int i, j *k;
#endif
    const char *output;
    long bhs;
    Parrot_exec_objfile_t *obj;
    Parrot_jit_info_t *jit_info;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    obj = mem_sys_allocate_zeroed(sizeof(Parrot_exec_objfile_t));
    exec_init(obj);
    Parrot_exec_rel_addr = (char **)mem_sys_allocate_zeroed(4 * sizeof(char *));
    obj->bytecode_header_size =
        (interpreter->code->base.file_offset + 4) * sizeof(opcode_t);
    (void) build_asm(interpreter, pc, code_start, code_end, obj);
    jit_info = interpreter->code->jit_info;

    /* TODO Go zero the calls to jited opcodes. */
    /* Place the program code in the data section. */
    /* program_code */
    add_data_member(obj, interpreter->code->base.pf->src,
            interpreter->code->base.pf->size);
    /* opcode_map */
    add_data_member(obj, jit_info->arena.op_map, (jit_info->arena.map_size+1) *
        sizeof(opcode_t *));
    /* const_table */
    add_data_member(obj, NULL, interpreter->code->const_table->const_count *
        sizeof(struct PackFile_Constant));
#ifdef JIT_CGP
    /* prederef_code */
    j = (int)cgp_core;
    j = (int)((op_func_t*)interpreter->op_lib->op_func_table)[2] - j;
    k = (int *)interpreter->code->prederef.code;
    for (i = 0; i < (int)interpreter->code->base.size; i++) {
        if (k[i] != j)
            k[i] = 0;
    }
    add_data_member(obj, interpreter->code->prederef.code,
        interpreter->code->base.size * sizeof(void *));
#endif /* JIT_CGP */
    /* bytecode_offset */
    bhs = obj->bytecode_header_size / sizeof(opcode_t);
    add_data_member(obj, &bhs, 4);

    obj->text.code = jit_info->arena.start;
    obj->text.size = jit_info->arena.size;

    /* PAD */
    obj->text.size += (4 - obj->text.size % 4);
    obj->data.size += (4 - obj->data.size % 4);
    offset_fixup(obj);
    output = interpreter->output_file ?
        interpreter->output_file : "exec_output.o";
    Parrot_exec_save(obj, output);
}

/*

=item C<static void
add_data_member(Parrot_exec_objfile_t *obj, void *src, size_t len)>

Adds a member to the data section, storing the size of it at
C<< obj->data_size[N] >>.

=cut

*/

static void
add_data_member(Parrot_exec_objfile_t *obj, void *src, size_t len)
{
    char *cp;
    int *nds, i = 0;

    if (obj->data.size == 0) {
        obj->data.code = (char *)mem_sys_allocate(len);
        obj->data_size = (int *)mem_sys_allocate(sizeof(int));
    }
    else {
        cp = (char *)mem_sys_realloc(obj->data.code, obj->data.size + len);
        obj->data.code = cp;
        nds = (int *)mem_sys_realloc(obj->data_size, (obj->data_count + 2) *
            sizeof(int));
        obj->data_size = nds;
    }

    cp = obj->data.code + obj->data.size;
    if (src)
        memcpy(cp, src, len);
    else
        memset(cp, 0, len);
    obj->data_size[obj->data_count++] = len;
    obj->data.size += len;
}

/*

=item C<static void
exec_init(Parrot_exec_objfile_t *obj)>

Initialize the obj structure.

=cut

*/

static void
exec_init(Parrot_exec_objfile_t *obj)
{
    obj->text_rellocation_table = (Parrot_exec_rellocation_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_exec_rellocation_t));
    obj->data_rellocation_table = (Parrot_exec_rellocation_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_exec_rellocation_t));
    obj->symbol_table = (Parrot_exec_symbol_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_exec_symbol_t));
    /* size of table */
#ifdef PARROT_I386
    obj->symbol_list_size = 4;
#else
    obj->symbol_list_size = 0;
#endif
#ifdef EXEC_ELF
    obj->symbol_list_size = 0;
#endif
    Parrot_exec_add_symbol(obj, "program_code", STYPE_GDATA);
    Parrot_exec_add_symbol(obj, "opcode_map", STYPE_GDATA);
    Parrot_exec_add_symbol(obj, "const_table", STYPE_GDATA);
#ifdef JIT_CGP
    Parrot_exec_add_symbol(obj, "exec_prederef_code", STYPE_GDATA);
#endif /* JIT_CGP */
    Parrot_exec_add_symbol(obj, "bytecode_offset", STYPE_GDATA);
    Parrot_exec_add_symbol(obj, "run_compiled", STYPE_FUNC);
}

/*

=item C<int
Parrot_exec_add_symbol(Parrot_exec_objfile_t *obj, const char *symbol,
    int stype)>

Adds a symbol to the object file.

=cut

*/

int
Parrot_exec_add_symbol(Parrot_exec_objfile_t *obj, const char *symbol,
    int stype)
{
    int symbol_number;
    Parrot_exec_symbol_t *new_symbol;

    symbol_number = symbol_list_find(obj, symbol);
    if (symbol_number == -1) {
        symbol_number = obj->symbol_count;
        new_symbol = mem_sys_realloc(obj->symbol_table,
            (size_t)(obj->symbol_count + 1) * sizeof(Parrot_exec_symbol_t));
        obj->symbol_table = new_symbol;

        new_symbol = &obj->symbol_table[obj->symbol_count++];
        new_symbol->offset_list = obj->symbol_list_size;
        new_symbol->symbol = symbol;
        obj->symbol_list_size += strlen(symbol);
#if defined(EXEC_A_OUT) || defined(EXEC_COFF)
        /* for the trailing "_" */
        obj->symbol_list_size++;
#endif
        if (stype != STYPE_GCC)
            obj->symbol_list_size++;
        if (stype == STYPE_COM) {
            new_symbol->type = STYPE_COM;
            new_symbol->value = sizeof(Interp);
        }
        else {
            new_symbol->type = stype;
            new_symbol->value = 0;
        }
    }
    return symbol_number;
}

/*

=item C<int *
Parrot_exec_add_text_rellocation_reg(Parrot_exec_objfile_t *obj, char *nptr,
    const char *var, int offset, int disp)>

=cut

*/

int *
Parrot_exec_add_text_rellocation_reg(Parrot_exec_objfile_t *obj, char *nptr,
    const char *var, int offset, int disp)
{
    Parrot_exec_add_text_rellocation(obj, nptr, RTYPE_COM, var, disp);
    return (int *)offset;
}

/*

=item C<void
Parrot_exec_add_text_rellocation_func(Parrot_exec_objfile_t *obj, char *nptr,
    const char *func_name)>

=cut

*/

void
Parrot_exec_add_text_rellocation_func(Parrot_exec_objfile_t *obj, char *nptr,
    const char *func_name)
{
    Parrot_exec_add_text_rellocation(obj, nptr, RTYPE_FUNC, func_name, 1);
}

/*

=item C<void
Parrot_exec_add_text_rellocation(Parrot_exec_objfile_t *obj, char *nptr,
    int type, const char *symbol, int disp)>

Adds a text rellocation to the object file.

=cut

*/

void
Parrot_exec_add_text_rellocation(Parrot_exec_objfile_t *obj, char *nptr,
    int type, const char *symbol, int disp)
{
    int symbol_number = 0;
    char *addr;
    Parrot_exec_rellocation_t *new_relloc;
    extern char **Parrot_exec_rel_addr;
    extern int Parrot_exec_rel_count;

    new_relloc = mem_sys_realloc(obj->text_rellocation_table,
        (size_t)(obj->text_rellocation_count + 1)
            * sizeof(Parrot_exec_rellocation_t));
    obj->text_rellocation_table = new_relloc;
    new_relloc = &obj->text_rellocation_table[obj->text_rellocation_count++];

    switch (type) {
        case RTYPE_FUNC:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_UND);
            break;
        case RTYPE_COM:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_COM);
            break;
        case RTYPE_DATA:
        case RTYPE_DATA1:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_GDATA);
            break;
    }

    if (Parrot_exec_rel_count)
        addr = Parrot_exec_rel_addr[--Parrot_exec_rel_count];
    else
        addr = nptr + disp;
    new_relloc->offset = (int)(addr - obj->text.code);
    new_relloc->symbol_number = symbol_number;
    new_relloc->type = type;
}

/*

=item C<static int
symbol_list_find(Parrot_exec_objfile_t *obj, const char *symbol)>

Returns the index of C<symbol> in the symbol list. Returns -1 if it is
not in the list.

Used by C<Parrot_exec_add_symbol()>.

=cut

*/

static int
symbol_list_find(Parrot_exec_objfile_t *obj, const char *symbol)
{
    int i;

    for (i = 0; i < obj->symbol_count; i++)
        if (!strcmp(symbol, obj->symbol_table[i].symbol))
            return i;
    return -1;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/exec.h>, F<src/exec_cpu.c>, F<include/parrot/exec_save.h>
and F<src/exec_start.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2003.6.9.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
