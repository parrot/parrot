#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/pmc/globals.t - Globals and Namespaces

=head1 SYNOPSIS

	% prove t/pmc/globals.t

=head1 DESCRIPTION

Tests the globals fetch and store operations.

=cut

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace");
.sub main
   .local pmc ns, o
   ns = find_global "Foo"
   o =  find_global ns, "f"
   o()
.end

.namespace ["Foo"]
.sub f
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "create namespace");
.sub main
    .local pmc f, x
    f = find_global "f"
    store_global "Foo", "x", f
    x = find_global "Foo", "x"
    x()
.end

.sub f
    print "ok\n"
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace - nested");
.sub main
   .local pmc ns, o
   ns = get_namespace ["Foo"; "Bar"]
   o =  find_global ns, "f"
   o()
.end

.namespace ["Foo" ; "Bar"]
.sub f
    print "ok\n"
.end
CODE
ok
OUTPUT

# this is pretty much taken from PDD 20
pir_output_is(<<'CODE', <<'OUTPUT', "get namespace - array");
.namespace ['Foo'; 'Bar']
.sub test
  print "ok\n"
  .return()
.end

.namespace ['']
.sub main :main
  $P0 = split "::", "Foo::Bar::test"
  $S0 = pop $P0

  $P0 = get_namespace $P0
  $P1 = find_global $P0, $S0

  $P1()
  end
.end
CODE
ok
OUTPUT

