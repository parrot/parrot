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
    if ((r = _get_sym(hsh, name)) && r->set == t) {
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
mk_symreg(char * name, int t)
{
    return _mk_symreg(cur_unit->hash, name, t);
}

/*
 * Dump a SymReg to a printable format.
 */
char *
symreg_to_str(SymReg * s)
{
    char buf[8192];
    int t = s->type;
    sprintf(buf, "symbol [%s]  set [%c]  color [%d]  type [",
                 s->name, s->set, s->color);
    if (t & VTCONST)      { strcat(buf, "VTCONST ");      }
    if (t & VTREG)        { strcat(buf, "VTREG ");        }
    if (t & VTIDENTIFIER) { strcat(buf, "VTIDENTIFIER "); }
    if (t & VTADDRESS)    { strcat(buf, "VTADDRESS ");    }
    if (t & VTREGKEY)     { strcat(buf, "VTREGKEY ");     }
    if (t & VTPASM)       { strcat(buf, "VTPASM ");       }
    if (t & VT_REGP)      { strcat(buf, "VT_REGP ");      }
    if (t & VT_CONSTP)    { strcat(buf, "VT_CONSTP ");    }
    if (t & VT_PCC_SUB)   { strcat(buf, "VT_PCC_SUB ");   }
    if (t & VT_FLATTEN)   { strcat(buf, "VT_FLATTEN ");   }
    strcat(buf, "]");
    return str_dup(buf);
}


SymReg *
mk_temp_reg(int t)
{
    char buf[128];
    static int temp;
    sprintf(buf, "__imcc_temp_%d", ++temp);
    return mk_symreg(str_dup(buf), t);
}

SymReg *
mk_pcc_sub(char * name, int proto) {
    SymReg *r = _mk_symreg(cur_unit->hash, name, proto);
    r->type = VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    return r;
}

/*
 * add current namespace to sub decl
 */
void
add_namespace(Parrot_Interp interpreter, SymReg *sub)
{
    SymReg *ns = IMCC_INFO(interpreter)->cur_namespace;
    SymReg *r, *g;

    if (!ns)
        return;
    g = dup_sym(ns);
    sub->pcc_sub->namespace = g;
    g->reg = ns;
    g->type = VT_CONSTP;
    if (! (r = _get_sym(ghash, g->name)) || r->type != VT_CONSTP )
        _store_symreg(ghash, g);
}

/*
 * Add make a pointer to a register or constant
 * and add to the subroutine structure arg list.
 * If arg is a pointer, deref the symbol first.
 */
void
add_pcc_arg(SymReg *r, SymReg * arg)
{
    int n = r->pcc_sub->nargs;
#if IMC_TRACE_HIGH
    PIO_eprintf(NULL, "add_pcc_arg(%s)\n", arg->name);
#endif
    r->pcc_sub->args = realloc(r->pcc_sub->args, (n + 1) * sizeof(SymReg *));
    if (arg->type & (VTCONST)) {
        r->pcc_sub->args[n] = dup_sym(arg);
        r->pcc_sub->args[n]->reg = arg;
        r->pcc_sub->args[n]->type = VT_CONSTP;
    }
    else if (arg->type & (VTREGISTER)) {
        r->pcc_sub->args[n] = dup_sym(arg);
        r->pcc_sub->args[n]->reg = arg;
        r->pcc_sub->args[n]->type = VT_REGP;
    }
    /* If this is already a pointer, dup the symbol
     * that it point to, not the pointer itself.
     */
    else if (arg->type & (VT_CONSTP)) {
        r->pcc_sub->args[n] = dup_sym(arg->reg);
        r->pcc_sub->args[n]->reg = arg->reg;
        r->pcc_sub->args[n]->type = VT_CONSTP;
    }
    else
        fataly(EX_SOFTWARE, sourcefile, line,
            "sub argument is not a valid arg (const, constp or reg) '%s'\n%s",
                     arg->name, symreg_to_str(arg));
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
    r->pcc_sub->ret[n] = dup_sym(arg);
    if (arg->type & VTREGISTER) {
        r->pcc_sub->ret[n]->reg = arg;
        r->pcc_sub->ret[n]->type = VT_REGP;
    }
    else if (arg->type & VTCONST) {
        r->pcc_sub->ret[n]->reg = arg;
        r->pcc_sub->ret[n]->type = VT_CONSTP;
    }
#if 0
    else
        fataly(EX_SOFTWARE, sourcefile, line,
                "result is not a variable '%s'\n", arg->name);
#endif
    r->pcc_sub->nret++;
}

void
add_pcc_return(SymReg *r, SymReg * arg)
{
    add_pcc_result(r, arg);
}

void
add_pcc_sub(SymReg *r, SymReg * arg)
{
    r->pcc_sub->sub = dup_sym(arg);
    r->pcc_sub->sub->reg = arg;
    r->pcc_sub->sub->type = VT_REGP;
}

void
add_pcc_cc(SymReg *r, SymReg * arg)
{
    r->pcc_sub->cc = dup_sym(arg);
    r->pcc_sub->cc->reg = arg;
    r->pcc_sub->cc->type = VT_REGP;
}

SymReg *
mk_pasm_reg(char * name)
{
    SymReg * r;
    if ((r = _get_sym(cur_unit->hash, name))) {
	free(name);
        return r;
    }
    r = mk_symreg(name, *name);
    r->type = VTPASM;
    r->color = atoi(name+1);
    if (r->color < 0 || r->color > 31)
        fataly(1, sourcefile, line,
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

/* Makes a new identifier */
SymReg *
mk_ident(char * name, int t)
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
    r = mk_symreg(fullname, t);
    r->type = VTIDENTIFIER;
    free(name);
    return r;
}

/* Makes a new identifier constant with value val */
SymReg *
mk_const_ident(char *name, int t, SymReg *val, int global)
{
    SymReg *r;
    if (global)
        r = _mk_symreg(ghash, name, t);
    else
        r = mk_ident(name, t);
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
    r->use_count++;
    return r;
}

SymReg *
mk_const(char * name, int t)
{
    return _mk_const(ghash, name, t);
}

extern SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * add namespace to sub if any
 * */
static char *
add_ns(SymReg *r, char *name)
{
    int len, l;
    char *ns_name;

    if (!cur_namespace || (l = strlen(cur_namespace->name)) <= 2)
        return name;
    /* TODO keyed syntax */
    len = strlen(name) + l  + 3;
    ns_name = mem_sys_allocate(len);
    strcpy(ns_name, cur_namespace->name);
    *ns_name = '_';
    ns_name[l - 1] = '\0';
    strcat(ns_name, "::");
    strcat(ns_name, name);
    mem_sys_free(name);
    return ns_name;
}

/* Makes a new address */
SymReg *
_mk_address(SymReg *hsh[], char * name, int uniq)
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
        name = add_ns(r, name);

    if (uniq && (r = _get_sym(hsh, name)) &&
            r->type == VTADDRESS &&
            r->lhs_use_count            /* we use this for labels/subs */
      ) {
        if (uniq == U_add_uniq_label) {
            fataly(1, sourcefile, line,
                   "Label '%s' already defined\n", name);
        }
        else if (uniq == U_add_uniq_sub)
            fataly(1, sourcefile, line,
                    "Subroutine '%s' already defined\n", name);
    }
    r = _mk_symreg(hsh, name, 0);
    r->type = VTADDRESS;
    if (uniq)
        r->lhs_use_count++;
    return r;
}

SymReg *
mk_address(char * name, int uniq)
{
    SymReg * s;
    SymReg ** h = *name == '_' ? ghash : cur_unit->hash;
    s = _mk_address(h, name, uniq);
    if (*name == '_')
       s->usage |= U_FIXUP;
    return s;
}

/*
 * Make and store a new address label for a sub.
 * Label gets a fixup entry.
 */
SymReg *
mk_sub_label(char * name)
{
    SymReg * s = _mk_address(ghash, name, U_add_uniq_sub);
    s->usage |= U_FIXUP;
    return s;
}

/*
 * Make a symbol for a label, symbol gets a fixup entry.
 */
SymReg *
mk_sub_address(char * name)
{
    SymReg * s = _mk_address(ghash, name, U_add_once);
    s->usage |= U_FIXUP;
    return s;
}

/*
 * Make a local symbol, no fixup entry.
 */
SymReg *
mk_local_label(IMC_Unit * unit, char * name)
{
    return _mk_address(unit->hash, name, U_add_uniq_label);
}

/*
 *
 */
SymReg *
mk_label_address(IMC_Unit * unit, char * name)
{
    return _mk_address(unit->hash, name, U_add_once);
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
    SymReg * new = malloc(sizeof(SymReg));
    if (!new)
        fatal(1, "dup_sym", "Out of mem\n");
    memcpy(new, r, sizeof(SymReg));
    new->name = str_dup(r->name);
    return new;
}

SymReg *
link_keys(int nargs, SymReg * keys[])
{
    SymReg * first, *key, *keychain;
    int i;
    char key_str[256];
    /* namespace keys are global consts - no cur_unit */
    SymReg **h = cur_unit ? cur_unit->hash : ghash;

    if (nargs == 0)
        fatal(1, "link_keys", "hu? no keys\n");
    first = keys[0];
    if (nargs == 1)
        return first;
    *key_str = 0;
    /* first look, if we already have this exact key chain */
    for (i = 0; i < nargs && strlen(key_str)<200; i++) {
        strcat(key_str, keys[i]->name);
        if (i < nargs - 1)
            strcat(key_str, ";");
    }
    if ( (keychain = _get_sym(h, key_str)) != 0)
        return keychain;
    /* no, need a new one */
    keychain = calloc(1, sizeof(SymReg));
    if (!keychain)
        fatal(1, "link_keys", "Out of mem\n");
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
    keychain->name = str_dup(key_str);
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
        int i;
        for (i = 0; i < r->pcc_sub->nargs; i++)
            free_sym(r->pcc_sub->args[i]);
        if (r->pcc_sub->args)
            free(r->pcc_sub->args);
        for (i = 0; i < r->pcc_sub->nret; i++)
            free_sym(r->pcc_sub->ret[i]);
        if (r->pcc_sub->ret)
            free(r->pcc_sub->ret);
        if (r->pcc_sub->cc)
            free_sym(r->pcc_sub->cc);
    /* multilpe freed
        if (r->pcc_sub->cc_sym)
            free_sym(r->pcc_sub->cc_sym);
    */
        if (r->pcc_sub->sub)
            free_sym(r->pcc_sub->sub);
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
_find_sym(Namespace * nspace, SymReg * hsh[], const char * name)
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
    p = _get_sym(ghash, name);
    if (p)
        return p;
    return 0;
}


SymReg *
find_sym(const char * name)
{
    if (cur_unit)
        return _find_sym(namespace, cur_unit->hash, name);
    return NULL;
}


void
_delete_sym(IMC_Unit * unit, const char * name)
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

    fatal(1, "_delete_sym", "Tried to delete nonexistent symbol '%s'\n", name);
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
clear_globals()
{
    int i;
    SymReg * p, *next;

    for (i = 0; i < HASH_SIZE; i++) {
        for (p = ghash[i]; p; ) {
	    next = p->next;
            if (p->type & VTADDRESS)
                p->first_ins = p->last_ins = NULL;
            free_sym(p);
            p = next;
        }
        ghash[i] = NULL;
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

