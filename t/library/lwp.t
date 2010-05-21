#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/lwp.t

=head1 DESCRIPTION

Test the LWP library

=head1 SYNOPSIS

    % prove t/library/lwp.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'LWP.pir'
    load_bytecode 'osutils.pbc'

    plan(48)
    test_new()
    test_unknown_protocol()
    test_bad_request()
    test_file_not_found()
    test_file()
    test_file_head()
    test_file_post_delete()
    test_file_proxy()
.end

.sub 'test_new'
    $P0 = new ['LWP';'UserAgent']
    $I0 = isa $P0, ['LWP';'UserAgent']
    ok($I0, "new ['LWP';'UserAgent']")

    $P0 = new ['LWP';'Protocol';'file']
    $I0 = isa $P0, ['LWP';'Protocol';'file']
    ok($I0, "new ['LWP';'Protocol';'file']")
    $I0 = isa $P0, ['LWP';'Protocol']
    ok($I0, "isa ['LWP';'Protocol']")

    $P0 = new ['LWP';'Protocol';'http']
    $I0 = isa $P0, ['LWP';'Protocol';'http']
    ok($I0, "new ['LWP';'Protocol';'http']")
    $I0 = isa $P0, ['LWP';'Protocol']
    ok($I0, "isa ['LWP';'Protocol']")

    $P0 = new ['HTTP';'Request']
    $I0 = isa $P0, ['HTTP';'Request']
    ok($I0, "new ['HTTP';'Request']")
    $I0 = isa $P0, ['HTTP';'Message']
    ok($I0, "isa ['HTTP';'Message']")
    $P0 = new ['HTTP';'Response']
    $I0 = isa $P0, ['HTTP';'Response']
    ok($I0, "new ['HTTP';'Response']")
    $I0 = isa $P0, ['HTTP';'Message']
    ok($I0, "isa ['HTTP';'Message']")
.end

.sub 'test_unknown_protocol'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    response = ua.'get'('unk:foo/bar')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "GET unk:foo/bar")
    $I0 = response.'code'()
    is($I0, 501, "code")
    $S0 = response.'message'()
    is($S0, "Not Implemented", "message")
    $I0 = response.'is_error'()
    ok($I0, "is error")
.end

.sub 'test_bad_request'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    response = ua.'post'('file:foo/bar')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "GET unk:foo/bar")
    $I0 = response.'code'()
    is($I0, 400, "code bad request")
    $S0 = response.'message'()
    is($S0, "Library does not allow method POST for 'file:' URLs", "message")
    $I0 = response.'is_error'()
    ok($I0, "is error")
.end

.sub 'test_file_not_found'
    unlink('t/no_file')
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    response = ua.'get'('file:t/no_file')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "GET file:t/no_file")
    $I0 = response.'code'()
    is($I0, 404, "code")
    $S0 = response.'message'()
    is($S0, "File `t/no_file' does not exist", "message")
    $I0 = response.'is_error'()
    ok($I0, "is error")
.end

.sub 'test_file'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    response = ua.'get'('file:t/library/lwp.t')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "GET file:t/library/lwp.t")
    $I0 = response.'code'()
    is($I0, 200, "code")
    $I0 = response.'is_success'()
    ok($I0, "is success")
    $S0 = response.'content'()
    $I0 = index $S0, 'Test the LWP library'
    $I0 = $I0 > 0
    ok($I0, "content looks good")
    $I0 = response.'get_header'('Content-Length')
    $I0 = $I0 > 2000
    ok($I0, "Content-Length")
    $S0 = response.'get_header'('Last-Modified')
    diag($S0)
    $I0 = index $S0, 'GMT'
    $I0 = $I0 > 0
    ok($I0, "Last-Modified contains GMT")
.end

.sub 'test_file_head'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    response = ua.'head'('file:t/library/lwp.t')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "HEAD file:t/library/lwp.t")
    $I0 = response.'code'()
    is($I0, 200, "code")
    $I0 = response.'is_success'()
    ok($I0, "is success")
    $S0 = response.'content'()
    is($S0, '', "no content")
    $I0 = response.'get_header'('Content-Length')
    $I0 = $I0 > 2000
    ok($I0, "Content-Length")
    $S0 = response.'get_header'('Last-Modified')
    diag($S0)
    $I0 = index $S0, 'GMT'
    $I0 = $I0 > 0
    ok($I0, "Last-Modified contains GMT")
.end

.sub 'test_file_post_delete'
    .const string data = "the file contains some text"
    .const string filename = 't/library/file.txt'
    .const string url = 'file:t/library/file.txt'
    unlink(filename)

    .local pmc ua, response
    ua = new ['LWP';'UserAgent']

    response = ua.'put'(url, data)
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "PUT file:t/library/file.txt")
    $I0 = response.'code'()
    is($I0, 200, "code")
    $I0 = response.'is_success'()
    ok($I0, "is success")
    $S0 = slurp(filename)
    is($S0, data, "file content comparison")

    response = ua.'delete'(url)
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "DELETE file:t/library/file.txt")
    $I0 = response.'code'()
    is($I0, 200, "code")
    $I0 = response.'is_success'()
    ok($I0, "is success")

    response = ua.'delete'(url)
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "DELETE file:t/library/file.txt")
    $I0 = response.'code'()
    is($I0, 404, "code")
    $S0 = response.'message'()
    is($S0, "File `t/library/file.txt' does not exist", "message")
    $I0 = response.'is_error'()
    ok($I0, "is error")
.end

.sub 'test_file_proxy'
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    ua.'proxy'('file', 'file://proxy.net')
    response = ua.'get'('file:t/library/lwp.t')
    $I0 = isa response, ['HTTP';'Response']
    ok($I0, "GET file:t/library/lwp.t via a proxy")
    $I0 = response.'code'()
    is($I0, 400, "code")
    $S0 = response.'message'()
    is($S0, "You can not proxy through the filesystem", "message")
    $I0 = response.'is_error'()
    ok($I0, "is error")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
