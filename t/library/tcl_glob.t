#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.

=head1 NAME

t/library/tcl_glob.t

=head1 DESCRIPTION

test tcl-style globs

=head1 SYNOPSIS

    % prove t/library/tcl_glob.t

=cut

.include 'load_bytecode.pir'

.sub 'main' :main
    '__load_bytecode'('Test/More.pbc')

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_namespace ['Test';'More']
    exports        = split ' ', 'plan diag ok nok is isa_ok'

    test_namespace.'export_to'(curr_namespace, exports)

    # set our plan
    plan(24)

    # make sure we can load the library
    push_eh load_failed
      '__load_bytecode'('Tcl/Glob.pbc')
    pop_eh
    ok(1, 'load_bytecode')

    is_glob(  'asdf', 'asdf', 'exact match +')
    isnt_glob('asdf', 'asd',  'exact match -')

    is_glob('asdf', '*',     '* entire')
    is_glob('asdf', 'a*',    '* trailing +')
    is_glob('asdf', '*f',    '* leading +')
    is_glob('asdf', 'a*f',   '* mid +')
    is_glob('asdf', '*asdf', 'null match')

    isnt_glob('asdf', 'f*',  '* trailing -')
    isnt_glob('asdf', '*a',  '* leading -')
    isnt_glob('asdf', 'a*a', '* mid +-')
    isnt_glob('asdf', 'f*f', '* mid -+')
    isnt_glob('asdf', 'f*a', '* mid --')

    is_glob('asdf', '????', '? all')
    is_glob('asdf', 'as?f', '? single')

    isnt_glob('asdf', 'asdf?', '? -')

    is_glob('asdf', 'asd[asdf]', '[]')
    is_glob('as_f', 'as[A-z]f',  '[] ascii order +')

    isnt_glob('as_f', 'as[a-z]f', '[] ascii order -')

    is_glob('?', '\?', '\?')
    is_glob('*', '\*', '\*')
    is_glob('[', '\[', '\[')
    is_glob(']', '\]', '\]')
    is_glob('\\', '\\\\', '\\\\')
load_failed:
.end

.sub 'is_glob'
    .param string original
    .param string glob
    .param string test_description

    .local int boolean
    boolean = do_glob(original,glob)
    is(1, boolean, test_description)
.end

.sub 'isnt_glob'
    .param string original
    .param string glob
    .param string test_description

    .local int boolean
    boolean = do_glob(original,glob)
    is(0, boolean, test_description)
.end

.sub 'do_glob'
    .param string original
    .param string glob

    .local pmc globber
    globber = compreg 'Tcl::Glob'

    .local pmc rule
    rule = globber.'compile'(glob)

    .local pmc result
    result = rule(original)

    .local int boolean
    boolean = istrue result

   .return(boolean)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
