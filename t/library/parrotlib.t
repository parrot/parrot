#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/library/parrotlib.t - testing library/parrotlib.pir

=head1 SYNOPSIS

        % prove t/library/parrotlib.t

=head1 DESCRIPTION

This test program test whether the library 'parrotlib.pir' returns the
expected absolute filenames.

=cut

# Common code in the test files

.include 'load_bytecode.pir'

.sub main :main
    '__load_bytecode'('runtime/parrot/include/parrotlib.pbc')

    .include 'test_more.pir'
    plan(6)

    test_include_file_location()
    test_include_file_location_non_existent()
    test_imcc_compile_file_location()
    test_imcc_compile_file_location_non_existent()
    test_dynext_location()
    test_dynext_location_non_existent()
.end


# Testing include_file_location

.sub test_include_file_location
    .local pmc    location_sub
    .local string location
    location_sub = get_global ["_parrotlib"], "include_file_location"
    location     = location_sub( 'datatypes.pasm' )
    is(location,'runtime/parrot/include/datatypes.pasm', 'include file location' )
.end

.sub test_include_file_location_non_existent
    .local pmc    location_sub
    .local string location
    location_sub = get_global ['_parrotlib'], "include_file_location"
    location     = location_sub( 'nonexistent.pasm' )
    is(location, '', 'include file location non-existent')
.end

# Testing imcc_compile_file_location

.sub test_imcc_compile_file_location
    .local pmc    location_sub
    .local string location
    location_sub = get_global ['_parrotlib'], "imcc_compile_file_location"
    location     = location_sub( 'parrotlib.pbc' )
    is(location, 'runtime/parrot/include/parrotlib.pbc','imcc compile file location')
.end

.sub test_imcc_compile_file_location_non_existent
    .local pmc    location_sub
    .local string location
    location_sub = get_global ['_parrotlib'], "imcc_compile_file_location"
    location     = location_sub( 'nonexistent.pbc' )
    is(location, '', 'imcc compile file location, non-existent')
.end

# Testing dynext_location

.sub test_dynext_location
    .include 'iglobals.pasm'
    .local pmc config_hash, interp
    .local pmc    location_sub
    .local string location

    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['load_ext']
    location_sub = get_global ['_parrotlib'], "dynext_location"
    location     = location_sub( 'libnci_test', $S0 )
    $S1 = 'runtime/parrot/dynext/libnci_test'
    $S1 .= $S0
    is(location, $S1, 'dynext_location')
.end

.sub test_dynext_location_non_existent
    .local pmc    location_sub
    .local string location
    location_sub = get_global ['_parrotlib'], "imcc_compile_file_location"
    location     = location_sub( 'nonexistent' )
    is(location, '', 'dynext location non-existent')
.end

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

F<runtime/parrot/library/parrotlib.pir>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
