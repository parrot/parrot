/* bignum.h -- Infinite precision bcd for parrot -- Alex Gough, 2002 */

/* $Id$ */

/* Some of this file will want to be moved to the parrot include
   directories, but some should stay here, for the sake of being easily
   removed for back-porting */

/* Stuff to be parrot-like in source, even if not being used in parrot */
#ifdef PARROT_IN_CORE
#define PINT_ interpreter, 
#define PINTD_ INTERP* interpreter,
#define BN_alloc(i, x) malloc(x)
#define BN_realloc(i, x, y) realloc(x, y)
#define BN_free(i, x) free(x)
#define BN_FATAL(i, x) bn_fatal_error(x)
#define BN_EXCEPT(i, excp, mesg) BN_exception(i, excp, mesg)
#else /* Not in parrot core */
typedef long INTVAL;
typedef unsigned long UINTVAL;
typedef double FLOATVAL;
typedef char BOOLVAL;
#define PINTD_
#define PINT_
#define BN_alloc(x) malloc(x)
#define BN_realloc(x, y) realloc(x, y)
#define BN_free(x) free(x)
#define BN_FATAL(x) bn_fatal_error(x)
#define BN_EXCEPT(excp, mesg) BN_exception(excp, mesg)
#endif /* ifdef PARROT_IN_CORE else */

/* Stuff configure should determine*/
#define BN_D_PER_NIB 8       /* digits stored in a BN_NIB */
#define BN_D_PER_INT 10      /* Decimal digits in an INTVAL */
#define BN_D_PER_FLOAT 32    /* Decimal digits in a FLOATVAL */
#define BN_EXPN_MAX 10000    /* maximum value of expn*/
#define BN_EXPN_MIN -10000   /* minimum value of expn */
#define BN_MAX_DIGITS 10000  /* max number of digits in coeff */

typedef UINTVAL BN_NIB;

/* BIGNUM: 12345678901234xxxxxxxxxx , expn = -5, sign = 1
           ^       ^        ^      
 value = -123456789.01234

 buffer points to first caret (here an INTVAL)
 nibs == 3, digits == 14
*/

typedef struct {
    BN_NIB* buffer; /* string of nibbles */
    UINTVAL nibs;   /* nibs allocated, in sizeof(BN_NIB) */
    UINTVAL flags;  /* private flags store: 001 Inf,  010 qNAN, 110 sNAN */
    INTVAL digits;  /* digits used */
    int sign;       /* sign of number, 0=> positive or zero, 1 => negative */
    INTVAL expn;    /* exponent of number */
} parrot_bignum_t;

#define BIGNUM parrot_bignum_t

/* CONTEXT: defines the context for the operation, precision and rounding */

typedef enum {
  ROUND_HALF_UP,
  ROUND_DOWN,
  ROUND_HALF_EVEN
} BN_ROUNDING;

/* Flags for exception triggers and exception signals */
typedef enum {
    BN_F_LOST_DIGITS = 1,
    BN_F_DIVISION_BY_ZERO = 2,
    BN_F_INEXACT = 4,
    BN_F_INVALID_OPERATION = 8,
    BN_F_OVERFLOW = 16,
    BN_F_ROUNDED = 32,
    BN_F_UNDERFLOW = 64
} parrot_bignum_context_flags;

typedef struct {
    INTVAL precision;     /* number of digs to retain */
    BN_ROUNDING rounding; /* rounding type to perform */
    BOOLVAL extended;     /* do we use extended or base semantics? */
    unsigned char flags;       /* records possible errors */
    unsigned char traps;       /* throw errors or not? */
} parrot_bignum_context;

#define BN_CONTEXT parrot_bignum_context

/* Exceptional Conditions */

typedef enum {
    BN_CONVERSION_OVERFLOW,
    /* Asked to hold coeff|expn too large value */
    BN_CONVERSION_SYNTAX,
    /* string not conforming to numeric form */
    BN_CONVERSION_UNDERFLOW,
    /* expn of string too small to be held  */
    BN_DIVISION_BY_ZERO,
    /* dividend of div/div-int or pow zero  */
    BN_DIVISION_IMPOSSIBLE,
    /* integer result of div-int or rem > precision */
    BN_DIVISION_UNDEFINED,
    /* div by zero with zero on top also */
    BN_INEXACT,
    /* some sort of rounding, with loss of information */
    BN_INSUFFICIENT_STORAGE,
    /* not enough space to hold intermediate results */
    BN_INVALID_CONTEXT,
    /* context given was not valid (unknown round) */
    BN_INVALID_OPERATION,
    /* operation which is not valid */
    BN_LOST_DIGITS,
    /* digits lost in rounding  */
    BN_OVERFLOW,
    /* expn becomes larger than max allowed */
    BN_ROUNDED,
    /* something was rounded */
    BN_UNDERFLOW
    /* expn becomes smaller than min allowed */
} BN_EXCEPTIONS;

/* Flags for extended values (private flags of buffer struct) */
typedef enum {
    BN_INF_FLAG  = 1, /* 001 */
    BN_qNAN_FLAG = 2, /* 010 (quiet)     */
    BN_sNAN_FLAG = 4  /* 100 (signaling) */
} parrot_bignum_extended_flags;

/*Capn' Cut-n-paste functions */
BIGNUM* BN_from_string(PINTD_ char*, BN_CONTEXT*);
BIGNUM* BN_new(PINTD_ INTVAL length);
void BN_grow(PINTD_ BIGNUM *in, INTVAL length);
void BN_destroy(PINTD_ BIGNUM *bn);
void bn_fatal_error (PINTD_ char* mesg);
INTVAL BN_set_digit(PINTD_ BIGNUM* bn, INTVAL pos, INTVAL value);
INTVAL BN_get_digit(PINTD_ BIGNUM* bn, INTVAL pos);
BIGNUM* BN_copy(PINTD_ BIGNUM*, BIGNUM*);
BIGNUM* BN_new_from_int(PINTD_ INTVAL value);
INTVAL BN_to_scientific_string(PINTD_ BIGNUM* bn, char **dest);
INTVAL BN_to_engineering_string(PINTD_ BIGNUM*bn, char **dest);
int BN_round (PINTD_ BIGNUM *victim, BN_CONTEXT *context);
void BN_round_as_integer(PINTD_ BIGNUM *, BN_CONTEXT* );
void BN_EXCEPT(PINTD_ BN_EXCEPTIONS, char*);
void BN_add(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void
BN_subtract(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void BN_plus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context);
void BN_minus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context);
void 
BN_compare (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void 
BN_multiply (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void 
BN_divide (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void
BN_divide_integer (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void
BN_remainder (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void BN_rescale(PINTD_ BIGNUM* result, BIGNUM* bignum, BIGNUM* expn, BN_CONTEXT* context);
INTVAL BN_to_int(PINTD_ BIGNUM* bignum, BN_CONTEXT* context);
void BN_power(PINTD_ BIGNUM* result, BIGNUM* bignum,
              BIGNUM* expn, BN_CONTEXT* context);
INTVAL BN_comp (PINTD_ BIGNUM *one, BIGNUM *two, BN_CONTEXT*);
INTVAL BN_is_zero(PINTD_ BIGNUM* test, BN_CONTEXT *);
void BN_set_qNAN(PINTD_ BIGNUM* bn);
void BN_set_sNAN(PINTD_ BIGNUM* bn);
void BN_really_zero(PINTD_ BIGNUM* bn, int);
/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
