#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 2;

pir_output_is( <<'CODE', <<'OUT', ".param :slurpy (using PMC)" );

.HLL 'misc'
.sub anon :anon :init
  .local pmc interp
  .local pmc rpa,rsa
  interp = getinterp
  rpa = get_class 'ResizablePMCArray'
  rsa = get_class 'ResizableStringArray'
  interp.'hll_map'(rpa,rsa)
.end

.sub main :main
  elm('a','b','c')
.end

.sub elm
  .param pmc args :slurpy

  $I1 = elements args
  say $I1

  $S0 = typeof args
  say $S0
.end
CODE
3
ResizableStringArray
OUT

$ENV{TEST_PROG_ARGS} ||= '';

SKIP: {

skip('use of :immediate for this test does not work with --run-pbc', 1)
  if $ENV{TEST_PROG_ARGS} =~ /--run-pbc/;

pir_output_is( <<'CODE', <<'OUT', ".param :slurpy (using object)" );

.sub setup :anon :immediate
 $P0 = subclass 'ResizablePMCArray', 'Stack'
.end

.HLL 'misc'
.sub anon :anon :init
  .local pmc interp
  .local pmc rpa,stack
  interp = getinterp
  rpa = get_class 'ResizablePMCArray'
  stack = get_class 'Stack'
  interp.'hll_map'(rpa,stack)
.end


.sub main :main
  elm('a','b','c')
.end

.sub elm
  .param pmc args :slurpy

  $I1 = elements args
  say $I1

  $S0 = typeof args
  say $S0
.end
CODE
3
Stack
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
