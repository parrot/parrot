# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/io/net_smtp.pasm - SMTP Example

=head1 SYNOPSIS

    % ./parrot examples/io/net_smtp.pasm

=head1 DESCRIPTION

A sample of the network ops. Connects to SMTP (port 25). Doesn't work
very well but at least shows the idea.

You should be running the echo service on your box (port 7). Be sure to
set C<PARROT_NET_DEVEL> to 1 in F<io/io_private.h> and rebuld Parrot or
the network layer won't exist.

=cut

    print "Creating socket.\n"
    # create the socket handle 
    socket P0, 2, 1, 0
    # Pack a sockaddr_in structure with IP and port
    sockaddr S0, 25, "127.0.0.1"
    print "Connecting to port 25 (SMTP)\n"
    connect I0, P0, S0
    print "connect returned "
    print I0
    print "\n"
    bsr helo 
COMMAND:
    print "smtp>"
    read S1, 100
    chopn S1, 1
    length I0, S1
    le I0, 0, END
    eq S1, "help", HELP
    eq S1, "quit", END 
    print "Unknown command\n"
    branch COMMAND
HELP:
    bsr help 
    branch COMMAND
ERROR:
    print "There was an error\n"
END:
    close P0
    end


helo:
    poll I0, P0, 1, 5, 0
    recv I0, P0, S0
    lt I0, 0, ERROR
    print S0
    send I0, P0, "HELO localdomain\n" 
    poll I0, P0, 1, 5, 0
    recv I0, P0, S0
    lt I0, 0, ERROR
    print S0
    ret

help:
    send I0, P0, "HELP\n" 
    poll I0, P0, 1, 5, 0
    recv I0, P0, S0
    print S0
    ret

