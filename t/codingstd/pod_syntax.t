#! perl
# Copyright (C) 2001-2014, Parrot Foundation.

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
    eval 'use Capture::Tiny';
    if ($@) {
        plan skip_all => 'Prerequisite Capture::Tiny not installed';
        exit;
    }
}
use Parrot::Test::Pod::Utils qw(file_pod_ok);

plan tests => 2;

my $self = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
} );
ok( defined $self, "Parrot::Test::Pod loaded ok" );

my $need_testing_ref = $self->identify_files_for_POD_testing( {
    second_analysis => 'oreilly_summary_malformed',
} );

my @failed_syntax;

foreach my $file ( @{ $need_testing_ref } ) {
    # skip files with valid POD;
    # report whatever is not skipped
    unless (file_pod_ok($file)) {
        #but skip files which pass the newer and stricter podchecker test (Pod::Simple weirdness)
        next if $file =~ m{^(include/parrot/namealias\.h|src/string/namealias\.c|src/string/namealias_c\.in)};
        push @failed_syntax, $file;
    }
}
diag join ' ',@{ $need_testing_ref } if $ENV{TEST_VERBOSE};

my $bad_syntax_files        = join( "\n", @failed_syntax );

# only ok if everything passed
is( $bad_syntax_files, q{},
    "Pod syntax of ".scalar @{ $need_testing_ref }." tested files" );

diag("You should use podchecker to check the ".scalar @failed_syntax.
     " failed files:\n".$bad_syntax_files )
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

Tests the perl5 POD syntax with L<Pod::Simple> for all files listed in the
MANIFESTs that appear to contain perl5 POD markup, besides the book which
is O'Reilly specific extended POD and the pdds which are tested
elsewhere. If any files contain invalid POD markup, they are reported in
the test output.

Use C<podchecker> to ferret out individual issues, but note that
L<Pod::Checker> is stricter than L<Pod::Simple>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
# End:
# vim: expandtab shiftwidth=4:
