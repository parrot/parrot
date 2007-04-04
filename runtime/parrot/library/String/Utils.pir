# Copyright (C) 2007, The Perl Foundation.
# $Id$

.namespace ['String';'Utils']

=head1 NAME

['String';'Utils'] - Utilities for string processing

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
    chopn res, sepl
    goto chomp

  return:
    .return ( res )
.end

=item convert_radix(source, radix, [,pos])

Convert characters from C<source> starting at C<pos> to 
a character string according to C<radix>.  If C<pos> is
omitted, then zero (start of string) is assumed.  The C<radix>
may either be an integer radix (up to 36) or one of
'x', 'd', 'o', or 'b' to indicate a radix of 16, 10,
8, or 2.

Returns the converted string and the number of
characters of source used in the conversion.

If the sequence starts with square brackets, then
multiple conversions may be specified separated by
commas and a closing square bracket.

    (result, len) = convert_radix('41', 'x')       # 'A'
    (result, len) = convert_radix('101', 8)        # 'A'
    (result, len) = convert_radix('[41,43]', 'x')  # 'AC'
    (result, len) = convert_radix('[65,67]', 'd')  # 'AC'

=cut

.sub 'convert_radix'
    .param string source
    .param string radix
    .param int pos             :optional
    .param int has_pos         :opt_flag

    if has_pos goto have_pos
    pos = 0
  have_pos:
    .local int startpos
    startpos = pos

    .local int base
    base = radix
    if base > 0 goto have_base
    radix = downcase radix
    base = index "  b     o d     x", radix
    if base <= 0 goto err_radix
  have_base:

    .local int decnum, isbracketed
    .local string result
    decnum = 0
    result = ''
    $S0 = substr source, pos, 1
    isbracketed = iseq $S0, '['
    pos += isbracketed
  scan_char_loop:
    $S0 = substr source, pos, 1
    $S0 = downcase $S0
    .local int digitval
    digitval = index '0123456789abcdefghijklmnopqrstuvwxyz', $S0
    if digitval < 0 goto scan_char_end
    if digitval >= base goto scan_char_end
    decnum *= base
    decnum += digitval
    inc pos
    goto scan_char_loop
  scan_char_end:
    $S1 = chr decnum
    concat result, $S1
    unless isbracketed goto scan_end
    if $S0 == ']' goto scan_end
    if $S0 != ',' goto err_bracket
    inc pos
    decnum = 0
    goto scan_char_loop
  scan_end:
    pos += isbracketed
  end:
    $I0 = pos - startpos
    .return (result, $I0)

  err_radix:
    .local string message
    message = "Invalid radix specified: "
    concat message, radix
    goto err_throw
  err_bracket:
    message = "Invalid character in bracketed conversion"
  err_throw:
    $P0 = new .Exception
    $P0['message'] = message
    throw $P0
    goto end
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
# vim: expandtab shiftwidth=4:
