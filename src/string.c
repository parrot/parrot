/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/string.c - Parrot Strings

=head1 DESCRIPTION

This file implements the non-ICU parts of the Parrot string subsystem.

Note that C<bufstart> and C<buflen> are used by the memory subsystem The
string functions may only use C<buflen> to determine, if there is some
space left beyond C<bufused>. This is the I<only> valid usage of these
two data members, beside setting C<bufstart>/C<buflen> for external
strings.

=cut

*/

#include "parrot/parrot.h"
#include <assert.h>

#include "../encodings/fixed_8.h"
#include "../charset/ascii.h"
#include "../charset/binary.h"
#include "../charset/iso-8859-1.h"


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
         * independant of the original COW data */
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
    char *data_dir;
    int free_data_dir = 0;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (!interpreter->parent_interpreter) {
        /* Load in the basic encodings and charsets
         *
         * the order is crucial here:
         * 1) default encoding = fixed_8
         * 2) default charset  = iso-8859-1
         */
        Parrot_encoding_fixed_8_init(interpreter);
        Parrot_charset_iso_8859_1_init(interpreter);
        Parrot_charset_binary_init(interpreter);
        Parrot_charset_ascii_init(interpreter);

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
            if (prefix) {
                p = strstr(build_path, "blib");        /* .../blib/lib/... */
                assert(p);
                --p;        /* slash or backslash */
                data_dir = mem_sys_allocate(strlen(prefix) + strlen(p) + 1);
                strcpy(data_dir, prefix);
                strcat(data_dir, p);
                free_data_dir = 1;
            }
        }
        string_set_data_directory(data_dir);
no_set:
        if (free_data_dir)
            mem_sys_free((void*)data_dir); /* cast away the constness */
    }

/* --- Perhaps these should be uncommented - Leo
    encoding_init();
    chartype_init();
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
*/
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
    Parrot_deinit_charsets(interpreter);
}

/*

=item C<UINTVAL
string_capacity(Interp *interpreter, STRING *s)>

Returns the capacity of the specified Parrot string.

=cut

*/

UINTVAL
string_capacity(Interp *interpreter, STRING *s)
{
    saneify_string(s);
    return ((ptrcast_t)PObj_bufstart(s) + PObj_buflen(s) -
            (ptrcast_t)s->strstart) /
        ENCODING_MAX_BYTES_PER_CODEPOINT(interpreter, s);
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

    if (representation == enum_stringrep_one) {
        s->encoding = PARROT_DEFAULT_ENCODING;
        s->charset = PARROT_DEFAULT_CHARSET;
    } else {
        internal_exception(INVALID_CHARTYPE, "Unsupported representation");
    }

    Parrot_allocate_string(interpreter,
        s, string_max_bytes(interpreter, s, capacity));

    return s;
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

    /* If the destination's constant, then just fall back to
       string_concat */
    if (PObj_constant_TEST(a)) {
        return string_concat(interpreter, a, b, Uflags);
    }

    a_capacity = string_capacity(interpreter, a);
    total_length = string_length(interpreter, a) + b_len;

    /* make sure A's big enough for both */
    if (a_capacity < total_length)
    {
        a = string_grow(interpreter, a,
                (total_length - a_capacity) + EXTRA_SIZE);
    }
    else {
        Parrot_unmake_COW(interpreter, a);
    }

    /* A is now ready to receive the contents of B */

    /* if same rep, can memcopy */
    if (a->encoding == b->encoding && a->charset == b->charset) {
        /* Tack B on the end of A */
        mem_sys_memcopy((void *)((ptrcast_t)a->strstart + a->bufused),
                b->strstart, b->bufused);

        a->bufused += b->bufused;
        a->strlen += b_len;
        return a;
    }
    else {
        internal_exception(UNIMPLEMENTED,
                "Cross-type string appending (%s/%s) (%s/%s) unsupported",
                ((ENCODING *)(a->encoding))->name,
                ((CHARSET *)(a->charset))->name,
                ((ENCODING *)(b->encoding))->name,
                ((CHARSET *)(b->charset))->name);
    }

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
            return "iso-8859-1";
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
    UINTVAL len, const char *charset, UINTVAL flags)>

Creates and returns a new Parrot string using C<len> bytes of string
data read from C<buffer>.

The value of C<charset> specifies the string's representation.
The currently recognised values are:

    'iso-8859-1'
    'ascii'
    'binary'

If C<charset> is unspecified the default charset 'iso-8859-1' will be
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
        internal_exception(MISSING_ENCODING_NAME,
            "string_make: no charset name specified");
    }

    if (strcmp(charset_name, "iso-8859-1") == 0 ) {
        encoding = Parrot_fixed_8_encoding_ptr;
        charset = Parrot_iso_8859_1_charset_ptr;
    }
    else if (strcmp(charset_name, "ascii") == 0 ) {
        encoding = Parrot_fixed_8_encoding_ptr;
        charset = Parrot_ascii_charset_ptr;
    }
    else if (strcmp(charset_name, "binary") == 0 ) {
        encoding = Parrot_fixed_8_encoding_ptr;
        charset = Parrot_binary_charset_ptr;
    }
    else {
        internal_exception(UNIMPLEMENTED,
                "Can't make '%s' charset strings", charset_name);
    }
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

    /*    PIO_eprintf(NULL, "string_make(): length = %ld, encoding name = %s, buffer = %s\n",
          len, charset, (const char *)buffer); */

    if (len && !buffer) {
        internal_exception(BAD_BUFFER_SIZE,
                "string_make: buffer pointer NULL, but length nonzero");
    }

    s = new_string_header(interpreter, flags);
    s->encoding = encoding;
    s->charset = charset;

    if (encoding == Parrot_fixed_8_encoding_ptr &&
            charset == Parrot_iso_8859_1_charset_ptr) {
        /*
         * fast path for external (constant) strings - don't allocate
         * and copy data
         */
        if (flags & PObj_external_FLAG) {
            /* The following cast discards the 'const'.  That raises
               a warning with gcc, but is ok since the caller indicated
               it was safe by setting PObj_external_FLAG.
               (The cast is necessary to pacify TenDRA's tcc.)
               */
            PObj_bufstart(s) = s->strstart = const_cast(buffer);
            PObj_buflen(s)   = s->strlen = s->bufused = len;
            PObj_bufstart_external_SET(s);

            return s;
        }
    }

    Parrot_allocate_string(interpreter, s, len);

    if (buffer) {
        mem_sys_memcopy(s->strstart, buffer, len);
        s->bufused = len;
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
        const STRING *s2, UINTVAL start)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (!string_length(interpreter, s))
        return -1;
    if (!string_length(interpreter, s2))
        return -1;

    saneify_string(s);
    saneify_string(s2);

    return CHARSET_INDEX(interpreter, s, s2, start);
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
    /* taking advantage of int value of the enum */
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
            STRING *result =
                string_make_empty(interpreter, enum_stringrep_one,
                        a->strlen + b->strlen);

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

    dest = string_make_empty(interpreter, enum_stringrep_one, s->strlen * num);

    /* dest = string_make(interpreter, NULL, s->bufused * num, s->encoding, 0,
                       s->type); */
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
        CHARSET_GET_CODEPOINTS_INPLACE(interpreter, src, *d,
                true_offset, true_length);
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
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;
    INTVAL diff;

    true_offset = (UINTVAL)offset;
    true_length = (UINTVAL)length;

    /* may have different reps..... */
    if (src->encoding != rep->encoding || src->charset != rep->charset) {
        internal_exception(UNIMPLEMENTED, "Can't handle mixed types yet");
    }

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
        UINTVAL length_bytes = string_max_bytes(interpreter, src, true_length);

        dest = string_make_empty(interpreter, enum_stringrep_one, true_length);

        mem_sys_memcopy(dest->strstart,
                (char *)src->strstart
                + string_max_bytes(interpreter, src, true_offset),
                length_bytes);

        dest->bufused = length_bytes;
        dest->strlen = true_length;

        *d = dest;
    }

    /* Now do the replacement */


    /* XXXX: make sure the rest of this method is correct, vis-a-vis byte v.
       character */
    substart_off = string_max_bytes(interpreter, src, true_offset);

    subend_off = substart_off + string_max_bytes(interpreter, src, true_length);

    /* not possible.... */
    if (subend_off < substart_off) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                "replace: subend somehow is less than substart");
    }

    /*
     * If the replacement string fits inside the original substring
     * don't create a new string, just pack it.
     */
    diff = (subend_off - substart_off) - rep->bufused;

    if(diff >= 0
            || ((INTVAL)src->bufused - (INTVAL)PObj_buflen(src)) <= diff) {
        Parrot_unmake_COW(interpreter, src);

        if(diff != 0) {
            mem_sys_memmove((char*)src->strstart + substart_off + rep->bufused,
                    (char*)src->strstart + subend_off,
                    src->bufused - subend_off);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char*)src->strstart + substart_off,
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
        mem_sys_memmove((char*)src->strstart + subend_off + diff,
                (char*)src->strstart + subend_off,
                src->bufused - subend_off);
        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->strstart + substart_off, rep->strstart,
                rep->bufused);
        src->bufused += diff;
        (void)string_compute_strlen(interpreter, src);
    }

    /* src is modified, now return the original substring */
    return dest;
}

/*

=item C<STRING *
string_chopn(Interp *interpreter, STRING *s, INTVAL n)>

Chops off the last C<n> characters of the specified Parrot string. If
C<n> is negative, cuts the string after C<+n> characters.

=cut

*/

STRING *
string_chopn(Interp *interpreter, STRING *s, INTVAL n)
{
    UINTVAL new_length;

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

    s->strlen = new_length;
    s->bufused = string_max_bytes(interpreter, s, new_length);
    s->hashval = 0;

    return s;
}


INTVAL
string_compare(Interp *interpreter,
    STRING *s1, STRING *s2)
{
    INTVAL cmp = 0;    /* gcc -O3 warning */

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

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#  endif
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

    else if (s1->strstart == s2->strstart) { /* COWed strings */
        /*
         * XXX when compiled -O3 this added compare makes suddenly
         * t/pmc/threads 6, 8-9 fail with --gc-debug
         * It segfaults in thread.c:67 with a destroyed interpreter
         * gcc error?
         *
         * -leo
         */
        return 0;
    }

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#  endif

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
    size_t minlen = 0;
    parrot_string_representation_t maxrep = enum_stringrep_one;

    /* think about case of dest string is one of the operands */
    if (s1 && s2) {
        minlen = s1->strlen > s2->strlen ? s2->strlen : s1->strlen;
    }

    if (dest && *dest) {
        res = *dest;
    }
    else if (!s1 || !s2) {
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    }
    else {
        res = string_make_empty(interpreter, maxrep, minlen);
    }

    if (!s1 || !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }
    else {
        if (s1->encoding != s2->encoding || s1->charset != s2->charset) {
            internal_exception(UNIMPLEMENTED,
                    "Can't do cross-type bitwwise and");
        }
    }
#if ! DISABLE_GC_DEBUG
    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, DOD_trace_stack_FLAG);
#endif

    make_writable(interpreter, &res, minlen, enum_stringrep_one);

    BITWISE_AND_STRINGS(Parrot_UInt1, Parrot_UInt1,
            Parrot_UInt1, s1, s2, res, minlen);

    res->strlen = minlen;
    res->bufused = string_max_bytes(interpreter, res, res->strlen);

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
    STRING *res = NULL;
    size_t maxlen = 0;
    parrot_string_representation_t maxrep = enum_stringrep_one;

    maxlen = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > maxlen)
        maxlen = s2->bufused;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    else
        res = string_make_empty(interpreter, maxrep, maxlen);

    if (!s1 && !s2) {
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
    res->strlen = maxlen;
    res->bufused = string_max_bytes(interpreter, res, res->strlen);

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
    STRING *res = NULL;
    size_t maxlen = 0;
    parrot_string_representation_t maxrep = enum_stringrep_one;

    maxlen = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > maxlen)
        maxlen = s2->bufused;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make_empty(interpreter, enum_stringrep_one, 0);
    else
        res = string_make_empty(interpreter, maxrep, maxlen);

    if (!s1 && !s2) {
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

    res->strlen = maxlen;
    res->bufused = string_max_bytes(interpreter, res, res->strlen);

    if (dest)
        *dest = res;

    return res;
}

/*
#define BITWISE_NOT_STRING(type, s, res) \
do { \
    if (s && res) \
    { \
        const type *curr = (type *)s->strstart; \
        size_t length = s->strlen; \
        Parrot_UInt4 *dp = (Parrot_UInt4 *)res->strstart; \
 \
        for ( ; length ; --length) \
        { \
            *dp++ = ~ *curr++; \
        } \
    } \
} while(0)
*/

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
            Parrot_UInt1 temp = *curr; \
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
    STRING *res = NULL;
    size_t len = s ? s->strlen : 0;

    if (dest && *dest)
        res = *dest;
    else
        res = string_make_empty(interpreter, enum_stringrep_one, len);

    if (!s) {
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

    res->strlen = len;
    res->bufused = string_max_bytes(interpreter, res, len);

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

Replace the apecified Parrot string's managed buffer memory by system
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
string_hash(Interp * interpreter, STRING *s)
{
    register size_t h;

    if (!s)
        return 0;

    /* ZZZZZ workaround for something not setting up encodings right */
    saneify_string(s);

    h = CHARSET_COMPUTE_HASH(interpreter, s);
    s->hashval = h;

    return h;
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
  \a, \b, \t, \n, \v, \f, \r, \e, \?

=cut

*/


STRING *
string_unescape_cstring(Interp * interpreter,
    const char *cstring, char delimiter, const char *charset)
{
    size_t clength = strlen(cstring);
    STRING *result;
    UINTVAL offs, d;
    Parrot_UInt4 r;
    UINTVAL flags;

    if (delimiter && clength)
        --clength;
    flags = PObj_constant_FLAG;
    if (!charset)
        charset = "iso-8859-1";
    else
        flags |= PObj_private7_FLAG;  /* Pythonic unicode flag */
    result = string_make(interpreter, cstring, clength, charset, flags);

    for (offs = d = 0; offs < clength; ++offs) {
        r = CHARSET_GET_CODEPOINT(interpreter, result, offs);
        /* There cannot be any NULs within this string.  */
        assert(r != '\0');
        /* It's also a logic bug if we encounter the delimiter.  */
        assert(r != (Parrot_UInt4)delimiter);
        if (r == '\\') {
            ++offs;
            r = string_unescape_one(interpreter, &offs, result);
            --offs;
        }
        if (d == offs) {
            ++d;
            continue;
        }
        CHARSET_SET_CODEPOINT(interpreter, result, d++, r);
    }
    result->strlen = d;
    result->bufused = string_max_bytes(interpreter, result, d);

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
    UINTVAL i;
    INTVAL o;

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
    UINTVAL i;
    INTVAL o;

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
    UINTVAL i;
    INTVAL o;

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

INTVAL
Parrot_string_is_whitespace(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return 0;
    return CHARSET_IS_WHITESPACE(interpreter, s, offset);
}

INTVAL
Parrot_string_is_digit(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return 0;
    return CHARSET_IS_DIGIT(interpreter, s, offset);
}

INTVAL
Parrot_string_is_wordchar(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return 0;
    return CHARSET_IS_WORDCHAR(interpreter, s, offset);
}

INTVAL
Parrot_string_is_punctuation(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return 0;
    return CHARSET_IS_PUNCTUATION(interpreter, s, offset);
}

INTVAL
Parrot_string_is_newline(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return 0;
    return CHARSET_IS_NEWLINE(interpreter, s, offset);
}

INTVAL
Parrot_string_find_whitespace(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_WHITESPACE(interpreter, s, offset);
}

INTVAL
Parrot_string_find_digit(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_DIGIT(interpreter, s, offset);
}

INTVAL
Parrot_string_find_wordchar(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_WORDCHAR(interpreter, s, offset);
}

INTVAL
Parrot_string_find_punctuation(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_PUNCTUATION(interpreter, s, offset);
}

INTVAL
Parrot_string_find_newline(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_NEWLINE(interpreter, s, offset);
}

INTVAL
Parrot_string_find_word_boundary(Interp *interpreter, STRING *s, INTVAL offset)
{
    if (!s)
        return -1;
    return CHARSET_FIND_WORD_BOUNDARY(interpreter, s, offset);
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
