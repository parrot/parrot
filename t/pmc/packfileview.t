#!./parrot

.sub 'main' :main
    .include 'test_more.pir'

    plan(5)

    test_create()
    test_vtable_get_bool()
    test_vtable_get_pmc_keyed_int()
    test_vtable_get_string_keyed_int()
    test_vtable_get_number_keyed_int()
    test_method_constant_counts()
    test_method_main_sub()
    test_method_trigger()
    test_method_serialized_size()
    test_method_serialize()
    test_method_all_subs()
    test_method_read_from_file()
    test_method_write_to_file()
    test_method_deserialize()
.end

.sub 'test_create'
    $P0 = new ['PackfileView']
.end

.sub 'test_vtable_get_bool'
    $P0 = new ['PackfileView']
    if $P0 goto fail_first
    ok(1, "New PackfileView is false")
    goto pass_first
  fail_first:
    ok(0, "New PackfileView should be empty and false")
  pass_first:

    $P0 = getinterp
    $P1 = $P0["packfile"]
    unless $P1 goto fail_second
    ok(1, "Current packfileview is not false")
    goto pass_second
  fail_second:
    ok(0, "Current packfileview is false")
  pass_second:
.end

.sub 'test_vtable_get_pmc_keyed_int'
    # TODO
.end

.sub 'test_vtable_get_string_keyed_int'
    # TODO
.end

.sub 'test_vtable_get_number_keyed_int'
    # TODO
.end

.sub 'test_method_constant_counts'
    $P0 = getinterp
    $P1 = $P0["packfile"]
    $P2 = $P1.'constant_counts'()
    $I0 = isa $P2, 'FixedIntegerArray'
    ok($I0, "packfileview.constant_counts returns a FixedIntegerArray")
    $I2 = elements $P2
    is($I2, 3, "packfileview.constant_counts returns 3 types of constants")
.end

.sub 'test_method_main_sub'
    $P0 = getinterp
    $P1 = $P0["packfile"]
    $P2 = $P1.'main_sub'()
    .const 'Sub' main_sub = 'main'
    is($P2, main_sub,"packfileview.main_sub returns the actual main sub")
.end

.sub 'test_method_trigger'
    # TODO
.end

.sub 'test_method_serialized_size'
    # TODO
.end

.sub 'test_method_serialize'
    # TODO
.end

.sub 'test_method_all_subs'
    # TODO
.end

.sub 'test_method_read_from_file'
    # TODO
.end

.sub 'test_method_write_to_file'
    # TODO
.end

.sub 'test_method_deserialize'
    # TODO
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
