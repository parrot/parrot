# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_base64.pir - PHP base64 Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'

.sub '__onload' :load
    load_bytecode 'MIME/Base64.pbc'
.end

=item C<string base64_decode(string str[, bool strict])>

Decodes string using MIME base64 algorithm

STILL INCOMPLETE.

=cut

.sub 'base64_decode'
    .param pmc args :slurpy
    .local string str
    .local int strict # not used, (not handled by MIME::Base64)
    strict = 0
    ($I0, str, strict) = parse_parameters('s|b', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = get_root_global ['parrot';'MIME';'Base64'], 'decode_base64'
    $S0 = $P0(str)
    .RETURN_STRING($S0)
.end


=item C<string base64_encode(string str)>

Encodes string using MIME base64 algorithm

=cut

.sub 'base64_encode'
    .param pmc args :slurpy
    .local string str
    ($I0, str) = parse_parameters('s', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = get_root_global ['parrot';'MIME';'Base64'], 'encode_base64'
    $S0 = $P0(str)
    if $S0 == '' goto L2
    .RETURN_STRING($S0)
  L2:
    .RETURN_FALSE()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
