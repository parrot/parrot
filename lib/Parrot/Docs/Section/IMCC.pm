# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::IMCC - IMCC documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::IMCC;

=head1 DESCRIPTION

A documentation section describing IMCC.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::IMCC;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::IMCC::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'IMCC', 'imcc.html', '', 
		$self->new_group('Documentation', '', 'imcc/docs'),
		$self->new_group('Examples', '', 'imcc/examples'),
		$self->new_group('Tests', '', 'imcc/t'),
	);
}

=back

=cut

1;