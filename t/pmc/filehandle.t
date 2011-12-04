#!perl
# Copyright (C) 2006-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 30;
use Parrot::Test::Util 'create_tempfile';

=head1 NAME

t/pmc/filehandle.t - test the FileHandle PMC

=head1 SYNOPSIS

    % prove t/pmc/filehandle.t

=head1 DESCRIPTION

Tests the FileHandle PMC.

=cut

# L<PDD22/I\/O PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new ['FileHandle']
    say "ok 1 - $P0 = new ['FileHandle']"
.end
CODE
ok 1 - $P0 = new ['FileHandle']
OUT

my (undef, $temp_file) = create_tempfile( UNLINK => 1 );

# L<PDD22/I\/O PMC API/=item open.*=item close>
pir_output_is( <<"CODE", <<'OUT', 'open and close - synchronous' );
.sub 'test' :main
    .local int i
    \$P1 = new ['FileHandle']
    \$P1.'open'('README')
    say 'ok 1 - \$P1.open(\$S1)'

    \$P1.'close'()
    say 'ok 2 - \$P1.close()'

    \$P3 = new ['FileHandle']
    \$P3.'open'('$temp_file', 'rw')
    say 'ok 3 - \$P3.open(\$S1, \$S2) # rw mode'
    \$P3.'close'()

    \$P3.'open'()
    say 'ok 4 - \$P3.open()         # reopening'
    \$P3.'close'()

  test_5:
    \$P5 = new ['FileHandle']
    push_eh eh_bad_file_1
    \$P5.'open'('bad.file')
    pop_eh

  test_6:
    \$P6 = new ['FileHandle']
    push_eh eh_bad_file_2
    \$P6.'open'('bad.file', 'r')
    pop_eh

  test_7:
    \$P7 = new ['FileHandle']
    \$P7.'open'('$temp_file', 'w')
    say 'ok 7 - \$P7.open(\$S1, \$S2) # new file, write mode succeeds'

    i = \$P7.'is_closed'()
    print 'is_closed: '
    say i
    \$P7.'close'()
    i = \$P7.'is_closed'()
    print 'is_closed after close: '
    say i

    goto end

  eh_bad_file_1:
    say 'ok 5 - \$P5.open(\$S1)      # with bad file'
    goto test_6

  eh_bad_file_2:
    say "ok 6 - \$P6.open(\$S1, \$S2) # with bad file"
    goto test_7

  end:
.end
CODE
ok 1 - $P1.open($S1)
ok 2 - $P1.close()
ok 3 - $P3.open($S1, $S2) # rw mode
ok 4 - $P3.open()         # reopening
ok 5 - $P5.open($S1)      # with bad file
ok 6 - $P6.open($S1, $S2) # with bad file
ok 7 - $P7.open($S1, $S2) # new file, write mode succeeds
is_closed: 0
is_closed after close: 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'wrong open' );
.include 'except_types.pasm'

.sub main :main
    .local pmc fh, eh
    .local int i
    i = 1
    eh = new['ExceptionHandler']
    eh = .EXCEPTION_PIO_ERROR
    set_label eh, catchnoname
    push_eh eh
    fh = new['FileHandle']
    # Open without filename
    fh.'open'()
    i = 0
    goto reportnoname
  catchnoname:
    finalize eh
  reportnoname:
    say i

    i = 0
    set_label eh, catchreopen
    fh.'open'('README')
    i = 1
    # Open already opened
    fh.'open'('README')
    i = 0
    goto reportreopen
  catchreopen:
    finalize eh
  reportreopen:
    say i
    pop_eh
.end
CODE
1
1
OUT

pir_output_is( <<'CODE', <<'OUT', 'isatty' );
.sub 'test' :main
    .local pmc fh
    .local int i
    fh = new ['FileHandle']
    i = fh.'isatty'()
    print i
    say ' unopened FileHandle is not a tty'
    fh.'open'('README')
    i = fh.'isatty'()
    print i
    say ' regular file is not a tty'
.end
CODE
0 unopened FileHandle is not a tty
0 regular file is not a tty
OUT

SKIP: {
    skip 'no asynch calls yet' => 1;

    pir_output_is( <<'CODE', <<'OUT', 'open and close - asynchronous' );
.sub 'test' :main
    $P1 = # TT #1204 create a callback here
    $P0 = new ['FileHandle']

    $P0.'open'('README')
    say 'ok 1 - $P0.open($S1)'

    $P0.'close'()
    say 'ok 2 - $P0.close($P1)'

    $P0.'open'('README', 'rw')
    say 'ok 3 - $P0.open($S1, $S2)'

    $P0.'close'()
    $P0.'open'()
    say 'ok 4 - $P0.open()'

  cleanup:
    $P0.'close'()
.end
CODE
ok 1 - $P0.open($S1)
ok 2 - $P0.close()
ok 3 - $P0.open($S1, $S2)
ok 4 - $P0.open()
OUT
}

# L<PDD22/I\/O PMC API/=item read>
pir_output_is(
    <<'CODE', <<'OUT', 'read - synchronous' );
.sub 'test' :main
    $P0 = new ['FileHandle']
    $P0.'open'('README')

    $S0 = $P0.'read'(14) # bytes
    if $S0 == 'This is Parrot' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = $P1.read($I2)'

    $S0 = $P0.'read'(9)  # bytes
    if $S0 == ', version' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $S0 = $P1.read($I2) # again on same stream'
.end
CODE
ok 1 - $S0 = $P1.read($I2)
ok 2 - $S0 = $P1.read($I2) # again on same stream
OUT

pir_output_is(
    <<'CODE', <<'OUT', 'read_bytes - synchronous' );
.sub 'test' :main
    .local pmc fh, bb

    fh = new ['FileHandle']
    fh.'open'('README')

    bb = fh.'read_bytes'(14)
    $S0 = bb.'get_string'('ascii')
    if $S0 == 'This is Parrot' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - read_bytes'

    bb = fh.'read_bytes'(9)  # bytes
    $S0 = bb.'get_string'('utf8')
    if $S0 == ', version' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - read_bytes # again on same stream'
.end
CODE
ok 1 - read_bytes
ok 2 - read_bytes # again on same stream
OUT

# L<PDD22/I\/O PMC API/=item print>
pir_output_is( <<"CODE", <<'OUT', 'print - synchronous' );
.sub 'test' :main

    \$P0 = new ['FileHandle']
    \$P0.'open'('$temp_file', 'w')

    \$P0.'print'(123)
    say 'ok 1 - \$P0.print(\$I1)'
    \$P0.'print'(456.789)
    say 'ok 2 - \$P0.print(\$N1)'
    \$P0.'print'("squawk\\n")
    say 'ok 3 - \$P0.print(\$S1)'
    \$P1 = new ['Integer']
    \$P1 = 42
    \$P0.'print'(\$P1)
    say 'ok 4 - \$P0.print(\$P1)'

    \$P0.'close'()

    \$P1 = new ['FileHandle']
    \$P1.'open'('$temp_file', 'r')

    \$S0 = \$P1.'read'(3) # bytes
    if \$S0 == "123" goto ok_5
    print 'not '
  ok_5:
    say 'ok 5 - read integer back from file'

    \$S0 = \$P1.'read'(16) # bytes
    if \$S0 == "456.789squawk\\n42" goto ok_6
    say \$S0

    print 'not '
  ok_6:
    say 'ok 6 - read string back from file'

    \$P1.'close'()
.end
CODE
ok 1 - $P0.print($I1)
ok 2 - $P0.print($N1)
ok 3 - $P0.print($S1)
ok 4 - $P0.print($P1)
ok 5 - read integer back from file
ok 6 - read string back from file
OUT

(undef, $temp_file) = create_tempfile( UNLINK => 1 );

# L<PDD22/I\/O PMC API/=item print.*=item readline>
pir_output_is( <<"CODE", <<'OUT', 'readline - synchronous' );
.sub 'test' :main
    load_bytecode 'String/Utils.pbc'
    .local pmc chomp
               chomp = get_global ['String';'Utils'], 'chomp'

    \$P0 = new ['FileHandle']
    \$P0.'open'('$temp_file', 'w')
    \$P0.'print'("foobarbaz\\n42")
    \$P0.'close'()

    \$P1 = new ['FileHandle']
    \$P1.'open'('$temp_file')

    \$S0 = \$P1.'readline'()
    \$S0 = chomp( \$S0 )
    if \$S0 == 'foobarbaz' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - \$S0 = \$P1.readline()'

    \$S0 = \$P1.'readline'()
    \$S0 = chomp( \$S0 )
    if \$S0 == '42' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - \$S0 = \$P1.readline() # again on same stream'

    \$P1.'close'()
.end
CODE
ok 1 - $S0 = $P1.readline()
ok 2 - $S0 = $P1.readline() # again on same stream
OUT

my $LINES;
($LINES, $temp_file) = create_tempfile( UNLINK => 1 );

for my $counter (1 .. 10000) {
    print $LINES $counter, "\n";
}
close $LINES;

pir_output_is( <<"CODE", <<'OUT', 'readline 10,000 lines' );
.sub 'test' :main
    load_bytecode 'String/Utils.pbc'
    .local pmc chomp
               chomp = get_global ['String';'Utils'], 'chomp'
    .local string test_line
    .local pmc filehandle
    .local int counter
    filehandle = new ['FileHandle']
    filehandle.'open'('$temp_file')

    counter = 0
  read_loop:
    inc counter
    # read in the file one line at a time...
    \$I0 = filehandle.'eof'()
    if \$I0 goto end_read_loop

    test_line = filehandle.'readline'()
    if test_line == "" goto end_read_loop
    test_line = chomp( test_line )
    \$I1 = test_line
    if \$I1 == counter goto read_loop
      print "not "
## the following lines provide more extensive debugging
## output on a readline failure
#      print counter
#      print " = "
#      print \$I1
#      print "\\n"
#      counter = \$I1
#      goto read_loop

  end_read_loop:
    if counter > 1 goto read_something
      print "not "
  read_something:
    say 'ok 1 - read 10,000 lines'
    filehandle.'close'()
.end
CODE
ok 1 - read 10,000 lines
OUT


# TT #1204 test reading long chunks, eof, and across newlines

# TT #1204 pir_output_is( <<'CODE', <<'OUT', 'print, read, and readline - asynchronous', todo => 'not yet implemented' );

# L<PDD22/I\/O PMC API/=item record_separator>
pir_output_is( <<"CODE", <<'OUT', 'record_separator' );
.sub 'test' :main
    \$P0 = new ['FileHandle']
    \$P0.'open'('$temp_file', 'rw')

    \$S0 = \$P0.'record_separator'()
    if \$S0 == "\\n" goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - \$S0 = \$P1.record_separator() # default'

    \$S99 = 'a'
    \$P0.'record_separator'(\$S99)
    \$S0 = \$P0.'record_separator'()
    if \$S0 == \$S99 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - \$P0.record_separator(\$S1)'

    \$P0.'print'(123)
    \$S0 = \$P0.'record_separator'()
    \$P0.'print'(\$S0)
    \$P0.'print'(456)

    \$P0.'seek'(0, 0)
    \$S0 = \$P0.'readline'()
    if \$S0 == '123a' goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - \$P0.record_separator() # .readline works as expected'
.end
CODE
ok 1 - $S0 = $P1.record_separator() # default
ok 2 - $P0.record_separator($S1)
ok 3 - $P0.record_separator() # .readline works as expected
OUT

# L<PDD22/I\/O PMC API/=item record_separator>
pir_output_is( <<'CODE', <<'OUT', 'record_separator, multiple chars', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new ['FileHandle']

    $S99 = 'abc'
    $P0.'record_separator'($S99)
    $S0 = $P0.'record_separator'()
    if $S0 == $S99 goto ok_2
    print 'not '
  ok_2:
    say 'ok 1 - $P0.record_separator($S1)'

    $P0.'print'(123)
    $S0 = $P0.'record_separator'()
    $P0.'print'($S0)
    $P0.'print'(456)

    $S0 = $P0.'readline'()
    if $S0 == '123abc' goto ok_3
    print 'not '
  ok_3:
    say 'ok 2 - $P0.record_separator() # .readline works as expected'
.end
CODE
ok 1 - $P0.record_separator($S1)
ok 2 - $P0.record_separator() # .readline works as expected
OUT

# L<PDD22/I\/O PMC API/=item buffer_type>
pir_output_is( <<'CODE', <<'OUT', 'buffer_type' );
.sub 'test' :main
    $P0 = new ['FileHandle']

    $P0.'buffer_type'('unbuffered')
    $S0 = $P0.'buffer_type'()
    if $S0 == 'unbuffered' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = $P1.buffer_type() # unbuffered'

    $P0.'buffer_type'('line-buffered')
    $S0 = $P0.'buffer_type'()
    if $S0 == 'line-buffered' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $S0 = $P1.buffer_type() # line-buffered'

    $P0.'buffer_type'('full-buffered')
    $S0 = $P0.'buffer_type'()
    if $S0 == 'full-buffered' goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $S0 = $P1.buffer_type() # full-buffered'

.end
CODE
ok 1 - $S0 = $P1.buffer_type() # unbuffered
ok 2 - $S0 = $P1.buffer_type() # line-buffered
ok 3 - $S0 = $P1.buffer_type() # full-buffered
OUT

# TT #1204 test effects of buffer_type, not just set/get

# TT #1177
# L<PDD22/I\/O PMC API/=item buffer_size>
# NOTES: try setting positive, zero, negative int
# perform print and read ops
# change buffer size while it contains data
# try with all 'buffer_type' modes

(undef, $temp_file) = create_tempfile( UNLINK => 1 );

pir_output_is( <<"CODE", <<'OUT', 'buffer_size' );
.sub 'test' :main
    \$P0 = new ['FileHandle']

    \$P0.'buffer_type'('full-buffered')
    \$P0.'buffer_size'(42)
    say 'ok 1 - \$P0.buffer_size(42)     # set buffer size'

    \$I0 = \$P0.'buffer_size'()

    # The set buffer size is a minimum, the I/O subsystem may scale it upward
    # to a round block, so test that the buffer size is equal or greater than
    # the set size.
    if \$I0 >= 42 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - \$I0 = \$P0.buffer_size() # get buffer size'

    \$P0.'open'('$temp_file', 'w')

    \$P0.'print'(1234567890)
    \$P0.'close'()

    \$P1 = new ['FileHandle']
    \$P1.'open'('$temp_file')

    \$S0 = \$P1.'readline'()

    if \$S0 == '1234567890' goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - \$S0 = \$P0.readline()    # buffer flushed'

    \$P1.'close'()

.end
CODE
ok 1 - $P0.buffer_size(42)     # set buffer size
ok 2 - $I0 = $P0.buffer_size() # get buffer size
ok 3 - $S0 = $P0.readline()    # buffer flushed
OUT

# L<PDD22/I\/O PMC API/=item encoding>
pir_output_is( <<'CODE', <<'OUT', 'encoding' );
.sub 'test' :main
    $P0 = new ['FileHandle']

    $P0.'encoding'('utf8')
    $S0 = $P0.'encoding'()
    if $S0 == 'utf8' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = $P1.encoding() # utf8'

.end
CODE
ok 1 - $S0 = $P1.encoding() # utf8
OUT

(undef, $temp_file) = create_tempfile( UNLINK => 1 );

pir_output_is( <<"CODE", <<'OUT', 'encoding - read/write' );
.sub 'test' :main
    \$P0 = new ['FileHandle']
    \$P0.'encoding'('utf8')

    \$P0.'open'('$temp_file', 'w')

    \$P0.'print'(1234567890)
    \$P0.'print'("\\n")
    \$S0 = iso-8859-1:"TÖTSCH"
    \$P0.'print'(\$S0)
    \$P0.'close'()

    \$P1 = new ['FileHandle']
    \$P1.'encoding'('utf8')

    \$P1.'open'('$temp_file')

    .local string line
    line = \$P1.'readline'()
    if line == "1234567890\\n" goto ok_1
print line
    print 'not '
  ok_1:
    say 'ok 1 - \$S1 = \$P1.readline() # read with utf8 encoding on'

    line = \$P1.'readline'()
    if line == \$S0 goto ok_2
print line
    print 'not '
  ok_2:
    say 'ok 2 - \$S2 = \$P1.readline() # read iso-8859-1 string'

    \$P1.'close'()

    \$I1 = encoding line
    \$S2 = encodingname \$I1
    if \$S2 == 'utf8' goto ok_3
    print \$S2
    print 'not '
  ok_3:
    say 'ok 3 # utf8 encoding'

.end
CODE
ok 1 - $S1 = $P1.readline() # read with utf8 encoding on
ok 2 - $S2 = $P1.readline() # read iso-8859-1 string
ok 3 # utf8 encoding
OUT


(undef, $temp_file) = create_tempfile( UNLINK => 1 );

# L<PDD22/I\/O PMC API/=item mode>
pir_output_is( <<'CODE', <<'OUT', 'mode' );
.sub 'test' :main
    $P0 = new ['FileHandle']

    $P0.'open'('README')
    $S0 = $P0.'mode'()

    if $S0 == 'r' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = $P0.mode() # get read mode'

    $P0.'close'()

.end
CODE
ok 1 - $S0 = $P0.mode() # get read mode
OUT

pir_output_is( <<'CODE', <<'OUTPUT', "clone preserves all attributes of filehandle" );
.sub main :main
    .local pmc fh,fh_clone
    .local string line1, line2

    fh = new ['FileHandle']
    fh.'open'('README')

    line1 = fh.'readline'()

    fh_clone = clone fh
    line2 = fh_clone.'readline'()

    $I0 = line1 == line2
    say $I0

    fh_clone.'seek'(0, 0)
    line2 = fh_clone.'readline'()

    $I0 = line1 == line2
    say $I0
.end
CODE
0
1
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "readall - closed filehandle" );
.sub main :main
    \$S0 = <<"EOS"
line 1
line 2
line 3
EOS
    .local pmc pio, pio2
    pio = new ['FileHandle']
    pio.'open'("$temp_file", "w")
    pio.'print'(\$S0)
    pio.'close'()
    pio2 = new ['FileHandle']
    \$S1 = pio2.'readall'('$temp_file')
    if \$S0 == \$S1 goto ok
    print "not "
ok:
    say "ok"
.end
CODE
ok
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "readall() - opened filehandle" );
.sub main :main
    \$S0 = <<"EOS"
line 1
line 2
line 3
EOS
    .local pmc pio, pio2
    pio = new ['FileHandle']
    pio.'open'("$temp_file", "w")
    pio.'print'(\$S0)
    pio.'close'()

    pio2 = new ['FileHandle']
    pio2.'open'("$temp_file", "r")
    \$S1 = pio2.'readall'()
    if \$S0 == \$S1 goto ok
    print "not "
ok:
    say "ok"
.end
CODE
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "readall - failure conditions" );
.include 'except_types.pasm'
.sub main :main
    .local pmc fh, eh
    fh = new ['FileHandle']
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_PIO_ERROR)
    set_label eh, catch1
    push_eh eh
    # Using unopened FileHandle
    fh.'readall'()
    say 'should never happen'
    goto test2
  catch1:
    finalize eh
    say 'caught unopened'
  test2:
    set_label eh, catch2
    fh.'open'('README')
    # Using opened FileHandle with the filepath option
    fh.'readall'('README')
    say 'should never happen'
    goto end
  catch2:
    finalize eh
    say 'caught reopen'
  end:
.end
CODE
caught unopened
caught reopen
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "readall() - utf8 on closed filehandle" );
.sub 'main' :main
    .local pmc ifh
    ifh = new ['FileHandle']
    ifh.'encoding'('utf8')

    \$S0 = ifh.'readall'('$temp_file')

    \$I0 = encoding \$S0
    \$S1 = encodingname \$I0

    say \$S1
.end
CODE
utf8
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "readall() - utf8 on opened filehandle" );
.sub 'main' :main
    .local pmc ifh
    ifh = new ['FileHandle']
    ifh.'encoding'('utf8')
    ifh.'open'('$temp_file')

    \$S0 = ifh.'readall'()

    \$I0 = encoding \$S0
    \$S1 = encodingname \$I0

    say \$S1
.end
CODE
utf8
OUTPUT

pir_output_is( <<'CODE', <<"OUTPUT", "exit status" );
.include 'iglobals.pasm'
.sub 'main' :main
    .local pmc pipe, conf, interp
    .local string cmd

    interp = getinterp
    conf = interp[.IGLOBALS_CONFIG_HASH]

    cmd = '"'

    .local string aux
    aux = conf['build_dir']
    cmd .= aux
    aux = conf['slash']
    cmd .= aux
    aux = conf['test_prog']
    cmd .= aux
    aux = conf['exe']
    cmd .= aux
    cmd .= '"'

    pipe = new ['FileHandle']
    pipe.'open'(cmd, "rp")
    pipe.'readall'()
    pipe.'close'()
    print "expect 0 exit status: "
    $I0 = pipe.'exit_status'()
    say $I0

    cmd .= ' --this_is_not_a_valid_option'
    pipe = new ['FileHandle']
    pipe.'open'(cmd, "rp")
    pipe.'readall'()
    pipe.'close'()
    print "expect 1 exit status: "
    $I0 = pipe.'exit_status'()
    $I0 = $I0 != 0
    say $I0

.end
CODE
expect 0 exit status: 0
expect 1 exit status: 1
OUTPUT

SKIP: {
    skip 'Timely destruction is deprecated. TT#1800' => 1;

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "timely destruction" );
.const string temp_file = '%s'
.sub main :main
    Parrot_interp_info $I0, 2    # GC mark runs
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
        needs_destroy $P0
    print $P0, "a line\n"
    null $P0            # kill it
    # Call dummy sub to cleanup CallContext
    dummy()
    sweep 0            # a lazy GC has to close the PIO
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'r')
    $S0 = $P0.'read'(20)
    print $S0
.end

.sub dummy
.end

CODE
a line
OUTPUT

}

my (undef, $no_such_file) = create_tempfile( UNLINK => 1, OPEN => 0 );

pir_output_is( sprintf( <<'CODE', $no_such_file, $temp_file ), <<'OUTPUT', "get_bool" );
.const string no_such_file = '%s'
.const string temp_file    = '%s'

.sub main :main
    push_eh read_non_existent_file
    $P0 = new ['FileHandle']
    $P0.'open'(no_such_file, 'r')

    print "Huh: '"
    print no_such_file
    print "' exists? - not "
ok1:
    say "ok 1"

    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    $P0.'print'("a line\n")
    $P0.'print'("a line\n")
    $P0.'close'()

    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'r')
    if $P0, ok2
    print "not "
ok2:    say "ok 2"
    $S0 = $P0.'read'(1024)
    $S0 = $P0.'read'(1024)
    unless $P0, ok3
    print "not "
ok3:    say "ok 3"
    defined $I0, $P0
    if $I0, ok4
    print "not "
ok4:    say "ok 4"
    $P0.'close'()
    defined $I0, $P0        # closed file is still defined
    if $I0, ok5
    print "not "
ok5:    say "ok 5"
    unless $P0, ok6        # but false
    print "not "
ok6:    say "ok 6"
    .return ()
read_non_existent_file:
    pop_eh
    branch ok1
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

# FileHandle use file descriptor, get_fd should not return -1
pir_output_is( <<'CODE', <<'OUT', 'get_fd method' );
.sub test :main
    new $P0, ['FileHandle']
    $N0 = $P0.'get_fd'()
    say $N0
.end
CODE
-1
OUT

pir_output_is( <<"CODE", <<'OUT', 'write after buffered read' );
.sub test :main
    .local pmc fh
    .local string str
    .local int pos

    fh = new 'FileHandle'
    fh.'open'('$temp_file', 'rw')

    fh.'print'('abcdefghijklmno')
    fh.'seek'(0, 0)

    fh.'read'(5)
    fh.'print'('#####')

    pos = fh.'tell'()
    say pos

    fh.'seek'(0, 0)
    str = fh.'readall'()
    say str

    fh.'close'()
.end
CODE
10
abcde#####klmno
OUT

pir_output_is( <<"CODE", <<'OUT', 'small reads and seeks' );
.sub test :main
    .local pmc fh
    .local string str
    .local int pos, i

    fh = new 'FileHandle'
    fh.'open'('$temp_file', 'rw')

    i = 0
  print_loop:
    fh.'print'('abc123')
    inc i
    if i < 5000 goto print_loop

    fh.'seek'(1, -24000)

    i = 0
  read_loop:
    str = fh.'read'(3)
    if str == 'abc' goto read_ok
    print 'not '
    goto read_done
  read_ok:
    fh.'seek'(1, 3)
    inc i
    if i < 4000 goto read_loop
  read_done:
    say 'ok 1 - read/seek 3 bytes'

    str = fh.'read'(3)
    if str == '' goto eof_ok
    print 'not '
  eof_ok:
    say 'ok 2 - read/seek eof'

    pos = fh.'tell'()
    if pos == 30000 goto tell_ok
    print 'not '
  tell_ok:
    say 'ok 3 - read/seek tell'

    fh.'close'()
.end
CODE
ok 1 - read/seek 3 bytes
ok 2 - read/seek eof
ok 3 - read/seek tell
OUT

# The code path we want to test here is a bit hard to trigger
pir_output_is( <<"CODE", <<'OUT', 'partial multibyte char in buffer' );
.sub test :main
    .local pmc fh
    .local string str, line
    .local int pos, i

    fh = new 'FileHandle'
    fh.'open'('$temp_file', 'rw')

    # set a buffer size of 6000 and utf8 encoding
    fh.'buffer_size'(6000)
    fh.'encoding'('utf8')

    # write 599 lines, 5990 bytes
    i = 0
  print_loop:
    fh.'print'("123456789\\n")
    inc i
    if i < 599 goto print_loop

    # now write a final line with a utf8 character that will be split
    # across buffers
    line = utf8:"123456789\\x{2022}"
    fh.'print'(line)

    str = read_600_lines(fh)
    i = iseq str, line
    say i

    str = fh.'readline'()
    i = length str
    say i

    # test it again with a different setting

    fh.'seek'(1, -12)
    line = utf8:"12345678\\x{2022}#############\\n"
    fh.'print'(line)
    fh.'print'("####\\n###########\\n")

    str = read_600_lines(fh)
    i = iseq str, line
    say i

    fh.'close'()
.end

.sub read_600_lines
    .param pmc fh
    .local int i
    .local string str

    fh.'seek'(0, 0)

    i = 0
  read_loop:
    str = fh.'readline'()
    inc i
    if i < 600 goto read_loop

    .return (str)
.end
CODE
1
0
1
OUT

# TT #1178
# L<PDD22/I\/O PMC API/=item get_fd>
# NOTES: this is going to be platform dependent

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
