# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaperl.pir

=head1 DESCRIPTION

Encapsulation of the compiler written in Perl as a Parrot registered compiler.

This encapsulation is used to implement some Lua functions :

=over 4

=item dofile

=item loadfile

=item loadstring

=back

It's a temporary work. Waiting for the real PIR compiler/interpreter.

=head2 Methods

=over 4

=cut

.namespace []

.sub '__onload' :anon :load :init
    $P0 = newclass [ 'Lua'; 'PerlCompiler' ]
    new $P1, $P0
    compreg 'Lua', $P1
.end

.namespace [ 'Lua'; 'PerlCompiler' ]

.sub 'unlink' :anon
    .param string filename
    new $P0, 'OS'
    push_eh _handler
    $P0.'rm'(filename)
    pop_eh
  _handler:
    .return ()
.end

.sub 'save_lua' :anon
    .param string code
    .param string filename
    .local pmc fh
    fh = open filename, '>'
    if fh goto L1
    $S0 = err
    print "Can't open '"
    print filename
    print "' ("
    print $S0
    print ")\n"
    goto L2
  L1:
    print fh, code
    close fh
  L2:
.end


.sub 'load_script' :anon
    .param string filename
    .local pmc pio
    .local string content
    pio = new 'ParrotIO'
    push_eh _handler
    content = pio.'readall'(filename)
    pop_eh
    if content goto L1
    $S0 = err
    print "Can't slurp '"
    print filename
    print "' ("
    print $S0
    print ")\n"
  L1:
  _handler:
    .return (content)
.end


.sub 'compile_file' :anon
    .param string filename
    .const string out = 'luac.out'
#    $I0 = spawnw 'cd'
    $I0 = index filename, '.'
    $S1 = substr filename, 0, $I0
    $S1 .= '.pir'
    unlink($S1)
    unlink(out)
    $S0 = 'perl -Ilanguages/lua languages/lua/luac.pl '
    $S0 .= filename
    $S0 .= ' > '
    $S0 .= out
    $I0 = spawnw $S0
    .local string pir
    pir = load_script($S1)
    if pir goto L1
    $P0 = new 'ParrotIO'
    $S0 = $P0.'readall'(out)
    unlink(out)  # cleaning up the temporary file
    die $S0
  L1:
    unlink(out)  # cleaning up the temporary file
    .local pmc pir_comp
    pir_comp = compreg 'PIR'
    $P0 = pir_comp(pir)
    .return ($P0)
.end


=item compile(pmc source)

Compile C<source>.

=cut

.sub 'compile' :method
    .param string source

    $S0 = 'tmp'
    $P0 = getprop 'num', self
    unless null $P0 goto L1
    new $P0, 'Integer'
    set $P0, 0
  L1:
    inc $P0
    $S1 = $P0
    $S0 .= $S1
    setprop self, 'num', $P0
    $S1 = $S0 . '.lua'
    save_lua(source, $S1)
    .tailcall compile_file($S1)
.end

=back

=head1 AUTHOR

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
