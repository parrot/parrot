#
# jump.pasm
#
# A program to test the 'jump_i' opcode.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

MAIN:       print "Jump test.\n"
            print "Jumping to subroutine...\n"
            set_addr I1, SUB
            jump I1

RET:        print "Returned from subroutine!\n"
            end

SUB:        print "Entered subroutine...\n"
            set_addr I2, RET
            jump I2

