/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

=head1 NAME

src/string/api.c - Parrot Strings

=head1 DESCRIPTION

This file implements the non-ICU parts of the Parrot string subsystem.

Note that C<bufstart> and C<buflen> are used by the memory subsystem. The
string functions may only use C<buflen> to determine if there is some space
left beyond C<bufused>. This is the I<only> valid usage of these two data
members, beside setting C<bufstart>/C<buflen> for external strings.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "private_cstring.h"
#include "api.str"

/* for parrot/interpreter.h */
STRING *STRINGNULL;

#define nonnull_encoding_name(s) (s) ? (s)->encoding->name : "null string"
#define saneify_string(s) \
    PARROT_ASSERT((s)->encoding); \
    PARROT_ASSERT((s)->charset); \
    PARROT_ASSERT(!PObj_on_free_list_TEST(s))

/* HEADERIZER HFILE: include/parrot/string_funcs.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const CHARSET * string_rep_compatible(SHIM_INTERP,
    ARGIN(const STRING *a),
    ARGIN(const STRING *b),
    ARGOUT(const ENCODING **e))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*e);

#define ASSERT_ARGS_string_rep_compatible __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b) \
    , PARROT_ASSERT_ARG(e))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<INTVAL Parrot_str_is_null(PARROT_INTERP, const STRING *s)>

Tests if the given STRING is STRINGNULL.

=cut

*/

PARROT_EXPORT
PARROT_HOT
PARROT_PURE_FUNCTION
INTVAL
Parrot_str_is_null(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_is_null)
    return !s || s == STRINGNULL;
}


/*

=item C<INTVAL STRING_is_null(PARROT_INTERP, const STRING *s)>

Tests if the given STRING is STRINGNULL.

=cut

*/

PARROT_EXPORT
PARROT_HOT
PARROT_PURE_FUNCTION
INTVAL
STRING_is_null(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(STRING_is_null)
    return !s || s == STRINGNULL;
}

/*

=back

=head2 Basic String Functions

Creation, enlargement, etc.

=over 4

=item C<void Parrot_str_init(PARROT_INTERP)>

Initializes the Parrot string subsystem.

=cut

*/

PARROT_EXPORT
void
Parrot_str_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_str_init)
    Hash        *const_cstring_hash;
    size_t       i;
    const size_t n_parrot_cstrings =
        sizeof (parrot_cstrings) / sizeof (parrot_cstrings[0]);

    if (interp->parent_interpreter) {
        interp->hash_seed = interp->parent_interpreter->hash_seed;
    }
    /* interp is initialized from zeroed memory, so this is fine */
    else if (interp->hash_seed == 0) {
        /* TT #64 - use an entropy source once available */
        Parrot_srand(Parrot_intval_time());
        interp->hash_seed = Parrot_uint_rand(0);
    }
    /* initialize the constant string table */
    if (interp->parent_interpreter) {
        interp->const_cstring_table =
            interp->parent_interpreter->const_cstring_table;
        interp->const_cstring_hash  =
            interp->parent_interpreter->const_cstring_hash;
        return;
    }

    /* Set up the cstring cache, then load the basic encodings and charsets */
    const_cstring_hash          = parrot_new_cstring_hash(interp);
    interp->const_cstring_hash  = const_cstring_hash;
    Parrot_charsets_encodings_init(interp);

    /* initialize STRINGNULL, but not in the constant table */
    STRINGNULL = Parrot_str_new_init(interp, NULL, 0,
                       PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                       PObj_constant_FLAG);

    interp->const_cstring_table =
        mem_gc_allocate_n_zeroed_typed(interp, n_parrot_cstrings, STRING *);

    for (i = 0; i < n_parrot_cstrings; ++i) {
        DECL_CONST_CAST;
        STRING * const s =
            Parrot_str_new_init(interp,
                parrot_cstrings[i].string,
                parrot_cstrings[i].len,
                PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                PObj_external_FLAG|PObj_constant_FLAG);
        parrot_hash_put(interp, const_cstring_hash,
            PARROT_const_cast(char *, parrot_cstrings[i].string), (void *)s);
        interp->const_cstring_table[i] = s;
    }
}

/*

=item C<void Parrot_str_finish(PARROT_INTERP)>

De-Initializes the Parrot string subsystem.

=cut

*/

PARROT_EXPORT
void
Parrot_str_finish(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_str_finish)
    /* all are shared between interpreters */
    if (!interp->parent_interpreter) {
        mem_internal_free(interp->const_cstring_table);
        interp->const_cstring_table = NULL;
        Parrot_charsets_encodings_deinit(interp);
        parrot_hash_destroy(interp, interp->const_cstring_hash);
    }
}

/*

=item C<UINTVAL string_capacity(PARROT_INTERP, const STRING *s)>

Returns the capacity of the specified Parrot string in bytes, that
is how many bytes can be appended onto strstart.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
UINTVAL
string_capacity(SHIM_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(string_capacity)

    return ((ptrcast_t)Buffer_bufstart(s) + Buffer_buflen(s) -
            (ptrcast_t)s->strstart);
}

/*

=item C<STRING * Parrot_str_new_noinit(PARROT_INTERP,
parrot_string_representation_t representation, UINTVAL capacity)>

Creates and returns an empty Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_noinit(PARROT_INTERP,
    parrot_string_representation_t representation, UINTVAL capacity)
{
    ASSERT_ARGS(Parrot_str_new_noinit)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);

    /* TODO adapt string creation functions */
    if (representation != enum_stringrep_one)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARTYPE,
            "Unsupported representation");

    s->charset  = PARROT_DEFAULT_CHARSET;
    s->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, s);

    Parrot_gc_allocate_string_storage(interp, s,
        (size_t)string_max_bytes(interp, s, capacity));

    return s;
}

/*

=item C<static const CHARSET * string_rep_compatible(PARROT_INTERP, const STRING
*a, const STRING *b, const ENCODING **e)>

Find the "lowest" possible charset and encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returs NULL, if no compatible string representation can be found.

=cut

*/

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const CHARSET *
string_rep_compatible(SHIM_INTERP,
    ARGIN(const STRING *a), ARGIN(const STRING *b), ARGOUT(const ENCODING **e))
{
    ASSERT_ARGS(string_rep_compatible)
    if (a->encoding == b->encoding && a->charset == b->charset) {
        *e = a->encoding;
        return a->charset;
    }

    /* a table could possibly simplify the logic */
    if (a->encoding == Parrot_utf8_encoding_ptr
    &&  b->charset == Parrot_ascii_charset_ptr) {
        if (a->strlen == a->bufused) {
            *e = Parrot_fixed_8_encoding_ptr;
            return b->charset;
        }
        *e = a->encoding;
        return a->charset;
    }

    if (b->encoding == Parrot_utf8_encoding_ptr
    &&  a->charset == Parrot_ascii_charset_ptr) {
        if (b->strlen == b->bufused) {
            *e = Parrot_fixed_8_encoding_ptr;
            return a->charset;
        }
        *e = b->encoding;
        return b->charset;
    }

    if (a->encoding != b->encoding)
        return NULL;

    if (a->encoding != Parrot_fixed_8_encoding_ptr)
        return NULL;

    *e = Parrot_fixed_8_encoding_ptr;

    if (a->charset == b->charset)
        return a->charset;
    if (b->charset == Parrot_ascii_charset_ptr)
        return a->charset;
    if (a->charset == Parrot_ascii_charset_ptr)
        return b->charset;
    if (a->charset == Parrot_binary_charset_ptr)
        return a->charset;
    if (b->charset == Parrot_binary_charset_ptr)
        return b->charset;

    return NULL;
}


/*

=item C<STRING * Parrot_str_concat(PARROT_INTERP, STRING *a, STRING *b, UINTVAL
Uflags)>

Concatenates two Parrot strings. If necessary, converts the second
string's encoding and/or type to match those of the first string. If
either string is C<NULL>, then a copy of the non-C<NULL> string is
returned. If both strings are C<NULL>, then a new zero-length string is
created and returned.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_concat(PARROT_INTERP, ARGIN_NULLOK(STRING *a),
            ARGIN_NULLOK(STRING *b), UINTVAL Uflags)
{
    ASSERT_ARGS(Parrot_str_concat)
    if (a && a->strlen) {
        if (b && b->strlen) {
            /* don't make a copy; get the size right from the start */
            STRING *result = Parrot_str_new_init(interp, NULL,
                a->strlen + b->strlen, a->encoding, a->charset, Uflags);
            result = Parrot_str_append(interp, result, a);
            return Parrot_str_append(interp, result, b);
        }

        return Parrot_str_copy(interp, a);
    }

    return b
        ? Parrot_str_copy(interp, b)
        : string_make(interp, NULL, 0, NULL, Uflags);
}


/*

=item C<STRING * Parrot_str_append(PARROT_INTERP, STRING *a, STRING *b)>

Take in two Parrot strings and append the second to the first.  NOTE THAT
RETURN VALUE MAY NOT BE THE FIRST STRING, if the first string is COW'd or
read-only.  So make sure to _use_ the return value.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_append(PARROT_INTERP, ARGMOD_NULLOK(STRING *a), ARGIN_NULLOK(STRING *b))
{
    ASSERT_ARGS(Parrot_str_append)
    UINTVAL a_capacity;
    UINTVAL total_length;
    const CHARSET *cs;
    const ENCODING *enc;

    /* XXX should this be a CHARSET method? */

    /* If B isn't real, we just bail */
    const UINTVAL b_len = b ? Parrot_str_byte_length(interp, b) : 0;
    if (!b_len)
        return a;

    /* Is A real? */
    if (a == NULL || Buffer_bufstart(a) == NULL)
        return Parrot_str_copy(interp, b);

    saneify_string(a);
    saneify_string(b);

    /* If the destination's constant, or external then just fall back to
       Parrot_str_concat */
    if (PObj_is_cowed_TESTALL(a))
        return Parrot_str_concat(interp, a, b, 0);

    cs = string_rep_compatible(interp, a, b, &enc);

    if (cs) {
        a->charset  = cs;
        a->encoding = enc;
    }
    else {
        /* upgrade strings for concatenation */
        enc = (a->encoding == Parrot_utf16_encoding_ptr
           ||  b->encoding == Parrot_utf16_encoding_ptr
           ||  a->encoding == Parrot_ucs2_encoding_ptr
           ||  b->encoding == Parrot_ucs2_encoding_ptr)
              ? Parrot_utf16_encoding_ptr
              : Parrot_utf8_encoding_ptr;

        Parrot_unicode_charset_ptr->to_charset(interp, a, NULL);
        b = Parrot_unicode_charset_ptr->to_charset(interp, b,
                Parrot_gc_new_string_header(interp, 0));

        if (a->encoding != enc)
            enc->to_encoding(interp, a, NULL);
        if (b->encoding != enc)
            enc->to_encoding(interp, b, NULL);
    }

    /* calc usable and total bytes */
    a_capacity   = string_capacity(interp, a);
    total_length = a->bufused + b->bufused;

    /* make sure A's big enough for both  */
    if (total_length > a_capacity)
        Parrot_gc_reallocate_string_storage(interp, a, total_length << 1);

    /* A is now ready to receive the contents of B */

    /* Tack B on the end of A */
    mem_sys_memcopy((void *)((ptrcast_t)a->strstart + a->bufused),
            b->strstart, b->bufused);

    a->bufused += b->bufused;
    a->strlen  += b_len;
    a->hashval  = 0;

    return a;
}

/*

=item C<STRING * Parrot_str_new(PARROT_INTERP, const char * const buffer, const
UINTVAL len)>

Make a Parrot string from a specified C string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new(PARROT_INTERP, ARGIN_NULLOK(const char * const buffer), const UINTVAL len)
{
    ASSERT_ARGS(Parrot_str_new)
    return Parrot_str_new_init(interp, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                              PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                              0); /* Force an 8-bit encoding at some
                                     point? */
}


/*

=item C<STRING * Parrot_str_new_from_buffer(PARROT_INTERP, Buffer *buffer, const
UINTVAL len)>

Make a Parrot string from a Buffer.

The Buffer is nulled afterwards - only one PObj can point at a given string pool object.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_from_buffer(PARROT_INTERP, ARGMOD(Buffer *buffer), const UINTVAL len)
{
    ASSERT_ARGS(Parrot_str_new_from_buffer)
    STRING *result;

    result = Parrot_gc_new_string_header(interp, 0);
    Buffer_bufstart(result) = Buffer_bufstart(buffer);
    Buffer_buflen(result)   = Buffer_buflen(buffer);
    result->strstart        = (char *) Buffer_bufstart(result);
    result->bufused         = len;
    result->strlen          = len;
    result->encoding        = Parrot_fixed_8_encoding_ptr;
    result->charset         = Parrot_binary_charset_ptr;

    Buffer_bufstart(buffer) = NULL;
    Buffer_buflen(buffer)   = 0;

    return result;
}

/*

=item C<const char* string_primary_encoding_for_representation(PARROT_INTERP,
parrot_string_representation_t representation)>

Returns the primary encoding for the specified representation.

This is needed for packfile unpacking, unless we just always use UTF-8 or BOCU.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_OBSERVER
const char*
string_primary_encoding_for_representation(PARROT_INTERP,
    parrot_string_representation_t representation)
{
    ASSERT_ARGS(string_primary_encoding_for_representation)
    if (representation == enum_stringrep_one)
        return "ascii";

    Parrot_ex_throw_from_c_args(interp, NULL,
        EXCEPTION_INVALID_STRING_REPRESENTATION,
        "string_primary_encoding_for_representation: "
        "invalid string representation");
}

/*

=item C<STRING * Parrot_str_new_constant(PARROT_INTERP, const char *buffer)>

Creates and returns a constant Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_constant(PARROT_INTERP, ARGIN(const char *buffer))
{
    ASSERT_ARGS(Parrot_str_new_constant)
    DECL_CONST_CAST;
    STRING *s;
    Hash   * const cstring_cache = (Hash *)interp->const_cstring_hash;

    s = (STRING *)parrot_hash_get(interp, cstring_cache, buffer);

    if (s)
        return s;

    s = Parrot_str_new_init(interp, buffer, strlen(buffer),
                       PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                       PObj_external_FLAG|PObj_constant_FLAG);

    parrot_hash_put(interp, cstring_cache,
        PARROT_const_cast(char *, buffer), (void *)s);

    return s;
}


/*

=item C<STRING * string_make(PARROT_INTERP, const char *buffer, UINTVAL len,
const char *charset_name, UINTVAL flags)>

Creates and returns a new Parrot string using C<len> bytes of string data read
from C<buffer>.

The value of C<charset_name> specifies the string's representation.
The currently recognised values are:

    'iso-8859-1'
    'ascii'
    'binary'
    'unicode'

The encoding is implicitly guessed; C<unicode> implies the C<utf-8> encoding,
and the other three assume C<fixed-8> encoding.

If C<charset> is unspecified, the default charset 'ascii' will be used.

The value of C<flags> is optionally one or more C<PObj_*> flags C<OR>-ed
together.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
string_make(PARROT_INTERP, ARGIN_NULLOK(const char *buffer),
        UINTVAL len, ARGIN_NULLOK(const char *charset_name), UINTVAL flags)
{
    ASSERT_ARGS(string_make)
    const CHARSET *charset;

    if (!charset_name)
        charset_name = "ascii";

    charset = Parrot_find_charset(interp, charset_name);

    if (!charset)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Can't make '%s' charset strings", charset_name);

    return Parrot_str_new_init(interp, buffer, len,
        charset->preferred_encoding, charset, flags);

}


/*

=item C<STRING * string_make_from_charset(PARROT_INTERP, const char *buffer,
UINTVAL len, INTVAL charset_nr, UINTVAL flags)>

Creates and returns a new Parrot string using C<len> bytes of string data read
from C<buffer>.

The value of C<charset_name> specifies the string's representation.  It must be
a valid charset identifier.

    'iso-8859-1'
    'ascii'
    'binary'
    'unicode'

The encoding is implicitly guessed; C<unicode> implies the C<utf-8> encoding,
and the other three assume C<fixed-8> encoding.

The value of C<flags> is optionally one or more C<PObj_*> flags C<OR>-ed
together.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
string_make_from_charset(PARROT_INTERP, ARGIN_NULLOK(const char *buffer),
    UINTVAL len, INTVAL charset_nr, UINTVAL flags)
{
    ASSERT_ARGS(string_make_from_charset)
    const CHARSET *charset = Parrot_get_charset(interp, charset_nr);

    if (!charset)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Invalid charset number '%d' specified", charset_nr);

    return Parrot_str_new_init(interp, buffer, len,
        charset->preferred_encoding, charset, flags);
}


/*

=item C<STRING * Parrot_str_new_init(PARROT_INTERP, const char *buffer, UINTVAL
len, const ENCODING *encoding, const CHARSET *charset, UINTVAL flags)>

Given a buffer, its length, an encoding, a character set, and STRING flags,
creates and returns a new string.  Don't call this directly.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_init(PARROT_INTERP, ARGIN_NULLOK(const char *buffer), UINTVAL len,
        ARGIN(const ENCODING *encoding), ARGIN(const CHARSET *charset), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_str_new_init)
    DECL_CONST_CAST;
    STRING * const s = Parrot_gc_new_string_header(interp, flags);
    s->encoding      = encoding;
    s->charset       = charset;

    if (flags & PObj_external_FLAG) {
        /*
         * fast path for external (constant) strings - don't allocate
         * and copy data
         */
        /* The following cast discards the 'const'.  That raises
           a warning with gcc, but is ok since the caller indicated
           it was safe by setting PObj_external_FLAG.
           (The cast is necessary to pacify TenDRA's tcc.)
           */
        Buffer_bufstart(s) = s->strstart = PARROT_const_cast(char *, buffer);
        Buffer_buflen(s)   = s->bufused  = len;

        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            Parrot_str_length(interp, s);

        return s;
    }

    Parrot_gc_allocate_string_storage(interp, s, len);

    if (buffer) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            Parrot_str_length(interp, s);
    }
    else {
        s->strlen = s->bufused = 0;
    }

    return s;
}


/*

=item C<STRING * Parrot_str_resize(PARROT_INTERP, STRING *s, UINTVAL addlen)>

Grows the Parrot string's buffer by the specified number of characters.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_resize(PARROT_INTERP, ARGMOD(STRING *s), UINTVAL addlen)
{
    ASSERT_ARGS(Parrot_str_resize)
    Parrot_str_write_COW(interp, s);

    /* Don't check buflen, if we are here, we already checked. */
    Parrot_gc_reallocate_string_storage(interp,
        s, Buffer_buflen(s) + string_max_bytes(interp, s, addlen));
    return s;
}


/*

=back

=head2 Ordinary user-visible string operations

=over 4

=item C<UINTVAL Parrot_str_byte_length(PARROT_INTERP, const STRING *s)>

Returns the number of characters in the specified Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
UINTVAL
Parrot_str_byte_length(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_byte_length)

    return s ? s->strlen : 0;
}


/*

=item C<INTVAL Parrot_str_indexed(PARROT_INTERP, const STRING *s, UINTVAL idx)>

Returns the character (or glyph, depending upon the string's encoding).  This
abstracts the process of finding the Nth character in a (possibly Unicode or
JIS-encoded) string, the idea being that once the encoding functions are
fleshed out, this function can do the right thing.

Note that this is not range-checked.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_indexed(PARROT_INTERP, ARGIN(const STRING *s), UINTVAL idx)
{
    ASSERT_ARGS(Parrot_str_indexed)
    saneify_string(s);
    return (INTVAL)CHARSET_GET_CODEPOINT(interp, s, idx);
}


/*

=item C<INTVAL Parrot_str_find_index(PARROT_INTERP, const STRING *s, const
STRING *s2, INTVAL start)>

Returns the character position of the second Parrot string in the first at or
after C<start>. The return value is a (0 based) offset in characters, not
bytes. If second string is not found in the first string, returns -1.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_find_index(PARROT_INTERP, ARGIN(const STRING *s),
        ARGIN(const STRING *s2), INTVAL start)
{
    ASSERT_ARGS(Parrot_str_find_index)
    STRING *src, *search;
    UINTVAL len;
    DECL_CONST_CAST;

    if (start < 0)
        return -1;

    len = Parrot_str_byte_length(interp, s);

    if (!len)
        return -1;

    if (start >= (INTVAL)len)
        return -1;

    if (!Parrot_str_byte_length(interp, s2))
        return -1;

    src    = PARROT_const_cast(STRING *, s);
    search = PARROT_const_cast(STRING *, s2);

    return CHARSET_INDEX(interp, src, search, (UINTVAL)start);
}


/*

=item C<INTVAL string_ord(PARROT_INTERP, const STRING *s, INTVAL idx)>

Returns the codepoint at a given index into a string. Negative indexes are
treated as counting from the end of the string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
string_ord(PARROT_INTERP, ARGIN_NULLOK(const STRING *s), INTVAL idx)
{
    ASSERT_ARGS(string_ord)
    const UINTVAL len        = s ? Parrot_str_byte_length(interp, s) : 0;
    UINTVAL       true_index = (UINTVAL)idx;

    if (len == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ORD_OUT_OF_STRING,
            "Cannot get character of empty string");

    if (idx < 0) {
        if ((INTVAL)(idx + len) < 0)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_ORD_OUT_OF_STRING,
                "Cannot get character before beginning of string");

        true_index = (UINTVAL)(len + idx);
    }

    if (true_index > (len - 1))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ORD_OUT_OF_STRING,
            "Cannot get character past end of string");

    return Parrot_str_indexed(interp, s, true_index);
}


/*

=item C<STRING * string_chr(PARROT_INTERP, UINTVAL character)>

Returns a single-character Parrot string.

TODO - Allow this to take an array of characters?

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
string_chr(PARROT_INTERP, UINTVAL character)
{
    ASSERT_ARGS(string_chr)
    if (character > 0xff)
        return Parrot_unicode_charset_ptr->string_from_codepoint(interp,
                character);

    else if (character > 0x7f)
        return Parrot_iso_8859_1_charset_ptr->string_from_codepoint(interp,
                character);

    else
        return Parrot_ascii_charset_ptr->string_from_codepoint(interp,
                 character);
}


/*

=item C<STRING * Parrot_str_copy(PARROT_INTERP, STRING *s)>

Creates and returns a copy of the specified Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_copy(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_str_copy)
    return Parrot_str_new_COW(interp, s);
}


/*

=back

=head2 Vtable Dispatch Functions

=over 4

=item C<INTVAL Parrot_str_length(PARROT_INTERP, STRING *s)>

Calculates and returns the number of characters in the specified Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
INTVAL
Parrot_str_length(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_str_length)

    s->strlen = CHARSET_CODEPOINTS(interp, s);
    return s->strlen;
}


/*

=item C<INTVAL string_max_bytes(PARROT_INTERP, const STRING *s, UINTVAL nchars)>

Returns the number of bytes required to safely contain the specified number
of characters in the specified Parrot string's representation.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
INTVAL
string_max_bytes(SHIM_INTERP, ARGIN(const STRING *s), UINTVAL nchars)
{
    ASSERT_ARGS(string_max_bytes)
    PARROT_ASSERT(s->encoding);
    return ENCODING_MAX_BYTES_PER_CODEPOINT(interp, s) * nchars;
}

/*

=item C<STRING * Parrot_str_repeat(PARROT_INTERP, const STRING *s, UINTVAL num)>

Repeats the specified Parrot string I<num> times and returns the result.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_repeat(PARROT_INTERP, ARGIN(const STRING *s), UINTVAL num)
{
    ASSERT_ARGS(Parrot_str_repeat)
    STRING * const dest = Parrot_str_new_init(interp, NULL,
                        s->bufused * num,
                        s->encoding, s->charset, 0);
    if (num > 0) {
        /* copy s into dest num times */
        UINTVAL length = s->bufused;
        UINTVAL i;
        char *             destpos = dest->strstart;
        const char * const srcpos  = s->strstart;
        for (i = 0; i < num; i++) {
            mem_sys_memcopy(destpos, srcpos, length);
            destpos += length;
        }

        dest->bufused = s->bufused * num;
        dest->strlen  = s->strlen * num;
    }

    return dest;
}

/*

=item C<STRING * Parrot_str_substr(PARROT_INTERP, STRING *src, INTVAL offset,
INTVAL length, STRING **d, int replace_dest)>

Copies the substring of length C<length> from C<offset> from the specified
Parrot string and stores it in C<**d>, allocating memory if necessary. The
substring is also returned.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_substr(PARROT_INTERP,
        ARGIN_NULLOK(STRING *src), INTVAL offset, INTVAL length,
        ARGOUT_NULLOK(STRING **d), int replace_dest)
{
    ASSERT_ARGS(Parrot_str_substr)
    if (src == NULL)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Cannot substr on a null string");
    else {
        STRING *dest;
        UINTVAL true_length;
        UINTVAL true_offset = (UINTVAL)offset;

        saneify_string(src);

        /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
        if (offset == (INTVAL)Parrot_str_byte_length(interp, src) || length < 1)
            return Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

        if (offset < 0)
            true_offset = (UINTVAL)(src->strlen + offset);

        /* 0 based... */
        if (src->strlen == 0 || true_offset > src->strlen - 1)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SUBSTR_OUT_OF_STRING,
                "Cannot take substr outside string");

        true_length = (UINTVAL)length;
        if (true_length > (src->strlen - true_offset))
            true_length = (UINTVAL)(src->strlen - true_offset);

        /* do in-place i.e. reuse existing header if one */
        if (replace_dest && d && *d) {
            PARROT_ASSERT(src->encoding == Parrot_fixed_8_encoding_ptr);
            dest           = *d;

            dest->encoding = src->encoding;
            dest->charset  = src->charset;

            dest->strstart = (char *)src->strstart + true_offset;
            dest->bufused  = true_length;

            dest->strlen   = true_length;
            dest->hashval  = 0;
        }
        else
            dest = CHARSET_GET_CODEPOINTS(interp, src, true_offset,
                    true_length);

        if (d)
            *d = dest;

        return dest;
    }
}


/*

=item C<STRING * Parrot_str_replace(PARROT_INTERP, STRING *src, INTVAL offset,
INTVAL length, STRING *rep, STRING **d)>

Replaces a sequence of C<length> characters from C<offset> in the first
Parrot string with the second Parrot string, returning what was
replaced.

This follows the Perl semantics for:

    substr EXPR, OFFSET, LENGTH, REPLACEMENT

Replacing a sequence of characters with a longer string grows the
string; a shorter string shrinks it.

Replacing 2 past the end of the string is undefined. However replacing 1
past the end of the string concatenates the two strings.

A negative offset is allowed to replace from the end.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_replace(PARROT_INTERP, ARGIN(STRING *src),
    INTVAL offset, INTVAL length, ARGIN(STRING *rep), ARGOUT_NULLOK(STRING **d))
{
    ASSERT_ARGS(Parrot_str_replace)
    UINTVAL         start_byte, end_byte;
    INTVAL          diff;
    String_iter     iter;

    const CHARSET  *cs;
    const ENCODING *enc;
    STRING         *dest        = NULL;
    UINTVAL         true_offset = (UINTVAL)offset;
    UINTVAL         true_length = (UINTVAL)length;

    /* special case */
    if (d             == NULL
    &&  src->encoding == Parrot_fixed_8_encoding_ptr
    &&  rep->encoding == Parrot_fixed_8_encoding_ptr
    &&  offset        >= 0
    &&  true_offset   <  src->strlen
    &&  length        == 1
    &&  rep->strlen   == 1) {
        if (PObj_is_cowed_TESTALL(src))
            Parrot_str_write_COW(interp, src);

        ((char *)src->strstart)[offset] = ((char *)rep->strstart)[0];

        return NULL;
    }

    /* abs(-offset) may not be > strlen-1 */
    if (offset < 0)
        true_offset = (UINTVAL)(src->strlen + offset);

    /* Can replace 1 past end of string which is technically outside the string
     * but is same as a concat().
     * Only give exception if caller trys to replace end of string + 2
     */
    if (true_offset > src->strlen)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Can only replace inside string or index after end of string");

    if (true_length > (src->strlen - true_offset))
        true_length = (UINTVAL)(src->strlen - true_offset);

    /* Save the substring that is replaced for the return value */
    if (d) {
        dest = CHARSET_GET_CODEPOINTS(interp, src, true_offset, true_length);
        *d = dest;
    }

    /* may have different reps..... */
    cs = string_rep_compatible(interp, src, rep, &enc);

    if (!cs) {
        Parrot_utf16_encoding_ptr->to_encoding(interp, src, NULL);
        rep = Parrot_utf16_encoding_ptr->to_encoding(interp, rep,
                Parrot_gc_new_string_header(interp, 0));
    }
    else {
        src->charset  = cs;
        src->encoding = enc;
    }

    /* get byte position of the part that will be replaced */
    ENCODING_ITER_INIT(interp, src, &iter);

    iter.set_position(interp, &iter, true_offset);
    start_byte = iter.bytepos;

    iter.set_position(interp, &iter, true_offset + true_length);
    end_byte   = iter.bytepos;

    /* not possible.... */
    if (end_byte < start_byte)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_SUBSTR_OUT_OF_STRING,
            "replace: subend somehow is less than substart");

    /* Now do the replacement */
    Parrot_str_write_COW(interp, src);

    /*
     * If the replacement string fits inside the original substring
     * don't create a new string, just pack it.
     */
    diff = (end_byte - start_byte) - rep->bufused;

    if (diff >= 0
    || ((INTVAL)src->bufused - (INTVAL)Buffer_buflen(src)) <= diff) {

        if (diff != 0) {
            mem_sys_memmove((char *)src->strstart + start_byte + rep->bufused,
                    (char *)src->strstart + end_byte,
                    src->bufused - end_byte);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char *)src->strstart + start_byte,
                rep->strstart, rep->bufused);

        if (diff)
            (void)Parrot_str_length(interp, src);
    }

    /* Replacement is larger than avail buffer, grow the string */
    else {
        /* diff is negative here, make it positive */
        diff = -(diff);
        Parrot_str_resize(interp, src, (UINTVAL)diff);

        /* Move the end of old string that isn't replaced to new offset first */
        mem_sys_memmove((char *)src->strstart + end_byte + diff,
                (char *)src->strstart + end_byte,
                src->bufused - end_byte);

        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->strstart + start_byte, rep->strstart,
                rep->bufused);
        src->bufused += diff;
        (void)Parrot_str_length(interp, src);
    }

    /* src is modified, now return the original substring */
    return dest;
}


/*

=item C<STRING * Parrot_str_chopn(PARROT_INTERP, STRING *s, INTVAL n)>

Removes the last C<n> characters of the specified Parrot string. If C<n> is
negative, cuts the string after C<+n> characters. The returned string is a copy
of the one passed in.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_chopn(PARROT_INTERP, ARGMOD(STRING *s), INTVAL n)
{
    ASSERT_ARGS(Parrot_str_chopn)
    STRING * const chopped = Parrot_str_copy(interp, s);
    Parrot_str_chopn_inplace(interp, chopped, n);
    return chopped;
}


/*

=item C<void Parrot_str_chopn_inplace(PARROT_INTERP, STRING *s, INTVAL n)>

Removes the last C<n> characters of the specified Parrot string. If C<n> is
negative, cuts the string after C<+n> characters. The string passed in is
modified and returned.

=cut

*/

PARROT_EXPORT
void
Parrot_str_chopn_inplace(PARROT_INTERP, ARGMOD(STRING *s), INTVAL n)
{
    ASSERT_ARGS(Parrot_str_chopn_inplace)
    UINTVAL new_length, uchar_size;

    if (n < 0) {
        new_length = -n;
        if (new_length > s->strlen)
            return;
    }
    else {
        if (s->strlen > (UINTVAL)n)
            new_length = s->strlen - n;
        else
            new_length = 0;
    }

    s->hashval = 0;

    if (!new_length || !s->strlen) {
        s->bufused = s->strlen = 0;
        return;
    }

    uchar_size = s->bufused / s->strlen;
    s->strlen  = new_length;

    if (s->encoding == Parrot_fixed_8_encoding_ptr) {
        s->bufused = new_length;
    }
    else if (s->encoding == Parrot_ucs2_encoding_ptr) {
        s->bufused = new_length * uchar_size;
    }
    else {
        String_iter iter;

        ENCODING_ITER_INIT(interp, s, &iter);
        iter.set_position(interp, &iter, new_length);
        s->bufused = iter.bytepos;
    }

    return;
}


/*

=item C<INTVAL Parrot_str_compare(PARROT_INTERP, const STRING *s1, const STRING
*s2)>

Compares two strings to each other.  If s1 is less than s2, returns -1.  If the
strings are equal, returns 0.  If s1 is greater than s2, returns 2.  This
comparison uses the character set collation order of the strings for
comparison.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_compare(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1), ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_compare)
    if (!s2)
        return s1 && (s1->strlen != 0);

    if (!s1)
        return -(s2->strlen != 0);

    saneify_string(s1);
    saneify_string(s2);

    return CHARSET_COMPARE(interp, s1, s2);
}


/*

=item C<INTVAL Parrot_str_not_equal(PARROT_INTERP, const STRING *s1, const
STRING *s2)>

Compares two Parrot strings, performing type and encoding conversions if
necessary. Returns 1 if the strings are not equal, and 0 otherwise.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_not_equal(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1), ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_not_equal)
    return !Parrot_str_equal(interp, s1, s2);
}

/*

=item C<INTVAL Parrot_str_equal(PARROT_INTERP, const STRING *s1, const STRING
*s2)>

Compares two Parrot strings, performing type and encoding conversions if
necessary.

Returns 1 if the strings are equal, and 0 otherwise.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_equal(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1), ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_equal)
    if ((s1 == s2) || (!s1 && !s2)) {
        return 1;
    }
    else if (!s2) {
        return s1->strlen == 0;
    }
    else if (!s1) {
        return s2->strlen == 0;
    }
    else if (s1->strlen != s2->strlen) {
        return 0;       /* we don't care which is bigger */
    }
    else if (s1->hashval != s2->hashval && s1->hashval && s2->hashval) {
        return 0;
    }
    else if (!s1->strlen) {   /* s2->strlen is the same here */
        return 1;
    }
    /* COWed strings */
    else if (s1->strstart == s2->strstart && s1->bufused == s2->bufused) {
        return 1;
    }

    /*
     * now,
     * both strings are non-null
     * both strings have same length
     */
    return !CHARSET_COMPARE(interp, s1, s2);
}


/*

=item C<STRING * Parrot_str_bitwise_and(PARROT_INTERP, const STRING *s1, const
STRING *s2, STRING **dest)>

Performs a bitwise C<AND> on two Parrot strings, performing type and encoding
conversions if necessary. If the third string is not C<NULL> then it is
reused.  Otherwise a new Parrot string is created.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_and(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2), ARGOUT_NULLOK(STRING **dest))
{
    ASSERT_ARGS(Parrot_str_bitwise_and)
    STRING *res;
    size_t  minlen;

    /* we could also trans_charset to iso-8859-1 */
    if (s1 && s1->encoding != Parrot_fixed_8_encoding_ptr)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "string bitwise_and (%s/%s) unsupported",
            s1->encoding->name, nonnull_encoding_name(s2));

    if (s2 && s2->encoding != Parrot_fixed_8_encoding_ptr)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "string bitwise_and (%s/%s) unsupported",
            nonnull_encoding_name(s1), s2->encoding->name);

    /* think about case of dest string is one of the operands */
    if (s1 && s2)
        minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
    else
        minlen = 0;

    if (dest && *dest) {
        res           = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = Parrot_str_new_init(interp, NULL, minlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!s1 || !s2) {
        res->bufused = 0;
        res->strlen  = 0;

        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#endif

    make_writable(interp, &res, minlen, enum_stringrep_one);

    { /* bitwise AND the strings */
        const Parrot_UInt1 *curr1 = (Parrot_UInt1 *)s1->strstart;
        const Parrot_UInt1 *curr2 = (Parrot_UInt1 *)s2->strstart;
        Parrot_UInt1       *dp    = (Parrot_UInt1 *)res->strstart;
        size_t              len   = minlen;

        while (len--)
            *dp++ = *curr1++ & *curr2++;
    }

    res->bufused = res->strlen = minlen;

    if (dest)
        *dest = res;

    return res;
}

#define BITWISE_XOR_STRINGS(type1, type2, restype, s1, s2, res, maxlen) \
do { \
    const type1 *curr1   = NULL; \
    const type2 *curr2   = NULL; \
    size_t       length1 = 0; \
    size_t       length2 = 0; \
    restype     *dp; \
    size_t       _index; \
 \
    if (s1) { \
        curr1   = (type1 *)(s1)->strstart; \
        length1 = (s1)->strlen; \
    } \
    if (s2) { \
        curr2   = (type2 *)(s2)->strstart; \
        length2 = (s2)->strlen; \
    } \
 \
    dp = (restype *)(res)->strstart; \
    _index = 0; \
 \
    for (; _index < (maxlen) ; ++curr1, ++curr2, ++dp, ++_index) { \
        if (_index < length1) { \
            if (_index < length2) \
                *dp = *curr1 ^ *curr2; \
            else \
                *dp = *curr1; \
        } \
        else if (_index < length2) { \
            *dp = *curr2; \
        } \
    } \
} while (0)


#define BITWISE_OR_STRINGS(type1, type2, restype, s1, s2, res, maxlen) \
do { \
    const type1 *curr1   = NULL; \
    const type2 *curr2   = NULL; \
    size_t       length1 = 0; \
    size_t       length2 = 0; \
    restype     *dp; \
    size_t       _index; \
 \
    if (s1) { \
        curr1   = (type1 *)(s1)->strstart; \
        length1 = (s1)->strlen; \
    } \
    if (s2) { \
        curr2   = (type2 *)(s2)->strstart; \
        length2 = (s2)->strlen; \
    } \
 \
    dp = (restype *)(res)->strstart; \
    _index = 0; \
 \
    for (; _index < (maxlen) ; ++curr1, ++curr2, ++dp, ++_index) { \
        if (_index < length1) { \
            if (_index < length2) \
                *dp = *curr1 | *curr2; \
            else \
                *dp = *curr1; \
        } \
        else if (_index < length2) { \
            *dp = *curr2; \
        } \
    } \
} while (0)


/*

=item C<STRING * Parrot_str_bitwise_or(PARROT_INTERP, const STRING *s1, const
STRING *s2, STRING **dest)>

Performs a bitwise C<OR> on two Parrot strings, performing type and encoding
conversions if necessary. If the third string is not C<NULL>, then it is
reused.  Otherwise a new Parrot string is created.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_or(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2), ARGOUT_NULLOK(STRING **dest))
{
    ASSERT_ARGS(Parrot_str_bitwise_or)
    STRING *res;
    size_t  maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    if (dest && *dest) {
        res           = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = Parrot_str_new_init(interp, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen  = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#endif

    make_writable(interp, &res, maxlen, enum_stringrep_one);

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}


/*

=item C<STRING * Parrot_str_bitwise_xor(PARROT_INTERP, const STRING *s1, const
STRING *s2, STRING **dest)>

Performs a bitwise C<XOR> on two Parrot strings, performing type and encoding
conversions if necessary. If the third string is not C<NULL>, then it is
reused.  Otherwise a new Parrot string is created.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_xor(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2), ARGOUT_NULLOK(STRING **dest))
{
    ASSERT_ARGS(Parrot_str_bitwise_xor)
    STRING *res;
    size_t  maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    if (dest && *dest) {
        res           = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = Parrot_str_new_init(interp, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen  = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#endif

    make_writable(interp, &res, maxlen, enum_stringrep_one);

    BITWISE_XOR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}


#define BITWISE_NOT_STRING(type, s, res) \
do { \
    if ((s) && (res)) { \
        const type   *curr   = (type *)(s)->strstart; \
        size_t        length = (s)->strlen; \
        Parrot_UInt1 *dp     = (Parrot_UInt1 *)(res)->strstart; \
 \
        for (; length ; --length, ++dp, ++curr) \
            *dp = 0xFF & ~ *curr; \
    } \
} while (0)

/*

=item C<STRING * Parrot_str_bitwise_not(PARROT_INTERP, const STRING *s, STRING
**dest)>

Performs a bitwise C<NOT> on a Parrot string. If the second string is
not C<NULL> then it is reused, otherwise a new Parrot string is created.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_not(PARROT_INTERP, ARGIN_NULLOK(const STRING *s),
    ARGOUT_NULLOK(STRING **dest))
{
    ASSERT_ARGS(Parrot_str_bitwise_not)
    STRING *res;
    size_t  len;

    if (s) {
        if (s->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
                "string bitwise_not (%s/%s) unsupported",
                s->encoding->name, s->encoding->name);

        len = s->bufused;
    }
    else
        len = 0;

    if (dest && *dest) {
        res           = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = Parrot_str_new_init(interp, NULL, len,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!len) {
        res->bufused = 0;
        res->strlen  = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#endif

    make_writable(interp, &res, len, enum_stringrep_one);

    res->strlen = res->bufused = len;

    BITWISE_NOT_STRING(Parrot_UInt1, s, res);
    if (dest)
        *dest = res;

    return res;
}


/*

=item C<INTVAL Parrot_str_boolean(PARROT_INTERP, const STRING *s)>

Returns whether the specified Parrot string is true. A string is true if it is
equal to anything other than C<0>, C<""> or C<"0">.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_boolean(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_boolean)
    const INTVAL len = s ? Parrot_str_byte_length(interp, s) : 0;

    if (len == 0)
        return 0;

    if (len == 1) {
        const UINTVAL c = Parrot_str_indexed(interp, s, 0);

        /* relying on character literals being interpreted as ASCII--may
        not be correct on EBCDIC systems. use numeric value instead? */
        if (c == '0')
            /* later, accept other chars with digit value 0? or, no */
            return 0;
    }

    /* it must be true */
    return 1;
}


/*

=item C<STRING * Parrot_str_format_data(PARROT_INTERP, const char *format, ...)>

Writes and returns a Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_format_data(PARROT_INTERP, ARGIN(const char *format), ...)
{
    ASSERT_ARGS(Parrot_str_format_data)
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interp, format, args);
    va_end(args);

    return output;
}

/*
State of FSM during number value parsing.

Integer uses only parse_start, parse_before_dot and parse_end.

*/
typedef enum number_parse_state {
    parse_start,
    parse_before_dot,
    parse_after_dot,
    parse_after_e,
    parse_after_e_sign,
    parse_end
} number_parse_state;


/*

=item C<INTVAL Parrot_str_to_int(PARROT_INTERP, const STRING *s)>

Converts a numeric Parrot string to an integer value.

A number is such that:

    sign            =  '+' | '-'
    digit           =  "Any code point considered a digit by the chartype"
    indicator       =  'e' | 'E'
    digits          =  digit [digit]...
    decimal-part    =  digits '.' [digits] | ['.'] digits
    exponent-part   =  indicator [sign] digits
    numeric-string  =  [sign] decimal-part [exponent-part]

The integer value is the appropriate integer representation of such a number,
rounding towards zero.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_to_int(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_int)
    if (s == NULL)
        return 0;
    {
        const INTVAL        max_safe  = PARROT_INTVAL_MAX / 10;
        const INTVAL        last_dig  = PARROT_INTVAL_MAX % 10;
        int                 sign      = 1;
        INTVAL              i         = 0;
        String_iter         iter;
        UINTVAL             offs;
        number_parse_state  state = parse_start;

        ENCODING_ITER_INIT(interp, s, &iter);

        for (offs = 0; (state != parse_end) && (offs < s->strlen); ++offs) {
            const UINTVAL c = iter.get_and_advance(interp, &iter);
            /* Check for overflow */
            if (c > 255)
                break;

            switch (state) {
              case parse_start:
                if (isdigit((unsigned char)c)) {
                    const INTVAL nextval = c - '0';
                    if (i < max_safe || (i == max_safe && nextval <= last_dig))
                        i = i * 10 + nextval;
                    else
                        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ERR_OVERFLOW,
                                "Integer value of String '%S' too big", s);
                    state = parse_before_dot;
                }
                else if (c == '-') {
                    sign      = -1;
                    state = parse_before_dot;
                }
                else if (c == '+')
                    state = parse_before_dot;
                else if (isspace((unsigned char)c))
                    ; /* Do nothing */
                else
                    state = parse_end;

                break;

              case parse_before_dot:
                if (isdigit((unsigned char)c)) {
                    const INTVAL nextval = c - '0';
                    if (i < max_safe || (i == max_safe && nextval <= last_dig))
                        i = i * 10 + nextval;
                    else
                        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ERR_OVERFLOW,
                                "Integer value of String '%S' too big", s);
                }
                else
                    state = parse_end;
                break;

              default:
                /* Pacify compiler */
                break;
            }
        }

        i *= sign;

        return i;
    }
}

/*

=item C<FLOATVAL Parrot_str_to_num(PARROT_INTERP, const STRING *s)>

Converts a numeric Parrot STRING to a floating point number.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL
Parrot_str_to_num(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_num)
    FLOATVAL      f         = 0.0;
    FLOATVAL      mantissa  = 0.0;
    FLOATVAL      sign      = 1.0; /* -1 for '-' */
    FLOATVAL      divider   = 0.1;
    INTVAL        e         = 0;
    INTVAL        e_sign    = 1; /* -1 for '-' */
    /* How many digits it's safe to parse */
    const INTVAL  max_safe  = PARROT_INTVAL_MAX / 10;
    INTVAL        m         = 0;    /* Integer mantissa */
    int           m_is_safe = 1;    /* We can use integer mantissa */
    INTVAL        d         = 0;    /* Integer descriminator */
    int           d_is_safe = 1;    /* We can use integer mantissa */
    int           d_length  = 0;
    int           check_nan = 0;    /* Check for NaN and Inf after main loop */
    String_iter iter;
    UINTVAL     offs;
    number_parse_state state = parse_start;

    if (!s)
        return 0.0;

    ENCODING_ITER_INIT(interp, s, &iter);

    /* Handcrafter FSM to read float value */
    for (offs = 0; (state != parse_end) && (offs < s->strlen); ++offs) {
        const UINTVAL c = iter.get_and_advance(interp, &iter);
        /* Check for overflow */
        if (c > 255)
            break;

        switch (state) {
          case parse_start:
            if (isdigit((unsigned char)c)) {
                f = c - '0';
                m = c - '0';
                state = parse_before_dot;
            }
            else if (c == '-') {
                sign = -1.0;
                state = parse_before_dot;
            }
            else if (c == '+')
                state = parse_before_dot;
            else if (c == '.')
                state = parse_after_dot;
            else if (isspace((unsigned char)c))
                ; /* Do nothing */
            else {
                check_nan = 1;
                state     = parse_end;
            }
            break;

          case parse_before_dot:
            if (isdigit((unsigned char)c)) {
                f = f*10.0 + (c-'0');
                m = m*10 + (c-'0');
                /* Integer overflow for mantissa */
                if (m >= max_safe)
                    m_is_safe = 0;
            }
            else if (c == '.') {
                state = parse_after_dot;
                /*
                 * Throw gathered result. Recalulate from integer mantissa
                 * to preserve precision.
                 */
                if (m_is_safe)
                    f = m;
                mantissa = f;
            }
            else if (c == 'e' || c == 'E') {
                state = parse_after_e;
                /* See comment above */
                if (m_is_safe)
                    f = m;
                mantissa = f;
            }
            else {
                check_nan = 1;
                state     = parse_end;
            }
            break;

          case parse_after_dot:
            if (isdigit((unsigned char)c)) {
                f += (c-'0') * divider;
                divider /= 10.0;
                d = d*10 + (c-'0');
                if (d >= max_safe)
                    d_is_safe = 0;
                d_length++;
            }
            else if (c == 'e' || c == 'E')
                state = parse_after_e;
            else
                state = parse_end;
            break;

          case parse_after_e:
            if (isdigit((unsigned char)c)) {
                e = e*10 + (c-'0');
                state = parse_after_e_sign;
            }
            else if (c == '-') {
                e_sign = -1;
                state = parse_after_e_sign;
            }
            else if (c == '+')
                state = parse_after_e_sign;
            else
                state = parse_end;
            break;

          case parse_after_e_sign:
            if (isdigit((unsigned char)c))
                e = e*10 + (c-'0');
            else
                state = parse_end;
            break;

          case parse_end:
          default:
            /* Pacify compiler */
            break;
        }
    }

    /* Support for non-canonical NaN and Inf */
    /* charpos <=2 because for "-i" iter will be advanced to next char already */
    if (check_nan && (iter.charpos <= 2)) {
        STRING *t = Parrot_str_upcase(interp, s);
        if (Parrot_str_equal(interp, t, CONST_STRING(interp, "NAN")))
            return PARROT_FLOATVAL_NAN_QUIET;
        else if (Parrot_str_equal(interp, t, CONST_STRING(interp, "INF"))
                || Parrot_str_equal(interp, t, CONST_STRING(interp, "INFINITY")))
            return PARROT_FLOATVAL_INF_POSITIVE;
        else if (Parrot_str_equal(interp, t, CONST_STRING(interp, "-INF"))
                || Parrot_str_equal(interp, t, CONST_STRING(interp, "-INFINITY")))
            return PARROT_FLOATVAL_INF_NEGATIVE;
        else
            return 0.0;
    }

/* powl() could be used here, but it is an optional POSIX extension that
   needs to be checked for at Configure-time.

   See https://trac.parrot.org/parrot/ticket/1176 for more details. */

#  define POW pow

     if (d && d_is_safe) {
        f = mantissa + (1.0 * d / POW(10.0, d_length));
     }

    if (sign < 0)
        f = -f;

    if (e) {
        if (e_sign == 1)
            f *= POW(10.0, e);
        else
            f /= POW(10.0, e);
    }

#undef POW

    return f;
}


/*

=item C<STRING * Parrot_str_from_int(PARROT_INTERP, INTVAL i)>

Returns a Parrot string representation of the specified integer value.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_from_int(PARROT_INTERP, INTVAL i)
{
    ASSERT_ARGS(Parrot_str_from_int)
    char buf[128];
    return Parrot_str_from_int_base(interp, buf, (HUGEINTVAL)i, 10);
}


/*

=item C<STRING * Parrot_str_from_num(PARROT_INTERP, FLOATVAL f)>

Returns a Parrot string representation of the specified floating-point value.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_from_num(PARROT_INTERP, FLOATVAL f)
{
    ASSERT_ARGS(Parrot_str_from_num)
    /* Too damn hard--hand it off to Parrot_sprintf, which'll probably
       use the system sprintf anyway, but has gigantic buffers that are
       awfully hard to overflow. */
    return Parrot_sprintf_c(interp, FLOATVAL_FMT, f);
}


/*

=item C<char * Parrot_str_to_cstring(PARROT_INTERP, const STRING *s)>

Returns a C string for the specified Parrot string. Use
C<Parrot_str_free_cstring()> to free the string. Failure to do this will result in
a memory leak.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char *
Parrot_str_to_cstring(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_cstring)
    if (! s) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't convert NULL string");
    }
    else
      return string_to_cstring_nullable(interp, s);
}


/*

=item C<char * string_to_cstring_nullable(PARROT_INTERP, const STRING *s)>

Returns a C string for the specified Parrot string. Use
C<Parrot_str_free_cstring()> to free the string. Failure to do this will result in
a memory leak.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
char *
string_to_cstring_nullable(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(string_to_cstring_nullable)
    if (!s)
        return NULL;
    else {
        char * const p = (char*)mem_internal_allocate(s->bufused + 1);
        memcpy(p, s->strstart, s->bufused);
        p[s->bufused] = '\0';
        return p;
    }
}


/*

=item C<void Parrot_str_free_cstring(char *p)>

Free a string created by C<Parrot_str_to_cstring()>.

TODO - Hopefully this can go away at some point, as it's got all
sorts of leak potential otherwise.

=cut

*/

PARROT_EXPORT
void
Parrot_str_free_cstring(ARGFREE(char *p))
{
    ASSERT_ARGS(Parrot_str_free_cstring)
    mem_internal_free((void *)p);
}


/*

=item C<void Parrot_str_pin(PARROT_INTERP, STRING *s)>

Replaces the specified Parrot string's managed buffer memory by system memory.

=cut

*/

PARROT_EXPORT
void
Parrot_str_pin(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_str_pin)
    char  *memory;
    size_t size;

    /* XXX -lt: COW strings have the external_FLAG set, so this will
     *          not work for these
     *          so probably only sysmem should be tested
     */
    Parrot_str_write_COW(interp, s);

    size   = Buffer_buflen(s);
    memory = (char *)mem_internal_allocate(size);

    mem_sys_memcopy(memory, Buffer_bufstart(s), size);
    Buffer_bufstart(s) = memory;
    s->strstart      = memory;

    /* Mark the memory as both from the system and immobile */
    PObj_sysmem_SET(s);
}


/*

=item C<void Parrot_str_unpin(PARROT_INTERP, STRING *s)>

Undoes a C<Parrot_str_pin()> so that the string once again uses managed memory.

=cut

*/

PARROT_EXPORT
void
Parrot_str_unpin(PARROT_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_str_unpin)
    void  *memory;
    size_t size;

    /* If this string is not marked using system memory,
     * we just don't do this
     */
    if (!PObj_sysmem_TEST(s))
        return;

    Parrot_str_write_COW(interp, s);
    size = Buffer_buflen(s);

    /* We need a handle on the fixed memory so we can get rid of it later */
    memory = Buffer_bufstart(s);

    /* Reallocate it the same size
     * NOTE can't use Parrot_gc_reallocate_string_storage because of the LEA
     * allocator, where this is a noop for the same size
     *
     * We have to block GC here, as we have a pointer to bufstart
     */
    Parrot_block_GC_sweep(interp);
    Parrot_gc_allocate_string_storage(interp, s, size);
    Parrot_unblock_GC_sweep(interp);
    mem_sys_memcopy(Buffer_bufstart(s), memory, size);

    /* Mark the memory as neither immobile nor system allocated */
    PObj_sysmem_CLEAR(s);

    /* Free up the memory */
    mem_internal_free(memory);
}


/*

=item C<size_t Parrot_str_to_hashval(PARROT_INTERP, STRING *s)>

Returns the hash value for the specified Parrot string, caching it in
C<< s->hashval >>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t
Parrot_str_to_hashval(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_hashval)
    String_iter iter;
    UINTVAL     offs;
    size_t      hashval = interp->hash_seed;

    if (!s || !s->strlen)
        return hashval;

    /* ZZZZZ workaround for something not setting up encodings right */
    saneify_string(s);

    ENCODING_ITER_INIT(interp, s, &iter);

    for (offs = 0; offs < s->strlen; ++offs) {
        const UINTVAL c = iter.get_and_advance(interp, &iter);
        hashval += hashval << 5;
        hashval += c;
    }

    s->hashval = hashval;

    return hashval;
}


/*

=item C<STRING * Parrot_str_escape(PARROT_INTERP, const STRING *src)>

Escapes all non-ASCII chars to backslash sequences. Control chars that
C<Parrot_str_unescape> can handle are escaped as I<\x>, as well as a double
quote character. Other control chars and codepoints < 0x100 are escaped as
I<\xhh>, codepoints up to 0xffff, as I<\uhhhh>, and codepoints greater than
this as I<\x{hh...hh}>.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_escape(PARROT_INTERP, ARGIN_NULLOK(const STRING *src))
{
    ASSERT_ARGS(Parrot_str_escape)
    return Parrot_str_escape_truncate(interp, src, (UINTVAL) ~0);
}


/*

=item C<STRING * Parrot_str_escape_truncate(PARROT_INTERP, const STRING *src,
UINTVAL limit)>

Escapes all non-ASCII characters in the given string with backslashed versions,
but limits the length of the output (used for trace output of strings).

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_escape_truncate(PARROT_INTERP,
        ARGIN_NULLOK(const STRING *src), UINTVAL limit)
{
    ASSERT_ARGS(Parrot_str_escape_truncate)
    STRING *result, *hex;
    UINTVAL i, len, charlen;
    String_iter iter;
    unsigned char *dp;

    if (!src)
        return NULL;

    len = src->strlen;

    if (len > limit)
        len = limit;

    /* expect around 2x the chars */
    charlen = 2 * len;

    if (charlen < 16)
        charlen = 16;

    /* create ascii result */
    result = Parrot_str_new_init(interp, NULL, charlen,
            Parrot_fixed_8_encoding_ptr, Parrot_ascii_charset_ptr, 0);

    /* more work TODO */
    ENCODING_ITER_INIT(interp, src, &iter);
    dp = (unsigned char *)result->strstart;

    for (i = 0; len > 0; --len) {
        UINTVAL c = iter.get_and_advance(interp, &iter);
        if (c < 0x7f) {
            /* process ASCII chars */
            if (i >= charlen - 2) {
                /* resize - still len codepoints to go */
                charlen += len * 2 + 16;
                Parrot_gc_reallocate_string_storage(interp, result, charlen);
                /* start can change */
                dp = (unsigned char *)result->strstart;
            }
            switch (c) {
              case '\\':
                dp[i++] = '\\';
                break;
              case '\a':
                dp[i++] = '\\';
                c = 'a';
                break;
              case '\b':
                dp[i++] = '\\';
                c = 'b';
                break;
              case '\n':
                dp[i++] = '\\';
                c = 'n';
                break;
              case '\r':
                dp[i++] = '\\';
                c = 'r';
                break;
              case '\t':
                dp[i++] = '\\';
                c = 't';
                break;
              case '\f':
                dp[i++] = '\\';
                c = 'f';
                break;
              case '"':
                dp[i++] = '\\';
                c = '"';
                break;
              case 27:
                dp[i++] = '\\';
                c = 'e';
                break;
              default:
                break;
            }
            if (c >= 0x20) {
                dp[i++]         = (unsigned char)c;
                result->bufused = result->strlen = i;
                continue;
            }
        }

        /* escape by appending either \uhhhh or \x{hh...} */
        result->bufused = result->strlen = i;

        if (c < 0x0100 || c >= 0x10000)
            hex = Parrot_sprintf_c(interp, "\\x{%x}", c);
        else
            hex = Parrot_sprintf_c(interp, "\\u%04x", c);

        result = Parrot_str_append(interp, result, hex);

        /* adjust our insert idx */
        i += hex->strlen;

        /* and usable len */
        charlen = Buffer_buflen(result);
        dp      = (unsigned char *)result->strstart;

        PARROT_ASSERT(i <= charlen);
    }

    result->bufused = result->strlen = i;
    return result;
}


/*

=item C<STRING * Parrot_str_unescape(PARROT_INTERP, const char *cstring, char
delimiter, const char *enc_char)>

Unescapes the specified C string. These sequences are covered:

  \xhh        1..2 hex digits
  \ooo        1..3 oct digits
  \cX         control char X
  \x{h..h}    1..8 hex digits
  \uhhhh      4 hex digits
  \Uhhhhhhhh  8 hex digits
  \a, \b, \t, \n, \v, \f, \r, \e

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_unescape(PARROT_INTERP,
    ARGIN(const char *cstring), char delimiter, ARGIN_NULLOK(const char *enc_char))
{
    ASSERT_ARGS(Parrot_str_unescape)

    STRING         *result;
    const CHARSET  *charset;
    const ENCODING *encoding = NULL;

    /* does the encoding have a character set? */
    const char     *p        = enc_char ? strchr(enc_char, ':') : NULL;
    size_t          clength  = strlen(cstring);
    String_iter     iter;
    UINTVAL         offs, d;
    Parrot_UInt4    r;

    /* we are constructing const table strings here */
    const UINTVAL   flags = PObj_constant_FLAG;

    if (delimiter && clength)
        --clength;

    if (p) {
        #define MAX_ENCODING_NAME_ALLOWED 63
        char   buffer[MAX_ENCODING_NAME_ALLOWED + 1];
        size_t l = p - enc_char;
        charset  = NULL;

        if (l < MAX_ENCODING_NAME_ALLOWED) {
            memcpy(buffer, enc_char, l);
            buffer[l] = '\0';
            encoding  = Parrot_find_encoding(interp, buffer);
        }
        if (!encoding)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Can't make '%s' encoding strings", enc_char);

        charset = Parrot_find_charset(interp, p + 1);
        if (!charset)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Can't make '%s' charset strings", p + 1);

        result   = Parrot_str_new_init(interp, cstring, clength,
                        encoding, charset, flags);
        encoding = Parrot_fixed_8_encoding_ptr;
    }
    else {
        result   = string_make(interp, cstring, clength, enc_char, flags);
        encoding = result->encoding;
    }

    encoding->iter_init(interp, result, &iter);

    for (offs = d = 0; offs < clength; ++offs) {
        r = (Parrot_UInt4)((unsigned char *)result->strstart)[offs];

        /* There cannot be any NULs within this string.  */
        PARROT_ASSERT(r != '\0');

        if (r == '\\') {
            ++offs;
            r = string_unescape_one(interp, &offs, result);
            --offs;
        }

        if (d == offs) {
            /* we did it in place - no action */
            ++d;
            iter.bytepos++;
            iter.charpos++;
            continue;
        }

        PARROT_ASSERT(d < offs);
        iter.set_and_advance(interp, &iter, r);
        ++d;
    }

    result->strlen  = d;
    result->bufused = iter.bytepos;

    /* this also validates the string */
    if (encoding != result->encoding)
        Parrot_str_length(interp, result);

    if (!CHARSET_VALIDATE(interp, result))
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_STRING_REPRESENTATION, "Malformed string");

    return result;
}


/*

=item C<STRING * Parrot_str_upcase(PARROT_INTERP, const STRING *s)>

Returns a copy of the specified Parrot string converted to upper case.
Non-caseable characters are left unchanged.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING *
Parrot_str_upcase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_upcase)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't upcase NULL string");
    }
    else {
        DECL_CONST_CAST;
        STRING * const dest = Parrot_str_copy(interp, PARROT_const_cast(STRING *, s));
        Parrot_str_upcase_inplace(interp, dest);
        return dest;
    }
}


/*

=item C<void Parrot_str_upcase_inplace(PARROT_INTERP, STRING *s)>

Converts the specified Parrot string to upper case.

=cut

*/

PARROT_EXPORT
void
Parrot_str_upcase_inplace(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
{
    ASSERT_ARGS(Parrot_str_upcase_inplace)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't upcase NULL string");
    }
    else {
        Parrot_str_write_COW(interp, s);
        CHARSET_UPCASE(interp, s);
    }
}


/*

=item C<STRING * Parrot_str_downcase(PARROT_INTERP, const STRING *s)>

Returns a copy of the specified Parrot string converted to lower case.
Non-caseable characters are left unchanged.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING *
Parrot_str_downcase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_downcase)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't downcase NULL string");
    }
    else {
        DECL_CONST_CAST;
        STRING * const dest = Parrot_str_copy(interp, PARROT_const_cast(STRING *, s));
        Parrot_str_downcase_inplace(interp, dest);
        return dest;
    }
}


/*

=item C<void Parrot_str_downcase_inplace(PARROT_INTERP, STRING *s)>

Converts the specified Parrot string to lower case.

=cut

*/

PARROT_EXPORT
void
Parrot_str_downcase_inplace(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
{
    ASSERT_ARGS(Parrot_str_downcase_inplace)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't downcase NULL string");
    }
    else {
        /*
         * TODO get rid of all the inplace variants. We have for utf8:
         * * 1 Parrot_str_copy from the non-incase variant
         * * conversion to utf16, with doubling the buffer
         * * possibly one more reallocation in downcase
         */
        Parrot_str_write_COW(interp, s);
        CHARSET_DOWNCASE(interp, s);
    }
}


/*

=item C<STRING * Parrot_str_titlecase(PARROT_INTERP, const STRING *s)>

Returns a copy of the specified Parrot string converted to title case.
Non-caseable characters are left unchanged.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
STRING *
Parrot_str_titlecase(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_titlecase)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't titlecase NULL string");
    }
    else {
        DECL_CONST_CAST;
        STRING * const dest = Parrot_str_copy(interp, PARROT_const_cast(STRING *, s));
        Parrot_str_titlecase_inplace(interp, dest);
        return dest;
    }
}


/*

=item C<void Parrot_str_titlecase_inplace(PARROT_INTERP, STRING *s)>

Converts the specified Parrot string to title case.

=cut

*/

PARROT_EXPORT
void
Parrot_str_titlecase_inplace(PARROT_INTERP, ARGMOD_NULLOK(STRING *s))
{
    ASSERT_ARGS(Parrot_str_titlecase_inplace)
    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't titlecase NULL string");
    }
    else {
        Parrot_str_write_COW(interp, s);
        CHARSET_TITLECASE(interp, s);
    }
}


/*

=item C<STRING * string_increment(PARROT_INTERP, const STRING *s)>

Increments the string in the Perl 5 fashion, where incrementing aa gives you bb
and so on.  Currently single char only.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
string_increment(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(string_increment)
    UINTVAL o;

    if (Parrot_str_byte_length(interp, s) != 1)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "increment only for length = 1 done");

    o = (UINTVAL)string_ord(interp, s, 0);

    if ((o >= 'A' && o < 'Z') || (o >= 'a' && o < 'z')) {
        ++o;
        /* TODO increment in place */
        return string_chr(interp, o);
    }

    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
        "increment out of range - unimplemented");
}


/*

=item C<const char * Parrot_string_cstring(PARROT_INTERP, const STRING *str)>

Returns a C string from a Parrot string.  Both sides are treated
as constants -- i.e. do not resize the result.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
const char *
Parrot_string_cstring(SHIM_INTERP, ARGIN(const STRING *str))
{
    ASSERT_ARGS(Parrot_string_cstring)
    /* TODO handle NUL and friends */
    return str->strstart;
}


/*

=item C<INTVAL Parrot_str_is_cclass(PARROT_INTERP, INTVAL flags, const STRING
*s, UINTVAL offset)>

Returns 1 if the codepoint of string C<s> at given offset is in the given
character class C<flags>. See also F<include/parrot/cclass.h> for possible
character classes. Returns 0 otherwise, or if the string is empty or NULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_is_cclass(PARROT_INTERP, INTVAL flags,
        ARGIN(const STRING *s), UINTVAL offset)
{
    ASSERT_ARGS(Parrot_str_is_cclass)
    if (!Parrot_str_byte_length(interp, s))
        return 0;

    return CHARSET_IS_CCLASS(interp, flags, s, offset);
}


/*

=item C<INTVAL Parrot_str_find_cclass(PARROT_INTERP, INTVAL flags, STRING *s,
UINTVAL offset, UINTVAL count)>

Finds the first occurrence of the given character class in C<flags> in the
string, and returns its glyph-wise index.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_find_cclass(PARROT_INTERP, INTVAL flags, ARGIN_NULLOK(STRING *s),
                          UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(Parrot_str_find_cclass)
    if (!s)
        return -1;

    return CHARSET_FIND_CCLASS(interp, flags, s, offset, count);
}

/*

=item C<INTVAL Parrot_str_find_not_cclass(PARROT_INTERP, INTVAL flags, STRING
*s, UINTVAL offset, UINTVAL count)>

Finds the first occurrence of the a character I<not> in the given character
class in C<flags> in the string starting from C<offset> and looking at C<count>
positions, and returns its glyph-wise index.  Returns C<offset + count>, if not
found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_find_not_cclass(PARROT_INTERP, INTVAL flags,
    ARGIN_NULLOK(STRING *s), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(Parrot_str_find_not_cclass)
    if (!s)
        return -1;

    return CHARSET_FIND_NOT_CCLASS(interp, flags, s, offset, count);
}


/*

=item C<STRING* Parrot_str_change_charset(PARROT_INTERP, STRING *src, INTVAL
charset_nr, STRING *dest)>

If C<dest> == NULL, converts C<src> to the given charset or encoding inplace.
Otherwise returns a copy of C<src> with the charset/encoding in C<dest>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_str_change_charset(PARROT_INTERP, ARGMOD_NULLOK(STRING *src),
        INTVAL charset_nr, ARGOUT_NULLOK(STRING *dest))
{
    ASSERT_ARGS(Parrot_str_change_charset)
    const CHARSET *new_charset;

    if (!src)
        return NULL;

    new_charset = Parrot_get_charset(interp, charset_nr);

    if (!new_charset)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARTYPE,
                "charset #%d not found", (int) charset_nr);

    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        if (new_charset == src->charset) {
            dest          = Parrot_str_reuse_COW(interp, src, dest);
            dest->charset = new_charset;
            /* keep encoding */
            return dest;
        }

        dest->charset  = new_charset;

        /* get prefered encoding for charset */
        dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
    }
    else {
        if (new_charset == src->charset)
            return src;

        Parrot_str_write_COW(interp, src);
    }

    return new_charset->to_charset(interp, src, dest);
}


/*

=item C<STRING* Parrot_str_change_encoding(PARROT_INTERP, STRING *src, INTVAL
encoding_nr, STRING *dest)>

If C<dest> == NULL, converts C<src> to the given charset or encoding in place.
Otherwise returns a copy of C<src> with the charset/encoding in C<dest>

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_str_change_encoding(PARROT_INTERP, ARGIN_NULLOK(STRING *src),
        INTVAL encoding_nr, ARGOUT_NULLOK(STRING *dest))
{
    ASSERT_ARGS(Parrot_str_change_encoding)
    const ENCODING *new_encoding;

    if (!src)
        return NULL;

    new_encoding = Parrot_get_encoding(interp, encoding_nr);

    if (!new_encoding)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARTYPE,
            "encoding #%d not found", (int) encoding_nr);

    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        dest->encoding = new_encoding;
        if (new_encoding == src->encoding) {
            dest = Parrot_str_reuse_COW(interp, src, dest);
            return dest;
        }
    }
    else {
        if (new_encoding == src->encoding)
            return src;

        Parrot_str_write_COW(interp, src);
    }

    return new_encoding->to_encoding(interp, src, dest);
}


/*

=item C<STRING * Parrot_str_compose(PARROT_INTERP, STRING *src)>

Normalizes the string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_compose(PARROT_INTERP, ARGIN_NULLOK(STRING *src))
{
    ASSERT_ARGS(Parrot_str_compose)
    if (!src)
        return NULL;

    if (!src->strlen)
        return Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

    return CHARSET_COMPOSE(interp, src);
}


/*

=item C<STRING* Parrot_str_join(PARROT_INTERP, STRING *j, PMC *ar)>

Joins the elements of the array C<ar> as strings with the string C<j> between
them, returning the result.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
Parrot_str_join(PARROT_INTERP, ARGIN_NULLOK(STRING *j), ARGIN(PMC *ar))
{
    ASSERT_ARGS(Parrot_str_join)
    STRING *res;
    STRING *s;
    const int ar_len = VTABLE_elements(interp, ar);
    int i;

    if (ar_len == 0)
        return Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

    s   = VTABLE_get_string_keyed_int(interp, ar, 0);
    res = s ? Parrot_str_copy(interp, s) : NULL;

    for (i = 1; i < ar_len; ++i) {
        STRING * const next = VTABLE_get_string_keyed_int(interp, ar, i);

        res  = Parrot_str_append(interp, res, j);
        res  = Parrot_str_append(interp, res, next);
    }

    return res;
}


/*

=item C<PMC* Parrot_str_split(PARROT_INTERP, STRING *delim, STRING *str)>

Splits the string C<str> at the delimiter C<delim>, returning a
C<ResizableStringArray>, or his mapped type in the current HLL,
of results. Returns PMCNULL if the string or the delimiter is NULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_str_split(PARROT_INTERP,
    ARGIN_NULLOK(STRING *delim), ARGIN_NULLOK(STRING *str))
{
    ASSERT_ARGS(Parrot_str_split)
    PMC    *res;
    INTVAL  slen, dlen, ps, pe;

    if (STRING_IS_NULL(delim) || STRING_IS_NULL(str))
        return PMCNULL;

    res  = Parrot_pmc_new(interp, Parrot_get_ctx_HLL_type(interp, enum_class_ResizableStringArray));
    slen = Parrot_str_byte_length(interp, str);

    if (!slen)
        return res;

    dlen = Parrot_str_byte_length(interp, delim);

    if (dlen == 0) {
        int i;
        VTABLE_set_integer_native(interp, res, slen);

        for (i = 0; i < slen; ++i) {
            STRING * const p = Parrot_str_substr(interp, str, i, 1, NULL, 0);
            VTABLE_set_string_keyed_int(interp, res, i, p);
        }

        return res;
    }

    pe = Parrot_str_find_index(interp, str, delim, 0);

    if (pe < 0) {
        VTABLE_push_string(interp, res, str);
        return res;
    }

    ps = 0;

    while (ps <= slen) {
        const int      pl   = pe - ps;
        STRING * const tstr = Parrot_str_substr(interp, str, ps, pl, NULL, 0);

        VTABLE_push_string(interp, res, tstr);
        ps = pe + Parrot_str_byte_length(interp, delim);

        if (ps > slen)
            break;

        pe = Parrot_str_find_index(interp, str, delim, ps);

        if (pe < 0)
            pe = slen;
    }

    return res;
}


/*

=item C<STRING* Parrot_str_from_uint(PARROT_INTERP, char *tc, UHUGEINTVAL num,
unsigned int base, int minus)>

Returns C<num> converted to a Parrot C<STRING>.

Note that C<base> must be defined (a default of 10 is not assumed). The caller
has to verify that C<< base >= 2 && base <= 36 >> The buffer C<tc> must be at
least C<sizeof (UHUGEINTVAL)*8 + 1> chars big.

If C<minus> is true, then C<-> is prepended to the string representation.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
Parrot_str_from_uint(PARROT_INTERP, ARGOUT(char *tc), UHUGEINTVAL num,
    unsigned int base, int minus)
{
    ASSERT_ARGS(Parrot_str_from_uint)
    /* the buffer must be at least as long as this */
    char               *p    = tc + sizeof (UHUGEINTVAL)*8 + 1;
    const char * const  tail = p;

    PARROT_ASSERT(base >= 2 && base <= 36);

    do {
        const char cur = (char)(num % base);
        if (cur < 10) {
            *--p = (char)('0' + cur);
        }
        else {
            *--p = (char)('a' + cur - 10);
        }
    } while (num /= base);

    if (minus)
        *--p = '-';

    return string_make(interp, p, (UINTVAL)(tail - p), "ascii", 0);
}


/*

=item C<STRING * Parrot_str_from_int_base(PARROT_INTERP, char *tc, HUGEINTVAL
num, unsigned int base)>

Returns C<num> converted to a Parrot C<STRING>.

Note that C<base> must be defined (a default of 10 is not assumed).

If C<< num < 0 >>, then C<-> is prepended to the string representation.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_from_int_base(PARROT_INTERP, ARGOUT(char *tc), HUGEINTVAL num, unsigned int base)
{
    ASSERT_ARGS(Parrot_str_from_int_base)
    const int is_neg = (num < 0);

    if (is_neg)
        num = -num;

    return Parrot_str_from_uint(interp, tc, (UHUGEINTVAL)num, base, is_neg);
}

/*

=back

=head1 SEE ALSO

=over

=item F<src/string/primitives.c>

=item F<include/parrot/string.h>

=item F<include/parrot/string_funcs.h>

=item F<docs/strings.pod>

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
