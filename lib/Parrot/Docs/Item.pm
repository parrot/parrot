# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Item - Docmentation item

=head1 SYNOPSIS

	use Parrot::Docs::Item;
	
	my $item = Parrot::Docs::Item->new('Usual suspects', 'foo', 'bar');

=head1 DESCRIPTION

An item is one or more related paths with some optional descriptive text.

Directory paths will be expanded to all the file paths within the
directory and any subdirectories recursively (see the C<files()> method
in C<Parrot::IO::Directory>).

If an item has more than one file associated with it, and has no text,
then an attempt will be made to extract short descriptions from each
file to place under the file path in the index HTML.

=head2 Methods

=over

=cut

package Parrot::Docs::Item;

use strict;
use Parrot::Docs::Directory;
use Parrot::Docs::POD2HTML;

=item C<new_item($text, @paths)>

Returns a new item.

Use this when creating items in a section's C<new()> method.

=cut

sub new_item
{
    my $self = shift;
    
    return Parrot::Docs::Item->new(@_);
}

=item C<new($text, @contents)>

Returns a new item. If there is no descriptive text then C<$text> should
be an empty string.

The paths in C<@contents> will be interpreted as being relative to the
C<$target> argument in C<write_html()>. There should be at least one
path otherwise an exception is raised.

=cut

sub new
{
	my $self = ref $_[0] ? ref shift : shift;
	my $text = shift;
	my @contents = @_;
	
	# TODO - Items should only contain paths.
	
	die "No contents.\n" unless @contents;
	
	$self = bless {
		TEXT => $text,
		CONTENTS => \@contents,
	}, $self;

	return $self;
}

=item C<set_parent($parent)>

=item C<parent()>

Accessors for the containing section/group for the item.

=cut

sub set_parent
{
	my $self = shift;
	
	$self->{PARENT} = shift;
}

sub parent
{
	my $self = shift;
	
	return $self->{PARENT};
}

=item C<html_navigation($path)>

Returns the HTML navigation bar.

=cut

sub html_navigation
{
	my $self = shift;
	my $path = shift;
	my $parent = $self->parent || return '';
	
	return join ' | ', 
		grep {length} 
			$parent->html_navigation($path), $parent->html_link($path);
}

=item C<write_html($source, $target, $silent)>

Any POD-formatted text in the item's files is converted to HTML and
written to a file in C<$target> and an HTML link is created to it.

Alternatively, if a file responds true to C<is_docs_link()> then an HTML
link is created to the file itself.

Some HTML-formatted text describing the files linked to is returned.

=cut

sub write_html
{
	my $self = shift;
	my $source = shift;
	my $target = shift;
	my $silent = shift;
	my $index_html = '';
	my @rel_paths = $self->contents_relative_to_source($source);
	my @short_desc = ();
	
	foreach my $rel_path (@rel_paths)
	{
		my $file = $source->file_with_relative_path($rel_path);
		
		if ( $file->contains_pod )
		{	
			print "\n", $rel_path unless $silent;
		
			my $formatter = Parrot::Docs::POD2HTML->new;
			
			$formatter->write_html($source, $target, $rel_path, $self);
			
			$rel_path = $formatter->append_html_suffix($rel_path);

			$index_html .= sprintf("<a href= \"%s\">%s</a><br>\n",
				$rel_path, $source->relative_path($file->path));
		
			next if $self->{TEXT};
			
			my $short_desc = $file->short_description;
			
			next unless $short_desc;
			
			next if grep {$_ eq $short_desc} @short_desc;
			
			push @short_desc, $short_desc;
		}
		elsif ( $file->is_docs_link )
		{
			print "\n", $rel_path unless $silent;
		
			# Link to the actual file rather than the HTML version.
			$index_html .= sprintf("<a href= \"%s\">%s</a><br>\n",
				$target->relative_path($file->path), 
				$source->relative_path($file->path));
		}
	}
	
	return '' unless $index_html;
	
	if ( ! $self->{TEXT} and @short_desc )
	{
		my $short_desc = join '. ', @short_desc;
		
		$short_desc .= '.' unless $short_desc =~ /\.$/o;
		
		$self->{TEXT} = $short_desc;
	}
	
	if ( $self->{TEXT} )
	{
		$index_html .= "$self->{TEXT}<br>\n";
		$index_html = '<p>' . $index_html . "</p>\n";
	}
	
	return $index_html;
}

=item C<contents_relative_to_source($source)>

Returns the contents of the item interpreted relative to the source
directory.

=cut

sub contents_relative_to_source
{
	my $self = shift;
	my $source = shift;
	my @contents = ();
	
	foreach my $content (@{$self->{CONTENTS}})
	{
		push @contents, 
			$self->file_paths_relative_to_source($source, $content);
		
	}
	
	return @contents;
}

=item C<file_paths_relative_to_source($source, $path)>

If C<$path> is an immediate subdirectory of C<$source>, then this method
returns all the file paths within the directory and any subdirectories
recursively, relative to C<$source>.

If C<$path> is a file in C<$source> then C<$path> is returned.

If C<$path> cannot be found then a warning is printed.

=cut

sub file_paths_relative_to_source
{
	my $self = shift;
	my $source = shift;
	my $rel_path = shift;
	my @rel_paths = ();
	
	if ( $source->relative_path_is_directory($rel_path) )
	{
		my $dir = $source->directory_with_relative_path($rel_path);
		
		foreach my $file ($dir->files(1))
		{
			push @rel_paths, $source->relative_path($file->path);
		}
	}
	elsif ( $source->relative_path_is_file($rel_path) )
	{
		push @rel_paths, $rel_path;
	}
	else
	{
		warn "Failed to process $rel_path.\n";
	}

	return @rel_paths;
}

=back

=head1 SEE ALSO

C<Parrot::Docs::Section>, C<Parrot::Docs::Group>.

=cut

1;
