# Copyright (C) 2011, Parrot Foundation.

.sub 'main' :main
    .param pmc args
    .local pmc outfh, ifh
    .local string infile, outfile, program_name
    .local int size
    program_name = shift args
    infile = shift args
    outfile = infile . ".c"
    say outfile
    ifh = new ['FileHandle']
    ifh.'open'(infile, 'rb')
    outfh = new ['FileHandle']
    outfh.'open'(outfile, 'wb')
    print outfh, "#include <stdlib.h>\n\n"
    print outfh, "const unsigned char program_code[] = {"
    size = 0

    read_loop:
    .local string pbcstring
    .local int pbclength

    pbcstring = ifh.'read'(16384)
    pbclength = length pbcstring
    unless pbclength > 0 goto read_done

    .local int pos
    pos = 0
  code_loop:
    unless pos < pbclength goto code_done
    $I0 = ord pbcstring, pos
    $S0 = $I0
    print outfh, $S0
    print outfh, ','
    inc pos
    inc size
    $I0 = size % 32
    unless $I0 == 0 goto code_loop
    print outfh, "\n"
    goto code_loop
  code_done:
    goto read_loop

  read_done:
    say "Done reading input"
    ifh.'close'()

    say "writing coda"
    print outfh, "\n};\n\nconst size_t bytecode_size = "
    $S0 = size
    print outfh, $S0
    print outfh, ";\n"
    print outfh, <<'END_OF_FUNCTION'
        const void * get_program_code(void)
        {
            return program_code;
        }

        const size_t get_program_code_size(void)
        {
            return bytecode_size;
        }
END_OF_FUNCTION

    outfh.'flush'()
    outfh.'close'()
    .return ()

  err_infile:
    die "cannot open infile"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
