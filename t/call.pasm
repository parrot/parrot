#
# call.pasm
#
# A program to demonstrate macros and poor-man's subroutine
# calls.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

neg         macro   R
            set     I0, R
            set     R, 0
            sub     R, R, I0
endm

call        macro   R, D
            set     R, [D - @ - 3]
            jump    R
endm

return      macro   R, D
            neg     R
            inc     R, [D - @ - 1]
            jump    R
endm

MAIN:       set     I1, 42
            call    I31, PRINTIT
            set     I1, 1234
            call    I31, PRINTIT
            end

PRINTIT:    print        I1
            print   "\n"
            return  I31, PRINTIT

