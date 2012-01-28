#!perl
# Copyright (C) 2005-2010, Parrot Foundation.

=head1 NAME

t/run/options.t - test parrot command line options

=head1 SYNOPSIS

    % prove t/run/options.t

=head1 DESCRIPTION

Tests C<parrot> command line options.

=cut

use strict;
use warnings;
use lib qw( lib . ../lib ../../lib );

use Test::More tests => 57;
use Parrot::Config;
use File::Temp 0.13 qw/tempfile/;
use File::Spec;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# looking at the help message
for my $help ('-h', '--help') {
    my $help_message = `$PARROT $help`;
    is( substr( $help_message, 0, 23 ), 'parrot [Options] <file>', "Start of $help message" );
    ok( index( $help_message, '-t --trace [flags]' ) > 0, '$help for --trace' );
}

# looking at the debug help message
{
    my $help_message = `"$PARROT" --help-debug`;
    ok( index( $help_message, '--imcc-debug' ) >= 0, '--help-debug for --imcc-debug' );
    ok( index( $help_message, '--parrot-debug' ) >= 0, '--help-debug for --parrot-debug' );
    ok( index( $help_message, '--trace' ) >= 0, '--help-debug for --trace' );
}

# setup PIR files for tests below
my $first_pir_file  = create_pir_file('first');
my $second_pir_file = create_pir_file('second');

# executing a PIR file
is( `"$PARROT" "$first_pir_file"`,  "first\n",  'running first.pir' );
is( `"$PARROT" "$second_pir_file"`, "second\n", 'running second.pir' );

# Ignore further arguments
is( `"$PARROT" "$first_pir_file" "$second_pir_file"`, "first\n", 'ignore a pir-file' );
is( `"$PARROT" "$first_pir_file" "asdf"`,             "first\n", 'ignore nonsense' );

# redirect STDERR to avoid warnings
my $redir = '2>' . File::Spec->devnull();

# --pre-process-only
# This is just sanity testing
my $expected_preprocesses_pir = <<'END_PIR';

.macro 

.sub main :main

say "first" 

.end

END_PIR
for my $e ('-E', '--pre-process-only') {
    is( `"$PARROT" $e "$first_pir_file" $redir`, $expected_preprocesses_pir, "option $e" );
}

# Test the trace option
for my $t ('-t', '--trace') {
    is( `"$PARROT" $t "$first_pir_file" $redir`, "first\n", "option $t" );
    is( `"$PARROT" $t "$first_pir_file" "$second_pir_file" $redir`, "second\n", "option $t with flags" );
}

## test the -R & --runcore options
{
my $cmd;

## this test assumes these cores work on all platforms (a safe assumption)
for my $val (qw/ slow fast bounds trace /) {
    for my $opt ( '-R ', '--runcore ', '--runcore=' ) {
        $cmd = qq{"$PARROT" $opt$val "$second_pir_file" $redir};
        is( qx{$cmd}, "second\n", "<$opt$val> option)" ) or diag $cmd;
    }
}

for my $d8 ('-D 8', '--parrot-debug 8', '--parrot-debug=8') {
    $cmd = qq{"$PARROT" $d8 -R slow "$second_pir_file" $redir};
    is( qx{$cmd}, "second\n", "$d8 doesn't touch STDOUT" );

    $cmd = qq{"$PARROT" $d8 -R slow "$second_pir_file" 2>&1};
    like( qx{$cmd}, qr/Parrot VM: slow core/, "$d8 prints runcore name" );
}
}

# Test --runtime-prefix
like( qx{$PARROT --runtime-prefix}, qr/^.+$/, "--runtime-prefix" );

# TT #1797: check for warning error and mask off "did it crash?" bits
needs_an_argument('--gc-dynamic-threshold');

# GC nursery-size check for warning error and mask off "did it crash?" bits
needs_an_argument('--gc-nursery-size');

{
    my $output = qx{$PARROT --gc-nursery-size=51 2>&1 };
    my $exit   = $? & 127;
    like( $output, qr/maximum GC nursery size is 50%/,
                     '--gc-nursery-size max warning' );
    is( $exit, 0, '... and should not crash' );
}

# Test --leak-test/--destroy-at-end
for my $leak ( '--leak-test', '--destroy-at-end' ) {
    is( qx{$PARROT $leak "$first_pir_file"}, "first\n", '--leak-test' );
}

#make sure that VERSION matches the output of --version
open(my $version_fh, "<", "VERSION") or die "couldn't open VERSION: $!";
my $file_version = <$version_fh>;
chomp($file_version);
close($version_fh);
for my $version ('-V', '--version') {
    like( qx{$PARROT $version}, qr/.*${file_version}.*/, "VERSION matches $version" );
}

# Test --hash-seed
needs_an_argument('--hash-seed');

for my $hash ('--hash-seed ', '--hash-seed=') {
    my $arg = 'xyz';
    my $output = qx{"$PARROT" $hash$arg 2>&1};
    my $exit = $? & 127;
    like( $output, qr/invalid hash seed/, "$hash rejects bad hash" );
    is( $exit, 0, '... and should not crash' );

    $arg = 'f00';
    is( qx{"$PARROT" $hash$arg "$first_pir_file" $redir}, "first\n",
        "$hash takes a hex value" );
}

# Test -w/--warnings
{
    # Create a simple file that throws an Undef warning.
    my ($fh, $filename) = tempfile( UNLINK => 0, SUFFIX => '.pir', UNLINK => 1 );
    print $fh <<'END_PIR';
.sub 'main' :main
   $P0 = new 'Undef'
   $S0 = $P0
.end
END_PIR
    close $fh;

    unlike( qx{"$PARROT" "$filename" 2>&1}, qr/Undef/,
        'no complaint without warning flag' );

    for my $w ('-w', '--warnings') {
        like( qx{"$PARROT" $w "$filename" 2>&1}, qr/Undef/,
            "$w warns about Undef" );
    }
    
    unlink $filename;
}



# clean up temporary files
unlink $first_pir_file;
unlink $second_pir_file;

sub create_pir_file {
    my $word = shift;

    my ( $fh, $filename ) = tempfile( UNLINK => 0, SUFFIX => '.pir', UNLINK => 1 );
    print $fh <<"END_PIR";

.macro println(word)
   say .word
.endm

.sub main :main
  .println( "$word" )
.end
END_PIR
    close $fh;

    return $filename;
}

# Check that an option checks for its argument
sub needs_an_argument {
    my $arg    = shift;
    my $output = qx{$PARROT $arg 2>&1 };
    my $exit   = $? & 127;
    like( $output, qr/$arg needs an argument/, "$arg needs argument warning" );
    is( $exit, 0, '... and should not crash' );
}


## GH #346 test remaining options

# TODO: Add tests for more options
# Make sure you include attached versions
# -I --include PATH
# -L --library PATH
# -X --dynext PATH
# -G --no-gc
# -h --gc ms2|gms|ms|inf
#    --gc-min-threshold
#    --gc-debug
# -. --wait
# FILE  (.pasm, .pir, .pbc)

# These are IMCC options.  Add tests here or in t/compilers/imcc ?
# -d --imcc-debug HEX
# -v --verbose
# -o --output FILE
#        .pasm, .pbc, .o endings
#    --output-pbc
# -O --optimize INT
# -a --pasm
# -c --pbc
# -r --run-pbc
# -y --yydebug
# -p --profile (in docs/running.pod, not in --help)

# These IMCC options are tested here.  Move them?
# -E --pre-process-only

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4

#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
