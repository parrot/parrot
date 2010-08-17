#!/usr/bin/env parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

.sub 'main' :main
    .local string version_file_name
    version_file_name = 'VERSION'

    # read the version
    $P0 = new 'FileHandle'
    $P0.'open'( version_file_name, 'r' )
    $S0 = $P0.'readline'()
    $P0.'close'()

    print 'version: '
    print $S0

    # split the version
    $P1 = split '.', $S0

    # increment version
    $I0 = $P1[1]
    inc $I0
    if $I0 != 12 goto NOT_NILL
    $I0 = $P1[0]
    inc $I0
    $P1[0] = $I0
    $I0 = 0
NOT_NILL:
    $P1[1] = $I0

    # join the incremented version
    $S0 = join '.', $P1

    print 'new version: '
    print $S0

    # write the new version to the version_file
    $P0.'open'( version_file_name, 'w' )
    $P0.'print'( $S0 )
    $P0.'close'()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
