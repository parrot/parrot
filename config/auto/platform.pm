# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

config/auto/platform.pm - Platform Files

=head1 DESCRIPTION

Generates a list of platform object files.

=cut

package auto::platform;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Generate a list of platform object files};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $self->_set_implementations($conf);

    return 1;
}

sub _set_implementations {
    my $self = shift;
    my $conf = shift;
    my $platform = $conf->data->get('platform');
    my @impls = qw/
        io.c
        socket.c
        file.c
        time.c
        encoding.c
        env.c
        dl.c
        math.c
        itimer.c
        exec.c
        misc.c
        hires_timer.c
        sysmem.c
        uid.c
        error.c
        asm.s
        entropy.c
        /;
    my @impl_files;

    for my $im (@impls) {
        my $impl_file;

        if ( -e "src/platform/$platform/$im" ) {
            $impl_file = "src/platform/$platform/$im";
        }
        elsif ( -e "src/platform/generic/$im" ) {
            $impl_file = "src/platform/generic/$im";
        }
        else {
            next;
        }

        $impl_file =~ s/\.[cs]\z/\$(O)/;

        push(@impl_files, $impl_file);
    }

    $conf->data->set(TEMP_platform_o => join(' ', @impl_files));

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
