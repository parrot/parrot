class PAST::Block is PAST::Node;

=NAME PAST::Block

=begin DESCRIPTION
C<PAST::Block> nodes represent lexical scopes within an abstract
syntax tree, and roughly translate to individual Parrot subroutines.
A C<PAST::Block> node nested within another C<PAST::Block> node
acts like a nested lexical scope.

If the block has a C<name> attribute, that becomes the name of
the resulting Parrot sub, otherwise a unique name is automatically
generated for the block.

=end DESCRIPTION

=item blocktype([STRING type])
Get/set the type of the block.  The currently understood values
are 'declaration', 'immediate', and 'method'.  'Declaration' indicates
that a block is simply being defined at this point, while
'immediate' indicates a block that is to be immediately
executed when it is evaluated in the AST (e.g., the immediate
blocks in Perl6 C<if>, C<while>, and other similar statements).

method blocktype($value?) {
    self.attr('blocktype', $value, pir::defined($value));
}


=item closure([value])
Get/set the closure flag for the block to C<value>.  If set,
any block reference returned by the node is to a clone of the
block that has captured the current lexical context.

method closure($value?) {
    self.attr('closure', $value, pir::defined($value));
}


=item control([value])
Get/set the control exception handler for this block to C<value>.
The exception handler can be any PAST tree.  The special (string)
value "return_pir" generates code to handle C<CONTROL_RETURN> exceptions.

method control($value?) {
    self.attr('control', $value, pir::defined($value));
}


=begin item loadinit([past])

Get/set the "load initializer" for this block to C<past>.
The load initializer is a set of operations to be performed
as soon as the block is compiled/loaded.  For convenience,
requests to C<loadinit> autovivify an empty C<PAST::Stmts>
node if one does not already exist.

Within the load initializer, the C<block> PMC register is
automatically initialized to refer to the block itself
(to enable attaching properties, adding the block as a method,
storing in a symbol table, etc.).

=end item

method loadinit($value?) {
    my $has_value := pir::defined($value);

    unless $has_value || pir::exists(self, 'loadinit') {
        $value := PAST::Stmts.new();
        $has_value := 1;
    }

    self.attr('loadinit', $value, $has_value);
}


=item namespace([namespace])
Get/set the namespace for this block.  The C<namespace> argument
can be either a string or an array of strings.

method namespace($value?) {
    self.attr('namespace', $value, pir::defined($value));
}

=item multi([multi])
Get/set the multi signature for this block.  The C<multi> argument
can be either a string or an array of strings.

method multi($value?) {
    self.attr('multi', $value, pir::defined($value));
}


=item hll([hll])
Get/set the C<hll> for this block.

method hll($value?) {
    self.attr('hll', $value, pir::defined($value));
}


=item loadlibs([lib1, lib2, ...])
Get/set the libraries to be loaded at startup. EXPERIMENTAL (not subject to
deprecation policy, yet).

method loadlibs(*@libs) {
    self.attr('loadlibs', @libs, pir::elements(@libs));
}


=item nsentry([nsentry])
Get/set the C<nsentry> for this block.

method nsentry($value?) {
    self.attr('nsentry', $value, pir::defined($value));
}


=begin item
symbol(name [, attr1 => val1, attr2 => val2, ...])

If called with named arguments, sets the symbol hash corresponding
to C<name> in the current block.  The HLL is free to select
any symbol attributes desired, although the 'scope' attribute
is typically used to assist with lexical scoping of PAST::Var
nodes.

If no named arguments are given, returns the current
attribute hash for symbol C<name>.

=end item

method symbol( $name, *%attr ) {
    my %symtable := self<symtable>;

    unless pir::defined(%symtable) {
        %symtable := {};
        self<symtable> := %symtable;
    }

    my %symbol := %symtable{$name};
    if pir::defined(%symbol) {
        if %attr {
            %symbol{$_} := %attr{$_} for %attr;
        }
        return %symbol;
    }

    if %attr {
        %symtable{$name} := %attr;
    }

    return %attr;
}


=begin item
symbol_defaults([attr1 => val1, attr2 => val2, ... ])

Set default attributes for non-existent symbols in the
symbol hash (see C<symbol> above).  If no named arguments
are given, returns the default attribute hash itself.

Currently we just use the '' entry of the symbol hash to
store the default attributes, but it's probably not safe
to rely on this behavior in the future.

=end item

method symbol_defaults( *%attr ) {
    self.symbol('', |%attr);
}


=item symtable([value])
Get/set the symbol table for the block.  May be deprecated in
favor of the C<symbol> method above.

method symtable($value?) {
    self.attr('symtable', $value, pir::defined($value));
}


=item lexical([flag])
Get/set whether the block is lexically nested within
the block that contains it.


method lexical($value?) {
    self.attr('lexical', $value, pir::defined($value), 1);
}


=item compiler([name])
Indicate that the children nodes of this block are to be
compiled using compiler C<name> instead of the standard
PAST compiler.

method compiler($value?) {
    self.attr('compiler', $value, pir::defined($value));
}


=item compiler_args()
Specify named arguments to be passed to the compiler set
through the compiler attribute. Not used if compiler is
not set.

method scope(*@value) {
    self.attr('scope', @value, pir::elements(@value));
}


=item subid([subid])
If C<subid> is provided, then sets the subid for this block.
Returns the current subid for the block, generating a unique
subid for the block if one does not already exist.

our $subid_suffix;

method subid($value?) {
    my $has_value := pir::defined($value);

    unless $has_value || pir::exists(self, 'subid') {
        $value := self.unique();

        $subid_suffix := '_' ~ pir::time__N unless pir::defined($subid_suffix);

        $value := $value ~ $subid_suffix;
        $has_value := 1;
    }

    self.attr('subid', $value, $has_value);
}


=item pirflags([pirflags])
Get/set any pirflags for this block.

method pirflags($value?) {
    self.attr('pirflags', $value, pir::defined($value));
}

=begin head1
AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the author and maintainer.
Please send patches and suggestions to the Parrot porters or
Perl 6 compilers mailing lists.

=end head1

=begin head1
HISTORY

2011-05-23  Brian Gernhardt converted to NQP
2006-11-20  Patrick Michaud added first draft of POD documentation.
2007-11-21  Re-implementation with pdd26 compliance, compiler toolkit

=end head1

=begin head1
COPYRIGHT

Copyright (C) 2006-2011, Parrot Foundation.

=end head1

# Local Variables:
#   mode: perl6
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6

