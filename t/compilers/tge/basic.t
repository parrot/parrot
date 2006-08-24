#!perl
# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test tests => 3;


=head1 NAME

t/basic.t - testing a few basic components of TGE::Grammar and TGE::Tree

=head1 SYNOPSIS

	$ prove t/compilers/tge/basic.t

=cut


pir_output_is(<<'CODE', <<'OUT', 'build up a basic rule in a grammar');

.sub _main :main
    load_bytecode 'TGE.pbc'

    .local pmc AG
    AG = new 'TGE::Grammar'
    AG.add_rule('Leaf', 'min', '.', '.return(1)')

    $P1 = getattribute AG, 'rules'
    .local pmc rule_obj
    rule_obj = $P1[0]
    $P2 = getattribute rule_obj, 'type'
    print $P2
    print "\n"
    $P3 = getattribute rule_obj, 'name'
    print $P3
    print "\n"
    $P4 = getattribute rule_obj, 'parent'
    print $P4
    print "\n"
    end
.end

CODE
Leaf
min
.
OUT

pir_output_is(<<'CODE', <<'OUT', 'agid hash');
.sub _main :main
    load_bytecode 'compilers/tge/TGE/Tree.pir'
    .local pmc tree
    tree = new 'TGE::Tree'
    .local int id
    
    $P0 = new .Integer
    id = tree.'_lookup_id'($P0)
    print id
    print "\n"
    $P1 = new .Integer
    id = tree.'_lookup_id'($P1)
    print id
    print "\n"
    id = tree.'_lookup_id'($P0)
    print id
    print "\n"
    $P2 = new .Integer
    id = tree.'_lookup_id'($P2)
    print id
    print "\n"
    id = tree.'_lookup_id'($P0)
    print id
    print "\n"
    id = tree.'_lookup_id'($P1)
    print id
    print "\n"
    id = tree.'_lookup_id'($P2)
    print id
    print "\n"
    end
.end

CODE
1
2
1
3
1
2
3
OUT


pir_output_is(<<'CODE', <<'OUT', '"Malformed string" in r11890 under Linux i386');

.sub test
  load_bytecode "PAST.pbc"
  load_bytecode "TGE.pbc"
  print "1\n"
.end
CODE
1
OUT


