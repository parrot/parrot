# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Perl - Perl docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Perl;
	
	my $section = Parrot::Docs::Section::Perl->new;

=head1 DESCRIPTION

A documentation section describing Perl modules in Parrot.

=head2 Methods

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
			$self->new_item('', 'lib/Parrot/Op.pm'),
			$self->new_item('', 'lib/Parrot/OpsFile.pm'),
			$self->new_item('', 'lib/Parrot/OpTrans'),
		),
		$self->new_group('Data Types', '',
			$self->new_item('', 'lib/Parrot/Types.pm'),
			$self->new_item('', 'lib/Parrot/String.pm'),
		),
		$self->new_group('PMCs', '',
			$self->new_item('', 'lib/Parrot/PMC.pm'),
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
		$self->new_group('Documentation', '', 'lib/Parrot/Docs'),
		$self->new_group('Configuration', '',
			$self->new_item('', 'lib/Parrot/BuildUtil.pm'),
			$self->new_item('', 'lib/Parrot/Configure'),
			$self->new_item('', 'lib/Parrot/Config.pm'),
		),
		$self->new_group('Installation', '',
			$self->new_item('', 'lib/Make.pm'),
		),
		$self->new_group('Testing', '',
			$self->new_item('', 'lib/Parrot/Test.pm'),
			$self->new_item('', 'lib/Test'),
		),
		$self->new_group('Debugging', '',
			$self->new_item('', 'lib/Parrot/Key.pm'),
		),
		$self->new_group('Utilities', '',
			$self->new_item('', 'lib/Digest/Perl'),
			$self->new_item('', 'lib/Class'),
			$self->new_item('', 'lib/Parse'),
			# This give an unsightly warning so I'm skipping it.
			# $self->new_item('', 'lib/Text'),
		),
	);
}

=back

=cut

1;
