#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_pir;

my($pir,$expected);

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    .local string pre
    .local string post
    
    pre = "This is\\\n    funny\n"
    post = __backslash_newline_subst(pre)
    print post
    end
  .end
  .include "languages/tcl/lib/backslash_newline_subst.imc"  
EOPIR
This is funny
EOF

is(output($pir),$expected,"backslash_newline_subst");
