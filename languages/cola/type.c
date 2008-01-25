/*
 * $Id$
 *
 * type.c
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Type management utils.
 */

/*

=head1 NAME

languages/cola/type.c

=head1 DESCRIPTION

RT#48200

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cola.h"
#include "parser.h"

Type        *t_object,
            *t_void,
            *t_string,
            *t_bool,
            *t_sbyte,
            *t_byte,
            *t_char,
            *t_int32,
            *t_uint32,
            *t_int64,
            *t_uint64,
            *t_short,
            *t_ushort,
            *t_float,
            *t_double,
            *t_decimal;


void init_builtin_types() {
    t_object    = store_type("object", 4);
    t_void      = store_type("void", 4);
    t_string    = store_type("string", 4);
    t_bool      = store_type("bool", 1);
    t_sbyte     = store_type("sbyte", 1);
    t_byte      = store_type("byte", 1);
    t_char      = store_type("char", 2);
    t_int32     = store_type("int", 4);
    t_uint32    = store_type("uint", 4);
    t_int64     = store_type("long", 8);
    t_uint64    = store_type("ulong", 8);
    t_short     = store_type("short", 2);
    t_ushort    = store_type("ushort", 2);
    t_float     = store_type("num", 4);
    t_double    = store_type("double", 8);
    t_decimal   = store_type("decimal", 8);
}

/*

=item C<Type * store_type(const char * name, int size)>

size is bytes or elements, depending on if type is variable or array

=cut

*/

Type * store_type(const char * name, int size)
{
    Type * t = (Type *)malloc(sizeof (*t));
    Symbol * s = store_symbol(current_symbol_table, new_symbol(name));
    t->type = NULL;
    s->type = t;
    s->kind = TYPE;
    t->size = size;
    t->kind = TYPE_SCALAR;
/*
    t->typeid = 0;
    t->parentid = 0;
    t->flags = 0;
*/
    t->sym = s; /* Circular reference */
    return t;
}

/*

=item C<Type * lookup_type(const char * name)>

Start at inner scope and work out, looking for a type name.
RT#48198: Add support for member resolution (namespace.namespace.type, etc.)

=cut

*/

Type * lookup_type(const char * name)
{
    Symbol * ns;
    Symbol * s;
    for (ns = current_namespace; ns; ns = ns->tnext) {
        s = lookup_symbol_in_tab(ns->table, name);
        if (s != NULL) {
            if (s->kind != TYPE) {
                fprintf(stderr, "lookup_type(%s) : Error, symbol not a type\n", name);
                abort();
            }
#if DEBUG
            fprintf(stderr, "Found symbol [%s] in namespace [%s]\n",
                        name, ns->name);
#endif
            return s->type;
        }
        else {
#if DEBUG
            fprintf(stderr, "Symbol [%s] not found in namespace [%s]\n",
                        name, ns->name);
#endif
        }
    }
    return NULL;
}

/*

=item C<Type * lookup_type_symbol(Symbol * id)>

identifier can be a list which would resolve it to nested namespace.

=cut

*/

Type * lookup_type_symbol(Symbol * id)
{
    if (!id) {
        fprintf(stderr, "lookup_type_symbol: NULL symbol\n");
        abort();
    }
    return lookup_type(id->name);
}

/*

=item C<const char * type_name(Type * t)>

RT#48200: Not yet documented!!!

=cut

*/

const char * type_name(Type * t)
{
    return t->sym->name;
}

/*

=item C<Rank * new_rank(int dim)>

RT#48200: Not yet documented!!!

=cut

*/

Rank * new_rank(int dim)
{
    Rank * ret = malloc(sizeof (*ret));
    ret->next = NULL;
    ret->tnext = NULL;
    ret->dim = dim;
    return ret;
}

/*

=item C<Type * new_array_type(Symbol * typename, Symbol * sig)>

RT#48200: Not yet documented!!!

=cut

*/

Type * new_array_type(Symbol * typename, Symbol * sig)
{
    Type * ret = malloc(sizeof (*ret));
    ret->sym = symbol_concat(typename, sig);
    ret->kind = TYPE_ARRAY;
    ret->next = NULL;
    ret->tnext = NULL;
/*
    ret->rank = rank;
    {
        Rank * r;
        for (ret->dim = 0, r = rank; r; r = (Rank *)r->tnext) {
            ret->dim += r->dim;
        }
    }
    ret->bounds = (int **)malloc(sizeof (int) * ret->dim * 2);
*/
    return ret;
}

/*
Symbol * array_signature(Type * t) {
    char buf[4096];
    Rank * r;
    int i;
    Symbol * ret = new_identifier_symbol("");
    sprintf(buf, "%s", type_name(t->type));
    for (r = t->rank; r; r = (Rank *)r->tnext) {
        strcat(buf, "[");
        for (i = 0; i < r->dim; i++) {
            sprintf(buf + strlen(buf), "(0..)");
        }
        strcat(buf, "]");
    }
    ret->name = str_dup(buf);
    return ret;
}
*/

/*

=item C<void resolve_identifier(Symbol ** ps)>

RT#48200: Not yet documented!!!

=cut

*/

void resolve_identifier(Symbol ** ps)
{
    Symbol * s = *ps;
    Symbol * t;
    if (!s) {
        fprintf(stderr, "Internal error: resolve_identifier: NULL symbol\n");
        abort();
    }
#if DEBUG
    fprintf(stderr, "!resolve[%s]\n", s->name);
#endif
    t = lookup_symbol(s->name);
    if (!t) {
        fprintf(stderr, "Error: identifier [%s] undeclared.\n", s->name);
        exit(EXIT_SUCCESS);
    }

    if (s != t) {
        *ps = t;
        s = *ps;
    }

    if (!s->typename) {
        fprintf(stderr, "Internal error: identifier [%s] has no typename\n",
                s->name);
        abort();
    }

    if (!s->type) {
        /* Resolve symbol */
        s->type = lookup_type_symbol(s->typename);
        if (s->type) {
            /* Just in case typename is fully qualified or aliased */
            s->typename = t->typename;
                /* Not sure if this is the cleanest way..
                 * If symbol is an identifier, it may be a class,
                 * so each class instance has a pointer to the class
                 * namespace.
                 */
                s->table = t->table;
                fprintf(stderr, "%s is type [%s]\n", s->name, s->typename->name);
        }
        else {
            fprintf(stderr, "Error: identifier [%s] has unknown type [%s].\n",
                        s->name, s->typename->name);
            exit(EXIT_SUCCESS);
        }
    }

        if (s->type) {
            s->table = s->type->sym->table;
        }
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
