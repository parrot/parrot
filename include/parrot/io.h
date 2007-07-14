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

PARROT_API
PMC * new_io_pmc( PARROT_INTERP, NULLOK(ParrotIO *io) )
        __attribute__nonnull__(1);

PARROT_API
void Parrot_IOData_mark( PARROT_INTERP, NOTNULL(ParrotIOData *piodata) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PMC * PIO_accept( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_base_init( SHIM_INTERP, ParrotIOLayer *l );

PARROT_API
INTVAL PIO_bind( PARROT_INTERP, NOTNULL(PMC *pmc), NOTNULL(STRING *address) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
INTVAL PIO_close( PARROT_INTERP, NULLOK(PMC *pmc) )
        __attribute__nonnull__(1);

PARROT_API
INTVAL PIO_connect( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    NOTNULL(STRING *address) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
void PIO_destroy( SHIM_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_eof( SHIM_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_eprintf( NULLOK(PARROT_INTERP), NOTNULL(const char *s), ... )
        __attribute__nonnull__(2);

PARROT_API
PMC * PIO_fdopen( PARROT_INTERP,
    NULLOK(ParrotIOLayer *layer),
    PIOHANDLE fd,
    NOTNULL(const char *sflags) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

PARROT_API
void PIO_finish( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void PIO_flush( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_fprintf( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    NOTNULL(const char *s),
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PIOHANDLE PIO_getfd( SHIM_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
void PIO_init( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
INTVAL PIO_init_stacks( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void PIO_internal_shutdown( SHIM_INTERP );

PARROT_API
INTVAL PIO_isatty( SHIM_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_listen( PARROT_INTERP, NOTNULL(PMC *pmc), INTVAL backlog )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
ParrotIO * PIO_new( PARROT_INTERP, INTVAL iotype, INTVAL flags, INTVAL mode )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

PARROT_API
PMC * PIO_open( PARROT_INTERP,
    NULLOK(ParrotIOLayer *layer),
    NOTNULL(const char *spath),
    NOTNULL(const char *sflags) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_parse_open_flags( NULLOK(const char *flagstr) )
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_peek( PARROT_INTERP, NOTNULL(PMC *pmc), NOTNULL(STRING **buffer) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
INTVAL PIO_pioctl( PARROT_INTERP, NOTNULL(PMC *pmc), INTVAL cmd, INTVAL arg )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_poll( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    INTVAL which,
    INTVAL sec,
    INTVAL usec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_printf( PARROT_INTERP, NOTNULL(const char *s), ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_putps( PARROT_INTERP, NOTNULL(PMC *pmc), NULLOK(STRING *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_puts( PARROT_INTERP, NOTNULL(PMC *pmc), NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
INTVAL PIO_read( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    NOTNULL(char *buffer),
    size_t len )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API
STRING * PIO_reads( PARROT_INTERP, NOTNULL(PMC *pmc), size_t len )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_recv( PARROT_INTERP, NOTNULL(PMC *pmc), NOTNULL(STRING **buf) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API
PIOOFF_T PIO_seek( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    PIOOFF_T offset,
    INTVAL w )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_send( PARROT_INTERP, NOTNULL(PMC *pmc), NOTNULL(STRING *buf) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_setbuf( PARROT_INTERP, NOTNULL(PMC *pmc), size_t bufsize )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
INTVAL PIO_setlinebuf( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PMC * PIO_socket( PARROT_INTERP, INTVAL fam, INTVAL type, INTVAL proto )
        __attribute__nonnull__(1);

PARROT_API
PMC * PIO_STDERR( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
PMC * PIO_STDIN( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
PMC * PIO_STDOUT( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
PIOOFF_T PIO_tell( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PARROT_API
INTVAL PIO_write( PARROT_INTERP,
    NOTNULL(PMC *pmc),
    NOTNULL(const void *buffer),
    size_t len )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

STRING * PIO_make_io_string( PARROT_INTERP,
    NOTNULL(STRING **buf),
    size_t len )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

PIOOFF_T PIO_make_offset( INTVAL offset );
PIOOFF_T PIO_make_offset32( INTVAL hi, INTVAL lo );
PIOOFF_T PIO_make_offset_pmc( PARROT_INTERP, PMC *pmc )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/io/io.c */

/* io_layers.c - If you add new layers, register them in init_layers() */
/* HEADERIZER BEGIN: src/io/io_layers.c */

PARROT_API
void PIO_base_delete_layer( NULLOK(ParrotIOLayer *layer) );

PARROT_API
ParrotIOLayer * PIO_base_new_layer( NULLOK(ParrotIOLayer *proto) );

PARROT_API
ParrotIOLayer * PIO_copy_stack( NULLOK(ParrotIOLayer *stack) );

PARROT_WARN_UNUSED_RESULT
PARROT_API
ParrotIOLayer * PIO_get_layer( SHIM_INTERP, NOTNULL(const char *name) )
        __attribute__nonnull__(2);

PARROT_API
ParrotIOLayer * PIO_pop_layer( PARROT_INTERP, NULLOK(PMC *pmc) )
        __attribute__nonnull__(1);

PARROT_API
INTVAL PIO_push_layer( PARROT_INTERP,
    NULLOK(PMC *pmc),
    NULLOK(ParrotIOLayer *layer) )
        __attribute__nonnull__(1);

STRING * PIO_pop_layer_str( PARROT_INTERP, NOTNULL(PMC *pmc) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PIO_push_layer_str( PARROT_INTERP, PMC *pmc, STRING *ls )
        __attribute__nonnull__(1);

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
