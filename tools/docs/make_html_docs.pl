#! perl
# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

tools/docs/make_html_docs.pl - Write HTML documentation

=head1 SYNOPSIS

    % perl tools/docs/make_html_docs.pl --version

=head1 DESCRIPTION

This script writes the HTML documentation for Parrot.

=cut

use 5.12.0;

# as long as we have a separate docs/ makefile, this will be run from
# inside it. So jump up a dir to catch all the files.
chdir '..';

use warnings;
use lib 'lib';
use Fatal qw/open close/;

use File::Basename qw/basename dirname/;
use File::Path qw/make_path/;
use File::Spec;
use Getopt::Long;
use JSON;
use Parrot::Docs::PodToHtml;

my ( $version );

die unless GetOptions( 'version=s' => \$version );

die "Usage: $0 --version\n" unless $version;

my $target_dir = 'docs/html2';

my $json = JSON->new();

# Transform the json
my %pages;
foreach my $index_file (glob 'docs/index/*.json') {
    my $contents;
    open my $fh, '<', $index_file;
    { local $/; $contents = <$fh>}
    my $section = $json->decode($contents);

    my $outfile = $section->{page} . '.html';
    my $title   = $section->{title};

    foreach my $chunk (@{$section->{content}}) {
        my @raw_sources;
        if (ref $chunk->{source} eq "ARRAY" ) {
            @raw_sources = @{$chunk->{source}};
        }
        else {
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
        $chunk->{input_files} = [keys %sources];
    }
    $pages{lc $section->{page}} = $section;
}

foreach my $page (keys %pages) {
    $page = $pages{$page};
    foreach my $section (@{$page->{content}}) {
        foreach my $source (@{$section->{input_files}}) {
            if ($source =~ /^:(.*)/) {
                # Indicates link to other page.
                my $link = $1;
                if (! exists $pages{lc $link}) {
                    die "invalid link $source specified.\n";
                }
            }
            else {
                transform_input($source);
            }
        }
    }
}

my %generated;
sub transform_input {
    my $input = shift;
    if (! -f $input) {
        die "$input not found or not a regular file\n" .
            "You might need to restrict your glob specification.";
    }

    my $formatter = Parrot::Docs::PodToHtml->new();

    my $outfile = File::Spec->catfile($target_dir, $input);
    $outfile =~ s/\.[^.]*$/.html/;

    my $dir = File::Path::make_path(File::Basename::dirname($outfile));

    open my $out_fh, '>', $outfile;

    $formatter->output_fh($out_fh);
    $formatter->parse_file($input);
    warn "$input generated no HTML output\n"
        unless $formatter->content_seen;

    $generated{$input} = 1;
}

exit 0;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
