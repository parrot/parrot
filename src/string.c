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
string_init(void) {
    string_native_type = chartype_lookup("usascii");
    string_unicode_type = chartype_lookup("unicode");
}

/*=for api string string_make
 * allocate memory for the string, copy information into it
 * and compute its string length
 */
STRING *
string_make(struct Parrot_Interp *interpreter, const void *buffer,
            INTVAL buflen, const ENCODING *encoding, INTVAL flags,
            const CHARTYPE *type) {
    STRING *s;

    if (!type) {
      type = string_native_type;
    }

    if (!encoding) {
      encoding = encoding_lookup(type->default_encoding);
    }

    s = mem_sys_allocate(sizeof(STRING));
    s->bufstart = mem_sys_allocate(buflen+1);
    s->encoding = encoding;
    s->flags = flags;
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

    /* Make it null terminate. This will simplify making a native string */
    memset(s->bufstart+s->bufused,0,1);

    return s;
}

/*=for api string string_destroy
 * free the strings memory
 */
void
string_destroy(STRING *s) {
    free_string(s);
}

/* Ordinary user-visible string operations */

/*=for api string string_length
 * return the length of the string
 */
INTVAL
string_length(const STRING* s) {
    return s->strlen;
}

/*=for api string string_index
 * return the character (or glyph, depending upon the string's encoding)
 * This is to abstract the process of finding the Nth character in a (possibly
 * unicode or JIS-encoded) string, the idea being that once the encoding
 * functions are fleshed out, this function can DTRT.
 */
static INTVAL
string_index(const STRING* s, INTVAL index) {
    return s->encoding->decode(s->encoding->skip_forward(s->bufstart, index));
}

/*=for api string string_ord
 * return the length of the string
 */
INTVAL
string_ord(const STRING* s, INTVAL index) {
    if((s == NULL) || (string_length(s) == 0)) {
        INTERNAL_EXCEPTION(ORD_OUT_OF_STRING,
                           "Cannot get character of empty string");
    }
    else {
        int len = string_length(s);
	if((index > (len - 1)) ||
	   (index < 0 && -index > len)
          )
        {
            INTERNAL_EXCEPTION(ORD_OUT_OF_STRING,
                               "Cannot get character past end of string");
        }
        else {
	    if(index < 0) {
		return string_index(s,len+index);
            }
            else {
		return string_index(s,index);
            }
        }
    }
    return -1;
}

/*=for api string string_copy
 * create a copy of the argument passed in
 */
STRING*
string_copy(struct Parrot_Interp *interpreter, const STRING *s) {
    return string_make(interpreter, s->bufstart, s->bufused, s->encoding,
                       s->flags, s->type);
}

/*=for api string string_transcode
 * create a transcoded copy of the argument passed in
 */
STRING*
string_transcode(struct Parrot_Interp *interpreter,
                 const STRING *src, const ENCODING *encoding,
                 const CHARTYPE *type, STRING **dest_ptr) {

    STRING *dest;
    CHARTYPE_TRANSCODER transcoder1 = NULL;
    CHARTYPE_TRANSCODER transcoder2 = NULL;
    void *srcstart;
    void *srcend;
    void *deststart;
    void *destend;

    if (src->encoding == encoding && src->type == type) {
        return string_copy(interpreter, src);
    }

    dest = string_make(interpreter, NULL, src->strlen*src->encoding->max_bytes,
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

    srcstart = (void*)src->bufstart;
    srcend = srcstart + src->bufused;
    deststart = dest->bufstart;
    destend = deststart + dest->buflen;

    while (srcstart < srcend) {
        INTVAL c = src->encoding->decode(srcstart);

        if (transcoder1) c = transcoder1(c);
        if (transcoder2) c = transcoder2(c);

        deststart = dest->encoding->encode(deststart, c);

        srcstart = src->encoding->skip_forward(srcstart, 1);
    }

    dest->bufused = destend - deststart;
    dest->strlen = src->strlen;
    memset(dest->bufstart+dest->bufused,0,1);

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
string_compute_strlen(STRING* s) {
    s->strlen = s->encoding->characters(s->bufstart, s->bufused);
    return s->strlen;
}

/*=for api string string_concat
 * concatenate two strings
 */
STRING*
string_concat(struct Parrot_Interp *interpreter, const STRING* a,
              const STRING* b, INTVAL flags) {
    STRING *result;

    if (a != NULL && a->strlen != 0) {
        if (b != NULL && b->strlen != 0) {
            result = string_make(interpreter, NULL, a->bufused +
                                 b->strlen*a->encoding->max_bytes,
                                 a->encoding, 0, a->type);
            mem_sys_memcopy(result->bufstart,a->bufstart,a->bufused);
            if (a->type != b->type || a->encoding != b->encoding) {
                b = string_transcode(interpreter, b, a->encoding, a->type, NULL);
            }
            mem_sys_memcopy((void*)((ptrcast_t)result->bufstart + a->bufused),
                            b->bufstart, b->bufused);
            result->strlen = a->strlen + b->strlen;
            result->bufused = a->bufused + b->bufused;
            memset(result->bufstart+result->bufused,0,1);
        }
        else {
            return string_copy(interpreter, a);
        }
    }
    else {
        if (a != NULL) {
            return string_transcode(interpreter, b, a->encoding, a->type, NULL);
        }
        else {
            if (b != NULL) {
                return string_copy(interpreter, b);
            }
            else {
                return string_make(interpreter, "", 0, NULL, 0, NULL);
            }
        }
    }
    return result;
}

/*=for api string string_repeat
 * repeat the string I<s> I<num> times, storing result in I<d>.
 * Allocates I<d> if needed, also returns d.
*/
STRING*
string_repeat(struct Parrot_Interp *interpreter, const STRING* s, INTVAL num, STRING** d) {
    STRING* dest;
    INTVAL i;

    if (num < 0) {
        INTERNAL_EXCEPTION(NEG_REPEAT, "Cannot repeat with negative arg");
    }

    dest = string_make(interpreter, NULL, s->bufused*num, s->encoding, 0,
                       s->type);
    if (num == 0) {
        return dest;
    }

    /* copy s into dest num times */
    for (i = 0; i< num; i++) {
        mem_sys_memcopy((void*)((ptrcast_t)dest->bufstart+s->bufused * i),
                        s->bufstart, s->bufused);
    }

    dest->bufused = s->bufused * num;
    dest->strlen = s->strlen *num;

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*=for api string string_substr
 * substr out the offset of src for length and store it in d.  Also return d.
 * Allocate memory for d if necessary.
 */
STRING*
string_substr(struct Parrot_Interp *interpreter, const STRING* src, INTVAL offset, INTVAL length, STRING** d) {
    STRING *dest;
    void *substart;
    void *subend;
    if (offset < 0) {
        offset = src->strlen + offset;
    }
    if (offset < 0 || offset > src->strlen-1) { /* 0 based... */
        INTERNAL_EXCEPTION(SUBSTR_OUT_OF_STRING,
                           "Cannot take substr outside string")
    }
    if (length < 0) {
        length = 0;
    }
    if (length > (src->strlen - offset) ) {
        length = src->strlen - offset;
    }
    dest = string_make(interpreter, NULL, length*src->encoding->max_bytes,
                       src->encoding, 0, src->type);
    substart = src->encoding->skip_forward(src->bufstart, offset);
    subend = src->encoding->skip_forward(substart, length);
    mem_sys_memcopy(dest->bufstart, substart, subend - substart);
    dest->bufused = subend - substart;
    dest->strlen = length;
    memset(dest->bufstart+dest->bufused,0,1);

    if (d != NULL) {
        *d = dest;
    }
    return dest;
}

/*=for api string string_chopn
 * chop the last n bytes off of s.
 */
STRING*
string_chopn(STRING* s, INTVAL n) {
    void *bufstart = s->bufstart;
    void *bufend = bufstart + s->bufused;
    if (n > s->strlen) {
        n = s->strlen;
    }
    if (n < 0) {
        n = 0;
    }
    bufend = s->encoding->skip_backward(bufend, n);
    s->bufused = bufend - bufstart;
    s->strlen = s->strlen - n;
    memset(s->bufstart+s->bufused,0,1);
    return s;
}

/*=for api string string_compare
 * compare two strings.
 */
INTVAL
string_compare(struct Parrot_Interp *interpreter, const STRING* s1,
               const STRING* s2) {
    void *s1start;
    void *s1end;
    void *s2start;
    void *s2end;
    INTVAL cmp = 0;

    if (s1->type != s2->type || s1->encoding != s2->encoding) {
        s1 = string_transcode(interpreter, s1, NULL, string_unicode_type,
                              NULL);
        s2 = string_transcode(interpreter, s2, NULL, string_unicode_type,
                              NULL);
    }

    s1start = (void*)s1->bufstart;
    s1end = s1start + s1->bufused;
    s2start = (void*)s2->bufstart;
    s2end = s2start + s2->bufused;

    while (cmp == 0 && s1start < s1end && s2start < s2end) {
        INTVAL c1 = s1->encoding->decode(s1start);
        INTVAL c2 = s2->encoding->decode(s2start);

        cmp = c1 - c2;

        s1start = s1->encoding->skip_forward(s1start, 1);
        s2start = s2->encoding->skip_forward(s2start, 1);
    }

    if (cmp == 0 && s1start < s1end) cmp = 1;
    if (cmp == 0 && s2start < s2end) cmp = -1;

    return cmp;
}

/* A string is "true" if it is equal to anything but "" and "0" */
BOOLVAL string_bool (const STRING* s) {
    INTVAL len;
    if (s == NULL) {
        return 0;
    }

    len = string_length(s);

    if (len == 0) {
        return 0;
    }

    if (len == 1) {
        INTVAL c = s->encoding->decode(s->bufstart);
        if (s->type->is_digit(c) && s->type->get_digit(c) == 0) {
            return 0;
        }
    }

    return 1; /* it must be true */
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

INTVAL string_to_int (const STRING *s) {
    INTVAL i = 0;

    if (s) {
        void *start = (void*)s->bufstart;
        void *end = start + s->bufused;
        int sign = 1;
        BOOLVAL in_number = 0;

        while (start < end) {
            INTVAL c = s->encoding->decode(start);

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

FLOATVAL string_to_num (const STRING *s) {
    FLOATVAL f = 0.0;

    if (s) {
        void *start = (void*)s->bufstart;
        void *end = start + s->bufused;
        int sign = 1;
        BOOLVAL seen_dot = 0;
        BOOLVAL seen_e = 0;
        int exp_sign = 0;
        BOOLVAL in_exp = 0;
        BOOLVAL in_number = 0;
        INTVAL exponent = 0;
        INTVAL fake_exponent = 0;

        while (start < end) {
            INTVAL c = s->encoding->decode(start);

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
                if (c == '-') {         /* XXX: ascii*/
                    sign = -1;
                }
                else if (c == '.') {    /* XXX: ascii*/
                    seen_dot = 1;
                }
                else {
                    seen_dot = 0;
                    sign = 1;
                }
            }
            else {
                /* we've seen some digits, are we done yet? */
                if (!seen_dot && c == '.' && !in_exp) { /* XXX: ascii*/
                    seen_dot = 1;
                }
                else if (!seen_e && (c == 'e' || c == 'E')) { /* XXX: ascii*/
                    seen_e = 1;
                    in_exp = 1;
                }
                else if (seen_e && !exp_sign) {
                    if (c == '+') {                        /* XXX: ascii*/
                        exp_sign = 1;
                    }
                    else if (c == '-') {                   /* XXX: ascii*/
                        exp_sign = -1;
                    }
                    else {
                        break; /* e-- is silly */
                    }
                }
                else {
                    break; /* run out of number, all done */
                }
            }

            start = s->encoding->skip_forward(start, 1);
        }

        exponent = fake_exponent + exponent * exp_sign;

        f = f * sign * pow(10, exponent); /* ugly, oh yeah */
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





