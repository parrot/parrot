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
  BN_NIB* buffer;  /* string of nibbles */
  UINTVAL nibs;      /* nibs allocated */
  INTVAL digits;    /* digits used */
  int sign;         /* sign of number, 0=> positive or zero, 1 => negative */
  INTVAL expn;      /* exponent of number */
} BIGNUM;

/* CONTEXT: defines the context for the operation, precision and rounding */

typedef enum {
  ROUND_HALF_UP,
  ROUND_DOWN,
  ROUND_HALF_EVEN
} BN_ROUNDING;

typedef struct {
  INTVAL precision;     /* number of digits to retain (-ve for none)*/
  BN_ROUNDING rounding; /* rounding type to perform */
  int lost_digits;      /* 0 => round, 1 => raise exception */
} BN_CONTEXT;

/* Exceptional Conditions */

typedef enum {
  BN_CONVERSION_OVERFLOW = 1<<0,
  /* Asked to hold coeff|expn too large value */
  BN_CONVERSION_SYNTAX = 1<<1,
  /* string not conforming to numeric form */
  BN_CONVERSION_UNDERFLOW = 1<<2,
  /* expn of string too small to be held  */
  BN_DIVISION_BY_ZERO = 1<<3,
  /* dividend of div/div-int or pow zero  */
  BN_DIVISION_IMPOSSIBLE = 1<<4,
  /* integer result of div-int or rem > precision */
  BN_DIVISION_UNDEFINED = 1<<5,
  /* div by zero with zero on top also */
  BN_INSUFFICIENT_STORAGE = 1<<6,
  /* not enough space to hold intermediate results */
  BN_INVALID_CONTEXT = 1<<7,
  /* context given was not valid (unknown round) */
  BN_INVALID_OPERATION = 1<<8,
  /* operation which is not valid */
  BN_LOST_DIGITS = 1<<9,
  /* digits lost in rounding  */
  BN_OVERFLOW = 1<<10,
  /* expn becomes larger than max allowed */
  BN_UNDERFLOW = 1<<11
  /* expn becomes smaller than min allowed */
} BN_EXCEPTIONS;

/*Capn' Cut-n-paste functions */
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
int BN_round (PINTD_ BIGNUM *victim, BN_CONTEXT* context);
void BN_round_as_integer(PINTD_ BIGNUM*, BN_CONTEXT*);
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
