# Load a file given as parameter.
# Parrot stack:
#   before:     ... filename
#   after:      ... PerlArray        
# The perlarray is filled with the content of the file, 80x25.
LOAD:
        pushi
        pushs
        pushp
        restore S0              # Fetch the filename
	open P0, S0, "<"
	set S1, ""              # Accumulator
        new P1, .PerlArray      # The playing field

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
        length I0, S1           # I0 =length of the buffer
        set I1, 0               # I1 =ranges from 0 to I0
        set I2, 0               # I2 =beginning of current line
        set I3, 0               # I3 =current line in the array

LOAD_PARSE_BUFFER:
        lt I0, I1, LOAD_END_BUFFER
        substr S2, S1, I1, 1
        ne S2, "\n", LOAD_NONL
        sub I4, I1, I2
        substr S3, S1, I2, I4
        add I2, I4
        inc I2                  # Trailing newline
        set P1[I3], S3
        inc I3

LOAD_NONL:
        inc I1
        branch LOAD_PARSE_BUFFER

# Fill/truncate playfield to 25 rows and 80 columns.
LOAD_END_BUFFER:
        set P1, 25
        set I0, 0
        repeat S4, " ", 80

LOAD_TRUNCATE:
        set S3, P1[I0]
        concat S3, S4
        substr S3, S3, 0, 80
        set P1[I0], S3
        inc I0
        lt I0, 25, LOAD_TRUNCATE

# Return the playfield
        save P1
        popp
        pops
        popi
        ret
