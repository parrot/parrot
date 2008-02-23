#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/array.t - PHP array

=head1 SYNOPSIS

    % perl -I../../lib t/pmc/array.t

=head1 DESCRIPTION

Tests C<array> type
(implemented in F<languages/plumhead/pmc/phparray.pmc>).

=cut

use strict;
use warnings;

use Parrot::Test tests => 10;
use Test::More;

pir_output_is( << 'CODE', << 'OUTPUT', 'unkeyed get_string' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc p1
    p1 = new 'PHPArray'
    print p1
    print "\n"
.end
CODE
Array
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'int keyed set/get' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    ar[1] = 2746
    i1 = ar[1]
    print i1
    print "\n"
.end
CODE
2746
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'int to string conversion' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local string s

    ar = new 'PHPArray'

    ar[1] = 'string'

    s = ar['1']
    print s
    print "\n"
.end
CODE
string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'string to int conversion' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local string s

    ar = new 'PHPArray'

    ar['1'] = 'right string'

    ar['01'] = 'wrong string'
    s = ar[1]
    print s
    print "\n"
.end
CODE
right string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'autovivification' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    ar['this';1;'test';'will';'cause';6] = 'autovivifications'
    s1 = ar['this';1;'test';'will';'cause';6]
    print s1
    print "\n"
.end
CODE
autovivifications
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'string keyed set/get' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    ar['x'] = 2746
    i1 = ar['x']
    print i1
    print "\n"
.end
CODE
2746
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'several sets/gets' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    ar[1] = 6
    ar[2] = 746
    ar[3] = 76
    ar[4] = 27
    ar[5] = 76
    ar[6] = 2
    ar[7] = 246
    ar[8] = 274
    ar[9] = 74
    i1 = ar[6]
    print i1
    print "\n"
.end
CODE
2
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'various types' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc a, pmc_str
    .local int i
    .local string s
    .local num n

    a = new 'PHPArray'
    pmc_str = new 'String'
    pmc_str = 'This is a PMC string.'

    a[0] = 123
    a['not_pi'] = 3.142938
    a['string'] = 'normal string'
    a[8] = pmc_str

    pmc_str = a[8]
    print pmc_str
    print "\n"
    n = a['not_pi']
    print n
    print "\n"
    i = a[0]
    print i
    print "\n"
    s = a['string']
    print s
    print "\n"

.end
CODE
This is a PMC string.
3.142938
123
normal string
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'push/pop' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    push ar, 'foo'
    push ar, 999
    push ar, 'bar'
    s1 = pop ar
    print s1
    s1 = pop ar
    print s1
    s1 = pop ar
    print s1
    print "\n"
.end
CODE
bar999foo
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'unshift/shift' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc ar, pmc_str
    .local int i1
    .local string s1

    ar = new 'PHPArray'

    unshift ar, 'foo'
    s1 = shift ar
    print s1
    print "\n"
.end
CODE
foo
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

