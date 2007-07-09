package Tcl::Test;
use warnings;
use strict;

use lib qw(../lib ../../lib ../../../lib ../../../../lib);
use Parrot::Config;
use File::Spec;

sub import {
    my $parrot = File::Spec->catfile($PConfig{build_dir}, 'parrot');
    my $tcl    = File::Spec->catdir($PConfig{build_dir}, qw(languages tcl));
    my $test   = File::Spec->abs2rel( File::Spec->rel2abs($0), $tcl );

    chdir $tcl;
    if (!exists $ENV{TEST_PROG_ARGS}) {
      $ENV{TEST_PROG_ARGS} = '-G'; # XXX mask a parrot GC bug.
    }
    exec $parrot, $ENV{TEST_PROG_ARGS}, 'tcl.pbc', $test;
}
1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
