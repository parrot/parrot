/* string.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api definitions for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *
 *  ********************************************************
 *  bufstart and buflen are used by the memory subsystem
 *  The string functions may only use buflen to determine,
 *  if there is some space left beyond bufused. This is the
 *  *only* valid usage of these two data members, beside
 *  setting bufstart/buflen for external strings.
 *  ********************************************************
 *
 *  References:
 */

#include "parrot/parrot.h"

static const CHARTYPE *string_native_type;
static const CHARTYPE *string_unicode_type;

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

#define EXTRA_SIZE 512

/* work around warning:
 * cast discards qualifiers from pointer target type
 * s. usage below
 */

#define const_cast(b) (__ptr_u.__c_ptr = (b), __ptr_u.__ptr)

/* String COW support */

/* make a copy of string's data:
 * copy used string data from strstart to a newly
 * allocated string
 * the header stays the same
 */
static void
unmake_COW(struct Parrot_Interp *interpreter, STRING *s)
{
    /* COW_FLAG | constant_FLAG | external_FLAG) */
    if (PObj_is_cowed_TESTALL(s)) {
        void *p;
        UINTVAL size, bsize;
        /* Make the copy point to only the portion of the string that
         * we are actually using. */
        p = s->strstart;
        size = s->bufused;
        bsize = s->buflen;
        /* Create new pool data for this header to use,
         * independant of the original COW data */
        PObj_constant_CLEAR(s);
        /* don't shorten string, string_append may use buflen
         *
         * block GC, p points into string memory
         */
        Parrot_block_GC(interpreter);
        Parrot_allocate_string(interpreter, s, bsize);
        Parrot_unblock_GC(interpreter);
        mem_sys_memcopy(s->strstart, p, size);
        /* COW_FLAG | external_FLAG | bufstart_external_FLAG immobile_FLAG */
        PObj_is_external_CLEARALL(s);
    }
}

static void copy_string_header(struct Parrot_Interp *interpreter,
                               String *dest, String *src)
{
#if ! DISABLE_GC_DEBUG
    UINTVAL vers;
    vers= dest->pobj_version;
#endif
    memcpy(dest, src, sizeof(String));
#if ! DISABLE_GC_DEBUG
    dest->pobj_version = vers;
#endif
}

/* clone a string header without allocating a new buffer
 * i.e. create a 'copy-on-write' string
 */
static STRING *
make_COW_reference(struct Parrot_Interp *interpreter, STRING *s)
{
    STRING *d;
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
    }
    return d;
}

static void
make_COW_reference_from_header(struct Parrot_Interp *interpreter,
        STRING *s, STRING *d) {
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

/*=for api string string_set
 * set the contents of dest to the contents of src
 */
STRING *
string_set(struct Parrot_Interp *interpreter, STRING *dest, STRING *src)
{
    if (!src)
        return NULL;
    if (dest && dest != src) {
        /* they are different, dest is not an external string */
#ifdef GC_IS_MALLOC
        if (!PObj_is_external_TESTALL(dest) && dest->bufstart) {
            mem_sys_free(dest->bufstart);
        }
#endif
        make_COW_reference_from_header(interpreter, src, dest);
    }
    else
        dest = make_COW_reference(interpreter, src);
    return dest;
}


/* Basic string stuff - creation, enlargement, etc. */

/*=for api string string_init
 * set up the native string vtable
 */
void
string_init(void)
{
    encoding_init();
    chartype_init();
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
}

/*=for api string string_append
 * Take in two strings and append the second string to the first
 */
STRING *
string_append(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)
{
    UNUSED(Uflags);

    /* If B isn't real, we just bail */
    if (b == NULL || b->strlen == 0) {
        return a;
    }

    /* Is A real? */
    if (a != NULL) {
        /* If the destination's constant, then just fall back to
           string_concat */
        if (PObj_constant_TEST(a)) {
            return string_concat(interpreter, a, b, Uflags);
        }
        /* First, make sure B is the same type as A, transcoding
           if we need to */
        if (a->type != b->type || a->encoding != b->encoding) {
            b = string_transcode(interpreter, b, a->encoding, a->type,
                                 NULL);
        }
        /* make sure A's big enough for both */
        if (a->buflen < a->bufused + b->bufused) {
            a = string_grow(interpreter, a, ((a->bufused + b->bufused)
                            - a->buflen) + EXTRA_SIZE);
        }
        else
            unmake_COW(interpreter, a);

        /* Tack B on the end of A */
        mem_sys_memcopy((void *)((ptrcast_t)a->strstart + a->bufused),
                        b->strstart, b->bufused);
        a->bufused += b->bufused;
        a->strlen += b->strlen;
        return a;
    }
    /* If we got here, A was NULL. So clone B. */
    return string_copy(interpreter, b);
}

/*=for api string string_from_cstring
 * Make a String from a passed in C string
 */
STRING *
string_from_cstring(struct Parrot_Interp *interpreter, const void *buffer,
                     UINTVAL len) {
    return string_make(interpreter, buffer, len ? len :
            buffer ? strlen(buffer) : 0,
                       NULL, 0, NULL);
}

/*=for api string string_make
 * allocate memory for the string, copy information into it
 * and compute its string length
 */
STRING *
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL len, const ENCODING *encoding, UINTVAL flags,
            const CHARTYPE *type)
{
    STRING *s;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (!type) {
        type = string_native_type;
    }

    if (!encoding) {
        encoding = encoding_lookup(type->default_encoding);
    }

    s = new_string_header(interpreter, flags);
    if (flags & PObj_external_FLAG) {
        /* The following cast discards the 'const'.  That raises
           a warning with gcc, but is ok since the caller indicated
           it was safe by setting PObj_external_FLAG.
           (The cast is necessary to pacify TenDRA's tcc.)
           */
        s->bufstart = const_cast(buffer);
        s->buflen = len;
        PObj_bufstart_external_SET(s);
    }
    else {
        Parrot_allocate_string(interpreter, s, len);
    }
    s->encoding = encoding;
    s->type = type;

    if (buffer) {
        if (flags & PObj_external_FLAG) {
            s->strstart = s->bufstart;
            PObj_bufstart_external_SET(s);
        }
        else {
            mem_sys_memcopy(s->strstart, buffer, len);
        }
        s->bufused = len;
        (void)string_compute_strlen(s);
    }
    else {
        s->strlen = s->bufused = 0;
    }

    return s;
}

/*=for api string string_grow
 * grow the string buffer by addlen bytes
 */
STRING *
string_grow(struct Parrot_Interp * interpreter, STRING * s, INTVAL addlen) {
    unmake_COW(interpreter,s);

    /* Don't check buflen, if we are here, we already checked. */
    Parrot_reallocate_string(interpreter, s,
                             s->buflen + string_max_bytes(s,addlen));
    return s;
}

/* Ordinary user-visible string operations */

/*=for api string string_length
 * Return the length of the string (in characters)
 */
UINTVAL
string_length(const STRING *s)
{
    return s ? s->strlen : 0;
}

/*=for api string string_index
 * return the character (or glyph, depending upon the string's encoding)
 * This is to abstract the process of finding the Nth character in a (possibly
 * unicode or JIS-encoded) string, the idea being that once the encoding
 * functions are fleshed out, this function can DTRT.
 */
INTVAL
string_index(const STRING *s, UINTVAL idx)
{
    if (s->encoding->index == enum_encoding_singlebyte) {
        /* This inlines the computations used for the case that the strings is
         * in a singlebyte encoding.
         * This assumes that any singlebyte encoding uses is us-ascii, which is wrong,
         * but consistent withthe result of calling s->encoding->decode */
        return *((unsigned char*) s->strstart + idx);
    }
    else {
        return s->encoding->decode(s->encoding->skip_forward(s->strstart, idx));
    }
}

/* string_str_index_multibyte:  Helper function for string_str_index.
 * This implements a naive substring search, but one that is guaranteed to
 * work for all encodings.
 */
static INTVAL
string_str_index_multibyte(struct Parrot_Interp *interpreter,
        const STRING *str, const STRING *find, UINTVAL start)
{
    struct string_iterator_t fp;
    struct string_iterator_t ip;
    struct string_iterator_t sp;
    int match;
    UINTVAL lastmatch = str->strlen - find->strlen;

    string_iterator_init(&sp, str);
    string_iterator_init(&fp, find);
    string_iterator_init(&ip, str);
    sp.set_position(&sp, start);
    while (sp.charpos <= lastmatch) {
        fp.set_position(&fp, 0);
        /* XXX need a function for this? */
        ip.charpos = sp.charpos;
        ip.bytepos = sp.bytepos;

        match = 1;
        for (; fp.charpos < find->strlen; ) {
            if (fp.decode_and_advance(&fp) != ip.decode_and_advance(&ip)) {
                match = 0;
                break;
            }
        }
        if (match) {
            return sp.charpos;
        }

        /* XXX advance-only not yet implemented */
        sp.decode_and_advance(&sp);
    }

    return -1;
}

/* string_str_index_singlebyte: Helper function for string_str_index.
 * This is optimized for the simple case where both strings are in
 * encoding_singlebyte.  It implements the Boyer-Moore string search
 * algorithm.
 */
static INTVAL
string_str_index_singlebyte(struct Parrot_Interp *interpreter,
        const STRING *str, const STRING *find, UINTVAL start)
{
    const unsigned char* const find_strstart = find->strstart;
    const unsigned char* const str_strstart  = str->strstart;
    const UINTVAL              find_strlen   = find->strlen;
    const UINTVAL              str_strlen    = str->strlen;
    const unsigned char* const lastmatch     =
                                   str_strstart + str_strlen;
    UINTVAL* p;
    const unsigned char* cp;
    UINTVAL endct, pos;
    UINTVAL badshift[256];

    /* Prepare the bad shift buffer */

    for (p = &badshift[0] ; p < &badshift[256] ; p++) {
        *p = find_strlen;
    }

    endct = 1;
    cp = find_strstart + find_strlen - 2;
    for (; cp >= find_strstart ; cp--, endct++) {
        if (endct < badshift[*cp]) {
            badshift[*cp] = endct;
        }
    }

    /* Perform the match */

    pos = start;
    cp = str_strstart + start + find_strlen;
    while (cp <= lastmatch) {
        register const unsigned char* sp = cp;
        register const unsigned char* fp = find_strstart + find_strlen;

        while (fp > find_strstart) {
            if (*--fp != *--sp)
                break;
        }
        if (*fp == *sp) {
            return pos;
        }
        else {
            register UINTVAL bsi = badshift[*(cp-1)];
            cp  += bsi;
            pos += bsi;
        }
    }

    return -1;
}

/*=for api string string_str_index
 * Return the character position of s2 in s at or after start.
 * The return value is a (0 based) offset in characters, not bytes.
 * If s2 is not found, then return -1
 */
INTVAL
string_str_index(struct Parrot_Interp *interpreter, const STRING *s,
        const STRING *s2, UINTVAL start)
{
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    if (!s || !string_length(s))
        return -1;
    if (!s2 || !string_length(s2))
        return -1;

    /* if different chartypes transcode s2 to s */
    if (s->type != s2->type)
        s2 = string_transcode(interpreter, const_cast(s2), s->encoding,
                s->type, NULL);

    if (s->encoding->index == enum_encoding_singlebyte &&
       s2->encoding->index == enum_encoding_singlebyte) {
        return string_str_index_singlebyte(interpreter, s, s2, start);
    }
    else {
        return string_str_index_multibyte(interpreter, s, s2, start);
    }
}



/*=for api string string_ord
 * Return the codepoint at a given index into a string. Negative
 * indexes are treated as counting from the end of the string.
 */
INTVAL
string_ord(const STRING *s, INTVAL idx)
{
    UINTVAL len = 0;

    if (s != NULL) {
        len = string_length(s);
    }

    if ((s == NULL) || (len == 0)) {
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

        return string_index(s, true_index);
    }
    return -1;
}

/*=for api string string_copy
 * create a copy of the argument passed in
 */
STRING *
string_copy(struct Parrot_Interp *interpreter, STRING *s)
{
    return make_COW_reference(interpreter, s);
}

/*=for api string string_transcode
 * create a transcoded copy of the argument passed in
 */
STRING *
string_transcode(struct Parrot_Interp *interpreter,
                 STRING *src, const ENCODING *encoding,
                 const CHARTYPE *type, STRING **dest_ptr)
{
    STRING *dest;
    CHARTYPE_TRANSCODER transcoder1 = (CHARTYPE_TRANSCODER)NULLfunc;
    CHARTYPE_TRANSCODER transcoder2 = (CHARTYPE_TRANSCODER)NULLfunc;
    const char *srcstart;
    const char *srcend;
    char *deststart;
    char *destend;

    if (!encoding) {
        if (type)
            encoding = encoding_lookup(type->default_encoding);
        else
            encoding = encoding_lookup_index(0);
        /* XXX This is a hack. I had thought it was:
         * encoding = encoding_lookup(src->type->default_encoding);
         * but that seems really stupid, because transcoding two strings
         * to NULL wouldn't necessarily mean they have the same
         * encoding. So this seems to be the least bad compromise.
         */
    }
    if (!type) {
        type = src->type;
    }

    if (src->encoding == encoding && src->type == type) {
        dest = string_copy(interpreter, src);

        if (dest_ptr) {
            *dest_ptr = dest;
        }
        return dest;
    }

    dest = string_make(interpreter, NULL, src->strlen * encoding->max_bytes,
                       encoding, 0, type);

    if (src->type != dest->type) {
        transcoder1 = chartype_lookup_transcoder(src->type, dest->type);
        if (!transcoder1) {
            transcoder1 = src->type->to_unicode;
            transcoder2 = dest->type->from_unicode;
        }
    }

    srcstart = (void *)src->strstart;
    srcend = srcstart + src->bufused;
    deststart = dest->strstart;
    destend = deststart;

    while (srcstart < srcend) {
        UINTVAL c = src->encoding->decode(srcstart);

        if (transcoder1)
            c = transcoder1(src->type, dest->type, c);
        if (transcoder2)
            c = transcoder2(src->type, dest->type, c);

        destend = dest->encoding->encode(destend, c);

        srcstart = src->encoding->skip_forward(srcstart, 1);
    }

    dest->bufused = destend - deststart;
    dest->strlen = src->strlen;

    if (dest_ptr) {
        *dest_ptr = dest;
    }

    return dest;
}

/* vtable despatch functions */

/*=for api string string_compute_strlen
 * calculate the length (in characters) of the string
 */
INTVAL
string_compute_strlen(STRING *s)
{
    s->strlen = s->encoding->characters(s->strstart, s->bufused);
    return s->strlen;
}

/*=for api string string_max_bytes
 * returns the number of bytes required to safely contain
 * nchars characters in the string's encoding
 */
INTVAL
string_max_bytes(STRING *s, INTVAL nchars)
{
    return (nchars * s->encoding->max_bytes);
}

/*=for api string string_concat
 * Concatenate two strings. If necessary, convert the second string's
 * encoding and/or type to match those of the first string. If either
 * string is NULL, return a copy of the non-NULL string. If both
 * strings are NULL, create and return a new zero-length string.
 */
STRING *
string_concat(struct Parrot_Interp *interpreter, STRING *a,
              STRING *b, UINTVAL Uflags)
{
    STRING *result;

    UNUSED(Uflags);

    if (a != NULL && a->strlen != 0) {
        if (b != NULL && b->strlen != 0) {
            if (a->type != b->type || a->encoding != b->encoding) {
                b = string_transcode(interpreter, b, a->encoding, a->type,
                                     NULL);
            }
            result = string_make(interpreter, NULL, a->bufused + b->bufused,
                                 a->encoding, 0, a->type);
            mem_sys_memcopy(result->strstart, a->strstart, a->bufused);
            mem_sys_memcopy((void *)((ptrcast_t)result->strstart + a->bufused),
                             b->strstart, b->bufused);
            result->strlen = a->strlen + b->strlen;
            result->bufused = a->bufused + b->bufused;
        }
        else {
            return string_copy(interpreter, a);
        }
    }
    else {
        if (a != NULL) {
            /* XXX
             * string_transcode may here be used as string_copy, which is
             * the only case, where string_transcode STRING isn't
             * const */
            return string_transcode(interpreter, b, a->encoding, a->type,
                                    NULL);
        }
        else {
            if (b != NULL) {
                return string_copy(interpreter, b);
            }
            else {
                return string_make(interpreter, NULL, 0, NULL, 0, NULL);
            }
        }
    }
    return result;
}

/*=for api string string_repeat
 * repeat the string I<s> I<num> times, storing result in I<d>.
 * Allocates I<d> if needed, also returns d.
*/
STRING *
string_repeat(struct Parrot_Interp *interpreter, const STRING *s, UINTVAL num,
              STRING **d)
{
    STRING *dest;
    UINTVAL i;

    dest = string_make(interpreter, NULL, s->bufused * num, s->encoding, 0,
                       s->type);
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

/*=for api string string_substr
 * substr out the offset of src for length and store it in d.  Also return d.
 * Allocate memory for d if necessary.
 */
STRING *
string_substr(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING **d, int replace_dest)
{
    STRING *dest;
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;

    true_offset = (UINTVAL)offset;

    /* Allow regexes to return $' easily for "aaa" =~ /aaa/ */
    if (offset == (INTVAL)string_length(src) || length < 1) {
        return string_make(interpreter, NULL, 0, src->encoding, 0, src->type);
    }

    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    if (true_offset > src->strlen - 1) {        /* 0 based... */
        internal_exception(SUBSTR_OUT_OF_STRING,
                "Cannot take substr outside string");
    }

    true_length = (UINTVAL)length;
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }

    /* do in-place i.e. reuse existing header if one */
    if (replace_dest)
        dest = string_set(interpreter, *d, src);
    else
        dest = make_COW_reference(interpreter, src);

    if (src->encoding->index == enum_encoding_singlebyte) {
        dest->strstart = (char *)dest->strstart + true_offset;
        dest->bufused = true_length;
    }
    else {
        substart_off = (const char *)src->encoding->skip_forward(src->strstart,
                true_offset) -
            (char *)src->strstart;
        subend_off =
            (const char *)src->encoding->skip_forward((char *)src->strstart +
                                                      substart_off,
                                                      true_length) -
            (char *)src->strstart;

        if (subend_off < substart_off) {
            internal_exception(SUBSTR_OUT_OF_STRING,
                    "substr: subend somehow is less than substart");
        }

        dest->strstart = (char *)dest->strstart + substart_off;
        dest->bufused = subend_off - substart_off;
    }
    dest->strlen = true_length;

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*
 * This should follow the Perl semantics for:
 *      substr EXPR, OFFSET, LENGTH, REPLACEMENT
 * Replace substring of src with rep, returning what was there before.
 * Replacing a slice with a longer string grows the string;
 *      a shorter string shrinks it.
 * Replacing 2 past the end of the string is undefined.
 *      however replacing 1 past does a concat.
 * A negative offset is allowed to replace from the end.
 */
STRING *
string_replace(struct Parrot_Interp *interpreter, STRING *src,
              INTVAL offset, INTVAL length, STRING *rep, STRING **d)
{
    STRING *dest;
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;
    INTVAL diff;

    true_offset = (UINTVAL)offset;
    true_length = (UINTVAL)length;
    if (rep->encoding != src->encoding || rep->type != src->type) {
        rep = string_transcode(interpreter, rep, src->encoding, src->type,
                               NULL);
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
    substart_off = (const char *)src->encoding->skip_forward(src->strstart,
                                                       true_offset) -
        (char *)src->strstart;
    subend_off =
        (const char *)src->encoding->skip_forward((char *)src->strstart +
                                            substart_off,
                                            true_length) -
        (char *)src->strstart;

    if (subend_off < substart_off) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                           "replace: subend somehow is less than substart");
    }

    /* XXX if *d == NULL, dest is unused, we could drop below lines
     * for this case
     * -leo
     */
    dest =
        string_make(interpreter, NULL, true_length * src->encoding->max_bytes,
                    src->encoding, 0, src->type);

    mem_sys_memcopy(dest->strstart, (char *)src->strstart + substart_off,
                    (unsigned)(subend_off - substart_off));
    dest->bufused = subend_off - substart_off;
    dest->strlen = true_length;

    if (d != NULL) {
        *d = dest;
    }

    /* Now do the replacement */

    /*
     * If the replacement string fits inside the original substring
     * don't create a new string, just pack it.
     */
    diff = (subend_off - substart_off) - rep->bufused;

    if(diff >= 0
        || ((INTVAL)src->bufused - (INTVAL)src->buflen) <= diff) {
        unmake_COW(interpreter, src);

        if(diff != 0) {
            mem_sys_memmove((char*)src->strstart + substart_off + rep->bufused,
                                (char*)src->strstart + subend_off,
                                src->bufused - subend_off);
            src->bufused -= diff;
        }

        mem_sys_memcopy((char*)src->strstart + substart_off,
                                rep->strstart, rep->bufused);
        if(diff != 0)
            (void)string_compute_strlen(src);
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
        (void)string_compute_strlen(src);
    }

    /* src is modified, now return the original substring */
    return dest;
}

/*=for api string string_chopn
 * chop off the last n characters of s.
 * if n is negative, cut the string after +n characters
 */
STRING *
string_chopn(STRING *s, INTVAL n)
{
    UINTVAL new_length;
    struct string_iterator_t it;

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

    string_iterator_init(&it, s);
    if (new_length > 0)
        it.set_position(&it, new_length);
    s->strlen = new_length;
    s->bufused = it.bytepos;
    return s;
}

/*=for api string string_compare
 * compare two strings, performing type and encoding conversions if
 * necessary.
 * return -1, 0, 1 if s1 < , == , > s2
 */
INTVAL
string_compare(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2)
{
    const char *s1start;
    const char *s1end;
    const char *s2start;
    const char *s2end;
    INTVAL cmp;

    if (!s1 && !s2) {
        return 0;
    }
    if (!s2) {
        return s1->strlen != 0;
    }
    if (!s1) {
        return -(s2->strlen != 0);
    }

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, 1);
#  endif

    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                NULL);
    }

    s1start = s1->strstart;
    s1end = s1start + s1->bufused;
    s2start = s2->strstart;
    s2end = s2start + s2->bufused;

    if (s1->encoding->index == enum_encoding_singlebyte) {
        size_t minlen = s1->bufused > s2->bufused ? s2->bufused : s1->bufused;

        cmp = memcmp(s1start, s2start, minlen);
        s1start += minlen;
        s2start += minlen;
    }
    else {
        cmp = 0;
        while (cmp == 0 && s1start < s1end && s2start < s2end) {
            INTVAL c1 = s1->encoding->decode(s1start);
            INTVAL c2 = s2->encoding->decode(s2start);

            cmp = c1 - c2;

            s1start = s1->encoding->skip_forward(s1start, 1);
            s2start = s2->encoding->skip_forward(s2start, 1);
        }
    }

    if (cmp == 0) {
        if (s1start < s1end)
            cmp = 1;
        else if (s2start < s2end)
            cmp = -1;
    }
    else if (cmp > 0) {
        cmp = 1;
    }
    else
        cmp = -1;

    return cmp;
}

/*=for api hash_string_equal
 * compare 2 strings, which are non-null and properly transcoded
 * return 0 if equal
 */
INTVAL
hash_string_equal(struct Parrot_Interp *interpreter, STRING *s1, STRING *s2)
{
    struct string_iterator_t i1;
    struct string_iterator_t i2;

    /*
     * both strings aren't null
     */
    if (s1->strlen != s2->strlen)
        return 1;       /* we don't care which is bigger */
    if (!s1->strlen)
        return 0;
    /*
     * both strings have equal amount of chars
     */

    /* speed up ascii, slow down general case
     */
    if (s1->encoding->index == enum_encoding_singlebyte &&
        s2->encoding->index == enum_encoding_singlebyte) {
        return memcmp(s1->strstart, s2->strstart, s1->bufused);
    }

    string_iterator_init(&i1, s1);
    string_iterator_init(&i2, s2);
    while (i1.charpos < s1->strlen) {
        if (i1.decode_and_advance(&i1) != i2.decode_and_advance(&i2))
            return 1;
    }
    return 0;
}

/*=for api string string_equal
 * compare two strings, performing type and encoding conversions if
 * necessary, like string_compare, but just return 0 = equal else unequal
 */
INTVAL
string_equal(struct Parrot_Interp *interpreter, STRING *s1, STRING *s2)
{
    if (!s1 && !s2) {
        return 0;
    }
    if (!s2) {
        return s1->strlen != 0;
    }
    if (!s1) {
        return s2->strlen != 0;
    }

#  if ! DISABLE_GC_DEBUG
    /* It's easy to forget that string comparison can trigger GC */
    if (GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, 1);
#  endif

    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                NULL);
    }
    return hash_string_equal(interpreter, s1, s2);
}

/* 
 * Make string writable with specified minimum length 
 * Encoding and type are required in case a new string has to be created
 */
static void
make_writable(struct Parrot_Interp *interpreter, STRING **s, 
              const size_t len, const ENCODING *enc, const CHARTYPE *type)
{
    if (!*s)
        *s = string_make(interpreter, NULL, len, enc, 0, type);
    else if ((*s)->buflen < len)
        string_grow(interpreter, *s, len - (*s)->buflen);
    else if (PObj_is_cowed_TESTALL(*s)) 
        unmake_COW(interpreter, *s);
}

/*=for api string string_bitwise_and
 * and two strings, performing type and encoding conversions if
 * necessary. If *dest != NULL reuse dest, else create a new result
 */
STRING *
string_bitwise_and(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    const char *s1start;
    const char *s2start;
    char *dp;
    STRING *res = NULL;
    size_t len;

    if (dest && *dest)
        res = *dest;
    else if (!s1 || !s2)
        res = string_make(interpreter, NULL, 0, NULL, 0, NULL);

    if (!s1 || !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, 1);

    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                NULL);
    }

    len = s1->bufused;
    if (s2->bufused < len)
        len = s2->bufused;
    make_writable(interpreter, &res, len, s1->encoding, s1->type);

    s1start = s1->strstart;
    s2start = s2->strstart;
    dp = res->strstart;
    res->bufused = len;

    for ( ; len ; ++s1start, ++s2start, ++dp, --len)
        *dp = *s1start & *s2start;
    res->strlen = s1->strlen;
    if (s2->strlen < s1->strlen)
        res->strlen = s2->strlen;

    if (dest)
        *dest = res;
    return res;
}

/*=for api string string_bitwise_or
 * or two strings, performing type and encoding conversions if
 * necessary. If *dest != NULL reuse dest, else create a new result
 */
STRING *
string_bitwise_or(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    const char *s1start;
    const char *s2start;
    const char *s1end;
    const char *s2end;
    char *dp;
    STRING *res = NULL;
    size_t len;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make(interpreter, NULL, 0, NULL, 0, NULL);

    if (!s1 && !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, 1);

    if (s1 && s2) {
        if (s1->type != s2->type || s1->encoding != s2->encoding) {
            s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                    NULL);
            s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                    NULL);
        }
    }

    len = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > len)
        len = s2->bufused;
    make_writable(interpreter, &res, len, s1 ? s1->encoding : s2->encoding, 
                  s1 ? s1->type : s2->type);

    if (s1) {
        s1start = s1->strstart;
        s1end = s1start + s1->bufused;
        res->strlen = s1->strlen;
    }
    else
        s1start = s1end = NULL;
    if (s2) {
        s2start = s2->strstart;
        s2end = s2start + s2->bufused;
        if (!s1 || s2->strlen > s1->strlen)
            res->strlen = s2->strlen;
    }
    else
        s2start = s2end = NULL;
    dp = res->strstart;
    res->bufused = len;

    for ( ; len ; ++s1start, ++s2start, ++dp, --len) {
        if (s1start < s1end && s2start < s2end)
            *dp = *s1start | *s2start;
        else if (s1start < s1end)
            *dp = *s1start;
        else
            *dp = *s2start;
    }

    if (dest)
        *dest = res;

    return res;
}

/*=for api string string_bitwise_xor
 * or two strings, performing type and encoding conversions if
 * necessary. If *dest != NULL reuse dest, else create a new result
 */
STRING *
string_bitwise_xor(struct Parrot_Interp *interpreter, STRING *s1,
               STRING *s2, STRING **dest)
{
    const char *s1start;
    const char *s2start;
    const char *s1end;
    const char *s2end;
    char *dp;
    STRING *res = NULL;
    size_t len;

    if (dest && *dest)
        res = *dest;
    else if (!s1 && !s2)
        res = string_make(interpreter, NULL, 0, NULL, 0, NULL);

    if (!s1 && !s2) {
        res->bufused = 0;
        res->strlen = 0;
        return res;
    }

    /* trigger GC for debug */
    if (interpreter && GC_DEBUG(interpreter))
        Parrot_do_dod_run(interpreter, 1);

    if (s1 && s2) {
        if (s1->type != s2->type || s1->encoding != s2->encoding) {
            s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                    NULL);
            s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                    NULL);
        }
    }

    len = s1 ? s1->bufused: 0;
    if (s2 && s2->bufused > len)
        len = s2->bufused;
    make_writable(interpreter, &res, len, s1 ? s1->encoding : s2->encoding, 
                  s1 ? s1->type : s2->type);

    if (s1) {
        s1start = s1->strstart;
        s1end = s1start + s1->bufused;
        res->strlen = s1->strlen;
    }
    else
        s1start = s1end = NULL;
    if (s2) {
        s2start = s2->strstart;
        s2end = s2start + s2->bufused;
        if (!s1 || s2->strlen > s1->strlen)
            res->strlen = s2->strlen;
    }
    else
        s2start = s2end = NULL;
    dp = res->strstart;
    res->bufused = len;

    for ( ; len ; ++s1start, ++s2start, ++dp, --len) {
        if (s1start < s1end && s2start < s2end)
            *dp = *s1start ^ *s2start;
        else if (s1start < s1end)
            *dp = *s1start;
        else
            *dp = *s2start;
    }

    if (dest)
        *dest = res;

    return res;
}

/* A string is "true" if it is equal to anything but "" and "0" */
INTVAL
string_bool(const STRING *s)
{
    INTVAL len;
    if (s == NULL) {
        return 0;
    }

    len = string_length(s);

    if (len == 0) {
        return 0;
    }

    if (len == 1) {

        UINTVAL c = s->encoding->decode(s->strstart);

        if (Parrot_char_is_digit(s->type,c)
         && s->type->get_digit(s->type,c) == 0) {
            return 0;
        }
    }

    return 1;                   /* it must be true */
}

/*=for api string string_nprintf
 * like Parrot_snprintf, but writes to, and returns, a STRING.
 *
 * bytelen does _not_ include space for a (non-existent) trailing null.
 * dest may be a null pointer, in which case a new native string will
 * be created. If bytelen is zero, the behaviour becomes more
 * sprintf-ish than snprintf-like.  bytelen is measured in dest's encoding.
 */
STRING*
string_nprintf(struct Parrot_Interp *interpreter,
               STRING *dest, INTVAL bytelen, const char *format, ...)
{
    STRING *output;
    const ENCODING *dest_encoding;
    va_list args;

    va_start(args, format);
    output = Parrot_vsprintf_c(interpreter, format, args);
    va_end(args);

    dest_encoding = (dest != NULL) ? dest->encoding : NULL;
    string_transcode(interpreter, output, dest_encoding, NULL, &output);

    if(bytelen > 0 && bytelen < (INTVAL)string_length(output)) {
        string_substr(interpreter, output, 0, bytelen, &output, 1);
    }

    if(dest == NULL) {
        return output;
    }
    else {
        string_set(interpreter, dest, output);
        return dest;
    }
}

/* A number is such that:
  sign           =  '+' | '-'
  digit          =  "Any code point considered a digit by the chartype"
  indicator      =  'e' | 'E'
  digits         =  digit [digit]...
  decimal-part   =  digits '.' [digits] | ['.'] digits
  exponent-part  =  indicator [sign] digits
  numeric-string =  [sign] decimal-part [exponent-part]

  An integer is the appropriate integer representation of such a number,
  rounding towards zero.
*/

INTVAL
string_to_int(const STRING *s)
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
    return (INTVAL) string_to_num(s);
#endif
}

FLOATVAL
string_to_num(const STRING *s)
{
    FLOATVAL f = 0.0;

    if (s) {
        const char *start = s->strstart;
        const char *end = start + s->bufused;
        int sign = 1;
        INTVAL seen_dot = 0;
        INTVAL seen_e = 0;
        int exp_sign = 0;
        INTVAL in_exp = 0;
        INTVAL in_number = 0;
        FLOATVAL exponent = 0;
        INTVAL fake_exponent = 0;
        INTVAL digit_family = 0;

        while (start < end) {
            UINTVAL c = s->encoding->decode(start);
            INTVAL df = Parrot_char_is_digit(s->type,c);

            if (df && !digit_family)
                digit_family = df;

            if (df && df == digit_family) {
                if (in_exp) {
                    exponent = exponent * 10 + s->type->get_digit(s->type,c);
                    if (!exp_sign) {
                        exp_sign = 1;
                    }
                }
                else {
                    /* We're somewhere in the main string of numbers */
                    in_number = 1;
                    f = f * 10 + s->type->get_digit(s->type,c);
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

            start = s->encoding->skip_forward(start, 1);
        }

        exponent = fake_exponent + exponent * exp_sign;

        f = f * sign * pow(10.0, exponent);     /* ugly, oh yeah */
    }

    return f;
}

STRING *
string_from_int(struct Parrot_Interp * interpreter, INTVAL i) {
    char buf[128];
    return int_to_str(interpreter, buf, i, 10);
}

/* Stolen, with modifications, from perlnum.pmc */
STRING *
string_from_num(struct Parrot_Interp * interpreter, FLOATVAL f)
{
    /* Too damn hard--hand it off to Parrot_sprintf, which'll probably
       use the system sprintf anyway, but has gigantic buffers that are
       awfully hard to overflow. */
    return Parrot_sprintf_c(interpreter, "%vg", f);
}

char *
string_to_cstring(struct Parrot_Interp * interpreter, STRING * s)
{
#if 0
    if (s->buflen == s->bufused) {
        string_grow(interpreter, s, 1);
    }
    else
        unmake_COW(interpreter, s);

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
   free up a string returned by string_to_cstring. Hopefully this can
   be a noop at some point, as it's got all sorts of leak potential otherwise.
 */
void
string_cstring_free(void *ptr) {
    free(ptr);
}

/*for api string_pin
 * replace the managed buffer memory by system memory
 */
void
string_pin(struct Parrot_Interp * interpreter, STRING * s) {
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
    unmake_COW(interpreter, s);
    size = s->buflen;
    memory = mem_sys_allocate(size);
    mem_sys_memcopy(memory, s->bufstart, size);
    s->bufstart = memory;
    /* Mark the memory as both from the system and immobile */
    PObj_flags_SETTO(s, PObj_get_FLAGS(s) |
        (PObj_immobile_FLAG | PObj_sysmem_FLAG));
}

/*for api string_unpin
 * undo a string_pin: used managed memory
 */

void
string_unpin(struct Parrot_Interp * interpreter, STRING * s) {
    void *memory;
    INTVAL size;

    /* If this string is not marked using system memory,
     * we just don't do this
     */
    if (!(PObj_sysmem_TEST(s))) {
        return;
    }

    /* unmake_COW(interpreter, s); XXX -lt: can not be cowed ??? */
    size = s->buflen;
    /* We need a handle on the fixed memory so we can get rid of it
       later */
    memory = s->bufstart;
    /* Reallocate it the same size
     * NOTE can't use Parrot_reallocate_string because of the LEA
     * allocator, where this is a noop for the same size
     *
     * We have to block GC here, as we have a pointer to bufstart
     */
    Parrot_block_GC(interpreter);
    Parrot_allocate_string(interpreter, s, size);
    Parrot_unblock_GC(interpreter);
    mem_sys_memcopy(s->bufstart, memory, size);
    /* Mark the memory as neither immobile nor system allocated */
    PObj_immobile_CLEAR(s);
    PObj_sysmem_CLEAR(s);
    /* Free up the memory */
    mem_sys_free(memory);
}

void
string_iterator_init(struct string_iterator_t *i, const STRING *s)
{
    i->str = s;
    i->bytepos = 0;
    i->charpos = 0;
    /* XXX change this to a bulk copy */
    i->decode_and_advance = s->encoding->decode_and_advance;
    i->set_position = s->encoding->set_position;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
