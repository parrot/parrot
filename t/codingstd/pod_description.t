#! perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use Carp;
use Test::More;
use lib qw( lib );
BEGIN {
    eval 'use Parrot::Test::Pod';
    if ($@) {
        plan skip_all => 'Prerequisites for Parrot::Test::Pod not satisfied';
        exit;
    }
    eval 'use Parrot::Test::Pod::Utils qw(
        file_pod_ok
        empty_description
    )';
    if ($@) {
        plan skip_all =>
            'Prerequisites for Parrot::Test::Pod::Utils not satisfied';
        exit;
    }
}

plan tests => 2;

my $self = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
} );
ok( defined $self, "Parrot::Test::Pod returned defined value" );

my $need_testing_ref = $self->identify_files_for_POD_testing( {
    second_analysis => 'oreilly_summary_malformed',
} );

my @empty_description;

foreach my $file ( @{ $need_testing_ref } ) {
    # check DESCRIPTION section on valid POD files
    if ( file_pod_ok($file) and empty_description($file) ) {
        push @empty_description, $file;
    }
}

my $empty_description_files = join( "\n", sort @empty_description);
my $nempty_description      = scalar( @empty_description );

TODO: {
    local $TODO = 'POD requirements in flux: TT #292';

is(
    $empty_description_files,
    q{},
    'All Pod files have non-empty DESCRIPTION sections'
);
}

diag("\nFound $nempty_description files without DESCRIPTION sections.\n")
    if $nempty_description;

#################### SUBROUTINES ####################

=head1 NAME

t/codingstd/pod_description.t - Identify files lacking 'DESCRIPTION' in POD

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/pod_description.t

    # test specific files
    % perl t/codingstd/pod_description.t perl_module.pm perl_file.pl

=head1 DESCRIPTION

Tests the Pod syntax for all files listed in F<MANIFEST> and
F<MANIFEST.generated> that appear to contain Pod markup. If any files
contain with valid POD markup lack C<DESCRIPTION> sections, list them.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
