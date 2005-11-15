/*
Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
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
    assert(s->encoding); \
    assert(s->charset)


/*


=head2 String COW support

=over 4

=item C<static void
Parrot_unmake_COW(Interp *interpreter, STRING *s)>

If the specified Parrot string is copy-on-write then the memory is
copied over and the copy-on-write flag is cleared.

=cut

*/

void
Parrot_unmake_COW(Interp *interpreter, STRING *s)
{
    /* COW_FLAG | constant_FLAG | external_FLAG) */
    if (PObj_is_cowed_TESTALL(s)) {
        STRING for_alloc;

        /* Create new pool data for this header to use,
         * independent of the original COW data */
        PObj_constant_CLEAR(s);
        /*
         * allocate a dummy strings memory
         * buflen might be bigger and used, so pass this length
         * also be sure not to allocate from the constant pool
         */
        PObj_flags_CLEARALL(&for_alloc);
        Parrot_allocate_string(interpreter, &for_alloc, PObj_buflen(s));
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
        /* COW_FLAG | external_FLAG | bufstart_external_FLAG immobile_FLAG */
        PObj_is_external_CLEARALL(s);
    }

    s->hashval = 0;
}

/*

=item C<static void
copy_string_header(Interp *interpreter, String *dest, String *src)>

Copies the string header from the first Parrot string to the second.

=cut

*/

static void
copy_string_header(Interp *interpreter, String *dest, String *src)
{
#if ! DISABLE_GC_DEBUG
    UINTVAL vers;
    vers= PObj_version(dest);
#endif
    memcpy(dest, src, sizeof(String));
#if ! DISABLE_GC_DEBUG
    PObj_version(dest) = vers;
#endif
}

/*

=item C<static STRING *
Parrot_make_COW_reference(Interp *interpreter, STRING *s)>

Creates a copy-on-write string by cloning a string header without
allocating a new buffer.

=cut

*/

STRING *
Parrot_make_COW_reference(Interp *interpreter, STRING *s)
{
    STRING *d;
    if (s == NULL) {
        return NULL;
    }
    if (PObj_constant_TEST(s)) {
        PObj_constant_CLEAR(s);
        d = new_string_header(interpreter, PObj_get_FLAGS(s));
        PObj_is_cowed_SETALL(s);
        copy_string_header(interpreter, d, s);
        PObj_constant_CLEAR(d);
    }
    else {
        d = new_string_header(interpreter, PObj_get_FLAGS(s));
        PObj_COW_SET(s);
        copy_string_header(interpreter, d, s);
        PObj_sysmem_CLEAR(d);
    }
    return d;
}
/*

=item C<static STRING *
Parrot_reuse_COW_reference(Interp *interpreter, STRING *s, STRING *reuse)>

Creates a copy-on-write string by cloning a string header without
allocating a new buffer. Doesn't allocate a new string header, instead
using the one passed in

=cut

*/

void
Parrot_reuse_COW_reference(Interp *interpreter, STRING *s, STRING *d)
{
    if (s == NULL) {
        return;
    }
    if (PObj_constant_TEST(s)) {
        PObj_constant_CLEAR(s);
        PObj_is_cowed_SETALL(s);
        copy_string_header(interpreter, d, s);
        PObj_constant_CLEAR(d);
    }
    else {
        PObj_COW_SET(s);
        copy_string_header(interpreter, d, s);
        PObj_sysmem_CLEAR(d);
    }
}

/*

=item C<static void
Parrot_make_COW_reference_from_header(Interp *interpreter,
        STRING *s, STRING *d)>

Makes the second Parrot string a copy-on-write reference to first.

=cut

*/

static void
Parrot_make_COW_reference_from_header(Interp *interpreter,
        STRING *s, STRING *d)
{
    if (PObj_constant_TEST(s)) {
        PObj_is_cowed_SETALL(s);
        copy_string_header(interpreter, d, s);
        PObj_constant_CLEAR(d);
    }
    else {
        PObj_COW_SET(s);
        copy_string_header(interpreter, d, s);
    }
}

/*

=item C<STRING *
string_set(Interp *interpreter, STRING *dest, STRING *src)>

Makes the contents of first Parrot string a copy of the contents of
second.

=cut

*/

STRING *
string_set(Interp *interpreter, STRING *dest, STRING *src)
{
    if (!src)
        return NULL;
    if (dest == src)
        return dest;
    if (dest) { /* && dest != src */
        /* they are different, dest is not an external string */
#ifdef GC_IS_MALLOC
        if (!PObj_is_external_TESTALL(dest) && PObj_bufstart(dest)) {
            mem_sys_free((INTVAL*)PObj_bufstart(dest) - 1);
        }
#endif
        Parrot_make_COW_reference_from_header(interpreter, src, dest);
    }
    else
        dest = Parrot_make_COW_reference(interpreter, src);
    return dest;
}

/*

=back

=head2 Basic String Functions

Creation, enlargement, etc.

=over 4

=item C<void
string_init(Interp*)>

Initializes the Parrot string subsystem.

=item C<void
string_deinit(Interp*)>

De-Initializes the Parrot string subsystem.

=cut

*/

#include "parrot/string_private_cstring.h"

void
string_init(Parrot_Interp interpreter)
{
    size_t i;
    /*
     * when string_init is called, the config hash isn't created
     * so we can't get at the runtime path
     * XXX do we still need this --leo
     */
#if 0
    char *data_dir;
    int free_data_dir = 0;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
#endif

    if (!interpreter->parent_interpreter) {
        /* Load in the basic encodings and charsets
         */
        Parrot_charsets_encodings_init(interpreter);

#if 0
        /* DEFAULT_ICU_DATA_DIR is configured at build time, or it may be
           set through the $PARROT_ICU_DATA_DIR environment variable. Need
           a way to specify this via the command line as well. */
        data_dir = Parrot_getenv("PARROT_ICU_DATA_DIR", &free_data_dir);
        if (data_dir == NULL) {
            const char *prefix;
            char *p, *build_path;
            build_path = data_dir = const_cast(DEFAULT_ICU_DATA_DIR);
            /*
             * if the installed --prefix directory exists then use it
             * but only, if data_dir isn't empty
             */
            if (!*data_dir)
                goto no_set;
            prefix = Parrot_get_runtime_prefix(interpreter, NULL);
            if (prefix && (p = strstr(build_path, "blib"))) {
                /* .../blib/lib/... */
                --p;        /* slash or backslash - XXX FIXME - assumes single char */
                data_dir = mem_sys_allocate(strlen(prefix) + strlen(p) + 1);
                strcpy(data_dir, prefix);
                strcat(data_dir, p);
                free_data_dir = 1;
            }
        }
        string_set_data_directory(data_dir);
no_set:
        if (free_data_dir)
            mem_sys_free(const_cast(data_dir));
#endif
    }

    /*
     * initialize the constant string table
     */
    if (interpreter->parent_interpreter) {
        interpreter->const_cstring_table =
            interpreter->parent_interpreter->const_cstring_table;
        return;
    }
    interpreter->const_cstring_table = mem_sys_allocate(sizeof(STRING*) *
        sizeof(parrot_cstrings)/sizeof(parrot_cstrings[0]));
    for (i = 0; i < sizeof(parrot_cstrings)/sizeof(parrot_cstrings[0]); ++i) {
        interpreter->const_cstring_table[i] =
            const_string(interpreter, parrot_cstrings[i].string);
        /* TODO construct string here and valid hashval */
    }

}

void
string_deinit(Parrot_Interp interpreter)
{
    mem_sys_free(interpreter->const_cstring_table);
    interpreter->const_cstring_table = NULL;
    Parrot_charsets_encodings_deinit(interpreter);
}

/*

=item C<UINTVAL
string_capacity(Interp *interpreter, STRING *s)>

Returns the capacity of the specified Parrot string in bytes, that
is how many bytes can be appended onto strstart.

=cut

*/

UINTVAL
string_capacity(Interp *interpreter, STRING *s)
{
    return ((ptrcast_t)PObj_bufstart(s) + PObj_buflen(s) -
            (ptrcast_t)s->strstart);
}

/*

=item C<STRING *
string_make_empty(Interp *interpreter,
    parrot_string_representation_t representation, UINTVAL capacity)>

Creates and returns an empty Parrot string.

=cut

*/

STRING *
string_make_empty(Interp *interpreter,
    parrot_string_representation_t representation, UINTVAL capacity)
{
    STRING *s;

    s = new_string_header(interpreter, 0);

    /*
     * TODO adapt string creation functions
     */
    if (representation == enum_stringrep_one) {
        s->charset = PARROT_DEFAULT_CHARSET;
        s->encoding = CHARSET_GET_PREFERRED_ENCODING(interpreter, s);;
    } else {
        internal_exception(INVALID_CHARTYPE, "Unsupported representation");
    }

    Parrot_allocate_string(interpreter,
        s, string_max_bytes(interpreter, s, capacity));

    return s;
}

/*

=item C<CHARSET *string_rep_compatible (Interp *, STRING *a, const STRING *b,
        ENCODING **e)>

Find the "lowest" possible charset and encoding for the given string. E.g.

  ascii <op> utf8 => utf8
                  => ascii, B<if> C<STRING *b> has ascii chars only.

Returs NULL, if no compatible string representation can be found.

=cut

*/

CHARSET *
string_rep_compatible (Interp *interpreter, STRING *a, const STRING *b,
        ENCODING **e)
{
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

=item C<STRING *
string_append(Interp *interpreter,
    STRING *a, STRING *b, UINTVAL Uflags)>

Take in two Parrot strings and append the second to the first.

=cut

*/

STRING *
string_append(Interp *interpreter,
    STRING *a, STRING *b, UINTVAL Uflags)
{
    UINTVAL a_capacity, b_len;
    UINTVAL total_length;
    CHARSET *cs;
    ENCODING *enc;

    /*
     * XXX should this be a CHARSET method?
     */

    UNUSED(Uflags);

    /* If B isn't real, we just bail */
    b_len = string_length(interpreter, b);
    if (!b_len) {
        return a;
    }

    /* Is A real? */
    if (a == NULL)
        return string_copy(interpreter, b);

    saneify_string(a);
    saneify_string(b);

    /* If the destination's constant, or external then just fall back to
       string_concat */
    if (PObj_is_cowed_TESTALL(a)) {
        return string_concat(interpreter, a, b, Uflags);
    }

    cs = string_rep_compatible(interpreter, a, b, &enc);
    if (cs != NULL) {
        a->charset = cs;
        a->encoding = enc;
    }
    else {
        /* upgrade to utf16 */
        Parrot_utf16_encoding_ptr->to_encoding(interpreter, a, NULL);
        b = Parrot_utf16_encoding_ptr->to_encoding(interpreter, b,
                new_string_header(interpreter, 0));
        /*
         * result could be mixed ucs2 / utf16
         */
        if (b->encoding == Parrot_utf16_encoding_ptr)
            a->encoding = Parrot_utf16_encoding_ptr;
    }
    /*
     * calc usable and total bytes
     */
    a_capacity = string_capacity(interpreter, a);
    total_length = a->bufused + b->bufused;

    /* make sure A's big enough for both  */
    if (a_capacity < total_length) {
        Parrot_reallocate_string(interpreter, a,
                total_length + EXTRA_SIZE);
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

=item C<
STRING *
string_from_cstring(Interp *interpreter,
    const void *buffer, UINTVAL len)>

Make a Parrot string from a specified C string.

=cut

*/

STRING *
string_from_cstring(Interp *interpreter,
    const void *buffer, UINTVAL len)
{
    return string_make_direct(interpreter, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                              PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                              0); /* Force an 8-bit encoding at some
                                     point? */
}

/*

=item C<
STRING *
string_from_const_cstring(Interp *interpreter,
    const void *buffer, UINTVAL len)>

Make a Parrot string from a specified C string.

=cut

*/

STRING *
string_from_const_cstring(Interp *interpreter,
    const void *buffer, UINTVAL len)
{
    return string_make_direct(interpreter, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                          PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET, 0);
    /* make this utf-8 eventually? */
}

/*

=item C<const char*
string_primary_encoding_for_representation(Interp *interpreter,
    parrot_string_representation_t representation)>

Returns the primary encoding for the specified representation.

This is needed for packfile unpacking, unless we just always use UTF-8
or BOCU.

=cut

*/

const char*
string_primary_encoding_for_representation(Interp *interpreter,
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

=item C<STRING *
const_string(Interp *interpreter, const char *buffer)>

Creates and returns a constant Parrot string.

=cut

*/

STRING *
const_string(Interp *interpreter, const char *buffer)
{
    /* TODO cache the strings */
    return string_make_direct(interpreter, buffer, strlen(buffer),
                       PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
                       PObj_external_FLAG|PObj_constant_FLAG);
}

/*

=item C<STRING *
string_make(Interp *interpreter, const void *buffer,
    UINTVAL len, const char *charset_name, UINTVAL flags)>

Creates and returns a new Parrot string using C<len> bytes of string
data read from C<buffer>.

The value of C<charset_name> specifies the string's representation.
The currently recognised values are:

    'iso-8859-1'
    'ascii'
    'binary'

If C<charset> is unspecified the default charset 'ascii' will be
used.

The value of C<flags> is optionally one or more C<PObj_*> flags C<OR>-ed
together.

=cut

*/

STRING *
string_make(Interp *interpreter, const void *buffer,
    UINTVAL len, const char *charset_name, UINTVAL flags)
{
    ENCODING *encoding;
    CHARSET *charset;

    if (!charset_name) {
        charset_name = "ascii";
    }
    charset = Parrot_find_charset(interpreter, charset_name);
    if (!charset) {
        internal_exception(UNIMPLEMENTED,
                "Can't make '%s' charset strings", charset_name);
    }
    encoding = charset->preferred_encoding;
    return string_make_direct(interpreter, buffer, len,
            encoding, charset, flags);

}

STRING *
string_make_direct(Interp *interpreter, const void *buffer,
        UINTVAL len, ENCODING *encoding, CHARSET *charset, UINTVAL flags)
{
    STRING *s;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    s = new_string_header(interpreter, flags);
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
        PObj_bufstart_external_SET(s);
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            string_compute_strlen(interpreter, s);

        return s;
    }

    Parrot_allocate_string(interpreter, s, len);

    if (buffer) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
        if (encoding == Parrot_fixed_8_encoding_ptr)
            s->strlen = len;
        else
            string_compute_strlen(interpreter, s);
    }
    else {
        s->strlen = s->bufused = 0;
    }

    return s;
}

/*

=item C<STRING *
string_grow(Interp * interpreter, STRING * s, INTVAL addlen)>

Grows the Parrot string's buffer by the specified number of characters.

=cut

*/

STRING *
string_grow(Interp * interpreter, STRING * s, INTVAL addlen)
{
    Parrot_unmake_COW(interpreter,s);

    /* Don't check buflen, if we are here, we already checked. */
    Parrot_reallocate_string(interpreter,
        s, PObj_buflen(s) + string_max_bytes(interpreter, s, addlen));
    return s;
}

/*

=back

=head2 Ordinary user-visible string operations

=over 4

=item C<UINTVAL
string_length(Interp * interpreter, const STRING *s)>

Returns the number of characters in the specified Parrot string.

=cut

*/

UINTVAL
string_length(Interp * interpreter, const STRING *s)
{
    return s ? s->strlen : 0;
}
/*

=item C<INTVAL
string_index(Interp * interpreter, const STRING *s, UINTVAL idx)>

Returns the character (or glyph, depending upon the string's encoding)
This is to abstract the process of finding the Nth character in a
(possibly unicode or JIS-encoded) string, the idea being that once the
encoding functions are fleshed out, this function can do the right
thing.

Note that this is not range-checked.

=cut

*/

INTVAL
string_index(Interp * interpreter, const STRING *s, UINTVAL idx)
{
    saneify_string(s);
    return (INTVAL)CHARSET_GET_CODEPOINT(interpreter, s, idx);
}

/*

=item C<INTVAL
string_str_index(Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start)>

Returns the character position of the second Parrot string in the first
at or after C<start>. The return value is a (0 based) offset in
characters, not bytes. If second string is not specified, then return
-1.

=cut

*/

INTVAL
string_str_index(Interp *interpreter, const STRING *s,
        const STRING *s2, INTVAL start)
{
    STRING *src, *search;
    UINTVAL len;

    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (start < 0)
        return -1;
    len = string_length(interpreter, s);
    if (!len)
        return -1;
    if (start >= (INTVAL)len)
        return -1;
    if (!string_length(interpreter, s2))
        return -1;

    saneify_string(s);
    saneify_string(s2);
    src = const_cast(s);
    search = const_cast(s2);

    return CHARSET_INDEX(interpreter, src, search, start);
}

/*

=item C<INTVAL
string_ord(Interp *interpreter, const STRING *s, INTVAL idx)>

Returns the codepoint at a given index into a string. Negative indexes
are treated as counting from the end of the string.

=cut

*/

INTVAL
string_ord(Interp *interpreter, const STRING *s, INTVAL idx)
{
    UINTVAL len;

    len = string_length(interpreter, s);

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

        return string_index(interpreter, s, true_index);
    }
    return -1;
}

/*

=item C<STRING *
string_chr(Interp *interpreter, UINTVAL character)>

Returns a single character Parrot string.

TODO - Allow this to take an array of characters?

=cut

*/

STRING *
string_chr(Interp *interpreter, UINTVAL character)
{
    if (character > 0xff)
        return Parrot_unicode_charset_ptr->string_from_codepoint(interpreter,
                character);
    else
        return Parrot_iso_8859_1_charset_ptr->string_from_codepoint(interpreter,
                character);
}


/*

=item C<STRING *
string_copy(Interp *interpreter, STRING *s)>

Creates and returns a copy of the specified Parrot string.

=cut

*/

STRING *
string_copy(Interp *interpreter, STRING *s)
{
    return Parrot_make_COW_reference(interpreter, s);
}


/*

=back

=head2 Vtable Dispatch Functions

=over 4

=item C<INTVAL
string_compute_strlen(Interp *interpreter, STRING *s)>

Calculates and returns the number of characters in the specified Parrot
string.

=cut

*/

INTVAL
string_compute_strlen(Interp *interpreter, STRING *s)
{
    s->strlen = CHARSET_CODEPOINTS(interpreter, s);
    return s->strlen;
}

/*

=item C<INTVAL
string_max_bytes(Interp *interpreter, STRING *s, INTVAL nchars)>

Returns the number of bytes required to safely contain the specified number
of characters in the specified Parrot string's representation.

=cut

*/

INTVAL
string_max_bytes(Interp *interpreter, STRING *s, INTVAL nchars)
{
    assert(s->encoding);
    return ENCODING_MAX_BYTES_PER_CODEPOINT(interpreter, s) * nchars;
}

/*

=item C<STRING *
string_concat(Interp *interpreter,
    STRING *a, STRING *b, UINTVAL Uflags)>

Concatenates two Parrot string. If necessary, converts the second
string's encoding and/or type to match those of the first string. If
either string is C<NULL>, then a copy of the non-C<NULL> string is
returned. If both strings are C<NULL>, then a new zero-length string is
created and returned.

=cut

*/

STRING *
string_concat(Interp *interpreter,
    STRING *a, STRING *b, UINTVAL Uflags)
{
    if (a != NULL && a->strlen != 0) {
        if (b != NULL && b->strlen != 0) {
            CHARSET *cs;
            ENCODING *enc;
            STRING *result;

            cs = string_rep_compatible(interpreter, a, b, &enc);
            if (!cs) {
                cs = a->charset;
                enc =a->encoding;
            }
            result =
                string_make_direct(interpreter, NULL,
                        a->bufused + b->bufused,
                        enc, cs, 0);

            string_append(interpreter, result, a, Uflags);
            string_append(interpreter, result, b, Uflags);

            return result;
        }
        else {
            return string_copy(interpreter, a);
        }
    }
    else {
        if (b != NULL) {
            return string_copy(interpreter, b);
        }
        else {
            return string_make(interpreter, NULL, 0, NULL, Uflags);
        }
    }
}

/*

=item C<STRING *
string_repeat(Interp *interpreter, const STRING *s,
    UINTVAL num, STRING **d)>

Repeats the specified Parrot string I<num> times and stores the result
in the second string, and returns it. The second string is created if
necessary.

=cut

*/

STRING *
string_repeat(Interp *interpreter, const STRING *s,
    UINTVAL num, STRING **d)
{
    STRING *dest;
    UINTVAL i;

    dest = string_make_direct(interpreter, NULL,
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

=item C<STRING *
string_substr(Interp *interpreter, STRING *src,
    INTVAL offset, INTVAL length, STRING **d, int replace_dest)>

Copies the substring of length C<length> from C<offset> from the
specified Parrot string and stores it in C<**d>, allocating memory if
necessary. The substring is also returned.

=cut

*/

STRING *
string_substr(Interp *interpreter, STRING *src,
    INTVAL offset, INTVAL length, STRING **d, int replace_dest)
{
    STRING *dest;
    UINTVAL true_offset;
    UINTVAL true_length;

    saneify_string(src);
    true_offset = (UINTVAL)offset;

    /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
    if (offset == (INTVAL)string_length(interpreter, src) || length < 1) {
        return string_make_empty(interpreter, enum_stringrep_one, 0);
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
        CHARSET_GET_CODEPOINTS_INPLACE(interpreter, src,
                true_offset, true_length, *d);
        dest = *d;
    }
    else
        dest = CHARSET_GET_CODEPOINTS(interpreter, src, true_offset,
                true_length);

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*

=item C<STRING *
string_replace(Interp *interpreter, STRING *src,
    INTVAL offset, INTVAL length, STRING *rep, STRING **d)>

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

=cut

*/

STRING *
string_replace(Interp *interpreter, STRING *src,
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
        dest = CHARSET_GET_CODEPOINTS(interpreter, src,
                true_offset, true_length);
        *d = dest;
    }

    /* may have different reps..... */
    cs = string_rep_compatible(interpreter, src, rep, &enc);
    if (!cs) {
        Parrot_utf16_encoding_ptr->to_encoding(interpreter, src, NULL);
        rep = Parrot_utf16_encoding_ptr->to_encoding(interpreter, rep,
                new_string_header(interpreter, 0));
    }
    else {
        src->charset = cs;
        src->encoding = enc;
    }

    /* get byte position of the part that will be replaced */
    ENCODING_ITER_INIT(interpreter, src, &iter);
    iter.set_position(interpreter, &iter, true_offset);
    start_byte = iter.bytepos;
    iter.set_position(interpreter, &iter, true_offset + true_length);
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
        Parrot_unmake_COW(interpreter, src);

        if(diff != 0) {
            mem_sys_memmove((char*)src->strstart + start_byte + rep->bufused,
                    (char*)src->strstart + end_byte,
                    src->bufused - end_byte);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char*)src->strstart + start_byte,
                rep->strstart, rep->bufused);
        if(diff != 0)
            (void)string_compute_strlen(interpreter, src);
    }
    /*
     * Replacement is larger than avail buffer, grow the string
     */
    else {
        /* diff is negative here, make it positive */
        diff = -(diff);
        string_grow(interpreter, src, diff);

        /* Move the end of old string that isn't replaced to new offset
         * first */
        mem_sys_memmove((char*)src->strstart + end_byte + diff,
                (char*)src->strstart + end_byte,
                src->bufused - end_byte);
        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->strstart + start_byte, rep->strstart,
                rep->bufused);
        src->bufused += diff;
        (void)string_compute_strlen(interpreter, src);
    }

    /* src is modified, now return the original substring */
    return dest;
}

/*

=item C<STRING *
string_chopn(Interp *interpreter, STRING *s, INTVAL n, int in_place)>

Chops off the last C<n> characters of the specified Parrot string. If
C<n> is negative, cuts the string after C<+n> characters.
If C<in_place> is true, the string is chopped in places, else a copy
of the string is chopped and returned.

=cut

*/

STRING *
string_chopn(Interp *interpreter, STRING *s, INTVAL n, int in_place)
{
    UINTVAL new_length, uchar_size;
    String_iter iter;

    if (!s)
        return NULL;
    if (in_place) {
        /*
         *  constant or external strings can't be chopped inplace
         */
        Parrot_unmake_COW(interpreter, s);
    }
    else
        s = string_copy(interpreter, s);

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
        ENCODING_ITER_INIT(interpreter, s, &iter);
        iter.set_position(interpreter, &iter, new_length);
        s->bufused = iter.bytepos;
    }

    return s;
}


INTVAL
string_compare(Interp *interpreter,
    STRING *s1, STRING *s2)
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

    return CHARSET_COMPARE(interpreter, s1, s2);
}


/*

=item C<INTVAL
string_equal(Interp *interpreter, STRING *s1, STRING *s2)>

Compares two Parrot strings, performing type and encoding conversions if
necessary.

Note that this function returns 0 if the strings are equal and 1
otherwise.

=cut

*/

INTVAL
string_equal(Interp *interpreter, STRING *s1, STRING *s2)
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
    return CHARSET_COMPARE(interpreter, s1, s2);

}

/*

=item C<static void
make_writable(Interp *interpreter, STRING **s,
    const size_t len, parrot_string_representation_t representation)>

Makes the specified Parrot string writable with minimum length C<len>.
The C<representation> argument is required in case a new Parrot string
has to be created.

=cut

*/

static void
make_writable(Interp *interpreter, STRING **s,
    const size_t len, parrot_string_representation_t representation)
{
    if (!*s)
        *s = string_make_empty(interpreter, representation, len);
    else if ((*s)->strlen < len)
        string_grow(interpreter, *s, len - (*s)->strlen);
    else if (PObj_is_cowed_TESTALL(*s))
        Parrot_unmake_COW(interpreter, *s);
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

=item C<STRING *
string_bitwise_and(Interp *interpreter, STRING *s1,
    STRING *s2, STRING **dest)>

Performs a bitwise C<AND> on two Parrot string, performing type and
encoding conversions if necessary. If the second string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

=cut

*/

STRING *
string_bitwise_and(Interp *interpreter, STRING *s1,
    STRING *s2, STRING **dest)
{
    STRING *res = NULL;
    size_t minlen;

    /* we could also trans_charset to iso-8859-1 */
    if (s1 && s1->encoding != Parrot_fixed_8_encoding_ptr) {
        real_exception(interpreter, NULL, INVALID_ENCODING,
                "string bitwise_and (%s/%s) unsupported",
                ((ENCODING *)(s1->encoding))->name,
                ((ENCODING *)(s2->encoding))->name);
    }
    if (s2 && s2->encoding != Parrot_fixed_8_encoding_ptr) {
        real_exception(interpreter, NULL, INVALID_ENCODING,
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
        res = string_make_direct(interpreter, NULL, minlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!s1 || !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }
#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, minlen, enum_stringrep_one);

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
    if (s1) \
    { \
        curr1 = (type1 *)s1->strstart; \
        length1 = s1->strlen; \
    } \
     \
    if (s2) \
    { \
        curr2 = (type2 *)s2->strstart; \
        length2 = s2->strlen; \
    } \
 \
    dp = (restype *)res->strstart; \
    _index = 0; \
 \
    for ( ; _index < maxlen ; ++curr1, ++curr2, ++dp, ++_index) \
    { \
        if (_index < length1) \
        { \
            if (_index < length2) \
                *dp = *curr1 op *curr2; \
            else \
                *dp = *curr1; \
        } \
        else if (_index < length2) \
        { \
            *dp = *curr2; \
        } \
    } \
} while(0)

/*

=item C<STRING *
string_bitwise_or(Interp *interpreter,
    STRING *s1, STRING *s2, STRING **dest)>

Performs a bitwise C<OR> on two Parrot string, performing type and
encoding conversions if necessary. If the second string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

=cut

*/

STRING *
string_bitwise_or(Interp *interpreter,
    STRING *s1, STRING *s2, STRING **dest)
{
    STRING *res;
    size_t maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interpreter, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s1->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        maxlen = s1->bufused;
    }
    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interpreter, NULL, INVALID_ENCODING,
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
        res = string_make_direct(interpreter, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, maxlen, enum_stringrep_one);

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen, |);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}

/*

=item C<STRING *
string_bitwise_xor(Interp *interpreter,
    STRING *s1, STRING *s2, STRING **dest)>

Performs a bitwise C<XOR> on two Parrot strings, performing type and
encoding conversions if necessary. If the second string is not C<NULL>
then it is reused, otherwise a new Parrot string is created.

=cut

*/

STRING *
string_bitwise_xor(Interp *interpreter,
    STRING *s1, STRING *s2, STRING **dest)
{
    STRING *res;
    size_t maxlen = 0;

    if (s1) {
        if (s1->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interpreter, NULL, INVALID_ENCODING,
                    "string bitwise_and (%s/%s) unsupported",
                    ((ENCODING *)(s1->encoding))->name,
                    ((ENCODING *)(s2->encoding))->name);
        }
        maxlen = s1->bufused;
    }
    if (s2) {
        if (s2->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interpreter, NULL, INVALID_ENCODING,
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
        res = string_make_direct(interpreter, NULL, maxlen,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!maxlen) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, maxlen, enum_stringrep_one);

    BITWISE_OR_STRINGS(Parrot_UInt1, Parrot_UInt1, Parrot_UInt1,
            s1, s2, res, maxlen, ^);
    res->bufused = res->strlen = maxlen;

    if (dest)
        *dest = res;

    return res;
}

#define BITWISE_NOT_STRING(type, s, res) \
do { \
    if (s && res) \
    { \
        const type *curr = (type *)s->strstart; \
        size_t length = s->strlen; \
        Parrot_UInt1 *dp = (Parrot_UInt1 *)res->strstart; \
 \
        for ( ; length ; --length, ++dp, ++curr) \
        { \
            *dp = 0xFF & ~ *curr; \
        } \
    } \
} while(0)

/*

=item C<STRING *
string_bitwise_not(Interp *interpreter,
    STRING *s, STRING **dest)>

Performs a bitwise C<NOT> on a Parrot string. If the second string is
not C<NULL> then it is reused, otherwise a new Parrot string is created.

=cut

*/

STRING *
string_bitwise_not(Interp *interpreter,
    STRING *s, STRING **dest)
{
    STRING *res;
    size_t len;

    if (s) {
        if (s->encoding != Parrot_fixed_8_encoding_ptr) {
            real_exception(interpreter, NULL, INVALID_ENCODING,
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
        res = string_make_direct(interpreter, NULL, len,
                Parrot_fixed_8_encoding_ptr, Parrot_binary_charset_ptr, 0);

    if (!len) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, len, enum_stringrep_one);

    res->strlen = res->bufused = len;

    BITWISE_NOT_STRING(Parrot_UInt1, s, res);
    if (dest)
        *dest = res;

    return res;
}

/*

=item C<INTVAL
string_bool(Interp *interpreter, const STRING *s)>

Returns whether the specified Parrot string is true. A string is true
if it is equal to anything other than C<0>, C<""> or C<"0">.

=cut

*/

INTVAL
string_bool(Interp *interpreter, const STRING *s)
{
    INTVAL len;

    len = string_length(interpreter, s);

    if (len == 0) {
        return 0;
    }

    if (len == 1) {

        UINTVAL c = string_index(interpreter, s, 0);

        /* relying on character literals being interpreted as ascii--may
        not be correct on ebdic systems. use numeric value instead? */
        if (c == '0') {
            /* later, accept other chars with digit value 0? or, no */
            return 0;
        }
    }

    return 1;                   /* it must be true */
}

/*

=item C<STRING*
string_nprintf(Interp *interpreter,
    STRING *dest, INTVAL bytelen, const char *format, ...)>

This is like C<Parrot_snprintf()> except that it writes to and returns a
Parrot string.

Note that C<bytelen> does I<not> include space for a (non-existent)
trailing C<'\0'>. C<dest> may be a C<NULL> pointer, in which case a new
native string will be created. If C<bytelen> is 0, the behaviour becomes
more C<sprintf>-ish than C<snprintf>-like. C<bytelen> is measured in the
encoding of C<*dest>.

=cut

*/

STRING*
string_nprintf(Interp *interpreter,
    STRING *dest, INTVAL bytelen, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interpreter, format, args);
    va_end(args);

    /*
     * XXX -leo: bytelen with strlen compare
     */
    if (bytelen > 0 && bytelen < (INTVAL)string_length(interpreter, output)) {
        string_substr(interpreter, output, 0, bytelen, &output, 1);
    }

    if (dest == NULL) {
        return output;
    }
    else {
        string_set(interpreter, dest, output);
        return dest;
    }
}

/*

=item C<STRING*
string_printf(Interp *interpreter, const char *format, ...)>

Writes and returns a Parrot string.

=cut

*/

STRING*
string_printf(Interp *interpreter, const char *format, ...)
{
    STRING *output;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interpreter, format, args);
    va_end(args);

    return output;
}


/*

=item C<INTVAL
string_to_int(Interp *interpreter, const STRING *s)>

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

=cut

*/

INTVAL
string_to_int(Interp *interpreter, const STRING *s)
{
#if 0
    INTVAL i = 0;

    if (s) {
        const char *start = s->strstart;
        const char *end = start + s->bufused;
        int sign = 1;
        INTVAL in_number = 0;

        while (start < end) {
            UINTVAL c = s->encoding->decode(start);

            if (Parrot_char_is_digit(s->type,c)) {
                in_number = 1;
                i = i * 10 + (c - '0');
            }
            else if (!in_number) {
                /* we've not yet seen any digits */
                if (c == '-') {
                    sign = -1;
                }
                else {
                    sign = 1;
                }
            }
            else {
                break;
            }

            start = s->encoding->skip_forward(start, 1);
        }

        i = i * sign;
    }

    return i;
#else
    return (INTVAL) string_to_num(interpreter, s);
#endif
}

/*

=item C<FLOATVAL
string_to_num(Interp *interpreter, const STRING *s)>

Same as C<string_to_int()> except that a floating-point value is
returned.

=cut

*/

FLOATVAL
string_to_num(Interp *interpreter, const STRING *s)
{
    FLOATVAL f = 0.0;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (s) {
        /*
         * XXX C99 atof interpreters 0x prefix
         * XXX would strtod() be better for detecting malformed input?
         */
        char *cstr = string_to_cstring(interpreter, const_cast(s));
        char *p = cstr;
        while (isspace(*p)) p++;
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
        UINTVAL length = s->strlen;
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
            UINTVAL c = string_index(interpreter, s, idx);
            INTVAL df = Parrot_char_is_digit(interpreter, c);

            if (df && !digit_family)
                digit_family = df;

            if (df && df == digit_family) {
                if (in_exp) {
                    exponent = exponent*10 +
                        Parrot_char_digit_value(interpreter, c);
                    if (!exp_sign) {
                        exp_sign = 1;
                    }
                }
                else {
                    /* We're somewhere in the main string of numbers */
                    in_number = 1;
                    f = f * 10 + Parrot_char_digit_value(interpreter, c);
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

=item C<STRING *
string_from_int(Interp * interpreter, INTVAL i)>

Returns a Parrot string representation of the specified integer value.

=cut

*/

STRING *
string_from_int(Interp * interpreter, INTVAL i) {
    char buf[128];
    return int_to_str(interpreter, buf, i, 10);
}

/*

=item C<STRING *
string_from_num(Interp * interpreter, FLOATVAL f)>

Returns a Parrot string representation of the specified floating-point
value.

=cut

*/

STRING *
string_from_num(Interp * interpreter, FLOATVAL f)
{
    /* Too damn hard--hand it off to Parrot_sprintf, which'll probably
       use the system sprintf anyway, but has gigantic buffers that are
       awfully hard to overflow. */
    return Parrot_sprintf_c(interpreter, "%vg", f);
}

/*

=item C<char *
string_to_cstring(Interp * interpreter, STRING * s)>

Returns a C string for the specified Parrot string. Use
C<string_cstring_free()> to free the string. Failure to do this will
result in a memory leak.

=cut

*/

char *
string_to_cstring(Interp * interpreter, STRING * s)
{
#if 0
    if (PObj_buflen(s) == s->bufused) {
        string_grow(interpreter, s, 1);
    }
    else
        Parrot_unmake_COW(interpreter, s);

    /* PObj_immobile_SET(s);
     *
     * XXX we don't know, how this cstring gets used by external code
     * so setting the string to immobile would be the best thing, but
     * immobile strings don't get moved - yes - but they get freed in
     * compact_pool :-(
     * The correct way to handle this is probably to malloc the memory
     * and set the PObj_sysmem_FLAG
     * -leo
     */

    ((char *)s->strstart)[s->bufused] = 0;
    /* don't return local vars, return the right thing */
    return (char*)s->strstart;
#else
    /* TODO XXX FIXME ;-) non ascii & memory leak  -leo
     * the real solution WRT leak is this:
     * the caller of this function has to free this cstring that's all
     */
     /*
     or better, don't have this, but have method to return a buffer PMC
     with the right bytes
     */
    char *p;
    if (s == NULL) {
        return NULL;
    }
    p = mem_sys_allocate(s->bufused + 1);
    memcpy(p, s->strstart, s->bufused);
    p[s->bufused] = 0;
    return p;
#endif
}

/*

=item C<void
string_cstring_free(void *ptr)>

Free a string created by C<string_to_cstring()>.

TODO - Hopefully this can be a go away at some point, as it's got all
sorts of leak potential otherwise.

=cut

*/

void
string_cstring_free(void *ptr) {
    mem_sys_free(ptr);
}

/*

=item C<void
string_pin(Interp * interpreter, STRING * s)>

Replace the specified Parrot string's managed buffer memory by system
memory.

=cut

*/

void
string_pin(Interp * interpreter, STRING * s) {
    void *memory;
    INTVAL size;

    /* If this string is marked as immobile, external memory, starts
    in external memory, is already from system memory, or is a
    constant, we just don't do this */
    if (PObj_get_FLAGS(s) & (PObj_immobile_FLAG | PObj_external_FLAG |
                        PObj_bufstart_external_FLAG | PObj_sysmem_FLAG |
                        PObj_constant_FLAG)) {
        return;
    }

    /* XXX -lt: COW strings have the external_FLAG set, so this will
     *          not work for these
     *          so probably only sysmem should be tested
     */
    Parrot_unmake_COW(interpreter, s);
    size = PObj_buflen(s);
    memory = mem_sys_allocate(size);
    mem_sys_memcopy(memory, PObj_bufstart(s), size);
    PObj_bufstart(s) = memory;
    s->strstart = memory;
    /* Mark the memory as both from the system and immobile */
    PObj_flags_SETTO(s, PObj_get_FLAGS(s) |
        (PObj_immobile_FLAG | PObj_sysmem_FLAG));
}

/*

=item C<void
string_unpin(Interp * interpreter, STRING * s)>

Undo a C<string_pin()> so that the string once again uses managed
memory.

=cut

*/

void
string_unpin(Interp * interpreter, STRING * s) {
    void *memory;
    INTVAL size;

    /* If this string is not marked using system memory,
     * we just don't do this
     */
    if (!(PObj_sysmem_TEST(s))) {
        return;
    }

    /* Parrot_unmake_COW(interpreter, s); XXX -lt: can not be cowed ??? */
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
    Parrot_block_GC(interpreter);
    Parrot_allocate_string(interpreter, s, size);
    Parrot_unblock_GC(interpreter);
    mem_sys_memcopy(PObj_bufstart(s), memory, size);
    /* Mark the memory as neither immobile nor system allocated */
    PObj_immobile_CLEAR(s);
    PObj_sysmem_CLEAR(s);
    /* Free up the memory */
    mem_sys_free(memory);
}

/*

=item C<size_t
string_hash(Interp * interpreter, Hash *hash, STRING *s)>

Returns the hash value for the specified Parrot string, caching it in
C<s->hashval>.

=cut

*/

size_t
string_hash(Interp * interpreter, STRING *s, size_t seed)
{
    register size_t h;

    if (!s)
        return seed;

    /* ZZZZZ workaround for something not setting up encodings right */
    saneify_string(s);

    h = CHARSET_COMPUTE_HASH(interpreter, s, seed);
    s->hashval = h;

    return h;
}

/*

=item C<STRING *
string_escape_string(Interp * interpreter, STRING *src)>

Escape all non-ascii chars to backslash sequences. Control chars that 
C<string_unescape_cstring> can handle are esacped as I<\x>, as well
as a double quote character. Other control chars and codepoints < 0x100 are
escaped as I<\xhh>, codepoints up to 0xffff, as I<\uhhhh>, and codepoints
greater than this as I<\x{hh...hh}>.

=item C<STRING *
string_escape_string_delimited(Interp * interpreter, STRING *src, UINTVAL len)>

Like above but limit output to len chars (used for trace output of strings).

=cut

*/

STRING *
string_escape_string(Interp * interpreter, STRING *src)
{
    return string_escape_string_delimited(interpreter, src,
            (UINTVAL) ~0);
}

STRING *
string_escape_string_delimited(Interp * interpreter,
        STRING *src, UINTVAL limit)
{
    STRING *result, *hex;
    UINTVAL c, i, len, charlen;
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
    result = string_make_direct(interpreter, NULL, charlen,
            Parrot_fixed_8_encoding_ptr, Parrot_ascii_charset_ptr, 0);
    /* more work TODO */
    ENCODING_ITER_INIT(interpreter, src, &iter);
    dp = result->strstart;
    for (i = 0; len > 0; --len) {
        c = iter.get_and_advance(interpreter, &iter);
        if (c < 0x80) {
            /* process ASCII chars */
            if (i >= charlen - 2) {
                /* resize - still len codepoints to go */
                charlen += len * 2 + 16;
                Parrot_reallocate_string(interpreter, result, charlen);
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
                dp[i++] = c;
                assert(i < charlen);
                continue;
            }
        }
        /* escape by appending either \uhhhh or \x{hh...} */
        result->bufused = result->strlen = i;
        if (c < 0x0100 || c >= 0x10000)
            hex = Parrot_sprintf_c(interpreter, "\\x{%02x}", c);
        else 
            hex = Parrot_sprintf_c(interpreter, "\\u%04x", c);
        result = string_append(interpreter, result, hex, 0);
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

=item C<STRING *
string_unescape_cstring(Interp * interpreter,
    char *cstring, char delimiter, char *charset)>

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


STRING *
string_unescape_cstring(Interp * interpreter,
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
    if ( (p = strchr(enc_char, ':')) != 0) {
        *p = '\0';
        encoding = Parrot_find_encoding(interpreter, enc_char);
        if (!encoding) {
            internal_exception(UNIMPLEMENTED,
                    "Can't make '%s' encoding strings", enc_char);
        }
        charset = Parrot_find_charset(interpreter, p + 1);
        if (!charset) {
            internal_exception(UNIMPLEMENTED,
                    "Can't make '%s' charset strings", p + 1);
        }
        result = string_make_direct(interpreter, cstring, clength,
                encoding, charset, flags);
        encoding = Parrot_fixed_8_encoding_ptr;
    }
    else {
        result = string_make(interpreter, cstring, clength, enc_char, flags);
        encoding = result->encoding;
    }
    encoding->iter_init(interpreter, result, &iter);
    for (offs = d = 0; offs < clength; ++offs) {
        r = (Parrot_UInt4)((unsigned char*)result->strstart)[offs];
        /* There cannot be any NULs within this string.  */
        assert(r != '\0');
        if (r == '\\') {
            ++offs;
            r = string_unescape_one(interpreter, &offs, result);
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
        iter.set_and_advance(interpreter, &iter, r);
        ++d;
    }
    result->strlen = d;
    result->bufused = iter.bytepos;
    if (encoding != result->encoding) {
        /* this also validates the string */
        string_compute_strlen(interpreter, result);
    }
    else if (!CHARSET_VALIDATE(interpreter, result, 0)) {
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

=item C<STRING *
string_upcase(Interp *interpreter, const STRING *s)>

Returns a copy of the specified Parrot string converted to upper case.
Non-caseable characters are left unchanged.

TODO - implemented only for ASCII.

=cut

*/


STRING *
string_upcase(Interp *interpreter, const STRING *s)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
    STRING *dest = string_copy(interpreter, const_cast(s));
    string_upcase_inplace(interpreter, dest);
    return dest;
}

/*

=item C<void
string_upcase_inplace(Interp *interpreter, STRING *s)>

Converts the specified Parrot string to upper case.

=cut

*/

void
string_upcase_inplace(Interp *interpreter, STRING *s)
{
    if (!s)
        return;
    CHARSET_UPCASE(interpreter, s);
}

/*

=item C<STRING *
string_downcase(Interp *interpreter, const STRING *s)>

Returns a copy of the specified Parrot string converted to lower case.
Non-caseable characters are left unchanged.

=cut

*/

STRING *
string_downcase(Interp *interpreter, const STRING *s)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
    STRING *dest = string_copy(interpreter, const_cast(s));
    string_downcase_inplace(interpreter, dest);
    return dest;
}

/*

=item C<void
string_downcase_inplace(Interp *interpreter, STRING *s)>

Converts the specified Parrot string to lower case.

=cut

*/

void
string_downcase_inplace(Interp *interpreter, STRING *s)
{
    if (!s)
        return;
    CHARSET_DOWNCASE(interpreter, s);
}

/*

=item C<STRING *
string_titlecase(Interp *interpreter, const STRING *s)>

Returns a copy of the specified Parrot string converted to title case.
Non-caseable characters are left unchanged.

=cut

*/

STRING *
string_titlecase(Interp *interpreter, const STRING *s)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;
    STRING *dest = string_copy(interpreter, const_cast(s));
    string_titlecase_inplace(interpreter, dest);
    return dest;
}

/*

=item C<void
string_titlecase_inplace(Interp *interpreter, STRING *s)>

Converts the specified Parrot string to title case.

=cut

*/

void
string_titlecase_inplace(Interp *interpreter, STRING *s)
{
    if (!s)
        return;
    CHARSET_TITLECASE(interpreter, s);
}

/*

=item C<STRING *string_increment(Interp *, const STRING *)>

Perl5ish increment the string. Currently single char only.

=cut

*/

STRING *
string_increment(Interp *interpreter, const STRING *s)
{
    INTVAL o;

    if (string_length(interpreter, s) != 1)
        internal_exception(1, "increment only for length=1 done");
    o = string_ord(interpreter, s, 0);
    if ((o >= 'A' && o < 'Z') ||
            (o >= 'a' && o < 'z')) {
        ++o;
        /* TODO increment in place */
        return string_chr(interpreter, o);
    }
    internal_exception(1, "increment out of range - unimplemented");
    return NULL;
}

/*

=item C<const char *Parrot_string_cstring(Interp *, const STRING *)>

Return a C string from a Parrot string.  Both sides are treated
as constants -- i.e. do not resize the result.

=cut

*/

const char *
Parrot_string_cstring(Interp *interpreter, const STRING *str)
{
    /* TODO handle NUL and friends */
    return str->strstart;
}


/*

=item C<
Parrot_string_is_cclass(Interp *, PARROT_CCLASS_FLAGS flags, STRING *s, UINTVAL offset)>

Return 1 if the codepoint of string C<s> at given offset is in the given
character class C<flags>. See also F<include/parrot/cclass.h> for possible
character classes. Returns 0 otherwise, or if the string is empty or NULL.

=cut

*/

INTVAL
Parrot_string_is_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *s, UINTVAL offset)
{
    if (!string_length(interpreter, s))
        return 0;
    return CHARSET_IS_CCLASS(interpreter, flags, s, offset);
}

INTVAL
Parrot_string_find_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *s, UINTVAL offset, UINTVAL count)
{
    if (!s)
        return -1;
    return CHARSET_FIND_CCLASS(interpreter, flags, s, offset, count);
}

INTVAL
Parrot_string_find_not_cclass(Interp *interpreter, PARROT_CCLASS_FLAGS flags, STRING *s, UINTVAL offset, UINTVAL count)
{
    if (!s)
        return -1;
    return CHARSET_FIND_NOT_CCLASS(interpreter, flags, s, offset, count);
}

/*

=item C< STRING*
Parrot_string_trans_charset(Interp *interpreter, STRING *src,
        INTVAL charset_nr, STRING *dest)>

=item C< STRING*
Parrot_string_trans_encoding(Interp *interpreter, STRING *src,
        INTVAL charset_nr, STRING *dest)>

If C<dest> == NULL convert  C<src> to the given charset or encoding inplace,
else return a copy of C<src> with the charset/encoding in dest.

=cut

*/

STRING*
Parrot_string_trans_charset(Interp *interpreter, STRING *src,
        INTVAL charset_nr, STRING *dest)
{
    CHARSET *new_charset;

    if (!src)
        return NULL;
    new_charset = Parrot_get_charset(interpreter, charset_nr);
    if (!new_charset)
        real_exception(interpreter, NULL, INVALID_CHARTYPE,
                "charset #%d not found", (int) charset_nr);
    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        if (new_charset == src->charset) {
            Parrot_reuse_COW_reference(interpreter, src, dest);
            dest->charset = new_charset;
            /* keep encoding */
            return dest;
        }
        dest->charset = new_charset;
        /* get prefered encoding for charset */
        dest->encoding = CHARSET_GET_PREFERRED_ENCODING(interpreter, dest);
    }
    else {
        if (new_charset == src->charset) {
            return src;
        }
    }
    return new_charset->to_charset(interpreter, src, dest);
}

STRING*
Parrot_string_trans_encoding(Interp *interpreter, STRING *src,
        INTVAL encoding_nr, STRING *dest)
{
    ENCODING *new_encoding;

    if (!src)
        return NULL;
    new_encoding = Parrot_get_encoding(interpreter, encoding_nr);
    if (!new_encoding)
        real_exception(interpreter, NULL, INVALID_CHARTYPE,
                "encoding #%d not found", (int) encoding_nr);
    /*
     * dest is an empty string header or NULL, if an inplace
     * operation is desired
     */
    if (dest) {
        dest->encoding = new_encoding;
        if (new_encoding == src->encoding) {
            Parrot_reuse_COW_reference(interpreter, src, dest);
            return dest;
        }
    }
    else {
        if (new_encoding == src->encoding) {
            return src;
        }
    }
    return new_encoding->to_encoding(interpreter, src, dest);
}

/*

=back

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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
