# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Libs - Parrot libraries docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Libs;
	
	my $section = Parrot::Docs::Libs->new;

=head1 DESCRIPTION

A documentation section describing libraries in Parrot.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Libs;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Libs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns the libraries section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Libraries', 'libs.html', '',
		$self->new_item('', 'library', 'dynoplibs')
	);
}

=back

=cut

1;