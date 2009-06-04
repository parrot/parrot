#! ../../parrot

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'vtdumper.pbc'

    plan(13)
    comments()
    invalid_sections()
    section_assignment()
.end

.sub comments
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['comments: before section'] = <<"VTABLE"
#HAVE A NICE DAY
[NICE_DAY]
VTABLE

    parse_tests['comments: after section'] = <<"VTABLE"
[COCONUTS]
#I've got a lovely bunch of coconuts.
VTABLE

parse_tests['comments: with section'] = <<"VTABLE"
[VERY_IMPORTANT] #This is an important function that does important things.
VTABLE

    test_parse_loop(parse_tests, 0)

.end


.sub invalid_sections
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['invalid: empty name'] = <<"VTABLE"
[]
VTABLE

    parse_tests['invalid: space in name'] = <<"VTABLE"
[FOO BAR]
VTABLE

    parse_tests['invalid: non-identifier characters in name'] = <<"VTABLE"
[FOO*BAR]
VTABLE

    parse_tests['invalid: non-identifier name'] = <<"VTABLE"
[???]
VTABLE
    
    test_parse_loop(parse_tests, 1)

.end


.sub section_assignment

    .local pmc parse_test

    parse_test = new ['String']

    parse_test = <<"VTABLE"
void in_main()    
[BOGUS]
[HAPPY]
INTVAL pants(PMC* p)
[STRANGE]
INTVAL attraction()
VTABLE

    .local pmc emitter, past, node
    .local string section, name
    (emitter, past) = get_emitter_and_capture(parse_test, "past")

    node    = past[0]
    name    = node['name']
    section = node['section']
    is(name, 'in_main', 'in_main has expected name')
    is(section, 'MAIN', 'in_main is in MAIN section by default')
    
    node    = past[1]
    name    = node['name']
    section = node['section']
    is(name, 'pants', 'pants has expected name')
    is(section, 'HAPPY', 'pants are HAPPY')
    
    node    = past[2]
    name    = node['name']
    section = node['section']
    is(name, 'attraction', 'attraction has expected name')
    is(section, 'STRANGE', 'attraction is in STRANGE section')
    

.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
