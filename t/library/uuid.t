#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 9;

=head1 NAME

t/library/uuid.t - uuid library tests

=head1 SYNOPSIS

    % prove t/library/uuid.t

=cut

pir_output_is( << 'CODE', << 'OUTPUT', 'generate' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $S1 = typeof $P1
    print $S1
    print "\n"
.end
CODE
uuid
OUTPUT


pir_output_like( << 'CODE', << 'OUTPUT', 'generate' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    print $P1
.end
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


pir_output_like( << 'CODE', << 'OUTPUT', 'generate_random' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate_random'
    $P1 = $P0()
    print $P1
.end
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


pir_output_like( << 'CODE', << 'OUTPUT', 'generate_time' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate_time'
    $P1 = $P0()
    print $P1
.end
CODE
/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'parse' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'parse'
    ($I0, $P1) = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    print $I0
    print "\n"
    $S1 = typeof $P1
    print $S1
    print "\n"
.end
CODE
0
uuid
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'parse' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'parse'
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949CC5-4701-4A84-895B-354C584A981B")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981bc")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5x4701-4a84-895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949cc504701-4a84-895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-470104a84-895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-4701-4a840895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-4701-4a84-895b0354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("g4949cc5-4701-4a84-895b-354c584a981b")
    print $I0
    print "\n"
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981g")
    print $I0
    print "\n"
.end
CODE
0
0
-1
-1
-1
-1
-1
-1
-1
-1
-1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'time' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'parse'
    ($I0, $P1) = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    $I1 = $P1.'time'()
    print $I1
    print "\n"
.end
CODE
-1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'type' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $I0 = $P1.'type'()
    print $I0
    print "\n"
.end
CODE
4
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'variant' );
.sub test :main
    load_bytecode 'library/uuid.pbc'
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $I0 = $P1.'variant'()
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
