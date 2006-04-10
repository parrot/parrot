=head1 NAME

PAST - Abstract syntax tree nodes for APL

=head1 DESCRIPTION

This file implements the various abstract syntax tree nodes
needed for APL.  The currently defined ast nodes:

    PAST::Node       - base class for all ast nodes
    PAST::Stmts      - a block of statements
    PAST::Stmt       - a single statement
    PAST::Op         - an APL operation
    PAST::Val        - a constant value
    PAST::Var        - a variable
    PAST::Assign     - an assignment operation

The C<PAST::Node> class itself is derived from C<Hash>, so
that it's easy to store and retrieve attributes from each
node object.

=head1 PAST functions

=over 4

=cut

.namespace [ 'PAST' ]

=item C<__onload()>

Creates the C<PAST::*> classes.

=cut

.sub '__onload' :load
    .local pmc base
    $P0 = getclass 'Hash'
    base = subclass $P0, 'PAST::Node'
    addattribute base, '$.source'                  # original source
    addattribute base, '$.pos'                     # offset position

    $P0 = subclass base, 'PAST::Stmts'
    $P0 = subclass base, 'PAST::Stmt'
    $P0 = subclass base, 'PAST::Exp'
    $P0 = subclass base, 'PAST::Op'
    $P0 = subclass base, 'PAST::Val'
    $P0 = subclass base, 'PAST::Var'
    $P0 = subclass base, 'PAST::Assign'

    $P0 = new .Integer
    store_global "APL::PAST", "$!serno", $P0
.end

.namespace [ 'PAST::Node' ]

=back 

=head2  PAST::Node methods

=over 4

=item C<__init()>

Initializes a new C<PAST::Node> object.

=cut

.sub __init :method
    $P0 = new .String
    $P1 = new .Integer

    setattribute self, "PAST::Node\x0$.source", $P0
    setattribute self, "PAST::Node\x0$.pos", $P1
    .return ()
.end


=item C<set_node(PMC match)>

Initializes the current ast node with the source code
information from a match object (presumably a component
of the parse tree).

=cut

.sub 'set_node' :method
    .param pmc match                               # match object of source
    $P0 = getattribute self, "PAST::Node\x0$.source"
    $S0 = match
    $P0 = $S0
    $P1 = getattribute self, "PAST::Node\x0$.pos"
    $I1 = match.from()
    $P1 = $I1
    .return ()
.end


=item C<source()>

Return the source code associated with the current node.

=cut

.sub 'source' :method
    $P0 = getattribute self, "PAST::Node\x0$.source"
    .return ($P0)
.end


=item C<pos()>

Return the source code offset associated with this
node.

=cut

.sub 'pos' :method
    $P0 = getattribute self, "PAST::Node\x0$.pos"
    .return ($P0)
.end


=item C<generate_unique(STR prefix)>

Generate a unique string that begins with C<prefix>.

=cut

.sub "generate_unique" :method
    .param string prefix
    $P0 = find_global "APL::PAST", "$!serno"
    $S0 = $P0
    $S0 = concat prefix, $S0
    inc $P0
    .return ($S0)
.end


=item C<__dump(PMC dumper, STR label)>

Display the contents of the current node in a form compatible
with C<Data::Dumper>.

=cut

.sub '__dump' :method
    .param pmc dumper
    .param string label
    .local string indent, subindent
    .local pmc iter, val
    .local string key
    .local pmc hash
    .local int hascapts

    (subindent, indent) = dumper.'newIndent'()
    print '=> '
    $S0 = self.source()
    dumper.'genericString'('', $S0)
    $I0 = self.pos()
    print ' @ '
    print $I0
    hascapts = 0
    iter = new .Iterator, self
    iter = 0
  dump_hash_1:
    unless iter goto dump_end
    if hascapts goto dump_hash_2
    print ' {'
    hascapts = 1
  dump_hash_2:
    print "\n"
    print subindent
    key = shift iter
    val = iter[key]
    print '<'
    print key
    print '> => '
    dumper.'dump'(label, val)
    goto dump_hash_1
  dump_end:
    unless hascapts goto end
    print "\n"
    print indent
    print '}'
  end:
    dumper.'deleteIndent'()
.end

=back

=head1 LICENSE

Copyright (c) 2005-2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut
