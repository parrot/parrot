# Copyright (C) 2005-2009, Parrot Foundation.
# $Id$
# create/export some useful but rarely used methods

# TODO podify & beautify & doc

.namespace [ 'Sub' ]

# implementation Sub.get_lexenv :method
.sub get_lexenv :method :nsentry
    .local pmc env, pad, interp
    env = new 'ResizablePMCArray'
    .local int level
    null level
    interp = getinterp
    # push this pad and outies
loop:
    pad = interp["outer"; "lexpad"; level]
    push env, pad
    self = self."get_outer"()
    if null self goto done
    inc level
    goto loop
done:
    .return (env)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
