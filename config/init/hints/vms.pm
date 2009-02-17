# Copyright (C) 2005, Parrot Foundation.
# $Id$

package init::hints::vms;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->data->set(
        ccflags => qq{/Prefix=All/Obj=.obj/NoList/include="./include"/nowarn},
        perl    => "MCR $^X",
        exe     => ".exe"
    );

    {
        local $^W;    # no warnings on redefinition

        *Parrot::Configure::Compiler::cc_build = sub {
            my $conf = shift;
            my ( $cc, $ccflags ) = $conf->data->get(qw(cc ccflags));
            system("$cc $ccflags test.c") and die "C compiler died!";
            system("link/exe=test test")  and die "Link failed!";
        };

        *Parrot::Configure::Compiler::cc_run = sub {
            my $conf = shift;
            `mcr []test`;
        };
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
