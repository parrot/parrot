#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 32;
use Carp;
use Cwd;
use File::Basename qw(basename dirname);
use File::Temp 0.13 qw/ tempfile /;
use File::Spec;
use lib qw( . lib ../lib ../../lib );
use Parrot::IO::Capture::Mini;
use Tie::Filehandle::Preempt::Stdin;

BEGIN { use_ok('Parrot::Configure::Step'); }

Parrot::Configure::Step->import(@Parrot::Configure::Step::EXPORT_OK);

can_ok( __PACKAGE__, @Parrot::Configure::Step::EXPORT_OK );

# RT#44455 add verbose tests with some Test::Warn like mechanism

my $cwd = cwd();
my (@prompts, $object, $cc, $nonexistent, $command);

# integrate()

is( integrate( undef, undef ), undef, "integrate(undef, undef)" );
is( integrate( undef, 1 ),     1,     "integrate(undef, 1)" );
is( integrate( 1,     undef ), 1,     "integrate(1, undef)" );
is( integrate( 1,     2 ),     2,     "integrate(1, 1)" );
is( integrate( 1, q{ }), 1, 'integrate(1, [empty string])' );

# prompt()
# Tests in t/configure/1??-inter-*.t do a good job of testing prompt().
# They leave only one condition to be tested here.

@prompts = ( q{} );
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok('Tie::Filehandle::Preempt::Stdin', ('READLINE'));
isa_ok($object, 'Tie::Filehandle::Preempt::Stdin');
$cc = q{gcc-3.3};
{
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    my $rv = prompt( "What C compiler do you want to use?", $cc );
    my @lines = $tie_out->READLINE;
    ok(@lines, "prompts were captured");
    is($rv, $cc, "Empty response to prompt led to expected return value");
}
$object = undef;
untie *STDIN;
untie *STDOUT;

# file_checksum(), not exported

$nonexistent = q{foobar};
eval {
    my $sum = Parrot::Configure::Step::file_checksum($nonexistent);
};
like($@, qr/Can't open $nonexistent/, #'
    "Got expected error message when trying to get checksum on non-existent file");

{
    my ( $tmpfile, $fname ) = tempfile( UNLINK => 1 );
    print $tmpfile "foo" x 1000;
    $tmpfile->flush;
    is( Parrot::Configure::Step::file_checksum($fname),
        '324000', "file_checksum() returns correct checksum" );
}

{
    my ( $tmpfile, $fname ) = tempfile( UNLINK => 1 );
    my $str = 'Do not print this line';
    print $tmpfile "foo" x 500;
    print $tmpfile "\n";
    print $tmpfile "$str\n";
    print $tmpfile "foo" x 500;
    $tmpfile->flush;
    my $ignore_pattern = qr/$str/;
    my $csum = Parrot::Configure::Step::file_checksum(
        $fname, $ignore_pattern
    );
    is( $csum, '324010', "file_checksum() returns correct checksum" );
}

# copy_if_diff()

{
    my ( $fromfile, $fromfname ) = tempfile( UNLINK => 1 );
    my ( $tofile,   $tofname )   = tempfile( UNLINK => 1 );
    print $fromfile "foo" x 1000;
    $fromfile->flush;

    ok( copy_if_diff( $fromfname, $tofname ),
        "copy_if_diff() true return status" );
    is( Parrot::Configure::Step::file_checksum($tofname),
        '324000', "copy_if_diff() copied differing files" );
}

{
    my ( $fromfile, $fromfname ) = tempfile( UNLINK => 1 );
    my ( $tofile,   $tofname )   = tempfile( UNLINK => 1 );
    print $fromfile "foo" x 1000;
    $fromfile->flush;
    print $tofile "foo" x 1000;
    $tofile->flush;

    ok (! defined(copy_if_diff( $fromfname, $tofname )),
        "copy_if_diff() true return undef" );
}

# move_if_diff()

{
    my ( $fromfile, $fromfname ) = tempfile( UNLINK => 1 );
    my ( $tofile,   $tofname )   = tempfile( UNLINK => 1 );
    print $fromfile "foo" x 1000;
    $fromfile->close;
    $tofile->close;

    # redirect STDERR to avoid warnings
    my $redir = File::Spec->devnull;

    # copy file descriptors
    open *OLDERR, ">&", "STDERR";
    $fromfile->close();
    $tofile->close();

    ok( move_if_diff( $fromfname, $tofname ),
        "move_if_diff() true return status" );
    ok( !-e $fromfname, "move_if_diff() moved differing file" );

    # redirect STDERR for the test below
    close *STDERR;
    open *STDERR, '<', $redir;

    ok( -e $tofname, "move_if_diff() moved differing file" );

    # restore STDERR
    close *STDERR;
    open *STDERR, ">&", "OLDERR";
    close *OLDERR;
}

# cc_gen()

# cc_build()

# cc_run()

# cc_run_capture()

# cc_clean()

# capture_output()

# check_progs()

{
    my %tf_params = ( UNLINK => 1, );
    $tf_params{SUFFIX} = '.exe' if 'MSWin32' eq $^O;
    my ( $tmpfile, $fname ) = tempfile(%tf_params);

    local $ENV{PATH} = dirname($fname);
    chmod 0777, $fname;
    my $prog = basename($fname);

    is( check_progs($prog), $prog, "check_progs() returns the proper program" )
}

{
    my %tf_params = ( UNLINK => 1, );
    $tf_params{SUFFIX} = '.exe' if 'MSWin32' eq $^O;
    my ( $tmpfile, $fname ) = tempfile(%tf_params);

    local $ENV{PATH} = dirname($fname);
    chmod 0777, $fname;
    my $prog = basename($fname);

    is( check_progs( [$prog] ),
        $prog, "check_progs() returns the proper program when passed an array ref" )
}

{
    my $cmd = 'someboguscommand';
    ok( !check_progs( [$cmd] ), "check_progs() returns undef in scalar context on failure" );
    ok( !check_progs($cmd), "check_progs() returns undef in scalar context on failure" );
    is_deeply( [ check_progs( [$cmd] ) ],
        [], "check_progs() returns () in list context on failure" );
    is_deeply( [ check_progs($cmd) ], [], "check_progs() returns () in list context on failure" );
}

{
    my %tf_params = ( UNLINK => 1, );
    $tf_params{SUFFIX} = '.exe' if 'MSWin32' eq $^O;
    my ( $tmpfile, $fname ) = tempfile(%tf_params);

    local $ENV{PATH} = dirname($fname);
    chmod 0777, $fname;
    my $prog = basename($fname);

    my $verbose = 1;
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    is( check_progs($prog, $verbose), $prog,
        "check_progs() returns the proper program" );
    my $line = $tie_out->READLINE;
    like($line, qr/checking for program/,
        "Got expected verbose output");
}
untie *STDOUT;

{
    my $verbose = 1;
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    my $prog = check_progs(
        ['gmake', 'mingw32-make', 'nmake', 'make'],
        $verbose,
    );
    ok( defined( $prog ),"check_progs() returned a 'make' program" );
    my @lines = $tie_out->READLINE;
    my $line = join "\n", @lines;
    like($line, qr/checking for program/s,
        "Got expected verbose output");
    like($line, qr/$prog is executable/s,
        "Got expected verbose output for executable program");
}
untie *STDOUT;

# _slurp(), not exported

{
    my ( $tmpfile, $fname ) = tempfile( UNLINK => 1 );
    print $tmpfile "foo" x 1000;
    $tmpfile->flush;
    is( Parrot::Configure::Step::_slurp($fname), "foo" x 1000, "_slurp() slurped the file" );
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/033_step.t - tests Parrot::Configure::Step

=head1 SYNOPSIS

    prove t/configure/033_step.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Step> module.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
