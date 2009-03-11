#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

my $perlbin = `../../../parrot_config perl`;
my $builddir = `../../../parrot_config build_dir`;
my $slash = `../../../parrot_config slash`;
my $make = `../../../parrot_config make`;

chomp($perlbin);
chomp($builddir);
chomp($slash);
chomp($make);

my $build_tool = $perlbin . " "
               . $builddir
               . $slash
               . "tools"
               . $slash
               . "dev"
               . $slash
               . "gen_makefile.pl";

my %makefiles = (
    "config/makefiles/root.in" => "Makefile",
);

foreach my $template (keys %makefiles) {
    my $makefile = $makefiles{$template};
    print "Creating $makefile\n";
    system("$build_tool $template $makefile");
}

print <<"END";

You can now use '$make' to build ABC.
END

exit;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
