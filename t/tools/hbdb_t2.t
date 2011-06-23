#! perl

# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/tools/hbdb_t2.t - tests for the HBDB debugger

=head1 SYNOPSIS

    prove t/tools/hbdb_t2.t

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

use IO::Select;
use IPC::Open3;
use Test::More;

use Parrot::Config;
use Parrot::Test::HBDB tests => 1;

# Signal handler for SIGCHLD:
# Don't write to "HBDB_STDIN" anymore when child has exited
$SIG{'CHLD'} = sub {
    close HBDB_STDIN if fileno HBDB_STDIN;
};

my $pbc     = generate_pbc("t/tools/testlib/hello.pir");
my $hbdb    = "./hbdb $pbc";

my $bad_cmd = "this_is_not_a_command";
my $err_msg = qr|\(hbdb\) Undefined command: "\w+". Try "help".|;

# Start HBDB
my $pid = open3(\*HBDB_STDIN, \*HBDB_STDOUT, \*HBDB_STDERR, $hbdb);

# Enter fake command
print HBDB_STDIN "$bad_cmd\n";
close HBDB_STDIN;

waitpid $pid, 0;

# Add HBDB_STDOUT and HBDB_STDERR to IO::Select object
my $select = IO::Select->new();
$select->add(\*HBDB_STDOUT, \*HBDB_STDERR);

# Wait until one of the filehandles can be read
my @fh_ready = $select->can_read();

# Iterate through filehandles
foreach my $fh (@fh_ready) {
    next unless defined $fh;

    # Only read from HBDB_STDERR for bad commands
    if (fileno $fh  == fileno \*HBDB_STDERR) {
        my @lines = <HBDB_STDERR>;

        like($lines[0], $err_msg, "Test bad command");
    }

    # Remove filehandle from list if reached EOF
    $select->remove($fh) if eof($fh);
}

# Remove generated .pbc file
unlink $pbc;

sub generate_pbc {
    my $pir = shift;
    my $pbc = $pir;

    my $parrot  = ".$PConfig{slash}$PConfig{test_prog}";

    $pbc =~ s|\.pir|\.pbc|i;

    eval { system "$parrot -o $pbc $pir" };
    diag("Failed to generate $pbc") if $@;

    return $pbc;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

