#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/floatvalarray.t - FloatvalArray tests

=head1 SYNOPSIS

	% perl -Ilib t/pmc/floatvalarray.t

=head1 DESCRIPTION

Tests the C<FloatvalArray> PMC.

=cut

use Parrot::Test tests => 10;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', 'creation');
    new P0, .FloatvalArray
    print "ok\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'get/set keyed');
    new P0, .FloatvalArray
    set P0[10], 10.0
    set N0, P0[10]
    print N0
    print "\n"
    end
CODE
10.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'get unset');
    new P0, .FloatvalArray
    set N0, P0[10]
    print N0
    print "\n"
    end
CODE
0.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'get from sparse');
    new P0, .FloatvalArray
    set P0[1000000], 10.0
    set N0, P0[10000]
    print N0
    print "\n"
    end
CODE
0.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'push/get last');
    new P0, .FloatvalArray
    push P0, 1.0
    push P0, 2.0
    push P0, 3.0
    set N0, P0[-1]
    print N0
    print "\n"
    end
CODE
3.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'push/pop');
    new P0, .FloatvalArray
    push P0, 1.0
    push P0, 2.0
    push P0, 3.0
    pop N0, P0
    print N0
    print "\n"
    end
CODE
3.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'unshift/shift');
    new P0, .FloatvalArray
    unshift P0, 1.0
    unshift P0, 2.0
    unshift P0, 3.0
    shift N0, P0
    print N0
    print "\n"
    end
CODE
3.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'push get elements');
    new P0, .FloatvalArray
    push P0, 1.0
    push P0, 2.0
    push P0, 3.0
    set I0, P0
    print I0
    print "\n"
    end
CODE
3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'set array size');
    new P0, .FloatvalArray
    set P0, 10
    print "Done\n"
    end
CODE
Done
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new FloatvalArray
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "array"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT

