/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */
#include "pircompiler.h"
#include "pirsymbol.h"
#include "pircompunit.h"
#include "piryy.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>


/*

=head1 NAME

compilers/pirc/new/pirsymbol.c

=head1 DESCRIPTION

Functions for symbol management. The symbol data structure is used I<only> for
keeping track of declared .local/.param identifiers, and for PIR registers.
As such, a vanilla register allocator is implemented; for each declared identifier
or PIR register, a new PASM register is allocated. This happens immediately on
declaring a C<.param> (as a parameter will I<always> be used for receiving arguments)
and C<.local> symbols will be assigned a PASM register as soon as they're used for
the first time.

=head1 IMPLEMENTATION

Currently, there's different lists for different types of symbols. Symbols
representing C<.local> or C<.param> items are stored using the C<symbol> structure.

PIR registers are stored using the C<pir_reg> structure.

Global identifiers, representing subroutine names are stored in a separate list.

Globally defined constants are stored in yet another separate list.


=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<int
next_register(struct lexer_state * const lexer, pir_type type)>

Returns a new register of the specified type.
This is the vanilla register allocator.

=cut

*/
int
next_register(NOTNULL(lexer_state * const lexer), pir_type type) {
    CURRENT_SUB(lexer)->regs_used[type]++; /* count number of registers used */
    return lexer->curregister[type]++;
}


/*

=item C<static unsigned
get_hashcode(char const * const str, unsigned num_buckets)>

Calculate the hash code for the string C<str>.
This code is taken from IMCC.

=cut

*/
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
unsigned
get_hashcode(NOTNULL(char const * const str), unsigned num_buckets) {
    unsigned long  key = 0;
    char const    *s;

    for (s = str; *s ; s++)
        key = key * 65599 + *s;

    return key % num_buckets;
}

/*

=item C<void
store_bucket(hashtable * const table, bucket * const buck, unsigned long hash)>

Store the bucket C<buck> in the hashtable C<table> at index C<hash>.

=cut

*/
void
store_bucket(NOTNULL(hashtable * const table), NOTNULL(bucket * const buck), unsigned long hash) {
    buck->next = table->contents[hash];
    table->contents[hash] = buck;
}

/*

=item C<bucket *
get_bucket(hashtable * const table, unsigned long hash)>

Return the bucket at hash index C<hash> from the hashtable C<table>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
bucket *
get_bucket(NOTNULL(hashtable * const table), unsigned long hash) {
    return table->contents[hash];
}

/*

=item C<symbol *
new_symbol(lexer_state * const lexer, char const * const name, pir_type type)>

Create a new symbol node, returns it after initialization.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol *
new_symbol(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name), pir_type type) {
    symbol *sym = pir_mem_allocate_zeroed_typed(lexer, symbol);
    sym->name   = name;
    sym->type   = type;
    sym->next   = NULL;
    sym->color  = -1; /* -1 means no PASM reg has been allocated yet for this symbol */
    return sym;
}

/*

=item C<void
declare_local(lexer_state * const lexer, pir_type type, symbol * const list)>

Declare the local variables in the list pointed to by C<list>, all of which
are of the type C<type>. The variables are entered into the symbol table for
the current subroutine that is being parsed (each subroutine has its
own symbol table). Each symbol will be allocated a (PASM) register; in
other words, afer invoking this function, each of the symbol nodes in C<list>
will have been given a PASM register.

=cut

*/
void
declare_local(NOTNULL(lexer_state * const lexer), pir_type type,
              NOTNULL(symbol * const list))
{
    symbol    *iter  = list;
    hashtable *table = &CURRENT_SUB(lexer)->symbols;

    /* store all symbols in the list and set the type on each symbol. */
    while (iter != NULL) {
        unsigned long hash = get_hashcode(iter->name, table->size);
        bucket *b          = new_bucket(lexer);
        bucket_symbol(b)   = iter;
        store_bucket(table, b, hash);

        iter->type  = type;
        iter        = iter->next;
    }

}

/*

=item C<void
check_unused_symbols(lexer_state * const lexer)>

Check all subroutines for unused symbols. If a symbol is declared but
never used, a warning message is printed to C<stderr>.

=cut

*/
void
check_unused_symbols(NOTNULL(lexer_state * const lexer)) {
    subroutine *subiter = lexer->subs->next; /* start at first sub. */

    puts("");

    do {
        hashtable *symbols = &CURRENT_SUB(lexer)->symbols;

        unsigned i;
        for (i = 0; i < symbols->size; i++) {
            bucket *b = get_bucket(symbols, i);
            while (b) {
                if (bucket_symbol(b)->color == -1)
                    fprintf(stderr, "Warning: in sub '%s': symbol '%s' declared but not used\n",
                                    subiter->sub_name, bucket_symbol(b)->name);

                b = b->next;
            }

        }
        subiter = subiter->next;
    }
    while (subiter != lexer->subs->next); /* iterate over all subs */
}

/*

=item C<symbol *
find_symbol(lexer_state * const lexer, char const * const name)>

Return the node for the symbol or NULL if the symbol
is not defined. If an attempt is made to find a symbol,
we assume it is because the symbol will be used; therefore,
allocate a PASM register for it.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
symbol *
find_symbol(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name)) {
    hashtable    *table    = &CURRENT_SUB(lexer)->symbols;
    unsigned long hashcode = get_hashcode(name, table->size);
    bucket       *buck     = get_bucket(table, hashcode);

    while (buck) {
        if (STREQ(bucket_symbol(buck)->name, name)) {
            if (bucket_symbol(buck)->color == -1) /* no PASM register assigned yet */
                bucket_symbol(buck)->color = next_register(lexer, bucket_symbol(buck)->type);

            return bucket_symbol(buck);
        }

        buck = buck->next;
    }
    return NULL;
}

/*

=item C<static pir_reg *
new_pir_reg(lexer_state * const lexer, pir_type type, int regno)>

Create a new PIR register node representing PIR/symbolic register
identified by C<regno> and of type C<type>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static pir_reg *
new_pir_reg(NOTNULL(lexer_state * const lexer), pir_type type, int regno) {
    pir_reg *r = pir_mem_allocate_zeroed_typed(lexer, pir_reg);
    r->type    = type;
    r->regno   = regno;
    r->next    = NULL;
    r->color   = -1; /* -1 means no PASM register has been allocated for this PIR register. */
    return r;
}

/*

=item C<pir_reg *
find_register(lexer_state * const lexer, pir_type type, int regno)>

Find (symbolic) register no. C<regno> of type C<type>. If it's found,
a pointer to it is returned, if not, NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static pir_reg *
find_register(NOTNULL(lexer_state * const lexer), pir_type type, int regno) {
    /* should do a binary search. fix later.
     */
    pir_reg *iter = CURRENT_SUB(lexer)->registers[type];
    while (iter != NULL) {
        if (iter->regno == regno)
            return iter;

        /*
        if (iter->regno > regno)
            return NULL;
        */

        iter = iter->next;
    }

    return NULL;
}


/*

=item C<static int
use_register(lexer_state * const lexer, pir_type type, int regno)>

This function registers (no pun intended) register C<regno> of type
C<type>; a new (PASM) register is allocated to it; each subsequent
reference to register C<regno> of type C<type> can then find this
register (and its allocated PASM register) through the C<find_register>
function.

The function returns the allocated PASM register.

=cut

*/
static int
use_register(NOTNULL(lexer_state * const lexer), pir_type type, int regno) {
    pir_reg *reg;

    /* create a new node representing this PIR register */
    reg = new_pir_reg(lexer, type, regno);
    /* get a new PASM register for this PIR register. */
    reg->color = next_register(lexer, type);

    /* link this register into the list of "colored" registers; each of
     * them has been assigned a unique PASM register.
     */

    reg->next = CURRENT_SUB(lexer)->registers[type];
    CURRENT_SUB(lexer)->registers[type] = reg;

    /* test this better: sort pir_regs on descending regno */
    /**
    do {
        pir_reg *iter;
        iter = CURRENT_SUB(lexer)->registers[type];
        if (iter) {
            while (iter->next && iter->regno > reg->regno)
                iter = iter->next;

            reg->next = iter->next;
            iter->next = reg;
        }
        else {
            CURRENT_SUB(lexer)->registers[type] = reg;
        }
    }
    while (0);
    **/

    /* return newly allocated register */
    return reg->color;
}


/*

=item C<int
color_reg(struct lexer_state * const lexer, pir_type type, int regno)>

Find register C<regno> of type C<type>; if it was used before in the
current subroutine, a (pasm) register was already assigned to it, which
is returned.

If the register was not yet used, mark the register as being used,
and a new (pasm) register is allocated to it, which is returned.

=cut

*/
int
color_reg(NOTNULL(lexer_state * const lexer), pir_type type, int regno) {
    pir_reg *reg = find_register(lexer, type, regno);

    /* was the register already used, then it was already colored by
     * the register allocator; in that case that PASM register is returned.
     */
    if (reg)
        return reg->color;

    /* we're still here, so the register was not used yet; do that now. */
    return use_register(lexer, type, regno);
}


/*

=item C<static global_label *
new_global_label(char * const name)>

Constructor to create a new global_label object.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static global_label *
new_global_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name)) {
    global_label *glob = pir_mem_allocate_zeroed_typed(lexer, global_label);
    glob->name         = name;
    glob->const_nr     = 0;
    return glob;
}

/*

=item C<void
store_global_label(struct lexer_state * const lexer, char * const name)>

Store the global identifier C<name> in C<lexer>'s global label table.

=cut

*/
void
store_global_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name)) {
    hashtable    *table = &lexer->globals;
    unsigned long hash  = get_hashcode(name, table->size);
    bucket *b           = new_bucket(lexer);
    bucket_global(b)    = new_global_label(lexer, name);
    store_bucket(table, b, hash);
}


/*

=item C<global_label *
find_global_label(struct lexer_state * const lexer, char const * const name)>

Find the global identifier C<name>. If no such identifier was found,
then NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
global_label *
find_global_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name)) {
    hashtable    *table    = &lexer->globals;
    unsigned long hashcode = get_hashcode(name, table->size);
    bucket *b              = get_bucket(table, hashcode);

    while (b) {
        if (STREQ(bucket_global(b)->name, name))
            return bucket_global(b);

        b = b->next;
    }
    return NULL;
}

/*

=item C<void
store_global_constant(lexer_state *lexer, constant * const c)>

Store the globally defined constant C<c> in the constant table.

=cut

*/
void
store_global_constant(NOTNULL(lexer_state * const lexer), NOTNULL(constant * const c)) {
    hashtable    *table = &lexer->constants;
    unsigned long hash  = get_hashcode(c->name, table->size);
    bucket *b           = new_bucket(lexer);
    bucket_constant(b)  = c;
    store_bucket(table, b, hash);
}

/*

=item C<constant *
find_global_constant(lexer_state *lexer, char * const name)>

Find a constant defined as C<name>. If no constant was defined by
that name, then NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
constant *
find_global_constant(NOTNULL(lexer_state * const lexer), NOTNULL(char * const name)) {
    hashtable    *table    = &lexer->constants;
    unsigned long hashcode = get_hashcode(name, table->size);
    bucket *b              = get_bucket(table, hashcode);

    while (b) {
        if (STREQ(bucket_constant(b)->name, name))
            return bucket_constant(b);

        b = b->next;
    }

    return NULL;
}

/*

=item C<static label *
new_label(char * const name, unsigned offset)>

Constructor for a label. Create a new label structure, fill out the details
and return it. C<name> is the name of the label; C<offset> is its current
location in the source to which any branching instruction can jump to.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static local_label *
new_local_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const name),
                unsigned offset)
{
    local_label *l = pir_mem_allocate_zeroed_typed(lexer, local_label);
    l->name        = name;
    l->offset      = offset;
    return l;
}

/*

=item C<void
store_local_label(lexer_state * const lexer, char const * const labelname, unsigned offset)>

=cut

*/
void
store_local_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const labelname),
                  unsigned offset)
{
    local_label  *l     = new_local_label(lexer, labelname, offset);
    hashtable    *table = &CURRENT_SUB(lexer)->labels;
    unsigned long hash  = get_hashcode(labelname, table->size);
    bucket *b           = new_bucket(lexer);
    bucket_local(b)     = l;
    store_bucket(table, b, hash);
}

/*

=item C<unsigned
find_local_label(lexer_state * const lexer, char const * const labelname)>

Find the offset for label C<labelname>. If C<labelname> was not defined as
a label, an error is emitted, otherwise, the offset of that label is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
unsigned
find_local_label(NOTNULL(lexer_state * const lexer), NOTNULL(char const * const labelname)) {
    hashtable    *table    = &CURRENT_SUB(lexer)->labels;
    unsigned long hashcode = get_hashcode(labelname, table->size);
    bucket *b              = get_bucket(table, hashcode);

    while (b) {
        if (STREQ(bucket_local(b)->name, labelname))
            return bucket_local(b)->offset;
        b = b->next;
    }

    /* no label found, emit an error message. */
    yypirerror(lexer->yyscanner, lexer, "in sub '%s': cannot find offset for label '%s'",
             CURRENT_SUB(lexer)->sub_name, labelname);

    return 0;
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
