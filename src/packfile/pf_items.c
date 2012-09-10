/*
Copyright (C) 2001-2012, Parrot Foundation.

=head1 NAME

src/packfile/pf_items.c - Fetch/store packfile data

=head1 DESCRIPTION

Low level packfile functions to fetch and store Parrot data, i.e.
C<INTVAL>, C<FLOATVAL>, C<STRING> ...

C<< PF_fetch_<item>() >> functions retrieve the datatype item from the
opcode stream and convert byteordering or binary format on the fly,
depending on the packfile header.

C<< PF_store_<item>() >> functions write the datatype item to the stream
as is. These functions don't check the available size.

C<< PF_size_<item>() >> functions return the store size of item in
C<opcode_t> units.

C<BE> and C<be> are short for "Big-endian", while C<LE> and C<le> are short
for "little endian".

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/bswap.h"
#include "pf_items.str"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void cvt_num10_num16(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num10_num16ppc(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num10_num4(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num10_num8(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num10(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num16ppc(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num4(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num8(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16ppc_num10(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16ppc_num16(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16ppc_num4(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16ppc_num8(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num4_num10(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num4_num16(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num4_num16ppc(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num4_num8(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num10(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num16(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num16ppc(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num4(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

PARROT_INLINE
static void fetch_buf_be_12(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_be_16(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_be_32(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_be_4(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_be_8(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_le_12(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_le_16(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_le_32(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_le_4(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
static void fetch_buf_le_8(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static INTVAL fetch_iv_be(INTVAL w);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static INTVAL fetch_iv_le(INTVAL w);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static opcode_t fetch_op_be(opcode_t w);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_be_4(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_be_8(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static opcode_t fetch_op_le(opcode_t w);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_le_4(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_le_8(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_cvt_num10_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num10_num16ppc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num10_num4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num10_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num10 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num16ppc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16ppc_num10 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16ppc_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16ppc_num4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16ppc_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num4_num10 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num4_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num4_num16ppc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num4_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num10 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num16ppc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_fetch_buf_be_12 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_be_16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_be_32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_be_4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_be_8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_le_12 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_le_16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_le_32 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_le_4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_buf_le_8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(rb) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_iv_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_fetch_iv_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_fetch_op_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_fetch_op_be_4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_op_be_8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_op_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_fetch_op_le_4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_op_le_8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
 * round val up to whole size, return result in bytes
 */
#define ROUND_UP_B(val, size) ((((val) + ((size) - 1))/(size)) * (size))

/*
 * round val up to whole opcode_t, return result in opcodes
 */
#define ROUND_UP(val, size) (((val) + ((size) - 1))/(size))

/*
 * offset not in ptr diff, but in byte
 */
#define OFFS(pf, cursor) ((pf) ? ((const char *)(cursor) - (const char *)((pf)->src)) : 0)

/*
 * low level FLOATVAL fetch and convert functions (see packfile.h)
 *
 * Floattype 0 = IEEE-754 8 byte double (binary64)
 * Floattype 1 = Intel 80-bit long double stored in 12 byte (i386)
 *                                    or aligned to 16 byte (x86_64/ia64)
 * Floattype 2 = IEEE-754 128 bit quad precision stored in 16 byte,
 *               Sparc64 quad-float or __float128, gcc since 4.3 (binary128)
 * Floattype 3 = IEEE-754 4 byte float (binary32)
 * Floattype 4 = PowerPC 16 byte double-double (-mlong-double-128)
 * not yet:
 * Floattype 4 = IEEE-754 2 byte half-precision float (binary16)
 * Floattype 6 = MIPS64 16 byte long double
 * Floattype 7 = AIX 16 byte long double
 *
 */

/*

=item C<static void cvt_num10_num8(unsigned char *dest, const unsigned char
*src)>

Converts intel 80-bit long double to IEEE 754 LE 8-byte double.
On 64bit intel the size is 16 byte, on 32bit intel 12 byte.

Tested ok.

=cut

*/

static void
cvt_num10_num8(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num12_num8)
    int expo, i, s;
#  ifdef __LCC__
    int expo2;
#  endif

    /*
       padding + 10-byte double (80 bits):
       unused 2 byte on i386, 6 byte on x86_84/ia64
       sign    1 bit  79
       exp    15 bits 78-64
       man    64 bits 63-0
    to 8-byte double (64 bits):
       sign    1 bit 63
       exp    11 bits 62-52
       man    52 bits 51-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[11]|src[10]|src[9] |src[8] |src[7] |src[6] | ...   |src[0] |
    |   unused      |S|     Exp     |               Fract           |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |<-----16------>|1|<-----15---->|<-----------64 bits----------->|
    <-------------->|<----------------80 bits----------------------->

    +-------+-------+-------+-------+-------+-------+-------+-------+
    |dest[7]|dest[6]|dest[5]|dest[4]|dest[3]|dest[2]|dest[1]|dest[0]|
    S|    E    |                           F                        |
    +-------+-------+-------+-------+-------+-------+-------+-------+
    1|<---11-->|<---------------------52 bits---------------------->|
    <----------------------------64 bits---------------------------->
                       8-byte DOUBLE FLOATING-POINT
    */

    memset(dest, 0, 8);
    /* exponents 15 -> 11 bits */
    sign = src[9] & 0x80;
    expo = ((src[9] & 0x7f)<< 8 | src[8]);
    if (expo == 0) {
      nul:
        if (sign)
            dest[7] |= 0x80;
        return;
    }
#  ifdef __LCC__
    /* Yet again, LCC blows up mysteriously until a temporary variable is
     * added. */
    expo2 = expo - 16383;
    expo  = expo2;
#  else
    expo -= 16383;       /* - bias */
#  endif
    expo += 1023;       /* + bias 8byte */
    if (expo <= 0)       /* underflow */
        goto nul;
    if (expo > 0x7ff) {  /* inf/nan */
        dest[7] = 0x7f;
        dest[6] = src[7] == 0xc0 ? 0xf8 : 0xf0 ;
        goto nul;
    }
    expo <<= 4;
    dest[6] = (expo & 0xff);
    dest[7] = (expo & 0x7f00) >> 8;
    if (sign)
        dest[7] |= 0x80;
    /* long double frac 63 bits => 52 bits
       src[7] &= 0x7f; reset integer bit */
    for (i = 0; i < 6; ++i) {
        dest[i+1] |= (i==5 ? src[7] & 0x7f : src[i+2]) >> 3;
        dest[i] |= (src[i+2] & 0x1f) << 5;
    }
    dest[0] |= src[1] >> 3;
}

/*

=item C<static void cvt_num16_num8(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 16-byte long double to IEEE 754 8 byte double.

First variant ok, 2nd not ok.

=cut

*/

static void
cvt_num16_num8(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num8)

    if ((sizeof(FLOATVAL) == 16) && (sizeof(double) == 8)) {
        FLOATVAL ld;
        double d;

        memcpy(&ld, src, 16);
        d = (double)ld; /* compiler cast */
        memcpy(dest, &d, 8);
        return;
    }
    else {
        /* Yet untested. Need native sparc64 */
        int expo, i, sign;
#  ifdef __LCC__
        int expo2;
#  endif
#  if 0
        Parrot_x_force_error_exit(NULL, 1, "cvt_num16_num8: long double conversion unsupported");
#  endif

    /* Have only 12-byte long double, or no long double at all. Need to disect it */

    /*
       16-byte long double (128 bits):
       sign  1  bit 127
       exp  15 bits 126-112 16383
       man 112 bits 111-0
    to 8-byte double (64 bits):
       sign  1  bit 63
       exp  11 bits 62-52 1023
       man  52 bits 51-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[15]|src[14]|src[13]|src[12]|src[11]|src[10]| ...   |src[0] |
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT (Sparc 64-bit)

    +-------+-------+-------+-------+-------+-------+-------+-------+
    |dest[7]|dest[6]|dest[5]|dest[4]|dest[3]|dest[2]|dest[1]|dest[0]|
    S|    E    |                           F                        |
    +-------+-------+-------+-------+-------+-------+-------+-------+
    1|<---11-->|<---------------------52 bits---------------------->|
    <----------------------------64 bits---------------------------->
                       8-byte DOUBLE FLOATING-POINT
   */

        memset(dest, 0, 8);
        sign = src[15] & 0x80; /* 10000000 */
        /* 15->11 exponents bits */
        expo = ((src[15] & 0x7f)<< 8 | src[14]);
        if (expo == 0) {
          nul:
            if (sign)
                dest[7] |= 0x80;
            return;
        }
#  ifdef __LCC__
        /* LCC blows up mysteriously until a temporary variable is
         * added. */
        expo2 = expo - 16383;
        expo  = expo2;
#  else
        expo -= 16383;       /* - same bias as with 12-byte */
#  endif
        expo += 1023;        /* + bias 8byte */

        if (expo <= 0)       /* underflow */
            goto nul;
        if (expo > 0x7ff) {  /* overflow, inf/nan */
            dest[7] = 0x7f;
            dest[6] |= src[7] == 0xc0 ? 0xf8 : 0xf0 ;
            goto nul;
        }
        expo <<= 4;
        dest[6] |= (expo & 0xff);
        dest[7] = (expo & 0x7f00) >> 8;
        if (sign)
            dest[7] |= 0x80;
    }
}

/*

=item C<static void cvt_num4_num8(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 4-byte float to IEEE 754 8 byte double.

Not yet tested.

=cut

*/

static void
cvt_num4_num8(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    float f;
    double d;
    memcpy(&f, src, 4);
    d = (double)f;
    memcpy(dest, &d, 8);
}

/*

=item C<static void cvt_num16_num10(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 LE 16-byte long double to i386 LE 80-bit long double.
See http://babbage.cs.qc.cuny.edu/IEEE-754/References.xhtml

Tested ok.

=cut

*/

#if (FLOATTYPE == FLOATTYPE_10)
static void
cvt_num16_num10(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num10)

    /*
       16-byte double (128 bits):
       sign  1  bit 127
       exp  15 bits 126-112
       man 112 bits 111-0
    to 12-byte double (96 bits):
       unused 16 bits 95-80
       sign    1 bit  79
       exp    15 bits 78-64
       man    64 bits 63-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[15]|src[14]|src[13]|src[12]|src[11]|src[10]| ...   |src[0] |
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT (IA64 or BE 64-bit)

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |dest[11]dest[10]dest[9]|dest[8]|dest[7]|dest[6]| ...   |dest[0]|
    |   unused      |S|     Exp     |               Fract           |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |<-----16------>|1|<-----15---->|<-----------64 bits----------->|
    <-------------->|<----------------80 bits----------------------->
              12-byte LONG DOUBLE FLOATING-POINT (i386 special)
    */

    memset(dest, 0, 12);
    /* simply copy over sign + exp */
    dest[8] = src[15];
    dest[9] = src[14];
    /* and copy the rest */
    memcpy(&dest[0], &src[0], 8);
}

/*

=item C<static void cvt_num8_num10(unsigned char *dest, const unsigned char
*src)>

Converts i386 8-byte double to i386 80bit long double.

Tested ok.

=cut

*/

static void
cvt_num8_num10(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num10)
    long double ld;
    double d;
    memcpy(&d, src, 8);
    ld = (long double)d; /* compiler cast */
    memcpy(dest, &ld, 12);
}

/*

=item C<static void cvt_num4_num10(unsigned char *dest, const unsigned char
*src)>

Converts i386 4-byte float to i386 80bit long double.

Tested ok.

=cut

*/

static void
cvt_num4_num10(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    float f;
    long double ld;
    memcpy(&f, src, 4);
    ld = (long double)f; /* TODO: test compiler cast */
    memcpy(dest, &ld, sizeof(long double));
}

#endif

/*

=item C<static void cvt_num10_num16(unsigned char *dest, const unsigned char
*src)>

Converts i386 LE 10-byte long double to IEEE 754 LE 16-byte long double.

Not tested yet.

=cut

*/

#if (NUMVAL_SIZE == 16) || defined(__powerpc__) || defined(_M_PPC)
static void
cvt_num10_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num10_num16)
    /*
       12/16-byte double (80 bit):
       unused padding 2-6 byte
       sign    1 bit  79
       exp    15 bits 78-64
       man    64 bits 63-0
    to 16-byte double (__float128):
       sign  1  bit 127
       exp  15 bits 126-112
       man 112 bits 111-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[11]|src[10]|src[9] |src[8] |src[7] |src[6] | ...   |src[0] |
    |    unused     |S|     Exp     |               Fract           |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |<------------->|1|<-----15---->|<-----------64 bits----------->|
    <-------------->|<----------------80 bits----------------------->
           12/16-byte LONG DOUBLE FLOATING-POINT (intel special)

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |dest[15]dest[14]dest[13]dest[12]dest[11]dest[10] ...   |dest[0]|
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT __float128

    */

    FLOATVAL ld;
    long double d;
    memset(dest, 0, 16);
    /* simply copy over sign + exp */
    dest[15] = src[9];
    dest[14] = src[8];
    /* and copy the rest */
    memcpy(&dest[0], &src[0], 8);
#if 0
    /* TODO round on 15 digits */
    memcpy(&ld, dest, 16);
#  if 1
    {
        char buf[20];
        sprintf(buf, "%.15g", ld);
        d = atof(buf);
    }
#  else
    d = (long double)ld;
#  endif
    memcpy(dest, &d, 16);
#endif
}
#endif

/*

=item C<static void cvt_num8_num16(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 8-byte double to IEEE 754 16 byte long double.

Not yet tested.

=cut

*/

static void
cvt_num8_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num16)
    /* The compiler can do this for us */
    HUGEFLOATVAL ld;
    double d;
    memcpy(&d, src, 8);
    ld = (HUGEFLOATVAL)d; /* TODO: test compiler cast */
    memcpy(dest, &ld, 16);
}

/*

=item C<static void cvt_num4_num16(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 4-byte float to IEEE 754 16 byte long double.

Not yet tested.

=cut

*/

static void
cvt_num4_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    float f;
    HUGEFLOATVAL ld;
    memcpy(&f, src, 4);
    ld = (HUGEFLOATVAL)f; /* TODO: test compiler cast */
    memcpy(dest, &ld, 16);
}

/*

=item C<static void cvt_num4_num16ppc(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num8_num16ppc(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num10_num16ppc(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num16_num16ppc(unsigned char *dest, const unsigned char
*src)>

Convert to powerpc 16 byte double double,

Not yet tested.

=cut

*/

#if (NUMVAL_SIZE == 16) && (defined(__ppc__) || defined(__POWERPC__) || defined(_M_PPC))

#define TO_16PPC(d, ld, dest)      \
    ld = (long double)d;           \
    memcpy(dest, &ld, 16);

static void
cvt_num4_num16ppc(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d;
    long double ld;
    cvt_num4_num8((unsigned char *)&d, src);
    TO_16PPC(d,ld,dest);
}
static void
cvt_num8_num16ppc(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d;
    long double ld;
    memcpy(&d, src, 8);
    TO_16PPC(d,ld,dest);
}
static void
cvt_num10_num16ppc(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d;
    long double ld;
    cvt_num10_num8((unsigned char *)&d, src);
    TO_16PPC(d,ld,dest);
}

static void
cvt_num16_num16ppc(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d;
    long double ld;
    cvt_num16_num8((unsigned char *)&d, src);
    TO_16PPC(d,ld,dest);
}
#endif

/*

=item C<static void cvt_num16ppc_num4(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num16ppc_num8(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num16ppc_num10(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num16ppc_num16(unsigned char *dest, const unsigned char
*src)>

Convert from powerpc 16 byte double double,

Tested ok.

num16ppc is the sum of two doubles one after another, the head being rounded
to the nearest double and the tail containing the rest.

See https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man3/float.3.html

=cut

*/

#if (NUMVAL_SIZE == 4)
static void
cvt_num16ppc_num4(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d1, d2;
    long double ld;
    float f;
    memcpy(&d1, src, 8);
    memcpy(&d2, src+8, 8);
    ld = (d2 == -0.0 && d1 == 0.0) ? -0.0 : d1 + d2;
    f = (float)ld;
    memcpy(dest, &f, 4);
}
#endif

#if (NUMVAL_SIZE == 16)
static void
cvt_num16ppc_num8(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d1, d2;
    long double ld;
    memcpy(&d1, src, 8);
    memcpy(&d2, src+8, 8);
    ld = (d2 == -0.0 && d1 == 0.0) ? -0.0 : d1 + d2;
    d1 = (double)ld;
    memcpy(dest, &d1, 8);
}
#endif

#if (FLOATTYPE == FLOATTYPE_10)
static void
cvt_num16ppc_num10(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d1, d2;
    long double ld;
    memcpy(&d1, src, 8);
    memcpy(&d2, src+8, 8);
    ld = (d2 == -0.0 && d1 == 0.0) ? -0.0 : d1 + d2;
    memcpy(dest, &ld, sizeof(ld));
}
#endif

#if (NUMVAL_SIZE == 16)
static void
cvt_num16ppc_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    double d1, d2;
    FLOATVAL ld;
    memcpy(&d1, src, 8);
    memcpy(&d2, src+8, 8);
    ld = (d2 == -0.0 && d1 == 0.0) ? -0.0 : d1 + d2;
    memcpy(dest, &ld, 16);
}
#endif
/*

=item C<static void cvt_num8_num4(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num10_num4(unsigned char *dest, const unsigned char
*src)>

=item C<static void cvt_num16_num4(unsigned char *dest, const unsigned char
*src)>

Convert to 4 byte single float,

Not yet tested.

=cut

*/

#if (NUMVAL_SIZE == 4)

static void
cvt_num8_num4(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    float f;
    double d;
    memcpy(&d, src, 4);
    f = (float)d; /* TODO: test compiler cast */
    memcpy(dest, &f, 4);
}

static void
cvt_num10_num4(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
#if (defined(__I86__) || defined(__INTEL__) || defined(_M_IA64) || defined(__ia64__))
#  if NUMVAL_SIZE == 12
    /* i386 only */
    float f;
    long double ld;
    memcpy(&ld, src, 12);
    f = (float)ld; /* TODO: test compiler cast */
    memcpy(dest, &f, 4);
#  elif NUMVAL_SIZE == 16
    /* x86_64 or itanium */
    float f;
    long double ld;
    memcpy(&ld, src, 16);
    f = (float)ld; /* TODO: test compiler cast */
    memcpy(dest, &f, 4);
#  endif
#else
    unsigned char tmp[8];
    cvt_num10_num8(tmp, src);
    cvt_num8_num4(dest, tmp);
#endif
}

static void
cvt_num16_num4(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
#ifdef HAS_FLOAT128
    float f;
    __float128 ld;

    memcpy(&ld, src, 16); /* 64bit only */
    f = (float)ld;
    memcpy(dest, &f, 4);
#else
    unsigned char tmp[8];
    cvt_num16_num8(tmp, src);
    cvt_num8_num4(dest, tmp);
#endif
}

#endif


/*

=item C<static opcode_t fetch_op_be_4(const unsigned char *b)>

Fetches a 4-byte big-endian opcode.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static opcode_t
fetch_op_be_4(ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_op_be_4)
    union {
        unsigned char buf[4];
        opcode_t o;
    } u;
    fetch_buf_be_4(u.buf, b);
#if PARROT_BIGENDIAN
#  if OPCODE_T_SIZE == 8
    return (Parrot_Int4)(u.o >> 32);
#  else
    return u.o;
#  endif
#else
#  if OPCODE_T_SIZE == 8
    return (Parrot_Int4)(fetch_iv_le((INTVAL)u.o) & 0xffffffff);
#  else
    return (opcode_t) fetch_iv_le((INTVAL)u.o);
#  endif
#endif
}

/*

=item C<static opcode_t fetch_op_be_8(const unsigned char *b)>

Fetches an 8-byte big-endian opcode.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static opcode_t
fetch_op_be_8(ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_op_be_8)
    union {
        unsigned char buf[8];
        opcode_t o[2];
    } u;
    fetch_buf_be_8(u.buf, b);
#if PARROT_BIGENDIAN
#  if OPCODE_T_SIZE == 8
    return u.o[0];
#  else
    return u.o[1];
#  endif
#else
    return (opcode_t) fetch_iv_le((INTVAL)u.o[0]);
#endif
}

/*

=item C<static opcode_t fetch_op_le_4(const unsigned char *b)>

Fetches a 4-byte little-endian opcode

=cut

*/

PARROT_WARN_UNUSED_RESULT
static opcode_t
fetch_op_le_4(ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_op_le_4)
    union {
        unsigned char buf[4];
        opcode_t o;
    } u;
    fetch_buf_le_4(u.buf, b);
#if PARROT_BIGENDIAN
#  if OPCODE_T_SIZE == 8
    return (Parrot_Int4)(u.o >> 32);
#  else
    return (opcode_t) fetch_iv_be((INTVAL)u.o);
#  endif
#else
#  if OPCODE_T_SIZE == 8
    /* without the cast we would not get a negative int, the vtable indices */
    return (Parrot_Int4)(u.o & 0xffffffff);
#  else
    return u.o;
#  endif
#endif
}

/*

=item C<static opcode_t fetch_op_le_8(const unsigned char *b)>

Fetches an 8-byte little-endian opcode

=cut

*/

PARROT_WARN_UNUSED_RESULT
static opcode_t
fetch_op_le_8(ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_op_le_8)
    union {
        unsigned char buf[8];
        opcode_t o[2];
    } u;
    fetch_buf_le_8(u.buf, b);
#if PARROT_BIGENDIAN
#  if OPCODE_T_SIZE == 8
    return u.o[0];
#  else
    return (opcode_t) fetch_op_be((INTVAL)u.o[1]);
#  endif
#else
    return u.o[0];
#endif
}

/*

=item C<opcode_t PF_fetch_opcode(const PackFile *pf, const opcode_t **stream)>

Fetches an C<opcode_t> from the stream, converting byteorder if needed.

When used for freeze/thaw the C<pf> argument might be NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t
PF_fetch_opcode(ARGIN_NULLOK(const PackFile *pf), ARGMOD(const opcode_t **stream))
{
    ASSERT_ARGS(PF_fetch_opcode)
    if (!pf || !pf->fetch_op) {
        return *(*stream)++;
    }
    else {
        const unsigned char *ucstream = *(const unsigned char **)stream;
        opcode_t o  = (pf->fetch_op)(ucstream);
        ucstream   += pf->header->wordsize;
        *stream     = (const opcode_t *)ucstream;
        return o;
    }
}

/*

=item C<opcode_t* PF_store_opcode(opcode_t *cursor, opcode_t val)>

Stores an C<opcode_t> to stream as-is.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_opcode(ARGOUT(opcode_t *cursor), opcode_t val)
{
    ASSERT_ARGS(PF_store_opcode)
    *cursor++ = val;
    return cursor;
}

/*

=item C<size_t PF_size_opcode(void)>

Returns the size of an item in C<opcode_t> units. The size of C<opcode_t>
is 1 I<per definition>.

=cut

*/

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t
PF_size_opcode(void)
{
    ASSERT_ARGS(PF_size_opcode)
    return 1;
}

/*

=item C<INTVAL PF_fetch_integer(PackFile *pf, const opcode_t **stream)>

Fetches an C<INTVAL> from the stream, converting byteorder if needed.

XXX assumes C<sizeof (INTVAL) == sizeof (opcode_t)> - we don't have
C<INTVAL> size in the PackFile header.  See TT #1047 or RT #56810.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
PF_fetch_integer(ARGIN(PackFile *pf), ARGIN(const opcode_t **stream))
{
    ASSERT_ARGS(PF_fetch_integer)
    INTVAL i;

    if (!pf->fetch_iv)
        return *(*stream)++;
    i = (pf->fetch_iv)(*((const unsigned char **)stream));

    /* XXX assume sizeof (opcode_t) == sizeof (INTVAL) on the
     * machine producing this PBC.
     *
     * TODO GH #415 on Sparc 64bit: On pbc wordsize=4 but native ptrsize=8 and
     * ptr_alignment=8 the advance by 4 will signal BUS (invalid address alignment)
     * in PF_fetch_integer and elsewhere.
     */
    *((const unsigned char **) (stream)) += pf->header->wordsize;
    return i;
}


/*

=item C<opcode_t* PF_store_integer(opcode_t *cursor, INTVAL val)>

Stores an C<INTVAL> to stream as is.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_integer(ARGOUT(opcode_t *cursor), INTVAL val)
{
    ASSERT_ARGS(PF_store_integer)
    *cursor++ = (opcode_t)val; /* XXX */
    return cursor;
}

/*

=item C<size_t PF_size_integer(void)>

Returns stored size of C<INTVAL> in C<opcode_t> units.

=cut

*/

PARROT_CONST_FUNCTION
size_t
PF_size_integer(void)
{
    ASSERT_ARGS(PF_size_integer)
    return sizeof (INTVAL) / sizeof (opcode_t);
}

/*

=item C<FLOATVAL PF_fetch_number(PackFile *pf, const opcode_t **stream)>

Fetches a C<FLOATVAL> from the stream, converting byteorder if needed.
Then advances the stream pointer by the packfile float size.

=cut

*/

PARROT_WARN_UNUSED_RESULT
FLOATVAL
PF_fetch_number(ARGIN_NULLOK(PackFile *pf), ARGIN(const opcode_t **stream))
{
    ASSERT_ARGS(PF_fetch_number)

    /* When we have alignment all squared away we don't need
     * to use memcpy() for native byteorder.  */
    FLOATVAL f;
    if (!pf || !pf->fetch_nv) {
        memcpy(&f, (const char *)*stream, sizeof (FLOATVAL));
        (*stream) += (sizeof (FLOATVAL) + sizeof (opcode_t) - 1)/
            sizeof (opcode_t);
        return f;
    }
    /* 12->8 has a messy cast. */
    if (NUMVAL_SIZE == 8 && pf->header->floattype == FLOATTYPE_10) {
        double d;
        int floatsize = pf->header->wordsize == 8 ? 16 : 12;
        (pf->fetch_nv)((unsigned char *)&d, (const unsigned char *)*stream);
        f = d;
        *((const unsigned char **) (stream)) += floatsize;
    }
    else {
        int floatsize = PF_floattype_size[ pf->header->floattype ];
        const int need_endianize = pf->header->byteorder != PARROT_BIGENDIAN;
        /* Intel x86_64 has FLOATTYPE_10 aligned to size 16. */
        if ( floatsize == 12 && pf->header->wordsize == 8 )
            floatsize = 16;
        if ( need_endianize
             /* and not endianized in fetcher */
             && FLOATTYPE != pf->header->floattype )
        {
            if (floatsize == 8) {
                *(Parrot_UInt8*)*stream = bswap64(*(Parrot_UInt8*)*stream);
            }
            else if (floatsize == 4) {
                *(Parrot_UInt4*)*stream = bswap32(*(Parrot_UInt4*)*stream);
            }
            else if (floatsize == 16) {
#if 0
                /* TODO 64bit CPU: bswap64 with temp */
                Parrot_UInt8 tmp = bswap64(*(Parrot_UInt8*)*stream);
                *(Parrot_UInt8*)*stream =
                    bswap64(*(Parrot_UInt8*)*((const unsigned char *)stream+8));
                *(Parrot_UInt8*)*((const unsigned char *)stream+8)) = tmp;
#endif
                unsigned char rb[16];
                const unsigned char *c = (const unsigned char *)*stream;
                SWAB_16(rb, c);
                memcpy(*((const unsigned char **)stream), rb, 16);
            }
        }
        (pf->fetch_nv)((unsigned char *)&f, (const unsigned char *) *stream);
        *((const unsigned char **) (stream)) += floatsize;
    }
    return f;
}

/*

=item C<opcode_t* PF_store_number(opcode_t *cursor, const FLOATVAL *val)>

Writes a C<FLOATVAL> to the opcode stream as-is.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_number(ARGOUT(opcode_t *cursor), ARGIN(const FLOATVAL *val))
{
    ASSERT_ARGS(PF_store_number)
    opcode_t padded_size  = (sizeof (FLOATVAL) + sizeof (opcode_t) - 1) /
        sizeof (opcode_t);
    memcpy(cursor, val, sizeof (FLOATVAL));
    cursor += padded_size;
    return cursor;
}

/*

=item C<size_t PF_size_number(void)>

Returns stored size of FLOATVAL in C<opcode_t> units.

=cut

*/

PARROT_CONST_FUNCTION
size_t
PF_size_number(void)
{
    ASSERT_ARGS(PF_size_number)
    return ROUND_UP(sizeof (FLOATVAL), sizeof (opcode_t));
}

/*

=item C<STRING * PF_fetch_buf(PARROT_INTERP, PackFile *pf, const opcode_t
**cursor)>

Fetches a buffer (fixed_8 encoded temporary C<STRING>) from bytecode.

Opcode format is:

    opcode_t size
    * data

When used for freeze/thaw, the C<pf> argument might be C<NULL>.

The returned buffer points to the underlying packfile. It should be used and
discarded immediately to avoid things changing underneath you.

=cut

*/


PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
PF_fetch_buf(PARROT_INTERP, ARGIN_NULLOK(PackFile *pf), ARGIN(const opcode_t **cursor))
{
    ASSERT_ARGS(PF_fetch_buf)
    const int wordsize = pf ? pf->header->wordsize : sizeof (opcode_t);
    size_t  size       = PF_fetch_opcode(pf, cursor);
    STRING *s          = Parrot_str_new_init(interp, (const char *)*cursor, size,
                            Parrot_binary_encoding_ptr,
                            PObj_external_FLAG);
    *((const unsigned char **)(cursor)) += ROUND_UP_B(size, wordsize);
    return s;
}


/*

=item C<opcode_t* PF_store_buf(opcode_t *cursor, const STRING *s)>

Write a buffer (fixed_8 encoded, binary string) to the opcode stream. These
are encoded more compactly and read more efficiently than normal strings, but
have limitations (see C<PF_fetch_buf>).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_buf(ARGOUT(opcode_t *cursor), ARGIN(const STRING *s))
{
    ASSERT_ARGS(PF_store_buf)
    const int  wordsize = sizeof (opcode_t);

    PARROT_ASSERT(s->encoding == Parrot_binary_encoding_ptr);

    *cursor++ = s->bufused;

    if (s->strstart) {
        char *charcursor = (char *) cursor;
        memcpy(charcursor, s->strstart, s->bufused);
        charcursor += s->bufused;

        /* Pad up to wordsize boundary. */
        while ((charcursor - (char *)cursor) % wordsize)
            *charcursor++ = 0;

        cursor += (charcursor - (char *)cursor) / wordsize;
    }

    return cursor;
}


/*

=item C<size_t PF_size_buf(const STRING *s)>

Reports the stored size of a buffer in C<opcode_t> units.

=cut

*/

PARROT_PURE_FUNCTION
size_t
PF_size_buf(ARGIN(const STRING *s))
{
    ASSERT_ARGS(PF_size_buf)
    if (STRING_IS_NULL(s))
        return 1;
    else
        return PF_size_strlen(s->bufused) - 1;
}


/*

=item C<STRING * PF_fetch_string(PARROT_INTERP, PackFile *pf, const opcode_t
**cursor)>

Fetches a C<STRING> from bytecode and return a new C<STRING>.

Opcode format is:

    opcode_t flags8 | encoding
    opcode_t size
    * data

When used for freeze/thaw the C<pf> argument might be NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
PF_fetch_string(PARROT_INTERP, ARGIN_NULLOK(PackFile *pf), ARGIN(const opcode_t **cursor))
{
    ASSERT_ARGS(PF_fetch_string)
    STRING   *s;
    UINTVAL   flags;
    UINTVAL   encoding_nr;
    const STR_VTABLE *encoding;
    size_t    size;
    const int wordsize          = pf ? pf->header->wordsize : sizeof (opcode_t);
    opcode_t  flag_charset_word = PF_fetch_opcode(pf, cursor);

    if (flag_charset_word == -1)
        return STRINGNULL;

    /* decode flags, charset and encoding */
    flags       = (flag_charset_word & 0x1 ? PObj_constant_FLAG : 0) |
                  (flag_charset_word & 0x2 ? PObj_private7_FLAG : 0) ;
    encoding_nr = (flag_charset_word >> 8) & 0xFF;

    size = (size_t)PF_fetch_opcode(pf, cursor);

    encoding = Parrot_get_encoding(interp, encoding_nr);
    if (!encoding)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Invalid encoding number '%d' specified", encoding_nr);

    if (size || (encoding != CONST_STRING(interp, "")->encoding))
        s = Parrot_str_new_init(interp, (const char *)*cursor, size,
                encoding, flags);
    else
        s = CONST_STRING(interp, "");

    size = ROUND_UP_B(size, wordsize);
    *((const unsigned char **) (cursor)) += size;

    return s;
}


/*

=item C<opcode_t* PF_store_string(opcode_t *cursor, const STRING *s)>

Writes a C<STRING> to the opcode stream.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_string(ARGOUT(opcode_t *cursor), ARGIN(const STRING *s))
{
    ASSERT_ARGS(PF_store_string)
    opcode_t padded_size = s->bufused;
    char *charcursor;

    if (padded_size % sizeof (opcode_t)) {
        padded_size += sizeof (opcode_t) - (padded_size % sizeof (opcode_t));
    }

    if (STRING_IS_NULL(s)) {
        /* preserve NULL-ness of strings */
        *cursor++ = -1;
        return cursor;
    }

    /*
     * TODO as soon as we have dynamically loadable charsets
     *      we have to store the charset name, not the number
     *
     * TODO encoding
     *
     * see also PF_fetch_string
     */

    /* encode charset_nr, encoding_nr and flags into the same word */
    *cursor++ = (Parrot_encoding_number_of_str(NULL, s) << 8)         |
                (PObj_get_FLAGS(s) & PObj_constant_FLAG ? 0x1 : 0x0) |
                (PObj_get_FLAGS(s) & PObj_private7_FLAG ? 0x2 : 0x0) ;
    *cursor++ = s->bufused;

    /* Switch to char * since rest of string is addressed by
     * characters to ensure padding.  */
    charcursor = (char *)cursor;

    if (s->strstart) {
        memcpy(charcursor, s->strstart, s->bufused);
        charcursor += s->bufused;
        /* Pad up to sizeof (opcode_t) boundary. */
        while ((unsigned long) (charcursor - (char *) cursor) % sizeof (opcode_t)) {
            *charcursor++ = 0;
        }
    }
    PARROT_ASSERT(((unsigned long) (charcursor - (char *) cursor) % sizeof (opcode_t)) == 0);
    cursor += (charcursor - (char *) cursor) / sizeof (opcode_t);

    return cursor;
}

/*

=item C<size_t PF_size_string(const STRING *s)>

Reports stored size of C<STRING> in C<opcode_t> units.

=cut

*/

PARROT_PURE_FUNCTION
size_t
PF_size_string(ARGIN(const STRING *s))
{
    ASSERT_ARGS(PF_size_string)
    /* TODO: don't break encapsulation on strings */
    const UINTVAL len = s->bufused;
    if (STRING_IS_NULL(s))
        return 1;
    else
        return PF_size_strlen(len);
}

/*

=item C<size_t PF_size_strlen(const UINTVAL len)>

Reports stored size of C<STRING> in C<opcode_t> units given its in-memory byte length.

=cut

*/

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t
PF_size_strlen(const UINTVAL len)
{
    ASSERT_ARGS(PF_size_strlen)
    opcode_t padded_size = len;

    if (padded_size % sizeof (opcode_t)) {
        padded_size += sizeof (opcode_t) - (padded_size % sizeof (opcode_t));
    }

    /* Include space for flags, representation, and size fields.  */
    return 2 + (size_t)padded_size / sizeof (opcode_t);
}

/*

=item C<char * PF_fetch_cstring(PARROT_INTERP, PackFile *pf, const opcode_t
**cursor)>

Fetches a cstring from bytecode and returns an allocated copy

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char *
PF_fetch_cstring(PARROT_INTERP, ARGIN(PackFile *pf), ARGIN(const opcode_t **cursor))
{
    ASSERT_ARGS(PF_fetch_cstring)
    const size_t str_len = strlen((const char *)(*cursor)) + 1;
    char * const p = mem_gc_allocate_n_typed(interp, str_len, char);
    const int wordsize = pf->header->wordsize;

    strcpy(p, (const char*) (*cursor));
    *((const unsigned char **) (cursor)) += ROUND_UP_B(str_len, wordsize);
    return p;
}

/*

=item C<opcode_t* PF_store_cstring(opcode_t *cursor, const char *s)>

Writes a C<NULL>-terminated string to the stream.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t*
PF_store_cstring(ARGOUT(opcode_t *cursor), ARGIN(const char *s))
{
    ASSERT_ARGS(PF_store_cstring)
    /*
     * This is not very efficient for filling padding with zeros.
     * But it's more efficient than calculate strlen twice.
     */
    size_t store_size = PF_size_cstring(s);
    memset((char *) cursor, 0, store_size * sizeof (opcode_t));
    strcpy((char *) cursor, s);
    return cursor + store_size;
}

/*

=item C<size_t PF_size_cstring(const char *s)>

Returns store size of a C-string in C<opcode_t> units.

=cut

*/

PARROT_PURE_FUNCTION
size_t
PF_size_cstring(ARGIN(const char *s))
{
    ASSERT_ARGS(PF_size_cstring)
    size_t str_len;

    PARROT_ASSERT(s);
    str_len = strlen(s);
    return ROUND_UP(str_len + 1, sizeof (opcode_t));
}

/*

=item C<void PackFile_assign_transforms(PackFile *pf)>

Assigns transform functions to the vtable.

=cut

*/

void
PackFile_assign_transforms(ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(PackFile_assign_transforms)
    const int need_endianize = pf->header->byteorder != PARROT_BIGENDIAN;
    const int need_wordsize  = pf->header->wordsize  != sizeof (opcode_t);

    pf->need_endianize = need_endianize;
    pf->need_wordsize  = need_wordsize;

    if (need_endianize) {
#if PARROT_BIGENDIAN
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_le_4;
        else
            pf->fetch_op = fetch_op_le_8;
#else
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_be_4;
        else
            pf->fetch_op = fetch_op_be_8;
#endif
    }
    else {
#if PARROT_BIGENDIAN
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_be_4;
        else
            pf->fetch_op = fetch_op_be_8;
#else
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_le_4;
        else
            pf->fetch_op = fetch_op_le_8;
#endif
    }

    pf->fetch_iv = pf->fetch_op;

    switch (pf->header->floattype) {
#if FLOATTYPE == FLOATTYPE_8
      case FLOATTYPE_8:
        if (need_endianize)
            pf->fetch_nv = pf->header->byteorder ? fetch_buf_be_8 : fetch_buf_le_8;
        break;
      case FLOATTYPE_10:
        pf->fetch_nv = cvt_num10_num8;
        break;
      case FLOATTYPE_16:
        pf->fetch_nv = cvt_num16_num8;
        break;
      case FLOATTYPE_16PPC:
        pf->fetch_nv = cvt_num16ppc_num8;
        break;
      case FLOATTYPE_4:
        pf->fetch_nv = cvt_num4_num8;
        break;
#endif
#if FLOATTYPE == FLOATTYPE_10
      case FLOATTYPE_8:
        pf->fetch_nv = cvt_num8_num10;
        break;
      case FLOATTYPE_10:
        if (need_endianize || need_wordsize)
            pf->fetch_nv = pf->header->wordsize == 8
                ? fetch_buf_le_16
                : fetch_buf_le_12;
        break;
      case FLOATTYPE_16:
        pf->fetch_nv = cvt_num16_num10;
        break;
      case FLOATTYPE_16PPC:
        pf->fetch_nv = cvt_num16ppc_num10;
        break;
      case FLOATTYPE_4:
        pf->fetch_nv = cvt_num4_num10;
        break;
#endif
#if FLOATTYPE == FLOATTYPE_16
      case FLOATTYPE_8:
        pf->fetch_nv = cvt_num8_num16;
        break;
      case FLOATTYPE_10:
        pf->fetch_nv = cvt_num10_num16;
        break;
      case FLOATTYPE_16PPC:
        pf->fetch_nv = cvt_num16ppc_num16;
        break;
      case FLOATTYPE_16:
        if (need_endianize)
            pf->fetch_nv = pf->header->byteorder ? fetch_buf_be_16 : fetch_buf_le_16;
        break;
      case FLOATTYPE_4:
        pf->fetch_nv = cvt_num4_num16;
        break;
#endif
#if FLOATTYPE == FLOATTYPE_16PPC
      case FLOATTYPE_8:
        pf->fetch_nv = cvt_num8_num16ppc;
        break;
      case FLOATTYPE_10:
        pf->fetch_nv = cvt_num10_num16ppc;
        break;
      case FLOATTYPE_16:
        pf->fetch_nv = cvt_num16_num16ppc;
        break;
      case FLOATTYPE_16PPC:
        if (need_endianize)
            pf->fetch_nv = pf->header->byteorder ? fetch_buf_be_16 : fetch_buf_le_16;
        break;
      case FLOATTYPE_4:
        pf->fetch_nv = cvt_num4_num16ppc;
        break;
#endif
#if FLOATTYPE == FLOATTYPE_4
      case FLOATTYPE_8:
        pf->fetch_nv = cvt_num8_num4;
        break;
      case FLOATTYPE_10:
        pf->fetch_nv = cvt_num10_num4;
        break;
      case FLOATTYPE_16:
        pf->fetch_nv = cvt_num16_num4;
        break;
      case FLOATTYPE_16PPC:
        pf->fetch_nv = cvt_num16ppc_num4;
        break;
      case FLOATTYPE_4:
        if (need_endianize)
            pf->fetch_nv = pf->header->byteorder ? fetch_buf_be_4 : fetch_buf_le_4;
        break;
#endif
      default:
      {
        int floatsize = PF_floattype_size[ pf->header->floattype ];
        /* Intel x86_64 has FLOATTYPE_10 aligned to size 16. */
        if ( floatsize == 12 && pf->header->wordsize == 8 )
            floatsize = 16;
        Parrot_x_force_error_exit(NULL, 1,
              "PackFile_unpack: unsupported float conversion %d %s to %d %s, "
              "size=%d, bigendian=%d\n",
              pf->header->floattype, PF_floattype_names[pf->header->floattype],
              FLOATTYPE, PF_floattype_names[FLOATTYPE],
              floatsize, pf->header->byteorder );
            break;
      }
    }
    return;
}


/*

=item C<static INTVAL fetch_iv_le(INTVAL w)>

This function converts a 4 or 8 byte C<INTVAL> into little endian
format. If the native format is already little endian, then no
conversion is done.

=cut

*/

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static INTVAL
fetch_iv_le(INTVAL w)
{
    ASSERT_ARGS(fetch_iv_le)
#if !PARROT_BIGENDIAN
    return w;
#else
#  if INTVAL_SIZE == 4
    return bswap32(w);
#  else
#    if INTVAL_SIZE == 8
    return bswap64(w);
#    else
    Parrot_x_force_error_exit(NULL, 1, "Unsupported INTVAL_SIZE=%d\n",
               INTVAL_SIZE);
#    endif
#  endif
#endif
}

/*

=item C<static INTVAL fetch_iv_be(INTVAL w)>

This function converts a 4 or 8 byte C<INTVAL> into big endian format.
If the native format is already big endian, then no conversion is done.

=cut

*/

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static INTVAL
fetch_iv_be(INTVAL w)
{
    ASSERT_ARGS(fetch_iv_be)
#if PARROT_BIGENDIAN
    return w;
#else
#  if INTVAL_SIZE == 4
    return bswap32(w);
#  else
#    if INTVAL_SIZE == 8
    return bswap64(w);
#    else
    Parrot_x_force_error_exit(NULL, 1, "Unsupported INTVAL_SIZE=%d\n", INTVAL_SIZE);
#    endif
#  endif
#endif
}

/*

=item C<static opcode_t fetch_op_be(opcode_t w)>

Same as C<fetch_iv_be> for opcode_t

=cut

*/

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static opcode_t
fetch_op_be(opcode_t w)
{
    ASSERT_ARGS(fetch_op_be)
#if PARROT_BIGENDIAN
    return w;
#else
#  if OPCODE_T_SIZE == 4
    return bswap32(w);
#  else
    return bswap64(w);
#  endif
#endif
}

/*

=item C<static opcode_t fetch_op_le(opcode_t w)>

Same as C<fetch_iv_le> for opcode_t

=cut

*/

PARROT_INLINE
PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
static opcode_t
fetch_op_le(opcode_t w)
{
    ASSERT_ARGS(fetch_op_le)
#if !PARROT_BIGENDIAN
    return w;
#else
#  if OPCODE_T_SIZE == 4
    return bswap32(w);
#  else
    return bswap64(w);
#  endif
#endif
}

/*

=pod

Unrolled routines for swapping various sizes from 32-128 bits. These
should only be used if alignment is unknown or we are pulling something
out of a padded buffer.

=cut

*/

/*

=item C<static void fetch_buf_be_4(unsigned char *rb, const unsigned char *b)>

Fetches a 4-byte big-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_be_4(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_be_4)
#if PARROT_BIGENDIAN
    memcpy(rb, b, 4);
#else
    *(Parrot_UInt4*)rb = bswap32(*(Parrot_UInt4*)b);
#endif
}

/*

=item C<static void fetch_buf_le_4(unsigned char *rb, const unsigned char *b)>

Fetches a 4-byte little-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_le_4(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_le_4)
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 4);
#else
    *(Parrot_UInt4*)rb = bswap32(*(Parrot_UInt4*)b);
#endif
}

/*

=item C<static void fetch_buf_be_8(unsigned char *rb, const unsigned char *b)>

Fetches a 8-byte big-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_be_8(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_be_8)
#if PARROT_BIGENDIAN
    memcpy(rb, b, 8);
#elif defined(HAS_LONGLONG)
    *(Parrot_UInt8*)rb = bswap64(*(Parrot_UInt8*)b);
#else
    SWAB_8(rb, b);
#endif
}

/*

=item C<static void fetch_buf_le_8(unsigned char *rb, const unsigned char *b)>

Fetches a 8-byte little-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_le_8(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_le_8)
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 8);
#elif defined(HAS_LONGLONG)
    *(Parrot_UInt8*)rb = bswap64(*(Parrot_UInt8*)b);
#else
    SWAB_8(rb, b);
#endif
}

/*

=item C<static void fetch_buf_le_12(unsigned char *rb, const unsigned char *b)>

Fetches a 12-byte little-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_le_12(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_le_12)
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 12);
#else
    SWAB_12(rb,b);
#  if 0
    /* XXX I'm sceptical */
    rb[0]  = b[9];
    rb[1]  = b[8];
    rb[2]  = b[11];
    rb[3]  = b[10];
    rb[4]  = b[5];
    rb[5]  = b[4];
    rb[6]  = b[7];
    rb[7]  = b[6];
    rb[8]  = b[2];
    rb[9]  = b[1];
    rb[10] = b[4];
    rb[11] = b[3];
#  endif
#endif
}

/*

=item C<static void fetch_buf_be_12(unsigned char *rb, const unsigned char *b)>

Fetches a 12-byte big-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_be_12(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_be_12)
#if PARROT_BIGENDIAN
    memcpy(rb, b, 12);
#else
    SWAB_12(rb,b);
#endif
}

/*

=item C<static void fetch_buf_le_16(unsigned char *rb, const unsigned char *b)>

Fetches a 16-byte little-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_le_16(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_le_16)
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 16);
#else
    SWAB_16(rb, b);
#endif
}

/*

=item C<static void fetch_buf_be_16(unsigned char *rb, const unsigned char *b)>

Fetches a 16-byte big-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_be_16(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_be_16)
#if PARROT_BIGENDIAN
    memcpy(rb, b, 16);
#else
    SWAB_16(rb, b);
#endif
}

/*

=item C<static void fetch_buf_le_32(unsigned char *rb, const unsigned char *b)>

Fetches a 32-byte little-endian buffer C<b> into a C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_le_32(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_le_32)
#if !PARROT_BIGENDIAN
    memcpy(rb, b, 32);
#else
    SWAB_32(rb, b);
#endif
}

/*

=item C<static void fetch_buf_be_32(unsigned char *rb, const unsigned char *b)>

Fetches a 32-byte big-endian buffer C<b> into C<rb>.

=cut

*/

PARROT_INLINE
static void
fetch_buf_be_32(ARGOUT(unsigned char *rb), ARGIN(const unsigned char *b))
{
    ASSERT_ARGS(fetch_buf_be_32)
#if PARROT_BIGENDIAN
    memcpy(rb, b, 32);
#else
    SWAB_32(rb, b);
#endif
}


/*

=back

=head1 TODO

C<<PF_store_<type>()>> - write an opcode_t stream to cursor in natural
byte-ordering.

C<<PF_fetch_<type>()>> - read items and possibly convert the foreign
format.

C<<PF_size_<type>()>> - return the needed size in C<opcode_t> units.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
