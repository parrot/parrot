# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use lib 'parrot_compiler/lib';

use Parrot::Test tests => 4 + 2 + 2;
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

# PIR tests

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.imc --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

# PAST tests

# There is a reason why the PAST code isn't invoked as naively expected.
# Leo explains why:

#   When you run the .imc version of the program, C<emit_open> is
#   called in imcc/main.c:526, which sends the output to the to be generated
#   PBC. If you run the .pbc version of your compiler, the emit_open()
#   function isn't executed and the default emitter (number 0) is used,
#   which produces assembly listings (as parrot -o- does).
# 
#   The problem is that such output options can't be passed on to secondary
#   compile runs. They use just what imcc/main used. We probably need a
#   scheme to pass options from the C<compile> opcode to the compiler.

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PAST';
language_output_is( 'ParrotCompiler', $code{PAST}, << 'END_PASM_FROM_PAST', $ENV{TEST_PROG_ARGS} );
__main__:
	new_pad 0 
	print_item 'Hello, this is PAST.' 
	print_newline  
	end  


END_PASM_FROM_PAST

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.imc --language=PAST';
language_output_is( 'ParrotCompiler', $code{PAST}, $out{PAST},
                    $ENV{TEST_PROG_ARGS} );

