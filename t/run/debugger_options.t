#!perl
# Copyright (C) 2005-2013, Parrot Foundation.

=head1 NAME

t/run/debugger_options.t - test parrot debugger command line options

=head1 SYNOPSIS

    % prove t/run/debugger_options.t

=head1 DESCRIPTION

Tests C<parrot_debugger> command line options.

=cut

use strict;
use warnings;
use lib qw( lib . ../lib ../../lib );

use Test::More tests => 1;
use Parrot::Config;
use IO::CaptureOutput qw{ qxx };

my $PARROT_DEBUGGER = ".$PConfig{slash}parrot_debugger";

# looking at the no flag arguments error message
my ( $stdout, $stderr, $success ) = qxx( "$PARROT_DEBUGGER --help" );
is( $stderr, "parrot_debugger takes no -x or --xxxx flag arguments\n",
    'Debugger flag argument error message' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
