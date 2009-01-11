#  Display stuff on stack.
#
.const int FLOAT = 2
.const int STRING = 3
#.sub _BUILTIN_DISPLAY		 	# void display(....)
	#.param int argc
	#.param string display
	#.local string buf

        # XXX pass along whatever arguments were given.

	#buf = _BUILTIN_DISPLAY_WORK(showme)
	#print buf
#.end
# Prepares stuff for printing.  Side effect: edits the global PRINTCOL
#  for the current column.
#
.sub _BUILTIN_DISPLAY  #_WORK	 	# string display_work(string|num thingy[, string|num thingy2])
	.param int argc
	.param pmc printme

	.local string buf
	.local int intver
	.local string s
	.local int PRINTCOL

        # XXX Used to use entrytype.  our naive fix here will eventually
	#   fail, because of the two variable type arguments.

	$P0 = get_global "PRINTCOL"
	PRINTCOL = $P0["value"]

	buf = ""
NEXT:
	if argc==0 goto END_DISPLAY
	dec argc
	$S0 = typeof printme
	if $S0 == 'String' goto DISPSTRING
	if $S0 != 'Float'  goto DISPERR

	# Now, do num
	intver = printme
	$N0 = intver
	$N1 = printme
	if $N0 == $N1 goto DISPINT	# Nope, it's an integer.
	s = _NORMALIZE_FLOAT(printme)
	if printme < 0 goto NEGFLO
        buf .= " "
NEGFLO:
	buf .= s
	buf .= " "
	goto NEXT

	# Integers display -1234_
	#              or  _1234
DISPINT:
	$S0 = intver
	if intver <0 goto NEGINT
	buf .= " "
NEGINT:
	buf .= $S0
	buf .= " "
	goto NEXT

DISPSTRING:
	s = printme
	$I0 = length s
	if s == "\t" goto DISPTAB
	buf .= s
	if s == "\n" goto DISPNL
	PRINTCOL += $I0
	goto NEXT
DISPTAB:
	$I0 = PRINTCOL
	$I0 %= 8
	$I0 = 7 - $I0
        $I1 = 0
	if $I1 == $I0 goto NEXT
	buf .= " "
	inc PRINTCOL
        inc $I1
        goto DISPTAB
DISPNL:
	PRINTCOL = 0
	goto NEXT
END_DISPLAY:
	$P0["value"] = PRINTCOL
	set_global "PRINTCOL", $P0
	print buf
	.return(buf)
DISPERR:
	print "Unknown type on stack to print\n"
	end
.end

.sub _NORMALIZE_FLOAT	# string normalize_flo(num number)
	.param num number	# INTERNAL, no argc!
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
	.return($S1)
.end

#  Builtin functions for BASIC
#
.sub _BUILTIN_ABS   		# num abs(num arg)
	.param int argc
	.param num arg
	.local num res
	abs res, arg
	.return(res)
.end
# INT - a math function that returns the largest integer less than
#       or equal to a numeric-expression
.sub _BUILTIN_INT   		# num int(num arg)
	.param int argc
	.param num arg
	.local num res
	.local int truncate
	set truncate, arg
	set res, truncate
	ge arg, 0.0, ENDINT
	dec res
ENDINT:	.return(res)
.end
.sub _BUILTIN_CHR_STRING	# string chr(num arg)
	.param int argc
	.param num arg
	.local string res
	.local int truncate
	set truncate, arg
	chr res, truncate
	.return(res)
.end
.sub _BUILTIN_ASC 		# num asc(string arg)
	.param int argc
	.param string arg
	.local int conv
	.local num res
	ord conv, arg
	set res, conv
	.return(res)
.end
.sub _BUILTIN_STR_STRING	# string str(num arg)
	.param int argc
	.param num arg
	.local string res
	set res, arg
	.return(res)
.end
.sub _BUILTIN_VAL 		# num val(string arg)
	.param int argc
	.param string arg
	.local num res
	set res, arg
	.return(res)
.end
.sub _BUILTIN_LEN 		# num len(string arg)
	.param int argc
	.param string arg
	.local num res
	.local int conv
	length conv, arg
	set res, conv
	.return(res)
.end
.sub _BUILTIN_MID_STRING	# string mid(string targ, num start [, num extent])
	.param int argc
	.param string target
	.param num start
        .param num extent :optional
	.param int has_extent :opt_flag

	.local string res
	.local string a
	.local int strlen
	.local int pos
	length strlen, target
	set res, ""
	set pos, start
	dec pos

	if has_extent goto MID3ARG

MIDLOOP:ge pos, strlen, MIDDONE
	substr a, target, pos, 1
	concat res, a
	inc pos
	branch MIDLOOP

MID3ARG:
	.local num count
	.local num extent
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
	.return(res)
.end
.sub _BUILTIN_LEFT_STRING	# string left(string targ, num extent)
	.param int argc
	.param string targ
	.param num extent
	.local string res

	res = _BUILTIN_MID_STRING(3, targ, 1.0, extent)
	.return(res)
.end
.sub _BUILTIN_RIGHT_STRING	# string right(string targ, num extent)
	.param int argc
	.param string targ
	.param num extent
	.local string res
	.local int conv

	length $I0, targ
	set conv, extent
	sub $I0, $I0, conv
	inc $I0
	set $N0, $I0

	res = _BUILTIN_MID_STRING(3,targ,$N0,extent)
	.return(res)
.end
# Modifies the system-wide RANDSEED
# Produces 16-bit pseudo-random numbers.
.sub _BUILTIN_RND	# num rnd([num seed])
	.param int argc
	.local int RANDSEED
	get_global $P0, "RANDSEED"
	set RANDSEED, $P0["value"]
	eq argc, 0, RND_GEN
	.local num repeat

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

	set $P0["value"], RANDSEED
	set_global "RANDSEED", $P0

	.return($N0)
.end
.sub _BUILTIN_TIMER	# num timer()
	.param int argc
	time $N0
	.return($N0)
.end

# num instr(num start, string full, string substring);
.sub _BUILTIN_INSTR :multi(int, num, string, string)
	.param int argc
	.param num start
	.param string full
	.param string substring

	.local int start_i
	start_i = start
	dec start_i   # BASIC starts at 1, parrot at 0.
	$I0 = length substring
	if $I0 == 0 goto ENDINSTR
	$I0 = index full, substring, start_i
ENDINSTR:
	inc $I0
	.return($I0)
.end

# num instr(string full, string substring);
.sub _BUILTIN_INSTR :multi(int, string, string)
	.param int argc
	.param string full
	.param string substring

	.tailcall _BUILTIN_INSTR(argc,1.0,full,substring)
.end

.sub _BUILTIN_UCASE_STRING	# string ucase$(string targ)
	.param int argc
        .param string targ
        .local string res
	res = _XCASE(32,97,122,targ)
	.return(res)
.end
.sub _BUILTIN_LCASE_STRING	# string lcase$(string targ)
	.param int argc
        .param string targ
        .local string res
	res = _XCASE(-32,65,90,targ)
	.return(res)
.end
			# For internal use only.  No ARGC!
.sub _XCASE		# string xcase(string targ, int offset, int lower, int upper
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
	.return($S3)
.end
.sub _BUILTIN_SGN	# num sgn(num number)
	.param int argc
	.param num number
	set $N0, 0.0
	eq number, 0.0, FINISHED
	set $N0, -1.0
	lt number, 0.0, FINISHED
	set $N0, 1.0
FINISHED:
	.return($N0)
.end
.sub _BUILTIN_LOG		# num log(num op)
	.param int argc
	.param num op
	ln op, op
	.return(op)
.end
.sub _BUILTIN_EXP		# num exp(num op)
	.param int argc
	.param num op
	exp op, op
	.return(op)
.end
.sub _BUILTIN_SIN		# num sin(num op)
	.param int argc
	.param num op
	sin op, op
	.return(op)
.end
.sub _BUILTIN_COS		# num cos(num op)
	.param int argc
	.param num op
	cos op, op
	.return(op)
.end
.sub _BUILTIN_TAN		# num tan(num op)
	.param int argc
	.param num op
	tan op, op
	.return(op)
.end
.sub _BUILTIN_ATN		# num atn(num op)
	.param int argc
	.param num op
	atan op, op
	.return(op)
.end
.const num EPSILON = 0.000001
.sub _BUILTIN_SQR		# num sqr(num operand)
	.param int argc
	.param num op
        if op < 0 goto ERR_RANGE
	sqrt op, op
	.return(op)
ERR_RANGE:
	print "Number out of range\n"
	.return(-1.0)
.end
.sub _BUILTIN_TAB_STRING		# string tab(num cols)
	.param int argc
	.param num cols
	.local int PRINTCOL
	get_global $P0, "PRINTCOL"
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
TAB_RET:.return($S0)
.end
.sub _BUILTIN_LTRIM_STRING	# string ltrim(string oldstring)
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
	.return($S0)
.end
.sub _BUILTIN_RTRIM_STRING	# string rtrim(string oldstring)
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
	.return($S0)
.end
.sub _BUILTIN_INPUT_STRING 	# string input$(num numchars[, string fdinfo])
	.param int argc
	.param num numcharsf
	.local int numchars
	.local string res
	set numchars, numcharsf
	.local int fd
	set fd, 0		# Stdin
	eq argc, 1, DOREAD
	.local string fdinfo
	length $I0, fdinfo
	dec $I0
	substr fdinfo, fdinfo, 1, $I0
	set fd, fdinfo
DOREAD: res = _READCHARS(numchars,fd)
	.return(res)
.end
.sub _BUILTIN_INKEY_STRING	# string inkey$(void)
	.param int argc
	.local string res
	_scan_read()		# Put terminal in char-at-a-time mode
	res = _inkey_string()
	.return(res)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
