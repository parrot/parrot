# $Id$

#
# ** globals used for debug purposes:
#
# step: boolean telling whether to stop at each step
#
# breakpoints: hash listing the existing breakpoints. the keys are
# either the char to break upon when reaching it, or a location "y,x",
# or a column "c:nn", or a row "r:nn"
# eg: { "<" => 1, "10,10" => 1, "r:6" => 1, "c:3" => 1, ... }
#

#
# debug_initialize()
#
# declare & initialize global debug variables
#
.sub "debug_initialize"
    .local pmc step, breakpoints

    step = new 'Integer'
    step = 1
    breakpoints = new 'Hash'

    set_global "step", step
    set_global "breakpoints", breakpoints
    #repeat S10, "0", 128  # No char to break on.

    .return()
.end


.sub "_debug__print_status_coordinates"
    $P0 = get_global "status"
    $I0 = $P0["x"]
    $I1 = $P0["y"]

    print "("
    print $I0
    print ","
    print $I1
    print ")"
.end

.sub "_debug__print_status_current_char"
    $P0 = get_global "status"
    $S0 = $P0["char"]
    $I0 = $P0["val"]

    print "'"
    print $S0
    print "' (ord="
    print $I0
    print ")"
.end

.sub "_debug__print_direction"
    $P0 = get_global "status"
    $I0 = $P0["dir"]
    print "dir="
    print $I0
.end

.sub "_debug__print_flags"
    $P0 = get_global "status"
    $I0 = $P0["flag"]

    $S0 = '"'
    if $I0 == 1 goto DEBUG__PRINT_FLAGS__PRINT
    $S0 = '#'
    if $I0 == 2 goto DEBUG__PRINT_FLAGS__PRINT
    $S0 = '@'
    if $I0 == 3 goto DEBUG__PRINT_FLAGS__PRINT
    $S0 = '-'
  DEBUG__PRINT_FLAGS__PRINT:
    print $S0
.end

.sub "_debug__print_stack"
    .local int i, len

    print "stack="

    $P0 = get_global "stack"
    len = $P0
    i   = 0
    if i >= len goto DEBUG_PRINT_STACK__END
  DEBUG_PRINT_STACK__LOOP:
    $I0 = $P0[i]
    print $I0
    inc i
    if i >= len goto DEBUG_PRINT_STACK__END
    print ","
    goto DEBUG_PRINT_STACK__LOOP
  DEBUG_PRINT_STACK__END:
.end

# Print the status of the instruction pointer:
# coordinates, current char, direction, flags and stack.
.sub "_debug__print_status"
    _debug__print_status_coordinates()
    print " - "
    _debug__print_status_current_char()
    print " "
    _debug__print_direction()
    print " "
    _debug__print_flags()
    print " "
    _debug__print_stack()
    print "\n"
.end

.sub "_debug__interact"
    _debug__print_status()
.end


# Check whether we should stop the interpreter at the current
# moment, allowing user to play with the debugger.
.sub "debug__check_breakpoint"
    .local pmc step

    step = get_global "step"
    if step == 0 goto DEBUG__CHECK_BREAKPOINT__CHAR
    _debug__interact()
    goto DEBUG__CHECK_BREAKPOINT__END

  DEBUG__CHECK_BREAKPOINT__CHAR:
  DEBUG__CHECK_BREAKPOINT__END:

.end

=pod

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


  DEBUG__CHECK_BREAKPOINT__END:
    .return()

.end

=pod


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
        set P4, P3[1]
        set P4[S10], 1      # stop at specified breakpoint
        branch DEBUG_INTERACT
DEBUG_INTERACT_CONTINUE:
        set P3[0], 0        # do not stop at next instruction
        branch DEBUG_INTERACT_END
DEBUG_INTERACT_DELETE:
        substr S11, S10, 0, 7, ""
        set P4, P3[1]
        delete P4[S10]
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





# Dump the playfield on stdout.
DEBUG_DUMP_PLAYFIELD:
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
        ret

=cut

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
