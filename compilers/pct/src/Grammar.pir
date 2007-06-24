# Copyright (C) 2007, The Perl Foundation.
# $Id$

.sub '__onload' :init :load
    load_bytecode 'PGE/Util.pbc'
    $P0 = subclass 'PGE::Grammar', 'PCT::Grammar'
    $P0 = get_hll_global ['PGE::Util'], 'die'
    set_hll_global ['PCT::Grammar'], 'panic', $P0
    .return ()
.end    
