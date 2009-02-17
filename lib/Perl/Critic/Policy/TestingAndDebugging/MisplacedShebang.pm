# $Id$
package Perl::Critic::Policy::TestingAndDebugging::MisplacedShebang;

# Copyright (C) 2006-2007, Parrot Foundation.

use strict;
use warnings;
use Perl::Critic::Utils;
use Perl::Critic::Violation;
use base 'Perl::Critic::Policy';

our $VERSION = '0.1';
$VERSION = eval $VERSION;    ## no critic

my $desc = q{Found misplaced shebang line};
my $expl = q{Perl source in parrot needs shebang line on first line of file};

#----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOW }
sub applies_to       { return 'PPI::Document' }

#----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, $doc ) = @_;

    # grab all elements in the document
    my @elements = $doc->children();

    foreach my $element (@elements) {

        # look for a shebang line
        if ( $element =~ m/^\#!/xs ) {

            # if the shebang line isn't on the first line, report the
            # policy violation
            if ( $element->location()->[0] != 1 ) {
                my $sev = $self->get_severity();
                return Perl::Critic::Violation->new( $desc, $expl, $element, $sev );
            }
        }
    }

    # we didn't find any dodgy shebang lines, so return with success
    return;
}

1;

__END__

=head1 NAME

Perl::Critic::Policy::TestingAndDebugging::MisplacedShebang

=head1 DESCRIPTION

Make sure that the shebang line occurs on the first line of the file.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
