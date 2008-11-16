#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 2;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test a basic :main sub");
.sub main :main
.end
CODE
.namespace []

.pcc_sub :main main:
    get_params
    end
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test a normal basic sub");
.sub main
.end
CODE
.namespace []
main:
    get_params
    set_returns
    returncc
OUTPUT



# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
