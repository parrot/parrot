#! perl -w

use strict;
use FindBin;

use lib '../../lib';
use Parrot::Config;

my $urmc = "$PConfig{perl} $FindBin::RealBin$PConfig{slash}..$PConfig{slash}urmc";
my $compile = "-c -s";
my $run = "-s";

sub compile_test {
    my $file = shift;

    my $ret = system ("$urmc $compile $FindBin::RealBin$PConfig{slash}$file");
    if ($ret) {
	print STDERR "TEST FAILED: $file ($ret)\n";
	return;
	}
    print "OK: $file\n";
}

sub run_test {
    my ($file, $expect) = @_;
    my $ret = `$urmc $run $FindBin::RealBin$PConfig{slash}$file`;
    if (!$ret) {
	print STDERR "TEST FAILED: $file didn't return a value, Parrot crashed?\n";
	return;
    }
    if ($ret != $expect) {
	print STDERR "TEST FAILED: $file (got $ret expected $expect)\n";
	return;
    }
    print "OK: $file\n";
}

compile_test("testpars.urm");
run_test("testmmu.urm", 100);
run_test("testmmu2.urm", 2);
run_test("testmmu3.urm", 92);
