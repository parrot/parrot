
#include <stdlib.h>
#include <string.h>
#include "imc.h"

/* Globals: */





/* Code: */

/* Makes a new SymReg from its varname and type */ 
SymReg * mk_symreg(const char * name, char t) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_symreg\n");
	abort();
    }
    r->name = str_dup(name);
    r->reg = str_dup(name);
    if(t == 'I') r->fmt = str_dup("I%d");
    else if(t == 'N') r->fmt = str_dup("N%d");
    else if(t == 'S') r->fmt = str_dup("S%d");
    else if(t == 'P') r->fmt = str_dup("P%d");
    r->first = -1;
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
SymReg * mk_ident(const char * name, char t) {
    SymReg * r = mk_symreg(name, t);
    r->type = VTIDENTIFIER;
    return r;
}

/* Makes a new constant*/
SymReg * mk_const(const char * name, char t) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_const\n");
	abort();
    }
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
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
SymReg * mk_address(const char * name) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    if (r==NULL) {
	fprintf(stderr, "Memory error at mk_address\n");
	abort();
    }
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
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
    for(i = 0; i < HASH_SIZE; i++) {
	/* Memory leak */
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
