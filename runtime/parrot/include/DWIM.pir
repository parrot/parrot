    .param pmc argv     # main is a sub, so we can use .param
    .local string me
    me = argv[0]        # the filename of the calling prog
    .include "iterator.pasm"    # we need iterator constants
    _read(me)
    end
.end

# utility to check if the program is already DWIMmed
# returns (dwim, pos)
.sub _check
    .param pmc pline

    .local int dwim
    .local int state
    .local pmc ci
    ci = new 'Iterator', pline
    ci = .ITERATE_FROM_START
    .local int c
    .local int pos

    null dwim
    null state
    null pos
    dec pos
iter_rep:
    inc pos
    unless ci goto iter_end
    shift c, ci
    if c >= 65 goto dwim1
    if c == 36 goto iter_end
    if c == 35 goto dwim2
    if c == 46 goto iter_end
    goto iter_rep
dwim1:
    dwim = 1
    goto iter_end
dwim2:
    dwim = 2
iter_end:

    .begin_return
    .set_return dwim
    .set_return pos
    .end_return
.end

# DWIM the source
.sub _dwim1
    .param string me
    .param pmc ar
    #concat me, "x"         # test output is in source.pirx
    .local pmc file
    open file, me, 'w'
    unless file, err_write
    .local pmc iter
    iter = new 'Iterator', ar
    iter = .ITERATE_FROM_START
    .local int dwim
    .local int pos
    .local pmc pline
iter_rep:
    unless iter goto iter_end
    shift pline, iter
    # print line
    (dwim, pos) = _check(pline)
    if dwim goto do_dwim
    print file, pline       # print .lines directly
    goto iter_rep
do_dwim:            # DWIM ops lines, doesn't handle P0 = ...
    .local string r     # result string
    r = "\t"
    print file, "   # DWIM "
    .local string word
    .local pmc p
lp1:
    substr word, pline, pos, 1  # get chars
    length $I0, word
    unless $I0 goto lp2
    ord $I0, word
    if $I0 == 9 goto lp2    # until white space
    if $I0 == 32 goto lp2
    if $I0 == 10 goto lp2
    if $I0 == 13 goto lp2
    sub $I0, 64         # make compacter code
    p = new 'SArray'        # argument passing for sprintf
    p = 1
    push p, $I0
    sprintf $S0, "%06b", p
    .local int l
    l = 6
    .local int ix
    ix = 0
l1:
    substr $S1, $S0, ix, 1  # convert binary string
    ord $I0, $S1
    $S2 = " "
    if $I0 != 49 goto l2
    $S2 = "\x1f"
l2:
    concat r, $S2
    inc ix
    dec l
    if l goto l1
    inc pos
    goto lp1

lp2:
    substr word, pline, pos, 100
    chopn word, 1       # append rest w/o newline
    print file, word
    print file, r       # then the DWIM code
    print file, "\n"
    goto iter_rep       # for all lines

iter_end:
    close file
    .begin_return
    .end_return
err_write:
    print "Can't open '"
    print me
    print "' for writing\n"
    exit 1
.end

# deDWIM a source file - lines in ar
.sub _dwim2
    .param string me
    .param pmc ar
    .local string r
    r = ""
    .local pmc iter
    iter = new 'Iterator', ar
    iter = .ITERATE_FROM_START
    .local string line
iter_rep:
    unless iter goto iter_end
    shift line, iter
    index $I0, line, "DWIM.pir" # ignore
    if $I0 > 0 goto iter_rep
    index $I0, line, "  # DWIM "
    if $I0 < 0 goto l1      # normal line
    add $I0, 10         # end pos of the DWIM marker
    index $I1, line, "\t"   # start pos of DWIMmed
    $I3 = $I1
    sub $I2, $I1, $I0
    .local string p1
    .local string p2
    inc $I3
    substr p1, line, $I0, $I2
    substr p2, line, 0, $I3, "" # extract DWIMmed
    # decode
    chopn line, 1       # the newline
    concat r, "    "        # result of decoded
    .local int i
    .local int p
    .local int c
    .local int l
    length l, line
    if l < 6 goto iter_rep
    p = 0
lp:
    c = 0
    i = 1 << 5
lp1:
    substr $S5, line, p, 1
    ord $I4, $S5
    if $I4 == 32 goto nul
    c = c + i
nul:
    i = i >> 1
    inc p
    dec l
    if i goto lp1
    add c, 64
    chr $S5, c
    concat r, $S5
    if l goto lp
    concat r, " "

    concat r, p1
    concat r, "\n"      # put result ttogether

    goto iter_rep       # as long as there are lines
l1:
    concat r, line
    goto iter_rep
iter_end:
    #print r
    #print "\n============\n"
    .local pmc comp
    .local pmc code
    .local pmc interp
    compreg comp, "PIR"     # get a PIR compiler
    code = comp(r)  # compile source
    getinterp interp        # setup argv for eval
    .include "iglobals.pasm"
    set $P5, interp[.IGLOBALS_ARGV_LIST]
    code($P5)           # run it and be done
    end
.end

.sub _read          # read in source code of script
    .param string me
    .local pmc file
    open file, me, 'r'
    unless file, err_open
    .local pmc ar
    .local string line
    .local pmc pline
    ar = new 'ResizablePMCArray'
slurp:
    readline line, file
    pline = new 'String'
    pline = line
    push ar, pline      # and push everythin in Array
    if line goto slurp
    close file
    .local pmc iter
    iter = new 'Iterator', ar
    iter = .ITERATE_FROM_START
    .local int dwim, pos
iter_rep:           # run over array
    unless iter goto iter_end
    shift pline, iter
    (dwim, pos) = _check(pline)
    # print line
    if dwim goto iter_end
    goto iter_rep
iter_end:
    unless dwim goto ok
    if dwim == 2 goto dwim2 # then do either action
    _dwim1(me, ar)
    goto ok
dwim2:
    _dwim2(me, ar)
    goto ok

err_open:
    print "Can't open '"
    print me
    print "' for reading\n"
    exit 1
ok:             # fall through to caller/includer

=head1 TITLE

Parrot::DWIM - Parrot's confusing opcodes made easy.

=head1 SYNOPSIS

    .sub _main
    .include "DWIM.pir"
    print "The answer is\n"
    add $I0, 20, 23
    dec $I0
    print $I0
    print "\nsay's Parrot!\n"
    end
    .end

=head1 DESCRIPTION

The first time you run a program under include DWIM, the
module replaces all the unsightly opcodes from
your source file with the new DWIM comment: B<# DWIM> and runs normally.

The code continues to work exactly as it did before, but
now it looks like this:

    .sub _main
    .include "DWIM.pir"
       # DWIM  "The answer is\n"
       # DWIM  $I0, 20, 23
       # DWIM  $I0
       # DWIM  $I0
       # DWIM  "\nsay's Parrot!\n"
       # DWIM
    .end

=head1 DIAGNOSTICS

=over

=item Can't open 'file' for reading

=item Can't open 'file' for writing

=back

=head1 BUGS

Doesn't work for code like

    I0 = 1

Probably a lot more.

=head1 AUTHOR

Dami^WLeopold Toetsch (as if you couldn't guess)

=head1 COPYRIGHT

Copyright (C) 2003-2008, The Perl Foundation.

This module is free software. It may be used, redistributed
and/or modified under the same terms as Parrot.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
