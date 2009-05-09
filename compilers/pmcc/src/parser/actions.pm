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
        $?PMC.serialize_attrs();
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
        $?PMC.unserialize_attrs(~$<identifier>);
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

method attribute_type($/, $key) {
    our $?PMC;
    my $name;
    my $type;
    my $is_fp;
    my $accessor_type;

    if $key eq 'simple_attr' {
        $type  := ~$/<simple_attr><simple_attr_type>;
        $name  := ~$/<simple_attr><identifier>;
        $is_fp := 0;
    }
    elsif $key eq 'pointer_attr' {
        $type  := ~$/<pointer_attr><pointer_attr_type>;
        $name  := ~$/<pointer_attr><identifier>;
        $is_fp := 0;
    }
    elsif $key eq 'func_pointer_attr' {
        $type  := ~$/<func_pointer_attr>;
        $name  := ~$/<func_pointer_attr><identifier>;
        $is_fp := 1;
    }
    $?PMC.add_attr($name, $type, $is_fp);
}


method body_part($/, $key) {
    our $?PMC;

    #say("body_part: " ~$key);
    my $m := $/{$key}.ast;
    if $key eq 'class_init' {
        $?PMC.add_class_init($m);
    }
    elsif $key eq 'vtable' {
        $?PMC.add_vtable($m.name, $m);
    }
    elsif $key eq 'method' {
        $?PMC.add_method($m.name, $m);
    }
}

method class_init($/) {
    #say('class_init ' ~$<identifier>);
    my $past := PAST::Block.new(
        :blocktype('method'),
        :returns('void'),
        :node($/),
        $<c_body>.ast
    );
    make $past;
}

method vtable($/) {
    #say('VABLE ' ~$<c_signature><identifier>);
    my $past := PAST::Block.new(
        :name(~$<c_signature><identifier>),
        :blocktype('method'),
        :returns(~$<c_signature><c_type>),
        :node($/),

        $<c_body>.ast
    );
    $past<parameters> := $<c_signature><c_arguments>.ast;
    make $past;
}

method method($/) {
    #say('METHOD ' ~$<identifier>);
    my $past := PAST::Block.new(
        :name(~$<identifier>),
        :blocktype('declaration'),
        :returns('void'),           # PCC METHODS returns void
        :node($/),

        $<c_body>.ast
    );
    #$past<parameters> := $<c_signature><c_arguments>.ast;
    make $past;
}

method multi($/) {
    #say('MULTI ' ~$<identifier>);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method c_body($/) {
    #say("c_body: " ~ $/);
    my $past := PAST::Op.new(
        :node($/),
        :inline(~$/)
    );
    make $past;
}

method c_arguments($/) {
    #say("c_arguments");
    my $past := PAST::Op.new();
    for $<c_argument> {
        $past.push($_.ast);
    }
    make $past;
}

method c_argument($/) {
    #say("c_argument");
    my $past := PAST::Var.new(
        :name(~$<identifier>[0]),
        :returns(~$<c_type>)
    );
    make $past;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
