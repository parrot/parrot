# $Id$

use strict;

use Parrot::Test tests => 9;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
index(`0123SUBSTRINGaaaa', `SUBSTRING')
CODE
4
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring at start of string' );
index(`SUBSTRINGaaaa', `SUBSTRING')
CODE
0
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring at end of string' );
index(`0123SUBSTRING', `SUBSTRING')
CODE
4
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring is single letter' );
index(`0123S', `S')
CODE
4
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring not in string' );
index(`0123sUBSTRINGaaaa', `SUBSTRING')
CODE
-1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring with blanks' );
index(`0123SUBST RING', `SUBST RING')
CODE
4
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring partly in string' );
index(`000573SUBSTRIN', `SUBSTRING')
CODE
-1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring with blanks' );
index(`0POS1', `POS1')
CODE
1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring with starting spaces' );
index(    `   3 5  PO S1', `PO S1')
CODE
8
OUT
}
