#!perl
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/library/protoobject.t - testing Protoobject.pir

=head1 SYNOPSIS

        % prove t/library/protoobject.t

=head1 DESCRIPTION

This test exercises the protoobject/Protomaker implementations.

=cut

pir_output_is( << 'END_CODE', << 'END_OUT', 'basic load' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $S0 = typeof $P0
    say $S0
.end
END_CODE
Protomaker
END_OUT

pir_output_is( << 'END_CODE', << 'END_OUT', 'type of protoobject' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'XYZ'
    $P2 = $P0.'new_proto'($P1)

    $S0 = typeof $P2
    say $S0
.end
END_CODE
XYZ
END_OUT

pir_output_is( << 'END_CODE', << 'END_OUT', 'type of ns-based protoobject' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass ['Foo';'Bar']
    $P2 = $P0.'new_proto'($P1)

    $S0 = typeof $P2
    say $S0
.end
END_CODE
Foo;Bar
END_OUT

pir_output_is( << 'END_CODE', << 'END_OUT', 'Protoobject symbol' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass ['Foo';'Bar']
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global ['Foo'], 'Bar'
    $S0 = typeof $P2
    say $S0
.end
END_CODE
Foo;Bar
END_OUT

pir_output_is( << 'END_CODE', << 'END_OUT', 'Protoobject symbol' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'Foo'
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global 'Foo'
    $S0 = typeof $P2
    say $S0
.end
END_CODE
Foo
END_OUT

pir_output_is( <<'END_CODE', <<'END_OUT', 'Protoobject symbol for :: classes' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'Foo::Bar'
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global ['Foo'], 'Bar'
    $S0 = typeof $P2
    say $S0
.end
END_CODE
Foo::Bar
END_OUT

pir_output_is( <<'END_CODE', <<'END_OUT', 'new_subclass for :: classes' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = get_class 'Hash'
    $P0.'new_subclass'($P1, 'Foo::Bar')

    $P2 = new 'Foo::Bar'
    $S0 = typeof $P2
    say $S0

    $P2 = get_hll_global ['Foo'], 'Bar'
    $S0 = typeof $P2
    say $S0
.end
END_CODE
Foo::Bar
Foo::Bar
END_OUT

pir_output_is( <<'END_CODE', <<'END_OUT', 'new_subclass with attrs' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    .local pmc protomaker, hashclass, attrs
    protomaker = get_hll_global 'Protomaker'
    hashclass = get_class 'Hash'
    attrs = split ' ', '$a $b $c $d'
    protomaker.'new_subclass'(hashclass, 'Foo::Bar', attrs :flat)

    .local pmc object, iter
    object = new 'Foo::Bar'
    iter = new 'Iterator', attrs
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    $S0 = $P0
    setattribute object, $S0, $P0
    $P1 = getattribute object, $S0
    say $P1
    goto iter_loop
  iter_end:
.end
END_CODE
$a
$b
$c
$d
END_OUT

pir_output_is( <<'END_CODE', <<'END_OUT', 'method "new" on protoobject' );
.sub main :main
    load_bytecode 'Protoobject.pbc'

    $P0 = newclass 'Foo'

    .local pmc protomaker
    protomaker = get_hll_global 'Protomaker'
    protomaker.'new_proto'('Foo')

    $P0 = get_hll_global 'Foo'
    $P1 = $P0.'new'()
    $S0 = typeof $P1
    say $S0
.end
END_CODE
Foo
END_OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

