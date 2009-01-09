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

    .local int    x, y, flag, val
    .local string char
  TICK:
    status = get_global "status"
    x    = status["x"]
    y    = status["y"]
    val  = playfield[y;x]
    char = chr val
    flag = status["flag"]
    status["char"] = char
    status["val"]  = val
    set_global "status", status

    if debug == 0 goto TICK_NODEBUG
    debug__check_breakpoint()

  TICK_NODEBUG:
    # flags handling
    if char == '"' goto FLOW_TOGGLE_STRING_MODE
    if flag == 1   goto IO_PUSH_CHAR
    if flag == 2   goto FLOW_TRAMPOLINE
    if flag == 3   goto END

    # sole number
    if char <  '0' goto NOT_NUM
    if char <= '9' goto MATHS_PUSH_NUMBER
  NOT_NUM:

    # direction changing
    if char == '>' goto FLOW_GO_EAST
    if char == '^' goto FLOW_GO_NORTH
    if char == 'v' goto FLOW_GO_SOUTH
    if char == '<' goto FLOW_GO_WEST

    # flow control
    if char == '_' goto FLOW_IF_HORIZONTAL
    if char == '|' goto FLOW_IF_VERTICAL
    
    # math functions
    if char == '!' goto MATHS_NOT
    
    # stack operations
    if char == ':' goto STACK_DUP

    # i/o operations
    if char == 'p' goto IO_GET_VALUE
    if char == 'p' goto IO_PUT_VALUE
    
    # unknown instruction
    if char == ' ' goto MOVE_PC
    print "unknown instruction: "
    print char
    print "\n"
    end
    goto MOVE_PC

=pod

        # Flow control.
        eq S0, "`", FLOW_COMPARE
        #eq S0, "_", FLOW_EW_IF
        #eq S0, "|", FLOW_NS_IF
        eq S0, "#", FLOW_BRIDGE
        eq S0, "@", FLOW_END

        # Math functions.
        eq S0, "+", MATHS_ADD
        eq S0, "-", MATHS_SUB
        eq S0, "*", MATHS_MUL
        eq S0, "/", MATHS_DIV
        eq S0, "%", MATHS_MOD
        #eq S0, "!", MATHS_NOT

        # Stack operations.
        #eq S0, ":", STACK_DUP
        eq S0, "$", STACK_POP
        eq S0, "\\", STACK_SWAP

        # I/O operations.
        eq S0, "&", IO_INPUT_INT
        eq S0, "~", IO_INPUT_CHAR
        eq S0, ".", IO_OUTPUT_INT
        eq S0, ",", IO_OUTPUT_CHAR
        #eq S0, "g", IO_GET_VALUE
        #eq S0, "p", IO_PUT_VALUE

=cut

    # flow instructions
  FLOW_GO_EAST:
    flow__go_east()
    goto MOVE_PC
  FLOW_GO_NORTH:
    flow__go_north()
    goto MOVE_PC
  FLOW_GO_SOUTH:
    flow__go_south()
    goto MOVE_PC
  FLOW_GO_WEST:
    flow__go_west()
    goto MOVE_PC
  FLOW_IF_HORIZONTAL:
    flow__if_horizontal()
    goto MOVE_PC
  FLOW_IF_VERTICAL:
    flow__if_vertical()
    goto MOVE_PC
  FLOW_TOGGLE_STRING_MODE:
    flow__toggle_string_mode()
    goto MOVE_PC
  FLOW_TRAMPOLINE:
    flow__trampoline()
    goto MOVE_PC

    # io instructions
  IO_PUSH_CHAR:
    io__push_char()
    goto MOVE_PC
  IO_GET_VALUE:
    io__get_value()
    goto MOVE_PC
  IO_PUT_VALUE:
    io__put_value()
    goto MOVE_PC

    # maths instructions
  MATHS_NOT:
    maths__not()
    goto MOVE_PC
    
  MATHS_PUSH_NUMBER:
    maths__push_number()
    goto MOVE_PC
    
    # stack operations
  STACK_DUP:
    stack__duplicate()
    goto MOVE_PC
    

    # instruction executed, now move the pc

  MOVE_PC:
    # reload status & associated vars, that may have
    # changed in the subs
    .local int dir
    status = get_global "status"
    dir    = status["dir"]
    x      = status["x"]
    y      = status["y"]

    if dir == 1 goto MOVE_EAST
    if dir == 2 goto MOVE_SOUTH
    if dir == 3 goto MOVE_WEST
    # fallback MOVE_NORTH
  MOVE_NORTH:
    dec y
    mod y, y, 25
    goto MOVE_DONE
  MOVE_EAST:
    inc x
    mod x, x, 80
    goto MOVE_DONE
  MOVE_SOUTH:
    inc y
    mod y, y, 25
    goto MOVE_DONE
  MOVE_WEST:
    dec x
    mod x, x, 80
    # fallback MOVE_DONE
    #goto MOVE_DONE
  MOVE_DONE:
    status["x"] = x
    status["y"] = y
    set_global "status", status
    goto TICK

  END:
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
