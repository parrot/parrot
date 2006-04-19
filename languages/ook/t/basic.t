#! perl -w
# $Id$

use strict;
use warnings;
use lib qw( ../../../lib );

use Test::More tests => 1;
use Parrot::Test  ();
use Parrot::Config qw(%PConfig);
use File::Spec;

# execute hello.ook
my $path_to_parrot = Parrot::Test::path_to_parrot();
my $languages_dir  = File::Spec->catdir( $path_to_parrot, 'languages' );
my $ook            = "cd $path_to_parrot && .$PConfig{slash}parrot$PConfig{exe} languages/ook/ook.pbc";

# Test running hello.ook

my $out_fn = File::Spec->catfile( $languages_dir, 'ook', 'hello.out' );

# STDERR is written into same output file
my $exit_code = Parrot::Test::run_command( 
    "$ook languages/ook/hello.ook",
    STDOUT => $out_fn,
    STDERR => $out_fn 
                                         );
  
my $out = Parrot::Test::slurp_file( $out_fn );
is( $out, << 'OUT', 'output from hello.ook' );
Hello World!
OUT

# TODO: test executing test.ook
