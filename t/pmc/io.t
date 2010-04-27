#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 41;
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

pasm_output_is( <<"CODE", <<'OUTPUT', "open/close" );
    open P0, "$temp_file", 'w'
    print P0, "a line\\n"
    close P0
    open P0, "$temp_file", 'r'
    read S0, P0, 20
    print S0
    end
CODE
a line
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "timely destruction" );
    interpinfo I0, 2    # GC mark runs
    open P0, "$temp_file", 'w'
        needs_destroy P0
    print P0, "a line\\n"
    null P0            # kill it
    sweep 0            # a lazy GC has to close the PIO
    open P0, "$temp_file", 'r'
    read S0, P0, 20
    print S0
    end
CODE
a line
OUTPUT

# TT #1178
pir_output_is( <<'CODE', <<'OUTPUT', "get_fd()/fdopen" );
.sub main :main
    getstdout $P0
    $I0 = $P0.'get_fd'()
    fdopen $P1, $I0, 'w'
    defined $I0, $P1
    unless $I0, nok
    print $P1, "ok\n"
    close $P1
    end
nok:
    print "fdopen failed\n"
.end
CODE
ok
OUTPUT

# TT #1178
pir_output_is( <<'CODE', <<'OUTPUT', 'fdopen - no close' );
.sub main :main
    getstdout $P0
    $I0 = $P0.'get_fd'()
    fdopen $P1, $I0, 'w'
    defined $I0, $P1
    unless $I0, nok
    print $P1, "ok\n"
    end
nok:
    print "fdopen failed\n"
.end
CODE
ok
OUTPUT

my (undef, $no_such_file) = create_tempfile( UNLINK => 1, OPEN => 0 );

pasm_output_is( <<"CODE", <<'OUTPUT', "get_bool" );
    push_eh read_non_existent_file
    open P0, "$no_such_file", 'r'

    print "Huh: '$no_such_file' exists? - not "
ok1:
    say "ok 1"

    open P0, "$temp_file", 'w'
    print P0, "a line\\n"
    print P0, "a line\\n"
    close P0

    open P0, "$temp_file", 'r'
    if P0, ok2
    print "not "
ok2:    say "ok 2"
    read S0, P0, 1024
    read S0, P0, 1024
    unless P0, ok3
    print "not "
ok3:    say "ok 3"
    defined I0, P0
    if I0, ok4
    print "not "
ok4:    say "ok 4"
    close P0
    defined I0, P0        # closed file is still defined
    if I0, ok5
    print "not "
ok5:    say "ok 5"
    unless P0, ok6        # but false
    print "not "
ok6:    say "ok 6"
    end
read_non_existent_file:
    pop_eh
    branch ok1
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "read on invalid fh should throw exception" );
    new P0, ['FileHandle']

    push_eh _readline_handler
    readline S0, P0
    print "not "

_readline_handler:
        print "ok 1\\n"
        pop_eh

    push_eh _read_handler
    read S0, P0, 1
    print "not "

_read_handler:
        print "ok 2\\n"
        pop_eh

    push_eh _print_handler
    print P0, "kill me now\\n"
    print "not "

_print_handler:
        print "ok 3\\n"
        pop_eh

    end
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

pasm_output_is( <<"CODE", <<'OUTPUT', "open and readline" );
    open P0, "$temp_file"
    set S0, ""
    set S1, ""
    readline S0, P0
    readline S1, P0
    print S1
    print S0
    end
CODE
1
2
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
print $FOO "12\n34";
close $FOO;

pasm_output_is( <<"CODE", <<'OUTPUT', "open and readline, no final newline" );
    open P0, "$temp_file"
    set S0, ""
    set S1, ""
    readline S0, P0
    readline S1, P0
    print S1
    print S0
    end
CODE
3412
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
close $FOO;

pasm_output_is( <<"CODE", <<'OUTPUT', "open & print" );
   set I0, -12
   set N0, 2.2
   set S0, "Foo"
   new P0, ['String']
   set P0, "Bar\\n"

   open P1, "$temp_file", "w"
   print P1, I0
   print P1, N0
   print P1, S0
   print P1, P0
   close P1

   open P2, "$temp_file"
   readline S1, P2
   close P2

   print S1
   end
CODE
-122.2FooBar
OUTPUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );
close $FOO;

# write to file opened for reading
pasm_output_is( <<"CODE", <<'OUTPUT', "3-arg open" );
   open P1, "$temp_file", 'w'
   print P1, "Foobar\\n"
   close P1

   push_eh _print_to_read_only

   open P2, "$temp_file", 'r'
   print P2, "baz\\n"
   say "skipped"

_print_to_read_only:
   say "caught writing to file opened for reading"
   pop_eh

   close P2

   open P3, "$temp_file", 'r'
   readline S1, P3
   close P3
   print S1


   end
CODE
caught writing to file opened for reading
Foobar
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', 'open and close' );
   open P1, "$temp_file", "w"
   print P1, "Hello, World!\\n"
   close P1
   say "done"
   end
CODE
done
OUTPUT

file_content_is( $temp_file, <<'OUTPUT', 'file contents' );
Hello, World!
OUTPUT

pasm_output_is( <<"CODE", '', 'append' );
   open P1, "$temp_file", 'wa'
   print P1, "Parrot flies\\n"
   close P1
   end
CODE

file_content_is( $temp_file, <<'OUTPUT', 'append file contents' );
Hello, World!
Parrot flies
OUTPUT

pasm_output_is( <<"CODE", '', 'write to file' );
   open P1, "$temp_file", 'w'
   print P1, "Parrot overwrites\\n"
   close P1
   end
CODE

file_content_is( $temp_file, <<'OUTPUT', 'file contents' );
Parrot overwrites
OUTPUT

pasm_output_is( <<"CODE", '', "Parrot_io_flush on buffer full" );
   set I0, 0
   set I1, 10000

   open P0, "$temp_file", 'w'

PRINT:
   ge I0, I1, END
   print P0, "words\\n"
   inc I0
   branch PRINT

END:
   close P0
   end
CODE

file_content_is( $temp_file, <<'OUTPUT' x 10000, 'buffered file contents' );
words
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "turn off buffering" );
.sub main :main
   open \$P0, "$temp_file", 'w'

#  set buffer type
   \$P0.'buffer_type'('unbuffered')

#  get buffer type
   \$S0 = \$P0.'buffer_type'()
   print \$S0
   print "\\n"

   print \$P0, "Howdy World\\n"

   close \$P0
   end
.end
CODE
unbuffered
OUTPUT

file_content_is( $temp_file, <<'OUTPUT', 'unbuffered file contents' );
Howdy World
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', 'I/O buffering' );
.sub main
    .local string filename
    filename = "$temp_file"
    \$P1 = open filename, 'w'
    .local int count, max, nltest
    count = 0
    max = 10000
  LOOP:
    if count > max goto DONE
    \$S1 = count
    \$S1 = concat \$S1, " "
    print \$P1, \$S1
    inc count
    nltest = mod count, 20
    if nltest goto LOOP
    print \$P1, "\\n"
    goto LOOP
  DONE:
    print \$P1, "\\n"
    close \$P1

  PART_2:
    \$P1 = open filename
    \$I0 = 0
  LINE:
    \$S1 = readline \$P1
    unless \$S1 goto SUCCESS
    \$S1 = chopn \$S1, 1

  NEXT_NR:
    \$I1 = length \$S1
    if \$I1 <= 1 goto LINE
    \$S2 = ""
  SPLIT:
    \$S3 = substr \$S1, 0, 1
    \$S1 = replace \$S1, 0, 1, ""
    if \$S3 == " " goto GOT_NR
    \$S2 = concat \$S2, \$S3
    goto SPLIT
  GOT_NR:
    \$I1 = \$S2
    if \$I0 != \$I1 goto FAILED
    inc \$I0
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
.sub main :main
    getstdin $P0
    $I0 = $P0.'get_fd'()
    # I0 is 0 on Unix and non-Null on stdio and win32
    print "ok 1\n"
    getstdout $P1
    $I1 = $P1.'get_fd'()
    if $I1, OK_2
    print "not "
OK_2:
    say "ok 2"
    getstderr $P2
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

pasm_output_is( <<'CODE', <<'OUTPUT', 'printerr' );
   new P0, ['String']
   set P0, "This is a test\n"
   printerr 10
   printerr "\n"
   printerr 1.0
   printerr "\n"
   printerr "foo"
   printerr "\n"
   printerr P0
   end
CODE
10
1
foo
This is a test
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', 'puts method' );
   getstdout P2
   can I0, P2, "puts"
   if I0, ok1
   print "not "
ok1:   print "ok 1\n"
   set_args "0,0", P2, "ok 2\n"
   callmethodcc P2, "puts"
   end
CODE
ok 1
ok 2
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', 'puts method - PIR' );

.sub main :main
   .local string s
   s = "ok 2\n"
   .local pmc io
   io = getstdout
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
   getstderr P2    # the object
   set S0, "puts"    # method
   set S5, "ok 1\n"    # 2nd param
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

pasm_output_is( <<"CODE", <<'OUTPUT', 'seek/tell' );
   open P0, "$temp_file", 'w'
   print P0, "Hello "
   tell I0, P0
   print P0, "World!"
   seek P0, I0, 0
   print P0, "Parrot!\\n"
   close P0
   say "ok 1"
   open P0, "$temp_file", 'r'
   read S0, P0, 65635
   print S0
   end
CODE
ok 1
Hello Parrot!
OUTPUT

pasm_error_output_like( <<"CODE", <<'OUTPUT', '32bit seek: exception' );
   open P0, "$temp_file", 'w'
   seek P0, -1, 0
   say "error!"
   end
CODE
/seek failed \(32bit\)/
OUTPUT

pasm_error_output_like( <<"CODE", <<'OUTPUT', '64bit seek: exception' );
   open P0, "$temp_file", 'w'
   seek P0, -1, -1, 0
   say "error!"
   end
CODE
/seek failed \(64bit\)/
OUTPUT

pasm_output_is( <<"CODE", <<'OUTPUT', "peek" );
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

pasm_output_is( <<"CODE", <<'OUTPUT', "peek on an empty file" );
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
    out = open "$temp_file", 'w'
    print out, "0123456789\\n"
    close out

    # read file contents back in
    .local pmc in
    in = open "$temp_file", 'r'
    .local string from_file
    from_file = read in, 20

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
    out = open "$temp_file", 'w'
    print out, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ\\n"
    close out

    .local pmc in
    .local string line
    in = open '$temp_file', 'r'
    line = read in, 50000
    close in

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

pir_error_output_like( <<'CODE', <<'OUT', 'read on null PMC throws exception');
.sub main :main
    null $P1
    $S0 = read $P1, 1
    end
.end
CODE
/read from null/
OUT

($FOO, $temp_file) = create_tempfile( UNLINK => 1 );

print $FOO "T\xc3\xb6tsch\n";
close $FOO;

pir_output_is( <<"CODE", <<"OUTPUT", "utf8 read enabled" );
.sub main :main
    .local pmc pio
    .local int len
    .include "stat.pasm"
    .local string f
    f = '$temp_file'
    len = stat f, .STAT_FILESIZE
    pio = open f, 'r'
    pio.'encoding'("utf8")
    \$S0 = read pio, len
    close pio
    \$I1 = charset \$S0
    \$S2 = charsetname \$I1
    say \$S2

    \$I1 = encoding \$S0
    \$S2 = encodingname \$I1
    say \$S2

    \$I1 = find_charset 'iso-8859-1'
    trans_charset \$S1, \$S0, \$I1
    print \$S1
.end
CODE
unicode
utf8
T\xf6tsch
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "utf8 read enabled - readline" );
.sub main :main
    .local pmc pio
    .local string f
    f = '$temp_file'
    pio = open f, 'r'
    pio.'encoding'("utf8")
    \$S0 = readline pio
    close pio
    \$I1 = charset \$S0
    \$S2 = charsetname \$I1
    say \$S2

    \$I1 = encoding \$S0
    \$S2 = encodingname \$I1
    say \$S2

    \$I1 = find_charset 'iso-8859-1'
    trans_charset \$S1, \$S0, \$I1
    print \$S1
.end
CODE
unicode
utf8
T\xf6tsch
OUTPUT

pir_output_is( <<"CODE", <<"OUTPUT", "utf8 read enabled, read parts" );
.sub main :main
    .local pmc pio
    .local int len
    .include "stat.pasm"
    .local string f
    f = '$temp_file'
    len = stat f, .STAT_FILESIZE
    pio = open f, 'r'
    pio.'encoding'("utf8")
    \$S0 = read pio, 2
    len -= 2
    \$S1 = read pio, len
    \$S0 .= \$S1
    close pio
    \$I1 = charset \$S0
    \$S2 = charsetname \$I1
    say \$S2

    \$I1 = encoding \$S0
    \$S2 = encodingname \$I1
    say \$S2

    \$I1 = find_charset 'iso-8859-1'
    trans_charset \$S1, \$S0, \$I1
    print \$S1
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
    pio = open    "$temp_file", 'w'
    print pio, \$S0
    close pio
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
    pio = open    "$temp_file", 'w'
    print pio, \$S0
    close pio
    pio2 = open    "$temp_file", 'r'
    \$S1 = pio2.'readall'()
    if \$S0 == \$S1 goto ok
    print "not "
ok:
    say "ok"
.end
CODE
ok
OUTPUT

pir_error_output_like( <<'CODE', <<"OUTPUT", "stat failed" );
.sub main :main
    .local pmc pio
    .local int len
    .include "stat.pasm"
    .local string f
    f = 'no_such_file'
    len = stat f, .STAT_FILESIZE
    print "never\n"
.end
CODE
/stat failed:/
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
