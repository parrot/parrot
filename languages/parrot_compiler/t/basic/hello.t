# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use lib 'parrot_compiler/lib';

use Parrot::Test tests => 3;
use Test::More;


$ENV{TEST_PROG_ARGS} = '--language=PASM';
language_output_is( 'ParrotCompiler', <<'CODE', <<'OUT', 'Hello World in PASM' );
    print "Hello Ponie\n"
    end
CODE
Hello Ponie
OUT


$ENV{TEST_PROG_ARGS} = '--language=PIR';
language_output_is( 'ParrotCompiler', <<'CODE', <<'OUT', 'Hello World in PIR' );
.sub test @MAIN
    print "Hello Cardinal\n"
.end
CODE
Hello Cardinal
OUT

TODO: {
    $TODO = "Works only called as '../../parrot parrot.imc'";
    $ENV{TEST_PROG_ARGS} = '--language=PAST';
    language_output_is( 'ParrotCompiler', <<'CODE', <<'OUT', 'Hello World in PAST' );
Parrot_AST(
  version(Const('0.1'))
 _options(
 ) # _options
 Src_File("test 3 of t/basic/hello.t")
 Py_Module(
  _()
  Stmts(
   Py_Print(
    Const('Hello Pirate')
   ) # Py_Print
   Py_Print_nl()
  ) # Stmts
 ) # Py_Module
 # end
) # Parrot_AST
CODE
Hello Pirate
OUT
};
