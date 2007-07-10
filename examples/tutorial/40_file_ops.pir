.sub main :main
    .local pmc fileout, filein

    fileout = open "data.txt", ">"
    print fileout, "The quick brown fox jumps over the lazy dog.\n"
    close fileout

    filein = open "data.txt", "<"
    $S0 = readline filein
    say $S0
    close filein

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

