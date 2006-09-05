# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/io/httpd.pir - HTTP server

=head1 SYNOPSIS

    % ./parrot examples/io/httpd.pir

=head1 DESCRIPTION

A very tiny HTTP-Server. It currently only understands the GET method.
It's a nice way of testing pretty much all io functions.

By default it binds to localhost:1234, and serves the HTML Documentation
in ./docs/html. Make sure you have built them with

    % make html

After that you can browse the documentation with

    http://localhost:1234

which redirects to

    http://localhost:1234/docs/html/index.html

=head1 TODO

make it work on W32/IE

Transcode the received string to ascii, in order to have access to an
implemented 'index' op. Or just use unicode instead.

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

    socket sock, 2, 1, 6	# PF_INET, SOCK_STREAM, tcp
    unless sock goto ERR_NO_SOCKET

    # Pack a sockaddr_in structure with IP and port
    .local int port
    port = 1234
    address = sockaddr port, "localhost"
    ret = bind sock, address
    $S0 = port
    print "Running webserver on port "
    print $S0
    print " of localhost.\n"
    print "The Parrot documentation can now be accessed at http://localhost:"
    print $S0
    print "\n"
    print "Be sure that the HTML docs have been generated with 'make html'.\n"

NEXT:
    listen ret, sock, 5
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
# split is not implemented, so parse it the old way
# GET the method and file
    index occ1, req, " "
    inc occ1
    index occ2, req, " ", occ1
    len = occ1 - 1
    substr meth, req, 0, len
    len = occ2 - occ1
    substr url, req, occ1, len

    if meth == "GET" goto SERVE_GET

    print "unknown method:'"
    print meth
    print "'\n"
    close work
    goto NEXT

SERVE_GET:
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
    rep = "HTTP/1.x 200 OK"
    rep .= CRLF
    rep .= "Server: Parrot-httpd/0.1"
    rep .= CRLF
    rep .= "Content-Length: "
    temp = to_string (len)
    rep .= temp
    rep .= CRLFCRLF
    rep .= file_content
    send ret, work, rep
    print "served file '"
    print url
    print "'\n"
    close work
    goto NEXT

SERVE_docroot:
    rep = 'HTTP1/1 301 Moved Permamently'
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
END:
    close sock
    end
.end


.sub to_string
    .param int n

    .local string ret
    .local string char
    .local int rest
    ret = ""
NEXT_CHAR:
    rest = n % 10
    n -= rest
    n /= 10
    rest += 48
    chr char, rest
    ret .= char
    if n > 0 goto NEXT_CHAR

    .return( ret )
.end


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
