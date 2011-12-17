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
    $P0 = new 'FileHandle'
    $S0 = $P0.'readall'('t/dynpmc/gziphandle.t')
    $I0 = length $S0
    mul $I0, 2
    diag($I0)
    .const string filename = 't/dynpmc/gziphandle.t.gz'
    $P1 = new 'GzipHandle'
    $P1.'open'(filename, 'wb')
    $P1.'print'($S0)
    $P1.'print'($S0)
    $P1.'close'()
    $I1 = stat filename, .STAT_FILESIZE
    diag($I1)
    $I2 = $I1 < $I0
    ok($I2, "compressed")
    $P2 = new 'GzipHandle'
    $P2.'open'(filename)
    $I2 = $P2.'isatty'()
    is($I2, 0, 'isatty')
    $S1 = $P2.'read'($I0)

    $I1 = $P2.'eof'()
    is($I1, 1, "is at eof")

    $I1 = isfalse $P2
    ok($I1, "gziphandle at eof is false")

    $I1 = $P2.'flush'()
    is($I1, -2, "cannot flush gziphandle at eof")

    $P2.'close'()
    $S0 = repeat $S0, 2
    is($S1, $S0, "gzip stream")
    $P0 = loadlib 'os'
    $P0 = new 'OS'
    $P0.'rm'(filename)

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


