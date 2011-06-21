#! perl

use strict;
use warnings;

use IPC::Open3;
use IO::Select;
use Symbol;

my $pid;

# Signal handler for SIGCHLD
#$SIG{'CHLD'} = sub {
    #my $sig = shift;
    #print "Received SIG$sig\n" if waitpid($pid, 0) > 0;
#};

my ($stdin, $stdout, $stderr);
my $hbdb = "./hbdb hello.pbc";

# IPC::Open3 is stupid
$stderr = gensym();

# Not used yet
my $bad_cmd = qr/Undefined command: "\w+". Try "help"./;

# Run hbdb
$pid = open3($stdin, $stdout, $stderr, $hbdb);

#waitpid($pid, 0);

# Enter fake command
print $stdin "this_is_not_a_command";
close $stdin;

my $select = IO::Select->new();

# Add STDOUT/STDERR to IO::Select object
$select->add($stdout, $stderr);

# Wait until STDOUT/STDERR can be read
my (@fd_ready) = $select->can_read();

# Iterate through filehandles ready to be read
foreach my $fd (@fd_ready) {
    next unless defined $fd;

    # Check whether it's STDOUT or STDERR
    if (fileno($fd) == fileno($stderr)) {
        print "STDERR: $_" while <$stderr>;
    }
    else {
        print "STDOUT: $_" while <$stdout>;
    }

    # Remove filehandle from list if reached EOF
    $select->remove($fd) if eof($fd);
}

