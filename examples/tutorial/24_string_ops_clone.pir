.sub main :main
    .local pmc firstname

    firstname = new String
    firstname = "Ford"
    say firstname 

    $P1 = firstname
    $P1 = "Zaphod"
    say firstname


    $P2 = clone firstname
    $P2 = "Trillian"
    say firstname

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

