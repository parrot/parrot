# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$

=head1 NAME

examples/assembly/jump.pasm - Jumping to subroutine

=head1 SYNOPSIS

    % ./parrot examples/assembly/jump.pasm

=head1 DESCRIPTION

A program to demonstrate the use of the C<jump> opcode.

=cut

MAIN:       print "Jump test.\n"
            print "Jumping to subroutine...\n"
            set_addr I1, SUB
            jump I1

RET:        print "Returned from subroutine!\n"
            end

SUB:        print "Entered subroutine...\n"
            set_addr I2, RET
            jump I2

