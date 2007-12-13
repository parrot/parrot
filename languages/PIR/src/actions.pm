# Copyright (C) 2007, The Perl Foundation.
# $Id$

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

