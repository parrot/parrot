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
parrot_py_range(Interp *interpreter, int start, int end, int step)
{
    PMC *ar = pmc_new(interpreter, enum_class_PerlArray);
    int i, k;
    for (i = k = 0; i != end; i += step, ++k)
        VTABLE_set_integer_keyed_int(interpreter, ar, k, i);
    return ar;
}

static PMC *
parrot_py_range_1(Interp *interpreter, PMC *pmc)
{

    INTVAL end = VTABLE_get_integer(interpreter, pmc);
    return parrot_py_range(interpreter, 0, end, 1);
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

static void
parrot_py_create_funcs(Interp *interpreter)
{
    STRING *callable     = CONST_STRING(interpreter, "callable");
    STRING *callable_sig = CONST_STRING(interpreter, "PIP");

    STRING *chr     = CONST_STRING(interpreter, "chr");
    STRING *chr_sig = CONST_STRING(interpreter, "PIP");

    STRING *hash     = CONST_STRING(interpreter, "hash");
    STRING *hash_sig = CONST_STRING(interpreter, "PIP");

    STRING *range_1     = CONST_STRING(interpreter, "range_1");
    STRING *range_1_sig = CONST_STRING(interpreter, "PIP");

    parrot_py_global(interpreter, F2DPTR(parrot_py_callable),
            callable, callable_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_chr),
            chr, chr_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_hash),
            hash, hash_sig);
    parrot_py_global(interpreter, F2DPTR(parrot_py_range_1),
            range_1, range_1_sig);
}
/*

=item C<void Parrot_py_init(Interp *interpreter)>

Initialize Python functions.

*/

void Parrot_py_init(Interp *interpreter) {
    parrot_py_create_funcs(interpreter);

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
