/*
 * type.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Type management utils.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"


void init_builtin_types() {
    t_void = store_type("void", 4);
    t_string = store_type("string", 4);    
    t_int = store_type("int", 4);
    t_float = store_type("float", 4);
}

/* size is bytes or elements, depending on if type is variable or array */
Type * store_type(const char * name, int size) {
    Type * t = (Type *)malloc(sizeof(*t));
    Symbol * s = store_identifier(current_symbol_table, name, TYPE, t);
    t->size = size;
    t->kind = TYPE_SCALAR;
    t->typeid = 0;
    t->parentid = 0;
    t->sym = s; /* Circular reference */
    /* Arrays and references */
    t->type = 0;
    t->rank = 0;
    t->dim = 0;
    t->bounds = 0;
    return t;
}

/* Start at inner scope and work out, looking for a type name.
 * FIXME: Add support for member resolution (namespace.namespace.type, etc.)
 */
Type * lookup_type(const char * name) {
    Symbol * ns;
    Symbol * s;
    for(ns = current_namespace; ns; ns = ns->tnext) {
        s = lookup_symbol(ns->table, name);
        if(s != NULL) {
            if(s->kind != TYPE) {
                fprintf(stderr, "lookup_type(%s) : Error, symbol not a type\n", name );
                abort();
            }
            return s->type;
        }
    }    
    return NULL;
}

/*
 * identifier can be a list which would resolve it
 * to nested namespace.
 */
Symbol * lookup_type_symbol(Symbol * id) {
    Symbol * ns = current_namespace;
    Symbol * t;
    while(id->tnext) {
        if((ns = lookup_namespace(ns->table, id->name)) == NULL)
            return NULL;
        id = id->tnext;
    }
    t = lookup_symbol(ns->table, id->name);
    if(t && t->kind != TYPE) {
        fprintf(stderr, "lookup_type_symbol(%s) : Error, symbol not a type\n", id->name);
        abort();
    }
    return t;
}

const char * type_name(Type * t) {
    return t->sym->name;
}

Rank * new_rank(int dim) {
    Rank * ret = malloc(sizeof(*ret));
    ret->next = NULL;
    ret->tnext = NULL;
    ret->dim = dim;    
    return ret;
}

Type * new_array(Type * type, Rank * rank) {
    Type * ret = malloc(sizeof(*ret));
    Rank * r;
    ret->type = type;
    ret->kind = TYPE_ARRAY;
    ret->next = NULL;
    ret->tnext = NULL;
    ret->rank = rank;
    for(ret->dim = 0, r = rank; r; r = (Rank *)r->tnext) {
        ret->dim += r->dim;
    } 
    ret->bounds = (int **)malloc(sizeof(int) * ret->dim * 2);
    ret->sym = array_signature(ret);
    return ret;
}


Symbol * array_signature(Type * t) {
    char buf[4096];
    Rank * r;
    int i;
    Symbol * ret = new_symbol(IDENTIFIER, "");
    sprintf(buf, "%s", type_name(t->type));
    for(r = t->rank; r; r = (Rank *)r->tnext) {
        strcat(buf, "[");
        for(i = 0; i < r->dim; i++) {
            sprintf(buf + strlen(buf), "(0..)");
        }
        strcat(buf, "]");
        /*sprintf(buf + strlen(buf), "%d_", r->dim);   */
    }
    ret->name = str_dup(buf);
    return ret;
}
