/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

ast/node.c - AST node handling

=head1 DESCRIPTION

The AST (Abstract Syntax Tree) represents the code of a HLL source module.

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <stdio.h>

#include "ast.h"
#include "../imcc/imc.h"

static void
pr(nodeType *p)
{
    if (!p)
	return;
    printf("%s", p->u.r->name);
}

static void
const_dump(nodeType *p, int l)
{
    pr(p);
}

static nodeType*
exp_Const(Interp* interpreter, nodeType *p)
{
    return p;
}

static void
set_const(nodeType *p)
{
    p->expand = exp_Const;
    /* p->context = const_context; */
    p->dump = const_dump;
    p->opt = NULL;
    p->d = "Const";
}

static void
dump(nodeType *p, int l)
{
    nodeType *child;
    printf("\n%*s", l*2, "");
    printf("%s(", p->d);
    if (p->dump)
	p->dump(p, l);
    else {
	child = NODE0(p);
	if (child)
	    dump(child, l + 1);
    }
    printf(")");
    if (!p->dump && p->next )
	dump(p->next, l);
}

static nodeType *
new_node(YYLTYPE *loc)
{
    nodeType *p = mem_sys_allocate_zeroed(sizeof(nodeType));
    p->loc = *loc;
    return p;
}

static nodeType *
new_con(YYLTYPE *loc)
{
    nodeType *p = new_node(loc);
    set_const(p);
    return p;
}

static Instruction *
insINS(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        const char *name, SymReg **regs, int n)
{
    Instruction *tmp = INS(interpreter, unit, name, NULL, regs, n, 0, 0);
    insert_ins(unit, ins, tmp);
    return tmp;
}
/*
 * node expand aka code creation functions
 */

static nodeType*
exp_Var(Interp* interpreter, nodeType *p)
{
    return p;
}

static nodeType*
exp_default(Interp* interpreter, nodeType *p)
{
    nodeType *child;
    nodeType *next = p->next;
    child = NODE0(p);
    if (child)
        child->expand(interpreter, child);
    if (next)
        next->expand(interpreter, next);
    return p;
}

static nodeType*
exp_next(Interp* interpreter, nodeType *p)
{
    nodeType *next = p->next;
    if (next)
        next->expand(interpreter, next);
    return p;
}

static nodeType*
exp_Py_Module(Interp* interpreter, nodeType *p)
{
    /*
     * this is the main init code
     */
    IMC_Unit *unit = cur_unit = imc_open_unit(interpreter, IMC_PCCSUB);
    SymReg *sub = mk_sub_address(str_dup("__main__"));
    Instruction *i = INS_LABEL(cur_unit, sub, 1);

    i->r[1] = mk_pcc_sub(str_dup(i->r[0]->name), 0);
    add_namespace(interpreter, i->r[1]);
    i->r[1]->pcc_sub->pragma = P_MAIN|P_PROTOTYPED ;
    /*
     * Py_Module has a child node which are statements
     */
    return exp_default(interpreter, p);
}

static nodeType*
exp_Py_Print(Interp* interpreter, nodeType *p)
{
    IMC_Unit *unit = interpreter->imc_info->last_unit;
    Instruction *ins = unit->last_ins;
    SymReg *regs[IMCC_MAX_REGS];
    nodeType * child = NODE0(p);
    if (!child)
        fatal(1, "exp_Py_Print", "nothing to print");
    child = child->expand(interpreter, child);
    /* TODO file handle node */
    if (child->expand == exp_Const || child->expand == exp_Var)
        regs[0] = child->u.r;
    else
        fatal(1, "exp_Py_Print", "unknown node to print");

    insINS(interpreter, unit, ins, "print_item", regs, 1);
    return exp_next(interpreter, p);
}

static nodeType*
exp_Py_Print_nl(Interp* interpreter, nodeType *p)
{
    IMC_Unit *unit = interpreter->imc_info->last_unit;
    Instruction *ins = unit->last_ins;
    SymReg *regs[IMCC_MAX_REGS];
    insINS(interpreter, unit, ins, "print_newline", regs, 0);
    return exp_next(interpreter, p);
}

static nodeType*
exp_Src_File(Interp* interpreter, nodeType *p)
{
    return exp_default(interpreter, p);
}

static nodeType*
exp_Src_Lines(Interp* interpreter, nodeType *p)
{
    return exp_default(interpreter, p);
}


static nodeType* create_0(int nr, nodeType *self, nodeType *p);
static nodeType* create_1(int nr, nodeType *self, nodeType *p);

typedef struct {
    const char *name;
    node_create_t create;
    node_expand_t expand;
    node_opt_t opt;
    node_dump_t   dump;
} node_names;

/*
 * keep this list sorted
 * TODO create an include file from this list with node numbers
 */

static node_names ast_list[] = {
    { "-no-node-", 	NULL, NULL, NULL, NULL },
    { "Const", 		NULL, exp_Const, NULL, const_dump },
#define CONST_NODE 1
    { "Py_Module", 	create_1, exp_Py_Module, NULL, NULL },
    { "Py_Print" , 	create_1, exp_Py_Print, NULL, NULL },
    { "Py_Print_nl",	create_0, exp_Py_Print_nl, NULL, NULL },
    { "Src_File",    	create_1, exp_Src_File, NULL, NULL },
    { "Src_Line",    	create_1, exp_Src_Lines, NULL, NULL },
    { "Stmts",          create_1, exp_default, NULL, NULL }
};

static int
ast_comp(const void *a, const void *b)
{
    const node_names *pa = (const node_names *) a;
    const node_names *pb = (const node_names *) b;
    return strcmp(pa->name, pb->name);
}

static void
print_node_name(int i) {
    printf("%s", ast_list[i].name);
}

static void
set_fptrs(nodeType *self, int nr)
{
    self->d = ast_list[nr].name;
    self->expand = ast_list[nr].expand;
    self->opt    = ast_list[nr].opt;
    self->dump   = ast_list[nr].dump;
}

static nodeType*
create_0(int nr, nodeType *self, nodeType *p)
{
    set_fptrs(self, nr);
    return self;
}

static nodeType*
create_1(int nr, nodeType *self, nodeType *p)
{
    p->up = self;
    NODE0(self) = p;
    set_fptrs(self, nr);
    return self;
}

/*
 * API
 */

/*

=item C<int IMCC_find_node_type(const char *name)>

Returns the index in C<ast_list> of the given node name. The node must exist.

=cut

*/

int
IMCC_find_node_type(const char *name)
{
    node_names search, *r;

    search.name = name;
    r = bsearch(&search, ast_list, sizeof(ast_list) / sizeof(ast_list[0]),
		sizeof(ast_list[0]), ast_comp);

    if (!r) {
	fatal(1, "IMCC_find_node_type", "Unknown astnode '%s'\n", name);
    }
    return r - ast_list;
}

/*

=item C<nodeType *IMCC_new_const_node(char *name, int set, YYLTYPE *loc)>

Create a new Const node for the given constant C<name> and Parrot register
set C<set>. Set may be:

  'I' ... Integer
  'N' ... Number
  'S' ... String
  'U' ... String treated as unicode string

=cut

*/

nodeType *
IMCC_new_const_node(char *name, int set, YYLTYPE *loc)
{
    nodeType *p = new_con(loc);
    SymReg *r = mk_const(name, set);
    p->u.r = r;
    return p;
}

/*

=item C<nodeType *IMCC_new_node(int nr, nodeType *child, YYLTYPE *loc)>

Create a new node with node type number C<nr> and the given child.

=cut

*/

nodeType *
IMCC_new_node(int nr, nodeType *child, YYLTYPE *loc)
{
    nodeType * n;
    if (nr == CONST_NODE) {
	return child;
    }
    n = new_node(loc);
    return ast_list[nr].create(nr, n, child);
}

/*

=item C<nodeType * IMCC_append_node(nodeType *a, nodeType *b, YYLTYPE *loc)>

Append node C<b> add the end of C<a> and return C<a>.

=cut

*/


nodeType *
IMCC_append_node(nodeType *a, nodeType *b, YYLTYPE *loc)
{
    nodeType *last = a;
    /*
     * TODO if we have long sequences of e.g. statement nodes
     *      a last pointer in the node structure could be ok
     */
    while (last->next)
	last = last->next;
    last->next = b;
    return a;
}

/*

=item C<IMCC_dump_nodes(nodeType *p)>

Dump nodes to C<stdout>

=cut

*/

void
IMCC_dump_nodes(nodeType *p)
{
    dump(p, 0);
    printf("\n");
}

void
IMCC_expand_nodes(Interp* interpreter, nodeType *p)
{
    p->expand(interpreter, p);
}
/*

=back

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

