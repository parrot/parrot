# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/run/options.t - test parrot command line options

=head1 SYNOPSIS

    % perl -Ilib t/run/options.t

    % perl t/harness t/run/options.t

=head1 DESCRIPTION

Tests C<parrot> command line options.

=cut

use strict;
use Parrot::Test tests => 10;
use Test::More;
use Parrot::Config;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# looking at the help message
my $help_message = `$PARROT --help`;
is( substr( $help_message, 0, 23 ), 'parrot [Options] <file>', 'Start of help message' );
ok( index( $help_message, '-t --trace [flags]' ) > 0, 'help for --trace' );

# executing a PIR file
is( `$PARROT t/run/first.pir`, "first\n", 'running first.pir' );
is( `$PARROT t/run/second.pir`, "second\n", 'running second.pir' );

# Ignore further arguments
is( `$PARROT t/run/first.pir second.pir`, "first\n", 'ignore a pir-file' );
is( `$PARROT t/run/first.pir asdf`, "first\n", 'ignore nonsense' );

# Test the trace option
is( `$PARROT -t t/run/first.pir`, "first\n", 'option -t' );
TODO:
{
   local $TODO = '--trace behaves not like -t';
   is( `$PARROT --trace t/run/first.pir`, "first\n", 'option --trace' );
};
is( `$PARROT -t t/run/first.pir t/run/second.pir`, "second\n", 'option -t with flags' );
is( `$PARROT --trace t/run/first.pir t/run/second.pir`, "second\n", 'option --trace with flags' );
