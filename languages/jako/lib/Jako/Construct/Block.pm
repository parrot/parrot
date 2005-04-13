=head1 NAME

Jako::Construct::Block - Abstract superclass for Jako Blocks.

=head1 SYNOPSIS

TODO

=head1 DESCRIPTION

A subclass of Jako::Construct.

Maintains a symbol table, a referenct to its parent block, and a list of
content Constructs.

=cut

###############################################################################


use strict;
eval "use warnings 'all';";

package Jako::Construct::Block;

use base qw(Jako::Construct);

use Carp;


###############################################################################

=head2 CLASS->new(BLOCK, KIND, TYPE, PREFIX)

If BLOCK is defined, it is the new Block's parent.

The KIND tells what kind of block we are dealing with (sub, while, bare, etc.).

The TYPE tells the return type of the block.

The PREFIX tells the prefix that will be used for block-related labels. For
example, B<while> loops have labels related to the loop control statements,
and these are kept distinct by applying the prefix to the labels. Of course,
the prefix could come explicitly from the source code if the loop was labeled.

TODO: Do we really need KIND, since we have subclasses?

=cut

sub new
{
  my $class  = shift; # Required: string
  my $block  = shift; # Optional: Jako::Construct::Block
  my $kind   = shift; # Required: string (TODO: domain?)
  my $type   = shift; # Optional: TODO: type?
  my $prefix = shift; # Optional: string

  confess "Use Jako::Construct::Block::Bare, not Jako::Construct::Block"
    if $class eq 'Jako::Construct::Block';

  confess "Bad block!"  if defined $block and not (ref $block and $block->isa("Jako::Construct::Block"));
  confess "Extra arguments!" if @_;

  return bless {
    BLOCK   => $block,  # Parent block

    PEER    => undef,   # Peer block (if any).
    KIND    => $kind,   # One of file, sub, if, else, while, etc.
    TYPE    => $type,   # Return type, if any.
    PREFIX  => $prefix, # Prefix, if given in source code.
    SYMBOLS => { },     # Identifiers
    CONTENT => [ ]      # Constructs
  }, $class;
}


###############################################################################

#
# ACCESSORS:
#

sub peer      { return shift->{PEER};  }
sub kind      { return shift->{KIND};  }
sub type      { return shift->{TYPE};   }

sub left      { return shift->{LEFT};  }
sub op        { return shift->{OP};    }
sub right     { return shift->{RIGHT}; }

sub prefix
{
  my $self = shift;
  $self->{PREFIX} = shift if @_;
  return $self->{PREFIX};
}


###############################################################################

=head2 BLOCK->set_symbol(NAME, VALUE)

Set a symbol in this block's symbol table. If the symbol already exists,
we throw an error.

TODO: We should generate real compiler errors and warnings instead of using
confess() and warn().

=cut

sub set_symbol
{
  my $self = shift; # Required: Jako::Construct::Block
  my $name = shift; # Required: string (TODO: domain)
  my $sym  = shift; # Required: TODO: type

  confess "No symbol name!"  unless defined $name;
  confess "No symbol value!" unless defined $sym;
  confess "Bad symbol value!" unless ref $sym and $sym->isa("Jako::Symbol");
  confess "Extra arguments!" if @_;

  die "Redefinition of symbol '$name', which was defined earlier in this block!" if $self->get_symbol($name);
  warn "Definition of symbol '$name' shadows definition in parent block!" if $self->find_symbol($name);

  $self->{SYMBOLS}{$name} = $sym;
}


###############################################################################

=head2 BLOCK->get_symbol(NAME)

Attempt to get a symbol from this block's symbol table only. If there is no
locally defined symbol with that name, then we return undef.

See also: find_symbol(), which will also search (recursively) parent blocks'
symbol tables.

TODO: We should generate real compiler errors and warnings instead of using
die() and warn().

=cut

sub get_symbol
{
  my $self = shift; # Required: Jako::Construct::Block
  my $name = shift; # Required: string (TODO: domain)

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No symbol name!"  unless defined $name;
  confess "Extra arguments!" if @_;

  return $self->{SYMBOLS}{$name};
}


###############################################################################

=head2 BLOCK->symbol_names()

Returns the names of the symbols defined locally in this block.

=cut

sub symbol_names
{
  my $self = shift; # Required: Jako::Construct::Block

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "Extra arguments!" if @_;

  return keys %{$self->{SYMBOLS}};
}


###############################################################################

=head2 BLOCK->dump_symbols()

FOR DEBUGGING ONLY.

Dumps the complete list of symbols visible from this block, including those
from the symbol tables of parent blocks.

=cut

sub dump_symbols
{
  my $self = shift; # Required: Jako::Construct::Block

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "Extra arguments!" if @_;

  my $block = $self; # Start collecting symbols here

  my %table = ();

  my $level = 0;

  while ($block) {
    foreach my $symbol ($block->symbol_names) {
      next if exists $table{$symbol};
      $table{$symbol} = $level;
    }

    $block = $block->block; # Collect symbols from the parent block next
    $level++;
  }

  printf STDERR "%-30s  %s\n", "SYMBOL", "LEVEL";
  printf STDERR "%-30s  %s\n", ("-" x 30), "-----";

  foreach my $symbol (sort keys %table) {
    printf STDERR "%-30s: %d\n", $symbol, $table{$symbol};
  }
}


###############################################################################

=head2 BLOCK->find_symbol(NAME)

Search for a symbol, starting with this block, but also checking parent
blocks recursively until a matching symbol is found or the root block is
encountered without a match (in which case we return undef).

See also: get_symbol(), which searches only locally.

=cut

sub find_symbol
{
  my $self = shift; # Required: Jako::Construct::Block
  my $name = shift; # Required: (TODO: domain)

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No symbol name!"  unless defined $name;
  confess "Extra arguments!" if @_;

  my $sym = $self->get_symbol($name); # Return the identifier if defined here.
  return $sym if defined $sym;

  return undef unless defined $self->block; # Terminate recursion

  return $self->block->find_symbol($name); # Recurse
}


###############################################################################

=head2 BLOCK->find_block(KIND [, LABEL])

Search this block and recursively through parent Blocks for a Block with the
specified kind (such as a while loop) and label (if given).

This is used to find the target blocks for loop control statements.

=cut

sub find_block
{
  my $self = shift;  # Required: Jako::Construct::Block
  my $kind = shift;  # Required: string (TODO: domain)
  my $label = shift; # Optional: string (TODO: domain)

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No block kind!"  unless defined $kind;
  confess "Extra arguments!" if @_;

  if ($self->kind eq $kind) {
    if (defined $label) {
      return $self if $self->prefix eq $label;
    }
    else {
      return $self;
    }
  }

  return undef unless $self->block;

  return $self->block->find_block($kind, $label);
}


###############################################################################

=head2 BLOCK->type_of_ident(NAME)

This is a shortcut method that uses find_symbol() to locate a matching
symbol, and then returns that symbol's type.

=cut

sub type_of_ident
{
  my $self = shift; # Required: Jako::Construct::Block
  my $name = shift; # Required: string (TODO: domain)

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No identifier name!"  unless defined $name;
  confess "Extra arguments!" if @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->type : undef;
}


###############################################################################

=head2 BLOCK->access_of_ident(NAME)

This is a shortcut method that uses find_symbol() to locate a matching
symbol, and then returns that symbol's access (const or not).

=cut


sub access_of_ident
{
  my $self = shift; # Required: Jako::Construct::Block
  my $name = shift; # Required: string (TODO: domain)

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No identifier name!"  unless defined $name;
  confess "Extra arguments!" if @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->kind : undef;
}


###############################################################################

=head2 BLOCK->content()

Return the content list for the Block.

=cut

sub content
{
  my $self = shift; # Required: Jako::Construct::Block

  confess "No block!" unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "Extra arguments!" if @_;

  return @{$self->{CONTENT}};
}


###############################################################################

=head2 BLOCK->push_content(LIST)

Append Constructs to the Block's content list.

=cut

sub push_content
{
  my $self = shift; # Required: Jako::Construct::Block

  confess "No block!"        unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No content!"      unless @_;
  confess "Illegal content!" if grep { not $_->isa("Jako::Construct") } @_;

  push @{$self->{CONTENT}}, @_;
}


###############################################################################

=head2 BLOCK->compile(COMPILER, FILTER)

Compile the block's content using COMPILER. If FILTER is provided, only
those Constructs in the content for which FILTER returns a true value
will be compiled.

The FILTER feature is used to arrange for two passes over the root block.
The first pass compiles all subroutine declarations and definitions, while
the second pass compiles any other content. This is how we collect all the
non-sub stuff into the main sub at the end of the script's compiled code.

=cut


sub compile
{
  my $self     = shift; # Required: Jako::Construct::Block
  my $compiler = shift; # Required: Jako::Compiler
  my $options  = shift; # Optional: Hashref

  confess "No block!"  unless defined $self and ref $self and $self->isa("Jako::Construct::Block");
  confess "No compiler!" unless defined $compiler and ref $compiler and $compiler->isa("Jako::Compiler");
  confess "Bad options!" if defined $options and not (ref $options and ref $options eq 'HASH');
  confess "Extra arguments!" if @_;

  foreach my $construct ($self->content) {
    $construct->compile($compiler, $options);
  }
}


1;

__END__

###############################################################################
###############################################################################

=head1 VERSION

$Id$

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.

=head1 LICENSE

THIS PROGRAM IS FREE SOFTWARE. ITS USE IS SUBJECT TO THE SAME LICENSE AS
THE PARROT VIRTUAL MACHINE.

=cut

