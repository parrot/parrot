#!perl
use strict;
use warnings;

use File::Find;
use File::Spec;


# change these accordingly...
my $PARROT    = File::Spec->canonpath( '../../parrot' );

my $TEST_DIR  = "examples";

sub process_file {
    # only test files
    return unless -f $_;
    # only test Text files
    return unless -T $_;
    # only test .pir files
    return unless $_ =~ /.*\.pir$/;


    my $file = File::Spec->canonpath( $File::Find::name );
    print "\nParsing $file...\n";
    my @cmd = ( "$PARROT", 'pir.pbc', $file );
    system(@cmd) == 0
        or die "Cannot run command [@cmd]: $!";
}


find({ wanted => \&process_file, no_chdir => 1 }, $TEST_DIR);

