#!perl
# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$

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

use Test::More tests => 27;
use Parrot::Config;
use File::Temp 0.13 qw/tempfile/;
use File::Spec;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# looking at the help message
my $help_message = `$PARROT --help`;
is( substr( $help_message, 0, 23 ), 'parrot [Options] <file>', 'Start of help message' );
ok( index( $help_message, '-t --trace [flags]' ) > 0, 'help for --trace' );

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
is( `"$PARROT" -E "$first_pir_file" $redir`, $expected_preprocesses_pir, 'option -E' );
is( `"$PARROT" --pre-process-only "$first_pir_file" $redir`,
    $expected_preprocesses_pir, 'option --pre-process-only' );

# Test the trace option
is( `"$PARROT" -t "$first_pir_file" $redir`, "first\n", 'option -t' );
is( `"$PARROT" --trace "$first_pir_file" $redir`, "first\n", 'option --trace' );
is( `"$PARROT" -t "$first_pir_file" "$second_pir_file" $redir`, "second\n",
    'option -t with flags' );
is( `"$PARROT" --trace "$first_pir_file" "$second_pir_file" $redir`,
    "second\n", 'option --trace with flags' );

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

    $cmd = qq{"$PARROT" -D 8 -R slow "$second_pir_file" $redir};
    is( qx{$cmd}, "second\n", "-r option <$cmd>" );

    $cmd = qq{"$PARROT" -D 8 -R slow "$second_pir_file" 2>&1};
    like( qx{$cmd}, qr/Parrot VM: slow core/, "-r option <$cmd>" );
}

## TT #1150 test remaining options

# Test --runtime-prefix
like( qx{$PARROT --runtime-prefix}, qr/^.+$/, "--runtime-prefix" );

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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
