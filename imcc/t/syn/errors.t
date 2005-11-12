#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test;

## tests for imcc error messages

pir_output_like(<<'CODE', <<'OUT', "op not found");
.sub 'test' :main
    branch $P0
.end
CODE
/.*The opcode 'branch_p' \(branch\<1\>\) was not found\. Check the type and number of the arguments.*/
OUT


## remember to change the number of tests
BEGIN { plan tests => 1; }
