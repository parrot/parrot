# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 4;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'simple define' );
define(`foo', `Hello World')
define(`furcht', `Hallo Welt')
In German foo is furcht.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'macro name with underscore' );
define(`fo_o', `Hello World')
define(`_furc_ht_', `Hallo Welt')
In German fo_o is _furc_ht_.
CODE


In German Hello World is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'macro name with underscore and numbers' );
define(`fo_5o', `Hello World')
define(`_fu123rc_ht_', `Hallo Welt')
In German 4fo_5o is _fu123rc_ht_.
CODE


In German 4Hello World is Hallo Welt.
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'empty expansion' );
define(`foo',     )
define(`furcht',)
In German foo is furcht.  
CODE


In German  is .  
OUT
}
