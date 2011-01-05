# Copyright (C) 2007-2008, Parrot Foundation.

.namespace ['String';'Utils']

=head1 NAME

String;Utils - Utilities for string processing

=head1 SYNOPSIS

    load_bytecode 'String/Utils.pbc'

    .local pmc chomp
               chomp = get_global ['String';'Utils'], 'chomp'

    $S0 = chomp($S0)      # use default record separator ("\n")
    $S0 = chomp($S0, $S1) # use custom record separator

=head1 Functions

=over

=item chomp

    $S0 = chomp( $S1 )
    $S0 = chomp( $S1, $S2 )

Remove all trailing record separator C<$S2> from tail of input string C<$S1>
and return in C<$S0>. If C<$S2> is not specified, the default C<\n> is used.

=cut

.sub 'chomp'
    .param string str     # read-only
    .param string sep     :optional
    .param int    has_sep :opt_flag

    .local string res
                  res = str

    if has_sep goto chomp
    sep = "\n"

    .local int strl
    .local int sepl

  chomp:
    strl = length res
    sepl = length sep

    if sep > res goto return
    $I0 = strl - sepl
    $I1 = index res, sep, $I0
    unless $I1 == $I0 goto return
    res = chopn res, sepl
    goto chomp

  return:
    .return ( res )
.end


=item convert_string_to_int(source [, radix [, pos]])

Convert characters from C<source> starting at C<pos> to
an integer according to C<radix>.  If C<pos> is specified,
start converting at C<pos>, otherwise start from the
beginning of the string.  C<radix> may be either an
integer radix (up to 36) or one of 'x', 'd', 'o', or 'b'
to indicate a radix of 16, 10, 8, or 2.

Returns the integer value of the converted string, and
the number of characters used in the conversion.  Conversion
stops at the first character that isn't in the valid range
according to C<radix>.

    (result, len) = convert_string_to_int('101')           # (101, 3)
    (result, len) = convert_string_to_int('101', 2)        # (5, 3)
    (result, len) = convert_string_to_int('101', 8)        # (65, 3)
    (result, len) = convert_string_to_int('ff', 'x')       # (255, 2)

=cut

.sub 'convert_string_to_int'
    .param string source
    .param string radix        :optional
    .param int has_radix       :opt_flag
    .param int pos             :optional
    .param int has_pos         :opt_flag

    .local int base
               base = 10

    if has_pos goto have_pos
    pos = 0
  have_pos:

    unless has_radix goto have_base
    base = radix
    if base > 0 goto have_base
    base = index '  bB    oOdD    xX', radix
    if base < 2 goto err_radix
    base &= 0xfe
  have_base:

    .local int result, startpos
    result = 0
    startpos = pos

  scan_char_loop:
    ##  Figure out the digit's value (case-insensitive).  Using C<downcase>
    ##  for case-insensitive lookup won't work on systems w/o ICU, so
    ##  an index and shift is a quick way to solve this.
    $S0 = substr source, pos, 1
    .local int digitval
    digitval = index '0 1 2 3 4 5 6 7 8 9 aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ', $S0
    if digitval < 0 goto scan_char_end
    digitval >>= 1
    if digitval >= base goto scan_char_end
    result *= base
    result += digitval
    inc pos
    goto scan_char_loop
  scan_char_end:
    $I0 = pos - startpos
    .return (result, $I0)

  err_radix:
    $S0 = "Invalid radix: "
    $S0 = concat $S0, radix
    $P0 = new 'Exception'
    $P0 = $S0
    throw $P0
    .return (0, 0)
.end


=item C<convert_digits_to_string(source [, radix [, pos])>

Converts a decimal, hexadecimal, octal, or binary digit sequence
given in C<source> (offset by C<pos>) and according to C<radix>
into its corresponding codepoint(s).  Returns the converted
codepoints and the number of source characters used in the
conversion.

=cut

.sub 'convert_digits_to_string'
    .param string source
    .param string radix        :optional
    .param int has_radix       :opt_flag
    .param int pos             :optional
    .param int has_pos         :opt_flag

    if has_pos goto have_pos
    pos = 0
  have_pos:
    if has_radix goto have_radix
    radix = '10'
  have_radix:

    .local int startpos, isbracketed
    startpos = pos
    $S0 = substr source, pos, 1
    if $S0 == '[' goto bracketed
    ($I0, $I1) = 'convert_string_to_int'(source, radix, pos)
    $S1 = chr $I0
    .return ($S1, $I1)
  bracketed:
    $S1 = ''
  bracketed_loop:
    inc pos
    ($I0, $I1) = 'convert_string_to_int'(source, radix, pos)
    if $I1 == 0 goto bracketed_end
    $S0 = chr $I0
    $S1 = concat $S1, $S0
    pos += $I1
  bracketed_end:
    $S0 = substr source, pos, 1
    if $S0 == ',' goto bracketed_loop
    if $S0 != ']' goto err_bracketed
    inc pos
    $I1 = pos - startpos
    .return ($S1, $I1)

  err_bracketed:
    $S0 = "Missing close ']' at offset "
    $S1 = pos
    $S0 .= $S1
    $S0 .= ", found '"
    $S1 = substr source, pos, 1
    $S0 .= $S1
    $S0 .= "'"
    $P0 = new 'Exception'
    $P0 = $S0
    throw $P0
    .return ('', 0)
.end

=back

=head1 AUTHORS

 Jerry Gay a.k.a. particle
 Patrick Michaud <pmichaud@pobox.com>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
