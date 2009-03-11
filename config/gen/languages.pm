# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

config/gen/languages.pm - Build files for language implementations

=head1 DESCRIPTION

Config step for languages.  Loops over list of languages.

A space separated list of languages can be passed in with the option
'languages'.  An empty list of languages is OK.

=head1 TODO

RT#31633. Languages should know how to configure themselves
and not rely on gen::languages.

=cut

package gen::languages;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Configure languages};
    $data{result} = q{};
    $data{default_languages} = qq{
        bf
        cardinal chitchat cola
        forth
        jako
        lisp
        ook
        parrot_compiler pynie
        regex
        scheme
        urm
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $languages = $conf->options->get('languages');
    $languages = $self->{default_languages} unless defined $languages;

    foreach my $language ( split ' ', $languages ) {        # split ' ' splits on all whitespace
        my $langdir = "languages/$language";
        $conf->genfile("$langdir/config/makefiles/root.in"     => "$langdir/Makefile");
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
