#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/mappedbytearray.t - test the MappedByteArray PMC

=head1 SYNOPSIS

    % prove t/pmc/mappedbytearray.t

=head1 DESCRIPTION

Tests the MappedByteArray PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    .const int inittests = 4
    .const int moretests = 18
    .local int alltests
    alltests = inittests + moretests
    plan(alltests)

    test_init()
    .local int supported
    supported = test_supported()

    if supported goto more
    skip(moretests, "Mapped files not supported in this platform")
    goto end

  more:
    ok(1, "Mapped files are supported")
    test_init_pmc()
    test_read()
    test_open_ex()
  end:
.end

# Basic tests, must pass even when mapped files are not supported.
.sub test_init
    .local pmc mm
    .local int r
    mm = new ['MappedByteArray']
    r = isnull mm
    not r
    ok(r, 'Created without arguments')
    r = 0
    if mm goto check
    r = 1
  check:
    ok(r, 'get_bool gives false when unopened')
    r = elements mm
    is(r, 0, 'elements is zero when unopened')

    # Make sure the destroy vtable is covered
    null mm
    sweep 1
.end

# Test the 'supported' method and return its result.
.sub test_supported
    .local pmc mm
    .local int r
    mm = new ['MappedByteArray']
    r = mm.'supported'()
    ok(1, "method 'supported' called")
    .return(r)
.end

# Test initializing a PMC with a file name
.sub test_init_pmc
    .local pmc filename
    filename = new ['String']
    filename = "t/pmc/testfile"

    .local pmc mm
    mm = new ['MappedByteArray'], filename

    $I0 = elements mm
    # The test file is one line of text, and line ending may have been
    # converted, so the lenght can be one byte different.
    $I1 = $I0 == 43
    $I2 = $I0 == 44
    $I0 = $I1 + $I2
    is( $I0, 1, "Number of elements" )

    $I1 = mm."close"()
    is( $I1, 0, 'Closed and unmapped testfile' )

    throws_substring(<<'CODE', 'cannot open file', 'mmap a nonexistent file')
    .sub main
        $P0 = new ['String']
        $P0 = "wezwuyebgjuzmhewrugnjzrg"
        $P1 = new ['MappedByteArray'], $P0
    .end
CODE

    throws_substring(<<'CODE', '*feature', 'init_pmc with an Integer PMC')
    .sub main
        $P0 = new ['Integer']
        $P0 = 3
        $P1 = new ['MappedByteArray'], $P0
    .end
CODE

    # destroying an open MappedByteArray
    mm = new ['MappedByteArray'], filename
    null mm
    sweep 1
.end

# Test reading a file
.sub test_read
    .local pmc mm
    mm = new ['MappedByteArray']
    mm."open"("t/pmc/testfile","rw")

    $S0 = mm.'get_string'(0, 14, 'ascii')
    is( $S0, "This is a test", "Reading test file with get_string successful" )

    $S0 = mm.'get_utf8'(16, 23)
    is( $S0, utf8:"Ärger, Ökonom, Übermut!", "Reading test file with get_utf8 successful" )

    $I1 = mm[0]

    mm[0] = 5
    $I2 = mm[0]

    is( $I2, 5, 'Testing get/set_integer_keyed_int' )

    mm[0] = $I1

    $I3 = mm."close"()
    is( $I3, 0, 'Closed and unmapped testfile' )

    throws_substring(<<'CODE', 'Malformed UTF-8', 'Invalid UTF-8')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile","rw")
        $S0 = $P0.'get_utf8'(17, 4)
    .end
CODE
    throws_substring(<<'CODE', 'not mapped', 'get_integer_keyed_int with unmapped MBA')
    .sub main
        $P0 = new ['MappedByteArray']
        $I0 = $P0[0]
    .end
CODE
    throws_substring(<<'CODE', 'not mapped', 'set_integer_keyed_int with unmapped MBA')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0[0] = 42
    .end
CODE

    throws_substring(<<'CODE', 'index out of mapped', 'get_integer_keyed_int out of bounds')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile")
        $I0 = $P0[-1]
    .end
CODE
    throws_substring(<<'CODE', 'index out of mapped', 'set_integer_keyed_int out of bounds')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile", "rw")
        $P0[-1] = 42
    .end
CODE

    throws_substring(<<'CODE', 'get_string: index out of mapped', 'get_string out of bounds')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile", "rw")
        $S0 = $P0."get_string"(-1, 1, "utf8")
    .end
CODE
    throws_substring(<<'CODE', 'index out of bounds', 'get_utf8 out of bounds')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile", "rw")
        $S0 = $P0."get_utf8"(-1, 2)
    .end
CODE
    throws_substring(<<'CODE', 'invalid encoding', 'get_string Invalid encoding')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("t/pmc/testfile", "rw")
        $S0 = $P0."get_string"(0, 1, "maek")
    .end
CODE
.end

# tests exceptions thrown by open()
.sub test_open_ex
    throws_substring(<<'CODE', 'invalid open mapped mode', '.open() invalid mode')
    .sub main
        $P0 = new ['MappedByteArray']
        $P0."open"("somefile", "maek")
    .end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
