#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id: capture.t 14969 2006-10-18 20:37:34Z particle $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/pmc/capture.t - Test the Capture PMC

=head1 SYNOPSIS

    % prove t/pmc/capture.t

=head1 DESCRIPTION

Tests the C<Capture> PMC. Checks integer and key access using
a variety of keys and values.

=cut

my $PRE= <<PRE;
.sub 'test' :main
    .local pmc capt
    capt = new .Capture
PRE

my $POST= <<POST;
    goto end
  nok:
    print 'not '
  ok:
    say 'ok'
  end:
.end
POST


pir_output_is($PRE.<<'CODE'.$POST, <<'OUT', 'new');
CODE
OUT


pir_output_is(<<'CODE', <<'OUTPUT', "Basic capture tests");
.sub main :main
    .local pmc capt
    capt = new .Capture

    capt[0] = 0
    capt[1] = 1.5
    capt[2] = 'two'
    $P0 = new .Integer
    $P0 = 3
    capt[3] = $P0

    push capt, 4
    push capt, 5.5
    push capt, 'six'
    $P0 = new .Integer
    $P0 = 7
    push capt, $P0

    unshift capt, 8
    unshift capt, 9.5
    unshift capt, 'ten'
    $P0 = new .Integer
    $P0 = 11
    unshift capt, $P0

    capt['alpha'] = 12
    capt['beta'] = 13.5
    capt['gamma'] = 'fourteen'
    $P0 = new .Integer
    $P0 = 15
    capt['delta'] = $P0

    $I0 = elements capt
    print $I0
    print "\n"

    $I0 = capt[11]
    print $I0
    print " "
    $P0 = capt[10]
    print $P0
    print " "
    $N0 = capt[9]
    print $N0
    print " "
    $S0 = capt[8]
    say $S0

    $I0 = pop capt
    print $I0
    print " "
    $P0 = pop capt
    print $P0
    print " "
    $N0 = pop capt
    print $N0
    print " "
    $S0 = pop capt
    say $S0

    $I0 = elements capt
    print $I0
    print "\n"

    $I0 = shift capt
    print $I0
    print " "
    $P0 = shift capt
    print $P0
    print " "
    $N0 = shift capt
    print $N0
    print " "
    $S0 = shift capt
    say $S0

    $I0 = elements capt
    print $I0
    print "\n"

  loop:
    $I0 = elements capt
    if $I0 < 1 goto end
    $P0 = pop capt
    say $P0
    goto loop
  end:

    $I0 = capt['delta']
    print $I0
    print " "
    $P0 = capt['gamma']
    print $P0
    print " "
    $N0 = capt['beta']
    print $N0
    print " "
    $S0 = capt['alpha']
    say $S0

.end

CODE
12
7 six 5.500000 4
7 six 5.500000 4
8
11 ten 9.500000 8
4
3
two
1.5
0
15 fourteen 13.500000 12
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "defined, delete, exists");
.sub main :main
    .local pmc capt
    capt = new .Capture

    $I0 = defined capt[2]
    $I1 = exists capt[2]
    print $I0
    print " "
    print $I1
    print "\n"

    $I0 = defined capt['alpha']
    $I1 = exists capt['alpha']
    print $I0
    print " "
    print $I1
    print "\n"

    capt[2] = 1
    capt['alpha'] = 1
    $P0 = new .Undef
    capt['beta'] = $P0

    $I0 = defined capt[2]
    $I1 = exists capt[2]
    print $I0
    print " "
    print $I1
    print "\n"

    $I0 = defined capt['alpha']
    $I1 = exists capt['alpha']
    print $I0
    print " "
    print $I1
    print "\n"

    $I0 = defined capt[1]
    $I1 = exists capt[1]
    print $I0
    print " "
    print $I1
    print "\n"

    $I0 = defined capt['beta']
    $I1 = exists capt['beta']
    print $I0
    print " "
    print $I1
    print "\n"

    delete capt[2]
    delete capt['alpha']

    $I0 = defined capt[2]
    $I1 = exists capt[2]
    print $I0
    print " "
    print $I1
    print "\n"

    $I0 = defined capt['alpha']
    $I1 = exists capt['alpha']
    print $I0
    print " "
    print $I1
    print "\n"


.end
CODE
0 0
0 0
1 1
1 1
0 1
0 1
0 0
0 0
OUTPUT


pir_output_is($PRE.<<'CODE'.$POST, <<'OUTPUT', "get_hash, get_array");
    $P0 = capt.'get_array'()
    $P1 = capt.'get_hash'()

    $S0 = typeof $P0
    $S1 = typeof $P1

    say $S0
    say $S1
CODE
ResizablePMCArray
Hash
OUTPUT


pir_output_like($PRE.<<'CODE'.$POST, <<'OUT', 'get_integer not implemented');
    I0 = capt
CODE
/get_integer\(\) not implemented in class 'Capture'/
OUT


pir_output_like($PRE.<<'CODE'.$POST, <<'OUT', 'get_string not implemented');
    S0 = capt
CODE
/get_string\(\) not implemented in class 'Capture'/
OUT


pir_output_like($PRE.<<'CODE'.$POST, <<'OUT', 'get_number not implemented');
    N0 = capt
CODE
/get_number\(\) not implemented in class 'Capture'/
OUT


pir_output_is(<<'CODE', <<'OUTPUT', '*_keyed_int delegation');
.sub main :main
    $P0 = subclass 'Capture', 'Match'
    $P1 = new 'Match'
    $P1[1] = 1
    $I0 = elements $P1
    print $I0
    print "\n"
.end
CODE
2
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'get_array method delegation');
.sub main :main
    $P0 = subclass 'Capture', 'Match'
    addattribute $P0, '$.abc'
    addattribute $P0, '$.xyz'
    $P1 = new 'Match'
    $P1[1] = 1

    $P2 = new .String
    setattribute $P1, '$.abc', $P2
    $P2 = new .String
    setattribute $P1, '$.xyz', $P2

    $P2 = $P1.'get_array'()
    $P2 = 0
    $I0 = elements $P2
    print $I0
    print "\n"
.end
CODE
0
OUTPUT




# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
