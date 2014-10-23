/*
 * Copyright (C) 2004-2014, Parrot Foundation.
 * Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
 *    2002, 2003, 2004, 2005, 2006, 2007 by Charles Bailey and others
 */

/*

=head1 NAME

src/platform/vms/exec.c

=head1 DESCRIPTION

Parrot functions to run VMS operating system commands.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

#include <clidef.h>

#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

static FILE* safe_popen(const char *cmd, const char *in_mode, int *psts);
static int do_spawn2(const char *cmd, int flags);
static void vms_get_subproc_handles(int pid, PIOHANDLE *handles);

/* HEADERIZER HFILE: none */

/*

=item C<INTVAL Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)>

Spawn off a subprocess provided in a string.  Wait for it to complete,
returning the return value of the process.

=cut

*/

INTVAL
Parrot_Run_OS_Command(PARROT_INTERP, STRING *command)
{
    char * const cmd = Parrot_str_to_cstring(interp, command);
    int status = do_spawn2(cmd, 0);
    return (status&1) ? 0 : 1;
}

/*

=item C<INTVAL Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)>

Spawn off a subprocess provided in command-line arguments.  Wait for it to
complete, returning the return value of the process.

=cut

*/

INTVAL
Parrot_Run_OS_Command_Argv(PARROT_INTERP, PMC *cmdargs)
{
    int  len = VTABLE_elements(interp, cmdargs);
    char **argv = mem_gc_allocate_n_typed(interp, (len+1), char*);
    char *cmd, *p;
    int status, i, cmdlen = 0, arglen;

    if (len == 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NOSPAWN,
            "Empty argument array for Run_OS_Command_Argv");

    for (i = 0; i < len; ++i) {
        STRING *s = VTABLE_get_string_keyed_int(interp, cmdargs, i);
        argv[i] = Parrot_str_to_cstring(interp, s);
        cmdlen += strlen(argv[i]);
    }
    p = cmd = mem_gc_allocate_n_typed(interp, (cmdlen+len), char);
    for (i = 0; i < len; ++i) {
        if (i != 0) *p++ = ' ';
        arglen = strlen(argv[i]);
        mem_copy_n_typed(p, argv[i], arglen, char);
        p += arglen;
    }

    status = do_spawn2(cmd, 0);

    mem_gc_free(interp, cmd);
    mem_gc_free(interp, argv);

    return (status&1) ? 0 : 1;
}

/*

=item C<UINTVAL Parrot_getpid(void)>

Parrot wrapper around standard library C<getpid()> function, returning an UINTVAL.

=cut

*/

UINTVAL
Parrot_getpid(void)
{
    return getpid();
}

/*

=item C<INTVAL Parrot_proc_exec(PARROT_INTERP, STRING *command, INTVAL flags,
PIOHANDLE *handles)>

Execute an external process.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_proc_exec(PARROT_INTERP, ARGIN(STRING *command), INTVAL flags,
        ARGMOD(PIOHANDLE *handles))
{
    int pid = 0;
    char * const cmd = Parrot_str_to_cstring(interp, command);

    pid = do_spawn2(cmd, CLI$M_NOWAIT);
    vms_get_subproc_handles(pid, handles);

    return pid;
}

/*

=item C<INTVAL Parrot_proc_waitpid(PARROT_INTERP, INTVAL pid)>

Wait for process with C<pid> to exit.

=cut

*/

INTVAL
Parrot_proc_waitpid(SHIM_INTERP, INTVAL pid)
{
    int status;

    waitpid(pid, &status, 0);

    if (WIFEXITED(status)) {
        status = WEXITSTATUS(status);
    }
    else {
        /* abnormal termination means non-zero exit status */
        status = 1;
    }

    return status;
}

/*

=back

=cut

*/

/* Stolen by Martin Vorlaender <mvorl@cpan.org> from: */
/*    vms.c
 *
 *    VMS-specific routines for perl5
 *
 *    Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
 *    2002, 2003, 2004, 2005, 2006, 2007 by Charles Bailey and others.
 *
 *    You may distribute under the terms of either the GNU General Public
 *    License or the Artistic License, as specified in the README file.
 *
 *    Please see Changes*.* or the Perl Repository Browser for revision history.
 */

/*

=head2 VMS-specific functions from perl5

=over

=cut

*/


#include <stdio.h>
#include <string.h>
#include <stat.h>
#include <errno.h>
#include <unistd.h>
#include <unixio.h>

#define __NEW_STARLET 1
#include ssdef
#include shrdef
#include stsdef
#include iodef
#include dcdef
#include clidef
#include dvidef
#include jpidef
#include syidef
#include libdef
#include lnmdef
#include devdef
#include psldef
#include rmsdef
#include namdef
#include descrip
#include efndef
#include libclidef
#include climsgdef
#include lib$routines
#include starlet

/* Define the don't-care event flag.
 * Use the system definition where possible
 */
#ifndef __VAX
#  if __VMS_VER >= 70000000
#    include efndef
#  endif
#endif

#ifndef EFN$C_ENF
#  define EFN$C_ENF 0
#endif

/* Set the maximum filespec size here as it is larger for EFS file
 * specifications.
 */
#ifndef __VAX
#  ifndef VMS_MAXRSS
#    ifdef NAML$C_MAXRSS
#      define VMS_MAXRSS (NAML$C_MAXRSS+1)
#      ifndef VMS_LONGNAME_SUPPORT
#        define VMS_LONGNAME_SUPPORT 1
#      endif /* VMS_LONGNAME_SUPPORT */
#    endif /* NAML$C_MAXRSS */
#  endif /* VMS_MAXRSS */
#endif

#ifndef VMS_MAXRSS
#  define VMS_MAXRSS (NAM$C_MAXRSS + 1)
#endif

/* New values with 7.3-2*/
/* why does max DCL have 4 byte subtracted from it? */
#if __CRTL_VER >= 70302000 && !defined(__VAX)
#  define MAX_DCL_SYMBOL       (8192)
#  define MAX_DCL_LINE_LENGTH  (4096 - 4)
#else
#  define MAX_DCL_SYMBOL       (1024)
#  define MAX_DCL_LINE_LENGTH  (1024 - 4)
#endif


/* Macros to set errno using the VAX thread-safe calls, if present */
#if (defined(__DECC) || defined(__DECCXX)) && !defined(__ALPHA)
#  define set_errno(v)      (cma$tis_errno_set_value(v))
void cma$tis_errno_set_value(int __value);  /* missing in some errno.h */
#  define set_vaxc_errno(v) (vaxc$errno = (v))
#else
#  define set_errno(v)      (errno = (v))
#  define set_vaxc_errno(v) (vaxc$errno = (v))
#endif

#define SETERRNO(errcode, vmserrcode) \
    do {                             \
        set_errno(errcode);          \
        set_vaxc_errno(vmserrcode);  \
    } while (0)

/* Handy way to vet calls to VMS system services and RTL routines. */
#define _ckvmssts(call)                                            \
    do {                                                           \
        register unsigned long int __ckvms_sts;                    \
        if (!((__ckvms_sts = (call))&1)) {                         \
            SETERRNO(EVMSERR, __ckvms_sts);                        \
            fprintf(stderr, "Fatal VMS error (status=%d) at %s, line %d", \
                    __ckvms_sts, __FILE__, __LINE__);                   \
            lib$signal(__ckvms_sts);                                    \
        }                                                               \
    } while (0)


#ifdef __VAX
typedef unsigned long QUAD_t[2];
#  define QUAD_PTR(var)  (var)
#else
#  include gen64def
typedef struct _generic_64 QUAD_t;
#  define QUAD_PTR(var)  &(var)
#endif


/*{{{  my_popen and my_pclose*/

typedef struct _iosb           IOSB;
typedef struct _iosb*         pIOSB;
typedef struct _pipe           Pipe;
typedef struct _pipe*         pPipe;
typedef struct pipe_details    Info;
typedef struct pipe_details*  pInfo;
typedef struct _tochildbuf      CBuf;
typedef struct _tochildbuf*    pCBuf;

struct _iosb {
    unsigned short status;
    unsigned short count;
    unsigned long  dvispec;
};

#pragma member_alignment save
#pragma nomember_alignment quadword
#ifdef __VAX
typedef struct _srqp {          /* VMS self-relative queue entry */
    unsigned long qptr[2];
} RQE, *pRQE;
static RQE  RQE_ZERO = {0, 0};
#else
typedef __int64 RQE, *pRQE;
static RQE  RQE_ZERO = 0;
#endif
#pragma member_alignment restore

struct _tochildbuf {
    RQE             q;
    int             eof;
    unsigned short  size;
    char            *buf;
};

struct _pipe {
    RQE            free;
    RQE            wait;
    int            fd_out;
    unsigned short chan_in;
    unsigned short chan_out;
    char          *buf;
    unsigned int   bufsize;
    IOSB           iosb;
    IOSB           iosb2;
    int           *pipe_done;
    int            retry;
    int            type;
    int            shut_on_empty;
    int            need_wake;
    pPipe         *home;
    pInfo          info;
    pCBuf          curr;
    pCBuf          curr2;
};

struct pipe_details {
    pInfo           next;
    FILE *fp;                       /* file pointer to pipe mailbox */
    unsigned int pid;               /* PID of subprocess */
    int mode;                       /* == 'r' if pipe open for reading */
    int done;                       /* subprocess has completed */
    int waiting;                    /* waiting for completion/closure */
    int             closing;        /* my_pclose is closing this pipe */
    unsigned long   completion;     /* termination status of subprocess */
    pPipe           in;             /* pipe in to sub */
    pPipe           out;            /* pipe out of sub */
    pPipe           err;            /* pipe of sub's sys$error */
    int             in_done;        /* true when in pipe finished */
    int             out_done;
    int             err_done;
    unsigned short  xchan;	  /* channel to debug xterm */
    unsigned short  xchan_valid;    /* channel is assigned */
};

struct exit_control_block {
    struct exit_control_block *flink;
    unsigned int (*exit_routine)(void);
    unsigned int arg_count;
    unsigned int *status_address;
    unsigned int exit_status;
};

typedef struct _closed_pipes {
    int             pid;            /* PID of subprocess */
    unsigned long   completion;     /* termination status of subprocess */
} Xpipe, *pXpipe;
#define NKEEPCLOSED 50
static Xpipe closed_list[NKEEPCLOSED];
static int   closed_index = 0;
static int   closed_num = 0;

#define RETRY_DELAY     "0 ::0.20"
#define MAX_RETRY              50

static unsigned int pipe_ef = 0;          /* first call to safe_popen inits these*/
static unsigned long mypid;
static QUAD_t delaytime;

static pInfo open_pipes = NULL;
static $DESCRIPTOR(nl_desc, "NL:");

#define PIPE_COMPLETION_WAIT    30  /* seconds, for EOF/FORCEX wait */


static int my_pclose(FILE *fp);

/*

=item C<static unsigned int pipe_exit_routine(void)>

Carefully exit any pending I/O on pipes.

=cut

*/

static unsigned int
pipe_exit_routine(void)
{
    pInfo info;
    unsigned int retsts = SS$_NORMAL, abort = SS$_TIMEOUT;
    int sts, did_stuff, j;

    /*
     * Flush any pending i/o, but since we are in process run-down, be
     * careful about referencing PerlIO structures that may already have
     * been deallocated.  We may not even have an interpreter anymore.
     */
    info = open_pipes;
    while (info) {
        if (info->fp)
            fflush((FILE *)info->fp);
        info = info->next;
    }

    /*
      next we try sending an EOF...ignore if doesn't work, make sure we
      don't hang
    */
    did_stuff = 0;
    info = open_pipes;

    while (info) {
        _ckvmssts(sys$setast(0));
        if (info->in && !info->in->shut_on_empty) {
            _ckvmssts(sys$qio(EFN$C_ENF, info->in->chan_in, IO$_WRITEOF,
                              0, 0, 0, 0, 0, 0, 0, 0, 0));
            info->waiting = 1;
            did_stuff = 1;
        }
        _ckvmssts(sys$setast(1));
        info = info->next;
    }

    /* wait for EOF to have effect, up to ~ 30 sec [default] */

    for (j = 0; did_stuff && j < PIPE_COMPLETION_WAIT; j++) {
        int nwait = 0;

        info = open_pipes;
        while (info) {
            _ckvmssts(sys$setast(0));
            if (info->waiting && info->done)
                info->waiting = 0;
            nwait += info->waiting;
            _ckvmssts(sys$setast(1));
            info = info->next;
        }
        if (!nwait) break;
        sleep(1);
    }

    did_stuff = 0;
    info = open_pipes;
    while (info) {
        _ckvmssts(sys$setast(0));
        if (!info->done) { /* Tap them gently on the shoulder . . .*/
            sts = sys$forcex(&info->pid, 0, abort);
            if (!(sts&1) && sts != SS$_NONEXPR) _ckvmssts(sts);
            did_stuff = 1;
        }
        _ckvmssts(sys$setast(1));
        info = info->next;
    }

    /* again, wait for effect */

    for (j = 0; did_stuff && j < PIPE_COMPLETION_WAIT; j++) {
        int nwait = 0;

        info = open_pipes;
        while (info) {
            _ckvmssts(sys$setast(0));
            if (info->waiting && info->done)
                info->waiting = 0;
            nwait += info->waiting;
            _ckvmssts(sys$setast(1));
            info = info->next;
        }
        if (!nwait) break;
        sleep(1);
    }

    info = open_pipes;
    while (info) {
        _ckvmssts(sys$setast(0));
        if (!info->done) {  /* We tried to be nice . . . */
            sts = sys$delprc(&info->pid, 0);
            if (!(sts&1) && sts != SS$_NONEXPR) _ckvmssts(sts);
            info->done = 1;  /* sys$delprc is as done as we're going to get. */
        }
        _ckvmssts(sys$setast(1));
        info = info->next;
    }

    while (open_pipes) {
        if ((sts = my_pclose(open_pipes->fp)) == -1) retsts = vaxc$errno;
        else if (!(sts & 1)) retsts = sts;
    }
    return retsts;
}

static struct exit_control_block pipe_exitblock = {
    (struct exit_control_block *) 0,
    pipe_exit_routine,
    0,
    &pipe_exitblock.exit_status,
    0
};

static void pipe_mbxtofd_ast(pPipe p);
static void pipe_tochild1_ast(pPipe p);
static void pipe_tochild2_ast(pPipe p);

#ifdef __VAX
typedef unsigned long ASTparm_t;
#else
typedef unsigned __int64 ASTparm_t;
#endif

/*

=item C<static void popen_completion_ast(pInfo info)>

??

=cut

*/

static void
popen_completion_ast(pInfo info)
{
    pInfo i = open_pipes;
    int iss;

    info->completion &= 0x0FFFFFFF; /* strip off "control" field */
    closed_list[closed_index].pid = info->pid;
    closed_list[closed_index].completion = info->completion;
    closed_index++;
    if (closed_index == NKEEPCLOSED)
        closed_index = 0;
    closed_num++;

    while (i) {
        if (i == info) break;
        i = i->next;
    }
    if (!i) return;       /* unlinked, probably freed too */

    info->done = TRUE;

    /*
      Writing to subprocess ...
      if my_pclose'd: EOF already sent, should shutdown chan_in part of pipe

      chan_out may be waiting for "done" flag, or hung waiting
      for i/o completion to child...cancel the i/o.  This will
      put it into "snarf mode" (done but no EOF yet) that discards
      input.

      Output from subprocess (stdout, stderr) needs to be flushed and
      shut down.   We try sending an EOF, but if the mbx is full the pipe
      routine should still catch the "shut_on_empty" flag, telling it to
      use immediate-style reads so that "mbx empty" -> EOF.
    */
    if (info->in && !info->in_done) {               /* only for mode=w */
        if (info->in->shut_on_empty && info->in->need_wake) {
            info->in->need_wake = FALSE;
            _ckvmssts(sys$dclast(pipe_tochild2_ast, (ASTparm_t)info->in, 0));
        }
        else {
            _ckvmssts(sys$cancel(info->in->chan_out));
        }
    }

    if (info->out && !info->out_done) {             /* were we also piping output? */
        info->out->shut_on_empty = TRUE;
        iss = sys$qio(EFN$C_ENF, info->out->chan_in, IO$_WRITEOF|IO$M_NORSWAIT,
                      0, 0, 0, 0, 0, 0, 0, 0, 0);
        if (iss == SS$_MBFULL) iss = SS$_NORMAL;
        _ckvmssts(iss);
    }

    if (info->err && !info->err_done) {        /* we were piping stderr */
        info->err->shut_on_empty = TRUE;
        iss = sys$qio(EFN$C_ENF, info->err->chan_in, IO$_WRITEOF|IO$M_NORSWAIT,
                      0, 0, 0, 0, 0, 0, 0, 0, 0);
        if (iss == SS$_MBFULL) iss = SS$_NORMAL;
        _ckvmssts(iss);
    }
    _ckvmssts(sys$setef(pipe_ef));

}

static unsigned long int setup_cmddsc(const char *cmd, int check_img,
                                      int *suggest_quote, struct dsc$descriptor_s **pvmscmd);
static void vms_execfree(struct dsc$descriptor_s *vmscmd);
static void pipe_infromchild_ast(pPipe p);
static void create_mbx(unsigned short int *, struct dsc$descriptor_s *);

/*

=item C<static pPipe pipe_tochild_setup(char *rmbx, char *wmbx)>

I'm using LIB$(GET|FREE)_VM here so that we can allocate and deallocate
inside an AST routine without worrying about reentrancy and which Perl
memory allocator is being used.

We read data and queue up the buffers, then spit them out one at a
time to the output mailbox when the output mailbox is ready for one.

=cut

*/

#define INITIAL_TOCHILDQUEUE  2

static pPipe
pipe_tochild_setup(char *rmbx, char *wmbx)
{
    pPipe p;
    pCBuf b;
    char mbx1[64], mbx2[64];
    struct dsc$descriptor_s d_mbx1 = {sizeof mbx1, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx1};
    struct dsc$descriptor_s d_mbx2 = {sizeof mbx2, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx2};
    int dviitm = DVI$_DEVBUFSIZ;
    int j, n;

    n = sizeof (Pipe);
    _ckvmssts(lib$get_vm(&n, &p));

    create_mbx(&p->chan_in , &d_mbx1);
    create_mbx(&p->chan_out, &d_mbx2);
    _ckvmssts(lib$getdvi(&dviitm, &p->chan_in, 0, &p->bufsize));

    p->buf           = 0;
    p->shut_on_empty = FALSE;
    p->need_wake     = FALSE;
    p->type          = 0;
    p->retry         = 0;
    p->iosb.status   = SS$_NORMAL;
    p->iosb2.status  = SS$_NORMAL;
    p->free          = RQE_ZERO;
    p->wait          = RQE_ZERO;
    p->curr          = 0;
    p->curr2         = 0;
    p->info          = 0;

    n = sizeof (CBuf) + p->bufsize;

    for (j = 0; j < INITIAL_TOCHILDQUEUE; j++) {
        _ckvmssts(lib$get_vm(&n, &b));
        b->buf = (char *) b + sizeof (CBuf);
        _ckvmssts(lib$insqhi((unsigned int *)b, &p->free));
    }

    pipe_tochild2_ast(p);
    pipe_tochild1_ast(p);
    strcpy(wmbx, mbx1);
    strcpy(rmbx, mbx2);
    return p;
}

/*

=item C<static void pipe_tochild1_ast(pPipe p)>

Reads the MBX Perl is writing, and queues

=cut

*/

static void
pipe_tochild1_ast(pPipe p)
{
    pCBuf b = p->curr;
    int iss = p->iosb.status;
    int eof = (iss == SS$_ENDOFFILE);
    int sts;

    if (p->retry) {
        if (eof) {
            p->shut_on_empty = TRUE;
            b->eof = TRUE;
            _ckvmssts(sys$dassgn(p->chan_in));
        }
        else  {
            _ckvmssts(iss);
        }

        b->eof  = eof;
        b->size = p->iosb.count;
        _ckvmssts(sts = lib$insqhi((unsigned int *)b, &p->wait));
        if (p->need_wake) {
            p->need_wake = FALSE;
            _ckvmssts(sys$dclast(pipe_tochild2_ast, (ASTparm_t)p, 0));
        }
    }
    else {
        p->retry = 1;   /* initial call */
    }

    if (eof) {                  /* flush the free queue, return when done */
        int n = sizeof (CBuf) + p->bufsize;
        while (1) {
            iss = lib$remqti(&p->free, &b);
            if (iss == LIB$_QUEWASEMP) return;
            _ckvmssts(iss);
            _ckvmssts(lib$free_vm(&n, &b));
        }
    }

    iss = lib$remqti(&p->free, &b);
    if (iss == LIB$_QUEWASEMP) {
        int n = sizeof (CBuf) + p->bufsize;
        _ckvmssts(lib$get_vm(&n, &b));
        b->buf = (char *) b + sizeof (CBuf);
    }
    else {
        _ckvmssts(iss);
    }

    p->curr = b;
    iss = sys$qio(EFN$C_ENF, p->chan_in,
                  IO$_READVBLK|(p->shut_on_empty ? IO$M_NOWAIT : 0),
                  &p->iosb,
                  pipe_tochild1_ast, (ASTparm_t)p, b->buf, p->bufsize, 0, 0, 0, 0);
    if (iss == SS$_ENDOFFILE && p->shut_on_empty) iss = SS$_NORMAL;
    _ckvmssts(iss);
}


/*

=item C<static void pipe_tochild2_ast(pPipe p)>

Writes queued buffers to output, waits for each to complete before
doing the next.

=cut

*/

static void
pipe_tochild2_ast(pPipe p)
{
    pCBuf b = p->curr2;
    int iss = p->iosb2.status;
    int n = sizeof (CBuf) + p->bufsize;
    int done = (p->info && p->info->done) || iss == SS$_CANCEL || iss == SS$_ABORT;

    do {
        if (p->type) {         /* type=1 has old buffer, dispose */
            if (p->shut_on_empty)
                _ckvmssts(lib$free_vm(&n, &b));
            else
                _ckvmssts(lib$insqhi((unsigned int *)b, &p->free));
            p->type = 0;
        }

        iss = lib$remqti(&p->wait, &b);
        if (iss == LIB$_QUEWASEMP) {
            if (p->shut_on_empty) {
                if (done) {
                    _ckvmssts(sys$dassgn(p->chan_out));
                    *p->pipe_done = TRUE;
                    _ckvmssts(sys$setef(pipe_ef));
                }
                else {
                    _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_WRITEOF,
                                      &p->iosb2,
                                      pipe_tochild2_ast, (ASTparm_t)p, 0, 0, 0, 0, 0, 0));
                }
                return;
            }
            p->need_wake = TRUE;
            return;
        }
        _ckvmssts(iss);
        p->type = 1;
    } while (done);


    p->curr2 = b;
    if (b->eof)
        _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_WRITEOF, &p->iosb2,
                          pipe_tochild2_ast, (ASTparm_t)p, 0, 0, 0, 0, 0, 0));
    else
        _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_WRITEVBLK, &p->iosb2,
                          pipe_tochild2_ast, (ASTparm_t)p, b->buf, b->size, 0, 0, 0, 0));

    return;
}

/*

=item C<static pPipe pipe_infromchild_setup(char *rmbx, char *wmbx)>

??

=cut

*/

static pPipe
pipe_infromchild_setup(char *rmbx, char *wmbx)
{
    pPipe p;
    char mbx1[64], mbx2[64];
    struct dsc$descriptor_s d_mbx1 = {sizeof mbx1, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx1};
    struct dsc$descriptor_s d_mbx2 = {sizeof mbx2, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx2};
    int dviitm = DVI$_DEVBUFSIZ;
    int n;

    n = sizeof (Pipe);
    _ckvmssts(lib$get_vm(&n, &p));
    create_mbx(&p->chan_in , &d_mbx1);
    create_mbx(&p->chan_out, &d_mbx2);

    _ckvmssts(lib$getdvi(&dviitm, &p->chan_in, 0, &p->bufsize));
    n = p->bufsize * sizeof (char);
    _ckvmssts(lib$get_vm(&n, &p->buf));
    p->shut_on_empty = FALSE;
    p->info   = 0;
    p->type   = 0;
    p->iosb.status = SS$_NORMAL;
    pipe_infromchild_ast(p);

    strcpy(wmbx, mbx1);
    strcpy(rmbx, mbx2);
    return p;
}

/*

=item C<static void pipe_infromchild_ast(pPipe p)>

??

=cut

*/

static void
pipe_infromchild_ast(pPipe p)
{
    int iss = p->iosb.status;
    int eof = (iss == SS$_ENDOFFILE);
    int myeof = (eof && (p->iosb.dvispec == mypid || p->iosb.dvispec == 0));
    int kideof = (eof && (p->iosb.dvispec == p->info->pid));

    if (p->info && p->info->closing && p->chan_out)  {           /* output shutdown */
        _ckvmssts(sys$dassgn(p->chan_out));
        p->chan_out = 0;
    }

    /* read completed:
       input shutdown if EOF from self (done or shut_on_empty)
       output shutdown if closing flag set (my_pclose)
       send data/eof from child or eof from self
       otherwise, re-read (snarf of data from child)
    */

    if (p->type == 1) {
        p->type = 0;
        if (myeof && p->chan_in) {                  /* input shutdown */
            _ckvmssts(sys$dassgn(p->chan_in));
            p->chan_in = 0;
        }

        if (p->chan_out) {
            if (myeof || kideof) {      /* pass EOF to parent */
                _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_WRITEOF, &p->iosb,
                                  pipe_infromchild_ast, (ASTparm_t)p,
                                  0, 0, 0, 0, 0, 0));
                return;
            }
            else if (eof) {       /* eat EOF --- fall through to read*/
            }
            else {                /* transmit data */
                _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_WRITEVBLK, &p->iosb,
                                  pipe_infromchild_ast, (ASTparm_t)p,
                                  p->buf, p->iosb.count, 0, 0, 0, 0));
                return;
            }
        }
    }

    /*  everything shut? flag as done */

    if (!p->chan_in && !p->chan_out) {
        *p->pipe_done = TRUE;
        _ckvmssts(sys$setef(pipe_ef));
        return;
    }

    /* write completed (or read, if snarfing from child)
       if still have input active,
       queue read...immediate mode if shut_on_empty so we get EOF if empty
       otherwise,
       check if Perl reading, generate EOFs as needed
    */

    if (p->type == 0) {
        p->type = 1;
        if (p->chan_in) {
            iss = sys$qio(EFN$C_ENF, p->chan_in, IO$_READVBLK|(p->shut_on_empty ? IO$M_NOW : 0),
                          &p->iosb,
                          pipe_infromchild_ast, (ASTparm_t)p,
                          p->buf, p->bufsize, 0, 0, 0, 0);
            if (p->shut_on_empty && iss == SS$_ENDOFFILE) iss = SS$_NORMAL;
            _ckvmssts(iss);
        }
        else {           /* send EOFs for extra reads */
            p->iosb.status = SS$_ENDOFFILE;
            p->iosb.dvispec = 0;
            _ckvmssts(sys$qio(EFN$C_ENF, p->chan_out, IO$_SETMODE|IO$M_READATTN,
                              0, 0, 0,
                              pipe_infromchild_ast, (ASTparm_t)p, 0, 0, 0, 0));
        }
    }
}

#pragma member_alignment save
#pragma nomember_alignment longword
struct item_list_3 {
    unsigned short len;
    unsigned short code;
    void * bufadr;
    unsigned short * retadr;
};
#pragma member_alignment restore

/*

=item C<static pPipe pipe_mbxtofd_setup(int fd, char *out)>

Setup to send pipe data to file

=cut

*/

static pPipe
pipe_mbxtofd_setup(int fd, char *out)
{
    pPipe p;
    char mbx[64];
    int dviitm = DVI$_DEVBUFSIZ;
    struct stat s;
    struct dsc$descriptor_s d_mbx = {sizeof mbx, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx};
    int n = sizeof (Pipe);

    /* things like terminals and mbx's don't need this filter */
    if (fd && fstat(fd, &s) == 0) {
        unsigned long devchar;
        char device[65];
        unsigned short dev_len;
        struct dsc$descriptor_s d_dev;
        char * cptr;
        struct item_list_3 items[] =
            {{sizeof (devchar) , DVI$_DEVCHAR   , &devchar, NULL    },
             {sizeof (device)-1, DVI$_FULLDEVNAM, device  , &dev_len},
             {               0,               0,        0,        0}};
        int status;
        IOSB dvi_iosb;

        cptr = getname(fd, out, 1);
        if (cptr == NULL) _ckvmssts(SS$_NOSUCHDEV);
        d_dev.dsc$a_pointer = out;
        d_dev.dsc$w_length = strlen(out);
        d_dev.dsc$b_dtype = DSC$K_DTYPE_T;
        d_dev.dsc$b_class = DSC$K_CLASS_S;

        status = sys$getdviw(EFN$C_ENF, 0, &d_dev, items, &dvi_iosb, NULL, 0, NULL);
        _ckvmssts(status);
        if ($VMS_STATUS_SUCCESS(dvi_iosb.status)) {
            device[dev_len] = 0;

            if (!(devchar & DEV$M_DIR)) {
                strcpy(out, device);
                return 0;
            }
        }
    }

    _ckvmssts(lib$get_vm(&n, &p));
    p->fd_out = dup(fd);
    create_mbx(&p->chan_in, &d_mbx);
    _ckvmssts(lib$getdvi(&dviitm, &p->chan_in, 0, &p->bufsize));
    n = (p->bufsize+1) * sizeof (char);
    _ckvmssts(lib$get_vm(&n, &p->buf));
    p->shut_on_empty = FALSE;
    p->retry = 0;
    p->info  = 0;
    strcpy(out, mbx);

    _ckvmssts(sys$qio(EFN$C_ENF, p->chan_in, IO$_READVBLK, &p->iosb,
                      pipe_mbxtofd_ast, (ASTparm_t)p,
                      p->buf, p->bufsize, 0, 0, 0, 0));

    return p;
}

/*

=item C<static void pipe_mbxtofd_ast(pPipe p)>

Ready to send pipe data to file

=cut

*/

static void
pipe_mbxtofd_ast(pPipe p)
{
    int iss = p->iosb.status;
    int done = p->info->done;
    int iss2;
    int eof = (iss == SS$_ENDOFFILE);
    int myeof = eof && ((p->iosb.dvispec == mypid)||(p->iosb.dvispec == 0));
    int err = !(iss&1) && !eof;

    if (done && myeof) {               /* end piping */
        close(p->fd_out);
        sys$dassgn(p->chan_in);
        *p->pipe_done = TRUE;
        _ckvmssts(sys$setef(pipe_ef));
        return;
    }

    if (!err && !eof) {             /* good data to send to file */
        p->buf[p->iosb.count] = '\n';
        iss2 = write(p->fd_out, p->buf, p->iosb.count+1);
        if (iss2 < 0) {
            p->retry++;
            if (p->retry < MAX_RETRY) {
                _ckvmssts(sys$setimr(EFN$C_ENF, QUAD_PTR(delaytime),
                                     pipe_mbxtofd_ast, (ASTparm_t)p, 0));
                return;
            }
        }
        p->retry = 0;
    }
    else if (err) {
        _ckvmssts(iss);
    }


    iss = sys$qio(EFN$C_ENF, p->chan_in, IO$_READVBLK|(p->shut_on_empty ? IO$M_NOW : 0),
                  &p->iosb,
                  pipe_mbxtofd_ast, (ASTparm_t)p,
                  p->buf, p->bufsize, 0, 0, 0, 0);
    if (p->shut_on_empty && (iss == SS$_ENDOFFILE)) iss = SS$_NORMAL;
    _ckvmssts(iss);
}


#ifdef _USE_STD_STAT
#  define VMS_INO_T_COMPARE(__a, __b) ((__a) != (__b))
#  define VMS_INO_T_COPY(__a, __b) (__a) = (__b)
#else
#  define VMS_INO_T_COMPARE(__a, __b) memcmp(&(__a), &(__b), 6)
#  define VMS_INO_T_COPY(__a, __b) memcpy(&(__a), &(__b), 6)
#endif

/*

=item C<static FILE * vmspipe_tempfile(void)>

Create a tempfile

=cut

*/

static FILE *
vmspipe_tempfile(void)
{
    char file[VMS_MAXRSS];
    FILE *fp;
    static int index = 0;
    stat_t s0, s1;
    int cmp_result;

    /* create a tempfile */

    /* we can't go from   W, shr=get to  R, shr=get without
       an intermediate vulnerable state, so don't bother trying...

       and lib$spawn doesn't shr=put, so have to close the write

       So... match up the creation date/time and the FID to
       make sure we're dealing with the same file
    */

    index++;
    if (1) { /* !decc_filename_unix_only */
        sprintf(file, "sys$scratch:parrotpipe_%08.8x_%d.com", mypid, index);
        fp = fopen(file, "w");
        if (!fp) {
            sprintf(file, "sys$login:parrotpipe_%08.8x_%d.com", mypid, index);
            fp = fopen(file, "w");
            if (!fp) {
                sprintf(file, "sys$disk:[]parrotpipe_%08.8x_%d.com", mypid, index);
                fp = fopen(file, "w");
            }
        }
    }
    else { /* XXX dead code */
        sprintf(file, "/tmp/parrotpipe_%08.8x_%d.com", mypid, index);
        fp = fopen(file, "w");
        if (!fp) {
            sprintf(file, "/sys$login/parrotpipe_%08.8x_%d.com", mypid, index);
            fp = fopen(file, "w");
            if (!fp) {
                sprintf(file, "./parrotpipe_%08.8x_%d.com", mypid, index);
                fp = fopen(file, "w");
            }
        }
    }
    if (!fp) return 0;  /* we're hosed */

    fprintf(fp, "$! 'f$verify(0)'\n");
    fprintf(fp, "$!  ---  protect against nonstandard definitions ---\n");
    fprintf(fp, "$ parrot_cfile  = f$environment(\"procedure\")\n");
    fprintf(fp, "$ parrot_define = \"define/nolog\"\n");
    fprintf(fp, "$ parrot_on     = \"set noon\"\n");
    fprintf(fp, "$ parrot_exit   = \"exit\"\n");
    fprintf(fp, "$ parrot_del    = \"delete\"\n");
    fprintf(fp, "$ pif         = \"if\"\n");
    fprintf(fp, "$!  --- define i/o redirection (sys$output set by lib$spawn)\n");
    fprintf(fp, "$ pif parrot_popen_in  .nes. \"\" then parrot_define/user/name_attributes=confine"
            " sys$input  'parrot_popen_in'\n");
    fprintf(fp, "$ pif parrot_popen_err .nes. \"\" then parrot_define/user/name_attributes=confine"
            " sys$error  'parrot_popen_err'\n");
    fprintf(fp, "$ pif parrot_popen_out .nes. \"\" then parrot_define     "
            " sys$output 'parrot_popen_out'\n");
    fprintf(fp, "$!  --- build command line to get max possible length\n");
    fprintf(fp, "$ c=parrot_popen_cmd0\n");
    fprintf(fp, "$ c=c+parrot_popen_cmd1\n");
    fprintf(fp, "$ c=c+parrot_popen_cmd2\n");
    fprintf(fp, "$ x=parrot_popen_cmd3\n");
    fprintf(fp, "$ c=c+x\n");
    fprintf(fp, "$ parrot_on\n");
    fprintf(fp, "$ 'c'\n");
    fprintf(fp, "$ parrot_status = $STATUS\n");
    fprintf(fp, "$ parrot_del  'parrot_cfile'\n");
    fprintf(fp, "$ parrot_exit 'parrot_status'\n");
    fsync(fileno(fp));

    fgetname(fp, file, 1);
    fstat(fileno(fp), &s0);
    fclose(fp);

#if 0
    if (decc_filename_unix_only)
        int_tounixspec(file, file, NULL);
#endif
    fp = fopen(file, "r", "shr=get");
    if (!fp) return 0;
    fstat(fileno(fp), &s1);

    cmp_result = VMS_INO_T_COMPARE(s0.st_ino, s1.st_ino);
    if ((cmp_result != 0) && (s0.st_ctime != s1.st_ctime))  {
        fclose(fp);
        return 0;
    }

    return fp;
}

/*

=item C<static int vms_is_syscommand_xterm(void)>

Check if sys$command is a decterm or xterm

=cut

*/

static int
vms_is_syscommand_xterm(void)
{
    $DESCRIPTOR(syscommand_dsc, "SYS$COMMAND");
    $DESCRIPTOR(decwdisplay_dsc, "DECW$DISPLAY");
    unsigned long devchar;
    unsigned long devclass;
    struct item_list_3 items[] =
        {{sizeof (devchar), DVI$_DEVCHAR, &devchar, NULL},
         {              0,            0,        0,    0}};
    IOSB dvi_iosb;
    int status;

    /* Very simple check to guess if sys$command is a decterm? */
    /* First see if the DECW$DISPLAY: device exists */

    status = sys$getdviw(EFN$C_ENF, 0, &decwdisplay_dsc, items, &dvi_iosb, NULL, 0, NULL);
    if ($VMS_STATUS_SUCCESS(status))
        status = dvi_iosb.status;

    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(EVMSERR, status);
        return -1;
    }

    /* If it does, then for now assume that we are on a workstation */
    /* Now verify that SYS$COMMAND is a terminal */
    /* for creating the debugger DECTerm */

    items[0].len = sizeof (devclass);
    items[0].code = DVI$_DEVCLASS;
    items[0].bufadr = &devclass;
    items[0].retadr = NULL;
    items[1].len = 0;
    items[1].code = 0;

    status = sys$getdviw(EFN$C_ENF, 0, &syscommand_dsc, items, &dvi_iosb, NULL, 0, NULL);
    if ($VMS_STATUS_SUCCESS(status))
        status = dvi_iosb.status;

    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(EVMSERR, status);
        return -1;
    }

    return (devclass == DC$_TERM) ? 0 : -1;
}

/* Routine to create a decterm for use with the Perl debugger */
/* No headers, this information was found in the Programming Concepts Manual */
static int (*decw_term_port)
   (const struct dsc$descriptor_s * display,
    const struct dsc$descriptor_s * setup_file,
    const struct dsc$descriptor_s * customization,
    struct dsc$descriptor_s * result_device_name,
    unsigned short * result_device_name_length,
    void * controller,
    void * char_buffer,
    void * char_change_buffer) = 0;

/*

=item C<static FILE* create_forked_xterm(const char *cmd, const char *mode)>

If we are on a DECTerm, we can pretend to fork xterms when requested.

=cut

*/

static FILE*
create_forked_xterm(const char *cmd, const char *mode)
{
    int status;
    int ret_stat;
    char * ret_char;
    char device_name[65];
    unsigned short device_name_len;
    struct dsc$descriptor_s customization_dsc;
    struct dsc$descriptor_s device_name_dsc;
    const char * cptr;
    char customization[200];
    char title[40];
    pInfo info = NULL;
    char mbx1[64];
    unsigned short p_chan;
    int n;
    IOSB iosb;
    const char * cust_str =
        "DECW$TERMINAL.iconName:\tPerl Dbg\nDECW$TERMINAL.title:\t%40s\n";
    struct dsc$descriptor_s d_mbx1 = {sizeof mbx1, DSC$K_DTYPE_T, DSC$K_CLASS_S, mbx1};

    /* LIB$FIND_IMAGE_SIGNAL needs a handler */
    /*---------------------------------------*/
    VAXC$ESTABLISH((__vms_handler)lib$sig_to_ret);

    /* Make sure that this is from the Perl debugger */
    ret_char = strstr(cmd, " xterm ");
    if (ret_char == NULL) return NULL;
    cptr = ret_char + 7;
    ret_char = strstr(cmd, "tty");
    if (ret_char == NULL) return NULL;
    ret_char = strstr(cmd, "sleep");
    if (ret_char == NULL) return NULL;

    if (decw_term_port == 0) {
        $DESCRIPTOR(filename1_dsc, "DECW$TERMINALSHR12");
        $DESCRIPTOR(filename2_dsc, "DECW$TERMINALSHR");
        $DESCRIPTOR(decw_term_port_dsc, "DECW$TERM_PORT");

        status = lib$find_image_symbol
            (&filename1_dsc,
             &decw_term_port_dsc,
             (void *)&decw_term_port,
             NULL,
             0);

        /* Try again with the other image name */
        if (!$VMS_STATUS_SUCCESS(status)) {
            status = lib$find_image_symbol
                (&filename2_dsc,
                 &decw_term_port_dsc,
                 (void *)&decw_term_port,
                 NULL,
                 0);
        }
    }

    /* No decw$term_port, give it up */
    if (!$VMS_STATUS_SUCCESS(status))
        return NULL;

    /* Are we on a workstation? */
    /* to do: capture the rows / columns and pass their properties */
    ret_stat = vms_is_syscommand_xterm();
    if (ret_stat < 0)
        return NULL;

    /* Make the title: */
    ret_char = strstr(cptr, "-title");
    if (ret_char != NULL) {
        while ((*cptr != 0) && (*cptr != '\"')) {
            cptr++;
        }
        if (*cptr == '\"')
            cptr++;
        n = 0;
        while ((*cptr != 0) && (*cptr != '\"')) {
            title[n] = *cptr;
            if (++n == 39) {
                title[39] = 0;
                break;
            }
            cptr++;
        }
        title[n] = 0;
    }
    else {
        /* Default title */
        strcpy(title, "Perl Debug DECTerm");
    }
    sprintf(customization, cust_str, title);

    customization_dsc.dsc$a_pointer = customization;
    customization_dsc.dsc$w_length = strlen(customization);
    customization_dsc.dsc$b_dtype = DSC$K_DTYPE_T;
    customization_dsc.dsc$b_class = DSC$K_CLASS_S;

    device_name_dsc.dsc$a_pointer = device_name;
    device_name_dsc.dsc$w_length = sizeof device_name -1;
    device_name_dsc.dsc$b_dtype = DSC$K_DTYPE_T;
    device_name_dsc.dsc$b_class = DSC$K_CLASS_S;

    device_name_len = 0;

    /* Try to create the window */
    status = (*decw_term_port)
        (NULL,
         NULL,
         &customization_dsc,
         &device_name_dsc,
         &device_name_len,
         NULL,
         NULL,
         NULL);
    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(EVMSERR, status);
        return NULL;
    }

    device_name[device_name_len] = '\0';

    /* Need to set this up to look like a pipe for cleanup */
    n = sizeof (Info);
    status = lib$get_vm(&n, &info);
    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(ENOMEM, status);
        return NULL;
    }

    info->mode       = *mode;
    info->done       = FALSE;
    info->completion = 0;
    info->closing    = FALSE;
    info->in         = 0;
    info->out        = 0;
    info->err        = 0;
    info->fp         = NULL;
    info->waiting    = 0;
    info->in_done    = TRUE;
    info->out_done   = TRUE;
    info->err_done   = TRUE;

    /* Assign a channel on this so that it will persist, and not login */
    /* We stash this channel in the info structure for reference. */
    /* The created xterm self destructs when the last channel is removed */
    /* and it appears that perl5db.pl (perl debugger) does this routinely */
    /* So leave this assigned. */
    device_name_dsc.dsc$w_length = device_name_len;
    status = sys$assign(&device_name_dsc, &info->xchan, 0, 0);
    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(EVMSERR, status);
        return NULL;
    }
    info->xchan_valid = 1;

    /* Now create a mailbox to be read by the application */
    create_mbx(&p_chan, &d_mbx1);

    /* write the name of the created terminal to the mailbox */
    status = sys$qiow(EFN$C_ENF, p_chan, IO$_WRITEVBLK|IO$M_NOW,
                      &iosb, NULL, 0, device_name, device_name_len, 0, 0, 0, 0);

    if (!$VMS_STATUS_SUCCESS(status)) {
        SETERRNO(EVMSERR, status);
        return NULL;
    }

    info->fp  = fopen(mbx1, mode);

    /* Done with this channel */
    sys$dassgn(p_chan);

    /* If any errors, then clean up */
    if (!info->fp) {
        n = sizeof (Info);
        _ckvmssts(lib$free_vm(&n, &info));
        return NULL;
    }

    /* All done */
    return info->fp;
}

static void set_user_lnm(const char *name, const char *eqv);
static int my_pclose_pinfo(pInfo info);

/*

=item C<static FILE * safe_popen(const char *cmd, const char *in_mode, int
*psts)>

Open the pipes for an external call.

Check for special xterm requests on special filehandles.

=cut

*/

static FILE *
safe_popen(const char *cmd, const char *in_mode, int *psts)
{
    static int handler_set_up = FALSE;
    FILE * ret_fp;
    unsigned long int sts, flags = CLI$M_NOWAIT;
    /* The use of a GLOBAL table (as was done previously) rendered
     * Perl's qx() or `` unusable from a C<$ SET SYMBOL/SCOPE=NOGLOBAL>
     * DCL environment.  Hence we've switched to LOCAL symbol table.
     */
    unsigned int table = LIB$K_CLI_LOCAL_SYM;
    int j, wait = 0, n;
    char *p, mode[10], symbol[MAX_DCL_SYMBOL+1];
    char *in, *out, *err, mbx[512];
    FILE *tpipe = 0;
    char tfilebuf[VMS_MAXRSS];
    pInfo info = NULL;
    char cmd_sym_name[20];
    struct dsc$descriptor_s d_symbol= {0, DSC$K_DTYPE_T, DSC$K_CLASS_S, symbol};
    struct dsc$descriptor_s vmspipedsc = {0, DSC$K_DTYPE_T, DSC$K_CLASS_S, 0};
    struct dsc$descriptor_s d_sym_cmd = {0, DSC$K_DTYPE_T, DSC$K_CLASS_S, cmd_sym_name};
    struct dsc$descriptor_s *vmscmd;
    $DESCRIPTOR(d_sym_in , "PARROT_POPEN_IN");
    $DESCRIPTOR(d_sym_out, "PARROT_POPEN_OUT");
    $DESCRIPTOR(d_sym_err, "PARROT_POPEN_ERR");

    /* Check here for Xterm create request.  This means looking for
     * "3>&1 xterm\b" and "\btty 1>&3\b$" in the command, and that it
     *  is possible to create an xterm.
     */
    if (*in_mode == 'r') {
        FILE * xterm_fd = create_forked_xterm(cmd, in_mode);
        if (xterm_fd != NULL)
            return xterm_fd;
    }

    /* once-per-program initialization...
       note that the SETAST calls and the dual test of pipe_ef
       makes sure that only the FIRST thread through here does
       the initialization...all other threads wait until it's
       done.

       Yeah, uglier than a pthread call, it's got all the stuff inline
       rather than in a separate routine.
    */

    if (!pipe_ef) {
        _ckvmssts(sys$setast(0));
        if (!pipe_ef) {
            int pidcode = JPI$_PID;
            $DESCRIPTOR(d_delay, RETRY_DELAY);
            _ckvmssts(lib$get_ef(&pipe_ef));
            _ckvmssts(lib$getjpi(&pidcode, 0, 0, &mypid, 0, 0));
            _ckvmssts(sys$bintim(&d_delay, QUAD_PTR(delaytime)));
        }
        if (!handler_set_up) {
            _ckvmssts(sys$dclexh(&pipe_exitblock));
            handler_set_up = TRUE;
        }
        _ckvmssts(sys$setast(1));
    }

    /* see if we can find a VMSPIPE.COM */

    tfilebuf[0] = '@';
    tpipe = vmspipe_tempfile();
    if (!tpipe) {       /* a fish popular in Boston */
#if 0
        if (ckWARN(WARN_PIPE)) {
            Perl_warner(packWARN(WARN_PIPE), "unable to find VMSPIPE.COM for i/o piping");
        }
#endif
        return NULL;
    }
    fgetname(tpipe, tfilebuf+1, 1);
    vmspipedsc.dsc$w_length  = strlen(tfilebuf);

    vmspipedsc.dsc$a_pointer = tfilebuf;

    sts = setup_cmddsc(cmd, 0, 0, &vmscmd);
    if (!(sts & 1)) {
        switch (sts) {
          case RMS$_FNF:
          case RMS$_DNF:
            set_errno(ENOENT); break;
          case RMS$_DIR:
            set_errno(ENOTDIR); break;
          case RMS$_DEV:
            set_errno(ENODEV); break;
          case RMS$_PRV:
            set_errno(EACCES); break;
          case RMS$_SYN:
            set_errno(EINVAL); break;
          case CLI$_BUFOVF:
          case RMS$_RTB:
          case CLI$_TKNOVF:
          case CLI$_RSLOVF:
            set_errno(E2BIG); break;
          case LIB$_INVARG:
          case LIB$_INVSTRDES:
          case SS$_ACCVIO: /* shouldn't happen */
            _ckvmssts(sts); /* fall through */
          default:  /* SS$_DUPLNAM, SS$_CLI, resource exhaustion, etc. */
            set_errno(EVMSERR);
        }
        set_vaxc_errno(sts);
#if 0
        if (*in_mode != 'n' && ckWARN(WARN_PIPE)) {
            Perl_warner(packWARN(WARN_PIPE), "Can't pipe \"%*s\": %s",
                        strlen(cmd), cmd, Strerror(errno));
        }
#endif
        *psts = sts;
        return NULL;
    }
    n = sizeof (Info);
    _ckvmssts(lib$get_vm(&n, &info));

    strncpy(mode, in_mode, sizeof (mode));
    info->mode       = *mode;
    info->done       = FALSE;
    info->completion = 0;
    info->closing    = FALSE;
    info->in         = 0;
    info->out        = 0;
    info->err        = 0;
    info->fp         = NULL;
    info->waiting    = 0;
    info->in_done    = TRUE;
    info->out_done   = TRUE;
    info->err_done   = TRUE;
    info->xchan      = 0;
    info->xchan_valid = 0;

    in = malloc(VMS_MAXRSS);
    if (in == NULL) _ckvmssts(SS$_INSFMEM);
    out = malloc(VMS_MAXRSS);
    if (out == NULL) _ckvmssts(SS$_INSFMEM);
    err = malloc(VMS_MAXRSS);
    if (err == NULL) _ckvmssts(SS$_INSFMEM);

    in[0] = out[0] = err[0] = '\0';

    if ((p = strchr(mode, 'F')) != NULL) {   /* F -> use FILE* */
        strcpy(p, p+1);
    }
    if ((p = strchr(mode, 'W')) != NULL) {   /* W -> wait for completion */
        wait = 1;
        strcpy(p, p+1);
    }

    if (*mode == 'r') {             /* piping from subroutine */

        info->out = pipe_infromchild_setup(mbx, out);
        if (info->out) {
            info->out->pipe_done = &info->out_done;
            info->out_done = FALSE;
            info->out->info = info;
        }
        info->fp = freopen(mbx, mode, stdin);
        set_user_lnm("SYS$INPUT", mbx);

        if (!info->fp && info->out) {
            sys$cancel(info->out->chan_out);

            while (!info->out_done) {
                int done;
                _ckvmssts(sys$setast(0));
                done = info->out_done;
                if (!done) _ckvmssts(sys$clref(pipe_ef));
                _ckvmssts(sys$setast(1));
                if (!done) _ckvmssts(sys$waitfr(pipe_ef));
            }

            if (info->out->buf) {
                n = info->out->bufsize * sizeof (char);
                _ckvmssts(lib$free_vm(&n, &info->out->buf));
            }
            n = sizeof (Pipe);
            _ckvmssts(lib$free_vm(&n, &info->out));
            n = sizeof (Info);
            _ckvmssts(lib$free_vm(&n, &info));
            *psts = RMS$_FNF;
            return NULL;
        }

        info->err = pipe_mbxtofd_setup(fileno(stderr), err);
        if (info->err) {
            info->err->pipe_done = &info->err_done;
            info->err_done = FALSE;
            info->err->info = info;
        }

    }
    else if (*mode == 'w') {      /* piping to subroutine */

        info->out = pipe_mbxtofd_setup(fileno(stdout), out);
        if (info->out) {
            info->out->pipe_done = &info->out_done;
            info->out_done = FALSE;
            info->out->info = info;
        }

        info->err = pipe_mbxtofd_setup(fileno(stderr), err);
        if (info->err) {
            info->err->pipe_done = &info->err_done;
            info->err_done = FALSE;
            info->err->info = info;
        }

        info->in = pipe_tochild_setup(in, mbx);
        info->fp = freopen(mbx, mode, stdout);
        set_user_lnm("SYS$OUTPUT", mbx);

        if (info->in) {
            info->in->pipe_done = &info->in_done;
            info->in_done = FALSE;
            info->in->info = info;
        }

        /* error cleanup */
        if (!info->fp && info->in) {
            info->done = TRUE;
            _ckvmssts(sys$qiow(EFN$C_ENF, info->in->chan_in, IO$_WRITEOF,
                               0, 0, 0, 0, 0, 0, 0, 0, 0));

            while (!info->in_done) {
                int done;
                _ckvmssts(sys$setast(0));
                done = info->in_done;
                if (!done) _ckvmssts(sys$clref(pipe_ef));
                _ckvmssts(sys$setast(1));
                if (!done) _ckvmssts(sys$waitfr(pipe_ef));
            }

            if (info->in->buf) {
                n = info->in->bufsize * sizeof (char);
                _ckvmssts(lib$free_vm(&n, &info->in->buf));
            }
            n = sizeof (Pipe);
            _ckvmssts(lib$free_vm(&n, &info->in));
            n = sizeof (Info);
            _ckvmssts(lib$free_vm(&n, &info));
            *psts = RMS$_FNF;
            return NULL;
        }

    }
    else if (*mode == 'n') {       /* separate subprocess, no Perl i/o */

        info->out = pipe_mbxtofd_setup(fileno(stdout), out);
        if (info->out) {
            info->out->pipe_done = &info->out_done;
            info->out_done = FALSE;
            info->out->info = info;
        }

        info->err = pipe_mbxtofd_setup(fileno(stderr), err);
        if (info->err) {
            info->err->pipe_done = &info->err_done;
            info->err_done = FALSE;
            info->err->info = info;
        }
    }

    strncpy(symbol, in, sizeof (symbol));
    d_symbol.dsc$w_length = strlen(symbol);
    _ckvmssts(lib$set_symbol(&d_sym_in, &d_symbol, &table));

    strncpy(symbol, err, sizeof (symbol));
    d_symbol.dsc$w_length = strlen(symbol);
    _ckvmssts(lib$set_symbol(&d_sym_err, &d_symbol, &table));

    strncpy(symbol, out, sizeof (symbol));
    d_symbol.dsc$w_length = strlen(symbol);
    _ckvmssts(lib$set_symbol(&d_sym_out, &d_symbol, &table));

    /* Done with the names for the pipes */
    free(err);
    free(out);
    free(in);

    p = vmscmd->dsc$a_pointer;
    while (*p == ' ' || *p == '\t') p++;        /* remove leading whitespace */
    if (*p == '$') p++;                         /* remove leading $ */
    while (*p == ' ' || *p == '\t') p++;

    for (j = 0; j < 4; j++) {
        sprintf(cmd_sym_name, "PARROT_POPEN_CMD%d", j);
        d_sym_cmd.dsc$w_length = strlen(cmd_sym_name);

        strncpy(symbol, p, sizeof (symbol));
        d_symbol.dsc$w_length = strlen(symbol);
        _ckvmssts(lib$set_symbol(&d_sym_cmd, &d_symbol, &table));

        if (strlen(p) > MAX_DCL_SYMBOL) {
            p += MAX_DCL_SYMBOL;
        }
        else {
            p += strlen(p);
        }
    }
    _ckvmssts(sys$setast(0));
    info->next = open_pipes;  /* prepend to list */
    open_pipes = info;
    _ckvmssts(sys$setast(1));
    /* Omit arg 2 (input file) so the child will get the parent's SYS$INPUT
     * and SYS$COMMAND.  vmspipe.com will redefine SYS$INPUT, but we'll still
     * have SYS$COMMAND if we need it.
     */
    _ckvmssts(lib$spawn(&vmspipedsc, 0, &nl_desc, &flags,
                        0, &info->pid, &info->completion,
                        0, popen_completion_ast, info, 0, 0, 0));

    /* if we were using a tempfile, close it now */
    if (tpipe) fclose(tpipe);

    /* once the subprocess is spawned, it has copied the symbols and
       we can get rid of ours */
    for (j = 0; j < 4; j++) {
        sprintf(cmd_sym_name, "PARROT_POPEN_CMD%d", j);
        d_sym_cmd.dsc$w_length = strlen(cmd_sym_name);
        _ckvmssts(lib$delete_symbol(&d_sym_cmd, &table));
    }
    _ckvmssts(lib$delete_symbol(&d_sym_in,  &table));
    _ckvmssts(lib$delete_symbol(&d_sym_err, &table));
    _ckvmssts(lib$delete_symbol(&d_sym_out, &table));
    vms_execfree(vmscmd);

#if 0
    PL_forkprocess = info->pid;
#endif

    ret_fp = info->fp;
    if (wait) {
        int saved_errno; unsigned saved_vms_errno;
        int done = 0;
        while (!done) {
            _ckvmssts(sys$setast(0));
            done = info->done;
            if (!done) _ckvmssts(sys$clref(pipe_ef));
            _ckvmssts(sys$setast(1));
            if (!done) _ckvmssts(sys$waitfr(pipe_ef));
        }
        *psts = info->completion;
        /* Caller thinks it is open and tries to close it. */
        /* This causes some problems, as it changes the error status */
        /*        my_pclose(info->fp); */

        /* If we did not have a file pointer open, then we have to */
        /* clean up here or eventually we will run out of something */
        saved_errno = errno; saved_vms_errno = vaxc$errno;
        if (info->fp == NULL)
            my_pclose_pinfo(info);
        SETERRNO(saved_errno, saved_vms_errno);

    }
    else {
        *psts = info->pid;
    }
    return ret_fp;
}

/*

=item C<static int my_pclose_pinfo(pInfo info)>

Routine to close and cleanup a pipe info structure.

=cut

*/

static int
my_pclose_pinfo(pInfo info)
{
    unsigned long int retsts;
    int done, n;
    pInfo next, last;

    /* If we were writing to a subprocess, insure that someone reading from
     * the mailbox gets an EOF.  It looks like a simple fclose() doesn't
     * produce an EOF record in the mailbox.
     *
     *  well, at least sometimes it *does*, so we have to watch out for
     *  the first EOF closing the pipe (and DASSGN'ing the channel)...
     */
    if (info->fp)
        fflush(info->fp);

    _ckvmssts(sys$setast(0));
    info->closing = TRUE;
    done = info->done && info->in_done && info->out_done && info->err_done;
    /* hanging on write to Perl's input? cancel it */
    if (info->mode == 'r' && info->out && !info->out_done) {
        if (info->out->chan_out) {
            _ckvmssts(sys$cancel(info->out->chan_out));
            if (!info->out->chan_in) {   /* EOF generation, need AST */
                _ckvmssts(sys$dclast(pipe_infromchild_ast, (ASTparm_t)info->out, 0));
            }
        }
    }
    if (info->in && !info->in_done && !info->in->shut_on_empty)  /* EOF if hasn't had one yet */
        _ckvmssts(sys$qio(EFN$C_ENF, info->in->chan_in, IO$_WRITEOF,
                          0, 0, 0, 0, 0, 0, 0, 0, 0));
    _ckvmssts(sys$setast(1));
    if (info->fp)
        fclose(info->fp);
    /*
      we have to wait until subprocess completes, but ALSO wait until all
      the i/o completes...otherwise we'll be freeing the "info" structure
      that the i/o ASTs could still be using...
    */

    while (!done) {
        _ckvmssts(sys$setast(0));
        done = info->done && info->in_done && info->out_done && info->err_done;
        if (!done) _ckvmssts(sys$clref(pipe_ef));
        _ckvmssts(sys$setast(1));
        if (!done) _ckvmssts(sys$waitfr(pipe_ef));
    }
    retsts = info->completion;

    /* remove from list of open pipes */
    _ckvmssts(sys$setast(0));
    last = NULL;
    for (next = open_pipes; next != NULL; last = next, next = next->next) {
        if (next == info)
            break;
    }
    if (last)
        last->next = info->next;
    else
        open_pipes = info->next;
    _ckvmssts(sys$setast(1));

    /* free buffers and structures */

    if (info->in) {
        if (info->in->buf) {
            n = info->in->bufsize * sizeof (char);
            _ckvmssts(lib$free_vm(&n, &info->in->buf));
        }
        n = sizeof (Pipe);
        _ckvmssts(lib$free_vm(&n, &info->in));
    }
    if (info->out) {
        if (info->out->buf) {
            n = info->out->bufsize * sizeof (char);
            _ckvmssts(lib$free_vm(&n, &info->out->buf));
        }
        n = sizeof (Pipe);
        _ckvmssts(lib$free_vm(&n, &info->out));
    }
    if (info->err) {
        if (info->err->buf) {
            n = info->err->bufsize * sizeof (char);
            _ckvmssts(lib$free_vm(&n, &info->err->buf));
        }
        n = sizeof (Pipe);
        _ckvmssts(lib$free_vm(&n, &info->err));
    }
    n = sizeof (Info);
    _ckvmssts(lib$free_vm(&n, &info));

    return retsts;
}

/*

=item C<static int my_pclose(FILE *fp)>

Close the pipe

=cut

*/

static int
my_pclose(FILE *fp)
{
    pInfo info, last = NULL;
    int ret_status;

    /* Fixme - need ast and mutex protection here */
    for (info = open_pipes; info != NULL; last = info, info = info->next)
        if (info->fp == fp) break;

    if (info == NULL) {  /* no such pipe open */
        SETERRNO(ECHILD /* quoth POSIX */ , SS$_NONEXPR);
        return -1;
    }

    ret_status = my_pclose_pinfo(info);
    return ret_status;
}

#if defined(__CRTL_VER) && __CRTL_VER >= 70200000
/* Roll our own prototype because we want this regardless of whether
 * _VMS_WAIT is defined.
 */
__pid_t __vms_waitpid(__pid_t __pid, int *__stat_loc, int __options);
#endif

/*

=item C<static pid_t my_waitpid(pid_t pid, int *statusp, int flags)>

sort-of waitpid; special handling of pipe clean-up for subprocesses
created with popen(); otherwise partially emulate waitpid() unless
we have a suitable one from the CRTL that came with VMS 7.2 and later.
Also check processes not considered by the CRTL waitpid().

=back

=cut

*/

static pid_t
my_waitpid(pid_t pid, int *statusp, int flags)
{
    pInfo info;
    int done;
    int sts;
    int j;

    if (statusp) *statusp = 0;

    for (info = open_pipes; info != NULL; info = info->next)
        if (info->pid == pid)
            break;

    if (info != NULL) {  /* we know about this child */
        while (!info->done) {
            _ckvmssts(sys$setast(0));
            done = info->done;
            if (!done) _ckvmssts(sys$clref(pipe_ef));
            _ckvmssts(sys$setast(1));
            if (!done) _ckvmssts(sys$waitfr(pipe_ef));
        }

        if (statusp) *statusp = info->completion;
        return pid;
    }

    /* child that already terminated? */
    for (j = 0; j < NKEEPCLOSED && j < closed_num; j++) {
        if (closed_list[j].pid == pid) {
            if (statusp) *statusp = closed_list[j].completion;
            return pid;
        }
    }

    /* fall through if this child is not one of our own pipe children */

#if defined(__CRTL_VER) && __CRTL_VER >= 70200000

    /* waitpid() became available in the CRTL as of VMS 7.0, but only
     * in 7.2 did we get a version that fills in the VMS completion
     * status as Perl has always tried to do.
     */

    sts = __vms_waitpid(pid, statusp, flags);

    if (sts == 0 || !(sts == -1 && errno == ECHILD))
        return sts;

    /* If the real waitpid tells us the child does not exist, we
     * fall through here to implement waiting for a child that
     * was created by some means other than exec() (say, spawned
     * from DCL) or to wait for a process that is not a subprocess
     * of the current process.
     */

#endif /* defined(__CRTL_VER) && __CRTL_VER >= 70200000 */

    {
        $DESCRIPTOR(intdsc, "0 00:00:01");
        int ownercode = JPI$_OWNER, pidcode = JPI$_PID;
        unsigned long int ownerpid, mypid;
        QUAD_t interval;
        IOSB jpi_iosb;
        struct item_list_3 jpilist[] = {
            {sizeof (ownerpid), JPI$_OWNER, &ownerpid, 0},
            {               0,          0,         0, 0}
        };

        if (pid <= 0) {
            /* Sorry folks, we don't presently implement rooting around for
               the first child we can find, and we definitely don't want to
               pass a pid of -1 to $getjpi, where it is a wildcard operation.
            */
            set_errno(ENOTSUP);
            return -1;
        }

        /* Get the owner of the child so I can warn if it's not mine. If the
         * process doesn't exist or I don't have the privs to look at it,
         * I can go home early.
         */
        sts = sys$getjpiw(EFN$C_ENF, (unsigned int *)&pid, NULL, &jpilist,
                          &jpi_iosb, NULL, 0);
        if (sts & 1) sts = jpi_iosb.status;
        if (!(sts & 1)) {
            switch (sts) {
              case SS$_NONEXPR:
                set_errno(ECHILD); break;
              case SS$_NOPRIV:
                set_errno(EACCES); break;
              default:
                _ckvmssts(sts);
            }
            set_vaxc_errno(sts);
            return -1;
        }

#if 0
        if (ckWARN(WARN_EXEC)) {
            /* remind folks they are asking for non-standard waitpid behavior */
            _ckvmssts(lib$getjpi(&pidcode, 0, 0, &mypid, 0, 0));
            if (ownerpid != mypid)
                Perl_warner(packWARN(WARN_EXEC),
                            "waitpid: process %x is not a child of process %x",
                            pid, mypid);
        }
#endif

        /* simply check on it once a second until it's not there anymore. */
        _ckvmssts(sys$bintim(&intdsc, QUAD_PTR(interval)));
        while ((sts=lib$getjpi(&ownercode, &pid, 0, &ownerpid, 0, 0)) & 1) {
            _ckvmssts(sys$schdwk(0, 0, QUAD_PTR(interval), 0));
            _ckvmssts(sys$hiber());
        }
        if (sts == SS$_NONEXPR) sts = SS$_NORMAL;

        _ckvmssts(sts);
        return pid;
    }
}

/*

=head3 VMS subprocess management

C<my_vfork()> - just a C<vfork()>, after setting a flag to record that
the current script is trying a Unix-style fork/exec.

C<vms_do_aexec()> and C<vms_do_exec()> are called in response to the
perl I<'exec'> function.  If this follows a vfork call, then they
call out the regular perl routines in F<doio.c> which do an
C<execvp> (for those who really want to try this under VMS).
Otherwise, they do exactly what the perl docs say exec should
do - terminate the current script and invoke a new command
(See below for notes on command syntax.)

C<do_aspawn()> and C<do_spawn()> implement the VMS side of the perl
I<'system'> function.

Note on command arguments to perl I<'exec'> and I<'system'>: When handled
in 'VMSish fashion' (i.e. not after a call to vfork) The args
are concatenated to form a DCL command string.  If the first non-numeric
arg begins with '$' (i.e. the perl script had "\$ Type" or some such),
the command string is handed off to DCL directly.  Otherwise,
the first token of the command is taken as the filespec of an image
to run.  The filespec is expanded using a default type of '.EXE' and
the process defaults for device, directory, etc., and if found, the resultant
filespec is invoked using the DCL verb 'MCR', and passed the rest of
the command string as parameters.  This is perhaps a bit complicated,
but I hope it will form a happy medium between what VMS folks expect
from C<lib$spawn> and what Unix folks expect from C<exec>.

*/

/*

=over

=item C<static void vms_execfree(struct dsc$descriptor_s *vmscmd)>

Free command descriptor

=cut

*/

static void
vms_execfree(struct dsc$descriptor_s *vmscmd)
{
    if (vmscmd) {
        if (vmscmd->dsc$a_pointer) {
            free(vmscmd->dsc$a_pointer);
        }
        free(vmscmd);
    }
}

/* Cons up a 'delete' bit for testing access */
#define S_IDUSR (S_IWUSR | S_IXUSR)
#define S_IDGRP (S_IWGRP | S_IXGRP)
#define S_IDOTH (S_IWOTH | S_IXOTH)

/*

=item C<static int cando_by_name_int(int bit, int effective, const char *fname,
int opts)>

Check file permissions.

=cut

*/

static int
cando_by_name_int(int bit, int effective, const char *fname, int opts)
{
    /* TODO: Replace by the full-blown perl implementation */
    int access_mode = 0;

    switch (bit) {
      case S_IXUSR: case S_IXGRP: case S_IXOTH:
        access_mode = X_OK; break;
      case S_IRUSR: case S_IRGRP: case S_IROTH:
        access_mode = R_OK; break;
      case S_IWUSR: case S_IWGRP: case S_IWOTH:
      case S_IDUSR: case S_IDGRP: case S_IDOTH:
        access_mode = W_OK; break;
      default:
        return FALSE;
    }
    return access(fname, access_mode);
}

/* RMSEXPAND options */
#define RMSEXPAND_M_VMS            0x02 /* Force output to VMS format */
#define RMSEXPAND_M_LONG           0x04 /* Expand to long name format */
#define RMSEXPAND_M_VMS_IN         0x08 /* Assume input is VMS already */
#define RMSEXPAND_M_SYMLINK        0x20 /* Use symbolic link, not target */

/*

=item C<static char * int_rmsexpand (const char *filespec, char *outbuf, const
char *defspec, unsigned opts, int * fs_utf8, int * dfs_utf8)>

Expansion not yet implemented. It only does a copy.

=cut

*/

static char *
int_rmsexpand
   (const char *filespec,
    char *outbuf,
    const char *defspec,
    unsigned opts,
    int * fs_utf8,
    int * dfs_utf8)
{
    /* TODO: Replace by the full-blown perl implementation */
    strcpy(outbuf, filespec);
    return outbuf;
}

/*

=item C<static unsigned long int setup_cmddsc(const char *incmd, int check_img,
int *suggest_quote, struct dsc$descriptor_s **pvmscmd)>

Setup a command descriptor to call a DCL command or excutable image.

=cut

*/

static unsigned long int
setup_cmddsc(const char *incmd, int check_img, int *suggest_quote,
             struct dsc$descriptor_s **pvmscmd)
{
    char * vmsspec;
    char * resspec;
    char image_name[VMS_MAXRSS];
    char image_argv[VMS_MAXRSS];
    $DESCRIPTOR(defdsc, ".EXE");
    $DESCRIPTOR(defdsc2, ".");
    struct dsc$descriptor_s resdsc;
    struct dsc$descriptor_s *vmscmd;
    struct dsc$descriptor_s imgdsc = {0, DSC$K_DTYPE_T, DSC$K_CLASS_S, 0};
    unsigned int cxt = 0, flags = 1, retsts = SS$_NORMAL;
    register char *s, *rest, *cp, *wordbreak;
    char * cmd;
    int cmdlen;
    register int isdcl;

    vmscmd = malloc(sizeof (struct dsc$descriptor_s));
    if (vmscmd == NULL) _ckvmssts(SS$_INSFMEM);

    /* vmsspec is a DCL command buffer, not just a filename */
    vmsspec = malloc(MAX_DCL_LINE_LENGTH + 1);
    if (vmsspec == NULL) _ckvmssts(SS$_INSFMEM);

    resspec = malloc(VMS_MAXRSS);
    if (resspec == NULL) _ckvmssts(SS$_INSFMEM);

    /* Make a copy for modification */
    cmdlen = strlen(incmd);
    cmd = malloc(cmdlen+1);
    if (cmd == NULL) _ckvmssts(SS$_INSFMEM);
    strncpy(cmd, incmd, cmdlen + 1);
    image_name[0] = 0;
    image_argv[0] = 0;

    resdsc.dsc$a_pointer = resspec;
    resdsc.dsc$b_dtype  = DSC$K_DTYPE_T;
    resdsc.dsc$b_class  = DSC$K_CLASS_S;
    resdsc.dsc$w_length = VMS_MAXRSS - 1;

    vmscmd->dsc$a_pointer = NULL;
    vmscmd->dsc$b_dtype  = DSC$K_DTYPE_T;
    vmscmd->dsc$b_class  = DSC$K_CLASS_S;
    vmscmd->dsc$w_length = 0;
    if (pvmscmd) *pvmscmd = vmscmd;

    if (suggest_quote) *suggest_quote = 0;

    if (strlen(cmd) > MAX_DCL_LINE_LENGTH) {
        free(cmd);
        free(vmsspec);
        free(resspec);
        return CLI$_BUFOVF;                /* continuation lines currently unsupported */
    }

    s = cmd;

    while (*s && isspace((unsigned char)*s)) s++;

    if (*s == '@' || *s == '$') {
        vmsspec[0] = *s;  rest = s + 1;
        for (cp = &vmsspec[1]; *rest && isspace((unsigned char)*rest); rest++, cp++) *cp = *rest;
    }
    else {
        cp = vmsspec; rest = s;
    }
    if (*rest == '.' || *rest == '/') {
#if 1
        free(cmd);
        free(vmsspec);
        free(resspec);
        return CLI$_BUFOVF;                /* unixoid filespecs currently unsupported */
#else
        char *cp2;
        for (cp2 = resspec;
            *rest && !isspace((unsigned char)*rest)
                  && cp2 - resspec < (VMS_MAXRSS - 1); rest++, cp2++) {
            *cp2 = *rest;
        }
        *cp2 = '\0';
        if (int_tovmsspec(resspec, cp, 0, NULL)) {
            s = vmsspec;

            /* When a UNIX spec with no file type is translated to VMS, */
            /* A trailing '.' is appended under ODS-5 rules.            */
            /* Here we do not want that trailing "." as it prevents     */
            /* Looking for a implied ".exe" type. */
            if (decc_efs_charset) {
                int i;
                i = strlen(vmsspec);
                if (vmsspec[i-1] == '.') {
                    vmsspec[i-1] = '\0';
                }
            }

            if (*rest) {
                for (cp2 = vmsspec + strlen(vmsspec);
                    *rest && cp2 - vmsspec < MAX_DCL_LINE_LENGTH; rest++, cp2++) {
                    *cp2 = *rest;
                }
                *cp2 = '\0';
            }
        }
#endif
    }
    /* Intuit whether verb (first word of cmd) is a DCL command:
     *   - if first nonspace char is '@', it's a DCL indirection
     * otherwise
     *   - if verb contains a filespec separator, it's not a DCL command
     *   - if it doesn't, caller tells us whether to default to a DCL
     *     command, or to a local image unless told it's DCL (by leading '$')
     */
    if (*s == '@') {
        isdcl = 1;
        if (suggest_quote) *suggest_quote = 1;
    }
    else {
        register char *filespec = strpbrk(s, ":<[.;");
        rest = wordbreak = strpbrk(s, " \"\t/");
        if (!wordbreak) wordbreak = s + strlen(s);
        if (*s == '$') check_img = 0;
        isdcl = (filespec && (filespec < wordbreak)) ? 0 : !check_img;
    }

    if (!isdcl) {
        int rsts;
        imgdsc.dsc$a_pointer = s;
        imgdsc.dsc$w_length = wordbreak - s;
        retsts = lib$find_file(&imgdsc, &resdsc, &cxt, &defdsc, 0, &rsts, &flags);
        if (!(retsts&1)) {
            _ckvmssts(lib$find_file_end(&cxt));
            retsts = lib$find_file(&imgdsc, &resdsc, &cxt, &defdsc2, 0, &rsts, &flags);
            if (!(retsts & 1) && *s == '$') {
                _ckvmssts(lib$find_file_end(&cxt));
                imgdsc.dsc$a_pointer++; imgdsc.dsc$w_length--;
                retsts = lib$find_file(&imgdsc, &resdsc, &cxt, &defdsc, 0, &rsts, &flags);
                if (!(retsts&1)) {
                    _ckvmssts(lib$find_file_end(&cxt));
                    retsts = lib$find_file(&imgdsc, &resdsc, &cxt, &defdsc2, 0, &rsts, &flags);
                }
            }
        }
        _ckvmssts(lib$find_file_end(&cxt));

        if (retsts & 1) {
            FILE *fp;
            s = resspec;
            while (*s && !isspace((unsigned char)*s)) s++;
            *s = '\0';

            /* check that it's really not DCL with no file extension */
            fp = fopen(resspec, "r", "ctx=bin", "ctx=rec", "shr=get");
            if (fp) {
                unsigned char b[256] = {0, 0, 0, 0};

                read(fileno(fp), (char*)b, 256);
                isdcl = isprint(b[0]) && isprint(b[1])
                     && isprint(b[2]) && isprint(b[3]);
                if (isdcl) {
                    int shebang_len;

                    /* Check for script */
                    shebang_len = 0;
                    if ((b[0] == '#') && (b[1] == '!'))
                        shebang_len = 2;
#ifdef ALTERNATE_SHEBANG
                    else {
                        shebang_len = strlen(ALTERNATE_SHEBANG);
                        if (strncmp(b, ALTERNATE_SHEBANG, shebang_len) == 0) {
                            char * perlstr;
                            perlstr = strstr("perl", b);
                            if (perlstr == NULL)
                                shebang_len = 0;
                        }
                        else
                            shebang_len = 0;
                    }
#endif

                    if (shebang_len > 0) {
                        int i;
                        int j;
                        char tmpspec[VMS_MAXRSS];

                        i = shebang_len;
                        /* Image is following after white space */
                        /*--------------------------------------*/
                        while (isprint(b[i]) && isspace(b[i]))
                            i++;

                        j = 0;
                        while (isprint(b[i]) && !isspace(b[i])) {
                            tmpspec[j++] = b[i++];
                            if (j >= NAM$C_MAXRSS)
                                break;
                        }
                        tmpspec[j] = '\0';

                        /* There may be some default parameters to the image */
                        /*---------------------------------------------------*/
                        j = 0;
                        while (isprint(b[i])) {
                            image_argv[j++] = b[i++];
                            if (j >= NAM$C_MAXRSS)
                                break;
                        }
                        while ((j > 0) && !isprint((unsigned char)image_argv[j-1]))
                            j--;
                        image_argv[j] = 0;

                        /* It will need to be converted to VMS format and validated */
                        if (tmpspec[0] != '\0') {
                            char * iname;

                            /* Try to find the exact program requested to be run */
                            /*---------------------------------------------------*/
                            iname = int_rmsexpand(tmpspec, image_name, ".exe", RMSEXPAND_M_VMS,
                                                  NULL, NULL);
                            if (iname != NULL) {
                                if (cando_by_name_int(S_IXUSR, 0, image_name, RMSEXPAND_M_VMS_IN))
                                    isdcl = 0; /* MCR prefix needed */
                                else {
                                    /* Try again with a null type */
                                    /*----------------------------*/
                                    iname = int_rmsexpand(tmpspec, image_name, ".",
                                                          RMSEXPAND_M_VMS, NULL, NULL);
                                    if (iname != NULL) {
                                        if (cando_by_name_int(S_IXUSR, 0, image_name,
                                                              RMSEXPAND_M_VMS_IN))
                                            isdcl = 0; /* MCR prefix needed */
                                    }
                                }

                                /* Did we find the image to run the script? */
                                /*------------------------------------------*/
                                if (isdcl) {
                                    char *tchr;

                                    /* Assume DCL or foreign command exists */
                                    /*--------------------------------------*/
                                    tchr = strrchr(tmpspec, '/');
                                    if (tchr != NULL) {
                                        tchr++;
                                    }
                                    else {
                                        tchr = tmpspec;
                                    }
                                    strncpy(image_name, tchr, sizeof (image_name));
                                }
                            }
                        }
                    }
                }
                fclose(fp);
            }
            if (check_img && isdcl) {
                free(cmd);
                free(resspec);
                free(vmsspec);
                return RMS$_FNF;
            }

            if (cando_by_name_int(S_IXUSR, 0, resspec, 0)) {
                vmscmd->dsc$a_pointer = malloc(MAX_DCL_LINE_LENGTH);
                if (vmscmd->dsc$a_pointer == NULL) _ckvmssts(SS$_INSFMEM);
                if (!isdcl) {
                    strncpy(vmscmd->dsc$a_pointer, "$ MCR ", MAX_DCL_LINE_LENGTH);
                    if (image_name[0] != 0) {
                        strncat(vmscmd->dsc$a_pointer, image_name, MAX_DCL_LINE_LENGTH);
                        strncat(vmscmd->dsc$a_pointer, " ", MAX_DCL_LINE_LENGTH);
                    }
                }
                else if (image_name[0] != 0) {
                    strncpy(vmscmd->dsc$a_pointer, image_name, MAX_DCL_LINE_LENGTH);
                    strncat(vmscmd->dsc$a_pointer, " ", MAX_DCL_LINE_LENGTH);
                }
                else {
                    strncpy(vmscmd->dsc$a_pointer, "@", MAX_DCL_LINE_LENGTH);
                }
                if (suggest_quote) *suggest_quote = 1;

                /* If there is an image name, use original command */
                if (image_name[0] == 0)
                    strncat(vmscmd->dsc$a_pointer, resspec, MAX_DCL_LINE_LENGTH);
                else {
                    rest = cmd;
                    while (*rest && isspace((unsigned char)*rest)) rest++;
                }

                if (image_argv[0] != 0) {
                    strncat(vmscmd->dsc$a_pointer, image_argv, MAX_DCL_LINE_LENGTH);
                    strncat(vmscmd->dsc$a_pointer, " ", MAX_DCL_LINE_LENGTH);
                }
                if (rest) {
                    int rest_len;
                    int vmscmd_len;

                    rest_len = strlen(rest);
                    vmscmd_len = strlen(vmscmd->dsc$a_pointer);
                    if ((rest_len + vmscmd_len) < MAX_DCL_LINE_LENGTH)
                        strncat(vmscmd->dsc$a_pointer, rest, MAX_DCL_LINE_LENGTH);
                    else
                        retsts = CLI$_BUFOVF;
                }
                vmscmd->dsc$w_length = strlen(vmscmd->dsc$a_pointer);
                free(cmd);
                free(vmsspec);
                free(resspec);
                return (vmscmd->dsc$w_length > MAX_DCL_LINE_LENGTH ? CLI$_BUFOVF : retsts);
            }
            else
                retsts = RMS$_PRV;
        }
    }
    /* It's either a DCL command or we couldn't find a suitable image */
    vmscmd->dsc$w_length = strlen(cmd);

    vmscmd->dsc$a_pointer = malloc(vmscmd->dsc$w_length + 1);
    strncpy(vmscmd->dsc$a_pointer, cmd, vmscmd->dsc$w_length + 1);

    free(cmd);
    free(resspec);
    free(vmsspec);

    /* check if it's a symbol (for quoting purposes) */
    if (suggest_quote && !*suggest_quote) {
        int iss;
        char equiv[LNM$C_NAMLENGTH];
        struct dsc$descriptor_s eqvdsc = {sizeof (equiv), DSC$K_DTYPE_T, DSC$K_CLASS_S, equiv};

        iss = lib$get_symbol(vmscmd, &eqvdsc);
        if (iss&1 && (*equiv == '$' || *equiv == '@')) *suggest_quote = 1;
    }
    if (!(retsts & 1)) {
        /* just hand off status values likely to be due to user error */
        if (retsts == RMS$_FNF || retsts == RMS$_DNF || retsts == RMS$_PRV ||
            retsts == RMS$_DEV || retsts == RMS$_DIR || retsts == RMS$_SYN ||
            (retsts & STS$M_CODE) == (SHR$_NOWILD & STS$M_CODE)) return retsts;
        else { _ckvmssts(retsts); }
    }

    return (vmscmd->dsc$w_length > MAX_DCL_LINE_LENGTH ? CLI$_BUFOVF : retsts);

}

/*

=item C<static int do_spawn2(const char *cmd, int flags)>

Implements C<Parrot_Run_OS_Command>.
Spawn off a subprocess provided in command-line arguments.  Wait for it to
complete, returning the return value of the process.

=cut

*/

static int
do_spawn2(const char *cmd, int flags)
{
    unsigned long int sts, substs;

    if (!cmd || !*cmd) {
        sts = lib$spawn(0, 0, 0, &flags, 0, 0, &substs, 0, 0, 0, 0, 0, 0);
        if (!(sts & 1)) {
            switch (sts) {
              case RMS$_FNF:
              case RMS$_DNF:
                set_errno(ENOENT); break;
              case RMS$_DIR:
                set_errno(ENOTDIR); break;
              case RMS$_DEV:
                set_errno(ENODEV); break;
              case RMS$_PRV:
                set_errno(EACCES); break;
              case RMS$_SYN:
                set_errno(EINVAL); break;
              case CLI$_BUFOVF:
              case RMS$_RTB:
              case CLI$_TKNOVF:
              case CLI$_RSLOVF:
                set_errno(E2BIG); break;
              case LIB$_INVARG:
              case LIB$_INVSTRDES:
              case SS$_ACCVIO: /* shouldn't happen */
                _ckvmssts(sts); /* fall through */
              default:  /* SS$_DUPLNAM, SS$_CLI, resource exhaustion, etc. */
                set_errno(EVMSERR);
            }
            set_vaxc_errno(sts);
#if 0
            if (ckWARN(WARN_EXEC)) {
                Perl_warner(aTHX_ packWARN(WARN_EXEC), "Can't spawn: %s", Strerror(errno));
            }
#endif
        }
        sts = substs;
    }
    else {
        char mode[3];
        FILE * fp;

        strcpy(mode, (flags & CLI$M_NOWAIT) ? "n" : "nW");

        fp = safe_popen(cmd, mode, (int *)&sts);
        if (fp != NULL)
            my_pclose(fp);
        /* sts will be the pid in the nowait case */
    }
    return sts;
}

/*

=item C<static void set_user_lnm(const char *name, const char *eqv)>

I<vmssetuserlnm>

Sets a user-mode logical in the process logical name table
used for redirection of sys$error.

=cut

*/

static void
set_user_lnm(const char *name, const char *eqv)
{
    $DESCRIPTOR(d_tab, "LNM$PROCESS");
    struct dsc$descriptor_d d_name = {0, DSC$K_DTYPE_T, DSC$K_CLASS_D, 0};
    unsigned long int iss;
    unsigned int attr = LNM$M_CONFINE;
    unsigned char acmode = PSL$C_USER;
    struct item_list_3 lnmlst[2] =
        {{0, LNM$_STRING, 0, 0}, {0, 0, 0, 0}};

    d_name.dsc$a_pointer = (char *)name; /* Cast OK for read only parameter */
    d_name.dsc$w_length = strlen(name);

    lnmlst[0].len = strlen(eqv);
    lnmlst[0].bufadr = (char *)eqv; /* Cast OK for read only parameter */

    iss = sys$crelnm(&attr, &d_tab, &d_name, &acmode, lnmlst);
    if (!(iss&1)) lib$signal(iss);
}

/*

=item C<static int vmstrnenv(const char *lnm, char *eqv, unsigned long int idx,
struct dsc$descriptor_s **tabvec, unsigned long int flags)>

??

=cut

*/

static int
vmstrnenv(const char *lnm, char *eqv, unsigned long int idx,
          struct dsc$descriptor_s **tabvec, unsigned long int flags)
{
    char *res = getenv(lnm);
    if (res == NULL)
        return 0;

    strcpy(eqv, res);
    return 1;
}


/* default piping mailbox size */
#ifdef __VAX
#  define PERL_BUFSIZ        512
#else
#  define PERL_BUFSIZ        8192
#endif

static $DESCRIPTOR(fildevdsc, "LNM$FILE_DEV");
static struct dsc$descriptor_s *fildev[] = { &fildevdsc, NULL };

/*

=item C<static void create_mbx(unsigned short int *chan, struct dsc$descriptor_s
*namdsc)>

Create mailbox for command descriptor

=cut

*/

static void
create_mbx(unsigned short int *chan, struct dsc$descriptor_s *namdsc)
{
    unsigned long int mbxbufsiz;
    static unsigned long int syssize = 0;
    int dviitm = DVI$_DEVNAM;
    char csize[LNM$C_NAMLENGTH+1];
    int sts;

    if (!syssize) {
        int syiitm = SYI$_MAXBUF;
        /*
         * Get the SYSGEN parameter MAXBUF
         *
         * If the logical 'PERL_MBX_SIZE' is defined
         * use the value of the logical instead of PERL_BUFSIZ, but
         * keep the size between 128 and MAXBUF.
         *
         */
        _ckvmssts(lib$getsyi(&syiitm, &syssize, 0, 0, 0, 0));
    }

    if (vmstrnenv("PERL_MBX_SIZE", csize, 0, fildev, 0)) {
        mbxbufsiz = atoi(csize);
    }
    else {
        mbxbufsiz = PERL_BUFSIZ;
    }
    if (mbxbufsiz < 128) mbxbufsiz = 128;
    if (mbxbufsiz > syssize) mbxbufsiz = syssize;

    _ckvmssts(sys$crembx(0, chan, mbxbufsiz, mbxbufsiz, 0, 0, 0));
    _ckvmssts(lib$getdvi(&dviitm, chan, NULL, NULL, namdsc, &namdsc->dsc$w_length));
    namdsc->dsc$a_pointer[namdsc->dsc$w_length] = '\0';

}

/*

=item C<static void vms_get_subproc_handles(int pid, PIOHANDLE *handles)>

Return the three stdio handles for the command.

=back

=cut

*/

static void
vms_get_subproc_handles(int pid, PIOHANDLE *handles)
{
    pInfo pi;

    for (pi = open_pipes; pi != NULL; pi = pi->next)
        if (pi->pid == pid) {
            handles[0] = pi->in->fd_out;
            handles[1] = pi->out->fd_out;
            handles[2] = pi->err->fd_out;
            break;
      }
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
