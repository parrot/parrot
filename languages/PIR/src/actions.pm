# Copyright (C) 2007, The Perl Foundation.
# $Id: Actions.pir 22104 2007-10-15 19:15:32Z kjs $

class PIR::Grammar::Actions;

## rule TOP { <statements> }
##
method TOP($/) {
    make $( $<program> );
}

method program($/) {
    make PAST::Block.new( :node($/), :blocktype('immediate') );
}


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

