# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/io1.pasm - IO Example

=head1 SYNOPSIS

    % ./parrot examples/assembly/io1.pasm

=head1 DESCRIPTION

Simple open/seek/write/close on a file. No output. You should check
where the file is going to be before you run this.

=cut

#open P0, "/tmp/seektest.dat", ">"
open P0, "seektest.dat", ">"
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
end

=head1 SEE ASLO

F<examples/assembly/io2.pasm>.

=cut
