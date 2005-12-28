#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );

use Test::More tests => 18;

use File::Basename qw(basename dirname);
use File::Temp;

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

# XXX should the other 'features' of integrate() be tested or simply removed?
is(integrate(undef, undef), undef, "integrate(undef, undef)");
is(integrate(undef, 1), 1, "integrate(undef, 1)");
is(integrate(1, undef), 1, "integrate(1, undef)");
is(integrate(1, 2), 2, "integrate(1, 1)");

# reopn STDIN to test prompt()

# file_checksum(), not exported

SKIP: {
    skip "this File::Temp version doesn't support ->new()", 8
        unless File::Temp->can('new');

{
    my $tmpfile = File::Temp->new(UNLINK => 1);
    print $tmpfile "foo" x 1000;
    $tmpfile->flush;
    is(Parrot::Configure::Step::file_checksum("$tmpfile"), '324000',
        "file_checksum() returns correct checksum");
}

# copy_if_diff()

{
    my $fromfile = File::Temp->new(UNLINK => 1);
    my $tofile = File::Temp->new(UNLINK => 1);
    print $fromfile "foo" x 1000;
    $fromfile->flush;

    ok(copy_if_diff("$fromfile", "$tofile"),
        "copy_if_diff() true return status");
    is(Parrot::Configure::Step::file_checksum("$tofile"), '324000',
        "copy_if_diff() copied differing files");
}

# move_if_diff()

{
    my $fromfile = File::Temp->new(UNLINK => 1);
    my $tofile = File::Temp->new(UNLINK => 1);
    print $fromfile "foo" x 1000;
    $fromfile->flush;

    ok(move_if_diff("$fromfile", "$tofile"),
        "move_if_diff() true return status");
    ok(! -e "$fromfile", "move_if_diff() moved differing file");
    ok(-e "$tofile", "move_if_diff() moved differing file");
    diag("ignore the unlink warning");
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
    my $tmpfile = File::Temp->new(UNLINK => 1);
    local $ENV{PATH} = dirname("$tmpfile");
    chmod 0777, "$tmpfile";
    my $prog = basename("$tmpfile");

    is(check_progs($prog), $prog,
        "check_progs() returns the proper program")
}

{
    my $tmpfile = File::Temp->new(UNLINK => 1);
    local $ENV{PATH} = dirname("$tmpfile");
    chmod 0777, "$tmpfile";
    my $prog = basename("$tmpfile");

    is(check_progs([$prog]), $prog,
        "check_progs() returns the proper program when passed an array ref")
}

} # SKIP

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
