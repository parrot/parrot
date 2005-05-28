#!perl

use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "test tcl compiler");
  .sub main @MAIN
     load_bytecode "languages/tcl/lib/tcllib.pbc"
     .local pmc tcl_compiler,compiled_sub
     tcl_compiler = compreg "TCL"
     compiled_sub = compile tcl_compiler, "puts {ok 1}"
     compiled_sub()
     compiled_sub = compile tcl_compiler, "puts {ok 2}"
     compiled_sub()
  .end 
CODE
ok 1
ok 2
OUTPUT

