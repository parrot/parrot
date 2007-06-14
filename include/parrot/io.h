/* io.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
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

#ifndef PARROT_IO_H_GUARD
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
#define PIO_BUFSIZE (PIO_GRAIN * 2)

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
    const ParrotIOLayerAPI *api;
    ParrotIOLayer *up;
    ParrotIOLayer *down;
};

#define PIO_DOWNLAYER(x)   x->down
#define PIO_UPLAYER(x)     x->up


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
extern ParrotIOLayer pio_mmap_layer;
extern ParrotIOLayer pio_string_layer;




extern INTVAL pio_errno;

/* HEADERIZER BEGIN: src/io/io.c */

PARROT_API PMC * new_io_pmc( Interp *interp, ParrotIO *io /*NULLOK*/ );
PARROT_API void Parrot_IOData_mark( Interp *interp,
    ParrotIOData *piodata /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API PMC * PIO_accept( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_base_init( Interp *interp, ParrotIOLayer *l );
PARROT_API INTVAL PIO_bind( Interp *interp,
    PMC *pmc /*NN*/,
    STRING *address /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API INTVAL PIO_close( Interp *interp, PMC *pmc /*NULLOK*/ );
PARROT_API INTVAL PIO_connect( Interp *interp,
    PMC *pmc /*NN*/,
    STRING *address /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void PIO_destroy( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_eof( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_eprintf( Interp *interp /*NULLOK*/,
    const char *s /*NN*/,
    ... )
        __attribute__nonnull__(2);

PARROT_API PMC * PIO_fdopen( Interp *interp,
    ParrotIOLayer *layer /*NULLOK*/,
    PIOHANDLE fd,
    const char *sflags /*NN*/ )
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

PARROT_API void PIO_finish( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void PIO_flush( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_fprintf( Interp *interp /*NN*/,
    PMC *pmc /*NN*/,
    const char *s /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API PIOHANDLE PIO_getfd( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API void PIO_init( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API INTVAL PIO_init_stacks( Interp *interp );
PARROT_API void PIO_internal_shutdown( Interp *interp );
PARROT_API INTVAL PIO_isatty( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_listen( Interp *interp,
    PMC *pmc /*NN*/,
    INTVAL backlog )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API ParrotIO * PIO_new( Interp *interp,
    INTVAL iotype,
    INTVAL flags,
    INTVAL mode )
        __attribute__warn_unused_result__;

PARROT_API PMC * PIO_open( Interp *interp,
    ParrotIOLayer *layer /*NULLOK*/,
    const char *spath /*NN*/,
    const char *sflags /*NN*/ )
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_parse_open_flags( const char *flagstr /*NULLOK*/ )
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_peek( Interp *interp,
    PMC *pmc /*NN*/,
    STRING **buffer /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API INTVAL PIO_pioctl( Interp *interp,
    PMC *pmc /*NN*/,
    INTVAL cmd,
    INTVAL arg )
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_poll( Interp *interp /*NN*/,
    PMC *pmc /*NN*/,
    INTVAL which,
    INTVAL sec,
    INTVAL usec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_printf( Interp *interp /*NN*/,
    const char *s /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_putps( Interp *interp /*NN*/,
    PMC *pmc /*NN*/,
    STRING *s /*NULLOK*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_puts( Interp *interp,
    PMC *pmc /*NN*/,
    const char *s /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API INTVAL PIO_read( Interp *interp,
    PMC *pmc /*NN*/,
    char *buffer /*NN*/,
    size_t len )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API STRING * PIO_reads( Interp *interp, PMC *pmc /*NN*/, size_t len )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_recv( Interp *interp,
    PMC *pmc /*NN*/,
    STRING **buf /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API PIOOFF_T PIO_seek( Interp *interp,
    PMC *pmc /*NN*/,
    PIOOFF_T offset,
    INTVAL w )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_send( Interp *interp,
    PMC *pmc /*NN*/,
    STRING *buf /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_setbuf( Interp *interp,
    PMC *pmc /*NN*/,
    size_t bufsize )
        __attribute__nonnull__(2);

PARROT_API INTVAL PIO_setlinebuf( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API PMC * PIO_socket( Interp *interp,
    INTVAL fam,
    INTVAL type,
    INTVAL proto );

PARROT_API PMC * PIO_STDERR( Interp *interp );
PARROT_API PMC * PIO_STDIN( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API PMC * PIO_STDOUT( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API PIOOFF_T PIO_tell( Interp *interp, PMC *pmc /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API INTVAL PIO_write( Interp *interp,
    PMC *pmc /*NN*/,
    const void *buffer /*NN*/,
    size_t len )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

STRING * PIO_make_io_string( Interp *interp, STRING **buf /*NN*/, size_t len )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PIOOFF_T PIO_make_offset( INTVAL offset );
PIOOFF_T PIO_make_offset32( INTVAL hi, INTVAL lo );
PIOOFF_T PIO_make_offset_pmc( Interp *interp, PMC *pmc );
/* HEADERIZER END: src/io/io.c */

/* io_layers.c - If you add new layers, register them in init_layers() */
/* HEADERIZER BEGIN: src/io/io_layers.c */

PARROT_API void PIO_base_delete_layer( ParrotIOLayer *layer /*NULLOK*/ );
PARROT_API ParrotIOLayer * PIO_base_new_layer( ParrotIOLayer *proto );
PARROT_API ParrotIOLayer * PIO_copy_stack( ParrotIOLayer *stack /*NULLOK*/ );
PARROT_API ParrotIOLayer * PIO_get_layer( Interp *interp,
    const char *name /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API ParrotIOLayer * PIO_pop_layer( Interp *interp,
    PMC *pmc /*NULLOK*/ );

PARROT_API INTVAL PIO_push_layer( Interp *interp,
    PMC *pmc /*NULLOK*/,
    ParrotIOLayer *layer /*NULLOK*/ );

STRING * PIO_pop_layer_str( Interp *interp, PMC *pmc );
void PIO_push_layer_str( Interp *interp, PMC *pmc, STRING *ls );
/* HEADERIZER END: src/io/io_layers.c */

/* Put platform specific macros here if you must */
#ifdef PIO_OS_WIN32
extern STRING          *PIO_sockaddr_in(Interp *, unsigned short, STRING *);
extern INTVAL           PIO_win32_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_win32_getblksize(x)
#endif

#ifdef PIO_OS_UNIX
extern STRING          *PIO_sockaddr_in(Interp *, unsigned short, STRING *);
extern INTVAL           PIO_unix_getblksize(PIOHANDLE fd);
#  define PIO_getblksize(x)   PIO_unix_getblksize(x)
#endif

#ifdef PIO_OS_STDIO
extern INTVAL           PIO_stdio_getblksize(PIOHANDLE fd);
#  define PIO_sockaddr_in(i,p,a)
#  define PIO_getblksize(x)   PIO_stdio_getblksize(x)
#endif


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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
