#!perl

use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "test tcl compiler, verify double call works");
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

pir_output_is(<<'CODE', <<'OUTPUT', "test tcl compiler global variable interop");
  .sub main @MAIN
     load_bytecode "languages/tcl/lib/tcllib.pbc"
     .local pmc tcl_compiler,compiled_sub
     $P1 = new String
     $P1 = "ok 1" 
     store_global "Tcl", "a", $P1
     tcl_compiler = compreg "TCL"
     compiled_sub = compile tcl_compiler, "puts $a"
     compiled_sub()
  .end 
CODE
ok 1
OUTPUT

