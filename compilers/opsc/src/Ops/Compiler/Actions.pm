#! nqp
# Copyright (C) 2009-2010, Parrot Foundation.

class Ops::Compiler::Actions is HLL::Actions;

our $OPLIB;

INIT {
    pir::load_bytecode("nqp-setting.pbc");
    $OPLIB := 0;
}

method TOP($/) {
    make $<body>.ast;
}

method body($/) {
    my $past := PAST::Stmts.new(
        :node($/)
    );

    $past<preamble> := PAST::Stmts.new(
        :node($/)
    );
    $past<ops> := PAST::Stmts.new(
        :node($/)
    );

    for $<preamble> {
        $past<preamble>.push($_<preamble_guts>);
    }

    for $<op> {
        my $ops := $_.ast;
        my $op_skip_table;
        if $OPLIB {
            $op_skip_table := $OPLIB.op_skip_table;
        }
        for @($ops) -> $op {
            if $OPLIB && !$op_skip_table.exists($op.full_name) || !$OPLIB {
                $past<ops>.push($op);
            }
        }
    }

    make $past;
}

method preamble($/) {
    make PAST::Op.new(
        :node($/),
        :pasttype('preamble'),
        ~$<preamble_guts>
    );
}

method op($/) {

    # Handling flags.
    my %flags := hash();
    for $<op_flag> {
        %flags{~$_<identifier>} := 1;
    }

    my @args := @($<signature>.ast);

    my @norm_args := normalize_args(@args);
    # We have to clone @norm_args. Otherwise it will be destroyed...
    my @variants  := expand_args(pir::clone__PP(@norm_args));

    my $op := Ops::Op.new(
        :name(~$<op_name>),
    );

    # Flatten PAST::Stmts into Op.
    #for @($<op_body>.ast) {
    #    $op.push($_);
    #}
    $op.push($<op_body>.ast);

    for $<op_body>.ast<jump> {
        $op.add_jump($_);
    }
    if ~$<op_name> eq 'runinterp' {
        $op.add_jump('PARROT_JUMP_RELATIVE');
    }
    $op<flags> := %flags;
    $op<args>  := @args;
    $op<type>  := ~$<op_type>;
    $op<normalized_args> := @norm_args;

    if $op.need_write_barrier {
        $op.push(
            PAST::Stmts.new(
                PAST::Op.new(
                    :pasttype<call>,
                    :name<PARROT_GC_WRITE_BARRIER>,
                    PAST::Var.new(
                        :name<interp>
                    ),
                    PAST::Op.new(
                        :pasttype<call>,
                        :name<CURRENT_CONTEXT>,
                        PAST::Var.new(
                            :name<interp>
                        )
                    )
                )
            )
        );
    }

    if !%flags<flow> {
        my $goto_next := PAST::Op.new(
            :pasttype('macro'),
            :name('goto_offset'),
            PAST::Op.new(
                :pasttype<macro>,
                :name<OPSIZE>,
            )
        );

        $op[0].push($goto_next);
    }

    my $past := PAST::Stmts.new(
        :node($/)
    );

    if @variants {
        for @variants {
            my $new_op := pir::clone__PP($op);
            $new_op<arg_types> := $_;
            $past.push($new_op);
        }
    }
    else {
        $past.push($op);
    }

    make $past;
}

# Normalize args
# For each arg produce LoL of all available variants
# E.g. "in" will produce "i" and "ic" variants
#
# type one of <i p s n>
# direction one of <i o io>
# is_label one of <0 1>

sub normalize_args(@args) {
    my @result;
    for @args -> $arg {
        my $res := PAST::Var.new(
            :isdecl(1)
        );

        if $arg<type> eq 'LABEL' {
            $res<type>     := 'i';
            $res<is_label> := 1;
        }
        else {
            $res<is_label> := 0;
        }

        if $arg<type> eq 'INTKEY' {
            $res<type> := 'ki';
        }
        elsif $arg<type> ne 'LABEL' {
            $res<type> := lc(substr($arg<type>, 0, 1));
        }

        my $use := $arg<direction>;

        if $use eq 'in' {
            $res<variant>   := $res<type> ~ "c";
            $res<direction> := 'i';
        }
        elsif $use eq 'invar' {
            $res<direction> := 'i';
        }
        elsif $use eq 'inconst' {
            $res<type>      := $res<type> ~ "c";
            $res<direction> := 'i';
        }
        elsif $use eq 'inout' {
            $res<direction> := 'io';
        }
        else {
            $res<direction> := 'o';
        }

        @result.push($res);
    }
    @result;
}

=begin

=item C<expand_args(@args)>

Given an argument list, returns a list of all the possible argument
combinations.

=end
sub expand_args(@args) {

    return list() unless @args;

    my $arg := @args.shift;

    my @var := list($arg<type>);
    if $arg<variant> {
        @var.push($arg<variant>);
    }

    my @list := expand_args(@args);
    unless +@list {
        return @var;
    }

    my @results;
    for @list -> $l {
        for @var -> $v {
            # NQP can't handle it automagically. So wrap $l into list.
            my @l := pir::does__IPS($l, 'array') ?? $l !! list($l);
            @results.push(list($v, |@l));
        }
    }

    @results;
}


method signature($/) {
    my $past := PAST::Stmts.new(
        :node($/)
    );

    for $<op_param> {
        $past.push($_.ast);
    }

    make $past;
}

method op_param($/) {
    my $past := PAST::Var.new(
        :node($/),
        :isdecl(1)
    );

    # We have to store 2 "types". Just set 2 properties on Var for now
    $past<direction> := ~$<op_param_direction>;
    $past<type>      := ~$<op_param_type>;

    make $past;
}

method op_body($/) {
    my $past := $<blockoid>.ast;
    $past<jump> := list();

    make $past;
}

method op_macro:sym<expr offset>($/) {
    make PAST::Op.new(
        :pasttype<macro>,
        :name<expr_offset>,
        $<arg>.ast,
    );
}

method op_macro:sym<goto offset>($/) {
    make PAST::Op.new(
        :pasttype<macro>,
        :name<goto_offset>,
        $<arg>.ast,
    );
}

method op_macro:sym<expr address>($/) {
    make PAST::Op.new(
        :pasttype<macro>,
        :name<expr_address>,
        $<arg>.ast,
    );
}

method op_macro:sym<goto address>($/) {
    make PAST::Op.new(
        :pasttype<macro>,
        :name<goto_address>,
        $<arg>.ast,
    );
}

method op_macro:sym<expr next>($/) {
    my $past := PAST::Op.new(
        :pasttype<macro>,
        :name<expr_offset>,
        PAST::Op.new(
            :pasttype<macro>,
            :name<OPSIZE>,
        )
    );
    $past<jump> := <PARROT_JUMP_RELATIVE>;

    make $past;
}

method op_macro:sym<goto next>($/) {
    my $past := PAST::Op.new(
        :pasttype<macro>,
        :name<goto_offset>,
        PAST::Op.new(
            :pasttype<macro>,
            :name<OPSIZE>,
        )
    );
    $past<jump> := <PARROT_JUMP_RELATIVE>;

    make $past;
}


method op_macro:sym<restart next> ($/) {
    #say('# op_macro');
    # restart NEXT()      -> restart_offset(opsize()); goto_address(0)
    my $past := PAST::Stmts.new(
        PAST::Op.new(
            :pasttype<macro>,
            :name<restart_offset>,
            PAST::Op.new(
                :pasttype<macro>,
                :name<OPSIZE>,
            )
        ),
        PAST::Op.new(
            :pasttype<macro>,
            :name<goto_address>,
            PAST::Val.new(
                :value<0>
            )
        ),
    );

    $past<jump> := <PARROT_JUMP_RELATIVE>;

    make $past;
}

method blockoid ($/) {
    my $past := PAST::Block.new(:node($/));

    $past.push($_) for @($<mixed_content>.ast);

    make $past;
}

method mixed_content ($/) {
    my $past := PAST::Stmts.new(:node($/));

    @($_.ast).map(-> $_ { $past.push($_) }) for $<declarator>;
    $past.push($_) for @($<statement_list>.ast);

    make $past;
}

method declarator ($/) {
    my $past := PAST::Stmts.new(:node($/));
    for $<declarator_name> {
        my $decl := PAST::Var.new(
            :node($_),
            :isdecl(1),
            :name(~$_<variable>),
            :vivibase(~$<type_declarator>),
        );

        $decl.viviself($_<EXPR>[0].ast) if $_<EXPR>[0];

        $decl<array_size> := ~$_<array_size><VALUE> if $_<array_size>;
        $past.push($decl);
    }

    make $past;
}

method statement_list ($/) {
    my $past := PAST::Stmts.new(:node($/));

    $past.push($_.ast) for $<labeled_statement>;

    make $past;
}

method labeled_statement ($/) {
    # FIXME!!!
    my $past := $<statement>
                ?? $<statement>.ast
                !! PAST::Op.new();

    # FIXME!!! We need some semantics here.
    $past<label> := ~$<label> if $<label>;

    make $past;
}

method statement ($/) {
    my $past;

    if $<statement_control> {
        $past := $<statement_control>.ast;
    }
    elsif $<blockoid> {
        $past := $<blockoid>.ast;
    }
    elsif $<EXPR> {
        $past := $<EXPR>.ast;
    }
    elsif $<c_macro> {
        $past := $<c_macro>.ast;
    }
    else {
        $/.CURSOR.panic("Unknown content in statement");
    }

    make $past;
}

method c_macro:sym<define> ($/) {
    my $past := PAST::Op.new(
        :pasttype<macro_define>,
        $<name>,
    );

    $past<macro_args> := $<c_macro_args>[0].ast if $<c_macro_args>;
    $past<body>       := $<body>[0].ast         if $<body>;

    make $past;
}

method c_macro:sym<if> ($/) {
    my $past := PAST::Op.new(
        :pasttype<macro_if>,

        ~$<condition>,  # FIXME! We have to parse condition somehow.
        $<then>.ast,
    );

    $past.push($<else>[0].ast) if $<else>;

    make $past;
}

method c_macro:sym<ifdef> ($/) {
    my $past := PAST::Op.new(
        :pasttype<macro_if>,

        'defined(' ~ ~$<name> ~ ')',  # FIXME! We have to parse condition somehow.
        $<then>.ast,
    );

    $past.push($<else>[0].ast) if $<else>;

    make $past;
}

method term:sym<concatenate_strings> ($/) {
    make ~$<identifier> ~ ' ' ~ ~$<quote>;
}

method term:sym<identifier> ($/) {
    # XXX Type vs Variable
    make PAST::Var.new(
        :name(~$/),
    );
}

method term:sym<call> ($/) {
    my $past := PAST::Op.new(
        :pasttype('call'),
        :name(~$<identifier>),
    );

    my $type := $<arglist><type_declarator>;
    $past.push(~$type) if $type;

    my $args := $<arglist><EXPR>;
    $past.push($args.ast) if $args;

    make $past;
}

method term:sym<reg> ($/) {
    make PAST::Var.new(
        :name(+$<num>),
        :node($/),
        :scope('register'), # Special scope
    );
}

method term:sym<macro> ($/) {
    make $<op_macro>.ast;
}

method term:sym<int> ($/) {
    # TODO Handle type
    make PAST::Val.new(
        :value(~$/),
        :returns<int>
    );
}

method term:sym<str> ($/) {
    make PAST::Val.new(
        :value(~$<quote>),
        :returns<string>
    );
}

method term:sym<float_constant_long> ($/) { # longer to work-around lack of LTM
    make PAST::Val.new(
        :value(~$/),
        :returns<float>
    );
}

method infix:sym<?:> ($/) {
    my $past := PAST::Op.new(
        :pasttype<if>,
    );
    # Override to emit ternary ops in .to_c
    $past<ternary> := 1;
    make $past;
}

method statement_control:sym<if> ($/) {
    my $past := PAST::Op.new(
        :pasttype<if>,

        $<EXPR>.ast,
        $<then>.ast,
    );

    $past.push($<else>[0].ast) if $<else>;

    make $past;
}

method statement_control:sym<while> ($/) {
    my $past := PAST::Op.new(
        :pasttype<while>,

        $<condition>.ast,
        $<statement_list>.ast,
    );

    make $past;
}

method statement_control:sym<for> ($/) {
    my $past := PAST::Op.new(
        :pasttype<for>,

        $<init> ?? $<init>[0].ast !! undef,
        $<test> ?? $<test>[0].ast !! undef,
        $<step> ?? $<step>[0].ast !! undef,
        $<statement_list>.ast,
    );

    make $past;
}

# Not real "C" switch. Just close enough
method statement_control:sym<switch> ($/) {
    my $past := PAST::Op.new(
        :pasttype<switch>,
        $<test>.ast,
    );
    $past.push($_) for @($<statement_list>.ast);
    make $past;
}

method statement_control:sym<break> ($/) {
    my $past := PAST::Op.new();
    $past<control> := 'break';
    make PAST::Stmts.new($past);
}

method statement_control:sym<continue> ($/) {
    my $past := PAST::Op.new();
    $past<control> := 'continue';
    make PAST::Stmts.new($past);
}


method circumfix:sym<( )> ($/) {
    my $past := $<EXPR>.ast;

    # Indicate that we need wrapping.
    $past<wrap> := 1;

    make $past;
}

# For casting we just set "returns" of EXPR.
method prefix:sym<( )> ($/) {
    make PAST::Op.new(
        :returns(~$<type_declarator>),
    );
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab ft=perl6 shiftwidth=4:
