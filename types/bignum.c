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

  This code is copyright Yet Another Society 2002.

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

/*=head1 When in parrot

When the library is used within parrot, all calls expect an additional
first argument of an interpreter, for the purposes of memory allocation,
some internal macros do not (getd/setd and CHECK(O|U)FLOW.

If you're being useful and inserting proper rapid fillins, start
with the BN_i* methods, but make sure any errors can still be
thrown.

=head2 TODO

Parrot string playing, exception raising

*/

/* * This lot wants to go in a (bignum specific seperate header file * */

/* Access digits, macros assume length given */
/*=head1 Access macros

=head2 BN_setd(BIGNUM*, pos, value)

Set digit at pos (zero is lsd) to value

=head2 BN_getd(BIGNUM*, pos)

Get value of digit at pos.

=cut*/
#define BN_setd(x, y, z) \
    ( x->buffer[(y) / BN_D_PER_NIB] = \
     ((z) << ( (y) % BN_D_PER_NIB)*4) | \
     (x->buffer[(y) / BN_D_PER_NIB] & ~(15<< ( (y) % BN_D_PER_NIB)*4))) 
#define BN_getd(x,y) \
    ( (x->buffer[(y) / BN_D_PER_NIB] >> \
     ( (y) % BN_D_PER_NIB)*4) & 15 )

#define CHECK_OVERFLOW(expn, add, max, msg) \
    if (max - expn < add) { BN_EXCEPT(PINT_ BN_OVERFLOW, msg); }
#define CHECK_UNDERFLOW(expn, sub, min, msg) \
    if (min - expn > (-sub)) { BN_EXCEPT(PINT_ BN_UNDERFLOW, msg); }

char* lazygdbprint(BIGNUM* foo) {
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

void
BN_idivide (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context,
	    BN_DIV_ENUM operation, BIGNUM* rem);
INTVAL BN_to_scieng_string(PINTD_ BIGNUM* bn, char **dest, int eng);
void BN_strip_lead_zeros(PINTD_ BIGNUM* victim);
void BN_strip_tail_zeros(PINTD_ BIGNUM* victim);
int BN_round_up(PINTD_ BIGNUM *victim, BN_CONTEXT* context);
int BN_round_down(PINTD_ BIGNUM *victim, BN_CONTEXT* context);
void BN_make_integer(PINTD_ BIGNUM* bn, BN_CONTEXT* context);
void BN_really_zero(PINTD_ BIGNUM* bn);
void
BN_arith_setup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore);
void
BN_arith_cleanup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore);
void BN_iadd(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void BN_isubtract(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context);
void BN_align(PINTD_ BIGNUM* one, BIGNUM* two);
int BN_comp (PINTD_ BIGNUM *one, BIGNUM *two);
int BN_iszero(PINTD_ BIGNUM* test);

/*=head1 Memory Management and BIGNUM creation

=cut*/

/*=head2 BIGNUM* BN_new(INTVAL length)

Create a new BN.  length is number of I<decimal> digits required.

=cut*/
BIGNUM* BN_new(PINTD_ INTVAL length) {
  BIGNUM* bn;
  bn = (BIGNUM*)BN_alloc(PINT_ sizeof(BIGNUM));
  if (NULL == bn)
    BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot allocate new BigNum");
  
  bn->nibs = 1 + length / BN_D_PER_NIB;
  bn->buffer = (BN_NIB*)BN_alloc(PINT_ sizeof(BN_NIB) * bn->nibs);
  if (NULL == bn->buffer)
    BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot allocate new BigNum");

  bn->sign = 0;
  bn->expn = 0;
  bn->digits = 1;

  return bn;
}

/*=head2 int BN_grow(BIGNUM *in, INTVAL length)

Grows in so that it can contain length I<decimal> digits.

=cut*/
void BN_grow(PINTD_ BIGNUM *in, INTVAL length) {
  assert(in != NULL);
  if (length <= in->nibs * BN_D_PER_NIB)
    return;

  if (length > BN_MAX_DIGITS)
    BN_EXCEPT(PINT_ BN_OVERFLOW, "Attempt to grow BIGNUM beyond limits");

  in->nibs = 1+ length / BN_D_PER_NIB;
  in->buffer = (BN_NIB*)BN_realloc(PINT_ in->buffer, sizeof(BN_NIB)* (in->nibs) );
  if (NULL==in->buffer)
    BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE, "Cannot grow BIGNUM");
  return;
}

/*=head2 int BN_destroy(BIGNUM *bn)

Frees the memory used by the BIGNUM.

=cut*/
void BN_destroy(PINTD_ BIGNUM *bn) {
  assert(bn!=NULL);

  BN_free(PINT_ bn->buffer);
  BN_free(PINT_ bn);
  return;
}

/*=head1 Getting data into a bignum

These functions are exported for code outside the library to use if it
wants.

=head2 BN_set_digit(BIGNUM* bn, INTVAL pos, int value)

Sets digit at pos (zero based) to value.  Number is grown if digits >
allocated space are accessed, but intermediate digits do not have
their value set to anything.  If I<pos> is beyond I<digits> then
I<digits> is also updated.

=cut*/
INTVAL BN_set_digit(PINT_ BIGNUM* bn, INTVAL pos, INTVAL value) {
  assert(bn != NULL);
  if (pos > bn->nibs * BN_D_PER_NIB)
    BN_grow(bn, pos);
  assert(value < 10);
  assert(value > -1);
  BN_setd(bn, pos, value);
  if (bn->digits < pos+1)
    bn->digits = pos+1;
  return value;
}

/*=head2 INTVAL BN_get_digit(BIGNUM* bn, INTVAL pos)

Get the value of the decimal digit at pos, returns -1 if pos is out of
bounds.

=cut*/
INTVAL BN_get_digit(PINTD_ BIGNUM* bn, INTVAL pos) {
  assert(bn != NULL);
  if (pos > bn->digits || pos < 0) return -1;
  return BN_getd(bn, pos);
}

/*=head2 BIGNUM *BN_copy(BIGNUM* one, BIGNUM* two)

Copies two into one, returning one for convenience.

=cut*/
BIGNUM* BN_copy(PINTD_ BIGNUM* one, BIGNUM* two) {
  assert(one != NULL); assert(two != NULL);

  BN_grow(PINT_ two, one->digits);
  memcpy((void*)one->buffer, (void*)two->buffer,
	 (1+two->digits / BN_D_PER_NIB) * sizeof(BN_NIB));
  one->digits = two->digits;
  one->expn = two->expn;
  one->sign = two->sign;
  return one;
}

/*=head2 BIGNUM* BN_new_from_int(INTVAL value)

Create a new bignum from a (signed) integer value (INTVAL)
We assume that the implementation limits are somewhat larger than
those required to store a single integer into a bignum.

=cut*/
BIGNUM* BN_new_from_int(PINTD_ INTVAL value) {
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

/*=head2 BN_PRINT_DEBUG(BIGNUM *bn, char *mesg)

Dump the bignum for testing (should the to_*_string versions be broked).

=cut*/
void BN_PRINT_DEBUG (BIGNUM *bn, char* mesg) {
  INTVAL i;
  printf("%s: nibs %i digits %i sign %i expn %i \n",mesg,
	 bn->nibs, bn->digits, bn->sign, bn->expn);
  for (i=bn->digits-1; i>-1; i--) {
    printf("%d", BN_getd(bn, i));
    if (!(i%5)) printf(" ");
    if (!(i%70)) printf("\n");
  }
  printf("\n");
}

/*=head2 void BN_exception(BN_EXCEPTIONS exception, char* message)

Throw `exception'.  Should be accessed via a BN_EXCEPT macro

=cut */
void BN_exception(PINTD_ BN_EXCEPTIONS exception, char* message) {
  printf("Exception %d %s\n", exception, message);
  exit(0);
}

/*=head1 Conversion to and from strings

=head2 INTVAL BN_to_scientific_string(BIGNUM* bn, char** dest)

Converts bn into a scientific representation, stored in dest.

=head2 INTVAL BN_to_engineering_string(BIGNUM* bn, char* dest)

Converts bn into a engineering representation, stored in dest.

These functions return char* strings only, parrot may want to
reimplement these so that locales and the like are nicely coped with.

Any reimplementation should be in a seperate file, this section of
the main file can be #ifdef'd out if this is done.

Memory pointed to by dest is not freed by this function.

=cut*/

INTVAL BN_to_scientific_string(PINTD_ BIGNUM*bn, char **dest) {
  BN_to_scieng_string(PINT_ bn, dest, 0);
}
INTVAL BN_to_engineering_string(PINTD_ BIGNUM*bn, char **dest) {
  BN_to_scieng_string(PINT_ bn, dest, 1);
}

INTVAL BN_to_scieng_string(PINTD_ BIGNUM* bn, char **dest, int eng) {
  char* cur;
  INTVAL adj_exp = 0; /* as bn->expn is relative to 0th digit */
  INTVAL cur_dig = 0;
  assert(bn!=NULL);
  *dest = (char*)BN_alloc(PINT_ bn->digits + 5 + BN_D_PER_INT);
  if (dest == NULL) {
    BN_EXCEPT(PINT_ BN_INSUFFICIENT_STORAGE,
	      "Cannot create buffer to hold output string");
  }

  cur = *dest;

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

/*=head2 BIGNUM* BN_from_string(char* string) 

Convert a scientific string to a BIGNUM.  This function deals entirely
with common-or-garden C byte strings, so the library can work
anywhere.  Another version will be eventually required to cope with
the parrot string fun.

This is the Highly Pedantic string conversion.

Does not yet check for exponent overflow.

=cut*/
BIGNUM* BN_from_string(PINTD_ char* s2) {
  BIGNUM *result;
  BIGNUM *temp;

  INTVAL pos = 0;             /* current digit in buffer */
  INTVAL negative = 0;        /* is it negative */
  INTVAL seen_dot = 0;        /* have we seen a '.' */
  INTVAL seen_e = 0;          /* have we seen an 'E' or 'e' */
  INTVAL exp_sign = 0;        /* is the exponent negative */
  INTVAL in_exp = 0;          /* are we reading exponent digits */
  INTVAL in_number = 0;       /* are we reading coeff digits */
  INTVAL exponent = 0;        /* the exponent */
  INTVAL fake_exponent = 0;   /* adjustment for digits after a '.' */
  INTVAL i = 0;               
  INTVAL non_zero_digits = 0; /* have we seen *any* digits */
  INTVAL seen_plus = 0;       /* was number prefixed with '+' */

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
	if (seen_plus || negative || seen_dot)
	  BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "Incorrect number format");
	negative = 1;
      }
      else if (*s2 == '.') {
	seen_dot = 1;
      }
      else if (*s2 == '+') {
	if (seen_plus || negative || seen_dot)
	  BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "Incorrect number format");
	seen_plus = 1; /* be very quiet */
      }
      else {
	BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "Incorrect number format");
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
	  BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "b Incorrect number format");
	}
      }
      else { /* We fall through here if we don't recognise something */
	BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "c Incorrect number format");
      }
    }
    s2++; /* rinse, lather... */
  }
  
  if (in_number && !pos) { /* Only got zeros */
    pos = 1;
    BN_setd(temp, 0, 0);
  }

  if (pos==0) { /* This includes ".e+20" */
    BN_EXCEPT(PINT_ BN_CONVERSION_SYNTAX, "no digits in string");
  }

  /* copy reversed string of digits backwards into result */
  temp->digits = pos;
  result = BN_new(pos+1);

  for (i=0; i< temp->digits; i++) {
    BN_setd(result, i, BN_getd(temp, temp->digits-i-1));
  }
  
  result->sign = negative;
  result->digits = pos;

  BN_destroy(PINT_ temp);

  if (exp_sign == -1) {
    result->expn = fake_exponent - exponent;
  }
  else {
    result->expn = fake_exponent + exponent;
  }

  BN_really_zero(PINT_ result);
  return result;
}


/*=head1 Arithmetic Operations

These do what they say on the tin, if no precision is supplied then
some appropriate global version is used instead.

=head2 Helper routines

=over 4

=item BN_strip_zeros(BIGNUM* victim)

Removes any zeros before the msd and after the lsd

=cut*/
void BN_strip_lead_zeros(PINTD_ BIGNUM* bn) {
  INTVAL msd, i;
  
  msd = bn->digits-1;

  while (0==BN_getd(bn, msd) && msd > 0) {
    msd--;
  }

  bn->digits -= bn->digits-1 - msd;

}

/*=item BN_strip_tail_zeros(BIGNUM *victim)

Removes trailing zeros and increases the exponent appropriately.
Does not remove zeros before the decimal point.

=cut*/

void BN_strip_tail_zeros(PINTD_ BIGNUM *bn) {
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
  CHECK_OVERFLOW( bn->expn, lsd, BN_EXPN_MAX, "overflow when striping zeros");
  bn->expn += lsd;
  bn->digits -= lsd;
}

/*=item BN_make_integer(BIGNUM* victim, BN_CONTEXT* context)

Convert the number to a plain integer *if* precision such that this
is possible.

=cut*/
void BN_make_integer(PINTD_ BIGNUM* bn, BN_CONTEXT* context) {
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
    return;
  }
}

/*=item BN_really_zero(BIGNUM* victim)

Sets any number which should be zero to a cannonical zero.

To check if a number is equal to zero, use BN_is_zero.

=cut*/
void BN_really_zero(PINTD_ BIGNUM* bn) {
  INTVAL i;
  for (i=0; i< bn->digits; i++)
    if (BN_getd(bn, i) != 0) return;
  
  bn->digits = 1;
  bn->expn = 0;
  bn->sign = 0;
  return;
}

/*=item BN_round(BIGNUM *victim, BN_CONTEXT* context)

Rounds victim according to context.

If I<precision> is negative 0, numbers are rounded at their decimal
point (this is *not* specified in the sda, but is useful for parrot).
If this would cause digits to be lost, and I<lost_digits> is true,
an appropriate exception is generated.

Round assumes that any leading zeros are significant (after an
addition operation, for instance).

=cut*/

int BN_round (PINTD_ BIGNUM *bn, BN_CONTEXT* context) {
  assert(bn!= NULL);
  assert(context != NULL);

  if (context->precision < 0) { /* Rounding a BigInt */
    BN_round_as_integer(PINT_ bn, context);
    return;
  }
  
  /* Rounding a BigNum or sdaNum*/
  if (bn->digits > context->precision) {
    if (context->lost_digits) {
      INTVAL digit;
      for (digit = 0; digit < bn->digits - context->precision; digit++) {
	if (BN_getd(bn, digit) != 0)
	  BN_EXCEPT(PINT_ BN_LOST_DIGITS, "information lost while rounding" );
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
	    if (BN_getd(bn, i) != 0) return BN_round_up(PINT_ bn, context);
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
    BN_EXCEPT(PINT_ BN_INVALID_OPERATION, "Unknown rounding attempted");
  }
  return;
}

int BN_round_up(PINTD_ BIGNUM *bn, BN_CONTEXT* context) {
  INTVAL i, carry;

  carry = 1;
  for (i = bn->digits - context->precision; i< bn->digits; i++) {
    carry += BN_getd(bn, i);
    BN_setd(bn, i-bn->digits + context->precision, carry%10);
    carry = carry / 10;
  }
  if (carry) {
    INTVAL extra = bn->digits - context->precision;
    BN_setd(bn, context->precision, carry);
    CHECK_OVERFLOW(bn->expn, extra, BN_EXPN_MAX,
		   "overflow while rounding");
    bn->expn += extra;
    bn->digits = context->precision +1;
    return BN_round(PINT_ bn, context);
  }
  else {
    INTVAL extra = bn->digits - context->precision;
    CHECK_OVERFLOW(bn->expn, extra, BN_EXPN_MAX,
		   "overflow while rounding");
    bn->expn += extra;
    bn->digits = context->precision;
    return;
  }
}

int BN_round_down(PINT_ BIGNUM *bn, BN_CONTEXT* context) {
  INTVAL i =0;
  INTVAL extra;

  for (i=0; i<context->precision; i++) {
    int temp = BN_getd(bn, i+bn->digits - context->precision);
    BN_setd(bn, i, temp);
  }
  extra = bn->digits - context->precision;
  CHECK_OVERFLOW(bn->expn, extra, BN_EXPN_MAX,
		 "overflow while rounding");
  bn->expn += extra;
  bn->digits = context->precision;

  return;
}

/*=back*/

/*=head2 BN_round_as_integer(BIGNUM* bn, BN_CONTEXT* context)

Removes any digits after the decimal point, warns if lost_digits.

=cut*/
void BN_round_as_integer(PINTD_ BIGNUM *bn, BN_CONTEXT *context) {
  INTVAL i;
  BN_CONTEXT temp_context;

  if (bn->expn < 0) {
    if (context->lost_digits) {
      /* Are we losing information? */
      for (i=0; i<-bn->expn && i<bn->digits; i++) {
	if (BN_getd(bn, i) != 0)
	  BN_EXCEPT(BN_LOST_DIGITS, "truncating IntVal");
      }
    }

    /* We'll cheat by passing a false context to the normal rounding.
       If "precision" < 1, we add a false zero to front and set p to 1 */
    temp_context = *context;
    temp_context.precision = bn->digits + bn->expn;
    if (temp_context.precision < 1) {
      temp_context.precision = 1;
      BN_grow(bn, bn->digits + 1);
      BN_setd(bn, bn->digits, 0);
      bn->digits++;
      BN_round(PINT_ bn, &temp_context);
    }
    else {
      BN_round(PINT_ bn, &temp_context);
    }
    BN_really_zero(PINT_ bn);

    /* XXX: if using warning flags on context, | with temp context here */
  }

  return;
}


/*=head1 Arithmetic operations 

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

=cut*/

/*=head2 BN_arith_setup(result, one, two, context, &restore)

rounds one and two ready for arithmetic operation.

We assume that an operation might extend the digit buffer with zeros
on either side, but not tamper with the actual digits of the number,
we can then easily return the number to the correct (but still rounded)
representation in _cleanup later

If you can promise that you will not modify the representation of one
and two during your operation, then you may pass &restore as a NULL
pointer to both setup and cleanup.

=cut*/
void
BN_arith_setup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore) {
  BN_strip_lead_zeros(PINT_ one);
  BN_strip_lead_zeros(PINT_ two);
  BN_round(PINT_ one, context);
  BN_round(PINT_ two, context);
  if (restore) {
    restore->one = *one;
    restore->two = *two;
  }
}

/*=head2 BN_arith_cleanup(result, one, two, context, &restore)

Rounds result, one, two, checks for zeroness and makes integers.
Fixes one and two so they don't gain precision by mistake.

=cut*/
void
BN_arith_cleanup(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context, BN_SAVE_PREC* restore) {
  INTVAL i;
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
  BN_round(PINT_ result, context);
  BN_strip_lead_zeros(PINT_ result);
  BN_really_zero(PINT_ result);
  BN_make_integer(PINT_ result, context);
}

/*=head2 BN_align(BIGNUM* one, BIGNUM* two) 

Adds zero digits so that decimal points of each number are at the same
place.

=cut*/
void BN_align(PINTD_ BIGNUM* one, BIGNUM* two) {
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
/*=head2 BN_add(BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context)

=cut*/
void
BN_add(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  BN_SAVE_PREC restore;

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
}

/* Actual addition code, assumes two positive operands and
   an allocated result object and context */
void BN_iadd (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  INTVAL i;
  int carry, dig;

  /* Make sure we don't do work we don't need, or add precision where
     it isn't wanted */
  if (BN_is_zero(PINT_ one)) {
    BN_copy(PINT_ result, two);
    result->sign = 0;
    return;
  }
  else if (BN_is_zero(PINT_ two)) {
    BN_copy(PINT_ result, one);
    result->sign = 0;
    return;
  }

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
}

/*=head2 BN_subtract(BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context)

=cut*/
void
BN_subtract(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  BN_SAVE_PREC restore;
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
}

void
BN_isubtract (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  INTVAL i;
  int carry, dig;
  /* Make sure we don't do work we don't need, or add precision where
     it isn't wanted */
  if (BN_is_zero(PINT_ one)) {
    BN_copy(PINT_ result, two);
    result->sign = 1;
    return;
  }
  else if (BN_is_zero(PINT_ two)) {
    BN_copy(PINT_ result, one);
    result->sign = 0;
    return;
  }

  BN_align(PINT_ one, two);

  /* as a-b == -(b-a), we find larger of a and b and make sure it is in one */
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

/*=head2 BN_plus(result, one, context) 

Perform unary + on one.  Does all the rounding and what have you.

=cut*/
void BN_plus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context) {
  BN_arith_setup(PINT_ result, one, one, context, NULL);
  BN_copy(PINT_ result, one);
  BN_arith_cleanup(PINT_ result, one, one, context, NULL);
}

/*=head2 BN_minus(result, one, context) 

Perform unary - on one.  Does all the rounding and what have you.

=cut*/
void BN_minus(PINTD_ BIGNUM* result, BIGNUM *one, BN_CONTEXT *context) {
  BN_arith_setup(PINT_ result, one, one, context, NULL);
  BN_copy(PINT_ result, one);
  result->sign = result->sign ? 0 : 1;
  BN_arith_cleanup(PINT_ result, one, one, context, NULL);
}

/*=head2 BN_compare(result, one, two, context)

Numerically compares one and two, storing the result (as a BIGNUM) in
result.

 result = 1  => one > two
 result = -1 => two > one
 result = 0  => one == two

This probably wants to use BN_comp internally.

=cut*/
void
BN_compare (PINT_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  INTVAL i,j;
  int cmp;
  
  BN_arith_setup(PINT_ result, one, two, context, NULL);
  result->digits = 1;
  result->expn = 0;

  if (one->sign != two->sign) {
    result->sign = one->sign;
    BN_setd(result, 0, 1);
  }
  else if (one->expn + one->digits > two->expn + two->digits) {
    result->sign = one->sign;
    BN_setd(result, 0, 1);
  }
  else if (one->expn + one->digits < two->expn + two->digits) {
    result->sign = one->sign ? 0:1;
    BN_setd(result, 0, 1);
  }
  else { /* Same sign, same "size" */
    for (i=0; i<one->digits && i<two->digits; i++) {
      cmp = BN_getd(one, one->digits-1-i) - BN_getd(two, two->digits-1-i);
      if (cmp) break;
    }
    if (!cmp) {
      if (i==one->digits) {
	for (i=i; i<two->digits; i++) {
	  cmp = 0-BN_getd(two, two->digits-1-i);
	  if (cmp) break;
	}
      }
      else if (i==two->digits) {
	for (i=i; i<one->digits; i++) {
	  cmp = BN_getd(one, one->digits-1-i);
	  if (cmp) break;
	}
      }
    }
    /* now check the value of cmp */
    if (cmp > 0) {
      result->sign = one->sign;
      BN_setd(result, 0, 1);
    }
    else if (cmp < 0) {
      result->sign = one->sign ? 0 : 1;
      BN_setd(result, 0, 1);
    }
    else {
      result->sign = 0;
      BN_setd(result,0,0);
    }
  }

  BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/*=head2 BN_multiply(result, one, two, context) 

Multiplies one and two, storing the result in result.

=cut*/
void 
BN_multiply (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  INTVAL i,j;
  int carry, dig;

  BN_arith_setup(PINT_ result, one, two, context, NULL);

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
  CHECK_OVERFLOW(result->expn, i, BN_EXPN_MAX, "overflow in multiplication");
  CHECK_UNDERFLOW(result->expn,-i, BN_EXPN_MIN, "underflow in multipliaction");
  result->expn = i;
  
  result->sign = 1 & (one->sign ^ two->sign);

  BN_strip_lead_zeros(PINT_ result);
  BN_arith_cleanup(PINT_ result, one, two, context, NULL);

}

/*=head2 BN_divide(result, one, two, context)

Divide two into one, storing up to I<precision> digits in result.
Performs own rounding.  We also assume that this function B<will not
be used> to produce a BigInt.  That is the job of divide_integer.

If you want to divide two integers to produce a float, you must
do so with I<precision> greater than the number of significant
digits in either operand.

=cut*/

void BN_divide(PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  BIGNUM* rem = BN_new(PINT_ 1);
  BN_arith_setup(PINT_ result, one, two, context, NULL);
  BN_idivide(PINT_ result, one, two, context, BN_DIV_DIVIDE, rem);

  /* Use rem to work out things like rounding here, we'll do our
     own clean up as it's all a little odd */

  BN_strip_lead_zeros(PINT_ result);

  if (context->rounding == ROUND_HALF_EVEN) {
    if (result->digits > context->precision) {
      if (context->lost_digits) {
	BN_EXCEPT(PINT_ BN_LOST_DIGITS, "digits lost after division");
      }
      /* We collected precision + 1 digits... */
      BN_really_zero(PINT_ rem);
      if (BN_getd(result, 0) > 5) {
	BN_round_up(PINT_ result, context);
      }
      else if (BN_getd(result, 0) == 5) {
	if (rem->digits == 0 && BN_getd(rem, 0)==0) {
	  switch (BN_getd(result, 1)) {
	  case 0:
	  case 2:
	  case 4:
	  case 6:
	  case 8:
	    BN_round_down(PINT_ result, context);
	    break;
	  default :
	    BN_round_up(PINT_ result, context);
	  }
	}
	else {
	  BN_round_up(PINT_ result, context);
	}
      }
      else {
	BN_round_down(PINT_ result, context);
      }
    }
    
  }
  else { /* Other roundings just need digits to play with */
     BN_round(PINT_ result, context);
  }

  BN_really_zero(PINT_ result);

  BN_strip_tail_zeros(PINT_ result);

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
    CHECK_OVERFLOW(result->expn, i, BN_EXPN_MAX, "overflow in divide");
    result->expn += i;
  }
  
  BN_destroy(PINT_ rem);
}

/*=head2 BN_divide_integer(result, one, two, context)

Places the integer part of one / two into result.

=cut*/
void
BN_divide_integer (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  BIGNUM* rem = BN_new(PINT_ 1);
  BN_arith_setup(PINT_ result, one, two, context, NULL);
  BN_idivide(PINT_ result, one, two, context, BN_DIV_DIVINT, rem);
  
  BN_really_zero(PINT_ rem);
  if (result->expn >0 && context->precision > 0 &&
      result->expn + result->digits > context->precision &&
      !(rem->digits == 0 && BN_getd(rem, 0) == 0)) {
    BN_EXCEPT(PINT_ BN_DIVISION_IMPOSSIBLE,
	      "divide-integer requires more precision than available");
  }
  BN_destroy(PINT_ rem);
  if (result->expn != 0) {
    INTVAL i;
    BN_grow(PINT_ result, result->expn + result->digits);
    for (i=0; i<result->digits; i++) {
      BN_setd(result, result->expn + result->digits -1 -i, BN_getd(result, i));
    }
    for (i=0; i<result->expn; i++) {
      BN_setd(result, i ,0);
    }
    result->digits += result->expn;
    result->expn = 0;
  }

  BN_really_zero(PINT_ result);
  BN_make_integer(PINT_ result, context);
}

/*=head2 BN_remainder(result, one, two, context)

places the remainder from divide-integer (above) into result.

=cut*/
void
BN_remainder (PINTD_ BIGNUM* result, BIGNUM *one, BIGNUM *two, BN_CONTEXT *context) {
  BIGNUM* fake;

  if (BN_is_zero(PINT_ one)) {
    result->digits = 1;
    result->sign = 0;
    BN_setd(result, 0, 0);
    return;
  }

  BN_arith_setup(PINT_ result, one, two, context, NULL);
  fake = BN_new(1);
  BN_idivide(PINT_ fake, one, two, context, BN_DIV_REMAIN, result);

  BN_really_zero(PINT_ result);
  if (fake->expn >0 && context->precision > 0 &&
      fake->expn + result->digits > context->precision &&
      !(result->digits == 0 && BN_getd(result, 0) == 0)) {
    BN_EXCEPT(PINT_ BN_DIVISION_IMPOSSIBLE,
	      "remainder requires more precision than available");
  }


  BN_destroy(PINT_ fake);

  result->sign = one->sign;

  BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/* Does the heavy work for the various division wossnames */
void
BN_idivide (PINT_ BIGNUM* result, BIGNUM *one, BIGNUM *two,
            BN_CONTEXT *context, BN_DIV_ENUM operation, BIGNUM* rem){
  INTVAL i, j, divided, newexpn;
  BIGNUM *div,*t1, *t2;
  int s2, value;

  /* Are we doing something stupid, can we skip all the hassle? */
  if (one->digits == 1 && BN_getd(one, 0)==0) {
    if (two->digits == 1 && BN_getd(two, 0)==0){
      BN_EXCEPT(PINT_ BN_DIVISION_UNDEFINED, "0/0 in division");
    }
    result->digits = 1;
    result->sign = 0;
    BN_setd(result, 0, 0);
    return;
  }
  if (two->digits == 1) {
    if (BN_getd(two, 0)==0) {
      BN_EXCEPT(PINT_ BN_DIVISION_BY_ZERO, "x/0 in division");
    }
  }
  /* That's quite enough shortcuts for now... */

  /* Make some temporaries, set all signs to positive for simplicity */
  /* We use result as a tempory, and store the reversed result in t2 */
  div = BN_new(PINT_ 1);
  BN_copy(PINT_ div, one);
  BN_copy(PINT_ rem, div); /* In case doing int-div and don't div*/
  div->sign = 0;
  t1 = BN_new(PINT_ 1);
  t2 = BN_new(PINT_ 1);
  BN_grow(PINT_ t2, context->precision + 1);
  t2->digits = 0;
  s2 = two->sign;
  two->sign = 0;
  result->digits = 1;
  rem->digits = 1;

  /* First position to try to fill */
  newexpn = one->digits + one->expn - two->digits - two->expn;
  CHECK_OVERFLOW(t1->expn, newexpn, BN_EXPN_MAX, "overflow in divide");
  CHECK_UNDERFLOW(t1->expn, -newexpn, BN_EXPN_MIN, "underflow in divide");
  t1->expn = newexpn;

  value = 0;
  for (;;) {
    if ((operation == BN_DIV_DIVINT || operation == BN_DIV_REMAIN) &&
	t1->expn < 0) break;
    divided = 0;
    for (j=1; j<=10;j++) {
      int cmp;
      BN_setd(t1, 0, j);
      BN_multiply(PINT_ result, t1, two, context);
      cmp = BN_comp(PINT_ result, div);
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
      BN_multiply(PINT_ result, t1, two, context);
      BN_isubtract(PINT_ rem, div, result, context);
    }
    /* Are we done yet? */
    if (value && rem->digits ==1 && BN_getd(rem, 0)==0) break;
    if (t2->digits == context->precision +1 && context->precision >0) break;
    if (operation == BN_DIV_DIVINT|| operation == BN_DIV_REMAIN) {
      if (t1->expn ==0) break;
    }
    CHECK_OVERFLOW(t1->expn, 1, BN_EXPN_MAX, "overflow in divide");
    CHECK_UNDERFLOW(t1->expn, -1, BN_EXPN_MIN, "underflow in divide");
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
int BN_comp (PINTD_ BIGNUM *one, BIGNUM *two) {
  INTVAL i,j;
  int cmp;

  BN_strip_lead_zeros(PINT_ one);
  BN_strip_lead_zeros(PINT_ two);

  if (one->sign != two->sign) {
    return one->sign ? 1 : -1;
  }
  else if (one->expn + one->digits > two->expn + two->digits) {
    return one->sign ? -1 : 1;
  }
  else if (one->expn + one->digits < two->expn + two->digits) {
    return one->sign ? 1 : -1;
  }
  else { /* Same sign, same "size" */
    for (i=0; i<one->digits && i<two->digits; i++) {
      cmp = BN_getd(one, one->digits-1-i) - BN_getd(two, two->digits-1-i);
      if (cmp) return cmp;
    }
    if (!cmp) {
      if (i==one->digits) {
	for (i=i; i<two->digits; i++) {
	  cmp = 0-BN_getd(two, two->digits-1-i);
	  if (cmp) return cmp;
	}
      }
      else if (i==two->digits) {
	for (i=i; i<one->digits; i++) {
	  cmp = BN_getd(one, one->digits-1-i);
	  if (cmp) return cmp;
	}
      }
      return cmp;
    }
  }
}

/*=head2 BN_power(result, bignum, expn, context)

Calculate result = bignum ** expn;

XXX To Do

=cut*/
void BN_power(PINTD_ BIGNUM* result, BIGNUM* bignum,
              BIGNUM* expn, BN_CONTEXT* context) {

  BN_arith_setup(PINT_ result, bignum, expn, context, NULL);


  BN_arith_cleanup(PINT_ result, bignum, expn, context, NULL);
}

/*=head2 BN_rescale(result, bignum, expn, context)

Rescales bignum to have an exponent of expn.

XXX To Do

=cut*/
void BN_rescale(PINTD_ BIGNUM* result, BIGNUM* one, BIGNUM* two, BN_CONTEXT* context) {
  INTVAL expn;
  INTVAL lost = context->lost_digits;

  BN_arith_setup(PINT_ result, one, two, context, NULL);

  context->lost_digits = 1;
  expn = BN_to_int(PINT_ two, context);
  context->lost_digits = lost;

  BN_arith_cleanup(PINT_ result, one, two, context, NULL);
}

/*=head2 INTVAL BN_to_int(BIGNUM* bignum, BN_CONTEXT* context)

Converts the bignum into an integer, raises overflow if an exact
representation cannot be created.

=cut*/
INTVAL BN_to_int(PINT_ BIGNUM* bn, BN_CONTEXT* context) {
  INTVAL insig, i;
  INTVAL result = 0;
  INTVAL maxdigs = BN_D_PER_INT < context->precision ?
                   BN_D_PER_INT : context->precision;
  if (context->precision < 0) maxdigs = BN_D_PER_INT;


  BN_strip_lead_zeros(PINT_ bn);
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
  if (bn->expn<0 && context->lost_digits) {
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

int BN_is_zero(BIGNUM* foo) {
  BN_really_zero(foo);
  if (foo->digits == 1 && foo->expn == 0 && BN_getd(foo, 0) == 0) {
    return 1;
  }
  else {
    return 0;
  }
}
