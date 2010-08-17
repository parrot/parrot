# Copyright (C) 2004, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Ops - Parrot ops documentation section

=head1 SYNOPSIS

        use Parrot::Docs::Section::Ops;

=head1 DESCRIPTION

A documentation section describing the Parrot ops.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Ops;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;
    my $dist = Parrot::Distribution->new;
    my $dir  = $dist->existing_directory_with_name('src/ops');
    my $dyndir = $dist->existing_directory_with_name('src/dynoplibs');

    my @core_ops    = ();
    my @dynamic_ops = ();

    # Filter for only the .ops source files
    foreach my $file ( $dir->files_with_suffix('ops') ) {
        push( @core_ops, $self->new_item( '', $dist->relative_path($file) ) );
    }
    foreach my $dynfile ( $dyndir->files_with_suffix('ops') ) {
        push( @dynamic_ops, $self->new_item( '', $dist->relative_path($dynfile) ) );
    }

    return $self->SUPER::new(
        'Opcodes',
        'ops.html',
        '',
        $self->new_group( 'Opcode Libraries', '', @core_ops ),
        $self->new_group( 'Dynamic Opcode Libraries', '', @dynamic_ops ),
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
