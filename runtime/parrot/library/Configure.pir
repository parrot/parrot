# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

Configure.pir - Configure step helpers

=head1 DESCRIPTION

Supply C<genfile> function, which handles

=over 4

=item variable substitution

=item slash/backslash substitution (for Windows).

=back

Pure PIR, without any dependencies.

See as example,
L<http://github.com/fperrad/markdown/blob/master/Configure.pir>

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

.include 'sysinfo.pasm'

.sub 'genfile'
    .param string tmpl
    .param string outfile
    .param pmc config
    $S0 = slurp(tmpl)
    $S0 = subst_config($S0, config)
    $S1 = sysinfo .SYSINFO_PARROT_OS
    $S0 = subst_slash($S0, $S1)
    output(outfile, $S0)
    printerr "\n\tGenerating '"
    printerr outfile
    printerr "'\n\n"
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

.sub 'output' :anon
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

.sub 'subst_config'
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
    printerr "\tunknown config: "
    printerr $S1
    printerr "\n"
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

.sub 'subst_slash'
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

