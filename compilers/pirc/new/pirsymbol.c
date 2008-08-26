/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */
#include "pircompiler.h"
#include "pirsymbol.h"
#include "pircompunit.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>


/*

=head1 NAME

compilers/pirc/new/pirsymbol.c

=head1 DESCRIPTION

Functions for symbol management. The symbol data structure is used I<only> for
keeping track of declared .local/.param identifiers, and for PIR registers.
As such, a vanilla register allocator is implemented; for each declared identifier
or PIR register, a new PASM register is allocated.

=head1 IMPLEMENTATION

Currently, there's different lists for different types of symbols. Symbols
representing C<.local> or C<.param> items are stored using the C<symbol> structure.

PIR registers are stored using the C<pir_reg> structure.

Global identifiers, representing subroutine names are stored in a separate list.

Globally defined constants are stored in yet another separate list.

It might be worthwhile to investigate the possibility to store all symbols in
one data structure (for instance, a hashtable), using one C structure to
describe the properties (possibly an enumeration of symbol types).


=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<int
next_register(struct lexer_state *lexer)>

Returns a new register of the specified type.
This is the vanilla register allocator.

=cut

*/
int
next_register(struct lexer_state * const lexer, pir_type type) {
    lexer->subs->regs_used[type]++; /* count number of registers used */
    return lexer->curregister[type]++;
}


/*

=item C<symbol *
new_symbol(char *name)>

Create a new symbol node, returns it after initialization.

=cut

*/
symbol *
new_symbol(char * const name, pir_type type) {
    symbol *sym = (symbol *)malloc(sizeof (symbol));
    assert(sym != NULL);
    sym->name   = name;
    sym->type   = type;
    sym->next   = NULL;
    sym->color  = -1; /* -1 means no PASM reg has been allocated yet for this symbol */
    return sym;
}

/*

=item C<void
declare_local(struct lexer_state *lexer, pir_type type, target *list)>

Declare the local variables in the list pointed to by C<list>, all of which
are of the type C<type>. The variables are entered into the symbol table for
the current subroutine that is being parsed (each subroutine has its
own symbol table). Each symbol will be allocated a (PASM) register; in
other words, afer invoking this function, each of the symbol nodes in C<list>
will have been given a PASM register.

=cut

*/
void
declare_local(struct lexer_state * const lexer, pir_type type, symbol *list) {
    symbol *iter = list;

    /* bad implementation, but best i can come up with now. */

    /* set the type on each symbol */
    while (iter != NULL) {
        iter->type  = type;

        /* XXX do not allocate a register just yet; wait till the moment that
         * the symbol is actually used; unused, declared symbols won't be
         * given a PASM register.
         */
        /* iter->color = next_register(lexer, type); XXX test this. XXX*/

        iter        = iter->next;
    }

    /* add the symbol to the symbol table, which is currently implemented
     * as a linked list.
     */
    if (lexer->subs->symbols == NULL) /* no symbols yet */
        lexer->subs->symbols = list;
    else {
        /* go to end of list */
        iter = list;
        while (iter->next != NULL)
            iter = iter->next;

        /* link existing list on list->next, and set symbols list to this list */
        iter->next           = lexer->subs->symbols;
        lexer->subs->symbols = list;
    }

}

/*

=item C<void
check_unused_symbols(struct lexer_state *lexer)>

Check all subroutines for unused symbols. If a symbol is declared but
never used, a warning message is printed to C<stderr>.

Unused symbols should be prevented, as they I<are> assigned a PASM register.
Effectively, this is a waste of PASM registers; the subroutine could do
with less.

=cut

*/
void
check_unused_symbols(struct lexer_state * const lexer) {
    subroutine *subiter = lexer->subs->next;
    do {
        symbol *iter = lexer->subs->symbols;

        while (iter) {
            if (iter->color == -1) {
                /* maybe only check for .locals, not .params. For now, disable this. */
                /*
                fprintf(stderr, "Warning: in sub '%s': symbol '%s' declared but not used\n",
                        subiter->sub_name, iter->name);
                */
            }

            iter = iter->next;
        }

        subiter = subiter->next;
    }
    while (subiter != lexer->subs);
}

/*

=item C<symbol *
find_symbol(struct lexer_state *lexer, char * const name)>

Return the node for the symbol or NULL if the symbol
is not defined. If an attempt is made to find a symbol,
we assume it is because the symbol will be I<used>; therefore,
the C<used> flag is set.

=cut

*/
symbol *
find_symbol(struct lexer_state * const lexer, char * const name) {
    symbol *iter;
    /* check whether there's a subroutine in place; if not, the
     * specified name is an identifier being parsed outside of a .sub;
     * in that case, NULL is returned.
     */
    if (lexer->subs) /* then initialize iterator */
        iter = lexer->subs->symbols;
    else
        return NULL;

    while (iter) {

        if (strcmp(iter->name, name) == 0) {

            /* if the symbol is not yet used, allocate a new PASM register */
            if (iter->color == -1)
                iter->color = next_register(lexer, iter->type);

            return iter;
        }

        iter = iter->next;
    }
    return NULL;
}

/*

=item C<static pir_reg *
new_pir_reg(pir_type type, int regno)>

Create a new PIR register node representing PIR/symbolic register
identified by C<regno> and of type C<type>.

=cut

*/
static pir_reg *
new_pir_reg(pir_type type, int regno) {
    pir_reg *r = (pir_reg *)malloc(sizeof (pir_reg));
    assert(r != NULL);
    r->type    = type;
    r->regno   = regno;
    r->next    = NULL;
    r->color   = -1; /* -1 means no PASM register has been allocated for this PIR register. */
    return r;
}

/*

=item C<pir_reg *
find_register(struct lexer_state *lexer, pir_type type, int regno)>

Find (symbolic) register no. C<regno> of type C<type>. If it's found,
a pointer to it is returned, if not, NULL is returned.

=cut

*/
static pir_reg *
find_register(struct lexer_state * const lexer, pir_type type, int regno) {
    /* should do a binary search. fix later.
     */
    pir_reg *iter = lexer->subs->registers[type];
    while (iter != NULL) {
        if (iter->regno == regno)
            return iter;

        iter = iter->next;
    }

    return NULL;
}


/*

=item C<static int
use_register(struct lexer_state *lexer, pir_type type, int regno)>

This function registers (no pun intended) register C<regno> of type
C<type>; a new (PASM) register is allocated to it; each subsequent
reference to register C<regno> of type C<type> can then find this
register (and its allocated PASM register) through the C<find_register>
function.

The function returns the allocated PASM register.

=cut

*/
static int
use_register(struct lexer_state * const lexer, pir_type type, int regno) {
    pir_reg *reg, *iter;

    /* create a new node representing this PIR register */
    reg        = new_pir_reg(type, regno);
    /* get a new PASM register for this PIR register. */
    reg->color = next_register(lexer, type);

    /* insert, as registers only increase, just insert at the beginning.
     * searching must therefore look from high to low reg. numbers
     */
    iter       = lexer->subs->registers[type];

    /* link this register into the list of "colored" registers; each of
     * them has been assigned a unique PASM register.
     */
    reg->next                    = lexer->subs->registers[type];
    lexer->subs->registers[type] = reg;


    /* return newly allocated register */
    return reg->color;
}


/*

=item C<int
color_reg(struct lexer_state *lexer, pir_type type, int regno)>

Find register C<regno> of type C<type>; if it was used before in the
current subroutine, a (pasm) register was already assigned to it, which
is returned.

If the register was not yet used, mark the register as being used,
and a new (pasm) register is allocated to it, which is returned.

=cut

*/
int
color_reg(struct lexer_state * const lexer, pir_type type, int regno) {
    pir_reg *reg = find_register(lexer, type, regno);

    /* was the register already used, then it was already colored by
     * the register allocator.
     */
    if (reg)
        return reg->color;

    /* we're still here, so the register was not used yet; do that now. */
    return use_register(lexer, type, regno);
}


/*

=item C<static global_ident *
new_global_ident(char * const name)>

Constructor to create a new global_ident object.

=cut

*/
static global_ident *
new_global_ident(char * const name) {
    global_ident *glob = (global_ident *)malloc(sizeof (global_ident));
    assert(glob);
    glob->name     = name;
    glob->next     = NULL;
    glob->const_nr = 0;
    return glob;
}

/*

=item C<void
store_global_ident(struct lexer_state *lexer, char * const name)>

Store the global identifier C<name>.

=cut

*/
void
store_global_ident(struct lexer_state * const lexer, char * const name) {
    global_ident *glob = new_global_ident(name);

    /* store the global in the lexer */
    if (lexer->globals) {
        glob->next     = lexer->globals;
        lexer->globals = glob;
    }
    else
        lexer->globals = glob;
}

/*

=item C<global_ident *
find_global_ident(struct lexer_state *lexer, char * const name)>

Find the global identifier C<name>. If no such identifier was found,
then NULL is returned.

=cut

*/
global_ident *
find_global_ident(struct lexer_state * const lexer, char * const name) {
    global_ident *iter = lexer->globals;
    while (iter) {
        if (strcmp(iter->name, name) == 0)
            return iter;
        iter = iter->next;
    }
    return NULL;
}

/*

=item C<void
store_global_const(struct lexer_state *lexer, constant * const c)>

Store the globally defined constant C<c> in the constant table.

=cut

*/
void
store_global_const(struct lexer_state * const lexer, constant * const c) {
    if (lexer->constants) {
        c->next = lexer->constants;
        lexer->constants = c;
    }
    else {
        lexer->constants = c;
    }

}

/*

=item C<constant *
find_constant(struct lexer_state *lexer, char * const name)>

Find a constant defined as C<name>. If no constant was defined by
that name, then NULL is returned.

=cut

*/
constant *
find_constant(struct lexer_state * const lexer, char * const name) {
    constant *iter = lexer->constants;
    while (iter) {
        if (strcmp(iter->name, name) == 0)
            return iter;
        iter = iter->next;
    }
    return NULL;
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
