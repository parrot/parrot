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


/* Average block size of most systems (usually varies from 2k-8k),
 * later we can add some config to query it from the system at
 * build time (struct stat.st_blksize maybe).
 */
#define PIO_BLKSIZE 4096 
#define PIO_LINEBUFSIZE 256 


enum {
        PIO_TYPE_FILE,
        PIO_TYPE_PIPE,
        PIO_TYPE_SOCKET,
        PIO_TYPE_MAX
};

enum {
        PIO_BUFTYPE_NONE = 0,
        PIO_BUFTYPE_FULL,
        PIO_BUFTYPE_LINE,
        PIO_BUFTYPE_MAX
};


typedef struct _ParrotIOLayerAPI        ParrotIOLayerAPI;
typedef struct _ParrotIOLayer           ParrotIOLayer;
typedef struct _ParrotIOFilter          ParrotIOFilter;
typedef struct _ParrotIOBuf             ParrotIOBuf;
typedef struct _ParrotIO                ParrotIO;

/* This is temporary until subs/code refs are done..*/
typedef void *   DummyCodeRef;
                            
            
struct _ParrotIOBuf {
        size_t          bufsize;
        unsigned char * buf;
        unsigned char * head;
};

struct _ParrotIO {
        INTVAL          fd;             /* Low level OS descriptor */
        INTVAL          mode;           /* Read/Write/etc. */
        INTVAL          flags;
        INTVAL          iotype;         /* Type of stream is this */
        off_t           filepos;        /* Current real file pointer */
        INTVAL          buftype;
        ParrotIOBuf     in;
        ParrotIOBuf     out;
        ParrotIOLayer * stack;
        /* ParrotIOFilter * filters; */
};

struct _ParrotIOLayer {
        void                    * this; /* Instance specific data */
        const char              * name;
        INTVAL                    flags;
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
extern ParrotIOLayer    pio_os_layer;
#ifdef WIN32
/*extern ParrotIOLayer  pio_win32_layer; */
#endif

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
                                const char * name, const char * mode);
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
                                INTVAL fd, const char * name);
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
                                ParrotIO * io, INTVAL bufsize);
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
extern INTVAL           PIO_push_layer(ParrotIOLayer *, ParrotIO *);
extern ParrotIOLayer *  PIO_pop_layer(ParrotIO *);
extern ParrotIOLayer *  PIO_copy_stack(ParrotIOLayer *);


extern ParrotIO *       new_io_header(struct Parrot_Interp *, INTVAL,
                                INTVAL, INTVAL);
extern struct PMC *     new_io_pmc(struct Parrot_Interp *, ParrotIO *);
extern void             free_io_header(ParrotIO *);

extern INTVAL           PIO_base_init(theINTERP, ParrotIOLayer * proto);
extern ParrotIOLayer *  PIO_base_new_layer(ParrotIOLayer * proto);
extern void             PIO_base_delete_layer(ParrotIOLayer * proto);

extern ParrotIO *       PIO_open(theINTERP, const char *, const char *);
extern ParrotIO *       PIO_fdopen(theINTERP, INTVAL, const char *);
extern INTVAL           PIO_close(theINTERP, ParrotIO *);
extern void             PIO_flush(theINTERP, ParrotIO *);
extern INTVAL           PIO_read(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL           PIO_write(theINTERP, ParrotIO *, void *, size_t);
extern INTVAL           PIO_setbuf(theINTERP, ParrotIO *, INTVAL);
extern INTVAL           PIO_puts(theINTERP, ParrotIO *, const char *);

#define Init_IO(x)      PIO_init(x)



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
