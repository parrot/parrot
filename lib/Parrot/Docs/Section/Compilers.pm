# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
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

use Parrot::Docs::Section;
@Parrot::Docs::Section::Compilers::ISA = qw(Parrot::Docs::Section);

use Parrot::Distribution;

=item C<new()>

Returns a new section.

=cut

sub new
{
    my $self = shift;
    
    return $self->SUPER::new(
        'Compilers', 'compilers.html', '',
        $self->new_group( 'AST', '', 'compilers/ast' ),
        $self->new_group( 'IMCC', '', 'compilers/imcc' ),
        $self->new_group( 'PGE', '', 'compilers/pge' ),
        $self->new_group( 'TGE', '', 'compilers/tge' ),
    );
}

=back

=cut

1;
