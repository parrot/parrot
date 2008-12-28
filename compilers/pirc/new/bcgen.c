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

=head1 SYNOPSIS

  // create a bytecode object
  bytecode *bc = new_bytecode(interp, "foo.pir", codesize, bytes);

  while ( ... ) {

      // write opcodes
      int opcode = ...

      emit_opcode(bc, opcode);
      // emit constants
      int mystring = add_string_const(bc, "hello");

      // emit the constant index into bytecode stream
      emit_int_arg(bc, mystring);
  }

  // write the pbc file
  write_pbc_file(bc, "foo.pbc");

  // clean up
  destroy_bytecode(bc);

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

=item C<PMC *
get_pmc_const(bytecode * const bc, unsigned index)>

Get the PMC constant at index C<index> in the PBC constant table.

=cut

*/
PMC *
get_pmc_const(bytecode * const bc, unsigned index) {
    /* make sure the requested PMC exists. */
    PARROT_ASSERT(index < bc->interp->code->const_table->const_count);
    /* make sure the requested constant is a PMC */
    PARROT_ASSERT(bc->interp->code->const_table->constants[index]->type == PFC_PMC);

    return bc->interp->code->const_table->constants[index]->u.key;
}

/*

=item C<bytecode *
new_bytecode(Interp *interp, char const * const filename)>

Create a new bytecode struct, representing the bytecode for file C<filename>.
The bytecode struct contains a PackFile, which is initialized and
loaded into the Parrot interpreter C<interp>. Default bytecode segments
are created, and the interpreter's C<iglobals> field is stored as a constant
PMC in the bytecode's constant table.

=cut

*/
bytecode *
new_bytecode(Interp *interp, char const * const filename) {
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
    PARROT_ASSERT(filename != NULL);
    interp->code      = PF_create_default_segs(interp, filename, 1);

    /* add interpreter globals to bytecode. XXX Why is this? */
    self              = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_INTERPRETER);
    add_pmc_const(bc, self);

    return bc;
}

/*

=item C<void
create_codesegment(bytecode * const bc, int codesize)>

Create a code segment of size C<codesize>.

=cut

*/
void
create_codesegment(bytecode * const bc, int codesize) {
    /* allocate enough space. XXX I *think* bytes is /always/ codesize * 4. */
    bc->interp->code->base.data = (opcode_t *)mem_sys_realloc(bc->interp->code->base.data,
                                                              codesize * 4);

    bc->interp->code->base.size = codesize;

    /* initialize the cursor to write opcodes into the code segment */
    bc->opcursor = (opcode_t *)bc->interp->code->base.data;
}

/*

=item C<void
destroy_bytecode(bytecode * bc)>

Destructor for bytecode struct; frees all memory.

=cut

*/
void
destroy_bytecode(bytecode * bc) {
    /* XXX should we do this? Not Parrot? */
    mem_sys_free(bc->interp->code->base.data);
    mem_sys_free(bc);
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

/* XXX remove or update prototype once the XXX below has been resolved. */
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
add_sub_pmc(bytecode * const bc, sub_info * const info)>

Add a sub PMC to the constant table. This function initializes the sub PMC.
The index where the PMC is stored in the constant table is returned.

=cut

*/
int
add_sub_pmc(bytecode * const bc, sub_info * const info) {
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
    subname_index = add_string_const(bc, info->subname);
    subname_const = bc->interp->code->const_table->constants[subname_index];

    /* set start and end offset of this sub in the bytecode. This is calculated during
     * the parsing phase.
     */
    sub->start_offs       = info->startoffset;
    sub->end_offs         = info->endoffset;

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
    sub->vtable_index     = info->vtable_index;

    /* XXX fix multi stuff */
    sub->multi_signature  = NULL;

    /* store register usage of this sub. */
    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = info->regs_used[i];

    /* store the name of this sub; it's stored in the constant table. */
    sub->name = subname_const->u.string;

    /* If there was a :nsentry, add it to the constants table, and set
     * the ns_entry_name attribute to that STRING. Default value is the sub's name.
     */
    if (info->nsentry)
        sub->ns_entry_name = add_string_const_from_cstring(bc, info->nsentry);
    else
        sub->ns_entry_name = subname_const->u.string;

    /* if there was a :subid, add it to the constants table, and set the subid
     * attribute to that STRING. Default value is the sub's name.
     */
    if (info->subid)
        sub->subid = add_string_const_from_cstring(bc, info->subid);
    else
        sub->subid = subname_const->u.string;


    /* store the sub in a namespace. XXX why, and in what namespace? sub->namespace_name?
     * XXX must this be done always? (this w.r.t. the recent discussion about :vtable/:method
     * and being :anon etc.
     */
    Parrot_store_sub_in_namespace(bc->interp, sub_pmc);
    subconst_index = add_pmc_const(bc, sub_pmc);

    /* Add a new fixup entry in the fixup table for this sub. */
    PackFile_FixupTable_new_entry(bc->interp, info->subname, enum_fixup_sub, subconst_index);

    /* return the index in the constant table where this sub PMC is stored */
    return subconst_index;
}


/*

=item C<void
write_pbc_file(bytecode * const bc, char const * const filename)>

Write the generated bytecode (stored somewhere in a packfile)
to the file C<filename>.

=cut

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
