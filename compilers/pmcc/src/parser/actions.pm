# Copyright (C) 2009, Parrot Foundation.
# $Id$

PIR q<
.include 'cclass.pasm'
>;

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

        # Save c_header.
        $?PMC<c_header> := substr($/.orig, 0, $/.from);

    }
    else {
        # TODO Set c_header and c_coda
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
        $?PMC.thaw_pmc_attrs(~$<identifier>);
    }
    elsif $key eq 'provides' {
        $?PMC.provides().push(~$<identifier>);
    }
    elsif $key eq 'group' {
    }
    elsif $key eq 'lib' {
    }
    else {
        $?PMC.traits{$key} := 1;
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
    elsif $key eq 'multi' {
        $?PMC.add_multi($m.name, $m);
    }
    else {
        $/.panic("Unsupported body part " ~ $m);
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
    my $past := PAST::Block.new(
        :name(~$<c_signature><identifier>),
        :blocktype('method'),
        :returns(~$<c_signature><c_type>),
        :node($/),

        $<c_body>.ast
    );
    $past<parameters> := $<c_signature><c_arguments>.ast;

    # Handle parameters to create short and long signaures
    
    # Largely stolen from Pmc2c::MULTIs::rewrite_multi_sub
    my $short_sig := "JP";  # prepend the short signature interpreter and invocant
    my @long_sig;
    for @( $past<parameters> ) {
        # Clean any '*' out of the name or type.
        my $type := cleanup_type($_<returns>);
        my $name := $_<name>;

        @long_sig.push(~$type);

        my $sig_char;
        # Pass standard parameter types unmodified.
        # All other param types are rewritten as PMCs.
        if ($type eq 'STRING' or $type eq 'PMC' or $type eq 'INTVAL') {
            $sig_char := substr($type, 0, 1); # short signature takes first character of name
        }
        elsif ($type eq 'FLOATVAL') {
            $sig_char := 'N';
        }
        else {
            $sig_char := 'P';
            # Replace "returns". Keep old
            $_<old_returns> := $_<returns>;
            $_<returns>     := "PMC *";
        }

        $short_sig := $short_sig ~ $sig_char;
    }

    $past<short_signature> := $short_sig;
    $past<long_signature>  := join(',', @long_sig);
    $past<full_name>       := "multi_" ~ $past.name ~ "_" ~ join('_', @long_sig);

    make $past;
}

sub cleanup_type($type) {
    PIR q<
        .local pmc type
        type = find_lex '$type'
        
        $S0 = type
        $I1 = length $S0
        $I0 = find_not_cclass .CCLASS_ALPHABETIC, $S0, 0, $I1

        $S0 = substr $S0, 0, $I0
        $P0 = new 'String'
        $P0 = $S0
        %r = $P0
    >
}

method c_body($/) {
    #say("c_body: " ~ $/);
    my $past := PAST::Stmts.new(
        :node($/),
    );
    for $<c_body_statement> {
        $past.push($_.ast);
    }
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
        :name(~$<identifier>),
        :returns(~$<c_type>)
    );
    make $past;
}

method c_body_statement($/, $key) {
    my $past;
    #say("body " ~ $key);
    if ($key eq 'characters') {
        $past := PAST::Op.new(
            :node($/),
            :pasttype('inline'),
            :inline(~$/)
        );
    }
    elsif ($key eq 'macro') {
        $past := $<c_body_macro>.ast;
    }
    elsif ($key eq 'body') {
        $past := $<c_body>.ast;
    }
    else {
        $/.panic("Unknown key " ~ $key);
    }

    make $past;
}

method c_body_macro($/, $key) {
    my $past;
    $past := PAST::Op.new(
        :name(~$<identifier>),
        :pasttype('call'),
        :node($/)
    );

    $past<is_macro> := 1;
    $past<is_self>  := $key eq 'SELF';
    $past<is_super> := $key eq 'SUPER';

    my $params := ~$<c_parameters><c_parameter>;
    #say("PARAMS " ~ $params);
    if $params {
        $past.push(
            PAST::Val.new(
                :value($params)
            )
        );
    }

    make $past;
}

method c_parameter($/) {
    #say("c_parameters " ~ $/);
    make PAST::Val.new(
        :node($/),
        :value(~$/)
    );
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
