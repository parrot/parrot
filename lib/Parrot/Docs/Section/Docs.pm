# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Docs - Docs docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Docs;
	
	my $section = Parrot::Docs::Section::Docs->new;

=head1 DESCRIPTION

A documentation section describing all the POD documentation in F<docs>.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Docs;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Docs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Documentation', 'docs.html', '',
		$self->group('General Documentation', '',
			$self->item('', 'docs/overview.pod'),
			$self->item('', 'docs/intro.pod'),
			$self->item('', 'docs/glossary.pod'),
			$self->item('', 'docs/faq.pod'),
			$self->item('', 'docs/parrot.pod'),
		),
		$self->group('Specific Documentation', '',
			$self->item('', 'docs/vtables.pod'),
			$self->item('', 'docs/mmd.pod'),
			$self->item('', 'docs/strings.pod'),
			$self->item('', 'docs/memory_internals.pod'),
			$self->item('', 'docs/parrot_assembly.pod'),
			$self->item('', 'docs/parrotbyte.pod', 'docs/jit.pod'),
			$self->item('', 'docs/packfile-c.pod', 'docs/packfile-perl.pod'),
			$self->item('', 'docs/extend.pod'),
			$self->item('', 'docs/running.pod'),
			$self->item('', 'docs/debug.pod', 'docs/debugger.pod'),
			$self->item('', 'docs/tests.pod'),
			$self->item('', 'docs/embed.pod'),
		),
		$self->group('Development Documentation', '',
			$self->item('', 'docs/dev'),
		),
		$self->group('PMC Documentation', '',
			$self->item('', 'docs/pmc'),
		),
		$self->group('Perl Design Documents (PDD)', '',
			$self->item('', 'docs/pdds'),
		),
	);
}

=back

=cut

1;
