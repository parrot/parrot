# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/m4 - Check whether GNU m4 works

=head1 DESCRIPTION

Determines whether GNU m4 exists on the system. It is OK when it doesn't exist.
Currently GNU m4 is only used for doublechecking Parrot m4.

=cut

package auto::m4;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;

    return {
        description => q{Determining whether GNU m4 is installed},
        result      => q{},
    };
}

our $verbose;

sub runstep {
    my ( $self, $conf ) = @_;

    $verbose = $conf->options->get('verbose');
    print "\n" if $verbose;

    # This seems to work for GNU m4 1.4.2
    # Under FreeBSD 'm4 --version' waits eternally for input,
    # so pipe some input to it-
    my $output = capture_output('echo "foo" | m4 --version') || '';
    print $output, "\n" if $verbose;
    my $has_gnu_m4 = ( $output =~ m/GNU\s+[mM]4/ ) ? 1 : 0;

    $conf->data->set( has_gnu_m4 => $has_gnu_m4 );
    $self->set_result( $has_gnu_m4 ? 'yes' : 'no' );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
