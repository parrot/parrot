#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use File::Find qw( find );
use File::Basename qw( fileparse );
use File::Spec::Functions qw( catdir catfile );

use Parrot::Config;

=head1 NAME

t/distro/test_file_coverage.t - make sure source files have matching tests

=head1 SYNOPSIS

    % prove t/distro/test_file_coverage.t

=head1 DESCRIPTION

Makes sure that specific source files have matching test files.

=cut

## make sure PMC files match test files
PMC: {

    # Set variables for pmc
    my $pmc_dir         = 'src/pmc';
    my $pmc_suffix      = '.pmc';
    my $test_pmc_dir    = 't/pmc';
    my $test_pmc_suffix = '.t';
    my $test_pmc_miss   = find_files($pmc_dir,$pmc_suffix,$test_pmc_dir,$test_pmc_suffix);

    # Set variables for dynpmc
    my $dynpmc_dir         = 'src/dynpmc';
    my $dynpmc_suffix      = '.pmc';
    my $test_dynpmc_dir    = 't/dynpmc';
    my $test_dynpmc_suffix = '.t';
    my $test_dynpmc_miss   = find_files($dynpmc_dir,$dynpmc_suffix,$test_dynpmc_dir,$test_dynpmc_suffix);

    # Set variables for dynoplibs
    my $dynoplibs_dir         = 'src/dynoplibs';
    my $dynoplibs_suffix      = '.ops';
    my $test_dynoplibs_dir    = 't/dynoplibs';
    my $test_dynoplibs_suffix = '.t';
    my $test_dynoplibs_miss   = find_files($dynoplibs_dir,$dynoplibs_suffix,$test_dynoplibs_dir,$test_dynoplibs_suffix);

    local $" = "\n\t";

    # Tests in src/pmc
    ok( !@$test_pmc_miss, "there are PMC files for all test files in $test_pmc_dir" )
        or diag "files in $pmc_dir but not in test dir:\n\t@$test_pmc_miss";

    # Tests in src/dynpmc
    ok( !@$test_dynpmc_miss, "there are PMC files for all test files in $test_dynpmc_dir" )
        or diag "files in $dynpmc_dir but not in test dir:\n\t@$test_dynpmc_miss";

    # Tests in src/dynoplibs
    ok( !@$test_dynoplibs_miss, "there are OPS files for all test files in $test_dynoplibs_dir" )
        or diag "files in $dynoplibs_dir but not in test dir:\n\t@$test_dynoplibs_miss";
}    # PMC

# remember to change the number of tests :-)
BEGIN { plan tests => 3; }

sub files_of_type {
    my ( $listref, $ext ) = @_;

    return unless -f $File::Find::name && $File::Find::name =~ m/\Q$ext\E$/;

    my ( $name, $path, $suffix ) = fileparse( $File::Find::name, $ext );

    push @{$listref} => $name;
}

sub list_diff {
    my ( $a, $b ) = @_;

    my %elem;
    grep { $elem{$_}++ } @$a;
    grep { $elem{$_}-- } @$b;

    return [ sort grep { $elem{$_} > 0 } keys %elem ];
}

sub find_files {

    my ($type_dir,$type_suffix,$test_dir,$test_suffix) = @_;

    my ( @type_files, @test_files );

    # find suffix type files
    find {
        no_chdir => 1,
        wanted => sub { files_of_type( \@type_files, $type_suffix ) },
    } => catdir( $PConfig{build_dir}, $type_dir );

    # find test files
    find {
        no_chdir => 1,
        wanted => sub { files_of_type( \@test_files, $test_suffix ) },
    } => catdir( $PConfig{build_dir}, $test_dir );

    my $test = list_diff( \@type_files, \@test_files );

    return $test;

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
