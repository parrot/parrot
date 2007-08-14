#!perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/op/say.t - Testing the say pseudo-opcode

=head1 SYNOPSIS

    % prove t/op/say.t

=head1 DESCRIPTION

Tests various PMCs and registers with say.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal string' );
.sub main
    say "string literal"
.end
CODE
string literal
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal integer' );
.sub main
    say 42
.end
CODE
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a literal number' );
.sub main
    say 3.14
.end
CODE
3.14
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary string register' );
.sub main
    $S5 = "string register"
    say $S5
.end
CODE
string register
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary integer register' );
.sub main
    $I4 = 10
    say $I4
.end
CODE
10
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'say with a temporary number register' );
.sub main
    $N2 = 1.414
    say $N2
.end
CODE
1.414
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
