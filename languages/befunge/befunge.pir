# $Id$

.include "debug.pir"
.include "flow.pir"
.include "io.pir"
.include "load.pir"
.include "maths.pir"
.include "stack.pir"

.sub "befunge" :main
    .param pmc argv

    print "befunge being ported to a working state...\n"

    # disable buffering on stdout
    #getstdout stdout
    #pioctl I10, P10, 3, 0

    # parsing argv
    .local int debug
    .local pmc playfield
    (playfield,debug) = _parse_argv(argv)
    set_global "playfield", playfield

    # various inits
    .local pmc status
    status = new 'Hash'
    status["x"] = 0       # x coord of the pc
    status["y"] = 0       # y coord of the pc
    status["dir"]  = 1    # direction of the pc
    status["flag"] = 0    # 1=string-mode, 2=bridge, 3=end
    set_global "status", status

    .local pmc stack
    stack = new 'ResizablePMCArray'
    set_global "stack", stack

    .local num seed
    seed = time
    seed = mod seed, .RANDMAX

    .local string user_input
    user_input = ""

        # I5 is debug
        #set S10, P5[I0] ??
        # P1 = the playfield
        # P2 = the stack
        # I0 = x coord of the PC
        # I1 = y coord of the PC
        # I2 = direction of the PC
        # I4 = flag (1=string-mode,2=bridge,3=end)
        # N0 = random seed
        # S2 = user input
        # S0 = current instruction

    .local int    x, y, val
    .local string char
  TICK:
    status = get_global "status"
    x    = status["x"]
    y    = status["y"]
    val  = playfield[y;x]
    char = chr val
    status["char"] = char
    status["val"]  = val
    set_global "status", status

    if debug == 0 goto TICK_NODEBUG
    debug__check_breakpoint()
    
  TICK_NODEBUG:
    if char == '"' goto FLOW_TOGGLE_STRING_MODE
    
    # unknown instruction
    goto MOVE_PC
    
=pod


        eq S0, "\"", FLOW_TOGGLE_STRING_MODE
        eq I4, 1, IO_PUSH_CHAR
        eq I4, 2, MAIN_TRAMPOLINE
        eq I4, 3, MAIN_END

        # Sole number.
        lt S0, "0", NOT_NUM
        le S0, "9", MATHS_PUSH_NUMBER
NOT_NUM:

        # Direction changing.
        eq S0, "^", FLOW_GO_NORTH
        eq S0, ">", FLOW_GO_EAST
        eq S0, "v", FLOW_GO_SOUTH
        eq S0, "<", FLOW_GO_WEST
        eq S0, "?", FLOW_GO_AWAY

        # Flow control.
        eq S0, "`", FLOW_COMPARE
        eq S0, "_", FLOW_EW_IF
        eq S0, "|", FLOW_NS_IF
        eq S0, "#", FLOW_BRIDGE
        eq S0, "@", FLOW_END

        # Math functions.
        eq S0, "+", MATHS_ADD
        eq S0, "-", MATHS_SUB
        eq S0, "*", MATHS_MUL
        eq S0, "/", MATHS_DIV
        eq S0, "%", MATHS_MOD
        eq S0, "!", MATHS_NOT

        # Stack operations.
        eq S0, ":", STACK_DUP
        eq S0, "$", STACK_POP
        eq S0, "\\", STACK_SWAP

        # I/O operations.
        eq S0, "&", IO_INPUT_INT
        eq S0, "~", IO_INPUT_CHAR
        eq S0, ".", IO_OUTPUT_INT
        eq S0, ",", IO_OUTPUT_CHAR
        eq S0, "g", IO_GET_VALUE
        eq S0, "p", IO_PUT_VALUE

=cut

  FLOW_TOGGLE_STRING_MODE:
    flow__toggle_string_mode()
    goto MOVE_PC
    
  MOVE_PC:

=pod

MAIN_TRAMPOLINE:
        set I4, 0               # no more trampoline
MOVE_PC:
        eq I2, 1, MOVE_EAST
        eq I2, 2, MOVE_SOUTH
        eq I2, 3, MOVE_WEST
        # fallback MOVE_NORTH
MOVE_NORTH:
        dec I1
        mod I1, I1, 25
        branch TICK
MOVE_EAST:
        inc I0
        mod I0, I0, 80
        branch TICK
MOVE_SOUTH:
        inc I1
        mod I1, I1, 25
        branch TICK
MOVE_WEST:
        dec I0
        mod I0, I0, 80
        branch TICK

=cut

MAIN_END:
        end
.end


#
# (playfield, debug) = _parse_argv(argv)
#
# parse argv and return the playfield loaded from the file passed as argument,
# and a boolean telling whether we're in debug mode or not.
#
.sub "_parse_argv"
    .param pmc argv

    .local int    i, debug
    .local string arg, char, file
    .local pmc    playfield

    i     = 0
    debug = 0
  _PARSE_ARGS__ARGV_NEXT:
    inc i
    arg  = argv[i]
    char = substr arg, 0, 1
    if char != "-"   goto _PARSE_ARGV__DONE
    if arg  ==  "-d" goto _PARSE_ARGV__DEBUG
    goto _PARSE_ARGS__ARGV_NEXT

  _PARSE_ARGV__DEBUG:
    debug_initialize()
    debug = 1
    goto _PARSE_ARGS__ARGV_NEXT

  _PARSE_ARGV__DONE:
    file      = argv[i]
    playfield = load(file)

    .return(playfield, debug)
.end


########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
