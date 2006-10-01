#!perl
# $Id$

=head1 NAME

t/pmc/bignum.t - Test the non-implemented BigNum PMC.

=head1 DESCRIPTION

Does nothing yet, as there is no BigNum PMC yet.

The idea is to run the test cases parsed out of *.decTest, available
from: http://www2.hursley.ibm.com/decimal/dectest.html

=head1 HISTORY

This was started by Alex Gogh, who went to work in Antarctica, http://the.earth.li/~alex/halley/.
The script was supposed to test bignum.c, which should become the basis for a
BigNum PMC.
 
=head1 TODO

This is very broken.

==head1 SEE ALSO

F<docs/docs/pdds/clip/pdd14_bignum.pod>,
L<https://rt.perl.org/rt3/Ticket/Display.html?id=36330>

=cut

use Test::More skip_all => 'No BigNum support yet.';

my ($test, $one, $two, $result, $prec, $round, $maxexp,
    $skip ,$op, @conds, $line, $arrow);

my ($testsrun, $testspass, $testsfail, $extended) = (0,0,0,0);
$maxexp = 999999999;
while (<>) {
    chomp;
    next if /^\s*--/;
    s/\s*--.*$//; # and hope it's not quoted
    next unless /\S/;
    /^precision:\s+(\d+)/ && do {
	$precision = $1; next;
    };
    /^rounding:\s*(\w+)/ && do {
	$round =$1; next;
    };
    /^extended:\s*(\d+)/ && do {
	$extended = $1;next;
    };
    /^version/ && next;
    /^maxexponent:\s*(\d+)/i && do {
	$expskip = 1 if ($1 > $maxexp);
	if ($1 <= $maxexp) {
	    $expskip = 0;
	}
	next;
    };

    ($test, $op, $one, $two,$arrow, $result, @conds) = split(/\s+/, $_);

    # skip null tests
    if ($one eq '#' || $two eq '#') {
	print "$test ok \# skip, null test\n";
	next;
    } 
    
    if ($round !~ /^(half_up|half_even|down|floor|ceiling)$/) {
	print "$test ok \# skip, $round not available\n";
	next;
    }

    if ($op =~ /^(power|rescale)$/) {
	print "$test ok \# skip, $op not implemented\n";
	next;
    }

    if ($two eq '->') { # unary op
	unshift(@conds, $result) if defined $result;
	($two, $result, @conds) = ('0', $arrow,@conds);
    }

    if (!defined($result)) {
	print "$test skip\n";
	next;
    }

    if ($expskip) {
	print "$test ok \# skip\n";
	next;
    }

    for ($one, $two, $result) {
	s/^'|'$//g;
    }

    $testsrun += 2;
    my ($output) = run_single_test( $one $two $op $precision $round $extended );
    chomp($output);
    my @out = split(/\s+/, $output);
    if ($result eq $out[0] || ($result eq '?')) {
	print "$test ok\n";
	$testspass++;
    }
    else {
	print "$test not ok\n";
	print "  $one $op $two\n    (p:$precision r:$round)\n";
	print " => `",join("'`",@out),"'\n";
	print " ex `$result', ", (@conds ? join(" ", @conds):'-'), "\n";
	$testsfail++;
    }
    # check flag status
    my (%conds, %outs);
    my $tpass = 0;
    if (@conds) {
	# need to map conditions, as signals and conditions don't quite mesh
	my %map = (Division_impossible => 'Invalid_operation',
		   Division_undefined => 'Invalid_operation');
	foreach (@conds) {
	    if ($map{$_}) {
		$_ = $map{$_};
	    }
	}
	if (@out >1) {
	    $conds{$_} = 1 foreach @conds;
	    $outs{$_} = 1 foreach @out[1..(@out-1)];
	    $tpass = 1;
	    foreach (keys %conds) {
		$tpass = 0 unless $outs{$_};
	    }
	    foreach (keys %outs) {
		$tpass = 0 unless $conds{$_};
	    }
	}
    }
    elsif (@out == 1) {
	$tpass = 1;
    }

    if ($tpass) {
	print "$test ok\n";
	$testspass++;
    }
    else {
	print "$test not ok\n";
	print "  $one $op $two\n    (p:$precision r:$round)\n";
	print " => `",join("'`",@out),"'\n";
	print " ex `$result', ", (@conds ? join(" ", @conds):'-'), "\n";
	$testsfail++;
    }

}









# XXX The following used to be bignum_test.pl.
# Maybe it should be factored out to Parrot::Test::BigNum.

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

sub run_single_test
{
    unless (@_ == 6) {
    die <<ENDOFUSAGE;
bignum_test.pl -- run test through bignum.c
bignum_test.pl one two operation precision rounding extended
ENDOFUSAGE
    }

    for ($_[0], $_[1]) {
        s/^"|"$//g;
        s/""/\"/g;
        s/^'|'$//g;
        s/''/\'/g;
    }

    # XXX Capture STDOUT
    runtest($_[0], $_[1], $ops{$ARGV[2]}, $_[3], $round{$_[4]}, $_[5]);
}
