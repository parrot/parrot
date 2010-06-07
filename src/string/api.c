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
#if PARROT_CATCH_NULL
STRING *STRINGNULL;
#endif

#define nonnull_encoding_name(s) (s) ? (s)->encoding->name : "null string"
#define ASSERT_STRING_SANITY(s) \
    PARROT_ASSERT((s)->encoding); \
    PARROT_ASSERT((s)->charset); \
    PARROT_ASSERT(!PObj_on_free_list_TEST(s))

/* HEADERIZER HFILE: include/parrot/string_funcs.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_INLINE
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static const CHARSET * string_rep_compatible(SHIM_INTERP,
    ARGIN(const STRING *a),
    ARGIN(const STRING *b),
    ARGOUT(const ENCODING **e))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*e);

PARROT_DOES_NOT_RETURN
PARROT_COLD
static void throw_illegal_escape(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_string_rep_compatible __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b) \
    , PARROT_ASSERT_ARG(e))
#define ASSERT_ARGS_throw_illegal_escape __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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
    return STRING_IS_NULL(s);
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

    if (interp->parent_interpreter)
        interp->hash_seed = interp->parent_interpreter->hash_seed;

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

#if PARROT_CATCH_NULL
    /* initialize STRINGNULL, but not in the constant table */
    STRINGNULL = Parrot_str_new_init(interp, NULL, 0,
                       PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                       PObj_constant_FLAG);
#endif

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
    s->extra    = NULL;

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

Returns NULL, if no compatible string representation can be found.

=cut

*/

PARROT_INLINE
PARROT_IGNORABLE_RESULT
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
    &&  b->charset  == Parrot_ascii_charset_ptr) {
        if (a->strlen == a->bufused) {
            *e = Parrot_fixed_8_encoding_ptr;
            return b->charset;
        }
        *e = a->encoding;
        return a->charset;
    }

    if (b->encoding == Parrot_utf8_encoding_ptr
    &&  a->charset  == Parrot_ascii_charset_ptr) {
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

=item C<const CHARSET * Parrot_str_rep_compatible(PARROT_INTERP, const STRING
*a, const STRING *b, const ENCODING **e)>

Find the "lowest" possible charset and encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returns NULL, if no compatible string representation can be found.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
const CHARSET *
Parrot_str_rep_compatible(PARROT_INTERP,
    ARGIN(const STRING *a), ARGIN(const STRING *b), ARGOUT(const ENCODING **e))
{
    ASSERT_ARGS(Parrot_str_rep_compatible)
    return string_rep_compatible(interp, a, b, e);
}

/*

=item C<STRING* Parrot_str_clone(PARROT_INTERP, const STRING *s)>

Helper function to clone string.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
Parrot_str_clone(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_clone)

    const size_t alloc_size = s->bufused;
    STRING * const result = Parrot_gc_new_string_header(interp, 0);

    /* Copy encoding/charset/etc */
    STRUCT_COPY(result, s);

    /* Clear COW flag. We own buffer */
    PObj_get_FLAGS(result)  = PObj_is_string_FLAG
                            | PObj_is_COWable_FLAG
                            | PObj_live_FLAG;

    /* Allocate new chunk of memory */
    Parrot_gc_allocate_string_storage(interp, result, alloc_size);

    /* and copy it over */
    mem_sys_memcopy(result->strstart, s->strstart, alloc_size);

    if (s->encoding == Parrot_nfg_encoding_ptr && s->extra != NULL)
        result->extra = clone_grapheme_table(s->extra);

    return result;
}


/*

=item C<STRING * Parrot_str_copy(PARROT_INTERP, const STRING *s)>

Creates and returns a shallow copy of the specified Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_copy(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_copy)
    STRING *d;
    const int is_movable = PObj_is_movable_TESTALL(s);

    /* We set COW flag to avoid cloning buffer in compact_pool */

    d = Parrot_gc_new_string_header(interp,
        PObj_get_FLAGS(s) & ~PObj_constant_FLAG);
    STRUCT_COPY(d, s);

    /* Now check that buffer allocated from pool and affected by compacting */
    if (is_movable && Buffer_bufstart(s)) {
        /* If so, mark it as shared */
        INTVAL * const buffer_flags = Buffer_bufrefcountptr(d);
        *buffer_flags |= Buffer_shared_FLAG;
    }

    PARROT_ASSERT(is_movable == PObj_is_movable_TESTALL(d));

    return d;
}


/*

=item C<STRING * Parrot_str_concat(PARROT_INTERP, const STRING *a, const STRING
*b)>

Concatenates two Parrot strings. If necessary, converts the second
string's encoding and/or type to match those of the first string. If
either string is C<NULL>, then a copy of the non-C<NULL> string is
returned. If both strings are C<NULL>, return C<STRINGNULL>.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_concat(PARROT_INTERP, ARGIN_NULLOK(const STRING *a),
            ARGIN_NULLOK(const STRING *b))
{
    ASSERT_ARGS(Parrot_str_concat)
    const CHARSET   *cs;
    const ENCODING  *enc = NULL;
    STRING          *dest;
    UINTVAL          total_length;

    /* XXX should this be a CHARSET method? */

    /* If B isn't real, we just bail */
    const UINTVAL b_len = b ? Parrot_str_length(interp, b) : 0;
    if (!b_len)
        return STRING_IS_NULL(a) ? STRINGNULL : Parrot_str_copy(interp, a);

    /* Is A real? */
    if (STRING_IS_NULL(a) || Buffer_bufstart(a) == NULL)
        return Parrot_str_copy(interp, b);

    ASSERT_STRING_SANITY(a);
    ASSERT_STRING_SANITY(b);

    cs = string_rep_compatible(interp, a, b, &enc);

    if (!cs) {
        /* upgrade strings for concatenation */
        cs = Parrot_unicode_charset_ptr;
        if (a->encoding == Parrot_ucs4_encoding_ptr
            || b->encoding == Parrot_ucs4_encoding_ptr)
            enc = Parrot_ucs4_encoding_ptr;
        else if (a->encoding == Parrot_nfg_encoding_ptr
            || b->encoding == Parrot_nfg_encoding_ptr)
            enc = Parrot_ucs4_encoding_ptr;
        else if (a->encoding == Parrot_utf16_encoding_ptr
            ||  b->encoding == Parrot_utf16_encoding_ptr
            ||  a->encoding == Parrot_ucs2_encoding_ptr
            ||  b->encoding == Parrot_ucs2_encoding_ptr)
            enc = Parrot_utf16_encoding_ptr;
        else
            enc = Parrot_utf8_encoding_ptr;

        a = Parrot_unicode_charset_ptr->to_charset(interp, a);
        b = Parrot_unicode_charset_ptr->to_charset(interp, b);

        if (a->encoding != enc)
            a = enc->to_encoding(interp, a);
        if (b->encoding != enc)
            b = enc->to_encoding(interp, b);
    }
    /* calc usable and total bytes */
    total_length = a->bufused + b->bufused;

    dest = Parrot_str_new_noinit(interp, enum_stringrep_one, total_length);
    PARROT_ASSERT(enc);
    PARROT_ASSERT(cs);
    dest->encoding = enc;
    dest->charset  = cs;

    /* Copy A first */
    mem_sys_memcopy(dest->strstart, a->strstart, a->bufused);

    /* Tack B on the end of A */
    mem_sys_memcopy((void *)((ptrcast_t)dest->strstart + a->bufused),
            b->strstart, b->bufused);

    dest->bufused = a->bufused + b->bufused;
    dest->strlen  = a->strlen + b_len;

    return dest;
}


/*

=item C<STRING * Parrot_str_new(PARROT_INTERP, const char *buffer, const UINTVAL
len)>

Makes a Parrot string from a specified C string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new(PARROT_INTERP, ARGIN_NULLOK(const char *buffer), const UINTVAL len)
{
    ASSERT_ARGS(Parrot_str_new)
    /* Force an 8-bit encoding at some point? */
    const UINTVAL buff_length = (len > 0) ? len : buffer ? strlen(buffer) : 0;

    return Parrot_str_new_init(interp, buffer, buff_length,
        PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET, 0);
}


/*

=item C<STRING * Parrot_str_new_from_buffer(PARROT_INTERP, Buffer *buffer, const
UINTVAL len)>

Makes a Parrot string from a Buffer.

The Buffer is nulled afterwards, as only one PObj can point at a given string
pool object.

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

    STRING * const result   = Parrot_gc_new_string_header(interp, 0);
    Buffer_bufstart(result) = Buffer_bufstart(buffer);
    Buffer_buflen(result)   = Buffer_buflen(buffer);
    result->strstart        = (char *)Buffer_bufstart(result);
    result->bufused         = len;
    result->strlen          = len;
    result->encoding        = Parrot_fixed_8_encoding_ptr;
    result->charset         = Parrot_binary_charset_ptr;
    result->extra           = NULL;

    Buffer_buflen(buffer)   = 0;
    Buffer_bufstart(buffer) = NULL;

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
    Hash   * const cstring_cache = (Hash *)interp->const_cstring_hash;
    STRING *s                    = (STRING *)parrot_hash_get(interp,
                                        cstring_cache, buffer);

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

    if (charset_name) {
        charset = Parrot_find_charset(interp, charset_name);
        if (!charset)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Can't make '%s' charset strings", charset_name);
    }
    else
        charset = Parrot_get_charset(interp, 0);

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
    s->extra         = NULL;

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
            s->strlen = CHARSET_CODEPOINTS(interp, s);

        return s;
    }

    Parrot_gc_allocate_string_storage(interp, s, len);

    if (buffer) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            s->strlen = CHARSET_CODEPOINTS(interp, s);
    }
    else
        s->strlen = s->bufused = 0;

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

    return STRING_IS_NULL(s) ? 0 : s->bufused;
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
    ASSERT_STRING_SANITY(s);
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
    UINTVAL len;

    if (start < 0)
        return -1;

    len = Parrot_str_length(interp, s);

    if (!len)
        return -1;

    if (start >= (INTVAL)len)
        return -1;

    /* Short circuit when s is the same as s2 */
    if (s == s2)
        return start == 0 ? 0 : -1;

    if (!Parrot_str_length(interp, s2))
        return -1;
    else {
        DECL_CONST_CAST;
        STRING *src    = PARROT_const_cast(STRING *, s);
        STRING *search = PARROT_const_cast(STRING *, s2);

        return CHARSET_INDEX(interp, src, search, (UINTVAL)start);
    }
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
string_ord(PARROT_INTERP, ARGIN(const STRING *s), INTVAL idx)
{
    ASSERT_ARGS(string_ord)
    UINTVAL len;
    UINTVAL       true_index = (UINTVAL)idx;

    if (STRING_IS_NULL(s))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ORD_OUT_OF_STRING,
            "Cannot get character of NULL string");

    len = Parrot_str_length(interp, s);
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

=back

=head2 Vtable Dispatch Functions

=over 4

=item C<INTVAL Parrot_str_length(PARROT_INTERP, const STRING *s)>

Returns the number of characters in the specified Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_length(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_length)

    return STRING_IS_NULL(s) ? 0 : s->strlen;
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
        for (i = 0; i < num; ++i) {
            mem_sys_memcopy(destpos, srcpos, length);
            destpos += length;
        }

        dest->strlen  = s->strlen  * num;
        dest->bufused = s->bufused * num;
    }

    return dest;
}


/*

=item C<STRING * Parrot_str_substr(PARROT_INTERP, const STRING *src, INTVAL
offset, INTVAL length)>

Returns substring of length C<length> from C<offset> from the specified
Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_substr(PARROT_INTERP,
        ARGIN_NULLOK(const STRING *src), INTVAL offset, INTVAL length)
{
    ASSERT_ARGS(Parrot_str_substr)

    UINTVAL true_length;
    UINTVAL true_offset = (UINTVAL)offset;

    if (STRING_IS_NULL(src))
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING, "Cannot substr on a null string");

    ASSERT_STRING_SANITY(src);

    /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
    if (offset == (INTVAL)Parrot_str_length(interp, src) || length < 1)
        return Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

    if (offset < 0)
        true_offset = (UINTVAL)(src->strlen + offset);

    /* 0 based... */
    if (src->strlen == 0 || true_offset > src->strlen - 1)
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Cannot take substr outside string");

    true_length = (UINTVAL)length;

    if (true_length > (src->strlen - true_offset))
        true_length = (UINTVAL)(src->strlen - true_offset);

    return CHARSET_GET_CODEPOINTS(interp, src, true_offset, true_length);
}


/*

=item C<STRING * Parrot_str_replace(PARROT_INTERP, const STRING *src, INTVAL
offset, INTVAL length, const STRING *rep)>

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
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_replace(PARROT_INTERP, ARGIN(const STRING *src),
    INTVAL offset, INTVAL length, ARGIN(const STRING *rep))
{
    ASSERT_ARGS(Parrot_str_replace)
    String_iter     iter;
    const CHARSET  *cs;
    const ENCODING *enc;
    STRING         *dest        = NULL;
    UINTVAL         true_offset = (UINTVAL)offset;
    UINTVAL         true_length = (UINTVAL)length;

    UINTVAL         start_byte, end_byte;
    INTVAL          buf_size;

    if (STRING_IS_NULL(src)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't replace in NULL string");
    }

    /* abs(-offset) may not be > strlen-1 */
    if (offset < 0)
        true_offset = (UINTVAL)(src->strlen + offset);

    /* Can replace 1 past end of string which is technically outside the string
     * but is same as a concat().
     * Only give exception if caller trys to replace end of string + 2
     */
    if (true_offset > src->strlen)
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "Can only replace inside string or index after end of string");

    if (true_length > (src->strlen - true_offset))
        true_length = (UINTVAL)(src->strlen - true_offset);

    /* may have different reps..... */
    cs = string_rep_compatible(interp, src, rep, &enc);

    if (!cs) {
        src = Parrot_utf16_encoding_ptr->to_encoding(interp, src);
        rep = Parrot_utf16_encoding_ptr->to_encoding(interp, rep);
        /* Remember selected charset and encoding */
        enc = src->encoding;
        cs  = src->charset;
    }

    /* get byte position of the part that will be replaced */
    ENCODING_ITER_INIT(interp, src, &iter);

    iter.set_position(interp, &iter, true_offset);
    start_byte = iter.bytepos;

    iter.set_position(interp, &iter, true_offset + true_length);
    end_byte   = iter.bytepos;

    /* not possible.... */
    if (end_byte < start_byte)
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "replace: subend somehow is less than substart");

    /* Now do the replacement */
    dest = Parrot_gc_new_string_header(interp, 0);

    /* Set encoding and charset to compatible */
    dest->encoding = enc;
    dest->charset  = cs;

    /* TODO: We should merge the grapheme tables here and translate the
       dynamic graphemes in the second string if needed. */
    dest->extra    = NULL;

    /* Clear COW flag. We own buffer */
    PObj_get_FLAGS(dest) = PObj_is_string_FLAG
                         | PObj_is_COWable_FLAG
                         | PObj_live_FLAG;

            /* size            removed bytes            added bytes */
    buf_size = src->bufused - (end_byte - start_byte) + rep->bufused;

    /* Alloctate new string size. */
    Parrot_gc_allocate_string_storage(interp, dest, buf_size);
    dest->bufused = buf_size;

    /* Copy begin of string */
    mem_sys_memcopy(dest->strstart, src->strstart, start_byte);

    /* Copy the replacement in */
    mem_sys_memcopy((char *)dest->strstart + start_byte, rep->strstart,
            rep->bufused);

    /* Copy the end of old string */
    mem_sys_memcopy((char *)dest->strstart + start_byte + rep->bufused,
            (char *)src->strstart + end_byte,
            src->bufused - end_byte);

    dest->strlen  = CHARSET_CODEPOINTS(interp, dest);
    dest->hashval = 0;

    return dest;
}


/*

=item C<STRING * Parrot_str_chopn(PARROT_INTERP, const STRING *s, INTVAL n)>

Removes the last C<n> characters of the specified Parrot string and returns the
modified string. If C<n> is negative, cuts the string after C<+n> characters.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_chopn(PARROT_INTERP, ARGIN(const STRING *s), INTVAL n)
{
    ASSERT_ARGS(Parrot_str_chopn)

    STRING * const chopped = Parrot_str_copy(interp, s);
    UINTVAL new_length, uchar_size;

    if (n < 0) {
        new_length = -n;
        if (new_length > chopped->strlen)
            return chopped;
    }
    else {
        if (chopped->strlen > (UINTVAL)n)
            new_length = chopped->strlen - n;
        else
            new_length = 0;
    }

    chopped->hashval = 0;

    if (!new_length || !chopped->strlen) {
        chopped->bufused = chopped->strlen = 0;
        return chopped;
    }

    uchar_size      = chopped->bufused / chopped->strlen;
    chopped->strlen = new_length;

    if (chopped->encoding == Parrot_fixed_8_encoding_ptr) {
        chopped->bufused = new_length;
    }
    else if (chopped->encoding == Parrot_ucs2_encoding_ptr) {
        chopped->bufused = new_length * uchar_size;
    }
    else {
        String_iter iter;

        ENCODING_ITER_INIT(interp, s, &iter);
        iter.set_position(interp, &iter, new_length);
        chopped->bufused = iter.bytepos;
    }

    return chopped;
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
    if (STRING_IS_NULL(s2))
        return s1 && (s1->strlen != 0);

    if (STRING_IS_NULL(s1))
        return -(s2->strlen != 0);

    ASSERT_STRING_SANITY(s1);
    ASSERT_STRING_SANITY(s2);

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

    if ((s1 == s2) || (STRING_IS_NULL(s1) && STRING_IS_NULL(s2)))
        return 1;
    else if (STRING_IS_NULL(s2))
        return s1->strlen == 0;
    else if (STRING_IS_NULL(s1))
        return s2->strlen == 0;

   /* we don't care which is bigger */
    else if (s1->strlen != s2->strlen)
        return 0;
    else if ((s1->hashval != s2->hashval) && s1->hashval && s2->hashval)
        return 0;

    /* s2->strlen is the same here */
    else if (s1->strlen == 0)
        return 1;

    /* COWed strings */
    else if ((s1->strstart == s2->strstart) && (s1->bufused == s2->bufused))
        return 1;

    /*
     * now,
     * both strings are non-null
     * both strings have same length
     */
    return CHARSET_COMPARE(interp, s1, s2) == 0;
}


/*

=item C<STRING * Parrot_str_bitwise_and(PARROT_INTERP, const STRING *s1, const
STRING *s2)>

Performs a bitwise C<AND> on two Parrot strings, performing type and encoding
conversions if necessary. Returns the result as a new string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_and(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2))
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
    if (!STRING_IS_NULL(s1) && !STRING_IS_NULL(s2))
        minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
    else
        minlen = 0;

    res = Parrot_str_new_init(interp, NULL, minlen,
            Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (STRING_IS_NULL(s1) || STRING_IS_NULL(s2)) {
        res->bufused = 0;
        res->strlen  = 0;

        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_gc_mark_and_sweep(interp, GC_trace_stack_FLAG);
#endif

    { /* bitwise AND the strings */
        const Parrot_UInt1 *curr1 = (Parrot_UInt1 *)s1->strstart;
        const Parrot_UInt1 *curr2 = (Parrot_UInt1 *)s2->strstart;
        Parrot_UInt1       *dp    = (Parrot_UInt1 *)res->strstart;
        size_t              len   = minlen;

        while (len--)
            *dp++ = *curr1++ & *curr2++;
    }

    res->bufused = res->strlen = minlen;

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
    if (!STRING_IS_NULL(s1)) { \
        curr1   = (type1 *)(s1)->strstart; \
        length1 = (s1)->strlen; \
    } \
    if (!STRING_IS_NULL(s2)) { \
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
    if (!STRING_IS_NULL(s1)) { \
        curr1   = (type1 *)(s1)->strstart; \
        length1 = (s1)->strlen; \
    } \
    if (!STRING_IS_NULL(s2)) { \
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
STRING *s2)>

Performs a bitwise C<OR> on two Parrot strings, performing type and encoding
conversions if necessary.  Returns the result as a new string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_or(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_bitwise_or)
    STRING *res;
    size_t  maxlen = 0;

    if (!STRING_IS_NULL(s1)) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (!STRING_IS_NULL(s2)) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

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

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen);
    res->bufused = res->strlen = maxlen;

    return res;
}


/*

=item C<STRING * Parrot_str_bitwise_xor(PARROT_INTERP, const STRING *s1, const
STRING *s2)>

Performs a bitwise C<XOR> on two Parrot strings, performing type and encoding
conversions if necessary.  Returns the result as a new string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_xor(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1),
        ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_bitwise_xor)
    STRING *res;
    size_t  maxlen = 0;

    if (!STRING_IS_NULL(s1)) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (!STRING_IS_NULL(s2)) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

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

    BITWISE_XOR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen);
    res->bufused = res->strlen = maxlen;

    return res;
}


#define BITWISE_NOT_STRING(type, s, res) \
do { \
    if (!STRING_IS_NULL(s) && !STRING_IS_NULL(res)) { \
        const type   *curr   = (type *)(s)->strstart; \
        size_t        length = (s)->strlen; \
        Parrot_UInt1 *dp     = (Parrot_UInt1 *)(res)->strstart; \
 \
        for (; length ; --length, ++dp, ++curr) \
            *dp = 0xFF & ~ *curr; \
    } \
} while (0)


/*

=item C<STRING * Parrot_str_bitwise_not(PARROT_INTERP, const STRING *s)>

Performs a bitwise C<NOT> on a Parrot string.  Returns the result as a new
string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_bitwise_not(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_bitwise_not)
    STRING *res;
    size_t  len;

    if (!STRING_IS_NULL(s)) {
        if (s->encoding != Parrot_fixed_8_encoding_ptr)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_not (%s/%s) unsupported",
                s->encoding->name, s->encoding->name);

        len = s->bufused;
    }
    else
        len = 0;

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

    res->strlen = res->bufused = len;

    BITWISE_NOT_STRING(Parrot_UInt1, s, res);

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
    const INTVAL len = !STRING_IS_NULL(s) ? Parrot_str_length(interp, s) : 0;

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
    if (STRING_IS_NULL(s))
        return 0;
    else {
        const UINTVAL       max_safe  = -(UINTVAL)PARROT_INTVAL_MIN / 10;
        const UINTVAL       last_dig  = (-(UINTVAL)PARROT_INTVAL_MIN) % 10;
        int                 sign      = 1;
        UINTVAL             i         = 0;
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
                    const UINTVAL nextval = c - '0';
                    if (i < max_safe || (i == max_safe && nextval <= last_dig))
                        i = i * 10 + nextval;
                    else
                        Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_ERR_OVERFLOW,
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
                    const UINTVAL nextval = c - '0';
                    if (i < max_safe || (i == max_safe && nextval <= last_dig))
                        i = i * 10 + nextval;
                    else
                        Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_ERR_OVERFLOW,
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

        if (sign == 1 && i > (UINTVAL)PARROT_INTVAL_MAX)
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_ERR_OVERFLOW,
                    "Integer value of String '%S' too big", s);
        return sign == -1 ? -i : i;
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

    if (STRING_IS_NULL(s))
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
                ++d_length;
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
    /* charpos <= 2 because for "-i" iter already advanced to next char */
    if (check_nan && (iter.charpos <= 2)) {
        STRING *t = Parrot_str_upcase(interp, s);
        if (Parrot_str_equal(interp, t, CONST_STRING(interp, "NAN")))
            return PARROT_FLOATVAL_NAN_QUIET;
        else if (Parrot_str_equal(interp, t, CONST_STRING(interp, "INF"))
             ||  Parrot_str_equal(interp, t, CONST_STRING(interp, "INFINITY")))
            return PARROT_FLOATVAL_INF_POSITIVE;
        else if (Parrot_str_equal(interp, t, CONST_STRING(interp, "-INF"))
             ||  Parrot_str_equal(interp, t, CONST_STRING(interp, "-INFINITY")))
            return PARROT_FLOATVAL_INF_NEGATIVE;
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
C<Parrot_str_free_cstring()> to free the string. Failure to do this will result
in a memory leak.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char *
Parrot_str_to_cstring(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_cstring)

    if (STRING_IS_NULL(s)) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't convert NULL string");
    }

    return string_to_cstring_nullable(interp, s);
}


/*

=item C<char * string_to_cstring_nullable(PARROT_INTERP, const STRING *s)>

Returns a C string for the specified Parrot string. Use
C<Parrot_str_free_cstring()> to free the string, if it's not NULL. Failure to
do this will result in a memory leak.  Failure to check if the return value is
NULL will result in embarrassment for you.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CAN_RETURN_NULL
char *
string_to_cstring_nullable(SHIM_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(string_to_cstring_nullable)
    if (STRING_IS_NULL(s))
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
Parrot_str_pin(SHIM_INTERP, ARGMOD(STRING *s))
{
    ASSERT_ARGS(Parrot_str_pin)
    const size_t size = Buffer_buflen(s);
    char  *memory = (char *)mem_internal_allocate(size);

    mem_sys_memcopy(memory, Buffer_bufstart(s), size);
    Buffer_bufstart(s) = memory;
    s->strstart        = memory;

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
     * we just don't do this */
    if (!PObj_sysmem_TEST(s))
        return;

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

    if (STRING_IS_NULL(s) || !s->strlen)
        return hashval;

    if (s->encoding->hash)
        hashval = ENCODING_HASH(interp, s, hashval);
    else {
        /* ZZZZZ workaround for something not setting up encodings right */
        ASSERT_STRING_SANITY(s);

        ENCODING_ITER_INIT(interp, s, &iter);

        for (offs = 0; offs < s->strlen; ++offs) {
            const UINTVAL c = iter.get_and_advance(interp, &iter);
            hashval += hashval << 5;
            hashval += c;
        }
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

    if (STRING_IS_NULL(src))
        return STRINGNULL;

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

        result = Parrot_str_concat(interp, result, hex);

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

=item C<static void throw_illegal_escape(PARROT_INTERP)>

Helper function to avoid repeated throw calls.

=cut

*/

PARROT_DOES_NOT_RETURN
PARROT_COLD
static void
throw_illegal_escape(PARROT_INTERP)
{
    ASSERT_ARGS(throw_illegal_escape)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
            "Illegal escape sequence");
}

/*

=item C<STRING * Parrot_str_unescape_string(PARROT_INTERP, const STRING *src,
const CHARSET *charset, const ENCODING *encoding, UINTVAL flags)>

EXPERIMENTAL, see TT #1628

Unescapes the src string returnning a new string with the charset
and encoding specified.


=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_unescape_string(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const CHARSET *charset),
        ARGIN(const ENCODING *encoding),
        UINTVAL flags)
{
    ASSERT_ARGS(Parrot_str_unescape_string)

    UINTVAL srclen = Parrot_str_byte_length(interp, src);
    STRING *result = Parrot_gc_new_string_header(interp, flags);
    String_iter itersrc;
    String_iter iterdest;
    UINTVAL reserved;
    int digcount;
    char digbuf[9];
    int pending;

    result->charset = charset;
    result->encoding = encoding;
    reserved = string_max_bytes(interp, result, srclen);
    Parrot_gc_allocate_string_storage(interp, result, reserved);
    result->bufused = reserved;
    result->extra = NULL;

    src->encoding->iter_init(interp, src, &itersrc);
    encoding->iter_init(interp, result, &iterdest);
    while (itersrc.bytepos < srclen) {
        INTVAL c = itersrc.get_and_advance(interp, &itersrc);
        INTVAL next;

        do {
            pending = 0;
            next = c;
            if (c == '\\') {
                c = itersrc.get_and_advance(interp, &itersrc);
                switch (c) {
                /* Common one char sequences */
                case 'a': next = '\a'; break;
                case 'b': next = '\b'; break;
                case 't': next = '\t'; break;
                case 'n': next = '\n'; break;
                case 'v': next = '\v'; break;
                case 'f': next = '\f'; break;
                case 'r': next = '\r'; break;
                case 'e': next = '\e'; break;
                /* Escape character */
                case 'c':
                    c = itersrc.get_and_advance(interp, &itersrc);
                    /* This assumes ascii-alike encoding */
                    if (c < 'A' || c > 'Z')
                        throw_illegal_escape(interp);
                    next = c - 'A' + 1;
                    break;
                case 'x':
                    digcount = 0;
                    c = itersrc.get_and_advance(interp, &itersrc);
                    if (c == '{') {
                        /* \x{h..h} 1..8 hex digits */
                        while (itersrc.bytepos < srclen) {
                            c = itersrc.get_and_advance(interp, &itersrc);
                            if (c == '}')
                                break;
                            if (!isxdigit(c))
                                throw_illegal_escape(interp);
                            if (digcount == 8)
                                break;
                            digbuf[digcount++] = c;
                        }
                        if (c != '}')
                            throw_illegal_escape(interp);
                    }
                    else {
                        /* \xhh 1..2 hex digits */
                        pending = 1;
                        for (digcount = 0; digcount < 2;) {
                            if (!isxdigit(c))
                                break;
                            digbuf[digcount] = c;
                            ++digcount;
                            if (itersrc.bytepos >= srclen) {
                                pending = 0;
                                break;
                            }
                            c = itersrc.get_and_advance(interp, &itersrc);
                        }
                    }
                    if (digcount == 0)
                        throw_illegal_escape(interp);
                    digbuf[digcount] = '\0';
                    next = strtol(digbuf, NULL, 16);
                    break;
                case 'u':
                    /* \uhhhh 4 hex digits */
                    for (digcount = 0; digcount < 4; ++digcount) {
                        c = itersrc.get_and_advance(interp, &itersrc);
                        if (!isxdigit(c))
                            throw_illegal_escape(interp);
                        digbuf[digcount] = c;
                    }
                    digbuf[digcount] = '\0';
                    next = strtol(digbuf, NULL, 16);
                    break;
                case 'U':
                    /* \Uhhhhhhhh 8 hex digits */
                    for (digcount = 0; digcount < 8; ++digcount) {
                        c = itersrc.get_and_advance(interp, &itersrc);
                        if (!isxdigit(c))
                            throw_illegal_escape(interp);
                        digbuf[digcount] = c;
                    }
                    digbuf[digcount] = '\0';
                    next = strtol(digbuf, NULL, 16);
                    break;
                case '0': case '1': case '2': case '3':
                case '4': case '5': case '6': case '7':
                    /* \ooo 1..3 oct digits */
                    digbuf[0] = c;
                    for (digcount = 1; digcount < 3; ++digcount) {
                        c = itersrc.get_and_advance(interp, &itersrc);
                        if (c < '0' || c > '7')
                            break;
                        digbuf[digcount] = c;
                    }
                    digbuf[digcount] = '\0';
                    next = strtol(digbuf, NULL, 8);
                    if (digcount < 3)
                        pending = 1;
                    break;
                default:
                    next = c;
                }
            }
            iterdest.set_and_advance(interp, &iterdest, next);
        } while (pending);
    }
    result->bufused = iterdest.bytepos;
    result->strlen = iterdest.charpos;
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
            ++(iter.bytepos);
            ++(iter.charpos);
            continue;
        }

        PARROT_ASSERT(d < offs);
        iter.set_and_advance(interp, &iter, r);
        ++d;
    }

    result->strlen  = d;
    result->bufused = iter.bytepos;

    /* Force validating the string */
    if (encoding != result->encoding)
        result->strlen = CHARSET_CODEPOINTS(interp, result);

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
    if (STRING_IS_NULL(s))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't upcase NULL string");
    else {
        STRING * const res = CHARSET_UPCASE(interp, s);
        res->hashval = 0;
        return res;
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

    if (STRING_IS_NULL(s))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't downcase NULL string");
    else {
        STRING * const res = CHARSET_DOWNCASE(interp, s);
        res->hashval = 0;
        return res;
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

    if (STRING_IS_NULL(s))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't titlecase NULL string");
    else {
        STRING * const res = CHARSET_TITLECASE(interp, s);
        res->hashval = 0;
        return res;
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

    if (Parrot_str_length(interp, s) != 1)
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

=item C<const char * Parrot_str_cstring(PARROT_INTERP, const STRING *str)>

Returns a C string from a Parrot string.  Both sides are treated
as constants -- i.e. do not resize the result.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
const char *
Parrot_str_cstring(SHIM_INTERP, ARGIN(const STRING *str))
{
    ASSERT_ARGS(Parrot_str_cstring)
    /* TODO handle NULL and friends */
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

=item C<INTVAL Parrot_str_find_cclass(PARROT_INTERP, INTVAL flags, const STRING
*s, UINTVAL offset, UINTVAL count)>

Finds the first occurrence of the given character class in C<flags> in the
string, and returns its glyph-wise index.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_find_cclass(PARROT_INTERP, INTVAL flags, ARGIN_NULLOK(const STRING *s),
                          UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(Parrot_str_find_cclass)

    if (STRING_IS_NULL(s))
        return -1;

    return CHARSET_FIND_CCLASS(interp, flags, s, offset, count);
}


/*

=item C<INTVAL Parrot_str_find_not_cclass(PARROT_INTERP, INTVAL flags, const
STRING *s, UINTVAL offset, UINTVAL count)>

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
    ARGIN_NULLOK(const STRING *s), UINTVAL offset, UINTVAL count)
{
    ASSERT_ARGS(Parrot_str_find_not_cclass)

    if (STRING_IS_NULL(s))
        return -1;

    return CHARSET_FIND_NOT_CCLASS(interp, flags, s, offset, count);
}


/*

=item C<STRING* Parrot_str_change_charset(PARROT_INTERP, STRING *src, INTVAL
charset_nr)>

Converts C<src> to the given charset or encoding and returns the result as a
new string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_str_change_charset(PARROT_INTERP, ARGMOD_NULLOK(STRING *src),
        INTVAL charset_nr)
{
    ASSERT_ARGS(Parrot_str_change_charset)
    const CHARSET *new_charset;

    if (STRING_IS_NULL(src))
        return STRINGNULL;

    new_charset = Parrot_get_charset(interp, charset_nr);

    if (!new_charset)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARTYPE,
                "charset #%d not found", (int) charset_nr);

    if (new_charset == src->charset)
        return src;

    return new_charset->to_charset(interp, src);
}


/*

=item C<STRING* Parrot_str_change_encoding(PARROT_INTERP, STRING *src, INTVAL
encoding_nr)>

Converts C<src> to the given charset or encoding and returns the result as a
new string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING*
Parrot_str_change_encoding(PARROT_INTERP, ARGMOD_NULLOK(STRING *src),
        INTVAL encoding_nr)
{
    ASSERT_ARGS(Parrot_str_change_encoding)
    const ENCODING *new_encoding;

    if (STRING_IS_NULL(src))
        return STRINGNULL;

    new_encoding = Parrot_get_encoding(interp, encoding_nr);

    if (!new_encoding)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_CHARTYPE,
            "encoding #%d not found", (int) encoding_nr);

    if (new_encoding == src->encoding)
        return src;

    return new_encoding->to_encoding(interp, src);
}


/*

=item C<STRING * Parrot_str_compose(PARROT_INTERP, const STRING *src)>

Normalizes the string.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_str_compose(PARROT_INTERP, ARGIN_NULLOK(const STRING *src))
{
    ASSERT_ARGS(Parrot_str_compose)

    if (STRING_IS_NULL(src))
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
    STRING  **chunks;
    STRING   *res;
    STRING   *s;
    char     *pos;
    const int ar_len       = VTABLE_elements(interp, ar);
    int       total_length = 0;
    int       transcoded   = 0;
    int       i;

    if (ar_len == 0)
        return Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

    if (STRING_IS_NULL(j))
        j = Parrot_str_new_noinit(interp, enum_stringrep_one, 0);

    chunks = (STRING **)Parrot_gc_allocate_fixed_size_storage(interp,
        ar_len * sizeof (STRING *));

    for (i = 0; i < ar_len; ++i) {
        STRING *next = VTABLE_get_string_keyed_int(interp, ar, i);

        if (STRING_IS_NULL(next)) {
            chunks[i] = STRINGNULL;
            continue;
        }

        if (next->encoding != j->encoding) {
            const ENCODING *e = j->encoding;

            string_rep_compatible(interp, next, j, &e);
            if (e == Parrot_fixed_8_encoding_ptr)
                e = Parrot_utf8_encoding_ptr;
            j           = e->to_encoding(interp, j);
            transcoded  = 1;
        }

        chunks[i]     = next;
        total_length += next->bufused;
    }

    /* with the right charset, transcode any strings if necessary */
    if (transcoded) {
        const CHARSET  *c = j->charset;
        const ENCODING *e = j->encoding;

        for (i = 0; i < ar_len; ++i) {
            STRING *s = chunks[i];

            if (STRING_IS_NULL(s))
                continue;

            if (s->encoding != e || s->charset != c) {
                STRING *new_s = e->to_encoding(interp, s);
                chunks[i]     = new_s;
                total_length += s->bufused - new_s->bufused;
            }
        }
    }

    /* add the length of the separator, now that it's transcoded */
    total_length += j->bufused * ar_len;

    res = Parrot_gc_new_string_header(interp, 0);
    Parrot_gc_allocate_string_storage(interp, res, total_length);

    res->charset  = j->charset;
    res->encoding = j->encoding;
    res->extra    = NULL;

    /* Iterate over chunks and append it to res */
    pos = res->strstart;

    /* Copy first chunk */
    s = chunks[0];
    if (!STRING_IS_NULL(s)) {
        mem_sys_memcopy(pos, s->strstart, s->bufused);
        pos += s->bufused;
        res->extra = s->extra;
    }

    for (i = 1; i < ar_len; ++i) {
        STRING *next = chunks[i];

        if (STRING_IS_NULL(next))
            continue;

        mem_sys_memcopy(pos, j->strstart, j->bufused);
        pos += j->bufused;

        mem_sys_memcopy(pos, next->strstart, next->bufused);
        pos += next->bufused;

        // TODO: Merge grapheme tables as we go. If it's needed.

        /* We can consume all buffer and pos will be next-after-end of buffer */
        PARROT_ASSERT(pos <= res->strstart + Buffer_buflen(res) + 1);
    }

    res->bufused  = pos - res->strstart;
    res->strlen = CHARSET_CODEPOINTS(interp, res);

    Parrot_gc_free_fixed_size_storage(interp, ar_len * sizeof (STRING *),
        chunks);

    return res;
}


/*

=item C<PMC* Parrot_str_split(PARROT_INTERP, const STRING *delim, STRING *str)>

Splits the string C<str> at the delimiter C<delim>, returning a
C<ResizableStringArray>, or his mapped type in the current HLL, of results.
Returns PMCNULL if the string or the delimiter is NULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_str_split(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *delim), ARGIN_NULLOK(STRING *str))
{
    ASSERT_ARGS(Parrot_str_split)
    PMC    *res;
    INTVAL  slen, dlen, ps, pe;

    if (STRING_IS_NULL(delim) || STRING_IS_NULL(str))
        return PMCNULL;

    res  = Parrot_pmc_new(interp,
            Parrot_get_ctx_HLL_type(interp, enum_class_ResizableStringArray));
    slen = Parrot_str_length(interp, str);

    if (!slen)
        return res;

    dlen = Parrot_str_length(interp, delim);

    if (dlen == 0) {
        int i;
        VTABLE_set_integer_native(interp, res, slen);

        for (i = 0; i < slen; ++i) {
            STRING * const p = Parrot_str_substr(interp, str, i, 1);
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
        STRING * const tstr = Parrot_str_substr(interp, str, ps, pl);

        VTABLE_push_string(interp, res, tstr);
        ps = pe + Parrot_str_length(interp, delim);

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

        if (cur < 10)
            *--p = (char)('0' + cur);
        else
            *--p = (char)('a' + cur - 10);

    } while (num /= base);

    if (minus)
        *--p = '-';

    return string_make(interp, p, (UINTVAL)(tail - p), NULL, 0);
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
