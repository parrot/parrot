#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

tools/docs/write_docs.pl - Writes the HTML documentation

=head1 SYNOPSIS

    % perl tools/docs/write_docs.pl

=head1 DESCRIPTION

This script writes the HTML documentation to F<docs/html>.

=cut

use lib 'lib';
use Parrot::Docs::Directory;
use Parrot::Docs::File;

my $root = '.';
my $source = Parrot::Docs::Directory->new($root);
my $target = Parrot::Docs::Directory->new("$root/docs/html");

$target->delete_contents;

my $index = $target->file_with_name('index.html');
my @list = ();

print "Writing documentation:\n";

foreach my $file ($source->files(1, '^(CVS|icu)$'))
{
	next unless $file->contains_pod;
	
	my $rel_path = $source->relative_path($file->path);
	my $docs_file = $target->file_with_relative_path($rel_path . '.html');
	
	print $docs_file->path, "\n";
	
	push @list, item($rel_path . '.html', $source->relative_path($file->path));
	
	$docs_file->write($file->pod_as_html);
}

$index->write(join '', "<ul>\n", @list, "</ul>\n");

exit 0;

sub item
{
	return sprintf("<li><a href= \"%s\">%s</a></li>\n", shift, shift);
}