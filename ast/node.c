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
#ifdef AST_TEST
#define mem_sys_allocate_zeroed(x) calloc(1, x)
#define fatal(n, s, t, a) fprintf(stderr, t, a); exit(n)
#else
#include "../imcc/imc.h"
#endif

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
const_expand(nodeType *p)
{
    return p;
}

static void
set_const(nodeType *p)
{
    p->expand = const_expand;
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

static nodeType*
var_expand(nodeType *p)
{
    return p;
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
    { "Const", 		NULL, NULL, NULL, const_dump },
#define CONST_NODE 1
    { "Py_Module", 	create_1, NULL, NULL, NULL },
    { "Py_Print" , 	create_1, NULL, NULL, NULL },
    { "Py_Print_nl",	create_0, NULL, NULL, NULL },
    { "Src_File",    	create_1, NULL, NULL, NULL },
    { "Src_Line",    	create_1, NULL, NULL, NULL },
    { "Stmts",          create_1, NULL, NULL, NULL }
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

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

