#! perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More qw(no_plan);
use Parrot::Test;

use lib qw( lib );
BEGIN {
    eval 'use Parrot::Test::Pod';
    if ($@) {
        plan skip_all => 'Prerequisites for Parrot::Test::Pod not satisfied';
        exit;
    }
}

my $self = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
} );

my $need_testing_ref = $self->identify_files_for_POD_testing( {
    second_analysis => 'oreilly_summary_malformed',
} );

foreach my $file ( @{ $need_testing_ref } ) {
    foreach my $contents (get_samples($file)) {
        pir_output_like($contents,qr//,"$file\n$contents");
    }
}

#################### SUBROUTINES ####################

sub get_samples {
    my $file = shift;

    my $contents;
    {
        local undef $/;
        open my $fh, '<', $file;
        $contents = <$fh>;
    }

    return $contents =~ (/^=begin PIR$(.*?)^=end PIR$/smg);
}

=head1 NAME

t/examples/pod.t - Compile examples found in POD

=head1 SYNOPSIS

    # test all files
    % prove t/examples/pod.t

    # test specific files
    % perl t/examples/pod.t docs/compiler_faq.pod

=head1 DESCRIPTION

Tests the syntax for any embedded PIR for all files listed in F<MANIFEST> and
F<MANIFEST.generated>. Any invalid examples are reported in the test output.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
