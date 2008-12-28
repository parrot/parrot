#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use lib "../../lib";
use Parrot::Test tests => 10;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a single const declaration");
.const int x = 42
CODE
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a single namespace declaration");
.namespace []
CODE
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "multiple namespace declaration");
.namespace ['X';'Z']
.namespace ['A';'B']
CODE
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "other chunks");
.HLL "FOO"
.HLL_map "Integer" = "Float"
.loadlib "../../../dan_ops"
.line 42
.file "somefile.pir"
CODE
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test a basic :main sub");
.sub main :main
.end
CODE
.namespace []
.pcc_sub :main main:
    end
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test a normal basic sub");
.sub main
.end
CODE
.namespace []
main:
    set_returns 1
    returncc
OUTPUT


pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test sub with sub pragmas");
.sub main :load :init :immediate :postcomp :anon :multi
.end
CODE
.namespace []
.pcc_sub main:
    set_returns 1
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test sub with vtable pragma");
.sub main :vtable("get_integer")
.end

.sub get_integer :vtable
.end
CODE
.namespace []
.pcc_sub main:
    set_returns 1
    returncc
.namespace []
.pcc_sub get_integer:
    set_returns 5
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test sub with method pragma");
.sub main :method("hello")
.end

.sub bye :method
.end
CODE
.namespace []
.pcc_sub :method main:
    set_returns 1
    returncc
.namespace []
.pcc_sub :method bye:
    set_returns 5
    returncc
OUTPUT

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "test sub with :subid");
.sub main :subid("foo")
.end

CODE
.namespace []
.pcc_sub main:
    set_returns 1
    returncc
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
