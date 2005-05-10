#! perl -w
# $Id$

use Data::Dumper;
use Test::More tests => 1;
use Parrot::Test;

use FindBin;

# execute hello.ook
my $language_dir = $FindBin::Bin . '/..'; 
my $parrot       = "../../parrot";

# flatten filenames (don't use directories)
my $out_f = 'hello.out';

# STDERR is written into same output file
my $exit_code = Parrot::Test::run_command( 
    "$parrot ook.pbc hello.ook",
    CD     => $language_dir,
    STDOUT => $out_f,
    STDERR => $out_f 
        );
  

is( Parrot::Test::slurp_file($out_f), << 'OUT', 'output from hello.ook' );
Hello World!
OUT

# clean up
unlink( $out_f );

# TODO: test executing hello.ook
