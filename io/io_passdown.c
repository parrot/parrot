/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

io/io_passdown.c - IO layer handling

=head1 DESCRIPTION

This is a set of helper functions which search for the first
implementation of a function in the layer-stack, call it with the
appropriate arguments and return the value returned.

=head2 Functions

=over 4

=cut

*/

#include <parrot/parrot.h>
#include "io_private.h"

/*

=item C<ParrotIO *
PIO_open_down(theINTERP, ParrotIOLayer * layer, const char * name,
              INTVAL flags)>

Looks for the implementation of C<Open> and calls it if found, returning
its return value.

Returns C<NULL> if no implementation is found.

=cut

*/

ParrotIO *
PIO_open_down(theINTERP, ParrotIOLayer * layer, const char * name,
              INTVAL flags)
{
    while (layer) {
        if (layer->api->Open) {
            return layer->api->Open(interpreter, layer, name, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

/*

=item C<ParrotIO *
PIO_open_async_down(theINTERP, ParrotIOLayer * layer, const char * name,
                    const char * mode, DummyCodeRef * dummy)>

Looks for the implementation of C<Open_ASync> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

=cut

*/

ParrotIO *
PIO_open_async_down(theINTERP, ParrotIOLayer * layer, const char * name,
                    const char * mode, DummyCodeRef * dummy)
{
    while (layer) {
        if (layer->api->Open_ASync) {
            return layer->api->Open_ASync(interpreter, layer, name, mode,
                                          dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

/*

=item C<ParrotIO *
PIO_fdopen_down(theINTERP, ParrotIOLayer * layer, PIOHANDLE fd, INTVAL flags)>

Looks for the implementation of C<FDOpen> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

=cut

*/

ParrotIO *
PIO_fdopen_down(theINTERP, ParrotIOLayer * layer, PIOHANDLE fd, INTVAL flags)
{
    while (layer) {
        if (layer->api->FDOpen) {
            return layer->api->FDOpen(interpreter, layer, fd, flags);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return NULL;
}

/*

=item C<INTVAL
PIO_close_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)>

Looks for the implementation of C<Close> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

=cut

*/

size_t
PIO_peek_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, STRING ** buf)
{
    while (layer) {
        if (layer->api->Peek) {
            return layer->api->Peek(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }

    /* No layer found */
    return 0;
}


INTVAL
PIO_close_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Close) {
            return layer->api->Close(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

=item C<size_t
PIO_write_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, STRING *)>

Looks for the implementation of C<Write> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

=cut

*/

size_t
PIO_write_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, STRING *s)
{
    while (layer) {
        if (layer->api->Write) {
            return layer->api->Write(interpreter, layer, io, s);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<size_t
PIO_write_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                     STRING *s, DummyCodeRef *dummy)>

Looks for the implementation of C<WriteASync> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

=cut

*/

size_t
PIO_write_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                     STRING *s, DummyCodeRef *dummy)
{
    while (layer) {
        if (layer->api->Write_ASync) {
            return layer->api->Write_ASync(interpreter, layer, io, s, dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<size_t
PIO_read_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, void * buf,
              size_t len)>

Looks for the implementation of C<Read> and calls it if found, returning
its return value.

Returns C<0> if no implementation is found.

=cut

*/

size_t
PIO_read_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, STRING ** buf)
{
    while (layer) {
        if (layer->api->Read) {
            return layer->api->Read(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<size_t
PIO_read_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                    STRING ** buf, DummyCodeRef *dummy)>

Looks for the implementation of C<Read_ASync> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

=cut

*/

size_t
PIO_read_async_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                    STRING ** buf, DummyCodeRef *dummy)
{
    while (layer) {
        if (layer->api->Read_ASync) {
            return layer->api->Read_ASync(interpreter, layer, io, buf, dummy);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<INTVAL
PIO_flush_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)>

Looks for the implementation of C<Flush> and calls it if found,
returning its return value.

Returns C<0> if no implementation is found.

=cut

*/

INTVAL
PIO_flush_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Flush) {
            layer->api->Flush(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<PIOOFF_T
PIO_seek_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, PIOOFF_T offset,
              INTVAL whence)>

Looks for the implementation of C<Seek> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

=cut

*/

PIOOFF_T
PIO_seek_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io, PIOOFF_T offset,
              INTVAL whence)
{
    while (layer) {
        if (layer->api->Seek) {
            return layer->api->Seek(interpreter, layer, io, offset, whence);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

=item C<PIOOFF_T
PIO_tell_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)>

Looks for the implementation of C<Tell> and calls it if found, returning
its return value.

Returns C<0> if no implementation is found.

=cut

*/

PIOOFF_T
PIO_tell_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Tell) {
            return layer->api->Tell(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return 0;
}

/*

=item C<INTVAL
PIO_setbuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                size_t bufsize)>

Looks for the implementation of C<SetBuf> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

=cut

*/

INTVAL
PIO_setbuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io,
                size_t bufsize)
{
    while (layer) {
        if (layer->api->SetBuf) {
            return layer->api->SetBuf(interpreter, layer, io, bufsize);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

=item C<INTVAL
PIO_setlinebuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)>

Looks for the implementation of C<SetLineBuf> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.

=cut

*/

INTVAL
PIO_setlinebuf_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->SetLineBuf) {
            return layer->api->SetLineBuf(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

=item C<INTVAL
PIO_eof_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)>

Looks for the implementation of C<Eof> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

=cut

*/

INTVAL
PIO_eof_down(theINTERP, ParrotIOLayer * layer, ParrotIO * io)
{
    while (layer) {
        if (layer->api->Eof) {
            return layer->api->Eof(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    /* No layer found */
    return -1;
}

/*

=item C<INTVAL
PIO_poll_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
    INTVAL which, INTVAL sec, INTVAL usec)>

Looks for the implementation of C<Poll> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

=cut

*/

INTVAL
PIO_poll_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io,
    INTVAL which, INTVAL sec, INTVAL usec)
{
    while (layer) {
        if (layer->api->Poll) {
            return layer->api->Poll(interpreter, layer, io, which, sec, usec);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<ParrotIO *
PIO_socket_down(theINTERP, ParrotIOLayer *layer, INTVAL fam, INTVAL type,
                INTVAL proto)>

Looks for the implementation of C<Socket> and calls it if found,
returning its return value.

Returns C<NULL> if no implementation is found.

=cut

*/

ParrotIO *
PIO_socket_down(theINTERP, ParrotIOLayer *layer, INTVAL fam, INTVAL type,
                INTVAL proto)
{
    while (layer) {
        if (layer->api->Socket) {
            return layer->api->Socket(interpreter, layer, fam, type, proto);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return NULL;
}

/*

=item C<INTVAL
PIO_recv_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)>

Looks for the implementation of C<Recv> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.

=cut

*/

INTVAL
PIO_recv_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING **buf)
{
    while (layer) {
        if (layer->api->Recv) {
            return layer->api->Recv(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<INTVAL
PIO_send_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *buf)>

Looks for the implementation of C<Send> and calls it if found, returning
its return value.

Returns C<-1> if no implementation is found.


=cut

*/

INTVAL
PIO_send_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *buf)
{
    while (layer) {
        if (layer->api->Send) {
            return layer->api->Send(interpreter, layer, io, buf);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<INTVAL
PIO_connect_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)>

Looks for the implementation of C<Connect> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.


=cut

*/

INTVAL
PIO_connect_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)
{
    while (layer) {
        if (layer->api->Connect) {
            return layer->api->Connect(interpreter, layer, io, address);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<INTVAL
PIO_bind_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)>

Looks for the implementation of C<Bind> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.


=cut

*/

INTVAL
PIO_bind_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)
{
    while (layer) {
        if (layer->api->Bind) {
            return layer->api->Bind(interpreter, layer, io, address);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<INTVAL
PIO_listen_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL backlog)>

Looks for the implementation of C<listen> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.


=cut

*/

INTVAL
PIO_listen_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, INTVAL backlog)
{
    while (layer) {
        if (layer->api->Listen) {
            return layer->api->Listen(interpreter, layer, io, backlog);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=item C<ParrotIO *
PIO_accept_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io, STRING *address)Y


Looks for the implementation of C<Accept> and calls it if found,
returning its return value.

Returns C<-1> if no implementation is found.


=cut

*/

ParrotIO *
PIO_accept_down(theINTERP, ParrotIOLayer *layer, ParrotIO *io)
{
    while (layer) {
        if (layer->api->Accept) {
            return layer->api->Accept(interpreter, layer, io);
        }
        layer = PIO_DOWNLAYER(layer);
    }
    return -1;
}

/*

=back

=head1 SEE ALSO

F<io/io_buf.c>,
F<io/io_passdown.c>,
F<io/io_stdio.c>,
F<io/io_unix.c>,
F<io/io_win32.c>,
F<io/io.c>,
F<io/io_private.h>.

=head1 HISTORY

Initially written by Juergen Boemmels

Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
