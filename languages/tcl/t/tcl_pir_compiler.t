#!perl

use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;
use vars qw($TODO);

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
     store_global "Tcl", "$a", $P1
     tcl_compiler = compreg "TCL"
     compiled_sub = compile tcl_compiler, "puts $a"
     compiled_sub()
  .end 
CODE
ok 1
OUTPUT

TODO: {
  local $TODO = "stack too deep?";

pir_output_is(<<'CODE', <<'OUTPUT', "pass arguments to a tcl proc from PIR");
.sub main @MAIN

  load_bytecode "languages/tcl/lib/tcllib.pbc"

  $P0 = compreg "TCL"
  $P1 = compile $P0, "proc _tmp {a} {puts $a}"
  $P1()

  $P2 = find_global "Tcl", "&_tmp"

  $P3 = new String
  $P3 = "hello"
  $P2($P3)
.end
CODE
hello
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "invoke argless tcl proc from PIR");
.sub _main @MAIN
  load_bytecode "languages/tcl/lib/tcllib.pbc"
  $S1 = 'proc hey {} { puts 11 }; hey; '
  $P1 = compreg 'TCL'
  $P0 = compile $P1, $S1
  $P0()
.end
CODE
11
OUTPUT
}
