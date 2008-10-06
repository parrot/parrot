/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */

#include "piremit.h"
#include "pircompunit.h"
#include "pircompiler.h"

#include <stdio.h>


/*

=head1 FUNCTIONS

=over 4

=cut

*/


/*
#define out lexer->outfile
*/

#define out stdout

/* the order of these letters match with the pir_type enumeration.
 * These are used for human-readable PASM output.
 */
static char const pir_register_types[5] = {'I', 'N', 'S', 'P', '?'};



/* prototype declaration */
void print_expr(lexer_state * const lexer, expression * const expr);
void print_key(lexer_state * const lexer, key *k);

/*

=item C<void
print_key(key *k)>

Print the key C<k>. The total key is enclosed in square brackets,
and different key elements are separated by semicolons. Example:

 ["hi";42]

has two elements: C<"hi"> and C<42>.

=cut

*/
void
print_key(lexer_state * const lexer, key *k) {
    fprintf(out, "[");

    if (k && k->expr) {
        print_expr(lexer, k->expr);

        while (k->next) {
            k = k->next;
            fprintf(out, ";");
            print_expr(lexer, k->expr);
        }
    }
    fprintf(out, "]");
}

/*

=item C<void
print_target(target * const t)>

Print the target C<t>; if C<t> has a key, that key is
printed as well. Examples:

 S1, P1[42]

=cut

*/
void
print_target(lexer_state *lexer, target * const t) {
    fprintf(out, "%c%d", pir_register_types[t->type], t->color);

    /* if the target has a key, print that too */
    if (t->key)
        print_key(lexer, t->key);
}

/*
=item C<void
print_constant(constant *c)>

Print the value of constant C<c>.

=cut

*/
void
print_constant(lexer_state * const lexer, constant * const c) {
    switch (c->type) {
        case INT_TYPE:
            fprintf(out, "%d", c->val.ival);
            break;
        case NUM_TYPE:
            fprintf(out, "%f", c->val.nval);
            break;
        case STRING_TYPE:
            fprintf(out, "\"%s\"", c->val.sval);
            break;
        case PMC_TYPE:
            fprintf(out, "\"%s\"", c->val.pval);
            break;
        case UNKNOWN_TYPE:
            panic(lexer, "Unknown type detected in print_constant()");
            break;
    }
}

/*

=item C<void
print_expr(lexer_state * const lexer, expression * const expr)>

Print the expression C<expr>.

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
    }
}

/*

=item C<void
print_expressions(expression * const expr)>

Print the list of expressions pointed to by C<expr>,
if C<expr> is not NULL. Expressions are separated by commas.

=cut

*/
void
print_expressions(lexer_state * const lexer, expression * const expr) {
    if (expr) {
        expression *iter = expr->next;

        do {
            print_expr(lexer, iter);
            iter = iter->next;
            if (iter != expr->next) fprintf(out, ", ");
        }
        while (iter != expr->next);
    }
}

void
print_instruction(lexer_state * const lexer, instruction *ins) {
    PARROT_ASSERT(ins != NULL);

    if (ins->label)
        fprintf(out, "%u %s:\n", ins->offset, ins->label);

    if (ins->opname) {

        fprintf(out, "%u   %s ", ins->offset, ins->opname);

        print_expressions(lexer, ins->operands);

        fprintf(out, "\t# op %d", ins->opcode);

        fprintf(out, "\n");
    }
}

void
print_statement(lexer_state * const lexer, subroutine * const sub) {
    if (sub->statements != NULL) {
        instruction *statiter = sub->statements->next;

        do {
            print_instruction(lexer, statiter);
            statiter = statiter->next;
        }
        while (statiter != sub->statements->next);
    }

}

/*
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
*/



/*

=item C<void
print_subs(struct lexer_state * const lexer)>

=cut

*/
void
print_subs(struct lexer_state * const lexer) {
    if (lexer->subs != NULL) {
        /* set iterator to first item */
        subroutine *subiter = lexer->subs->next;

        do {

            fprintf(out, "# subroutine '%s' register usage\n", subiter->sub_name);
            fprintf(out, "#   int   : %d\n", subiter->regs_used[INT_TYPE]);
            fprintf(out, "#   num   : %d\n", subiter->regs_used[NUM_TYPE]);
            fprintf(out, "#   string: %d\n", subiter->regs_used[STRING_TYPE]);
            fprintf(out, "#   pmc   : %d\n", subiter->regs_used[PMC_TYPE]);

            fprintf(out, ".namespace ");
            print_key(lexer, subiter->name_space);
            fprintf(out, "\n");

            if (subiter->flags) {
                fprintf(out, "\n.pcc_sub ");

                if (TEST_FLAG(subiter->flags, SUB_FLAG_MAIN))
                    fprintf(out, ":main ");
                if (TEST_FLAG(subiter->flags, SUB_FLAG_METHOD))
                    fprintf(out, ":method ");
                    /* XXX and so on; check which ones are available in PASM mode. */

            }

            fprintf(out, "%s:\n", subiter->sub_name);
            print_statement(lexer, subiter);
            subiter = subiter->next;
        }
        while (subiter != lexer->subs->next);
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


