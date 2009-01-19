/*
 * Copyright (C) 2002-2008, The Perl Foundation.
 * $Id$
 */

/*

=head1 NAME

compilers/imcc/symreg.c

=head1 DESCRIPTION

imcc symbol handling

XXX: SymReg stuff has become overused. SymReg should be for symbolic
registers, reg allocation, etc. but we are now using it for extensive
symbol table management. Need to convert much of this over the use Symbol
and SymbolTable (see symbol.h and symbol.c)

=head2 Functions

=over 4

=cut

*/


#include "imc.h"

/* Globals: */
/* Code: */

/* HEADERIZER HFILE: compilers/imcc/symreg.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static SymReg * _get_sym_typed(
    ARGIN(const SymHash *hsh),
    ARGIN(const char *name),
    int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char * _mk_fullname(
    ARGIN_NULLOK(const Namespace *ns),
    ARGIN(const char *name))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg * _mk_symreg(
    ARGMOD(SymHash *hsh),
    ARGIN(const char *name),
    int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hsh);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char * add_ns(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int int_overflows(ARGIN(const SymReg *r))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static SymReg * mk_pmc_const_2(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(SymReg *left),
    ARGMOD(SymReg *rhs))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*rhs);

static void resize_symhash(ARGMOD(SymHash *hsh))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*hsh);

#define ASSERT_ARGS__get_sym_typed __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(hsh) \
    || PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS__mk_fullname __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS__mk_symreg __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(hsh) \
    || PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS_add_ns __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name)
#define ASSERT_ARGS_int_overflows __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(r)
#define ASSERT_ARGS_mk_pmc_const_2 __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(unit) \
    || PARROT_ASSERT_ARG(left) \
    || PARROT_ASSERT_ARG(rhs)
#define ASSERT_ARGS_resize_symhash __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(hsh)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void push_namespace>

Begins a new namespace in PASM/PIR, named after the given C<name>.

=cut

*/

void
push_namespace(SHIM_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(push_namespace)
    Namespace * const ns = mem_allocate_zeroed_typed(Namespace);

    ns->parent = _namespace;
    ns->name   = str_dup(name);
    _namespace = ns;
}


/*

=item C<void pop_namespace>

Ends the current namespace, popping back to the previous.  If the namespace
stack is empty, throws a syntax error.

=cut

*/

void
pop_namespace(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(pop_namespace)
    Namespace * const ns = _namespace;

    if (!ns)
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "pop() on empty namespace stack\n");

    if (name && !STREQ(name, ns->name))
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "tried to pop namespace(%s), "
                "but top of stack is namespace(%s)\n", name, ns->name);

    while (ns->idents) {
        Identifier * const ident = ns->idents;
        ns->idents               = ident->next;
        mem_sys_free(ident);
    }

    _namespace = ns->parent;
    mem_sys_free(ns);
}


/*

=item C<static SymReg * _get_sym_typed>

Gets a symbol from the hash, with the given C<name> of the specific type C<t>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static SymReg *
_get_sym_typed(ARGIN(const SymHash *hsh), ARGIN(const char *name), int t)
{
    ASSERT_ARGS(_get_sym_typed)
    SymReg            *p;
    const unsigned int i = hash_str(name) % hsh->size;

    for (p = hsh->data[i]; p; p = p->next) {
        if ((t == p->set) && STREQ(name, p->name))
            return p;
    }

    return NULL;
}


/* symbolic registers */

/*

=item C<static SymReg * _mk_symreg>

Makes a new SymReg in the given SymHash from a varname and type.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static SymReg *
_mk_symreg(ARGMOD(SymHash *hsh), ARGIN(const char *name), int t)
{
    ASSERT_ARGS(_mk_symreg)
    SymReg * r = _get_sym_typed(hsh, name, t);

    if (!r) {
        r             = mem_allocate_zeroed_typed(SymReg);
        r->set        = t;
        r->type       = VTREG;
        r->name       = str_dup(name);
        r->color      = -1;
        r->want_regno = -1;

        _store_symreg(hsh, r);
    }

    return r;
}


/*

=item C<SymReg * mk_symreg>

Makes a new SymReg in the current unit, given a varname and type.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_symreg(PARROT_INTERP, ARGIN(const char *name), int t)
{
    ASSERT_ARGS(mk_symreg)
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;

    /* Check for the condition that fires up a segfault in TT #162 */
    PARROT_ASSERT(unit != NULL);

    return _mk_symreg(&unit->hash, name, t);
}


/*

=item C<char * symreg_to_str>

Dumps a SymReg to a printable format.

=cut

*/

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
char *
symreg_to_str(ARGIN(const SymReg *s))
{
    ASSERT_ARGS(symreg_to_str)
    /* NOTE: the below magic number encompasses all the quoted strings which
     * may be included in the sprintf output (for now) */
    char * const buf = (char *)mem_sys_allocate(250 + strlen(s->name));
    const int    t   = s->type;

    sprintf(buf, "symbol [%s]  set [%c]  color [" INTVAL_FMT "]  type [",
                 s->name, s->set, s->color);

    if (t & VTCONST)      { strcat(buf, "VTCONST ");       }
    if (t & VTREG)        { strcat(buf, "VTREG ");         }
    if (t & VTIDENTIFIER) { strcat(buf, "VTIDENTIFIER ");  }
    if (t & VTADDRESS)    { strcat(buf, "VTADDRESS ");     }
    if (t & VTREGKEY)     { strcat(buf, "VTREGKEY ");      }
    if (t & VTPASM)       { strcat(buf, "VTPASM ");        }
    if (t & VT_CONSTP)    { strcat(buf, "VT_CONSTP ");     }
    if (t & VT_PCC_SUB)   { strcat(buf, "VT_PCC_SUB ");    }
    if (t & VT_FLAT)      { strcat(buf, "VT_FLAT ");       }
    if (t & VT_OPTIONAL)  { strcat(buf, "VT_OPTIONAL ");   }
    if (t & VT_NAMED)     { strcat(buf, "VT_NAMED ");      }

    strcat(buf, "]");

    return buf;
}


/*

=item C<SymReg * mk_temp_reg>

Makes a new unique and temporary SymReg of the specified type C<t>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_temp_reg(PARROT_INTERP, int t)
{
    ASSERT_ARGS(mk_temp_reg)
    char       buf[30];
    static int temp;

    snprintf(buf, sizeof (buf), "__imcc_temp_%d", ++temp);
    return mk_symreg(interp, buf, t);
}


/*

=item C<SymReg * mk_pcc_sub>

Makes a SymReg representing a PCC sub of the given C<name> with the specified
type.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_pcc_sub(PARROT_INTERP, ARGIN(const char *name), int proto)
{
    ASSERT_ARGS(mk_pcc_sub)
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    SymReg   * const r    = _mk_symreg(&unit->hash, name, proto);

    r->type    = VT_PCC_SUB;
    r->pcc_sub = mem_allocate_zeroed_typed(pcc_sub_t);

    return r;
}


/*

=item C<void add_namespace>

Add the current namespace to a sub declaration.

=cut

*/

void
add_namespace(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
{
    ASSERT_ARGS(add_namespace)
    SymReg * const ns = IMCC_INFO(interp)->cur_namespace;

    if (!ns)
        return;

    if (unit->_namespace)
        return;

    if (unit->prev && unit->prev->_namespace == ns)
        unit->_namespace = ns;
    else {
        SymReg * const g = dup_sym(ns);
        SymReg * const r = _get_sym(&IMCC_INFO(interp)->ghash, g->name);

        unit->_namespace = g;
        g->reg           = ns;
        g->type          = VT_CONSTP;

        if (!r || r->type != VT_CONSTP)
            _store_symreg(&IMCC_INFO(interp)->ghash, g);
    }
}


/*

=item C<void add_pcc_arg>

Adds a register or constant to the function arg list.

=cut

*/

void
add_pcc_arg(ARGMOD(SymReg *r), ARGMOD(SymReg *arg))
{
    ASSERT_ARGS(add_pcc_arg)
    pcc_sub_t * const sub = r->pcc_sub;
    const int         n   = sub->nargs;

    mem_realloc_n_typed(sub->args,      n + 1, SymReg *);
    mem_realloc_n_typed(sub->arg_flags, n + 1, int);

    sub->args[n]      = arg;
    sub->arg_flags[n] = arg->type;

    arg->type &= ~(VT_FLAT|VT_OPTIONAL|VT_OPT_FLAG|VT_NAMED);

    sub->nargs++;
}


/*

=item C<void add_pcc_result>

Adds a register or constant to the function's return list.

=cut

*/

void
add_pcc_result(ARGMOD(SymReg *r), ARGMOD(SymReg *arg))
{
    ASSERT_ARGS(add_pcc_result)
    pcc_sub_t * const sub = r->pcc_sub;
    const int         n   = sub->nret;

    mem_realloc_n_typed(sub->ret,       n + 1, SymReg *);
    mem_realloc_n_typed(sub->ret_flags, n + 1, int);

    /* we can't keep the flags in the SymReg as the SymReg
     * maybe used with different flags for different calls */
    sub->ret[n]       = arg;
    sub->ret_flags[n] = arg->type;

    arg->type &= ~(VT_FLAT|VT_OPTIONAL|VT_OPT_FLAG|VT_NAMED);

    sub->nret++;
}


/*

=item C<void add_pcc_multi>

Adds a :multi signature to the sub.

=cut

*/

void
add_pcc_multi(ARGMOD(SymReg *r), ARGIN_NULLOK(SymReg *arg))
{
    ASSERT_ARGS(add_pcc_multi)
    pcc_sub_t * const sub = r->pcc_sub;
    const int n           = sub->nmulti;

    mem_realloc_n_typed(sub->multi, n + 1, SymReg *);
    sub->multi[n] = arg;
    sub->nmulti++;
}


/*

=item C<void add_pcc_sub>

Sets the current sub in the given SymReg to the second SymReg.

=cut

*/

void
add_pcc_sub(ARGMOD(SymReg *r), ARGIN(SymReg *arg))
{
    ASSERT_ARGS(add_pcc_sub)
    r->pcc_sub->sub = arg;
}


/*

=item C<void add_pcc_cc>

Adds a continuation (?) to the current sub.

=cut

*/

void
add_pcc_cc(ARGMOD(SymReg *r), ARGIN(SymReg *arg))
{
    ASSERT_ARGS(add_pcc_cc)
    r->pcc_sub->cc = arg;
}


/*

=item C<SymReg * mk_pasm_reg>

Makes a SymReg representing a PASM register.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_pasm_reg(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(mk_pasm_reg)
    SymReg *r    = _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name);

    if (!r) {
        r        = mk_symreg(interp, name, *name);
        r->type  = VTPASM;
        r->color = atoi(name + 1);

        if (r->color < 0)
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                "register number out of range '%s'\n", name);
    }

    return r;
}


/*

=item C<static char * _mk_fullname>

Combines the namespace and name together, separated by a C<::>.  If there's no
namespace, the name is returned on its own.

The returned string must be free()d.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char *
_mk_fullname(ARGIN_NULLOK(const Namespace *ns), ARGIN(const char *name))
{
    ASSERT_ARGS(_mk_fullname)
    if (ns) {
        const size_t len = strlen(name) + strlen(ns->name) + 3;
        char *result = (char *) mem_sys_allocate(len);
        snprintf(result, len, "%s::%s", ns->name, name);
        return result;
    }

    return str_dup(name);
}


/*

=item C<SymReg * mk_ident>

Makes a new identifier.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg *
mk_ident(PARROT_INTERP, ARGIN(const char *name), int t)
{
    ASSERT_ARGS(mk_ident)
    char   * const fullname = _mk_fullname(_namespace, name);
    SymReg        *r        = mk_symreg(interp, fullname, t);

    r->type = VTIDENTIFIER;

    if (_namespace) {
        Identifier * const ident = mem_allocate_zeroed_typed(Identifier);

        ident->name        = fullname;
        ident->next        = _namespace->idents;
        _namespace->idents = ident;
    }
    else
        mem_sys_free(fullname);

    if (t == 'P') {
        r->pmc_type                     = IMCC_INFO(interp)->cur_pmc_type;
        IMCC_INFO(interp)->cur_pmc_type = 0;
    }

    return r;
}


/*

=item C<SymReg* mk_ident_ur>

Creates and returns a SymReg representing a unique (non-volatile) register.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg*
mk_ident_ur(PARROT_INTERP, ARGIN(const char *name), int t)
{
    ASSERT_ARGS(mk_ident_ur)
    SymReg * const r = mk_ident(interp, name, t);
    r->usage        |= U_NON_VOLATILE;

    return r;
}


/*

=item C<static SymReg * mk_pmc_const_2>

Makes a constant PMC and inserts instructions to access it.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static SymReg *
mk_pmc_const_2(PARROT_INTERP, ARGMOD(IMC_Unit *unit), ARGIN(SymReg *left),
        ARGMOD(SymReg *rhs))
{
    ASSERT_ARGS(mk_pmc_const_2)
    /* XXX This always returns NULL.  Probably shouldn't return anything then. */
    SymReg *r[3];
    char   *name;
    int     len;

    if (IMCC_INFO(interp)->state->pasm_file)
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
            "Ident as PMC constant %s\n", left->name);

    r[0] = left;

    /* strip delimiters */
    name          = str_dup(rhs->name + 1);
    len           = strlen(name);
    name[len - 1] = '\0';

    mem_sys_free(rhs->name);

    rhs->name     = name;
    rhs->set      = 'P';
    rhs->pmc_type = left->pmc_type;

    switch (rhs->pmc_type) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            r[1]       = rhs;
            rhs->usage = U_FIXUP;
            INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
            return NULL;
        default:
            break;
    }

    r[1] = rhs;
    INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);

    return NULL;
}


/*

=item C<SymReg * mk_const_ident>

Makes a new identifier constant with value val.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg *
mk_const_ident(PARROT_INTERP, ARGIN(const char *name), int t,
        ARGMOD(SymReg *val), int global)
{
    ASSERT_ARGS(mk_const_ident)
    SymReg *r;

    /*
     * Forbid assigning a string to anything other than a string
     * or PMC constant
     */
    if (t == 'N' || t == 'I') {
        if (val->set == 'S')
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "bad const initialisation");

        /* Cast value to const type */
        val->set = t;
    }

    if (global) {
        if (t == 'P')
            IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "global PMC constant not allowed");

        r = _mk_symreg(&IMCC_INFO(interp)->ghash, name, t);
    }
    else {
        r = mk_ident(interp, name, t);

        if (t == 'P')
            return mk_pmc_const_2(interp, IMCC_INFO(interp)->cur_unit, r, val);
    }

    r->type = VT_CONSTP;
    r->reg  = val;

    return r;
}


/*

=item C<SymReg * _mk_const>

Makes a new constant (internal use only).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
_mk_const(ARGMOD(SymHash *hsh), ARGIN(const char *name), int t)
{
    ASSERT_ARGS(_mk_const)
    SymReg * const r = _mk_symreg(hsh, name, t);
    r->type          = VTCONST;

    if (t == 'U') {
        /* charset:"string" */
        r->set   = 'S';
        r->type |= VT_ENCODED;
    }

    /* autopromote big ints to floats; fallout from RT #53908 */
    if (t == 'I') {
        if (int_overflows(r))
            r->set = 'N';
    }

    r->use_count++;

    return r;
}

static int
int_overflows(ARGIN(const SymReg *r))
{
    ASSERT_ARGS(int_overflows)
    INTVAL i;
    errno = 0;

    if (r->type & VT_CONSTP)
        r = r->reg;

    if (r->name[0] == '0' && (r->name[1] == 'x' || r->name[1] == 'X')) {
        i = strtoul(r->name + 2, 0, 16);
    }

    else if (r->name[0] == '0' && (r->name[1] == 'O' || r->name[1] == 'o'))
        i = strtoul(r->name + 2, 0, 8);

    else if (r->name[0] == '0' && (r->name[1] == 'b' || r->name[1] == 'B'))
        i = strtoul(r->name + 2, 0, 2);

    else
        i = strtol(r->name, 0, 10);

    return errno ? 1 : 0;
}

/*

=item C<SymReg * mk_const>

Makes a new constant (and populates the cache of global symbols).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_const(PARROT_INTERP, ARGIN(const char *name), int t)
{
    ASSERT_ARGS(mk_const)
    SymHash * const h = &IMCC_INFO(interp)->ghash;

    if (!h->data)
        create_symhash(h);

    return _mk_const(h, name, t);
}


/*

=item C<static char * add_ns>

Adds a namespace to the current sub.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char *
add_ns(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(add_ns)
    size_t len, l;
    char *ns_name, *p;

    if (!IMCC_INFO(interp)->cur_namespace
    || (l = strlen(IMCC_INFO(interp)->cur_namespace->name)) <= 2)
        return str_dup(name);

    /* TODO keyed syntax */
    len     = strlen(name) + l  + 4;
    ns_name = (char*)mem_sys_allocate(len);

    strcpy(ns_name, IMCC_INFO(interp)->cur_namespace->name);
    *ns_name       = '_';
    ns_name[l - 1] = '\0';
    strcat(ns_name, "@@@");
    strcat(ns_name, name);

    p = strstr(ns_name, "\";\"");   /* Foo";"Bar  -> Foo@@@Bar */

    while (p) {
        p[0] = '@';
        p[1] = '@';
        p[2] = '@';
        p    = strstr(ns_name, "\";\")");
    }

    return ns_name;
}


/*

=item C<SymReg * _mk_address>

Makes a new address (internal use only).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
_mk_address(PARROT_INTERP, ARGMOD(SymHash *hsh), ARGIN(const char *name), int uniq)
{
    ASSERT_ARGS(_mk_address)
    SymReg *r;

    if (uniq == U_add_all) {
        r       = mem_allocate_zeroed_typed(SymReg);
        r->type = VTADDRESS;
        r->name = str_dup(name);
        _store_symreg(hsh, r);
    }
    else {
        /* Aux var to avoid the need of const casts */
        char *aux_name = NULL;
        const char * const sub_name = (uniq == U_add_uniq_sub)
                       /* remember to free this name; add_ns malloc()s it */
                       ? (aux_name= add_ns(interp, name))
                       : (char *)name;

        r = _get_sym(hsh, sub_name);

        /* we use this for labels/subs */
        if (uniq && r && r->type == VTADDRESS && r->lhs_use_count) {
            if (uniq == U_add_uniq_label)
                IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                    "Label '%s' already defined\n", sub_name);
            else if (uniq == U_add_uniq_sub) {
                mem_sys_free(aux_name);
                IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR,
                        "Subroutine '%s' already defined\n", name);
            }
        }

        r       = _mk_symreg(hsh, sub_name, 0);
        r->type = VTADDRESS;

        if (uniq) {
            r->lhs_use_count++;
            if (uniq == U_add_uniq_sub)
                mem_sys_free(aux_name);
        }
    }

    return r;
}


/*

=item C<SymReg * mk_sub_label>

Makes and stores a new address label for a sub.  The label gets a fixup entry.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_sub_label(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(mk_sub_label)
    SymReg * const s = _mk_address(interp, &IMCC_INFO(interp)->ghash,
            name, U_add_uniq_sub);

    s->usage |= U_FIXUP;

    return s;
}


/*

=item C<SymReg * mk_sub_address>

Makes a symbol for a label.  The symbol gets a fixup entry.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_sub_address(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(mk_sub_address)
    SymReg * const s = _mk_address(interp, &IMCC_INFO(interp)->ghash,
            name, U_add_all);

    s->usage |= U_FIXUP;

    return s;
}


/*

=item C<SymReg * mk_local_label>

Makes a local symbol, giving it I<no> fixup entry.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_local_label(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(mk_local_label)
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, &unit->hash, name, U_add_uniq_label);
}


/*

=item C<SymReg * mk_label_address>

Makes a new label address.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg *
mk_label_address(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(mk_label_address)
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, &unit->hash, name, U_add_once);
}


/*

=item C<SymReg * dup_sym>

Links keys to a keys structure = SymReg

we might have

what         op      type        pbc.c:build_key()
--------------------------------------------------
 int const   _kic    VTCONST     no
 int reg     _ki     VTREG       no
 str const   _kc     VTCONST     yes
 str reg     _kc     VTREG       yes

 "key" ';' "key" _kc           -> (list of above)   yes
 "key" ';' $I0   _kc  VTREGKEY -> (list of above)   yes

 The information about which reg should be passed to build_key() is
 in the instruction.

 A key containing a variable has a special flag VTREGKEY
 because this key must be considered for life analysis for
 all the chain members, that are variables.

 An instruction with a keychain looks like this

 e.h. set I0, P["abc";0;I1]

 ins->r[2]  = keychain  'K'
 keychain->nextkey = SymReg(VTCONST) "abc"
             ->nextkey = SymReg(VTCONST) 0
                ->nextkey = SymReg(VTREG), ...->reg = VTVAR I1
                   ->nextkey = 0

 We can't use the consts or keys in the chain directly,
 because a different usage would destroy the ->nextkey pointers
 so these are all copies.
 XXX and currently not freed

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
SymReg *
dup_sym(ARGIN(const SymReg *r))
{
    ASSERT_ARGS(dup_sym)
    SymReg * const new_sym = mem_allocate_zeroed_typed(SymReg);
    STRUCT_COPY(new_sym, r);
    new_sym->name = str_dup(r->name);

    if (r->nextkey)
        new_sym->nextkey = dup_sym(r->nextkey);

    return new_sym;
}


/*

=item C<SymReg * link_keys>

Links keys together in a keychain.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
SymReg *
link_keys(PARROT_INTERP, int nargs, ARGMOD(SymReg **keys), int force)
{
    ASSERT_ARGS(link_keys)
    char   *key_str;
    SymReg *key;
    SymReg *keychain;
    int     i;
    int     any_slice = 0;
    size_t  len       = 0;

    /* namespace keys are global consts - no cur_unit */
    SymHash * const h = IMCC_INFO(interp)->cur_unit
                      ? &IMCC_INFO(interp)->cur_unit->hash
                      : &IMCC_INFO(interp)->ghash;

    if (nargs == 0)
        IMCC_fataly(interp, EXCEPTION_SYNTAX_ERROR, "link_keys: huh? no keys\n");

    /* short-circuit simple key unless we've been told not to */
    if (nargs == 1 && !force && !(keys[0]->type & VT_SLICE_BITS))
        return keys[0];

    /* calc len of key_str
     * also check if this is a slice - the first key might not
     * have the slice flag set */
    for (i = 0; i < nargs; i++) {
        len += 1 + strlen(keys[i]->name);
        if (keys[i]->type & VT_SLICE_BITS)
            any_slice = 1;
    }

    if (any_slice && !(keys[0]->type & VT_SLICE_BITS))
        keys[0]->type |= (VT_START_SLICE|VT_END_SLICE);

    key_str  = (char *)mem_sys_allocate(len);
    *key_str = '\0';

    /* first look, if we already have this exact key chain */
    for (i = 0; i < nargs; i++) {
        strcat(key_str, keys[i]->name);
        /* TODO insert : to compare slices */
        if (i < nargs - 1)
            strcat(key_str, ";");
    }

    if (!any_slice && ((keychain = _get_sym(h, key_str)) != NULL)) {
        mem_sys_free(key_str);
        return keychain;
    }

    /* no, need a new one */
    keychain       = mem_allocate_zeroed_typed(SymReg);
    keychain->type = VTCONST;

    ++keychain->use_count;

    key = keychain;

    for (i = 0; i < nargs; i++) {
        /* if any component is a variable, we need to track it in
         * life analysis */
        if (REG_NEEDS_ALLOC(keys[i]))
            keychain->type |= VTREGKEY;

        key->nextkey = dup_sym(keys[i]);
        key          = key->nextkey;

        /* for registers, point ->reg to the original, needed by
         * life analyses & coloring */
        if (REG_NEEDS_ALLOC(keys[i]))
            key->reg = keys[i];
    }

    keychain->name  = key_str;
    keychain->set   = 'K';
    keychain->color = -1;

    _store_symreg(h, keychain);

    return keychain;
}


/*

=item C<void free_sym>

Frees all memory of the specified SymReg.  If it has a pcc_sub_t entry, frees
all memory of that structure as well.

=cut

*/

void
free_sym(ARGMOD(SymReg *r))
{
    ASSERT_ARGS(free_sym)
    pcc_sub_t * const sub = r->pcc_sub;

    if (sub) {
        mem_sys_free(sub->multi);
        mem_sys_free(sub->args);
        mem_sys_free(sub->arg_flags);
        mem_sys_free(sub->ret);
        mem_sys_free(sub->ret_flags);
        mem_sys_free(sub);
    }

    if (r->set == 'K') {
        SymReg *key     = r->nextkey;
        while (key) {
            SymReg *nextkey = key->nextkey;
            free_sym(key);
            key = nextkey;
        }
    }

    mem_sys_free(r->subid);
    mem_sys_free(r->name);
    mem_sys_free(r);
}

/*
 * This functions manipulate the hash of symbols.
 * XXX: Migrate to use Symbol and SymbolTable
 *
 */

/*

=item C<void create_symhash>

Creates a symbol hash table with space for 16 entries.

=cut

*/

void
create_symhash(ARGOUT(SymHash *hash))
{
    ASSERT_ARGS(create_symhash)
    hash->data    = mem_allocate_n_zeroed_typed(16, SymReg *);
    hash->size    = 16;
    hash->entries = 0;
}


/*

=item C<static void resize_symhash>

Resizes a symbol hash table.

=cut

*/

static void
resize_symhash(ARGMOD(SymHash *hsh))
{
    ASSERT_ARGS(resize_symhash)
    const int    new_size = hsh->size << 1; /* new size is twice as large */
    int          n_next   = 16;
    SymReg     **next_r   = mem_allocate_n_zeroed_typed(n_next, SymReg *);
    SymHash      nh;                        /* new symbol table */
    unsigned int i;

    nh.data = mem_allocate_n_zeroed_typed(new_size, SymReg *);

    for (i = 0; i < hsh->size; i++) {
        SymReg *r, *next;
        int     k;
        int     j = 0;

        for (r = hsh->data[i]; r; r = next) {
            next = r->next;

            /* remember all the chained next pointers and clear r->next */
            if (j >= n_next) {
                n_next <<= 1;
                mem_realloc_n_typed(next_r, n_next, SymReg *);
            }

            r->next     = NULL;
            next_r[j++] = r;
        }

        for (k = 0; k < j; ++k) {
            int new_i;
            r              = next_r[k];
            /* recompute hash for this symbol: */
            new_i          = hash_str(r->name) % new_size;
            r->next        = nh.data[new_i];
            nh.data[new_i] = r;
        }
    }

    /* free memory of old hash table */
    mem_sys_free(hsh->data);
    mem_sys_free(next_r);

    /* let the hashtable's data pointers point to the new data */
    hsh->data = nh.data;
    hsh->size = new_size;
}


/*

=item C<void _store_symreg>

Stores a symbol in the hash (internal use only).

=cut

*/

void
_store_symreg(ARGMOD(SymHash *hsh), ARGMOD(SymReg *r))
{
    ASSERT_ARGS(_store_symreg)
    const int i = hash_str(r->name) % hsh->size;
#if IMC_TRACE_HIGH
    printf("    store [%s]\n", r->name);
#endif
    r->next      = hsh->data[i];
    hsh->data[i] = r;

    hsh->entries++;

    if (hsh->entries >= hsh->size)
        resize_symhash(hsh);
}


/*

=item C<void store_symreg>

Stores a symbol in the hash.

=cut

*/

void
store_symreg(PARROT_INTERP, ARGMOD(SymReg *r))
{
    ASSERT_ARGS(store_symreg)
    _store_symreg(&IMCC_INFO(interp)->cur_unit->hash, r);
}


/*

=item C<SymReg * _get_sym>

Fetches a symbol from the hash (internal use only).

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg *
_get_sym(ARGIN(const SymHash *hsh), ARGIN(const char *name))
{
    ASSERT_ARGS(_get_sym)
    SymReg   *p;
    const unsigned int i = hash_str(name) % hsh->size;

    for (p = hsh->data[i]; p; p = p->next) {
#if IMC_TRACE_HIGH
        printf("   [%s]\n", p->name);
#endif
        if (STREQ(name, p->name))
            return p;
    }

    return NULL;
}

/*

=item C<SymReg * get_sym>

Gets a symbol from the current unit's symbol table.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg *
get_sym(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(get_sym)
    return _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name);
}


/*

=item C<SymReg * _find_sym>

Find a symbol hash or ghash (internal use only);

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg *
_find_sym(PARROT_INTERP, ARGIN_NULLOK(const Namespace *nspace),
        ARGIN(const SymHash *hsh), ARGIN(const char *name))
{
    ASSERT_ARGS(_find_sym)
    const Namespace *ns;
    SymReg          *p;

    for (ns = nspace; ns; ns = ns->parent) {
        char * const fullname = _mk_fullname(ns, name);
        p                     = _get_sym(hsh, fullname);

        mem_sys_free(fullname);

        if (p)
            return p;
    }

    p = _get_sym(hsh, name);

    if (p)
        return p;

    p = _get_sym(&IMCC_INFO(interp)->ghash, name);

    if (p)
        return p;

    return NULL;
}


/*

=item C<SymReg * find_sym>

Finds a symbol hash or ghash in the current unit, if it exists.  Otherwise
returns NULL.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg *
find_sym(PARROT_INTERP, ARGIN(const char *name))
{
    ASSERT_ARGS(find_sym)
    if (IMCC_INFO(interp)->cur_unit)
        return _find_sym(interp, _namespace,
            &IMCC_INFO(interp)->cur_unit->hash, name);

    return NULL;
}


/*

=item C<void clear_sym_hash>

Frees all memory of the symbols in the specified hash table.

=cut

*/

void
clear_sym_hash(ARGMOD(SymHash *hsh))
{
    ASSERT_ARGS(clear_sym_hash)
    unsigned int i;

    if (!hsh->data)
        return;

    for (i = 0; i < hsh->size; i++) {
        SymReg *p;
        for (p = hsh->data[i]; p;) {
            SymReg * const next = p->next;
            free_sym(p);
            p = next;
        }

        hsh->data[i] = NULL;
    }

    mem_sys_free(hsh->data);

    hsh->data    = NULL;
    hsh->entries = 0;
    hsh->size    = 0;
}


/*

=item C<void debug_dump_sym_hash>

Prints all identifiers in the specified hash table to stderr.

=cut

*/

void
debug_dump_sym_hash(ARGIN(const SymHash *hsh))
{
    ASSERT_ARGS(debug_dump_sym_hash)
    unsigned int i;

    for (i = 0; i < hsh->size; i++) {
        const SymReg *p = hsh->data[i];
        while (p) {
            fprintf(stderr, "%s ", p->name);
            p = p->next;
        }
    }
}


/*

=item C<void clear_locals>

Deletes all local symbols and clears life info from the given IMC_Unit.

=cut

*/

void
clear_locals(ARGIN_NULLOK(IMC_Unit *unit))
{
    ASSERT_ARGS(clear_locals)
    SymHash * const hsh = &unit->hash;
    unsigned int    i;

    for (i = 0; i < hsh->size; i++) {
        SymReg *p;

        for (p = hsh->data[i]; p;) {
            SymReg * const next = p->next;

            if (unit && p->life_info)
                free_life_info(unit, p);

            free_sym(p);
            p = next;
        }

        hsh->data[i] = NULL;
    }

    hsh->entries = 0;
}


/*

=item C<void clear_globals>

Clears global symbols.

=cut

*/

void
clear_globals(PARROT_INTERP)
{
    ASSERT_ARGS(clear_globals)
    SymHash * const hsh = &IMCC_INFO(interp)->ghash;

    if (hsh->data)
        clear_sym_hash(hsh);
}


/* utility functions: */

/*

=item C<unsigned int hash_str>

Computes the hash value for the string argument.

=cut

*/

PARROT_PURE_FUNCTION
unsigned int
hash_str(ARGIN(const char *str))
{
    ASSERT_ARGS(hash_str)
    unsigned long  key = 0;
    const    char *s;

    for (s = str; *s; s++)
        key = key * 65599 + *s;

    return key;
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
