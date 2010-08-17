# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

.sub main :main
	load_bytecode "PGE.pbc"
	.local pmc p6rule_compile, rulesub, match, variants, variants_p5, iub, it, matches, capt
	.local string pattern, chunk, seq, key, replacement
	.local int readlen, chunklen, seqlen, finallen, i, varnum, count
	p6rule_compile = compreg "PGE::Perl6Regex"

	# Store the regexes we need...
	variants = new 'FixedStringArray'
	variants = 9
	variants[0] = '      agggtaaa|tttaccct      '
	variants[1] = '<[cgt]>gggtaaa|tttaccc<[acg]>'
	variants[2] = 'a<[act]>ggtaaa|tttacc<[agt]>t'
	variants[3] = 'ag<[act]>gtaaa|tttac<[agt]>ct'
	variants[4] = 'agg<[act]>taaa|ttta<[agt]>cct'
	variants[5] = 'aggg<[acg]>aaa|ttt<[cgt]>ccct'
	variants[6] = 'agggt<[cgt]>aa|tt<[acg]>accct'
	variants[7] = 'agggta<[cgt]>a|t<[acg]>taccct'
	variants[8] = 'agggtaa<[cgt]>|<[acg]>ttaccct'
	# and store the p5regex style for printing
	variants_p5 = new 'Hash'
	variants_p5['      agggtaaa|tttaccct      '] = 'agggtaaa|tttaccct'
	variants_p5['<[cgt]>gggtaaa|tttaccc<[acg]>'] = '[cgt]gggtaaa|tttaccc[acg]'
	variants_p5['a<[act]>ggtaaa|tttacc<[agt]>t'] = 'a[act]ggtaaa|tttacc[agt]t'
	variants_p5['ag<[act]>gtaaa|tttac<[agt]>ct'] = 'ag[act]gtaaa|tttac[agt]ct'
	variants_p5['agg<[act]>taaa|ttta<[agt]>cct'] = 'agg[act]taaa|ttta[agt]cct'
	variants_p5['aggg<[acg]>aaa|ttt<[cgt]>ccct'] = 'aggg[acg]aaa|ttt[cgt]ccct'
	variants_p5['agggt<[cgt]>aa|tt<[acg]>accct'] = 'agggt[cgt]aa|tt[acg]accct'
	variants_p5['agggta<[cgt]>a|t<[acg]>taccct'] = 'agggta[cgt]a|t[acg]taccct'
	variants_p5['agggtaa<[cgt]>|<[acg]>ttaccct'] = 'agggtaa[cgt]|[acg]ttaccct'

	iub = new 'Hash'
	iub['b'] = '(c|g|t)'
	iub['d'] = '(a|g|t)'
	iub['h'] = '(a|c|t)'
	iub['k'] = '(g|t)'
	iub['m'] = '(a|c)'
	iub['n'] = '(a|c|g|t)'
	iub['r'] = '(a|g)'
	iub['s'] = '(c|g)'
	iub['v'] = '(a|c|g)'
	iub['w'] = '(a|t)'
	iub['y'] = '(c|t)'
# seems faster with the other method...
# and this was the only regex I could get to work
#	iub['[ <-[b]>*: (b) ]*'] = '(c|g|t)'
#	iub['[ <-[d]>*: (d) ]*'] = '(a|g|t)'
#	iub['[ <-[h]>*: (h) ]*'] = '(a|c|t)'
#	iub['[ <-[k]>*: (k) ]*'] = '(g|t)'
#	iub['[ <-[m]>*: (m) ]*'] = '(a|c)'
#	iub['[ <-[n]>*: (n) ]*'] = '(a|c|g|t)'
#	iub['[ <-[r]>*: (r) ]*'] = '(a|g)'
#	iub['[ <-[s]>*: (s) ]*'] = '(c|g)'
#	iub['[ <-[v]>*: (v) ]*'] = '(a|c|g)'
#	iub['[ <-[w]>*: (w) ]*'] = '(a|t)'
#	iub['[ <-[y]>*: (y) ]*'] = '(c|t)'

	############################################
	# Read in the file
beginwhile:
        $P0      = getinterp
        .include 'stdio.pasm'
        $P1      = $P0.'stdhandle'(.PIO_STDIN_FILENO)
        chunk    = $P1.'read'(65535)
        chunklen = length chunk
	unless chunklen goto endwhile
	# They don't say you have to match case insenitive...
	chunk = downcase chunk
	seq .= chunk
	goto beginwhile
endwhile:
	readlen = length seq

	#############################################
	# Remove all junk
	pattern = '[ ( [ \> \N*: ] )  | \N*:(\n) ]*'
	rulesub = p6rule_compile(pattern)
	match = rulesub(seq)

	capt = match[0]
stripfind:
	unless capt goto endstripfind
	$P0 = pop capt
	$I0 = $P0."from"()
	$I1 = $P0."to"()
	$I1 -= $I0
	seq = replace seq, $I0, $I1, ''
	goto stripfind
endstripfind:
	seqlen = length seq

	###########################################
	# Count the matches
	varnum = elements variants
	i = 0
beginfor:
	count = 0
	unless i < varnum goto endfor

	pattern = variants[i]
	# The spec says to print the p5 style regex, shame on them
	$S0 = variants_p5[pattern]
	print $S0
	print " "
	# And out of spite, use p6 rules anyway
	rulesub = p6rule_compile(pattern)
	match = rulesub(seq)

match_loop:
	unless match goto next
	inc count
	match."next"()
	goto match_loop
next:
	inc i
	print count
	print "\n"
	goto beginfor
endfor:

	#####################################################
	# Final replace to make the sequence a p5 style regex
	.include "iterator.pasm"
	it = iter iub
	set it, .ITERATE_FROM_START
	matches = new 'ResizablePMCArray'
iter_loop:
	unless it goto iter_end
	key = shift it
	replacement = iub[key]
	# Ok, using a regex to match a single fixed character is probably excessive
	# But it's what's wanted...
	rulesub = p6rule_compile(key)
	match = rulesub(seq)

#	capt = match[0]
#switchfind:
#	unless capt goto endswitchfind
#	$P0 = pop capt
#	$I0 = $P0."from"()
#	$I1 = $P0."to"()
#	$I1 -= $I0
#	seq = replace seq, $I0, $I1, replacement
#	goto switchfind
#endswitchfind:

##########################################
switch:
	unless match goto endswitch
	$I0 = match."from"()
	$I1 = match."to"()
	$I1 -= $I0
	$P0 = new 'FixedIntegerArray'
	$P0 = 2
	$P0[0] = $I0
	$P0[1] = $I1
	push matches, $P0
	match."next"()
	goto switch
endswitch:

switchloop:
	unless matches goto endswitchloop
	$P0 = pop matches
	$I0 = $P0[0]
	$I1 = $P0[1]
	seq = replace seq, $I0, $I1, replacement
	goto switchloop
endswitchloop:
#############################################
	goto iter_loop
iter_end:
	finallen = length seq

	print "\n"
	print readlen
	print "\n"
	print seqlen
	print "\n"
	print finallen
	print "\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
