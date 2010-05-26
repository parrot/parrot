#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/methods.t - Test OO methods

=head1 SYNOPSIS

    % prove t/oo/methods.t

=head1 DESCRIPTION

Tests features related to the creation, addition, and execution of OO methods.

=cut

.sub main :main
    .include 'test_more.pir'

    create_library()

    plan(6)

    loading_methods_from_file()
    loading_methods_from_eval()
    overridden_find_method()

    overridden_core_pmc()

    delete_library()

.end

.sub create_library
    .local pmc file
    .local string filename

    filename = "method_library.pir"
    file = new ['FileHandle']
    file.'open'(filename, 'w')

    $S0 = <<'END'
    .namespace['Foo']
    .sub 'bar_method' :method
        .return (1)
    .end
END

    print file, $S0
    file.'close'()

.end

.sub delete_library
    .local pmc os
    $P0 = loadlib 'os'
    os = new 'OS'
    $S0 = "method_library.pir"
    os.'rm'($S0)
.end

.sub loading_methods_from_file
    $P0 = newclass 'Foo'
    $P1 = new 'Foo'
    $I0 = $P1.'foo_method'()
    ok ($I0, 'calling foo_method')

    load_bytecode 'method_library.pir'
    $P1 = new 'Foo'
    $I0 = $P1.'bar_method'()
    ok ($I0, 'calling bar_method')
    $P0 = null
.end

.namespace ['Foo']
.sub 'foo_method' :method
    .return (1)
.end
.namespace []

.sub loading_methods_from_eval
    $P0 = newclass 'Bar'
    $P1 = new 'Bar'

    $I0 = $P1.'foo_method'()
    ok ($I0, 'calling foo_method')

    $S2 = <<'END'
        .namespace ['Bar']
        .sub 'bar_method' :method
            .return (1)
        .end
END
    $P2 = compreg 'PIR'
    $P2($S2)

    $P1 = new 'Bar'
    $I0 = $P1.'bar_method'()
    ok ($I0, 'calling bar_method')
.end

.namespace ['Bar']
.sub 'foo_method' :method
    .return (1)
.end
.namespace []

.sub overridden_find_method
    $P0 = newclass 'Obj'
    $P2 = new 'Obj'
    $I0 = $P2.'some_method'(42)
    is ($I0, 42, 'calling overriden method')
.end

.namespace ['Obj']

.sub 'meth' :method
    .param pmc a
    .return (a)
.end

.sub 'find_method' :vtable :method
    .param string meth_name

    .const 'Sub' meth = 'meth'
    .return (meth)
.end

.namespace []

.sub 'overridden_core_pmc'
    .local string msg
    msg = "able to invoke overridden method on core PMC (TT #1596)"
    $P0 = new 'ResizablePMCArray'
    $I0 = $P0.'foo'()
    is($I0, 1, msg)
    .return()
.end

.namespace ['ResizablePMCArray']
.sub 'foo' :method
    .return(1)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
