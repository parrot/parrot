# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::EditorPlugins - Editor Plugins documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::EditorPlugins;

=head1 DESCRIPTION

A documentation section describing Parrot-related editor plugins.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::EditorPlugins;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::EditorPlugins::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Editor Plugins', 'editor.html', '',
		$self->new_item('', 'editor')
	);
}

=back

=cut

1;