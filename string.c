/* string.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api definitions for the string subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static const CHARTYPE *string_native_type;
static const CHARTYPE *string_unicode_type;

/* Basic string stuff - creation, enlargement, destruction, etc. */

/*=for api string string_init
 * set up the native string vtable
 */
void
string_init(void)
{
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
}

/*=for api string string_make
 * allocate memory for the string, copy information into it
 * and compute its string length
 */
STRING *
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            UINTVAL buflen, const ENCODING *encoding, UINTVAL flags,
            const CHARTYPE *type)
{
    STRING *s;

    if (!type) {
        type = string_native_type;
    }

    if (!encoding) {
        encoding = encoding_lookup(type->default_encoding);
    }

    s = new_string_header(interpreter);
    s->bufstart = Parrot_allocate(interpreter, buflen);
    s->encoding = encoding;
    /* Make sure we maintain the flags we might already have on the
     * string header we just fetched */
    s->flags |= flags;
    s->type = type;
    s->buflen = buflen;

    if (buffer) {
        mem_sys_memcopy(s->bufstart, buffer, buflen);
        s->bufused = buflen;
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
    void * newbuf;
    INTVAL copysize = s->bufused;
    if(addlen < 0)
        copysize += addlen;
    if(copysize <= 0)
        return s;
    /* Don't check buflen, if we are here, we already checked. */
    newbuf = Parrot_allocate(interpreter, s->buflen + addlen);
    mem_sys_memcopy(newbuf, s->bufstart, (UINTVAL)copysize);
    s->bufstart = newbuf;
    s->buflen += addlen;
    return s;
}

/*=for api string string_destroy
 * free the strings memory
 */
void
string_destroy(STRING *s)
{
    free_buffer((Buffer *)s);
}

/* Ordinary user-visible string operations */

/*=for api string string_length
 * return the length of the string
 */
UINTVAL
string_length(const STRING *s)
{
    return s->strlen;
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
    return s->encoding->decode(s->encoding->skip_forward(s->bufstart, idx));
}

/*=for api string string_ord
 * return the length of the string
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
string_copy(struct Parrot_Interp *interpreter, const STRING *s)
{
    STRING *d;
    d = new_string_header(interpreter);
    d->bufstart = Parrot_allocate(interpreter, s->buflen);
    d->buflen = s->buflen;
    d->flags = s->flags & (~(unsigned int)BUFFER_constant_FLAG);
    d->bufused = s->bufused;
    d->strlen = s->strlen;
    d->encoding = s->encoding;
    d->type = s->type;
    d->language = s->language;

    memcpy(d->bufstart, s->bufstart, s->buflen);

    return d;
}

/*=for api string string_transcode
 * create a transcoded copy of the argument passed in
 */
STRING *
string_transcode(struct Parrot_Interp *interpreter,
                 const STRING *src, const ENCODING *encoding,
                 const CHARTYPE *type, STRING **dest_ptr)
{
    STRING *dest;
    CHARTYPE_TRANSCODER transcoder1 = (CHARTYPE_TRANSCODER)NULLfunc;
    CHARTYPE_TRANSCODER transcoder2 = (CHARTYPE_TRANSCODER)NULLfunc;
    char *srcstart;
    char *srcend;
    char *deststart;
    char *destend;

    if (!encoding) {
        encoding = encoding_lookup_index(0);
        /* XXX This is a hack. I had thought it was:
         * encoding = encoding_lookup(src->type->default_encoding); 
         * but that seems really stupid, because transcoding two strings
         * to NULL wouldn't necessarily mean they have the same
         * encoding. So this seems to least bad compromise.
         */
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
            transcoder1 = chartype_lookup_transcoder(src->type,
                                                     string_unicode_type);
            transcoder2 = chartype_lookup_transcoder(string_unicode_type,
                                                     dest->type);
        }
    }

    srcstart = (void *)src->bufstart;
    srcend = srcstart + src->bufused;
    deststart = dest->bufstart;
    destend = deststart;

    while (srcstart < srcend) {
        UINTVAL c = src->encoding->decode(srcstart);

        if (transcoder1)
            c = transcoder1(c);
        if (transcoder2)
            c = transcoder2(c);

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
 * get the string length of the string
 */
INTVAL
string_compute_strlen(STRING *s)
{
    s->strlen = s->encoding->characters(s->bufstart, s->bufused);
    return s->strlen;
}

/*=for api string string_concat
 * concatenate two strings
 */
STRING *
string_concat(struct Parrot_Interp *interpreter, const STRING *a,
              const STRING *b, UINTVAL Uflags)
{
    STRING *result;

    UNUSED(Uflags);


    if (a != NULL && a->strlen != 0) {
        if (b != NULL && b->strlen != 0) {
            result = string_make(interpreter, NULL, a->bufused +
                                 b->strlen * a->encoding->max_bytes,
                                 a->encoding, 0, a->type);
            mem_sys_memcopy(result->bufstart, a->bufstart, a->bufused);
            if (a->type != b->type || a->encoding != b->encoding) {
                b = string_transcode(interpreter, b, a->encoding, a->type,
                                     NULL);
            }
            mem_sys_memcopy((void *)((ptrcast_t)result->bufstart + a->bufused),
                            b->bufstart, b->bufused);
            result->strlen = a->strlen + b->strlen;
            result->bufused = a->bufused + b->bufused;
        }
        else {
            return string_copy(interpreter, a);
        }
    }
    else {
        if (a != NULL) {
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
        mem_sys_memcopy((void *)((ptrcast_t)dest->bufstart + s->bufused * i),
                        s->bufstart, s->bufused);
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
string_substr(struct Parrot_Interp *interpreter, const STRING *src,
              INTVAL offset, INTVAL length, STRING **d)
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

    true_length = (UINTVAL)length;
    if (offset < 0) {
        true_offset = (UINTVAL)(src->strlen + offset);
    }

    if (true_offset > src->strlen - 1) {        /* 0 based... */
        internal_exception(SUBSTR_OUT_OF_STRING,
                           "Cannot take substr outside string");
    }
    if (true_length > (src->strlen - true_offset)) {
        true_length = (UINTVAL)(src->strlen - true_offset);
    }

    substart_off = (char *)src->encoding->skip_forward(src->bufstart,
                                                       true_offset) -
        (char *)src->bufstart;
    subend_off =
        (char *)src->encoding->skip_forward((char *)src->bufstart +
                                            substart_off,
                                            true_length) -
        (char *)src->bufstart;

    dest =
        string_make(interpreter, NULL, true_length * src->encoding->max_bytes,
                    src->encoding, 0, src->type);

    if (subend_off < substart_off) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                           "subend somehow is less than substart");
    }

    mem_sys_memcopy(dest->bufstart, (char *)src->bufstart + substart_off,
                    (unsigned)(subend_off - substart_off));
    dest->bufused = subend_off - substart_off;
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
              INTVAL offset, INTVAL length, const STRING *rep, STRING **d)
{
    STRING *dest;
    UINTVAL substart_off;       /* Offset from start of string to our
                                 * piece */
    UINTVAL subend_off;         /* Offset from start of string to the
                                 * end of our piece */
    UINTVAL true_offset;
    UINTVAL true_length;
    UINTVAL new_length;
    UINTVAL new_size;
    INTVAL diff;
        
    true_offset = (UINTVAL)offset;
    true_length = (UINTVAL)length;

    if(rep->encoding != src->encoding || rep->type != src->type)
        rep = string_transcode(interpreter, rep, src->encoding, src->type, NULL);

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
    substart_off = (char *)src->encoding->skip_forward(src->bufstart,
                                                       true_offset) -
        (char *)src->bufstart;
    subend_off =
        (char *)src->encoding->skip_forward((char *)src->bufstart +
                                            substart_off,
                                            true_length) -
        (char *)src->bufstart;

    dest =
        string_make(interpreter, NULL, true_length * src->encoding->max_bytes,
                    src->encoding, 0, src->type);

    if (subend_off < substart_off) {
        internal_exception(SUBSTR_OUT_OF_STRING,
                           "subend somehow is less than substart");
    }

    mem_sys_memcopy(dest->bufstart, (char *)src->bufstart + substart_off,
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
    diff = dest->bufused - rep->bufused;
                
    if(diff >= 0
        || (INTVAL)(src->bufused - src->buflen) <= diff) {      
            
        mem_sys_memcopy((char*)src->bufstart + substart_off,
                                rep->bufstart, rep->bufused);
        if(diff > 0) {
            mem_sys_memmove((char*)src->bufstart + substart_off + rep->bufused,
                                (char*)src->bufstart + subend_off,
                                src->buflen - (subend_off - diff));
            src->bufused -= diff;
            (void)string_compute_strlen(src);    
        }
    }
    /*
     * Replacement is larger than avail buffer, grow the string
     */
    else {
        /* diff is negative here, make it positive */
        diff = -(diff);
        string_grow(interpreter, src, diff);
        
        /* Move the end of old string that isn't replaced to new offset first */
        mem_sys_memmove((char*)src->bufstart + subend_off + diff,
                                (char*)src->bufstart + subend_off,
                                src->buflen - subend_off);
        /* Copy the replacement in */
        mem_sys_memcopy((char *)src->bufstart + substart_off, rep->bufstart,
                                rep->bufused);
        src->bufused += diff;
        (void)string_compute_strlen(src);
    } 

    /* src is modified, now return the original substring */    
    return dest;
}

/*=for api string string_chopn
 * chop the last n bytes off of s.
 */
STRING *
string_chopn(STRING *s, INTVAL n)
{
    char *bufstart = s->bufstart;
    char *bufend = bufstart + s->bufused;
    UINTVAL true_n;

    true_n = (UINTVAL)n;
    if (n < 0) {
        true_n = 0;
    }
    if (true_n > s->strlen) {
        true_n = s->strlen;
    }

    bufend = s->encoding->skip_backward(bufend, true_n);

    s->bufused = bufend - bufstart;
    s->strlen = s->strlen - true_n;

    return s;
}

/*=for api string string_compare
 * compare two strings.
 */
INTVAL
string_compare(struct Parrot_Interp *interpreter, const STRING *s1,
               const STRING *s2)
{
    char *s1start;
    char *s1end;
    char *s2start;
    char *s2end;
    INTVAL cmp = 0;

    if (s1 && !s2) {
        return (string_length(s1) != 0);
    }
    if (s2 && !s1) {
        return (string_length(s2) != 0);
    }
    if (!s1 && !s2) {
        return 0;
    }
    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                              NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                              NULL);
    }

    s1start = s1->bufstart;
    s1end = s1start + s1->bufused;
    s2start = s2->bufstart;
    s2end = s2start + s2->bufused;

    while (cmp == 0 && s1start < s1end && s2start < s2end) {
        INTVAL c1 = s1->encoding->decode(s1start);
        INTVAL c2 = s2->encoding->decode(s2start);

        cmp = c1 - c2;

        s1start = s1->encoding->skip_forward(s1start, 1);
        s2start = s2->encoding->skip_forward(s2start, 1);
    }

    if (cmp == 0 && s1start < s1end)
        cmp = 1;
    if (cmp == 0 && s2start < s2end)
        cmp = -1;

    return cmp;
}

/* A string is "true" if it is equal to anything but "" and "0" */
BOOLVAL
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
        UINTVAL c = s->encoding->decode(s->bufstart);
        if (s->type->is_digit(c) && s->type->get_digit(c) == 0) {
            return 0;
        }
    }

    return 1;                   /* it must be true */
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
    INTVAL i = 0;

    if (s) {
        char *start = s->bufstart;
        char *end = start + s->bufused;
        int sign = 1;
        BOOLVAL in_number = 0;

        while (start < end) {
            UINTVAL c = s->encoding->decode(start);

            if (s->type->is_digit(c)) {
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
}

FLOATVAL
string_to_num(const STRING *s)
{
    FLOATVAL f = 0.0;

    if (s) {
        char *start = s->bufstart;
        char *end = start + s->bufused;
        int sign = 1;
        BOOLVAL seen_dot = 0;
        BOOLVAL seen_e = 0;
        int exp_sign = 0;
        BOOLVAL in_exp = 0;
        BOOLVAL in_number = 0;
        FLOATVAL exponent = 0;
        INTVAL fake_exponent = 0;

        while (start < end) {
            UINTVAL c = s->encoding->decode(start);

            if (s->type->is_digit(c)) {
                if (in_exp) {
                    exponent = exponent * 10 + s->type->get_digit(c);
                    if (!exp_sign) {
                        exp_sign = 1;
                    }
                }
                else {
                    /* We're somewhere in the main string of numbers */
                    in_number = 1;
                    f = f * 10 + s->type->get_digit(c);
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
                else if (!seen_e && (c == 'e' || c == 'E')) {   /* XXX: ascii */
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

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
