#!perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( lib );

use Cwd 'cwd';

use File::Spec;
use Test::More;

use Parrot::Test::Util 'create_tempfile';
use Parrot::Config;
use Parrot::Test tests => 14;

=head1 NAME

syn/file.t - test inclusion of files

=head1 DESCRIPTION

A test script which is supposed to be called by Test::Harness.

=cut

use 5;

# Do not assume that . is in $PATH
my $PARROT = ".$PConfig{slash}parrot$PConfig{exe}";
my $PERL5  = $PConfig{perl};

my $ended_ok = 0;

#my ($FOO, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', DIR => cwd(), UNLINK => 1 );
my ($FOO, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', UNLINK => 1 );

print $FOO <<'ENDF';
  .macro_const BAR 42
ENDF
close $FOO;

pir_output_is( <<"CODE", <<'OUT', 'include pasm' );
.sub test :main
    say "before"
    .include "$temp_pasm"
    print .BAR
    say "\\nafter"
.end
CODE
before
42
after
OUT

($FOO, $temp_pasm) = create_tempfile( SUFFIX => '.pasm', UNLINK => 1 );

print $FOO <<'ENDF';
  .macro_const BAR 42
ENDF
close $FOO;

pir_output_is( <<"CODE", <<'OUT', 'include pasm (absolute path)' );
.sub test :main
    say "before"
    .include '$temp_pasm'
    say .BAR
    say "after"
.end
CODE
before
42
after
OUT

($FOO, my $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $FOO <<'ENDF';
  .const int BAR = 42
ENDF
close $FOO;

pir_output_is( <<"CODE", <<'OUT', 'include pir' );
.sub test :main
    say "before"
    .include "$temp_pir"
    print BAR
    say "\\nafter"
.end
CODE
before
42
after
OUT

($FOO, my $temp_inc) = create_tempfile( SUFFIX => '.inc', UNLINK => 1 );

print $FOO <<'ENDF';
  .const int BAR = 42
ENDF
close $FOO;

pir_output_is( <<"CODE", <<'OUT', 'include temp.inc' );
.sub test :main
    say "before"
    .include "$temp_inc"
    print BAR
    say "\\nafter"
.end
CODE
before
42
after
OUT

($FOO, $temp_inc) = create_tempfile( SUFFIX => '.inc', UNLINK => 1 );

print $FOO <<'EOF';
.sub _foo       # sub foo(int a, int b)
   .param int a
   .param int b
   print "a = "
   print a
   print "\n"
   print "b = "
   print b
   print "\n"
   .local int pl
   .local int mi
   pl = a + b
   mi = a - b
   .return (pl, mi)
.end
EOF
close $FOO;

pir_output_is( <<"CODE", <<'OUT', 'subroutine in external file' );
.sub test :main
   .local int x
   x = 10
   .const int y = 20

   .local int r
   .local int s
   (r, s) = _foo(x,y)

   print "r = "
   say r
   print "s = "
   say s
.end
.include "$temp_inc"
CODE
a = 10
b = 20
r = 30
s = -10
OUT

# test load_bytecode branches and subs

# write sub2
($FOO, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $FOO <<'ENDF';
.sub _sub2
    say "sub2"
.end
ENDF
close $FOO;

# compile it
(undef, my $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
system_or_die( $PARROT, '-o', $temp_pbc, $temp_pir );

pir_output_is( <<"CODE", <<'OUT', 'call sub in external pbc' );
.sub _sub1
    say "sub1"
    load_bytecode "$temp_pbc"
    say "loaded"
    \$P0 = get_global "_sub2"
    .begin_call
    .call \$P0
    ret:
    .end_call
.end
CODE
sub1
loaded
sub2
OUT

# write sub2
($FOO,  $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
(undef, $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );

print $FOO <<'ENDF';
.sub _sub2
    print "sub2\n"
   .begin_return
   .end_return
.end
ENDF
close $FOO;

# compile it

system_or_die( $PARROT, '-o', $temp_pbc, $temp_pir );

pir_output_is( <<"CODE", <<'OUT', 'call sub in external pbc, return' );
.sub _sub1
    say "sub1"
    load_bytecode "$temp_pbc"
    say "loaded"
    \$P0 = get_global "_sub2"
    .begin_call
    .call \$P0
    ret:
    .end_call
    say "back"
.end
CODE
sub1
loaded
sub2
back
OUT

# write sub2
($FOO,  $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
(undef, $temp_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );

print $FOO <<'ENDF';
.sub _not_sub2
    say "not sub2"
.end

.sub _sub2
    say "sub2"
.end
ENDF
close $FOO;

# compile it
system($PARROT, '-o', $temp_pbc, $temp_pir);

pir_output_is( <<"CODE", <<'OUT', 'call sub in external pbc with 2 subs' );
.sub _sub1
    say "sub1"
    load_bytecode "$temp_pbc"
    say "loaded"
    \$P0 = get_global "_sub2"
    .begin_call
    .call \$P0
    ret:
    .end_call
.end
CODE
sub1
loaded
sub2
OUT

# write sub2
open $FOO, '>', "$temp_pir" or die "Can't write $temp_pir: $!\n";
print $FOO <<'ENDF';
.sub _sub2
    print "sub2\n"
   .begin_return
   .end_return
.end
ENDF
close $FOO;

# compile it

pir_output_is( <<"CODE", <<'OUT', 'call sub in external pir, return' );
.sub _sub1
    say "sub1"
    load_bytecode "$temp_pir"
    say "loaded"
    \$P0 = get_global "_sub2"
    .begin_call
    .call \$P0
    ret:
    .end_call
    say "back"
.end
CODE
sub1
loaded
sub2
back
OUT

pir_output_is( <<'CODE', <<'OUT', 'call internal sub like external' );
.sub _sub1
    print "sub1\n"
    $P0 = get_global "_sub2"
    .begin_call
    .call $P0
    ret:
    .end_call
    print "back\n"
.end

.sub _sub2
    print "sub2\n"
   .begin_return
   .end_return
.end
CODE
sub1
sub2
back
OUT

# write subs
($FOO, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $FOO <<'ENDF';
.sub _sub1
    say "sub1"
    $P0 = get_global "_sub2"
    .begin_call
    .call $P0
    ret:
    .end_call
    say "back"
.end

.sub _sub2
    say "sub2"
    .begin_return
    .end_return
.end
ENDF

close $FOO;

# compile it

system_or_die( $PARROT, '-o', $temp_pbc, $temp_pir );

use Test::More;
is( `$PARROT $temp_pbc`, <<OUT, 'call internal sub like external, precompiled' );
sub1
sub2
back
OUT

{

    # include a non-existent file and catch the error message
    my $err_msg;
    {
        ($FOO, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

        print $FOO <<'END_PIR';
# Including a non-existent file should produce an error
.include "non_existent.pir"
# An error should have been raised
.sub test :main
  # dummy, because a main function is expected
.end
END_PIR
        close $FOO;

        my $OLDERR;
        open $OLDERR, '>&', 'STDERR' or die "Can't save STDERR: $!\n";
        (undef, my $temp_out) = create_tempfile( SUFFIX => '.out', UNLINK => 1 );
        open STDERR, '>', $temp_out or die "Can't write $temp_out: $!\n";
        system( $PARROT, $temp_pir );    # We expect an error here.
        open $FOO, '<', $temp_out or die "Can't read $temp_out: $!\n";
        { local $/; $err_msg = <$FOO>; }
        close $FOO;
        open STDERR, '>&', $OLDERR or die "Can't restore STDERR: $!\n";
    }

    # read a non-existent file and catch the error message
    my $enoent_err_msg;
    {
        open $FOO, '<', 'non_existent.file';
        my $ENOENT = $! + 0;
        open $FOO, '>', $temp_pir or die "Can't write to '$temp_pir': $!\n";

        print $FOO <<"END_PIR";
.sub test \:main
  # run a OS command, and get the errmessge for the exit code
  .local string enoent_err_msg
  err enoent_err_msg, $ENOENT
  print enoent_err_msg
.end
END_PIR
        close $FOO;
        $enoent_err_msg = qx{$PARROT $temp_pir}
    }

    $err_msg =~ s/\r//g if $^O =~ /^(MSWin32|msys)$/i;
    is( $err_msg, << "OUT", 'including a non-existent file' );
error:imcc:$enoent_err_msg
\tin file '$temp_pir' line 1
OUT
}

SKIP:
{
    skip( 'multiple loading not speced - failing', 1 );

    pir_output_is( <<'CODE', <<'OUT', 'twice call sub in external pir, return' );
.sub _sub1
    print "sub1\n"
    load_bytecode "$temp_pir"
    print "loaded\n"
    $P0 = get_global "_sub2"
    .begin_call
    .call $P0
    ret:
    .end_call
    print "back\n"
    print "sub1 again\n"
    load_bytecode "$temp_pir"
    print "loaded again\n"
    $P0 = get_global "_sub2"
    .begin_call
    .call $P0
    ret_again:
    .end_call
    print "back again\n"
.end
CODE
sub1
loaded
sub2
back
sub1 again
loaded again
sub2
back again
OUT
}

my @temp_files;
SKIP:
{
    my $temp_dir = File::Spec->tmpdir();
    my $td2 = File::Spec->catfile( $temp_dir, 'X' );
    substr( $td2, -1, 1, '' );

    for my $file (qw( with_slash without_slash )) {
        push @temp_files, File::Spec->catfile( $temp_dir, "${file}.pir" );

        open( my $out_fh, '>', $temp_files[-1] )
            or skip( "Cannot write temporary file to $temp_files[-1]", 1 );

        print {$out_fh} <<"TEMP_PIR";
.sub $file
    print "$file() called!\\n"
.end
TEMP_PIR
    }

    pir_output_is( <<"CODE", <<'OUT', 'load PIR from added paths, minding slash' );
  .include 'iglobals.pasm'
  .include 'libpaths.pasm'

  .sub main :main
      .local pmc interp
      getinterp interp

      .local pmc lib_paths
      lib_paths = interp[.IGLOBALS_LIB_PATHS]

      .local pmc include_paths
      include_paths = lib_paths[.PARROT_LIB_PATH_LIBRARY]

      unshift include_paths, '$temp_dir'
      load_bytecode 'with_slash.pir'

      .local pmc dummy
      dummy = shift include_paths
      unshift include_paths, '$td2'
      load_bytecode 'without_slash.pir'

      with_slash()
      without_slash()
  .end
CODE
with_slash() called!
without_slash() called!
OUT
}
unlink(@temp_files);
$ended_ok = 1;

exit;

sub system_or_die {
    my @args = @_;

    print "# Running @args\n";
    my $rc = system(@args);
    if ( $rc != 0 ) {
        die "Couldn't run: @args\n";
    }
    print "# Return $rc\n";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
