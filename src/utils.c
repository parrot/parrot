/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

src/utils.c - Some utility functions

=head1 DESCRIPTION

Prototypes are in F<src/misc.h>.

Opcode helper functions that don't really fit elsewhere.

=head2 Functions

*/

#include "parrot/parrot.h"

/* HEADER: include/parrot/misc.h */

/* Parrot_register_move companion functions i and data */
typedef struct parrot_prm_context {
    unsigned char *dest_regs;
    unsigned char *src_regs;
    unsigned char temp_reg;
    int* nb_succ;
    int* backup;
    int* reg_to_index;
    Interp *interp;
    reg_move_func mov;
    reg_move_func mov_alt;
    void *info;
} parrot_prm_context;

static void rec_climb_back_and_mark(int regindex, parrot_prm_context* c);
static void process_cycle_without_exit(int regindex, parrot_prm_context* c);
static void move_reg(int from, int dest, parrot_prm_context* c);

/*

FUNCDOC: intval_mod

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

*/

INTVAL
intval_mod(INTVAL i2, INTVAL i3)
    /* PURE,WARN_UNUSED */
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

    if (r) {    /* # 36003 */
        switch (s) {
            case 0:            break;
            case 1: r = r - z; break;
            case 2: r = z - r; break;
            case 3: r = -r;    break;
        }
    }

    return r;
}

/*

FUNCDOC: floatval_mod

Returns C<n2 mod n3>.

Includes a workaround for buggy code generation in the C<lcc> compiler.

*/

FLOATVAL
floatval_mod(FLOATVAL n2, FLOATVAL n3)
    /* PURE, WARN_UNUSED */
{
#ifdef __LCC__

  /* Another workaround for buggy code generation in the lcc compiler-
   * adding a temporary variable makes it pass the test.
   */
  const FLOATVAL temp = n3 * floor(n2 / n3);

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

=head2 Random Number Generator

Based on the C<rand48()> family of functions.

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
#  define A_lo  0xE66D
#  define A_mid 0xDEEC
#  define A_hi  0x5
#  define C     0xB
#  define SEED_LO 0x330E

static _rand_buf a = { A_lo, A_mid, A_hi };
static _rand_buf last_rand;
static unsigned short c = C;

/*

FUNCDOC: next_rand

Returns the next random number in C<X>.

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

FUNCDOC: _erand48

Returns a C<double> in the interval C<[0.0, 1.0)>.

*/

static FLOATVAL
_erand48(_rand_buf buf)
{
    FLOATVAL r;
    next_rand(buf);
    r = ((buf[0] / 65536.0 + buf[1]) / 65536.0 + buf[2]) / 65536.0;
    return r;
}

/*

FUNCDOC: _drand48

Returns a C<double> in the interval C<[0.0, 1.0)>.

*/

static FLOATVAL
_drand48(void)
{
    return _erand48(last_rand);
}

/*

FUNCDOC: _jrand48

Returns a C<long> in the interval C<[-2^31, 2^31)>.

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

FUNCDOC: _nrand48

Returns a C<long> in the interval C<[0, 2^31)>.

*/

static long
_nrand48(_rand_buf buf)
{
    return _jrand48(buf) & 0x7fffffff;
}

/*

FUNCDOC: _lrand48

Returns a C<long> in the interval C<[0, 2^31)>.

*/

static long
_lrand48(void)
{
    return _nrand48(last_rand);
}

/*

FUNCDOC: _mrand48

Returns a C<long> in the interval C<[-2^31, 2^31)>.

*/

static long
_mrand48(void)
{
    return _jrand48(last_rand);
}

/*

FUNCDOC: _srand48

Sets the high order 32 bits to the argument C<seed>. The low order 16
bits are set to the arbitrary value 0x330e.

*/

static void
_srand48(long seed)
{
    last_rand[0] = SEED_LO;
    last_rand[1] = (unsigned short)seed & 0xffff;
    last_rand[2] = (unsigned short)(seed >> 16) & 0xffff;
    /*
     * reinit a, c if changed by lcong48()
     */
}

#  undef A_lo
#  undef A_mid
#  undef A_hi
#  undef C

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

FUNCDOC: Parrot_float_rand

Returns a C<FLOATVAL> in the interval C<[0.0, 1.0)>.

C<how_random> is ignored.

*/

PARROT_API
FLOATVAL
Parrot_float_rand(INTVAL how_random)
{
    return _drand48();          /* [0.0..1.0] */
}

/*

FUNCDOC: Parrot_uint_rand

Returns an C<INTVAL> in the interval C<[0, 2^31)>.

C<how_random> is ignored.

*/

PARROT_API
INTVAL
Parrot_uint_rand(INTVAL how_random)
{
    return _lrand48();          /* [0..2^31] */
}

/*

FUNCDOC: Parrot_int_rand

Returns an C<INTVAL> in the interval C<[-2^31, 2^31)>.

C<how_random> is ignored.

*/

PARROT_API
INTVAL
Parrot_int_rand(INTVAL how_random)
{
    return _mrand48();          /* [-2^31..2^31] */
}

/*

FUNCDOC: Parrot_range_rand

Returns an C<INTVAL> in the range C<[from, to]>.

C<how_random> is ignored.

*/

PARROT_API
INTVAL
Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)
{
    return (INTVAL)(from + ((double)(to - from))
                     * Parrot_float_rand(how_random));
}

/*

FUNCDOC: Parrot_srand

Seeds the random number generator with C<seed>.

*/

PARROT_API
void
Parrot_srand(INTVAL seed)
{
    _srand48(seed);
}

/*

=head2 Array Functions

FUNCDOC: Parrot_make_la

Creates a C array of C<long>s with one more element than the number of
elements in C<*array>. The elements are then copied from C<*array> to
the new array, and the last (extra) element is set to 0.

Used in C<src/nci.c>.

*/

PARROT_API
void *
Parrot_make_la(Interp *interp, PMC *array /*NN*/)
    /* WARN_UNUSED */
{
    const INTVAL arraylen = VTABLE_elements(interp, array);
    INTVAL cur;

    /* Allocate the array and set the last element to 0. Since we
       always allocate one element more than we use we're guaranteed
       to actually have an array, even if the inbound array is
       completely empty
    */
    long * const out_array = (long *)mem_sys_allocate((sizeof (long)) * (arraylen + 1));
    out_array[arraylen] = 0;
    /*    printf("Long array has %i elements\n", arraylen);*/
    for (cur = 0; cur < arraylen; cur++) {
        out_array[cur] = VTABLE_get_integer_keyed_int(interp, array, cur);
    }

    return out_array;
}

/*

FUNCDOC: Parrot_destroy_la

Use this to destroy an array created with C<Parrot_make_la()>.

*/

PARROT_API
void
Parrot_destroy_la(long *array) {
    mem_sys_free(array);
}

/*

FUNCDOC: Parrot_make_cpa

Creates a C array of C<char *>s with one more element than the number of
elements in C<*array>. The elements are then copied from C<*array> to
the new array, and the last (extra) element is set to 0.

Currently unused.

Note that you need to free this array with C<Parrot_destroy_cpa()>.

*/

PARROT_API
void *
Parrot_make_cpa(Interp *interp, PMC *array)
{
    const INTVAL arraylen = VTABLE_elements(interp, array);
    INTVAL cur;

    /* Allocate the array and set the last element to 0. Since we
       always allocate one element more than we use we're guaranteed
       to actually have an array, even if the inbound array is
       completely empty
    */
    char ** const out_array = (char **)mem_sys_allocate((sizeof (char *))
                                               * (arraylen + 1));
    out_array[arraylen] = 0;

    /*    printf("String array has %i elements\n", arraylen);*/
    for (cur = 0; cur < arraylen; cur++) {
        out_array[cur] =
            string_to_cstring(interp,
                              VTABLE_get_string_keyed_int(interp,
                                                          array, cur));
        /*        printf("Offset %i is %s\n", cur, out_array[cur]);*/
    }

    return out_array;
}

/*

FUNCDOC: Parrot_destroy_cpa

Use this to destroy an array created with C<Parrot_make_cpa()>.

*/

PARROT_API
void
Parrot_destroy_cpa(char **array /*NN*/)
{
    UINTVAL offset = 0;
    /* Free each piece */
    while (array[offset] != NULL) {
        string_cstring_free(array[offset++]);
    }
    /* And then the holding array */
    mem_sys_free(array);
}

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

/*

FUNCDOC: tm_to_array

Helper to convert a B<struct tm *> to an Array

*/

PARROT_API
PMC*
tm_to_array(Parrot_Interp interp, const struct tm *tm /*NN*/)
{
    PMC * const Array = pmc_new(interp, enum_class_Array);

    VTABLE_set_integer_native(interp, Array, 9);
    VTABLE_set_integer_keyed_int(interp, Array, 0, tm->tm_sec);
    VTABLE_set_integer_keyed_int(interp, Array, 1, tm->tm_min);
    VTABLE_set_integer_keyed_int(interp, Array, 2, tm->tm_hour);
    VTABLE_set_integer_keyed_int(interp, Array, 3, tm->tm_mday);
    VTABLE_set_integer_keyed_int(interp, Array, 4, tm->tm_mon + 1);
    VTABLE_set_integer_keyed_int(interp, Array, 5, tm->tm_year + 1900);
    VTABLE_set_integer_keyed_int(interp, Array, 6, tm->tm_wday);
    VTABLE_set_integer_keyed_int(interp, Array, 7, tm->tm_yday);
    VTABLE_set_integer_keyed_int(interp, Array, 8, tm->tm_isdst);

    return Array;
}

PARROT_API
INTVAL
Parrot_byte_index(Interp *interp, const STRING *base /*NN*/,
        const STRING *search /*NN*/, UINTVAL start_offset)
{
    const INTVAL searchlen = search->strlen;
    const char * const search_start = search->strstart;
    const INTVAL max_possible_offset = (base->strlen - search->strlen);
    INTVAL current_offset;

    for (current_offset = start_offset; current_offset <= max_possible_offset;
            current_offset++) {
        const char * const base_start = (char *)base->strstart + current_offset;
        if (memcmp(base_start, search_start, searchlen) == 0) {
            return current_offset;
        }
    }

    return -1;
}

PARROT_API
INTVAL
Parrot_byte_rindex(Interp *interp, const STRING *base /*NN*/,
        const STRING *search /*NN*/, UINTVAL start_offset)
    /* WARN_UNUSED */
{
    const INTVAL searchlen = search->strlen;
    const char * const search_start = search->strstart;
    UINTVAL max_possible_offset = (base->strlen - search->strlen);
    INTVAL current_offset;

    if (start_offset && start_offset < max_possible_offset) {
        max_possible_offset = start_offset;
    }
    for (current_offset = max_possible_offset; current_offset >= 0;
            current_offset--) {
        const char * const base_start = (char *)base->strstart + current_offset;
        if (memcmp(base_start, search_start, searchlen) == 0) {
            return current_offset;
        }
    }

    return -1;
}

/*

FUNCDOC: rec_climb_back_and_mark

Recursive function, used by Parrot_register_move to
climb back the graph of register moves operations.

The node must have a predecessor: it is implicit because if a node has
a node_index, it must have a predecessor because the node_index are the
index of registers in dest_regs[] array, so by definition they have
a corrsponding src_regs register.

Then it emits the move operation with its predecessor, or its backup
if already used/visited.

Then continues the climbing if the predecessor was not modified, anf in that
case marks it, and set node_index as its backup.

  node_index  ... the index of a destination (i.e. with a pred.) register
  c           ... the graph and all the needed params : the context

*/

static void
rec_climb_back_and_mark(int node_index, parrot_prm_context* c /*NN*/)
{
    const int node = c->dest_regs[node_index];
    const int pred = c->src_regs[node_index];
    const int pred_index = c->reg_to_index[pred];

    if (pred_index < 0) { /* pred has no predecessor */
        move_reg(pred, node, c);
    }
    else { /* pred has a predecessor, so may be processed */
        const int src = c->backup[pred_index];
        if (src < 0) { /* not visited */
            move_reg(pred, node, c);
            c->backup[pred_index] = node; /* marks pred*/
            rec_climb_back_and_mark(pred_index, c);
        }
        else { /* already visited, use backup instead */
            move_reg(src, node, c);
        }
    }
}


/*

FUNCDOC: process_cycle_without_exit

Recursive function, used by Parrot_register_move to handle the case
of cycles without exits, that are cycles of move ops between registers
where each register has exactly one predecessor and one successor

For instance: 1-->2, 2-->3, 3-->1

  node_index  ... the index of a destination (i.e. with a pred.) register
  c           ... the graph and all the needed params : the context

*/

static void
process_cycle_without_exit(int node_index, parrot_prm_context* c /*NN*/)
{
    const int pred = c->src_regs[node_index];

    /* let's try the alternate move function*/
    const int alt =
        c->mov_alt
            ? c->mov_alt(c->interp, c->dest_regs[node_index], pred, c->info)
            : 0;

    if (0 == alt) { /* use temp reg */
        move_reg(c->dest_regs[node_index],c->temp_reg, c);
        c->backup[node_index] = c->temp_reg;
    } else
        c->backup[node_index] = c->dest_regs[node_index];

    rec_climb_back_and_mark(node_index, c);
}

/*
 should be self-speaking
 */

static void
move_reg(int from, int dest, parrot_prm_context* c /*NN*/)
{
   /* fprintf(stderr,"move %i ==> %i\n",from,dest);*/
    c->mov(c->interp, dest, from, c->info);
}


/*

Move C<n_regs> from the given register list C<src_regs> to C<dest_regs>.

  n_regs    ... amount of registers to move
  dest_regs ... list of register numbers 0..255
  src_regs  ... list of register numbers 0..255
  temp_reg  ... a register number not in one of these lists
  mov       ... a register move function to be called to move one register
  mov_alt   ... a register move function to be called to move one register
                which triese fetching from an alternate src (or NULLfunc):

    (void)  (mov)(interp, dest, src, info);
    moved = (mov_alt)(interp, dest, src, info);

Some C<dest_regs> might be the same as C<src_regs>, which makes this a bit
non-trivial, because if the destination is already clobbered, using it
later as source doesn"t work. E.g.

  0 <- 1
  1 <- 0     # register 0 already clobbered

or

  2 <- 0
  0 <- 1
  3 <- 2      # register 2 already clobbered - reorder moves

To handle such cases, we do:

  a) rearrange the order of moves (not possible in the first case)
     and/or if that failed:
  b) if an alternate move function is available, it may fetch the
     source from a different (non-clobbered) location - call it.
     if the function returns 0 also use c)
  c) if no alternate move function is available, use the temp reg

The amount of register moves should of course be minimal.

TODO The current implementation will not work for following cases

Talked to Leo and he said those cases are not likely (Vishal Soni).
1. I0->I1 I1->I0 I0->I3
2. I1->I2 I3->I2

TODO: Add tests for the above conditions.

*/

PARROT_API
void
Parrot_register_move(Interp *interp, int n_regs,
                     unsigned char *dest_regs /*NN*/, unsigned char *src_regs /*NN*/,
                     unsigned char temp_reg,
                     reg_move_func mov, reg_move_func mov_alt, void *info)
{
    int i;
    int max_reg = 0;
    int* nb_succ = NULL;
    int* backup = NULL;
    int* reg_to_index = NULL;
    parrot_prm_context c;

    if (n_regs == 0)
        return;

    if (n_regs == 1) {
        if (src_regs[0] != dest_regs[0])
            mov(interp, dest_regs[0], src_regs[0], info);
        return;
    }

    c.interp = interp;
    c.info = info;
    c.mov = mov;
    c.mov_alt = mov_alt;
    c.src_regs = src_regs;
    c.dest_regs = dest_regs;
    c.temp_reg = temp_reg;

    /* compute max_reg, the max reg number + 1 */
    for (i = 0; i < n_regs; i++) {
        if (src_regs[i] > max_reg)
            max_reg = src_regs[i];
        if (dest_regs[i] > max_reg)
            max_reg = dest_regs[i];
    }
    ++max_reg;


    /* allocate space for data structures */
    /* NOTA: data structures could be kept allocated somewhere waiting to get reused...*/
    c.nb_succ = nb_succ = (int*)mem_sys_allocate_zeroed(sizeof (int) * n_regs);
    c.backup = backup = (int*)mem_sys_allocate(sizeof (int) * n_regs);
    c.reg_to_index = reg_to_index = (int*)mem_sys_allocate(sizeof (int) * max_reg);

    /* init backup array */
    for (i = 0; i < n_regs; i++)
        backup[i] = -1;

    /* fill in the conversion array between a register number and its index */
    for (i = 0; i < max_reg; i++)
        reg_to_index[i] = -1;
    for (i = 0; i < n_regs; i++) {
        const int index = dest_regs[i];
        if (index != src_regs[i]) /* get rid of self-assignment */
            reg_to_index[index] = i;
    }

    /* count the nb of successors for each reg index */
    for (i = 0; i < n_regs; i++) {
        const int index = reg_to_index[ src_regs[i] ];
        if (index >= 0) /* not interested in the wells that have no preds */
            nb_succ[ index ]++;
    }
    /* process each well if any */
    for (i = 0; i < n_regs; i++) {
        if (0 == nb_succ[i]) { /* a well */
            rec_climb_back_and_mark(i, &c);
        }
    }

    /* process remaining dest registers not processed */
    /* remaining nodes are members of cycles without exits */
    for (i = 0; i < n_regs; i++) {
        if (0 < nb_succ[i] && 0 > backup[i]) { /* not a well nor visited*/
            process_cycle_without_exit(i, &c);
        }
    }

    mem_sys_free(nb_succ);
    mem_sys_free(reg_to_index);
    mem_sys_free(backup);
}


/*

=head1 HISTORY

Initial version by leo 2003.09.09.

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
