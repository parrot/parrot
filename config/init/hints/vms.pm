# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::vms;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    $conf->data->set(
        ccflags => qq{/Standard=Relaxed_ANSI/Prefix=All/Obj=.obj/NoList/NOANSI_ALIAS/include="./include"},
        perl    => "MCR $^X",
        exe     => "exe"
    );

    {
        local $^W;    # no warnings on redefinition

        *Parrot::Configure::Step::cc_build = sub {
            my ($cc, $ccflags) = $conf->data->get(qw(cc ccflags));
            system("$cc $ccflags test.c") and die "C compiler died!";
            system("link/exe=test test")        and die "Link failed!";
        };

        *Parrot::Configure::Step::cc_run = sub {
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
