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

typedef void (*cmd_func_t)(ARGIN(hbdb_t *hbdb), ARGIN(const char * const cmd));

typedef struct cmd      cmd;
typedef struct cmd_list cmd_list;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void hbdb_command_line(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_hbdb_command_line __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*
 * Type:
 *     cmd
 *
 * Fields:
 *     c_func - points to the function that executes the command
 *     c_help - the help message associated with the command
 * 
 * Overview:
 *     Contains information about the implementation of a particular command.
 */

struct cmd {
    cmd_func_t         c_func;
    const char * const c_help;
};

/*
 * Type:
 *     cmd_list
 *
 * Fields:
 *     cl_name  - command name
 *     cl_short - command name abberviation
 *     cl_cmd   - "cmd" type for storing implementation details
 *
 * Overview:
 *     Contains general information about a particular command.
 */

struct cmd_list {
    const char * const cl_name;
    const char * const cl_short;
    const cmd  * const cl_cmd;        
};

/* Help message displayed for each command */
const char * const cmd_break_help = "Sets a breakpoint at the specified location.\n\n"
                                    "break LOCATION\n\n"
                                    "If LOCATION is an address, breaks at the exact address.";

const char * const cmd_help_help  = "List of commands:\n\n"
                                    "break\n"
                                    "\nType \"help\" followed by a command name.";

/* Entire list of commands */
const cmd_list commands[] = {
    { "break", 'b', { &hbdb_cmd_break, cmd_break_help } },
    { "help",  'h', { &hbdb_cmd_help,  cmd_help_help  } }
};

/*

=item C<void hbdb_cmd_break(hbdb_t *hbdb, const char * const command)>

Sets a breakpoint at a specific location.

=cut

*/

void
hbdb_cmd_break(ARGIN(hbdb_t *hbdb), ARGIN(const char * const command))
{
    ASSERT_ARGS(hbdb_cmd_break)
}

/*

=item C<void hbdb_cmd_help(hbdb_t *hbdb, const char * const command)>

If C<command> is non-NULL, displays help message for C<command>. Otherwise, a
general help message is displayed.

=cut

*/

void
hbdb_cmd_help(ARGIN(hbdb_t *hbdb), ARGIN(const char * const command))
{
    ASSERT_ARGS(hbdb_cmd_help)
}

/*

=back

=head1 GENERAL FUNCTIONS

The remaining functions define some of the general behavior of the debugger.
They do not follow a particular pattern.

=over 4

=cut

*/

/*

=item C<static void hbdb_command_line(PARROT_INTERP)>

Begins the command-line interface. Fetches and executes commands in a
continuous loop.

=cut

*/

static void
hbdb_command_line(PARROT_INTERP)
{
    ASSERT_ARGS(hbdb_command_line)

    const hbdb_t * const hbdb = interp->hbdb;

    while (HBDB_FLAG_TEST(interp, HBDB_STOPPED)) {
        const char *cmd;

        /* Prompt user for command */
        hbdb_get_command(interp);

        /* Get command set by hbdb_get_command() */
        cmd = hbdb->current_command;

        /* STUB */
        printf("%s\n", cmd);
        /* STUB */

        if (cmd == '\0')
            cmd = hbdb->last_command;

        /*hbdb_run_command(interp, cmd);*/
    }
}

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

    hbdb_t *hbdb = interp->hbdb;

    /* TODO Do I need to free these? */
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
    hbdb_command_line(interp);

    /* Check if HBDB_EXIT has been set */
    if (HBDB_FLAG_TEST(interp, HBDB_EXIT)) {
        Parrot_x_exit(interp, 0);
    }
}

/*

=back

=head1 SEE ALSO

F<frontend/hbdb/main.c>, F<include/parrot/hbdb.h>

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

