/* io.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Internal Details of the Parrot IO subsystem
 *  Data Structure and Algorithms:
 *  History:
 *      Internal Definitions moved from include/parrot/io.h
 *  Notes:
 *      TODO: move the Layer structure to here also
 *  References:
 *      Perl6 RFCs (14,30,47,60,186,239,321,345,350)
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 *      Some ideas from AT&T SFIO
 */

#if !defined(PARROT_IO_PRIVATE_H_GUARD)
#define PARROT_IO_PRIVATE_H_GUARD

#define PARROT_IN_IO 1

#include <parrot/io.h>

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
#define PIO_F_LINEBUF   00010000        /* Flushes on newline           */
#define PIO_F_BLKBUF    00020000
#define PIO_F_SHARED    00100000        /* Stream shares a file handle  */

/* Buffer flags */
#define PIO_BF_MALLOC   00000001        /* Buffer malloced              */
#define PIO_BF_READBUF  00000002        /* Buffer is read-buffer        */
#define PIO_BF_WRITEBUF 00000004        /* Buffer is write-buffer       */


#define PIO_ACCMODE     0000003
#define PIO_DEFAULTMODE DEFAULT_OPEN_MODE
#define PIO_UNBOUND     (size_t)-1

typedef struct _ParrotIOBuf ParrotIOBuf;
typedef PMC **ParrotIOTable;

struct _ParrotIOBuf {
    INTVAL flags;               /* Buffer specific flags        */
    size_t size;
    unsigned char *startb;      /* Start of buffer              */
    unsigned char *endb;        /* End of buffer                */
    unsigned char *next;        /* Current read/write pointer   */
};

struct _ParrotIO {
    PIOHANDLE fd;               /* Low level OS descriptor      */
    INTVAL mode;                /* Read/Write/etc.              */
    INTVAL flags;               /* Da flags                     */
    PIOOFF_T fsize;             /* Current file size            */
    PIOOFF_T fpos;              /* Current real file pointer    */
    PIOOFF_T lpos;              /* Last file position           */
    ParrotIOBuf b;              /* Buffer structure             */
    ParrotIOLayer *stack;
    /* ParrotIOFilter * filters; */
};

struct _ParrotIOData {
    ParrotIOTable table;
    ParrotIOLayer *default_stack;
};

/* functions internal to the subsystem */
extern ParrotIOTable alloc_pio_array(int);
extern int realloc_pio_array(ParrotIOTable *, int);

/* redefine PIO_STD* for internal use */
#define PIO_STDIN(i)   (((ParrotIOData*)i->piodata)->table[PIO_STDIN_FILENO])
#define PIO_STDOUT(i)  (((ParrotIOData*)i->piodata)->table[PIO_STDOUT_FILENO])
#define PIO_STDERR(i)  (((ParrotIOData*)i->piodata)->table[PIO_STDERR_FILENO])

#endif /* !defined(PARROT_IO_PRIVATE_H_GUARD) */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
