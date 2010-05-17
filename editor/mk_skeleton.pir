# Copyright (C) 2010, Parrot Foundation.
# $Id$

# Generate a skeleton PIR file that adheres to parrot developer standards.
# intended for people who hack on parrot itself, not users of parrot.

.include 'tm.pasm'

.sub 'main' :main
    .local pmc timeArray
    .local int epoch, year
    epoch = time
    timeArray = decodetime epoch
    year = timeArray[.TM_YEAR]

    # split up to avoid various svn/codingstd issues.
    print '# Copyright (C) '
    print year
    say   ' Parrot Foundation.'
    print '# $'
    say   'Id: $'
    say ''
    say ".sub 'main' :main"
    say '    # For Parrot developers.'
    say '.end'
    say ''
    say '# Local Variables:'
    say '#   mode: pir'
    say '#   fill-column: 100'
    say '# End:'
    say '# vim: expandtab shiftwidth=4 ft=pir:'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
