#
# Call.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Expression::Call;

use Carp;

use base qw(Jako::Construct::Expression);

sub new
{
  my $class = shift;
  my ($block, $dest, $ident, @args) = @_;

  confess("Dest (" . ref($block) . ") not Identifer!") unless UNIVERSAL::isa($dest, 'Jako::Construct::Expression::Value::Identifier');
  confess("Ident (" . ref($block) . ") not Identifer!") unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess("Block (" . ref($block) . ") not!") unless UNIVERSAL::isa($block, 'Jako::Construct::Block');

  my $self = bless {
    BLOCK => $block, 

    DEST  => $dest, 
    NAME  => $ident, 
    ARGS  => [ @args ],

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  return $self;
}


sub dest { return shift->{DEST};  }
sub name { return shift->{NAME};  }
sub args { return @{shift->{ARGS}}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $dest  = $self->dest->value;
  my $name  = $self->name->value;

#  $self->DEBUG(0, "Searching for symbol '$name'...");

  my $sym = $self->block->find_symbol($name);

  $self->SYNTAX_ERROR("Call to unknown sub '%s'.", $name) unless $sym;

  my %props = $sym->props;

  my @args  = $self->args;

  if (exists $props{op}) {
    my $op = $props{op};

#    $self->DEBUG(0, "Calling %s%s...", $name, ($op ? ' (op $op)' : ' as op'));

    $name = $op if defined $op;

    print $fh "  $name ", join(", ", $dest, map { $_->compile($fh) } @args), "\n";
  }
  else {
#    $self->DEBUG(0, "Calling '%s' as regular sub (props = %s)...", $name, join(", ", %props));

    foreach my $arg (map { $_->compile($fh) } @args) {
      print $fh "  .arg $arg\n";
    }

    print $fh "  call _${name}\n";
    print $fh "  .result $dest\n";
  }

  return 1;
}

1;
