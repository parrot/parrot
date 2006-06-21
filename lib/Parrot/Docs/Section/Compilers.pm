# Copyright (C) 2006, The Perl Foundation.
# $Id: Compilers.pm 11501 2006-02-10 18:27:13Z particle $

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

sub new
{
    my $self = shift;
    
    return $self->SUPER::new(
        'Compilers', 'compilers.html', '',
        $self->new_group( 'IMCC', 'the Intermediate Code Compiler for Parrot',
            'compilers/ast',
            'compilers/imcc' ),
        $self->new_group( 'PGE', 'the Parrot Grammar Engine',
            'compilers/pge' ),
        $self->new_group( 'TGE', 'the Tree Grammar Engine',
            'compilers/tge' ),
        $self->new_group( 'PAST', 'the Parrot/Punie Abstract Syntax Tree',
            'compilers/past' ),
        $self->new_group( 'POST', 'the Parrot/Punie Opcode Syntax Tree',
            'compilers/post' ),
    );
}

=back

=cut

1;
