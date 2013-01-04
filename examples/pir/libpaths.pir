#./parrot
# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

examples/pir/libpaths.pir - Print the parrot library search paths

=head1 SYNOPSIS

    $ unset PARROT_LIBRARY
    $ unset PARROT_INCLUDE
    $ ./parrot examples/pir/libpaths.pir
    $ ./installed_parrot examples/pir/libpaths.pir

=head1 DESCRIPTION

Print the list of parrot library search paths.

See also F<t/library/lib_search_path.t>

=cut

.include 'iglobals.pasm'
.include 'libpaths.pasm'
.const int SIZE = 4

.sub main :main
    .local pmc interp
    getinterp interp
    .local pmc lib_paths
    lib_paths = interp[.IGLOBALS_LIB_PATHS]
    .local pmc idx, desc
    idx = new 'FixedIntegerArray', SIZE
    desc = new 'FixedStringArray', SIZE
    idx[0] = .PARROT_LIB_PATH_INCLUDE
    desc[0] = "PARROT_LIB_PATH_INCLUDE"
    idx[1] = .PARROT_LIB_PATH_LIBRARY
    desc[1] = "PARROT_LIB_PATH_LIBRARY"
    idx[2] = .PARROT_LIB_PATH_DYNEXT
    desc[2] = "PARROT_LIB_PATH_DYNEXT"
    # LANG is experimental
    idx[3] = .PARROT_LIB_PATH_LANG
    desc[3] = "PARROT_LIB_PATH_LANG"

    $I0 = 0
  while_idx:
    .local pmc path
    $I1 = idx[$I0]
    $S1 = desc[$I0]
    path = lib_paths[$I1]
    .local pmc p
    .local int i, size
    size = path
    i = 0
    print "\n"
    print $S1
    say ":"
  while_entry:
    p = path[i]
    say p
    i = i + 1
    if i < size goto while_entry

    $I0 = $I0 + 1
    if $I0 < SIZE goto while_idx

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
