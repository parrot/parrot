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
static void set_const(nodeType *p);
static nodeType* node_to_pmc(Interp*, Instruction **ins, nodeType *p);
static nodeType* exp_Binary(Interp*, nodeType *p);

static int show_context;

/*
 * for now, Undef morphs to wrong types that don't implement
 * all needed vtables
 */
#define UNDEF_TYPE "PerlUndef"
#define INT_TYPE "PerlInt"
#define FLOAT_TYPE "PerlNum"
#define STRING_TYPE "PerlString"

/*
 * constant node handling
 * constant nodes point to a SymReg holding the constant
 */
static void
dump_sym(nodeType *p)
{
    fprintf(stderr, "%s", p->u.var.r->name);
}

static void
dump_Const(nodeType *p, int l)
{
    dump_sym(p);
}

static nodeType*
exp_Const(Interp* interpreter, nodeType *p)
{
    if (p->ctx == CTX_PMC) {
        Instruction *ins = cur_unit->last_ins;
        return node_to_pmc(interpreter, &ins, p);
    }
    return p;
}


static void dump_context(nodeType *p)
{
    int c;
    fprintf(stderr, "\t[");

    switch (p->up_ctx) {
        case CTX_UNK: c = ' '; break;
        case CTX_INT: c = 'I'; break;
        case CTX_NUM: c = 'N'; break;
        case CTX_STR: c = 'S'; break;
        case CTX_PMC: c = 'P'; break;
        case CTX_KEY: c = 'k'; break;
        case CTX_BOOL: c = 'b'; break;
        case CTX_VOID: c = 'v'; break;
    }
    fprintf(stderr, "%c] [", c);
    switch (p->ctx) {
        case CTX_UNK: c = ' '; break;
        case CTX_INT: c = 'I'; break;
        case CTX_NUM: c = 'N'; break;
        case CTX_STR: c = 'S'; break;
        case CTX_PMC: c = 'P'; break;
        case CTX_KEY: c = 'k'; break;
        case CTX_BOOL: c = 'b'; break;
        case CTX_VOID: c = 'v'; break;
    }
    fprintf(stderr, "%c]", c);
}

static void
dump(nodeType *p, int l)
{
    nodeType *child;
    fprintf(stderr, "\n%*s", l*2, "");
    fprintf(stderr, "%s(", p->description);
    if (p->dump)
	p->dump(p, l);
    if (show_context)
        dump_context(p);
    if (p->flags & NODE_HAS_CHILD) {
	child = CHILD(p);
        dump(child, l + 1);
    }
    fprintf(stderr, ")");
    if (p->next )
	dump(p->next, l);
}

static nodeType *
check_nodes(Interp *interpreter, nodeType *p)
{
    /* TODO check node consistency */
    return p;
}
/*
 * node context handling
 */

/*
 * promote node context
 * up and down
 */
static context_type
ctx_default(nodeType *p, context_type outer)
{
    context_type inner;
    nodeType *child, *next;

    for (; p; p = p->next) {
        p->up_ctx = outer;
        if (p->context)
            inner = p->context(p, outer);
        else if (p->flags & NODE_HAS_CHILD) {
            child = CHILD(p);
            ctx_default(child, outer);
        }
        else
            inner = outer;
        p->ctx = inner;
    }
    return inner;
}

static context_type
ctx_Const(nodeType *p, context_type ctx)
{
    switch (p->u.var.r->set) {
        case 'I': ctx = CTX_INT; break;
        case 'S': ctx = CTX_STR; break;
        case 'N': ctx = CTX_NUM; break;
        case 'P': ctx = CTX_PMC; break;
    }
    return ctx;
}

static context_type
ctx_Var(nodeType *p, context_type ctx)
{
    return CTX_PMC;     /* Python - else check options */
}

static int
is_symmetric(char *op)
{
    /*
     * Python abuses add as concat and mul as repeat
     * so only arithmethic PMCs are symmetric
     */
    return 0;   /* if python */

    return strcmp(op, "add") == 0 ||
           strcmp(op, "mul") == 0
           ? 1 : 0;
}

static context_type
ctx_Binary(nodeType *p, context_type ctx)
{
    nodeType *op, *left, *right;
    context_type lc, rc;

    op = CHILD(p);
    left = op->next;
    right = left->next;

    lc = ctx_default(left, ctx);
    rc = ctx_default(right, ctx);
    /*
     * if both types are the same, we have to convert the left
     * to a PMC, *if* we are generating Python code, or more
     * generally, if overflow to BigInt should happen
     */
    if (lc == rc) {     /* && if overflow_to_bigint */
        p->ctx = CTX_PMC;
        left->ctx = CTX_PMC;
    }
    else {
        /*
         * some mixed types - convert both to PMCs for now
         * for Perl we could swap left and right, *if*
         * the operations is symmetric
         */
        p->ctx = left->ctx = right->ctx = CTX_PMC;
    }
    return p->ctx;
}

static context_type
ctx_Compare(nodeType *p, context_type ctx)
{
    nodeType *op, *left, *right;

    left = CHILD(p);
    op = left->next;

    /* we don't have general compare ops
     * XXX not a problem for Python but for statically typed languages
     * this produces really bad code
     *
     * TODO or not WRT "is" and "is not" and native types
     * we could cheat and emit "eq" for I and N, but that complicates
     * code generation. STRINGs maybe different anyway
     */
    left->ctx = ctx = CTX_PMC;
    for (; op; op = right->next) {
        right = op->next;
        right->ctx = CTX_PMC;
        /*
         * TODO bool is ok for If, *but* if e.g. Python prints this value
         * it has to be converted to a bool object
         *
         * The simple and ugly way is to create a new boolean PMC
         * assign this dest value and return it
         * Better would be to have True and False static
         * bool constants around
         */
        p->ctx = CTX_BOOL;
    }
    return p->ctx;
}

/*
 * node creation
 */
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
    p->context = ctx_Const;
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
 * get or create the SymReg
 */
static SymReg*
get_pasm_reg(char *name)
{
    SymReg *r;

    if ((r = _get_sym(cur_unit->hash, name)))
        return r;
    return mk_pasm_reg(str_dup(name));
}

static SymReg*
get_const(const char *name, int type)
{
    SymReg *r;

    if ((r = _get_sym(ghash, name)) && r->set == type)
        return r;
    return mk_const(str_dup(name), type);
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

    regs[0] = var->u.var.r;
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
    sprintf(name, "\"%s\"", var->u.var.r->name);
    r = mk_const(str_dup(name), 'S');

    regs[0] = var->u.var.r;
    var->u.var.r->type = VTIDENTIFIER;
    regs[1] = r;
    return insINS(interpreter, cur_unit, ins, "find_global", regs, 2);
}

static const char*
default_pmc_type(nodeType *p)
{
    const char *pmc;
    switch (p->u.var.r->set) {
        case 'I': pmc = INT_TYPE; break;
        case 'S': pmc = FLOAT_TYPE; break;
        case 'N': pmc = STRING_TYPE; break;
        default:  pmc = UNDEF_TYPE; break;
    }
    return pmc;
}
/*
 * promote a Const or Var to a PMC node, if it isn't yet a PMC
 */
static nodeType*
node_to_pmc(Interp* interpreter, Instruction **ins, nodeType *p)
{
    SymReg *regs[IMCC_MAX_REGS];
    const char *pmc;
    nodeType *temp;

    if (p->u.var.r->set == 'P')
        return p;
    pmc = default_pmc_type(p);
    temp = IMCC_new_temp_node(interpreter, 'P', &p->loc);
    *ins = insert_new(interpreter, temp, pmc);
    regs[0] = temp->u.var.r;
    regs[1] = p->u.var.r;
    *ins = insINS(interpreter, cur_unit, *ins, "set", regs, 2);
    return temp;
}
/*
 * node expand aka code creation functions
 */

static nodeType*
exp_Var(Interp* interpreter, nodeType *p)
{
    if (p->ctx == CTX_PMC) {
        Instruction *ins = cur_unit->last_ins;
        return node_to_pmc(interpreter, &ins, p);
    }
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
 * assign returns the lhs so that assigns can get chained together
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
    int assigned = 0;
    char buf[128];

    if (rhs->expand == exp_Binary) {
        /*
         * set the destination node, where the binary places
         * the result
         */
        rhs->dest = var;
        rhs = rhs->expand(interpreter, rhs);
        assigned = 1;
    }
    else if (rhs->expand == exp_Const) {
        const char *pmc;
        /* need a new value, because the name might be aliased by
         * a = b
         */
        ins = cur_unit->last_ins;
        pmc = default_pmc_type(var);
        ins = insert_new(interpreter, var, pmc);
    }
    else {
        rhs = rhs->expand(interpreter, rhs);
    }
    ins = cur_unit->last_ins;
    if (!assigned) {
        regs[0] = var->u.var.r;
        regs[1] = rhs->u.var.r;
        ins = insINS(interpreter, cur_unit, ins, "set", regs, 2);
        regs[0] = get_const("-1", 'I');
        sprintf(buf, "\"%s\"", var->u.var.r->name);
        regs[1] = get_const(buf, 'S');
        regs[2] = var->u.var.r;
        insINS(interpreter, cur_unit, ins, "store_lex", regs, 3);
    }
    return var;
}

/*
 * TODO
 */
static nodeType*
exp_Args(Interp* interpreter, nodeType *p)
{
    return NULL;
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
    char buf[128];

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
     * and append the binary operation
     */
    ins = cur_unit->last_ins;
    /*
     * p->dest holds the var, when the upper node is an assign opcode
     * if NULL, create a new temp
     */
    dest = p->dest;
    if (dest) {
        /*
         * find the lexical, this is the destination of the binary
         * operation
         */
        regs[0] = dest->u.var.r;
        regs[1] = get_const("-1", 'I');
        sprintf(buf, "\"%s\"", dest->u.var.r->name);
        regs[2] = get_const(buf, 'S');
        ins = insINS(interpreter, cur_unit, ins, "find_lex", regs, 3);
    }
    else {
        dest = IMCC_new_temp_node(interpreter, 'P', &p->loc);
        ins = insert_new(interpreter, dest, UNDEF_TYPE);
    }
    regs[0] = dest->u.var.r;
    regs[1] = left->u.var.r;
    regs[2] = right->u.var.r;
    insINS(interpreter, cur_unit, ins, op->u.var.r->name, regs, 3);
    return dest;
}

/*
 * left
 * Op  ... islt, isle, ... issame
 * right
 * [ Op
 *  right ... ]
 *
 * if a < b < c := a < b && b < c   but evaluate b once
 *
 */
static nodeType*
exp_Compare(Interp* interpreter, nodeType *p)
{
    nodeType *op, *left, *right, *dest, *last;
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];

    left = CHILD(p);
    op = left->next;
    last = right = op->next;
    /*
     * first create code for left and right
     */
    left = left->expand(interpreter, left);
    right = right->expand(interpreter, right);
    /*
     * then get the current instruction pointer
     * and append the binary operation
     */
    ins = cur_unit->last_ins;
    dest = IMCC_new_temp_node(interpreter, 'I', &p->loc);
    p->dest = dest;
    regs[0] = dest->u.var.r;
    regs[1] = left->u.var.r;
    regs[2] = right->u.var.r;
    insINS(interpreter, cur_unit, ins, op->u.var.r->name, regs, 3);
    if (last->next)
        fatal(1, "ext_Compare", "unimplemented");
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
    Instruction *ins;
    IMC_Unit *last_unit = cur_unit;
    SymReg *regs[IMCC_MAX_REGS];

    cur_unit = p->unit;

    name = CHILD(p);
    params = name->next;
    body = params->next;
    sub = mk_sub_address(str_dup(name->u.var.r->name));
    ins = INS_LABEL(cur_unit, sub, 1);

    ins->r[1] = mk_pcc_sub(str_dup(ins->r[0]->name), 0);
    add_namespace(interpreter, ins->r[1]);
    ins->r[1]->pcc_sub->pragma = P_PROTOTYPED ;

    regs[0] = get_const("-1", 'I');
    insINS(interpreter, cur_unit, ins, "new_pad", regs, 1);

    body->expand(interpreter, body);

    cur_unit = last_unit;
    return NULL; /* XXX return retval */
}

static SymReg*
gen_label(Interp *interpreter, const char *prefix)
{
    static int nr;
    char buf[128];

    sprintf(buf, "%s_%d", prefix, ++nr);
    return mk_local_label(cur_unit, str_dup(buf));
}

/*
 * If
 *   Tests      if foo
 *     test
 *     stmts
 *     ...      else if bar
 *   Else_      else
 */
static nodeType*
exp_If(Interp* interpreter, nodeType *p)
{
    nodeType *tests, *else_, *test, *stmts, *true_;
    SymReg *else_label, *endif_label;
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];

    tests = CHILD(p);
    else_ = tests->next;
    endif_label = gen_label(interpreter, "endif");
    for (test = CHILD(tests); test; test = stmts->next) {
        stmts = test->next;
        else_label = gen_label(interpreter, "else");
        /*
         * TODO if test == Compare create compare ops
         */
        true_ = test->expand(interpreter, test);
        ins = cur_unit->last_ins;
        regs[0] = true_->u.var.r;
        regs[1] = else_label;
        insINS(interpreter, cur_unit, ins, "unless", regs, 2);
        /*
         * statements of this test
         */
        stmts->expand(interpreter, stmts);
        /*
         * branch past all
         */
        ins = cur_unit->last_ins;
        regs[0] = endif_label;
        insINS(interpreter, cur_unit, ins, "branch", regs, 1);
        /*
         * insert label for next test
         */
        INS_LABEL(cur_unit, else_label, 1);
    }
    /* final else block if present */
    if (else_ && else_->expand)
        else_->expand(interpreter, else_);
    /* endif label */
    INS_LABEL(cur_unit, endif_label, 1);

    return NULL;
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
    IMCC_itcall_sub(interpreter, name->u.var.r);
    return NULL;
}

/*
 * Py_Local
 *   Name
 */
static nodeType*
exp_Py_Local(Interp* interpreter, nodeType *var)
{
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];
    char buf[128];

    if (var->u.var.r->type == VTADDRESS)
        ins = insert_find_global(interpreter, var);
    else
        ins = insert_new(interpreter, var, UNDEF_TYPE);
    /*
     * now create a scratchpad slot for this var
     */
    regs[0] = get_const("-1", 'I');
    sprintf(buf, "\"%s\"", var->u.var.r->name);
    regs[1] = get_const(buf, 'S');
    regs[2] = var->u.var.r;
    var->u.var.local_nr = cur_unit->local_count++;
    insINS(interpreter, cur_unit, ins, "store_lex", regs, 3);
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
    Instruction *ins;
    SymReg *regs[IMCC_MAX_REGS];

    if (!cur_unit)
        fatal(1, "exp_Py_Module", "no cur_unit");
    sub = mk_sub_address(str_dup("__main__"));
    ins = INS_LABEL(cur_unit, sub, 1);

    ins->r[1] = mk_pcc_sub(str_dup(ins->r[0]->name), 0);
    add_namespace(interpreter, ins->r[1]);
    ins->r[1]->pcc_sub->pragma = P_MAIN|P_PROTOTYPED ;
    regs[0] = get_const("0", 'I');
    insINS(interpreter, cur_unit, ins, "new_pad", regs, 1);
    /*
     * TODO create locals for __builtins__, __name__, __doc__
     */
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
            regs[0] = d->u.var.r;
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
    node_context_t  context;
} node_names;

/*
 * keep this list sorted
 * TODO create an include file from this list with node numbers
 */

static node_names ast_list[] = {
    { "-no-node-", 	NULL, NULL, NULL, NULL, NULL },
    { "Args", 	        create_1, exp_Args, NULL, NULL, NULL },
    { "AssName", 	create_Name, NULL, NULL, NULL, ctx_Var },
    { "Assign", 	create_1, exp_Assign, NULL, NULL, NULL },
    { "Binary", 	create_1, exp_Binary, NULL, NULL, ctx_Binary },
    { "Compare", 	create_1, exp_Compare, NULL, NULL, ctx_Compare },
    { "Const", 		NULL,     exp_Const, NULL, dump_Const, ctx_Const },
    { "Defaults", 	create_1, exp_Defaults, NULL, NULL, NULL },
    { "Function", 	create_Func, exp_Function, NULL, NULL, NULL },
    { "If", 	        create_1, exp_If, NULL, NULL, NULL },
    { "Line_no",        create_1,  NULL, NULL, NULL, NULL },
    { "Name",           create_Name, NULL, NULL, NULL, ctx_Var },
    { "Op",             create_Name, NULL, NULL, NULL, NULL },
    { "Params", 	create_1, exp_Params, NULL, NULL, NULL },
    { "Parrot_AST", 	create_1, exp_default, NULL, NULL, NULL },
    { "Py_Call", 	create_1, exp_Py_Call, NULL, NULL, NULL },
    { "Py_Local", 	create_Name, exp_Py_Local, NULL, NULL, NULL },
    { "Py_Module", 	create_1, exp_Py_Module, NULL, NULL, NULL },
    { "Py_Print" , 	create_1, exp_Py_Print, NULL, NULL, NULL },
    { "Py_Print_nl",	create_0, exp_Py_Print_nl, NULL, NULL, NULL },
    { "Src_File",    	create_1, NULL, NULL, NULL, NULL },
    { "Src_Line",    	create_1, NULL, NULL, NULL, NULL },
    { "Stmts",          create_1, exp_default, NULL, NULL, NULL },
    { "Tests",          create_1, NULL, NULL, NULL, NULL },
    { "Void",           create_1, exp_default, NULL, NULL, NULL },
    { "_",              create_0, NULL, NULL, NULL, NULL },
    { "_options",       create_1, NULL, NULL, NULL, NULL },
    { "version",        create_1, exp_default, NULL, NULL, NULL }

#define CONST_NODE 6
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
    self->context =ast_list[nr].context;
}

static void
set_const(nodeType *p)
{
    set_fptrs(p, CONST_NODE);
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
 * this sets the function symbol of the caller to VTADDRESS
 * which is used to create the find_global of the caller
 */
static nodeType*
create_Func(int nr, nodeType *self, nodeType *child)
{
    SymReg *r;
    IMC_Unit *last;
    self = create_1(nr, self, child);
    r = child->u.var.r;
    last = cur_unit->prev;      /* XXX  ->caller */
    r = _get_sym(last->hash, r->name);
    if (r) {
        /* mark the name being a subroutine name
         * s. Py_Local
         */
        r->type = VTADDRESS;
    }
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

=item C<int IMCC_find_node_nr(const char *name)>

Returns the index in C<ast_list> of the given node name or 0 if the node name
doesn't exist.

=cut

*/

int
IMCC_find_node_nr(const char *name)
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
    p->u.var.r = r;
    return p;
}

nodeType *
IMCC_new_var_node(Interp* interpreter, char *name, int set, YYLTYPE *loc)
{
    nodeType *p = new_node(loc);
    SymReg *r;
    if (!cur_unit)
        fatal(1, "IMCC_new_var_node", "no cur_unit");
    p->u.var.r = r = mk_symreg(name, set);
    if (r->type != VTADDRESS)
        r->type = VTIDENTIFIER;
    p->expand = exp_Var;
    p->description = "Var";
    p->dump   = dump_Var;
    p->context = ctx_Const;
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
    p->u.var.r = r;
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
IMCC_dump_nodes(Interp* interpreter, nodeType *p)
{
    if (interpreter->imc_info->debug & (DEBUG_AST << 1)) {
        show_context = 1;
    }
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
    ctx_default(p, CTX_VOID);
    if (interpreter->imc_info->debug & DEBUG_AST) {
        IMCC_dump_nodes(interpreter, p);
    }
    return p->expand(interpreter, p);
}

void
IMCC_free_nodes(Interp* interpreter, nodeType *p)
{
    nodeType *child, *next;
    for (; p; ) {
        if (p->flags & NODE_HAS_CHILD) {
            child = CHILD(p);
            IMCC_free_nodes(interpreter, child);
        }
        next = p->next;
        mem_sys_free(p);
        p = next;
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

