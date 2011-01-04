/* unicode.h
 *  Copyright (C) 2001-2006, Parrot Foundation.
 *  Overview:
 *     Unicode support header
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_UNICODE_H_GUARD
#define PARROT_UNICODE_H_GUARD

typedef unsigned char utf8_t;
typedef Parrot_UInt2  utf16_t;
typedef Parrot_Int4   utf32_t;

#define UNICODE_SURROGATE_FIRST         0xD800
#define UNICODE_SURROGATE_LAST          0xDFFF
#define UNICODE_SURROGATE_SHIFT         10
#define UNICODE_SURROGATE_MASK          0x3FF
#define UNICODE_HIGH_SURROGATE_FIRST    0xD800
#define UNICODE_LOW_SURROGATE_FIRST     0xDC00

#define UNICODE_IS_SURROGATE(c)        ((c) >= UNICODE_SURROGATE_FIRST && \
                                        (c) <= UNICODE_SURROGATE_LAST)
#define UNICODE_IS_HIGH_SURROGATE(c)  (((c) & ~UNICODE_SURROGATE_MASK) == \
                                         UNICODE_HIGH_SURROGATE_FIRST)
#define UNICODE_IS_LOW_SURROGATE(c)   (((c) & ~UNICODE_SURROGATE_MASK) == \
                                         UNICODE_LOW_SURROGATE_FIRST)
#define UNICODE_IS_INVARIANT(c)        ((c) <  0x80)
#define UNICODE_IS_NON_CHARACTER(c)   (((c) &  0xFFFE) == 0xFFFE || \
                                       ((c) >= 0xFDD0 && (c) <= 0xFDEF))
#define UNICODE_IS_INVALID(c)          ((c) >= UNICODE_SURROGATE_FIRST && \
                                       ((c) <= 0xFDEF ? \
                                        (c) <= UNICODE_SURROGATE_LAST || \
                                        (c) >= 0xFDD0 : \
                                       ((c) &  0xFFFE) == 0xFFFE || \
                                        (c) >  0x10FFFF))

#define UNICODE_HIGH_SURROGATE(c) \
  (((c) >> UNICODE_SURROGATE_SHIFT) + \
    (UNICODE_HIGH_SURROGATE_FIRST - (0x10000 >> UNICODE_SURROGATE_SHIFT)))
#define UNICODE_LOW_SURROGATE(c) \
  (((c) & UNICODE_SURROGATE_MASK) | UNICODE_LOW_SURROGATE_FIRST)
#define UNICODE_DECODE_SURROGATE(high, low) \
  (((high) << UNICODE_SURROGATE_SHIFT) + (low) - \
   ((UNICODE_HIGH_SURROGATE_FIRST << UNICODE_SURROGATE_SHIFT) + \
     UNICODE_LOW_SURROGATE_FIRST - 0x10000))

#define UNISKIP(uv) ((uv) < 0x80    ? 1 : \
                     (uv) < 0x800   ? 2 : \
                     (uv) < 0x10000 ? 3 : 4)

#define UTF16SKIP(c) (UNICODE_IS_HIGH_SURROGATE(c) ? 2 : 1)

/*

 The following table is from Unicode 3.1.

 Code Points            1st Byte  2nd Byte  3rd Byte  4th Byte

   U+0000..U+007F       00..7F
   U+0080..U+07FF       C2..DF    80..BF
   U+0800..U+0FFF       E0        A0..BF    80..BF
   U+1000..U+FFFF       E1..EF    80..BF    80..BF
  U+10000..U+3FFFF      F0        90..BF    80..BF    80..BF
  U+40000..U+FFFFF      F1..F3    80..BF    80..BF    80..BF
 U+100000..U+10FFFF     F4        80..8F    80..BF    80..BF

 */

#define UTF8_IS_START(c)            ((c) >= 0xC2 && (c) <= 0xF4)
#define UTF8_IS_CONTINUATION(c)    (((c) & 0xC0) == 0x80)
#define UTF8_IS_CONTINUED(c)        ((c) & 0x80)

#define UTF8_START_MARK(len)        ((0xFF00 >> (len)) & 0xFF)
#define UTF8_START_MASK(len)         (0x7F >> (len))

#define UTF8_CONTINUATION_MARK        0x80
#define UTF8_ACCUMULATION_SHIFT       6
#define UTF8_CONTINUATION_MASK        0x3F
#define UTF8_ACCUMULATE(old, new)  (((old) << UTF8_ACCUMULATION_SHIFT) | \
                                    ((new) &  UTF8_CONTINUATION_MASK))

#define UTF8_IS_OVERLONG(c1, c2)   (((c1) == 0xE0 && (c2) < 0xA0) || \
                                    ((c1) == 0xF0 && (c2) < 0x90))

extern const char Parrot_utf8skip[256];

#define UTF8SKIP(c) Parrot_utf8skip[c]

#define UTF8_MAXLEN 4
#define UTF16_MAXLEN 4

#endif /* PARROT_UNICODE_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
