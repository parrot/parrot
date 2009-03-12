# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

create_makefiles();

sub create_makefiles {
    my %makefiles = (
        'config/makefiles/root.in' => 'Makefile',
#        'config/makefiles/pmc.in'  => 'src/pmc/Makefile',
#        'config/makefiles/ops.in'  => 'src/ops/Makefile',
    );
    my $build_tool = '../../../tools/dev/gen_makefile.pl';

    foreach my $template (keys %makefiles) {
        my $makefile = $makefiles{$template};
        print "Creating $makefile\n";
        system('perl', $build_tool, $template, $makefile);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

