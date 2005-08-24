#!/usr/local/bin/perl
# vim:ft=perl:

use strict;
use warnings;

use lib qw(../../../lib ../../lib ../lib);
use Parrot::Config;
use Parrot::Test;
use FindBin;
use File::Spec;

my $Z3_Compiler = "z3.pir";
my $parrot_exe = "parrot" . $PConfig{"exe"};
my $test_dir = "t";

# Figure out where z3.imc is and go there
my $compiler_dir = File::Spec->catdir( $FindBin::Bin, ".." );
chdir($compiler_dir);

# Once we chdir, the Z3 file corresponding to .../t/foo.t will be in t/foo.z3
my (undef, undef ,$tfile) = File::Spec->splitpath( $0 );
(my $z3file = $tfile) =~ s/\.t$/.z3/;
my $Z3_Test = File::Spec->catfile($test_dir, $z3file);
unless (-e $Z3_Test) { 
    print "1..0 # Skipped; Can't find test file $Z3_Test\n";
    exit;
}

# Location of parrot -- note we'll run parrot from inside $compiler_dir
# HACK! May not work after install, but then parrot should just be in path
my @dots = File::Spec->updir; # aka '..'
my @dirs = (
    #$PConfig{"build_dir"}, 
    File::Spec->catfile( (@dots) x 2 ), # ../..
    File::Spec->catfile( (@dots) x 3 ), # ../../..
);
my $parrot = $parrot_exe; # just look in path if you don't find it in build dir
for (@dirs) { 
    my $p = File::Spec->catfile($_, $parrot_exe);
    if (-f $p && -x _) {
	$parrot = $p;
	last;
    } 
}
(print "Bail out! Unable to find an executable\n"),exit unless $parrot;

# Finally, run the script
my $cmd = "$parrot $Z3_Compiler $Z3_Test";
# From Parrot::Test. CD => dir to run command in, STDOUT => file to redir
&run_command($cmd); #, CD => $compiler_dir);
