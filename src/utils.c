/*
Copyright (C) 2001-2010, Parrot Foundation.
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
#include "pmc/pmc_nci.h"

typedef unsigned short _rand_buf[3];

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

/* HEADERIZER HFILE: include/parrot/misc.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static FLOATVAL _drand48(void);
static FLOATVAL _erand48(_rand_buf buf);
static long _jrand48(_rand_buf buf);
static long _lrand48(void);
static long _mrand48(void);
static long _nrand48(_rand_buf buf);
static void _srand48(long seed);
static INTVAL COMPARE(PARROT_INTERP,
    ARGIN(void *a),
    ARGIN(void *b),
    ARGIN(PMC *cmp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void next_rand(_rand_buf X);
static void process_cycle_without_exit(
    int node_index,
    ARGIN(const parrot_prm_context *c))
        __attribute__nonnull__(2);

static void rec_climb_back_and_mark(
    int node_index,
    ARGIN(const parrot_prm_context *c))
        __attribute__nonnull__(2);

#define ASSERT_ARGS__drand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__erand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__jrand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__lrand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__mrand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__nrand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS__srand48 __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_COMPARE __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b) \
    , PARROT_ASSERT_ARG(cmp))
#define ASSERT_ARGS_next_rand __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_process_cycle_without_exit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_rec_climb_back_and_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(c))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define move_reg(from, dest, c) (c)->mov((c)->interp, (unsigned char)(dest), \
                                         (unsigned char)(from), (c)->info)

/*

=item C<INTVAL intval_mod(INTVAL i2, INTVAL i3)>

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

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
INTVAL
intval_mod(INTVAL i2, INTVAL i3)
{
    ASSERT_ARGS(intval_mod)
    INTVAL z = i3;

    if (z == 0)
        return i2;
    else {
        INTVAL r;
        INTVAL y;
        int s = 0;

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
                default:           break;
            }
        }

        return r;
    }
}

/*

=item C<FLOATVAL floatval_mod(FLOATVAL n2, FLOATVAL n3)>

Returns C<n2 mod n3>.

Includes a workaround for buggy code generation in the C<lcc> compiler.

=cut

*/

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
FLOATVAL
floatval_mod(FLOATVAL n2, FLOATVAL n3)
{
    ASSERT_ARGS(floatval_mod)
#ifdef __LCC__

    /* Another workaround for buggy code generation in the lcc compiler-
     * adding a temporary variable makes it pass the test.
     */
    const FLOATVAL temp = n3 * floor(n2 / n3);

    return !FLOAT_IS_ZERO(n3)
      ? (n2 - temp)
      : n2;
#else
    return !FLOAT_IS_ZERO(n3)
      ? (n2 - n3 * floor(n2 / n3))
      : n2;
#endif
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

=item C<static void next_rand(_rand_buf X)>

Returns the next random number in C<X>.

=cut

*/

static void
next_rand(_rand_buf X)
{
    ASSERT_ARGS(next_rand)
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

=item C<static FLOATVAL _erand48(_rand_buf buf)>

Returns a C<double> in the interval C<[0.0, 1.0)>.

=cut

*/

static FLOATVAL
_erand48(_rand_buf buf)
{
    ASSERT_ARGS(_erand48)
    FLOATVAL r;
    next_rand(buf);
    r = ((buf[0] / 65536.0 + buf[1]) / 65536.0 + buf[2]) / 65536.0;
    return r;
}

/*

=item C<static FLOATVAL _drand48(void)>

Returns a C<double> in the interval C<[0.0, 1.0)>.

=cut

*/

static FLOATVAL
_drand48(void)
{
    ASSERT_ARGS(_drand48)
    return _erand48(last_rand);
}

/*

=item C<static long _jrand48(_rand_buf buf)>

Returns a C<long> in the interval C<[-2^31, 2^31)>.

=cut

*/

static long
_jrand48(_rand_buf buf)
{
    ASSERT_ARGS(_jrand48)
    long ret;
    next_rand(buf);
    ret = buf[2] << 16 | buf[1];
    return ret;
}

/*

=item C<static long _nrand48(_rand_buf buf)>

Returns a C<long> in the interval C<[0, 2^31)>.

=cut

*/

static long
_nrand48(_rand_buf buf)
{
    ASSERT_ARGS(_nrand48)
    return _jrand48(buf) & 0x7fffffff;
}

/*

=item C<static long _lrand48(void)>

Returns a C<long> in the interval C<[0, 2^31)>.

=cut

*/

static long
_lrand48(void)
{
    ASSERT_ARGS(_lrand48)
    return _nrand48(last_rand);
}

/*

=item C<static long _mrand48(void)>

Returns a C<long> in the interval C<[-2^31, 2^31)>.

=cut

*/

static long
_mrand48(void)
{
    ASSERT_ARGS(_mrand48)
    return _jrand48(last_rand);
}

/*

=item C<static void _srand48(long seed)>

Sets the high order 32 bits to the argument C<seed>. The low order 16
bits are set to the arbitrary value 0x330e.

=cut

*/

static void
_srand48(long seed)
{
    ASSERT_ARGS(_srand48)
    last_rand[0] = SEED_LO;
    last_rand[1] = (unsigned short)(seed & 0xffff);
    last_rand[2] = (unsigned short)((seed >> 16) & 0xffff);
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

=item C<FLOATVAL Parrot_float_rand(INTVAL how_random)>

Returns a C<FLOATVAL> uniformly distributed in the in the interval
C<[0.0, 1.0]>.

C<how_random> is currently ignored.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
FLOATVAL
Parrot_float_rand(INTVAL how_random)
{
    ASSERT_ARGS(Parrot_float_rand)
    UNUSED(how_random);

    return _drand48();          /* [0.0..1.0] */
}

/*

=item C<INTVAL Parrot_uint_rand(INTVAL how_random)>

Returns an C<INTVAL> uniformly distributed in the interval C<[0, 2^31)>.

C<how_random> is ignored.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_uint_rand(INTVAL how_random)
{
    ASSERT_ARGS(Parrot_uint_rand)
    UNUSED(how_random);

    return _lrand48();          /* [0..2^31] */
}

/*

=item C<INTVAL Parrot_int_rand(INTVAL how_random)>

Returns an C<INTVAL> in the interval C<[-2^31, 2^31)>.

C<how_random> is ignored.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_int_rand(INTVAL how_random)
{
    ASSERT_ARGS(Parrot_int_rand)
    UNUSED(how_random);

    return _mrand48();          /* [-2^31..2^31] */
}

/*

=item C<INTVAL Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)>

Returns an C<INTVAL> in the range C<[from, to]>.

C<how_random> is ignored.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_range_rand(INTVAL from, INTVAL to, INTVAL how_random)
{
    ASSERT_ARGS(Parrot_range_rand)
    const double spread = (double)(to - from + 1);
    const double randpart = Parrot_float_rand(how_random);
    const INTVAL raw = from + (INTVAL)(spread * randpart);

    return raw;
}

/*

=item C<void Parrot_srand(INTVAL seed)>

Seeds the random number generator with C<seed>.

=cut

*/

PARROT_EXPORT
void
Parrot_srand(INTVAL seed)
{
    ASSERT_ARGS(Parrot_srand)
    _srand48(seed);
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

=item C<PMC* Parrot_tm_to_array(PARROT_INTERP, const struct tm *tm)>

Helper to convert a B<struct tm *> to an Array

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_tm_to_array(PARROT_INTERP, ARGIN(const struct tm *tm))
{
    ASSERT_ARGS(Parrot_tm_to_array)

    PMC * const Array = Parrot_pmc_new(interp,
        Parrot_get_ctx_HLL_type(interp, enum_class_FixedIntegerArray));
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

/*

=item C<INTVAL Parrot_byte_index(PARROT_INTERP, const STRING *base, const STRING
*search, UINTVAL start_offset)>

Looks for the location of a substring within a longer string.  Takes
pointers to the strings and the offset within the string at which
to start searching as arguments.

Returns an offset value if it is found, or -1 if no match.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_byte_index(SHIM_INTERP, ARGIN(const STRING *base),
        ARGIN(const STRING *search), UINTVAL start_offset)
{
    ASSERT_ARGS(Parrot_byte_index)
    const char * const str_start  = base->strstart;
    const INTVAL       str_len    = base->strlen;
    const char * const search_str = search->strstart;
    const INTVAL       search_len = search->strlen;
    const char        *str_pos    = str_start + start_offset;
    INTVAL             len_remain = str_len   - start_offset;
    const char        *search_pos;

    /* find the next position of the first character in the search string
     * Parrot strings can have NULLs, so strchr() won't work here */
    while ((search_pos = (const char *)memchr(str_pos, *search_str, len_remain))) {
        const INTVAL offset = search_pos - str_start;

        /* now look for the entire string */
        if (memcmp(search_pos, search_str, search_len) == 0)
            return offset;

        /* otherwise loop and memchr() with the rest of the string */
        len_remain = str_len    - offset;
        str_pos    = search_pos + 1;

        if (len_remain < search_len)
            return -1;
    }

    return -1;
}

/*

=item C<INTVAL Parrot_byte_rindex(PARROT_INTERP, const STRING *base, const
STRING *search, UINTVAL start_offset)>

Substring search (like Parrot_byte_index), but works backwards,
from the rightmost end of the string.

Returns offset value or -1 (if no match).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_byte_rindex(SHIM_INTERP, ARGIN(const STRING *base),
        ARGIN(const STRING *search), UINTVAL start_offset)
{
    ASSERT_ARGS(Parrot_byte_rindex)
    const INTVAL searchlen          = search->strlen;
    const char * const search_start = (const char *)(search->strstart);
    UINTVAL max_possible_offset     = (base->strlen - search->strlen);
    INTVAL current_offset;

    if (start_offset && start_offset < max_possible_offset)
        max_possible_offset = start_offset;

    for (current_offset = max_possible_offset; current_offset >= 0;
            current_offset--) {
        const char * const base_start = (char *)(base->strstart) + current_offset;
        if (memcmp(base_start, search_start, searchlen) == 0) {
            return current_offset;
        }
    }

    return -1;
}

/*

=item C<static void rec_climb_back_and_mark(int node_index, const
parrot_prm_context *c)>

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

=cut

*/

static void
rec_climb_back_and_mark(int node_index, ARGIN(const parrot_prm_context *c))
{
    ASSERT_ARGS(rec_climb_back_and_mark)
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

=item C<static void process_cycle_without_exit(int node_index, const
parrot_prm_context *c)>

Recursive function, used by Parrot_register_move to handle the case
of cycles without exits, that are cycles of move ops between registers
where each register has exactly one predecessor and one successor

For instance: 1-->2, 2-->3, 3-->1

  node_index  ... the index of a destination (i.e. with a pred.) register
  c           ... the graph and all the needed params : the context

=cut

*/

static void
process_cycle_without_exit(int node_index, ARGIN(const parrot_prm_context *c))
{
    ASSERT_ARGS(process_cycle_without_exit)
    const int pred = c->src_regs[node_index];

    /* let's try the alternate move function*/
    const int alt =
        c->mov_alt
            ? c->mov_alt(c->interp, c->dest_regs[node_index], pred, c->info)
            : 0;

    if (0 == alt) { /* use temp reg */
        move_reg(c->dest_regs[node_index], c->temp_reg, c);
        c->backup[node_index] = c->temp_reg;
    }
    else
        c->backup[node_index] = c->dest_regs[node_index];

    rec_climb_back_and_mark(node_index, c);
}

/*

=item C<void Parrot_register_move(PARROT_INTERP, int n_regs, unsigned char
*dest_regs, unsigned char *src_regs, unsigned char temp_reg, reg_move_func mov,
reg_move_func mov_alt, void *info)>

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

=cut

*/

PARROT_EXPORT
void
Parrot_register_move(PARROT_INTERP,
        int n_regs,
        ARGOUT(unsigned char *dest_regs),
        ARGIN(unsigned char *src_regs),
        unsigned char temp_reg,
        reg_move_func mov,
        reg_move_func mov_alt,
        ARGIN(void *info))
{
    ASSERT_ARGS(Parrot_register_move)
    int i;
    int max_reg       = 0;
    int* nb_succ      = NULL;
    int* backup       = NULL;
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
    for (i = 0; i < n_regs; ++i) {
        if (src_regs[i] > max_reg)
            max_reg = src_regs[i];
        if (dest_regs[i] > max_reg)
            max_reg = dest_regs[i];
    }
    ++max_reg;


    /* allocate space for data structures */
    /* NOTA: data structures could be kept allocated somewhere waiting to get reused...*/
    c.nb_succ      = nb_succ      = mem_gc_allocate_n_zeroed_typed(interp, n_regs, int);
    c.backup       = backup       = mem_gc_allocate_n_zeroed_typed(interp, n_regs, int);
    c.reg_to_index = reg_to_index = mem_gc_allocate_n_zeroed_typed(interp, max_reg, int);

    /* init backup array */
    for (i = 0; i < n_regs; ++i)
        backup[i] = -1;

    /* fill in the conversion array between a register number and its index */
    for (i = 0; i < max_reg; ++i)
        reg_to_index[i] = -1;
    for (i = 0; i < n_regs; ++i) {
        const int index = dest_regs[i];
        if (index != src_regs[i]) /* get rid of self-assignment */
            reg_to_index[index] = i;
    }

    /* count the nb of successors for each reg index */
    for (i = 0; i < n_regs; ++i) {
        const int index = reg_to_index[ src_regs[i] ];
        if (index >= 0) /* not interested in the wells that have no preds */
            ++nb_succ[index];
    }
    /* process each well if any */
    for (i = 0; i < n_regs; ++i) {
        if (0 == nb_succ[i]) { /* a well */
            rec_climb_back_and_mark(i, &c);
        }
    }

    /* process remaining dest registers not processed */
    /* remaining nodes are members of cycles without exits */
    for (i = 0; i < n_regs; ++i) {
        if (0 < nb_succ[i] && 0 > backup[i]) { /* not a well nor visited*/
            process_cycle_without_exit(i, &c);
        }
    }

    mem_gc_free(interp, nb_succ);
    mem_gc_free(interp, reg_to_index);
    mem_gc_free(interp, backup);
}

typedef INTVAL (*sort_func_t)(PARROT_INTERP, void *, void *);

/*

=item C<static INTVAL COMPARE(PARROT_INTERP, void *a, void *b, PMC *cmp)>

General PMC comparison function. Takes two PMCs. Returns 0 if they are equal,
returns 1 if C<a> is bigger, and returns -1 if C<b> is bigger.

=cut

*/

/* TODO: Macroize COMPARE */
/* This is an awfully expensive function to call, what with all the */
/* comparisons that never change. We ought to precompute everything. */
/* XXX We should be able to guarantee that *a and *b never change via const parameters. */
static INTVAL
COMPARE(PARROT_INTERP, ARGIN(void *a), ARGIN(void *b), ARGIN(PMC *cmp))
{
    ASSERT_ARGS(COMPARE)
    INTVAL result = 0;
    if (PMC_IS_NULL(cmp))
        return VTABLE_cmp(interp, (PMC *)a, (PMC *)b);

    if (cmp->vtable->base_type == enum_class_NCI) {
        const sort_func_t f = (sort_func_t)D2FPTR(PARROT_NCI(cmp)->func);
        return f(interp, a, b);
    }

    Parrot_pcc_invoke_sub_from_c_args(interp, cmp, "PP->I", a, b, &result);
    return result;
}

/*

=item C<void Parrot_quicksort(PARROT_INTERP, void **data, UINTVAL n, PMC *cmp)>

Perform a quicksort on a PMC array.

=cut

*/

void
Parrot_quicksort(PARROT_INTERP, ARGMOD(void **data), UINTVAL n, ARGIN(PMC *cmp))
{
    ASSERT_ARGS(Parrot_quicksort)
    while (n > 1) {
        UINTVAL i, j, ln, rn;
        void *temp;

        /* Swap */
        temp      = data[0];
        data[0]   = data[n/2];
        data[n/2] = temp;

        for (i = 0, j = n; ;) {
            do
                --j;
            while (j > 0 && COMPARE(interp, data[j], data[0], cmp) > 0);

            do
                ++i;
            while (i < j && COMPARE(interp, data[i], data[0], cmp) < 0);

            if (i >= j)
                break;

            /* Swap */
            temp    = data[i];
            data[i] = data[j];
            data[j] = temp;
        }

        /* Swap */
        temp    = data[j];
        data[j] = data[0];
        data[0] = temp;

        ln = j;
        rn = n - ++j;

        if (ln < rn) {
            Parrot_quicksort(interp, data, ln, cmp);
            data += j;
            n = rn;
        }
        else {
            Parrot_quicksort(interp, data + j, rn, cmp);
            n = ln;
        }
    }
}

/*

=back

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
