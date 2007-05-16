# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

package init::hints::msys;

use strict;
use warnings;

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->data->set(
        ld            => '$(PERL) /bin/perlld',
        ld_load_flags => '-shared ',
        libs =>
'-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 ',
        ncilib_link_extra => 'src/libnci_test.def',
        has_socklen_t     => 0,
    );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
