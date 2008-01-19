#   Copyright (C) 2008, The Perl Foundation.
# $Id$
class JS::Grammar::Actions;

method TOP($/) {
    my $past := $( $<statement> );
    $past.blocktype('declaration');
    make $past;
}

method statement($/) {
    make PAST::Block.new( PAST::Stmts.new(), :node($/) );
}

