# Initialize the debug structure.
# P3 = [ 1, "000 ... 000", [x1, x2, ...], [y1, y2, ...], [x1,y1, x2,y2, ...] ]
# P3[0] = stop at each step
# P3[1] = a 128 chars length string, 0 or 1 depending wether the
#         interpreter should stop at the corresponding character.
# P3[2] = a PerlArray of column index that should stop the interpreter.
# P3[3] = a PerlArray of row index that should stop the interpreter.
# P3[4] = a PerlArray of 2d coord that should stop the interpreter.
DEBUG_INITIALIZE:
        pushi
        pushs
        new P3, .PerlArray
        set P3[0], 1          # Stop at first step.
        repeat S10, "0", 128  # No char to break on.
        set P3[1], S10
        new P4, .PerlArray    # No col to break on.
        set P3[2], P4
        new P4, .PerlArray    # No row to break on.
        set P3[3], P4
        new P4, .PerlArray    # No coord to break on.
        set P3[4], P4
        pops
        popi
        ret

        
# Check wether we should stop the interpreter at the current
# moment, allowing user to play with the debugger.
DEBUG_CHECK_BREAKPOINT:
        pushi
        pushs
        set I10, P3[0]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_CHAR
        bsr DEBUG_INTERACT
        branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_CHAR:
DEBUG_CHECK_BREAKPOINT_END:     
        pops
        popi
        ret

        
# The interpreter has reached a breakpoint. Let's
# stop and interact with user.
DEBUG_INTERACT:
        bsr DEBUG_PRINT_STATUS
        ret

        
# Print the status of the instruction pointer:
# coordinates, current char, direction, flags and stack.
DEBUG_PRINT_STATUS:     
        # Coordinates.
        print "("
        print I0
        print ","
        print I1
        print ")"
        # Current char.
        print " - '"
        print S0
        print "' (ord="
        ord I10, S0
        print I10
        print ")"
        # Direction.
        print " dir="
        print I2
        # Flags:        
        set S10, " \""
        eq I4, 1, DEBUG_PRINT_STATUS_FLAG
        set S10, " #"
        eq I4, 2, DEBUG_PRINT_STATUS_FLAG
        set S10, " @"
        eq I4, 3, DEBUG_PRINT_STATUS_FLAG
        set S10, "  "
DEBUG_PRINT_STATUS_FLAG:
        print S10
        # Stack.
        print " stack="
        set I11, P2
        set I10, 0
        ge  I10, I11, DEBUG_PRINT_STATUS_STACK_END
DEBUG_PRINT_STATUS_STACK_LOOP:       
        set I12, P2[I10]
        print I12
        inc I10
        ge I10, I11, DEBUG_PRINT_STATUS_STACK_END
        print ","
        branch DEBUG_PRINT_STATUS_STACK_LOOP
DEBUG_PRINT_STATUS_STACK_END:
        print "\n"
        ret


# Dump the playfield on stdout.
DEBUG_DUMP_PLAYFIELD:
        pushi
        pushs
        repeat S10, "-", 82
        concat S10, "\n"        
        print S10
        set I10, 0
DEBUG_DUMP_PLAYFIELD_NEXT_LINE: 
        set S11, P1[I10]
        print "|"
        print S11
        print "|\n"
        inc I10
        lt I10, 25, DEBUG_DUMP_PLAYFIELD_NEXT_LINE
        print S10
        pops
        popi
        ret
