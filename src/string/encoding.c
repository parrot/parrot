/*
Copyright (C) 2004-2010, Parrot Foundation.

=head1 NAME

src/string/encoding.c - global encoding functions

=head1 DESCRIPTION

These are parrot's generic encoding handling functions

=over 4

=cut

*/

#include "parrot/encoding.h"
#include "encoding.str"

STR_VTABLE *Parrot_default_encoding_ptr  = NULL;
STR_VTABLE *Parrot_platform_encoding_ptr = NULL;

static STR_VTABLE **encodings;
static int          n_encodings;
static STRING      *platform_str;
/* for backwards compatibility */
static STRING      *unicode_str;
static STRING      *fixed_8_str;

/* HEADERIZER HFILE: include/parrot/encoding.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void Parrot_deinit_encodings(PARROT_INTERP)>

Deinitialize encodings and free all memory used by them.

=cut

*/

void
Parrot_deinit_encodings(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_deinit_encodings)

    mem_gc_free(interp, encodings);
    encodings   = NULL;
    n_encodings = 0;
}

/*

=item C<STR_VTABLE * Parrot_new_encoding(PARROT_INTERP)>

Allocates the memory for a new string vtable from the system.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STR_VTABLE *
Parrot_new_encoding(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_new_encoding)
    return mem_gc_allocate_typed(interp, STR_VTABLE);
}

/*

=item C<const STR_VTABLE * Parrot_find_encoding(PARROT_INTERP, const char
*encodingname)>

Finds an encoding with the C string name C<encodingname>. Returns the encoding
if it is successfully found, returns NULL otherwise.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE *
Parrot_find_encoding(SHIM_INTERP, ARGIN(const char *encodingname))
{
    ASSERT_ARGS(Parrot_find_encoding)
    const int n = n_encodings;
    int i;

    for (i = 0; i < n; ++i)
        if (STREQ(encodings[i]->name, encodingname))
            return encodings[i];

    /* backwards compatibility */
    if (strcmp(encodingname, "unicode") == 0)
        return Parrot_utf8_encoding_ptr;

    if (strcmp(encodingname, "platform") == 0)
        return Parrot_platform_encoding_ptr;

    return NULL;
}


/*

=item C<const STR_VTABLE * Parrot_find_encoding_by_string(PARROT_INTERP, STRING
*encodingname)>

Finds an encoding with the STRING name C<encodingname>. Returns the encoding
if it is successfully found, throws an exception otherwise. Returns the
default encoding for the NULL string.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE *
Parrot_find_encoding_by_string(PARROT_INTERP, ARGIN(STRING *encodingname))
{
    ASSERT_ARGS(Parrot_find_encoding_by_string)
    const int n = n_encodings;
    int i;

    if (STRING_IS_NULL(encodingname))
        return Parrot_default_encoding_ptr;

    for (i = 0; i < n; ++i)
        if (STRING_equal(interp, encodings[i]->name_str, encodingname))
            return encodings[i];

    /* backwards compatibility */
    if (STRING_equal(interp, encodingname, CONST_STRING(interp, "unicode")))
        return Parrot_utf8_encoding_ptr;

    if (STRING_equal(interp, encodingname, CONST_STRING(interp, "platform")))
        return Parrot_platform_encoding_ptr;

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "invalid encoding '%Ss'", encodingname);
}


/*

=item C<const STR_VTABLE * Parrot_load_encoding(PARROT_INTERP, const char
*encodingname)>

Loads an encoding. Currently throws an exception because we cannot load
encodings. See https://trac.parrot.org/parrot/wiki/StringsTasklist.

=cut

*/

/* Yep, this needs to be a char * parameter -- it's tough to load in
   encodings and such for strings if we can't be sure we've got enough
   info set up to actually build strings...

    Also remember to use PARROT_WARN_UNUSED_RESULT and
    PARROT_CANNOT_RETURN_NULL when this actually works.
 */

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_CANNOT_RETURN_NULL
const STR_VTABLE *
Parrot_load_encoding(PARROT_INTERP, ARGIN(const char *encodingname))
{
    ASSERT_ARGS(Parrot_load_encoding)
    UNUSED(encodingname);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Can't load encodings yet");
}

/*

=item C<INTVAL Parrot_encoding_number(PARROT_INTERP, const STRING
*encodingname)>

Return the number of the encoding or -1 if not found.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_encoding_number(PARROT_INTERP, ARGIN(const STRING *encodingname))
{
    ASSERT_ARGS(Parrot_encoding_number)
    const int n = n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (STRING_equal(interp, encodings[i]->name_str, encodingname))
            return i;
    }

    /* backwards compatibility */
    if (STRING_equal(interp, encodingname, unicode_str)) {
        for (i = 0; i < n; ++i) {
            if (STREQ(encodings[i]->name, "utf8"))
                return i;
        }
    }
    else if (STRING_equal(interp, encodingname, fixed_8_str)) {
        for (i = 0; i < n; ++i) {
            if (STREQ(encodings[i]->name, "ascii"))
                return i;
        }
    }
    else if (STRING_equal(interp, encodingname, platform_str)) {
        for (i = 0; i < n; ++i) {
            if (encodings[i] == Parrot_platform_encoding_ptr)
                return i;
        }
    }

    return -1;
}

/*

=item C<INTVAL Parrot_encoding_number_of_str(PARROT_INTERP, const STRING *src)>

Return the number of the encoding of the given string or -1 if not found.

This could be converted to a macro.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_encoding_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(Parrot_encoding_number_of_str)

    return src->encoding->num;
}

/*

=item C<STRING* Parrot_encoding_name(PARROT_INTERP, INTVAL number_of_encoding)>

Returns the name of a character encoding based on the INTVAL index
C<number_of_encoding> to the All_encodings array.

This could be converted to a macro.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_encoding_name(SHIM_INTERP, INTVAL number_of_encoding)
{
    ASSERT_ARGS(Parrot_encoding_name)
    if (number_of_encoding >= n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return encodings[number_of_encoding]->name_str;
}

/*

=item C<const STR_VTABLE* Parrot_get_encoding(PARROT_INTERP, INTVAL
number_of_encoding)>

Returns the encoding given by the INTVAL index C<number_of_encoding>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const STR_VTABLE*
Parrot_get_encoding(SHIM_INTERP, INTVAL number_of_encoding)
{
    ASSERT_ARGS(Parrot_get_encoding)
    if (number_of_encoding >= n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return encodings[number_of_encoding];
}

/*

=item C<const char * Parrot_encoding_c_name(PARROT_INTERP, INTVAL
number_of_encoding)>

Returns the NULL-terminated C string representation of the encodings name
given by the C<number_of_encoding>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const char *
Parrot_encoding_c_name(SHIM_INTERP, INTVAL number_of_encoding)
{
    ASSERT_ARGS(Parrot_encoding_c_name)
    if (number_of_encoding >= n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return encodings[number_of_encoding]->name;
}

/*

=item C<void Parrot_str_internal_register_encoding_names(PARROT_INTERP)>

Helper function for initializing characterset encoding names. We can't create
the STRING names until the default encodings are already initted,
so the name generation is split into a second init stage.

=cut

*/


void
Parrot_str_internal_register_encoding_names(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_str_internal_register_encoding_names)
    int n;
    for (n = 0; n < n_encodings; ++n)
        encodings[n]->name_str =
            Parrot_str_new_constant(interp, encodings[n]->name);
    /* Can't use CONST_STRING here, not setup yet */
    unicode_str  = Parrot_str_new_constant(interp, "unicode");
    fixed_8_str  = Parrot_str_new_constant(interp, "fixed_8");
    platform_str = Parrot_str_new_constant(interp, "platform");
}

/*

=item C<INTVAL Parrot_register_encoding(PARROT_INTERP, STR_VTABLE *encoding)>

Registers a character encoding C<encoding> with name C<encodingname>.
Only allows one of 5 possibilities: fixed_8, utf8, utf16, ucs2 and ucs4.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_register_encoding(PARROT_INTERP, ARGIN(STR_VTABLE *encoding))
{
    ASSERT_ARGS(Parrot_register_encoding)
    int i;
    int n = n_encodings;

    for (i = 0; i < n_encodings; ++i) {
        if (STREQ(encodings[i]->name, encoding->name))
            return 0;
    }

    if (!n)
        encodings = mem_gc_allocate_zeroed_typed(interp, STR_VTABLE *);
    else
        encodings = mem_gc_realloc_n_typed_zeroed(interp,
                encodings, n + 1, n, STR_VTABLE *);

    encoding->num = n;
    encodings[n]  = encoding;
    ++n_encodings;

    return 1;
}

/*

=item C<void Parrot_encodings_init(PARROT_INTERP)>

Creates the initial encodings.

=cut

*/

PARROT_EXPORT
void
Parrot_encodings_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_encodings_init)

    Parrot_register_encoding(interp, Parrot_ascii_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_latin1_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_binary_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_utf8_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_utf16_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_ucs2_encoding_ptr);
    Parrot_register_encoding(interp, Parrot_ucs4_encoding_ptr);

    Parrot_default_encoding_ptr = Parrot_ascii_encoding_ptr;
    Parrot_init_platform_encoding(interp);

    /* Now that the plugins are registered, we can create STRING
     * names for them.  */
    Parrot_str_internal_register_encoding_names(interp);
}

/*

=item C<INTVAL Parrot_make_default_encoding(PARROT_INTERP, const char
*encodingname, STR_VTABLE *encoding)>

Sets the default encoding to C<encoding> with name C<encodingname>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_make_default_encoding(SHIM_INTERP, ARGIN(SHIM(const char *encodingname)),
        ARGIN(STR_VTABLE *encoding))
{
    ASSERT_ARGS(Parrot_make_default_encoding)
    Parrot_default_encoding_ptr = encoding;
    return 1;
}

/*

=item C<const STR_VTABLE * Parrot_default_encoding(PARROT_INTERP)>

Gets the default encoding.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const STR_VTABLE *
Parrot_default_encoding(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_default_encoding)
    return Parrot_default_encoding_ptr;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
