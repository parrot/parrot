/*
 * type.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Type management utils.
 */

#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"


void init_builtin_types() {
	t_void		= store_type("void", 0);
	t_string	= store_type("string", 4);	
	t_int		= store_type("int", 4);
	t_float		= store_type("float", 4);
}

/* size is bytes or elements, depending on if type is variable or array */
Symbol * store_type(const char * name, int size) {
	Symbol * t = store_identifier(current_symbol_table, name, TYPE, NULL);
	t->size = size;
	return t;
}

/* Start at inner scope and work out, looking for a type name.
 * For this lanuage we don't check whether the Symbol is a type
 * because we don't allow declaring identifiers with the same
 * name of a type in the current namespace.
 * FIXME: Add support for member resolution (namespace.namespace.type, etc.)
 */
Symbol * lookup_type(const char * name) {
	Symbol * ns;
	Symbol * s;
	for(ns = current_namespace; ns; ns = ns->tnext) {
		s = lookup_symbol(ns->table, name);
		if(s != NULL)
			return s;
	}	
	return NULL;
}

const char * type_name(Symbol * s) {
	if(s->class == TYPE)
		return s->name;
	else if(s->type)
		return s->type->name;
	else {
		printf("type_name(%s) : Error, symbol not a type and has no associated type\n", s->name );
		abort();
	}
	return "undef";
}

Type * new_type(int kind, const char * name, const char * parent_name) {
    Type * t = malloc(sizeof(Type));   
    assert(t);
    t->kind = kind;
    t->sym = store_identifier(current_symbol_table, name, TYPE, NULL);
    return t;
}



