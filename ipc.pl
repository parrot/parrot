#! perl

use strict;
use warnings;
use lib qw(lib);

use IO::Select;
use IPC::Open3;
use Symbol;
use Test::More;

use Parrot::Test::HBDB;

# TODO Signal handler for SIGPIPE

my $pid;

# Signal handler for SIGCHLD
#$SIG{'CHLD'} = sub {
    #my $sig = shift;
    #print "Received SIG$sig\n" if waitpid($pid, 0) > 0;
#};

my $hbdb = "./hbdb hello.pbc";

# Not used yet
my $bad_cmd = qr/Undefined command: "\w+". Try "help"./;

# Run hbdb
$pid = open3(\*HBDB_STDIN, \*HBDB_STDOUT, \*HBDB_STDERR, $hbdb);

# Enter fake command
print HBDB_STDIN "this_is_not_a_command\n";
#print HBDB_STDIN "^D";
close HBDB_STDIN;

waitpid($pid, 0);

my $select = IO::Select->new();

# Add STDOUT/STDERR to IO::Select object
$select->add(\*HBDB_STDOUT, \*HBDB_STDERR);

# Wait until STDOUT/STDERR can be read
my @fd_ready = $select->can_read();

# Iterate through filehandles ready to be read
foreach my $fd (@fd_ready) {
    next unless defined $fd;

    # Check whether it's STDOUT or STDERR
    if (fileno($fd) == fileno(\*HBDB_STDERR)) {
        print "HBDB_STDERR: $_" while <HBDB_STDERR>;
    }
    else {
        print "HBDB_STDOUT: $_" while <HBDB_STDOUT>;
    }

    # Remove filehandle from list if reached EOF
    $select->remove($fd) if eof($fd);
}

