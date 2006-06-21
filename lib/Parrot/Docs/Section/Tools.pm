# Copyright (C) 2006, The Perl Foundation.
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

sub new
{
    my $self = shift;
    
    return $self->SUPER::new(
        'Tools', 'tools.html', '',
        $self->new_group('Configuration', '',
            $self->new_item('', 'tools/dev/as2c.pl'),
            $self->new_item('', 'tools/dev/cc_flags.pl'),
            $self->new_item('', 'tools/build/nativecall.pl'),
            $self->new_item('', 'tools/build/jit2c.pl'),
            $self->new_item('', 'tools/build/vtable_h.pl'),
            $self->new_item('', 'tools/build/vtable_extend.pl'),
        ),
        $self->new_group('Bytecode', '',
            $self->new_item('', 'tools/build/pbc2c.pl'),
            $self->new_item('', 'tools/dev/pbc_header.pl'),
        ),
        $self->new_group('QA', '',
            $self->new_item('', 'parrotbug'),
            $self->new_item('', 'tools/dev/check_source_standards.pl'),
            $self->new_item('', 'tools/docs/pod_errors.pl'),
            $self->new_item('', 'tools/dev/manicheck.pl'),
            $self->new_item('', 'tools/dev/run_indent.pl'),
        ),
        $self->new_group('Documentation', '',
            $self->new_item('', 'tools/dev/extract_file_descriptions.pl'),
            $self->new_item('', 'tools/dev/lib_deps.pl'),
            $self->new_item('', 'tools/dev/parrot_coverage.pl'),
            $self->new_item('', 'tools/docs/write_docs.pl'),
        ),
        $self->new_group('Building', '',
            $self->new_item('', 'tools/build/c2str.pl'),
            $self->new_item('', 'tools/build/dynoplibs.pl'),
            $self->new_item('', 'tools/build/dynpmc.pl'),
            $self->new_item('', 'tools/build/fingerprint_c.pl'),
            $self->new_item('', 'tools/build/ops2c.pl'),
            $self->new_item('', 'tools/build/ops2pm.pl'),
            $self->new_item('', 'tools/build/parrot_config_c.pl'),
            $self->new_item('', 'tools/build/pmc2c.pl'),
            $self->new_item('', 'tools/build/revision_c.pl'),
            $self->new_item('', 'tools/dev/gen_manifest_skip.pl'),
            $self->new_item('', 'tools/dev/install_files.pl'),
            $self->new_item('', 'tools/dev/mk_manifests.pl'),
            $self->new_item('', 'tools/dev/mk_manifest_and_skip.pl'),
            $self->new_item('', 'tools/dev/rebuild_miniparrot.pl'),
            $self->new_item('', 'tools/dev/symlink.pl'),
        ),
        $self->new_group('Testing', '',
            $self->new_item('', 'tools/dev/mk_native_pbc'),
        ),
        $self->new_group('Benchmarking', '',
            $self->new_item('', 'tools/dev/bench_op.pir'),
            $self->new_item('', 'tools/dev/parrotbench.pl'),
        ),
        $self->new_group('Utilities', '',
            $self->new_item('', 'tools/build/list_unjitted.pl'),
            $self->new_item('', 'tools/dev/gen_class.pl'),
            $self->new_item('', 'tools/dev/nm.pl'),
            $self->new_item('', 'tools/util/ncidef2pasm.pl'),
            $self->new_item('', 'tools/util/smokeserv-README.pod'),
        ),
        $self->new_group('Possibly obsolete', '',
            $self->new_item('', 'tools/dev/gen_charset_tables.pl'),
            $self->new_item('', 'tools/dev/rebuild_miniparrot.pl'),
        ),
    );
}

=back

=cut

1;
