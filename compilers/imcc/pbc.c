/*
 * Copyright (C) 2002-2008, The Perl Foundation.
 * $Id$
 */

#include "imc.h"
#include "pbc.h"
#include "parrot/packfile.h"

/* HEADERIZER HFILE: compilers/imcc/pbc.h */

/*

=head1 NAME

compilers/imcc/pbc.c

=head1 DESCRIPTION

emit imcc instructions into Parrot interpreter

the e_pbc_emit function is called per instruction

Notes:

I'm using existing data structures here (SymReg*) to store
various global items (currently only PMC constants).
The index in the constant table is in SymReg* ->color
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

static int add_const_pmc_sub(PARROT_INTERP,
    ARGMOD(SymReg *r),
    int offs,
    int end)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
static int add_const_str(PARROT_INTERP, ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int add_const_table(PARROT_INTERP)
        __attribute__nonnull__(1);

static int add_const_table_key(PARROT_INTERP, PMC *key)
        __attribute__nonnull__(1);

static int add_const_table_pmc(PARROT_INTERP, PMC *pmc)
        __attribute__nonnull__(1);

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
    ARGIN(PMC *sub),
    int need_lex)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t * find_global_label(
    PARROT_INTERP,
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

static void fixup_globals(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static int get_codesize(PARROT_INTERP,
    ARGIN(const IMC_Unit *unit),
    ARGOUT(int *src_lines))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*src_lines);

PARROT_WARN_UNUSED_RESULT
static int get_old_size(PARROT_INTERP, ARGOUT(int *ins_line))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ins_line);

static void imcc_globals_destroy(SHIM_INTERP,
    SHIM(int ex),
    SHIM(void *param));

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

PARROT_WARN_UNUSED_RESULT
static int old_blocks(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const char * slice_deb(int bits);

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

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#ifdef HAS_JIT

PARROT_WARN_UNUSED_RESULT
static int old_blocks(PARROT_INTERP)
        __attribute__nonnull__(1);

#endif /* HAS_JIT */

/*

=item C<static void imcc_globals_destroy>

RT #48260: Not yet documented!!!

=cut

*/

static void
imcc_globals_destroy(PARROT_INTERP, SHIM(int ex), SHIM(void *param))
{
    code_segment_t *cs = IMCC_INFO(interp)->globals->cs;

    while (cs) {
        subs_t         *s       = cs->subs;
        code_segment_t *prev_cs = cs->prev;

        while (s) {
            subs_t * const prev_s = s->prev;
            clear_sym_hash(&s->fixup);
            mem_sys_free(s);
            s      = prev_s;
        }

        clear_sym_hash(&cs->key_consts);
        mem_sys_free(cs);
        cs      = prev_cs;
    }

    IMCC_INFO(interp)->globals->cs = NULL;
}


/*

=item C<static int add_const_table>

Adds an empty item to constant table, returning its position.

=cut

*/

static int
add_const_table(PARROT_INTERP)
{
    const size_t oldcount = interp->code->const_table->const_count;
    const size_t newcount = oldcount + 1;

    /* Allocate a new constant */
    PackFile_Constant * new_constant = PackFile_Constant_new(interp);

    /* Update the constant count and reallocate */
    if (interp->code->const_table->constants) {
        interp->code->const_table->constants =
            (PackFile_Constant **)mem_sys_realloc(interp->code->const_table->constants,
                newcount * sizeof (PackFile_Constant *));
    }
    else {
        interp->code->const_table->constants =
            (PackFile_Constant **)mem_sys_allocate(newcount * sizeof (PackFile_Constant *));
    }

    interp->code->const_table->constants[oldcount] = new_constant;
    interp->code->const_table->const_count         = newcount;

    return oldcount;
}


/*

=item C<static int add_const_table_pmc>

Adds a PMC to the const table, returning its position.

=cut

*/

static int
add_const_table_pmc(PARROT_INTERP, PMC *pmc)
{
    int newitem = add_const_table(interp);

    interp->code->const_table->constants[newitem]->type  = PFC_PMC;
    interp->code->const_table->constants[newitem]->u.key = pmc;

    return newitem;
}


/*

=item C<static int add_const_table_key>

Adds a key to the const table, returning its position.

=cut

*/

static int
add_const_table_key(PARROT_INTERP, PMC *key)
{
    int newitem = add_const_table(interp);

    interp->code->const_table->constants[newitem]->type  = PFC_KEY;
    interp->code->const_table->constants[newitem]->u.key = key;

    return newitem;
}


/*

=item C<int e_pbc_open>

RT #48260: Not yet documented!!!

=cut

*/

int
e_pbc_open(PARROT_INTERP, SHIM(void *param))
{
    code_segment_t *cs = mem_allocate_zeroed_typed(code_segment_t);

    if (!IMCC_INFO(interp)->globals)
        IMCC_INFO(interp)->globals = mem_allocate_zeroed_typed(imcc_globals);

    if (IMCC_INFO(interp)->globals->cs)
        clear_sym_hash(&IMCC_INFO(interp)->globals->cs->key_consts);
    else {
        /* register cleanup code */
        Parrot_on_exit(interp, imcc_globals_destroy, NULL);
    }

    /* free previous cached key constants if any */
    create_symhash(&cs->key_consts);

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
        PMC *self;

        cs->seg = interp->code =
            PF_create_default_segs(interp, IMCC_INFO(interp)->state->file, 1);

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

#ifdef HAS_JIT

/*

=item C<static int old_blocks>

get size/line of bytecode in ops till now

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
old_blocks(PARROT_INTERP)
{
    size_t  size = 0;
    const   subs_t *s;

    for (s = IMCC_INFO(interp)->globals->cs->subs; s; s = s->prev) {
        size += s->n_basic_blocks;
    }

    return size;
}

/*

=item C<opcode_t * make_jit_info>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
make_jit_info(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
{
    const size_t old  = old_blocks(interp);
    const size_t size = unit->n_basic_blocks + old;

    if (!IMCC_INFO(interp)->globals->cs->jit_info) {
        const  size_t len  =
            strlen(IMCC_INFO(interp)->globals->cs->seg->base.name) + 5;
        char * const  name = mem_allocate_n_typed(len, char);

        snprintf(name, len, "%s_JIT",
            IMCC_INFO(interp)->globals->cs->seg->base.name);

        IMCC_INFO(interp)->globals->cs->jit_info =
                PackFile_Segment_new_seg(interp,
                    interp->code->base.dir, PF_UNKNOWN_SEG, name, 1);

        mem_sys_free(name);
    }

    /* store current size */
    IMCC_INFO(interp)->globals->cs->subs->n_basic_blocks = unit->n_basic_blocks;

    /* offset of block start and end, 4 * registers_used */
    IMCC_INFO(interp)->globals->cs->jit_info->data =
        mem_realloc_n_typed(IMCC_INFO(interp)->globals->cs->jit_info->data,
            size * 4, opcode_t);

    IMCC_INFO(interp)->globals->cs->jit_info->size = size * 4;

    return IMCC_INFO(interp)->globals->cs->jit_info->data + old * 4;
}

#endif /* HAS_JIT */

/*

=item C<static void make_new_sub>

allocate a new globals->cs->subs structure

=cut

*/

static void
make_new_sub(PARROT_INTERP, ARGIN(IMC_Unit *unit))
{
    subs_t * const s = mem_allocate_zeroed_typed(subs_t);

    s->prev          = IMCC_INFO(interp)->globals->cs->subs;
    s->unit          = unit;
    s->pmc_const     = -1;

    if (IMCC_INFO(interp)->globals->cs->subs)
        IMCC_INFO(interp)->globals->cs->subs->next = s;

    if (!IMCC_INFO(interp)->globals->cs->first)
        IMCC_INFO(interp)->globals->cs->first = s;

    IMCC_INFO(interp)->globals->cs->subs = s;

    create_symhash(&s->fixup);
}

/*

=item C<static int get_old_size>

get size/line of bytecode in ops till now

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
get_old_size(PARROT_INTERP, ARGOUT(int *ins_line))
{
    size_t size = 0;

    *ins_line   = 0;

    if (IMCC_INFO(interp)->globals->cs && interp->code->base.data) {
        subs_t *s;
        for (s = IMCC_INFO(interp)->globals->cs->subs; s; s = s->prev) {
            size      += s->size;
            *ins_line += s->ins_line;
        }
    }

    return size;
}

/*

=item C<static void store_sub_size>

RT #48260: Not yet documented!!!

=cut

*/

static void
store_sub_size(PARROT_INTERP, size_t size, size_t ins_line)
{
    IMCC_INFO(interp)->globals->cs->subs->size     = size;
    IMCC_INFO(interp)->globals->cs->subs->ins_line = ins_line;
}

/*

=item C<static void store_fixup>

RT #48260: Not yet documented!!!

=cut

*/

static void
store_fixup(PARROT_INTERP, ARGIN(const SymReg *r), int pc, int offset)
{
    SymReg * const fixup = _mk_address(interp, &IMCC_INFO(interp)->globals->cs->subs->fixup,
            r->name, U_add_all);

    if (r->set == 'p')
        fixup->set = 'p';

    if (r->type & VT_ENCODED)
        fixup->type |= VT_ENCODED;

    /* set_p_pc   = 2  */
    fixup->color  = pc;
    fixup->offset = offset;
}

/*

=item C<static void store_key_const>

RT #48260: Not yet documented!!!

=cut

*/

static void
store_key_const(PARROT_INTERP, ARGIN(const char *str), int idx)
{
    SymReg * const c =
        _mk_const(&IMCC_INFO(interp)->globals->cs->key_consts, str, 0);
    c->color = idx;
}

/*

=item C<static int get_codesize>

store globals for later fixup
return size in ops

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
get_codesize(PARROT_INTERP, ARGIN(const IMC_Unit *unit), ARGOUT(int *src_lines))
{
    Instruction *ins = unit->instructions;
    int          code_size;

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

        if (ins->opname && *ins->opname) {
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

=item C<static subs_t * find_global_label>

get a global label, return the pc (absolute)

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static subs_t *
find_global_label(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(const subs_t *sym), ARGOUT(int *pc))
{
    subs_t *s;

    *pc = 0;

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
        SymReg * const r = s->unit->instructions->symregs[0];

        /* if names and namespaces are matching - ok */
        if (r && (strcmp(r->name, name) == 0)
              && ((sym->unit->_namespace && s->unit->_namespace
              &&  (strcmp(sym->unit->_namespace->name, s->unit->_namespace->name) == 0))
              || (!sym->unit->_namespace && !s->unit->_namespace)))
            return s;

        *pc += s->size;
    }

    return NULL;
}

/*

=item C<static void fixup_globals>

fix global stuff

=cut

*/

static void
fixup_globals(PARROT_INTERP)
{
    subs_t *s;
    int     jumppc = 0;

    for (s = IMCC_INFO(interp)->globals->cs->first; s; s = s->next) {
        const SymHash * const hsh = &s->fixup;
        unsigned int          i;

        for (i = 0; i < hsh->size; i++) {
            SymReg *fixup;

            for (fixup = hsh->data[i]; fixup; fixup = fixup->next) {
                int pc, pmc_const;
                int addr = jumppc + fixup->color;

                /* check in matching namespace */
                subs_t *s1 = find_global_label(interp, fixup->name, s, &pc);

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
                        if (pcc_sub->nmulti)
                            s1 = NULL;
                    }
                }
                if (!s1) {
                    int op, col;
                    SymReg * const nam = mk_const(interp, fixup->name,
                            fixup->type & VT_ENCODED ? 'U' : 'S');

                    op = interp->op_lib->op_code("find_sub_not_null_p_sc", 1);
                    PARROT_ASSERT(op);

                    interp->code->base.data[addr] = op;

                    if (nam->color >= 0)
                        col = nam->color;
                    else
                        col = nam->color = add_const_str(interp, nam);

                    interp->code->base.data[addr+2] = col;

                    IMCC_debug(interp, DEBUG_PBC_FIXUP,
                            "fixup const PMC"
                            " find_name sub '%s' const nr: %d\n",
                            fixup->name, col);
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

=item C<STRING * IMCC_string_from_reg>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
IMCC_string_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
{
    const char *buf = r->name;

    if (r->type & VT_ENCODED) {
        /*
         * the lexer parses:   foo:"string"
         * get first part as charset, rest as string
         */
        STRING     *s;
        const char *charset;
        char * const p = strchr(r->name, '"');
        PARROT_ASSERT(p && p[-1] == ':');

        p[-1]   = 0;
        charset = r->name;

        /* past delim */
        buf     = p + 1;
        s       = string_unescape_cstring(interp, buf, '"', charset);

        /* restore colon, as we may reuse this string */
        p[-1] = ':';
        return s;
    }
    else if (*buf == '"') {
        buf++;
        return string_unescape_cstring(interp, buf, '"', NULL);
    }
    else if (*buf == '\'') {   /* TODO handle python raw strings */
        buf++;
        return string_make(interp, buf, strlen(buf) - 1, "ascii",
                PObj_constant_FLAG);
    }

    /* unquoted bare name - ascii only don't unescape it */
    return string_make(interp, buf, strlen(buf), "ascii", PObj_constant_FLAG);
}

/*

=item C<static int add_const_str>

add constant string to constant_table

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
add_const_str(PARROT_INTERP, ARGIN(const SymReg *r))
{
    const int      k = add_const_table(interp);
    STRING * const s = IMCC_string_from_reg(interp, r);

    interp->code->const_table->constants[k]->type     = PFC_STRING;
    interp->code->const_table->constants[k]->u.string = s;

    return k;
}

/*

=item C<static int add_const_num>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
add_const_num(PARROT_INTERP, ARGIN_NULLOK(const char *buf))
{
    const int      k = add_const_table(interp);
    STRING * const s = string_from_cstring(interp, buf, 0);

    interp->code->const_table->constants[k]->type     = PFC_NUMBER;
    interp->code->const_table->constants[k]->u.number = string_to_num(interp, s);

    return k;
}

/*

=item C<static PMC* mk_multi_sig>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static PMC*
mk_multi_sig(PARROT_INTERP, ARGIN(const SymReg *r))
{
    PMC       * const multi_sig = pmc_new(interp, enum_class_FixedPMCArray);
    pcc_sub_t * const pcc_sub   = r->pcc_sub;
    const INTVAL      n         = pcc_sub->nmulti;
    INTVAL            i;

    PackFile_ConstTable *ct;

    VTABLE_set_integer_native(interp, multi_sig, n);

    /* :multi() n = 1, reg = NULL */
    if (!pcc_sub->multi[0]) {
        STRING * const sig     = string_from_literal(interp, "__VOID");
        PMC    * const sig_pmc = pmc_new(interp, enum_class_String);

        VTABLE_set_string_native(interp, sig_pmc, sig);
        VTABLE_set_pmc_keyed_int(interp, multi_sig, 0, sig_pmc);

        return multi_sig;
    }

    ct = interp->code->const_table;

    for (i = 0; i < n; ++i) {
        /* multi[i] can be a Key too -
         * store PMC constants instead of bare strings */
        PMC *sig_pmc;
        r = pcc_sub->multi[i];

        if (r->set == 'S') {
            sig_pmc = pmc_new(interp, enum_class_String);
            VTABLE_set_string_native(interp, sig_pmc,
                    ct->constants[r->color]->u.string);
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

=item C<static PMC* create_lexinfo>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
create_lexinfo(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(PMC *sub),
               int need_lex)
{

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
                    lex_info = pmc_new_noinit(interp, lex_info_id);
                    VTABLE_init_pmc(interp, lex_info, sub);
                }

                /* at least one lexical name */
                n = r->reg;
                PARROT_ASSERT(n);

                while (n) {
                    STRING  *lex_name;
                    const int k = n->color;
                    PARROT_ASSERT(k >= 0);

                    lex_name = constants[k]->u.string;
                    PARROT_ASSERT(PObj_is_string_TEST(lex_name));

                    IMCC_debug(interp, DEBUG_PBC_CONST,
                            "add lexical '%s' to sub name '%s'\n",
                            n->name, (char*)PMC_sub(sub)->name->strstart);

                    Parrot_PCCINVOKE(interp, lex_info,
                            string_from_literal(interp, "declare_lex_preg"),
                            "SI->", lex_name, r->color);

                    /* next possible name */
                    n = n->reg;
                }
            }
        }
    }

    if (!lex_info && (unit->outer || need_lex)) {
        lex_info = pmc_new_noinit(interp, lex_info_id);
        VTABLE_init_pmc(interp, lex_info, sub);
    }

    return lex_info;
}

/*

=item C<static PMC* find_outer>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
find_outer(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
{
    subs_t *s;
    size_t  len;
    PMC    *current;
    STRING *cur_name;

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
        if (STREQ(s->unit->lexid->name, unit->outer->name)) {
            PObj_get_FLAGS(s->unit->sub_pmc) |= SUB_FLAG_IS_OUTER;
            return s->unit->sub_pmc;
        }
    }

    /* could be eval too; check if :outer is the current sub */
    current = CONTEXT(interp)->current_sub;

    if (!current)
        IMCC_fatal(interp, 1, "Undefined :outer sub '%s'.\n",
                   unit->outer->name);

    cur_name = PMC_sub(current)->name;

    if (cur_name->strlen == len
    && (memcmp((char*)cur_name->strstart, unit->outer->name, len) == 0))
        return current;

    return NULL;
}

/*

=item C<static int add_const_pmc_sub>

RT #48260: Not yet documented!!!

=cut

*/

static int
add_const_pmc_sub(PARROT_INTERP, ARGMOD(SymReg *r), int offs, int end)
{
    int                  i;
    int                  ns_const = -1;
    PMC                 *ns_pmc;
    PMC                 *sub_pmc;
    Parrot_sub          *sub;

    const int            k            = add_const_table(interp);
    PackFile_ConstTable *ct           = interp->code->const_table;
    PackFile_Constant   *pfc          = ct->constants[k];
    IMC_Unit            * const unit  =
        IMCC_INFO(interp)->globals->cs->subs->unit;

    INTVAL               type         =
        (r->pcc_sub->calls_a_sub & ITPCCYIELD) ?
            enum_class_Coroutine :
                unit->outer ? enum_class_Closure : enum_class_Sub;

    IMCC_INFO(interp)->globals->cs->subs->pmc_const = k;

    if (unit->_namespace) {
        /* strip namespace off from front */
        const char *real_name = strrchr(r->name, '@');
        SymReg     * const ns = unit->_namespace->reg;

        IMCC_debug(interp, DEBUG_PBC_CONST,
                "name space const = %d ns name '%s'\n", ns->color, ns->name);

        ns_const  = ns->color;

        if (real_name) {
            char * const p = str_dup(real_name + 1);
            free(r->name);
            r->name = p;
        }
    }

    /* Do we have to create an instance of a specific type for this sub? */
    if (unit->instance_of) {
        /* Look it up as a class and as a PMC type. */
        STRING * const classname = string_from_cstring(interp, unit->instance_of + 1,
                 strlen(unit->instance_of) - 2);
        PMC * const classobj = Parrot_oo_get_class_str(interp, classname);
        if (!PMC_IS_NULL(classobj))
            sub_pmc = VTABLE_instantiate(interp, classobj, PMCNULL);
        else {
            const INTVAL type = pmc_type(interp, classname);
            if (type <= 0)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NO_CLASS,
                    "Class '%Ss' specified in :instanceof(...) not found", classname);
            sub_pmc = pmc_new(interp, type);
        }
    }
    else {
        /* use a possible type mapping for the Sub PMCs, and create it */
        type = Parrot_get_ctx_HLL_type(interp, type);

        /* TODO create constant - see also src/packfile.c */
        sub_pmc = pmc_new(interp, type);
    }

    /* Set flags and get the sub info. */
    PObj_get_FLAGS(sub_pmc)     |= (r->pcc_sub->pragma & SUB_FLAG_PF_MASK);
    Sub_comp_get_FLAGS(sub_pmc) |= (r->pcc_sub->pragma & SUB_COMP_FLAG_MASK);
    sub                          = PMC_sub(sub_pmc);

    r->color  = add_const_str(interp, r);
    sub->name = ct->constants[r->color]->u.string;

    /* If the unit has no lexid, set the lexid to match the name. */
    if (!unit->lexid) {
        unit->lexid = r;
    }
    else {
        /* trim the quotes  */
        unit->lexid->name = str_dup(unit->lexid->name + 1);

        /* Otherwise, create string constant for it. */
        unit->lexid->name[strlen(unit->lexid->name) - 1] = 0;
        unit->lexid->color = add_const_str(interp, unit->lexid);
    }
    sub->lexid = ct->constants[unit->lexid->color]->u.string;

    ns_pmc    = NULL;

    if (ns_const >= 0 && ns_const < ct->const_count) {
        switch (ct->constants[ns_const]->type) {
            case PFC_KEY:
                ns_pmc = ct->constants[ns_const]->u.key;
                break;
            case PFC_STRING:
                ns_pmc = constant_pmc_new(interp, enum_class_String);
                PMC_str_val(ns_pmc) = ct->constants[ns_const]->u.string;
                break;
            default:
                break;
        }
    }

    sub->namespace_name = ns_pmc;
    sub->start_offs     = offs;
    sub->end_offs       = end;
    sub->HLL_id         = CONTEXT(interp)->current_HLL;

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

        /* Work out the name of the vtable method. */
        if (unit->vtable_name)
            vtable_name = string_from_cstring(interp, unit->vtable_name + 1,
                 strlen(unit->vtable_name) - 2);
        else
            vtable_name = sub->name;

        /* Check this is a valid vtable method to override. */
        vtable_index = Parrot_get_vtable_index(interp, vtable_name);

        if (vtable_index == -1) {
            IMCC_fatal(interp, 1,
                "'%S' is not a v-table method, but was used with :vtable.\n",
                vtable_name);
        }

        /* TODO check for duplicates */
        sub->vtable_index = vtable_index;
    }

    Parrot_store_sub_in_namespace(interp, sub_pmc);

    pfc->type     = PFC_PMC;
    pfc->u.key    = sub_pmc;
    unit->sub_pmc = sub_pmc;

    IMCC_debug(interp, DEBUG_PBC_CONST,
            "add_const_pmc_sub '%s' flags %x color %d (%s) "
            "lex_info %s :outer(%s)\n",
            r->name, r->pcc_sub->pragma, k,
            (char *) sub_pmc->vtable->whoami->strstart,
            sub->lex_info ? "yes" : "no",
            sub->outer_sub ?
                (char *)PMC_sub(sub->outer_sub)->name->strstart :
                "*none*");
    /*
     * create entry in our fixup (=symbol) table
     * the offset is the index in the constant table of this Sub
     */
    PackFile_FixupTable_new_entry(interp, r->name, enum_fixup_sub, k);
    return k;
}

/*

=item C<static int add_const_key>

add constant key to constant_table

=cut

*/

static int
add_const_key(PARROT_INTERP, ARGIN(const opcode_t *key), int size, ARGIN(const char *s_key))
{
    int                k;
    const opcode_t    *rc;
    PackFile_Constant *pfc;

    const SymReg * const r =
        _get_sym(&IMCC_INFO(interp)->globals->cs->key_consts, s_key);

    if (r)
        return r->color;

    pfc = mem_allocate_typed(PackFile_Constant);
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

=item C<static const char * slice_deb>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const char *
slice_deb(int bits)
{
    if ((bits & VT_SLICE_BITS) == (VT_START_SLICE|VT_END_SLICE))
        return "start+end";

    if ((bits & VT_SLICE_BITS) == (VT_START_ZERO|VT_END_SLICE))
        return "..end";

    if ((bits & VT_SLICE_BITS) == (VT_START_SLICE|VT_END_INF))
        return "start..";

    if (bits & VT_START_SLICE)
        return "start";

    if (bits & VT_END_SLICE)
        return "end";

    return "";
}

/*

=item C<static opcode_t build_key>

color is a Parrot register number or a constant table index

for the rest, please consult PDD08_KEYS(1)

additionally, I build a string representation of the key,
which gets cached in the globals.keys

=cut

*/

static opcode_t
build_key(PARROT_INTERP, ARGIN(SymReg *key_reg))
{
#define KEYLEN 21
    char      s_key[KEYLEN * 10];
    opcode_t  key[KEYLEN];
    opcode_t  size;
    int       key_length;     /* P0["hi;there"; S0; 2] has length 3 */
    int       k;
    SymReg   *reg;

    /* 0 is length */
    opcode_t *pc = key + 1;

    /* stringified key */
    char     *s  = s_key;
    *s           = 0;

    reg          = key_reg->set == 'K' ? key_reg->nextkey : key_reg;

    for (key_length = 0; reg ; reg = reg->nextkey, key_length++) {
        SymReg *r = reg;
        int     var_type, slice_bits, type;

        if ((pc - key - 2) >= KEYLEN)
            IMCC_fatal(interp, 1, "build_key:"
                    "key too complex increase KEYLEN\n");

        /* if key is a register, the original sym is in r->reg */
        type = r->type;

        if (r->reg)
            r = r->reg;

        var_type   = type & ~VT_SLICE_BITS;
        slice_bits = type &  VT_SLICE_BITS;

        switch (var_type) {
            case VTIDENTIFIER:       /* P[S0] */
            case VTPASM:             /* P[S0] */
            case VTREG:              /* P[S0] */
                if (r->set == 'I')
                    *pc++ = PARROT_ARG_I | slice_bits;    /* register type */
                else if (r->set == 'S')
                    *pc++ = PARROT_ARG_S | slice_bits;
                else
                    IMCC_fatal(interp, 1, "build_key: wrong register set\n");

                /* don't emit mapped regs in key parts */
                if (r->color < 0)
                    *pc++ = -1 - r->color;
                else
                    *pc++ = r->color;

                sprintf(s+strlen(s), "%c%d", r->set, (int)r->color);

                IMCC_debug(interp, DEBUG_PBC_CONST,
                        " keypart reg %s %c%d slice %s\n",
                        r->name, r->set, (int)r->color,
                        slice_deb(slice_bits));
                break;
            case VT_CONSTP:
            case VTCONST:
            case VTCONST|VT_ENCODED:
                switch (r->set) {
                    case 'S':                       /* P["key"] */
                        /* str constant */
                        *pc++ = PARROT_ARG_SC | slice_bits;

                        /* constant idx */
                        *pc++ = r->color;

                        IMCC_debug(interp, DEBUG_PBC_CONST,
                                " keypart SC %s #%d slice %s\n",
                                r->name, r->color,
                                slice_deb(slice_bits));
                        break;
                    case 'I':                       /* P[;42;..] */
                        /* int constant */
                        *pc++ = PARROT_ARG_IC | slice_bits;

                        /* value */
                        *pc++ = r->color = atol(r->name);

                        IMCC_debug(interp, DEBUG_PBC_CONST,
                                " keypart IC %s #%d slice %s\n",
                                r->name, r->color,
                                slice_deb(slice_bits));
                        break;
                    default:
                        IMCC_fatal(interp, 1, "build_key: unknown set\n");
                }
                sprintf(s+strlen(s), "%cc" INTVAL_FMT, r->set, r->color);
                break;
            default:
                IMCC_fatal(interp, 1, "build_key: "
                    "unknown type 0x%x on %s\n", var_type, r->name);
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

=item C<INTVAL IMCC_int_from_reg>

RT #48260: Not yet documented!!!

=cut

*/

INTVAL
IMCC_int_from_reg(PARROT_INTERP, ARGIN(const SymReg *r))
{
    INTVAL i;

    errno = 0;

    if (r->type & VT_CONSTP)
        r = r->reg;

    if (r->name[0] == '0' && (r->name[1] == 'x' || r->name[1] == 'X'))
        i = strtoul(r->name+2, 0, 16);

    else if (r->name[0] == '0' && (r->name[1] == 'O' || r->name[1] == 'o'))
        i = strtoul(r->name+2, 0, 8);

    else if (r->name[0] == '0' && (r->name[1] == 'b' || r->name[1] == 'B'))
        i = strtoul(r->name+2, 0, 2);

    else
        i = strtol(r->name, 0, 10);

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

=item C<static void make_pmc_const>

RT #48260: Not yet documented!!!

=cut

*/

static void
make_pmc_const(PARROT_INTERP, ARGMOD(SymReg *r))
{
    STRING *s;
    PMC    *p;
    PMC *_class  = interp->vtables[r->pmc_type]->pmc_class;
    int     k;

    if (*r->name == '"')
        s = string_unescape_cstring(interp, r->name + 1, '"', NULL);

    else if (*r->name == '\'')
        s = string_unescape_cstring(interp, r->name + 1, '\'', NULL);

    else
        s = string_unescape_cstring(interp, r->name, 0, NULL);

    p       = VTABLE_new_from_string(interp, _class, s, PObj_constant_FLAG);

    /* append PMC constant */
    k = add_const_table_pmc(interp, p);

    r->color = k;
}

/*

=item C<static void add_1_const>

RT #48260: Not yet documented!!!

=cut

*/

static void
add_1_const(PARROT_INTERP, ARGMOD(SymReg *r))
{
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
            r->color = add_const_str(interp, r);
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

=item C<static void constant_folding>

store a constants idx for later reuse

=cut

*/

static void
constant_folding(PARROT_INTERP, ARGIN(const IMC_Unit *unit))
{
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

=item C<int e_pbc_new_sub>

RT #48260: Not yet documented!!!

=cut

*/

int
e_pbc_new_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
{
    if (!unit->instructions)
        return 0;

    /* we start a new compilation unit */
    make_new_sub(interp, unit);

    return 0;
}

/*

=item C<int e_pbc_end_sub>

RT #48260: Not yet documented!!!

=cut

*/

int
e_pbc_end_sub(PARROT_INTERP, SHIM(void *param), ARGIN(IMC_Unit *unit))
{
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

    if (pragma & P_IMMEDIATE) {
        const imcc_globals  *g           = IMCC_INFO(interp)->globals;
        const SymReg       **data        = IMCC_INFO(interp)->ghash.data;
        const unsigned int   size        = IMCC_INFO(interp)->ghash.size;
        const unsigned int   entries     = IMCC_INFO(interp)->ghash.entries;

        IMCC_INFO(interp)->globals       = NULL;
        IMCC_INFO(interp)->ghash.data    = NULL;
        IMCC_INFO(interp)->ghash.size    = 0;
        IMCC_INFO(interp)->ghash.entries = 0;

        IMCC_debug(interp, DEBUG_PBC, "immediate sub '%s'",
                ins->symregs[0]->name);
        PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);

        IMCC_INFO(interp)->globals       = g;
        IMCC_INFO(interp)->ghash.data    = data;
        IMCC_INFO(interp)->ghash.size    = size;
        IMCC_INFO(interp)->ghash.entries = entries;
    }

    return 0;
}

/*

=item C<static void verify_signature>

 - check if any get_ argument contains constants
 - fill in type bits for argument types and constants, if missing

=cut

*/

static void
verify_signature(PARROT_INTERP, ARGIN(const Instruction *ins), ARGIN(opcode_t *pc))
{
    INTVAL  i, n;
    int     needed         = 0;
    int     no_consts      = (ins->opnum == PARROT_OP_get_results_pc
                           || ins->opnum == PARROT_OP_get_params_pc);
    PMC    *changed_sig    = NULL;
    PMC    * const sig_arr = interp->code->const_table->constants[pc[-1]]->u.key;

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
            && no_consts && (r->type & VTCONST))
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

=item C<int e_pbc_emit>

now let the fun begin, actually emit code for one ins

=cut

*/

int
e_pbc_emit(PARROT_INTERP, SHIM(void *param), ARGIN(const IMC_Unit *unit),
        ARGIN(const Instruction *ins))
{
    op_info_t *op_info;
    int        ok = 0;
    int        op, i;

#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, "e_pbc_emit\n");
#endif

    /* first instruction, do initialisation ... */
    if (ins == unit->instructions) {
        int ins_size;

        const int    oldsize   = get_old_size(interp,
                                    &IMCC_INFO(interp)->ins_line);
        const int    code_size = get_codesize(interp, unit, &ins_size);
        const size_t bytes     = (oldsize + code_size) * sizeof (opcode_t);

        IMCC_debug(interp, DEBUG_PBC, "code_size(ops) %d  oldsize %d\n",
                code_size, oldsize);

        constant_folding(interp, unit);
        store_sub_size(interp, code_size, ins_size);

        /*
         * allocate code and pic_index
         *
         * pic_index is half the size of the code, as one PIC-cachable opcode
         * is at least two opcodes wide - see below how to further decrease
         * this storage
         */
        interp->code->base.data       = (opcode_t *)
            mem_sys_realloc(interp->code->base.data, bytes);

        interp->code->pic_index->data = (opcode_t *)
            mem_sys_realloc(interp->code->pic_index->data, bytes / 2);

        interp->code->base.size       = oldsize + code_size;
        interp->code->pic_index->size = (oldsize + code_size) / 2;

        IMCC_INFO(interp)->pc  = (opcode_t *)interp->code->base.data + oldsize;
        IMCC_INFO(interp)->npc = 0;

        /* add debug if necessary */
        if (IMCC_INFO(interp)->optimizer_level == 0
        || IMCC_INFO(interp)->optimizer_level  == OPT_PASM) {
            const char * const sourcefile = unit->file;

            /* FIXME length and multiple subs */
            IMCC_INFO(interp)->debug_seg  = Parrot_new_debug_seg(interp,
                interp->code,
                (size_t)IMCC_INFO(interp)->ins_line + ins_size + 1);

            Parrot_debug_add_mapping(interp, IMCC_INFO(interp)->debug_seg,
                IMCC_INFO(interp)->ins_line,
                PF_DEBUGMAPPINGTYPE_FILENAME, sourcefile, 0);
        }
        else
            IMCC_INFO(interp)->debug_seg = NULL;

        /* if item is a PCC_SUB entry then store it constants */
        if (ins->symregs[0] && ins->symregs[0]->pcc_sub) {

#if IMC_TRACE
            PIO_eprintf(NULL, "pbc.c: e_pbc_emit (pcc_sub=%s)\n",
                        ins->symregs[0]->name);
#endif

            add_const_pmc_sub(interp, ins->symregs[0], oldsize,
                              oldsize + code_size);
        }
        else {
            /* need a dummy to hold register usage */
            SymReg * const r = mk_sub_label(interp, "(null)");
            r->type          = VT_PCC_SUB;
            r->pcc_sub       = mem_allocate_zeroed_typed(pcc_sub_t);

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

    if (ins->opname && *ins->opname) {
        SymReg *addr, *r;
        opcode_t last_label;
        last_label = 1;
#if IMC_TRACE_HIGH
        PIO_eprintf(NULL, "emit_pbc: op [%d %s]\n", ins->opnum, ins->opname);
#endif
        if ((ins->type & ITBRANCH)
        &&  (addr = get_branch_reg(ins)) != 0
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

        /* add PIC idx */
        if (parrot_PIC_op_is_cached(op)) {
            const size_t offs = IMCC_INFO(interp)->pc - interp->code->base.data;
            /*
             * for pic_idx fitting into a short, we could
             * further reduce the size by storing shorts
             * the relation code_size / pic_index_size could
             * indicate the used storage
             *
             * drawback: if we reach 0xffff, we'd have to resize again
             */
            interp->code->pic_index->data[offs / 2] =
                ++IMCC_INFO(interp)->globals->cs->pic_idx;
        }

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

=item C<int e_pbc_close>

RT #48260: Not yet documented!!!

=cut

*/

int
e_pbc_close(PARROT_INTERP, SHIM(void *param))
{
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
