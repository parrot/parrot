#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/dynpmc/gziphandle.t - test the GzipHandle PMC

=head1 SYNOPSIS

        % parrot t/dynpmc/gziphandle.t

=head1 DESCRIPTION

Tests the C<GzipHandle> PMC, a zlib wrapper.

=cut

.loadlib 'io_ops'

.sub 'main' :main
    .include 'test_more.pir'
    .include 'iglobals.pasm'
    .local pmc config_hash, interp

    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $S0 = config_hash['has_zlib']
    unless $S0 goto no_zlib

    plan(15)
    $P0 = loadlib 'gziphandle'
    test_handle()
    test_stream()
    test_bad()
    test_version()
    test_basic()
    .return()

  no_zlib:
    skip_all('No zlib library available')
    .return()
.end


.sub 'test_handle'
    $P0 = new 'GzipHandle'
    $S0 = typeof $P0
    is($S0, 'GzipHandle', 'GzipHandle typeof')
    $I0 = isa $P0, 'Handle'
    ok($I0, 'isa Handle')
.end

.include 'stat.pasm'

.sub 'test_stream'
    # Use this file (repeated twice) as test data
    .local string orig
    $P0 = new 'FileHandle'
    orig = $P0.'readall'('t/dynpmc/gziphandle.t')

    # Save the data size
    .local int size
    size = length orig
    size = mul size, 2
    diag(size)

    # Create the test file
    .local pmc file
    .const string filename = 't/dynpmc/gziphandle.t.gz'
    file = new 'GzipHandle'
    file.'open'(filename, 'wb')
    file.'print'(orig)
    file.'print'(orig) # write the same data again
    file.'close'()

    $I0 = stat filename, .STAT_FILESIZE
    diag($I0)
    $I0 = $I0 < size
    ok($I0, "file is smaller than original data")

    # Open the test file for reading
    file = new 'GzipHandle'
    file.'open'(filename)

    $I0 = file.'isatty'()
    is($I0, 0, 'not a tty')

    # Read the data back in
    # OS X 10.7.3 + gcc 4.2.1 + zlib 1.2.6 seems to have an issue
    # with the EOF test, so read one extra byte
    .local string result
    $I0 = size + 1
    result = file.'read'($I0)

    orig = repeat orig, 2
    is(result, orig, "data read is the same as data written")

    $I0 = file.'eof'()
    is($I0, 1, "gziphandle is at eof")

    $I0 = isfalse file
    ok($I0, "gziphandle at eof is false")

    $I0 = file.'flush'()
    is($I0, -2, "cannot flush gziphandle at eof")

    # Clean up after ourselves
    file.'close'()
    $P0 = loadlib 'os'
    $P0 = new 'OS'
    $P0.'rm'(filename)
.end

.sub 'test_bad'
throws_substring(<<"CODE", "gzopen fails", "gzopen non-existent file")
    .sub main
        $P3 = new 'GzipHandle'
        $P3.'open'('t/dynpmc/gziphandle.t.gz', 'rb')
    .end
CODE

throws_substring(<<"CODE", "input data corrupted", "gzip decompress bat data")
    .sub main
        $P3 = new 'GzipHandle'
        $P3.'uncompress'('fake fake fake')
    .end
CODE
.end

.sub 'test_version'
    $P0 = new 'GzipHandle'
    $S0 =$P0.'version'()
    diag($S0)
    $I0 = index $S0, '1.'
    is($I0, 0, 'zlib version')
.end

.sub 'test_basic'
    $P0 = new 'GzipHandle'
    .const string data = "message"
    $I0 = $P0.'crc32'(0, data)
    ok($I0, "crc32")

    $S0 = $P0.'compress'(data)
    $I0 = length $S0
    is($I0, 15, "compress")
    $S0 = $P0.'uncompress'($S0)
    is($S0, data, "uncompress")

    $S0 = repeat 'repeat', 100
    $I0 = length $S0
    $S1 = $P0.'compress'($S0)
    $I1 = length $S1
    $N0 = $I1 / $I0
    diag($N0)
    $S2 = $P0.'uncompress'($S1)
    is($S2, $S0, "uncompress with many realloc")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:


