# Copyright (C) 2008-2009, Parrot Foundation.

=head1 TITLE

NCI/Utils.pir - Utility functions to make Parrot NCI work easier

=head1 SYNOPSIS

  # Perl 6:
    # Load this library and the NCI wrapper for a framework/toolkit
    use NCI::Utils:from<parrot>;
    use FooTK:from<parrot>;

    sub MAIN(*@ARGS is rw) {
        # Call toolkit's init function, overwriting @ARGS with mangled copy
        @ARGS = call_toolkit_init(&fooInit, @ARGS, $*PROGRAM_NAME);

        # Alternately, you can save both the original @ARGS and mangled copy
        my @mangled_args = call_toolkit_init(&fooInit, @ARGS);

        # ...
    }

  # PIR:
    .sub main :main
        .param pmc argv

        # Load this library and the NCI wrapper for a framework/toolkit
        load_bytecode 'NCI/Utils.pbc'
        load_bytecode 'FooTK.pbc'

        # Find Subs for call_toolkit_init() and the toolkit's init function
        .local pmc call_toolkit_init, fooInit
        call_toolkit_init = get_global ['NCI';'Utils'], 'call_toolkit_init'
        fooInit           = get_global ['FooTK'],       'fooInit'

        # Call toolkit's init function, overwriting argv with mangled copy
        argv = call_toolkit_init(fooInit, argv)

        # Alternately, you can save both the original argv and mangled copy
        .local pmc mangled_argv
        mangled_argv = call_toolkit_init(fooInit, argv)

        # ...
    .end

=head1 DESCRIPTION

Some Parrot NCI coding tasks are relatively common, but usually result in
a relatively grotty bit of code that no one should have to write twice.
Hence this library, which provides utilities to handle these common tasks
more cleanly (or at least collect all the grotty code in one place).

Currently, there is just one such utility implemented:

=over 4

=item new_argv = call_toolkit_init(pmc init_func, pmc orig_argv, string program_name?)

Call an NCI void function with params C<(&argc, argv)> (and thus having
Parrot signature C<'v3p'>).  This is a very common signature for toolkit
(AKA framework) init functions that want to filter out command line
options that the toolkit itself should process.  Since it is expected
that the init call will remove some arguments, C<call_toolkit_init>
returns an updated C<argv>.  C<orig_argv> is never changed; the NCI call
is performed using a copy.  When calling from an HLL that removes the
program name from C<argv> automatically, provide the program_name argument
so that C<call_toolkit_init()> can adjust C<argv> alignment internally;
this will tend to make the toolkit init function much happier.

=back

=cut


.namespace ['NCI'; 'Utils']

.include 'datatypes.pasm'

# TODO: this crashes rakudo
# .sub _init_nci_utils :load
#     # Mark all functions for export
#     .local pmc parrot
#     load_language 'parrot'
#     parrot = compreg 'parrot'
#     parrot.'export'('call_toolkit_init')
#     parrot.'export'('call_with_cstring')
# .end

.sub call_toolkit_init
    .param pmc    init_func
    .param pmc    orig_argv
    .param string program_name     :optional
    .param int    has_program_name :opt_flag

    # If program name supplied separately, stuff it into front of argv
    unless has_program_name goto argv_includes_program_name
    unshift orig_argv, program_name
  argv_includes_program_name:

    # UnmanagedStruct assumes zero-delimited strings
    .local string cnul
    cnul = chr 0

    # Calculate argc
    .local int argc
    argc = elements orig_argv

    # Declare structure of a raw C string array with proper element count
    .local pmc argv_decl
    argv_decl = new 'ResizablePMCArray'
    push argv_decl, .DATATYPE_CSTR
    push argv_decl, argc
    push argv_decl, 0
    # XXX: This is unportably wrong; it assumes sizeof(INT) = sizeof(PTR)
    push argv_decl, .DATATYPE_INT
    push argv_decl, 0
    push argv_decl, 0

    # Create C string array from struct declaration and Parrot string array
    .local pmc argv
    .local int i
    argv = new 'ManagedStruct', argv_decl
    i = 0
  argv_loop:
    unless i < argc goto add_null
    # It seems like this should be possible in one op
    $S0 = orig_argv[i]
    concat $S0, $S0, cnul
    argv[0;i] = $S0
    inc i
    goto argv_loop
  add_null:
    # XXX: This is unportably wrong; it assumes sizeof(INT) = sizeof(PTR)
    argv[1] = 0

    # Call the NCI framework init function
    argc = init_func(argc, argv)

    # Build a new_argv array to match the init function's return
    .local pmc new_argv
    new_argv  = new 'ResizableStringArray'
    # If program_name was supplied separately from argv, skip it on output
    i = has_program_name
  new_argv_loop:
    unless i < argc goto done
    $S0 = argv[0;i]
    push new_argv, $S0
    inc i
    goto new_argv_loop

    # Finally, return the new (and adjusted) argv
  done:
    .return (new_argv)
.end

.sub call_with_cstring
    .param pmc func
    .param pmc cstrings :slurpy

    .local pmc cstr_args
    cstr_args = new ['ResizableIntegerArray']

    .local pmc i
    i = iter cstrings
    loop:
        unless i goto end_loop
        $I0 = shift i
        unless $I0 == -1 goto else
            func = wrap_cstr_ret(func)
            goto endif
        else:
            push cstr_args, $I0
        endif:
        goto loop
    end_loop:

    $I0 = elements cstr_args
    unless $I0 goto done_wrap_args
        func = wrap_cstr_args(func, cstr_args)
    done_wrap_args:

    .return (func)
.end

.sub 'wrap_cstr_ret' :anon
    .param pmc func
    .lex 'func', func
    .const 'Sub' $P0 = 'wrap_ret_closure'
    $P0 = newclosure $P0
    .return ($P0)
.end

.sub 'wrap_ret_closure' :anon :outer('wrap_cstr_ret')
    .param pmc args :slurpy
    $P0 = find_lex 'func'
    $P0 = $P0(args :flat)
    $P1 = null
    $P1 = dlfunc $P1, 'Parrot_str_new', 'Spi'
    $P2 = getinterp
    $S0 = $P1($P2, 0)
    .return ($S0)
.end

.sub 'wrap_cstr_args' :anon
    .param pmc func
    .param pmc cstr_args
    .lex 'func', func
    .lex 'cstr_args', cstr_args
    .const 'Sub' $P0 = 'wrap_args_closure'
    $P0 = newclosure $P0
    .return ($P0)
.end

.sub 'wrap_args_closure' :anon :outer('wrap_cstr_args')
    .param pmc args :slurpy

    .local pmc func
    .local pmc cstr_args
    func      = find_lex 'func'
    cstr_args = find_lex 'cstr_args'

    .local pmc interp, str_to_cstring, str_free_cstring
    interp           = getinterp
    $P0              = null
    str_to_cstring   = dlfunc $P0, 'Parrot_str_to_cstring',   'ppS'
    str_free_cstring = dlfunc $P0, 'Parrot_str_free_cstring', 'vp'

    .local pmc i
    i = iter cstr_args
    trans_loop:
        unless i goto end_trans_loop
        $I0     = shift i
        $S0     = args[$I0]
        $P0     = str_to_cstring(interp, $S0)
        args[$I0] = $P0
        goto trans_loop
    end_trans_loop:

    .local pmc retv
    (retv :slurpy) = func(args :flat)

    i = iter cstr_args
    free_loop:
        unless i goto end_free_loop
        $I0 = shift i
        $P0 = args[$I0]
        str_free_cstring($P0)
        goto free_loop
    end_free_loop:

    .return (retv :flat)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
