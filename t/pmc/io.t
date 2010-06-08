#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 36;
use Parrot::Test::Util 'create_tempfile';
use Parrot::Test::Util 'create_tempfile';

=head1 NAME

t/pmc/io.t - IO Ops

=head1 SYNOPSIS

    % prove t/pmc/io.t

=head1 DESCRIPTION

Tests the Parrot IO operations.

=cut

sub file_content_is {
    my ( $file, $content, $name ) = @_;

    # slurp mode
    local $/;

    open my $FOO, '<', $file;

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    is( <$FOO>, $content, $name );

    close $FOO;
}

my (undef, $temp_file) = create_tempfile( UNLINK => 1 );

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "timely destruction", todo => 'TT #1659');
.const string temp_file = '%s'
.sub main :main
    interpinfo $I0, 2    # GC mark runs
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    needs_destroy $P0
    print $P0, "a line\n"
    null $P0            # kill it
    sweep 0            # a lazy GC has to close the PIO
    $P0 = open temp_file, 'r'
    $S0 = $P0.'read'(20)
    print $S0
.end
CODE
a line
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "read on invalid fh should throw exception" );
.sub main :main
    new $P0, ['FileHandle']

    push_eh _readline_handler
    $S0 = $P0.'readline'()
    print "not "

_readline_handler:
        print "ok 1\n"
        pop_eh

    push_eh _read_handler
    $S0 = $P0.'read'(1)
    print "not "

_read_handler:
        print "ok 2\n"
        pop_eh

    push_eh _print_handler
    print $P0, "kill me now\n"
    print "not "

_print_handler:
        print "ok 3\n"
        pop_eh

.end
CODE
ok 1
ok 2
ok 3
OUTPUT

SKIP: {
    skip( "clone not finished yet", 1 );
    pasm_output_is( <<"CODE", <<'OUTPUT', "clone" );
    open P0, "$temp_file", 'r'
    clone P1, P0
    read S0, P1, 1024
    print S0
    end
CODE
a line
OUTPUT
}

(my $FOO, $temp_file) = create_tempfile( UNLINK => 1 );

# It would be very embarrassing if these didnt work...
print $FOO "2\n1\n";
close $FOO;

pir_output_is( sprintf( <<'CODE', $temp_file ), <<'OUTPUT', "open and readline" );
.const string temp_file = '%s'
.sub 'main' :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file)

    $S0 = ''
    $S1 = ''

    $S0 = $P0.'readline'()
    $S1 = $P0.'readline'()

    print $S1
    print $S0
.end
CODE
1
2
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
print $FOO "12\n34";
close $FOO;

pir_output_is( sprintf( <<'CODE', $temp_file ), <<'OUTPUT', "open and readline, no final newline" );
.const string temp_file = '%s'
.sub 'main' :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file)

    $S0 = ''
    $S1 = ''

    $S0 = $P0.'readline'()
    $S1 = $P0.'readline'()

    print $S1
    print $S0
.end
CODE
3412
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
close $FOO;

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "open & print" );
.const string temp_file = '%s'
.sub 'main' :main
    $I0 = -12
    $N0 = 2.2
    $S0 = "Foo"
    $P0 = new ['String']
    $P0 = "Bar\n"

    $P1 = new ['FileHandle']
    $P1.'open'(temp_file, 'w')
    $P1.'print'($I0)
    $P1.'print'($N0)
    $P1.'print'($S0)
    $P1.'print'($P0)
    $P1.'close'()

    $P2 = new ['FileHandle']
    $P2.'open'(temp_file)
    $S1 = $P2.'readline'()
    $P2.'close'()

    print $S1
.end
CODE
-122.2FooBar
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
close $FOO;

# write to file opened for reading
pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "3-arg open" );
.const string temp_file = '%s'
.sub 'main' :main
    $P1 = new ['FileHandle']
    $P1.'open'(temp_file, 'w')
    $P1.'print'("Foobar\n")
    $P1.'close'()

    push_eh _print_to_read_only

    $P2 = new ['FileHandle']
    $P2.'open'(temp_file, 'r')
    $P2.'print'("baz\n")
    say "skipped"

  _print_to_read_only:
    say "caught writing to file opened for reading"
    pop_eh

    $P2.'close'()

    $P3 = new ['FileHandle']
    $P3.'open'(temp_file, 'r')
    $S1 = $P3.'readline'()
    $P3.'close'()
    print $S1
.end
CODE
caught writing to file opened for reading
Foobar
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', 'open and close' );
.const string temp_file = '%s'
.sub 'main' :main
    $P1 = new ['FileHandle']
    $P1.'open'(temp_file, "w")
    $P1.'print'("Hello, World!\n")
    $P1.'close'()
    say "done"
.end
CODE
done
OUTPUT

file_content_is( $temp_file, <<'OUTPUT', 'file contents' );
Hello, World!
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), '', 'append' );
.const string temp_file = '%s'
.sub 'main' :main
    $P1 = new ['FileHandle']
    $P1.'open'(temp_file, 'wa')
    $P1.'print'("Parrot flies\n")
    $P1.'close'()
.end
CODE

file_content_is( $temp_file, <<'OUTPUT', 'append file contents' );
Hello, World!
Parrot flies
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), '', 'write to file' );
.const string temp_file = '%s'
.sub 'main' :main
    $P1 = new ['FileHandle']
    $P1.'open'(temp_file, 'w')
    $P1.'print'("Parrot overwrites\n")
    $P1.'close'()
.end
CODE

file_content_is( $temp_file, <<'OUTPUT', 'file contents' );
Parrot overwrites
OUTPUT

pir_output_is( <<"CODE", '', "Parrot_io_flush on buffer full" );
.sub "main"
   set \$I0, 0
   set \$I1, 10000

   new \$P0, ['FileHandle']
   \$P0.'open'("$temp_file", 'w')

PRINT:
   ge \$I0, \$I1, END
   print \$P0, "words\\n"
   inc \$I0
   branch PRINT

END:
   \$P0.'close'()
.end
CODE

file_content_is( $temp_file, <<'OUTPUT' x 10000, 'buffered file contents' );
words
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "turn off buffering" );
.const string temp_file = '%s'

.sub main :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')

#   set buffer type
    $P0.'buffer_type'('unbuffered')

#   get buffer type
    $S0 = $P0.'buffer_type'()
    print $S0
    print "\n"

    print $P0, "Howdy World\n"

    $P0.'close'()
    end
.end
CODE
unbuffered
OUTPUT

file_content_is( $temp_file, <<'OUTPUT', 'unbuffered file contents' );
Howdy World
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', 'I/O buffering' );
.const string temp_file = '%s'

.sub main
    .local string filename
    filename = temp_file
    $P1 = new ['FileHandle']
    $P1.'open'(filename, 'w')
    .local int count, max, nltest
    count = 0
    max = 10000
  LOOP:
    if count > max goto DONE
    $S1 = count
    $S1 = concat $S1, " "
    print $P1, $S1
    inc count
    nltest = mod count, 20
    if nltest goto LOOP
    print $P1, "\n"
    goto LOOP
  DONE:
    print $P1, "\n"
    $P1.'close'()

  PART_2:
    $P1 = new ['FileHandle']
    $P1.'open'(filename)
    $I0 = 0
  LINE:
    $S1 = $P1.'readline'()
    unless $S1 goto SUCCESS
    $S1 = chopn $S1, 1

  NEXT_NR:
    $I1 = length $S1
    if $I1 <= 1 goto LINE
    $S2 = ""
  SPLIT:
    $S3 = substr $S1, 0, 1
    $S1 = replace $S1, 0, 1, ""
    if $S3 == " " goto GOT_NR
    $S2 = concat $S2, $S3
    goto SPLIT
  GOT_NR:
    $I1 = $S2
    if $I0 != $I1 goto FAILED
    inc $I0
    goto NEXT_NR

  FAILED:
    say "Failed"
    goto EXIT
  SUCCESS:
    say "Successful"
  EXIT:
    end
.end
CODE
Successful
OUTPUT

# TT #1178
pir_output_is( <<'CODE', <<'OUT', 'standard file descriptors' );
.include 'stdio.pasm'
.sub main :main
    $P99 = getinterp
    $P0  = $P99.'stdhandle'(.PIO_STDIN_FILENO)
    $I0  = $P0.'get_fd'()
    # I0 is 0 on Unix and non-Null on stdio and win32
    print "ok 1\n"

    $P1 = $P99.'stdhandle'(.PIO_STDOUT_FILENO)
    $I1 = $P1.'get_fd'()
    if $I1, OK_2
    print "not "
OK_2:
    say "ok 2"
    $P2 = $P99.'stdhandle'(.PIO_STDERR_FILENO)
    $I2 = $P2.'get_fd'()
    if $I2, OK_3
    print "not "
OK_3:
    say "ok 3"
.end
CODE
ok 1
ok 2
ok 3
OUT

pir_output_is( <<'CODE', <<'OUTPUT', 'puts method' );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P2 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    can $I0, $P2, "puts"
    if $I0, ok1
    print "not "
ok1:   print "ok 1\n"
    set_args "0,0", $P2, "ok 2\n"
    callmethodcc $P2, "puts"
.end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'puts method - PIR' );
.include 'stdio.pasm'
.sub main :main
   .local string s
   s = "ok 2\n"
   .local pmc io
   $P0 = getinterp
   io = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
   $I0 = can io, "puts"
   if $I0 goto ok1
   print "not "
ok1:   print "ok 1\n"
   io."puts"(s)
.end

CODE
ok 1
ok 2
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', 'callmethod puts' );
.include 'stdio.pasm'
    getinterp P0                 # invocant
    set I0, .PIO_STDERR_FILENO   # 1st argument
    set_args "0,0", P0, I0
    callmethodcc P0, "stdhandle"
    get_results "0", P2          # STDERR

    set S0, "puts"               # method
    set S5, "ok 1\n"             # 2nd param
    set_args "0,0", P2, S5
    callmethodcc P2, S0

    set S5, "ok 2\n"
    set_args "0,0", P2, S5
    callmethodcc P2, S0

    end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', 'seek/tell' );
.const string temp_file = '%s'
.sub 'main' :main
    $P0 = new ['FileHandle']

    $P0.'open'(temp_file, 'w')
    $P0.'print'("Hello ")
    $I0 = $P0.'tell'()
    $P0.'print'("World!")
    $P0.'seek'(0, $I0)
    $P0.'print'("Parrot!\n")
    $P0.'close'()
    say "ok 1"

    $P0.'open'(temp_file, 'r')
    $S0 = $P0.'read'(65635)
    print $S0
.end
CODE
ok 1
Hello Parrot!
OUTPUT

pir_error_output_like( sprintf(<<'CODE', $temp_file), <<'OUTPUT', '32bit seek: exception' );
.const string temp_file = '%s'
.sub main :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    $P0.'seek'(-1, 0)
    say "error!"
.end
CODE
/seek failed/
OUTPUT

pasm_error_output_like( <<"CODE", <<'OUTPUT', '32bit seek: exception (ops)' );
.loadlib 'io_ops'
   open P0, "$temp_file", 'w'
   seek P0, -1, 0
   say "error!"
   end
CODE
/seek failed \(32bit\)/
OUTPUT

pir_error_output_like( sprintf(<<'CODE', $temp_file), <<'OUTPUT', '64bit seek: exception' );
.const string temp_file = '%s'
.sub main :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    $P0.'seek'(-1, -1, 0)
    say "error!"
.end
CODE
/seek failed/
OUTPUT

pasm_error_output_like( <<"CODE", <<'OUTPUT', '64bit seek: exception (ops)' );
.loadlib 'io_ops'
   open P0, "$temp_file", 'w'
   seek P0, -1, -1, 0
   say "error!"
   end
CODE
/seek failed \(64bit\)/
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "peek" );
.const string temp_file = '%s'
.sub main :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    print $P0, "a line\n"
    $P0.'close'()

    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'r')
    $S0 = $P0.'peek'()
    print $S0
    $S1 = $P0.'peek'()
    print $S1
    print "\n"
    $S2 = $P0.'read'(2)
    $S3 = $P0.'peek'()
    print $S3
    print "\n"
.end
CODE
aa
l
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "peek (ops)" );
.loadlib 'io_ops'
    open P0, "$temp_file", 'w'
    print P0, "a line\\n"
    close P0
    open P0, "$temp_file", 'r'
    peek S0, P0
    print S0
    peek S1, P0
    print S1
    print "\\n"
    read S2, P0, 2
    peek S3, P0
    print S3
    print "\\n"
    end
CODE
aa
l
OUTPUT

pir_output_is( sprintf(<<'CODE', $temp_file), <<'OUTPUT', "peek on an empty file" );
.const string temp_file = '%s'
.sub main :main
    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'w')
    $P0.'close'()

    $P0 = new ['FileHandle']
    $P0.'open'(temp_file, 'r')
    $S0 = $P0.'peek'()
    eq $S0, "", OK1
    print "not "
OK1:
    say "ok 1"
.end
CODE
ok 1
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "peek on an empty file (ops)" );
.loadlib 'io_ops'
    open P0, "$temp_file", 'w'
    close P0
    open P0, "$temp_file", 'r'
    peek S0, P0
    eq S0, "", OK1
    print "not "
OK1:
    say "ok 1"
    end
CODE
ok 1
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "substr after reading from file" );
.sub _main
    # Write something into a file
    .local pmc out
    out = new ['FileHandle']
    out.'open'("$temp_file", 'w')
    print out, "0123456789\\n"
    out.'close'()

    # read file contents back in
    .local pmc in
    in = new ['FileHandle']
    in.'open'("$temp_file", 'r')
    .local string from_file
    from_file = in.'read'(20)

    # Extract part of the read in file
    .local string head_from_file
    head_from_file = substr from_file, 0, 5
    say head_from_file

    end
.end
CODE
01234
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "multiple substr after reading from file" );

.sub _main
    # Write something into a file
    .local pmc out
    out = new ['FileHandle']
    out.'open'("$temp_file", 'w')
    print out, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ\\n"
    out.'close'()

    .local pmc in
    .local string line
    in = new ['FileHandle']
    in.'open'('$temp_file', 'r')
    line = in.'read'(50000)
    in.'close'()

    .local string sub_1
    sub_1 = ''
    .local string sub_2
    sub_2 = ''
    .local string sub_3
    sub_3 = ''
    substr sub_1, line, 0, 3
    substr sub_2, line, 3, 3
    line = replace line, 0, 6, ''
    print "line: "
    print line
    print "sub_1: "
    say sub_1
    print "sub_2: "
    say sub_2
  end
.end
CODE
line: 6789ABCDEFGHIJKLMNOPQRSTUVWXYZ
sub_1: 012
sub_2: 345
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );

print $FOO "T\xc3\xb6tsch\n";
close $FOO;

pir_output_is( sprintf(<<'CODE', $temp_file), <<"OUTPUT", "utf8 read enabled, read parts" );
.const string temp_file = '%s'
.sub main :main
    .local pmc pio
    pio = new ['FileHandle']
    pio.'open'(temp_file, 'r')
    pio.'encoding'("utf8")
    $S0 = pio.'read'(2)
    $S1 = pio.'read'(1024) # read the rest of the file (much shorter than 1K)
    $S0 .= $S1
    pio.'close'()
    $I1 = charset $S0
    $S2 = charsetname $I1
    say $S2

    $I1 = encoding $S0
    $S2 = encodingname $I1
    say $S2

    $I1 = find_charset 'iso-8859-1'
    trans_charset $S1, $S0, $I1
    print $S1
.end
CODE
unicode
utf8
T\xf6tsch
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "PIO.readall() - classmeth" );
.sub main :main
    \$S0 = <<"EOS"
line 1
line 2
line 3
EOS
    .local pmc pio, cl
    pio = new ['FileHandle']
    pio.'open'("$temp_file", 'w')
    print pio, \$S0
    pio.'close'()
    cl = new ['FileHandle']
    \$S1 = cl.'readall'('$temp_file')
    if \$S0 == \$S1 goto ok
    print "not "
ok:
    say "ok"
.end
CODE
ok
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "PIO.readall() - object" );
.sub main :main
    \$S0 = <<"EOS"
line 1
line 2
line 3
EOS
    .local pmc pio, pio2
    pio = new ['FileHandle']
    pio.'open'("$temp_file", 'w')
    print pio, \$S0
    pio.'close'()

    pio2 = new ['FileHandle']
    pio2.'open'("$temp_file", 'r')
    \$S1 = pio2.'readall'()
    if \$S0 == \$S1 goto ok
    print "not "
ok:
    say "ok"
.end
CODE
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
