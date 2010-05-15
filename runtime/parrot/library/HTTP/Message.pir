# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

LWP - The World-Wide Web library for Parrot

=head2 DESCRIPTION

Simplified port of LWP (version 5.834)
see http://search.cpan.org/~gaas/libwww-perl/

=head3 HTTP;Date

=over 4

=item time2str

=cut

.namespace ['HTTP';'Date']

.include 'tm.pasm'

.sub 'time2str'
    .param int time
    $P0 = decodetime time
    $P1 = new 'FixedPMCArray'
    set $P1, 7
    $I0 = $P0[.TM_WDAY]
    $P2 = split ' ', 'Sun Mon Tue Wed Thu Fri Sat'
    $S0 = $P2[$I0]
    $P1[0] = $S0
    $I0 = $P0[.TM_MDAY]
    $P1[1] = $I0
    $I0 = $P0[.TM_MON]
    $P3 = split ' ', 'Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec'
    dec $I0
    $S0 = $P3[$I0]
    $P1[2] = $S0
    $I0 = $P0[.TM_YEAR]
    $P1[3] = $I0
    $I0 = $P0[.TM_HOUR]
    $P1[4] = $I0
    $I0 = $P0[.TM_MIN]
    $P1[5] = $I0
    $I0 = $P0[.TM_SEC]
    $P1[6] = $I0
    $S0 = sprintf "%s, %02d %s %04d %02d:%02d:%02d GMT", $P1
    .return ($S0)
.end

=back

=head3 Class HTTP;Headers

=cut

.namespace ['HTTP';'Headers']

.sub '' :init :load :anon
    $P0 = subclass 'Hash', ['HTTP';'Headers']
.end

=head3 Class HTTP;Message

=over 4

=cut

.namespace ['HTTP';'Message']

.sub '' :init :load :anon
    $P0 = newclass ['HTTP';'Message']
    $P0.'add_attribute'('headers')
    $P0.'add_attribute'('content')
.end

.sub 'init' :vtable :method
    $P0 = new ['HTTP';'Headers']
    setattribute self, 'headers', $P0
    $P0 = box ''
    setattribute self, 'content', $P0
.end

=item headers

=cut

.sub 'headers' :method
    $P0 = getattribute self, 'headers'
    .return ($P0)
.end

=item push_header

=cut

.sub 'push_header' :method
    .param string key
    .param string value
    $P0 = getattribute self, 'headers'
    $P0[key] = value
.end

=item get_header

=cut

.sub 'get_header' :method
    .param string key
    $P0 = getattribute self, 'headers'
    $S0 = $P0[key]
    .return ($S0)
.end

=item content

=cut

.sub 'content' :method
    $P0 = getattribute self, 'content'
    .return ($P0)
.end

=back

=head3 Class HTTP;Request

=over 4

=cut

.namespace ['HTTP';'Request']

.sub '' :init :load :anon
    load_bytecode 'URI.pir'
    $P0 = subclass ['HTTP';'Message'], ['HTTP';'Request']
    $P0.'add_attribute'('method')
    $P0.'add_attribute'('uri')
.end

=item method

=cut

.sub 'method' :method
    $P0 = getattribute self, 'method'
    .return ($P0)
.end

=item uri

=cut

.sub 'uri' :method
    $P0 = getattribute self, 'uri'
    .return ($P0)
.end

=item GET

=cut

.sub 'GET'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .tailcall _simple_req('GET', args :flat, kv :flat :named)
.end

=item HEAD

=cut

.sub 'HEAD'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .tailcall _simple_req('HEAD', args :flat, kv :flat :named)
.end

=item PUT

=cut

.sub 'PUT'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .tailcall _simple_req('PUT', args :flat, kv :flat :named)
.end

=item DELETE

=cut

.sub 'DELETE'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .tailcall _simple_req('DELETE', args :flat, kv :flat :named)
.end

=item POST

=cut

.sub 'POST'
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .tailcall _simple_req('POST', args :flat, kv :flat :named)
.end

.sub '_simple_req'
    .param string method
    .param string url
    .param pmc contents :slurpy
    .param pmc headers :slurpy :named
    .local pmc req
    req = new ['HTTP';'Request']
    $P0 = box method
    setattribute req, 'method', $P0
    $P0 = get_hll_global ['URI'], 'new_from_string'
    $P1 = $P0(url)
    setattribute req, 'uri', $P1
    $P0 = iter headers
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S1 = headers[$S0]
    req.'push_headers'($S0, $S1)
    goto L1
  L2:
    $P0 = iter contents
    unless $P0 goto L3
    .local pmc content
    content = getattribute req, 'content'
  L4:
    unless $P0 goto L5
    $S0 = shift $P0
    content .= $S0
    goto L4
  L5:
    $S0 = req.'get_header'('Content-Length')
    unless $S0 == '' goto L3
    $S0 = content
    $I0 = length $S0
    req.'push_header'('Content-Length', $I0)
  L3:
    .return (req)
.end

=back

=head3 Class HTTP;Response

=over 4

=cut

.namespace ['HTTP';'Response']

.sub '' :init :load :anon
    $P0 = subclass ['HTTP';'Message'], ['HTTP';'Response']
    $P0.'add_attribute'('code')
    $P0.'add_attribute'('message')
    $P0.'add_attribute'('request')
.end

=item code

=cut

.sub 'code' :method
    $P0 = getattribute self, 'code'
    .return ($P0)
.end

=item message

=cut

.sub 'message' :method
    $P0 = getattribute self, 'message'
    .return ($P0)
.end

=item request

=cut

.sub 'request' :method
    $P0 = getattribute self, 'request'
    .return ($P0)
.end

=item status_line

=cut

.sub 'status_line' :method
    $P0 = getattribute self, 'code'
    $S0 = $P0
    $P0 = getattribute self, 'message'
    if null $P0 goto L1
    $S1 = $P0
    $S0 .= ' '
    $S0 .= $S1
  L1:
    .return ($S0)
.end

=item is_info

=cut

.sub 'is_info' :method
    $P0 = getattribute self, 'code'
    .local int code
    code = $P0
    $I0 = 0
    unless code >= 100 goto L1
    unless code < 200 goto L1
    $I0 = 1
  L1:
    .return ($I0)
.end

=item is_success

=cut

.sub 'is_success' :method
    $P0 = getattribute self, 'code'
    .local int code
    code = $P0
    $I0 = 0
    unless code >= 200 goto L1
    unless code < 300 goto L1
    $I0 = 1
  L1:
    .return ($I0)
.end

=item is_redirect

=cut

.sub 'is_redirect' :method
    $P0 = getattribute self, 'code'
    .local int code
    code = $P0
    $I0 = 0
    unless code >= 300 goto L1
    unless code < 400 goto L1
    $I0 = 1
  L1:
    .return ($I0)
.end

=item is_error

=cut

.sub 'is_error' :method
    $P0 = getattribute self, 'code'
    .local int code
    code = $P0
    $I0 = 0
    unless code >= 400 goto L1
    unless code < 600 goto L1
    $I0 = 1
  L1:
    .return ($I0)
.end

=back

=head1 AUTHOR

Franc§ois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
