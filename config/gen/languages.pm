# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/languages.pm - Build files for language implementations

=head1 DESCRIPTION

Config step for languages.
Builds C<languages/Makefile> and loops over list of languages.
Special support for C<languages/tcl>.

A space seperated list of languages can be passed in with
the option 'languages'.
An empty list of languages is OK.

=cut

package gen::languages;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':gen';

sub _init {
    my $self = shift;

    return 
        { description => q{Configuring languages},
          args        => [ qw( languages ) ],
          result      => q{},
        };
}

sub runstep {
    my ( $self, $conf ) = @_;

    genfile( 'config/gen/makefiles/languages.in' => 'languages/Makefile' );

    my $languages = $conf->options->get('languages');
    $languages = qq{
        APL amber abc befunge bf cardinal c99 cola ecmascript forth HQ9plus
        jako lisp lua m4 nqp ook parrot_compiler perl5 perl6 pheme PIR plumhead
        pugs punie pynie regex scheme tap tcl urm WMLScript Zcode
    } unless defined $languages;

    foreach my $language ( split ' ', $languages ) {        # split ' ' splits on all whitespace
        if ( $language ne 'tcl' ) {
            genfile(
                "languages/$language/config/makefiles/root.in"     => "languages/$language/Makefile"
            );
        }
        else {
            # tcl has more than one Makefile
            # currently this is handled as a special case
            genfile(
                "languages/$language/config/makefiles/examples.in" => "languages/$language/examples/Makefile"
            );
            genfile(
                "languages/$language/config/makefiles/root.in"     => "languages/$language/Makefile",
                expand_gmake_syntax                                => 1,
            );
        }
    }

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
