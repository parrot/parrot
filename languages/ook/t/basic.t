#! perl -w
# $Id$

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Test::More tests => 1;
use Parrot::Test();
use Parrot::Config qw(%PConfig);
use File::Spec;

# execute hello.ook
my $updir         = File::Spec->updir();
my $languages_dir = File::Spec->catdir( $FindBin::Bin, $updir, $updir ); 
my $parrot        = File::Spec->catfile( $updir, 'parrot' . $PConfig{exe} );

# Test running hello.ook

my $out_fn = File::Spec->catfile( 'ook', 'hello.out' );

# STDERR is written into same output file
my $exit_code = Parrot::Test::run_command( 
    "$parrot ook/ook.pbc ook/hello.ook",
    CD     => $languages_dir,
    STDOUT => $out_fn,
    STDERR => $out_fn 
                                         );
  
my $out = Parrot::Test::slurp_file(
                    File::Spec->catfile($languages_dir, $out_fn)
                                  );
is( $out, << 'OUT', 'output from hello.ook' );
Hello World!
OUT

# TODO: test executing test.ook
