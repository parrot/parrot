/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pic.c - Polymorphic Inline Cache

=head1 DESCRIPTION

The PIC supports inline caching for MMD and object method lookups in
prederefed run cores. Additionally opcodes that do some kind of lookup
like C<new_p_sc> are changed to faster variants.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include <assert.h>

#define OP_AS_OFFS(o) (_reg_base + ((opcode_t*)cur_opcode)[o])

/*

=item C<void parrot_PIC_prederef(Interp *, opcode_t op, void **pc_pred, int type)>

Define either the normal prederef function or the PIC stub, if PIC for
this opcode function is available. Called from C<do_prederef>.

=cut

*/


#define N_STATIC_TYPES 500
static INTVAL pmc_type_numbers[N_STATIC_TYPES];

void
parrot_PIC_prederef(Interp *interpreter, opcode_t op, void **pc_pred, int core)
{
    op_func_t *prederef_op_func = interpreter->op_lib->op_func_table;
    char * _reg_base = (char*)interpreter->ctx.bp;
    opcode_t *cur_opcode = (opcode_t*)pc_pred;

    switch (op) {
        case PARROT_OP_new_p_sc:
            {
                STRING *class;
                INTVAL type;
                class = *(STRING **)cur_opcode[2];
                type = pmc_type(interpreter, class);
                if (!type) {
                    Parrot_autoload_class(interpreter, class);
                    type = pmc_type(interpreter, class);
                }
                if (type <= 0)
                    real_exception(interpreter, NULL, NO_CLASS,
                            "Class '%Ss' not found", class);
                if (type > N_STATIC_TYPES)
                    internal_exception(1, "Unimp: too many classes");
                /*
                 * the prederef bytecode needs the address of
                 * an INTVAL holding the type
                 *
                 * TODO if beyond limit use a malloced array
                 */
                pmc_type_numbers[type] = type;
                pc_pred[2] = pmc_type_numbers + type;
                op = PARROT_OP_new_p_ic;
            }
            break;
    }
    /*
     * else set default prederef code address
     */
    if (core == PARROT_SWITCH_CORE)
        *pc_pred = (void**) op;
    else
        *pc_pred = ((void **)prederef_op_func)[op];
}

/*

=back

=head1 AUTHOR

Leopold Toetsch with many hints from Ken Fox.

=head1 SEE ALSO

F<src/mmd.c>, F<src/object.c>, F<src/interpreter.c>, F<ops/core_ops_cgp.c>

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
