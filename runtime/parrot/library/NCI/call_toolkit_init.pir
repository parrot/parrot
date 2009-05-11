# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

=head1 TITLE

call_toolkit_init.pir - PIR code to call toolkits that alter argv

=head1 SYNOPSIS

    .sub main :main
        .param pmc argv

        # Load this library and the NCI wrapper for the toolkit
	load_bytecode 'NCI/call_toolkit_init.pbc'
	load_bytecode 'FooTK.pbc'

	# Find Subs for toolkit's init function, and this helper routine
        .local pmc fooInit, call_toolkit_init
	fooInit           = get_global ['FooTK'], 'fooInit'
	call_toolkit_init = get_global ['NCI'],   'call_toolkit_init'

	# Call toolkit's init function, overwriting argv with mangled copy
	argv = call_toolkit_init(fooInit, argv)

	# Alternately, you can save both the original argv and mangled copy
	.local pmc mangled_argv
	mangled_argv = call_toolkit_init(fooInit, argv)

        # ...
    .end

=head1 DESCRIPTION

Calling an NCI toolkit init function that expects to parse and mangle
argv is a relatively grotty bit of code that no one should have to write
twice.  Hence this library, which provides just one routine:

=over 4

=item new_argv = call_toolkit_init(pmc init_func, pmc orig_argv)

Call an NCI void function with params C<(&argc, argv)> (and thus having
Parrot signature C<'v3p'>).  This is a very common signature for toolkit
(AKA framework) init functions that want to filter out command line
options that the toolkit itself should process.  Since it is expected
that the init call will remove some arguments, C<call_toolkit_init>
returns an updated argv.  C<orig_argv> is never changed; the NCI call is
performed using a copy.

=back

=cut


.namespace ['NCI']

.include 'datatypes.pasm'


.sub call_toolkit_init
    .param pmc init_func
    .param pmc orig_argv

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
    i = 0
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
