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
#include "mmd.str"
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


funcptr_t
get_mmd_dispatch_type(Interp *interpreter, INTVAL function, UINTVAL left_type,
        UINTVAL right_type, int *is_pmc)
{
    funcptr_t func;
    UINTVAL offset, x_funcs, y_funcs;
    MMD_table *table = interpreter->binop_mmd_funcs + function;
    x_funcs = table->x;
    y_funcs = table->y;

    /*
     * XXX quick hack for delegates
     *     and something is broken with the tables
     *     w/o the compare for equal types, mmd_fallback jumps in
     *     This just depends on *other* PMCs that use MMD
     */
    /* XXX do this in table setup */
    if (left_type == enum_class_delegate)
        right_type = 0;
    if (left_type < x_funcs) {
        if (right_type < y_funcs) {
            offset = x_funcs * right_type + left_type;
            func = table->mmd_funcs[offset];
            /* XXX do this in table setup */
            if (func == table->default_func)
                func = table->mmd_funcs[left_type];
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
    return get_mmd_dispatch_type(interpreter, function, left_type, right_type,
            is_pmc);
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
        Parrot_runops_fromc_args(interpreter, sub, "vPPP",
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
            function, left_type, 0, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args(interpreter, sub, "vPIP",
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
            function, left_type, 0, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args(interpreter, sub, "vPNP",
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
            function, left_type, 0, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        Parrot_runops_fromc_args(interpreter, sub, "vPSP",
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
        ret = Parrot_runops_fromc_args_reti(interpreter, sub, "IPP",
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
        if (interpreter->binop_mmd_funcs) {
            interpreter->binop_mmd_funcs =
                mem_sys_realloc(interpreter->binop_mmd_funcs,
                                (func_nr + 1) * sizeof(MMD_table));
        } else {
            interpreter->binop_mmd_funcs =
                mem_sys_allocate((func_nr + 1) * sizeof(MMD_table));
        }

        for (i = interpreter->n_binop_mmd_funcs; i <= func_nr; ++i)  {
            MMD_table *table = interpreter->binop_mmd_funcs + i;
            table->x = table->y = 0;
            table->mmd_funcs = NULL;
            table->default_func = NULL;
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
    char *src_ptr, *dest_ptr;
    size_t old_dp, new_dp;

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
    src_ptr = (char*) table->mmd_funcs;
    dest_ptr = (char*) new_table;
    old_dp = sizeof(funcptr_t) * x;
    new_dp = sizeof(funcptr_t) * new_x;
    for (i = 0; i < y; i++) {
        memcpy(dest_ptr, src_ptr, sizeof(funcptr_t) * x);
        src_ptr  += old_dp;
        dest_ptr += new_dp;
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
    assert(x);
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
             INTVAL func_num,
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
    MMD_table *table;

    assert(function < (INTVAL)interpreter->n_binop_mmd_funcs);
    table = interpreter->binop_mmd_funcs + function;
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
            if (interpreter->binop_mmd_funcs[i].mmd_funcs) {
                mem_sys_free(interpreter->binop_mmd_funcs[i].mmd_funcs);
		interpreter->binop_mmd_funcs[i].mmd_funcs = NULL;
	    }
        }
    }
    mem_sys_free(interpreter->binop_mmd_funcs);
    interpreter->binop_mmd_funcs = NULL;
}

/*

=item C<PMC *
mmd_vtfind(Parrot_Interp interpreter, INTVAL type, INTVAL left, INTVAL right)>

Return an MMD PMC function for the given data types. The return result is
either a Sub PMC (for PASM MMD functions) or a CSub PMC holding the
C function pointer in PMC_struct_val. This CSub is not invocable, you have to
wrap it into an NCI function to get the required function arguments passed.

=cut

*/

PMC *
mmd_vtfind(Parrot_Interp interpreter, INTVAL function, INTVAL left, INTVAL right) {
    int is_pmc;
    PMC *f;
    funcptr_t func = get_mmd_dispatch_type(interpreter,
            function, left, right, &is_pmc);
    if (func && is_pmc)
        return (PMC*)F2DPTR(func);
    f = pmc_new(interpreter, enum_class_CSub);
    PMC_struct_val(f) = F2DPTR(func);
    return f;
}


static PMC* mmd_arg_tuple_inline(Interp *, STRING *signature, va_list args);
static PMC* mmd_arg_tuple_func(Interp *, STRING *signature);
static PMC* mmd_search_default(Interp *, STRING *meth, PMC *arg_tuple);
static PMC* mmd_search_scopes(Interp *, STRING *meth, PMC *arg_tuple);
static void mmd_search_classes(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_lexical(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_package(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_global(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_builtin(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_maybe_candidate(Interp *, PMC *pmc, PMC *arg_tuple, PMC *cl);
static void mmd_sort_candidates(Interp *, PMC *arg_tuple, PMC *cl);

/*

=item C<PMC *Parrot_MMD_search_default_inline(Interp *, STRING *meth, STRING *signature, ...)>

Default implementation of MMD lookup. The signature contains the letters
"INSP" for the argument types. B<PMC> arguments are given in the function call.

=item C<PMC *Parrot_MMD_search_default_func(Interp *, STRING *meth, STRING *signature)>

Default implementation of MMD lookup. The signature contains the letters
"INSP" for the argument types. B<PMC> arguments are taken from registers
C<P5> and up according to calling conventions.

=cut

*/

/*
 * TODO move to header, when API is sane
 */

PMC *Parrot_MMD_search_default_inline(Interp *, STRING *meth,
        STRING *signature, ...);
PMC *Parrot_MMD_search_default_func(Interp *, STRING *meth, STRING *signature);

PMC *
Parrot_MMD_search_default_inline(Interp *interpreter, STRING *meth,
        STRING *signature, ...)
{
    va_list args;
    PMC* arg_tuple;
    /*
     * 1) create argument tuple
     */
    va_start(args, signature);
    arg_tuple = mmd_arg_tuple_inline(interpreter, signature, args);
    va_end(args);
    /*
     * default search policy
     */
    return mmd_search_default(interpreter, meth, arg_tuple);
}

PMC *
Parrot_MMD_search_default_func(Interp *interpreter, STRING *meth,
        STRING *signature)
{
    PMC* arg_tuple;
    /*
     * 1) create argument tuple
     */
    arg_tuple = mmd_arg_tuple_func(interpreter, signature);
    /*
     * default search policy
     */
    return mmd_search_default(interpreter, meth, arg_tuple);
}

/*

=item C<
static PMC* mmd_arg_tuple_inline(Interp *, STRING *signature, va_list args)>

Return a list of argument types. PMC arguments are specified as function
arguments.

=item C<
static PMC* mmd_arg_tuple_func(Interp *, STRING *signature)>

Return a list of argument types. PMC arguments are take from registers
P5 ... according to calling conventions.

=cut

*/

static PMC*
mmd_arg_tuple_inline(Interp *interpreter, STRING *signature, va_list args)
{
    INTVAL sig_len, i, type;
    PMC* arg_tuple, *arg;

    arg_tuple = pmc_new(interpreter, enum_class_FixedIntegerArray);
    sig_len = string_length(interpreter, signature);
    if (!sig_len)
        return arg_tuple;
    VTABLE_set_integer_native(interpreter, arg_tuple, sig_len);
    for (i = 0; i < sig_len; ++i) {
        type = string_index(interpreter, signature, i);
        switch (type) {
            case 'I':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_INTVAL);
                break;
            case 'N':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_FLOATVAL);
                break;
            case 'S':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_STRING);
                break;
            case 'P':
                arg = va_arg(args, PMC *);
                type = VTABLE_type(interpreter, arg);
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, type);
                break;
            default:
                internal_exception(1,
                        "Unknown signature type %d in mmd_arg_tuple", type);
                break;
        }

    }
    return arg_tuple;
}

static PMC*
mmd_arg_tuple_func(Interp *interpreter, STRING *signature)
{
    INTVAL sig_len, i, type, next_p;
    PMC* arg_tuple, *arg;

    arg_tuple = pmc_new(interpreter, enum_class_FixedIntegerArray);
    sig_len = string_length(interpreter, signature);
    if (!sig_len)
        return arg_tuple;
    VTABLE_set_integer_native(interpreter, arg_tuple, sig_len);
    next_p = 5;
    for (i = 0; i < sig_len; ++i) {
        type = string_index(interpreter, signature, i);
        switch (type) {
            case 'I':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_INTVAL);
                break;
            case 'N':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_FLOATVAL);
                break;
            case 'S':
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_STRING);
                break;
            case 'P':
                if (next_p == 16)
                    internal_exception(1, "Unimp MMD too many args");
                arg = REG_PMC(next_p++);
                type = VTABLE_type(interpreter, arg);
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, type);
                break;
            default:
                internal_exception(1,
                        "Unknown signature type %d in mmd_arg_tuple", type);
                break;
        }

    }
    return arg_tuple;
}

/*

=item C<static PMC* mmd_search_default(Interp *, STRING *meth, PMC *arg_tuple)>

Default implementation of MMD search. Search scopes for candidates, walk the
class hierarchy, sort all candidates by their manhattan distance, and return
result

=cut

*/

static PMC*
mmd_search_default(Interp *interpreter, STRING *meth, PMC *arg_tuple)
{
    PMC *candidate_list, *pmc;
    INTVAL n;
    STRING *_sub;

    /*
     * 2) create a list of matching functions
     */
    candidate_list = mmd_search_scopes(interpreter, meth, arg_tuple);
    /*
     * 3) if list is empty fail
     *    if the first found function is a plain Sub: finito
     */
    n = VTABLE_elements(interpreter, candidate_list);
    if (n == 1) {
        pmc = VTABLE_get_pmc_keyed_int(interpreter, candidate_list, 0);
        _sub = CONST_STRING(interpreter, "Sub");

        if (VTABLE_isa(interpreter, pmc, _sub)) {
            return pmc;
        }
    }
    /*
     * 4) first was a MultiSub - go through all found MultiSubs and check
     *    the first arguments MRO, add all MultiSubs and plain methods,
     *    where the first argument matches
     */
    mmd_search_classes(interpreter, meth, arg_tuple, candidate_list);
    n = VTABLE_elements(interpreter, candidate_list);
    if (!n)
        return NULL;
    /*
     * 5) sort the list
     */
    if (n > 1)
        mmd_sort_candidates(interpreter, arg_tuple, candidate_list);
    n = VTABLE_elements(interpreter, candidate_list);
    if (!n)
        return NULL;
    /*
     * 6) Uff, return first one
     */
    pmc = VTABLE_get_pmc_keyed_int(interpreter, candidate_list, 0);
    return pmc;
}

/*

=item C<static void mmd_search_classes(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search all the classes in all MultiSubs of the candidates C<cl> and return
a list of all candidates.

=cut

*/

static void
mmd_search_classes(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    PMC *pmc, *mro, *class;
    INTVAL i, n, type1;
    STRING *namespace_name;

    /*
     * get the class of the first argument
     */
    type1 = VTABLE_get_integer_keyed_int(interpreter, arg_tuple, 0);
    if (type1 < 0) {
        return;
        internal_exception(1, "unimplemted native MMD type");
        /* TODO create some class namespace */
    }
    else {
        mro = Parrot_base_vtables[type1]->mro;
        n = VTABLE_elements(interpreter, mro);
        for (i = 0; i < n; ++i) {
            class = VTABLE_get_pmc_keyed_int(interpreter, mro, i);
            namespace_name = VTABLE_namespace_name(interpreter, class);
            pmc = Parrot_find_global(interpreter, namespace_name, meth);
            if (pmc) {
                /*
                 * mmd_is_hidden would consider all previous candidates
                 * XXX pass current n so that only candidates from this
                 *     mro are used?
                 */
                if (mmd_maybe_candidate(interpreter, pmc, arg_tuple, cl))
                    break;
            }
        }
    }
}

static INTVAL
distance_cmp(Interp *interpreter, INTVAL a, INTVAL b)
{
    short da = a & 0xffff;
    short db = b & 0xffff;
    return da > db ? 1 : da < db ? -1 : 0;
}

extern void Parrot_FixedPMCArray_sort(Interp* , PMC* pmc, PMC *cmp_func);

/*

=item C<static UINTVAL mmd_distance(Interp *, PMC *pmc, PMC *arg_tuple)>

Create Manhattan Distance of sub C<pmc> against given argument types.
0xffff is the maximum distance

=cut

*/

static PMC*
mmd_cvt_to_types(Interp* interpreter, PMC *multi_sig)
{
    INTVAL i, n, type;
    PMC *ar;
    STRING *sig;

    n = VTABLE_elements(interpreter, multi_sig);
    ar = pmc_new(interpreter, enum_class_FixedIntegerArray);
    VTABLE_set_integer_native(interpreter, ar, n);
    for (i = 0; i < n; ++i) {
        sig = VTABLE_get_string_keyed_int(interpreter, multi_sig, i);
        type = pmc_type(interpreter, sig);
        VTABLE_set_integer_keyed_int(interpreter, ar, i, type);
    }
    return ar;
}

#define MMD_BIG_DISTANCE 0x7fff

static UINTVAL
mmd_distance(Interp *interpreter, PMC *pmc, PMC *arg_tuple)
{
    PMC *multi_sig, *mro;
    INTVAL i, n, args, dist, j, m;
    INTVAL type_sig, type_call;

    multi_sig = PMC_sub(pmc)->multi_signature;
    if (!multi_sig) {
        /* some method */
        return 0;
    }
    if (multi_sig->vtable->base_type == enum_class_FixedStringArray) {
        multi_sig = PMC_sub(pmc)->multi_signature =
            mmd_cvt_to_types(interpreter, multi_sig);
    }
    n = VTABLE_elements(interpreter, multi_sig);
    args = VTABLE_elements(interpreter, arg_tuple);
    /*
     * arg_tuple may have more arguments - only the
     * n multi_sig invocants are counted
     */
    if (args < n)
        return MMD_BIG_DISTANCE;
    dist = 0;
    if (args > n)
        dist = 1;
    /*
     * now go through args
     */
    for (i = 0; i < n; ++i) {
        type_sig  = VTABLE_get_integer_keyed_int(interpreter, multi_sig, i);
        type_call = VTABLE_get_integer_keyed_int(interpreter, arg_tuple, i);
        if (type_sig == type_call)
            continue;
        /*
         * different native types are very different, except a PMC
         * which matches any PMC
         */
        if ((type_sig <= 0 && type_sig != enum_type_PMC) || type_call <= 0) {
            dist = MMD_BIG_DISTANCE;
            break;
        }
        /*
         * now consider MRO of types the signature type has to be somewhere
         * int the MRO of the type_call
         */
        mro = Parrot_base_vtables[type_call]->mro;
        m = VTABLE_elements(interpreter, mro);
        for (j = 0; j < m; ++j) {
            PMC *cl = VTABLE_get_pmc_keyed_int(interpreter, mro, j);
            if (cl->vtable->base_type == type_sig)
                break;
            ++dist;
        }
        /*
         * if the type wasn't in MRO check, if any PMC matches
         * in that case use the distance + 1 (of an any PMC parent)
         */
        if (j == m && type_sig != enum_type_PMC)
            return MMD_BIG_DISTANCE;
        ++dist;
    }
    return dist;
}

/*

=item C<static void mmd_sort_candidates(Interp *, PMC *arg_tuple, PMC *cl)>

Sort the candidate list C<cl> by Manhattan Distance

=cut

*/

static void
mmd_sort_candidates(Interp *interpreter, PMC *arg_tuple, PMC *cl)
{
    INTVAL i, n, d, i3;
    PMC *nci, *pmc, *sort;
    INTVAL *helper;
    PMC **data;

    n = VTABLE_elements(interpreter, cl);
    /*
     * create a helper structure:
     * bits 0..15  = distance
     * bits 16..31 = idx in candidate list
     */
    sort = pmc_new(interpreter, enum_class_FixedIntegerArray);
    VTABLE_set_integer_native(interpreter, sort, n);
    helper = PMC_data(sort);
    for (i = 0; i < n; ++i) {
        pmc = VTABLE_get_pmc_keyed_int(interpreter, cl, i);
        d = mmd_distance(interpreter, pmc, arg_tuple);
        helper[i] = i << 16 | (d & 0xffff);
    }
    /*
     * need an NCI function pointer
     */
    nci = pmc_new(interpreter, enum_class_NCI);
    PMC_struct_val(nci) = F2DPTR(distance_cmp);
    /*
     * sort it
     */
    i3 = REG_INT(3);
    REG_INT(3) = 1;
    Parrot_FixedPMCArray_sort(interpreter, sort, nci);
    REG_INT(3) = i3;
    /*
     * now helper has a sorted list of indices in the upper 16 bits
     * fill helper with sorted candidates
     */
    data = PMC_data(cl);
    for (i = 0; i < n; ++i) {
        INTVAL idx = helper[i] >> 16;
        /*
         * if the distance is big stop
         */
        if ((helper[i] & 0xffff) == MMD_BIG_DISTANCE) {
            PMC_int_val(cl) = i;
            break;
        }
        LVALUE_CAST(PMC*, helper[i]) = data[idx];
    }
    /*
     * use helper structure
     */
    PMC_data(cl) = helper;
    PMC_data(sort) = data;
}

/*

=item C<static PMC* mmd_search_scopes(Interp *, STRING *meth, PMC *arg_tuple)>

Search all scopes for MMD candidates matching the arguments given in
C<arg_tuple>.

=cut

*/

static PMC*
mmd_search_scopes(Interp *interpreter, STRING *meth, PMC *arg_tuple)
{
    PMC *candidate_list;
    int stop;

    candidate_list = pmc_new(interpreter, enum_class_ResizablePMCArray);
    stop = mmd_search_lexical(interpreter, meth, arg_tuple, candidate_list);
    if (stop)
        return candidate_list;
    mmd_search_package(interpreter, meth, arg_tuple, candidate_list);
    if (stop)
        return candidate_list;
    mmd_search_global(interpreter, meth, arg_tuple, candidate_list);
    if (stop)
        return candidate_list;
    mmd_search_builtin(interpreter, meth, arg_tuple, candidate_list);
    return candidate_list;
}

/*

=item C<static int mmd_is_hidden(Interp *, PMC *multi, PMC *cl)>

Check if the given multi sub is hidden by any inner multi sub (already in
the candidate list C<cl>.

=cut

*/

static int
mmd_is_hidden(Interp *interpreter, PMC *multi, PMC *cl)
{
    /*
     * if the candidate list already has the a sub with the same
     * signature (long name), the outer multi is hidden
     *
     * TODO
     */
    return 0;
}

/*

=item C<static int mmd_maybe_candidate(Interp *, PMC *pmc, PMC *arg_tuple, PMC *cl)>

If the candidate C<pmc> is a Sub PMC, push it on the candidate list and
return TRUE to stop further search.

If the candidate is a MultiSub remember all matching Subs and return FALSE
to continue searching outer scopes.

=cut

*/

static int
mmd_maybe_candidate(Interp *interpreter, PMC *pmc, PMC *arg_tuple, PMC *cl)
{
    STRING *_sub, *_multi_sub;
    INTVAL i, n;

    _sub = CONST_STRING(interpreter, "Sub");
    _multi_sub = CONST_STRING(interpreter, "MultiSub");

    if (VTABLE_isa(interpreter, pmc, _sub)) {
        /* a plain sub stops outer searches */
        /* TODO check arity of sub */

        VTABLE_push_pmc(interpreter, cl, pmc);
        return 1;
    }
    if (!VTABLE_isa(interpreter, pmc, _multi_sub)) {
        /* not a Sub or MultiSub - ignore */
        return 0;
    }
    /*
     * ok we have a multi sub pmc, which is an array of candidates
     */
    n = VTABLE_elements(interpreter, pmc);
    for (i = 0; i < n; ++i) {
        PMC *multi_sub;

        multi_sub = VTABLE_get_pmc_keyed_int(interpreter, pmc, i);
        if (!mmd_is_hidden(interpreter, multi_sub, cl))
            VTABLE_push_pmc(interpreter, cl, multi_sub);
    }
    return 0;
}

/*

=item C<static int mmd_search_lexical(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search the current lexical pad for matching candidates. Return TRUE if the
MMD search should stop.

=cut

*/

static int
mmd_search_lexical(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    PMC *pad = scratchpad_get_current(interpreter);
    PMC *pmc;
    INTVAL depth, i;

    if (!pad)
        return 0;
    depth = PMC_int_val(pad);
    for (i = -1; depth; --i, --depth) {
        pmc = scratchpad_get_by_name(interpreter, pad, i, meth);
        if (pmc) {
            if (mmd_maybe_candidate(interpreter, pmc, arg_tuple, cl))
                return 1;
        }
    }
    return 0;
}

/*

=item C<static int mmd_search_package(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search the current package namespace for matching candidates. Return TRUE if
the MMD search should stop.

=cut

*/

static int
mmd_search_package(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    /* STRING *name_space = interpreter->ctx.current_package; */
    PMC *pmc;
    PMC *current_sub;
    PMC *name_space;

    current_sub = interpreter->ctx.current_sub;
    if (!current_sub)
        return 0;
    name_space = PMC_sub(current_sub)->name_space;
    if (!name_space)
        return 0;
    pmc = Parrot_find_global_p(interpreter, name_space, meth);
    if (pmc) {
        if (mmd_maybe_candidate(interpreter, pmc, arg_tuple, cl))
            return 1;
    }
    return 0;
}

/*

=item C<static int mmd_search_global(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search the global namespace for matching candidates. Return TRUE if
the MMD search should stop.

=cut

*/

static int
mmd_search_global(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    PMC *pmc;

    pmc = Parrot_find_global(interpreter, NULL, meth);
    if (pmc) {
        if (mmd_maybe_candidate(interpreter, pmc, arg_tuple, cl))
            return 1;
    }
    return 0;
}

/*

=item C<static int mmd_search_builtin(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search the builtin namespace for matching candidates. Return TRUE if
the MMD search should stop.

=cut

*/

static int
mmd_search_builtin(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    return 0;
}

static void
mmd_create_builtin_multi_stub(Interp *interpreter, INTVAL func_nr)
{
    const char *name;
    STRING *s, *ns;
    int len;
    char *p;
    PMC *multi;

    name = Parrot_MMD_methode_name(interpreter, func_nr);
    /*
     * _int, _float, _str are just native variants of the base
     * multi
     */
    len = strlen(name);
    p = strstr(name, "_int");
    if (p && (p - name) == len - 4)
        return;
    p = strstr(name, "_str");
    if (p && (p - name) == len - 4)
        return;
    p = strstr(name, "_float");
    if (p && (p - name) == len - 6)
        return;
    ns = CONST_STRING(interpreter, "__parrot_core");
    s =  const_string(interpreter, name);
    /* create in constant pool */
    multi = constant_pmc_new(interpreter, enum_class_MultiSub);
    Parrot_store_global(interpreter, ns, s, multi);
}

static void
mmd_create_builtin_multi_meth(Interp *interpreter, INTVAL type,
        const MMD_init *entry)
{
    const char *name, *short_name;
    char signature[6], val_sig;
    STRING *s, *ns;
    int len;
    char *p;
    PMC *method, *multi;
    INTVAL func_nr;


    func_nr = entry->func_nr;
    name = short_name = Parrot_MMD_methode_name(interpreter, func_nr);
    /*
     * _int, _float, _str are just native variants of the base
     * multi
     */
    val_sig = 'P';
    len = strlen(name);
    p = strstr(name, "_int");
    if (p && (p - name) == len - 4) {
        short_name = Parrot_MMD_methode_name(interpreter, func_nr - 1);
        val_sig = 'I';
    }
    else {
        p = strstr(name, "_str");
        if (p && (p - name) == len - 4) {
            short_name = Parrot_MMD_methode_name(interpreter, func_nr - 1);
            val_sig = 'S';
        }
        else {
            p = strstr(name, "_float");
            if (p && (p - name) == len - 6) {
                short_name = Parrot_MMD_methode_name(interpreter, func_nr - 2);
                val_sig = 'N';
            }
        }
    }
#if 0
    /*
     * create NCI method in left class
     */
    s = const_string(interpreter, name);
    strcpy(signature, "vIP.P");
    signature[3] = val_sig;
    if (func_nr >= MMD_EQ && func_nr <= MMD_STRCMP) {
        signature[0] = 'I';
        signature[4] = '\0';
    }
    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method,
            const_string(interpreter, signature),
            F2DPTR(entry->func_ptr));
    Parrot_store_global(interpreter,
            Parrot_base_vtables[type]->whoami,
            const_string(interpreter, name),
            method);

    /*
     * push method on multi_sub
     */
    ns = CONST_STRING(interpreter, "__parrot_core");
    multi = Parrot_find_global(interpreter, ns,
            const_string(interpreter, short_name));
    assert(multi);
    /*
     * FIXME need the multi signature too
     */
    VTABLE_push_pmc(interpreter, multi, method);
#endif
}

/*

=item C<void Parrot_mmd_register_table(Interp*, INTVAL type,
   MMD_init *, INTVAL)>

Register MMD functions for this PMC type.

=cut

*/


void
Parrot_mmd_register_table(Interp* interpreter, INTVAL type,
        const MMD_init *mmd_table, INTVAL n)
{
    INTVAL i;
    MMD_table *table;

    table = interpreter->binop_mmd_funcs;
    if ((INTVAL)table->x < type && type < enum_class_core_max) {
        /*
         * pre-alloacte the function table
         */
        for (i = 0; i < MMD_USER_FIRST; ++i) {
            mmd_register(interpreter, i, enum_class_core_max - 1,
                    enum_class_core_max - 1, NULL);
            /*
             * create a MultiSub stub
             */
            mmd_create_builtin_multi_stub(interpreter, i);
        }
    }
    /*
     * register default mmds for this type
     */
    for (i = 0; i < n; ++i) {
        if (mmd_table[i].right == enum_type_PMC) {
            mmd_register(interpreter,
                    mmd_table[i].func_nr, type,
                    type, mmd_table[i].func_ptr);
        }
        mmd_create_builtin_multi_meth(interpreter, type, mmd_table + i);
    }
    /*
     * register specific mmds for this type
     */
    for (i = 0; i < n; ++i) {
        INTVAL r = mmd_table[i].right < 0 ? 0 : mmd_table[i].right;
        mmd_register(interpreter,
                mmd_table[i].func_nr, type, r, mmd_table[i].func_ptr);
    }
}

static void
mmd_rebuild_1(Interp* interpreter, UINTVAL type, INTVAL func_nr)
{
    PMC *mro, *parent;
    INTVAL c, nc;
    UINTVAL offset, x_funcs, y_funcs, other, parent_type;
    MMD_table *table;
    funcptr_t func;

    mro = Parrot_base_vtables[type]->mro;
    nc = VTABLE_elements(interpreter, mro);

    /*
     * if class has no parents, nothing todo
     */
    if (nc <= 1)
        return;
    /*
     * if the class doesn't provide func_nr, nothing can be
     * inherited
     */
    table = interpreter->binop_mmd_funcs + func_nr;
    x_funcs = table->x;
    y_funcs = table->y;
    if (type >= x_funcs)
        return;
    /*
     * go through MRO and install functions
     */
    for (c = 1; c < nc; ++c) {
        parent = VTABLE_get_pmc_keyed_int(interpreter, mro, c);
        parent_type = parent->vtable->base_type;
        for (other = 0; other < (UINTVAL)enum_class_max; ++other) {
            if (other >= y_funcs)
                break;
            /* (other, parent) */
            offset = x_funcs * other + parent_type;
            func = table->mmd_funcs[offset];
            if (func == table->default_func)
                continue;
            if (table->mmd_funcs[x_funcs * other + type] ==
                    table->default_func) {
                if (other == parent_type)
                    mmd_register(interpreter, func_nr, type, type, func);
                mmd_register(interpreter, func_nr, type, other, func);
            }
            /* now for (parent, other) */
            offset = x_funcs * parent_type + other;
            func = table->mmd_funcs[offset];
            if (func == table->default_func)
                continue;
            if (table->mmd_funcs[x_funcs * type + other] ==
                    table->default_func) {
                mmd_register(interpreter, func_nr, other, type, func);
            }
        }
    }
}

/*

=item C<void Parrot_mmd_rebuild_table(Interp*, INTVAL type, INTVAL func_nr)>

Rebuild the static MMD_table for the given class type and MMD function
number. If C<type> is negative all classes are rebuilt. If C<func_nr> is
negative all MMD functions are rebuilt.

=cut

*/

void
Parrot_mmd_rebuild_table(Interp* interpreter, INTVAL type, INTVAL func_nr)
{
    INTVAL first_type, last_type, t;
    INTVAL first_func, last_func, f;

    if (type < 0) {
        first_type = 1;
        last_type = enum_class_max;
    }
    else {
        first_type = type;
        last_type = type + 1;
    }
    if (func_nr < 0) {
        first_func = 0;
        last_func = MMD_USER_FIRST;
    }
    else {
        first_func = func_nr;
        last_func = func_nr + 1;
    }

    for (f = first_func; f < last_func; ++f)
        for (t = first_type; t < last_type; ++t) {
            mmd_rebuild_1(interpreter, (UINTVAL)t, f);
        }

}

/*

=back

=head1 SEE ALSO

F<include/parrot/mmd.h>,
F<http://svn.perl.org/perl6/doc/trunk/design/apo/A12.pod>,
F<http://svn.perl.org/perl6/doc/trunk/design/syn/S12.pod>

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
