#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/nci.t - test the Native Call Interface

=head1 SYNOPSIS

	% perl -Ilib t/pmc/nci.t

=head1 DESCRIPTION

This tests the Native Call Interface, that is the ParrotLibrary PMC.
Most tests are skipped when the F<libnci_test.so> shared library is not found.

=head1 SEE ALSO

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<src/nci_test.c>

=cut

use Parrot::Test    tests => 60;
use Parrot::Config qw(%PConfig);

SKIP: {
unless ( -e "runtime/parrot/dynext/libnci_test$PConfig{load_ext}" ) {
    skip( "Please make libnci_test$PConfig{load_ext}",
          Test::Builder->expected_tests() );
}

pir_output_is( << 'CODE', << "OUTPUT", "nci_c - return a char in an INTEGER register");

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  # calling a function in libnci_test
  .local pmc nci_c
  dlfunc nci_c, libnci_test, "nci_c", "c"
  .local int nci_c_out
  ( nci_c_out ) = nci_c( )
  print nci_c_out
  print "\n"
.end
CODE
libnci_test was successfully loaded
22
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', "nci_d and nci_dlvar_double" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_double
    .local pmc nci_dlvar_double
    nci_dlvar_double = dlvar libnci_test, "nci_dlvar_double"

    # the contained structure pointer
    .local pmc nci_dlvar_double_decl
    nci_dlvar_double_decl = new ResizablePMCArray
    push nci_dlvar_double_decl, .DATATYPE_DOUBLE
    push nci_dlvar_double_decl, 0
    push nci_dlvar_double_decl, 0
    assign nci_dlvar_double, nci_dlvar_double_decl

    N2 = nci_dlvar_double[0]
    print N2
    print "\n"

    .local pmc nci_d
    nci_d = dlfunc libnci_test, "nci_d", "d"
    .local num nci_d_out
    ( nci_d_out ) = nci_d( )
    print nci_d_out
    print "\n"
    ( nci_d_out ) = nci_d( )
    print nci_d_out
    print "\n"
    ( nci_d_out ) = nci_d( )
    print nci_d_out
    print "\n"
    ( nci_d_out ) = nci_d( )
    print nci_d_out
    print "\n"
    ( nci_d_out ) = nci_d( )
    print nci_d_out
    print "\n"

NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-55555.555550
-555555.555500
-5555555.555000
-55555555.550000
-555555555.500000
-5555555555.000000
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "nci_f and nci_dlvar_float" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_float
    .local pmc nci_dlvar_float
    nci_dlvar_float = dlvar libnci_test, "nci_dlvar_float"

    # the contained structure pointer
    .local pmc nci_dlvar_float_decl
    nci_dlvar_float_decl = new ResizablePMCArray
    push nci_dlvar_float_decl, .DATATYPE_FLOAT
    push nci_dlvar_float_decl, 0
    push nci_dlvar_float_decl, 0
    assign nci_dlvar_float, nci_dlvar_float_decl

    N2 = nci_dlvar_float[0]
    print N2
    print "\n"

    .local pmc nci_f
    nci_f = dlfunc libnci_test, "nci_f", "f"
    .local num nci_f_out
    ( nci_f_out ) = nci_f( )
    print nci_f_out
    print "\n"
    ( nci_f_out ) = nci_f( )
    print nci_f_out
    print "\n"
    ( nci_f_out ) = nci_f( )
    print nci_f_out
    print "\n"
    ( nci_f_out ) = nci_f( )
    print nci_f_out
    print "\n"
    ( nci_f_out ) = nci_f( )
    print nci_f_out
    print "\n"

NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-333.000000
-3330.000000
-33300.000000
-333000.000000
-3330000.000000
-33300000.000000
OUTPUT

pir_output_is( << 'CODE', << "OUTPUT", "nci_l - return a long in an INTEGER register");

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  # calling a function in libnci_test
  .local pmc nci_l
  dlfunc nci_l, libnci_test, "nci_l", "l"
  .local int nci_l_out
  ( nci_l_out ) = nci_l( )
  print nci_l_out
  print "\n"
.end
CODE
libnci_test was successfully loaded
-7777777
OUTPUT

pir_output_is( << 'CODE', << "OUTPUT", "nci_p - return a pointer to int");

.include "datatypes.pasm"

.sub test :main

    # load library
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    unless libnci_test goto NOT_LOADED
    print "libnci_test was successfully loaded\n"

    # calling a function in libnci_test
    .local pmc nci_p
    dlfunc nci_p, libnci_test, "nci_p", "p"
    .local pmc nci_p_out
    ( nci_p_out ) = nci_p( )

    # the contained structure pointer
    .local pmc nci_p_out_decl
    nci_p_out_decl = new ResizablePMCArray
    push nci_p_out_decl, .DATATYPE_INT
    push nci_p_out_decl, 0
    push nci_p_out_decl, 0
    assign nci_p_out, nci_p_out_decl

    I2 = nci_p_out[0]
    print I2
    print "\n"
.end
CODE
libnci_test was successfully loaded
-4444
OUTPUT

pir_output_is( << 'CODE', << "OUTPUT", "nci_t - return a C-string");

.include "datatypes.pasm"

.sub test :main

    # load library
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    unless libnci_test goto NOT_LOADED
    print "libnci_test was successfully loaded\n"

    # calling a function in libnci_test
    .local pmc nci_t
    dlfunc nci_t, libnci_test, "nci_t", "t"
    .local string nci_t_out
    ( nci_t_out ) = nci_t( )
    print nci_t_out
.end
CODE
libnci_test was successfully loaded
This is a C-string.
OUTPUT

pir_output_is( << 'CODE', << "OUTPUT", "nci_s - return a short in an INTEGER register");

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  # calling a function in libnci_test
  .local pmc nci_s
  dlfunc nci_s, libnci_test, "nci_s", "s"
  .local int nci_s_out
  ( nci_s_out ) = nci_s( )
  print nci_s_out
  print "\n"
.end
CODE
libnci_test was successfully loaded
333
OUTPUT

SKIP:
{

skip ("nci_dlvar_int hangs on HP-UX", 1) if $^O eq 'hpux'; 

pir_output_is( << 'CODE', << 'OUTPUT', "nci_v and nci_dlvar_int" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc nci_dlvar_int
    nci_dlvar_int = dlvar libnci_test, "nci_dlvar_int"

    # the contained structure pointer
    .local pmc nci_dlvar_int_decl
    nci_dlvar_int_decl = new ResizablePMCArray
    push nci_dlvar_int_decl, .DATATYPE_INT
    push nci_dlvar_int_decl, 0
    push nci_dlvar_int_decl, 0
    assign nci_dlvar_int, nci_dlvar_int_decl

    I2 = nci_dlvar_int[0]
    print I2
    print "\n"

    .local pmc nci_v
    nci_v = dlfunc libnci_test, "nci_v", "v"
    nci_v()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_v()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_v()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_v()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-4444
-44440
-444400
-4444000
-44440000
OUTPUT
}

pasm_output_is(<<'CODE', <<'OUTPUT', "nci_dd - PASM");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  set_args "(0)", 4.0
  get_results "(0)", N5
  invokecc P0
  ne N5, 8.0, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', "nci_dd - PIR" );

.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"
    .local pmc twice
    twice = dlfunc libnci_test, "nci_dd", "dd"
    .local float r
    r = twice( -4.128 )
    print r
NOT_LOADED:
    print "\n"
.end
CODE
libnci_test was successfully loaded
-8.256000
OUTPUT


pir_output_is( << 'CODE', << "OUTPUT", "get_string()" );

.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    unless libnci_test goto NOT_LOADED
        .local string filename_with_path
        filename_with_path = libnci_test
        # depending on the platform, 'filename' has path info or not
        .local int start_of_filename
        start_of_filename = index filename_with_path, 'libnci_test'
        if start_of_filename == -1 goto NOT_LOADED
            .local string filename
            filename = substr filename_with_path, start_of_filename
            print filename
            print " was successfully loaded"
    NOT_LOADED:
    print "\n"
.end
CODE
libnci_test$PConfig{load_ext} was successfully loaded
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_fff");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_fff", "fff"
  print "dlfunced\n"
  set N5, 12.0
  set N6, 3.0
  set_args "(0,0)", N5, N6
  get_results "(0)", N5
  invokecc P0
  ne N5, 4.0, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_isc");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_isc", "isc"
  print "dlfunced\n"
  set I5, 2
  set I6, 3
  set_args "(0,0)", I5, I6
  get_results "(0)", I5
  invokecc P0
  ne I5, 6, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_ssc");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_ssc", "ssc"
  print "dlfunced\n"
  set I5, 2
  set I6, 3
  set_args "(0,0)", I5, I6
  get_results "(0)", I5
  invokecc P0
  ne I5, 6, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_csc");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_csc", "csc"
  print "dlfunced\n"
  set I5, 6
  set I6, 7
  set_args "(0,0)", I5, I6
  get_results "(0)", I5
  invokecc P0
  ne I5, 42, nok_1
  print "ok 1\n"
  end
nok_1: print "nok 1\n"
  print I5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_it");
  loadlib P1, "libnci_test"
  printerr "loaded\n"
  dlfunc P0, P1, "nci_it", "it"
  printerr "dlfunced\n"
  set S5, "ko\n"
  set_args "(0)", S5
  get_results "(0)", I5
  invokecc P0
  ne I5, 2, nok_1
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


pir_output_is(<<'CODE', <<'OUTPUT', "nci_it");

.include "datatypes.pasm"

.sub test :main
  loadlib P1, "libnci_test"
  printerr "loaded\n"
  .local pmc nci_it
  nci_it = dlfunc P1, "nci_it", "it"
  printerr "dlfunced\n"
  ( I5 ) = nci_it( "ko" )
  ne I5, 2, nok_1
  printerr "ok "
  printerr I5
  printerr "\n"
  end
nok_1: printerr "nok 1\n"
  printerr I5
  printerr "\n"
  end
nok_2: printerr "nok 2\n"
.end

CODE
loaded
dlfunced
ok
ok 2
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_tt");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_tt", "tt"
  print "dlfunced\n"
  set S5, "ko\n"
  set_args "(0)", S5
  get_results "(0)", S5
  invokecc P0
  print S5
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
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_dd - stress test");
  loadlib P1, "libnci_test"
  print "loaded\n"
  set I10, 10000
  print "dlfunced\n"
loop:
  dlfunc P0, P1, "nci_dd", "dd"
  set N5, 77.0
  set_args "(0)", 4.0
  get_results "(0)", N5
  invokecc P0
  ne N5, 8.0, nok_1
  dec I10
  gt I10, 0, loop
  print "ok 1\n"
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
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_dd - clone");
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  clone P2, P0
  print "ok 1\n"
  set_args "(0)", 4.0
  get_results "(0)", N5
  invokecc P0
  ne N5, 8.0, nok_1
  print "ok 2\n"
  set_args "(0)", 4.0
  get_results "(0)", N5
  invokecc P2
  ne N5, 8.0, nok_1
  end
nok_1: print "nok 1\n"
  print N5
  print "\n"
  end
CODE
loaded
dlfunced
ok 1
ok 2
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_iiii");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_iiii", "iiii"
  set I5, 10
  set I6, 20
  set I7, 30
  set_args "(0,0,0)", I5,I6,I7
  get_results "(0)", I5
  invokecc P0
  print I5
  print "\n"
  end
CODE
10 20 30
2
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_i4i");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_i4i", "i4i"
  new P5, .Integer
  set P5, -6
  set I5, -7
  set_args "(0,0)", P5,I5
  get_results "(0)", I5
  invokecc P0
  print I5
  print "\n"
  end
CODE
42
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_ii3");
.include "datatypes.pasm"
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_ii3", "ii3"
  set I5, -6

  new P5, .Integer
  set P5, -7

  set_args "(0,0)", I5,P5
  get_results "(0)", I5
  invokecc P0

  print I5
  print "\n"
  print P5
  print "\n"
  end
CODE
42
4711
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "nci_tb");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_tb", "tb"
  set S5, "ko\n"
  set_args "(0)", S5
  get_results "(0)", S5
  invokecc P0
  print S5
  end
CODE
ok worked
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "nci_tB");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_tB", "tB"
  set S5, "ko\n"
  set_args "(0)", S5
  get_results "(0)", S5
  invokecc P0
  print S5
  end
CODE
ok done
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - struct with ints");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int[2]; char }
  set I5, 0
  set_args "(0)", I5
  get_results "(0)", P5
  invokecc P0
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - struct with floats");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { float[2]; double }
  set_args "(0)", 1
  get_results "(0)", P5
  invokecc P0
  new P2, .ResizablePMCArray
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
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; int }
  set_args "(0)", 2
  get_results "(0)", P5
  invokecc P0
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - char*");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char*; int }
  set_args "(0)", 3
  get_results "(0)", P5
  invokecc P0
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct *");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; x->{int, double} }
  set_args "(0)", 4
  get_results "(0)", P5
  invokecc P0
.include "datatypes.pasm"
  # the contained structure
  new P3, .ResizablePMCArray
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
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct * w named access");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  set_args "(0)", 8
  get_results "(0)", P5
  invokecc P0
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - func_ptr* with signature");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int (*f)(char *) }
  set_args "(0)", 5
  get_results "(0)", P5
  invokecc P0
  new P2, .ResizablePMCArray
.include "datatypes.pasm"
  push P2, .DATATYPE_FUNC_PTR
  # attach function signature property to this type
  set P1, P2[-1]
  new P3, .String
  set P3, "it"
  setprop P1, "_signature", P3
  push P2, 0
  push P2, 0
  assign P5, P2
  # now we get a callable NCI PMC
  set P0, P5[0]
  set_args "(0)", "hello call_back"
  get_results "(0)", I5
  invokecc P0
  print I5
  print "\n"
  end
CODE
hello call_back
4711
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct aligned");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int; {int; int} int }
  set_args "(0)", 6
  get_results "(0)", P5
  invokecc P0
.include "datatypes.pasm"
  # the nested structure
  new P3, .ResizablePMCArray
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested struct unaligned");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set_args "(0)", 7
  get_results "(0)", P5
  invokecc P0
.include "datatypes.pasm"
  # the nested structure
  new P3, .ResizablePMCArray
  push P3, .DATATYPE_CHAR
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, .UnManagedStruct, P3
  # outer structure
  new P2, .ResizablePMCArray
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


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_pi - nested, unaligned, named");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set_args "(0)", 7
  get_results "(0)", P5
  invokecc P0
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


pir_output_is( << 'CODE', << "OUTPUT", "nci_pi - int");

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  # calling a function in libnci_test
  .local pmc nci_pi
  dlfunc nci_pi, libnci_test, "nci_pi", "pi"
  .local pmc nci_pi_out
  ( nci_pi_out ) = nci_pi( 9 )

  # the contained structure pointer
  .local pmc nci_pi_out_decl
  nci_pi_out_decl = new ResizablePMCArray
  push nci_pi_out_decl, .DATATYPE_INT
  push nci_pi_out_decl, 0
  push nci_pi_out_decl, 0

  # attach struct initializer
  assign nci_pi_out, nci_pi_out_decl
  set I0, nci_pi_out[0]
  print I0
NOT_LOADED:
  print "\n"
.end
CODE
libnci_test was successfully loaded
55555
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_ip");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_ip", "ip"
  # this test function wants a struct
  # { double d; float f; int i; char*}
  # and returns the sum of these values
  new P2, .ResizablePMCArray
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
  set_args "(0)", P5
  get_results "(0)", I5
  invokecc P0
  print I5
  print "\n"
  end
CODE
hello from Parrot
31
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_vP");
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_vP", "vP"
  new P5, .String
  set P5, "ok\n"
  set_args "(0)", P5
  invokecc P0
  null P5
  set_args "(0)", P5
  invokecc P0
  end
CODE
ok
got null
OUTPUT


# Tests with callback functions

pasm_output_is(<<'CODE', <<'OUTPUT', "nci_cb_C1 - PASM");

  # we need a flag if the call_back is already done
  new P10, .Integer
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const .Sub P6 = "_call_back"
  # prepare user data
  new P7, .Integer
  set P7, 42
  new_callback P5, P6, P7, "tU"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_C1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "(0,0)", P5, P7
  invokecc P0
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

.pcc_sub _call_back:
  get_params "(0,0)", P5, S5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc

CODE
ok 1
ok 2
in callback
user data: 42
external data: succeeded
done.
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "nci_cb_C1 - PIR");

.sub test :main

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
    .const .Sub cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "tU"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    .local pmc nci_cb_C1
    nci_cb_C1 = dlfunc libnci_test, "nci_cb_C1", "vpP"
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
.param pmc u
.param string s
  print "in callback\n"
  print "user data: "
  print u
  print "\n"
  print "external data: "
  print s
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: succeeded
the callback has run
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_cb_C2 - PASM");
  # we need a flag if the call_back is already done
  new P10, .Integer
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const .Sub P6 = "_call_back"
  # prepare user data
  new P7, .Integer
  set P7, 42
  new_callback P5, P6, P7, "iU"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_C2", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "(0,0)", P5, P7
  invokecc P0
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

.pcc_sub _call_back:
  get_params "(0,0)", P5, I5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print I5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc


CODE
ok 1
ok 2
in callback
user data: 42
external data: 77
done.
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "nci_cb_C3 - PIR");


.include "datatypes.pasm"

.sub test :main

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
    .const .Sub cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "pU"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    .local pmc nci_cb_C3
    nci_cb_C3 = dlfunc libnci_test, "nci_cb_C3", "vpP"
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
  get_params "(0,0)", P5, P6
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"

  # P6 is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .ResizablePMCArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign P6, P2

  # print referenced integer in libnci_test.so
  I17 = P6[0]
  print "external data: "
  print I17
  print "\n"

  find_global P12, "cb_done"
  inc P12
  returncc
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 99
the callback has run
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "nci_cb_D1 - PASM");

  # we need a flag if the call_back is already done
  new P10, .Integer
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const .Sub P6 = "_call_back"
  # prepare user data
  new P7, .Integer
  set P7, 42
  new_callback P5, P6, P7, "Ut"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_D1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "(0,0)", P5, P7
  invokecc P0
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

.pcc_sub _call_back:
  get_params "(0,0)", P5, S5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc

CODE
ok 1
ok 2
in callback
user data: 42
external data: succeeded
done.
OUTPUT


pasm_output_is(<<'CODE', <<'OUTPUT', "nci_cb_D2 - PASM");
  # we need a flag if the call_back is already done
  new P10, .Integer
  store_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const .Sub P6 = "_call_back"
  # prepare user data
  new P7, .Integer
  set P7, 42
  new_callback P5, P6, P7, "Ui"	# Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_D2", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "(0,0)", P5, P7
  invokecc P0
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

.pcc_sub _call_back:
  get_params "(0,0)", P5, I5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print I5
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc


CODE
ok 1
ok 2
in callback
user data: 42
external data: 88
done.
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "nci_cb_D2 - PIR");

.sub test :main

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
    .const .Sub cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Ui"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    .local pmc nci_cb_D2
    nci_cb_D2 = dlfunc libnci_test, "nci_cb_D2", "vpP"
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
.param pmc u
.param int i
  print "in callback\n"
  print "user data: "
  print u
  print "\n"
  print "external data: "
  print i
  print "\n"
  find_global P12, "cb_done"
  inc P12
  returncc
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 88
the callback has run
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "nci_cb_D3 - PIR");


.include "datatypes.pasm"

.sub test :main

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
    .const .Sub cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Up"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"
    .local pmc nci_cb_D3
    nci_cb_D3 = dlfunc libnci_test, "nci_cb_D3", "vpP"
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
.param pmc u
.param pmc s
  print "in callback\n"
  print "user data: "
  print u
  print "\n"

  # s is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .ResizablePMCArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign s, P2

  # print referenced integer in libnci_test.so
  I17 = s[0]
  print "external data: "
  print I17
  print "\n"

  find_global P12, "cb_done"
  inc P12
  returncc
.end

CODE
created a callback sub
loaded a function that takes a callback
in callback
user data: 42
external data: 111
the callback has run
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "nci_cb_D4 - synchronous callbacks");


.include "datatypes.pasm"

.sub test :main

    # turn off JIT or special core - no events yet
    bounds 1
    # prepare user data
    .local pmc user_data
    user_data = new Integer
    user_data = 42

    # load libnci_test
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"

    # reset int_cb_D4 to 1
    .local pmc int_cb_D4
    int_cb_D4 = dlvar libnci_test, "int_cb_D4"
    .local pmc int_cb_D4_decl
    int_cb_D4_decl = new ResizablePMCArray
    push int_cb_D4_decl, .DATATYPE_INT
    push int_cb_D4_decl, 0
    push int_cb_D4_decl, 0
    assign int_cb_D4, int_cb_D4_decl
    int_cb_D4[0] = 1

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const .Sub cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "Up"	# Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc nci_cb_D4
    nci_cb_D4 = dlfunc libnci_test, "nci_cb_D4", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_D4( cb_wrapped, user_data )

    # reset int_cb_D4 to 1
    int_cb_D4[0] = 1

    .local pmc synchronous
    synchronous = new Integer
    synchronous = 1
    setprop user_data, "_synchronous", synchronous
    print "marked callback as synchronous\n"
    nci_cb_D4( cb_wrapped, user_data )

    end
.end

.sub _call_back
.param pmc u
.param pmc s
  # s is a UnManagedStruct PMC containing a pointer to an integer
  new P2, .ResizablePMCArray
  push P2, .DATATYPE_INT
  push P2, 0
  push P2, 0
  assign s, P2

  print "external data: "
  I17 = s[0]
  print I17
  print "\n"
  I17 = I17 * 10
  s[0] = I17

  returncc
.end

CODE
created a callback sub
loaded a function that takes a callback
external data: 10
external data: 100
external data: 1000
external data: 10000
external data: 100000
external data: 1000000
external data: 10000000
external data: 100000000
external data: 1000000000
marked callback as synchronous
external data: 1
external data: 11
external data: 111
external data: 1111
external data: 11111
external data: 111111
external data: 1111111
external data: 11111111
external data: 111111111
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', 'nci_pip - array of structs');

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

  loadlib P1, "libnci_test"
  set_args "(0,0)", 4, P5
  dlfunc P0, P1, "nci_pip", "pip"
  invokecc P0
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


pasm_output_is(<<'CODE', <<'OUTPUT', 'nci_i33 - out parameters and return values');

.include "datatypes.pasm"
  new P2, .Integer
  set P2, 3
  new P3, .Integer
  set P3, 2

  loadlib P1, "libnci_test"
  set_args "(0,0)", P2, P3
  get_results "(0)", I5
  dlfunc P0, P1, "nci_i33", "i33"
  invokecc P0

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


pasm_output_is(<<'CODE', <<'OUTPUT', 'nci_vpii - nested structs');

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

  set_args "(0,0,0)", P5, 1, 2
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_vpii", "vpii"
  invokecc P0

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


pasm_output_is(<<'CODE', <<'OUTPUT', 'nci_piiii - nested array in a struct');
.include "datatypes.pasm"

  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_piiii", "piiii"
  set_args "(0,0,0,0)", 100,200,400,800
  get_results "(0)", P5
  invokecc P0

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


pir_output_is( << 'CODE', << "OUTPUT", "nci_pii - writing back to libnci_test.so" );

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  # calling a function in libnci_test
  .local pmc multiply
  multiply = dlfunc libnci_test, "nci_pii", "pii"
  .local pmc product_pointer
  ( product_pointer ) = multiply( -5, 11111 )

  # the contained structure pointer
  .local pmc product_pointer_decl
  product_pointer_decl = new ResizablePMCArray
  push product_pointer_decl, .DATATYPE_INT
  push product_pointer_decl, 0
  push product_pointer_decl, 0
  assign product_pointer, product_pointer_decl

  # check result of multiplication
  .local int product
  product = product_pointer[0]
  print product
  print "\n"

  # Write back into libnci_test and check it
  product_pointer[0] = 333
  product = 4444
  print product
  print "\n"
  .local pmc nci_i
  dlfunc nci_i, libnci_test, "nci_i", "i"
  ( product ) = nci_i()
  print product
  print "\n"

NOT_LOADED:
  end
.end
CODE
libnci_test was successfully loaded
-55555
4444
333
OUTPUT


SKIP:
{

skip ("nci_dlvar_int hangs on HP-UX", 1) if $^O eq 'hpux'; 

pir_output_is( << 'CODE', << 'OUTPUT', "nci_vv and nci_dlvar_int" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc nci_dlvar_int
    nci_dlvar_int = dlvar libnci_test, "nci_dlvar_int"

    # the contained structure pointer
    .local pmc nci_dlvar_int_decl
    nci_dlvar_int_decl = new ResizablePMCArray
    push nci_dlvar_int_decl, .DATATYPE_INT
    push nci_dlvar_int_decl, 0
    push nci_dlvar_int_decl, 0
    assign nci_dlvar_int, nci_dlvar_int_decl

    I2 = nci_dlvar_int[0]
    print I2
    print "\n"

    .local pmc nci_vv
    nci_vv = dlfunc libnci_test, "nci_vv", "vv"
    nci_vv()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_vv()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_vv()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
    nci_vv()
    I1 = nci_dlvar_int[0]
    print I1
    print "\n"
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-4444
-13332
-39996
-119988
-359964
OUTPUT
}


pir_output_is( << 'CODE', << 'OUTPUT', "dlvar - unknown symbol" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc non_existing
    non_existing = dlvar libnci_test, "non_existing"
    .local int is_defined
    is_defined = defined non_existing
    if is_defined goto IS_DEFINED
    print "'non_existing' is not defined\n"
IS_DEFINED:
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
'non_existing' is not defined
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', "dlfunc - unknown symbol" );

.include "datatypes.pasm"

.sub test :main

    # load libnci_test.so
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print library_name
    print " was successfully loaded\n"

    # address of nci_dlvar_int
    .local pmc non_existing
    non_existing = dlfunc libnci_test, "non_existing", "iiii"
    .local int is_defined
    is_defined = defined non_existing
    if is_defined goto IS_DEFINED
    print "'non_existing' is not defined\n"
IS_DEFINED:
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
'non_existing' is not defined
OUTPUT

pasm_output_is( << 'CODE', << 'OUTPUT', "loading same library twice" );
      loadlib P1, "libnci_test"
      if P1, OK1
      print "not "
OK1:  print "ok 1\n"
      loadlib P2, "libnci_test"
      if P2, OK2
      print "not "
OK2:  print "ok 2\n"
      issame I0, P1, P2
      if I0, OK3
      print "not "
OK3:  print "ok 3\n"
      end
CODE
ok 1
ok 2
ok 3
OUTPUT

} # SKIP

pir_output_is(<< 'CODE', << 'OUTPUT', "opcode 'does'");

.sub test :main
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

pir_output_is(<< 'CODE', << 'OUTPUT', "conversion d <-> P");
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    .local pmc twice
    twice = dlfunc libnci_test, "nci_dd", "dd"
    .local pmc f, g
    f = new Integer
    f = 21
    g = twice( f )
    print g
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "conversion S <-> P");
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    .local pmc reverse
    reverse = dlfunc libnci_test, "nci_tt", "tt"
    .local pmc s, t
    s = new String
    s = "ko"
    t = reverse( s )
    print t
.end
CODE
ok worked
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "conversion I <-> P");
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    .local pmc mult
    mult = dlfunc libnci_test, "nci_i4i", "i4i"
    .local pmc i, j
    i = new Integer
    i = 2
    j = mult( 21, i )       # call signature is PI
    print j
    print "\n"
.end
CODE
42
OUTPUT
