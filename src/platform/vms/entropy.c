/*
 * Copyright (C) 2012, Parrot Foundation.
 * Copyright (C) 2006, 2007 Steven M. Schweda.
 */

/*

=head1 NAME

src/platform/vms/entropy.c

=head1 DESCRIPTION

Get some entropy from the system, VMS version.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"

static int vms_get_entropy(char *result, size_t length);

/* HEADERIZER HFILE: none */

/*

=item C<INTVAL Parrot_get_entropy(PARROT_INTERP)>

Get one INTVAL worth of entropy from the system.

=cut

*/

INTVAL Parrot_get_entropy(PARROT_INTERP) {
    INTVAL  entropy;
    int     sts;

    sts = vms_get_entropy((char *)&entropy, sizeof (INTVAL));
    if (sts != 0) {
        const char *msg = "Couldn't gather random bytes.";
        /* This function is called during interp init, so use the GC registry
         * as a way to figure out interp's initializedness.
         */
        if (interp->gc_registry)
            Parrot_ex_throw_from_c_args(interp, NULL, 1, msg);
        else
            PANIC(interp, msg);
    }
    return entropy;
}

/****************************************************************************
 *									    *
 *									    *
 *   VMS Randomness-Gathering Code					    *
 *									    *
 *									    *
 ****************************************************************************/

/* Slightly modified from the GnuPG for VMS source file [.cipher]rndvms.c .
   See http://antinode.info/dec/sw/gnupg.html
   New file by Steven M. Schweda:
      gnupg-1_4_9a_vms/cipher/rndvms.c    VMS-specific "entropy gathering" code.
   Licensed under the GNU GPL v3

   We see no code here which could be based on cryptlib.
*/

/* General includes */

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define __NEW_STARLET
#include <cmbdef.h>
#include <descrip.h>
#include <lib$routines.h>
#include <psldef.h>
#include <starlet.h>
#include <stsdef.h>

#include <clidef.h>
#ifndef CLI$M_NOWAIT
#  define CLI$M_NOWAIT 0x1
#endif

/* The structure containing information on random-data sources.  Each
 * record contains the source and a relative estimate of its usefulness
 * (weighting) which is used to scale the number of kB of output from the
 * source (total = data_bytes / usefulness).  Usually the weighting is in the
 * range 1-3 (or 0 for especially useless sources), resulting in a usefulness
 * rating of 1...3 for each kB of source output (or 0 for the useless
 * sources).
 *
 * If the source is constantly changing (certain types of network statistics
 * have this characteristic) but the amount of output is small, the weighting
 * is given as a negative value to indicate that the output should be treated
 * as if a minimum of 1K of output had been obtained.  If the source produces
 * a lot of output then the scale factor is fractional, resulting in a
 * usefulness rating of < 1 for each kB of source output.
 *
 * In order to provide enough randomness to satisfy the requirements for a
 * slow poll, we need to accumulate at least 20 points of usefulness (a
 * typical system should get about 30 points).
 *
 *
 * In order to maximise use of the buffer, the code performs a form of run-
 * length compression on its input where a repeated sequence of bytes is
 * replaced by the occurrence count mod 256.  Some commands output an awful
 * lot of whitespace, this measure greatly increases the amount of data we
 * can fit in the buffer.
 *
 * When we scale the weighting using the SC() macro, some preprocessors may
 * give a division by zero warning for the most obvious expression
 * 'weight ? 1024 / weight : 0' (and gcc 2.7.2.2 dies with a division by zero
 * trap), so we define a value SC_0 which evaluates to zero when fed to
 * '1024 / SC_0' */

#define SC( weight )	( 1024 / weight )	/* Scale factor */
#define SC_0			16384	/* SC( SC_0 ) evalutes to 0 */


#define G_BUFSIZE 32767         /* Size of command-output buffer. */


static struct RI {
    const char *cmd;            /* Command */
    const int usefulness;       /* Usefulness of source */
    int length;                 /* Quantity of output produced */
} dataSources[] = {

    { "show system", SC(1), 0 },
    { "show device /full d", SC(1), 0 },
    { "show network /full", SC(2), 0 },
    {  NULL, 0, 0 }
};

/* Buffer for gathering "random" noise. */

static char g_buffer[ G_BUFSIZE+ 1024];
static int g_byte_count = 0;
static int g_byte_used_count = 0;

static int src_ndx = 0;          /* Next command to spawn. */
static int spwn_pid;
static char lnm_mbx[ 32];
static struct dsc$descriptor_s cmd_dscr =
 { 0, DSC$K_DTYPE_T, DSC$K_CLASS_S, (char *) NULL };

static $DESCRIPTOR(lnm_mbx_dscr, lnm_mbx);
static $DESCRIPTOR(nla0_dscr, "NLA0:");


static unsigned short chan_mbx = 0;
static int fd_mbx = -1;
static char *dbgfn;
static FILE *dbgfp = NULL;

#define GR_MIN(a, b) (((a) > (b)) ? (b) : (a))


#define MBX_BASE_NAME "MBX_PARROT_ENTROPY_"

/*

=item C<static int rndvms_gather_random(char *buffer, size_t length, int level)>

buffer     buffer to copy into

length:    bytes requested

level:     source code.  (See random.c: add_randomness().)
           0 - used ony for initialization
           1 - fast random poll function
           2 - normal poll function
           3 - used when level 2 random quality has been requested
               to do an extra pool seed. (unused)

=cut

*/

static int
rndvms_gather_random(char *buffer, size_t length, int level)
{
    char *gbp1;
    char *gbp2;
    char *gbpe;
    char gbc;
    int gbc_count;
    int n;
    int sts;
    int spwn_flgs = CLI$M_NOWAIT;

/****************
 * Using a level of 0 should never block and better add nothing
 * to the pool.  So this is just a dummy for this gatherer.
 */
    if (level == 0)
        return 0;


    /* Create the mailbox (once for the process). */
    if (chan_mbx == 0)
    {
        /* Open debug file, if specified. */
        dbgfn = getenv("PARROT_RND_DEBUG");
        if (dbgfn != NULL)
        {
            if (strcmp(dbgfn, "-") == 0)
            {
                dbgfp = stdout;
            }
            else
            {
                dbgfp = fopen(dbgfn, "w");
                if (dbgfp == NULL)
                {
                    fprintf(stderr,
                     "rndvms()  Can't open (write) rnd debug file \"%s\".\n %s\n",
                     dbgfn, strerror(errno));
                }
            }
        }

        /* Form the (process-unique) mailbox logical name. */
        sprintf(lnm_mbx, "%s%08x", MBX_BASE_NAME, getpid());
        lnm_mbx_dscr.dsc$w_length = sizeof MBX_BASE_NAME - 1 + 8;

        /* If target mailbox already exists (left-over), read/waste any
           pending data, and close and delete the old mailbox.
        */
        fd_mbx = open(lnm_mbx, O_RDONLY, 0);
        if (fd_mbx >= 0)
        {
            if (dbgfp)
            {
                fprintf(dbgfp,
                 "rndvms()  Process mailbox (%s) unexpectedly exists.\n",
                 lnm_mbx);
                fprintf(dbgfp, "rndvms()  Wasting data ...");
                fflush(dbgfp);
            }

            while (read(fd_mbx, g_buffer, 1024));
            close(fd_mbx);
            if (dbgfp)
            {
                fprintf(dbgfp, " done.\n");
                fflush(dbgfp);
            }
        }

        sts = sys$crembx(0,       	    /* Temporary mailbox. */
                         &chan_mbx,        /* Channel. */
                         0,                /* Max msg size (default). */
                         0,                /* Msg buf quota (default). */
                         0x00f0,           /* Prot = O:LPWR. */
                         PSL$C_USER,       /* Access mode, */
                         &lnm_mbx_dscr,    /* Logical name. */
                         CMB$M_READONLY,   /* Flags. */
                         0);               /* Reserved. */

        if (dbgfp)
        {
            fprintf(dbgfp,
             "rndvms()  Create process mailbox (%s).  sts = %%x%08x .\n",
             lnm_mbx, sts);
            fflush(dbgfp);
        }

        if ((sts& STS$M_SEVERITY) != STS$K_SUCCESS)
        {
            errno = EVMSERR;
            vaxc$errno = sts;
            return -1;
        }
    }

    if (dbgfp)
    {
        fprintf(dbgfp,
         "rndvms() len = %d, lev = %d.  Bytes avail = %d\n",
         length, level, (g_byte_count- g_byte_used_count));
        fflush(dbgfp);
    }

    /* While more data remain to be supplied, supply them. */
    while (length > 0)
    {
        if (g_byte_count > g_byte_used_count)
        {
            /* Data are available (left-over?).  Use them (first). */
            n = GR_MIN(length, (g_byte_count- g_byte_used_count));

            /* Call the consumer's buffer-stuffer. */
            if (dbgfp)
            {
                fprintf(dbgfp,
                 "rndvms()  Adding %d \"random\" bytes.\n", n);
                fflush(dbgfp);
            }

            memcpy(buffer, &g_buffer[ g_byte_used_count], n);

            g_byte_used_count += n;
            length -= n;
            buffer += n;
        }
        else
        {
            /* Need more data.  Reset byte counts and buffer pointer. */
            g_byte_count = 0;
            g_byte_used_count = 0;
            gbp1 = g_buffer;

            if (fd_mbx > 0)
            {
                /* Mailbox still open.  Re-stock the gather buffer. */
                while ((fd_mbx > 0) && (g_byte_count < G_BUFSIZE))
                {
                    /* Read data while there are more data to read,
                       and space is available in the buffer.
                    */
                    while (((sts = read(fd_mbx,
                     &g_buffer[ g_byte_count],          /* gbp1 */
                     (G_BUFSIZE- g_byte_count))) > 0) &&
                     (G_BUFSIZE- g_byte_count > 0))
                    {
                        gbc_count = sts;
                        /* Strip off the terminal newline character. */
                        if (g_buffer[ g_byte_count+ gbc_count- 1] == '\n')
                        {
                            gbc_count--;
                        }

                        /* Collapse repeated characters to a byte count
                           (mod 256).  gbp1 = dest, gbp2 = source.
                        */
                        gbp2 = gbp1;
                        gbpe = gbp2+ gbc_count;
                        while (gbp2 < gbpe)
                        {
                            gbc = *gbp2;
                            if (gbc != *(gbp2+ 1))
                            {
                                /* Next byte differs.  Use this one. */
                                *(gbp1++) = *(gbp2++);
                            }
                            else
                            {
                                gbc_count = 0;
                                while ((*gbp2 == gbc) && (gbp2 < gbpe))
                                {
                                    gbc_count++;
                                    gbp2++;
                                }
                                *(gbp1++) = gbc_count;
                            }
                        }
                        g_byte_count = gbp1- g_buffer;
                    }
                    /* If the current data source is exhausted,
                       close the mailbox.
                    */
                    if (sts <= 0)
                    {
                        sts = close(fd_mbx);
                        fd_mbx = 0;
                    }
                }
            }
            else
            {
                /* Mailbox closed.  Set the command descriptor to the
                   next command.
                */
                cmd_dscr.dsc$a_pointer = (char *) dataSources[ src_ndx].cmd;
                cmd_dscr.dsc$w_length = strlen(cmd_dscr.dsc$a_pointer);


                /* Run the next command, and open the mailbox. */
                if (dbgfp)
                {
                    fprintf(dbgfp,
                     "rndvms()  Spawning: %.*s\n",
                     cmd_dscr.dsc$w_length, cmd_dscr.dsc$a_pointer);
                    fflush(dbgfp);
                }

                sts = lib$spawn(&cmd_dscr,     /* Command. */
                                &nla0_dscr,    /* SYS$INPUT */
                                &lnm_mbx_dscr, /* SYS$OUTPUT */
                                &spwn_flgs,    /* Flags.  1 = NOWAIT. */
                                0,             /* Process name */
                                &spwn_pid,     /* Process ID */
                                0,             /* Completion status */
                                0,             /* Event flag */
                                0,             /* AST address */
                                0,             /* AST argument */
                                0,             /* Prompt string */
                                0,             /* CLI */
                                0);            /* command table */

                if ((sts& STS$M_SEVERITY) == STS$K_SUCCESS)
                {
                    fd_mbx = open(lnm_mbx, O_RDONLY, 0);
                    if (fd_mbx < 0)
                    {
                        return -1;
                    }
                    src_ndx++;
                    if (dataSources[ src_ndx].cmd == NULL)
                    {
                        /* Command list exhausted.  Start over. */
                        src_ndx = 0;
                    }
                }
                else
                {
                    errno = EVMSERR;
                    vaxc$errno = sts;
                    return -1;
                }
            }
        }
    }
    return 0;
}

/*

=item C<static int vms_get_entropy(char *result, size_t length)>

Call I<rndvms_gather_random()> until the entropy buffer
has size length.

=cut

*/

static int
vms_get_entropy(char *result, size_t length)
{
    char buffer [ 1 << 12 ];
    int  sts, sz, i;

    if (length > sizeof (buffer))
        return -1;

    sts = rndvms_gather_random(buffer, sizeof (buffer) -1, 3);
    if (sts != 0)
        return sts;

    for (sz = sizeof (buffer) >> 1; sz > length; sz >>= 1)
    {
        for (i = 0; i < sz; ++i)
            buffer[i] ^= buffer[sz+i];
    }
    memcpy(result, buffer, length);

    return 0;
}

#ifdef TEST_RNDVMS

#  include <stdlib.h>

/*

=item C<int main(int argc, char **argv, char **envp)>

Compile with /Define=TEST_RNDVMS

=back

=cut

*/

int
main(int argc, char **argv, char **envp)
{
    INTVAL entropy;
    int    sts;

    sts = vms_get_entropy((char *)&entropy, sizeof (INTVAL));
    if (sts != 0)
        return EXIT_FAILURE;

    printf("%o\n", entropy);
    return EXIT_SUCCESS;
}
#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
