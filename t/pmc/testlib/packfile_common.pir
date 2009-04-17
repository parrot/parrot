#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

# Common functions for various Packfile* PMCs tests.
# Return test filename
# Currently parrot doesn't support system independent PBCs. So, cross your
# fingers and try different filename for binary-dependent tests...

.sub '_filename'
    .local string filename
    filename = 't/native_pbc/number_1.pbc'
    .return (filename)
.end

# common pbc loading function
.sub '_pbc'
    .include "stat.pasm"
    .include "interpinfo.pasm"
    .local pmc pf, pio
    pf   = new ['Packfile']
    #$S0  = interpinfo .INTERPINFO_RUNTIME_PREFIX
    #$S0 .= "/runtime/parrot/library/uuid.pbc"
    $S0 = '_filename'()
    pio  = open $S0, 'r'
    $S0  = pio.'readall'()
    close pio
    pf   = $S0
    .return(pf)
.end

.sub '_find_segment_by_type'
    .param pmc pf
    .param string type
    .local pmc pfdir, it

    pfdir = pf.'get_directory'()
    it = iter pfdir
  loop:
    unless it goto done
    $S0 = shift it
    $P0 = pfdir[$S0]
    $I0 = isa $P0, type
    unless $I0 goto loop
    .return ($P0)
  done:
    .return ()
.end

.sub '_get_fixup_table'
    .param pmc pf

    .tailcall '_find_segment_by_type'(pf, "PackfileFixupTable")
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
