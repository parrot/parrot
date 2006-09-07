# Copyright (C) 2006, The Perl Foundation.
# $Id: httpd.pir 14438 2006-09-06 11:59:32Z leo $

=head1 NAME

examples/io/httpd2.pir - HTTP server

=head1 SYNOPSIS

  $ ./parrot examples/io/httpd2.pir

=head1 DESCRIPTION

A very tiny HTTP-Server. It currently only understands the GET method.
It's a nice way of testing pretty much all IO functions.
By default (and not yet configurable) it binds to localhost:1234. 

Differently to httpd.pir, this version is using asynchronous select
and has a some more modular code base.

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

Leopold Toetsch <lt@toetsch.at> - some code base on httpd.pir.

=cut

.const string CRLF     = "\r\n"
.const string CRLFCRLF = "\r\n\r\n"
.const string LFLF     = "\n\n"
.const string CRCR     = "\r\r"

.include "stat.pasm"

.sub main :main
    .local pmc sock
    .local string address
    .local int ret


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
    .const .Sub req_handler = "req_handler"
    .local pmc active
    active = new .ResizablePMCArray
    push active, sock
    .local int i, n
loop:
    n = elements active
    i = 0
add_lp:
    $P0 = active[i]
    add_io_event $P0, req_handler, active, 2
    inc i
    if i < n goto add_lp
    sleep 0.1
    goto loop
ERR_NO_SOCKET:
    printerr "Could not open socket.\n"
    printerr "Did you enable PARROT_NET_DEVEL in include/io_private.h?\n"
    end
ERR_bind:
    printerr "bind failed\n"
    # fall through
END:
    close sock
    end
.end

.sub 'debug'
    .param pmc args :slurpy

    .local int n
    .local string fmt, res
    n = elements args
    fmt = repeat "%Ss", n
    res = sprintf fmt, args
    ## printerr res	TODO conf opt
.end

.sub 'log'
    .param pmc args :slurpy

    .local int n, now
    .local string fmt, res, t
    n = elements args
    n += 3
    now = time
    $S0 = gmtime now
    chopn $S0, 2	# XXX why 2?
    unshift args, ", "
    unshift args, $S0
    push args, "\n"
    fmt = repeat "%Ss", n
    res = sprintf fmt, args
    print res
.end

.sub req_handler
    .param pmc work
    .param pmc active

    .local pmc fp, orig
    .local int ret
    .local string buf, req, rep, temp
    .local string meth, url, file_content
    .local int len, pos, occ1, occ2, do_close

    orig = active[0]
    ne_addr work, orig, do_read
    'debug'("accept new conn\n")
    accept work, orig
    push active, work
    .return()

do_read:    
    'debug'("reading from work\n")
    req = ""
    do_close = 0
MORE:
    recv ret, work, buf
    ## read buf, work, 8192
    ## ret = length buf
    'debug'("**read ", ret, " bytes\n")

    if ret >= 0 goto no_close
    do_close = 1
no_close:
    if ret <= 0 goto close_it
    concat req, buf
    index pos, req, CRLFCRLF
    if pos >= 0 goto SERVE_REQ
    index pos, req, LFLF
    if pos >= 0 goto SERVE_REQ
    index pos, req, CRCR
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

    'debug'("unknown method:'", meth, "'\n")
DONE:
    if do_close goto close_it
    .return()
close_it:
    'debug'("******* closed work\n")
    .local int i, n
    close work
loop:
    n = elements active
    i = 0
rem_lp:
    $P0 = active[i]
    eq_addr $P0, work, del_it
    inc i
    if i < n goto rem_lp
    goto not_found
del_it:
    delete active[i]
    .return()
not_found:
    'debug'("nothing found to splice???\n")
    .return()

SERVE_GET:
    .local int is_cgi
    'debug'("req url: ", url, "\n")
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
    .local string doc_root
    doc_root = "."
    concat url, doc_root, url
    fp = open url, "<"
    unless fp goto SERVE_404
    len = stat url, .STAT_FILESIZE
    read file_content, fp, len
    close fp

SERVE_blob:
    # TODO make more subs
    # takes: file_content, len
    rep = "HTTP/1.1 200 OK"
    rep .= CRLF
    rep .= "Server: Parrot-httpd/0.2"
    rep .= CRLF
    rep .= "Content-Length: "
    temp = to_string (len)
    'debug'("Content-Length: ", temp, "\n")
    rep .= temp
    rep .= CRLFCRLF
    rep .= file_content
    send ret, work, rep
    'log'(200, ", ", url)
    goto DONE

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
    'log'(301, ", ", url, " - Redirect to 'docs/html/index.hmtl'")
    goto DONE

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
    'log'(404, ", ", url)
    send ret, work, rep
    goto DONE
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
    'debug'("CGI: '", file, "' Q: '", query, "'\n")
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
