/*
 * $Id$
 * Copyright (C) 2009, The Perl Foundation.
 */


#include "pircompiler.h"
#include "pircompunit.h"
#include "pirop.h"
#include "pirerr.h"

/*

=head1 DESCRIPTION

This file contains functions related to opcodes.

=head1 FUNCTIONS

=over 4

=cut

*/

/* the order of these letters match with the pir_type enumeration.
 * These are used for generating the full opname (set I0, 10 -> set_i_ic).
 * The first 5 correspond to the values in the pir_type enumeration,
 * the last 5 correspond to the values in the value_type enumeration.
 * Note that the last 's' corresponds to USTRING_VAL, which is a unicode
 * string, but when used it's still a string.
 */
static char const type_codes[10] = {
    'i',   /* INT_TYPE     */
    's',   /* STRING_TYPE  */
    'p',   /* PMC_TYPE     */
    'n',   /* NUM_TYPE     */
    '?',   /* UNKNOWN_TYPE */
    'i',   /* INT_VAL      */
    's',   /* STRING_VAL   */
    'p',   /* PMC_VAL      */
    'n',   /* NUM_VAL      */
    's'    /* USTRING_VAL  */
};

/*

=item C<static int
get_signature_length(expression * const e)>

Calculate the length of the signature for one operand; an operand is separated
from the instruction name or another operand through '_', which must also
be counted.

 set $I0, 42  --> set_i_ic

therefore, for $I0 (a target), return 1 for the type, 1 for the '_', and whatever
is needed for a key, if any, as in this example:

 set $P0[1] = "hi"  --> set_p_kic_sc

$P0 is a target, resulting in "_p", the key [1] is a key ('k') of type int ('i'),
and it's a constant ('c'). Add 1 for the '_'.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
get_signature_length(NOTNULL(expression * const e)) {
    switch (e->type) {
        case EXPR_TARGET:
            return 2 + ((e->expr.t->key != NULL) /* if there's a key on this target ... */
                                                 /* ... get its length. */
                       ? get_signature_length(e->expr.t->key->head->expr) + 1
                       : 0);
        case EXPR_CONSTANT:
            return 3;    /* for _, 'k', 'c' */
        case EXPR_IDENT:
            return 3; /* 1 for '_', 1 for 'i', 1 for 'c' */
        case EXPR_KEY: { /* for '_', 'k' */
            int n;
            /* if the key is an integer constant, then signature becomes '_kic', otherwise _kc. */
            if (e->expr.k->head->expr->type         == EXPR_CONSTANT
            &&  e->expr.k->head->expr->expr.c->type == INT_VAL)
                n = 3;
            else
                n = 2;

            return n + get_signature_length(e->expr.k->head->expr);
        }
        default:
            fprintf(stderr, "wrong expression typein get_signature_length()\n");
            break;
    }
    return 0;
}




/*

=item C<static char *
write_signature(expression * const iter, char *instr_writer)>

Write the signature for the operand C<iter>, using the character
pointer C<instr_writer>. When the operand is an indexed target node
(in other words, it has a key node), this function is invoked recursively
passing the key as an argument.

This function returns the updated character pointer (due to pass-by-value
semantics of the C calling conventions).

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
write_signature(NOTNULL(expression * const iter), NOTNULL(char *instr_writer)) {
    switch (iter->type) {
        case EXPR_TARGET:
            *instr_writer++ = type_codes[iter->expr.t->info->type];

            if (iter->expr.t->key) {
                *instr_writer++ = '_';
                *instr_writer++ = 'k';

                switch (iter->expr.t->key->head->expr->type) {
                    case EXPR_TARGET:
                        switch (iter->expr.t->key->head->expr->expr.t->info->type) {
                            case PMC_TYPE:
                                /* the key is a target, and its type is a PMC. In that
                                 * case, do not print the signature; 'kp' is not valid.
                                 */
                                break;
                            case STRING_TYPE: /* strings become key-constant */
                                *instr_writer++ = 'c';
                                break;
                            case INT_TYPE:
                                *instr_writer++ = 'i';
                                break;
                            default:
                                break;
                        }
                        break;
                    case EXPR_CONSTANT:
                        /* integer constant key results in '_kic' signature */
                        if (iter->expr.c->type == INT_VAL)
                            *instr_writer++ = 'i';

                        *instr_writer++ = 'c';
                        break;
                    default:
                        /* XXX does this ever happen? */
                        fprintf(stderr, "write_signature: non-constant key\n");
                        instr_writer = write_signature(iter->expr.t->key->head->expr, instr_writer);
                        break;
                }

            }
            break;
        case EXPR_CONSTANT:
            *instr_writer++ = type_codes[iter->expr.c->type];
            *instr_writer++ = 'c';
            break;
        case EXPR_IDENT: /* used for labels; these will be converted to (i)nteger (c)onstants*/
            *instr_writer++ = 'i';
            *instr_writer++ = 'c';
            break;
        case EXPR_KEY:
            *instr_writer++ = 'k';

            instr_writer    = write_signature(iter->expr.k->head->expr, instr_writer);
            /*

            switch (iter->expr.k->expr->type) {
                case EXPR_CONSTANT:
                   *instr_writer++ = 'c';
                   break;
                default:
                    fprintf(stderr, "write_signature: non-constant key\n");
                    instr_writer = write_signature(iter->expr.k->expr, instr_writer);
                    break;
            }
            */

            break;
        default:
            fprintf(stderr, "wrong expression type in write_signature()\n");
            break;
    }
    return instr_writer;
}


/*

=item C<static char *
get_signatured_opname(instruction * const instr)>

Returns the full opname of the instruction C<name>; the signature
of the opname is based on the operands, some examples are shown
below:

 set I0, 10        --> set_i_ic
 print "hi"        --> print_sc
 set P0[1], 3.14   --> set_p_kic_nc

For each operand, an underscore is added; then for the types
int, num, string or pmc, an 'i', 'n', 's' or 'p' is added
respectively. If the operand is a constant, a 'c' suffic is added.

If the operand is a key of something, a 'k' prefix is added.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
get_signatured_opname(NOTNULL(lexer_state * const lexer), NOTNULL(instruction * const instr)) {
    size_t      fullname_length;
    char       *fullname;
    char       *instr_writer;
    expression *iter         = instr->operands;
    unsigned    num_operands = 0;

    /* get length of short opname (and add 1 for the NULL character) */
    fullname_length = strlen(instr->opname) + 1;

    /* for each operand, calculate the length of the signature (for that op.)
     * and add it to the full length.
     */
    if (iter) {
        iter = iter->next;
        do {
            int keylength    = get_signature_length(iter);
            fullname_length += keylength;
            iter             = iter->next;
            ++num_operands;
        }
        while (iter != instr->operands->next);
    }

    /* now we know how long the fullname will be, allocate enough memory. */
    fullname = (char *)pir_mem_allocate_zeroed(lexer, fullname_length * sizeof (char));

    /* copy the short name into fullname buffer, and set instr_writer to
     * the character after that.
     */
    strcpy(fullname, instr->opname);
    instr_writer = fullname + strlen(instr->opname);

    /* now iterate again over all operands, and codify them into the fullname.
     * As we counted the number of operands, this loop can be written a bit simpler.
     */
    iter = instr->operands;
    while (num_operands-- > 0) {
        iter            = iter->next;
        *instr_writer++ = '_'; /* separate each operand code by a '_' */
        instr_writer    = write_signature(iter, instr_writer);
    }

    return fullname;
}


/*

=item C<int
get_opinfo(lexer_state * const lexer)>

Compute the signatured opname from the instruction name and its arguments.
Based on this signature, the opcode is retrieved. If the opcode cannot
be found (i.e., it's -1), then a check is done for some special math ops;
C<add_i_ic_ic> and the like do not exist, but instead should be replaced
by C<set_i_ic> (and the like). If it's not one of these special cases,
then that means the op is not valid, and an error message will be reported.

=cut

*/
PARROT_IGNORABLE_RESULT
int
get_opinfo(lexer_state * const lexer) {
    instruction * const instr = CURRENT_INSTRUCTION(lexer);

    char * const fullopname   = get_signatured_opname(lexer, instr);
    /* find the numeric opcode for the signatured op. */
    int          opcode       = lexer->interp->op_lib->op_code(fullopname, 1);

    if (opcode < 0) {
        yypirerror(lexer->yyscanner, lexer, "'%s' is not a parrot op", fullopname);
        return FALSE;
    }
    else {
        update_op(lexer, instr, opcode);
        return TRUE;
    }

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
