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
    .const int moretests = 9
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
    is( $I0, 43, "Number of elements" )

    $I1 = mm."close"()
    is( $I1, 0, 'Closed and unmapped testfile' )
.end

# Test reading a file
.sub test_read
    .local pmc mm
    mm = new ['MappedByteArray']
    mm."open"("t/pmc/testfile","rw")

    $I0 = elements mm

    $S0 = mm.'get_string'(0, 14, 'ascii')
    is( $S0, "This is a test", "Reading test file with get_string successful" )

    $S0 = mm.'get_utf8'(16, 23)
    is( $S0, utf8:"Ärger, Ökonom, Übermut!", "Reading test file with get_utf8 successful" )

    .local string message
    push_eh catch
    $S0 = mm.'get_utf8'(17, 4)
    goto report
  catch:
    .local pmc exception
    .get_results(exception)
    message = exception
  report:
    $I0 = index message, 'Malformed UTF-8'
    $I1 = $I0 != -1
    ok( $I1, 'Invalid UTF-8' )
    pop_eh

    push_eh catch2
    $S0 = mm.'get_utf8'(0, 200)
    goto report2
  catch2:
    .local pmc exception
    .get_results(exception)
    message = exception
  report2:
    $I0 = index message, 'out of bounds'
    $I1 = $I0 != -1
    ok( $I1, 'Out of bounds access' )
    pop_eh

    $I1 = mm[0]

    mm[0] = 5
    $I2 = mm[0]

    is( $I2, 5, 'Testing get/set_integer_keyed_int' )

    mm[0] = $I1

    $I3 = mm."close"()
    is( $I3, 0, 'Closed and unmapped testfile' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
