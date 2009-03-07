#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 019-version.t

use strict;
use warnings;

use Test::More tests => 6;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw| tempdir |;
use lib qw( lib );
use Parrot::BuildUtil;

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    ok( ( mkdir "lib" ),        "Able to make directory lib" );
    ok( ( mkdir "lib/Parrot" ), "Able to make directory lib/Parrot" );

    # Case 1:  No VERSION file
    eval { my $pv = Parrot::BuildUtil::parrot_version(); };
    like( $@, qr/Could not open VERSION file!/, "Absence of VERSION file correctly detected" );

    ok( chdir $cwd, "Able to change back to directory after testing" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

019-version.t - test C<Parrot::BuildUtil::parrot_version()>

=head1 SYNOPSIS

    % prove t/configure/019-version.t

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

