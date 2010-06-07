# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

LWP - The World-Wide Web library for Parrot

=head2 DESCRIPTION

Simplified port of LWP (version 5.834)
see http://search.cpan.org/~gaas/libwww-perl/

=head3 Class LWP;Protocol

=over 4

=cut

.namespace ['LWP';'Protocol']

.sub '' :init :load :anon
    load_bytecode 'HTTP/Message.pbc'
    $P0 = newclass ['LWP';'Protocol']
    $P0.'add_attribute'('scheme')
    $P0.'add_attribute'('ua')
.end

=item create

=cut

.sub 'create'
    .param string scheme
    .param pmc ua
    $P1 = new 'Key'
    set $P1, 'LWP'
    $P2 = new 'Key'
    set $P2, 'Protocol'
    push $P1, $P2
    $P3 = new 'Key'
    set $P3, scheme
    push $P1, $P3
    $P0 = get_class $P1
    unless null $P0 goto L1
    .return ($P0)
  L1:
    .local pmc protocol
    protocol = new $P0
    $P0 = box scheme
    setattribute protocol, 'scheme', $P0
    setattribute protocol, 'ua', ua
    .return (protocol)
.end

=item scheme

=cut

.sub 'scheme' :method
    $P0 = getattribute self, 'scheme'
    .return ($P0)
.end

=item ua

=cut

.sub 'ua' :method
    $P0 = getattribute self, 'ua'
    .return ($P0)
.end

.sub 'request' :method
    .param pmc args :slurpy
    die 'LWP::Protocol::request() needs to be overridden in subclasses'
.end

=back

=head3 Class LWP;Protocol;file

=over 4

=cut

.namespace ['LWP';'Protocol';'file']

.loadlib 'io_ops'
.include 'stat.pasm'

.sub '' :init :load :anon
    $P0 = subclass ['LWP';'Protocol'], ['LWP';'Protocol';'file']
    .globalconst int RC_OK = 200
    .globalconst int RC_BAD_REQUEST = 400
    .globalconst int RC_NOT_FOUND = 404
    .globalconst int RC_INTERNAL_SERVER_ERROR = 500
.end

=item request

=cut

.sub 'request' :method
    .param pmc request
    .param pmc proxy
    if null proxy goto L1
    $P0 = new ['HTTP';'Response']
    $P1 = box RC_BAD_REQUEST
    setattribute $P0, 'code', $P1
    $P1 = box 'You can not proxy through the filesystem'
    setattribute $P0, 'message', $P1
    .return ($P0)
  L1:
    load_bytecode 'osutils.pbc'
    .local string method
    method = request.'method'()
    $P0 = get_hll_global ['LWP';'Protocol';'file'], method
    unless null $P0 goto L2
    $P0 = new ['HTTP';'Response']
    $P1 = box RC_BAD_REQUEST
    setattribute $P0, 'code', $P1
    $S0 = "Library does not allow method " . method
    $S0 .= " for 'file:' URLs"
    $P1 = box $S0
    setattribute $P0, 'message', $P1
    .return ($P0)
  L2:
    .local pmc url
    url = request.'uri'()
    .local string scheme
    scheme = url.'scheme'()
    if scheme == 'file' goto L3
    $P0 = new ['HTTP';'Response']
    $P1 = box RC_INTERNAL_SERVER_ERROR
    setattribute $P0, 'code', $P1
    $S0 = "LWP::Protocol::file::request called for '" . scheme
    $S0 .= "'"
    $P1 = box $S0
    setattribute $P0, 'message', $P1
    .return ($P0)
  L3:
    .tailcall $P0(self, request)
.end

.sub 'HEAD' :method :nsentry
    .param pmc request
    .tailcall self.'GET'(request)
.end

.sub 'GET' :method :nsentry
    .param pmc request
    .local pmc response
    response = new ['HTTP';'Response']
    .local string method
    method = request.'method'()
    .local pmc url
    url = request.'uri'()
    .local string path
    path = url.'path'()

    $I0 = stat path, .STAT_EXISTS
    if $I0 goto L1
    $P0 = box RC_NOT_FOUND
    setattribute response, 'code', $P0
    $S0 = "File `" . path
    $S0 .= "' does not exist"
    $P0 = box $S0
    setattribute response, 'message', $P0
    .return (response)
  L1:

    .local int mtime
    mtime = stat path, .STAT_MODIFYTIME
    $P0 = get_hll_global ['HTTP';'Date'], 'time2str'
    $S0 = $P0(mtime)
    response.'push_header'('Last-Modified', $S0)
    .local int filesize
    filesize = stat path, .STAT_FILESIZE
    response.'push_header'('Content-Length', filesize)

    if method == 'HEAD' goto L2
    push_eh _handler
    $S0 = slurp(path)
    pop_eh
    $P0 = box $S0
    setattribute response, 'content', $P0
  L2:
    $P0 = box RC_OK
    setattribute response, 'code', $P0
    .return (response)

  _handler:
    .local pmc ex
    .get_results (ex)
    $P0 = box RC_INTERNAL_SERVER_ERROR
    setattribute response, 'code', $P0
    $S0 = ex
    $P0 = box $S0
    setattribute response, 'message', $P0
    .return (response)
.end

.sub 'PUT' :method :nsentry
    .param pmc request
    .local pmc response
    response = new ['HTTP';'Response']
    .local pmc url
    url = request.'uri'()
    .local string path
    path = url.'path'()
    .local string content
    content = request.'content'()

    push_eh _handler
    $S0 = spew(path, content)
    pop_eh

    $P0 = box RC_OK
    setattribute response, 'code', $P0
    .return (response)

  _handler:
    .local pmc ex
    .get_results (ex)
    $P0 = box RC_INTERNAL_SERVER_ERROR
    setattribute response, 'code', $P0
    $S0 = ex
    $P0 = box $S0
    setattribute response, 'message', $P0
    .return (response)
.end

.sub 'DELETE' :method :nsentry
    .param pmc request
    .local pmc response
    response = new ['HTTP';'Response']
    .local pmc url
    url = request.'uri'()
    .local string path
    path = url.'path'()

    $I0 = stat path, .STAT_EXISTS
    if $I0 goto L1
    $P0 = box RC_NOT_FOUND
    setattribute response, 'code', $P0
    $S0 = "File `" . path
    $S0 .= "' does not exist"
    $P0 = box $S0
    setattribute response, 'message', $P0
    .return (response)
  L1:

    push_eh _handler
    $S0 = unlink(path)
    pop_eh

    $P0 = box RC_OK
    setattribute response, 'code', $P0
    .return (response)

  _handler:
    .local pmc ex
    .get_results (ex)
    $P0 = box RC_INTERNAL_SERVER_ERROR
    setattribute response, 'code', $P0
    $S0 = ex
    $P0 = box $S0
    setattribute response, 'message', $P0
    .return (response)
.end

=back

=head3 Class LWP;Protocol;http

=over 4

=cut

.namespace ['LWP';'Protocol';'http']

.include 'socket.pasm'

.sub '' :init :load :anon
    $P0 = subclass ['LWP';'Protocol'], ['LWP';'Protocol';'http']
.end

.sub '_new_socket' :method
    .param string host
    .param int port
    .local pmc sock, addr
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)
    addr = sock.'sockaddr'(host, port)
    sock.'connect'(addr)
    .return (sock)
.end

.sub '_fixup_header' :method
    .param pmc headers
    .param pmc url
    .param pmc proxy
    # Extract 'Host' header
    .local string host
    host = url.'authority'()
    $I0 = index host, '@'
    if $I0 < 0 goto L1
    .local string userinfo
    userinfo = substr host, 0, $I0
    inc $I0
    host = substr host, $I1
    $S0 = headers['Authorization']
    unless $S0 == '' goto L1
    load_bytecode 'MIME/Base64.pbc'
    $P0 = get_hll_global ['MIME';'Base64'], 'encode_base64'
    $S0 = $P0(userinfo)
    $S0 = 'Basic ' . $S0
    headers['Authorization'] = $S0
  L1:
    headers['Host'] = host
    if null proxy goto L2
    userinfo = proxy.'userinfo'()
    if userinfo == '' goto L2
    load_bytecode 'MIME/Base64.pbc'
    $P0 = get_hll_global ['MIME';'Base64'], 'encode_base64'
    $S0 = $P0(userinfo)
    $S0 = 'Basic ' . $S0
    headers['Proxy-Authorization'] = $S0
  L2:
.end

.sub '_format_request'
    .param string method
    .param string uri
    .param pmc headers
    .const string CRLF = "\r\n"
    $P0 = new 'StringBuilder'
    push $P0, method
    push $P0, ' '
    push $P0, uri
    push $P0, ' HTTP/1.1'
    push $P0, CRLF
    $P1 = iter headers
  L1:
    unless $P1 goto L2
    $S0 = shift $P1
    $S1 = headers[$S0]
    push $P0, $S0
    push $P0, ': '
    push $P0, $S1
    push $P0, CRLF
    goto L1
  L2:
    push $P0, CRLF
    .return ($P0)
.end

.sub '_parse_response_headers' :method
    .param pmc response
    .param string str
    .local string sep
    sep = "\r\n"
    $I0 = index str, "\r"
    unless $I0 < 0 goto L0
    sep = "\n"
  L0:
    $S0 = sep . sep
    $I0 = index str, $S0
    if $I0 < 0 goto L1
    str = substr str, 0, $I0
  L1:

    $P0 = split sep, str
    .local string status_line
    status_line = shift $P0
    $I0 = index status_line, " "
    if $I0 < 0 goto L2
    $S0 = substr status_line, 0, $I0
    $P1 = box $S0
    setattribute response, 'protocol', $P1
    $I1 = $I0 + 1
    $I0 = index status_line, " ", $I1
    if $I0 < 0 goto L2
    $I2 = $I0 - $I1
    $S0 = substr status_line, $I1, $I2
    $P1 = box $S0
    setattribute response, 'code', $P1
    inc $I0
    $S0 = substr status_line, $I0
    $P1 = box $S0
    setattribute response, 'message', $P1

    $P3 = new ['HTTP';'Headers']
  L3:
    unless $P0 goto L4
    $S0 = shift $P0
    $I0 = index $S0, ": "
    if $I0 < 0 goto L3
    $S1 = substr $S0, 0, $I0
    $I0 += 2
    $S2 = substr $S0, $I0
    $P3[$S1] = $S2
    goto L3
  L4:
    setattribute response, 'headers', $P3

    $I0 = length str
    .return ($I0)
  L2:
    .return (0)
.end

.sub '_parse_response_content' :method
    .param pmc response
    .param string str
    $I0 = index str, "\r\n\r\n"
    if $I0 < 0 goto L1
    $I0 += 4
    goto L2
  L1:
    $I0 = index str, "\n\n"
    if $I0 < 0 goto L3
    $I0 += 2
  L2:
    $S0 = substr str, $I0
    $P0 = box $S0
    setattribute response, 'content', $P0
  L3:
.end

=item request

=cut

.sub 'request' :method
    .param pmc request
    .param pmc proxy

    .local string method
    method = request.'method'()
    .local pmc url
    url = request.'uri'()
    .local string host, port, fullpath
    if null proxy goto L1
    # proxy is an URL to an HTTP server which will proxy this request
    host = proxy.'host'()
    port = proxy.'port'()
    unless method == 'CONNECT' goto L3
    fullpath = url.'host'()
    fullpath .= ':'
    $S0 = url.'port'()
    fullpath .= $S0
    goto L2
  L3:
    fullpath = url
    goto L2
  L1:
    host = url.'host'()
    port = url.'port'()
    fullpath = url.'path_query'()
    $I0 = index fullpath, '/'
    if $I0 == 0 goto L2
    fullpath = '/' . fullpath
  L2:

    # connect to remote site
    .local pmc sock
    sock = self.'_new_socket'(host, port)

    .local pmc request_headers
    request_headers = request.'headers'()
    self.'_fixup_header'(request_headers, url, proxy)

    .local pmc ua
    ua = self.'ua'()
    $S0 = _format_request(method, fullpath, request_headers)
    sock.'send'($S0)

    .local string content
    content = request.'content'()
    unless content goto L11
    .local int content_length
    content_length = length content
    $I0 = 0
  L12:
    unless $I0 < content_length goto L11
    $S0 = substr content, $I0, 8192
    $I1 = sock.'send'($S0)
    $I0 += $I1
    $N0 = $I0 / content_length
    goto L12
  L11:

    .local pmc response
    response = new ['HTTP';'Response']
    .local pmc buf
    buf = new 'StringBuilder'
    .local int header_length
    content_length = 0
  L21:
    ua.'progress'('tick', request)
    $S0 = sock.'recv'()
    if $S0 == '' goto L22
    push buf, $S0
    header_length = self.'_parse_response_headers'(response, buf)
    $I0 = response.'is_success'()
    unless $I0 goto L22
    $S0 = response.'get_header'('Content-Length')
    if $S0 == '' goto L21
    content_length = $S0
  L23:
    $I0 = buf.'get_string_length'()
    $I0 -= header_length
    $N0 = $I0 / content_length
    ua.'progress'($N0, request)
    $S0 = sock.'recv'()
    if $S0 == '' goto L22
    push buf, $S0
    goto L23
  L22:
    sock.'close'()
    self.'_parse_response_content'(response, buf)
    .return (response)
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
