use Parrot::Test tests => 19;
use Parrot::Config;

print STDERR $PConfig{jitcpuarch}, " JIT CPU\n";
print STDERR $PConfig{so}, " SO extension\n";

SKIP: {
if ($PConfig{jitcpuarch} eq 'i386' && -e "libnci" . $PConfig{so}) {
    $ENV{LD_LIBRARY_PATH} = '.';
}
else {
    skip('needs jit/i386 and libnci'.$PConfig{so},
         Test::Builder->expected_tests());
}

output_is(<<'CODE', <<'OUTPUT', "nci_d_d");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set N5, 4.0
  invoke
  ne N5, 8.0, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 1, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_f_ff");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_fff", "fff"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set N5, 12.0
  set N6, 3.0
  invoke
  ne N5, 4.0, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 1, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_sc");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_isc", "isc"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set I5, 2
  set I6, 3
  invoke
  ne I5, 6, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 1, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 0, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_s_sc");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_ssc", "ssc"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set I5, 2
  set I6, 3
  invoke
  ne I5, 6, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 1, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 0, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_c_sc");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_csc", "csc"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set I5, 64
  set I6, 2
  invoke
  ne I5, -128, nok_1
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 1, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 0, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_i_t");
  loadlib P1, "libnci"
  printerr "loaded\n"
  dlfunc P0, P1, "nci_it", "it"
  printerr "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set S5, "ko\n"
  invoke
  ne I5, 2, nok_1
  ne I0, 0, nok_2	# test return value convention
  ne I1, 1, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 0, nok_2
  printerr "ok 2\n"
  end
nok_1: printerr "nok 1\n"
  printerr I5
  printerr "\n"
  end
nok_2: printerr "nok 2\n"
  end
CODE
loaded
dlfunced
ok
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_t_t");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_tt", "tt"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set S5, "ko\n"
  invoke
  print S5
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 1, nok_2
  ne I3, 0, nok_2
  ne I4, 0, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok worked
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_d_d - stress test");
  loadlib P1, "libnci"
  print "loaded\n"
  set I10, 100000
  print "dlfunced\n"
loop:
  dlfunc P0, P1, "nci_dd", "dd"
  set I0, 1	# prototype used - unchecked
  set N5, 4.0
  invoke
  ne N5, 8.0, nok_1
  dec I10
  gt I10, 0, loop
  print "ok 1\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 1, nok_2
  print "ok 2\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_d_d - clone");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  clone P2, P0
  print "ok 1\n"
  set I0, 1	# prototype used - unchecked
  set N5, 4.0
  invoke
  ne N5, 8.0, nok_1
  print "ok 2\n"
  set I0, 1
  set I1, 0
  set N5, 4.0
  set P0, P2
  invoke
  ne N5, 8.0, nok_1
  print "ok 3\n"
  ne I0, 0, nok_2	# test return value convention
  ne I1, 0, nok_2
  ne I2, 0, nok_2
  ne I3, 0, nok_2
  ne I4, 1, nok_2
  print "ok 4\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
nok_2: print "nok 2\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_iii");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_iiii", "iiii"
  set I0, 1	# prototype used - unchecked
  set I5, 10
  set I6, 20
  set I7, 30
  invoke
  print I5
  print "\n"
  end
CODE
10 20 30
2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_4i");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_i4i", "i4i"
  set I5, 6
  set I6, 7
  invoke
  print I5
  print "\n"
  end
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_i3");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_ii3", "ii3"
  set I5, 6
  set I6, 7
  invoke
  print I5
  print "\n"
  print I6
  print "\n"
  end
CODE
42
4711
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_t_b");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_tb", "tb"
  set S5, "ko\n"
  invoke
  print S5
  end
CODE
ok worked
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_t_B");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_tB", "tB"
  set S5, "ko\n"
  invoke
  print S5
  end
CODE
ok done
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int[2]; char }
  set I5, 0
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_INT
  push P2, 2	# 2 elem array
  push P2, 0
  push P2, .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  assign P5, P2
  set I0, P5[0;0]
  print I0
  print "\n"
  set I0, P5[0;1]
  print I0
  print "\n"
  set I0, P5[1]
  print I0
  print "\n"
  end
CODE
42
100
66
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { float[2]; double }
  set I5, 1
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_FLOAT
  push P2, 2	# 2 elem array
  push P2, 0
  push P2, .DATATYPE_DOUBLE
  push P2, 0
  push P2, 0
  assign P5, P2
  set N0, P5[0;0]
  print N0
  print "\n"
  set N0, P5[0;1]
  print N0
  print "\n"
  set N0, P5[1]
  print N0
  print "\n"
  end
CODE
42.000000
100.000000
47.110000
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "nci_p_i - align");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; int }
  set I5, 2
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P5, P2
  set I0, P5[0]
  print I0
  print "\n"
  set I0, P5[1]
  print I0
  print "\n"
  # check the offset of the int
  set I0, P2[5]
  print I0
  print "\n"
  end
CODE
/10
20
(4|8)
/
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_p");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_ip", "ip"
  # this test function wants a struct { double d; float f; int i }
  # and returns the sum of these values
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_DOUBLE
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_FLOAT
  push P2, 0	# 1 elem array
  push P2, 0
  push P2, .DATATYPE_INT
  push P2, 0	# 1 elem array
  push P2, 0
  new P5, .ManagedStruct, P2
  set I6, 0
  sizeof I7, .DATATYPE_DOUBLE
  add I6, I7
  sizeof I7, .DATATYPE_FLOAT
  add I6, I7
  sizeof I7, .DATATYPE_INT
  add I6, I7
  set P5, I6
  set P5[0], 10.0
  set P5[1], 4.0
  set P5[2], 17
  set I5, 1
  invoke
  print I5
  print "\n"
  end
CODE
31
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_v_P");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_vP", "vP"
  new P5, .PerlString
  set P5, "ok\n"
  invoke
  null P5
  invoke
  end
CODE
ok
got null
OUTPUT

} # SKIP

1;
