#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 32;
use Parrot::Config;

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
    $P0 = find_global "Foo"
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
    $P0 = find_global "Foo"
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
    $P1 = $P0["parrot";"Foo"]
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

pir_output_like(<<'CODE', <<'OUTPUT', "find_global Foo::bazz not found");
.sub 'main' :main
    $P2 = find_global ["Foo"], "bazz"
    $P2()
    print "ok\n"
.end
CODE
/Global 'bazz' not found/
OUTPUT

# [this used to behave differently from the previous case.]
pir_output_like(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::bazz not found");
.sub 'main' :main
    $P2 = find_global ["Foo";"Bar"], "bazz"
    $P2()
    print "ok\n"
.end
CODE
/Global 'bazz' not found/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global Foo::Bar::baz hash");
.sub 'main' :main
    $P0 = find_global "Foo"
    $P1 = $P0["Bar"]
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
    $P0 = find_global "Foo"
    $P1 = $P0["Bar" ; "baz"]
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
    $P1 = $P0["parrot";"Foo";"Bar" ; "baz"]
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
    $P0 = find_global "Foo"
    $P1 = $P0["Bar"]
    store_global "TopBar", $P1
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
    $P0 = find_global "Foo"
    $P1 = find_global $P0, "Bar"
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
    $P2 = $P1.'name'()
    $S0 = join '::', $P2
    print $S0
    print "\n"
.end
CODE
ok
baz
parrot::Foo::Bar
OUTPUT

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
    # root namespace
    $P0 = interpinfo .INTERPINFO_NAMESPACE_ROOT
    typeof $S0, $P0
    print $S0
    print "\n"
    print $P0
    print "\n"
    # parrot namespace
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
CODE
2
parrot::Foo
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
    $P1 = 1
    $P1[0] = 'Foo'
    $P2 = get_namespace $P1
    $P2 = $P2.'name'()
    $I2 = elements $P2
    print $I2
    print "\n"
    $S0 = join '::', $P2
    print $S0
    print "\n"
    # fetch w key
    $P2 = get_namespace ["Foo"]
    $P2 = $P2.'name'()
    $I2 = elements $P2
    print $I2
    print "\n"
    $S0 = join '::', $P2
    print $S0
    print "\n"
.end
CODE
2
parrot::Foo
2
parrot::Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Sub.get_namespace, get_namespace");
.sub 'main' :main
    $P0 = find_global "Foo", "bar"
    print "ok\n"
    $P1 = $P0."get_namespace"()
    $P2 = $P1.name()
    $S0 = join '::', $P2
    print $S0
    print "\n"
    $P0()
.end

.namespace ["Foo"]
.sub 'bar'
    $P1 = get_namespace
    print $P1
    print "\n"
.end
CODE
ok
parrot::Foo
Foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "check parrot ns");
.sub 'main' :main
    $P0 = get_namespace ["String"]
    $P1 = find_global $P0, "lower"
    $S0 = $P1("OK\n")
    print $S0
.end
CODE
ok
OUTPUT

my $temp_a = "temp_a";
my $temp_b = "temp_b";

END {
    unlink("$temp_a.pir", "$temp_a.pbc", "$temp_b.pir", "$temp_b.pbc");
};

open S, ">$temp_a.pir" or die "Can't write $temp_a.pir";
print S <<'EOF';
.HLL "Foo", ""
.namespace ["Foo_A"]
.sub loada :load
    $P0 = find_global "Foo_A", "A"
    print "ok 1\n"
    load_bytecode "temp_b.pbc"
.end

.sub A
.end
EOF
close S;

open S, ">$temp_b.pir" or die "Can't write $temp_b.pir";
print S <<'EOF';
.namespace ["Foo_B"]
.sub loadb :load
    $P0 = find_global "Foo_B", "B"
    print "ok 2\n"
.end

.sub B
.end
EOF

close S;

system(".$PConfig{slash}parrot$PConfig{exe} -o $temp_a.pbc $temp_a.pir");
system(".$PConfig{slash}parrot$PConfig{exe} -o $temp_b.pbc $temp_b.pir");

pir_output_is(<<'CODE', <<'OUTPUT', "HLL and load_bytecode - #38888");
.sub main :main
    load_bytecode "temp_a.pbc"
    print "ok 3\n"
.end
CODE
ok 1
ok 2
ok 3
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "HLL and vars");
# initial storage of _tcl global variable...

.HLL '_Tcl', ''

.include 'interpinfo.pasm'

.sub huh 
  $P0 = new .Integer
  $P0 = 3.14
  store_global '$variable', $P0
.end

# start running HLL language
.HLL 'Tcl', ''

.sub foo :main
  huh()
  $P1 = interpinfo .INTERPINFO_NAMESPACE_ROOT
  $P2 = $P1['_tcl']
  $P3 = $P2['$variable'] 
  print $P3
  print "\n"
.end
CODE
3.14
OUTPUT

{
my $temp_a = "temp_a.pir";

END {
    unlink($temp_a);
};

open S, '>', $temp_a or die "Can't write $temp_a";
print S <<'EOF';
.HLL 'eek', ''

.sub foo :load :anon
  $P1 = new .String
  $P1 = "3.14\n"
  store_global '$whee', $P1
.end

.sub bark
  $P0 = find_global '$whee'
  print $P0
.end
EOF
close S;

pir_output_is(<<'CODE', <<'OUTPUT', ":anon subs still get default namespace");
.HLL 'cromulent', ''

.sub what
   load_bytecode 'temp_a.pir'
  .include 'interpinfo.pasm'
  .local pmc var
   var = interpinfo .INTERPINFO_NAMESPACE_ROOT
   var = var['eek']
   var = var['bark']

    var()
.end
CODE
3.14
OUTPUT
}


# the test was skipped, the description says:
# find_global should find from .HLL namespace, not current .namespace
# but according to pdd21, {find,store}_global are relative to current

SKIP:
{
    skip("immediate test, doesn't with -r (from .pbc)", 1)
	if ( exists $ENV{TEST_PROG_ARGS} and $ENV{TEST_PROG_ARGS} =~ m/-r/ );

pir_output_is(<<'CODE', <<'OUTPUT', "find_global in current");
.HLL 'bork', ''
.namespace [ '' ]

.sub a :immediate
  $P1 = new .String
  $P1 = "ok\n"
  store_global 'sub_namespace', "eek", $P1
## store_global "eek", $P1
.end

.namespace [ 'sub_namespace' ]

.sub whee :main

$P1 = find_global 'eek'
print $P1
.end
CODE
ok
OUTPUT
}

open S, ">$temp_b.pir" or die "Can't write $temp_b.pir";
print S <<'EOF';
.HLL 'B', ''
.sub b_foo
    print "b_foo\n"
.end
EOF
close S;

pir_output_is(<<"CODE", <<'OUTPUT', "export_to");
.HLL 'A', ''
.sub main :main
    a_foo()
    load_bytecode "$temp_b.pir"
    .local pmc nsr, nsa, nsb, ar
    ar = new .ResizableStringArray
    push ar, "b_foo"
    .include "interpinfo.pasm"
    nsr = interpinfo .INTERPINFO_NAMESPACE_ROOT
    nsa = nsr['a']
    nsb = nsr['b']
    nsb."export_to"(nsa, ar)
    b_foo()
.end

.sub a_foo
    print "a_foo\\n"
.end
CODE
a_foo
b_foo
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "get_parent");
.sub main :main
    .local pmc ns
    ns = get_namespace ['Foo']
    ns = ns.'get_parent'()
    print ns
    print "\n"
.end
.namespace ['Foo']
.sub dummy
.end
CODE
parrot
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "find_global [''], \"print_ok\"");
.namespace ['']

.sub print_ok
  print "ok\n"
  .return()
.end

.namespace ['foo']

.sub main :main
  $P0 = find_global [''], 'print_ok'
  $P0()
  end
.end
CODE
ok
OUTPUT
