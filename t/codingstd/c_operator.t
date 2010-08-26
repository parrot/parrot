#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Pod::Simple;

=head1 NAME

t/codingstd/c_operator.t - checks spacing around operators in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_operator.t

    # test specific files
    % perl t/codingstd/c_operator.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper use of spacing
around operators.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();
check_operators(@files);

exit;

sub strip_pod {
    my $buf = shift;
    my $parser = Pod::Simple->new();
    my $non_pod_buf;
    $parser->output_string( \$non_pod_buf );
    # set up a code handler to get at the non-pod
    # thanks to Thomas Klausner's Pod::Strip for the inspiration
    $parser->code_handler(
        sub {
            print {$_[2]{output_fh}} $_[0], "\n";
        });
    $parser->parse_string_document( $buf );

    return $non_pod_buf;
}

sub check_operators {
    my %comma_space;

    foreach my $file (@_) {
        my $path = @ARGV ? $file : $file->path();

        # skip lex files
        next if $path =~ m/\.l$/;

        my $buf = $DIST->slurp($path);

        # only strip pod from .ops files
        if ( $path =~ m/\.ops$/ ) {
            $buf = strip_pod($buf);
        }

        # strip ', ", and C comments
        $buf =~ s{ (?:
                       (?: (') (?: \\\\ | \\' | [^'] )* (') ) # remove ' string
                     | (?: (") (?: \\\\ | \\" | [^"] )* (") ) # remove " string
                     | /(\*) .*? (\*)/                        # remove C comment
                   )
                }{defined $1 ? "$1$2" : defined $3 ? "$3$4" : "$5$6"}egsx;

        my @lines = split( /\n/, $buf );
        $comma_space{$path} = [];
        for (my $i=0; $i <= $#lines; $i++) {
            # after a comma there should be one space or a newline
            if ( $lines[$i] =~ m{ ( (?:,) (?! \s ) (?= .+) ) }gx ) {
                push @{ $comma_space{$path} }, $i;
            }
        }
    }

## L<PDD07/Code Formatting"there should be one space or a newline after a comma">/
    my $files_with_errors = 0;
    for my $path ( sort keys %comma_space ) {
        $files_with_errors++ if scalar @{ $comma_space{$path} };
    }
    is( $files_with_errors, 0, "there should be one space or a newline after a comma" )
        or diag( do {
            for my $k (sort keys %comma_space) {
                my @lines_failed = @{$comma_space{$k}};
                print "$k: line(s): @lines_failed\n" if scalar(@lines_failed);
            }
        } );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
