#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 4;

=head1 NAME

t/oo/isa.t - Test OO inheritance

=head1 SYNOPSIS

    % prove t/oo/isa.t

=head1 DESCRIPTION

Tests OO features related to the isa opcode, comparing for inheritance and
composition.

=cut

pir_output_is( <<'CODE', <<'OUT', 'isa by string name');
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

pir_output_is( <<'CODE', <<'OUT', 'isa by class object');
.sub main :main
    .local pmc foo_class
    foo_class = newclass "Foo"
    $S1 = typeof foo_class
    say $S1

    .local pmc class_class
    class_class = get_class "Class"
    $I3 = isa foo_class, class_class
    print $I3
    print "\n"

    $P2 = new foo_class 

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, foo_class
    print $I3
    print "\n"

    .local pmc object_class
    object_class = get_class "Object"
    $I3 = isa $P2, object_class
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

pir_output_is( <<'CODE', <<'OUT', 'subclass isa by string name');
.sub main :main
    .local pmc foo_class, bar_class
    foo_class = newclass "Foo"
    bar_class = subclass "Foo", "Bar"

    $I3 = isa bar_class, "Class"
    print $I3
    print "\n"

    $P2 = new bar_class 

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, "Bar"
    print $I3
    print "\n"

    $I3 = isa $P2, "Foo"
    print $I3
    print "\n"

    $I3 = isa $P2, "Object"
    print $I3
    print "\n"
.end
CODE
1
Bar
1
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'subclass isa by class object');
.sub main :main
    .local pmc foo_class, bar_class
    foo_class = newclass "Foo"
    bar_class = subclass "Foo", "Bar"

    .local pmc class_class
    class_class = get_class "Class"
    $I3 = isa bar_class, class_class
    print $I3
    print "\n"

    $P2 = new bar_class 

    $S1 = typeof $P2
    say $S1

    $I3 = isa $P2, bar_class
    print $I3
    print "\n"

    $I3 = isa $P2, foo_class
    print $I3
    print "\n"

    .local pmc object_class
    object_class = get_class "Object"
    $I3 = isa $P2, object_class
    print $I3
    print "\n"
.end
CODE
1
Bar
1
1
1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
