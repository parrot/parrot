# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Tools - Tools docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Tools;
	
	my $section = Parrot::Docs::Section::Tools->new;

=head1 DESCRIPTION

A documentation section describing Parrot tools.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Tools;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Tools::ISA = qw(Parrot::Docs::Section);

use Parrot::Docs::Item;

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Tools', 'tools.html', '',
		$self->group('Configuration', '',
			$self->item('', 'tools/dev/cc_flags.pl'),
			$self->item('', 'build_tools/build_nativecall.pl'),
			$self->item('', 'build_tools/jit2h.pl'),
			$self->item('', 'build_tools/vtable_h.pl'),
		),
		$self->group('Bytecode', '',
			$self->item('', 'build_tools/fingerprint_c.pl'),
			$self->item('', 'build_tools/pbc2c.pl'),
		),
		$self->group('QA', '',
			$self->item('', 'tools/dev/check_source_standards.pl'),
			$self->item('', 'tools/dev/run_indent.pl'),
			$self->item('', 'tools/docs/pod_errors.pl'),
		),
		$self->group('Documentation', '',
			$self->item('', 'tools/dev/extract_file_descriptions.pl'),
			$self->item('', 'tools/dev/lib_deps.pl'),
			$self->item('', 'tools/dev/parrot_coverage.pl'),
			$self->item('', 'tools/docs/write_docs.pl'),
		),
		$self->group('Building', '',
			$self->item('', 'tools/dev/manicheck.pl'),
			$self->item('', 'tools/dev/genrpt.pl'),
			$self->item('', 'tools/dev/mk_manifests.pl'),
			$self->item('', 'tools/dev/install_files.pl'),
			$self->item('', 'tools/dev/rebuild_miniparrot.pl'),
		),
		$self->group('Testing', '',
			$self->item('', 'tools/dev/mk_native_pbc'),
		),
		$self->group('Utilities', '',
			$self->item('', 'util'),
		),
	);
}

=back

=cut

1;
