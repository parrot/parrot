# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/hanoi.pasm - Towers of hanoi

=head1 SYNOPSIS

You have to pass in the height of the tower:

    % ./parrot examples/assembly/hanoi.pasm 5

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

    main() {
        size = argv[0]
        int arr[] = [[], [], []]
        arr[0] = [1..size]
        arr[1] = [(0) x size]
        arr[2] = [(0) x size]
        move_stack(arr, size, size, 0, 2, 1)
    }

    move_stack(array, size, num, start, target, storage) {
        if(num == 1) {
         move(array, size, start, target)
    } else {
        # move all but the largest disk to storage
        move_stack(array, size, num-1, start, storage, target)
        # move the largest disk to target
        move(array, size, start, target)
        # move all but the largest disk from storage to target
        move_stack(array, size, num-1, storage, target, start)
    }

    move(array, size, start, target) {
        /* okay, so it's not pseudocode... */
        # find the first non-empty slot on the start column (smallest disk)
        for(i=0; i<size; i++) if(array[start_col][i]) break;
        start_row = i;

        # find the last empty slot on the target column
        for(i=1; i<size; i++) if(array[dest_col][i]) break;
        dest_row  = i - 1;

        # do the move
        array[dest_col][dest_row] = array[start_col][start_row];
        array[start_col][start_row] = 0;

        #print the results
        print(array, size);
    }


=head1 TODO

Convert this to proper PIR, with subroutines and such.

=head1 HISTORY

First version Tony Payne              2002-15-05
Converted to PIR Bernhard Schmalhofer 2005-10-20

=cut

# Towers of hanoi in Parrot Intermediate Representation
.sub "hanoi" :main
        .param pmc argv
        .local int size

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
        print "\n"

        new P0, .FixedPMCArray
        set P0, 3
        new P1, .ResizableIntegerArray
        new P2, .ResizableIntegerArray
        new P3, .ResizableIntegerArray
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
        set I1, size                            # size
        set I2, 0                             # start_col
        set I3, 2                             # target_col
        set I4, 1                             # storage_col
        bsr MOVE_STACK
END:    end

#Params
#  P0 = array (const)
#  I0 = size  (const)
PRINT:  # vars used: I1, I2, I3, I4, size, I6, P1
        set I1, 0                             #I1 = i
        set I2, 0                             #I2 = j
        set I3, 0                             #I3 = k
loop_rows:
        set I2, 0
loop_cols:
        set P1,P0[I2]                         #P1 = P0[j]
        set I4,P1[I1]                         #I4 = cursize; cursize=array[j][i]

        size = I0 - I4                          #size = size-cursize
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
        if 1, loop_cols                       # j < 3
done_loop:
        print "\n"
        inc I1                                # i++
        lt I1, I0, loop_rows                  # i < size
        print "\n"
        ret

# params
# P0 = array
# I0 = size
# I2 = start_col
# I3 = dest_col
MOVE:        #vars used: I4, size, I6, I7, I8, P1, P2
        set I4, 0                             #I4 = i
        set P1, P0[I2]                        #P1 = array[start_col]
loop_find_start_row:
        set I7, P1[I4]                        #I7 = array[start_col][i]
        ne I7, 0, found_start_row
        inc I4                                #  i++
        lt I4, I0, loop_find_start_row        #  i < size
found_start_row:
        set size, I4                            #size = start_row = i
        set P2, P0[I3]                        #P2 = array[dest_col]
        set I4, 0                             #  for( i = 0
loop_find_dest_row:
        set I8, P2[I4]                        #I8 = array[dest_col][i]
        ne I8, 0, found_dest_row              #  if(array[dest_col][i])
        inc I4                                #  i++
        lt I4, I0, loop_find_dest_row         #  i < size
found_dest_row:
        sub I6, I4, 1                         #I6 = dest_row = i - 1
        set P2[I6], I7                        # array[dc][dr]=array[sc][sr]
        set P1[size], 0                         # array[sc][sr]=0
        bsr PRINT
        ret

# P0 = array
# I0 = size
# I1 = num
# I2 = start_col
# I3 = target_col
# I4 = storage_col
MOVE_STACK:
        gt I1, 1, move_multiple               # if num == 1
        bsr MOVE                              # return move(...)
        ret
move_multiple:
        save I1
        dec I1
        save I4
        save I3
        save I2
        set size, I3
        set I3, I4
        set I4, size
        bsr MOVE_STACK                        #move_stack(...)
        restore I2
        restore I3
        restore I4
        restore I1
        save I1
        save I4
        save I3
        save I2
        bsr MOVE                              #move(...)
        restore I2
        restore I3
        restore I4
        restore I1
        save I1
        save I4
        save I3
        save I2
        dec I1
        set size, I2
        set I2, I4
        set I4, size
        bsr MOVE_STACK                        #move_stack(...)
        restore I2
        restore I3
        restore I4
        restore I1
        ret

.end
