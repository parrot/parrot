# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

examples/pir/hanoi.pir - Towers of hanoi

=head1 SYNOPSIS

You have to pass in the height of the tower:

    % ./parrot examples/pir/hanoi.pir 5

=head1 DESCRIPTION

Towers of Hanoi (http://www.cut-the-knot.org/recurrence/hanoi.shtml) is
a combinatorial puzzle. The PIR shows manipulation of arrays of
integers.

=head1 Data Structure

C<P0> is a C<FixedPMCArray> PMC with three entries.  Each entry is a
C<ResizableIntegerArray> PMC which represents a tower (column) of Hanoi.

The towers are arrays of integers. 0 indicates no disk is present. A
positive integer indicates the diameter of the disk occupying the
indicated slot.

So this setup

      ||    ||   ||
     ====   ||   ||
    ======  ||   ==

is represented as

    [[0, 2, 3], [0, 0, 0], [0, 0, 1]]

In pseudocode:

    sub main() {
        size = argv[0]
        int towers[] = [[], [], []]
        towers[0] = [1..size]
        towers[1] = [(0) x size]
        towers[2] = [(0) x size]
        move_stack(towers, size, size, 0, 2, 1)

	sub move_stack(n_to_move, start, target, storage) {
	    if (n_to_move == 1) {
	        move(start, target)
	    }
            else {
		# Move all but the largest disk to storage.
		move_stack(n_to_move-1, start, storage, target)
		# Move the largest disk to target.
		move(start, target)
		# Move all but the largest disk from storage to target.
		move_stack(n_to_move-1, storage, target, start)
	    }
        }

	sub move(start, target) {
	    /* okay, so it's not pseudocode... */
	    # find the first non-empty slot on the start column (smallest disk)
	    for(i=0; i<size; i++) if(towers[start_col][i]) break;
	    start_row = i;

	    # find the last empty slot on the target column
	    for(i=1; i<size; i++) if(towers[dest_col][i]) break;
	    dest_row  = i - 1;

	    # do the move
	    towers[dest_col][dest_row] = towers[start_col][start_row];
	    towers[start_col][start_row] = 0;

	    #print the results
	    print(towers, size);
	}
    }

=head1 TODO

Improve tower representation.

Replace I3 etc. with mnemonic register names.

=head1 HISTORY

 First version               Tony Payne            2002-15-05
 Converted to PIR            Bernhard Schmalhofer  2005-10-20
 Use PCC instead of bsr/ret  Bob Rogers            2008-04-06

=cut

# Towers of hanoi in Parrot Intermediate Representation
.sub "hanoi" :main
        .param pmc argv
        .local int size

	.local pmc size_pmc
	.lex "size", size_pmc

        # check number of command line arguments
        $I0 = argv
        if $I0 < 2 goto USE_DEFAULT_SIZE
        S5 = argv[1]
        size = S5
        print "Building a tower of size "
        print size
        print ".\n"
        goto SIZE_IS_NOW_KNOWN
USE_DEFAULT_SIZE:
        print "Using default size 3 for tower.\n"
        size = 3
SIZE_IS_NOW_KNOWN:
	size_pmc = new 'Integer'
	size_pmc = size
        print "\n"

	.lex "towers", P0
        new P0, 'FixedPMCArray'
        set P0, 3
        new P1, 'ResizableIntegerArray'
        new P2, 'ResizableIntegerArray'
        new P3, 'ResizableIntegerArray'
        set P0[0], P1                         #P0 = [[],[],[]]
        set P0[1], P2
        set P0[2], P3

        set I0, 0
loop_populate:
        add I1, I0, 1
        set P1[I0], I1                        #P0=[[1,2,3,...],[0,0,0...],[0,0,0...]]
        set P2[I0], 0
        set P3[I0], 0
        inc I0
        lt  I0, size, loop_populate
	## Now solve it.
        MOVE_STACK(size, 0, 2, 1)
.end

## Print the current state of the towers array.
.sub print_towers :outer(hanoi)
        .param pmc towers	# an array

	## Only PMCs can be stored as lexical variables, but we need an int.
	.local pmc tower_size_pmc
	tower_size_pmc = find_lex "size"
	.local int tower_size
	tower_size = tower_size_pmc

	set I1, 0                             #I1 = i
        set I2, 0                             #I2 = j
        set I3, 0                             #I3 = k
loop_rows:
        set I2, 0
loop_cols:
        set P1,towers[I2]                     #P1 = towers[j]
        set I4,P1[I1]                         #I4 = cursize; cursize=array[j][i]
	.local int size
        size = tower_size - I4                #size = size-cursize
        repeat S0, " ", size
        print S0
        mul I6, I4, 2                         #I6 = cursize * 2
        repeat S0, "=", I6
        print S0
        repeat S0, " ", size
        print S0

        inc I2                                # j++
        eq I2, 3, done_loop
        print " | "
        goto loop_cols                        # j < 3
done_loop:
        print "\n"
        inc I1                                # i++
        lt I1, tower_size, loop_rows                  # i < size
        print "\n"
.end

## Take the topmost disk off the start_col stack, and put it on the
## dest_col stack.
.sub MOVE :outer(hanoi)
	.param int start_col
	.param int dest_col

	.local pmc tower_size_pmc, towers
	towers = find_lex "towers"
	tower_size_pmc = find_lex "size"
	.local int tower_size
	tower_size = tower_size_pmc

        set I4, 0                             #I4 = i
        set P1, towers[start_col]             #P1 = array[start_col]
loop_find_start_row:
        set I7, P1[I4]                        #I7 = array[start_col][i]
        ne I7, 0, found_start_row
        inc I4                                #  i++
        lt I4, tower_size, loop_find_start_row  #  i < size
found_start_row:
	.local int size
        set size, I4                          #size = start_row = i
        set P2, towers[dest_col]              #P2 = array[dest_col]
        set I4, 0                             #  for( i = 0
loop_find_dest_row:
        set I8, P2[I4]                        #I8 = array[dest_col][i]
        ne I8, 0, found_dest_row              #  if(array[dest_col][i])
        inc I4                                #  i++
        lt I4, tower_size, loop_find_dest_row  #  i < size
found_dest_row:
        sub I6, I4, 1                         #I6 = dest_row = i - 1
        set P2[I6], I7                        # array[dc][dr]=array[sc][sr]
        set P1[size], 0                       # array[sc][sr]=0
        print_towers(towers)
.end

## Move n_to_move disks from start_col to target_col, using storage_col
## for temporary storage if needed.
.sub MOVE_STACK :outer(hanoi)
	.param int n_to_move
	.param int start_col
	.param int target_col
	.param int storage_col

	## We don't need to fetch the lexical size and

        if n_to_move > 1 goto move_multiple
        MOVE(start_col, target_col)
	.return ()
move_multiple:
        dec n_to_move
        MOVE_STACK(n_to_move, start_col, storage_col, target_col)
        MOVE(start_col, target_col)
        MOVE_STACK(n_to_move, storage_col, target_col, start_col)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
