#! perl
# Copyright (C) 2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use File::Temp qw(tempfile);
use Test::More qw(no_plan);

use Parrot::Test;
use Parrot::Test::Pod;
use Parrot::Config qw(%PConfig);

my @files = @ARGV;

if (!@files) {
  my $podTester = Parrot::Test::Pod->new();
  @files = @{$podTester->identify_files_for_POD_testing()};
}

foreach my $file ( @files ) {
    foreach my $snippet (get_samples($file)) {
        compile_ok($snippet);
    }
}

#################### SUBROUTINES ####################

sub compile_ok {
    my $snippet = shift;

    my ($fh,$tempfile) = tempfile(
        SUFFIX => '.' . lc $snippet->{type},
        UNLINK => 1
    );
    print {$fh} $snippet->{code};
    close $fh;

    my $cmd = File::Spec->curdir() . $PConfig{slash} .
              $PConfig{test_prog} . " -o " . File::Spec->devnull() . " " .
              $tempfile;

    my $description = $snippet->{file} . "\n" . $snippet->{code};

    is(system($cmd), 0 , $description);
}

sub get_samples {
    my $file = shift;

    my $contents;
    {
        local undef $/;
        open my $fh, '<', $file;
        $contents = <$fh>;
    }

    my @snippets;
    while ($contents =~ /^=begin (PIR|PASM)(.*?)^=end \1$/smg) {
        push @snippets, {
            file => $file,
            type => $1,
            code => $2,
        };
    }
    return @snippets;
}

=head1 NAME

t/examples/pod.t - Compile examples found in POD

=head1 SYNOPSIS

    # test all files
    % prove t/examples/pod.t

    # test specific files
    % perl t/examples/pod.t docs/compiler_faq.pod

=head1 DESCRIPTION

Tests the syntax for any embedded PIR in POD, for all files in the
repository that contain POD.  Any invalid examples are reported in the
test output.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
