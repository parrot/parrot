#!/usr/bin/perl -w

use strict;
use FindBin;

use lib '../../lib';
use Parrot::Config;

my $urmc = "$FindBin::RealBin$PConfig{slash}..$PConfig{slash}urmc";
my $compile = "-c -s";
my $run = "-s";

sub compile_test {
    my $file = shift;

    my $ret = system ("$urmc $compile $FindBin::RealBin$PConfig{slash}$file");
    die "TEST FAILED: $file ($ret)\n" if $ret;
    print "OK: $file\n";
}

sub run_test {
    my ($file, $expect) = @_;
    my $ret = `$urmc $run $FindBin::RealBin$PConfig{slash}$file`;
    die "TEST FAILED: $file (got $ret expected $expect)\n" if ($ret != $expect);
    print "OK: $file\n";
}

compile_test("testpars.urm");
run_test("testmmu.urm", 100);
run_test("testmmu2.urm", 2);
run_test("testmmu3.urm", 92);
