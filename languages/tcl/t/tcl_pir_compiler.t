#!perl

use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "test tcl compiler, verify double call works");
  .sub main :main
     load_bytecode "languages/tcl/lib/tcllib.pbc"
     .local pmc tcl_compiler,compiled_sub
     tcl_compiler = compreg "TCL"
     compiled_sub = tcl_compiler("puts {ok 1}")
     compiled_sub()
     compiled_sub = tcl_compiler("puts {ok 2}")
     compiled_sub()
  .end 
CODE
ok 1
ok 2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "test tcl compiler global variable interop");
  .sub main :main
     load_bytecode "languages/tcl/lib/tcllib.pbc"
     .local pmc tcl_compiler,compiled_sub
     $P1 = new String
     $P1 = "ok 1" 
     store_global "Tcl", "$a", $P1
     tcl_compiler = compreg "TCL"
     compiled_sub = tcl_compiler("puts $a")
     compiled_sub()
  .end 
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "pass arguments to a tcl proc from PIR");
.sub main :main

  load_bytecode "languages/tcl/lib/tcllib.pbc"

  $P0 = compreg "TCL"
  $P1 = $P0("proc _tmp {a} {puts $a}")
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
.sub _main :main
  load_bytecode "languages/tcl/lib/tcllib.pbc"
  $S1 = 'proc hey {} { puts 11 }; hey; '
  $P1 = compreg 'TCL'
  $P0 = $P1($S1)
  $P0()
.end
CODE
11
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "Verify HLL autoboxing: Int");
.HLL 'Tcl', 'tcl_group'
.sub _main :main
  $P1 = test()
  $S1 = typeof $P1
  print $S1
  print_newline
.end
.sub test
  .return (1)
.end
CODE
TclInt
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Verify HLL autoboxing: String");
.HLL 'Tcl', 'tcl_group'
.sub _main :main
  $P1 = test()
  $S1 = typeof $P1
  print $S1
  print_newline
.end
.sub test
  .return ("coke")
.end
CODE
TclString
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Verify HLL autoboxing: Float");
.HLL 'Tcl', 'tcl_group'
.sub _main :main
  $P1 = test()
  $S1 = typeof $P1
  print $S1
  print_newline
.end
.sub test
  .return (8.14)
.end
CODE
TclFloat
OUTPUT
