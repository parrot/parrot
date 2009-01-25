# Copyright (C) 2006-2009, The Perl Foundation.
# $Id$

=head1 NAME

config/gen/languages.pm - Build files for language implementations

=head1 DESCRIPTION

Config step for languages.  Builds C<languages/Makefile> and loops over
list of languages.  Special support for C<languages/dotnet>.

A space separated list of languages can be passed in with the option
'languages'.  An empty list of languages is OK. This means that only
C<languages/Makefile> will be regenerated.

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
        APL abc
        befunge bf
        cardinal chitchat cola c99
        ecmascript
        forth
        jako json
        lisp lolcode lua
        ook
        parrot_compiler perl6 pheme PIR pipp punie pynie
        regex
        scheme squaak
        urm
        WMLScript
        Zcode
    };
    $data{languages_source} = q{config/gen/makefiles/languages.in};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->genfile( $self->{languages_source} => 'languages/Makefile' );

    my $languages = $conf->options->get('languages');
    $languages = $self->{default_languages} unless defined $languages;

    foreach my $language ( split ' ', $languages ) {        # split ' ' splits on all whitespace
        my $langdir = "languages/$language";
        if ( $language eq 'dotnet' ) {
            # RT#47792
            # languages/dotnet/Configure.pl works only after the root 'perl Configure.pl'.
            # system( 'cd languages/dotnet; perl Configure.pl' );
        }
        elsif ( $language eq 'c99' ) {
            $conf->genfile("$langdir/config/makefiles/root.in"     => "$langdir/Makefile");
            $conf->genfile("$langdir/config/makefiles/cpp.in"      => "$langdir/src/cpp/Makefile");
        }
        elsif ( $language eq 'perl6' ) {
            $conf->genfile("$langdir/config/makefiles/root.in"     => "$langdir/Makefile");
            $conf->genfile("$langdir/config/makefiles/utils.in"    => "$langdir/src/utils/Makefile");
        }
        else {
            $conf->genfile("$langdir/config/makefiles/root.in"     => "$langdir/Makefile"
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
