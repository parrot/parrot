# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

transform - transform a sample tree of Branch and Leaf nodes

=head1 SYNOPSIS

  # must be run from this directory ...
  $ ../../../parrot transform.pir branch.g

=head1 DESCRIPTION

This example script constructs a tree grammar from a tree grammar syntax
file, and uses the constructed grammar to transform a tree of the
specified type.

=cut

.sub _main :main
    .param pmc argv

    load_bytecode 'TGE.pbc'
    load_bytecode 'lib/Leaf.pir'
    load_bytecode 'lib/Branch.pir'

    # Load the syntax file
    .local string source
    source = _get_source(argv)

    # Compile a grammar from the source grammar file
    .local pmc grammar
    $P1 = new ['TGE';'Compiler']
    grammar = $P1.'compile'(source)

    # Build up the tree for testing
    .local pmc tree
    tree = buildtree()

    # Apply the grammar to the test tree
    .local pmc AGI
    AGI = grammar.'apply'(tree)

    # Retrieve the value of a top level attribute
    $P4 = AGI.'get'('gmin')
    print "----\nthe global minimum attribute value is: "
    print $P4
    print " of type: "
    $S4 = typeof $P4
    print $S4
    print "\n"

    # Retrieve the transformed tree
    $P5 = AGI.'get'('result')
#    $S5 = typeof $P5
#    print $S5
#    print "\n"

    $P6 = getattribute tree, 'left'
    $P7 = getattribute $P6, 'left'
    $P8 = getattribute $P7, 'value'
    print "----\nbefore transform, the value of the left-most leaf is: "
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
    print "----\nbefore transform, the value of the right-most leaf is: "
    print $P13
    print "\n"

    $P10 = getattribute $P5, 'right'
    $P11 = getattribute $P10, 'right'
    $P12 = getattribute $P11, 'right'
    $P13 = getattribute $P12, 'value'
    print "after transform, the value of the right-most leaf is: "
    print $P13
    print "\n----\n"

    end

  err_parse:
    print "Unable to parse the tree grammar.\n"
    end
.end


# Read in the source either from a file or from STDIN
.sub _get_source
    .param pmc argv

    .local pmc filehandle
    .local string filename

    $I0 = argv
    if $I0 == 2 goto fromfile

    $P0 = getinterp
    .include 'stdio.pasm'
    filehandle = $P0.'stdhandle'(.PIO_STDIN_FILENO)
    goto grabline

  fromfile:
    # Read in the source file
    filename = argv[1]
    filehandle = new ['FileHandle']
    filehandle.'open'(filename, 'r')

  grabline:
    $S1 = filehandle.'read'(65535)
#    $S1 = readline filehandle
#    print $S1

    if $I0 != 2 goto finished
    filehandle.'close'()

  finished:
    .return ($S1)
.end


# ----------------------------------
.sub buildtree
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
    $P1 = new 'Integer'
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

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
