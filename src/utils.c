/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/utils.c - Some utility functions

=head1 DESCRIPTION

Prototypes are in F<src/misc.h>.

Opcode helper functions that don't really fit elsewhere.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

/*

=item C<INTVAL
intval_mod(INTVAL i2, INTVAL i3)>

NOTE: This "corrected mod" algorithm is based on the C code on page 70
of [1]. Assuming correct behavior of the built-in mod operator (%) with
positive arguments, this algorithm implements a mathematically
convenient version of mod, defined thus:

    x mod y = x - y * floor(x / y)

For more information on this definition of mod, see section 3.4 of [2],
pages 81-85.

References:

[1] Donald E. Knuth, *MMIXware: A RISC Computer for the Third
Millennium* Springer, 1999.

[2] Ronald L. Graham, Donald E. Knuth and Oren Patashnik, *Concrete
Mathematics*, Second Edition. Addison-Wesley, 1994.

=cut

*/

INTVAL
intval_mod(INTVAL i2, INTVAL i3)
{
    INTVAL y;
    INTVAL z = i3;
    int s = 0;
    INTVAL r;

    if (z == 0)
	return i2;

    y = i2;

    if (y < 0) { s += 2; y = -y; }
    if (z < 0) { s += 1; z = -z; }

    r = y % z;

    switch (s) {
	case 0:            break;
	case 1: r = r - z; break;
	case 2: r = z - r; break;
	case 3: r = -r;    break;
    }

    return r;
}

/*

=item C<FLOATVAL
floatval_mod(FLOATVAL n2, FLOATVAL n3)>

Returns C<n2 mod n3>.

Includes a workaround for buggy code generation in the C<lcc> compiler.

=cut

*/

FLOATVAL
floatval_mod(FLOATVAL n2, FLOATVAL n3)
{
#ifdef __LCC__

  /* Another workaround for buggy code generation in the lcc compiler-
   * adding a temporary variable makes it pass the test.
   */
  FLOATVAL temp = n3 * floor(n2 / n3);

  return n3
     ? (n2 - temp)
     : n2;
#else
  return n3
     ? (n2 - n3 * floor(n2 / n3))
     : n2;
#endif
}

/*

=item C<PMC*
foldup(Parrot_Interp interpreter, INTVAL skip)>

Take all the PMCs in register P3, starting at offset C<skip> and return
them in an C<Array> PMC.

TODO - IMCC and PDD 3 aren't yet in conformance. This uses the current
IMCC setup, but should be changed as soon as IMCC modified to the
correct calling conventions.

=cut

*/

PMC*
foldup(Parrot_Interp interpreter, INTVAL skip)
{
    /* Should be I3 when we're done */
    INTVAL max_used_reg = REG_INT(3) + 5;
    INTVAL reg;
    INTVAL elems_in_array = 0;
    INTVAL current_offset = 0;
    INTVAL total_size;
    INTVAL start = 5;
    PMC *destination_pmc = NULL;
    PMC *overflow = REG_PMC(3);

    destination_pmc = pmc_new_noinit(interpreter, enum_class_Array);
    VTABLE_init(interpreter, destination_pmc);

    /* see how many are in the overflow, if any */
    if (max_used_reg == 16 && !PMC_IS_NULL(overflow) &&
            VTABLE_type(interpreter, overflow) != enum_class_Null) {
        elems_in_array = VTABLE_get_integer(interpreter, overflow);
    }
    /* XXX This needs fixing when IMCC does calling conventions right */
    total_size = REG_INT(3) + elems_in_array - skip;

    VTABLE_set_integer_native(interpreter, destination_pmc, total_size);

    /* Skip past what we're skipping */
    start += skip;

    /* First move over the PMCs in registers */
    for (reg = start; reg < max_used_reg; reg++) {
        VTABLE_set_pmc_keyed_int(interpreter, destination_pmc,
                current_offset, REG_PMC(reg));
        current_offset++;
    }
    if (elems_in_array) {
        INTVAL cur_elem;
        start = 0;
        if (skip > 11) {
            start = skip - 11;
        }
        for (cur_elem = start; cur_elem < elems_in_array; cur_elem++) {
            VTABLE_set_pmc_keyed_int(interpreter, destination_pmc,
                    current_offset,
                    VTABLE_get_pmc_keyed_int(interpreter, overflow, cur_elem));
            current_offset++;
        }
    }
    return destination_pmc;
}

/*

=back

=head2 Random Number Generator

Based on the C<rand48()> family of functions.

=over 4

=cut

*/

/*
 * currently undefined
 */
#ifndef PARROT_HAS_DRAND48

typedef unsigned short _rand_buf[3];
/*
 * s. man drand48, SuS V2
 *
 * X(n+1) = ( aX(n) + c ) mod 2^48
 *
 */
#define A_lo  0xE66D
#define A_mid 0xDEEC
#define A_hi  0x5
#define C     0xB
#define SEED_LO 0x330E

static _rand_buf a = { A_lo, A_mid, A_hi };
static _rand_buf last_rand;
static unsigned short c = C;

/*

=item C<static void
next_rand(_rand_buf X)>

Returns the next random number in C<X>.

=cut

*/

static void
next_rand(_rand_buf X)
{
    unsigned short lo, mid, hi;
    unsigned int t;

    /* 48 bit mul, one short at a time */
    t = X[0] * a[0] + c;
    lo = t & 0xffff;
    mid = (t >> 16) & 0xffff;

    t = X[1] * a[0] + X[0] * a[1] + mid;
    mid = t & 0xffff;
    hi = (t >> 16) & 0xffff;

    t = X[2] * a[0] + X[1] * a[1] + X[0] * a[2] + hi;

    X[0] = lo;
    X[1] = mid;
    X[2] = t & 0xffff;
}

/*

=item C<static FLOATVAL
_erand48(_rand_buf buf)>

Returns a C<double> in the interval C<[0.0, 1.0)>.

=cut

*/

static FLOATVAL
_erand48(_rand_buf buf)
{
    FLOATVAL r;
    next_rand(buf);
    r = (( buf[0] / 65536.0 + buf[1] ) / 65536.0 + buf[2]) / 65536.0;
    return r;
}

/*

=item C<static FLOATVAL
_drand48(void)>

Returns a C<double> in the interval C<[0.0, 1.0)>.

=cut

*/

static FLOATVAL
_drand48(void)
{
    return _erand48(last_rand);
}

/*

=item C<static long
_jrand48(_rand_buf buf)>

Returns a C<long> in the interval C<[-2^31, 2^31)>.

=cut

*/

static long
_jrand48(_rand_buf buf)
{
    long ret;
    next_rand(buf);
    ret = buf[2] << 16 | buf[1];
    return ret;
}

/*

=item C<static long
_nrand48(_rand_buf buf)>

Returns a C<long> in the interval C<[0, 2^31)>.

=cut

*/

static long
_nrand48(_rand_buf buf)
{
    return _jrand48(buf) & 0x7fffffff;
}

/*

=item C<static long
_lrand48(void)>

Returns a C<long> in the interval C<[0, 2^31)>.

=cut

*/

static long
_lrand48(void)
{
    return _nrand48(last_rand);
}

/*

=item C<static long
_mrand48(void)>

Returns a C<long> in the interval C<[-2^31, 2^31)>.

=cut

*/

static long
_mrand48(void)
{
    return _jrand48(last_rand);
}

/*

=item C<static void
_srand48(long seed)>

Sets the high order 32 bits to the argument C<seed>. The low order 16
bits are set to the arbitrary value 0x330e.

=cut

*/

static void
_srand48(long seed)
{
    last_rand[0] = SEED_LO;
    last_rand[1] = seed & 0xffff;
    last_rand[2] = (seed >> 16) & 0xffff;
    /*
     * reinit a, c if changed by lcong48()
     */
}

#undef A_lo
#undef A_mid
#undef A_hi
#undef C

#else

#  define _drand48 drand48
#  define _erand48(b) erand48(b)

#  define _lrand48 lrand48
#  define _nrand48(b) nrand48(b)

#  define _mrand48 mrand48
#  define _jrand48(b) jrand48(b)

#  define _srand48 srand48

#endif

/*

=item C<FLOATVAL
Parrot_float_rand(INTVAL how_random)>

Returns a C<FLOATVAL> in the interval C<[0.0, 1.0)>.

C<how_random> is ignored.

=cut

*/

FLOATVAL
Parrot_float_rand(INTVAL how_random)
{
    return _drand48();          /* [0.0..1.0] */
}

/*

=item C<INTVAL
Parrot_uint_rand(INTVAL how_random)>

Returns an C<INTVAL> in the interval C<[0, 2^31)>.

C<how_random> is ignored.

=cut

*/

INTVAL
Parrot_uint_rand(INTVAL how_random)
{
    return _lrand48();          /* [0..2^31] */
}

/*

=item C<INTVAL
Parrot_int_rand(INTVAL how_random)>

Returns an C<INTVAL> in the interval C<[-2^31, 2^31)>.

C<how_random> is ignored.

=cut

*/

INTVAL
Parrot_int_rand(INTVAL how_random)
{
    return _mrand48();          /* [-2^31..2^31] */
}

/*

=item C<INTVAL
Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)>

Returns an C<INTVAL> in the range C<[from, to]>.

C<how_random> is ignored.

=cut

*/

INTVAL
Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)
{
    return (INTVAL) from + ((double)(to - from)) * Parrot_float_rand(how_random);
}

/*

=item C<void
Parrot_srand(INTVAL seed)>

Seeds the random number generator with C<seed>.

=cut

*/

void
Parrot_srand(INTVAL seed)
{
    _srand48(seed);
}

/*

=back

=head2 Array Functions

=over

=item C<void *
Parrot_make_la(Interp *interpreter, PMC *array)>

Creates a C array of C<long>s with one more element than the number of
elements in C<*array>. The elements are then copied from C<*array> to
the new array, and the last (extra) element is set to 0.

Used in C<src/nci.c>.

=cut

*/

void *
Parrot_make_la(Interp *interpreter, PMC *array) {
    INTVAL arraylen = VTABLE_elements(interpreter, array);
    long *out_array = NULL;
    INTVAL cur = 0;

    /* Allocate the array and set the last element to 0. Since we
       always allocate one element more than we use we're guaranteed
       to actually have an array, even if the inbound array is
       completely empty
    */
    out_array = mem_sys_allocate((sizeof(long)) * (arraylen + 1));
    out_array[arraylen] = 0;

    for (cur = 0; cur < arraylen; cur++) {
        out_array[cur] = VTABLE_get_integer_keyed_int(interpreter, array, cur);
    }

    return out_array;
}

/*

=item C<void
Parrot_destroy_la(long *array)>

Use this to destroy an array created with C<Parrot_make_la()>.

=cut

*/

void
Parrot_destroy_la(long *array) {
    mem_sys_free(array);
}

/*

=item C<void *
Parrot_make_cpa(Interp *interpreter, PMC *array)>

Creates a C array of C<char *>s with one more element than the number of
elements in C<*array>. The elements are then copied from C<*array> to
the new array, and the last (extra) element is set to 0.

Currently unused.

=cut

*/

void *
Parrot_make_cpa(Interp *interpreter, PMC *array) {
    INTVAL arraylen = VTABLE_elements(interpreter, array);
    char **out_array = NULL;
    INTVAL cur = 0;

    /* Allocate the array and set the last element to 0. Since we
       always allocate one element more than we use we're guaranteed
       to actually have an array, even if the inbound array is
       completely empty
    */
    out_array = mem_sys_allocate((sizeof(char *)) * (arraylen + 1));
    out_array[arraylen] = 0;

    for (cur = 0; cur < arraylen; cur++) {
        out_array[cur] = string_to_cstring(interpreter, VTABLE_get_string_keyed_int(interpreter, array, cur));
    }

    return out_array;
}

/*

=item C<void
Parrot_destroy_cpa(char **array)>

Use this to destroy an array created with C<Parrot_make_cpa()>.

=cut

*/

void
Parrot_destroy_cpa(char **array) {
    UINTVAL offset = 0;
    /* Free each piece */
    while (array[offset] != NULL) {
        string_cstring_free(array[offset++]);
    }
    /* And then the holding array */
    mem_sys_free(array);
}
/*

=item C<PMC* tm_to_array(Parrot_Interp, struct tm *)>

Helper to convert a B<struct tm *> to an Array

=cut

*/

/* &gen_from_enum(tm.pasm) */
typedef enum {
    TM_SEC,
    TM_MIN,
    TM_HOUR,
    TM_MDAY,
    TM_MON,
    TM_YEAR,
    TM_WDAY,
    TM_YDAY,
    TM_ISDST
} tm_struct_enum;
/* &end_gen */

PMC*
tm_to_array(Parrot_Interp interpreter, struct tm *tm)
{
  PMC *Array = pmc_new(interpreter, enum_class_Array);
  VTABLE_set_integer_native(interpreter, Array, 9);
  VTABLE_set_integer_keyed_int(interpreter, Array, 0, tm->tm_sec);
  VTABLE_set_integer_keyed_int(interpreter, Array, 1, tm->tm_min);
  VTABLE_set_integer_keyed_int(interpreter, Array, 2, tm->tm_hour);
  VTABLE_set_integer_keyed_int(interpreter, Array, 3, tm->tm_mday);
  VTABLE_set_integer_keyed_int(interpreter, Array, 4, tm->tm_mon + 1);
  VTABLE_set_integer_keyed_int(interpreter, Array, 5, tm->tm_year + 1900);
  VTABLE_set_integer_keyed_int(interpreter, Array, 6, tm->tm_wday);
  VTABLE_set_integer_keyed_int(interpreter, Array, 7, tm->tm_yday);
  VTABLE_set_integer_keyed_int(interpreter, Array, 8, tm->tm_isdst);
  return Array;
}

/*

=back

=head1 HISTORY

Initial version by leo 2003.09.09.

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
