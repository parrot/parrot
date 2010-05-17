#!/usr/bin/env parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'main' :main
    .local string version_file_name
    version_file_name = 'VERSION'
    # read the version
    $P0 = open version_file_name, 'r'
    $S0 = readline $P0
    close $P0

    print 'version: '
    print $S0

    # split the version
    $P0 = split '.', $S0

    # increment version
    $I0 = $P0[1]
    inc $I0
    if $I0 != 12 goto NOT_NILL
    $I0 = $P0[0]
    inc $I0
    $P0[0] = $I0
    $I0 = 0
NOT_NILL:
    $P0[1] = $I0

    # join the version
    $S0 = join '.', $P0

    print 'new version: '
    print $S0

    $P0 = open version_file_name, 'w'
    print $P0, $S0
    close $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
