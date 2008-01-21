#   Copyright (C) 2008, The Perl Foundation.
# $Id$
class JS::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<source_element> {
        $past.push( $( $_ ) );
    }
    #my $past := $( $<source_element> );
    #$past.blocktype('declaration');
    make $past;
}

method source_element($/, $key) {
    make $( $/{$key} );
}

method function_declaration($/) {
    my $past := $( $<block> );
    $past.blocktype('declaration');
    $past.name( $( $<identifier> ).name() );
    make $past;
}

method statement($/, $key) {
   make $( $/{$key} );
}

method block($/) {
    my $past := PAST::Block.new( :node($/) );
    my $stmt := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $stmt.push( $( $_ ) );
    }
    $past.push($stmt);
    make $past;
}

method if_statement($/) {
    my $past := PAST::Op.new( :pasttype('if'), :node($/) );
    $past.push( $( $<expression> ) );
    $past.push( $( $<statement> ) );
    if $<else> {
        $past.push( $( $<else> ) );
    }
    make $past;
}

method expression($/, $key) {
   make $( $/{$key} );
}

method identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method string_literal($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method floating_point_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node( $/ ) );
}

method integer_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method numeric_literal($/) {
    make $( $<decimal_literal> );
}

method decimal_literal($/, $key) {
    make $( $/{$key} );
}

