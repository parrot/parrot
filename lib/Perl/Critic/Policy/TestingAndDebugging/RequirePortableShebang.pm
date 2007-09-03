# $Id$
package Perl::Critic::Policy::TestingAndDebugging::RequirePortableShebang;

# Copyright (C) 2006-2007, The Perl Foundation.

use strict;
use warnings;
use Perl::Critic::Utils;
use Perl::Critic::Violation;
use base 'Perl::Critic::Policy';

our $VERSION = '0.1';
$VERSION = eval $VERSION;    ## no critic

my $desc = q{Found platform-specific perl shebang line};
my $expl = q{Perl source in parrot should use the platform-independent shebang line: #! perl};

#----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOW }
sub applies_to       { return 'PPI::Document' }

#----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, $doc ) = @_;

    # grab all elements in the document
    my @elements = $doc->children();

    foreach my $element (@elements) {

        # if the element isn't on the first line, it's not a valid shebang
        return if ( $element->location()->[0] != 1 );

        # look for a perl shebang line
        if ( $element =~ m/^\#! .*? perl/xs ) {

            # if we have a platform-specific shebang, barf
            if (
                $element !~ m{^\#!     # get shebang part at line's start
                               [ ]*    # any number of spaces
                               perl    # the word 'perl'
                               \s      # a space
                              }xms
                )
            {
                my $sev = $self->get_severity();
                return Perl::Critic::Violation->new( $desc, $expl, $element, $sev );
            }
            else {
                return;    # shebang line ok, return
            }
        }
    }

    # we didn't find any dodgy shebang lines, so return with success
    return;
}

1;

__END__

=head1 NAME

Perl::Critic::Policy::TestingAndDebugging::RequirePortableShebang

=head1 DESCRIPTION

Make sure the perl shebang line isn't platform-specific i.e. uses something
like C<#!/usr/bin/perl> instead of the cross-platform C<#! perl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
