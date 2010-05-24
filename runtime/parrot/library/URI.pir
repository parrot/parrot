# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

URI- Uniform Resource Identifiers

=head2 DESCRIPTION

Simplified port of URI (version 1.54)
see L<http://search.cpan.org/~gaas/URI/>

=head3 Class URI

=over 4

=cut

.include 'cclass.pasm'

.namespace ['URI']

.sub '' :init :load :anon
    $P0 = subclass 'String', 'URI'
.end

=item new_from_string

=cut

.sub 'new_from_string'
    .param string str
    .local string scheme
    $I0 = index str, ':'
    scheme = substr str, 0, $I0
    $P1 = new 'Key'
    set $P1, 'URI'
    $P2 = new 'Key'
    set $P2, scheme
    push $P1, $P2
    $P0 = get_class $P1
    unless null $P0 goto L1
    $P0 = get_class ['URI';'_generic']
  L1:
    $P0 = new $P0
    set $P0, str
    .return ($P0)
.end

=item scheme

=cut

.sub 'scheme' :method
    $S0 = self
    $S1 = ''
    $I0 = index $S0, ':'
    if $I0 < 0 goto L1
    $S1 = substr $S0, 0, $I0
  L1:
    .return ($S1)
.end

=item opaque

=cut

.sub 'opaque' :method
    $S0 = self
    $I2 = 0
    $I0 = index $S0, ':'
    if $I0 < 0 goto L1
    $I2 = $I0 + 1
  L1:
    $I1 = length $S0
    $I3 = $I1 - $I2
    $I0 = index $S0, '#', $I2
    if $I0 < 0 goto L2
    $I3 = $I0 - $I2
  L2:
    $S1 = substr $S0, $I2, $I3
    .return ($S1)
.end

=item fragment

=cut

.sub 'fragment' :method
    $S0 = self
    $I0 = index $S0, '#'
    $S1 = ''
    if $I0 < 0 goto L1
    inc $I0
    $S1 = substr $S0, $I0
  L1:
    .return ($S1)
.end

=back

=head3 Class URI,_generic

=over 4

=cut

.namespace ['URI';'_generic']

.sub '' :init :load :anon
    $P0 = subclass ['URI'], ['URI';'_generic']
.end

=item authority

=cut

.sub 'authority' :method
    $S0 = self
    $S1 = ''
    $I1 = 0
    $I0 = index $S0, ':'
    if $I0 < 0 goto L1
    $I1 = $I0 + 1
  L1:
    $I0 = index $S0, '//', $I1
    unless $I0 == $I1 goto L2
    $I1 += 2
    $I2 = length $S0
    $I0 = index $S0, '/', $I1
    if $I0 < 0 goto L3
    $I2 = $I0
  L3:
    $I0 = index $S0, '?', $I1
    if $I0 < 0 goto L4
    unless $I0 < $I2 goto L4
    $I2 = $I0
  L4:
    $I0 = index $S0, '#', $I1
    if $I0 < 0 goto L5
    unless $I0 < $I2 goto L5
    $I2 = $I0
  L5:
    $I3 = $I2 - $I1
    $S1 = substr $S0, $I1, $I3
  L2:
    .return ($S1)
.end

=item path

=cut

.sub 'path' :method
    $S0 = self
    $S1 = ''
    $I1 = 0
    $I0 = index $S0, ':'
    if $I0 < 0 goto L1
    $I1 = $I0 + 1
  L1:
    $I0 = index $S0, '//', $I1
    unless $I0 == $I1 goto L2
    $I1 += 2
    $I2 = length $S0
    $I0 = index $S0, '/', $I1
    if $I0 < 0 goto L3
    $I2 = $I0
  L3:
    $I0 = index $S0, '?', $I1
    if $I0 < 0 goto L4
    unless $I0 < $I2 goto L4
    $I2 = $I0
  L4:
    $I0 = index $S0, '#', $I1
    if $I0 < 0 goto L5
    unless $I0 < $I2 goto L5
    $I2 = $I0
  L5:
    $I1 = $I2
  L2:
    $I2 = length $S0
    $I0 = index $S0, '?', $I1
    if $I0 < 0 goto L6
    $I2 = $I0
  L6:
    $I0 = index $S0, '#', $I1
    if $I0 < 0 goto L7
    unless $I0 < $I2 goto L7
    $I2 = $I0
  L7:
    $I3 = $I2 - $I1
    $S1 = substr $S0, $I1, $I3
    .return ($S1)
.end

=item path_query

=cut

.sub 'path_query' :method
    $S0 = self
    $S1 = ''
    $I1 = 0
    $I0 = index $S0, ':'
    if $I0 < 0 goto L1
    $I1 = $I0 + 1
  L1:
    $I0 = index $S0, '//', $I1
    unless $I0 == $I1 goto L2
    $I1 += 2
    $I2 = length $S0
    $I0 = index $S0, '/', $I1
    if $I0 < 0 goto L3
    $I2 = $I0
  L3:
    $I0 = index $S0, '?', $I1
    if $I0 < 0 goto L4
    unless $I0 < $I2 goto L4
    $I2 = $I0
  L4:
    $I0 = index $S0, '#', $I1
    if $I0 < 0 goto L5
    unless $I0 < $I2 goto L5
    $I2 = $I0
  L5:
    $I1 = $I2
  L2:
    $I2 = length $S0
    $I0 = index $S0, '#', $I1
    if $I0 < 0 goto L6
    $I2 = $I0
  L6:
    $I3 = $I2 - $I1
    $S1 = substr $S0, $I1, $I3
    .return ($S1)
.end

=back

=head3 Class URI,file

=over 4

=cut

.namespace ['URI';'file']

.sub '' :init :load :anon
    $P0 = subclass ['URI';'_generic'], ['URI';'file']
.end

=item path

=cut

.sub 'path' :method
    .tailcall self.'path_query'()
.end

=item host

=cut

.sub 'host' :method
    .tailcall self.'authority'()
.end

=back

=head3 Class URI,_server

=over 4

=cut

.namespace ['URI';'_server']

.sub '' :init :load :anon
    $P0 = subclass ['URI';'_generic'], ['URI';'_server']
.end

=item userinfo

=cut

.sub 'userinfo' :method
    $S0 = self.'authority'()
    $I0 = index $S0, '@'
    if $I0 < 0 goto L1
    $S0 = substr $S0, 0, $I0
    .return ($S0)
  L1:
    .return ('')
.end

=item host

=cut

.sub 'host' :method
    $S0 = self.'authority'()
    $I0 = index $S0, '@'
    if $I0 < 0 goto L1
    inc $I0
    $S0 = substr $S0, $I0
  L1:
    .local int pos, lastpos
    lastpos = length $S0
    pos = 0
  L2:
    pos = index $S0, ':', pos
    if pos < 0 goto L3
    $I1 = pos
    inc pos
    $I0 = is_cclass .CCLASS_NUMERIC, $S0, pos
    unless $I0 goto L2
    $I0 = find_not_cclass .CCLASS_NUMERIC, $S0, pos, lastpos
    unless $I0 == lastpos goto L2
    $S0 = substr $S0, 0, $I1
  L3:
    .return ($S0)
.end

=item port

=cut

.sub 'port' :method
    $S0 = self.'authority'()
    .local int pos, lastpos
    lastpos = length $S0
    pos = 0
  L1:
    pos = index $S0, ':', pos
    if pos < 0 goto L2
    inc pos
    $I0 = is_cclass .CCLASS_NUMERIC, $S0, pos
    unless $I0 goto L1
    $I0 = find_not_cclass .CCLASS_NUMERIC, $S0, pos, lastpos
    unless $I0 == lastpos goto L1
    $S1 = substr $S0, pos
    .return ($S1)
  L2:
    .tailcall self.'default_port'()
.end

.sub 'default_port' :method
    .return ('')
.end

=back

=head3 Class URI;http

=cut

.namespace ['URI';'http']

.sub '' :init :load :anon
    $P0 = subclass ['URI';'_server'], ['URI';'http']
.end

.sub 'default_port' :method
    .return ('80')
.end

=head3 Class URI;https

=cut

.namespace ['URI';'https']

.sub '' :init :load :anon
    $P0 = subclass ['URI';'http'], ['URI';'https']
.end

.sub 'default_port' :method
    .return ('443')
.end

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
