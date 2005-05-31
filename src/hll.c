/*
Copyright: 2005 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/hll.c - High Level Language support

=head1 DESCRIPTION

Parrot core PMCs have to create sometimes new PMCs, which should map
to current HLLs defaults. The current language and a typemap provides
this feature.

=head1 DATA

   interpreter->HLL_info

   @HLL_info = [
     [ HLL_name, { core_type => HLL_type, ... } ],
     ...
     ]

=head2 Functions

=over 4

=item C<INTVAL Parrot_register_HLL(Interp*, STRING *hll_name, STRING *hll_lib)>

Register HLL C<hll_name> within Parrot core. If C<hll_lib> isn't a NULL STRING,
load the shared language support library. Returns a type id for this HLL or 0
on error.

=item C<void Parrot_register_HLL_type(Interp *, INTVAL hll_id,
	INTVAL core_type, INTVAL hll_type)>

Register a type mapping	C<core_type => hll_type> for the given HLL.

=item C<INTVAL Parrot_get_HLL_type(Interp *, INTVAL hll_id, INTVAL core_type)>

Get an equivalent HLL type number for the language C<hll_id> or 0 on error.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

static STRING*
string_as_const_string(Interp* interpreter, STRING *src)
{
    if (PObj_constant_TEST(src))
        return src;
    assert(0);
    return NULL;
}

INTVAL
Parrot_register_HLL(Interp *interpreter,
	STRING *hll_name, STRING *hll_lib)
{
    PMC *hll_info, *entry, *name;
    INTVAL idx;

    /* TODO LOCK or disallow in threads */
    hll_info = interpreter->HLL_info;
    idx = VTABLE_elements(interpreter, hll_info);
    entry = constant_pmc_new(interpreter, enum_class_FixedPMCArray);
    VTABLE_push_pmc(interpreter, hll_info, entry);

    VTABLE_set_integer_native(interpreter, entry, 2);
    name = constant_pmc_new_noinit(interpreter, enum_class_String);
    hll_name = string_as_const_string(interpreter, hll_name);
    VTABLE_set_string_native(interpreter, name, hll_name);
    VTABLE_set_pmc_keyed_int(interpreter, entry, 0, name);

    /* TODO load lib */

    /* UNLOCK */
    return idx;
}

void
Parrot_register_HLL_type(Interp *interpreter, INTVAL hll_id,
	INTVAL core_type, INTVAL *hll_type)
{
}

INTVAL
Parrot_get_HLL_type(Interp *interpreter, INTVAL hll_id, INTVAL core_type)
{
    return 0;
}

/*

=back

=head1 AUTHOR

Leopold Toetsch

=head1 SEE ALSO

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
