use Test::More qw(no_plan);
use Ruby;
use Parse::RecDescent;

$::RD_ERRORS = 1;
$::RD_WARN = 1;
$::RD_HINT = 1;
$Parse::RecDescent::skip = undef;

use YAML; # XXX Just a way to dump the data in a relatively compact form.

ok(1); # If we made it this far, we're ok.

my $parser = Parse::RecDescent->new($Ruby::grammar);

is_deeply($parser->kDEFINED('defined'), [ 'kDEFINED', 'defined' ],
          "kDEFINED 1");

#is_deeply($parser->reservedWord('while'),
#          [ 'reservedWord', 'while' ],
#          "reservedWord $ctr"); $ctr++;

is_deeply($parser->tINTEGER('0'), [ 'tINTEGER', '0' ], "tINTEGER 1");
is_deeply($parser->tINTEGER('02'), [ 'tINTEGER', '02' ], "tINTEGER 2");
is_deeply($parser->tINTEGER('-05'), [ 'tINTEGER', '-05' ], "tINTEGER 3");
is_deeply($parser->tINTEGER('72'), [ 'tINTEGER', '72' ], "tINTEGER 4");
is_deeply($parser->tINTEGER('-72'), [ 'tINTEGER', '-72' ], "tINTEGER 5");
is_deeply($parser->tINTEGER('0b1'), [ 'tINTEGER', '0b1' ], "tINTEGER 6");
is_deeply($parser->tINTEGER('0b01'), [ 'tINTEGER', '0b01' ], "tINTEGER 7");
is_deeply($parser->tINTEGER('-0b1'), [ 'tINTEGER', '-0b1' ], "tINTEGER 8");
is_deeply($parser->tINTEGER('-0b01'), [ 'tINTEGER', '-0b01' ], "tINTEGER 9");
is_deeply($parser->tINTEGER('0xf'), [ 'tINTEGER', '0xf' ], "tINTEGER 10");
is_deeply($parser->tINTEGER('0x3f'), [ 'tINTEGER', '0x3f' ], "tINTEGER 11");
is_deeply($parser->tINTEGER('-0xd'), [ 'tINTEGER', '-0xd' ], "tINTEGER 12");
is_deeply($parser->tINTEGER('-0x2a'), [ 'tINTEGER', '-0x2a' ], "tINTEGER 13");

is_deeply($parser->tFLOAT('1.3'), [ 'tFLOAT', '1.3' ], "tFLOAT 1");
is_deeply($parser->tFLOAT('1.30'), [ 'tFLOAT', '1.30' ], "tFLOAT 2");
is_deeply($parser->tFLOAT('1.030'), [ 'tFLOAT', '1.030' ], "tFLOAT 3");
is_deeply($parser->tFLOAT('1.3e5'), [ 'tFLOAT', '1.3e5' ], "tFLOAT 4");
is_deeply($parser->tFLOAT('1.30e5'), [ 'tFLOAT', '1.30e5' ], "tFLOAT 5");
is_deeply($parser->tFLOAT('1.030e5'), [ 'tFLOAT', '1.030e5' ], "tFLOAT 6");
is_deeply($parser->tFLOAT('1.3e-5'), [ 'tFLOAT', '1.3e-5' ], "tFLOAT 7");
is_deeply($parser->tFLOAT('1.30e-5'), [ 'tFLOAT', '1.30e-5' ], "tFLOAT 8");
is_deeply($parser->tFLOAT('1.030e-5'), [ 'tFLOAT', '1.030e-5' ], "tFLOAT 9");

is_deeply($parser->tCONSTANT('F'), [ 'tCONSTANT', 'F' ], "tCONSTANT 1");
is_deeply($parser->tCONSTANT('File'), [ 'tCONSTANT', 'File' ], "tCONSTANT 2");
is_deeply($parser->tCONSTANT('F32'), [ 'tCONSTANT', 'F32' ], "tCONSTANT 3");
is_deeply($parser->tCONSTANT('F_3a'), [ 'tCONSTANT', 'F_3a' ], "tCONSTANT 4");
is_deeply($parser->tCONSTANT('F_Ba'), [ 'tCONSTANT', 'F_Ba' ], "tCONSTANT 5");

is_deeply($parser->tIDENTIFIER('F'), [ 'tIDENTIFIER', 'F' ],
          "tIDENTIFIER 1");
is_deeply($parser->tIDENTIFIER('File'), [ 'tIDENTIFIER', 'File' ],
          "tIDENTIFIER 2");
is_deeply($parser->tIDENTIFIER('F32'), [ 'tIDENTIFIER', 'F32' ],
          "tIDENTIFIER 3");
is_deeply($parser->tIDENTIFIER('F_3a'), [ 'tIDENTIFIER', 'F_3a' ],
          "tIDENTIFIER 4");
is_deeply($parser->tIDENTIFIER('F_Ba'), [ 'tIDENTIFIER', 'F_Ba' ],
          "tIDENTIFIER 5");
is_deeply($parser->tIDENTIFIER('f'), [ 'tIDENTIFIER', 'f' ],
          "tIDENTIFIER 6");
is_deeply($parser->tIDENTIFIER('file'), [ 'tIDENTIFIER', 'file' ],
          "tIDENTIFIER 7");
is_deeply($parser->tIDENTIFIER('f32'), [ 'tIDENTIFIER', 'f32' ],
          "tIDENTIFIER 8");
is_deeply($parser->tIDENTIFIER('f_3a'), [ 'tIDENTIFIER', 'f_3a' ],
          "tIDENTIFIER 9");
is_deeply($parser->tIDENTIFIER('f_Ba'), [ 'tIDENTIFIER', 'f_Ba' ],
          "tIDENTIFIER 10");

is_deeply($parser->tGLOBALVAR('$F'), [ 'tGLOBALVAR', '$F' ],
          "tGLOBALVAR 1");
is_deeply($parser->tGLOBALVAR('$File'), [ 'tGLOBALVAR', '$File' ],
          "tGLOBALVAR 2");
is_deeply($parser->tGLOBALVAR('$F32'), [ 'tGLOBALVAR', '$F32' ],
          "tGLOBALVAR 3");
is_deeply($parser->tGLOBALVAR('$F_3a'), [ 'tGLOBALVAR', '$F_3a' ],
          "tGLOBALVAR 4");
is_deeply($parser->tGLOBALVAR('$F_Ba'), [ 'tGLOBALVAR', '$F_Ba' ],
          "tGLOBALVAR 5");
is_deeply($parser->tGLOBALVAR('$f'), [ 'tGLOBALVAR', '$f' ],
          "tGLOBALVAR 6");
is_deeply($parser->tGLOBALVAR('$file'), [ 'tGLOBALVAR', '$file' ],
          "tGLOBALVAR 7");
is_deeply($parser->tGLOBALVAR('$f32'), [ 'tGLOBALVAR', '$f32' ],
          "tGLOBALVAR 8");
is_deeply($parser->tGLOBALVAR('$f_3a'), [ 'tGLOBALVAR', '$f_3a' ],
          "tGLOBALVAR 9");
is_deeply($parser->tGLOBALVAR('$f_Ba'), [ 'tGLOBALVAR', '$f_Ba' ],
          "tGLOBALVAR 10");

is_deeply($parser->tINSTANCEVAR('@F'), [ 'tINSTANCEVAR', '@F' ],
	  "tINSTANCEVAR 1");
is_deeply($parser->tINSTANCEVAR('@File'), [ 'tINSTANCEVAR', '@File' ],
	  "tINSTANCEVAR 2");
is_deeply($parser->tINSTANCEVAR('@F32'), [ 'tINSTANCEVAR', '@F32' ],
	  "tINSTANCEVAR 3");
is_deeply($parser->tINSTANCEVAR('@F_3a'), [ 'tINSTANCEVAR', '@F_3a' ],
	  "tINSTANCEVAR 4");
is_deeply($parser->tINSTANCEVAR('@F_Ba'), [ 'tINSTANCEVAR', '@F_Ba' ],
	  "tINSTANCEVAR 5");
is_deeply($parser->tINSTANCEVAR('@f'), [ 'tINSTANCEVAR', '@f' ],
	  "tINSTANCEVAR 6");
is_deeply($parser->tINSTANCEVAR('@file'), [ 'tINSTANCEVAR', '@file' ],
	  "tINSTANCEVAR 7");
is_deeply($parser->tINSTANCEVAR('@f32'), [ 'tINSTANCEVAR', '@f32' ],
	  "tINSTANCEVAR 8");
is_deeply($parser->tINSTANCEVAR('@f_3a'), [ 'tINSTANCEVAR', '@f_3a' ],
	  "tINSTANCEVAR 9");
is_deeply($parser->tINSTANCEVAR('@f_Ba'), [ 'tINSTANCEVAR', '@f_Ba' ],
	  "tINSTANCEVAR 10");

$::RD_TRACE = 1;
#die Dump($parser->expression('i=32'));

#die $Ruby::grammar;

