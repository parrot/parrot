#
# queens.pasm
#
# Parrot assembly program to solve the eight-queens problem.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Parrot itself.
#

                 branch   MAIN

clear_file:      clonei
                 swap
                 restore  I1
                 swap
                 restore  I2
                 set      I0, 4
                 mul      I3, I0, I2
                 shl      I4, 0xf, I3
                 or       I1, I1, I4
                 set      I0, I1
                 save     I0
                 popi
                 restore  I0
                 ret

place_queen:     clonei
                 swap
                 restore  I1
                 swap
                 restore  I2
                 swap
                 restore  I3
                 set      I0, 4
                 mul      I4, I0, I3
                 shl      I5, 0xf, I4
                 not      I5, I5
                 and      I1, I1, I5
                 shl      I5, I2, I4
                 or       I1, I1, I5
                 set      I0, I1
                 save     I0
                 popi
                 restore  I0
                 ret

queen_rank:      clonei
                 swap
                 restore  I1
                 swap
                 restore  I2
                 set      I0, 4
                 mul      I3, I0, I2
                 shl      I4, 0xf, I3
                 and      I4, I4, I1
                 shr      I4, I4, I3
                 set      I0, I4
                 save     I0
                 popi
                 restore  I0
                 ret

queen_at:        clonei
                 swap
                 restore  I1
                 swap
                 restore  I2
                 swap
                 restore  I3

                 ge       I2, 0, _I5_ELSE
                 set      I0, 0
                 branch   queen_at_LEAVE
_I5_ELSE:        lt       I2, 8, _I6_ELSE
                 set      I0, 0
                 branch   queen_at_LEAVE
_I6_ELSE:        ge       I3, 0, _I7_ELSE
                 set      I0, 0
                 branch   queen_at_LEAVE
_I7_ELSE:        lt       I3, 8, _I8_ELSE
                 set      I0, 0
                 branch   queen_at_LEAVE
_I8_ELSE:        set      I0, 4
                 mul      I4, I0, I3
                 shl      I5, 0xf, I4
                 and      I5, I5, I1
                 shr      I5, I5, I4
                 ne       I5, I2, _I9_ELSE
                 set      I0, 1
                 branch   queen_at_LEAVE
_I9_ELSE:        set      I0, 0
                 branch   queen_at_LEAVE
queen_at_LEAVE:  save     I0
                 popi
                 restore  I0
                 ret

free_space:      clonei
                 swap
                 restore  I1
                 swap
                 restore  I2
                 swap
                 restore  I3

                 set      I4, 1
_W11_NEXT:       gt       I4, I3, _W11_LAST
                 sub      I5, I3, I4
                 set      I6, I2
                 save     I5
                 save     I6
                 save     I1
                 bsr      queen_at
                 set      I7, I0
                 ne       I7, 1, _I12_ELSE
                 set      I0, 0
                 branch   free_space_LEAVE
_I12_ELSE:       add      I6, I2, I4
                 save     I5
                 save     I6
                 save     I1
                 bsr      queen_at
                 set      I7, I0
                 ne       I7, 1, _I13_ELSE
                 set      I0, 0
                 branch   free_space_LEAVE
_I13_ELSE:       sub      I6, I2, I4
                 save     I5
                 save     I6
                 save     I1
                 bsr      queen_at
                 set      I7, I0
                 ne       I7, 1, _I14_ELSE
                 set      I0, 0
                 branch   free_space_LEAVE
_I14_ELSE:       inc      I4
                 branch   _W11_NEXT
_W11_LAST:       set      I0, 1
free_space_LEAVE: save     I0
                 popi
                 restore  I0
                 ret

print_board:     clonei
                 swap
                 restore  I1
                 set      I2, 7
                 print    "  +---+---+---+---+---+---+---+---+\n"
_W16_NEXT:       lt       I2, 0, _W16_LAST
                 set      I0, 1
                 add      I4, I2, I0
                 set      I3, 0
                 print    ""
                 print    I4
                 print    " |"
_W17_NEXT:       ge       I3, 8, _W17_LAST
                 save     I3
                 save     I2
                 save     I1
                 bsr      queen_at
                 set      I5, I0
                 ne       I5, 1, _I18_ELSE
                 print    " Q |"
                 branch   _I18_LAST
_I18_ELSE:       add      I4, I2, I3
                 set      I0, 2
                 mod      I4, I4, I0
                 ne       I4, 1, _I19_ELSE
                 print    "   |"
                 branch   _I19_LAST
_I19_ELSE:       print    " * |"
_I19_LAST:
_I18_LAST:       inc      I3
                 branch   _W17_NEXT
_W17_LAST:       print    "\n"
                 print    "  +---+---+---+---+---+---+---+---+\n"
                 dec      I2
                 branch   _W16_NEXT
_W16_LAST:       print    "    A   B   C   D   E   F   G   H  \n"
                 save     I0
                 popi
                 restore  I0
                 ret

MAIN:            set      I3, 0
_W21_NEXT:       ge       I3, 8, _W21_LAST
                 save     I3
                 save     I1
                 bsr      clear_file
                 set      I1, I0
                 inc      I3
                 branch   _W21_NEXT
_W21_LAST:       set      I3, 0
                 set      I2, 0
_W22_NEXT:       ge       I3, 8, _W22_LAST
_W23_NEXT:       ge       I2, 8, _W23_LAST
                 save     I3
                 save     I2
                 save     I1
                 bsr      free_space
                 set      I4, I0
                 eq       I4, 1, _W23_LAST
                 inc      I2
                 branch   _W23_NEXT
_W23_LAST:       ne       I2, 8, _I24_ELSE
                 dec      I3
                 save     I3
                 save     I1
                 bsr      queen_rank
                 set      I2, I0
                 save     I3
                 save     I1
                 bsr      clear_file
                 set      I1, I0
                 inc      I2
                 branch   _I24_LAST
_I24_ELSE:       save     I3
                 save     I2
                 save     I1
                 bsr      place_queen
                 set      I1, I0
                 inc      I3
                 set      I2, 0
_I24_LAST:       lt       I3, 0, _W22_LAST
                 branch   _W22_NEXT
_W22_LAST:       save     I1
                 bsr      print_board

                 end
