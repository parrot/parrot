/*
Copyright (C) 2004-2009, Parrot Foundation.
$Id$

=head1 NAME

src/string/charset.c - global charset functions

=head1 DESCRIPTION

These are Parrot's generic charset handling functions

=over 4

=cut

*/

#define PARROT_NO_EXTERN_CHARSET_PTRS
#include "parrot/parrot.h"

#include "encoding/fixed_8.h"
#include "encoding/utf8.h"
#include "encoding/utf16.h"
#include "encoding/ucs2.h"
#include "encoding/ucs4.h"

#include "charset/ascii.h"
#include "charset/binary.h"
#include "charset/iso-8859-1.h"
#include "charset/unicode.h"

const CHARSET *Parrot_iso_8859_1_charset_ptr;
const CHARSET *Parrot_binary_charset_ptr;
const CHARSET *Parrot_default_charset_ptr;
const CHARSET *Parrot_unicode_charset_ptr;
const CHARSET *Parrot_ascii_charset_ptr;

/* all registered charsets are collected in one global structure */

typedef struct To_converter {
    NOTNULL(const CHARSET *to);
    NOTNULL(charset_converter_t func);
} To_converter;

typedef struct One_charset {
    NOTNULL(CHARSET *charset);
    STRING          *name;
    To_converter    *to_converters;
    int              n_converters;
} One_charset;

typedef struct All_charsets {
    One_charset *set;
    int          n_charsets;
} All_charsets;

static All_charsets *all_charsets;

/* HEADERIZER HFILE: include/parrot/charset.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void Parrot_str_internal_register_charset_names(PARROT_INTERP)
        __attribute__nonnull__(1);

static INTVAL register_charset(PARROT_INTERP,
    ARGIN(const char *charsetname),
    ARGIN(CHARSET *charset))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void register_static_converters(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_str_internal_register_charset_names \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_register_charset __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(charsetname) \
    , PARROT_ASSERT_ARG(charset))
#define ASSERT_ARGS_register_static_converters __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<CHARSET * Parrot_new_charset(PARROT_INTERP)>

Allocates a new C<CHARSET> structure from the system.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
CHARSET *
Parrot_new_charset(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_new_charset)
    return mem_gc_allocate_zeroed_typed(interp, CHARSET);
}

/*

=item C<void Parrot_charsets_encodings_deinit(PARROT_INTERP)>

Deinitializes (unloads) the charset system. Frees all charsets and the array
that holds the charsets back to the system.

=cut

*/

PARROT_EXPORT
void
Parrot_charsets_encodings_deinit(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charsets_encodings_deinit)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (all_charsets->set[i].n_converters)
            mem_gc_free(interp, all_charsets->set[i].to_converters);
        mem_gc_free(interp, all_charsets->set[i].charset);
    }
    mem_gc_free(interp, all_charsets->set);
    mem_gc_free(interp, all_charsets);
    all_charsets = NULL;
    parrot_deinit_encodings(interp);
}

/*

=item C<const CHARSET * Parrot_find_charset(PARROT_INTERP, const char
*charsetname)>

Searches through the list of charsets for the charset given by C<charsetname>.
Returns the charset if it is found, NULL otherwise.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET *
Parrot_find_charset(SHIM_INTERP, ARGIN(const char *charsetname))
{
    ASSERT_ARGS(Parrot_find_charset)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (STREQ(all_charsets->set[i].charset->name, charsetname))
            return all_charsets->set[i].charset;
    }

    return NULL;
}

/*

=item C<const CHARSET * Parrot_load_charset(PARROT_INTERP, const char
*charsetname)>

Throws an exception (Can't load charsets dynamically yet. https://trac.parrot.org/parrot/wiki/StringsTasklist).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET *
Parrot_load_charset(PARROT_INTERP, ARGIN(const char *charsetname))
{
    ASSERT_ARGS(Parrot_load_charset)
    UNUSED(charsetname);

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "Can't load charsets yet");
}

/*

=item C<INTVAL Parrot_charset_number(PARROT_INTERP, const STRING *charsetname)>

Return the number of the charset or -1 if not found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_charset_number(PARROT_INTERP, ARGIN(const STRING *charsetname))
{
    ASSERT_ARGS(Parrot_charset_number)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (Parrot_str_equal(interp, all_charsets->set[i].name, charsetname))
            return i;
    }
    return -1;
}

/*

=item C<INTVAL Parrot_charset_number_of_str(PARROT_INTERP, const STRING *src)>

Return the number of the charset of the given string or -1 if not found.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_charset_number_of_str(SHIM_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(Parrot_charset_number_of_str)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (src->charset == all_charsets->set[i].charset)
            return i;
    }
    return -1;
}

/*

=item C<STRING * Parrot_charset_name(PARROT_INTERP, INTVAL number_of_charset)>

Returns the name of the charset given by the INTVAL index
C<number_of_charset>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_charset_name(SHIM_INTERP, INTVAL number_of_charset)
{
    ASSERT_ARGS(Parrot_charset_name)
    if (number_of_charset < 0 || number_of_charset >= all_charsets->n_charsets)
        return STRINGNULL;
    return all_charsets->set[number_of_charset].name;
}

/*

=item C<const CHARSET * Parrot_get_charset(PARROT_INTERP, INTVAL
number_of_charset)>

Returns the charset given by the INTVAL index C<number_of_charset>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const CHARSET *
Parrot_get_charset(SHIM_INTERP, INTVAL number_of_charset)
{
    ASSERT_ARGS(Parrot_get_charset)
    if (number_of_charset < 0 || number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].charset;
}

/*

=item C<const char * Parrot_charset_c_name(PARROT_INTERP, INTVAL
number_of_charset)>

Returns a NULL-terminated C string with the name of the charset given by
INTVAL index C<number_of_charset>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
const char *
Parrot_charset_c_name(SHIM_INTERP, INTVAL number_of_charset)
{
    ASSERT_ARGS(Parrot_charset_c_name)
    if (number_of_charset < 0 || number_of_charset >= all_charsets->n_charsets)
        return NULL;
    return all_charsets->set[number_of_charset].charset->name;
}

/*

=item C<static INTVAL register_charset(PARROT_INTERP, const char *charsetname,
CHARSET *charset)>

Adds a new charset C<charset> with name <charsetname> to the list of
all charsets. Returns 0 and does nothing if a charset with that name
already exists. Returns 1 otherwise.

=cut

*/

static INTVAL
register_charset(PARROT_INTERP, ARGIN(const char *charsetname),
        ARGIN(CHARSET *charset))
{
    ASSERT_ARGS(register_charset)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (STREQ(all_charsets->set[i].charset->name, charsetname))
            return 0;
    }
    /*
     * TODO
     * this needs either a LOCK or we just forbid dynamic
     * loading of charsets from inside threads
     */
    if (!n)
        all_charsets->set = mem_gc_allocate_zeroed_typed(interp, One_charset);
    else
        all_charsets->set = mem_gc_realloc_n_typed_zeroed(interp,
                all_charsets->set, n + 1, n, One_charset);

    ++all_charsets->n_charsets;
    all_charsets->set[n].charset      = charset;
    all_charsets->set[n].n_converters = 0;

    return 1;
}

/*

=item C<static void Parrot_str_internal_register_charset_names(PARROT_INTERP)>

Helper function for initializing characterset names. We can't create the
STRING names until the default encodings and charsets are already initted,
so the name generation is split into a second init stage.

=cut

*/

static void
Parrot_str_internal_register_charset_names(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_str_internal_register_charset_names)
    int n;
    for (n = 0; n < all_charsets->n_charsets; ++n)
        all_charsets->set[n].name =
            Parrot_str_new_constant(interp, all_charsets->set[n].charset->name);
}

/*

=item C<static void register_static_converters(PARROT_INTERP)>

Registers several standard converters between common charsets, including:

    ISO 8859_1 -> ascii
    ISO 8859_1 -> bin
    ascii -> bin
    ascii -> ISO 8859_1

=cut

*/

static void
register_static_converters(PARROT_INTERP)
{
    ASSERT_ARGS(register_static_converters)
    Parrot_register_charset_converter(interp,
            Parrot_iso_8859_1_charset_ptr, Parrot_ascii_charset_ptr,
            charset_cvt_iso_8859_1_to_ascii);
    Parrot_register_charset_converter(interp,
            Parrot_iso_8859_1_charset_ptr, Parrot_binary_charset_ptr,
            charset_cvt_ascii_to_binary);

    Parrot_register_charset_converter(interp,
            Parrot_ascii_charset_ptr, Parrot_binary_charset_ptr,
            charset_cvt_ascii_to_binary);
    Parrot_register_charset_converter(interp,
            Parrot_ascii_charset_ptr, Parrot_iso_8859_1_charset_ptr,
            charset_cvt_ascii_to_iso_8859_1);
}

/*

=item C<INTVAL Parrot_register_charset(PARROT_INTERP, const char *charsetname,
CHARSET *charset)>

Register a new charset C<charset> with name C<charsetname>. Charset may only
be one of the 4 following names:

    binary
    iso-8859-1
    unicode
    ascii

Attempts to register other charsets are ignored. Returns 0 if the registration
failed, for any reason.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_register_charset(PARROT_INTERP, ARGIN(const char *charsetname),
        ARGIN(CHARSET *charset))
{
    ASSERT_ARGS(Parrot_register_charset)
    if (!all_charsets) {
        all_charsets             = mem_gc_allocate_zeroed_typed(interp, All_charsets);
        all_charsets->set        = NULL;
        all_charsets->n_charsets = 0;
    }

    if (STREQ("binary", charsetname)) {
        Parrot_binary_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }

    if (STREQ("iso-8859-1", charsetname)) {
        Parrot_iso_8859_1_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }

    if (STREQ("unicode", charsetname)) {
        Parrot_unicode_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }

    if (STREQ("ascii", charsetname)) {
        if (!Parrot_default_charset_ptr)
            Parrot_default_charset_ptr = charset;

        Parrot_ascii_charset_ptr = charset;
        return register_charset(interp, charsetname, charset);
    }

    return 0;
}

/*

=item C<void Parrot_charsets_encodings_init(PARROT_INTERP)>

Creates the initial charsets and encodings, and registers the initial
charset converters.

=cut

*/

PARROT_EXPORT
void
Parrot_charsets_encodings_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_charsets_encodings_init)
    /* the order is crucial here:
     * 1) encodings, default = fixed_8
     * 2) charsets   default = ascii */
    Parrot_encoding_fixed_8_init(interp);
    Parrot_encoding_utf8_init(interp);
    Parrot_encoding_ucs2_init(interp);
    Parrot_encoding_utf16_init(interp);
    Parrot_encoding_ucs4_init(interp);

    Parrot_charset_ascii_init(interp);
    Parrot_charset_iso_8859_1_init(interp);
    Parrot_charset_binary_init(interp);
    Parrot_charset_unicode_init(interp);

    /* Now that the plugins are registered, we can create STRING
     * names for them.  */
    Parrot_str_internal_register_encoding_names(interp);
    Parrot_str_internal_register_charset_names(interp);

    /* now install charset converters */
    register_static_converters(interp);
}

/*

=item C<INTVAL Parrot_make_default_charset(PARROT_INTERP, const char
*charsetname, const CHARSET *charset)>

Sets the current default charset to C<charset> with name C<charsetname>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_make_default_charset(SHIM_INTERP, SHIM(const char *charsetname),
        ARGIN(const CHARSET *charset))
{
    ASSERT_ARGS(Parrot_make_default_charset)
    Parrot_default_charset_ptr = charset;
    return 1;
}

/*

=item C<const CHARSET * Parrot_default_charset(PARROT_INTERP)>

Returns the default charset.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const CHARSET *
Parrot_default_charset(SHIM_INTERP)
{
    ASSERT_ARGS(Parrot_default_charset)
    return Parrot_default_charset_ptr;
}

/*

=item C<charset_converter_t Parrot_find_charset_converter(PARROT_INTERP, const
CHARSET *lhs, const CHARSET *rhs)>

Finds a converter from charset C<lhs> to charset C<rhs>.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
charset_converter_t
Parrot_find_charset_converter(SHIM_INTERP,
        ARGIN(const CHARSET *lhs), ARGIN(const CHARSET *rhs))
{
    ASSERT_ARGS(Parrot_find_charset_converter)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (lhs == all_charsets->set[i].charset) {
            const One_charset * const left = all_charsets->set + i;
            const int nc = left->n_converters;
            int j;

            for (j = 0; j < nc; ++j) {
                if (left->to_converters[j].to == rhs)
                    return left->to_converters[j].func;
            }
        }
    }
    return NULL;
}

/*

=item C<void Parrot_register_charset_converter(PARROT_INTERP, const CHARSET
*lhs, const CHARSET *rhs, charset_converter_t func)>

Registers a converter C<func> from charset C<lhs> to C<rhs>.

=cut

*/

PARROT_EXPORT
void
Parrot_register_charset_converter(PARROT_INTERP,
        ARGIN(const CHARSET *lhs), ARGIN(const CHARSET *rhs),
        ARGIN(charset_converter_t func))
{
    ASSERT_ARGS(Parrot_register_charset_converter)
    int i;
    const int n = all_charsets->n_charsets;

    for (i = 0; i < n; ++i) {
        if (lhs == all_charsets->set[i].charset) {
            One_charset * const left = all_charsets->set + i;
            const int nc = left->n_converters++;

            if (nc) {
                left->to_converters = mem_gc_realloc_n_typed_zeroed(interp,
                        left->to_converters, nc + 1, nc, To_converter);
            }
            else
                left->to_converters = mem_gc_allocate_zeroed_typed(interp, To_converter);
            left->to_converters[nc].to = rhs;
            left->to_converters[nc].func = func;
        }
    }
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
