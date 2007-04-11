#!perl

use strict;
use warnings;
use lib qw( . ../../../lib);
use Test::More;
use Parrot::Config;

# This is the test framework for compilers/pirc.
# We don't need to run Parrot, so run pirc directly
# for each file in the current (/t) directory.
#

my $numtests;
my @files;

# calculate number of tests:
BEGIN {

    # test all files in current directory
    my $dir = ".";

    # get all files
    @files = <$dir/*>;

    # get number of files
    $numtests = @files;
    $numtests--;

}

# set number of tests to be run
use Parrot::Test tests => $numtests;

# start testing:
my $count = 1;

foreach my $file (@files) {

    # skip this file
    next if $file eq "./pirc.t";
    my $cmd = "../pirc $file";
    run_command($cmd);
    ok( $count, "" );
    $count++;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
