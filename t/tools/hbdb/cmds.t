#! perl

# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/tools/hbdb/cmds.t - tests for the HBDB debugger

=head1 SYNOPSIS

    prove t/tools/hbdb/cmds.t

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
#use Parrot::Test::HBDB tests => 3;
use Parrot::Test::HBDB 'no_plan';

my $pir  = join $PConfig{slash}, qw(t tools hbdb testlib hello.pir);
my $bad_cmd = 'this_is_not_a_command';
my $err_msg = qr|Undefined command: "\w+"\. Try "help"\.|;

{
    my $hbdb    = Parrot::Test::HBDB->new();
    $hbdb->start();
    # Enter fake command
    $hbdb->cmd_output_like(
        $bad_cmd,
        $err_msg,
        'HBDB with no file or args, given bad command'
    );
}

{
    my $hbdb    = Parrot::Test::HBDB->new();
    $hbdb->start($pir, '');
    # Enter fake command
    $hbdb->cmd_output_like(
        $bad_cmd,
        $err_msg,
        'HBDB with file but no args, given bad command'
    );
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    $hbdb->start($pir, '');

    my $cmd  = 'help';
    my $expected = qr/List of commands:/m;
    # Enter "help" command
    $hbdb->cmd_output_like(
        $cmd,
        $expected,
        "HBDB: Help command; got 'List' line"
    );
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    $hbdb->start($pir, '');

    my $cmd  = 'help';
    my $expected = qr/backtrace\s+Print backtrace of current continuation chain\.\s+break\s+Sets a breakpoint at the specified location\./m;
    # Enter "help" command
    $hbdb->cmd_output_like(
        $cmd,
        $expected,
        "HBDB: Help command; got 'backtrace' and 'break' lines"
    );
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    $hbdb->start($pir, '');

    my $cmd  = 'help';
    my $expected = qr/Type "help" followed by a command name for full documentation\./m;
    # Enter "help" command
    $hbdb->cmd_output_like(
        $cmd,
        $expected,
        "HBDB: Help command; got 'Type \"help\"' line"
    );
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    my $cmd  = 'list';

    my $output = <<OUTPUT;


1     #! parrot
2     
3     .sub 'main' :main
4         say "Starting at line 4"
5         say "About to call foo()"
6         foo()
7         say "Back in main() at line 7"
8         say "About to quit"
9     .end
10    
OUTPUT

    $hbdb->start($pir, '');

    $hbdb->cmd_output_is($cmd, $output, 'HBDB: List command');
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    my $cmd  = 'list 3,9';

    my $output = <<OUTPUT;


3     .sub 'main' :main
4         say "Starting at line 4"
5         say "About to call foo()"
6         foo()
7         say "Back in main() at line 7"
8         say "About to quit"
9     .end
OUTPUT

    $hbdb->start($pir, '');

    $hbdb->cmd_output_is($cmd, $output, 'HBDB: List command');
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    my $cmd  = 'list 6,6';

    my $output = <<OUTPUT;


6         foo()
OUTPUT

    $hbdb->start($pir, '');

    $hbdb->cmd_output_is($cmd, $output, 'HBDB: List command');
}

{
    my $hbdb = Parrot::Test::HBDB->new();
    my $cmd  = 'list 15';

    my $output = <<OUTPUT;


10    
11    .sub 'foo'
12        say "This is foo() at line 12"
13        say "About to call bar()"
14        bar()
15    .end
16    
17    .sub 'bar'
18        say "This is bar() at line 18"
19        say "About to call baz()"
OUTPUT

    $hbdb->start($pir, '');

    $hbdb->cmd_output_is($cmd, $output, 'HBDB: List command');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

