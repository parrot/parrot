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
		$self->group('Operations', '',
			$self->item('', 'lib/Parrot/Op.pm'),
			$self->item('', 'lib/Parrot/OpsFile.pm'),
			$self->item('', 'lib/Parrot/OpTrans'),
		),
		$self->group('Data Types', '',
			$self->item('', 'lib/Parrot/Types.pm'),
			$self->item('', 'lib/Parrot/String.pm'),
		),
		$self->group('PMCs', '',
			$self->item('', 'lib/Parrot/Pmc.pm'),
			$self->item('', 'lib/Parrot/Pmc2c.pm'),
			$self->item('', 'lib/Parrot/Vtable.pm'),
		),
		$self->group('Bytecode', '',
			$self->item('', 'lib/Parrot/PackFile'),
			$self->item('', 'lib/Parrot/PakFile2.pm', 'lib/Parrot/PakFile2.xs'),
		),
		$self->group('IO', '',
			$self->item('', 'lib/Parrot/IO'),
		),
		$self->group('Documentation', '',
			$self->item('', 'lib/Parrot/Docs'),
		),
		$self->group('Configuration', '',
			$self->item('', 'lib/Parrot/BuildUtil.pm'),
			$self->item('', 'lib/Parrot/Configure'),
			$self->item('', 'lib/Parrot/Config.pm'),
		),
		$self->group('Installation', '',
			$self->item('', 'lib/Make.pm'),
		),
		$self->group('Testing', '',
			$self->item('', 'lib/Parrot/Test.pm'),
			$self->item('', 'lib/Test'),
		),
		$self->group('Debugging', '',
			$self->item('', 'lib/Parrot/Key.pm'),
		),
		$self->group('Utilities', '',
			$self->item('', 'lib/Digest/Perl'),
			$self->item('', 'lib/Class'),
			$self->item('', 'lib/Parse'),
			$self->item('', 'lib/Text'),
		),
	);
}

=back

=cut

1;
