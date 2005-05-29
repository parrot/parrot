# Load a file given as parameter.
# Parrot stack:
#   before:     ... filename
#   after:      ... PerlArray
# The perlarray is a perlarray of perlarrays filled with the
# ordinal values of the content of the file, 80x25.
LOAD:
        pushi
        pushs
        pushp
        restore S0              # Fetch the filename
	open P0, S0, "<"
	set S1, ""              # S1 = accumulator

# Read the file.  
LOAD_READ:
	read S2, P0, 256
	length I0, S2
	le I0, 0, LOAD_EOF
	concat S1, S2
	branch LOAD_READ

# Split the buffer around its newlines.
LOAD_EOF:
        close P0
        concat S1, "\n"         # Add a trailing newline if needed.
        length I0, S1           # I0 = length of the buffer
        set I1, -1              # I1 = character offset in the file
        new P1, .ResizablePMCArray      # P1 = the playing field
        new P2, .PerlArray      # P2 = the current line (array of ints)

LOAD_PARSE_BUFFER:
        inc I1
        ge I1, I0, LOAD_END_BUFFER
        substr S2, S1, I1, 1    # S2 = S1[I1]
        eq S2, "\n", LOAD_FILL_LINE
        ord I4, S2
        push P2, I4
        branch LOAD_PARSE_BUFFER
LOAD_FILL_LINE:
        set I10, P2             # I10 = length of current line
        ge I10, 80, LOAD_TRUNCATE_LINE
        push P2, 32
        branch LOAD_FILL_LINE
LOAD_TRUNCATE_LINE:
        set P2, 80              # Truncate the line.
        push P1, P2             # Store the line.
        new P2, .PerlArray      # Create a new line.
        branch LOAD_PARSE_BUFFER

# Fill playfield to 25 rows.
LOAD_END_BUFFER:
        set I15, P1
        ge I15, 25, LOAD_COMPLETE
        new P2, .PerlArray
LOAD_FILL_EMPTY_LINE:
        set I10, P2
        ge I10, 80, LOAD_STORE_EMPTY_LINE
        push P2, 32
        branch LOAD_FILL_EMPTY_LINE
LOAD_STORE_EMPTY_LINE:
        push P1, P2
        new P2, .PerlArray
        branch LOAD_END_BUFFER

# Truncate playfield to 25 rows.
LOAD_COMPLETE:  
        set P1, 25              # Truncate at 25 lines.
        save P1                 # Return the playfield
        popp
        pops
        popi
        ret
