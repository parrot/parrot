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
    Symbol * s = store_identifier(current_symbol_table, name, TYPE, NULL);
    Type * t = (Type *)malloc(sizeof(*t));
    s->type = t;
    t->size = size;
    t->kind = 0;
    t->typeid = 0;
    t->parentid = 0;
    t->sym = s; /* Circular reference */
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
