#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config qw(%PConfig);

=head1 NAME

t/pmc/nci.t - test the Native Call Interface

=head1 SYNOPSIS

    % prove t/pmc/nci.t

=head1 DESCRIPTION

This tests the Native Call Interface, that is the ParrotLibrary PMC.
Most tests are skipped when the F<libnci_test.so> shared library is not found.

=head1 SEE ALSO

  F<docs/pdds/pdd16_native_call.pod>
  F<config/gen/makefiles/root.in>
  F<src/nci_test.c>

=cut

$ENV{TEST_PROG_ARGS} ||= '';

SKIP: {
    unless ( -e "runtime/parrot/dynext/libnci_test$PConfig{load_ext}" ) {
        plan skip_all => "Please make libnci_test$PConfig{load_ext}";
    }
    plan tests => 58;

    pir_output_is( << 'CODE', << 'OUTPUT', 'load library fails' );
.sub test :main
  .local pmc libnci_test
  .local int lib_defined
  libnci_test = loadlib "no_such_library"
  lib_defined = defined libnci_test
  if lib_defined goto LIB_DEFINED
  branch LIB_UNDEFINED

LIB_DEFINED:
  print "defined\n"
  branch LIB_END

LIB_UNDEFINED:
  print "undefined\n"
  branch LIB_END

LIB_END:
.end
CODE
undefined
OUTPUT

    pir_output_is( << 'CODE', << 'OUTPUT', 'dlfunc on undef' );
.sub test :main
  .local pmc libnci_test
  .local pmc func
  .local int func_defined
  libnci_test = loadlib "no_such_library"
  dlfunc func, libnci_test, "no_such_function", "v"
  func_defined = defined func
  if func_defined goto FUNC_DEFINED
  branch FUNC_UNDEFINED
FUNC_DEFINED:
  print "defined\n"
  branch FUNC_END

FUNC_UNDEFINED:
  print "undefined\n"
  branch FUNC_END

FUNC_END:
.end
CODE
undefined
OUTPUT

    pir_output_is( << 'CODE', << 'OUTPUT', 'dlfunc function not found' );
.sub test :main
  .local pmc libnci_test
  .local pmc func
  .local int func_defined
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto NOT_LOADED
  print "libnci_test was successfully loaded\n"

  dlfunc func, libnci_test, "no_such_function", "v"
  func_defined = defined func
  if func_defined goto FUNC_DEFINED
  branch FUNC_UNDEFINED

FUNC_DEFINED:
  print "defined\n"
  branch FUNC_END

FUNC_UNDEFINED:
  print "undefined\n"
  branch FUNC_END

NOT_LOADED:
  print "Could not load libnci_test\n"
  branch FUNC_END

FUNC_END:
.end
CODE
libnci_test was successfully loaded
undefined
OUTPUT

    pir_output_is( << 'CODE', << 'OUTPUT', "dlfunc function is defined" );

.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print "libnci_test was successfully loaded\n"
    .local pmc func
    func = dlfunc libnci_test, "nci_dd", "dd"
    .local int def
    def = defined func
    print def
NOT_LOADED:
    print "\n"
.end
CODE
libnci_test was successfully loaded
1
OUTPUT

    pir_output_is( << 'CODE', << 'OUTPUT', "dlfunc function pointer" );

.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib library_name
    unless libnci_test goto NOT_LOADED
    print "libnci_test was successfully loaded\n"

    $P0 = dlfunc libnci_test, "nci_dd", "dd"

    $I0 = get_addr $P0
    $I1 = $P0

    $P1 = clone $P0

    $I2 = get_addr $P1
    $I3 = $P1

    $I4 = $I0 == $I2
    print $I4
    print "\n"

    $I4 = $I1 == $I3
    print $I4
    print "\n"

    $I0 = istrue $P0
    print $I0
NOT_LOADED:
    print "\n"
.end
CODE
libnci_test was successfully loaded
1
1
1
OUTPUT

    pir_output_is( << 'CODE', << "OUTPUT", "nci_c - return a char in an INTEGER register" );

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
NOT_LOADED:
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
    nci_dlvar_double_decl = new ['ResizablePMCArray']
    push nci_dlvar_double_decl, .DATATYPE_DOUBLE
    push nci_dlvar_double_decl, 0
    push nci_dlvar_double_decl, 0
    assign nci_dlvar_double, nci_dlvar_double_decl

    $N2 = nci_dlvar_double[0]
    print $N2
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
-55555.55555
-555555.5555
-5555555.555
-55555555.55
-555555555.5
-5555555555
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
    nci_dlvar_float_decl = new ['ResizablePMCArray']
    push nci_dlvar_float_decl, .DATATYPE_FLOAT
    push nci_dlvar_float_decl, 0
    push nci_dlvar_float_decl, 0
    assign nci_dlvar_float, nci_dlvar_float_decl

    $N2 = nci_dlvar_float[0]
    print $N2
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
-333
-3330
-33300
-333000
-3330000
-33300000
OUTPUT

    pir_output_is( << 'CODE', << "OUTPUT", "nci_l - return a long in an INTEGER register" );

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
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-7777777
OUTPUT

    pir_output_is( << 'CODE', << "OUTPUT", "nci_p - return a pointer to int" );

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
    nci_p_out_decl = new ['ResizablePMCArray']
    push nci_p_out_decl, .DATATYPE_INT
    push nci_p_out_decl, 0
    push nci_p_out_decl, 0
    assign nci_p_out, nci_p_out_decl

    $I2 = nci_p_out[0]
    print $I2
    print "\n"
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
-4444
OUTPUT

    pir_output_is( << 'CODE', << "OUTPUT", "nci_s - return a short in an INTEGER register" );

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
NOT_LOADED:
.end
CODE
libnci_test was successfully loaded
333
OUTPUT

SKIP:
    {

        skip( "nci_dlvar_int hangs on HP-UX", 1 ) if $^O eq 'hpux';

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
    nci_dlvar_int_decl = new ['ResizablePMCArray']
    push nci_dlvar_int_decl, .DATATYPE_INT
    push nci_dlvar_int_decl, 0
    push nci_dlvar_int_decl, 0
    assign nci_dlvar_int, nci_dlvar_int_decl

    $I2 = nci_dlvar_int[0]
    print $I2
    print "\n"

    .local pmc nci_v
    nci_v = dlfunc libnci_test, "nci_v", "v"
    nci_v()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_v()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_v()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_v()
    $I1 = nci_dlvar_int[0]
    print $I1
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_dd - PASM" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  set_args "0", 4.0
  invokecc P0
  get_results "0", N5
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
    .local num r
    r = twice( -4.128 )
    print r
NOT_LOADED:
    print "\n"
.end
CODE
libnci_test was successfully loaded
-8.256
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
libnci_test was successfully loaded
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_fff" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_fff", "fff"
  print "dlfunced\n"
  set N5, 12.0
  set N6, 3.0
  set_args "0,0", N5, N6
  invokecc P0
  get_results "0", N5
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_isc" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_isc", "isc"
  print "dlfunced\n"
  set I5, 2
  set I6, 3
  set_args "0,0", I5, I6
  invokecc P0
  get_results "0", I5
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_ssc" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_ssc", "ssc"
  print "dlfunced\n"
  set I5, -2
  set I6, 3
  set_args "0,0", I5, I6
  invokecc P0
  get_results "0", I5
  ne I5, -6, nok_1
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_csc" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_csc", "csc"
  print "dlfunced\n"
  set I5, 6
  set I6, 7
  set_args "0,0", I5, I6
  invokecc P0
  get_results "0", I5
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_dd - stress test" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  set I10, 10000
  print "dlfunced\n"
loop:
  dlfunc P0, P1, "nci_dd", "dd"
  set N5, 77.0
  set_args "0", 4.0
  invokecc P0
  get_results "0", N5
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_dd - clone" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  print "loaded\n"
  dlfunc P0, P1, "nci_dd", "dd"
  print "dlfunced\n"
  clone P2, P0
  print "ok 1\n"
  set_args "0", 4.0
  invokecc P0
  get_results "0", N5
  ne N5, 8.0, nok_1
  print "ok 2\n"
  set_args "0", 4.0
  invokecc P2
  get_results "0", N5
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_iiii" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_iiii", "iiii"
  set I5, 10
  set I6, 20
  set I7, 30
  set_args "0,0,0", I5,I6,I7
  invokecc P0
  get_results "0", I5
  print I5
  print "\n"
  end
CODE
10 20 30
2
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - struct with ints" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int[2]; char }
  set I5, 0
  set_args "0", I5
  invokecc P0
  get_results "0", P5
  new P2, ['ResizablePMCArray']
.include "datatypes.pasm"
  push P2, .DATATYPE_INT
  push P2, 2    # 2 elem array
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - struct with floats" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { float[2]; double }
  set_args "0", 1
  invokecc P0
  get_results "0", P5
  new P2, ['ResizablePMCArray']
.include "datatypes.pasm"
  push P2, .DATATYPE_FLOAT
  push P2, 2    # 2 elem array
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
42
100
47.11
OUTPUT

    pasm_output_like( <<'CODE', <<'OUTPUT', "nci_pi - align" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; int }
  set_args "0", 2
  invokecc P0
  get_results "0", P5
  new P2, ['ResizablePMCArray']
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - char*" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char*; int }
  set_args "0", 3
  invokecc P0
  get_results "0", P5
  new P2, ['ResizablePMCArray']
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - nested struct *" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; x->{int, double} }
  set_args "0", 4
  invokecc P0
  get_results "0", P5
.include "datatypes.pasm"
  # the contained structure
  new P3, ['ResizablePMCArray']
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_DOUBLE
  push P3, 0
  push P3, 0
  new P4, ['UnManagedStruct'], P3
  # outer structure
  new P2, ['ResizablePMCArray']
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
200
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - nested struct * w named access" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  set_args "0", 8
  invokecc P0
  get_results "0", P5
.include "datatypes.pasm"
  # the contained structure pointer
  new  P6, 'OrderedHash'
  set  P6[ 'i' ], .DATATYPE_INT
  push P6, 0
  push P6, 0
  set  P6[ 'j' ], .DATATYPE_INT
  push P6, 0
  push P6, 0
  new P7, ['UnManagedStruct'], P6
  # the contained structure
  new  P3, 'OrderedHash'
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
  new P4, ['UnManagedStruct'], P3
  # outer structure
  new P2, ['OrderedHash']
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_pi - func_ptr* with signature" );
.include "datatypes.pasm"
.sub main :main
    .local pmc struct_ptr
    $P1      = loadlib "libnci_test"
    $P0      = dlfunc $P1, "nci_pi", "pi"
    struct_ptr = $P0(5) # this test function returns a struct { int (*f)(char *) }

    .local pmc sv
    sv = new [ 'StructView' ], [ .DATATYPE_STRUCT; 1; .DATATYPE_PTR ]
    .local pmc func_ptr
    func_ptr = sv[struct_ptr; 0]

    .local pmc func
    func = new ['NCI']
    func[ .DATATYPE_INT; .DATATYPE_PTR; .DATATYPE_PTR ] = func_ptr
    # func["ipP"] = func_ptr

    .local pmc str_to_cstr, free_cstr
    $P1 = null
    str_to_cstr = dlfunc $P1, "Parrot_str_to_cstring", 'ppS'
    free_cstr   = dlfunc $P1, "Parrot_str_free_cstring", 'vp'

    $P1 = getinterp
    $S0 = "hello call_back"
    $P2 = str_to_cstr($P1, $S0)
    $I5 = func($P1, $P2)
    free_cstr($P2)
    say $I5
.end
CODE
hello call_back
4711
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - nested struct aligned" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { int; {int; int} int }
  set_args "0", 6
  invokecc P0
  get_results "0", P5
.include "datatypes.pasm"
  # the nested structure
  new P3, ['ResizablePMCArray']
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, ['UnManagedStruct'], P3
  # outer structure
  new P2, ['ResizablePMCArray']
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - nested struct unaligned" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set_args "0", 7
  invokecc P0
  get_results "0", P5
.include "datatypes.pasm"
  # the nested structure
  new P3, ['ResizablePMCArray']
  push P3, .DATATYPE_CHAR
  push P3, 0
  push P3, 0
  push P3, .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, ['UnManagedStruct'], P3
  # outer structure
  new P2, ['ResizablePMCArray']
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_pi - nested, unaligned, named" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_pi", "pi"
  # this test function returns a struct { char; {char; int} char }
  set_args "0", 7
  invokecc P0
  get_results "0", P5
.include "datatypes.pasm"
  # the nested structure
  new P3, ['OrderedHash']
  set P3["i"], .DATATYPE_CHAR
  push P3, 0
  push P3, 0
  set P3["j"], .DATATYPE_INT
  push P3, 0
  push P3, 0
  new P4, ['UnManagedStruct'], P3
  # outer structure
  new P2, ['OrderedHash']
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

    pir_output_is( << 'CODE', << "OUTPUT", "nci_pi - int" );

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
  nci_pi_out_decl = new ['ResizablePMCArray']
  push nci_pi_out_decl, .DATATYPE_INT
  push nci_pi_out_decl, 0
  push nci_pi_out_decl, 0

  # attach struct initializer
  assign nci_pi_out, nci_pi_out_decl
  set $I0, nci_pi_out[0]
  print $I0
NOT_LOADED:
  print "\n"
.end
CODE
libnci_test was successfully loaded
55555
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_ip" );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_ip", "ip"
  # this test function wants a struct
  # { double d; float f; int i; char*}
  # and returns the sum of these values
  new P2, ['ResizablePMCArray']
.include "datatypes.pasm"
  push P2, .DATATYPE_DOUBLE
  push P2, 0
  push P2, 0
  push P2, .DATATYPE_FLOAT
  push P2, 0    # 1 elem array
  push P2, 0
  push P2, .DATATYPE_INT
  push P2, 0    # 1 elem array
  push P2, 0
  push P2, .DATATYPE_CSTR
  push P2, 0    # 1 elem array
  push P2, 0
  new P5, ['ManagedStruct'], P2
  set P5[0], 10.0
  set P5[1], 4.0
  set P5[2], 17
  set P5[3], "hello from Parrot\x0"
  set I5, 1
  set_args "0", P5
  invokecc P0
  get_results "0", I5
  print I5
  print "\n"
  end
CODE
hello from Parrot
31
OUTPUT

    pir_output_is( << 'CODE', << "OUTPUT", "nci_pi - null" );

.include "datatypes.pasm"

.sub test :main

  # load library
  .local pmc libnci_test
  libnci_test = loadlib "libnci_test"
  unless libnci_test goto FAILED

  # calling a function in libnci_test
  .local pmc nci_pi
  dlfunc nci_pi, libnci_test, "nci_pi", "pi"
  .local pmc result
  result = nci_pi( 10 )
  unless_null result, FAILED
  print "got null"
FAILED:
  print "\n"
.end
CODE
got null
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_vP", todo => 'Disabled to avoid linkage problems, see src/nci_test.c' );
.pcc_sub :main main:
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_vP", "vP"
  new P5, ['String']
  set P5, "ok\n"
  set_args "0", P5
  invokecc P0
  null P5
  set_args "0", P5
  invokecc P0
  end
CODE
ok
got null
OUTPUT

  # Tests with callback functions
  my @todo = $ENV{TEST_PROG_ARGS} =~ /--runcore=jit/ ?
    ( todo => 'TT #1316, add scheduler tasks to JIT' ) : ();

  pasm_output_is( <<'CODE', <<'OUTPUT', "nci_cb_C1 - PASM", @todo );
.pcc_sub :main main:

  # we need a flag if the call_back is already done
  new P10, ['Integer']
  set_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const 'Sub' P6 = "_call_back"
  # prepare user data
  new P7, ['Integer']
  set P7, 42
  new_callback P5, P6, P7, "vtU" # Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_C1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "0,0", P5, P7
  invokecc P0
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  get_global P11, "cb_done"
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
  get_params "0,0", P5, S5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  get_global P12, "cb_done"
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_cb_C1 - PIR", @todo );

.sub test :main

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new ['Integer']
    cb_done = 0
    set_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new ['Integer']
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const 'Sub' cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "vtU"  # Z in pdd16
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
    callback_has_run = get_global "cb_done"
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
  get_global $P12, "cb_done"
  inc $P12
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_cb_C2 - PASM", @todo );
.pcc_sub :main main:
  # we need a flag if the call_back is already done
  new P10, ['Integer']
  set_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const 'Sub' P6 = "_call_back"
  # prepare user data
  new P7, ['Integer']
  set P7, 42
  new_callback P5, P6, P7, "viU"    # Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_C2", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "0,0", P5, P7
  invokecc P0
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  get_global P11, "cb_done"
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
  get_params "0,0", P5, I5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print I5
  print "\n"
  get_global P12, "cb_done"
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_cb_C3 - PIR", @todo );


.include "datatypes.pasm"

.sub test :main

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new ['Integer']
    cb_done = 0
    set_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new ['Integer']
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const 'Sub' cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "vpU"  # Z in pdd16
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
    callback_has_run = get_global "cb_done"
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
  get_params "0,0", $P5, $P6
  print "in callback\n"
  print "user data: "
  print $P5
  print "\n"

  # P6 is a UnManagedStruct PMC containing a pointer to an integer
  new $P2, ['ResizablePMCArray']
  push $P2, .DATATYPE_INT
  push $P2, 0
  push $P2, 0
  assign $P6, $P2

  # print referenced integer in libnci_test.so
  $I17 = $P6[0]
  print "external data: "
  print $I17
  print "\n"

  get_global $P12, "cb_done"
  inc $P12
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_cb_D1 - PASM", @todo );
.pcc_sub :main main:

  # we need a flag if the call_back is already done
  new P10, ['Integer']
  set_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const 'Sub' P6 = "_call_back"
  # prepare user data
  new P7, ['Integer']
  set P7, 42
  new_callback P5, P6, P7, "vUt"    # Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_D1", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "0,0", P5, P7
  invokecc P0
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  get_global P11, "cb_done"
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
  get_params "0,0", P5, S5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print S5
  print "\n"
  get_global P12, "cb_done"
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

    pasm_output_is( <<'CODE', <<'OUTPUT', "nci_cb_D2 - PASM", @todo );
.pcc_sub :main main:
  # we need a flag if the call_back is already done
  new P10, ['Integer']
  set_global "cb_done", P10
  # first attempt - create cb manually (this step will be hidden later)
  .const 'Sub' P6 = "_call_back"
  # prepare user data
  new P7, ['Integer']
  set P7, 42
  new_callback P5, P6, P7, "vUi"    # Z in pdd16
  print "ok 1\n"
  # now call the external sub, that takes a call_back and user_data
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_cb_D2", "vpP"
  print "ok 2\n"
  # P5 is the cb
  # P7 is user_data
  set_args "0,0", P5, P7
  invokecc P0
  # call_back will be called at any time
  # so spin a bit
  set I20, 0
loop:
  inc I20
  sleep 0.01
  get_global P11, "cb_done"
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
  get_params "0,0", P5, I5
  print "in callback\n"
  print "user data: "
  print P5
  print "\n"
  print "external data: "
  print I5
  print "\n"
  get_global P12, "cb_done"
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_cb_D2 - PIR", @todo );

.sub test :main

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new ['Integer']
    cb_done = 0
    set_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new ['Integer']
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const 'Sub' cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "vUi"  # Z in pdd16
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
    callback_has_run = get_global "cb_done"
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
  get_global $P12, "cb_done"
  inc $P12
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_cb_D3 - PIR", @todo );


.include "datatypes.pasm"

.sub test :main

    # this flag will be set by the callback function
    .local pmc cb_done
    cb_done = new ['Integer']
    cb_done = 0
    set_global "cb_done", cb_done

    # prepare user data
    .local pmc user_data
    user_data = new ['Integer']
    user_data = 42

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const 'Sub' cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "vUp"  # Z in pdd16
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
    callback_has_run = get_global "cb_done"
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
  new $P2, ['ResizablePMCArray']
  push $P2, .DATATYPE_INT
  push $P2, 0
  push $P2, 0
  assign s, $P2

  # print referenced integer in libnci_test.so
  $I17 = s[0]
  print "external data: "
  print $I17
  print "\n"

  get_global $P12, "cb_done"
  inc $P12
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

    pir_output_is( <<'CODE', <<'OUTPUT', "nci_cb_D4 - synchronous callbacks" );


.include "datatypes.pasm"

.sub test :main

    # turn off JIT or special core - no events yet
    bounds 1
    # prepare user data
    .local pmc user_data
    user_data = new ['Integer']
    user_data = 42

    # load libnci_test
    .local pmc libnci_test
    libnci_test = loadlib "libnci_test"

    # reset int_cb_D4 to 1
    .local pmc int_cb_D4
    int_cb_D4 = dlvar libnci_test, "int_cb_D4"
    .local pmc int_cb_D4_decl
    int_cb_D4_decl = new ['ResizablePMCArray']
    push int_cb_D4_decl, .DATATYPE_INT
    push int_cb_D4_decl, 0
    push int_cb_D4_decl, 0
    assign int_cb_D4, int_cb_D4_decl
    int_cb_D4[0] = 1

    # A Sub that can be given to the library
    # this callback function will eventually by called by the library
    .const 'Sub' cb = "_call_back"
    .local pmc cb_wrapped
    cb_wrapped = new_callback cb, user_data, "vUp"  # Z in pdd16
    print "created a callback sub\n"

    # now call the external sub, that takes a callback and user data
    .local pmc nci_cb_D4
    nci_cb_D4 = dlfunc libnci_test, "nci_cb_D4", "vpP"
    print "loaded a function that takes a callback\n"
    nci_cb_D4( cb_wrapped, user_data )

    # reset int_cb_D4 to 1
    int_cb_D4[0] = 1

    .local pmc synchronous
    synchronous = new ['Integer']
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
  new $P2, ['ResizablePMCArray']
  push $P2, .DATATYPE_INT
  push $P2, 0
  push $P2, 0
  assign s, $P2

  print "external data: "
  $I17 = s[0]
  print $I17
  print "\n"
  $I17 = $I17 * 10
  s[0] = $I17

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

    pasm_output_is( <<'CODE', <<'OUTPUT', 'nci_pip - array of structs' );
.pcc_sub :main main:

.include "datatypes.pasm"
  new P3, ['OrderedHash']
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
  new P6, ['UnManagedStruct'], P3

  new P4, ['OrderedHash']
  set  P4["Rect"], .DATATYPE_STRUCT
  set P1, P4[-1]
  setprop P1, "_struct", P6
  push P4, 4
  push P4, 0

  new P5, ['ManagedStruct'], P4
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
  set_args "0,0", 4, P5
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

pasm_output_is( <<'CODE', <<'OUTPUT', 'nci_vpii - nested structs' );
.pcc_sub :main main:

.include "datatypes.pasm"
  new  P8, 'OrderedHash'
  set  P8[ 'y' ],      .DATATYPE_INT
  push P8, 0
  push P8, 0
  new  P9, 'ManagedStruct', P8

  new  P6, 'OrderedHash'
  set  P6[ 'x' ],      .DATATYPE_INT
  push P6, 0
  push P6, 0
  set  P6[ 'nested' ], .DATATYPE_STRUCT_PTR

  set  P7, P6[ -1 ]
  setprop P7, '_struct', P9

  push P6, 0
  push P6, 0

  new  P5, 'ManagedStruct', P6
  set  P5[ 'nested'; 'y' ], 200
  set  P5[ 'x' ], 100

  set I0, P5[ 'x' ]
  set I1, P5[ 'nested'; 'y' ]
  print "Old X: "
  say I0
  print "Old Y: "
  say I1

  set_args "0,0,0", P5, 1, 2
  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_vpii", "vpii"
  invokecc P0

  set I0, P5[ 'x' ]
  set P6, P5[ 'nested' ]
  set I1, P6[ 'y' ]
  print "X: "
  say I0
  print "Y: "
  say I1
  # extract struct
  set P6, P5[ 'nested' ]
  set I1, P6[ 'y' ]
  say I1
  end
CODE
Old X: 100
Old Y: 200
X: 1
Y: 2
2
OUTPUT

    pasm_output_is( <<'CODE', <<'OUTPUT', 'nci_piiii - nested array in a struct' );
.pcc_sub :main main:
.include "datatypes.pasm"

  loadlib P1, "libnci_test"
  dlfunc P0, P1, "nci_piiii", "piiii"
  set_args "0,0,0,0", 100,200,400,800
  invokecc P0
  get_results "0", P5

  new  P6, 'OrderedHash'
  set  P6[ 'count' ], .DATATYPE_INT
  push P6, 0
  push P6, 0

  new  P7, 'OrderedHash'
  set  P7[ 'array' ], .DATATYPE_INT
  push P7, 0
  push P7, 0
  new P8, ['UnManagedStruct'], P7
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
  product_pointer_decl = new ['ResizablePMCArray']
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

        skip( "nci_dlvar_int hangs on HP-UX", 1 ) if $^O eq 'hpux';

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
    nci_dlvar_int_decl = new ['ResizablePMCArray']
    push nci_dlvar_int_decl, .DATATYPE_INT
    push nci_dlvar_int_decl, 0
    push nci_dlvar_int_decl, 0
    assign nci_dlvar_int, nci_dlvar_int_decl

    $I2 = nci_dlvar_int[0]
    print $I2
    print "\n"

    .local pmc nci_vv
    nci_vv = dlfunc libnci_test, "nci_vv", ""
    nci_vv()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_vv()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_vv()
    $I1 = nci_dlvar_int[0]
    print $I1
    print "\n"
    nci_vv()
    $I1 = nci_dlvar_int[0]
    print $I1
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
.pcc_sub :main main:
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

}    # SKIP

pir_output_is( << 'CODE', << 'OUTPUT', "opcode 'does'" );

.sub test :main
    .local pmc pmc1
    pmc1 = new ['ParrotLibrary']
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

pir_output_is( << 'CODE', << 'OUTPUT', "conversion d <-> P" );
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name
    .local pmc twice
    twice = dlfunc libnci_test, "nci_dd", "dd"
    .local pmc f, g
    f = new ['Integer']
    f = 21
    g = twice( f )
    print g
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(
    << 'CODE', << 'OUTPUT', 'nested structs should be independent' );
.include 'datatypes.pasm'

.sub 'test' :main
    .local string library_name
    library_name = 'libnci_test'

    .local pmc libnci_test
    libnci_test = loadlib library_name

    .local pmc types
    types = new ['OrderedHash']
    types['y'] = .DATATYPE_INT
    push types, 0
    push types, 0

    .local pmc nested
    nested = new ['ManagedStruct'], types

    .local pmc outer
    outer = make_outer_struct( nested )
    outer[ 'x' ] = 0
    outer[ 'nested'; 'y' ] = 0

    .local pmc nci_func
    nci_func = dlfunc libnci_test, 'nci_vpii', 'vpii'

    print_values( outer )
    nci_func( outer, 1, 100 )
    print_values( outer )

    .local pmc other
    other = make_outer_struct( nested )

    # autovivify the nested hash
    other[ 'nested'; 'y' ] = 1
    nci_func( other, 2, 200 )

    print_values( outer )
    print_values( other )
.end

.sub 'print_values'
    .param pmc outer

    .local int x, y
    x = outer['x']
    y = outer[ 'nested'; 'y' ]
    print "X: "
    say x
    print "Y: "
    say y
.end

.sub 'make_outer_struct'
    .param pmc nested

    .local pmc types
    types        = new ['OrderedHash']
    types[ 'x' ] = .DATATYPE_INT
    push types, 0
    push types, 0
    types[ 'nested' ] = .DATATYPE_STRUCT_PTR

    .local pmc struct_ptr
    struct_ptr = types[-1]
    setprop struct_ptr, '_struct', nested
    push types, 0
    push types, 0

    .local pmc outer
    outer = new ['ManagedStruct'], types

    .return( outer )
.end
CODE
X: 0
Y: 0
X: 1
Y: 100
X: 1
Y: 100
X: 2
Y: 200
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "arity" );
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name

    .local pmc nci_c
    nci_c = dlfunc libnci_test, "nci_c", "c"
    $I0 = nci_c.'arity'()
    say $I0

    .local pmc multiply
    multiply = dlfunc libnci_test, "nci_pii", "pii"
    $I0 = multiply.'arity'()
    say $I0

    .local pmc nci_iiii
    nci_iiii = dlfunc libnci_test, "nci_iiii", "iiii"
    $I0 = nci_iiii.'arity'()
    say $I0
.end
CODE
0
2
3
OUTPUT

pir_output_is( << 'CODE', << 'OUTPUT', "nci_vfff - v_fff parameter" );
.sub test :main
    .local string library_name
    library_name = 'libnci_test'
    .local pmc libnci_test
    libnci_test = loadlib  library_name

    .local pmc nci_vfff
    nci_vfff = dlfunc libnci_test, "nci_vfff", "vfff"

    nci_vfff(3456.54, 10.1999, 14245.567)
.end
CODE
1
1
1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
