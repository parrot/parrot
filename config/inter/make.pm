# Copyright (C) 2001-2007, Parrot Foundation.

=head1 NAME

config/inter/make.pm - make utility

=head1 DESCRIPTION

Determines whether C<make> is installed and if it's actually GNU C<make>.

=cut

package inter::make;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils qw( :inter capture_output check_progs );

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is make installed};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;
    my $util        = 'make';
    my $prompt      = "Do you have a make utility like 'gmake' or 'make'?";

    my $verbose = $conf->options->get('verbose');

    # undef means we don't have GNU make... default to not having it
    $conf->data->set( gmake_version => undef );

    my $candidates;
    if ( $^O eq 'cygwin') {
        # On Cygwin prefer make over nmake.
        $candidates = ['gmake', 'make'];
    }
    elsif ($conf->option_or_data('cc') =~ /cl(\.exe)?$/i) {
        # Windows, Visual C++, prefer nmake
        # This test should use something more stable than the compiler
        # executable name.  'msvcversion' might be good, but is determined
        # after this check.
        $candidates = [ 'nmake', 'mingw32-make', 'gmake', 'make' ];
    }
    else {
        # Default
        $candidates = ['gmake', 'mingw32-make', 'nmake', 'make'];
    }

    my $prog;

    # check the candidates for a 'make' program in this order:
    # environment ; option ; probe ; ask ; default
    # first pick wins.
    $prog ||= $ENV{ uc($util) };
    $prog ||= $conf->options->get($util);
    $prog ||= check_progs( $candidates, $verbose );
    if ( !$prog ) {
        $prog = ( $conf->options->get('ask') )
            ? prompt( $prompt, $prog ? $prog : $conf->data->get($util) )
            : $conf->data->get($util);
    }

    # never override the user.  If a non-existent program is specified then
    # the user is responsible for the consequences.
    if ( defined $prog ) {
        $conf->data->set( $util => $prog );
        $self->set_result('yes');
    }
    else {
        $prog = check_progs( $candidates, $verbose );

        unless ($prog) {

            # fall back to default
            $self->set_result('no');
            return 1;
        }
    }

    my ( $stdout, $stderr, $ret ) = capture_output( $prog, '--version' );

    # don't override the user even if the program they provided appears to be
    # broken
    if ( $ret == -1 and !$conf->options->get('ask') ) {
        # fall back to default
        $self->set_result('no');
        return 1;
    }

    # if '--version' returns a string assume that this is gmake.
    if ( $stdout =~ /GNU \s+ Make \s+ (\d+) \. (\d+)/x ) {
        $conf->data->set( gmake_version => "$1.$2" );
    }

    $conf->data->set( $util => $prog );
    $self->set_result('yes');

    # setup make_C
    _set_make_c($conf, $prog);

    return 1;
}

sub _set_make_c {
    my ($conf, $prog) = @_;
    if ( $conf->data->get('gmake_version') ) {
        $conf->data->set( make_c => "+$prog -C" );
    }
    else {
        # The default value is fine.
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
