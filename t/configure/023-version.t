#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 023-version.t

use strict;
use warnings;

use Test::More tests => 14;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw| tempdir |;
use lib qw( lib t/configure/testlib );
use Parrot::BuildUtil;
use Make_VERSION_File qw| make_VERSION_file |;

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    ok( ( mkdir "lib" ),        "Able to make directory lib" );
    ok( ( mkdir "lib/Parrot" ), "Able to make directory lib/Parrot" );

    # Case 5:  Valid version number
    make_VERSION_file(q{0.4.11});
    my ( $pv, @pv );
    @pv = Parrot::BuildUtil::parrot_version();
    is_deeply( \@pv, [ 0, 4, 11 ],
        "Correct version number returned in list context" );

    $pv = Parrot::BuildUtil::parrot_version();
    is( $pv, q{0.4.11},
        "Correct version number returned in scalar context" );

    unlink q{VERSION}
        or croak "Unable to delete file from tempdir after testing";
    ok( chdir $cwd, "Able to change back to directory after testing" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    my $rv = set_bc_version(q{3.07});
    my ($bc_major, $bc_minor) = Parrot::BuildUtil::get_bc_version();
    is( $bc_major, 3, "Got expected bytecode major version" );
    is( $bc_minor, 7, "Got expected bytecode minor version" );

    ok( chdir $cwd, "Able to change back to directory after testing" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    my $rv = set_bc_version(q{3.tomboy});
    eval {
        my ($bc_major, $bc_minor) = Parrot::BuildUtil::get_bc_version();
    };
    like( $@, qr/No bytecode version found/,
        "Got expected error message on failure to find bytecode version" );

    ok( chdir $cwd, "Able to change back to directory after testing" );
}

pass("Completed all tests in $0");

sub set_bc_version {
    my $version_str = shift;
    my $compat_file = 'PBC_COMPAT';
    my ( $bc_major, $bc_minor );
    open my $OUT, '>', $compat_file or die "Can't write $compat_file";
    print $OUT "$version_str\n";
    close $OUT;
    return 1;
}

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

