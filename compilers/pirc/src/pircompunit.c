/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
 */

/*

=head1 DESCRIPTION

This file contains functions to build the abstract syntax tree from
the PIR input as parsed by the parser implemented in F<pir.y>.

All data types that represent the AST nodes (C<expression>, C<target>,
C<constant>, C<argument>) are circular linked lists, where the C<root>
pointer (that is the pointer through which any list is accessible)
points to the I<last> item. Being circular linked, this means that to
get to the I<first> item on the list, you select C<<node->next>>.

Due to this organization, adding an element to a list can be done in
O(c) (constant) time.

=cut

*/

#include "pircompunit.h"
#include "pircompiler.h"
#include "pirsymbol.h"
#include "piryy.h"
#include "pirdefines.h"
#include "pirpcc.h"
#include "pirerr.h"
#include "pirop.h"
#include "bcgen.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <assert.h>

#include "parrot/oplib/ops.h"
#include "parrot/string_funcs.h"
#include "parrot/dynext.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_self_parameter(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant * create_const(
    ARGIN(lexer_state * const lexer),
    value_type type,
    va_list arg_ptr)
        __attribute__nonnull__(1);

static void fixup_local_labels(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static expression * new_expr(
    ARGIN(lexer_state * const lexer),
    expr_type type)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static instruction * new_instruction(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const opname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static invocation * new_invocation(ARGIN(lexer_state * const lexer))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static key_entry * new_key_entry(
    ARGIN(lexer_state * const lexer),
    ARGIN(expression * const expr))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static label * new_label(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const labelid),
    int offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void new_statement(
    ARGIN(lexer_state * const lexer),
    ARGIN(char const * const opname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_add_self_parameter __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_create_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_fixup_local_labels __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_expr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_instruction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname))
#define ASSERT_ARGS_new_invocation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_new_key_entry __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(expr))
#define ASSERT_ARGS_new_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(labelid))
#define ASSERT_ARGS_new_statement __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

static unsigned const prime_numbers[] = {113 /* XXX think of more primes */ };

/*

=head1 FUNCTIONS

=over 4

=item C<void reset_register_allocator(lexer_state * const lexer)>

Reset the register numbers for all types. After this
function has been invoked, the next request for a new
(PASM) register will start at register 0 again (for all
types).

=cut

*/
void
reset_register_allocator(ARGIN(lexer_state * const lexer))
{
    /* set register allocator to 0 for all register types. */
    int i;
    for (i = 0; i < NUM_PARROT_TYPES; ++i)
        lexer->curregister[i] = 0;
}


/*

=item C<void set_namespace(lexer_state * const lexer, key * const ns)>

Set the current namespace in the lexer state, so that it is
available when needed, i.e. when a new subroutine node is
created.

=cut

*/
void
set_namespace(ARGIN(lexer_state * const lexer), key * const ns)
{
    lexer->current_ns = ns;
}

/*

=item C<void set_sub_outer(lexer_state * const lexer, char const * const
outersub)>

Set the lexically enclosing sub for the current sub.
Thus, set the :outer() argument to the current subroutine.

=cut

*/
void
set_sub_outer(ARGIN(lexer_state * const lexer), char const * const outersub)
{
    CURRENT_SUB(lexer)->info.outersub = outersub;
    SET_FLAG(lexer->subs->flags, PIRC_SUB_FLAG_HAS_OUTER);
}



/*

=item C<void
set_sub_multi_type(ARGIN(lexer_state * const lexer), expression * const multitype)>

Add the multi-method signature type in C<multitype> to the current subroutine.

=cut

*/
void
set_sub_multi_types(ARGIN(lexer_state * const lexer), expression * const multitype)
{
    /* info.num_types is 1 higher than the actual number of types;
     * n=1 means :multi() without any types; therefore, subtract 1 for actual number.
     */
    unsigned num_types = CURRENT_SUB(lexer)->info.num_multi_types - 1;

    /* create an array of sufficient size, in which the multi type info is copied */
    CURRENT_SUB(lexer)->info.multi_types
                          = (multi_type *)pir_mem_allocate(lexer, num_types * sizeof (multi_type));


    /* add types from end to beginning, as the list is in reversed order. */
    while (num_types-- > 0) {
        /* get a pointer to the multi_type in the current index, for easy reference */
        multi_type *mtype = &CURRENT_SUB(lexer)->info.multi_types[num_types];

        switch (multitype->type) {
            case EXPR_CONSTANT:
                mtype->entry.ident = multitype->expr.c->val.sval;
                mtype->entry_type  = MULTI_TYPE_IDENT;
                break;
            case EXPR_IDENT:
                mtype->entry.ident = multitype->expr.id;
                mtype->entry_type  = MULTI_TYPE_IDENT;
                break;
            case EXPR_KEY:
                mtype->entry.key  = multitype->expr.k;
                mtype->entry_type = MULTI_TYPE_KEYED;
                break;
            default:
                break;
        }

    }

}

/*

=item C<static void add_self_parameter(lexer_state * const lexer)>

Add a parameter named C<"self"> to the current subroutine, but only
if both :vtable and :method flags have I<not> been set yet. If either
of these flags has been set, then that means "self" was already added.

=cut

*/
static void
add_self_parameter(ARGIN(lexer_state * const lexer))
{
    /* only add "self" parameter if :vtable and :method flags have not been set yet */
    if (!TEST_FLAG(CURRENT_SUB(lexer)->flags, (PIRC_SUB_FLAG_VTABLE | PIRC_SUB_FLAG_METHOD))) {

        add_param(lexer, PMC_TYPE, "self");
    }
}

/*

=item C<void set_sub_vtable(lexer_state * const lexer, char const * vtablename)>

Set the :vtable() flag argument to the current subroutine. If C<vtablename>
is NULL, the name of the current sub is taken to be the vtable method name.
If the vtable method name (either specified or the current sub's name) is
in fact not a vtable method, an error message is emitted.

=cut

*/
void
set_sub_vtable(ARGIN(lexer_state * const lexer), char const * vtablename)
{
    int vtable_index;

    if (vtablename == NULL)  /* the sub's name I<is> the vtablename */
        vtablename = CURRENT_SUB(lexer)->info.subname;

    /* get the index number of this vtable method */
    vtable_index = Parrot_get_vtable_index(lexer->interp,
                                           Parrot_str_new(lexer->interp, vtablename,
                                                               strlen(vtablename)));

    /* now check whether the method name actually a vtable method */
    if (vtable_index == -1)
        yypirerror(lexer->yyscanner, lexer,
                   "'%s' is not a vtable method but was used with :vtable flag", vtablename);

    else {
        /* test for duplicate :vtable on a sub */
        if (CURRENT_SUB(lexer)->info.vtable_index != -1)
            yypirerror(lexer->yyscanner, lexer, ":vtable flag was already set on sub");
        else
            CURRENT_SUB(lexer)->info.vtable_index = vtable_index;

        add_self_parameter(lexer);

        /* always set the :vtable flag, even if :method was already set.
         * XXX emit a warning or something? Is :vtable + :method still useful?
         */
        SET_FLAG(CURRENT_SUB(lexer)->flags, PIRC_SUB_FLAG_VTABLE);
    }
}

/*

=item C<void set_sub_subid(lexer_state * const lexer, char const * const subid)>

Set the name specified in the :subid flag on the sub.

=cut

*/
void
set_sub_subid(ARGIN(lexer_state * const lexer), char const * const subid)
{
    CURRENT_SUB(lexer)->info.subid = subid;
    SET_FLAG(lexer->subs->flags, PIRC_SUB_FLAG_SUBID);
}

/*

=item C<void set_sub_methodname(lexer_state * const lexer, char const * const
methodname)>

Set the :method flag on a sub; if C<methodname> is not NULL, then it contains
the name by which the sub is stored as a method.

=cut

*/
void
set_sub_methodname(ARGIN(lexer_state * const lexer), char const * const methodname)
{
    if (methodname) /* :method("foo") */
        CURRENT_SUB(lexer)->methodname = methodname;
    else /* :method without a value defaults to the subname. */
        CURRENT_SUB(lexer)->methodname = CURRENT_SUB(lexer)->info.subname;

    CURRENT_SUB(lexer)->info.methodname = CURRENT_SUB(lexer)->methodname;

    /* :methods have an automatic "self" parameter */
    add_self_parameter(lexer);

    SET_FLAG(lexer->subs->flags, PIRC_SUB_FLAG_METHOD);
}

/*

=item C<void set_sub_instanceof(lexer_state * const lexer, char const * const
classname)>

Set the value of the C<:instanceof> flag on a sub. Note that this flag
is experimental, and not actually used at this point.

=cut

*/
void
set_sub_instanceof(ARGIN(lexer_state * const lexer), char const * const classname)
{
    CURRENT_SUB(lexer)->info.instanceof = classname;
}

/*

=item C<void set_sub_nsentry(lexer_state * const lexer, char const * const
nsentry)>

Set the value of the C<:nsentry> flag on a sub. The value of C<nsentry> is the name
by which the sub is stored in the namespace.

=cut

*/
void
set_sub_nsentry(ARGIN(lexer_state * const lexer), char const * const nsentry)
{
    CURRENT_SUB(lexer)->info.nsentry = nsentry;
}

/*

=item C<void set_sub_flag(lexer_state * const lexer, sub_flag flag)>

Set a subroutine flag on the current sub. The C<flag> parameter may encode
multiple flags.

=cut

*/
void
set_sub_flag(ARGIN(lexer_state * const lexer), sub_flag flag)
{
    /* set the specified flag in the current subroutine */
    SET_FLAG(CURRENT_SUB(lexer)->flags, flag);

}

/*

=item C<void new_subr(lexer_state * const lexer, STRING *subname)>

Create a new subroutine node, and set it as the "current"
subroutine, on which all other sub-related operations do
their thing.

=cut

*/
void
new_subr(ARGIN(lexer_state * const lexer), STRING *subname)
{
    subroutine *newsub       = pir_mem_allocate_zeroed_typed(lexer, subroutine);
    int         index;

    /* set the sub fields */
    newsub->info.subname1    = subname;
    newsub->info.subname     = Parrot_str_to_cstring(lexer->interp, subname);
    /* set default lexid */
    newsub->info.subid1      = subname;
    newsub->info.subid       = Parrot_str_to_cstring(lexer->interp, subname);
    /* take namespace of this sub of the lexer, which keeps track of that */
    newsub->name_space       = lexer->current_ns;

    newsub->parameters       = NULL;
    newsub->statements       = NULL;
    newsub->flags            = 0;
    newsub->info.startoffset = lexer->codesize; /* start offset in bytecode */



    /* initialize hashtables for .local and label identifiers */
    init_hashtable(lexer, &newsub->symbols, HASHTABLE_SIZE_INIT);
    init_hashtable(lexer, &newsub->labels, HASHTABLE_SIZE_INIT);

    for (index = 0; index < NUM_PARROT_TYPES; ++index) {
        newsub->registers[index]      = NULL; /* set all "register" tables to NULL */
        newsub->info.regs_used[index] = 0;    /* set all register counts to 0 */
    }

    /* link the new sub node into the list of subroutines */
    if (CURRENT_SUB(lexer) == NULL) { /* no subroutine yet, this is the first one */
        newsub->next = newsub; /* set next field to itself, making the list circular linked */
    }
    else { /* there is at least 1 other subroutine */
        /* lexer->subs points to "end of list", to the last added one */
        newsub->next = CURRENT_SUB(lexer)->next; /* set newsub's next to the
                                                    first item in the list */
        CURRENT_SUB(lexer)->next = newsub;    /* set current sub's next to the new sub. */
    }
    CURRENT_SUB(lexer) = newsub;

    /* store the subroutine identifier as a global label */
    store_global_label(lexer, Parrot_str_to_cstring(lexer->interp, subname));

    /* vanilla register allocator is reset for each sub */
    reset_register_allocator(lexer);

}

/*

=item C<void set_sub_name(lexer_state * const lexer, char const * const
subname)>

Set the current subroutine's name to C<subname>.

=cut

*/
void
set_sub_name(ARGIN(lexer_state * const lexer), char const * const subname)
{
    CURRENT_SUB(lexer)->info.subname = subname;
}


/*

=item C<static instruction * new_instruction(lexer_state * const lexer, char
const * const opname)>

Create a new instruction node and set C<opname> as the instruction.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static instruction *
new_instruction(ARGIN(lexer_state * const lexer),
        ARGIN(char const * const opname))
{
    instruction *ins = pir_mem_allocate_zeroed_typed(lexer, instruction);
    ins->opname      = opname;
    ins->opcode      = -1; /* make sure this field is properly initialized;
                              it must be >= 0 before being used */
    return ins;
}


/*

=item C<static void new_statement(lexer_state * const lexer, char const * const
opname)>

Constructor for a statement. The newly allocated statement will be inserted
into the current subroutine's statements list.

=cut

*/
static void
new_statement(ARGIN(lexer_state * const lexer),
        ARGIN(char const * const opname))
{
    instruction *instr = new_instruction(lexer, opname);

    /* Each instruction has a sequence number to be able to
     * calculate offsets for label branches.
     */

    /* the codesize so far will be the offset of this instruction. */
    instr->offset = lexer->codesize;

    /* set the PIR source line number */
    /* XXX yypirget_lineno returns the wrong line no :-( FIX! */
    instr->sourceline = yypirget_lineno(lexer->yyscanner);

/*
    fprintf(stderr, "[%4d][%s]\n", instr->sourceline, opname);
*/
    /*
    fprintf(stderr, "offset of %s is: %d\n", opname, instr->offset);
    */

    if (CURRENT_INSTRUCTION(lexer) == NULL)
        instr->next = instr;
    else {
        instr->next = CURRENT_INSTRUCTION(lexer)->next;
        CURRENT_INSTRUCTION(lexer)->next = instr;
    }
    CURRENT_INSTRUCTION(lexer) = instr;
}

/*

=item C<target * set_curtarget(lexer_state * const lexer, target * const t)>

Sets the target C<t> as the current target in C<lexer> to
make it accessible to other parse actions. C<t> is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target *
set_curtarget(ARGIN(lexer_state * const lexer), target * const t)
{
    lexer->curtarget = t;
    return t;
}

/*

=item C<argument * set_curarg(lexer_state * const lexer, argument * const arg)>

Sets the argument C<arg> as the current argument in C<lexer>
to make it accessible to other parse actions. C<arg> is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
set_curarg(ARGIN(lexer_state * const lexer), argument * const arg)
{
    lexer->curarg = arg;
    return arg;
}

/*

=item C<int targets_equal(target const * const left, target const * const
right)>

Returns true if C<left> equals C<right>, false otherwise. C<left> is
considered to be equal to C<right> if any of the following conditions
is true:

=over 4

=item * C<left> has a name, C<right> has a name, and these names are equal;

=item * C<left>'s type equals C<right>'s type, I<and> C<left>'s (PIR) register number
equals C<right>'s (PIR) register number, I<and> C<left>'s (PASM) register number
equals C<right>'s (PASM) register number.

=back

=cut

*/
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
int
targets_equal(target const * const left, target const * const right)
{


    if (TEST_FLAG(left->flags, TARGET_FLAG_IS_REG)) {      /* if left is a reg */
        if (TEST_FLAG(right->flags, TARGET_FLAG_IS_REG)) { /* then right must be a reg */
            if ((left->info->type  == right->info->type)       /* types must match */
            &&  (left->info->id.regno == right->info->id.regno /* PIR regno must match */
            &&  (left->info->color == right->info->color))) {   /* PASM regno must match */
                assert(left->info == right->info);
                return TRUE;
            }
        }
        else /* left is a reg, right is not */
            return FALSE;

    }
    else { /* left is not a reg */

        if (!TEST_FLAG(right->flags, TARGET_FLAG_IS_REG)  /* right must not be a reg */
        && (left->info->id.name && right->info->id.name       /* both must have a name */
        && STREQ(left->info->id.name, right->info->id.name))) { /* and they must be equal */
            assert(left->info == right->info);
            return TRUE;
        }
    }

    return FALSE;
}

/*

=item C<target * new_target(lexer_state * const lexer)>

Create a new target node. The node's next pointer is initialized to itself.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target *
new_target(ARGIN(lexer_state * const lexer))
{
    target *t       = pir_mem_allocate_zeroed_typed(lexer, target);
    t->key          = NULL;
    t->next         = t; /* circly linked list */
    return t;
}

/*
=item C<void set_target_key(target * const t, key * const k)>

Set the key C<k> on target C<t>. For instance:

 $P0[$P1]

[$P1] is the key of $P0.

=cut

*/
void
set_target_key(target * const t, key * const k)
{
    t->key = k;
}

/*

=item C<target * target_from_symbol(lexer_state * const lexer, symbol * const
sym)>

Convert symbol C<sym> into a target node. The resulting target has
a pointer to C<sym>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target *
target_from_symbol(ARGIN(lexer_state * const lexer), symbol * const sym)
{
    target *t  = new_target(lexer);

    t->flags   = sym->flags; /* copy the flags */
    t->info    = &sym->info;

    return t;
}

/*

=item C<target * add_target(lexer_state * const lexer, target *last, target *
const t)>

Add a new target to the list pointed to by C<list>. C<list> points to
the last element, C<<last->next>> points to the first. The list is
circular linked. The newly added target C<t> is returned, which is also
the "root" pointer of the list (pointing to the last element, through
its "next" pointer you get the first item in the list.)

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target *
add_target(ARGIN(lexer_state * const lexer), target *last, target * const t)
{
    PARROT_ASSERT(last);
    PARROT_ASSERT(t);

    t->next    = last->next; /* points to first */
    last->next = t;
    last       = t;

    return t;
}


/*

=item C<target * add_param(lexer_state * const lexer, pir_type type, char const
* const name)>

Add a parameter of type C<type> and named C<name> to the current
subroutine. The parameter will be declared as a local symbol in the
current subroutine, and a new register is allocated for it.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target *
add_param(ARGIN(lexer_state * const lexer), pir_type type, char const * const name)
{
    target *targ = new_target(lexer);
    symbol *sym  = new_symbol(lexer, name, type);

    PARROT_ASSERT(CURRENT_SUB(lexer));

    /* if this is the first parameter (current sub's parameters list is NULL),
     * set this parameter as the first. Otherwise add it to the list through
     * add_target(), which returns an updated pointer to the list (which is
     * a pointer to the *last* object, whose "next" pointer is the first item.
     */
    if (CURRENT_SUB(lexer)->parameters == NULL)
        CURRENT_SUB(lexer)->parameters = targ;
    else
        CURRENT_SUB(lexer)->parameters = add_target(lexer, CURRENT_SUB(lexer)->parameters, targ);

    /* set the parameter just added as curtarget */
    lexer->curtarget = targ;

    /* parameters are just special .locals; enter them into the symbol table */
    declare_local(lexer, type, sym);
    /* parameters must always get a PASM register, even if they're not
     * "used"; in the generated PASM instructions, they're always used
     * (to store the incoming values).
     */
    assign_vanilla_register(lexer, sym);

    /* set a pointer from the target to the symbol info object */
    targ->info = &sym->info;

    return targ;
}

/*

=item C<target * set_param_alias(lexer_state * const lexer, char const * const
alias)>

Set the argument of the :named flag for the current target
(parameter). Returns the current target (parameter). This function assumes
that lexer->curtarget points to the target (parameter) node on which
this alias (and the :named flag) is set.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target *
set_param_alias(ARGIN(lexer_state * const lexer), char const * const alias)
{
    PARROT_ASSERT(lexer->curtarget != NULL);

    /* if no alias was specified, default to the target's name, if it's not a register. */
    if (alias == NULL) {
        if (!TEST_FLAG(lexer->curtarget->flags, TARGET_FLAG_IS_REG))
            lexer->curtarget->alias = lexer->curtarget->info->id.name;
    }
    else
        lexer->curtarget->alias = alias;

    SET_FLAG(lexer->curtarget->flags, TARGET_FLAG_NAMED);
    return lexer->curtarget;
}




/*

=item C<target * set_param_flag(lexer_state * const lexer, target * const param,
target_flag flag)>

Set the flag C<flag> on parameter C<param>. The actual value
of C<flag> may encode several flags at a time. Returns C<param>.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
target *
set_param_flag(ARGIN(lexer_state * const lexer), target * const param, target_flag flag)
{
    SET_FLAG(param->flags, flag);

    /* note that param is always an identifier; registers are not allowed as parameters.
     * Therefore it's safe to reference param->s.sym, without checking for not
     * being a register.
     */

    /* :slurpy can only be set on a PMC parameter */
    if (TEST_FLAG(flag, TARGET_FLAG_SLURPY) && param->info->type != PMC_TYPE)
        yypirerror(lexer->yyscanner, lexer,
                   "cannot set :slurpy flag on non-pmc parameter '%s'", param->info->id.name);

    /* :opt_flag can only be set on a int parameter */
    if (TEST_FLAG(flag, TARGET_FLAG_OPT_FLAG) && param->info->type != INT_TYPE)
        yypirerror(lexer->yyscanner, lexer,
                   "cannot set :opt_flag flag on non-int parameter '%s'", param->info->id.name);

    return param;
}

/*

=item C<argument * new_argument(lexer_state * const lexer, expression * const
expr)>

Create a new argument node which wraps C<expr>. The new argument node
is circular linked, meaning its C<next> pointer points to itself.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
new_argument(ARGIN(lexer_state * const lexer), expression * const expr)
{
    argument *arg = pir_mem_allocate_zeroed_typed(lexer, argument);
    arg->value    = expr;
    arg->next     = arg;
    return arg;
}



/*

=item C<argument * add_arg(argument *last, argument * const newarg)>

Add argument C<newarg> at the end of the list pointed to by C<last>.
The list is circular linked, and C<last> points to the last item.
Being circular linked, C<<last->next>> points to the first item.

After adding the element, the I<root> pointer (that points to the last
element of the list) is updated, and returned.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
add_arg(argument *last, argument * const newarg)
{
    PARROT_ASSERT(last);
    PARROT_ASSERT(newarg);

    newarg->next = last->next;
    last->next   = newarg;
    last         = newarg;

    return last;
}

/*

=item C<argument * unshift_arg(invocation * const inv, argument * const newarg)>

Unshift argument C<newarg> on an invocation object. The number
of arguments in the list of C<inv> is incremented to reflect
the extra argument on the list.

Given this list:

 A->B->C->D
 ^

A is the last one, B the first one. D points to A.
After the unshift_arg() call, the list should look like:

 A->X->B->C->D
 ^

Where X is the new argument. Basically, it's inserted in between
A (last) and B (first), but the pointer to the "last" is not updated,
so that A stays the last.

The function returns a pointer to the last node in the list.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
unshift_arg(invocation * const inv, argument * const newarg)
{
    ++inv->num_arguments;

    if (inv->arguments) {
        newarg->next = inv->arguments->next;
        inv->arguments->next = newarg;
    }
    else
        inv->arguments = newarg;

    return inv->arguments;
}

/*

=item C<argument * set_arg_flag(argument * const arg, arg_flag flag)>

Set the flag C<flag> on argument C<arg>. Note the C<flag> may
encode multiple flags. C<arg> is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
set_arg_flag(argument * const arg, arg_flag flag)
{
    SET_FLAG(arg->flags, flag);
    return arg;
}

/*

=item C<argument * set_arg_alias(lexer_state * const lexer, char const * const
alias)>

Set the alias specified in C<alias> on the current argument, accessible
through C<lexer>. The alias is the name under which the argument is passed
(as a named argument, i.e., the value of the C<:named> flag).
The argument on which the alias is set is returned.

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
argument *
set_arg_alias(ARGIN(lexer_state * const lexer), char const * const alias)
{
    PARROT_ASSERT(lexer->curarg != NULL);
    lexer->curarg->alias = alias;
    SET_FLAG(lexer->curarg->flags, ARG_FLAG_NAMED);
    return lexer->curarg;
}

/*

=item C<void load_library(lexer_state * const lexer, char const * const
library)>

Load the library indicated by C<library>.

=cut

*/
void
load_library(ARGIN(lexer_state * const lexer), char const * const library)
{
    /* see imcc.y:600 */
    STRING *libname       = Parrot_str_new(lexer->interp, library, strlen(library));
    PMC    *ignored_value = Parrot_load_lib(lexer->interp, libname, NULL);
    UNUSED(ignored_value);
    Parrot_register_HLL_lib(lexer->interp, libname);
}


/*

=item C<void set_label(lexer_state * const lexer, char const * const labelname)>

Set the label C<label> on the current instruction.

=cut

*/
void
set_label(ARGIN(lexer_state * const lexer), char const * const labelname)
{
    instruction *instr = CURRENT_INSTRUCTION(lexer);

    PARROT_ASSERT(instr);

    instr->label = labelname;

    /* if there is no instruction, then the label has the same index as the first
     * instruction to come. Like so:
     *
     * L1:
     * L2:
     * L3: print "hi"
     *     ...
     *     goto L1
     *     goto L2
     *     goto L3
     *
     * jumping to L1 is equivalent to jumping to L2 or L3; so when calculating
     * branch offsets, all three labels must yield the same offset.
     */

    /* store the labelname and its offset */
    store_local_label(lexer, labelname, instr->offset);
}


/*

=item C<void set_instr(lexer_state * const lexer, char const * const opname)>

Sets C<opname> to the current instruction, without operands. This is a
wrapper function for C<set_instrf> to prevent calls with an empty format
string.

=cut

*/
void
set_instr(ARGIN(lexer_state * const lexer), char const * const opname)
{
    set_instrf(lexer, opname, "");
}

/*

=item C<void update_instr(lexer_state * const lexer, char const * const newop)>

Update the current instruction; the new opname is given by C<newop>.

=cut

*/
void
update_instr(ARGIN(lexer_state * const lexer), char const * const newop)
{
    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));
    CURRENT_INSTRUCTION(lexer)->opname = newop;
}

/* This does not work as a function, so define this as a macro; this way, only need to maintain
 * it in one spot, and use it where ever you want.
 *
 * [It's not clear why this doesn't work in a separate function, but I suspect it has to do with
 * the for loop where it's used. --kjs]
 */
#define get_instr_var_arg(lexer, format, arg_ptr)  do {                                            \
    switch (format) {                                                                              \
        case 'I': /* identifier */                                                                 \
            expr = expr_from_ident(lexer, va_arg(arg_ptr, char *));                                \
            break;                                                                                 \
        case 'T': /* target */                                                                     \
            expr = expr_from_target(lexer, va_arg(arg_ptr, target *));                             \
            break;                                                                                 \
        case 'E': /* expression */                                                                 \
            expr = va_arg(arg_ptr, expression *);                                                  \
            break;                                                                                 \
        case 'C': /* constant */                                                                   \
            expr = expr_from_const(lexer, va_arg(arg_ptr, constant *));                            \
            break;                                                                                 \
        case 'i': /* integer */                                                                    \
            expr = expr_from_const(lexer, new_const(lexer, INT_VAL, va_arg(arg_ptr, int)));        \
            break;                                                                                 \
        case 'n': /* number */                                                                     \
            expr = expr_from_const(lexer, new_const(lexer, NUM_VAL, va_arg(arg_ptr, double)));     \
            break;                                                                                 \
        case 's': /* string */                                                                     \
            expr = expr_from_const(lexer, new_const(lexer, STRING_VAL, va_arg(arg_ptr, char *)));  \
            break;                                                                                 \
        default:                                                                                   \
            panic(lexer, "unknown format specifier in set_instrf()");                              \
            break;                                                                                 \
    }                                                                                              \
} while (0)


/*

=item C<void set_instrf(lexer_state * const lexer, char const * const opname,
char const * const format, ...)>

Set the specified instruction, using the operands from the vararg list. The
number and types of operands is specified by C<format>. The type of the
operands is specified by a '%' character followed by a character, which
can be one of the following:

=over 4

=item I - an identifier, passed as a char pointer

=item T - a target node

=item E - an expression node

=item C - a constant node

=item i - an integer constant

=item n - a number constant

=item s - a string constant, passed as a char pointer

=back

An example is:

 set_instrf(lexer, "set", "%T%i", $1, $2);

This sets the instruction named C<set>, which takes two operands:
a target node (T) and an integer constant (i). C<$1> and C<$2>
refer to the (non-)terminals used in a Yacc/Bison specification.

=cut

*/
void
set_instrf(ARGIN(lexer_state * const lexer), char const * const opname, char const * const format, ...)
{
    va_list  arg_ptr;       /* for the var. args */
    unsigned i;             /* loop iterator */
    size_t   format_length; /* length of the format string. */

    PARROT_ASSERT(format);
    format_length = strlen(format);
    PARROT_ASSERT(format_length % 2 == 0);


    /* create a new instruction node */
    new_statement(lexer, opname);

    /* retrieve the operands */
    va_start(arg_ptr, format);

    for (i = 0; i < format_length; i++) {
        expression *expr = NULL;
        /* make sure the format letter is preceded by a '%' */
        PARROT_ASSERT(*(format + i) == '%');
        ++i;

        get_instr_var_arg(lexer, *(format + i), arg_ptr);

        push_operand(lexer, expr);
    }
    va_end(arg_ptr);
}

/*

=item C<void add_operands(lexer_state * const lexer, char const * const format,
...)>

Add operands to the current instruction. This is a variable argument function;
C<format> contains placeholders, see the macro C<get_instr_var_arg> above
for which placeholders. The number of placeholders should match the number
of operands passed to this function.

=cut

*/
void
add_operands(ARGIN(lexer_state * const lexer), char const * const format, ...)
{
    va_list  arg_ptr;       /* for the var. args */
    unsigned i;             /* loop iterator */
    size_t   format_length; /* length of the format string. */

    PARROT_ASSERT(format);
    format_length = strlen(format);
    PARROT_ASSERT(format_length % 2 == 0);

    /* retrieve the operands */
    va_start(arg_ptr, format);

    for (i = 0; i < format_length; i++) {
        expression *expr = NULL;
        /* make sure the format letter is preceded by a '%' */
        PARROT_ASSERT(*(format + i) == '%');
        ++i;

        get_instr_var_arg(lexer, *(format + i), arg_ptr);

        push_operand(lexer, expr);
    }
    va_end(arg_ptr);
}


/*

=item C<void set_op_labelflag(lexer_state * const lexer, int flag)>

Set a flag on the current instruction that it contains labels as operands.
The bit indicates which operand, count starting from bit 1.

=cut

*/
void
set_op_labelflag(ARGIN(lexer_state * const lexer), int flag)
{
    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));
    SET_FLAG(CURRENT_INSTRUCTION(lexer)->oplabelbits, flag);
}

/*

=item C<char const * get_inverse(char const * const instr)>

Returns the instruction with inversed semantics; for instance
C<if> becomes C<unless>, C<greater-than> becomes C<less-or-equals>.

=cut

*/
PARROT_CONST_FUNCTION
PARROT_CANNOT_RETURN_NULL
char const *
get_inverse(char const * const instr)
{
         if (STREQ(instr, "if")) return "unless";
    else if (STREQ(instr, "gt")) return "le";
    else if (STREQ(instr, "ge")) return "lt";
    else if (STREQ(instr, "le")) return "gt";
    else if (STREQ(instr, "lt")) return "ge";
    else if (STREQ(instr, "ne")) return "eq";
    else if (STREQ(instr, "eq")) return "ne";

    PARROT_ASSERT(0); /* this should never happen */
    return NULL;
}

/*

=item C<void invert_instr(lexer_state * const lexer)>

Invert the current instruction. This function assumes there is an instruction
already in place.

=cut

*/
void
invert_instr(ARGIN(lexer_state * const lexer))
{
    instruction * const  ins   = CURRENT_INSTRUCTION(lexer);
    char          const *instr;
    PARROT_ASSERT(ins);

    instr = ins->opname;
    instr = get_inverse(instr);
    /* and set the new instruction */
    ins->opname = instr;
}


/*

=item C<expression * get_operand(lexer_state * const lexer, short n)>

Get the C<n>th operand from the current instruction. If there are no
operands, NULL is returned. Because the operands are stored in a
circular linked list, it is impossible to "run out"; for instance, if
there are 4 operands, and you request the 5th, then it will return
5 % 4 = the first operand.

Counting operands is done from 1 (not 0).

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
get_operand(ARGIN(lexer_state * const lexer), short n)
{
    expression *operand = CURRENT_INSTRUCTION(lexer)->operands;

    if (operand == NULL)
        return NULL;


    /* initialize the iterator */
    operand = operand->next;

    PARROT_ASSERT(n >= 0);

    /* go to the nth operand and return that one. */
    while (--n > 0) {
        operand = operand->next;
    }

    PARROT_ASSERT(operand);

    return operand;
}


/*

=item C<void get_operands(lexer_state * const lexer, int bitmask, ...)>

Get operands from the current instruction. C<bitmask> indicates which operands
are requested; if the C<i>th bit is set, the C<i>th operand is returned in a
vararg.

There must be as many varargs, as there are bits set in C<bitmask>.
This function assumes that the current instruction's C<opinfo> field is valid.

=cut

*/
void
get_operands(ARGIN(lexer_state * const lexer), int bitmask, ...)
{
    instruction *instr   = CURRENT_INSTRUCTION(lexer);
    expression  *iter    = instr->operands;
    int          numargs;
    int          i;
    va_list      arg_ptr;

    PARROT_ASSERT(iter);
    iter = iter->next;

    /*
    PARROT_ASSERT(instr->opinfo);

    numargs = instr->opinfo->op_count;

    */
    va_start(arg_ptr, bitmask);

    /*
    for (i = 0; i < BIT(numargs - 1); i++) {
        */
    for (i = 0; i < 8; i++) {
        /* if this argument was requested, store it in the vararg OUT parameters. */
        if (TEST_BIT(bitmask, BIT(i))) {

            expression **arg = va_arg(arg_ptr, expression **);
            *arg = iter;
        }

        iter = iter->next;
    }

    va_end(arg_ptr);
}

/*

=item C<unsigned get_operand_count(lexer_state * const lexer)>

Returns the number of operands of the I<current> instruction.
This function assumes there is an instruction in place
(in CURRENT_INSTRUCTION(lexer)).

=cut

*/
PARROT_WARN_UNUSED_RESULT
unsigned
get_operand_count(ARGIN(lexer_state * const lexer))
{
    unsigned count = 0;
    expression *first, *operand;

    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));

    /* if no operands, return 0 */
    if (CURRENT_INSTRUCTION(lexer)->operands == NULL)
        return 0;

    /* initialize the first and the iterator */
    first = operand = CURRENT_INSTRUCTION(lexer)->operands->next;

    /* count the number of operands */
    do {
        ++count;
        operand = operand->next;
    }
    while (operand != first);

    return count;
}

/*

=item C<static constant * create_const(lexer_state * const lexer, value_type
type, va_list arg_ptr)>

Constant constructor; based on C<type>, retrieve a value of the
appropriate type from C<arg_ptr>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
create_const(ARGIN(lexer_state * const lexer), value_type type, va_list arg_ptr)
{
    constant *c = pir_mem_allocate_zeroed_typed(lexer, constant);
    c->type     = type;
    c->next     = NULL;

    /* based on the indicated type, cast the variable argument to the right type. */
    switch (type) {
        case INT_VAL:
            c->val.ival = va_arg(arg_ptr, int);
            break;
        case NUM_VAL:
            c->val.nval = va_arg(arg_ptr, double);
            break;
        case PMC_VAL:  /* value of a PMC_VAL constant is also a string */
        case STRING_VAL:
            c->val.sval = va_arg(arg_ptr, char *);
            break;
        case USTRING_VAL:
            c->val.ustr = va_arg(arg_ptr, ucstring *);
            break;
        default:
            panic(lexer, "unknown data type in create_const() (%d)", type);
            break;
    }

    return c;
}

/*

=item C<constant * new_const(lexer_state * const lexer, value_type type, ...)>

Creates a new constant node of the given type.
Wrapper function for C<create_const>

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
constant *
new_const(ARGIN(lexer_state * const lexer), value_type type, ...)
{
    constant *c;
    va_list arg_ptr;
    va_start(arg_ptr, type);
    c = create_const(lexer, type, arg_ptr);
    va_end(arg_ptr);
    return c;
}

/*

=item C<constdecl * new_named_const(lexer_state * const lexer, value_type type,
char const * const name, ...)>

Creates a new constdecl node of the given type, by the given name.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
constdecl *
new_named_const(ARGIN(lexer_state * const lexer), value_type type, char const * const name, ...)
{
    constdecl *c = (constdecl *)pir_mem_allocate(lexer, sizeof (constdecl));
    va_list arg_ptr;
    va_start(arg_ptr, name);

       /* based on the indicated type, cast the variable argument to the right type. */
    switch (type) {
        case INT_VAL:
            c->val.ival = va_arg(arg_ptr, int);
            break;
        case NUM_VAL:
            c->val.nval = va_arg(arg_ptr, double);
            break;
        case PMC_VAL:  /* value of a PMC_VAL constant is also a string */
            c->val.pval = va_arg(arg_ptr, char *);
            break;
        case STRING_VAL:
            c->val.sval = va_arg(arg_ptr, char *);
            break;
        case USTRING_VAL:
            c->val.ustr = va_arg(arg_ptr, ucstring *);
            break;
        default:
            panic(lexer, "unknown data type in create_const() (%d)", type);
            break;
    }
    va_end(arg_ptr);
    c->name = name;
    c->type = type;

    return c;
}

/*

=item C<constdecl * new_pmc_const(lexer_state * const lexer, char const * const
type, char const * const name, constant * const value)>

Create a new PMC constant declaration of type C<type>, name C<name> and having a value C<value>.
The type must be a string indicating a valid type name (e.g. "Sub"). C<name> is the name
of the constant, and the value of the constant is passed as C<value>.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
constdecl *
new_pmc_const(ARGIN(lexer_state * const lexer), char const * const type,
              char const * const name, constant * const value)
{
    /* get a STRING representation of the c-string type */
    STRING *classname    = Parrot_str_new(lexer->interp, type, strlen(type));
    /* get a STRING holding the c-string "Sub" */
    STRING *subclassname = Parrot_str_new(lexer->interp, "Sub", 3);
    /* get a PMC for the class passed in type */
    PMC    *constclass   = Parrot_oo_get_class_str(lexer->interp, classname);
    /* check whether that PMC isa "Sub" */
    INTVAL is_a_sub      = VTABLE_isa(lexer->interp, constclass, subclassname);

    constdecl *decl      = (constdecl *)pir_mem_allocate(lexer, sizeof (constdecl));
    /* fprintf(stderr, "new_pmc_const: is a sub=%d\n", is_a_sub);
    */

    /* type must be a Sub, and value must be a string, holding the name of a sub */
    if (is_a_sub && value->type == STRING_VAL) {
        /* create a symbol representing the constant */
        symbol *constsym  = new_symbol(lexer, name, PMC_TYPE);
        /* create a target from the symbol */
        target *consttarg = target_from_symbol(lexer, constsym);

        SET_FLAG(constsym->flags, TARGET_FLAG_IS_CONST);

        /* declare it as a local, so that it will get a register assigned. */
        declare_local(lexer, PMC_TYPE, constsym);
        assign_vanilla_register(lexer, constsym);

        value->type     = PMC_VAL; /* set type of constant node */
        value->val.pval = value->val.sval;

        /* generate set_p_pc instruction, which takes the just-generated
         * consttarg variable as first operand, and the constant "value"
         * as second; its type is PMC_VAL, which is processed further in
         * piremit::emit_pbc_const_arg(), case PMC_VAL.
         */

         /* XXX always emit this? I prefer load-on-demand */

        new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
        push_operand(lexer, expr_from_target(lexer, consttarg));
        push_operand(lexer, expr_from_const(lexer, value));

        decl->name     = name;
        decl->type     = PMC_VAL;
        decl->val.pval = value->val.sval;
    }
    else if (value->type == INT_VAL) {

        STRING *intclassname = Parrot_str_new(lexer->interp, "Integer", 7);
        INTVAL  is_an_int    = VTABLE_isa(lexer->interp, constclass, intclassname);

        if (is_an_int) {
            symbol *constsym  = new_symbol(lexer, name, PMC_TYPE);
            target *consttarg = target_from_symbol(lexer, constsym);

            PMC *intconst = pmc_new(lexer->interp,
                                    Parrot_get_ctx_HLL_type(lexer->interp, enum_class_Integer));
            int index     = add_pmc_const(lexer->bc, intconst);
            VTABLE_set_integer_native(lexer->interp, intconst, value->val.ival);


            declare_local(lexer, PMC_TYPE, constsym);
            assign_vanilla_register(lexer, constsym);


            new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
            push_operand(lexer, expr_from_target(lexer, consttarg));
            push_operand(lexer, expr_from_int(lexer, index));


            /* declaration of an Integer means it's a PMC, not an INT_TYPE */
            decl->name     = name;
            decl->type     = PMC_VAL;
            decl->val.pval = value->val.sval;

        }
        else {
            yypirerror(lexer->yyscanner, lexer,
                       "cannot assign integer value to constant of type %s", type);
        }

    }
    else if (value->type == NUM_VAL) {
        STRING *numclassname  = Parrot_str_new(lexer->interp, "Float", 5);
        INTVAL  is_a_num      = VTABLE_isa(lexer->interp, constclass, numclassname);

        if (is_a_num) {
            symbol *constsym  = new_symbol(lexer, name, PMC_TYPE);
            target *consttarg = target_from_symbol(lexer, constsym);

            PMC *numconst     = pmc_new(lexer->interp,
                                        Parrot_get_ctx_HLL_type(lexer->interp, enum_class_Float));
            int index         = add_pmc_const(lexer->bc, numconst);
            VTABLE_set_number_native(lexer->interp, numconst, value->val.nval);

            declare_local(lexer, PMC_TYPE, constsym);
            assign_vanilla_register(lexer, constsym);

            new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
            push_operand(lexer, expr_from_target(lexer, consttarg));
            push_operand(lexer, expr_from_int(lexer, index));

            decl->name     = name;
            decl->type     = PMC_VAL;
            decl->val.pval = value->val.sval;

        }
        else {
            yypirerror(lexer->yyscanner, lexer,
                       "cannot assign number value to constant of type %s", type);
        }
    }
    else if (value->type == STRING_VAL) {
        STRING *strclassname = Parrot_str_new(lexer->interp, "String", 6);
        INTVAL  is_a_string  = VTABLE_isa(lexer->interp, constclass, strclassname);

        if (is_a_string) {
            symbol *constsym  = new_symbol(lexer, name, PMC_TYPE);
            target *consttarg = target_from_symbol(lexer, constsym);

            PMC    *strconst  = pmc_new(lexer->interp,
                                    Parrot_get_ctx_HLL_type(lexer->interp, enum_class_String));

            int     index     = add_pmc_const(lexer->bc, strconst);

            VTABLE_set_string_native(lexer->interp, strconst,
                                     Parrot_str_new(lexer->interp, value->val.sval,
                                                         strlen(value->val.sval)));

            declare_local(lexer, PMC_TYPE, constsym);
            assign_vanilla_register(lexer, constsym);

            new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
            push_operand(lexer, expr_from_target(lexer, consttarg));
            push_operand(lexer, expr_from_int(lexer, index));

            decl->name     = name;
            decl->type     = PMC_VAL;
            decl->val.pval = value->val.sval;

        }
        else {
            yypirerror(lexer->yyscanner, lexer,
                       "cannot assign string value to constant of type %s", type);
        }
    }

    return decl;
}



/*

=item C<static invocation * new_invocation(lexer_state * const lexer)>

Returns a pointer to a new invocation object. In the current implementation,
there can only be one invocation object at any time. For that reason, the
lexer structure has a cache, containing such an invocation object. This way,
it can be reused over and over again, preventing the need to allocate new
invocation objects.

This function clears the invocation object, and returns a pointer to it.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static invocation *
new_invocation(ARGIN(lexer_state * const lexer))
{
    /* optimization: return the address of the cached object */
    invocation *inv = &lexer->obj_cache.inv_cache;
    /* clear all fields */
    memset(inv, 0, sizeof (invocation));

    return inv;
}



/*

=item C<static expression * new_expr(lexer_state * const lexer, expr_type type)>

Create a new C<expression> node of the specified C<type>. The new
expression node is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static expression *
new_expr(ARGIN(lexer_state * const lexer), expr_type type)
{
    expression *expr = pir_mem_allocate_zeroed_typed(lexer, expression);
    expr->type       = type;
    expr->next       = expr;
    return expr;
}

/*

=item C<target * new_reg(lexer_state * const lexer, pir_type type, int regno)>

Create a C<target> node from a register. A new C<pir_reg> object is
created of type C<type> and PIR register number C<regno>. The target
node is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
target *
new_reg(ARGIN(lexer_state * const lexer), pir_type type, int regno)
{
    target  *t = new_target(lexer);
    pir_reg *reg;

    color_reg(lexer, type, regno);
    reg     = find_register(lexer, type, regno);
    /* set a pointer to the pir_reg's info field. */
    t->info = &reg->info;

    /* set a flag on this target node saying it's a register */
    SET_FLAG(t->flags, TARGET_FLAG_IS_REG);
    return t;
}

/*

=item C<expression * expr_from_target(lexer_state * const lexer, target * const
t)>

Wrap a target in an expression node; the expression node is
returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_target(ARGIN(lexer_state * const lexer), target * const t)
{
    expression *e = new_expr(lexer, EXPR_TARGET);
    e->expr.t     = t;
    return e;
}

/*

=item C<expression * expr_from_const(lexer_state * const lexer, constant * const
c)>

Convert the constant C<c> to an expression node and returns the newly
created expression node.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_const(ARGIN(lexer_state * const lexer), constant * const c)
{
    expression *e = new_expr(lexer, EXPR_CONSTANT);
    e->expr.c     = c;
    return e;
}

/*

=item C<expression * expr_from_int(lexer_state * const lexer, int ival)>

Create an expression node from an integer constant. This is a wrapper
function, which uses C<expr_from_const()> and C<new_const()>.
Creating an expression from an integer constant is a common operation,
so using this wrapper function makes the rest of the code slightly cleaner.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_int(ARGIN(lexer_state * const lexer), int ival)
{
    return expr_from_const(lexer, new_const(lexer, INT_VAL, ival));
}

/*

=item C<expression * expr_from_num(lexer_state * const lexer, double nval)>

Same as C<expr_from_int()>, except it takes a C<double> parameter,
not an C<int>.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_num(ARGIN(lexer_state * const lexer), double nval)
{
    return expr_from_const(lexer, new_const(lexer, NUM_VAL, nval));
}

/*

=item C<expression * expr_from_string(lexer_state * const lexer, char const *
const sval)>

Same as C<expr_from_int()>, except it takes a C<string> parameter.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_string(ARGIN(lexer_state * const lexer), char const * const sval)
{
    return expr_from_const(lexer, new_const(lexer, STRING_VAL, sval));
}


/*

=item C<expression * expr_from_ident(lexer_state * const lexer, char const *
const id)>

Convert a ident to an expression node and returns it.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
expression *
expr_from_ident(ARGIN(lexer_state * const lexer), char const * const id)
{
    expression *e = new_expr(lexer, EXPR_IDENT);
    e->expr.id    = id;
    return e;
}

/*

=item C<invocation * set_invocation_args(lexer_state * const lexer, invocation *
const inv, argument * const args)>

Set the args of an invocation onto the current invocation object.
The number of arguments in the list is counted, and stored in the
C<inv> object.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation *
set_invocation_args(ARGIN(lexer_state * const lexer), invocation * const inv, argument * const args)
{
    argument *arg_iter;
    unsigned  arg_count = 0;

    if (args == NULL) {
        inv->arguments     = NULL;
        inv->num_arguments = 0;
        return inv;
    }

    inv->arguments = args;

    arg_iter = args;

    do {
        /* count :named arguments twice, once for the argument,
         * once for the :named flag value.
         */
        if (TEST_FLAG(arg_iter->flags, TARGET_FLAG_NAMED))
            arg_count += 2;
        else
            ++arg_count;

        arg_iter = arg_iter->next;

    }
    while (arg_iter != args);


    /* fprintf(stderr, "invocation has %u args\n", arg_count); */

    /* store number of arguments in list in the invocation object */
    inv->num_arguments = arg_count;

    return inv;
}

/*

=item C<invocation * set_invocation_results(lexer_state * const lexer,
invocation * const inv, target * const results)>

Set the invocation results on the invocation object C<inv>.
The number of results is stored in the invocation object.
The invocation object C<inv> is returned.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation *
set_invocation_results(ARGIN(lexer_state * const lexer), invocation * const inv, target * const results)
{
    target  *result_iter;
    unsigned result_count = 0;

    if (results == NULL) {
        inv->results     = NULL;
        inv->num_results = 0;
        return inv;
    }

    /* set the list of results in the invocation object */
    inv->results = results;

    /* count the number of operands for the "get_results" op; :named results are counted twice. */
    result_iter  = results;
    do {
        /* count :named result targets twice for calculating number of operands */
        if (TEST_FLAG(result_iter->flags, TARGET_FLAG_NAMED))
            result_count += 2;
        else
            ++result_count;

        result_iter = result_iter->next;
    }
    while (result_iter != results);


    inv->num_results = result_count;

    return inv;
}

/*

=item C<invocation * set_invocation_type(invocation * const inv, invoke_type
type)>

Set the invocation type on the invocation object C<inv>.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
invocation *
set_invocation_type(invocation * const inv, invoke_type type)
{
    inv->type = type;
    return inv;
}

/*

=item C<invocation * invoke(lexer_state * const lexer, invoke_type type, ...)>

Create a new C<invocation> object of type C<type>. This can be one
of the C<invoke_types> enumeration. Based on the type, this function
expects a number of extra arguments to initialize some fields in
the newly created C<invocation> object.

The new invocation object is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
invocation *
invoke(ARGIN(lexer_state * const lexer), invoke_type type, ...)
{
    va_list arg_ptr;

    invocation *inv = new_invocation(lexer);
    inv->type       = type;

    va_start(arg_ptr, type);
    switch (type) {
        case CALL_PCC:  /* .call $P0, $P1 */
            inv->sub   = va_arg(arg_ptr, target *);
            inv->retcc = va_arg(arg_ptr, target *);
            break;
        case CALL_NCI:  /* .nci_call $P0 */
            inv->sub   = va_arg(arg_ptr, target *);
            break;
        case CALL_METHOD: /* $P0.$P1() */
            inv->sub    = va_arg(arg_ptr, target *);
            inv->method = va_arg(arg_ptr, expression *);
            break;
        case CALL_YIELD: /* no extra args */
            /* if there's a yield, the current subroutine is a coroutine */
            CURRENT_SUB(lexer)->info.iscoroutine = TRUE;
            break;
        case CALL_RETURN:   /* no extra args */
        case CALL_TAILCALL:  /* no extra args */
        case CALL_METHOD_TAILCALL:
            break;
        default:
            panic(lexer, "unknown invoke_type");
    }
    va_end(arg_ptr);

    return inv;
}




/*

=item C<void set_lex_flag(lexer_state * const lexer, target * const t, char
const * const name)>

Store target C<t> as a lexical in the sub_info struct. The lexical node
stores a pointer to the target's syminfo structure, so it can access
the allocated register.

=cut

*/
void
set_lex_flag(ARGIN(lexer_state * const lexer), target * const t, char const * const name)
{
    lexical *lex = CURRENT_SUB(lexer)->info.lexicals;

    /* check whether there is already a target marked as .lex with the specified name */
    while (lex != NULL) {
        if (STREQ(lex->name, name)) {
            yypirerror(lexer->yyscanner, lexer, "lexical '%s' was already declared", name);
            /* abort immediately */
            return;
        }
        lex = lex->next;
    }

    lex        = (lexical *)pir_mem_allocate(lexer, sizeof (lexical));
    lex->name  = name;

    /* get a pointer to the "color" field, so that the lexical struct knows
     * the assigned PASM register.
     */
    lex->color = &t->info->color;

    /* link this lex node in the list of lexicals at the front; order doesn't matter. */
    lex->next  = CURRENT_SUB(lexer)->info.lexicals;
    CURRENT_SUB(lexer)->info.lexicals = lex;
}

/*

=item C<void set_hll(lexer_state * const lexer, char const * const hll)>

Set the current HLL as specified in C<hll>.

Code taken from imcc.y; needs testing.

=cut

*/
void
set_hll(ARGIN(lexer_state * const lexer), char const * const hll)
{
    STRING * const hll_name             = Parrot_str_new(lexer->interp, hll, strlen(hll));
    CONTEXT(lexer->interp)->current_HLL = Parrot_register_HLL(lexer->interp, hll_name);
}



/*

=item C<void unshift_operand(lexer_state * const lexer, expression * const
operand)>

Add the specified expression as the first operand of the current
instruction.

=cut

*/
void
unshift_operand(ARGIN(lexer_state * const lexer), expression * const operand)
{
    expression *last = CURRENT_INSTRUCTION(lexer)->operands;
    if (last) {
        /* get the head of the list */
        expression *first = last->next;
        /* squeeze operand in between */
        operand->next     = first;
        last->next        = operand;
    }
    else {
        CURRENT_INSTRUCTION(lexer)->operands = operand;
    }
}

/*

=item C<void push_operand(lexer_state * const lexer, expression * const
operand)>

Add an operand at the end of the list of operands of the current instruction.

=cut

*/
void
push_operand(ARGIN(lexer_state * const lexer), NOTNULL(expression * const operand))
{
    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));

    if (CURRENT_INSTRUCTION(lexer)->operands) {
        operand->next = CURRENT_INSTRUCTION(lexer)->operands->next;
        CURRENT_INSTRUCTION(lexer)->operands->next = operand;
    }
    CURRENT_INSTRUCTION(lexer)->operands = operand;
}

/*

=item C<void remove_all_operands(lexer_state * const lexer)>

Remove all operands of the current instruction. This is done
by simply setting the pointer to the operands to NULL; all
memory for the operands is allocated through PIRC memory
functions, which is automatically freed after compilation.

=cut

*/
void
remove_all_operands(ARGIN(lexer_state * const lexer))
{
    CURRENT_INSTRUCTION(lexer)->operands = NULL;
}


/*

=item C<expression * expr_from_key(lexer_state * const lexer, key * const k)>

Wraps the key C<k> in an C<expression> node and returns that.
The returned expression node has type EXPR_KEY.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
expression *
expr_from_key(ARGIN(lexer_state * const lexer), NOTNULL(key * const k))
{
    expression *e = new_expr(lexer, EXPR_KEY);
    e->expr.k     = k;
    return e;
}


/*

=item C<static key_entry * new_key_entry(lexer_state * const lexer, expression *
const expr)>

Constructor for a key_entry node. Memory is allocated for the node,
and the C<expr> field is initialized to the passed in C<expr> value.
The newly constructed node is returned.

=cut

*/
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static key_entry *
new_key_entry(ARGIN(lexer_state * const lexer), ARGIN(expression * const expr))
{
    key_entry *entry = pir_mem_allocate_zeroed_typed(lexer, key_entry);
    entry->expr      = expr;
    entry->next      = NULL;
    return entry;
}
/*

=item C<key * new_key(lexer_state * const lexer, expression * const expr)>

Wraps the expression C<expr> in a key node and returns that.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
key *
new_key(ARGIN(lexer_state * const lexer), NOTNULL(expression * const expr))
{
    key *k       = pir_mem_allocate_zeroed_typed(lexer, key);
    k->head      = new_key_entry(lexer, expr);
    k->keylength = 1;
    return k;
}


/*

=item C<key * add_key(lexer_state * const lexer, key * const keylist, expression
* const exprkey)>

Adds a new, nested key (in C<exprkey>) to the current key,
pointed to by C<keylist>. C<keylist> is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
key *
add_key(ARGIN(lexer_state * const lexer), NOTNULL(key * const keylist),
        NOTNULL(expression * const exprkey))
{
    key_entry *newkey = new_key_entry(lexer, exprkey);
    key_entry *iter   = keylist->head;

    /* goto end of list */
    /* XXX this could be optimized by having key_entries stored in
     * a circular linked list. Fix later.
     */
    while (iter->next != NULL)
        iter = iter->next;

    iter->next = newkey;

    ++keylist->keylength;

    return keylist;
}

/*

=item C<symbol * add_local(symbol * const list, symbol * const local)>

Add local C<local> to the list pointed to by C<list>. The new object
is inserted at the front of the list. C<list> is returned

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol *
add_local(symbol * const list, symbol * const local)
{
    local->next = list->next;
    list->next  = local;
    return list;
}


/*

=item C<symbol *
new_local(char * const name, int has_unique_reg)>

Create a new symbol node to represent the local C<name>.
If C<has_unique_reg> is true, the C<:unique_reg> flag is set.
The newly created symbol node is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
symbol *
new_local(ARGIN(lexer_state * const lexer), char const * const name, int has_unique_reg){
    symbol *s = new_symbol(lexer, name, UNKNOWN_TYPE);

    if (has_unique_reg)
        SET_FLAG(s->flags, TARGET_FLAG_UNIQUE_REG);

    return s;
}


/*

=item C<int is_parrot_op(lexer_state * const lexer, char const * const name)>

Check whether C<name> is a parrot opcode. C<name> can be either the short
or fullname of the opcode; for instance, C<print> is the short name, which
has several full names, such as C<print_i>, C<print_s>, etc., depending on
the arity and types of operands.

=cut

*/
int
is_parrot_op(ARGIN(lexer_state * const lexer), char const * const name)
{
    int opcode = lexer->interp->op_lib->op_code(name, 0); /* check short name, e.g. "set" */

    /* do *NOT* check for the "long" name variant, such as "set_i_ic";
     * signatures (such as the _i_ic part) will be calculated by PIRC,
     * adding it already will generate e.g. "set_i_ic_i_ic", which is
     * incorrect, obviously.
     */
    return (opcode >= 0);
}


/*

=item C<void new_sub_instr(lexer_state * const lexer, int opcode, char const *
const opname, unsigned num_var_args)>

Create a new instruction node, and initialize the opcode and opinfo on that
node. This function can be used to create an instruction of which the signature
is known beforehand, without the need to compute the signature during runtime.
This is useful for generating special subroutine instructions, such as
C<get_params_pc> etc.

The parameter C<num_var_args> passes the number of variable arguments (if any)
that C<opcode> has.

=cut

*/
void
new_sub_instr(ARGIN(lexer_state * const lexer), int opcode, char const * const opname,
              unsigned num_var_args)

{
    new_statement(lexer, opname);
    CURRENT_INSTRUCTION(lexer)->opinfo = &lexer->interp->op_info_table[opcode];
    CURRENT_INSTRUCTION(lexer)->opcode = opcode;

    /* The size of a var-arg op (get_params, etc.) is 1 for the op,
     * 1 for the fixed integer array, and n for the variable number of arguments.
     * So, 2 + n, where n is the number of arguments.
     */

    /* count number of ints needed to store this instruction in bytecode */
    lexer->codesize += CURRENT_INSTRUCTION(lexer)->opinfo->op_count;

    /* add the var. number of args for the PCC instructions. */
    lexer->codesize += num_var_args;

}

/*

=item C<void update_op(lexer_state * const lexer, instruction * const instr, int
newop)>

Update the instruction C<instr>; it is replaced by the op with opcode C<newop>.
The C<opinfo>, C<opname> and C<opcode> fields of C<instr> are updated.

=cut

*/
void
update_op(ARGIN(lexer_state * const lexer), NOTNULL(instruction * const instr), int newop)
{
    /* Deduct number of ints needed for the old instruction, if there is one.
     * This is necessary during strength reduction and other optimizations, once
     * the opinfo is retrieved, we also update the codesize field in the lexer.
     */
    if (instr->opinfo)
        lexer->codesize -= instr->opinfo->op_count;

    /* We cannot undo the counting of ops of var-arg ops such as get_params.
     * Is that ever necessary? Don't think so, as they're added through new_sub_instr()
     * which is special anyway.
     */

    /* now get the opinfo structure, update the name, and update the opcode. */
    instr->opinfo = &lexer->interp->op_info_table[newop];
    instr->opname = instr->opinfo->full_name;
    instr->opcode = newop;

    /* add codesize needed for the new instruction. */
    lexer->codesize += instr->opinfo->op_count;
}


/*

=item C<static label * new_label(lexer_state * const lexer, char const * const
labelid, int offset)>

Constructor for a label struct node. A new C<label> object is created,
initialized with the label id specified in C<labelid>, and the bytecode
offset in C<offset>. A pointer to the label node is returned.

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static label *
new_label(ARGIN(lexer_state * const lexer),
        ARGIN(char const * const labelid), int offset)
{
    label *l  = pir_mem_allocate_zeroed_typed(lexer, label);
    l->name   = labelid;
    l->offset = offset;
    return l;
}

/*

=item C<static void fixup_local_labels(lexer_state * const lexer)>

Fix up all local labels in the subroutine C<sub>. Labels are stored as
identifiers in an expression node (the C<id> field in the C<expr> union);
the label's offset is subtracted from the current instruction's offset,
and the operand of the branch instruction is changed into this numeric
representation of the label.

=cut

*/
static void
fixup_local_labels(ARGIN(lexer_state * const lexer))
{
    instruction *iter = CURRENT_SUB(lexer)->statements;

    /* if there's no instruction in the current sub, then do nothing. */
    if (iter == NULL)
        return;

    do {
        iter = iter->next; /* first time init pointer to first instruction */

        /* Do a quick global check if any label bits have been set
         * if no label at all, skip this whole block.
         */
        if (iter->oplabelbits) {

            /* now check for each operand */
            expression *operand = iter->operands;

            /* iter->operands is a circular linked list, point to the *last* operand. */

            /* Note that since oplabelbits has at least 1 bit set (otherwise it wouldn't
             * have been evaluated as "true" in the if statement above), we can be
             * sure there's at least one operand. Don't do silly tests here anymore.
             * (hence the do-while statement, no initial test.)
             */
            int flag = 0;

            do {
                operand = operand->next;

                if (TEST_FLAG(iter->oplabelbits, BIT(flag))) {
                    /* the current operand is a label; fix it up. No, not a date. */
                    char const * labelid    = operand->expr.id;
                    unsigned     offset     = find_local_label(lexer, labelid);
                    unsigned     curr_instr = iter->offset;

                    /* convert the label identifier into a real label object.
                     * The label offset is calculated deducting the current
                     * Program Counter from the PC of the label.
                     */
                    operand->expr.l = new_label(lexer, labelid, offset - curr_instr);
                    operand->type   = EXPR_LABEL;
                }

                ++flag;

            }
            while (operand != iter->operands);

        }


    }
    while (iter != lexer->subs->statements); /* iterate over all instructions */
}

/*

=item C<void fixup_global_labels(lexer_state * const lexer)>

Fix references to global labels. The lexer keeps a list of instructions that
can be patched. These instructions currently look up the global label during
runtime (this is the op C<find_sub_not_null>). If the global label can be
resolved now, then this op is changed into the C<set_p_pc> op, which loads
the PMC constant representing the sub into a register. Obviously, being a
simple register set instruction, this is faster than a look up.

=cut

*/
void
fixup_global_labels(ARGIN(lexer_state * const lexer))
{
    global_fixup *iter = lexer->global_refs;

    while (iter) {
        global_label *glob = find_global_label(lexer, iter->label);

        /* if found, then fix it; if not, that's fine, the right instruction to find the
         * sub during runtime is in place already (i.e. "find_sub_not_null").
         */
        if (glob) {
            expression *new_second_operand;

            /* iter->instr should be changed into this instruction: set_p_pc */

            update_op(lexer, iter->instr, PARROT_OP_set_p_pc);

            /* now change the second operand. It was a PASM register, and a string, but
             * it should be the PASM register and a constant PMC (that represents the
             * sub to be invoked). This constant PMC is referenced by a number, stored
             * in the C<global_label> struct.
             */

            /* create an operand that refers to a constant PMC */
            new_second_operand = expr_from_int(lexer, glob->const_table_index);
            /* link it into the list of operands; the /current/ second operand should be removed,
             * so insert the new expression as second operand, and make sure the old second
             * operand is no longer in the list.
             */
            new_second_operand->next = iter->instr->operands->next;
            iter->instr->operands->next->next = new_second_operand;

        }
        iter = iter->next;
    }
}



/*

=item C<void close_sub(lexer_state * const lexer)>

Finalize the subroutine. Generate the final instructions in the current
subroutine, if needed. Then, all local labels are fixed up; i.e., all
label identifiers are converted into their offsets. The endoffset of this
subroutine is stored.
If register optimization was requested, this is invoked here.

=cut

*/
void
close_sub(ARGIN(lexer_state * const lexer))
{
    int           need_epilogue = 1;
    int           sub_const_table_index;
    global_label *glob;

    /* don't generate the sub epilogue if the last instruction was already
     * leaving the sub.
     * XXX add all instructions that make the sub epilogue unnecessary.
     * XXX should all branching instructions prevent generation of the epilogue?
     */
    if (CURRENT_INSTRUCTION(lexer)) {
        switch (CURRENT_INSTRUCTION(lexer)->opcode) {
            case PARROT_OP_tailcall_p:
            case PARROT_OP_tailcallmethod_p_sc:
            case PARROT_OP_tailcallmethod_p_p:
            case PARROT_OP_end:
            case PARROT_OP_returncc:
            case PARROT_OP_yield:
            case PARROT_OP_branch_ic:
            case PARROT_OP_exit_ic:
                need_epilogue = 0;
                break;
            default:
                break;
        }
    }

    if (need_epilogue)
        emit_sub_epilogue(lexer);

    /* fix up all local branch labels */
    fixup_local_labels(lexer);

    /* store end offset in bytecode of this subroutine */
    CURRENT_SUB(lexer)->info.endoffset = lexer->codesize;

     /* if register allocation was requested, do that now */
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_REGALLOC))
        linear_scan_register_allocation(lexer->lsr);

    /* store the subroutine in the bytecode constant table. */
    sub_const_table_index = add_sub_pmc(lexer->bc, &CURRENT_SUB(lexer)->info,
                                    TEST_FLAG(CURRENT_SUB(lexer)->flags, PIRC_SUB_FLAG_LEX),
                                    CURRENT_SUB(lexer)->flags, lexer);



    /* store the sub PMC index in the constant table with the global label,
     * so that invoking ops can find this index.
     */
    glob = find_global_label(lexer, CURRENT_SUB(lexer)->info.subname);

    PARROT_ASSERT(glob != NULL); /* it was stored in new_subr(), so must be there. */

    glob->const_table_index = sub_const_table_index;
}

/*

=item C<void update_sub_register_usage(lexer_state * const lexer, unsigned
reg_usage[NUM_PARROT_TYPES])>

Update register usage for the current subroutine with the register usage
information in C<reg_usage>.

=cut

*/
void
update_sub_register_usage(ARGIN(lexer_state * const lexer), unsigned reg_usage[NUM_PARROT_TYPES])
{
    int i;
    for (i = 0; i < NUM_PARROT_TYPES; ++i)
        CURRENT_SUB(lexer)->info.regs_used[i] = reg_usage[i];
}


/*

=item C<void annotate(lexer_state * const lexer, char const * const key,
constant * const value)>

Add a new annotation with key C<key> and value C<value>.

=cut

*/
void
annotate(ARGIN(lexer_state * const lexer), char const * const key, constant * const value)
{
    annotation *ann     = (annotation *)pir_mem_allocate(lexer, sizeof (annotation));
    ann->key            = key;
    ann->value          = value;

    ++lexer->num_annotations; /* keep track of number of annotations */


    ann->offset = lexer->codesize;

    /* store the annotation in a list, managed by the lexer
     * the list is circular linked, so that the order of annotations is preserved.
     */
    if (lexer->annotations) {
        ann->next = lexer->annotations->next; /* new node's next becomes the first one. */
        lexer->annotations->next = ann;
    }
    else {
        ann->next = ann; /* link to itself */
    }
    lexer->annotations = ann;
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


