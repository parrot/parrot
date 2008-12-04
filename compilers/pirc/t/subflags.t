#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$


use lib "../../lib";
use Parrot::Test tests => 1;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test for :main");
.sub main :main
.end
CODE
.namespace []
.pcc_sub :main main:
    end
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
