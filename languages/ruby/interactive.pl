#!/usr/bin/perl -w

use strict;
use lib '.';
use YAML;
use Term::ReadLine;
use Parse::RecDescent;
use Ruby;

my $grammar = Parse::RecDescent->new($Ruby::grammar);
my $term = Term::ReadLine->new('foo');
my $prompt = "> ";
my $text;
while(defined($text = $term->readline($prompt))) {
  exit if $text =~ /^q(uit)?/;
  if($text eq 'trace on') {
    $::RD_TRACE = 1;
    print "Trace on\n";
  }
  elsif($text eq 'trace off') {
    $::RD_TRACE = 0;
    print "Trace off\n";
  }
  else {
    my $return = Dump($grammar->program($text));
    print $return;
  }
}
