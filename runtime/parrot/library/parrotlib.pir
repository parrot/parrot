# $Id$

=head1 INFORMATION

This is the parrot bytecode library.

=head1 FUNCTIONS

=over 4

=cut

.namespace ["_parrotlib"]

=item __onload

__onload is the initialization function. It sets the signatures of
parrotlib's interface functions.

=cut

.sub __onload :load
    .local pmc paths
    .local pmc includes
    .local string root


    # XXX todo: get root from config
    $P0 = new 'Env'
    root = $P0["PARROT_RUNTIME_ROOT"]
    length $I0, root
    if $I0 == 0 goto DEFAULT
    branch OKAY
DEFAULT:
    root = "runtime/parrot"
OKAY:

    # XXX: get include paths from config
    $S0 = concat root, "/include"
    paths = new 'ResizableStringArray'
    push paths, "."
    push paths, $S0
    push paths, root

    # create includes array
    includes = new 'ResizablePMCArray'
    set_hll_global ['_parrotlib'], 'include_paths', includes

    # get the directory handler
    $P0 = get_hll_global ['_parrotlib'], 'handle_directory'

    # fill the includes array
LOOP:
    $P1 = clone $P0
    $P2 = new 'String'
    $S0 = shift paths
    $S0 = concat $S0, "/"
    $P2 = $S0
    setprop $P1, "path", $P2
    push includes, $P1
    if paths goto LOOP

    # setup the signatures
    set_signature( "include_file_location", "SS" )
    set_signature( "imcc_compile_file_location", "SS" )
    set_signature( "dynext_location", "SSSP" )
.end

.sub set_signature
    .param string name
    .param string sig

    $P1 = new 'String'
    $P1 = sig
    $P0 = get_hll_global ['_parrotlib'], name
    setprop $P0, "signature", $P1
    set_hll_global ['_parrotlib'], name, $P0
.end

=item STRING = include_file_location( STRING )

Is called by IMCC when it encounters an C<.include> statement.
The string parameter the argument of this statement.

This function returns the absolute filename of the requested file.

=cut

.sub include_file_location
    .param string name

    $P0 = get_hll_global ['_parrotlib'], 'include_paths'
    $S0 = find_file_path( name, $P0 )

    .begin_return
    .set_return $S0
    .end_return
.end

=item STRING = bytecode_location( STRING )

Is called by Parrot_load_bytecode.
The string parameter is the name of the file to be loaded.

This function returns the absolute filename of the requested file.

=cut

.sub imcc_compile_file_location
    .param string name

    $P0 = get_hll_global ['_parrotlib'], 'include_paths'

    $S0 = find_file_path( name, $P0 )

    .begin_return
    .set_return $S0
    .end_return
.end

=item STRING = dynext_location( STRING )

Returns the location of a dynamic extension.

=cut

.sub dynext_location
    .param string request
    .param string ext

    .local pmc    os
    .local string name

    $P0 = loadlib 'os'
    os = new ['OS']

    name = request
    push_eh FILE_NOT_FOUND_1
    # OS.stat throws on file not found
    os.'stat'(name)
    goto END

FILE_NOT_FOUND_1:
    name = concat request, ext
    push_eh FILE_NOT_FOUND_2
    os.'stat'(name)
    goto END

FILE_NOT_FOUND_2:
    name = concat "runtime/parrot/dynext/", request
    push_eh FILE_NOT_FOUND_3
    os.'stat'(name)
    goto END

FILE_NOT_FOUND_3:
    name = concat "runtime/parrot/dynext/", request
    name = concat name, ext
    push_eh FILE_NOT_FOUND_4
    os.'stat'(name)
    goto END

FILE_NOT_FOUND_4:
    # file not found, give the OS a chance to locate it
    name = concat request, ext
    .return (name)

END:
    pop_eh
    .return (name)
.end


.sub find_file_path
    .param string name
    .param pmc array
    .local string ret
    .local pmc it

    it = iter array

NEXT:
    null ret
    unless it goto END

    $P0 = shift it
    ret = $P0( name )
    if_null ret, NEXT
END:
    .begin_return
    .set_return ret
    .end_return
.end

.sub handle_directory
    .param string name
    .local string path

.include "interpinfo.pasm"
    interpinfo $P1, .INTERPINFO_CURRENT_SUB
    getprop $P0, "path", $P1
    path = $P0

    $S0 = concat path, name
    $P0 = loadlib 'os'
    $P0 = new ['OS']
    push_eh FILE_NOT_FOUND
        # OS.stat throws on file not found
        $P0.'stat'($S0)
    pop_eh
    goto END

FILE_NOT_FOUND:
    null $S0

END:
    .begin_return
    .set_return $S0
    .end_return
.end

=back

=head1 AUTHOR

Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author
and maintainer.
Please send patches and suggestions to the Perl 6 Internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2004-2008, Parrot Foundation.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
