# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Config - Configuration docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Config;
	my $section = Parrot::Docs::Section::Config->new;

=head1 DESCRIPTION

A documentation section describing Parrot's configuration system.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Config;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Config::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Configuration', 'config.html', 'Parrot is configured by running
the <i>Configure.pl</i> script. This is essentially just a wrapper around
<code>Parrot::Configure::RunSteps</code>. The steps are listed below in the order in
which they are performed.',
		$self->new_item('', 'Configure.pl'),
		$self->new_group('Initialization', '',
			$self->new_item('', 'config/init/manifest.pl'),
			$self->new_item('', 'config/init/data.pl'),
			$self->new_item('', 'config/init/miniparrot.pl'),
			$self->new_item('', 'config/init/hints.pl'),
			$self->new_item('', 'config/init/optimize.pl'),
			$self->new_item('', 'config/init/headers.pl'),
		),
		$self->new_group('User Dialogues', '',
			$self->new_item('', 'config/inter/progs.pl'),
			$self->new_item('', 'config/inter/types.pl'),
			$self->new_item('', 'config/inter/ops.pl'),
			$self->new_item('', 'config/inter/exp.pl'),
			$self->new_item('', 'config/inter/pmc.pl'),
		),
		$self->new_group('System Tests', '',
			$self->new_item('', 'config/auto/ccflags.pl'),
			$self->new_item('', 'config/auto/alignptrs.pl'),
			$self->new_item('', 'config/auto/headers.pl'),
			$self->new_item('', 'config/auto/sizes.pl'),
			$self->new_item('', 'config/auto/byteorder.pl'),
			$self->new_item('', 'config/auto/pack.pl'),
			$self->new_item('', 'config/auto/format.pl'),
			$self->new_item('', 'config/auto/gcc.pl'),
			$self->new_item('', 'config/auto/isreg.pl'),
			$self->new_item('', 'config/auto/jit.pl'),
			$self->new_item('', 'config/auto/funcptr.pl'),
			$self->new_item('', 'config/auto/cgoto.pl'),
			$self->new_item('', 'config/auto/inline.pl'),
			$self->new_item('', 'config/auto/gc.pl'),
			$self->new_item('', 'config/auto/memalign.pl'),
			$self->new_item('', 'config/auto/signal.pl'),
			$self->new_item('', 'config/auto/env.pl'),
		),
		$self->new_group('File Creation', '',
			$self->new_item('', 'config/gen/icu.pl'),
			$self->new_item('', 'config/gen/config_h.pl'),
			$self->new_item('', 'config/gen/feature_h.pl'),
			$self->new_item('', 'config/gen/config_pm.pl'),
			$self->new_item('', 'config/gen/core_pmcs.pl'),
			$self->new_item('', 'config/gen/parrot_include.pl'),
			$self->new_item('', 'config/gen/makefiles.pl'),
			$self->new_item('', 'config/gen/parrot_include.pl'),
			$self->new_item('', 'config/gen/cflags.pl'),
			$self->new_item('', 'config/gen/myconfig.pl'),
			$self->new_item('', 'config/gen/platform.pl'),
			$self->new_item('', 'config/gen/libparrot_def.pl'),
		),
	);
}

=back

=cut

1;