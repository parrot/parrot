# First, read the file.
        set S0, P5[1]      # Name of the Ook source.
	open P0, S0, "<"   # P0 = file descriptor
	set S1, ""         # S1 = accumulator
READ:
	read S2, P0, 256
	length I0, S2
	le I0, 0, EOF
	concat S1, S2
	branch READ
EOF:
        close P0

# Then, parse it to translate it.
        length I0, S1       # Total length of file.
        set I1, 0           # Char number in the file.
        set I2, 1           # Line number (for error reporting).
        new P1, .PerlArray  # While-level.
        push P1, 0
        set S2, ""          # Current char.
        set S3, ""          # Current instruction.
        set S4, "\tnew P0,.PerlArray\n\tset I0,0\n"       # Code generated.
        branch LOOP_END
LOOP:
        length I4, S3
        eq I4, 8, LOOP_CHECK_INSTRUCTION
        substr S2, S1, I1, 1
        inc I1
        eq S2, "\n", LOOP_LINEFEED
        eq S2, "\t", LOOP_END
        eq S2, " ",  LOOP_END
        concat S3, S2
        branch LOOP_END

LOOP_CHECK_INSTRUCTION:
        ne S3, "Ook.Ook?", LOOP_NOT_MOVER
        concat S4, "\tinc I0\n"
        set S3, ""
        branch LOOP_END
LOOP_NOT_MOVER:
        ne S3, "Ook?Ook.", LOOP_NOT_MOVEL
        concat S4, "\tdec I0\n"
        set S3, ""
        branch LOOP_END
LOOP_NOT_MOVEL:
        ne S3, "Ook.Ook.", LOOP_NOT_INC
        concat S4, "\tset I1,P0[I0]\n\tinc I1\n\tset P0[I0],I1\n"
        set S3, ""
        branch LOOP_END
LOOP_NOT_INC:
        ne S3, "Ook!Ook!", LOOP_NOT_DEC
        concat S4, "\tset I1,P0[I0]\n\tdec I1\n\tset P0[I0],I1\n"
        set S3, ""
        branch LOOP_END
LOOP_NOT_DEC:
        ne S3, "Ook!Ook?", LOOP_NOT_WHILE
        bsr MAKE_LABEL
        concat S4, "\tbranch OOK"
        concat S4, S6
        concat S4, "\nKOO"
        concat S4, S6
        concat S4, ":\n"
        push P1, 0
        set S3, ""
        branch LOOP_END
LOOP_NOT_WHILE:
        ne S3, "Ook?Ook!", LOOP_NOT_ELIHW
        pop I10, P1
        bsr MAKE_LABEL
        concat S4, "OOK"
        concat S4, S6
        concat S4, ":\n\tset I1,P0[I0]\n\tne I1,0,KOO"
        concat S4, S6
        concat S4, "\n"
        pop I7, P1
        inc I7
        push P1, I7
        set S3, ""
        branch LOOP_END
LOOP_NOT_ELIHW:
        ne S3, "Ook!Ook.", LOOP_NOT_PRINT
        concat S4, "\tset I1,P0[I0]\n\tchr S1,I1\n\tprint S1\n"
        set S3, ""
        branch LOOP_END
LOOP_NOT_PRINT:
        ne S3, "Ook.Ook!", LOOP_NOT_READ
        set S3, ""
        branch LOOP_END
LOOP_NOT_READ:
        print "OOK? "
        print S0
        print ":"
        print I2
        print " "
        print S3
        print "\n"
        end
LOOP_LINEFEED:
        inc I2
        # Fallthru.
LOOP_END:
        le I1, I0, LOOP
        concat S4, "\tend\n"
        #print S4
	# needs imcc:
	# ../imcc/imcc -r ook.pasm hello.ook
	compreg P1, "PASM"
	compile P0, P1, S4
	invoke
        end

# Given the content of P1, create a label of integers concateneted in S6.
MAKE_LABEL:
        set I10, P1
        set I11, 0
        set S6, ""
        branch LABEL_END
LABEL_LOOP:
        concat S6, "_"
        set I12, P1[I11]
        set S7, I12
        concat S6, S7
        inc I11
LABEL_END:
        lt I11, I10, LABEL_LOOP
        ret


