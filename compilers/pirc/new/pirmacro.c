/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#include <stdarg.h>
#include "pirmacro.h"
#include "pircompiler.h"
#include "pirmacro.h"
#include "parrot/parrot.h"

/* macros can store up to 4K characters, after which the buffer must be resized. */
#define INIT_MACRO_SIZE     4096

/*

=head1 FUNCTION

=over 4

*/






/*

=item C<macro_def *
new_macro(macro_table * const table, char * const name, int lineno)>

=cut

*/
PARROT_IGNORABLE_RESULT
macro_def *
new_macro(macro_table * const table, char * const name, int lineno, int takes_args) {
    macro_def *macro   = (macro_def *)mem_sys_allocate(sizeof (macro_def));

  /*  fprintf(stderr, "new_macro: %s (line %d)\n", name, lineno); */

    macro->name        = name;
    macro->linedefined = lineno;
    macro->takes_args  = takes_args;
    macro->body        = (char *)mem_sys_allocate_zeroed(sizeof (char) * INIT_MACRO_SIZE);
    macro->buffersize  = INIT_MACRO_SIZE;
    macro->cursor      = macro->body;
    /* link the macro in the list */
    macro->next        = table->definitions;
    table->definitions = macro;

   /* fprintf(stderr, "new_macro done\n"); */

    return macro;
}

/*

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
macro_param *
new_macro_param(char * const value) {
    macro_param *param = (macro_param *)mem_sys_allocate(sizeof (macro_param));
    param->name        = value;
    param->next        = NULL;
    return param;
}

/*

*/
void
add_macro_param(macro_def * const macro, char * const name) {
    macro_param *param = new_macro_param(name);
    param->next        = macro->parameters;
    macro->parameters  = param;
}


/*

=item C<void
new_macro_const(macro_table * const table, char const * const name, char const * const value)>

=cut

*/
void
new_macro_const(macro_table * const table, char const * const name, char const * const value,
                      int lineno)
{
    macro_def *def     = new_macro(table, name, lineno, FALSE);
    def->body          = value;
}


void
check_size(macro_def * const macro) {
   unsigned used = macro->cursor - macro->body;
    if (used >= macro->buffersize) {

        /* XXX do the resize */

        macro->buffersize <<= 1; /* double the size (moving all bits left by 1 means doubling) */
    }
}


/*

Store the character C<c> in C<macro>'s body buffer.

*/
void
store_macro_char(macro_def * const macro, char c) {
    /* if buffer is full, resize it. */
    check_size(macro);
    *(macro->cursor)++ = c;
}




/*

Store the string C<str> in C<macro>'s body buffer.

*/
void
store_macro_string(macro_def * const macro, char * const str, ...) {
    va_list arg_ptr;

    check_size(macro);

    va_start(arg_ptr, str);
    /* vsprintf returns number of characters written; adjust cursor with that. */
    macro->cursor += vsprintf(macro->cursor, str, arg_ptr);
    va_end(arg_ptr);
}


/*

=item C<macro_def *
find_macro(constant_table * const table, char * const name)>

Find the specified macro. If the specified macro does not exist,
NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
macro_def *
find_macro(macro_table * const table, char * const name) {
    macro_def *iter = table->definitions;

    PARROT_ASSERT(name != NULL);

    /* iterate over the list and compare each node's name */
    while (iter != NULL) {
        if (STREQ(iter->name, name)) {
        /*    fprintf(stderr, "found (%s)\n", name); */
            return iter;
        }
        iter = iter->next;
    }

    if (table->prev) {
        /* fprintf(stderr, "not found (%s); trying previous table\n", name); */
        return find_macro(table->prev, name);
    }

    return NULL;
}


/*

=item C<macro_table *
new_macro_table(macro_table * const current)>

Create a new macro_table structure; set C<current> as its previous.
The newly created table is returned.

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
macro_table *
new_macro_table(macro_table * const current) {
    macro_table *table       = (macro_table *)mem_sys_allocate(sizeof (macro_table));
    table->definitions       = NULL;
    table->prev = NULL;

    table->prev              = current;

    return table;
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
