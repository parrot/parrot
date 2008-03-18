
=head1 NAME

TCPStream

=head1 SYNOPSIS

  .sub main :main
      load_bytecode 'library/tcpstream.pir'

      .local pmc stream
      stream = new 'TCPStream'
      stream.'connect'("www.google.com", 80)

      stream.'say'("GET / HTTP/1.0")
      stream.'say'("User-agent: Parrot")
      stream.'say'("")

      $S0 = stream.'slurp'()
      print $S0

      stream.'close'()
  .end

=head1 DESCRIPTION

This is a high-level sockets library designed to mimic Tcl's socket builtins. As
such, it uses C<print> and C<say> instaed of C<send> and C<readline> and
C<slurp> instead of C<recv>.

=head1 VTABLE FUNCTIONS

=over 4

=cut

.namespace ['TCPStream']

.include 'sockets.pasm'

.sub class_init :load :init :anon
    .local pmc class
    class = newclass "TCPStream"

    addattribute class, '$.buffer'
    addattribute class, '$.socket'
.end

=item C<init>

Iniitialize a TCPStream object (create a socket and a buffer).

=cut

.sub init :anon :vtable :method
    .local pmc buffer
    buffer = new 'String'
    buffer = ''

    .local pmc sock
    sock  = socket .AF_INET, .SOCK_STREAM, .IPPROTO_IP

    setattribute self, '$.buffer', buffer
    setattribute self, '$.socket', sock
.end

=item C<init_pmc>

Initialize a TCPStream object from an already pre-existing socket. This can be
use to create servers, among other things.

=cut

.sub init_pmc :anon :vtable :method
    .param pmc sock

    .local pmc buffer
    buffer = new 'String'
    buffer = ''

    setattribute self, '$.buffer', buffer
    setattribute self, '$.socket', sock
.end

=item C<get_bool>

Returns whether or not this socket has data waiting to be read.

=cut

.sub get_bool :anon :vtable :method
    .local pmc buffer
    buffer = getattribute self, '$.buffer'
    if buffer != "" goto true

    .local pmc sock
    .local int bytes
    sock  = getattribute self, '$.socket'
    bytes = recv sock, $S0
    if bytes == 0 goto false
    buffer .= $S0
    goto true

false:
    .return(0)

true:
    .return(1)
.end

=back

=head1 METHODS

=over 4

=item C<void close()>

Closes the socket.

=cut

.sub close :method
    .local pmc sock
    sock = getattribute self, '$.socket'

    close sock
.end

=item C<void connect(string host, int port)>

Connects to a host/port.

Throws an exception if unable to connect.

=cut

.sub connect :method
    .param string host
    .param int    port

    .local string address
    .local pmc    sock
    address = sockaddr port, host
    sock    = getattribute self, '$.socket'

    .local int ret
    ret = connect sock, address
    if ret == -1 goto cant_connect

    .return()

cant_connect:
    .local pmc excep
    excep    = new 'Exception'
    excep[0] = "Can't connect socket"
    throw excep
.end

=item C<void flush()>

=cut

.sub flush :method
.end

=item C<string readline()>

Reads and returns up to (and excluding) an end-of-line character and discards
the end-of-line character.

=cut

.sub readline :method
    .local int idx
    .local pmc buffer
    .local string strbuf
    buffer = getattribute self, '$.buffer'
    strbuf = buffer
    idx    = index strbuf, "\n"
    if idx != -1 goto have_newline

    .local int ret, len, bytes
    .local pmc sock
    sock = getattribute self, '$.socket'
    len  = length strbuf
loop:
    ret = poll sock, 1, 0, 3
    unless ret goto done

    bytes = recv sock, $S0
    unless bytes goto done
    strbuf .= $S0
    idx = index strbuf, "\n", len
    if idx != -1 goto have_newline
    $I0 = length $S0
    len += $I0
    if bytes goto loop

done:
    buffer = ""
    .return(strbuf)

have_newline:
    inc idx
    $S0 = substr strbuf, 0, idx, ""
    buffer = strbuf
    chopn $S0, 1
    .return($S0)
.end

=item C<void say(string msg)>

Print C<msg> and an end-of-line character to the socket.

=cut

.sub say :method
    .param string msg

    .local pmc sock
    sock = getattribute self, '$.socket'

    .local int ret
    msg .= "\n"
    ret = send sock, msg
    if ret == -1 goto cant_send

    .return()

cant_send:
    .local pmc excep
    excep    = new 'Exception'
    excep[0] = "Can't send to socket"
    throw excep
.end

=item C<string slurp()>

Return all the data in the socket.

=cut

.sub slurp :method
    .local pmc sock, buffer
    sock   = getattribute self, '$.socket'
    buffer = getattribute self, '$.buffer'

    .local int ret, bytes
loop:
    ret = poll sock, 1, 0, 3
    unless ret goto done

    bytes = recv sock, $S0
    buffer .= $S0
    if bytes goto loop

done:
    $S0 = buffer
    buffer = ""
    .return($S0)
.end

=back

=head1 AUTHOR

Matt Diephouse <matt@diephouse.com>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
