/* io.h
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Parrot IO subsystem
 *  Data Structure and Algorithms:
 *  History:
 *      Originally written by Melvin Smith
 *      Refactored by Juergen Boemmels
 *      2003-08-18: Internal structures moved to io/io_private.h
 *  Notes:
 *  References:
 *      Perl6 RFCs (14,30,47,60,186,239,321,345,350)
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 *      Some ideas from AT&T SFIO
 */

#if !defined(PARROT_IO_H_GUARD)
#define PARROT_IO_H_GUARD

#include <stdio.h>

/* which OS are we on? (this should be moved into Configure-land) */
#ifdef MINIPARROT
#  define PIO_OS_STDIO
#else
#  ifdef _WIN32
#    define PIO_OS_WIN32
#  else
#    ifdef PARROT_HAS_HEADER_UNISTD
#      define PIO_OS_UNIX
#    else
#      define PIO_OS_STDIO
#    endif
#  endif
#endif

#ifdef PIO_OS_WIN32
#  include <io.h>
#endif

#ifndef STDIN_FILENO
#  define STDIN_FILENO 0
#endif

#ifndef STDOUT_FILENO
#  define STDOUT_FILENO 1
#endif

#ifndef STDERR_FILENO
#  define STDERR_FILENO 2
#endif

/* &gen_from_def(stdio.pasm) */

#define PIO_STDIN_FILENO 0
#define PIO_STDOUT_FILENO 1
#define PIO_STDERR_FILENO 2

/* &end_gen */

#ifndef O_ACCMODE
#  define O_ACCMODE 0003
#endif

#ifdef BLKSIZE
#  define PIO_BLKSIZE BLKSIZE
#else
#  define PIO_BLKSIZE  8192
#endif
#define PIO_LINEBUFSIZE 256     /* Default linebuffer size */
#define PIO_GRAIN 2048          /* Smallest size for a block buffer */
#define PIO_BUFSIZE     (PIO_GRAIN * 2)

#define PIO_NR_OPEN 256         /* Size of an "IO handle table" */

/* &gen_from_enum(iotypes.pasm) */
enum {
    PIO_TYPE_FILE,
    PIO_TYPE_PIPE,
    PIO_TYPE_SOCKET,
    PIO_TYPE_MAX
};
/* &end_gen */

/* This is temporary until subs/code refs are done..*/
typedef void *DummyCodeRef;


#ifdef PIO_OS_WIN32
typedef Parrot_WIN32_HANDLE PIOHANDLE;
typedef Parrot_OFF_T PIOOFF_T;
#endif
#ifdef PIO_OS_UNIX
/* Hopefully INTVAL_SIZE is enough for PTR_SIZE so that
 * the FILE* of pio_stdio_layers fit into a PIOHANDLE. */
typedef INTVAL PIOHANDLE;
typedef off_t PIOOFF_T;
#endif
#ifdef PIO_OS_STDIO
typedef FILE* PIOHANDLE;
typedef long PIOOFF_T;
#endif

extern PIOOFF_T piooffsetzero;

typedef struct _ParrotIOLayerAPI ParrotIOLayerAPI;
typedef struct _ParrotIOLayer ParrotIOLayer;
typedef struct _ParrotIOFilter ParrotIOFilter;
typedef struct _ParrotIO ParrotIO;
typedef struct _ParrotIOData ParrotIOData;

struct _ParrotIOLayer {
    void *self;                 /* Instance specific data       */
    const char *name;
    INTVAL flags;
    ParrotIOLayerAPI *api;
    ParrotIOLayer *up;
    ParrotIOLayer *down;
};

#define PIO_DOWNLAYER(x)   x->down
#define PIO_UPLAYER(x)     x->up

/*
 * Terminal layer can't be pushed on top of other layers;
 * vice-versa, non-terminal layers be pushed on an empty io stack
 * An OS layer would be a terminal layer, non-terminals might be
 * buffering, translation, compression or encryption layers.
 */
#define PIO_L_TERMINAL          0x0001
#define PIO_L_FASTGETS          0x0002


/* Others to come */
#ifdef PIO_OS_UNIX
extern ParrotIOLayer pio_unix_layer;
#endif
#ifdef PIO_OS_WIN32
extern ParrotIOLayer pio_win32_layer;
#endif
#ifdef PIO_OS_STDIO
extern ParrotIOLayer pio_stdio_layer;
#endif
extern ParrotIOLayer pio_buf_layer;

/* This is list of valid layers */
extern ParrotIOLayer *pio_registered_layers;

/* This is the actual (default) layer stack which is used for IO */
extern ParrotIOLayer *pio_default_stack;


#ifndef theINTERP
#  define theINTERP      struct Parrot_Interp * interpreter
#endif

/*
 * By default, any layer not implementing an interface (ie. leaving
 * null value for a function) implicitly passes calls to the
 * next layer. To override or shadow an API the layer must implement
 * the specific call.
 */
struct _ParrotIOLayerAPI {
    INTVAL          (*Init)(theINTERP, ParrotIOLayer * l);
    ParrotIOLayer * (*New)(ParrotIOLayer * proto);
    void            (*Delete)(ParrotIOLayer * l);
    INTVAL          (*Pushed)(ParrotIOLayer * l, ParrotIO * io);
    INTVAL          (*Popped)(ParrotIOLayer * l, ParrotIO * io);
    ParrotIO *      (*Open)(theINTERP, ParrotIOLayer * l,
                            const char * name, INTVAL flags);
    ParrotIO *      (*Open2_Unused)(theINTERP);
    ParrotIO *      (*Open3_Unused)(theINTERP);
    ParrotIO *      (*Open_ASync)(theINTERP, ParrotIOLayer * l,
                                  const char * name, const char * mode,
                                  DummyCodeRef *);
    ParrotIO *      (*FDOpen)(theINTERP, ParrotIOLayer * l,
                              PIOHANDLE fd, INTVAL flags);
    INTVAL          (*Close)(theINTERP, ParrotIOLayer * l,
                                ParrotIO * io);
    size_t          (*Write)(theINTERP, ParrotIOLayer * l,
                             ParrotIO * io, const void * buf,
                             size_t len);
    size_t          (*Write_ASync)(theINTERP, ParrotIOLayer * layer,
                                   ParrotIO * io, void * buf, size_t len,
                                   DummyCodeRef *);
    size_t          (*Read)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io, void * buf, size_t len);
    size_t          (*Read_ASync)(theINTERP, ParrotIOLayer * layer,
                                  ParrotIO * io, void * buf, size_t len,
                                  DummyCodeRef *);
    INTVAL          (*Flush)(theINTERP, ParrotIOLayer * layer,
                             ParrotIO * io);
    size_t          (*Peek)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io, void * buf);
    PIOOFF_T        (*Seek)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io, PIOOFF_T offset, INTVAL whence);
    PIOOFF_T        (*Tell)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io);
    INTVAL          (*SetBuf)(theINTERP, ParrotIOLayer * layer,
                              ParrotIO * io, size_t bufsize);
    INTVAL          (*SetLineBuf)(theINTERP, ParrotIOLayer * layer,
                                  ParrotIO * io);
    INTVAL          (*GetCount)(theINTERP, ParrotIOLayer * layer);
    INTVAL          (*Fill)(theINTERP, ParrotIOLayer * layer);
    INTVAL          (*Eof)(theINTERP, ParrotIOLayer * l,
                           ParrotIO * io);
    /* Network API */
    INTVAL          (*Poll)(theINTERP, ParrotIOLayer *l, ParrotIO *io,
                            int which, int sec, int usec);
    ParrotIO *      (*Socket)(theINTERP, ParrotIOLayer *,
                            int dom, int type, int proto);
    INTVAL          (*Connect)(theINTERP, ParrotIOLayer *, ParrotIO *,
                            STRING *);
    INTVAL          (*Send)(theINTERP, ParrotIOLayer *, ParrotIO *, STRING *);
    INTVAL          (*Recv)(theINTERP, ParrotIOLayer *, ParrotIO *, STRING **);
};

/* these are defined rather than using NULL because strictly-speaking, ANSI C
 * doesn't like conversions between function and non-function pointers. */
#define PIO_null_push_layer (INTVAL (*)(ParrotIOLayer *, ParrotIO *))0
#define PIO_null_pop_layer (INTVAL (*)(ParrotIOLayer *, ParrotIO *))0
#define PIO_null_open (ParrotIO * (*)(theINTERP, ParrotIOLayer *, const char*, INTVAL))0
#define PIO_null_open2 (ParrotIO * (*)(theINTERP))0
#define PIO_null_open3 (ParrotIO * (*)(theINTERP))0
#define PIO_null_open_async (ParrotIO * (*)(theINTERP, ParrotIOLayer *, const char *, const char *, DummyCodeRef *))0
#define PIO_null_fdopen (ParrotIO * (*)(theINTERP, ParrotIOLayer *, PIOHANDLE, INTVAL))0
#define PIO_null_close (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_write (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, const void *, size_t))0
#define PIO_null_write_async (size_t (*)(theINTERP, ParrotIOLayer *, ParrotIO *, void *, size_t, DummyCodeRef *))0
#define PIO_null_read (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, const void *, size_t))0
#define PIO_null_read_async (size_t (*)(theINTERP, ParrotIOLayer *, ParrotIO *, void *, size_t, DummyCodeRef *))0
#define PIO_null_flush (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_seek (PIOOFF_T (*)(theINTERP, ParrotIOLayer *, ParrotIO *, PIOOFF_T, INTVAL))0
#define PIO_null_tell (PIOOFF_T (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_setbuf (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, size_t))0
#define PIO_null_setlinebuf (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_getcount (INTVAL (*)(theINTERP, ParrotIOLayer *))0
#define PIO_null_fill (INTVAL (*)(theINTERP, ParrotIOLayer *))0
#define PIO_null_eof (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_socket (ParrotIO * (*)(theINTERP, ParrotIOLayer *, int, int, int))0


extern INTVAL pio_errno;

/* io.c - If you add new layers, register them in init_layers() */
extern void PIO_init(theINTERP);
extern void PIO_finish(theINTERP);
extern INTVAL PIO_init_stacks(theINTERP);
extern void PIO_atexit(theINTERP);
extern INTVAL PIO_push_layer(theINTERP, ParrotIOLayer *, PMC *);
extern ParrotIOLayer *PIO_pop_layer(theINTERP, PMC *);
extern ParrotIOLayer *PIO_copy_stack(ParrotIOLayer *);


extern struct PMC *new_io_pmc(struct Parrot_Interp *, ParrotIO *);
extern void free_io_header(ParrotIO *);
extern ParrotIO *PIO_new(struct Parrot_Interp *, INTVAL, INTVAL, INTVAL);
extern void PIO_destroy(theINTERP, PMC *io);

extern INTVAL PIO_base_init(theINTERP, ParrotIOLayer *proto);
extern ParrotIOLayer *PIO_base_new_layer(ParrotIOLayer *proto);
extern void PIO_base_delete_layer(ParrotIOLayer *proto);

extern INTVAL PIO_parse_open_flags(const char *flagstr);
extern PMC *PIO_open(theINTERP, ParrotIOLayer *, const char *, const char *);
extern PMC *PIO_fdopen(theINTERP, ParrotIOLayer *, PIOHANDLE, const char *);
extern INTVAL PIO_close(theINTERP, PMC *);
extern void PIO_flush(theINTERP, PMC *);
extern STRING *PIO_reads(theINTERP, PMC *, size_t);
extern INTVAL PIO_read(theINTERP, PMC *, void *, size_t);
extern INTVAL PIO_write(theINTERP, PMC *, const void *, size_t);
extern INTVAL PIO_setbuf(theINTERP, PMC *, size_t);
extern INTVAL PIO_setlinebuf(theINTERP, PMC *);
extern INTVAL PIO_puts(theINTERP, PMC *, const char *);
extern INTVAL PIO_peek(theINTERP, PMC *, void *);
extern PIOOFF_T PIO_seek(theINTERP, PMC *, PIOOFF_T offset, INTVAL whence);
extern INTVAL PIO_eof(theINTERP, PMC *);
extern INTVAL PIO_pioctl(theINTERP, PMC *, INTVAL cmd, INTVAL arg);
extern INTVAL PIO_poll(theINTERP, PMC *pmc, INTVAL which, INTVAL sec, INTVAL usec);
extern PMC *PIO_socket(theINTERP, INTVAL fam, INTVAL type, INTVAL proto);
extern INTVAL PIO_recv(theINTERP, PMC *pmc, STRING **buf);
extern INTVAL PIO_send(theINTERP, PMC *pmc, STRING *buf);
extern INTVAL PIO_connect(theINTERP, PMC *pmc, STRING *address);


extern INTVAL PIO_putps(theINTERP, PMC *io, STRING *s);
extern INTVAL PIO_fprintf(theINTERP, PMC *io, const char *s, ...);
extern INTVAL PIO_printf(theINTERP, const char *s, ...);
extern INTVAL PIO_eprintf(theINTERP, const char *s, ...);
extern PIOHANDLE PIO_getfd(theINTERP, PMC *io);
extern PIOOFF_T PIO_tell(theINTERP, PMC *io);

extern void Parrot_IOData_mark(theINTERP, ParrotIOData *piodata);

extern INTVAL PIO_isatty(theINTERP, PMC *io);

/* Put platform specific macros here if you must */
#ifdef PIO_OS_WIN32
extern STRING          *PIO_sockaddr_in(theINTERP, unsigned short, STRING *);
extern INTVAL           PIO_win32_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_win32_getblksize(x)
#endif

#ifdef PIO_OS_UNIX
extern STRING          *PIO_sockaddr_in(theINTERP, unsigned short, STRING *);
extern INTVAL           PIO_unix_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_unix_getblksize(x)
#endif

#ifdef PIO_OS_STDIO
extern INTVAL           PIO_stdio_getblksize(PIOHANDLE fd);
#  define PIO_sockaddr_in(i,p,a)
#  define PIO_getblksize(x)   PIO_stdio_getblksize(x)
#endif

PIOOFF_T PIO_make_offset(INTVAL offset);
PIOOFF_T PIO_make_offset32(INTVAL hi, INTVAL lo);
PIOOFF_T PIO_make_offset_pmc(theINTERP, PMC *pmc);

/* the internal system redefines them as macros */
extern PMC *PIO_STDIN(theINTERP);
extern PMC *PIO_STDOUT(theINTERP);
extern PMC *PIO_STDERR(theINTERP);

/*
 * pioctl definitions -- These are mostly for reference
 * or C-API writers.
 */
/* pioctl command constants */
#define PIOCTL_CMDRESERVED         0
#define PIOCTL_CMDSETRECSEP        1
#define PIOCTL_CMDGETRECSEP        2
#define PIOCTL_CMDSETBUFTYPE       3
#define PIOCTL_CMDGETBUFTYPE       4
#define PIOCTL_CMDSETBUFSIZE       5
#define PIOCTL_CMDGETBUFSIZE       6

/*
 * pioctl argument constants. These don't have to
 * be unique across io commands.
 */
#define PIOCTL_NONBUF              0
#define PIOCTL_LINEBUF             1
#define PIOCTL_BLKBUF              2



#endif /* PARROT_IO_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
