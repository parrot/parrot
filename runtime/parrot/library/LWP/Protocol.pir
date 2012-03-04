# Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

LWP - The World-Wide Web library for Parrot

=head2 DESCRIPTION

Simplified port of LWP (version 5.834)
see http://search.cpan.org/dist/libwww-perl/

=head3 Class LWP;Protocol

=over 4

=cut

.namespace ['LWP';'Protocol']

.sub '' :tag('init') :tag('load') :anon
    load_bytecode 'osutils.pbc'
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

.sub '' :tag('init') :tag('load') :anon
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
.include 'cclass.pasm'

.sub '' :tag('init') :tag('load') :anon
    $P0 = subclass ['LWP';'Protocol'], ['LWP';'Protocol';'http']
.end

.sub '_new_socket'
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

    $I0 = exists headers['Connection']
    if $I0 goto L3
    headers['Connection'] = 'Keep-Alive'
  L3:
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

.sub '_receive_status_line'
    .param pmc sock
    .param pmc response
    .local string status_line
    status_line = sock.'readline'()
    status_line = chomp(status_line)
    $I0 = index status_line, " "
    if $I0 < 0 goto L1
    $S0 = substr status_line, 0, $I0
    $P1 = box $S0
    setattribute response, 'protocol', $P1
    $I1 = $I0 + 1
    $I0 = index status_line, " ", $I1
    if $I0 < 0 goto L1
    $I2 = $I0 - $I1
    $S0 = substr status_line, $I1, $I2
    $P1 = box $S0
    setattribute response, 'code', $P1
    inc $I0
    $S0 = substr status_line, $I0
    $P1 = box $S0
    setattribute response, 'message', $P1
    .return (1)
  L1:
    $P1 = box status_line
    setattribute response, 'message', $P1
    .return (0)
.end

.sub '_receive_headers'
    .param pmc sock
    .param pmc headers
  L1:
    $S0 = sock.'readline'()
    $S0 = chomp($S0)
    if $S0 == '' goto L2
    $I0 = index $S0, ": "
    if $I0 < 0 goto L1
    $S1 = substr $S0, 0, $I0
    $I0 += 2
    $S2 = substr $S0, $I0
    headers[$S1] = $S2
    goto L1
  L2:
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
    sock = _new_socket(host, port)

    .local pmc request_headers
    request_headers = request.'headers'()
    self.'_fixup_header'(request_headers, url, proxy)

    $S0 = _format_request(method, fullpath, request_headers)
    sock.'puts'($S0)

    .local pmc response
    response = new ['HTTP';'Response']
    .local pmc pcontent
    .local string content
    pcontent = request.'content'()
    if null pcontent goto L11
    content = pcontent
    unless content goto L11
    $I1 = sock.'puts'(content)
    if $I1 >= 0 goto L11
    $P0 = box RC_INTERNAL_SERVER_ERROR
    setattribute response, 'code', $P0
    $P0 = box "I/O error"
    setattribute response, 'message', $P0
    .return (response)
  L11:

    .local pmc ua
    ua = self.'ua'()
    ua.'progress'('tick', request)
    $I0 = _receive_status_line(sock, response)
    unless $I0 == 0 goto L21
    .return (response)
  L21:
    .local pmc headers
    headers = new ['HTTP';'Headers']
    setattribute response, 'headers', headers
    _receive_headers(sock, headers)
    .local pmc buf
    buf = new 'StringBuilder'
    $S0 = response.'get_header'('Transfer-Encoding')
    $I0 = index $S0, 'chunked'
    unless $I0 < 0 goto L51
    .local int content_length
    content_length = 0
    $S0 = response.'get_header'('Content-Length')
    if $S0 == '' goto L22
    content_length = $S0
  L22:
    unless content_length == 0 goto L41
  L31:
    ua.'progress'('tick', request)
    $S0 = sock.'recv'()
    if $S0 == '' goto L23
    push buf, $S0
    goto L31
  L41:
    $I0 = buf.'get_string_length'()
    $N0 = $I0 / content_length
    ua.'progress'($N0, request)
    if $I0 >= content_length goto L23
    $S0 = sock.'recv'()
    if $S0 == '' goto L23
    push buf, $S0
    goto L41
  L51:
    .local int chunk_length
    $S0 = sock.'readline'()
    $I1 = length $S0
    $I0 = find_not_cclass .CCLASS_HEXADECIMAL, $S0, 0, $I1
    $S0 = substr $S0, 0, $I0
    $P0 = box $S0
    chunk_length = $P0.'to_int'(16)
    if chunk_length == 0 goto L52
    ua.'progress'('tick', request)
    $S0 = sock.'read'(chunk_length)
    push buf, $S0
    sock.'readline'()
    goto L51
  L52:
    _receive_headers(sock, headers) # trailers
  L23:
    $S0 = buf
    $P0 = box $S0
    setattribute response, 'content', $P0
    sock.'close'()
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
