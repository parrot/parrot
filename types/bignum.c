/*
  $Id$

  bignum.c -- A decimal arithmetic library for Perl and Parrot

  This code is intended for inclusion in the parrot project, and also
  for backporting into Perl5 (as a CPAN module).  Any patches to this
  code will likely find their way back to the Mother Ship, as it were.

  There is a good deal of scope for improving the speed of this code,
  modifications are encouraged as long as the extended regression tests
  continue to pass.
  Alex Gough, 2002

  Copyright (c) 2001-2003 Yet Another Society.  All rights reserved.

*/

/*
  It was a very inconvenient habit of kittens (Alice had once made the
  remark) that, whatever you say to them, they always purr.  "If they
  would only purr for `yes,' and mew for `no,' or any rule of that
  sort," she had said, "so that one could keep up a conversation!  But
  how can you talk with a person if they always say the same thing?"

  On this occasion the kitten only purred: and it was impossible to
  guess whether it meant `yes' or `no'.
*/

#include <stdio.h>
#include "bignum.h"
#include <assert.h>
#include <string.h> /* XXX:ajg fixme later*/

/*

=head1 When in parrot

When the library is used within parrot, all calls expect an additional
first argument of an interpreter, for the purposes of memory allocation,
some internal macros do not (getd/setd and CHECK(O|U)FLOW.

If you're being useful and inserting proper rapid fillins, start
with the BN_i* methods, but make sure any errors can still be
thrown.

=head2 TODO

Parrot string playing, exception raising

=cut

*/

/* * This lot wants to go in a (bignum specific seperate header file * */

/* Access digits, macros assume length given */
/*

=for api bignum_private BN_setd(BIGNUM*, pos, value)

Set digit at pos (zero is lsd) to value.  [macro]

=for api bignum_private int BN_getd(BIGNUM*, pos)

Get value of digit at pos. [macro]

=cut

*/
#define BN_setd(x, y, z) \
    ( x->buffer[(y) / BN_D_PER_NIB] = \
     ((z) << ( (y) % BN_D_PER_NIB)*4) | \
     (x->buffer[(y) / BN_D_PER_NIB] & ~(15<< ( (y) % BN_D_PER_NIB)*4))) 
#define BN_getd(x,y) \
    ( (x->buffer[(y) / BN_D_PER_NIB] >> \
     ( (y) % BN_D_PER_NIB)*4) & 15 )

/*

=for api bignum_private CHECK_OVERFLOW(bn, incr, context)

If increasing the exponent of I<bn> by I<incr> will cause overflow
(as decided by I<elimit>), returns true.

=cut

*/

#define CHECK_OVERFLOW(bn, incr, context) \
    ( (context)->elimit - ((bn)->expn + (bn)->digits -1 ) < (incr) ? 1 : 0) 

/*

=for api bignum_private CHECK_UNDERFLOW(bn, decrement, context)

If subtracting I<decrement> (a positive number) from the exponent
of I<bn> would cause underflow, returns true.

=cut

*/

#define CHECK_UNDERFLOW(bn, decr, context) \
    ( (context)->elimit + ((bn)->expn + (bn)->digits -1) > (decr) ? 0 : 1 )

/********** Special Values ******************/

/*

=for api bignum_private am_INF(bn)

True if bn is +Infinity or -Infinity. [macro]

=cut

*/

#define am_INF(bn)  ((bn)->flags & BN_INF_FLAG   )
/*

=for api bignum_private am_NAN(bn)

True if bn is either a quiet or signalling NaN. [macro]

=cut

*/

#define am_NAN(bn)  ((bn)->flags & (BN_sNAN_FLAG | BN_qNAN_FLAG)   )
/*

=for api bignum_private am_sNAN(bn)

True if bn is a signalling NaN. [macro]

=cut

*/

#define am_sNAN(bn) ((bn)->flags & BN_sNAN_FLAG  )
/*

=for api bignum_private am_qNAN(bn)

True if bn is a quiet NaN. [macro]

=cut

*/

#define am_qNAN(bn) ( (bn)->flags & BN_qNAN_FLAG  )

/* For the sake of debugging */
char* BN_lazydbprint(BIGNUM* foo) {
    char*s;
    BN_to_scientific_string(foo, &s);
    return s;
}

/* Internal functions + types */
typedef enum {   /* Indicate to idivide when to stop */
    BN_DIV_DIVIDE,
    BN_DIV_DIVINT,
    BN_DIV_REMAIN
} BN_DIV_ENUM;

typedef struct { /* Used to restore INTENT(IN) arguments to functions */
    BIGNUM one;
    BIGNUM two;
} BN_SAVE_PREC;

int
BN_imultiply (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
              BN_CONTEXT *context);
int
BN_idivide (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
            BN_CONTEXT *context,
            BN_DIV_ENUM operation, BIGNUM* rem);
int BN_iround (PINTD_ BIGNUM *bn, BN_CONTEXT* context);
INTVAL BN_to_scieng_string(PINTD_ BIGNUM* bn, char **dest, int eng);
int BN_strip_lead_zeros(PINTD_ BIGNUM* victim, BN_CONTEXT*);
int BN_strip_tail_zeros(PINTD_ BIGNUM* victim, BN_CONTEXT*);
int BN_round_up(PINTD_ BIGNUM *victim, BN_CONTEXT* context);
int BN_round_down(PINTD_ BIGNUM *victim, BN_CONTEXT* context);
int BN_make_integer(PINTD_ BIGNUM* bn, BN_CONTEXT* context);
int
BN_arith_setup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore);
int
BN_arith_cleanup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore);
int BN_iadd(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
int BN_isubtract(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
int BN_align(PINTD_ BIGNUM* one, BIGNUM* two);
INTVAL
BN_nonfatal(PINTD_ BN_CONTEXT *context, BN_EXCEPTIONS except, char *msg);
int
BN_set_verybig(PINTD_ BIGNUM* bn, BN_CONTEXT *context);

/* Creation and memory management */

/*

=for api bignum BIGNUM* BN_new(INTVAL length)

Create a new BN.  length is number of I<decimal> digits required.
The bignumber will be equal to zero.

=cut

*/

BIGNUM*
BN_new(PINTD_ INTVAL length) {
    BIGNUM* bn;
    bn = (BIGNUM*)BN_alloc(PINT_ sizeof(BIGNUM));
    if (NULL == bn) {
        BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot allocate new BigNum");
    }
    bn->nibs = 1 + length / BN_D_PER_NIB;
    bn->buffer = (BN_NIB*)BN_alloc(PINT_ sizeof(BN_NIB) * bn->nibs);
    if (NULL == bn->buffer) {
        BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot allocate new BigNum");
    }
    bn->sign = 0;
    bn->expn = 0;
    bn->digits = 1;
    bn->flags = 0;

    return bn;
}

/*

=for api bignum_private BN_grow(BIGNUM *bn, INTVAL length)

Grows bn so that it can contain length I<decimal> digits, does not
modify the value of the bignumber.

=cut

*/

void
BN_grow(PINTD_ BIGNUM *in, INTVAL length) {
    assert(in != NULL);
    if (length <= in->nibs * BN_D_PER_NIB) {
        return;
    }
    if (length > BN_MAX_DIGITS) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "Attempt to grow BIGNUM beyond limits");
    }
    in->nibs = 1+ length / BN_D_PER_NIB;
    in->buffer = (BN_NIB*)BN_realloc(PINT_ in->buffer,
                                     sizeof(BN_NIB)* (in->nibs) );
    if (NULL==in->buffer) {
        BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot grow BIGNUM");
    }
    return;
}

/*

=for api bignum BN_destroy(BIGNUM *bn)

Frees all the memory used by the BIGNUM.

=cut

*/

void
BN_destroy(PINTD_ BIGNUM *bn) {
    assert(bn!=NULL);

    BN_free(PINT_ bn->buffer);
    BN_free(PINT_ bn);
    return;
}

/*

=for api bignum BN_create_context(precision)

Creates a new context object, with specified I<precision>, other fields
are initialised as follows:

 elimit   = BN_HARD_EXPN_LIMIT ( defined during configure)
 rounding = ROUND_HALF_UP
 extended = 1
 flags    = 0
 traps    = Division by zero, invalid operation, overflow, underflow
            and rounded are enabled.
            Lost digits and inexact are disabled.

The context object can be destroyed with free().

=cut

*/

BN_CONTEXT*
BN_create_context(PINTD_ INTVAL precision) {
    BN_CONTEXT *result;

    result = (BN_CONTEXT*)BN_alloc(PINT_ sizeof(BN_CONTEXT));
    if (result == NULL) {
        BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE,
                  "Cannot create a context");
    }

    result->precision = precision;

    result->elimit = BN_HARD_EXPN_LIMIT;
    result->rounding = ROUND_HALF_UP;
    result->extended = 1;
    result->flags = 0;
    result->traps = ( BN_F_DIVISION_BY_ZERO  |
                      BN_F_INVALID_OPERATION |
                      BN_F_OVERFLOW          |
                      BN_F_ROUNDED           |
                      BN_F_UNDERFLOW           );
    return result;
}

/*

=for api bignum BN_set_digit(BIGNUM* bn, INTVAL pos, INTVAL value)

Sets digit at I<pos> (zero based) to I<value>.  Number is grown if
digits > allocated space are accessed, but intermediate digits will
have undefined values.  If I<pos> is beyond I<digits> then I<digits>
is also updated.

=cut

*/

INTVAL
BN_set_digit(PINT_ BIGNUM* bn, INTVAL pos, INTVAL value) {
    assert(bn != NULL);
    if (pos > bn->nibs * BN_D_PER_NIB) {
        BN_grow(bn, pos);
    }
    assert(value < 10);
    assert(value > -1);
    BN_setd(bn, pos, value);
    if (bn->digits < pos+1) {
        bn->digits = pos+1;
    }
    return value;
}

/*

=for api bignum INTVAL BN_get_digit(BIGNUM* bn, INTVAL pos)

Get the value of the decimal digit at pos, returns -1 if pos is out of
bounds.

=cut

*/

INTVAL
BN_get_digit(PINTD_ BIGNUM* bn, INTVAL pos) {
    assert(bn != NULL);
    if (pos > bn->digits || pos < 0) return -1;
    return BN_getd(bn, pos);
}

/*

=for api bignum BN_set_(inf|qNAN|sNAN)(bignum)

Sets its argument to appropriate value.

Infinity is represented as having zero digits, an undefined exponent
and private I<flags> set to BN_inf_FLAGS.

sNAN is represented as having zero digits, an undefined exponent, an
undefined sign and both qNAN and sNAN bits set.

qNAN is represented as having zero digits, an undefined exponent
and only the qNAN bit set.

=cut

*/

int BN_set_inf(PINTD_ BIGNUM* bn) {
    assert(bn != NULL);
    bn->digits = 0;
    bn->flags = (bn->flags & (~(UINTVAL)255)) | BN_INF_FLAG;
    return;
}

int BN_set_qNAN(PINTD_ BIGNUM* bn) {
    assert(bn != NULL);
    bn->digits = 0;
    bn->flags = (bn->flags & (~(UINTVAL)255)) | BN_qNAN_FLAG;
    return;
}

int BN_set_sNAN(PINTD_ BIGNUM* bn) {
    assert(bn != NULL);
    bn->digits = 0;
    bn->flags = (bn->flags & (~(UINTVAL)255)) | BN_qNAN_FLAG | BN_sNAN_FLAG;
    return;
}

/*

=for api bignum_private BN_set_verybig(bn, context)

Used when an operation has overflowed, sets bn according to I<rounding>
and the sign of I<bn>:

 ROUND_HALF_UP, ROUND_HALF_EVEN => sign Infinity
 ROUND_DOWN => sign, largest finite number in given precision (or Inf, if
                 infinite precision is specified)
 ROUND_CEILING => same as round down, if sign is 1, +Inf otherwise
 ROUND_FLOOR => same as round down, if sign is 0, -Inf otherwise

=cut

*/

int
BN_set_verybig(PINTD_ BIGNUM* bn, BN_CONTEXT *context) {
    int massive = 0; /* 0 => inf, 1=> 99999999999 etc...*/
    switch (context->rounding) {
    case ROUND_HALF_UP :
    case ROUND_HALF_EVEN :
        break;
    case ROUND_FLOOR :
        if (!bn->sign) massive = 1;
        break;
    case ROUND_CEILING :
        if (bn->sign) massive = 1;
        break;
    case ROUND_DOWN :
        massive = 1;
        break;
    default :
        BN_EXCEPT(PINT_ BN_INVALID_OPERATION,
                  "Unknown rounding during overflow");
    }
    if (context->precision > 0 && massive) {
        INTVAL i;
        BN_grow(PINT_ bn, context->precision);
        for (i = 0; i< context->precision; i++) {
            BN_setd(bn, i, 9);
        }
        bn->digits = context->precision;
        bn->expn = context->elimit - context->precision + 1;
    }
    else {
        BN_set_inf(PINT_ bn);
    }
}


/*

=for api bignum BIGNUM *BN_copy(one, two)

Copies two into one, returning one for convenience.

=cut

*/

BIGNUM*
BN_copy(PINTD_ BIGNUM* one, BIGNUM* two) {
    assert(one != NULL); assert(two != NULL);

    BN_grow(PINT_ two, one->digits);
    memcpy((void*)one->buffer, (void*)two->buffer,
           (1+two->digits / BN_D_PER_NIB) * sizeof(BN_NIB));
    one->flags &= ~(UINTVAL)0xF;
    one->flags |= two->flags & 0xF;
    one->digits = two->digits;
    one->expn = two->expn;
    one->sign = two->sign;
    return one;
}

/*

=for api bignum BIGNUM* BN_new_from_int(INTVAL value)

Create a new bignum from a (signed) integer value (INTVAL)
We assume that the implementation limits are somewhat larger than
those required to store a single integer into a bignum.

=cut

*/

BIGNUM*
BN_new_from_int(PINTD_ INTVAL value) {
    BIGNUM *new;
    int i, current;
    new = BN_new(PINT_ BN_D_PER_INT);
    if (value < 0) {
        new->sign = 1;
        value = -value;
    }
    i = 0;
    while (value) {
        current = value % 10;
        BN_setd(new, i, current);
        value = value / 10;
        i++;
    }
    new->digits = i;
    new->expn = 0;
    return new;
}

/*

=for api bignum BN_PRINT_DEBUG(BIGNUM *bn, char *mesg)

Dump the bignum for testing, along with a little message.

=cut

*/

void
BN_PRINT_DEBUG (BIGNUM *bn, char* mesg) {
    INTVAL i;
    printf("%s: nibs %i digits %i sign %i expn %i \n",mesg,
           bn->nibs, bn->digits, bn->sign, bn->expn);
    if (bn->digits == 0) {
        printf("Special value, flags: %x", bn->flags & 127);
    }
    else {
        for (i=bn->digits-1; i>-1; i--) {
            printf("%d", BN_getd(bn, i));
            if (!(i%5)) printf(" ");
            if (!(i%70)) printf("\n");
        }
    }
    printf("\n");
}

/*

=for api bignum_private BN_nonfatal(context, exception, message)

When an exceptional condition occurs after which execution could
continue.  If context specifies that death occurs, then so be it.

=cut

*/

INTVAL
BN_nonfatal(PINTD_ BN_CONTEXT *context, BN_EXCEPTIONS except, char *msg) {
    /* See extended standard for details */
    switch (except) {
    case BN_CONVERSION_OVERFLOW :
        /* Asked to hold coeff|expn too large value */
        context->flags |= BN_F_OVERFLOW | BN_F_INEXACT | BN_F_ROUNDED;
        if (context->traps & (BN_F_OVERFLOW | BN_F_INEXACT | BN_F_ROUNDED) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_CONVERSION_SYNTAX:
        /* string not conforming to numeric form */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_CONVERSION_UNDERFLOW:
        /* expn of string too small to be held  */
        context->flags |= BN_F_UNDERFLOW;
        if (context->traps & (BN_F_UNDERFLOW) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_DIVISION_BY_ZERO:
        /* dividend of div/div-int or pow zero  */
        context->flags |= BN_F_DIVISION_BY_ZERO;
        if (context->traps & (BN_F_DIVISION_BY_ZERO) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break; 
    case BN_DIVISION_IMPOSSIBLE:
        /* integer result of div-int or rem > precision */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_DIVISION_UNDEFINED:
        /* div by zero with zero on top also */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_INEXACT:
        /* some sort of rounding: with loss of information */
        context->flags |= BN_F_INEXACT;
        if (context->traps & (BN_F_INEXACT) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_INSUFFICIENT_STORAGE:
        /* not enough space to hold intermediate results */
        /* Often this will be raised directly (ie. fatally) */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_INVALID_CONTEXT:
        /* context given was not valid (unknown round) */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_INVALID_OPERATION:
        /* operation which is not valid */
        context->flags |= BN_F_INVALID_OPERATION;
        if (context->traps & (BN_F_INVALID_OPERATION) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_LOST_DIGITS:
        /* digits lost in rounding  */
        context->flags |= BN_F_LOST_DIGITS;
        if (context->traps & (BN_F_LOST_DIGITS) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_OVERFLOW:
        /* expn becomes larger than max allowed */
        context->flags |= BN_F_OVERFLOW | BN_F_ROUNDED | BN_F_INEXACT;
        if (context->traps & (BN_F_OVERFLOW | BN_F_ROUNDED | BN_F_INEXACT) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_ROUNDED:
        /* something was rounded */
        context->flags |= BN_F_ROUNDED;
        if (context->traps & (BN_F_ROUNDED) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    case BN_UNDERFLOW:
        /* expn becomes smaller than min allowed */
        context->flags |= BN_F_UNDERFLOW | BN_F_ROUNDED | BN_F_INEXACT;
        if (context->traps &(BN_F_UNDERFLOW | BN_F_ROUNDED | BN_F_INEXACT) ) {
            BN_EXCEPT(PINT_ except, msg);
        }
        break;
    default:
        BN_EXCEPT(PINT_ BN_INVALID_OPERATION, "An unknown error occured");
    }
    
}

/*

=for api bignum_private void BN_exception(exception, char* message)

Throw `exception'.  Should be accessed via a BN_EXCEPT macro, this
version is provided until parrot exceptions are sorted out properly.

=cut

*/

void
BN_exception(PINTD_ BN_EXCEPTIONS exception, char* message) {
    printf("Exception %d %s\n", exception, message);
    exit(0);
}

/*

=for api bignum BN_to_scientific_string(BIGNUM* bn, char** dest)

Converts bn into a scientific representation, stored in dest.

=for api bignum BN_to_engineering_string(BIGNUM* bn, char* dest)

Converts bn into a engineering representation, stored in dest.

These functions return char* strings only, parrot may want to
reimplement these so that locales and the like are nicely coped with.

Any reimplementation should be in a seperate file, this section of
the main file can be #ifdef'd out if this is done.

Memory pointed to by dest is not freed by this function.

=cut

*/


INTVAL
BN_to_scientific_string(PINTD_ BIGNUM*bn, char **dest) {
    BN_to_scieng_string(PINT_ bn, dest, 0);
}
INTVAL
BN_to_engineering_string(PINTD_ BIGNUM*bn, char **dest) {
    BN_to_scieng_string(PINT_ bn, dest, 1);
}

/*

=for api bignum_private BN_to_scieng_string(bn, char**dest, int eng)

Does the heavy string handling work, I<eng> defines the conversion to
perform.

=cut

*/

INTVAL
BN_to_scieng_string(PINTD_ BIGNUM* bn, char **dest, int eng) {
    char* cur;
    INTVAL adj_exp = 0; /* as bn->expn is relative to 0th digit */
    INTVAL cur_dig = 0;
    assert(bn!=NULL);
    /* Special values have digits set to zero, so this should be enough */
    *dest = (char*)BN_alloc(PINT_ bn->digits + 5 + BN_D_PER_INT);
    if (dest == NULL) {
        BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE,
                  "Cannot create buffer to hold output string");
    }

    cur = *dest;

    /* Do we have a special value? */
    if (am_NAN(bn)) {
        if (am_qNAN(bn)) {
            strcpy(cur, "NaN");
        }
        else { /* must be signalling */
            strcpy(cur, "sNaN");
        }
        return 1;
    }

    if (am_INF(bn)) {
        if (bn->sign) *cur++ = '-';
        strcpy(cur, "Infinity");
        return 1;
    }

    /* Nope, nothing out of the ordinary, full steam ahead! */
    adj_exp = bn->digits + bn->expn -1;
    /* For values near to zero, we do not use exponential notation */
    if (bn->expn <= 0 && adj_exp >= -6) {
        if (bn->sign) {
            *cur++ = '-';
        }
        /*pad with zeros if appropriate, plonk a point where we want it */
        if (bn->digits + bn->expn <= 0) {
            int i;
            *cur++ = '0';
            if (bn->digits+bn->expn<0) *cur++ = '.';
            for (i=1; i <= -(bn->digits + bn->expn); i++) *cur++ = '0';
        }
        for (cur_dig = bn->digits-1; cur_dig >-1; cur_dig--) {
            if (1+cur_dig + bn->expn == 0) *cur++ ='.';
            *cur++ = '0' + BN_getd(bn, cur_dig);
        }
        *cur = 0;
    }
    else { /* Use exponential notation, different for sci and eng */
        if (bn->sign) *cur++ = '-'; /* We don't prefix '+' */
    
        if (eng) {
            int deficit;
            if (adj_exp < 0) {
                deficit = (-adj_exp) % 3;
                if (deficit == 1) {
                    deficit = 2;
                    adj_exp -= 2; 
                }
                else if (deficit == 2) {
                    deficit = 1;
                    adj_exp -=1;
                }
            }
            else {
                deficit = adj_exp % 3;
                adj_exp -= deficit;
            }
            /* so, d = 0. x.yyyy, d=1 xx.y d=2 xxx.yyy special case if xxx*/

            *cur++ = '0' + BN_getd(bn,bn->digits-1);
            if (deficit == 0) *cur++ = '.';

            if (bn->digits == 1) {
                *cur++ = '0';
                if (deficit == 1) *cur++ = '.';
                *cur++ = '0';
            }
            else if (bn->digits == 2) {
                *cur++ = '0' + BN_getd(bn,bn->digits-2);
                if (deficit == 1) *cur++ = '.';
                *cur++ = '0'; 
            }
            else {
                *cur++ = '0' + BN_getd(bn,bn->digits-2);
                if (deficit == 1) *cur++ = '.';
                *cur++ = '0' + BN_getd(bn,bn->digits-3);
                if (bn->digits != 3 && deficit == 2) *cur++ = '.';

                for (cur_dig=bn->digits-4; cur_dig>-1; cur_dig--) {
                    *cur++ = '0' + BN_getd(bn, cur_dig);
                }
            }

            *cur++ = 'E';
            sprintf(cur, "%+i", adj_exp);

        }
        else { /* Scientific */
            if (bn->digits == 1) { /* We don't want 1.E+7 */
                *cur++ = '0'+ BN_getd(bn, 0);
            }
            else { /* We have x.xE */
                *cur++ = '0' + BN_getd(bn, bn->digits-1);
                *cur++ = '.';
                for (cur_dig = bn->digits-2; cur_dig > -1; cur_dig--) {
                    *cur++ = '0' + BN_getd(bn, cur_dig);
                }
            }
            *cur++ = 'E'; /* Eza Good, Eza Good */
            sprintf(cur, "%+i", adj_exp);      
        }
    }

    return 0;
}

/*

=for api bignum BIGNUM* BN_from_string(char* string, context) 

Convert a scientific string to a BIGNUM.  This function deals entirely
with common-or-garden C byte strings, so the library can work
anywhere.  Another version will be eventually required to cope with
the parrot string fun.

This is the Highly Pedantic string conversion.  If I<context> has
I<extended> as a true value, then the full range of extended number is
made available, and any string which does not match the numeric syntax
is converted to a quiet NaN.

Does not yet check for exponent overflow.

=cut

*/

BIGNUM*
BN_from_string(PINTD_ char* s2, BN_CONTEXT *context) {
    BIGNUM *result;
    BIGNUM *temp;

    INTVAL pos = 0;             /* current digit in buffer */
    int negative = 0;        /* is it negative */
    int seen_dot = 0;        /* have we seen a '.' */
    int seen_e = 0;          /* have we seen an 'E' or 'e' */
    int exp_sign = 0;        /* is the exponent negative */
    int in_exp = 0;          /* are we reading exponent digits */
    int in_number = 0;       /* are we reading coeff digits */
    INTVAL exponent = 0;        /* the exponent */
    INTVAL fake_exponent = 0;   /* adjustment for digits after a '.' */
    INTVAL i = 0;               
    int non_zero_digits = 0; /* have we seen *any* digits */
    int seen_plus = 0;       /* was number prefixed with '+' */
    int infinity =0;
    int qNAN = 0;
    int sNAN = 0;

    temp = BN_new(PINT_ 1);     /* We store coeff reversed in temp */
  
    while (*s2) { /* charge through the string */
        if (isdigit(*s2) && !in_exp) {
            /* We're somewhere in the main string of numbers */
            int digit = *s2 - '0'; /* byte me! */
            if (digit ==0 && !non_zero_digits) { /* ignore leading zeros */
                in_number = 1;
                s2++;
                if (seen_dot) fake_exponent--;
                continue;
            }
            else {
                non_zero_digits = 1;
            }
            in_number = 1;
            BN_grow(PINT_ temp, pos+10);
            BN_setd(temp, pos, digit);
            pos++;
            if (seen_dot) {
                fake_exponent--;
            }
        }
        else if (isdigit(*s2) && in_exp) {
            exponent = 10 * exponent + (*s2 - '0'); /*XXX: overflow check */
        }
        else if (!in_number) {
            /* we've not yet seen any digits */
            if (*s2 == '-') {
                if (seen_plus || negative || seen_dot) {
                    if (!context->extended) {
                        BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX,
                                  "Incorrect number format");
                    }
                    else {
                        qNAN = 1; break;
                    }
                }
                negative = 1;
            }
            else if (*s2 == '.') {
                seen_dot = 1;
            }
            else if (*s2 == '+') {
                if (seen_plus || negative || seen_dot) {
                    if (!context->extended) {
                        BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX,
                                  "Incorrect number format");
                    }
                    else {
                        qNAN = 1; break;
                    }
                }
                seen_plus = 1; /* be very quiet */
            }
            else if (context->extended) {
                if (*s2 == 'i' || *s2 == 'I') {
                    if (!strncasecmp("inf", s2, 4)) { /* We include the \0 */
                        infinity = 1;
                        /* For certain, restricted values of infinity */
                        break;
                    }
                    else if (!strncasecmp("infinity", s2, 9)) {
                        infinity = 1;
                        break;
                    }
                    else {
                        qNAN = 1;
                        break;
                    }
                }
                else if (*s2 == 'n' || *s2 == 'N') {
                    qNAN = 1; /* Don't need to check, as default.. */
                    break;
                }
                else if (*s2 == 's' || *s2 == 'S') {
                    if (!strncasecmp("snan", s2, 5)) {
                        sNAN = 1;
                        break;
                    }
                    else {
                        qNAN = 1;
                        break;
                    }                    
                }
                qNAN = 1;
                break;
            } /* don't know, not in extended mode... */
            else {
                BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX,
                          "Incorrect number format");
            }
        }
        else {
            /* we've seen some digits, are we done yet? */
            if (!seen_dot && *s2 == '.' && !in_exp) {
                seen_dot = 1;
            }
            else if (!seen_e && (*s2 == 'e' || *s2 == 'E')) {
                seen_e = 1;
                in_exp = 1;
            }
            else if (seen_e && !exp_sign) {
                if (*s2 == '+') {
                    exp_sign = 1;
                }
                else if (*s2 == '-') {
                    exp_sign = -1;
                }
                else {
                    if (!context->extended) {
                        BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX,
                                  "Incorrect number format");
                    }
                    else {
                        qNAN = 1; break;
                    }
                }
            }
            else { /* We fall through here if we don't recognise something */
                if (!context->extended) {
                    BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX,
                              "c Incorrect number format");
                }
                else {
                    qNAN = 1; break;
                }
            }
        }
        s2++; /* rinse, lather... */
    }
  
    if (!(qNAN || sNAN || infinity)) {
        if (in_number && !pos) { /* Only got zeros */
            pos = 1;
            BN_setd(temp, 0, 0);
        }
        
        if (pos==0) { /* This includes ".e+20" */
            if (!context->extended) {
                BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "no digits in string");
            }
            else {
                qNAN = 1;
            }
        }
    }

    result = BN_new(pos+1);

    /* copy reversed string of digits backwards into result */
    if (!(qNAN || sNAN || infinity)) { /* Normal */
        temp->digits = pos;
         
        for (i=0; i< temp->digits; i++) {
            BN_setd(result, i, BN_getd(temp, temp->digits-i-1));
        }
        
        result->sign = negative;
        result->digits = pos;
        if (exp_sign == -1) {
            result->expn = fake_exponent - exponent;
        }
        else {
            result->expn = fake_exponent + exponent;
        }
    }
    else { /* Special */
        if (infinity) {
            BN_set_inf(PINT_ result);
            result->sign = negative;
        }
        else if (sNAN) {
            BN_set_sNAN(PINT_ result);
        }
        else {
            BN_set_qNAN(PINT_ result);
        }
    }


    BN_destroy(PINT_ temp);
    BN_really_zero(PINT_ result,context->extended);
    return result;
}


/*

=for api bignum_private BN_strip_zeros(BIGNUM* victim, context)

Removes any zeros before the msd and after the lsd

=cut

*/

int
BN_strip_lead_zeros(PINTD_ BIGNUM* bn, BN_CONTEXT *context) {
    INTVAL msd, i;
  
    if (bn->digits == 0) return 0; /* Cannot "fail" with special nums */

    msd = bn->digits-1;

    while (0==BN_getd(bn, msd) && msd > 0) {
        msd--;
    }

    bn->digits -= bn->digits-1 - msd;
}

/*

=for api bignum_private BN_strip_tail_zeros(BIGNUM *victim, context)

Removes trailing zeros and increases the exponent appropriately.
Does not remove zeros before the decimal point.

=cut

*/


int
BN_strip_tail_zeros(PINTD_ BIGNUM *bn, BN_CONTEXT *context) {
    INTVAL lsd, i;

    lsd = 0;

    while (0==BN_getd(bn, lsd)) {
        lsd++;
    }
    if (bn->expn >= 0) {
        lsd = 0; /* units column */      
    }
    else if (bn->expn + lsd > 0) {
        lsd = -bn->expn;
    }
    for (i=0; i< bn->digits -lsd; i++) {
        BN_setd(bn, i, BN_getd(bn, i+lsd));
    }
    
    if (CHECK_OVERFLOW( bn, lsd, context)) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow when striping zeros");
    }
    bn->expn += lsd;
    bn->digits -= lsd;
}

/*

=for api bignum BN_make_integer(BIGNUM* victim, BN_CONTEXT* context)

Convert the number to a plain integer *if* precision such that this
is possible.

=cut

*/

int
BN_make_integer(PINTD_ BIGNUM* bn, BN_CONTEXT* context) {
    /* Normal bignum */
    if (bn->expn > 0 && bn->digits + bn->expn <= context->precision) {
        INTVAL i;
        BN_grow(PINT_ bn, context->precision);
        for (i=bn->digits-1; i>= 0; i--) {
            BN_setd(bn, i+bn->expn, BN_getd(bn, i));
        }
        for (i=0; i<bn->expn; i++) {
            BN_setd(bn, i, 0);
        }
        bn->digits += bn->expn;
        bn->expn = 0;
    }
    else {
        return; /* XXX: fixed precision, bigints */
    }
}

/*

=for api bignum_private BN_really_zero(BIGNUM* victim, context)

Sets any number which should be zero to a cannonical zero.

To check if a number is equal to zero, use BN_is_zero.

=cut

*/

int
BN_really_zero(PINTD_ BIGNUM* bn, int allow_neg_zero) {
    INTVAL i;
    if (bn->digits == 0) return;
    for (i=0; i< bn->digits; i++)
        if (BN_getd(bn, i) != 0) return;
  
    bn->digits = 1;
    bn->expn = 0;
    if (!allow_neg_zero) bn->sign = 0;
    return;
}

/*

=for api bignum BN_iround(BIGNUM *victim, BN_CONTEXT* context)

Rounds victim according to context.

Round assumes that any leading zeros are significant (after an
addition operation, for instance).

If I<precision> is positive, the digit string is rounded
to have no more than I<precision> digits.  If I<precision> is
equal to zero, the number is treated as an integer, and any
digits after the number's decimal point are removed.  If I<precision>
is negative, the number is rounded so that there are no more
than - I<precision> digits after the decimal point.

eg. for  1.234567E+3 with rounding of ROUND_DOWN

precision:  4 =>  1.234E+3      1234
precision:  6 =>  1.234567E+3   1234.56
precision:  9 =>  1.234567E+3   1234.567
precision:  0 =>  1234          1234
precision: -1 =>  1.2345E+3     1234.5
precision: -9 =>  1.234567E+3   1234.567

=cut

*/

void
BN_round(PINTD_ BIGNUM *bn, BN_CONTEXT* context) {
    /* In exported version, must check for sNAN */
    if (bn->digits == 0 && am_sNAN(bn)) {
        BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                    "sNaN in round");
        BN_set_sNAN(PINT_ bn);
        return;
    }
    else {
        BN_iround(PINT_ bn, context);
        return;
    }
}

int
BN_iround (PINTD_ BIGNUM *bn, BN_CONTEXT* context) {
    assert(bn!= NULL);
    assert(context != NULL);

    if (bn->digits == 0) {
        return 0; /* rounding special values always works */
    }

    if (context->precision < 1) { /* Rounding a BigInt or fixed */
        BN_round_as_integer(PINT_ bn, context);
        return;
    }
    /* Rounding a BigNum or sdaNum*/
    if (bn->digits > context->precision) {
        /* We're rounding, right... do we care? */
        BN_nonfatal(PINT_ context, BN_ROUNDED, "Argument rounded");
        { /* Check for lost digits */
            INTVAL digit;
            for (digit = 0; digit < bn->digits - context->precision; digit++) {
                if (BN_getd(bn, digit) != 0) {
                    BN_nonfatal(PINT_ context, BN_LOST_DIGITS,
                                "digits lost while rounding");
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision while rounding");
                    break;
                }
            }
        }

        if (context->rounding == ROUND_DOWN) {
            return BN_round_down(PINT_ bn, context);
        }
        else if (context->rounding == ROUND_HALF_UP) {
            if (BN_getd(bn, bn->digits - context->precision -1) > 4) {
                return BN_round_up(PINT_ bn, context);
            }
            else {
                return BN_round_down(PINT_ bn, context);
            }
        }
        else if (context->rounding == ROUND_HALF_EVEN) {

            if (BN_getd(bn, bn->digits - context->precision -1) > 5) {
                return BN_round_up(PINT_ bn, context);
            }
            else if (BN_getd(bn, bn->digits - context->precision -1) < 5) {
                return BN_round_down(PINT_ bn, context);
            }
            else {
                INTVAL i = bn->digits - context->precision -2;
                if (i > -1) {
                    while (i>=0) {
                        if (BN_getd(bn, i) != 0) {
                            return BN_round_up(PINT_ bn, context);
                        }
                        i--;
                    }
                }
                switch(BN_getd(bn, bn->digits-context->precision)) {
                case 0 :
                case 2 :
                case 4 :
                case 6 :
                case 8 :
                    return BN_round_down(PINT_ bn, context);
                default:
                    return BN_round_up(PINT_ bn, context);
                }
            }

        }
        else if (context->rounding == ROUND_CEILING) {
            INTVAL i;
            if (bn->sign) {
                return BN_round_down(PINT_ bn, context);
            }
            for (i = bn->digits - context->precision -1; i > -1; i--) {
                if (BN_getd(bn, i) != 0) {
                    return BN_round_up(PINT_ bn, context);
                }
            }
            return BN_round_down(PINT_ bn, context);
        }
        else if (context->rounding == ROUND_FLOOR) {
            INTVAL i;
            if (!bn->sign) {
                return BN_round_down(PINT_ bn, context);
            }
            for (i = bn->digits - context->precision; i > -1; i--) {
                if (BN_getd(bn, i) != 0) {
                    return BN_round_up(PINT_ bn, context);
                }
            }
            return BN_round_down(PINT_ bn, context);
        }
        BN_EXCEPT(PINT_ BN_INVALID_OPERATION, "Unknown rounding attempted");
    }
    return;
}

/*

=for api bignum_private BN_round_up(bn, context)

Truncates coefficient of I<bn> to have I<precision> digits, then adds
1 to the last digits and carries until done.  Do not call this
function with non-positive values of I<precision>.

=cut

*/

int
BN_round_up(PINTD_ BIGNUM *bn, BN_CONTEXT* context) {
    INTVAL i, carry;

    /* Do a cheap num += 1E+(num->expn) */
    carry = 1;
    for (i = bn->digits - context->precision; i< bn->digits; i++) {
        carry += BN_getd(bn, i);
        BN_setd(bn, i-bn->digits + context->precision, carry%10);
        carry = carry / 10;
    }
    if (carry) { /* We had 999999999 + 1, extend number */
        INTVAL extra = bn->digits - context->precision;
        BN_setd(bn, context->precision, carry);
        if (CHECK_OVERFLOW(bn, extra, context)) {
            BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow while rounding");
        }
        bn->expn += extra;
        bn->digits = context->precision +1;
        return BN_iround(PINT_ bn, context);
    }
    else {
        INTVAL extra = bn->digits - context->precision;
        if (CHECK_OVERFLOW(bn, extra, context)) {
            BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow while rounding");
        }
        bn->expn += extra;
        bn->digits = context->precision;
        return;
    }
}

/*

=for api bignum_private BN_round_down(bn, context)

Truncates the coefficient of I<bn> to have I<precision> digits.  Do
not call this function with non-positive precision.

=cut

*/

int
BN_round_down(PINT_ BIGNUM *bn, BN_CONTEXT* context) {
    INTVAL i =0;
    INTVAL extra;

    for (i=0; i<context->precision; i++) {
        int temp = BN_getd(bn, i+bn->digits - context->precision);
        BN_setd(bn, i, temp);
    }
    extra = bn->digits - context->precision;
    if (CHECK_OVERFLOW(bn, extra, context)) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow while rounding");
    }
    bn->expn += extra;
    bn->digits = context->precision;

    return;
}

/*

=for api bignum BN_round_as_integer(bn, context)

I<precision> must be less than one.  This rounds so that I<expn> is at
least I<precision>.  Name is slightly misleading.

=cut

*/

void
BN_round_as_integer(PINTD_ BIGNUM *bn, BN_CONTEXT *context) {
    INTVAL i;
    BN_CONTEXT temp_context;

    if (bn->expn < context->precision) {
        {
            /* Are we losing information? */
            for (i=0;
                 i< (context->precision - bn->expn) && i<bn->digits;
                 i++) {
                if (BN_getd(bn, i) != 0) {
                    BN_nonfatal(PINT_ context, BN_LOST_DIGITS,
                                "digits lost while rounding");
                    break;
                }
            }
        }

        /* We'll cheat by passing a false context to the normal rounding.
           If "precision" < 1, we add a false zero to front and set p to 1 */
        temp_context = *context;
        temp_context.precision = bn->digits + bn->expn - context->precision;
        if (temp_context.precision < 1) {
            temp_context.precision = 1;
            BN_grow(bn, bn->digits + 1);
            BN_setd(bn, bn->digits, 0);
            bn->digits++;
            BN_iround(PINT_ bn, &temp_context);
        }
        else {
            BN_iround(PINT_ bn, &temp_context);
        }
        BN_really_zero(PINT_ bn, context->extended);

        /* XXX: if using warning flags on context, | with temp context here */
    }

    return;
}


/*

=for api bignum

=head2  Arithmetic operations 

Operations are performed like this:

=over 4

=item Rounding

Both operands are rounded to have no more than context->precision digits.

=item Computation

The operation is computed.

=item Rounding of result

The result is then rounded to context->precision digits.

=item Conversion to zero and integerisation

If the result is equal to zero, it is made exactly zero.

Where the length of the coefficient + the exponent of the result is
less than context->precision, the result is converted into an integer.

=back

The general form for all arithmetic operations is

void BN_operation(result, one, two, context)

=cut

*/


/*

=for api bignum_private BN_arith_setup(result, one, two, context, &restore)

rounds one and two ready for arithmetic operation.

We assume that an operation might extend the digit buffer with zeros
on either side, but not tamper with the actual digits of the number,
we can then easily return the number to the correct (but still rounded)
representation in _cleanup later

If you can promise that you will not modify the representation of one
and two during your operation, then you may pass &restore as a NULL
pointer to both setup and cleanup.

If overflow or underflow occurs during rounding, the numbers will be
modified to the appropriate representation and will not be restorable.

=cut

*/

int
BN_arith_setup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
               BN_CONTEXT *context, BN_SAVE_PREC* restore) {
    BN_strip_lead_zeros(PINT_ one, context);
    BN_strip_lead_zeros(PINT_ two, context);
    BN_iround(PINT_ one, context);
    BN_iround(PINT_ two, context);
    if (restore) {
        restore->one = *one;
        restore->two = *two;
    }
}

/*

=for api bignum_private BN_arith_cleanup(result, one, two, context, &restore)

Rounds result, one, two, checks for zeroness and makes integers.
Fixes one and two so they don't gain precision by mistake.

=cut

*/

int
BN_arith_cleanup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
                 BN_CONTEXT *context, BN_SAVE_PREC* restore) {
    INTVAL i;
    unsigned char traps_save;
    unsigned char flags_save;
    if (restore && one->digits != restore->one.digits) {
        if (one->expn < restore->one.expn) {
            for (i=0; i<restore->one.digits; i++)
                BN_setd(one, i, BN_getd(one, i+restore->one.expn - one->expn));
            one->expn = restore->one.expn;
        }
        one->digits = restore->one.digits;
    }
    if (restore && two->digits != restore->two.digits) {
        if (two->expn < restore->two.expn) {
            for (i=0; i<restore->two.digits; i++)
                BN_setd(two, i, BN_getd(two, i+restore->two.expn - two->expn));
            two->expn = restore->two.expn;
        }
        two->digits = restore->two.digits;
    }
    /* We don't raise lost_digits after an operation, only beforehand,
       so we mask off the lost_digits handler to stop the error, and
       also clear any lost_digits flags*/
    traps_save = context->traps;
    flags_save = context->flags;
    context->traps &= ~(unsigned char)BN_F_LOST_DIGITS;
    BN_iround(PINT_ result, context);
    context->traps = traps_save;
    context->flags =  (context->flags & ~(unsigned char)BN_F_LOST_DIGITS)
                    | (flags_save & BN_F_LOST_DIGITS);

    BN_strip_lead_zeros(PINT_ result, context);
    BN_really_zero(PINT_ result, context->extended);
    BN_make_integer(PINT_ result, context);
}

/*

=for api bignum_private BN_align(BIGNUM* one, BIGNUM* two) 

Adds zero digits so that decimal points of each number are at the same
place.

=cut

*/

int
BN_align(PINTD_ BIGNUM* one, BIGNUM* two) {
    INTVAL i;
    INTVAL diff;

    diff = one->expn - two->expn;
  
    if (diff == 0) {
        /* The numbers have the same exponent, we merely need to extend
           the one with a shorter coeff length with zeros */
        if (one->digits < two->digits) {
            BIGNUM *temp = one;
            one = two;
            two = temp;
        }

        BN_grow(PINT_ two, one->digits);
        for (i=two->digits; i<one->digits; i++) {
            BN_setd(two, i, 0);
        }
        two->digits = one->digits;
    }
    else {
        /* We need to pad both numbers to have the same number of digits
           the number with the most negative exponent only needs leading
           digits, while the number with the less negative expn may need
           both front and back padding, depending on its coeff length.
           Ideally we'll only move any digit once. */
        INTVAL final;
        /* force smallest exponent in two */
        if (diff < 0) {
            BIGNUM *temp = one;
            one = two;
            two = temp;
            diff = -diff;
        }

        if (one->digits + diff < two->digits) {
            final = two->digits;
        }
        else {
            final = one->digits + diff;
        }

        BN_grow(PINT_ one, final);
        BN_grow(PINT_ two, final);
        /* Add zeros to start of two */
        for (i=two->digits; i<final; i++)
            BN_setd(two, i, 0);
    
        /* Add zeros to start of one */
        for (i=one->digits + diff; i< final; i++)
            BN_setd(one, i, 0);

        /* Move one into new home */
        for (i=one->digits-1; i>-1; i--)
            BN_setd(one, i+diff, BN_getd(one, i));

        /* Set end of one to zeros */
        for (i=0; i< diff; i++)
            BN_setd(one, i, 0);
    
        one->digits = two->digits = final;
        one->expn = two->expn;
    }

}
/*

=for api bignum BN_add(result, one, two, context)

Adds one to two, returning value in result.

=cut

*/

void
BN_add(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
    BN_SAVE_PREC restore;
    /* Special values */
    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in add");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* Otherwise an infinity */
        if (am_INF(one) && am_INF(two)) {
            if (one->sign != two->sign) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "addition of +Inf and -Inf");
                BN_set_qNAN(PINT_ result);
                return;
            }
            else {
                BN_set_inf(PINT_ result);
                result->sign = one->sign;
                return;
            }
        }
        /* So we've only got one infinity... */
        BN_set_inf(PINT_ result);
        result->sign = am_INF(one) ? one->sign : two->sign;
        return;
    }

    /* Be careful to do 0 + -0 and -0 + 0 correctly */
    if (BN_is_zero(PINT_ one, context) && BN_is_zero(PINT_ two, context)) {
        result->digits = 1;
        result->expn = 0;
        BN_setd(result, 0, 0);
        if (one->sign & two->sign) {
            result->sign = 1;
        }
        else if (context->rounding == ROUND_FLOOR && (one->sign ^ two->sign)) {
            result->sign = 1;
        }
        else {
            result->sign = 0;
        }
        return;
    }


    BN_arith_setup(PINT_ result, one, two, context, &restore);

    /* Do we mean add, or do we mean subtract? */
    if (one->sign && !two->sign) {             /* -a +  b =  (b-a) */
        BN_isubtract(PINT_ result, two, one, context);
    }
    else if (one->sign && two->sign) {         /* -a + -b = -(a+b) */
        BN_iadd(PINT_ result, one, two, context);
        result->sign = 1;
    }
    else if (two->sign) {                      /*  a + -b =  (a-b) */
        BN_isubtract(PINT_ result, one, two, context);
    }
    else {                                     /*  a +  b =  (a+b) */
        BN_iadd(PINT_ result, one, two, context);
    }

    BN_arith_cleanup(PINT_ result, one, two, context, &restore);
    /* If using round_floor, need to make sure x + -x => -0 */
    if (context->rounding == ROUND_FLOOR && BN_is_zero(PINT_ result, context)
        && (one->sign ^ two->sign)) {
        result->sign = 1;
    }
}

/*

=for api bignum_private BN_iadd(result, one, two, context)

Adds together two aligned big numbers with coefficients of equal
length.  Returns a result without reference to the signs of its
arguments.  Cannot cope with special values.

=cut

*/

int
BN_iadd (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
              BN_CONTEXT *context) {
    INTVAL i;
    int carry, dig;

    /* Make sure we don't do work we don't need, or add precision where
       it isn't wanted */
    if (BN_is_zero(PINT_ one, context)) {
        BN_copy(PINT_ result, two);
        result->sign = 0;
        return;
    }
    else if (BN_is_zero(PINT_ two, context)) {
        BN_copy(PINT_ result, one);
        result->sign = 0;
        return;
    }

    /* Do the numbers overlap (within precision (and a bit) digits)?
       If not, we can simply use the first and round given the second
       by catenating `01' to the result... Remember that we also know
       that neither is zero */

    if (context->precision > -1 &&
        one->expn > two->expn + context->precision +1) {
        BN_grow(PINT_ result, context->precision + 1);
        for (i = 0; i < one->digits && i < context->precision; i++) {
            dig = BN_getd(one, one->digits - i -1);
            BN_setd(result, context->precision-i, dig);
        }
        for (i = i; i < context->precision; i++) {
            BN_setd(result, context->precision - i, 0);
        }
        BN_setd(result, 0, 1);
        result->digits = context->precision + 1;
        result->sign = 0;
        result->expn = one->expn + one->digits - context->precision - 1;
        return 0;
    } /* or two might be in the lead, but will he win by more than a length? */
    else if (context->precision > -1 &&
             two->expn > one->expn + context->precision + 1) {
        BN_grow(PINT_ result, context->precision + 1);
        for (i = 0; i < two->digits && i < context->precision; i++) {
            dig = BN_getd(two, two->digits -i-1);
            BN_setd(result, context->precision-i, dig);
        }
        for (i = i; i < context->precision; i++) {
            BN_setd(result, context->precision - i, 0);
        }
        BN_setd(result, 0, 1);
        result->digits = context->precision + 1;
        result->sign = 0;
        result->expn = two->expn + two->digits - context->precision - 1;
        return 0;
    }

    /* Ok, we can't be lazy, we'll have to do it all ourselves */
    BN_align(PINT_ one, two);

    BN_grow(PINT_ result, one->digits + 1);

    carry = 0;
    for (i=0; i< one->digits; i++) {
        carry += BN_getd(one, i) + BN_getd(two, i);
        dig = carry % 10;
        BN_setd(result, i, dig);
        carry = carry / 10;
    }
    if (carry) {
        BN_setd(result, i, carry);
        result->digits = i+1;
    }
    else {
        result->digits = i;
    }
    result->sign = 0;
    result->expn = one->expn;
    return 0;
}

/*

=for api bignum BN_subtract(result, one, two, context)

Subtracts two from one, returning value in result.

=cut

*/

void
BN_subtract(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
            BN_CONTEXT *context) {
    BN_SAVE_PREC restore;
    /* Special values, like addition but careful with those signs eugene */
    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in subtract");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* Otherwise an infinity */
        if (am_INF(one) && am_INF(two)) {
            if (one->sign == two->sign) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "subtraction of Inf and Inf");
                BN_set_qNAN(PINT_ result);
                return;
            }
            else {
                BN_set_inf(PINT_ result);
                result->sign = one->sign;
                return;
            }
        }
        /* So we've only got one infinity... */
        BN_set_inf(PINT_ result);
        result->sign = am_INF(one) ? one->sign : (1 & (1 ^ two->sign));
        return;
    }

    /* Be careful to do 0 + -0 and -0 + 0 correctly*/
    if (BN_is_zero(PINT_ one, context) && BN_is_zero(PINT_ two, context)) {
        result->digits = 1;
        result->expn = 0;
        BN_setd(result, 0, 0);
        if (one->sign && !two->sign && context->extended) {
            result->sign = 1;
        }
        else if (context->rounding == ROUND_FLOOR &&
                 (one->sign == two->sign) &&
                 context->extended) {
            result->sign = 1;
        }
        else {
            result->sign = 0;
        }
        return;
    }

    BN_arith_setup(PINT_ result, one, two, context, &restore);

    /* Do we mean subtract, or do we mean add? */
    if (one->sign && !two->sign) {         /* -a -  b = -(a+b) */
        BN_iadd(PINT_ result, one, two, context);
        result->sign = 1;
    }
    else if (one->sign && two->sign) {     /* -a - -b = (b-a)  */
        BN_isubtract(PINT_ result, two, one, context);
    }
    else if (two->sign) {                  /*  a - -b = (a+b)  */
        BN_iadd(PINT_ result, one, two, context);
    }
    else {                                 /*  a -  b = (a-b)  */
        BN_isubtract(PINT_ result, one, two, context);
    }

    BN_arith_cleanup(PINT_ result, one, two, context, &restore);
    /* If using round_floor, need to make sure x + -x => -0 */
    if (context->rounding == ROUND_FLOOR && BN_is_zero(PINT_ result, context)
        && (one->sign == two->sign)) {
        result->sign = 1;
    }
}

/*

=for api bignum_private BN_isubtract(result, one, two, context)

Subtracts two from one, assumes both numbers have positive aligned
coefficients of equal length.  Sets sign of result as appropriate.
Cannot cope with special values.

=cut

*/

int
BN_isubtract (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
              BN_CONTEXT *context) {
    INTVAL i;
    int carry, dig;
    /* Make sure we don't do work we don't need, or add precision where
       it isn't wanted */
    if (BN_is_zero(PINT_ one, context)) {
        BN_copy(PINT_ result, two);
        result->sign = 1;
        return;
    }
    else if (BN_is_zero(PINT_ two, context)) {
        BN_copy(PINT_ result, one);
        result->sign = 0;
        return;
    }

    /* Do the numbers fail to overlap?  If so, we can simplify the sum
       by taking a little bit, but essentially copying... We don't
       yet know which number is the bigger of the two, so need to do
       each by itself */
    if (context->precision > -1 &&
        one->expn > two->expn + context->precision + 1) {
        BN_grow(PINT_ result, context->precision + 1);
        carry = -1;
        for (i=0; i<one->digits; i++) {
            carry = carry + BN_getd(one, i);
            if (carry < 0) {
                BN_setd(result, context->precision - one->digits + i + 1,
                        10+carry);
                carry = -1;
            }
            else {
                BN_setd(result, context->precision - one->digits + i + 1,
                        carry);
                carry = 0;
            }
        }
        for (i=0; i<context->precision + 1 - one->digits; i++) {
            BN_setd(result, i, 9);
        }
        result->expn = one->expn + one->digits - context->precision -1;
        result->sign = 0;
        result->digits = context->precision + 1;
        return 1;
    } /* or, do we do [ickle] - b */
    else if (context->precision > -1 &&
             two->expn > one->expn + context->precision + 1) {
        BN_grow(PINT_ result, context->precision + 1);
        carry = -1;
        for (i=0; i<two->digits; i++) {
            carry = carry + BN_getd(two, i);
            if (carry < 0) {
                BN_setd(result, context->precision - two->digits + i + 1,
                        10+carry);
                carry = -1;
            }
            else {
                BN_setd(result, context->precision - two->digits + i + 1,
                        carry);
                carry = 0;
            }
        }
        for (i=0; i<context->precision + 1 - two->digits; i++) {
            BN_setd(result, i, 9);
        }
        result->expn = two->expn + two->digits - context->precision -1;
        result->sign = 1;
        result->digits = context->precision + 1;
        return 1;
    }


    BN_align(PINT_ one, two);

    /* as a-b == -(b-a), we find larger of
       a and b and make sure it is in one */
    carry = 0;
    for (i=one->digits -1; i>-1; i--) {
        carry = BN_getd(one, i) - BN_getd(two, i);
        if (carry) break;
    }

    if (!carry) { /* a==b*/
        result->digits = 1;
        result->sign = 0;
        BN_setd(result, 0,0);
        return;
    }
    else if (carry < 0) { /* b > a */
        BN_isubtract(PINT_ result, two, one, context);
        result->sign = 1;
    }
    else {
        BN_grow(PINT_ result, one->digits + 1);

        carry = 0;
        for (i=0; i<one->digits; i++) {
            carry = carry + BN_getd(one, i) - BN_getd(two,i);
            if (carry < 0) {
                BN_setd(result, i, 10+carry);
                carry = -1;
            }
            else {
                BN_setd(result, i, carry);
                carry = 0;
            }
        }

        assert(!carry); /* as to get here a > b*/

        result->digits = one->digits;
        result->expn = one->expn;
        result->sign = 0;
    }

}

/*

=for api bignum BN_plus(result, one, context) 

Perform unary + on one.  Does all the rounding and what have you.

=cut

*/

void
BN_plus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context) {
    /* Check for special values */
    if (one->digits ==0) {
        if (am_sNAN(one)) BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                                      "sNAN in plus");
        if (am_NAN(one)) {
            BN_set_qNAN(PINT_ result);
            return;
        }
        else { /* Infinity */
            BN_set_inf(PINT_ result);
            result->sign = one->sign;
            return;
        }
    }

    BN_arith_setup(PINT_ result, one, one, context, NULL);
    BN_copy(PINT_ result, one);
    BN_really_zero(PINT_ result, 0);
    BN_arith_cleanup(PINT_ result, one, one, context, NULL);
}

/*

=for api bignum BN_minus(result, one, context) 

Perform unary - on one.  Does all the rounding and what have you.

=cut

*/

void
BN_minus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context) {
    /* Check for special values */
    if (one->digits ==0) {
        if (am_sNAN(one)) BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                                      "sNAN in minus");
        if (am_NAN(one)) {
            BN_set_qNAN(PINT_ result);
            return;
        }
        else { /* Infinity */
            BN_set_inf(PINT_ result);
            result->sign = 1 & (1 ^ one->sign);
            return;
        }
    }

    BN_arith_setup(PINT_ result, one, one, context, NULL);
    BN_copy(PINT_ result, one);
    result->sign = result->sign ? 0 : 1;
    BN_really_zero(PINT_ result, 0);
    BN_arith_cleanup(PINT_ result, one, one, context, NULL);
}

/*

=for api bignum BN_compare(result, one, two, context)

Numerically compares one and two, storing the result (as a BIGNUM) in
result.

result = 1  => one > two
result = -1 => two > one
result = 0  => one == two

=cut

*/

void
BN_compare (PINT_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
            BN_CONTEXT *context) {
    INTVAL cmp;

    /* Special values */
    if (one->digits == 0 || two->digits ==0) {
        /* NaN */
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "NaN in compare");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* Otherwise at least one of the operands is an infinity */
        if (one->sign != two->sign) {
            cmp = one->sign ? -1 : 1;
        }
        else if (am_INF(one) && am_INF(two)) {
            cmp = 0;
        }
        else if (am_INF(one)) {
            cmp = one->sign ? -1 : 1;
        }
        else {
            cmp = one->sign ? 1 : -1;
        }
    }
    else {
        BN_arith_setup(PINT_ result, one, two, context, NULL);
        cmp = BN_comp(PINT_ one, two, context);        
    }
    result->digits = 1;
    result->expn = 0;
        
    if (cmp == 0) {
        BN_setd(result, 0, 0);
        result->sign = 0;
    }
    else if (cmp > 0) {
        BN_setd(result, 0, 1);
        result->sign = 0;
    }
    else {
        BN_setd(result, 0, 1);
        result->sign = 1;
    }
    BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/*

=for api bignum BN_multiply(result, one, two, context) 

Multiplies one and two, storing the result in result.

=cut

*/

void 
BN_multiply (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
             BN_CONTEXT *context) {

    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in multiply");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* We've got at least one infinity */
        /* 0 * Inf => NaN */
        if (BN_is_zero(PINT_ one, context) || BN_is_zero(PINT_ two, context)) {
            BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                        "Attempt to multiply 0 and Infinity");
            BN_set_qNAN(PINT_ result);
            return;
        }

        /* (anything but 0) * Inf => Inf */
        BN_set_inf(PINT_ result);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    BN_arith_setup(PINT_ result, one, two, context, NULL);

    BN_imultiply(PINT_ result, one, two, context);

    BN_strip_lead_zeros(PINT_ result, context);
    BN_arith_cleanup(PINT_ result, one, two, context, NULL);

}

/*BN_imultiply

Multiplication without the rounding and other set up.

*/
int
BN_imultiply (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
              BN_CONTEXT *context) {
    INTVAL i,j;
    int carry, dig;

    BN_grow(PINT_ result, one->digits + two->digits + 2);
    /* zero contents of result so that it can be used as intermediate */
    for (i=0; i<one->digits + two->digits +2; i++)
        BN_setd(result, i, 0);

    /* make sure largest coeff is in one */
    if (one->digits < two->digits) {
        BIGNUM* temp = one;
        one = two;
        two = temp;
    }

    /* multiply element by element */
    for (i=0; i<two->digits; i++) {
        dig = BN_getd(two, i);
        carry = 0;
        for (j=0; j<one->digits; j++) {
            carry += BN_getd(one,j) * dig + BN_getd(result, i+j);
            BN_setd(result, i+j, carry % 10);
            carry = carry / 10;
        }
        if (carry) {
            BN_setd(result, i+j, carry);
        }
    }

    /* extend if there's still stuff to take care of */
    if (carry) {
        result->digits = one->digits + two->digits + 1;
    }
    else if (BN_getd(result, one->digits + two->digits - 1)) {
        result->digits = one->digits + two->digits;
    }
    else {
        result->digits = one->digits + two->digits - 1;
    }
  
    i = one->expn + two->expn;
    /*XXX: use unsigned here to be sure? */
    if ( i > context->elimit) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow in multiplication");
    }
    if (i < -context->elimit) {
        BN_EXCEPT(PINT_ BN_UNDERFLOW, "underflow in multipliaction");
    }
    result->expn = i;
  
    result->sign = 1 & (one->sign ^ two->sign);
    return;
}

/*

=for api bignum BN_divide(result, one, two, context)

Divide two into one, storing up to I<precision> digits in result.
Performs own rounding.  We also assume that this function B<will not
be used> to produce a BigInt.  That is the job of divide_integer.

If you want to divide two integers to produce a float, you must do so
with I<precision> greater than the number of significant digits in
either operand.  If you want the result to be an integer or a numer
with a fixed fractional part

=cut

*/


void
BN_divide(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
          BN_CONTEXT *context) {
    BIGNUM* rem;
    /* Check for special values */
    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in divide");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        if (am_INF(one) && am_INF(two)) {
            BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                        "Inf / Inf in divide");
            BN_set_qNAN(PINT_ result);
            return;
        }
        if (am_INF(one)) {
            if (BN_is_zero(PINT_ two, context)) {
                BN_nonfatal(PINT_ context, BN_DIVISION_BY_ZERO,
                            "Inf / 0 in divide");
            }
            BN_set_inf(PINT_ result);
            result->sign = 1 & (one->sign ^ two->sign);
            return;
        }
        /* so we're left with x / Inf */
        result->digits = 1;
        result->expn = 0;
        BN_setd(result, 0, 0);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    if (BN_is_zero(PINT_ two, context)) {
        if (BN_is_zero(PINT_ one, context)) {
            BN_nonfatal(PINT_ context, BN_DIVISION_UNDEFINED,
                        " 0 / 0 in divide");
            BN_set_qNAN(PINT_ result);
            return;
        }

        BN_nonfatal(PINT_ context, BN_DIVISION_BY_ZERO,
                    "division by zero in divide");
        BN_set_inf(PINT_ result);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    /* We're left with the case that only arg 1 is zero */
    if (BN_is_zero(PINT_ one, context) ) {
        result->expn = 0;
        result->digits = 1;
        BN_setd(result, 0 ,0);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    rem = BN_new(PINT_ 1);
    BN_arith_setup(PINT_ result, one, two, context, NULL);
    BN_idivide(PINT_ result, one, two, context, BN_DIV_DIVIDE, rem);

    /* Use rem to work out things like rounding here, we'll do our
       own clean up as it's all a little odd */

    BN_strip_lead_zeros(PINT_ result, context);

    /*XXX: write this rounding to cope with precision < 1 */
    if (context->rounding == ROUND_HALF_EVEN) {
        if (result->digits > context->precision) {
            BN_nonfatal(PINT_ context, BN_ROUNDED, "Rounded in divide");
            /* We collected precision + 1 digits... */
            BN_really_zero(PINT_ rem, context->extended);
            if (BN_getd(result, 0) > 5) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                BN_round_up(PINT_ result, context);
            }
            else if (BN_getd(result, 0) == 5) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                if (rem->digits == 1 && BN_getd(rem, 0)==0) {
                    switch (BN_getd(result, 1)) {
                    case 2:
                    case 4:
                    case 6:
                    case 8:
                    case 0:
                        BN_round_down(PINT_ result, context);
                        break;
                    default :
                        BN_round_up(PINT_ result, context);
                    }
                }
                else {
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision in divide");
                    BN_round_up(PINT_ result, context);
                }
            }
            else {
                if (BN_getd(result, 0) !=0) {
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision in divide");
                }
                else if (!BN_is_zero(PINT_ result, context)) {
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision in divide");
                }
                BN_round_down(PINT_ result, context);
            }
        }
    }
    else if (context->rounding == ROUND_CEILING) {
        if (result->digits > context->precision) {
            BN_nonfatal(PINT_ context, BN_ROUNDED,
                        "Rounded in divide");
            BN_really_zero(PINT_ rem, context->extended);
            
            if (result->sign) {
                if (BN_getd(result, 0) != 0 ||
                    !BN_is_zero(PINT_ result, context)) {
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision in divide");
                }
                BN_round_down(PINT_ result, context);
            }
            else if (BN_getd(result, 0) != 0) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                BN_round_up(PINT_ result, context);
            }
            else if (!BN_is_zero(PINT_ rem, context)) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                BN_round_up(PINT_ result, context);
            }
            else {
                BN_round_down(PINT_ result, context);
            }
        }
    }
    else if (context->rounding == ROUND_FLOOR) {
        if (result->digits > context->precision) {
            BN_nonfatal(PINT_ context, BN_ROUNDED,
                        "Rounded in divide");
            BN_really_zero(PINT_ rem, context->extended);
            
            if (!result->sign) {
                if (BN_getd(result, 0) != 0 ||
                    !BN_is_zero(PINT_ result, context)) {
                    BN_nonfatal(PINT_ context, BN_INEXACT,
                                "Loss of precision in divide");
                }
                BN_round_down(PINT_ result, context);
            }
            else if (BN_getd(result, 0) != 0) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                BN_round_up(PINT_ result, context);
            }
            else if (!BN_is_zero(PINT_ rem, context)) {
                BN_nonfatal(PINT_ context, BN_INEXACT,
                            "Loss of precision in divide");
                BN_round_up(PINT_ result, context);
            }
            else {
                BN_round_down(PINT_ result, context);
            }
        }
    }
    else { /* Other roundings just need digits to play with */
        unsigned char save_lost;
        unsigned char flags_save;
        /* We don't warn on lost digits here, as is after an operation */
        save_lost = context->traps;
        context->traps &= ~(unsigned char)BN_F_LOST_DIGITS;
        flags_save = context->flags;
        BN_iround(PINT_ result, context);

        /* We need to check the remainder here, as we might have
           passed "[digits we want]0[digits we've kept a secret]" into
           the rounding without knowing it*/
        if (!BN_is_zero(PINT_ rem, context)) {
            BN_nonfatal(PINT_ context, BN_INEXACT,
                        "Loss of precision in divide");
        }
        
        context->traps = save_lost;
        context->flags =  (context->flags & ~(unsigned char)BN_F_LOST_DIGITS)
            | (flags_save & BN_F_LOST_DIGITS);
    }

    BN_really_zero(PINT_ result, context->extended);

    BN_strip_tail_zeros(PINT_ result, context);

    BN_make_integer(PINT_ result, context);

    /* Remove trailing zeros if positive exponent */
    if (result->expn > 0) {
        INTVAL i,j;
        for (i=0; i<result->digits; i++) {
            if (BN_getd(result, i) != 0) break;
        }
        if (i) {
            for (j=i; j<result->digits; j++) {
                BN_setd(result, j-i, BN_getd(result, j));
            }
        }
        if (CHECK_OVERFLOW(result, i, context)) {
            BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow in divide");
        }
        result->expn += i;
    }
  
    BN_destroy(PINT_ rem);
}

/*

=for api bignum BN_divide_integer(result, one, two, context)

Places the integer part of one / two into result.

=cut

*/

void
BN_divide_integer (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
                   BN_CONTEXT *context) {
    BIGNUM* rem;
    /* Check for special values (same as divide...) */
    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in divide-integer");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        if (am_INF(one) && am_INF(two)) {
            BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                        "Inf / Inf in divide-integer");
            BN_set_qNAN(PINT_ result);
            return;
        }
        if (am_INF(one)) {
            if (BN_is_zero(PINT_ two, context)) {
                BN_nonfatal(PINT_ context, BN_DIVISION_BY_ZERO,
                            "Inf / 0 in divide-integer");
            }
            BN_set_inf(PINT_ result);
            result->sign = 1 & (one->sign ^ two->sign);
            return;
        }
        /* so we're left with x / Inf */
        result->digits = 1;
        result->expn = 0;
        BN_setd(result, 0, 0);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    if (BN_is_zero(PINT_ two, context)) {
        if (BN_is_zero(PINT_ one, context)) {
            BN_nonfatal(PINT_ context, BN_DIVISION_UNDEFINED,
                        " 0 / 0 in divide-integer");
            BN_set_qNAN(PINT_ result);
            return;
        }

        BN_nonfatal(PINT_ context, BN_DIVISION_BY_ZERO,
                    "division by zero in divide-integer");
        BN_set_inf(PINT_ result);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }

    /* We're left with the case that only arg 1 is zero */
    if (BN_is_zero(PINT_ one, context) ) {
        result->expn = 0;
        result->digits = 1;
        BN_setd(result, 0 ,0);
        result->sign = 1 & (one->sign ^ two->sign);
        return;
    }
    
    rem = BN_new(PINT_ 1);
    BN_arith_setup(PINT_ result, one, two, context, NULL);
    BN_idivide(PINT_ result, one, two, context, BN_DIV_DIVINT, rem);
  
    BN_really_zero(PINT_ rem, context->extended);
    if (result->expn >0 && context->precision > 0 &&
        result->expn + result->digits > context->precision &&
        !(rem->digits == 0 && BN_getd(rem, 0) == 0)) {
        BN_nonfatal(PINT_ context, BN_DIVISION_IMPOSSIBLE,
                  "divide-integer requires more precision than available");
        BN_set_qNAN(PINT_ result);
        BN_destroy(PINT_ rem);
        return;
    }
    BN_destroy(PINT_ rem);
    if (result->expn != 0) {
        INTVAL i;
        BN_grow(PINT_ result, result->expn + result->digits);
        for (i=0; i<result->digits; i++) {
            BN_setd(result, result->expn + result->digits -1 -i,
                    BN_getd(result, result->digits - 1- i));
        }
        for (i=0; i<result->expn; i++) {
            BN_setd(result, i ,0);
        }
        result->digits += result->expn;
        result->expn = 0;
    }

    BN_really_zero(PINT_ result, context->extended);
    BN_make_integer(PINT_ result, context);
}

/*

=for api bignum BN_remainder(result, one, two, context)

places the remainder from divide-integer (above) into result.

=cut

*/

void
BN_remainder (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
              BN_CONTEXT *context) {
    BIGNUM* fake;

    /* Check for special values */
    if (one->digits == 0 || two->digits == 0) {
        if (am_NAN(one) || am_NAN(two)) {
            if (am_sNAN(one) || am_sNAN(two)) {
                BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                            "sNAN in remainder");
            }
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* Infinities, first cover Inf rem x and Inf rem Inf */
        if (am_INF(one)) {
            BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                        "x rem Inf in remainder");
            BN_set_qNAN(PINT_ result);
            return;
        }
        /* now cover x rem Inf => 0 */
        result->expn = 0;
        result->digits = 1;
        BN_setd(result, 0,0);
        result->sign = one->sign;
        return;
    }

    if (BN_is_zero(PINT_ two, context)) {
        if (BN_is_zero(PINT_ one, context)) {
            BN_nonfatal(PINT_ context, BN_DIVISION_UNDEFINED,
                        "0 rem 0 in remainder");
            BN_set_qNAN(PINT_ result);
            return;
        }
        BN_nonfatal(PINT_ context, BN_INVALID_OPERATION,
                    "x rem 0 in remainder");
        BN_set_qNAN(PINT_ result);
        return;
    }

    if (BN_is_zero(PINT_ one, context)) {
        result->digits = 1;
        result->sign = 0;
        BN_setd(result, 0, 0);
        return;
    }

    BN_arith_setup(PINT_ result, one, two, context, NULL);
    fake = BN_new(1);
    BN_idivide(PINT_ fake, one, two, context, BN_DIV_REMAIN, result);

    BN_really_zero(PINT_ result, context->extended);
    if (fake->expn >0 && context->precision > 0 &&
        fake->expn + result->digits > context->precision &&
        !(result->digits == 0 && BN_getd(result, 0) == 0)) {
        BN_nonfatal(PINT_ context, BN_DIVISION_IMPOSSIBLE,
                    "remainder requires more precision than available");
        BN_set_qNAN(PINT_ result);
        BN_destroy(PINT_ fake);
        return;
    }


    BN_destroy(PINT_ fake);

    result->sign = one->sign;

    BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/* Does the heavy work for the various division wossnames */
int
BN_idivide (PINT_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
            BN_CONTEXT *context, BN_DIV_ENUM operation, BIGNUM* rem){
    INTVAL i, j, divided, newexpn;
    BIGNUM *div,*t1, *t2;
    int s2, value;

    /* We assume we've been given something to divide */

    /* Make some temporaries, set all signs to positive for simplicity */
    /* We use result as a tempory, and store the reversed result in t2 */
    div = BN_new(PINT_ 1);
    BN_copy(PINT_ div, one);
    BN_copy(PINT_ rem, div); /* In case doing int-div and don't div*/
    div->sign = 0;
    t1 = BN_new(PINT_ 1);
    t2 = BN_new(PINT_ 1);
    t2->digits = 0; /* ok, as all internal */
    s2 = two->sign; /* store the sign of 2, as we set it +ve internally */
    two->sign = 0;
    result->digits = 1;
    rem->digits = 1;

    /* First position to try to fill */
    newexpn = one->digits + one->expn - two->digits - two->expn;
    if (newexpn > context->elimit) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "overflow in divide (1)");
    }
    if (newexpn < -context->elimit) {
        BN_EXCEPT(PINT_ BN_UNDERFLOW, "underflow in divide (1)");
    }
    t1->expn = newexpn;
        
    value = 0;
    for (;;) {
        if (!(t2->digits % 10)) BN_grow(PINT_ t2, t2->digits+11);
        if ((operation == BN_DIV_DIVINT || operation == BN_DIV_REMAIN) &&
            t1->expn < 0) break;
        divided = 0;
        for (j=1; j<=10;j++) {
            int cmp;
            BN_setd(t1, 0, j);
            BN_imultiply(PINT_ result, t1, two, context);
            cmp = BN_comp(PINT_ result, div, context);
            if (cmp ==0) {
                BN_setd(t2, value, j);
                t2->digits++;
                value++;
                j = j+1; /* for multiply below */
                divided = 1;
                break;
            }
            else if (cmp> 0) {
                if (j==1 && value == 0) break; /* don't collect leading 0s */
                BN_setd(t2, value, j-1);
                t2->digits++;
                value++;
                divided = 1;
                break;
            }
        }
        if (divided) {
            BN_setd(t1,0,j-1);
            BN_imultiply(PINT_ result, t1, two, context);
            BN_isubtract(PINT_ rem, div, result, context);
        }

        /* Are we done yet? */
        if (value && rem->digits ==1 && BN_getd(rem, 0)==0) {
            break;
        }

        /* We collect one more digit than precision requires, then
           round in divide, if we're doing divint or rem then we terminate
           at the decimal point and return */
        if (context->precision > 0) {
            if (t2->digits == context->precision + 1) {
                break;
            }
        }
        else {
            if (t1->expn == context->precision -1) break;
        }
        if (operation == BN_DIV_DIVINT|| operation == BN_DIV_REMAIN) {
            if (t1->expn ==0) break;
        }
        if (CHECK_UNDERFLOW(t1, 1, context)) {
            BN_EXCEPT(PINT_ BN_UNDERFLOW, "underflow in divide (2)");
        }
        t1->expn--;
        if (divided) BN_copy(PINT_ div, rem);
    }

    /* Work out the sign and exponent of the result */
    for (i=0; i< t2->digits; i++) {
        BN_setd(result, i, BN_getd(t2, t2->digits - 1 -i));
    }
    if (t2->digits == 0||(!divided&&!value)) {
        result->digits = 1;
        BN_setd(result, 0, 0);
        result->sign = 0;
    }
    else {
        result->digits = t2->digits;
        result->sign = 1&(one->sign ^ s2);
        result->expn = t1->expn; /* We know this is fine, from above */
    }
    two->sign = s2;
    rem->sign = 1&(one->sign ^ s2);

    BN_destroy(PINT_ t1);
    BN_destroy(PINT_ t2);
    BN_destroy(PINT_ div);

    return; /* phew! */
}

/* Comparison with no rounding etc. */
INTVAL
BN_comp (PINTD_ BIGNUM *one, BIGNUM *two, BN_CONTEXT* context) {
    INTVAL i,j;
    int cmp;

    BN_strip_lead_zeros(PINT_ one, context);
    BN_strip_lead_zeros(PINT_ two, context);

    if (one->sign != two->sign) {
        if (BN_is_zero(PINT_ one, context) && BN_is_zero(PINT_ two, context)) {
            return 0; /* as -0 == 0 */
        }
        return one->sign ? -1 : 1;
    }
    else if (one->expn + one->digits > two->expn + two->digits) {
        return one->sign ? -1 : 1;
    }
    else if (one->expn + one->digits < two->expn + two->digits) {
        return one->sign ? 1 : -1;
    }
    else { /* Same sign, same "size" */
        for (i=0; i<one->digits && i<two->digits; i++) {
            cmp = BN_getd(one, one->digits-1-i)
                      - BN_getd(two, two->digits-1-i);
            if (cmp) return one->sign ? -cmp : cmp;
        }
        if (!cmp) {
            if (i==one->digits) {
                for (i=i; i<two->digits; i++) {
                    cmp = 0-BN_getd(two, two->digits-1-i);
                    if (cmp) return one->sign ? -cmp : cmp;
                }
            }
            else if (i==two->digits) {
                for (i=i; i<one->digits; i++) {
                    cmp = BN_getd(one, one->digits-1-i);
                    if (cmp) return one->sign ? -cmp : cmp;
                }
            }
            return one->sign ? -cmp : cmp;
        }
    }
}

/*

=for api bignum BN_power(result, bignum, expn, context)

Calculate result = bignum ** expn;

XXX To Do

=cut

*/

void
BN_power(PINTD_ BIGNUM* result, BIGNUM* bignum,
              BIGNUM* expn, BN_CONTEXT* context) {

    BN_arith_setup(PINT_ result, bignum, expn, context, NULL);


    BN_arith_cleanup(PINT_ result, bignum, expn, context, NULL);
}

/*

=for api bignum BN_rescale(result, bignum, expn, context)

Rescales bignum to have an exponent of expn.

XXX To Do

=cut

*/

void
BN_rescale(PINTD_ BIGNUM* result, BIGNUM* one, BIGNUM* two,
                BN_CONTEXT* context) {
    INTVAL expn;
    unsigned char lost = context->traps;
    context->traps &= ~(unsigned char)BN_F_LOST_DIGITS;

    BN_arith_setup(PINT_ result, one, two, context, NULL);

    expn = BN_to_int(PINT_ two, context);

    context->traps = lost;

    BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/*

=for api bignum INTVAL BN_to_int(BIGNUM* bignum, BN_CONTEXT* context)

Converts the bignum into an integer, raises overflow if an exact
representation cannot be created.

=cut

*/

INTVAL
BN_to_int(PINT_ BIGNUM* bn, BN_CONTEXT* context) {
    INTVAL insig, i;
    INTVAL result = 0;
    INTVAL maxdigs = BN_D_PER_INT < context->precision ?
        BN_D_PER_INT : context->precision;
    if (context->precision < 0) maxdigs = BN_D_PER_INT;


    BN_strip_lead_zeros(PINT_ bn, context);
    /* Check for definite big as your head overflow */
    if (bn->expn >= 0 && bn->expn + bn->digits > BN_D_PER_INT) {
        BN_EXCEPT(PINT_ BN_OVERFLOW, "bignum too large to fit in an int");
    }
    if (bn->expn < 0 && bn->expn + bn->digits > BN_D_PER_INT ) {

        BN_EXCEPT(PINT_ BN_OVERFLOW, "bignum too large to fit in an int");
    }

    /* if e>0, if we'll lose precision we'll also be too big, so lose
       above anyway.  On the other hand, with e<0, we can lose digits <
       . from this so need to check that we don't lose precision */
    if (bn->expn<0 && context->traps & BN_F_LOST_DIGITS) {
        BN_EXCEPT(PINT_ BN_LOST_DIGITS, "digits lost in conv -> int");
    }

    if (bn->digits + bn->expn > context->precision && context->precision > 0) {
        BN_EXCEPT(PINT_ BN_LOST_DIGITS, "digits lost in conv -> int");
    }

    /* luckily, we get to keep our digits, so let's get at 'em */
    if (bn->expn >= 0) {
        for (i = bn->digits-1; i>-1; i--) {
            result = result * 10 + BN_getd(bn, i);
        }
        for (i=0; i<bn->expn; i++) result = result * 10;
    } 
    else {
        for (i=bn->digits-1; i>-1-bn->expn; i--) {
            result = result * 10 + BN_getd(bn, i);
        }
    }
  
    return bn->sign ? -result : result;
}

INTVAL
BN_is_zero(BIGNUM* foo, BN_CONTEXT* context) {
    BN_really_zero(foo, context->extended);
    if (foo->digits == 1 && foo->expn == 0 && BN_getd(foo, 0) == 0) {
        return 1;
    }
    else {
        return 0;
    }
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
