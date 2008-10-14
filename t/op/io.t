#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/op/io.t - Testing io opcodes

=head1 SYNOPSIS

    % prove t/op/io.t

=head1 DESCRIPTION

Tests various io opcodes.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', 'open with null filename' );
.sub main
    push_eh failed
    $P0 = open $S0, '<'
    say 'never'
    goto finish
failed:
    say 'Catched'
finish:
.end
CODE
Catched
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'open with null mode' );
.sub main
    push_eh failed
    $P0 = open 'some_name', $S0
    say 'never'
    goto finish
failed:
    say 'Catched'
finish:
.end
CODE
Catched
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
