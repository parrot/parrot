#! perl -w

# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/nci.t - Native Call Interface

=head1 SYNOPSIS

	% perl -Ilib t/pmc/nci.t

=head1 DESCRIPTION

This tests the Native Call Interface, that is the ParrotLibrary PMC.
Most tests are skipped when the F<libnci.so> library is not found.

=head1 SEE ALSO

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<src/nci_test.c>

=cut

use Parrot::Test tests => 47;
use Parrot::Config;

SKIP: {
unless ( -e "runtime/parrot/dynext/libnci" . $PConfig{load_ext} ) {
    skip( "Please make libnci$PConfig{load_ext}",
          Test::Builder->expected_tests() );
}

output_is(<<'CODE', <<'OUTPUT', "nci_dd - PASM");
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


output_is( << 'CODE', << 'OUTPUT', "nci_dd - PIR" );
##PIR##
.sub _test @MAIN
    .local string library_name
    library_name = 'libnci'
    .local pmc libnci
    libnci = loadlib  library_name
    unless libnci goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"
    .local pmc twice
    twice = dlfunc libnci, "nci_dd", "dd"
    .local float r
    r = twice( -4.128 )
    print r
NOT_LOADED:
    print "\n"
.end
CODE
libnci was successfully loaded
-8.256000
OUTPUT


output_is( << 'CODE', << "OUTPUT", "get_string()" );
##PIR##
.sub _test @MAIN
    .local string library_name
    library_name = 'libnci'
    .local pmc libnci
    libnci = loadlib  library_name
    unless libnci goto NOT_LOADED
        .local string filename_with_path
        filename_with_path = libnci
        # depending on the platform, 'filename' has path info or not
        .local int start_of_filename
        start_of_filename = index filename_with_path, 'libnci'
        if start_of_filename == -1 goto NOT_LOADED
            .local string filename
            filename = substr filename_with_path, start_of_filename
            print filename
            print " was successfully loaded"
    NOT_LOADED:
    print "\n"
.end
CODE
libnci$PConfig{load_ext} was successfully loaded
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_fff");
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


output_is(<<'CODE', <<'OUTPUT', "nci_isc");
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


output_is(<<'CODE', <<'OUTPUT', "nci_ssc");
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


output_is(<<'CODE', <<'OUTPUT', "nci_csc");
  loadlib P1, "libnci"
  print "loaded\n"
  dlfunc P0, P1, "nci_csc", "csc"
  print "dlfunced\n"
  set I0, 1	# prototype used - unchecked
  set I5, 6
  set I6, 7
  invoke
  ne I5, 42, nok_1
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
  print I0
  print "\n"
  print I1
  print "\n"
  print I2
  print "\n"
  print I3
  print "\n"
  print I4
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_it");
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


output_is(<<'CODE', <<'OUTPUT', "nci_tt");
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


output_is(<<'CODE', <<'OUTPUT', "nci_dd - stress test");
  loadlib P1, "libnci"
  print "loaded\n"
  set I10, 10000
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


output_is(<<'CODE', <<'OUTPUT', "nci_dd - clone");
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


output_is(<<'CODE', <<'OUTPUT', "nci_iiii");
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


output_is(<<'CODE', <<'OUTPUT', "nci_i4i");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_i4i", "i4i"
  new P5, .PerlInt
  set P5, -6
  set I5, -7
  invoke
  print I5
  print "\n"
  end
CODE
42
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_ii3");
.include "datatypes.pasm"
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_ii3", "ii3"
  set I5, -6

  new P5, .PerlInt
  set P5, -7

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


output_is(<<'CODE', <<'OUTPUT', "nci_tb");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_tb", "tb"
  set S5, "ko\n"
  invoke
  print S5
  end
CODE
ok worked
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_tB");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_tB", "tB"
  set S5, "ko\n"
  invoke
  print S5
  end
CODE
ok done
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_pi - struct with ints");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - struct with floats");
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


output_like(<<'CODE', <<'OUTPUT', "nci_pi - align");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - char*");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct *");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct * w named access");
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_pi", "pi"
  set I5, 8  # test fun number
  invoke
.include "datatypes.pasm"
  # the contained structure pointer
  new  P6, .OrderedHash
  set  P6[ 'i' ], .DATATYPE_INT
  push P6, 0
  push P6, 0
  set  P6[ 'j' ], .DATATYPE_INT
  push P6, 0
  push P6, 0
  new P7, .UnManagedStruct, P6
  # the contained structure
  new  P3, .OrderedHash
  set  P3[ 'i'  ], .DATATYPE_INT
  push P3, 0
  push P3, 0
  set  P3[ 'j'  ], .DATATYPE_INT
  push P3, 0
  push P3, 0
  set  P3[ '_z' ], .DATATYPE_STRUCT_PTR
  set  P1, P3[-1]
  setprop P1, "_struct", P7
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .OrderedHash
  set  P2[ 'x'  ], .DATATYPE_INT
  push P2, 0
  push P2, 0
  set  P2[ '_y' ], .DATATYPE_STRUCT
  # attach the unmanged struct as property
  set P1, P2[-1]
  setprop P1, "_struct", P4
  push P2, 0
  push P2, 0
  set  P2[ 'z'  ], .DATATYPE_INT
  push P2, 0
  push P2, 0
  # attach struct initializer
  assign P5, P2
  set I0, P5[ 'x' ]
  print I0
  print "\n"
  set I0, P5[ '_y'; 'i' ]
  print I0
  print "\n"
  set I0, P5[ '_y'; 'j' ]
  print I0
  print "\n"
  set I0, P5[ '_y'; '_z'; 'i' ]
  print I0
  print "\n"
  set I0, P5[ '_y'; '_z'; 'j' ]
  print I0
  print "\n"
  end
CODE
32
127
12345
100
77
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_pi - func_ptr* with signature");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct aligned");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct unaligned");
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


output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested, unaligned, named");
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


output_is( << 'CODE', << "OUTPUT", "nci_pi - int");
##PIR##
.include "datatypes.pasm"

.sub _test @MAIN

  # load library
  .local pmc libnci
  libnci = loadlib "libnci"
  unless libnci goto NOT_LOADED
  print "libnci was successfully loaded\n"

  # calling a function in libnci
  .local pmc nci_pi
  dlfunc nci_pi, libnci, "nci_pi", "pi"
  .local pmc nci_pi_out
  ( nci_pi_out ) = nci_pi( 9 )

  # the contained structure pointer
  .local pmc nci_pi_out_decl
  nci_pi_out_decl = new PerlArray
  push nci_pi_out_decl, .DATATYPE_INT
  push nci_pi_out_decl, 0
  push nci_pi_out_decl, 0

  # attach struct initializer
  assign nci_pi_out, nci_pi_out_decl
  set I0, nci_pi_out[0]
  print I0
NOT_LOADED:
  print "\n"
  end
.end
CODE
libnci was successfully loaded
55555
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_ip");
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


output_is(<<'CODE', <<'OUTPUT', "nci_vP");
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


# Tests with callback functions

output_is(<<'CODE', <<'OUTPUT', "nci_cb_C1 - PASM");

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


output_is(<<'CODE', <<'OUTPUT', "nci_cb_C1 - PIR");
##PIR##
.sub _test @MAIN

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new Integer
    cb_done = 0
    store_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .local pmc cb
    cb = newsub _call_back
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "tU"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci
    libnci = loadlib "libnci"
    .local pmc nci_cb_C1
    nci_cb_C1 = dlfunc libnci, "nci_cb_C1", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_C1( cb_wrapped, user_data )

    # callback will be called at any time
    # so spin a bit
    .local int sleep_cnt
    sleep_cnt = 0
LOOP:
    sleep_cnt += 1
    sleep 0.01
    .local pmc callback_has_run
    callback_has_run = find_global "cb_done"
    if callback_has_run goto FINISHED
    if sleep_cnt > 10 goto ERROR
    goto LOOP
FINISHED:
    print "the callback has run\n"
    end
ERROR:
    print "the callback didnt run\n"
    end
.end

.sub _call_back
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
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: succeeded
the callback has run
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_cb_C2 - PASM");
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


output_is(<<'CODE', <<'OUTPUT', "nci_cb_C3 - PIR");
##PIR##

.include "datatypes.pasm"

.sub _test @MAIN

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new Integer
    cb_done = 0
    store_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .local pmc cb
    cb = newsub _call_back
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "pU"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci
    libnci = loadlib "libnci"
    .local pmc nci_cb_C3
    nci_cb_C3 = dlfunc libnci, "nci_cb_C3", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_C3( cb_wrapped, user_data )

    # callback will be called at any time
    # so spin a bit
    .local int sleep_cnt
    sleep_cnt = 0
LOOP:
    sleep_cnt += 1
    sleep 0.01
    .local pmc callback_has_run
    callback_has_run = find_global "cb_done"
    if callback_has_run goto FINISHED
    if sleep_cnt > 10 goto ERROR
    goto LOOP
FINISHED:
    print "the callback has run\n"
    end
ERROR:
    print "the callback didnt run\n"
    end
.end

.sub _call_back
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"

  # P6 is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .PerlArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P6, P2

  # print referenced integer in libnci.so
  I17 = P6[0]
  print "external data: "
  print I17
  print "\n"

  find_global P12, "cb_done"
  inc P12
  invoke P1
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 99
the callback has run
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_cb_D1 - PASM");

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


output_is(<<'CODE', <<'OUTPUT', "nci_cb_D2 - PASM");
  # we need a flag if the call_back is already done
  new P10, .PerlInt
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  newsub P6, .Sub, _call_back
  # prepare user data
  new P7, .PerlInt
  set P7, 42
  new_callback P5, P6, P7, "Ui"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_cb_D2", "vpP"
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
external data: 88
done.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "nci_cb_D2 - PIR");
##PIR##
.sub _test @MAIN

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new Integer
    cb_done = 0
    store_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .local pmc cb
    cb = newsub _call_back
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Ui"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci
    libnci = loadlib "libnci"
    .local pmc nci_cb_D2
    nci_cb_D2 = dlfunc libnci, "nci_cb_D2", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_D2( cb_wrapped, user_data )

    # callback will be called at any time
    # so spin a bit
    .local int sleep_cnt
    sleep_cnt = 0
LOOP:
    sleep_cnt += 1
    sleep 0.01
    .local pmc callback_has_run
    callback_has_run = find_global "cb_done"
    if callback_has_run goto FINISHED
    if sleep_cnt > 10 goto ERROR
    goto LOOP
FINISHED:
    print "the callback has run\n"
    end
ERROR:
    print "the callback didnt run\n"
    end
.end

.sub _call_back
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
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 88
the callback has run
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_cb_D3 - PIR");
##PIR##

.include "datatypes.pasm"

.sub _test @MAIN

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new Integer
    cb_done = 0
    store_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .local pmc cb
    cb = newsub _call_back
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Up"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci
    libnci = loadlib "libnci"
    .local pmc nci_cb_D3
    nci_cb_D3 = dlfunc libnci, "nci_cb_D3", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_D3( cb_wrapped, user_data )

    # callback will be called at any time
    # so spin a bit
    .local int sleep_cnt
    sleep_cnt = 0
LOOP:
    sleep_cnt += 1
    sleep 0.01
    .local pmc callback_has_run
    callback_has_run = find_global "cb_done"
    if callback_has_run goto FINISHED
    if sleep_cnt > 10 goto ERROR
    goto LOOP
FINISHED:
    print "the callback has run\n"
    end
ERROR:
    print "the callback didnt run\n"
    end
.end

.sub _call_back
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"

  # P6 is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .PerlArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P6, P2

  # print referenced integer in libnci.so
  I17 = P6[0]
  print "external data: "
  print I17
  print "\n"

  find_global P12, "cb_done"
  inc P12
  invoke P1
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 111
the callback has run
OUTPUT


output_is(<<'CODE', <<'OUTPUT', "nci_cb_D4 - synchronous callbacks");
##PIR##

.include "datatypes.pasm"

.sub _test @MAIN

    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .local pmc cb
    cb = newsub _call_back
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Up"	# Z in pdd16
    print "created a callback sub\n"
    .local pmc synchronous
    synchronous = new Integer
    synchronous = 1
    setprop user_data, "_synchronous", synchronous
    print "marked callback as synchronous\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci
    libnci = loadlib "libnci"
    .local pmc nci_cb_D4
    nci_cb_D4 = dlfunc libnci, "nci_cb_D4", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_D4( cb_wrapped, user_data )

    end
.end

.sub _call_back
  # P6 is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .PerlArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P6, P2

  print "external data: "
  I17 = P6[0]
  print I17
  print "\n"
  I17 = I17 * 10
  P6[0] = I17

  invoke P1
.end

CODE
created a callback sub
marked callback as synchronous
loaded a function that takes a callback
external data: 1
external data: 11
external data: 111
external data: 1111
external data: 11111
external data: 111111
external data: 1111111
external data: 11111111
external data: 111111111
external data: 1111111111
OUTPUT

output_is(<<'CODE', <<'OUTPUT', 'nci_pip - array of structs');

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


output_is(<<'CODE', <<'OUTPUT', 'nci_i33 - out parameters and return values');

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
  dlfunc P0, P1, "nci_i33", "i33"
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


output_is(<<'CODE', <<'OUTPUT', 'nci_vpii - nested structs');

.include "datatypes.pasm"
  new  P8, .OrderedHash
  set  P8[ 'y' ],      .DATATYPE_INT
  push P8, 0
  push P8, 0
  new  P9, .ManagedStruct, P8

  new  P6, .OrderedHash
  set  P6[ 'x' ],      .DATATYPE_INT
  push P6, 0
  push P6, 0
  set  P6[ 'nested' ], .DATATYPE_STRUCT_PTR

  set  P7, P6[ -1 ]
  setprop P7, '_struct', P9

  push P6, 0
  push P6, 0

  new  P5, .ManagedStruct, P6
  set  P9[ 'y' ], 200
  set  P5[ 'x' ], 100

  set I0, P5[ 'x' ]
  set I1, P5[ 'nested'; 'y' ]
  print "Old X: "
  print I0
  print "\nOld Y: "
  print I1
  print "\n"

  set I5, 1
  set I6, 2

  set I0, 1
  set I1, 2
  set I2, 0
  set I3, 1
  set I4, 0

  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_vpii", "vpii"
  invoke

  set I0, P5[ 'x' ]
  set P6, P5[ 'nested' ]
  set I1, P6[ 'y' ]
  print "X: "
  print I0
  print "\nY: "
  print I1
  print "\n"
  # extract struct
  set P6, P5[ 'nested' ]
  set I1, P6[ 'y' ]
  print I1
  print "\n"
  end
CODE
Old X: 100
Old Y: 200
X: 1
Y: 2
2
OUTPUT


output_is(<<'CODE', <<'OUTPUT', 'nci_piiii - nested array in a struct');
.include "datatypes.pasm"
  set I0, 1
  set I1, 4
  set I2, 0
  set I3, 0
  set I4, 0
  set I5, 100
  set I6, 200
  set I7, 400
  set I8, 800

  loadlib P1, "libnci"
  dlfunc P0, P1, "nci_piiii", "piiii"
  invoke

  new  P6, .OrderedHash
  set  P6[ 'count' ], .DATATYPE_INT
  push P6, 0
  push P6, 0

  new  P7, .OrderedHash
  set  P7[ 'array' ], .DATATYPE_INT
  push P7, 0
  push P7, 0
  new P8, .UnManagedStruct, P7
  # yes, the array within the struct has _4_ elements
  # but with an UnManagedStruct, you can't always know the amount beforehand
  set  P6[ 'array' ], .DATATYPE_STRUCT_PTR
  set P9, P6[-1]
  setprop P9, "_struct", P8
  push P6, 0
  push P6, 0

  assign P5, P6
  set    I0, P5[ 'count' ]

  print "Count: "
  print I0
  print "\n"

  # now that we do know, update the UnManagedStruct appropriately
  set    P7[ 1 ], I0
  assign P5, P6

  set I0, P5[1; 'array'; 0 ]
  set I1, P5[ 1;'array'; 1 ]
  set I2, P5[ 1;'array'; 2 ]
  set I3, P5[ 1;'array'; 3 ]
  print "0: "
  print I0
  print "\n1: "
  print I1
  print "\n2: "
  print I2
  print "\n3: "
  print I3
  print "\n"

  end
CODE
Count: 4
0: 100
1: 200
2: 400
3: 800
OUTPUT


output_is( << 'CODE', << "OUTPUT", "nci_pii - writing back to libnci.so" );
##PIR##
.include "datatypes.pasm"

.sub _test @MAIN

  # load library
  .local pmc libnci
  libnci = loadlib "libnci"
  unless libnci goto NOT_LOADED
  print "libnci was successfully loaded\n"

  # calling a function in libnci
  .local pmc multiply
  multiply = dlfunc libnci, "nci_pii", "pii"
  .local pmc product_pointer
  ( product_pointer ) = multiply( -5, 11111 )

  # the contained structure pointer
  .local pmc product_pointer_decl
  product_pointer_decl = new PerlArray
  push product_pointer_decl, .DATATYPE_INT
  push product_pointer_decl, 0
  push product_pointer_decl, 0
  assign product_pointer, product_pointer_decl

  # check result of multiplication
  .local int product
  product = product_pointer[0]
  print product
  print "\n"

  # Write back into libnci and check it
  product_pointer[0] = 333
  product = 4444
  print product
  print "\n"
  .local pmc get_product
  dlfunc get_product, libnci, "nci_i", "i"
  ( product ) = get_product()
  print product
  print "\n"

NOT_LOADED:
  end
.end
CODE
libnci was successfully loaded
-55555
4444
333
OUTPUT


output_is( << 'CODE', << 'OUTPUT', "nci_dlvar_int - thrice" );
##PIR##
.include "datatypes.pasm"

.sub _test @MAIN

    # load libnci.so
    .local string library_name
    library_name = 'libnci'
    .local pmc libnci
    libnci = loadlib library_name
    unless libnci goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc nci_dlvar_int
    nci_dlvar_int = dlvar libnci, "nci_dlvar_int"

    # the contained structure pointer
    .local pmc nci_dlvar_int_decl
    nci_dlvar_int_decl = new PerlArray
    push nci_dlvar_int_decl, .DATATYPE_INT
    push nci_dlvar_int_decl, 0
    push nci_dlvar_int_decl, 0
    assign nci_dlvar_int, nci_dlvar_int_decl

    I2 = nci_dlvar_int[0]
    print I2
    print "\n"

    .local pmc thrice
    thrice = dlfunc libnci, "nci_dlvar_vv", "vv"
    thrice()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    thrice()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    thrice()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    thrice()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
NOT_LOADED:
.end
CODE
libnci was successfully loaded
-4444
-13332
-39996
-119988
-359964
OUTPUT


output_is( << 'CODE', << 'OUTPUT', "dlvar - unknown symbol" );
##PIR##
.include "datatypes.pasm"

.sub _test @MAIN

    # load libnci.so
    .local string library_name
    library_name = 'libnci'
    .local pmc libnci
    libnci = loadlib library_name
    unless libnci goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc non_existing
    non_existing = dlvar libnci, "non_existing"
    .local int is_defined
    is_defined = defined non_existing
    if is_defined goto IS_DEFINED
    print "'non_existing' is not defined\n"
IS_DEFINED:
NOT_LOADED:
.end
CODE
libnci was successfully loaded
'non_existing' is not defined
OUTPUT


output_is( << 'CODE', << 'OUTPUT', "dlfunc - unknown symbol" );
##PIR##
.include "datatypes.pasm"

.sub _test @MAIN

    # load libnci.so
    .local string library_name
    library_name = 'libnci'
    .local pmc libnci
    libnci = loadlib library_name
    unless libnci goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc non_existing
    non_existing = dlfunc libnci, "non_existing", "iiii"
    .local int is_defined
    is_defined = defined non_existing
    if is_defined goto IS_DEFINED
    print "'non_existing' is not defined\n"
IS_DEFINED:
NOT_LOADED:
.end
CODE
libnci was successfully loaded
'non_existing' is not defined
OUTPUT

} # SKIP

output_is(<< 'CODE', << 'OUTPUT', "opcode 'does'");
##PIR##
.sub _test @MAIN
    .local pmc pmc1
    pmc1 = new ParrotLibrary
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "library"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
OUTPUT
