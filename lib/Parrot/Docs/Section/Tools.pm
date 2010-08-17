# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Tools - Tools documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::Tools;

=head1 DESCRIPTION

A documentation section describing Parrot tools.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Tools;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Docs::Item;

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Tools',
        'tools.html',
        '',
        $self->new_group(
            'Configuration',
            '',
            $self->new_item( '', 'tools/dev/as2c.pl' ),
            $self->new_item( '', 'tools/build/vtable_h.pl' ),
            $self->new_item( '', 'tools/build/vtable_extend.pl' ),
        ),
        $self->new_group(
            'Building',
            '',
            $self->new_item( '', 'docs/configuration.pod' ),
            $self->new_item( '', 'tools/build/c2str.pl' ),
            $self->new_item( '', 'tools/build/parrot_config_c.pl' ),
            $self->new_item( '', 'tools/build/pmc2c.pl' ),
            $self->new_item( '', 'tools/dev/install_files.pl' ),
            $self->new_item( '', 'tools/dev/mk_manifest_and_skip.pl' ),
            $self->new_item( '', 'tools/dev/symlink.pl' ),
            $self->new_item( '', 'tools/dev/mk_native_pbc' ),
        ),
        $self->new_group(
            'Testing',
            '',
            $self->new_item( '', 'parrotbug' ),
            $self->new_item( '', 'tools/dev/manicheck.pl' ),
            $self->new_item( '', 'docs/tests.pod' ),
        ),
        $self->new_group(
            'Documentation',
            '',
            $self->new_item( '', 'tools/dev/lib_deps.pl' ),
            $self->new_item( '', 'tools/dev/parrot_coverage.pl' ),
            $self->new_item( '', 'tools/docs/write_docs.pl' ),
        ),
        $self->new_group(
            'Benchmarking', '',
            $self->new_item( '', 'tools/dev/bench_op.pir' ),
            $self->new_item( '', 'tools/dev/parrotbench.pl' ),
        ),
        $self->new_group(
            'Utilities',
            '',
            $self->new_item( '', 'tools/dev/list_unjitted.pl' ),
            $self->new_item( '', 'tools/dev/gen_class.pl' ),
            $self->new_item( '', 'tools/dev/nm.pl' ),
            $self->new_item( '', 'tools/util/ncidef2pasm.pl' ),
            $self->new_item( '', 'tools/dev/pbc_header.pl' ),
        ),
        $self->new_group(
            'Debugging',
            '',
            $self->new_item( 'Debugging Tools', 'docs/debug.pod'),
            $self->new_item( 'Parrot Debugger', 'docs/debugger.pod'),
        ),
    );
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
