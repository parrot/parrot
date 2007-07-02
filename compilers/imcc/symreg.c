/*
 * symreg.c
 *
 * XXX: SymReg stuff has become overused. SymReg should be for symbolic
 * registers, reg allocation, etc. but we are now using it for extensive
 * symbol table management. Need to convert much of this over the use Symbol
 * and SymbolTable (see symbol.h and symbol.c)
 *
 * imcc symbol handling
 */

#include "imc.h"

/* Globals: */
/* Code: */

/* HEADERIZER HFILE: compilers/imcc/symreg.h */

/* HEADERIZER BEGIN: static */

static SymReg * _get_sym_typed(
    const SymHash *hsh /*NN*/,
    const char *name /*NN*/,
    int t )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static char * add_ns( Interp *interp, char *name /*NN*/ )
        __attribute__nonnull__(2);

static SymReg* mk_pmc_const_2( Interp *interp /*NN*/,
    IMC_Unit *unit,
    SymReg *left /*NN*/,
    SymReg *rhs /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void resize_symhash( SymHash *hsh /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: static */

void
push_namespace(char * name)
{
    Namespace * const ns = (Namespace *) malloc(sizeof (*ns));

    ns->parent = _namespace;
    ns->name   = name;
    ns->idents = NULL;
    _namespace = ns;
}

void
pop_namespace(char *name /*NULLOK*/)
{
    Namespace * ns = _namespace;

    if (ns == NULL) {
        fprintf(stderr, "pop() on empty namespace stack\n");
        abort();
    }

    if (name && strcmp(name, ns->name) != 0) {
        fprintf(stderr, "tried to pop namespace(%s), "
                "but top of stack is namespace(%s)\n", name, ns->name);
        abort();
    }

    while (ns->idents) {
        Identifier * const ident = ns->idents;
        ns->idents               = ident->next;
        free(ident);
    }

    _namespace = ns->parent;
    free(ns);
}

/* Gets a symbol from the hash */
static SymReg *
_get_sym_typed(const SymHash *hsh /*NN*/, const char *name /*NN*/, int t)
{
    const int i = hash_str(name) % hsh->size;
    SymReg   *p;

    for (p = hsh->data[i]; p; p = p->next) {
        if (!strcmp(name, p->name) && t == p->set)
            return p;
    }

    return 0;
}

/* symbolic registers */

/* Makes a new SymReg from its varname and type
 *
 * char * name is a malloced string that will
 * be used if the symbol needs to be created, or
 * freed if an old symbol is found.
 * This is a potentially dangerous semantic that
 * should be changed.
 */
SymReg *
_mk_symreg(SymHash* hsh /*NN*/, char *name /*NN*/, int t)
{
    SymReg * r = _get_sym_typed(hsh, name, t);

    if (r) {
        free(name);
        return r;
    }

    r = (SymReg *)calloc(1, sizeof (SymReg));

    if (!r) {
        fprintf(stderr, "Memory error at mk_symreg\n");
        abort();
    }

    r->set        = t;
    r->type       = VTREG;
    r->name       = name;
    r->color      = -1;
    r->want_regno = -1;

    if (name[0])
        _store_symreg(hsh,r);

    return r;
}

SymReg *
mk_symreg(Interp *interp /*NN*/, char *name /*NN*/, int t)
{
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    return _mk_symreg(&unit->hash, name, t);
}

/*
 * Dump a SymReg to a printable format.
 */
char *
symreg_to_str(const SymReg *s /*NN*/)
    /* MALLOC, WARN_UNUSED */
{
    /* NOTE: the below magic number encompasses all the quoted strings which
     * may be included in the sprintf output */
    char * const buf = (char *) malloc(250 + strlen(s->name));
    const int    t   = s->type;

    sprintf(buf, "symbol [%s]  set [%c]  color [" INTVAL_FMT "]  type [",
                 s->name, s->set, s->color);

    if (t & VTCONST)      { strcat(buf, "VTCONST ");      }
    if (t & VTREG)        { strcat(buf, "VTREG ");        }
    if (t & VTIDENTIFIER) { strcat(buf, "VTIDENTIFIER "); }
    if (t & VTADDRESS)    { strcat(buf, "VTADDRESS ");    }
    if (t & VTREGKEY)     { strcat(buf, "VTREGKEY ");     }
    if (t & VTPASM)       { strcat(buf, "VTPASM ");       }
    if (t & VT_CONSTP)    { strcat(buf, "VT_CONSTP ");    }
    if (t & VT_PCC_SUB)   { strcat(buf, "VT_PCC_SUB ");   }
    if (t & VT_FLAT)      { strcat(buf, "VT_FLAT ");      }
    if (t & VT_OPTIONAL)  { strcat(buf, "VT_OPTIONAL ");  }
    if (t & VT_NAMED)     { strcat(buf, "VT_NAMED ");  }
    strcat(buf, "]");

    return buf;
}


SymReg *
mk_temp_reg(Interp *interp /*NN*/, int t)
{
    char buf[128];
    static int temp;
    sprintf(buf, "__imcc_temp_%d", ++temp);
    return mk_symreg(interp, str_dup(buf), t);
}

SymReg *
mk_pcc_sub(Interp *interp /*NN*/, char *name /*NN*/, int proto)
{
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    SymReg   * const r    = _mk_symreg(&unit->hash, name, proto);

    r->type    = VT_PCC_SUB;
    r->pcc_sub = (pcc_sub_t*)calloc(1, sizeof (struct pcc_sub_t));

    return r;
}

/*
 * add current namespace to sub decl
 */
void
add_namespace(Interp *interp /*NN*/, struct _IMC_Unit *unit /*NN*/)
{
    SymReg * const ns = IMCC_INFO(interp)->cur_namespace;

    if (!ns)
        return;

    if (unit->_namespace)
        return;

    if (unit->prev && unit->prev->_namespace == ns)
        unit->_namespace = ns;
    else {
        SymReg * const g = dup_sym(ns);
        SymReg        *r = _get_sym(&IMCC_INFO(interp)->ghash, g->name);

        unit->_namespace = g;
        g->reg           = ns;
        g->type          = VT_CONSTP;

        if (!r || r->type != VT_CONSTP )
            _store_symreg(&IMCC_INFO(interp)->ghash, g);
    }
}

/*
 * Add a register or constant to the function arg list
 */
void
add_pcc_arg(SymReg *r /*NN*/, SymReg *arg /*NN*/)
{
    const int n      = r->pcc_sub->nargs;

    r->pcc_sub->args = (SymReg **)realloc(r->pcc_sub->args,
        (n + 1) * sizeof (SymReg *));
    r->pcc_sub->args[n]   = arg;
    r->pcc_sub->arg_flags = (int *)realloc(r->pcc_sub->arg_flags,
        (n+1) * sizeof (int));
    r->pcc_sub->arg_flags[n] = arg->type;

    arg->type &= ~(VT_FLAT|VT_OPTIONAL|VT_OPT_FLAG|VT_NAMED);

    r->pcc_sub->nargs++;
}

/* XXX Why do we have both add_pcc_arg and add_pcc_param? */
void
add_pcc_param(SymReg *r /*NN*/, SymReg *arg /*NN*/)
{
    add_pcc_arg(r, arg);
}

void
add_pcc_result(SymReg *r /*NN*/, SymReg *arg /*NN*/)
{
    const int n     = r->pcc_sub->nret;

    r->pcc_sub->ret = (SymReg **)realloc(r->pcc_sub->ret,
        (n + 1) * sizeof (SymReg *));

    r->pcc_sub->ret[n] = arg;

    /* we can't keep the flags in the SymReg as the SymReg
     * maybe used with different flags for different calls */
    r->pcc_sub->ret_flags = (int *)realloc(r->pcc_sub->ret_flags,
        (n + 1) * sizeof (int));

    r->pcc_sub->ret_flags[n] = arg->type;

    arg->type &= ~(VT_FLAT|VT_OPTIONAL|VT_OPT_FLAG|VT_NAMED);

    r->pcc_sub->nret++;
}

void
add_pcc_multi(SymReg *r /*NN*/, SymReg *arg)
{
    const int n       = r->pcc_sub->nmulti;

    r->pcc_sub->multi = (SymReg **)realloc(r->pcc_sub->multi,
        (n + 1) * sizeof (SymReg *));

    r->pcc_sub->multi[n] = arg;
    r->pcc_sub->nmulti++;
}

void
add_pcc_return(SymReg *r /*NN*/, SymReg *arg /*NN*/)
{
    add_pcc_result(r, arg);
}

void
add_pcc_sub(SymReg *r /*NN*/, SymReg * arg)
{
    r->pcc_sub->sub = arg;
}

void
add_pcc_cc(SymReg *r /*NN*/, SymReg *arg)
{
    r->pcc_sub->cc = arg;
}

SymReg *
mk_pasm_reg(Interp *interp /*NN*/, char *name)
{
    SymReg * r = _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name);

    if (r)
        return r;

    r        = mk_symreg(interp, name, *name);
    r->type  = VTPASM;
    r->color = atoi(name + 1);

    if (r->color < 0)
        IMCC_fataly(interp, E_SyntaxError,
                "register number out of range '%s'\n", name);

    return r;
}

char *
_mk_fullname(const Namespace *ns /*NULLOK*/, const char *name /*NN*/)
{
    char * result;

    if (!ns)
        return str_dup(name);

    result = (char *) malloc(strlen(name) + strlen(ns->name) + 3);
    sprintf(result, "%s::%s", ns->name, name);

    return result;
}

char *
mk_fullname(const char *name /*NN*/)
{
    return _mk_fullname(_namespace, name);
}

/* Makes a new identifier */
SymReg *
mk_ident(Interp *interp /*NN*/, char *name /*NN*/, int t)
{
    char   *fullname = _mk_fullname(_namespace, name);
    SymReg *r;

    if (_namespace) {
        Identifier * const ident = (Identifier *)calloc(1,
            sizeof (struct ident_t));

        ident->name        = fullname;
        ident->next        = _namespace->idents;
        _namespace->idents = ident;
    }

    r       = mk_symreg(interp, fullname, t);
    r->type = VTIDENTIFIER;

    free(name);

    if (t == 'P') {
        r->pmc_type = IMCC_INFO(interp)->cur_pmc_type;
        IMCC_INFO(interp)->cur_pmc_type = 0;
    }

    return r;
}

SymReg*
mk_ident_ur(Interp *interp /*NN*/, char *name, int t)
{
    SymReg * const r = mk_ident(interp, name, t);
    r->usage        |= U_NON_VOLATILE;

    return r;
}

static SymReg*
mk_pmc_const_2(Interp *interp /*NN*/, IMC_Unit *unit, SymReg *left /*NN*/, SymReg *rhs /*NN*/)
{
    SymReg *r[2];
    char   *name;
    int     len;

    if (IMCC_INFO(interp)->state->pasm_file) {
        IMCC_fataly(interp, E_SyntaxError,
                "Ident as PMC constant",
                " %s\n", left->name);
    }

    r[0] = left;

    /* strip delimiters */
    name          = str_dup(rhs->name + 1);
    len           = strlen(name);
    name[len - 1] = '\0';

    free(rhs->name);

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
    }

    r[1] = rhs;
    INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);

    return NULL;
}

/* Makes a new identifier constant with value val */
SymReg *
mk_const_ident(Interp *interp /*NN*/,
        char *name /*NN*/, int t, SymReg *val /*NN*/, int global)
{
    SymReg *r;

    /*
     * Forbid assigning a string to anything other than a string
     * or PMC constant
     */
    if (t == 'N' || t == 'I') {
        if (val->set == 'S') {
            IMCC_fataly(interp, E_TypeError,
                    "bad const initialisation");
        }
        /* Cast value to const type */
        val->set = t;
    }

    if (global) {
        if (t == 'P') {
            IMCC_fataly(interp, E_SyntaxError,
                    "global PMC constant not allowed");
        }
        r = _mk_symreg(&IMCC_INFO(interp)->ghash, name, t);
    }
    else {
        if (t == 'P') {
            r = mk_ident(interp, name, t);
            return mk_pmc_const_2(interp, IMCC_INFO(interp)->cur_unit, r, val);
        }
        r = mk_ident(interp, name, t);
    }

    r->type = VT_CONSTP;
    r->reg  = val;

    return r;
}

/* Makes a new constant */
SymReg *
_mk_const(SymHash *hsh /*NN*/, char *name /*NN*/, int t)
{
    SymReg * const r = _mk_symreg(hsh, name, t);
    r->type          = VTCONST;

    if (t == 'U') {
        /* charset:"string" */
        r->set   = 'S';
        r->type |= VT_ENCODED;
    }

    r->use_count++;

    return r;
}

SymReg *
mk_const(Interp *interp /*NN*/, char * name, int t)
{
    SymHash * const h = &IMCC_INFO(interp)->ghash;

    if (!h->data)
        create_symhash(h);

    return _mk_const(h, name, t);
}

/* add namespace to sub if any */
static char *
add_ns(Interp *interp, char *name /*NN*/)
{
    int len, l;
    char *ns_name, *p;

    if (!IMCC_INFO(interp)->cur_namespace ||
       (l = strlen(IMCC_INFO(interp)->cur_namespace->name)) <= 2)
        return name;

    /* TODO keyed syntax */
    len     = strlen(name) + l  + 4;
    ns_name = (char*)mem_sys_allocate(len);

    strcpy(ns_name, IMCC_INFO(interp)->cur_namespace->name);
    *ns_name       = '_';
    ns_name[l - 1] = '\0';
    strcat(ns_name, "@@@");
    strcat(ns_name, name);
    mem_sys_free(name);

    p = strstr(ns_name, "\";\"");   /* Foo";"Bar  -> Foo@@@Bar */

    while (p) {
        p[0] = '@';
        p[1] = '@';
        p[2] = '@';
        p    = strstr(ns_name, "\";\")");
    }

    return ns_name;
}

/* Makes a new address */
SymReg *
_mk_address(Interp *interp /*NN*/, SymHash *hsh /*NN*/, char *name /*NN*/,
            int uniq)
{
    SymReg * r;

    if (uniq == U_add_all) {
        r = (SymReg *)calloc(1, sizeof (SymReg));
        r->type = VTADDRESS;
        r->name = name;
        _store_symreg(hsh,r);
        return r;
    }

    if (uniq == U_add_uniq_sub)
        name = add_ns(interp, name);

    if (uniq && (r = _get_sym(hsh, name)) &&
            r->type == VTADDRESS &&
            r->lhs_use_count            /* we use this for labels/subs */
      ) {
        if (uniq == U_add_uniq_label) {
            IMCC_fataly(interp, E_SyntaxError,
                   "Label '%s' already defined\n", name);
        }
        else if (uniq == U_add_uniq_sub)
            IMCC_fataly(interp, E_SyntaxError,
                    "Subroutine '%s' already defined\n", name);
    }

    r       = _mk_symreg(hsh, name, 0);
    r->type = VTADDRESS;

    if (uniq)
        r->lhs_use_count++;

    return r;
}

/* Eventually make mk_address static */
SymReg *
mk_address(Interp *interp /*NN*/, char *name, int uniq)
{
    SymHash * const h = *name == '_'
        ? &IMCC_INFO(interp)->ghash : &IMCC_INFO(interp)->cur_unit->hash;
    SymReg  * const s = _mk_address(interp, h, name, uniq);

    if (*name == '_')
       s->usage |= U_FIXUP;

    return s;
}

/*
 * Make and store a new address label for a sub.
 * Label gets a fixup entry.
 */
SymReg *
mk_sub_label(Interp *interp /*NN*/, char *name)
{
    SymReg * const s = _mk_address(interp, &IMCC_INFO(interp)->ghash,
            name, U_add_uniq_sub);

    s->usage |= U_FIXUP;

    return s;
}

/*
 * Make a symbol for a label, symbol gets a fixup entry.
 */
SymReg *
mk_sub_address(Interp *interp /*NN*/, char *name)
{
    SymReg * const s = _mk_address(interp, &IMCC_INFO(interp)->ghash,
            name, U_add_all);

    s->usage |= U_FIXUP;

    return s;
}

/*
 * Make a local symbol, no fixup entry.
 */
SymReg *
mk_local_label(Interp *interp /*NN*/, char *name)
{
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, &unit->hash, name, U_add_uniq_label);
}

SymReg *
mk_label_address(Interp *interp /*NN*/, char *name)
{
    IMC_Unit * const unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, &unit->hash, name, U_add_once);
}


/* link keys to a keys structure = SymReg
 *
 * we might have
 *
 * what         op      type        pbc.c:build_key()
 * --------------------------------------------------
 *  int const   _kic    VTCONST     no
 *  int reg     _ki     VTREG       no
 *  str const   _kc     VTCONST     yes
 *  str reg     _kc     VTREG       yes
 *
 *  "key" ';' "key" _kc           -> (list of above)   yes
 *  "key" ';' $I0   _kc  VTREGKEY -> (list of above)   yes
 *
 *  The information about which reg should be passed to build_key() is
 *  in the instruction.
 *
 *  A key containing a variable has a special flag VTREGKEY
 *  because this key must be considered for life analysis for
 *  all the chain members, that are variables.
 *
 *  An instruction with a keychain looks like this
 *
 *  e.h. set I0, P["abc";0;I1]
 *
 *  ins->r[2]  = keychain  'K'
 *  keychain->nextkey = SymReg(VTCONST) "abc"
 *              ->nextkey = SymReg(VTCONST) 0
 *                 ->nextkey = SymReg(VTREG), ...->reg = VTVAR I1
 *                    ->nextkey = 0
 *
 *  We can't use the consts or keys in the chain directly,
 *  because a different usage would destroy the ->nextkey pointers
 *  so these are all copies.
 *  XXX and currently not freed
 *
 */

SymReg *
dup_sym(const SymReg *r /*NN*/)
    /* MALLOC, WARN_UNUSED */
{
    SymReg * const new_sym = mem_allocate_typed(SymReg);

    *new_sym      = *r;
    new_sym->name = str_dup(r->name);

    return new_sym;
}

SymReg *
link_keys(Interp *interp /*NN*/, int nargs, SymReg * keys[], int force)
{
    SymReg *key, *keychain;
    int i, len, any_slice;
    char *key_str;

    /* namespace keys are global consts - no cur_unit */
    SymHash * const h = IMCC_INFO(interp)->cur_unit ?
        &IMCC_INFO(interp)->cur_unit->hash : &IMCC_INFO(interp)->ghash;

    if (nargs == 0)
        IMCC_fataly(interp, E_SyntaxError,
            "link_keys: hu? no keys\n");

    /* short-circuit simple key unless we've been told not to */
    if (nargs == 1 && !force && !(keys[0]->type & VT_SLICE_BITS))
        return keys[0];

    /* calc len of key_str
     * also check if this is a slice - the first key might not
     * have the slice flag set
     */
    for (i = any_slice = 0, len = 0; i < nargs; i++) {
        len += 1 + strlen(keys[i]->name);
        if (keys[i]->type & VT_SLICE_BITS)
            any_slice = 1;
    }

    if (any_slice && !(keys[0]->type & VT_SLICE_BITS))
        keys[0]->type |= (VT_START_SLICE|VT_END_SLICE);

    key_str  = (char*)malloc(len);
    *key_str = 0;

    /* first look, if we already have this exact key chain */
    for (i = 0; i < nargs; i++) {
        strcat(key_str, keys[i]->name);
        /* TODO insert : to compare slices */
        if (i < nargs - 1)
            strcat(key_str, ";");
    }

    if (!any_slice && (keychain = _get_sym(h, key_str)) != 0) {
        free(key_str);
        return keychain;
    }

    /* no, need a new one */
    keychain       = mem_allocate_zeroed_typed(SymReg);
    keychain->type = VTCONST;

    ++keychain->use_count;

    key = keychain;

    for (i = 0; i < nargs; i++) {
        /* if any component is a variable, we need to track it in
         * life analysis
         */
        if (keys[i]->type & VTREGISTER)
            keychain->type |= VTREGKEY;

        key->nextkey = dup_sym(keys[i]);
        key          = key->nextkey;

        /* for registers, point ->reg to the original, needed by
         * life analyses & coloring
         */
        if (keys[i]->type & VTREGISTER)
            key->reg = keys[i];
    }

    keychain->name  = key_str;
    keychain->set   = 'K';
    keychain->color = -1;

    _store_symreg(h, keychain);

    return keychain;
}

void
free_sym(SymReg *r /*NN*/)
{
    if (r->pcc_sub) {
        if (r->pcc_sub->args)
            free(r->pcc_sub->args);
        if (r->pcc_sub->arg_flags)
            free(r->pcc_sub->arg_flags);
        if (r->pcc_sub->ret)
            free(r->pcc_sub->ret);
        if (r->pcc_sub->ret_flags)
            free(r->pcc_sub->ret_flags);
        free(r->pcc_sub);
    }

    /* TODO free keychain */
    free(r->name);
    free(r);
}

/*
 * This functions manipulate the hash of symbols.
 * XXX: Migrate to use Symbol and SymbolTable
 *
 */

void
create_symhash(SymHash *hash /*NN*/)
{
   hash->data    = (SymReg**)mem_sys_allocate_zeroed(16 * sizeof (SymReg*));
   hash->size    = 16;
   hash->entries = 0;
}

static void
resize_symhash(SymHash *hsh /*NN*/)
{
    SymHash nh;
    SymReg *r, *next;
    const int new_size = hsh->size << 1;
    int i;
    SymReg ** next_r;
    int n_next, k;

    nh.data = (SymReg**)mem_sys_allocate_zeroed(new_size * sizeof (SymReg*));
    n_next  = 16;
    next_r  =  (SymReg**)mem_sys_allocate_zeroed(n_next  * sizeof (SymReg*));

    for (i = 0; i < hsh->size; i++) {
        int j = 0;
        for (r = hsh->data[i]; r; r = next) {
            next = r->next;
            /*
             * have to remember all the chained next pointers and
             * clear r->next
             */
            if (j >= n_next) {
                n_next <<= 1;
                next_r = (SymReg **)mem_sys_realloc(next_r,
                    n_next * sizeof (SymReg*));
            }

            r->next = NULL;
            next_r[j++] = r;
        }

        for (k = 0; k < j; ++k) {
            int new_i;
            r              = next_r[k];
            new_i          = hash_str(r->name) % new_size;
            r->next        = nh.data[new_i];
            nh.data[new_i] = r;
        }
    }

    mem_sys_free(hsh->data);
    mem_sys_free(next_r);

    hsh->data = nh.data;
    hsh->size = new_size;
}

/* Stores a symbol into the hash */
void
_store_symreg(SymHash *hsh /*NN*/, SymReg *r /*NN*/)
{
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

void
store_symreg(Interp *interp /*NN*/, SymReg *r /*NN*/)
{
    _store_symreg(&IMCC_INFO(interp)->cur_unit->hash, r);
}

/* Gets a symbol from the hash */
SymReg *
_get_sym(SymHash *hsh /*NN*/, const char *name /*NN*/)
{
    SymReg   *p;
    const int i = hash_str(name) % hsh->size;

    for (p = hsh->data[i]; p; p = p->next) {
#if IMC_TRACE_HIGH
        printf("   [%s]\n", p->name);
#endif
        if (!strcmp(name, p->name))
            return p;
    }

    return 0;
}

/* Gets a symbol from the current unit symbol table */
SymReg *
get_sym(Interp *interp /*NN*/, const char *name /*NN*/)
{
    return _get_sym(&IMCC_INFO(interp)->cur_unit->hash, name);
}

/* find a symbol hash or ghash */
SymReg *
_find_sym(Interp *interp, const Namespace *nspace /*NULLOK*/,
    SymHash *hsh /*NN*/, const char *name /*NN*/)
{
    const Namespace * ns;
    SymReg *p;

    for (ns = nspace; ns; ns = ns->parent) {
        char * const fullname = _mk_fullname(ns, name);
        p                     = _get_sym(hsh, fullname);

        free(fullname);

        if (p)
            return p;
    }

    p = _get_sym(hsh, name);

    if (p)
        return p;

    p = _get_sym(&IMCC_INFO(interp)->ghash, name);

    if (p)
        return p;

    return 0;
}


SymReg *
find_sym(Interp *interp /*NN*/, const char *name /*NN*/)
{
    if (IMCC_INFO(interp)->cur_unit)
        return _find_sym(interp, _namespace,
            &IMCC_INFO(interp)->cur_unit->hash, name);

    return NULL;
}


void
clear_sym_hash(SymHash *hsh /*NN*/)
{
    int i;

    if (!hsh->data)
        return;

    for (i = 0; i < hsh->size; i++) {
        SymReg *p;
        for (p = hsh->data[i]; p; ) {
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

void
debug_dump_sym_hash(SymHash *hsh)
{
    int i;

    for (i = 0; i < hsh->size; i++) {
        const SymReg *p;
        for (p = hsh->data[i]; p; p = p->next) {
            fprintf(stderr, "%s ", p->name);
        }
    }
}

/* Deletes all local symbols and clears life info */
void
clear_locals(struct _IMC_Unit *unit /*NULLOK*/)
{
    SymHash * const hsh = &unit->hash;
    int i;

    for (i = 0; i < hsh->size; i++) {
        SymReg *p;
        for (p = hsh->data[i]; p; ) {
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

/* Clear global symbols */
void
clear_globals(Interp *interp /*NN*/)
{
    SymHash * const hsh = &IMCC_INFO(interp)->ghash;

    if (hsh->data)
        clear_sym_hash(hsh);
}


/* utility functions: */

unsigned int
hash_str(const char *str /*NN*/)
    /* PURE, WARN_UNUSED */
{
    unsigned long  key = 0;
    const    char *s;

    for (s=str; *s; s++)
        key = key * 65599 + *s;

    return key;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
