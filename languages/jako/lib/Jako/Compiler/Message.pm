#!/usr/bin/perl -w
#
# Message.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#

use strict;
use warnings;

package Jako::Compiler::Message;

our ($file, $line, $debug);

BEGIN {
  use base qw(Exporter);
  our @EXPORT = qw($file $line $debug &DEBUG &WARNING &PARSE_ERROR &SYNTAX_ERROR &INTERNAL_ERROR);

  use Carp;
  our @CARP_NOT = qw(Jako::Compiler::Message);
}


sub DEBUG
{
  my ($level, $format, @args) = @_;

  return unless defined $debug and $debug >= $level;

  my $message = $format ? sprintf($format, @args) : '<no message>';

  $file = '<NO FILE>' unless defined $file;
  $line = '' unless defined $line;

  print STDERR "$file [$line]: Debug message: $message\n";
}

sub WARNING
{
  my ($format, @args) = @_;
  my $message = sprintf($format, @args);

  $file = '<NO FILE>' unless defined $file;
  $line = '' unless defined $line;

  print STDERR "$file [$line]: Warning: $message";
}

sub ERROR
{
  my ($kind, $format, @args) = @_;
  my $message = sprintf($format, @args);

  $file = '<NO FILE>' unless defined $file;
  $line = '' unless defined $line;

  if ($debug) {
    confess "$file [$line]: $kind error: $message";
  }
  else {
    die "$file [$line]: $kind error: $message\n";
  }
}

sub PARSE_ERROR
{
  my ($format, @args) = @_;
  ERROR('Parse', $format, @args);
}

sub SYNTAX_ERROR
{
  my ($format, @args) = @_;
  ERROR('Syntax', $format, @args);
}

sub INTERNAL_ERROR
{
  my ($format, @args) = @_;
  ERROR('Internal', $format, @args);
}

1;

