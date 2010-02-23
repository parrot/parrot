#! perl
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;

=head1 NAME

t/oo/new-old.t - old style tests for new

=head1 SYNOPSIS

    % prove t/oo/new-old.t

=head1 DESCRIPTION

Tests instantiation

=cut

plan tests => 1;

pir_output_is( <<'CODE', <<'OUT', "exception in new", todo => 'TT #1151' );
.sub main :main
    .local pmc type
    newclass type, 'Parent'

    .local pmc obj, exception
    .local string message
    message = 'no error'
    push_eh handler
        obj = new 'Parent'
        print 'not '
    pop_eh
    goto finally

  handler:
    .get_results(exception)
    pop_eh
    message = exception

  finally:
    print "ok #"
    say message
.end

.namespace ['Parent']
.sub 'init' :vtable
    die 'test exception from init vtable'
.end
CODE
ok #test exception from init vtable
OUT

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
