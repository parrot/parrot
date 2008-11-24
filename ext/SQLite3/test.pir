#../../parrot -t5 test.pir
.sub 'main'
load_bytecode 'SQLite3'

$P0 = get_global [ 'SQLite' ], 'open'
$P1 = $P0("test.db")

$P2 = get_global [ 'SQLite' ], 'prepare'
$P3 = $P2 ($P1, "CREATE TABLE foo (bar)")

$P4 = get_global [ 'SQLite' ], 'step'
$P5 = $P4 ($P3)

$P6 = get_global [ 'SQLite' ], 'finalize'
$P7 = $P6 ($P3)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
