#!parrot
# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$
# Reads from stdin a file in the format made by fasta.pir
# ./parrot -R jit
# N = 2500000 for fasta

# 2.2 s on AMD@2000/512K cache

# Original by Joshua Isom, heavily hacked by Leopold Toetsch

# create tr table at compile-time
# tr{wsatugcyrkmbdhvnATUGCYRKMBDHVN}
#            {WSTAACGRYMKVHDBNTAACGRYMKVHDBN};

.sub tr_00_init :immediate
    .local pmc tr_array
    tr_array = new 'FixedIntegerArray'  # Todo char array
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
        $P0    = getinterp
        stdin  = $P0.'stdhandle'(0)
        stdout = $P0.'stdhandle'(1)
	# stdout is linebuffered per default - make it block buffered
	stdout.'buffer_size'(8192)

	seq = ''

beginwhile:
	line = stdin.'readline'()
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
		line = chopn line, 1
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
	.local string revline
	linelen = length line

        $P0 = new 'String'
#       $P0.'reverse'(line)
#         reverse is no longer available so
        i = linelen
        revline = ''
rev_loop:
        i -= 1
        $S0 = substr line, i, 1
        revline .= $S0
        if i > 0 goto rev_loop
#
        $P0 = revline
#
        # line was reversed in-place so we need
        line = revline
#
	.const 'Sub' tr_00 = 'tr_00_init'
	line = $P0.'trans'(line, tr_00)

	i = 0
	$S0 = 'x'
print_loop:
	$S0 = substr line, i, 60
	print $S0
	print "\n"
	i += 60
	if i >= linelen goto done
	goto print_loop
done:
	$S0 = ''
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
