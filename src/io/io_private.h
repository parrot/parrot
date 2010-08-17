/*
Copyright (C) 2001-2008, Parrot Foundation.
$Id$

=head1 NAME

src/io/io_private.h - IO internals

=head1 DESCRIPTION

Internal Details of the Parrot IO subsystem.

=head2 References

Perl6 RFCs (14,30,47,60,186,239,321,345,350).

Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work.

Some ideas from AT&T SFIO.

=cut

*/

#ifndef PARROT_IO_PRIVATE_H_GUARD
#define PARROT_IO_PRIVATE_H_GUARD

#define PARROT_IN_IO 1
#define PARROT_ASYNC_DEVEL 0

#include <parrot/io.h>

/* XXX: Parrot config is currently not probing for all headers so
 * I'm sticking here rather than parrot.h
 */
#ifdef UNIX
#  include <sys/socket.h>
#endif

#ifdef WIN32
#  include <winsock.h>
#endif

/* IO object flags */
#define PIO_F_READ      00000001
#define PIO_F_WRITE     00000002
#define PIO_F_APPEND    00000004
#define PIO_F_TRUNC     00000010
#define PIO_F_EOF       00000020
#define PIO_F_FILE      00000100
#define PIO_F_PIPE      00000200
#define PIO_F_SOCKET    00000400
#define PIO_F_CONSOLE   00001000        /* A terminal                   */
#define PIO_F_READLINE  00002000        /* user interactive readline    */
#define PIO_F_LINEBUF   00010000        /* Flushes on newline           */
#define PIO_F_BLKBUF    00020000
#define PIO_F_SOFT_SP   00040000        /* Python softspace */
#define PIO_F_SHARED    00100000        /* Stream shares a file handle  */
#define PIO_F_ASYNC     01000000        /* In Parrot async is default   */

/* Buffer flags */
#define PIO_BF_MALLOC   00000001        /* Buffer malloced              */
#define PIO_BF_READBUF  00000002        /* Buffer is read-buffer        */
#define PIO_BF_WRITEBUF 00000004        /* Buffer is write-buffer       */
#define PIO_BF_MMAP     00000010        /* Buffer mmap()ed              */


#define PIO_ACCMODE     0000003
#define PIO_DEFAULTMODE DEFAULT_OPEN_MODE
#define PIO_UNBOUND     (size_t)-1

typedef PMC **ParrotIOTable;

struct _ParrotIOData {
    ParrotIOTable table;
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   (((ParrotIOData*)(i)->piodata)->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  (((ParrotIOData*)(i)->piodata)->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  (((ParrotIOData*)(i)->piodata)->table[PIO_STDERR_FILENO])

/* Parrot_Socklen_t is used in POSIX accept call */
#if PARROT_HAS_SOCKLEN_T
typedef socklen_t Parrot_Socklen_t;
#else
typedef int Parrot_Socklen_t;
#endif

#endif /* PARROT_IO_PRIVATE_H_GUARD */

/*

=head1 SEE ALSO

F<src/io/api.c>,
F<src/io/buffer.c>,
F<src/io/portable.c>,
F<src/io/unix.c>,
F<src/io/utf8.c>,
F<src/io/io_win32.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
