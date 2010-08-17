# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Compilers - Compilers documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::Compilers;

=head1 DESCRIPTION

A documentation section describing all compilers in Parrot.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Compilers;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Distribution;

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Compilers',
        'compilers.html',
        '',
        $self->new_group( 'IMCC', 'the Intermediate Code Compiler for Parrot', 'compilers/imcc' ),
        $self->new_group( 'PGE',  'the Parrot Grammar Engine',                 'compilers/pge' ),
        $self->new_group( 'TGE',  'the Tree Grammar Engine',                   'compilers/tge' ),
        $self->new_group( 'PCT',  'Parrot Compiler Toolkit',    'compilers/pct' ),
        $self->new_group( 'JSON', 'JavaScript Object Notation', 'compilers/data_json' ),
        $self->new_group( 'PIRC', 'a PIR Compiler',             'compilers/pirc' ),
        $self->new_group( 'NCIGEN', 'Native Call Interface Generator', 'compilers/ncigen' ),
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
