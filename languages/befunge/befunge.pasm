        branch MAIN

.include "flow.pasm"
.include "io.pasm"
.include "load.pasm"
.include "maths.pasm"
.include "stack.pasm"
        
MAIN:
        set I0, 0
        set I4, 0               # verbose mode
ARGV_NEXT:        
        inc I0       
        set S10, P0[I0]
        substr S11, S10, 0, 1
        ne S11, "-", ARGV_DONE
        eq S10, "-v", ARGV_VERBOSE
        branch ARGV_NEXT
ARGV_VERBOSE:
        inc I4
        branch ARGV_NEXT
ARGV_DONE:
        set S10, P0[I0]
        save S10
        bsr LOAD
        restore P1              # the playfield
        new P2, .PerlArray      # the stack
        set I0, 0               # x coord of the PC
        set I1, 0               # y coord of the PC
        set I2, 1               # direction of the PC
        set I5, 0               # flag (1=string-mode,2=bridge,3=end)
        time N0                 # random seed
        mod N0, N0, .RANDMAX
        set S0, " "             # current instruction
        set S1, P1[0]           # current line
        set S2, ""              # user input
        
TICK:
        substr S0, S1, I0, 1
        eq I4, 0, TICK_NOVERBOSE
        bsr VERBOSE
TICK_NOVERBOSE:
        eq S0, "\"", FLOW_TOGGLE_STRING_MODE
        eq I5, 1, IO_PUSH_CHAR
        eq I5, 2, MAIN_TRAMPOLINE
        eq I5, 3, MAIN_END

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

        # Unknow instruction.
        branch MOVE_PC
        
MAIN_TRAMPOLINE:        
        set I5, 0               # no more trampoline
MOVE_PC:
        eq I2, 1, MOVE_EAST
        eq I2, 2, MOVE_SOUTH
        eq I2, 3, MOVE_WEST
        # fallback MOVE_NORTH
MOVE_NORTH:
        dec I1
        mod I1, I1, 25
        set S1, P1[I1]
        branch TICK
MOVE_EAST:
        inc I0
        mod I0, I0, 80
        branch TICK
MOVE_SOUTH:
        inc I1
        mod I1, I1, 25
        set S1, P1[I1]
        branch TICK
MOVE_WEST:
        dec I0
        mod I0, I0, 80
        branch TICK
        
MAIN_END:
        end

VERBOSE:
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
        eq I5, 1, VERBOSE_PRINT_FLAG
        set S10, " #"
        eq I5, 2, VERBOSE_PRINT_FLAG
        set S10, " @"
        eq I5, 3, VERBOSE_PRINT_FLAG
        set S10, "  "
VERBOSE_PRINT_FLAG:
        print S10
        # Stack.
        print " stack="
        set I11, P2
        set I10, 0
        ge  I10, I11, VERBOSE_STACK_END
VERBOSE_STACK_LOOP:       
        set I12, P2[I10]
        print I12
        inc I10
        ge I10, I11, VERBOSE_STACK_END
        print ","
        branch VERBOSE_STACK_LOOP
VERBOSE_STACK_END:
        print "\n"
        ret

DUMP_PLAYFIELD:
        pushi
        pushs
        repeat S10, "-", 82
        concat S10, "\n"        
        print S10
        set I10, 0
DUMP_NEXT_LINE: 
        set S11, P1[I10]
        print "|"
        print S11
        print "|\n"
        inc I10
        lt I10, 25, DUMP_NEXT_LINE
        print S10
        pops
        popi
        ret