/* transcode.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     This is the api definitions for the transcoding subsystem
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"
#include "parrot/unicode.h"

/*=for api transcode transcode_utf8_to_utf16
   transcode UTF-8 to UTF-16
 */
static STRING*
transcode_utf8_to_utf16(STRING* from, STRING* to)
{
    utf8_t *fp;
    utf16_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf16];
    }
    else {
        to = string_make(NULL, 0, enc_utf16, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf32_t c = *fp++;

        if (UNICODE_IS_INVARIANT(c)) {
            *tp++ = c;
        }
        else if (UTF8_IS_START(c)) {
            INTVAL len = UTF8SKIP(fp - 1);
            INTVAL count;

            c &= UTF8_START_MASK(len);
            for (count = 1; count < len; count++) {
                if (!UTF8_IS_CONTINUATION(*fp)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF8,
                                       "Malformed UTF-8 string\n");
                }
                c = UTF8_ACCUMULATE(c, *fp);
                fp++;
            }

            if (c < 0x10000u) {
                if (UNICODE_IS_SURROGATE(c)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF32,
                                       "Surrogate in UTF-8 string\n");
                }
                *tp++ = c;
            }
            else {
                *tp++ = UNICODE_HIGH_SURROGATE(c);
                *tp++ = UNICODE_LOW_SURROGATE(c);
            }
        }
        else {
            INTERNAL_EXCEPTION(MALFORMED_UTF8, "Malformed UTF-8 string\n");
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf16_t *)to->bufstart) * sizeof(utf16_t);

    return to;
}

/*=for api transcode transcode_utf8_to_utf32
   transcode UTF-8 to UTF-32
 */
static STRING*
transcode_utf8_to_utf32(STRING* from, STRING* to)
{
    utf8_t *fp;
    utf32_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf32];
    }
    else {
        to = string_make(NULL, 0, enc_utf32, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf32_t c = *fp++;

        if (UNICODE_IS_INVARIANT(c)) {
            *tp++ = c;
        }
        else if (UTF8_IS_START(c)) {
            INTVAL len = UTF8SKIP(fp - 1);
            INTVAL count;
            c &= UTF8_START_MASK(len);
            for (count = 1; count < len; count++) {
                if (!UTF8_IS_CONTINUATION(*fp)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF8,
                                       "Malformed UTF-8 string\n");
                }
                c = UTF8_ACCUMULATE(c, *fp);
                fp++;
            }
            *tp++ = c;
        }
        else {
            INTERNAL_EXCEPTION(MALFORMED_UTF8, "Malformed UTF-8 string\n");
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf32_t *)to->bufstart) * sizeof(utf32_t);

    return to;
}

/*=for api transcode transcode_utf16_to_utf8
   transcode UTF-16 to UTF-8
 */
static STRING*
transcode_utf16_to_utf8(STRING* from, STRING* to)
{
    utf16_t *fp;
    utf8_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf8];
    }
    else {
        to = string_make(NULL, 0, enc_utf8, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf32_t c = *fp++;

        if (UNICODE_IS_INVARIANT(c)) {
            *tp++ = c;
        }
        else {
            INTVAL len;
            utf8_t *p;

            if (UNICODE_IS_HIGH_SURROGATE(c)) {
                utf16_t low = *fp++;

                if (!UNICODE_IS_LOW_SURROGATE(low)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF16,
                                       "Malformed UTF-16 surrogate\n");
                }

                c = UNICODE_DECODE_SURROGATE(c, low);
            }
            else if (UNICODE_IS_LOW_SURROGATE(c)) {
                INTERNAL_EXCEPTION(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }

            len = UNISKIP(c);
            p = tp + len - 1;
            while (p > tp) {
              *p-- = (c & UTF8_CONTINUATION_MASK) | UTF8_CONTINUATION_MARK;
              c >>= UTF8_ACCUMULATION_SHIFT;
            }
            *p = (c & UTF8_START_MASK(len)) | UTF8_START_MARK(len);
            tp += len;
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf8_t *)to->bufstart) * sizeof(utf8_t);

    return to;
}

/*=for api transcode transcode_utf16_to_utf32
   transcode UTF-16 to UTF-32
 */
static STRING*
transcode_utf16_to_utf32(STRING* from, STRING* to)
{
    utf16_t *fp;
    utf32_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf32];
    }
    else {
        to = string_make(NULL, 0, enc_utf32, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf16_t c = *fp++;

        if (UNICODE_IS_INVARIANT(c)) {
            *tp++ = c;
        }
        else {
            if (UNICODE_IS_HIGH_SURROGATE(c)) {
                utf16_t low = *fp++;

                if (!UNICODE_IS_LOW_SURROGATE(low)) {
                    INTERNAL_EXCEPTION(MALFORMED_UTF16,
                                       "Malformed UTF-16 surrogate\n");
                }

                *tp++ = UNICODE_DECODE_SURROGATE(c, low);
            }
            else if (UNICODE_IS_LOW_SURROGATE(c)) {
                INTERNAL_EXCEPTION(MALFORMED_UTF16,
                                   "Malformed UTF-16 surrogate\n");
            }
            else {
                *tp++ = c;
            }
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf32_t *)to->bufstart) * sizeof(utf32_t);

    return to;
}

/*=for api transcode transcode_utf32_to_utf8
   transcode UTF-32 to UTF-8
 */
static STRING*
transcode_utf32_to_utf8(STRING* from, STRING* to)
{
    utf32_t *fp;
    utf8_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf8];
    }
    else {
        to = string_make(NULL, 0, enc_utf8, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf32_t c = *fp++;

        if (UNICODE_IS_INVARIANT(c)) {
            *tp++ = c;
        }
        else {
            INTVAL len = UNISKIP(c);
            utf8_t *p = tp + len - 1;
            while (p > tp) {
              *p-- = (c & UTF8_CONTINUATION_MASK) | UTF8_CONTINUATION_MARK;
              c >>= UTF8_ACCUMULATION_SHIFT;
            }
            *p = (c & UTF8_START_MASK(len)) | UTF8_START_MARK(len);
            tp += len;
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf8_t *)to->bufstart) * sizeof(utf8_t);

    return to;
}

/*=for api transcode transcode_utf32_to_utf16
   transcode UTF-32 to UTF-16
 */
static STRING*
transcode_utf32_to_utf16(STRING* from, STRING* to)
{
    utf32_t *fp;
    utf16_t *tp;

    if (to) {
        to->encoding = &Parrot_string_vtable[enc_utf16];
    }
    else {
        to = string_make(NULL, 0, enc_utf16, 0, 0);
    }

    string_grow(to, from->strlen);
    to->strlen = 0;

    fp = from->bufstart;
    tp = to->bufstart;

    while (to->strlen < from->strlen) {
        utf32_t c = *fp++;

        if (c < 0x10000u) {
            if (UNICODE_IS_SURROGATE(c)) {
                INTERNAL_EXCEPTION(MALFORMED_UTF32,
                                   "Surrogate in UTF-32 string\n");
            }
            *tp++ = c;
        }
        else {
            *tp++ = UNICODE_HIGH_SURROGATE(c);
            *tp++ = UNICODE_LOW_SURROGATE(c);
        }

        to->strlen++;
    }

    to->bufused = (tp - (utf16_t *)to->bufstart) * sizeof(utf16_t);

    return to;
}

void
transcode_init(void)
{
  Parrot_transcode_table[enc_utf8][enc_utf16] = transcode_utf8_to_utf16;
  Parrot_transcode_table[enc_utf8][enc_utf32] = transcode_utf8_to_utf32;
  Parrot_transcode_table[enc_utf16][enc_utf8] = transcode_utf16_to_utf8;
  Parrot_transcode_table[enc_utf16][enc_utf32] = transcode_utf16_to_utf32;
  Parrot_transcode_table[enc_utf32][enc_utf8] = transcode_utf32_to_utf8;
  Parrot_transcode_table[enc_utf32][enc_utf16] = transcode_utf32_to_utf16;
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
