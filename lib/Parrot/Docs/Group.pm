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

=item C<new($name, $text, @items)>

Returns a new group. 

C<$name> and C<$text> are required, though the text can be an empty
string. C<@items> is one or more C<Parrot::Docs::Item> instances.

=cut

sub new
{
	my $self = ref $_[0] ? ref shift : shift;
	my $name = shift || die "No name.\n";
	my $text = shift;
	my @contents = @_;
	
	# Should check the items are not sections or groups.
	
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

=item C<write_html($source, $target, $silent)>

C<write_html()> is called on each item in the group.

Some HTML-formatted text describing the files linked to is returned.

=cut

sub write_html
{
	my $self = shift;
	my $source = shift;
	my $target = shift;
	my $silent = shift;
	my $index_html = '';
	
	print "\n\n", $self->name unless $silent;
	
	foreach my $item (@{$self->{CONTENTS}})
	{
		$index_html .= $item->write_html($source, $target, $silent);
	}
	
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

=back

=head1 SEE ALSO

C<Parrot::Docs::Section>, C<Parrot::Docs::Item>.

=cut

1;