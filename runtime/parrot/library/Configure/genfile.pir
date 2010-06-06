# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

Configure/genfile.pir - Configure step helpers

=head1 DESCRIPTION

Supply C<genfile> function, which handles

=over 4

=item variable substitution

=item slash/backslash substitution (for Windows)

=item conditioned line #IF/UNLESS/ELSIF/ELSE

=item with expression evaluation || OR && AND ! NOT (expr) != ==

=back

Pure PIR, without any dependencies.

=head1 USAGE

    # Retrieve the Parrot config
    .local pmc config
    $P0 = getinterp
    config = $P0[.IGLOBALS_CONFIG_HASH]

    # Sometime, we need extra configuration variables
    config['foo'] = 'bar'

    # Here, do the job
    genfile('Makefile.in', 'Makefile', config)

=cut

.loadlib 'sys_ops'
.include 'sysinfo.pasm'

.sub 'genfile'
    .param string tmpl
    .param string outfile
    .param pmc config
    .param int verbose          :named('verbose') :optional
    .param int has_verbose      :opt_flag
    .local int flag_replace_slash
    flag_replace_slash = 1
    $I0 = index outfile, '.'
    if $I0 < 0 goto L1
    $S0 = substr outfile, $I0
    $I0 = index '.c .h .pir .pmc .t', $S0
    if $I0 < 0 goto L1
    flag_replace_slash = 0
  L1:
    $S0 = slurp(tmpl)
    $S0 = conditioned_line($S0, config)
    $S0 = interpolate_var($S0, config)
    $S1 = sysinfo .SYSINFO_PARROT_OS
    unless flag_replace_slash goto L2
    $S0 = replace_slash($S0, $S1)
  L2:
    spew(outfile, $S0)
    unless has_verbose goto L3
    unless verbose goto L3
    print "generate "
    say outfile
  L3:
.end

.sub 'slurp' :anon
    .param string filename
    $P0 = new 'FileHandle'
    push_eh _handler
    $S0 = $P0.'readall'(filename)
    pop_eh
    .return ($S0)
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

.sub 'spew' :anon
    .param string filename
    .param string content
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'w')
    pop_eh
    $P0.'puts'(content)
    $P0.'close'()
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

.sub 'conditioned_line'
    .param string content
    .param pmc config
    $P0 = split "\n", content
    .local string result, line
    .local int truth, former_truth
    former_truth = 0
    result = ''
  L1:
    unless $P0 goto L2
    line = shift $P0
    $I0 = index line, "#IF("
    unless $I0 == 0 goto L10
    $I0 = index line, "):"
    if $I0 < 0 goto L3
    $I1 = $I0 - 4
    $S0 = substr line, 4, $I1
    truth = cond_eval($S0, config)
    former_truth = truth
    unless truth goto L1
    $I0 += 2
    $S0 = substr line, $I0
    goto L4
  L10:
    $I0 = index line, "#UNLESS("
    unless $I0 == 0 goto L20
    $I0 = index line, "):"
    if $I0 < 0 goto L3
    $I1 = $I0 - 8
    $S0 = substr line, 8, $I1
    truth = cond_eval($S0, config)
    former_truth = not truth
    if truth goto L1
    $I0 += 2
    $S0 = substr line, $I0
    goto L4
  L20:
    $I0 = index line, "#ELSIF("
    unless $I0 == 0 goto L30
    $I0 = index line, "):"
    if $I0 < 0 goto L3
    if former_truth goto L1
    $I1 = $I0 - 7
    $S0 = substr line, 7, $I1
    truth = cond_eval($S0, config)
    former_truth = truth
    unless truth goto L1
    $I0 += 2
    $S0 = substr line, $I0
    goto L4
  L30:
    $I0 = index line, "#ELSE:"
    unless $I0 == 0 goto L40
    if former_truth goto L1
    $S0 = substr line, 6
    goto L4
  L40:
  L3:
    $S0 = line
  L4:
    result .= $S0
    result .= "\n"
    goto L1
  L2:
    .return (result)
.end

.sub 'cond_eval'
    .param string expr
    .param pmc config
    .local int pos, end
    end = length expr
    pos = ws(expr, 0, end)
    .tailcall or_expr(expr, pos, end, config)
.end

.sub 'or_expr' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    .local int val1, val2
    (val1, pos) = and_expr(str, pos, end, config)
    pos = ws(str, pos, end)
    $I0 = index str, "||", pos
    if $I0 == pos goto L1
    $I0 = index str, "OR", pos
    if $I0 == pos goto L1
    # or_expr -> and_expr
    .return (val1, pos)
  L1:
    pos = pos + 2
    pos = ws(str, pos, end)
    (val2, pos) = or_expr(str, pos, end, config)
    $I0 = val1 || val2
    # or_expr -> and_expr ( '||' | 'OR' or_expr )
    .return ($I0, pos)
.end

.sub 'and_expr' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    .local int val1, val2
    (val1, pos) = rel_expr(str, pos, end, config)
    pos = ws(str, pos, end)
    $I0 = index str, "&&", pos
    if $I0 == pos goto L1
    $I0 = index str, "AND", pos
    if $I0 == pos goto L2
    # and_expr -> rel_expr
    .return (val1, pos)
  L1:
    pos = pos + 2
    goto L3
  L2:
    pos = pos + 3
  L3:
    pos = ws(str, pos, end)
    (val2, pos) = and_expr(str, pos, end, config)
    $I0 = val1 && val2
    # and_expr -> rel_expr ( '&&' | 'AND' and_expr )
    .return ($I0, pos)
.end

.sub 'rel_expr' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    .local int val1, val2
    (val1, pos) = not_expr(str, pos, end, config)
    pos = ws(str, pos, end)
    $I0 = index str, "==", pos
    if $I0 == pos goto L1
    $I0 = index str, "!=", pos
    if $I0 == pos goto L1
    # rel_expr -> not_expr
    .return (val1, pos)
  L1:
    $S0 = substr str, pos, 2
    pos = pos + 2
    pos = ws(str, pos, end)
    (val2, pos) = not_expr(str, pos, end, config)
    unless $S0 == '==' goto L2
    $I0 = val1 == val2
    # rel_expr -> not_expr '==' not_expr
    .return ($I0, pos)
  L2:
    $I0 = val1 != val2
    # rel_expr -> not_expr '!=' not_expr
    .return ($I0, pos)
.end

.sub 'not_expr' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    $I0 = index str, '!', pos
    if $I0 == pos goto L1
    $I0 = index str, 'NOT', pos
    if $I0 == pos goto L2
    # not_expr -> prim_expr
    .tailcall prim_expr(str, pos, end, config)
  L1:
    pos = pos + 1
    goto L3
  L2:
    pos = pos + 3
  L3:
    pos = ws(str, pos, end)
    .local int val
    (val, pos) = not_expr(str, pos, end, config)
    $I0 = not val
    # not_expr -> ( '!' | 'NOT' ) not_expr
    .return ($I0, pos)
.end

.sub 'prim_expr' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    .local int val
    $S0 = substr str, pos, 1
    unless $S0 == '(' goto L1
    inc pos
    pos = ws(str, pos, end)
    (val, pos) = or_expr(str, pos, end, config)
    pos = ws(str, pos, end)
    $S0 = substr str, pos, 1
    if $S0 == ')' goto L2
    error(str, pos, "')' expected")
  L2:
    inc pos
    # prim_expr -> '(' or_expr ')'
    .return (val, pos)
  L1:
    # prim_expr -> idf
    .tailcall idf(str, pos, end, config)
.end

.include 'cclass.pasm'

.sub 'idf' :anon
    .param string str
    .param int pos
    .param int end
    .param pmc config
    $I1 = pos
  L1:
    $I0 = is_cclass .CCLASS_WORD, str, pos
    unless $I0 goto L2
    inc pos
    if pos >= end goto L2
    goto L1
  L2:
    $I2 = pos - $I1
    $S0 = substr str, $I1, $I2
    $I0 = config[$S0]
    .return ($I0, pos)
.end

.sub 'ws' :anon
    .param string str
    .param int pos
    .param int end
  L1:
    $I0 = is_cclass .CCLASS_WHITESPACE, str, pos
    unless $I0 goto L2
    inc pos
    if pos >= end goto L2
    goto L1
  L2:
    .return (pos)
.end

.sub 'error' :anon
    .param string str
    .param int pos
    .param string msg
    $P0 = getinterp
    .include 'stdio.pasm'
    $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
    $P1.'print'("in '")
    $P1.'print'(str)
    $P1.'print'("' at ")
    $P1.'print'(pos)
    $P1.'print'(" : ")
    $P1.'print'(msg)
    $P1.'print'("\n")
.end

.sub 'interpolate_var'
    .param string content
    .param pmc config
    $P0 = split "\n", content
    .local string result, line
    result = ''
  L1:
    unless $P0 goto L2
    line = shift $P0
    $I0 = 0
    $S0 = ''
  L3:
    $I1 = index line, '@', $I0
    if $I1 < 0 goto L4
  L8:
    $I2 = $I1 - $I0
    inc $I1
    $I3 = index line, '@', $I1
    if $I3 < 0 goto L4
    $S1 = substr line, $I0, $I2
    $S0 .= $S1
    $I4 = $I3 - $I1
    $S1 = substr line, $I1, $I4
    $I7 = exists config[$S1]
    unless $I7 goto L5
    $S2 = config[$S1]
    $S0 .= $S2
    goto L6
  L5:
    $I8 = $I3 + 1
    $I9 = index line, '@', $I8
    if $I9 < 0 goto L7
    $I0 = $I1 - 1
    $I1 = $I3
    goto L8
  L7:
    $P0 = getinterp
    .include 'stdio.pasm'
    $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
    $P1.'print'("\tunknown config: ")
    $P1.'print'($S1)
    $P1.'print'("\n")
  L6:
    $I0 = $I3 + 1
    goto L3
  L4:
    $S1 = substr line, $I0
    $S0 .= $S1
    result .= $S0
    result .= "\n"
    goto L1
  L2:
    .return (result)
.end

.sub 'replace_slash'
    .param string str
    .param string OS
    unless OS == 'MSWin32' goto L1
    $P0 = split "/", str
    str = join "\\", $P0
    $P0 = split "\\\\", str
    str = join "/", $P0
    $P0 = split "\\*", str
    str = join "\\\\*", $P0
    .return (str)
  L1:
    $P0 = split "//", str
    str = join "/", $P0
    .return (str)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

