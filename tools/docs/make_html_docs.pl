#! perl
# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

tools/docs/make_html_docs.pl - Write HTML documentation

=head1 SYNOPSIS

    % perl tools/docs/make_html_docs.pl [--silent] [--version]

=head1 DESCRIPTION

This script writes the HTML documentation for Parrot.

=cut

use strict;
use warnings;
use lib 'lib';

use Fatal qw/open close/;
use Getopt::Long;
use JSON;

my ( $silent, $version );

die unless GetOptions( 'silent'    => \$silent,
                       'version=s' => \$version,
                     );

my $json = JSON->new();

foreach my $index_file (glob 'docs/index/*.json') {
    my $contents;
    open my $fh, '<', $index_file;
    { local $/; $contents = <$fh>}
    my $section = $json->decode($contents);

    my $outfile = $section->{page} . '.html';
    my $title   = $section->{title};
    print "   URL  : $outfile\n";
    print "  Title : $title\n";

    foreach my $chunk (@{$section->{content}}) {
        print " Section Title : " . $chunk->{title} . "\n";

        my @raw_sources;
        if (ref $chunk->{source} eq "ARRAY" ) {
            @raw_sources = @{$chunk->{source}};
        } else {
            push @raw_sources, $chunk->{source};
        };

        my %sources;
        foreach my $source_elem (@raw_sources) {
            foreach my $file (glob($source_elem)) {
                $sources{$file} = 1;
            }
        }

        # These are only literals, no globs (for now?)
        if (exists $chunk->{exclude}) {
            foreach my $exclusion (@{$chunk->{exclude}}) {
                delete $sources{$exclusion}
            }
        }
        print join('; ', sort keys %sources);
        print "\n";
    }
    print "\n";
}

exit 0;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
