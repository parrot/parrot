/*
Copyright (C) 2001-2006, The Perl Foundation.
$Id$

=head1 NAME

src/string.c - Parrot Strings

=head1 DESCRIPTION

This file implements the non-ICU parts of the Parrot string subsystem.

Note that C<bufstart> and C<buflen> are used by the memory subsystem. The
string functions may only use C<buflen> to determine, if there is some
space left beyond C<bufused>. This is the I<only> valid usage of these
two data members, beside setting C<bufstart>/C<buflen> for external
strings.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/compiler.h"
#include "string_private_cstring.h"
#include "parrot/string_funcs.h"
#include <assert.h>

/*
 * this extra size is in the hope, that some concat ops might
 * follow in a sequence.
 *
 * compiling 3180 chars of a bf programs with bfc gives:
 *
 *             extra = 4          512          1024
 * GC runs          2376           74            36
 * mem copied      210 MB        6 MB          3 MB
 * time -C          5.2 s       0.3 s         0.2 s
 */

#define EXTRA_SIZE 256


#define saneify_string(s) \
    assert(s->encoding && \
           s->charset && \
           !PObj_on_free_list_TEST(s))

/* HEADER: include/parrot/string_funcs.h */

/*

FUNCDOC: Parrot_unmake_COW

If the specified Parrot string is copy-on-write then the memory is
copied over and the copy-on-write flag is cleared.

*/

void
Parrot_unmake_COW(Interp *interp, STRING *s /*NN*/)
{
    /* COW_FLAG | constant_FLAG | external_FLAG) */
    if (PObj_is_cowed_TESTALL(s)) {
        STRING for_alloc;

        /* Create new pool data for this header to use,
         * independent of the original COW data */
        PObj_constant_CLEAR(s);
        /* constant may have been marked */
        PObj_live_CLEAR(s);
        /*
         * allocate a dummy strings memory
         * buflen might be bigger and used, so pass this length
         * also be sure not to allocate from the constant pool
         */
        PObj_flags_CLEARALL(&for_alloc);
        Parrot_allocate_string(interp, &for_alloc, PObj_buflen(s));
        /*
         * now copy memory over
         */
        mem_sys_memcopy(for_alloc.strstart, s->strstart, s->bufused);
        /*
         * and finally use that string memory
         */
        PObj_bufstart(s) = PObj_bufstart(&for_alloc);
        s->strstart      = for_alloc.strstart;
        PObj_buflen(s)   = PObj_buflen(&for_alloc);
        /* COW_FLAG | external_FLAG */
        PObj_is_external_CLEARALL(s);
    }

    s->hashval = 0;
}

/*

FUNCDOC: copy_string_header

Copies the string header from the first Parrot string to the second.

*/

static void
copy_string_header(String *dest /*NN*/, const String *src /*NN*/)
{
    memcpy(dest, src, sizeof(String));
}

/*

FUNCDOC: Parrot_make_COW_reference

Creates a copy-on-write string by cloning a string header without
allocating a new buffer.

*/

extern int Parrot_in_memory_pool(Interp *, void *);
STRING *
Parrot_make_COW_reference(Interp *interp, STRING *s)
{
    STRING *d;
    if (s == NULL)
        return NULL;

    if (PObj_constant_TEST(s)) {
        d = new_string_header(interp, 0);
        PObj_COW_SET(s);
        copy_string_header(d, s);
        /* we can't move the memory, because constants aren't
         * scanned in compact_pool, therefore the other end
         * would point to garbage.
         */
        PObj_external_SET(d);
    }
    else {
        d = new_string_header(interp, PObj_get_FLAGS(s));
        PObj_COW_SET(s);
        copy_string_header(d, s);
        PObj_sysmem_CLEAR(d);
#if 0
        /* XXX FIXME hack to avoid cross-interpreter issue until it
         * is fixed correctly. */
        if (n_interpreters > 1 && PObj_is_movable_TESTALL(s) &&
                !Parrot_in_memory_pool(interp, PObj_bufstart(s))) {
            Parrot_unmake_COW(interp, d);
            PIO_eprintf(interp, "cross-interpreter copy of "
                                     "relocatable string '%Ss' into tid %d\n",
                        d,
                        interp->thread_data->tid);
        }
#endif
    }
    return d;
}

/*

FUNCDOC: Parrot_reuse_COW_reference

Creates a copy-on-write string by cloning a string header without
allocating a new buffer. Doesn't allocate a new string header, instead
using the one passed in and returns it.

*/

STRING*
Parrot_reuse_COW_reference(Interp *interp, STRING *s, STRING *d /*NN*/)
{
    if (s == NULL) {
        return NULL;
    }
    if (PObj_constant_TEST(s)) {
        PObj_COW_SET(s);
        copy_string_header(d, s);
        PObj_constant_CLEAR(d);
        PObj_external_SET(d);
    }
    else {
        PObj_COW_SET(s);
        copy_string_header(d, s);
        PObj_sysmem_CLEAR(d);
    }
    return d;
}

/*

FUNCDOC: string_set

Makes the contents of first Parrot string a copy of the contents of
second.

*/

STRING *
string_set(Interp *interp, STRING *dest /*NN*/, STRING *src)
{
    if (!src)
        return NULL;
    if (dest == src)
        return dest;
    if (dest) { /* && dest != src */
        /* they are different, dest is not an external string */
    /* TODO create string_free API for reusing string headers */
#ifdef GC_IS_MALLOC
        if (!PObj_is_cowed_TESTALL(dest) && PObj_bufstart(dest)) {
            mem_sys_free((INTVAL*)PObj_bufstart(dest) - 1);
        }
#endif
        dest = Parrot_reuse_COW_reference(interp, src, dest);
    }
    else
        dest = Parrot_make_COW_reference(interp, src);
    return dest;
}

/*

=head2 Basic String Functions

Creation, enlargement, etc.

FUNCDOC: string_init

Initializes the Parrot string subsystem.

*/

void
string_init(Parrot_Interp interp)
{
    size_t i;

    /*
     * when string_init is called, the config hash isn't created
     * so we can't get at the runtime path
     * XXX do we still need this --leo
     */

    if (!interp->parent_interpreter) {
        /* Load in the basic encodings and charsets
         */
        Parrot_charsets_encodings_init(interp);
    }

    /*
     * initialize the constant string table
     */
    if (interp->parent_interpreter) {
        interp->const_cstring_table =
            interp->parent_interpreter->const_cstring_table;
        return;
    }
    interp->const_cstring_table = mem_sys_allocate(sizeof(STRING*) *
        sizeof(parrot_cstrings)/sizeof(parrot_cstrings[0]));
    for (i = 0; i < sizeof(parrot_cstrings)/sizeof(parrot_cstrings[0]); ++i) {
        interp->const_cstring_table[i] =
            const_string(interp, parrot_cstrings[i].string);
        /* TODO construct string here and valid hashval */
    }

}

/*

FUNCDOC:
De-Initializes the Parrot string subsystem.

*/

void
string_deinit(Parrot_Interp interp)
{
    /* all are shared between interpreters */
    if (!interp->parent_interpreter) {
        mem_sys_free(interp->const_cstring_table);
        interp->const_cstring_table = NULL;
        Parrot_charsets_encodings_deinit(interp);
    }
}

/*

FUNCDOC:
Returns the capacity of the specified Parrot string in bytes, that
is how many bytes can be appended onto strstart.

*/

UINTVAL
string_capacity(Interp *interp, const STRING *s /*NN*/)
{
    return ((ptrcast_t)PObj_bufstart(s) + PObj_buflen(s) -
            (ptrcast_t)s->strstart);
}

/*

FUNCDOC:
Creates and returns an empty Parrot string.

*/

STRING *
string_make_empty(Interp *interp,
    parrot_string_representation_t representation, UINTVAL capacity)
{
    STRING * const s = new_string_header(interp, 0);

    /*
     * TODO adapt string creation functions
     */
    if (representation == enum_stringrep_one) {
        s->charset = PARROT_DEFAULT_CHARSET;
        s->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, s);;
    }
    else {
        internal_exception(INVALID_CHARTYPE, "Unsupported representation");
    }

    Parrot_allocate_string(interp,
        s, string_max_bytes(interp, s, capacity));

    return s;
}

/*

FUNCDOC:
Find the "lowest" possible charset and encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returs NULL, if no compatible string representation can be found.

*/

CHARSET *
string_rep_compatible (Interp *interp,
                       STRING *a /*NN*/,
                       const STRING *b /*NN*/,
                       ENCODING **e /*NN*/)
{
    if (a->encoding == b->encoding && a->charset == b->charset) {
        *e = a->encoding;
        return a->charset;
    }

    /*
     * a table could possibly simplify the logic
     */
    if (a->encoding == Parrot_utf8_encoding_ptr &&
            b->charset == Parrot_ascii_charset_ptr) {
        if (a->strlen == a->bufused) {
            *e = Parrot_fixed_8_encoding_ptr;
            return Parrot_ascii_charset_ptr;
        }
        *e = a->encoding;
        return a->charset;
    }
    if (b->encoding == Parrot_utf8_encoding_ptr &&
            a->charset == Parrot_ascii_charset_ptr) {
        if (b->strlen == b->bufused) {
            *e = Parrot_fixed_8_encoding_ptr;
            return a->charset;
        }
        *e = Parrot_utf8_encoding_ptr;
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

FUNCDOC:
Take in two Parrot strings and append the second to the first.
NOTE THAT RETURN VALUE MAY NOT BE THE FIRST STRING,
  if the first string is COW'd or read-only.
So make sure to _use_ the return value.

*/

STRING *
string_append(Interp *interp,
    STRING *a, STRING *b)
{
    UINTVAL a_capacity, b_len;
    UINTVAL total_length;
    CHARSET *cs;
    ENCODING *enc;

    /* XXX should this be a CHARSET method? */

    /* If B isn't real, we just bail */
    b_len = string_length(interp, b);
    if (!b_len) {
        return a;
    }

    /* Is A real? */
    if (a == NULL)
        return string_copy(interp, b);

    saneify_string(a);
    saneify_string(b);

    /* If the destination's constant, or external then just fall back to
       string_concat */
    if (PObj_is_cowed_TESTALL(a)) {
        return string_concat(interp, a, b, 0);
    }

    cs = string_rep_compatible(interp, a, b, &enc);
    if (cs != NULL) {
        a->charset = cs;
        a->encoding = enc;
    }
    else {
        /* upgrade to utf16 */
        Parrot_utf16_encoding_ptr->to_encoding(interp, a, NULL);
        b = Parrot_utf16_encoding_ptr->to_encoding(interp, b,
                new_string_header(interp, 0));
        /*
         * result could be mixed ucs2 / utf16
         */
        if (b->encoding == Parrot_utf16_encoding_ptr)
            a->encoding = Parrot_utf16_encoding_ptr;
    }
    /*
     * calc usable and total bytes
     */
    a_capacity = string_capacity(interp, a);
    total_length = a->bufused + b->bufused;

    /* make sure A's big enough for both  */
    if (total_length >= a_capacity)  {
        Parrot_reallocate_string(interp, a,
                total_length << 1);
    }

    /* A is now ready to receive the contents of B */

    /* Tack B on the end of A */
    mem_sys_memcopy((void *)((ptrcast_t)a->strstart + a->bufused),
            b->strstart, b->bufused);

    a->bufused += b->bufused;
    a->strlen += b_len;
    a->hashval = 0;
    return a;
}

/*

FUNCDOC:
Make a Parrot string from a specified C string.

*/

STRING *
string_from_cstring(Interp *interp,
    const void *buffer, UINTVAL len)
{
    return string_make_direct(interp, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                              PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                              0); /* Force an 8-bit encoding at some
                                     point? */
}

/*

FUNCDOC:
Make a Parrot string from a specified C string.

*/

STRING *
string_from_const_cstring(Interp *interp,
    const void *buffer, UINTVAL len)
{
    return string_make_direct(interp, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                          PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET, 0);
    /* make this utf-8 eventually? */
}

/*

FUNCDOC:
Returns the primary encoding for the specified representation.

This is needed for packfile unpacking, unless we just always use UTF-8
or BOCU.

*/

const char*
string_primary_encoding_for_representation(Interp *interp,
    parrot_string_representation_t representation)
{
    switch (representation) {
        case enum_stringrep_one:
            return "ascii";
            break;
        default:
            internal_exception(INVALID_STRING_REPRESENTATION,
                "string_primary_encoding_for_representation: "
                "invalid string representation");
            return NULL;
            break;
    }
}

/*

FUNCDOC:
Creates and returns a constant Parrot string.

*/

STRING *
const_string(Interp *interp, const char *buffer /*NN*/)
{
    /* TODO cache the strings */
    return string_make_direct(interp, buffer, strlen(buffer),
                       PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                       PObj_external_FLAG|PObj_constant_FLAG);
}

/*

FUNCDOC:

Creates and returns a new Parrot string using C<len> bytes of string
data read from C<buffer>.

The value of C<charset_name> specifies the string's representation.
The currently recognised values are:

    'iso-8859-1'
    'ascii'
    'binary'
    'unicode'

The encoding is implicitly guessed; C<unicode> impliies the C<utf-8>
encoding, and the other three assume C<fixed-8> encoding.

If C<charset> is unspecified the default charset 'ascii' will be
used.

The value of C<flags> is optionally one or more C<PObj_*> flags C<OR>-ed
together.

*/

STRING *
string_make(Interp *interp, const void *buffer,
    UINTVAL len, const char *charset_name, UINTVAL flags)
{
    ENCODING *encoding;
    CHARSET *charset;

    if (!charset_name) {
        charset_name = "ascii";
    }
    charset = Parrot_find_charset(interp, charset_name);
    if (!charset) {
        internal_exception(UNIMPLEMENTED,
                "Can't make '%s' charset strings", charset_name);
    }
    encoding = charset->preferred_encoding;
    return string_make_direct(interp, buffer, len,
            encoding, charset, flags);

}

STRING *
string_make_direct(Interp *interp, const void *buffer,
        UINTVAL len, ENCODING *encoding, CHARSET *charset, UINTVAL flags)
{
    STRING * const s = new_string_header(interp, flags);
    DECL_CONST_CAST;

    s->encoding = encoding;
    s->charset = charset;

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
        PObj_bufstart(s) = s->strstart = const_cast(buffer);
        PObj_buflen(s)   = s->bufused = len;
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            string_compute_strlen(interp, s);

        return s;
    }

    Parrot_allocate_string(interp, s, len);

    if (buffer) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            string_compute_strlen(interp, s);
    }
    else {
        s->strlen = s->bufused = 0;
    }

    return s;
}

/*

FUNCDOC:

Grows the Parrot string's buffer by the specified number of characters.

*/

STRING *
string_grow(Interp * interp, STRING * s, INTVAL addlen)
{
    Parrot_unmake_COW(interp,s);

    /* Don't check buflen, if we are here, we already checked. */
    Parrot_reallocate_string(interp,
        s, PObj_buflen(s) + string_max_bytes(interp, s, addlen));
    return s;
}

/*

=head2 Ordinary user-visible string operations

FUNCDOC:

Returns the number of characters in the specified Parrot string.

*/

UINTVAL
string_length(Interp *interp, const STRING *s)
{
    return s ? s->strlen : 0;
}

/*

FUNCDOC:
Returns the character (or glyph, depending upon the string's encoding)
This is to abstract the process of finding the Nth character in a
(possibly unicode or JIS-encoded) string, the idea being that once the
encoding functions are fleshed out, this function can do the right
thing.

Note that this is not range-checked.

*/

INTVAL
string_index(Interp *interp, const STRING *s, UINTVAL idx)
{
    saneify_string(s);
    return (INTVAL)CHARSET_GET_CODEPOINT(interp, s, idx);
}

/*

FUNCDOC:
Returns the character position of the second Parrot string in the first
at or after C<start>. The return value is a (0 based) offset in
characters, not bytes. If second string is not specified, then return
-1.

*/

INTVAL
string_str_index(Interp *interp, const STRING *s,
        const STRING *s2, INTVAL start)
{
    STRING *src, *search;
    UINTVAL len;
    DECL_CONST_CAST;

    if (start < 0)
        return -1;
    len = string_length(interp, s);
    if (!len)
        return -1;
    if (start >= (INTVAL)len)
        return -1;
    if (!string_length(interp, s2))
        return -1;

    saneify_string(s);
    saneify_string(s2);
    src = const_cast(s);
    search = const_cast(s2);

    return CHARSET_INDEX(interp, src, search, start);
}

/*

FUNCDOC:
Returns the codepoint at a given index into a string. Negative indexes
are treated as counting from the end of the string.

*/

INTVAL
string_ord(Interp *interp, const STRING *s, INTVAL idx)
{
    const UINTVAL len = string_length(interp, s);

    if (len == 0) {
        internal_exception(ORD_OUT_OF_STRING,
            "Cannot get character of empty string");
    }
    else {
        UINTVAL true_index;
        true_index = (UINTVAL)idx;

        if (idx < 0) {
            if ((INTVAL)(idx + len) < 0) {
                internal_exception(ORD_OUT_OF_STRING,
                    "Cannot get character before beginning of string");
            }
            else {
                true_index = (UINTVAL)(len + idx);
            }
        }

        if (true_index > (len - 1)) {
            internal_exception(ORD_OUT_OF_STRING,
                "Cannot get character past end of string");
        }

        return string_index(interp, s, true_index);
    }
    return -1;
}

/*

FUNCDOC:
Returns a single character Parrot string.

TODO - Allow this to take an array of characters?

*/

STRING *
string_chr(Interp *interp, UINTVAL character)
{
    if (character > 0xff)
        return Parrot_unicode_charset_ptr->string_from_codepoint(interp,
                character);
    else if (character > 0x7f)
        return Parrot_iso_8859_1_charset_ptr->string_from_codepoint(interp,
                character);
    else return Parrot_ascii_charset_ptr->string_from_codepoint(interp,
                 character);
}


/*

FUNCDOC:
Creates and returns a copy of the specified Parrot string.

*/

STRING *
string_copy(Interp *interp, STRING *s)
{
    return Parrot_make_COW_reference(interp, s);
}


/*

=head2 Vtable Dispatch Functions

FUNCDOC:
Calculates and returns the number of characters in the specified Parrot
string.

*/

INTVAL
string_compute_strlen(Interp *interp, STRING *s /*NN*/)
{
    s->strlen = CHARSET_CODEPOINTS(interp, s);
    return s->strlen;
}

/*

FUNCDOC:
Returns the number of bytes required to safely contain the specified number
of characters in the specified Parrot string's representation.

*/

INTVAL
string_max_bytes(Interp *interp, STRING *s, INTVAL nchars)
{
    assert(s->encoding);
    return ENCODING_MAX_BYTES_PER_CODEPOINT(interp, s) * nchars;
}

/*

FUNCDOC:
Concatenates two Parrot string. If necessary, converts the second
string's encoding and/or type to match those of the first string. If
either string is C<NULL>, then a copy of the non-C<NULL> string is
returned. If both strings are C<NULL>, then a new zero-length string is
created and returned.

*/

STRING *
string_concat(Interp *interp, STRING *a, STRING *b, UINTVAL Uflags)
{
    if (a != NULL && a->strlen != 0) {
        if (b != NULL && b->strlen != 0) {
            CHARSET *cs;
            ENCODING *enc;
            STRING *result;

            cs = string_rep_compatible(interp, a, b, &enc);
            if (!cs) {
                cs = a->charset;
                enc =a->encoding;
            }
            result =
                string_make_direct(interp, NULL,
                        a->bufused + b->bufused,
                        enc, cs, 0);

            result = string_append(interp, result, a);
            result = string_append(interp, result, b);

            return result;
        }
        else {
            return string_copy(interp, a);
        }
    }
    else {
        if (b != NULL) {
            return string_copy(interp, b);
        }
        else {
            return string_make(interp, NULL, 0, NULL, Uflags);
        }
    }
}

/*

FUNCDOC:
Repeats the specified Parrot string I<num> times and stores the result
in the second string, and returns it. The second string is created if
necessary.

*/

STRING *
string_repeat(Interp *interp, const STRING *s,
    UINTVAL num, STRING **d)
{
    UINTVAL i;

    STRING * const dest = string_make_direct(interp, NULL,
                        s->bufused * num,
                        s->encoding, s->charset, 0);

    if (num == 0) {
        return dest;
    }

    /* copy s into dest num times */
    for (i = 0; i < num; i++) {
        mem_sys_memcopy((void *)((ptrcast_t)dest->strstart + s->bufused * i),
                        s->strstart, s->bufused);
    }

    dest->bufused = s->bufused * num;
    dest->strlen = s->strlen * num;

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*

FUNCDOC:
Copies the substring of length C<length> from C<offset> from the
specified Parrot string and stores it in C<**d>, allocating memory if
necessary. The substring is also returned.

*/

STRING *
string_substr(Interp *interp, STRING *src,
    INTVAL offset, INTVAL length, STRING **d, int replace_dest)
{
    STRING *dest;
    UINTVAL true_offset;
    UINTVAL true_length;

    saneify_string(src);
    true_offset = (UINTVAL)offset;

    /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
    if (offset == (INTVAL)string_length(interp, src) || length < 1) {
        return string_make_empty(interp, enum_stringrep_one, 0);
    }

    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    if (src->strlen == 0 || true_offset > src->strlen - 1) {   /* 0 based... */
        internal_exception(SUBSTR_OUT_OF_STRING,
                "Cannot take substr outside string");
    }

    true_length = (UINTVAL)length;
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }

    /* do in-place i.e. reuse existing header if one */
    if (replace_dest && *d) {
        assert(src->encoding == Parrot_fixed_8_encoding_ptr);
        dest = *d;
        dest->encoding = src->encoding;
        dest->charset = src->charset;

        dest->strstart = (char *)src->strstart + true_offset ;
        dest->bufused = true_length;

        dest->strlen = true_length;
        dest->hashval = 0;
    }
    else
        dest = CHARSET_GET_CODEPOINTS(interp, src, true_offset,
                true_length);

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*

FUNCDOC:
This should follow the Perl semantics for:

    substr EXPR, OFFSET, LENGTH, REPLACEMENT

Replaces a sequence of C<length> characters from C<offset> in the first
Parrot string with the second Parrot string, returning what was
replaced.

Replacing a sequence of characters with a longer string grows the
string; a shorter string shrinks it.

Replacing 2 past the end of the string is undefined. However replacing 1
past the end of the string concatenates the two strings.

A negative offset is allowed to replace from the end.

*/

STRING *
string_replace(Interp *interp, STRING *src,
    INTVAL offset, INTVAL length, STRING *rep, STRING **d)
{
    STRING *dest = NULL;
    UINTVAL start_byte, end_byte;
    UINTVAL true_offset;
    UINTVAL true_length;
    INTVAL diff;
    CHARSET *cs;
    ENCODING *enc;
    String_iter iter;

    /* special case */
    if (d == NULL &&
            src &&
            rep &&
            src->encoding == Parrot_fixed_8_encoding_ptr &&
            rep->encoding == Parrot_fixed_8_encoding_ptr &&
            offset >= 0 &&
            (UINTVAL)offset < src->strlen &&
            length == 1 &&
            rep->strlen == 1
            ) {
        if (PObj_is_cowed_TESTALL(src)) {
            Parrot_unmake_COW(interp, src);
        }
        ((char*)src->strstart)[offset] = ((char*)rep->strstart)[0];
        return NULL;
    }

    true_offset = (UINTVAL)offset;
    true_length = (UINTVAL)length;
    /* abs(-offset) may not be > strlen-1 */
    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    /* Can replace 1 past end of string which is technically outside the string
     * but is same as a concat().
     * Only give exception if caller trys to replace end of string + 2
     */
    if (true_offset > src->strlen) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                "Can only replace inside string or index after end of string");
    }
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }

    /* Save the substring that is replaced for the return value */
    if (d != NULL) {
        dest = CHARSET_GET_CODEPOINTS(interp, src,
                true_offset, true_length);
        *d = dest;
    }

    /* may have different reps..... */
    cs = string_rep_compatible(interp, src, rep, &enc);
    if (!cs) {
        Parrot_utf16_encoding_ptr->to_encoding(interp, src, NULL);
        rep = Parrot_utf16_encoding_ptr->to_encoding(interp, rep,
                new_string_header(interp, 0));
    }
    else {
        src->charset = cs;
        src->encoding = enc;
    }

    /* get byte position of the part that will be replaced */
    ENCODING_ITER_INIT(interp, src, &iter);
    iter.set_position(interp, &iter, true_offset);
    start_byte = iter.bytepos;
    iter.set_position(interp, &iter, true_offset + true_length);
    end_byte = iter.bytepos;

    /* not possible.... */
    if (end_byte < start_byte) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                "replace: subend somehow is less than substart");
    }

    /* Now do the replacement */

    /*
     * If the replacement string fits inside the original substring
     * don't create a new string, just pack it.
     */
    diff = (end_byte - start_byte) - rep->bufused;

    if(diff >= 0
            || ((INTVAL)src->bufused - (INTVAL)PObj_buflen(src)) <= diff) {
        Parrot_unmake_COW(interp, src);

        if(diff != 0) {
            mem_sys_memmove((char*)src->strstart + start_byte + rep->bufused,
                    (char*)src->strstart + end_byte,
                    src->bufused - end_byte);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char*)src->strstart + start_byte,
                rep->strstart, rep->bufused);
        if(diff != 0)
            (void)string_compute_strlen(interp, src);
    }
    /*
     * Replacement is larger than avail buffer, grow the string
     */
    else {
        /* diff is negative here, make it positive */
        diff = -(diff);
        string_grow(interp, src, diff);

        /* Move the end of old string that isn't replaced to new offset
         * first */
        mem_sys_memmove((char*)src->strstart + end_byte + diff,
                (char*)src->strstart + end_byte,
                src->bufused - end_byte);
        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->strstart + start_byte, rep->strstart,
                rep->bufused);
        src->bufused += diff;
        (void)string_compute_strlen(interp, src);
    }

    /* src is modified, now return the original substring */
    return dest;
}

/*

FUNCDOC:

Chops off the last C<n> characters of the specified Parrot string. If
C<n> is negative, cuts the string after C<+n> characters.
If C<in_place> is true, the string is chopped in places, else a copy
of the string is chopped and returned.

*/

STRING *
string_chopn(Interp *interp, STRING *s, INTVAL n, int in_place)
{
    UINTVAL new_length, uchar_size;
    String_iter iter;

    if (!s)
        return NULL;
    if (in_place) {
        /*
         *  constant or external strings can't be chopped inplace
         */
        Parrot_unmake_COW(interp, s);
    }
    else
        s = string_copy(interp, s);

    if (n < 0) {
        new_length = -n;
        if (new_length > s->strlen)
            return s;
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
        return s;
    }
    uchar_size = s->bufused / s->strlen;
    s->strlen = new_length;
    if (s->encoding == Parrot_fixed_8_encoding_ptr) {
        s->bufused = new_length;
    }
    else if (s->encoding == Parrot_ucs2_encoding_ptr) {
        s->bufused = new_length * uchar_size;
    }
    else {
        ENCODING_ITER_INIT(interp, s, &iter);
        iter.set_position(interp, &iter, new_length);
        s->bufused = iter.bytepos;
    }

    return s;
}


INTVAL
string_compare(Interp *interp, STRING *s1, STRING *s2)
{
    if (!s1 && !s2) {
        return 0;
    }
    if (!s2) {
        return s1->strlen != 0;
    }
    if (!s1) {
        return -(s2->strlen != 0);
    }

    saneify_string(s1);
    saneify_string(s2);

    return CHARSET_COMPARE(interp, s1, s2);
}


/*

FUNCDOC:
Compares two Parrot strings, performing type and encoding conversions if
necessary.

Note that this function returns 0 if the strings are equal and 1
otherwise.

*/

INTVAL
string_equal(Interp *interp, STRING *s1, STRING *s2)
{
    if ( (s1 == s2) || (!s1 && !s2) ) {
        return 0;
    }
    else if (!s2) {
        return s1->strlen != 0;
    }
    else if (!s1) {
        return s2->strlen != 0;
    }
    else if (s1->strlen != s2->strlen) {
        return 1;       /* we don't care which is bigger */
    }
    else if (s1->hashval != s2->hashval && s1->hashval && s2->hashval) {
        return 1;
    }
    else if (!s1->strlen) {   /* s2->strlen is the same here */
        return 0;
    }
    else if (s1->strstart == s2->strstart &&
            s1->bufused == s2->bufused) { /* COWed strings */
        return 0;
    }

    /*
     * now,
     * both strings are non-null
     * both strings have same length
     */
    return CHARSET_COMPARE(interp, s1, s2);

}

/*

FUNCDOC:
Makes the specified Parrot string writable with minimum length C<len>.
The C<representation> argument is required in case a new Parrot string
has to be created.

*/

static void
make_writable(Interp *interp, STRING **s /*NN*/,
    const size_t len, parrot_string_representation_t representation)
{
    if (!*s)
        *s = string_make_empty(interp, representation, len);
    else if ((*s)->strlen < len)
        string_grow(interp, *s, len - (*s)->strlen);
    else if (PObj_is_cowed_TESTALL(*s))
        Parrot_unmake_COW(interp, *s);
}

#define BITWISE_AND_STRINGS(type1, type2, restype, s1, s2, res, minlen) \
do { \
    const type1 *curr1 = (type1 *)s1->strstart; \
    const type2 *curr2 = (type2 *)s2->strstart; \
    restype *dp = (restype *)res->strstart; \
    size_t len = minlen; \
 \
    for ( ; len ; ++curr1, ++curr2, ++dp, --len) \
        *dp = *curr1 & *curr2; \
} while(0)

/*

FUNCDOC:
Performs a bitwise C<AND> on two Parrot string, performing type and
encoding conversions if necessary. If the second string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

*/

STRING *
string_bitwise_and(Interp *interp, STRING *s1, STRING *s2, STRING **dest)
{
    STRING *res = NULL;
    size_t minlen;

    /* we could also trans_charset to iso-8859-1 */
    if (s1 && s1->encoding != Parrot_fixed_8_encoding_ptr) {
        real_exception(interp, NULL, INVALID_ENCODING,
                "string bitwise_and (%s/%s) unsupported",
                ((ENCODING *)(s1->encoding))->name,
                ((ENCODING *)(s2->encoding))->name);
    }
    if (s2 && s2->encoding != Parrot_fixed_8_encoding_ptr) {
        real_exception(interp, NULL, INVALID_ENCODING,
                "string bitwise_and (%s/%s) unsupported",
                ((ENCODING *)(s2->encoding))->name,
                ((ENCODING *)(s2->encoding))->name);
    }
    /* think about case of dest string is one of the operands */
    if (s1 && s2) {
        minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
    }
    else
        minlen = 0;

    if (dest && *dest) {
        res = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = string_make_direct(interp, NULL, minlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!s1 || !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }
#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_do_dod_run(interp, DOD_trace_stack_FLAG);
#endif

    make_writable(interp, &res, minlen, enum_stringrep_one);

    BITWISE_AND_STRINGS(Parrot_UInt1, Parrot_UInt1,
            Parrot_UInt1, s1, s2, res, minlen);

    res->bufused = res->strlen = minlen;

    if (dest)
        *dest = res;

    return res;
}

#define BITWISE_OR_STRINGS(type1, type2, restype, s1, s2, res, maxlen, op) \
do { \
    const type1 *curr1 = NULL; \
    const type2 *curr2 = NULL; \
    size_t length1 = 0; \
    size_t length2 = 0; \
        restype *dp; \
        size_t _index; \
     \
    if (s1) { \
        curr1 = (type1 *)s1->strstart; \
        length1 = s1->strlen; \
    } \
    if (s2) { \
        curr2 = (type2 *)s2->strstart; \
        length2 = s2->strlen; \
    } \
    dp = (restype *)res->strstart; \
    _index = 0; \
 \
    for ( ; _index < maxlen ; ++curr1, ++curr2, ++dp, ++_index) { \
        if (_index < length1) { \
            if (_index < length2) \
                *dp = *curr1 op *curr2; \
            else \
                *dp = *curr1; \
        } \
        else if (_index < length2) { \
            *dp = *curr2; \
        } \
    } \
} while(0)

/*

FUNCDOC:

Performs a bitwise C<OR> on two Parrot string, performing type and
encoding conversions if necessary. If the third string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

*/

STRING *
string_bitwise_or(Interp *interp, STRING *s1, STRING *s2, STRING **dest)
{
    STRING *res;
    size_t maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interp, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s1->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        maxlen = s1->bufused;
    }
    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interp, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s2->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    if (dest && *dest) {
        res = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = string_make_direct(interp, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_do_dod_run(interp, DOD_trace_stack_FLAG);
#endif

    make_writable(interp, &res, maxlen, enum_stringrep_one);

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen, |);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}

/*

FUNCDOC:

Performs a bitwise C<XOR> on two Parrot strings, performing type and
encoding conversions if necessary. If the second string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

*/

STRING *
string_bitwise_xor(Interp *interp, STRING *s1, STRING *s2, STRING **dest)
{
    STRING *res;
    size_t maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interp, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s1->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        maxlen = s1->bufused;
    }
    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interp, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s2->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        if (s2->bufused > maxlen)
            maxlen = s2->bufused;
    }

    if (dest && *dest) {
        res = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = string_make_direct(interp, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_do_dod_run(interp, DOD_trace_stack_FLAG);
#endif

    make_writable(interp, &res, maxlen, enum_stringrep_one);

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen, ^);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}

#define BITWISE_NOT_STRING(type, s, res) \
do { \
    if (s && res) { \
        const type *curr = (type *)s->strstart; \
        size_t length = s->strlen; \
        Parrot_UInt1 *dp = (Parrot_UInt1 *)res->strstart; \
 \
        for ( ; length ; --length, ++dp, ++curr) \
            *dp = 0xFF & ~ *curr; \
    } \
} while(0)

/*

FUNCDOC:

Performs a bitwise C<NOT> on a Parrot string. If the second string is
not C<NULL> then it is reused, otherwise a new Parrot string is created.

*/

STRING *
string_bitwise_not(Interp *interp, STRING *s, STRING **dest)
{
    STRING *res;
    size_t len;

    if (s) {
        if (s->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interp, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s->encoding))->name,
                    ((ENCODING *)(s->encoding))->name);
        }
        len = s->bufused;
    }
    else
        len = 0;
    if (dest && *dest) {
        res = *dest;
        res->encoding = Parrot_fixed_8_encoding_ptr;
        res->charset  = Parrot_binary_charset_ptr;
    }
    else
        res = string_make_direct(interp, NULL, len,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!len) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interp && GC_DEBUG(interp))
        Parrot_do_dod_run(interp, DOD_trace_stack_FLAG);
#endif

    make_writable(interp, &res, len, enum_stringrep_one);

    res->strlen = res->bufused = len;

    BITWISE_NOT_STRING(Parrot_UInt1, s, res);
    if (dest)
        *dest = res;

    return res;
}

/*

FUNCDOC:

Returns whether the specified Parrot string is true. A string is true
if it is equal to anything other than C<0>, C<""> or C<"0">.

*/

INTVAL
string_bool(Interp *interp, const STRING *s)
{
    const INTVAL len = string_length(interp, s);

    if (len == 0)
        return 0;

    if (len == 1) {

        const UINTVAL c = string_index(interp, s, 0);

        /* relying on character literals being interpreted as ASCII--may
        not be correct on EBCDIC systems. use numeric value instead? */
        if (c == '0')
            /* later, accept other chars with digit value 0? or, no */
            return 0;
    }

    return 1;                   /* it must be true */
}

/*

FUNCDOC:
This is like C<Parrot_snprintf()> except that it writes to and returns a
Parrot string.

Note that C<bytelen> does I<not> include space for a (non-existent)
trailing C<'\0'>. C<dest> may be a C<NULL> pointer, in which case a new
native string will be created. If C<bytelen> is 0, the behaviour becomes
more C<sprintf>-ish than C<snprintf>-like. C<bytelen> is measured in the
encoding of C<*dest>.

*/

STRING*
string_nprintf(Interp *interp,
    STRING *dest, INTVAL bytelen, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interp, format, args);
    va_end(args);

    /*
     * XXX -leo: bytelen with strlen compare
     */
    if (bytelen > 0 && bytelen < (INTVAL)string_length(interp, output)) {
        string_substr(interp, output, 0, bytelen, &output, 1);
    }

    if (dest == NULL) {
        return output;
    }
    else {
        string_set(interp, dest, output);
        return dest;
    }
}

/*


FUNCDOC:

Writes and returns a Parrot string.

*/

STRING*
string_printf(Interp *interp, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interp, format, args);
    va_end(args);

    return output;
}


/*

FUNCDOC:

Converts a numeric Parrot string to an integer value.

A number is such that:

    sign            =  '+' | '-'
    digit           =  "Any code point considered a digit by the chartype"
    indicator       =  'e' | 'E'
    digits          =  digit [digit]...
    decimal-part    =  digits '.' [digits] | ['.'] digits
    exponent-part   =  indicator [sign] digits
    numeric-string  =  [sign] decimal-part [exponent-part]

The integer value is the appropriate integer representation of such a
number, rounding towards zero.

*/

INTVAL
string_to_int(Interp *interp, const STRING *s)
{
#if 1
    INTVAL i = 0;

    if (s) {
        const char *start = s->strstart;
        const char * const end = start + s->bufused;
        int sign = 1;
        INTVAL in_number = 0;

        while (start < end) {
            const unsigned char c = *start;

            if (isdigit(c)) {
                in_number = 1;
                i = i * 10 + (c - '0');
            }
            else if (!in_number) {
                /* we've not yet seen any digits */
                if (c == '-') {
                    sign = -1;
                    in_number = 1;
                }
                else if (c == '+')
                    in_number = 1;
                else if (isspace(c))
                    ;
                else
                    break;
            }
            else {
                break;
            }
            ++start;
        }

        i = i * sign;
    }

    return i;
#else
    return (INTVAL) string_to_num(interp, s);
#endif
}

/*

FUNCDOC:
Same as C<string_to_int()> except that a floating-point value is
returned.

*/

FLOATVAL
string_to_num(Interp *interp, const STRING *s)
{
    FLOATVAL f = 0.0;
    DECL_CONST_CAST;

    if (s) {
        /*
         * XXX C99 atof interpreters 0x prefix
         * XXX would strtod() be better for detecting malformed input?
         */
        char * const cstr = string_to_cstring(interp, const_cast(s));
        const char *p = cstr;
        while (isspace(*p))
            p++;
        f = atof(p);
        /* Not all atof()s return -0 from "-0" */
        if (*p == '-' && f == 0.0)
#if defined(_MSC_VER)
            /* Visual C++ compiles -0.0 to 0.0, so we need to trick
               the compiler. */
            f = 0.0 * -1;
#else
            f = -0.0;
#endif
        string_cstring_free(cstr);
        return f;
    }
    /*
     * results from that code below aren't really exact:
     * float("1e100") != 10**100
     */

    if (s) {
        UINTVAL idx = 0;
        const UINTVAL length = s->strlen;
        int sign = 1;
        INTVAL seen_dot = 0;
        INTVAL seen_e = 0;
        int exp_sign = 0;
        INTVAL in_exp = 0;
        INTVAL in_number = 0;
        INTVAL exponent = 0;
        INTVAL fake_exponent = 0;
        INTVAL digit_family = 0;
        FLOATVAL exp_log=10.0, exp_val=1.0;

        while (idx < length) {
            const UINTVAL c = string_index(interp, s, idx);
            const INTVAL df = Parrot_char_is_digit(interp, c);

            if (df && !digit_family)
                digit_family = df;

            if (df && df == digit_family) {
                if (in_exp) {
                    exponent = exponent*10 +
                        Parrot_char_digit_value(interp, c);
                    if (!exp_sign) {
                        exp_sign = 1;
                    }
                }
                else {
                    /* We're somewhere in the main string of numbers */
                    in_number = 1;
                    f = f * 10 + Parrot_char_digit_value(interp, c);
                    if (seen_dot) {
                        fake_exponent--;
                    }
                }
            }
            else if (!in_number) {
                /* we've not yet seen any digits */
                if (c == '-') { /* XXX: ascii */
                    sign = -1;
                }
                else if (c == '.') {    /* XXX: ascii */
                    seen_dot = 1;
                }
                else {
                    seen_dot = 0;
                    sign = 1;
                }
            }
            else {
                /* we've seen some digits, are we done yet? */
                if (!seen_dot && c == '.' && !in_exp) { /* XXX: ascii */
                    seen_dot = 1;
                }
                else if (!seen_e && (c == 'e' || c == 'E')) { /* XXX: ascii */
                    seen_e = 1;
                    in_exp = 1;
                }
                else if (seen_e && !exp_sign) {
                    if (c == '+') {     /* XXX: ascii */
                        exp_sign = 1;
                    }
                    else if (c == '-') {        /* XXX: ascii */
                        exp_sign = -1;
                    }
                    else {
                        break;  /* e-- is silly */
                    }
                }
                else {
                    break;      /* run out of number, all done */
                }
            }

            ++idx;
        }

        exponent = fake_exponent + exponent * exp_sign;

        if(exponent < 0) {
            exponent = -exponent;
            exp_sign=-1;
        }

        for (;;) {
            if (exponent & 1) {
                exp_val *= exp_log;
                exponent--;
            }
            if (!exponent)
                break;
            exp_log *= exp_log;
            exponent >>= 1;
        }

        if(exp_sign < 0)
            f /= exp_val;
        else
            f *= exp_val;


        if(sign < 0)
            f = -f;
    }

    return f;
}

/*

FUNCDOC:
Returns a Parrot string representation of the specified integer value.

*/

STRING *
string_from_int(Interp *interp, INTVAL i)
{
    char buf[128];
    return int_to_str(interp, buf, i, 10);
}

/*

FUNCDOC:
Returns a Parrot string representation of the specified floating-point
value.

*/

STRING *
string_from_num(Interp *interp, FLOATVAL f)
{
    /* Too damn hard--hand it off to Parrot_sprintf, which'll probably
       use the system sprintf anyway, but has gigantic buffers that are
       awfully hard to overflow. */
    return Parrot_sprintf_c(interp, "%vg", f);
}

/*

FUNCDOC:
Returns a C string for the specified Parrot string. Use
C<string_cstring_free()> to free the string. Failure to do this will
result in a memory leak.

*/

char *
string_to_cstring(Interp *interp, STRING * s)
{
    char *p;
    /*
     * TODO always provide a NUL at end of strings
     *      ICU needs this too for a lot of string functions
     */
    if (s == NULL) {
        return NULL;
    }
    p = mem_sys_allocate(s->bufused + 1);
    memcpy(p, s->strstart, s->bufused);
    p[s->bufused] = 0;
    return p;
}

/*

FUNCDOC:
Free a string created by C<string_to_cstring()>.

TODO - Hopefully this can be a go away at some point, as it's got all
sorts of leak potential otherwise.

*/

void
string_cstring_free(void *ptr)
{
    mem_sys_free(ptr);
}

/*

FUNCDOC:
Replace the specified Parrot string's managed buffer memory by system
memory.

*/

void
string_pin(Interp *interp, STRING * s)
{
    void *memory;
    INTVAL size;

    /* XXX -lt: COW strings have the external_FLAG set, so this will
     *          not work for these
     *          so probably only sysmem should be tested
     */
    Parrot_unmake_COW(interp, s);
    size = PObj_buflen(s);
    memory = mem_sys_allocate(size);
    mem_sys_memcopy(memory, PObj_bufstart(s), size);
    PObj_bufstart(s) = memory;
    s->strstart = memory;
    /* Mark the memory as both from the system and immobile */
    PObj_sysmem_SET(s);
}

/*

FUNCDOC:
Undo a C<string_pin()> so that the string once again uses managed
memory.

*/

void
string_unpin(Interp *interp, STRING * s)
{
    void *memory;
    INTVAL size;

    /* If this string is not marked using system memory,
     * we just don't do this
     */
    if (!(PObj_sysmem_TEST(s)))
        return;

    /* Parrot_unmake_COW(interp, s); XXX -lt: can not be cowed ??? */
    size = PObj_buflen(s);
    /* We need a handle on the fixed memory so we can get rid of it
       later */
    memory = PObj_bufstart(s);
    /* Reallocate it the same size
     * NOTE can't use Parrot_reallocate_string because of the LEA
     * allocator, where this is a noop for the same size
     *
     * We have to block GC here, as we have a pointer to bufstart
     */
    Parrot_block_GC(interp);
    Parrot_allocate_string(interp, s, size);
    Parrot_unblock_GC(interp);
    mem_sys_memcopy(PObj_bufstart(s), memory, size);
    /* Mark the memory as neither immobile nor system allocated */
    PObj_sysmem_CLEAR(s);
    /* Free up the memory */
    mem_sys_free(memory);
}

/*

FUNCDOC:
Returns the hash value for the specified Parrot string, caching it in
C<< s->hashval >>.

*/

size_t
string_hash(Interp *interp, STRING *s, size_t seed)
{
    register size_t h;

    if (!s)
        return seed;

    /* ZZZZZ workaround for something not setting up encodings right */
    saneify_string(s);

    h = CHARSET_COMPUTE_HASH(interp, s, seed);
    s->hashval = h;

    return h;
}

/*

FUNCDOC:
Escape all non-ascii chars to backslash sequences. Control chars that
C<string_unescape_cstring> can handle are esacped as I<\x>, as well
as a double quote character. Other control chars and codepoints < 0x100 are
escaped as I<\xhh>, codepoints up to 0xffff, as I<\uhhhh>, and codepoints
greater than this as I<\x{hh...hh}>.

*/

STRING *
string_escape_string(Interp *interp, STRING *src)
{
    return string_escape_string_delimited(interp, src,
            (UINTVAL) ~0);
}


/*

FUNCDOC:
Like above but limit output to len chars (used for trace output of strings).

*/

STRING *
string_escape_string_delimited(Interp *interp,
        STRING *src, UINTVAL limit)
{
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
    result = string_make_direct(interp, NULL, charlen,
            Parrot_fixed_8_encoding_ptr, Parrot_ascii_charset_ptr, 0);
    /* more work TODO */
    ENCODING_ITER_INIT(interp, src, &iter);
    dp = result->strstart;
    for (i = 0; len > 0; --len) {
        UINTVAL c = iter.get_and_advance(interp, &iter);
        if (c < 0x7f) {
            /* process ASCII chars */
            if (i >= charlen - 2) {
                /* resize - still len codepoints to go */
                charlen += len * 2 + 16;
                Parrot_reallocate_string(interp, result, charlen);
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
            }
            if (c >= 0x20) {
                dp[i++] = (unsigned char)c;
                assert(i < charlen);
                continue;
            }
        }
        /* escape by appending either \uhhhh or \x{hh...} */
        result->bufused = result->strlen = i;
        if (c < 0x0100 || c >= 0x10000)
            hex = Parrot_sprintf_c(interp, "\\x{%x}", c);
        else
            hex = Parrot_sprintf_c(interp, "\\u%04x", c);
        result = string_append(interp, result, hex);
        /* adjust our insert idx */
        i += hex->strlen;
        /* and usable len */
        charlen = PObj_buflen(result);
        dp = result->strstart;
        assert(i < charlen);
    }
    result->bufused = result->strlen = i;
    return result;
}
/*

FUNCDOC:
Unescapes the specified C string. These sequences are covered:

  \xhh        1..2 hex digits
  \ooo        1..3 oct digits
  \cX         control char X
  \x{h..h}    1..8 hex digits
  \uhhhh      4 hex digits
  \Uhhhhhhhh  8 hex digits
  \a, \b, \t, \n, \v, \f, \r, \e

*/


STRING *
string_unescape_cstring(Interp *interp,
    const char *cstring, char delimiter, const char *enc_char)
{
    size_t clength = strlen(cstring);
    STRING *result;
    UINTVAL offs, d;
    Parrot_UInt4 r;
    UINTVAL flags;
    String_iter iter;
    ENCODING *encoding;
    CHARSET *charset;
    char *p;

    if (delimiter && clength)
        --clength;
    /* we are constructing const table strings here */
    flags = PObj_constant_FLAG;
    /* default is ascii */
    if (!enc_char)
        enc_char = "ascii";
    /* check for encoding: */
    p = strchr(enc_char, ':');
    if (p) {
        *p = '\0';
        encoding = Parrot_find_encoding(interp, enc_char);
        if (!encoding) {
            internal_exception(UNIMPLEMENTED,
                    "Can't make '%s' encoding strings", enc_char);
        }
        charset = Parrot_find_charset(interp, p + 1);
        if (!charset) {
            internal_exception(UNIMPLEMENTED,
                    "Can't make '%s' charset strings", p + 1);
        }
        result = string_make_direct(interp, cstring, clength,
                encoding, charset, flags);
        encoding = Parrot_fixed_8_encoding_ptr;
    }
    else {
        result = string_make(interp, cstring, clength, enc_char, flags);
        encoding = result->encoding;
    }
    encoding->iter_init(interp, result, &iter);
    for (offs = d = 0; offs < clength; ++offs) {
        r = (Parrot_UInt4)((unsigned char*)result->strstart)[offs];
        /* There cannot be any NULs within this string.  */
        assert(r != '\0');
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
        assert(d < offs);
        iter.set_and_advance(interp, &iter, r);
        ++d;
    }
    result->strlen = d;
    result->bufused = iter.bytepos;
    if (encoding != result->encoding) {
        /* this also validates the string */
        string_compute_strlen(interp, result);
    }
    else if (!CHARSET_VALIDATE(interp, result, 0)) {
        internal_exception(INVALID_STRING_REPRESENTATION,
                "Malformed string");
    }
    if (result->encoding == Parrot_utf8_encoding_ptr) {
        /* Pythonic unicode flag - get rid of that, Python will
         * probably need a second string class anyway
         */
        PObj_get_FLAGS(result) |= PObj_private7_FLAG;
    }
    return result;
}


/*

FUNCDOC:
Returns a copy of the specified Parrot string converted to upper case.
Non-caseable characters are left unchanged.

TODO - implemented only for ASCII.

*/


STRING *
string_upcase(Interp *interp, const STRING *s)
{
    DECL_CONST_CAST;
    STRING * const dest = string_copy(interp, const_cast(s));
    string_upcase_inplace(interp, dest);
    return dest;
}

/*

FUNCDOC:
Converts the specified Parrot string to upper case.

*/

void
string_upcase_inplace(Interp *interp, STRING *s)
{
    if (!s)
        return;
    Parrot_unmake_COW(interp, s);
    CHARSET_UPCASE(interp, s);
}

/*

FUNCDOC:
Returns a copy of the specified Parrot string converted to lower case.
Non-caseable characters are left unchanged.

*/

STRING *
string_downcase(Interp *interp, const STRING *s)
{
    DECL_CONST_CAST;
    STRING * const dest = string_copy(interp, const_cast(s));
    string_downcase_inplace(interp, dest);
    return dest;
}

/*

FUNCDOC:
Converts the specified Parrot string to lower case.

*/

void
string_downcase_inplace(Interp *interp, STRING *s)
{
    if (!s)
        return;
    /*
     * TODO get rid of all the inplace variants. We have for utf8:
     * * 1 string_copy from the non-incase variant
     * * conversion to utf16, with doubling the buffer
     * * possibly one more reallocation in downcase
     */
    Parrot_unmake_COW(interp, s);
    CHARSET_DOWNCASE(interp, s);
}

/*

FUNCDOC:
Returns a copy of the specified Parrot string converted to title case.
Non-caseable characters are left unchanged.

*/

STRING *
string_titlecase(Interp *interp, const STRING *s)
{
    DECL_CONST_CAST;
    STRING * const dest = string_copy(interp, const_cast(s));
    string_titlecase_inplace(interp, dest);
    return dest;
}

/*

FUNCDOC:
Converts the specified Parrot string to title case.

*/

void
string_titlecase_inplace(Interp *interp, STRING *s)
{
    if (!s)
        return;
    Parrot_unmake_COW(interp, s);
    CHARSET_TITLECASE(interp, s);
}

/*

FUNCDOC:
Perl5ish increment the string. Currently single char only.

*/

STRING *
string_increment(Interp *interp, const STRING *s)
{
    INTVAL o;

    if (string_length(interp, s) != 1)
        internal_exception(1, "increment only for length=1 done");

    o = string_ord(interp, s, 0);
    if ((o >= 'A' && o < 'Z') ||
            (o >= 'a' && o < 'z')) {
        ++o;
        /* TODO increment in place */
        return string_chr(interp, o);
    }
    internal_exception(1, "increment out of range - unimplemented");
    return NULL;
}

/*

FUNCDOC:
Return a C string from a Parrot string.  Both sides are treated
as constants -- i.e. do not resize the result.

*/

const char *
Parrot_string_cstring(Interp *interp, const STRING *str /*NN*/)
{
    /* TODO handle NUL and friends */
    return str->strstart;
}


/*

FUNCDOC:
Return 1 if the codepoint of string C<s> at given offset is in the given
character class C<flags>. See also F<include/parrot/cclass.h> for possible
character classes. Returns 0 otherwise, or if the string is empty or NULL.

*/

INTVAL
Parrot_string_is_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
                        STRING *s, UINTVAL offset)
{
    if (!string_length(interp, s))
        return 0;
    return CHARSET_IS_CCLASS(interp, flags, s, offset);
}

INTVAL
Parrot_string_find_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
                          STRING *s, UINTVAL offset, UINTVAL count)
{
    if (!s)
        return -1;
    return CHARSET_FIND_CCLASS(interp, flags, s, offset, count);
}

INTVAL
Parrot_string_find_not_cclass(Interp *interp, PARROT_CCLASS_FLAGS flags,
                              STRING *s, UINTVAL offset, UINTVAL count)
{
    if (!s)
        return -1;
    return CHARSET_FIND_NOT_CCLASS(interp, flags, s, offset, count);
}

/*

FUNCDOC:
If C<dest> == NULL convert  C<src> to the given charset or encoding inplace,
else return a copy of C<src> with the charset/encoding in dest.

*/

STRING*
Parrot_string_trans_charset(Interp *interp, STRING *src,
        INTVAL charset_nr, STRING *dest)
{
    CHARSET *new_charset;

    if (!src)
        return NULL;
    new_charset = Parrot_get_charset(interp, charset_nr);
    if (!new_charset)
        real_exception(interp, NULL, INVALID_CHARTYPE,
                "charset #%d not found", (int) charset_nr);
    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        if (new_charset == src->charset) {
            dest = Parrot_reuse_COW_reference(interp, src, dest);
            dest->charset = new_charset;
            /* keep encoding */
            return dest;
        }
        dest->charset = new_charset;
        /* get prefered encoding for charset */
        dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interp, dest);
    }
    else {
        if (new_charset == src->charset) {
            return src;
        }
        Parrot_unmake_COW(interp, src);
    }
    return new_charset->to_charset(interp, src, dest);
}

/*

FUNCDOC:
If C<dest> == NULL convert  C<src> to the given charset or encoding inplace,
else return a copy of C<src> with the charset/encoding in dest.

*/

STRING*
Parrot_string_trans_encoding(Interp *interp, STRING *src,
        INTVAL encoding_nr, STRING *dest)
{
    ENCODING *new_encoding;

    if (!src)
        return NULL;
    new_encoding = Parrot_get_encoding(interp, encoding_nr);
    if (!new_encoding)
        real_exception(interp, NULL, INVALID_CHARTYPE,
                "encoding #%d not found", (int) encoding_nr);
    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        dest->encoding = new_encoding;
        if (new_encoding == src->encoding) {
            dest = Parrot_reuse_COW_reference(interp, src, dest);
            return dest;
        }
    }
    else {
        if (new_encoding == src->encoding) {
            return src;
        }
        Parrot_unmake_COW(interp, src);
    }
    return new_encoding->to_encoding(interp, src, dest);
}

STRING *
string_compose(Interp *interp, STRING *src)
{
    if (!src)
        return NULL;
    if (!src->strlen)
        return string_make_empty(interp, enum_stringrep_one, 0);
    return CHARSET_COMPOSE(interp, src);
}

STRING*
string_join(Interp *interp, STRING *j, PMC *ar)
{
    STRING *res;
    STRING *s;
    int i, ar_len = VTABLE_elements(interp, ar);

    if (ar_len == 0) {
        return string_make_empty(interp, enum_stringrep_one, 0);
    }
    s = VTABLE_get_string_keyed_int(interp, ar, 0);
    res = string_copy(interp, s);
    for (i = 1; i < ar_len; ++i) {
        res = string_append(interp, res, j);
        s = VTABLE_get_string_keyed_int(interp, ar, i);
        res = string_append(interp, res, s);
    }
    return res;
}

PMC*
string_split(Interp *interp, STRING *delim, STRING *str)
{
    PMC * const res =  pmc_new(interp, enum_class_ResizableStringArray);
    const int slen = string_length(interp, str);
    int dlen;
    int ps,pe;

    if (!slen)
        return res;

    dlen = string_length(interp, delim);
    if (dlen == 0) {
        int i;
        VTABLE_set_integer_native(interp, res, slen);
        for (i = 0; i < slen; ++i) {
           STRING * const p = string_substr(interp, str, i, 1, NULL, 0);
           VTABLE_set_string_keyed_int(interp, res, i, p);
        }
        return res;
    }

    pe = string_str_index(interp,str,delim,0);
    if (pe < 0) {
        VTABLE_push_string(interp,res,str);
        return res;
    }
    ps = 0;
    while (ps <= slen) {
        const int pl = pe - ps;
        STRING * const tstr = string_substr(interp, str, ps, pl, NULL, 0);
        VTABLE_push_string(interp,res,tstr);
        ps = pe + string_length(interp,delim);
        if (ps > slen)
            break;
        pe = string_str_index(interp,str,delim,ps);
        if (pe < 0)
            pe = slen;
    }
    return res;
}

/*

=head1 SEE ALSO

=over

=item F<src/string_primitives.c>

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
