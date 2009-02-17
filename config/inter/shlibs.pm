# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/inter/shlibs.pm - Flags for shared libraries.

=head1 DESCRIPTION

Asks the user which flags are needed for compiling position-independent code
for use in shared libraries.  Eventually, other shared-library-related prompts
may end up here.

This is a separate unit from config/inter/progs.pm because the answers depend
on which compiler is in use.  Thus it should come after the gccversion test.

=cut

package inter::shlibs;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':inter';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine flags for building shared libraries};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $cc_shared = $conf->options->get('cc_shared');
    $cc_shared = integrate( $conf->data->get('cc_shared'), $cc_shared );
    $cc_shared = prompt(
        "\nWhat flags instruct your compiler to compile code suitable for use in a shared library?",
        $cc_shared
    ) if $conf->options->get('ask');
    $conf->data->set( cc_shared => $cc_shared );
    $self->set_result( ( $cc_shared =~ m/^ ?$/ ) ? 'done' : $cc_shared );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
