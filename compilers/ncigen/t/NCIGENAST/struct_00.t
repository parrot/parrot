#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use lib ('./lib', '../../lib');
use Parrot::Test::NCIGENAST;

plan tests => 1;
ast(<<'CODE');
typedef struct SPITupleTable
{
  MemoryContext tuptabcxt;  /* memory context of result table */
  uint32    alloced;    /* # of alloced vals */
  uint32    free;     /* # of free vals */
  TupleDesc tupdesc;    /* tuple descriptor */
  HeapTuple  *vals;     /* tuples */
} SPITupleTable;
CODE

contains("<complex> => PMC 'NCIGENAST;Struct'");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
