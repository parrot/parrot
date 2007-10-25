#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;

=head1 NAME

t/oo/proxy.t - Test OO class proxies.

=head1 SYNOPSIS

    % prove t/oo/proxy.t

=head1 DESCRIPTION

Tests OO features related to creating and using class proxies.

=cut

pir_output_is( <<'CODE', <<'OUT', 'typeof a low-level object' );
.sub main :main
    $P0 = new 'String'
    $S1 = typeof $P0
    say $S1
    $P1 = typeof $P0

    $I3 = isa $P1, "PMCProxy"
    print $I3
    print "\n"
.end
CODE
String
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'typeof a high-level object' );
.sub main :main
    $P0 = newclass "Foo"
    $P0 = new "Foo"
    $S1 = typeof $P0
    say $S1
    $P1 = typeof $P0

    $I3 = isa $P1, "PMCProxy"
    print $I3
    print "\n"
    $I3 = isa $P1, "Foo"
    print $I3
    print "\n"
.end
CODE
Foo
0
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'typeof a Class object' );
.sub main :main
    $P0 = newclass "Foo"
    $S1 = typeof $P0
    say $S1
    $P1 = typeof $P0

    $I3 = isa $P1, "PMCProxy"
    print $I3
    print "\n"
.end
CODE
Class
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'proxy as parent of class' );
.sub main :main
    $P0 = get_class 'Hash'
    $P1 = subclass $P0, [ 'MyClass' ]
    $P2 = new [ 'MyClass' ]
    $P2['xyz'] = 'abc'
    $S1 = $P2['xyz']
    print $S1
    print "\n"
.end
CODE
abc
OUT

pir_output_is( <<'CODE', <<'OUT', 'proxy as parent of class w/new' );
.sub main :main
    $P0 = get_class 'Hash'
    $P1 = subclass $P0, ['Foo';'Bar']
    $P2 = new ['Foo';'Bar']
    $S0 = typeof $P2
    say $S0
.end
CODE
Foo;Bar
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
