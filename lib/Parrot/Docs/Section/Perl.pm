# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Perl - Perl documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Perl;

=head1 DESCRIPTION

A documentation section describing Perl modules in Parrot.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Perl;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Perl::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Perl Modules', 'perl.html', '',
		$self->new_group('Operations', '',
			$self->new_item('Ops to C Code Generation', 
			    'lib/Parrot/OpsFile.pm', 'lib/Parrot/Op.pm',
			    'lib/Parrot/OpLib',
			    'lib/Parrot/OpTrans.pm', 'lib/Parrot/OpTrans'),
		),
		$self->new_group('Data Types', '',
			$self->new_item('', 'lib/Parrot/Types.pm'),
			$self->new_item('', 'lib/Parrot/String.pm'),
			$self->new_item('', 'lib/Parrot/Key.pm'),
		),
		$self->new_group('PMCs', '',
			$self->new_item('', 'lib/Parrot/Pmc2c.pm'),
			$self->new_item('', 'lib/Parrot/Vtable.pm'),
		),
		$self->new_group('Bytecode', '',
			$self->new_item('Packfile modules', 
				'lib/Parrot/PackFile.pm', 'lib/Parrot/PackFile'),
			$self->new_item('', 
				'lib/Parrot/PakFile2.pm', 'lib/Parrot/PakFile2.xs'),
		),
		$self->new_group('IO', '',
			'lib/Parrot/Distribution.pm', 'lib/Parrot/IO'),
		$self->new_group('Documentation', '', 
            $self->new_item('', 'lib/Parrot/Docs/Item.pm'),
            $self->new_item('', 'lib/Parrot/Docs/Group.pm'),
            $self->new_item('', 'lib/Parrot/Docs/Section.pm'),
            $self->new_item('', 'lib/Parrot/Docs/POD2HTML.pm'),
            $self->new_item('', 'lib/Parrot/Docs/HTMLPage.pm'),
            $self->new_item('', 'lib/Parrot/Docs/File.pm'),
		    $self->new_item('', 'lib/Parrot/Docs/Directory.pm'),
		    $self->new_item('Documentation Sections', 'lib/Parrot/Docs/Section')
		),
		$self->new_group('Configuration', '',
			$self->new_item('', 'lib/Parrot/BuildUtil.pm'),
			$self->new_item('', 'lib/Parrot/Configure'),
			$self->new_item('', 'lib/Parrot/Config.pm'),
		),
		$self->new_group('Testing', '',
			$self->new_item('', 'lib/Parrot/Test.pm'),
		),
    );
}

=back

=cut

1;
