#!./parrot
# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

t/op/io.t - Testing io opcodes

=head1 SYNOPSIS

    % prove t/op/io.t

=head1 DESCRIPTION

Tests various io opcodes.

=cut

.const int TESTS = 5

.loadlib 'io_ops'

.sub 'main' :main
    .include 'test_more.pir'

    plan(TESTS)

    open_delegates_to_filehandle_pmc()
    open_null_filename()
    open_null_mode()
    open_pipe_for_reading()
    getfd_fdopen()
    open_pipe_for_writing() # must be last (doesn't use test_more)
.end

.sub open_delegates_to_filehandle_pmc
    load_bytecode 'P6object.pbc'

    .local pmc p6meta, interp, classes, classid
    p6meta = get_root_global ["parrot"], "P6metaclass"
    p6meta.'new_class'('Testing')

    interp = getinterp
    classes = interp[0]
    classid = classes['Testing']
    $I0 = classes['FileHandle']
    set classes['FileHandle'], classid

    $P1 = open '/foo'
    is($P1,42,'open opcode delegates to the open method on the FileHandle PMC')

    # replace the original, so we don't break other tests
    set classes['FileHandle'], $I0

.end

.sub 'open_null_filename'
    push_eh open_null_filename_failed
    null $S0
    $P0 = open $S0, 'r'
    nok(1, 'open with null filename')
    .return ()

  open_null_filename_failed:
    ok(1, 'open with null filename')
.end

.sub 'open_null_mode'
    push_eh open_null_mode_failed
    null $S0
    $P0 = open 'some_name', $S0
    nok(1, 'open with null mode')
    .return ()

  open_null_mode_failed:
    ok(1, 'open with null mode')
.end

.loadlib 'sys_ops'
.sub 'tt661_todo_test' :anon
    # As of r41963, these tests need to be todo'ed at least on Win32. Add new
    # platforms known to fail.
    .include 'sysinfo.pasm'
    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto tt661_todo

    .return (0)

  tt661_todo:
    .return (1)
.end

.include 'iglobals.pasm'

.sub 'open_pipe_for_reading'
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
    line = substr line, 0, 14
    is('This is Parrot', line, 'open pipe for reading')
    .return ()

  open_pipe_for_reading_failed:
    nok(1, 'open pipe for reading')
    .return ()
.end

.sub 'open_pipe_for_writing'
    $I0 = tt661_todo_test()
    if $I0 goto open_pipe_for_writing_todoed
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

    pipe.'puts'("ok 5 - open pipe for writing\n")
    close pipe
    .return ()

  open_pipe_for_writing_failed:
    nok(1, 'open pipe for writing')
    .return ()

  open_pipe_for_writing_todoed:
    todo(0, 'Unimplemented in this platform, TT #661')

.end

# TT #1178
.sub 'getfd_fdopen'
    getstdout $P0
    $I0 = $P0.'get_fd'()
    fdopen $P1, $I0, 'w'
    $I0 = defined $P1
    ok($I0, 'get_fd()/fdopen')
    close $P1

    getstdout $P0
    $I0 = $P0.'get_fd'()
    fdopen $P1, $I0, 'w'
    $I0 = defined $P1
    ok($I0, 'fdopen - no close')
.end

.namespace ["Testing"]

.sub open :method
    .param pmc args :slurpy
    .return(42)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
