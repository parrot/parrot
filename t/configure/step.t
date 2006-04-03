#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More tests => 19;

use File::Basename qw(basename dirname);
use File::Temp 0.13 qw/tempfile/;
use IO::Handle;

=head1 NAME

t/configure/step.t - tests Parrot::Configure::Step

=head1 SYNOPSIS

    prove t/configure/step.t

=head1 DESCRIPTION

Regressions tests for the L<Parrote::Configure::Step> module.

=cut

BEGIN { use_ok('Parrot::Configure::Step'); }

Parrot::Configure::Step->import(@Parrot::Configure::Step::EXPORT_OK);

can_ok(__PACKAGE__, @Parrot::Configure::Step::EXPORT_OK);

# XXX add verbose tests with some Test::Warn like mechanism

# integrate()

is(integrate(undef, undef), undef, "integrate(undef, undef)");
is(integrate(undef, 1), 1, "integrate(undef, 1)");
is(integrate(1, undef), 1, "integrate(1, undef)");
is(integrate(1, 2), 2, "integrate(1, 1)");

# reopn STDIN to test prompt()

# file_checksum(), not exported

{
    my( $tmpfile, $fname ) = tempfile(UNLINK => 1);
    print $tmpfile "foo" x 1000;
    $tmpfile->flush;
    is(Parrot::Configure::Step::file_checksum("$fname"), '324000',
        "file_checksum() returns correct checksum");
}

# copy_if_diff()

{
    my( $fromfile, $fromfname ) = tempfile(UNLINK => 1);
    my( $tofile, $tofname ) = tempfile(UNLINK => 1);
    print $fromfile "foo" x 1000;
    $fromfile->flush;

    ok(copy_if_diff("$fromfname", "$tofname"),
        "copy_if_diff() true return status");
    is(Parrot::Configure::Step::file_checksum("$tofname"), '324000',
        "copy_if_diff() copied differing files");
}

# move_if_diff()

{
    my( $fromfile, $fromfname ) = tempfile(UNLINK => 1);
    my( $tofile, $tofname ) = tempfile(UNLINK => 1);
    print $fromfile "foo" x 1000;
    $fromfile->close;
    $tofile->close;

    # redirect STDERR to avoid warnings
    # windows wants '>nul', most everything else wants '>/dev/null'
    my $redir = $^O =~ /^(MSWin\d+)$/ ? q{2>nul} : q{2>/dev/null};

    # copy file descriptors
    open OLDERR, ">&STDERR";

    ok(move_if_diff("$fromfname", "$tofname"),
        "move_if_diff() true return status");
    ok(! -e "$fromfname", "move_if_diff() moved differing file");

    # redirect STDERR for the test below
    close STDERR;
    open STDERR, $redir;

    ok(-e "$tofname", "move_if_diff() moved differing file");

    # restore STDERR
    close STDERR;
    open STDERR, ">&OLDERR";
    close OLDERR;
}

# genfile()

# _run_command()

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
    my( $tmpfile, $fname ) = tempfile(%tf_params);

    local $ENV{PATH} = dirname("$fname");
    chmod 0777, "$fname";
    my $prog = basename("$fname");

    is(check_progs($prog), $prog,
        "check_progs() returns the proper program")
}

{
    my %tf_params = ( UNLINK => 1, );
    $tf_params{SUFFIX} = '.exe' if 'MSWin32' eq $^O;
    my( $tmpfile, $fname ) = tempfile(%tf_params);

    local $ENV{PATH} = dirname("$fname");
    chmod 0777, "$fname";
    my $prog = basename("$fname");

    is(check_progs([$prog]), $prog,
        "check_progs() returns the proper program when passed an array ref")
}

{
    my $cmd = 'someboguscommand';
    ok(!check_progs([$cmd]),
        "check_progs() returns undef in scalar context on failure");
    ok(!check_progs($cmd),
        "check_progs() returns undef in scalar context on failure");
    is_deeply([check_progs([$cmd])], [],
        "check_progs() returns () in list context on failure");
    is_deeply([check_progs($cmd)], [],
        "check_progs() returns () in list context on failure");
}

# _slurp(), not exported

{
    my( $tmpfile, $fname ) = tempfile(UNLINK => 1);
    print $tmpfile "foo" x 1000;
    $tmpfile->flush;
    is(Parrot::Configure::Step::_slurp($fname), "foo" x 1000,
        "_slurp() slurped the file");
}
