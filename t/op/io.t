#!parrot
# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

t/op/io.t - Testing io opcodes

=head1 SYNOPSIS

    % prove t/op/io.t

=head1 DESCRIPTION

Tests various io opcodes.

=cut

.const int TESTS = 4

.sub 'main' :main
    .include 'test_more.pir'

    plan(TESTS)

    open_null_filename()
    open_null_mode()
    open_pipe_for_reading()
    open_pipe_for_writing()
.end

.sub 'open_null_filename'
    push_eh open_null_filename_failed
    $P0 = open $S0, '<'
    nok(1, 'open with null filename')
    .return ()

  open_null_filename_failed:
    ok(1, 'open with null filename')
.end

.sub 'open_null_mode'
    push_eh open_null_mode_failed
    $P0 = open 'some_name', $S0
    nok(1, 'open with null mode')
    .return ()

  open_null_mode_failed:
    ok(1, 'open with null mode')
.end

.sub 'tt661_todo_test'
    # Checks whether the platform is linux, MSWin32, darwin: on other
    # platforms, the following tests are todo'ed.
    $S0 = sysinfo 4
    if $S0 == 'linux' goto tt661_ok
    if $S0 == 'MSWin32' goto tt661_ok
    if $S0 == 'darwin' goto tt661_ok

    .return (0)

  tt661_ok:
    .return(1)
.end

.sub 'open_pipe_for_reading'
    $I0 = tt661_todo_test()
    unless $I0 goto open_pipe_for_reading_todoed

    .include 'iglobals.pasm'

    .local pmc interp
    interp = getinterp

    .local pmc conf
    conf = interp[.IGLOBALS_CONFIG_HASH]

    .local string command
    command = conf['build_dir']

    .local string aux
    aux = conf['slash']
    command .= aux
    aux = conf['test_prog']
    command .= aux
    aux = conf['exe']
    command .= aux
    command .= ' -V'

    .local pmc pipe
    pipe = open command, 'rp'
    unless pipe goto open_pipe_for_reading_failed
    .local string line
    line = readline pipe
    like('This is Parrot', ":s This is Parrot", 'open pipe for reading')
    .return()

  open_pipe_for_reading_failed:
    nok(1, 'open pipe for reading')
    .return ()

  open_pipe_for_reading_todoed:
    todo(1, 'Unimplemented in this platform, TT #661')
.end

.sub 'open_pipe_for_writing'
    .include 'iglobals.pasm'
    
    .local pmc interp
    interp = getinterp

    .local pmc conf
    conf = interp[.IGLOBALS_CONFIG_HASH]
  
    .local string command
    command = conf['build_dir']
  
    .local string aux
    aux = conf['slash']
    command .= aux
    .local string filename
    filename .= command
    filename .= 'examples/pasm/cat.pasm'
    aux = conf['test_prog']
    command .= aux
    aux = conf['exe']
    command .= aux
    command .= ' '
    command .= filename

    .local pmc pipe
    pipe = open command, 'wp'
    unless pipe goto open_pipe_for_writing_failed
    pipe.'puts'("ok - open pipe for writing\n")
    close pipe
    .return()

  open_pipe_for_writing_failed:
    nok(1, 'open pipe for writing')
    .return ()

  open_pipe_for_writing_todoed:
    todo(1, 'Unimplemented in this platform, TT #661')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
