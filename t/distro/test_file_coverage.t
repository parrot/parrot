#! perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use English qw( -no_match_vars ); 
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
    my $pmc_dir = 'src/pmc';
    my $pmc_suffix = '.pmc';

    my $test_dir = 't/pmc';
    my $test_suffix = '.t';

    my( @pmc_files, @test_files );


    # find pmc files
    find { no_chdir => 1,
           wanted => sub{ files_of_type( \@pmc_files, $pmc_suffix ) },
         } => catdir( $PConfig{build_dir}, $pmc_dir );


    # find test files
    find { no_chdir => 1,
           wanted => sub{ files_of_type( \@test_files, $test_suffix ) },
         } => catdir( $PConfig{build_dir}, $test_dir );


    my( $pmc_miss, $test_miss ) = list_diff(\@pmc_files, \@test_files);

    local $LIST_SEPARATOR = "\n\t";


    TODO: {
        local $TODO = "not yet implemented";
        ok(!@$pmc_miss, "there are test files for all PMC files in $pmc_dir")
            or diag "files in $test_dir but not in PMC dir:\n\t@$pmc_miss";

        ok(!@$test_miss, "there are PMC files for all test files in $test_dir")
            or diag "files in $pmc_dir but not in test dir:\n\t@$test_miss";
    }

} # PMC


# TODO: DYNPMC, DYNOPS, etc.

# remember to change the number of tests :-)
BEGIN { plan tests => 2; }


sub files_of_type
{
    my( $listref, $ext ) = @_;

    return unless -f $File::Find::name && $File::Find::name =~ m/\Q$ext\E$/;

    my( $name, $path, $suffix ) =
          fileparse( $File::Find::name, $ext );

    push @{$listref} => $name;
}


sub list_diff
{
    my ($a, $b) = @_;

    my %elem;
    grep { $elem{$_}++ } @$a;
    grep { $elem{$_}-- } @$b;

    return (
            [ sort grep { $elem{$_} < 0 } keys %elem ],
            [ sort grep { $elem{$_} > 0 } keys %elem ],
           );
}
