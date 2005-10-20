# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pir/io.pir - IO Example

=head1 SYNOPSIS

    % ./parrot examples/pir/io.pir

=head1 DESCRIPTION

Simple open/seek/write/close on a file. After the file is written it is read in again
and printed to STDOUT.
You should check where the file is going to be before you run this.

=cut

.sub 'example' :main
    .local string test_fn 
    test_fn = "tmp_example_io.tmp"
    P0 = open test_fn, ">"
    seek P0, 300, 0
    # 64bit version of seek with high 32bits = 0
    #seek IO, P0, 0, 400, 0
    print P0, "test1\n"
    print P0, "test2\n"
    print P0, "test3\n"
    seek P0, 0, 0
    print P0, "test4\n"
    print P0, "test5\n"
    close P0

    P0 = open test_fn, "<"
    S0 = read P0, 1024 
    print S0
.end

=head1 SEE ALSO

F<examples/io>.

=cut
