#
# Compiler.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Compiler;

use base qw(Jako::Processor);

my %reg_count = ( # Registers
  I => 0,
  N => 0,
  P => 0,
  S => 0
);

sub temp_reg { my $type = shift->code; return '$' . $type . $reg_count{$type}++; }
sub temp_int { return '$I' . $reg_count{'I'}++; }
sub temp_num { return '$N' . $reg_count{'N'}++; }
sub temp_str { return '$S' . $reg_count{'S'}++; }


#
# new()
#

sub new
{
  my $class = shift;

  return bless {
    FILE     => undef,
    LINE     => undef,
    LABELS   => [ ],
    COMMENTS => [ ],
    LAST_OP  => 'noop'
  }, $class;
}


#
# push_label()
#
# Used to push a label onto a stack of labels that will get
# printed at the beginning of the next emit_code() call.
#
# Actually, pushes as many labels as there are arguments.
#

sub push_label
{
  my $self = shift;

  push @{$self->{LABELS}}, grep { defined $_ and $_ ne '' } @_;
}


#
# push_comment()
#
# Used to push a comment onto a stack of comments that will get
# printed at the beginning of the next emit_code() call.
#
# Actually, pushes as many comments as there are arguments.
#

sub push_comment
{
  my $self = shift;

  push @{$self->{COMMENTS}}, grep { defined $_ and $_ ne '' } @_;
}


#
# push_source()
#
# Used to push source code comments. This allows them to be
# indented.
#

sub push_source
{
  my $self = shift;

  my $block_indent = '  ' x block_depth();

  $self->push_comment(map { $block_indent . $_ } @_);
}


#
# emit_code()
#
# emit_code LABEL
# emit_code LABEL OP
# emit_code LABEL OP ARGS
# emit_code LABEL OP ARGS COMMENT
#
# Label can be undef.
#

sub emit_code
{
  my $self = shift;

  my ($op, $args, $comment) = @_;

  #
  # Incorporate any comments into the comment stack:
  #

  push_comment($comment) if defined $comment and $comment ne '';
  $comment = undef;

  #
  # Complain about any undefined arguments:
  #

  if (defined $args and grep { !defined $_ } @$args) {
    $self->INTERNAL_ERROR("Undefined arguments to emit_code()!");
    return;
  }

  #
  # Print out all but the last comment, each on a line by itself:
  #
  # NOTE: As of 2001-09-20, the assembler doesn't handle lines with
  # only a label and a comment. So, we write these out separately.
  #

  $comment = pop @{$self->{COMMENTS}} if @{$self->{COMMENTS}};

  foreach my $comment (@{$self->{COMMENTS}}) {
    printf "%-16s %-8s %-25s # %s\n", '', '', '', $comment;
  }

  $self->{COMMENTS} = [ ];

  #
  # Print out all but the last label, each on a line by itself:
  #

#  my $label = pop @{$self->{LABELS}} if @{$self->{LABELS}};
  my $label = undef;

  foreach my $label (@{$self->{LABELS}}) {
    print "$label:\n";
  }

  $self->{LABELS} = [ ];

  #
  # Print out the label for the actual code line (if any):
  #

  if (defined $label and $label ne '') {
    printf "%-16s ", "$label:";
  } else {
    printf "%-16s ", '';
  }

  #
  # Print out the op mnemonic, if any:
  #

  if (defined $op) {
    printf "%-8s", $op;
    $self->{LAST_OP} = $op;
  } else {
    printf "%-8s", '';
  }

  #
  # Print out the arguments, if any:
  #

  if (defined $args and @$args) {
    printf " %-25s", join(", ", map { s/^\$//; $_ } @$args);
  } else {
    printf " %-25s", '';
  }

  #
  # Print out the comment, if any:
  #

  if (defined $comment) {
    printf(" # %s", $comment) if defined $comment;
  }

  #
  # End the line like a good text generator:
  #

  print "\n";
}


1;

