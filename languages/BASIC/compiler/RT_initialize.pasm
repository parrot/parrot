.constant LINE I11
	# Globals of note:
	#  P8, P9  -- Working stacks for Postfix Machine
	# 
	# Generally, anything above x14 belongs to BASIC for future use.
	#
	#
        # Set up new program space
        #
	#sweepoff
	#collectoff
        set I25, -1		# Current stack frame
        new P10, .PerlArray	# Variables
        new P11, .PerlArray	# Loop memory
        
        new P15, .PerlArray	# Read/Data information
        new P16, .PerlHash	# Index for Read/Data RESTORE
        set I15, 0		# Current READ pointer.
	set I14, 0		# Column position of cursor 1-80 (for tab())
				# DO NOT OUTPUT DATA WITHOUT GOING THROUGH DISPLAY EXPRESSION

	new P17, .PerlHash	# File Descriptors, key is BASIC data is FD
				#		    data is 0 (closed) or Ix FD
	set I12, 20021107	# Random number generator seed (unfair intentionally)
        
	bsr DATA_SETUP
        bsr NEWFRAME
        branch MAIN
        # Start a new stack frame

NEWFRAME:
        inc I25
        new P0, .PerlHash
        new P1, .PerlArray
        set P0["expr"], P1
        new P1, .PerlArray
        set P0["exprwork"], P1
        new P1, .PerlHash
        set P0["expr_lhs"], 0
       
        set P0["STRING"], P1
        new P1, .PerlHash
        set P0["FLO"], P1
        new P1, .PerlHash
        set P0["INT"], P1
        new P1, .PerlHash
        set P0["USER"], P1
        new P1, .PerlHash
        set P0["ARRAY"], P1
        
        new P1, .PerlHash
        set P0["SELECTS"], P1
        
        ne I25, 0, NEWF
        new P1, .PerlHash
        set P0["types"], P1

NEWF:   set P10[I25], P0
	new P1, .PerlHash
	new P0, .PerlHash
	new P2, .PerlHash
	set P0["INT"], P2
	new P2, .PerlHash
	set P0["FLO"], P2
	set P1["FOR"], P0
	set P11[I25], P1
        ret

ENDFRAME:
	set P10, I25
	dec I25
	ret
	        
MAIN:
