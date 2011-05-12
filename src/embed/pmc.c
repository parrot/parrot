/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/embed/pmc.c - The Parrot PMC embedding interface

=head1 DESCRIPTION

This file implements PMC functions of the Parrot embedding interface.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

/*

=item C<Parrot_Int Parrot_api_pmc_new_from_class(Parrot_PMC interp_pmc,
Parrot_PMC class_pmc, Parrot_PMC init, Parrot_PMC * pmc)>

Instantiate a new PMC of C<class_pmc> using C<init> values PMC and stores the
brand new object in C<pmc>. This function returns a true value if this call is
successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_new_from_class(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC class_pmc),
        ARGIN_NULLOK(Parrot_PMC init), ARGOUT(Parrot_PMC * pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_new_from_class)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (init == NULL)
        init = PMCNULL;
    *pmc = VTABLE_instantiate(interp, class_pmc, init);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_deserialize(Parrot_PMC interp_pmc,
Parrot_String fpmc, Parrot_PMC * pmc)>

Deserializes the PMC contained in C<fpmc> string and stores it in C<pmc>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_String fpmc),
        ARGOUT(Parrot_PMC * pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_deserialize)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_pf_verify_image_string(interp, fpmc);
    *pmc = Parrot_thaw(interp, fpmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_deserialize_bytes(Parrot_PMC interp_pmc, const
unsigned char *fpmc, Parrot_Int length, Parrot_PMC *pmc)>

Deserializes the PMC contained in C<fpmc> buffer of C<length> and stores it in
C<pmc>. This function returns a true value if this call is successful and false
value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_deserialize_bytes(ARGIN(Parrot_PMC interp_pmc), ARGIN(const unsigned char *fpmc),
        Parrot_Int length, ARGOUT(Parrot_PMC *pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_deserialize_bytes)
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const fpmc_str = Parrot_str_new_init(interp, (const char *)fpmc,
        length, Parrot_binary_encoding_ptr, PObj_external_FLAG);
    *pmc = Parrot_thaw(interp, fpmc_str);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_null(Parrot_PMC interp_pmc, Parrot_PMC
*pmctonull)>

Nullify C<pmctonull> PMC. This function returns a true value if this call is
successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_null(ARGIN(Parrot_PMC interp_pmc), ARGOUT(Parrot_PMC *pmctonull))
{
    ASSERT_ARGS(Parrot_api_pmc_null)
    EMBED_API_CALLIN(interp_pmc, interp)
    *pmctonull = PMCNULL;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_string(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_String * str)>

Stores an string in C<str> that represents the string value of the PMC. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_string(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGOUT(Parrot_String * str))
{
    ASSERT_ARGS(Parrot_api_pmc_get_string)
    EMBED_API_CALLIN(interp_pmc, interp)
    *str = VTABLE_get_string(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_integer(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_Int * value)>

Stores an integer in C<value> that represents the integer value of the PMC. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_integer(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGOUT(Parrot_Int * value))
{
    ASSERT_ARGS(Parrot_api_pmc_get_integer)
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_integer(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_float(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_Float * value)>

Stores a float in C<value> that represents the float value of the PMC. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_float(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGOUT(Parrot_Float * value))
{
    ASSERT_ARGS(Parrot_api_pmc_get_float)
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_number(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_keyed(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_PMC key, Parrot_PMC * value)>

Lookup the value in the aggregate C<pmc> with the PMC C<key>. Return C<1> on
success, C<0> on failure.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_PMC key, ARGOUT(Parrot_PMC * value))
{
    ASSERT_ARGS(Parrot_api_pmc_get_keyed)
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_keyed_int(Parrot_PMC interp_pmc,
Parrot_PMC pmc, Parrot_Int key, Parrot_PMC *value)>

Stores the integer value of whatever is stored at the element of the C<pmc>
indexed by C<key>. This function returns a true value if this call is successful
and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed_int(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        Parrot_Int key, ARGOUT(Parrot_PMC *value))
{
    ASSERT_ARGS(Parrot_api_pmc_get_keyed_int)
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed_int(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_keyed_string(Parrot_PMC interp_pmc,
Parrot_PMC pmc, Parrot_String key, Parrot_PMC * value)>

Stores the string value of whatever is stored at the element of the C<pmc>
indexed by C<key>. This function returns a true value if this call is successful
and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_keyed_string(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGIN(Parrot_String key), ARGOUT(Parrot_PMC * value))
{
    ASSERT_ARGS(Parrot_api_pmc_get_keyed_string)
    EMBED_API_CALLIN(interp_pmc, interp)
    *value = VTABLE_get_pmc_keyed_str(interp, pmc, key);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_string(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_String value)>

Sets the string C<value> as C<pmc>'s value. This function returns a true value if
this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_string(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGIN(Parrot_String value))
{
    ASSERT_ARGS(Parrot_api_pmc_set_string)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_string_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_integer(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_Int value)>

Sets the integer C<value> as C<pmc>'s value. This function returns a true value
if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_integer(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        Parrot_Int value)
{
    ASSERT_ARGS(Parrot_api_pmc_set_integer)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_integer_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_float(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_Float value)>

Sets the float C<value> as the C<pmc>'s value. This function returns a true value
if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_float(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        Parrot_Float value)
{
    ASSERT_ARGS(Parrot_api_pmc_set_float)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_number_native(interp, pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_keyed(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_PMC key, Parrot_PMC value)>

Sets the value in aggregate C<pmc> using the PMC C<key>. Returns 1 on success,
0 on failure.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed(Parrot_PMC interp_pmc, Parrot_PMC pmc,
    Parrot_PMC key, Parrot_PMC value)
{
    ASSERT_ARGS(Parrot_api_pmc_set_keyed)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_keyed_int(Parrot_PMC interp_pmc,
Parrot_PMC pmc, Parrot_Int key, Parrot_PMC value)>

Stets the integer C<value> at the element of the C<pmc> indexed by C<key>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed_int(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        Parrot_Int key, ARGIN(Parrot_PMC value))
{
    ASSERT_ARGS(Parrot_api_pmc_set_keyed_int)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed_int(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_set_keyed_string(Parrot_PMC interp_pmc,
Parrot_PMC pmc, Parrot_String key, Parrot_PMC value)>

Stets the string C<value> at the element of the C<pmc> indexed by C<key>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_set_keyed_string(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC pmc),
        ARGIN(Parrot_String key), ARGIN(Parrot_PMC value))
{
    ASSERT_ARGS(Parrot_api_pmc_set_keyed_string)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_set_pmc_keyed_str(interp, pmc, key, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_box_string(Parrot_PMC interp_pmc,
Parrot_String str, Parrot_PMC * str_pmc)>

Wraps the string C<str> into a PMC and stores the results in C<str_pmc>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_box_string(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_String str),
        ARGOUT(Parrot_PMC * str_pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_box_string)
    EMBED_API_CALLIN(interp_pmc, interp)
    *str_pmc = Parrot_pmc_box_string(interp, str);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_box_integer(Parrot_PMC interp_pmc, Parrot_Int
value, Parrot_PMC * int_pmc)>

Wraps the integer C<str> into a PMC and stores the results in C<int_pmc>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_box_integer(Parrot_PMC interp_pmc, Parrot_Int value,
        ARGOUT(Parrot_PMC * int_pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_box_integer)
    EMBED_API_CALLIN(interp_pmc, interp)
    *int_pmc = Parrot_pmc_new(interp, enum_class_Integer);
    VTABLE_set_integer_native(interp, *int_pmc, value);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/* TODO: Box float */

/*

=item C<Parrot_Int Parrot_api_pmc_push(Parrot_PMC interp_pmc, Parrot_PMC pmc,
Parrot_PMC item)>

Push a PMC C<item> onto aggregate PMC C<pmc>.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_push(Parrot_PMC interp_pmc, Parrot_PMC pmc, Parrot_PMC item)
{
    ASSERT_ARGS(Parrot_api_pmc_push)
    EMBED_API_CALLIN(interp_pmc, interp)
    VTABLE_push_pmc(interp, pmc, item);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_add_exception_handler(Parrot_PMC interp_pmc,
Parrot_PMC handler)>

Adds a C<handler> to scheduler's list of handlers. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

/*PARROT_API
Parrot_Int
Parrot_api_add_exception_handler(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC handler))
{
    ASSERT_ARGS(Parrot_api_add_exception_handler)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_cx_add_handler(interp, handler);
    EMBED_API_CALLOUT(interp_pmc, interp)
}*/

/*

=item C<Parrot_Int Parrot_api_pmc_invoke(Parrot_PMC interp_pmc, Parrot_PMC sub,
Parrot_PMC signature)>

Invokes the C<sub> with C<signature> PMC in which parameters are stored. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_invoke(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC sub),
        ARGIN(Parrot_PMC signature))
{
    ASSERT_ARGS(Parrot_api_pmc_invoke)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC  * const old_call_obj = Parrot_pcc_get_signature(interp,
        CURRENT_CONTEXT(interp));
    Parrot_pcc_invoke_from_sig_object(interp, sub, signature);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_call_obj);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_wrap_string_array(Parrot_PMC interp_pmc,
Parrot_Int argc, const char ** argv, Parrot_PMC * args)>

Wraps an C<argv> string array of C<argc> size into a PMC array and stores it in
C<args>. This function returns a true value if this call is successful and false
value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_wrap_string_array(ARGIN(Parrot_PMC interp_pmc), Parrot_Int argc,
        ARGIN(const char ** argv), ARGOUT(Parrot_PMC * args))
{
    ASSERT_ARGS(Parrot_api_pmc_wrap_string_array)
    EMBED_API_CALLIN(interp_pmc, interp)
    *args = Parrot_pmc_box_c_string_array(interp, argc, argv);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_pmc_get_class(Parrot_PMC interp_pmc, Parrot_PMC
key, Parrot_PMC *class_pmc)>

Lookup the PMC class named C<key> and stores it in the C<class_pmc> PMC. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_get_class(ARGIN(Parrot_PMC interp_pmc), ARGIN(Parrot_PMC key),
        ARGOUT(Parrot_PMC *class_pmc))
{
    ASSERT_ARGS(Parrot_api_pmc_get_class)
    EMBED_API_CALLIN(interp_pmc, interp)
    *class_pmc = Parrot_oo_get_class(interp, key);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_find_method(Parrot_PMC interp_pmc, Parrot_PMC
object, Parrot_String name, Parrot_PMC *method)>

Find a method PMC by name on the given object PMC.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_find_method(Parrot_PMC interp_pmc, Parrot_PMC object,
        Parrot_String name, ARGOUT(Parrot_PMC *method))
{
    ASSERT_ARGS(Parrot_api_pmc_find_method)
    EMBED_API_CALLIN(interp_pmc, interp);
    *method = VTABLE_find_method(interp, object, name);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_serialize(Parrot_PMC interp_pmc, Parrot_PMC
object, Parrot_String *frozen)>

Serialize a PMC into an archived String format. Also known as freezing or pickling.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_serialize(Parrot_PMC interp_pmc, Parrot_PMC object,
        ARGOUT(Parrot_String *frozen))
{
    ASSERT_ARGS(Parrot_api_pmc_serialize)
    EMBED_API_CALLIN(interp_pmc, interp);
    *frozen =  Parrot_freeze(interp, object);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_pmc_keep_alive(Parrot_PMC interp_pmc, Parrot_PMC
pmc, Parrot_Int alive)>

Force the alive status of a PMC with respect to Parrot's Garbage collector.
if C<alive> is non-zero, the PMC becomes immune to garbage collection. This is
important if you have a reference to a PMC which is used by places that the
GC does not search. If C<alive> is zero, the PMC loses its protection and
can be reclaimed by the GC like normal if it falls out of scope.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_pmc_keep_alive(Parrot_PMC interp_pmc, Parrot_PMC pmc, Parrot_Int alive)
{
    ASSERT_ARGS(Parrot_api_pmc_keep_alive)
    EMBED_API_CALLIN(interp_pmc, interp);
    if (alive)
        Parrot_pmc_gc_register(interp, pmc);
    else
        Parrot_pmc_gc_unregister(interp, pmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
