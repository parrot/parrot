# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1 + 1;

SKIP:
{
  skip( "`false' not available on $^O", 1 ) if ($^O =~ /MSWin32/);
  skip( "difference between running a process in a fork, or with system()", 1 );
  language_output_is( 'm4', <<'CODE', <<'OUT', 'output of "false"' );
syscmd(`false')
sysval()
CODE

1
OUT
}

{
  skip( "`true' not available on $^O", 1 ) if ($^O =~ /MSWin32/);
 
  language_output_is( 'm4', <<'CODE', <<'OUT', 'output of "true"' );
syscmd(`true')
sysval()
CODE

0
OUT
}
