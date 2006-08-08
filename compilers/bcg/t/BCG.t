#!perl

use strict;
use warnings;
use lib qw( . ../../../lib);
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 32;

pir_output_is( <<'CODE', <<'OUTPUT', "Test create BCG pmc" );
.sub test :main
   	loadlib P1, "bcg_group"
   	new $P1, "BCG"
.end
CODE
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "Test startCodeGen()" );
.sub test :main
   	loadlib P1, "bcg_group"
   	new $P1, "BCG"
   	$P1.startCodeGen()
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test consecutive startCodeGen()" );
.sub test :main
   	loadlib P1, "bcg_group"
   	push_eh catch
   	new $P1, "BCG"
   	$P1.startCodeGen()
   	$P1.startCodeGen()
	end
catch:
	get_results '(0,0)', $P0, $S0
	print $S0
	print "\n"
.end
CODE
Expected BCG to be in INIT state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test endCodeGen()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad call to endCodeGen()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
	$P1.startSub("main","main")
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test startSub() and endSub()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
	$P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad call to startSub()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startSub("foo","")
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad call to startSub()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startSub("main","main")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad call to startSub() endSub()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startSub("main","main")
    $P1.endSub()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad call to endSub()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.endSub()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_SUB state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test startCall() and endCall()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
	$P1.startCall("foo")
	$P1.endCall()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad startCall()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startCall("foo")
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad endCall()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.endCall()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CALL state.
OUTPUT
 
pir_output_is( <<'CODE', <<'OUTPUT', "Test bad endCall()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.endCall()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CALL state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad startCall()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCall("foo")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_SUB state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test startOp() and endOp()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startOp("print")
    $P1.endOp()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad startOp()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startOp("print")
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CODEGEN state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad endOp()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.endOp()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CALL state.
OUTPUT
 
pir_output_is( <<'CODE', <<'OUTPUT', "Test bad endOp()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.endOp()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_CALL state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad startOp()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startOp("print")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_SUB state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test val()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startOp("print")
	$P1.val("1","int")
    $P1.endOp()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad val()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.val("1","int")
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad val()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.val("1","int")
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad val()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.val("1","int")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test var()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startOp("print")
    $P1.var("P1","pmc")
    $P1.endOp()
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad var()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.var("S1","string")
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad var()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.var("P1","pmc")
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad var()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.var("P1","pmc")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_OP state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test label()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.label("wombat")
    $P1.endSub()
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad label()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.label("wombat")
    $P1.endCodeGen()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_SUB state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad label()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.label("wombat")
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
Expected BCG to be in IN_SUB state.
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "Test bad label()" );
.sub test :main
    loadlib P1, "bcg_group"
    push_eh catch
    new $P1, "BCG"
    $P1.startCodeGen()
    $P1.startSub("main","main")
    $P1.startOp("set")
    $P1.var("P1","pmc")
    $P1.val("bcg","string")
    $P1.endOp()
    $P1.startOp("print")
    $P1.var("P1","pmc")
    $P1.endOp()
    $P1.endSub()
    $P1.endCodeGen()
    $P1.printPASM()
    end
catch:
    get_results '(0,0)', $P0, $S0
    print $S0
    print "\n"
.end
CODE
_main:
    set_p_sc P0, "bcg"
    print_p P0
OUTPUT
