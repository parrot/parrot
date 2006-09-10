.sub cgi_main 
    .param pmc    conn
    .param string query
    .param pmc    query_hash
    ##trace 1

    .local string file, res, slides
    file = query_hash['f'] 
    res = 'file nof found'
    res .= file
    slides = _read_file(conn, file)
    unless slides goto err
    .local int p
    p = query_hash['p'] 
    res = _find_slides(conn, slides, p)
err:
    trace 0
    .return (res)
.end

.sub _read_file
    .param pmc conn
    .param string file
    $P0 = getclass 'ParrotIO'
    $S0 = $P0.'slurp'(file)
    .return ($S0)
.end

.sub _find_slides
    .param pmc conn
    .param string slides
    .param int part

    .local int n, p, pos1, pos2
    .local string tag
    n = 0
    pos1 = index slides, '<body', 0
    if pos1 == -1 goto nobody
    pos1 += 6
    goto loop
nobody:
    pos1 = 0
loop:
    (pos1, p, $S0) = _next_tag(slides, pos1)
loop2:
    (pos2, p, tag) = _next_tag(slides, p)
    if $S0 == '' goto serve_eof	# at eof
    if part == n goto serve_it
    if tag == 'ul' goto loop2
    if tag == 'ol' goto loop2
    inc n
    if tag == 'p' goto loop2
    if tag == 'h2' goto loop2
    if tag == 'h3' goto loop2
    if tag == 'li' goto loop2
    pos1 = pos2
    goto loop

serve_eof:
    $S0 = '<p>The End ('
    $S1 = part
    $S0 .= $S1
    $S0 .= ')</p>'
    goto ret_it
serve_it:
    $I0 = pos2 - pos1
    $S0 = substr slides, pos1, $I0
ret_it:
    .local pmc srv
    if null conn goto no_conn
    srv = conn.'server'()
    srv.'debug'("CGI: pos1 ", pos1, " pos2 ", p, " -: ", $S0)
no_conn:
    .return ($S0)
.end

.sub _next_tag
    .param string slides
    .param int pos1

    .local int p, p1
loop:
    p = index slides, '<', pos1
    if p == -1 goto eof
    p1 = p + 1
    $S0 = slides[p1]
    if $S0 == '/' goto ignore
    # got open tag - ignore <b>, <i>, <tt> ...
    if $S0 == 'b' goto ignore
    if $S0 == 'i' goto ignore
    if $S0 == 't' goto ignore
    pos1 = p
    p = index slides, '>', p1
    .local string tag
    $I0 = p - p1
    tag = substr slides, p1, $I0
    inc p
    .return (pos1, p, tag)

ignore:
    pos1 = p1
    goto loop
eof:
    p = length slides
    .return (pos1, p, '')
.end

# DEBUG HELPER
.sub test :main
    .param pmc argv
    null $P0
    $P1 = new .Hash
    $P1['f'] = '1.html'
    $S0 = argv[1]
    $I0 = $S0
    $P1['p'] = $I0
    $S0 = cgi_main($P0, '', $P1)
    print $S0
.end
