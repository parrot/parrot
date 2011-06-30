/* Copyright (C) 2001-2011, Parrot Foundation. */

/*

=head1 NAME

src/hbdb.c - The Honey Bee Debugger

=head1 DESCRIPTION

This file contains functions and types used by the C<hbdb> debugger.

=head1 COMMAND FUNCTIONS

Each of the following functions serve as the implementation for a particular
command. They are of the form C<hbdb_cmd_*>. For instance, if you are looking
for the code for the C<break> command, it will be the C<hbdb_cmd_break()>
function.

=over 4

=cut

*/

/* TODO Change hbdb_init() to accept an hbdb_t to avoid assignment after call */

#include <stdio.h>
#include <ctype.h>

#include "parrot/parrot.h"
#include "parrot/hbdb.h"
#include "parrot/embed.h"
#include "parrot/string_funcs.h"
#include "parrot/sub.h"
#include "parrot/pobj.h"
#include "pmc/pmc_parrotinterpreter.h"

/* Size of command-line buffer */
#define HBDB_CMD_BUFFER_LENGTH 128

/* Abstract access to fields in Parrot_Interp */
#define INTERP_ATTR(x) ((Parrot_ParrotInterpreter_attributes *)PMC_data(x))->interp

/* HEADERIZER HFILE: include/parrot/hbdb.h */

typedef void (*hbdb_cmd_func_t)(PARROT_INTERP, ARGIN(const char * const cmd));

typedef struct hbdb_cmd_t       hbdb_cmd_t;
typedef struct hbdb_cmd_table_t hbdb_cmd_table_t;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void command_line(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const hbdb_cmd_t * parse_command(ARGIN_NULLOK(const char **cmd));

PARROT_IGNORABLE_RESULT
static int /*@alt void@*/
run_command(PARROT_INTERP, ARGIN(const char *cmd))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
static const char * skip_whitespace(ARGIN(const char *cmd))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_command_line __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_parse_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_run_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_skip_whitespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cmd))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* Contains information about the implementation of a particular command               */
struct hbdb_cmd_t {
    hbdb_cmd_func_t    function;    /* Points to the function the executes the command */
    const char * const help;        /* Help message associated with the command        */
};

/* Contains general information about a particular command                             */
struct hbdb_cmd_table_t {
    const char       * const name;          /* Command name                            */
    const char       * const short_name;    /* Command name abbreviation               */
    const hbdb_cmd_t * const cmd;           /* Command function and help message       */
};

/* Help message displayed for each command */
const char * const cmd_break_help = "Sets a breakpoint at the specified location.\n\n"
                                    "break LOCATION\n\n"
                                    "If LOCATION is an address, breaks at the exact address.";

/* TODO Do I need this string anymore? */
const char * const cmd_help_help  = "List of commands:\n\n"
                                    "break\n"
                                    "\nType \"help\" followed by a command name.";

/* Global command table */
const hbdb_cmd_table_t command_table[] = {
    { "break", "b", { &hbdb_cmd_break, cmd_break_help } },
    { "help",  "h", { &hbdb_cmd_help,  cmd_help_help  } },
    { "quit",  "q", { &hbdb_cmd_quit,  cmd_quit_help  } }
};

/*

=item C<void hbdb_cmd_break(PARROT_INTERP, const char * const cmd)>

Sets a breakpoint at a specific location.

=cut

*/

void
hbdb_cmd_break(PARROT_INTERP, ARGIN(const char * const cmd))
{
    ASSERT_ARGS(hbdb_cmd_break)

    hbdb_t            *hbdb;
    hbdb_breakpoint_t *bp;
    opcode_t           pos;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Verify that an actual command was passed */
    if (!cmd)
        /* TODO Use an appropriate exception_type_enum */
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Null value passed to hbdb_cmd_break()");

    /* Allocated memory for breakpoint */
    bp = mem_gc_allocate_zeroed_typed(interp, hbdb_breakpoint_t);

    /* Break at line number if debugging file, otherwise at program counter */
    if (hbdb->file && hbdb->file->size) {
        /* Do nothing thanks to IMCC */
    }
    else {
        pos = interp->code->base.data;
    }

    /* TODO Logic for parsing conditionals goes here */

    bp->pc = pos;
    /*bp->line = line->number;*/

    /* Don't skip, yet */
    bp->skip = 0;

    /* STUB */
    printf("Look at me cotto! No hands!\n");
    /* STUB */
}

/*

=item C<void hbdb_cmd_help(PARROT_INTERP, const char * const cmd)>

If C<command> is non-NULL, displays help message for C<command>. Otherwise, a
general help message is displayed.

=cut

*/

void
hbdb_cmd_help(PARROT_INTERP, ARGIN(const char * const cmd))
{
    ASSERT_ARGS(hbdb_cmd_help)

    const hbdb_t           *hbdb;
    const hbdb_cmd_t const *c;
    
    /* Get global structure */
    hbdb = interp->hbdb;

    /* Get command name */
    c = parse_command(&cmd);

    /* Verify that an actual command was passed */
    if (cmd)  {
        if (*cmd == '\0') {
            unsigned int i;

            Parrot_io_printf(hbdb->debugger, "List of commands:\n\n");

            /* Iterate through global command table */
            for (i = 0; i < (sizeof (command_table) / sizeof (hbdb_cmd_table_t)); i++) {
                const hbdb_cmd_table_t * const tbl = command_table + i;

                /* Display name and short message about each command */
                Parrot_io_printf(hbdb->debugger,
                                 "   %-12s  %s\n",
                                 tbl->name,
                                 "foo");
                                 /*tbl->cmd->help);*/
            }

            Parrot_io_printf(hbdb->debugger,
                             "\nType \"help\" followed by a command name for full documentation.\n");
            Parrot_io_printf(hbdb->debugger,
                             "Command name abbreviations are allowed if it's unambiguous.\n");
        }
        else {
            Parrot_io_eprintf(hbdb->debugger, "Undefined command: \"%s\". Try \"help\".\n", cmd);
        }
    }
    else {
        /*Parrot_io_printf(interp, "%s\n", cmd->help);*/
        /*printf("%s\n", c->help);*/
        /*Parrot_io_printf(hbdb->debugger, "%s\n", c->help);*/
    }
}

/*

=item C<void hbdb_cmd_quit(PARROT_INTERP, const char * const cmd)>

Exits HBDB.

=cut

*/

void
hbdb_cmd_quit(PARROT_INTERP, ARGIN(const char * const cmd))
{
    ASSERT_ARGS(hbdb_cmd_quit)

    puts("TEST");

    /*Parrot_x_exit(interp, 0);*/

    exit(0);

    HBDB_FLAG_SET(interp, HBDB_EXIT);
    HBDB_FLAG_CLEAR(interp, HBDB_RUNNING);
}

/*

=back

=head1 GENERAL FUNCTIONS

The following functions define some of the general behavior of the debugger.
Note that they all have the I<hbdb> prefix.

=over 4

=cut

*/

/*

=item C<void hbdb_destroy(PARROT_INTERP)>

Destroys the current instance of the debugger by freeing the memory allocated
for it's interpreter.

=cut

*/

void
hbdb_destroy(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_destroy)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    mem_gc_free(interp, hbdb->last_command);
    mem_gc_free(interp, hbdb->current_command);

    mem_gc_free(interp, hbdb);
    interp->hbdb = NULL;
}

/*

=item C<void hbdb_get_command(PARROT_INTERP)>

Prompts the user to enter a command.

The command entered is stored in C<< interp->hbdb->current_command >>. The
previous command is stored in C<< interp->hbdb->last_command >>.

It also prints the next line that will be executed.

=cut

*/

void
hbdb_get_command(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_get_command)

    char   *cmd;
    hbdb_t *hbdb;

    STRING *input;

    PMC    *stdinput;
    STRING *readline;
    STRING *prompt;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Flush stdout buffer */
    fflush(stdout);

    /* Update last command */
    if (hbdb->current_command != '\0')
        strcpy(hbdb->last_command, hbdb->current_command);

    /* Create FileHandle PMC for stdin */
    stdinput = Parrot_io_stdhandle(interp, STDIN_FILENO, NULL);

    /* Create string constants */
    readline = Parrot_str_new_constant(interp, "readline_interactive");
    prompt   = Parrot_str_new_constant(interp, "(hbdb) ");

    /* Invoke readline_interactive() */
    Parrot_pcc_invoke_method_from_c_args(interp, stdinput, readline, "S->S", prompt, &input);

    /* STUB */
    if (Parrot_io_eof(interp, stdinput)) {
        printf("onoes! das bad!\n");
        Parrot_x_exit(interp, 0);
        exit(0);
    }
    /* STUB */

    /* Store command */
    hbdb->current_command = Parrot_str_to_cstring(interp, input);
}

/*

=item C<void hbdb_init(PARROT_INTERP)>

Performs general initialization operations.

=cut

*/

void
hbdb_init(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_init)

    /* Check that debugger is not already initialized */
    if (!interp->hbdb) {
        hbdb_t        *hbdb;
        Parrot_Interp  debugger;

        /* Allocate memory for debugger  */
        hbdb = mem_gc_allocate_zeroed_typed(interp, hbdb_t);

        /* Create debugger interpreter */
        debugger = Parrot_new(interp);

        /* Assign global "hbdb_t" structures */
        interp->hbdb   = hbdb;
        debugger->hbdb = hbdb;

        /* Assign debugee and debugger interpreters */
        hbdb->debugee  = interp;
        hbdb->debugger = debugger;

        /* Allocate memory for command-line buffers, NUL terminated c strings */
        hbdb->current_command  = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->last_command     = mem_gc_allocate_n_typed(interp, HBDB_CMD_BUFFER_LENGTH + 1, char);
        hbdb->file             = mem_gc_allocate_zeroed_typed(interp, hbdb_file_t);
    }

    /* Set HBDB_RUNNING and HBDB_ENTERED status flags */
    HBDB_FLAG_SET(interp, HBDB_RUNNING);
    HBDB_FLAG_SET(interp, HBDB_ENTERED);
}

/*

=item C<void hbdb_runloop(PARROT_INTERP, int argc, const char *argv[])>

Begins the main runloop by executing the debugee's source code.

=cut

*/

void
hbdb_runloop(PARROT_INTERP, int argc, ARGIN(const char *argv[]))
{
    ASSERT_ARGS(hbdb_runloop)

    /* Main loop */
    do {
        Parrot_runcode(interp, argc, argv);

        HBDB_FLAG_SET(interp, HBDB_STOPPED);
    } while (!(HBDB_FLAG_TEST(interp, HBDB_EXIT)));
}

/*

=item C<void hbdb_start(PARROT_INTERP, opcode_t *pc)>

Starts the "active" process of accepting commands and executing code.

=cut

*/

void
hbdb_start(PARROT_INTERP, ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(hbdb_start)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    /* Check that HBDB has been initialized properly */
    if(!hbdb)
        Parrot_ex_throw_from_c_args(interp,
                                    NULL,
                                    0,
                                    "FATAL ERROR: The debugger has not been initialized!");

    /* Make sure the HBDB_ENTERED flag is not set */
    if (HBDB_FLAG_TEST(interp, HBDB_ENTERED)) {
        HBDB_FLAG_CLEAR(interp, HBDB_ENTERED);
    }

    /* Get the current opcode */
    hbdb->current_opcode = pc;

    /* Set HBDB_STOPPED flag */
    HBDB_FLAG_SET(interp, HBDB_STOPPED);

    /* Start command-line interface */
    command_line(interp);

    /* Check if HBDB_EXIT has been set */
    if (HBDB_FLAG_TEST(interp, HBDB_EXIT)) {
        Parrot_x_exit(interp, 0);
    }
}

/*

=back

=head2 STATIC FUNCTIONS

The remaining functions are all static. As such, they will not appear
anywhere outisde this file. They are identified by their lack of the
I<hbdb> prefix.

=over 4

=cut

*/

/*

=item C<static void command_line(PARROT_INTERP)>

Begins the command-line interface. Fetches and executes commands in a
continuous loop.

=cut

*/

static void
command_line(PARROT_INTERP)
{
    ASSERT_ARGS(command_line)

    /* Get global structure */
    hbdb_t *hbdb = interp->hbdb;

    while (HBDB_FLAG_TEST(interp, HBDB_STOPPED)) {
        const char *cmd;

        /* Prompt user for command */
        hbdb_get_command(interp);

        /* Get command set by hbdb_get_command() */
        cmd = hbdb->current_command;

        if (cmd == '\0')
            cmd = hbdb->last_command;

        /* Execute command */
        run_command(interp, cmd);
    }
}

/*

=item C<static const hbdb_cmd_t * parse_command(const char **cmd)>

Parses the command in C<cmd>. If it contains a valid command, a pointer to its
respective C<hbdb_cmd_t> structure is returned. Otherwise, it returns NULL.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const hbdb_cmd_t *
parse_command(ARGIN_NULLOK(const char **cmd))
{
    ASSERT_ARGS(parse_command)

    /* Check that "cmd" points to something */
    if (cmd && *cmd) {
        const char  *start;
        const char  *next;
        char         c;
        int          found = -1;
        unsigned int hits  =  0,
                     len,
                     i;

        /* Skip whitespace */
        start = skip_whitespace(*cmd);
        next  = start;

        *cmd  = start;

        /* Get command name */
        for (i = 0; (c = *next) != '\0' && !isspace((unsigned char) c); next++)
            continue;

        /* Find the length */
        len = next - start;

        /* Return NULL if there is no command */
        if (len == 0)
            return NULL;

        /* Iterate through global command table */
        for (i = 0; i < (sizeof (command_table) / sizeof (hbdb_cmd_table_t)); i++) {
            const hbdb_cmd_table_t * const tbl = command_table + i;

            /* Check if user entered command's abbreviation */
            if ((len == 1) && (tbl->short_name == (*cmd)[0])) {
                hits  = 1;
                found = i;
                break;
            }

            /* Check if input matches current entry */
            if (strncmp(*cmd, tbl->name, len) == 0) {
                /* Check that input matches length of command's name */
                if (strlen(tbl->name) == len) {
                    hits  = 1;
                    found = i;
                    break;
                }
                else {
                    hits++;
                    found = i;
                }
            }
        }

        /* Check if a match was found */
        if (hits == 1) {
            *cmd = skip_whitespace(next);

            return &(command_table[found].cmd);
        }
    }

    return NULL;
}

/*

=item C<static int run_command(PARROT_INTERP, const char *cmd)>

Executes the command in C<cmd> by calling it's associated C<hbdb_cmd_*>
function.

=cut

*/

PARROT_IGNORABLE_RESULT
static int
run_command(PARROT_INTERP, ARGIN(const char *cmd))
{
    ASSERT_ARGS(run_command)

    const char       *orig_cmd;

    hbdb_t           *hbdb;
    const hbdb_cmd_t *c;

    /* Get global structure */
    hbdb = interp->hbdb;

    /* Preseve original command in case of error */
    orig_cmd = cmd;

    /* Get command's hbdb_cmd_t structure */
    c = parse_command(&orig_cmd);

    /* Check if a match was found */
    if (c) {
        /* Call command's function */
        (*c->function)(interp, orig_cmd);
        return 0;
    }
    else {
        /* Check if nothing was entered at all */
        if (*orig_cmd == '\0') {
            return 0;
        }
        else {
            Parrot_io_eprintf(hbdb->debugger, "Undefined command: \"%s\". Try \"help\".\n", cmd);
            /* TODO Error message if script file */
            return 1;
        }
    }
}

/*

=item C<static const char * skip_whitespace(const char *cmd)>

Returns a pointer to the first non-whitespace character in C<cmd>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_PURE_FUNCTION
static const char *
skip_whitespace(ARGIN(const char *cmd))
{
    ASSERT_ARGS(skip_whitespace)

    while (*cmd && isspace(*cmd))
        cmd++;

    return cmd;
}

/*

=back

=head1 SEE ALSO

F<frontend/hbdb/main.c>, F<src/embed/hbdb.c>, F<include/parrot/hbdb.h>

=head1 HISTORY

The initial version of C<hbdb> was written by Kevin Polulak (soh_cah_toa) as
part of Google Summer of Code 2011.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

