/*
 * exec.c
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Generate an object file.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#include <parrot/parrot.h>
#if HAVE_CGOTO
#  include <parrot/oplib/core_ops_cgp.h>
#endif /* HAVE_CGOTO */
#include "parrot/exec.h"
#include "parrot/jit.h"
#define JIT_EMIT 1
#include "parrot/jit_emit.h"
#include "parrot/exec_dep.h"

static void exec_init(Parrot_exec_objfile_t *obj);
static void add_data_member(Parrot_exec_objfile_t *obj, void *src, size_t len);
static void call_opcode(Parrot_exec_objfile_t *obj,
                            struct Parrot_Interp *interpreter, opcode_t *pc);
static int symbol_list_find(Parrot_exec_objfile_t *obj, const char *func_name);
static void do_fixup(Parrot_exec_objfile_t *obj);
static Parrot_exec_fixup_t *new_fixup(int type, void *addr);

/*                          
 * Parrot_exec_run is not 0 if the contants are already allocated 
 * this to be able to add a rellocation in generated object files.
 * If 1 make_interpreter will return the address of interpre.
 */

int Parrot_exec_run = 0;


/* Parrot_exec
 *
 *  Call the jit to get the program code.
 *  Adds the members of the data section.
 *  And emits the executable.
 */

void
Parrot_exec(struct Parrot_Interp *interpreter, opcode_t *pc,
        opcode_t *code_start, opcode_t *code_end)
{
    int i, j, *k;
    char *cp, *nptr;
    long bhs;
    Parrot_exec_objfile_t *obj;
    Parrot_jit_info_t *jit_info;

    obj = mem_sys_allocate_zeroed(sizeof(Parrot_exec_objfile_t));
    exec_init(obj);
    obj->bytecode_header_size = (int)interpreter->code->byte_code -
        (int)interpreter->code->src;
    (void) build_asm(interpreter, pc, code_start, code_end, obj);
    jit_info = interpreter->jit_info;

    /* TODO Go zero the calls to jited opcodes. */
    /* Place the program code in the data section. */
    /* program_code */
    add_data_member(obj, interpreter->code->src, interpreter->code->size);
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
    k = (int *)interpreter->prederef_code;
    for (i = 0; i < (int)interpreter->code->cur_cs->base.size; i++) { 
        if (k[i] != j)
            k[i] = 0;
    }
    add_data_member(obj, interpreter->prederef_code,
        interpreter->code->cur_cs->base.size * sizeof(void *));
#endif /* JIT_CGP */
    /* bytecode_offset */
    bhs = obj->bytecode_header_size / sizeof(opcode_t);
    add_data_member(obj, &bhs, 4);

    //obj->text.code = (char *)mem_sys_allocate_zeroed(jit_info->arena.size);

    obj->text.code = jit_info->arena.start;
    obj->text.size = jit_info->arena.size;

    /* PAD */
    obj->text.size += (4 - obj->text.size % 4);
    obj->data.size += (4 - obj->data.size % 4);
    do_fixup(obj);
    offset_fixup(obj);
    Parrot_exec_save(obj, "exec_output.o");
}

/*  add_data_member
 *
 *      Adds a member to the data section, storing the size of it at
 *      obj->data_size[N].
 */

static void
add_data_member(Parrot_exec_objfile_t *obj, void *src, size_t len)
{
    char *cp;
    int *nds, i = 0;

    if (obj->data.size == 0) {
        obj->data.code = (char *)mem_sys_allocate_zeroed(len); 
        obj->data_size = (int *)mem_sys_allocate_zeroed(sizeof(int));
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
    obj->data_size[obj->data_count++] = len;
    obj->data.size += len;
}

static void
do_fixup(Parrot_exec_objfile_t *obj)
{
    int i;
    Parrot_exec_fixup_t *fixup;

    for (i = 0; i < obj->text_rellocation_count; i++)
        if (obj->text_rellocation_table[i].fixup) {
            fixup = obj->text_rellocation_table[i].fixup;
            switch (fixup->type) {
                case FIXUP_BYTECODE:
                    *((int *)(fixup->addr)) += obj->bytecode_header_size;
                    break;
                case FIXUP_OPMAP:
                    *((int *)(fixup->addr)) += obj->bytecode_header_size +
                        obj->text.size + obj->data_size[0]; 
                    break;
            }
        }
}

/*  exec_init
 *
 *      Initialize the obj structure.
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
#ifdef I386
    obj->symbol_list_size = 4;
#else
    obj->symbol_list_size = 0;
#endif
#ifdef EXEC_ELF
    obj->symbol_list_size += 2;
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

/*  Parrot_exec_add_symbol
 *
 *      Adds a symbol to the object file.
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
#ifdef EXEC_A_OUT
        /* for the trailing "_" */
        obj->symbol_list_size++;
#endif
        if (stype != STYPE_GCC)
            obj->symbol_list_size++;
        if (stype == STYPE_COM) {
            new_symbol->type = STYPE_COM;
            new_symbol->offset_text = sizeof(struct Parrot_Interp);
        }
        else {
            new_symbol->type = stype;
            /* XXX RENAME offset_text is wrong. */
            new_symbol->offset_text = 0;
        }
    }
    return symbol_number; 
}

int *
Parrot_exec_add_text_rellocation_reg(Parrot_exec_objfile_t *obj, char *nptr,
    const char *var, int offset, int disp)
{
    Parrot_exec_add_text_rellocation(obj, nptr, RTYPE_COM, var, disp);
    return (int *)offset;
}

void
Parrot_exec_add_text_rellocation_func(Parrot_exec_objfile_t *obj, char *nptr,
    const char *func_name)
{
    Parrot_exec_add_text_rellocation(obj, nptr, RTYPE_FUNC, func_name, 1);
}

/*  Parrot_exec_add_text_rellocation
 *
 *      Adds a text rellocation to the object file.
 */

void
Parrot_exec_add_text_rellocation(Parrot_exec_objfile_t *obj, char *nptr,
    int type, const char *symbol, int disp)
{
    int symbol_number;
    Parrot_exec_rellocation_t *new_relloc;

    new_relloc = mem_sys_realloc(obj->text_rellocation_table,
        (size_t)(obj->text_rellocation_count + 1)
            * sizeof(Parrot_exec_rellocation_t));
    obj->text_rellocation_table = new_relloc;
    new_relloc = &obj->text_rellocation_table[obj->text_rellocation_count++];

    new_relloc->fixup = NULL;

    switch (type) {
        case RTYPE_FUNC:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_UND);
            break;
        case RTYPE_COM:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_COM);
            break;
        case RTYPE_DATA:
            symbol_number = Parrot_exec_add_symbol(obj, symbol, STYPE_GDATA);
            //symbol_number = 6;
            new_relloc->fixup = new_fixup(FIXUP_BYTECODE,(void *)(nptr + disp));
            break;
    }
            
    new_relloc->offset = (int)(nptr - obj->text.code + disp);
    new_relloc->symbol_number = symbol_number;
    new_relloc->type = type;
}

static Parrot_exec_fixup_t *
new_fixup(int type, void *addr)
{
    Parrot_exec_fixup_t *fixup;

    fixup = (Parrot_exec_fixup_t *)
        mem_sys_allocate_zeroed(sizeof(Parrot_exec_fixup_t));
    
    fixup->type = type;
    fixup->addr = addr;
    
    return fixup;
}

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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
