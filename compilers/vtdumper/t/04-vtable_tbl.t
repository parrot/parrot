#! ../../parrot

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'vtdumper.pbc'

    plan(1)
    parse_vtable_tbl()
.end

.sub parse_vtable_tbl
    .local pmc past, code, eh
    .local int ok

    eh   = new ['ExceptionHandler']
    set_addr eh, fail_eh
    code = new ['String']
    code = _slurp("../../src/vtable.tbl")
    ok = 1
    push_eh fail_eh
    past = get_past(code)
    goto all_ok
  fail_eh:
    ok = 0
  all_ok:
    pop_eh
    is(ok, 1, "successfully parsed vtable.tbl")
.end





# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
