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

/*

Python Library Reference 2.1 Built-in Functions

*/

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

static PMC *
dict_from_tuple_array(Interp *interpreter, PMC *ar)
{
    INTVAL i, el;
    PMC *dict;
    /*
     * ar is an array of tuples which are key/value pairs
     */
    dict = pmc_new(interpreter, enum_class_PerlHash);
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
    return dict;
}

static PMC *
parrot_py_dict(Interp *interpreter, PMC *arg)
{
    INTVAL argcP;
    /*
     * no arguments: return a new hash
     */
    if ((argcP = REG_INT(3)) == 0)
        return pmc_new(interpreter, enum_class_PerlHash);
    if (argcP > 1) {
            real_exception(interpreter, NULL, E_TypeError,
                    "TypeError: dict expected at most 1 arguments, got %d",
                    (int)argcP);
    }
    switch (arg->vtable->base_type) {
        case enum_class_PerlHash:
            return arg;
        case enum_class_FixedPMCArray:  /* sequence from BUILD_TUPLE */
        case enum_class_PerlArray:      /* sequence from BUILD_LIST */
            return dict_from_tuple_array(interpreter, arg);
        default:
            internal_exception(1, "Unimplemented dict argument");
    }
    return NULL;
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
parrot_py_list(Interp *interpreter, PMC *arg)
{
    INTVAL i, argcP;
    PMC *iter, *list;
    /*
     * no arguments: return a new list
     */
    if ((argcP = REG_INT(3)) == 0)
        return pmc_new(interpreter, enum_class_PerlArray);
    if (argcP > 1) {
            real_exception(interpreter, NULL, E_TypeError,
                    "TypeError: list expected at most 1 arguments, got %d",
                    (int)argcP);
    }
    iter = NULL;
    switch (arg->vtable->base_type) {
        case enum_class_FixedPMCArray:  /* sequence from BUILD_TUPLE */
            list = pmc_new(interpreter, enum_class_PerlArray);
            for (i = 0; i < VTABLE_elements(interpreter, arg); ++i) {
                PMC *item = VTABLE_get_pmc_keyed_int(interpreter, arg, i);
                VTABLE_set_pmc_keyed_int(interpreter, list, i, item);
            }
            return list;
        case enum_class_PerlArray:      /* sequence from BUILD_LIST */
            /* TODO return copy */
            return arg;
        case enum_class_Iterator:
            iter = arg;
    }
    list = pmc_new(interpreter, enum_class_PerlArray);
    if (!iter)
        iter = pmc_new_init(interpreter, enum_class_Iterator, arg);
    VTABLE_set_integer_native(interpreter, iter, 0);
    i = 0;
    while (VTABLE_get_bool(interpreter, iter)) {
        PMC *item = VTABLE_shift_pmc(interpreter, iter);
        VTABLE_set_pmc_keyed_int(interpreter, list, i++, item);
    }
    return list;
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
            res = pmc_new(interpreter, enum_class_PerlArray);
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
            PMC *t = Parrot_runops_fromc_args_save(interpreter, func,
                    "PP", item);
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
            res = pmc_new(interpreter, enum_class_PerlArray);
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
            item = Parrot_runops_fromc_args_save(interpreter, func,
                    "PP", item);
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
        res = Parrot_runops_fromc_args_save(interpreter, func,
                    "PPP", res, item);
    }
    return res;
}

static PMC *
parrot_py_repr(Interp *interpreter, PMC *pmc)
{
    PMC *res = pmc_new(interpreter, enum_class_PerlString);
    STRING *repr =  CONST_STRING(interpreter, "__repr__");
    PMC *meth = VTABLE_find_method(interpreter, pmc, repr);
    if (!meth) {
        real_exception(interpreter, NULL, METH_NOT_FOUND,
                "Method '%Ss' not found", repr);
    }
    REG_PMC(2) = pmc;
    REG_PMC(0) = meth;
    (void*)VTABLE_invoke(interpreter, meth, NULL);
    VTABLE_set_string_native(interpreter, res, REG_STR(5));
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
parrot_py_iter(Interp *interpreter, PMC *pmc)
{
    return pmc_new_init(interpreter, enum_class_Iterator, pmc);
}

static PMC *
parrot_py_range(Interp *interpreter, PMC *pstart, PMC *pend, PMC *pstep)
{
    PMC *ar = pmc_new(interpreter, enum_class_PerlArray);
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


static PMC *
parrot_py_tuple(Interp *interpreter, PMC *pmc)
{
    PMC *ar;
    INTVAL i, n;
    STRING *s;

    switch (pmc->vtable->base_type) {
        case enum_class_FixedPMCArray:
            return pmc;  /* XXX copy ? */
        case enum_class_PerlArray:
            ar = pmc_new(interpreter, enum_class_FixedPMCArray);
            n = VTABLE_elements(interpreter, pmc);
            VTABLE_set_integer_native(interpreter, ar, n);
            for (i = 0; i < n; ++i) {
                VTABLE_set_pmc_keyed_int(interpreter, ar, i,
                        VTABLE_get_pmc_keyed_int(interpreter, pmc, i));
            }
            return ar;
        case enum_class_String:
        case enum_class_PerlString:
            ar = pmc_new(interpreter, enum_class_FixedPMCArray);
            s = PMC_str_val(pmc);
            n = string_length(interpreter, s);
            VTABLE_set_integer_native(interpreter, ar, n);
            for (i = 0; i < n; ++i) {
                VTABLE_set_string_keyed_int(interpreter, ar, i,
                    string_substr(interpreter, s, i, 1, NULL, 0));
            }
            return ar;
        case enum_class_Iterator:
            ar = pmc_new(interpreter, enum_class_PerlArray);
            /* reset iterator */
            VTABLE_set_integer_native(interpreter, pmc, 0);
            i = 0;
            while (VTABLE_get_bool(interpreter, pmc)) {
                PMC *item = VTABLE_shift_pmc(interpreter, pmc);
                VTABLE_set_pmc_keyed_int(interpreter, ar, i++, item);
            }
            return ar;
        default:
            internal_exception(1, "unimplemented tuple type\n");
    }
    return NULL;
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

static void
parrot_py_object(Interp *interpreter, STRING *class, void *func,
        STRING *name, STRING *sig)
{
    PMC *method;
    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method, sig, func);
    Parrot_store_global(interpreter, class, name, method);
}

static void
parrot_py_global(Interp *interpreter, void *func,
        STRING *name, STRING *sig)
{
    parrot_py_object(interpreter, NULL, func, name, sig);
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
    STRING *pippp   =  CONST_STRING(interpreter, "PIPPP");

    STRING *assert_e = CONST_STRING(interpreter, "AssertionError");
    STRING *callable = CONST_STRING(interpreter, "callable");
    STRING *chr      = CONST_STRING(interpreter, "chr");
    STRING *dict     = CONST_STRING(interpreter, "dict");
    STRING *divmod   = CONST_STRING(interpreter, "divmod");
    STRING *enumerate= CONST_STRING(interpreter, "enumerate");
    STRING *filter   = CONST_STRING(interpreter, "filter");
    STRING *hash     = CONST_STRING(interpreter, "hash");
    STRING *hex      = CONST_STRING(interpreter, "hex");
    STRING *id       = CONST_STRING(interpreter, "id");
    STRING *isa      = CONST_STRING(interpreter, "isinstance");
    STRING *list     = CONST_STRING(interpreter, "list");
    STRING *longf    = CONST_STRING(interpreter, "long");
    STRING *map      = CONST_STRING(interpreter, "map");
    STRING *max      = CONST_STRING(interpreter, "max");
    STRING *min      = CONST_STRING(interpreter, "min");
    STRING *range    = CONST_STRING(interpreter, "range");
    STRING *reduce   = CONST_STRING(interpreter, "reduce");
    STRING *repr   =   CONST_STRING(interpreter, "repr");
    STRING *tuple    = CONST_STRING(interpreter, "tuple");

    /* types */
    STRING *Py_bool  = CONST_STRING(interpreter, "Py_bool");
    STRING *Py_float = CONST_STRING(interpreter, "Py_float");
    STRING *Py_int   = CONST_STRING(interpreter, "Py_int");
    STRING *Py_long  = CONST_STRING(interpreter, "Py_long");
    STRING *Py_str   = CONST_STRING(interpreter, "Py_str");
    PMC* class;
    /*
     * new types interface, just place a class object as global
     * this is invocable and returns a new instance
     */
    class = Parrot_base_vtables[enum_class_Boolean]->data;
    Parrot_store_global(interpreter, NULL, Py_bool, class);
    class = Parrot_base_vtables[enum_class_PerlNum]->data;
    Parrot_store_global(interpreter, NULL, Py_float, class);
    class = Parrot_base_vtables[enum_class_PerlInt]->data;
    Parrot_store_global(interpreter, NULL, Py_int, class);
    class = Parrot_base_vtables[enum_class_BigInt]->data;
    Parrot_store_global(interpreter, NULL, Py_long, class);
    class = Parrot_base_vtables[enum_class_PerlString]->data;
    Parrot_store_global(interpreter, NULL, Py_str, class);


    parrot_py_global(interpreter, F2DPTR(parrot_py_assert_e), assert_e, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_callable), callable, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_chr), chr, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_dict), dict, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_divmod), divmod, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_enumerate), enumerate, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_filter), filter, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hash), hash, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hex), hex, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_id), id, ip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_isa), isa, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_list), list, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_map), map, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_max), max, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_min), min, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range), range, pippp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_reduce), reduce, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_repr), repr, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_tuple), tuple, pipp);
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

#include "pmc_default.h"
static void
parrot_py_create_default_meths(Interp *interpreter)
{
    STRING *sio = CONST_STRING(interpreter, "SIO");
    STRING *class = CONST_STRING(interpreter, "object");

    STRING *meth =  CONST_STRING(interpreter, "__repr__");

    parrot_py_object(interpreter, class,
           F2DPTR(Parrot_default_get_repr), meth, sio);

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


PMC*
Parrot_py_get_slice(Interp *interpreter, PMC *self, PMC *key)
{
    INTVAL i, n, type;
    parrot_range_t *range;
    PMC *res, *slice, *item;
    INTVAL start, end, iitem;

    type = self->vtable->base_type;
    /*
     * key is a keychaing PMC
     */
    slice = pmc_new_init(interpreter, enum_class_Slice, key);
    range = PMC_struct_val(slice);
    /*
     * fprintf(stderr, "range %d - %d\n", RVal_int(range->start),
     *    RVal_int(range->end));
     */
    res = pmc_new(interpreter, type);
    start = RVal_int(range->start);
    /*
     * set_slice_start did already decrement it
     */
    end = RVal_int(range->end) + 1;
    n = VTABLE_elements(interpreter, self);
    if (!n) {
        /* slice of empty is empty
         */
        return res;
    }
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
    for (i = start; i < end; ++i) {
        switch (type) {
            case enum_class_Array:
            case enum_class_PerlArray:
            case enum_class_FixedPMCArray:
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
