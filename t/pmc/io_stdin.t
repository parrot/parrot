#! perl
# Copyright (C) 2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More tests => 3;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/pmc/stdin-io.t - IO Ops from stdin

=head1 SYNOPSIS

    % prove t/pmc/io_stdin.t

=head1 DESCRIPTION

Tests the Parrot IO operations from stdin.

=cut

pir_stdin_output_is(<<'INPUT', <<'CODE', <<'OUTPUT', 'simple stdin use');
foo
INPUT
.sub test :main
    .local pmc stdin
    stdin = getstdin
    read_str(stdin, 1)
    read_str(stdin, 2)
    read_str(stdin, 5)
    read_str(stdin, 5)
.end
.sub read_str
    .param pmc stream
    .param int n_chars
    .local string input_string
    .local int len
    input_string = stream.'read'(n_chars)
    len = length input_string
    print "got len "
    print len
    print ':  "'
    print input_string
    print "\"\n"
.end
CODE
got len 1:  "f"
got len 2:  "oo"
got len 1:  "
"
got len 0:  ""
OUTPUT

pir_stdin_output_is(<<'INPUT', <<'CODE', <<'OUTPUT', 'readline from stdin');
one
two
three
INPUT
.sub test :main
    .local pmc stdin
    stdin = getstdin
    read_str(stdin)
    read_str(stdin)
    read_str(stdin)
    read_str(stdin)
.end
.sub read_str
    .param pmc stream
    .local string input_string
    .local int len
    input_string = stream.'readline'()
    len = length input_string
    print "got len "
    print len
    print ':  "'
    print input_string
    print "\"\n"
.end
CODE
got len 4:  "one
"
got len 4:  "two
"
got len 6:  "three
"
got len 0:  ""
OUTPUT

pir_stdin_output_is(<<'INPUT', <<'CODE', <<'OUTPUT', 'readall from stdin');
one
two
three
INPUT
.sub test :main
    .local pmc stdin
    stdin = getstdin
    read_str(stdin)
    read_str(stdin)
.end
.sub read_str
    .param pmc stream
    .local string input_string
    .local int len
    input_string = stream.'readall'()
    len = length input_string
    print "got len "
    print len
    print ':  "'
    print input_string
    print "\"\n"
.end
CODE
got len 14:  "one
two
three
"
got len 0:  ""
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
