#!./parrot
# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

t/library/tcl_lib.t

=head1 DESCRIPTION

test parrot to external Tcl connection

=head1 SYNOPSIS

    % prove t/library/tcl_lib.t

=cut

.const int TESTS = 1

.sub 'main' :main
    .include 'test_more.pir'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace [ 'Test'; 'More' ]
    exports        = split ' ', 'plan diag ok nok is is_deeply like isa_ok skip isnt todo'

    test_namespace.'export_to'(curr_namespace, exports)

    plan(TESTS)

    load_bytecode 'TclLibrary.pbc' # TBD pbc
    'ok'(1, 'loaded TclLibrary')

    goto skip_all    # this is TEMPORARY untill the case of missing libtcl is fixed

    .local pmc tcl
    tcl = new 'TclLibrary'
    'ok'(1, 'created instance')

    .local string res
    .local int ires
    res = tcl.'eval'("return {3+3}")
    'is'(res, '3+3', 'return of a string')
    # TODO res = tcl.'eval'("return [list a b foo bar]")
    ires = tcl.'eval'("expr {3+3}")
    'is'(ires, 6, 'return of an integer')
    res = tcl.'eval'("return [expr 1.0]")
    'is'(res, '1.0', 'return of double')

skip_all:

.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

