# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

examples/io/get.pir - LWP client

=head1 SYNOPSIS

    % ./parrot examples/io/get.pir http://www.parrot.org/ > parrot_home.html

=head1 DESCRIPTION

LWP client, grabs an URL.

Supported protocols : file, http

The HTTP redirection is supported (for example http://fperrad.googlepages.com/home).

=cut

.sub 'main' :main
    .param pmc args
    load_bytecode 'LWP/UserAgent.pir'
    $S0 = shift args
    .local string url
    url = shift args
    .local pmc ua, response
    ua = new ['LWP';'UserAgent']
    ua.'env_proxy'()
    ua.'show_progress'(1)
    response = ua.'get'(url, 'close' :named('Connection'))
    $S0 = response.'content'()
    say $S0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
