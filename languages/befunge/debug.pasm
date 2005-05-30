# $Id$

# Initialize the debug structure.
# P3 = [ 1, { "<" => 1, "10,10" => 1, "r:6" => 1, "c:3" => 1, ... } ]
# P3[0] = stop at each step
# P3[1] = a Hash which keys are either the char to break upon
#         when reaching it, or a location "y,x", or a column "c:nn"
#         or a row "r:nn"
DEBUG_INITIALIZE:
        pushi
        pushs
        new P3, .ResizablePMCArray
        set P3[0], 1          # Stop at first step.
        repeat S10, "0", 128  # No char to break on.
        new P4, .Hash
        set P3[1], P4         # The breakpoints.
        pops
        popi
        ret


# Check whether we should stop the interpreter at the current
# moment, allowing user to play with the debugger.
DEBUG_CHECK_BREAKPOINT:
        pushi
        pushs
        pushp
        set I10, P3[0]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_CHAR
        bsr DEBUG_INTERACT
        branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_CHAR:
        set P4, P3[1]
        exists I10, P4[S0]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_COORD
        bsr DEBUG_INTERACT
        branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_COORD:
        set S10, I0
        concat S10, ","
        set S11, I1
        concat S10, S11
        exists I10, P4[S10]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_ROW
        bsr DEBUG_INTERACT
        branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_ROW:
        set S10, "r:"
        set S11, I1
        concat S10, S11
        exists I10, P4[S10]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_COL
        bsr DEBUG_INTERACT
        branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_COL:
        set S10, "c:"
        set S11, I0
        concat S10, S11
        exists I10, P4[S10]
        eq 0, I10, DEBUG_CHECK_BREAKPOINT_END
        bsr DEBUG_INTERACT
        # Fallback
        # branch DEBUG_CHECK_BREAKPOINT_END
DEBUG_CHECK_BREAKPOINT_END:
        popp
        pops
        popi
        ret


# The interpreter has reached a breakpoint. Let's
# stop and interact with user.
DEBUG_INTERACT:
        bsr DEBUG_PRINT_STATUS
        print "bef> "
	getstdin P5
        readline S10, P5
        chopn S10, 1
        length I10, S10
        eq I10, 0, DEBUG_INTERACT_NEXT
        substr S11, S10, 0, 4
        eq S11, "dump", DEBUG_INTERACT_DUMP
        eq S11, "help", DEBUG_INTERACT_HELP
        eq S11, "list", DEBUG_INTERACT_LIST
        eq S11, "next", DEBUG_INTERACT_NEXT
        eq S11, "quit", DEBUG_INTERACT_QUIT
        substr S11, S10, 0, 5
        eq S11, "break", DEBUG_INTERACT_BREAK
        substr S11, S10, 0, 6
        eq S11, "delete", DEBUG_INTERACT_DELETE
        eq S11, "status", DEBUG_INTERACT_STATUS
        substr S11, S10, 0, 7
        eq S11, "restart", DEBUG_INTERACT_RESTART
        substr S11, S10, 0, 8
        eq S11, "continue", DEBUG_INTERACT_CONTINUE
        print "Unknown instruction. Type help for help.\n"
        branch DEBUG_INTERACT
DEBUG_INTERACT_BREAK:
        substr S11, S10, 0, 6, ""
        pushp
        set P4, P3[1]
        set P4[S10], 1      # stop at specified breakpoint
        popp
        branch DEBUG_INTERACT
DEBUG_INTERACT_CONTINUE:
        set P3[0], 0        # do not stop at next instruction
        branch DEBUG_INTERACT_END
DEBUG_INTERACT_DELETE:
        substr S11, S10, 0, 7, ""
        pushp
        set P4, P3[1]
        delete P4[S10]
        popp
        branch DEBUG_INTERACT
DEBUG_INTERACT_DUMP:
        bsr DEBUG_DUMP_PLAYFIELD
        branch DEBUG_INTERACT
DEBUG_INTERACT_HELP:
        print "Available commands are:\n"
        print " status        - print state of current IP\n"
        print " dump          - dump playfield\n"
        print " break c       - set a breakpoint on character c\n"
        print " break x,y     - set a breakpoint at coords (x,y)\n"
        print " break c:x     - set a breakpoint on column x\n"
        print " break r:y     - set a breakpoint on row y\n"
        print " delete c      - delete breakpoint on character c\n"
        print " delete x,y    - delete breakpoint at coords (x,y)\n"
        print " delete c:x    - delete breakpoint on column x\n"
        print " delete r:y    - delete breakpoint on row y\n"
        print " list          - list breakpoints\n"
        print " next          - step one befunge instruction\n"
        print " continue      - resume execution\n"
        print " restart       - restart execution\n"
        print " quit          - abort execution\n"
        print " help          - display this message\n"
        print "\n"
        branch DEBUG_INTERACT
DEBUG_INTERACT_LIST:
        print "Not yet implemented...\n"
        branch DEBUG_INTERACT
DEBUG_INTERACT_NEXT:
        set P3[0], 1        # stop at next instruction
        branch DEBUG_INTERACT_END
DEBUG_INTERACT_QUIT:
        end
DEBUG_INTERACT_RESTART:
        #branch MAIN
        print "Not yet implemented...\n"
        branch DEBUG_INTERACT
DEBUG_INTERACT_STATUS:
        bsr DEBUG_PRINT_STATUS
        branch DEBUG_INTERACT
DEBUG_INTERACT_END:
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
        ge I10, 25, DEBUG_DUMP_PLAYFIELD_END
        set I11, 0
        set S11, "|"
DEBUG_DUMP_PLAYFIELD_NEXT_CHAR:
        ge I11, 80, DEBUG_DUMP_PLAYFIELD_EOL
        set I12, P1[I10;I11]
        chr S12, I12
        concat S11, S12
        inc I11
        branch DEBUG_DUMP_PLAYFIELD_NEXT_CHAR
DEBUG_DUMP_PLAYFIELD_EOL:
        concat S11, "|\n"
        print S11
        inc I10
        branch DEBUG_DUMP_PLAYFIELD_NEXT_LINE
DEBUG_DUMP_PLAYFIELD_END:
        print S10
        pops
        popi
        ret
