# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::PCT_Tutorial - Tutorial of Parrot Comiler Tools

=head1 SYNOPSIS

    use Parrot::Docs::Section::PCT_Tutorial;

=head1 DESCRIPTION

A tutorial series on building a compiler with the Parrot Compiler Tools.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::PCT_Tutorial;

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
        'PCT Tutorial',
        'PCT_Tutorial.html',
        '',
        $self->new_group(
            'Tutorial of Parrot Compiler Tools',
            '',
            $self->new_item( 'Episode 1: Introduction',
                'examples/languages/squaak/doc/tutorial_episode_1.pod'),
            $self->new_item( 'Episode 2: Poking in Compiler Guts',
                'examples/languages/squaak/doc/tutorial_episode_2.pod'),
            $self->new_item( 'Episode 3: Squaak Details and First Steps',
                'examples/languages/squaak/doc/tutorial_episode_3.pod'),
            $self->new_item( 'Episode 4: PAST Nodes and More Statements',
                'examples/languages/squaak/doc/tutorial_episode_4.pod'),
            $self->new_item( 'Episode 5: Variable Declaration and Scope',
                'examples/languages/squaak/doc/tutorial_episode_5.pod'),
            $self->new_item( 'Episode 6: Scope and Subroutines',
                'examples/languages/squaak/doc/tutorial_episode_6.pod'),
            $self->new_item( 'Episode 7: Operators and Precedence',
                'examples/languages/squaak/doc/tutorial_episode_7.pod'),
            $self->new_item( 'Episode 8: Hashtables and Arrays',
                'examples/languages/squaak/doc/tutorial_episode_8.pod'),
            $self->new_item( 'Episode 9: Wrap up and Conclusion',
                'examples/languages/squaak/doc/tutorial_episode_9.pod'),
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
