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
 *      Some ideas and goals from Perl5.7 and Nick Ing-Simmons' work
 *      Some ideas from AT&T SFIO
 */

#if !defined(PARROT_IO_H_GUARD)
#define PARROT_IO_H_GUARD

#include "parrot/parrot.h"

#ifndef SSIZE_MAX
#define SSIZE_MAX 8192
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

#ifndef O_ACCMODE
# define O_ACCMODE 0003
#endif

/* Average block size of most systems (usually varies from 2k-8k),
 * later we can add some config to query it from the system at
 * build time (struct stat.st_blksize maybe).
 */
#define PIO_BLKSIZE 4096 
#define PIO_BUFSIZE 4096
#define PIO_LINEBUFSIZE 256 


enum {
        PIO_TYPE_FILE,
        PIO_TYPE_PIPE,
        PIO_TYPE_SOCKET,
        PIO_TYPE_MAX
};

#define PIO_F_READ      0000001
#define PIO_F_WRITE     0000002
#define PIO_F_APPEND    0000004
#define PIO_F_TRUNC     0000010
#define PIO_F_FILE      0000100
#define PIO_F_PIPE      0000200
#define PIO_F_SOCKET    0000400
#define PIO_F_CONSOLE   0001000         /* A terminal, we can linebuf   */
#define PIO_F_LINEBUF   0010000
#define PIO_F_BUF       0020000
#define PIO_F_MALLOC    0040000         /* Buffer malloced              */
#define PIO_F_SHARED    0100000         /* Stream shares a file handle  */

#define PIO_ACCMODE     0000003
#define PIO_DEFAULTMODE DEFAULT_OPEN_MODE 
#define PIO_UNBOUND     (size_t)-1

typedef struct _ParrotIOLayerAPI        ParrotIOLayerAPI;
typedef struct _ParrotIOLayer           ParrotIOLayer;
typedef struct _ParrotIOFilter          ParrotIOFilter;
typedef struct _ParrotIOBuf             ParrotIOBuf;
typedef struct _ParrotIO                ParrotIO;

/* This is temporary until subs/code refs are done..*/
typedef void *   DummyCodeRef;
                            
            
struct _ParrotIOBuf {
        size_t          size;
        unsigned char * startb;         /* Start of buffer              */
        unsigned char * endw;           /* End of write buffer          */
        unsigned char * endr;           /* End of read buffer           */
        unsigned char * endb;           /* End of buffer                */
        unsigned char * next;           /* Current read/write pointer   */
};


#ifdef WIN32
typedef HANDLE PIOHANDLE; 
#else
typedef int PIOHANDLE;
#endif

 
struct _ParrotIO {
        PIOHANDLE       fd;             /* Low level OS descriptor      */
        UINTVAL         mode;           /* Read/Write/etc.              */
        UINTVAL         flags;          /* Da flags                     */
        off_t           fsize;          /* Current file size            */
        off_t           fpos;           /* Current real file pointer    */
        off_t           lpos;           /* Last file position           */
        ParrotIOBuf     b;              /* Buffer structure             */
        ParrotIOLayer * stack;
        /* ParrotIOFilter * filters; */
};

struct _ParrotIOLayer {
        void                    * this; /* Instance specific data       */
        const char              * name;
        UINTVAL                   flags;
        ParrotIOLayerAPI        * api;
        ParrotIOLayer           * up;
        ParrotIOLayer           * down;
};

#define PIO_DOWNLAYER(x)    x->down
#define PIO_UPLAYER(x)      x->up

/*
 * Terminal layer can't be pushed on top of other layers;
 * vice-versa, non-terminal layers be pushed on an empty io stack
 * An OS layer would be a terminal layer, non-terminals might be
 * buffering, translation, compression or encryption layers.
 */
#define PIO_L_TERMINAL          0x0001
#define PIO_L_FASTGETS          0x0002


/* Others to come */
#ifndef WIN32
extern ParrotIOLayer    pio_unix_layer;
#else
extern ParrotIOLayer    pio_win32_layer;
#endif
extern ParrotIOLayer    pio_stdio_layer;

/* This is list of valid layers */
extern ParrotIOLayer    * pio_registered_layers;

/* This is the actual (default) layer stack which is used for IO */
extern ParrotIOLayer    * pio_default_stack;


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
                                const char * name, UINTVAL flags);
        ParrotIO *      (*Open2)(theINTERP, ParrotIOLayer * l,
                                const char * name, const char * mode,
                                        int perm);
        ParrotIO *      (*Open3)(theINTERP, ParrotIOLayer * l,
                                const char * name, const char * mode,
                                        int perm, ParrotIO * io);
        ParrotIO *      (*Open_ASync)(theINTERP, ParrotIOLayer * l,
                                const char * name, const char * mode,
                                        DummyCodeRef *);
        ParrotIO *      (*FDOpen)(theINTERP, ParrotIOLayer * l,
                                PIOHANDLE fd, UINTVAL flags);
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
                                ParrotIO * io, off_t offset,
                                        INTVAL whence);
        off_t           (*Tell)(theINTERP, ParrotIOLayer * layer,
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
};


/* io.c - If you add new layers, register them in init_layers() */
extern void             PIO_init(theINTERP);
extern INTVAL           PIO_init_stacks(theINTERP);
extern void             PIO_atexit(theINTERP);
extern INTVAL           PIO_push_layer(ParrotIOLayer *, ParrotIO *);
extern ParrotIOLayer *  PIO_pop_layer(ParrotIO *);
extern ParrotIOLayer *  PIO_copy_stack(ParrotIOLayer *);


extern struct PMC *     new_io_pmc(struct Parrot_Interp *, ParrotIO *);
extern void             free_io_header(ParrotIO *);
extern ParrotIO *       PIO_new(struct Parrot_Interp *, ParrotIO *,
                                INTVAL, UINTVAL, UINTVAL);

extern INTVAL           PIO_base_init(theINTERP, ParrotIOLayer * proto);
extern ParrotIOLayer *  PIO_base_new_layer(ParrotIOLayer * proto);
extern void             PIO_base_delete_layer(ParrotIOLayer * proto);

extern UINTVAL          PIO_parse_open_flags(const char * flagstr);
extern ParrotIO *       PIO_open(theINTERP, const char *, const char *);
extern ParrotIO *       PIO_fdopen(theINTERP, PIOHANDLE, const char *);
extern INTVAL           PIO_close(theINTERP, ParrotIO *);
extern void             PIO_flush(theINTERP, ParrotIO *);
extern INTVAL           PIO_read(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL           PIO_write(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL           PIO_setbuf(theINTERP, ParrotIO *, size_t);
extern INTVAL           PIO_puts(theINTERP, ParrotIO *, const char *);



extern ParrotIO * pio_stdin;
extern ParrotIO * pio_stdout;
extern ParrotIO * pio_stderr;


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
