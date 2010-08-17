# Copyright (C) 2002-2009, Parrot Foundation.
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

.sub "_debug__help"
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
.end


#
# _debug__dump_playfield()
#
# dump the playfield on stdout.
#
.sub "_debug__dump_playfield"
    .local string divider, line
    .local pmc    playfield

    playfield = get_global "playfield"
    divider = repeat '-', 82
    concat divider, "\n"
    print divider

    $I0 = 0
  DEBUG__DUMP_PLAYFIELD__NEXT_LINE:
    if $I0 >= 25 goto DEBUG__DUMP_PLAYFIELD__END
    $I1 = 0
    line = "|"
  DEBUG__DUMP_PLAYFIELD__NEXT_CHAR:
    if $I1 >= 80 goto DEBUG__DUMP_PLAYFIELD__EOL
    $I2 = playfield[$I0;$I1]
    $S0 = chr $I2
    concat line, $S0
    inc $I1
    goto DEBUG__DUMP_PLAYFIELD__NEXT_CHAR
  DEBUG__DUMP_PLAYFIELD__EOL:
    concat line, "|\n"
    print line
    inc $I0
    goto DEBUG__DUMP_PLAYFIELD__NEXT_LINE

  DEBUG__DUMP_PLAYFIELD__END:
    print divider
    print "\n"
    .return()
.end

# The interpreter has reached a breakpoint. Let's
# stop and interact with user.
.sub "_debug__interact"
  DEBUG__INTERACT__LOOP:
    _debug__print_status()

    print "bef> "
    $P0 = getinterp
    $P0 = $P0.'stdhandle'(.PIO_STDIN_FILENO)
    $S0 = $P0.'readline'()
    $S0 = chopn $S0, 1
    $I0 = length $S0

    if $I0 == 0 goto DEBUG__INTERACT__NEXT
    $S1 = substr $S0, 0, 4
    if $S1 == "dump" goto DEBUG__INTERACT__DUMP
    if $S1 == "help" goto DEBUG__INTERACT__HELP
    if $S1 == "list" goto DEBUG__INTERACT__LIST
    if $S1 == "next" goto DEBUG__INTERACT__NEXT
    if $S1 == "quit" goto DEBUG__INTERACT__QUIT

    $S1 = substr $S0, 0, 5
    if $S1 == "break" goto DEBUG__INTERACT__BREAK
    $S1 = substr $S0, 0, 6
    if $S1 == "delete" goto DEBUG__INTERACT__DELETE
    if $S1 == "status" goto DEBUG__INTERACT__STATUS
    $S1 = substr $S0, 0, 7
    if $S1 == "restart" goto DEBUG__INTERACT__RESTART
    $S1 = substr $S0, 0, 8
    if $S1 == "continue" goto DEBUG__INTERACT__CONTINUE
    print "Unknown instruction. Type help for help.\n"
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__BREAK:
    $S0 = replace $S0, 0, 6, ""
    $P0 = get_global "breakpoints"
    $P0[$S0] = 1
    set_global "breakpoints", $P0
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__CONTINUE:
    $P0 = get_global "step"
    $P0 = 0
    set_global "step", $P0
    goto DEBUG__INTERACT__END

  DEBUG__INTERACT__DELETE:
    $S0 = replace $S0, 0, 7, ""
    $P0 = get_global "breakpoints"
    delete $P0[$S0]
    set_global "breakpoints", $P0
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__DUMP:
    _debug__dump_playfield()
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__HELP:
    _debug__help()
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__LIST:
    print "Not yet implemented...\n"
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__NEXT:
    .local pmc step
    step = get_global "step"
    step = 1
    set_global "step", step
    goto DEBUG__INTERACT__END

  DEBUG__INTERACT__QUIT:
    end

  DEBUG__INTERACT__RESTART:
    print "Not yet implemented...\n"
    goto DEBUG__INTERACT__LOOP

  DEBUG__INTERACT__STATUS:
    _debug__print_status()
    goto DEBUG__INTERACT__LOOP


  DEBUG__INTERACT__END:
    .return()
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
    .local pmc breakpoints, status
    breakpoints = get_global "breakpoints"
    status      = get_global "status"
    $S0 = status["char"]
    $I0 = exists breakpoints[$S0]
    if $I0 == 0 goto DEBUG__CHECK_BREAKPOINT__COORD
    _debug__interact()
    goto DEBUG__CHECK_BREAKPOINT__END

  DEBUG__CHECK_BREAKPOINT__COORD:
    .local int x, y
    x = status["x"]
    y = status["y"]
    $S0 = x
    $S1 = y
    concat $S0, ","
    concat $S0, $S1
    $I0 = exists breakpoints[$S0]
    if $I0 == 0 goto DEBUG__CHECK_BREAKPOINT__ROW
    _debug__interact()
    goto DEBUG__CHECK_BREAKPOINT__END

  DEBUG__CHECK_BREAKPOINT__ROW:
    $S0 = "r:"
    $S1 = y
    concat $S0, $S1
    $I0 = exists breakpoints[$S0]
    if $I0 == 0 goto DEBUG__CHECK_BREAKPOINT__COL
    _debug__interact()
    goto DEBUG__CHECK_BREAKPOINT__END

  DEBUG__CHECK_BREAKPOINT__COL:
    $S0 = "c:"
    $S1 = x
    concat $S0, $S1
    $I0 = exists breakpoints[$S0]
    if $I0 == 0 goto DEBUG__CHECK_BREAKPOINT__END
    _debug__interact()
    # fallback
    #goto DEBUG__CHECK_BREAKPOINT__END

  DEBUG__CHECK_BREAKPOINT__END:
    .return()
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
