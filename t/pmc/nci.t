#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/nci.t - Native Call Interface

=head1 SYNOPSIS

	% perl t/pmc/nci.t

=head1 DESCRIPTION

Tests the NCI PMC. These are all skipped unless JIT CPU architecture is
i386 and the F<libnci.so> library is found.

=cut

use Parrot::Test tests => 31;
use Parrot::Config;

print STDERR $PConfig{jitcpuarch}, " JIT CPU\n";
print STDERR $PConfig{so}, " SO extension\n";

SKIP: {
if (-e "libnci" . $PConfig{so}) {
    if ($PConfig{jitcpuarch} eq 'i386') {
	$ENV{LD_LIBRARY_PATH} = '.';
    }
}
else {
    skip('Please make libnci'.$PConfig{so},
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
  set I6, 3
  invoke
  abs I5        # 3 * 64 as char may be signed/unsigned
  ne I5, 64, nok_1
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
  new P5, .PerlInt
  set P5, 6
  set I5, 7
  invoke
  print I5
  print "\n"
  end
CODE
42
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_i_i3");
.include "datatypes.pasm"
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_ii3", "ii3"
  set I5, 6

  new P5, .PerlInt
  set P5, 7

  set I0, 1
  set I1, 1
  set I3, 1
  invoke

  print I5
  print "\n"
  print P5
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

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - char*");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char*; int }
  set I5, 3
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_CSTR
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P5, P2
  set S0, P5[0]
  print S0
  print "\n"
  set I0, P5[1]
  print I0
  print "\n"
  end
CODE
hello
20
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - nested struct *");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; x->{int, double} }
  set I5, 4
  invoke
.include "datatypes.pasm"
  # the contained structure
  new P3, .PerlArray
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_DOUBLE
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .PerlArray
  push P2, .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_STRUCT_PTR
  # attach the unmanged struct as property
  set P1, P2[-1]
  setprop P1, "_struct", P4
  push P2, 0
  push P2, 0
  # attach struct initializer
  assign P5, P2
  set I0, P5[0]
  print I0
  print "\n"
  # get item x->int
  set I0, P5[1;0]
  print I0
  print "\n"
  set I0, P5[1;1]
  print I0
  print "\n"
  # get item x->double
  set N0, P5[1;2]
  print N0
  print "\n"
  end
CODE
10
100
77
200.000000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - func_ptr*");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int (*f)(char *) }
  set I5, 5
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_FUNC_PTR
  push P2, 0
  push P2, 0
  assign P5, P2
  # P1 isnt a real PMC, its only suited for passing on to
  # the NCI PMC as a Key
  set P1, P5[0]
  # if no signatur was given, do it manually
  # s. below for another method
  new P0, .NCI
  set P0[P1], "it"
  set S5, "hello call_back"
  invoke
  print I5
  print "\n"
  end
CODE
hello call_back
4711
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - func_ptr* with signature");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int (*f)(char *) }
  set I5, 5
  invoke
  new P2, .PerlArray
.include "datatypes.pasm"
  push P2, .DATATYPE_FUNC_PTR
  # attach function signature property to this type
  set P1, P2[-1]
  new P3, .PerlString
  set P3, "it"
  setprop P1, "_signature", P3
  push P2, 0
  push P2, 0
  assign P5, P2
  # now we get a callable NCI PMC
  set P0, P5[0]
  set S5, "hello call_back"
  invoke
  print I5
  print "\n"
  end
CODE
hello call_back
4711
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - nested struct aligned");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int; {int; int} int }
  set I5, 6
  invoke
.include "datatypes.pasm"
  # the nested structure
  new P3, .PerlArray
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .PerlArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_STRUCT
  # attach the unmanged struct as property
  set P1, P2[-1]
  setprop P1, "_struct", P4
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  # attach struct initializer
  assign P5, P2
  set I0, P5[0]
  print I0
  print "\n"
  # get item _y.i
  set I0, P5[1;0]
  print I0
  print "\n"
  # _y.j
  set I0, P5[1;1]
  print I0
  print "\n"
  set I0, P5[2]
  print I0
  print "\n"
  end
CODE
32
127
12345
33
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - nested struct unaligned");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set I5, 7
  invoke
.include "datatypes.pasm"
  # the nested structure
  new P3, .PerlArray
  push P3, .DATATYPE_CHAR
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .PerlArray
  push P2, .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_STRUCT
  # attach the unmanged struct as property
  set P1, P2[-1]
  setprop P1, "_struct", P4
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  # attach struct initializer
  assign P5, P2
  set I0, P5[0]
  print I0
  print "\n"
  # get item _y.i
  set I0, P5[1;0]
  print I0
  print "\n"
  # _y.j
  set I0, P5[1;1]
  print I0
  print "\n"
  set I0, P5[2]
  print I0
  print "\n"
  end
CODE
32
127
12345
33
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_p_i - nested, unaligned, named");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set I5, 7
  invoke
.include "datatypes.pasm"
  # the nested structure
  new P3, .OrderedHash
  set P3["i"], .DATATYPE_CHAR
  push P3, 0
  push P3, 0
  set P3["j"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .OrderedHash
  set P2["x"], .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  set P2["_y"], .DATATYPE_STRUCT
  # attach the unmanged struct as property
  set P1, P2[-1]
  setprop P1, "_struct", P4
  push P2, 0
  push P2, 0
  set P2["z"], .DATATYPE_CHAR
  push P2, 0
  push P2, 0
  # attach struct initializer
  assign P5, P2
  set I0, P5["x"]
  print I0
  print "\n"
  # get item _y.i
  set I0, P5["_y";"i"]
  print I0
  print "\n"
  # _y.j
  set I0, P5["_y"; "j"]
  print I0
  print "\n"
  set I0, P5["z"]
  print I0
  print "\n"
  end
CODE
32
127
12345
33
OUTPUT
output_is(<<'CODE', <<'OUTPUT', "nci_i_p");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_ip", "ip"
  # this test function wants a struct
  # { double d; float f; int i; char*}
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
  push P2, .DATATYPE_CSTR
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
  sizeof I7, .DATATYPE_CSTR
  add I6, I7
  set P5, I6
  set P5[0], 10.0
  set P5[1], 4.0
  set P5[2], 17
  set P5[3], "hello from Parrot\x0"
  set I5, 1
  invoke
  print I5
  print "\n"
  end
CODE
hello from Parrot
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

output_is(<<'CODE', <<'OUTPUT', "nci_cb_C1");

  # we need a flag if the call_back is already done
  new P10, .PerlInt
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  newsub P6, .Sub, _call_back
  # prepare user data
  new P7, .PerlInt
  set P7, 42
  new_callback P5, P6, P7, "tU"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_cb_C1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P6 is user_data
  set P6, P7
  invoke
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  find_global P11, "cb_done"
  if P11, fin
  gt I20, 10, err
  branch loop
fin:
  print "done.\n"
  end
err:
  print "cb didnt run\n"
  end

_call_back:
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  invoke P1

CODE
ok 1
ok 2
in callback
user data: 42
external data: succeeded
done.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_cb_D1");

  # we need a flag if the call_back is already done
  new P10, .PerlInt
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  newsub P6, .Sub, _call_back
  # prepare user data
  new P7, .PerlInt
  set P7, 42
  new_callback P5, P6, P7, "Ut"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_cb_D1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P6 is user_data
  set P6, P7
  invoke
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  find_global P11, "cb_done"
  if P11, fin
  gt I20, 10, err
  branch loop
fin:
  print "done.\n"
  end
err:
  print "cb didnt run\n"
  end

_call_back:
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  invoke P1

CODE
ok 1
ok 2
in callback
user data: 42
external data: succeeded
done.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_cb_C2");
  # we need a flag if the call_back is already done
  new P10, .PerlInt
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  newsub P6, .Sub, _call_back
  # prepare user data
  new P7, .PerlInt
  set P7, 42
  new_callback P5, P6, P7, "iU"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_cb_C2", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P6 is user_data
  set P6, P7
  invoke
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  find_global P11, "cb_done"
  if P11, fin
  gt I20, 10, err
  branch loop
fin:
  print "done.\n"
  end
err:
  print "cb didnt run\n"
  end

_call_back:
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print I5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  invoke P1


CODE
ok 1
ok 2
in callback
user data: 42
external data: 77
done.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'array of structs');

.include "datatypes.pasm"
  new P3, .OrderedHash
  set  P3["x"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  set  P3["y"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  set  P3["w"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  set  P3["h"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P6, .UnManagedStruct, P3

  new P4, .OrderedHash
  set  P4["Rect"], .DATATYPE_STRUCT
  set P1, P4[-1]
  setprop P1, "_struct", P6
  push P4, 4
  push P4, 0

  new P5, .ManagedStruct, P4
  set P5[0;0;'x'], 100
  set P5[0;0;'y'], 110
  set P5['Rect';0;'w'], 120
  set P5[0;0;'h'], 130

  set P5[0;1;'x'], 200
  set P5[0;1;'y'], 210
  set P5[0;1;'w'], 220
  set P5[0;1;'h'], 230

  set P5[0;2;'x'], 300
  set P5[0;2;'y'], 310
  set P5[0;2;'w'], 320
  set P5[0;2;'h'], 330

  set P5[0;3;'x'], 400
  set P5[0;3;'y'], 410
  set P5[0;3;'w'], 420
  set P5[0;3;'h'], 430


  set I5, 4
  set I0, 1
  set I1, 1
  set I3, 4

  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pip", "pip"
  invoke
  end

CODE
Count: 4
X: 100
Y: 110
W: 120
H: 130
X: 200
Y: 210
W: 220
H: 230
X: 300
Y: 310
W: 320
H: 330
X: 400
Y: 410
W: 420
H: 430
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'out parameters and return values');

.include "datatypes.pasm"
  new P2, .PerlInt
  set P2, 3
  new P3, .PerlInt
  set P3, 2

  set P5, P2
  set P6, P3

  set I0, 1
  set I2, 0
  set I3, 2
  set I4, 0
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_i_33", "i33"
  invoke

  print "Double: "
  print P2
  print "\nTriple: "
  print P3
  print "\nSum: "
  print I5
  print "\n"

  end
CODE
Double: 6
Triple: 6
Sum: 12
OUTPUT

} # SKIP

1;
