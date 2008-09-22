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

    if (!lexer->interp) {
        fprintf(stderr, "Failed to create a Parrot interpreter structure.\n");
        exit(EXIT_FAILURE);
    }

    /* create a hashtable to store all strings */
    lexer->obj_cache.str_cache = pmc_new(lexer->interp, enum_class_Hash);

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

=item C<char *
dupstr(char const * const source)>

The C89 standard does not define a strdup() in the C library,
so define our own strdup. Function names beginning with "str"
are reserved, so make it dupstr, as that is what it
does: duplicate a string.

=cut

*/
char *
dupstr(lexer_state * const lexer, char * source) {
    return dupstrn(lexer, source, strlen(source));
}

static void
store_string(lexer_state * const lexer, char * const str) {
    /*
    PMC *symtable = pmc_new(lexer->interp, enum_class_Hash);
    PMC *dummy = pmc_new(lexer->interp, enum_class_ResizablePMCArray);
    symbol *sym = new_symbol("hi", PMC_TYPE);
    symbol *test;
    VTABLE_set_pmc_keyed_str(lexer->interp, symtable,
    string_from_cstring(lexer->interp, "hi", 2), dummy);
    VTABLE_push_pmc(lexer->interp, dummy, (PMC *)sym);
    test = (symbol *)VTABLE_pop_pmc(lexer->interp, dummy);
    printf("name: %s\n", test->name);
    */
    /*
    PMC *yesh = pmc_new(lexer->interp, enum_class_Integer);

    STRING *s = string_from_cstring(lexer->interp, str, strlen(str));
    if (lexer->obj_cache.str_cache == NULL)
        lexer->obj_cache.str_cache = pmc_new(lexer->interp, enum_class_Hash);
    VTABLE_set_pmc_keyed_str(lexer->interp, lexer->obj_cache.str_cache, s, (PMC *)s);
    */

}

static char *
find_string(lexer_state * const lexer, char * const str) {

    /* this doesn't seem to work :-/ probably implement own hash. lean and mean.
    PMC *dummy = VTABLE_get_pmc_keyed_str(lexer->interp, lexer->obj_cache.str_cache,
                                        string_from_cstring(lexer->interp, str, strlen(str)));
    if (dummy) {
        STRING *ret = (STRING *)dummy;
        char *s = string_to_cstring(lexer->interp, ret);
        printf("finding string: [%s]\n", s);
        return s;
    }*/
    return NULL;
}

/*

=item C<char *
dupstrn(char const * const source, size_t num_chars)>

See dupstr, except that this version takes the number of characters to be
copied. Easy for copying a string except the quotes, for instance.

=cut

*/
char *
dupstrn(lexer_state * const lexer, char * source, size_t num_chars) {
    char *result = find_string(lexer, source);

    if (result == NULL) { /* not found */
        result = (char *)calloc(num_chars + 1, sizeof (char));
        assert(result);
        /* only copy num_chars characters */
        strncpy(result, source, num_chars);
        /* cache the string */
        store_string(lexer, result);
    }

    return result;
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

