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
parrot_py_range(Interp *interpreter, int start, int end, int step)
{
    PMC *ar = pmc_new(interpreter, enum_class_PerlArray);
    int i, k;
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
parrot_py_range_1(Interp *interpreter, PMC *pmc)
{

    INTVAL end = VTABLE_get_integer(interpreter, pmc);
    return parrot_py_range(interpreter, 0, end, 1);
}

static PMC *
parrot_py_range_2(Interp *interpreter, PMC *st, PMC *pmc)
{

    INTVAL start = VTABLE_get_integer(interpreter, st);
    INTVAL end = VTABLE_get_integer(interpreter, pmc);
    return parrot_py_range(interpreter, start, end, 1);
}

static PMC *
parrot_py_range_3(Interp *interpreter, PMC *sta, PMC *pmc, PMC *ste)
{

    INTVAL start = VTABLE_get_integer(interpreter, sta);
    INTVAL end = VTABLE_get_integer(interpreter, pmc);
    INTVAL step = VTABLE_get_integer(interpreter, ste);
    if (step == 0)
        real_exception(interpreter, NULL, E_ValueError,
                "range() step argument must not be zero");
    return parrot_py_range(interpreter, start, end, step);
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
    STRING *callable     = CONST_STRING(interpreter, "callable");
    STRING *callable_sig = CONST_STRING(interpreter, "PIP");

    STRING *chr     = CONST_STRING(interpreter, "chr");
    STRING *chr_sig = CONST_STRING(interpreter, "PIP");

    STRING *hash     = CONST_STRING(interpreter, "hash");
    STRING *hash_sig = CONST_STRING(interpreter, "PIP");

    STRING *iter     = CONST_STRING(interpreter, "iter");
    STRING *iter_sig = CONST_STRING(interpreter, "PIP");

    STRING *filter     = CONST_STRING(interpreter, "filter");
    STRING *filter_sig = CONST_STRING(interpreter, "PIPP");

    STRING *range_1     = CONST_STRING(interpreter, "range_1");
    STRING *range_1_sig = CONST_STRING(interpreter, "PIP");

    STRING *range_2     = CONST_STRING(interpreter, "range_2");
    STRING *range_2_sig = CONST_STRING(interpreter, "PIPP");

    STRING *range_3     = CONST_STRING(interpreter, "range_3");
    STRING *range_3_sig = CONST_STRING(interpreter, "PIPPP");

    STRING *tuple     = CONST_STRING(interpreter, "tuple");
    STRING *tuple_sig = CONST_STRING(interpreter, "PIP");

    parrot_py_global(interpreter, F2DPTR(parrot_py_callable),
            callable, callable_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_chr),
            chr, chr_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hash),
            hash, hash_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_iter),
            iter, iter_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_filter),
            filter, filter_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range_1),
            range_1, range_1_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range_2),
            range_2, range_2_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range_3),
            range_3, range_3_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_tuple),
            tuple, tuple_sig);
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
