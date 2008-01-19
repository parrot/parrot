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

method statement($/,$key) {
    make $( $/{$key} );
}


method block($/) {
    my $past := PAST::Block.new( :node($/) );
    if $<statement_list> {
        $past.push( $<statement_list>[0] );
    }
    else {
        $past.push( PAST::Stmts.new( :node($/) ) );
    }
    make $past;
}

method statement_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

