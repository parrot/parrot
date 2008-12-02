/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */
#include <stdio.h>
#include <assert.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
/*
#include "bcgen.h"
*/

/* private bits of the bytecode generator */

typedef enum bc_const_types {
    BC_INT_CONST_TYPE,
    BC_NUM_CONST_TYPE,
    BC_STR_CONST_TYPE,
    BC_PMC_CONST_TYPE

} bc_const_type;

typedef union const_value {
    INTVAL    ival;
    FLOATVAL  nval;
    STRING   *sval;
    PMC      *pval;

} const_value;

typedef struct bc_const {
    bc_const_type     type;  /* type of constant */
    int               index; /* index into constant table */
    const_value       value; /* this constant's value */

    struct bc_const * next;  /* linked list */

} bc_const;


/* Note that typedef of struct bytecode is already done in the header file */

struct bytecode {
    int          num_constants;
    bc_const    *constants;
    PackFile    *packfile;
    opcode_t    *opcursor;
    Interp      *interp;

};

typedef struct bytecode bytecode;

static bc_const * new_const(bytecode * const bc);

/*

=head1 FUNCTIONS

=over 4

=cut

*/

static bc_const *
new_const(bytecode * const bc) {
    bc_const *bcc = (bc_const *)mem_sys_allocate(sizeof (bc_const));
    bcc->index    = bc->num_constants++;
    bcc->next     = bc->constants;
    bc->constants = bcc;
    return bcc;
}

bc_const *
add_pmc_const(bytecode * const bc, PMC * pmc) {
    bc_const *bcc   = new_const(bc);
    bcc->type       = BC_PMC_CONST_TYPE;
    bcc->value.pval = pmc;
    return bcc;
}

bc_const *
add_string_const(bytecode * const bc, char const * const str) {
    bc_const *bcc   = new_const(bc);
    bcc->type       = BC_STR_CONST_TYPE;
    bcc->value.sval = string_make(bc->interp, str, strlen(str), "ascii", PObj_constant_FLAG);
    return bcc;
}

/*

=item new_bytecode

Create a new bytecode struct and return a pointer to it.

=cut

*/
bytecode *
new_bytecode(Interp *interp, char const * const filename) {
    PMC      *self;
    bytecode *bc      = (bytecode *)mem_sys_allocate(sizeof (bytecode));
    int bytes         = 12;

    bc->packfile      = PackFile_new(interp, 0);
    bc->constants     = NULL;
    bc->interp        = interp;
    bc->num_constants = 0;

    Parrot_loadbc(interp, bc->packfile);

    interp->code      = PF_create_default_segs(interp, filename, 1);
    self              = VTABLE_get_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_INTERPRETER);

    add_pmc_const(bc, self);

    interp->code->base.data = (opcode_t *)mem_sys_realloc(interp->code->base.data, bytes);
    interp->code->base.size = 3;

    bc->opcursor   = (opcode_t *)interp->code->base.data;

    return bc;
}

void
emit_opcode(bytecode * const bc, opcode_t op) {
    *bc->opcursor++ = op;
}

void
emit_int_arg(bytecode * const bc, int intval) {
    *bc->opcursor++ = intval;
}

void
emit_op_by_name(bytecode * const bc, char const * const opname) {
    int op = bc->interp->op_lib->op_code(opname, 1);
    if (op < 0) {
        /* error */
        fprintf(stderr, "'%s' is not an op", opname);
    }
    else
        emit_opcode(bc, op);
}


static void
add_sub_pmc(bytecode * const bc, char const * const subname) {
    Interp     *interp    = bc->interp;
    PMC        *sub_pmc   = pmc_new(bc->interp, enum_class_Sub);
    Parrot_sub *sub       = PMC_sub(sub_pmc);
    bc_const   *subconst;

    int i;
    bc_const *subid       = add_string_const(bc, subname);

    sub->start_offs       = 0;
    sub->end_offs         = 3;
    sub->namespace_name   = NULL;
    sub->HLL_id           = CONTEXT(interp)->current_HLL;

    sub->lex_info         = NULL;
    sub->outer_sub        = NULL;
    sub->vtable_index     = -1;
    sub->multi_signature  = NULL;

    for (i = 0; i < 4; ++i)
        sub->n_regs_used[i] = 0;

    sub->name          = subid->value.sval;
    sub->ns_entry_name = subid->value.sval;
    sub->subid         = subid->value.sval;

    subconst = add_pmc_const(bc, sub_pmc);

    Parrot_store_sub_in_namespace(bc->interp, sub_pmc);
    /* PackFile_FixupTable_new_entry(bc->interp, subname, enum_fixup_sub, subconst->index);
    */                                                           /* doesn't work?? */
}

static void
emit_constants(bytecode * const bc) {
    bc_const *iter = bc->constants;

    /* allocate enough space */

    fprintf(stderr, "allocating space for %d constants\n", bc->num_constants);
    bc->interp->code->const_table->constants
                                   = mem_allocate_n_typed(bc->num_constants, PackFile_Constant *);

    /* walk the list and put all of them into the constant table. */
    while (iter) {
        fprintf(stderr, "constant (%d)...\n", iter->index);


        bc->interp->code->const_table->constants[iter->index] = PackFile_Constant_new(bc->interp);

        assert(bc->interp->code->const_table->constants[iter->index]);
        switch (iter->type) {
            /*
            case BC_NUM_CONST_TYPE:
                bc->interp->code->const_table->constants[iter->index]->type  = 0;;
                bc->interp->code->const_table->constants[iter->index]->u.key = iter->value.nval;
                break;
                */
            case BC_STR_CONST_TYPE:
                bc->interp->code->const_table->constants[iter->index]->type     = PFC_STRING;
                bc->interp->code->const_table->constants[iter->index]->u.string = iter->value.sval;
                break;
            case BC_PMC_CONST_TYPE:
                bc->interp->code->const_table->constants[iter->index]->type  = PFC_PMC;
                bc->interp->code->const_table->constants[iter->index]->u.key = iter->value.pval;
                break;
            /*
            case BC_INT_CONST_TYPE:
                break;
            */
            default:
                /* error */
                fprintf(stderr, "wrong constant type!\n");
                break;
        }
        iter = iter->next;
    }
}

/*

Write the bytecode to the file C<filename>.

*/
void
write_pbc_file(bytecode * const bc, char const * const filename) {
    size_t    size;
    opcode_t *packed;
    FILE     *fp;
    int       result;

    assert(bc->interp->code->base.pf);

    emit_constants(bc);

    fprintf(stderr, "constants written...\n");
    size   = PackFile_pack_size(bc->interp, bc->interp->code->base.pf) * sizeof (opcode_t);
    packed = (opcode_t*) mem_sys_allocate(size);

    PackFile_pack(bc->interp, bc->interp->code->base.pf, packed);

    fp = fopen(filename, "wb");

    if (fp == NULL)
        fprintf(stderr, "Couldn't open %s\n", filename);

    result = fwrite(packed, size, 1, fp);

    if (result != 1)
        fprintf(stderr, "Couldn't write %s\n", filename);

    fclose(fp);
}


/*

Test driver.

*/
int
main(int argc, char **argv) {
    Interp *interp = Parrot_new(NULL);
    bytecode *bc   = new_bytecode(interp, "test.pir");


    emit_op_by_name(bc, "print_ic");
    emit_int_arg(bc, 42);
    emit_op_by_name(bc, "end");
    add_sub_pmc(bc, "main");

    fprintf(stderr, "writing pbc...");
    write_pbc_file(bc, "test.pbc");
    fprintf(stderr, "written pbc file\n");
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
