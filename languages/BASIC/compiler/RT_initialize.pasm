.const int TYPE = 0
.const int VALUE = 1
.local string JUMPLABEL
.sub _main
	$P0 = new PerlHash 
	store_global "BASICARR", $P0
	$P0 = new PerlArray
	store_global "READDATA", $P0
	$P0 = new PerlHash
	store_global "RESTOREINFO", $P0
	$P0=new PerlHash
	$P0["value"]=0
	store_global "READPOINTER", $P0
	$P0=new PerlHash
	$P0["value"]=20021107
	store_global "RANDSEED", $P0
	$P0=new PerlHash
	$P0["value"]=0
	store_global "PRINTCOL", $P0
	$P0=new PerlHash
	store_global "DEBUGGER", $P0

	JUMPLABEL = ""

	call _data

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
    #set I25, -1		# Current stack frame
    #new P10, .PerlArray	# Variables
    #new P11, .PerlArray	# Loop memory
    
    #new P24, .PerlHash	# Platform-specific storage
	#bsr PLATFORM_SETUP  # FIXME
    #new P25, .PerlHash	# Debugger's space
        

	#new P17, .PerlHash	# File Descriptors, key is BASIC data is FD
						#		    data is 0 (closed) or Ix FD
        
	#bsr DATA_SETUP
	#bsr DEBUG_INIT
    	#bsr NEWFRAME
	call _basicmain
	end
    
    # Start a new stack frame
NEWFRAME:
	print "ERROR, NO LONGER USED"
	end
#        inc I25
#        new P0, .PerlHash
#        new P1, .PerlArray
#        set P0["expr"], P1
#        new P1, .PerlArray
#        set P0["exprwork"], P1
#        new P1, .PerlHash
#        set P0["expr_lhs"], 0
#       
#        set P0["STRING"], P1
#        new P1, .PerlHash
#       set P0["FLO"], P1
#        new P1, .PerlHash
#        set P0["INT"], P1
#        new P1, .PerlHash
#        set P0["USER"], P1
#        new P1, .PerlHash
#        set P0["ARRAY"], P1
#        
#        new P1, .PerlHash
#        set P0["SELECTS"], P1
#        
#        ne I25, 0, NEWF
#        new P1, .PerlHash
#       set P0["types"], P1
#
#NEWF:   set P10[I25], P0
#	new P1, .PerlHash
#	new P0, .PerlHash
#	new P2, .PerlHash
#	set P0["INT"], P2
#	new P2, .PerlHash
#	set P0["FLO"], P2
#	set P1["FOR"], P0
#	set P11[I25], P1
#        ret
#ENDFRAME:
#	set P10, I25
#	dec I25
#	ret

.end	        
