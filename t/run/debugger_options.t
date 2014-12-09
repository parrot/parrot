#!perl
# Copyright (C) 2005-2014, Parrot Foundation.

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

use Test::More;
use Parrot::Config;
use Parrot::Test tests => 1;
use Parrot::Configure::Utils qw{ capture_output };

my $PARROT_DEBUGGER = ".$PConfig{slash}parrot_debugger";

# looking at the no flag arguments error message
my ( $stdout, $stderr, $success ) = capture_output( "$PARROT_DEBUGGER --help" );
Parrot::Test::convert_line_endings($stderr);
is( $stderr, "parrot_debugger takes no -x or --xxxx flag arguments\n",
    'Debugger flag argument error message' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
