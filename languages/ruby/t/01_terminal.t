use Test::More qw(no_plan);
use Ruby;
use Parse::RecDescent;

$::RD_ERRORS = 1;
$::RD_WARN = 1;
$::RD_HINT = 1;
$Parse::RecDescent::skip = undef;

use YAML;
ok(1); # If we made it this far, we're ok.

my $parser = Parse::RecDescent->new($Ruby::grammar);

is_deeply($parser->tNUMERIC('0'), [ 'tNUMERIC', '0' ], "tNUMERIC tINTEGER 1");
is_deeply($parser->tNUMERIC('02'), [ 'tNUMERIC', '02' ], "tNUMERIC tINTEGER 2");
is_deeply($parser->tNUMERIC('-05'), [ 'tNUMERIC', '-05' ], "tNUMERIC tINTEGER 3");
is_deeply($parser->tNUMERIC('72'), [ 'tNUMERIC', '72' ], "tNUMERIC tINTEGER 4");
is_deeply($parser->tNUMERIC('-72'), [ 'tNUMERIC', '-72' ], "tNUMERIC tINTEGER 5");
is_deeply($parser->tNUMERIC('0b1'), [ 'tNUMERIC', '0b1' ], "tNUMERIC tINTEGER 6");
is_deeply($parser->tNUMERIC('0b01'), [ 'tNUMERIC', '0b01' ], "tNUMERIC tINTEGER 7");
is_deeply($parser->tNUMERIC('-0b1'), [ 'tNUMERIC', '-0b1' ], "tNUMERIC tINTEGER 8");
is_deeply($parser->tNUMERIC('-0b01'), [ 'tNUMERIC', '-0b01' ], "tNUMERIC tINTEGER 9");
is_deeply($parser->tNUMERIC('0xf'), [ 'tNUMERIC', '0xf' ], "tNUMERIC tINTEGER 10");
is_deeply($parser->tNUMERIC('0x3f'), [ 'tNUMERIC', '0x3f' ], "tNUMERIC tINTEGER 11");
is_deeply($parser->tNUMERIC('-0xd'), [ 'tNUMERIC', '-0xd' ], "tNUMERIC tINTEGER 12");
is_deeply($parser->tNUMERIC('-0x2a'), [ 'tNUMERIC', '-0x2a' ], "tNUMERIC tINTEGER 13");

is_deeply($parser->tNUMERIC('1.3'), [ 'tNUMERIC', '1.3' ], "tNUMERIC tFLOAT 1");
is_deeply($parser->tNUMERIC('1.30'), [ 'tNUMERIC', '1.30' ], "tNUMERIC tFLOAT 2");
is_deeply($parser->tNUMERIC('1.030'), [ 'tNUMERIC', '1.030' ], "tNUMERIC tFLOAT 3");
is_deeply($parser->tNUMERIC('1.3e5'), [ 'tNUMERIC', '1.3e5' ], "tNUMERIC tFLOAT 4");
is_deeply($parser->tNUMERIC('1.30e5'), [ 'tNUMERIC', '1.30e5' ], "tNUMERIC tFLOAT 5");
is_deeply($parser->tNUMERIC('1.030e5'), [ 'tNUMERIC', '1.030e5' ], "tNUMERIC tFLOAT 6");
is_deeply($parser->tNUMERIC('1.3e-5'), [ 'tNUMERIC', '1.3e-5' ], "tNUMERIC tFLOAT 7");
is_deeply($parser->tNUMERIC('1.30e-5'), [ 'tNUMERIC', '1.30e-5' ], "tNUMERIC tFLOAT 8");
is_deeply($parser->tNUMERIC('1.030e-5'), [ 'tNUMERIC', '1.030e-5' ], "tNUMERIC tFLOAT 9");

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

