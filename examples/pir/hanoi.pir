# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

examples/pir/hanoi.pir - Towers of hanoi

=head1 SYNOPSIS

You may pass in the height of the tower:

    % ./parrot examples/pir/hanoi.pir 5

The default is 3.

=head1 DESCRIPTION

Towers of Hanoi (http://www.cut-the-knot.org/recurrence/hanoi.shtml) is
a combinatorial puzzle. The PIR shows manipulation of arrays of
integers.

=head1 Data Structure

C<towers> is a C<FixedPMCArray> PMC with three elements.  Each element is a
C<ResizableIntegerArray> PMC which represents a tower (column) of Hanoi.
Each integer element of the array represents a single disk, where the
integer value is the size of the disk.  The top of the tower is at the
highest index; since a larger disk cannot be placed on top of a smaller
one, it follows that the tower array must always be sorted in descending
order.  This lends itself naturally to use of the C<push> and C<pop>
operations for moving disks.

So this situation (after the first move)

           |        |
     ====  |        |
    ====== |        |   ==

is represented as

    [[3, 2], [], [1]]

In pseudocode:

    sub main() {
        size = argv[0] || 3
        int towers[] = [[size..1], [], []]
        move_stack(size, 0, 2, 1)

        sub move_stack(n_to_move, start, target, storage) {
            if (n_to_move == 1) {
                move_one(start, target)
            }
            else {
                # Move all but the largest disk to storage.
                move_stack(n_to_move-1, start, storage, target)
                # Move the largest disk to the target.
                move_one(start, target)
                # Move all but the largest disk from storage to target.
                move_stack(n_to_move-1, storage, target, start)
            }
        }

        sub move_one(start_col, dest_col) {
            # Do the move
            push(towers[dest_col], pop(towers[start_col]));

            # Print the results
            print(towers);
        }
    }

=head1 TODO

Replace $I6 etc. with mnemonic register names.

=head1 HISTORY

 First version               Tony Payne            2002-15-05
 Converted to PIR            Bernhard Schmalhofer  2005-10-20
 Use PCC instead of bsr/ret  Bob Rogers            2008-04-06

=cut

# Towers of hanoi in Parrot Intermediate Representation
.sub "hanoi" :main
        .param pmc argv
        .local int size

        ## Create some lexical bindings.
        .local pmc size_pmc, print_towers
        .lex "size", size_pmc
        ## Note that we don't need to do find_lex on the closures; functions are
        ## sought using find_name, which looks at outer lexical scopes.
        .lex "print_towers", print_towers
        print_towers = get_hll_global 'print_towers'
        print_towers = newclosure print_towers
        .local pmc move_one, move_stack
        .lex "move_one", move_one
        move_one = get_hll_global 'MOVE'
        move_one = newclosure move_one
        .lex "move_stack", move_stack
        move_stack = get_hll_global 'MOVE_STACK'
        move_stack = newclosure move_stack

        # Check number of command line arguments
        $I0 = argv
        if $I0 < 2 goto USE_DEFAULT_SIZE
        $S5 = argv[1]
        size = $S5
        if size < 1 goto INVALID_SIZE
        print "Building a tower of size "
        print size
        print ".\n"
        goto SIZE_IS_NOW_KNOWN
INVALID_SIZE:
        print "Given tower size is invalid.\n"
        goto USE_DEFAULT_SIZE
USE_DEFAULT_SIZE:
        print "Using default size 3 for tower.\n"
        size = 3
SIZE_IS_NOW_KNOWN:
        size_pmc = new 'Integer'
        size_pmc = size
        print "\n"

        .local pmc towers
        .lex "towers", towers
        new towers, 'FixedPMCArray'
        set towers, 3
        new $P1, 'ResizableIntegerArray'
        new $P2, 'ResizableIntegerArray'
        new $P3, 'ResizableIntegerArray'
        set towers[0], $P1
        set towers[1], $P2
        set towers[2], $P3
        ## towers = [[],[],[]]

        .local int i
        i = size
loop_populate:
        push $P1, i
        dec i
        if i > 0 goto loop_populate
        ## towers = [[...,3,2,1],[],[]]

        # uncomment to print initial layout
        # print_towers(towers)

        ## Now solve it.
        move_stack(size, 0, 2, 1)
        .return ()
.end

## Print the current state of the towers array.
.sub print_towers :outer(hanoi)
        .param pmc towers       # an array

        ## Only PMCs can be stored as lexical variables, but we need an int.
        .local pmc tower_size_pmc
        tower_size_pmc = find_lex "size"
        .local int tower_size
        tower_size = tower_size_pmc

        .local pmc stack
        .local int i, j, stack_size, tos
        i = tower_size
        dec i
loop_rows:
        j = 0
loop_cols:
        .local int disk_size, n_spaces
        stack = towers[j]
        stack_size = stack
        disk_size = 0
        if stack_size <= i goto print_it
        disk_size = stack[i]                 # disk_size = towers[j][i]
print_it:
        n_spaces = tower_size - disk_size
        repeat $S0, " ", n_spaces
        print $S0
        $I6 = mul disk_size, 2                # $I6 = disk_size * 2
        repeat $S1, "=", $I6
        print $S1
        print $S0

        inc j
        if j == 3 goto done_loop
        print " | "
        goto loop_cols
done_loop:
        print "\n"
        dec i
        if i >= 0 goto loop_rows
        print "\n"
.end

## Take the topmost disk off the start_col stack, and put it on the dest_col
## stack.  The way we've defined the data structures makes this trivial.
.sub MOVE :outer(hanoi)
        .param int start_col
        .param int dest_col

        .local pmc towers
        towers = find_lex "towers"

        .local pmc start_stack, dest_stack
        .local int disk
        start_stack = towers[start_col]
        disk = pop start_stack
        dest_stack = towers[dest_col]
        push dest_stack, disk
        print_towers(towers)
.end

## Move n_to_move disks from start_col to target_col, using storage_col
## for temporary storage if needed.
.sub MOVE_STACK :outer(hanoi)
        .param int n_to_move
        .param int start_col
        .param int target_col
        .param int storage_col

        if n_to_move > 1 goto move_multiple
        move_one(start_col, target_col)
        .return ()
move_multiple:
        dec n_to_move
        ## Move all but the largest disk to storage.
        move_stack(n_to_move, start_col, storage_col, target_col)
        ## Move the largest disk to the target.
        move_one(start_col, target_col)
        ## Move all but the largest disk from storage to target.
        move_stack(n_to_move, storage_col, target_col, start_col)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
