/*  utils.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Some utility functions
 *  Data Structure and Algorithms:
 *  History:
 *     Initial version by leo 2003.09.09
 *  Notes:
 *     Prototypes are in misc.h
 *  References:
 */

#include "parrot/parrot.h"

/*
 * opcode helper functions that don't really fit elsewhere
 */

/*
 * s. the comments in math.ops
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
	case 0 + 0:            break;
	case 0 + 1: r = r - z; break;
	case 2 + 0: r = z - r; break;
	case 2 + 1: r = -r;    break;
    }

    return r;
}

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
 * s. core.ops
 */
PMC*
foldup(Parrot_Interp interpreter, INTVAL skip)
{
    /* Should be I3 when we're done */
    INTVAL max_used_reg = REG_INT(2) + 5;
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
    total_size = REG_INT(2) + elems_in_array - skip;

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
 * random number generator
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

static FLOATVAL
_erand48(_rand_buf buf)
{
    FLOATVAL r;
    next_rand(buf);
    r = (( buf[0] / 65536.0 + buf[1] ) / 65536.0 + buf[2]) / 65536.0;
    return r;
}

static FLOATVAL
_drand48(void)
{
    return _erand48(last_rand);
}

static long
_jrand48(_rand_buf buf)
{
    long ret;
    next_rand(buf);
    ret = buf[2] << 16 | buf[1];
    return ret;
}

static long
_nrand48(_rand_buf buf)
{
    return _jrand48(buf) & 0x7fffffff;
}

static long
_lrand48(void)
{
    return _nrand48(last_rand);
}

static long
_mrand48(void)
{
    return _jrand48(last_rand);
}

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

FLOATVAL
Parrot_float_rand(INTVAL how_random)
{
    return _drand48();          /* [0.0..1.0] */
}

INTVAL
Parrot_uint_rand(INTVAL how_random)
{
    return _lrand48();          /* [0..2^31] */
}

INTVAL
Parrot_int_rand(INTVAL how_random)
{
    return _mrand48();          /* [-2^31..2^31] */
}

INTVAL
Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)
{
    return (INTVAL) from + ((double)(to - from)) * Parrot_float_rand(how_random);
}

void
Parrot_srand(INTVAL seed)
{
    _srand48(seed);
}

void *
Parrot_make_la(struct Parrot_Interp *interpreter, PMC *array) {
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

void
Parrot_destroy_la(long *array) {
    mem_sys_free(array);
}

void *
Parrot_make_cpa(struct Parrot_Interp *interpreter, PMC *array) {
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
