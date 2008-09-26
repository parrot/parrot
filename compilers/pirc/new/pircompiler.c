/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdarg.h>

#include "pircompiler.h"
#include "parrot/parrot.h"


/*

=over 4

=item C<void
init_hashtable(hashtable * table, unsigned size)>

Initialize the hashtable C<table> with space for C<size> buckets.

=cut

*/
void
init_hashtable(hashtable * table, unsigned size) {
    table->contents  = (bucket **)mem_sys_allocate_zeroed(size * sizeof (bucket *));
    table->size      = size;
    table->obj_count = 0;
}

/*

=item C<lexer_state *
new_lexer(char * const filename)>

Constructor for a lexer structure. Initializes all fields, creates
a Parrot interpreter structure.

=cut

*/
lexer_state *
new_lexer(char * const filename) {
    lexer_state *lexer = mem_allocate_zeroed_typed(lexer_state);
    lexer->filename    = filename;
    lexer->interp      = Parrot_new(NULL);

    if (!lexer->interp)
        panic("Failed to create a Parrot interpreter structure.");

    /* create a hashtable to store all strings */
    init_hashtable(&lexer->strings, HASHTABLE_SIZE_INIT);

    init_hashtable(&lexer->globals, HASHTABLE_SIZE_INIT);
    init_hashtable(&lexer->constants, HASHTABLE_SIZE_INIT);

    return lexer;
}

/*

=item C<void
pirerror(lexer_state * const lexer, char const * const message, ...)>

General error function, if C<yyerror()> is not desirable (not a parse
error) or not possible (if no access to the parser's C<yyscanner> object).

Write an error message to C<stderr> and increment number of errors.

=cut

*/
void
pirerror(lexer_state * const lexer, char const * const message, ...) {
    va_list arg_ptr;

    va_start(arg_ptr, message);
    fprintf(stderr, "Error: ");
    vfprintf(stderr, message, arg_ptr);
    fprintf(stderr, "\n");
    va_end(arg_ptr);

    ++lexer->parse_errors;
}


/*

=item C<static bucket *
new_bucket(void)>

Constructor for a bucket object.

=cut

*/
bucket *
new_bucket(void) {
    bucket *buck = mem_allocate_zeroed_typed(bucket);
    return buck;
}

/*

=item C<static void
store_string(lexer_state * const lexer, char * const str)>

Store the string C<str> in a hashtable; whenever this string is needed, a pointer
to the same physical string is returned, preventing allocating different buffers
for the same string. This is especially useful for ops, as most ops in a typical
program will be used many times.

=cut

*/
static void
store_string(lexer_state * const lexer, char * const str) {
    hashtable    *table = &lexer->strings;
    unsigned long hash  = get_hashcode(str, table->size);
    bucket *b           = new_bucket();
    bucket_string(b)    = str;
    store_bucket(table, b, hash);
}

/*

=item C<static char *
find_string(lexer_state * const lexer, char * const str)>

Find the string C<str> in the lexer's string hashtable. If the string was found,
then a pointer to that buffer is returned. So, whenever for instance the string
"print" is used, the string will only be stored in memory once, and a pointer to
that buffer will be returned.

=cut

*/
static char *
find_string(lexer_state * const lexer, char * const str) {
    hashtable    *table = &lexer->strings;
    unsigned long hash  = get_hashcode(str, table->size);
    bucket *b           = get_bucket(table, hash);

    while (b) {
        /* loop through the buckets to see if this is the string */
        if (STREQ(bucket_string(b), str))
            return bucket_string(b); /* if so, return a pointer to the actual string. */

        b = b->next;
    }

    return NULL;
}

/*

=item C<char *
dupstrn(lexer_state * const lexer, char const * const source, size_t slen)>

See dupstr, except that this version takes the number of characters to be
copied. Easy for copying a string except the quotes, for instance.

=cut

*/
char *
dupstrn(lexer_state * const lexer, char * const source, size_t slen) {
    char *result = find_string(lexer, source);
    /* make sure the string is terminated in time */
    source[slen] = '\0';

    if (result == NULL) { /* not found */
        result = (char *)mem_sys_allocate_zeroed(slen + 1 * sizeof (char));
        /* only copy num_chars characters */
        strncpy(result, source, slen);
        /* cache the string */
        store_string(lexer, result);
    }

    return result;
}

/*

=item C<char *
dupstr(lexer_state * const lexer, char const * const source)>

The C89 standard does not define a strdup() in the C library,
so define our own strdup. Function names beginning with "str"
are reserved, so make it dupstr, as that is what it
does: duplicate a string.

=cut

*/
char *
dupstr(lexer_state * const lexer, char * const source) {
    return dupstrn(lexer, source, strlen(source));
}


/***** routine to free memory *****/

void
free_key(key *k) {
    mem_sys_free(k);
    k = NULL;
}

void
free_constant(constant *c) {
    mem_sys_free(c);
    c = NULL;
}

void
free_target(target *t) {
    if (t->key)
        free_key(t->key);

    if (t->alias)
        mem_sys_free(t->alias);

    if (t->lex_name)
        mem_sys_free(t->lex_name);

    mem_sys_free(t);
    t = NULL;
}

void
free_expression(expression *expr) {
    switch (expr->type) {
        case EXPR_TARGET:
            free_target(expr->expr.t);
            break;
        case EXPR_CONSTANT:
            free_constant(expr->expr.c);
            break;
        case EXPR_KEY:
            free_key(expr->expr.k);
            break;
        default:
            break;
    }
}

void
free_operands(expression *expr) {
    expression *iter = expr;

    do {
        expression *temp = iter;
        iter = iter->next;

        free_expression(iter);
        mem_sys_free(temp);
    }
    while (iter != expr);

    expr = NULL;
}


void
free_statements(instruction *instr) {
    instruction *iter = instr;
    do {
        instruction *temp = iter;
        iter              = iter->next;

        free_operands(iter->operands);
        mem_sys_free(temp);
    }
    while (iter != instr);

    instr = NULL;
}

void
destroy_hashtable(hashtable *table) {
    unsigned i;
    for (i = 0; i < table->size; i++) {
        bucket *iter = table->contents[i];
        while (iter) {
            bucket *temp = iter;
            iter = iter->next;

            /* does it mattter what field of the union is freed? */
            mem_sys_free(temp->u.str);

            mem_sys_free(temp);
        }
    }
    mem_sys_free(table);
}

/*

=item C<void
release_resources(lexer_state *lexer)>

=cut

*/
void
release_resources(lexer_state *lexer) {
    subroutine *iter = lexer->subs;



    if (iter) {
        do {
            subroutine *temp = iter;
            iter = iter->next;
            /* free the symbols in this subroutine */
            free_symbols(iter->symbols);

            /* free instructions in this subroutine */

            free_statements(iter->statements);


            /* free this subroutine itself */
            mem_sys_free(temp);
        }
        while (iter != lexer->subs);
    }


    Parrot_destroy(lexer->interp);

    destroy_hashtable(&lexer->constants);
    destroy_hashtable(&lexer->globals);
    destroy_hashtable(&lexer->strings);

    /* finally, free the lexer itself */
    mem_sys_free(lexer);

    lexer = NULL;
}


typedef struct allocated_mem_ptrs {
    void *ptrs[128];
    unsigned i;
    struct allocated_mem_ptrs *next;

} allocated_mem_ptrs;


#define pir_mem_allocate_typed(type)    (type *)pir_mem_allocate(sizeof (type))

static void
register_ptr(lexer_state *lexer, void *ptr) {
    allocated_mem_ptrs ptrs;
    ptrs.ptrs[ptrs.i++] = ptr;
}

void *
pir_mem_allocate(lexer_state *lexer, size_t numbytes) {
    void *ptr = mem_sys_allocate_zeroed(numbytes);
    register_ptr(lexer, ptr);
    return ptr;
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

