# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
# $Id$

=head1 NAME

examples/assembly/queens.pasm - 8-Queens Problem

=head1 SYNOPSIS

    % ./parrot examples/assembly/queens.pasm

=head1 DESCRIPTION

A program to find solutions to the 8-queens problem
(L<http://burks.brighton.ac.uk/burks/foldoc/7/37.htm>).

Note that this Parrot assembler file was produced by the Jako compiler
(F<languages/jako>).

=cut

# 4 bits per file, represent the rank of the queen, 0xf for none

                                                    # const int BITS_PER_FILE = 4;
                                                    # const int NO_QUEEN = 0xf;
                                                    # const int NUM_FILES = 8;
                                                    # const int NUM_RANKS = 8;
clear_file_BEFORE: branch   clear_file_AFTER          #   sub int clear_file (int board, int file) {
clear_file:
clear_file_ENTER: pushi                             
                 pushn                             
                 pushs                             
                                                    #   var int board;
                 restore  I0                        #   var int file;
                 restore  I1                        # (argument board)
                 restore  I2                        # (argument file)
                                                    #   var int amount;
                                                    #   var int temp;
                 set      I0, 4                     #   amount = BITS_PER_FILE * file;
                 mul      I3, I0, I2               
                 shl      I4, 0xf, I3              
                 or       I1, I1, I4                #   board = board | temp
                 save     I1                        #   return board
                 branch   clear_file_LEAVE         
clear_file_LEAVE: save     1                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
clear_file_AFTER:                                   
                                                   
place_queen_BEFORE: branch   place_queen_AFTER         #   sub int place_queen (int board, int rank, int file) {
place_queen:
place_queen_ENTER: pushi                             
                 pushn                             
                 pushs                             
                                                    #   var int board;
                                                    #   var int rank;
                 restore  I0                        #   var int file;
                 restore  I1                        # (argument board)
                 restore  I2                        # (argument rank)
                 restore  I3                        # (argument file)
                                                    #   var int amount;
                                                    #   var int temp;
                 set      I0, 4                     #   amount = BITS_PER_FILE * file;
                 mul      I4, I0, I3               
                 shl      I5, 0xf, I4              
                 not      I5, I5                    #   temp = not(temp);
                 and      I1, I1, I5                #   board = board & temp
                 shl      I5, I2, I4               
                 or       I1, I1, I5                #   board = board | temp
                 save     I1                        #   return board
                 branch   place_queen_LEAVE        
place_queen_LEAVE: save     1                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
place_queen_AFTER:                                   
                                                   
queen_rank_BEFORE: branch   queen_rank_AFTER          #   sub int queen_rank (int board, int file) {
queen_rank:
queen_rank_ENTER: pushi                             
                 pushn                             
                 pushs                             
                                                    #   var int board;
                 restore  I0                        #   var int file;
                 restore  I1                        # (argument board)
                 restore  I2                        # (argument file)
                                                    #   var int amount;
                                                    #   var int temp;
                 set      I0, 4                     #   amount = BITS_PER_FILE * file;
                 mul      I3, I0, I2               
                 shl      I4, 0xf, I3              
                 and      I4, I4, I1                #   temp = temp & board
                 shr      I4, I4, I3               
                 save     I4                        #   return temp
                 branch   queen_rank_LEAVE         
queen_rank_LEAVE: save     1                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
queen_rank_AFTER:                                   
                                                   
queen_at_BEFORE: branch   queen_at_AFTER            #   sub int queen_at (int board, int rank, int file) {
queen_at:
queen_at_ENTER:  pushi                             
                 pushn                             
                 pushs                             
                                                    #   var int board;
                                                    #   var int rank;
                 restore  I0                        #   var int file;
                 restore  I1                        # (argument board)
                 restore  I2                        # (argument rank)
                 restore  I3                        # (argument file)
                                                    #   var int amount;
                                                    #   var int temp;
_I5_IF:
_I5_TEST:        ge       I2, 0, _I5_ELSE           #     _I5: if (rank < 0) {
_I5_REDO:        save     0                         #     return 0
                 branch   queen_at_LEAVE           
                                                    #   }
_I5_ELSE:
_I5_LAST:
_I6_IF:
_I6_TEST:        lt       I2, 8, _I6_ELSE           #     _I6: if (rank >= NUM_RANKS) {
_I6_REDO:        save     0                         #     return 0
                 branch   queen_at_LEAVE           
                                                    #   }
_I6_ELSE:
_I6_LAST:
_I7_IF:
_I7_TEST:        ge       I3, 0, _I7_ELSE           #     _I7: if (file < 0) {
_I7_REDO:        save     0                         #     return 0
                 branch   queen_at_LEAVE           
                                                    #   }
_I7_ELSE:
_I7_LAST:
_I8_IF:
_I8_TEST:        lt       I3, 8, _I8_ELSE           #     _I8: if (file >= NUM_FILES) {
_I8_REDO:        save     0                         #     return 0
                 branch   queen_at_LEAVE           
                                                    #   }
_I8_ELSE:
_I8_LAST:        set      I0, 4                     #   amount = BITS_PER_FILE * file;
                 mul      I4, I0, I3               
                 shl      I5, 0xf, I4              
                 and      I5, I5, I1                #   temp = temp & board
                 shr      I5, I5, I4               
_I9_IF:
_I9_TEST:        ne       I5, I2, _I9_ELSE          #     _I9: if (temp == rank) {
_I9_REDO:        save     1                         #     return 1
                 branch   queen_at_LEAVE           
                 branch   _I9_LAST                 
                                                    #   } else {
_I9_ELSE:        save     0                         #     return 0
                 branch   queen_at_LEAVE           
                                                    #   }
_I9_LAST:
queen_at_LEAVE:  save     1                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
queen_at_AFTER:                                    
                                                   
free_space_BEFORE: branch   free_space_AFTER          #   sub int free_space (int board, int rank, int file) {
free_space:
free_space_ENTER: pushi                             
                 pushn                             
                 pushs                             
                                                    #   var int board;
                                                    #   var int rank;
                 restore  I0                        #   var int file;
                 restore  I1                        # (argument board)
                 restore  I2                        # (argument rank)
                 restore  I3                        # (argument file)
                                                    #   var int i;
                 set      I4, 1                     #   i = 1
_W11_WHILE:
_W11_NEXT:       gt       I4, I3, _W11_LAST         #     _W11: while (i <= file) {
                                                    #     var int temp_file;
                                                    #     var int temp_rank;
                                                    #     var int result;
_W11_REDO:       sub      I5, I3, I4                #     temp_file = file - i;
                 set      I6, I2                    #     temp_rank = rank
                 save     I5                        #     result = queen_at(board, temp_rank, temp_file);
                 save     I6                       
                 save     I1                       
                 save     3                        
                 bsr      queen_at                 
                 restore  I0                       
                 restore  I7                       
_I12_IF:
_I12_TEST:       ne       I7, 1, _I12_ELSE          #       _I12: if (result == 1) {
_I12_REDO:       save     0                         #       return 0
                 branch   free_space_LEAVE         
                                                    #     }
_I12_ELSE:
_I12_LAST:       add      I6, I2, I4                #     temp_rank = rank + i;
                 save     I5                        #     result = queen_at(board, temp_rank, temp_file);
                 save     I6                       
                 save     I1                       
                 save     3                        
                 bsr      queen_at                 
                 restore  I0                       
                 restore  I7                       
_I13_IF:
_I13_TEST:       ne       I7, 1, _I13_ELSE          #       _I13: if (result == 1) {
_I13_REDO:       save     0                         #       return 0
                 branch   free_space_LEAVE         
                                                    #     }
_I13_ELSE:
_I13_LAST:       sub      I6, I2, I4                #     temp_rank = rank - i;
                 save     I5                        #     result = queen_at(board, temp_rank, temp_file);
                 save     I6                       
                 save     I1                       
                 save     3                        
                 bsr      queen_at                 
                 restore  I0                       
                 restore  I7                       
_I14_IF:
_I14_TEST:       ne       I7, 1, _I14_ELSE          #       _I14: if (result == 1) {
_I14_REDO:       save     0                         #       return 0
                 branch   free_space_LEAVE         
                                                    #     }
_I14_ELSE:
_I14_LAST:       inc      I4                        #     i++;
_W11_CONT:       branch   _W11_NEXT                 #   }
_W11_LAST:       save     1                         #   return 1
                 branch   free_space_LEAVE         
free_space_LEAVE: save     1                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
free_space_AFTER:                                   
                                                   
print_board_BEFORE: branch   print_board_AFTER         #   sub print_board (int board) {
print_board:
print_board_ENTER: pushi                             
                 pushn                             
                 pushs                             
                 restore  I0                        #   var int board;
                 restore  I1                        # (argument board)
                                                    #   var int rank;
                                                    #   var int file;
                                                    #   var int temp;
                 set      I2, 7                     #   rank = 7
                 print    "  +---+---+---+---+---+---+---+---+\n" #   print(...);
_W16_WHILE:
_W16_NEXT:       lt       I2, 0, _W16_LAST          #     _W16: while (rank >= 0) {
_W16_REDO:       set      I0, 1                     #     temp = rank + 1;
                 add      I4, I2, I0               
                 set      I3, 0                     #     file = 0
                 print    ""                        #     print(...);
                 print    I4                       
                 print    " |"                     
_W17_WHILE:
_W17_NEXT:       ge       I3, 8, _W17_LAST          #       _W17: while (file < 8) {
                                                    #       var int result;
_W17_REDO:       save     I3                        #       result = queen_at(board, rank, file);
                 save     I2                       
                 save     I1                       
                 save     3                        
                 bsr      queen_at                 
                 restore  I0                       
                 restore  I5                       
_I18_IF:
_I18_TEST:       ne       I5, 1, _I18_ELSE          #         _I18: if (result == 1) {
_I18_REDO:       print    " Q |"                    #         print(...);
                 branch   _I18_LAST                
                                                    #       } else {
_I18_ELSE:       add      I4, I2, I3                #         temp = rank + file;
                                                    #         temp %= 2
                 set      I0, 2                     #         temp = temp % 2;
                 mod      I4, I4, I0               
_I19_IF:
_I19_TEST:       ne       I4, 1, _I19_ELSE          #           _I19: if (temp == 1) {
_I19_REDO:       print    "   |"                    #           print(...);
                 branch   _I19_LAST                
                                                    #         } else {
_I19_ELSE:       print    " * |"                    #           print(...);
                                                    #         }
_I19_LAST:                                          #       }
_I18_LAST:       inc      I3                        #       file++;
_W17_CONT:       branch   _W17_NEXT                 #     }
_W17_LAST:       print    "\n"                      #     print(...);
                 print    "  +---+---+---+---+---+---+---+---+\n" #     print(...);
                 dec      I2                        #     rank--;
_W16_CONT:       branch   _W16_NEXT                 #   }
_W16_LAST:       print    "    A   B   C   D   E   F   G   H  \n" #   print(...);
print_board_LEAVE: save     0                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
print_board_AFTER:                                   
                                                   
main_BEFORE:     branch   main_AFTER                #   sub main () {
main:
main_ENTER:      pushi                             
                 pushn                             
                 pushs                             
                 restore  I0                       
                                                    #   var int board;
                                                    #   var int rank;
                                                    #   var int file;
                 set      I3, 0                     #   file = 0
_W21_WHILE:
_W21_NEXT:       ge       I3, 8, _W21_LAST          #     _W21: while (file < NUM_FILES) {
_W21_REDO:       save     I3                        #     board = clear_file(board, file);
                 save     I1                       
                 save     2                        
                 bsr      clear_file               
                 restore  I0                       
                 restore  I1                       
                 inc      I3                        #     file++;
_W21_CONT:       branch   _W21_NEXT                 #   }
_W21_LAST:       set      I3, 0                     #   file = 0
                 set      I2, 0                     #   rank = 0
_W22_WHILE:
_W22_NEXT:       ge       I3, 8, _W22_LAST          #     _W22: while (file < NUM_FILES) {
_W22_REDO:
_W23_WHILE:
_W23_NEXT:       ge       I2, 8, _W23_LAST          #       _W23: while (rank < NUM_RANKS) {
                                                    #       var int result;
_W23_REDO:       save     I3                        #       result = free_space(board, rank, file);
                 save     I2                       
                 save     I1                       
                 save     3                        
                 bsr      free_space               
                 restore  I0                       
                 restore  I4                       
                 eq       I4, 1, _W23_LAST          #       last _W23 if (result == 1)
                 inc      I2                        #       rank++;
_W23_CONT:       branch   _W23_NEXT                 #     }
_W23_LAST:
_I24_IF:
_I24_TEST:       ne       I2, 8, _I24_ELSE          #       _I24: if (rank == NUM_RANKS) {
_I24_REDO:       dec      I3                        #       file--;
                 save     I3                        #       rank = queen_rank(board, file);
                 save     I1                       
                 save     2                        
                 bsr      queen_rank               
                 restore  I0                       
                 restore  I2                       
                 save     I3                        #       board = clear_file(board, file);
                 save     I1                       
                 save     2                        
                 bsr      clear_file               
                 restore  I0                       
                 restore  I1                       
                 inc      I2                        #       rank++;
                 branch   _I24_LAST                
                                                    #     } else {
_I24_ELSE:       save     I3                        #       board = place_queen(board, rank, file);
                 save     I2                       
                 save     I1                       
                 save     3                        
                 bsr      place_queen              
                 restore  I0                       
                 restore  I1                       
                 inc      I3                        #       file++;
                 set      I2, 0                     #       rank = 0
                                                    #     }
_I24_LAST:       lt       I3, 0, _W22_LAST          #     last _W22 if (file < 0)
_W22_CONT:       branch   _W22_NEXT                 #   }
_W22_LAST:       save     I1                        #   print_board(...);
                 save     1                        
                 bsr      print_board              
                 restore  I0                       
main_LEAVE:      save     0                         # }
                 popi                              
                 popn                              
                 pops                              
                 ret                               
main_AFTER:                                        
                 save     0                         # main(...);
                 bsr      main                     
                 restore  I0                       
                 end                               
