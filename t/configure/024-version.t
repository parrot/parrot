#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 024-version.t

use strict;
use warnings;

use Test::More tests => 10;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw| tempdir |;
use lib qw( lib t/configure/testlib );
use Parrot::BuildUtil;
use Make_VERSION_File qw| make_VERSION_file |;

my $cwd = cwd();
my $errstr;
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    ok( ( mkdir "lib" ),        "Able to make directory lib" );
    ok( ( mkdir "lib/Parrot" ), "Able to make directory lib/Parrot" );

    # Case 6:  Installed copy of Parrot
    my $installed_dir = q{lib/Parrot/something};
    ok( ( mkdir $installed_dir ), "Able to make directory $installed_dir" );
    ok( chdir $installed_dir,
        "Changed deeper into temporary directory for testing" );
    make_VERSION_file(q{0.4.11});
    ok( chdir $tdir, "Changed back to temporary directory" );
    my ( $pv, @pv );
    $pv = Parrot::BuildUtil::parrot_version($installed_dir);
    is( $pv, q{0.4.11},
        "Correct version number returned in scalar context" );
    @pv = Parrot::BuildUtil::parrot_version($installed_dir);
    is_deeply( \@pv, [ 0, 4, 11 ],
        "Correct version number returned in list context" );

    unlink qq{$installed_dir/VERSION}
        or croak "Unable to delete file from tempdir after testing";
    ok( chdir $cwd, "Able to change back to directory after testing" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

024-version.t - test C<Parrot::BuildUtil::parrot_version()>

=head1 SYNOPSIS

    % prove t/configure/024-version.t

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

