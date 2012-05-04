#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.sub 'main' :main
    .include 'test_more.pir'

    plan(20)

    test_create()
    test_interp_same_after_compile()
    test_vtable_get_bool()
    test_vtable_get_pmc_keyed_int()
    test_vtable_get_string_keyed_int()
    test_vtable_get_number_keyed_int()
    test_method_constant_counts()
    test_method_main_sub()
    test_method_subs_by_tag()
    test_method_subs_by_tag_tag_syntax()
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

.sub 'test_interp_same_after_compile'
    $P0 = getinterp
    $P2 = compreg "PIR"
    $S0 = ".sub __init :anon :init\nok(1, 'init function executed on demand')\n.end"
    $P5 = $P2.'compile'($S0)
    $P1 = getinterp
    is_same($P0, $P1, "interp['packfile'] does not change over IMCC invocation")
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

# We are executing this file as a program, so :load functions shouldn't be
# triggered automatically. In the 'test_method_subs_by_tag' test, we do it
# manually.
.sub '__onload' :load
    ok(1, "can manually trigger :load")
.end
.sub 'test_method_subs_by_tag'
    $P0 = getinterp
    $P1 = $P0["packfile"]
    $P3 = $P1.'subs_by_tag'("load")
    $I0 = elements $P3
    is($I0, 1)
    $P4 = $P3[0]
    $P4()

    $P2 = compreg "PIR"
    $S0 = ".sub __init :anon :init\nok(1, 'init function executed on demand')\n.end"
    $P5 = $P2.'compile'($S0)
    $P3 = $P5.'subs_by_tag'("init")
    $I0 = elements $P3
    is($I0, 1)
    $P4 = $P3[0]
    $P4()
.end

.sub 'test_method_subs_by_tag_tag_syntax'
    $P0 = getinterp
    $P1 = $P0["packfile"]

    $P2 = $P1.'subs_by_tag'("tag-a")
    $I0 = elements $P2
    is($I0, 1, "Can get subs marked 'tag-a'")

    $P2 = $P1.'subs_by_tag'("tag-b")
    $I0 = elements $P2
    is($I0, 2, "Can get subs marked 'tag-b'")

    $P2 = $P1.'subs_by_tag'("tag-c")
    $I0 = elements $P2
    is($I0, 2, "Can get subs marked 'tag-c'")

    # For upgrade, verify that :init is the same as :tag("init")
    $P2 = compreg "PIR"
    $S0 = <<'__EOCODE__'

.sub __init_old :init
    .return("init_old")
.end

.sub __init_tag :tag("init")
    .return("init_tag")
.end

.sub __not_init :tag("something-else")
    .return("not_init")
.end
__EOCODE__

    $P1 = $P2.'compile'($S0)
    $P3 = $P1.'subs_by_tag'("init")
    $I0 = elements $P3
    is($I0, 2)
.end

.sub 'test_method_serialized_size'
    $P0 = new ['PackfileView']
    $I0 = $P0.'serialized_size'()
    is($I0, 0, "Empty PackfileView has serialized_size 0")

    $P0 = getinterp
    $P1 = $P0["packfile"]
    $I0 = $P1.'serialized_size'()
    isnt($I0, 0, "non-empty PackfileView has serialized_size != 0")
.end

.sub 'test_method_serialize'
    $P0 = new ['PackfileView']
    $S0 = $P0.'serialize'()
    is($S0, "", "Empty PackfileView serializes to empty string")

    $P0 = getinterp
    $P1 = $P0["packfile"]
    $S0 = $P1.'serialize'()
    isnt($S0, "", "Non-empty PackfileView serializes to non-empty string")
.end

.sub 'test_method_deserialize'
    # TODO
.end

.sub 'test_method_all_subs'
    $P0 = getinterp
    $P1 = $P0["packfile"]
    $P2 = $P1.'all_subs'()
    $S0 = typeof $P2
    is($S0, "ResizablePMCArray")
    $I0 = elements $P2
    isnt($I0, 0)

    # TODO: Should we iterate over all subs, and verify that they are all
    # Sub objects?
.end

.sub 'test_method_read_from_file'
    # TODO: Would really like temporary files for this. GH #517
.end

.sub 'test_method_write_to_file'
    # TODO: Would really like temporary files for this. GH #517
.end

# Subs with :tag syntax
.sub 'tag1' :tag("tag-a")
    .return('tag1')
.end

.sub 'tag2' :tag("tag-b")
    .return('tag2')
.end

.sub 'tag3' :tag("tag-c")
    .return('tag3')
.end

.sub 'tag4' :tag("tag-c", "tag-b")
    .return('tag4')
.end

# Helper method
.sub 'is_same'
    .param pmc x
    .param pmc y
    .param string msg
    $I0 = issame x, y
    'ok'($I0, msg)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
