# $Id$
# Copyright (C) 2008, The Perl Foundation.

=begin comments

HQ9plus::Grammar::Actions - ast transformations for HQ9plus

This file contains the methods that are used by the parse grammar
to build the PAST representation of an HQ9plus program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class HQ9plus::Grammar::Actions;

method TOP($/) {
    my $past :=
        PAST::Block.new(
            :blocktype('declaration'),
            :node( $/ ),
            PAST::Op.new(
                :name('infix:='),
                :pasttype('copy'),
                PAST::Var.new(
                    :name('hq9plus_code'),
                    :viviself('String'),
                    :isdecl(1),
                    :scope('lexical')
                ),
                PAST::Val.new(
                     :value(~$/)
                )
            ),
            PAST::Op.new(
                :name('infix:='),
                :pasttype('copy'),
                PAST::Var.new(
                    :name('hq9plus_accumulator'),
                    :viviself('Integer'),
                    :isdecl(1),
                    :scope('lexical')
                ),
                PAST::Val.new(
                     :value(0)
                )
            )
        );
    for $<statement> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method statement($/,$key) {
    my $past;
    if ( $key eq 'quine' ) {
        $past := PAST::Op.new( :name($key),
                               :pasttype('call'),
                               :node( $/ ),
                               PAST::Var.new(
                                   :name('hq9plus_code'),
                                   :scope('lexical')
                               ) );
    }
    elsif ( $key eq 'plus' ) {
        $past := PAST::Op.new( :name('postfix:++'),
                               :lvalue(1),
                               PAST::Var.new(
                                   :name('hq9plus_accumulator'),
                                   :scope('lexical')
                               ) );
    }
    else {
        $past := PAST::Op.new( :name($key),
                               :pasttype('call'),
                               :node( $/ ) );
    }
    make $past;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

