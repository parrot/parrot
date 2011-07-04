.sub 'main' :main
    .include 'test_more.pir'

    plan(16)

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
.end

.sub 'test_vtable_get_pmc_keyed_int'
.end

.sub 'test_vtable_get_string_keyed_int'
.end

.sub 'test_vtable_get_number_keyed_int'
.end

.sub 'test_method_constant_counts'
.end

.sub 'test_method_main_sub'
.end

.sub 'test_method_trigger'
.end

.sub 'test_method_serialized_size'
.end

.sub 'test_method_serialize'
.end

.sub 'test_method_all_subs'
.end

.sub 'test_method_read_from_file'
.end

.sub 'test_method_write_to_file'
.end

.sub 'test_method_deserialize'
.end

