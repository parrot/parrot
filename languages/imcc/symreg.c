/*
 * imcc symbol handling
 */

#include "imc.h"

/* Globals: */
/* Code: */

void delete_sym(const char * name);


void push_namespace(char * name) {
    Namespace * ns = (Namespace *) malloc(sizeof(*ns));
    ns->parent = namespace;
    ns->name = name;
    ns->idents = NULL;
    namespace = ns;
}

void pop_namespace(char * name) {
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

/* Makes a new SymReg from its varname and type */
SymReg * _mk_symreg(SymReg* hsh[],char * name, char t) {
    SymReg * r;
    if((r = _get_sym(hsh, name))) {
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
    r->set = t;
    r->type = VTREG;

    if(name[0])
        _store_symreg(hsh,r);
    return r;
}

SymReg * mk_symreg(char * name, char t) {
    return _mk_symreg(hash, name, t);
}

SymReg * mk_pasm_reg(char * name) {
    SymReg * r;
    if((r = _get_sym(hash, name))) {
	free(name);
        return r;
    }
    r = mk_symreg(name, *name);
    r->type = VTPASM;
    r->color = atoi(name+1);
    debug(DEBUG_PARSER, "mk_pasm_reg: name %s set %c color %d type 0x%x\n",
            name, r->set, r->color, r->type);
    return r;
}

char * _mk_fullname(Namespace * ns, const char * name) {
    char * result;

    if (ns == NULL) return strdup(name);
    result = (char *) malloc(strlen(name) + strlen(ns->name) + 3);
    sprintf(result, "%s::%s", ns->name, name);
    return result;
}

char * mk_fullname(const char * name) {
    return _mk_fullname(namespace, name);
}

/* Makes a new identifier */
SymReg * mk_ident(char * name, char t) {
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
mk_const_ident(char *name, char t, SymReg *val)
{
    SymReg *r = mk_ident(name, t);
    r->type = VT_CONSTP;
    r->reg = val;
    return r;
}

/* Makes a new constant*/
SymReg * _mk_const(SymReg *hsh[], char * name, char t) {
    SymReg * r = _mk_symreg(hsh, name, t);
    r->type = VTCONST;
    return r;
}

SymReg * mk_const(char * name, char t) {
    return _mk_const(ghash, name, t);
}

/* Makes a new address */
SymReg * _mk_address(SymReg *hsh[], char * name, int uniq) {
    SymReg * r;
    if (uniq == U_add_all) {

        r = calloc(1, sizeof(SymReg));
        r->type = VTADDRESS;
        r->name = name;
        _store_symreg(hsh,r);
        return r;
    }

    if(uniq && (r = _get_sym(hsh, name)) &&
            r->type == VTADDRESS &&
            r->lhs_use_count            /* we use this for labes/subs */
      ) {
        if (uniq == U_add_uniq_label)
            fataly(1, "mk_address", line,
                    "Label '%s' already defined\n", name);
        else if (uniq == U_add_uniq_sub)
            fataly(1, "mk_address", line,
                    "Subroutine '%s' already defined\n", name);
    }
    r = _mk_symreg(hsh, name, 0);
    r->type = VTADDRESS;
    if (uniq)
        r->lhs_use_count++;
    return r;
}


SymReg * mk_address(char * name, int uniq) {
    SymReg ** h = *name == '_' ? ghash : hash;
    return _mk_address(h, name, uniq);
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

static SymReg * dup_sym(SymReg *r)
{
    SymReg * new = malloc(sizeof(SymReg));
    if (!new)
        fatal(1, "dup_sym", "Out of mem\n");
    memcpy(new, r, sizeof(SymReg));
    new->name = str_dup(r->name);
    return new;
}

SymReg * link_keys(int nargs, SymReg * keys[])
{
    SymReg * first, *key, *keychain;
    int i;
    char key_str[256];

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
    if ( (keychain = get_sym(key_str)) != 0)
        return keychain;
    /* no, need a new one */
    keychain = calloc(1, sizeof(SymReg));
    if (!keychain)
        fatal(1, "link_keys", "Out of mem\n");
    keychain->type = VTCONST;
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
    store_symreg(keychain);
    return keychain;
}



void free_sym(SymReg *r)
{
    free(r->name);
    if (r->life_info) {
	free_life_info(r);
    }
    /* TODO free keychain */
    free(r);
}


/*
 * This functions manipulate the hash of symbols.
 *
 */

/* Stores a symbol into the hash */
void _store_symreg(SymReg *hsh[], SymReg * r) {
    int i = hash_str(r->name) % HASH_SIZE;
    r->next = hsh[i];
    hsh[i] = r;
}
void store_symreg(SymReg * r) {
    _store_symreg(hash, r);
}

/* Gets a symbol from the hash */
SymReg * _get_sym(SymReg * hsh[], const char * name) {
    SymReg * p;
    int i = hash_str(name) % HASH_SIZE;
    for(p = hsh[i]; p; p = p->next) {
	if(!strcmp(name, p->name))
	    return p;
    }
    return 0;
}
SymReg * get_sym(const char * name) {
    return _get_sym(hash, name);
}


SymReg * find_sym(const char * name) {
    return _find_sym(namespace, hash, name);
}

static void _delete_sym(SymReg * hsh[], const char * name) {
    SymReg ** p;
    int i = hash_str(name) % HASH_SIZE;
    for(p = &hsh[i]; *p; p = &(*p)->next) {
        SymReg * deadmeat = *p;
	if(!strcmp(name, deadmeat->name)) {
            *p = deadmeat->next;
            free_sym(deadmeat);
            return;
        }
    }

    fatal(1, "_delete_sym", "Tried to delete nonexistent symbol '%s'\n", name);
}

void delete_sym(const char * name) {
    _delete_sym(hash, name);
}

/* Deletes all symbols */
void clear_tables() {
    int i;
    SymReg * p, *next;
    for(i = 0; i < HASH_SIZE; i++) {
	for(p = hash[i]; p; ) {
	    next = p->next;
	    free_sym(p);
	    p = next;
	}
        hash[i] = NULL;
    }
}

/* utility functions: */

unsigned int hash_str(const char * str) {
    unsigned long key = 0;
    const char * s;
    for(s=str; *s; s++)
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
