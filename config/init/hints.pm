# Copyright (C) 2001-2003, The Perl Foundation.
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

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Loading platform and local hints files};
    $data{args}        = [ qw( cc verbose define ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');

    my $hints_used = 0;

    my $hints = "init::hints::" . lc( $conf->data->get_p5('OSNAME') );

    print "[ $hints " if $verbose;

    eval "use $hints";
    die $@ if $@;

    # Call the runstep method if it exists.
    # Otherwise the step must have done its work when it was loaded.
    $hints->runstep( $conf, @_ ) if $hints->can('runstep');
    $hints_used++;

    $hints = "init::hints::local";
    print "$hints " if $verbose;
    eval "use $hints";

    unless ($@) {
        $hints->runstep( $conf, @_ ) if $hints->can('runstep');
        $hints_used++;
    }

    if ( $hints_used == 0 and $verbose ) {
        print "(no hints) ";
    }

    print "]" if $verbose;

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
