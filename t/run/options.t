#!perl
# Copyright (C) 2005-2007, The Perl Foundation.
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
use Test::More;
use Parrot::Test tests => 12;
use Parrot::Config;
use File::Temp 0.13 qw/tempfile/;
use File::Spec;

my $PARROT = ".$PConfig{slash}$PConfig{test_prog}";

# looking at the help message
my $help_message = `$PARROT --help`;
is( substr( $help_message, 0, 23 ), 'parrot [Options] <file>', 'Start of help message' );
ok( index( $help_message, '-t --trace [flags]' ) > 0, 'help for --trace' );

# setup PIR files for tests below
my $first  = create_pir_file('first');
my $second = create_pir_file('second');

# executing a PIR file
is( `"$PARROT" "$first"`,  "first\n",  'running first.pir' );
is( `"$PARROT" "$second"`, "second\n", 'running second.pir' );

# Ignore further arguments
is( `"$PARROT" "$first" "$second"`, "first\n", 'ignore a pir-file' );
is( `"$PARROT" "$first" "asdf"`,    "first\n", 'ignore nonsense' );

# redirect STDERR to avoid warnings
my $redir = '2>' . File::Spec->devnull;

# --pre-process-only
# This is just sanity testing 
# Coredumps after the output has been written are ignored
is( `"$PARROT" -E "$first" $redir`, <<'END_EXPECTED', 'option -E' );
.sub main :main
print "first\n" 
.end
END_EXPECTED

is( `"$PARROT" --pre-process-only "$first" $redir`, <<'END_EXPECTED', 'option --pre-process-only' );
.sub main :main
print "first\n" 
.end
END_EXPECTED

# Test the trace option
is( `"$PARROT" -t "$first" $redir`, "first\n", 'option -t' );
TODO:
{
    local $TODO = '--trace behaves not like -t';
    is( `"$PARROT" --trace "$first" $redir`, "first\n", 'option --trace' );
}
is( `"$PARROT" -t "$first" "$second" $redir`,      "second\n", 'option -t with flags' );
is( `"$PARROT" --trace "$first" "$second" $redir`, "second\n", 'option --trace with flags' );

# clean up temporary files
unlink $first;
unlink $second;

sub create_pir_file {
    my $word = shift;

    my ( $fh, $filename ) = tempfile( UNLINK => 0, SUFFIX => '.pir' );
    print $fh qq{.sub main :main\n\tprint "$word\\n"\n.end};
    close $fh;

    return $filename;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
