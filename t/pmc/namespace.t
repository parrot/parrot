#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/namespace.t - Namespaces

=head1 SYNOPSIS

	% perl -Ilib t/pmc/namespace.t

=head1 DESCRIPTION

Tests the namespace manipulation.

=cut

use Parrot::Test tests => 14;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "find_global bar");
.sub main @MAIN
    $P0 = find_global "bar"
    print "ok\n"
    $P0()
.end

.sub bar
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar");
.sub main @MAIN
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P0()
.end

.namespace ["Foo"]
.sub bar
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get_name_space Foo::bar");
.sub main @MAIN
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P1 = $P0."get_name_space"()
    print $P1
    print "\n"
.end

.namespace ["Foo"]
.sub bar
.end
CODE
ok
Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar ns");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = find_global $P0, "bar"
    print "ok\n"
    $P1()
.end

.namespace ["Foo"]
.sub bar
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar hash");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = $P0["bar"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"]
.sub bar
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::bar root");
.sub main @MAIN
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["\0Foo"]
    $P2 = $P1["bar"]
    print "ok\n"
    $P2()
.end

.namespace ["Foo"]
.sub bar
    print "bar\n"
.end
CODE
ok
bar
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = find_global $P0, "\0Bar"
    $P2 = find_global $P1, "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo" ; "Bar"]
.sub baz
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar"]
    $P2 = $P1["baz"]
    print "ok\n"
    $P2()
.end

.namespace ["Foo"; "Bar"]
.sub baz
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash 2");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar" ; "baz"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"; "Bar"]
.sub baz
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash 3");
.sub main @MAIN
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    $P1 = $P0["\0Foo";"\0Bar" ; "baz"]
    print "ok\n"
    $P1()
.end

.namespace ["Foo"; "Bar"]
.sub baz
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz alias");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = $P0["\0Bar"]
    store_global "\0TopBar", $P1
    $P2 = find_global "TopBar", "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo"; "Bar"]
.sub baz
    print "baz\n"
.end
CODE
ok
baz
OUTPUT

pir_output_like(<<'CODE', <<'OUTPUT', "func() namespace resolution");

.sub main @MAIN
    print "calling foo\n"
    foo()
    print "calling Foo::foo\n"
    $P0 = find_global "Foo", "foo"
    $P0()
    print "calling baz\n"
    baz()
.end

.sub foo
    print "  foo\n"
    bar()
.end

.sub bar
    print "  bar\n"
.end

.sub fie
    print "  fie\n"
.end

.namespace ["Foo"]

.sub foo
    print "  Foo::foo\n"
    bar()
    fie()
.end

.sub bar
    print "  Foo::bar\n"
.end

.sub baz
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
.sub main @MAIN
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P0()
.end

.namespace ["Foo"]
.sub bar
    print "bar\n"
    .include "interpinfo.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $P1 = $P0."get_name_space"()
    print $P1
    print "\n"
.end
CODE
ok
bar
Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get namespace in Foo::Bar::baz");
.sub main @MAIN
    $P0 = find_global "\0Foo"
    $P1 = find_global $P0, "\0Bar"
    $P2 = find_global $P1, "baz"
    print "ok\n"
    $P2()
.end

.namespace ["Foo" ; "Bar"]
.sub baz
    print "baz\n"
    .include "interpinfo.pasm"
    .include "pmctypes.pasm"
    $P0 = interpinfo .INTERPINFO_CURRENT_SUB
    $P1 = $P0."get_name_space"()
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

