	# Array things.
	# Yes, the _N and _S are cheesy hacks. 
.const int FLOAT = 2
.const int STRING = 3 
.const int PMC = 4
.sub _ARRAY_LOOKUP_N	# float ARRAY_LOOKUP_N(string array, int keycount[, string|float])
	saveall
	.param string array
	.local string key
	.local PerlHash BASICARR
	find_global BASICARR, "BASICARR"
	call _ARRAY_BUILDKEY
	.result key
	set $P0, BASICARR[array]
	ne key, "", ARR_NORMAL
	.return $P0		# Return the whole array.
	branch ARR_END
ARR_NORMAL:
	$P1=$P0["hash"]		# forked arrays, awaiting keys()
	set $N0, $P1[key]
	.return $N0
ARR_END:
	restoreall
	ret
.end
.sub _ARRAY_LOOKUP_S	# string ARRAY_LOOKUP_S(string array, int keycount[, string|float])
	saveall
	.param string array
	.local string key
	.local PerlHash BASICARR
	find_global BASICARR, "BASICARR"
	call _ARRAY_BUILDKEY
	.result key
	set $P0, BASICARR[array]
	ne key, "", ARR_NORMAL
	.return $P0
	branch ARR_END
ARR_NORMAL:
	$P1=$P0["hash"]		# forked arrays, awaiting keys()
	set $S0, $P1[key]
	.return $S0
ARR_END:
	restoreall
	ret
.end
			# void ARRAY_ASSIGN_N(string array, PerlArray rhs, int keycount[, string|float keys])
			# void ARRAY_ASSIGN_N(string array, string rhs, int keycount[, string|float keys])
.sub _ARRAY_ASSIGN	# void ARRAY_ASSIGN_N(string array, float rhs, int keycount[, string|float keys])
	saveall
	.param string array
	entrytype $I0, 0

	# Assign a number
	ne $I0, FLOAT, ASSIGN_STRING
	.param float rhs
	.local string key
	.local PerlHash BASICARR
	find_global BASICARR, "BASICARR"

	call _ARRAY_BUILDKEY   # Will absorb rest of arguments.
	.result key
	set $P1, BASICARR[array]
	set $P0, $P1["hash"]
	set $P0[key], rhs
	store_global "BASICARR", BASICARR
	branch END_ASSIGN

	# Assign a string
ASSIGN_STRING:
	ne $I0, STRING, ASSIGN_UNK

	.param string rhs
	.local string key
	.local PerlHash BASICARR
	find_global BASICARR, "BASICARR"

	call _ARRAY_BUILDKEY   # Will absorb rest of arguments.
	.result key
	set $P1, BASICARR[array]
	set $P0, $P1["hash"]
	set $P0[key], rhs
	store_global "BASICARR", BASICARR
	branch END_ASSIGN

	# Assign a... well, we dunno WTF this is.
ASSIGN_UNK:
	ne $I0, PMC, ASSIGN_ERR
	.param PerlArray blob
	.local string key
	.local PerlHash BASICARR
	find_global BASICARR, "BASICARR"
	call _ARRAY_BUILDKEY
	set $P1, BASICARR[array]
	set $P0, $P1["hash"]
	.result key

	set $S0, blob[TYPE]
	ne $S0, "STRING", NOTSTRING
	set $S1, blob[VALUE]
	set $P0[key], $S1
	branch END_UNK

NOTSTRING:
	ne $S0, "INT", NOTINT
	set $I0, blob[VALUE]
	set $N0, $I0
	set $P0[key], $N0
	branch END_UNK

NOTINT:	ne $S0, "FLOAT", ASSIGN_ERR
	set $N0, blob[VALUE]
	set $P0[key], $N0
	branch END_UNK

END_UNK:
	store_global "BASICARR", BASICARR
	branch END_ASSIGN

ASSIGN_ERR:
	print "Assignment error"
	print $I0
	end

END_ASSIGN:
	# Temporary, needed only until PerlHash->keys() gets implemented
	find_global BASICARR, "BASICARR"
	set $P1, BASICARR[array]
	set $P0, $P1["index"]
	.local int i
	set i, 0
E_A:	set $S0, $P0[i]
	eq $S0, "", E_A2
	eq $S0, key, E_A2
	inc i
	branch E_A
E_A2:	$P0[i]=key
	$P1["index"]=$P0
	BASICARR[array]=$P1
	store_global "BASICARR", BASICARR
REALEND:restoreall
	ret
.end
# This gets a *lot* easier when PerlHash->keys() gets implemented
.sub _ARRAY_KEYS	# void ARRAY_KEYS(string source, string target)
	saveall
	.param string source
	.param string target
	.local PerlHash BASICARR

	.local PerlArray SRCINDEX
	.local PerlHash TARGARR
	.local PerlArray TARGINDEX
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
 
ENDLOOP:restoreall
	ret
.end
#.sub _ARRAY_ASSIGN_S	# void ARRAY_ASSIGN_N(string array, string rhs, int keycount[, string|float keys])
#	saveall
#	.param string array
#	.param string rhs
#	.local string key
#	.local PerlHash BASICARR
#	find_global BASICARR, "BASICARR"

#	call _ARRAY_BUILDKEY   # Will absorb rest of arguments.
#	.result key
#	set $P0, BASICARR[array]
#	set $P0[key], rhs
#
#	store_global "BASICARR", BASICARR
#	restoreall
#	ret
#.end
# These are probably defined somewhere, I can't find them.
.const int FLOAT = 2
.const int STRING = 3
.sub _ARRAY_BUILDKEY   # string ARRAY_BUILDKEY(int keycount[, string|float...])
	saveall
	.param int keycount
	.local string key
	set key, ""
KEYLOOP:le keycount, 0, KEYDONE
	entrytype $I0, 0
	concat key, "|"
	eq $I0, FLOAT, ADDFLOAT
	eq $I0, STRING, ADDSTRING
	print "Wrong type on stack, key creation\n"
	end
ADDFLOAT:
	restore $N0
	set $I1, $N0
	set $S0, $I1
	concat key, $S0
	dec keycount
	branch KEYLOOP
ADDSTRING:
	restore $S0
	concat key, $S0
	dec keycount
	branch KEYLOOP

KEYDONE:.return key
	restoreall
	ret
.end
