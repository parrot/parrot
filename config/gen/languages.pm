# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/languages.pm - Build files for language implementations

=head1 DESCRIPTION

Config step for languages.

=cut

package gen::languages;

use strict;
use warnings;

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':gen';

our $description = 'Configuring languages';
our @args        = qw(languages);

sub runstep {
    my ( $self, $conf ) = @_;

    genfile( 'config/gen/makefiles/languages.in' => 'languages/Makefile' );

    my $languages = $conf->options->get('languages');
    $languages = qq{
        APL amber abc befunge bf cardinal c99 cola ecmascript forth HQ9plus
        jako lisp lua m4 nqp ook parrot_compiler pascal perl5 perl6 pheme PIR plumhead
        pugs punie pynie regex scheme tap urm WMLScript Zcode
    } unless defined $languages;

    foreach my $language (split ' ', $languages) {
        genfile( "languages/$language/config/makefiles/root.in" => "languages/$language/Makefile" );
    }

    genfile( 'languages/tcl/config/makefiles/examples.in' => 'languages/tcl/examples/Makefile' );

    genfile(
        'languages/tcl/config/makefiles/root.in' => 'languages/tcl/Makefile',
        expand_gmake_syntax                      => 1,
    );

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
