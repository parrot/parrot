#  Display stuff on stack.
#
.const int FLOAT = 2
.const int STRING = 3
.sub _BUILTIN_DISPLAY		 	# void display(....)
	saveall
	.local string buf
	call _BUILTIN_DISPLAY_WORK
	.result buf
	print buf
	restoreall
	ret
.end
# Prepares stuff for printing.  Side effect: edits the global PRINTCOL
#  for the current column.
#
.sub _BUILTIN_DISPLAY_WORK	 	# string display_work(string|float thingy[, string|float thingy2])
	saveall
	.param int argc
	.local string buf
	.local int intver
	.local string s
	.local int PRINTCOL

	find_global $P0, "PRINTCOL"
	set PRINTCOL, $P0["value"]

	set buf, ""
NEXT:	eq argc, 0, END_DISPLAY
	dec argc
	entrytype $I0, 0
	eq $I0, STRING, DISPSTRING
	ne $I0, FLOAT, DISPERR
	
	# Now, do floats
	.param float number
	set intver, number
	set $N0, intver
	eq $N0, number, DISPINT	# Nope, it's an integer.
	.arg number
	call _NORMALIZE_FLOAT
	.result s
	lt number, 0.0, NEGFLO
	concat buf, " "
NEGFLO:	concat buf, s
	concat buf, " "
	branch NEXT

	# Integers display -1234_
	#              or  _1234
DISPINT:set $S0, intver
	lt intver, 0, NEGINT
	concat buf, " "
NEGINT: concat buf, $S0
	concat buf, " "
	branch NEXT

DISPSTRING:
	.param string str
	length $I0, str
	eq str, "\t", DISPTAB
	concat buf, str
	eq str, "\n", DISPNL
	add PRINTCOL, PRINTCOL, $I0
	branch NEXT
DISPTAB:
	set $I0, PRINTCOL
        mod $I0, $I0, 8
        sub $I0, 7, $I0
        set $I1, 0
        eq $I1, $I0, NEXT
	concat buf, " "
	inc PRINTCOL
        inc I1
        branch DISPTAB
DISPNL:	set PRINTCOL, 0
	branch NEXT
END_DISPLAY:
	.return buf
	set $P0["value"], PRINTCOL
	store_global "PRINTCOL", $P0
	restoreall
	ret
DISPERR:print "Unknown type on stack to print\n"
	end
.end

.sub _NORMALIZE_FLOAT	# string normalize_flo(float number)
	saveall
	.param float number	# INTERNAL, no argc!
	set $S0, number
FLO_NORM:
	length $I0, $S0
	substr $S1, $S0, $I0, 1
	eq $S1, ".", FLO_CHOP_DEC
	eq $S1, "0", FLO_CHOP
	branch FLO_END
FLO_CHOP_DEC:
	substr $S0, $S0, 0, $I0
	branch FLO_END
FLO_CHOP:
	substr $S0, $S0, 0, $I0
	branch FLO_NORM
FLO_END:
	.return $S0
	restoreall
	ret
.end

#  Builtin functions for BASIC
#
.sub _BUILTIN_ABS   		# float abs(float arg)
	saveall
	.param int argc
	.param float arg
	.local float res
	abs res, arg
	.return res
	restoreall
	ret
.end
# INT - a math function that returns the largest integer less than
#       or equal to a numeric-expression
.sub _BUILTIN_INT   		# float int(float arg)
	saveall
	.param int argc
	.param float arg
	.local float res
	.local int truncate
	set truncate, arg
	set res, truncate
	ge arg, 0.0, ENDINT
	dec res
ENDINT:	.return res
	restoreall
	ret
.end
.sub _BUILTIN_CHR_STRING	# string chr(float arg)
	saveall
	.param int argc
	.param float arg
	.local string res
	.local int truncate
	set truncate, arg
	chr res, truncate
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_ASC 		# float asc(string arg)
	saveall
	.param int argc
	.param string arg
	.local int conv
	.local float res
	ord conv, arg
	set res, conv
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_STR_STRING	# string str(float arg)
	saveall
	.param int argc
	.param float arg
	.local string res
	set res, arg
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_VAL 		# float val(string arg)
	saveall
	.param int argc
	.param string arg
	.local float res
	set res, arg
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_LEN 		# float len(string arg)
	saveall
	.param int argc
	.param string arg
	.local float res
	.local int conv
	length conv, arg
	set res, conv
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_MID_STRING	# string mid(string targ, float start [, float extent])
	saveall
	.param int argc
	.param string target
	.param float start
	.local string res
	.local string a
	.local int strlen
	.local int pos
	length strlen, target
	set res, ""
	set pos, start
	dec pos

	eq argc, 3, MID3ARG

MIDLOOP:ge pos, strlen, MIDDONE
	substr a, target, pos, 1
	concat res, a
	inc pos
	branch MIDLOOP

MID3ARG:
	.local float count
	.param float extent
	set count, 0.0
MID3L:
	ge pos, strlen, MIDDONE
	substr a, target, pos, 1
	concat res, a
	inc pos
	inc count
	ge count, extent, MIDDONE
	branch MID3L
	
MIDDONE:
	.return res
	restoreall
	ret
.end
.sub _BUILTIN_LEFT_STRING	# string left(string targ, float extent)
	saveall
	.param int argc
	.param string targ
	.param float extent
	.local string res
	
	.arg extent
	.arg 1.0
	.arg targ
	.arg 3
	call _BUILTIN_MID_STRING
	restoreall
	ret
.end
.sub _BUILTIN_RIGHT_STRING	# string right(string targ, float extent)
	saveall
	.param int argc
	.param string targ
	.param float extent
	.local string res
	.local int conv

	length $I0, targ
	set conv, extent
	sub $I0, $I0, conv
	inc $I0
	set $N0, $I0

	.arg extent
	.arg $N0
	.arg targ
	.arg 3
	call _BUILTIN_MID_STRING
	restoreall
	ret
.end
# Modifies the system-wide RANDSEED
# Produces 16-bit pseudo-random numbers.
.sub _BUILTIN_RND	# float rnd([float seed])
	saveall
	.local int RANDSEED
	.param int argc
	find_global $P0, "RANDSEED"
	set RANDSEED, $P0["value"]
	eq argc, 0, RND_GEN
	.param float repeat

	eq repeat, 0.0, RND_REPEAT
RND_GEN:
	mul RANDSEED, RANDSEED, 5
	add RANDSEED, RANDSEED, 1
	mod RANDSEED, RANDSEED, 65536
	set $N0, RANDSEED
	div $N0, $N0, 65536.0
	branch RND_BAIL
RND_REPEAT:
	set $N0, RANDSEED
	div $N0, $N0, 65536.0
RND_BAIL:
	.return $N0

	set $P0["value"], RANDSEED
	store_global "RANDSEED", $P0

	restoreall
	ret
.end
.sub _BUILTIN_TIMER	# float timer()
	saveall
	.param int argc
	time $N0
	.return $N0
	restoreall
	ret 
.end
.sub _BUILTIN_INSTR	# float instr([float start,] string full, string substr);
	saveall
	.param int argc
	.local int start
	set start, 1
	eq argc, 2, NOSTART
	.param float startf
	set start, startf
NOSTART:
	dec start		# BASIC starts at 1.
	.param string full
	.param string substr
	length $I0, substr
	eq $I0, 0, ENDINSTR
	index $I0, full, substr, start
	set $N0, $I0
	
ENDINSTR:inc $N0
	.return $N0
	restoreall
	ret
.end
.sub _BUILTIN_UCASE_STRING	# string ucase$(string targ)
	saveall
	.param int argc
	.arg 122
	.arg 97
	.arg 32
	call _XCASE
	restoreall
	ret
.end
.sub _BUILTIN_LCASE_STRING	# string lcase$(string targ)
	saveall
	.param int argc
	.arg 90
	.arg 65
	.arg -32
	call _XCASE
	restoreall
	ret
.end
			# For internal use only.  No ARGC!
.sub _XCASE		# string xcase(string targ, int offset, int lower, int upper
	saveall
	.param int offset
	.param int lower
	.param int upper
	.param string targ

	length $I5, targ
	set $S3, ""
	set $I0, 0
XCASE_LOOP:
	ge $I0, $I5, XCASE_DONE
	substr $S1, targ, $I0, 1
	ord $I2, $S1
	ge $I2, lower, XCASE_OK1
	branch XCASE_INSERT
XCASE_OK1:
	le $I2, upper, XCASE_SHIFT
	branch XCASE_INSERT
XCASE_SHIFT:
	sub $I2, $I2, offset
XCASE_INSERT:
	chr $S1, $I2
	concat $S3, $S1
	inc $I0
	branch XCASE_LOOP
XCASE_DONE:
	.return $S3
	restoreall
	ret
.end
.sub _BUILTIN_SGN	# float sgn(float number)
	saveall
	.param int argc
	.param float number
	set $N0, 0.0
	eq number, 0.0, FINISHED
	set $N0, -1.0
	lt number, 0.0, FINISHED
	set $N0, 1.0
FINISHED:
	.return $N0
	restoreall
	ret
.end
.sub _BUILTIN_STRING_STRING	# string string(float repeat, float ascii)
	saveall		# string string(float repeat, string string)
	.param int argc
	.param float repeatf
	.local int repeat
	set repeat, repeatf
	.local string repeater
	.local string target
	set $I1, 0
	set target, ""
	entrytype $I0, 0
	eq $I0, FLOAT, FLOATB
	.param string thing
	set repeater, thing
	branch REP
FLOATB:	.param float ascii
	set $I0, ascii
	chr repeater, $I0
REP: 	ge $I1, repeat, BAIL
	concat target, repeater
	inc $I1
	branch REP
BAIL:	.return target
	restoreall
	ret
.end
.sub _TRIG_IN
	saveall
	.param int argc
	.param float op
	set $N0, op
	ret
.end
.sub _TRIG_OUT
	.return $N0
	restoreall
	ret
.end
.sub _BUILTIN_LOG		# float log(float op)
	call _TRIG_IN
	ln $N0, $N0
	call _TRIG_OUT
	ret
.end
.sub _BUILTIN_EXP		# float exp(float op)
	call _TRIG_IN
	exp $N0, $N0
	call _TRIG_OUT
	ret
.end
.sub _BUILTIN_SIN		# float sin(float op)
	call _TRIG_IN
	sin $N0, $N0
	call _TRIG_OUT
	ret
.end
.sub _BUILTIN_COS		# float cos(float op)
	call _TRIG_IN
	cos $N0, $N0
	call _TRIG_OUT
	ret
.end
.sub _BUILTIN_TAN		# float tan(float op)
	call _TRIG_IN
	tan $N0, $N0
	call _TRIG_OUT
	ret
.end
.sub _BUILTIN_ATN		# float atn(float op)
	call _TRIG_IN
	atan $N0, $N0
	call _TRIG_OUT
	ret
.end
.const float EPSILON = 0.000001
.sub _BUILTIN_SQR		# float sqr(float operand)
	saveall
	.param int argc
	.param float operand
	lt operand, 0.0, ERR_RANGE
	eq operand, 0.0, END
	div $N1, operand, 3.0	# First guess
AGAIN:	div $N2, operand, $N1	# Newton's method
	add $N2, $N2, $N1
	mul $N2, $N2, 0.5
	sub $N3, $N2, $N1
	gt $N3, 0.0, INV
	mul $N3, $N3, -1.0
INV:	set $N1, $N2
	gt $N3, EPSILON, AGAIN
	set operand, $N1
END:	.return operand
	restoreall
	ret

ERR_RANGE:
	print "Number out of range\n"
	.return -1.0
	restoreall
	ret
.end
.sub _BUILTIN_TAB_STRING		# string tab(float cols)
	saveall
	.param int argc
	.param float cols
	.local int PRINTCOL
	find_global $P0, "PRINTCOL"
	set PRINTCOL, $P0["value"]

	set $I0, cols

	dec $I0
	set $S0, ""
	eq $I0, PRINTCOL, TAB_RET
	lt $I0, PRINTCOL, TAB_NL
	set $I1, PRINTCOL
	branch TAB_SP
TAB_NL: concat $S0, "\n"
	set $I0, 0
	set $I1, 0
TAB_SP: eq $I1, $I0, TAB_RET
	concat $S0, " "
	inc $I1
	branch TAB_SP
TAB_RET:.return $S0
	restoreall
	ret
.end
.sub _BUILTIN_LTRIM_STRING	# string ltrim(string oldstring)
	saveall
	.param int argc
	.param string oldstring
	set $S0, oldstring
BI_LTRIM:
	length $I0, $S0
	eq $I0, 0, LTRIM_END
	substr $S1, $S0, 0, 1
	ne $S1, " ", LTRIM_END
	dec $I0
	substr $S0, $S0, 1, $I0
	branch BI_LTRIM
LTRIM_END:
	.return $S0
	restoreall
	ret
.end
.sub _BUILTIN_RTRIM_STRING	# string rtrim(string oldstring)
	saveall
	.param int argc
	.param string oldstring
	set $S0, oldstring
BI_RTRIM:
	length $I0, $S0
	eq $I0, 0, RTRIM_END
	dec $I0
	substr $S1, $S0, $I0, 1
	ne $S1, " ", RTRIM_END
	substr $S0, $S0, 0, $I0
	branch BI_RTRIM
RTRIM_END:
	.return $S0
	restoreall
	ret
.end
.sub _BUILTIN_INPUT_STRING 	# string input$(float numchars[, string fdinfo])
	saveall
	.param int argc
	.param float numcharsf
	.local int numchars
	set numchars, numcharsf
	.local int fd
	set fd, 0		# Stdin
	eq argc, 1, DOREAD
	.param string fdinfo
	length $I0, fdinfo
	dec $I0
	substr fdinfo, fdinfo, 1, $I0
	set fd, fdinfo
DOREAD:	.arg fd
	.arg numchars
	call _READCHARS
	restoreall
	ret
.end
.sub _BUILTIN_INKEY_STRING	# string inkey$(void)
	.param int argc		
	call _scan_read		# Put terminal in char-at-a-time mode
	call _inkey_string
	ret
.end

