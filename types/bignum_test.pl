#! perl -w

# $Id$
#
# This allows a single bignum test to be run directly through the C
# library.  Usage available by getting the args wrong.

use lib "../lib";
use Inline C => Config => CCFLAGS => '-I.';
use Inline C => <<'END_OF_C_SECTION';
#include "bignum.c"

int runtest (char* lef, char *rih, int oper, int prec, int round, int extended) {
  BIGNUM *one, *two, *result;
  char *output;
  BN_CONTEXT context;
  char *traps[7] = {"Lost_digits","Division_by_zero","Inexact",
		    "Invalid_operation","Overflow","Rounded","Underflow"};

  context.elimit = 999999999;
  context.precision = prec;
  context.extended = extended;
  context.flags = 0;
  context.traps = 0;
  switch (round) {
  case 1 : context.rounding = ROUND_HALF_UP;
    break;
  case 2 : context.rounding = ROUND_DOWN;
    break;
  case 3 : context.rounding = ROUND_HALF_EVEN;
    break;
  case 4 : context.rounding = ROUND_CEILING;
    break;
  case 5 : context.rounding = ROUND_FLOOR;
    break;
  default : printf("Unknown rounding %i\n", round);
    exit(1);
  }

  one = BN_from_string(lef, &context);
  two = BN_from_string(rih, &context);

  result = BN_new(1);

  switch (oper) {
  case 1 : BN_add(result, one, two, &context);
    break;
  case 2 : BN_subtract(result, one, two, &context);
    break;
  case 3 : BN_plus(result, one, &context);
    break;
  case 4 : BN_minus(result, one, &context);
    break;
  case 5 : BN_compare(result, one, two, &context);
    break;
  case 6 : BN_multiply(result, one, two, &context);
    break;
  case 7 : BN_divide(result, one, two, &context);
    break;
  case 8 : BN_divide_integer(result, one, two, &context);
    break;
  case 9 : BN_remainder(result, one, two, &context);
    break;
  case 10: BN_rescale(result, one, two, &context);
    break;
  case 11: BN_power(result, one, two, &context);
    break;

  default : printf("No operation of type %i\n", oper);
    exit(0);
  }

  BN_to_scientific_string(result, &output);
  printf("%s", output);
  {
      int i;
      for (i=0; i< 7; i++)
	  if ((1 << i) & context.flags) printf(" %s", traps[i]);
  }
  printf("\n");
  return 1;
}
END_OF_C_SECTION

my %ops = (
	   add => 1,
	   subtract => 2,
	   plus => 3,
	   minus => 4,
	   compare => 5,
	   multiply => 6,
	   divide => 7,
	   divideint => 8,
	   remainder => 9,
	   rescale => 10,
	   power => 11,
	   );

my %round = (
	     half_up => 1,
	     down => 2,
	     half_even => 3,
	     ceiling => 4,
	     floor => 5,
	     );

unless (@ARGV == 6) {
    die <<ENDOFUSAGE;
bignum_test.pl -- run test through bignum.c
bignum_test.pl one two operation precision rounding extended
ENDOFUSAGE
}

for ($ARGV[0], $ARGV[1]) {
    s/^"|"$//g;
    s/""/\"/g;
    s/^'|'$//g;
    s/''/\'/g;
}

runtest($ARGV[0], $ARGV[1], $ops{$ARGV[2]}, $ARGV[3], $round{$ARGV[4]}, $ARGV[5]);

