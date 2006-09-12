# Copyright (C) 2006, The Perl Foundation.
# $Id: httpd.pir 14438 2006-09-06 11:59:32Z leo $

=head1 NAME

['HTTP' ; 'Daemon'] - A Simple HTTPD Server

=head1 SYNOPSIS

  load_bytecode "HTTP/Daemon.pir"
  opts = new .Hash
  opts['LocalPort'] = 1234
  opts['LocalAddr'] = 'localhost'
  clid = find_type ['HTTP'; 'Daemon']
  d = new clid, opts
  unless d goto err
  d.'run'()

=head1 TODO

A lot. The code is by now just an objectified version of httpd.pir.

=head1 SEE ALSO

RFC2616, F<examples/io/httpd2.pir>

=head1 AUTHOR

Leopold Toetsch <lt@toetsch.at> - some code based on httpd.pir.

=cut

=head1 Class HTTP; Daemon

=head2 Functions

=over

=item _onload

Called from I<load_bytecode> to create used classes.

=item req_handler(pio, conn)

Called from the asynchronous select code, when data are ready to read
at the pio.

=cut

.sub '_onload' :load
    .local pmc cl
    # server clsass
    cl = newclass ['HTTP'; 'Daemon']
    addattribute cl, 'socket'	# pio where httpd is listening
    addattribute cl, 'opts'     # options TBdoced
    addattribute cl, 'active'   # list of active ClientConns
    addattribute cl, 'to_log'   # list of strings to be logged
    addattribute cl, 'doc_root' # where to serve files from
    
    # client connection
    # XXX this should subclass ParrotIO but opcode or PIO code 
    # just doesn't work with classes
    cl = newclass ['HTTP'; 'Daemon'; 'ClientConn']
    addattribute cl, 'socket'	# the connected pio
    addattribute cl, 'server'	# whom are we working for
    addattribute cl, 'close'	# needs closing after req is handled
    addattribute cl, 'time_stamp'  # timestamp for timeout

    # TODO split into new file, if more mature
    cl = newclass ['HTTP'; 'Message']
    addattribute cl, 'headers'	# hash
    addattribute cl, 'content'	# string

    # Message subclasses
    $P0 = subclass cl, ['HTTP'; 'Request']
    $P0 = subclass cl, ['HTTP'; 'Response']
.end

.namespace ['HTTP'; 'Daemon']

.const string CRLF     = "\r\n"
.const string CRLFCRLF = "\r\n\r\n"
.const string LFLF     = "\n\n"
.const string CRCR     = "\r\r"

.include "stat.pasm"

=back

=head2 Methods

=over

=item __init(args)

Object initializer, takes a hash argument to intialize attributes.

=over

=item LocalPort

Port number to listen.

=item LocalAddr

Address name or IP number to listen.

=item debug

Turn on internal diagnostic messages, printed to stderr.

=item parrot-docs

Redirect to and serve files from F<docs/html>.

=back

=cut

.sub __init :method
    .param pmc args

    .local pmc active
    
    setattribute self, 'opts', args
    active = new .ResizablePMCArray
    setattribute self, 'active', active
    $P0 = new .ResizableStringArray
    setattribute self, 'to_log', $P0
    $P0 = new .String
    $P0 = '.'
    setattribute self, 'doc_root', $P0

    # create socket
    .local pmc sock
    sock = socket 2, 1, 6 	# PF_INET, SOCK_STREAM, tcp
    unless sock goto err_sock
    setattribute self, 'socket', sock

    .local int port
    .local string adr
    port = args['LocalPort']
    adr = args['LocalAddr']

    # bind
    .local string i_addr
    .local int res
    i_addr = sockaddr port, adr
    res = bind sock, i_addr
    if res == -1 goto err_bind

    # listen
    res = listen sock, 1
    if res == -1 goto err_listen

    # add connection
    self.'new_conn'(sock)
    .return()

err_listen:    
err_bind:
    err $I0
    err $S0, $I0
    printerr $S0
    printerr "\n"
    close sock
err_sock:
    $P0 = new .Undef
    setattribute self, 'socket', $P0
.end

=item socket()

Get connected server socket.

=item opts()

Get server options.

=item url(?init?)

Get or set server url, aka document root

=cut

.sub 'socket' :method
    $P0 = getattribute self, 'socket'
    .return ($P0)
.end

.sub 'opts' :method
    $P0 = getattribute self, 'opts'
    .return ($P0)
.end

.sub 'url' :method
    .param string doc_root :optional
    .param int has_dr      :opt_flag
    $P0 = getattribute self, 'doc_root'
    if has_dr goto set_it
    $S0 = $P0
    .return ($S0)
set_it:
    $P0 = doc_root
.end

=item __get_bool()

Vtable method, called from the C<if> or C<unless> opcode. Returns
true, if the daemon object is listening on a socket, that is if the
initialization went ok.

=cut

.sub '__get_bool' :method
    $P0 = getattribute self, 'socket'
    $I0 = istrue $P0
    .return ($I0)
.end


=item run()

Main server runloop.

=cut

.sub 'run' :method
    print "running\n"

loop:
    ## self.'_del_stale_conns'()
    self.'_select_active'()
    # while idle dump the logfile
    self.'_write_logs'()
    sleep 0.5
    goto loop
.end

# === server utils

=item _write_logs()

Called from server runloop. Write log files (currently to stdout
only).

=cut

.sub '_write_logs' :method
    .local pmc to_log
    to_log = getattribute self, 'to_log'
loop:
    # log can fill, while we are running here
    unless to_log goto ex
    $S0 = shift to_log
    print $S0
    goto loop
ex:
.end

=item debug(...)

If debugging is on, concat passed arguments and write that string to
stderr.

=cut

.sub 'debug' :method
    .param pmc args :slurpy

    .local pmc opts
    opts = getattribute self, 'opts'
    $I0 =  opts['debug']
    if $I0 goto do_debug
    .return()
do_debug:
    .local int n
    .local string fmt, res
    n = elements args
    fmt = repeat "%Ss", n
    res = sprintf fmt, args
    printerr res	
.end

=item log(...)

Concat passed arguments and schedule the string for logging.

=cut

.sub 'log' :method
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
    .local pmc to_log
    to_log = getattribute self, 'to_log'
    # Yay! The fun of any async server
    # write to log when we idling
    push to_log, res
.end

# === connection handling

=item _select_active()

Create a select event for all active connections. Called from server
runnloop.

=cut

.sub '_select_active' :method
    .local pmc active, conn, sock
    .local int i, n
    .const .Sub req_handler = "req_handler"
    active = getattribute self, 'active'
    n = elements active
    i = 0
add_lp:
    conn = active[i]
    sock = conn.'socket'()
    add_io_event sock, req_handler, conn, 2	# XXX magic 2
    ## self.'debug'('**select ', i, "\n")
    inc i
    if i < n goto add_lp
.end

=item _del_stale_conns()

Not yet used method to delete old connections for the active set.
Called from server runnloop.

=cut

.sub '_del_stale_conns' :method
    .local int n, now, last
    .local pmc active, conn, sock

    now = time 
    active = getattribute self, 'active'
    n = elements active
    dec n
loop:
    unless n goto done
    conn = active[n]
    last = conn.'time_stamp'()
    $I0 = now - last
    if $I0 < 10 goto keep_it	# TODO ops var
    sock = conn.'socket'()
    close sock
    delete active[n]
    self.'debug'('del stale conn ', n, "\n")
keep_it:
    dec n
    goto loop
done:
.end

=item new_conn(pio)

Add C<pio> to the list of active connections.


=item accept_conn()

Accept a new connection and call C<new_conn> on the accepted socket.

=item del_conn(conn)

Delete connection from the active list

=item exists_conn(conn)

Return true, if the given connection is already active.

=cut

# add coket to active connections
.sub 'new_conn' :method
    .param pmc sock
    .local pmc active, conn
    active = getattribute self, 'active'
    $I0 = find_type ['HTTP'; 'Daemon'; 'ClientConn']
    conn = new $I0, sock
    conn.'server'(self)
    push active, conn
    self.'debug'("new conn\n")
.end

# accept new connection and add to active
.sub 'accept_conn' :method
    .local pmc orig, work
    orig   = getattribute self, 'socket'
    accept work, orig
    self.'new_conn'(work)
.end

# remove work from active connections and close it
.sub 'del_conn' :method
    .param pmc work

    .local pmc active, orig, sock
    .local int i, n
    sock = getattribute work, 'socket'
    close sock
    active = getattribute self, 'active'
loop:
    n = elements active
    i = 0
rem_lp:
    $P0 = active[i]
    eq_addr $P0, work, del_it
    inc i
    if i < n goto rem_lp
del_it:
    delete active[i]
    .return()
not_found:
    self.'debug'("connection not found to delete\n")
.end

# close all sockets
# this needs enabling of SIGHUP in src/events.c but still doesn't
# help against FIN_WAIT2 / TIME_WAIT state of connections
.sub 'shutdown' :method
    .local pmc active, sock
    active = getattribute self, 'active'
rem_lp:
    $P0 = pop active
    sock = $P0.'socket'()
    close sock
    if active goto rem_lp
.end

# if work is the original httpd conn, it's a new connection
.sub 'exists_conn' :method
    .param pmc work

    .local pmc active, orig
    active = getattribute self, 'active'
    orig = active[0]
    ne_addr work, orig, yes
    .return (0)
yes:
    .return (1)
.end


# reguest handler sub - not a method
# this is called from the async select code, i.e from the event
# subsystem
.sub req_handler
    .param pmc work	# a pio
    .param pmc conn     # Conn obj

    .local pmc srv, req

    srv = conn.'server'()
    $I0 = srv.'exists_conn'(conn)
    if $I0 goto do_read
    .return srv.'accept_conn'()

do_read:    
    req = conn.'get_request'()
    unless req goto close_it
    $S0 = req.'method'()
    if $S0 == 'GET' goto serve_get
    printerr 'unknown method: '
    printerr $S0
    printerr "\n"
close_it:
    srv.'del_conn'(conn)
    .return()
serve_get:
    .local string file
    file = req.'uri'()
    conn.'send_file_response'(file)
.end


.namespace ['HTTP'; 'Daemon'; 'ClientConn']

=head1 Class HTTP; Daemon

=head2 Methods

=over

=item __init(pio)

Create a new connection object with the given socket pio.

=cut

.sub __init :method
    .param pmc sock
    setattribute self, 'socket', sock
    $P0 = new .Boolean
    setattribute self, 'close', $P0
    $P0 = new .Integer
    time $I0
    $P0 = $I0
    setattribute self, 'time_stamp', $P0
.end

=item socket()

Get connection socket.

# get socket
.sub 'socket' :method
    $P0 = getattribute self, 'socket'
    .return ($P0)
.end

=item server(?srv?)

Get or set server object.

=item timestamp(?ticks?)

Get or set the timestamp of this connection.

=cut

.sub 'server' :method
    .param pmc sv      :optional
    .param int has_sv  :opt_flag
    if has_sv goto set_it
    sv = getattribute self, 'server'
    .return (sv)
set_it:
    setattribute self, 'server', sv
.end

# get/set timestamp
.sub 'time_stamp' :method
    .param int ts      :optional
    .param int has_ts  :opt_flag
    $P0 = getattribute self, 'time_stamp'
    if has_ts goto set_it
    .return ($P0)
set_it:
    $P0 = ts
.end

=item get_request

Read client request, return Request obj. Currently only C<GET> is
supported.

=cut

.sub 'get_request' :method

    .local pmc srv, req
    .local string req_str

    .local int now
    now = time
    self.'time_stamp'(now)
    srv = self.'server'()
    srv.'debug'("reading from work\n")
    req_str = self.'_read'()
    $I0 = find_type ['HTTP'; 'Request']
    req = new $I0
    req.'parse'(req_str)
    .return (req)
.end

=item _read

Internal method to read from the client. It returns a request string.

=cut

.sub '_read' :method
    .local int res, do_close, pos
    .local string buf, req
    .local pmc sock, srv

    srv = self.'server'()
    req = ''
    do_close = 0
    sock = self.'socket'()
    # TODO keep a buffer and a state in Conn
    # check method, read Content-Length if needed and read
    # until message is complete
MORE:
    res = recv sock, buf
    srv.'debug'("**read ", res, " bytes\n")
    if res > 0 goto not_empty
    do_close = 1
    if res <= 0 goto done
not_empty:
    concat req, buf
    index pos, req, CRLFCRLF
    if pos >= 0 goto have_hdr
    index pos, req, LFLF
    if pos >= 0 goto have_hdr
    index pos, req, CRCR
    if pos >= 0 goto have_hdr
    goto MORE
have_hdr:
    # TODO read content if any
done:
    $P0 = getattribute self, 'close'
    $P0 = do_close
    .return (req)
.end

=item send_respons(resp)

Send the response back to the client. Argument is a response object.

=item send_file_respons(url)

Slurp the C<url> and send the response back to the client.
TODO doc CGI urls.

=cut

.sub 'send_response' :method
    .param pmc resp
    .local string rep
    .local pmc sock
    sock = self.'socket'()
    rep = resp.'as_string'()
    $I0 = send sock, rep	# XXX don't ignore
.end

.sub 'send_file_response' :method
    .param string url

    .local string file_content, temp
    .local int len
    .local pmc srv, fp

    srv = self.'server'()
    goto SERVE_GET

DONE:
    .local int do_close
    $P0 = getattribute self, 'close'
    do_close = $P0
    if do_close goto close_it
    .return()
close_it:
    srv.'debug'("******* closed work\n")
    srv.'del_conn'(self)
    .return()

SERVE_GET:
    .local int is_cgi
    .local pmc resp, opts
    .local string doc_root

    srv.'debug'("req url: ", url, "\n")

    $I0 = find_type ['HTTP'; 'Response']
    resp = new $I0

    opts = srv.'opts'()
    $I0 = opts['parrot-docs']
    if $I0 goto parrot_docs

    if url != "/" goto no_sl
    url = '/index.html'
no_sl:
    goto normal

parrot_docs:
    if url == "/" goto SERVE_docroot

    # Those little pics in the URL field or in tabs
    # XXX only in parrot mode
    if url != "/favicon.ico" goto no_fav
    url = '../resources/favicon.ico'
    goto SERVE_file
no_fav:

normal:
    doc_root = srv.'url'()
    concat url, doc_root, url

    (is_cgi, file_content, len) = self.'check_cgi'(url)
    if is_cgi goto SERVE_blob
    # decode the url
    url = urldecode(url)

SERVE_file:
    # try to open the file in url
    fp = open url, "<"
    unless fp goto SERVE_404
    len = stat url, .STAT_FILESIZE
    read file_content, fp, len
    close fp

SERVE_blob:
    # TODO make more subs
    # takes: file_content, len
    resp.'code'(200)
    temp = to_string (len)
    resp.'header'('Server' => 'Parrot-httpd/0.2', 'Content-Length' => temp)
    resp.'content'(file_content)
    self.'send_response'(resp)
    srv.'log'(200, ", ", url)
    goto DONE

SERVE_docroot:
    file_content = "Please go to <a href='docs/html/index.html'>Parrot Document ation</a>."
    length len, file_content
    temp = to_string (len)
    resp.'code'(301)
    resp.'header'('Location' => '/docs/html/index.html')
    resp.'header'('Server' => 'Parrot-httpd/0.2', 'Content-Length' => temp)
    resp.'content'(file_content)
    self.'send_response'(resp)
    srv.'log'(301, ", ", url, " - Redirect to 'docs/html/index.hmtl'")
    goto DONE

SERVE_404:
    resp.'code'(404)
    $S0 = '404 Not found'
    $I0 = length $S0
    temp = $I0
    resp.'header'('Server' => 'Parrot-httpd/0.2', 'Content-Length' => temp)
    resp.'content'($S0)
    self.'send_response'(resp)
    srv.'log'(404, ", ", url)
    goto DONE
.end

=back

=head2 Utility functions

=over

=item to_string

=item urldecode

=item hex_to_int

=cut

# util functions
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
.sub check_cgi :method
    .param string url
    .local int pos
    # file.pir?foo=1+bar=2
    pos = index url, '.pir?'
    if pos > 0 goto cgi_1
    pos = index url, '.pbc?'
    if pos > 0 goto cgi_1
    .return (0, '', 0)
cgi_1:
    .local string file, query
    .local pmc query_hash
    pos += 4
    file = substr url, 0, pos
    inc pos
    query = substr url, pos
    # TODO split into a hash, then decode parts
    query_hash = make_query_hash(query)
    query = urldecode(query)
    # escape %
    file = urldecode(file)
    #self.'debug'("CGI: '", file, "' Q: '", query, "'\n")
    file = "cgi-pir/" . file
    # TODO stat the file
    load_bytecode file
    .local string result
    # TODO catch ex
    result = 'cgi_main'(self, query, query_hash)
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

=back

=head1 Class HTTP;Message

TBD

=cut

.namespace ['HTTP'; 'Message']
.sub __init :method
    $P0 = new .OrderedHash
    setattribute self, 'headers', $P0
    $P0 = new .String
    setattribute self, 'content', $P0
.end

.sub 'headers' :method
    $P0 = getattribute self, 'headers'
    .return ($P0)
.end

.sub 'content' :method
    .param string c    :optional
    .param int has_c   :opt_flag
    $P0 = getattribute self, 'content'
    if has_c goto set_it
    .return ($P0)
set_it:
    $P0 = c
.end

.sub 'parse' :method
    .param string buf
    .local int eol, len, pos, sp
    .local string line, rest, key, value
    .local pmc hdrs

    hdrs = getattribute self, 'headers'
    len = length buf
    pos = 0
loop:
    if pos >= len goto done
    eol = index buf, "\r", pos
    if eol != -1 goto is_cr
    eol = index buf, "\n", pos
is_cr:
    if pos == eol goto rest_is_content
    line = substr buf, pos, eol
    sp =  index line, ' ', pos
    key = substr line, pos, sp
    inc sp
    $I0 = eol - sp
    value = substr line, sp, $I0
    # TODO continuation lines, multiple entries
    # TODO normalize keys
    hdrs[key] = value
    inc eol
    $S0 = buf[eol]
    if $S0 != "\n" goto no_nl
    inc eol
no_nl:
    pos = eol
    goto loop

rest_is_content:
    inc pos
    $S0 = buf[pos]
    if $S0 != "\n" goto set_content
    inc pos
set_content:
    rest = substr buf, pos

    $P0 = getattribute self, 'content'
    $P0 = rest

done:
.end


=head1 Class HTTP;Request

TBD

=cut

.namespace ['HTTP'; 'Request']

.sub 'method' :method
    .local pmc hdrs
    hdrs = self.'headers'()
    $I0 = exists hdrs['GET']
    unless $I0 goto no_get
    .return ('GET')
no_get:
    .return ('')
.end

.sub __get_bool :method
    .local pmc hdrs
    hdrs = self.'headers'()
    $I0 = elements hdrs
    .return ($I0)
.end

.sub 'uri' :method
    .local pmc hdrs, ar
    .local string val
    hdrs = self.'headers'()
    val = hdrs[0]
    ar = split ' ', val
    $P0 = ar[0]
    .return ($P0)
.end

.namespace ['HTTP'; 'Response']

.sub 'header' :method
    .param pmc init   :slurpy :named
    .local pmc it, hdrs
    hdrs = getattribute self, 'headers'
    it = iter init
loop:
    unless it goto ex
    $S0 = shift it
    if $S0 != 'code' goto other
    self.'code'($S0)
    goto loop
other:
    $P0 = init[$S0]
    hdrs[$S0] = $P0
    goto loop
ex:
.end

.sub 'code' :method
    .param string ccc 
    .const string proto = 'HTTP/1.1 '

    .local string line
    .local pmc hdrs
    line = proto
    line .= ccc
    if ccc != '200' goto no_200
    line .= ' OK'
    goto fin
no_200:
    if ccc != '301' goto no_301
    line .= ' Moved Permamently'
    goto fin
no_301:
    if ccc != '404' goto no_404
    line .= ' Not Found'
    goto fin
no_404:
    line .= " ??"
fin:
    line .= CRLF
    hdrs = getattribute self, 'headers'
    hdrs[0] = line
.end

.sub 'as_string' :method
    .local pmc hdrs, content, it
    .local string line, k, v
    hdrs = getattribute self, 'headers'
    content = getattribute self, 'content'
    it = iter hdrs
    # resp status
    k = shift it
    line = it[k]
loop:
    unless it goto done
    k = shift it
    v = hdrs[k]
    line .= k
    line .= ': '
    line .= v
    line .= CRLF
    goto loop
done:
    line .= CRLF
    $S0 = content
    line .= $S0
    .return (line)
.end


