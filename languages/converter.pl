#! perl -w

=head1 NAME

converter.pl - convert BNF grammar to a Parse::RecDescent grammar

=head1 DESCRIPTION

An early attempt at Python support for Parrot. 

=cut

use strict;
use YAML;
use Parse::RecDescent;

sub modifier {
  my $modifier = shift;
  return '' unless defined $modifier->[0];
  return '(?)'  if $modifier->[0] eq '?';
  return '(s)'  if $modifier->[0] eq '+';
  return '(s?)' if $modifier->[0] eq '*';
}

sub strip_quotes {
  my $string = shift;
  $string =~ s/^'(.*)'$/$1/ if $string=~/^'/;
  $string =~ s/^"(.*)"$/$1/ if $string=~/^"/;
  $string;
}

my $grammargrammar = <<'_EOF_';

rule		: /\w+/ '::=' production
#		{[@item[1,3]]} 
		{ "$item[1] : $item[3]" }

production	: terminal production
#		{[@item]}
		{ "$item[1] $item[2]" }
		| terminal(?) '(' production ')' mod(?) production(?)
#		{[@item]}
		{ $return = '';
		  $return .= $item[1][0] if defined $item[1][0];
		  $return .= " ( $item[3] ) ".::modifier($item[5]);
		  $return .= $item[6][0] if defined $item[6][0];
		}
#		| terminal(?) '[' production ']' mod(?) production(?)
		| terminal(?) '[' production ']' production(?)
#		{[@item]}
		{ $return = '';
		  $return .= $item[1][0] if defined $item[1][0];
		  $return .= " ( $item[3] )(?) ";
		  $return .= $item[5][0] if defined $item[5][0];
		}
		| terminal(?) /<[^>]+>/  production(?)
		{ $return = '';
		  $return .= $item[1][0] if defined $item[1][0];
		  $return .= "# $item[2]\n";
		  $return .= $item[3][0] if defined $item[3][0];
 		}
		| terminal(?) '|' production mod(?)
#		{[@item]}
		{ $return = '';
		  $return .= $item[1][0] if defined $item[1][0];
		  $return .= " | $item[3]" . ::modifier($item[4])
		}
		| terminal '...' production# mod(?)
#		{[@item]}
		{ my $lhs = ::strip_quotes($item[1]);
		  my $rhs = ::strip_quotes($item[3]);
		  "/[$lhs-$rhs]/"
		}
		| terminal
#		{[@item]}
		{ $item[1] }


terminal	: "'" /[^']*/ "'" mod(?)
#		{[@item]}
		{ qq('$item[2]') . ::modifier($item[4]) }
		| '"' /[^"]*/ '"' mod(?)
#		{[@item]}
		{ qq("$item[2]") . ::modifier($item[4]) }
		| /[\\]?[a-zA-Z0-9_]+/ mod(?)
#		{[@item]}
		{ $item[1] . ::modifier($item[2]) }

mod		: '*' | '+' | '?'

_EOF_

my $parser = Parse::RecDescent->new($grammargrammar);

my $file = $ARGV[0];
my @lines;
my @rules;

open FILE,$file or die "Couldn't open '$file': $!";
@lines = <FILE>;
close FILE;

my $in_rule = 0;
for(@lines) {
  chomp;
  next if /^\s*$/;
  next if /^\s*#/;
  if($in_rule) {
    if(/::=/) {
      push @rules,$_;
    }
    else {
      $rules[-1] .= "\n$_";
    }
  }
  else {
    if(/::=/) {
      push @rules,$_;
      $in_rule = 1;
    }
  }
}

for(@rules) {
  print$parser->rule($_) . "\n\n";
}
