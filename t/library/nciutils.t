#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/library/nciutils.t -- Tests for NCI::Utils

=head1 SYNOPSIS

    % prove t/library/nciutils.t

=head1 DESCRIPTION

Testing Perl 6 objects.

=cut

.sub 'main' :main
    load_bytecode 'Test/More.pbc'

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace ['Test';'More']
    exports        = split ' ', 'plan diag ok nok is todo'
    test_namespace.'export_to'(curr_namespace, exports)

    ##  set our plan
    plan(13)

    ##  make sure we can load the NCI::Utils library
    push_eh load_fail
    load_bytecode 'NCI/Utils.pbc'
    pop_eh
    ok(1, 'load_bytecode')
    goto load_success

  load_fail:
    ok(0, "load_bytecode 'P6object.pbc' failed -- skipping tests")
    .return ()

  load_success:
    .local pmc ncifunc, null_pmc
    ncifunc = get_hll_global ['NCI';'Utils'], 'ncifunc'
    null null_pmc

    ## try some builtin stdlib funcs
    $P0 = ncifunc(null_pmc, 'atoi', 'it')
    $S0 = "2468"
    ( $I0 ) = $P0($S0)
    is($I0, 2468, 'atoi("2468")')

    $P0 = ncifunc(null_pmc, 'atol', 'lt')
    $S0 = "7654321"
    ( $I0 ) = $P0($S0)
    is($I0, 7654321, 'atol("7654321")')

    $P0 = ncifunc(null_pmc, 'strcmp', 'itt')
    ( $I0 ) = $P0('hello', 'hello')
    is($I0, 0, 'strcmp == 0')

    ##  load a library
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    $I0 = isnull libnci_test
    nok($I0, "libnci_test loaded")
    if $I0 goto loadlib_failed


    $P0 = ncifunc(libnci_test, 'nci_c', 'c')
    $I0 = $P0()
    is( $I0, 22, "nci_c - return char in $I0" )

    $P0 = ncifunc(libnci_test, 'nci_l', 'l')
    $I0 = $P0()
    is( $I0, -7777777, "nci_l - return long in $I0" )

    $P0 = ncifunc(libnci_test, 'nci_s', 's')
    $I0 = $P0()
    is($I0, 333, "nci_s - return a short in $I0")

    $P0 = ncifunc(libnci_test, 'nci_t', 't')
    $S0 = $P0()
    is($S0, "This is a C-string.\n", "nci_t - return a C string")

    $P0 = ncifunc(libnci_test, 'nci_isc', 'isc')
    $I1 = 2
    $I2 = 3
    $I0 = $P0($I1, $I2)
    is($I0, 6, "nci_isc - return an int from short + char")

    $P0 = ncifunc(libnci_test, 'nci_ssc', 'ssc')
    $I1 = -2
    $I2 = 3
    $I0 = $P0($I1, $I2)
    is($I0, -6, "nci_ssc - return short from short + char")

    $P0 = ncifunc(libnci_test, 'nci_tt', 'tt')
    $S0 = "ko"
    $S1 = $P0($S0)
    is($S1, "ok worked\n", "nci_tt - flip two characters")

    $P0 = ncifunc(libnci_test, 'nci_pi', 'pi')
    $I0 = 10
    $P1 = $P0($I0)
    $I1 = isnull $P1
    ok($I1, "nci_pi(10) - returned a null pointer as PMCNULL")

  loadlib_failed:
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
