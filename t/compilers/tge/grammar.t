# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);

use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

tge/grammar.t - TGE::Parser tests

=head1 SYNOPSIS

    $ prove t/compilers/tge/grammar.t

=head1 DESCRIPTION

This is a test script to try out constructing a tree grammar from a tree
grammar syntax file, and using the constructed grammar to transform a
tree of the specified type.

=cut

pir_output_is(<<'CODE', <<'OUT', 'test compiling anonymous and named grammars');

.sub _main :main
    load_bytecode 'TGE.pbc'

    # Load the grammar in a string
    .local string source
    source = <<'GRAMMAR'
    transform min (Leaf) :language('PIR') { 
        $P1 = getattribute node, "value"
       .return ($P1)
    }
GRAMMAR

    # Compile a grammar from the source 
    .local pmc grammar
    $P1 = new 'TGE::Compiler'
    grammar = $P1.'compile'(source)
    $S1 = typeof grammar
    say $S1

    # Add the grammar keyword and recompile
    source = "grammar TreeMin is TGE::Grammar;\n\n" . source
    grammar = $P1.'compile'(source)
    $S1 = typeof grammar
    say $S1

    # Add a POD comment and recompile
    source = "=head NAME\n\n  TreeMin\n\n=cut\n\n" . source
    grammar = $P1.'compile'(source)
    $S1 = typeof grammar
    say $S1
.end
CODE
AnonGrammar
TreeMin
TreeMin
OUT

pir_output_is(<<'CODE', <<'OUT', 'complete example: Branch/Leaf tree grammar');

.sub _main :main
    .param pmc argv

    load_bytecode 'TGE.pbc'

    # Load the grammar in a string
    .local string source
    source = <<'GRAMMAR'
    grammar TreeMin is TGE::Grammar;

    transform min (Leaf) :language('PIR') { 
        $P1 = getattribute node, "value"
       .return ($P1)
    }

    transform min (Branch) :language('PIR') {
        .local pmc left
        .local pmc right
        .local pmc min
        .local pmc left_val
        .local pmc right_val

        left = getattribute node, "left"
        left_val = tree.get('min', left)
        right = getattribute node, "right"
        right_val = tree.get('min', right)

        min = left_val
        if min <= right_val goto got_min
        min = right_val
      got_min:
       .return (min)
    }

    # find the global minimum and propagate it back down the tree
    transform gmin (ROOT) :language('PIR') { 
        .local pmc gmin
        gmin = new Integer
        gmin = tree.get('min', node)
        .return (gmin)
    }

    transform gmin (Branch) :applyto('left') :language('PIR') { 
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }

    transform gmin (Branch) :applyto('right') :language('PIR') {
        .local pmc gmin
        gmin = tree.get('gmin', node)
        .return (gmin)
    }

    # reconstruct the tree with every leaf replaced with the minimum
    # value
    transform result (Leaf) :language('PIR') {
        .local pmc newnode

        newnode = new 'Leaf'
        $P1 = tree.get('gmin', node)
        setattribute newnode, 'value', $P1
        .return(newnode)
    }

    transform result (Branch) :language('PIR') {
        .local pmc newnode
        .local pmc left_child
        .local pmc right_child
        newnode = new 'Branch'
        left_child = getattribute node, 'left'
        right_child = getattribute node, 'right'
        $P1 = tree.get('result', left_child)
        $P2 = tree.get('result', right_child)

        setattribute newnode, 'left', $P1
        setattribute newnode, 'right', $P2
        .return(newnode)
    }
GRAMMAR

    # Compile a grammar from the source 
    .local pmc grammar
    $P1 = new 'TGE::Compiler'
    grammar = $P1.'compile'(source)

    # Build up the tree for testing
    .local pmc tree
    tree = buildtree()

    # Apply the grammar to the test tree
    .local pmc AGI
    AGI = grammar.apply(tree)

    # Retrieve the value of a top level attribute
    $P4 = AGI.get('gmin')
    print "the global minimum attribute value is: "
    print $P4
    print " of type: "
    $S4 = typeof $P4
    print $S4
    print "\n"

    # Rerieve the transformed tree
    $P5 = AGI.get('result')

    $P6 = getattribute tree, 'left'
    $P7 = getattribute $P6, 'left'
    $P8 = getattribute $P7, 'value'
    print "before transform, the value of the left-most leaf is: "
    print $P8
    print "\n"

    $P6 = getattribute $P5, 'left'
    $P7 = getattribute $P6, 'left'
    $P8 = getattribute $P7, 'value'
    print "after transform, the value of the left-most leaf is: "
    print $P8
    print "\n"

    $P10 = getattribute tree, 'right'
    $P11 = getattribute $P10, 'right'
    $P12 = getattribute $P11, 'right'
    $P13 = getattribute $P12, 'value'
    print "before transform, the value of the right-most leaf is: "
    print $P13
    print "\n"

    $P10 = getattribute $P5, 'right'
    $P11 = getattribute $P10, 'right'
    $P12 = getattribute $P11, 'right'
    $P13 = getattribute $P12, 'value'
    print "after transform, the value of the right-most leaf is: "
    print $P13
    print "\n"

    end

  err_parse:
    print "Unable to parse the tree grammar.\n"
    end
.end

# ----------------------------------
.sub buildtree
    # Create Leaf class
    newclass $P1, "Leaf"
    addattribute $P1, "value"   # the value of the leaf node

    # Create Branch class
    newclass $P2, "Branch"
    addattribute $P2, "left"            # left child
    addattribute $P2, "right"           # right child

    $P0 = build_Leaf(5)
    $P1 = build_Leaf(9)
    $P2 = build_Branch($P0, $P1)

    $P3 = build_Leaf(1)
    $P4 = build_Branch($P3, $P2)

    $P5 = build_Leaf(2)
    $P6 = build_Leaf(3)
    $P7 = build_Branch($P5, $P6)

    $P8 = build_Branch($P7, $P4)

    .return($P8)
.end

.sub build_Leaf
    .param int value
    .local pmc newnode
    newnode = new 'Leaf'
    $P1 = new Integer
    $P1 = value
    setattribute newnode, 'value', $P1
    .return(newnode)
.end

.sub build_Branch
    .param pmc left_child
    .param pmc right_child
    .local pmc newnode
    newnode = new 'Branch'
    setattribute newnode, 'left', left_child
    setattribute newnode, 'right', right_child
    .return(newnode)
.end

CODE
the global minimum attribute value is: 1 of type: Integer
before transform, the value of the left-most leaf is: 2
after transform, the value of the left-most leaf is: 1
before transform, the value of the right-most leaf is: 9
after transform, the value of the right-most leaf is: 1
OUT


TODO: {
local $TODO = "unresolved bug";

pir_output_is(<<'CODE', <<'OUT', 'two rules of the same name can apply to the same node, when called with a different dummy type');

.sub _main :main
    load_bytecode 'TGE.pbc'

    # Load the grammar in a string
    .local string source
    source = <<'GRAMMAR'
    grammar TreeMin is TGE::Grammar;

    transform tiddlywinks (ROOT) :language('PIR') { 
        say 'in tiddlywinks'
        tree.'get'('twister', node, 'pingpong')
        tree.'get'('twister', node, 'pongpong')
    }
    transform twister (pingpong) :language('PIR') { 
        say 'in first twister'
    }
    transform twister (pongpong) :language('PIR') { 
        say 'in second twister'
    }
GRAMMAR


    .local object testing
    testing = new .Hash

    # Compile a grammar from the source 
    .local pmc grammar
    $P1 = new 'TGE::Compiler'
    grammar = $P1.'compile'(source)

    # Apply the grammar to the test tree
    .local pmc AGI
    AGI = grammar.apply(testing)

    # Retrieve the value of a top level attribute
    $P4 = AGI.get('tiddlywinks')
    end
.end

CODE
in tiddlywinks
in first twister
in second twister
OUT
}

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut



