# Copyright (C) 2002-2009, Parrot Foundation.
# $Id$

.loadlib 'io_ops'

.include "debug.pir"
.include "flow.pir"
.include "io.pir"
.include "load.pir"
.include "maths.pir"
.include "stack.pir"

.sub "befunge" :main
    .param pmc argv

    push_eh catch

    # disable buffering on stdout
    .local pmc stdout
    getstdout stdout
    stdout.'buffer_type'("unbuffered")

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
    status["flag"] = 0    # 1=string-mode, 2=bridge
    set_global "status", status

    .local pmc stack
    stack = new 'ResizablePMCArray'
    set_global "stack", stack

    .local pmc user_input
    user_input = new 'String'
    user_input = ""
    set_global "user_input", user_input

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

    if char == ' ' goto MOVE_PC

    # sole number
    if char <  '0' goto NOT_NUM
    if char <= '9' goto MATHS_PUSH_NUMBER
  NOT_NUM:

    # direction changing
    if char == '>' goto FLOW_GO_EAST
    if char == '^' goto FLOW_GO_NORTH
    if char == 'v' goto FLOW_GO_SOUTH
    if char == '<' goto FLOW_GO_WEST
    if char == '?' goto FLOW_GO_AWAY

    # flow control
    if char == '`' goto FLOW_COMPARE
    if char == '_' goto FLOW_IF_HORIZONTAL
    if char == '|' goto FLOW_IF_VERTICAL
    if char == '#' goto FLOW_BRIDGE
    if char == '@' goto FLOW_END

    # math functions
    if char == '+' goto MATHS_ADD
    if char == '-' goto MATHS_SUB
    if char == '*' goto MATHS_MUL
    if char == '/' goto MATHS_DIV
    if char == '%' goto MATHS_MOD
    if char == '!' goto MATHS_NOT

    # stack operations
    if char == ':' goto STACK_DUP
    if char == '$' goto STACK_POP
    if char == '\' goto STACK_SWAP

    # i/o operations
    if char == '~' goto IO_INPUT_CHAR
    if char == '&' goto IO_INPUT_INT
    if char == ',' goto IO_OUTPUT_CHAR
    if char == '.' goto IO_OUTPUT_INT
    if char == 'g' goto IO_VALUE_GET
    if char == 'p' goto IO_VALUE_PUT

    # unknown instruction
    goto MOVE_PC

    # flow instructions
  FLOW_BRIDGE:
    flow__trampoline(1)
    goto MOVE_PC
  FLOW_COMPARE:
    flow__compare()
    goto MOVE_PC
  FLOW_END:
    flow__end()
    goto MOVE_PC
  FLOW_GO_AWAY:
    flow__go_away()
    goto MOVE_PC
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
    flow__trampoline(0)
    goto MOVE_PC

    # io instructions
  IO_INPUT_CHAR:
    io__input_char()
    goto MOVE_PC
  IO_INPUT_INT:
    io__input_integer()
    goto MOVE_PC
  IO_OUTPUT_CHAR:
    io__output_char()
    goto MOVE_PC
  IO_OUTPUT_INT:
    io__output_int()
    goto MOVE_PC
  IO_PUSH_CHAR:
    io__push_char()
    goto MOVE_PC
  IO_VALUE_GET:
    io__value_get()
    goto MOVE_PC
  IO_VALUE_PUT:
    io__value_put()
    goto MOVE_PC

    # maths instructions
  MATHS_ADD:
    maths__add()
    goto MOVE_PC
  MATHS_DIV:
    maths__div()
    goto MOVE_PC
  MATHS_MOD:
    maths__mod()
    goto MOVE_PC
  MATHS_MUL:
    maths__mul()
    goto MOVE_PC
  MATHS_NOT:
    maths__not()
    goto MOVE_PC
  MATHS_PUSH_NUMBER:
    maths__push_number()
    goto MOVE_PC
  MATHS_SUB:
    maths__sub()
    goto MOVE_PC

    # stack operations
  STACK_DUP:
    stack__duplicate()
    goto MOVE_PC
  STACK_POP:
    $I0 = stack__pop()
    goto MOVE_PC
  STACK_SWAP:
    $I0 = stack__swap()
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

  catch:
    .local pmc ex
    .get_results (ex)
    printerr ex

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
