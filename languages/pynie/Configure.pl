# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use 5.008;

#  Get a list of parrot-configs to invoke.
my @parrot_config_exe = (
    'parrot/parrot_config',
    '../../parrot_config',
    'parrot_config',
);

#  Get configuration information from parrot_config
my %config = read_parrot_config(@parrot_config_exe);
unless (%config) {
    die "Unable to locate parrot_config.";
}

#  Create the Makefile using the information we just got
create_makefiles(%config);

sub read_parrot_config {
    my @parrot_config_exe = @_;
    my %config = ();
    for my $exe (@parrot_config_exe) {
        no warnings;
        if (open my $PARROT_CONFIG, '-|', "$exe --dump") {
            print "Reading configuration information from $exe\n";
            while (<$PARROT_CONFIG>) {
                $config{$1} = $2 if (/(\w+) => '(.*)'/);
            }
            close $PARROT_CONFIG;
            last if %config;
        }
    }
    %config;
}


#  Generate Makefiles from a configuration
sub create_makefiles {
    my %config = @_;
    my %makefiles = (
        'config/makefiles/root.in' => 'Makefile',
#        'config/makefiles/pmc.in'  => 'src/pmc/Makefile',
#        'config/makefiles/ops.in'  => 'src/ops/Makefile',
    );
    my $build_tool = $config{libdir} . $config{versiondir}
                   . '/tools/dev/gen_makefile.pl';

    foreach my $template (keys %makefiles) {
        my $makefile = $makefiles{$template};
        print "Creating $makefile\n";
        system($config{perl}, $build_tool, $template, $makefile);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

