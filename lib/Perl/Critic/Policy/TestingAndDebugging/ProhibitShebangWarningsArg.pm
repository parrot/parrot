# $Id$
package Perl::Critic::Policy::TestingAndDebugging::ProhibitShebangWarningsArg;

# Copyright (C) 2006-2007, The Perl Foundation.

use strict;
use warnings;
use Perl::Critic::Utils;
use Perl::Critic::Violation;
use base 'Perl::Critic::Policy';

our $VERSION = '0.1';
$VERSION = eval $VERSION;    ## no critic

my $desc = q{Warnings argument of perl shebang found.'};
my $expl = q{All perl source in parrot must 'use warnings;' not the older 'perl -w' usage};

#----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOW }
sub applies_to       { return 'PPI::Document' }

#----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, $doc ) = @_;

    my @elements = $doc->children();

    # look for the shebang line, if any
    foreach my $element (@elements) {

        # if the element isn't on the first line, it's not a valid shebang
        return if ( $element->location()->[0] != 1 );

        if ( $element =~ m/^\#! .*? perl/xgs ) {

            # if the shebang line matches '-w', report the violation
            if ( $element =~ m/-[^w]*w/s ) {
                my $sev = $self->get_severity();
                return Perl::Critic::Violation->new( $desc, $expl, $element, $sev );
            }
            else {
                last;    # shebang line ok; skip to the end of the elements
            }
        }
    }

    # we didn't find any dodgy shebang lines, so return with success
    return;
}

1;

__END__

=head1 NAME

Perl::Critic::Policy::TestingAndDebugging::ProhibitShebangWarningsArg

=head1 DESCRIPTION

Check to see if the old style C<perl -w> shebang line is used to switch on
warnings.  This should be replaced with the newer C<use warnings;> syntax.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
