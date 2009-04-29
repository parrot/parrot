#!parrot

# Test that vtables initialised properly.

.sub 'main' :main
.include 'test_more.pir'
    load_bytecode 'compilers/pmc/pmc.pbc'

    plan(1)

    $P0 = get_hll_global ["PMC"; "VTableInfo"], 'vtable_list'
    $P1 = $P0()

    $I0 = elements $P1
    ok($I0, "We've got some vtables")
.end


# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
