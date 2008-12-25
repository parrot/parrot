# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

=head1 NAME

src/wmlsstdlibs.pir - WMLScript standard libraries

=head1 DESCRIPTION

See "WMLScript Standard Libraries Specification".

=over 4

=item * Lang : F<languages/WMLScript/runtime/wmlslang.pir>

=item * Float : F<languages/WMLScript/runtime/wmlsfloat.pir>

=item * String : F<languages/WMLScript/runtime/wmlsstring.pir>

=item * Console : F<languages/WMLScript/runtime/wmlsconsole.pir>

=back

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'

.sub '__onload' :load :anon
#    print "__onload (wmlsstdlibs.pir)\n"
    load_bytecode 'languages/WMLScript/runtime/wmlslang.pbc'
    load_bytecode 'languages/WMLScript/runtime/wmlsfloat.pbc'
    load_bytecode 'languages/WMLScript/runtime/wmlsstring.pbc'
    load_bytecode 'languages/WMLScript/runtime/wmlsconsole.pbc'

    new $P0, 'Hash'
    $P1 = getLang()
    $P0[0] = $P1
    $P1 = getFloat()
    $P0[1] = $P1
    $P1 = getString()
    $P0[2] = $P1
    $P1 = getConsole()
    $P0[99] = $P1

    set_hll_global '@stdlibs', $P0
.end

.sub 'not_implemented'
    die "not implemented"
.end

=head2 Helpers

=over 4

=item C<find_lib(int lindex, int findex)>

helper for CALL_LIB* opcodes.

=cut

.sub 'find_lib'
    .param int lindex
    .param int findex
    $P0 = get_hll_global '@stdlibs'
    push_eh _handler
    $P1 = $P0[lindex]
    $P2 = $P1[findex]
    pop_eh
    .return ($P2)
  _handler:
    .const 'Sub' not_implemented = 'not_implemented'
    .return (not_implemented)
.end

=item C<find_lib_url(string url, string function)>

helper for CALL_URL* opcodes.

=cut

.sub 'find_lib_url'
    .param string url
    .param string function
    .local string content
    content = load_script(url)
    unless content goto L1
    .local pmc loader
    .local pmc script
    new loader, 'WmlsBytecode'
    push_eh _handler
    script = loader.'load'(content)
    script['filename'] = url
    .local string gen_pir
    gen_pir = script.'translate'()
    .local pmc pir_comp
    .local pmc pbc_out
    pir_comp = compreg 'PIR'
    pbc_out = pir_comp(gen_pir)
    $P0 = pbc_out[0]
    $P0()
    pop_eh
    .local pmc entry
    $S0 = url
    $S0 .= ':'
    $S0 .= function
    entry = get_hll_global $S0
    if_null entry, L2
    .return (entry)
  L2:
    $S0 = "external function '"
    $S0 .= function
    $S0 .= "' not found in '"
    $S0 .= url
    $S0 .= "'"
    die $S0
  L1:
    die "unable to load compilation unit"
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = e
    $S0 .= "\nverification failed (can't translate '"
    $S0 .= url
    $S0 .= "')"
    e = $S0
    rethrow e
.end

.sub 'load_script'
    .param string filename
    .local pmc fh
    .local string content
    fh = new 'FileHandle'
    push_eh _handler
    content = fh.'readall'(filename)
    pop_eh
    .return (content)
  _handler:
    $S0 = "Can't slurp '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    printerr $S0
    .return ('')
.end

.sub 'save_pbc'
    .param string pbc_out
    .param string filename
    .local string output
    .local pmc fh
    fh = new 'FileHandle'
    output = concat filename, '.pbc'
    push_eh _handler
    fh.'open'(output, 'w')
    pop_eh
    fh.'print'(pbc_out)
    fh.'close'()
    .return (output)
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= output
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

.sub 'save_pir'
    .param string gen_pir
    .param string filename
    .local string output
    .local pmc fh
    fh = new 'FileHandle'
    output = concat filename, '.pir'
    push_eh _handler
    fh.'open'(output, 'w')
    pop_eh
    fh.'print'(gen_pir)
    fh.'close'()
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= output
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end

=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
