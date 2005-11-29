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
#include "parrot/oplib/ops.h"
#include "mmd.str"
#include <assert.h>

#define MMD_DEBUG 0

static void mmd_create_builtin_multi_meth_2(Interp *,
        INTVAL func_nr, INTVAL type, INTVAL right, funcptr_t func_ptr);

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

/*
 * isa_str contains for real objects and for deleg_pmc objects
 * both the string "delegate" - so compare a vtable slot
 */

extern void Parrot_deleg_pmc_mark(Interp*, PMC* pmc);

static int
isa_deleg_pmc(Interp *interpreter, PMC *p)
{
    return p->vtable->mark == Parrot_deleg_pmc_mark;
}

funcptr_t
get_mmd_dispatch_type(Interp *interpreter, INTVAL func_nr, INTVAL left_type,
        INTVAL right_type, int *is_pmc)
{
    funcptr_t func, func_;
    UINTVAL offset, x_funcs, y_funcs;
    INTVAL r;
    MMD_table *table = interpreter->binop_mmd_funcs + func_nr;
    x_funcs = table->x;
    y_funcs = table->y;

    func = NULL;
    assert(left_type >= 0);
    assert(right_type >=0 ||
            (right_type >= enum_type_INTVAL && right_type <= enum_type_PMC));
    r = right_type;
    if (right_type < 0)
        right_type -= enum_type_INTVAL;
    else
        right_type += 4;
    if ((UINTVAL)left_type < x_funcs && (UINTVAL)right_type < y_funcs) {
            offset = x_funcs * right_type + left_type;
            func = table->mmd_funcs[offset];
    }
    if (!func) {
        const char *meth_c = Parrot_MMD_method_name(interpreter, func_nr);
        STRING *meth_s = const_string(interpreter, meth_c);
        PMC *method = Parrot_MMD_search_default_infix(interpreter,
                meth_s, left_type, r);
        if (!method)
            real_exception(interpreter, 0, 1, "MMD function %s not found"
                    "for types (%d, %d)", meth_c, left_type, r);
        if (method->vtable->base_type == enum_class_NCI) {
            PMC *nci;
            /* C function is at struct_val */
            func = D2FPTR(PMC_struct_val(method));
            /*
             * if one of the arguments isa deleg_pmc
             * install the mmd_wrapper as real function
             */
            if (isa_deleg_pmc(interpreter,
                        Parrot_base_vtables[left_type]->class)
                    || (r > 0 && isa_deleg_pmc(interpreter,
                            Parrot_base_vtables[r]->class))) {
                /* TODO check dest too */
                nci = pmc_new(interpreter, enum_class_Bound_NCI);
                dod_register_pmc(interpreter, nci);     /* XXX */
                *is_pmc = 2;
                PMC_struct_val(nci) = func;
                return D2FPTR(nci);
            }

            *is_pmc = 0;
            mmd_register(interpreter, func_nr, left_type, r,
                    PMC_struct_val(method));
        }
        else {
            *is_pmc = 1;
            func = D2FPTR(method);
            mmd_register_sub(interpreter, func_nr, left_type, r, method);
        }
        return func;
    }
    *is_pmc = (UINTVAL)func & 3;
    func_ = (funcptr_t)((UINTVAL)func & ~3);
#ifndef PARROT_HAS_ALIGNED_FUNCPTR
    if (!*is_pmc) {
        return func;
    }
    else if (!is_pmc_ptr(interpreter, F2DPTR(func_))) {
      *is_pmc = 0;
      return func;
    }
#endif
    return func_;
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

=item C<PMC*
mmd_dispatch_p_ppp(Interp *,
		 PMC *left, PMC *right, PMC *dest, INTVAL function)>

Dispatch to a multimethod that returns a PMC. C<left>, C<right>, and
C<dest> are all PMC pointers, while C<func_num> is the MMD table that
should be used to do the dispatching.
If the C<dest> pointer is NULL, it dispatches two a two-argument function
that returns a new C<dest> always.

The MMD system will figure out which function should be called based on
the types of C<left> and C<right> and call it, passing in C<left>,
C<right>, and possibly C<dest> like any other binary vtable function.

=item C<PMC*
mmd_dispatch_p_pip(Interp *,
		 PMC *left, INTVAL right, PMC *dest, INTVAL function)>

Like above, right argument is a native INTVAL.

=item C<PMC*
mmd_dispatch_p_pnp(Interp *,
		 PMC *left, FLOATVAL right, PMC *dest, INTVAL function)>

Like above, right argument is a native FLOATVAL.

=item C<PMC*
mmd_dispatch_p_psp(Interp *,
		 PMC *left, STRING *right, PMC *dest, INTVAL function)>

Like above, right argument is a native STRING *.

=cut

=item C<void
mmd_dispatch_v_pp(Interp *, PMC *left, PMC *right, INTVAL function)>

=item C<void
mmd_dispatch_v_pi(Interp *, PMC *left, INTVAL right, INTVAL function)>

=item C<void
mmd_dispatch_v_pn(Interp *, PMC *left, FLOATVAL right, INTVAL function)>

=item C<void
mmd_dispatch_v_ps(Interp *, PMC *left, STRING *right, INTVAL function)>

Inplace dispatch functions for C<< left <op=> right >>.

*/

static PMC*
mmd_wrap_p_ppp(Interp *interpreter, PMC *nci, PMC *right, PMC *dest) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *r, *d, *n = NULL;
    mmd_f_p_ppp real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
        n = left;
    }
    else
        l = left;
    if (isa_deleg_pmc(interpreter, right)) {
        attrib_array = PMC_data(right);
        r = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
        n = right;
    }
    else
        r = right;
    if (dest && isa_deleg_pmc(interpreter, dest)) {
        attrib_array = PMC_data(dest);
        d = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else {
        d = dest;
        attrib_array = NULL;
    }
    real_function = (mmd_f_p_ppp)D2FPTR(PMC_struct_val(nci));
    d = (real_function)(interpreter, l, r, d);
    if (attrib_array) {
        attrib_array[POD_FIRST_ATTRIB] = d;
        return dest;
    }
    if (!n)
        return d;
    dest = VTABLE_clone(interpreter, n);
    attrib_array = PMC_data(dest);
    attrib_array[POD_FIRST_ATTRIB] = d;
    return dest;

}

PMC*
mmd_dispatch_p_ppp(Interp *interpreter,
		 PMC *left, PMC *right, PMC *dest, INTVAL func_nr)
{
    mmd_f_p_ppp real_function;
    PMC *sub;
    int is_pmc;

    real_function = (mmd_f_p_ppp)get_mmd_dispatcher(interpreter,
            left, right, func_nr, &is_pmc);

    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    right->vtable->base_type,
                    D2FPTR((UINTVAL) sub | 3));
#if 0
            mmd_create_builtin_multi_meth_2(interpreter,
                func_nr, left->vtable->base_type,
                right->vtable->base_type, (funcptr_t)mmd_wrap_p_ppp);
#endif
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            return mmd_wrap_p_ppp(interpreter, sub, right, dest);
        }
        if (dest)
            return Parrot_runops_fromc_args(interpreter, sub, "PPPP",
                    left, right, dest);
        else
            return Parrot_runops_fromc_args(interpreter, sub, "PPP",
                    left, right);
    }
    else {
        return (*real_function)(interpreter, left, right, dest);
    }
}

static PMC*
mmd_wrap_p_pip(Interp *interpreter, PMC *nci, INTVAL right, PMC *dest) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *d, *n = NULL;
    mmd_f_p_pip real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
        n = left;
    }
    else
        l = left;
    if (dest && isa_deleg_pmc(interpreter, dest)) {
        attrib_array = PMC_data(dest);
        d = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else {
        d = dest;
        attrib_array = NULL;
    }
    real_function = (mmd_f_p_pip)D2FPTR(PMC_struct_val(nci));
    d = (real_function)(interpreter, l, right, d);
    if (attrib_array) {
        attrib_array[POD_FIRST_ATTRIB] = d;
        return dest;
    }
    if (!n)
        return d;
    dest = VTABLE_clone(interpreter, n);
    attrib_array = PMC_data(dest);
    attrib_array[POD_FIRST_ATTRIB] = d;
    return dest;

}

PMC*
mmd_dispatch_p_pip(Interp *interpreter,
		 PMC *left, INTVAL right, PMC *dest, INTVAL func_nr)
{
    mmd_f_p_pip real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_p_pip)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_INTVAL, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_INTVAL,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            return mmd_wrap_p_pip(interpreter, sub, right, dest);
        }
        if (dest)
            return Parrot_runops_fromc_args(interpreter, sub, "PPIP",
                    left, right, dest);
        else
            return Parrot_runops_fromc_args(interpreter, sub, "PPI",
                    left, right);
    }
    else {
        return (*real_function)(interpreter, left, right, dest);
    }
}

static PMC*
mmd_wrap_p_pnp(Interp *interpreter, PMC *nci, FLOATVAL right, PMC *dest) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *d, *n = NULL;
    mmd_f_p_pnp real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
        n = left;
    }
    else
        l = left;
    if (dest && isa_deleg_pmc(interpreter, dest)) {
        attrib_array = PMC_data(dest);
        d = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else {
        d = dest;
        attrib_array = NULL;
    }
    real_function = (mmd_f_p_pnp)D2FPTR(PMC_struct_val(nci));
    d = (real_function)(interpreter, l, right, d);
    if (attrib_array) {
        attrib_array[POD_FIRST_ATTRIB] = d;
        return dest;
    }
    if (!n)
        return d;
    dest = VTABLE_clone(interpreter, n);
    attrib_array = PMC_data(dest);
    attrib_array[POD_FIRST_ATTRIB] = d;
    return dest;

}

PMC*
mmd_dispatch_p_pnp(Interp *interpreter,
		 PMC *left, FLOATVAL right, PMC *dest, INTVAL func_nr)
{
    mmd_f_p_pnp real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_p_pnp)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_FLOATVAL, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_FLOATVAL,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            return mmd_wrap_p_pnp(interpreter, sub, right, dest);
        }
        if (dest)
            return Parrot_runops_fromc_args(interpreter, sub, "PPNP",
                    left, right, dest);
        else
            return Parrot_runops_fromc_args(interpreter, sub, "PPN",
                    left, right);
    }
    else {
        return (*real_function)(interpreter, left, right, dest);
    }
}

static PMC*
mmd_wrap_p_psp(Interp *interpreter, PMC *nci, STRING *right, PMC *dest) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *d, *n = NULL;
    mmd_f_p_psp real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
        n = left;
    }
    else
        l = left;
    if (dest && isa_deleg_pmc(interpreter, dest)) {
        attrib_array = PMC_data(dest);
        d = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else {
        d = dest;
        attrib_array = NULL;
    }
    real_function = (mmd_f_p_psp)D2FPTR(PMC_struct_val(nci));
    d = (real_function)(interpreter, l, right, d);
    if (attrib_array) {
        attrib_array[POD_FIRST_ATTRIB] = d;
        return dest;
    }
    if (!n)
        return d;
    dest = VTABLE_clone(interpreter, n);
    attrib_array = PMC_data(dest);
    attrib_array[POD_FIRST_ATTRIB] = d;
    return dest;

}
PMC*
mmd_dispatch_p_psp(Interp *interpreter,
		 PMC *left, STRING *right, PMC *dest, INTVAL func_nr)
{
    mmd_f_p_psp real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_p_psp)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_STRING, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_STRING,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            return mmd_wrap_p_psp(interpreter, sub, right, dest);
        }
        if (dest)
            return Parrot_runops_fromc_args(interpreter, sub, "PPSP",
                    left, right, dest);
        else
            return Parrot_runops_fromc_args(interpreter, sub, "PPS",
                    left, right);
    }
    else {
        return (*real_function)(interpreter, left, right, dest);
    }
}

static void
mmd_wrap_v_pp(Interp *interpreter, PMC *nci, PMC *right) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *r;
    mmd_f_v_pp real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        l = left;
    if (isa_deleg_pmc(interpreter, right)) {
        attrib_array = PMC_data(right);
        r = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        r = right;
    real_function = (mmd_f_v_pp)D2FPTR(PMC_struct_val(nci));
    (real_function)(interpreter, l, r);
}

/*
 * inplace variants
 */
void
mmd_dispatch_v_pp(Interp *interpreter,
		 PMC *left, PMC *right, INTVAL func_nr)
{
    mmd_f_v_pp real_function;
    PMC *sub;
    int is_pmc;

    real_function = (mmd_f_v_pp)get_mmd_dispatcher(interpreter,
            left, right, func_nr, &is_pmc);

    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    right->vtable->base_type,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            mmd_wrap_v_pp(interpreter, sub, right);
            return;
        }
        Parrot_runops_fromc_args(interpreter, sub, "vPP", left, right);
    }
    else {
        (*real_function)(interpreter, left, right);
    }
}

static void
mmd_wrap_v_pi(Interp *interpreter, PMC *nci, INTVAL right) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l;
    mmd_f_v_pi real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        l = left;
    assert(l != left);
    real_function = (mmd_f_v_pi)D2FPTR(PMC_struct_val(nci));
    (real_function)(interpreter, l, right);
}

void
mmd_dispatch_v_pi(Interp *interpreter,
		 PMC *left, INTVAL right, INTVAL func_nr)
{
    mmd_f_v_pi real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_pi)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_INTVAL, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_INTVAL,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            mmd_wrap_v_pi(interpreter, sub, right);
            return;
        }
        Parrot_runops_fromc_args(interpreter, sub, "vPI", left, right);
    }
    else {
        (*real_function)(interpreter, left, right);
    }
}

static void
mmd_wrap_v_pn(Interp *interpreter, PMC *nci, FLOATVAL right) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l;
    mmd_f_v_pn real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        l = left;
    assert(l != left);
    real_function = (mmd_f_v_pn)D2FPTR(PMC_struct_val(nci));
    (real_function)(interpreter, l, right);
}

void
mmd_dispatch_v_pn(Interp *interpreter,
		 PMC *left, FLOATVAL right, INTVAL func_nr)
{
    mmd_f_v_pn real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_pn)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_FLOATVAL, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_FLOATVAL,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            mmd_wrap_v_pn(interpreter, sub, right);
            return;
        }
        Parrot_runops_fromc_args(interpreter, sub, "vPN", left, right);
    }
    else {
        (*real_function)(interpreter, left, right);
    }
}

static void
mmd_wrap_v_ps(Interp *interpreter, PMC *nci, STRING* right) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l;
    mmd_f_v_ps real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        l = left;
    assert(l != left);
    real_function = (mmd_f_v_ps)D2FPTR(PMC_struct_val(nci));
    (real_function)(interpreter, l, right);
}
void
mmd_dispatch_v_ps(Interp *interpreter,
		 PMC *left, STRING *right, INTVAL func_nr)
{
    mmd_f_v_ps real_function;
    PMC *sub;
    int is_pmc;
    UINTVAL left_type;

    left_type = left->vtable->base_type;
    real_function = (mmd_f_v_ps)get_mmd_dispatch_type(interpreter,
            func_nr, left_type, enum_type_STRING, &is_pmc);
    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    enum_type_STRING,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            mmd_wrap_v_ps(interpreter, sub, right);
            return;
        }
        Parrot_runops_fromc_args(interpreter, sub, "vPS", left, right);
    }
    else {
        (*real_function)(interpreter, left, right);
    }
}

static INTVAL
mmd_wrap_i_pp(Interp *interpreter, PMC *nci, PMC *right) {
    PMC *left = PMC_pmc_val(nci);
    PMC *l, *r;
    mmd_f_i_pp real_function;
    SLOTTYPE *attrib_array;

    if (isa_deleg_pmc(interpreter, left)) {
        attrib_array = PMC_data(left);
        l = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        l = left;
    if (isa_deleg_pmc(interpreter, right)) {
        attrib_array = PMC_data(right);
        r = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    }
    else
        r = right;
    real_function = (mmd_f_i_pp)D2FPTR(PMC_struct_val(nci));
    return (real_function)(interpreter, l, r);
}
/*

=item C<INTVAL
mmd_dispatch_i_pp(Interp *interpreter,
		 PMC *left, PMC *right, INTVAL func_nr)>

Like C<mmd_dispatch_p_ppp()>, only it returns an C<INTVAL>. This is used
by MMD compare functions.

=cut

*/

INTVAL
mmd_dispatch_i_pp(Interp *interpreter,
		 PMC *left, PMC *right, INTVAL func_nr)
{
    mmd_f_i_pp real_function;
    PMC *sub;
    int is_pmc;
    INTVAL ret;

    real_function = (mmd_f_i_pp)get_mmd_dispatcher(interpreter,
            left, right, func_nr, &is_pmc);

    if (is_pmc) {
        sub = (PMC*)real_function;
        if (is_pmc == 2) {
            /* mmd_register the wrapper */
            mmd_register(interpreter, func_nr, left->vtable->base_type,
                    right->vtable->base_type,
                    D2FPTR((UINTVAL) sub | 3));
            is_pmc = 3;
        }
        if (is_pmc == 3) {
            PMC_pmc_val(sub) = left;
            return mmd_wrap_i_pp(interpreter, sub, right);
        }
        ret = Parrot_runops_fromc_args_reti(interpreter, sub, "IPP",
                left, right);
    }
    else {
        ret = (*real_function)(interpreter, left, right);
    }
    return ret;
}

int
Parrot_run_maybe_mmd_meth(Interp* interpreter, PMC *object,
        STRING *meth)
{

#if 1
    return 0;   /* TODO */
#else
    INTVAL mmd_func;
    char *c_meth, *c_sig;
    int ret = 0, inplace, compare;


    /*
     * check if it's a known MMD function
     */
    c_meth = string_to_cstring(interpreter, meth);
    c_sig = string_to_cstring(interpreter, sig);
    if ( (mmd_func = Parrot_MMD_method_idx(interpreter, c_meth)) >= 0) {
        /* yep - run it instantly */
        ret = 1;
        inplace = c_meth[2] == 'i' && c_meth[3] == '_';
        compare = mmd_func >= MMD_EQ && mmd_func <= MMD_STRCMP;
        assert(c_sig[0] == 'O');
        switch (c_sig[1]) {
            case 'P':
                if (inplace)
                    mmd_dispatch_v_pp(interpreter,
                            object, REG_PMC(5), mmd_func);
                else if (compare)
                    REG_INT(5) = mmd_dispatch_i_pp(interpreter,
                            object, REG_PMC(5), mmd_func);
                else
                    REG_PMC(5) = mmd_dispatch_p_ppp(interpreter,
                            object, REG_PMC(5), NULL, mmd_func);
                break;
            case 'I':
                if (inplace)
                    mmd_dispatch_v_pi(interpreter,
                            object, REG_INT(5), mmd_func);
                else
                    REG_PMC(5) = mmd_dispatch_p_pip(interpreter,
                            object, REG_INT(5), NULL, mmd_func);
                break;
            case 'N':
                if (inplace)
                    mmd_dispatch_v_pn(interpreter,
                            object, REG_NUM(5), mmd_func);
                else
                    REG_PMC(5) = mmd_dispatch_p_pnp(interpreter,
                            object, REG_NUM(5), NULL, mmd_func);
                break;
            case 'S':
                if (inplace)
                    mmd_dispatch_v_ps(interpreter,
                            object, REG_STR(5), mmd_func);
                else
                    REG_PMC(5) = mmd_dispatch_p_psp(interpreter,
                            object, REG_STR(5), NULL, mmd_func);
                break;
        }

    }
    string_cstring_free(c_meth);
    string_cstring_free(c_sig);
    return ret;
#endif
}


/*

=item C<void
mmd_add_function(Interp *interpreter,
        INTVAL funcnum, funcptr_t function)>

Add a new binary MMD function to the list of functions the MMD system knows
of. C<func_num> is the number of the new function. C<function> is ignored.

TODO change this to a MMD register interface that takes a function *name*.

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
        }
        interpreter->n_binop_mmd_funcs = func_nr + 1;
    }

}

/*

=item C<static void
mmd_expand_x(Interp *interpreter, INTVAL func_nr, INTVAL new_x)>

Expands the function table in the X dimension to include C<new_x>.

=cut

*/

static void
mmd_expand_x(Interp *interpreter, INTVAL func_nr, INTVAL new_x)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    UINTVAL i;
    MMD_table *table = interpreter->binop_mmd_funcs + func_nr;
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

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * y * new_x);
    for (i = 0; i < y * new_x; i++) {
        new_table[i] = NULL;
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
mmd_expand_y(Interp *interpreter, INTVAL func_nr, INTVAL new_y)>

Expands the function table in the Y direction.

=cut

*/

static void
mmd_expand_y(Interp *interpreter, INTVAL func_nr, INTVAL new_y)
{
    funcptr_t *new_table;
    UINTVAL x;
    UINTVAL y;
    UINTVAL i;
    MMD_table *table = interpreter->binop_mmd_funcs + func_nr;

    x = table->x;
    assert(x);
    y = table->y;

    /* First, fill in the whole new table with the default function
       pointer. We only really need to do the new part, but... */
    new_table = mem_sys_allocate(sizeof(funcptr_t) * x * new_y);
    for (i = 0; i < x * new_y; i++) {
        new_table[i] = NULL;
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
             INTVAL func_nr,
             INTVAL left_type, INTVAL right_type,
             funcptr_t funcptr)
{

    INTVAL offset;
    MMD_table *table;

    assert(func_nr < (INTVAL)interpreter->n_binop_mmd_funcs);
    assert(left_type >= 0);
    assert(right_type >=0 ||
            (right_type >= enum_type_INTVAL && right_type <= enum_type_PMC));
    if (right_type < 0)
        right_type -= enum_type_INTVAL;
    else
        right_type += 4;
    table = interpreter->binop_mmd_funcs + func_nr;
    if ((INTVAL)table->x <= left_type) {
        mmd_expand_x(interpreter, func_nr, left_type + 1);
    }

    if ((INTVAL)table->y <= right_type) {
        mmd_expand_y(interpreter, func_nr, right_type + 1);
    }

    offset = table->x * right_type + left_type;
    table->mmd_funcs[offset] = funcptr;
}

void
mmd_register_sub(Interp *interpreter,
             INTVAL func_nr,
             INTVAL left_type, INTVAL right_type,
             PMC *sub)
{
    PMC *fake;
    if (sub->vtable->base_type == enum_class_CSub) {
        /* returned from mmdvt_find */
        mmd_register(interpreter, func_nr, left_type, right_type,
                D2FPTR(PMC_struct_val(sub)));
    }
    else {
        fake = (PMC*)((UINTVAL) sub | 1);
        mmd_register(interpreter, func_nr, left_type, right_type, D2FPTR(fake));
    }
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
mmd_vtfind(Parrot_Interp interpreter, INTVAL func_nr, INTVAL left, INTVAL right) {
    int is_pmc;
    PMC *f;
    funcptr_t func = get_mmd_dispatch_type(interpreter,
            func_nr, left, right, &is_pmc);
    if (func && is_pmc) {
        /* TODO if is_pmc == 2 a Bound_NCI is returned, which actually
         * should be filled with one of the wrapper functions
         */
        return (PMC*)F2DPTR(func);
    }
    f = pmc_new(interpreter, enum_class_CSub);
    PMC_struct_val(f) = F2DPTR(func);
    return f;
}


static PMC* mmd_arg_tuple_inline(Interp *, STRING *signature, va_list args);
static PMC* mmd_arg_tuple_func(Interp *);
static PMC* mmd_search_default(Interp *, STRING *meth, PMC *arg_tuple);
static PMC* mmd_search_scopes(Interp *, STRING *meth, PMC *arg_tuple);
static void mmd_search_classes(Interp *, STRING *meth, PMC *arg_tuple, PMC *,
        INTVAL start);
static int  mmd_search_lexical(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_package(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_search_global(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static void mmd_search_builtin(Interp *, STRING *meth, PMC *arg_tuple, PMC *);
static int  mmd_maybe_candidate(Interp *, PMC *pmc, PMC *arg_tuple, PMC *cl);
static void mmd_sort_candidates(Interp *, PMC *arg_tuple, PMC *cl);

/*

=item C<PMC *Parrot_MMD_search_default_inline(Interp *, STRING *meth, STRING *signature, ...)>

Default implementation of MMD lookup. The signature contains the letters
"INSP" for the argument types. B<PMC> arguments are given in the function call.

=item C<PMC *Parrot_MMD_search_default_func(Interp *, STRING *meth)>

Default implementation of MMD lookup. The signature contains the letters
"INSP" for the argument types. B<PMC> arguments are taken from registers
C<P5> and up according to calling conventions.

=cut

*/

/*
 * TODO move to header, when API is sane
 */

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
Parrot_MMD_search_default_func(Interp *interpreter, STRING *meth)
{
    PMC* arg_tuple;
    /*
     * 1) create argument tuple
     */
    arg_tuple = mmd_arg_tuple_func(interpreter);
    /*
     * default search policy
     */
    return mmd_search_default(interpreter, meth, arg_tuple);
}

PMC *
Parrot_MMD_search_default_infix(Interp *interpreter, STRING *meth,
        INTVAL left_type, INTVAL right_type)
{
    PMC* arg_tuple;

    arg_tuple = pmc_new(interpreter, enum_class_FixedIntegerArray);
    VTABLE_set_integer_native(interpreter, arg_tuple, 2);
    VTABLE_set_integer_keyed_int(interpreter, arg_tuple, 0, left_type);
    VTABLE_set_integer_keyed_int(interpreter, arg_tuple, 1, right_type);
    return mmd_search_default(interpreter, meth, arg_tuple);
}

/*

=item C<PMC* Parrot_MMD_dispatch_func(Interp *, PMC *multi)>

Given a multi sub PMC (usually the multi method of one class) return the
best matching function for the call signature and call arguments according
to pdd03.

=cut

*/

PMC *
Parrot_MMD_dispatch_func(Interp *interpreter, PMC *multi, STRING *meth)
{
    PMC* arg_tuple, *pmc;
    PMC *candidate_list;
    INTVAL n;
    /*
     * 1) create argument tuple
     */
    arg_tuple = mmd_arg_tuple_func(interpreter);

    n = VTABLE_elements(interpreter, multi);
    if (!n)
        return NULL;

    candidate_list = VTABLE_clone(interpreter, multi);
    /*
     * 4) go through all parents of MRO and check for methods
     *    where the first argument matches
     *
     *    XXX do we need this?
     */
    if (meth)
        mmd_search_classes(interpreter, meth, arg_tuple, candidate_list, 1);
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

=item C<
static PMC* mmd_arg_tuple_inline(Interp *, STRING *signature, va_list args)>

Return a list of argument types. PMC arguments are specified as function
arguments.

=item C<
static PMC* mmd_arg_tuple_func(Interp *)>

Return a list of argument types. PMC arguments are take from registers
according to calling conventions.

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
            case 'O':
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
mmd_arg_tuple_func(Interp *interpreter)
{
    INTVAL sig_len, i, type, idx;
    PMC* arg_tuple, *arg;
    PMC* args_array;    /* from recent set_args opcode */
    opcode_t *args_op;
    struct PackFile_Constant **constants;

    /*
     * if there is no signature e.g. because of
     *      m = getattribute l, "__add"
     * - we have to return the MultiSub
     * - create a BoundMulit
     * - dispatch in invoke - yeah ugly
     */

    arg_tuple = pmc_new(interpreter, enum_class_FixedIntegerArray);
    args_op = interpreter->current_args;
    if (!args_op)
        return arg_tuple;
    assert(*args_op == PARROT_OP_set_args_pc);
    constants = interpreter->code->const_table->constants;
    ++args_op;
    args_array = constants[*args_op]->u.key;
    assert(args_array->vtable->base_type == enum_class_FixedIntegerArray);
    sig_len = VTABLE_elements(interpreter, args_array);
    if (!sig_len)
        return arg_tuple;
    VTABLE_set_integer_native(interpreter, arg_tuple, sig_len);
    ++args_op;

    for (i = 0; i < sig_len; ++i, ++args_op) {
        type = VTABLE_get_integer_keyed_int(interpreter, args_array, i);
        switch (type & PARROT_ARG_TYPE_MASK) {
            case PARROT_ARG_INTVAL:
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_INTVAL);
                break;
            case PARROT_ARG_FLOATVAL:
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_FLOATVAL);
                break;
            case PARROT_ARG_STRING:
                VTABLE_set_integer_keyed_int(interpreter, arg_tuple,
                        i, enum_type_STRING);
                break;
            case PARROT_ARG_PMC:
                idx = *args_op;
                if ((type & PARROT_ARG_CONSTANT))
                    arg = constants[idx]->u.key;
                else
                    arg = REG_PMC(idx);
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
class hierarchy, sort all candidates by their Manhattan distance, and return
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
    mmd_search_classes(interpreter, meth, arg_tuple, candidate_list, 0);
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

=item C<static void mmd_search_classes(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl, INTVAL start_at_parent)>

Search all the classes in all MultiSubs of the candidates C<cl> and return
a list of all candidates. C<start_at_parent> is 0 to start at the class itself
or 1 to search from the first parent class.

=cut

*/

static void
mmd_search_classes(Interp *interpreter, STRING *meth, PMC *arg_tuple,
        PMC *cl, INTVAL start_at_parent)
{
    PMC *pmc, *mro, *class;
    INTVAL i, n, type1;

    /*
     * get the class of the first argument
     */
    type1 = VTABLE_get_integer_keyed_int(interpreter, arg_tuple, 0);
    if (type1 < 0) {
        return;
        internal_exception(1, "unimplemented native MMD type");
        /* TODO create some class namespace */
    }
    else {
        mro = Parrot_base_vtables[type1]->mro;
        n = VTABLE_elements(interpreter, mro);
        for (i = start_at_parent; i < n; ++i) {
            class = VTABLE_get_pmc_keyed_int(interpreter, mro, i);
            pmc = Parrot_find_method_with_cache(interpreter, class, meth);
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
    short da = (short)a & 0xffff;
    short db = (short)b & 0xffff;
    /* sort first by distance */
    if (da > db)
        return 1;
    if (da < db)
        return -1;
    /* end then by index in candidate list */
    da = (short)(a >> 16);
    db = (short)(b >> 16);
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

    if (pmc->vtable->base_type == enum_class_NCI) {
        /* has to be a builtin multi method */
        multi_sig = PMC_pmc_val(pmc);
    }
    else if (pmc->vtable->base_type == enum_class_Sub) {
        multi_sig = PMC_sub(pmc)->multi_signature;
        if (!multi_sig) {
            /* some method */
            return 0;
        }
        if (multi_sig->vtable->base_type == enum_class_FixedStringArray) {
            multi_sig = PMC_sub(pmc)->multi_signature =
                mmd_cvt_to_types(interpreter, multi_sig);
        }
    }
    else
        return MMD_BIG_DISTANCE;
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
        dist = 1000;   /* XXX arbitrary > max_class_depth * n */
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
         * in the MRO of the type_call
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
        if (j == m && type_sig != enum_type_PMC) {
            dist = MMD_BIG_DISTANCE;
            break;
        }
        ++dist;
#if MMD_DEBUG
        {
            STRING *s1, *s2;
            PMC *c;
            if (type_sig < 0)
                s1 = Parrot_get_datatype_name(interpreter, type_sig);
            else {
                c = Parrot_base_vtables[type_sig]->class;
                s1 = VTABLE_namespace_name(interpreter, c);
            }
            if (type_call < 0)
                s2 = Parrot_get_datatype_name(interpreter, type_call);
            else {
                c = Parrot_base_vtables[type_call]->class;
                s2 = VTABLE_namespace_name(interpreter, c);
            }
            PIO_eprintf(interpreter, "arg %d: dist %d sig %Ss arg %Ss\n",
                i, dist, s1, s2);
        }
#endif
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
    INTVAL i, n, d;
    PMC *nci, *pmc, *sort;
    INTVAL *helper;
    PMC **data;

    n = VTABLE_elements(interpreter, cl);
    /*
     * create a helper structure:
     * bits 0..15  = distance
     * bits 16..31 = idx in candidate list
     *
     * TODO use half of available INTVAL bits
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
    Parrot_FixedPMCArray_sort(interpreter, sort, nci);
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
        helper[i] = (INTVAL)data[idx];
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
    /*
     * XXX disabled during LexPad / ScratchPad transisition
    stop = mmd_search_lexical(interpreter, meth, arg_tuple, candidate_list);
    if (stop)
        return candidate_list;
     */
    stop = mmd_search_package(interpreter, meth, arg_tuple, candidate_list);
    if (stop)
        return candidate_list;
    stop = mmd_search_global(interpreter, meth, arg_tuple, candidate_list);
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
    /* TODO */
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
    /* STRING *namespace = CONTEXT(interpreter->ctx)->current_package; */
    PMC *pmc;
    PMC *current_sub;
    PMC *namespace;

    current_sub = CONTEXT(interpreter->ctx)->current_sub;
    if (!current_sub || !VTABLE_defined(interpreter, current_sub))
        return 0;
    namespace = PMC_sub(current_sub)->namespace;
    if (!namespace)
        return 0;
    pmc = Parrot_find_global_p(interpreter, namespace, meth);
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

=item C<static void mmd_search_builtin(Interp *, STRING *meth, PMC *arg_tuple, PMC *cl)>

Search the builtin namespace for matching candidates. This is the last
search in all the namespaces.

=cut

*/

static void
mmd_search_builtin(Interp *interpreter, STRING *meth, PMC *arg_tuple, PMC *cl)
{
    PMC *pmc;
    STRING *ns;

    ns = CONST_STRING(interpreter, "__parrot_core");
    pmc = Parrot_find_global(interpreter, ns, meth);
    if (pmc)
        mmd_maybe_candidate(interpreter, pmc, arg_tuple, cl);
}

static void
mmd_create_builtin_multi_stub(Interp *interpreter, INTVAL func_nr)
{
    const char *name;
    STRING *s, *ns;
    PMC *multi;

    name = Parrot_MMD_method_name(interpreter, func_nr);
    ns = CONST_STRING(interpreter, "__parrot_core");
    s =  const_string(interpreter, name);
    /* create in constant pool */
    multi = constant_pmc_new(interpreter, enum_class_MultiSub);
    Parrot_store_global(interpreter, ns, s, multi);
}

static void
mmd_create_builtin_multi_meth_2(Interp *interpreter,
        INTVAL func_nr, INTVAL type, INTVAL right, funcptr_t func_ptr)
{
    const char *short_name;
    char signature[6], val_sig;
    STRING *meth_name, *ns, *_sub;
    PMC *method, *multi, *class, *multi_sig;

    assert (type != enum_class_Null && type != enum_class_delegate &&
            type != enum_class_Ref  && type != enum_class_SharedRef &&
            type != enum_class_deleg_pmc && type != enum_class_ParrotClass &&
            type != enum_class_ParrotObject);
    short_name = Parrot_MMD_method_name(interpreter, func_nr);
    /*
     * _int, _float, _str are just native variants of the base
     * multi
     */
    val_sig = 'P';
    if (right == enum_type_INTVAL)
        val_sig = 'I';
    else if (right == enum_type_STRING)
        val_sig = 'S';
    else if (right == enum_type_FLOATVAL)
        val_sig = 'N';

    /*
     * create NCI method in left class
     */
    strcpy(signature, "PJP.P");
    signature[3] = val_sig;
    if (func_nr >= MMD_EQ && func_nr <= MMD_STRCMP) {
        signature[0] = 'I';
        signature[4] = '\0';
    }
    /* implace infix like __i_add don't return a result */
    if (memcmp(short_name, "__i_", 4) == 0)
        signature[0] = 'v';
    meth_name = const_string(interpreter, short_name);
    class = Parrot_base_vtables[type]->class;
    method = Parrot_find_method_with_cache(interpreter, class, meth_name);
    if (!method) {
        /* first method */
        method = constant_pmc_new(interpreter, enum_class_NCI);
        VTABLE_set_pointer_keyed_str(interpreter, method,
                const_string(interpreter, signature),
                F2DPTR(func_ptr));
        VTABLE_add_method(interpreter, class, meth_name, method);
    }
    else {
        _sub = CONST_STRING(interpreter, "Sub");
        /* multiple methods with that same name */
        if (method->vtable->base_type == enum_class_NCI) {
            /* convert first to a multi */
            multi = constant_pmc_new(interpreter, enum_class_MultiSub);
            VTABLE_add_method(interpreter, class, meth_name, multi);
            VTABLE_push_pmc(interpreter, multi, method);
        }
        else {
            assert(method->vtable->base_type == enum_class_MultiSub);
            multi = method;
        }
        method = constant_pmc_new(interpreter, enum_class_NCI);
        VTABLE_set_pointer_keyed_str(interpreter, method,
                const_string(interpreter, signature),
                F2DPTR(func_ptr));
        VTABLE_push_pmc(interpreter, multi, method);
    }
    /* mark MMD */
    PObj_get_FLAGS(method) |= PObj_private0_FLAG;
    /*
     * attach the multi_signature array to PMC_pmc_val
     */
    multi_sig = constant_pmc_new(interpreter, enum_class_FixedIntegerArray);
    VTABLE_set_integer_native(interpreter, multi_sig, 2);
    VTABLE_set_integer_keyed_int(interpreter, multi_sig, 0, type);
    VTABLE_set_integer_keyed_int(interpreter, multi_sig, 1, right);
    PMC_pmc_val(method) = multi_sig;

    /*
     * push method onto core multi_sub
     * TODO cache the namespace
     */
    ns = CONST_STRING(interpreter, "__parrot_core");
    multi = Parrot_find_global(interpreter, ns,
            const_string(interpreter, short_name));
    assert(multi);
    VTABLE_push_pmc(interpreter, multi, method);

}

static void
mmd_create_builtin_multi_meth(Interp *interpreter, INTVAL type,
        const MMD_init *entry)
{
    mmd_create_builtin_multi_meth_2(interpreter,
            entry->func_nr, type, entry->right, entry->func_ptr);
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
         * pre-allocate the function table
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
        mmd_register(interpreter,
                mmd_table[i].func_nr, type,
                mmd_table[i].right, mmd_table[i].func_ptr);
        mmd_create_builtin_multi_meth(interpreter, type, mmd_table + i);
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
    MMD_table *table;
    UINTVAL i;

    if (!interpreter->binop_mmd_funcs)
        return;
    table = interpreter->binop_mmd_funcs + func_nr;
    if (!table)
        return;

    /* TODO specific parts of table
     * the type and it's mro and
     * all classes that inherit from type
     */
    for (i = 0; i < table->x * table->y; ++i)
        table->mmd_funcs[i] = NULL;
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
