# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 TITLE

Lua51.pir - A Lua 5.1 compiler.

=head2 Description

This is the base file for the Lua 5.1 compiler.

This file includes the parsing and grammar rules from
the src/ directory, loads the relevant PGE libraries,
and registers the compiler under the name 'Lua'.

=head2 Functions

=over 4

=item C<__onload()>

Loads the PGE libraries needed for running the parser,
and registers the "compile" subroutine as the "Lua"
compiler.

=cut

.namespace [ 'Lua' ]

.loadlib 'perl6_group'

.sub '__onload' :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'dumper.pbc'
#    load_bytecode 'TGE.pbc'

    $P0 = find_global 'Lua', 'compile'
    compreg 'Lua', $P0
.end

=item C<compile(string code)>

=cut

.sub 'compile'
    .param string code
    .local pmc parse
    .local pmc match
    parse = find_global 'Lua::Grammar', 'start'
    match = parse(code, 'grammar'=>'Lua::Grammar')
    unless match goto L1
    _dumper(match, "PGE Dump")
L1:
    .return (match)
.end


.namespace [ 'Lua::Grammar' ]
.include 'languages/lua/src/parse.pir'

.namespace [ 'Lua::Grammar' ]
.include 'languages/lua/src/lua51_grammar_gen.pir'

=back

=head1 AUTHOR

Francois Perrad.

=cut
