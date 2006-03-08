#! perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 21;

=head1 NAME

t/pmc/namespace.t - Namespaces

=head1 SYNOPSIS

	% prove t/pmc/namespace.t

=head1 DESCRIPTION

Tests the namespace manipulation.

=cut

pir_output_is(<<'CODE', <<'OUTPUT', "find_global bar");
.sub 'main' :main
    $P0 = find_global "bar"
    print "ok\n"
    $P0()
.end

.sub 'bar'
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "verify NameSpace type");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    typeof $S0, $P0
    print $S0
    print "\n"
.end

.namespace ["Foo"]
.sub 'bar'
    noop
.end
CODE
NameSpace
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar");
.sub 'main' :main
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P0()
.end

.namespace ["Foo"]
.sub 'bar'
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get_namespace Foo::bar");
.sub 'main' :main
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P1 = $P0."get_namespace"()
    print $P1
    print "\n"
.end

.namespace ["Foo"]
.sub 'bar'
.end
CODE
ok
Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar ns");
.sub 'main' :main
    $P1 = find_global ["Foo"], "bar"
    print "ok\n"
    $P1()
.end

.namespace ["Foo"]
.sub 'bar'
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar hash");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    $P1 = $P0["bar"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"]
.sub 'bar'
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar root");
.sub 'main' :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["\0Foo"]
    $P2 = $P1["bar"]
    print "ok\n"
    $P2()
.end

.namespace ["Foo"]
.sub 'bar'
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz");
.sub 'main' :main
    $P2 = find_global ["Foo";"Bar"], "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo" ; "Bar"]
.sub 'baz'
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar"]
    $P2 = $P1["baz"]
    print "ok\n"
    $P2()
.end

.namespace ["Foo"; "Bar"]
.sub 'baz'
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash 2");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar" ; "baz"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"; "Bar"]
.sub 'baz'
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash 3");
.sub 'main' :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["\0Foo";"\0Bar" ; "baz"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"; "Bar"]
.sub 'baz'
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz alias");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar"]
    store_global "\0TopBar", $P1
    $P2 = find_global "TopBar", "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo"; "Bar"]
.sub 'baz'
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "func() namespace resolution");
.sub 'main' :main
    print "calling foo\n"
    foo()
    print "calling Foo::foo\n"
    $P0 = find_global "Foo", "foo"
    $P0()
    print "calling baz\n"
    baz()
.end

.sub 'foo'
    print "  foo\n"
    bar()
.end

.sub 'bar'
    print "  bar\n"
.end

.sub 'fie'
    print "  fie\n"
.end

.namespace ["Foo"]

.sub 'foo'
    print "  Foo::foo\n"
    bar()
    fie()
.end

.sub 'bar'
    print "  Foo::bar\n"
.end

.sub 'baz'
    print "  Foo::baz\n"
.end
CODE
/calling foo
  foo
  bar
calling Foo::foo
  Foo::foo
  Foo::bar
  fie
calling baz
.*baz.*not found/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace in Foo::bar");
.sub 'main' :main
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P0()
.end

.namespace ["Foo"]
.sub 'bar'
    print "bar\n"
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $P1 = $P0."get_namespace"()
    print $P1
    print "\n"
.end
CODE
ok
bar
Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace in Foo::Bar::baz");
.sub 'main' :main
    $P0 = find_global "\0Foo"
    $P1 = find_global $P0, "\0Bar"
    $P2 = find_global $P1, "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo" ; "Bar"]
.sub 'baz'
    print "baz\n"
    .include "interpinfo.pasm"
    .include "pmctypes.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $P1 = $P0."get_namespace"()
    typeof $I0, $P1
    if $I0 == .Key goto is_key
    print $P1
    print "\n"
    .return()
is_key:
    print $P1
    $P1 = shift $P1
    $I1 = defined $P1
    unless $I1 goto ex
    print "::"
    goto is_key
ex:
    print "\n"
.end
CODE
ok
baz
Foo::Bar
OUTPUT

SKIP: {
	skip("disabled class method", 1);
pir_output_is(<<'CODE', <<'OUTPUT', "segv in get_name");
.namespace ['pugs';'main']
.sub 'main' :main
    $P0 = find_name "&say"
    $P0()
.end
.sub "&say"
    say "ok"
.end
CODE
ok
OUTPUT

}


pir_output_is(<<'CODE', <<'OUT', "latin1 namespace, global");
.namespace [ iso-8859-1:"François" ]

.sub '__init'
	print "latin1 namespaces are fun\n"
.end

.namespace [ "" ]

.sub 'main' :main
	$P0 = find_global iso-8859-1:"François", '__init'
	$P0()
.end
CODE
latin1 namespaces are fun
OUT

pir_output_is(<<'CODE', <<'OUT', "unicode namespace, global");
.namespace [ unicode:"Fran\xe7ois" ]

.sub '__init'
	print "unicode namespaces are fun\n"
.end

.namespace [ "" ]

.sub 'main' :main
	$P0 = find_global unicode:"Fran\xe7ois", '__init'
	$P0()
.end
CODE
unicode namespaces are fun
OUT

pir_output_is(<<'CODE', <<'OUTPUT', "verify root and parrot namespaces");
# name may change though
.sub main :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    typeof $S0, $P0
    print $S0
    print "\n"
    $P1 = $P0["parrot"]
    print $P1
    print "\n"
    typeof $S0, $P1
    print $S0
    print "\n"
.end
CODE
NameSpace
parrot
NameSpace
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "ns.name()");
.sub main :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["parrot"]
    $P3 = new .NameSpace
    $P1["Foo"] = $P3
    $P2 = $P3.'name'()
    $I2 = elements $P2
    print $I2
    print "\n"
    $S0 = join '::', $P2
    print $S0
    print "\n"
.end
# namespace root doesnt have a name
# XXX should the root namespace be included?
CODE
3
::parrot::Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get_namespace_p_p, getnamespace_p_kc");
.sub main :main
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["parrot"]
    $P3 = new .NameSpace
    $P1["Foo"] = $P3
    # fetch w array
    $P1 = new .FixedStringArray
    $P1 = 2
    $P1[0] = 'parrot'
    $P1[1] = 'Foo'
    $P2 = get_namespace $P1
    $P2 = $P2.'name'()
    $I2 = elements $P2
    print $I2
    print "\n"
    $S0 = join '::', $P2
    print $S0
    print "\n"
    # fetch w key
    $P2 = get_namespace ["parrot";"Foo"]
    $P2 = $P2.'name'()
    $I2 = elements $P2
    print $I2
    print "\n"
    $S0 = join '::', $P2
    print $S0
    print "\n"
.end
# namespace root doesnt have a name
# XXX should the root namespace be included?
CODE
3
::parrot::Foo
3
::parrot::Foo
OUTPUT
