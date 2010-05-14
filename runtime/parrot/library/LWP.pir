# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

LWP - The World-Wide Web library for Parrot

=head2 DESCRIPTION

Simplified port of LWP (version 5.834)
see http://search.cpan.org/~gaas/libwww-perl/

=head3 Class LWP;UserAgent

=over 4

=cut

.namespace ['LWP';'UserAgent']

.sub '' :init :load :anon
    load_bytecode 'HTTP/Message.pir'
    $P0 = newclass ['LWP';'UserAgent']
    $P0.'add_attribute'('show_progress')
    $P0.'add_attribute'('progress_start')
    $P0.'add_attribute'('progress_lastp')
    $P0.'add_attribute'('progress_ani')
    .globalconst int RC_OK = 200
    .globalconst int RC_BAD_REQUEST = 400
    .globalconst int RC_NOT_FOUND = 404
    .globalconst int RC_INTERNAL_SERVER_ERROR = 500
    .globalconst int RC_NOT_IMPLEMENTED = 501
.end

.sub 'send_request' :method
    .param pmc request
    .local string method
    method = request.'method'()
    .local pmc url
    url = request.'uri'()
    .local string scheme
    scheme = url.'scheme'()
    self.'progress'('begin', request)
    .local pmc protocol, response
    $P0 =get_hll_global ['LWP';'Protocol'], 'create'
    protocol = $P0(scheme, self)
    unless null protocol goto L1
    response = _new_response(request, RC_NOT_IMPLEMENTED, 'Not Implemented')
    goto L2
  L1:
    response = protocol.'request'(request)
    setattribute response, 'request', request
    $P0 = get_hll_global ['HTTP';'Date'], 'time2str'
    $I0 = time
    $S0 = $P0($I0)
    response.'push_header'('Client-Date', $S0)
  L2:
    self.'progress'('end', response)
    .return (response)
.end

.sub 'simple_request' :method
    .param pmc request
    unless null request goto L1
    die "No request object passed in"
  L1:
    $I0 = isa request, ['HTTP';'Request']
    if $I0 goto L2
    die "You need a ['HTTP';'Request']"
  L2:
    .tailcall self.'send_request'(request)
.end

.sub 'request' :method
    .param pmc request
    .local pmc response
    response = self.'simple_request'(request)
    .local int code
    code = response.'code'()
    .return (response)
.end

=item get

=cut

.sub 'get' :method
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local pmc request
    $P0 = get_hll_global ['HTTP';'Request'], 'GET'
    request = $P0(args :flat, kv :flat :named)
    .tailcall self.'request'(request)
.end

=item post

=cut

.sub 'post' :method
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local pmc request
    $P0 = get_hll_global ['HTTP';'Request'], 'POST'
    request = $P0(args :flat, kv :flat :named)
    .tailcall self.'request'(request)
.end

=item delete

=cut

.sub 'delete' :method
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local pmc request
    $P0 = get_hll_global ['HTTP';'Request'], 'DELETE'
    request = $P0(args :flat, kv :flat :named)
    .tailcall self.'request'(request)
.end

.sub 'progress' :method
    .param string status
    .param pmc msg
    $P0 = getattribute self, 'show_progress'
    if null $P0 goto L1
    unless $P0 goto L1
    unless status == 'begin' goto L2
    printerr "** "
    $P0 = getattribute msg, 'method'
    printerr $P0
    printerr " "
    $P0 = getattribute msg, 'uri'
    printerr $P0
    printerr " ==> "
    $N1 = time
    $P0 = box $N1
    setattribute self, 'progress_start', $P0
    $P0 = box ''
    setattribute self, 'progress_lastp', $P0
    $P0 = box 0
    setattribute self, 'progress_ani', $P0
    goto L1
  L2:
    unless status == 'end' goto L3
    $P0 = getattribute self, 'progress_start'
    $N1 = $P0
    $N2 = time
    null $P0
    setattribute self, 'progress_start', $P0
    setattribute self, 'progress_lastp', $P0
    setattribute self, 'progress_ani', $P0
    $S0 = msg.'status_line'()
    printerr $S0
    $N0 =$N2 - $N1
    $I0 = $N0
    unless $I0 goto L4
    printerr " ("
    printerr $I0
    printerr "s)"
  L4:
    printerr "\n"
    goto L1
  L3:
    unless status == 'tick' goto L5

    # work in progress

    goto L1
  L5:

    # work in progress

  L1:
.end

=item show_progress

=cut

.sub 'show_progress' :method
    .param pmc val
    setattribute self, 'show_progress', val
.end

=item env_provy

=cut

.sub 'env_proxy' :method
    $P0 = new 'Env'
    $P1 = iter $P0
  L1:
    unless $P1 goto L2
    $S0 = shift $P1
    $S1 = downcase $S0

    # work in progress

    goto L1
  L2:
.end

.sub '_new_response'
    .param pmc request
    .param pmc code
    .param pmc message
    $P0 = new ['HTTP';'Response']
    setattribute $P0, 'code', code
    setattribute $P0, 'message', message
    setattribute $P0, 'request', request
    $P0 = get_hll_global ['HTTP';'Date'], 'time2str'
    $I0 = time
    $S0 = $P0($I0)
    $P0.'push_header'('Client-Date', $S0)
    $P0.'push_header'('Client-Warning', "Internal response")
    $P0.'push_header'('Content-Type', 'text/plain')
    $S0 = code
    $S0 .= ' '
    $S1 = message
    $S0 .= $S1
    $S0 .= "\n"
    $P0 = box $S0
    setattribute $P0, 'content', $P0
    .return ($P0)
.end

=back

=head3 Class LWP;Protocol

=over 4

=cut

.namespace ['LWP';'Protocol']

.sub '' :init :load :anon
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
    $P0 = new $P0
    $P1 = box scheme
    setattribute $P0, 'scheme', $P1
    setattribute $P0, 'ua', ua
    .return ($P0)
.end

.sub 'request' :method
    .param pmc args :slurpy
    die 'LWP::Protocol::request() needs to be overridden in subclasses'
.end

=back

=head3 Class LWP;Protocol;file

=cut

.namespace ['LWP';'Protocol';'file']

.include 'stat.pasm'

.sub '' :init :load :anon
    load_bytecode 'osutils.pbc'
    $P0 = subclass ['LWP';'Protocol'], ['LWP';'Protocol';'file']
.end

.sub 'request' :method
    .param pmc request
    .local string method
    method = request.'method'()
    $P0 = get_hll_global ['LWP';'Protocol';'file'], method
    unless null $P0 goto L1
    $P0 = new ['HTTP';'Response']
    $P1 = box RC_BAD_REQUEST
    setattribute $P0, 'code', $P1
    $S0 = "Library does not allow method " . method
    $S0 .= " for 'file:' URLs"
    $P1 = box $S0
    setattribute $P0, 'message', $P1
    .return ($P0)
  L1:
    .local pmc url
    url = request.'uri'()
    .local string scheme
    scheme = url.'scheme'()
    if scheme == 'file' goto L2
    $P0 = new ['HTTP';'Response']
    $P1 = box RC_INTERNAL_SERVER_ERROR
    setattribute $P0, 'code', $P1
    $S0 = "LWP::Protocol::file::request called for '" . scheme
    $S0 .= "'"
    $P1 = box $S0
    setattribute $P0, 'message', $P1
    .return ($P0)
  L2:
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

.sub 'POST' :method :nsentry
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

=head3 Class LWP;Protocol;http

=cut

.namespace ['LWP';'Protocol';'http']

.sub '' :init :load :anon
    $P0 = subclass ['LWP';'Protocol'], ['LWP';'Protocol';'http']
.end

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
