#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/uri.t

=head1 DESCRIPTION

Test the URI library

=head1 SYNOPSIS

    % prove t/library/uri.t

=cut

.sub 'main' :main
    .include 'test_more.pir'

    load_bytecode 'URI.pir'

    plan(60)
    test_new()
    test_uri()
    test_file()
    test_http()
    test_https()
.end

.sub 'test_new'
    $P0 = new ['URI';'_generic']
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "new ['URI';'_generic']")
    $I0 = isa $P0, ['URI']
    ok($I0, "isa ['URI']")

    $P0 = new ['URI';'file']
    $I0 = isa $P0, ['URI';'file']
    ok($I0, "new ['URI';'file']")
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "isa ['URI';'_generic']")

    $P0 = new ['URI';'_server']
    $I0 = isa $P0, ['URI';'_server']
    ok($I0, "new ['URI';'_server']")
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "isa ['URI';'_generic']")

    $P0 = new ['URI';'http']
    $I0 = isa $P0, ['URI';'http']
    ok($I0, "new ['URI';'http']")
    $I0 = isa $P0, ['URI';'_server']
    ok($I0, "isa ['URI';'_server']")

    $P0 = new ['URI';'https']
    $I0 = isa $P0, ['URI';'https']
    ok($I0, "new ['URI';'https']")
    $I0 = isa $P0, ['URI';'http']
    ok($I0, "isa ['URI';'http']")
.end

.sub 'test_uri'
    .local pmc factory
    factory = get_hll_global ['URI'], 'new_from_string'

    $P0 = factory('scheme:scheme-specific-part#fragment')
    ok($P0, "scheme:scheme-specific-part#fragment")
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "isa ['URI';'_generic']")
    $S0 = $P0.'scheme'()
    is($S0, 'scheme', "scheme")
    $S0 = $P0.'opaque'()
    is($S0, 'scheme-specific-part', "opaque")
    $S0 = $P0.'fragment'()
    is($S0, 'fragment', "fragment")
    $S0 = $P0.'authority'()
    is($S0, '', "no authority")
    $S0 = $P0.'path'()
    is($S0, 'scheme-specific-part', "path")
    $S0 = $P0.'path_query'()
    is($S0, 'scheme-specific-part', "path_query")

    $P0 = factory('scheme://authority/path?query#fragment')
    ok($P0, "scheme://authority/path?query#fragment")
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "isa ['URI';'_generic']")
    $S0 = $P0.'scheme'()
    is($S0, 'scheme', "scheme")
    $S0 = $P0.'opaque'()
    is($S0, '//authority/path?query', "opaque")
    $S0 = $P0.'fragment'()
    is($S0, 'fragment', "fragment")
    $S0 = $P0.'authority'()
    is($S0, 'authority', "authority")
    $S0 = $P0.'path'()
    is($S0, '/path', "path")
    $S0 = $P0.'path_query'()
    is($S0, '/path?query', "path_query")

    $P0 = factory('path?query#fragment')
    ok($P0, "path?query#fragment")
    $I0 = isa $P0, ['URI';'_generic']
    ok($I0, "isa ['URI';'_generic']")
    $S0 = $P0.'scheme'()
    is($S0, '', "no scheme")
    $S0 = $P0.'opaque'()
    is($S0, 'path?query', "opaque")
    $S0 = $P0.'fragment'()
    is($S0, 'fragment', "fragment")
    $S0 = $P0.'authority'()
    is($S0, '', "no authority")
    $S0 = $P0.'path'()
    is($S0, 'path', "path")
    $S0 = $P0.'path_query'()
    is($S0, 'path?query', "path_query")
.end

.sub 'test_file'
    .local pmc factory
    factory = get_hll_global ['URI'], 'new_from_string'

    $P0 = factory('file:/foo/bar')
    ok($P0, "file:/foo/bar")
    $I0 = isa $P0, ['URI';'file']
    ok($I0, "isa ['URI';'file']")
    $S0 = $P0.'scheme'()
    is($S0, 'file', "scheme")
    $S0 = $P0.'host'()
    is($S0, '', 'no host')
    $S0 = $P0.'path'()
    is($S0, '/foo/bar', 'path')
.end

.sub 'test_http'
    .local pmc factory
    factory = get_hll_global ['URI'], 'new_from_string'

    $P0 = factory('http://www.parrot.org')
    ok($P0, "http://www.parrot.org")
    $I0 = isa $P0, ['URI';'http']
    ok($I0, "isa ['URI';'http']")
    $S0 = $P0.'scheme'()
    is($S0, 'http', "scheme")
    $S0 = $P0.'host'()
    is($S0, 'www.parrot.org', 'host')
    $S0 = $P0.'port'()
    is($S0, '80', 'port')

    $P0 = factory('http://127.0.0.1:8080')
    ok($P0, "http://127.0.0.1:8080")
    $I0 = isa $P0, ['URI';'http']
    ok($I0, "isa ['URI';'http']")
    $S0 = $P0.'scheme'()
    is($S0, 'http', "scheme")
    $S0 = $P0.'host'()
    is($S0, '127.0.0.1', 'host')
    $S0 = $P0.'port'()
    is($S0, '8080', 'port')

    $P0 = factory('http://user:passwd@proxy.net:8000/path')
    ok($P0, "http://user:passwd@proxy.net:8000/path")
    $I0 = isa $P0, ['URI';'http']
    ok($I0, "isa ['URI';'http']")
    $S0 = $P0.'scheme'()
    is($S0, 'http', "scheme")
    $S0 = $P0.'authority'()
    is($S0, 'user:passwd@proxy.net:8000', 'authority')
    $S0 = $P0.'userinfo'()
    is($S0, 'user:passwd', 'userinfo')
    $S0 = $P0.'host'()
    is($S0, 'proxy.net', 'host')
    $S0 = $P0.'port'()
    is($S0, '8000', 'port')
.end

.sub 'test_https'
    .local pmc factory
    factory = get_hll_global ['URI'], 'new_from_string'

    $P0 = factory('https://www.parrot.org')
    ok($P0, "https://www.parrot.org")
    $I0 = isa $P0, ['URI';'https']
    ok($I0, "isa ['URI';'https']")
    $S0 = $P0.'scheme'()
    is($S0, 'https', "scheme")
    $S0 = $P0.'port'()
    is($S0, '443', 'port')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
