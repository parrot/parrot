#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 04-revision.t

use strict;
use warnings;

use Test::More;
plan( skip_all => "Relevant only when working in checkout from repository and after  configuration" )
    unless (-e 'DEVELOPING' and -e 'Makefile');
plan( tests =>  7 );
use Carp;
use Cwd;
use File::Copy;
use File::Path ();
use File::Temp qw| tempdir |;
use lib qw( lib );

my $cwd = cwd();
{
    my $tdir2 = tempdir( CLEANUP => 1 );
    ok( chdir $tdir2, "Changed to temporary directory for testing" );
    my $libdir = qq{$tdir2/lib};
    ok( (File::Path::mkpath( $libdir )), "Able to make libdir");
    local @INC;
    unshift @INC, $libdir;
    ok( (File::Path::mkpath( qq{$libdir/Parrot} )), "Able to make Parrot dir");
    ok( (copy qq{$cwd/lib/Parrot/Revision.pm},
            qq{$libdir/Parrot}), "Able to copy Parrot::Revision");
    my $mkfl = 'Makefile';
    open my $MK, ">", $mkfl
        or croak "Unable to open $mkfl for writing";
    print $MK qq{'make' is your friend\n};
    close $MK or croak "Unable to close $mkfl after writing";
    require Parrot::Revision;
    no warnings 'once';
    like($Parrot::Revision::current, qr/^\d+$/,
        "Got numeric value for reversion number");
    use warnings;

    unlink qq{$libdir/Parrot/Revision.pm}
        or croak "Unable to delete file after testing";
    ok( chdir $cwd, "Able to change back to starting directory");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-revision.t - test Parrot::Revision

=head1 SYNOPSIS

    % prove t/configure/04-revision.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Revision (F<lib/Parrot/Revision.pm>).

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
