/* io.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *      Parrot IO subsystem 
 *  Data Structure and Algorithms:
 *  History:
 *      Originally written by Melvin Smith
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
#    ifdef HAS_HEADER_UNISTD
#      define PIO_OS_UNIX
#    else
#      define PIO_OS_STDIO
#    endif
#  endif
#endif

#ifndef STDIN_FILENO
# define STDIN_FILENO 0
#endif

#ifndef STDOUT_FILENO
# define STDOUT_FILENO 1
#endif

#ifndef STDERR_FILENO
# define STDERR_FILENO 2
#endif

#define PIO_STDIN_FILENO 0
#define PIO_STDOUT_FILENO 1
#define PIO_STDERR_FILENO 2

#ifndef O_ACCMODE
# define O_ACCMODE 0003
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

enum {
    PIO_TYPE_FILE,
    PIO_TYPE_PIPE,
    PIO_TYPE_SOCKET,
    PIO_TYPE_MAX
};

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

/* This is temporary until subs/code refs are done..*/
typedef void *DummyCodeRef;


struct _ParrotIOBuf {
    INTVAL flags;               /* Buffer specific flags        */
    size_t size;
    unsigned char *startb;      /* Start of buffer              */
    unsigned char *endb;        /* End of buffer                */
    unsigned char *next;        /* Current read/write pointer   */
};


#ifdef PIO_OS_WIN32
typedef HANDLE PIOHANDLE;
typedef LARGE_INTEGER PIOOFF_T;
#endif
#ifdef PIO_OS_UNIX
typedef int PIOHANDLE;
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
typedef struct _ParrotIOBuf ParrotIOBuf;
typedef struct _ParrotIO ParrotIO;
typedef struct _ParrotIOData ParrotIOData;
typedef struct _ParrotIO **ParrotIOTable;

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

struct _ParrotIOLayer {
    void *self;                 /* Instance specific data       */
    const char *name;
    INTVAL flags;
    ParrotIOLayerAPI *api;
    ParrotIOLayer *up;
    ParrotIOLayer *down;
};

struct _ParrotIOData {
    ParrotIOTable table;
    ParrotIOLayer *default_stack;
};




#define PIO_DOWNLAYER(x)   x->down
#define PIO_UPLAYER(x)     x->up
#define GET_INTERP_IO(i)   (((ParrotIOData*)i->piodata)->default_stack)
#define GET_INTERP_IOD(i)  ((ParrotIOData *)i->piodata)
#define PIO_STDIN(i)   (((ParrotIOData*)i->piodata)->table[PIO_STDIN_FILENO])
#define PIO_STDOUT(i)  (((ParrotIOData*)i->piodata)->table[PIO_STDOUT_FILENO])
#define PIO_STDERR(i)  (((ParrotIOData*)i->piodata)->table[PIO_STDERR_FILENO])

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
# define theINTERP      struct Parrot_Interp * interpreter
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
    INTVAL          (*Seek)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io, INTVAL hi, INTVAL lo,
                            INTVAL whence);
    PIOOFF_T        (*Tell)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io);
    INTVAL          (*SetBuf)(theINTERP, ParrotIOLayer * layer,
                              ParrotIO * io, size_t bufsize);
    INTVAL          (*SetLineBuf)(theINTERP, ParrotIOLayer * layer,
                                  ParrotIO * io);
    INTVAL          (*GetCount)(theINTERP, ParrotIOLayer * layer);
    INTVAL          (*Fill)(theINTERP, ParrotIOLayer * layer);
    INTVAL          (*PutS)(theINTERP, ParrotIOLayer * l,
                            ParrotIO * io, const char * s);
    INTVAL          (*GetS)(theINTERP, ParrotIOLayer * layer,
                            ParrotIO * io, char * s, INTVAL maxlen);
    INTVAL          (*Eof)(theINTERP, ParrotIOLayer * l,
                           ParrotIO * io);
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
#define PIO_null_seek (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, INTVAL, INTVAL, INTVAL))0
#define PIO_null_tell (PIOOFF_T (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_setbuf (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, size_t))0
#define PIO_null_setlinebuf (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0
#define PIO_null_getcount (INTVAL (*)(theINTERP, ParrotIOLayer *))0
#define PIO_null_fill (INTVAL (*)(theINTERP, ParrotIOLayer *))0
#define PIO_null_puts (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, const char *))0
#define PIO_null_gets (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *, char *, INTVAL))0
#define PIO_null_eof (INTVAL (*)(theINTERP, ParrotIOLayer *, ParrotIO *))0

extern INTVAL pio_errno;

/* io.c - If you add new layers, register them in init_layers() */
extern void PIO_init(theINTERP);
extern INTVAL PIO_init_stacks(theINTERP);
extern void PIO_atexit(theINTERP);
extern INTVAL PIO_push_layer(theINTERP, ParrotIOLayer *, ParrotIO *);
extern ParrotIOLayer *PIO_pop_layer(theINTERP, ParrotIO *);
extern ParrotIOLayer *PIO_copy_stack(ParrotIOLayer *);


extern struct PMC *new_io_pmc(struct Parrot_Interp *, ParrotIO *);
extern void free_io_header(ParrotIO *);
extern ParrotIOTable alloc_pio_array(int);
extern int realloc_pio_array(ParrotIOTable *, int);
extern ParrotIO *PIO_new(struct Parrot_Interp *, ParrotIO *,
                         INTVAL, INTVAL, INTVAL);

extern INTVAL PIO_base_init(theINTERP, ParrotIOLayer *proto);
extern ParrotIOLayer *PIO_base_new_layer(ParrotIOLayer *proto);
extern void PIO_base_delete_layer(ParrotIOLayer *proto);

extern INTVAL PIO_parse_open_flags(const char *flagstr);
extern ParrotIO *PIO_open(theINTERP, const char *, const char *);
extern ParrotIO *PIO_fdopen(theINTERP, PIOHANDLE, const char *);
extern INTVAL PIO_close(theINTERP, ParrotIO *);
extern void PIO_flush(theINTERP, ParrotIO *);
extern INTVAL PIO_read(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL PIO_write(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL PIO_setbuf(theINTERP, ParrotIO *, size_t);
extern INTVAL PIO_setlinebuf(theINTERP, ParrotIO *);
extern INTVAL PIO_puts(theINTERP, ParrotIO *, const char *);
extern INTVAL PIO_seek(theINTERP, ParrotIO *, INTVAL hi,
                       INTVAL lo, INTVAL whence);
extern INTVAL PIO_eof(theINTERP, ParrotIO *);


/* Put platform specific macros here if you must */
#ifdef PIO_OS_WIN32
extern INTVAL           PIO_win32_isatty(PIOHANDLE fd);
#  define PIO_isatty(x)   PIO_win32_isatty(x)
extern INTVAL           PIO_win32_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_win32_getblksize(x)
#endif
#ifdef PIO_OS_UNIX
extern INTVAL           PIO_unix_isatty(PIOHANDLE fd);
#  define PIO_isatty(x)   PIO_unix_isatty(x)
extern INTVAL           PIO_unix_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_unix_getblksize(x)
#endif
#ifdef PIO_OS_STDIO
extern INTVAL           PIO_stdio_isatty(PIOHANDLE fd);
#  define PIO_isatty(x)   PIO_stdio_isatty(x)
extern INTVAL           PIO_stdio_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_stdio_getblksize(x)
#endif


#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
