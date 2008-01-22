#   Copyright (C) 2008, The Perl Foundation.
# $Id$
class JS::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :node($/), :blocktype('declaration') );
    for $<source_element> {
        $past.push( $( $_ ) );
    }
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
    my $past := PAST::Block.new( :node($/), :blocktype('immediate') );
    for $<statement> {
        $past.push( $($_) );
    }
    make $past;
}

method if_statement($/) {
    my $past := PAST::Op.new( :pasttype('if'), :node($/) );
    $past.push( $( $<expression> ) );
    $past.push( $( $<statement> ) );
    if $<else> {
        $past.push( $( $<else>[0] ) );
    }
    make $past;
}

method while_statement($/) {
    my $cond := $( $<expression> );
    my $block := $( $<statement> );
    make PAST::Op.new( $cond, $block, :pasttype('while'), :node($/) );
}

method try_statement($/) {
    my $past := PAST::Op.new( :pasttype('try'), :node($/) );
    my $tryblock := $( $<block> );
    $past.push($tryblock);

    if $<catch> {
        my $catchblock := $( $<catch> );
        $past.push($catchblock);
    }
    if $<finally> {
        my $finallyblock := $( $<finally> );
        # what to do with this?
    }
    make $past;
}

method catch($/) {
   my $past := $( $<block> );
   # todo: unshift a statement with .get_results to catch the identifier
   # onto this block.
   make $past;
}

method finally($/) {
    make $( $<block> );
}

method throw_statement($/) {
    my $expr := $( $<expression> );
    make PAST::Op.new( $expr, :inline('    throw %0'), :node($/) );
}

method empty_statement($/) {
    make PAST::Op.new( :node($/), :inline('    # no-op') );
}

method primary_expression($/, $key) {
    make $( $/{$key} );
}

method member_expression($/) {
    make $( $<primary_expression> );
}

method call_expression($/) {
    my $invocant := $( $<member_expression> );
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.push($invocant);

    my @args := $<arguments><assignment_expression>;
    for @args {
        $past.push( $($_) );
    }
    make $past;
}



method assignment_expression($/) {
    make $( $<primary_expression> );
}


method expression($/) {
   #make $( $<oexpr> );
   make $( $<primary_expression> );
}

method identifier($/) {
    make PAST::Var.new( :name(~$/), :scope('package'), :node($/) );
}

method literal($/, $key) {
    make $( $/{$key} );
}

method object_literal($/) {
    my $past := PAST::Op.new( :pasttype('call'), :node($/) );
    $past.name('ctor');
    make $past;
}


method property_name($/, $key) {
    make $( $/{$key} );
}

method str_literal($/) {
    make PAST::Val.new( :value( ~$<string_literal> ), :node($/) );
}

method floating_point_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Float'), :node( $/ ) );
}

method numeric_literal($/,$key) {
    make $( $/{$key} );
}

method integer_number($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method hex_integer_literal($/) {
    make PAST::Val.new( :value( ~$/ ), :returns('Integer'), :node( $/ ) );
}

method decimal_literal($/, $key) {
    make $( $/{$key} );
}

method oexpr($/, $key) {
    if ($key eq 'end') {
        make $($<expr>);
    }
    else {
        my $past := PAST::Op.new( :name($<type>),
                                  :pasttype($<top><pasttype>),
                                  :pirop($<top><pirop>),
                                  :lvalue($<top><lvalue>),
                                  :node($/)
                                );
        for @($/) {
            $past.push( $($_) );
        }
        make $past;
    }

}