# Copyright (C) 2006, The Perl Foundation.
# $Id$

.namespace ['CGI'; 'QueryHash']

=head1 NAME

['CGI' ; 'QueryHash'] - A helper for classic CGI 

=head1 SYNOPSIS

  load_bytecode 'CGI/QueryHash.pbc'

=head2 Functions

=over

=item parse_get

Get parameters for GET method.

=cut


.sub 'parse_get' 

    .local pmc my_env, query_hash, items
    .local string query, kv, k, v
    .local int i, n

    query_hash = new .Hash
    my_env     = new .Env
    query      = my_env['QUERY_STRING']
    items      = split '&', query

    i = 0
    n = elements items
lp_items:
    kv = items[i]
    $I0 = index kv, "="
    if $I0 == -1 goto no_val
    k = substr kv, 0, $I0
    inc $I0
    v = substr kv, $I0
    goto set_val
no_val:
    k = kv
    v = 1
set_val:
    query_hash[k] = v

next_item:
    inc i
    if i < n goto lp_items
    
    .return (query_hash)
.end

=back

=head1 HISTORY

Splitting of query string is taken from HTTP/Daemon.pir.

=head1 TODO

Add stuff that Plumhead needs.
Find or write a test suite for CGI.

=head1 SEE ALSO

F<runtime/parrot/library/HTTP/Daemon.pir>,
F<languages/plumhead/plumhead.pir>, F<t/library/cgi_query_hash.t>,
L<http://hoohoo.ncsa.uiuc.edu/cgi/overview.html>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de> 

=cut

