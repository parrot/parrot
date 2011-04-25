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

.sub _init_nci_utils :load
    # Mark all functions for export
    .local pmc parrot
    load_language 'parrot'
    parrot = compreg 'parrot'
    parrot.'export'('call_toolkit_init')
.end

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
    .local int count
    .local pmc argc
    count = orig_argv
    argc  = new 'Integer'
    argc  = count

    # Declare structure of a raw C string array with proper element count
    .local pmc argv_decl
    argv_decl = new 'ResizablePMCArray'
    push argv_decl, .DATATYPE_CSTR
    push argv_decl, count
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
    unless i < count goto add_null
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
    init_func(argc, argv)

    # Build a new_argv array to match the init function's return
    .local int new_count
    .local pmc new_argv
    new_count = argc
    new_argv  = new 'ResizableStringArray'
    # If program_name was supplied separately from argv, skip it on output
    i = has_program_name
  new_argv_loop:
    unless i < new_count goto done
    $S0 = argv[0;i]
    push new_argv, $S0
    inc i
    goto new_argv_loop

    # Finally, return the new (and adjusted) argv
  done:
    .return (new_argv)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
