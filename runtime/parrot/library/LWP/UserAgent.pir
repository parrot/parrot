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
.loadlib 'io_ops'

.sub '' :init :load :anon
    load_bytecode 'URI.pbc'
    load_bytecode 'HTTP/Message.pbc'
    load_bytecode 'LWP/Protocol.pbc'
    $P0 = newclass ['LWP';'UserAgent']
    $P0.'add_attribute'('def_headers')
    $P0.'add_attribute'('show_progress')
    $P0.'add_attribute'('progress_start')
    $P0.'add_attribute'('progress_lastp')
    $P0.'add_attribute'('progress_ani')
    $P0.'add_attribute'('max_redirect')
    $P0.'add_attribute'('proxy')
    $P0.'add_attribute'('no_proxy')
    .globalconst int RC_MOVED_PERMANENTLY = 301
    .globalconst int RC_FOUND = 302
    .globalconst int RC_SEE_OTHER = 303
    .globalconst int RC_TEMPORARY_REDIRECT = 307
    .globalconst int RC_UNAUTHORIZED = 401
    .globalconst int RC_PROXY_AUTHENTICATION_REQUIRED = 407
    .globalconst int RC_NOT_IMPLEMENTED = 501
.end

.sub 'init' :vtable :method
    $P0 = new ['HTTP';'Headers']
    $P0['User-Agent'] = 'libwww-parrot'
    setattribute self, 'def_headers', $P0
    $P0 = box 7
    setattribute self, 'max_redirect', $P0
    $P0 = new 'Hash'
    setattribute self, 'proxy', $P0
    $P0 = new 'ResizableStringArray'
    setattribute self, 'no_proxy', $P0
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
    .local pmc proxy
    proxy = request.'proxy'()
    if null proxy goto L1
    scheme = proxy.'scheme'()
  L1:
    .local pmc protocol, response
    $P0 =get_hll_global ['LWP';'Protocol'], 'create'
    protocol = $P0(scheme, self)
    unless null protocol goto L2
    response = _new_response(request, RC_NOT_IMPLEMENTED, 'Not Implemented')
    goto L3
  L2:
    response = protocol.'request'(request, proxy)
    setattribute response, 'request', request
    $P0 = get_hll_global ['HTTP';'Date'], 'time2str'
    $I0 = time
    $S0 = $P0($I0)
    response.'push_header'('Client-Date', $S0)
  L3:
    self.'progress'('end', response)
    .return (response)
.end

.sub 'prepare_request' :method
    .param pmc request
    $P0 = request.'method'()
    unless null $P0 goto L1
    die "Method missing"
  L1:
    $P0 = request.'uri'()
    unless null $P0 goto L2
    die "URL missing"
  L2:
    $S0 = $P0.'scheme'()
    unless $S0 == '' goto L3
    die "URL must be absolute"
  L3:
    self.'_need_proxy'(request)
    $P0 = getattribute self, 'def_headers'
    $P1 = iter $P0
  L4:
    unless $P1 goto L5
    $S0 = shift $P1
    $S1 = $P0[$S0]
    request.'push_header'($S0, $S1)
    goto L4
  L5:
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
    self.'prepare_request'(request)
    .tailcall self.'send_request'(request)
.end

.sub 'request' :method
    .param pmc request
    .param pmc previous         :optional
    .param int has_previous     :opt_flag

    .local pmc response
    response = self.'simple_request'(request)
    unless has_previous goto L1
    response.'previous'(previous)
  L1:

    .local int redirect
    $P0 = response.'redirect'()
    redirect = elements $P0
    .local int max_redirect
    $P0 = getattribute self, 'max_redirect'
    max_redirect = $P0
    unless redirect >= max_redirect goto L2
    $S0 = 'Redirect loop detected (max_redirect = '
    $S1 = max_redirect
    $S0 .= $S1
    $S0 .= ')'
    response.'push_header'('Client-Warning', $S0)
    .return (response)
  L2:

    .local int code
    code = response.'code'()

    if code == RC_MOVED_PERMANENTLY goto L3
    if code == RC_FOUND goto L3
    if code == RC_SEE_OTHER goto L3
    if code == RC_TEMPORARY_REDIRECT goto L3
    goto L4
  L3:
    .local pmc referral
    referral = clone request
    # These headers should never be forwarded
    referral.'remove_header'('Host')
    referral.'remove_header'('Cookie')

    # work in progress

    .local string referral_uri
    referral_uri = response.'get_header'('Location')
    $P0 = get_hll_global ['URI'], 'new_from_string'
    $P1 = $P0(referral_uri)
    $S0 = $P1.'scheme'()
    unless $S0 == '' goto L5
    $P2 = new 'StringBuilder'
    $P3 = request.'uri'()
    $S0 = $P3.'scheme'()
    push $P2, $S0
    push $P2, '://'
    $S0 = request.'get_header'('Host')
    push $P2, $S0
    push $P2, referral_uri
    $P1 = $P0($P2)
  L5:
    setattribute referral, 'uri', $P1

    # work in progress

    $I0 = self.'redirect_ok'(referral, response)
    if $I0 goto L6
    .return (response)
  L6:
    .tailcall self.'request'(referral, response)

  L4:
    .local int proxy
    proxy = 0
    .local string ch_header
    ch_header = 'WWW-Authenticate'
    if code == RC_UNAUTHORIZED goto L11
    proxy = 1
    ch_header = 'Proxy-Authenticate'
    if code == RC_PROXY_AUTHENTICATION_REQUIRED goto L11
    goto L12
  L11:
    .local string challenge
    challenge = response.'get_header'(ch_header)
    unless challenge == '' goto L13
    response.'push_header'('Client-Warning', 'Missing Authenticate header')
    .return (response)
  L13:

    # work in progress
    print "# "
    say challenge

  L12:
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

=item head

=cut

.sub 'head' :method
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local pmc request
    $P0 = get_hll_global ['HTTP';'Request'], 'HEAD'
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

=item put

=cut

.sub 'put' :method
    .param pmc args :slurpy
    .param pmc kv :slurpy :named
    .local pmc request
    $P0 = get_hll_global ['HTTP';'Request'], 'PUT'
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
    $P0 = getattribute self, 'progress_ani'
    inc $P0
    $P0 %= 4
    $P1 = split '', '-\|/'
    $S0 = $P1[$P0]
    printerr $S0
    printerr "\b"
    goto L1
  L5:
    $N0 = status
    $N0 *= 100
    $P0 = new 'FixedFloatArray'
    set $P0, 1
    $P0[0] = $N0
    $S1 = sprintf '%3.0f%%', $P0
    $P0 = getattribute self, 'progress_lastp'
    $S0 = $P0
    if $S0 == $S1 goto L1
    set $P0, $S1
    printerr $S1
    printerr "\b\b\b\b"
  L1:
.end

.sub 'redirect_ok' :method
    .param pmc new_request
    .param pmc response
    $P0 = response.'request'()
    $S0 = $P0.'method'()
    if $S0 == 'GET' goto L1
    if $S0 == 'HEAD' goto L1
    .return (0)
  L1:
    # work in progress
    .return (1)
.end

=item max_redirect

=cut

.sub 'max_redirect' :method
    .param pmc val
    setattribute self, 'max_redirect', val
.end

=item show_progress

=cut

.sub 'show_progress' :method
    .param pmc val
    setattribute self, 'show_progress', val
.end

=item agent

=cut

.sub 'agent' :method
    .param string val
    $P0 = getattribute self, 'def_headers'
    $P0['User-Agent'] = val
.end

.sub '_need_proxy' :method
    .param pmc req
    $P0 = req.'proxy'()
    unless null $P0 goto L1
    .local pmc uri
    uri = req.'uri'()
    .local string scheme
    scheme = uri.'scheme'()
    $P0 = getattribute self, 'proxy'
    .local string proxy
    proxy = $P0[scheme]
    unless proxy goto L1
    .local string host
    host = uri.'host'()
    $P0 = getattribute self, 'no_proxy'
    $P1 = iter $P0
  L2:
    unless $P1 goto L3
    $S0 = shift $P1
    $I0 = index host, $S0
    if $I0 < 0 goto L2
    goto L1
  L3:
    $P0 = get_hll_global ['URI'], 'new_from_string'
    $P0 = $P0(proxy)
    req.'proxy'($P0)
  L1:
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
    $I0 = index $S1, '_proxy'
    if $I0 < 0 goto L1
    $S2 = $P0[$S0]
    unless $S1 == 'no_proxy' goto L3
    $P2 = split ',', $S2
    $P3 = iter $P2
  L4:
    unless $P3 goto L1
    $S0 = shift $P3
    $S0 = trim($S0)
    self.'no_proxy'($S0)
    goto L4
  L3:
    $S3 = substr $S1, 0, $I0
    # Ignore xxx_proxy variables if xxx isn't a supported protocol
    $P11 = new 'Key'
    set $P11, 'LWP'
    $P12 = new 'Key'
    set $P12, 'Protocol'
    push $P11, $P12
    $P13 = new 'Key'
    set $P13, $S3
    push $P11, $P13
    $P10 = get_class $P11
    if null $P10 goto L1
    self.'proxy'($S3, $S2)
    goto L1
  L2:
.end

.include 'cclass.pasm'

.sub 'trim' :anon
    .param string str
    $I0 = length str
    $I0 = find_not_cclass .CCLASS_WHITESPACE, str, 0, $I0
    str = substr str, $I0
    $I0 = length str
  L1:
    dec $I0
    unless $I0 > 0 goto L2
    $I1 = is_cclass .CCLASS_WHITESPACE, str, $I0
    if $I1 != 0 goto L1
  L2:
    inc $I0
    str = substr str, 0, $I0
    .return (str)
.end

=item proxy

=cut

.sub 'proxy' :method
    .param string scheme
    .param string url
    $P0 = getattribute self, 'proxy'
    $P0[scheme] = url
.end

=item no_proxy

=cut

.sub 'no_proxy' :method
    .param pmc args :slurpy
    $I0 = elements args
    if $I0 goto L1
    $P0 = new 'ResizableStringArray'
    setattribute self, 'no_proxy', $P0
    goto L2
  L1:
    $P0 = getattribute self, 'no_proxy'
  L3:
    unless args goto L2
    $S0 = shift args
    push $P0, $S0
    goto L3
  L2:
.end

.sub '_new_response'
    .param pmc request
    .param pmc code
    .param pmc message
    .local pmc response
    response = new ['HTTP';'Response']
    setattribute response, 'code', code
    setattribute response, 'message', message
    setattribute response, 'request', request
    $P0 = get_hll_global ['HTTP';'Date'], 'time2str'
    $I0 = time
    $S0 = $P0($I0)
    response.'push_header'('Client-Date', $S0)
    response.'push_header'('Client-Warning', "Internal response")
    response.'push_header'('Content-Type', 'text/plain')
    $S0 = code
    $S0 .= ' '
    $S1 = message
    $S0 .= $S1
    $S0 .= "\n"
    $P0 = box $S0
    setattribute response, 'content', $P0
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
