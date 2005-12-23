#!parrot -C
# Reads from stdin a file in the format made by fasta.pir
# N = 2500000 for fasta

# XXX Doesn't run with N = 2.5M String handling bug XXX

# Original by Joshua Isom, heavily hacked by Leopold Toetsch

# create tr table at compile-time
# tr{wsatugcyrkmbdhvnATUGCYRKMBDHVN}
#            {WSTAACGRYMKVHDBNTAACGRYMKVHDBN};

.sub tr_00_init :immediate
    .local pmc tr_array
    tr_array = new .FixedIntegerArray   # Todo char array
    tr_array = 256                      # Python compat ;)
    .local string from, to
    from = 'wsatugcyrkmbdhvnATUGCYRKMBDHVN'
    to   = 'WSTAACGRYMKVHDBNTAACGRYMKVHDBN'
    .local int i, ch, r, len
    len = length from
    null i
loop:
    ch = ord from, i
    r  = ord to,   i
    tr_array[ch] = r
    inc i
    if i < len goto loop
    .return(tr_array)
.end

.sub main :main
	.local pmc stdin, stdout
	.local string line, seq
	stdin = getstdin
	stdout = getstdout
	# stdout is linebuffered per default - make it block buffered
	stdout.'setbuf'(8192)

	seq = ''
	## printerr "Reading ...\n"
beginwhile:
	line = readline stdin
	unless line goto endwhile
	$I0 = ord line
	unless $I0 == 62 goto else   # '>' 
		if seq == '' goto no_rev
		print_revcomp(seq)
		seq = ''
	no_rev:
		print line
		goto endif
	else:
		chopn line, 1
		seq .= line
	endif:
	goto beginwhile
endwhile:
	if seq == '' goto done
	print_revcomp(seq)
done:
.end

.sub print_revcomp
	.param string line
	.local int i, linelen, ch
	linelen = length line

	## printerr "Reversing...\n"
	line = "reverse"(line, linelen)
	## printerr "Substing\n"

	.const .Sub tr_00 = 'tr_00_init'
	trans line, tr_00
	## printerr "Printing\n"
	i = 0
	$S0 = 'x'
print_loop:	
	$S0 = substr_r line, i, 60
	print $S0
	print "\n"
	i += 60
	if i >= linelen goto done
	goto print_loop
done:
	$S0 = ''

.end

.sub reverse
	.param string str
	.param int len
	.local int i
	.local string nstr
	i = 0
	nstr = repeat ' ', len
	if len == 0 goto endwhile
	dec len
beginwhile:
	$S0 = substr_r str, i, 1
	substr nstr, len, 1, $S0
	inc i
	dec len
	if len >= 0 goto beginwhile
endwhile:
	$S0 = ''
	.return(nstr)
.end

