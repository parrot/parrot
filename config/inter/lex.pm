# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/lex.pm - lexical analyzer generator

=head1 DESCRIPTION

Determines whether C<lex> is installed and if it's actually C<flex> of
least the user-specified minimum version, defaulting to 2.5.33.

=cut

package inter::lex;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils qw( :inter capture_output check_progs );

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is lex installed};
    $data{result}      = q{};
    return \%data;
}

my @lex_defaults =
    defined( $ENV{TEST_LEX} )
    ? $ENV{TEST_LEX}
    : qw( flex lex );

my $default_required = '2.5.33';

sub runstep {
    my ( $self, $conf ) = @_;
    my $util    = 'lex';
    my $prompt  = "Do you have a lexical analyzer generator like flex or lex?";

    my $verbose = $conf->options->get('verbose');

    # undef means we don't have flex... default to not having flex
    $conf->data->set( flex_version => undef );

    unless ( $conf->options->get('maintainer') ) {
        $conf->data->set( $util => 'echo' );
        $self->set_result('skipped');
        return 1;
    }

    # precedence of sources for the program:
    # default -> probe -> environment -> option -> ask
    my $prog = $conf->options->get($util);
    unless ($prog) {
        $prog = $ENV{ uc($util) };
    }

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if ( defined $prog ) {
        $conf->data->set( $util => $prog );
        $self->set_result('user defined');
        return 1;
    }
    else {
        $prog = check_progs( [@lex_defaults], $verbose );
        if ( !$prog ) {
            $self->set_result('no lex program was found');
            return;
        }
        else {

            if ( $conf->options->get('ask') ) {
                $prog = prompt( $prompt, $prog ? $prog : $conf->data->get($util) );
            }
            my ( $stdout, $stderr, $ret ) = capture_output( $prog, '--version' );

            # don't override the user even if the program they provided
            # appears to be broken
            if ( $ret == -1 and !$conf->options->get('ask') ) {

                # fall back to default
                $self->set_result('lex program does not exist or does not understand --version');
                return;
            }
            elsif ( $stdout =~ /f?lex .*? (\d+) \. (\d+) \. (\d+)/x ) {

                # if '--version' returns a string assume that this is flex.
                # flex calls it self by $0 so it will claim to be lex
                # if invoked as `lex`
                my ( $prog_major, $prog_minor, $prog_patch ) = ( $1, $2, $3 );
                my $prog_version = "$1.$2.$3";

                # is there a version requirement?
                my $req = $conf->options->get('flex_required');
                unless ( defined $req ) {
                    $req = $default_required;
                }
                if ($req) {
                    my ( $rmajor, $rminor, $rpatch ) = ( $req =~ / ^ (\d+) \. (\d+) \. (\d+) $ /x );
                    if ( !defined $rmajor ) {
                        $self->set_result("could not understand flex version requirement");
                        return;
                    }
                    elsif (
                        $prog_major < $rmajor
                        or (    $prog_major == $rmajor
                            and $prog_minor < $rminor )
                        or (    $prog_major == $rmajor
                            and $prog_minor == $rminor
                            and $prog_patch < $rpatch )
                        )
                    {
                        $self->set_result( "found flex version $prog_version"
                                . " but at least $rmajor.$rminor.$rpatch is required" );
                        return;
                    }
                    else {
                        1;    # lack an explicit 'else' here
                    }
                }
                $conf->data->set( flex_version => $prog_version );
                $self->set_result("flex $prog_version");
                $conf->data->set( $util => $prog );
                return 1;
            }
            else {
                $self->set_result('lex program does not exist or does not understand --version');
                return;
            }
        }
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
