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
    )';
}

plan tests => 2;

my $self = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
} );
ok( defined $self, "Parrot::Test::Pod returned defined value" );

my $need_testing_ref = $self->identify_files_for_POD_testing( {
    second_analysis => 'oreilly_summary_malformed',
} );

my @failed_syntax;

foreach my $file ( @{ $need_testing_ref } ) {
    # skip files with valid POD;
    # report whatever is not skipped
    unless (file_pod_ok($file)) {
        push @failed_syntax, $file;
    }
}

my $bad_syntax_files        = join( "\n", @failed_syntax );

# only ok if everything passed
is( $bad_syntax_files, q{}, 'Pod syntax correct' );

diag("You should use podchecker to check the failed files.\n")
    if $bad_syntax_files;

#################### SUBROUTINES ####################

=head1 NAME

t/codingstd/pod_syntax.t - Pod document syntax tests

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/pod_syntax.t

    # test specific files
    % perl t/codingstd/pod_syntax.t perl_module.pm perl_file.pl

=head1 DESCRIPTION

Tests the Pod syntax for all files listed in F<MANIFEST> and
F<MANIFEST.generated> that appear to contain Pod markup. If any files
contain invalid POD markup, they are reported in the test output.
Use C<podchecker> to ferret out individual issues.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
