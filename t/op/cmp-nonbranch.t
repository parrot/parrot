#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;


=head1 NAME

t/op/cmp-nonbranch.t - Non-branching conditionals

=head1 SYNOPSIS

        % prove t/op/cmp-nonbranch.t

=head1 DESCRIPTION

Tests all non-branching conditional operators.

=cut


pir_output_is(<<'CODE', <<OUTPUT, 'isnull: failure and success');
.sub 'test' :main
  init:
    $S0 = 'FUBAR'
    bsr test_it
    $S0 = 'Null' # this is a valid pmc type -- you can't trick parrot :)
    bsr test_it
    $S0 = 'Integer'
    bsr test_it
    end

  test_it:
    $I0 = 0
    push_eh fubar
    $I1 = find_type $S0
    new $P0, $I1
    clear_eh
    goto test

  fubar:
    $I0 = isnull $P0

  test:
    if $I0 goto ok
  nok:
    print 'not '
  ok:
    print "ok\n"
    ret
.end
CODE
ok
not ok
not ok
OUTPUT

