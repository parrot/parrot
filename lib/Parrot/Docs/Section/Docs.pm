# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Docs - Docs documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Docs;

=head1 DESCRIPTION

A documentation section describing all the POD documentation in F<docs>.

=head2 Class Methods

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
		$self->new_group('General Documentation', '',
			$self->new_item('', 'docs/overview.pod'),
			$self->new_item('', 'docs/intro.pod'),
			$self->new_item('', 'docs/gettingstarted.pod'),
			$self->new_item('', 'docs/submissions.pod'),
			$self->new_item('', 'docs/glossary.pod'),
			$self->new_item('', 'docs/faq.pod'),
			$self->new_item('', 'docs/practical_notes.pod'),
			$self->new_item('', 'docs/parrot.pod'),
		),
		$self->new_group('Specific Documentation', '',
			$self->new_item('', 'docs/configuration.pod'),
			$self->new_item('', 'docs/vtables.pod'),
			$self->new_item('', 'docs/mmd.pod'),
			$self->new_item('', 'docs/strings.pod'),
			$self->new_item('', 'docs/memory_internals.pod'),
			$self->new_item('', 'docs/parrotbyte.pod'),
			$self->new_item('', 'docs/packfile-c.pod'),
			$self->new_item('', 'docs/jit.pod'),
			$self->new_item('', 'docs/native_exec.pod'),
			$self->new_item('', 'docs/running.pod'),
			$self->new_item('', 'docs/porting_intro.pod'),
			$self->new_item('', 'docs/debug.pod'),
			$self->new_item('', 'docs/debugger.pod'),
			$self->new_item('', 'docs/tests.pod'),
			$self->new_item('', 'docs/embed.pod'),
		),
		$self->new_group('Development Documentation', '', 'docs/dev'),
		$self->new_group('PMC Documentation', '', 'docs/pmc'),
		$self->new_group('Parrot Design Documents (PDD)', '', 'docs/pdds'),
	);
}

=back

=cut

1;
