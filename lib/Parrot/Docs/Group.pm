# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Group - Group of documentation items

=head1 SYNOPSIS

	use Parrot::Docs::Group;
	
	my $group = Parrot::Docs::Group->new('Usual suspects', '',
	    Parrot::Docs::Item->new('', 'foo'),
	    Parrot::Docs::Item->new('', 'bar'));

=head1 DESCRIPTION

A group is a number of items with some optional descriptive text.

This is a subclass of C<Parrot::Docs::Item>.

=head2 Methods

=over

=cut

package Parrot::Docs::Group;

use strict;

use Parrot::Docs::Item;
@Parrot::Docs::Group::ISA = qw(Parrot::Docs::Item);

=item C<new_group($name, $text, @items)>

Returns a new group.

Use this when creating groups in a subclass's C<new()> method.

=cut

sub new_group
{
    my $self = shift;
    
    return Parrot::Docs::Group->new(@_);
}

=item C<new($name, $text, @contents)>

Returns a new group. 

C<$name> and C<$text> are required, though the text can be an empty
string. C<@contents> is one or more C<Parrot::Docs::Item> instances, or 
relative paths.

=cut

sub new
{
	my $self = ref $_[0] ? ref shift : shift;
	my $name = shift || die "No name.\n";
	my $text = shift;
	my @contents = @_;
	
	# TODO - Groups should only contain items or paths.
	
	$self = $self->SUPER::new($text, @contents);
	$self->{NAME} = $name;
	
	return $self;
}

=item C<name()>

Returns the name of the group.

=cut

sub name
{
	my $self = shift;
	
	return $self->{NAME};
}

=item C<html_link()>

Groups have no HTML link. This method returns an empty string which will
be discarded when building the navigation bar.

=cut

sub html_link
{
	return '';
}

=item C<write_html($source, $target, $silent)>

C<write_html()> is called on each item in the group.

Some HTML-formatted text describing the files linked to is returned.

=cut

sub write_html
{
	my $self = shift;
	my $index_html = $self->write_contents_html(@_);
	
	if ( $index_html )
	{
		# If none of the items are in a para then the whole group is.
	
		if ( $index_html !~ /<p>/ )
		{
			$index_html = "<p>\n" . $index_html . "</p>\n\n";
		}
		
		$index_html = "<p>$self->{TEXT}</p>\n\n" . $index_html if $self->{TEXT};
		$index_html = "<h2>$self->{NAME}</h2>\n\n" . $index_html;
	}
	
	return $index_html;
}

=item C<write_contents_html($source, $target, $silent)>

Iterates over the group's contents and calls C<write_html()> on each one.

Some HTML-formatted text describing the files linked to is returned.

=cut

sub write_contents_html
{
	my $self = shift;
	my $source = shift;
	my $target = shift;
	my $silent = shift;
	my $index_html = '';
	
	print "\n\n", $self->name unless $silent;
	
	foreach my $content ($self->contents_relative_to_source($source))
	{
		$index_html .= $content->write_html($source, $target, $silent);
	}
	
	return $index_html;
}

=item C<contents_relative_to_source($source)>

Returns the contents of the group interpreted relative to the source
directory.

=cut

sub contents_relative_to_source
{
	my $self = shift;
	my $source = shift;
	my @contents = ();
	
	foreach my $content (@{$self->{CONTENTS}})
	{
		if ( ref($content) )
		{
			push @contents, $content;
		}
		else
		{
			# It would be good to check the short description for each
			# file and create an item for sequences of files with the
			# same description.
			
			push @contents, 
				map {$self->new_item('', $_)} 
					$self->file_paths_relative_to_source($source, $content);
		}
	}
	
	foreach my $content (@contents)
	{
		# We wait until now to do this because only now are all
		# the contents guaranteed to be instances.
		# Remember that this method is also used by section.
		
		$content->set_parent($self);
	}
	
	return @contents;
}

=back

=head1 SEE ALSO

C<Parrot::Docs::Section>, C<Parrot::Docs::Item>.

=cut

1;