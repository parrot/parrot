#!/usr/bin/perl
# vim: syntax=perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

sub test_rb_file
{
  my ($code, $desc) = @_;
  language_output_is('cardinal', Parrot::Test::slurp_file($code), '', $desc);
}

for (glob './trb/*')
{
  print STDERR "$_\n";
  print "$_\n";
  test_rb_file($_, $_);
}
