#!/usr/bin/perl -w
#
# opcheck.pl
#
# Check the opcode table for adherence to a consistent naming standard.
# The standard assumed is:
#
#   * If the types are all the same, collapse them to one.
#
#   * If the first two types are the same (as with set_i == set I I),
#     omit the first type.
#
#   * If the last two types are 'D', omit the last type.
#
#   * There are exceptions for the zero-arg yet type-specific ops:
#     {clear,pop,push}_[inps]
#
# Exit code is the number of errors. If errors are found, the number of
# errors is printed, too. All messages except the final message are
# printed to STDERR.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

open OPTABLE, "opcode_table";

my %arg_types = (
  D => 'ic',
  I => 'i',
  i => 'ic',
  N => 'n',
  n => 'nc',
  P => 'p',
  S => 's',
  s => 'sc',
);

my %op_quals = (
  i  => 'I',
  ic => 'i|D',
  n  => 'N',
  nc => 'n',
  p  => 'P',
  s  => 'S',
  sc => 's',
);

my %exceptions = (
  clear_i => 1,
  clear_n => 1,
  clear_p => 1,
  clear_s => 1,

  pop_i => 1,
  pop_n => 1,
  pop_p => 1,
  pop_s => 1,

  push_i => 1,
  push_n => 1,
  push_p => 1,
  push_s => 1,
);

my $error_count;

my $line;

my %ops;

while (<OPTABLE>) {
  $line++;
  chomp;
  next if m/^\s*#/; # Skip comment lines
  next if m/^\s*$/; # Skip blank lines
  my ($op, $argc, @argv) = split;
  my ($root, @op_qual) = split('_', $op);

  if ($argc != @argv) {
    print STDERR "opcheck.pl: ERROR: Incorrect argument count on line $line:\n    ";
    print STDERR "$_\n";
    $error_count++;
    next;
  }

  my @arg_types = map { $arg_types{$_} } @argv;

  if (grep { !defined $_ } @arg_types) {
    print STDERR "opcheck.pl: ERROR: Unrecognized argument type on line $line:\n    ";
    print STDERR "$_\n";
    $error_count++;
    next;
  }

  if (grep { !exists $op_quals{$_} } @op_qual) {
    print STDERR "opcheck.pl: ERROR: Unrecognized op qualifier on line $line:\n    ";
    print STDERR "$_\n";
    $error_count++;
    next;
  }

  if (exists $ops{$op}) {
    print STDERR "opcheck.pl: ERROR: Duplicate op entry on line $line:\n    ";
    print STDERR "$_\n";
    $error_count++;
    next;
  }

  #
  # Skip over the exceptions:
  #

  next if $exceptions{$op};

  #
  # Prepare for transformation:
  #
 
  my @transforms = ( );

  #
  # If every entry is the same, then collapse to one entry:
  #

  if (@arg_types >= 2) {
    my $count = 0;
    foreach (@arg_types) {
      $count++ if $_ eq $arg_types[0]
    }
    if ($count == scalar(@arg_types)) {
      push @transforms, sprintf("Collapsed '%s' to single '%s'.", join("_", @arg_types), $arg_types[0]);
      @arg_types = ( $arg_types[0] )
    }
  }

  #
  # If the leading two types are the same, collapse them to one:
  #
 
  if (@arg_types > 2 and $arg_types[0] eq $arg_types[1]) {
    push @transforms, sprintf("Collapsed leading '%s' of '%s' to '%s'.",
      join("_", @arg_types[0,1]), join("_", @arg_types), $arg_types[0]);
    shift @arg_types;
  }

  #
  # Ops with two 'D's at the end have only one '_ic' qualifier at the end:
  #

  if (@arg_types > 2 and $argv[-1] eq 'D' and $argv[-2] eq 'D') {
    push @transforms, "Collapsed trailing D_D to D.";
    pop @arg_types;
  }

  #
  # See if we got what we expected:
  #

  my $expected = $root;
  $expected .= '_' . join('_', @arg_types) if (@arg_types);

  if ($op ne $expected) {
    print STDERR "opcheck.pl: ERROR: Opcode $op does not meet standard on line $line (expected $expected):\n";
    if (@transforms) {
      foreach (@transforms) {
        print STDERR " * $_\n";
      }
    }
    $error_count++;
    next;
  }
}

close OPTABLE;

print "opcheck.pl: Found $error_count errors.\n" if $error_count;
exit $error_count;

