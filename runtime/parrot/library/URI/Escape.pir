# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

URI/Escape - percent-encoding conversions

=head1 DESCRIPTION

Based on CPAN URL::Escape module.

Sub names in the CPAN module are not used, reserved for eventual
implementation more compatible.

http://en.wikipedia.org/wiki/Percent_encoding

=cut

.namespace [ 'URI' ; 'Escape' ]

.const string URIcomponentunchange = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~"
.const string URIunchange          = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~!*\'();:@&=+$,/?#[]"

.const string hexdigits     = '0123456789ABCDEF'

=head1 Subs

=over 4

=item percent_encode_except

$S0 = 'percent_encode_except'(source, except)

Return the percent encoding of the source string preserving the characters
present in the except string.

=cut

.sub percent_encode_except
    .param string s
    .param string except

    .local int asciicharset, utf8enc, scharset, senc
    asciicharset = find_charset 'ascii'
    scharset = charset s
    if scharset == asciicharset goto encodeit

    utf8enc = find_encoding 'utf8'
    senc = encoding s
    if utf8enc == senc goto encodeit
    s = trans_encoding s, utf8enc

  encodeit:
    .local pmc buf, result, it
    .local string c
    .local int code
    buf = root_new ['parrot';'ByteBuffer']
    buf = s
    result = root_new ['parrot';'ByteBuffer']
    it = iter buf
  nextbuf:
    unless it goto endbuf
    code = shift it
    c = chr code
    $I0 = index except, c
    if $I0 == -1 goto isreserved
    push result, code
    goto nextbuf
  isreserved:
    push result, 0x25
    $I0 = code / 16
    c = substr hexdigits, $I0, 1
    $I0 = ord c
    push result, $I0
    $I0 = code % 16
    c = substr hexdigits, $I0, 1
    $I0 = ord c
    push result, $I0
    goto nextbuf
  endbuf:
    s = result.'get_string_as'(ascii:"")
  done:
    .return(s)
.end

=item percent_encode

$S0 = 'percent_encode'(source)

Return the percent encoding of the source string preserving the URI unreserved
characters. Intended for usage with full URIs.

=cut

.sub percent_encode
    .param string s
    .tailcall 'percent_encode_except'(s, URIunchange)
.end

=item percent_encode_component

$S0 = 'percent_encode_component'(source)

Return the percent encoding of the source string prserving the URI unreserved
and URI reserved characters. Intended for usage with URIs components, such as
form data in HTTP GET requests.

=cut

.sub percent_encode_component
    .param string s
    .tailcall 'percent_encode_except'(s, URIcomponentunchange)
.end

=item main

A main function for testing purposes.

Prints the percent_encode and percent_encode_component of the command line
args provided.

=cut

.sub main :anon :main
    .param pmc args :optional
    .local pmc it
    .local string arg, encoded
    it = iter args
    unless it goto end
    arg = shift it
  next:
    unless it goto end
    arg = shift it
    encoded = 'percent_encode'(arg)
    print "'"
    print arg
    print "' -> '"
    print encoded
    print "' , '"
    encoded = 'percent_encode_component'(arg)
    print encoded
    print "'\n"
    goto next
  end:
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
