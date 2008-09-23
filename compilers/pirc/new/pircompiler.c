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

/* initial size of a hashtable */
#define HASHTABLE_SIZE_INIT     113

/*

=over 4

=item C<static void
init_hashtable(hashtable * table, unsigned size)>

Initialize the hashtable C<table> with space for C<size> buckets.

=cut

*/
static void
init_hashtable(hashtable * table, unsigned size) {
    table->contents  = (bucket **)calloc(size, sizeof (bucket *));
    assert(table);
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
    lexer_state *lexer   = (lexer_state *)malloc(sizeof (lexer_state));
    assert(lexer != NULL);

    /* clear all fields */
    memset(lexer, 0, sizeof (lexer_state));

    lexer->filename = filename;
    lexer->interp   = Parrot_new(NULL);

    if (!lexer->interp)
        panic("Failed to create a Parrot interpreter structure.");

    /* create a hashtable to store all strings */
    init_hashtable(&lexer->strings, HASHTABLE_SIZE_INIT);

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
static bucket *
new_bucket(void) {
    bucket *buck = (bucket *)malloc(sizeof (bucket));
    assert(buck);
    memset(buck, 0, sizeof (bucket));
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
    unsigned long hash = get_hashcode(str) % lexer->strings.size;
    bucket *b          = new_bucket();
    bucket_string(b)   = str;
    b->next = lexer->strings.contents[hash];
    lexer->strings.contents[hash] = b;
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
    unsigned long hash = get_hashcode(str) % lexer->strings.size;
    bucket *b          = lexer->strings.contents[hash];

    if (b == NULL) /* no bucket at this hash position; return NULL */
        return NULL;

    do {
        /* loop through the buckets to see if this is the string */
        if (STREQ(bucket_string(b), str))
            return bucket_string(b); /* if so, return a pointer to the actual string. */

        b = b->next;
    }
    while (b); /* if there's no more buckets, we'll return NULL in the end */

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
        result = (char *)calloc(slen + 1, sizeof (char));
        assert(result);
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
    free(k);
    k = NULL;
}

void
free_constant(constant *c) {
    free(c);
    c = NULL;
}

void
free_target(target *t) {
    if (t->key)
        free_key(t->key);

    if (t->alias)
        free(t->alias);

    if (t->lex_name)
        free(t->lex_name);

    free(t);
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
        free(temp);
    }
    while (iter != expr);

    expr = NULL;
}

/*
void
free_statements(statement *instr) {
    statement *iter = instr;
    do {
        statement *temp = iter;
        iter = iter->next;

        free_operands(iter->ins->operands);
        free(temp);
    }
    while (iter != instr);

    instr = NULL;
}
*/

/*

=item C<void
release_resources(lexer_state *lexer)>

=cut

*/
void
release_resources(lexer_state *lexer) {
    subroutine *iter = lexer->subs;

    return;

    if (iter) {
        do {
            subroutine *temp = iter;
            iter = iter->next;
            /* free the symbols in this subroutine */
            free_symbols(iter->symbols);

            /* free instructions in this subroutine */
          /*
            free_statements(iter->statements);
            */

            /* free this subroutine itself */
            free(temp);
        }
        while (iter != lexer->subs);
    }


    Parrot_destroy(lexer->interp);

    /* finally, free the lexer itself */
    free(lexer);

    lexer = NULL;
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

