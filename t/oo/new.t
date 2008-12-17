#!perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 23;

=head1 NAME

t/oo/new.t - Test OO instantiation

=head1 SYNOPSIS

    % prove t/oo/new.t

=head1 DESCRIPTION

Tests OO features related to instantiating new objects.

=cut

pir_output_is( <<'CODE', <<'OUT', 'instantiate from class object' );
.sub main :main
    $P1 = newclass "Foo"
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new $P1

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Class
1
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'manually create anonymous class object' );
.sub main :main
    $P1 = new "Class"
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new $P1

    $S1 = typeof $P2
    print "'"
    print $S1
    print "'\n"

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Class
1
''
0
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'manually create named class object' );
.sub main :main
    $P1 = new "Class"
    $P1.'name'("Foo")
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new $P1

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Class
1
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from class object method' );
.sub main :main
    $P1 = newclass "Foo"
    $P2 = $P1.'new'()

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string name' );
.sub main :main
    $P1 = newclass "Foo"
    $P2 = new 'Foo'

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string register name' );
.sub main :main
    $P1 = newclass "Foo"
    $S1 = 'Foo'
    $P2 = new $S1

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string PMC name' );
.sub main :main
    $P1 = newclass "Foo"
    $P3 = new 'String'
    $P3 = 'Foo'
    $P2 = new $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Foo
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from key name' );
.sub main :main
    $P1 = newclass ['Foo';'Bar']
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new ['Foo';'Bar']

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, ['Foo';'Bar']
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Class
1
Foo;Bar
1
1
OUT

pir_output_is(
    <<'CODE', <<'OUT', 'instantiate from key PMC name', todo => 'create non-constant key' );
.sub main :main
    $P1 = newclass ['Foo';'Bar']
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    say $I3

    # How do you set the value of a non-constant key PMC?
    $P3 = new 'Key'

    $P2 = new $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, 'Bar'
    say $I3

    $I3 = isa $P2, "Object"
    say $I3
.end
CODE
Class
1
Foo;Bar
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'create and instantiate from array of names' );
.sub main :main
    $P0 = split " ", "Foo Bar"
    $P1 = newclass $P0
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new $P0

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, ['Foo';'Bar']
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
Class
1
Foo;Bar
1
1
OUT

pir_error_output_like( <<'CODE', <<'OUT', 'only string arrays work for creating classes' );
.sub main :main
    $P0 = new 'ResizablePMCArray'
    $P10 = new 'String'
    $P10 = 'Foo'
    $P11 = new 'String'
    $P11 = 'Bar'

    $P1 = newclass $P0
    $S1 = typeof $P1
    say $S1

    $I3 = isa $P1, "Class"
    print $I3
    print "\n"

    $P2 = new $P0

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, ['Foo';'Bar']
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
/Invalid class name key/
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from class object with init' );
.sub main :main
    $P1 = newclass "Foo"
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo\n"
    $P3['data'] = $P4

    $P2 = new $P1, $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo
1
1
data for Foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string name with init' );
.sub main :main
    $P1 = newclass "Foo"
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo\n"
    $P3['data'] = $P4

    $P2 = new 'Foo', $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo
1
1
data for Foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string register name with init' );
.sub main :main
    $P1 = newclass "Foo"
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo\n"
    $P3['data'] = $P4

    $S1 = 'Foo'
    $P2 = new $S1, $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo
1
1
data for Foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from string PMC name with init' );
.sub main :main
    $P1 = newclass "Foo"
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo\n"
    $P3['data'] = $P4

    $P6 = new 'String'
    $P6 = 'Foo'
    $P2 = new $P6, $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo
1
1
data for Foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from array of names with init' );
.sub main :main
    $P0 = split " ", "Foo Bar"
    $P1 = newclass $P0
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo;Bar\n"
    $P3['data'] = $P4

    $P2 = new $P0, $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, ["Foo";"Bar"]
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo;Bar
1
1
data for Foo;Bar
OUT

pir_output_is( <<'CODE', <<'OUT', 'instantiate from key name with init' );
.sub main :main
    $P1 = newclass ['Foo';'Bar']
    addattribute $P1, 'data'

    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = "data for Foo;Bar\n"
    $P3['data'] = $P4

    $P2 = new ['Foo';'Bar'], $P3

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, 'Bar'
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"

    $P5 = getattribute $P2, 'data'
    print $P5
.end
CODE
Foo;Bar
0
1
data for Foo;Bar
OUT

pir_output_is( <<'CODE', <<'OUT', 'create class namespace initializer' );
.sub main :main
    .local pmc ns
    ns = get_namespace ['Foo';'Bar']
    $P0 = new 'Class', ns

    $P1 = new ['Foo';'Bar']
    $P1.'blue'()
.end

.namespace [ 'Foo';'Bar' ]
.sub 'blue' :method
    say 'foo blue'
.end

CODE
foo blue
OUT

pir_output_is( <<'CODE', <<'OUT', 'regression test, instantiate class within different namespace' );
.sub main :main
    $P0 = newclass 'Foo'
    $P0 = newclass 'Bar'

    $P1 = new 'Foo'
    $P1.'blue'()
.end

.namespace [ 'Foo' ]
.sub 'blue' :method
    say 'foo blue'
    $P1 = new 'Bar'
    $P1.'blue'()
.end

.namespace [ 'Bar' ]
.sub 'blue' :method
    say 'bar blue'
.end
CODE
foo blue
bar blue
OUT

pir_output_is( <<'CODE', <<'OUT', 'get_class retrieves a high-level class object' );
.sub main :main
    $P0 = newclass 'Foo'
    $S1 = typeof $P0
    say $S1

    $P1 = get_class 'Foo'
    $S1 = typeof $P1
    say $S1

    $P2 = new $P1
    $S1 = typeof $P2
    say $S1
.end
CODE
Class
Class
Foo
OUT

pir_output_is( <<'CODE', <<'OUT', 'get_class retrieves a proxy class object' );
.sub main :main
    $P1 = get_class 'String'
    $S1 = typeof $P1
    say $S1

    $P2 = new $P1
    $S1 = typeof $P2
    say $S1
.end
CODE
PMCProxy
String
OUT

pir_output_is( <<'CODE', <<'OUT', "get_class retrieves a class object that doesn't exist" );
.sub main :main
    $P1 = get_class 'Murple'
    if null $P1 goto not_defined
    say "Class is defined. Shouldn't be."
    end
  not_defined:
    say "Class isn't defined."
.end
CODE
Class isn't defined.
OUT

pir_error_output_like(<<'CODE', <<'OUT', 'Instantiate class from invalid key');
.sub 'main' :main
    $P0 = new [ 'Foo'; 'Bar'; 'Baz' ]
.end
CODE
/Class '\[ 'Foo' ; 'Bar' ; 'Baz' \]' not found/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
