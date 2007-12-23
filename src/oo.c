/*
Copyright (C) 2007, The Perl Foundation.
$Id$

=head1 NAME

oo.c - Class and object

=head1 DESCRIPTION

Handles class and object manipulation.

=head2 Functions

=over 4

=cut

*/

#define PARROT_IN_OO_C
#define PARROT_IN_OBJECTS_C /* To get the vtable.h imports we want. */
#include "parrot/parrot.h"
#include "parrot/oo_private.h"

#include "oo.str"

/* HEADERIZER HFILE: include/parrot/oo.h */

/*

=item C<void Parrot_oo_extract_methods_from_namespace>

Extract methods and vtable overrides from the given namespace and insert them
into the class.

=cut

*/

void
Parrot_oo_extract_methods_from_namespace(PARROT_INTERP, NOTNULL(PMC *self))
{
    Parrot_Class * const _class = PARROT_CLASS(self);
    PMC * const ns = _class->_namespace;

    /* Pull in methods from the namespace, if any. */
    if (!PMC_IS_NULL(ns)) {
        PMC *methods, *vtable_overrides;

        /* Import any methods. */
        Parrot_PCCINVOKE(interp, ns,
            CONST_STRING(interp, "get_associated_methods"), "->P", &methods);
        if (!PMC_IS_NULL(methods)) {
            PMC * const iter = VTABLE_get_iter(interp, methods);

            while (VTABLE_get_bool(interp, iter)) {
                STRING * const meth_name = VTABLE_shift_string(interp, iter);
                PMC    * const meth_sub  = VTABLE_get_pmc_keyed_str(interp, methods,
                    meth_name);
                VTABLE_add_method(interp, self, meth_name, meth_sub);
            }
        }

        /* Import any vtable methods. */
        Parrot_PCCINVOKE(interp, ns,
            CONST_STRING(interp, "get_associated_vtable_methods"), "->P", &vtable_overrides);
        if (!PMC_IS_NULL(vtable_overrides)) {
            PMC * const iter = VTABLE_get_iter(interp, vtable_overrides);
            while (VTABLE_get_bool(interp, iter)) {
                STRING * const vtable_index_str = VTABLE_shift_string(interp, iter);
                PMC    * const vtable_sub       = VTABLE_get_pmc_keyed_str(interp,
                    vtable_overrides, vtable_index_str);

                /* Look up the name of the vtable function from the index. */
                const INTVAL vtable_index = string_to_int(interp, vtable_index_str);
                const char * const meth_c = Parrot_vtable_slot_names[vtable_index];
                STRING *vtable_name = string_from_cstring(interp, meth_c, 0);

                /* Strip leading underscores in the vtable name */
                if (string_str_index(interp, vtable_name,
                    CONST_STRING(interp, "__"), 0) == 0) {
                    vtable_name = string_substr(interp, vtable_name, 2,
                        string_length(interp, vtable_name) - 2, NULL, 0);
                }

                VTABLE_add_vtable_override(interp, self, vtable_name, vtable_sub);
            }
        }
    }
}

/*

=item C<PMC * Parrot_oo_get_namespace>

Lookup a namespace object from a class PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_namespace(PARROT_INTERP, NOTNULL(PMC *classobj))
{
    Parrot_Class * const _class     = PARROT_CLASS(classobj);
    PMC          * const _namespace = _class->_namespace;

    if (PMC_IS_NULL(_namespace))
        return PMCNULL;
    return _namespace;
}

/*

=item C<PMC * Parrot_oo_get_class>

Lookup a class object from a namespace, string, or key PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class(PARROT_INTERP, NOTNULL(PMC *key))
{
    PMC *classobj = PMCNULL;
    PMC *ns       = PMCNULL;
    PMC *hll_ns;

    if (PObj_is_class_TEST(key))
        classobj = key;

    /* Fast select of behavior based on type of the lookup key */
    switch (key->vtable->base_type) {
        case enum_class_NameSpace:
            classobj = VTABLE_get_class(interp, key);
            break;

        case enum_class_String:
        case enum_class_Key:
        case enum_class_ResizableStringArray:
            hll_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
                    CONTEXT(interp->ctx)->current_HLL);
            ns     = Parrot_get_namespace_keyed(interp, hll_ns, key);

            if (!PMC_IS_NULL(ns))
                classobj = VTABLE_get_class(interp, ns);
        default:
            break;
    }

    if (PMC_IS_NULL(classobj)) {
        /* Look up a low-level class and create a proxy */
        const INTVAL type = pmc_type(interp, VTABLE_get_string(interp, key));

        /* Reject invalid type numbers */
        if (type > interp->n_vtable_max || type <= 0) {
            return PMCNULL;
        }
        else {
             PMC * const type_num = pmc_new(interp, enum_class_Integer);
             VTABLE_set_integer_native(interp, type_num, type);
             classobj = pmc_new_init(interp, enum_class_PMCProxy, type_num);
        }
    }
    return classobj;
}

/*

=item C<PMC * Parrot_oo_get_class_str>

Lookup a class object from a builtin string.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class_str(PARROT_INTERP, NOTNULL(STRING *name))
{
    PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
                           CONTEXT(interp->ctx)->current_HLL);
    PMC * const ns     = Parrot_get_namespace_keyed_str(interp, hll_ns, name);
    PMC * const _class = PMC_IS_NULL(ns) ? PMCNULL : VTABLE_get_class(interp, ns);

    /* Look up a low-level class and create a proxy */
    if (PMC_IS_NULL(_class)) {
        const INTVAL type = pmc_type(interp, name);

        /* Reject invalid type numbers */
        if (type > interp->n_vtable_max || type <= 0) {
            return PMCNULL;
        }
        else {
            PMC * const type_num = pmc_new(interp, enum_class_Integer);
            VTABLE_set_integer_native(interp, type_num, type);
            return pmc_new_init(interp, enum_class_PMCProxy, type_num);
        }
    }

    return _class;
}

/*

=item C<PMC * Parrot_oo_newclass_from_str>

Create a new class object from a string name.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_newclass_from_str(PARROT_INTERP, NOTNULL(STRING *name))
{
    PMC * const namearg = pmc_new(interp, enum_class_String);
    PMC *namehash, *classobj;

    VTABLE_set_string_native(interp, namearg, name);
    namehash = pmc_new(interp, enum_class_Hash);

    VTABLE_set_pmc_keyed_str(interp, namehash, CONST_STRING(interp, "name"), namearg);

    classobj = pmc_new_init(interp, enum_class_Class, namehash);

    PARROT_ASSERT(classobj);
    return classobj;
}

/*

=item C<PMC * Parrot_oo_find_vtable_override_for_class>

Lookup a vtable override in a specific class object.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
        NOTNULL(PMC *classobj),
        NOTNULL(STRING *name))
{
    Parrot_Class *class_info;
    assert(PObj_is_class_TEST(classobj));

    class_info = PARROT_CLASS(classobj);
    return VTABLE_get_pmc_keyed_str(interp, class_info->vtable_overrides, name);
}

/*

=item C<PMC * Parrot_oo_find_vtable_override>

Lookup a vtable override in a class, including any vtable overrides inherited
from parents.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override(PARROT_INTERP,
        NOTNULL(PMC *classobj),
        NOTNULL(STRING *name))
{
    Parrot_Class * const _class = PARROT_CLASS(classobj);

    /* Walk and search for the vtable method. */
    const INTVAL num_classes = VTABLE_elements(interp, _class->all_parents);
    INTVAL i;

    for (i = 0; i < num_classes; i++) {
        /* Get the class. */
        PMC * const cur_class =
            VTABLE_get_pmc_keyed_int(interp, _class->all_parents, i);

        PMC * const meth =
            Parrot_oo_find_vtable_override_for_class(interp, cur_class, name);
        if (!PMC_IS_NULL(meth))
            return meth;
    }
    return PMCNULL;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/oo.h>, F<include/parrot/oo_private.h>,
F<docs/pdds/pdd15_objects.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
