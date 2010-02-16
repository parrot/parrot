/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */

#include <stdarg.h>
#include <string.h>
#include "pirmacro.h"
#include "pircompiler.h"
#include "parrot/parrot.h"

/* HEADERIZER HFILE: compilers/pirc/src/pirmacro.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void check_size(ARGIN(macro_def * const macro), unsigned length)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_check_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(macro))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=head1 FUNCTIONS

This file contains functions that manage the macro datastructures.
Actual expansion of the macros is completely handled in the lexer (pir.l).

=over 4

=cut

*/


/*

=item C<macro_def * new_macro(macro_table * const table, char const * const
name, int lineno, int takes_args, unsigned initsize)>

Create a new macro definition node and store it in the macro_table C<table>

=cut

*/
PARROT_MALLOC
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
macro_def *
new_macro(ARGIN(macro_table * const table),
        ARGIN(char const * const name), int lineno, int takes_args,
        unsigned initsize)
{
    macro_def *macro   = (macro_def *)mem_sys_allocate(sizeof (macro_def));

    macro->name        = name;
    macro->linedefined = lineno;
    macro->takes_args  = takes_args;

    if (initsize) /* only call allocate function if initsize != zero */
        macro->body    = (char *)mem_sys_allocate_zeroed(sizeof (char) * initsize);

    macro->buffersize  = initsize;
    macro->cursor      = macro->body;
    /* link the macro in the list */
    macro->next        = table->definitions;
    table->definitions = macro;

    return macro;
}

/*

=item C<macro_param * new_macro_param(char const * const value)>

Constructor for a C<macro_param> struct object. Initializes
the C<name> attribute of the C<macro_param> object to C<value>.
A pointer to the newly allocated C<macro_param> object is returned.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
macro_param *
new_macro_param(ARGIN(char const * const value))
{
    macro_param *param = (macro_param *)mem_sys_allocate(sizeof (macro_param));
    param->name        = value;
    param->next        = NULL;
    return param;
}

/*

=item C<void add_macro_param(ARGIN*macro_def * const macro), char const * const
name)>

Add a macro parameter by name of C<name> to the macro definition C<macro>.

=cut

*/
void
add_macro_param(ARGIN*macro_def * const macro),
        ARGIN(char const * const name))
{
    macro_param *param = new_macro_param(name);
    param->next        = macro->parameters;
    macro->parameters  = param;
}


/*

=item C<void new_macro_const(macro_table * const table, char const * const name,
char const * const value, int lineno)>

Define a new C<.macro_const>, by name of C<name> as an alias for C<value> The new macro
const is entered in the macro_table C<table>

=cut

*/
void
new_macro_const(ARGIN(macro_table * const table),
        ARGIN(char const * const name),
        ARGIN(char const * const value), int lineno)
{
    /* macro constants are just macros, but they have no body; the value is already
     * parsed and allocated in memory.
     */
    macro_def *def     = new_macro(table, name, lineno, FALSE, 0);
    /* XXX is this cast from const * const to const * dangerous? */
    def->body          = (char *)value;
}


/*

=item C<static void check_size(macro_def * const macro, unsigned length)>

Check C<macro>'s buffer size whether C<length> bytes can be added;
if not, then the buffer is doubled in size.

=cut

*/
static void
check_size(ARGIN(macro_def * const macro), unsigned length)
{
    ASSERT_ARGS(check_size)
    unsigned used = macro->cursor - macro->body;
    if (used + length >= macro->buffersize) {
        unsigned  newsize = macro->buffersize << 1;
        char     *newbuffer;
        /* double the size (moving all bits left by 1 means doubling) */
        newbuffer = (char *)mem_sys_allocate(sizeof (char) * macro->buffersize);
        memcpy(newbuffer, macro->body, macro->buffersize);
        mem_sys_free(macro->body);
        macro->buffersize = newsize;
        macro->body       = newbuffer;
        /* update cursor as well */
        macro->cursor     = macro->body + used;
    }
}


/*

=item C<void store_macro_char(macro_def * const macro, char c)>

Store the character C<c> in C<macro>'s body buffer.

=cut

*/
void
store_macro_char(ARGIN(macro_def * const macro), char c)
{
    /* if buffer is full, resize it. */
    check_size(macro, 1);
    *(macro->cursor)++ = c;
}




/*

=item C<void store_macro_string(macro_def * const macro, char const * const str,
...)>

Store the string C<str> in C<macro>'s body buffer. The total number
of characters to be written should not exceed MAX_NUM_CHARS. It's not known
beforehand how much space we need in the buffer due to the var. arg. list.

=cut

*/
void
store_macro_string(ARGIN(macro_def * const macro),
        ARGIN(char const * const str),
        ...)
{
    va_list arg_ptr;

#define MAX_NUM_CHARS_IN_STRING   256

    check_size(macro, MAX_NUM_CHARS_IN_STRING);

    va_start(arg_ptr, str);
    /* vsprintf returns number of characters written; adjust cursor with that. */
    macro->cursor += vsprintf(macro->cursor, str, arg_ptr);
    va_end(arg_ptr);
}


/*

=item C<macro_def * find_macro(macro_table * const table, char const * const
name)>

Find the specified macro. If the specified macro does not exist,
NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
macro_def *
find_macro(ARGIN(macro_table * const table),
        ARGIN(char const * const name))
{
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

=item C<macro_table * new_macro_table(macro_table * const current)>

Create a new macro_table structure; set C<current> as its previous.
The newly created table is returned.

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
macro_table *
new_macro_table(ARGIN(macro_table * const current))
{
    macro_table *table       = (macro_table *)mem_sys_allocate_zeroed(sizeof (macro_table));
    table->definitions       = NULL;
    table->prev = NULL;

    table->prev              = current;
    table->thismacro         = NULL;

    return table;
}


/*

=item C<void delete_macro_table(macro_table * table)>

Free resources allocated for the macro_table C<table>.

=cut

*/
void
delete_macro_table(ARGMOD(macro_table * table))
{
    mem_sys_free(table);
}

/*

=item C<void declare_macro_local(macro_def * const macro, char const * const
name)>

Declare C<name> as a C<.macro_local> for the macro definition C<macro>.

=cut

*/
void
declare_macro_local(ARGIN(macro_def * const macro),
        ARGIN(char const * const name))
{
    macro_param * param = new_macro_param(name);
    param->next         = macro->macrolocals;
    macro->macrolocals  = param;
}


/*

=item C<int is_macro_local(macro_def * const macro, char const * const name)>

Check whether C<name> was declared as a C<.macro_local> in the macro
definition C<macro>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
int
is_macro_local(ARGIN(macro_def * const macro),
        ARGIN(char const * const name))
{
    macro_param *iter = macro->macrolocals;

    while (iter) {
        if (STREQ(iter->name, name))
            return TRUE;
        iter = iter->next;
    }
    return FALSE;
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
