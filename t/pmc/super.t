#! parrot
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/super.t - test the Super PMC

=head1 SYNOPSIS

    % prove t/pmc/super.t

=head1 DESCRIPTION

Tests the Super PMC.

=cut


.const int TESTS = 10


.sub main :main
    # load this library
    load_bytecode 'library/Test/More.pir'

    # get the testing functions
    .local pmc exporter, test_namespace
    test_namespace = get_namespace [ "Test::More" ]
    exporter = new 'Exporter'
    exporter.'source'(test_namespace)
    exporter.'import'('plan diag ok is like skip isa_ok' :named('globals'))

    plan(TESTS)

    'new/isa'()
    'set_pmc/get_pmc'()
.end


# 6
.sub 'new/isa'
    .local pmc super, obj
    super = new 'Super'
    ok(1, 'init "Super"')
    isa_ok(super, 'Super')


    obj = new 'Integer'            # no parent

    push_eh eh__obj_has_no_parent
    $P0 = new 'Super', obj
    clear_eh
    ok(0, 'init_pmc "Super" with object that has no parent should fail')
    skip(1, 'cannot test isa: no object')
    goto obj_has_no_parent__done
  eh__obj_has_no_parent:
    ok(1, 'init_pmc "Super" with object that has no parent fails')
    isa_ok(super, 'Super')
  obj_has_no_parent__done:


    obj = new 'ResizablePMCArray'  # parent is FixedPMCArray

    push_eh eh__obj_has_parent
    super = new 'Super', obj
    clear_eh
    ok(1, 'init_pmc "Super" with object that has parent succeeds')
    isa_ok(super, 'Super')
    goto obj_has_parent__done
  eh__obj_has_parent:
    ok(0, 'init_pmc "Super" with object that has parent should succeed')
    skip(1, 'cannot test isa: no object')
  obj_has_parent__done:
.end


# 4
.sub 'set_pmc/get_pmc'
    .local pmc super, set_obj, get_obj, nul
    super   = new 'Super'
    set_obj = new 'ResizablePMCArray'
    nul     = new 'Null'

    super = set_obj
    ok(1, 'set_pmc')
    get_obj = super
    ok(1, 'get_pmc')
    is(get_obj, set_obj, 'get_pmc returns what set_pmc set')

    super = nul
    get_obj = super
    $I0 = isnull get_obj
    ok($I0, 'set_pmc with Null sets null value')
.end


## TODO find_method


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
