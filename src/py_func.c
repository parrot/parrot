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
    INTVAL i;
    PMC *dict;
    /*
     * ar is an array of tuples which are key/value pairs
     */
    dict = pmc_new(interpreter, enum_class_PerlHash);
    for (i = 0; i < VTABLE_elements(interpreter, ar); ++i) {
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
parrot_py_dict(Interp *interpreter, PMC *argv)
{
    PMC *arg;
    INTVAL i;
    /*
     * no arguments: return a new hash
     */
    if ((i = VTABLE_elements(interpreter, argv)) == 0)
        return pmc_new(interpreter, enum_class_PerlHash);
    if (1 > 1) {
            real_exception(interpreter, NULL, E_TypeError,
                    "TypeError: dict expected at most 1 arguments, got %d",
                    (int)i);
    }
    arg = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
    switch (arg->vtable->base_type) {
        case enum_class_PerlHash:
            return arg;
        case enum_class_PerlArray:      /* sequence from BUILD_LIST */
            return dict_from_tuple_array(interpreter, arg);
        default:
            internal_exception(1, "Unimplemented dict argument");
    }
    return NULL;
}

static PMC *
parrot_py_list(Interp *interpreter, PMC *argv)
{
    PMC *arg;
    INTVAL i;
    PMC *iter, *list;
    /*
     * no arguments: return a new list
     */
    if ((i = VTABLE_elements(interpreter, argv)) == 0)
        return pmc_new(interpreter, enum_class_PerlArray);
    if (1 > 1) {
            real_exception(interpreter, NULL, E_TypeError,
                    "TypeError: list expected at most 1 arguments, got %d",
                    (int)i);
    }
    arg = VTABLE_get_pmc_keyed_int(interpreter, argv, 0);
    iter = NULL;
    switch (arg->vtable->base_type) {
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
parrot_py_hash(Interp *interpreter, PMC *pmc)
{
    PMC *h = pmc_new_noinit(interpreter, enum_class_PerlInt);
    INTVAL i;

    switch (pmc->vtable->base_type) {
        case enum_class_PerlString:
        case enum_class_String:
            i = string_hash(interpreter, PMC_str_val(pmc));
            break;
        default:
            i = VTABLE_get_integer(interpreter, pmc);
            break;
    }
    PMC_int_val(h) = i;
    return h;
}

static PMC *
parrot_py_iter(Interp *interpreter, PMC *pmc)
{
    return pmc_new_init(interpreter, enum_class_Iterator, pmc);
}

static PMC *
parrot_py_range(Interp *interpreter, PMC *args)
{
    PMC *ar = pmc_new(interpreter, enum_class_PerlArray);
    INTVAL start = 0, end, step = 1;
    int i, k;
    i = VTABLE_elements(interpreter, args);
    if (i == 1) {
        end = VTABLE_get_integer_keyed_int(interpreter, args, 0);
    }
    else if (i == 2) {
        start = VTABLE_get_integer_keyed_int(interpreter, args, 0);
        end = VTABLE_get_integer_keyed_int(interpreter, args, 1);
    }
    else if (i == 3) {
        start = VTABLE_get_integer_keyed_int(interpreter, args, 0);
        end = VTABLE_get_integer_keyed_int(interpreter, args, 1);
        step = VTABLE_get_integer_keyed_int(interpreter, args, 2);
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
        case enum_class_PerlArray:
            return pmc;
        case enum_class_String:
        case enum_class_PerlString:
            ar = pmc_new(interpreter, enum_class_PerlArray);
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

static void
parrot_py_global(Interp *interpreter, void *func,
        STRING *name, STRING *sig)
{
    PMC *method;
    method = pmc_new(interpreter, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interpreter, method, sig, func);
    Parrot_store_global(interpreter, NULL, name, method);
}

/*

=item C<static void parrot_py_create_funcs(Interp *interpreter)>

Initialize Python builtin functions.

*/

static void
parrot_py_create_funcs(Interp *interpreter)
{
    STRING *pip   =    CONST_STRING(interpreter, "PIP");
    STRING *pipp   =   CONST_STRING(interpreter, "PIPP");
    STRING *pippp   =  CONST_STRING(interpreter, "PIPPP");

    STRING *callable = CONST_STRING(interpreter, "callable");
    STRING *chr      = CONST_STRING(interpreter, "chr");
    STRING *dict     = CONST_STRING(interpreter, "dict");
    STRING *enumerate= CONST_STRING(interpreter, "enumerate");
    STRING *filter   = CONST_STRING(interpreter, "filter");
    STRING *hash     = CONST_STRING(interpreter, "hash");
    STRING *list     = CONST_STRING(interpreter, "list");
    STRING *map      = CONST_STRING(interpreter, "map");
    STRING *max      = CONST_STRING(interpreter, "max");
    STRING *min      = CONST_STRING(interpreter, "min");
    STRING *range    = CONST_STRING(interpreter, "range");
    STRING *reduce   = CONST_STRING(interpreter, "reduce");
    STRING *tuple    = CONST_STRING(interpreter, "tuple");

    parrot_py_global(interpreter, F2DPTR(parrot_py_callable), callable, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_chr), chr, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_dict), dict, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_enumerate), enumerate, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_filter), filter, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hash), hash, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_list), list, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_map), map, pipp);
    parrot_py_global(interpreter, F2DPTR(parrot_py_max), max, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_min), min, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range), range, pip);
    parrot_py_global(interpreter, F2DPTR(parrot_py_reduce), reduce, pipp);
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

=item C<void Parrot_py_init(Interp *interpreter)>

Initialize Python functions.

*/

void
Parrot_py_init(Interp *interpreter)
{
    parrot_py_create_funcs(interpreter);
    parrot_py_create_exceptions(interpreter);
    parrot_py_create_vars(interpreter);
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
