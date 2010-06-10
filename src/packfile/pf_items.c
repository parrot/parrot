/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

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

/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void cvt_num12_num16(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num12_num16_le(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num12_num8(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num12_num8_le(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num12(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num12_be(
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

static void cvt_num16_num8_be(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num16_num8_le(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num12(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num12_be(
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

static void cvt_num8_num16_be(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static void cvt_num8_num16_le(
    ARGOUT(unsigned char *dest),
    ARGIN(const unsigned char *src))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_be_4(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_be_8(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_le_4(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static opcode_t fetch_op_le_8(ARGIN(const unsigned char *b))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_cvt_num12_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num12_num16_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num12_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num12_num8_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num12 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num12_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num8_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num16_num8_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num12 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num12_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num16 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num16_be __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_cvt_num8_num16_le __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(src))
#define ASSERT_ARGS_fetch_op_be_4 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_fetch_op_be_8 __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(b))
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
 * low level FLOATVAL fetch and convert functions
 *
 * Floattype 0 = IEEE-754 8 byte double
 * Floattype 1 = x86 little endian 12 byte long double
 * Floattype 2 = IEEE-754 16 byte long double
 *
 */

/*

=item C<static void cvt_num12_num8(unsigned char *dest, const unsigned char
*src)>

Converts i386 LE 12-byte long double to IEEE 754 8-byte double.

Tested ok.

=cut

*/

static void
cvt_num12_num8(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num12_num8)
    int expo, i, s;
#ifdef __LCC__
    int expo2;
#endif

    /*
       12-byte double (96 bits):
       sign  1  bit 95
       exp  15 bits 94-80
       man  80 bits 79-0
    to 8-byte double (64 bits):
       sign  1  bit 63
       exp  11 bits 62-52
       man  52 bits 51-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[11]|src[10]|src[9] |src[8] |src[7] |src[6] | ...   |src[0] |
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------80 bits---------------------->|
    <----------------------------96 bits---------------------------->

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
    s = src[9] & 0x80; /* sign */
    expo = ((src[9] & 0x7f)<< 8 | src[8]);
    if (expo == 0) {
nul:
        if (s)
            dest[7] |= 0x80;
        return;
    }
#ifdef __LCC__
    /* Yet again, LCC blows up mysteriously until a temporary variable is
     * added. */
    expo2 = expo - 16383;
    expo  = expo2;
#else
    expo -= 16383;       /* - bias */
#endif
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
    if (s)
        dest[7] |= 0x80;
    /* long double frac 63 bits => 52 bits
       src[7] &= 0x7f; reset integer bit */
    for (i = 0; i < 6; ++i) {
        dest[i+1] |= (i==5 ? src[7]&0x7f : src[i+2]) >> 3;
        dest[i] |= (src[i+2] & 0x1f) << 5;
    }
    dest[0] |= src[1] >> 3;
}

/*

=item C<static void cvt_num16_num12(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 LE 16-byte long double to i386 LE 12-byte long double .
See http://babbage.cs.qc.cuny.edu/IEEE-754/References.xhtml

Untested.

=cut

*/

#if (NUMVAL_SIZE == 12) && !PARROT_BIGENDIAN
static void
cvt_num16_num12(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num12)

    /*
       16-byte double (128 bits):
       sign  1  bit 127
       exp  15 bits 126-112
       man 112 bits 111-0
    to 12-byte double (96 bits):
       sign  1  bit 95
       exp  15 bits 94-80
       man  80 bits 79-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[15]|src[14]|src[13]|src[12]|src[11]|src[10]| ...   |src[0] |
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT (IA64 or BE 64-bit)

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |dest[11]dest[10]dest[9]|dest[8]|dest[7]|dest[6]| ...   |dest[0]|
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------80 bits---------------------->|
    <----------------------------96 bits---------------------------->
              12-byte LONG DOUBLE FLOATING-POINT (i386 special)

    */

    memset(dest, 0, 12);
    /* simply copy over sign + exp */
    TRACE_PRINTF_2(("  cvt_num16_num12: sign+exp=0x%2x\n", src[15]));
    dest[11] = src[15];
    dest[12] = src[14];
    /* and trunc the rest */
    memcpy(&dest[10], &src[13], 10);
    TRACE_PRINTF_2(("  cvt_num16_num12: mantissa=0x%10x, double=%lf\n",
                    src[13], (long double)*dest));
}
#endif

/*

=item C<static void cvt_num12_num16(unsigned char *dest, const unsigned char
*src)>

Converts i386 LE 12-byte long double to IEEE 754 LE 16-byte long double.

Tested ok.
Fallback 12->8->16 disabled.

=cut

*/

#if (NUMVAL_SIZE == 16)
static void
cvt_num12_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num12_num16)
#  if 0
    unsigned char b[8];
    cvt_num12_num8(b, src);
    cvt_num8_num16(dest, b);
#  endif
    /*
       12-byte double (96 bits):
       sign  1  bit 95
       exp  15 bits 94-80
       man  80 bits 79-0
    to 16-byte double (128 bits):
       sign  1  bit 127
       exp  15 bits 126-112
       man 112 bits 111-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[11]|src[10]| src[9]| src[8]| src[7]| src[6]| ...   | src[0]|
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------80 bits---------------------->|
    <----------------------------96 bits---------------------------->
              12-byte LONG DOUBLE FLOATING-POINT (i386 special)

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |dest[15]dest[14]dest[13]dest[12]dest[11]dest[10] ...   |dest[0]|
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT (IA64 or BE 64-bit)

    */

    memset(dest, 0, 16);
    /* simply copy over sign + exp */
    TRACE_PRINTF_2(("  cvt_num12_num16: sign+exp=0x%2x\n", src[11]));
    dest[15] = src[11];
    dest[14] = src[12];
    /* and trunc the rest */
    memcpy(&dest[13], &src[9], 10);
    TRACE_PRINTF_2(("  cvt_num12_num15: mantissa=0x%10x, double=%lf\n",
                    src[19], (long double)*dest));
}
#endif
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

    if ((sizeof (long double) == 16) && (sizeof (double) == 8)) {

        long double ld;
        double d;

        memcpy(&ld, src, 16);
        d = (double)ld; /* compiler cast */
        memcpy(dest, &d, 8);

    }
    else {
        /* FIXME: This codepath fails */
        int expo, i, s;
#ifdef __LCC__
        int expo2;
#endif
        exit_fatal(1, "cvt_num16_num8: long double conversion unsupported");

    /* Have only 12-byte long double, or no long double at all. Need to disect it */

    /*
       16-byte double (128 bits):
       sign  1  bit 127
       exp  15 bits 126-112
       man 112 bits 111-0
    to 8-byte double (64 bits):
       sign  1  bit 63
       exp  11 bits 62-52
       man  52 bits 51-0

    +-------+-------+-------+-------+-------+-------+--...--+-------+
    |src[15]|src[14]|src[13]|src[12]|src[11]|src[10]| ...   |src[0] |
    S|     E        |                    F                          |
    +-------+-------+-------+-------+-------+-------+--...--+-------+
    1|<-----15----->|<----------------112 bits--------------------->|
    <---------------------------128 bits---------------------------->
            16-byte LONG DOUBLE FLOATING-POINT (IA64 or BE 64-bit)

    +-------+-------+-------+-------+-------+-------+-------+-------+
    |dest[7]|dest[6]|dest[5]|dest[4]|dest[3]|dest[2]|dest[1]|dest[0]|
    S|    E    |                           F                        |
    +-------+-------+-------+-------+-------+-------+-------+-------+
    1|<---11-->|<---------------------52 bits---------------------->|
    <----------------------------64 bits---------------------------->
                       8-byte DOUBLE FLOATING-POINT

   */

        memset(dest, 0, 8);
        s = src[15] & 0x80; /* 10000000 */
        /* 15->11 exponents bits */
        expo = ((src[15] & 0x7f)<< 8 | src[14]);
        if (expo == 0) {
          nul:
            if (s)
                dest[7] |= 0x80;
            return;
        }
#ifdef __LCC__
        /* LCC blows up mysteriously until a temporary variable is
         * added. */
        expo2 = expo - 16383;
        expo  = expo2;
#else
        expo -= 16383;       /* - same bias as with 12-byte */
#endif
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
        if (s)
            dest[7] |= 0x80;
        /* long double frac 112 bits => 52 bits
           src[13] &= 0x7f; reset integer bit */
        for (i = 0; i < 6; ++i) {
            dest[i+1] |= (i==5 ? src[13]&0x7f : src[i+7]) >> 3;
            dest[i] |= (src[i+7] & 0x1f) << 5;
        }
        dest[0] |= src[1] >> 3;
    }
}

/*

=item C<static void cvt_num8_num16(unsigned char *dest, const unsigned char
*src)>

Converts IEEE 754 8-byte double to IEEE 754 16 byte long double.

Untested.

=cut

*/

#if (NUMVAL_SIZE == 16)
static void
cvt_num8_num16(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num16)
    /* The compiler can do this for us */
    long double ld;
    double d;
    memcpy(&d, src, 8);
    ld = (long double)d; /* TODO: test compiler cast */
    /*TRACE_PRINTF_2(("  cvt_num8_num16: d=%f, ld=%lf\n", d, ld));*/
    memcpy(dest, &ld, 16);
}
#endif

/*

=item C<static void cvt_num8_num12(unsigned char *dest, const unsigned char
*src)>

Converts i386 8-byte double to i386 12 byte long double.

Tested ok.

=cut

*/

#if (NUMVAL_SIZE == 12) && !PARROT_BIGENDIAN
static void
cvt_num8_num12(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num12)
    long double ld;
    double d;
    memcpy(&d, src, 8);
    ld = (long double)d; /* compiler cast */
    /*TRACE_PRINTF_2(("  cvt_num8_num12: ld=%lf, d=%f\n", ld, d));*/
    memcpy(dest, &ld, 12);
}
#endif


/*

=item C<static void cvt_num8_num12_be(unsigned char *dest, const unsigned char
*src)>

Converts a big-endian IEEE 754 8-byte double to i386 LE 12-byte long double.

Tested ok.

=cut

*/

#if (NUMVAL_SIZE == 12) && !PARROT_BIGENDIAN
static void
cvt_num8_num12_be(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num12_be)
    unsigned char b[8];
    fetch_buf_be_8(b, src);
    /*TRACE_PRINTF_2(("  cvt_num8_num12_be: 0x%8x\n", b));*/
    cvt_num8_num12(dest, b);
}
#endif

/*

=item C<static void cvt_num8_num16_le(unsigned char *dest, const unsigned char
*src)>

Converts a little-endian IEEE 754 8-byte double to big-endian 16-byte long double.

Untested.

=cut

*/

#if (NUMVAL_SIZE == 16) && PARROT_BIGENDIAN
static void
cvt_num8_num16_le(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num16_le)
    unsigned char b[8];
    fetch_buf_be_8(b, src);  /* TODO test endianize */
    TRACE_PRINTF_2(("  cvt_num8_num16_le: 0x%8x\n", b));
    cvt_num8_num16(dest, b);
}
#endif

/*

=item C<static void cvt_num12_num16_le(unsigned char *dest, const unsigned char
*src)>

Converts a little-endian 12-byte double to big-endian 16-byte long double.

Tested nok.

=cut

*/

#if (NUMVAL_SIZE == 16) && PARROT_BIGENDIAN
static void
cvt_num12_num16_le(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num12_num16_le)
    unsigned char b[12];
    fetch_buf_be_12(b, src);  /* TODO test endianize */
    TRACE_PRINTF_2(("  cvt_num12_num16_le: 0x%8x\n", b));
    cvt_num12_num16(dest, b);
}
#endif

/*

=item C<static void cvt_num12_num8_le(unsigned char *dest, const unsigned char
*src)>

Converts a little-endian 12-byte i386 long double into a big-endian IEEE 754 8-byte double.

Tested nok.

=cut

*/

#if PARROT_BIGENDIAN
static void
cvt_num12_num8_le(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num12_num8_le)
    unsigned char b[12];
    fetch_buf_le_12(b, src);  /* TODO test endianize */
    TRACE_PRINTF_2(("  cvt_num12_num8_le: 0x%12x\n", b));
    cvt_num12_num8(dest, b);
    exit_fatal(1, "cvt_num12_num8_le: long double conversion unsupported");
}
#endif

/*

=item C<static void cvt_num16_num8_le(unsigned char *dest, const unsigned char
*src)>

Converts a little-endian IEEE 754 intel 16-byte long double into a
big-endian IEEE 754 8-byte double.

Tested nok. Produces all zeros.

=cut

*/

#if PARROT_BIGENDIAN
static void
cvt_num16_num8_le(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num8_le)
    unsigned char b[16];
    fetch_buf_le_16(b, src);
    TRACE_PRINTF_2(("  cvt_num16_num8_le: 0x%16x\n", b));
    cvt_num16_num8(dest, b);
    exit_fatal(1, "cvt_num16_num8_le: long double conversion unsupported");
}
#endif

/*

=item C<static void cvt_num16_num8_be(unsigned char *dest, const unsigned char
*src)>

Converts a big-endian IEEE 754 16-byte long double into a IEEE 754 8-byte double.

Untested.

=cut

*/

#if !PARROT_BIGENDIAN
static void
cvt_num16_num8_be(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num8_be)
    unsigned char b[16];
    fetch_buf_be_16(b, src);
    TRACE_PRINTF_2(("  cvt_num16_num8_be: 0x%16x\n", b));
    cvt_num16_num8(dest, b);
}
#endif

/*

=item C<static void cvt_num16_num12_be(unsigned char *dest, const unsigned char
*src)>

Converts a big-endian IEEE 754 16-byte long double into a 12-byte i386 long double.

Untested.

=cut

*/

#if (NUMVAL_SIZE == 12) && !PARROT_BIGENDIAN
static void
cvt_num16_num12_be(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num16_num12_be)
    unsigned char b[16];
    fetch_buf_be_16(b, src);
    TRACE_PRINTF_2(("  cvt_num16_num12_be: 0x%16x\n", b));
    cvt_num16_num12(dest, b);
}
#endif

/*

=item C<static void cvt_num8_num16_be(unsigned char *dest, const unsigned char
*src)>

Converts a big-endian IEEE 754 8-byte double to little-endian IEEE 754 16 byte
long double.

Untested.

=cut

*/

#if (NUMVAL_SIZE == 16) && !PARROT_BIGENDIAN
static void
cvt_num8_num16_be(ARGOUT(unsigned char *dest), ARGIN(const unsigned char *src))
{
    ASSERT_ARGS(cvt_num8_num16_be)
    unsigned char b[8];
    fetch_buf_be_8(b, src);
    cvt_num8_num16(dest, b);
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
#if PARROT_BIGENDIAN
    fetch_buf_le_4(u.buf, b);
#  if OPCODE_T_SIZE == 8
    return (Parrot_Int4)(u.o >> 32);
#  else
    return (opcode_t) fetch_iv_be((INTVAL)u.o);
#  endif
#else
    /* inlining the effects of the fetch_buf_le_4() call is worth it */
    memcpy(u.buf, b, 4);
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
    opcode_t o;
    if (!pf || !pf->fetch_op)
        return *(*stream)++;
    o = (pf->fetch_op)(*((const unsigned char **)stream));
    TRACE_PRINTF_VAL(("  PF_fetch_opcode: 0x%lx (%ld), at 0x%x\n",
                      o, o, OFFS(pf, *stream)));
    *((const unsigned char **) (stream)) += pf->header->wordsize;
    return o;
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
C<INTVAL> size in the PackFile header.

When used for freeze/thaw the C<pf> argument might be NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
PF_fetch_integer(ARGIN_NULLOK(PackFile *pf), ARGIN(const opcode_t **stream))
{
    ASSERT_ARGS(PF_fetch_integer)
    INTVAL i;

    if (!pf || pf->fetch_iv == NULL)
        return *(*stream)++;
    i = (pf->fetch_iv)(*((const unsigned char **)stream));
    TRACE_PRINTF_VAL(("  PF_fetch_integer: 0x%x (%d) at 0x%x\n", i, i,
                      OFFS(pf, *stream)));
    /* XXX assume sizeof (opcode_t) == sizeof (INTVAL) on the
     * machine producing this PBC.
     *
     * TODO TT #364 on Sparc 64bit: On pbc wordsize=4 but native ptrsize=8 and
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
    double d;
    if (!pf || !pf->fetch_nv) {
        TRACE_PRINTF(("PF_fetch_number: Native [%d bytes]\n",
                      sizeof (FLOATVAL)));
        memcpy(&f, (const char *)*stream, sizeof (FLOATVAL));
        TRACE_PRINTF_VAL(("PF_fetch_number: %f at 0x%x\n", f, OFFS(pf, *stream)));
        (*stream) += (sizeof (FLOATVAL) + sizeof (opcode_t) - 1)/
            sizeof (opcode_t);
        return f;
    }
    f = (FLOATVAL) 0;
    TRACE_PRINTF(("PF_fetch_number at 0x%x: Converting...\n", OFFS(pf, *stream)));
    /* 12->8 has a messy cast. */
    if (NUMVAL_SIZE == 8 && pf->header->floattype == FLOATTYPE_12) {
        (pf->fetch_nv)((unsigned char *)&d, (const unsigned char *) *stream);
        f = d;
        TRACE_PRINTF_VAL(("PF_fetch_number: cast %f\n", f));
    }
    else {
        (pf->fetch_nv)((unsigned char *)&f, (const unsigned char *) *stream);
        TRACE_PRINTF_VAL(("PF_fetch_number: %f\n", f));
    }
    if (pf->header->floattype == FLOATTYPE_8) {
        *((const unsigned char **) (stream)) += 8;
    }
    else if (pf->header->floattype == FLOATTYPE_12) {
        *((const unsigned char **) (stream)) += 12;
    }
    else if (pf->header->floattype == FLOATTYPE_16) {
        *((const unsigned char **) (stream)) += 16;
    }
    else if (pf->header->floattype == FLOATTYPE_16MIPS) {
        *((const unsigned char **) (stream)) += 16;
    }
    else if (pf->header->floattype == FLOATTYPE_16AIX) {
        *((const unsigned char **) (stream)) += 16;
    }
    else if (pf->header->floattype == FLOATTYPE_4) {
        *((const unsigned char **) (stream)) += 4;
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
    mem_sys_memcopy(cursor, val, sizeof (FLOATVAL));
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
    UINTVAL   charset_nr;
    const ENCODING *encoding;
    const CHARSET  *charset;
    size_t    size;
    const int wordsize          = pf ? pf->header->wordsize : sizeof (opcode_t);
    opcode_t  flag_charset_word = PF_fetch_opcode(pf, cursor);

    if (flag_charset_word == -1)
        return STRINGNULL;

    /* decode flags, charset and encoding */
    flags         = (flag_charset_word & 0x1 ? PObj_constant_FLAG : 0) |
                    (flag_charset_word & 0x2 ? PObj_private7_FLAG : 0) ;
    encoding_nr   = (flag_charset_word >> 16);
    charset_nr    = (flag_charset_word >> 8) & 0xFF;


    size = (size_t)PF_fetch_opcode(pf, cursor);

    TRACE_PRINTF(("PF_fetch_string(): flags=0x%04x, ", flags));
    TRACE_PRINTF(("encoding_nr=%ld, ", encoding_nr));
    TRACE_PRINTF(("charset_nr=%ld, ", charset_nr));
    TRACE_PRINTF(("size=%ld.\n", size));

    encoding = Parrot_get_encoding(interp, encoding_nr);
    charset  = Parrot_get_charset(interp, charset_nr);
    if (!encoding)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Invalid encoding number '%d' specified", encoding_nr);
    if (!charset)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                    "Invalid charset number '%d' specified", charset_nr);

    s = Parrot_str_new_init(interp, (const char *)*cursor, size,
            encoding, charset, flags);

    /* print only printable characters */
    TRACE_PRINTF_VAL(("PF_fetch_string(): string is '%s' at 0x%x\n",
                      s->strstart, OFFS(pf, *cursor)));

    TRACE_PRINTF_ALIGN(("-s ROUND_UP_B: cursor=0x%x, size=%d, wordsize=%d\n",
                        (const char *)*cursor + size, size, wordsize));

    size = ROUND_UP_B(size, wordsize);

    TRACE_PRINTF(("PF_fetch_string(): round size up to %ld.\n", size));
    *((const unsigned char **) (cursor)) += size;

    TRACE_PRINTF_ALIGN(("+s ROUND_UP_B: cursor=0x%x, size=%d\n", *cursor, size));
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

#if TRACE_PACKFILE == 3
    Parrot_io_eprintf(NULL, "PF_store_string(): size is %ld...\n", s->bufused);
#endif

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
    *cursor++ = (Parrot_encoding_number_of_str(NULL, s) << 16)       |
                (Parrot_charset_number_of_str(NULL, s) << 8)         |
                (PObj_get_FLAGS(s) & PObj_constant_FLAG ? 0x1 : 0x0) |
                (PObj_get_FLAGS(s) & PObj_private7_FLAG ? 0x2 : 0x0) ;
    *cursor++ = s->bufused;

    /* Switch to char * since rest of string is addressed by
     * characters to ensure padding.  */
    charcursor = (char *)cursor;

    if (s->strstart) {
        mem_sys_memcopy(charcursor, s->strstart, s->bufused);
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

    TRACE_PRINTF(("PF_fetch_cstring(): size is %ld...\n", str_len));
    strcpy(p, (const char*) (*cursor));
    TRACE_PRINTF_VAL(("PF_fetch_cstring(): string is '%s' at 0x%x\n",
                      p, OFFS(pf, *cursor)));
    TRACE_PRINTF_ALIGN(("-s ROUND_UP_B: cursor=0x%x, size=%d, wordsize=%d (cstring)\n",
                        *cursor, str_len, wordsize));
    *((const unsigned char **) (cursor)) += ROUND_UP_B(str_len, wordsize);
    TRACE_PRINTF_ALIGN(("+s ROUND_UP_B: cursor=0x%x, offset=0x%x\n",
                        *cursor, OFFS(pf, *cursor)));

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

#if PARROT_BIGENDIAN
    /* this Parrot is on a BIG ENDIAN machine */
    if (need_endianize) {
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_le_4;
        else
            pf->fetch_op = fetch_op_le_8;
        pf->fetch_iv = pf->fetch_op;

        switch (pf->header->floattype) {
#  if NUMVAL_SIZE == 8
          case FLOATTYPE_8:
            pf->fetch_nv = fetch_buf_le_8;
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num8_le;
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num8_le;
            break;
#  endif
#  if NUMVAL_SIZE == 16
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num16_le;
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num16_le;
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = fetch_buf_le_16;
            break;
#  endif
          default:
            exit_fatal(1,
              "PackFile_unpack: unsupported float conversion %d to %d, "
              "PARROT_BIGENDIAN=%d\n",
              NUMVAL_SIZE, pf->header->floattype, PARROT_BIGENDIAN);
            break;
        }
        return;
    }
    else {  /* no need_endianize */
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_be_4;
        else
            pf->fetch_op = fetch_op_be_8;
        pf->fetch_iv = pf->fetch_op;

        switch (pf->header->floattype) {
#  if NUMVAL_SIZE == 8
          case FLOATTYPE_8: /* native */
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num8;
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num8;
            break;
#  endif
#  if NUMVAL_SIZE == 16
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num16;
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num16;
            break;
          case FLOATTYPE_16: /* native */
            break;
#  endif
          default:
            exit_fatal(1,
              "PackFile_unpack: unsupported float conversion %d to %d, "
              "PARROT_BIGENDIAN=%d\n",
              NUMVAL_SIZE, pf->header->floattype, PARROT_BIGENDIAN);
            break;
        }
        return;
    }

#else  /* ENDIAN */

    /* this Parrot is on a LITTLE ENDIAN machine */
    if (need_endianize) {
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_be_4;
        else
            pf->fetch_op = fetch_op_be_8;
        pf->fetch_iv = pf->fetch_op;

        switch (pf->header->floattype) {
#  if NUMVAL_SIZE == 8
          case FLOATTYPE_8:
            pf->fetch_nv = fetch_buf_be_8;
            break;
          case FLOATTYPE_12:
            exit_fatal(1, "PackFile_unpack: invalid floattype 1 big-endian");
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num8_be;
            break;
#  endif
#  if NUMVAL_SIZE == 12
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num12_be;
            break;
          case FLOATTYPE_12:
            exit_fatal(1, "PackFile_unpack: invalid floattype 1 big-endian");
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num12_be;
            break;
#  endif
#  if NUMVAL_SIZE == 16
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num16_be;
            break;
          case FLOATTYPE_12:
            exit_fatal(1, "PackFile_unpack: invalid floattype 1 big-endian");
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = fetch_buf_be_16;
            break;
#  endif
          default:
            exit_fatal(1,
              "PackFile_unpack: unsupported float conversion %d to %d, "
              "PARROT_BIGENDIAN=%d\n",
              NUMVAL_SIZE, pf->header->floattype, PARROT_BIGENDIAN);
            break;
        }
        return;
    }
    else {
        if (pf->header->wordsize == 4)
            pf->fetch_op = fetch_op_le_4;
        else
            pf->fetch_op = fetch_op_le_8;
        pf->fetch_iv = pf->fetch_op;

        switch (pf->header->floattype) {
#  if NUMVAL_SIZE == 8
          case FLOATTYPE_8: /* native */
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num8;
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num8;
            break;
#  endif
#  if NUMVAL_SIZE == 12
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num12;
            break;
          case FLOATTYPE_12: /* native */
            break;
          case FLOATTYPE_16:
            pf->fetch_nv = cvt_num16_num12;
            break;
#  endif
#  if NUMVAL_SIZE == 16
          case FLOATTYPE_8:
            pf->fetch_nv = cvt_num8_num16;
            break;
          case FLOATTYPE_12:
            pf->fetch_nv = cvt_num12_num16;
            break;
          case FLOATTYPE_16: /* native */
            break;
#  endif
          default:
            exit_fatal(1,
              "PackFile_unpack: unsupported float conversion %d to %d, "
              "PARROT_BIGENDIAN=%d\n",
              NUMVAL_SIZE, pf->header->floattype, PARROT_BIGENDIAN);
            break;
        }
        return;
    }
#endif
}

/*

=back

=head1 HISTORY

Initial review by leo 2003.11.21

Most routines moved from F<src/packfile.c>.

Renamed PackFile_* to PF_*

Added 16 byte types.

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
 * vim: expandtab shiftwidth=4:
 */
