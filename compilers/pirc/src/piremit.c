/*
 * $Id$
 * Copyright (C) 2008-2009, The Perl Foundation.
 */

#include <stdio.h>
#include "piremit.h"
#include "pircompunit.h"
#include "pircompiler.h"
#include "pirerr.h"
#include "bcgen.h"

#include "parrot/oplib/ops.h"
#include "assert.h"

/*

=head1 DESCRIPTION

This file contains emit functions. Depending on the requested output,
the appropriate emit functions are used. Options are:

 -p     for PASM output
 -b     for bytecode output

The functions in this file walk the data structure that is built during
the parse phase. During the traversal, bytecode for instructions and
their operands are emitted through the C<bcgen> module.


=head1 FUNCTIONS

=over 4

=cut

*/

static char const * const subflag_names[] = {
    "method",
    "init",
    "load",
    "outer",
    "main",
    "anon",
    "postcomp",
    "immediate",
    "vtable",
    "lex",
    "multi",
    "lexid"
};

#define out lexer->outfile

/* the order of these letters match with the pir_type enumeration.
 * These are used for human-readable PASM output.
 */
char const pir_register_types[5] = {'I', 'S', 'P', 'N', '?'};

static void emit_pir_statement(lexer_state * const lexer, subroutine * const sub);
static void emit_pir_instruction(lexer_state * const lexer, instruction * const instr);
static void emit_pbc_expr(lexer_state * const lexer, expression * const operand);


/* prototype declaration */
void print_expr(lexer_state * const lexer, expression * const expr);
void print_key(lexer_state * const lexer, key * const k);
void print_target(lexer_state * const lexer, target * const t);
void print_constant(lexer_state * const lexer, constant * const c);
void print_expressions(lexer_state * const lexer, expression * const expr);
void print_instruction(lexer_state * const lexer, instruction * const ins);
void print_statement(lexer_state * const lexer, subroutine * const sub);

/*

=item C<void
print_key(lexer_state * const lexer, key * const k)>

Print the key C<k>. The total key is enclosed in square brackets,
and different key elements are separated by semicolons. Example:

 ["hi";42]

has two elements: C<"hi"> and C<42>.

=cut

*/
void
print_key(lexer_state * const lexer, key * const k) {
    key_entry *iter;

    fprintf(out, "[");

    if (k && k->head) {
        iter = k->head;
        print_expr(lexer, iter->expr);

        while (iter->next) {
            iter = iter->next;
            fprintf(out, ";");
            print_expr(lexer, iter->expr);
        }
    }
    fprintf(out, "]");
}

/*

=item C<void
print_target(lexer_state * const lexer, target * const t)>

Print the target C<t>; if C<t> has a key, that key is
printed as well. Examples:

 S1, P1[42]

=cut

*/
void
print_target(lexer_state * const lexer, target * const t) {
    PARROT_ASSERT(t->info);
    fprintf(out, "%c%d", pir_register_types[t->info->type], t->info->color);

    /* if the target has a key, print that too */
    if (t->key)
        print_key(lexer, t->key);
}

/*

=item C<void
print_constant(lexer_state * const lexer, constant * const c)>

Print the value of constant C<c>. Based on C<c>'s type, the appropriate
value is printed.

=cut

*/
void
print_constant(lexer_state * const lexer, constant * const c) {
    switch (c->type) {
        case INT_VAL:
            fprintf(out, "%d", c->val.ival);
            break;
        case NUM_VAL:
            fprintf(out, "%f", c->val.nval);
            break;
        case STRING_VAL:
            fprintf(out, "\"%s\"", c->val.sval);
            break;
        case PMC_VAL:
            fprintf(out, "\"%s\"", c->val.pval);
            break;
        case USTRING_VAL:
            fprintf(out, "%c:\"%s\"", c->val.ustr->charset, c->val.ustr->contents);
            break;
        default:
            panic(lexer, "Unknown type detected in print_constant()");
            break;
    }
}

/*

=item C<void
print_expr(lexer_state * const lexer, expression * const expr)>

Print the expression C<expr>. This is a dispatch function, calling
a specialized function based on C<expr>'s type.

=cut

*/
void
print_expr(lexer_state * const lexer, expression * const expr) {
    switch (expr->type) {
        case EXPR_TARGET:
            print_target(lexer, expr->expr.t);
            break;
        case EXPR_CONSTANT:
            print_constant(lexer, expr->expr.c);
            break;
        case EXPR_IDENT:
            fprintf(out, "%s", expr->expr.id);
            break;
        case EXPR_KEY:
            print_key(lexer, expr->expr.k);
            break;
        case EXPR_LABEL:
            fprintf(out, "%d", expr->expr.l->offset);
            break;
        default:
            break;
    }
}

/*

=item C<void
print_expressions(expression * const expr)>

Print the list of expressions pointed to by C<expr>,
if C<expr> is not NULL. If C<expr> is NULL, the
function does nothing and returns. Expressions are
separated by commas.

=cut

*/
void
print_expressions(lexer_state * const lexer, expression * const expr) {
    expression *iter;

    if (expr == NULL)
        return;

    iter = expr->next;

    do {
        print_expr(lexer, iter);
        iter = iter->next;
        if (iter != expr->next) fprintf(out, ", ");
    }
    while (iter != expr->next);

}

/*

=item C<void
print_instruction(lexer_state * const lexer, instruction * const ins)>

Print the instruction C<ins>.

=cut

*/
void
print_instruction(lexer_state * const lexer, instruction * const ins) {
    PARROT_ASSERT(ins != NULL);

    if (ins->label) {
        if (TEST_FLAG(lexer->flags, LEXER_FLAG_EMIT_PASM))
            fprintf(out, "%s:\n", ins->label);
        else
            fprintf(out, "%u %s:\n", ins->offset, ins->label);
    }

    if (ins->opname) {

        if (TEST_FLAG(lexer->flags, LEXER_FLAG_EMIT_PASM)) {
            fprintf(out, "    %s ", ins->opinfo->name);
            print_expressions(lexer, ins->operands);
        }
        else {
            fprintf(out, "%04u   %s ", ins->offset, ins->opname);
            print_expressions(lexer, ins->operands);
            fprintf(out, "\t# op %d", ins->opcode);
        }
        fprintf(out, "\n");
    }
}

/*

=item C<void
print_statement(lexer_state * const lexer, subroutine * const sub)>

XXX

=cut

*/
void
print_statement(lexer_state * const lexer, subroutine * const sub) {
    instruction *statiter;

    if (sub->statements == NULL)
        return;

    statiter = sub->statements->next;

    do {
        print_instruction(lexer, statiter);
        statiter = statiter->next;
    }
    while (statiter != sub->statements->next);
}

/*

=item C<void
print_subs(struct lexer_state * const lexer)>

Top-level function to print all generated code. This function
iterates over all subs and prints their instructions.

=cut

*/
void
print_subs(struct lexer_state * const lexer) {
    subroutine *subiter;

    if (lexer->subs == NULL)
        return;

    /* set iterator to first item */
    subiter = lexer->subs->next;

    /* XXX for now this works */
    lexer->outfile = stderr;

    do {

/*
        fprintf(out, "# subroutine '%s' register usage\n", subiter->info.subname);
        fprintf(out, "#   int   : %d\n", subiter->info.regs_used[INT_TYPE]);
        fprintf(out, "#   num   : %d\n", subiter->info.regs_used[NUM_TYPE]);
        fprintf(out, "#   string: %d\n", subiter->info.regs_used[STRING_TYPE]);
        fprintf(out, "#   pmc   : %d\n", subiter->info.regs_used[PMC_TYPE]);
*/

        fprintf(out, ".namespace ");
        print_key(lexer, subiter->name_space);
        fprintf(out, "\n");

        if (subiter->flags) {
            int i;
            fprintf(out, ".pcc_sub ");
            for (i = 0; i < BIT(i); i++) {
                if (TEST_FLAG(subiter->flags, BIT(i))) {
                    fprintf(out, " :%s", subflag_names[i]);
                }
            }

        }

        fprintf(out, "%s:\n", subiter->info.subname);
        print_statement(lexer, subiter);
        subiter = subiter->next;
    }
    while (subiter != lexer->subs->next);

}

/*

=item C<static void
emit_pir_instruction(lexer_state * const lexer, instruction * const instr)>

Print the PIR representation of C<instr>. If C<instr> has a label, that
is printed first.

=cut

*/
static void
emit_pir_instruction(lexer_state * const lexer, instruction * const instr) {

    if (instr->label)
        fprintf(out, "  %s:\n", instr->label);

    if (instr->opinfo) {
        fprintf(out, "    %-10s\t", instr->opinfo->name);
        print_expressions(lexer, instr->operands);
        fprintf(out, "\n");
    }
}

/*

=item C<static void
emit_pir_statement(lexer_state * const lexer, subroutine * const sub)>

Emit all statements of the subroutine C<sub>. The statements
are emitted in PIR format. If there are no statements in C<sub>,
this function returns.

=cut

*/
static void
emit_pir_statement(lexer_state * const lexer, subroutine * const sub) {
    instruction *statiter;

    if (sub->statements == NULL)
        return;

    statiter = sub->statements->next;

    do {
        emit_pir_instruction(lexer, statiter);
        statiter = statiter->next;
    }
    while (statiter != sub->statements->next);

}

/*

=item C<void
emit_pir_subs(lexer_state * const lexer)>

Print the PIR representation of all subroutines stored
in the C<lexer>. If there are no subroutines, thre function
does nothing and returns.

=cut

*/
void
emit_pir_subs(lexer_state * const lexer, char const * const outfile) {
    subroutine *subiter;

    if (lexer->subs == NULL)
        return;

    /* set iterator to first item */
    subiter = lexer->subs->next;

    if (outfile) {
        lexer->outfile = fopen(outfile, "w");
    }
    else {
        lexer->outfile = stdout;
    }

    do {
        int i;
        fprintf(out, "\n.namespace ");
        print_key(lexer, subiter->name_space);

        fprintf(out, "\n.sub %s", subiter->info.subname);

        for (i = 0; i < BIT(i); i++) {
            if (TEST_FLAG(subiter->flags, BIT(i))) {
                fprintf(out, " :%s", subflag_names[i]);
            }
        }

        fprintf(out, "\n");
        emit_pir_statement(lexer, subiter);
        fprintf(out, ".end\n");

        subiter = subiter->next;
    }
    while (subiter != lexer->subs->next);

}



/*

=item C<static void
emit_pbc_const_arg(lexer_state * const lexer, constant * const c)>

Emit a constant argument into the bytecode. An integer is emitted
inline in the bytecode; other types are stored in the constant table,
and their index in the constant table is emitted into the bytecode.

=cut

*/
static void
emit_pbc_const_arg(lexer_state * const lexer, constant * const c) {

    switch (c->type) {
        case INT_VAL:
            emit_int_arg(lexer->bc, c->val.ival);
            break;
        case NUM_VAL: {
            int index = add_num_const(lexer->bc, c->val.nval);
            emit_int_arg(lexer->bc, index);
            break;
        }
        case STRING_VAL: {
            int index = add_string_const(lexer->bc, c->val.sval, "ascii");
            emit_int_arg(lexer->bc, index);
            break;
        }
        case PMC_VAL: {

                /* look up the sub by its name stored in c->val.pval, then
                 * find out what that sub's PMC_CONST is in the constant table,
                 * and emit that.
                 */

                global_label *sub = find_global_label(lexer, c->val.pval);

                if (sub != NULL) {
                    int sub_pmc_index = sub->const_table_index;
                    emit_int_arg(lexer->bc, sub_pmc_index);
                }
                else {
                    yypirerror(lexer->yyscanner, lexer,
                               "cannot find referenced sub '%s'", c->val.pval);
                }

            break;
        }
        case USTRING_VAL: {
            int index = add_string_const(lexer->bc, c->val.ustr->contents, c->val.ustr->charset);
            emit_int_arg(lexer->bc, index);
            break;
        }
        default:
            panic(lexer, "unknown constant type");
            break;
    }
}





/*

=item C<static void
emit_pbc_label_arg(lexer_state * const lexer, label * const l)>

Emit the value of the label offset of label C<l>.

=cut

*/
static void
emit_pbc_label_arg(lexer_state * const lexer, label * const l) {
    emit_int_arg(lexer->bc, l->offset);
}



/*

=item C<static void
emit_pbc_key(lexer_state * const lexer, key * const k)>

Emit bytecode for the key C<k>. First the bytecode is
written to a temporary buffer, which is later unpacked
in the actual PackFile. See C<store_key_bytecode()>.


=cut

*/
static int
emit_pbc_key(lexer_state * const lexer, key * const k) {
    key_entry  *iter;
    opcode_t   *key;
    opcode_t    keysize;    /* total size of key in bytecode */
    opcode_t   *pc;         /* cursor to write into key array */
    expression *operand;
    int         index;

    /* create an array of opcode_t for storing the bytecode representation
     * of the key. Initialize the cursor (pc) to write into this buffer.
     * The size is 2 opcode_t's for each key plus 1 opcode_t for storing the size.
     */
    pc  =
    key = (opcode_t *)pir_mem_allocate(lexer, (k->keylength * 2 + 1) * sizeof (opcode_t));

    /* store key length in slot 0 */
    *pc++ = k->keylength;

    /* initialize iterator */
    iter  = k->head;

    while (iter) {
        switch (iter->expr->type) {
            case EXPR_CONSTANT: {
                constant *c = iter->expr->expr.c;
                switch (c->type) {
                    case INT_VAL:
                        *pc++ = PARROT_ARG_IC;
                        *pc++ = c->val.ival;
                        break;
                    case STRING_VAL:
                        *pc++ = PARROT_ARG_SC;
                        *pc++ = add_string_const(lexer->bc, c->val.sval, "ascii");
                        break;
                    case USTRING_VAL:
                        *pc++ = PARROT_ARG_SC;
                        *pc++ = add_string_const(lexer->bc, c->val.ustr->contents,
                                                            c->val.ustr->charset);
                        break;
                    default:
                        panic(lexer, "wrong type of key");
                        break;
                }

                break;
            }
            case EXPR_TARGET: {
                target *t = iter->expr->expr.t;

                switch (t->info->type) {
                    case INT_TYPE:
                        *pc++ = PARROT_ARG_I;
                        break;
                    case STRING_TYPE:
                        *pc++ = PARROT_ARG_S;
                        break;
                    default:
                        panic(lexer, "wrong type of key");
                        break;
                }

                *pc++ = t->info->color;
                break;
            }
            case EXPR_KEY:
                fprintf(stderr, "Nested keys are not supported.");
                break;

            default:
                panic(lexer, "unknown expression type");
                break;

        }

        iter = iter->next;
    }

    /* calculate size of key in bytecode; each field has 2 INTVALs:
     * flags/types and the register/constant index.
     */
    keysize = pc - key;

    /* store the key, and emit the index at which it's stored into the code segment */
    index = store_key_bytecode(lexer->bc, key);
    emit_int_arg(lexer->bc, index);

    return index;

}


/*

=item C<static void
emit_pbc_target_arg(lexer_state * const lexer, target * const t)>

Emit the assigned register of target C<t>. The assigned register is
stored in the C<color> field, of either the C<pir_reg> or C<symbol>
structure, depending on whether C<t> is a register or a symbol,
respectively. If C<t> has a key, the key is emitted as well.

=cut

*/
static void
emit_pbc_target_arg(lexer_state * const lexer, target * const t) {
    emit_int_arg(lexer->bc, t->info->color);

    /* if t has a key, emit that as well */
    if (t->key) {
        emit_pbc_key(lexer, t->key);
    }
}

/*

=item C<static void
emit_pbc_expr(lexer_state * const lexer, expression * const operand)>

Emit bytecode for the expression C<operand>. This is a dispatch
function, invoking the appropriate function depending on C<operand>'s
type.

=cut

*/
static void
emit_pbc_expr(lexer_state * const lexer, expression * const operand) {
    switch (operand->type) {
        case EXPR_CONSTANT:
            emit_pbc_const_arg(lexer, operand->expr.c);
            break;
        case EXPR_TARGET:
            emit_pbc_target_arg(lexer, operand->expr.t);
            break;
        case EXPR_LABEL:
            emit_pbc_label_arg(lexer, operand->expr.l);
            break;
        case EXPR_KEY:
            emit_pbc_key(lexer, operand->expr.k);
            break;
        default:
            break;
    }
}



/*

=item C<static void
optimize_instr(lexer_state * const lexer, instruction * const instr)>

Optimize the instruction C<instr>. Currently, these instructions are optimized:

 box_p_ic  --> set_p_pc
 box_p_nc  --> set_p_pc
 box_p_sc  --> set_p_pc

=cut

*/
static void
optimize_instr(lexer_state * const lexer, instruction * const instr) {

    switch (instr->opcode) {
        case PARROT_OP_box_p_ic: {
            /* box P0, 42 --> set P0, <Integer PMC const with value 42> */

            /* the last operand, which is the second in this case */
            expression *second_operand = instr->operands;
            PMC *intconst = pmc_new(lexer->interp,
                                    Parrot_get_ctx_HLL_type(lexer->interp, enum_class_Integer));
            int index     = add_pmc_const(lexer->bc, intconst);
            VTABLE_set_integer_native(lexer->interp, intconst, second_operand->expr.c->val.ival);

            instr->opcode = PARROT_OP_set_p_pc;

            /* replace 2nd operand with the new one. */
            second_operand->expr.c->val.ival = index;

            break;
        }
        case PARROT_OP_box_p_nc: {
            /* box P0, 3.14 --> set P0, <Integer PMC const with value 3.14> */

            /* the last operand, which is the second in this case */
            expression *second_operand = instr->operands;
            PMC *numconst = pmc_new(lexer->interp,
                                    Parrot_get_ctx_HLL_type(lexer->interp, enum_class_Float));
            int index     = add_pmc_const(lexer->bc, numconst);
            VTABLE_set_number_native(lexer->interp, numconst, second_operand->expr.c->val.nval);

            instr->opcode = PARROT_OP_set_p_pc;

            /* replace 2nd operand with the new one. */
            second_operand->expr.c->val.ival = index;
            second_operand->expr.c->type     = INT_VAL;

            break;
        }
        case PARROT_OP_box_p_sc: {
            /* box P0, "hi" --> set P0, <String PMC const with value "hi"> */

            /* the last operand, which is the second in this case */
            expression *second_operand = instr->operands;
            PMC *strconst = pmc_new(lexer->interp,
                                    Parrot_get_ctx_HLL_type(lexer->interp, enum_class_String));
            int index     = add_pmc_const(lexer->bc, strconst);

            VTABLE_set_string_native(lexer->interp, strconst,
                                     string_from_cstring(lexer->interp,
                                                         second_operand->expr.c->val.sval,
                                                         strlen(second_operand->expr.c->val.sval)));

            instr->opcode = PARROT_OP_set_p_pc;

            /* replace 2nd operand with the new one. */
            second_operand->expr.c->val.ival = index;
            second_operand->expr.c->type     = INT_VAL;

            break;
        }
        default:
            break;
    }
}

/*

=item C<static void
emit_pbc_instr(lexer_state * const lexer, instruction * const instr)>

Emit PBC for one instruction. If the C<opinfo> attribute of C<instr>
is NULL, the function does nothing and returns.

=cut

*/
static void
emit_pbc_instr(lexer_state * const lexer, instruction * const instr) {
    int         i;
    expression *operand;
    opcode_t offset;

    if (instr->opinfo == NULL)
        return;


    /* optimize, if possible.
     * XXX is this a good place to do that?
     */
    optimize_instr(lexer, instr);

    /* emit the opcode */
    offset = emit_opcode(lexer->bc, instr->opcode);

    /* the offset at which the instruction is written must be equal
     * to the offset that we calculated ourselves. Sanity check!
     */

    /*
    if (offset != instr->offset)
        fprintf(stderr, "unexpected offset: %d / %d\n",  offset, instr->offset);
    else
        fprintf(stderr, "offset ok\n");

    */

    /* emit the arguments */

    /* note that opinfo->op_count counts all operands plus the op itself;
     * so count 1 for the op itself.
     */
    if (instr->opinfo->op_count > 1) {
        /* operands are stored in a circular linked list; instr->operands points
         * to the *last* operand, its next pointer points to the first operand.
         */
        operand = instr->operands->next;

        do {
            emit_pbc_expr(lexer, operand);
            operand = operand->next;
        }
        while (operand != instr->operands->next);
    }


}


/*

=item C<static void
emit_pbc_sub(lexer_state * const lexer, subroutine * const sub)>

Emit bytecode for the subroutine C<sub>.

=cut

*/
static void
emit_pbc_sub(lexer_state * const lexer, subroutine * const sub) {
    instruction *iter;

    if (sub->statements == NULL)
        return;

    /* initialize iter to first instruction */
    iter = sub->statements->next;

    do {
        emit_pbc_instr(lexer, iter);
        iter = iter->next;
    }
    while (iter != sub->statements->next);

    /* run :immediate subs */
    if (TEST_FLAG(sub->flags, PIRC_SUB_FLAG_IMMEDIATE)) {
        PackFile_fixup_subs(lexer->interp, PBC_IMMEDIATE, NULL);
    }
}


/*

=item C<static void
emit_pbc_annotations(lexer_state * const lexer)>

Emit all annotations into the PackFile. First a new annotations
segment is created. Then, for each annotation, its value is stored
in the constants table.

=cut

*/
static void
emit_pbc_annotations(lexer_state * const lexer) {
    annotation *iter;

    if (lexer->annotations == NULL)
        return;

    /* create an annotations segment, which is not created by default. */
    create_annotations_segment(lexer->bc, lexer->filename);

    /* initialize to the first annotation */
    iter = lexer->annotations->next;

    /* iterate over annotations and store them */
    do {

        opcode_t key, value;


        switch (iter->value->type) {
            case INT_VAL:
                value = iter->value->val.ival;
                break;
            case NUM_VAL:
                value = add_num_const(lexer->bc, iter->value->val.nval);
                break;
            case STRING_VAL:
                value = add_string_const(lexer->bc, iter->value->val.sval, "ascii");
                break;
            case USTRING_VAL:
                value = add_string_const(lexer->bc, iter->value->val.ustr->contents,
                                                    iter->value->val.ustr->charset);
                break;
            default:
                panic(lexer, "unknown annotation constant type");
                return; /* panic() exits, so this never happens */
        }


        add_annotation(lexer->bc, iter->offset, key, iter->value->type, value);

        iter = iter->next;
    }
    while (iter != lexer->annotations->next);


}



/*

=item C<void
emit_pbc(lexer_state * const lexer)>

Generate Parrot Byte Code from the abstract syntax tree.
This is the top-level function. After all instructions
have been emitted, the PBC is written to a file.

=cut

*/
void
emit_pbc(lexer_state * const lexer) {
    subroutine *subiter;

    if (lexer->subs == NULL)
        return;
/*
    fprintf(stderr, "emit_pbc(): starting...\n");
*/

    /* after everything is parsed we know how many instructions and operands
     * there are, and thus how many bytes must be allocated for emitting
     * the bytecode. At this point we can create the codesegment.
     */
    create_codesegment(lexer->bc, lexer->codesize);

/*
    fprintf(stderr, "ok 1\n");
*/
    /* initialize iterator */
    subiter = lexer->subs->next;

    assert(subiter);
    /* iterate over all instructions and emit them */
    do {
/*
        fprintf(stderr, "start offset of sub '%s' is: %d\tend offest: %d\n",
                    subiter->info.subname, subiter->info.startoffset, subiter->info.endoffset);
*/
        emit_pbc_sub(lexer, subiter);
        subiter = subiter->next;
    }
    while (subiter != lexer->subs->next);

    /* emit annotations */
    emit_pbc_annotations(lexer);

    /* write the output to a file. */
    write_pbc_file(lexer->bc, "a.pbc");  /* XXX fix output file specified by user */

    /* XXX just make sure no seg. faults  happened */
/*
    fprintf(stderr, "done writing pbc\n");
*/
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


