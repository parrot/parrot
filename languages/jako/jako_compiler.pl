#! /usr/bin/perl -w
#
# compile.pl - compile a Jako source file Parrot assembly file.
#
# Jako is a *very* simple language with just enough complexity to allow the
# implementation of little programs with while loops.
#
#   * Global data only
#   * No user subroutine definitions
#
# by Gregor N. Purdy <gregor@focusresearch.com>
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as Perl itself.
#

use strict;


#
# Global variables:
#

my $line;    # Current source line number
my %ident;   # Identifiers
my %regs = ( # Registers
  I => [ undef ],
  S => [ undef ]
);

my $block_count = 0;
my @block_stack = ();


#
# declare_var()
#

sub declare_var
{
  my ($name, $type) = @_;

#  printf(STDERR "jako: debug: Declaring variable '%s' of type '%s'...\n", $name, $type);

  if ($ident{$name}) {
    printf STDERR "jako: Redeclaration of variable '%s' on line %d. Previous declaration on line %d.\n",
      $name, $line, $ident{$name}{LINE};
    return 0;
  } else {
    my $num = scalar @{$regs{$type}};

    $ident{$name}{LINE} = $line;
    $ident{$name}{TYPE} = $type;
    $ident{$name}{NUM}  = $num;
    $ident{$name}{REG}  = "$type$num";

    $regs{$type}[$num]{LINE} = $line;
    $regs{$type}[$num]{NAME} = $name;

    print "# $name: $type$num\n";

    return 1;
  }
}


#
# assign_var()
#

sub assign_var
{
  my ($name, $type, $value) = @_;

  if ($ident{$name}) {
    if ($type eq '*') {
      if ($ident{$value}) {
        printf "%-12s %-8s %s\n", '', 'set', "$ident{$name}{REG}, $ident{$value}{REG}";
      } else {
        printf(STDERR "jako: Assignment from undefined variable '%s' on line %d.\n",
          $value, $line);
      }
    } elsif ($ident{$name}{TYPE} eq $type) {
      printf "%-12s %-8s %s\n", '', 'set', "$ident{$name}{REG}, $value";
    } else {
      printf(STDERR "jako: Assignment of %s variable from %s value not allowed on line %d.\n", 
        $ident{$name}{TYPE}, $type, $line);
    }
  } else {
    printf(STDERR "jako: Assignment to undefined variable '%s' on line %d.\n",
      $name, $line);
  }
}


#
# map_args()
#

sub map_args
{
  my (@args) = @_;
  my @result;

  foreach my $arg (@args) {
    $arg =~ s/^\s+//;
    $arg =~ s/\s+$//;

    if ($ident{$arg}) {
      push @result, $ident{$arg}{REG};
    } elsif ($arg =~ m/^"/) {
      push @result, $arg;
    } elsif ($arg =~ m/^\d+$/) {
      push @result, $arg;
    } else {
      printf(STDERR "jako: Unrecognized argument '%s' on line %d.\n", $arg, $line);
      push @result, "<err>";
    }
  }

  return @result;
}


#
# void_func()
#

sub void_func
{
  my ($name, @args) = @_;

  if ($name eq 'print') {
    @args = map_args(@args);
    printf "%-12s %-8s %s\n", '', $name, join(", ", @args);
  } else {
    printf(STDERR "jako: Unrecognized function '$name' on line %d.\n", $name, $line);
  }
}


#
# assign_func()
#

sub assign_func
{
  my ($dest, $name, @args) = @_;

  if ($name eq 'mod') {
    @args = map_args($dest, @args);
    printf "%-12s %-8s %s\n", '', $name, join(", ", @args);
  } else {
    printf(STDERR "jako: Unrecognized function '$name' on line %d.\n", $name, $line);
  }
}


#
# begin_while()
#
# TODO: Support more than just register-to-register '==' and '!='.
#

sub begin_while
{
  my ($cond) = @_;

  $block_count++;
  my $prefix = "L_$block_count";
  push @block_stack, { NEXT => $line, PREFIX => $prefix };

  if ($cond =~ m/^(.*)\s*==\s*(.*)$/) {
    my @args = map_args($1, $2);
    printf "%-12s %-8s %s\n", "${prefix}_NEXT:", "eq", "$args[0], $args[1], ${prefix}_REDO, ${prefix}_LAST";
    printf "%s_REDO:\n", $prefix;
  } elsif ($cond =~ m/^(.*)\s*!=\s*(.*)$/) {
    my @args = map_args($1, $2);
    printf "%-12s %-8s %s\n", "${prefix}_NEXT:", "ne", "$args[0], $args[1], ${prefix}_REDO, ${prefix}_LAST";
    printf "%s_REDO:\n", $prefix;
  } else {
    printf(STDERR "jako: Syntax error. Unrecognized condition in while on line %d.\n", $line);
  }
}


#
# end_while()
#

sub end_while
{
  my $prefix = "L_$block_count";

  unless (@block_stack) {
    printf(STDERR "jako: Syntax error. Closing brace without open block on line %d.\n", $line);
    return;
  }

  pop @block_stack;

  printf "%s_LAST:\n", $prefix;
}


#
# parse_args()
#

sub parse_args
{
  my ($args) = @_;
  my @args;

  while ($args ne '') {
    $args =~ s/^\s+//;

    if ($args =~ m/^(\"[^\\\"]*(?:\\.[^\\\"]*)*\")\s*(,\s*(.*))?$/) {
      push @args, $1;
      $args = $3 || '';
    } elsif ($args =~ m/^([^,]+)\s*(,\s*(.*))?$/) {
      push @args, $1;
      $args = $3 || '';
    } else {
      printf(STDERR "jako: Syntax error. Cannot parse argument list '$args' on line %d.\n", $line);
      return ();
    }
  }

  return @args;
}


#
# MAIN PROGRAM:
#

print "# This file produced by the Jako Compiler\n";

while(<>) {
  $line++;

  if (m/\s*#/) { # Pass comment-only lines through intact.
    print;
    next;
  }

  chomp; # Trim trailing newline
  s/^\s*//; # Trim leading whitespace
  s/\s*$//; # Trim trailing whitespace
  next if (/^\#/ || $_ eq ""); # Skip comment and blank lines
  last if (/^__END__$/);       # Done after __END__ token

  s/\s*;\s*$//; # Remove trailing semicolons

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s+is\s+int(eger)?$/) {
    declare_var($1, 'I');
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s+is\s+string$/) {
    declare_var($1, 'S');
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s*=\s*(\d+)$/) {
    assign_var($1, 'I', $2);
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s*=\s*(\"[^\\\"]*(?:\\.[^\\\"]*)*\")$/) {
    assign_var($1, 'S', $2);
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s*=\s*([A-Za-z][A-Za-z0-9_]*)$/) {
    assign_var($1, '*', $2);
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\((.*)\)$/) {
    void_func($1, parse_args($2));
    next;
  }

  if (m/^([A-Za-z][A-Za-z0-9_]*)\s*=\s*([A-Za-z][A-Za-z0-9_]*)\((.*)\)$/) {
    assign_func($1, $2, split(/\s*,\s*/, $3));
    next;
  }

  if (m/^while\s*\(\s*(.*)\s*\)\s*{$/) {
    begin_while($1);
    next;
  }

  if (m/^}$/) {
    end_while();
    next;
  }

  if (m/^end$/) {
    printf "%-12s %-8s\n", '', 'end';
    next;
  }

  print "jako: Syntax error on line $line: '$_'.\n";
}

exit 0;

#
# End of file.
#
