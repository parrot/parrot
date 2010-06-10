#!../../parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

postalcodes.pir - Show info about a postal code

=head1 SYNOPSIS

    % parrot postalcodes.pir <postal>

=head1 DESCRIPTION

Given a postal code (e.g. '06382'), print some information about various
places with that code from around the world.

=cut

.include 'socket.pasm'
.loadlib 'io_ops'

.sub _main :main
    .param pmc argv

    .local string postal, url

    $I0 = elements argv
    if $I0 != 2 goto bad_args

    postal = argv[1]

    .local pmc sock, address
    .local string buf, json_result
    json_result = ''
    .local int ret
    .local int len

    # create the socket handle
    sock = new 'Socket'
    sock.'socket'(.PIO_PF_INET, .PIO_SOCK_STREAM, .PIO_PROTO_TCP)

    # Pack a sockaddr_in structure with IP and port
    address = sock.'sockaddr'('ws.geonames.org', 80)
    ret = sock.'connect'(address)

    .local string url
    url = 'http://ws.geonames.org/postalCodeSearchJSON?maxRows=10&postalcode='
    url .= postal

    $S0 = 'GET '
    $S0 .= url
    $S0 .= " HTTP/1.0\r\nUser-agent: Parrot\r\n\r\n"
    ret = sock.'send'($S0)
MORE:
    buf = sock.'recv'()
    ret = length buf
    if ret <= 0 goto END
    json_result .= buf
    goto MORE
ERR:
    print "Socket error\n"
    end
END:
    close sock

    $I1 = find_charset 'unicode'
    json_result = trans_charset json_result, $I1

    # Strip off http headers.
    $I0 = index json_result, "\r\n\r\n"
    json_result = replace json_result, 0, $I0, ""

    load_language 'data_json'
    $P1 = compreg 'data_json'
    push_eh bad_code
    $P2 = $P1.'compile'(json_result)
    pop_eh
    $P3 = $P2()
    $P4 = $P3['postalCodes']
    .local pmc it, code
    it = iter $P4

 code_loop:
    push_eh code_end
      code = shift it
    pop_eh
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
    .return()

bad_code:
    say $P2
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
