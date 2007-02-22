# Copyright (C) 2007, The Perl Foundation.
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

=cut

.namespace

.sub '__onload' :load :init
    $P0 = newclass [ 'Lua::PerlCompiler' ]
    compreg 'Lua', $P0
.end

.namespace [ 'Lua::PerlCompiler' ]

.sub 'unlink' :anon
    .param string filename
    new $P0, .OS
    push_eh _handler
    $P0.'rm'(filename)
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


.sub 'save_pbc' :anon
    .param string pbc_out
    .param string filename
    .local string output
    .local pmc fh
    output = concat filename, '.pbc'
    fh = open output, '>'
    if fh goto L1
    $S0 = err
    print "Can't open '"
    print output
    print "' ("
    print $S0
    print ")\n"
    goto L2
L1:
    print fh, pbc_out
    close fh
L2:
    .return (output)
.end


.sub 'load_script' :anon
    .param string filename
    .local pmc pio
    .local string content
    pio = getclass 'ParrotIO'
    push_eh _handler
    content = pio.'slurp'(filename)
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
#    $I0 = spawnw 'cd'
    $I0 = index filename, '.'
    $S1 = substr filename, 0, $I0
    $S1 .= '.pir'
    unlink($S1)
    $S0 = 'perl -Ilanguages/lua languages/lua/luac.pl '
    $S0 .= filename
    $I0 = spawnw $S0
    .local string pir
    pir = load_script($S1)
    if pir goto L1
    .local pmc ex
    ex = new .Exception
    ex['_message'] =  "no script PIR"
    throw ex
L1:
    .local pmc pir_comp
    pir_comp = compreg 'PIR'
    $P0 = pir_comp(pir)
    .return ($P0)
.end

=over 4

=item compile(pmc code)

Compile C<source>.

=cut

.sub 'compile' :method
    .param pmc source

    $S0 = 'tmp'
    $S1 = $S0 . '.lua'
    $S2 = source
    save_lua($S2, $S1)
    $P0 = compile_file($S1)
    $S3 = save_pbc($P0, $S0)
    load_bytecode $S3
    $P1 = get_root_global 'tmp'
    .return ($P1)
.end


=item evalfiles(file)

Compile and evaluate a file.

=cut

.sub 'evalfiles' :method
    .param pmc file

    $S1 = file
    $P0 = compile_file($S1)
    $S3 = save_pbc($P0, $S0)
    load_bytecode $S3
    $P1 = get_root_global 'tmp'
    .return $P1()
.end

=back

=head1 AUTHOR

Francois Perrad

=cut

