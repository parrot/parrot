# Copyright (C) 2009, Parrot Foundation.
# $Id$

class VTable::Grammar::Actions;

method TOP($/) {
    make $<sections>.ast;
}

method sections($/, $key) {

    our $?FUNCTIONS;
    our $?SECTION_NAME := "MAIN";

    if $key eq 'begin' {
        $?FUNCTIONS := PAST::Block.new(:node($/));
    }
    elsif $key eq 'end' {
        make $?FUNCTIONS;
    }
}

method section($/) {
    our $?SECTION_NAME;
    our $?SECTION_ATTRIBUTES;

    $?SECTION_NAME := ~$/<identifier>;
    $?SECTION_ATTRIBUTES := $/<attribute>;
}


method vtable_func($/) {
    our $?FUNCTIONS;
    our $?SECTION_NAME;
    our $?SECTION_ATTRIBUTES;

    my $function := VTable::Function.new( :node( $/ ),
                                          :name( ~$/<identifier> ),
                                          :returns( $/<type> ),
                                        );
    for $/<attribute> {
        $function.add_attribute(~$_<identifier>);
    }

    for $?SECTION_ATTRIBUTES {
        $function.add_attribute(~$_<identifier>);
    }

    for $/<argument> {
        $function.add_argument($_);
    }

    $function.set_section($?SECTION_NAME);

    $?FUNCTIONS.push($function);

}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
