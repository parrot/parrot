# Copyright (C) 2008-2011, Parrot Foundation.

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

=item wrapped_func = call_with_cstring(pmc nci_func, int cstring_arg_index1, ...)

Wraps an NCI function in a closure which translates between Parrot's strings and C's
asciiz strings. Any number (including 0) of argument indices are accepted. The magic index
value of C<-1> indicates that the return value should be translated.

=cut

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
    $P1 = dlfunc $P1, 'Parrot_str_new', 'SppI'
    $P2 = getinterp
    $S0 = $P1($P2, $P0, 0)
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
        $I0 = shift i
        $P0 = args[$I0]
        if null $P0 goto end_cstr_trans
            $S0       = $P0
            $P0       = str_to_cstring(interp, $S0)
            args[$I0] = $P0
        end_cstr_trans:
        goto trans_loop
    end_trans_loop:

    .local pmc retv
    (retv :slurpy) = func(args :flat)

    i = iter cstr_args
    free_loop:
        unless i goto end_free_loop
        $I0 = shift i
        $P0 = args[$I0]
        if null $P0 goto end_cstr_free
            str_free_cstring($P0)
        end_cstr_free:
        goto free_loop
    end_free_loop:

    .return (retv :flat)
.end

=item nci = dlfancy(pmc library, string name, string signature)

Emulates C<dlfunc> op, but extends this to provide functionality for more complex, but
common, types. Current supported types are:

=item t

Translate Parrot strings to C asciiz strings and back. Argument strings belong to Parrot and
are freed after the call. Return strings belong to the C library and are not freed by Parrot.

=back

=cut

.sub dlfancy
    .param pmc    lib
    .param string name
    .param string sig

    .local pmc cstrings
    cstrings = new ['ResizableIntegerArray']

    .local string mysig
    mysig = ''

    $P0 = box sig
    $P0 = iter $P0
    $I0 = -1
    loop:
        unless $P0 goto end_loop
        $S0 = shift $P0
        unless $S0 == 't' goto end_t_translation
            push cstrings, $I0
            $S0 = 'p'
        end_t_translation:
        mysig = concat mysig, $S0
        inc $I0
        goto loop
    end_loop:

    .local pmc nci
    nci = dlfunc lib, name, mysig
    $I0 = defined nci
    if $I0 goto done_early_ret
        .return (nci)
    done_early_ret:

    $P0 = call_with_cstring(nci, cstrings :flat)
    .return ($P0)
.end

### ncifunc

.sub '' :load :init
    .local pmc str_to_cstring, str_free_cstring, str_new
    null $P0
    str_to_cstring   = dlfunc $P0, 'Parrot_str_to_cstring',   'ppS'
    str_free_cstring = dlfunc $P0, 'Parrot_str_free_cstring', 'vp'
    str_new          = dlfunc $P0, 'Parrot_str_new',          'SppI'
    set_global 'str_to_cstring',   str_to_cstring
    set_global 'str_free_cstring', str_free_cstring
    set_global 'str_new',          str_new
.end


=over 4

=item nci = ncifunc(pmc library, string name, string signature)

Create a NCI function by looking up C<name> in C<library>, assuming
a calling signature of C<signature>.  The supported types of
C<signature> are:
    p = pmc
    i = int
    f = float
    t = null-terminated array of char
    ...

=back

=cut

.sub 'ncifunc'
    .param pmc library
    .param string name
    .param string signature

    .local string trsrc, trtgt
    trsrc = 't'                        # list of letters we translate from
    trtgt = 'p'                        # list of letters to translate to

    # perform translations for dlfunc opcode
    .local int siglen, sigidx
    .local string dlsig
    siglen = length signature
    dlsig = ''
    sigidx = 0
  dlsig_loop:
    unless sigidx < siglen goto dlsig_done
    .local string type
    type = substr signature, sigidx, 1
    $I0 = index trsrc, type
    if $I0 < 0 goto dlsig_next
    type = substr trtgt, $I0, 1
  dlsig_next:
    dlsig = concat dlsig, type
    inc sigidx
    goto dlsig_loop
  dlsig_done:

    # look up the nci function and save as lexical
    .local pmc func
    func = dlfunc library, name, dlsig

    # if no transformations needed, no need to wrap!
    if dlsig != signature goto do_nciwrap
    .return (func)

  do_nciwrap:
    .lex 'func', func

    # save the original signature as lexical
    $P99 = box signature
    .lex 'signature', $P99

    # clone a wrapper closure and return it
    .const 'Sub' nciwrap = 'nciwrap'
    $P0 = newclosure nciwrap

    .return ($P0)
.end


.sub 'nciwrap' :outer('ncifunc')
    .param pmc args           :slurpy

    .local string signature
    $P99 = find_lex 'signature'
    signature = $P99

    .local pmc interp, strfreelist
    .local string argsig
    .local int arglen, argidx
    interp = getinterp
    argsig = substr signature, 1
    arglen = length argsig
    argidx = 0
    strfreelist = new ['ResizablePMCArray']
  arg_loop:
    unless argidx < arglen goto arg_done
    $S0 = substr argsig, argidx, 1
    if $S0 != 't' goto arg_next
    $P0 = args[argidx]
    if null $P0 goto arg_next
    $S0 = $P0
    $P0 = 'str_to_cstring'(interp, $S0)
    args[argidx] = $P0
    push strfreelist, $P0
  arg_next:
    inc argidx
    goto arg_loop
  arg_done:

  nci_call:
    .local pmc func, retv
    func = find_lex 'func'
    (retv :slurpy) = func(args :flat)

  free_loop:
    unless strfreelist goto free_done
    $P0 = pop strfreelist
    'str_free_cstring'($P0)
    goto free_loop
  free_done:

    $S0 = substr signature, 0, 1
    if $S0 == 't' goto nci_ret_t
    .return (retv :flat)

  nci_ret_t:
    retv = pop retv                 # get the first value out of the slurpy
    if null retv goto nci_ret_t_null
    $S0 = 'str_new'(interp, retv, 0)
    .return ($S0)
  nci_ret_t_null:
    $S0 = null
    .return ($S0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
