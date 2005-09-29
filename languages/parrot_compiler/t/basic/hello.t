# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use lib 'parrot_compiler/lib';
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 2+3 + 3 + 3;
use Test::More;

# Execute 'Hello World' in PASM, PIR and PAST

my %code = ( PASM => << 'END_PASM', PIR => << 'END_PIR', PAST => << 'END_PAST' );

    print "Hello, this is PASM.\n"
    end
END_PASM


.sub test @MAIN
    print "Hello, this is PIR.\n"
.end
END_PIR


Parrot_AST(
  version(Const('0.1'))
 _options(
 ) # _options
 Src_File("PAST tests in t/basic/hello.t")
 Py_Module(
  _()
  Stmts(
   Py_Print(
    Const('Hello, this is PAST.')
   ) # Py_Print
   Py_Print_nl()
  ) # Stmts
 ) # Py_Module
 # end
) # Parrot_AST
END_PAST

my %out = ( PASM => << 'END_PASM', PIR => << 'END_PIR', PAST => << 'END_PAST' );
Hello, this is PASM.
END_PASM
Hello, this is PIR.
END_PIR
Hello, this is PAST.
END_PAST

# PASM tests

$ENV{TEST_PROG_ARGS} = 'parrot.pbc';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot.pasm';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PASM';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PASM';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pasm --language=PASM';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

# PIR tests

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.imc --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pasm --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

# PAST tests

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PAST';
language_output_is( 'ParrotCompiler', $code{PAST}, $out{PAST}, $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.imc --language=PAST';
language_output_is( 'ParrotCompiler', $code{PAST}, $out{PAST},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pasm --language=PAST';
language_output_is( 'ParrotCompiler', $code{PAST}, $out{PAST},
                    $ENV{TEST_PROG_ARGS} );

