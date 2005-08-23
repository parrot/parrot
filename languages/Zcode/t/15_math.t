#!/usr/local/bin/perl
# vim:ft=perl:

use strict;
use warnings;

use lib qw(../../lib ../lib);
use Parrot::Config;
use Parrot::Test;
use FindBin;
use File::Spec;

my $Z3_Compiler = "z3.pir";
my $parrot_exe = "parrot" . $PConfig{"exe"};

# Z3 test file should have same name as .t file
(my $Z3_Test = $0) =~ s/\.t$/.z3/;
unless (-e $Z3_Test) { 
    print "1..0 # Skipped; Can't find test file $Z3_Test\n";
    exit;
}

# Location of parrot
# HACK! May not work after install, but then parrot should just be in path
my @dots = ('..');
my @dirs = (
    $PConfig{"build_dir"}, 
    File::Spec->catfile( (@dots) x 2 ), # ../..
    File::Spec->catfile( (@dots) x 3 ), # ../../..
);
my $parrot = $parrot_exe; # just look in path if you don't find it in build dir
for (@dirs) { 
    my $p = File::Spec->catfile($_, $parrot_exe);
    if (-f $p && -x _) {$parrot = $p} 
}
(print "Bail out! Unable to find an executable\n"),exit unless $parrot;

# Figure out where z3.imc is
my $compiler_dir = File::Spec->catfile( $FindBin::Bin, ".." );

# Finally, run the script
my $cmd = "$parrot $Z3_Compiler $Z3_Test";
# From Parrot::Test. CD => dir to run command in, STDOUT => file to redir
&run_command($cmd, CD => $compiler_dir);
