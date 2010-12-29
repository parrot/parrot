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
    .const int moretests = 2
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

# Test reading a file
.sub test_read
    .local pmc mm

    mm = new ['MappedByteArray']
    mm."open"("t/pmc/testfile","r")
    $I1 = elements mm
    $S0 = mm.'get_string'(0, $I1, 'utf8')
    is($S0, "This is a test", "Reading Test file successful")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
