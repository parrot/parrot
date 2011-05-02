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

    # PMC_data(pmc) -> pmc->data
    %MACROS<PMC_data> := PAST::Var.new(
        :scope<keyed_arrow>,
        PAST::Var.new(:name<0>, :scope<macro_arg>),
        "data",
    );

    # GETATTR_FixedIntegerArray_size used in ops for performance reason
    # NB: There is simplified version of it.
    %MACROS<GETATTR_FixedIntegerArray_size> := PAST::Op.new(
    );

    # VTABLE_get_number(interp, pmc) -> pmc->vtable->get_number(interp, pmc)
    %MACROS<VTABLE_get_number> := _generate_vtable_macro("get_number", 2);
    %MACROS<VTABLE_invoke>     := _generate_vtable_macro("invoke", 3);

}

# Helper sub for generating VTABLE_foo macros.
sub _generate_vtable_macro($name, $arity) {
    my $past := PAST::Op.new(
        :pasttype<call>,
        PAST::Var.new(
            :scope<keyed_arrow>,
            PAST::Var.new(
                :scope<keyed_arrow>,
                PAST::Var.new(:name<1>, :scope<macro_arg>),
                "vtable",
            ),
            $name,
        ),
    );

    my $i := 0;
    while ($arity) {
        $past.push(PAST::Var.new(:name(+$i), :scope<macro_arg>));
        $arity--;
        $i++;
    }

    $past;
}

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab ft=perl6 shiftwidth=4:
