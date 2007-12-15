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
    my $sub := PAST::Block.new( :blocktype('declaration'), :node($/) );
    my $subname := $($<sub_id>);
    $sub.name($subname);

    if $<param_decl> {
        my @params := $<param_decl>;
        for @params {
            $sub.push( $($_) );
        }
    }

    if $<labeled_pir_instr> {
        my @instructions := $<labeled_pir_instr>;
        my $statements := PAST::Stmts.new( :node($/) );
        for @instructions {
            $statements.push( $($_) );
        }
        $sub.push($statements);
    }
    make $sub;
}

method labeled_pir_instr($/) {
    my $instr;
    if $<instr> {
        $instr := $($<instr>);
    }

    if $<label> {

    }
    make $instr;
}

method instr($/, $key) {
    make $( $/{$key} );
}

method pir_instr($/, $key) {
    make $( $/{$key} );
}

method local_decl($/) {
    my $declarations := PAST::Stmts.new( :node($/) );
    my $type := $( $<pir_type> );
    my @ids := $<local_id>;

    for @ids {
        $($_);
    }
    make $declarations;
}

method sub_id($/, $key) {
    make $( $/{$key} );
}

method param_decl($/) {
    my $param := $( $<parameter> );
    make $param;
}

method parameter($/) {
    my $parameter := $($<IDENT>);
    my $type := $($<pir_type>);
    $parameter.type($type);
    $parameter.scope('parameter');
    make $parameter;
}

method pir_type($/) {
    make PAST::Val.new( :type('string'), :value(~$/), :node($/) );
}

method expression($/, $key) {
    make $( $/{$key} );
}

method simple_expr($/, $key) {
    make $( $/{key} );
}

method unary_expr($/) {

}

method binary_expr($/) {

}

method constant($/) {

}

method target($/) {

}

method key($/) {
    make $( $<simple_expr> );
}

method IDENT($/) {
    print("IDENT");
    print(~$/);
    make PAST::Var.new( :name($<name>), :node($/) );
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

