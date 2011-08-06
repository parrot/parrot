#! perl
# Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

tools/docs/make_html_docs.pl - Write HTML documentation

=head1 SYNOPSIS

    % perl tools/docs/make_html_docs.pl [--version=VERSION]

=head1 DESCRIPTION

This script writes the HTML documentation for Parrot.

=cut

use strict;
use warnings;

# as long as we have a separate docs/ makefile, this will be run from
# inside it. So jump up a dir to catch all the files.
chdir '..';

use lib 'lib';
use Fatal qw/open close/;

use File::Basename qw/basename dirname/;
use File::Path;
use File::Spec;
use Getopt::Long;
use JSON;
use Parrot::Docs::PodToHtml;
use Parrot::Docs::HTMLPage;

my $version='';

GetOptions( 'version=s' => \$version );

my $target_dir   = 'docs/html';
my $resource_dir = '../resources';

my $json = JSON->new();

sub canonicalize_files {
    my ($file_chunk) = @_;

    my @raw_files;
    if (ref $file_chunk eq "ARRAY" ) {
        @raw_files = @{$file_chunk};
    }
    elsif ($file_chunk) {
        push @raw_files, $file_chunk;
    };

    my @files_list;

    foreach my $file_elem (@raw_files) {
        foreach my $file (sort glob($file_elem)) {
            push @files_list, ($file)
        }
    }

    return @files_list;
}

# Transform the json
my %pages;
my @json_index_files = glob 'docs/index/*.json';
foreach my $index_file (@json_index_files) {
    my $contents;
    open my $fh, '<', $index_file;
    { local $/; $contents = <$fh> }
    my $section = '';
    eval {
        $section = $json->decode($contents);
    };
    if ($@) {
        print STDERR "Error in $index_file:\n";
        die $@;
    }

    my $outfile = $section->{page} . '.html';
    my $title   = $section->{title};

    foreach my $chunk (@{$section->{content}}) {
        my @sources_list = canonicalize_files($chunk->{source});

        my %sources;
        foreach my $file (@sources_list) {
            $sources{$file} = 1;
        }

        # These are only literals, no globs (for now?)
        if (exists $chunk->{exclude}) {
            foreach my $exclusion (@{$chunk->{exclude}}) {
                delete $sources{$exclusion}
            }
            # remove exclusions from @sources_list
            my @no_exclusions;
            foreach my $not_excluded (@sources_list) {
                push @no_exclusions, ($not_excluded) if $sources{$not_excluded};
            }
            @sources_list = @no_exclusions;
        }
        $chunk->{input_files} = [keys %sources];
        $chunk->{sorted_list} = \@sources_list;
    }
    $pages{lc $section->{page}} = $section;
}

foreach my $page (keys %pages) {
    $page = $pages{$page};
    foreach my $section (@{$page->{content}}) {
        foreach my $source (@{$section->{input_files}}) {
            if ($source =~ /^:(.*)/) {
                # Indicates link to other page.
                my $link = lc $1;
                if (! exists $pages{$link}) {
                    die "invalid link $source specified.\n";
                }
                # assuming a link only in one page
                $pages{$link}->{parent} = $page;
            }
            else {
                transform_input($source, $page->{page}, $page->{title});
            }
        }
    }
}


my %file_titles;
#
# generate index/header pages
#

foreach my $page (keys %pages) {
    my $outfilename = $page;
    $page = $pages{$page};
    my $title = $page->{title};

    my $outfile = File::Spec->catfile($target_dir, $outfilename) . '.html';

    # replace make_path with legacy functional mkpath to accomodate older versions of Perl
    my $dir = File::Path::mkpath(File::Basename::dirname($outfile));

    open my $out_fh, '>', $outfile;

    # set up and output header
    my $nav_HTML = qq{<a href="index.html">Home</a>};
    print $out_fh Parrot::Docs::HTMLPage->header($title, $nav_HTML, $resource_dir, $version);

    foreach my $section (@{$page->{content}}) {
        # output Section title
        print $out_fh "<h2>$section->{title}</h2>\n\n<ul>";

        foreach my $source (@{$section->{sorted_list}}) {
            if ($source =~ /^:(.*)/) {
                my $link = lc $1;
                # output link with title
                print $out_fh qq(<li><a href="$link.html">$pages{$link}->{title}</a></li>\n);
            }
            else {
                # output source and name (from title)
                print $out_fh qq(<li><a href="$source.html">$file_titles{$source}</a></li>\n);
            }
        }
        print $out_fh "</ul>\n\n";
    }
    # output footer
    print $out_fh Parrot::Docs::HTMLPage->footer('', $resource_dir, $version);
}

#
# transform individual files from .pod to .html
#

sub transform_input {
    my ($input, $parent, $parent_title) = @_;

    if (! -f $input) {
        die "$input not found or not a regular file\n" .
            "You might need to restrict your glob specification.";
    }

    my $formatter = Parrot::Docs::PodToHtml->new();
    $formatter->set_parent($parent, $parent_title);

    # Errata is currently noisy; e.g. complains about U<> even after
    # formatting it as expected. skip it until we can properly quiet it down.
    $formatter->no_errata_section(1);

    my $outfile = File::Spec->catfile($target_dir, $input) . '.html';

    # replace make_path with legacy functional mkpath to accomodate older versions of Perl
    my $dir = File::Path::mkpath(File::Basename::dirname($outfile));

    open my $out_fh, '>', $outfile;

    $formatter->output_fh($out_fh);
    $formatter->parse_file($input);
    warn "$input generated no HTML output\n"
        unless $formatter->content_seen;

    my $page_title = $formatter->return_page_title();

    $file_titles{$input} = $page_title;
}

exit 0;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
