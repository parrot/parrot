#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/globals.t - Globals and Namespaces

=head1 SYNOPSIS

	% perl -Ilib t/pmc/globals.t

=head1 DESCRIPTION

Tests the globals fetch and store operations.

=cut

use Parrot::Test tests => 3;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace");
.sub main
   .local pmc ns, o
   .local string nul
   null nul
   ns = find_global "Foo", nul
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
   .local pmc ns, ns2, o
   .local string nul
   null nul
   ns = find_global "Foo", nul
   ns2 = find_global ns, "\0Bar"
   o =  find_global ns2, "f"
   o()
.end

.namespace ["Foo" ; "Bar"]
.sub f
    print "ok\n"
.end
CODE
ok
OUTPUT

