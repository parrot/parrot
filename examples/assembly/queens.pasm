___MAIN:
	bsr __INLINE_0 
	end  
__INLINE_0:
	bsr __INLINE_1 
	ret  
_remove_queen:
	saveall  
	restore I17 
	restore I16 
	restore S16 
	mul I16, I16, 8 
	add I16, I16, I17 
	set I18, I16 
	add I17, I16, 1 
	length I16, S16 
	sub I16, I16, I17 
	substr S18, S16, 0, I18 
	substr S17, S16, I17, I16 
	set S16, S18 
	concat S16, S16, " " 
	concat S16, S16, S17 
	save S16 
	branch _remove_queen_LEAVE 
_remove_queen_LEAVE:
	restoreall  
	ret  
_clear_file:
	saveall  
	restore I17 
	restore S16 
	set I16, 0 
_WHILE_0_NEXT:
	ge I16, 8, _WHILE_0_LAST 
_WHILE_0_REDO:
	save S16 
	save I16 
	save I17 
	bsr _remove_queen 
	restore S16 
	inc I16 
_WHILE_0_CONT:
	branch _WHILE_0_NEXT 
_WHILE_0_LAST:
	save S16 
	branch _clear_file_LEAVE 
_clear_file_LEAVE:
	restoreall  
	ret  
_place_queen:
	saveall  
	restore I17 
	restore I16 
	restore S16 
	save S16 
	save I17 
	bsr _clear_file 
	restore S16 
	mul I16, I16, 8 
	add I16, I16, I17 
	set I18, I16 
	add I17, I16, 1 
	length I16, S16 
	sub I16, I16, I17 
	substr S18, S16, 0, I18 
	substr S17, S16, I17, I16 
	set S16, S18 
	concat S16, S16, "Q" 
	concat S16, S16, S17 
	save S16 
	branch _place_queen_LEAVE 
_place_queen_LEAVE:
	restoreall  
	ret  
_queen_rank:
	saveall  
	restore I18 
	restore S16 
	set I16, 0 
_WHILE_1_NEXT:
	ge I16, 8, _WHILE_1_LAST 
_WHILE_1_REDO:
	save S16 
	save I16 
	save I18 
	bsr _queen_at 
	restore I17 
	ne I17, 1, _ANON_LABEL_1 
	save I16 
	branch _queen_rank_LEAVE 
_ANON_LABEL_1:
	inc I16 
_WHILE_1_CONT:
	branch _WHILE_1_NEXT 
_WHILE_1_LAST:
	save -1 
	branch _queen_rank_LEAVE 
_queen_rank_LEAVE:
	restoreall  
	ret  
_at:
	saveall  
	restore I17 
	restore I16 
	restore S16 
	ge I16, 0, _ANON_LABEL_2 
	set S30, 0 
	save S30 
	branch _at_LEAVE 
_ANON_LABEL_2:
	lt I16, 8, _ANON_LABEL_3 
	set S30, 0 
	save S30 
	branch _at_LEAVE 
_ANON_LABEL_3:
	ge I17, 0, _ANON_LABEL_4 
	set S30, 0 
	save S30 
	branch _at_LEAVE 
_ANON_LABEL_4:
	lt I17, 8, _ANON_LABEL_5 
	set S30, 0 
	save S30 
	branch _at_LEAVE 
_ANON_LABEL_5:
	mul I16, I16, 8 
	add I16, I16, I17 
	length I17, S16 
	substr S16, S16, I16, 1 
	save S16 
	branch _at_LEAVE 
_at_LEAVE:
	restoreall  
	ret  
_queen_at:
	saveall  
	restore I17 
	restore I16 
	restore S16 
	save S16 
	save I16 
	save I17 
	bsr _at 
	restore S16 
	ne S16, "Q", _ANON_LABEL_6 
	save 1 
	branch _queen_at_LEAVE 
_ANON_LABEL_6:
	save 0 
	branch _queen_at_LEAVE 
_queen_at_LEAVE:
	restoreall  
	ret  
_free_space:
	saveall  
	restore I20 
	restore I19 
	restore S16 
	set I17, 1 
_WHILE_2_NEXT:
	gt I17, I20, _WHILE_2_LAST 
_WHILE_2_REDO:
	sub I18, I20, I17 
	set I16, I19 
	save S16 
	save I16 
	save I18 
	bsr _queen_at 
	restore I16 
	ne I16, 1, _ANON_LABEL_7 
	save 0 
	branch _free_space_LEAVE 
_ANON_LABEL_7:
	add I16, I19, I17 
	save S16 
	save I16 
	save I18 
	bsr _queen_at 
	restore I16 
	ne I16, 1, _ANON_LABEL_8 
	save 0 
	branch _free_space_LEAVE 
_ANON_LABEL_8:
	sub I16, I19, I17 
	save S16 
	save I16 
	save I18 
	bsr _queen_at 
	restore I16 
	ne I16, 1, _ANON_LABEL_9 
	save 0 
	branch _free_space_LEAVE 
_ANON_LABEL_9:
	inc I17 
_WHILE_2_CONT:
	branch _WHILE_2_NEXT 
_WHILE_2_LAST:
	save 1 
	branch _free_space_LEAVE 
_free_space_LEAVE:
	restoreall  
	ret  
_print_board:
	saveall  
	restore S16 
	set I17, 7 
	print "  +---+---+---+---+---+---+---+---+\n" 
_WHILE_3_NEXT:
	lt I17, 0, _WHILE_3_LAST 
_WHILE_3_REDO:
	add I16, I17, 1 
	set S30, "" 
	set S17, I16 
	concat S30, S17 
	concat S30, " |" 
	print S30 
	set I18, 0 
_WHILE_4_NEXT:
	ge I18, 8, _WHILE_4_LAST 
_WHILE_4_REDO:
	save S16 
	save I17 
	save I18 
	bsr _queen_at 
	restore I16 
_IF_1_TEST:
	ne I16, 1, _IF_1_ELSE 
_IF_1_THEN:
	print " Q |" 
	branch _IF_1_LAST 
_IF_1_ELSE:
	add I16, I17, I18 
	mod I16, I16, 2 
_IF_2_TEST:
	ne I16, 1, _IF_2_ELSE 
_IF_2_THEN:
	print "   |" 
	branch _IF_2_LAST 
_IF_2_ELSE:
	print " * |" 
_IF_2_LAST:
_IF_1_LAST:
	inc I18 
_WHILE_4_CONT:
	branch _WHILE_4_NEXT 
_WHILE_4_LAST:
	print "\n" 
	print "  +---+---+---+---+---+---+---+---+\n" 
	dec I17 
_WHILE_3_CONT:
	branch _WHILE_3_NEXT 
_WHILE_3_LAST:
	print "    A   B   C   D   E   F   G   H  \n" 
_print_board_LEAVE:
	restoreall  
	ret  
_new_board:
	saveall  
	set S16, "" 
	set I17, 0 
	set I16, 0 
	set S30, "" 
	concat S30, "Making new board with " 
	set S29, 8 
	concat S30, S29 
	concat S30, " ranks and " 
	set S29, 8 
	concat S30, S29 
	concat S30, " files...\n" 
	print S30 
_WHILE_5_NEXT:
	ge I17, 8, _WHILE_5_LAST 
_WHILE_5_REDO:
	set I16, 0 
_WHILE_6_NEXT:
	ge I16, 8, _WHILE_6_LAST 
_WHILE_6_REDO:
	concat S16, S16, " " 
	inc I16 
_WHILE_6_CONT:
	branch _WHILE_6_NEXT 
_WHILE_6_LAST:
	inc I17 
_WHILE_5_CONT:
	branch _WHILE_5_NEXT 
_WHILE_5_LAST:
	length I16, S16 
	set S30, "" 
	concat S30, "Board length is " 
	set S17, I16 
	concat S30, S17 
	concat S30, ".\n" 
	print S30 
	save S16 
	branch _new_board_LEAVE 
_new_board_LEAVE:
	restoreall  
	ret  
_main:
	saveall  
	bsr _new_board 
	restore S16 
	set I17, 0 
	set I16, 0 
_WHILE_7_NEXT:
	ge I17, 8, _WHILE_7_LAST 
_WHILE_7_REDO:
_WHILE_8_NEXT:
	ge I16, 8, _WHILE_8_LAST 
_WHILE_8_REDO:
	save S16 
	save I16 
	save I17 
	bsr _free_space 
	restore I18 
	eq I18, 1, _WHILE_8_LAST 
	inc I16 
_WHILE_8_CONT:
	branch _WHILE_8_NEXT 
_WHILE_8_LAST:
_IF_3_TEST:
	ne I16, 8, _IF_3_ELSE 
_IF_3_THEN:
	dec I17 
	save S16 
	save I17 
	bsr _queen_rank 
	restore I16 
	save S16 
	save I17 
	bsr _clear_file 
	restore S16 
	inc I16 
	branch _IF_3_LAST 
_IF_3_ELSE:
	save S16 
	save I16 
	save I17 
	bsr _place_queen 
	restore S16 
	inc I17 
	set I16, 0 
_IF_3_LAST:
	lt I17, 0, _WHILE_7_LAST 
_WHILE_7_CONT:
	branch _WHILE_7_NEXT 
_WHILE_7_LAST:
	save S16 
	bsr _print_board 
_main_LEAVE:
	restoreall  
	ret  
__INLINE_1:
	bsr _main 
	ret  


