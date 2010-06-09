#!perl
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/op/annotate-old.t - Test .annotate directive

=head1 SYNOPSIS

    % prove t/op/annotate-old.t

=head1 DESCRIPTION

Test use cases of the annotate directive that currently can't
be covered with pir based tests.

=cut

pir_error_output_like( <<CODE, <<OUTPUT, 'unhandled exception from loaded function');
.sub main :main
    # Not using test more, just a quick way to pick a function
    .include 'test_more.pir'
    .annotate 'file', 'foobar'
    .annotate 'line', 42
    # Call with too many positional arguments
    ok(0,0,0,0,0)
.end
CODE
/\(foobar:42\)/
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
