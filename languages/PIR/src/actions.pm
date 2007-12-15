# Copyright (C) 2007, The Perl Foundation.
# $Id$

class PIR::Grammar::Actions;

## rule TOP { <statements> }
##
method TOP($/) {
    make $( $<program> );
}

method program($/) {
    my $program := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my @compunits := $<compilation_unit>;
    for @compunits {
        $program.push( $($_) );
    }
    make $program;
}

method compilation_unit($/, $key) {
    make $( $/{$key} );
}

method sub_def($/) {
    my $sub := PAST::Block.new( :blocktype('declaration'),
                                :node($/) );

    my $subname := $($<sub_id>);
    $sub.name($subname);
    make $sub;
}

method sub_id($/, $key) {
    make $( $/{$key} );
}

method IDENT($/) {
    make PAST::Val.new( :value(~$/), :node($/) );
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

