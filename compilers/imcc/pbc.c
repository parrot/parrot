/*
 * Copyright (C) 2002-2010, Parrot Foundation.
 */

#include "imc.h"
#include "pbc.h"
#include "parrot/packfile.h"
#include "parrot/pmc_freeze.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"
#include "parrot/oplib/core_ops.h"
#include "pmc/pmc_key.h"

/* HEADERIZER HFILE: compilers/imcc/pbc.h */

/*

=head1 NAME

compilers/imcc/pbc.c

=head1 DESCRIPTION

emit imcc instructions into Parrot interpreter

the e_pbc_emit function is called per instruction

Notes:

I'm using existing data structures here (SymReg *) to store
various global items (currently only PMC constants).
The index in the constant table is in SymReg * ->color
data member. This looks odd, but the register number
from imc.c:allocate is also there for variables,
so it's a little bit consistent at least.

So when reading color here it's either a constant table index
or a Parrot register number, depending on data type.

TODO memory clean up

-lt

=head2 Functions

=over 4

=cut

*/

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_1_const(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(SymReg *r),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*r)
        FUNC_MODIFIES(* bc);

PARROT_WARN_UNUSED_RESULT
static int add_const_num(
    ARGMOD(imc_info_t * imcc),
    ARGIN_NULLOK(const char *buf),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(* bc);

PARROT_IGNORABLE_RESULT
static int /*@alt void@*/
add_const_pmc_sub(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(SymReg *r),
    size_t offs,
    size_t end)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*r);

PARROT_IGNORABLE_RESULT
static int /*@alt void@*/
add_const_str(
    ARGMOD(imc_info_t * imcc),
    ARGIN(STRING *s),
    ARGIN(PackFile_ByteCode * const bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

static int add_const_table_pmc(ARGMOD(imc_info_t * imcc), ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

static opcode_t build_key(
    ARGMOD(imc_info_t * imcc),
    ARGIN(SymReg *key_reg),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(* bc);

static void constant_folding(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const IMC_Unit *unit),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(* bc);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* create_lexinfo(
    ARGMOD(imc_info_t * imcc),
    ARGMOD(IMC_Unit *unit),
    ARGIN(PMC *sub_pmc),
    int need_lex,
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(* bc);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t * find_global_label(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const char *name),
    ARGIN(const subs_t *sym),
    ARGOUT(int *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*pc);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* find_outer(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t * find_sub_by_subid(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const char *lookup),
    ARGIN(const subs_t *sym),
    ARGOUT(int *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*pc);

static void fixup_globals(ARGMOD(imc_info_t * imcc))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

PARROT_WARN_UNUSED_RESULT
static size_t get_code_size(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const IMC_Unit *unit),
    ARGOUT(size_t *src_lines))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*src_lines);

PARROT_WARN_UNUSED_RESULT
static int get_old_size(
    ARGMOD(imc_info_t * imcc),
    ARGIN(PackFile_ByteCode * bc),
    ARGOUT(int *ins_line))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*ins_line);

static void imcc_globals_destroy(PARROT_INTERP, int ex, ARGMOD(void *param))
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*param);

static void init_fixedintegerarray_from_string(
    ARGMOD(imc_info_t * imcc),
    ARGIN(PMC *p),
    ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc);

static void make_new_sub(ARGMOD(imc_info_t * imcc), ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

static void make_pmc_const(ARGMOD(imc_info_t * imcc), ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(*r);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC* mk_multi_sig(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const SymReg *r),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(* bc);

static void store_fixup(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const SymReg *r),
    int pc,
    int offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

static void store_key_const(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const char *str),
    int idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* imcc);

static void store_sub_size(
    ARGMOD(imc_info_t * imcc),
    size_t size,
    size_t ins_line)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* imcc);

static void verify_signature(
    ARGMOD(imc_info_t * imcc),
    ARGIN(const Instruction *ins),
    ARGIN(opcode_t *pc),
    ARGMOD(PackFile_ByteCode * bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(* imcc)
        FUNC_MODIFIES(* bc);

#define ASSERT_ARGS_add_1_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_add_const_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_add_const_pmc_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_add_const_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_add_const_table_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_build_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(key_reg) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_constant_folding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_create_lexinfo __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(sub_pmc) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_find_global_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(sym) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_find_outer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_find_sub_by_subid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(lookup) \
    , PARROT_ASSERT_ARG(sym) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_fixup_globals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_get_code_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(src_lines))
#define ASSERT_ARGS_get_old_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(bc) \
    , PARROT_ASSERT_ARG(ins_line))
#define ASSERT_ARGS_imcc_globals_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(param))
#define ASSERT_ARGS_init_fixedintegerarray_from_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(p) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_make_new_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_make_pmc_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_mk_multi_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_store_fixup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_store_key_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_store_sub_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc))
#define ASSERT_ARGS_verify_signature __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(pc) \
    , PARROT_ASSERT_ARG(bc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static void imcc_globals_destroy(PARROT_INTERP, int ex, void *param)>

Frees memory allocated for IMCC globals for one particular compilation unit.

=cut

*/

static void
imcc_globals_destroy(SHIM_INTERP, SHIM(int ex), ARGMOD(void *param))
{
    ASSERT_ARGS(imcc_globals_destroy)
    imc_info_t * const imcc = (imc_info_t*)param;

    /* This is an allowed condition? See TT #629 */
    if (imcc->globals) {
        code_segment_t *cs = imcc->globals->cs;

        while (cs) {
            subs_t         *s              = cs->subs;
            code_segment_t * const prev_cs = cs->prev;

            while (s) {
                subs_t * const prev_s = s->prev;
                clear_sym_hash(&s->fixup);
                mem_sys_free(s);
                s = prev_s;
            }

            clear_sym_hash(&cs->key_consts);
            mem_sys_free(cs);
            cs = prev_cs;
        }
        imcc->globals->cs = NULL;
    }

}


/*

=item C<static int add_const_table_pmc(imc_info_t * imcc, PMC *pmc)>

Adds a PMC to the const table, returning its position.

=cut

*/

static int
add_const_table_pmc(ARGMOD(imc_info_t * imcc), ARGIN(PMC *pmc))
{
    ASSERT_ARGS(add_const_table_pmc)
    PackFile_ByteCode * const bc = Parrot_pf_get_current_code_segment(imcc->interp);
    PackFile_ConstTable * const ct = bc->const_table;

    if (!ct->pmc.constants)
        ct->pmc.constants =
            mem_gc_allocate_n_zeroed_typed(imcc->interp, 1, PMC *);
    else
        ct->pmc.constants =
            mem_gc_realloc_n_typed_zeroed(imcc->interp, ct->pmc.constants,
                ct->pmc.const_count + 1, ct->pmc.const_count, PMC *);


    ct->pmc.constants[ct->pmc.const_count++] = pmc;

    return ct->pmc.const_count - 1;
}


/*

=item C<int e_pbc_open(imc_info_t * imcc)>

Opens a compilation unit to emit PBC.

TODO: Try to pull as much of the Parrot-related logic out of here and into
the front-ends (or higher).

=cut

*/

int
e_pbc_open(ARGMOD(imc_info_t * imcc))
{
    ASSERT_ARGS(e_pbc_open)
    PackFile_ByteCode * const current_bc = Parrot_pf_get_current_code_segment(imcc->interp);
    code_segment_t * const cs = mem_gc_allocate_zeroed_typed(imcc->interp, code_segment_t);

    if (!imcc->globals)
        imcc->globals = mem_gc_allocate_zeroed_typed(imcc->interp, imcc_globals);

    if (imcc->globals->cs)
        clear_sym_hash(&imcc->globals->cs->key_consts);
    else {
        /* register cleanup code */
        Parrot_x_on_exit(imcc->interp, imcc_globals_destroy, imcc);
    }

    /* free previous cached key constants if any */
    create_symhash(imcc, &cs->key_consts);

    cs->next     = NULL;
    cs->prev     = imcc->globals->cs;
    cs->subs     = NULL;
    cs->first    = NULL;
    cs->jit_info = NULL;

    if (!imcc->globals->first)
        imcc->globals->first = cs;
    else
        cs->prev->next = cs;

    /* we need some segments */
    if (!current_bc) {
        STRING * const name = imcc->state->file;

        cs->seg = PF_create_default_segs(imcc->interp, name, 1, 1);
    }

    imcc->globals->cs = cs;

    return 0;
}

/*

=item C<static void make_new_sub(imc_info_t * imcc, IMC_Unit *unit)>

Allocates a new globals->cs->subs structure.

=cut

*/

static void
make_new_sub(ARGMOD(imc_info_t * imcc), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(make_new_sub)
    subs_t * const s = mem_gc_allocate_zeroed_typed(imcc->interp, subs_t);

    s->prev          = imcc->globals->cs->subs;
    s->unit          = unit;
    s->pmc_const     = -1;

    if (imcc->globals->cs->subs)
        imcc->globals->cs->subs->next = s;

    if (!imcc->globals->cs->first)
        imcc->globals->cs->first = s;

    imcc->globals->cs->subs = s;

    create_symhash(imcc, &s->fixup);
}


/*

=item C<static int get_old_size(imc_info_t * imcc, PackFile_ByteCode * bc, int
*ins_line)>

Get the size/line of bytecode in ops to this point.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
get_old_size(ARGMOD(imc_info_t * imcc), ARGIN(PackFile_ByteCode * bc),
        ARGOUT(int *ins_line))
{
    ASSERT_ARGS(get_old_size)
    size_t size = 0;

    *ins_line   = 0;

    if (imcc->globals->cs && bc->base.data) {
        const subs_t *s;
        for (s = imcc->globals->cs->subs; s; s = s->prev) {
            size      += s->size;
            *ins_line += s->ins_line;
        }
    }

    return size;
}


/*

=item C<static void store_sub_size(imc_info_t * imcc, size_t size, size_t
ins_line)>

Sets the given size and line parameters for the current compilation unit.

=cut

*/

static void
store_sub_size(ARGMOD(imc_info_t * imcc), size_t size, size_t ins_line)
{
    ASSERT_ARGS(store_sub_size)
    imcc->globals->cs->subs->size     = size;
    imcc->globals->cs->subs->ins_line = ins_line;
}


/*

=item C<static void store_fixup(imc_info_t * imcc, const SymReg *r, int pc, int
offset)>

Stores fixup information for the given register, program counter, and offset.

=cut

*/

static void
store_fixup(ARGMOD(imc_info_t * imcc), ARGIN(const SymReg *r), int pc, int offset)
{
    ASSERT_ARGS(store_fixup)
    SymReg * const fixup = _mk_address(imcc,
            &imcc->globals->cs->subs->fixup, r->name, U_add_all);

    if (r->set == 'p')
        fixup->set = 'p';

    if (r->type & VT_ENCODED)
        fixup->type |= VT_ENCODED;

    if (r->usage & U_SUBID_LOOKUP)
        fixup->usage = U_SUBID_LOOKUP;

    if (r->usage & U_LEXICAL)
        fixup->usage |= U_LEXICAL;

    /* set_p_pc   = 2  */
    fixup->color  = pc;
    fixup->offset = offset;
}


/*

=item C<static void store_key_const(imc_info_t * imcc, const char *str, int
idx)>

Stores a constant key for the current compilation unit.

=cut

*/

static void
store_key_const(ARGMOD(imc_info_t * imcc), ARGIN(const char *str), int idx)
{
    ASSERT_ARGS(store_key_const)
    SymReg * const c =
        _mk_const(imcc, &imcc->globals->cs->key_consts, str, 0);
    c->color = idx;
}

/*

=item C<static size_t get_code_size(imc_info_t * imcc, const IMC_Unit *unit,
size_t *src_lines)>

Stores globals for later fixup, returning the code size in number of ops.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_code_size(ARGMOD(imc_info_t * imcc), ARGIN(const IMC_Unit *unit),
        ARGOUT(size_t *src_lines))
{
    ASSERT_ARGS(get_code_size)
    Instruction *ins = unit->instructions;
    size_t       code_size;
    op_lib_t    *core_ops = PARROT_GET_CORE_OPLIB(imcc->interp);

    /* run through instructions:
     * - sanity check
     * - calc code size
     * - calc nr of src lines for debug info
     * - remember addr of labels
     * - remember set_p_pc for global fixup
     */

    *src_lines = 0;

    for (code_size = 0; ins ; ins = ins->next) {
        if (ins->type & ITLABEL)
            ins->symregs[0]->color = code_size;

        if (ins->opname && STREQ(ins->opname, ".annotate")) {
            /* Annotations contribute nothing to code size, since they do not
             * end up in bytecode segment. */
            (*src_lines)++;
        }
        else if (ins->opname && *ins->opname) {
            (*src_lines)++;
            if (!ins->op)
                IMCC_fatal(imcc, 1, "get_code_size: "
                        "no opnum ins#%d %d\n",
                        ins->index, ins);

            if (ins->op == &core_ops->op_info_table[PARROT_OP_set_p_pc]) {
                /* set_p_pc opcode */
                IMCC_debug(imcc, DEBUG_PBC_FIXUP, "PMC constant %s\n",
                        ins->symregs[1]->name);

                if (ins->symregs[1]->usage & U_FIXUP)
                    store_fixup(imcc, ins->symregs[1], code_size, 2);
            }

            code_size += ins->opsize;
        }
        else if (ins->opsize)
            IMCC_fatal(imcc, 1, "get_code_size: non instruction with size found\n");
    }

    return code_size;
}

/*

=item C<void imcc_pbc_add_libdep(imc_info_t * imcc, STRING *libname)>

add libdeps to byte code

=cut

*/

void
imcc_pbc_add_libdep(ARGMOD(imc_info_t * imcc), ARGIN(STRING *libname))
{
    ASSERT_ARGS(imcc_pbc_add_libdep)
    PackFile_ByteCode * const bc = Parrot_pf_get_current_code_segment(imcc->interp);
    size_t i;

    /* bail out early if compiling to text format */
    if (!bc)
        return;

    /* check if already present (avoids duplicates) */
    for (i = 0; i < bc->n_libdeps; i++) {
        if (STRING_equal(imcc->interp, libname, bc->libdeps[i]))
            return;
    }

    bc->n_libdeps++;
    bc->libdeps = mem_gc_realloc_n_typed_zeroed(imcc->interp, bc->libdeps,
                            bc->n_libdeps, bc->n_libdeps - 1,
                            STRING *);
    bc->libdeps[bc->n_libdeps - 1] = libname;
}


/*

=item C<opcode_t bytecode_map_op(PARROT_INTERP, opcode_t op)>

Lookup the mapping of an op for the current bytecode segment or make one if
none exists.

=cut

*/

static
opcode_t
bytecode_map_op(ARGMOD(imc_info_t * imcc), op_info_t *info) {
    op_lib_t          *lib    = info->lib;
    op_func_t         op_func = OP_INFO_OPFUNC(info);
    PackFile_ByteCode * const bc = Parrot_pf_get_current_code_segment(imcc->interp);
    PackFile_ByteCode_OpMappingEntry *om;
    opcode_t i;

    for (i = 0; i < bc->op_mapping.n_libs; i++) {
        if (lib == bc->op_mapping.libs[i].lib) {
            om = &bc->op_mapping.libs[i];
            goto found_lib;
        }
    }

    /* library not yet mapped */
    bc->op_mapping.n_libs++;
    bc->op_mapping.libs = mem_gc_realloc_n_typed_zeroed(imcc->interp,
                            bc->op_mapping.libs,
                            bc->op_mapping.n_libs, bc->op_mapping.n_libs - 1,
                            PackFile_ByteCode_OpMappingEntry);

    /* initialize a new lib entry */
    om            = &bc->op_mapping.libs[bc->op_mapping.n_libs - 1];
    om->lib       = lib;
    om->n_ops     = 0;
    om->lib_ops   = mem_gc_allocate_n_zeroed_typed(imcc->interp, 0, opcode_t);
    om->table_ops = mem_gc_allocate_n_zeroed_typed(imcc->interp, 0, opcode_t);

  found_lib:
    for (i = 0; i < om->n_ops; i++) {
        if (bc->op_func_table[om->table_ops[i]] == op_func)
            return om->table_ops[i];
    }

    /* op not yet mapped */
    bc->op_count++;
    bc->op_func_table = mem_gc_realloc_n_typed_zeroed(imcc->interp,
                bc->op_func_table, bc->op_count, bc->op_count - 1, op_func_t);
    bc->op_func_table[bc->op_count - 1] = op_func;
    bc->op_info_table = mem_gc_realloc_n_typed_zeroed(imcc->interp,
                bc->op_info_table, bc->op_count, bc->op_count - 1, op_info_t *);
    bc->op_info_table[bc->op_count - 1] = info;

    /* initialize new op mapping */
    om->n_ops++;

    om->lib_ops = mem_gc_realloc_n_typed_zeroed(imcc->interp, om->lib_ops,
            om->n_ops, om->n_ops - 1, opcode_t);
    for (i = 0; i < lib->op_count; i++) {
        if (lib->op_func_table[i] == op_func) {
            om->lib_ops[om->n_ops - 1] = i;
            break;
        }
    }
    PARROT_ASSERT(om->lib_ops[om->n_ops - 1] || !i);

    om->table_ops = mem_gc_realloc_n_typed_zeroed(imcc->interp, om->table_ops,
            om->n_ops, om->n_ops - 1, opcode_t);
    om->table_ops[om->n_ops - 1] = bc->op_count - 1;

    return bc->op_count - 1;
}


/*

=item C<static subs_t * find_global_label(imc_info_t * imcc, const char *name,
const subs_t *sym, int *pc)>

Finds a global label, returning the symreg (and setting the (absolute) pc
through the out parameter).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t *
find_global_label(ARGMOD(imc_info_t * imcc), ARGIN(const char *name),
    ARGIN(const subs_t *sym), ARGOUT(int *pc))
{
    ASSERT_ARGS(find_global_label)
    subs_t *s;

    *pc = 0;

    for (s = imcc->globals->cs->first; s; s = s->next) {
        const SymReg * const r = s->unit->instructions->symregs[0];

        /* if names and namespaces are matching - ok */
        if (r && r->name && (strcmp(r->name, name) == 0)
                && ((sym->unit->_namespace && s->unit->_namespace
                        && (strcmp(sym->unit->_namespace->name, s->unit->_namespace->name) == 0))
                    || (!sym->unit->_namespace && !s->unit->_namespace)))
            return s;

        *pc += s->size;
    }
    return NULL;
}

/*

=item C<static subs_t * find_sub_by_subid(imc_info_t * imcc, const char *lookup,
const subs_t *sym, int *pc)>

Find the first sub in the current code segment with a given subid.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t *
find_sub_by_subid(ARGMOD(imc_info_t * imcc), ARGIN(const char *lookup),
    ARGIN(const subs_t *sym), ARGOUT(int *pc))
{
    ASSERT_ARGS(find_sub_by_subid)
    subs_t *s;
    UNUSED(sym);

    *pc = 0;

    for (s = imcc->globals->cs->first; s; s = s->next) {
        const SymReg * const r = s->unit->instructions->symregs[0];

        /* if subid matches - ok */
        if (r && (r->subid && (strcmp(r->subid->name, lookup) == 0)))
            return s;

        *pc += s->size;
    }
    return NULL;
}

/*

=item C<static void fixup_globals(imc_info_t * imcc)>

Fixes global information -- particularly locations of global symbols.

=cut

*/

static void
fixup_globals(ARGMOD(imc_info_t * imcc))
{
    ASSERT_ARGS(fixup_globals)
    subs_t *s;
    int     jumppc = 0;
    op_lib_t *core_ops = PARROT_GET_CORE_OPLIB(imcc->interp);
    PackFile_ByteCode * const bc = Parrot_pf_get_current_code_segment(imcc->interp);

    for (s = imcc->globals->cs->first; s; s = s->next) {
        const SymHash * const hsh = &s->fixup;
        unsigned int          i;

        for (i = 0; i < hsh->size; i++) {
            SymReg *fixup;

            for (fixup = hsh->data[i]; fixup; fixup = fixup->next) {
                int pc, pmc_const;
                const int addr = jumppc + fixup->color;
                int subid_lookup = 0;
                subs_t *s1;

                /* check in matching namespace */
                if (fixup->usage & U_LEXICAL)
                    s1 = NULL;
                else if (fixup->usage & U_SUBID_LOOKUP) {
                    subid_lookup = 1;
                    /* s1 = find_sub_by_subid(interp, fixup->name, &pc); */
                    s1 = find_sub_by_subid(imcc, fixup->name, s, &pc);
                }
                else
                    s1 = find_global_label(imcc, fixup->name, s, &pc);

                /*
                 * if failed change opcode:
                 *   set_p_pc  => find_name p_sc
                 * if a sub label is found
                 *   convert to find_name, if the sub is a multi
                 */
                if (s1) {
                    PARROT_ASSERT(s1->unit);
                    if (s1->unit->type & IMC_PCCSUB) {
                        const Instruction * const ins = s1->unit->instructions;
                        SymReg                  *r1;
                        pcc_sub_t               *pcc_sub;

                        PARROT_ASSERT(ins);

                        r1      = ins->symregs[0];
                        PARROT_ASSERT(r1);

                        pcc_sub = r1->pcc_sub;
                        PARROT_ASSERT(pcc_sub);

                        /* if the sub is multi, don't insert constant */
                        if (pcc_sub->nmulti && !subid_lookup)
                            s1 = NULL;
                    }
                }
                if (!s1) {
                    SymReg * const nam = mk_const(imcc, fixup->name,
                            fixup->type & VT_ENCODED ? 'U' : 'S');

                    /* TODO: Don't hard-code this op name in here. Ask libparrot
                             for a suitable op to use to find a sub. */
                    op_info_t *op = &core_ops->op_info_table[PARROT_OP_find_sub_not_null_p_sc];
                    PARROT_ASSERT(op);

                    bc->base.data[addr] = bytecode_map_op(imcc, op);

                    if (nam->color < 0)
                        nam->color = add_const_str(imcc,
                            IMCC_string_from_reg(imcc, nam), bc);

                    bc->base.data[addr+2] = nam->color;

                    IMCC_debug(imcc, DEBUG_PBC_FIXUP,
                            "fixup const PMC"
                            " find_name sub '%s' const nr: %d\n",
                            fixup->name, nam->color);
                    continue;
                }

                pmc_const = s1->pmc_const;

                if (pmc_const < 0) {
                    IMCC_fatal(imcc, 1, "fixup_globals: "
                            "couldn't find sub 2 '%s'\n", fixup->name);
                }

                bc->base.data[addr+fixup->offset] = pmc_const;
                IMCC_debug(imcc, DEBUG_PBC_FIXUP, "fixup const PMC"
                        " sub '%s' const nr: %d\n", fixup->name, pmc_const);

                continue;
            }
        }

        jumppc += s->size;
    }
}


/*

=item C<STRING * IMCC_string_from_reg(imc_info_t * imcc, const SymReg *r)>

Creates and returns a constant STRING, given a stringish SymReg.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
IMCC_string_from_reg(ARGMOD(imc_info_t * imcc), ARGIN(const SymReg *r))
{
    ASSERT_ARGS(IMCC_string_from_reg)
    char *buf = r->name;

    if (r->type & VT_ENCODED) {
        /*
         * the lexer parses:   foo:"string"
         * get first part as encoding, rest as string
         */
        #define MAX_NAME 31
        char encoding_name[MAX_NAME + 1];
        char * p = strchr(buf, '"');
        size_t len;

        PARROT_ASSERT(p && p[-1] == ':');

        len = p - buf - 1;
        if (len > MAX_NAME)
            len = MAX_NAME;
        memcpy(encoding_name, buf, len);
        encoding_name[len] = '\0';

        return Parrot_str_unescape(imcc->interp, p + 1, '"', encoding_name);
    }
    else if (*buf == '"') {
        buf++;
        return Parrot_str_unescape(imcc->interp, buf, '"', NULL);
    }
    else if (*buf == '\'') {   /* TODO handle python raw strings */
        buf++;
        return Parrot_str_new_init(imcc->interp, buf, strlen(buf) - 1,
                Parrot_ascii_encoding_ptr, PObj_constant_FLAG);
    }

    /* unquoted bare name - ASCII only don't unescape it */
    return Parrot_str_new_init(imcc->interp, buf, strlen(buf),
            Parrot_ascii_encoding_ptr, PObj_constant_FLAG);
}

/*

=item C<STRING * IMCC_string_from__STRINGC(imc_info_t * imcc, char *buf)>

Creates a Parrot C<STRING> from a string constant found in PIR or PASM. This
includes cases where charset and/or encoding are specified.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
IMCC_string_from__STRINGC(ARGMOD(imc_info_t * imcc), ARGIN(char *buf))
{
    ASSERT_ARGS(IMCC_string_from__STRINGC)
    const int ascii = (*buf == '\'' || *buf == '"');
    if (!ascii) {
        /*
         * the lexer parses:   foo:"string"
         * get first part as charset, rest as string
         */
        STRING     *s;
        const char *charset;
        char * const p = strchr(buf, '"');
        PARROT_ASSERT(p && p[-1] == ':');

        p[-1]   = 0;
        charset = buf;

        /* past delim */
        buf = p + 1;
        s   = Parrot_str_unescape(imcc->interp, buf, '"', charset);

        /* restore colon, as we may reuse this string */
        p[-1] = ':';
        return s;
    }
    else if (*buf == '"') {
        buf++;
        return Parrot_str_unescape(imcc->interp, buf, '"', NULL);
    }
    else if (*buf == '\'') {
        buf++;
        return Parrot_str_new_init(imcc->interp, buf, strlen(buf) - 1,
                Parrot_ascii_encoding_ptr, PObj_constant_FLAG);
    }
    else {
        IMCC_fataly(imcc, EXCEPTION_SYNTAX_ERROR,
                "Unknown STRING format: '%s'\n", buf);
    }
}


/*

=item C<static int add_const_str(imc_info_t * imcc, STRING *s, PackFile_ByteCode
* const bc)>

Adds a constant string to constant_table.

=cut

*/

PARROT_IGNORABLE_RESULT
static int
add_const_str(ARGMOD(imc_info_t * imcc), ARGIN(STRING *s),
        ARGIN(PackFile_ByteCode * const bc))
{
    ASSERT_ARGS(add_const_str)
    PackFile_ConstTable * const ct = bc->const_table;
    const int i = PackFile_ConstTable_rlookup_str(imcc->interp, ct, s);

    if (i >= 0)
        return i;


    if (!ct->str.constants)
        ct->str.constants = mem_gc_allocate_n_zeroed_typed(imcc->interp, 1, STRING *);

    else
        ct->str.constants = mem_gc_realloc_n_typed_zeroed(imcc->interp,
                ct->str.constants, ct->str.const_count + 1, ct->str.const_count, STRING *);

    /* initialize rlookup cache */
    if (!ct->string_hash)
        ct->string_hash = Parrot_hash_create(imcc->interp, enum_type_INTVAL,
                Hash_key_type_STRING_enc);

    ct->str.constants[ct->str.const_count] = s;

    Parrot_hash_put(imcc->interp, ct->string_hash, s,
        (void *)ct->str.const_count);

    return ct->str.const_count++;
}


/*

=item C<static int add_const_num(imc_info_t * imcc, const char *buf,
PackFile_ByteCode * bc)>

Adds a constant num to constant_table.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
add_const_num(ARGMOD(imc_info_t * imcc), ARGIN_NULLOK(const char *buf),
        ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(add_const_num)
    PackFile_ConstTable *ct = bc->const_table;
    STRING * const s        = Parrot_str_new(imcc->interp, buf, 0);

    if (!ct->num.constants)
        ct->num.constants = mem_gc_allocate_n_zeroed_typed(imcc->interp, 1, FLOATVAL);
    else
        ct->num.constants = mem_gc_realloc_n_typed_zeroed(imcc->interp,
                ct->num.constants, ct->num.const_count + 1, ct->num.const_count, FLOATVAL);

    ct->num.constants[ct->num.const_count] = Parrot_str_to_num(imcc->interp, s);

    return ct->num.const_count++;
}


/*

=item C<static PMC* mk_multi_sig(imc_info_t * imcc, const SymReg *r,
PackFile_ByteCode * bc)>

Creates and returns a multi-signature PMC given a SymReg.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC*
mk_multi_sig(ARGMOD(imc_info_t * imcc), ARGIN(const SymReg *r),
        ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(mk_multi_sig)
    PackFile_ConstTable *ct;
    PMC                 *multi_sig;
    pcc_sub_t * const    pcc_sub = r->pcc_sub;
    const INTVAL         n       = pcc_sub->nmulti;
    INTVAL               i;

    /* a :multi sub with no arguments */
    if (!pcc_sub->multi[0])
        return Parrot_pmc_new(imcc->interp, enum_class_FixedIntegerArray);

    multi_sig = Parrot_pmc_new_init_int(imcc->interp, enum_class_FixedPMCArray, n);
    ct        = bc->const_table;

    for (i = 0; i < n; ++i) {
        /* multi[i] can be a Key too -
         * store PMC constants instead of bare strings */
        PMC *sig_pmc;
        r = pcc_sub->multi[i];

        if (r->set == 'S') {
            STRING * const type_name = ct->str.constants[r->color];
            const INTVAL type_num    = Parrot_pmc_get_type_str(imcc->interp, type_name);

            if (type_num == enum_type_undef) {
                sig_pmc = Parrot_pmc_new(imcc->interp, enum_class_String);
                VTABLE_set_string_native(imcc->interp, sig_pmc, type_name);
            }
            else
                sig_pmc = Parrot_pmc_new_init_int(imcc->interp,
                        enum_class_Integer, type_num);
        }
        else {
            PARROT_ASSERT(r->set == 'K');
            sig_pmc = ct->pmc.constants[r->color];
        }

        VTABLE_set_pmc_keyed_int(imcc->interp, multi_sig, i, sig_pmc);
    }

    return multi_sig;
}


typedef void (*decl_func_t)(Interp *, PMC *, STRING *, INTVAL);

/*

=item C<static PMC* create_lexinfo(imc_info_t * imcc, IMC_Unit *unit, PMC
*sub_pmc, int need_lex, PackFile_ByteCode * bc)>

Creates and returns a new LexInfo PMC for all lexicals in the given sub in the
current compilation unit.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
create_lexinfo(ARGMOD(imc_info_t * imcc), ARGMOD(IMC_Unit *unit),
        ARGIN(PMC *sub_pmc), int need_lex, ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(create_lexinfo)
    PMC                 *lex_info    = NULL;
    const SymHash             * const hsh = &unit->hash;
    const PackFile_ConstTable * const ct  = bc->const_table;
    const INTVAL lex_info_id = Parrot_hll_get_ctx_HLL_type(imcc->interp,
                                        enum_class_LexInfo);
    unsigned int i;

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            if (r->set == 'P' && r->usage & U_LEXICAL) {
                SymReg *n;
                if (!lex_info) {
                    lex_info = Parrot_pmc_new_noinit(imcc->interp, lex_info_id);
                    VTABLE_init_pmc(imcc->interp, lex_info, sub_pmc);
                }

                /* at least one lexical name */
                n = r->reg;
                PARROT_ASSERT(n);

                while (n) {
                    STRING     *lex_name;
                    const int   k = n->color;
                    Parrot_Sub_attributes *sub;
                    PARROT_ASSERT(k >= 0);

                    lex_name = ct->str.constants[k];
                    PARROT_ASSERT(PObj_is_string_TEST(lex_name));

                    PMC_get_sub(imcc->interp, sub_pmc, sub);
                    IMCC_debug(imcc, DEBUG_PBC_CONST,
                            "add lexical '%s' to sub name '%Ss'\n",
                            n->name, sub->name);

                    if (VTABLE_exists_keyed_str(imcc->interp, lex_info, lex_name))
                        IMCC_fataly(imcc, EXCEPTION_INVALID_OPERATION,
                            "Multiple declarations of lexical '%S'\n", lex_name);

                    VTABLE_set_integer_keyed_str(imcc->interp, lex_info,
                            lex_name, r->color);

                    /* next possible name */
                    n = n->reg;
                }
            }
        }
    }

    if (!lex_info && need_lex) {
        lex_info = Parrot_pmc_new_noinit(imcc->interp, lex_info_id);
        VTABLE_init_pmc(imcc->interp, lex_info, sub_pmc);
    }

    return lex_info;
}


/*

=item C<static PMC* find_outer(imc_info_t * imcc, const IMC_Unit *unit)>

Returns any :outer sub for the current compilation unit.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
find_outer(ARGMOD(imc_info_t * imcc), ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(find_outer)
    subs_t      *s;
    PMC         *current;
    char        *cur_name_str;
    Parrot_Sub_attributes *sub;
    size_t      len;


    if (!unit->outer)
        return NULL;

    /*
     * we need that the :outer sub is already compiled,
     * because we are freezing the outer Sub PMC along with this
     * one
     */

    len = strlen(unit->outer->name);

    if (!len)
        return NULL;

    for (s = imcc->globals->cs->first; s; s = s->next) {
        if (STREQ(s->unit->subid->name, unit->outer->name)) {
            PObj_get_FLAGS(s->unit->sub_pmc) |= SUB_FLAG_IS_OUTER;
            return s->unit->sub_pmc;
        }
    }

    /* could be eval too; check if :outer is the current sub. If not, look
       in the current namespace */
    current = Parrot_pcc_get_sub(imcc->interp, CURRENT_CONTEXT(imcc->interp));
    if (PMC_IS_NULL(current))
    {
        PMC * const ns = Parrot_pcc_get_namespace(imcc->interp, CURRENT_CONTEXT(imcc->interp));
        STRING * const invokable_s = Parrot_str_new(imcc->interp, "invokable", 0);
        STRING * const unit_name_s = Parrot_str_new(imcc->interp, unit->outer->name, 0);
        current = VTABLE_get_pmc_keyed_str(imcc->interp, ns, unit_name_s);
        if (current->vtable->base_type != enum_class_Sub &&
            !VTABLE_does(imcc->interp, current, invokable_s))
            current = PMCNULL;
    }

    if (PMC_IS_NULL(current))
        IMCC_fatal(imcc, 1, "Undefined :outer sub '%s'.\n", unit->outer->name);

    PMC_get_sub(imcc->interp, current, sub);

    cur_name_str = Parrot_str_to_cstring(imcc->interp, sub->name);
    if (strlen(cur_name_str) == len
            && (memcmp(cur_name_str, unit->outer->name, len) == 0)) {
        Parrot_str_free_cstring(cur_name_str);
        return current;
    }
    Parrot_str_free_cstring(cur_name_str);
    return NULL;
}


/*

=item C<static int add_const_pmc_sub(imc_info_t * imcc, SymReg *r, size_t offs,
size_t end)>

Adds a constant Sub in the current compilation unit, denoted by the offset and
end positions.

=cut

*/

#define UNIT_FREE_CHAR(x) \
  do { \
    mem_sys_free((x)); \
    (x) = NULL; \
  } while (0);

PARROT_IGNORABLE_RESULT
static int
add_const_pmc_sub(ARGMOD(imc_info_t * imcc), ARGMOD(SymReg *r), size_t offs,
        size_t end)
{
    ASSERT_ARGS(add_const_pmc_sub)
    PMC                   *ns_pmc;
    PMC                   *sub_pmc;
    Parrot_Sub_attributes *sub;
    PackFile_ByteCode * const interp_code = Parrot_pf_get_current_code_segment(imcc->interp);
    PackFile_ConstTable * const ct    = interp_code->const_table;
    IMC_Unit * const unit = imcc->globals->cs->subs->unit;

    int i;
    int ns_const = -1;
    SymReg * const ns = unit->_namespace ? unit->_namespace->reg : NULL;

    if (unit->_namespace) {
        /* strip namespace off from front */
        static const char ns_sep[]  = "@@@";
        char             *real_name = strstr(r->name, ns_sep);

        if (real_name) {
            /* Unfortunately, there is no strrstr, then iterate until last */
            char *aux = strstr(real_name + 3, ns_sep);

            while (aux) {
                real_name = aux;
                aux       = strstr(real_name + 3, ns_sep);
            }

            real_name += 3;
        }

        IMCC_debug(imcc, DEBUG_PBC_CONST,
                "name space const = %d ns name '%s'\n", ns->color, ns->name);

        ns_const = ns->color;

        if (real_name) {
            char * const p = mem_sys_strdup(real_name);
            mem_sys_free(r->name);
            r->name = p;
        }
    }

    /* Do we have to create an instance of a specific type for this sub? */
    if (unit->instance_of) {
        /* Look it up as a class and as a PMC type. */
        STRING * const classname = Parrot_str_new(imcc->interp,
                unit->instance_of + 1, strlen(unit->instance_of) - 2);

        PMC * const classobj = Parrot_oo_get_class_str(imcc->interp, classname);

        if (!PMC_IS_NULL(classobj))
            sub_pmc = VTABLE_instantiate(imcc->interp, classobj, PMCNULL);
        else {
            const INTVAL type = Parrot_pmc_get_type_str(imcc->interp, classname);
            if (type <= 0)
                Parrot_ex_throw_from_c_args(imcc->interp, NULL, EXCEPTION_NO_CLASS,
                    "Class '%Ss' specified in :instanceof(...) not found",
                    classname);
            sub_pmc = Parrot_pmc_new(imcc->interp, type);
        }
    }
    else {
        /* use a possible type mapping for the Sub PMCs, and create it */
        const INTVAL type = r->pcc_sub->yield ? enum_class_Coroutine : enum_class_Sub;
        const INTVAL hlltype = Parrot_hll_get_ctx_HLL_type(imcc->interp, type);

        /* TODO create constant - see also src/packfile.c */
        sub_pmc = Parrot_pmc_new(imcc->interp, hlltype);
    }

    /* Set flags and get the sub info. */
    PMC_get_sub(imcc->interp, sub_pmc, sub);
    PObj_get_FLAGS(sub_pmc) |= (r->pcc_sub->pragma & SUB_FLAG_PF_MASK);
    Sub_comp_get_FLAGS(sub) |= (r->pcc_sub->pragma & SUB_COMP_FLAG_MASK);

    r->color  = add_const_str(imcc, IMCC_string_from_reg(imcc, r), interp_code);
    sub->name = ct->str.constants[r->color];

    /* If the unit has no subid, set the subid to match the name. */
    if (!unit->subid)
        unit->subid = r;
    else {
        /* trim the quotes  */
        char *oldname     = unit->subid->name;
        unit->subid->name = mem_sys_strdup(unit->subid->name + 1);
        unit->subid->name[strlen(unit->subid->name) - 1] = 0;
        mem_sys_free(oldname);

        /* create string constant for it. */
        unit->subid->color = add_const_str(imcc,
            IMCC_string_from_reg(imcc, unit->subid), interp_code);
    }

    sub->subid = ct->str.constants[unit->subid->color];
    ns_pmc     = NULL;

    if (ns) {
        switch (ns->set) {
          case 'K':
            if (ns_const >= 0 && ns_const < ct->pmc.const_count)
                ns_pmc = ct->pmc.constants[ns_const];
            break;
          case 'S':
            if (ns_const >= 0 && ns_const < ct->str.const_count) {
                ns_pmc = Parrot_pmc_new_constant(imcc->interp, enum_class_String);
                VTABLE_set_string_native(imcc->interp, ns_pmc,
                    ct->str.constants[ns_const]);
            }
            break;
          default:
            break;
        }
    }

    sub->namespace_name = ns_pmc;
    sub->start_offs     = offs;
    sub->end_offs       = end;
    sub->HLL_id         = unit->hll_id;

    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = unit->n_regs_used[i];

    sub->lex_info     = create_lexinfo(imcc, unit, sub_pmc,
                                        r->pcc_sub->pragma & P_NEED_LEX, interp_code);
    sub->outer_sub    = find_outer(imcc, unit);
    sub->vtable_index = -1;

    /* check if it's declared multi */
    if (r->pcc_sub->nmulti)
        sub->multi_signature = mk_multi_sig(imcc, r, interp_code);
    else
        sub->multi_signature = NULL;

    if (unit->is_vtable_method == 1) {
        STRING *vtable_name;
        INTVAL  vtable_index;

        /* Work out the name of the vtable function. */
        if (unit->vtable_name) {
            vtable_name = Parrot_str_new(imcc->interp, unit->vtable_name + 1,
                    strlen(unit->vtable_name) - 2);
            UNIT_FREE_CHAR(unit->vtable_name);
        }
        else
            vtable_name = sub->name;

        /* Check this is a valid vtable function to override. */
        vtable_index = Parrot_get_vtable_index(imcc->interp, vtable_name);

        if (vtable_index == -1)
            IMCC_fatal(imcc, 1,
                "'%S' is not a vtable, but was used with :vtable.\n",
                vtable_name);

        /* TODO check for duplicates */
        sub->vtable_index = vtable_index;
    }

    if (unit->is_method == 1) {
        /* Work out the name of the method. */
        if (unit->method_name) {
            sub->method_name = IMCC_string_from__STRINGC(imcc, unit->method_name);
            UNIT_FREE_CHAR(unit->method_name);
        }
        else
            sub->method_name = sub->name;
    }
    else
        /* TODO: Any reason why we need to have a new empty GCable here for a
                 value which we don't use? Can we use STRINGNULL? */
        sub->method_name = Parrot_str_new(imcc->interp, "", 0);

    if (unit->has_ns_entry_name == 1) {
        /* Work out the name of the ns entry. */
        if (unit->ns_entry_name) {
            sub->ns_entry_name = IMCC_string_from__STRINGC(imcc, unit->ns_entry_name);
            UNIT_FREE_CHAR(unit->ns_entry_name);
        }
        else
            sub->ns_entry_name = sub->name;
    }
    else
        sub->ns_entry_name = sub->name;

    Parrot_ns_store_sub(imcc->interp, sub_pmc);

    /* store the sub */
    {
        const int k = add_const_table_pmc(imcc, sub_pmc);
        unit->sub_pmc = sub_pmc;

        imcc->globals->cs->subs->pmc_const = k;

        if (DEBUG_PBC_CONST & imcc->debug) {
            Parrot_Sub_attributes *outer_sub;
            if (sub->outer_sub)
                PMC_get_sub(imcc->interp, sub->outer_sub, outer_sub);

            IMCC_debug(imcc, DEBUG_PBC_CONST,
                    "add_const_pmc_sub '%s' flags %x color %d (%Ss) "
                    "lex_info %s :outer(%Ss)\n",
                    r->name, r->pcc_sub->pragma, k,
                    sub_pmc->vtable->whoami,
                    sub->lex_info  ? "yes" : "no",
                    sub->outer_sub ? outer_sub->name
                                   : Parrot_str_new(imcc->interp, "*none*", 0));
        }

        if (r->pcc_sub->pragma & P_MAIN && !imcc->seen_main) {
            imcc->seen_main = 1;
            interp_code->main_sub = k;
        }
        else if (interp_code->main_sub < 0) {
            interp_code->main_sub = k;
        }

        /*
         * store the sub's strings
         */
        {
            PMC * const strings = Parrot_freeze_strings(imcc->interp, sub_pmc);
            const int n = VTABLE_elements(imcc->interp, strings);

            for (i = 0; i < n; i++) {
                add_const_str(imcc,
                    VTABLE_get_string_keyed_int(imcc->interp, strings, i), interp_code);
            }
        }

        return k;
    }
}


/*

=item C<static opcode_t build_key(imc_info_t * imcc, SymReg *key_reg,
PackFile_ByteCode * bc)>

Builds a Key PMC from the given SymReg.

Color is a Parrot register number or a constant table index.  For the rest,
please consult PDD08_KEYS(1).  Additionally, I build a string representation of
the key, which gets cached in the globals.keys.

=cut

*/

static opcode_t
build_key(ARGMOD(imc_info_t * imcc), ARGIN(SymReg *key_reg),
        ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(build_key)

    PackFile_ConstTable *ct = bc->const_table;
    SymReg *reg  = key_reg->set == 'K' ? key_reg->nextkey : key_reg;
    PMC    *head = NULL;
    PMC    *tail = NULL;
    opcode_t regno, k;

    for (; reg; reg = reg->nextkey) {
        SymReg *r = reg;

        if (tail) {
            PMC * temp = Parrot_pmc_new_constant(imcc->interp, enum_class_Key);
            SETATTR_Key_next_key(imcc->interp, tail, temp);
            GETATTR_Key_next_key(imcc->interp, tail, tail);
        }
        else {
            head = tail = Parrot_pmc_new_constant(imcc->interp, enum_class_Key);
        }

        switch (r->type) {
          case VTIDENTIFIER:       /* P[S0] */
          case VTPASM:             /* P[S0] */
          case VTREG:              /* P[S0] */

            /* if key is a register, the original sym is in r->reg */
            if (r->reg)
                r = r->reg;

            /* don't emit mapped regs in key parts */
            regno = r->color >= 0 ? r->color : -1 - r->color;

            switch (r->set) {
              case 'I':
                Parrot_key_set_register(imcc->interp, tail, regno, KEY_integer_FLAG);
                break;
              case 'S':
                Parrot_key_set_register(imcc->interp, tail, regno, KEY_string_FLAG);
                break;
              case 'P':
                Parrot_key_set_register(imcc->interp, tail, regno, KEY_pmc_FLAG);
                break;
              default:
                IMCC_fatal(imcc, 1, "build_key: wrong register set\n");
            }

            IMCC_debug(imcc, DEBUG_PBC_CONST, " keypart reg %s %c%d\n",
                    r->name, r->set, (int)r->color);
            break;

          case VT_CONSTP:
            r = r->reg;
            /* Fall through. */
          case VTCONST:
          case VTCONST|VT_ENCODED:
            switch (r->set) {
              case 'S':                       /* P["key"] */
                /* str constant */
                Parrot_key_set_string(imcc->interp, tail, ct->str.constants[r->color]);
                break;
              case 'I':                       /* P[;42;..] */
                /* int constant */
                Parrot_key_set_integer(imcc->interp, tail, atol(r->name));
                break;
              default:
                IMCC_fatal(imcc, 1, "build_key: unknown set\n");
            }
            break;
          default:
            IMCC_fatal(imcc, 1, "build_key: "
                    "unknown type 0x%x on %s\n", r->type, r->name);
        }
    }

    {
        STRING *name      = Parrot_key_set_to_string(imcc->interp, head);
        char *cname       = Parrot_str_to_cstring(imcc->interp, name);
        SymReg * const r  = _get_sym(&imcc->globals->cs->key_consts, cname);

        if (r) {
            k = r->color;
        }
        else {
            k = add_const_table_pmc(imcc, head);
            store_key_const(imcc, cname, k);
        }

        Parrot_str_free_cstring(cname);
    }

    /* single 'S' keys already have their color assigned */
    if (key_reg->set == 'K')
        key_reg->color = k;

    return k;
}


/*

=item C<INTVAL IMCC_int_from_reg(imc_info_t * imcc, const SymReg *r)>

Creates and returns an INTEGER given an integer-like SymReg.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
IMCC_int_from_reg(ARGMOD(imc_info_t * imcc), ARGIN(const SymReg *r))
{
    ASSERT_ARGS(IMCC_int_from_reg)
    INTVAL i;
    const char *digits;
    int base;

    if (r->type & VT_CONSTP)
        r = r->reg;

    digits = r->name;
    base   = 10;
    errno  = 0;

    if (digits[0] == '0') {
        switch (toupper((unsigned char)digits[1])) {
            case 'B': base =  2; break;
            case 'O': base =  8; break;
            case 'X': base = 16; break;
            default: break;
        }
    }

    if (base == 10) {
        i = strtol(digits, NULL, base);
    }
    else {
        i = strtoul(digits + 2, NULL, base);
    }

    /*
     * TODO
     * - is this portable?
     * - there are some more atol()s in this file
     */
    if (errno == ERANGE)
        IMCC_fatal(imcc, 1, "add_1_const:" "Integer overflow '%s'", r->name);

    return i;
}

/*

=item C<static void init_fixedintegerarray_from_string(imc_info_t * imcc, PMC
*p, STRING *s)>

Initializes the passed FIA from a string representation I<"(el0, el1, ...)">.

=cut

*/

static void
init_fixedintegerarray_from_string(ARGMOD(imc_info_t * imcc), ARGIN(PMC *p),
        ARGIN(STRING *s))
{
    ASSERT_ARGS(init_fixedintegerarray_from_string)
    INTVAL  n, elem, i, l;
    char   *src, *chr, *start;
    int     base;

    if (STRING_max_bytes_per_codepoint(s) != 1)
        Parrot_ex_throw_from_c_args(imcc->interp, NULL, EXCEPTION_INVALID_ENCODING,
            "unhandled string encoding in FixedIntegerArray initialization");

    l = Parrot_str_byte_length(imcc->interp, s);

    if (!l)
        return;

    chr = src = Parrot_str_to_cstring(imcc->interp, s);

    /* "()" - no args */
    if (l <= 2 && *src == '(') {
        Parrot_str_free_cstring(src);
        return;
    }

    /* count commas */
    n = 0;
    while (*chr) {
        if (*chr == ',')
            n++;
        chr++;
    }

    /* presize the array */
    VTABLE_set_integer_native(imcc->interp, p, n + 1);

    /* parse string */
    chr = src;

    for (i = l, n = 0; i; --i, ++chr) {
        switch (*chr) {
          case ' ':
            continue;
          case '\t':
            continue;
          case '(':
            continue;
          case ')':
            break;
          case ',':
            n++;
            break;
          default:
            base = 10;
            if (*chr == '0') {
                ++chr;
                --i;
                if (*chr == 'b' || *chr == 'B') {
                    base = 2;
                    ++chr;
                    --i;
                }
                else if (*chr == 'x' || *chr == 'X') {
                    base = 16;
                    ++chr;
                    --i;
                }
            }
            start = chr;
            elem  = strtoul(chr, &chr, base);
            --chr;
            i -= (chr - start);
            VTABLE_set_integer_keyed_int(imcc->interp, p, n, elem);
            break;
        }
    }

    Parrot_str_free_cstring(src);

}

/*

=item C<static void make_pmc_const(imc_info_t * imcc, SymReg *r)>

Creates a constant PMC, given a SymReg.

=cut

*/

static void
make_pmc_const(ARGMOD(imc_info_t * imcc), ARGMOD(SymReg *r))
{
    ASSERT_ARGS(make_pmc_const)
    /* TODO: Is there a way to get this without violating the encapsulation
             of all these structures? */
    PMC    * const _class = imcc->interp->vtables[r->pmc_type]->pmc_class;
    STRING *s;
    PMC    *p;

    if (PMC_IS_NULL(_class))
        IMCC_fatal(imcc, 1, "make_pmc_const: no such pmc");

    if (*r->name == '"')
        s = Parrot_str_unescape(imcc->interp, r->name + 1, '"', NULL);

    else if (*r->name == '\'')
        s = Parrot_str_unescape(imcc->interp, r->name + 1, '\'', NULL);

    else
        s = Parrot_str_unescape(imcc->interp, r->name, 0, NULL);

    p  = Parrot_pmc_new_constant(imcc->interp, r->pmc_type);

    switch (r->pmc_type) {
      case enum_class_Integer:
        VTABLE_set_integer_native(imcc->interp, p, Parrot_str_to_int(imcc->interp, s));
        break;
      case enum_class_Float:
        VTABLE_set_number_native(imcc->interp, p, Parrot_str_to_num(imcc->interp, s));
        break;
      case enum_class_String:
        VTABLE_set_string_native(imcc->interp, p, s);
        break;
      case enum_class_FixedIntegerArray:
        init_fixedintegerarray_from_string(imcc, p, s);
        break;
      default:
        Parrot_ex_throw_from_c_args(imcc->interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can't generate PMC constant for this type.");
    }

    /* append PMC constant */
    r->color = add_const_table_pmc(imcc, p);
}


/*

=item C<static void add_1_const(imc_info_t * imcc, SymReg *r, PackFile_ByteCode
* bc)>

Adds a constant SymReg to the constant table, depending on its type.

=cut

*/

static void
add_1_const(ARGMOD(imc_info_t * imcc), ARGMOD(SymReg *r),
        ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(add_1_const)
    if (r->color >= 0)
        return;

    if (r->use_count <= 0)
        return;

    switch (r->set) {
      case 'I':
        r->color = IMCC_int_from_reg(imcc, r);
        break;
      case 'S':
        if (r->type & VT_CONSTP)
            r = r->reg;
        r->color = add_const_str(imcc, IMCC_string_from_reg(imcc, r), bc);
        break;
      case 'N':
        r->color = add_const_num(imcc, r->name, bc);
        break;
      case 'K':
        {
            SymReg *key = r;

            for (r = r->nextkey; r; r = r->nextkey)
                if (r->type & (VTCONST|VT_CONSTP))
                    add_1_const(imcc, r, bc);
                build_key(imcc, key, bc);
        }
        break;
      case 'P':
        make_pmc_const(imcc, r);
        IMCC_debug(imcc, DEBUG_PBC_CONST, "PMC const %s\tcolor %d\n",
                r->name, r->color);
        break;
      default:
        break;
    }

    if (!r)
        return;

    IMCC_debug(imcc, DEBUG_PBC_CONST, "const %s\tcolor %d use_count %d\n",
            r->name, r->color, r->use_count);
}


/*

=item C<static void constant_folding(imc_info_t * imcc, const IMC_Unit *unit,
PackFile_ByteCode * bc)>

Stores a constant's idx for later reuse.

=cut

*/

static void
constant_folding(ARGMOD(imc_info_t * imcc), ARGIN(const IMC_Unit *unit),
        ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(constant_folding)
    const SymHash *hsh = &imcc->ghash;
    unsigned int   i;

    /* go through all consts of current sub */
    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        /* normally constants are in ghash ... */
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & (VTCONST|VT_CONSTP))
                add_1_const(imcc, r, bc);

            if (r->usage & U_LEXICAL) {
                SymReg *n = r->reg;

                /* r->reg is a chain of names for the same lex sym */
                while (n) {
                    /* lex_name */
                    add_1_const(imcc, n, bc);
                    n = n->reg;
                }
            }
        }
    }

    /* ... but keychains 'K' are in local hash, they may contain
     * variables and constants */
    hsh = &unit->hash;

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;
        /* normally constants are in ghash ... */
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & VTCONST)
                add_1_const(imcc, r, bc);
        }
    }

    /* and finally, there may be an outer Sub */
    if (unit->outer)
        add_1_const(imcc, unit->outer, bc);
}


/*

=item C<void e_pbc_new_sub(imc_info_t * imcc, void *param, IMC_Unit *unit)>

Starts a new PBC emitting of a compilation unit, if the given compilation unit
has any instructions.

=cut

*/

void
e_pbc_new_sub(ARGMOD(imc_info_t * imcc), SHIM(void *param), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(e_pbc_new_sub)
    if (!unit->instructions)
        return;

    /* we start a new compilation unit */
    make_new_sub(imcc, unit);
}

/*

=item C<void e_pbc_end_sub(imc_info_t * imcc, void *param, IMC_Unit *unit)>

Finishes the PBC emitting of a given compilation unit.

=cut

*/

void
e_pbc_end_sub(ARGMOD(imc_info_t * imcc), SHIM(void *param), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(e_pbc_end_sub)
    Instruction *ins = unit->instructions;
    int          pragma;

    if (!ins)
        return;

    /*
     * if the sub was marked IMMEDIATE, we run it now
     * This is *dangerous*: all possible global state can be messed
     * up, e.g. when that sub starts loading bytecode
     */

    /* we run only PCC subs */
    if (!ins->symregs[0] || !ins->symregs[0]->pcc_sub)
        return;

    pragma = ins->symregs[0]->pcc_sub->pragma;

    if (!(pragma & P_ANON))
        return;

    if (pragma & P_IMMEDIATE && (pragma & P_ANON)) {
        /* clear global symbols temporarily -- TT #1324, for example */
        imcc_globals *g = imcc->globals;
        SymHash ghash;

        imcc->globals = NULL;

        memmove(&ghash, &imcc->ghash, sizeof (SymHash));
        memset(&imcc->ghash, 0, sizeof (SymHash));

        IMCC_debug(imcc, DEBUG_PBC, "immediate sub '%s'", ins->symregs[0]->name);
        PackFile_fixup_subs(imcc->interp, PBC_IMMEDIATE, NULL);

        imcc->globals  = g;
        memmove(&imcc->ghash, &ghash, sizeof (SymHash));
    }
}


/*

=item C<static void verify_signature(imc_info_t * imcc, const Instruction *ins,
opcode_t *pc, PackFile_ByteCode * bc)>

Checks if any get_ argument contains constants and fills in type bits for
argument types and constants, if missing.

=cut

*/

static void
verify_signature(ARGMOD(imc_info_t * imcc), ARGIN(const Instruction *ins),
        ARGIN(opcode_t *pc), ARGMOD(PackFile_ByteCode * bc))
{
    ASSERT_ARGS(verify_signature)
    PMC    *changed_sig    = NULL;
    PMC    * const sig_arr = bc->const_table->pmc.constants[pc[-1]];
    op_lib_t *core_ops = PARROT_GET_CORE_OPLIB(imcc->interp);
    int needed    = 0;
    int no_consts = (ins->op == &core_ops->op_info_table[PARROT_OP_get_results_pc]
                  || ins->op == &core_ops->op_info_table[PARROT_OP_get_params_pc]);

    INTVAL  i, n;

    PARROT_ASSERT(PObj_is_PMC_TEST(sig_arr));
    PARROT_ASSERT(sig_arr->vtable->base_type == enum_class_FixedIntegerArray);

    n = VTABLE_elements(imcc->interp, sig_arr);

    if (n != ins->symreg_count - 1)
        IMCC_fatal(imcc, 1, "syntax error: parameter count mismatch in '%s'"
                              " -- have %d, want %d",
                              ins->opname, ins->symreg_count - 1, n);

    for (i = 0; i < n; ++i) {
        SymReg * const r   = ins->symregs[i + 1];
        INTVAL         sig = VTABLE_get_integer_keyed_int(imcc->interp, sig_arr, i);

        if (! (sig & PARROT_ARG_NAME)
         &&    no_consts && (r->type & VTCONST))
            IMCC_fatal(imcc, 1, "e_pbc_emit: "
                    "constant argument '%s' in get param/result\n", r->name);

        if ((r->type & VTCONST) && !(sig & PARROT_ARG_CONSTANT)) {
            if (!changed_sig)
                changed_sig = VTABLE_clone(imcc->interp, sig_arr);

            sig |= PARROT_ARG_CONSTANT;

            VTABLE_set_integer_keyed_int(imcc->interp, changed_sig, i, sig);
        }

        switch (r->set) {
            case 'I': needed = PARROT_ARG_INTVAL;   break;
            case 'S': needed = PARROT_ARG_STRING;   break;
            case 'P': needed = PARROT_ARG_PMC;      break;
            case 'N': needed = PARROT_ARG_FLOATVAL; break;
            default :                               break;
        }

        if (needed != (sig & PARROT_ARG_TYPE_MASK)) {
            if (!changed_sig)
                changed_sig = VTABLE_clone(imcc->interp, sig_arr);

            sig &= ~PARROT_ARG_TYPE_MASK;
            sig |= needed;

            VTABLE_set_integer_keyed_int(imcc->interp, changed_sig, i, sig);
        }
    }

    /* append PMC constant */
    if (changed_sig)
        pc[-1] = add_const_table_pmc(imcc, changed_sig);
}


/*

=item C<int e_pbc_emit(imc_info_t * imcc, void *param, const IMC_Unit *unit,
const Instruction *ins)>

Starts to emit code for one instruction.

=cut

*/

int
e_pbc_emit(ARGMOD(imc_info_t * imcc), SHIM(void *param), ARGIN(const IMC_Unit *unit),
        ARGIN(const Instruction *ins))
{
    ASSERT_ARGS(e_pbc_emit)
    int        ok = 0;
    int        i;
    op_lib_t *core_ops = PARROT_GET_CORE_OPLIB(imcc->interp);
    PMC * const interp_pf_pmc = Parrot_pf_get_current_packfile(imcc->interp);
    PackFile * const interp_pf = (PackFile*)VTABLE_get_pointer(imcc->interp, interp_pf_pmc);
    PackFile_ByteCode * const interp_code = Parrot_pf_get_current_code_segment(imcc->interp);

    /* first instruction, do initialisation ... */
    if (ins == unit->instructions) {
        size_t       ins_size, seg_size;
        const size_t old_size  = get_old_size(imcc, interp_code, &imcc->ins_line);
        const size_t code_size = get_code_size(imcc, unit, &ins_size);
        const size_t bytes     = (old_size + code_size) * sizeof (opcode_t);

        IMCC_debug(imcc, DEBUG_PBC, "code_size(ops) %d  old_size %d\n",
                code_size, old_size);

        constant_folding(imcc, unit, interp_code);
        store_sub_size(imcc, code_size, ins_size);

        /* allocate code */
        interp_code->base.data = (opcode_t *)
            mem_sys_realloc(interp_code->base.data, bytes);

        /* reallocating this removes its mmaped-ness; needs encapsulation */
        interp_code->base.pf->is_mmap_ped = 0;

        interp_code->base.size = old_size + code_size;

        imcc->pc   = (opcode_t *)interp_code->base.data + old_size;
        imcc->npc  = 0;

        /* FIXME length and multiple subs */
        seg_size = (size_t)imcc->ins_line + ins_size + 1;
        imcc->debug_seg = Parrot_new_debug_seg(imcc->interp, interp_code, seg_size);

        Parrot_debug_add_mapping(imcc->interp, imcc->debug_seg, old_size, unit->file);

        /* if item is a PCC_SUB entry then store it constants */
        if (ins->symregs[0] && ins->symregs[0]->pcc_sub) {
            add_const_pmc_sub(imcc, ins->symregs[0], old_size, old_size + code_size);
        }
        else {
            /* need a dummy to hold register usage */
            SymReg * const r = mk_sub_label(imcc, "(null)");
            r->type    = VT_PCC_SUB;
            r->pcc_sub = mem_gc_allocate_zeroed_typed(imcc->interp, pcc_sub_t);

            add_const_pmc_sub(imcc, r, old_size, old_size + code_size);
        }
    }

    /* if this is not the first sub then store the sub */
    if (imcc->npc && unit->pasm_file
            && ins->symregs[0] && ins->symregs[0]->pcc_sub) {
        /* we can only set the offset for PASM code */
        add_const_pmc_sub(imcc, ins->symregs[0], imcc->npc,
            imcc->npc);
    }

    if (ins->opname && strcmp(ins->opname, ".annotate") == 0) {
        /* It's an annotation. */
        int annotation_type;

        /* Add annotations seg if we're missing one. */
        if (!interp_code->annotations) {
            /* Create segment. "_ANN" is added to the name */
            STRING *name = Parrot_sprintf_c(imcc->interp, "%Ss_ANN",
                interp_code->base.name);
            int      add = interp_code->base.dir ? 1 : 0;
            PackFile_Directory * const dir  = add ? interp_code->base.dir :
                    &interp_pf->directory;
            interp_code->annotations = (PackFile_Annotations *)
                    PackFile_Segment_new_seg(imcc->interp, dir,
                        PF_ANNOTATIONS_SEG, name, 1);
            interp_code->annotations->code = interp_code;
        }

        /* Add annotation. */
        switch (ins->symregs[1]->set) {
          case 'I':
            annotation_type = PF_ANNOTATION_KEY_TYPE_INT;
            break;
          case 'S':
            annotation_type = PF_ANNOTATION_KEY_TYPE_STR;
            break;
          default:
            IMCC_fatal(imcc, 1, "e_pbc_emit:invalid type for annotation value\n");
        }
        PackFile_Annotations_add_entry(imcc->interp, interp_code->annotations,
                    imcc->pc - interp_code->base.data,
                    ins->symregs[0]->color, annotation_type, ins->symregs[1]->color);
    }
    else if (ins->opname && *ins->opname) {
        SymReg  *addr, *r;
        op_info_t *op_info;
        opcode_t last_label = 1;

        if ((ins->type & ITBRANCH)
        && ((addr = get_branch_reg(ins)) != NULL)
        && !REG_NEEDS_ALLOC(addr)) {
            /* fixup local jumps - calc offset */
            if (addr->color == -1)
                IMCC_fatal(imcc, 1, "e_pbc_emit: no label offset defined for '%s'\n",
                        addr->name);

            last_label = addr->color - imcc->npc;

            IMCC_debug(imcc, DEBUG_PBC_FIXUP,
                "branch label at pc %d addr %d %s %d\n",
                imcc->npc, addr->color, addr->name, last_label);
        }

        /* add debug line info */
        if (imcc->debug_seg)
            imcc->debug_seg->base.data[imcc->ins_line++] = (opcode_t)ins->line;

        /* Get the info for that opcode */
        op_info = ins->op;

        IMCC_debug(imcc, DEBUG_PBC, "%d %s", imcc->npc, op_info->full_name);

        /* Start generating the bytecode */
        *(imcc->pc)++ = bytecode_map_op(imcc, op_info);

        for (i = 0; i < op_info->op_count-1; i++) {
            switch (op_info->types[i]) {
              case PARROT_ARG_IC:
                /* branch instruction */
                if (op_info->labels[i]) {
                    if (last_label == 1)
                        /* we don't have a branch with offset 1 !? */
                        IMCC_fatal(imcc, 1, "e_pbc_emit: "
                                    "no label offset found\n");
                    *(imcc->pc)++ = last_label;
                    last_label = 1;
                    break;
                    /* else fall through */
                }
              case PARROT_ARG_I:
              case PARROT_ARG_N:
              case PARROT_ARG_S:
              case PARROT_ARG_P:
              case PARROT_ARG_K:
              case PARROT_ARG_KI:
              case PARROT_ARG_KIC:
              case PARROT_ARG_SC:
              case PARROT_ARG_NC:
              case PARROT_ARG_PC:
                r     = ins->symregs[i];

                if (r->type & VT_CONSTP)
                    r = r->reg;

                *(imcc->pc)++ = (opcode_t) r->color;
                IMCC_debug(imcc, DEBUG_PBC, " %d", r->color);
                break;
              case PARROT_ARG_KC:
                r = ins->symregs[i];
                if (r->set == 'K') {
                    PARROT_ASSERT(r->color >= 0);
                    *(imcc->pc)++ = r->color;
                }
                else
                    *(imcc->pc)++ = build_key(imcc, r, interp_code);
                IMCC_debug(imcc, DEBUG_PBC, " %d", imcc->pc[-1]);
                break;
              default:
                IMCC_fatal(imcc, 1, "e_pbc_emit:unknown argtype in parrot op\n");
                break;
            }
        }
        if (ins->op == &core_ops->op_info_table[PARROT_OP_set_args_pc]
        ||  ins->op == &core_ops->op_info_table[PARROT_OP_get_results_pc]
        ||  ins->op == &core_ops->op_info_table[PARROT_OP_get_params_pc]
        ||  ins->op == &core_ops->op_info_table[PARROT_OP_set_returns_pc]) {

            /* TODO get rid of verify_signature - PIR call sigs are already
             * fixed, but PASM still needs it */
            verify_signature(imcc, ins, imcc->pc, interp_code);

            /* emit var_args part */
            for (; i < ins->opsize - 1; ++i) {
                r = ins->symregs[i];
                if (r->type & VT_CONSTP)
                    r = r->reg;
                *(imcc->pc)++ = (opcode_t) r->color;
                IMCC_debug(imcc, DEBUG_PBC, " %d", r->color);
            }
        }

        IMCC_debug(imcc, DEBUG_PBC, "\t%d\n", ins);
        imcc->npc += ins->opsize;
    }

    return ok;
}


/*

=item C<void e_pbc_close(imc_info_t * imcc, void *param)>

Closes this PMC unit.

=cut

*/

void
e_pbc_close(ARGMOD(imc_info_t * imcc), SHIM(void *param))
{
    ASSERT_ARGS(e_pbc_close)
    fixup_globals(imcc);
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
