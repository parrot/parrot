#!./parrot
# Copyright (C) 2005-2010, Parrot Foundation.

=head1 NAME

t/basic.t

=head1 SYNOPSIS

        $ prove t/compilers/tge/basic.t

=head1 DESCRIPTION

testing a few basic components of TGE::Grammar and TGE::Tree

=cut

.sub main :main
    .include 'test_more.pir'
     plan(11)

     test_build_up_a_basic_rule_in_a_grammar()
     test_agid_hash()
     test_malformed_string_in_r11890_under_linux_i386()
.end

.sub test_build_up_a_basic_rule_in_a_grammar
    load_bytecode 'TGE.pbc'

    .local pmc AG
    AG = new ['TGE';'Grammar']
    AG.'add_rule'('Leaf', 'min', '.', '.return(1)')

    $P1 = getattribute AG, 'rules'
    .local pmc rule_obj
    rule_obj = $P1[0]
    $P2 = getattribute rule_obj, 'type'
    is($P2, 'Leaf', 'build up a basic rule in a grammar')
    $P3 = getattribute rule_obj, 'name'
    is($P3, 'min', 'build up a basic rule in a grammar')
    $P4 = getattribute rule_obj, 'parent'
    is($P4, '.', 'build up a basic rule in a grammar')
.end

.sub test_agid_hash
    load_bytecode 'TGE.pbc'
    .local pmc tree
    tree = new ['TGE';'Tree']
    .local int id

    $P0 = new 'Integer'
    id = tree.'_lookup_id'($P0)
    is(id, 1, 'agid hash')
    $P1 = new 'Integer'
    id = tree.'_lookup_id'($P1)
    is(id, 2, 'agid hash')
    id = tree.'_lookup_id'($P0)
    is(id, 1, 'agid hash')
    $P2 = new 'Integer'
    id = tree.'_lookup_id'($P2)
    is(id, 3, 'agid hash')
    id = tree.'_lookup_id'($P0)
    is(id, 1, 'agid hash')
    id = tree.'_lookup_id'($P1)
    is(id, 2, 'agid hash')
    id = tree.'_lookup_id'($P2)
    is(id, 3, 'agid hash')
.end

.sub test_malformed_string_in_r11890_under_linux_i386
    lives_ok(<<'CODE', '"Malformed string" in r11890 under Linux i386')
.sub main :main
    load_bytecode "TGE.pbc"
    .return ()
.end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
