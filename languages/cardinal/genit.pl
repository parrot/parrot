#!/usr/bin/perl

use strict;
use warnings;

my $PREAMBLE = <<'END';
.include 'interpinfo.pasm'
.macro unless_defined ( x, l )
    .sym int result
    .result = defined .x
    unless .result goto .l
.endm

.macro kdump ( x )
    .sym pmc it
    it = interpinfo .INTERPINFO_NAMESPACE_ROOT
    it = it[ 'parrot'; '_dumper' ]
    it(.x)
.endm

.macro kdump2 ( x, d)
    .sym pmc it
    it = interpinfo .INTERPINFO_NAMESPACE_ROOT
    it = it[ 'parrot'; '_dumper' ]
    it(.x, .d)
.endm
END

my $FILENAME = 'src/preamble';
open my $GH, '>', $FILENAME;
print $GH $PREAMBLE;
close $GH;

`perl -MExtUtils::Command -e cat src/preamble src/ASTGrammar.pir > src/ASTGrammar_gen.pir`;
#unlink $FILENAME;

