#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/bytebuffer.t - ByteBuffer PMC

=head1 SYNOPSIS

    % prove t/pmc/bytebuffer.t

=head1 DESCRIPTION

Tests C<ByteBuffer> PMC..

=cut

.include 'iglobals.pasm'
.include 'iterator.pasm'

.sub 'main' :main
    .include 'test_more.pir'
    plan(24)

    test_init()
    test_set_string()
    test_set_byte()
    test_get_string()
    test_alloc()
    test_iterate()
    test_invalid()
.end

################################################################
# Helper subs

.sub hasicu
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P1['has_icu']
    .return($I0)
.end

.sub isbigendian
    $P0 = getinterp
    $P1 = $P0[.IGLOBALS_CONFIG_HASH]
    $I0 = $P1['bigendian']
    .return($I0)
.end

################################################################

.sub test_init
    .local pmc bb
    .local int n
    bb = new ['ByteBuffer']
    n = elements bb
    is(n, 0, "size of a new buffer is 0")

    bb = new ['ByteBuffer'], 42
    n = elements bb
    is(n, 42, "size of a new buffer with initial size is correct")

.end

.sub test_set_string
    .local pmc bb
    .local string s
    .local int n, c
    bb = new ['ByteBuffer']
    s = 'Hi'
    bb = s

    # Exercise mark vtable
    sweep 1

    n = elements bb
    is(n, 2, "size is the same as the source string bytelength")
    n = bb[0]
    c = ord 'H'
    is(n, c, "first byte is the same as the source string")
    n = bb[1]
    c = ord 'i'
    is(n, c, "second byte is the same as the source string")
    n = bb[2]
    is(n, 0, "byte out of size is 0")
    n = bb[-1]
    is(n, 0, "byte at negative index is 0")
.end

.sub test_set_byte
    .local pmc bb
    .local int n
    bb = new ['ByteBuffer']
    bb[255] = 42
    n = elements bb
    is(n, 256, "setting a byte resize empty buffer")

    .local string s
    s = 'Hi'
    bb = s
    bb[2] = 42
    n = elements bb
    is(n, 3, "setting a byte resize buffer initialized from string")

    bb = new ['ByteBuffer'], 42
    bb[41] = 9
    n = elements bb
    is(n, 42, "setting a byte within range does not resize")
    bb[42] = 7
    n = elements bb
    is(n, 43, "setting a byte resize buffer with initial size")
    n = bb[41]
    is(n, 9, "resized buffer preserve old value")

    push_eh catch
    bb[-1] = 0
    ok(0, "setting a byte with negative index should throw")
    goto end
catch:
    pop_eh
    ok(1, "setting a byte with negative index throws")
end:
.end

.sub test_get_string
    .local pmc bb
    .local string s
    .local int n
    .local int big

    bb = new ['ByteBuffer']
    bb = binary:"abcd"
    s = bb.'get_string'('ascii', 'fixed_8')
    n = length s
    is(n, 4, "getting ascii from buffer gives correct length")
    is(s, "abcd", "getting ascii from buffer gives correct content")

    $I0 = hasicu()
    unless $I0 goto skip_it

    bb = new ['ByteBuffer']

    # Upper case n tilde: codepoint 0xD1, utf8 encoding 0xC3, 0x91
    #bb = utf16:unicode:"\x{D1}"
    # Can't do that, or the program can't be compiled without ICU.
    # Fill the buffer with bytes instead.

    # Get endianess to set the bytes in the appropiate order.
    # *** XXX *** Need report from big endian platforms.
    big = isbigendian()
    if big goto isbig
    bb[0] = 0xD1
    bb[1] = 0x00
    goto doit
isbig:
    bb[0] = 0x00
    bb[1] = 0xD1
doit:
    s = bb.'get_string'('unicode', 'utf16')
    n = length s
    is(n, 1, "getting utf16 from buffer gives correct length")
    n = ord s
    is(n, 0xD1, "getting utf16 from buffer gives correct codepoint")
    bb = new ['ByteBuffer']
    bb[0] = 0xC3
    bb[1] = 0x91
    s = bb.'get_string_as'(utf8:unicode:"")
    n = length s
    is(n, 1, "getting utf8 from buffer gives correct length")
    n = ord s
    is(n, 0xD1, "getting utf8 from buffer gives correct codepoint")
    goto end
skip_it:
    skip(4, "this test needs ICU")
end:
.end

.sub test_alloc
    # Exercise buffer reallocation building a utf16 string with the
    # codepoints 32-8192
    .local pmc bb
    .local int i, big, pos, b0, b1, c

    $I0 = hasicu()
    unless $I0 goto skip_it

    # Get endianess to set the bytes in the appropiate order.
    # *** XXX *** Need report from big endian platforms.
    big = isbigendian()

    bb = new ['ByteBuffer']
    pos = 0
    i = 32
loopset:
    b0 = div i, 256
    b1 = mod i, 256
    if big goto setbig
    bb[pos] = b1
    inc pos
    bb[pos] = b0
    inc pos
    goto setdone
setbig:
    bb[pos] = b0
    inc pos
    bb[pos] = b1
    inc pos
setdone:
    inc i
    if i < 8192 goto loopset

    .local string s
    s = bb.'get_string'('unicode', 'utf16')

    # Check string size
    i = length s
    if i != 8160 goto failed

    # Check string content
    i = 32
    pos = 0
loopcheck:
    c = ord s, pos
    if c != i goto failed
    inc pos
    inc i
    if i < 8192 goto loopcheck
    ok(1, "reallocation")
    goto end
failed:
    say i
    ok(0, "reallocation")
    goto end
skip_it:
    skip(1, "this test needs ICU")
end:
.end

.sub test_iterate
    .local pmc bb, it, arr
    .local string s
    s = 'abcd'
    bb = new ['ByteBuffer']
    bb = s
    it = iter bb
    it = .ITERATE_FROM_START
    arr = new ['ResizableStringArray']
loop:
    unless it goto donearray
    $I0 = shift it
    $S0 = chr $I0
    push arr, $S0
    goto loop
donearray:
    .local string r
    r = join '', arr
    is(r, s, 'iterate buffer content')
.end

.sub test_invalid
    .local pmc bb, ex
    .local string s
    bb = new ['ByteBuffer']
    bb = 'something'
    push_eh catch_charset
    s = bb.'get_string'('***INVALID cHARsET%%%%', 'fixed_8')
    pop_eh
    ok(0, "get_string with invalid charset should throw")
    goto check_encoding
catch_charset:
    .get_results(ex)
    finalize ex
    pop_eh
    ok(1, "get_string with invalid charset throws")
check_encoding:
    push_eh catch_encoding
    s = bb.'get_string'('ascii', '???INVALID eNCODING===')
    pop_eh
    ok(0, "get_string with invalid encoding should throw")
    goto check_content
catch_encoding:
    .get_results(ex)
    finalize ex
    pop_eh
    ok(1, "get_string with invalid encoding throws")
check_content:
    bb[0] = 128 # Out of ascii range
    push_eh catch_content
    s = bb.'get_string'('ascii', 'fixed_8')
    pop_eh
    ok(0, "get_string with invalid content should throw")
    goto end
catch_content:
    .get_results(ex)
    finalize ex
    pop_eh
    ok(1, "get_string with invalid content throws")
end:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
