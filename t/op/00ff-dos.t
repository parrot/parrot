#! perl -w
use strict;

use Parrot::Test tests => 2;

output_is(<<'CODE', <<'OUT', "fileformat dos");
    print "ok\n"
    end
CODE
ok
OUT

output_is(<<'CODE', <<'OUT', "fileformat dos w ctrl-z");
    print "ok\n"
    end

CODE
ok
OUT
