#!./parrot
# Copyright (C) 2006, The Perl Foundation.

=head1 NAME

t/library/cgi_query_hash.t - test [ 'CGI'; 'QueryHash' ]

=head1 SYNOPSIS

    % prove t/library/cgi_query_hash.t

=head1 DESCRIPTION

Test  [ 'CGI'; 'QueryHash' ]

=cut

.include "library/dumper.pir"

.sub test :main

    load_bytecode 'Test/More.pir'
    load_bytecode 'CGI/QueryHash.pbc'

    .local pmc plan, is, ok
    plan = get_hll_global ['Test::More'], 'plan'
    is   = get_hll_global ['Test::More'], 'is'
    ok   = get_hll_global ['Test::More'], 'ok'

    plan(3)

    # set up environment
    .local pmc my_env
    my_env = new .Env
    ok( my_env, 'Got an .Env pmc' )
    my_env['REQUEST_TYPE'] = 'GET'
    my_env['QUERY_STRING'] = 'as=df'

    .local pmc parse_get_sub
    .local int is_defined
    
    parse_get_sub = get_global [ 'CGI'; 'QueryHash' ], 'parse_get'
    is_defined = defined parse_get_sub
    ok( is_defined, 'got the sub "parse_get"' )

    .local pmc query_hash
    query_hash = parse_get_sub()
    .local string val
    val = query_hash['as']
    is( val, 'df', 'single GET param' )

.end   

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard Schmalhofer@gmx.de>

=cut
