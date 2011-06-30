#! perl

# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/tools/cmds.t - tests for the HBDB debugger

=head1 SYNOPSIS

    prove t/tools/cmds.t

=head1 DESCRIPTION

Tests that the HBDB debugger recognizes commands correctly. This is done by
creating an interactive "debug session" and inputing both real and fake
commands. The resulting output is then compared with the expected output.

=head1 REQUIREMENTS

This test script requires you to build HBDB, by running "make hbdb". If this
requirement has not been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Parrot::Config;
use Parrot::Test::HBDB tests => 2;

my $pir  = join $PConfig{slash}, qw(t tools hbdb testlib hello.pir);
my $hbdb = Parrot::Test::HBDB->new();

test_bad_cmd();
test_help_cmd();

sub test_bad_cmd {
    my $bad_cmd = 'this_is_not_a_command';
    my $err_msg = qr|Undefined command: "\w+". Try "help".|;

    # Start HBDB
    $hbdb->start($pir, '');

    # Enter fake command
    $hbdb->cmd_output_like($bad_cmd, $err_msg, 'HBDB: Bad command');
}

sub test_help_cmd {
    my $cmd    = 'help';

    # FIXME This output is wrong b/c open3() is stupid
    my $output = qr/\(hbdb\) \(hbdb\) /;

    #my $output = <<OUTPUT;
#/List of commands:

#(.*(\\s+--\\s+).*)+
#
#Type "help" followed by a command name for full documentation.
#Command name abbreviations are allowed if it's unambiguous.
#/m
#OUTPUT

    # Start HBDB
    $hbdb->start($pir, '');

    # Enter "help" command
    $hbdb->cmd_output_like($cmd, $output, 'HBDB: Help command');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

