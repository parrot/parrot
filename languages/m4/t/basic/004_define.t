# $Id$

use strict;

use M4::Test tests => 2*4;

{
  output_is( <<'CODE', <<'OUT', 'simple define' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'macro name with underscore' );
define(`fo_o', `Hello World')
define(`_furc_ht_', `Hallo Welt')
In German fo_o is _furc_ht_.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'macro name with underscore and numbers' );
define(`fo_5o', `Hello World')
define(`_fu123rc_ht_', `Hallo Welt')
In German 4fo_5o is _fu123rc_ht_.
CODE


In German 4Hello World is Hallo Welt.
OUT
}

{
  output_is( <<'CODE', <<'OUT', 'empty expansion' );
define(`foo',     )
define(`furcht',)
In German foo is furcht.  
CODE


In German  is .  
OUT
}
