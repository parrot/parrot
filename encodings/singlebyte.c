/* singlebyte.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This defines the single byte encoding routines.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

typedef unsigned char byte_t;

static INTVAL
singlebyte_characters (const void *ptr, INTVAL bytes) {
    return bytes;
}

static INTVAL
singlebyte_decode (const void *ptr) {
    const byte_t *bptr = ptr;

    return *bptr;
}

/* A number is such that:
  sign           =  '+' | '-'
  digit          =  '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
  indicator      =  'e' | 'E'
  digits         =  digit [digit]...
  decimal-part   =  digits '.' [digits] | ['.'] digits
  exponent-part  =  indicator [sign] digits
  numeric-string =  [sign] decimal-part [exponent-part]

  An integer is the appropriate integer representation of such a number,
  rounding towards zero.
*/

static INTVAL
singlebyte_extract_int (const void *ptr, INTVAL length) {
    char *s = (char*)ptr;
    return strtol(s, NULL, 10); /* XXX:FIXME */
}

/* What this does not do yet...
   o Check for overflow or warn about loss of precision
*/
static FLOATVAL
singlebyte_extract_num (const void*ptr, INTVAL length) {
    char *s = (char*)ptr;
    char *s2;
    
    int negative = 0;
    int seen_dot = 0;
    int seen_e = 0;
    int exp_sign = 0;
    int in_exp = 0;
    int in_number = 0;
    INTVAL exponent = 0;
    INTVAL fake_exponent = 0;
    FLOATVAL result = 0;
    int i = 0;
    int done = 0;

    for (s2 = s; s2 < s + length; s2++) { /* charge through the string */
        if (isdigit(*s2) && !in_exp) {
            /* We're somewhere in the main string of numbers */
            in_number = 1;
            result = result * 10 + (*s2 - '0');
            if (seen_dot) {
                fake_exponent--;
            }
        }
        else if (isdigit(*s2) && in_exp) {
            exponent = exponent * 10 + (*s2 - '0');
        }
        else if (!in_number) {
            /* we've not yet seen any digits */
            if (*s2 == '-') {
                negative = -1;
            }
            else if (*s2 == '.') {
                seen_dot = 1;
            }
            else {
                seen_dot = 0;
                negative = 0;
            }
        }
        else {
            /* we've seen some digits, are we done yet? */
            if (!seen_dot && *s2 == '.' && !in_exp) {
                seen_dot = 1;
            }
            else if (!seen_e && (*s2 == 'e' || *s2 == 'E')) {
                seen_e = 1;
                in_exp = 1;
            }
            else if (seen_e && !exp_sign) {
                if (*s2 == '+') {
                    exp_sign = 1;
                }
                else if (*s2 == '-') {
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
    }

    if (exp_sign == -1) {
        exponent = fake_exponent - exponent;
    }
    else {
        exponent = fake_exponent + exponent;
    }

    result = result * pow(10, exponent); /* ugly, oh yeah */

    if (negative) {
        result = - result;
    }

    return result;
    /* return strtod(s, NULL); */ /* XXX: Fixme! */
}

static void *
singlebyte_encode (void *ptr, INTVAL c) {
    byte_t *bptr = ptr;

    if (c < 0 || c > 255) {
        INTERNAL_EXCEPTION(INVALID_CHARACTER,
                           "Invalid character for single byte encoding\n");
    }

    *bptr = c;

    return bptr + 1;
}

static void *
singlebyte_skip_forward (void *ptr, INTVAL n) {
    byte_t *bptr = ptr;

    return bptr + n;
}

static void *
singlebyte_skip_backward (void *ptr, INTVAL n) {
    byte_t *bptr = ptr;

    return bptr - n;
}

const ENCODING singlebyte_encoding = {
    "singlebyte",
    1,
    singlebyte_characters,
    singlebyte_decode,
    singlebyte_extract_int,
    singlebyte_extract_num,
    singlebyte_encode,
    singlebyte_skip_forward,
    singlebyte_skip_backward
};

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
