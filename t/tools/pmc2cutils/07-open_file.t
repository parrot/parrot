#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$
# 07-open_file.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if (defined $topdir) {
        print "\nOK:  Parrot top directory located\n";
    } else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 23;
use File::Basename;
use File::Copy;
use FindBin;
use Data::Dumper;
use_ok( 'Parrot::Pmc2c::Utils' );
use_ok( 'Cwd' );
use_ok( 'File::Temp', qw| tempdir |);

my (%opt, @include, @args);
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my $file = q{sample.txt};
my ($direction, $verbose);
my $fh;

{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');

    ok(create_test_file($file), "test file created");

    $direction = '<';
    ok($fh = Parrot::Pmc2c::Utils::open_file(
        $direction, $file, $verbose),
        "file opened for reading");
    close $fh or die "Unable to close handle to test file";

    $direction = '>';
    ok($fh = Parrot::Pmc2c::Utils::open_file(
        $direction, $file, $verbose),
        "file opened for writing");
    close $fh or die "Unable to close handle to test file";

    $direction = '>>';
    ok($fh = Parrot::Pmc2c::Utils::open_file(
        $direction, $file, $verbose),
        "file opened for appending");
    close $fh or die "Unable to close handle to test file";

    ok(chdir $cwd, "changed back to original directory");
}

{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');

    ok(create_test_file($file), "test file created");

    $verbose = 1;
    my ($currfh, $msg, $msgfh);

    $direction = '<';
    {
        $currfh = select($msgfh);
        open($msgfh, '>', \$msg) or die "Unable to open handle: $!";
        $fh = Parrot::Pmc2c::Utils::open_file(
            $direction, $file, $verbose);
        ok($fh, "file opened for reading");
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    like($msg, qr/^Reading/, "verbose option reports Reading");

    $direction = '>';
    {
        $currfh = select($msgfh);
        open($msgfh, '>', \$msg) or die "Unable to open handle: $!";
        $fh = Parrot::Pmc2c::Utils::open_file(
            $direction, $file, $verbose);
        ok($fh, "file opened for writing");
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    like($msg, qr/^Writing/, "verbose option reports Writing");

    $direction = '>>';
    {
        $currfh = select($msgfh);
        open($msgfh, '>', \$msg) or die "Unable to open handle: $!";
        $fh = Parrot::Pmc2c::Utils::open_file(
            $direction, $file, $verbose);
        ok($fh, "file opened for appending");
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    like($msg, qr/^Appending/, "verbose option reports Appending");

    ok(chdir $cwd, "changed back to original directory");
}

# failure case:  nonexistent file
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');

    my ($currfh, $msg, $msgfh);

    $direction = '<';
    {
        $currfh = select($msgfh);
        open($msgfh, '>', \$msg) or die "Unable to open handle: $!";
        eval { $fh = Parrot::Pmc2c::Utils::open_file(
            $direction, $file, $verbose); };
        select($currfh);
    }
    like($@, qr/^Reading sample.txt/,
        "correctly failed to read nonexistent file");
    like($msg, qr/^Reading sample.txt/,
        "correct message upon trying to read nonexistent file");

    ok(chdir $cwd, "changed back to original directory");
}

pass("Completed all tests in $0");

sub create_test_file {
    my $filename = shift;
    open my $FH, ">$filename" or die "Unable to create test file: $!";
    close $FH or die "Unable to close test file: $!";
    return 1;
}

################### DOCUMENTATION ###################

=head1 NAME

07-open_file.t - test C<Parrot::Pmc2c::Utils::open_file()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/07-open_file.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Utils.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<07-open_file.t> tests the C<Parrot::Pmc2c::Utils::open_file()> subroutine.
This subroutine is I<not> called F<make> but is called by  methods which are
called by F<make>.

So as not to pollute the Parrot build directories with files created
during the testing process, all functions which create or modify
files should be called within a temporary directory.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
