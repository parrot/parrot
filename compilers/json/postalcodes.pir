#!../../parrot
# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

postalcodes.pir

=head1 SYNOPSIS

    % ./parrot postalcodes.pir <postal>

=head1 DESCRIPTION

Given a postal code (like, '06382'), print some information about various
places with that code from around the world.

=cut

.sub _main :main
    .param pmc argv

    .local string postal, url

    $I0 = elements argv
    if $I0 != 2 goto bad_args

    postal = argv[1]

    .local pmc sock
    .local string address, buf, json_result
    json_result = ''
    .local int ret
    .local int len

    # create the socket handle 
    socket sock, 2, 1, 0
    unless sock goto ERR

    # Pack a sockaddr_in structure with IP and port
    sockaddr address, 80, 'ws.geonames.org'
    connect ret, sock, address 

    .local string url 
    url = 'http://ws.geonames.org/postalCodeSearchJSON?maxRows=10&postalcode='
    url .= postal
 
    $S0 = 'GET '
    $S0 .= url
    $S0 .= " HTTP/1.0\nUser-agent: Parrot\n\n" 
    send ret, sock, $S0
    poll ret, sock, 1, 5, 0
MORE:
    recv ret, sock, buf 
    if ret < 0 goto END
    json_result .= buf
    goto MORE 
ERR:
    print "Socket error\n"
    end
END:
    close sock 

    $I1 = find_charset 'unicode'
    trans_charset json_result, $I1

    # Strip off http headers.
    $I0 = index json_result, "\r\n\r\n"
    substr json_result, 0, $I0, ""

    load_bytecode 'compilers/json/JSON.pbc'
    $P1 = compreg 'JSON'
    $P2 = $P1(json_result)

    $P3 = $P2['error']
    unless null $P3 goto bad_code

    $P2 = $P2['postalCodes']
    .local pmc iter, code
    iter = new .Iterator, $P2
  
 code_loop:
    push_eh code_end
      code = shift iter
    clear_eh
    unless code goto code_end 

    $S0 = code['placeName']
    print "Place: "
    print $S0
    print ', '
    $S0 = code['countryCode']
    print $S0
    print '; Code: '
    $S0 = code['postalCode']
    print $S0
    print "\n"  
    
    goto code_loop
 code_end:

    end

bad_args:
    say "Usage: postcalcodes.pir <postal>"

bad_code:
    say $P3
.end
