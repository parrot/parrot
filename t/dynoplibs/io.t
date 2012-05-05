#!./parrot
# Copyright (C) 2008-2011, Parrot Foundation.

=head1 NAME

t/op/io.t - Testing io opcodes

=head1 SYNOPSIS

    % prove t/op/io.t

=head1 DESCRIPTION

Tests various io opcodes.

=cut

.loadlib 'io_ops'

.sub 'main' :main
    .include 'test_more.pir'

    plan(60)

    read_on_null()
    open_delegates_to_filehandle_pmc()
    test_bad_open()
    open_pipe_for_reading()
    getfd_fdopen()
    test_fdopen_p_i_sc()
    test_fdopen_p_ic_s()
    test_fdopen_p_ic_sc()
    test_fdopen_p_i_s()
    test_open_p_s_s()
    test_seek_tell()
    test_peek()
    test_read()
    printerr_tests()
    stat_tests()
    stdout_tests()

    # must come after (these don't use test_more)
    open_pipe_for_writing()
    read_invalid_fh()
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

.sub 'test_bad_open'
    null $S0

    throws_substring(<<"CODE", "Invalid open", "bad open_p_s_s")
    .sub main
        $P0 = open $S0, $S0
    .end
CODE

    throws_substring(<<"CODE", "Invalid open", "bad open_p_sc_s")
    .sub main
        $P0 = open "", $S0
    .end
CODE

    throws_substring(<<"CODE", "Invalid open", "bad open_p_s_sc")
    .sub main
        $P0 = open $S0, ""
    .end
CODE

#    throws_substring(<<"CODE", "Invalid open", "bad open_p_sc_sc")
#    .sub main
#        $P0 = open "", ""
#    .end
#CODE

    throws_substring(<<"CODE", "Invalid open", "bad open_p_s")
    .sub main
        $P0 = open $S0
    .end
CODE

#    throws_substring(<<"CODE", "Invalid open", "bad open_p_sc")
#    .sub main
#        $P0 = open ""
#    .end
#CODE
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
    command = '"'
    $S0 = conf['build_dir']
    command .= $S0

    .local string aux
    aux = conf['slash']
    command .= aux
    aux = conf['test_prog']
    command .= aux
    aux = conf['exe']
    command .= aux
    command .= '" -V'

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
    .local string aux
    command = '"'
    aux = conf['build_dir']
    command .= aux

    aux = conf['slash']
    command .= aux
    .local string filename
    filename .= command
    filename .= 'examples/pasm/cat.pasm'
    aux = conf['test_prog']
    command .= aux
    aux = conf['exe']
    command .= aux
    command .= '" '
    command .= filename
    command .= '"'

    .local pmc pipe
    pipe = open command, 'wp'
    unless pipe goto open_pipe_for_writing_failed

    ok(1, 'open pipe for writing')
    close pipe
    .return ()

  open_pipe_for_writing_failed:
    nok(1, 'open pipe for writing')
    .return ()

  open_pipe_for_writing_todoed:
    todo(0, 'Unimplemented in this platform, TT #661')

.end

# GH #465
.sub 'getfd_fdopen'
    getstdout $P0
    $I0 = $P0.'get_fd'()
    fdopen $P1, $I0, 'w'
    $I0 = defined $P1
    ok($I0, 'fdopen - no close')
.end

.sub 'test_fdopen_p_i_sc'
    $I0 = 1

    fdopen $P0, $I0, 'w'
    $I0 = defined $P0
    ok($I0, 'fdopen_p_i_sc')

    fdopen $P0, $I0, ''
    $I0 = defined $P0
    is($I0, 0, 'bad fdopen_p_i_sc')
.end

.sub 'test_fdopen_p_ic_s'
    $S0 = 'w'
    $S1 = ''

    fdopen $P0, 1, $S0
    $I0 = defined $P0
    ok($I0, 'fdopen_p_ic_s')

    fdopen $P0, 1, $S1
    $I0 = defined $P0
    is($I0, 0, 'bad fdopen_p_ic_s')
.end

.sub 'test_fdopen_p_ic_sc'
    fdopen $P0, 1, 'w'
    $I0 = defined $P0
    ok($I0, 'fdopen_p_ic_sc')

    fdopen $P0, 1, ''
    $I0 = defined $P0
    is($I0, 0, 'bad fdopen_p_ic_sc')
.end

.sub 'test_fdopen_p_i_s'
    getstdout $P0
    $S0 = 'w'
    $S1 = ''
    $I0 = $P0.'get_fd'()

    fdopen $P1, $I0, $S0
    $I0 = defined $P1
    ok($I0, 'fdopen_p_i_s')

    fdopen $P0, $I0, $S1
    $I0 = defined $P0
    is($I0, 0, 'bad fdopen_p_i_sc')
.end

.sub 'test_open_p_s_s'
    $S0 = "README"
    $S1 = "r"
    $P0 = open $S0, $S1
    $I0 = defined $P0
    ok($I0, "open_p_s_s")
.end

.sub 'test_seek_tell'
    $S0 = 'r'
    $P0 = open "README", $S0
    $I0 = tell $P0
    is( $I0, 0, 'tell_i_p' )

    $I0 = 4 # offset
    $I1 = 1 # from current pos
    $I4 = -10 # bad number

    seek $P0, $I0, $I1
    $I2 = tell $P0
    is( $I2, $I0, 'seek_p_i_i' )

throws_substring(<<"CODE", "seek failed (32bit)", "bad seek_p_i_i")
    .sub main
        seek $P0, $I4, $I4
    .end
CODE

    seek $P0, 4, $I1
    $I2 = tell $P0
    is( $I2, 8, 'seek_p_ic_i' )

throws_substring(<<"CODE", "seek failed (32bit)", "bad seek_p_ic_i")
    .sub main
        seek $P0, -10, $I4
    .end
CODE

    seek $P0, $I0, 1
    $I2 = tell $P0
    is( $I2, 12, 'seek_p_i_ic' )

throws_substring(<<"CODE", "seek failed (32bit)", "bad seek_p_i_ic")
    .sub main
        seek $P0, $I4, -10
    .end
CODE

    seek $P0, 4, 1
    $I2 = tell $P0
    is( $I2, 16, 'seek_p_ic_ic' )

throws_substring(<<"CODE", "seek failed (32bit)", "bad seek_p_ic_ic")
    .sub main
        seek $P0, -10, -10
    .end
CODE

    seek $P0, 0, $I0, $I1
    $I2 = tell $P0
    is( $I2, 20, 'seek_p_ic_i_i' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_ic_i_i")
    .sub main
        seek $P0, -10, $I4, $I4
    .end
CODE

    $I3 = 0 # high order intval
    seek $P0, $I3, $I0, $I1
    $I2 = tell $P0
    is( $I2, 24, 'seek_p_i_i_i' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_i_i_i")
    .sub main
        seek $P0, $I4, $I4, $I4
    .end
CODE

    seek $P0, $I3, 4, $I1
    $I2 = tell $P0
    is( $I2, 28, 'seek_p_i_ic_i' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_i_ic_i")
    .sub main
        seek $P0, $I4, -10, $I4
    .end
CODE

    seek $P0, 0, 4, $I1
    $I2 = tell $P0
    is( $I2, 32, 'seek_p_ic_ic_i' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_ic_ic_i")
    .sub main
        seek $P0, -10, -10, $I4
    .end
CODE

    seek $P0, $I3, $I0, 1
    $I2 = tell $P0
    is( $I2, 36, 'seek_p_i_i_ic' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_i_i_ic")
    .sub main
        seek $P0, $I4, $I4, -10
    .end
CODE

    seek $P0, 0, $I0, 1
    $I2 = tell $P0
    is( $I2, 40, 'seek_p_ic_i_ic' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_ic_i_ic")
    .sub main
        seek $P0, -10, $I4, -10
    .end
CODE

    seek $P0, $I3, 4, 1
    $I2 = tell $P0
    is( $I2, 44, 'seek_p_i_ic_ic' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_i_ic_ic")
    .sub main
        seek $P0, $I4, -10, -10
    .end
CODE

    seek $P0, 0, 4, 1
    $I2 = tell $I5, $P0
    is( $I5, 48, 'seek_p_i_ic_ic' )

throws_substring(<<"CODE", "seek failed (64bit)", "bad seek_p_i_ic_ic")
    .sub main
        seek $P0, -10, -10, -10
    .end
CODE
.end

.sub 'test_peek'
    .include 'stat.pasm'

    $I0 = stat 'README', .STAT_FILESIZE
    $P0 = open 'README', 'r'
    close $P0
    $P1 = getstdin

    setstdin $P0
    $S0 = peek
    $I1 = isnull $S0
    ok($I1, 'can peek_s closed file')

    $S0 = peek $P0
    $I1 = isnull $S0
    ok($I1, 'can peek_s_p closed file')

    setstdin $P1
.end

.sub 'test_read'
    getstdin $P1

    $P0 = open 'README', 'r'
    $I0 = 4

    setstdin $P0
    ok(1, 'can setstdin')

    $S0 = read $I0
    $I1 = tell $P0
    is( $I1, 4, 'read_s_i' )

    $S0 = read 4
    $I1 = tell $P0
    is( $I1, 8, 'read_s_ic' )

    setstdin $P1

    $S0 = read $P0, $I0
    $I1 = tell $P0
    is( $I1, 12, 'read_s_p_i' )

    $S0 = read $P0, 4
    $I1 = tell $P0
    is( $I1, 16, 'read_s_p_i' )
.end

.sub 'read_on_null'
    .const string description = "read on null PMC throws exception"
    push_eh eh
    null $P1
    $S0 = read $P1, 1
    ok(0, description)
    goto ret
  eh:
    ok(1, description)
  ret:
    pop_eh
    .return ()
.end

.sub 'read_invalid_fh'
    $P0 = new ['FileHandle']

    push_eh _readline_handler
    $S0 = readline $P0
    print "not "

_readline_handler:
        ok(1, '_readline_handler')
        pop_eh

    push_eh _read_handler
    $S0 = read $P0, 1
    print "not "

_read_handler:
        ok(1, '_read_handler')
        pop_eh

    push_eh _print_handler
    print $P0, "kill me now\n"
    print "not "

_print_handler:
        ok(1, '_print_handler')
        pop_eh
.end

.sub 'printerr_tests'
    # temporarily capture stderr
    $P0 = getstderr
    $P1 = new ['StringHandle']
    $S0 = null
    $P1.'open'($S0, 'w')
    setstderr $P1

    $I1 = 10
    $N1 = 1.0
    $S1 = "foo"

    $P2 = new ['String']
    $P2 = "This is a test\n"
    printerr 10
    printerr "\n"
    printerr $I1
    printerr "\n"
    printerr 1.0
    printerr "\n"
    printerr $N1
    printerr "\n"
    printerr "foo"
    printerr "\n"
    printerr $S1
    printerr "\n"
    printerr $P2

    # restore stderr
    setstderr $P0

    $S0 = $P1.'readall'()
    is($S0, <<'OUTPUT', 'printerr opcode')
10
10
1
1
foo
foo
This is a test
OUTPUT
.end

.sub 'stat_tests'
    .const string description = 'stat failed'
    .include "stat.pasm"

    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto run_win32_stat_tests
    goto run_unix_stat_tests

  run_win32_stat_tests:
    $I0 = stat "parrot.exe", .STAT_FILESIZE
    ok(1, 'can stat_i_sc_ic')

    $S0 = 'parrot.exe'
    $I0 = stat $S0, $I1
    ok(1, 'can stat_i_s_i')

    $I1 = .STAT_FILESIZE
    $I0 = stat 'parrot.exe', $I1
    ok(1, 'can stat_i_sc_i')

    goto done_stat_filename_tests
  run_unix_stat_tests:
    $I0 = stat "parrot", .STAT_FILESIZE
    ok(1, 'can stat_i_sc_ic')

    $S0 = 'parrot'
    $I0 = stat $S0, $I1
    ok(1, 'can stat_i_s_i')

    $I1 = .STAT_FILESIZE
    $I0 = stat 'parrot', $I1
    ok(1, 'can stat_i_sc_i')
  done_stat_filename_tests:

throws_substring(<<"CODE", description, "bad stat_i_sc_ic")
    .sub main
        $I0 = stat 'no_such_file', .STAT_FILESIZE
    .end
CODE
throws_substring(<<"CODE", description, "bad stat_i_s_i")
    .sub main
        $I1 = .STAT_FILESIZE
        $S0 = 'no_such_file'
        $I0 = stat $S0, $I1
    .end
CODE

.end

.sub stdout_tests
    .local pmc oslib
    .local pmc os
    oslib = loadlib 'os'
    os = new ['OS']
    $P0 = getstdout
    $P1 = open 'test_file', 'w'
    setstdout $P1
    say 'test'
    setstdout $P0
    close $P1
    $P1 = open 'test_file', 'r'
    $S0 = $P1.'read'(4)
    close $P1
    os.'rm'('test_file')
    is($S0, 'test', 'setstdout')
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
