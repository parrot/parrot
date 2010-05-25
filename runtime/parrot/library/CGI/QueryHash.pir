# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

.namespace ['CGI'; 'QueryHash']

=head1 NAME

CGI;QueryHash - A helper for classic CGI

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
    .local int does_exist

    query_hash      = new 'Hash'
    my_env          = new 'Env'
    does_exist = exists my_env['QUERY_STRING']
    unless does_exist goto end_parse_get
        .local string query
        query           = my_env['QUERY_STRING']
        #_dumper( query, 'queryGET:' )
        query_hash      = parse( query )

end_parse_get:
    .return (query_hash)
.end

=item parse_post

Get parameters for POST method.

=cut


.sub 'parse_post'

    .local pmc my_env, query_hash
    .local int does_exist

    query_hash   = new 'Hash'
    my_env       = new 'Env'
    does_exist   = exists my_env['CONTENT_LENGTH']
    unless does_exist goto end_parse_post
        .local pmc in
        .local string content_length, query
        .local int len
        content_length  = my_env['CONTENT_LENGTH']
        len             = content_length
        $P0             = getinterp
        in              = $P0.'stdhandle'(0)
        query           = in.'read'(len)
        in.'close'()
        #_dumper( query, 'queryPOST:' )
        query_hash = parse( query )

end_parse_post:
    .return (query_hash)
.end


=item parse

Split into a hash.
'[]' indicates that the value should be put into an array.

=cut

.sub 'parse'
    .param string query

    unless query goto END

    .local pmc query_hash, items, items_tmp_1, items_tmp_2
    .local string kv, k, v, item_tmp_1, item_tmp_2, last_chars_of_k
    .local int i, j, n, o, len_of_k

    query_hash      = new 'Hash'
    items           = new 'ResizableStringArray'

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
    v = urldecode(v)
    # a special case: [] indicates an array
    len_of_k = length k
    if len_of_k <= 2 goto v_isnt_array
    last_chars_of_k = substr k, -2
    ne last_chars_of_k, '[]', v_isnt_array
        .local pmc v_array
        # TODO: This should be an array
        v_array = new 'Hash'
        v_array[0] = v
        k = replace k, -2, 2, ''
        query_hash[k] = v_array
        branch next_item
v_isnt_array:
    query_hash[k] = v

next_item:
    inc i
    if i < n goto lp_items

END:
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
    if char_in != "+" goto NOT_A_PLUS
        char_out = ' '
        goto INC_IN

NOT_A_PLUS:
    if char_in != "%" goto INC_IN
        # OK this was a escape character, next two are hexadecimal
        inc pos_in
        substr hex, in, pos_in, 2
        c_out = hex_to_int (hex)
        chr char_out, c_out
        inc pos_in
        goto INC_IN

INC_IN:
    concat out, char_out
    inc pos_in
    goto START

END:
   .return( out )
.end

.sub hex_to_int
    .param pmc hex

    .tailcall hex.'to_int'(16)
.end

=back

=head1 HISTORY

Splitting of query string is taken from HTTP/Daemon.pir.

=head1 TODO

Better method names.
Add stuff that Pipp needs.
Find or write a test suite for CGI.

=head1 SEE ALSO

F<runtime/parrot/library/HTTP/Daemon.pir>,
F<languages/pipp/pipp.pir>, F<t/library/cgi_query_hash.t>,
L<http://hoohoo.ncsa.uiuc.edu/cgi/overview.html>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
