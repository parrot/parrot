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

use Parrot::Test tests => 15;
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

pir_output_is( << 'CODE', << 'OUTPUT', 'exists' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc a
    .local int i

    a = new 'PHPArray'

    a[1;2;'three';'exists'] = 'exists'

    i = exists a[1;2;'three';'exists']
    print i
    print "\n"

    i = exists a['does';'not';'exist']
    print i
    print "\n"

.end
CODE
1
0
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'delete' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc a
    .local int i1, i2

    a = new 'PHPArray'

    delete a['foo']

    delete a[3;'bar';'baz']

    a[1;'two'] = 'buckle my shoe'
    a['three';4] = 'knock at the door'

    delete a[1]
    i1 = exists a[1;'two']
    i2 = exists a[1]
    print i1
    print ','
    print i2
    print "\n"

    delete a['three';4]
    i1 = exists a['three';4]
    i2 = exists a['three']
    print i1
    print ','
    print i2
    print "\n"

.end
CODE
0,0
0,1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'iterator' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc iter, p, val

    p = new 'PHPArray'

    p['FOO'] = 'The '
    p[25]    = 'iterator '
    p[0]     = 'is '
    p[-87]   = 'doing '
    p['BUZ'] = 'the '
    p['x']   = 'right '
    p[1]     = "thing.\n"

    iter = new 'Iterator', p

iter_loop:
    unless iter, iter_end
    val = shift iter
    val = p[val]
    print val
    goto iter_loop
iter_end:

.end
CODE
The iterator is doing the right thing.
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'cmp - shallow tests' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc p1, p2
    .local int i

    p1 = new 'PHPArray'
    p2 = new 'PHPArray'

    i = cmp p1, p2
    print "test 0:"
    print i
    print "\n"

    p1['Foo'] = 'bar'
    p1[224]   = 'quux'
    p1['box'] = 3882
    p1[828]   = 894

    p2[828]   = 894
    p2['box'] = 3882
    p2[224]   = 'quux'
    p2['Foo'] = 'bar'

    i = cmp p1, p2
    print "test 1:"
    print i
    print "\n"

    p1[828] = 'bub'

    i = cmp p1, p2
    print "test 2:"
    print i
    print "\n"

    p2['xxx'] = 0

    i = cmp p1, p2
    print "test 3:"
    print i
    print "\n"

.end
CODE
test 0:0
test 1:0
test 2:1
test 3:-1
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', 'cmp - deep tests' );
.HLL 'PHP', 'php_group'
.sub _main
    .local pmc p1, p1a, p1b 
    .local pmc p2, p2a, p2b, p2c
    .local int i

    p1 = new 'PHPArray'
    p1a = new 'PHPArray'
    p1b = new 'PHPArray'

    p2 = new 'PHPArray'
    p2a = new 'PHPArray'
    p2b = new 'PHPArray'
    p2c = new 'PHPArray'

    p1['a'] = p1a
    p1['b'] = p1b

    p2['a'] = p2a
    p2['b'] = p2b

    i = cmp p1, p2
    print "test 0:"
    print i
    print "\n"

    p1['fooo'] = 0
    p2['fooo'] = 0

    p1['a';'box'] = 9
    p1['b';8] = 123
    p1['b';9] = 'mismatch'
    p2['a';'box'] = 9
    p2['b';8] = 123

    i = cmp p1, p2
    print "test 1:"
    print i
    print "\n"

    p2['b';9] = 'mismatch'

    i = cmp p1, p2
    print "test 2:"
    print i
    print "\n"

    p2['c'] = p2c
    p1['c'] = 'o'

    i = cmp p1, p2
    print "test 3:"
    print i
    print "\n"

.end
CODE
test 0:0
test 1:1
test 2:0
test 3:1
OUTPUT

#pir_output_is( << 'CODE', << 'OUTPUT', 'add' );
#.HLL 'PHP', 'php_group'
#.sub _main
#    .local pmc p1, p2, p3
#
#    p1 = new 'PHPArray'
#    p2 = new 'PHPArray'
#    p3 = new 'PHPArray'
#
#    p1[0] = 'It '
#    p1[1] = 'looks '
#    p2[2] = 'like'
#    p2[3] = ' add '
#    p1[4] = 'is working.\n'
#    p2[4] = 'is broken.\n'
#
#    p3 = p1 + p2
#    
#    print p3[0]
#    print p3[1]
#    print p3[2]
#    print p3[3]
#    print p3[4]
#
#.end
#CODE
#It looks like add is working.
#OUTPUT
#
#
#pir_output_is( << 'CODE', << 'OUTPUT', 'i_add' );
#.HLL 'PHP', 'php_group'
#.sub _main
#    .local pmc p1, p2
#
#    p1 = new 'PHPArray'
#    p2 = new 'PHPArray'
#
#    p1[0] = 'It '
#    p1[1] = 'looks '
#    p2[2] = 'like'
#    p2[3] = ' i_add '
#    p1[4] = "is working.\n"
#    p2[4] = "is broken.\n"
#
#    p1 += p2
#    
#    print p1[0]
#    print p1[1]
#    print p1[2]
#    print p1[3]
#    print p1[4]
#
#.end
#CODE
#It looks like i_add is working.
#OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

