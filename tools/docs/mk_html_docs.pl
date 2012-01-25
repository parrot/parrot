#! perl
# Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

tools/docs/mk_html_docs.pl - Write HTML documentation

=head1 SYNOPSIS

    % perl tools/docs/mk_html_docs.pl [--version=VERSION]

=head1 DESCRIPTION

This script writes the HTML documentation for Parrot by transforming existing POD
files into pretty HTML output. Index pages are also generated.

This script will look in the F<docs/index> directory for JSON files.  Each JSON
file will generate a separate "table of contents" page, and each referenced POD
file will generate a HTML page. Referenced files must reside within the Parrot
repo, but they may be located outside of the F</docs> directory.

=head2 JSON Syntax

Each JSON file should look similar to the following:

    {
       "page" : "index",
       "content" : [
          {
             "title" : "Introduction",
             "source" : [
                "docs/intro.pod",
                "docs/project/*.pod"
             ]
          },
          {
             "title" : "Working with Parrot",
             "source" : [
                "docs/running.pod",
                "docs/tests.pod",
                "docs/gettingstarted.pod",
                "docs/submissions.pod"
             ],
             "resource" : "docs/*.png"
          },
    }

=head3 Elements

=over

=item C<page>

The name of this page. It must be unique for all JSON pages; the generated HTML
will reside at "$target_dir/$page.html", where C<$target_dir> is the
destination for all generated content.

Each page must contain a C<content> element.

=item C<content>

An array of sections shown for this page.

Each section must be a hash that contains a C<title> and C<source> entry.

=item C<title>

The title of each section. It need not be unique.

=item C<source>

A listing of POD files. This may be an array or a string; a string will behave as
an array of one element.

Each element in the array must be a path relative to the Parrot repo, such as
"docs/pmc/default.pmc". Globbing is supported, so paths liek "docs/pmc/*.pmc" are
also allowed.

=item C<resource>

An optional listing of files that should be copied directly to C<$target_dir>. This
is useful for things like images that require no transformation, but should be accessible
to generated output.

This element behaves similarly to C<source>: a string or array may be passed, and globbing
is performed for each element.

=back

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
use File::Copy;
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
        my @resources_list = canonicalize_files($chunk->{resource});

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
        $chunk->{resources} = \@resources_list;
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
        foreach my $resource (@{$section->{resources}}) {
            my $outfile = File::Spec->catfile($target_dir, $resource);
            File::Path::mkpath(File::Basename::dirname($outfile));
            File::Copy::copy($resource, $outfile);
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

    # replace make_path with legacy functional mkpath to accommodate older versions of Perl
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

    # Note: This is a'bit of a hack to output html links directly into the
    #       "index.html" file.
    print $out_fh Parrot::Docs::HTMLPage->body('<h2>Development Languages</h2>',
					       '<ul><li><a href="http://whiteknight.github.com/Rosella/winxed/index.html">The Winxed Programming Language</a></li>',
					       '<li><a href="https://github.com/perl6/nqp">The NQP Programming Language</a></li></ul>');

    # output footer
    print $out_fh Parrot::Docs::HTMLPage->footer('', $resource_dir, $version);
}

exit 0;

=head2 Utility Methods

=over

=item C<canonicalize_files($json_chunk)>

Process a given JSON chunk to retrieve a list of input files. Currently, this
is used to retrieve input POD files and static images.

The JSON chunk may be an array or a string (which is transformed into a
single-element array).

Each array element should be a file path relative to the parrot repo; it is not
necessary for resources to live under docs/. Globs are also allowed, so you can
include many files at once.

=cut

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


=item C<transform_input($input, $parent, $parent_title)>

Transform the specfied POD file into HTML. C<$input> should be a path to the
POD file, relative to the Parrot repo (e.g., "src/pmc/default.pmc"). C<$parent>
and C<$parent_title> both refer to the parent's "page" JSON chunk and "title"
JSON chunk, respectively. Parent information will be used to create breadcrumb
links.

The resulting HTML will be copied to C<$target_dir>, preserving the relative
location of the input file, for example:

    "src/pmc/default.pmc" => "$target_dir/src/pmc/default.pmc"

=cut

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

    # replace make_path with legacy functional mkpath to accommodate older versions of Perl
    my $dir = File::Path::mkpath(File::Basename::dirname($outfile));

    open my $out_fh, '>', $outfile;

    $formatter->output_fh($out_fh);
    $formatter->parse_file($input);
    warn "$input generated no HTML output\n"
        unless $formatter->content_seen;

    my $page_title = $formatter->return_page_title();

    $file_titles{$input} = $page_title;
}

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
