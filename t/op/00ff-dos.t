#! perl -w
use strict;

use Parrot::Test tests => 1;

output_is(<<'CODE', <<'OUT', "fileformat unix");
    print "ok\n"
    end
CODE
ok
OUT
