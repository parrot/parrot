# Copyright (C) 2004, Parrot Foundation.
# $Id: Examples.pm 37201 2009-03-08 12:07:48Z fperrad $

=head1 NAME

Parrot::Docs::Section::PDDs - PDDs documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::PDDs;

=head1 DESCRIPTION

A documentation section describing all the Parrot design documents.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::PDDs;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Docs::Item;
use Parrot::Docs::Group;

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Parrot Design Documents (PDDs)',
        'pdds.html',
        '',
        $self->new_group( 'Design Documents',  '', 'docs/pdds' ),
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
