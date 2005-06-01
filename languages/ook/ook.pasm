# $Id$

# First, read the file.
        set S20, P5[1]      # Name of the Ook source.
	open P20, S20, "<"  # P20 = file descriptor
	set S21, ""         # S21 = accumulator
READ:
	read S22, P20, 256
	length I20, S22
	le I20, 0, EOF
	concat S21, S22
	branch READ
EOF:
        close P20

# Then, parse it to translate it.
        length I20, S21      # Total length of file.
        set I21, 0           # Char number in the file.
        set I22, 1           # Line number (for error reporting).
        new P21, .ResizablePMCArray  # While-level.
        push P21, 0
        set S22, ""          # Current char.
        set S23, ""          # Current instruction.
        set S24, "\tnew P20, .ResizablePMCArray\n\tset I20,0\n"       # Code generated.
        branch LOOP_END
LOOP:
        length I24, S23
        eq I24, 8, LOOP_CHECK_INSTRUCTION
        substr S22, S21, I21, 1
        inc I21
        eq S22, "\n", LOOP_LINEFEED
        eq S22, "\t", LOOP_END
        eq S22, " ",  LOOP_END
        concat S23, S22
        branch LOOP_END

LOOP_CHECK_INSTRUCTION:
        ne S23, "Ook.Ook?", LOOP_NOT_MOVER
        concat S24, "\tinc I20\n"
        set S23, ""
        branch LOOP_END
LOOP_NOT_MOVER:
        ne S23, "Ook?Ook.", LOOP_NOT_MOVEL
        concat S24, "\tdec I20\n"
        set S23, ""
        branch LOOP_END
LOOP_NOT_MOVEL:
        ne S23, "Ook.Ook.", LOOP_NOT_INC
        concat S24, "\tset I21,P20[I20]\n\tinc I21\n\tset P20[I20],I21\n"
        set S23, ""
        branch LOOP_END
LOOP_NOT_INC:
        ne S23, "Ook!Ook!", LOOP_NOT_DEC
        concat S24, "\tset I21,P20[I20]\n\tdec I21\n\tset P20[I20],I21\n"
        set S23, ""
        branch LOOP_END
LOOP_NOT_DEC:
        ne S23, "Ook!Ook?", LOOP_NOT_WHILE
        bsr MAKE_LABEL
        concat S24, "\tbranch OOK"
        concat S24, S26
        concat S24, "\nKOO"
        concat S24, S26
        concat S24, ":\n"
        push P21, 0
        set S23, ""
        branch LOOP_END
LOOP_NOT_WHILE:
        ne S23, "Ook?Ook!", LOOP_NOT_ELIHW
        pop I25, P21
        bsr MAKE_LABEL
        concat S24, "OOK"
        concat S24, S26
        concat S24, ":\n\tset I21,P20[I20]\n\tne I21,0,KOO"
        concat S24, S26
        concat S24, "\n"
        pop I27, P21
        inc I27
        push P21, I27
        set S23, ""
        branch LOOP_END
LOOP_NOT_ELIHW:
        ne S23, "Ook!Ook.", LOOP_NOT_PRINT
        concat S24, "\tset I21,P20[I20]\n\tchr S21,I21\n\tprint S21\n"
        set S23, ""
        branch LOOP_END
LOOP_NOT_PRINT:
        ne S23, "Ook.Ook!", LOOP_NOT_READ
        set S23, ""
        branch LOOP_END
LOOP_NOT_READ:
        print "OOK? "
        print S20
        print ":"
        print I22
        print " "
        print S23
        print "\n"
        end
LOOP_LINEFEED:
        inc I22
        # Fallthru.
LOOP_END:
        le I21, I20, LOOP
        concat S24, "\tend\n"
        #print S24
        #end
        compreg P22, "PASM"
	compile P0, P22, S24
	invokecc
        end

# Given the content of P21, create a label of integers concateneted in S26.
MAKE_LABEL:
        set I25, P21
        set I26, 0
        set S26, ""
        branch LABEL_END
LABEL_LOOP:
        concat S26, "_"
        set I27, P21[I26]
        set S27, I27
        concat S26, S27
        inc I26
LABEL_END:
        lt I26, I25, LABEL_LOOP
        ret


