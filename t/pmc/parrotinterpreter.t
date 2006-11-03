#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/parrotinterpreter.t - test the ParrotInterpreter PMC


=head1 SYNOPSIS

    % prove t/pmc/parrotinterpreter.t

=head1 DESCRIPTION

Tests the ParrotInterpreter PMC.

=cut


pir_output_is(<<'CODE', <<'OUT', 'new');
.sub 'test' :main
    new P0, .ParrotInterpreter
    print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', 'runinterp_p_p: runs passed code pmc in another interpreter');
.sub main :main
    $S0 = <<"PIR"
.sub test :main
    print "Hello, world\\n"
.end
PIR
    # Compile it.
    $P0 = compreg "PIR"
    $P1 = $P0($S0)
    # Invoke in different interpreter.
    $P2 = new .ParrotInterpreter
    runinterp $P2, $P1
    print "survived\n"
.end
CODE
Hello, world
survived
OUT

# XXX: this is totally weird, and probably a bug in C<say> but the test remains here until it's looked into
pir_output_is(<<'CODE', <<'OUT', 'runinterp_p_p: runs passed code pmc in another interpreter (C<say> fails)');
.sub 'main' :main
     $S0 = <<'PIR'
 .sub 'main' :main
     say "help, i'm stuck inside an interpreter!"
 .end
 PIR
     $P0 = new .ParrotInterpreter
     $P1 = compreg 'PIR'
     $P2 = $P1($S0)
     runinterp $P0, $P2
     say "nobody cares."
 .end
CODE
help, i'm stuck inside an interpreter!
nobody cares.
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
