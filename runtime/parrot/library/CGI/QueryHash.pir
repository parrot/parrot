# Copyright (C) 2006, The Perl Foundation.
# $Id$

.namespace ['CGI'; 'QueryHash']

=head1 NAME

['CGI' ; 'QueryHash'] - A helper for classic CGI 

=head1 SYNOPSIS

    load_bytecode 'CGI/QueryHash.pbc'

    parse_get_sub = get_global [ 'CGI'; 'QueryHash' ], 'parse_get'
    .local pmc    params_from_get
    params_from_get = parse_get_sub()

    parse_post_sub = get_global [ 'CGI'; 'QueryHash' ], 'parse_post'
    .local pmc    params_from_post
    params_from_post = parse_post_sub()

=head1 Functions

=over

=item parse_get

Get parameters for GET method.

=cut


.sub 'parse_get' 

    .local pmc my_env, query_hash
    .local string query

    my_env          = new .Env
    query           = my_env['QUERY_STRING']
    query_hash      = parse( query )

    .return (query_hash)
.end

=item parse_post

Get parameters for POST method.

=cut


.sub 'parse_post' 

    .local pmc my_env, in, query_hash
    .local string query
    .local int len

    my_env     = new .Env
    len        = my_env['CONTENT_LENGTH']
    in         = getstdin
    query      = read in, len
    query_hash = parse( query )
    close in

    .return (query_hash)
.end


=item parse

Split inta a hash.

=cut

.sub 'parse' 
    .param string query

    .local pmc query_hash, items, items_tmp_1, items_tmp_2
    .local string query, kv, k, v, item_tmp_1, item_tmp_2
    .local int i, j, n, o

    query_hash      = new .Hash
    items           = new .ResizableStringArray

    # split by '&' and ';'
    items_tmp_1 = split ';', query
    i = 0
    n = elements items_tmp_1
next_loop_1:
       if i >= n goto end_loop_1
       item_tmp_1 = items_tmp_1[i]
       inc i
       items_tmp_2 = split '&', item_tmp_1  
       j = 0
       o = elements items_tmp_2
next_loop_2:
           if j >= o goto next_loop_1
           item_tmp_2 = items_tmp_2[j]
           push items, item_tmp_2
           inc j
           goto next_loop_2
end_loop_1:

    i = 0
    n = elements items
lp_items:
    kv = items[i]
    $I0 = index kv, "="
    if $I0 == -1 goto no_val
    k = substr kv, 0, $I0
    k = urldecode(k)
    inc $I0
    v = substr kv, $I0
    goto set_val
no_val:
    k = kv
    v = 1
set_val:
    k = urldecode(k)
    query_hash[k] = v

next_item:
    inc i
    if i < n goto lp_items
    
    .return (query_hash)
.end

=item urldecode

convert %xx to char 

=cut

.sub urldecode
    .param string in

    .local string out, char_in, char_out
    .local int    c_out, pos_in, len
    .local string hex

    len = length in
    pos_in = 0
    out = ""
START:
    if pos_in >= len goto END
    substr char_in, in, pos_in, 1
    char_out = char_in
    if char_in != "%" goto INC_IN
    # OK this was a escape character, next two are hexadecimal
    inc pos_in
    substr hex, in, pos_in, 2
    c_out = hex_to_int (hex)
    chr char_out, c_out
    inc pos_in

INC_IN:
    concat out, char_out
    inc pos_in
    goto START
END:
   .return( out )
.end

.sub hex_to_int
    .param pmc hex

    .return hex.'to_int'(16)
.end

=back

=head1 HISTORY

Splitting of query string is taken from HTTP/Daemon.pir.

=head1 TODO

Better method names.
Add stuff that Plumhead needs.
Find or write a test suite for CGI.

=head1 SEE ALSO

F<runtime/parrot/library/HTTP/Daemon.pir>,
F<languages/plumhead/plumhead.pir>, F<t/library/cgi_query_hash.t>,
L<http://hoohoo.ncsa.uiuc.edu/cgi/overview.html>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de> 

=cut

