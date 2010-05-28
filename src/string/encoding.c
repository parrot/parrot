/*
Copyright (C) 2004-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/encoding.c - global encoding functions

=head1 DESCRIPTION

These are parrot's generic encoding handling functions

=over 4

=cut

*/

#define PARROT_NO_EXTERN_ENCODING_PTRS
#include "parrot/parrot.h"

/* HEADERIZER HFILE: include/parrot/encoding.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL register_encoding(PARROT_INTERP,
    ARGIN(const char *encodingname),
    ARGIN(ENCODING *encoding))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_register_encoding __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(encodingname) \
    , PARROT_ASSERT_ARG(encoding))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

ENCODING *Parrot_default_encoding_ptr = NULL;
ENCODING *Parrot_fixed_8_encoding_ptr = NULL;
ENCODING *Parrot_utf8_encoding_ptr    = NULL;
ENCODING *Parrot_ucs2_encoding_ptr    = NULL;
ENCODING *Parrot_utf16_encoding_ptr   = NULL;
ENCODING *Parrot_ucs4_encoding_ptr    = NULL;
ENCODING *Parrot_nfg_encoding_ptr     = NULL;

typedef struct One_encoding {
    NOTNULL(ENCODING *encoding);
    STRING  *name;
} One_encoding;

typedef struct All_encodings {
    int n_encodings;
    One_encoding *enc;
} All_encodings;

static All_encodings *all_encodings;

/*

=item C<void parrot_deinit_encodings(PARROT_INTERP)>

Deinitialize encodings and free all memory used by them.

=cut

*/

void
parrot_deinit_encodings(PARROT_INTERP)
{
    ASSERT_ARGS(parrot_deinit_encodings)
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        mem_gc_free(interp, all_encodings->enc[i].encoding);
    }
    mem_gc_free(interp, all_encodings->enc);
    mem_gc_free(interp, all_encodings);
    all_encodings = NULL;
}

/*

=item C<ENCODING * Parrot_new_encoding(PARROT_INTERP)>

Allocates the memory for a new C<ENCODING> from the system.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
ENCODING *
Parrot_new_encoding(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_new_encoding)
    return mem_gc_allocate_typed(interp, ENCODING);
}

/*

=item C<const ENCODING * Parrot_find_encoding(PARROT_INTERP, const char
*encodingname)>

Finds an encoding with the name C<encodingname>. Returns the encoding
if it is successfully found, returns NULL otherwise.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING *
Parrot_find_encoding(SHIM_INTERP, ARGIN(const char *encodingname))
{
    ASSERT_ARGS(Parrot_find_encoding)
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i)
        if (STREQ(all_encodings->enc[i].encoding->name, encodingname))
            return all_encodings->enc[i].encoding;
    return NULL;
}

/*

=item C<const ENCODING * Parrot_load_encoding(PARROT_INTERP, const char
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
const ENCODING *
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
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (Parrot_str_equal(interp, all_encodings->enc[i].name, encodingname))
            return i;
    }
    return -1;
}

/*

=item C<INTVAL Parrot_encoding_number_of_str(PARROT_INTERP, const STRING *src)>

Return the number of the encoding of the given string or -1 if not found.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_encoding_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(Parrot_encoding_number_of_str)
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (src->encoding == all_encodings->enc[i].encoding)
            return i;
    }
    return -1;
}

/*

=item C<STRING* Parrot_encoding_name(PARROT_INTERP, INTVAL number_of_encoding)>

Returns the name of a character encoding based on the INTVAL index
C<number_of_encoding> to the All_encodings array.

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
    if (number_of_encoding >= all_encodings->n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return all_encodings->enc[number_of_encoding].name;
}

/*

=item C<const ENCODING* Parrot_get_encoding(PARROT_INTERP, INTVAL
number_of_encoding)>

Returns the encoding given by the INTVAL index C<number_of_encoding>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const ENCODING*
Parrot_get_encoding(SHIM_INTERP, INTVAL number_of_encoding)
{
    ASSERT_ARGS(Parrot_get_encoding)
    if (number_of_encoding >= all_encodings->n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding;
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
    if (number_of_encoding >= all_encodings->n_encodings ||
        number_of_encoding < 0)
        return NULL;
    return all_encodings->enc[number_of_encoding].encoding->name;
}

/*

=item C<static INTVAL register_encoding(PARROT_INTERP, const char *encodingname,
ENCODING *encoding)>

Registers a new character encoding C<encoding> with the given name
C<encodingname>. Returns 1 if successful, returns 0 otherwise.

=cut

*/

static INTVAL
register_encoding(PARROT_INTERP, ARGIN(const char *encodingname),
        ARGIN(ENCODING *encoding))
{
    ASSERT_ARGS(register_encoding)
    const int n = all_encodings->n_encodings;
    int i;

    for (i = 0; i < n; ++i) {
        if (STREQ(all_encodings->enc[i].encoding->name, encodingname))
            return 0;
    }
    /*
     * TODO
     * this needs either a LOCK or we just forbid dynamic
     * loading of encodings from inside threads
     */
    if (!n)
        all_encodings->enc = mem_gc_allocate_zeroed_typed(interp, One_encoding);
    else
        all_encodings->enc = mem_gc_realloc_n_typed_zeroed(interp,
                all_encodings->enc, n + 1, n, One_encoding);
    ++all_encodings->n_encodings;
    all_encodings->enc[n].encoding = encoding;

    return 1;
}

/*

=item C<void Parrot_str_internal_register_encoding_names(PARROT_INTERP)>

Helper function for initializing characterset encoding names. We can't create
the STRING names until the default encodings and charsets are already initted,
so the name generation is split into a second init stage.

=cut

*/


void
Parrot_str_internal_register_encoding_names(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_str_internal_register_encoding_names)
    int n;
    for (n = 0; n < all_encodings->n_encodings; ++n)
        all_encodings->enc[n].name =
            Parrot_str_new_constant(interp, all_encodings->enc[n].encoding->name);
}

/*

=item C<INTVAL Parrot_register_encoding(PARROT_INTERP, const char *encodingname,
ENCODING *encoding)>

Registers a character encoding C<encoding> with name C<encodingname>.
Allows one of 6 possibilities: fixed_8, utf8, utf16, ucs2, ucs4 and nfg.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_register_encoding(PARROT_INTERP, ARGIN(const char *encodingname),
        ARGIN(ENCODING *encoding))
{
    ASSERT_ARGS(Parrot_register_encoding)
    if (!all_encodings) {
        all_encodings = mem_gc_allocate_zeroed_typed(interp, All_encodings);
        all_encodings->n_encodings = 0;
        all_encodings->enc = NULL;
    }
    if (STREQ("fixed_8", encodingname)) {
        Parrot_fixed_8_encoding_ptr = encoding;
        if (!Parrot_default_encoding_ptr) {
            Parrot_default_encoding_ptr = encoding;

        }
        return register_encoding(interp, encodingname, encoding);
    }
    if (STREQ("utf8", encodingname)) {
        Parrot_utf8_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (STREQ("utf16", encodingname)) {
        Parrot_utf16_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (STREQ("ucs2", encodingname)) {
        Parrot_ucs2_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (STREQ("ucs4", encodingname)) {
        Parrot_ucs4_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    if (STREQ("nfg", encodingname)) {
        Parrot_nfg_encoding_ptr = encoding;
        return register_encoding(interp, encodingname, encoding);
    }
    return 0;
}

/*

=item C<INTVAL Parrot_make_default_encoding(PARROT_INTERP, const char
*encodingname, ENCODING *encoding)>

Sets the default encoding to C<encoding> with name C<encodingname>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_make_default_encoding(SHIM_INTERP, SHIM(const char *encodingname),
        ARGIN(ENCODING *encoding))
{
    ASSERT_ARGS(Parrot_make_default_encoding)
    Parrot_default_encoding_ptr = encoding;
    return 1;
}

/*

=item C<const ENCODING * Parrot_default_encoding(PARROT_INTERP)>

Gets the default encoding.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const ENCODING *
Parrot_default_encoding(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_default_encoding)
    return Parrot_default_encoding_ptr;
}

/*

=item C<encoding_converter_t Parrot_find_encoding_converter(PARROT_INTERP,
ENCODING *lhs, ENCODING *rhs)>

Finds a converter from encoding C<rhs> to C<lhs>. Not yet implemented, so
throws an exception.

=cut

*/

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
encoding_converter_t
Parrot_find_encoding_converter(PARROT_INTERP, ARGIN(ENCODING *lhs), ARGIN(ENCODING *rhs))
{
    ASSERT_ARGS(Parrot_find_encoding_converter)
    UNUSED(lhs);
    UNUSED(rhs);

    /* XXX Apparently unwritten https://trac.parrot.org/parrot/wiki/StringsTasklist */
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Can't find encoding converters yet.");
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
