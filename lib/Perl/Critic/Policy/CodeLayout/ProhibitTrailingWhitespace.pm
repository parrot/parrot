# $Id$
package Perl::Critic::Policy::CodeLayout::ProhibitTrailingWhitespace;

# Copyright (C) 2007-2007, The Perl Foundation.

use strict;
use warnings;
use Perl::Critic::Utils;
use Perl::Critic::Violation;
use base 'Perl::Critic::Policy';

=head1 NAME

Perl::Critic::Policy::CodeLayout::ProhibitTrailingWhitespace

=head1 DESCRIPTION

Parrot source code should be free from trailing tabs and spaces.

=cut

our $VERSION = '0.1';
$VERSION = eval $VERSION;    ## no critic

my $desc = q{Found trailing whitespace};
my $expl = q{All perl source in parrot should not have trailing whitespace};

#----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOW }
sub applies_to       { return 'PPI::Document' }

#----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, $doc ) = @_;

    my $content = $doc->content();
    my @lines = split /\n/, $content;

    foreach my $line (@lines) {
        if ( $line =~ m{.?[ \t]+$}m ) {
            return $self->violation( $desc, $expl, $doc );
        }
    }

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
