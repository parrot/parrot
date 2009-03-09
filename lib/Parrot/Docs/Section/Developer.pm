# Copyright (C) 2004, Parrot Foundation.
# $Id: Developer.pm 37201 2009-03-08 12:07:48Z fperrad $

=head1 NAME

Parrot::Docs::Section::Developer - Developer documentation section

=head1 SYNOPSIS

        use Parrot::Docs::Section::Developer;

=head1 DESCRIPTION

A documentation section describing all the POD documentation in F<docs>.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Developer;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Developer Documentation',
        'developer.html',
        '',
        $self->new_group(
            'Internals',
            '',
            $self->new_item( 'Bytecode Format (PBC)', 'docs/parrotbyte.pod'),
            $self->new_item( 'Bytecode Packfile API', 'docs/packfile-c.pod'),
            $self->new_item( 'Memory Internals', 'docs/memory_internals.pod'),
            $self->new_item( 'Just In Time Compilation', 'docs/jit.pod'),
            $self->new_item( 'PMC Vtables', 'docs/vtables.pod'),
            $self->new_item( 'Embedding Parrot', 'docs/embed.pod'),
            $self->new_item( '', 'docs/native_exec.pod' ),
            $self->new_item( '', 'docs/porting_intro.pod' ),
        ),
        $self->new_group( 'Development Notes',     '', 'docs/dev' ),
        $self->new_group( 'Articles',                      '', 'docs/user/pir' ),
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
