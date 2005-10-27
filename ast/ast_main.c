/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

ast/ast_main.c - AST compiler

=head1 DESCRIPTION

The AST (Abstract Syntax Tree) represents the code of a HLL source module.

=head2 Functions

=over 4

=cut

*/

#include "../imcc/imc.h"
#include "parrot/method_util.h"
#include "ast.h"

extern FILE* ASTin;
extern void ASTparse(Interp *);
extern void ASTparse(Interp *);
extern void AST_scan_string(const char *yy_str);

PMC * ast_compile_past(Parrot_Interp, const char *);
PMC *
ast_compile_past(Parrot_Interp interp, const char *src_string)
{
    char name[64];
    struct PackFile_ByteCode *new_cs, *old_cs;
    PMC *sub;
    parrot_sub_t sub_data;
    struct _imc_info_t *imc_info = NULL;
    nodeType *top_node;
    SymReg *sym;

    if (interp->imc_info->last_unit) {
        /* got a reentrant compile */
        imc_info = mem_sys_allocate_zeroed(sizeof(imc_info_t));
        imc_info->ghash = interp->imc_info->ghash;
        imc_info->prev = interp->imc_info;
        interp->imc_info = imc_info;
    }

    /* pastc always compiles to interp->code->cur_cs
     * make new, switch and save old cs
     */
    sprintf(name, "EVAL_" INTVAL_FMT, ++interp->code->base.pf->eval_nr);
    new_cs = PF_create_default_segs(interp, name, 0);
    old_cs = Parrot_switch_to_cs(interp, new_cs, 0);
    interp->imc_info->cur_namespace = NULL;

    IMCC_push_parser_state(interp);
    if (imc_info)
        interp->imc_info->state->next = NULL;
    IMCC_INFO(interp)->state->pasm_file = 0;
    IMCC_INFO(interp)->state->file = name;
    line = 1;
    AST_scan_string(src_string);
    ASTparse(interp);
    top_node = interp->imc_info->top_node;
    if (top_node) {
        sym = IMCC_expand_nodes(interp, top_node);
        if (interp->imc_info->debug & DEBUG_AST) {
            IMCC_dump_nodes(interp, top_node);
        }
        IMCC_free_nodes(interp, top_node);
    }

    emit_open(interp, 1, NULL);
    imc_compile_all_units_for_ast(interp);
    imc_compile_all_units(interp);

    sub = pmc_new(interp, enum_class_Eval);
    PackFile_fixup_subs(interp, PBC_MAIN, sub);
    if (old_cs) {
        /* restore old byte_code, */
        (void)Parrot_switch_to_cs(interp, old_cs, 0);
    }
    /*
     * create sub PMC
     */
    sub_data = PMC_sub(sub);
    sub_data->seg = new_cs;
    sub_data->address = new_cs->base.data;
    sub_data->end = new_cs->base.data + new_cs->base.size;
    sub_data->name = string_from_cstring(interp, "PAST", 0);

    if (imc_info) {
        interp->imc_info = imc_info->prev;
        mem_sys_free(imc_info);
        imc_info = interp->imc_info;
        cur_unit = imc_info->last_unit;
    }
    else
        imc_cleanup(interp);

    return sub;
}

/*

=item C<IMCC_ast_compile(Interp *, FILE *fp)>

Compile AST source file to bytecode

=cut

*/


void
IMCC_ast_compile(Interp *interpreter, FILE *fp)
{
    nodeType *top_node;
    SymReg *sym;

    ASTin = fp;
    ASTparse(interpreter);

    top_node = interpreter->imc_info->top_node;
    if (top_node) {
        sym = IMCC_expand_nodes(interpreter, top_node);
        if (interpreter->imc_info->debug & DEBUG_AST) {
            IMCC_dump_nodes(interpreter, top_node);
        }
        IMCC_free_nodes(interpreter, top_node);
    }
    interpreter->imc_info->top_node = NULL;
}

static void
register_ast_compiler(Interp* interpreter)
{
    STRING *past = const_string(interpreter, "PAST");
    Parrot_compreg(interpreter, past, ast_compile_past);
}
/*

=item C<IMCC_ast_init(Interp*)>

Initialize the AST compiler

=cut

*/

void
IMCC_ast_init(Interp* interpreter)
{
    register_ast_compiler(interpreter);
}

/*

=back

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
