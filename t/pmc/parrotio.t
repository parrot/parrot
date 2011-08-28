#!perl
# Copyright (C) 2006-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;

=head1 NAME

t/pmc/parrotio.t - test the FileHandle PMC

=head1 SYNOPSIS

    % prove t/pmc/parrotio.t

=head1 DESCRIPTION

Tests the FileHandle PMC.

=cut

# L<PDD22/I\/O PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, ['FileHandle']
    say "ok 1 - $P0 = new ['FileHandle']"
.end
CODE
ok 1 - $P0 = new ['FileHandle']
OUT

# L<PDD22/I\/O PMC API/=item open.*=item close>
pir_output_is( <<'CODE', <<'OUT', 'open and close - synchronous', todo => 'not yet implemented' );
.sub 'test' :main
    $P0 = new ['FileHandle']
    $P0.open('README')
    say 'ok 1 - $P0.open($S1)'

    $P0.close()
    say 'ok 2 - $P0.close()'

    $P0.open('README', 'rw')
    say 'ok 3 - $P0.open($S1, $S2) # rw mode'

    $P0.close()
    $P0.open()
    say 'ok 4 - $P0.open()'

    push_eh eh_bad_file_1
    $P0.open('bad_file')
    pop_eh

  test_5:
    push_eh eh_bad_file_2
    $P0.open('bad_file', 'r')
    pop_eh

  test_6:
    $P0.open('new_file', 'w')
    say 'ok 6 - $P0.open($S1, $S2) # new file, write mode succeeds'

    goto end

  bad_file_1:
    say 'ok 5 - $P0.open($S1)      # with bad file'
    goto test_5
  end:
.end
CODE
ok 1 - $P0.open($S1)
ok 2 - $P0.close()
ok 3 - $P0.open($S1, $S2) # rw mode
ok 4 - $P0.open()
ok 5 - $P0.open($S1)      # with bad file
ok 6 - $P0.open($S1, $S2) # new file, write mode succeeds
OUT

# should be in the PIR code
unlink 'new_file';

SKIP: {
    skip 'no asynch calls yet' => 1;

    pir_output_is( <<'CODE', <<'OUT', 'open and close - asynchronous' );
.sub 'test' :main
    $P1 = # TT #1204 create a callback here
    $P0 = new ['FileHandle']

    $P0.open('README')
    say 'ok 1 - $P0.open($S1)'

    $P0.close()
    say 'ok 2 - $P0.close($P1)'

    $P0.open('README', 'rw')
    say 'ok 3 - $P0.open($S1, $S2)'

    $P0.close()
    $P0.open()
    say 'ok 4 - $P0.open()'

  cleanup:
    $P0.close()
.end
CODE
ok 1 - $P0.open($S1)
ok 2 - $P0.close()
ok 3 - $P0.open($S1, $S2)
ok 4 - $P0.open()
OUT
}

# L<PDD22/I\/O PMC API/=item print.*=item readline>
pir_output_is(
    <<'CODE', <<'OUT', 'print, read, and readline - synchronous', todo => 'not yet implemented' );
.sub 'test' :main
    load_bytecode 'String/Utils.pbc'
    .local pmc chomp
               chomp = get_global ['String';'Utils'], 'chomp'

    $P0 = new ['FileHandle']
    $P0.open('README')

    $S0 = $P0.read(14) # bytes
    if $S0 == 'This is Parrot' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $S0 = $P1.read($I2)'

    $S0 = $P0.read(9)  # bytes
    if $S0 == ', version' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $S0 = $P1.read($I2)     # again on same stream'

    $P0.print(123)
    $P0.print(456.789)
    $P0.print("squawk\n")
    $P1 = new ['Integer']
    $P1 = 42
    $P0.print($P1)
    say 'ok 3 - $P0.print(${I,N,S,P}1)'

    $S0 = $P0.readline()
    $S0 = chomp( $S0 )
    if $S0 == '123456.789000squawk' goto ok_4
    print 'not '
  ok_4:
    say 'ok 4 - $S0 = $P1.readline($I2)'

    $S0 = $P0.readline()
    $S0 = chomp( $S0 )
    if $S0 == '42' goto ok_5
    print 'not '
  ok_5:
    say 'ok 5 - $S0 = $P1.readline($I2) # again on same stream'
.end
CODE
ok 1 - $S0 = $P1.read($I2)
ok 2 - $S0 = $P1.read($I2)     # again on same stream
ok 3 - $P0.print(${I,N,S,P}1)
ok 4 - $S0 = $P1.readline($I2)
ok 5 - $S0 = $P1.readline($I2) # again on same stream
OUT

# TT #1204 test reading long chunks, eof, and across newlines

# TT #1204 pir_output_is( <<'CODE', <<'OUT', 'print, read, and readline - asynchronous', todo => 'not yet implemented' );

# L<PDD22/I\/O PMC API/=item buffer_type>
pir_output_is( <<'CODE', <<'OUT', 'buffer_type', todo => 'not yet implemented' );
.sub 'test' :main
    .include 'io_buffer_types.pasm'

    $P0 = new ['FileHandle']

    $P0.buffer_type('unbuffered')
    $I0 = $P0.buffer_type()
    if $I0 == PIO_NONBUF goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - $I0 = $P1.buffer_type() # PIO_NONBUF'

    $P0.buffer_type(PIO_NONBUF)
    $S0 = $P0.buffer_type()
    if $S0 == 'unbuffered' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - $S0 = $P1.buffer_type() # PIO_NONBUF'

    $P0.buffer_type('line-buffered')
    $I0 = $P0.buffer_type()
    if $I0 == PIO_LINEBUF goto ok_3
    print 'not '
  ok_3:
    say 'ok 3 - $I0 = $P1.buffer_type() # PIO_LINEBUF'

    $P0.buffer_type(PIO_LINEBUF)
    $S0 = $P0.buffer_type()
    if $S0 == 'line-buffered' goto ok_4
    print 'not '
  ok_4:
    say 'ok 4 - $S0 = $P1.buffer_type() # PIO_LINEBUF'

    $P0.buffer_type('full-buffered')
    $I0 = $P0.buffer_type()
    if $I0 == PIO_FULLBUF goto ok_5
    print 'not '
  ok_5:
    say 'ok 5 - $I0 = $P1.buffer_type() # PIO_FULLBUF'

    $P0.buffer_type(PIO_FULLBUF)
    $S0 = $P0.buffer_type()
    if $S0 == 'full-buffered' goto ok_6
    print 'not '
  ok_6:
    say 'ok 6 - $S0 = $P1.buffer_type() # PIO_FULLBUF'
.end
CODE
ok 1 - $I0 = $P1.buffer_type() # PIO_NONBUF
ok 2 - $S0 = $P1.buffer_type() # PIO_NONBUF
ok 3 - $I0 = $P1.buffer_type() # PIO_LINEBUF
ok 4 - $S0 = $P1.buffer_type() # PIO_LINEBUF
ok 5 - $I0 = $P1.buffer_type() # PIO_FULLBUF
ok 6 - $S0 = $P1.buffer_type() # PIO_FULLBUF
OUT

# TT #1204 test effects of buffer_type, not just set/get

# TT #1177
# L<PDD22/I\/O PMC API/=item buffer_size>
# NOTES: try setting positive, zero, negative int
# perform print and read ops
# change buffer size while it contains data
# try with all 'buffer_type' modes

# TT #1178
# L<PDD22/I\/O PMC API/=item get_fd>
# NOTES: this is going to be platform dependent

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
