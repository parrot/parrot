# $Id$

use strict;

use M4::Test tests => 1*2 + 1*1;

# all macros
{
  output_is( <<'CODE', <<'OUT', 'all macros' );
Hello World
Hallo Welt
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German foo is furcht.
len(    `this string is 22 long')asdf
index(`0123SUBSTRING', `SUBSTRING')
substr(`0123SUBSTRING', `4')
format( `The string "%s" is "%d" codepoints long.', `012345', `6')
decr(   `0')
incr(   `-1')
syscmd(`touch /tmp/touched_by_Parrot_m4')
ifdef(`foo', `f o o is defined', `f o o is not defined')
ifdef(`foo2', `f o o 2 is defined', `f o o 2 is not defined')
ifelse(`equal', `equal', `the first two arguments are equal', `the first two arguments are not equal')
ifelse(`not_equal', `not equal', `the first two arguments are equal', `the first two arguments are not equal')
ifelse(
This 
is
a 
multi 
line 
comment
)no comment
eval(   `4')
CODE
Hello World
Hallo Welt


In German Hello World is Hallo Welt.
22asdf
4
SUBSTRING
The string "012345" is "6" codepoints long.
-1
0

f o o is defined
f o o 2 is not defined
the first two arguments are equal
the first two arguments are not equal
no comment
4
OUT
}


# all macros with '--prefix_builtins
{
  my $code = << 'CODE';
Hello World
Hallo Welt
m4_define(`foo', `Hello World')
m4_define(`furcht', `Hallo Welt')
In German foo is furcht.
m4_len(    `this string is 22 long')asdf
m4_index(`0123SUBSTRING', `SUBSTRING')
m4_substr(`0123SUBSTRING', `4')
m4_format( `The string "%s" is "%d" codepoints long.', `012345', `6')
m4_decr(   `0')
m4_incr(   `-1')
m4_syscmd(`touch /tmp/touched_by_Parrot_m4')
CODE

  my $out = << 'OUT';
Hello World
Hallo Welt


In German Hello World is Hallo Welt.
22asdf
4
SUBSTRING
The string "012345" is "6" codepoints long.
-1
0

OUT
  open( my $m4_fh, '>', 't/builtins/all_macros.m4' ) or die "Can't open 'all_macros.m4': $!";
  print $m4_fh $code;
  close( $m4_fh );
  my $real_out = `../../parrot m4.pbc --prefix-builtins t/builtins/all_macros.m4`;
  is( $real_out, $out, 'all macros with --prefix-builtins' );
}
