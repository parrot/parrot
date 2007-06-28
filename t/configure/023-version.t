#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 023-version.t 19028 2007-06-16 00:24:34Z jkeenan $
# 023-version.t

use strict;
use warnings;

use Test::More tests => 14;
use Carp;
use_ok( 'Cwd' );
use_ok( 'File::Copy' );
use_ok( 'File::Temp', qw| tempdir | );
use lib qw( . lib ../lib ../../lib t/configure/testlib );
use_ok( 'Make_VERSION_File', qw| make_VERSION_file |);

my $cwd = cwd();
my $errstr;
{
    my $tdir = tempdir(CLEANUP => 1);
    ok(chdir $tdir, "Changed to temporary directory for testing");
    ok((mkdir "lib"), "Able to make directory lib");
    ok((mkdir "lib/Parrot"), "Able to make directory lib/Parrot");
    ok(copy ("$cwd/lib/Parrot/BuildUtil.pm", "lib/Parrot/"),
        "Able to copy Parrot::BuildUtil for testing");
    unshift(@INC, "lib");

    require Parrot::BuildUtil;

    # Case 5:  Valid version number
    make_VERSION_file(q{0.4.11});
    my ($pv, @pv);
    $pv = Parrot::BuildUtil::parrot_version();
    @pv = Parrot::BuildUtil::parrot_version();
    is($pv, q{0.4.11}, "Correct version number returned in scalar context");
    is_deeply(\@pv, [ 0, 4, 11 ],
        "Correct version number returned in scalar context");

    $pv = Parrot::BuildUtil::parrot_version();
    @pv = Parrot::BuildUtil::parrot_version();
    is($pv, q{0.4.11}, "Correct version number returned in scalar context");
    is_deeply(\@pv, [ 0, 4, 11 ],
        "Correct version number returned in scalar context");
    ok(chdir $cwd, "Able to change back to directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

023-version.t - test C<Parrot::BuildUtil::parrot_version()>

=head1 SYNOPSIS

    % prove t/configure/023-version.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::BuildUtil (F<lib/Parrot/BuildUtil.pm>).

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::BuildUtil, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

