/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#include <stdio.h>
#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

#include "bcgen.h" /* XXX future maybe parrot/bcgen.h */


/*

=head1 DESCRIPTION

This file implements an API for generating bytecode. All gory details
are hidden. In order to improve modularity, all bytecode generating
functions take a C<bytecode> struct parameter, which keeps track of
the I<state>; this includes a Parrot interpreter.

Since this state is private, the bytecode struct is declared in this
C file, not in the header file. It is, however, declared in the header
file as a struct, so you can use it as a type, but not touch its
private bits. Everything you need to know should be accessible through
accessor functions.

=cut

*/


struct bytecode {
    PackFile    *packfile;       /* the actual packfile */
    opcode_t    *opcursor;       /* for writing ops into the code segment */
    Interp      *interp;         /* parrot interpreter */
};


static int new_const(bytecode * const bc);


/*

=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<static int
new_const(bytecode * const bc)>

Add a new constant to the constant table.

XXX This function needs to be cleaned up, as it's not really efficient: constant table
is resized each time a constant is added.

=cut

*/
static int
new_const(bytecode * const bc) {
    Interp *interp = bc->interp;
    size_t oldcount;
    size_t newcount;
    PackFile_Constant *new_constant;

    oldcount = interp->code->const_table->const_count;
    newcount = oldcount + 1;

    new_constant = PackFile_Constant_new(interp);

    /* Update the constant count and reallocate */
    if (interp->code->const_table->constants)
        interp->code->const_table->constants =
            mem_realloc_n_typed(interp->code->const_table->constants,
                newcount, PackFile_Constant *);
    else
        interp->code->const_table->constants =
            mem_allocate_n_typed(newcount, PackFile_Constant *);

    interp->code->const_table->constants[oldcount] = new_constant;
    interp->code->const_table->const_count         = newcount;

    return oldcount;
}

/*

=item C<int
add_pmc_const(bytecode * const bc, PMC * pmc)>

Add the PMC constant C<pmc> to the constant table. This
function returns the index in the constant table where C<pmc>
is stored.

=cut

*/
int
add_pmc_const(bytecode * const bc, PMC * pmc) {
    int index                   = new_const(bc);
    PackFile_Constant *constant = bc->interp->code->const_table->constants[index];
    constant->type              = PFC_PMC;
    constant->u.key             = pmc;
    return index;
}

/*

=item C<int
add_string_const(bytecode * const bc, char const * const str)>

Add the string constant C<str> to the constant table. This function
returns the index in the constant table where C<str> is stored.

XXX what to do with encoding-thingy "ascii"? Probably should be an extra parameter?
Or should it be a STRING at this point already?

=cut

*/
int
add_string_const(bytecode * const bc, char const * const str) {
    int                index    = new_const(bc);
    PackFile_Constant *constant = bc->interp->code->const_table->constants[index];

    constant->type     = PFC_STRING;
    constant->u.string = string_make(bc->interp, str, strlen(str), "ascii", PObj_constant_FLAG);
    return index;
}


/*

=item c<int
add_num_const(bytecode * const bc, double f)>

XXX should f be a FLOATVAL?

Add a number constant to the constants list. The index in the constant
table where C<f> is stored is returned.

=cut

*/
int
add_num_const(bytecode * const bc, double f) {
    int index                   = new_const(bc);
    PackFile_Constant *constant = bc->interp->code->const_table->constants[index];
    constant->type              = PFC_NUMBER;
    constant->u.number          = f;
    return index;
}

/*

=item C<int
add_key_const(bytecode * const bc, PMC *key)>

Add a key constant to the constants list.
XXX Implement this.

=cut

*/
int
add_key_const(bytecode * const bc, PMC *key) {
    return 0;
}


/*

=item C<bytecode *
new_bytecode(Interp *interp, char const * const filename, int bytes, int codesize)>

Create a new bytecode struct, representing the bytecode for file C<filename>

Create a new bytecode struct and return a pointer to it.

=cut

*/
bytecode *
new_bytecode(Interp *interp, char const * const filename, int bytes, int codesize) {
    PMC      *self;
    bytecode *bc      = (bytecode *)mem_sys_allocate(sizeof (bytecode));

    /* Create a new packfile and load it into the parrot interpreter */
    bc->packfile      = PackFile_new(interp, 0);
    Parrot_loadbc(interp, bc->packfile);

    /* store a pointer to the parrot interpreter, which saves passing around
     * the interp as an extra argument.
     */
    bc->interp        = interp;

    /* create segments */
    interp->code      = PF_create_default_segs(interp, filename, 1);

    /* add interpreter globals to bytecode. XXX Why is this? */
    self              = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_INTERPRETER);
    add_pmc_const(bc, self);

    /* allocate enough space. XXX I *think* bytes is /always/ codesize * 4. */
    interp->code->base.data = (opcode_t *)mem_sys_realloc(interp->code->base.data, bytes);
    interp->code->base.size = codesize;

    /* initialize the cursor to write opcodes into the code segment */
    bc->opcursor = (opcode_t *)interp->code->base.data;

    return bc;
}

/*

=item C<void
emit_opcode(bytecode * const bc, opcode_t op)>

Write the opcode C<op> into the bytecode stream.

=cut

*/
void
emit_opcode(bytecode * const bc, opcode_t op) {
    *bc->opcursor++ = op;
}

/*

=item C<void
emit_int_arg(bytecode * const bc, int intval)>

Write an integer argument into the bytecode stream.
XXX Possibly use 1 function for emitting opcodes and ints; they're
the same anyway?

=cut

*/
void
emit_int_arg(bytecode * const bc, int intval) {
    *bc->opcursor++ = intval;
}

/*

=item C<void
emit_op_by_name(bytecode * const bc, char const * const opname)>

Emit the opcode by name. C<opname> must be a valid, signatured opname.
So, C<print> is not valid, whereas C<print_ic> is. The opcode of the
opname is looked up and written into the bytecode stream. If C<opname>
is not valid, an error message is written.

XXX Possibly bail out if error? No need to continue.

=cut

*/
void
emit_op_by_name(bytecode * const bc, char const * const opname) {
    int op = bc->interp->op_lib->op_code(opname, 1);
    if (op < 0) {
        /* error */
        fprintf(stderr, "Error: '%s' is not an op\n", opname);
    }
    else
        emit_opcode(bc, op);
}

static STRING *add_string_const_from_cstring(bytecode * const bc, char const * const str);

/*

XXX think of better name.
Add a string constant to the constants list, and return the STRING variant

*/
static STRING *
add_string_const_from_cstring(bytecode * const bc, char const * const str) {
    int index = add_string_const(bc, str);
    return bc->interp->code->const_table->constants[index]->u.string;
}




/*

=item C<void
add_sub_pmc(bytecode * const bc,
            char const * const subname,  -- the name of this sub
            char const * const nsentry,  -- the value of the :nsentry flag
            char const * const subid,    -- the value of the :subid flag
            int vtable_index,            -- vtable index, or -1 if no :vtable
            unsigned regs_used[],        -- register usage of this sub
            int startoffset,             -- start offset of this sub in bytecode
            int endoffset)>              -- end offset of this sub in bytecode

Add a sub PMC to the constant table. This function initializes the sub PMC.

=cut

*/
void
add_sub_pmc(bytecode * const bc,
            char const * const subname,
            char const * const nsentry,
            char const * const subid,
            int vtable_index,
            unsigned regs_used[],
            int startoffset,
            int endoffset)
{
    PMC               *sub_pmc;
    Parrot_sub        *sub;
    int                subconst_index;
    int                subname_index;
    int                i;
    PackFile_Constant *subname_const;


    /* The .sub is represented by a "Sub" PMC.
     * If that should be changed into something else, fix that here (e.g. "Coroutine").
     */
    sub_pmc       = pmc_new(bc->interp, enum_class_Sub);
    sub           = PMC_sub(sub_pmc);
    subname_index = add_string_const(bc, subname);
    subname_const = bc->interp->code->const_table->constants[subname_index];

    /* set start and end offset of this sub in the bytecode. This is calculated during
     * the parsing phase.
     */
    sub->start_offs       = startoffset;
    sub->end_offs         = endoffset;

    /* XXX fix namespace stuff */
    sub->namespace_name   = NULL;

    /* XXX does this work properly? is "current_HLL" really "current"? */
    sub->HLL_id           = CONTEXT(bc->interp)->current_HLL;

    /* XXX fix lex stuff */
    sub->lex_info         = NULL;

    /* XXX fix outer stuff */
    sub->outer_sub        = NULL;

    /* Set the vtable index; if this .sub was declared as :vtable, its vtable
     * index was found during the parse; otherwise it's -1.
     */
    sub->vtable_index     = vtable_index;

    /* XXX fix multi stuff */
    sub->multi_signature  = NULL;

    /* store register usage of this sub. */
    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = regs_used[i];

    /* store the name of this sub; it's stored in the constant table. */
    sub->name = subname_const->u.string;

    /* If there was a :nsentry, add it to the constants table, and set
     * the ns_entry_name attribute to that STRING. Default value is the sub's name.
     */
    if (nsentry)
        sub->ns_entry_name = add_string_const_from_cstring(bc, nsentry);
    else
        sub->ns_entry_name = subname_const->u.string;

    /* if there was a :subid, add it to the constants table, and set the subid
     * attribute to that STRING. Default value is the sub's name.
     */
    if (subid)
        sub->subid = add_string_const_from_cstring(bc, subid);
    else
        sub->subid = subname_const->u.string;


    /* store the sub in a namespace. XXX why, and in what namespace? sub->namespace_name?
     * XXX must this be done always? (this w.r.t. the recent discussion about :vtable/:method
     * and being :anon etc.
     */
    Parrot_store_sub_in_namespace(bc->interp, sub_pmc);
    subconst_index = add_pmc_const(bc, sub_pmc);

    /* Add a new fixup entry in the fixup table for this sub. */
    PackFile_FixupTable_new_entry(bc->interp, subname, enum_fixup_sub, subconst_index);
}


/*

=item C<void
write_pbc_file(bytecode * const bc, char const * const filename)>

Write the generated bytecode (stored somewhere in a packfile)
to the file C<filename>.

*/
void
write_pbc_file(bytecode * const bc, char const * const filename) {
    size_t    size;
    opcode_t *packed;
    FILE     *fp;
    int       result;

    /* pack the packfile */
    size   = PackFile_pack_size(bc->interp, bc->interp->code->base.pf) * sizeof (opcode_t);
    packed = (opcode_t*) mem_sys_allocate(size);
    PackFile_pack(bc->interp, bc->interp->code->base.pf, packed);

    /* write to file */
    fp = fopen(filename, "wb");

    if (fp == NULL)
        fprintf(stderr, "Couldn't open %s\n", filename);

    result = fwrite(packed, size, 1, fp);

    if (result != 1)
        fprintf(stderr, "Couldn't write %s\n", filename);

    fclose(fp);

    /* done! */
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
