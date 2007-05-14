#!perl
# Copyright (C) 2007, The Perl Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 4;

# 1 ##########################
pir_error_output_like( <<'CODE', <<'OUT', "register names with one letter only are invalid" );
.sub main :main
    print $S
.end
CODE
/^error:imcc:'\$S' is not a valid register name.*\n.*in file .*? line 2.*\n/
OUT

# 2 ##########################
pir_error_output_like( <<'CODE', <<'OUT', "register names with one letter only are invalid" );
.sub main :main
    $I = 5
.end
CODE
/^error:imcc:'\$I' is not a valid register name.*\n.*in file .*? line 2.*\n/
OUT

# 3 ##########################
pir_error_output_like( <<'CODE', <<'OUT', "register names with numbers only are invalid" );
.sub main :main
    print $2
.end
CODE
/^error:imcc:'\$2' is not a valid register name.*\n.*in file .*? line 2.*\n/
OUT

# 4 ##########################
pir_error_output_like( <<'CODE', <<'OUT', "register names with more than letter are invalid" );
.sub main :main
    print $str
.end
CODE
/^error:imcc:'\$str' is not a valid register name.*\n.*in file .*? line 2.*\n/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
