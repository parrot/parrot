package Perl6RE;

use 5.006;
use strict;
use warnings;

our @ISA = qw();
our $VERSION = '0.01';

our $grammar = <<'_EOF_';

rx		: "rx" (":" modifier)(s?) body
		{[@item]}
		| "m" (":" modifier)(s?) body
		{[@item]}

modifier	: /e(ach)?/
		| "x" "(" digit(s) ")"
		| digit(s) "x"
		| digit(s) letter(s)
		| "nth" "(" ( digit(s) | identifier ) ")"
		| "p5" | "perl5"
		| "w" | "word"
		| "any"
                | "u0" | "u1" | "u2" | "u3"
		| "i"
		{[@item]}

body		: delimiter expression(?) delimiter
		{[@item]}
		| " " letter expression letter
		{[@item]}
		| "[" expression(?) "]"
		{[@item]}
		| "{" expression(?) "}"
		{[@item]}
		| "(" expression(?) ")"
		{[@item]}
		| "<" expression(?) ">"
		{[@item]}

delimiter	: m/[\/!?=\]})>#]/
		{[@item]}

expression	: term ( "|" term )(s?)
		{[@item]}
term		: factor factor(s?)
		{[@item]}
factor		: "(" expression ")"
		{[@item]}
		| "[" identifier ( "-" identifier )(s?) "]"
		{[@item]}
		| "[" expression "]"
		{[@item]}
		| "<[" character_class "]>"
		{[@item]}
		| "<" identifier ">"
		{[@item]}
		| "#" /[^\n]+/
		{ join ' ',@item[1,2] }
		| metacharacter
		{[@item]}
		| identifier
		{[@item]}
#		| "<" perl_expression ">"
		{[@item]}
#		|				# Will break stuff...

identifier	: sigil(?) /[a-zA-Z][a-zA-Z0-9]*/
		{ $return = $item[2];
		  $return = $item[1][0] . $return if defined $item[1][0];
		}
# This needs to be rethought... And it's likely that it will break.
		| /[-!@#$%^&*_.,+0-9a-zA-Z]+/
		{[@item]}

sigil		: /[\$@%]/

character_class	: (regular_char | special_char)(s)
                  ("-" (regular_char | special_char)(s))(s?)
		{[@item]}

regular_char	: m/[a-zA-Z0-9]/

special_char	: "\\0" /[0-7]+/
		{[@item]}
		| "\\x" /[a-fA-F0-9]+/
		{[@item]}
		| "\\x" "{" /[a-fA-F0-9]+/ "}"
		{[@item]}
		| m/\\p/i "{" identifier "}"
		{[@item]}

digit		: m/[0-9]/
		{[@item]}

letter		: m/[a-zA-Z]/
		{[@item]}

metacharacter	: /[+*?]/ | m/[\^]{1,2}/ | m/[\$]{1,2}/
		{[@item]}
		| m/\\[csdwnSDWN]/
		{[@item]}
		| m/\\[\[\]]/
		{[@item]}
		| m/\\[\{\}]/
		{[@item]}
		| m/\\[\(\)]/
		{[@item]}
		| m/\\[\<\>]/
		{[@item]}
		| /\\0[0-9]/
		{[@item]}
		| special_char
		{[@item]}
		| m/:+/
		{[@item]}
_EOF_

1;
__END__

=head1 NAME

Perl6RE - Sample Perl6 grammar for regular expressions

=head1 SYNOPSIS

  use Perl6RE;
  use Data::Dumper;
  use Parse::RecDescent;
  $p = Parse::RecDescent->new($Perl6RE::grammar);
  print Dumper($p->rx('rx/ ^ <$digit>+ $$ /'));

=head1 DESCRIPTION

Simply loads the Perl6 RE grammar suitable for Parse::RecDescent. Contains no
actual parsing code beyond returning a nested array of arrays consisting of a
pseudo-rational grammar for Perl6 REs

=head2 EXPORT

None by default.

=head1 AUTHOR

Jeff Goff, E<lt>jgoff@perl.orgE<gt>

=head1 SEE ALSO

L<perl>, L<parrot>

=cut
