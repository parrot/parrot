#	# ##########################
#	# Do next read for READ/DATA
#	#  P15 has the data itself
#	#  P16 has the index (for restore)
#	#  I15 is the current pointer
#	# Trashes I0
#	# Returns:
#	#        P0 value read.
#READ:	set I0, P15
#	dec I0
#	lt I0, I15, ERR_READ
#	set P0, P15[I15]
#	inc I15
#	ret
#
#	# ####################################
#	# Index you want to restore into in S0
#	# An invalid "restore X" statement generates
#	# no error!  It simply does a "restore"
#RESTORE:set I15, P16[S0]
#	ret
#	
#ERR_READ:
#	print "Out of data"
#	branch GEN_ERROR

.sub _READ		# PerlArray READ(void)
	.local pmc READDATA
	.local int READPOINTER
	find_global READDATA, "READDATA"
	find_global $P0, "READPOINTER"
	set READPOINTER, $P0["value"]

	set $I0, READDATA
	dec $I0
	lt $I0, READPOINTER, ERR_READ

	set $S1, READDATA[READPOINTER]
	inc READPOINTER

	set $P0["value"], READPOINTER
	store_global "READPOINTER", $P0

	.return($S1)
ERR_READ:
	print "Out of data"
	end
.end
.sub _RESTORE		# void RESTORE(string where)
	.param string where
	.local int READPOINTER
	.local pmc RESTOREINFO
	find_global RESTOREINFO, "RESTOREINFO"
	find_global $P0, "READPOINTER"
	set READPOINTER, $P0["value"]

	set READPOINTER, RESTOREINFO[where]
	
	set $P0["value"], READPOINTER
	store_global "READPOINTER", $P0
.end

.sub _get_little_endian # int get_little_endian(struct, offset, bytes)
	.param pmc		struct
	.param int		offset
	.param int		bytes
	.local int 		target
	set target, 0	
	eq bytes, 0, END
	add $I6, offset, bytes
LOOP:   lt $I6, offset, END
	shl target, target, 8
	set $I3, struct[$I6]
	add target, target, $I3
	dec $I6
	branch LOOP
END:    .return(target)
.end
.sub _set_little_endian	# void set_little_endian(struct, offset, bytes, value)
	.param pmc           struct
	.param int 	     offset
	.param int 	     bytes
	.param int 	     value
	add $I6, offset, bytes
	eq bytes, 0, END2
LOOP2:  eq offset, $I6, END2
	band $I1, value, 255
	shr value, value, 8
	set struct[offset], $I1
	inc offset
	branch LOOP2
END2:   noop
.end
