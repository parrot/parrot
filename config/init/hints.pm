# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

config/init/hints.pm - Platform Hints

=head1 DESCRIPTION

Loads the platform and local hints files, modifying the defaults set up in
F<config/init/default.pm>.

=cut

package init::hints;

use strict;
use warnings;

use File::Spec::Functions qw/catfile/;
use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Load platform and local hints files};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n[ ");

    my $hints_used = 0;
    my $hints_file;

    my $osname = lc( $conf->data->get('OSNAME_provisional') );
    $osname = 'linux' if ($osname eq 'gnukfreebsd');

    my $hints_file_name = $conf->options->get('hintsfile') || $osname ;
    $hints_file = catfile('config', 'init', 'hints', "$hints_file_name.pm");

    if ( -f $hints_file ) {
        my $hints_pkg = "init::hints::" . $hints_file_name;

        $conf->debug("$hints_pkg ");

        eval "use $hints_pkg";
        die $@ if $@;

        # Call the runstep method if it exists.
        # Otherwise the step must have done its work when it was loaded.
        $hints_pkg->runstep( $conf, @_ ) if $hints_pkg->can('runstep');
        $hints_used++;

        $hints_pkg = "init::hints::local";
        $conf->debug("$hints_pkg ");
        eval "use $hints_pkg";

        unless ($@) {
            $hints_pkg->runstep( $conf, @_ ) if $hints_pkg->can('runstep');
            $hints_used++;
        }
    }
    else {
        $conf->debug("No $hints_file found.  ");
    }

    if ( $hints_used == 0 ) {
        $conf->debug("(no hints) ");
    }

    $conf->debug("]");

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
