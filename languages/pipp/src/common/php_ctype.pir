# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_ctype.pir - PHP ctype Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.include 'languages/pipp/src/common/php_MACRO.pir'
.include 'cclass.pasm'

.macro CTYPE(class, args)
    .local pmc c
    ($I0, c) = parse_parameters('z', .args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $I0 = isa c, 'PhpInteger'
    unless $I0 goto L2
    $I0 = c
    unless $I0 <= 255 goto L3
    unless $I0 >= 0 goto L3
    $S0 = chr $I0
    $I0 = is_cclass .class, $S0, 0
    .RETURN_BOOL($I0)
  L3:
    unless $I0 >= -128 goto L4
    unless $I0 < 0 goto L4
    $I0 += 256
    $S0 = chr $I0
    $I0 = is_cclass .class, $S0, 0
    .RETURN_BOOL($I0)
  L2:
    $I0 = isa c, 'PhpString'
    unless $I0 goto L5
  L4:
    $S1 = c
    $I1 = length $S1
    $I0 = 0 # if empty string
    .local int i
    i = 0
  L6:
    unless i < $I1 goto L7
    $I0 = is_cclass .class, $S1, i
    unless $I0 goto L7
    inc i
    goto L6
  L7:
    .RETURN_BOOL($I0)
  L5:
    .RETURN_FALSE()
.endm


=item C<bool ctype_alnum(mixed c)>

Checks for alphanumeric character(s)

=cut

.sub 'ctype_alnum'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_ALPHANUMERIC, args)
.end

=item C<bool ctype_alpha(mixed c)>

Checks for alphabetic character(s)

=cut

.sub 'ctype_alpha'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_ALPHABETIC, args)
.end

=item C<bool ctype_cntrl(mixed c)>

Checks for control character(s)

=cut

.sub 'ctype_cntrl'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_CONTROL, args)
.end

=item C<bool ctype_digit(mixed c)>

Checks for numeric character(s)

=cut

.sub 'ctype_digit'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_NUMERIC, args)
.end

=item C<bool ctype_graph(mixed c)>

Checks for any printable character(s) except space

=cut

.sub 'ctype_graph'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_GRAPHICAL, args)
.end

=item C<bool ctype_lower(mixed c)>

Checks for lowercase character(s)

=cut

.sub 'ctype_lower'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_LOWERCASE, args)
.end

=item C<bool ctype_print(mixed c)>

Checks for printable character(s)

=cut

.sub 'ctype_print'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_PRINTING, args)
.end

=item C<bool ctype_punct(mixed c)>

Checks for any printable character which is not whitespace or an alphanumeric character

=cut

.sub 'ctype_punct'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_PUNCTUATION, args)
.end

=item C<bool ctype_space(mixed c)>

Checks for whitespace character(s)

=cut

.sub 'ctype_space'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_WHITESPACE, args)
.end

=item C<bool ctype_upper(mixed c)>

Checks for uppercase character(s)

=cut

.sub 'ctype_upper'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_UPPERCASE, args)
.end

=item C<bool ctype_xdigit(mixed c)>

Checks for character(s) representing a hexadecimal digit

=cut

.sub 'ctype_xdigit'
    .param pmc args :slurpy
    .CTYPE(.CCLASS_HEXADECIMAL, args)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
