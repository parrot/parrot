/*
Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/py_func.c - Python functions

=head1 DESCRIPTION

Python functions.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "py_func.str"
#include <assert.h>

/*

Python Library Reference 2.1 Built-in Functions

*/

static PMC* parrot_py_get_attr_str(Interp*, PMC *object, STRING *name);
static PMC* parrot_py_get_attr_num(Interp*, PMC *object, INTVAL nr);
static void parrot_py_set_attr_str(Interp*, PMC *object, STRING *name, PMC*);
static void parrot_py_set_attr_num(Interp*, PMC *object, INTVAL nr, PMC*);

static PMC *
parrot_py_callable(Interp *interpreter, PMC *pmc)
{
    PMC *b = pmc_new(interpreter, enum_class_Boolean);
    int i;
    switch (pmc->vtable->base_type) {
	case enum_class_Sub:
	case enum_class_Closure:
	case enum_class_Continuation:
	case enum_class_Coroutine:
	case enum_class_NCI:
	    i = 1;
            break;
        default:
            i = 0;
    }
    PMC_int_val(b) = i;
    return b;
}

static PMC *
parrot_py_chr(Interp *interpreter, PMC *pmc)
{
    PMC *s = pmc_new_noinit(interpreter, enum_class_PerlString);
    INTVAL i = VTABLE_get_integer(interpreter, pmc);
    /*
     * TODO if i < 0 || > 255 throgh ValueError
     */
    PMC_str_val(s) = string_chr(interpreter, (UINTVAL)i);
    PObj_custom_mark_SET(s);
    return s;
}

static INTVAL
parrot_py_cmp(Interp *interpreter, PMC *left, PMC *right)
{
    return mmd_dispatch_i_pp(interpreter, left, right, MMD_CMP);
}

static void
dict_from_tuple_array(Interp *interpreter, PMC *dict, PMC *ar)
{
    INTVAL i, el;
    /*
     * ar is an array of tuples which are key/value pairs
     */
    el = VTABLE_elements(interpreter, ar);
    for (i = 0; i < el; ++i) {
        PMC *tupl = VTABLE_get_pmc_keyed_int(interpreter, ar, i);
        PMC *key, *value;
        INTVAL n = VTABLE_elements(interpreter, tupl);
        if (n != 2)
            real_exception(interpreter, NULL, E_ValueError,
                    "dictionary update sequence element #%d "
                    "has length %d; 2 is required",
                    (int)i, (int)n);
        key = VTABLE_get_pmc_keyed_int(interpreter, tupl, 0);
        value = VTABLE_get_pmc_keyed_int(interpreter, tupl, 1);
        VTABLE_set_pmc_keyed(interpreter, dict, key, value);
    }
}

void
Parrot_py_fill_dict(Interp *interpreter, PMC *dict, PMC *arg)
{
    switch (arg->vtable->base_type) {
        case enum_class_FixedPMCArray:  /* sequence from BUILD_TUPLE */
        case enum_class_PerlArray:
        case enum_class_ResizablePMCArray:/* sequence from BUILD_LIST */
            dict_from_tuple_array(interpreter, dict, arg);
            break;
        default:
            internal_exception(1, "Unimplemented dict argument");
    }
}

#define VTABLE_modulus(i,l,r,d) mmd_dispatch_v_ppp(i,l,r,d,MMD_MOD)
#define VTABLE_subtract(i,l,r,d) mmd_dispatch_v_ppp(i,l,r,d,MMD_SUBTRACT)
#define VTABLE_divide(i,l,r,d) mmd_dispatch_v_ppp(i,l,r,d,MMD_DIVIDE)
static PMC *
parrot_py_divmod(Interp *interpreter, PMC *nom, PMC *denom)
{
    PMC *tupl = pmc_new(interpreter, enum_class_FixedPMCArray);
    PMC *pmod =  pmc_new(interpreter, enum_class_PerlInt);
    PMC *pdiv =  pmc_new(interpreter, enum_class_PerlInt);
    VTABLE_modulus(interpreter, nom, denom, pmod);
    VTABLE_subtract(interpreter, nom, pmod, pdiv);
    VTABLE_divide(interpreter, pdiv, denom, pdiv);
    VTABLE_set_integer_native(interpreter, tupl, 2);
    VTABLE_set_pmc_keyed_int( interpreter, tupl, 0, pdiv);
    VTABLE_set_pmc_keyed_int( interpreter, tupl, 1, pmod);
    return tupl;
}


static PMC *
parrot_py_isa(Interp *interpreter, PMC *object, PMC *classinfo)
{
    return NULL;
}

#define VTABLE_cmp(i,l,r) mmd_dispatch_i_pp(i,l,r,MMD_CMP)
static PMC *
parrot_py_max(Interp *interpreter, PMC *argv)
{
    PMC *arg, *max, *iter;
    INTVAL i, n;
    /*
     * no arguments: bail out
     */
    if ((n = VTABLE_elements(interpreter, argv)) == 0)
        real_exception(interpreter, NULL, E_TypeError,
                "TypeError: max expected 1 arguments, got 0");
    if (n == 1) {
        /* argument must be iterable */
        arg = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
        iter = pmc_new_init(interpreter, enum_class_Iterator, arg);
        VTABLE_set_integer_native(interpreter, iter, 0);
        max = VTABLE_shift_pmc(interpreter, iter);
        while (VTABLE_get_bool(interpreter, iter)) {
            PMC *item = VTABLE_shift_pmc(interpreter, iter);
            if (VTABLE_cmp(interpreter, max, item) < 0)
                max = item;
        }
        return max;
    }
    /* got n items */
    max = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
    for (i = 1; i < n; ++i) {
        PMC *item = VTABLE_get_pmc_keyed_int(interpreter, argv, i);
        if (VTABLE_cmp(interpreter, max, item) < 0)
            max = item;
    }
    return max;

}

static PMC *
parrot_py_min(Interp *interpreter, PMC *argv)
{
    PMC *arg, *min, *iter;
    INTVAL i, n;
    /*
     * no arguments: bail out
     */
    if ((n = VTABLE_elements(interpreter, argv)) == 0)
        real_exception(interpreter, NULL, E_TypeError,
                "TypeError: min expected 1 arguments, got 0");
    if (n == 1) {
        /* argument must be iterable */
        arg = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
        iter = pmc_new_init(interpreter, enum_class_Iterator, arg);
        VTABLE_set_integer_native(interpreter, iter, 0);
        min = VTABLE_shift_pmc(interpreter, iter);
        while (VTABLE_get_bool(interpreter, iter)) {
            PMC *item = VTABLE_shift_pmc(interpreter, iter);
            if (VTABLE_cmp(interpreter, min, item) > 0)
                min = item;
        }
        return min;
    }
    /* got n items */
    min = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
    for (i = 1; i < n; ++i) {
        PMC *item = VTABLE_get_pmc_keyed_int(interpreter, argv, i);
        if (VTABLE_cmp(interpreter, min, item) > 0)
            min = item;
    }
    return min;
}

static PMC *
parrot_py_enumerate(Interp *interpreter, PMC *list)
{
    PMC *res = pmc_new_init(interpreter, enum_class_Enumerate, list);
    return res;
}

static PMC *
parrot_py_filter(Interp *interpreter, PMC *func, PMC *list)
{
    PMC *res, *iter;
    INTVAL i, n;
    STRING *s;
    INTVAL type;
    int none_func;

    type = list->vtable->base_type;
    iter = NULL;
    switch (type) {
        case enum_class_String:
        case enum_class_PerlString:
            res = pmc_new(interpreter, type);
            break;
        case enum_class_Iterator:
            iter = list;
            /* fall through */
        default:
            res = pmc_new(interpreter, enum_class_ResizablePMCArray);
            break;
    }
    if (!iter)
        iter = pmc_new_init(interpreter, enum_class_Iterator, list);
    VTABLE_set_integer_native(interpreter, iter, 0);
    i = 0;
    none_func = PMC_IS_NULL(func) ||
        func == Parrot_base_vtables[enum_class_None]->data;
    while (VTABLE_get_bool(interpreter, iter)) {
        PMC *item = VTABLE_shift_pmc(interpreter, iter);
        if (none_func) {
            if (!VTABLE_get_bool(interpreter, item))
                continue;
        }
        else {
            /* run filter func -
             * TODO save registers once around loop
             */
            PMC *t = Parrot_runops_fromc_args(interpreter, func, "PP", item);
            if (!VTABLE_get_bool(interpreter, t))
                continue;
        }
        VTABLE_set_pmc_keyed_int(interpreter, res, i++, item);
    }
    return res;
}

static PMC *
parrot_py_map(Interp *interpreter, PMC *func, PMC *list)
{
    PMC *res, *iter;
    INTVAL i, n;
    STRING *s;
    INTVAL type;
    int none_func;

    type = list->vtable->base_type;
    iter = NULL;
    switch (type) {
        case enum_class_String:
        case enum_class_PerlString:
            res = pmc_new(interpreter, type);
            break;
        case enum_class_Iterator:
            iter = list;
            /* fall through */
        default:
            res = pmc_new(interpreter, enum_class_ResizablePMCArray);
            break;
    }
    if (!iter)
        iter = pmc_new_init(interpreter, enum_class_Iterator, list);
    VTABLE_set_integer_native(interpreter, iter, 0);
    i = 0;
    none_func = PMC_IS_NULL(func) ||
        func == Parrot_base_vtables[enum_class_None]->data;
    while (VTABLE_get_bool(interpreter, iter)) {
        PMC *item = VTABLE_shift_pmc(interpreter, iter);
        if (!none_func) {
            /* run filter func -
             * TODO save registers once around loop
             */
            if (func->vtable->data == func) {
                REG_PMC(5) = item;
                REG_INT(3) = 1;
                VTABLE_invoke(interpreter, func, 0);
                item = REG_PMC(5);
                /* an object constructor */
            }
            else {
            item = Parrot_runops_fromc_args(interpreter, func, "PP", item);
            }
        }
        VTABLE_set_pmc_keyed_int(interpreter, res, i++, item);
    }
    return res;
}

static PMC *
parrot_py_reduce(Interp *interpreter, PMC *func, PMC *list /*, PMC *init */)
{
    PMC *res, *iter;
    INTVAL i, n;
    STRING *s;
    INTVAL type;
    int none_func;
    PMC *init = NULL;

    type = list->vtable->base_type;
    iter = NULL;
    switch (type) {
        case enum_class_String:
        case enum_class_PerlString:
            res = pmc_new(interpreter, type);
            break;
        case enum_class_Iterator:
            iter = list;
            /* fall through */
        default:
            res = pmc_new(interpreter, enum_class_Undef);
            break;
    }
    if (!iter)
        iter = pmc_new_init(interpreter, enum_class_Iterator, list);
    VTABLE_set_integer_native(interpreter, iter, 0);
    i = 0;
    none_func = PMC_IS_NULL(func) ||
        func == Parrot_base_vtables[enum_class_None]->data;
    if (none_func) {
        /* TODO TypeError: 'NoneType' object is not callable  */
    }
    if (!init) {
        if (!VTABLE_get_bool(interpreter, iter))
            return res;
        init = VTABLE_shift_pmc(interpreter, iter);
    }
    VTABLE_assign_pmc(interpreter, res, init);
    while (VTABLE_get_bool(interpreter, iter)) {
        PMC *item = VTABLE_shift_pmc(interpreter, iter);
            /* run filter func -
             * TODO save registers once around loop
             */
        res = Parrot_runops_fromc_args(interpreter, func, "PPP", res, item);
    }
    return res;
}

static PMC *
parrot_py_repr(Interp *interpreter, PMC *pmc)
{
    PMC *res = pmc_new(interpreter, enum_class_PerlString);
    STRING *repr = VTABLE_get_repr(interpreter, pmc);
    VTABLE_assign_string_native(interpreter, res, repr);
    return res;
}

static PMC *
parrot_py_str(Interp *interpreter, PMC *pmc)
{
    PMC *res = pmc_new(interpreter, enum_class_PerlString);
    STRING *repr = VTABLE_get_string(interpreter, pmc);
    VTABLE_assign_string_native(interpreter, res, repr);
    return res;
}

static PMC *
parrot_py_hash(Interp *interpreter, PMC *pmc)
{
    PMC *h = pmc_new_noinit(interpreter, enum_class_PerlInt);
    INTVAL i;

    switch (pmc->vtable->base_type) {
        case enum_class_PerlString:
        case enum_class_String:
            i = string_hash(interpreter, PMC_str_val(pmc));
            break;
        case enum_class_Complex:
            i = (INTVAL)VTABLE_get_number_keyed_int(interpreter, pmc, 0);
            break;
        default:
            i = VTABLE_get_integer(interpreter, pmc);
            break;
    }
    PMC_int_val(h) = i;
    return h;
}

static PMC*
parrot_py_hex(Interp *interpreter, PMC *pmc)
{
    STRING *s = Parrot_sprintf_c(interpreter, "%#x",
            VTABLE_get_integer(interpreter, pmc));
    PMC *p = pmc_new(interpreter, enum_class_PerlString);
    /*
     * XXX should sprintf handle that
     */
    if (pmc->vtable->base_type == enum_class_BigInt)
        s = string_append(interpreter, s, CONST_STRING(interpreter, "L"), 0);
    string_set(interpreter, PMC_str_val(p), s);
    return p;
}

static INTVAL
parrot_py_id(PMC *pmc)
{
    return (INTVAL) pmc;
}


static PMC *
parrot_py_range(Interp *interpreter, PMC *pstart, PMC *pend, PMC *pstep)
{
    PMC *ar = pmc_new(interpreter, enum_class_ResizablePMCArray);
    INTVAL start = 0, end = 0, step = 1;
    int i, k, argcP;

    argcP = REG_INT(3);
    if (argcP == 1) {
        end = VTABLE_get_integer(interpreter, pstart);
    }
    else if (argcP == 2) {
        start = VTABLE_get_integer(interpreter, pstart);
        end =  VTABLE_get_integer(interpreter, pend);
    }
    else if (argcP == 3) {
        start = VTABLE_get_integer(interpreter, pstart);
        end =  VTABLE_get_integer(interpreter, pend);
        step =  VTABLE_get_integer(interpreter, pstep);
        if (step == 0)
            real_exception(interpreter, NULL, E_ValueError,
                    "range() step argument must not be zero");
    }
    else {
        /* TODO err */
    }
    if (step < 0) {
        for (i = start, k = 0; i > end; i += step, ++k)
            VTABLE_set_integer_keyed_int(interpreter, ar, k, i);
    }
    else {
        for (i = start, k = 0; i < end; i += step, ++k)
            VTABLE_set_integer_keyed_int(interpreter, ar, k, i);
    }
    return ar;
}

/*
 * fill the pmc (tuple or list) with items from sequence
 */
void
Parrot_py_fill(Interp *interpreter, PMC *ar, PMC *seq)
{
    INTVAL i, n;
    STRING *s;

    switch (seq->vtable->base_type) {
        case enum_class_PerlArray:
        case enum_class_FixedPMCArray:
        case enum_class_ResizablePMCArray:
            n = VTABLE_elements(interpreter, seq);
            VTABLE_set_integer_native(interpreter, ar, n);
            for (i = 0; i < n; ++i) {
                VTABLE_set_pmc_keyed_int(interpreter, ar, i,
                        VTABLE_get_pmc_keyed_int(interpreter, seq, i));
            }
            break;
        case enum_class_String:
        case enum_class_PerlString:
            s = PMC_str_val(seq);
            n = string_length(interpreter, s);
            VTABLE_set_integer_native(interpreter, ar, n);
            for (i = 0; i < n; ++i) {
                VTABLE_set_string_keyed_int(interpreter, ar, i,
                    string_substr(interpreter, s, i, 1, NULL, 0));
            }
            break;
        case enum_class_Iterator:
            /* reset iterator */
            VTABLE_set_integer_native(interpreter, seq, 0);
            n = VTABLE_elements(interpreter, seq);
            VTABLE_set_integer_native(interpreter, ar, n);
            /* TODO morph to resizeable first else this will break
             * with generators - if that's possible
             */
            i = 0;
            while (VTABLE_get_bool(interpreter, seq)) {
                PMC *item = VTABLE_shift_pmc(interpreter, seq);
                VTABLE_set_pmc_keyed_int(interpreter, ar, i++, item);
            }
            break;
        default:
            internal_exception(1, "unimplemented tuple type\n");
    }
}

static PMC *
parrot_py_assert_e(Interp *interpreter, PMC *pmc)
{
    PMC *ex = interpreter->exception_list[E_AssertionError];
    /*
     * these are "static" - should we dup the exception?
     */
    VTABLE_set_string_keyed_int(interpreter, ex, 0,
            VTABLE_get_string(interpreter, pmc));
    return ex;
}

static PMC*
parrot_py_object(Interp *interpreter, STRING *class, void *func,
        STRING *name, STRING *sig)
{
    PMC *method;
    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method, sig, func);
    Parrot_store_global(interpreter, class, name, method);
    return method;
}

static PMC*
parrot_py_global(Interp *interpreter, void *func,
        STRING *name, STRING *sig)
{
    return parrot_py_object(interpreter, NULL, func, name, sig);
}

/*

=item C<static void parrot_py_create_funcs(Interp *interpreter)>

Initialize Python builtin functions.

*/

static void
parrot_py_create_funcs(Interp *interpreter)
{
    STRING *ip   =     CONST_STRING(interpreter, "iP");
    STRING *pip   =    CONST_STRING(interpreter, "PIP");
    STRING *pipp   =   CONST_STRING(interpreter, "PIPP");
    STRING *iipp   =   CONST_STRING(interpreter, "iIPP");
    STRING *pippp   =  CONST_STRING(interpreter, "PIPPP");

    STRING *assert_e = CONST_STRING(interpreter, "AssertionError");
    STRING *callable = CONST_STRING(interpreter, "callable");
    STRING *chr      = CONST_STRING(interpreter, "chr");
    STRING *cmp      = CONST_STRING(interpreter, "cmp");
    STRING *divmod   = CONST_STRING(interpreter, "divmod");
    STRING *enumerate= CONST_STRING(interpreter, "enumerate");
    STRING *filter   = CONST_STRING(interpreter, "filter");
    STRING *hash     = CONST_STRING(interpreter, "hash");
    STRING *hex      = CONST_STRING(interpreter, "hex");
    STRING *id       = CONST_STRING(interpreter, "id");
    STRING *isa      = CONST_STRING(interpreter, "isinstance");
    STRING *map      = CONST_STRING(interpreter, "map");
    STRING *max      = CONST_STRING(interpreter, "max");
    STRING *min      = CONST_STRING(interpreter, "min");
    STRING *range    = CONST_STRING(interpreter, "range");
    STRING *reduce   = CONST_STRING(interpreter, "reduce");
    STRING *repr   =   CONST_STRING(interpreter, "repr");

    STRING *name_ =    CONST_STRING(interpreter, "__name__");

    /* types */
    STRING *Py_bool  = CONST_STRING(interpreter, "Py_bool");
    STRING *Py_complex  = CONST_STRING(interpreter, "Py_complex");
    STRING *Py_float = CONST_STRING(interpreter, "Py_float");
    STRING *Py_int   = CONST_STRING(interpreter, "Py_int");
    STRING *Py_long  = CONST_STRING(interpreter, "Py_long");
    STRING *Py_str   = CONST_STRING(interpreter, "Py_str");

    STRING *Py_dict  = CONST_STRING(interpreter, "Py_dict");
    STRING *Py_list  = CONST_STRING(interpreter, "Py_list");
    STRING *Py_tuple = CONST_STRING(interpreter, "Py_tuple");

    STRING *Py_iter  = CONST_STRING(interpreter, "Py_iter");
    STRING *Py_xrange = CONST_STRING(interpreter, "Py_xrange");

    STRING *Py_object = CONST_STRING(interpreter, "Py_object");
    STRING *Py_type   = CONST_STRING(interpreter, "Py_type");

    PMC* class, *m;
    /*
     * new types interface, just place a class object as global
     * this is invocable and returns a new instance
     */
    class = Parrot_base_vtables[enum_class_Boolean]->data;
    Parrot_store_global(interpreter, NULL, Py_bool, class);
    class->vtable->get_repr = class->vtable->get_string;

    class = Parrot_base_vtables[enum_class_Complex]->data;
    Parrot_store_global(interpreter, NULL, Py_complex, class);
    class->vtable->get_repr = class->vtable->get_string;

    class = Parrot_base_vtables[enum_class_PerlNum]->data;
    Parrot_store_global(interpreter, NULL, Py_float, class);
    class = Parrot_base_vtables[enum_class_PerlInt]->data;
    Parrot_store_global(interpreter, NULL, Py_int, class);
    class->vtable->get_repr = class->vtable->get_string;

    class = Parrot_base_vtables[enum_class_BigInt]->data;
    Parrot_store_global(interpreter, NULL, Py_long, class);
    class = Parrot_base_vtables[enum_class_PerlString]->data;
    Parrot_store_global(interpreter, NULL, Py_str, class);

    class = Parrot_base_vtables[enum_class_FixedPMCArray]->data;
    Parrot_store_global(interpreter, NULL, Py_tuple, class);
    class->vtable->get_repr = class->vtable->get_string;

    class = Parrot_base_vtables[enum_class_ResizablePMCArray]->data;
    Parrot_store_global(interpreter, NULL, Py_list, class);
    class = Parrot_base_vtables[enum_class_PerlHash]->data;
    Parrot_store_global(interpreter, NULL, Py_dict, class);
    class->vtable->get_repr = class->vtable->get_string;

    class = Parrot_base_vtables[enum_class_Iterator]->data;
    Parrot_store_global(interpreter, NULL, Py_iter, class);
    class = Parrot_base_vtables[enum_class_Slice]->data;
    Parrot_store_global(interpreter, NULL, Py_xrange, class);

    class = Parrot_base_vtables[enum_class_ParrotClass]->data;
    Parrot_store_global(interpreter, NULL, Py_object, class);
    class = Parrot_base_vtables[enum_class_ParrotClass]->data;
    Parrot_store_global(interpreter, NULL, Py_type, class);  /* ??? */


    parrot_py_global(interpreter, F2DPTR(parrot_py_assert_e), assert_e, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_callable), callable, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_chr), chr, pip);

    m = parrot_py_global(interpreter, F2DPTR(parrot_py_cmp), cmp, iipp);
    {
        PMC* cmp_name = pmc_new(interpreter, enum_class_PerlString);
        VTABLE_assign_string_native(interpreter, cmp_name, cmp);
        VTABLE_setprop(interpreter, m, name_, cmp_name);
        m->vtable = Parrot_clone_vtable(interpreter, m->vtable);
        m->vtable->get_attr_str = parrot_py_get_attr_str;
    }

    parrot_py_global(interpreter, F2DPTR(parrot_py_divmod), divmod, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_enumerate), enumerate, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_filter), filter, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hash), hash, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hex), hex, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_id), id, ip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_isa), isa, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_map), map, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_max), max, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_min), min, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range), range, pippp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_reduce), reduce, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_repr), repr, pip);
}

/*

=item C<static void parrot_py_create_exception(Interp *interpreter)>

Initialize Python exceptions objects and globals.

*/

static void
parrot_py_create_exceptions(Interp *interpreter)
{
    PMC *ex;
    PMC **ex_list;
    STRING *s;

    ex_list = interpreter->exception_list;

    /*
     * TODO remember pythonic class inheritance
     */
    ex = ex_list[E_Exception];
    s = CONST_STRING(interpreter, "Exception");
    Parrot_store_global(interpreter, NULL, s, ex);

    ex = ex_list[E_StopIteration];
    s = CONST_STRING(interpreter, "StopIteration");
    Parrot_store_global(interpreter, NULL, s, ex);

    ex = ex_list[E_RuntimeError];
    s = CONST_STRING(interpreter, "RuntimeError");
    Parrot_store_global(interpreter, NULL, s, ex);

    ex = ex_list[E_NameError];
    s = CONST_STRING(interpreter, "NameError");
    Parrot_store_global(interpreter, NULL, s, ex);

    ex = ex_list[E_ValueError];
    s = CONST_STRING(interpreter, "ValueError");
    Parrot_store_global(interpreter, NULL, s, ex);
}

static void
parrot_py_create_vars(Interp *interpreter)
{
    PMC *p;
    STRING *s;

    p = Parrot_base_vtables[enum_class_None]->data;
    s = CONST_STRING(interpreter, "None");
    Parrot_store_global(interpreter, NULL, s, p);
}

/*

=item C<static void parrot_py_create_default_meths(Interp *interpreter)>

Initialize Python builtin object methods.

*/

#include "../classes/pmc_default.h"

static void
integer_divide(Interp* interp, PMC* self, PMC* value, PMC* destination)
{
     INTVAL result;
     result = PMC_int_val(self) / PMC_int_val(value);
     VTABLE_set_integer_native(interp, destination, result);
}
static void
integer_divide_int(Interp* interp, PMC* self, INTVAL value, PMC* destination)
{
     INTVAL result;
     result = PMC_int_val(self) / value;
     VTABLE_set_integer_native(interp, destination, result);
}

/*
 * __new__(class, args...)
 * when its overridden, the call is treated as a method call with
 * the class in P2
 *
 * This is the internal function, if the __new__ isn't present.
 * We shift down arguments by one and instantiate the object
 */

void Parrot_instantiate_py_object(Parrot_Interp, PMC *object);
static PMC*
parrot_py_instantiate_new(Parrot_Interp interpreter, PMC *class, PMC*arg)
{
    REG_PMC(5) = arg;   /* XXX shift down more */
    --REG_INT(3);
    if (PObj_is_class_TEST(class)) {

        class->vtable->init = Parrot_instantiate_py_object;
        /* init calls instantiate */
        return pmc_new(interpreter, class->vtable->base_type);
    }
    else {
        VTABLE_invoke(interpreter, class, NULL);
    }
    return REG_PMC(5);
}

static void
parrot_py_create_default_meths(Interp *interpreter)
{
    STRING *pio = CONST_STRING(interpreter, "PIO");
    STRING *piop = CONST_STRING(interpreter, "PIPP");
    STRING *class = CONST_STRING(interpreter, "object");

    STRING *repr =  CONST_STRING(interpreter, "__get_repr");
    STRING *str =  CONST_STRING(interpreter, "__get_string");
    STRING *new__ =  CONST_STRING(interpreter, "__new__");

    parrot_py_object(interpreter, class,
            F2DPTR(parrot_py_repr), repr, pio);
    /* parrot_py_object(interpreter, class,
            F2DPTR(parrot_py_str), str, pio);
    */
    parrot_py_global(interpreter,
            F2DPTR(parrot_py_instantiate_new), new__, piop);

    mmd_register(interpreter, MMD_DIVIDE,
            enum_class_PerlInt, enum_class_PerlInt,
            (funcptr_t)integer_divide);
    mmd_register(interpreter, MMD_DIVIDE_INT,
            enum_class_PerlInt, 0,
            (funcptr_t)integer_divide_int);
    /*
     * Sub PMCs have an atribute __name__ - redirect __get_attr
     */
    Parrot_base_vtables[enum_class_Sub]->get_attr_str = parrot_py_get_attr_str;
    /*
     * b3.py icmp uses the __cmp__ attr of int
     */
    Parrot_base_vtables[enum_class_PerlInt]->get_attr = parrot_py_get_attr_num;
}
/*

=item C<void Parrot_py_init(Interp *interpreter)>

Initialize Python functions.

*/

void
Parrot_py_init(Interp *interpreter)
{
    parrot_py_create_funcs(interpreter);
    parrot_py_create_exceptions(interpreter);
    parrot_py_create_vars(interpreter);
    parrot_py_create_default_meths(interpreter);
}

int PIO_softspace(theINTERP, PMC *pmc, int new); /* io/io.c */
void
Parrot_py_exit(Interp *interpreter)
{
    /*
     * python seems to provide a newline, if there was none
     */
    PMC *io = PIO_STDOUT(interpreter);
    if (PIO_softspace(interpreter, io, 0))
        PIO_puts(interpreter, io, "\n");
}

/*
 * convert a key chain PMC to a range slice with end adjusted to
 * the aggregate.
 */
PMC*
Parrot_py_make_slice(Interp *interpreter, PMC *self, PMC *key)
{
    parrot_range_t *range;
    PMC *slice;
    INTVAL start, end, n;
    /*
     * key is a keychain PMC
     */
    slice = pmc_new_init(interpreter, enum_class_Slice, key);
    range = PMC_struct_val(slice);
    start = RVal_int(range->start);
    if ((PObj_get_FLAGS(key) &
                        (KEY_inf_slice_FLAG|KEY_start_slice_FLAG)) ==
                    (KEY_inf_slice_FLAG|KEY_start_slice_FLAG)) {
        /* last range "start .." */
        RVal_int(range->end) = VTABLE_elements(interpreter, self) - 1;
    }
    /*
     * set_slice_start did already decrement it
     */
    end = RVal_int(range->end) + 1;
    n = VTABLE_elements(interpreter, self);
    if (start < 0)
        start += n;
    if (end < 0)
        end += n;
    if (start < 0)
        start = 0;
    else if (start > n)
        start = n;
    if (start > end)
        end = start;
    else if (end > n)
        end = n;
    RVal_int(range->start) = start;
    RVal_int(range->end)   = end;
    return slice;
}

PMC*
Parrot_py_set_slice(Interp *interpreter, PMC *self, PMC *key, PMC *src)
{
    INTVAL i, type;
    parrot_range_t *range;
    PMC *res, *slice, *item;
    INTVAL start, end, iitem;
    INTVAL j, count, value_length;

    slice = Parrot_py_make_slice(interpreter, self, key);
    range = PMC_struct_val(slice);

    type = self->vtable->base_type;
    /*
     * fprintf(stderr, "range %d - %d\n", RVal_int(range->start),
     *    RVal_int(range->end));
     */
    res = pmc_new(interpreter, type);
    start = RVal_int(range->start);
    end = RVal_int(range->end);

    count = end - start;
    if (PMC_IS_NULL(src) || src->vtable->base_type == enum_class_None)
        value_length = 0;
    else
        value_length = VTABLE_elements(interpreter, src);
    /* replace count items at offset with values */
    for (i = j = 0; i < count && j < value_length; i++, j++) {
        item = VTABLE_get_pmc_keyed_int(interpreter, src, j);
        VTABLE_set_pmc_keyed_int(interpreter, self, start + i, item);
    }
    /* if we still have values in value_list, insert them */
    if (j < value_length) {
        /* make room for the remaining values */
        PMC **data;
        INTVAL n = VTABLE_elements(interpreter, self);
        INTVAL diff = value_length - j;
        INTVAL st = start + i;
        /* need value_length -j more room in data */
        VTABLE_set_integer_native(interpreter, self, n + diff);
        data = PMC_data(self);
        mem_sys_memmove(data + st + diff, data + st,
                (n - st) * sizeof(PMC*));
        for (; j < value_length; i++, j++) {
            item = VTABLE_get_pmc_keyed_int(interpreter, src, j);
            VTABLE_set_pmc_keyed_int(interpreter, self, start + i, item);
        }
    }
    else {
        /* delete count -i values at start + i */
        PMC **data = PMC_data(self);
        INTVAL n = VTABLE_elements(interpreter, self);
        INTVAL diff = count - i;
        INTVAL st = start + i;
        mem_sys_memmove(data + st, data + st + diff,
                (n - st - diff) * sizeof(PMC*));
        VTABLE_set_integer_native(interpreter, self, n - diff);
    }

    return self;
}

PMC*
Parrot_py_get_slice(Interp *interpreter, PMC *self, PMC *key)
{
    INTVAL i, type;
    parrot_range_t *range;
    PMC *res, *slice, *item;
    INTVAL start, end, iitem;

    slice = Parrot_py_make_slice(interpreter, self, key);
    range = PMC_struct_val(slice);

    type = self->vtable->base_type;
    /*
     * fprintf(stderr, "range %d - %d\n", RVal_int(range->start),
     *    RVal_int(range->end));
     */
    res = pmc_new(interpreter, type);
    start = RVal_int(range->start);
    end = RVal_int(range->end);
    for (i = start; i < end; ++i) {
        switch (type) {
            case enum_class_Array:
            case enum_class_PerlArray:
            case enum_class_FixedPMCArray:
            case enum_class_ResizablePMCArray:
                item = VTABLE_get_pmc_keyed_int(interpreter, self, i);
                VTABLE_set_pmc_keyed_int(interpreter, res, i-start, item);
                break;
            case enum_class_String:
            case enum_class_PerlString:
                string_substr(interpreter, PMC_str_val(self), start,
                        end - start, &PMC_str_val(res), 1);
                return res;
            case enum_class_IntList:
                iitem = VTABLE_get_integer_keyed_int(interpreter, self, i);
                VTABLE_set_integer_keyed_int(interpreter, res, i-start, iitem);
                break;
            default:
                internal_exception(1, "Parrot_py_get_slice: unim tpye");
        }
    }
    return res;
}

void
parrot_py_set_vtable(Parrot_Interp interpreter, PMC* class);

static PMC*
parrot_py_get_attr_str(Interp* interpreter, PMC *object, STRING *name)
{
    /*
     * data attributes override method attributes
     */
    Hash *h;
    HashBucket *b;
    PMC *p, *class = NULL;
    STRING *class_name;
    INTVAL offs;
    SLOTTYPE *class_array;
    /*
     * 1) look at props
     */
    if (object->pmc_ext && (p = PMC_metadata(object)) ) {
        h = PMC_struct_val(p);
        b = hash_get_bucket(interpreter, h, name);
        if (b) {
            return b->value;
        }
    }
    if (object->vtable->base_type == enum_class_Sub) {
        STRING *name_ =    CONST_STRING(interpreter, "__name__");
        if (!string_equal(interpreter, name, name_)) {
            parrot_sub_t sub = PMC_sub(object);
            PMC *n = pmc_new(interpreter, enum_class_PerlString);
            VTABLE_assign_string_native(interpreter, n, sub->name);
            return n;
        }
    }
    /*
     * check attributes, if its an object
     */

    if (PObj_is_object_TEST(object)) {
        class = GET_CLASS((SLOTTYPE *)PMC_data(object), object);
        class_array = (SLOTTYPE *)PMC_data(class);
        p = get_attrib_num(class_array, PCD_ATTRIBUTES);
        b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(p), name);
        if (b) {
            offs = PMC_int_val( (PMC*) b->value);
            return Parrot_get_attrib_by_num(interpreter, object, offs);
        }
        /*
         * 3) try method
         */
        p = Parrot_find_method_with_cache(interpreter, class, name);
        if (p)
            return p;
    }
    else if (PObj_is_class_TEST(object)) {
        p = Parrot_find_method_with_cache(interpreter, object, name);
        if (p)
            return p;
    }
    /*
     * 4) global - class method
     */
    p = Parrot_find_global(interpreter, NULL, name);
    if (p)
        return p;
    /*
     * pitch a fit
     */
    real_exception(interpreter, NULL, E_AttributeError,
            "'%Ss' object has no attribute '%Ss'",
            class ? class : object, /* TODO demangle */
            name);

    return PMCNULL;
}

static void
parrot_py_set_attr_str(Interp* interpreter, PMC *obj, STRING *name, PMC *v)
{
    Parrot_default_setprop(interpreter, obj, name, v);
}

static PMC*
parrot_py_get_attr_num(Interp* interpreter, PMC *object, INTVAL nr)
{
    PMC *sub, *nci;
    INTVAL type;
    STRING *iIPP = CONST_STRING(interpreter, "iIPP");

    if (nr <= 0) {
        type = object->vtable->base_type;
        /* this is the fallback - don't know, which types are compared */
        sub = mmd_vtfind(interpreter, -nr, 0, 0);
        if (!sub)
            internal_exception(1, "NULL MMD attribute nr %d", (int)nr);
        if (sub->vtable->base_type != enum_class_CSub)
            return sub;
        switch (nr) {
            case -41:       /* MMD_CMP */
                nci = pmc_new(interpreter, enum_class_NCI);
                VTABLE_set_pointer_keyed_str(interpreter, nci,
                        iIPP, PMC_struct_val(sub));
                return nci;
            default:
                break;
        }
    }
    internal_exception(1, "unknown attribute nr %d", (int)nr);

    return PMCNULL;
}

static void
parrot_py_set_attr_num(Interp* interpreter, PMC *obj, INTVAL nr, PMC *v)
{
    INTVAL type;

    funcptr_t f;
    if (nr <= 0) {
        type = obj->vtable->base_type;
        switch (nr) {
            case -41:       /* MMD_CMP */
                f = NULL;
                if (v->vtable->base_type == enum_class_NCI) {
                    f = (funcptr_t) PMC_struct_val(v);
                    mmd_register(interpreter, -nr, type, type, f);
                    mmd_register(interpreter, -nr, type, 0, f);
                    return;
                }
                else if (v->vtable->base_type == enum_class_Sub) {
                    mmd_register_sub(interpreter, -nr, type, type, v);
                    mmd_register_sub(interpreter, -nr, type, 0, v);
                    return;
                }
                break;
        }
    }
    internal_exception(1, "unknown attribute nr %d", (int)nr);
}

/*
 * TODO self.super()
 * for now use delegate directly
 */
PMC* Parrot_delegate_get_iter(Parrot_Interp interpreter, PMC* pmc);

static PMC*
parrot_py_get_iter(Interp* interpreter, PMC *obj)
{
    /*
     * need an iterator - that's the original construction code
     */
    PMC *iter = pmc_new_init(interpreter, enum_class_Iterator, obj);
    PMC *next, *obj_iter;
    STRING *next_meth = CONST_STRING(interpreter, "next");
    STRING *class_name;

    PMC_struct_val(iter) = obj_iter =
        Parrot_delegate_get_iter(interpreter, obj);

    next = Parrot_find_method_with_cache(interpreter, obj_iter, next_meth);
    assert(next);
    class_name = VTABLE_name(interpreter, obj);
    Parrot_store_global(interpreter, class_name, next_meth, next);
    return iter;
}

void
parrot_py_set_vtable(Parrot_Interp interpreter, PMC* class)
{
    PMC * vtable_pmc =
        get_attrib_num((SLOTTYPE *)PMC_data(class), PCD_OBJECT_VTABLE);
    VTABLE *vtable = PMC_struct_val(vtable_pmc);

    vtable->get_attr_str = parrot_py_get_attr_str;
    vtable->set_attr_str = parrot_py_set_attr_str;
    vtable->get_attr     = parrot_py_get_attr_num;
    vtable->set_attr     = parrot_py_set_attr_num;

    vtable->get_iter     = parrot_py_get_iter;

    class->vtable->get_attr_str = parrot_py_get_attr_str;
    class->vtable->get_attr = parrot_py_get_attr_num;
    class->vtable->set_attr_str = parrot_py_set_attr_str;
    class->vtable->set_attr = parrot_py_set_attr_num;

}
/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, F<src/interpreter.c>.

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
