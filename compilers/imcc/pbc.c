/*
 * Copyright (C) 2002-2010, Parrot Foundation.
 * $Id$
 */

#include "imc.h"
#include "pbc.h"
#include "parrot/packfile.h"
#include "parrot/pmc_freeze.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

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

static void add_1_const(PARROT_INTERP, ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

static int add_const_key(PARROT_INTERP,
    ARGIN(const opcode_t *key),
    int size,
    ARGIN(const char *s_key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
static int add_const_num(PARROT_INTERP, ARGIN_NULLOK(const char *buf))
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
static int /*@alt void@*/
add_const_pmc_sub(PARROT_INTERP,
    ARGMOD(SymReg *r),
    size_t offs,
    size_t end)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
static int add_const_str(PARROT_INTERP, ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int add_const_table(PARROT_INTERP)
        __attribute__nonnull__(1);

static int add_const_table_key(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int add_const_table_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static opcode_t build_key(PARROT_INTERP, ARGIN(SymReg *key_reg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void constant_folding(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* create_lexinfo(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(PMC *sub_pmc),
    int need_lex)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t * find_global_label(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(const subs_t *sym),
    ARGOUT(int *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pc);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* find_outer(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t * find_sub_by_subid(PARROT_INTERP,
    ARGIN(const char *lookup),
    ARGIN(const subs_t *sym),
    ARGOUT(int *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*pc);

static void fixup_globals(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static size_t get_codesize(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    ARGOUT(size_t *src_lines))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*src_lines);

PARROT_WARN_UNUSED_RESULT
static int get_old_size(PARROT_INTERP, ARGOUT(int *ins_line))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ins_line);

static void imcc_globals_destroy(PARROT_INTERP,
    SHIM(int ex),
    SHIM(void *param))
        __attribute__nonnull__(1);

static void init_fixedintegerarray_from_string(PARROT_INTERP,
    ARGIN(PMC *p),
    ARGIN(STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void make_new_sub(PARROT_INTERP, ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void make_pmc_const(PARROT_INTERP, ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC* mk_multi_sig(PARROT_INTERP, ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void store_fixup(PARROT_INTERP,
    ARGIN(const SymReg *r),
    int pc,
    int offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void store_key_const(PARROT_INTERP, ARGIN(const char *str), int idx)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void store_sub_size(PARROT_INTERP, size_t size, size_t ins_line)
        __attribute__nonnull__(1);

static void verify_signature(PARROT_INTERP,
    ARGIN(const Instruction *ins),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_add_1_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_add_const_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key) \
    , PARROT_ASSERT_ARG(s_key))
#define ASSERT_ARGS_add_const_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_add_const_pmc_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_add_const_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_add_const_table __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_add_const_table_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_add_const_table_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc))
#define ASSERT_ARGS_build_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key_reg))
#define ASSERT_ARGS_constant_folding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_create_lexinfo __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_find_global_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(sym) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_find_outer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_find_sub_by_subid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lookup) \
    , PARROT_ASSERT_ARG(sym) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_fixup_globals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_codesize __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(src_lines))
#define ASSERT_ARGS_get_old_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ins_line))
#define ASSERT_ARGS_imcc_globals_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_init_fixedintegerarray_from_string \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(p) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_make_new_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_make_pmc_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_mk_multi_sig __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_store_fixup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_store_key_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_store_sub_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_verify_signature __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(pc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<static void imcc_globals_destroy(PARROT_INTERP, int ex, void *param)>

Frees memory allocated for IMCC globals for one particular compilation unit.

=cut

*/

static void
imcc_globals_destroy(PARROT_INTERP, SHIM(int ex), SHIM(void *param))
{
    ASSERT_ARGS(imcc_globals_destroy)

    /* This is an allowed condition? See TT #629 */
    if (IMCC_INFO(interp)->globals) {
        code_segment_t *cs = IMCC_INFO(interp)->globals->cs;

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
        IMCC_INFO(interp)->globals->cs = NULL;
    }

}


/*

=item C<static int add_const_table(PARROT_INTERP)>

Adds an empty item to constant table, returning its position.

=cut

*/

static int
add_const_table(PARROT_INTERP)
{
    ASSERT_ARGS(add_const_table)
    const size_t oldcount = interp->code->const_table->const_count;
    const size_t newcount = oldcount + 1;

    /* Allocate a new constant */
    PackFile_Constant *new_constant = PackFile_Constant_new(interp);

    /* Update the constant count and reallocate */
    if (interp->code->const_table->constants) {
        interp->code->const_table->constants =
            mem_gc_realloc_n_typed_zeroed(interp, interp->code->const_table->constants,
                newcount, oldcount, PackFile_Constant *);
    }
    else {
        /* initialize rlookup cache */
        interp->code->const_table->string_hash =
            Parrot_pmc_new_init_int(interp, enum_class_Hash, enum_type_INTVAL);
        ((Hash *)VTABLE_get_pointer(interp, interp->code->const_table->string_hash))->compare =
            (hash_comp_fn)STRING_compare_distinct_cs_enc;

        interp->code->const_table->constants =
            mem_gc_allocate_n_zeroed_typed(interp, newcount, PackFile_Constant *);
    }

    interp->code->const_table->constants[oldcount] = new_constant;
    interp->code->const_table->const_count         = newcount;

    return oldcount;
}


/*

=item C<static int add_const_table_pmc(PARROT_INTERP, PMC *pmc)>

Adds a PMC to the const table, returning its position.

=cut

*/

static int
add_const_table_pmc(PARROT_INTERP, ARGIN(PMC *pmc))
{
    ASSERT_ARGS(add_const_table_pmc)
    const int newitem = add_const_table(interp);
    PackFile_Constant * const constant = interp->code->const_table->constants[newitem];

    constant->type  = PFC_PMC;
    constant->u.key = pmc;

    return newitem;
}


/*

=item C<static int add_const_table_key(PARROT_INTERP, PMC *key)>

Adds a key to the const table, returning its position.

=cut

*/

static int
add_const_table_key(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(add_const_table_key)
    const int newitem = add_const_table(interp);
    PackFile_Constant * const constant = interp->code->const_table->constants[newitem];

    constant->type  = PFC_KEY;
    constant->u.key = key;

    return newitem;
}


/*

=item C<int e_pbc_open(PARROT_INTERP, const char *param)>

Opens a compilation unit to emit PBC.

=cut

*/

int
e_pbc_open(PARROT_INTERP, SHIM(const char *param))
{
    ASSERT_ARGS(e_pbc_open)
    code_segment_t * const cs = mem_gc_allocate_zeroed_typed(interp, code_segment_t);

    if (!IMCC_INFO(interp)->globals)
        IMCC_INFO(interp)->globals = mem_gc_allocate_zeroed_typed(interp, imcc_globals);

    if (IMCC_INFO(interp)->globals->cs)
        clear_sym_hash(&IMCC_INFO(interp)->globals->cs->key_consts);
    else {
        /* register cleanup code */
        Parrot_on_exit(interp, imcc_globals_destroy, NULL);
    }

    /* free previous cached key constants if any */
    create_symhash(interp, &cs->key_consts);

    cs->next     = NULL;
    cs->prev     = IMCC_INFO(interp)->globals->cs;
    cs->subs     = NULL;
    cs->first    = NULL;
    cs->jit_info = NULL;

    if (!IMCC_INFO(interp)->globals->first)
        IMCC_INFO(interp)->globals->first = cs;
    else
        cs->prev->next = cs;

    /* we need some segments */
    if (!interp->code) {
        const char *n    = IMCC_INFO(interp)->state->file;
        STRING     *name = Parrot_str_new(interp, n, strlen(n));
        PMC        *self;

        cs->seg = interp->code = PF_create_default_segs(interp, name, 1);

        /*
         * create a PMC constant holding the interpreter state
         *
         * see also ParrotInterpreter.thaw and .thawfinish
         * currently just HLL_info is saved/restored
         */
        self = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
                IGLOBALS_INTERPRETER);
        (void) add_const_table_pmc(interp, self);
    }

    IMCC_INFO(interp)->globals->cs = cs;

    return 0;
}

/*

=item C<static void make_new_sub(PARROT_INTERP, IMC_Unit *unit)>

Allocates a new globals->cs->subs structure.

=cut

*/

static void
make_new_sub(PARROT_INTERP, ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(make_new_sub)
    subs_t * const s = mem_gc_allocate_zeroed_typed(interp, subs_t);

    s->prev          = IMCC_INFO(interp)->globals->cs->subs;
    s->unit          = unit;
    s->pmc_const     = -1;

    if (IMCC_INFO(interp)->globals->cs->subs)
        IMCC_INFO(interp)->globals->cs->subs->next = s;

    if (!IMCC_INFO(interp)->globals->cs->first)
        IMCC_INFO(interp)->globals->cs->first = s;

    IMCC_INFO(interp)->globals->cs->subs = s;

    create_symhash(interp, &s->fixup);
}


/*

=item C<static int get_old_size(PARROT_INTERP, int *ins_line)>

Get the size/line of bytecode in ops to this point.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
get_old_size(PARROT_INTERP, ARGOUT(int *ins_line))
{
    ASSERT_ARGS(get_old_size)
    size_t size = 0;

    *ins_line   = 0;

    if (IMCC_INFO(interp)->globals->cs && interp->code->base.data) {
        const subs_t *s;
        for (s = IMCC_INFO(interp)->globals->cs->subs; s; s = s->prev) {
            size      += s->size;
            *ins_line += s->ins_line;
        }
    }

    return size;
}


/*

=item C<static void store_sub_size(PARROT_INTERP, size_t size, size_t ins_line)>

Sets the given size and line parameters for the current compilation unit.

=cut

*/

static void
store_sub_size(PARROT_INTERP, size_t size, size_t ins_line)
{
    ASSERT_ARGS(store_sub_size)
    IMCC_INFO(interp)->globals->cs->subs->size     = size;
    IMCC_INFO(interp)->globals->cs->subs->ins_line = ins_line;
}


/*

=item C<static void store_fixup(PARROT_INTERP, const SymReg *r, int pc, int
offset)>

Stores fixup information for the given register, program counter, and offset.

=cut

*/

static void
store_fixup(PARROT_INTERP, ARGIN(const SymReg *r), int pc, int offset)
{
    ASSERT_ARGS(store_fixup)
    SymReg * const fixup = _mk_address(interp,
            &IMCC_INFO(interp)->globals->cs->subs->fixup, r->name, U_add_all);

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

=item C<static void store_key_const(PARROT_INTERP, const char *str, int idx)>

Stores a constant key for the current compilation unit.

=cut

*/

static void
store_key_const(PARROT_INTERP, ARGIN(const char *str), int idx)
{
    ASSERT_ARGS(store_key_const)
    SymReg * const c =
        _mk_const(interp, &IMCC_INFO(interp)->globals->cs->key_consts, str, 0);
    c->color = idx;
}

/*

=item C<static size_t get_codesize(PARROT_INTERP, const IMC_Unit *unit, size_t
*src_lines)>

Stores globals for later fixup, returning the code size in number of ops.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
get_codesize(PARROT_INTERP, ARGIN(const IMC_Unit *unit), ARGOUT(size_t *src_lines))
{
    ASSERT_ARGS(get_codesize)
    Instruction *ins = unit->instructions;
    size_t       code_size;

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
            if (ins->opnum < 0)
                IMCC_fatal(interp, 1, "get_codesize: "
                        "no opnum ins#%d %I\n",
                        ins->index, ins);

            if (ins->opnum == PARROT_OP_set_p_pc) {
                /* set_p_pc opcode */
                IMCC_debug(interp, DEBUG_PBC_FIXUP, "PMC constant %s\n",
                        ins->symregs[1]->name);

                if (ins->symregs[1]->usage & U_FIXUP)
                    store_fixup(interp, ins->symregs[1], code_size, 2);
            }

            code_size += ins->opsize;
        }
        else if (ins->opsize)
            IMCC_fatal(interp, 1, "get_codesize: "
                    "non instruction with size found\n");
    }

    return code_size;
}


/*

=item C<static subs_t * find_global_label(PARROT_INTERP, const char *name, const
subs_t *sym, int *pc)>

Finds a global label, returning the symreg (and setting the (absolute) pc
through the out parameter).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t *
find_global_label(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(const subs_t *sym), ARGOUT(int *pc))
{
    ASSERT_ARGS(find_global_label)
    subs_t *s;

    *pc = 0;

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
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

=item C<static subs_t * find_sub_by_subid(PARROT_INTERP, const char *lookup,
const subs_t *sym, int *pc)>

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t *
find_sub_by_subid(PARROT_INTERP, ARGIN(const char *lookup),
    ARGIN(const subs_t *sym), ARGOUT(int *pc))
{
    ASSERT_ARGS(find_sub_by_subid)
    subs_t *s;
    UNUSED(sym);

    *pc = 0;

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
        const SymReg * const r = s->unit->instructions->symregs[0];

        /* if subid matches - ok */
        if (r && (r->subid && (strcmp(r->subid, lookup) == 0)))
            return s;

        *pc += s->size;
    }
    return NULL;
}

/*

=item C<static void fixup_globals(PARROT_INTERP)>

Fixes global information -- particularly locations of global symbols.

=cut

*/

static void
fixup_globals(PARROT_INTERP)
{
    ASSERT_ARGS(fixup_globals)
    subs_t *s;
    int     jumppc = 0;

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
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
                    s1 = find_sub_by_subid(interp, fixup->name, s, &pc);
                }
                else
                    s1 = find_global_label(interp, fixup->name, s, &pc);

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
                    SymReg * const nam = mk_const(interp, fixup->name,
                            fixup->type & VT_ENCODED ? 'U' : 'S');

                    const int op = interp->op_lib->op_code(interp, "find_sub_not_null_p_sc", 1);
                    PARROT_ASSERT(op);

                    interp->code->base.data[addr] = op;

                    if (nam->color < 0)
                        nam->color = add_const_str(interp, IMCC_string_from_reg(interp, nam));

                    interp->code->base.data[addr+2] = nam->color;

                    IMCC_debug(interp, DEBUG_PBC_FIXUP,
                            "fixup const PMC"
                            " find_name sub '%s' const nr: %d\n",
                            fixup->name, nam->color);
                    continue;
                }

                pmc_const = s1->pmc_const;

                if (pmc_const < 0) {
                    IMCC_fatal(interp, 1, "fixup_globals: "
                            "couldn't find sub 2 '%s'\n", fixup->name);
                }

                interp->code->base.data[addr+fixup->offset] = pmc_const;
                IMCC_debug(interp, DEBUG_PBC_FIXUP, "fixup const PMC"
                        " sub '%s' const nr: %d\n", fixup->name, pmc_const);

                continue;
            }
        }

        jumppc += s->size;
    }
}


/*

=item C<STRING * IMCC_string_from_reg(PARROT_INTERP, const SymReg *r)>

Creates and returns a constant STRING, given a stringish SymReg.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
IMCC_string_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
{
    ASSERT_ARGS(IMCC_string_from_reg)
    char *buf = r->name;

    if (r->type & VT_ENCODED) {
        /*
         * the lexer parses:   foo:"string"
         * get first part as charset, rest as string
         */
        STRING     *s;
        const CHARSET *s_charset;
        const ENCODING *s_encoding = NULL;
        const ENCODING *src_encoding;
        const char *charset;
        #define MAX_NAME 31
        char charset_name[MAX_NAME + 1];
        char encoding_name[MAX_NAME + 1];
        char * p = strchr(r->name, '"');
        char * p2 = strchr(r->name, ':');
        PARROT_ASSERT(p && p[-1] == ':');
        if (p2 < p -1) {
            strncpy(encoding_name, buf, p2 - buf);
            encoding_name[p2-buf] = '\0';
            strncpy(charset_name, p2 +1, p - p2 - 2);
            charset_name[p- p2 - 2] = '\0';
            /*fprintf(stderr, "%s:%s\n", charset_name, encoding_name);*/
            s_charset = Parrot_find_charset(interp, charset_name);
            if (s_charset == NULL)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_STRING_REPRESENTATION,
                        "Unknown charset '%s'", charset_name);
            s_encoding = Parrot_find_encoding(interp, encoding_name);
            if (s_encoding == NULL)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_STRING_REPRESENTATION,
                        "Unknown encoding '%s'", encoding_name);
        }
        else {
            strncpy(charset_name, buf, p - buf - 1);
            charset_name[p - buf - 1] = '\0';
            /*fprintf(stderr, "%s\n", charset_name);*/
            s_charset = Parrot_find_charset(interp, charset_name);
            if (s_charset == NULL)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_STRING_REPRESENTATION,
                        "Unknown charset '%s'", charset_name);
        }
        if (strcmp(charset_name, "unicode") == 0)
            src_encoding = Parrot_utf8_encoding_ptr;
        else
            src_encoding = Parrot_fixed_8_encoding_ptr;
        if (s_encoding == NULL)
            s_encoding = src_encoding;

        /* past delim */
        buf     = p + 1;
        if (strcmp(charset_name, "unicode") == 0 && strcmp(encoding_name, "utf8") == 0) {
            /* Special case needed for backward compatibility with utf8 literals
             * using \xHH\xHH byte sequences */
            s = Parrot_str_unescape(interp, buf, '"', "utf8:unicode");
        }
        else {
            p       = buf;
            p2      = strchr(buf, '"');
            while (p2 != NULL) {
               p  = p2;
               p2 = strchr(p + 1, '"');
            }
            {
                STRING * aux = Parrot_str_new_init(interp, buf, p - buf,
                        src_encoding, s_charset, 0);
                s = Parrot_str_unescape_string(interp, aux,
                        s_charset, s_encoding, PObj_constant_FLAG);
                if (!CHARSET_VALIDATE(interp, s))
                       Parrot_ex_throw_from_c_args(interp, NULL,
                               EXCEPTION_INVALID_STRING_REPRESENTATION,
                               "Malformed string");
            }
        }
        return s;
    }
    else if (*buf == '"') {
        buf++;
        return Parrot_str_unescape(interp, buf, '"', NULL);
    }
    else if (*buf == '\'') {   /* TODO handle python raw strings */
        buf++;
        return string_make(interp, buf, strlen(buf) - 1, "ascii",
                PObj_constant_FLAG);
    }

    /* unquoted bare name - ASCII only don't unescape it */
    return string_make(interp, buf, strlen(buf), "ascii", PObj_constant_FLAG);
}

/*

=item C<STRING * IMCC_string_from__STRINGC(PARROT_INTERP, char *buf)>

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
IMCC_string_from__STRINGC(PARROT_INTERP, ARGIN(char *buf))
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
        buf     = p + 1;
        s       = Parrot_str_unescape(interp, buf, '"', charset);

        /* restore colon, as we may reuse this string */
        p[-1] = ':';
        return s;
    }
    else if (*buf == '"') {
        buf++;
        return Parrot_str_unescape(interp, buf, '"', NULL);
    }
    else if (*buf == '\'') {
        buf++;
        return string_make(interp, buf, strlen(buf) - 1, "ascii", PObj_constant_FLAG);
    }
    else {
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "Unknown STRING format: '%s'\n", buf);
    }
}


/*

=item C<static int add_const_str(PARROT_INTERP, STRING *s)>

Adds a constant string to constant_table.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
add_const_str(PARROT_INTERP, ARGIN(STRING *s))
{
    ASSERT_ARGS(add_const_str)

    PMC *s_pmc = key_new_string(interp, s);
    PackFile_ConstTable *table = interp->code->const_table;
    int i = PackFile_ConstTable_rlookup(interp, table, s_pmc, PFC_STRING);

    if (i >= 0)
        return i;


    /* otherwise... */
    {
        int                k        = add_const_table(interp);
        PackFile_Constant *constant = table->constants[k];
        constant->type              = PFC_STRING;
        constant->u.string          = s;

        VTABLE_set_integer_keyed_str(interp, table->string_hash, s, k);

        return k;
    }
}


/*

=item C<static int add_const_num(PARROT_INTERP, const char *buf)>

Adds a constant num to constant_table.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
add_const_num(PARROT_INTERP, ARGIN_NULLOK(const char *buf))
{
    ASSERT_ARGS(add_const_num)
    const int      k = add_const_table(interp);
    STRING * const s = Parrot_str_new(interp, buf, 0);

    PackFile_Constant * const constant = interp->code->const_table->constants[k];

    constant->type     = PFC_NUMBER;
    constant->u.number = Parrot_str_to_num(interp, s);

    return k;
}


/*

=item C<static PMC* mk_multi_sig(PARROT_INTERP, const SymReg *r)>

Creates and returns a multi-signature PMC given a SymReg.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC*
mk_multi_sig(PARROT_INTERP, ARGIN(const SymReg *r))
{
    ASSERT_ARGS(mk_multi_sig)
    PackFile_ConstTable *ct;
    PMC                 *multi_sig;
    pcc_sub_t * const    pcc_sub = r->pcc_sub;
    const INTVAL         n       = pcc_sub->nmulti;
    INTVAL               i;

    /* a :multi sub with no arguments */
    if (!pcc_sub->multi[0])
        return Parrot_pmc_new(interp, enum_class_FixedIntegerArray);

    multi_sig = Parrot_pmc_new_init_int(interp, enum_class_FixedPMCArray, n);
    ct        = interp->code->const_table;

    for (i = 0; i < n; ++i) {
        /* multi[i] can be a Key too -
         * store PMC constants instead of bare strings */
        PMC *sig_pmc;
        r = pcc_sub->multi[i];

        if (r->set == 'S') {
            STRING * const type_name = ct->constants[r->color]->u.string;
            const INTVAL type_num    = Parrot_pmc_get_type_str(interp, type_name);

            if (type_num == enum_type_undef) {
                sig_pmc = Parrot_pmc_new(interp, enum_class_String);
                VTABLE_set_string_native(interp, sig_pmc, type_name);
            }
            else
                sig_pmc = Parrot_pmc_new_init_int(interp,
                        enum_class_Integer, type_num);
        }
        else {
            PARROT_ASSERT(r->set == 'K');
            sig_pmc = ct->constants[r->color]->u.key;
        }

        VTABLE_set_pmc_keyed_int(interp, multi_sig, i, sig_pmc);
    }

    return multi_sig;
}


typedef void (*decl_func_t)(Interp *, PMC *, STRING *, INTVAL);

/*

=item C<static PMC* create_lexinfo(PARROT_INTERP, IMC_Unit *unit, PMC *sub_pmc,
int need_lex)>

Creates and returns a new LexInfo PMC for all lexicals in the given sub in the
current compilation unit.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
create_lexinfo(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(PMC *sub_pmc),
               int need_lex)
{
    ASSERT_ARGS(create_lexinfo)
    PMC                *lex_info    = NULL;
    SymHash            *hsh         = &unit->hash;
    PackFile_Constant **constants   = interp->code->const_table->constants;
    const INTVAL        lex_info_id = Parrot_get_ctx_HLL_type(interp,
                                        enum_class_LexInfo);
    unsigned int        i;

    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        for (r = hsh->data[i]; r; r = r->next) {
            if (r->set == 'P' && r->usage & U_LEXICAL) {
                SymReg *n;
                if (!lex_info) {
                    lex_info = Parrot_pmc_new_noinit(interp, lex_info_id);
                    VTABLE_init_pmc(interp, lex_info, sub_pmc);
                }

                /* at least one lexical name */
                n = r->reg;
                PARROT_ASSERT(n);

                while (n) {
                    STRING     *lex_name;
                    const int   k = n->color;
                    Parrot_Sub_attributes *sub;
                    PARROT_ASSERT(k >= 0);

                    lex_name = constants[k]->u.string;
                    PARROT_ASSERT(PObj_is_string_TEST(lex_name));

                    PMC_get_sub(interp, sub_pmc, sub);
                    IMCC_debug(interp, DEBUG_PBC_CONST,
                            "add lexical '%s' to sub name '%Ss'\n",
                            n->name, sub->name);

                    if (VTABLE_exists_keyed_str(interp, lex_info, lex_name))
                        IMCC_fataly(interp, EXCEPTION_INVALID_OPERATION,
                            "Multiple declarations of lexical '%S'\n", lex_name);

                    VTABLE_set_integer_keyed_str(interp, lex_info,
                            lex_name, r->color);

                    /* next possible name */
                    n = n->reg;
                }
            }
        }
    }

    if (!lex_info && (unit->outer || need_lex)) {
        lex_info = Parrot_pmc_new_noinit(interp, lex_info_id);
        VTABLE_init_pmc(interp, lex_info, sub_pmc);
    }

    return lex_info;
}


/*

=item C<static PMC* find_outer(PARROT_INTERP, const IMC_Unit *unit)>

Returns any :outer sub for the current compilation unit.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
find_outer(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
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

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
        if (STREQ(s->unit->subid->name, unit->outer->name)) {
            PObj_get_FLAGS(s->unit->sub_pmc) |= SUB_FLAG_IS_OUTER;
            return s->unit->sub_pmc;
        }
    }

    /* could be eval too; check if :outer is the current sub */
    current = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));

    if (PMC_IS_NULL(current))
        IMCC_fatal(interp, 1, "Undefined :outer sub '%s'.\n",
                   unit->outer->name);

    PMC_get_sub(interp, current, sub);

    cur_name_str = Parrot_str_to_cstring(interp,  sub->name);
    if (strlen(cur_name_str) == len
    && (memcmp(cur_name_str, unit->outer->name, len) == 0)) {
        Parrot_str_free_cstring(cur_name_str);
        return current;
    }
    Parrot_str_free_cstring(cur_name_str);
    return NULL;
}


/*

=item C<static int add_const_pmc_sub(PARROT_INTERP, SymReg *r, size_t offs,
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
add_const_pmc_sub(PARROT_INTERP, ARGMOD(SymReg *r), size_t offs, size_t end)
{
    ASSERT_ARGS(add_const_pmc_sub)
    PMC                   *ns_pmc;
    PMC                   *sub_pmc;
    Parrot_Sub_attributes *sub, *outer_sub;

    PackFile_ConstTable * const ct    = interp->code->const_table;
    IMC_Unit            * const unit  =
        IMCC_INFO(interp)->globals->cs->subs->unit;

    int                  i;
    int                  ns_const = -1;

    if (unit->_namespace) {
        SymReg     * const ns = unit->_namespace->reg;

        /* strip namespace off from front */

        static const char ns_sep[] = "@@@";
        char *real_name = strstr(r->name, ns_sep);
        if (real_name) {
            /* Unfortunately, there is no strrstr, then iterate until last */
            char *aux = strstr(real_name + 3, ns_sep);
            while (aux) {
                 real_name = aux;
                aux = strstr(real_name + 3, ns_sep);
            }
            real_name += 3;
        }

        IMCC_debug(interp, DEBUG_PBC_CONST,
                "name space const = %d ns name '%s'\n", ns->color, ns->name);

        ns_const  = ns->color;

        if (real_name) {
            char * const p = mem_sys_strdup(real_name);
            mem_sys_free(r->name);
            r->name = p;
        }
    }

    /* Do we have to create an instance of a specific type for this sub? */
    if (unit->instance_of) {
        /* Look it up as a class and as a PMC type. */
        STRING * const classname = Parrot_str_new(interp,
                unit->instance_of + 1, strlen(unit->instance_of) - 2);

        PMC * const classobj = Parrot_oo_get_class_str(interp, classname);

        if (!PMC_IS_NULL(classobj))
            sub_pmc = VTABLE_instantiate(interp, classobj, PMCNULL);
        else {
            const INTVAL type = Parrot_pmc_get_type_str(interp, classname);
            if (type <= 0)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NO_CLASS,
                    "Class '%Ss' specified in :instanceof(...) not found",
                    classname);
            sub_pmc = Parrot_pmc_new(interp, type);
        }
    }
    else {
        /* use a possible type mapping for the Sub PMCs, and create it */
        const INTVAL type = Parrot_get_ctx_HLL_type(interp,
                                r->pcc_sub->yield ? enum_class_Coroutine : enum_class_Sub);

        /* TODO create constant - see also src/packfile.c */
        sub_pmc = Parrot_pmc_new(interp, type);
    }

    /* Set flags and get the sub info. */
    PObj_get_FLAGS(sub_pmc) |= (r->pcc_sub->pragma & SUB_FLAG_PF_MASK);
    PMC_get_sub(interp, sub_pmc, sub);
    Sub_comp_get_FLAGS(sub) |= (r->pcc_sub->pragma & SUB_COMP_FLAG_MASK);

    r->color  = add_const_str(interp, IMCC_string_from_reg(interp, r));
    sub->name = ct->constants[r->color]->u.string;

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
        unit->subid->color = add_const_str(interp, IMCC_string_from_reg(interp, unit->subid));
    }

    sub->subid = ct->constants[unit->subid->color]->u.string;
    ns_pmc     = NULL;

    if (ns_const >= 0 && ns_const < ct->const_count) {
        switch (ct->constants[ns_const]->type) {
          case PFC_KEY:
            ns_pmc = ct->constants[ns_const]->u.key;
            break;
          case PFC_STRING:
            ns_pmc = Parrot_pmc_new_constant(interp, enum_class_String);
            VTABLE_set_string_native(interp, ns_pmc, ct->constants[ns_const]->u.string);
            break;
          default:
            break;
        }
    }

    sub->namespace_name = ns_pmc;
    sub->start_offs     = offs;
    sub->end_offs       = end;
    sub->HLL_id         = Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp));

    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = unit->n_regs_used[i];

    sub->lex_info     = create_lexinfo(interp, unit, sub_pmc,
            r->pcc_sub->pragma & P_NEED_LEX);
    sub->outer_sub    = find_outer(interp, unit);
    sub->vtable_index = -1;

    /* check if it's declared multi */
    if (r->pcc_sub->nmulti)
        sub->multi_signature = mk_multi_sig(interp, r);
    else
        sub->multi_signature = NULL;

    if (unit->is_vtable_method == 1) {
        STRING *vtable_name;
        INTVAL  vtable_index;

        /* Work out the name of the vtable function. */
        if (unit->vtable_name) {
            vtable_name = Parrot_str_new(interp, unit->vtable_name + 1,
                    strlen(unit->vtable_name) - 2);
            UNIT_FREE_CHAR(unit->method_name);
        }
        else
            vtable_name = sub->name;

        /* Check this is a valid vtable function to override. */
        vtable_index = Parrot_get_vtable_index(interp, vtable_name);

        if (vtable_index == -1)
            IMCC_fatal(interp, 1,
                "'%S' is not a vtable, but was used with :vtable.\n",
                vtable_name);

        /* TODO check for duplicates */
        sub->vtable_index = vtable_index;
    }

    if (unit->is_method == 1) {
        /* Work out the name of the method. */
        if (unit->method_name) {
            sub->method_name = IMCC_string_from__STRINGC(interp, unit->method_name);
            UNIT_FREE_CHAR(unit->method_name);
        }
        else
            sub->method_name = sub->name;
    }
    else
        sub->method_name = Parrot_str_new(interp, "", 0);


    if (unit->has_ns_entry_name == 1) {
        /* Work out the name of the ns entry. */
        if (unit->ns_entry_name) {
            sub->ns_entry_name = IMCC_string_from__STRINGC(interp, unit->ns_entry_name);
            UNIT_FREE_CHAR(unit->ns_entry_name);
        }
        else
            sub->ns_entry_name = sub->name;
    }
    else
        sub->ns_entry_name = sub->name;

    Parrot_store_sub_in_namespace(interp, sub_pmc);

    if (sub->outer_sub)
        PMC_get_sub(interp, sub->outer_sub, outer_sub);

    /*
     * store the sub's strings
     * XXX these need to occur before the sub to support thawing properly
     */
    {
        PMC *strings = Parrot_freeze_strings(interp, sub_pmc);
        int n = VTABLE_elements(interp, strings);
        for (i = 0; i < n; i++) {
            int unused = add_const_str(interp, VTABLE_get_string_keyed_int(interp, strings, i));
        }
    }

    /* store the sub */
    {
        const int            k            = add_const_table(interp);
        PackFile_Constant   * const pfc   = ct->constants[k];

        pfc->type     = PFC_PMC;
        pfc->u.key    = sub_pmc;
        unit->sub_pmc = sub_pmc;

        IMCC_INFO(interp)->globals->cs->subs->pmc_const = k;

        IMCC_debug(interp, DEBUG_PBC_CONST,
                "add_const_pmc_sub '%s' flags %x color %d (%Ss) "
                "lex_info %s :outer(%Ss)\n",
                r->name, r->pcc_sub->pragma, k,
                sub_pmc->vtable->whoami,
                sub->lex_info ? "yes" : "no",
                sub->outer_sub? outer_sub->name :
                Parrot_str_new(interp, "*none*", 0));

        /*
         * create entry in our fixup (=symbol) table
         * the offset is the index in the constant table of this Sub
         */
        PackFile_FixupTable_new_entry(interp, r->name, enum_fixup_sub, k);

        return k;
    }
}


/*

=item C<static int add_const_key(PARROT_INTERP, const opcode_t *key, int size,
const char *s_key)>

Adds a constant key to constant_table.

=cut

*/

static int
add_const_key(PARROT_INTERP, ARGIN(const opcode_t *key), int size, ARGIN(const char *s_key))
{
    ASSERT_ARGS(add_const_key)
    const SymReg * const r =
        _get_sym(&IMCC_INFO(interp)->globals->cs->key_consts, s_key);
    const opcode_t      *rc;
    PackFile_Constant   *pfc;
    int                  k;

    if (r)
        return r->color;

    pfc = mem_gc_allocate_typed(interp, PackFile_Constant);
    rc  = PackFile_Constant_unpack_key(interp,
            interp->code->const_table, pfc, key);

    if (!rc) {
        mem_sys_free(pfc);
        IMCC_fatal(interp, 1,
            "add_const_key: PackFile_Constant error\n");
    }

    k = add_const_table_key(interp, pfc->u.key);

    store_key_const(interp, s_key, k);

    IMCC_debug(interp, DEBUG_PBC_CONST, "\t=> %s #%d size %d\n",
               s_key, k, size);

    IMCC_debug(interp, DEBUG_PBC_CONST, "\t %x /%x %x/ /%x %x/\n",
               key[0], key[1], key[2], key[3], key[4]);

    mem_sys_free(pfc);

    return k;
}


/*

=item C<static opcode_t build_key(PARROT_INTERP, SymReg *key_reg)>

Builds a Key PMC from the given SymReg.

Color is a Parrot register number or a constant table index.  For the rest,
please consult PDD08_KEYS(1).  Additionally, I build a string representation of
the key, which gets cached in the globals.keys.

=cut

*/

static opcode_t
build_key(PARROT_INTERP, ARGIN(SymReg *key_reg))
{
    ASSERT_ARGS(build_key)
#define MAX_KEY_LEN 10
#define MAX_KEYNAME_LEN 20
    SymReg   *reg = key_reg->set == 'K' ? key_reg->nextkey : key_reg;

    char      s_key[MAX_KEY_LEN * MAX_KEYNAME_LEN];
    opcode_t  key[MAX_KEY_LEN * 2 + 1];
    opcode_t  size;
    int       key_length = 0;     /* P0["hi;there"; S0; 2] has length 3 */
    int       k;

    /* 0 is length */
    opcode_t *pc = key + 1;

    /* stringified key */
    char     *s  = s_key;

    *s           = 0;

    for (key_length = 0; reg ; reg = reg->nextkey, key_length++) {
        SymReg *r = reg;
        int     type;

        if (key_length >= MAX_KEY_LEN)
            IMCC_fatal(interp, 1, "build_key:"
                    "Key too long, increase MAX_KEY_LEN.\n");

        /* if key is a register, the original sym is in r->reg */
        type = r->type;

        if (r->reg)
            r = r->reg;

        switch (type) {
          case VTIDENTIFIER:       /* P[S0] */
          case VTPASM:             /* P[S0] */
          case VTREG:              /* P[S0] */
            if (r->set == 'I')
                *pc++ = PARROT_ARG_I;    /* register type */
            else if (r->set == 'S')
                *pc++ = PARROT_ARG_S;
            else
                IMCC_fatal(interp, 1, "build_key: wrong register set\n");

            /* don't emit mapped regs in key parts */
            if (r->color < 0)
                *pc++ = -1 - r->color;
            else
                *pc++ = r->color;

            sprintf(s+strlen(s), "%c%d", r->set, (int)r->color);

            IMCC_debug(interp, DEBUG_PBC_CONST,
                    " keypart reg %s %c%d\n",
                    r->name, r->set, (int)r->color);
            break;
          case VT_CONSTP:
          case VTCONST:
          case VTCONST|VT_ENCODED:
            switch (r->set) {
              case 'S':                       /* P["key"] */
                /* str constant */
                *pc++ = PARROT_ARG_SC;

                /* constant idx */
                *pc++ = r->color;

                IMCC_debug(interp, DEBUG_PBC_CONST,
                        " keypart SC %s #%d\n",
                        r->name, r->color);
                break;
              case 'I':                       /* P[;42;..] */
                /* int constant */
                *pc++ = PARROT_ARG_IC;

                /* value */
                *pc++ = r->color = atol(r->name);

                IMCC_debug(interp, DEBUG_PBC_CONST,
                        " keypart IC %s #%d\n",
                        r->name, r->color);
                break;
              default:
                IMCC_fatal(interp, 1, "build_key: unknown set\n");
            }
            sprintf(s+strlen(s), "%cc" INTVAL_FMT, r->set, r->color);
            break;
          default:
            IMCC_fatal(interp, 1, "build_key: "
                    "unknown type 0x%x on %s\n", type, r->name);
        }
    }

    key[0] = key_length;
    size   = pc - key;

    /* now we have a packed key, which packfile can work on */
    /* XXX endianess? probably no, we pack/unpack on the very
     * same computer */
    k      = add_const_key(interp, key, size, s_key);

    /* single 'S' keys already have their color assigned */
    if (key_reg->set == 'K')
        key_reg->color = k;

    return k;
}


/*

=item C<INTVAL IMCC_int_from_reg(PARROT_INTERP, const SymReg *r)>

Creates and returns an INTEGER given an integer-like SymReg.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
IMCC_int_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
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
        IMCC_fatal(interp, 1, "add_1_const:" "Integer overflow '%s'", r->name);

    return i;
}

/*

=item C<static void init_fixedintegerarray_from_string(PARROT_INTERP, PMC *p,
STRING *s)>

Initializes the passed FIA from a string representation I<"(el0, el1, ...)">.

=cut

*/

static void
init_fixedintegerarray_from_string(PARROT_INTERP, ARGIN(PMC *p), ARGIN(STRING *s))
{
    ASSERT_ARGS(init_fixedintegerarray_from_string)
    INTVAL  n, elem, i, l;
    char   *src, *chr, *start;
    int     base;

    if (s->encoding != Parrot_fixed_8_encoding_ptr)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "unhandled string encoding in FixedIntegerArray initialization");

    l = Parrot_str_byte_length(interp, s);

    if (!l)
        return;

    chr = src = Parrot_str_to_cstring(interp, s);

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
    VTABLE_set_integer_native(interp, p, n + 1);

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
            VTABLE_set_integer_keyed_int(interp, p, n, elem);
            break;
        }
    }

    Parrot_str_free_cstring(src);

}

/*

=item C<static void make_pmc_const(PARROT_INTERP, SymReg *r)>

Creates a constant PMC, given a SymReg.

=cut

*/

static void
make_pmc_const(PARROT_INTERP, ARGMOD(SymReg *r))
{
    ASSERT_ARGS(make_pmc_const)
    PMC    * const _class = interp->vtables[r->pmc_type]->pmc_class;
    STRING *s;
    PMC    *p;

    if (PMC_IS_NULL(_class))
        IMCC_fatal(interp, 1, "make_pmc_const: no such pmc");

    if (*r->name == '"')
        s = Parrot_str_unescape(interp, r->name + 1, '"', NULL);

    else if (*r->name == '\'')
        s = Parrot_str_unescape(interp, r->name + 1, '\'', NULL);

    else
        s = Parrot_str_unescape(interp, r->name, 0, NULL);

    p  = Parrot_pmc_new_constant(interp, r->pmc_type);

    switch (r->pmc_type) {
      case enum_class_Integer:
        VTABLE_set_integer_native(interp, p, Parrot_str_to_int(interp, s));
        break;
      case enum_class_Float:
        VTABLE_set_number_native(interp, p, Parrot_str_to_num(interp, s));
        break;
      case enum_class_String:
        VTABLE_set_string_native(interp, p, s);
        break;
      case enum_class_FixedIntegerArray:
        init_fixedintegerarray_from_string(interp, p, s);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION,
            "Can't generate PMC constant for this type.");
    }

    /* append PMC constant */
    r->color = add_const_table_pmc(interp, p);
}


/*

=item C<static void add_1_const(PARROT_INTERP, SymReg *r)>

Adds a constant SymReg to the constant table, depending on its type.

=cut

*/

static void
add_1_const(PARROT_INTERP, ARGMOD(SymReg *r))
{
    ASSERT_ARGS(add_1_const)
    if (r->color >= 0)
        return;

    if (r->use_count <= 0)
        return;

    switch (r->set) {
      case 'I':
        r->color = IMCC_int_from_reg(interp, r);
        break;
      case 'S':
        if (r->type & VT_CONSTP)
            r = r->reg;
        r->color = add_const_str(interp, IMCC_string_from_reg(interp, r));
        break;
      case 'N':
        r->color = add_const_num(interp, r->name);
        break;
      case 'K':
        {
            SymReg *key = r;

            for (r = r->nextkey; r; r = r->nextkey)
                if (r->type & VTCONST)
                    add_1_const(interp, r);
                build_key(interp, key);
        }
        break;
      case 'P':
        make_pmc_const(interp, r);
        IMCC_debug(interp, DEBUG_PBC_CONST,
                    "PMC const %s\tcolor %d\n", r->name, r->color);
        break;
      default:
        break;
    }

    if (r)
        IMCC_debug(interp, DEBUG_PBC_CONST, "const %s\tcolor %d use_count %d\n",
                r->name, r->color, r->use_count);
}


/*

=item C<static void constant_folding(PARROT_INTERP, const IMC_Unit *unit)>

Stores a constant's idx for later reuse.

=cut

*/

static void
constant_folding(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
{
    ASSERT_ARGS(constant_folding)
    const SymHash *hsh = &IMCC_INFO(interp)->ghash;
    unsigned int   i;

    /* go through all consts of current sub */
    for (i = 0; i < hsh->size; i++) {
        SymReg *r;

        /* normally constants are in ghash ... */
        for (r = hsh->data[i]; r; r = r->next) {
            if (r->type & (VTCONST|VT_CONSTP))
                add_1_const(interp, r);

            if (r->usage & U_LEXICAL) {
                SymReg *n = r->reg;

                /* r->reg is a chain of names for the same lex sym */
                while (n) {
                    /* lex_name */
                    add_1_const(interp, n);
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
                add_1_const(interp, r);
        }
    }

    /* and finally, there may be an outer Sub */
    if (unit->outer)
        add_1_const(interp, unit->outer);
}


/*

=item C<int e_pbc_new_sub(PARROT_INTERP, void *param, IMC_Unit *unit)>

Starts a new PBC emitting of a compilation unit, if the given compilation unit
has any instructions.

=cut

*/

int
e_pbc_new_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(e_pbc_new_sub)
    if (!unit->instructions)
        return 0;

    /* we start a new compilation unit */
    make_new_sub(interp, unit);

    return 0;
}

/*

=item C<int e_pbc_end_sub(PARROT_INTERP, void *param, IMC_Unit *unit)>

Finishes the PBC emitting of a given compilation unit.

=cut

*/

int
e_pbc_end_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
{
    ASSERT_ARGS(e_pbc_end_sub)
    Instruction *ins;
    int          pragma;

    if (!unit->instructions)
        return 0;

    /*
     * if the sub was marked IMMEDIATE, we run it now
     * This is *dangerous*: all possible global state can be messed
     * up, e.g. when that sub starts loading bytecode
     */
    ins   = unit->instructions;

    /* we run only PCC subs */
    if (!ins->symregs[0] || !ins->symregs[0]->pcc_sub)
        return 0;

    pragma = ins->symregs[0]->pcc_sub->pragma;

    if (IMCC_INFO(interp)->write_pbc && !(pragma & P_ANON))
        return 0;

    if (pragma & P_IMMEDIATE
    && (!IMCC_INFO(interp)->write_pbc || (pragma & P_ANON))) {
        /* clear global symbols temporarily -- TT #1324, for example */
        imcc_globals *g      = IMCC_INFO(interp)->globals;
        SymHash       ghash;

        IMCC_INFO(interp)->globals  = NULL;

        memmove(&ghash, &IMCC_INFO(interp)->ghash, sizeof (SymHash));
        memset(&IMCC_INFO(interp)->ghash, 0, sizeof (SymHash));

        IMCC_debug(interp, DEBUG_PBC, "immediate sub '%s'",
                ins->symregs[0]->name);
        PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);

        IMCC_INFO(interp)->globals  = g;
        memmove(&IMCC_INFO(interp)->ghash, &ghash, sizeof (SymHash));
    }

    return 0;
}


/*

=item C<static void verify_signature(PARROT_INTERP, const Instruction *ins,
opcode_t *pc)>

Checks if any get_ argument contains constants and fills in type bits for
argument types and constants, if missing.

=cut

*/

static void
verify_signature(PARROT_INTERP, ARGIN(const Instruction *ins), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(verify_signature)
    PMC    *changed_sig    = NULL;
    PMC    * const sig_arr = interp->code->const_table->constants[pc[-1]]->u.key;
    int     needed         = 0;
    int     no_consts      = (ins->opnum == PARROT_OP_get_results_pc
                           || ins->opnum == PARROT_OP_get_params_pc);

    INTVAL  i, n;

    PARROT_ASSERT(PObj_is_PMC_TEST(sig_arr));
    PARROT_ASSERT(sig_arr->vtable->base_type == enum_class_FixedIntegerArray);

    n = VTABLE_elements(interp, sig_arr);

    if (n != ins->symreg_count - 1)
        IMCC_fatal(interp, 1, "syntax error: parameter count mismatch in '%s'"
                              " -- have %d, want %d",
                              ins->opname, ins->symreg_count - 1, n);

    for (i = 0; i < n; ++i) {
        SymReg * const r   = ins->symregs[i + 1];
        INTVAL         sig = VTABLE_get_integer_keyed_int(interp, sig_arr, i);

        if (! (sig & PARROT_ARG_NAME)
         &&    no_consts && (r->type & VTCONST))
            IMCC_fatal(interp, 1, "e_pbc_emit: "
                    "constant argument '%s' in get param/result\n", r->name);

        if ((r->type & VTCONST) && !(sig & PARROT_ARG_CONSTANT)) {
            if (!changed_sig)
                changed_sig = VTABLE_clone(interp, sig_arr);

            sig |= PARROT_ARG_CONSTANT;

            VTABLE_set_integer_keyed_int(interp, changed_sig, i, sig);
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
                changed_sig = VTABLE_clone(interp, sig_arr);

            sig &= ~PARROT_ARG_TYPE_MASK;
            sig |= needed;

            VTABLE_set_integer_keyed_int(interp, changed_sig, i, sig);
        }
    }

    if (changed_sig) {
        /* append PMC constant */
        const int k = add_const_table_pmc(interp, changed_sig);
        pc[-1] = k;
    }
}


/*

=item C<int e_pbc_emit(PARROT_INTERP, void *param, const IMC_Unit *unit, const
Instruction *ins)>

Starts to emit code for one instruction.

=cut

*/

int
e_pbc_emit(PARROT_INTERP, SHIM(void *param), ARGIN(const IMC_Unit *unit),
        ARGIN(const Instruction *ins))
{
    ASSERT_ARGS(e_pbc_emit)
    int        ok = 0;
    int        op, i;

    /* first instruction, do initialisation ... */
    if (ins == unit->instructions) {
        size_t       ins_size;
        const size_t oldsize   = get_old_size(interp,
                                    &IMCC_INFO(interp)->ins_line);
        const size_t code_size = get_codesize(interp, unit, &ins_size);
        const size_t bytes     = (oldsize + code_size) * sizeof (opcode_t);

        IMCC_debug(interp, DEBUG_PBC, "code_size(ops) %d  oldsize %d\n",
                code_size, oldsize);

        constant_folding(interp, unit);
        store_sub_size(interp, code_size, ins_size);

        /* allocate code */
        interp->code->base.data       = (opcode_t *)
            mem_sys_realloc(interp->code->base.data, bytes);

        /* reallocating this removes its mmaped-ness; needs encapsulation */
        interp->code->base.pf->is_mmap_ped = 0;

        interp->code->base.size       = oldsize + code_size;

        IMCC_INFO(interp)->pc  = (opcode_t *)interp->code->base.data + oldsize;
        IMCC_INFO(interp)->npc = 0;

        /* FIXME length and multiple subs */
        IMCC_INFO(interp)->debug_seg  = Parrot_new_debug_seg(interp,
            interp->code,
            (size_t)IMCC_INFO(interp)->ins_line + ins_size + 1);

        Parrot_debug_add_mapping(interp, IMCC_INFO(interp)->debug_seg,
            IMCC_INFO(interp)->ins_line, unit->file);

        /* if item is a PCC_SUB entry then store it constants */
        if (ins->symregs[0] && ins->symregs[0]->pcc_sub) {
            add_const_pmc_sub(interp, ins->symregs[0], oldsize,
                              oldsize + code_size);
        }
        else {
            /* need a dummy to hold register usage */
            SymReg * const r = mk_sub_label(interp, "(null)");
            r->type          = VT_PCC_SUB;
            r->pcc_sub       = mem_gc_allocate_zeroed_typed(interp, pcc_sub_t);

            add_const_pmc_sub(interp, r, oldsize, oldsize + code_size);
        }
    }

    /* if this is not the first sub then store the sub */
    if (IMCC_INFO(interp)->npc && unit->pasm_file
    &&  ins->symregs[0]        && ins->symregs[0]->pcc_sub) {
        /* we can only set the offset for PASM code */
        add_const_pmc_sub(interp, ins->symregs[0], IMCC_INFO(interp)->npc,
            IMCC_INFO(interp)->npc);
    }

    if (ins->opname && strcmp(ins->opname, ".annotate") == 0) {
        /* It's an annotation. */
        int annotation_type;

        /* Add annotations seg if we're missing one. */
        if (!interp->code->annotations) {
            /* Create segment. "_ANN" is added to the name */
            STRING *name = Parrot_sprintf_c(interp, "%Ss_ANN", interp->code->base.name);
            int                        add  = interp->code->base.dir ? 1 : 0;
            PackFile_Directory * const dir  = add ? interp->code->base.dir :
                    &interp->initial_pf->directory;
            interp->code->annotations = (PackFile_Annotations *)
                    PackFile_Segment_new_seg(interp, dir,
                        PF_ANNOTATIONS_SEG, name, add);
            interp->code->annotations->code = interp->code;

            /* Create initial group. */
            PackFile_Annotations_add_group(interp, interp->code->annotations,
                    IMCC_INFO(interp)->pc - interp->code->base.data);
        }

        /* Add annotation. */
        switch (ins->symregs[1]->set) {
          case 'I':
            annotation_type = PF_ANNOTATION_KEY_TYPE_INT;
            break;
          case 'N':
            annotation_type = PF_ANNOTATION_KEY_TYPE_NUM;
            break;
          case 'S':
            annotation_type = PF_ANNOTATION_KEY_TYPE_STR;
            break;
          default:
            IMCC_fatal(interp, 1, "e_pbc_emit:"
                    "invalid type for annotation value\n");
        }
        PackFile_Annotations_add_entry(interp, interp->code->annotations,
                    IMCC_INFO(interp)->pc - interp->code->base.data,
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
                IMCC_fatal(interp, 1, "e_pbc_emit: "
                        "no label offset defined for '%s'\n", addr->name);

            last_label = addr->color - IMCC_INFO(interp)->npc;

            IMCC_debug(interp, DEBUG_PBC_FIXUP,
                "branch label at pc %d addr %d %s %d\n",
                IMCC_INFO(interp)->npc, addr->color, addr->name, last_label);
        }

        /* add debug line info */
        if (IMCC_INFO(interp)->debug_seg)
            IMCC_INFO(interp)->debug_seg->base.data[IMCC_INFO(interp)->ins_line++] =
                (opcode_t)ins->line;

        op = (opcode_t)ins->opnum;

        /* Start generating the bytecode */
        *(IMCC_INFO(interp)->pc)++   = op;

        /* Get the info for that opcode */
        op_info = &interp->op_info_table[op];

        IMCC_debug(interp, DEBUG_PBC, "%d %s", IMCC_INFO(interp)->npc,
            op_info->full_name);

        for (i = 0; i < op_info->op_count-1; i++) {
            switch (op_info->types[i]) {
              case PARROT_ARG_IC:
                /* branch instruction */
                if (op_info->labels[i]) {
                    if (last_label == 1)
                        /* we don't have a branch with offset 1 !? */
                        IMCC_fatal(interp, 1, "e_pbc_emit: "
                                    "no label offset found\n");
                    *(IMCC_INFO(interp)->pc)++      = last_label;
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

                *(IMCC_INFO(interp)->pc)++ = (opcode_t) r->color;
                IMCC_debug(interp, DEBUG_PBC, " %d", r->color);
                break;
              case PARROT_ARG_KC:
                r = ins->symregs[i];
                if (r->set == 'K') {
                    PARROT_ASSERT(r->color >= 0);
                    *(IMCC_INFO(interp)->pc)++ = r->color;
                }
                else {
                    *(IMCC_INFO(interp)->pc)++ = build_key(interp, r);
                }
                IMCC_debug(interp, DEBUG_PBC, " %d",
                        IMCC_INFO(interp)->pc[-1]);
                break;
              default:
                IMCC_fatal(interp, 1, "e_pbc_emit:"
                            "unknown argtype in parrot op\n");
                break;
            }
        }
        if (ins->opnum == PARROT_OP_set_args_pc
        ||  ins->opnum == PARROT_OP_get_results_pc
        ||  ins->opnum == PARROT_OP_get_params_pc
        ||  ins->opnum == PARROT_OP_set_returns_pc) {

            /* TODO get rid of verify_signature - PIR call sigs are already
             * fixed, but PASM still needs it */
            verify_signature(interp, ins, IMCC_INFO(interp)->pc);

            /* emit var_args part */
            for (; i < ins->opsize - 1; ++i) {
                r = ins->symregs[i];
                if (r->type & VT_CONSTP)
                    r = r->reg;
                *(IMCC_INFO(interp)->pc)++ = (opcode_t) r->color;
                IMCC_debug(interp, DEBUG_PBC, " %d", r->color);
            }
        }

        IMCC_debug(interp, DEBUG_PBC, "\t%I\n", ins);
        IMCC_INFO(interp)->npc += ins->opsize;
    }

    return ok;
}


/*

=item C<int e_pbc_close(PARROT_INTERP, void *param)>

Closes this PMC unit.

=cut

*/

int
e_pbc_close(PARROT_INTERP, SHIM(void *param))
{
    ASSERT_ARGS(e_pbc_close)
    fixup_globals(interp);

    return 0;
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
