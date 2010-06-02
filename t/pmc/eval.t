#! perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test::Util 'create_tempfile';

use Parrot::Test tests => 17;

=head1 NAME

t/pmc/eval.t - Dynamic Code Evaluation

=head1 SYNOPSIS

    % prove t/pmc/eval.t

=head1 DESCRIPTION

Tests on-the-fly PASM, PIR and PAST compilation and invocation.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "eval_sc" );
    compreg P1, "PASM"	# get compiler
    set_args "0", "print \"in eval\\n\"\nset_returns \"()\"\nreturncc\n"
    invokecc P1			# compile
    get_results "0", P0
    invokecc P0			# eval code P0
    print "back again\n"
    end
CODE
in eval
back again
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "call subs in evaled code " );
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    set_args "0", S5
    invokecc P1
    get_global P0, "_foo"
    invokecc P0
    print "back\n"
    end
CODE
foo
back
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "call 2 subs in evaled code " );
    set S5, ".pcc_sub _foo:\n"
    concat S5, "print \"foo\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    concat S5, ".pcc_sub _bar:\n"
    concat S5, "print \"bar\\n\"\n"
    concat S5, "set_returns \"()\"\n"
    concat S5, "returncc\n"
    compreg P1, "PASM"
    set_args "0", S5
    get_results "0", P6
    invokecc P1
    get_global P2, "_foo"
    invokecc P2
    print "back\n"
    get_global P2, "_bar"
    invokecc P2
    print "fin\n"
    end
CODE
foo
back
bar
fin
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PIR compiler sub" );

.sub test :main
    .local pmc compiler
    get_global compiler, "xcompile"
    compreg "XPASM", compiler
    .local pmc my_compiler
    my_compiler = compreg "XPASM"
    .local pmc the_sub
    .local string code
    code = "print \"ok\\n\"\n"
    code .= "set_returns \"()\"\n"
    code .= "returncc\n"
    the_sub = my_compiler("_foo", code)
    the_sub()
    the_sub = get_global "_foo"
    the_sub()
.end

.sub xcompile
    .param string sub_name
    .param string code
    $S0 = ".pcc_sub "
    $S0 .= sub_name
    $S0 .= ":\n"
    $S0 .= code
    .local pmc pasm_compiler
    pasm_compiler = compreg "PASM"
    # print $S0
    $P0 = pasm_compiler($S0)
    .return($P0)
.end
CODE
ok
ok
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "bug #31467" );

  .sub main :main
     $P1 = new ['Hash']
     $P0 = find_name "_builtin"
     $P1['builtin'] = $P0

     $P2 = compreg "PIR"
     $S0 = ".sub main\nprint \"dynamic\\n\"\n.end\n"
     $P0 = $P2($S0)
     $P1['dynamic'] = $P0

     set_global "funcs", $P1

     $S0 = ".sub main\n$P1 = get_global\"funcs\"\n"
     $S0 .= "$P0 = $P1['dynamic']\n$P0()\n"
     $S0 .= "$P0 = $P1['builtin']\n$P0()\n"
     $S0 .= ".end\n"

     $P2 = compreg "PIR"
     $P0 = $P2($S0)
     $P0()
     end
  .end

  .sub _builtin
      print "builtin\n"
  .end
CODE
dynamic
builtin
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PIR compiler sub PASM" );
.sub main :main
  register_compiler()

  .local pmc compiler, invokable
  compiler = compreg "PUTS"

  invokable = compiler("ok 1")
  invokable()

.end

.sub register_compiler
  $P0 = get_global "puts"
  compreg "PUTS", $P0
.end

.sub puts
  .param string printme

  .local pmc pasm_compiler, retval
  pasm_compiler = compreg "PASM"

  .local string code

  code = "print \""
  code .= printme
  code .= "\\n\"\n"
  code .= "set_returns \"()\"\n"
  code .= "returncc\n"

  retval = pasm_compiler( code )

  .return (retval)
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "PIR compiler sub PIR" );
.sub main :main
  register_compiler()

  .local pmc compiler, invokable
  compiler = compreg "PUTS"

  invokable = compiler( "ok 1" )
  invokable()

.end

.sub register_compiler
 .local pmc counter
 counter = new ['Integer']
 counter = 0
 set_global "counter", counter

  $P0 = get_global "_puts"
  compreg "PUTS", $P0
.end

.sub _puts
  .param string printme

  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"

  .local pmc counter
  counter = get_global "counter"
  inc counter

  .local string code
  code = ".sub anonymous"
  $S0 = counter
  code .= $S0
  code .= " :anon\n"
  code .= "print \""
  code .= printme
  code .= "\\n\"\n"
  code .=".end\n"

  retval = pir_compiler( code )

  .return (retval)
.end
CODE
ok 1
OUTPUT

my (undef, $temp_pbc)  = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
my (undef, $temp2_pbc) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );

pir_output_is( <<"CODE", <<'OUTPUT', "eval.get_string" );
.sub main :main

  .local pmc f1, f2
  .local pmc io
  f1 = compi("foo_1", "hello from foo_1")
  \$S0 = f1
  io = new ['FileHandle']
  io.'open'("$temp_pbc", 'w')
  print io, \$S0
  io.'close'()
  load_bytecode "$temp_pbc"
  f2 = compi("foo_2", "hello from foo_2")
  io.'open'("$temp2_pbc", 'w')
  print io, f2
  io.'close'()
  load_bytecode "$temp2_pbc"
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= " :load\\n"
  code .= "print \\""
  code .= printme
  code .= "\\\\n\\"\\n"
  code .= ".end\\n"

  retval = pir_compiler(code)
  .return (retval)
.end
CODE
hello from foo_1
hello from foo_2
OUTPUT

(my $temp_name  = $temp_pbc)  =~ s/\.pbc$//;
(my $temp2_name = $temp2_pbc) =~ s/\.pbc$//;

pir_output_is( <<"CODE", <<'OUTPUT', "check loaded lib hash" );
.sub main
  load_bytecode "$temp_pbc"
  load_bytecode "$temp2_pbc"
  .local pmc pbc_hash, interp
  .include 'iglobals.pasm'
  interp = getinterp
  pbc_hash = interp[.IGLOBALS_PBC_LIBS]
  \$I0 = elements pbc_hash
  print \$I0
  print ' '
  \$I1 = exists pbc_hash['$temp_name']
  print \$I1
  print ' '
  \$I2 = exists pbc_hash['$temp2_name']
  print \$I2
  print ' '
  \$S0 = pbc_hash['$temp2_name']
  # print \$S0          not portable
  \$I3 = index \$S0, '$temp2_name'
  \$I4 = isgt \$I3, -1
  say \$I4
.end
CODE
hello from foo_1
hello from foo_2
2 1 1 1
OUTPUT

(my $fh, $temp_pbc)  = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
close $fh;

pir_output_is( <<"CODE", <<'OUTPUT', "eval.get_string - same file" );
.sub main :main
  .local pmc f1, f2
  .local pmc io, os
  f1 = compi("foo_1", "hello from foo_1")
  \$S0 = f1
  io = new ['FileHandle']
  io.'open'("$temp_pbc", 'w')
  print io, \$S0
  io.'close'()
  load_bytecode "$temp_pbc"
  \$P0 = loadlib 'os'
  os = new ['OS']
  os.'rm'("$temp_pbc")
  f2 = compi("foo_2", "hello from foo_2")
  io.'open'("$temp_pbc", 'w')
  print io, f2
  io.'close'()
  load_bytecode "$temp_pbc"
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= " :load\\n"
  code .= "print \\""
  code .= printme
  code .= "\\\\n\\"\\n"
  code .= ".end\\n"

  retval = pir_compiler(code)
  .return (retval)
.end
CODE
hello from foo_1
OUTPUT

my (undef, $temp_file) = create_tempfile( UNLINK => 1 );

pir_output_is( <<"CODE", <<'OUTPUT', "eval.freeze" );
.sub main :main
  .local pmc f, e
  .local pmc io
  f = compi("foo_1", "hello from foo_1")
  \$S0 = freeze f
  io = new ['FileHandle']
  io.'open'("$temp_file", 'w')
  print io, \$S0
  io.'close'()
  say "written"
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= "\\n"
  code .= "print \\""
  code .= printme
  code .= "\\\\n\\"\\n"
  code .= ".end\\n"

  retval = pir_compiler(code)
  .return (retval)
.end
CODE
written
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "eval.thaw", todo => 'TT #1142' );
.sub main :main
    .local pmc io, e
    .local string file
    .local int size
    file = "$temp_file"
    io = new ['FileHandle']
    io.'open'(file, 'rb')
    \$S0 = io.'readall'()
    io.'close'()
    e = thaw \$S0
    sweep 1 # ensure all of the object survives GC
    e()
    e = get_global "foo_1"
    e()
.end
CODE
hello from foo_1
hello from foo_1
OUTPUT

pir_output_is( <<"CODE", <<'OUTPUT', "eval.freeze+thaw" );
.sub main :main
  .local pmc f, e
  .local pmc io
  f = compi("foo_1", "hello from foo_1")
  \$S0 = freeze f
  io = new ['FileHandle']
  io.'open'("$temp_file", 'wb')
  print io, \$S0
  io.'close'()
  say "written"
  "read"()
.end

.sub compi
  .param string name
  .param string printme
  .local string code
  .local pmc pir_compiler, retval
  pir_compiler = compreg "PIR"
  code = ".sub "
  code .= name
  code .= "\\n"
  code .= <<"MORE"
  noop
  noop
  noop
  noop
MORE
  code .= "print \\""
  code .= printme
  code .= "\\\\n\\"\\n"
  code .= ".end\\n"

  retval = pir_compiler(code)
  .return (retval)
.end

.sub "read"
    .local pmc io, e
    .local string file
    .local int size
    file = "$temp_file"
    io = new ['FileHandle']
    io.'open'(file, 'rb')
    \$S0 = io.'readall'()
    io.'close'()
    e = thaw \$S0
    e()
    e = get_global "foo_1"
    e()
.end
CODE
written
hello from foo_1
hello from foo_1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "get_pmc_keyed_int" );
.sub main :main
    .local string code
    .local pmc e, s, compi
    code = <<"EOC"
    .sub foo
        noop
    .end
    .sub bar
        noop
    .end
EOC
    compi = compreg "PIR"
    e  = compi(code)
    s = e[0]
    print s
    print "\n"
    s = e[1]
    print s
    print "\n"
.end
CODE
foo
bar
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "catch compile err" );
.sub main :main
     push_eh handler
     $P2 = compreg "PIR"
     $S0 = <<"EPIR"
  .sub foo
     print a typo
  .end
EPIR
     $P0 = $P2($S0)
     $P0()
     end
handler:
     print "ok\n"
.end
CODE
ok
OUTPUT

my ($TEMP, $filename) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );

print $TEMP <<PIR;
  .sub foo
     print a typo
  .end
PIR
close $TEMP;

pir_error_output_like( <<"CODE", <<'OUTPUT', "compile err in load_bytecode" );
.sub main :main
     load_bytecode "$filename"
     print "never\\n"
     end
.end
CODE
/undefined identifier/
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "catch compile err in load_bytecode" );
.sub main :main
     push_eh handler
     load_bytecode "$filename"
     print "never\n"
     end
handler:
     print "ok\n"
.end
CODE
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
