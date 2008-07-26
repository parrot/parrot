#!perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/op/sprintf2.t - Auxilliary tests for the sprintf opcode

=head1 SYNOPSIS

    % prove t/op/sprintf2.t

=head1 DESCRIPTION

Executes sprintf tests that sprintf.t can't handle yet.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'positive length' );
.sub main
    $P0 = new 'ResizableIntegerArray'
    push $P0, 4
    push $P0, 12
    $S0 = sprintf "<%*d>", $P0
    say $S0
.end
CODE
<  12>
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'negative length' );
.sub main
    $P0 = new 'ResizableIntegerArray'
    push $P0, -4
    push $P0, 12
    $S0 = sprintf "<%*d>", $P0
    say $S0
.end
CODE
<12  >
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'minus option, positive length' );
.sub main
    $P0 = new 'ResizableIntegerArray'
    push $P0, 4
    push $P0, 12
    $S0 = sprintf "<%-*d>", $P0
    say $S0
.end
CODE
<12  >
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'misc w/ minus option' );
.sub main
    $P0 = new 'ResizableIntegerArray'
    push $P0, 65
    push $P0, 65
    push $P0, 65
    push $P0, 65
    push $P0, 65
    push $P0, 65
    push $P0, 3
    push $P0, 65
    push $P0, -4
    push $P0, 65

    $S0 = sprintf "|%c|%0c|%-1c|%1c|%-6c|%6c|%*c|%*c|", $P0
    say $S0
.end
CODE
|A|A|A|A|A     |     A|  A|A   |
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
