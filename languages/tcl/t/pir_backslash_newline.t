#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests=>1;

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

pir_output_is($pir,$expected,"backslash_newline_subst");
