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

static nodeType* create_0(int nr, nodeType *self, nodeType *p);
static nodeType* create_1(int nr, nodeType *self, nodeType *p);
static nodeType* create_Func(int nr, nodeType *self, nodeType *p);
static nodeType* create_Name(int nr, nodeType *self, nodeType *p);

/*
 * constant node handling
 * constant nodes point to a SymReg holding the constant
 */
static void
dump_sym(nodeType *p)
{
    fprintf(stderr, "%s", p->u.r->name);
}

static void
dump_Const(nodeType *p, int l)
{
    dump_sym(p);
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
    p->dump = dump_Const;
    p->description = "Const";
}


static void
dump(nodeType *p, int l)
{
    nodeType *child;
    fprintf(stderr, "\n%*s", l*2, "");
    fprintf(stderr, "%s(", p->description);
    if (p->dump)
	p->dump(p, l);
    else {
	child = CHILD(p);
	if (child)
	    dump(child, l + 1);
    }
    fprintf(stderr, ")");
    if (p->next )
	dump(p->next, l);
}

static nodeType *
check_nodes(Interp *interpreter, nodeType *p)
{
    return p;
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

/*
 * vars and temps
 */
static nodeType*
exp_Temp(Interp* interpreter, nodeType *p)
{
    return p;
}

static void
dump_Var(nodeType *p, int l)
{
    fprintf(stderr, ":");
    dump_sym(p);
}

static nodeType *
new_temp(YYLTYPE *loc)
{
    nodeType *p = new_node(loc);
    p->expand = exp_Temp;
    p->dump = dump_Var;
    p->description = "Temp";
    return p;
}

/*
 * instruction insert helper function
 */
static Instruction *
insINS(Parrot_Interp interpreter, IMC_Unit * unit, Instruction *ins,
        const char *name, SymReg **regs, int n)
{
    Instruction *tmp;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
    char *s = const_cast(name);
    tmp = INS(interpreter, unit, s, NULL, regs, n, 0, 0);
    insert_ins(unit, ins, tmp);
    return tmp;
}

/*
 * new var, pmc_type  := new P, Ic
 */
static Instruction *
insert_new(Interp* interpreter, nodeType *var, const char *pmy_type)
{
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS], *r;
    int type = pmc_type(interpreter, const_string(interpreter, pmy_type));
    char ireg[8];

    ins = cur_unit->last_ins;
    sprintf(ireg, "%d", type);
    r = mk_const(str_dup(ireg), 'I');

    regs[0] = var->u.r;
    regs[1] = r;
    return insINS(interpreter, cur_unit, ins, "new", regs, 2);
}

/*
 * var = global "var"   := find_global var, "var"
 */
static Instruction *
insert_find_global(Interp* interpreter, nodeType *var)
{
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS], *r;
    char name[128];

    ins = cur_unit->last_ins;
    sprintf(name, "\"%s\"", var->u.r->name);
    r = mk_const(str_dup(name), 'S');

    regs[0] = var->u.r;
    var->u.r->type = VTIDENTIFIER;
    regs[1] = r;
    return insINS(interpreter, cur_unit, ins, "find_global", regs, 2);
}

/*
 * node expand aka code creation functions
 */

static nodeType*
exp_Var(Interp* interpreter, nodeType *p)
{
    return p;
}


/*
 * create code by expanding child nodes
 */
static nodeType*
exp_default(Interp* interpreter, nodeType *p)
{
    nodeType *next;
    next = CHILD(p);
    for (; next; next = next->next) {
        if (next->expand)
            next->expand(interpreter, next);
    }
    return p;
}
/*
 * statement nodes don't have a result
 * expression nodes return the result node
 *
 * assign returns the rhs so that assignes can get chained together
 * [Python] assign is a statement with possibly multiple LHS
 *          ast2past.py has converted multiple LHS to chained
 *          assignment operations so that this matches a more "natural"
 *          behavior.
 */

/*
 * set var, rhs
 */
static nodeType*
exp_Assign(Interp* interpreter, nodeType *p)
{
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS], *r;
    nodeType *var = CHILD(p);
    nodeType *rhs = var->next;

    rhs = rhs->expand(interpreter, rhs);
    ins = cur_unit->last_ins;
    regs[0] = var->u.r;
    regs[1] = rhs->u.r;
    /*
     * TODO If lhs is aliased to another name, this changes both vars.
     *      Assign is wrong too, as "a = b" implies "(a is b) == True"
     */
    insINS(interpreter, cur_unit, ins, "set", regs, 2);
    return rhs;
}

/*
 * TODO
 */
static nodeType*
exp_Args(Interp* interpreter, nodeType *p)
{
    return NULL;
}

static int
is_symmetric(char *op)
{
    return strcmp(op, "add") == 0 ||
           strcmp(op, "mul") == 0
           ? 1 : 0;
}

static nodeType*
node_to_pmc(Interp* interpreter, Instruction **ins, nodeType *p)
{
    SymReg *regs[IMCC_MAX_REGS];
    nodeType *temp = IMCC_new_temp_node(interpreter, 'P', &p->loc);
    *ins = insert_new(interpreter, temp, "Undef");
    regs[0] = temp->u.r;
    regs[1] = p->u.r;
    *ins = insINS(interpreter, cur_unit, *ins, "set", regs, 2);
    return temp;
}

/*
 * Op
 * left
 * right
 *
 * Op(opocde) has the bare name of the Parrot opcode
 */
static nodeType*
exp_Binary(Interp* interpreter, nodeType *p)
{
    nodeType *op, *left, *right, *dest;
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];

    op = CHILD(p);
    left = op->next;
    right = left->next;
    /*
     * first create code for left and right
     */
    left = left->expand(interpreter, left);
    right = right->expand(interpreter, right);
    /*
     * then get the current instruction pointer
     * and append the binary
     */
    ins = cur_unit->last_ins;
    if (!p->dest) {
        int reg_set;
        /*
         * p->dest is currently unused - if the optimizer can figure out that
         * the destination can get assigned directly, C<dest> will
         * hold the destination of the binary
         *
         * else create a temp of the same type as the left operand
         */
        reg_set = left->u.r->set;
        /*
         * TODO if context handling is done expansion of
         *      the left and right node should do the right thing
         */
        if (right->u.r->set == 'P' && reg_set != 'P') {
            reg_set = 'P';
            /* when it's a symmetric opcode, swap left and right
             */
            if (is_symmetric(op->u.r->name)) {
                nodeType *temp = left;
                left = right;
                right = temp;
            }
            else {
                left = node_to_pmc(interpreter, &ins, left);
            }
        }
        dest = IMCC_new_temp_node(interpreter, reg_set, &p->loc);
        if (dest->u.r->set == 'P')
            ins = insert_new(interpreter, dest, "Undef");
    }
    p->dest = dest;
    regs[0] = dest->u.r;
    regs[1] = left->u.r;
    regs[2] = right->u.r;
    insINS(interpreter, cur_unit, ins, op->u.r->name, regs, 3);
    return dest;
}

/*
 * TODO
 */
static nodeType*
exp_Defaults(Interp* interpreter, nodeType *p)
{
    return NULL;
}

/*
 * Function
 *   Name
 *   Params
 *     Name
 *     ...
 *     Defaults
 *       ...
 *     py_var_args
 *     py_kw_args
 *   Body
 */
static nodeType*
exp_Function(Interp* interpreter, nodeType *p)
{
    nodeType *name, *params, *body;
    SymReg *sub;
    Instruction *i;
    IMC_Unit *last_unit = cur_unit;

    cur_unit = p->unit;

    name = CHILD(p);
    params = name->next;
    body = params->next;
    sub = mk_sub_address(str_dup(name->u.r->name));
    i = INS_LABEL(cur_unit, sub, 1);

    i->r[1] = mk_pcc_sub(str_dup(i->r[0]->name), 0);
    add_namespace(interpreter, i->r[1]);
    i->r[1]->pcc_sub->pragma = P_PROTOTYPED ;

    body->expand(interpreter, body);

    cur_unit = last_unit;
    return NULL; /* XXX return retval */
}

/*
 * TODO
 */
static nodeType*
exp_Params(Interp* interpreter, nodeType *p)
{
    return NULL;
}

/*
 * Py_Call
 *   function
 *   Args
 *     ...
 *   Star_Args
 *   DStar_Args
 */
static nodeType*
exp_Py_Call(Interp* interpreter, nodeType *p)
{
    nodeType *name, *args;
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];

    name = CHILD(p);
    args = name->next;
    args = args->expand(interpreter, args);
    /* TODO */
    ins = IMCC_create_itcall_label(interpreter);
    IMCC_itcall_sub(interpreter, name->u.r);
    return NULL;
}

/*
 * Py_Local
 *   Name
 */
static nodeType*
exp_Py_Local(Interp* interpreter, nodeType *var)
{
    if (var->u.r->type == VTADDRESS)
        insert_find_global(interpreter, var);
    else
        insert_new(interpreter, var, "Undef");
    return NULL;
}

/*
 * this is the main init code
 * Py_Module
 *   Py_doc,
 *   Py_local,
 *   ...
 *   Stmts
 */
static nodeType*
exp_Py_Module(Interp* interpreter, nodeType *p)
{
    nodeType *doc;
    SymReg *sub;
    Instruction *i;
    if (!cur_unit)
        fatal(1, "exp_Py_Module", "no cur_unit");
    sub = mk_sub_address(str_dup("__main__"));
    i = INS_LABEL(cur_unit, sub, 1);

    i->r[1] = mk_pcc_sub(str_dup(i->r[0]->name), 0);
    add_namespace(interpreter, i->r[1]);
    i->r[1]->pcc_sub->pragma = P_MAIN|P_PROTOTYPED ;
    return exp_default(interpreter, p);
}

/*
 * Py_Print
 *    exp
 *    ...
 */
static nodeType*
exp_Py_Print(Interp* interpreter, nodeType *p)
{
    Instruction *ins ;
    SymReg *regs[IMCC_MAX_REGS];
    nodeType * child = CHILD(p), *d;
    if (!child)
        fatal(1, "exp_Py_Print", "nothing to print");
    for (; child; child = child->next) {
        d = child->expand(interpreter, child);
        /* TODO file handle node */
        if (d->dump == dump_Const || d->dump == dump_Var)
            regs[0] = d->u.r;
        else
            fatal(1, "exp_Py_Print", "unknown node to print: '%s'",
                    d->description);
        ins = cur_unit->last_ins;
        insINS(interpreter, cur_unit, ins, "print_item", regs, 1);
    }
    return NULL;
}

/*
 * Py_Print_nl
 */
static nodeType*
exp_Py_Print_nl(Interp* interpreter, nodeType *p)
{
    Instruction *ins = cur_unit->last_ins;
    SymReg *regs[IMCC_MAX_REGS];
    insINS(interpreter, cur_unit, ins, "print_newline", regs, 0);
    return NULL;
}


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
    { "Args", 	        create_1, exp_Args, NULL, NULL },
    { "AssName", 	create_Name, NULL, NULL, NULL },
    { "Assign", 	create_1, exp_Assign, NULL, NULL },
    { "Binary", 	create_1, exp_Binary, NULL, NULL },
    { "Const", 		NULL,     exp_Const, NULL, dump_Const },
    { "Defaults", 	create_1, exp_Defaults, NULL, NULL },
    { "Function", 	create_Func, exp_Function, NULL, NULL },
    { "Line_no",        create_1,  NULL, NULL, NULL },
    { "Name",           create_Name, NULL, NULL, NULL },
    { "Op",             create_Name, NULL, NULL, NULL },
    { "Params", 	create_1, exp_Params, NULL, NULL },
    { "Parrot_AST", 	create_1, exp_default, NULL, NULL },
    { "Py_Call", 	create_1, exp_Py_Call, NULL, NULL },
    { "Py_Local", 	create_Name, exp_Py_Local, NULL, NULL },
    { "Py_Module", 	create_1, exp_Py_Module, NULL, NULL },
    { "Py_Print" , 	create_1, exp_Py_Print, NULL, NULL },
    { "Py_Print_nl",	create_0, exp_Py_Print_nl, NULL, NULL },
    { "Src_File",    	create_1, NULL, NULL, NULL },
    { "Src_Line",    	create_1, NULL, NULL, NULL },
    { "Stmts",          create_1, exp_default, NULL, NULL },
    { "Void",           create_1, exp_default, NULL, NULL },
    { "_",              create_0, NULL, NULL, NULL },
    { "_options",       create_1, NULL, NULL, NULL },
    { "version",        create_1, exp_default, NULL, NULL }

#define CONST_NODE 5
};

/*
 * compare to entries pointing into ast_list
 */
static int
ast_comp(const void *a, const void *b)
{
    const node_names *pa = (const node_names *) a;
    const node_names *pb = (const node_names *) b;
    return strcmp(pa->name, pb->name);
}

/*
 * set function pointers for ast entry nr
 */
static void
set_fptrs(nodeType *self, int nr)
{
    self->description = ast_list[nr].name;
    self->expand = ast_list[nr].expand;
    self->opt    = ast_list[nr].opt;
    self->dump   = ast_list[nr].dump;
}

/*
 * init a node w/o child
 */
static nodeType*
create_0(int nr, nodeType *self, nodeType *child)
{
    set_fptrs(self, nr);
    return self;
}

/*
 * init a node with child
 */
static nodeType*
create_1(int nr, nodeType *self, nodeType *child)
{
    if (child) {
        child->parent= self;
        CHILD(self) = child;
        self->flags |= NODE_HAS_CHILD;
    }
    set_fptrs(self, nr);
    return self;
}

/*
 * make a function node
 * this sets the function symbol of the calle to VTADDRESS
 * which is used to create the find_global of the caller
 */
static nodeType*
create_Func(int nr, nodeType *self, nodeType *child)
{
    SymReg *r;
    IMC_Unit *last;
    self = create_1(nr, self, child);
    r = child->u.r;
    last = cur_unit->prev;      /* XXX  ->caller */
    r = _get_sym(last->hash, r->name);
    /* mark the name being a subroutine name
     * s. Py_Local
     */
    r->type = VTADDRESS;
    return self;
}

/*
 * don't need Name(Var(foo))
 * so copy things over and return just one node, free the other
 */
static nodeType*
create_Name(int nr, nodeType *self, nodeType *child)
{
    child->description = ast_list[nr].name;
    child->expand = ast_list[nr].expand;
    if (!child->expand)
        child->expand = exp_Var;
    mem_sys_free(self);
    return child;
}
/*
 * API
 */

/*

=item C<int IMCC_find_node_type(const char *name)>

Returns the index in C<ast_list> of the given node name or 0 if the node name
doesn't exist.

=cut

*/

int
IMCC_find_node_type(const char *name)
{
    node_names search, *r;

    search.name = name;
    r = bsearch(&search, ast_list, sizeof(ast_list) / sizeof(ast_list[0]),
		sizeof(ast_list[0]), ast_comp);

#if 0
    printf("find: '%s' - %d\n", name, r ? r - ast_list : 0);
#endif
    if (!r) {
	return 0;
    }
    return r - ast_list;
}

/*

=item C<nodeType *IMCC_new_const_node(Interp*, char *name, int set,
YYLTYPE *loc)>

Create a new Const node for the given constant C<name> and Parrot register
set C<set>. Set may be:

  'I' ... Integer
  'N' ... Number
  'S' ... String
  'U' ... String treated as unicode string
  'P' ... PMCs (PMC constants aren't finished)
  'o' ... opcode name

=item C<nodeType *IMCC_new_var_node(Interp*, char *name, int set,
YYLTYPE *loc)>

Create a new variable node.

=item C<nodeType *IMCC_new_temp_node(Interp*, int set, YYLTYPE *loc)>

Create a new temporary node.

=cut

*/

nodeType *
IMCC_new_const_node(Interp* interp, char *name, int set, YYLTYPE *loc)
{
    nodeType *p = new_con(loc);
    SymReg *r = mk_const(name, set);
    p->u.r = r;
    return p;
}

nodeType *
IMCC_new_var_node(Interp* interpreter, char *name, int set, YYLTYPE *loc)
{
    nodeType *p = new_node(loc);
    SymReg *r;
    if (!cur_unit)
        fatal(1, "IMCC_new_var_node", "no cur_unit");
    p->u.r = r = mk_symreg(name, set);
    if (r->type != VTADDRESS)
        r->type = VTIDENTIFIER;
    p->expand = exp_Var;
    p->description = "Var";
    p->dump   = dump_Var;
    return p;
}

nodeType *
IMCC_new_temp_node(Interp* interp, int set, YYLTYPE *loc)
{
    nodeType *p = new_temp(loc);
    SymReg *r;
    char buf[128];
    static int temp;
    sprintf(buf, "$%c%d", set, ++temp);
    r = mk_symreg(str_dup(buf), set);
    p->u.r = r;
    return p;
}

/*

=item C<nodeType *IMCC_new_node(Interp*, int nr, nodeType *child, YYLTYPE *loc)>

Create a new node with node type number C<nr> and the given child.

=cut

*/

nodeType *
IMCC_new_node(Interp* interp, int nr, nodeType *child, YYLTYPE *loc)
{
    nodeType * n;
    if (nr == CONST_NODE) {
	return child;
    }
    n = new_node(loc);
    return ast_list[nr].create(nr, n, child);
}

/*

=item C<nodeType *
IMCC_append_node(Interp *, nodeType *a, nodeType *b, YYLTYPE *loc)>

Append node C<b> add the end of C<a> and return C<a>.

=cut

*/


nodeType *
IMCC_append_node(Interp *interpreter, nodeType *a, nodeType *b, YYLTYPE *loc)
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

=item C<void IMCC_expand_nodes(Interp* interpreter, nodeType *p)>

Create code for the passed node. The code is appended to the current
unit's instructions.

=item C<void IMCC_free_nodes(Interp* interpreter, nodeType *p)>

Free the nodes.

=cut

*/

void
IMCC_dump_nodes(nodeType *p)
{
    dump(p, 0);
    fprintf(stderr, "\n");
}

nodeType *
IMCC_expand_nodes(Interp* interpreter, nodeType *p)
{
    /*
     * TODO remove Src_Line, Src_File, Line_no
     *      and convert this info to meta info for the node
     */
    p = check_nodes(interpreter, p);
    return p->expand(interpreter, p);
}

void
IMCC_free_nodes(Interp* interpreter, nodeType *p)
{
    nodeType *child, *next;
    for (next = p; next; ) {
        if (p->flags & NODE_HAS_CHILD) {
            child = CHILD(p);
            IMCC_free_nodes(interpreter, child);
        }
        next = p->next;
        mem_sys_free(p);
    }
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

