#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib ('./lib', '../../lib');
use Parrot::Test::NCIGENAST;

plan tests => 10;
ast('extern void AtEOSubXact_SPI(bool isCommit, SubTransactionId mySubid);');
SKIP: {
skip("This feature is commented out");
contains("Parent isCommit bool not defined");
}

ast('typedef void * void_pointer_type;');
istypedef;
ispointer;
decl_ident_is("void_pointer_type");
type_is("void");
is_builtin;

ast('typedef int a, b, c;');
decl_ident_is("a");
decl_ident_is("b");
decl_ident_is("c");

parse('int a(), b(), c()');
parse_failure;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
