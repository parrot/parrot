/*
Copyright: 2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/mmd.c - Multimethod dispatch for binary opcode functions

=head1 SYNOPSIS

This system is set up to handle type-based dispatching for binary (i.e.
two-arg) functions. This includes, though isn't necessarily limited to,
binary operators such as addition or subtraction.

=head1 DESCRIPTION

The MMD system is straightforward, and currently must be explicitly
invoked, for example by a vtable function. (We may reserve the right to
use MMD in all circumstances, but currently do not).

=head2 API

For the purposes of the API, each MMD-able function is assigned a unique
number which is used to find the correct function table. This is the
C<func_num> parameter in the following functions. While Parrot isn't
restricted to a predefined set of functions, it I<does> set things up so
that all the binary vtable functions have a MMD table preinstalled for
them, with default behaviour.

=head2 Remarks

C<< binop_mmd_funcs->x >> and C<< ->y >> are table sizes
not highest type in table.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

typedef void    (*mmd_f_v_ppp)(Interp *, PMC *, PMC *, PMC *);
typedef void    (*mmd_f_v_pip)(Interp *, PMC *, INTVAL, PMC *);
typedef void    (*mmd_f_v_pnp)(Interp *, PMC *, FLOATVAL, PMC *);
typedef void    (*mmd_f_v_psp)(Interp *, PMC *, STRING *, PMC *);
typedef INTVAL  (*mmd_f_i_pp) (Interp *, PMC *, PMC *);

#ifndef NDEBUG
static void
dump_mmd(Interp *interpreter, INTVAL function)
{
    UINTVAL x, y;
    UINTVAL offset, x_funcs, y_funcs;
    MMD_table *table = interpreter->binop_mmd_funcs + function;
    funcptr_t func, def;

    x_funcs = table->x;
    y_funcs = table->y;
    def = table->default_func;
    if (!def) {
        printf("default for %d not registered\n", (int)function);
        return;
    }
    printf("    ");
    for (x = 0; x < x_funcs; ++x) {
        if (! (x % 10))
            printf("%d", (int) x / 10);
        else
            printf(" ");
    }
    printf("\n");
    for (y = 0; y < y_funcs; ++y) {
        printf("%3d ", (int)y);
        for (x = 0; x < x_funcs; ++x) {
            offset = x_funcs * y + x;
            func = table->mmd_funcs[offset];
            printf("%c",
                    func == def ?  '.' :
                    (UINTVAL)func & 1 ?  'P' :
                    !func  ? '0' : 'F');
        }
        printf("\n");
    }
    for (y = 0; y < y_funcs; ++y) {
        for (x = 0; x < x_funcs; ++x) {
            offset = x_funcs * y + x;
            func = table->mmd_funcs[offset];
            if (func && func != def && !((UINTVAL) func & 1))
                printf("%3d %3d: %p\n", (int)x, (int)y, (void*) func);
        }
    }
}
#endif

static funcptr_t
get_mmd_dispatch_type(Interp *interpreter, UINTVAL left_type,
        UINTVAL right_type, INTVAL function, int *is_pmc)
{
    funcptr_t func;
    UINTVAL offset, x_funcs, y_funcs;
    MMD_table *table = interpreter->binop_mmd_funcs + function;
    x_funcs = table->x;
    y_funcs = table->y;

    /*
     * XXX quick hack for delegates
     */
    if (left_type == enum_class_delegate)
        right_type = 0;
    if (left_type < x_funcs) {
        if (right_type < y_funcs) {
            offset = x_funcs * right_type + left_type;
            func = table->mmd_funcs[offset];
        }
        else {
            func = table->mmd_funcs[left_type];
        }
    } else {
        func = table->default_func;
    }
    /*
     * empty slots are filled with the default function, so we really
     * shouldn't have a NULL function pointer
     */
    assert(func);
#ifdef PARROT_HAS_ALIGNED_FUNCPTR
    if ((UINTVAL)func & 1) {
        *is_pmc = 1;
        func = (funcptr_t)((UINTVAL)func & ~1);
    }
    else {
        *is_pmc = 0;
    }
    return func;
#else
    {
        void *sub = (void*)((UINTVAL)func & ~1);
        if (is_pmc_ptr(interpreter, sub)) {
            *is_pmc = 1;
            return (funcptr_t) sub;
        }
        else {
            *is_pmc = 0;
        }
        return func;
    }
#endif
}


static funcptr_t
get_mmd_dispatcher(Interp *interpreter, PMC *left, PMC * right,
        INTVAL function, int *is_pmc)
{
    UINTVAL left_type, right_type;
    left_type = left->vtable->base_type;
    right_type = right->vtable->base_type;
    return get_mmd_dispatch_type(interpreter, left_type, right_type,
            function, is_pmc);
}

/*

=item C<void
mmd_dispatch_v_ppp(Interp *interpreter,
		 PMC *left, PMC *right, PMC *dest, INTVAL function)>

Dispatch to a multimethod that "returns" a PMC. C<left>, C<right>, and
C<dest> are all PMC pointers, while C<func_num> is the MMD table that
should be used to do the dispatching.

The MMD system will figure out which function should be called based on
the types of C<left> and C<right> and call it, passing in C<left>,
C<right>, and C<dest> like any other binary vtable function.

This function has a C<void> return type, like all the "take two PMCs,
return a PMC" vtable functions do.

=item C<void
mmd_dispatch_v_pip(Interp *interpreter,
		 PMC *left, INTVAL right, PMC *dest, INTVAL function)>

Like above, right argument is a native INTVAL.

=item C<void
mmd_dispatch_v_pnp(Interp *interpreter,
		 PMC *left, FLOATVAL right, PMC *dest, INTVAL function)>

Like above, right argument is a native FLOATVAL.

=item C<void
mmd_dispatch_v_psp(Interp *interpreter,
		 PMC *left, STRING *right, PMC *dest, INTVAL function)>

Like above, right argument is a native STRING *.

=cut

*/

void
mmd_dispatch_v_ppp(Interp *interpreter,
		 PMC *left, PMC *right, PMC *dest, INTVAL function)
{
    mmd_f_v_ppp real_function;
    PMC *sub;
    int is_pmc;

    real_function = (mmd_f_v_ppp)get_mmd_dispatcher(interpreter,
            left, right, function, &is_pmc);

    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args_save(interpreter, sub, "vPPP",
                left, right, dest);
    }
    else {
        (*real_function)(interpreter, left, right, dest);
    }
}

void
mmd_dispatch_v_pip(Interp *interpreter,
		 PMC *left, INTVAL right, PMC *dest, INTVAL function)
{
    mmd_f_v_pip real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_pip)get_mmd_dispatch_type(interpreter,
            left_type, 0, function, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args_save(interpreter, sub, "vPIP",
                left, right, dest);
    }
    else {
        (*real_function)(interpreter, left, right, dest);
    }
}

void
mmd_dispatch_v_pnp(Interp *interpreter,
		 PMC *left, FLOATVAL right, PMC *dest, INTVAL function)
{
    mmd_f_v_pnp real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_pnp)get_mmd_dispatch_type(interpreter,
            left_type, 0, function, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args_save(interpreter, sub, "vPNP",
                left, right, dest);
    }
    else {
        (*real_function)(interpreter, left, right, dest);
    }
}

void
mmd_dispatch_v_psp(Interp *interpreter,
		 PMC *left, STRING *right, PMC *dest, INTVAL function)
{
    mmd_f_v_psp real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_psp)get_mmd_dispatch_type(interpreter,
            left_type, 0, function, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args_save(interpreter, sub, "vPSP",
                left, right, dest);
    }
    else {
        (*real_function)(interpreter, left, right, dest);
    }
}

/*

=item C<INTVAL
mmd_dispatch_i_pp(Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function)>

Like C<mmd_dispatch_v_ppp()>, only it returns an C<INTVAL>.

=cut

*/

INTVAL
mmd_dispatch_i_pp(Interp *interpreter,
		 PMC *left, PMC *right, INTVAL function)
{
    mmd_f_i_pp real_function;
    PMC *sub;
    int is_pmc;
    INTVAL ret;

    real_function = (mmd_f_i_pp)get_mmd_dispatcher(interpreter,
            left, right, function, &is_pmc);

    if (is_pmc) {
        sub = (PMC*)real_function;
        ret = Parrot_runops_fromc_args_save_reti(interpreter, sub, "IPP",
                left, right);
    }
    else {
        ret = (*real_function)(interpreter, left, right);
    }
    return ret;
}

/*

=item C<void
mmd_add_function(Interp *interpreter,
        INTVAL funcnum, funcptr_t function)>

Add a new binary MMD function to the list of functions the MMD system knows
of. C<func_num> is the number of the new function, while C<default_func> is
the function to be called when the system doesn't know which function it
should call. (Because, for example, there hasn't been a function
installed that matches the left and right types for a call).

=cut

*/

void
mmd_add_function(Interp *interpreter,
        INTVAL func_nr, funcptr_t function)
{
    INTVAL i;
    if (func_nr >= (INTVAL)interpreter->n_binop_mmd_funcs) {
        interpreter->binop_mmd_funcs = mem_sys_realloc(
                interpreter->binop_mmd_funcs,
                (func_nr + 1) * sizeof(MMD_table));

        for (i = interpreter->n_binop_mmd_funcs; i <= func_nr; ++i)  {
            MMD_table *table = interpreter->binop_mmd_funcs + i;
            table->x = table->y = 0;
            table->mmd_funcs = NULL;
        }
        interpreter->n_binop_mmd_funcs = func_nr + 1;
    }

    /* We mark the new function by adding in the default function
       pointer */
    interpreter->binop_mmd_funcs[func_nr].default_func = function;

}

/*

=item C<static void
mmd_expand_x(Interp *interpreter, INTVAL function, INTVAL new_x)>

Expands the function table in the X dimension to include C<new_x>.

=cut

*/

static void
mmd_expand_x(Interp *interpreter, INTVAL function, INTVAL new_x)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    funcptr_t default_func;
    UINTVAL i;
    MMD_table *table = interpreter->binop_mmd_funcs + function;

    /* Is the Y 0? If so, nothing to expand, so just set the X for
       later use */
    if (table->y == 0) {
        table->x = new_x;
        return;
    }

    /* The Y is not zero. Bleah. This means we have to expand the
       table in an unpleasant way. */

    x = table->x;
    y = table->y;
    default_func = table->default_func;

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * y * new_x);
    for (i = 0; i < y * new_x; i++) {
        new_table[i] = default_func;
    }

    /* Then copy the old table over. We have to do this row by row,
       because the rows in the old and new tables are different
       lengths */
    for (i = 0; i < y; i++) {
        INTVAL newoffset, oldoffset;
        newoffset = i * new_x;
        oldoffset = i * x;
        memcpy(new_table + newoffset,
               table->mmd_funcs + oldoffset,
               sizeof(funcptr_t) * x);
    }
    if (table->mmd_funcs)
        mem_sys_free(table->mmd_funcs);
    table->x = new_x;
    /* Set the old table to point to the new table */
    table->mmd_funcs = new_table;
}

/*

=item C<static void
mmd_expand_y(Interp *interpreter, INTVAL function, INTVAL new_y)>

Expands the function table in the Y direction.

=cut

*/

static void
mmd_expand_y(Interp *interpreter, INTVAL function, INTVAL new_y)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    funcptr_t default_func;
    UINTVAL i;
    MMD_table *table = interpreter->binop_mmd_funcs + function;

    x = table->x;
    y = table->y;
    default_func = table->default_func;

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * x * new_y);
    for (i = 0; i < x * new_y; i++) {
        new_table[i] = default_func;
    }

    /* Then copy the old table over, if it existed in the first place. */
    if (table->mmd_funcs) {
        memcpy(new_table, table->mmd_funcs,
               sizeof(funcptr_t) * x * y);
        mem_sys_free(table->mmd_funcs);
    }
    table->y = new_y;
    table->mmd_funcs = new_table;

}

/*

=item C<void
mmd_add_by_class(Interp *interpreter,
             INTVAL functype,
             STRING *left_class, STRING *right_class,
             funcptr_t funcptr)>

Add a function to the MMD table by class name, rather than class number.
Handles the case where the named class isn't loaded yet.

Adds a new MMD function C<funcptr> to the C<func_num> function table
that will be invoked when the left parameter is of class C<left_class>
and the right parameter is of class C<right_class>. Both classes are
C<STRING *>s that hold the PMC class names for the left and right sides.
If either class isn't yet loaded, Parrot will cache the information such
that the function will be installed if at some point in the future both
classes are available.

Currently this is done by just assigning class numbers to the classes,
which the classes will pick up and use if they're later loaded, but we
may later put the functions into a deferred table that we scan when PMC
classes are loaded. Either way, the function will be guaranteed to be
installed when it's needed.

The function table must exist, but if it is too small, it will
automatically be expanded.

=cut

*/

void
mmd_add_by_class(Interp *interpreter,
             INTVAL functype,
             STRING *left_class, STRING *right_class,
             funcptr_t funcptr)
{
    INTVAL left_type = pmc_type(interpreter, left_class);
    INTVAL right_type = pmc_type(interpreter, right_class);

    if (left_type == enum_type_undef) {
        left_type = pmc_register(interpreter, left_class);
    }
    if (right_type == enum_type_undef) {
        right_type = pmc_register(interpreter, right_class);
    }

    mmd_register(interpreter, functype, left_type, right_type, funcptr);

}

/*

=item C<void
mmd_register(Interp *interpreter,
             INTVAL type,
             INTVAL left_type, INTVAL right_type,
             funcptr_t funcptr)>

Register a function C<funcptr> for MMD function table C<func_num> for classes
C<left_type> and C<right_type>. The left and right types are C<INTVAL>s that
represent the class ID numbers.

The function table must exist, but if it is too small, it will
automatically be expanded.

Adding a new function to the table can be interestingly non-trivial, so
we get to be tricky.

If the left or right types are larger than anything we've seen so far,
it means that we have to expand the table. Making Y larger is simple --
just realloc with some more rows. Making X larger is less simple. In
either case, we punt to other functions.

TODO - Currently the MMD system doesn't handle inheritance and best match
searching, as it assumes that all PMC types have no parent type. This
can be considered a bug, and will be resolved at some point in the
future.

=cut

*/

void
mmd_register(Interp *interpreter,
             INTVAL function,
             INTVAL left_type, INTVAL right_type,
             funcptr_t funcptr)
{

    INTVAL offset;
    MMD_table *table = interpreter->binop_mmd_funcs + function;
    if ((INTVAL)table->x <= left_type) {
        mmd_expand_x(interpreter, function, left_type + 1);
    }

    if ((INTVAL)table->y <= right_type) {
        mmd_expand_y(interpreter, function, right_type + 1);
    }

    offset = table->x * right_type + left_type;
    table->mmd_funcs[offset] = funcptr;
}

void
mmd_register_sub(Interp *interpreter,
             INTVAL type,
             INTVAL left_type, INTVAL right_type,
             PMC *sub)
{
    PMC *fake = (PMC*)((UINTVAL) sub | 1);
    mmd_register(interpreter, type, left_type, right_type, D2FPTR(fake));
}

/*

=item C<void
mmd_destroy(Parrot_Interp interpreter)>

Frees all the memory allocated used the MMD subsystem.

=cut

*/

void
mmd_destroy(Parrot_Interp interpreter)
{
    if (interpreter->n_binop_mmd_funcs) {
        UINTVAL i;
        for (i = 0; i <interpreter->n_binop_mmd_funcs; ++i) {
            if (interpreter->binop_mmd_funcs[i].mmd_funcs)
                mem_sys_free(interpreter->binop_mmd_funcs[i].mmd_funcs);
        }
    }
    mem_sys_free(interpreter->binop_mmd_funcs);
}


PMC *
mmd_vtfind(Parrot_Interp interpreter, INTVAL type, INTVAL left, INTVAL right) {
    int is_pmc;
    funcptr_t func = get_mmd_dispatch_type(interpreter,
            left, right, type, &is_pmc);
    if (func && is_pmc)
        return (PMC*)F2DPTR(func);
    return PMCNULL;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/mmd.h>.

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
