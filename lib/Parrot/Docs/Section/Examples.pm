# Copyright (C) 2004, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Examples - Examples documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::Examples;

=head1 DESCRIPTION

A documentation section describing all the Parrot examples.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Examples;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Docs::Item;
use Parrot::Docs::Group;

=item C<new()>

Returns a new section.

=cut

sub new
{
    my $self = shift;
    
    return $self->SUPER::new(
        'Examples', 'examples.html', '',
            $self->new_group('PASM and PIR',         '', 'examples/pasm'),
            $self->new_group('PIR',                  '', 'examples/pir'),
            $self->new_group('Subroutines',          '', 'examples/subs'),
            $self->new_group('IO',                   '', 'examples/io'),
            $self->new_group('Streams',              '', 'examples/streams'),
            $self->new_group('Benchmarking',         '', 'examples/benchmarks'),
            $self->new_group('Speed Comparison',     '', 'examples/mops'),
            $self->new_group('Native Call Interface','', 'examples/nci'),
    );
}

=back

=cut

1;
