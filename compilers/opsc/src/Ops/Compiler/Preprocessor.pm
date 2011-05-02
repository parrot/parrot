#! nqp
# Copyright (C) 2011, Parrot Foundation.

class Ops::Compiler::Preprocessor;

=begin Description

This is awful, terrible, hackish (etc, etc, etc) C PreProcessor. In ideal
world we should generate macro-substitution code from original C headers.
But I'm kind of lazy and want something functional for now.

=end Description

# Each macro is subroutine to generate expanded PAST.
# For handling parameters we use PAST::Var(:scope('macro_arg'), :name(<int>)).
our %MACROS;


=item is_macro
Check if function is actually macro.

method is_macro($name) {
    %MACROS.exists($name);
}

=item expand
Expand given macro name with arguments.

method expand($name, @args) {
    demacrofy(%MACROS{ $name }, @args);
}

=item expand
Expand single macro recursively.

sub demacrofy($op, @args) {
    my $res;
    if $op ~~ PAST::Var && $op.scope eq 'macro_arg' {
        say("Cloning arg { $op.name }");
        _dumper(@args[ $op.name ]);
        $res := Ops::Util::deep_clone(@args[ $op.name ]);
    }
    elsif pir::isa($op, 'Capture') {
        $res := $op.WHAT.new;
        pir::push($res, demacrofy($_, @args)) for @($op);
        $res{$_} := demacrofy($op{$_}, @args) for $op.hash.keys;
    }
    elsif pir::does($op, 'array') {
        $res := $op.map(->$_ { demacrofy($_, @args) });
    }
    else {
        $res := pir::clone($op);
    }
    $res;
}

INIT {

    # PMC_IS_NULL(pmc) NYI
    %MACROS<PMC_IS_NULL> := PAST::Val.new(
        :value(0),
        :returns<int>
    );

    # CURRENT_CONTEXT(interp) -> inter->ctx
    %MACROS<CURRENT_CONTEXT> := PAST::Var.new(
        :scope<keyed_arrow>,
        PAST::Var.new(:name<0>, :scope<macro_arg>),
        "ctx",
    );

    # VTABLE_get_number(interp, pmc) -> pmc->vtable->get_number(interp, pmc)
    %MACROS<VTABLE_get_number> := PAST::Op.new(
        :pasttype<call>,
        PAST::Var.new(
            :scope<keyed_arrow>,
            PAST::Var.new(
                :scope<keyed_arrow>,
                PAST::Var.new(:name<1>, :scope<macro_arg>),
                "vtable",
            ),
            "get_number",
        ),
        PAST::Var.new(:name<0>, :scope<macro_arg>),
        PAST::Var.new(:name<1>, :scope<macro_arg>),
    );

    %MACROS<VTABLE_invoke> := PAST::Op.new(
        :pasttype<call>,
        PAST::Var.new(
            :scope<keyed_arrow>,
            PAST::Var.new(
                :scope<keyed_arrow>,
                PAST::Var.new(:name<1>, :scope<macro_arg>),
                "vtable",
            ),
            "invoke",
        ),
        PAST::Var.new(:name<0>, :scope<macro_arg>),
        PAST::Var.new(:name<1>, :scope<macro_arg>),
        PAST::Var.new(:name<2>, :scope<macro_arg>),
    );
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab ft=perl6 shiftwidth=4:
