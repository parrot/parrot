# Copyright (C) 2005, The Perl Foundation.
# $Id$

package init::hints::msys;

use strict;

sub runstep
{
    my ($self, $conf) = @_;

    $conf->data->set(
        ld            => '$(PERL) /bin/perlld',
        ld_load_flags => '-shared ',
        libs          =>
            '-lmsvcrt -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 ',
        ncilib_link_extra => 'src/libnci_test.def',
    );
}

1;
