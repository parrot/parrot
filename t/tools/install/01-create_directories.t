#! perl
# Copyright (C) 2007, Parrot Foundation.
# 01-create_directories.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Install qw(
    create_directories
);
use IO::CaptureOutput qw( capture );

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    create_directories($tdir, { map { $_ => 1 } @dirs });
    my $dirs_seen = 0;
    foreach my $d (@dirs) {
        $dirs_seen++ if -d "$tdir$d";
    }
    is($dirs_seen, 2, 'got expected number of directories created');
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    my @created = mkpath( [ "$tdir$dirs[0]" ], 0, 0777 );
    ok( ( -d $created[0] ),
        "one directory created before create_directories() is called" );

    create_directories($tdir, { map { $_ => 1 } @dirs });
    my $dirs_seen = 0;
    foreach my $d (@dirs) {
        $dirs_seen++ if -d "$tdir$d";
    }
    is($dirs_seen, 2,
        "create_directories() handled case where one directory already existed" );
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    $tdir .= '/';

    my @dirs = qw(foo/bar foo/bar/baz);
    my @created = mkpath( [ $tdir . 'foo' ], 0, 0777 );
    ok( ( -d $created[0] ),
        "one directory created before create_directories() is called" );

    create_directories($tdir, { map { $_ => 1 } @dirs });
    my $dirs_seen = 0;
    foreach my $d (@dirs) {
        $dirs_seen++ if -d "$tdir$d";
    }
    is($dirs_seen, 2,
        "create_directories() handled case where one path partially existed" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-create_directories.t - test subroutines exported by C<Parrot::Install>

=head1 SYNOPSIS

    % prove t/tools/install/01-create_directories.t

=head1 DESCRIPTION

The files in this directory test functionality used by the scripts
F<tools/dev/install_files.pl>, F<tools/dev/install_doc_files.pl> and F<tools/dev/install_dev_files.pl>
and are exported by F<lib/Parrot/Install.pm>.

=head1 AUTHOR

James E Keenan and Timothy S Nelson

=head1 SEE ALSO

Parrot::Install, F<tools/dev/install_files.pl>, F<tools/dev/install_doc_files.pl>, F<tools/dev/install_dev_files.pl>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
