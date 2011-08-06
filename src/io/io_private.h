/*
Copyright (C) 2001-2008, Parrot Foundation.

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

/* Buffer flags */
#define PIO_BF_MALLOC   00000001        /* Buffer malloced              */
#define PIO_BF_READBUF  00000002        /* Buffer is read-buffer        */
#define PIO_BF_WRITEBUF 00000004        /* Buffer is write-buffer       */
#define PIO_BF_MMAP     00000010        /* Buffer mmap()ed              */


#define PIO_UNBOUND     (size_t)-1

typedef PMC **ParrotIOTable;

struct _ParrotIOData {
    ParrotIOTable table;
};

/* redefine PIO_STD* for internal use */
#define _PIO_STDIN(i)   ((i)->piodata->table[PIO_STDIN_FILENO])
#define _PIO_STDOUT(i)  ((i)->piodata->table[PIO_STDOUT_FILENO])
#define _PIO_STDERR(i)  ((i)->piodata->table[PIO_STDERR_FILENO])

#endif /* PARROT_IO_PRIVATE_H_GUARD */

/*

=head1 SEE ALSO

F<src/io/api.c>,
F<src/io/buffer.c>,
F<src/io/portable.c>,
F<src/io/unix.c>,
F<src/io/io_win32.c>.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
