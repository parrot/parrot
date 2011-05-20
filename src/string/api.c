/*
Copyright (C) 2001-2011, Parrot Foundation.

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

#include <stdio.h>

#include "parrot/parrot.h"
#include "private_cstring.h"
#include "api.str"

/* for parrot/interpreter.h */
STRING *STRINGNULL;

#define nonnull_encoding_name(s) (s) ? (s)->encoding->name : "null string"
#define ASSERT_STRING_SANITY(s) \
    PARROT_ASSERT((s)->encoding); \
    PARROT_ASSERT(!PObj_on_free_list_TEST(s))

/* HEADERIZER HFILE: include/parrot/string_funcs.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static INTVAL string_max_bytes(PARROT_INTERP,
    ARGIN(const STRING *s),
    UINTVAL nchars)
        __attribute__nonnull__(2);

PARROT_INLINE
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PARROT_PURE_FUNCTION
static const STR_VTABLE * string_rep_compatible(
    ARGIN(const STRING *a),
    ARGIN(const STRING *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_DOES_NOT_RETURN
PARROT_COLD
static void throw_illegal_escape(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_string_max_bytes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_string_rep_compatible __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
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
        interp->hash_seed = Parrot_get_entropy(interp);
    }

    /* initialize the constant string table */
    if (interp->parent_interpreter) {
        interp->const_cstring_table =
            interp->parent_interpreter->const_cstring_table;
        interp->const_cstring_hash  =
            interp->parent_interpreter->const_cstring_hash;
        return;
    }

    /* Set up the cstring cache, then load the basic encodings */
    const_cstring_hash          = Parrot_hash_create_sized(interp,
                                        enum_type_PMC,
                                        Hash_key_type_cstring,
                                        n_parrot_cstrings);
    interp->const_cstring_hash  = const_cstring_hash;
    Parrot_encodings_init(interp);

    /* initialize STRINGNULL, but not in the constant table */
    STRINGNULL = Parrot_str_new_init(interp, NULL, 0,
                       Parrot_null_encoding_ptr,
                       PObj_constant_FLAG);

    interp->const_cstring_table =
        mem_gc_allocate_n_zeroed_typed(interp, n_parrot_cstrings, STRING *);

    for (i = 0; i < n_parrot_cstrings; ++i) {
        DECL_CONST_CAST;
        STRING * const s =
            Parrot_str_new_init(interp,
                parrot_cstrings[i].string,
                parrot_cstrings[i].len,
                Parrot_default_encoding_ptr,
                PObj_external_FLAG|PObj_constant_FLAG);
        Parrot_hash_put(interp, const_cstring_hash,
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
        Parrot_deinit_encodings(interp);
        Parrot_hash_destroy(interp, interp->const_cstring_hash);
    }
}


/*

=item C<STRING * Parrot_str_new_noinit(PARROT_INTERP, UINTVAL capacity)>

Creates and returns an empty Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_noinit(PARROT_INTERP, UINTVAL capacity)
{
    ASSERT_ARGS(Parrot_str_new_noinit)
    STRING * const s = Parrot_gc_new_string_header(interp, 0);

    s->encoding = Parrot_default_encoding_ptr;

    Parrot_gc_allocate_string_storage(interp, s,
        (size_t)string_max_bytes(interp, s, capacity));

    return s;
}


/*

=item C<static const STR_VTABLE * string_rep_compatible(const STRING *a, const
STRING *b)>

Find the "lowest" possible encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returns NULL, if no compatible string representation can be found.

=cut

*/

PARROT_INLINE
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PARROT_PURE_FUNCTION
static const STR_VTABLE *
string_rep_compatible(ARGIN(const STRING *a), ARGIN(const STRING *b))
{
    ASSERT_ARGS(string_rep_compatible)

    PARROT_ASSERT(a->encoding && b->encoding);

    if (a->encoding == b->encoding)
        return a->encoding;

    /* a table could possibly simplify the logic */

    if (STRING_max_bytes_per_codepoint(a) == 1
    &&  STRING_max_bytes_per_codepoint(b) == 1) {
        /* Return the "largest" encoding where ascii < latin1 < binary */

        if (b->encoding == Parrot_ascii_encoding_ptr)
            return a->encoding;
        if (a->encoding == Parrot_ascii_encoding_ptr)
            return b->encoding;
        if (a->encoding == Parrot_binary_encoding_ptr)
            return a->encoding;
        if (b->encoding == Parrot_binary_encoding_ptr)
            return b->encoding;
    }
    else {
        /* UTF-8 strings are ASCII compatible if their byte length equals
           their codepoint length. This is a nice trick but it can cause many
           surprises when UTF-8 strings are suddenly "downgraded" to ASCII
           strings. */

        if (a->encoding == Parrot_utf8_encoding_ptr
        &&  b->encoding == Parrot_ascii_encoding_ptr) {
            if (a->strlen == a->bufused) {
                return b->encoding;
            }
            return a->encoding;
        }

        if (b->encoding == Parrot_utf8_encoding_ptr
        &&  a->encoding == Parrot_ascii_encoding_ptr) {
            if (b->strlen == b->bufused) {
                return a->encoding;
            }
            return b->encoding;
        }
    }

    return NULL;
}

/*

=item C<const STR_VTABLE * Parrot_str_rep_compatible(PARROT_INTERP, const STRING
*a, const STRING *b)>

Find the "lowest" possible encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returns NULL, if no compatible string representation can be found.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PARROT_PURE_FUNCTION
const STR_VTABLE *
Parrot_str_rep_compatible(SHIM_INTERP, ARGIN(const STRING *a), ARGIN(const STRING *b))
{
    ASSERT_ARGS(Parrot_str_rep_compatible)
    return string_rep_compatible(a, b);
}

/*

=item C<STRING * Parrot_str_clone(PARROT_INTERP, const STRING *s)>

Helper function to clone string.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_clone(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_clone)
    size_t  alloc_size;
    STRING *result;

    if (STRING_IS_NULL(s))
        return STRINGNULL;

    result     = Parrot_gc_new_string_header(interp, 0);
    alloc_size = s->bufused;

    if (alloc_size) {
        /* Allocate new chunk of memory */
        Parrot_gc_allocate_string_storage(interp, result, alloc_size);

        /* and copy it over */
        mem_sys_memcopy(result->strstart, s->strstart, alloc_size);
    }

    result->bufused  = alloc_size;
    result->strlen   = s->strlen;
    result->hashval  = s->hashval;
    result->encoding = s->encoding;

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
Parrot_str_copy(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_copy)
    STRING *d;
    int     is_movable;

    if (STRING_IS_NULL(s))
        return STRINGNULL;

    d = Parrot_gc_new_string_header(interp,
        PObj_get_FLAGS(s) & ~PObj_constant_FLAG);

    /* This might set the constant flag again but it is the right thing
     * to do */
    STRUCT_COPY(d, s);

    /*
     * FIXME. It's abstraction leak here from GC.
     * Basically if we are copying string from older generation
     * we have to clear flags about it.
     */
    d->flags &= ~PObj_GC_all_generation_FLAGS;

    /* Clear live flag. It might be set on constant strings */
    PObj_live_CLEAR(d);

    /* Set the string copy flag */
    PObj_is_string_copy_SET(d);

    is_movable = PObj_is_movable_TESTALL(s);

    /* Now check that buffer allocated from pool and affected by compacting */
    if (is_movable && Buffer_bufstart(s)) {
        /* If so, mark it as shared */
        INTVAL * const buffer_flags = Buffer_bufflagsptr(d);
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
    const STR_VTABLE *enc;
    STRING           *dest;
    UINTVAL           total_length;

    if (STRING_IS_NULL(a) && STRING_IS_NULL(b))
        return STRINGNULL;

    if (STRING_length(a) == 0) {
        if (STRING_length(b) == 0)
            return CONST_STRING(interp, "");
        else
            return Parrot_str_copy(interp, b);
    }
    else {
        if (STRING_length(b) == 0)
            return Parrot_str_copy(interp, a);
    }

    ASSERT_STRING_SANITY(a);
    ASSERT_STRING_SANITY(b);

    enc = string_rep_compatible(a, b);

    if (!enc) {
        /* upgrade strings for concatenation */
        if (a->encoding == Parrot_ucs4_encoding_ptr
            || b->encoding == Parrot_ucs4_encoding_ptr)
            enc = Parrot_ucs4_encoding_ptr;
        else if (a->encoding == Parrot_utf16_encoding_ptr
            ||  b->encoding == Parrot_utf16_encoding_ptr
            ||  a->encoding == Parrot_ucs2_encoding_ptr
            ||  b->encoding == Parrot_ucs2_encoding_ptr)
            enc = Parrot_utf16_encoding_ptr;
        else
            enc = Parrot_utf8_encoding_ptr;

        a = enc->to_encoding(interp, a);
        b = enc->to_encoding(interp, b);
    }
    /* calc usable and total bytes */
    total_length = a->bufused + b->bufused;

    if (PObj_is_growable_TESTALL(a)
    &&  a->strstart + total_length <=
        (char *)Buffer_bufstart(a) + Buffer_buflen(a)) {
        /* String a is growable and there's enough space in the buffer */
        DECL_CONST_CAST;

        dest = Parrot_str_copy(interp, a);

        /* Switch string copy flags */
        PObj_is_string_copy_SET(PARROT_const_cast(STRING *, a));
        PObj_is_string_copy_CLEAR(dest);

        /* Append b */
        mem_sys_memcopy(dest->strstart + dest->bufused,
                b->strstart, b->bufused);

        dest->encoding = enc;
        dest->hashval = 0;
    }
    else {
        if (4 * b->bufused < a->bufused) {
            /* Preallocate more memory if we're appending a short string to
               a long string */
            total_length += total_length >> 1;
        }

        dest = Parrot_str_new_noinit(interp, total_length);
        PARROT_ASSERT(enc);
        dest->encoding = enc;

        /* Copy A first */
        mem_sys_memcopy(dest->strstart, a->strstart, a->bufused);

        /* Tack B on the end of A */
        mem_sys_memcopy((void *)((ptrcast_t)dest->strstart + a->bufused),
                b->strstart, b->bufused);
    }

    dest->bufused = a->bufused + b->bufused;
    dest->strlen  = a->strlen + b->strlen;

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
        Parrot_default_encoding_ptr, 0);
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
    result->encoding        = Parrot_binary_encoding_ptr;

    Buffer_buflen(buffer)   = 0;
    Buffer_bufstart(buffer) = NULL;

    return result;
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
    STRING *s                    = (STRING *)Parrot_hash_get(interp,
                                        cstring_cache, buffer);

    if (s)
        return s;

    s = Parrot_str_new_init(interp, buffer, strlen(buffer),
                       Parrot_default_encoding_ptr,
                       PObj_external_FLAG|PObj_constant_FLAG);

    Parrot_hash_put(interp, cstring_cache,
        PARROT_const_cast(char *, buffer), (void *)s);

    return s;
}


/*

=item C<STRING * Parrot_str_new_init(PARROT_INTERP, const char *buffer, UINTVAL
len, const STR_VTABLE *encoding, UINTVAL flags)>

Given a buffer, its length, an encoding, a character set, and STRING flags,
creates and returns a new string. If buffer is NULL and len >= 0, allocates
len bytes.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_new_init(PARROT_INTERP, ARGIN_NULLOK(const char *buffer), UINTVAL len,
        ARGIN(const STR_VTABLE *encoding), UINTVAL flags)
{
    ASSERT_ARGS(Parrot_str_new_init)
    DECL_CONST_CAST;
    STRING * const s = Parrot_gc_new_string_header(interp, flags);
    s->encoding      = encoding;

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

        STRING_scan(interp, s);

        return s;
    }

    Parrot_gc_allocate_string_storage(interp, s, len);

    if (buffer && len) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
        STRING_scan(interp, s);
    }
    else
        s->strlen = s->bufused = 0;

    return s;
}


/*

=item C<STRING * Parrot_str_from_platform_cstring(PARROT_INTERP, const char *c)>

Convert a C string, encoded in the platform's assumed encoding, to a Parrot
string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_from_platform_cstring(PARROT_INTERP, ARGIN_NULLOK(const char *c))
{
    ASSERT_ARGS(Parrot_str_from_platform_cstring)
    if (!c)
        return STRINGNULL;
    else {
        STRING *retv;
        Parrot_runloop jmp;

        if (setjmp(jmp.resume)) {
            /* catch */
            Parrot_cx_delete_handler_local(interp, STRINGNULL);
            retv =  Parrot_str_new_init(interp, c, strlen(c),
                                        Parrot_binary_encoding_ptr, 0);
        }
        else {
            /* try */
            Parrot_ex_add_c_handler(interp, &jmp);
            retv = Parrot_str_new_init(interp, c, Parrot_str_platform_strlen(interp, c),
                                        Parrot_platform_encoding_ptr, 0);
            Parrot_cx_delete_handler_local(interp, STRINGNULL);
        }

        return retv;
    }
}


/*

=item C<char * Parrot_str_to_platform_cstring(PARROT_INTERP, const STRING *s)>

Obtain a C string, encoded in the platform's assumed encoding, from a Parrot
string.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
char *
Parrot_str_to_platform_cstring(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_platform_cstring)
    if (STRING_IS_NULL(s)) {
        return NULL;
    }
    else {
        return Parrot_str_to_encoded_cstring(interp, s, Parrot_platform_encoding_ptr);
    }
}


/*

=item C<STRING * Parrot_str_extract_chars(PARROT_INTERP, const char *buffer,
UINTVAL len, INTVAL chars, const STR_VTABLE *encoding)>

Extracts C<chars> characters from C<buffer> containing C<len> bytes.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_extract_chars(PARROT_INTERP, ARGIN(const char *buffer),
        UINTVAL len, INTVAL chars, ARGIN(const STR_VTABLE *encoding))
{
    ASSERT_ARGS(Parrot_str_extract_chars)
    Parrot_String_Bounds  bounds;
    STRING               *result;

    bounds.bytes = len;
    bounds.chars = chars;
    bounds.delim = -1;

    encoding->partial_scan(interp, buffer, &bounds);

    if (bounds.chars < chars)
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_OUT_OF_BOUNDS,
                "extract_chars: index out of bounds");

    result = Parrot_str_new_noinit(interp, bounds.bytes);

    result->encoding = encoding;
    result->bufused  = bounds.bytes;
    result->strlen   = bounds.chars;

    memcpy(result->strstart, buffer, bounds.bytes);

    return result;
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

=item C<INTVAL Parrot_str_indexed(PARROT_INTERP, const STRING *s, INTVAL idx)>

Returns the codepoint at a given index into a string. Negative indexes are
treated as counting from the end of the string. Throws an exception if C<s>
is null or C<idx> is out of bounds.

Identical to the STRING_ord macro.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_indexed(PARROT_INTERP, ARGIN(const STRING *s), INTVAL idx)
{
    ASSERT_ARGS(Parrot_str_indexed)

    if (s == NULL)
        s = STRINGNULL;

    return STRING_ord(interp, s, idx);
}


/*

=item C<INTVAL Parrot_str_find_index(PARROT_INTERP, const STRING *src, const
STRING *search, INTVAL start)>

Returns the character position of the second Parrot string in the first at or
after C<start>. The return value is a (0 based) offset in characters, not
bytes. If the search string is not found in the first string or it is null or
empty, returns -1. If C<start> is out of bounds, returns -1. Throws an
exception if C<src> is null.

Identical to the STRING_index macro.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_find_index(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STRING *search), INTVAL start)
{
    ASSERT_ARGS(Parrot_str_find_index)

    if (src == NULL)
        src = STRINGNULL;

    return STRING_index(interp, src, search, start);
}


/*

=item C<STRING * Parrot_str_chr(PARROT_INTERP, UINTVAL character)>

Returns a single-character Parrot string.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_chr(PARROT_INTERP, UINTVAL character)
{
    ASSERT_ARGS(Parrot_str_chr)

    if (character > 0xff)
        return Parrot_utf8_encoding_ptr->chr(interp, character);
    else if (character > 0x7f)
        return Parrot_latin1_encoding_ptr->chr(interp, character);
    else
        return Parrot_ascii_encoding_ptr->chr(interp, character);
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

=item C<static INTVAL string_max_bytes(PARROT_INTERP, const STRING *s, UINTVAL
nchars)>

Returns the number of bytes required to safely contain the specified number
of characters in the specified Parrot string's representation.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static INTVAL
string_max_bytes(SHIM_INTERP, ARGIN(const STRING *s), UINTVAL nchars)
{
    ASSERT_ARGS(string_max_bytes)
    PARROT_ASSERT(s->encoding);
    return STRING_max_bytes_per_codepoint(s) * nchars;
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
                        s->encoding, 0);
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
Parrot string. If C<offset> is negative, it counts from the end of the
string. Returns the empty string if C<offset> equals the length of the
string. Throws an exception if C<src> is null or C<offset> is out of bounds.
Truncates C<length> if it extends beyond the end of the string.

Identical to the STRING_substr macro.

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

    if (src == NULL)
        src = STRINGNULL;

    return STRING_substr(interp, src, offset, length);
}

/*

=item C<STRING * Parrot_str_iter_substr(PARROT_INTERP, const STRING *str, const
String_iter *l, const String_iter *r)>

Returns the substring between iterators C<l> and C<r>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_iter_substr(PARROT_INTERP,
    ARGIN(const STRING *str),
    ARGIN(const String_iter *l), ARGIN_NULLOK(const String_iter *r))
{
    ASSERT_ARGS(Parrot_str_iter_substr)
    STRING * const dest = Parrot_str_copy(interp, str);

    dest->strstart = (char *)dest->strstart + l->bytepos;

    if (r == NULL) {
        dest->bufused = str->bufused - l->bytepos;
        dest->strlen  = str->strlen  - l->charpos;
    }
    else {
        dest->bufused = r->bytepos - l->bytepos;
        dest->strlen  = r->charpos - l->charpos;
    }

    dest->hashval = 0;

    return dest;
}

/*

=item C<INTVAL Parrot_str_iter_index(PARROT_INTERP, const STRING *src,
String_iter *start, String_iter *end, const STRING *search)>

Find the next occurrence of STRING C<search> in STRING C<src> starting at
String_iter C<start>. If C<search> is found C<start> is modified to mark the
beginning of C<search> and String_iter C<end> is set to the character after
C<search> in C<src>.  Returns the character position where C<search> was found
or -1 if it wasn't found.

=cut

*/

INTVAL
Parrot_str_iter_index(PARROT_INTERP,
    ARGIN(const STRING *src),
    ARGMOD(String_iter *start), ARGOUT(String_iter *end),
    ARGIN(const STRING *search))
{
    ASSERT_ARGS(Parrot_str_iter_index)
    String_iter search_iter, search_start, next_start;
    const UINTVAL len = search->strlen;
    UINTVAL c0;

    if (len == 0) {
        *end = *start;
        return start->charpos;
    }

    STRING_ITER_INIT(interp, &search_iter);
    c0 = STRING_iter_get_and_advance(interp, search, &search_iter);
    search_start = search_iter;
    next_start = *start;

    while (start->charpos + len <= src->strlen) {
        UINTVAL c1 = STRING_iter_get_and_advance(interp, src, &next_start);

        if (c1 == c0) {
            UINTVAL c2;
            *end = next_start;

            do {
                if (search_iter.charpos >= len)
                    return start->charpos;
                c1 = STRING_iter_get_and_advance(interp, src, end);
                c2 = STRING_iter_get_and_advance(interp, search, &search_iter);
            } while (c1 == c2);

            search_iter = search_start;
        }

        *start = next_start;
    }

    return -1;
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
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
STRING *
Parrot_str_replace(PARROT_INTERP, ARGIN(const STRING *src),
    INTVAL offset, INTVAL length, ARGIN(const STRING *rep))
{
    ASSERT_ARGS(Parrot_str_replace)
    String_iter       iter;
    const STR_VTABLE *enc;
    STRING           *dest        = NULL;
    UINTVAL           true_offset = (UINTVAL)offset;
    UINTVAL           true_length = (UINTVAL)length;

    UINTVAL         start_byte, end_byte, start_char, end_char;
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

    if (STRING_IS_NULL(rep)) {
        enc = src->encoding;
    }
    else {
        /* may have different reps..... */
        enc = string_rep_compatible(src, rep);

        if (!enc) {
            if (src->encoding != Parrot_utf8_encoding_ptr)
                src = Parrot_utf8_encoding_ptr->to_encoding(interp, src);
            if (rep->encoding != Parrot_utf8_encoding_ptr)
                rep = Parrot_utf8_encoding_ptr->to_encoding(interp, rep);
            /* Remember selected encoding */
            enc = src->encoding;
        }
    }

    /* get byte position of the part that will be replaced */
    STRING_ITER_INIT(interp, &iter);

    STRING_iter_skip(interp, src, &iter, true_offset);
    start_byte = iter.bytepos;
    start_char = iter.charpos;

    STRING_iter_skip(interp, src, &iter, true_length);
    end_byte   = iter.bytepos;
    end_char   = iter.charpos;

    /* not possible.... */
    if (end_byte < start_byte)
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_SUBSTR_OUT_OF_STRING,
            "replace: subend somehow is less than substart");

    /* Now do the replacement */
    dest = Parrot_gc_new_string_header(interp, 0);

    /* Set encoding to compatible */
    dest->encoding = enc;

    /* Clear COW flag. We own buffer */
    PObj_get_FLAGS(dest) = PObj_is_string_FLAG
                         | PObj_is_COWable_FLAG;

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

    dest->strlen  = src->strlen - (end_char - start_char) + rep->strlen;
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
    INTVAL end = -n;

    if (n >= 0)
        end += STRING_length(s);

    return STRING_substr(interp, s, 0, end);
}


/*

=item C<INTVAL Parrot_str_compare(PARROT_INTERP, const STRING *s1, const STRING
*s2)>

Compares two strings to each other.  If s1 is less than s2, returns -1.  If the
strings are equal, returns 0.  If s1 is greater than s2, returns 2.  This
comparison uses the character set collation order of the strings for
comparison. The null string is considered equal to the empty string.

Identical to the STRING_compare macro.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_compare(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1), ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_compare)

    if (s1 == NULL)
        s1 = STRINGNULL;

    return STRING_compare(interp, s1, s2);
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

    if (s1 == NULL)
        s1 = STRINGNULL;

    return !STRING_equal(interp, s1, s2);
}


/*

=item C<INTVAL Parrot_str_equal(PARROT_INTERP, const STRING *s1, const STRING
*s2)>

Compares two Parrot strings, performing type and encoding conversions if
necessary. The null string is considered equal to the empty string.

Returns 1 if the strings are equal, and 0 otherwise.

Identical to the STRING_equal macro.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_str_equal(PARROT_INTERP, ARGIN_NULLOK(const STRING *s1), ARGIN_NULLOK(const STRING *s2))
{
    ASSERT_ARGS(Parrot_str_equal)

    if (s1 == NULL)
        s1 = STRINGNULL;

    return STRING_equal(interp, s1, s2);
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

    /* we could also trans_encoding to iso-8859-1 */
    if (s1 && STRING_max_bytes_per_codepoint(s1) != 1)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "string bitwise_and (%s/%s) unsupported",
            s1->encoding->name, nonnull_encoding_name(s2));

    if (s2 && STRING_max_bytes_per_codepoint(s2) != 1)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
            "string bitwise_and (%s/%s) unsupported",
            nonnull_encoding_name(s1), s2->encoding->name);

    /* think about case of dest string is one of the operands */
    if (!STRING_IS_NULL(s1) && !STRING_IS_NULL(s2))
        minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
    else
        minlen = 0;

    res = Parrot_str_new_init(interp, NULL, minlen,
            Parrot_binary_encoding_ptr, 0);

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
        if (STRING_max_bytes_per_codepoint(s1) != 1)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (!STRING_IS_NULL(s2)) {
        if (STRING_max_bytes_per_codepoint(s2) != 1)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_or (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    res = Parrot_str_new_init(interp, NULL, maxlen,
            Parrot_binary_encoding_ptr, 0);

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
        if (STRING_max_bytes_per_codepoint(s1) != 1)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                s1->encoding->name, nonnull_encoding_name(s2));

        maxlen = s1->bufused;
    }

    if (!STRING_IS_NULL(s2)) {
        if (STRING_max_bytes_per_codepoint(s2) != 1)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_xor (%s/%s) unsupported",
                nonnull_encoding_name(s1), s2->encoding->name);

        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    res = Parrot_str_new_init(interp, NULL, maxlen,
            Parrot_binary_encoding_ptr, 0);

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
        if (STRING_max_bytes_per_codepoint(s) != 1)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_ENCODING,
                "string bitwise_not (%s) unsupported",
                s->encoding->name);

        len = s->bufused;
    }
    else
        len = 0;

    res = Parrot_str_new_init(interp, NULL, len,
            Parrot_binary_encoding_ptr, 0);

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
    INTVAL len;

    if (s == NULL)
        return 0;

    len = STRING_length(s);
    if (len == 0)
        return 0;

    if (len == 1) {
        const UINTVAL c = STRING_ord(interp, s, 0);

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
        INTVAL              count = (INTVAL)s->strlen;
        UINTVAL             c;

        STRING_ITER_INIT(interp, &iter);

        c = count-- > 0 ? STRING_iter_get_and_advance(interp, s, &iter) : 0;
        while (c == ' ')
            c = count-- > 0 ? STRING_iter_get_and_advance(interp, s, &iter) : 0;
        switch (c) {
          case '-':
            sign = -1;
            /* Fall through. */
          case '+':
            c = count-- > 0 ? STRING_iter_get_and_advance(interp, s, &iter) : 0;
            break;
          default:
            ; /* nothing */
        }
        while (c) {
            const UINTVAL nextval = c - (UINTVAL)'0';
            if (nextval > 9)
                break;
            if (i < max_safe || (i == max_safe && nextval <= last_dig))
                i = i * 10 + nextval;
            else
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_ERR_OVERFLOW,
                    "Integer value of String '%S' too big", s);
            c = count-- > 0 ? STRING_iter_get_and_advance(interp, s, &iter) : 0;
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
Parrot_str_to_num(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
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
    number_parse_state state = parse_start;

    if (STRING_IS_NULL(s))
        return 0.0;

    STRING_ITER_INIT(interp, &iter);

    /* Handcrafted FSM to read float value */
    while (state != parse_end && iter.charpos < s->strlen) {
        const UINTVAL c = STRING_iter_get_and_advance(interp, s, &iter);
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
                 * Throw gathered result. Recalculate from integer mantissa
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
        STRING * const t = Parrot_str_upcase(interp, s);
        if (STRING_equal(interp, t, CONST_STRING(interp, "NAN")))
            return PARROT_FLOATVAL_NAN_QUIET;
        else if (STRING_equal(interp, t, CONST_STRING(interp, "INF"))
             ||  STRING_equal(interp, t, CONST_STRING(interp, "INFINITY")))
            return PARROT_FLOATVAL_INF_POSITIVE;
        else if (STRING_equal(interp, t, CONST_STRING(interp, "-INF"))
             ||  STRING_equal(interp, t, CONST_STRING(interp, "-INFINITY")))
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

Returns a C string for the specified Parrot string in the current
representation of the string. Use C<Parrot_str_free_cstring()> to free
the string. Failure to do this will result in a memory leak.

You usually should use Parrot_str_to_encoded_cstring instead.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
char *
Parrot_str_to_cstring(PARROT_INTERP, ARGIN(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_cstring)

    return Parrot_str_to_encoded_cstring(interp, s, s->encoding);
}


/*

=item C<char * Parrot_str_to_encoded_cstring(PARROT_INTERP, const STRING *s,
const STR_VTABLE *enc)>

Returns a C string in the encoding C<enc> for the Parrot string C<s>. Use
C<Parrot_str_free_cstring()> to free the string. Failure to do this will result
in a memory leak.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
char *
Parrot_str_to_encoded_cstring(PARROT_INTERP, ARGIN(const STRING *s),
        ARGIN(const STR_VTABLE *enc))
{
    ASSERT_ARGS(Parrot_str_to_encoded_cstring)
    size_t  len;
    size_t  trail;
    char   *p;

    if (STRING_IS_NULL(s))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Can't convert NULL string");

    if (s->encoding != enc) {
        /* Check for compatible encodings */
        if (s->encoding == Parrot_ascii_encoding_ptr) {
            if (enc == Parrot_latin1_encoding_ptr
            ||  enc == Parrot_utf8_encoding_ptr)
                    goto skip;
        }
        else if (s->encoding == Parrot_ucs2_encoding_ptr) {
            if (enc == Parrot_utf16_encoding_ptr)
                goto skip;
        }

        /* Convert */
        s = enc->to_encoding(interp, s);
    }
skip:

    len   = s->bufused;
    trail = enc->bytes_per_unit;

    p = (char*)mem_internal_allocate(len + trail);

    memcpy(p, s->strstart, len);
    memset(p + len, 0, trail);

    return p;
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
    char * const memory = (char *)mem_internal_allocate(size);

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

=item C<size_t Parrot_str_to_hashval(PARROT_INTERP, const STRING *s)>

Returns the hash value for the specified Parrot string, caching it in
C<< s->hashval >>.

Identical to the STRING_hash macro.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t
Parrot_str_to_hashval(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(Parrot_str_to_hashval)

    if (s == NULL)
        s = STRINGNULL;

    return STRING_hash(interp, s, interp->hash_seed);
}

/*

=item C<STRING * Parrot_str_reverse(PARROT_INTERP, const STRING *src)>

Return the reverse of C<src>, even for non-ascii strings.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_reverse(PARROT_INTERP, ARGIN(const STRING *src))
{
    ASSERT_ARGS(Parrot_str_reverse)
    String_iter  iter;
    INTVAL       pos;
    PMC         *sb;

    STRING_ITER_INIT(interp, &iter);
    sb = Parrot_pmc_new(interp, enum_class_StringBuilder);

    for (pos = STRING_length(src) - 1; pos >= 0; pos--) {
        VTABLE_push_string(interp, sb, Parrot_str_chr(interp,
            STRING_iter_get(interp, src, &iter, pos)));
    }

    return VTABLE_get_string(interp, sb);
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
PARROT_CANNOT_RETURN_NULL
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
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_escape_truncate(PARROT_INTERP,
        ARGIN_NULLOK(const STRING *src), UINTVAL limit)
{
    ASSERT_ARGS(Parrot_str_escape_truncate)
    STRING      *result;
    UINTVAL      i, len, charlen;
    String_iter  iter;
    char         hex_buf[16];
    int          hex_len;
    char        *dp;

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
            Parrot_ascii_encoding_ptr, 0);

    /* more work TODO */
    STRING_ITER_INIT(interp, &iter);
    dp = result->strstart;

    for (i = 0; len > 0; --len) {
        unsigned c = STRING_iter_get_and_advance(interp, src, &iter);
        if (c < 0x7f) {
            /* process ASCII chars */
            if (i >= charlen - 2) {
                /* resize - still len codepoints to go */
                charlen += len * 2 + 16;
                result->bufused = i;
                Parrot_gc_reallocate_string_storage(interp, result, charlen);
                /* start can change */
                dp = result->strstart;
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
                dp[i++] = c;
                continue;
            }
        }

        /* escape by appending either \uhhhh or \x{hh...} */

        if (c < 0x0100 || c >= 0x10000)
            hex_len = snprintf(hex_buf, 15, "\\x{%x}", c);
        else
            hex_len = snprintf(hex_buf, 15, "\\u%04x", c);

        if (hex_len < 0)
            hex_len = 0;

        if (i + hex_len > charlen) {
            /* resize - still len codepoints to go */
            charlen += len * 2 + 16;
            result->bufused = i;
            Parrot_gc_reallocate_string_storage(interp, result, charlen);
            /* start can change */
            dp = result->strstart;
        }

        mem_sys_memcopy(dp + i, hex_buf, hex_len);

        /* adjust our insert idx */
        i += hex_len;

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
const STR_VTABLE *encoding, UINTVAL flags)>

EXPERIMENTAL, see TT #1628

Unescapes the src string returning a new string with the encoding specified.


=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_unescape_string(PARROT_INTERP, ARGIN(const STRING *src),
        ARGIN(const STR_VTABLE *encoding),
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

    result->encoding = encoding;
    reserved = string_max_bytes(interp, result, srclen);
    Parrot_gc_allocate_string_storage(interp, result, reserved);
    result->bufused = reserved;

    STRING_ITER_INIT(interp, &itersrc);
    STRING_ITER_INIT(interp, &iterdest);
    while (itersrc.bytepos < srclen) {
        INTVAL c = STRING_iter_get_and_advance(interp, src, &itersrc);
        INTVAL next;

        do {
            pending = 0;
            next = c;
            if (c == '\\') {
                if (itersrc.bytepos >= srclen) break;
                c = STRING_iter_get_and_advance(interp, src, &itersrc);
                switch (c) {
                /* Common one char sequences */
                case 'a': next = '\a'; break;
                case 'b': next = '\b'; break;
                case 't': next = '\t'; break;
                case 'n': next = '\n'; break;
                case 'v': next = '\v'; break;
                case 'f': next = '\f'; break;
                case 'r': next = '\r'; break;
                case 'e': next = '\x1B'; break;
                /* Escape character */
                case 'c':
                    if (itersrc.bytepos >= srclen) break;
                    c = STRING_iter_get_and_advance(interp, src, &itersrc);
                    /* This assumes ascii-alike encoding */
                    if (c < 'A' || c > 'Z')
                        throw_illegal_escape(interp);
                    next = c - 'A' + 1;
                    break;
                case 'x':
                    digcount = 0;
                    if (itersrc.bytepos >= srclen)
                        break;
                    c = STRING_iter_get_and_advance(interp, src, &itersrc);
                    if (c == '{') {
                        /* \x{h..h} 1..8 hex digits */
                        while (itersrc.bytepos < srclen) {
                            c = STRING_iter_get_and_advance(interp, src, &itersrc);
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
                            c = STRING_iter_get_and_advance(interp, src, &itersrc);
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
                        if (itersrc.bytepos >= srclen) break;
                        c = STRING_iter_get_and_advance(interp, src, &itersrc);
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
                        if (itersrc.bytepos >= srclen) break;
                        c = STRING_iter_get_and_advance(interp, src, &itersrc);
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
                        if (itersrc.bytepos >= srclen) break;
                        c = STRING_iter_get_and_advance(interp, src, &itersrc);
                        if (c < '0' || c > '7')
                            break;
                        digbuf[digcount] = c;
                    }
                    digbuf[digcount] = '\0';
                    next = strtol(digbuf, NULL, 8);
                    if (itersrc.bytepos < srclen && digcount < 3)
                        pending = 1;
                    break;
                default:
                    next = c;
                }
            }
            STRING_iter_set_and_advance(interp, result, &iterdest, next);
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

    STRING           *src;
    const STR_VTABLE *encoding, *src_encoding;
    size_t            clength = strlen(cstring);

    if (delimiter && clength)
        --clength;

    if (enc_char == NULL) {
        encoding = Parrot_default_encoding_ptr;
    }
    else {
        encoding = Parrot_find_encoding(interp, enc_char);

        if (!encoding)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Can't make '%s' encoding strings", enc_char);
    }

    if (encoding->max_bytes_per_codepoint == 1)
        src_encoding = encoding;
    else
        src_encoding = Parrot_utf8_encoding_ptr;

    src = Parrot_str_new_init(interp, cstring, clength, src_encoding,
            PObj_external_FLAG);

    return Parrot_str_unescape_string(interp, src, encoding,
            PObj_constant_FLAG);
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
        STRING * const res = STRING_upcase(interp, s);
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
        STRING * const res = STRING_downcase(interp, s);
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
        STRING * const res = STRING_titlecase(interp, s);
        res->hashval = 0;
        return res;
    }
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

    return STRING_is_cclass(interp, flags, s, offset);
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

    return STRING_find_cclass(interp, flags, s, offset, count);
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

    return STRING_find_not_cclass(interp, flags, s, offset, count);
}


/*

=item C<STRING* Parrot_str_change_encoding(PARROT_INTERP, STRING *src, INTVAL
encoding_nr)>

Converts C<src> to the given encoding and returns the result as a new string.

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
    const STR_VTABLE *new_encoding;

    if (STRING_IS_NULL(src))
        return STRINGNULL;

    new_encoding = Parrot_get_encoding(interp, encoding_nr);

    if (!new_encoding)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_ENCODING,
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
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_str_compose(PARROT_INTERP, ARGIN_NULLOK(const STRING *src))
{
    ASSERT_ARGS(Parrot_str_compose)

    if (STRING_IS_NULL(src))
        return STRINGNULL;

    if (src->strlen == 0)
        return CONST_STRING(interp, "");

    return STRING_compose(interp, src);
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

    if (STRING_IS_NULL(j)) {
        PMC *sb = Parrot_pmc_new_init(interp, enum_class_StringBuilder, ar);
        return VTABLE_get_string(interp, sb);
    }
    else {
        PMC      *sb;
        STRING   *first;
        const int count = VTABLE_elements(interp, ar);
        INTVAL    length, j_length;
        int       i;

        if (count == 0)
            return Parrot_str_new_noinit(interp, 0);

        first    = VTABLE_get_string_keyed_int(interp, ar, 0);
        length   = Parrot_str_byte_length(interp, first);
        j_length = Parrot_str_byte_length(interp, j);

        /* it's an approximiation, but it doesn't hurt */
        sb       = Parrot_pmc_new_init_int(interp, enum_class_StringBuilder,
                    (length + j_length) * count);

        VTABLE_push_string(interp, sb, first);

        for (i = 1; i < count; ++i) {
            VTABLE_push_string(interp, sb, j);
            VTABLE_push_string(interp, sb,
                VTABLE_get_string_keyed_int(interp, ar, i));
        }

        return VTABLE_get_string(interp, sb);
    }
}


/*

=item C<PMC* Parrot_str_split(PARROT_INTERP, const STRING *delim, const STRING
*str)>

Splits the string C<str> at the delimiter C<delim>, returning a
C<ResizableStringArray>, or his mapped type in the current HLL, of results.
Returns PMCNULL if the string or the delimiter is NULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_str_split(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *delim), ARGIN_NULLOK(const STRING *str))
{
    ASSERT_ARGS(Parrot_str_split)
    PMC     *res;
    STRING  *tstr;
    UINTVAL  slen, dlen;
    String_iter iter;

    if (STRING_IS_NULL(delim) || STRING_IS_NULL(str))
        return PMCNULL;

    res  = Parrot_pmc_new(interp,
            Parrot_hll_get_ctx_HLL_type(interp, enum_class_ResizableStringArray));
    slen = Parrot_str_length(interp, str);

    if (!slen)
        return res;

    STRING_ITER_INIT(interp, &iter);
    dlen = Parrot_str_length(interp, delim);

    if (dlen == 0) {
        VTABLE_set_integer_native(interp, res, slen);

        do {
            const String_iter old_iter = iter;

            STRING_iter_skip(interp, str, &iter, 1);
            tstr = Parrot_str_iter_substr(interp, str, &old_iter, &iter);
            VTABLE_set_string_keyed_int(interp, res, old_iter.charpos, tstr);
        } while (iter.charpos < slen);

        return res;
    }

    do {
        String_iter start, end;

        start = iter;
        if (Parrot_str_iter_index(interp, str, &start, &end, delim) < 0)
            break;

        tstr = Parrot_str_iter_substr(interp, str, &iter, &start);
        VTABLE_push_string(interp, res, tstr);
        iter = end;
    } while (iter.charpos < slen);

    tstr = Parrot_str_iter_substr(interp, str, &iter, NULL);
    VTABLE_push_string(interp, res, tstr);

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

    return Parrot_str_new_init(interp, p, (UINTVAL)(tail - p),
            Parrot_default_encoding_ptr, 0);
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

=head2 GC registry interface

=over 4

=item C<void Parrot_str_gc_register(PARROT_INTERP, STRING *s)>

Registers the STRING from the interpreter's GC registry to prevent it from
being collected.

=cut

*/


PARROT_EXPORT
void
Parrot_str_gc_register(PARROT_INTERP, ARGIN(STRING *s))
{
    ASSERT_ARGS(Parrot_str_gc_register)
    /* Better not trigger a GC run with a potentially unanchored PMC */
    Parrot_block_GC_mark(interp);

    PARROT_ASSERT(interp->gc_registry);

    VTABLE_set_pmc_keyed_str(interp, interp->gc_registry, s, PMCNULL);
    Parrot_unblock_GC_mark(interp);
}

/*

=item C<void Parrot_str_gc_unregister(PARROT_INTERP, STRING *s)>

Unregisters the STRING from the interpreter's GC registry.

=cut

*/

PARROT_EXPORT
void
Parrot_str_gc_unregister(PARROT_INTERP, ARGIN(STRING *s))
{
    ASSERT_ARGS(Parrot_str_gc_unregister)
    PARROT_ASSERT(interp->gc_registry);

    VTABLE_delete_keyed_str(interp, interp->gc_registry, s);
}


/*

=back

=head1 SEE ALSO

=over

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
