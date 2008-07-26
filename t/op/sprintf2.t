#!perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;

=head1 NAME

t/op/sprintf2.t - Auxilliary tests for the sprintf opcode

=head1 SYNOPSIS

    % prove t/op/sprintf2.t

=head1 DESCRIPTION

Executes sprintf tests that sprintf.t can't handle yet.

=cut

# [ 'format', [arguments], "expected output", 'description' ]
my @tests = (
  [ '<%*d>', [4,12], "<  12>\n", 'positive length' ],
  [ '<%*d>', [-4,12], "<12  >\n", 'negative length' ],
  [ '<%-*d>', [4,12], "<12  >\n", 'minus option, positive length' ],
  [ '|%c|%0c|%-1c|%1c|%-6c|%6c|%*c|%*c|', [65,65,65,65,65,65,3,65,-4,65],
    "|A|A|A|A|A     |     A|  A|A   |\n", 'misc w/ minus option' ],
  [ '<%*s>', [4,'"hi"'], "<  hi>\n", 'string, positive length' ],
  [ '<%*s>', [-4,'"hi"'], "<hi  >\n", 'string, negative length' ],
  [ '<%-*s>', [4,'"hi"'], "<hi  >\n", 'string, minus flag' ],
  [ '<%*.*f>', [7,2,123.456], "< 123.46>\n", 'float length&prec' ],
  [ '<%*.*f>', [-7,2,123.456], "<123.46 >\n", 'float -length&prec' ],
);

plan tests => scalar @tests;

foreach my $test (@tests) {
  my $code = ".sub main\n"
           . "  \$P0 = new 'ResizablePMCArray'\n";
  foreach my $arg (@{$$test[1]}) {
    $code .= "  push \$P0,$arg\n";
  }
  $code .= "  \$S0 = sprintf '$$test[0]', \$P0\n"
        .  "  say \$S0\n"
        .  ".end\n";
  pir_output_is( $code, $$test[2], $$test[3] );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
