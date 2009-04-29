# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Grammar::Actions;

method TOP($/) {
    #say("TOP");
    make $( $<pmc> );
}

method pmc($/, $key) {
    our $?PMC;

    if $key eq 'begin' {
        $?PMC := PMC::Class.new(
            :name(~$<identifier>),
            :node($/)
        );
    }
    else {
        # Set c_header and c_coda
        make $?PMC;
    }
}

method c_header($/) {
    say("c_header");
    say(~$/);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method traits($/, $key) {
    our $?PMC;
    
    #say("traits " ~$/);
    if $key eq 'extends' {
        $?PMC.parents().push(~$<identifier>);
    }
    elsif $key eq 'provides' {
    }
    elsif $key eq 'group' {
    }
    elsif $key eq 'lib' {
    }
    else {
        $?PMC.trait(~$/, 1);
    }
}

method body_part($/, $key) {
    our $?PMC;

    #say("body_part: " ~$key);
    my $m := $/{$key}.ast;
    if $key eq 'vtable' {
        $?PMC.add_vtable($m.name, $m);
    }
    elsif $key eq 'method' {
        $?PMC.add_method($m.name, $m);
    }
}

method vtable($/) {
    #say('VABLE ' ~$<c_signature><identifier>);
    my $past := PAST::Block.new( 
        :name(~$<c_signature><identifier>),
        :blocktype('method'),
        :node($/),
        PAST::Op.new(
            :inline(~$<c_body>)
        )
    );
    $past<parameters> := join(', ', $<c_signature><c_arguments><c_argument>);
    make $past;
}

method method($/) {
    #say('METHOD ' ~$<identifier>);
    my $past := PAST::Block.new(
        :name(~$<identifier>),
        :blocktype('declaration'),
        :node($/),
        PAST::Op.new(
            :inline(~$<c_body>)
        )
    );
    make $past;
}

method multi($/) {
    #say('MULTI ' ~$<identifier>);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method c_body($/) {
    #say("c_body: " ~ $/);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
