# echo client, connects to echo service and echoes what you type
# You should be running the echo service on your box (port 7)
# Be sure to set PARROT_NET_DEVEL to 1 in io/io_private.h
# and rebuld Parrot or the network layer won't exist
# Shortly we will create an echo server in Parrot and
# combine these 2 into a test suite.

    print "Creating socket.\n"
    # create the socket handle 
    socket P0, 2, 1, 0
    # Pack a sockaddr_in structure with IP and port
    sockaddr S0, 7, "127.0.0.1"
    print "Connecting to port 7 (ECHO)\n"
    connect I0, P0, S0
    print "connect returned "
    print I0
    print "\n"
COMMAND:
    print "echo>"
    read S1, 100
    chopn S1, 1
    length I0, S1
    le I0, 0, END
    concat S1, "\n"
    send I0, P0, S1 
    poll I0, P0, 1, 5, 0
    recv I0, P0, S0
    lt I0, 0, END
    print S0
    branch COMMAND
END:
    close P0
    end


