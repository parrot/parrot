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


void
push_namespace(char * name)
{
    Namespace * ns = (Namespace *) malloc(sizeof(*ns));
    ns->parent = namespace;
    ns->name = name;
    ns->idents = NULL;
    namespace = ns;
}

void
pop_namespace(char * name)
{
    Namespace * ns = namespace;
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
        Identifier * ident = ns->idents;
        ns->idents = ident->next;
        free(ident);
    }

    namespace = ns->parent;
    free(ns);
}

/* Gets a symbol from the hash */
static SymReg *
_get_sym_typed(SymReg * hsh[], const char * name, int t)
{
    SymReg * p;
    int i = hash_str(name) % HASH_SIZE;
    for (p = hsh[i]; p; p = p->next) {
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
_mk_symreg(SymReg* hsh[], char * name, int t)
{
    SymReg * r;
    if ((r = _get_sym_typed(hsh, name, t))) {
	free(name);
        return r;
    }
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_symreg\n");
	abort();
    }
    r->name = name;
    r->color = -1;
    r->want_regno = -1;
    r->set = t;
    r->type = VTREG;

    if (name[0])
        _store_symreg(hsh,r);
    return r;
}

SymReg *
mk_symreg(Interp *interp, char * name, int t)
{
    IMC_Unit *unit = IMCC_INFO(interp)->last_unit;
    return _mk_symreg(unit->hash, name, t);
}

/*
 * Dump a SymReg to a printable format.
 */
char *
symreg_to_str(SymReg * s)
{
    char buf[8192];
    int t = s->type;
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
    if (t & VT_FLATTEN)   { strcat(buf, "VT_FLATTEN ");   }
    strcat(buf, "]");
    return str_dup(buf);
}


SymReg *
mk_temp_reg(Interp *interp, int t)
{
    char buf[128];
    static int temp;
    sprintf(buf, "__imcc_temp_%d", ++temp);
    return mk_symreg(interp, str_dup(buf), t);
}

SymReg *
mk_pcc_sub(Interp *interp, char * name, int proto) {
    IMC_Unit *unit = IMCC_INFO(interp)->last_unit;
    SymReg *r = _mk_symreg(unit->hash, name, proto);
    r->type = VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    return r;
}

/*
 * add current namespace to sub decl
 */
void
add_namespace(Parrot_Interp interp, IMC_Unit *unit)
{
    SymReg *ns = IMCC_INFO(interp)->cur_namespace;
    SymReg *r, *g;

    if (!ns || strlen(ns->name) <= 2)
        return;
    if (unit->namespace)
        return;
    if (unit->prev && unit->prev->namespace == ns)
        unit->namespace = ns;
    else {
        g = dup_sym(ns);
        unit->namespace = g;
        g->reg = ns;
        g->type = VT_CONSTP;
        if (! (r = _get_sym(IMCC_INFO(interp)->ghash, g->name)) ||
                r->type != VT_CONSTP )
            _store_symreg(IMCC_INFO(interp)->ghash, g);
    }
}

/*
 * Add a register or constant to the function arg list
 */
void
add_pcc_arg(SymReg *r, SymReg * arg)
{
    int n = r->pcc_sub->nargs;
#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, "add_pcc_arg(%s)\n", arg->name);
#endif
    r->pcc_sub->args = realloc(r->pcc_sub->args, (n + 1) * sizeof(SymReg *));
    r->pcc_sub->args[n] = arg;
    r->pcc_sub->nargs++;
}

void
add_pcc_param(SymReg *r, SymReg * arg)
{
    add_pcc_arg(r, arg);
}

void
add_pcc_result(SymReg *r, SymReg * arg)
{
    int n = r->pcc_sub->nret;
    r->pcc_sub->ret = realloc(r->pcc_sub->ret, (n + 1) * sizeof(SymReg *));
    r->pcc_sub->ret[n] = arg;
    r->pcc_sub->nret++;
}

void
add_pcc_multi(SymReg *r, SymReg * arg)
{
    int n = r->pcc_sub->nmulti;
    r->pcc_sub->multi = realloc(r->pcc_sub->multi, (n + 1) * sizeof(SymReg *));
    r->pcc_sub->multi[n] = arg;
    r->pcc_sub->nmulti++;
}

void
add_pcc_return(SymReg *r, SymReg * arg)
{
    add_pcc_result(r, arg);
}

void
add_pcc_sub(SymReg *r, SymReg * arg)
{
    r->pcc_sub->sub = arg;
}

void
add_pcc_cc(SymReg *r, SymReg * arg)
{
    r->pcc_sub->cc = arg;
}

SymReg *
mk_pasm_reg(Interp *interp, char * name)
{
    SymReg * r;
    if ((r = _get_sym(cur_unit->hash, name))) {
	free(name);
        return r;
    }
    r = mk_symreg(interp, name, *name);
    r->type = VTPASM;
    r->color = atoi(name+1);
    if (r->color < 0 || r->color > 31)
        IMCC_fataly(interp, E_SyntaxError,
                "register number out of range '%s'\n", name);
    return r;
}

char *
_mk_fullname(Namespace * ns, const char * name)
{
    char * result;

    if (ns == NULL) return str_dup(name);
    result = (char *) malloc(strlen(name) + strlen(ns->name) + 3);
    sprintf(result, "%s::%s", ns->name, name);
    return result;
}

char *
mk_fullname(const char * name)
{
    return _mk_fullname(namespace, name);
}

extern int cur_pmc_type;
/* Makes a new identifier */
SymReg *
mk_ident(Interp *interp, char * name, int t)
{
    char * fullname = _mk_fullname(namespace, name);
    Identifier * ident;
    SymReg * r;
    if (namespace) {
        ident = calloc(1, sizeof(struct ident_t));
        ident->name = fullname;
        ident->next = namespace->idents;
        namespace->idents = ident;
    }
    r = mk_symreg(interp, fullname, t);
    r->type = VTIDENTIFIER;
    free(name);
    if (t == 'P') {
        r->pmc_type = cur_pmc_type;
        cur_pmc_type = 0;
    }
    return r;
}

static SymReg*
mk_pmc_const_2(Parrot_Interp interp, IMC_Unit *unit, SymReg *left, SymReg *rhs)
{
    SymReg *r[IMCC_MAX_REGS];
    char *name;
    int len;

    if (IMCC_INFO(interp)->state->pasm_file) {
        IMCC_fataly(interp, E_SyntaxError,
                "Ident as PMC constant",
                " %s\n", left->name);
    }
    r[0] = left;
    /* strip delimiters */
    name = str_dup(rhs->name + 1);
    len = strlen(name);
    name[len - 1] = '\0';
    free(rhs->name);
    rhs->name = name;
    rhs->set = 'P';
    rhs->pmc_type = left->pmc_type;
    switch (rhs->pmc_type) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            r[1] = rhs;
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
mk_const_ident(Interp *interp,
        char *name, int t, SymReg *val, int global)
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
        r = _mk_symreg(IMCC_INFO(interp)->ghash, name, t);
    }
    else {
        if (t == 'P') {
            r = mk_ident(interp, name, t);
            return mk_pmc_const_2(interp, cur_unit, r, val);
        }
        r = mk_ident(interp, name, t);
    }
    r->type = VT_CONSTP;
    r->reg = val;
    return r;
}

/* Makes a new constant*/
SymReg *
_mk_const(SymReg *hsh[], char * name, int t)
{
    SymReg * r = _mk_symreg(hsh, name, t);
    r->type = VTCONST;
    if (t == 'U') {
        /* charset:"string" */
        r->set = 'S';
        r->type |= VT_ENCODED;
    }
    r->use_count++;
    return r;
}

SymReg *
mk_const(Interp *interp, char * name, int t)
{
    SymReg **h = IMCC_INFO(interp)->ghash;
    if (!h)
        h = IMCC_INFO(interp)->ghash =
            mem_sys_allocate_zeroed(HASH_SIZE * sizeof(SymReg*));
    return _mk_const(h, name, t);
}

extern SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * add namespace to sub if any
 * */
static char *
add_ns(char *name)
{
    int len, l;
    char *ns_name, *p;

    if (!cur_namespace || (l = strlen(cur_namespace->name)) <= 2)
        return name;
    /* TODO keyed syntax */
    len = strlen(name) + l  + 4;
    ns_name = mem_sys_allocate(len);
    strcpy(ns_name, cur_namespace->name);
    *ns_name = '_';
    ns_name[l - 1] = '\0';
    strcat(ns_name, "@@@");
    strcat(ns_name, name);
    mem_sys_free(name);
    p = strstr(ns_name, "\";\"");   /* Foo";"Bar  -> Foo@@@Bar */
    while (p) {
        p[0] = '@';
        p[1] = '@';
        p[2] = '@';
        p = strstr(ns_name, "\";\")");
    }
    return ns_name;
}

/* Makes a new address */
SymReg *
_mk_address(Interp *interp, SymReg *hsh[], char * name, int uniq)
{
    SymReg * r;
    if (uniq == U_add_all) {

        r = calloc(1, sizeof(SymReg));
        r->type = VTADDRESS;
        r->name = name;
        _store_symreg(hsh,r);
        return r;
    }
    if (uniq == U_add_uniq_sub)
        name = add_ns(name);

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
    r = _mk_symreg(hsh, name, 0);
    r->type = VTADDRESS;
    if (uniq)
        r->lhs_use_count++;
    return r;
}

SymReg *
mk_address(Interp *interp, char * name, int uniq)
{
    SymReg * s;
    SymReg ** h = *name == '_' ? IMCC_INFO(interp)->ghash : cur_unit->hash;
    s = _mk_address(interp, h, name, uniq);
    if (*name == '_')
       s->usage |= U_FIXUP;
    return s;
}

/*
 * Make and store a new address label for a sub.
 * Label gets a fixup entry.
 */
SymReg *
mk_sub_label(Interp *interp, char * name)
{
    SymReg * s = _mk_address(interp, IMCC_INFO(interp)->ghash,
            name, U_add_uniq_sub);
    s->usage |= U_FIXUP;
    return s;
}

/*
 * Make a symbol for a label, symbol gets a fixup entry.
 */
SymReg *
mk_sub_address(Interp *interp, char * name)
{
    SymReg * s = _mk_address(interp, IMCC_INFO(interp)->ghash,
            name, U_add_once);
    s->usage |= U_FIXUP;
    return s;
}

/*
 * Make a local symbol, no fixup entry.
 */
SymReg *
mk_local_label(Interp *interp, char * name)
{
    IMC_Unit *unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, unit->hash, name, U_add_uniq_label);
}

/*
 *
 */
SymReg *
mk_label_address(Interp *interp, char * name)
{
    IMC_Unit *unit = IMCC_INFO(interp)->last_unit;
    return _mk_address(interp, unit->hash, name, U_add_once);
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
dup_sym(SymReg *r)
{
    SymReg * new = mem_sys_allocate(sizeof(SymReg));
    memcpy(new, r, sizeof(SymReg));
    new->name = str_dup(r->name);
    return new;
}

SymReg *
link_keys(Interp *interp, int nargs, SymReg * keys[])
{
    SymReg * first, *key, *keychain;
    int i, len, any_slice;
    char *key_str;
    /* namespace keys are global consts - no cur_unit */
    SymReg **h = cur_unit ? cur_unit->hash : IMCC_INFO(interp)->ghash;

    if (nargs == 0)
        IMCC_fataly(interp, E_SyntaxError,
            "link_keys: hu? no keys\n");
    first = keys[0];
    if (nargs == 1 && !(keys[0]->type & VT_SLICE_BITS))
        return first;
    /* calc len of key_str
     * also check if this is a slice - the first key might not
     * have the slice flag set
     */
    for (i = any_slice = 0, len = 1; i < nargs; i++) {
        len += strlen(keys[i]->name);
        if (i < nargs - 1)
            ++len;
        if (keys[i]->type & VT_SLICE_BITS)
            any_slice = 1;
    }
    if (any_slice & !(keys[0]->type & VT_SLICE_BITS))
        keys[0]->type |= (VT_START_SLICE|VT_END_SLICE);
    key_str = malloc(len);
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
    keychain = mem_sys_allocate_zeroed(sizeof(SymReg));
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
        key = key->nextkey;
        /* for registers, point ->reg to the original, needed by
         * life analyses & coloring
         */
        if (keys[i]->type & VTREGISTER)
            key->reg = keys[i];
    }
    keychain->name = key_str;
    keychain->set = 'K';
    keychain->color = -1;
    _store_symreg(h, keychain);
    return keychain;
}



void
free_sym(SymReg *r)
{
    free(r->name);
    if (r->pcc_sub) {
        if (r->pcc_sub->args)
            free(r->pcc_sub->args);
        if (r->pcc_sub->ret)
            free(r->pcc_sub->ret);
        free(r->pcc_sub);
    }
    /* TODO free keychain */
    free(r);
}


/*
 * This functions manipulate the hash of symbols.
 * XXX: Migrate to use Symbol and SymbolTable
 *
 */

/* Stores a symbol into the hash */
void
_store_symreg(SymReg *hsh[], SymReg * r)
{
    int i = hash_str(r->name) % HASH_SIZE;
#if IMC_TRACE_HIGH
    printf("    store [%s]\n", r->name);
#endif
    r->next = hsh[i];
    hsh[i] = r;
}

void
store_symreg(SymReg * r)
{
    _store_symreg(cur_unit->hash, r);
}

/* Gets a symbol from the hash */
SymReg *
_get_sym(SymReg * hsh[], const char * name)
{
    SymReg * p;
    int i = hash_str(name) % HASH_SIZE;
    for (p = hsh[i]; p; p = p->next) {
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
get_sym(const char * name)
{
    return _get_sym(cur_unit->hash, name);
}

/* find a symbol hash or ghash */
SymReg *
_find_sym(Interp *interp, Namespace * nspace, SymReg * hsh[],
        const char * name)
{
    Namespace * ns;
    SymReg *p;

    for (ns = nspace; ns; ns = ns->parent) {
        char * fullname = _mk_fullname(ns, name);
        p = _get_sym(hsh, fullname);
        free(fullname);
        if (p)
            return p;
    }
    p = _get_sym(hsh, name);
    if (p)
        return p;
    p = _get_sym(IMCC_INFO(interp)->ghash, name);
    if (p)
        return p;
    return 0;
}


SymReg *
find_sym(Interp *interp, const char * name)
{
    if (cur_unit)
        return _find_sym(interp, namespace, cur_unit->hash, name);
    return NULL;
}


void
_delete_sym(Interp* interp, IMC_Unit * unit, const char * name)
{
    SymReg ** p;
    int i = hash_str(name) % HASH_SIZE;
    for (p = &unit->hash[i]; *p; p = &(*p)->next) {
        SymReg * deadmeat = *p;
	if (!strcmp(name, deadmeat->name)) {
            *p = deadmeat->next;
            if (deadmeat->life_info){
	        free_life_info(unit, deadmeat);
            }
            free_sym(deadmeat);
            return;
        }
    }

    IMCC_fatal(interp, 1,
            "_delete_sym: tried to delete nonexistent symbol '%s'\n", name);
}


void
clear_sym_hash(SymReg **hsh)
{
    int i;
    SymReg * p, *next;
    for (i = 0; i < HASH_SIZE; i++) {
	for (p = hsh[i]; p; ) {
	    next = p->next;
	    free_sym(p);
	    p = next;
	}
        hsh[i] = NULL;
    }
}

void debug_dump_sym_hash(SymReg **hsh);

void
debug_dump_sym_hash(SymReg **hsh)
{
    int i;
    SymReg * p;
    for (i = 0; i < HASH_SIZE; i++) {
	for (p = hsh[i]; p; p = p->next) {
            fprintf(stderr, "%s ", p->name);
        }
    }
}

/* Deletes all local symbols and clears life info */
void
clear_locals(IMC_Unit * unit)
{
    int i;
    SymReg * p, *next;
    SymReg **hsh = unit->hash;
    for (i = 0; i < HASH_SIZE; i++) {
	for (p = hsh[i]; p; ) {
	    next = p->next;
            if (unit && p->life_info) {
                free_life_info(unit, p);
            }
	    free_sym(p);
	    p = next;
	}
        hsh[i] = NULL;
    }
}

/* Clear global symbols */
void
clear_globals(Interp *interp)
{
    int i;
    SymReg * p, *next;

    if (!IMCC_INFO(interp)->ghash)
        return;
    for (i = 0; i < HASH_SIZE; i++) {
        for (p = IMCC_INFO(interp)->ghash[i]; p; ) {
	    next = p->next;
            if (p->type & VTADDRESS)
                p->first_ins = p->last_ins = NULL;
            free_sym(p);
            p = next;
        }
        IMCC_INFO(interp)->ghash[i] = NULL;
    }
}


/* utility functions: */

unsigned int
hash_str(const char * str)
{
    unsigned long key = 0;
    const char * s;
    for (s=str; *s; s++)
        key = key * 65599 + *s;
    return key;
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

