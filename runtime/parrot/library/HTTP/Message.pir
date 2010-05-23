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

.sub 'get_string' :vtable :method
    $P0 = iter self
    $P1 = new 'StringBuilder'
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    push $P1, $S0
    push $P1, ": "
    $S0 = self[$S0]
    push $P1, $S0
    push $P1, "\r\n"
    goto L1
  L2:
    $S0 = $P1
    .return ($S0)
.end

=head3 Class HTTP;Message

=over 4

=cut

.namespace ['HTTP';'Message']

.sub '' :init :load :anon
    $P0 = newclass ['HTTP';'Message']
    $P0.'add_attribute'('headers')
    $P0.'add_attribute'('content')
    $P0.'add_attribute'('protocol')
.end

.sub 'init' :vtable :method
    $P0 = new ['HTTP';'Headers']
    setattribute self, 'headers', $P0
.end

=item protocol

=cut

.sub 'protocol' :method
    $P0 = getattribute self, 'protocol'
    .return ($P0)
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

=item remove_header

=cut

.sub 'remove_header' :method
    .param string key
    $P0 = getattribute self, 'headers'
    delete $P0[key]
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

.include 'cclass.pasm'

.sub '' :init :load :anon
    load_bytecode 'URI.pbc'
    $P0 = subclass ['HTTP';'Message'], ['HTTP';'Request']
    $P0.'add_attribute'('method')
    $P0.'add_attribute'('uri')
    $P0.'add_attribute'('proxy')
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

.sub 'proxy' :method
    .param pmc val              :optional
    .param int has_val          :opt_flag
    unless has_val goto L1
    setattribute self, 'proxy', val
    .return ()
  L1:
    $P0 = getattribute self, 'proxy'
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
    .param string url
    .param pmc contents :slurpy
    .param pmc headers :slurpy :named
    .local pmc req
    req = new ['HTTP';'Request']
    $P0 = box 'POST'
    setattribute req, 'method', $P0
    $P0 = get_hll_global ['URI'], 'new_from_string'
    $P0 = $P0(url)
    setattribute req, 'uri', $P0
    $P0 = iter headers
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S1 = headers[$S0]
    req.'push_header'($S0, $S1)
    goto L1
  L2:
    .local string ct
    ct = req.'get_header'('Content-Type')
    unless ct == '' goto L3
    ct = 'application/x-www-form-urlencoded'
    goto L4
  L3:
    unless ct == 'form-data' goto L4
    ct = 'multipart/form-data'
  L4:

    $I0 = index ct, 'multipart/form-data'
    if $I0 < 0 goto L5
    .local string content, boundary
    (content, boundary) = form_data(contents, req)
    ct .= '; boundary='
    ct .= boundary
    goto L11
  L5:

    # work in progress

  L11:

    req.'push_header'('Content-Type', ct)
    $I0 = 0
    if content == '' goto L12
    $P0 = box content
    setattribute req, 'content', $P0
    $I0 = length content
  L12:
    req.'push_header'('Content-Length', $I0)
    .return (req)
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
    $P0 = $P0(url)
    setattribute req, 'uri', $P0
    $P0 = iter headers
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $S1 = headers[$S0]
    req.'push_header'($S0, $S1)
    goto L1
  L2:
    $P0 = iter contents
    $P1 = new 'StringBuilder'
    unless $P0 goto L3
  L4:
    unless $P0 goto L5
    $S0 = shift $P0
    push $P1, $S0
    goto L4
  L5:
    .local string content
    content = $P1
    $P0 = box content
    setattribute req, 'content', $P0
    $S0 = req.'get_header'('Content-Length')
    unless $S0 == '' goto L3
    $I0 = length content
    req.'push_header'('Content-Length', $I0)
  L3:
    .return (req)
.end

.sub 'form_data'
    .param pmc contents
    .param pmc req
    .const string CRLF = "\r\n"
    .local pmc parts
    parts = new 'ResizableStringArray'
    $P0 = iter contents
  L1:
    unless $P0 goto L2
    .local pmc k
    k = shift $P0
    unless $P0 goto L2
    .local pmc v
    v = shift $P0
    $I0 = does v, 'array'
    if $I0 goto L3
    $P1 = new 'StringBuilder'
    push $P1, 'Content-Disposition: form-data; name="'
    push $P1, k
    push $P1, '"'
    push $P1, CRLF
    push $P1, CRLF
    push $P1, v
    $S0 = $P1
    push parts, $S0
    goto L1
  L3:
    $P1 = iter v
    .local string file
    file = shift $P1
    .local string usename
    usename = file
    unless $P1 goto L4
    $S0 = shift $P1
    if $S0 == '' goto L4
    usename = $S0
  L4:
    .local string disp
    $P2 = new 'StringBuilder'
    push $P2, 'form-data; name="'
    push $P2, k
    push $P2, '"'
    if usename == '' goto L5
    push $P2, '; filename="'
    push $P2, usename
    push $P2, '"'
  L5:
    disp = $P2
    .local pmc h
    h = new ['HTTP';'Headers']
  L6:
    unless $P1 goto L7
    $S1 = shift $P1
    unless $P1 goto L7
    $S2 = shift $P1
    h[$S1] = $S2
    goto L6
  L7:
    .local string content
    content = ''
    if file == '' goto L8
    load_bytecode 'osutils.pbc'
    content = slurp(file)
    $I0 = exists h['Content-Type']
    if $I0 goto L8
    h['Content-Type'] = 'application/octet-stream'
  L8:
    $I0 = exists h['Content-Disposition']
    unless $I0 goto L9
    disp = h['Content-Disposition']
    delete h['Content-Disposition']
  L9:
    $I0 = exists h['Content']
    unless $I0 goto L10
    content = h['Content']
    delete h['Content']
  L10:
    $P1 = new 'StringBuilder'
    push $P1, 'Content-Disposition: '
    push $P1, disp
    push $P1, CRLF
    push $P1, h
    push $P1, CRLF
    push $P1, content
    $S0 = $P1
    push parts, $S0
    goto L1
  L2:

    .local string _boundary
    _boundary = boundary(10)
    $P0 = iter parts
    $P1 = new 'StringBuilder'
  L21:
    unless $P0 goto L22
    $S0 = shift $P0
    push $P1, '--'
    push $P1, _boundary
    push $P1, CRLF
    push $P1, $S0
    push $P1, CRLF
    goto L21
  L22:
    push $P1, '--'
    push $P1, _boundary
    push $P1, '--'
    push $P1, CRLF
    $S0 = $P1
    .return ($S0, _boundary)
.end

.sub 'boundary'
    .param int size
    load_bytecode 'MIME/Base64.pbc'
    load_bytecode 'Math/Rand.pbc'
    .local pmc srand
    srand = get_hll_global ['Math';'Rand'], 'srand'
    time $I0
    srand($I0)
    .local pmc rand
    rand = get_hll_global ['Math';'Rand'], 'rand'
    $P0 = new 'StringBuilder'
    $I0 = size * 3
  L1:
    unless $I0 goto L2
    dec $I0
    $I1 = rand()
    $I1 %= 256
    $S0 = chr $I1
    push $P0, $S0
    goto L1
  L2:
    $S0 = $P0
    .local pmc encode
    encode = get_hll_global ['MIME';'Base64'], 'encode_base64'
    $S0 = encode($S0)
    $I1 = length $S0
    $I0 = 0
  L3:
    unless $I0 < $I1 goto L4
    $I2 = is_cclass .CCLASS_ALPHANUMERIC , $S0, $I0
    if $I2 goto L5
    $S0 = replace $S0, $I0, 1, 'X'
  L5:
    inc $I0
    goto L3
  L4:
    .return ($S0)
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
    $P0.'add_attribute'('previous')
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

=item previous

=cut

.sub 'previous' :method
    .param pmc prev
    setattribute self, 'previous', prev
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

=item redirects

=cut

.sub 'redirect' :method
    $P0 = new 'ResizablePMCArray'
    $P1 = self
  L1:
    $P2 = getattribute $P1, 'previous'
    if null $P2 goto L2
    unshift $P0, $P2
    $P1 = $P2
    goto L1
  L2:
    .return ($P0)
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

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
