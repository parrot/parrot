# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/io/httpd.pir - HTTP server

=head1 SYNOPSIS

  $ ./parrot examples/io/httpd.pir

=head1 DESCRIPTION

A very tiny HTTP-Server. It currently only understands the GET method.
It's a nice way of testing pretty much all IO functions.
By default (and not yet configurable) it binds to localhost:1234. 

=head2 Serving Parrot Docs

If no filename is given it serves the HTML documentation
in ./docs/html. Make sure you have built them with

  $ make html

After that you can browse the documentation with

  http://localhost:1234

which redirects to

  http://localhost:1234/docs/html/index.html

=head2 Serving Other HTML Files

If a html file is present in the request, this file will be served:

  http://localhost:1234/index.html

This will sent F<./index.html> from the directory, where F<httpd.pir>
was started.

=head2 CGI

If the file extension is C<.pir> or C<.pbc>, this file will be loaded
below the directory F<cgi-pir> and the function C<cgi_main> will be
invoked with the query as an argument. 
This functions should return a plain string, which will be sent to the
browser.

F<cgi_main> is called with 3 arguments: a todo/reserved PMC, a string
with the original query and a Hash, with C<key=value> items split by
C<'+'>. C<key> and C<value> are already C<urldecoded>.

  $ cat cgi-pir/foo.pir
  .sub cgi_main
    .param pmc reserved         # TODO
    .param string query		# all after '?':  "foo=1+bar=A"
    .param pmc query_hash       # Hash { foo=>'1', bar=>'A' }
    .return ("<p>foo</p>")      # in practice use a full <html>doc</html>
                                # unless serving XMLHttpRequest's
  .end

The browser request:  

  http://localhost:1234/foo.pir?foo=1+bar=%61

will serve, whatever the C<cgi_main> function returned.

=head1 TODO

make it work on W32/IE

Transcode the received string to ascii, in order to have access to an
implemented 'index' op. Or just use unicode instead.

=head1 SEE ALSO

RFC2616

=head1 AUTHOR

Original author is Markus Amsler - <markus.amsler@oribi.org> 
The code was heavily hacked by bernhard and leo.

=cut

.const string CRLF     = "\r\n"
.const string CRLFCRLF = "\r\n\r\n"
.const string LFLF     = "\n\n"
.const string CRCR     = "\r\r"

.include "stat.pasm"

.sub main :main
    .local pmc sock, work, fp
    .local pmc fp               # read requested files from disk
    .local string address
    .local string buf, req, rep, temp
    .local string meth, url, file_content
    .local int ret
    .local int len, pos, occ1, occ2

    .local string doc_root
    doc_root = "."

    # TODO provide sys/socket constants
    socket sock, 2, 1, 6	# PF_INET, SOCK_STREAM, tcp
    unless sock goto ERR_NO_SOCKET

    # Pack a sockaddr_in structure with IP and port
    .local int port
    port = 1234
    address = sockaddr port, "localhost"
    ret = bind sock, address
    if ret == -1 goto ERR_bind
    $S0 = port
    print "Running webserver on port "
    print $S0
    print " of localhost.\n"
    print "The Parrot documentation can now be accessed at http://localhost:"
    print $S0
    print "\n"
    print "Be sure that the HTML docs have been generated with 'make html'.\n"

    listen ret, sock, 1
NEXT:
    accept work, sock
    req = ""
MORE:
    recv ret, work, buf
    # charset I0, buf
    # charsetname S1, I0
    # print "\nret: "
    # print ret
    # print "\ncharset of buf: "
    # print S1
    # print "\nbuf:"
    # print buf
    # print "\nafter buf"

    if ret <= 0 goto SERVE_REQ
    concat req, buf
    index pos, req, CRLFCRLF
    # print "\npos1:"
    # print pos
    if pos >= 0 goto SERVE_REQ
    index pos, req, LFLF
    # print "\npos2:"
    # print pos
    if pos >= 0 goto SERVE_REQ
    index pos, req, CRCR
    # print "\npos3:"
    # print pos
    if pos >= 0 goto SERVE_REQ
    goto MORE

SERVE_REQ:
#    print "Request:\n"
#    print req
#    print "*******\n"

# parse
# GET the_file HTTP*
    index occ1, req, " "
    substr meth, req, 0, occ1
    inc occ1
    index occ2, req, " ", occ1
    len = occ2 - occ1
    substr url, req, occ1, len

    if meth == "GET" goto SERVE_GET

    print "unknown method:'"
    print meth
    print "'\n"
    close work
    goto NEXT

SERVE_GET:
    .local int is_cgi
    (is_cgi, file_content, len) = check_cgi(url)
    if is_cgi goto SERVE_blob
    # decode the url
    url = urldecode(url)

    # redirect instead of serving index.html
    if url == "/" goto SERVE_docroot

    # Those little pics in the URL field or in tabs
    if url == "/favicon.ico" goto SERVE_favicon

    # try to server a file
    goto SERVE_file

SERVE_file:
    # try to open the file in url
    concat url, doc_root, url
    fp = open url, "<"
    unless fp goto SERVE_404
    len = stat url, .STAT_FILESIZE
    read file_content, fp, len

SERVE_blob:
    # TODO make more subs
    # takes: file_content, len
    rep = "HTTP/1.1 200 OK"
    rep .= CRLF
    rep .= "Server: Parrot-httpd/0.1"
    rep .= CRLF
    rep .= "Content-Length: "
    temp = to_string (len)
    rep .= temp
    rep .= CRLFCRLF
    rep .= file_content
    send ret, work, rep
    # TODO provide a log method
    print "served file '"
    print url
    print "'\n"
    close work
    goto NEXT

SERVE_docroot:
    rep = 'HTTP/1.1 301 Moved Permamently'
    rep .= CRLF
    rep .= 'Location: /docs/html/index.html'
    rep .= CRLF
    rep .= 'Content-Length: '
    file_content = "Please go to <a href='docs/html/index.html'>Parrot Documentation</a>." 
    length len, file_content
    temp = to_string (len)
    concat rep, temp
    concat rep, CRLFCRLF
    concat rep, file_content
    send ret, work, rep
    print "Redirect to 'docs/html/index.hmtl'\n"
    close work
    goto NEXT

SERVE_favicon:
    url = urldecode( '/docs/resources/favicon.ico')
    goto SERVE_file

SERVE_404:
    $S0 = '404 Not found'
    $I0 = length $S0
    rep = 'HTTP1/1 404 Not Found'
    rep .= CRLF
    rep .= 'Content-Length: '
    $S1 = $I0
    rep .= $S1
    rep .= CRLF
    rep .= 'Content-Type: text/plain'
    rep .= CRLFCRLF
    rep .= $S0
    print "File not found: '"
    print url
    print "'\n"
    send ret, work, rep
    goto NEXT

ERR_NO_SOCKET:
    print "Could not open socket.\n"
    print "Did you enable PARROT_NET_DEVEL in include/io_private.h?\n"
    end
ERR_bind:
    print "bind failed\n"
    # fall through
END:
    close sock
    end
.end

.sub to_string
    .param pmc args :slurpy

    .local string ret
    ret = sprintf "%d", args 
    .return( ret )
.end

# convert %xx to char 
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

# if file is *.pir or *.pbc run it as CGI
.sub check_cgi
    .param string url
    $I0 = index url, ".pir"
    if $I0 > 0 goto cgi_1
    $I0 = index url, ".pbc"
    if $I0 > 0 goto cgi_1
    .return (0, '', 0)
cgi_1:
    # file.pir?foo=1+bar=2
    $I0 = index url, '?'
    if $I0 == -1 goto no_query
    .local string file, query
    .local pmc query_hash
    file = substr url, 0, $I0
    inc $I0
    query = substr url, $I0
    # TODO split into a hash, then decode parts
    query_hash = make_query_hash(query)
    query = urldecode(query)
    goto have_query
no_query:
    file = url
    query = ''
    query_hash = new .Hash
have_query:
    # escape %
    file = urldecode(file)
    print "CGI: '"
    print file
    print "' Q: '"
    print query
    print "'\n"
    file = "cgi-pir/" . file
    # TODO stat the file
    load_bytecode file
    .local string result
    null $P0	# not yet
    # TODO catch ex
    result = 'cgi_main'($P0, query, query_hash)
    $I0 = length result
    .return (1, result, $I0)
.end

# split query at '+', make hash from foo=bar items
.sub make_query_hash
    .param string query		# the unescapced one
    .local pmc query_hash, items
    .local string kv, k, v
    query_hash = new .Hash
    items = split '+', query
    .local int i, n
    i = 0
    n = elements items
lp_items:
    kv = items[i]
    $I0 = index kv, "="
    if $I0 == -1 goto no_val
    k = substr kv, 0, $I0
    inc $I0
    v = substr kv, $I0
    v = urldecode(v)
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
