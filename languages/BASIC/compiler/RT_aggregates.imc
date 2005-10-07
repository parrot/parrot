	# Array things.
	# Yes, the _N and _S are cheesy hacks. 
.const int FLOAT = 2
.const int STRING = 3 
.const int PMC = 4
.sub _ARRAY_LOOKUP_N	# float ARRAY_LOOKUP_N(string array, int keycount[, string|float])
	.param string array
        .param int keycount
	.param pmc things :slurpy

	.local string key
	.local pmc BASICARR
	find_global BASICARR, "BASICARR"
	key = _ARRAY_BUILDKEY(keycount,things)
	$P0 = BASICARR[array]
	if key != "" goto ARR_NORMAL
	.return($P0)		# Return the whole array.
ARR_NORMAL:
	$P1 = $P0["hash"]		# forked arrays, awaiting keys()
	$N0 = $P1[key]
	.return($N0)
.end

.sub _ARRAY_LOOKUP_S	# string ARRAY_LOOKUP_S(string array, int keycount[, string|float])
	.param string array
	.param int keycount
	.param pmc things :slurpy

	.local string key
	.local pmc BASICARR
	find_global BASICARR, "BASICARR"
	key = _ARRAY_BUILDKEY(keycount, things)
	$P0 = BASICARR[array]
	if key != "" goto ARR_NORMAL
	.return($P0)
ARR_NORMAL:
	$P1 = $P0["hash"]		# forked arrays, awaiting keys()
	$S0 = $P1[key]
	.return($S0)
ARR_END:
        noop
.end

			# void ARRAY_ASSIGN_N(string array, PerlArray rhs, int keycount[, string|float keys])
			# void ARRAY_ASSIGN_N(string array, string rhs, int keycount[, string|float keys])
.sub _ARRAY_ASSIGN	# void ARRAY_ASSIGN_N(string array, float rhs, int keycount[, string|float keys])
	.param string array
        .param pmc rhs
	.param int keycount
        .param pmc things     :slurpy

	# Assign a number
	.local int rhs_type
	rhs_type = typeof rhs
	if rhs_type == .String goto ASSIGN_STRING
	.local string key
	.local pmc BASICARR
	BASICARR = find_global "BASICARR"

	key = _ARRAY_BUILDKEY(keycount,things)
	$P1 = BASICARR[array]
	$P0 =  $P1["hash"]
	$P0[key] = rhs
	store_global "BASICARR", BASICARR
	goto END_ASSIGN

	# Assign a string
ASSIGN_STRING:
	if rhs_type != .String goto ASSIGN_UNK

	.local string key
	.local pmc BASICARR
	find_global BASICARR, "BASICARR"

	key = _ARRAY_BUILDKEY(keycount, things)
	$P1 =  BASICARR[array]
	$P0 = $P1["hash"]
	$P0[key] = rhs
	store_global "BASICARR", BASICARR
	goto END_ASSIGN

	# Assign a... well, we dunno WTF this is.
ASSIGN_UNK:
	#ne I3, 1, ASSIGN_ERR (handled by calling conventions now)
	.local string key
	.local pmc BASICARR
	find_global BASICARR, "BASICARR"
	key = _ARRAY_BUILDKEY(keycount,things)
	$P1 = BASICARR[array]
	$P0 = $P1["hash"]
	$S0 = rhs[TYPE]

	if $S0 != "STRING" goto NOTSTRING
	$S1 = rhs[VALUE]
	$P0[key]= $S1
	goto END_UNK

NOTSTRING:
	if $S0 != "INT" goto NOTINT
	$I0 = rhs[VALUE]
	$N0 = $I0
	$P0[key] = $N0
	goto END_UNK

NOTINT:	
	if $S0 != "FLOAT" goto ASSIGN_ERR
	$N0 = rhs[VALUE]
	$P0[key] = $N0
	#goto END_UNK

END_UNK:
	store_global "BASICARR", BASICARR
	goto END_ASSIGN

ASSIGN_ERR:
	print "Assignment error"
	print $I0
	end

END_ASSIGN:
	# Temporary, needed only until PerlHash->keys() gets implemented
	find_global BASICARR, "BASICARR"
	$P1 = BASICARR[array]
	$P0 = $P1["index"]
	.local int i
	i = 0
E_A:	
	$S0 = $P0[i]
	if $S0=="" goto E_A2
	if $S0==key goto E_A2
	inc i
	goto E_A
E_A2:	
	$P0[i]=key
	$P1["index"]=$P0
	BASICARR[array]=$P1
	store_global "BASICARR", BASICARR
REALEND:
	noop
.end
# This gets a *lot* easier when PerlHash->keys() gets implemented
.sub _ARRAY_KEYS	# void ARRAY_KEYS(string source, string target)
	.param string source
	.param string target
	.local pmc BASICARR

	.local pmc SRCINDEX
	.local pmc TARGARR
	.local pmc TARGINDEX
	.local int i
	find_global BASICARR, "BASICARR"
	$P0=BASICARR[source]
	SRCINDEX=$P0["index"]
	$P0=BASICARR[target]
	TARGARR=$P0["hash"]
	TARGINDEX=$P0["index"]

	set i, 0
KEYLOOP:set $S0, SRCINDEX[i]
	eq $S0, "", ENDLOOP
	set $S1, i
	set $S2, "|"
	concat $S2, $S2, $S1
	length $I1, $S0
	dec $I1
	substr $S3, $S0, 1, $I1
	TARGARR[$S2]=$S3
	TARGINDEX[i]=$S2
	inc i
	branch KEYLOOP
 
ENDLOOP:noop
.end
#.sub _ARRAY_ASSIGN_S	# void ARRAY_ASSIGN_N(string array, string rhs, int keycount[, string|float keys])
#	.param string array
#	.param string rhs
#	.local string key
#	.local pmc BASICARR
#	find_global BASICARR, "BASICARR"

#	key = _ARRAY_BUILDKEY()   # Will absorb rest of arguments.
#	set $P0, BASICARR[array]
#	set $P0[key], rhs
#
#	store_global "BASICARR", BASICARR
#.end
# These are probably defined somewhere, I can't find them.

.const int FLOAT = 2
.const int STRING = 3

.sub _ARRAY_BUILDKEY   # string ARRAY_BUILDKEY(int keycount[, string|float...])
	.param int keycount
	.param pmc things

	.local string key
	key = ""

	.local pmc thing
	.local int key_type
KEYLOOP:
	if keycount ==0 goto KEYDONE
	thing = shift things
	key_type = typeof thing
	
	key .= "|"
	if key_type == .Float goto ADDFLOAT
	if key_type == .String goto ADDSTRING

	print "Wrong type on stack, key creation\n"
	end
ADDFLOAT:
	$I1 = thing
	$S0 = $I1
	key .= $S0
	dec keycount
	goto KEYLOOP
ADDSTRING:
	$S0 = thing
	key .= $S0
	dec keycount
	goto KEYLOOP
KEYDONE:
	.return(key)
.end
