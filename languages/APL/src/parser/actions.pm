# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

APL::Grammar::Actions - ast transformations for APL

This file contains the methods that are used by the parse grammar
to build the PAST representation of an APL program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class APL::Grammar::Actions;

method TOP($/) {
    my $catchpir := "    get_results '0', $P0\n    $S0 = $P0\n    print $S0\n    exit 1\n";
    my $past := PAST::Op.new( $( $<statement_list> ),
                              PAST::Op.new( :inline( $catchpir) ),
                              :pasttype('try'),
                              :node($/) );
    make $past;
}

method statement_list($/) {
    my $past := PAST::Stmts.new( :node($/) );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method statement($/) {
    my $past := $( $<expression> );
    if $past.WHAT() ne 'Op' || $past.pasttype() ne 'copy' {
        $past := PAST::Op.new( $past, :name('aplprint'), :node( $/ ) );
    }
    make $past;
}


method expression($/, $key) {
    our %inlinetable;
    if ($key eq 'assign') {
        my $past := PAST::Op.new( $($<target>),
                                  $($<expression>),
                                  :pasttype('copy'),
                                  :node($/) );
        make $past;
    }
    elsif ($key eq 'monadic') {
        my $name := 'monadic:' ~ $<monadic_identifier>;
        my $past := PAST::Op.new( $($<expression>), :node($/) );
        if %inlinetable{$name} {
            $past.inline( %inlinetable{$name} );
        }
        else {
            $past.name($name);
        }
        make $past;
    }
    else {
        my $past := $( $<subexpression> );
        if $<dyadic_identifier>[0] {
            my $name := 'dyadic:' ~ $<dyadic_identifier>[0];
            $past := PAST::Op.new( $past,
                                   $($<expression>[0]),
                                   :node($/) );
            if %inlinetable{$name} {
                $past.inline(%inlinetable{$name});
            }
            else {
                $past.name($name);
            }
        }
        make $past;
    }
}


method subexpression($/) {
    make $( $<simple_expression> );
}


method simple_expression($/, $key) {
    make $( $/{$key} );
}

method target($/) {
    my $past := $( $<variable_identifier> );
    $past.lvalue(1);
    make $past;
}

method array_identifier($/, $key) {
    make $( $/{$key} );
}

method constant($/, $key) {
    make $( $/{$key} );
}

method numeric_constant($/) {
    if +$<decimal_representation> != 1 {
        my $past := PAST::Op.new( :name('aplvector'), :node($/) );
        for $<decimal_representation> {
            $past.push( $( $_ ) );
        }
        make $past;
    }
    else {
        make $( $<decimal_representation>[0] );
    }
}

method decimal_representation($/) {
    my $value := ~$/;
    $value.replace("\x207b", '-');
    PIR q<    $P0 = find_lex '$value'  >;
    PIR q<    $S0 = $P0                >;
    PIR q<    $I0 = index $S0, '.'     >;
    PIR q<    unless $I0 < 0 goto ffff >;
    PIR q<    $I0 = index $S0, 'E'     >;
    PIR q<    unless $I0 < 0 goto ffff >;
    PIR q<    concat $P0, '.'          >;
    PIR q<  ffff:                      >;
    make PAST::Val.new( :value($value), :returns('Float'), :node($/) );
}

method variable_identifier($/) {
    make PAST::Var.new( :name( ~$/ ),
                        :viviself('Undef'),
                        :scope('package'),
                        :node( $/ ) );
}

method character_constant_double($/) {
    my $value := ~$/[0];
    $value.replace('""', '"');
    make PAST::Op.new( PAST::Val.new( :value($value) ),
                       :name('aplstring'),
                       :node( $/ ) );
}

method character_constant_single($/) {
    my $value := ~$/[0];
    $value.replace("''", "'");
    make PAST::Op.new( PAST::Val.new( :value($value) ),
                       :name('aplstring'),
                       :node( $/ ) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

