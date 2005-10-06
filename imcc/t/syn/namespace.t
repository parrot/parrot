#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test;

##############################
pir_output_is(<<'CODE', <<'OUT', "namespace 1");
.sub _foo
    .local int x
    x = 5
    .namespace A
    .local int x
    x = 3
    print x
    print "\n"
    .endnamespace A
    print x
    print "\n"
    end
.end
CODE
3
5
OUT

##############################
pir_output_is(<<'CODE', <<'OUT', "namespace 2");
.sub _foo
    .local int x
    .local int y
    x = 5
    y = 10
    .namespace A
    .local int x
    x = 3
    print x
    print "\n"
    print y
    print "\n"
    .endnamespace A
    print x
    print "\n"
    print y
    print "\n"
    end
.end
CODE
3
10
5
10
OUT

##############################
pir_output_is(<<'CODE', <<'OUT', "namespace 3");
.sub _foo
    .local int x
    .local int y
    .local int z
    x = 5
    y = 10
    z = 20
    .namespace A
    .local int x
    x = 3
    print x
    print "\n"
    print y
    print "\n"
    print z
    print "\n"
    .namespace B
    .local int x
    .local int y
    x = 2
    y = 11
    print x
    print "\n"
    print y
    print "\n"
    print z
    print "\n"
    .endnamespace B
    print x
    print "\n"
    print y
    print "\n"
    print z
    print "\n"
    .endnamespace A
    print x
    print "\n"
    print y
    print "\n"
    print z
    print "\n"
    end
.end
CODE
3
10
20
2
11
20
3
10
20
5
10
20
OUT



pir_output_is(<<'CODE', <<'OUT', "rejects unicode namespaces");
.namespace [ "François" ]

.sub '__init'
	print 'unicode namespaces are fun'
.end

.namespace [ "" ]

.sub 'main' :main
	$P0 = find_global 'François', '__init'
	$P0()
.end
CODE
Malformed string
OUT


## remember to change the number of tests!
BEGIN { plan tests => 4; }
