# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_md5.pir - PHP md5 Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'

.sub '__onload' :anon :load
    $P0 = loadlib 'digest_group'
.end

.sub 'make_digest' :anon
    .param string digest
    .const string hexits = '0123456789abcdef'
    $P0 = split '', digest
    $S0 = ''
  L1:
    unless $P0 goto L2
    $S1 = shift $P0
    $I1 = ord $S1
    $I2 = $I1 >> 4
    $S1 = substr hexits, $I2, 1
    $S0 .= $S1
    $I2 = $I1 & 0x0f
    $S1 = substr hexits, $I2, 1
    $S0 .= $S1
    goto L1
  L2:
    .return ($S0)
.end


=item C<string md5(string str, [ bool raw_output])>

Calculate the md5 hash of a string

=cut

.sub 'md5'
    .param pmc args :slurpy
    .local string str
    .local int raw_output
    raw_output = 0
    ($I0, str, raw_output) = parse_parameters('s|b', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc md
    new md, 'MD5'
    md.'Init'()
    md.'Update'(str)
    $S0 = md.'Final'()
    if raw_output goto L2
    $S0 = make_digest($S0)
  L2:
    .RETURN_STRING($S0)
.end

=item C<string md5_file(string filename [, bool raw_output])>

Calculate the md5 hash of given filename

STILL INCOMPLETE (see open_stream).

=cut

.sub 'md5_file'
    .param pmc args :slurpy
    .local string filename
    .local int raw_output
    raw_output = 0
    ($I0, filename, raw_output) = parse_parameters('s|b', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc f, md, res
    $I0 = REPORT_ERRORS | ENFORCE_SAFE_MODE
    f = stream_open(filename, 'r', $I0)
    unless f goto L2
    new md, 'MD5'
    md.'Init'()
  L3:
    $S0 = read f, 1024
    $I0 = length $S0
    unless $I0 goto L4
    md.'Update'($S0)
    goto L3
  L4:
    close f
    $S0 = md.'Final'()
    if raw_output goto L5
    $S0 = make_digest($S0)
  L5:
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
