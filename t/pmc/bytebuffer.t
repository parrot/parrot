#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/pmc/bytebuffer.t - ByteBuffer PMC

=head1 SYNOPSIS

    % prove t/pmc/bytebuffer.t

=head1 DESCRIPTION

Tests C<ByteBuffer> PMC..

=cut

.include 'iglobals.pasm'
.include 'iterator.pasm'
.include 'except_types.pasm'

.sub 'main' :main
    .include 'test_more.pir'
    plan(46)

    test_init()
    test_set_string()
    test_set_byte()
    test_get_string()
    test_push()
    test_resize()
    test_alloc()
    test_iterate()
    test_invalid()
    test_get_chars()
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

    push_eh handler
    bb = new ['ByteBuffer'], -1
handler:
    pop_eh
    ok(1,"Creating a negative-sized ByteBuffer throws an exception")
    goto done

  done:
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
    s = bb.'get_string'('ascii')
    n = length s
    is(s, 0, "getting from unitialized buffer gives empty string")

    bb = binary:"abcd"
    s = bb.'get_string'('ascii')
    n = length s
    is(n, 4, "getting ascii from buffer gives correct length")
    is(s, "abcd", "getting ascii from buffer gives correct content")

    bb = new ['ByteBuffer']

    # Upper case n tilde: codepoint 0xD1, utf8 encoding 0xC3, 0x91
    bb = utf16:"\x{D1}"
    s = bb.'get_string'('utf16')
    n = length s
    is(n, 1, "getting utf16 from buffer gives correct length")
    n = ord s
    is(n, 0xD1, "getting utf16 from buffer gives correct codepoint")
    bb = new ['ByteBuffer']
    bb[0] = 0xC3
    bb[1] = 0x91
    s = bb.'get_string_as'(utf8:"")
    n = length s
    is(n, 1, "getting utf8 from buffer gives correct length")
    n = ord s
    is(n, 0xD1, "getting utf8 from buffer gives correct codepoint")
.end

.sub test_push
    .local pmc bb
    .local int c, n, m
    bb = new ['ByteBuffer']
    bb = 'hell'
    n = elements bb
    inc n
    c = ord 'o'
    push bb, c
    m = elements bb
    is(n, m, "push increments size")
    .local string s
    s = bb.'get_string_as'(ascii:"")
    is(s, 'hello', "push gives expected string result")
.end

.sub test_resize
    .local pmc bb
    .local int n
    .local string s
    bb = new ['ByteBuffer']

    bb = 723
    n = elements bb
    is(n, 723, 'resize from empty')

    bb = 42
    n = elements bb
    is(n, 42, 'reduce size')

    bb = 999
    n = elements bb
    is(n, 999, 'increase size')

    bb = 0
    n = elements bb
    is(n, 0, 'resize to 0')

    bb = 'foobar'
    bb = 3
    n = elements bb
    is(n, 3, 'reduce size from string content')

    s = bb.'get_string_as'(ascii:"")
    is(s, 'foo', 'resized string content has correct value')

    bb = 'foobar'
    bb = 7
    n = elements bb
    is(n, 7, 'increase size from string content')

    # This test is for code coverage, zero filling is not a feature
    # you should expect, it can be changed for performance reasons.
    s = bb.'get_string_as'(binary:"")
    is(s, binary:"foobar\x{0}", 'resized from string content is zero filled')

    bb = 'barfoo'
    bb = 0
    n = elements bb
    is(n, 0, 'resize to zero from string content')

    bb = 42
    bb = 0
    n = elements bb
    is(n, 0, 'resize to zero from allocated content')

    .local pmc eh
    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_label eh, catch_negative
    n = 1
    push_eh eh
    bb = -1
    n = 0
    goto test_negative
catch_negative:
    finalize eh
test_negative:
    pop_eh
    ok(n, 'negative size throws')
.end

.sub test_alloc
    # Exercise buffer reallocation building a utf16 string with the
    # codepoints 32-8192
    .local pmc bb
    .local int i, big, pos, b0, b1, c

    # Get endianess to set the bytes in the appropriate order.
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
    s = bb.'get_string'('utf16')

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
    .local pmc bb, eh, ex
    .local string s
    eh = new ['ExceptionHandler'], .EXCEPTION_INVALID_ENCODING
    set_label eh, catch_encoding
    push_eh eh
    bb = new ['ByteBuffer']
    bb = 'something'
    s = bb.'get_string'('???INVALID eNCODING===')
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
    eh = new ['ExceptionHandler'], .EXCEPTION_INVALID_STRING_REPRESENTATION
    set_label eh, catch_content
    push_eh eh
    s = bb.'get_string'('ascii')
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

.sub get_chars_outofbounds
    .local pmc bb
    .local string s
    bb = new ['ByteBuffer']
    bb = 'a'
    s = bb.'get_chars'(2, 1, 'ascii')
.end

.sub test_get_chars
    .local pmc bb
    .local string s
    bb = new ['ByteBuffer']

    bb = 'plain ascii string'
    s = bb.'get_chars'(6, 5, 'ascii')
    is( s, 'ascii', 'get_chars ascii' )

    bb = iso-8859-1:"D\x{E9}p\x{EA}che"
    s = bb.'get_chars'(1, 3, 'iso-8859-1')
    is( s, utf8:"épê", 'get_chars iso-8859-1' )

    bb = binary:"D\x{E9}p\x{EA}che"
    s = bb.'get_chars'(3, 3, 'binary')
    is( s, utf8:"êch", 'get_chars binary' )

    bb = ucs2:"Grüße"
    s = bb.'get_chars'(0, 3, 'ucs2')
    is( s, utf8:"Grü", 'get_chars ucs2' )
    s = bb.'get_chars'(4, 3, 'ucs2')
    is( s, utf8:"üße", 'get_chars ucs2' )

    bb = ucs4:"Grüße"
    s = bb.'get_chars'(0, 3, 'ucs4')
    is( s, utf16:"Grü", 'get_chars ucs4' )
    s = bb.'get_chars'(8, 3, 'ucs4')
    is( s, utf16:"üße", 'get_chars ucs4' )

    .const 'Sub' get_chars_oob = 'get_chars_outofbounds'
    throws_type(get_chars_oob, .EXCEPTION_OUT_OF_BOUNDS, 'get_chars out of bounds')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
