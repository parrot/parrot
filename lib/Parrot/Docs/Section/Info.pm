# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Info - Project info documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Info;

=head1 DESCRIPTION

A documentation section describing Parrot's project info.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Info;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Info::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Project Information', 
		'info.html', 
		'The conventional, generally all-caps, project information files which contain assorted bits and pieces of information about the distribution.',
		$self->new_group('Documentation', '',
			$self->new_item('General information about licences, prerequisites, and building instructions.', 'README'),
			$self->new_item('This file lists what\'s new in each version.', 'NEWS'),
			$self->new_item('A plan for Parrot.', 'docs/ROADMAP'),
			$self->new_item('A list of things that need doing in Parrot.', 'TODO'),
			$self->new_item('This is a description of the steps someone should follow when they have to prepare a new version for release.', 'RELEASE_INSTRUCTIONS'),
		),
		$self->new_group('Legal', '',
			$self->new_item('The licences under which Parrot is distributed.', 'LICENSES/Artistic', 'LICENSES/gpl.txt'),
		),
		$self->new_group('Status', '',
			$self->new_item('A table showing which aspects of Parrot run on various platforms.', 'PLATFORMS'),
			$self->new_item('Contains the version number of the distribution.', 'VERSION'),
			$self->new_item('The presence of this file indicates that the distribution is a development version.', 'DEVELOPING'),
		),
		$self->new_group('People', '',
			$self->new_item('A list of some of the Parrot developers with CVS commit access.', 'RESPONSIBLE_PARTIES'),
			$self->new_item('A list of some of people who have contributed to Parrot.', 'CREDITS'),
		),
		$self->new_group('Contents', 'See the <code>ExtUtils::Manifest</code> documentation for more information about MANIFEST files.',
			$self->new_item('Lists all the files in the distribution, with their metadata.', 'MANIFEST'),
			$self->new_item('Lists all the generated files, i.e. the files that will be added to the distribution after configuration and installing.', 'MANIFEST.generated'),
			$self->new_item('Specifies the files to leave out of MANIFEST.', 'MANIFEST.SKIP'),
		),
		$self->new_group('History', '',
			$self->new_item('Provide a timeline of changes made to the project.', 'ChangeLog'),
			$self->new_item('Documents incompatible changes to Parrot that invalidate existing bytecode files. This is the new experimental alternative to the fingerprint produced by build_tools/fingerprint_c.pl.', 'PBC_COMPAT'),
		),
	);
}

=back

=cut

1;
