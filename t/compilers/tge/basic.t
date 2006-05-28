#!perl
# Copyright 2005-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Test::More;
use Parrot::Test;


=head1 NAME

t/basic.t - testing a few basic components of TGE and TGE::Tree

=head1 SYNOPSIS

	$ prove t/basic.t

=cut


pir_output_is(<<'CODE', <<'OUT', 'build up a basic rule in a grammar');

.sub _main :main
    load_bytecode 'compilers/tge/TGE.pir'

    .local pmc AG
    AG = new 'TGE'
    AG.agrule('Leaf', 'min', '.', '.return(1)')

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

pir_output_is(<<'CODE', <<'OUT', 'autoincrementing id generator');
.sub _main :main
    load_bytecode 'compilers/tge/TGE/Tree.pir'
    
    .local pmc new_id
    new_id = find_global 'TGE::Tree', '_new_id'
    .local int id
    id = new_id()
    print id
    print "\n"
    id = new_id()
    print id
    print "\n"
    id = new_id()
    print id
    print "\n"
    end
.end

CODE
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

## remember to change the number of tests :-)
BEGIN { plan tests => 3; }

