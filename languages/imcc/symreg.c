
#include <stdlib.h>
#include <string.h>
#include "imc.h"

/* Globals: */





/* Code: */

/* Makes a new SymReg from its varname and type */
SymReg * mk_symreg(char * name, char t) {
    SymReg * r;
    if((r = get_sym(name))) {
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
    r->score = 0;
    r->set = t;
    r->type = VTREG;
    r->simplified = 0;
    r->life_info = NULL;

    if(name[0])
        store_symreg(r);
    return r;
}

/* Makes a new identifier */
SymReg * mk_ident(char * name, char t) {
    SymReg * r = mk_symreg(name, t);
    r->type = VTIDENTIFIER;
    return r;
}

void free_sym(SymReg *r)
{
    free(r->name);
    if (r->life_info) {
    }
    free(r);
}

/* Makes a new constant*/
SymReg * mk_const(char * name, char t) {
    SymReg * r;
    if((r = get_sym(name))) {
	free(name);
        return r;
    }
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_const\n");
	abort();
    }
    r->name = name;
    r->color = -1;
    r->score = 0;
    r->set = t;
    r->type = VTCONST;
    r->simplified = 0;
    r->life_info = NULL;
    if(name[0])
        store_symreg(r);
    return r;
}

/* Makes a new address */
SymReg * mk_address(char * name) {
    SymReg * r;
    if((r = get_sym(name))) {
	free(name);
        return r;
    }
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_address\n");
	abort();
    }
    r->name = name;
    r->color = -1;
    r->score = 0;
    r->type = VTADDRESS;
    r->life_info = NULL;
    r->simplified = 0;
    if(name[0])
        store_symreg(r);
    return r;
}


/*
 * This functions manipulate the hash of symbols.
 *
 */

/* Stores a symbol into the hash */
void store_symreg(SymReg * r) {
    int index = hash_str(r->name) % HASH_SIZE;
    r->next = hash[index];
    hash[index] = r;
}

/* Gets a symbol from the hash */
SymReg * get_sym(const char * name) {
    SymReg * p;
    int index = hash_str(name) % HASH_SIZE;
    for(p = hash[index]; p; p = p->next) {
	if(!strcmp(name, p->name))
	    return p;
    }
    return p;
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
