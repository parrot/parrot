#!parrot -j
# Reads from stdin a file in the format made by fasta.pir
# N = 2500000 for fasta

# 2.2 s on AMD@2000/512K cache

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

	reverse line

	.const .Sub tr_00 = 'tr_00_init'
	trans line, tr_00

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

